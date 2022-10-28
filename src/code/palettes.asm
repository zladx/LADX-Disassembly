; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Copy object or background palettes to the hardware palette data
CopyPalettesToVRAM::
    ld   a, [wPaletteDataFlags]                   ; $4000: $FA $D1 $DD
    and  a                                        ; $4003: $A7
    ret  z                                        ; $4004: $C8

    bit  7, a                                     ; $4005: $CB $7F
    jr   nz, jr_021_402B                          ; $4007: $20 $22

    and  $01                                      ; $4009: $E6 $01
    jr   z, .jr_4016                              ; $400B: $28 $09

    ld   hl, wBGPal1                              ; $400D: $21 $10 $DC
    ld   de, rBCPS                                ; $4010: $11 $68 $FF
    call func_021_4062                            ; $4013: $CD $62 $40

.jr_4016
    ld   a, [wPaletteDataFlags]                   ; $4016: $FA $D1 $DD
    and  $02                                      ; $4019: $E6 $02
    jr   z, .jr_4026                              ; $401B: $28 $09

    ld   hl, wObjPal1                             ; $401D: $21 $50 $DC
    ld   de, rOCPS                                ; $4020: $11 $6A $FF
    call func_021_4062                            ; $4023: $CD $62 $40

.jr_4026
    xor  a                                        ; $4026: $AF
    ld   [wPaletteDataFlags], a                   ; $4027: $EA $D1 $DD
    ret                                           ; $402A: $C9

jr_021_402B:
    ld   a, $80                                   ; $402B: $3E $80
    ld   hl, wPalettePartialCopyColorIndexStart   ; $402D: $21 $D3 $DD
    ld   e, [hl]                                  ; $4030: $5E
    sla  e                                        ; $4031: $CB $23
    or   e                                        ; $4033: $B3
    ld   b, a                                     ; $4034: $47
    ld   a, [wPaletteDataFlags]                   ; $4035: $FA $D1 $DD
    and  $01                                      ; $4038: $E6 $01
    ld   a, b                                     ; $403A: $78
    jr   z, .jr_4047                              ; $403B: $28 $0A

    ldh  [rBCPS], a                               ; $403D: $E0 $68
    ld   bc, rBGPD                                ; $403F: $01 $69 $FF
    ld   hl, wBGPal1                              ; $4042: $21 $10 $DC
    jr   jr_021_404F                              ; $4045: $18 $08

.jr_4047
    ldh  [rOCPS], a                               ; $4047: $E0 $6A
    ld   bc, rOBPD                                ; $4049: $01 $6B $FF
    ld   hl, wObjPal1                             ; $404C: $21 $50 $DC

jr_021_404F:
    ld   d, $00                                   ; $404F: $16 $00
    add  hl, de                                   ; $4051: $19
    ld   e, c                                     ; $4052: $59
    ld   d, b                                     ; $4053: $50
    ld   a, [wPalettePartialCopyColorCount]       ; $4054: $FA $D4 $DD
    sla  a                                        ; $4057: $CB $27
    ld   b, a                                     ; $4059: $47
    call func_021_4068                            ; $405A: $CD $68 $40
    xor  a                                        ; $405D: $AF
    ld   [wPaletteDataFlags], a                   ; $405E: $EA $D1 $DD
    ret                                           ; $4061: $C9

func_021_4062::
    ld   b, $40                                   ; $4062: $06 $40
    ld   a, $80                                   ; $4064: $3E $80
    ld   [de], a                                  ; $4066: $12
    inc  de                                       ; $4067: $13

func_021_4068::
.loop_4068
    ld   a, [hl+]                                 ; $4068: $2A
    ld   [de], a                                  ; $4069: $12
    dec  b                                        ; $406A: $05
    jr   nz, .loop_4068                           ; $406B: $20 $FB

    ret                                           ; $406D: $C9

LoadPaletteForTilemap::
    ld   a, [wPaletteToLoadForTileMap]            ; $406E: $FA $D2 $DD
    and  a                                        ; $4071: $A7
    ret  z                                        ; $4072: $C8

    bit  7, a                                     ; $4073: $CB $7F
    jp   nz, label_021_425E                       ; $4075: $C2 $5E $42

    ld   hl, Data_021_74F0                        ; $4078: $21 $F0 $74
    ld   b, $00                                   ; $407B: $06 $00
    dec  a                                        ; $407D: $3D
    sla  a                                        ; $407E: $CB $27
    ld   c, a                                     ; $4080: $4F
    add  hl, bc                                   ; $4081: $09
    ld   a, [hl+]                                 ; $4082: $2A
    ld   c, a                                     ; $4083: $4F
    ld   b, [hl]                                  ; $4084: $46
    or   b                                        ; $4085: $B0
    jr   z, jr_021_40AE                           ; $4086: $28 $26

    ld   h, b                                     ; $4088: $60
    ld   l, c                                     ; $4089: $69
    ld   de, wBGPal1                              ; $408A: $11 $10 $DC
    ld   bc, $80                                  ; $408D: $01 $80 $00
    ld   a, [wPaletteUnknownE]                    ; $4090: $FA $D5 $DD
    and  a                                        ; $4093: $A7
    jr   nz, .jr_409F                             ; $4094: $20 $09

    push bc                                       ; $4096: $C5
    push de                                       ; $4097: $D5
    push hl                                       ; $4098: $E5
    call CopyData                                 ; $4099: $CD $14 $29
    pop  hl                                       ; $409C: $E1
    pop  de                                       ; $409D: $D1
    pop  bc                                       ; $409E: $C1

.jr_409F
    ld   a, $02                                   ; $409F: $3E $02
    ldh  [rSVBK], a                               ; $40A1: $E0 $70
    call CopyData                                 ; $40A3: $CD $14 $29
    xor  a                                        ; $40A6: $AF
    ldh  [rSVBK], a                               ; $40A7: $E0 $70
    ld   a, $03                                   ; $40A9: $3E $03
    ld   [wPaletteDataFlags], a                   ; $40AB: $EA $D1 $DD

jr_021_40AE:
    xor  a                                        ; $40AE: $AF
    ld   [wPaletteToLoadForTileMap], a            ; $40AF: $EA $D2 $DD
    ret                                           ; $40B2: $C9

LoadRoomPalettes::
    call func_021_5185                            ; $40B3: $CD $85 $51
    ld   a, [wPaletteDataFlags]                   ; $40B6: $FA $D1 $DD
    ld   b, a                                     ; $40B9: $47
    ld   a, [wPaletteToLoadForTileMap]            ; $40BA: $FA $D2 $DD
    or   b                                        ; $40BD: $B0
    ret  nz                                       ; $40BE: $C0

    call func_021_5318                            ; $40BF: $CD $18 $53
    ld   a, [wDDD6]                               ; $40C2: $FA $D6 $DD
    and  a                                        ; $40C5: $A7
    ret  nz                                       ; $40C6: $C0

    ld   a, [wGameplaySubtype]                    ; $40C7: $FA $96 $DB
    cp   $07                                      ; $40CA: $FE $07
    jr   z, .jr_40D3                              ; $40CC: $28 $05

    ld   a, $01                                   ; $40CE: $3E $01
    ld   [wPaletteUnknownE], a                    ; $40D0: $EA $D5 $DD

.jr_40D3
    call func_021_40DB                            ; $40D3: $CD $DB $40
    xor  a                                        ; $40D6: $AF
    ld   [wPaletteUnknownE], a                    ; $40D7: $EA $D5 $DD
    ret                                           ; $40DA: $C9

func_021_40DB::
    ld   a, [wIsIndoor]                           ; $40DB: $FA $A5 $DB
    and  a                                        ; $40DE: $A7
    jr   nz, .jr_411A                             ; $40DF: $20 $39

    ldh  a, [hMapRoom]                            ; $40E1: $F0 $F6
    ld   c, a                                     ; $40E3: $4F
    ld   b, $00                                   ; $40E4: $06 $00
    ld   hl, OverworldPaletteMap                  ; $40E6: $21 $EF $42
    add  hl, bc                                   ; $40E9: $09
    ld   a, [hl]                                  ; $40EA: $7E
    sla  a                                        ; $40EB: $CB $27
    ld   c, a                                     ; $40ED: $4F
    ld   hl, OverworldPalettes                    ; $40EE: $21 $B1 $42
    add  hl, bc                                   ; $40F1: $09
    ld   a, [hl+]                                 ; $40F2: $2A
    ld   b, [hl]                                  ; $40F3: $46
    ld   h, b                                     ; $40F4: $60
    ld   l, a                                     ; $40F5: $6F
    call func_021_41B4                            ; $40F6: $CD $B4 $41
    ldh  a, [hMapRoom]                            ; $40F9: $F0 $F6
    cp   UNKNOWN_ROOM_92                          ; $40FB: $FE $92
    ret  nz                                       ; $40FD: $C0

    ld   hl, wObjPal8 + 1*2                       ; $40FE: $21 $8A $DC
    ld   a, [Data_021_56C8 + 6]                   ; $4101: $FA $CE $56
    ld   [hl+], a                                 ; $4104: $22
    ld   a, [Data_021_56C8 + 7]                   ; $4105: $FA $CF $56
    ld   [hl+], a                                 ; $4108: $22
    ld   a, [Data_021_56C8 + 2]                   ; $4109: $FA $CA $56
    ld   [hl+], a                                 ; $410C: $22
    ld   a, [Data_021_56C8 + 3]                   ; $410D: $FA $CB $56
    ld   [hl+], a                                 ; $4110: $22
    ld   a, [Data_021_56C8]                       ; $4111: $FA $C8 $56
    ld   [hl+], a                                 ; $4114: $22
    ld   a, [Data_021_56C8 + 1]                   ; $4115: $FA $C9 $56
    ld   [hl], a                                  ; $4118: $77
    ret                                           ; $4119: $C9

.jr_411A
    ld   a, [wRoomTransitionDirection]            ; $411A: $FA $25 $C1
    cp   $04                                      ; $411D: $FE $04
    ret  nz                                       ; $411F: $C0

    ldh  a, [hMapId]                              ; $4120: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $4122: $FE $FF
    jr   nz, .jr_412C                             ; $4124: $20 $06

    ld   hl, Data_021_67D0                        ; $4126: $21 $D0 $67
    jp   label_021_41B4                           ; $4129: $C3 $B4 $41

.jr_412C
    cp   $0A                                      ; $412C: $FE $0A
    jr   nc, jr_021_416C                          ; $412E: $30 $3C

    sla  a                                        ; $4130: $CB $27
    ld   e, a                                     ; $4132: $5F
    ld   d, $00                                   ; $4133: $16 $00
    ld   hl, DungeonPalettesA                     ; $4135: $21 $EF $43
    ldh  a, [hIsSideScrolling]                    ; $4138: $F0 $F9
    and  a                                        ; $413A: $A7
    jr   z, jr_021_4165                           ; $413B: $28 $28

    ldh  a, [hMapId]                              ; $413D: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $413F: $FE $07
    jr   nz, jr_021_4162                          ; $4141: $20 $1F

    ldh  a, [hMapRoom]                            ; $4143: $F0 $F6
    cp   UNKNOWN_ROOM_64                          ; $4145: $FE $64
    jr   z, .jr_415D                              ; $4147: $28 $14
    cp   UNKNOWN_ROOM_65                          ; $4149: $FE $65
    jr   z, .jr_415D                              ; $414B: $28 $10
    cp   UNKNOWN_ROOM_66                          ; $414D: $FE $66
    jr   z, .jr_415D                              ; $414F: $28 $0C
    cp   UNKNOWN_ROOM_67                          ; $4151: $FE $67
    jr   z, .jr_415D                              ; $4153: $28 $08
    cp   UNKNOWN_ROOM_6A                          ; $4155: $FE $6A
    jr   z, .jr_415D                              ; $4157: $28 $04
    cp   UNKNOWN_ROOM_6B                          ; $4159: $FE $6B
    jr   nz, jr_021_4162                          ; $415B: $20 $05

