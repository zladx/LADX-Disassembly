;
; Photo pictures code
;

PhotosEntryPoint::
    ld   a, [wGameplayType]                       ; $4000: $FA $95 $DB
    sub  $0E                                      ; $4003: $D6 $0E
    JP_TABLE                                      ; $4005: $C7
._0E dw LinkPictureHandler
._0F dw LinkPictureHandler
._10 dw MarinCliffPictureHandler
._11 dw $0000 ; Marin Well picture handler (disabled)
._12 dw MabePictureHandler
._13 dw UlriraPictureHandler
._14 dw BowWowPictureHandler
._15 dw $0000 ; Thief picture handler (disabled)
._16 dw FishermanPictureHandler
._17 dw ZoraPictureHandler
._18 dw KanaletPictureHandler
._19 dw GhostPictureHandler
._1A dw BridgePictureHandler

; Handler for Link's Picture
; (both nice and dizzy)
LinkPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $4020: $FA $96 $DB
    JP_TABLE                                      ; $4023: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_462F
    dw JumpTable_037_5393

MarinCliffPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $4032: $FA $96 $DB
    JP_TABLE                                      ; $4035: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE

    ; Plays the seagull/shore SFXs.
    dw JumpTable_037_4659
    dw JumpTable_037_5393

MabePictureHandler::
    ld   a, [wGameplaySubtype]                    ; $4046: $FA $96 $DB
    JP_TABLE                                      ; $4049: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4781
    dw JumpTable_037_5393

UlriraPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $405A: $FA $96 $DB
    JP_TABLE                                      ; $405D: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4AE8
    dw JumpTable_037_5393

BowWowPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $406E: $FA $96 $DB
    JP_TABLE                                      ; $4071: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4B05
    dw JumpTable_037_5393

FishermanPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $4080: $FA $96 $DB
    JP_TABLE                                      ; $4083: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4F5B
    dw JumpTable_037_5393

ZoraPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $4094: $FA $96 $DB
    JP_TABLE                                      ; $4097: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4F9B
    dw JumpTable_037_5393

KanaletPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $40A6: $FA $96 $DB
    JP_TABLE                                      ; $40A9: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_4FB7
    dw JumpTable_037_5393

GhostPictureHandler::
    ld   a, [wGameplaySubtype]                    ; $40BA: $FA $96 $DB
    JP_TABLE                                      ; $40BD: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_417F
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_51F4
    dw JumpTable_037_5393

BridgePictureHandler::
    ld   a, [wGameplaySubtype]                    ; $40CE: $FA $96 $DB
    JP_TABLE                                      ; $40D1: $C7
    dw JumpTable_037_40EC
    dw JumpTable_037_4185
    dw JumpTable_037_4229
    dw LoadPhotoBgMap_trampoline
    dw JumpTable_037_42FE
    dw JumpTable_037_535E
    dw JumpTable_037_5393

Data_037_40E0::
    db   $A2, $22, $FF, $46, $3F, $14, $FF, $46, $03, $7E, $FF, $46

JumpTable_037_40EC::
    ldh  a, [hFrameCounter]                       ; $40EC: $F0 $E7
    and  %00000001                                ; $40EE: $E6 $01
    jr   nz, .else_4108_37                        ; $40F0: $20 $16

    ld   hl, hVolumeRight                         ; $40F2: $21 $A9 $FF
    dec  [hl]                                     ; $40F5: $35
    ld   a, [hl]                                  ; $40F6: $7E
    bit  7, a                                     ; $40F7: $CB $7F
    jr   z, .else_40FC_37                         ; $40F9: $28 $01

    xor  a                                        ; $40FB: $AF
.else_40FC_37:
    ld   [hl], a                                  ; $40FC: $77
    ldh  a, [hVolumeLeft]                         ; $40FD: $F0 $AA
    sub  $10                                      ; $40FF: $D6 $10
    bit  7, a                                     ; $4101: $CB $7F
    jr   z, .else_4106_37                         ; $4103: $28 $01

    xor  a                                        ; $4105: $AF
.else_4106_37:
    ldh  [hVolumeLeft], a                         ; $4106: $E0 $AA
.else_4108_37:
    call func_1A22                                ; $4108: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $410B: $FA $6B $C1
    cp   $04                                      ; $410E: $FE $04
    ret  nz                                       ; $4110: $C0

    ld   a, $90                                   ; $4111: $3E $90
    ld   [wWindowY], a                            ; $4113: $EA $9A $DB
    ldh  a, [hIsGBC]                              ; $4116: $F0 $FE
    and  a                                        ; $4118: $A7
    jr   z, .else_4174_37                         ; $4119: $28 $59

    ld   hl, Data_037_570D                        ; $411B: $21 $0D $57
    ld   a, [wGameplayType]                       ; $411E: $FA $95 $DB
    sub  GAMEPLAY_PHOTO_DIZZY_LINK                ; $4121: $D6 $0E
    sla  a                                        ; $4123: $CB $27
    ld   e, a                                     ; $4125: $5F
    ld   d, $00                                   ; $4126: $16 $00
    add  hl, de                                   ; $4128: $19
    ld   a, [hl+]                                 ; $4129: $2A
    ld   h, [hl]                                  ; $412A: $66
    ld   l, a                                     ; $412B: $6F
    ld   de, wBGPal1                              ; $412C: $11 $10 $DC
    ld   bc, $80                                  ; $412F: $01 $80 $00
    ld   a, $02                                   ; $4132: $3E $02
    ldh  [rSVBK], a                               ; $4134: $E0 $70
    call CopyData                                 ; $4136: $CD $14 $29
    xor  a                                        ; $4139: $AF
    ldh  [rSVBK], a                               ; $413A: $E0 $70
    ld   a, [wTunicType]                          ; $413C: $FA $0F $DC
    sla  a                                        ; $413F: $CB $27
    sla  a                                        ; $4141: $CB $27
    ld   e, a                                     ; $4143: $5F
    ld   d, $00                                   ; $4144: $16 $00
    ld   hl, Data_037_40E0                        ; $4146: $21 $E0 $40
    add  hl, de                                   ; $4149: $19
    push hl                                       ; $414A: $E5
    ld   de, wObjPal1 + 2*2                       ; $414B: $11 $54 $DC
    ld   a, $02                                   ; $414E: $3E $02
    ld   [rSVBK], a                               ; $4150: $E0 $70
.loop_4152_37
    ld   a, [hl+]                                 ; $4152: $2A
    ld   [de], a                                  ; $4153: $12
    inc  de                                       ; $4154: $13
    ld   a, e                                     ; $4155: $7B
    and  %00000111                                ; $4156: $E6 $07
    jr   nz, .loop_4152_37                        ; $4158: $20 $F8

    xor  a                                        ; $415A: $AF
    ldh  [rSVBK], a                               ; $415B: $E0 $70
    pop  hl                                       ; $415D: $E1
    ld   a, [wGameplayType]                       ; $415E: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_MARIN_CLIFF               ; $4161: $FE $10
    jr   nz, .else_4174_37                        ; $4163: $20 $0F

    ld   de, wBGPal5 + 2*2                        ; $4165: $11 $34 $DC
    ld   a, $02                                   ; $4168: $3E $02
    ldh  [rSVBK], a                               ; $416A: $E0 $70
    ld   a, [hl+]                                 ; $416C: $2A
    ld   [de], a                                  ; $416D: $12
    inc  de                                       ; $416E: $13
    ld   a, [hl]                                  ; $416F: $7E
    ld   [de], a                                  ; $4170: $12
    xor  a                                        ; $4171: $AF
    ld   [rSVBK], a                               ; $4172: $E0 $70
.else_4174_37:
    xor  a                                        ; $4174: $AF
    ldh  [hBaseScrollX], a                        ; $4175: $E0 $96
    ldh  [hBaseScrollY], a                        ; $4177: $E0 $97
    ld   [wRoomTransitionState], a                ; $4179: $EA $24 $C1
    jp   IncrementGameplaySubtype_37              ; $417C: $C3 $FE $53

JumpTable_037_417F::
    call label_27F2                               ; $417F: $CD $F2 $27
    jp   IncrementGameplaySubtype_37              ; $4182: $C3 $FE $53

JumpTable_037_4185::
    call ClearLowerWRAM                           ; $4185: $CD $C6 $29
    jp   IncrementGameplaySubtype_37              ; $4188: $C3 $FE $53

func_037_418B::
    ld   h, $37                                   ; $418B: $26 $37
    ld   de, $08                                  ; $418D: $11 $08 $00
    ; fallthrough

func_037_4190::
    push af                                       ; $4190: $F5
.loop_4191_37
    pop  af                                       ; $4191: $F1
    push af                                       ; $4192: $F5
    push bc                                       ; $4193: $C5
    push de                                       ; $4194: $D5
    push hl                                       ; $4195: $E5
    call CopyDataToVRAM                           ; $4196: $CD $13 $0A
    pop  hl                                       ; $4199: $E1
    pop  de                                       ; $419A: $D1
    pop  bc                                       ; $419B: $C1
    pop  af                                       ; $419C: $F1
    push af                                       ; $419D: $F5
    inc  b                                        ; $419E: $04
    inc  c                                        ; $419F: $0C
    dec  de                                       ; $41A0: $1B
    ld   a, e                                     ; $41A1: $7B
    and  a                                        ; $41A2: $A7
    jr   nz, .loop_4191_37                        ; $41A3: $20 $EC

    pop  af                                       ; $41A5: $F1
    ret                                           ; $41A6: $C9

Data_037_41A7::
    db   $00, $00, $00, $00, $60, $3B, $00, $00, $40, $39, $00, $00, $70, $39, $00, $00
    db   $00, $00, $40, $2B, $60, $39, $68, $3A, $00, $00

Data_037_41C1::
    db   $70, $3B, $40, $29, $68, $3B, $00, $00, $48, $39, $40, $2A, $78, $39, $00, $00
    db   $70, $2A, $40, $2B, $68, $39, $60, $3A, $70, $2B

Data_037_41DB::
    db   $00, $00, $00, $00, $50, $3A, $00, $00, $40, $3A, $00, $00, $70, $3A, $00, $00
    db   $00, $00, $40, $2B, $50, $3B, $48, $3B, $00, $00

Data_037_41F5::
    db   $70, $3B, $40, $29, $58, $3A, $00, $00, $48, $3A, $40, $2A, $78, $3A, $00, $00
    db   $70, $2A, $40, $2B, $58, $3B, $40, $3B, $70, $2B

Data_037_420F::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00

Data_037_421C::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $00

JumpTable_037_4229::
    call LCDOff                                   ; $4229: $CD $CF $28
    ld   c, $00                                   ; $422C: $0E $00
    ld   a, [wGameplayType]                       ; $422E: $FA $95 $DB
    sub  GAMEPLAY_PHOTO_DIZZY_LINK                ; $4231: $D6 $0E
    sla  a                                        ; $4233: $CB $27
    ld   e, a                                     ; $4235: $5F
    ld   d, $00                                   ; $4236: $16 $00
    push de                                       ; $4238: $D5
    push de                                       ; $4239: $D5
    ld   hl, Data_037_41A7                        ; $423A: $21 $A7 $41
    ldh  a, [hIsGBC]                              ; $423D: $F0 $FE
    and  a                                        ; $423F: $A7
    jr   z, .else_4245_37                         ; $4240: $28 $03

    ld   hl, Data_037_41DB                        ; $4242: $21 $DB $41

.else_4245_37:
    add  hl, de                                   ; $4245: $19
    ld   b, [hl]                                  ; $4246: $46
    inc  hl                                       ; $4247: $23
    ld   a, [hl]                                  ; $4248: $7E
    and  a                                        ; $4249: $A7
    jr   z, .else_424F_37                         ; $424A: $28 $03

    call func_037_418B                            ; $424C: $CD $8B $41
.else_424F_37:
    pop  de                                       ; $424F: $D1
    ld   c, $10                                   ; $4250: $0E $10
    ld   hl, Data_037_41C1                        ; $4252: $21 $C1 $41
    ldh  a, [hIsGBC]                              ; $4255: $F0 $FE
    and  a                                        ; $4257: $A7
    jr   z, .else_425D_37                         ; $4258: $28 $03

    ld   hl, Data_037_41F5                        ; $425A: $21 $F5 $41

.else_425D_37:
    add  hl, de                                   ; $425D: $19
    ld   b, [hl]                                  ; $425E: $46
    inc  hl                                       ; $425F: $23
    ld   a, [hl]                                  ; $4260: $7E
    and  a                                        ; $4261: $A7
    jr   z, .else_4267_37                         ; $4262: $28 $03

    call func_037_418B                            ; $4264: $CD $8B $41
.else_4267_37:
    pop  de                                       ; $4267: $D1
    ld   a, [wGameplayType]                       ; $4268: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_GHOST                     ; $426B: $FE $19
    jr   nz, .else_4288_37                        ; $426D: $20 $19

    ldh  a, [hIsGBC]                              ; $426F: $F0 $FE
    and  a                                        ; $4271: $A7
    jr   nz, .else_427A_37                        ; $4272: $20 $06

    ld   a, $3A                                   ; $4274: $3E $3A
    ld   b, $68                                   ; $4276: $06 $68
    jr   .func_037_427E                           ; $4278: $18 $04

.else_427A_37:
    ld   a, $3B                                   ; $427A: $3E $3B
    ld   b, $48                                   ; $427C: $06 $48
.func_037_427E::
    ld   c, $08                                   ; $427E: $0E $08
    ld   h, $37                                   ; $4280: $26 $37
    ld   de, $04                                  ; $4282: $11 $04 $00
    call func_037_4190                            ; $4285: $CD $90 $41
.else_4288_37:
    ld   a, [wGameplayType]                       ; $4288: $FA $95 $DB
    sub  GAMEPLAY_PHOTO_DIZZY_LINK                ; $428B: $D6 $0E
    ld   e, a                                     ; $428D: $5F
    ld   d, $00                                   ; $428E: $16 $00
    ld   hl, Data_037_420F                        ; $4290: $21 $0F $42
    add  hl, de                                   ; $4293: $19
    ld   a, [hl]                                  ; $4294: $7E
    and  a                                        ; $4295: $A7
    jr   z, .else_42AB_37                         ; $4296: $28 $13

    ld   hl, Data_037_421C                        ; $4298: $21 $1C $42
    add  hl, de                                   ; $429B: $19
    ld   c, [hl]                                  ; $429C: $4E
    ld   h, $37                                   ; $429D: $26 $37
    ld   a, $38                                   ; $429F: $3E $38
    ld   b, $40                                   ; $42A1: $06 $40
    ld   de, $02                                  ; $42A3: $11 $02 $00
    call func_037_4190                            ; $42A6: $CD $90 $41
    jr   .else_42F4_37                            ; $42A9: $18 $49

.else_42AB_37:
    ld   c, $08                                   ; $42AB: $0E $08
    ld   de, $08                                  ; $42AD: $11 $08 $00
    ld   a, [wGameplayType]                       ; $42B0: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ZORA                      ; $42B3: $FE $17
    jr   nz, .else_42BD_37                        ; $42B5: $20 $06

    ld   a, $2B                                   ; $42B7: $3E $2B
    ld   b, $48                                   ; $42B9: $06 $48
    jr   .func_037_42ED                           ; $42BB: $18 $30

.else_42BD_37:
    cp   $16                                      ; $42BD: $FE $16
    jr   nz, .else_42C7_37                        ; $42BF: $20 $06

    ld   a, $2A                                   ; $42C1: $3E $2A
    ld   b, $78                                   ; $42C3: $06 $78
    jr   .func_037_42ED                           ; $42C5: $18 $26

.else_42C7_37:
    cp   $13                                      ; $42C7: $FE $13
    jr   nz, .else_42D1_37                        ; $42C9: $20 $06

    ld   a, $2A                                   ; $42CB: $3E $2A
    ld   b, $48                                   ; $42CD: $06 $48
    jr   .func_037_42ED                           ; $42CF: $18 $1C

.else_42D1_37:
    cp   $1A                                      ; $42D1: $FE $1A
    jr   nz, .else_42DB_37                        ; $42D3: $20 $06

    ld   a, $2B                                   ; $42D5: $3E $2B
    ld   b, $78                                   ; $42D7: $06 $78
    jr   .func_037_42ED                           ; $42D9: $18 $12

.else_42DB_37:
    cp   $0F                                      ; $42DB: $FE $0F
    jr   nz, .else_42E5_37                        ; $42DD: $20 $06

    ld   a, $29                                   ; $42DF: $3E $29
    ld   b, $48                                   ; $42E1: $06 $48
    jr   .func_037_42ED                           ; $42E3: $18 $08

.else_42E5_37:
    cp   $0E                                      ; $42E5: $FE $0E
    jr   nz, .else_42F4_37                        ; $42E7: $20 $0B

    ld   a, $3B                                   ; $42E9: $3E $3B
    ld   b, $78                                   ; $42EB: $06 $78
.func_037_42ED::
    ld   h, $37                                   ; $42ED: $26 $37
    call func_037_4190                            ; $42EF: $CD $90 $41
    jr   .else_42F4_37                            ; $42F2: $18 $00

.else_42F4_37:
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ; $42F4: $3E $C7
    ld   [wLCDControl], a                         ; $42F6: $EA $FD $D6
    ldh  [rLCDC], a                               ; $42F9: $E0 $40
    jp   IncrementGameplaySubtype_37              ; $42FB: $C3 $FE $53

JumpTable_037_42FE::
    ldh  a, [hFrameCounter]                       ; $42FE: $F0 $E7
    and  $01                                      ; $4300: $E6 $01
    jr   nz, .else_431B_37                        ; $4302: $20 $17

    ldh  a, [hVolumeRight]                        ; $4304: $F0 $A9
    inc  a                                        ; $4306: $3C
    cp   $07                                      ; $4307: $FE $07
    jr   c, .else_430D_37                         ; $4309: $38 $02

    ld   a, $07                                   ; $430B: $3E $07

.else_430D_37:
    ldh  [hVolumeRight], a                        ; $430D: $E0 $A9
    ldh  a, [hVolumeLeft]                         ; $430F: $F0 $AA
    add  $10                                      ; $4311: $C6 $10
    cp   $70                                      ; $4313: $FE $70
    jr   c, .else_4319_37                         ; $4315: $38 $02

    ld   a, $70                                   ; $4317: $3E $70

.else_4319_37:
    ldh  [hVolumeLeft], a                         ; $4319: $E0 $AA

.else_431B_37:
    xor  a                                        ; $431B: $AF
    ld   [wEntitiesPosXTable], a                  ; $431C: $EA $00 $C2
    call func_037_4351                            ; $431F: $CD $51 $43
    call func_037_4331                            ; $4322: $CD $31 $43
    call func_1A39                                ; $4325: $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $4328: $FA $6B $C1
    cp   $04                                      ; $432B: $FE $04
    ret  nz                                       ; $432D: $C0

    jp   IncrementGameplaySubtype_37              ; $432E: $C3 $FE $53

func_037_4331::
IF __PATCH_0__
    ld   a, $1c
    ld   [wEntitiesPosXTable], a
ENDC

    ld   a, [wGameplayType]                       ; $4331: $FA $95 $DB
    sub  $0E                                      ; $4334: $D6 $0E
    JP_TABLE                                      ; $4336: $C7
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_46A4
    dw $0000
    dw JumpTable_037_47C3
    dw JumpTable_037_4B1E.JumpTable_037_4B30
    dw JumpTable_037_4B1E
    dw $0000
    dw JumpTable_037_4F6F
    dw JumpTable_037_4FB6
    dw JumpTable_037_4FD0
    dw JumpTable_037_532E
    dw JumpTable_037_4B1E.JumpTable_037_4B30

func_037_4351::
    ld   a, [wGameplayType]                       ; $4351: $FA $95 $DB
    sub  $0E                                      ; $4354: $D6 $0E
    JP_TABLE                                      ; $4356: $C7
    dw JumpTable_037_4440
    dw JumpTable_037_4440
    dw JumpTable_037_4371
    dw $0000
    dw JumpTable_037_43A6
    dw JumpTable_037_4440
    dw JumpTable_037_440A
    dw $0000
    dw JumpTable_037_4440
    dw JumpTable_037_4440
    dw JumpTable_037_4441
    dw JumpTable_037_446C
    dw JumpTable_037_4440

JumpTable_037_4371::
    ld   a, $68                                   ; $4371: $3E $68
    ld   [wEntitiesPosXTable+2], a                ; $4373: $EA $02 $C2
    ld   a, $38                                   ; $4376: $3E $38
    ld   [wEntitiesPosXTable+3], a                ; $4378: $EA $03 $C2
    ldh  [hLinkPositionY], a                      ; $437B: $E0 $99
    ld   a, $58                                   ; $437D: $3E $58
    ld   [wEntitiesPosXTable+8], a                ; $437F: $EA $08 $C2
    ld   a, $40                                   ; $4382: $3E $40

.jr_4384
    ld   [wEntitiesPosXTable+9], a                ; $4384: $EA $09 $C2
    ld   hl, wEntitiesPosXSignTable+13            ; $4387: $21 $2D $C2
    ld   [hl], $10                                ; $438A: $36 $10
    ld   hl, wEntitiesSpeedXTable                 ; $438C: $21 $40 $C2
    ld   bc, $92C0                                ; $438F: $01 $C0 $92
    ld   [hl], c                                  ; $4392: $71
    inc  hl                                       ; $4393: $23
    ld   [hl], b                                  ; $4394: $70
    ld   hl, wEntitiesPosYSignTable+8             ; $4395: $21 $38 $C2
    ld   [hl], $70                                ; $4398: $36 $70
    inc  hl                                       ; $439A: $23
    ldh  a, [hIsGBC]                              ; $439B: $F0 $FE
    and  a                                        ; $439D: $A7
    jr   nz, .else_43A3_37                        ; $439E: $20 $03

    ld   [hl], $75                                ; $43A0: $36 $75
    ret                                           ; $43A2: $C9


.else_43A3_37:
    ld   [hl], $71                                ; $43A3: $36 $71
    ret                                           ; $43A5: $C9

