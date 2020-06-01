; Code for the Photo album and printer

PhotoAlbumEntryPoint::
    call func_028_4033                          ; $4000: $CD $33 $40
    ld   a, [wGameplaySubtype]                  ; $4003: $FA $96 $DB
    ; TODO: label the different states of the photo album
    JP_TABLE                                    ; $4006: $C7
    dw JumpTable_028_40A7                       ; $4007 (jumpTable [0]) $A7 $40
    dw JumpTable_028_40D9                       ; $4009 (jumpTable [1]) $D9 $40
    dw JumpTable_028_408F                       ; $400B (jumpTable [2]) $8F $40
    dw JumpTable_028_40FB                       ; $400D (jumpTable [3]) $FB $40
    dw JumpTable_028_409B                       ; $400F (jumpTable [4]) $9B $40
    dw JumpTable_028_4218                       ; $4011 (jumpTable [5]) $18 $42
    dw JumpTable_028_4232                       ; $4013 (jumpTable [6]) $32 $42
    dw JumpTable_028_408F                       ; $4015 (jumpTable [7]) $8F $40
    dw JumpTable_028_43B2                       ; $4017 (jumpTable [8]) $B2 $43
    dw JumpTable_028_409B                       ; $4019 (jumpTable [9]) $9B $40
    dw JumpTable_028_4469                       ; $401B (jumpTable [10]) $69 $44
    ; Why does this one use the owl's theme?
    dw JumpTable_028_457E                       ; $401D (jumpTable [11]) $7E $45
    dw JumpTable_028_4C0E                       ; $401F (jumpTable [12]) $0E $4C
    dw JumpTable_028_4C38                       ; $4021 (jumpTable [13]) $38 $4C
    dw JumpTable_028_4C6C                       ; $4023 (jumpTable [14]) $6C $4C
    dw JumpTable_028_4CAD                       ; $4025 (jumpTable [15]) $AD $4C
    dw JumpTable_028_4CCE                       ; $4027 (jumpTable [16]) $CE $4C
    dw JumpTable_028_4D8C                       ; $4029 (jumpTable [17]) $8C $4D
    dw JumpTable_028_408F                       ; $402B (jumpTable [18]) $8F $40
    dw JumpTable_028_44AA                       ; $402D (jumpTable [19]) $AA $44

Data_028_402F::
    db   $40, $00

Data_028_4031::
    db   $01, $FF

func_028_4033::
    ld   a, [wGameplaySubtype]                  ; $4033: $FA $96 $DB
    cp   $0D                                    ; $4036: $FE $0D
    jr   c, .return_408E_28                     ; $4038: $38 $54

    cp   $11                                    ; $403A: $FE $11
    jr   nc, .return_408E_28                    ; $403C: $30 $50

    ld   b, $00                                 ; $403E: $06 $00
    ld   a, [$D1C8]                             ; $4040: $FA $C8 $D1
    and  %00000001                              ; $4043: $E6 $01
    jr   nz, .else_4064_28                      ; $4045: $20 $1D

    ld   a, [$D1CA]                             ; $4047: $FA $CA $D1
    ld   c, a                                   ; $404A: $4F
    ld   hl, Data_028_4031                      ; $404B: $21 $31 $40
    add  hl, bc                                 ; $404E: $09
    ld   a, [$D1C9]                             ; $404F: $FA $C9 $D1
    add  [hl]                                   ; $4052: $86
    ld   [$D1C9], a                             ; $4053: $EA $C9 $D1
    ld   hl, Data_028_402F                      ; $4056: $21 $2F $40
    add  hl, bc                                 ; $4059: $09
    cp   [hl]                                   ; $405A: $BE
    jr   nz, .else_4064_28                      ; $405B: $20 $07

    inc  c                                      ; $405D: $0C
    ld   a, c                                   ; $405E: $79
    and  %00000001                              ; $405F: $E6 $01
    ld   [$D1CA], a                             ; $4061: $EA $CA $D1
.else_4064_28:
    ld   hl, $D1C8                              ; $4064: $21 $C8 $D1
    inc  [hl]                                   ; $4067: $34
    ld   a, [hl]                                ; $4068: $7E

    ; for every eight frame, the next block of 40 bytes is used
    ; c = 40 * (a/8)
    and  %00011000                              ; $4069: $E6 $18
    ld   c, a                                   ; $406B: $4F
    sla  a                                      ; $406C: $CB $27
    sla  a                                      ; $406E: $CB $27
    add  c                                      ; $4070: $81
    ld   c, a                                   ; $4071: $4F

    ld   hl, Data_028_4DD1                      ; $4072: $21 $D1 $4D
    add  hl, bc                                 ; $4075: $09
    ld   de, wOAMBuffer                         ; $4076: $11 $00 $C0
    ld   c, $0A                                 ; $4079: $0E $0A
.loop_407B_28:
    ldi  a, [hl]                                ; $407B: $2A
    ld   [de], a                                ; $407C: $12
    inc  de                                     ; $407D: $13
    ld   a, [$D1C9]                             ; $407E: $FA $C9 $D1
    add  [hl]                                   ; $4081: $86
    ld   [de], a                                ; $4082: $12
    inc  hl                                     ; $4083: $23
    inc  de                                     ; $4084: $13
    ldi  a, [hl]                                ; $4085: $2A
    ld   [de], a                                ; $4086: $12
    inc  de                                     ; $4087: $13
    ldi  a, [hl]                                ; $4088: $2A
    ld   [de], a                                ; $4089: $12
    inc  de                                     ; $408A: $13
    dec  c                                      ; $408B: $0D
    jr   nz, .loop_407B_28                      ; $408C: $20 $ED

.return_408E_28:
    ret                                         ; $408E: $C9


JumpTable_028_408F:
    call func_1A22                             ; $408F: JumpTable_028_408F $CD $22 $1A
    ld   a, [$C16B]                             ; $4092: JumpTable_028_408F $FA $6B $C1
    cp   $04                                    ; $4095: JumpTable_028_408F $FE $04
    ret  nz                                     ; $4097: JumpTable_028_408F $C0

    jp   func_028_44DB                          ; $4098: JumpTable_028_408F $C3 $DB $44

JumpTable_028_409B:
    call func_1A39                             ; $409B: JumpTable_028_409B $CD $39 $1A
    ld   a, [$C16B]                             ; $409E: JumpTable_028_409B $FA $6B $C1
    cp   $04                                    ; $40A1: JumpTable_028_409B $FE $04
    ret  nz                                     ; $40A3: JumpTable_028_409B $C0

    jp   func_028_44DB                          ; $40A4: JumpTable_028_409B $C3 $DB $44

JumpTable_028_40A7:
    ld   bc, $6B                                ; $40A7: JumpTable_028_40A7 $01 $6B $00
    ld   hl, $D168                              ; $40AA: JumpTable_028_40A7 $21 $68 $D1
.loop_40AD_28:
    xor  a                                      ; $40AD: JumpTable_028_40A7 $AF
    ldi  [hl], a                                ; $40AE: JumpTable_028_40A7 $22
    dec  bc                                     ; $40AF: JumpTable_028_40A7 $0B
    ld   a, c                                   ; $40B0: JumpTable_028_40A7 $79
    or   b                                      ; $40B1: JumpTable_028_40A7 $B0
    jr   nz, .loop_40AD_28                      ; $40B2: JumpTable_028_40A7 $20 $F9

    ld   hl, Data_028_4241                      ; $40B4: JumpTable_028_40A7 $21 $41 $42
    ld   a, [hl]                                ; $40B7: JumpTable_028_40A7 $7E
    ld   [$D1CD], a                             ; $40B8: JumpTable_028_40A7 $EA $CD $D1
    ld   hl, Data_028_424D                      ; $40BB: JumpTable_028_40A7 $21 $4D $42
    ld   a, [hl]                                ; $40BE: JumpTable_028_40A7 $7E
    ld   [$D1CE], a                             ; $40BF: JumpTable_028_40A7 $EA $CE $D1
    ld   a, $01                                 ; $40C2: JumpTable_028_40A7 $3E $01
    ld   [$D1D1], a                             ; $40C4: JumpTable_028_40A7 $EA $D1 $D1
    ld   a, $03                                 ; $40C7: JumpTable_028_40A7 $3E $03
    ldh  [hWindowYUnused], a                    ; $40C9: JumpTable_028_40A7 $E0 $A9
    ld   a, $30                                 ; $40CB: JumpTable_028_40A7 $3E $30
    ldh  [hWindowXUnused], a                    ; $40CD: JumpTable_028_40A7 $E0 $AA
    call func_028_47CB                          ; $40CF: JumpTable_028_40A7 $CD $CB $47
    ld   a, $09                                 ; $40D2: JumpTable_028_40A7 $3E $09
    ld   [rIE], a                               ; $40D4: JumpTable_028_40A7 $E0 $FF
    jp   func_028_44DB                          ; $40D6: JumpTable_028_40A7 $C3 $DB $44

JumpTable_028_40D9:
    xor  a                                      ; $40D9: JumpTable_028_40D9 $AF
    ld   [$C16B], a                             ; $40DA: JumpTable_028_40D9 $EA $6B $C1
    call func_028_45CD                          ; $40DD: JumpTable_028_40D9 $CD $CD $45
    jp   func_028_44DB                          ; $40E0: JumpTable_028_40D9 $C3 $DB $44

Data_028_40E3::
    db   $E1, $98, $E5, $98, $EC, $98, $F0, $98 ; $40E3 |........|
    db   $61, $99, $65, $99, $6C, $99, $70, $99 ; $40EB |a.e.l.p.|
    db   $E1, $99, $E5, $99, $EC, $99, $F0, $99 ; $40F3 |........|

JumpTable_028_40FB:
    call LCDOff                                 ; $40FB: JumpTable_028_40FB $CD $CF $28

    ld   a, BANK(PrintUI2Tiles)                 ; $40FE: JumpTable_028_40FB $3E $35
    ld   bc, TILE_SIZE * $20                    ; $4100: JumpTable_028_40FB $01 $00 $02
    ld   hl, PrintUI2Tiles                      ; $4103: JumpTable_028_40FB $21 $00 $57
    ld   de, vTiles2                            ; $4106: JumpTable_028_40FB $11 $00 $90
    call CopyData_trampoline                    ; $4109: JumpTable_028_40FB $CD $5D $0B

    ld   a, BANK(Overworld1Tiles)               ; $410C: JumpTable_028_40FB $3E $0C
    call AdjustBankNumberForGBC                 ; $410E: JumpTable_028_40FB $CD $0B $0B
    ld   bc, TILE_SIZE * $4                     ; $4111: JumpTable_028_40FB $01 $40 $00
    ld   hl, Overworld1Tiles + $8C0             ; $4114: JumpTable_028_40FB $21 $C0 $57
    ld   de, vTiles2 + $7C0                     ; $4117: JumpTable_028_40FB $11 $C0 $97
    call CopyData_trampoline                    ; $411A: JumpTable_028_40FB $CD $5D $0B

    ld   a, BANK(InventoryEquipmentItemsTiles)  ; $411D: JumpTable_028_40FB $3E $0C
    call AdjustBankNumberForGBC                 ; $411F: JumpTable_028_40FB $CD $0B $0B
    ld   bc, TILE_SIZE * $30                    ; $4122: JumpTable_028_40FB $01 $00 $03
    ld   hl, InventoryEquipmentItemsTiles + $200                 ; $4125: JumpTable_028_40FB $21 $00 $4A
    ld   de, vTiles1 + $200                     ; $4128: JumpTable_028_40FB $11 $00 $8A
    call CopyData_trampoline                    ; $412B: JumpTable_028_40FB $CD $5D $0B

    ld   a, BANK(PhotoAlbumTiles)               ; $412E: JumpTable_028_40FB $3E $35
    ld   bc, TILE_SIZE * $20                    ; $4130: JumpTable_028_40FB $01 $00 $02
    ld   hl, PhotoAlbumTiles + $300             ; $4133: JumpTable_028_40FB $21 $00 $6B
    ld   de, vTiles1 + $500                     ; $4136: JumpTable_028_40FB $11 $00 $8D
    call CopyData_trampoline                    ; $4139: JumpTable_028_40FB $CD $5D $0B

    ld   a, BANK(PrintUI1Tiles)                 ; $413C: JumpTable_028_40FB $3E $35
    ld   bc, TILE_SIZE * $50                    ; $413E: JumpTable_028_40FB $01 $00 $05
    ld   hl, PrintUI1Tiles                      ; $4141: JumpTable_028_40FB $21 $00 $52
    ld   de, vTiles0                            ; $4144: JumpTable_028_40FB $11 $00 $80
    call CopyData_trampoline                    ; $4147: JumpTable_028_40FB $CD $5D $0B

    ld   a, BANK(PrintUI2Tiles)
    ld   bc, TILE_SIZE * $8
    ld   hl, PrintUI2Tiles + $200
    ld   de, vTiles0 + $500
    call CopyData_trampoline

    ld   a, BANK(@)                             ; $414A: JumpTable_028_40FB $3E $28
    ldh  [hScratchF], a                         ; $414C: JumpTable_028_40FB $E0 $E6
    ld   a, BANK(PhotoAlbumBackgroundMap)       ; $414E: JumpTable_028_40FB $3E $28
    ld   hl, PhotoAlbumBackgroundMap            ; $4150: JumpTable_028_40FB $21 $E0 $79
    call CopyBGMapFromBank                      ; $4153: JumpTable_028_40FB $CD $69 $0B

    call func_028_4185                          ; $4156: JumpTable_028_40FB $CD $85 $41
    call func_028_41FC                          ; $4159: JumpTable_028_40FB $CD $FC $41

    ld   bc, $80                                ; $415C: JumpTable_028_40FB $01 $80 $00
    ld   hl, PhotoAlbumPalettes                      ; $415F: JumpTable_028_40FB $21 $B0 $7C
    ld   de, $DC10                              ; $4162: JumpTable_028_40FB $11 $10 $DC
    call func_028_4176                          ; $4165: JumpTable_028_40FB $CD $76 $41
                                                ; $4168: JumpTable_028_40FB $3E $C7
    ld   a, $C7
    ld   [wLCDControl], a                       ; $416A: JumpTable_028_40FB $EA $FD $D6
    ld   [rLCDC], a                             ; $416D: JumpTable_028_40FB $E0 $40
    xor  a                                      ; $416F: JumpTable_028_40FB $AF
    ld   [$C16B], a                             ; $4170: JumpTable_028_40FB $EA $6B $C1
    jp   func_028_44DB                          ; $4173: JumpTable_028_40FB $C3 $DB $44

func_028_4176::
    ldh  a, [hIsGBC]                            ; $4176: $F0 $FE
    and  a                                      ; $4178: $A7
    ret  z                                      ; $4179: $C8

    ld   a, $02                                 ; $417A: $3E $02
    ld   [rSVBK], a                             ; $417C: $E0 $70
    call CopyData                               ; $417E: $CD $14 $29
    xor  a                                      ; $4181: $AF
    ld   [rSVBK], a                             ; $4182: $E0 $70
    ret                                         ; $4184: $C9


func_028_4185::
    ld   a, [ROM_DebugTool3]                    ; $4185: $FA $05 $00
    and  a                                      ; $4188: $A7
    jr   z, .else_4195_28                       ; $4189: $28 $0A

    ld   a, $FF                                 ; $418B: $3E $FF
    ld   [$DC0C], a                             ; $418D: $EA $0C $DC
    ld   a, $0F                                 ; $4190: $3E $0F
    ld   [$DC0D], a                             ; $4192: $EA $0D $DC
.else_4195_28:
    ld   bc, $01                                ; $4195: $01 $01 $00
.loop_4198_28:
    ld   hl, Data_028_4265                      ; $4198: $21 $65 $42
    add  hl, bc                                 ; $419B: $09
    ld   a, [hl]                                ; $419C: $7E
    ld   e, a                                   ; $419D: $5F
    ld   d, $00                                 ; $419E: $16 $00
    ld   hl, $DC0C                              ; $41A0: $21 $0C $DC
    add  hl, de                                 ; $41A3: $19
    ld   a, [hl]                                ; $41A4: $7E
    ld   hl, Data_028_4259                      ; $41A5: $21 $59 $42
    add  hl, bc                                 ; $41A8: $09
    and  [hl]                                   ; $41A9: $A6
    jr   z, .else_41F5_28                       ; $41AA: $28 $49

    ld   d, $00                                 ; $41AC: $16 $00
    ld   hl, Data_028_40E3                      ; $41AE: $21 $E3 $40
    ld   a, c                                   ; $41B1: $79
    sla  a                                      ; $41B2: $CB $27
    ld   e, a                                   ; $41B4: $5F
    add  hl, de                                 ; $41B5: $19
    ldi  a, [hl]                                ; $41B6: $2A
    ld   e, a                                   ; $41B7: $5F
    ld   a, [hl]                                ; $41B8: $7E
    ld   h, a                                   ; $41B9: $67
    ld   l, e                                   ; $41BA: $6B
    push hl                                     ; $41BB: $E5
    ld   a, $02                                 ; $41BC: $3E $02
    ldi  [hl], a                                ; $41BE: $22
    ld   a, $03                                 ; $41BF: $3E $03
    ldi  [hl], a                                ; $41C1: $22
    ld   a, $04                                 ; $41C2: $3E $04
    ld   [hl], a                                ; $41C4: $77
    ld   a, l                                   ; $41C5: $7D
    add  $1E                                    ; $41C6: $C6 $1E
    ld   l, a                                   ; $41C8: $6F
    ld   a, h                                   ; $41C9: $7C
    adc  $00                                    ; $41CA: $CE $00
    ld   h, a                                   ; $41CC: $67
    ld   a, $0A                                 ; $41CD: $3E $0A
    ldi  [hl], a                                ; $41CF: $22
    ld   a, $0B                                 ; $41D0: $3E $0B
    ldi  [hl], a                                ; $41D2: $22
    ld   a, $0C                                 ; $41D3: $3E $0C
    ld   [hl], a                                ; $41D5: $77
    pop  hl                                     ; $41D6: $E1
    ldh  a, [hIsGBC]                            ; $41D7: $F0 $FE
    and  a                                      ; $41D9: $A7
    jr   z, .else_41F5_28                       ; $41DA: $28 $19

    ld   a, $01                                 ; $41DC: $3E $01
    ld   [rVBK], a                              ; $41DE: $E0 $4F
    ld   a, $02                                 ; $41E0: $3E $02
    ldi  [hl], a                                ; $41E2: $22
    ldi  [hl], a                                ; $41E3: $22
    ld   [hl], a                                ; $41E4: $77
    ld   a, l                                   ; $41E5: $7D
    add  $1E                                    ; $41E6: $C6 $1E
    ld   l, a                                   ; $41E8: $6F
    ld   a, h                                   ; $41E9: $7C
    adc  $00                                    ; $41EA: $CE $00
    ld   h, a                                   ; $41EC: $67
    ld   a, $02                                 ; $41ED: $3E $02
    ldi  [hl], a                                ; $41EF: $22
    ldi  [hl], a                                ; $41F0: $22
    ld   [hl], a                                ; $41F1: $77
    xor  a                                      ; $41F2: $AF
    ld   [rVBK], a                              ; $41F3: $E0 $4F
.else_41F5_28:
    inc  c                                      ; $41F5: $0C
    ld   a, c                                   ; $41F6: $79
    cp   $0C                                    ; $41F7: $FE $0C
    jr   nz, .loop_4198_28                      ; $41F9: $20 $9D

    ret                                         ; $41FB: $C9


func_028_41FC::
    ld   a, [$D1D1]                             ; $41FC: $FA $D1 $D1
    and  a                                      ; $41FF: $A7
    ret  z                                      ; $4200: $C8

    ld   hl, vBGMap0 + $22                      ; $4201: $21 $22 $98
    ld   d, $7E                                 ; $4204: $16 $7E
.loop_4206_28:
    ld   a, d                                   ; $4206: $7A
    ldi  [hl], a                                ; $4207: $22
    ld   a, l                                   ; $4208: $7D
    and  %00011111                              ; $4209: $E6 $1F
    cp   $12                                    ; $420B: $FE $12
    jr   nz, .loop_4206_28                      ; $420D: $20 $F7

    ld   a, l                                   ; $420F: $7D
    cp   $92                                    ; $4210: $FE $92
    ret  z                                      ; $4212: $C8

    add  $10                                    ; $4213: $C6 $10
    ld   l, a                                   ; $4215: $6F
    jr   .loop_4206_28                          ; $4216: $18 $EE

JumpTable_028_4218:
    ld   a, [$D1D1]                             ; $4218: JumpTable_028_4218 $FA $D1 $D1
    and  a                                      ; $421B: JumpTable_028_4218 $A7
    jr   z, .else_422F_28                       ; $421C: JumpTable_028_4218 $28 $11

    xor  a                                      ; $421E: JumpTable_028_4218 $AF
    ld   [$D1D1], a                             ; $421F: JumpTable_028_4218 $EA $D1 $D1
    ld   a, $2C                                 ; $4222: JumpTable_028_4218 $3E $2C
    ld   [$C173], a                             ; $4224: JumpTable_028_4218 $EA $73 $C1
    call OpenDialogInTable2                     ; $4227: JumpTable_028_4218 $CD $7C $23
    ld   a, $01                                 ; $422A: JumpTable_028_4218 $3E $01
    ld   [$C19F], a                             ; $422C: JumpTable_028_4218 $EA $9F $C1
.else_422F_28:
    jp   func_028_44DB                          ; $422F: JumpTable_028_4218 $C3 $DB $44

JumpTable_028_4232:
    ld   a, [$C19F]                             ; $4232: JumpTable_028_4232 $FA $9F $C1
    and  a                                      ; $4235: JumpTable_028_4232 $A7
    ret  nz                                     ; $4236: JumpTable_028_4232 $C0

    call func_028_427D                          ; $4237: JumpTable_028_4232 $CD $7D $42
    call func_028_433A                          ; $423A: JumpTable_028_4232 $CD $3A $43
    call func_028_4385                          ; $423D: JumpTable_028_4232 $CD $85 $43
    ret                                         ; $4240: JumpTable_028_4232 $C9

Data_028_4241::
    db   $20, $40, $78, $98, $20, $40, $78, $98 ; $4241 | @x. @x.|
    db   $20, $40, $78, $98

Data_028_424D::
    db   $50, $50, $50, $50, $70, $70, $70, $70   ; $424D
    db   $90, $90, $90, $90

Data_028_4259::
    db   $01, $02, $40, $80
    db   $04, $08, $01, $02, $10, $20, $04, $08   ; $425D

Data_028_4265::
    db   $00, $00, $00, $00, $00, $00, $01, $01   ; $4265
    db   $00, $00, $01, $01

