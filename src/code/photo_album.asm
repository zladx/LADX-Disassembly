; Code for the Photo album and printer

PhotoAlbumEntryPoint::
    call func_028_4033                            ;; 28:4000 $CD $33 $40
    ld   a, [wGameplaySubtype]                    ;; 28:4003 $FA $96 $DB
    JP_TABLE                                      ;; 28:4006 $C7
._00 dw PhotoAlbumInit1Handler                   ; $4007 (jumpTable [0]) $A7 $40
._01 dw PhotoAlbumInit2Handler                   ; $4009 (jumpTable [1]) $D9 $40
._02 dw PhotoAlbumFadeOutHandler                 ; $400B (jumpTable [2]) $8F $40
._03 dw PhotoAlbumInit3Handler                   ; $400D (jumpTable [3]) $FB $40
._04 dw PhotoAlbumFadeInHandler                  ; $400F (jumpTable [4]) $9B $40
._05 dw PhotoAlbumInit4Handler                   ; $4011 (jumpTable [5]) $18 $42
._06 dw PhotoAlbumInteractiveHandler             ; $4013 (jumpTable [6]) $32 $42
._07 dw PhotoAlbumFadeOutHandler                 ; $4015 (jumpTable [7]) $8F $40
._08 dw PhotoAlbumPreparePictureHandler          ; $4017 (jumpTable [8]) $B2 $43
._09 dw PhotoAlbumFadeInHandler                  ; $4019 (jumpTable [9]) $9B $40
._0A dw PhotoAlbumPictureInteractiveHandler      ; $401B (jumpTable [10]) $69 $44
._0B dw PhotoAlbumConfirmPrintingHandler         ; $401D (jumpTable [11]) $7E $45
._0C dw PhotoAlbumStartPrint1Handler             ; $401F (jumpTable [12]) $0E $4C
._0D dw PhotoAlbumStartPrint2Handler             ; $4021 (jumpTable [13]) $38 $4C
._0E dw PhotoAlbumStartPrint3Handler             ; $4023 (jumpTable [14]) $6C $4C
._0F dw PhotoAlbumStartPrint4Handler             ; $4025 (jumpTable [15]) $AD $4C
._10 dw PhotoAlbumStartPrint5Handler             ; $4027 (jumpTable [16]) $CE $4C
._11 dw PhotoAlbumPrintErrorHandler              ; $4029 (jumpTable [17]) $8C $4D
._12 dw PhotoAlbumFadeOutHandler                 ; $402B (jumpTable [18]) $8F $40
._13 dw JumpTable_028_44AA                       ; $402D (jumpTable [19]) $AA $44

Data_028_402F::
    db   $40, $00

Data_028_4031::
    db   $01, $FF

func_028_4033::
    ld   a, [wGameplaySubtype]                    ;; 28:4033 $FA $96 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ;; 28:4036 $FE $0D
    jr   c, .return_408E_28                       ;; 28:4038 $38 $54

    cp   GAMEPLAY_PHOTO_MARIN_WELL                ;; 28:403A $FE $11
    jr   nc, .return_408E_28                      ;; 28:403C $30 $50

    ld   b, $00                                   ;; 28:403E $06 $00
    ld   a, [wD1C8]                               ;; 28:4040 $FA $C8 $D1
    and  %00000001                                ;; 28:4043 $E6 $01
    jr   nz, .else_4064_28                        ;; 28:4045 $20 $1D

    ld   a, [wD1CA]                               ;; 28:4047 $FA $CA $D1
    ld   c, a                                     ;; 28:404A $4F
    ld   hl, Data_028_4031                        ;; 28:404B $21 $31 $40
    add  hl, bc                                   ;; 28:404E $09
    ld   a, [wD1C9]                               ;; 28:404F $FA $C9 $D1
    add  [hl]                                     ;; 28:4052 $86
    ld   [wD1C9], a                               ;; 28:4053 $EA $C9 $D1
    ld   hl, Data_028_402F                        ;; 28:4056 $21 $2F $40
    add  hl, bc                                   ;; 28:4059 $09
    cp   [hl]                                     ;; 28:405A $BE
    jr   nz, .else_4064_28                        ;; 28:405B $20 $07

    inc  c                                        ;; 28:405D $0C
    ld   a, c                                     ;; 28:405E $79
    and  %00000001                                ;; 28:405F $E6 $01
    ld   [wD1CA], a                               ;; 28:4061 $EA $CA $D1
.else_4064_28:
    ld   hl, wD1C8                                ;; 28:4064 $21 $C8 $D1
    inc  [hl]                                     ;; 28:4067 $34
    ld   a, [hl]                                  ;; 28:4068 $7E

    ; for every eight frames, the next block of 40 bytes is used
    ; c = 40 * (a/8)
    and  %00011000                                ;; 28:4069 $E6 $18
    ld   c, a                                     ;; 28:406B $4F
    sla  a                                        ;; 28:406C $CB $27
    sla  a                                        ;; 28:406E $CB $27
    add  c                                        ;; 28:4070 $81
    ld   c, a                                     ;; 28:4071 $4F

    ld   hl, Data_028_4DD1                        ;; 28:4072 $21 $D1 $4D
    add  hl, bc                                   ;; 28:4075 $09
    ld   de, wOAMBuffer                           ;; 28:4076 $11 $00 $C0
    ld   c, $0A                                   ;; 28:4079 $0E $0A
.loop_407B_28
    ldi  a, [hl]                                  ;; 28:407B $2A
    ld   [de], a                                  ;; 28:407C $12
    inc  de                                       ;; 28:407D $13
    ld   a, [wD1C9]                               ;; 28:407E $FA $C9 $D1
    add  [hl]                                     ;; 28:4081 $86
    ld   [de], a                                  ;; 28:4082 $12
    inc  hl                                       ;; 28:4083 $23
    inc  de                                       ;; 28:4084 $13
    ldi  a, [hl]                                  ;; 28:4085 $2A
    ld   [de], a                                  ;; 28:4086 $12
    inc  de                                       ;; 28:4087 $13
    ldi  a, [hl]                                  ;; 28:4088 $2A
    ld   [de], a                                  ;; 28:4089 $12
    inc  de                                       ;; 28:408A $13
    dec  c                                        ;; 28:408B $0D
    jr   nz, .loop_407B_28                        ;; 28:408C $20 $ED

.return_408E_28:
    ret                                           ;; 28:408E $C9


PhotoAlbumFadeOutHandler:
    call func_1A22                                ; $408F: PhotoAlbumFadeOutHandler $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $4092: PhotoAlbumFadeOutHandler $FA $6B $C1
    cp   $04                                      ; $4095: PhotoAlbumFadeOutHandler $FE $04
    ret  nz                                       ; $4097: PhotoAlbumFadeOutHandler $C0

    jp   PhotoAlbumIncrementState                 ; $4098: PhotoAlbumFadeOutHandler $C3 $DB $44

PhotoAlbumFadeInHandler:
    call func_1A39                                ; $409B: PhotoAlbumFadeInHandler $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $409E: PhotoAlbumFadeInHandler $FA $6B $C1
    cp   $04                                      ; $40A1: PhotoAlbumFadeInHandler $FE $04
    ret  nz                                       ; $40A3: PhotoAlbumFadeInHandler $C0

    jp   PhotoAlbumIncrementState                 ; $40A4: PhotoAlbumFadeInHandler $C3 $DB $44

PhotoAlbumInit1Handler:
    ld   bc, $6B                                  ; $40A7: PhotoAlbumInit1Handler $01 $6B $00
    ld   hl, wD168                                ; $40AA: PhotoAlbumInit1Handler $21 $68 $D1
.loop_40AD_28
    xor  a                                        ; $40AD: PhotoAlbumInit1Handler $AF
    ldi  [hl], a                                  ; $40AE: PhotoAlbumInit1Handler $22
    dec  bc                                       ; $40AF: PhotoAlbumInit1Handler $0B
    ld   a, c                                     ; $40B0: PhotoAlbumInit1Handler $79
    or   b                                        ; $40B1: PhotoAlbumInit1Handler $B0
    jr   nz, .loop_40AD_28                        ; $40B2: PhotoAlbumInit1Handler $20 $F9

    ld   hl, Data_028_4241                        ; $40B4: PhotoAlbumInit1Handler $21 $41 $42
    ld   a, [hl]                                  ; $40B7: PhotoAlbumInit1Handler $7E
    ld   [wD1CD], a                               ; $40B8: PhotoAlbumInit1Handler $EA $CD $D1
    ld   hl, Data_028_424D                        ; $40BB: PhotoAlbumInit1Handler $21 $4D $42
    ld   a, [hl]                                  ; $40BE: PhotoAlbumInit1Handler $7E
    ld   [wD1CE], a                               ; $40BF: PhotoAlbumInit1Handler $EA $CE $D1
    ld   a, $01                                   ; $40C2: PhotoAlbumInit1Handler $3E $01
    ld   [wD1D1], a                               ; $40C4: PhotoAlbumInit1Handler $EA $D1 $D1
    ld   a, $03                                   ; $40C7: PhotoAlbumInit1Handler $3E $03
    ldh  [hVolumeRight], a                        ; $40C9: PhotoAlbumInit1Handler $E0 $A9
    ld   a, $30                                   ; $40CB: PhotoAlbumInit1Handler $3E $30
    ldh  [hVolumeLeft], a                         ; $40CD: PhotoAlbumInit1Handler $E0 $AA
    call func_028_47CB                            ; $40CF: PhotoAlbumInit1Handler $CD $CB $47
    ld   a, IEF_SERIAL | IEF_VBLANK               ; $40D2: PhotoAlbumInit1Handler $3E $09
    ldh  [rIE], a                                 ; $40D4: PhotoAlbumInit1Handler $E0 $FF
    jp   PhotoAlbumIncrementState                 ; $40D6: PhotoAlbumInit1Handler $C3 $DB $44

PhotoAlbumInit2Handler:
    xor  a                                        ; $40D9: PhotoAlbumInit2Handler $AF
    ld   [wTransitionSequenceCounter], a          ; $40DA: PhotoAlbumInit2Handler $EA $6B $C1
    call func_028_45CD                            ; $40DD: PhotoAlbumInit2Handler $CD $CD $45
    jp   PhotoAlbumIncrementState                 ; $40E0: PhotoAlbumInit2Handler $C3 $DB $44

; VRAM memory addresses for the top left corner of each photo
PhotoAlbumMapLookupTable::
    db   $E1, $98, $E5, $98, $EC, $98, $F0, $98 ; $40E3 |........|
    db   $61, $99, $65, $99, $6C, $99, $70, $99 ; $40EB |a.e.l.p.|
    db   $E1, $99, $E5, $99, $EC, $99, $F0, $99 ; $40F3 |........|

PhotoAlbumInit3Handler:
    call LCDOff                                   ; $40FB: PhotoAlbumInit3Handler $CD $CF $28

    ld   a, BANK(PrintUI2Tiles)                   ; $40FE: PhotoAlbumInit3Handler $3E $35
    ld   bc, TILE_SIZE * $20                      ; $4100: PhotoAlbumInit3Handler $01 $00 $02
    ld   hl, PrintUI2Tiles                        ; $4103: PhotoAlbumInit3Handler $21 $00 $57
    ld   de, vTiles2                              ; $4106: PhotoAlbumInit3Handler $11 $00 $90
    call CopyData_trampoline                      ; $4109: PhotoAlbumInit3Handler $CD $5D $0B

    ld   a, BANK(Overworld1Tiles)                 ; $410C: PhotoAlbumInit3Handler $3E $0C
    call AdjustBankNumberForGBC                   ; $410E: PhotoAlbumInit3Handler $CD $0B $0B
    ld   bc, TILE_SIZE * $4                       ; $4111: PhotoAlbumInit3Handler $01 $40 $00
    ld   hl, Overworld1Tiles + $8C0               ; $4114: PhotoAlbumInit3Handler $21 $C0 $57
    ld   de, vTiles2 + $7C0                       ; $4117: PhotoAlbumInit3Handler $11 $C0 $97
    call CopyData_trampoline                      ; $411A: PhotoAlbumInit3Handler $CD $5D $0B

    ld   a, BANK(InventoryEquipmentItemsTiles)    ; $411D: PhotoAlbumInit3Handler $3E $0C
    call AdjustBankNumberForGBC                   ; $411F: PhotoAlbumInit3Handler $CD $0B $0B
    ld   bc, TILE_SIZE * $30                      ; $4122: PhotoAlbumInit3Handler $01 $00 $03
    ld   hl, InventoryEquipmentItemsTiles + $200  ; $4125: PhotoAlbumInit3Handler $21 $00 $4A
    ld   de, vTiles1 + $200                       ; $4128: PhotoAlbumInit3Handler $11 $00 $8A
    call CopyData_trampoline                      ; $412B: PhotoAlbumInit3Handler $CD $5D $0B

    ld   a, BANK(PhotoAlbumTiles)                 ; $412E: PhotoAlbumInit3Handler $3E $35
    ld   bc, TILE_SIZE * $20                      ; $4130: PhotoAlbumInit3Handler $01 $00 $02
    ld   hl, PhotoAlbumTiles + $300               ; $4133: PhotoAlbumInit3Handler $21 $00 $6B
    ld   de, vTiles1 + $500                       ; $4136: PhotoAlbumInit3Handler $11 $00 $8D
    call CopyData_trampoline                      ; $4139: PhotoAlbumInit3Handler $CD $5D $0B

    ld   a, BANK(PrintUI1Tiles)                   ; $413C: PhotoAlbumInit3Handler $3E $35
    ld   bc, TILE_SIZE * $50                      ; $413E: PhotoAlbumInit3Handler $01 $00 $05
    ld   hl, PrintUI1Tiles                        ; $4141: PhotoAlbumInit3Handler $21 $00 $52
    ld   de, vTiles0                              ; $4144: PhotoAlbumInit3Handler $11 $00 $80
    call CopyData_trampoline                      ; $4147: PhotoAlbumInit3Handler $CD $5D $0B

IF __PATCH_1__
    ld   a, BANK(PrintUI2Tiles)
    ld   bc, TILE_SIZE * $8
    ld   hl, PrintUI2Tiles + $200
    ld   de, vTiles0 + $500
    call CopyData_trampoline
ENDC

    ld   a, BANK(@)                               ; $414A: PhotoAlbumInit3Handler $3E $28
    ldh  [hMultiPurposeF], a                      ; $414C: PhotoAlbumInit3Handler $E0 $E6
    ld   a, BANK(PhotoAlbumBackgroundMap)         ; $414E: PhotoAlbumInit3Handler $3E $28
    ld   hl, PhotoAlbumBackgroundMap              ; $4150: PhotoAlbumInit3Handler $21 $E0 $79
    call CopyBGMapFromBank                        ; $4153: PhotoAlbumInit3Handler $CD $69 $0B

    call PhotoAlbumImageHandler                   ; $4156: PhotoAlbumInit3Handler $CD $85 $41
    call func_028_41FC                            ; $4159: PhotoAlbumInit3Handler $CD $FC $41

    ld   bc, $80                                  ; $415C: PhotoAlbumInit3Handler $01 $80 $00
    ld   hl, PhotoAlbumPalettes                   ; $415F: PhotoAlbumInit3Handler $21 $B0 $7C
    ld   de, wBGPal1                              ; $4162: PhotoAlbumInit3Handler $11 $10 $DC
    call func_028_4176                            ; $4165: PhotoAlbumInit3Handler $CD $76 $41
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ; $4168: PhotoAlbumInit3Handler $3E $C7
    ld   [wLCDControl], a                         ; $416A: PhotoAlbumInit3Handler $EA $FD $D6
    ldh  [rLCDC], a                               ; $416D: PhotoAlbumInit3Handler $E0 $40
    xor  a                                        ; $416F: PhotoAlbumInit3Handler $AF
    ld   [wTransitionSequenceCounter], a          ; $4170: PhotoAlbumInit3Handler $EA $6B $C1
    jp   PhotoAlbumIncrementState                 ; $4173: PhotoAlbumInit3Handler $C3 $DB $44