JumpTable_037_43A6::
    call func_037_4A8E                            ; $43A6: $CD $8E $4A
    ld   a, $E0                                   ; $43A9: $3E $E0
    ld   [wEntitiesPosXTable+2], a                ; $43AB: $EA $02 $C2
    ld   a, $68                                   ; $43AE: $3E $68
    ld   [wEntitiesPosXTable+3], a                ; $43B0: $EA $03 $C2
    ld   a, $58                                   ; $43B3: $3E $58
    ld   [wEntitiesPosXTable+6], a                ; $43B5: $EA $06 $C2
    ld   a, $C8                                   ; $43B8: $3E $C8
    ld   [wEntitiesPosXTable+8], a                ; $43BA: $EA $08 $C2
    ld   a, $B0                                   ; $43BD: $3E $B0
    ld   [wEntitiesPosYTable+1], a                ; $43BF: $EA $11 $C2
    ld   hl, wEntitiesPosXSignTable+10            ; $43C2: $21 $2A $C2
    ld   [hl], $40                                ; $43C5: $36 $40
    inc  hl                                       ; $43C7: $23
    ld   [hl], $30                                ; $43C8: $36 $30
    inc  hl                                       ; $43CA: $23
    ld   [hl], $20                                ; $43CB: $36 $20
    ld   hl, wEntitiesPosYSignTable+10            ; $43CD: $21 $3A $C2
    ld   bc, vTiles2                              ; $43D0: $01 $00 $90
    ld   [hl], c                                  ; $43D3: $71
    inc  hl                                       ; $43D4: $23
    ld   [hl], b                                  ; $43D5: $70
    inc  hl                                       ; $43D6: $23
    ld   bc, $9500                                ; $43D7: $01 $00 $95
    ld   [hl], c                                  ; $43DA: $71
    inc  hl                                       ; $43DB: $23
    ld   [hl], b                                  ; $43DC: $70
    inc  hl                                       ; $43DD: $23
    ld   bc, $9530                                ; $43DE: $01 $30 $95
    ld   [hl], c                                  ; $43E1: $71
    inc  hl                                       ; $43E2: $23
    ld   [hl], b                                  ; $43E3: $70
    ld   hl, wEntitiesPosYSignTable+2             ; $43E4: $21 $32 $C2
    ldh  a, [hIsGBC]                              ; $43E7: $F0 $FE
    and  a                                        ; $43E9: $A7
    jr   nz, .else_43FB_37                        ; $43EA: $20 $0F

    xor  a                                        ; $43EC: $AF
    ld   [hl+], a                                 ; $43ED: $22
    ld   [hl], $74                                ; $43EE: $36 $74
    inc  hl                                       ; $43F0: $23
    ld   [hl+], a                                 ; $43F1: $22
    ld   [hl], $75                                ; $43F2: $36 $75
    inc  hl                                       ; $43F4: $23
    ld   [hl], $30                                ; $43F5: $36 $30
    inc  hl                                       ; $43F7: $23
    ld   [hl], $75                                ; $43F8: $36 $75
    ret                                           ; $43FA: $C9

.else_43FB_37:
    xor  a                                        ; $43FB: $AF
    ld   [hl+], a                                 ; $43FC: $22
    ld   [hl], $70                                ; $43FD: $36 $70
    inc  hl                                       ; $43FF: $23
    ld   [hl+], a                                 ; $4400: $22
    ld   [hl], $71                                ; $4401: $36 $71
    inc  hl                                       ; $4403: $23
    ld   [hl], $30                                ; $4404: $36 $30
    inc  hl                                       ; $4406: $23
    ld   [hl], $71                                ; $4407: $36 $71
    ret                                           ; $4409: $C9

JumpTable_037_440A::
    ld   a, $80                                   ; $440A: $3E $80
    ld   [wEntitiesPosXTable+2], a                ; $440C: $EA $02 $C2
    ld   a, $58                                   ; $440F: $3E $58
    ld   [wEntitiesPosXTable+3], a                ; $4411: $EA $03 $C2
    ld   a, $66                                   ; $4414: $3E $66
    ld   [wEntitiesPosXSignTable+3], a            ; $4416: $EA $23 $C2
    ld   e, $10                                   ; $4419: $1E $10
    ld   hl, wEntitiesSpeedYTable+1               ; $441B: $21 $51 $C2

.loop_441E_37
    ld   [hl+], a                                 ; $441E: $22
    dec  e                                        ; $441F: $1D
    jr   nz, .loop_441E_37                        ; $4420: $20 $FC

    ld   a, $70                                   ; $4422: $3E $70
    ld   [wEntitiesPosXSignTable+2], a            ; $4424: $EA $22 $C2
    ld   e, $10                                   ; $4427: $1E $10
    ld   hl, wEntitiesSpeedXAccTable+1            ; $4429: $21 $61 $C2

.loop_442C_37
    ld   [hl+], a                                 ; $442C: $22
    dec  e                                        ; $442D: $1D
    jr   nz, .loop_442C_37                        ; $442E: $20 $FC

    xor  a                                        ; $4430: $AF
    ld   [wEntitiesPosXSignTable+1], a            ; $4431: $EA $21 $C2
    ld   a, $20                                   ; $4434: $3E $20
    ld   [wEntitiesPosYTable+3], a                ; $4436: $EA $13 $C2
    call func_037_4B31                            ; $4439: $CD $31 $4B
    call func_037_4F37                            ; $443C: $CD $37 $4F
    ret                                           ; $443F: $C9

JumpTable_037_4440::
    ret                                           ; $4440: $C9

JumpTable_037_4441::
    ld   a, $D6                                   ; $4441: $3E $D6
    ld   [wEntitiesPosXTable+2], a                ; $4443: $EA $02 $C2
    ld   a, $8A                                   ; $4446: $3E $8A
    ld   [wEntitiesPosXTable+3], a                ; $4448: $EA $03 $C2
    ldh  [hLinkPositionY], a                      ; $444B: $E0 $99
    ld   a, $20                                   ; $444D: $3E $20
    ld   [wEntitiesPosXTable+6], a                ; $444F: $EA $06 $C2
    ld   a, $88                                   ; $4452: $3E $88
    ld   [wEntitiesPosYTable+6], a                ; $4454: $EA $16 $C2
    ld   a, $B6                                   ; $4457: $3E $B6
    ld   [wEntitiesPosYTable+7], a                ; $4459: $EA $17 $C2
    ld   a, $88                                   ; $445C: $3E $88
    ld   [wEntitiesPosYTable+8], a                ; $445E: $EA $18 $C2
    ld   a, $5A                                   ; $4461: $3E $5A
    ld   [wEntitiesPosYTable+12], a               ; $4463: $EA $1C $C2
    ld   a, $77                                   ; $4466: $3E $77
    ld   [wEntitiesPosYTable+13], a               ; $4468: $EA $1D $C2
    ret                                           ; $446B: $C9

JumpTable_037_446C::
    ld   a, $4C                                   ; $446C: $3E $4C
    ld   [wEntitiesPosXTable+2], a                ; $446E: $EA $02 $C2
    ld   a, $5A                                   ; $4471: $3E $5A
    ld   [wEntitiesPosXTable+3], a                ; $4473: $EA $03 $C2
    ldh  [hLinkPositionY], a                      ; $4476: $E0 $99
    ld   a, $B0                                   ; $4478: $3E $B0
    ld   [wEntitiesSpeedYTable], a                ; $447A: $EA $50 $C2
    ld   a, $66                                   ; $447D: $3E $66
    ld   [wEntitiesSpeedXTable+15], a             ; $447F: $EA $4F $C2
    ret                                           ; $4482: $C9

Data_037_4483::
    db   $00, $70, $40, $70, $80, $70, $00, $70, $40, $70, $80, $70, $00, $70, $40, $70
    db   $80, $70, $00, $70, $40, $70, $80, $70

Data_037_449B::
    db   $00, $71, $00, $72, $00, $73, $00, $71, $00, $72, $00, $73, $00, $71, $00, $72
    db   $00, $73, $00, $71, $00, $72, $00, $73

Data_037_44B3::
    db   $30, $71, $30, $72, $30, $73, $30, $71, $30, $72, $30, $73, $30, $71, $30, $72
    db   $30, $73, $30, $71, $30, $72, $30, $73

Data_037_44CB::
    db   $70, $71, $80, $71, $90, $71, $A0, $71, $70, $71, $80, $71, $90, $71, $A0, $71
    db   $70, $71, $80, $71, $90, $71, $A0, $71

Data_037_44E3::
    dw   Data_037_4483
    dw   Data_037_449B
    dw   Data_037_44B3
    dw   Data_037_44CB

Data_037_44EB::
    db   $20, $18, $10, $08

func_037_44EF::
    ld   bc, $00                                  ; $44EF: $01 $00 $00
.loop_44F2_37
    ld   hl, wEntitiesSpeedXTable+2               ; $44F2: $21 $42 $C2
    add  hl, bc                                   ; $44F5: $09
    ld   e, l                                     ; $44F6: $5D
    ld   d, h                                     ; $44F7: $54
    xor  a                                        ; $44F8: $AF
    ld   [de], a                                  ; $44F9: $12
    ld   hl, Data_037_44EB                        ; $44FA: $21 $EB $44
    add  hl, bc                                   ; $44FD: $09
    ld   a, [hl]                                  ; $44FE: $7E
    ld   hl, wEntitiesSpeedXTable+6               ; $44FF: $21 $46 $C2
    add  hl, bc                                   ; $4502: $09
    inc  [hl]                                     ; $4503: $34
    cp   [hl]                                     ; $4504: $BE
    jr   nc, .else_4543_37                        ; $4505: $30 $3C

    ld   a, [de]                                  ; $4507: $1A
    and  a                                        ; $4508: $A7
    jr   nz, .else_4543_37                        ; $4509: $20 $38

    ld   a, $39                                   ; $450B: $3E $39
    ld   [de], a                                  ; $450D: $12
    xor  a                                        ; $450E: $AF
    ld   [hl], a                                  ; $450F: $77
    ld   hl, wEntitiesSpeedXTable+10              ; $4510: $21 $4A $C2
    add  hl, bc                                   ; $4513: $09
    inc  [hl]                                     ; $4514: $34
    ld   a, [hl]                                  ; $4515: $7E
    cp   $0C                                      ; $4516: $FE $0C
    jr   nz, .else_451C_37                        ; $4518: $20 $02

    xor  a                                        ; $451A: $AF
    ld   [hl], a                                  ; $451B: $77

.else_451C_37:
    sla  a                                        ; $451C: $CB $27
    ld   e, a                                     ; $451E: $5F
    ld   d, $00                                   ; $451F: $16 $00
    push bc                                       ; $4521: $C5
    sla  c                                        ; $4522: $CB $21
    ld   hl, Data_037_44E3                        ; $4524: $21 $E3 $44
    add  hl, bc                                   ; $4527: $09
    ld   a, [hl+]                                 ; $4528: $2A
    ld   h, [hl]                                  ; $4529: $66
    ld   l, a                                     ; $452A: $6F
    add  hl, de                                   ; $452B: $19
    push hl                                       ; $452C: $E5
    ld   hl, wEntitiesPosYSignTable+2             ; $452D: $21 $32 $C2
    add  hl, bc                                   ; $4530: $09
    push hl                                       ; $4531: $E5
    pop  de                                       ; $4532: $D1
    pop  hl                                       ; $4533: $E1
    pop  bc                                       ; $4534: $C1
    ld   a, [hl+]                                 ; $4535: $2A
    ld   [de], a                                  ; $4536: $12
    inc  de                                       ; $4537: $13
    ld   a, [hl]                                  ; $4538: $7E
    ld   [de], a                                  ; $4539: $12
    ldh  a, [hIsGBC]                              ; $453A: $F0 $FE
    and  a                                        ; $453C: $A7
    jr   nz, .else_4543_37                        ; $453D: $20 $04

    ld   a, [de]                                  ; $453F: $1A
    add  $04                                      ; $4540: $C6 $04
    ld   [de], a                                  ; $4542: $12

.else_4543_37:
    inc  bc                                       ; $4543: $03
    ld   a, c                                     ; $4544: $79
    and  $03                                      ; $4545: $E6 $03
    jr   nz, .loop_44F2_37                        ; $4547: $20 $A9

    ret                                           ; $4549: $C9

Data_037_454A::
    db   $7F, $5B, $14, $2E, $4E, $19, $A9, $08

func_037_4552::
    ld   a, [wEntitiesPosYTable+4]                ; $4552: $FA $14 $C2
    and  a                                        ; $4555: $A7
    ret  z                                        ; $4556: $C8

    cp   $01                                      ; $4557: $FE $01
    jr   nz, .else_458A_37                        ; $4559: $20 $2F

    inc  a                                        ; $455B: $3C
    ld   [wEntitiesPosYTable+4], a                ; $455C: $EA $14 $C2
    ld   a, NOISE_SFX_PHOTO                       ; $455F: $3E $40
    ldh  [hNoiseSfx], a                           ; $4561: $E0 $F4
    ldh  a, [hIsGBC]                              ; $4563: $F0 $FE
    and  a                                        ; $4565: $A7
    jr   nz, .else_4570_37                        ; $4566: $20 $08

    ld   hl, wBGPalette                           ; $4568: $21 $97 $DB
    xor  a                                        ; $456B: $AF
    ld   [hl+], a                                 ; $456C: $22
    ld   [hl+], a                                 ; $456D: $22
    ld   [hl], a                                  ; $456E: $77
    ret                                           ; $456F: $C9

.else_4570_37:
    ld   hl, rSVBK                                ; $4570: $21 $70 $FF
    ld   de, wBGPal1                              ; $4573: $11 $10 $DC

.loop_4576_37
    ld   a, [de]                                  ; $4576: $1A
    ld   [hl], $03                                ; $4577: $36 $03
    ld   [de], a                                  ; $4579: $12
    xor  a                                        ; $457A: $AF
    ld   [hl], a                                  ; $457B: $77
    dec  a                                        ; $457C: $3D
    ld   [de], a                                  ; $457D: $12
    inc  de                                       ; $457E: $13
    ld   a, e                                     ; $457F: $7B
    cp   $90                                      ; $4580: $FE $90
    jr   nz, .loop_4576_37                        ; $4582: $20 $F2

    ld   a, $01                                   ; $4584: $3E $01
    ld   [wPaletteDataFlags], a                   ; $4586: $EA $D1 $DD
    ret                                           ; $4589: $C9

.else_458A_37:
    cp   $0F                                      ; $458A: $FE $0F
    jr   z, .else_4592_37                         ; $458C: $28 $04

    cp   $02                                      ; $458E: $FE $02
    jr   nz, .else_45B5_37                        ; $4590: $20 $23

.else_4592_37:
    inc  a                                        ; $4592: $3C
    and  %00001111                                ; $4593: $E6 $0F
    ld   [wEntitiesPosYTable+4], a                ; $4595: $EA $14 $C2
    ldh  a, [hIsGBC]                              ; $4598: $F0 $FE
    and  a                                        ; $459A: $A7
    jr   nz, .else_45AF_37                        ; $459B: $20 $12

    ld   a, [wEntitiesPosYTable+4]                ; $459D: $FA $14 $C2
    and  a                                        ; $45A0: $A7
    ret  nz                                       ; $45A1: $C0

    ld   hl, wBGPalette                           ; $45A2: $21 $97 $DB
    ld   a, $E4                                   ; $45A5: $3E $E4
    ld   [hl+], a                                 ; $45A7: $22
    ld   a, $1C                                   ; $45A8: $3E $1C
    ld   [hl+], a                                 ; $45AA: $22
    ld   a, $E4                                   ; $45AB: $3E $E4
    ld   [hl], a                                  ; $45AD: $77
    ret                                           ; $45AE: $C9

.else_45AF_37:
    ld   a, $02                                   ; $45AF: $3E $02
    ld   [wPaletteDataFlags], a                   ; $45B1: $EA $D1 $DD
    ret                                           ; $45B4: $C9

.else_45B5_37:
    cp   $0E                                      ; $45B5: $FE $0E
    jr   nz, .else_45D3_37                        ; $45B7: $20 $1A

    ld   hl, rSVBK                                ; $45B9: $21 $70 $FF
    ld   de, wBGPal1                              ; $45BC: $11 $10 $DC

.loop_45BF_37
    ld   [hl], $03                                ; $45BF: $36 $03
    ld   a, [de]                                  ; $45C1: $1A
    ld   [hl], $00                                ; $45C2: $36 $00
    ld   [de], a                                  ; $45C4: $12
    inc  de                                       ; $45C5: $13
    ld   a, e                                     ; $45C6: $7B
    cp   $90                                      ; $45C7: $FE $90
    jr   nz, .loop_45BF_37                        ; $45C9: $20 $F4

    ld   a, $01                                   ; $45CB: $3E $01
    ld   [wPaletteDataFlags], a                   ; $45CD: $EA $D1 $DD
    ld   a, [wEntitiesPosYTable+4]                ; $45D0: $FA $14 $C2

.else_45D3_37:
    inc  a                                        ; $45D3: $3C
    ld   [wEntitiesPosYTable+4], a                ; $45D4: $EA $14 $C2
    cp   $04                                      ; $45D7: $FE $04
    ret  nz                                       ; $45D9: $C0

    ld   a, [wGameplayType]                       ; $45DA: $FA $95 $DB
    sub  $0E                                      ; $45DD: $D6 $0E
    sla  a                                        ; $45DF: $CB $27
    sla  a                                        ; $45E1: $CB $27
    ld   e, a                                     ; $45E3: $5F
    ld   d, $00                                   ; $45E4: $16 $00
    ld   hl, Data_037_5727                        ; $45E6: $21 $27 $57
    add  hl, de                                   ; $45E9: $19
    ld   a, [hl]                                  ; $45EA: $7E
    and  a                                        ; $45EB: $A7
    ret  z                                        ; $45EC: $C8

    push hl                                       ; $45ED: $E5
    push hl                                       ; $45EE: $E5
    call LCDOff                                   ; $45EF: $CD $CF $28
    pop  hl                                       ; $45F2: $E1
    ld   c, [hl]                                  ; $45F3: $4E
    inc  hl                                       ; $45F4: $23
    ld   b, [hl]                                  ; $45F5: $46
    inc  hl                                       ; $45F6: $23
    ld   a, [hl]                                  ; $45F7: $7E
    call func_037_418B                            ; $45F8: $CD $8B $41
    pop  hl                                       ; $45FB: $E1
    ld   a, [hl+]                                 ; $45FC: $2A
    add  $08                                      ; $45FD: $C6 $08
    ld   c, a                                     ; $45FF: $4F
    ld   a, [hl+]                                 ; $4600: $2A
    sub  $08                                      ; $4601: $D6 $08
    ld   b, a                                     ; $4603: $47
    ld   a, [hl]                                  ; $4604: $7E
    call func_037_418B                            ; $4605: $CD $8B $41
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_BGON ; $4608: $3E $E5
    ld   [wLCDControl], a                         ; $460A: $EA $FD $D6
    ldh  [rLCDC], a                               ; $460D: $E0 $40
    xor  a                                        ; $460F: $AF
    ld   [wWindowY], a                            ; $4610: $EA $9A $DB
    ldh  a, [hIsGBC]                              ; $4613: $F0 $FE
    and  a                                        ; $4615: $A7
    ret  z                                        ; $4616: $C8

    di                                            ; $4617: $F3
    ld   a, $03                                   ; $4618: $3E $03
    ldh  [rSVBK], a                               ; $461A: $E0 $70
    ld   de, wBGPal1                              ; $461C: $11 $10 $DC
    ld   hl, Data_037_454A                        ; $461F: $21 $4A $45

.loop_4622_37
    ld   a, [hl+]                                 ; $4622: $2A
    ld   [de], a                                  ; $4623: $12
    inc  de                                       ; $4624: $13
    ld   a, e                                     ; $4625: $7B
    and  GAMEPLAY_WORLD_MAP                       ; $4626: $E6 $07
    jr   nz, .loop_4622_37                        ; $4628: $20 $F8

    xor  a                                        ; $462A: $AF
    ldh  [rSVBK], a                               ; $462B: $E0 $70
    ei                                            ; $462D: $FB
    ret                                           ; $462E: $C9

JumpTable_037_462F::
    ld   hl, wEntitiesPosYTable+3                 ; $462F: $21 $13 $C2
    inc  [hl]                                     ; $4632: $34
    ld   a, [hl]                                  ; $4633: $7E
    cp   $50                                      ; $4634: $FE $50
    ret  nz                                       ; $4636: $C0

    xor  a                                        ; $4637: $AF
    ld   [wC16C], a                               ; $4638: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $463B: $EA $6B $C1
    ld   a, [wPhotos1]                            ; $463E: $FA $0C $DC
    or   $01                                      ; $4641: $F6 $01
    ld   [wPhotos1], a                            ; $4643: $EA $0C $DC
    ld   a, [wGameplayType]                       ; $4646: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_DIZZY_LINK                ; $4649: $FE $0E
    jr   nz, .else_4655_37                        ; $464B: $20 $08

    ld   a, [wPhotos2]                            ; $464D: $FA $0D $DC
    or   $80                                      ; $4650: $F6 $80
    ld   [wPhotos2], a                            ; $4652: $EA $0D $DC

.else_4655_37:
    call IncrementGameplaySubtype_37              ; $4655: $CD $FE $53
    ret                                           ; $4658: $C9

; Marin and Link cliffside photo animation.
JumpTable_037_4659::
    call func_037_44EF                            ; $4659: $CD $EF $44
    ld   hl, wEntitiesSpeedXTable+2               ; $465C: $21 $42 $C2
    xor  a                                        ; $465F: $AF
    ld   [hl+], a                                 ; $4660: $22
    ld   [hl+], a                                 ; $4661: $22
    ld   [hl], a                                  ; $4662: $77
    ld   a, $1C                                   ; $4663: $3E $1C
    ld   [wEntitiesPosXTable], a                  ; $4665: $EA $00 $C2
    call JumpTable_037_46A4                       ; $4668: $CD $A4 $46
    call func_037_46AF                            ; $466B: $CD $AF $46
    call func_037_4552                            ; $466E: $CD $52 $45
    ld   a, [wNoiseSfxSeaWavesCounter]            ; $4671: $FA $14 $C1
    inc  a                                        ; $4674: $3C
    cp   $A0                                      ; $4675: $FE $A0
    jr   nz, .else_467E_37                        ; $4677: $20 $05

    ld   a, NOISE_SFX_SEA_WAVES                   ; $4679: $3E $0F
    ldh  [hNoiseSfx], a                           ; $467B: $E0 $F4
    xor  a                                        ; $467D: $AF