.jr_415D
    ld   hl, Data_021_6750                        ; $415D: $21 $50 $67
    jr   jr_021_416A                              ; $4160: $18 $08

jr_021_4162:
    ld   hl, DungeonPalettesB                     ; $4162: $21 $01 $44

jr_021_4165:
    add  hl, de                                   ; $4165: $19
    ld   a, [hl+]                                 ; $4166: $2A
    ld   b, [hl]                                  ; $4167: $46
    ld   h, b                                     ; $4168: $60
    ld   l, a                                     ; $4169: $6F

jr_021_416A:
    jr   jr_021_41B4                              ; $416A: $18 $48

jr_021_416C:
    cp   $10                                      ; $416C: $FE $10
    jr   nz, jr_021_4191                          ; $416E: $20 $21

    ldh  a, [hMapRoom]                            ; $4170: $F0 $F6
    cp   ROOM_INDOOR_B_MARIN_HOUSE                ; $4172: $FE $A3
    jr   nz, jr_021_4191                          ; $4174: $20 $1B

    ld   a, [wDB48]                               ; $4176: $FA $48 $DB
    cp   $01                                      ; $4179: $FE $01
    jr   z, .jr_418C                              ; $417B: $28 $0F

    cp   $02                                      ; $417D: $FE $02
    jr   z, .jr_418C                              ; $417F: $28 $0B

    ld   a, [wShieldLevel]                        ; $4181: $FA $44 $DB
    and  a                                        ; $4184: $A7
    jr   nz, jr_021_4191                          ; $4185: $20 $0A

    ld   hl, Data_021_73B0                        ; $4187: $21 $B0 $73
    jr   jr_021_41B4                              ; $418A: $18 $28

.jr_418C
    ld   hl, Data_021_74A0                        ; $418C: $21 $A0 $74
    jr   jr_021_41B4                              ; $418F: $18 $23

jr_021_4191:
    ldh  a, [hMapId]                              ; $4191: $F0 $F7
    sub  $0A                                      ; $4193: $D6 $0A
    sla  a                                        ; $4195: $CB $27
    ld   e, a                                     ; $4197: $5F
    ld   d, $00                                   ; $4198: $16 $00
    ld   hl, IndoorPaletteMaps                    ; $419A: $21 $13 $44
    add  hl, de                                   ; $419D: $19
    ld   a, [hl+]                                 ; $419E: $2A
    ld   b, [hl]                                  ; $419F: $46
    ld   h, b                                     ; $41A0: $60
    ld   l, a                                     ; $41A1: $6F
    ldh  a, [hMapRoom]                            ; $41A2: $F0 $F6
    ld   e, a                                     ; $41A4: $5F
    ld   d, $00                                   ; $41A5: $16 $00
    add  hl, de                                   ; $41A7: $19
    ld   a, [hl]                                  ; $41A8: $7E
    sla  a                                        ; $41A9: $CB $27
    ld   e, a                                     ; $41AB: $5F
    ld   hl, InteriorPalettes                     ; $41AC: $21 $3F $44
    add  hl, de                                   ; $41AF: $19
    ld   a, [hl+]                                 ; $41B0: $2A
    ld   b, [hl]                                  ; $41B1: $46
    ld   h, b                                     ; $41B2: $60
    ld   l, a                                     ; $41B3: $6F

func_021_41B4::
label_021_41B4:
jr_021_41B4:
    ld   a, [wPaletteUnknownE]                    ; $41B4: $FA $D5 $DD
    and  a                                        ; $41B7: $A7
    jr   nz, .jr_41D6                             ; $41B8: $20 $1C

    push hl                                       ; $41BA: $E5
    ld   bc, $40                                  ; $41BB: $01 $40 $00
    ld   de, wBGPal1                              ; $41BE: $11 $10 $DC
    call CopyData                                 ; $41C1: $CD $14 $29
    push hl                                       ; $41C4: $E5
    ld   hl, ObjectPalettes                       ; $41C5: $21 $18 $55
    ld   bc, $30                                  ; $41C8: $01 $30 $00
    call CopyData                                 ; $41CB: $CD $14 $29
    pop  hl                                       ; $41CE: $E1
    ld   bc, $10                                  ; $41CF: $01 $10 $00
    call CopyData                                 ; $41D2: $CD $14 $29
    pop  hl                                       ; $41D5: $E1

.jr_41D6
    ld   bc, $40                                  ; $41D6: $01 $40 $00
    ld   de, wBGPal1                              ; $41D9: $11 $10 $DC
    ld   a, $02                                   ; $41DC: $3E $02
    ldh  [rSVBK], a                               ; $41DE: $E0 $70
    call CopyData                                 ; $41E0: $CD $14 $29
    push hl                                       ; $41E3: $E5
    ld   hl, ObjectPalettes                       ; $41E4: $21 $18 $55
    ld   bc, $30                                  ; $41E7: $01 $30 $00
    call CopyData                                 ; $41EA: $CD $14 $29
    pop  hl                                       ; $41ED: $E1
    ld   bc, $10                                  ; $41EE: $01 $10 $00
    call CopyData                                 ; $41F1: $CD $14 $29
    xor  a                                        ; $41F4: $AF
    ldh  [rSVBK], a                               ; $41F5: $E0 $70
    ld   a, [wIsIndoor]                           ; $41F7: $FA $A5 $DB
    and  a                                        ; $41FA: $A7
    jr   nz, jr_021_4222                          ; $41FB: $20 $25

    ldh  a, [hMapRoom]                            ; $41FD: $F0 $F6
    cp   ROOM_OW_EAGLE_TOWER                      ; $41FF: $FE $0E
    jr   nz, jr_021_4254                          ; $4201: $20 $51

    ld   hl, Data_021_5548                        ; $4203: $21 $48 $55
    ld   de, wObjPal6                             ; $4206: $11 $78 $DC
    ld   c, $08                                   ; $4209: $0E $08

jr_021_420B:
    ld   a, [wPaletteUnknownE]                    ; $420B: $FA $D5 $DD
    and  a                                        ; $420E: $A7
    jr   nz, .jr_4213                             ; $420F: $20 $02

    ld   a, [hl]                                  ; $4211: $7E
    ld   [de], a                                  ; $4212: $12

.jr_4213
    ld   a, $02                                   ; $4213: $3E $02
    ldh  [rSVBK], a                               ; $4215: $E0 $70
    ld   a, [hl+]                                 ; $4217: $2A
    ld   [de], a                                  ; $4218: $12
    inc  de                                       ; $4219: $13
    xor  a                                        ; $421A: $AF
    ldh  [rSVBK], a                               ; $421B: $E0 $70
    dec  c                                        ; $421D: $0D
    jr   nz, jr_021_420B                          ; $421E: $20 $EB

    jr   jr_021_4254                              ; $4220: $18 $32

jr_021_4222:
    ldh  a, [hMapRoom]                            ; $4222: $F0 $F6
    cp   UNKNOWN_ROOM_AA                          ; $4224: $FE $AA
    jr   nz, jr_021_4254                          ; $4226: $20 $2C

    ld   a, [wTunicType]                          ; $4228: $FA $0F $DC
    and  a                                        ; $422B: $A7
    jr   z, jr_021_4254                           ; $422C: $28 $26

    ld   hl, RedTunicPalette + 4                  ; $422E: $21 $2C $55
    cp   $01                                      ; $4231: $FE $01
    jr   z, .jr_4238                              ; $4233: $28 $03

    ld   hl, BlueTunicPalette + 4                 ; $4235: $21 $34 $55

.jr_4238
    ld   c, $02                                   ; $4238: $0E $02
    ld   de, wObjPal8 + 2*2                       ; $423A: $11 $8C $DC

jr_021_423D:
    ld   a, [wPaletteUnknownE]                    ; $423D: $FA $D5 $DD
    and  a                                        ; $4240: $A7
    jr   nz, .jr_4247                             ; $4241: $20 $04

    ld   a, [hl]                                  ; $4243: $7E
    ld   [wObjPal8 + 2*2], a                      ; $4244: $EA $8C $DC

.jr_4247
    ld   a, $02                                   ; $4247: $3E $02
    ldh  [rSVBK], a                               ; $4249: $E0 $70
    ld   a, [hl+]                                 ; $424B: $2A
    ld   [de], a                                  ; $424C: $12
    inc  de                                       ; $424D: $13
    xor  a                                        ; $424E: $AF
    ldh  [rSVBK], a                               ; $424F: $E0 $70
    dec  c                                        ; $4251: $0D
    jr   nz, jr_021_423D                          ; $4252: $20 $E9

jr_021_4254:
    ld   a, $03                                   ; $4254: $3E $03
    ld   [wPaletteDataFlags], a                   ; $4256: $EA $D1 $DD
    xor  a                                        ; $4259: $AF
    ld   [wPaletteToLoadForTileMap], a            ; $425A: $EA $D2 $DD
    ret                                           ; $425D: $C9

label_021_425E:
    ld   a, $01                                   ; $425E: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4260: $EA $D1 $DD
    ld   hl, TilemapPaletteTable                  ; $4263: $21 $F6 $51
    ld   a, [wPaletteToLoadForTileMap]            ; $4266: $FA $D2 $DD
    and  $3F                                      ; $4269: $E6 $3F
    sla  a                                        ; $426B: $CB $27
    ld   c, a                                     ; $426D: $4F
    ld   b, $00                                   ; $426E: $06 $00
    add  hl, bc                                   ; $4270: $09
    ld   a, [hl+]                                 ; $4271: $2A
    ld   b, [hl]                                  ; $4272: $46
    ld   h, b                                     ; $4273: $60
    ld   l, a                                     ; $4274: $6F
    ld   de, wBGPal1                              ; $4275: $11 $10 $DC
    ld   bc, $40                                  ; $4278: $01 $40 $00
    ld   a, [wGameplayType]                       ; $427B: $FA $95 $DB
    cp   $01                                      ; $427E: $FE $01
    jr   z, jr_021_429D                           ; $4280: $28 $1B

    ld   a, [wPaletteToLoadForTileMap]            ; $4282: $FA $D2 $DD
    bit  6, a                                     ; $4285: $CB $77
    jr   z, .jr_4295                              ; $4287: $28 $0C

    add  hl, bc                                   ; $4289: $09
    ld   bc, $10                                  ; $428A: $01 $10 $00
    ld   de, wObjPal7                             ; $428D: $11 $80 $DC
    ld   a, $02                                   ; $4290: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4292: $EA $D1 $DD

.jr_4295
    call CopyData                                 ; $4295: $CD $14 $29
    xor  a                                        ; $4298: $AF
    ld   [wPaletteToLoadForTileMap], a            ; $4299: $EA $D2 $DD
    ret                                           ; $429C: $C9

jr_021_429D:
    ld   a, $02                                   ; $429D: $3E $02
    ldh  [rSVBK], a                               ; $429F: $E0 $70
    call CopyData                                 ; $42A1: $CD $14 $29
    xor  a                                        ; $42A4: $AF
    ldh  [rSVBK], a                               ; $42A5: $E0 $70
    ld   a, $01                                   ; $42A7: $3E $01
    ld   [wPaletteDataFlags], a                   ; $42A9: $EA $D1 $DD
    xor  a                                        ; $42AC: $AF
    ld   [wPaletteToLoadForTileMap], a            ; $42AD: $EA $D2 $DD
    ret                                           ; $42B0: $C9