func_028_4176::
    ldh  a, [hIsGBC]                              ;; 28:4176 $F0 $FE
    and  a                                        ;; 28:4178 $A7
    ret  z                                        ;; 28:4179 $C8

    ld   a, $02                                   ;; 28:417A $3E $02
    ldh  [rSVBK], a                               ;; 28:417C $E0 $70
    call CopyData                                 ;; 28:417E $CD $14 $29
    xor  a                                        ;; 28:4181 $AF
    ldh  [rSVBK], a                               ;; 28:4182 $E0 $70
    ret                                           ;; 28:4184 $C9


; Loads in the "OK" tiles for the unlocked photos
PhotoAlbumImageHandler::
    ; If Debug3 is set, set all photos enabled
    ld   a, [ROM_DebugTool3]                      ;; 28:4185 $FA $05 $00
    and  a                                        ;; 28:4188 $A7
    jr   z, .notDebug                             ;; 28:4189 $28 $0A

    ld   a, $FF                                   ;; 28:418B $3E $FF
    ld   [wPhotos1], a                            ;; 28:418D $EA $0C $DC
    ld   a, $0F                                   ;; 28:4190 $3E $0F
    ld   [wPhotos2], a                            ;; 28:4192 $EA $0D $DC
.notDebug:
    ld   bc, $01                                  ;; 28:4195 $01 $01 $00
.loop_4198_28
    ; Fetch the appropriate mask, check if that photo is unlocked
    ld   hl, PhotoAlbumOffsetLookupTable          ;; 28:4198 $21 $65 $42
    add  hl, bc                                   ;; 28:419B $09
    ld   a, [hl]                                  ;; 28:419C $7E
    ld   e, a                                     ;; 28:419D $5F
    ld   d, $00                                   ;; 28:419E $16 $00
    ld   hl, wPhotos1                             ;; 28:41A0 $21 $0C $DC
    add  hl, de                                   ;; 28:41A3 $19
    ld   a, [hl]                                  ;; 28:41A4 $7E
    ld   hl, PhotoAlbumMaskLookupTable            ;; 28:41A5 $21 $59 $42
    add  hl, bc                                   ;; 28:41A8 $09
    and  [hl]                                     ;; 28:41A9 $A6
    jr   z, .incrementLoop                        ;; 28:41AA $28 $49

    ld   d, $00                                   ;; 28:41AC $16 $00
    ld   hl, PhotoAlbumMapLookupTable             ;; 28:41AE $21 $E3 $40
    ld   a, c                                     ;; 28:41B1 $79
    sla  a                                        ;; 28:41B2 $CB $27
    ld   e, a                                     ;; 28:41B4 $5F
    add  hl, de                                   ;; 28:41B5 $19
    ldi  a, [hl]                                  ;; 28:41B6 $2A
    ld   e, a                                     ;; 28:41B7 $5F
    ld   a, [hl]                                  ;; 28:41B8 $7E
    ld   h, a                                     ;; 28:41B9 $67
    ld   l, e                                     ;; 28:41BA $6B
    push hl                                       ;; 28:41BB $E5
    ld   a, $02                                   ;; 28:41BC $3E $02
    ldi  [hl], a                                  ;; 28:41BE $22
    ld   a, $03                                   ;; 28:41BF $3E $03
    ldi  [hl], a                                  ;; 28:41C1 $22
    ld   a, $04                                   ;; 28:41C2 $3E $04
    ld   [hl], a                                  ;; 28:41C4 $77
    ld   a, l                                     ;; 28:41C5 $7D
    add  $1E                                      ;; 28:41C6 $C6 $1E
    ld   l, a                                     ;; 28:41C8 $6F
    ld   a, h                                     ;; 28:41C9 $7C
    adc  $00                                      ;; 28:41CA $CE $00
    ld   h, a                                     ;; 28:41CC $67
    ld   a, $0A                                   ;; 28:41CD $3E $0A
    ldi  [hl], a                                  ;; 28:41CF $22
    ld   a, $0B                                   ;; 28:41D0 $3E $0B
    ldi  [hl], a                                  ;; 28:41D2 $22
    ld   a, $0C                                   ;; 28:41D3 $3E $0C
    ld   [hl], a                                  ;; 28:41D5 $77
    pop  hl                                       ;; 28:41D6 $E1
    ldh  a, [hIsGBC]                              ;; 28:41D7 $F0 $FE
    and  a                                        ;; 28:41D9 $A7
    jr   z, .incrementLoop                        ;; 28:41DA $28 $19

    ld   a, $01                                   ;; 28:41DC $3E $01
    ldh  [rVBK], a                                ;; 28:41DE $E0 $4F
    ld   a, $02                                   ;; 28:41E0 $3E $02
    ldi  [hl], a                                  ;; 28:41E2 $22
    ldi  [hl], a                                  ;; 28:41E3 $22
    ld   [hl], a                                  ;; 28:41E4 $77
    ld   a, l                                     ;; 28:41E5 $7D
    add  $1E                                      ;; 28:41E6 $C6 $1E
    ld   l, a                                     ;; 28:41E8 $6F
    ld   a, h                                     ;; 28:41E9 $7C
    adc  $00                                      ;; 28:41EA $CE $00
    ld   h, a                                     ;; 28:41EC $67
    ld   a, $02                                   ;; 28:41ED $3E $02
    ldi  [hl], a                                  ;; 28:41EF $22
    ldi  [hl], a                                  ;; 28:41F0 $22
    ld   [hl], a                                  ;; 28:41F1 $77
    xor  a                                        ;; 28:41F2 $AF
    ldh  [rVBK], a                                ;; 28:41F3 $E0 $4F
.incrementLoop:
    inc  c                                        ;; 28:41F5 $0C
    ld   a, c                                     ;; 28:41F6 $79
    cp   $0C                                      ;; 28:41F7 $FE $0C
    jr   nz, .loop_4198_28                        ;; 28:41F9 $20 $9D

    ret                                           ;; 28:41FB $C9


func_028_41FC::
    ld   a, [wD1D1]                               ;; 28:41FC $FA $D1 $D1
    and  a                                        ;; 28:41FF $A7
    ret  z                                        ;; 28:4200 $C8

    ld   hl, vBGMap0 + $22                        ;; 28:4201 $21 $22 $98
    ld   d, $7E                                   ;; 28:4204 $16 $7E
.loop_4206_28
    ld   a, d                                     ;; 28:4206 $7A
    ldi  [hl], a                                  ;; 28:4207 $22
    ld   a, l                                     ;; 28:4208 $7D
    and  %00011111                                ;; 28:4209 $E6 $1F
    cp   $12                                      ;; 28:420B $FE $12
    jr   nz, .loop_4206_28                        ;; 28:420D $20 $F7

    ld   a, l                                     ;; 28:420F $7D
    cp   $92                                      ;; 28:4210 $FE $92
    ret  z                                        ;; 28:4212 $C8

    add  $10                                      ;; 28:4213 $C6 $10
    ld   l, a                                     ;; 28:4215 $6F
    jr   .loop_4206_28                            ;; 28:4216 $18 $EE

PhotoAlbumInit4Handler:
    ld   a, [wD1D1]                               ; $4218: PhotoAlbumInit4Handler $FA $D1 $D1
    and  a                                        ; $421B: PhotoAlbumInit4Handler $A7
    jr   z, .else_422F_28                         ; $421C: PhotoAlbumInit4Handler $28 $11

    xor  a                                        ; $421E: PhotoAlbumInit4Handler $AF
    ld   [wD1D1], a                               ; $421F: PhotoAlbumInit4Handler $EA $D1 $D1
    ld_dialog_low a, Dialog22C                    ; $4222: PhotoAlbumInit4Handler $3E $2C
    ld   [wDialogIndex], a                        ; $4224: PhotoAlbumInit4Handler $EA $73 $C1
    call OpenDialogInTable2                       ; $4227: PhotoAlbumInit4Handler $CD $7C $23
    ld   a, DIALOG_OPENING_1                      ; $422A: PhotoAlbumInit4Handler $3E $01
    ld   [wDialogState], a                        ; $422C: PhotoAlbumInit4Handler $EA $9F $C1
.else_422F_28:
    jp   PhotoAlbumIncrementState                 ; $422F: PhotoAlbumInit4Handler $C3 $DB $44

; Moving the cursor to select a picture
PhotoAlbumInteractiveHandler:
    ld   a, [wDialogState]                        ; $4232: PhotoAlbumInteractiveHandler $FA $9F $C1
    and  a                                        ; $4235: PhotoAlbumInteractiveHandler $A7
    ret  nz                                       ; $4236: PhotoAlbumInteractiveHandler $C0

    call func_028_427D                            ; $4237: PhotoAlbumInteractiveHandler $CD $7D $42
    call func_028_433A                            ; $423A: PhotoAlbumInteractiveHandler $CD $3A $43
    call func_028_4385                            ; $423D: PhotoAlbumInteractiveHandler $CD $85 $43
    ret                                           ; $4240: PhotoAlbumInteractiveHandler $C9

Data_028_4241::
    db   $20, $40, $78, $98, $20, $40, $78, $98 ; $4241 | @x. @x.|
    db   $20, $40, $78, $98

Data_028_424D::
    db   $50, $50, $50, $50, $70, $70, $70, $70   ;; 28:424D
    db   $90, $90, $90, $90

PhotoAlbumMaskLookupTable::
    db   $01, $02, $40, $80
    db   $04, $08, $01, $02, $10, $20, $04, $08   ;; 28:425D

; Values of $00 indicate that photo's bit is stored in wPhotos1, $01 are stored in wPhotos2
PhotoAlbumOffsetLookupTable::
    db   $00, $00, $00, $00, $00, $00, $01, $01   ;; 28:4265
    db   $00, $00, $01, $01

Data_028_4271::
    db   $00, $01, $06, $07   ;; 28:426D
    db   $02, $03, $08, $09, $04, $05, $0A, $0B   ;; 28:4275

func_028_427D::
    ld   a, [wD1CF]                               ;; 28:427D $FA $CF $D1
    and  a                                        ;; 28:4280 $A7
    ret  nz                                       ;; 28:4281 $C0
    ; return if nothing is pressed
    ldh  a, [hJoypadState]                        ;; 28:4282 $F0 $CC
    and  a                                        ;; 28:4284 $A7
    ret  z                                        ;; 28:4285 $C8

    bit  5, a                                     ;; 28:4286 $CB $6F
    jr   z, .else_4298_28                         ;; 28:4288 $28 $0E

    ld   a, JINGLE_VALIDATE                       ;; 28:428A $3E $13
    ldh  [hJingle], a                             ;; 28:428C $E0 $F2
    ld   a, $12                                   ;; 28:428E $3E $12
    ld   [wGameplaySubtype], a                    ;; 28:4290 $EA $96 $DB
    xor  a                                        ;; 28:4293 $AF
    ld   [wTransitionSequenceCounter], a          ;; 28:4294 $EA $6B $C1
    ret                                           ;; 28:4297 $C9


.else_4298_28:
    bit  1, a                                     ;; 28:4298 $CB $4F
    jr   z, .else_42A9_28                         ;; 28:429A $28 $0D

    ld   a, [wD1CC]                               ;; 28:429C $FA $CC $D1
    and  a                                        ;; 28:429F $A7
    jr   z, .else_42A5_28                         ;; 28:42A0 $28 $03

    dec  a                                        ;; 28:42A2 $3D
    jr   .func_028_42E0                           ;; 28:42A3 $18 $3B

.else_42A5_28:
    ld   a, $0B                                   ;; 28:42A5 $3E $0B
    jr   .func_028_42E0                           ;; 28:42A7 $18 $37

.else_42A9_28:
    bit  0, a                                     ;; 28:42A9 $CB $47
    jr   z, .else_42BA_28                         ;; 28:42AB $28 $0D

    ld   a, [wD1CC]                               ;; 28:42AD $FA $CC $D1
    cp   $0B                                      ;; 28:42B0 $FE $0B
    jr   z, .else_42B7_28                         ;; 28:42B2 $28 $03

    inc  a                                        ;; 28:42B4 $3C
    jr   .func_028_42E0                           ;; 28:42B5 $18 $29

.else_42B7_28:
    xor  a                                        ;; 28:42B7 $AF
    jr   .func_028_42E0                           ;; 28:42B8 $18 $26

.else_42BA_28:
    bit  2, a                                     ;; 28:42BA $CB $57
    jr   z, .else_42CD_28                         ;; 28:42BC $28 $0F

    ld   a, [wD1CC]                               ;; 28:42BE $FA $CC $D1
    cp   $04                                      ;; 28:42C1 $FE $04
    jr   c, .else_42C9_28                         ;; 28:42C3 $38 $04

    sub  $04                                      ;; 28:42C5 $D6 $04
    jr   .func_028_42E0                           ;; 28:42C7 $18 $17

.else_42C9_28:
    add  $08                                      ;; 28:42C9 $C6 $08
    jr   .func_028_42E0                           ;; 28:42CB $18 $13

.else_42CD_28:
    bit  3, a                                     ;; 28:42CD $CB $5F
    jr   z, .else_42FB_28                         ;; 28:42CF $28 $2A

    ld   a, [wD1CC]                               ;; 28:42D1 $FA $CC $D1
    cp   $08                                      ;; 28:42D4 $FE $08
    jr   nc, .else_42DC_28                        ;; 28:42D6 $30 $04

    add  $04                                      ;; 28:42D8 $C6 $04
    jr   .func_028_42E0                           ;; 28:42DA $18 $04

.else_42DC_28:
    sub  $08                                      ;; 28:42DC $D6 $08
    jr   .func_028_42E0                           ;; 28:42DE $18 $00

.func_028_42E0::
    ld   [wD1CC], a                               ;; 28:42E0 $EA $CC $D1
    ld   d, $00                                   ;; 28:42E3 $16 $00
    ld   e, a                                     ;; 28:42E5 $5F
    ld   hl, Data_028_4241                        ;; 28:42E6 $21 $41 $42
    add  hl, de                                   ;; 28:42E9 $19
    ld   a, [hl]                                  ;; 28:42EA $7E
    ld   [wD1CD], a                               ;; 28:42EB $EA $CD $D1
    ld   hl, Data_028_424D                        ;; 28:42EE $21 $4D $42
    add  hl, de                                   ;; 28:42F1 $19
    ld   a, [hl]                                  ;; 28:42F2 $7E
    ld   [wD1CE], a                               ;; 28:42F3 $EA $CE $D1
    ld   a, JINGLE_MOVE_SELECTION                 ;; 28:42F6 $3E $0A
    ldh  [hJingle], a                             ;; 28:42F8 $E0 $F2
    ret                                           ;; 28:42FA $C9


.else_42FB_28:
    ldh  a, [hJoypadState]                        ;; 28:42FB $F0 $CC
    bit  J_BIT_A, a                               ;; 28:42FD $CB $67
    ret  z                                        ;; 28:42FF $C8

    ld   b, $00                                   ;; 28:4300 $06 $00
    ld   a, [wD1CC]                               ;; 28:4302 $FA $CC $D1
    ld   c, a                                     ;; 28:4305 $4F
    ld   d, a                                     ;; 28:4306 $57
    ld   hl, PhotoAlbumOffsetLookupTable          ;; 28:4307 $21 $65 $42
    add  hl, bc                                   ;; 28:430A $09
    ld   a, [hl]                                  ;; 28:430B $7E
    ld   c, a                                     ;; 28:430C $4F
    ld   hl, wPhotos1                             ;; 28:430D $21 $0C $DC
    add  hl, bc                                   ;; 28:4310 $09
    ld   a, [hl]                                  ;; 28:4311 $7E
    ld   c, d                                     ;; 28:4312 $4A
    ld   hl, PhotoAlbumMaskLookupTable            ;; 28:4313 $21 $59 $42
    add  hl, bc                                   ;; 28:4316 $09
    and  [hl]                                     ;; 28:4317 $A6
    jr   nz, .else_4322_28                        ;; 28:4318 $20 $08

    ld   a, JINGLE_WRONG_ANSWER                   ;; 28:431A $3E $1D
    ldh  [hJingle], a                             ;; 28:431C $E0 $F2
    ld   a, $FF                                   ;; 28:431E $3E $FF
    jr   .func_028_432B                           ;; 28:4320 $18 $09