.else_467E_37:
    ld   [wNoiseSfxSeaWavesCounter], a            ; $467E: $EA $14 $C1
    ld   a, [wD466]                               ; $4681: $FA $66 $D4
    and  a                                        ; $4684: $A7
    jr   nz, .else_4695_37                        ; $4685: $20 $0E

    ld   a, JINGLE_SEAGULL                        ; $4687: $3E $21
    ldh  [hJingle], a                             ; $4689: $E0 $F2
    call GetRandomByte                            ; $468B: $CD $0D $28
    and  %01111111                                ; $468E: $E6 $7F
    add  $60                                      ; $4690: $C6 $60
    ld   [wD466], a                               ; $4692: $EA $66 $D4

.else_4695_37:
    dec  a                                        ; $4695: $3D
    ld   [wD466], a                               ; $4696: $EA $66 $D4
    ld   a, $37                                   ; $4699: $3E $37
    call func_A9B                                 ; $469B: $CD $9B $0A
    ld   a, $37                                   ; $469E: $3E $37
    call SwitchBank                               ; $46A0: $CD $0C $08
    ret                                           ; $46A3: $C9

JumpTable_037_46A4::
    call func_037_4779                            ; $46A4: $CD $79 $47
    call func_037_4771                            ; $46A7: $CD $71 $47
    ret                                           ; $46AA: $C9

Data_037_46AB::
    db   $08, $12, $08, $12

func_037_46AF::
    ld   hl, wEntitiesPosXTable+10                ; $46AF: $21 $0A $C2
IF __PATCH_0__
    ld   a, [hl]
    and  a
    jr   z, .jr_037_46be
    dec  [hl]
    jr   .else_46D7_37
ELSE
    dec  [hl]                                     ; $46B2: $35
    ld   a, [hl]                                  ; $46B3: $7E
    and  a                                        ; $46B4: $A7
    jr   nz, .else_46D7_37                        ; $46B5: $20 $20
ENDC

.jr_037_46be
    push hl                                       ; $46B7: $E5
    call GetRandomByte                            ; $46B8: $CD $0D $28
    and  %00000011                                ; $46BB: $E6 $03
    ld   e, a                                     ; $46BD: $5F
    ld   d, $00                                   ; $46BE: $16 $00
    ld   hl, Data_037_46AB                        ; $46C0: $21 $AB $46
    add  hl, de                                   ; $46C3: $19
    ld   a, [hl]                                  ; $46C4: $7E
    pop  hl                                       ; $46C5: $E1
    ld   [hl], a                                  ; $46C6: $77
    ld   a, [wEntitiesPosXTable+7]                ; $46C7: $FA $07 $C2
    xor  $01                                      ; $46CA: $EE $01
    ld   [wEntitiesPosXTable+7], a                ; $46CC: $EA $07 $C2
    ld   a, [wEntitiesPosXTable+1]                ; $46CF: $FA $01 $C2
    xor  $01                                      ; $46D2: $EE $01
    ld   [wEntitiesPosXTable+1], a                ; $46D4: $EA $01 $C2

.else_46D7_37:
    ld   a, [wDialogState]                        ; $46D7: $FA $9F $C1
    and  a                                        ; $46DA: $A7
    ret  nz                                       ; $46DB: $C0

    ld   a, [wEntitiesPosXTable+11]               ; $46DC: $FA $0B $C2
    JP_TABLE                                      ; $46DF: $C7
    dw JumpTable_037_46F6
    dw JumpTable_037_470A
    dw JumpTable_037_470E
    dw JumpTable_037_470A
    dw JumpTable_037_4712
    dw JumpTable_037_470A
    dw JumpTable_037_4716
    dw JumpTable_037_4724
    dw JumpTable_037_473B
    dw JumpTable_037_4753
    dw JumpTable_037_49CD

JumpTable_037_46F6::
    ld   hl, wEntitiesPosYTable+3                 ; $46F6: $21 $13 $C2
    inc  [hl]                                     ; $46F9: $34
    ld   a, [hl]                                  ; $46FA: $7E
    cp   $20                                      ; $46FB: $FE $20
    ret  nz                                       ; $46FD: $C0

    xor  a                                        ; $46FE: $AF
    ld   [hl], a                                  ; $46FF: $77
    ld   a, $55                                   ; $4700: $3E $55

PhotosOpenDialogAndIncrementXPos::
    call OpenDialogInTable2                       ; $4702: $CD $7C $23

func_037_4705::
    ld   hl, wEntitiesPosXTable+11                ; $4705: $21 $0B $C2
    inc  [hl]                                     ; $4708: $34
    ret                                           ; $4709: $C9

JumpTable_037_470A::
    ld_dialog_low a, Dialog256                    ; $470A: $3E $56
    jr   PhotosOpenDialogAndIncrementXPos         ; $470C: $18 $F4

JumpTable_037_470E::
    ld_dialog_low a, Dialog257                    ; $470E: $3E $57
    jr   PhotosOpenDialogAndIncrementXPos         ; $4710: $18 $F0

JumpTable_037_4712::
    ld_dialog_low a, Dialog258                    ; $4712: $3E $58
    jr   PhotosOpenDialogAndIncrementXPos         ; $4714: $18 $EC

JumpTable_037_4716::
    ld   hl, wEntitiesPosYTable+3                 ; $4716: $21 $13 $C2
    inc  [hl]                                     ; $4719: $34
    ld   a, [hl]                                  ; $471A: $7E
    cp   $50                                      ; $471B: $FE $50
    ret  nz                                       ; $471D: $C0

    xor  a                                        ; $471E: $AF
    ld   [hl], a                                  ; $471F: $77
    ld_dialog_low a, Dialog259                    ; $4720: $3E $59
    jr   PhotosOpenDialogAndIncrementXPos         ; $4722: $18 $DE

JumpTable_037_4724::
    ld   hl, wEntitiesPosYTable+3                 ; $4724: $21 $13 $C2
    inc  [hl]                                     ; $4727: $34
    ld   a, [hl]                                  ; $4728: $7E
    cp   $20                                      ; $4729: $FE $20
    ret  nz                                       ; $472B: $C0

    xor  a                                        ; $472C: $AF
    ld   [hl], a                                  ; $472D: $77
    ld   hl, wEntitiesPosYTable+4                 ; $472E: $21 $14 $C2
    inc  [hl]                                     ; $4731: $34
    ld   a, $60                                   ; $4732: $3E $60
    ld   [wEntitiesPosYTable+3], a                ; $4734: $EA $13 $C2
    call func_037_4705                            ; $4737: $CD $05 $47
    ret                                           ; $473A: $C9

JumpTable_037_473B::
    ld   a, [wEntitiesPosYTable+4]                ; $473B: $FA $14 $C2
    and  a                                        ; $473E: $A7
    ret  nz                                       ; $473F: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4740: $21 $13 $C2
    dec  [hl]                                     ; $4743: $35
    ld   a, [hl]                                  ; $4744: $7E
    bit  7, a                                     ; $4745: $CB $7F
    ret  z                                        ; $4747: $C8

    xor  a                                        ; $4748: $AF
    ld   [hl], a                                  ; $4749: $77
    call_open_dialog Dialog10B                    ; $474A
    call func_037_4705                            ; $474F: $CD $05 $47
    ret                                           ; $4752: $C9

JumpTable_037_4753::
    ld   hl, wEntitiesPosYTable+3                 ; $4753: $21 $13 $C2
    inc  [hl]                                     ; $4756: $34
    ld   a, [hl]                                  ; $4757: $7E
    cp   $30                                      ; $4758: $FE $30
    ret  nz                                       ; $475A: $C0

    ld   a, [wPhotos1]                            ; $475B: $FA $0C $DC
    or   $02                                      ; $475E: $F6 $02
    ld   [wPhotos1], a                            ; $4760: $EA $0C $DC
    call func_037_4705                            ; $4763: $CD $05 $47
    xor  a                                        ; $4766: $AF
    ld   [wC16C], a                               ; $4767: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $476A: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $476D: $CD $FE $53
    ret                                           ; $4770: $C9

func_037_4771::
    ld   c, $18                                   ; $4771: $0E $18
    ld   hl, Data_037_5A8B                        ; $4773: $21 $8B $5A
    jp   func_037_4A45                            ; $4776: $C3 $45 $4A

func_037_4779::
    ld   hl, Data_037_57E2                        ; $4779: $21 $E2 $57
    ld   c, $10                                   ; $477C: $0E $10
    jp   func_037_49E1                            ; $477E: $C3 $E1 $49

JumpTable_037_4781::
    call func_037_44EF                            ; $4781: $CD $EF $44
    ld   hl, wEntitiesSpeedXTable+5               ; $4784: $21 $45 $C2
    ld   [hl], $00                                ; $4787: $36 $00
    ld   a, $1C                                   ; $4789: $3E $1C
    ld   [wEntitiesPosXTable], a                  ; $478B: $EA $00 $C2
    ld   a, [wEntitiesPosXTable+14]               ; $478E: $FA $0E $C2
    cp   $04                                      ; $4791: $FE $04
    jr   nc, .else_47A3_37                        ; $4793: $30 $0E

    call func_037_4A37                            ; $4795: $CD $37 $4A
    call func_037_49D3                            ; $4798: $CD $D3 $49
    call func_037_4972                            ; $479B: $CD $72 $49
    call func_037_4A8E                            ; $479E: $CD $8E $4A
    jr   .func_037_47A6                           ; $47A1: $18 $03

.else_47A3_37:
    call JumpTable_037_47C3                       ; $47A3: $CD $C3 $47
.func_037_47A6::
    call func_037_47D0                            ; $47A6: $CD $D0 $47
    call func_037_4994                            ; $47A9: $CD $94 $49
    call func_037_49FB                            ; $47AC: $CD $FB $49
    call func_037_4552                            ; $47AF: $CD $52 $45
    ld   a, [wEntitiesPosXTable]                  ; $47B2: $FA $00 $C2
    call func_015_7964_trampoline                 ; $47B5: $CD $A0 $3D
    ld   a, $37                                   ; $47B8: $3E $37
    call func_A9B                                 ; $47BA: $CD $9B $0A
    ld   a, $37                                   ; $47BD: $3E $37
    call SwitchBank                               ; $47BF: $CD $0C $08
    ret                                           ; $47C2: $C9

JumpTable_037_47C3::
    call func_037_4972                            ; $47C3: $CD $72 $49
    call func_037_4A37                            ; $47C6: $CD $37 $4A
    call func_037_49D3                            ; $47C9: $CD $D3 $49
    call func_037_4A8E                            ; $47CC: $CD $8E $4A
    ret                                           ; $47CF: $C9

func_037_47D0::
    ld   a, [wEntitiesPosXTable+14]               ; $47D0: $FA $0E $C2
    JP_TABLE                                      ; $47D3: $C7
    dw JumpTable_037_47E9
    dw JumpTable_037_4829
    dw JumpTable_037_4834
    dw JumpTable_037_485E
    dw JumpTable_037_4884
    dw JumpTable_037_48A0
    dw JumpTable_037_48B8
    dw JumpTable_037_48CB

func_037_47E4::
    ld   hl, wEntitiesPosXTable+14                ; $47E4: $21 $0E $C2
    inc  [hl]                                     ; $47E7: $34
    ret                                           ; $47E8: $C9

JumpTable_037_47E9::
    ld   a, $68                                   ; $47E9: $3E $68
    ld   [wEntitiesPosYTable+2], a                ; $47EB: $EA $12 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $47EE: $FA $02 $C2
    bit  7, a                                     ; $47F1: $CB $7F
    ret  nz                                       ; $47F3: $C0

    cp   $58                                      ; $47F4: $FE $58
    ret  c                                        ; $47F6: $D8

    ld   hl, wEntitiesPosXTable+15                ; $47F7: $21 $0F $C2
    inc  [hl]                                     ; $47FA: $34
    ld   a, [hl]                                  ; $47FB: $7E
    cp   $0A                                      ; $47FC: $FE $0A
    ret  c                                        ; $47FE: $D8

    xor  a                                        ; $47FF: $AF
    ld   [hl], a                                  ; $4800: $77
    ld   a, [wEntitiesPosYTable]                  ; $4801: $FA $10 $C2
    inc  a                                        ; $4804: $3C
    and  $03                                      ; $4805: $E6 $03
    ld   [wEntitiesPosYTable], a                  ; $4807: $EA $10 $C2
    ld   a, [wEntitiesPosYTable+1]                ; $480A: $FA $11 $C2
    sub  $04                                      ; $480D: $D6 $04
    bit  7, a                                     ; $480F: $CB $7F
    jr   nz, .else_4825_37                        ; $4811: $20 $12

    cp   $88                                      ; $4813: $FE $88
    jr   nc, .else_4825_37                        ; $4815: $30 $0E

    xor  a                                        ; $4817: $AF
    ld   [wEntitiesPosYTable], a                  ; $4818: $EA $10 $C2
    ld   a, $3D                                   ; $481B: $3E $3D
    call OpenDialogInTable2                       ; $481D: $CD $7C $23
    call func_037_47E4                            ; $4820: $CD $E4 $47
    ld   a, $80                                   ; $4823: $3E $80

.else_4825_37:
    ld   [wEntitiesPosYTable+1], a                ; $4825: $EA $11 $C2
    ret                                           ; $4828: $C9

JumpTable_037_4829::
    ld   a, [wDialogState]                        ; $4829: $FA $9F $C1
    and  a                                        ; $482C: $A7
    ret  nz                                       ; $482D: $C0

    xor  a                                        ; $482E: $AF
    ld   [wEntitiesPosYTable], a                  ; $482F: $EA $10 $C2
    jr   func_037_47E4                            ; $4832: $18 $B0

JumpTable_037_4834::
    ld   hl, wEntitiesPosXTable+15                ; $4834: $21 $0F $C2
    inc  [hl]                                     ; $4837: $34
    ld   a, [hl]                                  ; $4838: $7E
    cp   $05                                      ; $4839: $FE $05
    ret  c                                        ; $483B: $D8

    xor  a                                        ; $483C: $AF
    ld   [hl], a                                  ; $483D: $77
    ld   a, [wEntitiesPosYTable]                  ; $483E: $FA $10 $C2
    inc  a                                        ; $4841: $3C
    and  $03                                      ; $4842: $E6 $03
    ld   [wEntitiesPosYTable], a                  ; $4844: $EA $10 $C2
    ld   a, [wEntitiesPosYTable+1]                ; $4847: $FA $11 $C2
    sub  $04                                      ; $484A: $D6 $04
    cp   $54                                      ; $484C: $FE $54
    jr   nc, .else_485A_37                        ; $484E: $30 $0A

    call func_037_47E4                            ; $4850: $CD $E4 $47
    ld   a, $04                                   ; $4853: $3E $04
    ld   [wEntitiesPosYTable], a                  ; $4855: $EA $10 $C2
    ld   a, $51                                   ; $4858: $3E $51

.else_485A_37:
    ld   [wEntitiesPosYTable+1], a                ; $485A: $EA $11 $C2
    ret                                           ; $485D: $C9

JumpTable_037_485E::
    ld   a, [wEntitiesPosXTable+2]                ; $485E: $FA $02 $C2
    cp   $60                                      ; $4861: $FE $60
    jr   nc, .else_486A_37                        ; $4863: $30 $05

    inc  a                                        ; $4865: $3C
    ld   [wEntitiesPosXTable+2], a                ; $4866: $EA $02 $C2
    ret                                           ; $4869: $C9

.else_486A_37:
    ld   a, [wEntitiesPosXTable+8]                ; $486A: $FA $08 $C2
    cp   $3F                                      ; $486D: $FE $3F
    jr   c, .else_4876_37                         ; $486F: $38 $05

    dec  a                                        ; $4871: $3D
    ld   [wEntitiesPosXTable+8], a                ; $4872: $EA $08 $C2
    ret                                           ; $4875: $C9

.else_4876_37:
    call_open_dialog Dialog23E                      ; $4876
    ld   a, $10                                   ; $487B: $3E $10
    ld   [wEntitiesPosYTable+3], a                ; $487D: $EA $13 $C2
    call func_037_47E4                            ; $4880: $CD $E4 $47
    ret                                           ; $4883: $C9

JumpTable_037_4884::
    ld   a, [wDialogState]                        ; $4884: $FA $9F $C1
    and  a                                        ; $4887: $A7
    ret  nz                                       ; $4888: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4889: $21 $13 $C2
    dec  [hl]                                     ; $488C: $35
    ld   a, [hl]                                  ; $488D: $7E
    bit  7, a                                     ; $488E: $CB $7F
    ret  z                                        ; $4890: $C8

    xor  a                                        ; $4891: $AF
    ld   [hl], a                                  ; $4892: $77
    ld   hl, wEntitiesPosYTable+4                 ; $4893: $21 $14 $C2
    inc  [hl]                                     ; $4896: $34
    ld   a, $20                                   ; $4897: $3E $20
    ld   [wEntitiesPosYTable+3], a                ; $4899: $EA $13 $C2
    call func_037_47E4                            ; $489C: $CD $E4 $47
    ret                                           ; $489F: $C9

JumpTable_037_48A0::
    ld   a, [wEntitiesPosYTable+4]                ; $48A0: $FA $14 $C2
    and  a                                        ; $48A3: $A7
    ret  nz                                       ; $48A4: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $48A5: $21 $13 $C2
    dec  [hl]                                     ; $48A8: $35
    ld   a, [hl]                                  ; $48A9: $7E
    bit  7, a                                     ; $48AA: $CB $7F
    ret  z                                        ; $48AC: $C8

    xor  a                                        ; $48AD: $AF
    ld   [hl], a                                  ; $48AE: $77
    call_open_dialog Dialog23F                      ; $48AF
    call func_037_47E4                            ; $48B4: $CD $E4 $47
    ret                                           ; $48B7: $C9

JumpTable_037_48B8::
    ld   a, [wDialogState]                        ; $48B8: $FA $9F $C1
    and  a                                        ; $48BB: $A7
    ret  nz                                       ; $48BC: $C0

    xor  a                                        ; $48BD: $AF
    ld   [wEntitiesPosYTable], a                  ; $48BE: $EA $10 $C2
    ld   [wC16C], a                               ; $48C1: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $48C4: $EA $6B $C1
    call func_037_47E4                            ; $48C7: $CD $E4 $47
    ret                                           ; $48CA: $C9

JumpTable_037_48CB::
    ld   a, [wEntitiesPosYTable+1]                ; $48CB: $FA $11 $C2
    cp   $28                                      ; $48CE: $FE $28
    jr   nc, .else_48E7_37                        ; $48D0: $30 $15

    call func_1A22                                ; $48D2: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $48D5: $FA $6B $C1
    cp   $04                                      ; $48D8: $FE $04
    jr   nz, .else_48E7_37                        ; $48DA: $20 $0B

    call IncrementGameplaySubtype_37              ; $48DC: $CD $FE $53
    ld   a, [wPhotos1]                            ; $48DF: $FA $0C $DC
    or   $08                                      ; $48E2: $F6 $08
    ld   [wPhotos1], a                            ; $48E4: $EA $0C $DC

.else_48E7_37:
    ld   hl, wEntitiesPosXTable+15                ; $48E7: $21 $0F $C2
    inc  [hl]                                     ; $48EA: $34
    ld   a, [hl]                                  ; $48EB: $7E
    cp   $0A                                      ; $48EC: $FE $0A
    ret  c                                        ; $48EE: $D8

    xor  a                                        ; $48EF: $AF
    ld   [hl], a                                  ; $48F0: $77
    ld   a, [wEntitiesPosYTable]                  ; $48F1: $FA $10 $C2
    inc  a                                        ; $48F4: $3C
    and  $03                                      ; $48F5: $E6 $03
    ld   [wEntitiesPosYTable], a                  ; $48F7: $EA $10 $C2
    ld   a, [wEntitiesPosYTable+1]                ; $48FA: $FA $11 $C2
    sub  $04                                      ; $48FD: $D6 $04
    ld   [wEntitiesPosYTable+1], a                ; $48FF: $EA $11 $C2
    ret                                           ; $4902: $C9

Data_037_4903::
    db   $00, $00, $6C, $06, $00, $08, $6E, $06, $00, $10, $76, $06, $10, $00, $78, $06
    db   $10, $08, $7A, $06, $10, $10, $7C, $06

Data_037_491B::
    db   $F8, $00, $4C, $06, $F8, $08, $4E, $06, $F8, $10, $50, $06, $08, $00, $52, $06
    db   $08, $08, $54, $06, $08, $10, $56, $06

Data_037_4933::
    db   $F8, $00, $4C, $06, $F8, $08, $4E, $06, $F8, $10, $50, $06, $08, $00, $58, $06
    db   $08, $08, $5A, $06, $08, $10, $6A, $06

Data_037_494B::
    db   $00, $00, $40, $06, $00, $08, $42, $06, $00, $10, $44, $06, $10, $00, $46, $06
    db   $10, $08, $48, $06, $10, $10, $4A, $06

Data_037_4963::
    dw   Data_037_4903
    dw   Data_037_491B
    dw   Data_037_4903
    dw   Data_037_4933
    dw   Data_037_494B

Data_037_496D::
    db   $18, $18, $18, $18, $18

func_037_4972::
    ld   hl, Data_037_496D                        ; $4972: $21 $6D $49
    ld   a, [wEntitiesPosYTable]                  ; $4975: $FA $10 $C2
    ld   e, a                                     ; $4978: $5F
    ld   d, $00                                   ; $4979: $16 $00
    add  hl, de                                   ; $497B: $19
    ld   c, [hl]                                  ; $497C: $4E
    sla  e                                        ; $497D: $CB $23
    ld   hl, Data_037_4963                        ; $497F: $21 $63 $49
    add  hl, de                                   ; $4982: $19
    ld   a, [hl+]                                 ; $4983: $2A
    ld   h, [hl]                                  ; $4984: $66
    ld   l, a                                     ; $4985: $6F
    ld   a, [wEntitiesPosYTable+2]                ; $4986: $FA $12 $C2
    ldh  [hMultiPurpose0], a                      ; $4989: $E0 $D7
    ld   a, [wEntitiesPosYTable+1]                ; $498B: $FA $11 $C2
    ldh  [hMultiPurpose1], a                      ; $498E: $E0 $D8
    call func_037_4AB8                            ; $4990: $CD $B8 $4A
    ret                                           ; $4993: $C9