OverworldPalettes::
    dw   OverworldPalette00; Mysterious Forest
    dw   OverworldPalette01; Toronbo Shores
    dw   OverworldPalette02; South of the Village (ext: L1 Tail Cave)
    dw   OverworldPalette03; Mabe Village, South of the Village
    dw   OverworldPalette04; Signpost Maze, Pothole Field, Ukuku Prairie (ext: L3 Key Cavern, Richard's Villa)
    dw   OverworldPalette05; Ukuku Prairie (beehive, skull rock)
    dw   OverworldPalette06; Kanalet Castle
    dw   OverworldPalette07; Tabahl Wasteland, Cemetary, Koholint Prairie (ext: Camera Shop, Crazy Tracy, Witch's Hut)
    dw   OverworldPalette08; Tal Tal Heights (ext: Raft Shop, pit south of the Ghost's gravestone)
    dw   OverworldPalette09; Martha's Bay, Ukuku Prairie (ext: L5 Catfish's Maw, House by the Bay)
    dw   OverworldPalette0A; Ukuku Prairie (ext: Seashell Mansion)
    dw   OverworldPalette0B; Face Shrine
    dw   OverworldPalette0C; Animal Village, East of the Bay
    dw   OverworldPalette0D; Yarna Desert, East of the Bay
    dw   OverworldPalette0E; Goponga Swamp (ext: L2 Bottle Grotto)
    dw   OverworldPalette0F; Tal Tal Mountain Range
    dw   OverworldPalette10; Goponga Swamp West
    dw   OverworldPalette11; Rapids Ride, Tal Tal Heights
    dw   OverworldPalette12; Face Shrine South
    dw   OverworldPalette13; Mt. Tamaranch (ext: Wind Fish's Egg)
    dw   OverworldPalette14; Mt. Tamaranch, Tal Tal Mountain Range (bridge west)
    dw   OverworldPalette15; Tal Tal Mountain Range (ext: Hen House)
    dw   OverworldPalette16; Tal Tal Mountain Range (ext: L7 Eagle's Tower)
    dw   OverworldPalette17; Tal Tal Heights (ext: L4 Angler's Tunner)
; these appear out of order
    dw   OverworldPalette18; Toronbo Shores (ext: Sale's House o' Bananas)
    dw   OverworldPalette19; Tal Tal Mountain Range (ext: L8 Turtle Rock)
    dw   OverworldPalette1A; Kanalet Castle (Kiki's bridge)
    dw   OverworldPalette1B; Animal Village (ext: Christine's house)
    dw   OverworldPalette1C; Martha's Bay (North of L3 Key Cavern)
    dw   OverworldPalette1D; Face Shrine North (ext: L6 Face Shrine)
    dw   OverworldPalette1E; Mabe Village (ext: Ulrira's House)

; Which palettes set is used for which room.
; Array indexed by hMapRoom
OverworldPaletteMap::
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $0F, $0F, $0F, $0F, $0F, $0F, $13, $14, $14, $15, $15, $15, $15, $15, $16, $16; 0
    db   $19, $19, $0F, $0F, $0F, $0F, $13, $14, $15, $15, $15, $15, $15, $15, $16, $16; 1
    db   $07, $10, $0E, $0E, $0E, $0E, $0E, $08, $08, $08, $08, $17, $11, $11, $08, $08; 2
    db   $03, $0E, $0E, $0E, $0E, $0E, $07, $07, $06, $08, $08, $08, $11, $11, $08, $08; 3
    db   $00, $00, $00, $00, $07, $07, $07, $07, $06, $06, $06, $06, $11, $11, $11, $11; 4
    db   $00, $00, $00, $00, $07, $07, $07, $07, $06, $06, $06, $06, $11, $11, $11, $11; 5
    db   $00, $00, $00, $00, $07, $07, $07, $07, $06, $06, $06, $06, $11, $11, $11, $11; 6
    db   $00, $00, $00, $00, $08, $08, $07, $07, $06, $06, $06, $1A, $11, $11, $11, $11; 7
    db   $00, $03, $03, $03, $03, $08, $05, $05, $09, $06, $0A, $0A, $1D, $1D, $0B, $11; 8
    db   $03, $03, $03, $03, $04, $04, $05, $05, $09, $09, $0A, $0A, $1D, $1D, $0B, $0B; 9
    db   $03, $03, $03, $03, $04, $04, $04, $04, $09, $09, $09, $09, $12, $12, $12, $12; a
    db   $03, $1E, $03, $03, $04, $04, $04, $04, $09, $09, $09, $09, $12, $12, $12, $12; b
    db   $03, $03, $02, $02, $04, $04, $04, $04, $09, $1C, $09, $09, $0B, $1B, $0C, $0C; c
    db   $03, $03, $02, $02, $04, $04, $04, $04, $09, $09, $09, $09, $0B, $0B, $0C, $0C; d
    db   $01, $01, $01, $18, $18, $01, $09, $09, $09, $09, $09, $09, $0B, $0B, $0D, $0D; e
    db   $01, $01, $01, $01, $01, $01, $09, $09, $09, $09, $09, $09, $0B, $0D, $0D, $0D; f



; interior data

; Array indexed by hMapId
DungeonPalettesA:: ; might be Nightmare palettes?
                                 ; hMapId
    dw   TailCavePaletteA        ; $00 TAIL_CAVE            ; indoors A
    dw   BottleGrottoPaletteA    ; $01 BOTTLE_GROTTO
    dw   KeyCavernPaletteA       ; $02 KEY_CAVERN
    dw   AnglersTunnelPaletteA   ; $03 ANGLERS_TUNNEL
    dw   CatfishsMawPaletteA     ; $04 CATFISHS_MAW
    dw   FaceShrinePaletteA      ; $05 FACE_SHRINE
    dw   EaglesTowerPaletteB     ; $06 EAGLES_TOWER
    dw   TurtleRockPaletteA      ; $07 TURTLE_ROCK
    dw   WindFishsEggPalette     ; $08 WINDFISHS_EGG

; Array indexed by hMapId
DungeonPalettesB::
    dw   TailCavePaletteB        ; $00 TAIL_CAVE
    dw   BottleGrottoPaletteB    ; $01 BOTTLE_GROTTO
    dw   KeyCavernPaletteB       ; $02 KEY_CAVERN
    dw   AnglersTunnelPaletteB   ; $03 ANGLERS_TUNNEL
    dw   CatfishsMawPaletteB     ; $04 CATFISHS_MAW
    dw   FaceShrinePaletteB      ; $05 FACE_SHRINE
    dw   EaglesTowerPaletteA     ; $06 EAGLES_TOWER
    dw   TurtleRockPaletteB      ; $07 TURTLE_ROCK
    dw   WindFishsEggPalette     ; $08 WINDFISHS_EGG

; Array indexed by (hMapId - $0A)
IndoorPaletteMaps:: ; maps of palette indices
    dw   CaveBPaletteMap         ; $0A MAP_CAVE_B           ; indoors B
    dw   $0000                   ; $0B MAP_DUNGEON_G1
    dw   $0000                   ; $0C MAP_EAGLES_TOWER_ALT
    dw   $0000                   ; $0D MAP_DUNGEON_G3
    dw   ShopPaletteMap          ; $0E MAP_SHOP
    dw   MinigamePaletteMap      ; $0F MAP_MINIGAME
    dw   HousePaletteMap         ; $10 MAP_HOUSE
    dw   CaveCPaletteMap         ; $11 MAP_CAVE_C
    dw   DoghousePaletteMap      ; $12 MAP_DOGHOUSE
    dw   DreamShrinePaletteMap   ; $13 MAP_DREAM_SHRINE
    dw   KanaletPaletteMap       ; $14 MAP_KANALET
    dw   BowWowHideoutPaletteMap ; $15 MAP_BOWWOW_HIDEOUT
    dw   SFaceShrinePaletteMap   ; $16 MAP_S_FACE_SHRINE
    dw   $0000                   ; $17 MAP_UNKNOWN_17
    dw   $0000                   ; $18 MAP_UNKNOWN_18
    dw   $0000                   ; $19 MAP_UNKNOWN_19
    dw   $0000                   ; $1A MAP_UNKNOWN_1A       ; indoors A
    dw   $0000                   ; $1B MAP_UNKNOWN_1B
    dw   $0000                   ; $1C MAP_UNKNOWN_1C
    dw   LibraryPaletteMap       ; $1D MAP_LIBRARY
    dw   GhostHousePaletteMap    ; $1E MAP_GHOST_HOUSE
    dw   CaveWaterPaletteMap     ; $1F MAP_CAVE_WATER

; Pointers to interior palette data, indexed by an index retrieved from IndoorPaletteMaps
; the comments come from searching for each index in the maps, and seeing which rooms are there; I didn't look for 00 and 01
InteriorPalettes::
    dw   InteriorPalette00
    dw   InteriorPalette01
    dw   InteriorPalette02 ; cave in Mysterious Woods, cave at indoor_b $B6 $B7, something at $C5, something at $B3 B4
    dw   InteriorPalette03 ; unused
    dw   InteriorPalette04 ; Great Fairy $AC
    dw   InteriorPalette05 ; Moblin hideout
    dw   InteriorPalette06 ; House by the Bay, Richard's Villa, Marin and Tarin's House
    dw   InteriorPalette07 ; bunny quadruplets...?
    dw   InteriorPalette08 ; Tool Shop
    dw   InteriorPalette09 ; Trendy Game
    dw   InteriorPalette0A ; Library, every telephone booth, Trendy Game operator's house at B0?
    dw   InteriorPalette0B ; Ulrira's House
    dw   InteriorPalette0C ; Madam MeowMeow
    dw   InteriorPalette0D ; Hen House, Mr. Write, Zora's house I think
    dw   InteriorPalette0E ; Crazy Tracy
    dw   InteriorPalette0F ; Witch's Hut
    dw   InteriorPalette10 ; Schule
    dw   InteriorPalette11 ; bear chef
    dw   InteriorPalette12 ; quadruplets house
    dw   InteriorPalette13 ; ribbon dog
    dw   InteriorPalette14 ; Sale's House o' Bananas
    dw   InteriorPalette15 ; Christine's house
    dw   InteriorPalette16 ; Kanalet
    dw   InteriorPalette17 ; Kanalet sidescrolling
    dw   InteriorPalette18 ; Dream Shrine bedside
    dw   InteriorPalette19 ; Seashell Mansion
    dw   FaceShrinePaletteA; Face Shrine, both dungeon and shrine
    dw   InteriorPalette1B ; Camera Shop
    dw   InteriorPalette1C ; Fisherman under the bridge
    dw   InteriorPalette1D ; Pegasus Boots cave at indoor_b $E4, $F4
    dw   InteriorPalette1E ; magnifying glass cave
    dw   InteriorPalette1F ; the guy who expands your bags
    dw   InteriorPalette20 ; Dream Shrine dreamworld
    dw   InteriorPalette21 ; Manbo
    dw   InteriorPalette22 ; Great Fairy $FB

CaveBPaletteMap:: ;0A MAP_CAVE_B
    ; magnifying glass cave, Manbo, cave in Mysterious Woods, 
    ; cave at indoor_b $B6 $B7, something at $C5, something at $B3 B4
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $1E, $1E, $00, $01, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $02, $02, $01, $02, $02, $01, $01, $01, $01, $01, $02, $00, $00; b
    db   $00, $00, $00, $00, $00, $02, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01; e
    db   $04, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $21, $01, $00; f

ShopPaletteMap:: ;0E MAP_SHOP
    ; Witch's Hut, Crazy Tracy, Tool Shop
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $08, $0F, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $0E, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00; f

MinigamePaletteMap:: ;0F MAP_MINIGAME
    ; Fisherman under the bridge, Trendy Game
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $09, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $1C, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00; f

HousePaletteMap:: ;10 MAP_HOUSE
    ; Camera Shop, Seashell Mansion, Christine, Sale's House o' Bananas, quadruplets house, 
    ; bear chef, Schule, Hen House, Mr. Write, Zora's house I think, Madam MeowMeow,
    ; every telephone booth, Trendy Game operator's house at B0?, bunny quadruplets...?
    ; Richard's Villa, Marin and Tarin's House, Ulrira's House
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $0A, $00, $0A, $0A, $0A, $00, $0D; 9
    db   $00, $00, $00, $06, $01, $12, $12, $0C, $0D, $0B, $00, $02, $02, $00, $01, $01; a
    db   $0A, $00, $13, $01, $0A, $1B, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $06, $01, $01, $01, $0A, $0A, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $11, $01, $15, $0D, $07, $07, $10, $01, $01; d
    db   $03, $03, $04, $0A, $01, $01, $01, $01, $00, $19, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $14, $00; f

CaveCPaletteMap:: ;11 MAP_CAVE_C
    ; Great Fairy $FB
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $22, $01, $01, $01, $00; f

DoghousePaletteMap:: ;12 MAP_DOGHOUSE
    ; ribbon dog
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $13, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00; f

DreamShrinePaletteMap:: ;13 MAP_DREAM_SHRINE
    ; Dream Shrine dreamworld, Dream Shrine bedside
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 7
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 8
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18, $00, $00, $00, $00, $00; a
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20; c
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; d
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; e
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; f

KanaletPaletteMap:: ;14 MAP_KANALET
    ; Kanalet interior
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 7
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 8
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; a
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; b
    db   $00, $00, $16, $16, $00, $16, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00; c
    db   $00, $00, $16, $16, $00, $16, $16, $00, $00, $00, $00, $00, $00, $00, $00, $00; d
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; e
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; f

BowWowHideoutPaletteMap:: ;15 MAP_BOWWOW_HIDEOUT
    ; Moblin hideout
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $05, $05, $05, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $05, $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00; f

SFaceShrinePaletteMap:: ;16 MAP_S_FACE_SHRINE
    ; Face Shrine
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1A; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1A; 7
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1A; 8
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; a
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; c
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; d
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; e
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; f

LibraryPaletteMap:: ;1D MAP_LIBRARY
    ; Library
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $00, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $0A, $01, $01, $01, $01, $00; f

GhostHousePaletteMap:: ;1E MAP_GHOST_HOUSE
    ; House by the Bay
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $02, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $03, $03, $04, $06, $01, $01, $01, $01, $00, $01, $01, $00, $01, $01, $01, $01; e
    db   $04, $01, $01, $00, $01, $01, $01, $01, $01, $01, $0A, $01, $01, $01, $01, $00; f

CaveWaterPaletteMap:: ;1F MAP_CAVE_WATER
    ; Pegasus Boots cave at indoor_b $E4 $F4, Kanalet sidescrolling, Great Fairy $AC,
    ; the guy who expands your bags
     ;    0    1    2    3    4    5    6    7    8    9    a    b    c    d    e    f
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 0
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 1
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 2
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 3
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 5
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00; 6
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00; 7
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00; 8
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00; 9
    db   $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $02, $04, $00, $01, $01; a
    db   $00, $00, $00, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00; b
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $01, $00, $00; c
    db   $01, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $01, $01; d
    db   $1F, $1F, $1F, $00, $01, $01, $01, $01, $01, $01, $01, $17, $17, $01, $01, $01; e
    db   $04, $01, $01, $04, $1D, $01, $01, $01, $01, $01, $00, $04, $01, $01, $01, $00; f



func_021_5185::
    ld   a, [wIsIndoor]                           ; $5185: $FA $A5 $DB
    and  a                                        ; $5188: $A7
    jr   z, jr_021_51D6                           ; $5189: $28 $4B

    ld   b, $2D                                   ; $518B: $06 $2D
    ld   hl, IndoorSpritePaletteIndexData         ; $518D: $21 $3A $52

jr_021_5190:
    ldh  a, [hMapId]                              ; $5190: $F0 $F7
    ld   e, a                                     ; $5192: $5F
    ld   a, [hl+]                                 ; $5193: $2A
    cp   e                                        ; $5194: $BB
    jr   nz, .jr_51CF                             ; $5195: $20 $38

    ldh  a, [hMapRoom]                            ; $5197: $F0 $F6
    ld   e, a                                     ; $5199: $5F
    ld   a, [hl+]                                 ; $519A: $2A
    cp   e                                        ; $519B: $BB
    jr   nz, jr_021_51D0                          ; $519C: $20 $32

    ld   a, [wRoomTransitionDirection]            ; $519E: $FA $25 $C1
    ld   e, a                                     ; $51A1: $5F
    ld   a, [hl+]                                 ; $51A2: $2A
    cp   e                                        ; $51A3: $BB
    jr   nz, jr_021_51D1                          ; $51A4: $20 $2B

    ld   a, [hl+]                                 ; $51A6: $2A
    ld   [wPaletteToLoadForTileMap], a            ; $51A7: $EA $D2 $DD
    ld   a, e                                     ; $51AA: $7B
    cp   $04                                      ; $51AB: $FE $04
    jr   nz, ret_021_51D5                         ; $51AD: $20 $26

    ld   a, $01                                   ; $51AF: $3E $01
    ld   [wPaletteUnknownE], a                    ; $51B1: $EA $D5 $DD
    ld   hl, TilemapPaletteTable                  ; $51B4: $21 $F6 $51
    ld   a, [wPaletteToLoadForTileMap]            ; $51B7: $FA $D2 $DD
    and  $3F                                      ; $51BA: $E6 $3F
    sla  a                                        ; $51BC: $CB $27
    ld   e, a                                     ; $51BE: $5F
    ld   d, $00                                   ; $51BF: $16 $00
    add  hl, de                                   ; $51C1: $19
    ld   a, [hl+]                                 ; $51C2: $2A
    ld   b, [hl]                                  ; $51C3: $46
    ld   h, b                                     ; $51C4: $60
    ld   l, a                                     ; $51C5: $6F
    call func_021_41B4                            ; $51C6: $CD $B4 $41
    xor  a                                        ; $51C9: $AF
    ld   [wPaletteUnknownE], a                    ; $51CA: $EA $D5 $DD
    jr   ret_021_51D5                             ; $51CD: $18 $06

.jr_51CF
    inc  hl                                       ; $51CF: $23

jr_021_51D0:
    inc  hl                                       ; $51D0: $23

jr_021_51D1:
    inc  hl                                       ; $51D1: $23
    dec  b                                        ; $51D2: $05
    jr   nz, jr_021_5190                          ; $51D3: $20 $BB

ret_021_51D5:
    ret                                           ; $51D5: $C9

jr_021_51D6:
    ld   b, $0E                                   ; $51D6: $06 $0E
    ld   hl, OverworldSpritePaletteIndexData      ; $51D8: $21 $EE $52

jr_021_51DB:
    ldh  a, [hMapRoom]                            ; $51DB: $F0 $F6
    ld   e, a                                     ; $51DD: $5F
    ld   a, [hl+]                                 ; $51DE: $2A
    cp   e                                        ; $51DF: $BB
    jr   nz, .jr_51F0                             ; $51E0: $20 $0E

    ld   a, [wRoomTransitionDirection]            ; $51E2: $FA $25 $C1
    ld   e, a                                     ; $51E5: $5F
    ld   a, [hl+]                                 ; $51E6: $2A
    cp   e                                        ; $51E7: $BB
    jr   nz, jr_021_51F1                          ; $51E8: $20 $07

    ld   a, [hl+]                                 ; $51EA: $2A
    ld   [wPaletteToLoadForTileMap], a            ; $51EB: $EA $D2 $DD
    jr   ret_021_51F5                             ; $51EE: $18 $05

.jr_51F0
    inc  hl                                       ; $51F0: $23

jr_021_51F1:
    inc  hl                                       ; $51F1: $23
    dec  b                                        ; $51F2: $05
    jr   nz, jr_021_51DB                          ; $51F3: $20 $E6

ret_021_51F5:
    ret                                           ; $51F5: $C9

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
    ; MapId, RoomId, Transition Direction, wPaletteToLoadForTileMap
    db   $00, $17, $04, $81
    db   $00, $13, $01, $80
    db   $00, $13, $00, $80  ; $523E |........|
    db   $00, $13, $03, $81
    db   $00, $10, $00, $CA  ; $5246 |........|
    db   $00, $1C, $02, $C2
    db   $01, $2D, $02, $D0  ; $524E |.....-..|
    db   $02, $52, $04, $83
    db   $02, $51, $02, $82  ; $5256 |.R...Q..|
    db   $02, $51, $03, $83
    db   $03, $78, $01, $8B  ; $525E |.Q...x..|
    db   $03, $78, $00, $8B
    db   $03, $78, $03, $8C  ; $5266 |.x...x..|
    db   $03, $EF, $03, $CD
    db   $04, $A1, $04, $85  ; $526E |........|
    db   $04, $9F, $02, $86
    db   $04, $9F, $00, $85  ; $5276 |........|
    db   $04, $9C, $02, $84
    db   $04, $9C, $01, $84  ; $527E |........|
    db   $04, $9C, $00, $86
    db   $04, $95, $00, $84  ; $5286 |........|
    db   $04, $95, $03, $86
    db   $04, $81, $04, $86  ; $528E |........|
    db   $04, $8B, $02, $CE
    db   $04, $85, $03, $C4  ; $5296 |........|
    db   $05, $D2, $02, $D2
    db   $05, $CE, $02, $D1  ; $529E |........|
    db   $06, $2E, $04, $89
    db   $06, $F8, $04, $88  ; $52A6 |........|
    db   $06, $0E, $04, $87
    db   $06, $0D, $02, $89  ; $52AE |........|
    db   $06, $0D, $00, $87
    db   $06, $0F, $02, $89  ; $52B6 |........|
    db   $06, $0F, $00, $89
    db   $06, $0F, $01, $87  ; $52BE |........|
    db   $06, $17, $02, $D3
    db   $06, $14, $01, $D3  ; $52C6 |........|
    db   $06, $13, $00, $C7
    db   $07, $55, $01, $CA  ; $52CE |.....U..|
    db   $07, $54, $00, $CF
    db   $07, $54, $03, $CF  ; $52D6 |.T...T..|
    db   $07, $54, $02, $CF
    db   $16, $6F, $02, $DC  ; $52DE |.T...o..|
    db   $16, $7F, $02, $DD
    db   $16, $8F, $03, $DE  ; $52E6 |........|

OverworldSpritePaletteIndexData::
    ; This is table with 3 byte records:
    ; RoomId, Transition Direction, wPaletteToLoadForTileMap
    db   $44, $03, $94
    db   $36, $00, $94
    db   $16, $02, $95
    db   $26, $03, $95
    db   $17, $02, $95
    db   $27, $03, $95
    db   $08, $02, $9B
    db   $17, $01, $9B
    db   $9C, $00, $96
    db   $9F, $02, $D7
    db   $9E, $00, $DA
    db   $2C, $00, $98
    db   $12, $00, $99
    db   $65, $02, $98

func_021_5318::
    ld   a, [wIsIndoor]                           ; $5318: $FA $A5 $DB
    and  a                                        ; $531B: $A7
    jr   nz, ret_021_5342                         ; $531C: $20 $24

    ld   b, $06                                   ; $531E: $06 $06
    ld   hl, Data_021_5343                        ; $5320: $21 $43 $53

jr_021_5323:
    ldh  a, [hMapRoom]                            ; $5323: $F0 $F6
    ld   e, a                                     ; $5325: $5F
    ld   a, [hl+]                                 ; $5326: $2A
    cp   e                                        ; $5327: $BB
    jr   nz, .jr_533D                             ; $5328: $20 $13

    ld   a, [wRoomTransitionDirection]            ; $532A: $FA $25 $C1
    ld   e, a                                     ; $532D: $5F
    ld   a, [hl+]                                 ; $532E: $2A
    cp   e                                        ; $532F: $BB
    jr   nz, jr_021_533E                          ; $5330: $20 $0C

    ld   a, [hl+]                                 ; $5332: $2A
    ld   [wDDD6], a                               ; $5333: $EA $D6 $DD
    ld   a, $0B                                   ; $5336: $3E $0B
    ld   [wDDD7], a                               ; $5338: $EA $D7 $DD
    jr   ret_021_5342                             ; $533B: $18 $05

.jr_533D
    inc  hl                                       ; $533D: $23

jr_021_533E:
    inc  hl                                       ; $533E: $23
    dec  b                                        ; $533F: $05
    jr   nz, jr_021_5323                          ; $5340: $20 $E1

ret_021_5342:
    ret                                           ; $5342: $C9

; Array indexed by wRoomTransitionDirection
Data_021_5343::
    db   $40, $03, $40, $30, $02, $80, $44, $00  ; $5343 |@.@0..D.|
    db   $80, $43, $01, $40, $90, $03, $80, $80  ; $534B |.C.@....|

    ld   [bc], a                                  ; $5353: $02
    ld   b, b                                     ; $5354: $40

func_021_5355::
    call func_021_5366                            ; $5355: $CD $66 $53
    ld   a, [wBGPaletteEffectAddress]             ; $5358: $FA $CC $C3
    and  $0E                                      ; $535B: $E6 $0E
    ret  z                                        ; $535D: $C8

    ld   a, $01                                   ; $535E: $3E $01
    ldh  [hBGMapOffsetLow], a                     ; $5360: $E0 $E1
    call func_021_5432                            ; $5362: $CD $32 $54
    ret                                           ; $5365: $C9

func_021_5366::
    ldh  a, [hMapId]                              ; $5366: $F0 $F7
    cp   MAP_CAVE_B                               ; $5368: $FE $0A
    jr   nc, .jr_537B                             ; $536A: $30 $0F

    sla  a                                        ; $536C: $CB $27
    ld   e, a                                     ; $536E: $5F
    ld   d, $00                                   ; $536F: $16 $00
    ld   hl, DungeonPalettesA                     ; $5371: $21 $EF $43
    add  hl, de                                   ; $5374: $19
    ld   a, [hl+]                                 ; $5375: $2A
    ld   b, [hl]                                  ; $5376: $46
    ld   h, b                                     ; $5377: $60
    ld   l, a                                     ; $5378: $6F
    jr   jr_021_539C                              ; $5379: $18 $21

.jr_537B
    sub  $0A                                      ; $537B: $D6 $0A
    sla  a                                        ; $537D: $CB $27
    ld   e, a                                     ; $537F: $5F
    ld   d, $00                                   ; $5380: $16 $00
    ld   hl, IndoorPaletteMaps                    ; $5382: $21 $13 $44
    add  hl, de                                   ; $5385: $19
    ld   a, [hl+]                                 ; $5386: $2A
    ld   b, [hl]                                  ; $5387: $46
    ld   h, b                                     ; $5388: $60
    ld   l, a                                     ; $5389: $6F
    ldh  a, [hMapRoom]                            ; $538A: $F0 $F6
    ld   e, a                                     ; $538C: $5F
    ld   d, $00                                   ; $538D: $16 $00
    add  hl, de                                   ; $538F: $19
    ld   a, [hl]                                  ; $5390: $7E
    sla  a                                        ; $5391: $CB $27
    ld   e, a                                     ; $5393: $5F
    ld   hl, InteriorPalettes                     ; $5394: $21 $3F $44
    add  hl, de                                   ; $5397: $19
    ld   a, [hl+]                                 ; $5398: $2A
    ld   b, [hl]                                  ; $5399: $46
    ld   h, b                                     ; $539A: $60
    ld   l, a                                     ; $539B: $6F

jr_021_539C:
    ld   de, wBGPal1                              ; $539C: $11 $10 $DC
    ld   bc, $40                                  ; $539F: $01 $40 $00
    push bc                                       ; $53A2: $C5
    push de                                       ; $53A3: $D5
    push hl                                       ; $53A4: $E5
    call CopyData                                 ; $53A5: $CD $14 $29
    pop  hl                                       ; $53A8: $E1
    pop  de                                       ; $53A9: $D1
    pop  bc                                       ; $53AA: $C1
    ld   a, $02                                   ; $53AB: $3E $02
    ldh  [rSVBK], a                               ; $53AD: $E0 $70
    call CopyData                                 ; $53AF: $CD $14 $29
    xor  a                                        ; $53B2: $AF
    ldh  [rSVBK], a                               ; $53B3: $E0 $70
    ret                                           ; $53B5: $C9

func_021_53B6::
    call func_021_5366                            ; $53B6: $CD $66 $53
    ld   a, $01                                   ; $53B9: $3E $01
    ldh  [hBGMapOffsetLow], a                     ; $53BB: $E0 $E1
    call func_021_5440                            ; $53BD: $CD $40 $54

jr_021_53C0:
    xor  a                                        ; $53C0: $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ; $53C1: $EA $D3 $DD
    ld   a, $20                                   ; $53C4: $3E $20
    ld   [wPalettePartialCopyColorCount], a       ; $53C6: $EA $D4 $DD
    ld   a, $81                                   ; $53C9: $3E $81
    ld   [wPaletteDataFlags], a                   ; $53CB: $EA $D1 $DD
    ret                                           ; $53CE: $C9

func_021_53CF::
    call func_021_5366                            ; $53CF: $CD $66 $53
    ld   a, $01                                   ; $53D2: $3E $01
    ldh  [hBGMapOffsetLow], a                     ; $53D4: $E0 $E1
    call func_021_5432                            ; $53D6: $CD $32 $54
    jr   jr_021_53C0                              ; $53D9: $18 $E5

Data_021_53DB::
    db   $0B, $0D, $0D, $0D, $0B, $0B, $0B, $0B  ; $53DB |........|

Data_021_53E3::
    db   $07, $09, $09, $09, $07, $07, $07, $07  ; $53E3 |........|

Data_021_53EB::
    db   $04, $05, $05, $05, $04, $04, $04, $04  ; $53EB |........|

; Load palettes for room objects?
; Returns early when DBA5 is 0
func_021_53F3::
    xor  a                                        ; $53F3: $AF
    ldh  [hBGMapOffsetLow], a                     ; $53F4: $E0 $E1
    ldh  a, [hIsGBC]                              ; $53F6: $F0 $FE
    and  a                                        ; $53F8: $A7
    ret  z                                        ; $53F9: $C8

    ld   a, [wIsIndoor]                           ; $53FA: $FA $A5 $DB
    and  a                                        ; $53FD: $A7
    ret  z                                        ; $53FE: $C8

    ld   hl, wBGPaletteEffectAddress              ; $53FF: $21 $CC $C3
    ld   a, [wC3CD]                               ; $5402: $FA $CD $C3
    cp   [hl]                                     ; $5405: $BE
    ret  z                                        ; $5406: $C8

    ld   a, [wRoomTransitionState]                ; $5407: $FA $24 $C1
    and  a                                        ; $540A: $A7
    ld   a, [wC3CD]                               ; $540B: $FA $CD $C3
    jr   z, jr_021_5435                           ; $540E: $28 $25

    ld   hl, wBGPaletteEffectAddress              ; $5410: $21 $CC $C3
    ld   a, [wC3CD]                               ; $5413: $FA $CD $C3
    cp   [hl]                                     ; $5416: $BE
    jr   nc, .jr_541D                             ; $5417: $30 $04

    ld   a, $40                                   ; $5419: $3E $40
    jr   jr_021_541F                              ; $541B: $18 $02

.jr_541D
    ld   a, $80                                   ; $541D: $3E $80

jr_021_541F:
    ld   [wDDD6], a                               ; $541F: $EA $D6 $DD
    ldh  a, [hMapId]                              ; $5422: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $5424: $FE $07
    jr   nz, .jr_542C                             ; $5426: $20 $04

    ld   a, $17                                   ; $5428: $3E $17
    jr   jr_021_542E                              ; $542A: $18 $02

.jr_542C
    ld   a, $0B                                   ; $542C: $3E $0B

jr_021_542E:
    ld   [wDDD7], a                               ; $542E: $EA $D7 $DD
    ret                                           ; $5431: $C9

func_021_5432::
    ld   a, [wBGPaletteEffectAddress]             ; $5432: $FA $CC $C3

jr_021_5435:
    ld   hl, Data_021_53EB                        ; $5435: $21 $EB $53
    cp   $08                                      ; $5438: $FE $08
    jr   z, jr_021_5448                           ; $543A: $28 $0C

    cp   $02                                      ; $543C: $FE $02
    jr   z, jr_021_5445                           ; $543E: $28 $05

func_021_5440::
    ld   hl, Data_021_53E3                        ; $5440: $21 $E3 $53
    jr   jr_021_5448                              ; $5443: $18 $03

jr_021_5445:
    ld   hl, Data_021_53DB                        ; $5445: $21 $DB $53

jr_021_5448:
    ld   b, $00                                   ; $5448: $06 $00

.loop_544A
    ld   a, [hl+]                                 ; $544A: $2A
    ld   c, a                                     ; $544B: $4F
    call func_021_5466                            ; $544C: $CD $66 $54
    inc  b                                        ; $544F: $04
    ld   a, b                                     ; $5450: $78
    cp   $08                                      ; $5451: $FE $08
    jr   nz, .loop_544A                           ; $5453: $20 $F5

    ldh  a, [hBGMapOffsetLow]                     ; $5455: $F0 $E1
    and  a                                        ; $5457: $A7
    jr   nz, .jr_5460                             ; $5458: $20 $06

    ld   a, [wRoomTransitionState]                ; $545A: $FA $24 $C1
    and  a                                        ; $545D: $A7
    jr   z, ret_021_5465                          ; $545E: $28 $05

.jr_5460
    ld   a, $01                                   ; $5460: $3E $01
    ld   [wPaletteDataFlags], a                   ; $5462: $EA $D1 $DD

ret_021_5465:
    ret                                           ; $5465: $C9

func_021_5466::
    push bc                                       ; $5466: $C5
    push hl                                       ; $5467: $E5
    ld   hl, wBGPal1                              ; $5468: $21 $10 $DC
    ld   a, b                                     ; $546B: $78
    sla  a                                        ; $546C: $CB $27
    sla  a                                        ; $546E: $CB $27
    sla  a                                        ; $5470: $CB $27
    ld   e, a                                     ; $5472: $5F
    ld   d, $00                                   ; $5473: $16 $00
    add  hl, de                                   ; $5475: $19

jr_021_5476:
    push hl                                       ; $5476: $E5
    ldh  a, [hBGMapOffsetLow]                     ; $5477: $F0 $E1
    and  a                                        ; $5479: $A7
    jr   nz, .jr_548E                             ; $547A: $20 $12

    ld   a, [wRoomTransitionState]                ; $547C: $FA $24 $C1
    and  a                                        ; $547F: $A7
    jr   nz, .jr_548E                             ; $5480: $20 $0C

    ld   a, $02                                   ; $5482: $3E $02
    ldh  [rSVBK], a                               ; $5484: $E0 $70
    ld   a, [hl+]                                 ; $5486: $2A
    ld   e, a                                     ; $5487: $5F
    ld   d, [hl]                                  ; $5488: $56
    xor  a                                        ; $5489: $AF
    ldh  [rSVBK], a                               ; $548A: $E0 $70
    jr   jr_021_5491                              ; $548C: $18 $03

.jr_548E
    ld   a, [hl+]                                 ; $548E: $2A
    ld   e, a                                     ; $548F: $5F
    ld   d, [hl]                                  ; $5490: $56

jr_021_5491:
    ld   a, e                                     ; $5491: $7B
    and  $1F                                      ; $5492: $E6 $1F
    call func_021_54F9                            ; $5494: $CD $F9 $54
    ldh  [hMultiPurpose8], a                      ; $5497: $E0 $DF
    ld   a, e                                     ; $5499: $7B
    and  $E0                                      ; $549A: $E6 $E0
    swap a                                        ; $549C: $CB $37
    srl  a                                        ; $549E: $CB $3F
    ld   b, a                                     ; $54A0: $47
    ld   a, d                                     ; $54A1: $7A
    and  $03                                      ; $54A2: $E6 $03
    swap a                                        ; $54A4: $CB $37
    srl  a                                        ; $54A6: $CB $3F
    or   b                                        ; $54A8: $B0
    call func_021_54F9                            ; $54A9: $CD $F9 $54
    ldh  [hBGMapOffsetHigh], a                    ; $54AC: $E0 $E0
    ld   a, d                                     ; $54AE: $7A
    and  $7C                                      ; $54AF: $E6 $7C
    srl  a                                        ; $54B1: $CB $3F
    srl  a                                        ; $54B3: $CB $3F
    call func_021_54F9                            ; $54B5: $CD $F9 $54
    sla  a                                        ; $54B8: $CB $27
    sla  a                                        ; $54BA: $CB $27
    ld   d, a                                     ; $54BC: $57
    ldh  a, [hBGMapOffsetHigh]                    ; $54BD: $F0 $E0
    sla  a                                        ; $54BF: $CB $27
    swap a                                        ; $54C1: $CB $37
    and  $03                                      ; $54C3: $E6 $03
    or   d                                        ; $54C5: $B2
    ld   d, a                                     ; $54C6: $57
    ldh  a, [hBGMapOffsetHigh]                    ; $54C7: $F0 $E0
    and  $07                                      ; $54C9: $E6 $07
    swap a                                        ; $54CB: $CB $37
    sla  a                                        ; $54CD: $CB $27
    ld   e, a                                     ; $54CF: $5F
    ldh  a, [hMultiPurpose8]                      ; $54D0: $F0 $DF
    or   e                                        ; $54D2: $B3
    ld   e, a                                     ; $54D3: $5F
    pop  hl                                       ; $54D4: $E1
    ldh  a, [hBGMapOffsetLow]                     ; $54D5: $F0 $E1
    and  a                                        ; $54D7: $A7
    jr   nz, .jr_54ED                             ; $54D8: $20 $13

    ld   a, [wRoomTransitionState]                ; $54DA: $FA $24 $C1
    and  a                                        ; $54DD: $A7
    jr   nz, .jr_54ED                             ; $54DE: $20 $0D

    ld   a, $02                                   ; $54E0: $3E $02
    ldh  [rSVBK], a                               ; $54E2: $E0 $70
    ld   a, e                                     ; $54E4: $7B
    ld   [hl+], a                                 ; $54E5: $22
    ld   a, d                                     ; $54E6: $7A
    ld   [hl+], a                                 ; $54E7: $22
    xor  a                                        ; $54E8: $AF
    ldh  [rSVBK], a                               ; $54E9: $E0 $70
    jr   jr_021_54F1                              ; $54EB: $18 $04

.jr_54ED
    ld   a, e                                     ; $54ED: $7B
    ld   [hl+], a                                 ; $54EE: $22
    ld   a, d                                     ; $54EF: $7A
    ld   [hl+], a                                 ; $54F0: $22

jr_021_54F1:
    ld   a, l                                     ; $54F1: $7D
    and  $07                                      ; $54F2: $E6 $07
    jr   nz, jr_021_5476                          ; $54F4: $20 $80

    pop  hl                                       ; $54F6: $E1
    pop  bc                                       ; $54F7: $C1
    ret                                           ; $54F8: $C9

func_021_54F9::
    push de                                       ; $54F9: $D5
    ld   b, a                                     ; $54FA: $47
    and  $0F                                      ; $54FB: $E6 $0F
    swap a                                        ; $54FD: $CB $37
    ld   e, a                                     ; $54FF: $5F
    ld   a, b                                     ; $5500: $78
    swap a                                        ; $5501: $CB $37
    and  $01                                      ; $5503: $E6 $01
    ld   d, a                                     ; $5505: $57
    xor  a                                        ; $5506: $AF
    ld   h, a                                     ; $5507: $67
    ld   l, a                                     ; $5508: $6F
    ld   b, c                                     ; $5509: $41

.loop_550A
    ld   a, l                                     ; $550A: $7D
    add  e                                        ; $550B: $83
    ld   l, a                                     ; $550C: $6F
    ld   a, h                                     ; $550D: $7C
    adc  $00                                      ; $550E: $CE $00
    add  d                                        ; $5510: $82
    ld   h, a                                     ; $5511: $67
    dec  b                                        ; $5512: $05
    jr   nz, .loop_550A                           ; $5513: $20 $F5

    ld   a, h                                     ; $5515: $7C
    pop  de                                       ; $5516: $D1
    ret                                           ; $5517: $C9


; These 6 object palettes are always in RAM while you're controlling Link

ObjectPalettes::
    rgb   #F8F888, #000000, #10A840, #F8B888      ; green objects: Link, leaf particles, etc.


    rgb   #F8F888, #000000, #F87808, #F8B888      ; orange objects: Marin, chickens, arrows, etc.
                                                  ; - particles when enemies get defeated
RedTunicPalette::
    rgb   #F8F8F8, #000000, #F80828, #F8B888      ; red objects: Tarin, octoroks, red tunic, etc.

BlueTunicPalette::
    rgb   #F8F8F8, #000000, #1880F8, #F8B888      ; blue objects: sword, Bow-Wow, blue tunic, etc.
    

    rgb   #F8F8F8, #F8B030, #D80000, #000000      ; red/orange objects: hearts, red rupees, secret seashells, etc.
                                                  ; - Link/enemies get hurt, charging sword, Piece of Power HUD

    rgb   #F8F8F8, #70A8F8, #0000F8, #000000      ; blue/cyan objects: blue rupees, bombs, etc.


Data_021_5548:: ; related to the Eagle Tower
    rgb   #F8F8F8, #608038, #204000, #000000


; Overworld palettes

OverworldPalette00:: ; Mysterious Woods
    rgb   #98B8E8, #686010, #482818, #000000
    rgb   #98B8E8, #6068A0, #301840, #000000
    rgb   #98B8E8, #B80028, #600020, #000000
    rgb   #98B8E8, #B86010, #582010, #000000
    rgb   #98B8E8, #003060, #080030, #000000
    rgb   #785010, #686010, #482818, #000000
    rgb   #98B8E8, #308868, #185830, #000000
    rgb   #F8F888, #98B8E8, #105848, #000000

    rgb   #98B8E8, #308868, #185830, #000000
    rgb   #98B8E8, #6068A0, #301840, #000000

OverworldPalette01:: ; Toronbo Shores
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #D88030, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #C87020, #084828, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette18:: ; Toronbo Shores (ext: Sale's House o' Bananas)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #D88030, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #C87020, #084828, #000000

    rgb   #000000, #20B048, #084828, #000000
    rgb   #000000, #000000, #D88818, #F8E050

OverworldPalette02:: ; South of the Village (ext: L1 Tail Cave)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #1830F8, #000058, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #909038, #283818, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette03:: ; Mabe Village, South of the Village
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #1830F8, #000058, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
Data_021_56C8::
    rgb   #F8F888, #A818F8, #380078, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette04:: ; Signpost Maze, Pothole Field, Ukuku Prairie (ext: L3 Key Cavern, Richard's Villa)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #4058F8, #C818F8, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F80028, #F8F888, #F89800, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette05:: ; Ukuku Prairie (beehive, skull rock)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #1830F8, #000058, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #A0F8F8, #60B820, #6800E8, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette06:: ; Kanalet Castle
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #A88068, #600020, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette1A:: ; Kanalet Castle (Kiki's bridge)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #A88068, #600020, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #F0E818, #988000, #000000

OverworldPalette07:: ; Tabahl Wasteland, Cemetary, Koholint Prairie (ext: Camera Shop, Crazy Tracy, Witch's Hut)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8A8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #786810, #303808, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette08:: ; Tal Tal Heights (ext: Raft Shop, pit south of the Ghost's gravestone)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D88030, #9878A0, #381850, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette09:: ; Martha's Bay, Ukuku Prairie (ext: L5 Catfish's Maw, House by the Bay)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #9878A0, #381850, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette1C:: ; Martha's Bay (North of L3 Key Cavern)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #9878A0, #381850, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #F81858, #700028, #000000

OverworldPalette0A:: ; Ukuku Prairie (ext: Seashell Mansion)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #786810, #303808, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette0B:: ; Face Shrine
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #F800A0, #780040, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette1B:: ; Animal Village (ext: Christine's house)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #F800A0, #780040, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

OverworldPalette1E:: ; Mabe Village (ext: Ulrira's House)
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #1830F8, #000058, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F888, #A818F8, #380078, #000000

    rgb   #F8F8F8, #000000, #881888, #F858F8
    rgb   #F8F888, #8888A0, #283050, #000000

OverworldPalette0C:: ; Animal Village, East of the Bay
    rgb   #E8E038, #F07800, #0000F8, #0000F8
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #C8C038, #D06000, #0000F8, #0000F8
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #B0A030, #B04800, #0000F8, #0000F8
    rgb   #F8F8F8, #B07060, #286020, #000000

    rgb   #E8E038, #F07800, #0000F8, #0000F8
    rgb   #F8F888, #D8A820, #885000, #000000

OverworldPalette0D:: ; Yarna Desert, East of the Bay
    rgb   #F8F888, #20B048, #084828, #000000 ; 5AF0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #B07060, #286020, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette0E:: ; Goponga Swamp (ext: L2 Bottle Grotto)
    rgb   #F8F888, #20B048, #084828, #000000 ; 5B40
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #909038, #703020, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #F8F8F8, #20B048, #F84000, #481800

    rgb   #98B8E8, #686010, #482818, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette0F:: ; Tal Tal Mountain Range
    rgb   #4058F8, #C87020, #703020, #000000 ; 5B90
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette10:: ; Goponga Swamp West
    rgb   #F8F888, #20B048, #084828, #000000 ; 5BE0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D8A048, #20B048, #084828, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette19:: ; Tal Tal Mountain Range (ext: L8 Turtle Rock)
    rgb   #F8F888, #20B048, #084828, #000000 ; 5C30
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D8A048, #20B048, #084828, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #C87020, #9888C0, #403070, #000000
    rgb   #C87020, #000000, #50A828, #F8F8F8

OverworldPalette11:: ; Rapids Ride, Tal Tal Heights
    rgb   #F8F888, #20B048, #084828, #000000 ; 5C80
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #4058F8, #70C820, #304810, #201020

    rgb   #808028, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette12:: ; Face Shrine South 
    rgb   #F8F888, #20B048, #084828, #000000 ; 5CD0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8A8, #4058F8, #283098, #000000
    rgb   #E0F898, #289868, #103080, #E08830
    rgb   #E08830, #B890C8, #604068, #201028
    rgb   #E08830, #F8F888, #787810, #000000

    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F8F8, #F8F888, #787810, #000000

OverworldPalette1D:: ; Face Shrine North (ext: L6 Face Shrine)
    rgb   #F8F888, #20B048, #084828, #000000 ; 5D20
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8A8, #4058F8, #283098, #000000
    rgb   #E0F898, #289868, #103080, #E08830
    rgb   #E08830, #B890C8, #604068, #201028
    rgb   #E08830, #9878A0, #381850, #000000

    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #E08830, #9878A0, #381850, #000000

Data_021_5D70::
    rgb   #F8F888, #20B048, #084828, #000000 ; 5D70
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8A8, #4058F8, #283098, #000000
    rgb   #E0F898, #289868, #103080, #E08830
    rgb   #E08830, #B890C8, #604068, #201028
    rgb   #E08830, #000000, #787810, #F8F888

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

Data_021_5DC0::
    rgb   #F8F888, #20B048, #084828, #000000 ; 5DC0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8A8, #4058F8, #283098, #000000
    rgb   #E0F898, #289868, #103080, #E08830
    rgb   #E08830, #B890C8, #604068, #201028
    rgb   #E08830, #000000, #787810, #F8F888

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

OverworldPalette13:: ; Mt. Tamaranch (ext: Wind Fish's Egg)
    rgb   #4058F8, #C87020, #703020, #000000 ; 5E10
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #F8F888, #E82098, #4058F8, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #000000, #381850, #000000
    rgb   #D89040, #9878A0, #381850, #000000

Data_021_5E60::
    rgb   #F8F888, #20B048, #084828, #000000 ; 5E60
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette14:: ; Mt. Tamaranch, Tal Tal Mountain Range (bridge west)
    rgb   #4058F8, #C87020, #703020, #000000 ; 5EA0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #D88030, #20B048, #084828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette15:: ; Tal Tal Mountain Range (ext: Hen House)
    rgb   #4058F8, #C87020, #703020, #000000 ; 5EF0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette16:: ; Tal Tal Mountain Range (ext: L7 Eagle's Tower)
    rgb   #D89040, #20B048, #084828, #000000 ; 5F40
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #283098, #C87020, #703020, #000000
    rgb   #F8F888, #608038, #204000, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F8F8, #000000, #608038, #F8F888
    rgb   #D89040, #9878A0, #381850, #000000

OverworldPalette17:: ; Tal Tal Heights (ext: L4 Angler's Tunner)
    rgb   #F8F888, #20B048, #084828, #000000 ; 5F90
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #C80028, #500020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #4058F8, #283098, #000000
    rgb   #C87020, #20B048, #084828, #000000
    rgb   #F8F888, #60B820, #306828, #000000
    rgb   #D89040, #9878A0, #381850, #000000

    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #D89040, #9878A0, #381850, #000000





; dungeon palettes

TailCavePaletteA:: ; 00 TAIL_CAVE
    rgb   #F8F888, #20B048, #084828, #000000 ; 5FE0
    rgb   #F8F888, #9878A0, #381850, #000000 ; Nightmare 
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #3860F8, #303888, #6880E8, #000000
    rgb   #3860F8, #B080F8, #682070, #000000
    rgb   #909090, #707070, #484848, #000000

    rgb   #3860F8, #B080F8, #6018C0, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

TailCavePaletteB:: ; 00 TAIL_CAVE
    rgb   #F8F888, #20B048, #084828, #000000 ; 6030
    rgb   #F8F888, #9878A0, #381850, #000000 ; sidescrolling
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #F8F888, #5078F8, #284080, #000000
    rgb   #6880E8, #3860F8, #303888, #000000
    rgb   #909090, #707070, #484848, #000000

    rgb   #6880E8, #3860F8, #303888, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6080::
    rgb   #F8F888, #20B048, #084828, #000000 ; 6080
    rgb   #F8F888, #9878A0, #381850, #000000 ; entrance
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #3860F8, #303888, #6880E8, #000000
    rgb   #F8F888, #20B048, #107830, #003818
    rgb   #909090, #707070, #484848, #000000

    rgb   #F8F888, #20B048, #107830, #003818
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_60D0::
    rgb   #F8F888, #20B048, #084828, #000000 ; 60D0
    rgb   #F8F888, #9878A0, #381850, #000000 ; miniboss
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #3860F8, #303888, #6880E8, #000000
    rgb   #3860F8, #B080F8, #6018C0, #000000
    rgb   #909090, #707070, #484848, #000000

    rgb   #F8F8F8, #000000, #D00068, #F868D8
    rgb   #F8D8D8, #000000, #586080, #B8C0D0


BottleGrottoPaletteA:: ; 01 BOTTLE_GROTTO
    rgb   #A0A0F8, #6870F8, #281868, #000000 ; 6120
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #90C0F8, #3838F8, #000068, #000000
    rgb   #D0A870, #805810, #483010, #000000
    rgb   #B89058, #C87020, #703020, #000000
    rgb   #C0C0B0, #5080B8, #0038B8, #000000

    rgb   #B89058, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

BottleGrottoPaletteB:: ; 01 BOTTLE_GROTTO
    rgb   #A0A0F8, #6870F8, #281868, #000000 ; 6170
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6180::
    rgb   #F8F888, #B80028, #400020, #000000 ; 6180
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #90C0F8, #3838F8, #000068, #000000
    rgb   #D0A870, #805810, #483010, #000000
    rgb   #B89058, #C87020, #703020, #000000
    rgb   #C0C0B0, #5080B8, #0038B8, #000000
    rgb   #9888C0, #F88800, #984808, #000000
    rgb   #9888C0, #C0C090, #685058, #000000

    rgb   #9888C0, #000000, #984808, #F88800
    rgb   #F8F888, #9878A0, #381850, #000000


KeyCavernPaletteA:: ; 02 KEY_CAVERN
    rgb   #808028, #20B048, #084828, #000000 ; 61D0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #808028, #C87020, #703020, #000000
    rgb   #7890A0, #385870, #103058, #000000

    rgb   #808028, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

KeyCavernPaletteB:: ; 02 KEY_CAVERN
    rgb   #F8F888, #20B048, #084828, #000000 ; 6220
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #F8F888, #5078F8, #284080, #000000
    rgb   #6880E8, #3860F8, #303888, #000000
    rgb   #909090, #707070, #484848, #000000

    rgb   #6880E8, #3860F8, #303888, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6270::
    rgb   #F8F888, #2850F8, #202878, #101840 ; 6270
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #808028, #C87020, #703020, #000000
    rgb   #7890A0, #385870, #103058, #000000

    rgb   #808028, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000


AnglersTunnelPaletteA:: ; 03 ANGLERS_TUNNEL
    rgb   #909028, #C87020, #703020, #000000 ; 62C0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F0F0E0, #00A870, #005028, #000000
    rgb   #909028, #585828, #282808, #000000
    rgb   #00F8E8, #008070, #005040, #000000
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #909028, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

AnglersTunnelPaletteB:: ; 03 ANGLERS_TUNNEL
    rgb   #909028, #C87020, #703020, #000000 ; 6310
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F0F0E0, #00A870, #005028, #000000
    rgb   #909028, #585828, #282808, #000000
    rgb   #00F8E8, #008070, #005040, #000000
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #9888C0, #F88800, #984808, #000000
    rgb   #9888C0, #C0C090, #685058, #000000
Data_021_6360::
    rgb   #909028, #B080F8, #6018C0, #000000 ; 6360
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F0F0E0, #00A870, #005028, #000000
    rgb   #909028, #585828, #282808, #000000
    rgb   #00F8E8, #008070, #005040, #000000
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #000000, #F8B030, #6828F0, #000000
    rgb   #000000, #000000, #F8B030, #F8F8F8


CatfishsMawPaletteA:: ; 04 CATFISHS_MAW
    rgb   #A09800, #20B048, #084828, #000000 ; 63B0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B8B0A0, #886050, #603828, #000000
    rgb   #A09800, #585800, #C8C040, #000000
    rgb   #A09800, #C87020, #703020, #000000
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #A09800, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

CatfishsMawPaletteB:: ; 04 CATFISHS_MAW
    rgb   #F8F888, #20B048, #084828, #000000 ; 6400
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F898B0, #F83070, #900018, #000000
    rgb   #98B0F8, #3860F8, #303888, #000000
    rgb   #F8F888, #9878A0, #303888, #000000
    rgb   #D8E088, #709048, #305000, #000000

    rgb   #9888C0, #F88800, #984808, #000000
    rgb   #9888C0, #C0C090, #685058, #000000
Data_021_6450::
    rgb   #A09800, #20B048, #084828, #000000 ; 6450
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B8B0A0, #886050, #603828, #000000
    rgb   #A09800, #585800, #C8C040, #000000
    rgb   #F8F888, #808028, #484800, #282800
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #A09800, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_64A0::
    rgb   #A09800, #20B048, #084828, #000000 ; 64A0
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_64B0::
    rgb   #F8F888, #B80028, #400020, #000000 ; 64B0
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B8B0A0, #886050, #603828, #000000
    rgb   #A09800, #585800, #C8C040, #000000
    rgb   #A09800, #B080F8, #6018C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #A09800, #B080F8, #6018C0, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

    rgb   #A09800, #000000, #F80028, #F8F8F8
    rgb   #F8F888, #000000, #7050A0, #F8F8F8


FaceShrinePaletteA:: ; 05 FACE_SHRINE and 1A MAP_S_FACE_SHRINE
    rgb   #909058, #C87020, #703020, #000000 ; 6500
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6510::
    rgb   #F8F888, #B80028, #400020, #000000 ; 6510
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F0F0E0, #F068A0, #A00060, #000000
    rgb   #909058, #686800, #303000, #000000
    rgb   #F88868, #D05048, #782828, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #909058, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

    rgb   #909058, #C87020, #703020, #000000 ; 6550
    rgb   #F8F888, #B80028, #400020, #000000

FaceShrinePaletteB:: ; 05 FACE_SHRINE
    rgb   #F8F888, #50B048, #084828, #000000 ; 6560
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F0F0E0, #F068A0, #A00060, #000000
    rgb   #909058, #686800, #303000, #000000
    rgb   #F88868, #D05048, #782828, #000000
    rgb   #6880E8, #2850F8, #202878, #000000

    rgb   #F88868, #D05048, #782828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_65B0::
    rgb   #386800, #6078E0, #202878, #000000 ; 65B0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #C8C8C8, #909090, #484848, #000000
    rgb   #386800, #104000, #588800, #000000
    rgb   #386800, #C87020, #703020, #000000
    rgb   #F8F888, #B07050, #704838, #302018

    rgb   #386800, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000


EaglesTowerPaletteA:: ; 06 EAGLES_TOWER
    rgb   #F8F888, #B05808, #480800, #000000 ; 6600
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F8F8, #6860F8, #F8F8F8, #000000
    rgb   #F8F888, #608038, #204000, #000000
    rgb   #F8F8F8, #F8F8F8, #204000, #000000
    rgb   #F8F888, #608038, #C87020, #000000

    rgb   #F0F8C0, #D8B060, #987048, #383038
    rgb   #F0F8C0, #A0A0B0, #505870, #383038

EaglesTowerPaletteB:: ; 06 EAGLES_TOWER
    rgb   #386800, #6078E0, #202878, #000000 ; 6650
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6660::
    rgb   #F8F888, #B80028, #400020, #000000 ; 6660
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #C8C8C8, #909090, #484848, #000000
    rgb   #386800, #104000, #588800, #000000
    rgb   #386800, #C87020, #703020, #000000
    rgb   #F8F888, #584890, #381850, #000000
    rgb   #386800, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

    rgb   #386800, #C87020, #703020, #000000
    rgb   #F8F888, #909090, #484848, #000000


TurtleRockPaletteA:: ; 07 TURTLE_ROCK
    rgb   #F8A000, #C87020, #703020, #000000 ; 66B0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F84060, #A80000, #580000, #000000
    rgb   #F8A000, #F83000, #981000, #000000
    rgb   #F8F888, #F84810, #480000, #000000
    rgb   #F0F8C0, #90C0F8, #2878F8, #000000

    rgb   #F8A000, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

TurtleRockPaletteB:: ; 07 TURTLE_ROCK
    rgb   #F8F888, #9878A0, #381850, #000000 ; 6700
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F84060, #A80000, #580000, #000000
    rgb   #F8A000, #F83000, #981000, #000000
    rgb   #F8F888, #F84810, #480000, #000000
    rgb   #F0F8C0, #90C0F8, #2878F8, #000000

    rgb   #9888C0, #F88800, #984808, #000000
    rgb   #9888C0, #C0C090, #685058, #000000


Data_021_6750:: ; unknown
    rgb   #F8F888, #C87020, #703020, #000000 ; 6750
    rgb   #F8F888, #9878A0, #381850, #000000
Data_021_6760::
    rgb   #F8F888, #B80028, #400020, #000000 ; 6760
    rgb   #F8F888, #C87020, #703020, #000000
Data_021_6770::
    rgb   #F84060, #A80000, #580000, #000000 ; 6770
    rgb   #F8A000, #F83000, #981000, #000000
Data_021_6780::
    rgb   #F8F888, #F84810, #480000, #000000 ; 6780
    rgb   #F0F8C0, #90C0F8, #2878F8, #000000
    rgb   #9888C0, #F88800, #984808, #000000
    rgb   #9888C0, #C0C090, #685058, #000000
    rgb   #909058, #000000, #283048, #B8B068
    rgb   #F8F888, #D8A820, #885000, #000000
    rgb   #909058, #C87020, #703020, #000000
    rgb   #F8F888, #D8A820, #885000, #000000
    rgb   #909058, #C87020, #703020, #000000
    rgb   #F8F888, #D8A820, #885000, #000000

Data_021_67D0:: ; unknown
    rgb   #F8F888, #20B048, #084828, #000000 ; 67D0
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #606060, #404040, #808080, #000000
    rgb   #606060, #C87020, #703020, #000000
    rgb   #F8F888, #C88818, #383000, #000000

    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000


WindFishsEggPalette:: ; 08 WINDFISHS_EGG
    rgb   #F8F888, #20B048, #084828, #000000 ; 6820
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0A0C8, #8868A8, #482870, #000000
    rgb   #385870, #103058, #688090, #000000
    rgb   #F8F8F8, #F8F8F8, #F8F8F8, #000000
    rgb   #3860F8, #E01858, #780000, #400010

    rgb   #F8F888, #F84810, #480000, #000000
    rgb   #000000, #D8E030, #806088, #000000





InteriorPalette00::
    rgb   #F0F8C0, #7898F8, #2040F8, #100810
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A0F8F8, #C87020, #703020, #000000
    rgb   #A0F8F8, #18E060, #288820, #100810
    rgb   #A8D0A8, #58A080, #2040F8, #100810
    rgb   #F0F8C0, #C09058, #2040F8, #100810
    
    rgb   #F0F8C0, #D0A858, #805028, #100810
    rgb   #F8D8D8, #909038, #283818, #000000

    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000

    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000

InteriorPalette1C:: ; Fisherman under the bridge
    rgb   #F0F8C0, #7898F8, #2040F8, #100810
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A0F8F8, #C87020, #703020, #000000
    rgb   #A0F8F8, #18E060, #288820, #100810
    rgb   #A8D0A8, #58A080, #2040F8, #100810
    rgb   #F0F8C0, #C09058, #2040F8, #100810
    
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F8F8, #000000, #881888, #F858F8

InteriorPalette21:: ; Manbo
    rgb   #F0F8C0, #7898F8, #2040F8, #100810
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A0F8F8, #C87020, #703020, #000000
    rgb   #A0F8F8, #18E060, #288820, #100810
    rgb   #A8D0A8, #58A080, #2040F8, #100810
    rgb   #F0F8C0, #C09058, #2040F8, #100810
    
    rgb   #F0F8C0, #D0A858, #805028, #100810
    rgb   #F8F888, #C80028, #500020, #000000

InteriorPalette22:: ; Great Fairy $FB
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #F8F888, #C80028, #500020, #000000

InteriorPalette01::
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #C88818, #9878A0, #381850, #000000

    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000
    ;rgb   #FFFFFF, #FFFFFF, #FFFFFF, #000000

InteriorPalette02:: ; cave in Mysterious Woods, cave at indoor_b $B6 $B7, something at $C5, something at $B3 B4
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #C88818, #A8A8F8, #3850F8, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #C88818, #9878A0, #381850, #000000

InteriorPalette03:: ; unused I think
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #F838F8, #800050, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #C88818, #9878A0, #381850, #000000

InteriorPalette1F:: ; the guy who expands your bags
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #F838F8, #800050, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #9888C0, #D04000, #F8F818, #F8F8F8

InteriorPalette04:: ; Great Fairy $AC
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #B8F800, #383000, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #C88818, #9878A0, #381850, #000000

InteriorPalette1D:: ; Pegasus Boots cave at indoor_b $E4, $F4
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #000000, #3800B8, #1880F8, #F8F8F8
    rgb   #000000, #000000, #1880F8, #F8F8F8

InteriorPalette1E:: ; magnifying glass cave
    rgb   #C88818, #9878A0, #381850, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #F8D870, #C87020, #703020, #000000
    rgb   #C88818, #884030, #F0F8C0, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #C88818, #20B048, #084828, #000000
    
    rgb   #C88818, #20B048, #084828, #000000
    rgb   #C88818, #70A8F8, #0000F8, #000000

InteriorPalette05:: ; Moblin hideout
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #808028, #9878A0, #381850, #000000
    rgb   #709048, #305000, #B0C888, #000000
    
    rgb   #709048, #305000, #B0C888, #000000
    rgb   #F8F888, #20B048, #084828, #000000

InteriorPalette06:: ; House by the Bay, Richard's Villa, Marin and Tarin's House
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette07:: ; bunny quadruplets...?
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette08:: ; Tool Shop
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F0F8C0, #F0F8C0, #F0F8C0, #F0F8C0
    rgb   #E8B858, #B0C8F8, #2850F8, #000000
    rgb   #F0F8C0, #20B048, #084828, #000000
    
    rgb   #E8B858, #B0C8F8, #2850F8, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette09:: ; Trendy Game
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D00050, #F8F8F8, #D00050, #000000
    rgb   #78D078, #20B048, #084828, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F0F8C0, #20B048, #084828, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #F8F8F8, #109008, #000000

InteriorPalette0A:: ; Library, every telephone booth, Trendy Game operator's house at B0?
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #2850F8, #F8F8F8, #2850F8, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette0B:: ; Ulrira's House
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #78D078, #20B048, #084828, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette0C:: ; Madam MeowMeow
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D00050, #F8F8F8, #D00050, #000000
    rgb   #C09018, #804830, #F0F8C0, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette0D:: ; Hen House, Mr. Write, Zora's house I think
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #188000, #F8F8F8, #188000, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette0E:: ; Crazy Tracy
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D00050, #F8F8F8, #D00050, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette0F:: ; Witch's Hut
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A80078, #F8F8F8, #A80078, #000000
    rgb   #F868F8, #B800B8, #600060, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette10:: ; Schule
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D00050, #F8F8F8, #D00050, #000000
    rgb   #F868F8, #B800B8, #600060, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #8888A0, #283050, #000000

InteriorPalette11:: ; bear chef
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #F07888, #F81858, #700028, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F8F8, #F87808, #10A840, #000000

InteriorPalette12:: ; quadruplets house
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #F81858, #700028, #000000

InteriorPalette13:: ; ribbon dog
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D00050, #F8F8F8, #D00050, #000000
    rgb   #C09018, #804830, #F0F8C0, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #F8F8F8, #8888A0, #000000

InteriorPalette14:: ; Sale's House o' Bananas
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #F0E818, #988000, #000000

InteriorPalette15:: ; Christine's house
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F8F888, #8888A0, #283050, #000000
    rgb   #F8F888, #F81858, #700028, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #6880E8, #2850F8, #202878, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #E8B858, #F8F800, #987000, #000000
    
    rgb   #E8B858, #C87020, #703020, #000000
    rgb   #F8F888, #F8F8F8, #E80810, #000000

InteriorPalette16:: ; Kanalet
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #D0D000, #909000, #505000, #000000
    rgb   #3860F8, #303888, #6880E8, #000000
    rgb   #3860F8, #C87020, #703020, #000000
    rgb   #3860F8, #F83070, #900018, #000000
    
    rgb   #3860F8, #C87020, #703020, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

InteriorPalette17:: ; Kanalet sidescrolling
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #A0F8F8, #18E060, #084828, #100810
    rgb   #F8F8F8, #A88068, #600020, #000000
    rgb   #F8F888, #909038, #283818, #000000
    rgb   #18E060, #C87020, #703020, #100810
    
    rgb   #F8F888, #909038, #283818, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

InteriorPalette20:: ; Dream Shrine dreamworld
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #7890A0, #385870, #103058, #000000
    rgb   #808028, #20B048, #084828, #000000
    
    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #C80028, #500020, #000000

InteriorPalette18:: ; Dream Shrine bedside
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #7890A0, #385870, #103058, #000000
    rgb   #808028, #20B048, #084828, #000000

    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #10A840, #F8F888
    
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #7890A0, #385870, #103058, #000000
    rgb   #808028, #20B048, #084828, #000000
    
    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #F80828, #F8F888
    
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #B0C888, #709048, #305000, #000000
    rgb   #808028, #484800, #909830, #000000
    rgb   #7890A0, #385870, #103058, #000000
    rgb   #808028, #20B048, #084828, #000000
    
    rgb   #F8F888, #000000, #8888A0, #F8F888
    rgb   #F8F888, #000000, #1880F8, #F8F888

InteriorPalette19:: ; Seashell Mansion
    rgb   #F8F888, #20B048, #084828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000
    rgb   #F8F888, #B80028, #400020, #000000
    rgb   #F8F888, #C87020, #703020, #000000
    rgb   #381850, #3860F8, #303888, #000000
    rgb   #381850, #200038, #F80040, #000000
    rgb   #381850, #20B048, #105828, #000000
    rgb   #381850, #F8F800, #686800, #000000

    rgb   #381850, #20B048, #105828, #000000
    rgb   #F8F888, #9878A0, #381850, #000000

InteriorPalette1B:: ; Camera Shop
    rgb   #F8F888, #E8B858, #A86828, #000000
    rgb   #F0F8C0, #8888A0, #283050, #000000
    rgb   #F0F8C0, #F81858, #700028, #000000
    rgb   #F0F8C0, #C87020, #703020, #000000
    rgb   #A07810, #F8F8F8, #A07810, #000000
    rgb   #78D078, #20B048, #084828, #000000
    rgb   #E8B858, #B0C8F8, #2850F8, #000000
    rgb   #E8B858, #C87020, #703020, #000000
    
    rgb   #F8F8F8, #000000, #881888, #F858F8
    rgb   #F8F8F8, #000000, #8888A0, #F0F8C0





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
    dw Data_021_786E
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

Data_021_786E:
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
    rgb   #F8F8F8, #F8B030, #D80000, #000000
ELSE
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