Data_028_4271::
    db   $00, $01, $06, $07   ; $426D
    db   $02, $03, $08, $09, $04, $05, $0A, $0B   ; $4275

func_028_427D::
    ld   a, [$D1CF]                             ; $427D: $FA $CF $D1
    and  a                                      ; $4280: $A7
    ret  nz                                     ; $4281: $C0

    ldh  a, [hJoypadState]                      ; $4282: $F0 $CC
    and  a                                      ; $4284: $A7
    ret  z                                      ; $4285: $C8

    bit  5, a                                   ; $4286: $CB $6F
    jr   z, .else_4298_28                       ; $4288: $28 $0E

    ld   a, JINGLE_VALIDATE                     ; $428A: $3E $13
    ldh  [hJingle], a                           ; $428C: $E0 $F2
    ld   a, $12                                 ; $428E: $3E $12
    ld   [wGameplaySubtype], a                  ; $4290: $EA $96 $DB
    xor  a                                      ; $4293: $AF
    ld   [$C16B], a                             ; $4294: $EA $6B $C1
    ret                                         ; $4297: $C9


.else_4298_28:
    bit  1, a                                   ; $4298: $CB $4F
    jr   z, .else_42A9_28                       ; $429A: $28 $0D

    ld   a, [$D1CC]                             ; $429C: $FA $CC $D1
    and  a                                      ; $429F: $A7
    jr   z, .else_42A5_28                       ; $42A0: $28 $03

    dec  a                                      ; $42A2: $3D
    jr   .func_028_42E0                         ; $42A3: $18 $3B

.else_42A5_28:
    ld   a, $0B                                 ; $42A5: $3E $0B
    jr   .func_028_42E0                         ; $42A7: $18 $37

.else_42A9_28:
    bit  0, a                                   ; $42A9: $CB $47
    jr   z, .else_42BA_28                       ; $42AB: $28 $0D

    ld   a, [$D1CC]                             ; $42AD: $FA $CC $D1
    cp   $0B                                    ; $42B0: $FE $0B
    jr   z, .else_42B7_28                       ; $42B2: $28 $03

    inc  a                                      ; $42B4: $3C
    jr   .func_028_42E0                         ; $42B5: $18 $29

.else_42B7_28:
    xor  a                                      ; $42B7: $AF
    jr   .func_028_42E0                         ; $42B8: $18 $26

.else_42BA_28:
    bit  2, a                                   ; $42BA: $CB $57
    jr   z, .else_42CD_28                       ; $42BC: $28 $0F

    ld   a, [$D1CC]                             ; $42BE: $FA $CC $D1
    cp   $04                                    ; $42C1: $FE $04
    jr   c, .else_42C9_28                       ; $42C3: $38 $04

    sub  $04                                    ; $42C5: $D6 $04
    jr   .func_028_42E0                         ; $42C7: $18 $17

.else_42C9_28:
    add  $08                                    ; $42C9: $C6 $08
    jr   .func_028_42E0                         ; $42CB: $18 $13

.else_42CD_28:
    bit  3, a                                   ; $42CD: $CB $5F
    jr   z, .else_42FB_28                       ; $42CF: $28 $2A

    ld   a, [$D1CC]                             ; $42D1: $FA $CC $D1
    cp   $08                                    ; $42D4: $FE $08
    jr   nc, .else_42DC_28                      ; $42D6: $30 $04

    add  $04                                    ; $42D8: $C6 $04
    jr   .func_028_42E0                         ; $42DA: $18 $04

.else_42DC_28:
    sub  $08                                    ; $42DC: $D6 $08
    jr   .func_028_42E0                         ; $42DE: $18 $00

.func_028_42E0::
    ld   [$D1CC], a                             ; $42E0: $EA $CC $D1
    ld   d, $00                                 ; $42E3: $16 $00
    ld   e, a                                   ; $42E5: $5F
    ld   hl, Data_028_4241                      ; $42E6: $21 $41 $42
    add  hl, de                                 ; $42E9: $19
    ld   a, [hl]                                ; $42EA: $7E
    ld   [$D1CD], a                             ; $42EB: $EA $CD $D1
    ld   hl, Data_028_424D                      ; $42EE: $21 $4D $42
    add  hl, de                                 ; $42F1: $19
    ld   a, [hl]                                ; $42F2: $7E
    ld   [$D1CE], a                             ; $42F3: $EA $CE $D1
    ld   a, JINGLE_MOVE_SELECTION               ; $42F6: $3E $0A
    ldh  [hJingle], a                           ; $42F8: $E0 $F2
    ret                                         ; $42FA: $C9


.else_42FB_28:
    ldh  a, [hJoypadState]                      ; $42FB: $F0 $CC
    bit  4, a                                   ; $42FD: $CB $67
    ret  z                                      ; $42FF: $C8

    ld   b, $00                                 ; $4300: $06 $00
    ld   a, [$D1CC]                             ; $4302: $FA $CC $D1
    ld   c, a                                   ; $4305: $4F
    ld   d, a                                   ; $4306: $57
    ld   hl, Data_028_4265                      ; $4307: $21 $65 $42
    add  hl, bc                                 ; $430A: $09
    ld   a, [hl]                                ; $430B: $7E
    ld   c, a                                   ; $430C: $4F
    ld   hl, $DC0C                              ; $430D: $21 $0C $DC
    add  hl, bc                                 ; $4310: $09
    ld   a, [hl]                                ; $4311: $7E
    ld   c, d                                   ; $4312: $4A
    ld   hl, Data_028_4259                      ; $4313: $21 $59 $42
    add  hl, bc                                 ; $4316: $09
    and  [hl]                                   ; $4317: $A6
    jr   nz, .else_4322_28                      ; $4318: $20 $08

    ld   a, JINGLE_WRONG_ANSWER                 ; $431A: $3E $1D
    ldh  [hJingle], a                           ; $431C: $E0 $F2
    ld   a, $FF                                 ; $431E: $3E $FF
    jr   .func_028_432B                         ; $4320: $18 $09

.else_4322_28:
    ld   a, JINGLE_VALIDATE                     ; $4322: $3E $13
    ldh  [hJingle], a                           ; $4324: $E0 $F2
    ld   hl, Data_028_4271                      ; $4326: $21 $71 $42
    add  hl, bc                                 ; $4329: $09
    ld   a, [hl]                                ; $432A: $7E
.func_028_432B::
    ld   [$D1CB], a                             ; $432B: $EA $CB $D1
    ld   hl, $D1CF                              ; $432E: $21 $CF $D1
    inc  [hl]                                   ; $4331: $34
    xor  a                                      ; $4332: $AF
    ld   [$D1D0], a                             ; $4333: $EA $D0 $D1
    ret                                         ; $4336: $C9

Data_028_4337::
    db   $0A, $08, $08                          ; $4337 |...|

func_028_433A::
    ld   a, [$D1CF]                             ; $433A: $FA $CF $D1
    and  a                                      ; $433D: $A7
    ret  z                                      ; $433E: $C8

    ld   d, $00                                 ; $433F: $16 $00
    ld   e, a                                   ; $4341: $5F
    ld   hl, Data_028_4337                      ; $4342: $21 $37 $43
    add  hl, de                                 ; $4345: $19
    ld   a, [$D1D0]                             ; $4346: $FA $D0 $D1
    cp   [hl]                                   ; $4349: $BE
    jr   z, .else_4351_28                       ; $434A: $28 $05

    inc  a                                      ; $434C: $3C
    ld   [$D1D0], a                             ; $434D: $EA $D0 $D1
    ret                                         ; $4350: $C9


.else_4351_28:
    xor  a                                      ; $4351: $AF
    ld   [$D1D0], a                             ; $4352: $EA $D0 $D1
    ld   hl, $D1CF                              ; $4355: $21 $CF $D1
    inc  [hl]                                   ; $4358: $34
    ld   a, [hl]                                ; $4359: $7E
    cp   $03                                    ; $435A: $FE $03
    ret  nz                                     ; $435C: $C0

    xor  a                                      ; $435D: $AF
    ld   [$D1CF], a                             ; $435E: $EA $CF $D1
    ld   [$C16B], a                             ; $4361: $EA $6B $C1
    ld   a, [$D1CB]                             ; $4364: $FA $CB $D1
    cp   $FF                                    ; $4367: $FE $FF
    ret  z                                      ; $4369: $C8

    jp   func_028_44DB                          ; $436A: $C3 $DB $44

Data_028_436D::
    db   $00, $00, $40, $04, $00, $08, $42, $04 ; $436D |..@...B.|
    db   $01, $01, $40, $04, $01, $09, $42, $04 ; $4375 |..@...B.|
    db   $03, $02, $40, $04, $03, $0A, $42, $04 ; $437D |..@...B.|

func_028_4385::
    ld   a, [$D1CF]                             ; $4385: $FA $CF $D1
    sla  a                                      ; $4388: $CB $27
    sla  a                                      ; $438A: $CB $27
    sla  a                                      ; $438C: $CB $27
    ld   e, a                                   ; $438E: $5F
    ld   d, $00                                 ; $438F: $16 $00
    ld   hl, Data_028_436D                      ; $4391: $21 $6D $43
    add  hl, de                                 ; $4394: $19
    ld   de, wOAMBuffer                         ; $4395: $11 $00 $C0
    ld   c, $02                                 ; $4398: $0E $02
.loop_439A_28:
    ld   a, [$D1CE]                             ; $439A: $FA $CE $D1
    add  [hl]                                   ; $439D: $86
    ld   [de], a                                ; $439E: $12
    inc  de                                     ; $439F: $13
    inc  hl                                     ; $43A0: $23
    ld   a, [$D1CD]                             ; $43A1: $FA $CD $D1
    add  [hl]                                   ; $43A4: $86
    ld   [de], a                                ; $43A5: $12
    inc  de                                     ; $43A6: $13
    inc  hl                                     ; $43A7: $23
    ldi  a, [hl]                                ; $43A8: $2A
    ld   [de], a                                ; $43A9: $12
    inc  de                                     ; $43AA: $13
    ldi  a, [hl]                                ; $43AB: $2A
    ld   [de], a                                ; $43AC: $12
    inc  de                                     ; $43AD: $13
    dec  c                                      ; $43AE: $0D
    jr   nz, .loop_439A_28                      ; $43AF: $20 $E9

    ret                                         ; $43B1: $C9


JumpTable_028_43B2:
    call LCDOff                                 ; $43B2: JumpTable_028_43B2 $CD $CF $28
    call func_028_43CC                          ; $43B5: JumpTable_028_43B2 $CD $CC $43
    call func_028_4411                          ; $43B8: JumpTable_028_43B2 $CD $11 $44
    call func_028_442C                          ; $43BB: JumpTable_028_43B2 $CD $2C $44
                                                ; $43BE: JumpTable_028_43B2 $3E $C7
    ld   a, $C7
    ld   [wLCDControl], a                       ; $43C0: JumpTable_028_43B2 $EA $FD $D6
    ld   [rLCDC], a                             ; $43C3: JumpTable_028_43B2 $E0 $40
    xor  a                                      ; $43C5: JumpTable_028_43B2 $AF
    ld   [$C16B], a                             ; $43C6: JumpTable_028_43B2 $EA $6B $C1
    jp   func_028_44DB                          ; $43C9: JumpTable_028_43B2 $C3 $DB $44

func_028_43CC::
    ld   a, [$D1CB]                             ; $43CC: $FA $CB $D1
    and  a                                      ; $43CF: $A7
    jr   nz, .else_43DB_28                      ; $43D0: $20 $09

    ld   a, [$DC0D]                             ; $43D2: $FA $0D $DC
    and  %10000000                              ; $43D5: $E6 $80
    jr   z, .else_43DB_28                       ; $43D7: $28 $02

    ld   a, $0C                                 ; $43D9: $3E $0C
.else_43DB_28:
    ld   b, a                                   ; $43DB: $47
    sla  a                                      ; $43DC: $CB $27
    add  b                                      ; $43DE: $80
    ld   d, $00                                 ; $43DF: $16 $00
    ld   e, a                                   ; $43E1: $5F
    ld   hl, Data_028_44E0                      ; $43E2: $21 $E0 $44
    add  hl, de                                 ; $43E5: $19
    push de                                     ; $43E6: $D5
    ldi  a, [hl]                                ; $43E7: $2A
    ld   c, a                                   ; $43E8: $4F
    ld   [$D168], a                             ; $43E9: $EA $68 $D1
    ldi  a, [hl]                                ; $43EC: $2A
    ld   b, a                                   ; $43ED: $47
    ld   [$D169], a                             ; $43EE: $EA $69 $D1
    ld   a, [hl]                                ; $43F1: $7E
    ld   [$D16A], a                             ; $43F2: $EA $6A $D1
    ld   h, b                                   ; $43F5: $60
    ld   l, c                                   ; $43F6: $69
    push hl                                     ; $43F7: $E5
    ld   bc, $800                               ; $43F8: $01 $00 $08
    ld   de, $9000                              ; $43FB: $11 $00 $90
    call CopyData_trampoline                    ; $43FE: $CD $5D $0B
    pop  hl                                     ; $4401: $E1
    ld   bc, $800                               ; $4402: $01 $00 $08
    add  hl, bc                                 ; $4405: $09
    ld   de, $8800                              ; $4406: $11 $00 $88
    ld   a, [$D16A]                             ; $4409: $FA $6A $D1
    call CopyData_trampoline                    ; $440C: $CD $5D $0B
    pop  de                                     ; $440F: $D1
    ret                                         ; $4410: $C9


func_028_4411::
    ld   hl, Data_028_4507                      ; $4411: $21 $07 $45
    add  hl, de                                 ; $4414: $19
    ldi  a, [hl]                                ; $4415: $2A
    ld   c, a                                   ; $4416: $4F
    ldi  a, [hl]                                ; $4417: $2A
    ld   b, a                                   ; $4418: $47
    ld   a, BANK(@)                             ; $4419: $3E $28
    ldh  [hScratchF], a                         ; $441B: $E0 $E6
    ld   a, [hl]                                ; $441D: $7E
    ld   h, b                                   ; $441E: $60
    ld   l, c                                   ; $441F: $69
    call CopyBGMapFromBank                      ; $4420: $CD $69 $0B
    ret                                         ; $4423: $C9