func_037_4994::
    ld   a, [wEntitiesPosXTable+5]                ; $4994: $FA $05 $C2
    JP_TABLE                                      ; $4997: $C7
    dw JumpTable_037_499C
    dw JumpTable_037_49CD

JumpTable_037_499C::
    ld   hl, wEntitiesPosXTable+4                 ; $499C: $21 $04 $C2
    inc  [hl]                                     ; $499F: $34
    ld   a, [hl]                                  ; $49A0: $7E
    cp   $0A                                      ; $49A1: $FE $0A
    ret  c                                        ; $49A3: $D8

    xor  a                                        ; $49A4: $AF
    ld   [hl], a                                  ; $49A5: $77
    ld   a, [wEntitiesPosXTable+1]                ; $49A6: $FA $01 $C2
    inc  a                                        ; $49A9: $3C
    and  %00000011                                ; $49AA: $E6 $03
    ld   [wEntitiesPosXTable+1], a                ; $49AC: $EA $01 $C2
    ld   hl, wEntitiesPosXTable+6                 ; $49AF: $21 $06 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $49B2: $FA $02 $C2
    add  $04                                      ; $49B5: $C6 $04
    bit  7, a                                     ; $49B7: $CB $7F
    jr   nz, .else_49C9_37                        ; $49B9: $20 $0E

    cp   [hl]                                     ; $49BB: $BE
    jr   c, .else_49C9_37                         ; $49BC: $38 $0B

    call func_037_49CE                            ; $49BE: $CD $CE $49
    ld   a, $04                                   ; $49C1: $3E $04
    ld   [wEntitiesPosXTable+1], a                ; $49C3: $EA $01 $C2
    ld   a, [wEntitiesPosXTable+6]                ; $49C6: $FA $06 $C2

.else_49C9_37
    ld   [wEntitiesPosXTable+2], a                ; $49C9: $EA $02 $C2
    ret                                           ; $49CC: $C9

JumpTable_037_49CD::
    ret                                           ; $49CD: $C9

func_037_49CE::
    ld   hl, wEntitiesPosXTable+5                 ; $49CE: $21 $05 $C2
    inc  [hl]                                     ; $49D1: $34
    ret                                           ; $49D2: $C9

func_037_49D3::
    ld   hl, Data_037_57BD                        ; $49D3: $21 $BD $57
    ld   a, [wEntitiesPosXTable+1]                ; $49D6: $FA $01 $C2
    ld   e, a                                     ; $49D9: $5F
    ld   d, $00                                   ; $49DA: $16 $00
    add  hl, de                                   ; $49DC: $19
    ld   c, [hl]                                  ; $49DD: $4E
    ld   hl, Data_037_57B3                        ; $49DE: $21 $B3 $57

func_037_49E1::
    ld   a, [wEntitiesPosXTable+1]                ; $49E1: $FA $01 $C2
    sla  a                                        ; $49E4: $CB $27
    ld   e, a                                     ; $49E6: $5F
    ld   d, $00                                   ; $49E7: $16 $00
    add  hl, de                                   ; $49E9: $19
    ld   a, [hl+]                                 ; $49EA: $2A
    ld   h, [hl]                                  ; $49EB: $66
    ld   l, a                                     ; $49EC: $6F
    ld   a, [wEntitiesPosXTable+3]                ; $49ED: $FA $03 $C2
    ldh  [hMultiPurpose0], a                      ; $49F0: $E0 $D7
    ld   a, [wEntitiesPosXTable+2]                ; $49F2: $FA $02 $C2
    ldh  [hMultiPurpose1], a                      ; $49F5: $E0 $D8
    call func_037_4AB8                            ; $49F7: $CD $B8 $4A
    ret                                           ; $49FA: $C9

func_037_49FB::
    ld   a, [wEntitiesPosXTable+11]               ; $49FB: $FA $0B $C2
    JP_TABLE                                      ; $49FE: $C7
    dw JumpTable_037_4A03
    dw JumpTable_037_49CD

JumpTable_037_4A03::
    ld   a, $68                                   ; $4A03: $3E $68
    ld   [wEntitiesPosXTable+9], a                ; $4A05: $EA $09 $C2
    ld   hl, wEntitiesPosXTable+10                ; $4A08: $21 $0A $C2
    inc  [hl]                                     ; $4A0B: $34
    ld   a, [hl]                                  ; $4A0C: $7E
    cp   $0A                                      ; $4A0D: $FE $0A
    ret  c                                        ; $4A0F: $D8

    xor  a                                        ; $4A10: $AF
    ld   [hl], a                                  ; $4A11: $77
    ld   a, [wEntitiesPosXTable+7]                ; $4A12: $FA $07 $C2
    inc  a                                        ; $4A15: $3C
    and  $03                                      ; $4A16: $E6 $03
    ld   [wEntitiesPosXTable+7], a                ; $4A18: $EA $07 $C2
    ld   a, [wEntitiesPosXTable+8]                ; $4A1B: $FA $08 $C2
    add  $04                                      ; $4A1E: $C6 $04
    bit  7, a                                     ; $4A20: $CB $7F
    jr   nz, .else_4A33_37                        ; $4A22: $20 $0F

    cp   $40                                      ; $4A24: $FE $40
    jr   c, .else_4A33_37                         ; $4A26: $38 $0B

    ld   hl, wEntitiesPosXTable+11                ; $4A28: $21 $0B $C2
    inc  [hl]                                     ; $4A2B: $34
    ld   a, $04                                   ; $4A2C: $3E $04
    ld   [wEntitiesPosXTable+7], a                ; $4A2E: $EA $07 $C2
    ld   a, $40                                   ; $4A31: $3E $40

.else_4A33_37
    ld   [wEntitiesPosXTable+8], a                ; $4A33: $EA $08 $C2
    ret                                           ; $4A36: $C9

func_037_4A37::
    ld   hl, Data_037_5A56                        ; $4A37: $21 $56 $5A
    ld   a, [wEntitiesPosXTable+7]                ; $4A3A: $FA $07 $C2
    ld   e, a                                     ; $4A3D: $5F
    ld   d, $00                                   ; $4A3E: $16 $00
    add  hl, de                                   ; $4A40: $19
    ld   c, [hl]                                  ; $4A41: $4E
    ld   hl, Data_037_5A4C                        ; $4A42: $21 $4C $5A

func_037_4A45::
    ld   a, [wEntitiesPosXTable+7]                ; $4A45: $FA $07 $C2
    sla  a                                        ; $4A48: $CB $27
    ld   e, a                                     ; $4A4A: $5F
    ld   d, $00                                   ; $4A4B: $16 $00
    add  hl, de                                   ; $4A4D: $19
    ld   a, [hl+]                                 ; $4A4E: $2A
    ld   h, [hl]                                  ; $4A4F: $66
    ld   l, a                                     ; $4A50: $6F
    ld   a, [wEntitiesPosXTable+9]                ; $4A51: $FA $09 $C2
    ldh  [hMultiPurpose0], a                      ; $4A54: $E0 $D7
    ld   a, [wEntitiesPosXTable+8]                ; $4A56: $FA $08 $C2
    ldh  [hMultiPurpose1], a                      ; $4A59: $E0 $D8
    call func_037_4AB8                            ; $4A5B: $CD $B8 $4A
    ret                                           ; $4A5E: $C9

    ld   c, $08                                   ; $4A5F: $0E $08
    ld   hl, Data_037_5AA7                        ; $4A61: $21 $A7 $5A

func_037_4A64::
    ld   a, [wEntitiesPosYTable+11]               ; $4A64: $FA $1B $C2
    sla  a                                        ; $4A67: $CB $27
    ld   e, a                                     ; $4A69: $5F
    ld   d, $00                                   ; $4A6A: $16 $00
    add  hl, de                                   ; $4A6C: $19
    ld   a, [hl+]                                 ; $4A6D: $2A
    ld   h, [hl]                                  ; $4A6E: $66
    ld   l, a                                     ; $4A6F: $6F
    ld   a, [wEntitiesPosYTable+13]               ; $4A70: $FA $1D $C2
    ldh  [hMultiPurpose0], a                      ; $4A73: $E0 $D7
    ld   a, [wEntitiesPosYTable+12]               ; $4A75: $FA $1C $C2
    ldh  [hMultiPurpose1], a                      ; $4A78: $E0 $D8
    call func_037_4AB8                            ; $4A7A: $CD $B8 $4A
    ret                                           ; $4A7D: $C9

Data_037_4A7E::
    db   $48, $68, $5C, $03, $58, $68, $5E, $03

Data_037_4A86::
    db   $48, $68, $60, $03, $58, $68, $62, $03

func_037_4A8E::
    ld   hl, wEntitiesPosXTable+12                ; $4A8E: $21 $0C $C2
    inc  [hl]                                     ; $4A91: $34
    ld   a, [hl]                                  ; $4A92: $7E
    cp   $0A                                      ; $4A93: $FE $0A
    jr   c, .else_4AA1_37                         ; $4A95: $38 $0A

    xor  a                                        ; $4A97: $AF
    ld   [hl], a                                  ; $4A98: $77
    ld   a, [wEntitiesPosXTable+13]               ; $4A99: $FA $0D $C2
    xor  $01                                      ; $4A9C: $EE $01
    ld   [wEntitiesPosXTable+13], a               ; $4A9E: $EA $0D $C2

.else_4AA1_37:
    ld   hl, Data_037_4A7E                        ; $4AA1: $21 $7E $4A
    ld   a, [wEntitiesPosXTable+13]               ; $4AA4: $FA $0D $C2
    and  a                                        ; $4AA7: $A7
    jr   z, .else_4AAD_37                         ; $4AA8: $28 $03

    ld   hl, Data_037_4A86                        ; $4AAA: $21 $86 $4A

.else_4AAD_37:
    xor  a                                        ; $4AAD: $AF
    ldh  [hMultiPurpose0], a                      ; $4AAE: $E0 $D7
    ldh  [hMultiPurpose1], a                      ; $4AB0: $E0 $D8
    ld   c, $08                                   ; $4AB2: $0E $08
    call func_037_4AB8                            ; $4AB4: $CD $B8 $4A
    ret                                           ; $4AB7: $C9

func_037_4AB8::
    push hl                                       ; $4AB8: $E5
    ld   a, [wEntitiesPosXTable]                  ; $4AB9: $FA $00 $C2
    ld   e, a                                     ; $4ABC: $5F
    add  c                                        ; $4ABD: $81
    ld   [wEntitiesPosXTable], a                  ; $4ABE: $EA $00 $C2
    ld   d, $00                                   ; $4AC1: $16 $00
    ld   hl, wOAMBuffer                           ; $4AC3: $21 $00 $C0
    add  hl, de                                   ; $4AC6: $19
    push hl                                       ; $4AC7: $E5
    pop  de                                       ; $4AC8: $D1
    pop  hl                                       ; $4AC9: $E1
    srl  c                                        ; $4ACA: $CB $39
    srl  c                                        ; $4ACC: $CB $39

.loop_4ACE_37
    ldh  a, [hMultiPurpose0]                      ; $4ACE: $F0 $D7
    add  [hl]                                     ; $4AD0: $86
    ld   [de], a                                  ; $4AD1: $12
    inc  de                                       ; $4AD2: $13
    inc  hl                                       ; $4AD3: $23
    ldh  a, [hMultiPurpose1]                      ; $4AD4: $F0 $D8
    add  [hl]                                     ; $4AD6: $86
    ld   [de], a                                  ; $4AD7: $12
    inc  de                                       ; $4AD8: $13
    inc  hl                                       ; $4AD9: $23
    ld   a, [hl]                                  ; $4ADA: $7E
    ld   [de], a                                  ; $4ADB: $12
    inc  de                                       ; $4ADC: $13
    inc  hl                                       ; $4ADD: $23
    ld   a, [hl]                                  ; $4ADE: $7E
    ld   [de], a                                  ; $4ADF: $12
    inc  de                                       ; $4AE0: $13
    inc  hl                                       ; $4AE1: $23
    dec  c                                        ; $4AE2: $0D
    ld   a, c                                     ; $4AE3: $79
    and  a                                        ; $4AE4: $A7
    jr   nz, .loop_4ACE_37                        ; $4AE5: $20 $E7

    ret                                           ; $4AE7: $C9

JumpTable_037_4AE8::
    ld   hl, wEntitiesPosYTable+3                 ; $4AE8: $21 $13 $C2
    inc  [hl]                                     ; $4AEB: $34
    ld   a, [hl]                                  ; $4AEC: $7E
    cp   $50                                      ; $4AED: $FE $50
    ret  nz                                       ; $4AEF: $C0

    ld   a, [wPhotos1]                            ; $4AF0: $FA $0C $DC
    or   $10                                      ; $4AF3: $F6 $10
    ld   [wPhotos1], a                            ; $4AF5: $EA $0C $DC
    xor  a                                        ; $4AF8: $AF
    ld   [hl], a                                  ; $4AF9: $77
    xor  a                                        ; $4AFA: $AF
    ld   [wC16C], a                               ; $4AFB: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $4AFE: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $4B01: $CD $FE $53
    ret                                           ; $4B04: $C9

JumpTable_037_4B05::
    ld   a, $1C                                   ; $4B05: $3E $1C
    ld   [wEntitiesPosXTable], a                  ; $4B07: $EA $00 $C2
    call JumpTable_037_4B1E                       ; $4B0A: $CD $1E $4B
    call func_037_4B55                            ; $4B0D: $CD $55 $4B
    call func_037_4552                            ; $4B10: $CD $52 $45
    ld   a, $37                                   ; $4B13: $3E $37
    call func_A9B                                 ; $4B15: $CD $9B $0A
    ld   a, $37                                   ; $4B18: $3E $37
    call SwitchBank                               ; $4B1A: $CD $0C $08
    ret                                           ; $4B1D: $C9

JumpTable_037_4B1E::
    call func_037_4F1B                            ; $4B1E: $CD $1B $4F
    call func_037_4B31                            ; $4B21: $CD $31 $4B
    call func_037_4F37                            ; $4B24: $CD $37 $4F
    ld   a, [wEntitiesSpeedYAccTable+5]           ; $4B27: $FA $75 $C2
    and  %00000010                                ; $4B2A: $E6 $02
    ret  nz                                       ; $4B2C: $C0

    call func_037_4E7F                            ; $4B2D: $CD $7F $4E
.JumpTable_037_4B30::
    ret                                           ; $4B30: $C9


func_037_4B31::
    ld   hl, Data_037_5870                        ; $4B31: $21 $70 $58
    ld   a, [wEntitiesPosXTable+1]                ; $4B34: $FA $01 $C2
    ld   e, a                                     ; $4B37: $5F
    ld   d, $00                                   ; $4B38: $16 $00
    add  hl, de                                   ; $4B3A: $19
    ld   c, [hl]                                  ; $4B3B: $4E
    ld   hl, Data_037_5866                        ; $4B3C: $21 $66 $58
    sla  e                                        ; $4B3F: $CB $23
    ld   d, $00                                   ; $4B41: $16 $00
    add  hl, de                                   ; $4B43: $19
    ld   a, [hl+]                                 ; $4B44: $2A
    ld   h, [hl]                                  ; $4B45: $66
    ld   l, a                                     ; $4B46: $6F
    ld   a, [wEntitiesPosXTable+3]                ; $4B47: $FA $03 $C2
    ldh  [hMultiPurpose0], a                      ; $4B4A: $E0 $D7
    ld   a, [wEntitiesPosXTable+2]                ; $4B4C: $FA $02 $C2
    ldh  [hMultiPurpose1], a                      ; $4B4F: $E0 $D8
    call func_037_4AB8                            ; $4B51: $CD $B8 $4A
    ret                                           ; $4B54: $C9

func_037_4B55::
    ld   a, [wDialogState]                        ; $4B55: $FA $9F $C1
    and  a                                        ; $4B58: $A7
    ret  nz                                       ; $4B59: $C0

    ld   a, [wEntitiesPosYTable+4]                ; $4B5A: $FA $14 $C2
    and  a                                        ; $4B5D: $A7
    ret  nz                                       ; $4B5E: $C0

    ld   a, [wEntitiesSpeedYAccTable+5]           ; $4B5F: $FA $75 $C2
    and  %00000010                                ; $4B62: $E6 $02
    call z, func_037_4BAC                         ; $4B64: $CC $AC $4B
    ld   a, [wEntitiesPosXSignTable+4]            ; $4B67: $FA $24 $C2
    JP_TABLE                                      ; $4B6A: $C7
    dw JumpTable_037_4C36
    dw JumpTable_037_4C75
    dw JumpTable_037_4CF9
    dw JumpTable_037_4D2E
    dw JumpTable_037_4C75
    dw JumpTable_037_4D43
    dw JumpTable_037_4C75
    dw JumpTable_037_4D7B
    dw JumpTable_037_4DB5
    dw JumpTable_037_4DC2
    dw JumpTable_037_4DD8
    dw JumpTable_037_4DEC
    dw JumpTable_037_4E41
    dw JumpTable_037_4E5F

func_037_4B87::
    ld   a, [wEntitiesSpeedYAccTable+6]           ; $4B87: $FA $76 $C2
    push af                                       ; $4B8A: $F5
    swap a                                        ; $4B8B: $CB $37
    and  %11110000                                ; $4B8D: $E6 $F0
    ld   hl, wEntitiesSpeedYAccTable+7            ; $4B8F: $21 $77 $C2
    add  [hl]                                     ; $4B92: $86
    ld   [hl], a                                  ; $4B93: $77
    rl   d                                        ; $4B94: $CB $12
    ld   hl, wEntitiesPosXTable+2                 ; $4B96: $21 $02 $C2
    pop  af                                       ; $4B99: $F1
    ld   e, $00                                   ; $4B9A: $1E $00
    bit  7, a                                     ; $4B9C: $CB $7F
    jr   z, .else_4BA2_37                         ; $4B9E: $28 $02

    ld   e, $F0                                   ; $4BA0: $1E $F0

.else_4BA2_37:
    swap a                                        ; $4BA2: $CB $37
    and  %00001111                                ; $4BA4: $E6 $0F
    or   e                                        ; $4BA6: $B3
    rr   d                                        ; $4BA7: $CB $1A
    adc  [hl]                                     ; $4BA9: $8E
    ld   [hl], a                                  ; $4BAA: $77
    ret                                           ; $4BAB: $C9

func_037_4BAC::
    ld   a, [wEntitiesSpeedYAccTable+1]           ; $4BAC: $FA $71 $C2
    push af                                       ; $4BAF: $F5
    swap a                                        ; $4BB0: $CB $37
    and  %11110000                                ; $4BB2: $E6 $F0
    ld   hl, wEntitiesSpeedYAccTable+2            ; $4BB4: $21 $72 $C2
    add  [hl]                                     ; $4BB7: $86
    ld   [hl], a                                  ; $4BB8: $77
    rl   d                                        ; $4BB9: $CB $12
    ld   hl, wEntitiesPosXSignTable+2             ; $4BBB: $21 $22 $C2
    pop  af                                       ; $4BBE: $F1
    ld   e, $00                                   ; $4BBF: $1E $00
    bit  7, a                                     ; $4BC1: $CB $7F
    jr   z, .else_4BC7_37                         ; $4BC3: $28 $02

    ld   e, $F0                                   ; $4BC5: $1E $F0

.else_4BC7_37:
    swap a                                        ; $4BC7: $CB $37
    and  %00001111                                ; $4BC9: $E6 $0F
    or   e                                        ; $4BCB: $B3
    rr   d                                        ; $4BCC: $CB $1A
    adc  [hl]                                     ; $4BCE: $8E
    cp   $70                                      ; $4BCF: $FE $70
    jr   c, .else_4BD5_37                         ; $4BD1: $38 $02

    ld   a, $70                                   ; $4BD3: $3E $70

.else_4BD5_37:
    ld   [hl], a                                  ; $4BD5: $77
    ld   hl, wEntitiesSpeedYAccTable+1            ; $4BD6: $21 $71 $C2
    ld   a, [hl]                                  ; $4BD9: $7E
    add  $04                                      ; $4BDA: $C6 $04
    ld   [hl], a                                  ; $4BDC: $77
    ld   a, [wEntitiesSpeedYAccTable+5]           ; $4BDD: $FA $75 $C2
    and  a                                        ; $4BE0: $A7
    jr   z, .else_4BF0_37                         ; $4BE1: $28 $0D

    ld   a, [wEntitiesPosXSignTable+2]            ; $4BE3: $FA $22 $C2
    cp   $70                                      ; $4BE6: $FE $70
    jr   c, .else_4C05_37                         ; $4BE8: $38 $1B

    xor  a                                        ; $4BEA: $AF
    ld   [wEntitiesSpeedYAccTable+1], a           ; $4BEB: $EA $71 $C2
    jr   .else_4C31_37                            ; $4BEE: $18 $41

.else_4BF0_37:
    ld   a, [wEntitiesPosXSignTable+2]            ; $4BF0: $FA $22 $C2
    cp   $70                                      ; $4BF3: $FE $70
    jr   c, .else_4C05_37                         ; $4BF5: $38 $0E

    call GetRandomByte                            ; $4BF7: $CD $0D $28
    and  %00001100                                ; $4BFA: $E6 $0C
    sla  a                                        ; $4BFC: $CB $27
    sla  a                                        ; $4BFE: $CB $27
    cpl                                           ; $4C00: $2F
    inc  a                                        ; $4C01: $3C
    ld   [wEntitiesSpeedYAccTable+1], a           ; $4C02: $EA $71 $C2