.else_4322_28:
    ld   a, JINGLE_VALIDATE                       ;; 28:4322 $3E $13
    ldh  [hJingle], a                             ;; 28:4324 $E0 $F2
    ld   hl, Data_028_4271                        ;; 28:4326 $21 $71 $42
    add  hl, bc                                   ;; 28:4329 $09
    ld   a, [hl]                                  ;; 28:432A $7E
.func_028_432B::
    ld   [wD1CB], a                               ;; 28:432B $EA $CB $D1
    ld   hl, wD1CF                                ;; 28:432E $21 $CF $D1
    inc  [hl]                                     ;; 28:4331 $34
    xor  a                                        ;; 28:4332 $AF
    ld   [wD1D0], a                               ;; 28:4333 $EA $D0 $D1
    ret                                           ;; 28:4336 $C9

Data_028_4337::
    db   $0A, $08, $08                          ; $4337 |...|

func_028_433A::
    ld   a, [wD1CF]                               ;; 28:433A $FA $CF $D1
    and  a                                        ;; 28:433D $A7
    ret  z                                        ;; 28:433E $C8

    ld   d, $00                                   ;; 28:433F $16 $00
    ld   e, a                                     ;; 28:4341 $5F
    ld   hl, Data_028_4337                        ;; 28:4342 $21 $37 $43
    add  hl, de                                   ;; 28:4345 $19
    ld   a, [wD1D0]                               ;; 28:4346 $FA $D0 $D1
    cp   [hl]                                     ;; 28:4349 $BE
    jr   z, .else_4351_28                         ;; 28:434A $28 $05

    inc  a                                        ;; 28:434C $3C
    ld   [wD1D0], a                               ;; 28:434D $EA $D0 $D1
    ret                                           ;; 28:4350 $C9


.else_4351_28:
    xor  a                                        ;; 28:4351 $AF
    ld   [wD1D0], a                               ;; 28:4352 $EA $D0 $D1
    ld   hl, wD1CF                                ;; 28:4355 $21 $CF $D1
    inc  [hl]                                     ;; 28:4358 $34
    ld   a, [hl]                                  ;; 28:4359 $7E
    cp   $03                                      ;; 28:435A $FE $03
    ret  nz                                       ;; 28:435C $C0

    xor  a                                        ;; 28:435D $AF
    ld   [wD1CF], a                               ;; 28:435E $EA $CF $D1
    ld   [wTransitionSequenceCounter], a          ;; 28:4361 $EA $6B $C1
    ld   a, [wD1CB]                               ;; 28:4364 $FA $CB $D1
    cp   $FF                                      ;; 28:4367 $FE $FF
    ret  z                                        ;; 28:4369 $C8

    jp   PhotoAlbumIncrementState                 ;; 28:436A $C3 $DB $44

Data_028_436D::
    db   $00, $00, $40, $04, $00, $08, $42, $04 ; $436D |..@...B.|
    db   $01, $01, $40, $04, $01, $09, $42, $04 ; $4375 |..@...B.|
    db   $03, $02, $40, $04, $03, $0A, $42, $04 ; $437D |..@...B.|

func_028_4385::
    ld   a, [wD1CF]                               ;; 28:4385 $FA $CF $D1
    sla  a                                        ;; 28:4388 $CB $27
    sla  a                                        ;; 28:438A $CB $27
    sla  a                                        ;; 28:438C $CB $27
    ld   e, a                                     ;; 28:438E $5F
    ld   d, $00                                   ;; 28:438F $16 $00
    ld   hl, Data_028_436D                        ;; 28:4391 $21 $6D $43
    add  hl, de                                   ;; 28:4394 $19
    ld   de, wOAMBuffer                           ;; 28:4395 $11 $00 $C0
    ld   c, $02                                   ;; 28:4398 $0E $02
.loop_439A_28
    ld   a, [wD1CE]                               ;; 28:439A $FA $CE $D1
    add  [hl]                                     ;; 28:439D $86
    ld   [de], a                                  ;; 28:439E $12
    inc  de                                       ;; 28:439F $13
    inc  hl                                       ;; 28:43A0 $23
    ld   a, [wD1CD]                               ;; 28:43A1 $FA $CD $D1
    add  [hl]                                     ;; 28:43A4 $86
    ld   [de], a                                  ;; 28:43A5 $12
    inc  de                                       ;; 28:43A6 $13
    inc  hl                                       ;; 28:43A7 $23
    ldi  a, [hl]                                  ;; 28:43A8 $2A
    ld   [de], a                                  ;; 28:43A9 $12
    inc  de                                       ;; 28:43AA $13
    ldi  a, [hl]                                  ;; 28:43AB $2A
    ld   [de], a                                  ;; 28:43AC $12
    inc  de                                       ;; 28:43AD $13
    dec  c                                        ;; 28:43AE $0D
    jr   nz, .loop_439A_28                        ;; 28:43AF $20 $E9

    ret                                           ;; 28:43B1 $C9

; Prepare a concrete photo to be displayed
PhotoAlbumPreparePictureHandler:
    call LCDOff                                   ; $43B2: PhotoAlbumPreparePictureHandler $CD $CF $28
    call func_028_43CC                            ; $43B5: PhotoAlbumPreparePictureHandler $CD $CC $43
    call func_028_4411                            ; $43B8: PhotoAlbumPreparePictureHandler $CD $11 $44
    call func_028_442C                            ; $43BB: PhotoAlbumPreparePictureHandler $CD $2C $44
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ; $43BE: PhotoAlbumPreparePictureHandler $3E $C7
    ld   [wLCDControl], a                         ; $43C0: PhotoAlbumPreparePictureHandler $EA $FD $D6
    ldh  [rLCDC], a                               ; $43C3: PhotoAlbumPreparePictureHandler $E0 $40
    xor  a                                        ; $43C5: PhotoAlbumPreparePictureHandler $AF
    ld   [wTransitionSequenceCounter], a          ; $43C6: PhotoAlbumPreparePictureHandler $EA $6B $C1
    jp   PhotoAlbumIncrementState                 ; $43C9: PhotoAlbumPreparePictureHandler $C3 $DB $44

func_028_43CC::
    ld   a, [wD1CB]                               ;; 28:43CC $FA $CB $D1
    and  a                                        ;; 28:43CF $A7
    jr   nz, .else_43DB_28                        ;; 28:43D0 $20 $09

    ld   a, [wPhotos2]                            ;; 28:43D2 $FA $0D $DC
    and  %10000000                                ;; 28:43D5 $E6 $80
    jr   z, .else_43DB_28                         ;; 28:43D7 $28 $02

    ld   a, $0C                                   ;; 28:43D9 $3E $0C
.else_43DB_28:
    ld   b, a                                     ;; 28:43DB $47
    sla  a                                        ;; 28:43DC $CB $27
    add  b                                        ;; 28:43DE $80
    ld   d, $00                                   ;; 28:43DF $16 $00
    ld   e, a                                     ;; 28:43E1 $5F
    ld   hl, PhotoTilesTable                      ;; 28:43E2 $21 $E0 $44
    add  hl, de                                   ;; 28:43E5 $19
    push de                                       ;; 28:43E6 $D5
    ldi  a, [hl]                                  ;; 28:43E7 $2A
    ld   c, a                                     ;; 28:43E8 $4F
    ld   [wD168], a                               ;; 28:43E9 $EA $68 $D1
    ldi  a, [hl]                                  ;; 28:43EC $2A
    ld   b, a                                     ;; 28:43ED $47
    ld   [wD169], a                               ;; 28:43EE $EA $69 $D1
    ld   a, [hl]                                  ;; 28:43F1 $7E
    ld   [w2_D16A], a                             ;; 28:43F2 $EA $6A $D1
    ld   h, b                                     ;; 28:43F5 $60
    ld   l, c                                     ;; 28:43F6 $69
    push hl                                       ;; 28:43F7 $E5
    ld   bc, $800                                 ;; 28:43F8 $01 $00 $08
    ld   de, $9000                                ;; 28:43FB $11 $00 $90
    call CopyData_trampoline                      ;; 28:43FE $CD $5D $0B
    pop  hl                                       ;; 28:4401 $E1
    ld   bc, $800                                 ;; 28:4402 $01 $00 $08
    add  hl, bc                                   ;; 28:4405 $09
    ld   de, $8800                                ;; 28:4406 $11 $00 $88
    ld   a, [w2_D16A]                             ;; 28:4409 $FA $6A $D1
    call CopyData_trampoline                      ;; 28:440C $CD $5D $0B
    pop  de                                       ;; 28:440F $D1
    ret                                           ;; 28:4410 $C9


func_028_4411::
    ld   hl, PhotoMapsTable                       ;; 28:4411 $21 $07 $45
    add  hl, de                                   ;; 28:4414 $19
    ldi  a, [hl]                                  ;; 28:4415 $2A
    ld   c, a                                     ;; 28:4416 $4F
    ldi  a, [hl]                                  ;; 28:4417 $2A
    ld   b, a                                     ;; 28:4418 $47
    ld   a, BANK(@)                               ;; 28:4419 $3E $28
    ldh  [hMultiPurposeF], a                      ;; 28:441B $E0 $E6
    ld   a, [hl]                                  ;; 28:441D $7E
    ld   h, b                                     ;; 28:441E $60
    ld   l, c                                     ;; 28:441F $69
    call CopyBGMapFromBank                        ;; 28:4420 $CD $69 $0B
    ret                                           ;; 28:4423 $C9