Data_028_4424::
    db   $7F, $5B, $14, $2E, $4E, $19, $A9, $08 ; $4424 |.[..N...|

func_028_442C::
    ld   hl, Data_028_4424                      ; $442C: $21 $24 $44
    ld   bc, $08                                ; $442F: $01 $08 $00
    ld   de, $DC10                              ; $4432: $11 $10 $DC
    call func_028_4176                          ; $4435: $CD $76 $41
    ret                                         ; $4438: $C9

Data_028_4439::
    db   $78, $60, $0E, $03
    db   $78, $68, $0E, $23
    db   $78, $70, $00, $03
    db   $78, $78, $02, $03
    db   $78, $80, $04, $03
    db   $78, $88, $06, $03
    db   $78, $90, $08, $03
    db   $78, $98, $0A, $03
    db   $88, $60, $10, $04
    db   $88, $68, $12, $04
    db   $88, $70, $14, $04
    db   $88, $78, $16, $04
    db   $88, $80, $18, $04
    db   $88, $88, $1A, $04
    db   $88, $90, $1C, $04

JumpTable_028_4469:
    ldh  a, [hJoypadState]                      ; $4469: JumpTable_028_4469 $F0 $CC
    bit  5, a                                   ; $446B: JumpTable_028_4469 $CB $6F
    jr   z, .else_447D_28                       ; $446D: JumpTable_028_4469 $28 $0E

    ld   a, JINGLE_VALIDATE                     ; $446F: JumpTable_028_4469 $3E $13
    ldh  [hJingle], a                           ; $4471: JumpTable_028_4469 $E0 $F2
    ld   a, $01                                 ; $4473: JumpTable_028_4469 $3E $01
    ld   [wGameplaySubtype], a                  ; $4475: JumpTable_028_4469 $EA $96 $DB
    xor  a                                      ; $4478: JumpTable_028_4469 $AF
    ld   [$C16B], a                             ; $4479: JumpTable_028_4469 $EA $6B $C1
    ret                                         ; $447C: JumpTable_028_4469 $C9


.else_447D_28:
    ldh  a, [hJoypadState]                      ; $447D: JumpTable_028_4469 $F0 $CC
    bit  4, a                                   ; $447F: JumpTable_028_4469 $CB $67
    jr   z, .else_4492_28                       ; $4481: JumpTable_028_4469 $28 $0F

    ld   a, JINGLE_VALIDATE                     ; $4483: JumpTable_028_4469 $3E $13
    ldh  [hJingle], a                           ; $4485: JumpTable_028_4469 $E0 $F2
    xor  a                                      ; $4487: JumpTable_028_4469 $AF
    ld   [$D181], a                             ; $4488: JumpTable_028_4469 $EA $81 $D1
    ld   a, $10                                 ; $448B: JumpTable_028_4469 $3E $10
    ldh  [hFrameCounter], a                     ; $448D: JumpTable_028_4469 $E0 $E7
    call func_028_44DB                          ; $448F: JumpTable_028_4469 $CD $DB $44
.else_4492_28:
    ld   hl, Data_028_4439                      ; $4492: JumpTable_028_4469 $21 $39 $44
    ld   de, wOAMBuffer                         ; $4495: JumpTable_028_4469 $11 $00 $C0
    ld   c, $0f                                 ; $4498: JumpTable_028_4469 $0E $0C
.loop_449A_28:
    ldi  a, [hl]                                ; $449A: JumpTable_028_4469 $2A
    ld   [de], a                                ; $449B: JumpTable_028_4469 $12
    inc  de                                     ; $449C: JumpTable_028_4469 $13
    ldi  a, [hl]                                ; $449D: JumpTable_028_4469 $2A
    ld   [de], a                                ; $449E: JumpTable_028_4469 $12
    inc  de                                     ; $449F: JumpTable_028_4469 $13
    ldi  a, [hl]                                ; $44A0: JumpTable_028_4469 $2A
    ld   [de], a                                ; $44A1: JumpTable_028_4469 $12
    inc  de                                     ; $44A2: JumpTable_028_4469 $13
    ldi  a, [hl]                                ; $44A3: JumpTable_028_4469 $2A
    ld   [de], a                                ; $44A4: JumpTable_028_4469 $12
    inc  de                                     ; $44A5: JumpTable_028_4469 $13
    dec  c                                      ; $44A6: JumpTable_028_4469 $0D
    jr   nz, .loop_449A_28                      ; $44A7: JumpTable_028_4469 $20 $F1

    ret                                         ; $44A9: JumpTable_028_4469 $C9


JumpTable_028_44AA:
    call LCDOff                                 ; $44AA: JumpTable_028_44AA $CD $CF $28
    ld   a, $28                                 ; $44AD: JumpTable_028_44AA $3E $28
    call LoadBaseTiles_trampoline               ; $44AF: JumpTable_028_44AA $CD $BE $0B
    ldh  a, [hLinkPositionX]                    ; $44B2: JumpTable_028_44AA $F0 $98
    ld   [$DB9D], a                             ; $44B4: JumpTable_028_44AA $EA $9D $DB
    ldh  a, [hLinkPositionY]                    ; $44B7: JumpTable_028_44AA $F0 $99
    ld   [$DB9E], a                             ; $44B9: JumpTable_028_44AA $EA $9E $DB
    ld   a, GAMEPLAY_WORLD                      ; $44BC: JumpTable_028_44AA $3E $0B
    ld   [wGameplayType], a                     ; $44BE: JumpTable_028_44AA $EA $95 $DB
    xor  a                                      ; $44C1: JumpTable_028_44AA $AF
    ld   [wGameplaySubtype], a                  ; $44C2: JumpTable_028_44AA $EA $96 $DB
    ld   a, $18                                 ; $44C5: JumpTable_028_44AA $3E $18
    ld   [$DE05], a                             ; $44C7: JumpTable_028_44AA $EA $05 $DE
    ld   a, $07                                 ; $44CA: JumpTable_028_44AA $3E $07
    ldh  [hWindowYUnused], a                    ; $44CC: JumpTable_028_44AA $E0 $A9
    ld   a, $70                                 ; $44CE: JumpTable_028_44AA $3E $70
    ldh  [hWindowXUnused], a                    ; $44D0: JumpTable_028_44AA $E0 $AA
    ld   a, [wLCDControl]                       ; $44D2: JumpTable_028_44AA $FA $FD $D6
    ld   [wLCDControl], a                       ; $44D5: JumpTable_028_44AA $EA $FD $D6
    ld   [rLCDC], a                             ; $44D8: JumpTable_028_44AA $E0 $40
    ret                                         ; $44DA: JumpTable_028_44AA $C9

func_028_44DB::
    ld   hl, wGameplaySubtype                   ; $44DB: $21 $96 $DB
    inc  [hl]                                   ; $44DE: $34
    ret                                         ; $44DF: $C9

Data_028_44E0::
    entity_pointer PhotoNiceLinkTiles
    entity_pointer PhotoMarinCliffTiles
    entity_pointer PhotoMarinWellTiles
    entity_pointer PhotoMabeTiles
    entity_pointer PhotoUlriraTiles
    entity_pointer PhotoBowWowTiles
    entity_pointer PhotoShopTiles
    entity_pointer PhotoFishermanTiles
    entity_pointer PhotoZoraTiles
    entity_pointer PhotoKanaletTiles
    entity_pointer PhotoGhostTiles
    entity_pointer PhotoBridgeTiles
    entity_pointer PhotoDizzyLinkTiles;

Data_028_4507::
    entity_pointer Data_028_5820
    entity_pointer Data_028_5AF0
    entity_pointer Data_028_5DC0
    entity_pointer Data_028_6090
    entity_pointer Data_028_6360
    entity_pointer Data_028_6630
    entity_pointer Data_028_6900
    entity_pointer Data_028_6BD0
    entity_pointer Data_028_6EA0
    entity_pointer Data_028_7170
    entity_pointer Data_028_7440
    entity_pointer Data_028_7710
    entity_pointer Data_028_5550

Data_028_452E::
    db   $50, $38, $00, $00
    db   $50, $40, $02, $00
    db   $50, $48, $04, $00
    db   $50, $50, $06, $00
    db   $50, $58, $08, $00
    db   $50, $60, $0A, $00
    db   $50, $68, $0C, $00

Data_028_454E::
    db   $78, $60, $0E, $03
    db   $78, $68, $0E, $23
    db   $78, $70, $44, $03
    db   $78, $78, $46, $03
    db   $78, $80, $48, $03
    db   $78, $88, $4A, $03
    db   $88, $60, $10, $04
    db   $88, $68, $12, $04
    db   $88, $70, $14, $04
    db   $88, $78, $16, $04
    db   $88, $80, $18, $04
    db   $88, $88, $1A, $04
    db   $88, $90, $1C, $04


JumpTable_028_457E:
    ldh  a, [hJoypadState]                      ; $457E: JumpTable_028_457E $F0 $CC
    bit  4, a                                   ; $4580: JumpTable_028_457E $CB $67
    jr   z, .else_459A_28                       ; $4582: JumpTable_028_457E $28 $16

    xor  a                                      ; $4584: JumpTable_028_457E $AF
    ld   [$D1C8], a                             ; $4585: JumpTable_028_457E $EA $C8 $D1
    ld   [$D1CA], a                             ; $4588: JumpTable_028_457E $EA $CA $D1
    ld   a, $20                                 ; $458B: JumpTable_028_457E $3E $20
    ld   [$D1C9], a                             ; $458D: JumpTable_028_457E $EA $C9 $D1
    ; Why is the owl's music played in the photo album code?
    ld   a, MUSIC_OWL                           ; $4590: JumpTable_028_457E $3E $22
    ld   [wMusicTrackToPlay], a                 ; $4592: JumpTable_028_457E $EA $68 $D3
    call func_028_44DB                          ; $4595: JumpTable_028_457E $CD $DB $44
    jr   .func_028_45A3                         ; $4598: JumpTable_028_457E $18 $09

.else_459A_28:
    bit  5, a                                   ; $459A: JumpTable_028_457E $CB $6F
    jr   z, .else_45A7_28                       ; $459C: JumpTable_028_457E $28 $09

    ld   a, $0A                                 ; $459E: JumpTable_028_457E $3E $0A
    ld   [wGameplaySubtype], a                  ; $45A0: JumpTable_028_457E $EA $96 $DB
.func_028_45A3::
    ld   a, JINGLE_VALIDATE                     ; $45A3: JumpTable_028_457E $3E $13
    ldh  [hJingle], a                           ; $45A5: JumpTable_028_457E $E0 $F2
.else_45A7_28:
    ld   de, wOAMBuffer                         ; $45A7: JumpTable_028_457E $11 $00 $C0
    ld   hl, Data_028_452E                      ; $45AA: JumpTable_028_457E $21 $2E $45
    ld   c, $14                                 ; $45AD: JumpTable_028_457E $0E $14
    ldh  a, [hFrameCounter]                     ; $45AF: JumpTable_028_457E $F0 $E7
    inc  a                                      ; $45B1: JumpTable_028_457E $3C
    ldh  [hFrameCounter], a                     ; $45B2: JumpTable_028_457E $E0 $E7
    and  %00110000                              ; $45B4: JumpTable_028_457E $E6 $30
    jr   nz, .else_45BD_28                      ; $45B6: JumpTable_028_457E $20 $05

    ld   hl, Data_028_454E                      ; $45B8: JumpTable_028_457E $21 $4E $45
    ld   c, $0D                                 ; $45BB: JumpTable_028_457E $0E $0C
.else_45BD_28:
    ldi  a, [hl]                                ; $45BD: JumpTable_028_457E $2A
    ld   [de], a                                ; $45BE: JumpTable_028_457E $12
    inc  de                                     ; $45BF: JumpTable_028_457E $13
    ldi  a, [hl]                                ; $45C0: JumpTable_028_457E $2A
    ld   [de], a                                ; $45C1: JumpTable_028_457E $12
    inc  de                                     ; $45C2: JumpTable_028_457E $13
    ldi  a, [hl]                                ; $45C3: JumpTable_028_457E $2A
    ld   [de], a                                ; $45C4: JumpTable_028_457E $12
    inc  de                                     ; $45C5: JumpTable_028_457E $13
    ldi  a, [hl]                                ; $45C6: JumpTable_028_457E $2A
    ld   [de], a                                ; $45C7: JumpTable_028_457E $12
    inc  de                                     ; $45C8: JumpTable_028_457E $13
    dec  c                                      ; $45C9: JumpTable_028_457E $0D
    jr   nz, .else_45BD_28                      ; $45CA: JumpTable_028_457E $20 $F1

    ret                                         ; $45CC: JumpTable_028_457E $C9


func_028_45CD::
    xor  a                                      ; $45CD: $AF
    ld   [$D16D], a                             ; $45CE: $EA $6D $D1
    ld   [$D16E], a                             ; $45D1: $EA $6E $D1
    ld   a, $13                                 ; $45D4: $3E $13
    ld   [$D17E], a                             ; $45D6: $EA $7E $D1
    ld   a, $01                                 ; $45D9: $3E $01
    ld   [$D17F], a                             ; $45DB: $EA $7F $D1
    ld   a, $E4                                 ; $45DE: $3E $E4
    ld   [$D180], a                             ; $45E0: $EA $80 $D1
    ld   a, $80                                 ; $45E3: $3E $80
    ld   [$D16F], a                             ; $45E5: $EA $6F $D1
    ret                                         ; $45E8: $C9


func_028_45E9::
    ld   a, $00                                 ; $45E9: $3E $00
    ld   [$D16B], a                             ; $45EB: $EA $6B $D1
    ld   a, JINGLE_WRONG_ANSWER                 ; $45EE: $3E $1D
    ldh  [hJingle], a                           ; $45F0: $E0 $F2
    ld   a, $10                                 ; $45F2: $3E $10
    ldh  [hFrameCounter], a                     ; $45F4: $E0 $E7
    ld   a, $11                                 ; $45F6: $3E $11
    ld   [$D1C6], a                             ; $45F8: $EA $C6 $D1
    ld   a, $10                                 ; $45FB: $3E $10
    ld   [wGameplaySubtype], a                  ; $45FD: $EA $96 $DB
    ret                                         ; $4600: $C9


; ----------------------------------------------
;
; Printer communication entry point
;
; ----------------------------------------------

PrinterInterruptSerial::
    ld   a, [rSC]                               ; $4601: $F0 $02
    bit  7, a                                   ; $4603: $CB $7F
    jr   nz, .return_4615_28                    ; $4605: $20 $0E

    push bc                                     ; $4607: $C5
    push de                                     ; $4608: $D5
    push hl                                     ; $4609: $E5
    ld   a, $01                                 ; $460A: $3E $01
    ld   [$D171], a                             ; $460C: $EA $71 $D1
    call func_028_4638                          ; $460F: $CD $38 $46
    pop  hl                                     ; $4612: $E1
    pop  de                                     ; $4613: $D1
    pop  bc                                     ; $4614: $C1
.return_4615_28:
    ret                                         ; $4615: $C9


PrinterInterruptVBlank::
    ld   a, [$D16B]                             ; $4616: $FA $6B $D1
    cp   $01                                    ; $4619: $FE $01
    ret  nz                                     ; $461B: $C0

    ld   a, [$D16D]                             ; $461C: $FA $6D $D1
    cp   $FF                                    ; $461F: $FE $FF
    ret  z                                      ; $4621: $C8

    ld   a, [$D172]                             ; $4622: $FA $72 $D1
    and  a                                      ; $4625: $A7
    ret  nz                                     ; $4626: $C0

    ld   hl, $D182                              ; $4627: $21 $82 $D1
    inc  [hl]                                   ; $462A: $34
    ld   a, [hl]                                ; $462B: $7E
    cp   $06                                    ; $462C: $FE $06
    ret  c                                      ; $462E: $D8

    xor  a                                      ; $462F: $AF
    ld   [hl], a                                ; $4630: $77
    ld   [$D17D], a                             ; $4631: $EA $7D $D1
    call func_028_4A27                          ; $4634: $CD $27 $4A
    ret                                         ; $4637: $C9


func_028_4638::
    ld   a, [$D17C]                             ; $4638: $FA $7C $D1
    and  a                                      ; $463B: $A7
    jp   nz, func_028_47C5                      ; $463C: $C2 $C5 $47

    ld   a, [$D16B]                             ; $463F: $FA $6B $D1
    cp   $07                                    ; $4642: $FE $07
    jp   z, func_028_477F                       ; $4644: $CA $7F $47

    ld   a, [$D173]                             ; $4647: $FA $73 $D1
    and  a                                      ; $464A: $A7
    jr   nz, .else_4651_28                      ; $464B: $20 $04

    call func_028_4670                          ; $464D: $CD $70 $46
    ret                                         ; $4650: $C9


.else_4651_28:
    ld   a, [$D174]                             ; $4651: $FA $74 $D1
    and  a                                      ; $4654: $A7
    jr   z, .else_466C_28                       ; $4655: $28 $15

    ld   a, [$D175]                             ; $4657: $FA $75 $D1
    and  a                                      ; $465A: $A7
    jr   z, .else_466C_28                       ; $465B: $28 $0F

    ld   a, [$D176]                             ; $465D: $FA $76 $D1
    cp   $02                                    ; $4660: $FE $02
    jr   z, .else_4668_28                       ; $4662: $28 $04

    call func_028_474E                          ; $4664: $CD $4E $47
    ret                                         ; $4667: $C9


.else_4668_28:
    call func_028_4765                          ; $4668: $CD $65 $47
    ret                                         ; $466B: $C9


.else_466C_28:
    call func_028_4695                          ; $466C: $CD $95 $46
    ret                                         ; $466F: $C9


func_028_4670::
    ld   hl, $D17A                              ; $4670: $21 $7A $D1
    ld   c, [hl]                                ; $4673: $4E
    inc  [hl]                                   ; $4674: $34
    ld   b, $00                                 ; $4675: $06 $00
    ld   hl, Data_028_4A7C                      ; $4677: $21 $7C $4A
    add  hl, bc                                 ; $467A: $09
    ld   a, [hl]                                ; $467B: $7E
    ld   [rSB], a                               ; $467C: $E0 $01
    ld   a, $01                                 ; $467E: $3E $01
    ld   [rSC], a                               ; $4680: $E0 $02
    ld   a, $81                                 ; $4682: $3E $81
    ld   [rSC], a                               ; $4684: $E0 $02
    ld   a, [$D17A]                             ; $4686: $FA $7A $D1
    cp   $02                                    ; $4689: $FE $02
    ret  nz                                     ; $468B: $C0

    xor  a                                      ; $468C: $AF
    ld   [$D17A], a                             ; $468D: $EA $7A $D1
    inc  a                                      ; $4690: $3C
    ld   [$D173], a                             ; $4691: $EA $73 $D1
    ret                                         ; $4694: $C9


func_028_4695::
    ld   a, [$D17A]                             ; $4695: $FA $7A $D1
    ld   c, a                                   ; $4698: $4F
    ld   a, [$D17B]                             ; $4699: $FA $7B $D1
    ld   b, a                                   ; $469C: $47
    ld   a, [$D183]                             ; $469D: $FA $83 $D1
    ld   l, a                                   ; $46A0: $6F
    ld   a, [$D184]                             ; $46A1: $FA $84 $D1
    ld   h, a                                   ; $46A4: $67
    add  hl, bc                                 ; $46A5: $09
    ld   a, [rSB]                               ; $46A6: $F0 $01
    ld   [$D18F], a                             ; $46A8: $EA $8F $D1
    ld   a, [hl]                                ; $46AB: $7E
    ld   [rSB], a                               ; $46AC: $E0 $01
    ld   l, a                                   ; $46AE: $6F
    ld   a, [$D178]                             ; $46AF: $FA $78 $D1
    add  l                                      ; $46B2: $85
    ld   [$D178], a                             ; $46B3: $EA $78 $D1
    ld   a, [$D179]                             ; $46B6: $FA $79 $D1
    adc  $00                                    ; $46B9: $CE $00
    ld   [$D179], a                             ; $46BB: $EA $79 $D1
    ld   a, $01                                 ; $46BE: $3E $01
    ld   [rSC], a                               ; $46C0: $E0 $02
    ld   a, $81                                 ; $46C2: $3E $81
    ld   [rSC], a                               ; $46C4: $E0 $02
    ld   hl, $D17A                              ; $46C6: $21 $7A $D1
    inc  [hl]                                   ; $46C9: $34
    jr   nz, .else_46CE_28                      ; $46CA: $20 $02

    inc  hl                                     ; $46CC: $23
    inc  [hl]                                   ; $46CD: $34
.else_46CE_28:
    ld   hl, $D17A                              ; $46CE: $21 $7A $D1
    ld   a, [$D189]                             ; $46D1: $FA $89 $D1
    cp   [hl]                                   ; $46D4: $BE
    jr   nz, .return_46DE_28                    ; $46D5: $20 $07

    inc  hl                                     ; $46D7: $23
    ld   a, [$D18A]                             ; $46D8: $FA $8A $D1
    cp   [hl]                                   ; $46DB: $BE
    jr   z, .else_46DF_28                       ; $46DC: $28 $01

.return_46DE_28:
    ret                                         ; $46DE: $C9


.else_46DF_28:
    ld   hl, $D174                              ; $46DF: $21 $74 $D1
    ld   a, [hl]                                ; $46E2: $7E
    and  a                                      ; $46E3: $A7
    jr   z, .else_46E9_28                       ; $46E4: $28 $03

    ld   hl, $D175                              ; $46E6: $21 $75 $D1
.else_46E9_28:
    inc  [hl]                                   ; $46E9: $34
    ld   a, [$D190]                             ; $46EA: $FA $90 $D1
    and  a                                      ; $46ED: $A7
    jr   z, .else_4722_28                       ; $46EE: $28 $32

    ld   a, [$D16B]                             ; $46F0: $FA $6B $D1
    cp   $06                                    ; $46F3: $FE $06
    jr   z, .else_4722_28                       ; $46F5: $28 $2B

    ld   hl, $D175                              ; $46F7: $21 $75 $D1
    ld   a, [hl]                                ; $46FA: $7E
    and  a                                      ; $46FB: $A7
    jr   nz, .else_471E_28                      ; $46FC: $20 $20

    xor  a                                      ; $46FE: $AF
    ld   [$D17A], a                             ; $46FF: $EA $7A $D1
    ld   [$D17B], a                             ; $4702: $EA $7B $D1
    ld   a, [$D187]                             ; $4705: $FA $87 $D1
    ld   [$D183], a                             ; $4708: $EA $83 $D1
    ld   a, [$D188]                             ; $470B: $FA $88 $D1
    ld   [$D184], a                             ; $470E: $EA $84 $D1
    ld   a, [$D18D]                             ; $4711: $FA $8D $D1
    ld   [$D189], a                             ; $4714: $EA $89 $D1
    ld   a, [$D18E]                             ; $4717: $FA $8E $D1
    ld   [$D18A], a                             ; $471A: $EA $8A $D1
    ret                                         ; $471D: $C9


.else_471E_28:
    call .func_028_4735                         ; $471E: $CD $35 $47
    ret                                         ; $4721: $C9


.else_4722_28:
    ld   a, [$D18F]                             ; $4722: $FA $8F $D1
    ld   [$D16E], a                             ; $4725: $EA $6E $D1
.func_028_4728::
    ld   a, $07                                 ; $4728: $3E $07
    ld   [$D16B], a                             ; $472A: $EA $6B $D1
    ld   a, $01                                 ; $472D: $3E $01
    ld   [$D170], a                             ; $472F: $EA $70 $D1
    call func_028_47E6.func_028_47F0            ; $4732: $CD $F0 $47
.func_028_4735::
    ld   a, [$D18B]                             ; $4735: $FA $8B $D1
    ld   [$D189], a                             ; $4738: $EA $89 $D1
    ld   a, [$D18C]                             ; $473B: $FA $8C $D1
    ld   [$D18A], a                             ; $473E: $EA $8A $D1
    ld   a, [$D185]                             ; $4741: $FA $85 $D1
    ld   [$D183], a                             ; $4744: $EA $83 $D1
    ld   a, [$D186]                             ; $4747: $FA $86 $D1
    ld   [$D184], a                             ; $474A: $EA $84 $D1
    ret                                         ; $474D: $C9


func_028_474E::
    ld   c, a                                   ; $474E: $4F
    ld   b, $00                                 ; $474F: $06 $00
    ld   hl, $D178                              ; $4751: $21 $78 $D1
    add  hl, bc                                 ; $4754: $09
    ld   a, [hl]                                ; $4755: $7E
    ld   [rSB], a                               ; $4756: $E0 $01
    ld   a, $01                                 ; $4758: $3E $01
    ld   [rSC], a                               ; $475A: $E0 $02
    ld   a, $81                                 ; $475C: $3E $81
    ld   [rSC], a                               ; $475E: $E0 $02
    ld   hl, $D176                              ; $4760: $21 $76 $D1
    inc  [hl]                                   ; $4763: $34
    ret                                         ; $4764: $C9


func_028_4765::
    ld   a, [rSB]                               ; $4765: $F0 $01
    ld   [$D16E], a                             ; $4767: $EA $6E $D1
    xor  a                                      ; $476A: $AF
    ld   [rSB], a                               ; $476B: $E0 $01
    ld   a, $01                                 ; $476D: $3E $01
    ld   [rSC], a                               ; $476F: $E0 $02
    ld   a, $81                                 ; $4771: $3E $81
    ld   [rSC], a                               ; $4773: $E0 $02
    ld   hl, $D177                              ; $4775: $21 $77 $D1
    inc  [hl]                                   ; $4778: $34
    ld   a, [hl]                                ; $4779: $7E
    cp   $02                                    ; $477A: $FE $02
    jr   z, func_028_4695.func_028_4728         ; $477C: $28 $AA

    ret                                         ; $477E: $C9


func_028_477F::
    ld   a, [$D191]                             ; $477F: $FA $91 $D1
    ld   [$D192], a                             ; $4782: $EA $92 $D1
    ld   a, [$D16D]                             ; $4785: $FA $6D $D1
    ld   [$D193], a                             ; $4788: $EA $93 $D1
    ld   a, [rSB]                               ; $478B: $F0 $01
    ld   [$D16D], a                             ; $478D: $EA $6D $D1
    cp   $FF                                    ; $4790: $FE $FF
    jr   nz, func_028_47A0                      ; $4792: $20 $0C

    ld   a, $00                                 ; $4794: $3E $00
    ld   [$D172], a                             ; $4796: $EA $72 $D1
    ld   [$D16B], a                             ; $4799: $EA $6B $D1
    ld   a, $02                                 ; $479C: $3E $02
    jr   func_028_47B8                          ; $479E: $18 $18

func_028_47A0::
    bit  1, a                                   ; $47A0: $CB $4F
    jr   z, func_028_47A9                       ; $47A2: $28 $05

    ld   a, $01                                 ; $47A4: $3E $01
    ld   [$D17D], a                             ; $47A6: $EA $7D $D1
func_028_47A9::
    bit  4, a                                   ; $47A9: $CB $67
    ld   a, $00                                 ; $47AB: $3E $00
    ld   [$D16B], a                             ; $47AD: $EA $6B $D1
    ld   a, $01                                 ; $47B0: $3E $01
    jr   nz, func_028_47B7                      ; $47B2: $20 $03

    ld   [$D16B], a                             ; $47B4: $EA $6B $D1
func_028_47B7::
    inc  a                                      ; $47B7: $3C
func_028_47B8::
    ld   [$D170], a                             ; $47B8: $EA $70 $D1
    ld   a, [$D190]                             ; $47BB: $FA $90 $D1
    and  a                                      ; $47BE: $A7
    jr   nz, func_028_47C5                      ; $47BF: $20 $04

    xor  a                                      ; $47C1: $AF
    ld   [$D172], a                             ; $47C2: $EA $72 $D1
func_028_47C5::
    ret                                         ; $47C5: $C9


    db   $AF, $E0, $02, $E0, $01                ; $47C6 |.....|

func_028_47CB::
    xor  a                                      ; $47CB: $AF
    ld   [rSB], a                               ; $47CC: $E0 $01
    ld   [rSC], a                               ; $47CE: $E0 $02
    ld   [$D16B], a                             ; $47D0: $EA $6B $D1
    ld   [$D16C], a                             ; $47D3: $EA $6C $D1
    dec  a                                      ; $47D6: $3D
    ld   [$D16D], a                             ; $47D7: $EA $6D $D1
    ld   [$D16E], a                             ; $47DA: $EA $6E $D1
    ld   a, $80                                 ; $47DD: $3E $80
    ld   [$D16F], a                             ; $47DF: $EA $6F $D1
    call func_028_47E6                          ; $47E2: $CD $E6 $47
    ret                                         ; $47E5: $C9


; What are these values? That's a lot of addresses being set to $00...
func_028_47E6::
    xor  a                                      ; $47E6: $AF
    ld   [$D170], a                             ; $47E7: $EA $70 $D1
    ld   [$D171], a                             ; $47EA: $EA $71 $D1
    ld   [$D172], a                             ; $47ED: $EA $72 $D1
.func_028_47F0::
    xor  a                                      ; $47F0:, func_028_47E6.func_028_47F0 $AF
    ld   [$D173], a                             ; $47F1:, func_028_47E6.func_028_47F0 $EA $73 $D1
    ld   [$D174], a                             ; $47F4:, func_028_47E6.func_028_47F0 $EA $74 $D1
    ld   [$D175], a                             ; $47F7:, func_028_47E6.func_028_47F0 $EA $75 $D1
    ld   [$D176], a                             ; $47FA:, func_028_47E6.func_028_47F0 $EA $76 $D1
    ld   [$D177], a                             ; $47FD:, func_028_47E6.func_028_47F0 $EA $77 $D1
    ld   [$D178], a                             ; $4800:, func_028_47E6.func_028_47F0 $EA $78 $D1
    ld   [$D179], a                             ; $4803:, func_028_47E6.func_028_47F0 $EA $79 $D1
    ld   [$D17A], a                             ; $4806:, func_028_47E6.func_028_47F0 $EA $7A $D1
    ld   [$D17B], a                             ; $4809:, func_028_47E6.func_028_47F0 $EA $7B $D1
    ld   [$D17C], a                             ; $480C:, func_028_47E6.func_028_47F0 $EA $7C $D1
    ld   [$D17D], a                             ; $480F:, func_028_47E6.func_028_47F0 $EA $7D $D1
    ret                                         ; $4812:, func_028_47E6.func_028_47F0 $C9


func_028_4813::
    ld   a, [$D172]                             ; $4813: $FA $72 $D1
    and  a                                      ; $4816: $A7
    jr   z, .else_481D_28                       ; $4817: $28 $04

    call func_028_482E                          ; $4819: $CD $2E $48
    ret  nc                                     ; $481C: $D0

.else_481D_28:
    ld   a, [$D192]                             ; $481D: $FA $92 $D1
    cp   $01                                    ; $4820: $FE $01
    jr   nz, .else_4828_28                      ; $4822: $20 $04

    call func_028_482E                          ; $4824: $CD $2E $48
    ret  nc                                     ; $4827: $D0

.else_4828_28:
    call func_028_4AA2                          ; $4828: $CD $A2 $4A
    jp   func_028_4B6B                          ; $482B: $C3 $6B $4B

func_028_482E::
    ld   a, [$D170]                             ; $482E: $FA $70 $D1
    cp   $02                                    ; $4831: $FE $02
    jr   c, func_028_4878                       ; $4833: $38 $43

    call func_028_487C                          ; $4835: $CD $7C $48
    jr   nz, func_028_4878                      ; $4838: $20 $3E

    xor  a                                      ; $483A: $AF
    ld   [$D182], a                             ; $483B: $EA $82 $D1
    ld   [$D192], a                             ; $483E: $EA $92 $D1
    inc  a                                      ; $4841: $3C
    ld   [$D16B], a                             ; $4842: $EA $6B $D1
    ld   a, [$D16D]                             ; $4845: $FA $6D $D1
    cp   $FF                                    ; $4848: $FE $FF
    jr   z, func_028_486E                       ; $484A: $28 $22

    bit  0, a                                   ; $484C: $CB $47
    jr   nz, .else_4867_28                      ; $484E: $20 $17

    bit  1, a                                   ; $4850: $CB $4F
    jr   nz, .else_4867_28                      ; $4852: $20 $13

    and  %11110000                              ; $4854: $E6 $F0
    jr   z, func_028_4876                       ; $4856: $28 $1E

    xor  a                                      ; $4858: $AF
    ld   [$D16B], a                             ; $4859: $EA $6B $D1
    ld   [$D192], a                             ; $485C: $EA $92 $D1
    ld   a, [$D16D]                             ; $485F: $FA $6D $D1
    call func_028_4BA7                          ; $4862: $CD $A7 $4B
    jr   func_028_4876                          ; $4865: $18 $0F

.else_4867_28:
    scf                                         ; $4867: $37
    ret                                         ; $4868: $C9


    db   $AF, $EA, $92, $D1, $3D                ; $4869 |....=|

func_028_486E::
    inc  a                                      ; $486E: $3C
    ld   [$D16B], a                             ; $486F: $EA $6B $D1
    dec  a                                      ; $4872: $3D
    call func_028_4BA7                          ; $4873: $CD $A7 $4B
func_028_4876::
    and  a                                      ; $4876: $A7
    ret                                         ; $4877: $C9


func_028_4878::
    xor  a                                      ; $4878: $AF
    ld   a, $F0                                 ; $4879: $3E $F0
    ret                                         ; $487B: $C9


func_028_487C::
    ld   hl, $D170                              ; $487C: $21 $70 $D1
    ld   a, [hl]                                ; $487F: $7E
    cp   $03                                    ; $4880: $FE $03
    ret  z                                      ; $4882: $C8

    inc  a                                      ; $4883: $3C
    ld   [hl], a                                ; $4884: $77
    ret                                         ; $4885: $C9


func_028_4886::
    ld   a, [$D16B]                             ; $4886: $FA $6B $D1
    cp   $01                                    ; $4889: $FE $01
    jr   z, .else_4898_28                       ; $488B: $28 $0B

    cp   $02                                    ; $488D: $FE $02
    jr   z, .else_4898_28                       ; $488F: $28 $07

    and  a                                      ; $4891: $A7
    ld   a, $FF                                 ; $4892: $3E $FF
    ret  z                                      ; $4894: $C8

.loop_4895_28:
    ld   a, $F0                                 ; $4895: $3E $F0
    ret                                         ; $4897: $C9


.else_4898_28:
    ld   a, [$D17D]                             ; $4898: $FA $7D $D1
    and  a                                      ; $489B: $A7
    jr   nz, .loop_4895_28                      ; $489C: $20 $F7

    ld   a, [$D172]                             ; $489E: $FA $72 $D1
    and  a                                      ; $48A1: $A7
    jr   z, .else_48A8_28                       ; $48A2: $28 $04

    call func_028_482E                          ; $48A4: $CD $2E $48
    ret  nc                                     ; $48A7: $D0

.else_48A8_28:
    ld   a, [$D192]                             ; $48A8: $FA $92 $D1
    cp   $02                                    ; $48AB: $FE $02
    jr   nz, .else_48B3_28                      ; $48AD: $20 $04

    call func_028_482E                          ; $48AF: $CD $2E $48
    ret  nc                                     ; $48B2: $D0

.else_48B3_28:
    ld   a, [$D16D]                             ; $48B3: $FA $6D $D1
    cp   $FF                                    ; $48B6: $FE $FF
    jp   z, func_028_4BA7                       ; $48B8: $CA $A7 $4B

    call func_028_4AAF                          ; $48BB: $CD $AF $4A
    jp   func_028_4B6B                          ; $48BE: $C3 $6B $4B

func_028_48C1::
    ld   c, a                                   ; $48C1: $4F
    ld   a, [$D16B]                             ; $48C2: $FA $6B $D1
    and  a                                      ; $48C5: $A7
    ld   a, [$D16D]                             ; $48C6: $FA $6D $D1
    jp   z, func_028_4BA7                       ; $48C9: $CA $A7 $4B

    ld   a, [$D16B]                             ; $48CC: $FA $6B $D1
    cp   $01                                    ; $48CF: $FE $01
    jr   z, .else_48DA_28                       ; $48D1: $28 $07

    cp   $03                                    ; $48D3: $FE $03
    jr   z, .else_48DA_28                       ; $48D5: $28 $03

    ld   a, $F0                                 ; $48D7: $3E $F0
    ret                                         ; $48D9: $C9


.else_48DA_28:
    ld   a, [$D172]                             ; $48DA: $FA $72 $D1
    and  a                                      ; $48DD: $A7
    jr   nz, .else_4934_28                      ; $48DE: $20 $54

    ld   a, c                                   ; $48E0: $79
    inc  a                                      ; $48E1: $3C
    ld   [$D194], a                             ; $48E2: $EA $94 $D1
    ld   a, l                                   ; $48E5: $7D
    ld   [$D195], a                             ; $48E6: $EA $95 $D1
    ld   a, h                                   ; $48E9: $7C
    ld   [$D196], a                             ; $48EA: $EA $96 $D1
    ld   a, $00                                 ; $48ED: $3E $00
    ld   [$D197], a                             ; $48EF: $EA $97 $D1
    ld   a, $D0                                 ; $48F2: $3E $D0
    ld   [$D198], a                             ; $48F4: $EA $98 $D1
    ld   a, [$D16D]                             ; $48F7: $FA $6D $D1
    cp   $FF                                    ; $48FA: $FE $FF
    jp   z, func_028_4BA7                       ; $48FC: $CA $A7 $4B

    ld   a, [$D199]                             ; $48FF: $FA $99 $D1
    ld   [$D1B5], a                             ; $4902: $EA $B5 $D1
    and  a                                      ; $4905: $A7
    jr   z, .else_4928_28                       ; $4906: $28 $20

    ld   a, [$D194]                             ; $4908: $FA $94 $D1
    dec  a                                      ; $490B: $3D
    dec  a                                      ; $490C: $3D
    ld   c, a                                   ; $490D: $4F
    ld   b, $00                                 ; $490E: $06 $00
    push hl                                     ; $4910: $E5
    ld   hl, $D1AC                              ; $4911: $21 $AC $D1
    add  hl, bc                                 ; $4914: $09
    ld   a, [hl]                                ; $4915: $7E
    ld   [$D1B5], a                             ; $4916: $EA $B5 $D1
    sla  c                                      ; $4919: $CB $21
    ld   b, $00                                 ; $491B: $06 $00
    ld   hl, $D19A                              ; $491D: $21 $9A $D1
    add  hl, bc                                 ; $4920: $09
    ldi  a, [hl]                                ; $4921: $2A
    ld   b, [hl]                                ; $4922: $46
    pop  hl                                     ; $4923: $E1
    ld   c, a                                   ; $4924: $4F
    jp   .func_028_492B                         ; $4925: $C3 $2B $49

.else_4928_28:
    ld   bc, $280                               ; $4928: $01 $80 $02
.func_028_492B::
    call func_028_4BD9                          ; $492B: $CD $D9 $4B
    call func_028_4B0F                          ; $492E: $CD $0F $4B
    jp   func_028_4B6B                          ; $4931: $C3 $6B $4B

.else_4934_28:
    ld   a, [$D170]                             ; $4934: $FA $70 $D1
    cp   $02                                    ; $4937: $FE $02
    ld   a, $F0                                 ; $4939: $3E $F0
    jp   c, .return_49E1_28                     ; $493B: $DA $E1 $49

    call func_028_487C                          ; $493E: $CD $7C $48
    ld   a, $F0                                 ; $4941: $3E $F0
    jp   nz, .return_49E1_28                    ; $4943: $C2 $E1 $49

    ld   hl, $D194                              ; $4946: $21 $94 $D1
    ld   a, [$D16D]                             ; $4949: $FA $6D $D1
    ld   c, a                                   ; $494C: $4F
    and  %11110000                              ; $494D: $E6 $F0
    ld   a, c                                   ; $494F: $79
    jp   nz, .func_028_49CE                     ; $4950: $C2 $CE $49

    bit  1, a                                   ; $4953: $CB $4F
    jp   nz, .func_028_4970                     ; $4955: $C2 $70 $49

    bit  0, a                                   ; $4958: $CB $47
    jp   nz, .func_028_4970                     ; $495A: $C2 $70 $49

    ld   a, [hl]                                ; $495D: $7E
    and  a                                      ; $495E: $A7
    ld   a, [$D16D]                             ; $495F: $FA $6D $D1
    jr   z, .else_49D8_28                       ; $4962: $28 $74

    ld   a, [hl]                                ; $4964: $7E
    cp   $01                                    ; $4965: $FE $01
    jp   z, .func_028_49E2                      ; $4967: $CA $E2 $49

    dec  [hl]                                   ; $496A: $35
    ld   a, [$D16D]                             ; $496B: $FA $6D $D1
    jr   z, .else_49D8_28                       ; $496E: $28 $68

.func_028_4970::
    ld   a, [hl]                                ; $4970: $7E
    cp   $01                                    ; $4971: $FE $01
    ld   a, $F0                                 ; $4973: $3E $F0
    jp   z, .return_49E1_28                     ; $4975: $CA $E1 $49

    ld   bc, $280                               ; $4978: $01 $80 $02
    ld   a, [$D199]                             ; $497B: $FA $99 $D1
    ld   [$D1B5], a                             ; $497E: $EA $B5 $D1
    and  a                                      ; $4981: $A7
    jr   z, .else_49A1_28                       ; $4982: $28 $1D

    ld   a, [$D194]                             ; $4984: $FA $94 $D1
    dec  a                                      ; $4987: $3D
    dec  a                                      ; $4988: $3D
    ld   c, a                                   ; $4989: $4F
    ld   b, $00                                 ; $498A: $06 $00
    push hl                                     ; $498C: $E5
    ld   hl, $D1AC                              ; $498D: $21 $AC $D1
    add  hl, bc                                 ; $4990: $09
    ld   a, [hl]                                ; $4991: $7E
    ld   [$D1B5], a                             ; $4992: $EA $B5 $D1
    sla  c                                      ; $4995: $CB $21
    ld   b, $00                                 ; $4997: $06 $00
    ld   hl, $D19A                              ; $4999: $21 $9A $D1
    add  hl, bc                                 ; $499C: $09
    ldi  a, [hl]                                ; $499D: $2A
    ld   b, [hl]                                ; $499E: $46
    pop  hl                                     ; $499F: $E1
    ld   c, a                                   ; $49A0: $4F
.else_49A1_28:
    ld   a, [$D16D]                             ; $49A1: $FA $6D $D1
    bit  1, a                                   ; $49A4: $CB $4F
    jp   nz, .func_028_49C3                     ; $49A6: $C2 $C3 $49

    ld   a, [$D197]                             ; $49A9: $FA $97 $D1
    add  $28                                    ; $49AC: $C6 $28
    ld   [$D197], a                             ; $49AE: $EA $97 $D1
    ld   a, [$D198]                             ; $49B1: $FA $98 $D1
    adc  $00                                    ; $49B4: $CE $00
    ld   [$D198], a                             ; $49B6: $EA $98 $D1
    ld   a, $00                                 ; $49B9: $3E $00
    ld   [$D187], a                             ; $49BB: $EA $87 $D1
    ld   a, $C2                                 ; $49BE: $3E $C2
    ld   [$D188], a                             ; $49C0: $EA $88 $D1
.func_028_49C3::
    ld   a, [$D187]                             ; $49C3: $FA $87 $D1
    ld   l, a                                   ; $49C6: $6F
    ld   a, [$D188]                             ; $49C7: $FA $88 $D1
    ld   h, a                                   ; $49CA: $67
    jp   .func_028_492B                         ; $49CB: $C3 $2B $49

.func_028_49CE::
    push af                                     ; $49CE: $F5
    ld   a, $01                                 ; $49CF: $3E $01
    ld   [$D17C], a                             ; $49D1: $EA $7C $D1
    pop  af                                     ; $49D4: $F1
    call func_028_4BA7                          ; $49D5: $CD $A7 $4B
.else_49D8_28:
    push af                                     ; $49D8: $F5
    xor  a                                      ; $49D9: $AF
    ld   [$D190], a                             ; $49DA: $EA $90 $D1
    ld   [$D172], a                             ; $49DD: $EA $72 $D1
    pop  af                                     ; $49E0: $F1
.return_49E1_28:
    ret                                         ; $49E1: $C9


.func_028_49E2::
    ld   a, [$D1B6]                             ; $49E2: $FA $B6 $D1
    and  a                                      ; $49E5: $A7
    ld   a, [$D16D]                             ; $49E6: $FA $6D $D1
    jr   z, .else_49D8_28                       ; $49E9: $28 $ED

    dec  [hl]                                   ; $49EB: $35
    call func_028_4B5D                          ; $49EC: $CD $5D $4B
    jp   func_028_4B6B                          ; $49EF: $C3 $6B $4B

func_028_49F2::
    ld   a, [$d16b]                             ; $49f2: $fa $6b $d1
    cp   $01                                    ; $49f5: $fe $01
    jr   z, jr_028_4a04                         ; $49f7: $28 $0b

    cp   $03                                    ; $49f9: $fe $03
    jr   z, jr_028_4a04                         ; $49fb: $28 $07

    and  a                                      ; $49fd: $a7
    ld   a, $ff                                 ; $49fe: $3e $ff
    ret  z                                      ; $4a00: $c8

    ld   a, $f0                                 ; $4a01: $3e $f0
    ret                                         ; $4a03: $c9


jr_028_4a04::
    ld   a, [$d172]                             ; $4a04: $fa $72 $d1
    and  a                                      ; $4a07: $a7
    jr   z, jr_028_4a0e                         ; $4a08: $28 $04

    call func_028_482E                          ; $4a0a: $cd $2e $48
    ret  nc                                     ; $4a0d: $d0

jr_028_4a0e::
    ld   a, [$d192]                             ; $4a0e: $fa $92 $d1
    cp   $04                                    ; $4a11: $fe $04
    jr   nz, jr_028_4a19                        ; $4a13: $20 $04

    call func_028_482E                          ; $4a15: $cd $2e $48
    ret  nc                                     ; $4a18: $d0

jr_028_4a19::
    ld   a, [$d16d]                             ; $4a19: $fa $6d $d1
    cp   $ff                                    ; $4a1c: $fe $ff
    jp   z, func_028_4BA7                       ; $4a1e: $ca $a7 $4b

    call Call_028_4b43                          ; $4a21: $cd $43 $4b
    jp   func_028_4B6B                          ; $4a24: $c3 $6b $4b


func_028_4A27::
    ld   a, [$D16B]                             ; $4A27: $FA $6B $D1
    cp   $01                                    ; $4A2A: $FE $01
    jr   z, .else_4A39_28                       ; $4A2C: $28 $0B

    cp   $03                                    ; $4A2E: $FE $03
    jr   z, .else_4A39_28                       ; $4A30: $28 $07

    and  a                                      ; $4A32: $A7
    ld   a, $FF                                 ; $4A33: $3E $FF
    ret  z                                      ; $4A35: $C8

    ld   a, $F0                                 ; $4A36: $3E $F0
    ret                                         ; $4A38: $C9


.else_4A39_28:
    ld   a, [$D172]                             ; $4A39: $FA $72 $D1
    and  a                                      ; $4A3C: $A7
    jr   z, .else_4A43_28                       ; $4A3D: $28 $04

    call func_028_482E                          ; $4A3F: $CD $2E $48
    ret  nc                                     ; $4A42: $D0

.else_4A43_28:
    ld   a, [$D16D]                             ; $4A43: $FA $6D $D1
    cp   $FF                                    ; $4A46: $FE $FF
    jp   z, func_028_4BA7                       ; $4A48: $CA $A7 $4B

    call func_028_4B50                          ; $4A4B: $CD $50 $4B
    jp   func_028_4B6B                          ; $4A4E: $C3 $6B $4B

func_028_4A51::
    ld   [$D191], a                             ; $4A51: $EA $91 $D1
    ld   a, d                                   ; $4A54: $7A
    ld   [$D190], a                             ; $4A55: $EA $90 $D1
    ld   a, l                                   ; $4A58: $7D
    ld   [$D183], a                             ; $4A59: $EA $83 $D1
    ld   [$D185], a                             ; $4A5C: $EA $85 $D1
    ld   a, h                                   ; $4A5F: $7C
    ld   [$D184], a                             ; $4A60: $EA $84 $D1
    ld   [$D186], a                             ; $4A63: $EA $86 $D1
    ld   a, c                                   ; $4A66: $79
    ld   [$D189], a                             ; $4A67: $EA $89 $D1
    ld   [$D18B], a                             ; $4A6A: $EA $8B $D1
    ld   a, b                                   ; $4A6D: $78
    ld   [$D18A], a                             ; $4A6E: $EA $8A $D1
    ld   [$D18C], a                             ; $4A71: $EA $8C $D1
    xor  a                                      ; $4A74: $AF
    ld   [$D170], a                             ; $4A75: $EA $70 $D1
    call func_028_47E6.func_028_47F0            ; $4A78: $CD $F0 $47
    ret                                         ; $4A7B: $C9

Data_028_4A7C::
    db   $88, $33

Data_028_4A7E::
    db   $01, $00, $00, $00, $01, $00, $00, $00   ; $4A7E

Data_028_4A86::
    db   $02, $00, $04, $00

Data_028_4A8A::
    db   $04, $00, $00, $00, $04, $00, $00, $00

Data_028_4A92::
    db   $08, $00, $00, $00, $08, $00, $00, $00

Data_028_4A9A::
    db   $0F, $00, $00, $00, $0F, $00, $00, $00

func_028_4AA2::
    ld   a, $01                                 ; $4AA2: $3E $01
    ld   d, $00                                 ; $4AA4: $16 $00
    ld   hl, Data_028_4A7E                      ; $4AA6: $21 $7E $4A
    ld   bc, $08                                ; $4AA9: $01 $08 $00
    jp   func_028_4A51                          ; $4AAC: $C3 $51 $4A

func_028_4AAF::
    ld   a, $02                                 ; $4AAF: $3E $02
    ld   d, $00                                 ; $4AB1: $16 $00
    ld   hl, $D1B7                              ; $4AB3: $21 $B7 $D1
    ld   bc, $0C                                ; $4AB6: $01 $0C $00
    call func_028_4A51                          ; $4AB9: $CD $51 $4A
    ld   hl, Data_028_4A86                      ; $4ABC: $21 $86 $4A
    ld   de, $D1B7                              ; $4ABF: $11 $B7 $D1
    ld   bc, $04                                ; $4AC2: $01 $04 $00
    call func_028_4B06                          ; $4AC5: $CD $06 $4B
    ld   de, $06                                ; $4AC8: $11 $06 $00
    ld   a, [$D17F]                             ; $4ACB: $FA $7F $D1
    ld   [$D1BB], a                             ; $4ACE: $EA $BB $D1
    call func_028_4AFF                          ; $4AD1: $CD $FF $4A
    ld   a, [$D17E]                             ; $4AD4: $FA $7E $D1
    ld   [$D1BC], a                             ; $4AD7: $EA $BC $D1
    call func_028_4AFF                          ; $4ADA: $CD $FF $4A
    ld   a, [$D180]                             ; $4ADD: $FA $80 $D1
    ld   [$D1BD], a                             ; $4AE0: $EA $BD $D1
    call func_028_4AFF                          ; $4AE3: $CD $FF $4A
    ld   a, [$D16F]                             ; $4AE6: $FA $6F $D1
    ld   [$D1BE], a                             ; $4AE9: $EA $BE $D1
    call func_028_4AFF                          ; $4AEC: $CD $FF $4A
    ld   a, e                                   ; $4AEF: $7B
    ld   [$D1BF], a                             ; $4AF0: $EA $BF $D1
    ld   a, d                                   ; $4AF3: $7A
    ld   [$D1C0], a                             ; $4AF4: $EA $C0 $D1
    xor  a                                      ; $4AF7: $AF
    ld   [$D1C1], a                             ; $4AF8: $EA $C1 $D1
    ld   [$D1C2], a                             ; $4AFB: $EA $C2 $D1
    ret                                         ; $4AFE: $C9


func_028_4AFF::
    add  e                                      ; $4AFF: $83
    ld   e, a                                   ; $4B00: $5F
    ld   a, d                                   ; $4B01: $7A
    adc  $00                                    ; $4B02: $CE $00
    ld   d, a                                   ; $4B04: $57
    ret                                         ; $4B05: $C9


func_028_4B06::
    ldi  a, [hl]                                ; $4B06: $2A
    ld   [de], a                                ; $4B07: $12
    inc  de                                     ; $4B08: $13
    dec  bc                                     ; $4B09: $0B
    ld   a, c                                   ; $4B0A: $79
    or   b                                      ; $4B0B: $B0
    jr   nz, func_028_4B06                      ; $4B0C: $20 $F8

    ret                                         ; $4B0E: $C9


func_028_4B0F::
    ld   a, l                                   ; $4B0F: $7D
    ld   [$D187], a                             ; $4B10: $EA $87 $D1
    ld   a, h                                   ; $4B13: $7C
    ld   [$D188], a                             ; $4B14: $EA $88 $D1
    ld   a, c                                   ; $4B17: $79
    ld   [$D18D], a                             ; $4B18: $EA $8D $D1
    ld   a, b                                   ; $4B1B: $78
    ld   [$D18E], a                             ; $4B1C: $EA $8E $D1
    push bc                                     ; $4B1F: $C5
    ld   a, $03                                 ; $4B20: $3E $03
    ld   d, $01                                 ; $4B22: $16 $01
    ld   hl, $D1B7                              ; $4B24: $21 $B7 $D1
    ld   bc, $04                                ; $4B27: $01 $04 $00
    call func_028_4A51                          ; $4B2A: $CD $51 $4A
    ld   a, [Data_028_4A8A]                     ; $4B2D: $FA $8A $4A
    ld   [$D1B7], a                             ; $4B30: $EA $B7 $D1
    ld   a, [$D1B5]                             ; $4B33: $FA $B5 $D1
    ld   [$D1B8], a                             ; $4B36: $EA $B8 $D1
    pop  bc                                     ; $4B39: $C1
    ld   a, c                                   ; $4B3A: $79
    ld   [$D1B9], a                             ; $4B3B: $EA $B9 $D1
    ld   a, b                                   ; $4B3E: $78
    ld   [$D1BA], a                             ; $4B3F: $EA $BA $D1
    ret                                         ; $4B42: $C9

Call_028_4b43::
    ld   a, $04                                 ; $4b43: $3e $04
    ld   d, $00                                 ; $4b45: $16 $00
    ld   hl, Data_028_4A92                      ; $4b47: $21 $92 $4a
    ld   bc, $08                                ; $4b4a: $01 $08 $00
    jp   func_028_4A51                          ; $4b4d: $c3 $51 $4a

func_028_4B50::
    ld   a, $05                                 ; $4B50: $3E $05
    ld   d, $00                                 ; $4B52: $16 $00
    ld   hl, Data_028_4A9A                      ; $4B54: $21 $9A $4A
    ld   bc, $08                                ; $4B57: $01 $08 $00
    jp   func_028_4A51                          ; $4B5A: $C3 $51 $4A

func_028_4B5D::
    ld   a, $06                                 ; $4B5D: $3E $06
    ld   d, $01                                 ; $4B5F: $16 $01
    ld   hl, Data_028_4A8A                      ; $4B61: $21 $8A $4A
    ld   bc, $08                                ; $4B64: $01 $08 $00
    jp   func_028_4A51                          ; $4B67: $C3 $51 $4A

    ret                                         ; $4B6A |.|

func_028_4B6B::
    ld   a, [$D16B]                             ; $4B6B: $FA $6B $D1
    cp   $01                                    ; $4B6E: $FE $01
    jr   z, func_028_4B7E                       ; $4B70: $28 $0C

    and  a                                      ; $4B72: $A7
    jr   nz, func_028_4B7C                      ; $4B73: $20 $07

    ld   a, [$D191]                             ; $4B75: $FA $91 $D1
    cp   $01                                    ; $4B78: $FE $01
    jr   z, func_028_4B88                       ; $4B7A: $28 $0C

func_028_4B7C::
    scf                                         ; $4B7C: $37
    ret                                         ; $4B7D: $C9


func_028_4B7E::
    ld   a, [$D191]                             ; $4B7E: $FA $91 $D1
    cp   $01                                    ; $4B81: $FE $01
    jr   z, func_028_4B7C                       ; $4B83: $28 $F7

    ld   [$D16B], a                             ; $4B85: $EA $6B $D1
func_028_4B88::
    xor  a                                      ; $4B88: $AF
    ld   [$D170], a                             ; $4B89: $EA $70 $D1
    ld   [$D192], a                             ; $4B8C: $EA $92 $D1
    ld   a, $01                                 ; $4B8F: $3E $01
    ld   [$D17A], a                             ; $4B91: $EA $7A $D1
    ld   [$D172], a                             ; $4B94: $EA $72 $D1
    ld   a, [Data_028_4A7C]                     ; $4B97: $FA $7C $4A
    ld   [rSB], a                               ; $4B9A: $E0 $01
    ld   a, $01                                 ; $4B9C: $3E $01
    ld   [rSC], a                               ; $4B9E: $E0 $02
    ld   a, $81                                 ; $4BA0: $3E $81
    ld   [rSC], a                               ; $4BA2: $E0 $02
    ld   a, $F0                                 ; $4BA4: $3E $F0
    ret                                         ; $4BA6: $C9


func_028_4BA7::
    push af                                     ; $4BA7: $F5
    ld   a, [$D16D]                             ; $4BA8: $FA $6D $D1
    cp   $FF                                    ; $4BAB: $FE $FF
    jr   z, .else_4BC7_28                       ; $4BAD: $28 $18

    bit  7, a                                   ; $4BAF: $CB $7F
    jr   z, .else_4BB7_28                       ; $4BB1: $28 $04

    ld   a, $00                                 ; $4BB3: $3E $00
    jr   .func_028_4BD4                         ; $4BB5: $18 $1D

.else_4BB7_28:
    bit  6, a                                   ; $4BB7: $CB $77
    jr   z, .else_4BBF_28                       ; $4BB9: $28 $04

    ld   a, $03                                 ; $4BBB: $3E $03
    jr   .func_028_4BD4                         ; $4BBD: $18 $15

.else_4BBF_28:
    bit  5, a                                   ; $4BBF: $CB $6F
    jr   z, .else_4BC7_28                       ; $4BC1: $28 $04

    ld   a, $02                                 ; $4BC3: $3E $02
    jr   .func_028_4BD4                         ; $4BC5: $18 $0D

.else_4BC7_28:
    ld   a, [$D16E]                             ; $4BC7: $FA $6E $D1
    cp   $81                                    ; $4BCA: $FE $81
    jr   z, .else_4BD2_28                       ; $4BCC: $28 $04

    ld   a, $01                                 ; $4BCE: $3E $01
    jr   .func_028_4BD4                         ; $4BD0: $18 $02

.else_4BD2_28:
    ld   a, $01                                 ; $4BD2: $3E $01
.func_028_4BD4::
    ld   [$D1C5], a                             ; $4BD4: $EA $C5 $D1
    pop  af                                     ; $4BD7: $F1
    ret                                         ; $4BD8: $C9


func_028_4BD9::
    push hl                                     ; $4BD9: $E5
    push bc                                     ; $4BDA: $C5
    ld   a, [$D197]                             ; $4BDB: $FA $97 $D1
    ld   l, a                                   ; $4BDE: $6F
    ld   a, [$D198]                             ; $4BDF: $FA $98 $D1
    ld   h, a                                   ; $4BE2: $67
    ld   de, $C200                              ; $4BE3: $11 $00 $C2
    ld   c, $28                                 ; $4BE6: $0E $28
.loop_4BE8_28:
    ldi  a, [hl]                                ; $4BE8: $2A
    push hl                                     ; $4BE9: $E5
    ld   h, $00                                 ; $4BEA: $26 $00
    sla  a                                      ; $4BEC: $CB $27
    rl   h                                      ; $4BEE: $CB $14
    sla  a                                      ; $4BF0: $CB $27
    rl   h                                      ; $4BF2: $CB $14
    sla  a                                      ; $4BF4: $CB $27
    rl   h                                      ; $4BF6: $CB $14
    sla  a                                      ; $4BF8: $CB $27
    rl   h                                      ; $4BFA: $CB $14
    ld   l, a                                   ; $4BFC: $6F
    ld   a, [$D169]                             ; $4BFD: $FA $69 $D1
    adc  h                                      ; $4C00: $8C
    ld   h, a                                   ; $4C01: $67
    ld   b, $10                                 ; $4C02: $06 $10
    call func_BC5                              ; $4C04: $CD $C5 $0B
    pop  hl                                     ; $4C07: $E1
    dec  c                                      ; $4C08: $0D
    jr   nz, .loop_4BE8_28                      ; $4C09: $20 $DD

    pop  bc                                     ; $4C0B: $C1
    pop  hl                                     ; $4C0C: $E1
    ret                                         ; $4C0D: $C9


JumpTable_028_4C0E:
    call func_028_4813                          ; $4C0E: JumpTable_028_4C0E $CD $13 $48
    cp   $F0                                    ; $4C11: JumpTable_028_4C0E $FE $F0
    jr   z, .return_4C29_28                     ; $4C13: JumpTable_028_4C0E $28 $14

    cp   $FF                                    ; $4C15: JumpTable_028_4C0E $FE $FF
    jr   z, .else_4C2A_28                       ; $4C17: JumpTable_028_4C0E $28 $11

    ld   a, [wGameplaySubtype]                  ; $4C19: JumpTable_028_4C0E $FA $96 $DB
    inc  a                                      ; $4C1C: JumpTable_028_4C0E $3C
    ld   [$D1C6], a                             ; $4C1D: JumpTable_028_4C0E $EA $C6 $D1
    xor  a                                      ; $4C20: JumpTable_028_4C0E $AF
    ld   [$D1C7], a                             ; $4C21: JumpTable_028_4C0E $EA $C7 $D1
    ld   a, $10                                 ; $4C24: JumpTable_028_4C0E $3E $10
    ld   [wGameplaySubtype], a                  ; $4C26: JumpTable_028_4C0E $EA $96 $DB
.return_4C29_28:
    ret                                         ; $4C29: JumpTable_028_4C0E $C9


.else_4C2A_28:
    ld   a, JINGLE_WRONG_ANSWER                 ; $4C2A: JumpTable_028_4C0E $3E $1D
    ldh  [hJingle], a                           ; $4C2C: JumpTable_028_4C0E $E0 $F2
    ld   a, $10                                 ; $4C2E: JumpTable_028_4C0E $3E $10
    ldh  [hFrameCounter], a                     ; $4C30: JumpTable_028_4C0E $E0 $E7
    ld   a, $11                                 ; $4C32: JumpTable_028_4C0E $3E $11
    ld   [wGameplaySubtype], a                  ; $4C34: JumpTable_028_4C0E $EA $96 $DB
    ret                                         ; $4C37: JumpTable_028_4C0E $C9


JumpTable_028_4C38:
    ld   a, [$D16D]                             ; $4C38: JumpTable_028_4C38 $FA $6D $D1
    cp   $FF                                    ; $4C3B: JumpTable_028_4C38 $FE $FF
    jp   z, func_028_45E9                       ; $4C3D: JumpTable_028_4C38 $CA $E9 $45

    ld   a, [$D172]                             ; $4C40: JumpTable_028_4C38 $FA $72 $D1
    and  a                                      ; $4C43: JumpTable_028_4C38 $A7
    jr   z, .else_4C54_28                       ; $4C44: JumpTable_028_4C38 $28 $0E

    ld   a, [$D16B]                             ; $4C46: JumpTable_028_4C38 $FA $6B $D1
    cp   $03                                    ; $4C49: JumpTable_028_4C38 $FE $03
    jr   z, .else_4C54_28                       ; $4C4B: JumpTable_028_4C38 $28 $07

    cp   $01                                    ; $4C4D: JumpTable_028_4C38 $FE $01
    jr   z, .else_4C54_28                       ; $4C4F: JumpTable_028_4C38 $28 $03

    jp   func_028_45E9                          ; $4C51: JumpTable_028_4C38 $C3 $E9 $45

.else_4C54_28:
    ld   a, $01                                 ; $4C54: JumpTable_028_4C38 $3E $01
    ld   [$D1B6], a                             ; $4C56: JumpTable_028_4C38 $EA $B6 $D1
    ld   hl, $C200                              ; $4C59: JumpTable_028_4C38 $21 $00 $C2
    ld   a, $09                                 ; $4C5C: JumpTable_028_4C38 $3E $09
    call func_028_48C1                          ; $4C5E: JumpTable_028_4C38 $CD $C1 $48
    cp   $FF                                    ; $4C61: JumpTable_028_4C38 $FE $FF
    jp   z, func_028_45E9                       ; $4C63: JumpTable_028_4C38 $CA $E9 $45

    cp   $F0                                    ; $4C66: JumpTable_028_4C38 $FE $F0
    ret  z                                      ; $4C68: JumpTable_028_4C38 $C8

    jp   func_028_44DB                          ; $4C69: JumpTable_028_4C38 $C3 $DB $44

JumpTable_028_4C6C:
    ld   a, [$D16D]                             ; $4C6C: JumpTable_028_4C6C $FA $6D $D1
    cp   $FF                                    ; $4C6F: JumpTable_028_4C6C $FE $FF
    jp   z, func_028_45E9                       ; $4C71: JumpTable_028_4C6C $CA $E9 $45

    ld   a, [$D172]                             ; $4C74: JumpTable_028_4C6C $FA $72 $D1
    and  a                                      ; $4C77: JumpTable_028_4C6C $A7
    jr   z, .else_4C87_28                       ; $4C78: JumpTable_028_4C6C $28 $0D

    ld   a, [$D16B]                             ; $4C7A: JumpTable_028_4C6C $FA $6B $D1
    cp   $02                                    ; $4C7D: JumpTable_028_4C6C $FE $02
    jr   z, .else_4C87_28                       ; $4C7F: JumpTable_028_4C6C $28 $06

    cp   $01                                    ; $4C81: JumpTable_028_4C6C $FE $01
    jr   z, .else_4C87_28                       ; $4C83: JumpTable_028_4C6C $28 $02

    jr   .return_4CAC_28                        ; $4C85: JumpTable_028_4C6C $18 $25

.else_4C87_28:
    ld   a, [$D16D]                             ; $4C87: JumpTable_028_4C6C $FA $6D $D1
    bit  1, a                                   ; $4C8A: JumpTable_028_4C6C $CB $4F
    jr   nz, .return_4CAC_28                    ; $4C8C: JumpTable_028_4C6C $20 $1E

    call func_028_4886                          ; $4C8E: JumpTable_028_4C6C $CD $86 $48
    cp   $FF                                    ; $4C91: JumpTable_028_4C6C $FE $FF
    jp   z, func_028_45E9                       ; $4C93: JumpTable_028_4C6C $CA $E9 $45

    cp   $F0                                    ; $4C96: JumpTable_028_4C6C $FE $F0
    ret  z                                      ; $4C98: JumpTable_028_4C6C $C8

    ld   a, $03                                 ; $4C99: JumpTable_028_4C6C $3E $03
    ld   [$D182], a                             ; $4C9B: JumpTable_028_4C6C $EA $82 $D1
    xor  a                                      ; $4C9E: JumpTable_028_4C6C $AF
    ld   [$D1C7], a                             ; $4C9F: JumpTable_028_4C6C $EA $C7 $D1
    ld   a, $10                                 ; $4CA2: JumpTable_028_4C6C $3E $10
    ld   [wGameplaySubtype], a                  ; $4CA4: JumpTable_028_4C6C $EA $96 $DB
    ld   a, $0F                                 ; $4CA7: JumpTable_028_4C6C $3E $0F
    ld   [$D1C6], a                             ; $4CA9: JumpTable_028_4C6C $EA $C6 $D1
.return_4CAC_28:
    ret                                         ; $4CAC: JumpTable_028_4C6C $C9


JumpTable_028_4CAD:
    ld   a, [$D16D]                             ; $4CAD: JumpTable_028_4CAD $FA $6D $D1
    cp   $FF                                    ; $4CB0: JumpTable_028_4CAD $FE $FF
    jp   z, func_028_45E9                       ; $4CB2: JumpTable_028_4CAD $CA $E9 $45

    bit  3, a                                   ; $4CB5: JumpTable_028_4CAD $CB $5F
    jp   nz, .return_4CCD_28                    ; $4CB7: JumpTable_028_4CAD $C2 $CD $4C

    bit  1, a                                   ; $4CBA: JumpTable_028_4CAD $CB $4F
    jp   nz, .return_4CCD_28                    ; $4CBC: JumpTable_028_4CAD $C2 $CD $4C

    ld   a, $01                                 ; $4CBF: JumpTable_028_4CAD $3E $01
    ld   [wGameplaySubtype], a                  ; $4CC1: JumpTable_028_4CAD $EA $96 $DB
    ld   a, MUSIC_MINIGAME                      ; $4CC4: JumpTable_028_4CAD $3E $02
    ld   [wMusicTrackToPlay], a                 ; $4CC6: JumpTable_028_4CAD $EA $68 $D3
    xor  a                                      ; $4CC9: JumpTable_028_4CAD $AF
    ld   [$D16B], a                             ; $4CCA: JumpTable_028_4CAD $EA $6B $D1
.return_4CCD_28:
    ret                                         ; $4CCD: JumpTable_028_4CAD $C9


JumpTable_028_4CCE:
    ld   hl, $D1C7                              ; $4CCE: JumpTable_028_4CCE $21 $C7 $D1
    inc  [hl]                                   ; $4CD1: JumpTable_028_4CCE $34
    ld   a, [hl]                                ; $4CD2: JumpTable_028_4CCE $7E
    cp   $06                                    ; $4CD3: JumpTable_028_4CCE $FE $06
    jr   c, .return_4CDF_28                     ; $4CD5: JumpTable_028_4CCE $38 $08

    xor  a                                      ; $4CD7: JumpTable_028_4CCE $AF
    ld   [hl], a                                ; $4CD8: JumpTable_028_4CCE $77
    ld   a, [$D1C6]                             ; $4CD9: JumpTable_028_4CCE $FA $C6 $D1
    ld   [wGameplaySubtype], a                  ; $4CDC: JumpTable_028_4CCE $EA $96 $DB
.return_4CDF_28:
    ret                                         ; $4CDF: JumpTable_028_4CCE $C9

; There's a pattern to this one... it repeats every five lines, but shifted to the right by one entry in the list. That's why there are four values missing at the end. The only thing that changes each time is the Px0 part, increasing by 2 each time. I have formatted the list accordingly.

BLOCK: macro
    db   $50, $38, $1E, $00, $50, $40, $24, $00 ; $4CE0 |P0..P8..|
    db   $50, $48, $26, $00, $50, $50, $28, $00 ; $4CE8 |P@..PH..|
    db   $50, $58, $2A, $00, $50, $60, $2C, $00 ; $4CF0 |PP$.PX&.|
    db   $50, $68, \1, $00
    db   $FF
ENDM

Data_028_4CE0:
    BLOCK $30
Data_028_4D09:
    BLOCK $32
Data_028_4D32:
    BLOCK $34
Data_028_4D5B:
    BLOCK $36

Data_028_4D84:
    dw Data_028_4CE0
    dw Data_028_4D09
    dw Data_028_4D32
    dw Data_028_4D5B

JumpTable_028_4D8C:
    ldh  a, [hJoypadState]                      ; $4D8C: JumpTable_028_4D8C $F0 $CC
    and  a                                      ; $4D8E: JumpTable_028_4D8C $A7
    jr   z, .else_4D9F_28                       ; $4D8F: JumpTable_028_4D8C $28 $0E

    ld   a, $01                                 ; $4D91: JumpTable_028_4D8C $3E $01
    ld   [wGameplaySubtype], a                  ; $4D93: JumpTable_028_4D8C $EA $96 $DB
    ld   a, MUSIC_MINIGAME                      ; $4D96: JumpTable_028_4D8C $3E $02
    ld   [wMusicTrackToPlay], a                 ; $4D98: JumpTable_028_4D8C $EA $68 $D3
    xor  a                                      ; $4D9B: JumpTable_028_4D8C $AF
    ld   [$C16B], a                             ; $4D9C: JumpTable_028_4D8C $EA $6B $C1
.else_4D9F_28:
    ldh  a, [hFrameCounter]                     ; $4D9F: JumpTable_028_4D8C $F0 $E7
    inc  a                                      ; $4DA1: JumpTable_028_4D8C $3C
    ldh  [hFrameCounter], a                     ; $4DA2: JumpTable_028_4D8C $E0 $E7
    and  %00110000                              ; $4DA4: JumpTable_028_4D8C $E6 $30
    jr   nz, .else_4DAD_28                      ; $4DA6: JumpTable_028_4D8C $20 $05

    ld   a, JINGLE_WRONG_ANSWER                 ; $4DA8: JumpTable_028_4D8C $3E $1D
    ldh  [hJingle], a                           ; $4DAA: JumpTable_028_4D8C $E0 $F2
    ret                                         ; $4DAC: JumpTable_028_4D8C $C9


.else_4DAD_28:
    ld   a, [$D1C5]                             ; $4DAD: JumpTable_028_4D8C $FA $C5 $D1
    sla  a                                      ; $4DB0: JumpTable_028_4D8C $CB $27
    add  LOW(Data_028_4D84)                     ; $4DB2: JumpTable_028_4D8C $C6 $84
    ld   l, a                                   ; $4DB4: JumpTable_028_4D8C $6F
    ld   a, HIGH(Data_028_4D84)                 ; $4DB5: JumpTable_028_4D8C $3E $4D
    adc  $00                                    ; $4DB7: JumpTable_028_4D8C $CE $00
    ld   h, a                                   ; $4DB9: JumpTable_028_4D8C $67
    ld   e, [hl]                                ; $4DBA: JumpTable_028_4D8C $5E
    inc  hl                                     ; $4DBB: JumpTable_028_4D8C $23
    ld   d, [hl]                                ; $4DBC: JumpTable_028_4D8C $56
    ld   hl, wram0Section                       ; $4DBD: JumpTable_028_4D8C $21 $00 $C0
.func_028_4DC0::
    ld   a, [de]                                ; $4DC0: JumpTable_028_4D8C $1A
    cp   $FF                                    ; $4DC1: JumpTable_028_4D8C $FE $FF
    ret  z                                      ; $4DC3: JumpTable_028_4D8C $C8

    ldi  [hl], a                                ; $4DC4: JumpTable_028_4D8C $22
    inc  de                                     ; $4DC5: JumpTable_028_4D8C $13
    ld   a, [de]                                ; $4DC6: JumpTable_028_4D8C $1A
    ldi  [hl], a                                ; $4DC7: JumpTable_028_4D8C $22
    inc  de                                     ; $4DC8: JumpTable_028_4D8C $13
    ld   a, [de]                                ; $4DC9: JumpTable_028_4D8C $1A
    ldi  [hl], a                                ; $4DCA: JumpTable_028_4D8C $22
    inc  de                                     ; $4DCB: JumpTable_028_4D8C $13
    ld   a, [de]                                ; $4DCC: JumpTable_028_4D8C $1A
    ldi  [hl], a                                ; $4DCD: JumpTable_028_4D8C $22
    inc  de                                     ; $4DCE: JumpTable_028_4D8C $13
    jr   .func_028_4DC0                         ; $4DCF: JumpTable_028_4D8C $18 $EF

; TODO: understand the purpose of these data blocks,
;       and move them to the relevant data/* directory.

; Animation data for the cutscenes that play when the mouse is setting the scene for the picture?

Data_028_4DD1::
    db   $50, $10, $2E, $01
    db   $50, $18, $4C, $01
    db   $50, $20, $4E, $01
    db   $50, $28, $50, $01
    db   $50, $30, $52, $01
    db   $50, $38, $54, $01
    db   $50, $40, $56, $01
    db   $4F, $48, $20, $21
    db   $50, $51, $38, $01
    db   $50, $59, $3A, $01

    db   $50, $0F, $2E, $01
    db   $50, $17, $4C, $01
    db   $50, $1F, $4E, $01
    db   $50, $27, $50, $01
    db   $50, $2F, $52, $01
    db   $50, $37, $54, $01
    db   $50, $3F, $56, $01
    db   $50, $48, $22, $01
    db   $4E, $52, $3C, $01
    db   $4E, $5A, $3E, $01

    db   $50, $10, $2E, $01
    db   $50, $18, $4C, $01
    db   $50, $20, $4E, $01
    db   $50, $28, $50, $01
    db   $50, $30, $52, $01
    db   $50, $38, $54, $01
    db   $50, $40, $56, $01
    db   $51, $48, $22, $01
    db   $50, $51, $3C, $01
    db   $50, $59, $3E, $01

    db   $50, $11, $2E, $01
    db   $50, $19, $4C, $01
    db   $50, $21, $4E, $01
    db   $50, $29, $50, $01
    db   $50, $31, $52, $01
    db   $50, $39, $54, $01
    db   $50, $41, $56, $01
    db   $53, $48, $20, $21
    db   $51, $50, $38, $01
    db   $51, $58, $3A, $01

    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4E99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4ED1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4ED9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4EF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F01 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F11 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4F99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $4FF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5001 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5009 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5011 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5019 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5021 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5029 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5031 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5039 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5041 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5049 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5051 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5059 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5061 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5069 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5071 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5079 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5081 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5089 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5091 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5099 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $50F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5101 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5109 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5111 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5119 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5121 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5129 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5131 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5139 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5141 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5149 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5151 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5159 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5161 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5169 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5171 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5179 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5181 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5189 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5191 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5199 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $51F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5201 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5209 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5211 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5219 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5221 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5229 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5231 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5239 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5241 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5249 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5251 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5259 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5261 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5269 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5271 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5279 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5281 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5289 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5291 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5299 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $52F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5301 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5309 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5311 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5319 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5321 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5329 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5331 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5339 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5341 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5349 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5351 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5359 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5361 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5369 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5371 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5379 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5381 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5389 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5391 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5399 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $53F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5401 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5409 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5411 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5419 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5421 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5429 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5431 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5439 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5441 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5449 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5451 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5459 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5461 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5469 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5471 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5479 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5481 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5489 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5491 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5499 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $54F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5501 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5509 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5511 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5519 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5521 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5529 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5531 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5539 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5541 |........|
    db   $00, $00, $00, $00, $00, $00, $00

testlabel:
    db   $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00

Data_028_5550:
    db $A3

    ; This table is incorrectly formatted, the increasing value pattern repeats every 20 values.
    ; Increasing values
    db   $A3, $01, $02, $03, $44, $05, $06, $07 ; $5551 |....D...|
    db   $08, $09, $1A, $0B, $0C, $1A, $0E, $0F ; $5559 |........|

    ; Increasing values
    db   $DF, $A3, $A3, $A3, $A3, $11, $44, $13 ; $5561 |......D.|
    db   $14, $15, $16, $17, $18, $19, $1A, $1B ; $5569 |........|
    db   $1C, $1D, $1E, $1F, $EF, $A3, $A3, $6F ; $5571 |.......o|

    ; Increasing values
    db   $A3, $21, $22, $44, $24, $25, $26, $27 ; $5579 |.!"D$%&'|
    db   $28, $29, $2A, $2B, $2C, $2D, $2E, $2F ; $5581 |()*+,-./|

    ; Increasing values
    db   $FF, $A3, $A3, $A3, $A3, $A3, $32, $44 ; $5589 |......2D|
    db   $34, $35, $36, $37, $38, $39, $3A, $3B ; $5591 |456789:;|
    db   $3C, $3D, $3E, $3F, $EE, $A3, $A3, $A3 ; $5599 |<=>?....|

    ; Increasing values
    db   $A3, $A3, $42, $43, $44, $45, $46, $47 ; $55A1 |..BCDEFG|
    db   $48, $49, $4A, $4B, $4C, $4D, $4E, $4F ; $55A9 |HIJKLMNO|

    ; Increasing values
    db   $A3, $6F, $A3, $A3, $A3, $A3, $52, $53 ; $55B1 |.o....RS|
    db   $54, $55, $56, $57, $58, $59, $5A, $5B ; $55B9 |TUVWXYZ[|
    db   $5C, $5D, $5E, $5F, $A3, $A3, $A3, $6F ; $55C1 |\]^_...o|

    ; Increasing values
    db   $A3, $A3, $62, $63, $64, $65, $66, $67 ; $55C9 |..bcdefg|
    db   $68, $69, $6A, $6B, $6C, $6D, $6E, $6F ; $55D1 |hijklmno|

    ; Increasing values
    db   $A3, $A3, $A3, $A3, $A3, $A3, $6F, $73 ; $55D9 |......os|
    db   $74, $75, $76, $77, $78, $79, $7A, $7B ; $55E1 |tuvwxyz{|
    db   $7C, $7D, $7E, $7F, $A3, $A3, $A3, $A3 ; $55E9 ||}~.....|

    ; Increasing values
    db   $A3, $A3, $A3, $83, $84, $85, $86, $87 ; $55F1 |........|
    db   $88, $89, $8A, $8B, $8C, $8D, $8E, $8F ; $55F9 |........|

    ; Increasing values
    db   $A3, $A3, $A3, $12, $04, $12, $92, $93 ; $5601 |........|
    db   $94, $95, $96, $97, $98, $99, $9A, $9B ; $5609 |........|
    db   $9C, $9D, $9E, $9F, $A0, $12, $04, $0A ; $5611 |........|

    ; Increasing values
    db   $0D, $0A, $A2, $44, $A4, $A5, $A6, $A7 ; $5619 |...D....|
    db   $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF ; $5621 |........|

    ; Increasing values
    db   $B0, $0A, $0D, $12, $04, $B1, $B2, $B3 ; $5629 |........|
    db   $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB ; $5631 |........|
    db   $BC, $BD, $BE, $12, $04, $12, $04, $0A ; $5639 |........|

    ; Increasing values
    db   $0D, $0A, $C2, $C3, $C4, $C5, $C6, $C7 ; $5641 |........|
    db   $C8, $C9, $CA, $CB, $CC, $CD, $CE, $0A ; $5649 |........|

    ; Increasing values
    db   $0D, $0A, $0D, $10, $D0, $D1, $D2, $D3 ; $5651 |........|
    db   $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB ; $5659 |........|
    db   $DC, $40, $72, $60, $61, $10, $10, $00 ; $5661 |.@r`a...|

    ; Increasing values
    db   $E0, $E1, $E2, $E3, $44, $E5, $E6, $E7 ; $5669 |....D...|
    db   $E8, $E9, $EA, $EB, $EC, $44, $41, $70 ; $5671 |.....DAp|

    ; Increasing values
    db   $71, $20, $90, $00, $F0, $F1, $F2, $F3 ; $5679 |q ......|
    db   $F4, $F5, $F6, $F7, $F8, $FD, $FE, $30 ; $5681 |.......0|
    db   $31, $50, $51, $80, $81, $82, $00, $F9 ; $5689 |1PQ.....|
    db   $FA, $F9, $FA, $F9, $FA, $F9, $FA, $F9 ; $5691 |........|
    db   $FA, $F9, $FA, $F9, $FA, $F9, $FA, $F9 ; $5699 |........|
    db   $FA, $F9, $FA, $FB, $FC, $FB, $FC, $FB ; $56A1 |........|
    db   $FC, $FB, $FC, $FB, $FC, $FB, $FC, $FB ; $56A9 |........|
    db   $FC, $FB, $FC, $FB, $FC, $FB, $FC, $00 ; $56B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $56F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5701 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5709 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5711 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5719 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5721 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5729 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5731 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5739 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5741 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5749 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5751 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5759 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5761 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5769 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5771 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5779 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5781 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5789 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5791 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5799 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $57F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5801 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5809 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5811 |........|
    db   $00, $00, $00, $00, $00, $00, $00

Data_028_5820:
    db $42 ; $5819 |.......B|

    ; Increasing values
    db   $42, $B1, $B2, $B3, $94, $35, $16, $17 ; $5821 |B....5..|
    db   $08, $09, $0A, $0B, $0C, $1D, $1E, $B2 ; $5829 |........|

    ; Increasing values
    db   $BF, $42, $42, $42, $42, $B1, $B2, $B3 ; $5831 |.BBBB...|
    db   $84, $35, $16, $17, $18, $19, $1A, $1B ; $5839 |.5......|
    db   $1C, $1D, $1E, $B2, $BF, $42, $42, $0D ; $5841 |.....BB.|

    ; Increasing values
    db   $42, $B1, $B2, $B3, $84, $35, $26, $27 ; $5849 |B....5&'|
    db   $28, $29, $2A, $2B, $2C, $2D, $2E, $B2 ; $5851 |()*+,-..|

    ; Increasing values
    db   $BF, $42, $42, $42, $42, $B1, $B2, $B3 ; $5859 |.BBBB...|
    db   $84, $35, $36, $37, $38, $39, $3A, $3B ; $5861 |.56789:;|
    db   $3C, $3D, $3E, $B2, $BF, $42, $42, $42 ; $5869 |<=>..BBB|

    ; Increasing values
    db   $42, $B1, $B2, $B3, $44, $45, $46, $47 ; $5871 |B...DEFG|
    db   $48, $49, $4A, $4B, $4C, $4D, $4E, $B2 ; $5879 |HIJKLMN.|

    ; Increasing values
    db   $BF, $0D, $42, $42, $42, $B1, $B2, $B3 ; $5881 |..BBB...|
    db   $54, $55, $56, $57, $58, $59, $5A, $5B ; $5889 |TUVWXYZ[|
    db   $5C, $5D, $5E, $B2, $BF, $42, $42, $0D ; $5891 |\]^..BB.|

    ; Increasing values
    db   $42, $B1, $B2, $B3, $64, $65, $66, $67 ; $5899 |B...defg|
    db   $68, $69, $6A, $6B, $6C, $6D, $1E, $B2 ; $58A1 |hijklm..|

    ; Increasing values
    db   $BF, $42, $42, $42, $42, $B1, $B2, $B3 ; $58A9 |.BBBB...|
    db   $74, $75, $76, $77, $78, $79, $7A, $7B ; $58B1 |tuvwxyz{|
    db   $7C, $1D, $1E, $B2, $BF, $42, $42, $42 ; $58B9 ||....BBB|

    ; Increasing values
    db   $42, $B1, $B2, $B3, $84, $35, $86, $87 ; $58C1 |B....5..|
    db   $88, $89, $8A, $8B, $8C, $1D, $1E, $B2 ; $58C9 |........|

    ; Increasing values
    db   $BF, $42, $42, $53, $52, $B1, $B2, $B3 ; $58D1 |.BBSR...|
    db   $94, $95, $96, $97, $98, $99, $9A, $9B ; $58D9 |........|
    db   $9C, $1D, $1E, $B2, $BF, $52, $53, $63 ; $58E1 |.....RSc|

    ; Increasing values
    db   $62, $B1, $B2, $B3, $94, $35, $A6, $A7 ; $58E9 |b....5..|
    db   $A8, $A9, $AA, $AB, $AC, $1D, $1E, $B2 ; $58F1 |........|

    ; Increasing values
    db   $BF, $62, $63, $53, $52, $B1, $B2, $B3 ; $58F9 |.bcSR...|
    db   $94, $35, $B6, $B7, $B8, $B9, $BA, $BB ; $5901 |.5......|
    db   $9C, $1D, $1E, $B2, $BF, $52, $53, $63 ; $5909 |.....RSc|

    ; Increasing values
    db   $62, $70, $71, $72, $80, $81, $82, $C7 ; $5911 |bpqr....|
    db   $C8, $C9, $CA, $90, $91, $92, $9D, $9E ; $5919 |........|

    ; Increasing values
    db   $9F, $62, $63, $A0, $D0, $D1, $D2, $D3 ; $5921 |.bc.....|
    db   $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB ; $5929 |........|
    db   $DC, $00, $01, $02, $D1, $A0, $D0, $A1 ; $5931 |........|

    ; Increasing values
    db   $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7 ; $5939 |........|
    db   $E8, $E9, $EA, $EB, $EC, $E4, $11, $12 ; $5941 |........|

    ; Increasing values
    db   $13, $14, $A1, $A1, $F0, $F1, $F2, $F3 ; $5949 |........|
    db   $F4, $F5, $F6, $F7, $F8, $C0, $C1, $C2 ; $5951 |........|
    db   $C3, $20, $21, $22, $23, $30, $A1, $FA ; $5959 |. !"#0..|
    db   $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA ; $5961 |........|
    db   $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA ; $5969 |........|
    db   $FA, $FA, $FA, $FB, $FC, $FB, $FC, $FB ; $5971 |........|
    db   $FC, $FB, $FC, $FB, $FC, $FB, $FC, $FB ; $5979 |........|
    db   $FC, $FB, $FC, $FB, $FC, $FB, $FC, $00 ; $5981 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5989 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5991 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5999 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $59F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A01 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A11 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5A91 |........|
    db   $00, $00, $00, $00, $20, $00, $00, $00 ; $5A99 |.... ...|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5AE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00

Data_028_5AF0:
    db   $89 ; $5AE9 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5AF1 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5AF9 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5B01 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5B09 |........|
    db   $89, $9A, $9B, $89, $89, $89, $89, $89 ; $5B11 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5B19 |........|
    db   $89, $89, $89, $8C, $8D, $9F, $9F, $9D ; $5B21 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5B29 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $9C ; $5B31 |........|
    db   $9F, $9F, $9F, $9E, $9A, $9B, $89, $89 ; $5B39 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $89 ; $5B41 |........|
    db   $89, $8C, $8D, $9F, $9F, $9F, $9F, $9F ; $5B49 |........|
    db   $9F, $9F, $99, $89, $89, $89, $89, $89 ; $5B51 |........|
    db   $89, $89, $89, $89, $89, $9C, $9F, $9F ; $5B59 |........|

    ; Increasing values
    db   $9F, $04, $05, $06, $07, $9F, $9F, $89 ; $5B61 |........|
    db   $89, $89, $89, $89, $89, $89, $89, $8C ; $5B69 |........|
    db   $8D, $9F, $11, $12, $13, $14, $15, $16 ; $5B71 |........|
    db   $17, $9F, $9F, $88, $9A, $9B, $89, $89 ; $5B79 |........|

    ; Increasing values
    db   $89, $89, $89, $9C, $9F, $20, $21, $22 ; $5B81 |..... !"|
    db   $23, $24, $25, $26, $27, $9F, $9F, $9F ; $5B89 |#$%&'...|
    db   $9F, $9F, $9D, $89, $89, $8C, $98, $9F ; $5B91 |........|

    ; Increasing values
    db   $9F, $30, $31, $32, $A9, $AA, $AB, $AA ; $5B99 |.012....|
    db   $AB, $AA, $AB, $9F, $9F, $9F, $9E, $9A ; $5BA1 |........|

    ; Increasing values
    db   $9B, $9C, $9F, $9F, $9F, $9F, $B7, $B8 ; $5BA9 |........|
    db   $B9, $BA, $BB, $BA, $BB, $BA, $BB, $9F ; $5BB1 |........|
    db   $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F ; $5BB9 |........|

    ; Increasing values
    db   $9F, $81, $82, $83, $84, $85, $86, $85 ; $5BC1 |........|
    db   $86, $85, $86, $9F, $9F, $9F, $9F, $9F ; $5BC9 |........|

    ; Increasing values
    db   $9F, $9F, $9F, $9F, $90, $91, $92, $93 ; $5BD1 |........|
    db   $94, $95, $96, $95, $96, $95, $96, $9F ; $5BD9 |........|
    db   $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F ; $5BE1 |........|

    ; Increasing values
    db   $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A5 ; $5BE9 |........|
    db   $A6, $A5, $A6, $9F, $9F, $9F, $9F, $9F ; $5BF1 |........|

    ; Increasing values
    db   $9F, $9F, $9F, $9F, $B0, $B1, $B2, $B3 ; $5BF9 |........|
    db   $B4, $B5, $B6, $B5, $B6, $B5, $B6, $9F ; $5C01 |........|
    db   $9F, $9F, $9F, $9F, $9F, $9F, $9F, $01 ; $5C09 |........|

    ; Increasing values
    db   $C0, $C1, $C2, $C3, $C4, $C5, $C6, $49 ; $5C11 |.......I|
    db   $4A, $4B, $4C, $9F, $10, $9F, $00, $9F ; $5C19 |JKL.....|

    ; Increasing values
    db   $01, $9F, $9F, $58, $D0, $D1, $D2, $44 ; $5C21 |...X...D|
    db   $45, $46, $47, $59, $5A, $5B, $5C, $60 ; $5C29 |EFGYZ[\`|
    db   $01, $9F, $10, $9F, $9F, $00, $9F, $68 ; $5C31 |.......h|

    ; Increasing values
    db   $E0, $E1, $E2, $54, $55, $56, $57, $69 ; $5C39 |...TUVWi|
    db   $6A, $6B, $6C, $70, $71, $72, $73, $74 ; $5C41 |jklpqrst|
    db   $75, $76, $77, $78, $F0, $F1, $F2, $64 ; $5C49 |uvwx...d|
    db   $65, $66, $67, $79, $7A, $7B, $7C, $00 ; $5C51 |efgyz{|.|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5C99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5CF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D01 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D11 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5D99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5DA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5DA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5DB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $5DB9 |........|

Data_028_5DC0:
    db   $0A, $0B, $0C, $0A, $0B, $0C, $0A, $0B, $0C ; $5DC1 |........|
    db   $23, $24, $25, $26, $27, $28, $29, $2A ; $5DC9 |#$%&'()*|
    db   $2B, $0A, $0B, $0D, $0E, $0F, $0D, $0E ; $5DD1 |+.......|
    db   $0F, $0D, $0E, $2C, $2D, $2E, $2F, $30 ; $5DD9 |...,-./0|
    db   $31, $32, $33, $34, $35, $0D, $0E, $10 ; $5DE1 |12345...|
    db   $11, $12, $10, $11, $12, $10, $57, $58 ; $5DE9 |......WX|
    db   $59, $5A, $5B, $5C, $5D, $5E, $5F, $60 ; $5DF1 |YZ[\]^_`|
    db   $61, $10, $11, $13, $14, $15, $13, $14 ; $5DF9 |a.......|
    db   $15, $62, $63, $64, $65, $66, $67, $68 ; $5E01 |.bcdefgh|
    db   $69, $6A, $6B, $14, $15, $13, $14, $16 ; $5E09 |ijk.....|
    db   $17, $18, $16, $17, $18, $6C, $6D, $6E ; $5E11 |.....lmn|
    db   $6F, $70, $71, $72, $73, $74, $75, $17 ; $5E19 |opqrstu.|
    db   $18, $16, $17, $19, $1A, $1B, $19, $1A ; $5E21 |........|
    db   $1B, $76, $77, $78, $79, $7A, $5A, $7B ; $5E29 |.vwxyzZ{|
    db   $7C, $7D, $7E, $7F, $1B, $19, $1A, $1C ; $5E31 ||}~.....|
    db   $1D, $1E, $1C, $1D, $1E, $1C, $80, $81 ; $5E39 |........|
    db   $82, $83, $84, $85, $86, $87, $88, $89 ; $5E41 |........|
    db   $1E, $1C, $1D, $1F, $20, $21, $1F, $20 ; $5E49 |.... !. |
    db   $21, $1F, $8A, $8B, $8C, $8D, $8E, $8F ; $5E51 |!.......|
    db   $90, $91, $92, $93, $94, $1F, $20, $00 ; $5E59 |...... .|
    db   $00, $00, $00, $00, $00, $00, $95, $96 ; $5E61 |........|
    db   $97, $98, $99, $9A, $9B, $9C, $9D, $9E ; $5E69 |........|
    db   $9F, $00, $00, $00, $00, $00, $00, $00 ; $5E71 |........|

    ; Increasing values
    db   $36, $A0, $A1, $A2, $A3, $A4, $A5, $A6 ; $5E79 |6.......|
    db   $A7, $A8, $A9, $AA, $AB, $00, $00, $37 ; $5E81 |.......7|
    db   $38, $39, $3A, $3B, $3C, $AC, $AD, $AE ; $5E89 |89:;<...|
    db   $AF, $B0, $B1, $B2, $B3, $B4, $B5, $B6 ; $5E91 |........|
    db   $00, $00, $00, $3D, $3E, $3F, $40, $41 ; $5E99 |...=>?@A|
    db   $42, $B7, $B8, $B9, $BA, $BB, $BC, $BD ; $5EA1 |B.......|
    db   $BE, $BF, $C0, $00, $00, $00, $00, $43 ; $5EA9 |.......C|
    db   $44, $45, $46, $47, $48, $C1, $C2, $C3 ; $5EB1 |DEFGH...|
    db   $C4, $C5, $C6, $C7, $C8, $C9, $00, $00 ; $5EB9 |........|
    db   $00, $00, $00, $00, $00, $49, $4A, $4B ; $5EC1 |.....IJK|
    db   $4C, $CA, $CB, $CC, $CD, $CE, $CF, $D0 ; $5EC9 |L.......|
    db   $D1, $D2, $00, $00, $00, $00, $00, $00 ; $5ED1 |........|
    db   $00, $4D, $4E, $4F, $50, $D3, $D4, $D5 ; $5ED9 |.MNOP...|
    db   $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD ; $5EE1 |........|
    db   $DE, $00, $00, $00, $00, $00, $51, $52 ; $5EE9 |......QR|
    db   $53, $DF, $E0, $E1, $E2, $E3, $E4, $E5 ; $5EF1 |S.......|
    db   $E6, $E7, $E8, $E8, $E9, $00, $00, $00 ; $5EF9 |........|
    db   $00, $00, $54, $55, $56, $EA, $EB, $EC ; $5F01 |..TUV...|
    db   $ED, $EE, $EF, $F0, $01, $00, $02, $03 ; $5F09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F11 |........|
    db   $04, $05, $06, $07, $08, $06, $09, $00 ; $5F19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5F99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $5FF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6001 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6009 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6011 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6019 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6021 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6029 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6031 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6039 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6041 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6049 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6051 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6059 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6061 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6069 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6071 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6079 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6081 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $6089 |........|

Data_028_6090:
    db   $12 , $12, $12, $12, $12, $12, $12, $12, $12 ; $6091 |........|
    db   $12, $12, $12, $12, $12, $12, $12, $12 ; $6099 |........|
    db   $12, $12, $12, $12, $12, $02, $A2, $12 ; $60A1 |........|
    db   $12, $12, $12, $12, $12, $12, $12, $12 ; $60A9 |........|
    db   $12, $02, $A3, $A2, $12, $12, $12, $00 ; $60B1 |........|
    db   $01, $C1, $C1, $A2, $12, $12, $12, $12 ; $60B9 |........|
    db   $12, $12, $12, $12, $00, $C1, $C1, $C1 ; $60C1 |........|
    db   $A4, $12, $12, $C1, $C1, $C1, $C1, $C1 ; $60C9 |........|
    db   $A4, $02, $A3, $A4, $12, $12, $12, $02 ; $60D1 |........|
    db   $C1, $C1, $C1, $C1, $C1, $A1, $02, $C1 ; $60D9 |........|
    db   $C1, $C1, $C1, $C1, $13, $C1, $C1, $C1 ; $60E1 |........|
    db   $A4, $12, $02, $C1, $C1, $C1, $C1, $C1 ; $60E9 |........|
    db   $13, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $60F1 |........|
    db   $C1, $C1, $C1, $C1, $C1, $A3, $C1, $C1 ; $60F9 |........|
    db   $C1, $C1, $C1, $C1, $13, $13, $13, $C1 ; $6101 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $13, $10 ; $6109 |........|
    db   $11, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6111 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6119 |........|
    db   $C1, $C1, $13, $20, $21, $22, $23, $24 ; $6121 |... !"#$|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6129 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $30 ; $6131 |.......0|
    db   $31, $32, $33, $34, $C1, $C1, $C1, $C1 ; $6139 |1234....|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6141 |........|
    db   $C1, $C1, $C1, $40, $41, $42, $43, $44 ; $6149 |...@ABCD|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6151 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6159 |........|
    db   $51, $52, $C1, $C1, $C1, $C1, $C1, $C1 ; $6161 |QR......|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6169 |........|
    db   $C1, $C1, $08, $09, $0A, $0B, $0C, $0D ; $6171 |........|
    db   $0E, $07, $C1, $C1, $C1, $C1, $C1, $C1 ; $6179 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $18, $19 ; $6181 |........|
    db   $1A, $1B, $1C, $1D, $1E, $17, $C1, $C1 ; $6189 |........|
    db   $C1, $C1, $C1, $C1, $C1, $C1, $C1, $C1 ; $6191 |........|
    db   $C1, $C1, $28, $29, $2A, $2B, $2C, $2D ; $6199 |..()*+,-|
    db   $2E, $C1, $C1, $C1, $C1, $C1, $C1, $90 ; $61A1 |........|
    db   $91, $92, $90, $91, $92, $90, $91, $92 ; $61A9 |........|
    db   $90, $91, $92, $90, $91, $92, $90, $91 ; $61B1 |........|
    db   $92, $90, $91, $12, $12, $12, $12, $B0 ; $61B9 |........|
    db   $B1, $12, $12, $12, $12, $12, $12, $12 ; $61C1 |........|
    db   $12, $12, $B0, $B1, $12, $12, $12, $12 ; $61C9 |........|
    db   $B2, $B3, $12, $12, $12, $12, $12, $12 ; $61D1 |........|
    db   $12, $B0, $B1, $12, $12, $12, $12, $12 ; $61D9 |........|
    db   $12, $B2, $B3, $D0, $D1, $D2, $D3, $D0 ; $61E1 |........|
    db   $D1, $D2, $D3, $D0, $D1, $D2, $D3, $D0 ; $61E9 |........|
    db   $D1, $D2, $D3, $D0, $D1, $D2, $D3, $00 ; $61F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $61F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6201 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6209 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6211 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6219 |........|
    db   $00, $20, $20, $00, $00, $00, $00, $00 ; $6221 |.  .....|
    db   $00, $00, $00, $00, $00, $20, $20, $20 ; $6229 |.....   |
    db   $00, $00, $00, $20, $20, $20, $20, $20 ; $6231 |...     |
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6239 |........|
    db   $20, $20, $20, $20, $20, $00, $00, $20 ; $6241 |     .. |
    db   $20, $20, $20, $20, $00, $20, $20, $20 ; $6249 |    .   |
    db   $00, $00, $00, $20, $20, $20, $20, $20 ; $6251 |...     |
    db   $00, $20, $20, $20, $20, $20, $20, $20 ; $6259 |.       |
    db   $20, $20, $20, $20, $20, $00, $20, $20 ; $6261 |     .  |
    db   $20, $20, $20, $20, $00, $00, $00, $20 ; $6269 |    ... |
    db   $20, $20, $20, $20, $20, $20, $00, $00 ; $6271 |      ..|
    db   $00, $20, $20, $20, $20, $20, $20, $20 ; $6279 |.       |
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $6281 |        |
    db   $20, $20, $00, $00, $00, $00, $00, $00 ; $6289 |  ......|
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $6291 |        |
    db   $20, $20, $20, $20, $20, $20, $20, $00 ; $6299 |       .|
    db   $00, $00, $00, $00, $20, $20, $20, $20 ; $62A1 |....    |
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $62A9 |        |
    db   $20, $20, $20, $00, $00, $00, $00, $00 ; $62B1 |   .....|
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $62B9 |        |
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $62C1 |        |
    db   $00, $00, $20, $20, $20, $20, $20, $20 ; $62C9 |..      |
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $62D1 |        |
    db   $20, $20, $00, $00, $00, $00, $00, $00 ; $62D9 |  ......|
    db   $00, $00, $20, $20, $20, $20, $20, $20 ; $62E1 |..      |
    db   $20, $20, $20, $20, $20, $20, $00, $00 ; $62E9 |      ..|
    db   $00, $00, $00, $00, $00, $00, $20, $20 ; $62F1 |......  |
    db   $20, $20, $20, $20, $20, $20, $20, $20 ; $62F9 |        |
    db   $20, $20, $00, $00, $00, $00, $00, $00 ; $6301 |  ......|
    db   $00, $20, $20, $20, $20, $20, $20, $00 ; $6309 |.      .|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6311 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6319 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6321 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6329 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6331 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6339 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6341 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6349 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6351 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $6359 |........|

Data_028_6360:
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01 ; $6361 |........|
    db   $02, $02, $03, $04, $05, $01, $02, $02 ; $6369 |........|
    db   $02, $02, $05, $06, $06, $06, $06, $06 ; $6371 |........|
    db   $06, $06, $06, $07, $08, $09, $0A, $FE ; $6379 |........|
    db   $0B, $07, $FE, $09, $0A, $FE, $0B, $0C ; $6381 |........|
    db   $0D, $0C, $0D, $0C, $0D, $0C, $0D, $0E ; $6389 |........|
    db   $FE, $FE, $FE, $0F, $10, $11, $12, $13 ; $6391 |........|
    db   $FE, $08, $14, $15, $16, $15, $16, $15 ; $6399 |........|
    db   $16, $15, $16, $17, $18, $18, $19, $1A ; $63A1 |........|
    db   $1B, $1C, $1D, $1E, $18, $18, $1F, $0C ; $63A9 |........|
    db   $0D, $0C, $0D, $0C, $0D, $0C, $0D, $20 ; $63B1 |....... |
    db   $21, $22, $23, $24, $25, $26, $27, $28 ; $63B9 |!"#$%&'(|
    db   $29, $FE, $0B, $2A, $2B, $2C, $16, $15 ; $63C1 |)..*+,..|
    db   $16, $15, $16, $2E, $2F, $30, $31, $32 ; $63C9 |..../012|
    db   $33, $34, $35, $36, $37, $38, $39, $3A ; $63D1 |3456789:|
    db   $3B, $3C, $16, $0C, $0D, $0C, $3D, $2D ; $63D9 |                                                                                                                                         ;<....=-|
    db   $3E, $3F, $40, $41, $42, $43, $44, $45 ; $63E1 |>?@ABCDE|
    db   $46, $47, $48, $49, $4A, $4B, $4C, $15 ; $63E9 |FGHIJKL.|
    db   $16, $15, $4D, $4E, $4F, $50, $51, $52 ; $63F1 |..MNOPQR|
    db   $53, $54, $55, $56, $57, $58, $59, $5A ; $63F9 |STUVWXYZ|
    db   $5B, $5C, $5D, $5E, $5F, $60, $61, $62 ; $6401 |[\]^_`ab|
    db   $63, $64, $65, $66, $67, $68, $69, $6A ; $6409 |cdefghij|
    db   $6B, $6C, $6D, $6E, $6F, $70, $71, $72 ; $6411 |klmnopqr|
    db   $73, $74, $75, $76, $77, $78, $79, $7A ; $6419 |stuvwxyz|
    db   $7B, $7C, $7D, $7E, $7F, $80, $1F, $81 ; $6421 |{|}~....|
    db   $82, $83, $84, $85, $86, $87, $88, $89 ; $6429 |........|
    db   $8A, $8B, $8C, $8D, $8E, $8F, $90, $91 ; $6431 |........|
    db   $92, $93, $0B, $94, $95, $96, $97, $98 ; $6439 |........|
    db   $99, $9A, $9B, $9C, $9D, $9E, $9F, $A0 ; $6441 |........|
    db   $A1, $A2, $A3, $A4, $A5, $A6, $14, $A7 ; $6449 |........|
    db   $A8, $FD, $A9, $A7, $AA, $AB, $AC, $AD ; $6451 |........|
    db   $AE, $AF, $B0, $B1, $B2, $B3, $B4, $B5 ; $6459 |........|
    db   $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD ; $6461 |........|
    db   $BE, $BF, $C0, $C1, $C2, $C3, $C4, $C5 ; $6469 |........|
    db   $C6, $C7, $C8, $C9, $CA, $B9, $BD, $CB ; $6471 |........|
    db   $CC, $CD, $CE, $CB, $CF, $D0, $D1, $D2 ; $6479 |........|
    db   $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA ; $6481 |........|
    db   $DB, $DC, $DD, $DE, $DF, $E0, $E1, $DE ; $6489 |........|
    db   $E2, $E3, $E4, $DE, $E5, $E6, $E7, $E8 ; $6491 |........|
    db   $E9, $EA, $EB, $EC, $ED, $E3, $E4, $EE ; $6499 |........|
    db   $EF, $F0, $F1, $EE, $EF, $F0, $F1, $EE ; $64A1 |........|
    db   $EF, $F2, $F3, $F4, $F5, $F6, $F7, $F8 ; $64A9 |........|
    db   $EF, $F0, $F1, $F9, $FA, $FB, $FC, $F9 ; $64B1 |........|
    db   $FA, $FB, $FC, $F9, $FA, $FB, $FC, $F9 ; $64B9 |........|
    db   $FA, $FB, $FC, $F9, $FA, $FB, $FC, $00 ; $64C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $64F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6501 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6509 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6511 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6519 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6521 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6529 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6531 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6539 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6541 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6549 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6551 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6559 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6561 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6569 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6571 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6579 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6581 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6589 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6591 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6599 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $65F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6601 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6609 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6611 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6619 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6621 |........|
    db   $00, $00, $00, $00, $00, $00, $00; $6629 |........|

Data_028_6630:
    db   $1F ,$1C, $1C, $1C, $20, $21, $1D, $1D, $1D ; $6631 |... !...|
    db   $1D, $22, $23, $1C, $1C, $24, $25, $DA ; $6639 |."#..$%.|
    db   $DB, $25, $DA, $26, $1C, $1C, $27, $28 ; $6641 |.%.&..'(|
    db   $1D, $29, $2A, $2B, $2C, $2D, $2E, $23 ; $6649 |.)*+,-.#|
    db   $1C, $2F, $30, $DC, $DD, $DE, $DC, $31 ; $6651 |./0....1|
    db   $1C, $32, $33, $1D, $34, $35, $36, $37 ; $6659 |.23.4567|
    db   $38, $39, $3A, $3B, $1C, $3C, $3D, $DF ; $6661 |89:                                                                                                                                      ;.<=.|
    db   $E0, $E1, $DF, $3E, $3F, $40, $41, $42 ; $6669 |...>?@AB|
    db   $43, $44, $45, $46, $47, $48, $49, $4A ; $6671 |CDEFGHIJ|
    db   $4B, $4C, $4D, $E2, $E3, $E4, $E5, $4E ; $6679 |KLM....N|
    db   $4F, $50, $51, $52, $53, $54, $55, $56 ; $6681 |OPQRSTUV|
    db   $57, $58, $58, $59, $5A, $5B, $5C, $E6 ; $6689 |WXXYZ[\.|
    db   $E7, $E8, $E9, $5D, $5E, $5F, $60, $61 ; $6691 |...]^_`a|
    db   $62, $63, $64, $65, $66, $67, $68, $69 ; $6699 |bcdefghi|
    db   $6A, $6B, $6C, $EA, $EB, $EC, $6C, $5D ; $66A1 |jkl...l]|
    db   $6D, $6E, $6F, $1C, $70, $71, $72, $73 ; $66A9 |mno.pqrs|
    db   $74, $75, $1E, $1E, $76, $77, $6C, $ED ; $66B1 |tu..vwl.|
    db   $EE, $1D, $6C, $5D, $78, $79, $1D, $7A ; $66B9 |..l]xy.z|
    db   $7B, $7C, $7D, $7E, $7F, $80, $81, $82 ; $66C1 |{|}~....|
    db   $83, $84, $85, $EF, $F0, $1D, $6C, $86 ; $66C9 |......l.|
    db   $87, $88, $89, $8A, $8B, $8C, $8D, $8E ; $66D1 |........|
    db   $8F, $90, $91, $92, $93, $94, $95, $F1 ; $66D9 |........|
    db   $F2, $F3, $F4, $96, $97, $96, $98, $99 ; $66E1 |........|
    db   $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1 ; $66E9 |........|
    db   $A2, $A3, $A4, $F5, $00, $01, $02, $96 ; $66F1 |........|
    db   $97, $96, $97, $A5, $A6, $A7, $A8, $A9 ; $66F9 |........|
    db   $AA, $AB, $AC, $AD, $AE, $AF, $B0, $F6 ; $6701 |........|
    db   $F7, $F8, $F9, $B1, $B2, $1E, $1E, $B3 ; $6709 |........|
    db   $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB ; $6711 |........|
    db   $BC, $BD, $BE, $FA, $FB, $FC, $FD, $BF ; $6719 |........|
    db   $C0, $C1, $C2, $C3, $C4, $00, $03, $C5 ; $6721 |........|
    db   $C6, $C7, $C8, $C9, $CA, $01, $02, $04 ; $6729 |........|
    db   $00, $01, $02, $1E, $1E, $B1, $B2, $1E ; $6731 |........|
    db   $CB, $06, $07, $CC, $CD, $CE, $CF, $D0 ; $6739 |........|
    db   $D1, $FE, $08, $05, $06, $FE, $08, $D2 ; $6741 |........|
    db   $D3, $BF, $C0, $1E, $1E, $1E, $1E, $D4 ; $6749 |........|
    db   $D5, $D6, $D7, $D8, $D9, $1E, $1E, $1E ; $6751 |........|
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E ; $6759 |........|
    db   $1E, $1E, $1E, $09, $0A, $0B, $0C, $0D ; $6761 |........|
    db   $0E, $0F, $10, $1E, $1E, $1E, $1E, $1E ; $6769 |........|
    db   $11, $12, $1E, $1E, $1E, $1E, $13, $1C ; $6771 |........|
    db   $1C, $1C, $1C, $1C, $1C, $1C, $1C, $14 ; $6779 |........|
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $11 ; $6781 |........|
    db   $12, $1E, $1E, $15, $16, $17, $18, $18 ; $6789 |........|
    db   $19, $1A, $1B, $1E, $1E, $11, $12, $00 ; $6791 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6799 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $67F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6801 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6809 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6811 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6819 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6821 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6829 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6831 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6839 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6841 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6849 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6851 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6859 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6861 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6869 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6871 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6879 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6881 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6889 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6891 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6899 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $68F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $68F9 |.......$|
Data_028_6900:
    db   $24,$24, $24, $24, $24, $24, $24, $71, $24 ; $6901 |$$$$$$q$|
    db   $24, $24, $24, $24, $24, $8A, $24, $71 ; $6909 |$$$$$.$q|
    db   $8B, $8C, $8D, $24, $24, $24, $25, $24 ; $6911 |...$$$%$|
    db   $24, $24, $24, $24, $06, $07, $24, $24 ; $6919 |$$$$..$$|
    db   $71, $8A, $24, $24, $9B, $9C, $9D, $0E ; $6921 |q.$$....|
    db   $0F, $2D, $2E, $2F, $24, $0B, $0C, $24 ; $6929 |.-./$..$|
    db   $16, $17, $24, $24, $24, $28, $29, $2A ; $6931 |..$$$()*|
    db   $AB, $AC, $AD, $1E, $1F, $3D, $3E, $3F ; $6939 |.....=>?|
    db   $24, $1B, $1C, $24, $26, $27, $24, $24 ; $6941 |$..$&'$$|
    db   $24, $38, $39, $3A, $AB, $AC, $AD, $4E ; $6949 |$89:...N|
    db   $4F, $6D, $6E, $6F, $24, $2B, $2C, $24 ; $6951 |Omno$+,$|
    db   $36, $37, $24, $24, $24, $48, $49, $4A ; $6959 |67$$$HIJ|
    db   $BB, $BC, $BD, $5E, $5F, $7D, $7E, $7F ; $6961 |...^_}~.|
    db   $24, $3B, $3C, $24, $46, $47, $24, $24 ; $6969 |$                                                                                                                                        ;<$FG$$|
    db   $24, $58, $59, $5A, $9B, $9C, $9D, $24 ; $6971 |$XYZ...$|
    db   $24, $71, $24, $24, $24, $24, $24, $24 ; $6979 |$q$$$$$$|
    db   $56, $57, $24, $24, $24, $68, $69, $6A ; $6981 |VW$$$hij|
    db   $AB, $AC, $AD, $24, $24, $24, $24, $24 ; $6989 |...$$$$$|
    db   $24, $24, $24, $24, $66, $67, $85, $86 ; $6991 |$$$$fg..|
    db   $87, $8A, $79, $7A, $8B, $8C, $8D, $00 ; $6999 |..yz....|
    db   $01, $02, $03, $71, $24, $24, $24, $24 ; $69A1 |...q$$$$|
    db   $24, $94, $95, $96, $97, $98, $99, $9A ; $69A9 |$.......|
    db   $9B, $9C, $9D, $10, $11, $12, $13, $81 ; $69B1 |........|
    db   $80, $81, $80, $81, $80, $A4, $A5, $A6 ; $69B9 |........|
    db   $A7, $A8, $A9, $AA, $AB, $AC, $AD, $20 ; $69C1 |....... |
    db   $21, $22, $23, $91, $90, $91, $90, $91 ; $69C9 |!"#.....|
    db   $90, $B4, $B5, $B6, $B7, $B8, $B9, $BA ; $69D1 |........|
    db   $BB, $BC, $BD, $30, $31, $32, $33, $81 ; $69D9 |...0123.|
    db   $80, $81, $80, $81, $80, $C4, $C5, $C6 ; $69E1 |........|
    db   $C7, $C8, $C9, $CA, $CB, $CC, $CD, $40 ; $69E9 |.......@|
    db   $41, $42, $43, $44, $90, $91, $90, $91 ; $69F1 |ABCD....|
    db   $90, $D4, $D5, $D6, $D7, $D8, $D9, $DA ; $69F9 |........|
    db   $DB, $DC, $DD, $50, $51, $52, $53, $54 ; $6A01 |...PQRST|
    db   $E2, $E3, $A1, $A2, $A3, $E4, $E5, $E6 ; $6A09 |........|
    db   $E7, $E8, $E9, $EA, $EB, $EC, $ED, $F2 ; $6A11 |........|
    db   $F3, $F3, $F2, $F3, $F2, $F3, $B1, $B2 ; $6A19 |........|
    db   $B3, $F4, $F5, $F6, $F7, $F8, $F9, $FA ; $6A21 |........|
    db   $FB, $FC, $FD, $D0, $D1, $D0, $D1, $D0 ; $6A29 |........|
    db   $D1, $D0, $D1, $C2, $C3, $B0, $D1, $D0 ; $6A31 |........|
    db   $D1, $D0, $D1, $D0, $D1, $D0, $D1, $F2 ; $6A39 |........|
    db   $F3, $F2, $F3, $F2, $F3, $F2, $F3, $F2 ; $6A41 |........|
    db   $F3, $F2, $F3, $F2, $F3, $F2, $F3, $F2 ; $6A49 |........|
    db   $F3, $F2, $F3, $F0, $F1, $F0, $F1, $F0 ; $6A51 |........|
    db   $F1, $F0, $F1, $F0, $F1, $F0, $F1, $F0 ; $6A59 |........|
    db   $F1, $F0, $F1, $F0, $F1, $F0, $F1, $00 ; $6A61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6A99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6AF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B01 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B11 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6B99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6BA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6BA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6BB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6BB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6BC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00      ; $6BC9 |........|

Data_028_6BD0:
    db   $00, $01, $00, $00, $00, $05, $00, $00, $00 ; $6BD1 |........|
    db   $09, $0A, $00, $00, $00, $0E, $0F, $00 ; $6BD9 |........|
    db   $00, $02, $00, $10, $11, $12, $10, $10 ; $6BE1 |........|
    db   $15, $16, $10, $10, $19, $1A, $10, $10 ; $6BE9 |........|
    db   $1D, $1E, $10, $10, $03, $04, $10, $20 ; $6BF1 |....... |
    db   $20, $22, $23, $20, $20, $26, $20, $28 ; $6BF9 | "#  & (|
    db   $29, $2A, $2B, $20, $2D, $20, $20, $06 ; $6C01 |)*+ -  .|
    db   $07, $20, $20, $30, $31, $32, $33, $31 ; $6C09 |.  01231|
    db   $31, $36, $37, $38, $39, $3A, $3B, $3C ; $6C11 |16789:                                                                                                                                   ;<|
    db   $3D, $31, $31, $08, $31, $31, $0B, $13 ; $6C19 |=11.11..|
    db   $13, $13, $13, $13, $13, $13, $13, $48 ; $6C21 |.......H|
    db   $49, $4A, $4B, $13, $13, $13, $13, $13 ; $6C29 |IJK.....|
    db   $13, $13, $13, $13, $13, $13, $13, $13 ; $6C31 |........|
    db   $13, $13, $13, $58, $59, $5A, $5B, $13 ; $6C39 |...XYZ[.|
    db   $13, $13, $13, $13, $13, $13, $13, $60 ; $6C41 |.......`|
    db   $61, $62, $63, $64, $65, $66, $67, $68 ; $6C49 |abcdefgh|
    db   $69, $6A, $6B, $6C, $6D, $6E, $6F, $40 ; $6C51 |ijklmno@|
    db   $41, $42, $13, $70, $71, $72, $73, $74 ; $6C59 |AB.pqrst|
    db   $75, $76, $77, $78, $79, $7A, $7B, $7C ; $6C61 |uvwxyz{||
    db   $7D, $7E, $7F, $43, $44, $45, $46, $80 ; $6C69 |}~.CDEF.|
    db   $80, $82, $83, $84, $85, $86, $87, $88 ; $6C71 |........|
    db   $89, $8A, $8B, $8C, $8D, $8E, $8F, $50 ; $6C79 |.......P|
    db   $51, $52, $53, $90, $91, $92, $93, $94 ; $6C81 |QRS.....|
    db   $95, $96, $97, $98, $99, $9A, $9B, $9C ; $6C89 |........|
    db   $9D, $9E, $9F, $54, $55, $56, $57, $A0 ; $6C91 |...TUVW.|
    db   $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8 ; $6C99 |........|
    db   $A9, $AA, $AB, $AC, $AD, $AE, $AF, $4C ; $6CA1 |.......L|
    db   $4D, $4E, $4F, $B0, $B1, $B2, $B3, $B4 ; $6CA9 |MNO.....|
    db   $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC ; $6CB1 |........|
    db   $BD, $BE, $BF, $5C, $5D, $5E, $5F, $AD ; $6CB9 |...\]^_.|
    db   $AE, $C2, $C3, $C4, $C5, $C6, $C7, $C8 ; $6CC1 |........|
    db   $C9, $CA, $CB, $CC, $CD, $CE, $CF, $D0 ; $6CC9 |........|
    db   $E0, $F0, $80, $EA, $D1, $C2, $D3, $D4 ; $6CD1 |........|
    db   $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC ; $6CD9 |........|
    db   $DD, $DE, $DF, $E1, $F1, $FE, $80, $BE ; $6CE1 |........|
    db   $BF, $D2, $E3, $E4, $E5, $E6, $E7, $E8 ; $6CE9 |........|
    db   $E9, $EA, $EB, $EC, $ED, $EE, $EF, $FF ; $6CF1 |........|
    db   $2E, $80, $80, $81, $EA, $EA, $F3, $F4 ; $6CF9 |........|
    db   $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC ; $6D01 |........|
    db   $FD, $2F, $EA, $3E, $3F, $80, $80, $EA ; $6D09 |./.>?...|
    db   $EA, $2F, $EA, $EA, $F8, $F9, $FA, $FC ; $6D11 |./......|
    db   $EA, $EA, $EA, $EA, $EA, $21, $5F, $3F ; $6D19 |.....!_?|
    db   $80, $80, $80, $EA, $EA, $F8, $F9, $FA ; $6D21 |........|
    db   $FC, $EA, $EA, $EA, $EA, $2F, $EA, $1F ; $6D29 |...../..|
    db   $EA, $F0, $80, $80, $80, $80, $80, $00 ; $6D31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D91 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6D99 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DA1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DA9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DB1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DB9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DC1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DC9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DD1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DD9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DE1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DE9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DF1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6DF9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E01 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E09 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E11 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E19 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E21 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E29 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E31 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E39 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E41 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E49 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E51 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E59 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E61 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E69 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E71 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E79 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E81 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E89 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $6E91 |........|
    db   $00, $00, $00, $00, $00, $00, $00; $6E99 |........|

Data_028_6EA0:
    db   $07, $07, $07, $07, $07, $07, $07, $07, $07 ; $6EA1 |........|
    db   $07, $07, $07, $07, $07, $01, $07, $07 ; $6EA9 |........|
    db   $07, $07, $07, $30, $31, $07, $01, $07 ; $6EB1 |...01...|
    db   $07, $07, $07, $07, $07, $07, $07, $07 ; $6EB9 |........|
    db   $07, $10, $07, $07, $07, $07, $07, $40 ; $6EC1 |.......@|
    db   $41, $07, $07, $07, $07, $07, $07, $07 ; $6EC9 |A.......|
    db   $07, $07, $07, $07, $07, $07, $07, $07 ; $6ED1 |........|
    db   $07, $07, $07, $50, $51, $0F, $07, $07 ; $6ED9 |...PQ...|
    db   $07, $07, $07, $07, $07, $07, $07, $07 ; $6EE1 |........|
    db   $07, $07, $07, $07, $07, $07, $07, $60 ; $6EE9 |.......`|
    db   $61, $1F, $07, $07, $07, $07, $05, $06 ; $6EF1 |a.......|
    db   $07, $07, $07, $07, $07, $07, $07, $07 ; $6EF9 |........|
    db   $07, $10, $07, $07, $07, $07, $07, $12 ; $6F01 |........|
    db   $13, $14, $15, $16, $17, $18, $19, $1A ; $6F09 |........|
    db   $1B, $1C, $1D, $1E, $07, $07, $07, $01 ; $6F11 |........|
    db   $07, $07, $07, $22, $23, $24, $25, $26 ; $6F19 |..."#$%&|
    db   $27, $28, $29, $2A, $2B, $2C, $2D, $2E ; $6F21 |'()*+,-.|
    db   $07, $07, $07, $ED, $EC, $ED, $EC, $32 ; $6F29 |.......2|
    db   $33, $34, $35, $36, $37, $38, $39, $3A ; $6F31 |3456789:|
    db   $3B, $3C, $3D, $3E, $3F, $ED, $EC, $FD ; $6F39 |                                                                                                                                         ;<=>?...|
    db   $FC, $FD, $FC, $42, $43, $44, $45, $46 ; $6F41 |...BCDEF|
    db   $47, $48, $49, $4A, $4B, $4C, $4D, $4E ; $6F49 |GHIJKLMN|
    db   $4F, $FD, $FC, $ED, $EC, $ED, $EC, $52 ; $6F51 |O......R|
    db   $53, $54, $55, $56, $57, $58, $59, $5A ; $6F59 |STUVWXYZ|
    db   $5B, $5C, $5D, $5E, $5F, $ED, $EC, $FD ; $6F61 |[\]^_...|
    db   $FC, $FD, $FC, $62, $63, $64, $65, $66 ; $6F69 |...bcdef|
    db   $67, $68, $69, $6A, $6B, $6C, $6D, $6E ; $6F71 |ghijklmn|
    db   $FC, $FD, $FC, $70, $70, $70, $70, $72 ; $6F79 |...ppppr|
    db   $73, $74, $75, $76, $77, $78, $79, $7A ; $6F81 |stuvwxyz|
    db   $7B, $7C, $7D, $7E, $70, $70, $70, $E1 ; $6F89 |{|}~ppp.|
    db   $E2, $E3, $E4, $82, $83, $84, $85, $86 ; $6F91 |........|
    db   $87, $88, $89, $8A, $8B, $8C, $8D, $8E ; $6F99 |........|
    db   $E4, $E5, $E6, $80, $80, $80, $80, $92 ; $6FA1 |........|
    db   $93, $94, $95, $96, $97, $98, $99, $9A ; $6FA9 |........|
    db   $9B, $9C, $9D, $9E, $80, $80, $80, $80 ; $6FB1 |........|
    db   $80, $80, $A1, $A2, $A3, $A4, $A5, $A6 ; $6FB9 |........|
    db   $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE ; $6FC1 |........|
    db   $AF, $80, $80, $80, $80, $80, $B1, $B2 ; $6FC9 |........|
    db   $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA ; $6FD1 |........|
    db   $BB, $BC, $BD, $BE, $BF, $80, $80, $80 ; $6FD9 |........|
    db   $80, $80, $80, $80, $C3, $C4, $C5, $C6 ; $6FE1 |........|
    db   $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE ; $6FE9 |........|
    db   $CF, $80, $80, $80, $80, $80, $80, $80 ; $6FF1 |........|
    db   $80, $80, $80, $80, $80, $80, $80, $80 ; $6FF9 |........|
    db   $80, $80, $80, $80, $80, $80, $80, $00 ; $7001 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7009 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7011 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7019 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7021 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7029 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7031 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7039 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7041 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7049 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7051 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7059 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7061 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7069 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7071 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7079 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7081 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7089 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7091 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7099 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $70F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7101 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7109 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7111 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7119 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7121 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7129 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7131 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7139 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7141 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7149 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7151 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7159 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7161 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $7169 |........|
Data_028_7170:
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $7171 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $7179 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $7181 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $7189 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $7191 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $96 ; $7199 |........|
    db   $9A, $95, $96, $FC, $FC, $FC, $FC, $FC ; $71A1 |........|
    db   $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $71A9 |........|
    db   $FC, $A8, $A9, $A6, $A4, $A5, $A6, $A9 ; $71B1 |........|
    db   $AA, $FC, $FC, $FC, $FC, $FC, $FC, $D9 ; $71B9 |........|
    db   $D9, $D9, $CA, $FC, $9B, $9C, $BC, $BC ; $71C1 |........|
    db   $BC, $BC, $BC, $BC, $AB, $AC, $FC, $C8 ; $71C9 |........|
    db   $D9, $D9, $D9, $B9, $B9, $B9, $DA, $E0 ; $71D1 |........|
    db   $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0 ; $71D9 |........|
    db   $E0, $E0, $E0, $D8, $BA, $BA, $BA, $B9 ; $71E1 |........|
    db   $B9, $B9, $EA, $CD, $CE, $CD, $CE, $CD ; $71E9 |........|
    db   $CE, $CD, $CE, $CD, $CE, $CD, $CE, $E8 ; $71F1 |........|
    db   $BA, $BA, $BA, $B9, $B9, $B9, $EA, $DB ; $71F9 |........|
    db   $DC, $DB, $DC, $DB, $DC, $DB, $DC, $DB ; $7201 |........|
    db   $DC, $DB, $DC, $ED, $BA, $BA, $BA, $B9 ; $7209 |........|
    db   $B9, $B9, $EA, $E2, $E2, $E2, $E2, $E2 ; $7211 |........|
    db   $E2, $E2, $E2, $E2, $E2, $E2, $E2, $ED ; $7219 |........|
    db   $BA, $BA, $BA, $B9, $B9, $B9, $EA, $CB ; $7221 |........|
    db   $CC, $CB, $CC, $CB, $CC, $CB, $CC, $CB ; $7229 |........|
    db   $CC, $CB, $CC, $ED, $BA, $BA, $BA, $B9 ; $7231 |........|
    db   $B9, $B9, $EA, $DB, $DC, $DB, $DC, $DB ; $7239 |........|
    db   $DC, $DB, $DC, $DB, $DC, $DB, $DC, $ED ; $7241 |........|
    db   $BA, $BA, $BA, $90, $91, $B9, $D7, $E1 ; $7249 |........|
    db   $E1, $E1, $E1, $E1, $E1, $E1, $E1, $E1 ; $7251 |........|
    db   $E1, $E1, $E1, $ED, $BA, $C5, $C6, $A0 ; $7259 |........|
    db   $A1, $B9, $D7, $CB, $CC, $CB, $60, $61 ; $7261 |......`a|
    db   $62, $63, $64, $65, $CC, $CB, $CC, $ED ; $7269 |bcde....|
    db   $BA, $D5, $D6, $B0, $B1, $B9, $EC, $DD ; $7271 |........|
    db   $DE, $DD, $70, $71, $72, $73, $74, $75 ; $7279 |..pqrstu|
    db   $DE, $DD, $DE, $ED, $BA, $E5, $E6, $F4 ; $7281 |........|
    db   $AE, $D9, $E7, $E1, $E1, $E1, $80, $81 ; $7289 |........|
    db   $82, $83, $84, $85, $E1, $E1, $E1, $F8 ; $7291 |........|
    db   $D9, $F3, $F4, $BD, $BE, $B4, $B3, $B4 ; $7299 |........|
    db   $B3, $B4, $6A, $6B, $78, $79, $7B, $7C ; $72A1 |..jkxy{||
    db   $C2, $C3, $C2, $C3, $C2, $F5, $F6, $B2 ; $72A9 |........|
    db   $B3, $B2, $B3, $B4, $6A, $6B, $68, $78 ; $72B1 |....jkhx|
    db   $B7, $B7, $79, $7A, $7B, $7C, $C2, $C3 ; $72B9 |..yz{|..|
    db   $C2, $C3, $C2, $B2, $B3, $B4, $6A, $6B ; $72C1 |......jk|
    db   $69, $68, $78, $B7, $B7, $B7, $B7, $79 ; $72C9 |ihx....y|
    db   $79, $7A, $7B, $7C, $C2, $C3, $C2, $00 ; $72D1 |yz{|....|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $72D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $72E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $72E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $72F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $72F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7301 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7309 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7311 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7319 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7321 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7329 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7331 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7339 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7341 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7349 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7351 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7359 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7361 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7369 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7371 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7379 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7381 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7389 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7391 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7399 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $73F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7401 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7409 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7411 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7419 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7421 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7429 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7431 |........|
    db   $00, $00, $00, $00, $00, $00, $00; $7439 |........|

Data_028_7440:
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08 ; $7441 |........|
    db   $09, $0A, $0B, $0C, $0D, $0E, $0F, $C0 ; $7449 |........|
    db   $C1, $C2, $C2, $10, $11, $12, $13, $14 ; $7451 |........|
    db   $15, $16, $17, $18, $19, $1A, $1B, $1C ; $7459 |........|
    db   $1D, $1E, $1F, $D0, $D1, $D2, $D2, $20 ; $7461 |....... |
    db   $21, $22, $23, $24, $25, $26, $27, $28 ; $7469 |!"#$%&'(|
    db   $29, $2A, $2B, $2C, $2D, $2E, $2F, $E0 ; $7471 |)*+,-./.|
    db   $E1, $E2, $E2, $30, $31, $32, $33, $34 ; $7479 |...01234|
    db   $35, $36, $37, $38, $39, $3A, $3B, $3C ; $7481 |56789:                                                                                                                                   ;<|
    db   $3D, $3E, $3F, $F0, $F1, $F2, $F2, $40 ; $7489 |=>?....@|
    db   $41, $42, $43, $44, $45, $46, $47, $48 ; $7491 |ABCDEFGH|
    db   $49, $4A, $4B, $4C, $4D, $4E, $4F, $C3 ; $7499 |IJKLMNO.|
    db   $C4, $C5, $C5, $50, $51, $52, $53, $54 ; $74A1 |...PQRST|
    db   $55, $56, $57, $58, $59, $5A, $5B, $5C ; $74A9 |UVWXYZ[\|
    db   $5D, $5E, $5F, $D3, $D4, $D5, $D5, $60 ; $74B1 |]^_....`|
    db   $61, $62, $63, $64, $65, $66, $67, $68 ; $74B9 |abcdefgh|
    db   $69, $6A, $6B, $6C, $6D, $6E, $6F, $E3 ; $74C1 |ijklmno.|
    db   $E4, $E5, $E5, $70, $71, $72, $73, $A2 ; $74C9 |...pqrs.|
    db   $A3, $76, $77, $78, $79, $7A, $7B, $7C ; $74D1 |.vwxyz{||
    db   $7D, $7E, $7F, $F3, $F4, $F5, $F5, $A0 ; $74D9 |}~......|
    db   $A1, $BF, $BF, $B2, $B3, $86, $87, $88 ; $74E1 |........|
    db   $89, $8A, $8B, $8C, $8D, $8E, $8F, $C6 ; $74E9 |........|
    db   $C7, $C8, $C9, $B0, $B1, $BF, $BF, $BF ; $74F1 |........|
    db   $95, $96, $97, $98, $99, $9A, $9B, $9C ; $74F9 |........|
    db   $9D, $9E, $9F, $D6, $D7, $D8, $D9, $A0 ; $7501 |........|
    db   $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8 ; $7509 |........|
    db   $A9, $AA, $AB, $AC, $AD, $AE, $AF, $E6 ; $7511 |........|
    db   $E7, $E8, $E9, $B0, $B1, $B2, $B3, $B4 ; $7519 |........|
    db   $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC ; $7521 |........|
    db   $BD, $BE, $BF, $F6, $F7, $F8, $F9, $80 ; $7529 |........|
    db   $81, $F6, $F6, $F6, $F6, $FC, $FD, $FD ; $7531 |........|
    db   $FD, $FD, $CB, $CC, $CD, $F6, $F6, $F6 ; $7539 |........|
    db   $F6, $A4, $A4, $13, $91, $90, $F6, $F6 ; $7541 |........|
    db   $A2, $A3, $F6, $F6, $F6, $F6, $F6, $F6 ; $7549 |........|
    db   $F6, $F6, $F6, $F6, $F6, $B4, $F6, $13 ; $7551 |........|
    db   $13, $82, $F6, $F6, $B2, $B3, $F6, $F6 ; $7559 |........|
    db   $F6, $F6, $F6, $A0, $A1, $F6, $F6, $F6 ; $7561 |........|
    db   $F6, $F6, $F6, $13, $13, $92, $80, $81 ; $7569 |........|
    db   $F6, $F6, $F6, $A0, $A1, $F6, $F6, $B0 ; $7571 |........|
    db   $B1, $F6, $A2, $A3, $F6, $A0, $A1, $13 ; $7579 |........|
    db   $13, $13, $13, $91, $90, $BE, $F6, $B0 ; $7581 |........|
    db   $B1, $F6, $F6, $F6, $F6, $F6, $B2, $B3 ; $7589 |........|
    db   $F6, $B0, $B1, $13, $13, $13, $13, $13 ; $7591 |........|
    db   $80, $81, $F6, $B4, $F6, $F6, $A0, $A1 ; $7599 |........|
    db   $F6, $F6, $F6, $F6, $F6, $F6, $F6, $00 ; $75A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $75F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7601 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7609 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7611 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7619 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7621 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7629 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7631 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7639 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7641 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7649 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7651 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7659 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7661 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7669 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7671 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7679 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7681 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7689 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7691 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7699 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $76F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7701 |........|
    db   $00, $00, $00, $00, $00, $00, $00 ; $7709 |........|

Data_028_7710:
    db   $00, $00, $02, $03, $00, $00, $00, $07, $08 ; $7711 |........|
    db   $4D, $4D, $4D, $4D, $0D, $0E, $00, $04 ; $7719 |MMMM....|
    db   $05, $06, $07, $00, $11, $12, $13, $00 ; $7721 |........|
    db   $00, $00, $00, $18, $4D, $4D, $4D, $1C ; $7729 |....MMM.|
    db   $1D, $1E, $1F, $14, $15, $16, $17, $20 ; $7731 |....... |
    db   $21, $22, $23, $24, $25, $26, $27, $28 ; $7739 |!"#$%&'(|
    db   $29, $2A, $4D, $2C, $2D, $2E, $00, $09 ; $7741 |)*M,-...|
    db   $00, $00, $00, $4D, $31, $32, $33, $34 ; $7749 |...M1234|
    db   $4D, $4D, $4D, $38, $39, $3A, $3B, $4D ; $7751 |MMM89:                                                                                                                                   ;M|
    db   $3D, $3E, $3F, $19, $1A, $00, $00, $4D ; $7759 |=>?....M|
    db   $41, $42, $43, $44, $4D, $4D, $4D, $48 ; $7761 |ABCDMMMH|
    db   $49, $4A, $4B, $4D, $4D, $4E, $4F, $35 ; $7769 |IJKMMNO5|
    db   $36, $37, $00, $50, $51, $52, $53, $54 ; $7771 |67.PQRST|
    db   $55, $56, $57, $58, $59, $5A, $5B, $5C ; $7779 |UVWXYZ[\|
    db   $5D, $5E, $5F, $45, $46, $47, $00, $60 ; $7781 |]^_EFG.`|
    db   $61, $62, $63, $64, $65, $66, $67, $68 ; $7789 |abcdefgh|
    db   $69, $6A, $6B, $6C, $6D, $6E, $6F, $00 ; $7791 |ijklmno.|
    db   $85, $86, $87, $70, $71, $72, $73, $74 ; $7799 |...pqrst|
    db   $75, $76, $77, $78, $79, $7A, $7B, $7C ; $77A1 |uvwxyz{||
    db   $7D, $7E, $7F, $00, $95, $96, $97, $80 ; $77A9 |}~......|
    db   $81, $82, $83, $84, $4D, $4D, $4D, $4D ; $77B1 |....MMMM|
    db   $4D, $4D, $4D, $4D, $4D, $8E, $8F, $8D ; $77B9 |MMMMM...|
    db   $00, $CD, $DC, $90, $91, $92, $93, $94 ; $77C1 |........|
    db   $4D, $4D, $4D, $4D, $4D, $4D, $4D, $4D ; $77C9 |MMMMMMMM|
    db   $4D, $9E, $9F, $9D, $8C, $DD, $EC, $A0 ; $77D1 |M.......|
    db   $A1, $A2, $A3, $A4, $4D, $4D, $4D, $4D ; $77D9 |....MMMM|
    db   $4D, $4D, $4D, $4D, $4D, $AE, $AF, $AD ; $77E1 |MMMMM...|
    db   $9C, $ED, $FC, $B0, $B1, $B2, $B3, $B4 ; $77E9 |........|
    db   $4D, $4D, $4D, $4D, $4D, $4D, $4D, $4D ; $77F1 |MMMMMMMM|
    db   $BD, $BE, $BF, $4D, $AC, $FD, $DA, $C0 ; $77F9 |...M....|
    db   $C1, $C2, $C3, $C4, $4D, $01, $4D, $10 ; $7801 |....M.M.|
    db   $4D, $4D, $4D, $4D, $4D, $CE, $CF, $8B ; $7809 |MMMMM...|
    db   $4D, $DB, $EA, $D0, $D1, $D2, $D3, $D4 ; $7811 |M.......|
    db   $D8, $A7, $A8, $A9, $AA, $4D, $4D, $4D ; $7819 |.....MMM|
    db   $4D, $DE, $DF, $9B, $4D, $EB, $FA, $E0 ; $7821 |M...M...|
    db   $E1, $E2, $E3, $E4, $B6, $B7, $B8, $B9 ; $7829 |........|
    db   $BA, $4D, $9A, $4D, $4D, $EE, $EF, $AB ; $7831 |.M.MM...|
    db   $4D, $FB, $FA, $F0, $F1, $F2, $4D, $4D ; $7839 |M.....MM|
    db   $F3, $F4, $CB, $CB, $F5, $A5, $A6, $0A ; $7841 |........|
    db   $0B, $4D, $FF, $8A, $4D, $C7, $FE, $F1 ; $7849 |.M..M...|
    db   $F2, $4D, $4D, $4D, $F6, $F7, $CB, $CB ; $7851 |.MMM....|
    db   $F8, $D9, $88, $89, $4D, $4D, $4D, $FF ; $7859 |....MMM.|
    db   $2B, $C7, $C8, $F2, $4D, $4D, $4D, $4D ; $7861 |+...MMMM|
    db   $4D, $4D, $F9, $CB, $2F, $0F, $98, $99 ; $7869 |MM../...|
    db   $4D, $4D, $4D, $4D, $3C, $4C, $C9, $00 ; $7871 |MMMM<L..|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7879 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7881 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7889 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7891 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7899 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78D9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78E1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78E9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78F1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $78F9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7901 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7909 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7911 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7919 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7921 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7929 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7931 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7939 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7941 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7949 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7951 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7959 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7961 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7969 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7971 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7979 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7981 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7989 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7991 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $7999 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79A1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79A9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79B1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79B9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79C1 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79C9 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00 ; $79D1 |........|
    db   $00, $00, $00, $00, $00, $00, $00      ; $79D9 |.......|