.else_4C05_37:
    ld   hl, wEntitiesPosXSignTable+3             ; $4C05: $21 $23 $C2
    ld   a, [wEntitiesSpeedYAccTable+3]           ; $4C08: $FA $73 $C2
    and  a                                        ; $4C0B: $A7
    jr   nz, .else_4C18_37                        ; $4C0C: $20 $0A

    dec  [hl]                                     ; $4C0E: $35
    ld   a, [hl]                                  ; $4C0F: $7E
    cp   $40                                      ; $4C10: $FE $40
    jr   nc, .else_4C31_37                        ; $4C12: $30 $1D

    ld   a, $40                                   ; $4C14: $3E $40
    jr   .func_037_4C20                           ; $4C16: $18 $08

.else_4C18_37:
    inc  [hl]                                     ; $4C18: $34
    ld   a, [hl]                                  ; $4C19: $7E
    cp   $70                                      ; $4C1A: $FE $70
    jr   c, .else_4C31_37                         ; $4C1C: $38 $13

    ld   a, $70                                   ; $4C1E: $3E $70
.func_037_4C20::
    ld   [hl], a                                  ; $4C20: $77
    ld   a, [wEntitiesSpeedYAccTable+3]           ; $4C21: $FA $73 $C2
    xor  $01                                      ; $4C24: $EE $01
    ld   [wEntitiesSpeedYAccTable+3], a           ; $4C26: $EA $73 $C2
    ld   a, [wEntitiesPosXSignTable+1]            ; $4C29: $FA $21 $C2
    xor  $02                                      ; $4C2C: $EE $02
    ld   [wEntitiesPosXSignTable+1], a            ; $4C2E: $EA $21 $C2

.else_4C31_37:
    xor  a                                        ; $4C31: $AF
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4C32: $EA $75 $C2
    ret                                           ; $4C35: $C9

JumpTable_037_4C36::
    ld   hl, wEntitiesPosYTable+3                 ; $4C36: $21 $13 $C2
    inc  [hl]                                     ; $4C39: $34
    ld   a, [hl]                                  ; $4C3A: $7E
    cp   $50                                      ; $4C3B: $FE $50
    ret  c                                        ; $4C3D: $D8

    xor  a                                        ; $4C3E: $AF
    ld   [hl], a                                  ; $4C3F: $77
    ld   [wEntitiesPosXTable+4], a                ; $4C40: $EA $04 $C2
    call_open_dialog Dialog270                      ; $4C43
.func_037_4C48::
    ld   hl, wEntitiesPosXSignTable+4             ; $4C48: $21 $24 $C2
    inc  [hl]                                     ; $4C4B: $34
    ret                                           ; $4C4C: $C9

Data_037_4C4D::
    db   $01, $02, $01, $03, $01, $02, $01, $03, $01, $02, $01, $03, $01, $02, $01, $03
    db   $01, $02, $01, $03, $01, $02, $01, $03, $01, $02, $01, $03, $01, $02, $01, $03
    db   $01, $02, $01, $03, $01, $02, $01, $03

JumpTable_037_4C75::
    ld   hl, wEntitiesPosYTable+3                 ; $4C75: $21 $13 $C2
    inc  [hl]                                     ; $4C78: $34
    ld   a, [hl]                                  ; $4C79: $7E
    cp   $08                                      ; $4C7A: $FE $08
    ret  c                                        ; $4C7C: $D8

    xor  a                                        ; $4C7D: $AF
    ld   [hl], a                                  ; $4C7E: $77
    ld   hl, wEntitiesPosXTable+4                 ; $4C7F: $21 $04 $C2
    inc  [hl]                                     ; $4C82: $34
    ld   e, [hl]                                  ; $4C83: $5E
    ld   d, $00                                   ; $4C84: $16 $00
    ld   hl, Data_037_4C4D                        ; $4C86: $21 $4D $4C
    add  hl, de                                   ; $4C89: $19
    ld   a, [hl]                                  ; $4C8A: $7E
    ld   [wEntitiesPosXTable+1], a                ; $4C8B: $EA $01 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $4C8E: $FA $02 $C2
    sub  $03                                      ; $4C91: $D6 $03
    ld   [wEntitiesPosXTable+2], a                ; $4C93: $EA $02 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $4C96: $FA $02 $C2
    ld   hl, wEntitiesPosXSignTable+3             ; $4C99: $21 $23 $C2
    sub  [hl]                                     ; $4C9C: $96
    bit  7, a                                     ; $4C9D: $CB $7F
    jr   nz, .else_4CA4_37                        ; $4C9F: $20 $03

    cp   $08                                      ; $4CA1: $FE $08
    ret  nc                                       ; $4CA3: $D0

.else_4CA4_37:
    xor  a                                        ; $4CA4: $AF
    ld   [wEntitiesPosYTable+3], a                ; $4CA5: $EA $13 $C2
    ld   a, $02                                   ; $4CA8: $3E $02
    ld   [wEntitiesPosXTable+1], a                ; $4CAA: $EA $01 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $4CAD: $FA $02 $C2
    sub  $04                                      ; $4CB0: $D6 $04
    ld   [wEntitiesPosXTable+2], a                ; $4CB2: $EA $02 $C2
    ld   a, $10                                   ; $4CB5: $3E $10
    ld   [wEntitiesPosXSignTable+5], a            ; $4CB7: $EA $25 $C2
    ld   a, JINGLE_SWORD_POKING                   ; $4CBA: $3E $07
    ldh  [hJingle], a                             ; $4CBC: $E0 $F2
    ld   a, $28                                   ; $4CBE: $3E $28
    ld   [wEntitiesSpeedYAccTable+6], a           ; $4CC0: $EA $76 $C2
    ld   a, [wEntitiesPosXTable+3]                ; $4CC3: $FA $03 $C2
    add  $03                                      ; $4CC6: $C6 $03
    ld   [wEntitiesSpeedYAccTable+9], a           ; $4CC8: $EA $79 $C2
    ld   a, [wEntitiesPosXTable+2]                ; $4CCB: $FA $02 $C2
    sub  $0C                                      ; $4CCE: $D6 $0C
    ld   [wEntitiesSpeedYAccTable+8], a           ; $4CD0: $EA $78 $C2
    jp   JumpTable_037_4C36.func_037_4C48         ; $4CD3: $C3 $48 $4C

func_037_4CD6::
    call func_037_4B87                            ; $4CD6: $CD $87 $4B
    ld   a, [wEntitiesSpeedYAccTable+6]           ; $4CD9: $FA $76 $C2
    and  a                                        ; $4CDC: $A7
    ret  z                                        ; $4CDD: $C8

    sub  $03                                      ; $4CDE: $D6 $03
    bit  7, a                                     ; $4CE0: $CB $7F
    jr   z, .else_4CE5_37                         ; $4CE2: $28 $01

    xor  a                                        ; $4CE4: $AF

.else_4CE5_37:
    ld   [wEntitiesSpeedYAccTable+6], a           ; $4CE5: $EA $76 $C2
    ret                                           ; $4CE8: $C9

Data_037_4CE9::
    db   $00, $01, $00, $01, $00, $01, $01, $00, $00, $01, $00, $01, $00, $01, $01, $00

JumpTable_037_4CF9::
    ld   a, $01                                   ; $4CF9: $3E $01
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4CFB: $EA $75 $C2
    call func_037_4CD6                            ; $4CFE: $CD $D6 $4C
    ld   a, [wEntitiesPosXSignTable+5]            ; $4D01: $FA $25 $C2
    and  a                                        ; $4D04: $A7
    ret  nz                                       ; $4D05: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4D06: $21 $13 $C2
    inc  [hl]                                     ; $4D09: $34
    ld   a, [hl]                                  ; $4D0A: $7E
    and  %00110000                                ; $4D0B: $E6 $30
    cp   $30                                      ; $4D0D: $FE $30
    jr   nz, .else_4D1B_37                        ; $4D0F: $20 $0A

    xor  a                                        ; $4D11: $AF
    ld   [hl], a                                  ; $4D12: $77
    call_open_dialog Dialog271                      ; $4D13
    jp   JumpTable_037_4C36.func_037_4C48         ; $4D18: $C3 $48 $4C

.else_4D1B_37:
    swap a                                        ; $4D1B: $CB $37
    ld   e, a                                     ; $4D1D: $5F
    ld   d, $00                                   ; $4D1E: $16 $00
    ld   hl, Data_037_4CE9                        ; $4D20: $21 $E9 $4C
    add  hl, de                                   ; $4D23: $19
    ld   a, [wEntitiesPosXSignTable+1]            ; $4D24: $FA $21 $C2
    and  %11111110                                ; $4D27: $E6 $FE
    or   [hl]                                     ; $4D29: $B6
    ld   [wEntitiesPosXSignTable+1], a            ; $4D2A: $EA $21 $C2
    ret                                           ; $4D2D: $C9

JumpTable_037_4D2E::
    ld   hl, wEntitiesPosYTable+3                 ; $4D2E: $21 $13 $C2
    inc  [hl]                                     ; $4D31: $34
    ld   a, [hl]                                  ; $4D32: $7E
    cp   $20                                      ; $4D33: $FE $20
    ret  nz                                       ; $4D35: $C0

    xor  a                                        ; $4D36: $AF
    ld   [hl], a                                  ; $4D37: $77
    ld   [wEntitiesPosXTable+4], a                ; $4D38: $EA $04 $C2
    call_open_dialog Dialog272                      ; $4D3B
    jp   JumpTable_037_4C36.func_037_4C48         ; $4D40: $C3 $48 $4C

JumpTable_037_4D43::
    ld   a, $01                                   ; $4D43: $3E $01
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4D45: $EA $75 $C2
    call func_037_4CD6                            ; $4D48: $CD $D6 $4C
    ld   a, [wEntitiesPosXSignTable+5]            ; $4D4B: $FA $25 $C2
    and  a                                        ; $4D4E: $A7
    ret  nz                                       ; $4D4F: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4D50: $21 $13 $C2
    inc  [hl]                                     ; $4D53: $34
    ld   a, [hl]                                  ; $4D54: $7E
    cp   $4F                                      ; $4D55: $FE $4F
    jr   nz, .else_4D66_37                        ; $4D57: $20 $0D

    xor  a                                        ; $4D59: $AF
    ld   [hl], a                                  ; $4D5A: $77
    ld   [wEntitiesPosXTable+4], a                ; $4D5B: $EA $04 $C2
    call_open_dialog Dialog273                      ; $4D5E
    jp   JumpTable_037_4C36.func_037_4C48         ; $4D63: $C3 $48 $4C

.else_4D66_37:
    and  %01110000                                ; $4D66: $E6 $70
    swap a                                        ; $4D68: $CB $37
    ld   e, a                                     ; $4D6A: $5F
    ld   d, $00                                   ; $4D6B: $16 $00
    ld   hl, Data_037_4CE9                        ; $4D6D: $21 $E9 $4C
    add  hl, de                                   ; $4D70: $19
    ld   a, [wEntitiesPosXSignTable+1]            ; $4D71: $FA $21 $C2
    and  %11111110                                ; $4D74: $E6 $FE
    or   [hl]                                     ; $4D76: $B6
    ld   [wEntitiesPosXSignTable+1], a            ; $4D77: $EA $21 $C2
    ret                                           ; $4D7A: $C9

JumpTable_037_4D7B::
    ld   a, $01                                   ; $4D7B: $3E $01
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4D7D: $EA $75 $C2
    call func_037_4CD6                            ; $4D80: $CD $D6 $4C
    ld   a, [wEntitiesPosXSignTable+5]            ; $4D83: $FA $25 $C2
    and  a                                        ; $4D86: $A7
    ret  nz                                       ; $4D87: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4D88: $21 $13 $C2
    inc  [hl]                                     ; $4D8B: $34
    ld   a, [hl]                                  ; $4D8C: $7E
    cp   $68                                      ; $4D8D: $FE $68
    jr   nz, .else_4DA0_37                        ; $4D8F: $20 $0F

    ld   a, $02                                   ; $4D91: $3E $02
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4D93: $EA $75 $C2
    xor  a                                        ; $4D96: $AF
    ld   [hl], a                                  ; $4D97: $77
    call_open_dialog Dialog275                      ; $4D98
    jp   JumpTable_037_4C36.func_037_4C48         ; $4D9D: $C3 $48 $4C

.else_4DA0_37:
    and  %01110000                                ; $4DA0: $E6 $70
    swap a                                        ; $4DA2: $CB $37
    ld   e, a                                     ; $4DA4: $5F
    ld   d, $00                                   ; $4DA5: $16 $00
    ld   hl, Data_037_4CE9                        ; $4DA7: $21 $E9 $4C
    add  hl, de                                   ; $4DAA: $19
    ld   a, [wEntitiesPosXSignTable+1]            ; $4DAB: $FA $21 $C2
    and  %11111110                                ; $4DAE: $E6 $FE
    or   [hl]                                     ; $4DB0: $B6
    ld   [wEntitiesPosXSignTable+1], a            ; $4DB1: $EA $21 $C2
    ret                                           ; $4DB4: $C9

JumpTable_037_4DB5::
    ld   a, $02                                   ; $4DB5: $3E $02
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4DB7: $EA $75 $C2
    call_open_dialog Dialog274                      ; $4DBA
    jp   JumpTable_037_4C36.func_037_4C48         ; $4DBF: $C3 $48 $4C

JumpTable_037_4DC2::
    xor  a                                        ; $4DC2: $AF
    ld   [wEntitiesPosXTable+1], a                ; $4DC3: $EA $01 $C2
    ld   hl, wEntitiesPosYTable+3                 ; $4DC6: $21 $13 $C2
    inc  [hl]                                     ; $4DC9: $34
    ld   a, [hl]                                  ; $4DCA: $7E
    cp   $40                                      ; $4DCB: $FE $40
    ret  nz                                       ; $4DCD: $C0

    xor  a                                        ; $4DCE: $AF
    ld   [hl], a                                  ; $4DCF: $77
    ld   a, $04                                   ; $4DD0: $3E $04
    ld   [wEntitiesPosXTable+1], a                ; $4DD2: $EA $01 $C2
    jp   JumpTable_037_4C36.func_037_4C48         ; $4DD5: $C3 $48 $4C

JumpTable_037_4DD8::
    ld   hl, wEntitiesPosYTable+3                 ; $4DD8: $21 $13 $C2
    inc  [hl]                                     ; $4DDB: $34
    ld   a, [hl]                                  ; $4DDC: $7E
    cp   $30                                      ; $4DDD: $FE $30
    ret  nz                                       ; $4DDF: $C0

    xor  a                                        ; $4DE0: $AF
    ld   [hl], a                                  ; $4DE1: $77
    ld   a, $04                                   ; $4DE2: $3E $04
    ld   [wEntitiesPosXSignTable+1], a            ; $4DE4: $EA $21 $C2
    jp   JumpTable_037_4C36.func_037_4C48         ; $4DE7: $C3 $48 $4C

Data_037_4DEA::
    db   $02, $FE

JumpTable_037_4DEC::
    ld   hl, wEntitiesPosYTable+3                 ; $4DEC: $21 $13 $C2
    inc  [hl]                                     ; $4DEF: $34
    ld   a, [hl]                                  ; $4DF0: $7E
    and  $07                                      ; $4DF1: $E6 $07
    jr   nz, .else_4DFD_37                        ; $4DF3: $20 $08

    ld   a, [wEntitiesPosXSignTable+1]            ; $4DF5: $FA $21 $C2
    xor  $01                                      ; $4DF8: $EE $01
    ld   [wEntitiesPosXSignTable+1], a            ; $4DFA: $EA $21 $C2

.else_4DFD_37:
    ld   a, $02                                   ; $4DFD: $3E $02
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4DFF: $EA $75 $C2
    ld   a, [hl]                                  ; $4E02: $7E
    and  $03                                      ; $4E03: $E6 $03
    jr   nz, .else_4E23_37                        ; $4E05: $20 $1C

    ld   a, [hl]                                  ; $4E07: $7E
    srl  a                                        ; $4E08: $CB $3F
    srl  a                                        ; $4E0A: $CB $3F
    and  $01                                      ; $4E0C: $E6 $01
    ld   e, a                                     ; $4E0E: $5F
    ld   d, $00                                   ; $4E0F: $16 $00
    push hl                                       ; $4E11: $E5
    ld   hl, Data_037_4DEA                        ; $4E12: $21 $EA $4D
    add  hl, de                                   ; $4E15: $19
    ld   a, [hl]                                  ; $4E16: $7E
    ld   hl, wEntitiesPosXSignTable+3             ; $4E17: $21 $23 $C2
    add  [hl]                                     ; $4E1A: $86
    ld   [wEntitiesPosXSignTable+3], a            ; $4E1B: $EA $23 $C2
    ld   hl, wEntitiesPosXSignTable+2             ; $4E1E: $21 $22 $C2
    dec  [hl]                                     ; $4E21: $35
    pop  hl                                       ; $4E22: $E1

.else_4E23_37:
    ld   a, [hl]                                  ; $4E23: $7E
    cp   $30                                      ; $4E24: $FE $30
    ret  nz                                       ; $4E26: $C0

    xor  a                                        ; $4E27: $AF
    ld   [hl], a                                  ; $4E28: $77
    ld   a, $06                                   ; $4E29: $3E $06
    ld   [wEntitiesPosXSignTable+1], a            ; $4E2B: $EA $21 $C2
    ld   a, [wEntitiesPosXSignTable+3]            ; $4E2E: $FA $23 $C2
    add  $03                                      ; $4E31: $C6 $03
    ld   [wEntitiesPosXSignTable+3], a            ; $4E33: $EA $23 $C2
    ld   a, [wEntitiesPosXSignTable+2]            ; $4E36: $FA $22 $C2
    sub  $03                                      ; $4E39: $D6 $03
    ld   [wEntitiesPosXSignTable+2], a            ; $4E3B: $EA $22 $C2
    jp   JumpTable_037_4C36.func_037_4C48         ; $4E3E: $C3 $48 $4C

JumpTable_037_4E41::
    ld   a, $02                                   ; $4E41: $3E $02
    ld   [wEntitiesSpeedYAccTable+5], a           ; $4E43: $EA $75 $C2
    ld   hl, wEntitiesPosYTable+3                 ; $4E46: $21 $13 $C2
    inc  [hl]                                     ; $4E49: $34
    ld   a, [hl]                                  ; $4E4A: $7E
    cp   $10                                      ; $4E4B: $FE $10
    ret  c                                        ; $4E4D: $D8

    ld   a, $07                                   ; $4E4E: $3E $07
    ld   [wEntitiesPosXSignTable+1], a            ; $4E50: $EA $21 $C2
    ld   a, [hl]                                  ; $4E53: $7E
    cp   $20                                      ; $4E54: $FE $20
    ret  nz                                       ; $4E56: $C0

    ld   a, $01                                   ; $4E57: $3E $01
    ld   [wEntitiesPosYTable+4], a                ; $4E59: $EA $14 $C2
    jp   JumpTable_037_4C36.func_037_4C48         ; $4E5C: $C3 $48 $4C

JumpTable_037_4E5F::
    ld   a, [wEntitiesPosYTable+4]                ; $4E5F: $FA $14 $C2
    and  a                                        ; $4E62: $A7
    ret  nz                                       ; $4E63: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $4E64: $21 $13 $C2
    inc  [hl]                                     ; $4E67: $34
    ld   a, [hl]                                  ; $4E68: $7E
    cp   $50                                      ; $4E69: $FE $50
    ret  nz                                       ; $4E6B: $C0

    ld   a, [wPhotos1]                            ; $4E6C: $FA $0C $DC
    or   $20                                      ; $4E6F: $F6 $20
    ld   [wPhotos1], a                            ; $4E71: $EA $0C $DC
    xor  a                                        ; $4E74: $AF
    ld   [wC16C], a                               ; $4E75: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $4E78: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $4E7B: $CD $FE $53
    ret                                           ; $4E7E: $C9

func_037_4E7F::
    ld   a, [wEntitiesPosXSignTable+3]            ; $4E7F: $FA $23 $C2
    ld   [wEntitiesSpeedYTable+1], a              ; $4E82: $EA $51 $C2
    ld   a, [wEntitiesPosXSignTable+2]            ; $4E85: $FA $22 $C2
    ld   [wEntitiesSpeedXAccTable+1], a           ; $4E88: $EA $61 $C2
    ld   de, wEntitiesSpeedYTable+1               ; $4E8B: $11 $51 $C2
    ld   hl, wEntitiesSpeedYTable+2               ; $4E8E: $21 $52 $C2
    ld   c, $05                                   ; $4E91: $0E $05

.loop_4E93_37
    ld   a, [de]                                  ; $4E93: $1A
    sub  [hl]                                     ; $4E94: $96
    add  $07                                      ; $4E95: $C6 $07
    cp   $0E                                      ; $4E97: $FE $0E
    jr   c, .else_4EA5_37                         ; $4E99: $38 $0A

    bit  7, a                                     ; $4E9B: $CB $7F
    jr   nz, .else_4EA3_37                        ; $4E9D: $20 $04

    inc  [hl]                                     ; $4E9F: $34
    inc  [hl]                                     ; $4EA0: $34
    inc  [hl]                                     ; $4EA1: $34
    inc  [hl]                                     ; $4EA2: $34

.else_4EA3_37:
    dec  [hl]                                     ; $4EA3: $35
    dec  [hl]                                     ; $4EA4: $35

.else_4EA5_37:
    inc  hl                                       ; $4EA5: $23
    inc  de                                       ; $4EA6: $13
    dec  c                                        ; $4EA7: $0D
    jr   nz, .loop_4E93_37                        ; $4EA8: $20 $E9

    ld   de, wEntitiesSpeedXAccTable+1            ; $4EAA: $11 $61 $C2
    ld   hl, wEntitiesSpeedXAccTable+2            ; $4EAD: $21 $62 $C2
    ld   c, $05                                   ; $4EB0: $0E $05

.loop_4EB2_37
    ld   a, [de]                                  ; $4EB2: $1A
    sub  [hl]                                     ; $4EB3: $96
    add  $07                                      ; $4EB4: $C6 $07
    cp   $0E                                      ; $4EB6: $FE $0E
    jr   c, .else_4EC4_37                         ; $4EB8: $38 $0A

    bit  7, a                                     ; $4EBA: $CB $7F
    jr   nz, .else_4EC2_37                        ; $4EBC: $20 $04

    inc  [hl]                                     ; $4EBE: $34
    inc  [hl]                                     ; $4EBF: $34
    inc  [hl]                                     ; $4EC0: $34
    inc  [hl]                                     ; $4EC1: $34