Data_028_4424::
    db   $7F, $5B, $14, $2E, $4E, $19, $A9, $08 ; $4424 |.[..N...|

func_028_442C::
    ld   hl, Data_028_4424                        ;; 28:442C $21 $24 $44
    ld   bc, $08                                  ;; 28:442F $01 $08 $00
    ld   de, wBGPal1                              ;; 28:4432 $11 $10 $DC
    call func_028_4176                            ;; 28:4435 $CD $76 $41
    ret                                           ;; 28:4438 $C9

Data_028_4439::
IF __PATCH_1__
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
ELSE
    db   $78, $70, $0E, $03
    db   $78, $78, $0E, $23
    db   $78, $80, $14, $03
    db   $78, $88, $16, $03
    db   $78, $90, $18, $03
    db   $78, $98, $1A, $03
    db   $88, $70, $10, $04
    db   $88, $78, $12, $04
    db   $88, $80, $00, $04
    db   $88, $88, $02, $04
    db   $88, $90, $04, $04
    db   $88, $98, $06, $04
ENDC
.end

; When a picture is displayed, display the "A Print / B Cancel" buttons
PhotoAlbumPictureInteractiveHandler:
    ldh  a, [hJoypadState]                        ; $4469: PhotoAlbumPictureInteractiveHandler $F0 $CC
    bit  J_BIT_B, a                               ; $446B: PhotoAlbumPictureInteractiveHandler $CB $6F
    jr   z, .else_447D_28                         ; $446D: PhotoAlbumPictureInteractiveHandler $28 $0E

    ld   a, JINGLE_VALIDATE                       ; $446F: PhotoAlbumPictureInteractiveHandler $3E $13
    ldh  [hJingle], a                             ; $4471: PhotoAlbumPictureInteractiveHandler $E0 $F2
    ld   a, $01                                   ; $4473: PhotoAlbumPictureInteractiveHandler $3E $01
    ld   [wGameplaySubtype], a                    ; $4475: PhotoAlbumPictureInteractiveHandler $EA $96 $DB
    xor  a                                        ; $4478: PhotoAlbumPictureInteractiveHandler $AF
    ld   [wTransitionSequenceCounter], a          ; $4479: PhotoAlbumPictureInteractiveHandler $EA $6B $C1
    ret                                           ; $447C: PhotoAlbumPictureInteractiveHandler $C9


.else_447D_28:
    ldh  a, [hJoypadState]                        ; $447D: PhotoAlbumPictureInteractiveHandler $F0 $CC
    bit  J_BIT_A, a                               ; $447F: PhotoAlbumPictureInteractiveHandler $CB $67
    jr   z, .else_4492_28                         ; $4481: PhotoAlbumPictureInteractiveHandler $28 $0F

    ld   a, JINGLE_VALIDATE                       ; $4483: PhotoAlbumPictureInteractiveHandler $3E $13
    ldh  [hJingle], a                             ; $4485: PhotoAlbumPictureInteractiveHandler $E0 $F2
    xor  a                                        ; $4487: PhotoAlbumPictureInteractiveHandler $AF
    ld   [wD181], a                               ; $4488: PhotoAlbumPictureInteractiveHandler $EA $81 $D1
    ld   a, $10                                   ; $448B: PhotoAlbumPictureInteractiveHandler $3E $10
    ldh  [hFrameCounter], a                       ; $448D: PhotoAlbumPictureInteractiveHandler $E0 $E7
    call PhotoAlbumIncrementState                 ; $448F: PhotoAlbumPictureInteractiveHandler $CD $DB $44
.else_4492_28:
    ld   hl, Data_028_4439                        ; $4492: PhotoAlbumPictureInteractiveHandler $21 $39 $44
    ld   de, wOAMBuffer                           ; $4495: PhotoAlbumPictureInteractiveHandler $11 $00 $C0
    ld   c, (Data_028_4439.end - Data_028_4439) / 4 ; $4498: PhotoAlbumPictureInteractiveHandler $0E $0C
.loop_449A_28
    ldi  a, [hl]                                  ; $449A: PhotoAlbumPictureInteractiveHandler $2A
    ld   [de], a                                  ; $449B: PhotoAlbumPictureInteractiveHandler $12
    inc  de                                       ; $449C: PhotoAlbumPictureInteractiveHandler $13
    ldi  a, [hl]                                  ; $449D: PhotoAlbumPictureInteractiveHandler $2A
    ld   [de], a                                  ; $449E: PhotoAlbumPictureInteractiveHandler $12
    inc  de                                       ; $449F: PhotoAlbumPictureInteractiveHandler $13
    ldi  a, [hl]                                  ; $44A0: PhotoAlbumPictureInteractiveHandler $2A
    ld   [de], a                                  ; $44A1: PhotoAlbumPictureInteractiveHandler $12
    inc  de                                       ; $44A2: PhotoAlbumPictureInteractiveHandler $13
    ldi  a, [hl]                                  ; $44A3: PhotoAlbumPictureInteractiveHandler $2A
    ld   [de], a                                  ; $44A4: PhotoAlbumPictureInteractiveHandler $12
    inc  de                                       ; $44A5: PhotoAlbumPictureInteractiveHandler $13
    dec  c                                        ; $44A6: PhotoAlbumPictureInteractiveHandler $0D
    jr   nz, .loop_449A_28                        ; $44A7: PhotoAlbumPictureInteractiveHandler $20 $F1

    ret                                           ; $44A9: PhotoAlbumPictureInteractiveHandler $C9


JumpTable_028_44AA:
    call LCDOff                                   ; $44AA: JumpTable_028_44AA $CD $CF $28
    ld   a, $28                                   ; $44AD: JumpTable_028_44AA $3E $28
    call LoadBaseTiles_trampoline                 ; $44AF: JumpTable_028_44AA $CD $BE $0B
    ldh  a, [hLinkPositionX]                      ; $44B2: JumpTable_028_44AA $F0 $98
    ld   [wMapEntrancePositionX], a               ; $44B4: JumpTable_028_44AA $EA $9D $DB
    ldh  a, [hLinkPositionY]                      ; $44B7: JumpTable_028_44AA $F0 $99
    ld   [wMapEntrancePositionY], a               ; $44B9: JumpTable_028_44AA $EA $9E $DB
    ld   a, GAMEPLAY_WORLD                        ; $44BC: JumpTable_028_44AA $3E $0B
    ld   [wGameplayType], a                       ; $44BE: JumpTable_028_44AA $EA $95 $DB
    xor  a                                        ; $44C1: JumpTable_028_44AA $AF
    ld   [wGameplaySubtype], a                    ; $44C2: JumpTable_028_44AA $EA $96 $DB
    ld   a, PHOTO_ALBUM_COOLDOWN                  ; $44C5: JumpTable_028_44AA $3E $18
    ld   [wPhotoAlbumCooldown], a                 ; $44C7: JumpTable_028_44AA $EA $05 $DE
    ld   a, $07                                   ; $44CA: JumpTable_028_44AA $3E $07
    ldh  [hVolumeRight], a                        ; $44CC: JumpTable_028_44AA $E0 $A9
    ld   a, $70                                   ; $44CE: JumpTable_028_44AA $3E $70
    ldh  [hVolumeLeft], a                         ; $44D0: JumpTable_028_44AA $E0 $AA
    ld   a, [wLCDControl]                         ; $44D2: JumpTable_028_44AA $FA $FD $D6
    ld   [wLCDControl], a                         ; $44D5: JumpTable_028_44AA $EA $FD $D6
    ldh  [rLCDC], a                               ; $44D8: JumpTable_028_44AA $E0 $40
    ret                                           ; $44DA: JumpTable_028_44AA $C9

PhotoAlbumIncrementState::
    ld   hl, wGameplaySubtype                     ;; 28:44DB $21 $96 $DB
    inc  [hl]                                     ;; 28:44DE $34
    ret                                           ;; 28:44DF $C9

; Tiles and maps to load when displaying a photo in the album
PhotoTilesTable::
    far_pointer PhotoNiceLinkTiles
    far_pointer PhotoMarinCliffTiles
    far_pointer PhotoMarinWellTiles
    far_pointer PhotoMabeTiles
    far_pointer PhotoUlriraTiles
    far_pointer PhotoBowWowTiles
    far_pointer PhotoShopTiles
    far_pointer PhotoFishermanTiles
    far_pointer PhotoZoraTiles
    far_pointer PhotoKanaletTiles
    far_pointer PhotoGhostTiles
    far_pointer PhotoBridgeTiles
    far_pointer PhotoDizzyLinkTiles

PhotoMapsTable::
    far_pointer PhotoNiceLinkMap
    far_pointer PhotoMarinCliffMap
    far_pointer PhotoMarinWellMap
    far_pointer PhotoMabeMap
    far_pointer PhotoUlriraMap
    far_pointer PhotoBowWowMap
    far_pointer PhotoShopMap
    far_pointer PhotoFishermanMap
    far_pointer PhotoZoraMap
    far_pointer PhotoKanaletMap
    far_pointer PhotoGhostMap
    far_pointer PhotoBridgeMap
    far_pointer PhotoDizzyLinkMap

Data_028_452E::
IF __PATCH_1__
    db   $50, $38, $00, $00
    db   $50, $40, $02, $00
    db   $50, $48, $04, $00
    db   $50, $50, $06, $00
    db   $50, $58, $08, $00
    db   $50, $60, $0A, $00
    db   $50, $68, $0C, $00
ELSE
    db   $50, $38, $14, $00
    db   $50, $40, $16, $00
    db   $50, $48, $18, $00
    db   $50, $50, $1A, $00
    db   $50, $58, $08, $00
    db   $50, $60, $0A, $00
    db   $50, $68, $44, $00
    db   $50, $70, $0C, $00
ENDC
.end

Data_028_454E::
IF __PATCH_1__
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
ELSE
    db   $78, $70, $0E, $03
    db   $78, $78, $0E, $23
    db   $78, $80, $08, $03
    db   $78, $88, $0A, $03
    db   $78, $90, $44, $03
    db   $78, $98, $2E, $03
    db   $88, $70, $10, $04
    db   $88, $78, $12, $04
    db   $88, $80, $00, $04
    db   $88, $88, $02, $04
    db   $88, $90, $04, $04
    db   $88, $98, $06, $04
ENDC
.end

; Display the "Print OK?" dialog
PhotoAlbumConfirmPrintingHandler:
    ldh  a, [hJoypadState]                        ; $457E: PhotoAlbumConfirmPrintingHandler $F0 $CC
    bit  J_BIT_A, a                               ; $4580: PhotoAlbumConfirmPrintingHandler $CB $67
    jr   z, .else_459A_28                         ; $4582: PhotoAlbumConfirmPrintingHandler $28 $16

    xor  a                                        ; $4584: PhotoAlbumConfirmPrintingHandler $AF
    ld   [wD1C8], a                               ; $4585: PhotoAlbumConfirmPrintingHandler $EA $C8 $D1
    ld   [wD1CA], a                               ; $4588: PhotoAlbumConfirmPrintingHandler $EA $CA $D1
    ld   a, $20                                   ; $458B: PhotoAlbumConfirmPrintingHandler $3E $20
    ld   [wD1C9], a                               ; $458D: PhotoAlbumConfirmPrintingHandler $EA $C9 $D1
    ; Why is the owl's music played in the photo album code?
    ld   a, MUSIC_OWL                             ; $4590: PhotoAlbumConfirmPrintingHandler $3E $22
    ld   [wMusicTrackToPlay], a                   ; $4592: PhotoAlbumConfirmPrintingHandler $EA $68 $D3
    call PhotoAlbumIncrementState                 ; $4595: PhotoAlbumConfirmPrintingHandler $CD $DB $44
    jr   .func_028_45A3                           ; $4598: PhotoAlbumConfirmPrintingHandler $18 $09

.else_459A_28:
    bit  J_BIT_B, a                               ; $459A: PhotoAlbumConfirmPrintingHandler $CB $6F
    jr   z, .else_45A7_28                         ; $459C: PhotoAlbumConfirmPrintingHandler $28 $09

    ld   a, $0A                                   ; $459E: PhotoAlbumConfirmPrintingHandler $3E $0A
    ld   [wGameplaySubtype], a                    ; $45A0: PhotoAlbumConfirmPrintingHandler $EA $96 $DB
.func_028_45A3::
    ld   a, JINGLE_VALIDATE                       ; $45A3: PhotoAlbumConfirmPrintingHandler $3E $13
    ldh  [hJingle], a                             ; $45A5: PhotoAlbumConfirmPrintingHandler $E0 $F2
.else_45A7_28:
    ld   de, wOAMBuffer                           ; $45A7: PhotoAlbumConfirmPrintingHandler $11 $00 $C0
    ld   hl, Data_028_452E                        ; $45AA: PhotoAlbumConfirmPrintingHandler $21 $2E $45
    ; Render both Data_028_454E and Data_028_452E
    ld   c, (Data_028_454E.end - Data_028_452E) / 4
    ldh  a, [hFrameCounter]                       ; $45AF: PhotoAlbumConfirmPrintingHandler $F0 $E7
    inc  a                                        ; $45B1: PhotoAlbumConfirmPrintingHandler $3C
    ldh  [hFrameCounter], a                       ; $45B2: PhotoAlbumConfirmPrintingHandler $E0 $E7
    and  %00110000                                ; $45B4: PhotoAlbumConfirmPrintingHandler $E6 $30
    jr   nz, .else_45BD_28                        ; $45B6: PhotoAlbumConfirmPrintingHandler $20 $05

    ld   hl, Data_028_454E                        ; $45B8: PhotoAlbumConfirmPrintingHandler $21 $4E $45
    ld   c, (Data_028_454E.end - Data_028_454E) / 4 ; $45BB: PhotoAlbumConfirmPrintingHandler $0E $0C
.else_45BD_28:
    ldi  a, [hl]                                  ; $45BD: PhotoAlbumConfirmPrintingHandler $2A
    ld   [de], a                                  ; $45BE: PhotoAlbumConfirmPrintingHandler $12
    inc  de                                       ; $45BF: PhotoAlbumConfirmPrintingHandler $13
    ldi  a, [hl]                                  ; $45C0: PhotoAlbumConfirmPrintingHandler $2A
    ld   [de], a                                  ; $45C1: PhotoAlbumConfirmPrintingHandler $12
    inc  de                                       ; $45C2: PhotoAlbumConfirmPrintingHandler $13
    ldi  a, [hl]                                  ; $45C3: PhotoAlbumConfirmPrintingHandler $2A
    ld   [de], a                                  ; $45C4: PhotoAlbumConfirmPrintingHandler $12
    inc  de                                       ; $45C5: PhotoAlbumConfirmPrintingHandler $13
    ldi  a, [hl]                                  ; $45C6: PhotoAlbumConfirmPrintingHandler $2A
    ld   [de], a                                  ; $45C7: PhotoAlbumConfirmPrintingHandler $12
    inc  de                                       ; $45C8: PhotoAlbumConfirmPrintingHandler $13
    dec  c                                        ; $45C9: PhotoAlbumConfirmPrintingHandler $0D
    jr   nz, .else_45BD_28                        ; $45CA: PhotoAlbumConfirmPrintingHandler $20 $F1

    ret                                           ; $45CC: PhotoAlbumConfirmPrintingHandler $C9


func_028_45CD::
    xor  a                                        ;; 28:45CD $AF
    ld   [wD16D], a                               ;; 28:45CE $EA $6D $D1
    ld   [wD16E], a                               ;; 28:45D1 $EA $6E $D1
    ld   a, $13                                   ;; 28:45D4 $3E $13
    ld   [wD17E], a                               ;; 28:45D6 $EA $7E $D1
    ld   a, $01                                   ;; 28:45D9 $3E $01
    ld   [wD17F], a                               ;; 28:45DB $EA $7F $D1
    ld   a, $E4                                   ;; 28:45DE $3E $E4
    ld   [wD180], a                               ;; 28:45E0 $EA $80 $D1
    ld   a, $80                                   ;; 28:45E3 $3E $80
    ld   [wD16F], a                               ;; 28:45E5 $EA $6F $D1
    ret                                           ;; 28:45E8 $C9


func_028_45E9::
    ld   a, $00                                   ;; 28:45E9 $3E $00
    ld   [wD16B], a                               ;; 28:45EB $EA $6B $D1
    ld   a, JINGLE_WRONG_ANSWER                   ;; 28:45EE $3E $1D
    ldh  [hJingle], a                             ;; 28:45F0 $E0 $F2
    ld   a, $10                                   ;; 28:45F2 $3E $10
    ldh  [hFrameCounter], a                       ;; 28:45F4 $E0 $E7
    ld   a, $11                                   ;; 28:45F6 $3E $11
    ld   [wD1C6], a                               ;; 28:45F8 $EA $C6 $D1
    ld   a, $10                                   ;; 28:45FB $3E $10
    ld   [wGameplaySubtype], a                    ;; 28:45FD $EA $96 $DB
    ret                                           ;; 28:4600 $C9


; ----------------------------------------------
;
; Printer communication entry point
;
; ----------------------------------------------

PrinterInterruptSerial::
    ldh  a, [rSC]                                 ;; 28:4601 $F0 $02
    bit  7, a                                     ;; 28:4603 $CB $7F
    jr   nz, .return_4615_28                      ;; 28:4605 $20 $0E

    push bc                                       ;; 28:4607 $C5
    push de                                       ;; 28:4608 $D5
    push hl                                       ;; 28:4609 $E5
    ld   a, $01                                   ;; 28:460A $3E $01
    ld   [wD171], a                               ;; 28:460C $EA $71 $D1
    call func_028_4638                            ;; 28:460F $CD $38 $46
    pop  hl                                       ;; 28:4612 $E1
    pop  de                                       ;; 28:4613 $D1
    pop  bc                                       ;; 28:4614 $C1
.return_4615_28:
    ret                                           ;; 28:4615 $C9


PrinterInterruptVBlank::
    ld   a, [wD16B]                               ;; 28:4616 $FA $6B $D1
    cp   $01                                      ;; 28:4619 $FE $01
    ret  nz                                       ;; 28:461B $C0

    ld   a, [wD16D]                               ;; 28:461C $FA $6D $D1
    cp   $FF                                      ;; 28:461F $FE $FF
    ret  z                                        ;; 28:4621 $C8

    ld   a, [wD172]                               ;; 28:4622 $FA $72 $D1
    and  a                                        ;; 28:4625 $A7
    ret  nz                                       ;; 28:4626 $C0

    ld   hl, wD182                                ;; 28:4627 $21 $82 $D1
    inc  [hl]                                     ;; 28:462A $34
    ld   a, [hl]                                  ;; 28:462B $7E
    cp   $06                                      ;; 28:462C $FE $06
    ret  c                                        ;; 28:462E $D8

    xor  a                                        ;; 28:462F $AF
    ld   [hl], a                                  ;; 28:4630 $77
    ld   [wD17D], a                               ;; 28:4631 $EA $7D $D1
    call func_028_4A27                            ;; 28:4634 $CD $27 $4A
    ret                                           ;; 28:4637 $C9


func_028_4638::
    ld   a, [wD17C]                               ;; 28:4638 $FA $7C $D1
    and  a                                        ;; 28:463B $A7
    jp   nz, func_028_47C5                        ;; 28:463C $C2 $C5 $47

    ld   a, [wD16B]                               ;; 28:463F $FA $6B $D1
    cp   $07                                      ;; 28:4642 $FE $07
    jp   z, func_028_477F                         ;; 28:4644 $CA $7F $47

    ld   a, [wD173]                               ;; 28:4647 $FA $73 $D1
    and  a                                        ;; 28:464A $A7
    jr   nz, .else_4651_28                        ;; 28:464B $20 $04

    call func_028_4670                            ;; 28:464D $CD $70 $46
    ret                                           ;; 28:4650 $C9


.else_4651_28:
    ld   a, [wD174]                               ;; 28:4651 $FA $74 $D1
    and  a                                        ;; 28:4654 $A7
    jr   z, .else_466C_28                         ;; 28:4655 $28 $15

    ld   a, [wD175]                               ;; 28:4657 $FA $75 $D1
    and  a                                        ;; 28:465A $A7
    jr   z, .else_466C_28                         ;; 28:465B $28 $0F

    ld   a, [wD176]                               ;; 28:465D $FA $76 $D1
    cp   $02                                      ;; 28:4660 $FE $02
    jr   z, .else_4668_28                         ;; 28:4662 $28 $04

    call func_028_474E                            ;; 28:4664 $CD $4E $47
    ret                                           ;; 28:4667 $C9


.else_4668_28:
    call func_028_4765                            ;; 28:4668 $CD $65 $47
    ret                                           ;; 28:466B $C9


.else_466C_28:
    call func_028_4695                            ;; 28:466C $CD $95 $46
    ret                                           ;; 28:466F $C9


func_028_4670::
    ld   hl, wD17A                                ;; 28:4670 $21 $7A $D1
    ld   c, [hl]                                  ;; 28:4673 $4E
    inc  [hl]                                     ;; 28:4674 $34
    ld   b, $00                                   ;; 28:4675 $06 $00
    ld   hl, Data_028_4A7C                        ;; 28:4677 $21 $7C $4A
    add  hl, bc                                   ;; 28:467A $09
    ld   a, [hl]                                  ;; 28:467B $7E
    ldh  [rSB], a                                 ;; 28:467C $E0 $01
    ld   a, $01                                   ;; 28:467E $3E $01
    ldh  [rSC], a                                 ;; 28:4680 $E0 $02
    ld   a, $81                                   ;; 28:4682 $3E $81
    ldh  [rSC], a                                 ;; 28:4684 $E0 $02
    ld   a, [wD17A]                               ;; 28:4686 $FA $7A $D1
    cp   $02                                      ;; 28:4689 $FE $02
    ret  nz                                       ;; 28:468B $C0

    xor  a                                        ;; 28:468C $AF
    ld   [wD17A], a                               ;; 28:468D $EA $7A $D1
    inc  a                                        ;; 28:4690 $3C
    ld   [wD173], a                               ;; 28:4691 $EA $73 $D1
    ret                                           ;; 28:4694 $C9


func_028_4695::
    ld   a, [wD17A]                               ;; 28:4695 $FA $7A $D1
    ld   c, a                                     ;; 28:4698 $4F
    ld   a, [wD17B]                               ;; 28:4699 $FA $7B $D1
    ld   b, a                                     ;; 28:469C $47
    ld   a, [wD183]                               ;; 28:469D $FA $83 $D1
    ld   l, a                                     ;; 28:46A0 $6F
    ld   a, [wD184]                               ;; 28:46A1 $FA $84 $D1
    ld   h, a                                     ;; 28:46A4 $67
    add  hl, bc                                   ;; 28:46A5 $09
    ldh  a, [rSB]                                 ;; 28:46A6 $F0 $01
    ld   [wD18F], a                               ;; 28:46A8 $EA $8F $D1
    ld   a, [hl]                                  ;; 28:46AB $7E
    ldh  [rSB], a                                 ;; 28:46AC $E0 $01
    ld   l, a                                     ;; 28:46AE $6F
    ld   a, [wD178]                               ;; 28:46AF $FA $78 $D1
    add  l                                        ;; 28:46B2 $85
    ld   [wD178], a                               ;; 28:46B3 $EA $78 $D1
    ld   a, [wD179]                               ;; 28:46B6 $FA $79 $D1
    adc  $00                                      ;; 28:46B9 $CE $00
    ld   [wD179], a                               ;; 28:46BB $EA $79 $D1
    ld   a, $01                                   ;; 28:46BE $3E $01
    ldh  [rSC], a                                 ;; 28:46C0 $E0 $02
    ld   a, $81                                   ;; 28:46C2 $3E $81
    ldh  [rSC], a                                 ;; 28:46C4 $E0 $02
    ld   hl, wD17A                                ;; 28:46C6 $21 $7A $D1
    inc  [hl]                                     ;; 28:46C9 $34
    jr   nz, .else_46CE_28                        ;; 28:46CA $20 $02

    inc  hl                                       ;; 28:46CC $23
    inc  [hl]                                     ;; 28:46CD $34
.else_46CE_28:
    ld   hl, wD17A                                ;; 28:46CE $21 $7A $D1
    ld   a, [wD189]                               ;; 28:46D1 $FA $89 $D1
    cp   [hl]                                     ;; 28:46D4 $BE
    jr   nz, .return_46DE_28                      ;; 28:46D5 $20 $07

    inc  hl                                       ;; 28:46D7 $23
    ld   a, [wD18A]                               ;; 28:46D8 $FA $8A $D1
    cp   [hl]                                     ;; 28:46DB $BE
    jr   z, .else_46DF_28                         ;; 28:46DC $28 $01

.return_46DE_28:
    ret                                           ;; 28:46DE $C9


.else_46DF_28:
    ld   hl, wD174                                ;; 28:46DF $21 $74 $D1
    ld   a, [hl]                                  ;; 28:46E2 $7E
    and  a                                        ;; 28:46E3 $A7
    jr   z, .else_46E9_28                         ;; 28:46E4 $28 $03

    ld   hl, wD175                                ;; 28:46E6 $21 $75 $D1
.else_46E9_28:
    inc  [hl]                                     ;; 28:46E9 $34
    ld   a, [wD190]                               ;; 28:46EA $FA $90 $D1
    and  a                                        ;; 28:46ED $A7
    jr   z, .else_4722_28                         ;; 28:46EE $28 $32

    ld   a, [wD16B]                               ;; 28:46F0 $FA $6B $D1
    cp   $06                                      ;; 28:46F3 $FE $06
    jr   z, .else_4722_28                         ;; 28:46F5 $28 $2B

    ld   hl, wD175                                ;; 28:46F7 $21 $75 $D1
    ld   a, [hl]                                  ;; 28:46FA $7E
    and  a                                        ;; 28:46FB $A7
    jr   nz, .else_471E_28                        ;; 28:46FC $20 $20

    xor  a                                        ;; 28:46FE $AF
    ld   [wD17A], a                               ;; 28:46FF $EA $7A $D1
    ld   [wD17B], a                               ;; 28:4702 $EA $7B $D1
    ld   a, [wD187]                               ;; 28:4705 $FA $87 $D1
    ld   [wD183], a                               ;; 28:4708 $EA $83 $D1
    ld   a, [wD188]                               ;; 28:470B $FA $88 $D1
    ld   [wD184], a                               ;; 28:470E $EA $84 $D1
    ld   a, [wD18D]                               ;; 28:4711 $FA $8D $D1
    ld   [wD189], a                               ;; 28:4714 $EA $89 $D1
    ld   a, [wD18E]                               ;; 28:4717 $FA $8E $D1
    ld   [wD18A], a                               ;; 28:471A $EA $8A $D1
    ret                                           ;; 28:471D $C9


.else_471E_28:
    call .func_028_4735                           ;; 28:471E $CD $35 $47
    ret                                           ;; 28:4721 $C9


.else_4722_28:
    ld   a, [wD18F]                               ;; 28:4722 $FA $8F $D1
    ld   [wD16E], a                               ;; 28:4725 $EA $6E $D1
.func_028_4728::
    ld   a, $07                                   ;; 28:4728 $3E $07
    ld   [wD16B], a                               ;; 28:472A $EA $6B $D1
    ld   a, $01                                   ;; 28:472D $3E $01
    ld   [wD170], a                               ;; 28:472F $EA $70 $D1
    call func_028_47E6.func_028_47F0              ;; 28:4732 $CD $F0 $47
.func_028_4735::
    ld   a, [wD18B]                               ;; 28:4735 $FA $8B $D1
    ld   [wD189], a                               ;; 28:4738 $EA $89 $D1
    ld   a, [wD18C]                               ;; 28:473B $FA $8C $D1
    ld   [wD18A], a                               ;; 28:473E $EA $8A $D1
    ld   a, [wD185]                               ;; 28:4741 $FA $85 $D1
    ld   [wD183], a                               ;; 28:4744 $EA $83 $D1
    ld   a, [wD186]                               ;; 28:4747 $FA $86 $D1
    ld   [wD184], a                               ;; 28:474A $EA $84 $D1
    ret                                           ;; 28:474D $C9


func_028_474E::
    ld   c, a                                     ;; 28:474E $4F
    ld   b, $00                                   ;; 28:474F $06 $00
    ld   hl, wD178                                ;; 28:4751 $21 $78 $D1
    add  hl, bc                                   ;; 28:4754 $09
    ld   a, [hl]                                  ;; 28:4755 $7E
    ldh  [rSB], a                                 ;; 28:4756 $E0 $01
    ld   a, $01                                   ;; 28:4758 $3E $01
    ldh  [rSC], a                                 ;; 28:475A $E0 $02
    ld   a, $81                                   ;; 28:475C $3E $81
    ldh  [rSC], a                                 ;; 28:475E $E0 $02
    ld   hl, wD176                                ;; 28:4760 $21 $76 $D1
    inc  [hl]                                     ;; 28:4763 $34
    ret                                           ;; 28:4764 $C9


func_028_4765::
    ldh  a, [rSB]                                 ;; 28:4765 $F0 $01
    ld   [wD16E], a                               ;; 28:4767 $EA $6E $D1
    xor  a                                        ;; 28:476A $AF
    ldh  [rSB], a                                 ;; 28:476B $E0 $01
    ld   a, $01                                   ;; 28:476D $3E $01
    ldh  [rSC], a                                 ;; 28:476F $E0 $02
    ld   a, $81                                   ;; 28:4771 $3E $81
    ldh  [rSC], a                                 ;; 28:4773 $E0 $02
    ld   hl, wD177                                ;; 28:4775 $21 $77 $D1
    inc  [hl]                                     ;; 28:4778 $34
    ld   a, [hl]                                  ;; 28:4779 $7E
    cp   $02                                      ;; 28:477A $FE $02
    jr   z, func_028_4695.func_028_4728           ;; 28:477C $28 $AA

    ret                                           ;; 28:477E $C9


func_028_477F::
    ld   a, [wD191]                               ;; 28:477F $FA $91 $D1
    ld   [wD192], a                               ;; 28:4782 $EA $92 $D1
    ld   a, [wD16D]                               ;; 28:4785 $FA $6D $D1
    ld   [wD193], a                               ;; 28:4788 $EA $93 $D1
    ldh  a, [rSB]                                 ;; 28:478B $F0 $01
    ld   [wD16D], a                               ;; 28:478D $EA $6D $D1
    cp   $FF                                      ;; 28:4790 $FE $FF
    jr   nz, func_028_47A0                        ;; 28:4792 $20 $0C

    ld   a, $00                                   ;; 28:4794 $3E $00
    ld   [wD172], a                               ;; 28:4796 $EA $72 $D1
    ld   [wD16B], a                               ;; 28:4799 $EA $6B $D1
    ld   a, $02                                   ;; 28:479C $3E $02
    jr   func_028_47B8                            ;; 28:479E $18 $18

func_028_47A0::
    bit  1, a                                     ;; 28:47A0 $CB $4F
    jr   z, func_028_47A9                         ;; 28:47A2 $28 $05

    ld   a, $01                                   ;; 28:47A4 $3E $01
    ld   [wD17D], a                               ;; 28:47A6 $EA $7D $D1
func_028_47A9::
    bit  4, a                                     ;; 28:47A9 $CB $67
    ld   a, $00                                   ;; 28:47AB $3E $00
    ld   [wD16B], a                               ;; 28:47AD $EA $6B $D1
    ld   a, $01                                   ;; 28:47B0 $3E $01
    jr   nz, func_028_47B7                        ;; 28:47B2 $20 $03

    ld   [wD16B], a                               ;; 28:47B4 $EA $6B $D1
func_028_47B7::
    inc  a                                        ;; 28:47B7 $3C
func_028_47B8::
    ld   [wD170], a                               ;; 28:47B8 $EA $70 $D1
    ld   a, [wD190]                               ;; 28:47BB $FA $90 $D1
    and  a                                        ;; 28:47BE $A7
    jr   nz, func_028_47C5                        ;; 28:47BF $20 $04

    xor  a                                        ;; 28:47C1 $AF
    ld   [wD172], a                               ;; 28:47C2 $EA $72 $D1
func_028_47C5::
    ret                                           ;; 28:47C5 $C9


    db   $AF, $E0, $02, $E0, $01                ; $47C6 |.....|

func_028_47CB::
    xor  a                                        ;; 28:47CB $AF
    ldh  [rSB], a                                 ;; 28:47CC $E0 $01
    ldh  [rSC], a                                 ;; 28:47CE $E0 $02
    ld   [wD16B], a                               ;; 28:47D0 $EA $6B $D1
    ld   [wD16C], a                               ;; 28:47D3 $EA $6C $D1
    dec  a                                        ;; 28:47D6 $3D
    ld   [wD16D], a                               ;; 28:47D7 $EA $6D $D1
    ld   [wD16E], a                               ;; 28:47DA $EA $6E $D1
    ld   a, $80                                   ;; 28:47DD $3E $80
    ld   [wD16F], a                               ;; 28:47DF $EA $6F $D1
    call func_028_47E6                            ;; 28:47E2 $CD $E6 $47
    ret                                           ;; 28:47E5 $C9


; What are these values? That's a lot of addresses being set to $00...
func_028_47E6::
    xor  a                                        ;; 28:47E6 $AF
    ld   [wD170], a                               ;; 28:47E7 $EA $70 $D1
    ld   [wD171], a                               ;; 28:47EA $EA $71 $D1
    ld   [wD172], a                               ;; 28:47ED $EA $72 $D1
.func_028_47F0::
    xor  a                                      ; $47F0:, func_028_47E6.func_028_47F0 $AF
    ld   [wD173], a                             ; $47F1:, func_028_47E6.func_028_47F0 $EA $73 $D1
    ld   [wD174], a                             ; $47F4:, func_028_47E6.func_028_47F0 $EA $74 $D1
    ld   [wD175], a                             ; $47F7:, func_028_47E6.func_028_47F0 $EA $75 $D1
    ld   [wD176], a                             ; $47FA:, func_028_47E6.func_028_47F0 $EA $76 $D1
    ld   [wD177], a                             ; $47FD:, func_028_47E6.func_028_47F0 $EA $77 $D1
    ld   [wD178], a                             ; $4800:, func_028_47E6.func_028_47F0 $EA $78 $D1
    ld   [wD179], a                             ; $4803:, func_028_47E6.func_028_47F0 $EA $79 $D1
    ld   [wD17A], a                             ; $4806:, func_028_47E6.func_028_47F0 $EA $7A $D1
    ld   [wD17B], a                             ; $4809:, func_028_47E6.func_028_47F0 $EA $7B $D1
    ld   [wD17C], a                             ; $480C:, func_028_47E6.func_028_47F0 $EA $7C $D1
    ld   [wD17D], a                             ; $480F:, func_028_47E6.func_028_47F0 $EA $7D $D1
    ret                                         ; $4812:, func_028_47E6.func_028_47F0 $C9


func_028_4813::
    ld   a, [wD172]                               ;; 28:4813 $FA $72 $D1
    and  a                                        ;; 28:4816 $A7
    jr   z, .else_481D_28                         ;; 28:4817 $28 $04

    call func_028_482E                            ;; 28:4819 $CD $2E $48
    ret  nc                                       ;; 28:481C $D0

.else_481D_28:
    ld   a, [wD192]                               ;; 28:481D $FA $92 $D1
    cp   $01                                      ;; 28:4820 $FE $01
    jr   nz, .else_4828_28                        ;; 28:4822 $20 $04

    call func_028_482E                            ;; 28:4824 $CD $2E $48
    ret  nc                                       ;; 28:4827 $D0

.else_4828_28:
    call func_028_4AA2                            ;; 28:4828 $CD $A2 $4A
    jp   func_028_4B6B                            ;; 28:482B $C3 $6B $4B

func_028_482E::
    ld   a, [wD170]                               ;; 28:482E $FA $70 $D1
    cp   $02                                      ;; 28:4831 $FE $02
    jr   c, func_028_4878                         ;; 28:4833 $38 $43

    call func_028_487C                            ;; 28:4835 $CD $7C $48
    jr   nz, func_028_4878                        ;; 28:4838 $20 $3E

    xor  a                                        ;; 28:483A $AF
    ld   [wD182], a                               ;; 28:483B $EA $82 $D1
    ld   [wD192], a                               ;; 28:483E $EA $92 $D1
    inc  a                                        ;; 28:4841 $3C
    ld   [wD16B], a                               ;; 28:4842 $EA $6B $D1
    ld   a, [wD16D]                               ;; 28:4845 $FA $6D $D1
    cp   $FF                                      ;; 28:4848 $FE $FF
    jr   z, func_028_486E                         ;; 28:484A $28 $22

    bit  0, a                                     ;; 28:484C $CB $47
    jr   nz, .else_4867_28                        ;; 28:484E $20 $17

    bit  1, a                                     ;; 28:4850 $CB $4F
    jr   nz, .else_4867_28                        ;; 28:4852 $20 $13

    and  %11110000                                ;; 28:4854 $E6 $F0
    jr   z, func_028_4876                         ;; 28:4856 $28 $1E

    xor  a                                        ;; 28:4858 $AF
    ld   [wD16B], a                               ;; 28:4859 $EA $6B $D1
    ld   [wD192], a                               ;; 28:485C $EA $92 $D1
    ld   a, [wD16D]                               ;; 28:485F $FA $6D $D1
    call func_028_4BA7                            ;; 28:4862 $CD $A7 $4B
    jr   func_028_4876                            ;; 28:4865 $18 $0F

.else_4867_28:
    scf                                           ;; 28:4867 $37
    ret                                           ;; 28:4868 $C9


    db   $AF, $EA, $92, $D1, $3D                ; $4869 |....=|

func_028_486E::
    inc  a                                        ;; 28:486E $3C
    ld   [wD16B], a                               ;; 28:486F $EA $6B $D1
    dec  a                                        ;; 28:4872 $3D
    call func_028_4BA7                            ;; 28:4873 $CD $A7 $4B
func_028_4876::
    and  a                                        ;; 28:4876 $A7
    ret                                           ;; 28:4877 $C9


func_028_4878::
    xor  a                                        ;; 28:4878 $AF
    ld   a, $F0                                   ;; 28:4879 $3E $F0
    ret                                           ;; 28:487B $C9


func_028_487C::
    ld   hl, wD170                                ;; 28:487C $21 $70 $D1
    ld   a, [hl]                                  ;; 28:487F $7E
    cp   $03                                      ;; 28:4880 $FE $03
    ret  z                                        ;; 28:4882 $C8

    inc  a                                        ;; 28:4883 $3C
    ld   [hl], a                                  ;; 28:4884 $77
    ret                                           ;; 28:4885 $C9


func_028_4886::
    ld   a, [wD16B]                               ;; 28:4886 $FA $6B $D1
    cp   $01                                      ;; 28:4889 $FE $01
    jr   z, .else_4898_28                         ;; 28:488B $28 $0B

    cp   $02                                      ;; 28:488D $FE $02
    jr   z, .else_4898_28                         ;; 28:488F $28 $07

    and  a                                        ;; 28:4891 $A7
    ld   a, $FF                                   ;; 28:4892 $3E $FF
    ret  z                                        ;; 28:4894 $C8

.loop_4895_28
    ld   a, $F0                                   ;; 28:4895 $3E $F0
    ret                                           ;; 28:4897 $C9


.else_4898_28:
    ld   a, [wD17D]                               ;; 28:4898 $FA $7D $D1
    and  a                                        ;; 28:489B $A7
    jr   nz, .loop_4895_28                        ;; 28:489C $20 $F7

    ld   a, [wD172]                               ;; 28:489E $FA $72 $D1
    and  a                                        ;; 28:48A1 $A7
    jr   z, .else_48A8_28                         ;; 28:48A2 $28 $04

    call func_028_482E                            ;; 28:48A4 $CD $2E $48
    ret  nc                                       ;; 28:48A7 $D0

.else_48A8_28:
    ld   a, [wD192]                               ;; 28:48A8 $FA $92 $D1
    cp   $02                                      ;; 28:48AB $FE $02
    jr   nz, .else_48B3_28                        ;; 28:48AD $20 $04

    call func_028_482E                            ;; 28:48AF $CD $2E $48
    ret  nc                                       ;; 28:48B2 $D0

.else_48B3_28:
    ld   a, [wD16D]                               ;; 28:48B3 $FA $6D $D1
    cp   $FF                                      ;; 28:48B6 $FE $FF
    jp   z, func_028_4BA7                         ;; 28:48B8 $CA $A7 $4B

    call func_028_4AAF                            ;; 28:48BB $CD $AF $4A
    jp   func_028_4B6B                            ;; 28:48BE $C3 $6B $4B

func_028_48C1::
    ld   c, a                                     ;; 28:48C1 $4F
    ld   a, [wD16B]                               ;; 28:48C2 $FA $6B $D1
    and  a                                        ;; 28:48C5 $A7
    ld   a, [wD16D]                               ;; 28:48C6 $FA $6D $D1
    jp   z, func_028_4BA7                         ;; 28:48C9 $CA $A7 $4B

    ld   a, [wD16B]                               ;; 28:48CC $FA $6B $D1
    cp   $01                                      ;; 28:48CF $FE $01
    jr   z, .else_48DA_28                         ;; 28:48D1 $28 $07

    cp   $03                                      ;; 28:48D3 $FE $03
    jr   z, .else_48DA_28                         ;; 28:48D5 $28 $03

    ld   a, $F0                                   ;; 28:48D7 $3E $F0
    ret                                           ;; 28:48D9 $C9


.else_48DA_28:
    ld   a, [wD172]                               ;; 28:48DA $FA $72 $D1
    and  a                                        ;; 28:48DD $A7
    jr   nz, .else_4934_28                        ;; 28:48DE $20 $54

    ld   a, c                                     ;; 28:48E0 $79
    inc  a                                        ;; 28:48E1 $3C
    ld   [wD194], a                               ;; 28:48E2 $EA $94 $D1
    ld   a, l                                     ;; 28:48E5 $7D
    ld   [wD195], a                               ;; 28:48E6 $EA $95 $D1
    ld   a, h                                     ;; 28:48E9 $7C
    ld   [wD196], a                               ;; 28:48EA $EA $96 $D1
    ld   a, $00                                   ;; 28:48ED $3E $00
    ld   [wD197], a                               ;; 28:48EF $EA $97 $D1
    ld   a, $D0                                   ;; 28:48F2 $3E $D0
    ld   [wD198], a                               ;; 28:48F4 $EA $98 $D1
    ld   a, [wD16D]                               ;; 28:48F7 $FA $6D $D1
    cp   $FF                                      ;; 28:48FA $FE $FF
    jp   z, func_028_4BA7                         ;; 28:48FC $CA $A7 $4B

    ld   a, [wD199]                               ;; 28:48FF $FA $99 $D1
    ld   [wD1B5], a                               ;; 28:4902 $EA $B5 $D1
    and  a                                        ;; 28:4905 $A7
    jr   z, .else_4928_28                         ;; 28:4906 $28 $20

    ld   a, [wD194]                               ;; 28:4908 $FA $94 $D1
    dec  a                                        ;; 28:490B $3D
    dec  a                                        ;; 28:490C $3D
    ld   c, a                                     ;; 28:490D $4F
    ld   b, $00                                   ;; 28:490E $06 $00
    push hl                                       ;; 28:4910 $E5
    ld   hl, wD1AC                                ;; 28:4911 $21 $AC $D1
    add  hl, bc                                   ;; 28:4914 $09
    ld   a, [hl]                                  ;; 28:4915 $7E
    ld   [wD1B5], a                               ;; 28:4916 $EA $B5 $D1
    sla  c                                        ;; 28:4919 $CB $21
    ld   b, $00                                   ;; 28:491B $06 $00
    ld   hl, wD19A                                ;; 28:491D $21 $9A $D1
    add  hl, bc                                   ;; 28:4920 $09
    ldi  a, [hl]                                  ;; 28:4921 $2A
    ld   b, [hl]                                  ;; 28:4922 $46
    pop  hl                                       ;; 28:4923 $E1
    ld   c, a                                     ;; 28:4924 $4F
    jp   .func_028_492B                           ;; 28:4925 $C3 $2B $49

.else_4928_28:
    ld   bc, $280                                 ;; 28:4928 $01 $80 $02
.func_028_492B::
    call func_028_4BD9                            ;; 28:492B $CD $D9 $4B
    call func_028_4B0F                            ;; 28:492E $CD $0F $4B
    jp   func_028_4B6B                            ;; 28:4931 $C3 $6B $4B

.else_4934_28:
    ld   a, [wD170]                               ;; 28:4934 $FA $70 $D1
    cp   $02                                      ;; 28:4937 $FE $02
    ld   a, $F0                                   ;; 28:4939 $3E $F0
    jp   c, .return_49E1_28                       ;; 28:493B $DA $E1 $49

    call func_028_487C                            ;; 28:493E $CD $7C $48
    ld   a, $F0                                   ;; 28:4941 $3E $F0
    jp   nz, .return_49E1_28                      ;; 28:4943 $C2 $E1 $49

    ld   hl, wD194                                ;; 28:4946 $21 $94 $D1
    ld   a, [wD16D]                               ;; 28:4949 $FA $6D $D1
    ld   c, a                                     ;; 28:494C $4F
    and  %11110000                                ;; 28:494D $E6 $F0
    ld   a, c                                     ;; 28:494F $79
    jp   nz, .func_028_49CE                       ;; 28:4950 $C2 $CE $49

    bit  1, a                                     ;; 28:4953 $CB $4F
    jp   nz, .func_028_4970                       ;; 28:4955 $C2 $70 $49

    bit  0, a                                     ;; 28:4958 $CB $47
    jp   nz, .func_028_4970                       ;; 28:495A $C2 $70 $49

    ld   a, [hl]                                  ;; 28:495D $7E
    and  a                                        ;; 28:495E $A7
    ld   a, [wD16D]                               ;; 28:495F $FA $6D $D1
    jr   z, .else_49D8_28                         ;; 28:4962 $28 $74

    ld   a, [hl]                                  ;; 28:4964 $7E
    cp   $01                                      ;; 28:4965 $FE $01
    jp   z, .func_028_49E2                        ;; 28:4967 $CA $E2 $49

    dec  [hl]                                     ;; 28:496A $35
    ld   a, [wD16D]                               ;; 28:496B $FA $6D $D1
    jr   z, .else_49D8_28                         ;; 28:496E $28 $68

.func_028_4970::
    ld   a, [hl]                                  ;; 28:4970 $7E
    cp   $01                                      ;; 28:4971 $FE $01
    ld   a, $F0                                   ;; 28:4973 $3E $F0
    jp   z, .return_49E1_28                       ;; 28:4975 $CA $E1 $49

    ld   bc, $280                                 ;; 28:4978 $01 $80 $02
    ld   a, [wD199]                               ;; 28:497B $FA $99 $D1
    ld   [wD1B5], a                               ;; 28:497E $EA $B5 $D1
    and  a                                        ;; 28:4981 $A7
    jr   z, .else_49A1_28                         ;; 28:4982 $28 $1D

    ld   a, [wD194]                               ;; 28:4984 $FA $94 $D1
    dec  a                                        ;; 28:4987 $3D
    dec  a                                        ;; 28:4988 $3D
    ld   c, a                                     ;; 28:4989 $4F
    ld   b, $00                                   ;; 28:498A $06 $00
    push hl                                       ;; 28:498C $E5
    ld   hl, wD1AC                                ;; 28:498D $21 $AC $D1
    add  hl, bc                                   ;; 28:4990 $09
    ld   a, [hl]                                  ;; 28:4991 $7E
    ld   [wD1B5], a                               ;; 28:4992 $EA $B5 $D1
    sla  c                                        ;; 28:4995 $CB $21
    ld   b, $00                                   ;; 28:4997 $06 $00
    ld   hl, wD19A                                ;; 28:4999 $21 $9A $D1
    add  hl, bc                                   ;; 28:499C $09
    ldi  a, [hl]                                  ;; 28:499D $2A
    ld   b, [hl]                                  ;; 28:499E $46
    pop  hl                                       ;; 28:499F $E1
    ld   c, a                                     ;; 28:49A0 $4F
.else_49A1_28:
    ld   a, [wD16D]                               ;; 28:49A1 $FA $6D $D1
    bit  1, a                                     ;; 28:49A4 $CB $4F
    jp   nz, .func_028_49C3                       ;; 28:49A6 $C2 $C3 $49

    ld   a, [wD197]                               ;; 28:49A9 $FA $97 $D1
    add  $28                                      ;; 28:49AC $C6 $28
    ld   [wD197], a                               ;; 28:49AE $EA $97 $D1
    ld   a, [wD198]                               ;; 28:49B1 $FA $98 $D1
    adc  $00                                      ;; 28:49B4 $CE $00
    ld   [wD198], a                               ;; 28:49B6 $EA $98 $D1
    ld   a, $00                                   ;; 28:49B9 $3E $00
    ld   [wD187], a                               ;; 28:49BB $EA $87 $D1
    ld   a, $C2                                   ;; 28:49BE $3E $C2
    ld   [wD188], a                               ;; 28:49C0 $EA $88 $D1
.func_028_49C3::
    ld   a, [wD187]                               ;; 28:49C3 $FA $87 $D1
    ld   l, a                                     ;; 28:49C6 $6F
    ld   a, [wD188]                               ;; 28:49C7 $FA $88 $D1
    ld   h, a                                     ;; 28:49CA $67
    jp   .func_028_492B                           ;; 28:49CB $C3 $2B $49

.func_028_49CE::
    push af                                       ;; 28:49CE $F5
    ld   a, $01                                   ;; 28:49CF $3E $01
    ld   [wD17C], a                               ;; 28:49D1 $EA $7C $D1
    pop  af                                       ;; 28:49D4 $F1
    call func_028_4BA7                            ;; 28:49D5 $CD $A7 $4B
.else_49D8_28:
    push af                                       ;; 28:49D8 $F5
    xor  a                                        ;; 28:49D9 $AF
    ld   [wD190], a                               ;; 28:49DA $EA $90 $D1
    ld   [wD172], a                               ;; 28:49DD $EA $72 $D1
    pop  af                                       ;; 28:49E0 $F1
.return_49E1_28:
    ret                                           ;; 28:49E1 $C9


.func_028_49E2::
    ld   a, [wD1B6]                               ;; 28:49E2 $FA $B6 $D1
    and  a                                        ;; 28:49E5 $A7
    ld   a, [wD16D]                               ;; 28:49E6 $FA $6D $D1
    jr   z, .else_49D8_28                         ;; 28:49E9 $28 $ED

    dec  [hl]                                     ;; 28:49EB $35
    call func_028_4B5D                            ;; 28:49EC $CD $5D $4B
    jp   func_028_4B6B                            ;; 28:49EF $C3 $6B $4B

func_028_49F2::
    ld   a, [wLinkPositionXHistory + 22]          ;; 28:49F2 $FA $6B $D1
    cp   $01                                      ;; 28:49F5 $FE $01
    jr   z, .jr_4a04                              ;; 28:49F7 $28 $0B

    cp   $03                                      ;; 28:49F9 $FE $03
    jr   z, .jr_4a04                              ;; 28:49FB $28 $07

    and  a                                        ;; 28:49FD $A7
    ld   a, $ff                                   ;; 28:49FE $3E $FF
    ret  z                                        ;; 28:4A00 $C8

    ld   a, $f0                                   ;; 28:4A01 $3E $F0
    ret                                           ;; 28:4A03 $C9


.jr_4a04::
    ld   a, [wD172]                               ;; 28:4A04 $FA $72 $D1
    and  a                                        ;; 28:4A07 $A7
    jr   z, .jr_4a0e                              ;; 28:4A08 $28 $04

    call func_028_482E                            ;; 28:4A0A $CD $2E $48
    ret  nc                                       ;; 28:4A0D $D0

.jr_4a0e::
    ld   a, [wD192]                               ;; 28:4A0E $FA $92 $D1
    cp   $04                                      ;; 28:4A11 $FE $04
    jr   nz, .jr_4a19                             ;; 28:4A13 $20 $04

    call func_028_482E                            ;; 28:4A15 $CD $2E $48
    ret  nc                                       ;; 28:4A18 $D0

.jr_4a19::
    ld   a, [wD16D]                               ;; 28:4A19 $FA $6D $D1
    cp   $ff                                      ;; 28:4A1C $FE $FF
    jp   z, func_028_4BA7                         ;; 28:4A1E $CA $A7 $4B

    call Call_028_4b43                            ;; 28:4A21 $CD $43 $4B
    jp   func_028_4B6B                            ;; 28:4A24 $C3 $6B $4B


func_028_4A27::
    ld   a, [wD16B]                               ;; 28:4A27 $FA $6B $D1
    cp   $01                                      ;; 28:4A2A $FE $01
    jr   z, .else_4A39_28                         ;; 28:4A2C $28 $0B

    cp   $03                                      ;; 28:4A2E $FE $03
    jr   z, .else_4A39_28                         ;; 28:4A30 $28 $07

    and  a                                        ;; 28:4A32 $A7
    ld   a, $FF                                   ;; 28:4A33 $3E $FF
    ret  z                                        ;; 28:4A35 $C8

    ld   a, $F0                                   ;; 28:4A36 $3E $F0
    ret                                           ;; 28:4A38 $C9


.else_4A39_28:
    ld   a, [wD172]                               ;; 28:4A39 $FA $72 $D1
    and  a                                        ;; 28:4A3C $A7
    jr   z, .else_4A43_28                         ;; 28:4A3D $28 $04

    call func_028_482E                            ;; 28:4A3F $CD $2E $48
    ret  nc                                       ;; 28:4A42 $D0

.else_4A43_28:
    ld   a, [wD16D]                               ;; 28:4A43 $FA $6D $D1
    cp   $FF                                      ;; 28:4A46 $FE $FF
    jp   z, func_028_4BA7                         ;; 28:4A48 $CA $A7 $4B

    call func_028_4B50                            ;; 28:4A4B $CD $50 $4B
    jp   func_028_4B6B                            ;; 28:4A4E $C3 $6B $4B

func_028_4A51::
    ld   [wD191], a                               ;; 28:4A51 $EA $91 $D1
    ld   a, d                                     ;; 28:4A54 $7A
    ld   [wD190], a                               ;; 28:4A55 $EA $90 $D1
    ld   a, l                                     ;; 28:4A58 $7D
    ld   [wD183], a                               ;; 28:4A59 $EA $83 $D1
    ld   [wD185], a                               ;; 28:4A5C $EA $85 $D1
    ld   a, h                                     ;; 28:4A5F $7C
    ld   [wD184], a                               ;; 28:4A60 $EA $84 $D1
    ld   [wD186], a                               ;; 28:4A63 $EA $86 $D1
    ld   a, c                                     ;; 28:4A66 $79
    ld   [wD189], a                               ;; 28:4A67 $EA $89 $D1
    ld   [wD18B], a                               ;; 28:4A6A $EA $8B $D1
    ld   a, b                                     ;; 28:4A6D $78
    ld   [wD18A], a                               ;; 28:4A6E $EA $8A $D1
    ld   [wD18C], a                               ;; 28:4A71 $EA $8C $D1
    xor  a                                        ;; 28:4A74 $AF
    ld   [wD170], a                               ;; 28:4A75 $EA $70 $D1
    call func_028_47E6.func_028_47F0              ;; 28:4A78 $CD $F0 $47
    ret                                           ;; 28:4A7B $C9

Data_028_4A7C::
    db   $88, $33

Data_028_4A7E::
    db   $01, $00, $00, $00, $01, $00, $00, $00   ;; 28:4A7E

Data_028_4A86::
    db   $02, $00, $04, $00

Data_028_4A8A::
    db   $04, $00, $00, $00, $04, $00, $00, $00

Data_028_4A92::
    db   $08, $00, $00, $00, $08, $00, $00, $00

Data_028_4A9A::
    db   $0F, $00, $00, $00, $0F, $00, $00, $00

func_028_4AA2::
    ld   a, $01                                   ;; 28:4AA2 $3E $01
    ld   d, $00                                   ;; 28:4AA4 $16 $00
    ld   hl, Data_028_4A7E                        ;; 28:4AA6 $21 $7E $4A
    ld   bc, $08                                  ;; 28:4AA9 $01 $08 $00
    jp   func_028_4A51                            ;; 28:4AAC $C3 $51 $4A

func_028_4AAF::
    ld   a, $02                                   ;; 28:4AAF $3E $02
    ld   d, $00                                   ;; 28:4AB1 $16 $00
    ld   hl, wD1B7                                ;; 28:4AB3 $21 $B7 $D1
    ld   bc, $0C                                  ;; 28:4AB6 $01 $0C $00
    call func_028_4A51                            ;; 28:4AB9 $CD $51 $4A
    ld   hl, Data_028_4A86                        ;; 28:4ABC $21 $86 $4A
    ld   de, wD1B7                                ;; 28:4ABF $11 $B7 $D1
    ld   bc, $04                                  ;; 28:4AC2 $01 $04 $00
    call func_028_4B06                            ;; 28:4AC5 $CD $06 $4B
    ld   de, $06                                  ;; 28:4AC8 $11 $06 $00
    ld   a, [wD17F]                               ;; 28:4ACB $FA $7F $D1
    ld   [wD1BB], a                               ;; 28:4ACE $EA $BB $D1
    call func_028_4AFF                            ;; 28:4AD1 $CD $FF $4A
    ld   a, [wD17E]                               ;; 28:4AD4 $FA $7E $D1
    ld   [wD1BC], a                               ;; 28:4AD7 $EA $BC $D1
    call func_028_4AFF                            ;; 28:4ADA $CD $FF $4A
    ld   a, [wD180]                               ;; 28:4ADD $FA $80 $D1
    ld   [wD1BD], a                               ;; 28:4AE0 $EA $BD $D1
    call func_028_4AFF                            ;; 28:4AE3 $CD $FF $4A
    ld   a, [wD16F]                               ;; 28:4AE6 $FA $6F $D1
    ld   [wD1BE], a                               ;; 28:4AE9 $EA $BE $D1
    call func_028_4AFF                            ;; 28:4AEC $CD $FF $4A
    ld   a, e                                     ;; 28:4AEF $7B
    ld   [wD1BF], a                               ;; 28:4AF0 $EA $BF $D1
    ld   a, d                                     ;; 28:4AF3 $7A
    ld   [wD1C0], a                               ;; 28:4AF4 $EA $C0 $D1
    xor  a                                        ;; 28:4AF7 $AF
    ld   [wD1C1], a                               ;; 28:4AF8 $EA $C1 $D1
    ld   [wD1C2], a                               ;; 28:4AFB $EA $C2 $D1
    ret                                           ;; 28:4AFE $C9


func_028_4AFF::
    add  e                                        ;; 28:4AFF $83
    ld   e, a                                     ;; 28:4B00 $5F
    ld   a, d                                     ;; 28:4B01 $7A
    adc  $00                                      ;; 28:4B02 $CE $00
    ld   d, a                                     ;; 28:4B04 $57
    ret                                           ;; 28:4B05 $C9


func_028_4B06::
    ldi  a, [hl]                                  ;; 28:4B06 $2A
    ld   [de], a                                  ;; 28:4B07 $12
    inc  de                                       ;; 28:4B08 $13
    dec  bc                                       ;; 28:4B09 $0B
    ld   a, c                                     ;; 28:4B0A $79
    or   b                                        ;; 28:4B0B $B0
    jr   nz, func_028_4B06                        ;; 28:4B0C $20 $F8

    ret                                           ;; 28:4B0E $C9


func_028_4B0F::
    ld   a, l                                     ;; 28:4B0F $7D
    ld   [wD187], a                               ;; 28:4B10 $EA $87 $D1
    ld   a, h                                     ;; 28:4B13 $7C
    ld   [wD188], a                               ;; 28:4B14 $EA $88 $D1
    ld   a, c                                     ;; 28:4B17 $79
    ld   [wD18D], a                               ;; 28:4B18 $EA $8D $D1
    ld   a, b                                     ;; 28:4B1B $78
    ld   [wD18E], a                               ;; 28:4B1C $EA $8E $D1
    push bc                                       ;; 28:4B1F $C5
    ld   a, $03                                   ;; 28:4B20 $3E $03
    ld   d, $01                                   ;; 28:4B22 $16 $01
    ld   hl, wD1B7                                ;; 28:4B24 $21 $B7 $D1
    ld   bc, $04                                  ;; 28:4B27 $01 $04 $00
    call func_028_4A51                            ;; 28:4B2A $CD $51 $4A
    ld   a, [Data_028_4A8A]                       ;; 28:4B2D $FA $8A $4A
    ld   [wD1B7], a                               ;; 28:4B30 $EA $B7 $D1
    ld   a, [wD1B5]                               ;; 28:4B33 $FA $B5 $D1
    ld   [wD1B8], a                               ;; 28:4B36 $EA $B8 $D1
    pop  bc                                       ;; 28:4B39 $C1
    ld   a, c                                     ;; 28:4B3A $79
    ld   [wD1B9], a                               ;; 28:4B3B $EA $B9 $D1
    ld   a, b                                     ;; 28:4B3E $78
    ld   [wD1BA], a                               ;; 28:4B3F $EA $BA $D1
    ret                                           ;; 28:4B42 $C9

Call_028_4b43::
    ld   a, $04                                   ;; 28:4B43 $3E $04
    ld   d, $00                                   ;; 28:4B45 $16 $00
    ld   hl, Data_028_4A92                        ;; 28:4B47 $21 $92 $4A
    ld   bc, $08                                  ;; 28:4B4A $01 $08 $00
    jp   func_028_4A51                            ;; 28:4B4D $C3 $51 $4A

func_028_4B50::
    ld   a, $05                                   ;; 28:4B50 $3E $05
    ld   d, $00                                   ;; 28:4B52 $16 $00
    ld   hl, Data_028_4A9A                        ;; 28:4B54 $21 $9A $4A
    ld   bc, $08                                  ;; 28:4B57 $01 $08 $00
    jp   func_028_4A51                            ;; 28:4B5A $C3 $51 $4A

func_028_4B5D::
    ld   a, $06                                   ;; 28:4B5D $3E $06
    ld   d, $01                                   ;; 28:4B5F $16 $01
    ld   hl, Data_028_4A8A                        ;; 28:4B61 $21 $8A $4A
    ld   bc, $08                                  ;; 28:4B64 $01 $08 $00
    jp   func_028_4A51                            ;; 28:4B67 $C3 $51 $4A

    ret                                         ; $4B6A |.|

func_028_4B6B::
    ld   a, [wD16B]                               ;; 28:4B6B $FA $6B $D1
    cp   $01                                      ;; 28:4B6E $FE $01
    jr   z, func_028_4B7E                         ;; 28:4B70 $28 $0C

    and  a                                        ;; 28:4B72 $A7
    jr   nz, func_028_4B7C                        ;; 28:4B73 $20 $07

    ld   a, [wD191]                               ;; 28:4B75 $FA $91 $D1
    cp   $01                                      ;; 28:4B78 $FE $01
    jr   z, func_028_4B88                         ;; 28:4B7A $28 $0C

func_028_4B7C::
    scf                                           ;; 28:4B7C $37
    ret                                           ;; 28:4B7D $C9


func_028_4B7E::
    ld   a, [wD191]                               ;; 28:4B7E $FA $91 $D1
    cp   $01                                      ;; 28:4B81 $FE $01
    jr   z, func_028_4B7C                         ;; 28:4B83 $28 $F7

    ld   [wD16B], a                               ;; 28:4B85 $EA $6B $D1
func_028_4B88::
    xor  a                                        ;; 28:4B88 $AF
    ld   [wD170], a                               ;; 28:4B89 $EA $70 $D1
    ld   [wD192], a                               ;; 28:4B8C $EA $92 $D1
    ld   a, $01                                   ;; 28:4B8F $3E $01
    ld   [wD17A], a                               ;; 28:4B91 $EA $7A $D1
    ld   [wD172], a                               ;; 28:4B94 $EA $72 $D1
    ld   a, [Data_028_4A7C]                       ;; 28:4B97 $FA $7C $4A
    ldh  [rSB], a                                 ;; 28:4B9A $E0 $01
    ld   a, $01                                   ;; 28:4B9C $3E $01
    ldh  [rSC], a                                 ;; 28:4B9E $E0 $02
    ld   a, $81                                   ;; 28:4BA0 $3E $81
    ldh  [rSC], a                                 ;; 28:4BA2 $E0 $02
    ld   a, $F0                                   ;; 28:4BA4 $3E $F0
    ret                                           ;; 28:4BA6 $C9


func_028_4BA7::
    push af                                       ;; 28:4BA7 $F5
    ld   a, [wD16D]                               ;; 28:4BA8 $FA $6D $D1
    cp   $FF                                      ;; 28:4BAB $FE $FF
    jr   z, .else_4BC7_28                         ;; 28:4BAD $28 $18

    bit  7, a                                     ;; 28:4BAF $CB $7F
    jr   z, .else_4BB7_28                         ;; 28:4BB1 $28 $04

    ld   a, $00                                   ;; 28:4BB3 $3E $00
    jr   .func_028_4BD4                           ;; 28:4BB5 $18 $1D

.else_4BB7_28:
    bit  6, a                                     ;; 28:4BB7 $CB $77
    jr   z, .else_4BBF_28                         ;; 28:4BB9 $28 $04

    ld   a, $03                                   ;; 28:4BBB $3E $03
    jr   .func_028_4BD4                           ;; 28:4BBD $18 $15

.else_4BBF_28:
    bit  5, a                                     ;; 28:4BBF $CB $6F
    jr   z, .else_4BC7_28                         ;; 28:4BC1 $28 $04

    ld   a, $02                                   ;; 28:4BC3 $3E $02
    jr   .func_028_4BD4                           ;; 28:4BC5 $18 $0D

.else_4BC7_28:
    ld   a, [wD16E]                               ;; 28:4BC7 $FA $6E $D1
    cp   $81                                      ;; 28:4BCA $FE $81
    jr   z, .else_4BD2_28                         ;; 28:4BCC $28 $04

    ld   a, $01                                   ;; 28:4BCE $3E $01
    jr   .func_028_4BD4                           ;; 28:4BD0 $18 $02

.else_4BD2_28:
    ld   a, $01                                   ;; 28:4BD2 $3E $01
.func_028_4BD4::
    ld   [wD1C5], a                               ;; 28:4BD4 $EA $C5 $D1
    pop  af                                       ;; 28:4BD7 $F1
    ret                                           ;; 28:4BD8 $C9


func_028_4BD9::
    push hl                                       ;; 28:4BD9 $E5
    push bc                                       ;; 28:4BDA $C5
    ld   a, [wD197]                               ;; 28:4BDB $FA $97 $D1
    ld   l, a                                     ;; 28:4BDE $6F
    ld   a, [wD198]                               ;; 28:4BDF $FA $98 $D1
    ld   h, a                                     ;; 28:4BE2 $67
    ld   de, wEntitiesPosXTable                   ;; 28:4BE3 $11 $00 $C2
    ld   c, $28                                   ;; 28:4BE6 $0E $28
.loop_4BE8_28
    ldi  a, [hl]                                  ;; 28:4BE8 $2A
    push hl                                       ;; 28:4BE9 $E5
    ld   h, $00                                   ;; 28:4BEA $26 $00
    sla  a                                        ;; 28:4BEC $CB $27
    rl   h                                        ;; 28:4BEE $CB $14
    sla  a                                        ;; 28:4BF0 $CB $27
    rl   h                                        ;; 28:4BF2 $CB $14
    sla  a                                        ;; 28:4BF4 $CB $27
    rl   h                                        ;; 28:4BF6 $CB $14
    sla  a                                        ;; 28:4BF8 $CB $27
    rl   h                                        ;; 28:4BFA $CB $14
    ld   l, a                                     ;; 28:4BFC $6F
    ld   a, [wD169]                               ;; 28:4BFD $FA $69 $D1
    adc  h                                        ;; 28:4C00 $8C
    ld   h, a                                     ;; 28:4C01 $67
    ld   b, $10                                   ;; 28:4C02 $06 $10
    call func_BC5                                 ;; 28:4C04 $CD $C5 $0B
    pop  hl                                       ;; 28:4C07 $E1
    dec  c                                        ;; 28:4C08 $0D
    jr   nz, .loop_4BE8_28                        ;; 28:4C09 $20 $DD

    pop  bc                                       ;; 28:4C0B $C1
    pop  hl                                       ;; 28:4C0C $E1
    ret                                           ;; 28:4C0D $C9


PhotoAlbumStartPrint1Handler:
    call func_028_4813                            ; $4C0E: PhotoAlbumStartPrint1Handler $CD $13 $48
    cp   $F0                                      ; $4C11: PhotoAlbumStartPrint1Handler $FE $F0
    jr   z, .return_4C29_28                       ; $4C13: PhotoAlbumStartPrint1Handler $28 $14

    cp   $FF                                      ; $4C15: PhotoAlbumStartPrint1Handler $FE $FF
    jr   z, .else_4C2A_28                         ; $4C17: PhotoAlbumStartPrint1Handler $28 $11

    ld   a, [wGameplaySubtype]                    ; $4C19: PhotoAlbumStartPrint1Handler $FA $96 $DB
    inc  a                                        ; $4C1C: PhotoAlbumStartPrint1Handler $3C
    ld   [wD1C6], a                               ; $4C1D: PhotoAlbumStartPrint1Handler $EA $C6 $D1
    xor  a                                        ; $4C20: PhotoAlbumStartPrint1Handler $AF
    ld   [wD1C7], a                               ; $4C21: PhotoAlbumStartPrint1Handler $EA $C7 $D1
    ld   a, $10                                   ; $4C24: PhotoAlbumStartPrint1Handler $3E $10
    ld   [wGameplaySubtype], a                    ; $4C26: PhotoAlbumStartPrint1Handler $EA $96 $DB
.return_4C29_28:
    ret                                           ; $4C29: PhotoAlbumStartPrint1Handler $C9


.else_4C2A_28:
    ld   a, JINGLE_WRONG_ANSWER                   ; $4C2A: PhotoAlbumStartPrint1Handler $3E $1D
    ldh  [hJingle], a                             ; $4C2C: PhotoAlbumStartPrint1Handler $E0 $F2
    ld   a, $10                                   ; $4C2E: PhotoAlbumStartPrint1Handler $3E $10
    ldh  [hFrameCounter], a                       ; $4C30: PhotoAlbumStartPrint1Handler $E0 $E7
    ld   a, $11                                   ; $4C32: PhotoAlbumStartPrint1Handler $3E $11
    ld   [wGameplaySubtype], a                    ; $4C34: PhotoAlbumStartPrint1Handler $EA $96 $DB
    ret                                           ; $4C37: PhotoAlbumStartPrint1Handler $C9


PhotoAlbumStartPrint2Handler:
    ld   a, [wD16D]                               ; $4C38: PhotoAlbumStartPrint2Handler $FA $6D $D1
    cp   $FF                                      ; $4C3B: PhotoAlbumStartPrint2Handler $FE $FF
    jp   z, func_028_45E9                         ; $4C3D: PhotoAlbumStartPrint2Handler $CA $E9 $45

    ld   a, [wD172]                               ; $4C40: PhotoAlbumStartPrint2Handler $FA $72 $D1
    and  a                                        ; $4C43: PhotoAlbumStartPrint2Handler $A7
    jr   z, .else_4C54_28                         ; $4C44: PhotoAlbumStartPrint2Handler $28 $0E

    ld   a, [wD16B]                               ; $4C46: PhotoAlbumStartPrint2Handler $FA $6B $D1
    cp   $03                                      ; $4C49: PhotoAlbumStartPrint2Handler $FE $03
    jr   z, .else_4C54_28                         ; $4C4B: PhotoAlbumStartPrint2Handler $28 $07

    cp   $01                                      ; $4C4D: PhotoAlbumStartPrint2Handler $FE $01
    jr   z, .else_4C54_28                         ; $4C4F: PhotoAlbumStartPrint2Handler $28 $03

    jp   func_028_45E9                            ; $4C51: PhotoAlbumStartPrint2Handler $C3 $E9 $45

.else_4C54_28:
    ld   a, $01                                   ; $4C54: PhotoAlbumStartPrint2Handler $3E $01
    ld   [wD1B6], a                               ; $4C56: PhotoAlbumStartPrint2Handler $EA $B6 $D1
    ld   hl, wEntitiesPosXTable                   ; $4C59: PhotoAlbumStartPrint2Handler $21 $00 $C2
    ld   a, $09                                   ; $4C5C: PhotoAlbumStartPrint2Handler $3E $09
    call func_028_48C1                            ; $4C5E: PhotoAlbumStartPrint2Handler $CD $C1 $48
    cp   $FF                                      ; $4C61: PhotoAlbumStartPrint2Handler $FE $FF
    jp   z, func_028_45E9                         ; $4C63: PhotoAlbumStartPrint2Handler $CA $E9 $45

    cp   $F0                                      ; $4C66: PhotoAlbumStartPrint2Handler $FE $F0
    ret  z                                        ; $4C68: PhotoAlbumStartPrint2Handler $C8

    jp   PhotoAlbumIncrementState                 ; $4C69: PhotoAlbumStartPrint2Handler $C3 $DB $44

PhotoAlbumStartPrint3Handler:
    ld   a, [wD16D]                               ; $4C6C: PhotoAlbumStartPrint3Handler $FA $6D $D1
    cp   $FF                                      ; $4C6F: PhotoAlbumStartPrint3Handler $FE $FF
    jp   z, func_028_45E9                         ; $4C71: PhotoAlbumStartPrint3Handler $CA $E9 $45

    ld   a, [wD172]                               ; $4C74: PhotoAlbumStartPrint3Handler $FA $72 $D1
    and  a                                        ; $4C77: PhotoAlbumStartPrint3Handler $A7
    jr   z, .else_4C87_28                         ; $4C78: PhotoAlbumStartPrint3Handler $28 $0D

    ld   a, [wD16B]                               ; $4C7A: PhotoAlbumStartPrint3Handler $FA $6B $D1
    cp   $02                                      ; $4C7D: PhotoAlbumStartPrint3Handler $FE $02
    jr   z, .else_4C87_28                         ; $4C7F: PhotoAlbumStartPrint3Handler $28 $06

    cp   $01                                      ; $4C81: PhotoAlbumStartPrint3Handler $FE $01
    jr   z, .else_4C87_28                         ; $4C83: PhotoAlbumStartPrint3Handler $28 $02

    jr   .return_4CAC_28                          ; $4C85: PhotoAlbumStartPrint3Handler $18 $25

.else_4C87_28:
    ld   a, [wD16D]                               ; $4C87: PhotoAlbumStartPrint3Handler $FA $6D $D1
    bit  1, a                                     ; $4C8A: PhotoAlbumStartPrint3Handler $CB $4F
    jr   nz, .return_4CAC_28                      ; $4C8C: PhotoAlbumStartPrint3Handler $20 $1E

    call func_028_4886                            ; $4C8E: PhotoAlbumStartPrint3Handler $CD $86 $48
    cp   $FF                                      ; $4C91: PhotoAlbumStartPrint3Handler $FE $FF
    jp   z, func_028_45E9                         ; $4C93: PhotoAlbumStartPrint3Handler $CA $E9 $45

    cp   $F0                                      ; $4C96: PhotoAlbumStartPrint3Handler $FE $F0
    ret  z                                        ; $4C98: PhotoAlbumStartPrint3Handler $C8

    ld   a, $03                                   ; $4C99: PhotoAlbumStartPrint3Handler $3E $03
    ld   [wD182], a                               ; $4C9B: PhotoAlbumStartPrint3Handler $EA $82 $D1
    xor  a                                        ; $4C9E: PhotoAlbumStartPrint3Handler $AF
    ld   [wD1C7], a                               ; $4C9F: PhotoAlbumStartPrint3Handler $EA $C7 $D1
    ld   a, $10                                   ; $4CA2: PhotoAlbumStartPrint3Handler $3E $10
    ld   [wGameplaySubtype], a                    ; $4CA4: PhotoAlbumStartPrint3Handler $EA $96 $DB
    ld   a, $0F                                   ; $4CA7: PhotoAlbumStartPrint3Handler $3E $0F
    ld   [wD1C6], a                               ; $4CA9: PhotoAlbumStartPrint3Handler $EA $C6 $D1
.return_4CAC_28:
    ret                                           ; $4CAC: PhotoAlbumStartPrint3Handler $C9


PhotoAlbumStartPrint4Handler:
    ld   a, [wD16D]                               ; $4CAD: PhotoAlbumStartPrint4Handler $FA $6D $D1
    cp   $FF                                      ; $4CB0: PhotoAlbumStartPrint4Handler $FE $FF
    jp   z, func_028_45E9                         ; $4CB2: PhotoAlbumStartPrint4Handler $CA $E9 $45

    bit  3, a                                     ; $4CB5: PhotoAlbumStartPrint4Handler $CB $5F
    jp   nz, .return_4CCD_28                      ; $4CB7: PhotoAlbumStartPrint4Handler $C2 $CD $4C

    bit  1, a                                     ; $4CBA: PhotoAlbumStartPrint4Handler $CB $4F
    jp   nz, .return_4CCD_28                      ; $4CBC: PhotoAlbumStartPrint4Handler $C2 $CD $4C

    ld   a, $01                                   ; $4CBF: PhotoAlbumStartPrint4Handler $3E $01
    ld   [wGameplaySubtype], a                    ; $4CC1: PhotoAlbumStartPrint4Handler $EA $96 $DB
    ld   a, MUSIC_MINIGAME                        ; $4CC4: PhotoAlbumStartPrint4Handler $3E $02
    ld   [wMusicTrackToPlay], a                   ; $4CC6: PhotoAlbumStartPrint4Handler $EA $68 $D3
    xor  a                                        ; $4CC9: PhotoAlbumStartPrint4Handler $AF
    ld   [wD16B], a                               ; $4CCA: PhotoAlbumStartPrint4Handler $EA $6B $D1
.return_4CCD_28:
    ret                                           ; $4CCD: PhotoAlbumStartPrint4Handler $C9


PhotoAlbumStartPrint5Handler:
    ld   hl, wD1C7                                ; $4CCE: PhotoAlbumStartPrint5Handler $21 $C7 $D1
    inc  [hl]                                     ; $4CD1: PhotoAlbumStartPrint5Handler $34
    ld   a, [hl]                                  ; $4CD2: PhotoAlbumStartPrint5Handler $7E
    cp   $06                                      ; $4CD3: PhotoAlbumStartPrint5Handler $FE $06
    jr   c, .return_4CDF_28                       ; $4CD5: PhotoAlbumStartPrint5Handler $38 $08

    xor  a                                        ; $4CD7: PhotoAlbumStartPrint5Handler $AF
    ld   [hl], a                                  ; $4CD8: PhotoAlbumStartPrint5Handler $77
    ld   a, [wD1C6]                               ; $4CD9: PhotoAlbumStartPrint5Handler $FA $C6 $D1
    ld   [wGameplaySubtype], a                    ; $4CDC: PhotoAlbumStartPrint5Handler $EA $96 $DB
.return_4CDF_28:
    ret                                           ; $4CDF: PhotoAlbumStartPrint5Handler $C9

macro MAKE_PRINT_ERROR
; oam data, terminated with $FF
IF __PATCH_1__
    db   $50, $38, $1E, $00
    db   $50, $40, $24, $00
    db   $50, $48, $26, $00
    db   $50, $50, $28, $00
    db   $50, $58, $2A, $00
    db   $50, $60, $2C, $00
    db   $50, $68, $30 + ((\1 - 1) * $2), $00
    db   $FF
ELSE
    db   $50, $30, $14, $00
    db   $50, $38, $16, $00
    db   $50, $40, $18, $00
    db   $50, $48, $1A, $00
    db   $50, $50, $24, $00
    db   $50, $58, $26, $00
    db   $50, $60, $28, $00
    db   $50, $68, $2A, $00
    db   $50, $70, $2C, $00
    db   $50, $78, $30 + ((\1 - 1) * $2), $00
    db   $FF
ENDC
endm

Data_028_4CE0:
    MAKE_PRINT_ERROR $01

Data_028_4D09:
    MAKE_PRINT_ERROR $02

Data_028_4D32:
    MAKE_PRINT_ERROR $03

Data_028_4D5B:
    MAKE_PRINT_ERROR $04

Data_028_4D84:
    dw Data_028_4CE0
    dw Data_028_4D09
    dw Data_028_4D32
    dw Data_028_4D5B

; Display a flashing error message with the printer error (like "Print Error 02")
PhotoAlbumPrintErrorHandler:
    ldh  a, [hJoypadState]                        ; $4D8C: PhotoAlbumPrintErrorHandler $F0 $CC
    and  a                                        ; $4D8E: PhotoAlbumPrintErrorHandler $A7
    jr   z, .else_4D9F_28                         ; $4D8F: PhotoAlbumPrintErrorHandler $28 $0E

    ld   a, $01                                   ; $4D91: PhotoAlbumPrintErrorHandler $3E $01
    ld   [wGameplaySubtype], a                    ; $4D93: PhotoAlbumPrintErrorHandler $EA $96 $DB
    ld   a, MUSIC_MINIGAME                        ; $4D96: PhotoAlbumPrintErrorHandler $3E $02
    ld   [wMusicTrackToPlay], a                   ; $4D98: PhotoAlbumPrintErrorHandler $EA $68 $D3
    xor  a                                        ; $4D9B: PhotoAlbumPrintErrorHandler $AF
    ld   [wTransitionSequenceCounter], a          ; $4D9C: PhotoAlbumPrintErrorHandler $EA $6B $C1
.else_4D9F_28:
    ldh  a, [hFrameCounter]                       ; $4D9F: PhotoAlbumPrintErrorHandler $F0 $E7
    inc  a                                        ; $4DA1: PhotoAlbumPrintErrorHandler $3C
    ldh  [hFrameCounter], a                       ; $4DA2: PhotoAlbumPrintErrorHandler $E0 $E7
    and  %00110000                                ; $4DA4: PhotoAlbumPrintErrorHandler $E6 $30
    jr   nz, .else_4DAD_28                        ; $4DA6: PhotoAlbumPrintErrorHandler $20 $05

    ld   a, JINGLE_WRONG_ANSWER                   ; $4DA8: PhotoAlbumPrintErrorHandler $3E $1D
    ldh  [hJingle], a                             ; $4DAA: PhotoAlbumPrintErrorHandler $E0 $F2
    ret                                           ; $4DAC: PhotoAlbumPrintErrorHandler $C9


.else_4DAD_28:
    ld   a, [wD1C5]                               ; $4DAD: PhotoAlbumPrintErrorHandler $FA $C5 $D1
    sla  a                                        ; $4DB0: PhotoAlbumPrintErrorHandler $CB $27
    add  LOW(Data_028_4D84)                       ; $4DB2: PhotoAlbumPrintErrorHandler $C6 $84
    ld   l, a                                     ; $4DB4: PhotoAlbumPrintErrorHandler $6F
    ld   a, HIGH(Data_028_4D84)                   ; $4DB5: PhotoAlbumPrintErrorHandler $3E $4D
    adc  $00                                      ; $4DB7: PhotoAlbumPrintErrorHandler $CE $00
    ld   h, a                                     ; $4DB9: PhotoAlbumPrintErrorHandler $67
    ld   e, [hl]                                  ; $4DBA: PhotoAlbumPrintErrorHandler $5E
    inc  hl                                       ; $4DBB: PhotoAlbumPrintErrorHandler $23
    ld   d, [hl]                                  ; $4DBC: PhotoAlbumPrintErrorHandler $56
    ld   hl, wram0Section                         ; $4DBD: PhotoAlbumPrintErrorHandler $21 $00 $C0
.func_028_4DC0::
    ld   a, [de]                                  ; $4DC0: PhotoAlbumPrintErrorHandler $1A
    cp   $FF                                      ; $4DC1: PhotoAlbumPrintErrorHandler $FE $FF
    ret  z                                        ; $4DC3: PhotoAlbumPrintErrorHandler $C8

    ldi  [hl], a                                  ; $4DC4: PhotoAlbumPrintErrorHandler $22
    inc  de                                       ; $4DC5: PhotoAlbumPrintErrorHandler $13
    ld   a, [de]                                  ; $4DC6: PhotoAlbumPrintErrorHandler $1A
    ldi  [hl], a                                  ; $4DC7: PhotoAlbumPrintErrorHandler $22
    inc  de                                       ; $4DC8: PhotoAlbumPrintErrorHandler $13
    ld   a, [de]                                  ; $4DC9: PhotoAlbumPrintErrorHandler $1A
    ldi  [hl], a                                  ; $4DCA: PhotoAlbumPrintErrorHandler $22
    inc  de                                       ; $4DCB: PhotoAlbumPrintErrorHandler $13
    ld   a, [de]                                  ; $4DCC: PhotoAlbumPrintErrorHandler $1A
    ldi  [hl], a                                  ; $4DCD: PhotoAlbumPrintErrorHandler $22
    inc  de                                       ; $4DCE: PhotoAlbumPrintErrorHandler $13
    jr   .func_028_4DC0                           ; $4DCF: PhotoAlbumPrintErrorHandler $18 $EF

; TODO: understand the purpose of these data blocks,
;       and move them to the relevant data/* directory.

; Animation data for the cutscenes that play when the mouse is setting the scene for the picture?

Data_028_4DD1::
; oam data
include "data/photo_album/print_animation.asm"

section "photo album graphics padding",romx[$5550],bank[BANK(@)]

PhotoDizzyLinkMap:
    include "data/photos_bg/dizzy_link.asm"

PhotoNiceLinkMap:
    include "data/photos_bg/nice_link.asm"

PhotoMarinCliffMap:
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

PhotoMarinWellMap:
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

PhotoMabeMap:
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

PhotoUlriraMap:
    include "data/photos_bg/ulrira.asm"

PhotoBowWowMap:
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

PhotoShopMap:
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

PhotoFishermanMap:
    include "data/photos_bg/fisherman.asm"

PhotoZoraMap:
    include "data/photos_bg/zora.asm"

PhotoKanaletMap:
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

PhotoGhostMap:
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

PhotoBridgeMap:
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