.else_4EC2_37:
    dec  [hl]                                     ; $4EC2: $35
    dec  [hl]                                     ; $4EC3: $35

.else_4EC4_37:
    inc  hl                                       ; $4EC4: $23
    inc  de                                       ; $4EC5: $13
    dec  c                                        ; $4EC6: $0D
    jr   nz, .loop_4EB2_37                        ; $4EC7: $20 $E9

    ldh  a, [hFrameCounter]                       ; $4EC9: $F0 $E7
    and  $01                                      ; $4ECB: $E6 $01
    jr   z, .else_4EDE_37                         ; $4ECD: $28 $0F

    ld   hl, wEntitiesSpeedXAccTable+1            ; $4ECF: $21 $61 $C2

.loop_4ED2_37
    ld   a, [hl]                                  ; $4ED2: $7E
    cp   $70                                      ; $4ED3: $FE $70
    jr   z, .else_4ED8_37                         ; $4ED5: $28 $01

    inc  [hl]                                     ; $4ED7: $34

.else_4ED8_37:
    inc  hl                                       ; $4ED8: $23
    ld   a, l                                     ; $4ED9: $7D
    and  $0F                                      ; $4EDA: $E6 $0F
    jr   nz, .loop_4ED2_37                        ; $4EDC: $20 $F4

.else_4EDE_37:
    ld   a, [wEntitiesPosXTable]                  ; $4EDE: $FA $00 $C2
    ld   e, a                                     ; $4EE1: $5F
    add  $0C                                      ; $4EE2: $C6 $0C
    ld   [wEntitiesPosXTable], a                  ; $4EE4: $EA $00 $C2
    ld   d, $00                                   ; $4EE7: $16 $00
    ld   hl, wOAMBuffer                           ; $4EE9: $21 $00 $C0
    add  hl, de                                   ; $4EEC: $19
    push hl                                       ; $4EED: $E5
    pop  de                                       ; $4EEE: $D1
    ld   c, $05                                   ; $4EEF: $0E $05

.loop_4EF1_37
    ldh  a, [hFrameCounter]                       ; $4EF1: $F0 $E7
    xor  c                                        ; $4EF3: $A9
    rra                                           ; $4EF4: $1F
    jr   c, .else_4F0F_37                         ; $4EF5: $38 $18

    ld   hl, wEntitiesSpeedXAccTable+1            ; $4EF7: $21 $61 $C2
    add  hl, bc                                   ; $4EFA: $09
    ld   a, [hl]                                  ; $4EFB: $7E
    ld   [de], a                                  ; $4EFC: $12
    inc  de                                       ; $4EFD: $13
    ld   hl, wEntitiesSpeedYTable+1               ; $4EFE: $21 $51 $C2
    add  hl, bc                                   ; $4F01: $09
    ld   a, [hl]                                  ; $4F02: $7E
    add  $04                                      ; $4F03: $C6 $04
    ld   [de], a                                  ; $4F05: $12
    inc  de                                       ; $4F06: $13
    ld   a, $7E                                   ; $4F07: $3E $7E
    ld   [de], a                                  ; $4F09: $12
    inc  de                                       ; $4F0A: $13
    ld   a, $00                                   ; $4F0B: $3E $00
    ld   [de], a                                  ; $4F0D: $12
    inc  de                                       ; $4F0E: $13

.else_4F0F_37:
    dec  c                                        ; $4F0F: $0D
    jr   nz, .loop_4EF1_37                        ; $4F10: $20 $DF

    ret                                           ; $4F12: $C9

Data_037_4F13::
    db   $00, $00, $5E, $20, $00, $08, $5E, $00

func_037_4F1B::
    ld   a, [wEntitiesPosXSignTable+5]            ; $4F1B: $FA $25 $C2
    and  a                                        ; $4F1E: $A7
    ret  z                                        ; $4F1F: $C8

    dec  a                                        ; $4F20: $3D
    ld   [wEntitiesPosXSignTable+5], a            ; $4F21: $EA $25 $C2
    ld   hl, Data_037_4F13                        ; $4F24: $21 $13 $4F
    ld   a, [wEntitiesSpeedYAccTable+9]           ; $4F27: $FA $79 $C2
    ldh  [hMultiPurpose0], a                      ; $4F2A: $E0 $D7
    ld   a, [wEntitiesSpeedYAccTable+8]           ; $4F2C: $FA $78 $C2
    ldh  [hMultiPurpose1], a                      ; $4F2F: $E0 $D8
    ld   c, $08                                   ; $4F31: $0E $08
    call func_037_4AB8                            ; $4F33: $CD $B8 $4A
    ret                                           ; $4F36: $C9

func_037_4F37::
    ld   hl, Data_037_5C7F                        ; $4F37: $21 $7F $5C
    ld   a, [wEntitiesPosXSignTable+1]            ; $4F3A: $FA $21 $C2
    ld   e, a                                     ; $4F3D: $5F
    ld   d, $00                                   ; $4F3E: $16 $00
    add  hl, de                                   ; $4F40: $19
    ld   c, [hl]                                  ; $4F41: $4E
    ld   hl, Data_037_5C6F                        ; $4F42: $21 $6F $5C
    sla  e                                        ; $4F45: $CB $23
    ld   d, $00                                   ; $4F47: $16 $00
    add  hl, de                                   ; $4F49: $19
    ld   a, [hl+]                                 ; $4F4A: $2A
    ld   h, [hl]                                  ; $4F4B: $66
    ld   l, a                                     ; $4F4C: $6F
    ld   a, [wEntitiesPosXSignTable+2]            ; $4F4D: $FA $22 $C2
    ldh  [hMultiPurpose0], a                      ; $4F50: $E0 $D7
    ld   a, [wEntitiesPosXSignTable+3]            ; $4F52: $FA $23 $C2
    ldh  [hMultiPurpose1], a                      ; $4F55: $E0 $D8
    call func_037_4AB8                            ; $4F57: $CD $B8 $4A
    ret                                           ; $4F5A: $C9

JumpTable_037_4F5B::
IF !__PATCH_4__
    ldh  a, [hJoypadState]                        ; $4F5B: $F0 $CC
    and  J_START                                  ; $4F5D: $E6 $80
    jr   z, .else_4F6B_37                         ; $4F5F: $28 $0A

    ; If START is pressed, skip a transition
    xor  a                                        ; $4F61: $AF
    ld   [wC16C], a                               ; $4F62: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $4F65: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $4F68: $CD $FE $53
ENDC

.else_4F6B_37:
    call func_037_4F70                            ; $4F6B: $CD $70 $4F
    ret                                           ; $4F6E: $C9

JumpTable_037_4F6F::
    ret                                           ; $4F6F: $C9

func_037_4F70::
    ld   a, [wDialogState]                        ; $4F70: $FA $9F $C1
    and  a                                        ; $4F73: $A7
    ret  nz                                       ; $4F74: $C0

    ld   a, [wEntitiesPosXTable+5]                ; $4F75: $FA $05 $C2
    JP_TABLE                                      ; $4F78: $C7
    dw JumpTable_037_4F7D
    dw JumpTable_037_49CD

JumpTable_037_4F7D::
    ld   hl, wEntitiesPosYTable+3                 ; $4F7D: $21 $13 $C2
    inc  [hl]                                     ; $4F80: $34
    ld   a, [hl]                                  ; $4F81: $7E
    cp   $70                                      ; $4F82: $FE $70
    ret  nz                                       ; $4F84: $C0

    xor  a                                        ; $4F85: $AF
    ld   [wC16C], a                               ; $4F86: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $4F89: $EA $6B $C1
    ld   a, [wPhotos1]                            ; $4F8C: $FA $0C $DC
    or   $80                                      ; $4F8F: $F6 $80
    ld   [wPhotos1], a                            ; $4F91: $EA $0C $DC
    call IncrementGameplaySubtype_37              ; $4F94: $CD $FE $53
    call func_037_49CE                            ; $4F97: $CD $CE $49
    ret                                           ; $4F9A: $C9

JumpTable_037_4F9B::
    ld   hl, wEntitiesPosYTable+3                 ; $4F9B: $21 $13 $C2
    inc  [hl]                                     ; $4F9E: $34
    ld   a, [hl]                                  ; $4F9F: $7E
    cp   $50                                      ; $4FA0: $FE $50
    ret  nz                                       ; $4FA2: $C0

    xor  a                                        ; $4FA3: $AF
    ld   [wC16C], a                               ; $4FA4: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $4FA7: $EA $6B $C1
    ld   a, [wPhotos2]                            ; $4FAA: $FA $0D $DC
    or   $01                                      ; $4FAD: $F6 $01
    ld   [wPhotos2], a                            ; $4FAF: $EA $0D $DC
    call IncrementGameplaySubtype_37              ; $4FB2: $CD $FE $53
    ret                                           ; $4FB5: $C9

JumpTable_037_4FB6::
    ret                                           ; $4FB6: $C9

JumpTable_037_4FB7::
    ld   a, $1C                                   ; $4FB7: $3E $1C
    ld   [wEntitiesPosXTable], a                  ; $4FB9: $EA $00 $C2
    call JumpTable_037_4FD0                       ; $4FBC: $CD $D0 $4F
    call func_037_500B                            ; $4FBF: $CD $0B $50
    call func_037_4552                            ; $4FC2: $CD $52 $45
    ld   a, $37                                   ; $4FC5: $3E $37
    call func_A9B                                 ; $4FC7: $CD $9B $0A
    ld   a, $37                                   ; $4FCA: $3E $37
    call SwitchBank                               ; $4FCC: $CD $0C $08
    ret                                           ; $4FCF: $C9

JumpTable_037_4FD0::
    ld   hl, Data_037_5B69                        ; $4FD0: $21 $69 $5B
    ld   a, [wEntitiesPosYTable+9]                ; $4FD3: $FA $19 $C2
    ld   e, a                                     ; $4FD6: $5F
    ld   d, $00                                   ; $4FD7: $16 $00
    add  hl, de                                   ; $4FD9: $19
    ld   c, [hl]                                  ; $4FDA: $4E
    ld   hl, Data_037_5B5D                        ; $4FDB: $21 $5D $5B
    sla  e                                        ; $4FDE: $CB $23
    add  hl, de                                   ; $4FE0: $19
    ld   a, [hl+]                                 ; $4FE1: $2A
    ld   h, [hl]                                  ; $4FE2: $66
    ld   l, a                                     ; $4FE3: $6F
    ld   a, [wEntitiesPosYTable+6]                ; $4FE4: $FA $16 $C2
    ldh  [hMultiPurpose0], a                      ; $4FE7: $E0 $D7
    ld   a, [wEntitiesPosYTable+7]                ; $4FE9: $FA $17 $C2
    ldh  [hMultiPurpose1], a                      ; $4FEC: $E0 $D8
    call func_037_4AB8                            ; $4FEE: $CD $B8 $4A
    ld   hl, Data_037_5941                        ; $4FF1: $21 $41 $59
    ld   a, [wEntitiesPosXTable+1]                ; $4FF4: $FA $01 $C2
    ld   e, a                                     ; $4FF7: $5F
    ld   d, $00                                   ; $4FF8: $16 $00
    add  hl, de                                   ; $4FFA: $19
    ld   c, [hl]                                  ; $4FFB: $4E
    ld   hl, Data_037_5935                        ; $4FFC: $21 $35 $59
    call func_037_49E1                            ; $4FFF: $CD $E1 $49
    ld   c, $08                                   ; $5002: $0E $08
    ld   hl, Data_037_5ADD                        ; $5004: $21 $DD $5A
    call func_037_4A64                            ; $5007: $CD $64 $4A
    ret                                           ; $500A: $C9

func_037_500B::
    ld   a, [wDialogState]                        ; $500B: $FA $9F $C1
    and  a                                        ; $500E: $A7
    ret  nz                                       ; $500F: $C0

    ld   a, [wEntitiesPosYTable+5]                ; $5010: $FA $15 $C2
    JP_TABLE                                      ; $5013: $C7
    dw JumpTable_037_506F
    dw JumpTable_037_5081
    dw JumpTable_037_506F
    dw JumpTable_037_50AA
    dw JumpTable_037_50D5
    dw JumpTable_037_510A
    dw JumpTable_037_5165
    dw JumpTable_037_5177
    dw JumpTable_037_5192
    dw JumpTable_037_51AB

func_037_5028::
    ld   a, [wEntitiesPosXTable+2]                ; $5028: $FA $02 $C2
    cp   $3E                                      ; $502B: $FE $3E
    jr   nz, .else_5040_37                        ; $502D: $20 $11

    ld   a, [wEntitiesPosYTable+12]               ; $502F: $FA $1C $C2
    cp   $52                                      ; $5032: $FE $52
    ret  nz                                       ; $5034: $C0

    call_open_dialog Dialog22E                      ; $5035
    call JumpTable_037_506F.func_037_507C         ; $503A: $CD $7C $50
    ld   [hl], $04                                ; $503D: $36 $04
    ret                                           ; $503F: $C9

.else_5040_37:
    ld   hl, wEntitiesPosXTable+4                 ; $5040: $21 $04 $C2
    inc  [hl]                                     ; $5043: $34
    ld   a, [hl]                                  ; $5044: $7E
    cp   $0A                                      ; $5045: $FE $0A
    ret  c                                        ; $5047: $D8

    xor  a                                        ; $5048: $AF
    ld   [hl], a                                  ; $5049: $77
    ld   a, [wEntitiesPosXTable+1]                ; $504A: $FA $01 $C2
    xor  $01                                      ; $504D: $EE $01
    ld   [wEntitiesPosXTable+1], a                ; $504F: $EA $01 $C2
    ld   hl, wEntitiesPosXTable+3                 ; $5052: $21 $03 $C2
    dec  [hl]                                     ; $5055: $35
    ld   a, [wEntitiesPosXTable+2]                ; $5056: $FA $02 $C2
    add  $04                                      ; $5059: $C6 $04
    ld   [wEntitiesPosXTable+2], a                ; $505B: $EA $02 $C2
    bit  7, a                                     ; $505E: $CB $7F
    ret  nz                                       ; $5060: $C0

    cp   $3E                                      ; $5061: $FE $3E
    ret  c                                        ; $5063: $D8

    ld   a, $02                                   ; $5064: $3E $02
    ld   [wEntitiesPosXTable+1], a                ; $5066: $EA $01 $C2
    ld   a, $3E                                   ; $5069: $3E $3E
    ld   [wEntitiesPosXTable+2], a                ; $506B: $EA $02 $C2
    ret                                           ; $506E: $C9

JumpTable_037_506F::
    call func_037_5028                            ; $506F: $CD $28 $50
    ld   hl, wEntitiesPosYTable+3                 ; $5072: $21 $13 $C2
    inc  [hl]                                     ; $5075: $34
    ld   a, [hl]                                  ; $5076: $7E
    cp   $30                                      ; $5077: $FE $30
    ret  nz                                       ; $5079: $C0

    xor  a                                        ; $507A: $AF
    ld   [hl], a                                  ; $507B: $77
.func_037_507C::
    ld   hl, wEntitiesPosYTable+5                 ; $507C: $21 $15 $C2
    inc  [hl]                                     ; $507F: $34
    ret                                           ; $5080: $C9

JumpTable_037_5081::
    call func_037_5028                            ; $5081: $CD $28 $50
    ld   hl, wEntitiesPosYTable+15                ; $5084: $21 $1F $C2
    inc  [hl]                                     ; $5087: $34
    ld   a, [hl]                                  ; $5088: $7E
    cp   $0A                                      ; $5089: $FE $0A
    ret  c                                        ; $508B: $D8

    xor  a                                        ; $508C: $AF
    ld   [hl], a                                  ; $508D: $77
    ld   a, [wEntitiesPosYTable+11]               ; $508E: $FA $1B $C2
    and  $01                                      ; $5091: $E6 $01
    xor  $01                                      ; $5093: $EE $01
    ld   [wEntitiesPosYTable+11], a               ; $5095: $EA $1B $C2
    ld   a, [wEntitiesPosYTable+12]               ; $5098: $FA $1C $C2
    add  $04                                      ; $509B: $C6 $04
    cp   $70                                      ; $509D: $FE $70
    jr   c, .else_50A6_37                         ; $509F: $38 $05

    call JumpTable_037_506F.func_037_507C         ; $50A1: $CD $7C $50
    ld   a, $70                                   ; $50A4: $3E $70

.else_50A6_37:
    ld   [wEntitiesPosYTable+12], a               ; $50A6: $EA $1C $C2
    ret                                           ; $50A9: $C9

JumpTable_037_50AA::
    call func_037_5028                            ; $50AA: $CD $28 $50
    ld   hl, wEntitiesPosYTable+15                ; $50AD: $21 $1F $C2
    inc  [hl]                                     ; $50B0: $34
    ld   a, [hl]                                  ; $50B1: $7E
    cp   $0A                                      ; $50B2: $FE $0A
    ret  c                                        ; $50B4: $D8

    xor  a                                        ; $50B5: $AF
    ld   [hl], a                                  ; $50B6: $77
    ld   a, [wEntitiesPosYTable+11]               ; $50B7: $FA $1B $C2
    or   $02                                      ; $50BA: $F6 $02
    xor  $01                                      ; $50BC: $EE $01
    ld   [wEntitiesPosYTable+11], a               ; $50BE: $EA $1B $C2
    ld   a, [wEntitiesPosYTable+12]               ; $50C1: $FA $1C $C2
    sub  $04                                      ; $50C4: $D6 $04
    cp   $54                                      ; $50C6: $FE $54
    jr   nc, .else_50D1_37                        ; $50C8: $30 $07

    call JumpTable_037_506F.func_037_507C         ; $50CA: $CD $7C $50
    ld   [hl], $00                                ; $50CD: $36 $00
    ld   a, $52                                   ; $50CF: $3E $52

.else_50D1_37:
    ld   [wEntitiesPosYTable+12], a               ; $50D1: $EA $1C $C2
    ret                                           ; $50D4: $C9

JumpTable_037_50D5::
    ld   hl, wEntitiesPosYTable+10                ; $50D5: $21 $1A $C2
    inc  [hl]                                     ; $50D8: $34
    ld   a, [hl]                                  ; $50D9: $7E
    cp   $0A                                      ; $50DA: $FE $0A
    ret  c                                        ; $50DC: $D8

    xor  a                                        ; $50DD: $AF
    ld   [hl], a                                  ; $50DE: $77
    ld   a, [wEntitiesPosYTable+9]                ; $50DF: $FA $19 $C2
    xor  $01                                      ; $50E2: $EE $01
    ld   [wEntitiesPosYTable+9], a                ; $50E4: $EA $19 $C2
    ld   a, [wEntitiesPosYTable+7]                ; $50E7: $FA $17 $C2
    sub  $04                                      ; $50EA: $D6 $04
    ld   [wEntitiesPosYTable+7], a                ; $50EC: $EA $17 $C2
    cp   $80                                      ; $50EF: $FE $80
    jr   c, .else_50F8_37                         ; $50F1: $38 $05

    ld   hl, wEntitiesPosYTable+6                 ; $50F3: $21 $16 $C2
    dec  [hl]                                     ; $50F6: $35
    ret                                           ; $50F7: $C9

.else_50F8_37:
    ld   a, $80                                   ; $50F8: $3E $80
    ld   [wEntitiesPosYTable+7], a                ; $50FA: $EA $17 $C2
    xor  a                                        ; $50FD: $AF
    ld   [wEntitiesPosYTable+9], a                ; $50FE: $EA $19 $C2
    call_open_dialog Dialog23C                      ; $5101
    call JumpTable_037_506F.func_037_507C         ; $5106: $CD $7C $50
    ret                                           ; $5109: $C9

JumpTable_037_510A::
    ld   a, $04                                   ; $510A: $3E $04
    ld   [wEntitiesPosXTable+1], a                ; $510C: $EA $01 $C2
    ld   a, [wEntitiesPosYTable+11]               ; $510F: $FA $1B $C2
    and  $01                                      ; $5112: $E6 $01
    or   $04                                      ; $5114: $F6 $04
    ld   [wEntitiesPosYTable+11], a               ; $5116: $EA $1B $C2
    ldh  a, [hFrameCounter]                       ; $5119: $F0 $E7
    and  %00000111                                ; $511B: $E6 $07
    jr   nz, .else_5127_37                        ; $511D: $20 $08

    ld   a, [wEntitiesPosYTable+11]               ; $511F: $FA $1B $C2
    xor  $01                                      ; $5122: $EE $01
    ld   [wEntitiesPosYTable+11], a               ; $5124: $EA $1B $C2

.else_5127_37:
    ldh  a, [hFrameCounter]                       ; $5127: $F0 $E7
    and  $01                                      ; $5129: $E6 $01
    jr   nz, .else_5131_37                        ; $512B: $20 $04

    ld   hl, wEntitiesPosYTable+13                ; $512D: $21 $1D $C2
    inc  [hl]                                     ; $5130: $34

.else_5131_37:
    ld   hl, wEntitiesPosYTable+10                ; $5131: $21 $1A $C2
    inc  [hl]                                     ; $5134: $34
    ld   a, [hl]                                  ; $5135: $7E
    cp   $0A                                      ; $5136: $FE $0A
    ret  c                                        ; $5138: $D8

    xor  a                                        ; $5139: $AF
    ld   [hl], a                                  ; $513A: $77
    ld   a, [wEntitiesPosYTable+9]                ; $513B: $FA $19 $C2
    xor  $01                                      ; $513E: $EE $01
    ld   [wEntitiesPosYTable+9], a                ; $5140: $EA $19 $C2
    ld   hl, wEntitiesPosYTable+6                 ; $5143: $21 $16 $C2
    dec  [hl]                                     ; $5146: $35
    ld   a, [wEntitiesPosYTable+7]                ; $5147: $FA $17 $C2
    sub  $04                                      ; $514A: $D6 $04
    ld   [wEntitiesPosYTable+7], a                ; $514C: $EA $17 $C2
    cp   $58                                      ; $514F: $FE $58
    ret  nc                                       ; $5151: $D0

    ld   a, $56                                   ; $5152: $3E $56
    ld   [wEntitiesPosYTable+7], a                ; $5154: $EA $17 $C2
    ld   a, $04                                   ; $5157: $3E $04
    ld   [wEntitiesPosYTable+9], a                ; $5159: $EA $19 $C2
    call_open_dialog Dialog249                      ; $515C
    call JumpTable_037_506F.func_037_507C         ; $5161: $CD $7C $50
    ret                                           ; $5164: $C9

JumpTable_037_5165::
    ld   a, $04                                   ; $5165: $3E $04
    ld   [wEntitiesPosXTable+1], a                ; $5167: $EA $01 $C2
    ld   hl, wEntitiesPosYTable+3                 ; $516A: $21 $13 $C2
    inc  [hl]                                     ; $516D: $34
    ld   a, [hl]                                  ; $516E: $7E
    cp   $40                                      ; $516F: $FE $40
    ret  nz                                       ; $5171: $C0

    xor  a                                        ; $5172: $AF
    ld   [hl], a                                  ; $5173: $77
    jp   JumpTable_037_506F.func_037_507C         ; $5174: $C3 $7C $50

JumpTable_037_5177::
    ld   a, $05                                   ; $5177: $3E $05
    ld   [wEntitiesPosXTable+1], a                ; $5179: $EA $01 $C2
    ld   a, $05                                   ; $517C: $3E $05
    ld   [wEntitiesPosYTable+9], a                ; $517E: $EA $19 $C2
    ld   hl, wEntitiesPosYTable+3                 ; $5181: $21 $13 $C2
    inc  [hl]                                     ; $5184: $34
    ld   a, [hl]                                  ; $5185: $7E
    cp   $40                                      ; $5186: $FE $40
    ret  nz                                       ; $5188: $C0

    xor  a                                        ; $5189: $AF
    ld   [hl], a                                  ; $518A: $77
    ld   hl, wEntitiesPosYTable+4                 ; $518B: $21 $14 $C2
    inc  [hl]                                     ; $518E: $34
    jp   JumpTable_037_506F.func_037_507C         ; $518F: $C3 $7C $50

JumpTable_037_5192::
    ld   a, [wEntitiesPosYTable+4]                ; $5192: $FA $14 $C2
    and  a                                        ; $5195: $A7
    ret  nz                                       ; $5196: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $5197: $21 $13 $C2
    inc  [hl]                                     ; $519A: $34
    ld   a, [hl]                                  ; $519B: $7E
    cp   $20                                      ; $519C: $FE $20
    ret  nz                                       ; $519E: $C0

    xor  a                                        ; $519F: $AF
    ld   [wEntitiesPosYTable+9], a                ; $51A0: $EA $19 $C2
    call_open_dialog Dialog254                      ; $51A3
    jp   JumpTable_037_506F.func_037_507C         ; $51A8: $C3 $7C $50

JumpTable_037_51AB::
    ld   a, $04                                   ; $51AB: $3E $04
    ld   [wEntitiesPosXTable+1], a                ; $51AD: $EA $01 $C2
    ld   a, [wEntitiesPosYTable+7]                ; $51B0: $FA $17 $C2
    cp   $28                                      ; $51B3: $FE $28
    jr   nc, .else_51CE_37                        ; $51B5: $30 $17

    call func_1A22                                ; $51B7: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $51BA: $FA $6B $C1
    cp   $04                                      ; $51BD: $FE $04
    jr   nz, .else_51D5_37                        ; $51BF: $20 $14

    call IncrementGameplaySubtype_37              ; $51C1: $CD $FE $53
    ld   a, [wPhotos2]                            ; $51C4: $FA $0D $DC
    or   $02                                      ; $51C7: $F6 $02
    ld   [wPhotos2], a                            ; $51C9: $EA $0D $DC
    jr   .else_51D5_37                            ; $51CC: $18 $07

.else_51CE_37:
    xor  a                                        ; $51CE: $AF
    ld   [wC16C], a                               ; $51CF: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $51D2: $EA $6B $C1

.else_51D5_37:
    ld   hl, wEntitiesPosYTable+10                ; $51D5: $21 $1A $C2
    inc  [hl]                                     ; $51D8: $34
    ld   a, [hl]                                  ; $51D9: $7E
    cp   $06                                      ; $51DA: $FE $06
    ret  c                                        ; $51DC: $D8

    xor  a                                        ; $51DD: $AF
    ld   [hl], a                                  ; $51DE: $77
    ld   a, [wEntitiesPosYTable+9]                ; $51DF: $FA $19 $C2
    xor  $01                                      ; $51E2: $EE $01
    ld   [wEntitiesPosYTable+9], a                ; $51E4: $EA $19 $C2
    ld   a, [wEntitiesPosYTable+7]                ; $51E7: $FA $17 $C2
    sub  $04                                      ; $51EA: $D6 $04
    ld   [wEntitiesPosYTable+7], a                ; $51EC: $EA $17 $C2
    ld   hl, wEntitiesPosYTable+6                 ; $51EF: $21 $16 $C2
    inc  [hl]                                     ; $51F2: $34
    ret                                           ; $51F3: $C9

JumpTable_037_51F4::
    ld   a, $1C                                   ; $51F4: $3E $1C
    ld   [wEntitiesPosXTable], a                  ; $51F6: $EA $00 $C2
    ldh  a, [hJoypadState]                        ; $51F9: $F0 $CC
    and  J_START                                  ; $51FB: $E6 $80
    jr   z, .else_51FF_37                         ; $51FD: $28 $00

.else_51FF_37:
    call JumpTable_037_532E                       ; $51FF: $CD $2E $53
    call func_037_533F                            ; $5202: $CD $3F $53
    call func_037_5216                            ; $5205: $CD $16 $52
    call func_037_4552                            ; $5208: $CD $52 $45
    ld   a, $37                                   ; $520B: $3E $37
    call func_A9B                                 ; $520D: $CD $9B $0A
    ld   a, $37                                   ; $5210: $3E $37
    call SwitchBank                               ; $5212: $CD $0C $08
    ret                                           ; $5215: $C9

func_037_5216::
    ld   a, [wEntitiesPosXTable+5]                ; $5216: $FA $05 $C2
    JP_TABLE                                      ; $5219: $C7
    dw JumpTable_037_5228
    dw JumpTable_037_5257
    dw JumpTable_037_526F
    dw JumpTable_037_527D
    dw JumpTable_037_52EE
    dw JumpTable_037_52FB
    dw JumpTable_037_530D

JumpTable_037_5228::
    ld   hl, wEntitiesPosYTable+3                 ; $5228: $21 $13 $C2
    inc  [hl]                                     ; $522B: $34
    ld   a, [hl]                                  ; $522C: $7E
    cp   $08                                      ; $522D: $FE $08
    ret  nz                                       ; $522F: $C0

    xor  a                                        ; $5230: $AF
    ld   [hl], a                                  ; $5231: $77
    ld   a, [wEntitiesSpeedXTable+14]             ; $5232: $FA $4E $C2
    xor  $01                                      ; $5235: $EE $01
    ld   [wEntitiesSpeedXTable+14], a             ; $5237: $EA $4E $C2
    ld   a, [wEntitiesSpeedYTable]                ; $523A: $FA $50 $C2
    sub  $03                                      ; $523D: $D6 $03
    ld   [wEntitiesSpeedYTable], a                ; $523F: $EA $50 $C2
    cp   $6C                                      ; $5242: $FE $6C
    ret  nc                                       ; $5244: $D0

    ld   a, $6E                                   ; $5245: $3E $6E
    ld   [wEntitiesSpeedYTable], a                ; $5247: $EA $50 $C2
    xor  a                                        ; $524A: $AF
    ld   [wEntitiesSpeedXTable+14], a             ; $524B: $EA $4E $C2
    call func_037_49CE                            ; $524E: $CD $CE $49
    call_open_dialog Dialog2AF                      ; $5251
    ret                                           ; $5256: $C9

JumpTable_037_5257::
    ld   a, [wDialogState]                        ; $5257: $FA $9F $C1
    and  a                                        ; $525A: $A7
    ret  nz                                       ; $525B: $C0

    call_open_dialog Dialog12E                      ; $525C
    ld   a, $01                                   ; $5261: $3E $01
    ld   [wEntitiesPosXTable+1], a                ; $5263: $EA $01 $C2
    ld   hl, wEntitiesPosXTable+2                 ; $5266: $21 $02 $C2
    dec  [hl]                                     ; $5269: $35
    dec  [hl]                                     ; $526A: $35
    call func_037_49CE                            ; $526B: $CD $CE $49

.ret_526E
    ret                                           ; $526E: $C9

JumpTable_037_526F::
    ld   a, [wDialogState]                        ; $526F: $FA $9F $C1
    and  a                                        ; $5272: $A7
    ret  nz                                       ; $5273: $C0

    ld   a, $01                                   ; $5274: $3E $01
    ld   [wEntitiesSpeedXTable+14], a             ; $5276: $EA $4E $C2
    call func_037_49CE                            ; $5279: $CD $CE $49
    ret                                           ; $527C: $C9

JumpTable_037_527D::
    call func_037_52B0                            ; $527D: $CD $B0 $52
    ld   hl, wEntitiesPosYTable+3                 ; $5280: $21 $13 $C2
    inc  [hl]                                     ; $5283: $34
    ld   a, [hl]                                  ; $5284: $7E
    cp   $08                                      ; $5285: $FE $08
    ret  nz                                       ; $5287: $C0

    xor  a                                        ; $5288: $AF
    ld   [hl], a                                  ; $5289: $77
    ld   a, [wEntitiesSpeedXTable+14]             ; $528A: $FA $4E $C2
    xor  $01                                      ; $528D: $EE $01
    ld   [wEntitiesSpeedXTable+14], a             ; $528F: $EA $4E $C2
    ld   a, [wEntitiesSpeedXTable+15]             ; $5292: $FA $4F $C2
    add  $02                                      ; $5295: $C6 $02
    ld   [wEntitiesSpeedXTable+15], a             ; $5297: $EA $4F $C2
    push af                                       ; $529A: $F5
    and  %00000011                                ; $529B: $E6 $03
    jr   nz, .else_52A3_37                        ; $529D: $20 $04

    ld   hl, wEntitiesSpeedYTable                 ; $529F: $21 $50 $C2
    dec  [hl]                                     ; $52A2: $35

.else_52A3_37:
    pop  af                                       ; $52A3: $F1
    cp   $B0                                      ; $52A4: $FE $B0
    ret  c                                        ; $52A6: $D8

    call func_037_49CE                            ; $52A7: $CD $CE $49
    call_open_dialog Dialog1F6                      ; $52AA
    ret                                           ; $52AF: $C9

func_037_52B0::
    ld   a, [wEntitiesPosXTable+1]                ; $52B0: $FA $01 $C2
    cp   $05                                      ; $52B3: $FE $05
    ret  z                                        ; $52B5: $C8

    ld   hl, wEntitiesPosXTable+4                 ; $52B6: $21 $04 $C2
    inc  [hl]                                     ; $52B9: $34
    ld   a, [hl]                                  ; $52BA: $7E
    cp   $0A                                      ; $52BB: $FE $0A
    ret  nz                                       ; $52BD: $C0

    xor  a                                        ; $52BE: $AF
    ld   [hl], a                                  ; $52BF: $77
    ld   hl, wEntitiesPosXTable+1                 ; $52C0: $21 $01 $C2
    inc  [hl]                                     ; $52C3: $34
    ld   a, [hl]                                  ; $52C4: $7E
    cp   $05                                      ; $52C5: $FE $05
    jr   nz, .else_52CC_37                        ; $52C7: $20 $03

    ld   a, $01                                   ; $52C9: $3E $01
    ld   [hl], a                                  ; $52CB: $77

.else_52CC_37:
    ld   a, [wEntitiesPosXTable+2]                ; $52CC: $FA $02 $C2
    add  $04                                      ; $52CF: $C6 $04
    cp   $61                                      ; $52D1: $FE $61
    jr   c, .else_52D7_37                         ; $52D3: $38 $02

    ld   a, $61                                   ; $52D5: $3E $61

.else_52D7_37:
    ld   [wEntitiesPosXTable+2], a                ; $52D7: $EA $02 $C2
    ld   a, [wEntitiesPosXTable+3]                ; $52DA: $FA $03 $C2
    sub  $01                                      ; $52DD: $D6 $01
    cp   $55                                      ; $52DF: $FE $55
    jr   nc, .else_52EA_37                        ; $52E1: $30 $07

    ld   a, $05                                   ; $52E3: $3E $05
    ld   [wEntitiesPosXTable+1], a                ; $52E5: $EA $01 $C2
    ld   a, $55                                   ; $52E8: $3E $55

.else_52EA_37:
    ld   [wEntitiesPosXTable+3], a                ; $52EA: $EA $03 $C2
    ret                                           ; $52ED: $C9

JumpTable_037_52EE::
    ld   a, [wDialogState]                        ; $52EE: $FA $9F $C1
    and  a                                        ; $52F1: $A7
    ret  nz                                       ; $52F2: $C0

    ld   a, $06                                   ; $52F3: $3E $06
    ld   [wEntitiesPosXTable+1], a                ; $52F5: $EA $01 $C2
    jp   func_037_49CE                            ; $52F8: $C3 $CE $49

JumpTable_037_52FB::
    ld   hl, wEntitiesPosYTable+3                 ; $52FB: $21 $13 $C2
    inc  [hl]                                     ; $52FE: $34
    ld   a, [hl]                                  ; $52FF: $7E
    cp   $30                                      ; $5300: $FE $30
    ret  nz                                       ; $5302: $C0

    xor  a                                        ; $5303: $AF
    ld   [hl], a                                  ; $5304: $77
    inc  a                                        ; $5305: $3C
    ld   [wEntitiesPosYTable+4], a                ; $5306: $EA $14 $C2
    call func_037_49CE                            ; $5309: $CD $CE $49
    ret                                           ; $530C: $C9

JumpTable_037_530D::
    ld   a, [wEntitiesPosYTable+4]                ; $530D: $FA $14 $C2
    and  a                                        ; $5310: $A7
    ret  nz                                       ; $5311: $C0

    ld   hl, wEntitiesPosYTable+3                 ; $5312: $21 $13 $C2
    inc  [hl]                                     ; $5315: $34
    ld   a, [hl]                                  ; $5316: $7E
    cp   $50                                      ; $5317: $FE $50
    ret  nz                                       ; $5319: $C0

    xor  a                                        ; $531A: $AF
    ld   [hl], a                                  ; $531B: $77
    ld   [wC16C], a                               ; $531C: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $531F: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $5322: $CD $FE $53
    ld   a, [wPhotos2]                            ; $5325: $FA $0D $DC
    or   $04                                      ; $5328: $F6 $04
    ld   [wPhotos2], a                            ; $532A: $EA $0D $DC
    ret                                           ; $532D: $C9

JumpTable_037_532E::
    ld   hl, Data_037_59DD                        ; $532E: $21 $DD $59
    ld   a, [wEntitiesPosXTable+1]                ; $5331: $FA $01 $C2
    ld   e, a                                     ; $5334: $5F
    ld   d, $00                                   ; $5335: $16 $00
    add  hl, de                                   ; $5337: $19
    ld   c, [hl]                                  ; $5338: $4E
    ld   hl, Data_037_59CF                        ; $5339: $21 $CF $59
    jp   func_037_49E1                            ; $533C: $C3 $E1 $49

func_037_533F::
    ld   c, $08                                   ; $533F: $0E $08
    ld   hl, Data_037_5CDB                        ; $5341: $21 $DB $5C
    ld   a, [wEntitiesSpeedXTable+14]             ; $5344: $FA $4E $C2
    sla  a                                        ; $5347: $CB $27
    ld   e, a                                     ; $5349: $5F
    ld   d, $00                                   ; $534A: $16 $00
    add  hl, de                                   ; $534C: $19
    ld   a, [hl+]                                 ; $534D: $2A
    ld   h, [hl]                                  ; $534E: $66
    ld   l, a                                     ; $534F: $6F
    ld   a, [wEntitiesSpeedXTable+15]             ; $5350: $FA $4F $C2
    ldh  [hMultiPurpose0], a                      ; $5353: $E0 $D7
    ld   a, [wEntitiesSpeedYTable]                ; $5355: $FA $50 $C2
    ldh  [hMultiPurpose1], a                      ; $5358: $E0 $D8
    call func_037_4AB8                            ; $535A: $CD $B8 $4A
    ret                                           ; $535D: $C9

JumpTable_037_535E::
    ld   hl, wEntitiesPosYTable+3                 ; $535E: $21 $13 $C2
    inc  [hl]                                     ; $5361: $34
    ld   a, [hl]                                  ; $5362: $7E
    cp   $40                                      ; $5363: $FE $40
    ret  nz                                       ; $5365: $C0

    ld   a, [wPhotos2]                            ; $5366: $FA $0D $DC
    or   $08                                      ; $5369: $F6 $08
    ld   [wPhotos2], a                            ; $536B: $EA $0D $DC
    xor  a                                        ; $536E: $AF
    ld   [wC16C], a                               ; $536F: $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ; $5372: $EA $6B $C1
    call IncrementGameplaySubtype_37              ; $5375: $CD $FE $53
    ret                                           ; $5378: $C9

Data_037_5379::
    db   $50, $50, $28, $00, $58, $59, $50, $00, $60, $78, $58, $28, $43

Data_037_5386::
    db   $24, $24, $50, $00, $70, $70, $70, $00, $3C, $40, $40, $72 , $50

JumpTable_037_5393::
    ld   a, [wGameplayType]                       ; $5393: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_MARIN_CLIFF               ; $5396: $FE $10
    jr   nz, .else_539D_37                        ; $5398: $20 $03

    call func_037_4331                            ; $539A: $CD $31 $43

.else_539D_37:
    call func_1A22                                ; $539D: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $53A0: $FA $6B $C1
    cp   $04                                      ; $53A3: $FE $04
    ret  nz                                       ; $53A5: $C0

    call LCDOff                                   ; $53A6: $CD $CF $28
    ld   a, $37                                   ; $53A9: $3E $37
    call LoadBaseTiles_trampoline                 ; $53AB: $CD $BE $0B
    ld   a, [wGameplayType]                       ; $53AE: $FA $95 $DB
    cp   GAMEPLAY_PHOTO_GHOST                     ; $53B1: $FE $19
    jr   nz, .else_53C9_37                        ; $53B3: $20 $14

    ldh  a, [hIsGBC]                              ; $53B5: $F0 $FE
    and  a                                        ; $53B7: $A7
    jr   nz, .else_53BE_37                        ; $53B8: $20 $04

    ld   a, $0E                                   ; $53BA: $3E $0E
    jr   JumpTable_037_5393.func_037_53C0         ; $53BC: $18 $02

.else_53BE_37:
    ld   a, $2E                                   ; $53BE: $3E $2E

JumpTable_037_5393.func_037_53C0::
    ld   b, $42                                   ; $53C0: $06 $42
    ld   c, $06                                   ; $53C2: $0E $06
    ld   h, $37                                   ; $53C4: $26 $37
    call CopyDataToVRAM                           ; $53C6: $CD $13 $0A

.else_53C9_37:
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ; $53C9: $3E $C7
    ld   [wLCDControl], a                         ; $53CB: $EA $FD $D6
    ldh  [rLCDC], a                               ; $53CE: $E0 $40
    ld   hl, Data_037_5379                        ; $53D0: $21 $79 $53
    ld   a, [wGameplayType]                       ; $53D3: $FA $95 $DB
    sub  $0E                                      ; $53D6: $D6 $0E
    ld   e, a                                     ; $53D8: $5F
    ld   d, $00                                   ; $53D9: $16 $00
    add  hl, de                                   ; $53DB: $19
    ld   a, [hl]                                  ; $53DC: $7E
    ld   [wMapEntrancePositionX], a               ; $53DD: $EA $9D $DB
    ld   hl, Data_037_5386                        ; $53E0: $21 $86 $53
    add  hl, de                                   ; $53E3: $19
    ld   a, [hl]                                  ; $53E4: $7E
    ld   [wMapEntrancePositionY], a               ; $53E5: $EA $9E $DB
    xor  a                                        ; $53E8: $AF
    ldh  [hLinkAnimationState], a                 ; $53E9: $E0 $9D
    ld   a, DIRECTION_DOWN                        ; $53EB: $3E $03
    ldh  [hLinkDirection], a                      ; $53ED: $E0 $9E
    ld   a, GAMEPLAY_WORLD                        ; $53EF: $3E $0B
    ld   [wGameplayType], a                       ; $53F1: $EA $95 $DB
    xor  a                                        ; $53F4: $AF
    ld   [wGameplaySubtype], a                    ; $53F5: $EA $96 $DB
    ld   a, TILEMAP_INVENTORY                     ; $53F8: $3E $02
    ld   [wBGMapToLoad], a                        ; $53FA: $EA $FF $D6
    ret                                           ; $53FD: $C9

IncrementGameplaySubtype_37::
    ld   hl, wGameplaySubtype                     ; $53FE: $21 $96 $DB
    inc  [hl]                                     ; $5401: $34
    ret                                           ; $5402: $C9

; Dead-code?
func_037_5403::
    ld   hl, wEntitiesSpriteVariantTable          ; $5403: $21 $B0 $C3
    add  hl, bc                                   ; $5406: $09
    ret                                           ; $5407: $C9

; Dead-code?
func_037_5408::
    ld   hl, wEntitiesSpeedXTable                 ; $5408: $21 $40 $C2
    add  hl, bc                                   ; $540B: $09
    ret                                           ; $540C: $C9

Data_037_540D::
    db   $FF, $47, $CA, $26, $22, $4D, $00, $00
    db   $DF, $5B, $97, $6E, $2E, $6D, $00, $00
    db   $FF, $47, $DF, $3A, $DB, $01, $00, $00
    db   $FF, $47, $00, $76, $22, $4D, $00, $00
    db   $FF, $47, $BC, $06, $83, $26, $00, $00
    db   $FF, $47, $D9, $11, $2D, $00, $68, $04
    db   $FF, $47, $CE, $10, $25, $00, $00, $00
    db   $FF, $47, $D9, $11, $CE, $10, $00, $00
    db   $FE, $63, $00, $00, $83, $26, $DF, $3A
    db   $FE, $63, $00, $00, $FF, $01, $DF, $3A
    db   $FE, $63, $00, $00, $7D, $04, $5F, $5B
    db   $FE, $63, $00, $00, $3A, $00, $FF, $01
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C
    db   $FF, $47, $CA, $26, $40, $01, $00, $00
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C

Data_037_548D::
    db   $FF, $47, $C4, $26, $21, $15, $00, $00, $DF, $5B, $97, $6E, $2E, $6D, $00, $00
    db   $1F, $40, $C4, $26, $21, $15, $00, $00, $FF, $47, $F3, $51, $67, $28, $00, $00
    db   $C4, $26, $21, $15, $31, $46, $00, $00, $FF, $47, $68, $7D, $C5, $4C, $00, $00
    db   $D8, $52, $D9, $11, $CE, $10, $00, $00, $FF, $47, $C4, $26, $21, $15, $00, $00
    db   $FE, $63, $00, $00, $00, $03, $DF, $3A, $FE, $63, $00, $00, $FF, $01, $DF, $3A
    db   $FE, $63, $00, $00, $7D, $04, $5F, $5B, $FE, $63, $00, $00, $31, $46, $FE, $63
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $FE, $63, $00, $00, $DF, $3A, $7D, $04, $00, $00, $00, $00, $00, $00, $00, $00

Data_037_550D::
    db   $FF, $47, $F3, $51, $67, $28, $00, $00, $DF, $5B, $97, $6E, $2E, $6D, $00, $00
    db   $FF, $47, $CA, $26, $21, $15, $00, $00, $FF, $47, $D9, $11, $CE, $10, $00, $00
    db   $FF, $47, $C3, $7C, $00, $2C, $00, $00, $FF, $47, $D9, $11, $21, $15, $00, $00
    db   $FF, $47, $75, $7C, $CA, $26, $00, $00, $FF, $47, $17, $14, $08, $10, $00, $00
    db   $FE, $63, $65, $14, $00, $03, $3F, $53, $DF, $7D, $00, $00, $31, $46, $FE, $63
    db   $FE, $63, $00, $00, $7D, $04, $5F, $5B, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_037_558D::
    db   $7F, $5B, $14, $2E, $4E, $19, $A9, $08, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_037_560D::
    db   $FF, $47, $F4, $41, $68, $7D, $C7, $1C, $DF, $5B, $97, $6E, $2E, $6D, $00, $00
    db   $0F, $4B, $00, $00, $06, $00, $88, $00, $68, $7D, $F3, $51, $C6, $18, $00, $00
    db   $FF, $47, $F3, $51, $67, $28, $00, $00, $FF, $47, $15, $36, $0C, $10, $00, $00
    db   $0F, $4B, $D9, $11, $CE, $10, $00, $00, $F3, $51, $15, $36, $0C, $10, $00, $00
    db   $FE, $63, $65, $14, $00, $03, $FF, $46, $FE, $63, $65, $14, $E5, $7D, $FF, $46
    db   $FE, $63, $00, $00, $7D, $04, $5F, $5B, $FF, $7F, $00, $00, $71, $44, $7F, $7D
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C
    db   $DE, $73, $DF, $1E, $34, $01, $C7, $1C, $FE, $63, $94, $5A, $6A, $39, $C7, $1C

Data_037_568D::
    db   $FF, $47, $CA, $26, $40, $01, $00, $00, $DF, $5B, $97, $6E, $2E, $6D, $00, $00
    db   $FF, $47, $F3, $51, $67, $28, $00, $00, $FF, $47, $D9, $11, $CE, $10, $00, $00
    db   $FF, $47, $17, $14, $DF, $01, $00, $00, $FF, $47, $FF, $7F, $DF, $01, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $FE, $63, $06, $00, $83, $26, $DF, $3A, $C7, $1C, $83, $26, $40, $01, $C7, $1C
    db   $FE, $63, $00, $00, $7D, $04, $5F, $5B, $FF, $7F, $00, $00, $71, $44, $7F, $7D
    db   $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C, $C7, $1C
    db   $DE, $73, $DF, $1E, $34, $01, $C7, $1C, $FE, $63, $94, $5A, $6A, $39, $C7, $1C

Data_037_570D::
    dw   Data_037_558D
    dw   Data_037_558D
    dw   Data_037_540D
    dw   $0000 ; disabled
    dw   Data_037_548D
    dw   Data_037_558D
    dw   Data_037_550D
    dw   $0000 ; disabled
    dw   Data_037_558D
    dw   Data_037_558D
    dw   Data_037_560D
    dw   Data_037_568D
    dw   Data_037_558D

; Array indexed by photo id
Data_037_5727::
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $08, $58, $2A, $00
    db   $00, $00, $00, $00
    db   $00, $00, $00, $00
    db   $08, $48, $2B, $00
    db   $00, $00, $00, $00
    db   $08, $68, $2B, $00
    db   $00, $00, $00, $00

Data_037_575B::
    db   $00, $10, $00, $20, $00, $08, $02, $20, $00, $00, $04, $20, $10, $08, $06, $20

Data_037_576B::
    db   $00, $10, $08, $20, $00, $08, $0A, $20, $00, $00, $0C, $20, $10, $10, $0E, $20
    db   $10, $08, $10, $20, $10, $00, $12, $20

Data_037_5783::
    db   $00, $10, $08, $20, $00, $08, $0A, $20, $00, $00, $0C, $20, $10, $10, $64, $20
    db   $10, $08, $66, $20, $10, $00, $68, $20

Data_037_579B::
    db   $00, $FC, $14, $00, $00, $04, $16, $00, $00, $0C, $18, $00
    db   $10, $FC, $1A, $00, $10, $04, $1C, $00, $10, $0C, $1E, $00

Data_037_57B3::
    dw   Data_037_575B
    dw   Data_037_576B
    dw   Data_037_575B
    dw   Data_037_5783
    dw   Data_037_579B

Data_037_57BD::
    db   $10, $18, $10, $18, $18

Data_037_57C2:
    db   $00, $00, $0A, $00, $10, $08, $0C, $00
    db   $08, $10, $0E, $00, $08, $18, $10, $00

Data_037_57D2:
    db   $00, $00, $1C, $00, $10, $08, $1E, $00
    db   $08, $10, $20, $00, $08, $18, $22, $00

Data_037_57E2::
    dw   Data_037_57C2
    dw   Data_037_57D2

Data_037_57E6::
    db   $00, $00, $1E, $00
    db   $00, $08, $20, $00, $00, $10, $22, $00   ; $57EA
    db   $10, $00, $24, $00, $10, $08, $26, $00   ; $57F2
    db   $10, $10, $28, $00, $10, $18, $2A, $00   ; $57FA

Data_037_5802::
    db   $08, $00, $00, $00, $08, $08, $02, $00   ; $5802
    db   $08, $10, $04, $00, $18, $00, $06, $00   ; $580A
    db   $18, $08, $08, $00                       ; $5812

Data_037_5816::
    db   $00, $00, $0C, $00
    db   $00, $08, $0E, $00, $00, $10, $10, $00   ; $581A
    db   $10, $F8, $0A, $00, $10, $00, $12, $00   ; $5822
    db   $10, $08, $14, $00, $10, $10, $16, $00   ; $582A

Data_037_5832::
    db   $00, $00, $0C, $00, $00, $08, $0E, $00   ; $5832
    db   $00, $10, $10, $00, $10, $00, $18, $00   ; $583A
    db   $10, $08, $1A, $00, $10, $10, $1C, $00   ; $5842

Data_037_584A::
    db   $00, $00, $1E, $00, $00, $08, $20, $00   ; $584A
    db   $00, $10, $22, $00, $10, $00, $2C, $00   ; $5852
    db   $10, $08, $60, $00, $10, $10, $28, $00   ; $585A
    db   $10, $18, $2A, $00                       ; $5862

Data_037_5866::
    dw   Data_037_57E6
    dw   Data_037_5802
    dw   Data_037_5816
    dw   Data_037_5832
    dw   Data_037_584A

Data_037_5870::
    db   $1C, $14, $1C, $18, $1C

Data_037_5875:
    db   $00, $00, $00, $00, $00, $08, $02, $00
    db   $10, $00, $04, $00, $10, $08, $06, $00

Data_037_5885:
    db   $00, $00, $08, $00, $00, $08, $0A, $00
    db   $10, $00, $0C, $00, $10, $08, $0E, $00

Data_037_5895:
    db   $00, $00, $10, $00, $00, $08, $12, $00
    db   $10, $00, $14, $00, $10, $08, $16, $00

Data_037_58A5:
    db   $00, $00, $30, $00, $00, $08, $32, $00
    db   $00, $10, $34, $00, $10, $00, $36, $00
    db   $10, $08, $38, $00, $10, $10, $3A, $00

Data_037_58BD:
    dw   Data_037_5875
    dw   Data_037_5885
    dw   Data_037_5895
    dw   Data_037_58A5

Data_037_58C5::
    db   $00, $10, $00, $20, $00, $08, $02, $20   ; $58C5
    db   $00, $00, $04, $20, $10, $08, $06, $20   ; $58CD

Data_037_58D5::
    db   $00, $10, $08, $20, $00, $08, $0A, $20   ; $58D5
    db   $00, $00, $0C, $20, $10, $10, $0E, $20   ; $58DD
    db   $10, $08, $10, $20, $10, $00, $12, $20   ; $58E5

Data_037_58ED::
    db   $00, $10, $08, $20, $00, $08, $0A, $20   ; $58ED
    db   $00, $00, $0C, $20, $10, $10, $7A, $20   ; $58F5
    db   $10, $08, $7C, $20, $10, $00, $7E, $20   ; $58FD

Data_037_5905::
    db   $00, $00, $14, $00, $00, $08, $16, $00   ; $5905
    db   $00, $10, $18, $00, $10, $00, $1A, $00   ; $590D
    db   $10, $08, $1C, $00, $10, $10, $1E, $00   ; $5915

Data_037_591D::
    db   $00, $00, $20, $00, $00, $08, $22, $00   ; $591D
    db   $00, $10, $24, $00, $10, $00, $26, $00   ; $5925
    db   $10, $08, $52, $00, $10, $10, $54, $00   ; $592D

Data_037_5935::
    dw   Data_037_58C5
    dw   Data_037_58D5
    dw   Data_037_58C5
    dw   Data_037_58ED
    dw   Data_037_5905
    dw   Data_037_591D

Data_037_5941::
    db   $10, $18, $10, $18, $18, $18

Data_037_5947::
    db   $00, $FE, $54, $00, $00, $06, $56, $00   ; $5947
    db   $00, $0E, $58, $00, $0F, $00, $5A, $00   ; $594F
    db   $0F, $07, $5A, $20                       ; $5957

Data_037_595B::
    db   $FB, $00, $5C, $00, $FB, $08, $5E, $00   ; $595B
    db   $FB, $10, $60, $00, $0B, $00, $62, $00   ; $5963
    db   $0B, $08, $64, $00, $0B, $10, $66, $00   ; $596B

Data_037_5973::
    db   $FC, $00, $40, $00, $FC, $08, $42, $00   ; $5973
    db   $FC, $10, $44, $00, $0C, $00, $46, $00   ; $597B
    db   $0C, $08, $48, $00, $0C, $10, $4A, $00   ; $5983

Data_037_598B::
    db   $FC, $00, $68, $00, $FC, $08, $6A, $00   ; $598B
    db   $FC, $10, $6C, $00, $0C, $00, $6E, $00   ; $5993
    db   $0C, $08, $70, $00, $0C, $10, $72, $00   ; $599B

Data_037_59A3::
    db   $00, $02, $4C, $00, $00, $0A, $4E, $00   ; $59A3
    db   $00, $12, $50, $00, $10, $04, $52, $00   ; $59AB
    db   $10, $0C, $52, $20                       ; $59B3

Data_037_59B7::
    db   $FB, $FF, $74, $00, $FB, $07, $76, $00   ; $59B7
    db   $FB, $0F, $78, $00, $0B, $FF, $7A, $00   ; $59BF
    db   $0B, $07, $7C, $00, $0B, $0F, $7E, $00   ; $59C7

Data_037_59CF::
    dw   Data_037_5947
    dw   Data_037_595B
    dw   Data_037_5973
    dw   Data_037_595B
    dw   Data_037_598B
    dw   Data_037_59A3
    dw   Data_037_59B7

Data_037_59DD::
    db   $14, $18, $18, $18, $18, $14, $18        ; $59DD

Data_037_59E4::
    db   $00, $10, $34, $21, $00, $08, $36, $21   ; $59E4
    db   $00, $00, $38, $21, $10, $10, $3A, $21   ; $59EC
    db   $10, $08, $3C, $21, $10, $00, $3E, $21   ; $59F4

Data_037_59FC::
    db   $00, $10, $28, $21, $00, $08, $2A, $21   ; $59FC
    db   $00, $00, $2C, $21, $10, $10, $2E, $21   ; $5A04
    db   $10, $08, $30, $21, $10, $00, $32, $21   ; $5A0C

Data_037_5A14::
    db   $00, $10, $28, $21, $00, $08, $2A, $21   ; $5A14
    db   $00, $00, $2C, $21, $10, $10, $70, $21   ; $5A1C
    db   $10, $08, $72, $21, $10, $00, $74, $21   ; $5A24

Data_037_5A2C::
    db   $00, $00, $20, $01, $00, $08, $22, $01   ; $5A2C
    db   $00, $0F, $22, $21, $00, $17, $20, $21   ; $5A34
    db   $10, $00, $24, $01, $10, $08, $26, $01   ; $5A3C
    db   $10, $0F, $26, $21, $10, $17, $24, $21   ; $5A44

Data_037_5A4C::
    dw   Data_037_59E4
    dw   Data_037_59FC
    dw   Data_037_59E4
    dw   Data_037_5A14
    dw   Data_037_5A2C

Data_037_5A56::
    db   $18, $18, $18, $18, $20

Data_037_5A5B:
    db   $00, $00, $00, $01, $00, $08, $02, $03
    db   $00, $10, $04, $03, $10, $00, $06, $01
    db   $10, $10, $08, $01, $10, $08, $24, $01

Data_037_5A73:
    db   $00, $00, $12, $01, $00, $08, $14, $03
    db   $00, $10, $16, $03, $10, $00, $18, $01
    db   $10, $10, $1A, $01, $10, $08, $26, $01

Data_037_5A8B::
    dw   Data_037_5A5B
    dw   Data_037_5A73

Data_037_5A8F:
    db   $00, $00, $8C, $03, $00, $08, $8E, $03

Data_037_5A97:
    db   $00, $08, $88, $23, $00, $00, $8A, $23

Data_037_5A9F:
    db   $00, $08, $8C, $23, $00, $00, $8E, $23

Data_037_5AA7::
    dw   Data_037_5A8F
    dw   Data_037_5A97
    dw   Data_037_5A9F

Data_037_5AAD:
    db   $00, $00, $8E, $23, $00, $08, $8C, $23

Data_037_5AB5:
    db   $00, $00, $8A, $23, $00, $08, $88, $23

Data_037_5ABD:
    db   $00, $00, $8C, $03, $00, $08, $8E, $03

Data_037_5AC5:
    db   $00, $00, $88, $03, $00, $08, $8A, $03

Data_037_5ACD:
    db   $00, $00, $80, $03, $00, $08, $82, $03

Data_037_5AD5:
    db   $00, $00, $84, $03, $00, $08, $86, $03

Data_037_5ADD::
    dw   Data_037_5AAD
    dw   Data_037_5AB5
    dw   Data_037_5ABD
    dw   Data_037_5AC5
    dw   Data_037_5ACD
    dw   Data_037_5AD5

Data_037_5AE9::
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $5AE9
    db   $00, $10, $68, $01, $10, $08, $6A, $01   ; $5AF1
    db   $10, $10, $6C, $01                       ; $5AF9

Data_037_5AFD::
    db   $00, $00, $34, $01, $00, $08, $36, $01   ; $5AFD
    db   $00, $10, $38, $01, $10, $00, $3A, $01   ; $5B05
    db   $10, $08, $3C, $01, $10, $10, $3E, $01   ; $5B0D

Data_037_5B15::
    db   $00, $00, $34, $01, $00, $08, $36, $01   ; $5B15
    db   $00, $10, $38, $01, $10, $00, $4C, $01   ; $5B1D
    db   $10, $08, $4E, $01, $10, $10, $50, $01   ; $5B25

Data_037_5B2D::
    db   $00, $00, $58, $01, $00, $08, $5A, $01   ; $5B2D
    db   $00, $10, $5C, $01, $10, $00, $5E, $01   ; $5B35
    db   $10, $08, $60, $01, $10, $10, $62, $01   ; $5B3D

Data_037_5B45::
    db   $00, $00, $6E, $01, $00, $08, $70, $01   ; $5B45
    db   $00, $10, $72, $01, $10, $00, $74, $01   ; $5B4D
    db   $10, $08, $76, $01, $10, $10, $78, $01   ; $5B55

Data_037_5B5D::
    dw   Data_037_5AE9
    dw   Data_037_5AFD
    dw   Data_037_5AE9
    dw   Data_037_5B15
    dw   Data_037_5B2D
    dw   Data_037_5B45

Data_037_5B69::
    db   $14, $18, $14, $18, $18, $18             ; $5B69

Data_037_5B6F::
    db   $F0, $F4, $3E, $01, $F0, $FC, $40, $01   ; $5B6F
    db   $F0, $04, $42, $01, $00, $F4, $44, $01   ; $5B77
    db   $00, $FC, $46, $01, $00, $04, $48, $01   ; $5B7F

Data_037_5B87::
    db   $F0, $F4, $4A, $01, $F0, $FC, $4C, $01   ; $5B87
    db   $F0, $04, $4E, $01, $00, $F4, $50, $01   ; $5B8F
    db   $00, $FC, $52, $01, $00, $04, $54, $01   ; $5B97

Data_037_5B9F::
    db   $F0, $F4, $42, $21, $F0, $FC, $40, $21   ; $5B9F
    db   $F0, $04, $3E, $21, $00, $F4, $48, $21   ; $5BA7
    db   $00, $FC, $46, $21, $00, $04, $44, $21   ; $5BAF

Data_037_5BB7::
    db   $F0, $F4, $4E, $21, $F0, $FC, $4C, $21   ; $5BB7
    db   $F0, $04, $4A, $21, $00, $F4, $54, $21   ; $5BBF
    db   $00, $FC, $52, $21, $00, $04, $50, $21   ; $5BC7

Data_037_5BCF::
    db   $F0, $F0, $2E, $01, $F0, $F8, $30, $01   ; $5BCF
    db   $F0, $00, $30, $21, $F0, $08, $2E, $21   ; $5BD7
    db   $00, $F0, $32, $01, $00, $F8, $34, $01   ; $5BDF
    db   $00, $00, $34, $21, $00, $08, $32, $21   ; $5BE7

Data_037_5BEF::
    db   $F0, $F0, $36, $01, $F0, $F8, $38, $01   ; $5BEF
    db   $F0, $00, $38, $21, $F0, $08, $36, $21   ; $5BF7
    db   $00, $F0, $3A, $01, $00, $F8, $3C, $01   ; $5BFF
    db   $00, $00, $3C, $21, $00, $08, $3A, $21   ; $5C07

Data_037_5C0F::
    db   $F0, $F0, $56, $01, $F0, $F8, $58, $01   ; $5C0F
    db   $F0, $00, $58, $21, $F0, $08, $56, $21   ; $5C17
    db   $00, $F0, $5A, $01, $00, $F8, $5C, $01   ; $5C1F
    db   $00, $00, $5C, $21, $00, $08, $5A, $21   ; $5C27
    db   $E4, $E6, $7C, $20, $E4, $EE, $7A, $20   ; $5C2F
    db   $E4, $0A, $7A, $00, $E4, $12, $7C, $00   ; $5C37

Data_037_5C3F::
    db   $F0, $F0, $56, $01, $F0, $F8, $58, $01   ; $5C3F
    db   $F0, $00, $58, $21, $F0, $08, $56, $21   ; $5C47
    db   $00, $F0, $5A, $01, $00, $F8, $5C, $01   ; $5C4F
    db   $00, $00, $5C, $21, $00, $08, $5A, $21   ; $5C57
    db   $E2, $E4, $7C, $20, $E2, $EC, $7A, $20   ; $5C5F
    db   $E2, $0C, $7A, $00, $E2, $14, $7C, $00   ; $5C67

Data_037_5C6F::
    dw   Data_037_5B6F
    dw   Data_037_5B87
    dw   Data_037_5B9F
    dw   Data_037_5BB7
    dw   Data_037_5BCF
    dw   Data_037_5BEF
    dw   Data_037_5C0F
    dw   Data_037_5C3F

Data_037_5C7F::
    db   $18, $18, $18, $18, $20, $20, $30, $30   ; $5C7F

Data_037_5C87:
    db   $00, $00, $18, $01, $00, $08, $1A, $01   ; $5C87
    db   $00, $10, $1C, $01, $10, $00, $1E, $01   ; $5C8F
    db   $10, $08, $20, $01, $10, $10, $22, $01   ; $5C97

Data_037_5C9F:
    db   $F8, $00, $24, $01, $F8, $08, $26, $01   ; $5C9F
    db   $F8, $10, $28, $01, $08, $00, $2A, $01   ; $5CA7
    db   $08, $08, $2C, $01, $08, $10, $2E, $01   ; $5CAF

Data_037_5CB7:
    dw   Data_037_5C87
    dw   Data_037_5C9F

Data_037_5CBB::
    db   $00, $00, $0C, $03, $00, $08, $0E, $03   ; $5CBB

Data_037_5CC3::
    db   $00, $00, $08, $03, $00, $08, $0B, $03   ; $5CC3

Data_037_5CCB::
    db   $00, $00, $00, $03, $00, $08, $02, $03   ; $5CCB

Data_037_5CD3::
    db   $00, $00, $04, $03, $00, $08, $06, $03   ; $5CD3

Data_037_5CDB::
    dw   Data_037_5CBB
    dw   Data_037_5CC3
    dw   Data_037_5CCB
    dw   Data_037_5CD3
