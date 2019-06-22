; Disassembly of "game.gbc"
; This file was created with mgbdis v1.0.1 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

    call label_394D                               ; $4000: $CD $4D $39
    call label_3EE8                               ; $4003: $CD $E8 $3E
    ld   hl, wEntitiesUnknownTableB               ; $4006: $21 $B0 $C2
    add  hl, bc                                   ; $4009: $09
    ld   a, [hl]                                  ; $400A: $7E
    JP_TABLE                                      ; $400B: $C7
    ld   d, $40                                   ; $400C: $16 $40
    rst  $20                                      ; $400E: $E7
    ld   b, d                                     ; $400F: $42
    ccf                                           ; $4010: $3F
    ld   c, b                                     ; $4011: $48
    reti                                          ; $4012: $D9

    ld   c, b                                     ; $4013: $48
    ld   a, $49                                   ; $4014: $3E $49
    ld   hl, $C440                                ; $4016: $21 $40 $C4
    add  hl, bc                                   ; $4019: $09
    ld   a, [hl]                                  ; $401A: $7E
    cp   $03                                      ; $401B: $FE $03
    jr   c, jr_004_404E                           ; $401D: $38 $2F

    ld   a, $5C                                   ; $401F: $3E $5C
    call label_3B86                               ; $4021: $CD $86 $3B
    ldh  a, [hScratchA]                               ; $4024: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4026: $21 $00 $C2
    add  hl, de                                   ; $4029: $19
    ld   [hl], a                                  ; $402A: $77
    ldh  a, [hScratchB]                               ; $402B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $402D: $21 $10 $C2
    add  hl, de                                   ; $4030: $19
    sub  $18                                      ; $4031: $D6 $18
    ld   [hl], a                                  ; $4033: $77
    ld   hl, wEntitiesUnknownTableB               ; $4034: $21 $B0 $C2
    add  hl, de                                   ; $4037: $19
    ld   [hl], $02                                ; $4038: $36 $02
    ld   hl, wEntitiesFrameCounterTable           ; $403A: $21 $E0 $C2
    add  hl, de                                   ; $403D: $19
    ld   [hl], $27                                ; $403E: $36 $27
    ld   hl, $C360                                ; $4040: $21 $60 $C3
    add  hl, de                                   ; $4043: $19
    ld   [hl], $08                                ; $4044: $36 $08
    call label_3E34                               ; $4046: $CD $34 $3E
    ld   a, $29                                   ; $4049: $3E $29
    ldh  [hNextSFX], a                            ; $404B: $E0 $F4
    ret                                           ; $404D: $C9

jr_004_404E:
    ld   hl, $C360                                ; $404E: $21 $60 $C3
    add  hl, bc                                   ; $4051: $09
    ld   [hl], $20                                ; $4052: $36 $20
    ld   a, c                                     ; $4054: $79
    ld   [wIntroSubTimer], a                      ; $4055: $EA $02 $D0
    call func_004_42B3                            ; $4058: $CD $B3 $42
    call func_004_7FA3                            ; $405B: $CD $A3 $7F
    ld   hl, $C340                                ; $405E: $21 $40 $C3
    add  hl, bc                                   ; $4061: $09
    ld   [hl], $81                                ; $4062: $36 $81
    ld   hl, $C350                                ; $4064: $21 $50 $C3
    add  hl, bc                                   ; $4067: $09
    ld   [hl], $80                                ; $4068: $36 $80
    call func_004_6E03                            ; $406A: $CD $03 $6E
    ld   hl, $C320                                ; $406D: $21 $20 $C3
    add  hl, bc                                   ; $4070: $09
    dec  [hl]                                     ; $4071: $35
    dec  [hl]                                     ; $4072: $35
    ld   hl, $C310                                ; $4073: $21 $10 $C3
    add  hl, bc                                   ; $4076: $09
    ld   a, [hl]                                  ; $4077: $7E
    ldh  [hFFE8], a                               ; $4078: $E0 $E8
    and  $80                                      ; $407A: $E6 $80
    jr   z, jr_004_4085                           ; $407C: $28 $07

    xor  a                                        ; $407E: $AF
    ld   [hl], a                                  ; $407F: $77
    ld   hl, $C320                                ; $4080: $21 $20 $C3
    add  hl, bc                                   ; $4083: $09
    ld   [hl], b                                  ; $4084: $70

jr_004_4085:
    ldh  a, [hActiveEntityWalking]                               ; $4085: $F0 $F0
    JP_TABLE                                      ; $4087: $C7
    sub  b                                        ; $4088: $90
    ld   b, b                                     ; $4089: $40
    and  e                                        ; $408A: $A3
    ld   b, b                                     ; $408B: $40
    ld   d, l                                     ; $408C: $55
    ld   b, c                                     ; $408D: $41
    inc  d                                        ; $408E: $14
    ld   b, d                                     ; $408F: $42
    ldh  a, [hLinkPositionY]                      ; $4090: $F0 $99
    cp   $70                                      ; $4092: $FE $70
    jr   nc, jr_004_409E                          ; $4094: $30 $08

    call IncrementEntityWalkingAttr               ; $4096: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $4099: $CD $05 $0C
    ld   [hl], $FF                                ; $409C: $36 $FF

jr_004_409E:
    ret                                           ; $409E: $C9

    nop                                           ; $409F: $00
    ld   bc, $0200                                ; $40A0: $01 $00 $02
    call label_C56                                ; $40A3: $CD $56 $0C
    call label_3B70                               ; $40A6: $CD $70 $3B
    call label_3B44                               ; $40A9: $CD $44 $3B
    jr   nc, jr_004_40C7                          ; $40AC: $30 $19

    call label_CB6                                ; $40AE: $CD $B6 $0C
    ld   a, JINGLE_BUMP                           ; $40B1: $3E $09
    ldh  [hJingle], a                             ; $40B3: $E0 $F2
    ld   a, $10                                   ; $40B5: $3E $10
    ld   [$C13E], a                               ; $40B7: $EA $3E $C1
    ld   a, $14                                   ; $40BA: $3E $14
    call label_3BB5                               ; $40BC: $CD $B5 $3B
    ldh  a, [hScratchA]                               ; $40BF: $F0 $D7
    ldh  [hLinkPositionYIncrement], a                               ; $40C1: $E0 $9B
    ldh  a, [hScratchB]                               ; $40C3: $F0 $D8
    ldh  [hLinkPositionXIncrement], a                               ; $40C5: $E0 $9A

jr_004_40C7:
    ld   hl, wEntitiesUnknownTableD               ; $40C7: $21 $D0 $C2
    add  hl, bc                                   ; $40CA: $09
    ld   a, [hl]                                  ; $40CB: $7E
    and  a                                        ; $40CC: $A7
    jr   nz, jr_004_4118                          ; $40CD: $20 $49

    ldh  a, [hFFE8]                               ; $40CF: $F0 $E8
    and  $80                                      ; $40D1: $E6 $80
    jr   z, jr_004_40DF                           ; $40D3: $28 $0A

    ld   hl, $C320                                ; $40D5: $21 $20 $C3
    add  hl, bc                                   ; $40D8: $09
    ld   [hl], $10                                ; $40D9: $36 $10
    ld   a, JINGLE_BIG_BUMP                       ; $40DB: $3E $20
    ldh  [hJingle], a                             ; $40DD: $E0 $F2

jr_004_40DF:
    ldh  a, [hLinkPositionX]                      ; $40DF: $F0 $98
    push af                                       ; $40E1: $F5
    ld   a, $50                                   ; $40E2: $3E $50
    ldh  [hLinkPositionX], a                      ; $40E4: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $40E6: $F0 $99
    push af                                       ; $40E8: $F5
    ld   a, $48                                   ; $40E9: $3E $48
    ldh  [hLinkPositionY], a                      ; $40EB: $E0 $99
    ld   a, $08                                   ; $40ED: $3E $08
    call label_3BAA                               ; $40EF: $CD $AA $3B
    ldh  a, [wActiveEntityPosX]                               ; $40F2: $F0 $EE
    ld   hl, hLinkPositionX                       ; $40F4: $21 $98 $FF
    sub  [hl]                                     ; $40F7: $96
    add  $02                                      ; $40F8: $C6 $02
    cp   $04                                      ; $40FA: $FE $04
    jr   nc, jr_004_410F                          ; $40FC: $30 $11

    ldh  a, [$FFEF]                               ; $40FE: $F0 $EF
    ld   hl, hLinkPositionY                       ; $4100: $21 $99 $FF
    sub  [hl]                                     ; $4103: $96
    add  $02                                      ; $4104: $C6 $02
    cp   $04                                      ; $4106: $FE $04
    jr   nc, jr_004_410F                          ; $4108: $30 $05

    ld   hl, wEntitiesUnknownTableD               ; $410A: $21 $D0 $C2
    add  hl, bc                                   ; $410D: $09
    inc  [hl]                                     ; $410E: $34

jr_004_410F:
    pop  af                                       ; $410F: $F1
    ldh  [hLinkPositionY], a                      ; $4110: $E0 $99
    pop  af                                       ; $4112: $F1
    ldh  [hLinkPositionX], a                      ; $4113: $E0 $98
    call func_004_6DCA                            ; $4115: $CD $CA $6D

jr_004_4118:
    call IsEntityFrameCounterZero                 ; $4118: $CD $05 $0C
    cp   $01                                      ; $411B: $FE $01
    jr   nz, jr_004_4144                          ; $411D: $20 $25

    ld   a, $5C                                   ; $411F: $3E $5C
    call label_3B86                               ; $4121: $CD $86 $3B
    ldh  a, [hScratchA]                               ; $4124: $F0 $D7
    ld   hl, wEntity0PosX                         ; $4126: $21 $00 $C2
    add  hl, de                                   ; $4129: $19
    ld   [hl], a                                  ; $412A: $77
    ldh  a, [hScratchB]                               ; $412B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $412D: $21 $10 $C2
    add  hl, de                                   ; $4130: $19
    sub  $26                                      ; $4131: $D6 $26
    ld   [hl], a                                  ; $4133: $77
    ld   hl, wEntitiesUnknownTableB               ; $4134: $21 $B0 $C2
    add  hl, de                                   ; $4137: $19
    ld   [hl], $02                                ; $4138: $36 $02
    ld   hl, wEntitiesFrameCounterTable           ; $413A: $21 $E0 $C2
    add  hl, de                                   ; $413D: $19
    ld   [hl], $47                                ; $413E: $36 $47
    ld   a, JINGlE_ENNEMY_MORPH_IN                ; $4140: $3E $06
    ldh  [hJingle], a                             ; $4142: $E0 $F2

label_004_4144:
jr_004_4144:
    ldh  a, [hFrameCounter]                       ; $4144: $F0 $E7
    rra                                           ; $4146: $1F
    rra                                           ; $4147: $1F
    rra                                           ; $4148: $1F
    and  $03                                      ; $4149: $E6 $03
    ld   e, a                                     ; $414B: $5F
    ld   d, b                                     ; $414C: $50
    ld   hl, $409F                                ; $414D: $21 $9F $40
    add  hl, de                                   ; $4150: $19
    ld   a, [hl]                                  ; $4151: $7E
    jp   label_3B0C                               ; $4152: $C3 $0C $3B

    call IsEntityFrameCounterZero                 ; $4155: $CD $05 $0C
    jr   z, jr_004_41AC                           ; $4158: $28 $52

    dec  a                                        ; $415A: $3D
    jr   nz, jr_004_4163                          ; $415B: $20 $06

    call IncrementEntityWalkingAttr               ; $415D: $CD $12 $3B
    ld   [hl], $03                                ; $4160: $36 $03
    ret                                           ; $4162: $C9

jr_004_4163:
    ld   hl, $C310                                ; $4163: $21 $10 $C3
    add  hl, bc                                   ; $4166: $09
    ld   a, [hl]                                  ; $4167: $7E
    and  a                                        ; $4168: $A7
    jr   nz, jr_004_41A6                          ; $4169: $20 $3B

    call IsEntityFrameCounterZero                 ; $416B: $CD $05 $0C
    cp   $28                                      ; $416E: $FE $28
    jr   c, jr_004_418D                           ; $4170: $38 $1B

    ld   hl, $C240                                ; $4172: $21 $40 $C2
    add  hl, bc                                   ; $4175: $09
    ld   a, [hl]                                  ; $4176: $7E
    ld   hl, $C250                                ; $4177: $21 $50 $C2
    add  hl, bc                                   ; $417A: $09
    or   [hl]                                     ; $417B: $B6
    jr   z, jr_004_418D                           ; $417C: $28 $0F

    ld   hl, $C390                                ; $417E: $21 $90 $C3
    add  hl, bc                                   ; $4181: $09
    ld   a, [hl]                                  ; $4182: $7E
    and  $01                                      ; $4183: $E6 $01
    jr   nz, jr_004_418D                          ; $4185: $20 $06

    inc  [hl]                                     ; $4187: $34
    ld   a, $7F                                   ; $4188: $3E $7F
    call OpenDialogInTable1                       ; $418A: $CD $73 $23

jr_004_418D:
    call label_3D7F                               ; $418D: $CD $7F $3D
    call IsEntityFrameCounterZero                 ; $4190: $CD $05 $0C
    cp   $28                                      ; $4193: $FE $28
    jr   nc, jr_004_41A9                          ; $4195: $30 $12

    ld   e, $08                                   ; $4197: $1E $08
    ldh  a, [hFrameCounter]                       ; $4199: $F0 $E7
    and  $04                                      ; $419B: $E6 $04
    jr   z, jr_004_41A1                           ; $419D: $28 $02

    ld   e, $F8                                   ; $419F: $1E $F8

jr_004_41A1:
    ld   hl, $C240                                ; $41A1: $21 $40 $C2
    add  hl, bc                                   ; $41A4: $09
    ld   [hl], e                                  ; $41A5: $73

jr_004_41A6:
    call func_004_6DCA                            ; $41A6: $CD $CA $6D

jr_004_41A9:
    call label_3B23                               ; $41A9: $CD $23 $3B

jr_004_41AC:
    call label_C56                                ; $41AC: $CD $56 $0C
    call label_3B70                               ; $41AF: $CD $70 $3B
    call func_004_7BE3                            ; $41B2: $CD $E3 $7B
    ldh  a, [wActiveEntityPosX]                               ; $41B5: $F0 $EE
    ld   hl, hLinkPositionX                       ; $41B7: $21 $98 $FF
    sub  [hl]                                     ; $41BA: $96
    add  $10                                      ; $41BB: $C6 $10
    cp   $20                                      ; $41BD: $FE $20
    jr   nc, jr_004_4210                          ; $41BF: $30 $4F

    ldh  a, [wActiveEntityPosY]                               ; $41C1: $F0 $EC
    ld   hl, hLinkPositionY                       ; $41C3: $21 $99 $FF
    sub  [hl]                                     ; $41C6: $96
    add  $10                                      ; $41C7: $C6 $10
    cp   $20                                      ; $41C9: $FE $20
    jr   nc, jr_004_4210                          ; $41CB: $30 $43

    call label_CB6                                ; $41CD: $CD $B6 $0C
    ld   a, [wAButtonSlot]                        ; $41D0: $FA $00 $DB
    cp   $03                                      ; $41D3: $FE $03
    jr   nz, jr_004_41DF                          ; $41D5: $20 $08

    ldh  a, [hPressedButtonsMask]                 ; $41D7: $F0 $CB
    and  $20                                      ; $41D9: $E6 $20
    jr   nz, jr_004_41EC                          ; $41DB: $20 $0F

    jr   jr_004_4210                              ; $41DD: $18 $31

jr_004_41DF:
    ld   a, [wBButtonSlot]                        ; $41DF: $FA $01 $DB
    cp   $03                                      ; $41E2: $FE $03
    jr   nz, jr_004_4210                          ; $41E4: $20 $2A

    ldh  a, [hPressedButtonsMask]                 ; $41E6: $F0 $CB
    and  $10                                      ; $41E8: $E6 $10
    jr   z, jr_004_4210                           ; $41EA: $28 $24

jr_004_41EC:
    ld   a, [$C3CF]                               ; $41EC: $FA $CF $C3
    and  a                                        ; $41EF: $A7
    jr   nz, jr_004_4210                          ; $41F0: $20 $1E

    inc  a                                        ; $41F2: $3C
    ld   [$C3CF], a                               ; $41F3: $EA $CF $C3
    ld   hl, wEntitiesTypeTable                   ; $41F6: $21 $80 $C2
    add  hl, bc                                   ; $41F9: $09
    ld   [hl], $07                                ; $41FA: $36 $07
    ld   hl, $C490                                ; $41FC: $21 $90 $C4
    add  hl, bc                                   ; $41FF: $09
    ld   [hl], b                                  ; $4200: $70
    ldh  a, [hLinkDirection]                      ; $4201: $F0 $9E
    ld   [wC15D], a                               ; $4203: $EA $5D $C1
    ld   hl, hSFX                                 ; $4206: $21 $F3 $FF
    ld   [hl], $02                                ; $4209: $36 $02
    call IsEntityFrameCounterZero                 ; $420B: $CD $05 $0C
    ld   [hl], $08                                ; $420E: $36 $08

jr_004_4210:
    xor  a                                        ; $4210: $AF
    jp   label_3B0C                               ; $4211: $C3 $0C $3B

    ld   hl, $C420                                ; $4214: $21 $20 $C4
    add  hl, bc                                   ; $4217: $09
    ld   a, [hl]                                  ; $4218: $7E
    and  a                                        ; $4219: $A7
    jr   z, jr_004_4245                           ; $421A: $28 $29

    ld   [hl], b                                  ; $421C: $70
    call IncrementEntityWalkingAttr               ; $421D: $CD $12 $3B
    ld   [hl], $02                                ; $4220: $36 $02
    ld   hl, $C320                                ; $4222: $21 $20 $C3
    add  hl, bc                                   ; $4225: $09
    ld   [hl], $20                                ; $4226: $36 $20
    ld   a, $08                                   ; $4228: $3E $08
    call label_3BB5                               ; $422A: $CD $B5 $3B
    ldh  a, [hScratchA]                               ; $422D: $F0 $D7
    cpl                                           ; $422F: $2F
    inc  a                                        ; $4230: $3C
    ld   hl, $C250                                ; $4231: $21 $50 $C2
    add  hl, bc                                   ; $4234: $09
    ld   [hl], a                                  ; $4235: $77
    ldh  a, [hScratchB]                               ; $4236: $F0 $D8
    cpl                                           ; $4238: $2F
    inc  a                                        ; $4239: $3C
    ld   hl, $C240                                ; $423A: $21 $40 $C2
    add  hl, bc                                   ; $423D: $09
    ld   [hl], a                                  ; $423E: $77
    call IsEntityFrameCounterZero                 ; $423F: $CD $05 $0C
    ld   [hl], $C0                                ; $4242: $36 $C0
    ret                                           ; $4244: $C9

jr_004_4245:
    call func_004_6D80                            ; $4245: $CD $80 $6D
    ld   hl, $C340                                ; $4248: $21 $40 $C3
    add  hl, bc                                   ; $424B: $09
    ld   [hl], $01                                ; $424C: $36 $01
    ld   hl, $C350                                ; $424E: $21 $50 $C3
    add  hl, bc                                   ; $4251: $09
    ld   [hl], $00                                ; $4252: $36 $00
    ld   hl, $C430                                ; $4254: $21 $30 $C4
    add  hl, bc                                   ; $4257: $09
    ld   [hl], $00                                ; $4258: $36 $00
    call label_3B39                               ; $425A: $CD $39 $3B
    ld   hl, $C430                                ; $425D: $21 $30 $C4
    add  hl, bc                                   ; $4260: $09
    ld   [hl], $D0                                ; $4261: $36 $D0
    ldh  a, [hFFE8]                               ; $4263: $F0 $E8
    and  $80                                      ; $4265: $E6 $80
    jr   z, jr_004_4278                           ; $4267: $28 $0F

    ld   hl, $C320                                ; $4269: $21 $20 $C3
    add  hl, bc                                   ; $426C: $09
    ld   [hl], $10                                ; $426D: $36 $10
    ld   a, JINGLE_BIG_BUMP                       ; $426F: $3E $20
    ldh  [hJingle], a                             ; $4271: $E0 $F2
    ld   a, $0C                                   ; $4273: $3E $0C
    call label_3BAA                               ; $4275: $CD $AA $3B

jr_004_4278:
    call func_004_6DCA                            ; $4278: $CD $CA $6D
    call label_3B23                               ; $427B: $CD $23 $3B
    jp   label_004_4144                           ; $427E: $C3 $44 $41

Data_004_4281::
    db   $F0, $00, $76, $06, $F0, $08, $76, $26, $00, $00, $78, $06, $00, $08, $78, $26
    db   $F0, $00, $7A, $06, $F0, $08, $7C, $06, $00, $00, $7E, $06, $00, $08, $7E, $26
    db   $F0, $00, $7C, $26, $F0, $08, $7A, $26, $00, $00, $7E, $06, $00, $08, $7E, $26
    db   $26, $00

func_004_42B3:
    ld   hl, $C3B0                                ; $42B3: $21 $B0 $C3
    add  hl, bc                                   ; $42B6: $09
    ld   a, [hl]                                  ; $42B7: $7E
    rla                                           ; $42B8: $17
    rla                                           ; $42B9: $17
    rla                                           ; $42BA: $17
    rla                                           ; $42BB: $17
    and  $F0                                      ; $42BC: $E6 $F0
    ld   e, a                                     ; $42BE: $5F
    ld   d, b                                     ; $42BF: $50
    ld   hl, Data_004_4281                        ; $42C0: $21 $81 $42
    add  hl, de                                   ; $42C3: $19
    ld   c, $04                                   ; $42C4: $0E $04
    call label_3CE6                               ; $42C6: $CD $E6 $3C
    ld   a, $04                                   ; $42C9: $3E $04
    call label_3DA0                               ; $42CB: $CD $A0 $3D
    ld   hl, $C310                                ; $42CE: $21 $10 $C3
    add  hl, bc                                   ; $42D1: $09
    ld   a, [hl]                                  ; $42D2: $7E
    and  a                                        ; $42D3: $A7
    ret  z                                        ; $42D4: $C8

    ldh  a, [$FFEF]                               ; $42D5: $F0 $EF
    add  $0A                                      ; $42D7: $C6 $0A
    ldh  [wActiveEntityPosY], a                               ; $42D9: $E0 $EC
    xor  a                                        ; $42DB: $AF
    ldh  [$FFF1], a                               ; $42DC: $E0 $F1
    ld   de, $42B1                                ; $42DE: $11 $B1 $42
    call label_3C77                               ; $42E1: $CD $77 $3C
    jp   label_3D8A                               ; $42E4: $C3 $8A $3D

    call func_004_46F9                            ; $42E7: $CD $F9 $46
    ldh  a, [hActiveEntityType]                               ; $42EA: $F0 $EA
    cp   $05                                      ; $42EC: $FE $05
    jr   z, jr_004_431A                           ; $42EE: $28 $2A

    ld   hl, $C420                                ; $42F0: $21 $20 $C4
    add  hl, bc                                   ; $42F3: $09
    ldh  a, [hFrameCounter]                       ; $42F4: $F0 $E7
    ld   [hl], a                                  ; $42F6: $77
    ldh  a, [hActiveEntityWalking]                               ; $42F7: $F0 $F0
    JP_TABLE                                      ; $42F9: $C7
    nop                                           ; $42FA: $00
    ld   b, e                                     ; $42FB: $43
    ld   [label_10EF._05], sp                     ; $42FC: $08 $43 $11
    ld   b, e                                     ; $42FF: $43
    call IsEntityFrameCounterZero                 ; $4300: $CD $05 $0C
    ld   [hl], $40                                ; $4303: $36 $40
    jp   IncrementEntityWalkingAttr               ; $4305: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $4308: $CD $05 $0C
    ret  nz                                       ; $430B: $C0

    ld   [hl], $A0                                ; $430C: $36 $A0
    jp   IncrementEntityWalkingAttr               ; $430E: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $4311: $CD $05 $0C
    jp   z, label_004_5751                        ; $4314: $CA $51 $57

    jp   label_004_50EF                           ; $4317: $C3 $EF $50

jr_004_431A:
    call func_004_7FA3                            ; $431A: $CD $A3 $7F
    ld   hl, $C240                                ; $431D: $21 $40 $C2
    add  hl, bc                                   ; $4320: $09
    ld   a, [hl]                                  ; $4321: $7E
    ld   [$D000], a                               ; $4322: $EA $00 $D0
    ld   hl, $C250                                ; $4325: $21 $50 $C2
    add  hl, bc                                   ; $4328: $09
    ld   a, [hl]                                  ; $4329: $7E
    ld   [wIntroTimer], a                         ; $432A: $EA $01 $D0
    ldh  a, [hActiveEntityWalking]                               ; $432D: $F0 $F0
    cp   $05                                      ; $432F: $FE $05
    jr   z, jr_004_4336                           ; $4331: $28 $03

    call label_3B44                               ; $4333: $CD $44 $3B

jr_004_4336:
    ldh  a, [hActiveEntityWalking]                               ; $4336: $F0 $F0
    JP_TABLE                                      ; $4338: $C7
    ld   b, l                                     ; $4339: $45
    ld   b, e                                     ; $433A: $43
    add  b                                        ; $433B: $80
    ld   b, e                                     ; $433C: $43
    sbc  a                                        ; $433D: $9F
    ld   b, h                                     ; $433E: $44
    jp   hl                                       ; $433F: $E9

    ld   b, h                                     ; $4340: $44
    rla                                           ; $4341: $17
    ld   b, l                                     ; $4342: $45
    ld   [hl], l                                  ; $4343: $75
    ld   b, l                                     ; $4344: $45
    call IsEntityFrameCounterZero                 ; $4345: $CD $05 $0C
    ret  nz                                       ; $4348: $C0

    call IncrementEntityWalkingAttr               ; $4349: $CD $12 $3B
    call label_C00                                ; $434C: $CD $00 $0C
    ld   [hl], $FF                                ; $434F: $36 $FF
    ld   a, [wIntroSubTimer]                      ; $4351: $FA $02 $D0
    ld   e, a                                     ; $4354: $5F
    ld   d, b                                     ; $4355: $50
    ld   hl, wEntitiesTypeTable                   ; $4356: $21 $80 $C2
    add  hl, de                                   ; $4359: $19
    ld   a, [hl]                                  ; $435A: $7E
    and  a                                        ; $435B: $A7
    ld   a, $52                                   ; $435C: $3E $52
    jr   nz, jr_004_436D                          ; $435E: $20 $0D

    call IncrementEntityWalkingAttr               ; $4360: $CD $12 $3B
    ld   [hl], $04                                ; $4363: $36 $04
    ld   hl, $C360                                ; $4365: $21 $60 $C3
    add  hl, bc                                   ; $4368: $09
    ld   [hl], $08                                ; $4369: $36 $08
    ld   a, $53                                   ; $436B: $3E $53

jr_004_436D:
    jp   OpenDialog                               ; $436D: $C3 $85 $23

    db   $10                                      ; $4370: $10
    inc  d                                        ; $4371: $14
    jr   jr_004_4394                              ; $4372: $18 $20

    jr   z, jr_004_43A6                           ; $4374: $28 $30

    jr   c, @+$42                                 ; $4376: $38 $40

    rst  $38                                      ; $4378: $FF
    rst  $38                                      ; $4379: $FF
    ld   h, b                                     ; $437A: $60
    ld   b, b                                     ; $437B: $40
    ld   bc, $08FF                                ; $437C: $01 $FF $08
    ld   hl, sp-$33                               ; $437F: $F8 $CD
    jp   z, $216D                                 ; $4381: $CA $6D $21

    add  b                                        ; $4384: $80
    jp   label_004_5E09                           ; $4385: $C3 $09 $5E

    ld   d, b                                     ; $4388: $50
    ldh  a, [hFrameCounter]                       ; $4389: $F0 $E7
    and  $07                                      ; $438B: $E6 $07
    jr   nz, jr_004_43A6                          ; $438D: $20 $17

    ld   hl, $C240                                ; $438F: $21 $40 $C2
    add  hl, bc                                   ; $4392: $09
    ld   a, [hl]                                  ; $4393: $7E

jr_004_4394:
    ld   hl, $437E                                ; $4394: $21 $7E $43
    add  hl, de                                   ; $4397: $19
    cp   [hl]                                     ; $4398: $BE
    jr   z, jr_004_43A6                           ; $4399: $28 $0B

    ld   hl, $437C                                ; $439B: $21 $7C $43
    add  hl, de                                   ; $439E: $19
    ld   a, [hl]                                  ; $439F: $7E
    ld   hl, $C240                                ; $43A0: $21 $40 $C2
    add  hl, bc                                   ; $43A3: $09
    add  [hl]                                     ; $43A4: $86
    ld   [hl], a                                  ; $43A5: $77

jr_004_43A6:
    ld   hl, $437A                                ; $43A6: $21 $7A $43
    add  hl, de                                   ; $43A9: $19
    ldh  a, [wActiveEntityPosX]                               ; $43AA: $F0 $EE
    cp   [hl]                                     ; $43AC: $BE
    jr   nz, jr_004_43B7                          ; $43AD: $20 $08

    ld   hl, $C380                                ; $43AF: $21 $80 $C3
    add  hl, bc                                   ; $43B2: $09
    ld   a, [hl]                                  ; $43B3: $7E
    xor  $01                                      ; $43B4: $EE $01
    ld   [hl], a                                  ; $43B6: $77

jr_004_43B7:
    ldh  a, [hFrameCounter]                       ; $43B7: $F0 $E7
    and  $01                                      ; $43B9: $E6 $01
    jr   nz, jr_004_43DD                          ; $43BB: $20 $20

    ld   hl, wEntitiesUnknownTableC               ; $43BD: $21 $C0 $C2
    add  hl, bc                                   ; $43C0: $09
    ld   e, [hl]                                  ; $43C1: $5E
    ld   d, b                                     ; $43C2: $50
    ld   hl, $437C                                ; $43C3: $21 $7C $43
    add  hl, de                                   ; $43C6: $19
    ld   a, [hl]                                  ; $43C7: $7E
    ld   hl, $C250                                ; $43C8: $21 $50 $C2
    add  hl, bc                                   ; $43CB: $09
    add  [hl]                                     ; $43CC: $86
    ld   [hl], a                                  ; $43CD: $77
    ld   hl, $437E                                ; $43CE: $21 $7E $43
    add  hl, de                                   ; $43D1: $19
    cp   [hl]                                     ; $43D2: $BE
    jr   nz, jr_004_43DD                          ; $43D3: $20 $08

    ld   hl, wEntitiesUnknownTableC               ; $43D5: $21 $C0 $C2
    add  hl, bc                                   ; $43D8: $09
    ld   a, [hl]                                  ; $43D9: $7E
    xor  $01                                      ; $43DA: $EE $01
    ld   [hl], a                                  ; $43DC: $77

jr_004_43DD:
    ldh  a, [hFrameCounter]                       ; $43DD: $F0 $E7
    rra                                           ; $43DF: $1F
    rra                                           ; $43E0: $1F
    rra                                           ; $43E1: $1F
    rra                                           ; $43E2: $1F
    and  $01                                      ; $43E3: $E6 $01
    call label_3B0C                               ; $43E5: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $43E8: $CD $05 $0C
    jr   nz, jr_004_4438                          ; $43EB: $20 $4B

    push hl                                       ; $43ED: $E5
    ld   hl, $C3D0                                ; $43EE: $21 $D0 $C3
    add  hl, bc                                   ; $43F1: $09
    ld   a, [hl]                                  ; $43F2: $7E
    ld   e, a                                     ; $43F3: $5F
    cp   $08                                      ; $43F4: $FE $08
    jr   c, jr_004_43FF                           ; $43F6: $38 $07

    call IncrementEntityWalkingAttr               ; $43F8: $CD $12 $3B
    pop  hl                                       ; $43FB: $E1
    ld   [hl], $30                                ; $43FC: $36 $30
    ret                                           ; $43FE: $C9

jr_004_43FF:
    ld   d, b                                     ; $43FF: $50
    ld   hl, $4370                                ; $4400: $21 $70 $43
    add  hl, de                                   ; $4403: $19
    ld   a, [hl]                                  ; $4404: $7E
    pop  hl                                       ; $4405: $E1
    ld   [hl], a                                  ; $4406: $77
    ld   a, $5C                                   ; $4407: $3E $5C
    call label_3B86                               ; $4409: $CD $86 $3B
    jr   c, jr_004_4438                           ; $440C: $38 $2A

    ldh  a, [hScratchA]                               ; $440E: $F0 $D7
    sub  $0C                                      ; $4410: $D6 $0C
    ld   hl, wEntity0PosX                         ; $4412: $21 $00 $C2
    add  hl, de                                   ; $4415: $19
    ld   [hl], a                                  ; $4416: $77
    ldh  a, [hScratchB]                               ; $4417: $F0 $D8
    sub  $14                                      ; $4419: $D6 $14
    ld   hl, wEntitiesPosYTable                   ; $441B: $21 $10 $C2
    add  hl, de                                   ; $441E: $19
    ld   [hl], a                                  ; $441F: $77
    ld   hl, wEntitiesUnknownTableB               ; $4420: $21 $B0 $C2
    add  hl, de                                   ; $4423: $19
    ld   [hl], $03                                ; $4424: $36 $03
    ld   hl, $C320                                ; $4426: $21 $20 $C3
    add  hl, de                                   ; $4429: $19
    ld   [hl], $20                                ; $442A: $36 $20
    ld   hl, $C240                                ; $442C: $21 $40 $C2
    add  hl, de                                   ; $442F: $19
    ld   [hl], $0C                                ; $4430: $36 $0C
    ld   hl, $C340                                ; $4432: $21 $40 $C3
    add  hl, de                                   ; $4435: $19
    ld   [hl], $42                                ; $4436: $36 $42

jr_004_4438:
    call label_C00                                ; $4438: $CD $00 $0C
    jr   nz, jr_004_4487                          ; $443B: $20 $4A

    ld   [hl], $30                                ; $443D: $36 $30
    ld   a, $5C                                   ; $443F: $3E $5C
    call label_3B86                               ; $4441: $CD $86 $3B
    jr   c, jr_004_4487                           ; $4444: $38 $41

    push bc                                       ; $4446: $C5
    ld   hl, $C3D0                                ; $4447: $21 $D0 $C3
    add  hl, bc                                   ; $444A: $09
    ld   a, [hl]                                  ; $444B: $7E
    inc  [hl]                                     ; $444C: $34
    and  $01                                      ; $444D: $E6 $01
    ld   c, a                                     ; $444F: $4F
    ld   hl, $449D                                ; $4450: $21 $9D $44
    add  hl, bc                                   ; $4453: $09
    ldh  a, [hScratchA]                               ; $4454: $F0 $D7
    add  [hl]                                     ; $4456: $86
    ld   hl, wEntity0PosX                         ; $4457: $21 $00 $C2
    add  hl, de                                   ; $445A: $19
    ld   [hl], a                                  ; $445B: $77
    ldh  a, [hScratchB]                               ; $445C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $445E: $21 $10 $C2
    add  hl, de                                   ; $4461: $19
    ld   [hl], a                                  ; $4462: $77
    ld   hl, $C320                                ; $4463: $21 $20 $C3
    add  hl, de                                   ; $4466: $19
    ld   [hl], $24                                ; $4467: $36 $24
    ld   hl, wEntitiesUnknownTableB               ; $4469: $21 $B0 $C2
    add  hl, de                                   ; $446C: $19
    ld   [hl], $04                                ; $446D: $36 $04
    ld   hl, $C340                                ; $446F: $21 $40 $C3
    add  hl, de                                   ; $4472: $19
    ld   [hl], $12                                ; $4473: $36 $12
    ld   c, e                                     ; $4475: $4B
    ld   b, d                                     ; $4476: $42
    ld   a, $1F                                   ; $4477: $3E $1F
    call label_3BAA                               ; $4479: $CD $AA $3B
    pop  bc                                       ; $447C: $C1
    ld   hl, $C300                                ; $447D: $21 $00 $C3
    add  hl, bc                                   ; $4480: $09
    ld   [hl], $10                                ; $4481: $36 $10
    ld   a, $28                                   ; $4483: $3E $28
    ldh  [hNextSFX], a                            ; $4485: $E0 $F4

jr_004_4487:
    ld   hl, $C300                                ; $4487: $21 $00 $C3
    add  hl, bc                                   ; $448A: $09
    ld   a, [hl]                                  ; $448B: $7E
    and  a                                        ; $448C: $A7
    ret  z                                        ; $448D: $C8

    ld   hl, $C3D0                                ; $448E: $21 $D0 $C3
    add  hl, bc                                   ; $4491: $09
    ld   a, [hl]                                  ; $4492: $7E
    and  $01                                      ; $4493: $E6 $01
    ld   a, $02                                   ; $4495: $3E $02
    jr   z, jr_004_449A                           ; $4497: $28 $01

    inc  a                                        ; $4499: $3C

jr_004_449A:
    jp   label_3B0C                               ; $449A: $C3 $0C $3B

    db   $f4                                      ; $449D: $F4
    inc  c                                        ; $449E: $0C
    ld   a, [wIntroSubTimer]                      ; $449F: $FA $02 $D0
    ld   e, a                                     ; $44A2: $5F
    ld   d, b                                     ; $44A3: $50
    ldh  a, [hLinkPositionX]                      ; $44A4: $F0 $98
    push af                                       ; $44A6: $F5
    ld   hl, wEntity0PosX                         ; $44A7: $21 $00 $C2
    add  hl, de                                   ; $44AA: $19
    ld   a, [hl]                                  ; $44AB: $7E
    ldh  [hLinkPositionX], a                      ; $44AC: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $44AE: $F0 $99
    push af                                       ; $44B0: $F5
    ld   hl, wEntitiesPosYTable                   ; $44B1: $21 $10 $C2
    add  hl, de                                   ; $44B4: $19
    ld   a, [hl]                                  ; $44B5: $7E
    sub  $20                                      ; $44B6: $D6 $20
    ldh  [hLinkPositionY], a                      ; $44B8: $E0 $99
    ld   a, $10                                   ; $44BA: $3E $10
    call label_3BAA                               ; $44BC: $CD $AA $3B
    call func_004_6DCA                            ; $44BF: $CD $CA $6D
    ld   hl, hLinkPositionX                       ; $44C2: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                               ; $44C5: $F0 $EE
    sub  [hl]                                     ; $44C7: $96
    add  $03                                      ; $44C8: $C6 $03
    cp   $06                                      ; $44CA: $FE $06
    jr   nc, jr_004_44E2                          ; $44CC: $30 $14

    ld   hl, hLinkPositionY                       ; $44CE: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                               ; $44D1: $F0 $EC
    sub  [hl]                                     ; $44D3: $96
    add  $03                                      ; $44D4: $C6 $03
    cp   $06                                      ; $44D6: $FE $06
    jr   nc, jr_004_44E2                          ; $44D8: $30 $08

    call IsEntityFrameCounterZero                 ; $44DA: $CD $05 $0C
    ld   [hl], $10                                ; $44DD: $36 $10
    call IncrementEntityWalkingAttr               ; $44DF: $CD $12 $3B

jr_004_44E2:
    pop  af                                       ; $44E2: $F1
    ldh  [hLinkPositionY], a                      ; $44E3: $E0 $99
    pop  af                                       ; $44E5: $F1
    ldh  [hLinkPositionX], a                      ; $44E6: $E0 $98
    ret                                           ; $44E8: $C9

    call IsEntityFrameCounterZero                 ; $44E9: $CD $05 $0C
    jp   z, label_004_6D7A                        ; $44EC: $CA $7A $6D

    cp   $04                                      ; $44EF: $FE $04
    jr   nz, jr_004_4516                          ; $44F1: $20 $23

    ld   a, $5C                                   ; $44F3: $3E $5C
    call label_3B86                               ; $44F5: $CD $86 $3B
    ldh  a, [hScratchA]                               ; $44F8: $F0 $D7
    ld   hl, wEntity0PosX                         ; $44FA: $21 $00 $C2
    add  hl, de                                   ; $44FD: $19
    ld   [hl], a                                  ; $44FE: $77
    ldh  a, [hScratchB]                               ; $44FF: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4501: $21 $10 $C2
    add  hl, de                                   ; $4504: $19
    ld   [hl], a                                  ; $4505: $77
    ld   hl, wEntitiesUnknownTableB               ; $4506: $21 $B0 $C2
    add  hl, de                                   ; $4509: $19
    ld   [hl], $02                                ; $450A: $36 $02
    ld   hl, wEntitiesFrameCounterTable           ; $450C: $21 $E0 $C2
    add  hl, de                                   ; $450F: $19
    ld   [hl], $C7                                ; $4510: $36 $C7
    ld   a, JINGLE_ENNEMY_MORPH_OUT               ; $4512: $3E $1F
    ldh  [hJingle], a                             ; $4514: $E0 $F2

jr_004_4516:
    ret                                           ; $4516: $C9

    ld   hl, $C350                                ; $4517: $21 $50 $C3
    add  hl, bc                                   ; $451A: $09
    ld   [hl], $0C                                ; $451B: $36 $0C
    ld   hl, $C430                                ; $451D: $21 $30 $C4
    add  hl, bc                                   ; $4520: $09
    ld   [hl], $81                                ; $4521: $36 $81
    ld   hl, $C420                                ; $4523: $21 $20 $C4
    add  hl, bc                                   ; $4526: $09
    ld   a, [hl]                                  ; $4527: $7E
    cp   $02                                      ; $4528: $FE $02
    jr   nz, jr_004_4535                          ; $452A: $20 $09

    call IncrementEntityWalkingAttr               ; $452C: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $452F: $CD $05 $0C
    ld   [hl], $80                                ; $4532: $36 $80
    ret                                           ; $4534: $C9

jr_004_4535:
    call func_004_6D80                            ; $4535: $CD $80 $6D
    call label_3B70                               ; $4538: $CD $70 $3B
    call func_004_6DCA                            ; $453B: $CD $CA $6D
    call label_3B23                               ; $453E: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4541: $F0 $E7
    and  $03                                      ; $4543: $E6 $03
    jr   nz, jr_004_4568                          ; $4545: $20 $21

    ld   a, $10                                   ; $4547: $3E $10
    call label_3BB5                               ; $4549: $CD $B5 $3B
    ld   hl, $C240                                ; $454C: $21 $40 $C2
    add  hl, bc                                   ; $454F: $09
    ldh  a, [hScratchB]                               ; $4550: $F0 $D8
    sub  [hl]                                     ; $4552: $96
    and  $80                                      ; $4553: $E6 $80
    jr   z, jr_004_4559                           ; $4555: $28 $02

    dec  [hl]                                     ; $4557: $35
    dec  [hl]                                     ; $4558: $35

jr_004_4559:
    inc  [hl]                                     ; $4559: $34
    ld   hl, $C250                                ; $455A: $21 $50 $C2
    add  hl, bc                                   ; $455D: $09
    ldh  a, [hScratchA]                               ; $455E: $F0 $D7
    sub  [hl]                                     ; $4560: $96
    and  $80                                      ; $4561: $E6 $80
    jr   z, jr_004_4567                           ; $4563: $28 $02

    dec  [hl]                                     ; $4565: $35
    dec  [hl]                                     ; $4566: $35

jr_004_4567:
    inc  [hl]                                     ; $4567: $34

label_004_4568:
jr_004_4568:
    ldh  a, [hFrameCounter]                       ; $4568: $F0 $E7
    rra                                           ; $456A: $1F
    rra                                           ; $456B: $1F
    rra                                           ; $456C: $1F
    rra                                           ; $456D: $1F
    and  $01                                      ; $456E: $E6 $01
    add  $02                                      ; $4570: $C6 $02
    jp   label_3B0C                               ; $4572: $C3 $0C $3B

    ld   hl, $C340                                ; $4575: $21 $40 $C3
    add  hl, bc                                   ; $4578: $09
    ld   [hl], $41                                ; $4579: $36 $41
    call IsEntityFrameCounterZero                 ; $457B: $CD $05 $0C
    jr   nz, jr_004_45F1                          ; $457E: $20 $71

    call IncrementEntityWalkingAttr               ; $4580: $CD $12 $3B
    ld   [hl], $04                                ; $4583: $36 $04
    ld   hl, $C340                                ; $4585: $21 $40 $C3
    add  hl, bc                                   ; $4588: $09
    ld   [hl], $01                                ; $4589: $36 $01
    call GetRandomByte                            ; $458B: $CD $0D $28
    and  $01                                      ; $458E: $E6 $01
    jr   nz, jr_004_45A6                          ; $4590: $20 $14

    ld   hl, wEntitiesUnknownTableD               ; $4592: $21 $D0 $C2
    add  hl, bc                                   ; $4595: $09
    ld   a, [hl]                                  ; $4596: $7E
    ld   hl, wEntitiesPosYTable                   ; $4597: $21 $10 $C2
    add  hl, bc                                   ; $459A: $09
    ld   [hl], a                                  ; $459B: $77
    ld   hl, $C440                                ; $459C: $21 $40 $C4
    add  hl, bc                                   ; $459F: $09
    ld   a, [hl]                                  ; $45A0: $7E
    ld   hl, wEntity0PosX                         ; $45A1: $21 $00 $C2
    add  hl, bc                                   ; $45A4: $09
    ld   [hl], a                                  ; $45A5: $77

jr_004_45A6:
    call label_3D7F                               ; $45A6: $CD $7F $3D
    ld   hl, $C410                                ; $45A9: $21 $10 $C4
    add  hl, bc                                   ; $45AC: $09
    ld   [hl], b                                  ; $45AD: $70
    ld   a, $5C                                   ; $45AE: $3E $5C
    call label_3B86                               ; $45B0: $CD $86 $3B
    jr   c, jr_004_45F0                           ; $45B3: $38 $3B

    push bc                                       ; $45B5: $C5
    ld   hl, $C3D0                                ; $45B6: $21 $D0 $C3
    add  hl, bc                                   ; $45B9: $09
    ld   a, [hl]                                  ; $45BA: $7E
    inc  [hl]                                     ; $45BB: $34
    and  $01                                      ; $45BC: $E6 $01
    ld   c, a                                     ; $45BE: $4F
    ld   hl, $449D                                ; $45BF: $21 $9D $44
    add  hl, bc                                   ; $45C2: $09
    ldh  a, [hScratchA]                               ; $45C3: $F0 $D7
    add  [hl]                                     ; $45C5: $86
    ld   hl, wEntity0PosX                         ; $45C6: $21 $00 $C2
    add  hl, de                                   ; $45C9: $19
    ld   [hl], a                                  ; $45CA: $77
    ldh  a, [hScratchB]                               ; $45CB: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $45CD: $21 $10 $C2
    add  hl, de                                   ; $45D0: $19
    ld   [hl], a                                  ; $45D1: $77
    ld   hl, $C320                                ; $45D2: $21 $20 $C3
    add  hl, de                                   ; $45D5: $19
    ld   [hl], $24                                ; $45D6: $36 $24
    ld   hl, wEntitiesUnknownTableB               ; $45D8: $21 $B0 $C2
    add  hl, de                                   ; $45DB: $19
    ld   [hl], $04                                ; $45DC: $36 $04
    ld   hl, $C340                                ; $45DE: $21 $40 $C3
    add  hl, de                                   ; $45E1: $19
    ld   [hl], $12                                ; $45E2: $36 $12
    ld   c, e                                     ; $45E4: $4B
    ld   b, d                                     ; $45E5: $42
    ld   a, $1F                                   ; $45E6: $3E $1F
    call label_3BAA                               ; $45E8: $CD $AA $3B
    pop  bc                                       ; $45EB: $C1
    ld   a, $28                                   ; $45EC: $3E $28
    ldh  [hNextSFX], a                            ; $45EE: $E0 $F4

jr_004_45F0:
    ret                                           ; $45F0: $C9

jr_004_45F1:
    ldh  a, [hLinkPositionX]                      ; $45F1: $F0 $98
    push af                                       ; $45F3: $F5
    ld   a, $50                                   ; $45F4: $3E $50
    ldh  [hLinkPositionX], a                      ; $45F6: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $45F8: $F0 $99
    push af                                       ; $45FA: $F5
    ld   a, $48                                   ; $45FB: $3E $48
    ldh  [hLinkPositionY], a                      ; $45FD: $E0 $99
    ld   a, $20                                   ; $45FF: $3E $20
    call label_3BB5                               ; $4601: $CD $B5 $3B
    ldh  a, [hScratchB]                               ; $4604: $F0 $D8
    cpl                                           ; $4606: $2F
    inc  a                                        ; $4607: $3C
    push af                                       ; $4608: $F5
    ldh  a, [hScratchA]                               ; $4609: $F0 $D7
    push af                                       ; $460B: $F5
    ld   a, $04                                   ; $460C: $3E $04
    call label_3BB5                               ; $460E: $CD $B5 $3B
    ld   hl, hScratchB                                ; $4611: $21 $D8 $FF
    pop  af                                       ; $4614: $F1
    add  [hl]                                     ; $4615: $86
    ld   hl, $C240                                ; $4616: $21 $40 $C2
    add  hl, bc                                   ; $4619: $09
    ld   [hl], a                                  ; $461A: $77
    ld   hl, hScratchA                                ; $461B: $21 $D7 $FF
    pop  af                                       ; $461E: $F1
    add  [hl]                                     ; $461F: $86
    ld   hl, $C250                                ; $4620: $21 $50 $C2
    add  hl, bc                                   ; $4623: $09
    ld   [hl], a                                  ; $4624: $77
    pop  af                                       ; $4625: $F1
    ldh  [hLinkPositionY], a                      ; $4626: $E0 $99
    pop  af                                       ; $4628: $F1
    ldh  [hLinkPositionX], a                      ; $4629: $E0 $98
    call func_004_6DCA                            ; $462B: $CD $CA $6D
    call func_004_4634                            ; $462E: $CD $34 $46
    jp   label_004_4568                           ; $4631: $C3 $68 $45

func_004_4634:
    ld   hl, wEntitiesPosYTable                   ; $4634: $21 $10 $C2
    add  hl, bc                                   ; $4637: $09
    ld   a, [hl]                                  ; $4638: $7E
    sub  $48                                      ; $4639: $D6 $48
    ld   e, a                                     ; $463B: $5F
    ld   a, $48                                   ; $463C: $3E $48
    sub  e                                        ; $463E: $93
    ld   hl, wEntitiesUnknownTableD               ; $463F: $21 $D0 $C2
    add  hl, bc                                   ; $4642: $09
    ld   [hl], a                                  ; $4643: $77
    ld   hl, wEntity0PosX                         ; $4644: $21 $00 $C2
    add  hl, bc                                   ; $4647: $09
    ld   a, [hl]                                  ; $4648: $7E
    sub  $50                                      ; $4649: $D6 $50
    ld   e, a                                     ; $464B: $5F
    ld   a, $50                                   ; $464C: $3E $50
    sub  e                                        ; $464E: $93
    ld   hl, $C440                                ; $464F: $21 $40 $C4
    add  hl, bc                                   ; $4652: $09
    ld   [hl], a                                  ; $4653: $77
    ret                                           ; $4654: $C9

Data_004_4655::
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02, $F0, $04, $64, $02, $F0, $0C, $62, $22
    db   $F0, $14, $60, $22, $00, $F4, $66, $02, $00, $FC, $68, $02, $00, $04, $6A, $02
    db   $00, $0C, $68, $22, $00, $14, $66, $22, $F0, $F4, $60, $02, $F0, $FC, $62, $02
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22, $F0, $14, $60, $22, $00, $F4, $66, $02
    db   $00, $FC, $68, $02, $00, $04, $6A, $22, $00, $0C, $68, $22, $00, $14, $66, $22
    db   $F0, $F4, $60, $02, $F0, $FC, $62, $02, $F0, $04, $64, $02, $F0, $0C, $6C, $02
    db   $F0, $14, $6E, $02, $00, $F4, $66, $02, $00, $FC, $68, $02, $00, $04, $6A, $02
    db   $00, $0C, $70, $02, $00, $14, $72, $02, $F0, $F4, $6E, $22, $F0, $FC, $6C, $22
    db   $F0, $04, $64, $22, $F0, $0C, $62, $22, $F0, $14, $60, $22, $00, $F4, $72, $22
    db   $00, $FC, $70, $22, $00, $04, $6A, $22, $00, $0C, $68, $22, $00, $14, $66, $22
    db   $74, $02, $74, $22

func_004_46F9:
    ldh  a, [hActiveEntityWalking]                               ; $46F9: $F0 $F0
    cp   $05                                      ; $46FB: $FE $05
    jr   nz, jr_004_4713                          ; $46FD: $20 $14

    ldh  a, [hFrameCounter]                       ; $46FF: $F0 $E7
    and  $01                                      ; $4701: $E6 $01
    jr   nz, jr_004_4713                          ; $4703: $20 $0E

    ld   hl, wEntitiesUnknownTableD               ; $4705: $21 $D0 $C2
    add  hl, bc                                   ; $4708: $09
    ld   a, [hl]                                  ; $4709: $7E
    ldh  [wActiveEntityPosY], a                               ; $470A: $E0 $EC
    ld   hl, $C440                                ; $470C: $21 $40 $C4
    add  hl, bc                                   ; $470F: $09
    ld   a, [hl]                                  ; $4710: $7E
    ldh  [wActiveEntityPosX], a                               ; $4711: $E0 $EE

jr_004_4713:
    ld   hl, $C3B0                                ; $4713: $21 $B0 $C3
    add  hl, bc                                   ; $4716: $09
    ld   a, [hl]                                  ; $4717: $7E
    ld   e, a                                     ; $4718: $5F
    ld   d, b                                     ; $4719: $50
    sla  e                                        ; $471A: $CB $23
    sla  e                                        ; $471C: $CB $23
    sla  e                                        ; $471E: $CB $23
    ld   a, e                                     ; $4720: $7B
    sla  e                                        ; $4721: $CB $23
    sla  e                                        ; $4723: $CB $23
    add  e                                        ; $4725: $83
    ld   e, a                                     ; $4726: $5F
    ld   hl, Data_004_4655                        ; $4727: $21 $55 $46
    add  hl, de                                   ; $472A: $19
    ld   c, $0A                                   ; $472B: $0E $0A
    call label_3CE6                               ; $472D: $CD $E6 $3C
    ld   a, $0A                                   ; $4730: $3E $0A
    call label_3DA0                               ; $4732: $CD $A0 $3D
    ldh  a, [wActiveEntityPosY]                               ; $4735: $F0 $EC
    add  $10                                      ; $4737: $C6 $10
    ldh  [wActiveEntityPosY], a                               ; $4739: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $473B: $F0 $E7
    rra                                           ; $473D: $1F
    rra                                           ; $473E: $1F
    rra                                           ; $473F: $1F
    and  $01                                      ; $4740: $E6 $01
    ldh  [$FFF1], a                               ; $4742: $E0 $F1
    ld   de, $46F5                                ; $4744: $11 $F5 $46
    call label_3C77                               ; $4747: $CD $77 $3C
    jp   label_3D8A                               ; $474A: $C3 $8A $3D

Data_004_474D::
    db   $10, $00, $1E, $01, $10, $08, $1E, $61, $10, $00, $1E, $01, $10, $08, $1E, $61
    db   $10, $00, $1E, $01, $10, $08, $1E, $61, $10, $00, $1E, $01, $10, $08, $1E, $61
    db   $08, $00, $30, $01, $08, $08, $30, $61, $08, $00, $30, $01, $08, $08, $30, $61
    db   $08, $00, $30, $01, $08, $08, $30, $61, $08, $00, $30, $01, $08, $08, $30, $61
    db   $04, $00, $30, $01, $04, $08, $30, $61, $14, $00, $1E, $01, $14, $08, $1E, $61
    db   $14, $00, $1E, $01, $14, $08, $1E, $61, $14, $00, $1E, $01, $14, $08, $1E, $61
    db   $00, $00, $30, $01, $00, $08, $30, $61, $10, $00, $1E, $01, $10, $08, $1E, $61
    db   $10, $00, $1E, $01, $10, $08, $1E, $61, $10, $00, $1E, $01, $10, $08, $1E, $61
    db   $F2, $FA, $30, $01, $F2, $02, $30, $61, $F2, $06, $30, $01, $F2, $0E, $30, $61
    db   $FE, $FA, $30, $01, $FE, $02, $30, $61, $FE, $06, $30, $01, $FE, $0E, $30, $61
    db   $F0, $F8, $30, $41, $F0, $00, $30, $21, $F0, $08, $30, $41, $F0, $10, $30, $21
    db   $00, $F8, $30, $41, $00, $00, $30, $21, $00, $08, $30, $41, $00, $10, $30, $21
    db   $F0, $F8, $32, $01, $F0, $00, $32, $61, $F0, $08, $32, $01, $F0, $10, $32, $61
    db   $00, $F8, $32, $01, $00, $00, $32, $61, $00, $08, $32, $01, $00, $10, $32, $61
    db   $06, $05, $04, $05, $04, $03, $02, $01, $00, $00, $01, $02, $03, $04, $05, $04
    db   $05

    ld   b, $CD                                   ; $483E: $06 $CD
    cp   b                                        ; $4840: $B8
    ld   c, b                                     ; $4841: $48
    call func_004_7FA3                            ; $4842: $CD $A3 $7F
    call IsEntityFrameCounterZero                 ; $4845: $CD $05 $0C
    bit  7, a                                     ; $4848: $CB $7F
    jr   z, jr_004_486D                           ; $484A: $28 $21

    and  $7F                                      ; $484C: $E6 $7F
    jr   nz, jr_004_485E                          ; $484E: $20 $0E

    ld   a, [wIntroSubTimer]                      ; $4850: $FA $02 $D0
    ld   e, a                                     ; $4853: $5F
    ld   d, b                                     ; $4854: $50
    ld   hl, wEntitiesWalkingTable                ; $4855: $21 $90 $C2
    add  hl, de                                   ; $4858: $19
    ld   [hl], $03                                ; $4859: $36 $03
    jp   label_004_6D7A                           ; $485B: $C3 $7A $6D

jr_004_485E:
    rra                                           ; $485E: $1F
    rra                                           ; $485F: $1F
    rra                                           ; $4860: $1F
    and  $0F                                      ; $4861: $E6 $0F
    ld   e, a                                     ; $4863: $5F
    ld   d, b                                     ; $4864: $50
    ld   hl, $4836                                ; $4865: $21 $36 $48
    add  hl, de                                   ; $4868: $19
    ld   a, [hl]                                  ; $4869: $7E
    jp   label_3B0C                               ; $486A: $C3 $0C $3B

jr_004_486D:
    and  a                                        ; $486D: $A7
    jp   z, label_004_6D7A                        ; $486E: $CA $7A $6D

    cp   $06                                      ; $4871: $FE $06
    jr   nz, jr_004_48A6                          ; $4873: $20 $31

    ld   a, $5C                                   ; $4875: $3E $5C
    call label_3B86                               ; $4877: $CD $86 $3B
    ldh  a, [hScratchA]                               ; $487A: $F0 $D7
    ld   hl, wEntity0PosX                         ; $487C: $21 $00 $C2
    add  hl, de                                   ; $487F: $19
    ld   [hl], a                                  ; $4880: $77
    ldh  a, [hScratchB]                               ; $4881: $F0 $D8
    cp   $14                                      ; $4883: $FE $14
    jr   nc, jr_004_4889                          ; $4885: $30 $02

    ld   a, $14                                   ; $4887: $3E $14

jr_004_4889:
    ld   hl, wEntitiesPosYTable                   ; $4889: $21 $10 $C2
    add  hl, de                                   ; $488C: $19
    ld   [hl], a                                  ; $488D: $77
    ld   hl, wEntitiesUnknownTableB               ; $488E: $21 $B0 $C2
    add  hl, de                                   ; $4891: $19
    ld   [hl], $01                                ; $4892: $36 $01
    ld   hl, wEntitiesFrameCounterTable           ; $4894: $21 $E0 $C2
    add  hl, de                                   ; $4897: $19
    ld   [hl], $40                                ; $4898: $36 $40
    ld   hl, $C340                                ; $489A: $21 $40 $C3
    add  hl, de                                   ; $489D: $19
    ld   [hl], $01                                ; $489E: $36 $01
    ld   hl, $C350                                ; $48A0: $21 $50 $C3
    add  hl, de                                   ; $48A3: $19
    ld   [hl], $8C                                ; $48A4: $36 $8C

jr_004_48A6:
    call IsEntityFrameCounterZero                 ; $48A6: $CD $05 $0C
    rra                                           ; $48A9: $1F
    rra                                           ; $48AA: $1F
    rra                                           ; $48AB: $1F
    and  $0F                                      ; $48AC: $E6 $0F
    ld   e, a                                     ; $48AE: $5F
    ld   d, b                                     ; $48AF: $50
    ld   hl, $482D                                ; $48B0: $21 $2D $48
    add  hl, de                                   ; $48B3: $19
    ld   a, [hl]                                  ; $48B4: $7E
    jp   label_3B0C                               ; $48B5: $C3 $0C $3B

    ldh  a, [$FFF1]                               ; $48B8: $F0 $F1
    rla                                           ; $48BA: $17
    rla                                           ; $48BB: $17
    rla                                           ; $48BC: $17
    rla                                           ; $48BD: $17
    rla                                           ; $48BE: $17
    and  $E0                                      ; $48BF: $E6 $E0
    ld   e, a                                     ; $48C1: $5F
    ld   d, b                                     ; $48C2: $50
    ld   hl, Data_004_474D                        ; $48C3: $21 $4D $47
    add  hl, de                                   ; $48C6: $19
    ld   c, $08                                   ; $48C7: $0E $08
    call label_3CE6                               ; $48C9: $CD $E6 $3C
    ld   a, $08                                   ; $48CC: $3E $08
    jp   label_3DA0                               ; $48CE: $C3 $A0 $3D

    inc  [hl]                                     ; $48D1: $34
    ld   [bc], a                                  ; $48D2: $02
    inc  [hl]                                     ; $48D3: $34
    ld   [hl+], a                                 ; $48D4: $22
    inc  [hl]                                     ; $48D5: $34
    ld   [de], a                                  ; $48D6: $12
    inc  [hl]                                     ; $48D7: $34
    ld   [hl-], a                                 ; $48D8: $32
    ld   de, $48D1                                ; $48D9: $11 $D1 $48
    call label_3BC0                               ; $48DC: $CD $C0 $3B
    call func_004_7FA3                            ; $48DF: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $48E2: $F0 $E7
    rra                                           ; $48E4: $1F
    rra                                           ; $48E5: $1F
    rra                                           ; $48E6: $1F
    and  $01                                      ; $48E7: $E6 $01
    call label_3B0C                               ; $48E9: $CD $0C $3B
    ld   hl, $C240                                ; $48EC: $21 $40 $C2
    add  hl, bc                                   ; $48EF: $09
    ld   a, [hl]                                  ; $48F0: $7E
    push af                                       ; $48F1: $F5
    ld   a, [$D000]                               ; $48F2: $FA $00 $D0
    add  [hl]                                     ; $48F5: $86
    ld   [hl], a                                  ; $48F6: $77
    ld   hl, $C250                                ; $48F7: $21 $50 $C2
    add  hl, bc                                   ; $48FA: $09
    ld   a, [hl]                                  ; $48FB: $7E
    push af                                       ; $48FC: $F5
    ld   a, [wIntroTimer]                         ; $48FD: $FA $01 $D0
    add  [hl]                                     ; $4900: $86
    ld   [hl], a                                  ; $4901: $77
    call func_004_6DCA                            ; $4902: $CD $CA $6D
    pop  af                                       ; $4905: $F1
    ld   hl, $C250                                ; $4906: $21 $50 $C2
    add  hl, bc                                   ; $4909: $09
    ld   [hl], a                                  ; $490A: $77
    pop  af                                       ; $490B: $F1
    ld   hl, $C240                                ; $490C: $21 $40 $C2
    add  hl, bc                                   ; $490F: $09
    ld   [hl], a                                  ; $4910: $77
    ldh  a, [hActiveEntityWalking]                               ; $4911: $F0 $F0
    and  a                                        ; $4913: $A7
    jr   nz, jr_004_4938                          ; $4914: $20 $22

    call func_004_6E03                            ; $4916: $CD $03 $6E
    ld   hl, $C320                                ; $4919: $21 $20 $C3
    add  hl, bc                                   ; $491C: $09
    dec  [hl]                                     ; $491D: $35
    dec  [hl]                                     ; $491E: $35
    ld   hl, $C310                                ; $491F: $21 $10 $C3
    add  hl, bc                                   ; $4922: $09
    ld   a, [hl]                                  ; $4923: $7E
    and  $80                                      ; $4924: $E6 $80
    jr   z, jr_004_4937                           ; $4926: $28 $0F

    ld   [hl], b                                  ; $4928: $70
    call IncrementEntityWalkingAttr               ; $4929: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $492C: $CD $05 $0C
    ld   [hl], $08                                ; $492F: $36 $08
    ld   hl, $C240                                ; $4931: $21 $40 $C2
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $E0                                ; $4935: $36 $E0

jr_004_4937:
    ret                                           ; $4937: $C9

jr_004_4938:
    call IsEntityFrameCounterZero                 ; $4938: $CD $05 $0C
    jp   z, label_004_6D7A                        ; $493B: $CA $7A $6D

    ld   de, $48D1                                ; $493E: $11 $D1 $48
    call label_3BC0                               ; $4941: $CD $C0 $3B
    call func_004_7FA3                            ; $4944: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $4947: $F0 $E7
    rra                                           ; $4949: $1F
    rra                                           ; $494A: $1F
    rra                                           ; $494B: $1F
    and  $01                                      ; $494C: $E6 $01
    call label_3B0C                               ; $494E: $CD $0C $3B
    call label_3B44                               ; $4951: $CD $44 $3B
    call func_004_6DCA                            ; $4954: $CD $CA $6D
    call func_004_6E03                            ; $4957: $CD $03 $6E
    ld   hl, $C320                                ; $495A: $21 $20 $C3
    add  hl, bc                                   ; $495D: $09
    dec  [hl]                                     ; $495E: $35
    dec  [hl]                                     ; $495F: $35
    ld   hl, $C310                                ; $4960: $21 $10 $C3
    add  hl, bc                                   ; $4963: $09
    ld   a, [hl]                                  ; $4964: $7E
    and  $80                                      ; $4965: $E6 $80
    jp   nz, label_004_6D7A                       ; $4967: $C2 $7A $6D

    ret                                           ; $496A: $C9

    xor  $12                                      ; $496B: $EE $12
    ld   hl, sp+$08                               ; $496D: $F8 $08

label_004_496F:
    xor  a                                        ; $496F: $AF
    ldh  [hFFE8], a                               ; $4970: $E0 $E8

jr_004_4972:
    ld   a, $5B                                   ; $4972: $3E $5B
    call label_3B86                               ; $4974: $CD $86 $3B
    ld   hl, $C390                                ; $4977: $21 $90 $C3
    add  hl, de                                   ; $497A: $19
    ld   [hl], $01                                ; $497B: $36 $01
    push bc                                       ; $497D: $C5
    ldh  a, [hFFE8]                               ; $497E: $F0 $E8
    ld   c, a                                     ; $4980: $4F
    ld   hl, $496B                                ; $4981: $21 $6B $49
    add  hl, bc                                   ; $4984: $09
    ldh  a, [hScratchA]                               ; $4985: $F0 $D7
    add  [hl]                                     ; $4987: $86
    ld   hl, wEntity0PosX                         ; $4988: $21 $00 $C2
    add  hl, de                                   ; $498B: $19
    ld   [hl], a                                  ; $498C: $77
    ld   hl, $496D                                ; $498D: $21 $6D $49
    add  hl, bc                                   ; $4990: $09
    ld   a, [hl]                                  ; $4991: $7E
    ld   hl, $C240                                ; $4992: $21 $40 $C2
    add  hl, de                                   ; $4995: $19
    ld   [hl], a                                  ; $4996: $77
    ld   hl, $C320                                ; $4997: $21 $20 $C3
    add  hl, de                                   ; $499A: $19
    ld   [hl], $10                                ; $499B: $36 $10
    ld   hl, wEntitiesWalkingTable                ; $499D: $21 $90 $C2
    add  hl, de                                   ; $49A0: $19
    ld   [hl], $01                                ; $49A1: $36 $01
    ldh  a, [hScratchB]                               ; $49A3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $49A5: $21 $10 $C2
    add  hl, de                                   ; $49A8: $19
    ld   [hl], a                                  ; $49A9: $77
    ld   hl, $C360                                ; $49AA: $21 $60 $C3
    add  hl, de                                   ; $49AD: $19
    ld   [hl], $05                                ; $49AE: $36 $05
    pop  bc                                       ; $49B0: $C1
    ldh  a, [hFFE8]                               ; $49B1: $F0 $E8
    inc  a                                        ; $49B3: $3C
    ldh  [hFFE8], a                               ; $49B4: $E0 $E8
    cp   $02                                      ; $49B6: $FE $02
    jr   nz, jr_004_4972                          ; $49B8: $20 $B8

    jp   label_004_6D7A                           ; $49BA: $C3 $7A $6D

    ld   hl, $C310                                ; $49BD: $21 $10 $C3
    add  hl, bc                                   ; $49C0: $09
    ld   [hl], $7E                                ; $49C1: $36 $7E
    call IsEntityFrameCounterZero                 ; $49C3: $CD $05 $0C
    ld   [hl], $A0                                ; $49C6: $36 $A0
    ret                                           ; $49C8: $C9

    call label_394D                               ; $49C9: $CD $4D $39
    call label_3EE8                               ; $49CC: $CD $E8 $3E
    call func_004_4E52                            ; $49CF: $CD $52 $4E
    ld   hl, $C390                                ; $49D2: $21 $90 $C3
    add  hl, bc                                   ; $49D5: $09
    ld   a, [hl]                                  ; $49D6: $7E
    JP_TABLE                                      ; $49D7: $C7
    call c, $FB49                                 ; $49D8: $DC $49 $FB
    ld   c, l                                     ; $49DB: $4D
    ld   hl, $C360                                ; $49DC: $21 $60 $C3
    add  hl, bc                                   ; $49DF: $09
    ld   [hl], $50                                ; $49E0: $36 $50
    ldh  a, [hActiveEntityWalking]                               ; $49E2: $F0 $F0
    JP_TABLE                                      ; $49E4: $C7
    db   $ed                                      ; $49E5: $ED
    ld   c, c                                     ; $49E6: $49
    dec  l                                        ; $49E7: $2D
    ld   c, d                                     ; $49E8: $4A
    ld   l, d                                     ; $49E9: $6A
    ld   c, d                                     ; $49EA: $4A
    ld   a, [hl]                                  ; $49EB: $7E
    ld   c, d                                     ; $49EC: $4A
    ld   a, [$C157]                               ; $49ED: $FA $57 $C1
    cp   $05                                      ; $49F0: $FE $05
    jr   nz, jr_004_49FB                          ; $49F2: $20 $07

    call IncrementEntityWalkingAttr               ; $49F4: $CD $12 $3B
    ld   a, JINGLE_JUMP_DOWN                      ; $49F7: $3E $08
    ldh  [hJingle], a                             ; $49F9: $E0 $F2

jr_004_49FB:
    call IsEntityFrameCounterZero                 ; $49FB: $CD $05 $0C
    jr   nz, jr_004_4A2C                          ; $49FE: $20 $2C

    ld   [hl], $50                                ; $4A00: $36 $50
    ld   a, [$C1AE]                               ; $4A02: $FA $AE $C1
    cp   $02                                      ; $4A05: $FE $02
    jr   nc, jr_004_4A2C                          ; $4A07: $30 $23

    ld   a, $1B                                   ; $4A09: $3E $1B
    call label_3B86                               ; $4A0B: $CD $86 $3B
    call GetRandomByte                            ; $4A0E: $CD $0D $28
    and  $3F                                      ; $4A11: $E6 $3F
    add  $40                                      ; $4A13: $C6 $40
    ld   hl, wEntity0PosX                         ; $4A15: $21 $00 $C2
    add  hl, de                                   ; $4A18: $19
    ld   [hl], a                                  ; $4A19: $77
    call GetRandomByte                            ; $4A1A: $CD $0D $28
    and  $3F                                      ; $4A1D: $E6 $3F
    add  $30                                      ; $4A1F: $C6 $30
    ld   hl, wEntitiesPosYTable                   ; $4A21: $21 $10 $C2
    add  hl, de                                   ; $4A24: $19
    ld   [hl], a                                  ; $4A25: $77
    ld   hl, $C310                                ; $4A26: $21 $10 $C3
    add  hl, de                                   ; $4A29: $19
    ld   [hl], $70                                ; $4A2A: $36 $70

jr_004_4A2C:
    ret                                           ; $4A2C: $C9

    call $4DB5                                    ; $4A2D: $CD $B5 $4D
    call func_004_7FA3                            ; $4A30: $CD $A3 $7F
    call func_004_6E03                            ; $4A33: $CD $03 $6E
    ld   hl, $C320                                ; $4A36: $21 $20 $C3
    add  hl, bc                                   ; $4A39: $09
    ld   a, [hl]                                  ; $4A3A: $7E
    cp   $A0                                      ; $4A3B: $FE $A0
    jr   z, jr_004_4A41                           ; $4A3D: $28 $02

    dec  [hl]                                     ; $4A3F: $35
    dec  [hl]                                     ; $4A40: $35

jr_004_4A41:
    ld   hl, $C310                                ; $4A41: $21 $10 $C3
    add  hl, bc                                   ; $4A44: $09
    ld   a, [hl]                                  ; $4A45: $7E
    and  $80                                      ; $4A46: $E6 $80
    ret  z                                        ; $4A48: $C8

    ld   [hl], b                                  ; $4A49: $70
    ld   a, $50                                   ; $4A4A: $3E $50
    ld   [$C157], a                               ; $4A4C: $EA $57 $C1
    ld   a, $04                                   ; $4A4F: $3E $04
    ld   [$C158], a                               ; $4A51: $EA $58 $C1
    call IsEntityFrameCounterZero                 ; $4A54: $CD $05 $0C
    ld   [hl], $40                                ; $4A57: $36 $40
    call label_C4B                                ; $4A59: $CD $4B $0C
    ld   a, [$C146]                               ; $4A5C: $FA $46 $C1
    and  a                                        ; $4A5F: $A7
    jr   nz, jr_004_4A67                          ; $4A60: $20 $05

    call label_BFB                                ; $4A62: $CD $FB $0B
    ld   [hl], $14                                ; $4A65: $36 $14

jr_004_4A67:
    jp   IncrementEntityWalkingAttr               ; $4A67: $C3 $12 $3B

    call $4DB5                                    ; $4A6A: $CD $B5 $4D
    call func_004_7FA3                            ; $4A6D: $CD $A3 $7F
    call IsEntityFrameCounterZero                 ; $4A70: $CD $05 $0C
    jr   nz, jr_004_4A78                          ; $4A73: $20 $03

    call IncrementEntityWalkingAttr               ; $4A75: $CD $12 $3B

jr_004_4A78:
    call func_004_4B2E                            ; $4A78: $CD $2E $4B
    jp   label_3B44                               ; $4A7B: $C3 $44 $3B

    call $4DB5                                    ; $4A7E: $CD $B5 $4D
    call func_004_7FA3                            ; $4A81: $CD $A3 $7F
    call label_C56                                ; $4A84: $CD $56 $0C
    ld   hl, $C300                                ; $4A87: $21 $00 $C3
    add  hl, bc                                   ; $4A8A: $09
    ld   a, [hl]                                  ; $4A8B: $7E
    and  a                                        ; $4A8C: $A7
    jr   z, jr_004_4AA5                           ; $4A8D: $28 $16

    cp   $01                                      ; $4A8F: $FE $01
    jp   z, label_004_496F                        ; $4A91: $CA $6F $49

    ldh  [$FFA1], a                               ; $4A94: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $4A96: $F0 $E7
    and  $01                                      ; $4A98: $E6 $01
    jr   nz, jr_004_4AA0                          ; $4A9A: $20 $04

    ld   hl, hLinkPositionY                       ; $4A9C: $21 $99 $FF
    dec  [hl]                                     ; $4A9F: $35

jr_004_4AA0:
    ld   a, $06                                   ; $4AA0: $3E $06
    jp   label_3B0C                               ; $4AA2: $C3 $0C $3B

jr_004_4AA5:
    call func_004_4B52                            ; $4AA5: $CD $52 $4B
    ldh  a, [hFrameCounter]                       ; $4AA8: $F0 $E7
    rra                                           ; $4AAA: $1F
    rra                                           ; $4AAB: $1F
    rra                                           ; $4AAC: $1F
    rra                                           ; $4AAD: $1F
    and  $01                                      ; $4AAE: $E6 $01
    call label_3B0C                               ; $4AB0: $CD $0C $3B
    ld   hl, wEntitiesUnknownTableB               ; $4AB3: $21 $B0 $C2
    add  hl, bc                                   ; $4AB6: $09
    ld   a, [hl]                                  ; $4AB7: $7E
    and  a                                        ; $4AB8: $A7
    jr   z, jr_004_4ACB                           ; $4AB9: $28 $10

    inc  a                                        ; $4ABB: $3C
    call label_3B0C                               ; $4ABC: $CD $0C $3B
    call label_C00                                ; $4ABF: $CD $00 $0C
    jr   nz, jr_004_4ACB                          ; $4AC2: $20 $07

    ld   [hl], $28                                ; $4AC4: $36 $28
    ld   hl, wEntitiesUnknownTableB               ; $4AC6: $21 $B0 $C2
    add  hl, bc                                   ; $4AC9: $09
    dec  [hl]                                     ; $4ACA: $35

jr_004_4ACB:
    xor  a                                        ; $4ACB: $AF
    ldh  [hFFE8], a                               ; $4ACC: $E0 $E8
    ld   a, $14                                   ; $4ACE: $3E $14
    call func_004_4B37                            ; $4AD0: $CD $37 $4B
    call label_3B70                               ; $4AD3: $CD $70 $3B
    ld   hl, $C420                                ; $4AD6: $21 $20 $C4
    add  hl, bc                                   ; $4AD9: $09
    ld   a, [hl]                                  ; $4ADA: $7E
    ld   hl, $C300                                ; $4ADB: $21 $00 $C3
    add  hl, bc                                   ; $4ADE: $09
    or   [hl]                                     ; $4ADF: $B6
    jr   nz, jr_004_4AEF                          ; $4AE0: $20 $0D

    call func_004_4B2E                            ; $4AE2: $CD $2E $4B
    call label_3B44                               ; $4AE5: $CD $44 $3B
    ld   a, $01                                   ; $4AE8: $3E $01
    ldh  [hFFE8], a                               ; $4AEA: $E0 $E8
    call label_3B70                               ; $4AEC: $CD $70 $3B

jr_004_4AEF:
    ld   a, $14                                   ; $4AEF: $3E $14
    call func_004_4B37                            ; $4AF1: $CD $37 $4B
    ld   hl, $C420                                ; $4AF4: $21 $20 $C4
    add  hl, bc                                   ; $4AF7: $09
    ld   a, [hl]                                  ; $4AF8: $7E
    and  a                                        ; $4AF9: $A7
    jr   z, jr_004_4B11                           ; $4AFA: $28 $15

    ldh  a, [hFrameCounter]                       ; $4AFC: $F0 $E7
    and  $1F                                      ; $4AFE: $E6 $1F
    jr   nz, jr_004_4B11                          ; $4B00: $20 $0F

    call label_C00                                ; $4B02: $CD $00 $0C
    ld   [hl], $50                                ; $4B05: $36 $50
    ld   hl, wEntitiesUnknownTableB               ; $4B07: $21 $B0 $C2
    add  hl, bc                                   ; $4B0A: $09
    ld   a, [hl]                                  ; $4B0B: $7E
    cp   $04                                      ; $4B0C: $FE $04
    jr   z, jr_004_4B11                           ; $4B0E: $28 $01

    inc  [hl]                                     ; $4B10: $34

jr_004_4B11:
    ret                                           ; $4B11: $C9

    ld   [$0014], sp                              ; $4B12: $08 $14 $00
    inc  c                                        ; $4B15: $0C
    ld   [$0015], sp                              ; $4B16: $08 $15 $00
    dec  bc                                       ; $4B19: $0B
    ld   [$0016], sp                              ; $4B1A: $08 $16 $00
    ld   [$1708], sp                              ; $4B1D: $08 $08 $17
    nop                                           ; $4B20: $00
    ld   b, $08                                   ; $4B21: $06 $08
    jr   jr_004_4B25                              ; $4B23: $18 $00

jr_004_4B25:
    inc  b                                        ; $4B25: $04
    ld   [$0803], sp                              ; $4B26: $08 $03 $08
    inc  bc                                       ; $4B29: $03
    ld   [$020C], sp                              ; $4B2A: $08 $0C $02
    inc  c                                        ; $4B2D: $0C

func_004_4B2E:
    ld   hl, wEntitiesUnknownTableB               ; $4B2E: $21 $B0 $C2
    add  hl, bc                                   ; $4B31: $09
    ld   a, [hl]                                  ; $4B32: $7E
    sla  a                                        ; $4B33: $CB $27
    sla  a                                        ; $4B35: $CB $27

func_004_4B37:
    ld   e, a                                     ; $4B37: $5F
    ld   d, b                                     ; $4B38: $50
    ld   hl, $4B12                                ; $4B39: $21 $12 $4B
    add  hl, de                                   ; $4B3C: $19
    ld   e, l                                     ; $4B3D: $5D
    ld   d, h                                     ; $4B3E: $54
    push bc                                       ; $4B3F: $C5
    sla  c                                        ; $4B40: $CB $21
    sla  c                                        ; $4B42: $CB $21
    ld   hl, $D580                                ; $4B44: $21 $80 $D5
    add  hl, bc                                   ; $4B47: $09
    ld   c, $04                                   ; $4B48: $0E $04

jr_004_4B4A:
    ld   a, [de]                                  ; $4B4A: $1A
    inc  de                                       ; $4B4B: $13
    ld   [hl+], a                                 ; $4B4C: $22
    dec  c                                        ; $4B4D: $0D
    jr   nz, jr_004_4B4A                          ; $4B4E: $20 $FA

    pop  bc                                       ; $4B50: $C1
    ret                                           ; $4B51: $C9

func_004_4B52:
    ld   hl, wEntitiesUnknownTableD               ; $4B52: $21 $D0 $C2
    add  hl, bc                                   ; $4B55: $09
    ld   a, [hl]                                  ; $4B56: $7E
    JP_TABLE                                      ; $4B57: $C7
    ld   a, h                                     ; $4B58: $7C
    ld   c, e                                     ; $4B59: $4B
    JP_TABLE                                      ; $4B5A: $C7
    ld   c, e                                     ; $4B5B: $4B
    db   $10                                      ; $4B5C: $10
    inc  c                                        ; $4B5D: $0C
    ld   b, $02                                   ; $4B5E: $06 $02
    ldh  a, [hNextSFX]                            ; $4B60: $F0 $F4
    ld   a, [$10FE]                               ; $4B62: $FA $FE $10
    inc  c                                        ; $4B65: $0C
    ld   b, $02                                   ; $4B66: $06 $02
    ldh  a, [hNextSFX]                            ; $4B68: $F0 $F4
    ld   a, [$02FE]                               ; $4B6A: $FA $FE $02
    ld   b, $0C                                   ; $4B6D: $06 $0C
    db   $10                                      ; $4B6F: $10
    ld   [bc], a                                  ; $4B70: $02
    ld   b, $0C                                   ; $4B71: $06 $0C
    db   $10                                      ; $4B73: $10
    cp   $FA                                      ; $4B74: $FE $FA
    db   $f4                                      ; $4B76: $F4
    ldh  a, [hIsGBC]                              ; $4B77: $F0 $FE
    ld   a, [$F0F4]                               ; $4B79: $FA $F4 $F0
    call IsEntityFrameCounterZero                 ; $4B7C: $CD $05 $0C
    and  a                                        ; $4B7F: $A7
    jr   nz, jr_004_4BC6                          ; $4B80: $20 $44

    call GetRandomByte                            ; $4B82: $CD $0D $28
    and  $1F                                      ; $4B85: $E6 $1F
    add  $10                                      ; $4B87: $C6 $10
    ld   [hl], a                                  ; $4B89: $77
    ld   hl, wEntitiesUnknownTableD               ; $4B8A: $21 $D0 $C2
    add  hl, bc                                   ; $4B8D: $09
    inc  [hl]                                     ; $4B8E: $34
    ld   e, $00                                   ; $4B8F: $1E $00
    ldh  a, [wActiveEntityPosX]                               ; $4B91: $F0 $EE
    cp   $50                                      ; $4B93: $FE $50
    jr   c, jr_004_4B98                           ; $4B95: $38 $01

    inc  e                                        ; $4B97: $1C

jr_004_4B98:
    ld   d, $00                                   ; $4B98: $16 $00
    ldh  a, [wActiveEntityPosY]                               ; $4B9A: $F0 $EC
    cp   $48                                      ; $4B9C: $FE $48
    jr   c, jr_004_4BA2                           ; $4B9E: $38 $02

    inc  d                                        ; $4BA0: $14
    inc  d                                        ; $4BA1: $14

jr_004_4BA2:
    ld   a, d                                     ; $4BA2: $7A
    or   e                                        ; $4BA3: $B3
    sla  a                                        ; $4BA4: $CB $27
    sla  a                                        ; $4BA6: $CB $27
    push af                                       ; $4BA8: $F5
    call GetRandomByte                            ; $4BA9: $CD $0D $28
    and  $03                                      ; $4BAC: $E6 $03
    pop  de                                       ; $4BAE: $D1
    or   d                                        ; $4BAF: $B2
    ld   e, a                                     ; $4BB0: $5F
    ld   d, b                                     ; $4BB1: $50
    ld   hl, $4B5C                                ; $4BB2: $21 $5C $4B
    add  hl, de                                   ; $4BB5: $19
    ld   a, [hl]                                  ; $4BB6: $7E
    ld   hl, $C240                                ; $4BB7: $21 $40 $C2
    add  hl, bc                                   ; $4BBA: $09
    ld   [hl], a                                  ; $4BBB: $77
    ld   hl, $4B6C                                ; $4BBC: $21 $6C $4B
    add  hl, de                                   ; $4BBF: $19
    ld   a, [hl]                                  ; $4BC0: $7E
    ld   hl, $C250                                ; $4BC1: $21 $50 $C2
    add  hl, bc                                   ; $4BC4: $09
    ld   [hl], a                                  ; $4BC5: $77

jr_004_4BC6:
    ret                                           ; $4BC6: $C9

    call IsEntityFrameCounterZero                 ; $4BC7: $CD $05 $0C
    jr   z, jr_004_4BD5                           ; $4BCA: $28 $09

    and  $0E                                      ; $4BCC: $E6 $0E
    ret  nz                                       ; $4BCE: $C0

    call func_004_6DCA                            ; $4BCF: $CD $CA $6D
    jp   label_3B23                               ; $4BD2: $C3 $23 $3B

jr_004_4BD5:
    ld   [hl], $30                                ; $4BD5: $36 $30
    ld   hl, wEntitiesUnknownTableD               ; $4BD7: $21 $D0 $C2
    add  hl, bc                                   ; $4BDA: $09
    ld   [hl], b                                  ; $4BDB: $70
    ret                                           ; $4BDC: $C9

Data_004_4BDD::
    db   $F0, $F0, $60, $03, $F0, $F8, $62, $03, $F0, $00, $70, $03, $F0, $08, $70, $23
    db   $F0, $10, $62, $23, $F0, $18, $60, $23, $00, $F0, $64, $03, $00, $F8, $6E, $03
    db   $00, $00, $72, $03, $00, $08, $72, $23, $00, $10, $6E, $23, $00, $18, $64, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $F0, $68, $03, $F0, $F8, $6A, $03, $F0, $00, $7E, $03, $F0, $08, $7E, $23
    db   $F0, $10, $6A, $23, $F0, $18, $68, $23, $00, $F0, $6C, $03, $00, $F8, $6E, $03
    db   $00, $00, $72, $03, $00, $08, $72, $23, $00, $10, $6E, $23, $00, $18, $6C, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $F0, $60, $03, $F0, $F8, $62, $03, $F0, $00, $62, $23, $F0, $08, $62, $03
    db   $F0, $10, $62, $23, $F0, $18, $60, $23, $00, $F0, $64, $03, $00, $F8, $66, $03
    db   $00, $00, $66, $23, $00, $08, $66, $03, $00, $10, $66, $23, $00, $18, $64, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $EC, $60, $03, $F0, $F4, $62, $03, $F0, $FC, $62, $23, $F0, $04, $74, $03
    db   $F0, $0C, $62, $03, $F0, $14, $62, $23, $F0, $1C, $60, $23, $00, $EC, $64, $03
    db   $00, $F4, $66, $03, $00, $FC, $66, $23, $00, $04, $76, $03, $00, $0C, $66, $03
    db   $00, $14, $66, $23, $00, $1C, $64, $23, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $E8, $60, $03, $F0, $F0, $62, $03, $F0, $F8, $62, $23, $F0, $00, $78, $03
    db   $F0, $08, $78, $23, $F0, $10, $62, $03, $F0, $18, $62, $23, $F0, $20, $60, $23
    db   $00, $E8, $64, $03, $00, $F0, $66, $03, $00, $F8, $66, $23, $00, $00, $7A, $03
    db   $00, $08, $7A, $23, $00, $10, $66, $03, $00, $18, $66, $23, $00, $20, $64, $23
    db   $F0, $E8, $60, $03, $F0, $F0, $62, $03, $F0, $F8, $62, $23, $F0, $00, $78, $03
    db   $F0, $08, $78, $23, $F0, $10, $62, $03, $F0, $18, $62, $23, $F0, $20, $60, $23
    db   $00, $E8, $64, $03, $00, $F0, $66, $03, $00, $F8, $66, $23, $00, $00, $7C, $03
    db   $00, $08, $7C, $23, $00, $10, $66, $03, $00, $18, $66, $23, $00, $20, $64, $23
    db   $F0, $E6, $60, $03, $F0, $EE, $62, $03, $F0, $F6, $62, $23, $F0, $FE, $78, $03
    db   $F0, $0A, $78, $23, $F0, $12, $62, $03, $F0, $1A, $62, $23, $F0, $22, $60, $23
    db   $00, $E6, $64, $03, $00, $EE, $66, $03, $00, $F6, $66, $23, $00, $FE, $7C, $03
    db   $00, $0A, $7C, $23, $00, $12, $66, $03, $00, $1A, $66, $23, $00, $22, $64, $23
    db   $0C, $F5, $26, $00, $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00
    db   $0C, $0D, $26, $00, $0C, $13, $26, $00, $21, $B0, $C3, $09, $7E, $50, $17, $CB
    db   $12, $17, $CB, $12, $17, $CB, $12, $17, $CB, $12, $17, $CB, $12, $17, $CB, $12
    db   $E6, $C0

    ld   e, a                                     ; $4DCF: $5F
    ld   hl, Data_004_4BDD                        ; $4DD0: $21 $DD $4B
    add  hl, de                                   ; $4DD3: $19
    ld   c, $10                                   ; $4DD4: $0E $10
    call label_3CE6                               ; $4DD6: $CD $E6 $3C
    ld   a, $10                                   ; $4DD9: $3E $10
    call label_3DA0                               ; $4DDB: $CD $A0 $3D
    ld   hl, $C310                                ; $4DDE: $21 $10 $C3
    add  hl, bc                                   ; $4DE1: $09
    ld   a, [hl]                                  ; $4DE2: $7E
    and  a                                        ; $4DE3: $A7
    ret  z                                        ; $4DE4: $C8

    ldh  a, [$FFEF]                               ; $4DE5: $F0 $EF
    sub  $08                                      ; $4DE7: $D6 $08
    ldh  [wActiveEntityPosY], a                               ; $4DE9: $E0 $EC
    ld   hl, $4D9D                                ; $4DEB: $21 $9D $4D
    ld   c, $06                                   ; $4DEE: $0E $06
    call label_3CE6                               ; $4DF0: $CD $E6 $3C
    ld   a, $06                                   ; $4DF3: $3E $06
    call label_3DA0                               ; $4DF5: $CD $A0 $3D
    jp   label_3D8A                               ; $4DF8: $C3 $8A $3D

    call func_004_4FFE                            ; $4DFB: $CD $FE $4F
    ldh  a, [hActiveEntityType]                               ; $4DFE: $F0 $EA
    cp   $05                                      ; $4E00: $FE $05
    jp   z, label_004_4E60                        ; $4E02: $CA $60 $4E

    ld   hl, $C420                                ; $4E05: $21 $20 $C4
    add  hl, bc                                   ; $4E08: $09
    ldh  a, [hFrameCounter]                       ; $4E09: $F0 $E7
    ld   [hl], a                                  ; $4E0B: $77
    ldh  a, [hActiveEntityWalking]                               ; $4E0C: $F0 $F0
    JP_TABLE                                      ; $4E0E: $C7
    dec  d                                        ; $4E0F: $15
    ld   c, [hl]                                  ; $4E10: $4E
    dec  e                                        ; $4E11: $1D
    ld   c, [hl]                                  ; $4E12: $4E
    ld   h, $4E                                   ; $4E13: $26 $4E
    call IsEntityFrameCounterZero                 ; $4E15: $CD $05 $0C
    ld   [hl], $40                                ; $4E18: $36 $40
    jp   IncrementEntityWalkingAttr               ; $4E1A: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $4E1D: $CD $05 $0C
    ret  nz                                       ; $4E20: $C0

    ld   [hl], $A0                                ; $4E21: $36 $A0
    jp   IncrementEntityWalkingAttr               ; $4E23: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $4E26: $CD $05 $0C
    jr   nz, jr_004_4E4F                          ; $4E29: $20 $24

    ld   e, $0F                                   ; $4E2B: $1E $0F
    ld   d, b                                     ; $4E2D: $50

jr_004_4E2E:
    ld   a, c                                     ; $4E2E: $79
    cp   e                                        ; $4E2F: $BB
    jr   z, jr_004_4E43                           ; $4E30: $28 $11

    ld   hl, wEntitiesTypeTable                   ; $4E32: $21 $80 $C2
    add  hl, de                                   ; $4E35: $19
    ld   a, [hl]                                  ; $4E36: $7E
    and  a                                        ; $4E37: $A7
    jr   z, jr_004_4E43                           ; $4E38: $28 $09

    ld   hl, $C3A0                                ; $4E3A: $21 $A0 $C3
    add  hl, de                                   ; $4E3D: $19
    ld   a, [hl]                                  ; $4E3E: $7E
    cp   $5B                                      ; $4E3F: $FE $5B
    jr   z, jr_004_4E4C                           ; $4E41: $28 $09

jr_004_4E43:
    dec  e                                        ; $4E43: $1D
    ld   a, e                                     ; $4E44: $7B
    cp   $FF                                      ; $4E45: $FE $FF
    jr   nz, jr_004_4E2E                          ; $4E47: $20 $E5

    jp   label_004_5751                           ; $4E49: $C3 $51 $57

jr_004_4E4C:
    jp   label_004_6D7A                           ; $4E4C: $C3 $7A $6D

jr_004_4E4F:
    jp   label_004_50EF                           ; $4E4F: $C3 $EF $50

func_004_4E52:
    call label_BFB                                ; $4E52: $CD $FB $0B
    jr   z, jr_004_4E5F                           ; $4E55: $28 $08

    ld   a, $02                                   ; $4E57: $3E $02
    ldh  [$FFA1], a                               ; $4E59: $E0 $A1
    ld   a, $6A                                   ; $4E5B: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $4E5D: $E0 $9D

jr_004_4E5F:
    ret                                           ; $4E5F: $C9

label_004_4E60:
    call func_004_7FA3                            ; $4E60: $CD $A3 $7F
    ld   hl, $C410                                ; $4E63: $21 $10 $C4
    add  hl, bc                                   ; $4E66: $09
    ld   a, [hl]                                  ; $4E67: $7E
    cp   $02                                      ; $4E68: $FE $02
    jr   nz, jr_004_4E83                          ; $4E6A: $20 $17

    ld   hl, wEntitiesUnknownTableB               ; $4E6C: $21 $B0 $C2
    add  hl, bc                                   ; $4E6F: $09
    ld   a, [hl]                                  ; $4E70: $7E
    and  a                                        ; $4E71: $A7
    jr   z, jr_004_4E82                           ; $4E72: $28 $0E

    call IncrementEntityWalkingAttr               ; $4E74: $CD $12 $3B
    ld   [hl], $02                                ; $4E77: $36 $02
    ld   a, JINGLE_JUMP                           ; $4E79: $3E $24
    ldh  [hJingle], a                             ; $4E7B: $E0 $F2
    call label_3D7F                               ; $4E7D: $CD $7F $3D
    jr   jr_004_4E83                              ; $4E80: $18 $01

jr_004_4E82:
    inc  [hl]                                     ; $4E82: $34

jr_004_4E83:
    call func_004_6D80                            ; $4E83: $CD $80 $6D
    xor  a                                        ; $4E86: $AF
    ldh  [hFFE8], a                               ; $4E87: $E0 $E8
    ldh  a, [hActiveEntityWalking]                               ; $4E89: $F0 $F0
    JP_TABLE                                      ; $4E8B: $C7
    and  h                                        ; $4E8C: $A4
    ld   c, [hl]                                  ; $4E8D: $4E
    db   $eb                                      ; $4E8E: $EB
    ld   c, [hl]                                  ; $4E8F: $4E
    ld   h, l                                     ; $4E90: $65
    ld   c, a                                     ; $4E91: $4F
    ld   a, [hl]                                  ; $4E92: $7E
    ld   c, a                                     ; $4E93: $4F
    db   $10                                      ; $4E94: $10
    inc  c                                        ; $4E95: $0C
    nop                                           ; $4E96: $00
    db   $f4                                      ; $4E97: $F4
    ldh  a, [hNextSFX]                            ; $4E98: $F0 $F4
    nop                                           ; $4E9A: $00
    inc  c                                        ; $4E9B: $0C
    nop                                           ; $4E9C: $00
    inc  c                                        ; $4E9D: $0C
    db   $10                                      ; $4E9E: $10
    inc  c                                        ; $4E9F: $0C
    nop                                           ; $4EA0: $00
    db   $f4                                      ; $4EA1: $F4
    ldh  a, [hNextSFX]                            ; $4EA2: $F0 $F4
    ld   a, $18                                   ; $4EA4: $3E $18
    call func_004_4B37                            ; $4EA6: $CD $37 $4B
    call label_3B39                               ; $4EA9: $CD $39 $3B
    call IsEntityFrameCounterZero                 ; $4EAC: $CD $05 $0C
    jr   nz, jr_004_4EE7                          ; $4EAF: $20 $36

    call GetRandomByte                            ; $4EB1: $CD $0D $28
    and  $07                                      ; $4EB4: $E6 $07
    ld   e, a                                     ; $4EB6: $5F
    ld   d, b                                     ; $4EB7: $50
    ld   hl, $4E94                                ; $4EB8: $21 $94 $4E
    add  hl, de                                   ; $4EBB: $19
    ld   a, [hl]                                  ; $4EBC: $7E
    ld   hl, $C240                                ; $4EBD: $21 $40 $C2
    add  hl, bc                                   ; $4EC0: $09
    ld   [hl], a                                  ; $4EC1: $77
    ld   hl, $4E9C                                ; $4EC2: $21 $9C $4E
    add  hl, de                                   ; $4EC5: $19
    ld   a, [hl]                                  ; $4EC6: $7E
    ld   hl, $C250                                ; $4EC7: $21 $50 $C2
    add  hl, bc                                   ; $4ECA: $09
    ld   [hl], a                                  ; $4ECB: $77
    call GetRandomByte                            ; $4ECC: $CD $0D $28
    and  $03                                      ; $4ECF: $E6 $03
    jr   nz, jr_004_4ED8                          ; $4ED1: $20 $05

    ld   a, $18                                   ; $4ED3: $3E $18
    call label_3BAA                               ; $4ED5: $CD $AA $3B

jr_004_4ED8:
    call GetRandomByte                            ; $4ED8: $CD $0D $28
    and  $0F                                      ; $4EDB: $E6 $0F
    ld   hl, $C320                                ; $4EDD: $21 $20 $C3
    add  hl, bc                                   ; $4EE0: $09
    add  $08                                      ; $4EE1: $C6 $08
    ld   [hl], a                                  ; $4EE3: $77
    call IncrementEntityWalkingAttr               ; $4EE4: $CD $12 $3B

jr_004_4EE7:
    ld   a, b                                     ; $4EE7: $78
    jp   label_3B0C                               ; $4EE8: $C3 $0C $3B

    call IsEntityFrameCounterZero                 ; $4EEB: $CD $05 $0C
    and  a                                        ; $4EEE: $A7
    jr   nz, jr_004_4F60                          ; $4EEF: $20 $6F

    call func_004_6DCA                            ; $4EF1: $CD $CA $6D
    call label_3B23                               ; $4EF4: $CD $23 $3B
    call func_004_6E03                            ; $4EF7: $CD $03 $6E
    ld   hl, $C320                                ; $4EFA: $21 $20 $C3
    add  hl, bc                                   ; $4EFD: $09
    dec  [hl]                                     ; $4EFE: $35
    dec  [hl]                                     ; $4EFF: $35
    ld   a, $18                                   ; $4F00: $3E $18
    call func_004_4B37                            ; $4F02: $CD $37 $4B
    call label_3B44                               ; $4F05: $CD $44 $3B
    ld   hl, $C440                                ; $4F08: $21 $40 $C4
    add  hl, bc                                   ; $4F0B: $09
    ld   a, [hl]                                  ; $4F0C: $7E
    and  a                                        ; $4F0D: $A7
    jr   nz, jr_004_4F14                          ; $4F0E: $20 $04

    call label_3B70                               ; $4F10: $CD $70 $3B
    xor  a                                        ; $4F13: $AF

jr_004_4F14:
    ld   hl, $C310                                ; $4F14: $21 $10 $C3
    add  hl, bc                                   ; $4F17: $09
    ld   a, [hl]                                  ; $4F18: $7E
    and  $80                                      ; $4F19: $E6 $80
    jr   z, jr_004_4F60                           ; $4F1B: $28 $43

    ld   [hl], b                                  ; $4F1D: $70
    ld   hl, $C440                                ; $4F1E: $21 $40 $C4
    add  hl, bc                                   ; $4F21: $09
    ld   [hl], b                                  ; $4F22: $70
    ld   hl, $C320                                ; $4F23: $21 $20 $C3
    add  hl, bc                                   ; $4F26: $09
    ld   a, [hl]                                  ; $4F27: $7E
    sub  $E0                                      ; $4F28: $D6 $E0
    and  $80                                      ; $4F2A: $E6 $80
    jr   z, jr_004_4F49                           ; $4F2C: $28 $1B

    ld   a, $18                                   ; $4F2E: $3E $18
    ld   [$C157], a                               ; $4F30: $EA $57 $C1
    ld   a, JINGLE_HUGE_BUMP                      ; $4F33: $3E $0B
    ldh  [hJingle], a                             ; $4F35: $E0 $F2
    ld   a, [$C146]                               ; $4F37: $FA $46 $C1
    and  a                                        ; $4F3A: $A7
    jr   nz, jr_004_4F49                          ; $4F3B: $20 $0C

    call label_BFB                                ; $4F3D: $CD $FB $0B
    ld   [hl], $0E                                ; $4F40: $36 $0E
    ld   hl, $C320                                ; $4F42: $21 $20 $C3
    add  hl, bc                                   ; $4F45: $09
    ld   [hl], b                                  ; $4F46: $70
    jr   jr_004_4F57                              ; $4F47: $18 $0E

jr_004_4F49:
    ld   hl, $C320                                ; $4F49: $21 $20 $C3
    add  hl, bc                                   ; $4F4C: $09
    ld   a, [hl]                                  ; $4F4D: $7E
    ld   [hl], b                                  ; $4F4E: $70
    cp   $F2                                      ; $4F4F: $FE $F2
    jr   nc, jr_004_4F57                          ; $4F51: $30 $04

    ld   a, JINGLE_BIG_BUMP                       ; $4F53: $3E $20
    ldh  [hJingle], a                             ; $4F55: $E0 $F2

jr_004_4F57:
    call IncrementEntityWalkingAttr               ; $4F57: $CD $12 $3B
    ld   [hl], b                                  ; $4F5A: $70
    call IsEntityFrameCounterZero                 ; $4F5B: $CD $05 $0C
    ld   [hl], $20                                ; $4F5E: $36 $20

jr_004_4F60:
    ld   a, $01                                   ; $4F60: $3E $01
    jp   label_3B0C                               ; $4F62: $C3 $0C $3B

    ld   hl, $C320                                ; $4F65: $21 $20 $C3
    add  hl, bc                                   ; $4F68: $09
    ld   [hl], $60                                ; $4F69: $36 $60
    call func_004_6E03                            ; $4F6B: $CD $03 $6E
    ld   hl, $C310                                ; $4F6E: $21 $10 $C3
    add  hl, bc                                   ; $4F71: $09
    ld   a, [hl]                                  ; $4F72: $7E
    cp   $70                                      ; $4F73: $FE $70
    ret  c                                        ; $4F75: $D8

    call IsEntityFrameCounterZero                 ; $4F76: $CD $05 $0C
    ld   [hl], $30                                ; $4F79: $36 $30
    jp   IncrementEntityWalkingAttr               ; $4F7B: $C3 $12 $3B

    ld   a, $FF                                   ; $4F7E: $3E $FF
    call label_3B0C                               ; $4F80: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $4F83: $CD $05 $0C
    jr   nz, jr_004_4FAD                          ; $4F86: $20 $25

    ld   [hl], $18                                ; $4F88: $36 $18
    ld   hl, $C440                                ; $4F8A: $21 $40 $C4
    add  hl, bc                                   ; $4F8D: $09
    ld   [hl], $01                                ; $4F8E: $36 $01
    call IncrementEntityWalkingAttr               ; $4F90: $CD $12 $3B
    ld   [hl], $01                                ; $4F93: $36 $01
    ld   hl, $C320                                ; $4F95: $21 $20 $C3
    add  hl, bc                                   ; $4F98: $09
    ld   [hl], $C0                                ; $4F99: $36 $C0
    ldh  a, [hLinkPositionX]                      ; $4F9B: $F0 $98
    ld   hl, wEntity0PosX                         ; $4F9D: $21 $00 $C2
    add  hl, bc                                   ; $4FA0: $09
    ld   [hl], a                                  ; $4FA1: $77
    ldh  a, [hLinkPositionY]                      ; $4FA2: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $4FA4: $21 $10 $C2
    add  hl, bc                                   ; $4FA7: $09
    ld   [hl], a                                  ; $4FA8: $77
    ld   a, JINGLE_JUMP_DOWN                      ; $4FA9: $3E $08
    ldh  [hJingle], a                             ; $4FAB: $E0 $F2

jr_004_4FAD:
    ret                                           ; $4FAD: $C9

Data_004_4FAE::
    db   $F0, $F8, $60, $03, $F0, $00, $62, $03, $F0, $08, $62, $23, $F0, $10, $60, $23
    db   $00, $F8, $64, $03, $00, $00, $66, $03, $00, $08, $66, $23, $00, $10, $64, $23
    db   $F0, $F8, $68, $03, $F0, $00, $6A, $03, $F0, $08, $6A, $23, $F0, $10, $68, $23
    db   $00, $F8, $6C, $03, $00, $00, $66, $03, $00, $08, $66, $23, $00, $10, $6C, $23
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_004_4FFE:
    ld   hl, $C3B0                                ; $4FFE: $21 $B0 $C3
    add  hl, bc                                   ; $5001: $09
    ld   a, [hl]                                  ; $5002: $7E
    ld   d, b                                     ; $5003: $50
    rla                                           ; $5004: $17
    rl   d                                        ; $5005: $CB $12
    rla                                           ; $5007: $17
    rl   d                                        ; $5008: $CB $12
    rla                                           ; $500A: $17
    rl   d                                        ; $500B: $CB $12
    rla                                           ; $500D: $17
    rl   d                                        ; $500E: $CB $12
    rla                                           ; $5010: $17
    rl   d                                        ; $5011: $CB $12
    and  $E0                                      ; $5013: $E6 $E0
    ld   e, a                                     ; $5015: $5F
    ld   hl, Data_004_4FAE                        ; $5016: $21 $AE $4F
    add  hl, de                                   ; $5019: $19
    ld   c, $08                                   ; $501A: $0E $08
    call label_3CE6                               ; $501C: $CD $E6 $3C
    ld   a, $08                                   ; $501F: $3E $08
    call label_3DA0                               ; $5021: $CD $A0 $3D
    ld   hl, $C3B0                                ; $5024: $21 $B0 $C3
    add  hl, bc                                   ; $5027: $09
    ld   a, [hl]                                  ; $5028: $7E
    cp   $FF                                      ; $5029: $FE $FF
    jr   z, jr_004_5048                           ; $502B: $28 $1B

    ld   hl, $C310                                ; $502D: $21 $10 $C3
    add  hl, bc                                   ; $5030: $09
    ld   a, [hl]                                  ; $5031: $7E
    and  a                                        ; $5032: $A7
    jr   z, jr_004_5048                           ; $5033: $28 $13

    ldh  a, [$FFEF]                               ; $5035: $F0 $EF
    sub  $02                                      ; $5037: $D6 $02
    ldh  [wActiveEntityPosY], a                               ; $5039: $E0 $EC
    ld   hl, $4FEE                                ; $503B: $21 $EE $4F
    ld   c, $04                                   ; $503E: $0E $04
    call label_3CE6                               ; $5040: $CD $E6 $3C
    ld   a, $04                                   ; $5043: $3E $04
    call label_3DA0                               ; $5045: $CD $A0 $3D

jr_004_5048:
    jp   label_3D8A                               ; $5048: $C3 $8A $3D

    call IsEntityFrameCounterZero                 ; $504B: $CD $05 $0C
    ld   [hl], $FF                                ; $504E: $36 $FF
    ld   hl, $C410                                ; $5050: $21 $10 $C4
    add  hl, bc                                   ; $5053: $09
    ld   [hl], $08                                ; $5054: $36 $08
    ld   hl, $C360                                ; $5056: $21 $60 $C3
    add  hl, bc                                   ; $5059: $09
    ld   [hl], $12                                ; $505A: $36 $12
    ld   hl, wEntity0PosX                         ; $505C: $21 $00 $C2
    add  hl, bc                                   ; $505F: $09
    call func_004_5067                            ; $5060: $CD $67 $50
    ld   hl, wEntitiesPosYTable                   ; $5063: $21 $10 $C2
    add  hl, bc                                   ; $5066: $09

func_004_5067:
    ld   a, [hl]                                  ; $5067: $7E
    add  $08                                      ; $5068: $C6 $08
    ld   [hl], a                                  ; $506A: $77
    ld   a, $FF                                   ; $506B: $3E $FF
    jp   label_3B0C                               ; $506D: $C3 $0C $3B

    ld   hl, wEntitiesUnknownTableB               ; $5070: $21 $B0 $C2
    add  hl, bc                                   ; $5073: $09
    ld   a, [hl]                                  ; $5074: $7E
    JP_TABLE                                      ; $5075: $C7
    ld   a, [hl]                                  ; $5076: $7E
    ld   d, b                                     ; $5077: $50
    ld   h, [hl]                                  ; $5078: $66
    ld   d, h                                     ; $5079: $54
    add  hl, bc                                   ; $507A: $09
    ld   d, l                                     ; $507B: $55
    sbc  l                                        ; $507C: $9D
    ld   d, l                                     ; $507D: $55
    xor  a                                        ; $507E: $AF
    ld   [wScreenShakeHorizontal], a              ; $507F: $EA $55 $C1
    call label_3EE8                               ; $5082: $CD $E8 $3E
    call label_394D                               ; $5085: $CD $4D $39
    call func_004_542F                            ; $5088: $CD $2F $54
    ldh  a, [hActiveEntityType]                               ; $508B: $F0 $EA
    cp   $05                                      ; $508D: $FE $05
    jp   z, label_004_510F                        ; $508F: $CA $0F $51

    ld   hl, $C420                                ; $5092: $21 $20 $C4
    add  hl, bc                                   ; $5095: $09
    ldh  a, [hFrameCounter]                       ; $5096: $F0 $E7
    ld   [hl], a                                  ; $5098: $77
    ld   hl, $C440                                ; $5099: $21 $40 $C4
    add  hl, bc                                   ; $509C: $09
    ld   a, [hl]                                  ; $509D: $7E
    JP_TABLE                                      ; $509E: $C7
    and  l                                        ; $509F: $A5
    ld   d, b                                     ; $50A0: $50
    pop  hl                                       ; $50A1: $E1
    ld   d, b                                     ; $50A2: $50
    jp   hl                                       ; $50A3: $E9

    ld   d, b                                     ; $50A4: $50
    call IsEntityFrameCounterZero                 ; $50A5: $CD $05 $0C
    ld   [hl], $80                                ; $50A8: $36 $80
    ld   e, $0F                                   ; $50AA: $1E $0F
    ld   d, b                                     ; $50AC: $50

jr_004_50AD:
    ld   a, c                                     ; $50AD: $79
    cp   e                                        ; $50AE: $BB
    jr   z, jr_004_50D5                           ; $50AF: $28 $24

    ld   hl, $C340                                ; $50B1: $21 $40 $C3
    add  hl, de                                   ; $50B4: $19
    ld   a, [hl]                                  ; $50B5: $7E
    and  $80                                      ; $50B6: $E6 $80
    jr   nz, jr_004_50D5                          ; $50B8: $20 $1B

    ld   hl, wEntitiesTypeTable                   ; $50BA: $21 $80 $C2
    add  hl, de                                   ; $50BD: $19
    ld   a, [hl]                                  ; $50BE: $7E
    cp   $05                                      ; $50BF: $FE $05
    jr   c, jr_004_50D5                           ; $50C1: $38 $12

    ld   [hl], $01                                ; $50C3: $36 $01
    ld   hl, $C480                                ; $50C5: $21 $80 $C4
    add  hl, de                                   ; $50C8: $19
    ld   [hl], $1F                                ; $50C9: $36 $1F
    ld   hl, $C340                                ; $50CB: $21 $40 $C3
    add  hl, de                                   ; $50CE: $19
    ld   a, [hl]                                  ; $50CF: $7E
    and  $F0                                      ; $50D0: $E6 $F0
    or   $02                                      ; $50D2: $F6 $02
    ld   [hl], a                                  ; $50D4: $77

jr_004_50D5:
    dec  e                                        ; $50D5: $1D
    ld   a, e                                     ; $50D6: $7B
    cp   $FF                                      ; $50D7: $FE $FF
    jr   nz, jr_004_50AD                          ; $50D9: $20 $D2

jr_004_50DB:
    ld   hl, $C440                                ; $50DB: $21 $40 $C4
    add  hl, bc                                   ; $50DE: $09
    inc  [hl]                                     ; $50DF: $34
    ret                                           ; $50E0: $C9

    call IsEntityFrameCounterZero                 ; $50E1: $CD $05 $0C
    ret  nz                                       ; $50E4: $C0

    ld   [hl], $FF                                ; $50E5: $36 $FF
    jr   jr_004_50DB                              ; $50E7: $18 $F2

    call IsEntityFrameCounterZero                 ; $50E9: $CD $05 $0C
    jp   z, label_004_5751                        ; $50EC: $CA $51 $57

label_004_50EF:
    and  $07                                      ; $50EF: $E6 $07
    ret  nz                                       ; $50F1: $C0

    call GetRandomByte                            ; $50F2: $CD $0D $28
    and  $1F                                      ; $50F5: $E6 $1F
    sub  $10                                      ; $50F7: $D6 $10
    ld   e, a                                     ; $50F9: $5F
    ld   hl, wActiveEntityPosX                                ; $50FA: $21 $EE $FF
    add  [hl]                                     ; $50FD: $86
    ld   [hl], a                                  ; $50FE: $77
    call GetRandomByte                            ; $50FF: $CD $0D $28
    and  $1F                                      ; $5102: $E6 $1F
    sub  $10                                      ; $5104: $D6 $10
    ld   e, a                                     ; $5106: $5F
    ld   hl, wActiveEntityPosY                                ; $5107: $21 $EC $FF
    add  [hl]                                     ; $510A: $86
    ld   [hl], a                                  ; $510B: $77
    jp   label_004_5A05                           ; $510C: $C3 $05 $5A

label_004_510F:
    call func_004_7FA3                            ; $510F: $CD $A3 $7F
    ld   hl, $C420                                ; $5112: $21 $20 $C4
    add  hl, bc                                   ; $5115: $09
    ld   a, [hl]                                  ; $5116: $7E
    and  a                                        ; $5117: $A7
    jr   z, jr_004_5120                           ; $5118: $28 $06

    ld   hl, $C390                                ; $511A: $21 $90 $C3
    add  hl, bc                                   ; $511D: $09
    ld   [hl], $FF                                ; $511E: $36 $FF

jr_004_5120:
    ld   hl, $C340                                ; $5120: $21 $40 $C3
    add  hl, bc                                   ; $5123: $09
    ld   [hl], $08                                ; $5124: $36 $08
    ldh  a, [hActiveEntityWalking]                               ; $5126: $F0 $F0
    JP_TABLE                                      ; $5128: $C7
    cpl                                           ; $5129: $2F
    ld   d, c                                     ; $512A: $51
    ld   e, b                                     ; $512B: $58
    ld   d, c                                     ; $512C: $51
    add  sp, $51                                  ; $512D: $E8 $51
    call IsEntityFrameCounterZero                 ; $512F: $CD $05 $0C

jr_004_5132:
    ret  nz                                       ; $5132: $C0

    ld   [hl], $FF                                ; $5133: $36 $FF
    jp   IncrementEntityWalkingAttr               ; $5135: $C3 $12 $3B

jr_004_5138:
    inc  bc                                       ; $5138: $03
    inc  bc                                       ; $5139: $03
    inc  bc                                       ; $513A: $03
    inc  bc                                       ; $513B: $03
    inc  bc                                       ; $513C: $03
    ld   [bc], a                                  ; $513D: $02
    ld   bc, $0100                                ; $513E: $01 $00 $01
    nop                                           ; $5141: $00
    ld   bc, $0101                                ; $5142: $01 $01 $01
    ld   bc, $0101                                ; $5145: $01 $01 $01
    ld   bc, $0101                                ; $5148: $01 $01 $01
    ld   bc, $0101                                ; $514B: $01 $01 $01
    ld   bc, $0000                                ; $514E: $01 $00 $00
    nop                                           ; $5151: $00
    nop                                           ; $5152: $00
    nop                                           ; $5153: $00
    nop                                           ; $5154: $00
    nop                                           ; $5155: $00
    nop                                           ; $5156: $00
    nop                                           ; $5157: $00
    call IsEntityFrameCounterZero                 ; $5158: $CD $05 $0C
    jr   z, jr_004_516C                           ; $515B: $28 $0F

    rra                                           ; $515D: $1F
    rra                                           ; $515E: $1F
    rra                                           ; $515F: $1F
    and  $1F                                      ; $5160: $E6 $1F
    ld   e, a                                     ; $5162: $5F
    ld   d, b                                     ; $5163: $50
    ld   hl, $5138                                ; $5164: $21 $38 $51
    add  hl, de                                   ; $5167: $19

jr_004_5168:
    ld   a, [hl]                                  ; $5168: $7E
    jp   label_3B0C                               ; $5169: $C3 $0C $3B

jr_004_516C:
    call IncrementEntityWalkingAttr               ; $516C: $CD $12 $3B
    call label_C00                                ; $516F: $CD $00 $0C
    ld   [hl], $A0                                ; $5172: $36 $A0
    call label_BFB                                ; $5174: $CD $FB $0B
    ld   [hl], $FF                                ; $5177: $36 $FF
    ld   a, $B6                                   ; $5179: $3E $B6
    jp   OpenDialog                               ; $517B: $C3 $85 $23

    inc  bc                                       ; $517E: $03
    ld   [bc], a                                  ; $517F: $02
    inc  b                                        ; $5180: $04
    ld   [bc], a                                  ; $5181: $02
    jr   z, jr_004_51BC                           ; $5182: $28 $38

    ld   c, b                                     ; $5184: $48
    ld   e, b                                     ; $5185: $58
    ld   l, b                                     ; $5186: $68
    ld   a, b                                     ; $5187: $78
    jr   z, jr_004_5202                           ; $5188: $28 $78

    jr   z, @+$7A                                 ; $518A: $28 $78

    jr   z, jr_004_51C6                           ; $518C: $28 $38

    ld   c, b                                     ; $518E: $48
    ld   e, b                                     ; $518F: $58
    ld   l, b                                     ; $5190: $68
    ld   a, b                                     ; $5191: $78
    jr   nc, jr_004_51C4                          ; $5192: $30 $30

    jr   nc, jr_004_51C6                          ; $5194: $30 $30

    jr   nc, jr_004_51C8                          ; $5196: $30 $30

    ld   b, b                                     ; $5198: $40
    ld   b, b                                     ; $5199: $40
    ld   d, b                                     ; $519A: $50
    ld   d, b                                     ; $519B: $50
    ld   h, b                                     ; $519C: $60
    ld   h, b                                     ; $519D: $60
    ld   h, b                                     ; $519E: $60
    ld   h, b                                     ; $519F: $60
    ld   h, b                                     ; $51A0: $60
    ld   h, b                                     ; $51A1: $60
    jr   z, @+$3A                                 ; $51A2: $28 $38

    ld   c, b                                     ; $51A4: $48
    ld   e, b                                     ; $51A5: $58
    ld   l, b                                     ; $51A6: $68
    ld   a, b                                     ; $51A7: $78
    jr   jr_004_5132                              ; $51A8: $18 $88

    jr   @-$76                                    ; $51AA: $18 $88

    jr   @-$76                                    ; $51AC: $18 $88

    jr   jr_004_5138                              ; $51AE: $18 $88

    jr   z, jr_004_51EA                           ; $51B0: $28 $38

    ld   c, b                                     ; $51B2: $48
    ld   e, b                                     ; $51B3: $58
    ld   l, b                                     ; $51B4: $68
    ld   a, b                                     ; $51B5: $78
    jr   nz, jr_004_51D8                          ; $51B6: $20 $20

    jr   nz, jr_004_51DA                          ; $51B8: $20 $20

    jr   nz, @+$22                                ; $51BA: $20 $20

jr_004_51BC:
    jr   nc, jr_004_51EE                          ; $51BC: $30 $30

    ld   b, b                                     ; $51BE: $40
    ld   b, b                                     ; $51BF: $40
    ld   d, b                                     ; $51C0: $50
    ld   d, b                                     ; $51C1: $50
    ld   h, b                                     ; $51C2: $60
    ld   h, b                                     ; $51C3: $60

jr_004_51C4:
    ld   [hl], b                                  ; $51C4: $70
    ld   [hl], b                                  ; $51C5: $70

jr_004_51C6:
    ld   [hl], b                                  ; $51C6: $70
    ld   [hl], b                                  ; $51C7: $70

jr_004_51C8:
    ld   [hl], b                                  ; $51C8: $70
    ld   [hl], b                                  ; $51C9: $70
    nop                                           ; $51CA: $00
    inc  de                                       ; $51CB: $13
    ld   bc, $0212                                ; $51CC: $01 $12 $02
    ld   de, $1003                                ; $51CF: $11 $03 $10
    inc  b                                        ; $51D2: $04
    rrca                                          ; $51D3: $0F
    dec  b                                        ; $51D4: $05
    ld   c, $06                                   ; $51D5: $0E $06
    dec  c                                        ; $51D7: $0D

jr_004_51D8:
    rlca                                          ; $51D8: $07
    inc  c                                        ; $51D9: $0C

jr_004_51DA:
    ld   [$090B], sp                              ; $51DA: $08 $0B $09
    ld   a, [bc]                                  ; $51DD: $0A
    jr   jr_004_5168                              ; $51DE: $18 $88

    jr   @-$76                                    ; $51E0: $18 $88

    jr   nz, jr_004_5254                          ; $51E2: $20 $70

    ld   [hl], b                                  ; $51E4: $70
    jr   nz, jr_004_51E7                          ; $51E5: $20 $00

jr_004_51E7:
    rst  $38                                      ; $51E7: $FF
    ldh  a, [hFrameCounter]                       ; $51E8: $F0 $E7

jr_004_51EA:
    and  $3F                                      ; $51EA: $E6 $3F
    jr   nz, jr_004_51FA                          ; $51EC: $20 $0C

jr_004_51EE:
    call GetRandomByte                            ; $51EE: $CD $0D $28
    and  $01                                      ; $51F1: $E6 $01
    jr   nz, jr_004_51FA                          ; $51F3: $20 $05

    call IsEntityFrameCounterZero                 ; $51F5: $CD $05 $0C
    ld   [hl], $1F                                ; $51F8: $36 $1F

jr_004_51FA:
    ldh  a, [hFrameCounter]                       ; $51FA: $F0 $E7
    rra                                           ; $51FC: $1F
    rra                                           ; $51FD: $1F
    rra                                           ; $51FE: $1F
    and  $01                                      ; $51FF: $E6 $01
    ld   e, a                                     ; $5201: $5F

jr_004_5202:
    ld   d, b                                     ; $5202: $50
    ld   hl, $51E6                                ; $5203: $21 $E6 $51
    add  hl, de                                   ; $5206: $19
    ld   a, [hl]                                  ; $5207: $7E
    ld   [wScreenShakeHorizontal], a              ; $5208: $EA $55 $C1
    call label_BFB                                ; $520B: $CD $FB $0B
    jr   nz, jr_004_5273                          ; $520E: $20 $63

    call GetRandomByte                            ; $5210: $CD $0D $28
    and  $0F                                      ; $5213: $E6 $0F
    add  $18                                      ; $5215: $C6 $18
    ld   [hl], a                                  ; $5217: $77
    ld   hl, $C3D0                                ; $5218: $21 $D0 $C3
    add  hl, bc                                   ; $521B: $09
    ld   a, [hl]                                  ; $521C: $7E
    cp   $14                                      ; $521D: $FE $14
    jr   c, jr_004_5273                           ; $521F: $38 $52

    ld   hl, wEntitiesUnknownTableD               ; $5221: $21 $D0 $C2
    add  hl, bc                                   ; $5224: $09
    ld   a, [hl]                                  ; $5225: $7E
    cp   $04                                      ; $5226: $FE $04
    jr   c, jr_004_5273                           ; $5228: $38 $49

    ld   a, $5A                                   ; $522A: $3E $5A
    call label_3B86                               ; $522C: $CD $86 $3B
    jr   c, jr_004_5273                           ; $522F: $38 $42

    ld   hl, wEntitiesUnknownTableB               ; $5231: $21 $B0 $C2
    add  hl, de                                   ; $5234: $19
    ld   [hl], $01                                ; $5235: $36 $01

jr_004_5237:
    call GetRandomByte                            ; $5237: $CD $0D $28
    and  $0F                                      ; $523A: $E6 $0F
    ld   hl, wEntitiesUnknownTableC               ; $523C: $21 $C0 $C2
    add  hl, bc                                   ; $523F: $09
    cp   [hl]                                     ; $5240: $BE
    jr   z, jr_004_5237                           ; $5241: $28 $F4

    ld   [hl], a                                  ; $5243: $77
    push bc                                       ; $5244: $C5
    ld   c, a                                     ; $5245: $4F
    ld   hl, $5182                                ; $5246: $21 $82 $51
    add  hl, bc                                   ; $5249: $09
    ld   a, [hl]                                  ; $524A: $7E
    ld   hl, wEntity0PosX                         ; $524B: $21 $00 $C2
    add  hl, de                                   ; $524E: $19
    ld   [hl], a                                  ; $524F: $77
    ld   hl, $5192                                ; $5250: $21 $92 $51
    add  hl, bc                                   ; $5253: $09

jr_004_5254:
    ld   a, [hl]                                  ; $5254: $7E
    ld   hl, wEntitiesPosYTable                   ; $5255: $21 $10 $C2
    add  hl, de                                   ; $5258: $19
    ld   [hl], a                                  ; $5259: $77
    ld   hl, wEntitiesFrameCounterTable           ; $525A: $21 $E0 $C2
    add  hl, de                                   ; $525D: $19
    ld   [hl], $7F                                ; $525E: $36 $7F
    ld   hl, $C340                                ; $5260: $21 $40 $C3
    add  hl, de                                   ; $5263: $19
    ld   [hl], $C2                                ; $5264: $36 $C2
    ld   hl, $C350                                ; $5266: $21 $50 $C3
    add  hl, de                                   ; $5269: $19
    ld   [hl], $00                                ; $526A: $36 $00
    ld   hl, $C430                                ; $526C: $21 $30 $C4
    add  hl, de                                   ; $526F: $19
    ld   [hl], $00                                ; $5270: $36 $00
    pop  bc                                       ; $5272: $C1

jr_004_5273:
    call label_C00                                ; $5273: $CD $00 $0C
    jr   nz, jr_004_52C9                          ; $5276: $20 $51

    ld   [hl], $40                                ; $5278: $36 $40
    ld   hl, $C3D0                                ; $527A: $21 $D0 $C3
    add  hl, bc                                   ; $527D: $09
    ld   a, [hl]                                  ; $527E: $7E
    cp   $14                                      ; $527F: $FE $14
    jr   nc, jr_004_52C9                          ; $5281: $30 $46

    ld   a, $5A                                   ; $5283: $3E $5A
    call label_3B86                               ; $5285: $CD $86 $3B
    jr   c, jr_004_52C9                           ; $5288: $38 $3F

    ld   hl, wEntitiesUnknownTableB               ; $528A: $21 $B0 $C2
    add  hl, de                                   ; $528D: $19
    ld   [hl], $02                                ; $528E: $36 $02
    push bc                                       ; $5290: $C5
    ld   hl, $C3D0                                ; $5291: $21 $D0 $C3
    add  hl, bc                                   ; $5294: $09
    ld   c, [hl]                                  ; $5295: $4E
    inc  [hl]                                     ; $5296: $34
    ld   hl, $51CA                                ; $5297: $21 $CA $51
    add  hl, bc                                   ; $529A: $09
    ld   c, [hl]                                  ; $529B: $4E
    ld   hl, $51A2                                ; $529C: $21 $A2 $51
    add  hl, bc                                   ; $529F: $09
    ld   a, [hl]                                  ; $52A0: $7E
    ld   hl, wEntity0PosX                         ; $52A1: $21 $00 $C2
    add  hl, de                                   ; $52A4: $19
    ld   [hl], a                                  ; $52A5: $77
    ld   hl, $51B6                                ; $52A6: $21 $B6 $51
    add  hl, bc                                   ; $52A9: $09
    ld   a, [hl]                                  ; $52AA: $7E
    ld   hl, wEntitiesPosYTable                   ; $52AB: $21 $10 $C2
    add  hl, de                                   ; $52AE: $19
    ld   [hl], a                                  ; $52AF: $77
    ld   hl, $C340                                ; $52B0: $21 $40 $C3
    add  hl, de                                   ; $52B3: $19
    ld   [hl], $12                                ; $52B4: $36 $12
    ld   hl, $C350                                ; $52B6: $21 $50 $C3
    add  hl, de                                   ; $52B9: $19
    ld   [hl], $00                                ; $52BA: $36 $00
    ld   hl, $C430                                ; $52BC: $21 $30 $C4
    add  hl, de                                   ; $52BF: $19
    ld   [hl], $00                                ; $52C0: $36 $00
    ld   hl, $C4D0                                ; $52C2: $21 $D0 $C4
    add  hl, de                                   ; $52C5: $19
    ld   [hl], $02                                ; $52C6: $36 $02
    pop  bc                                       ; $52C8: $C1

jr_004_52C9:
    ld   hl, $C300                                ; $52C9: $21 $00 $C3
    add  hl, bc                                   ; $52CC: $09
    ld   a, [hl]                                  ; $52CD: $7E
    and  a                                        ; $52CE: $A7
    jr   nz, jr_004_5340                          ; $52CF: $20 $6F

    ld   [hl], $40                                ; $52D1: $36 $40
    ld   hl, wEntitiesUnknownTableD               ; $52D3: $21 $D0 $C2
    add  hl, bc                                   ; $52D6: $09
    ld   a, [hl]                                  ; $52D7: $7E
    cp   $04                                      ; $52D8: $FE $04
    jr   nc, jr_004_5340                          ; $52DA: $30 $64

    ld   hl, $C3D0                                ; $52DC: $21 $D0 $C3
    add  hl, bc                                   ; $52DF: $09
    ld   a, [hl]                                  ; $52E0: $7E
    cp   $12                                      ; $52E1: $FE $12
    jr   c, jr_004_5340                           ; $52E3: $38 $5B

    ld   a, $5A                                   ; $52E5: $3E $5A
    call label_3B86                               ; $52E7: $CD $86 $3B
    jr   c, jr_004_5340                           ; $52EA: $38 $54

    ld   hl, wEntitiesUnknownTableB               ; $52EC: $21 $B0 $C2
    add  hl, de                                   ; $52EF: $19
    ld   [hl], $03                                ; $52F0: $36 $03
    push bc                                       ; $52F2: $C5
    ld   hl, wEntitiesUnknownTableD               ; $52F3: $21 $D0 $C2
    add  hl, bc                                   ; $52F6: $09
    ld   c, [hl]                                  ; $52F7: $4E
    inc  [hl]                                     ; $52F8: $34
    ld   hl, $51DE                                ; $52F9: $21 $DE $51
    add  hl, bc                                   ; $52FC: $09
    ld   a, [hl]                                  ; $52FD: $7E
    ld   hl, wEntity0PosX                         ; $52FE: $21 $00 $C2
    add  hl, de                                   ; $5301: $19
    ld   [hl], a                                  ; $5302: $77
    ldh  [wActiveEntityPosX], a                               ; $5303: $E0 $EE
    ld   hl, $51E2                                ; $5305: $21 $E2 $51
    add  hl, bc                                   ; $5308: $09
    ld   a, [hl]                                  ; $5309: $7E
    ld   hl, wEntitiesPosYTable                   ; $530A: $21 $10 $C2
    add  hl, de                                   ; $530D: $19
    ld   [hl], a                                  ; $530E: $77
    ldh  [$FFEF], a                               ; $530F: $E0 $EF
    ld   hl, $C340                                ; $5311: $21 $40 $C3
    add  hl, de                                   ; $5314: $19
    ld   [hl], $12                                ; $5315: $36 $12
    ld   hl, $C350                                ; $5317: $21 $50 $C3
    add  hl, de                                   ; $531A: $19
    ld   [hl], $00                                ; $531B: $36 $00
    ld   hl, $C430                                ; $531D: $21 $30 $C4
    add  hl, de                                   ; $5320: $19
    ld   [hl], $00                                ; $5321: $36 $00
    ld   hl, $C4D0                                ; $5323: $21 $D0 $C4
    add  hl, de                                   ; $5326: $19
    ld   [hl], $1B                                ; $5327: $36 $1B
    ld   c, e                                     ; $5329: $4B
    ld   b, d                                     ; $532A: $42
    ld   hl, $C240                                ; $532B: $21 $40 $C2
    add  hl, bc                                   ; $532E: $09
    ld   [hl], $01                                ; $532F: $36 $01
    call label_3B23                               ; $5331: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable               ; $5334: $21 $A0 $C2
    add  hl, bc                                   ; $5337: $09
    ld   a, [hl]                                  ; $5338: $7E
    and  a                                        ; $5339: $A7
    jr   nz, jr_004_533F                          ; $533A: $20 $03

    call func_004_6D7A                            ; $533C: $CD $7A $6D

jr_004_533F:
    pop  bc                                       ; $533F: $C1

jr_004_5340:
    call IsEntityFrameCounterZero                 ; $5340: $CD $05 $0C
    rra                                           ; $5343: $1F
    rra                                           ; $5344: $1F
    rra                                           ; $5345: $1F
    and  $03                                      ; $5346: $E6 $03
    ld   e, a                                     ; $5348: $5F
    ld   d, b                                     ; $5349: $50
    ld   hl, $517E                                ; $534A: $21 $7E $51
    add  hl, de                                   ; $534D: $19
    ld   a, [hl]                                  ; $534E: $7E
    call label_3B0C                               ; $534F: $CD $0C $3B
    ld   hl, $C420                                ; $5352: $21 $20 $C4
    add  hl, bc                                   ; $5355: $09
    ld   a, [hl]                                  ; $5356: $7E
    and  a                                        ; $5357: $A7
    jr   z, jr_004_535F                           ; $5358: $28 $05

    ld   a, $02                                   ; $535A: $3E $02
    call label_3B0C                               ; $535C: $CD $0C $3B

jr_004_535F:
    ld   hl, $C390                                ; $535F: $21 $90 $C3
    add  hl, bc                                   ; $5362: $09
    ld   a, [hl]                                  ; $5363: $7E
    and  a                                        ; $5364: $A7
    jr   z, jr_004_537E                           ; $5365: $28 $17

    dec  [hl]                                     ; $5367: $35
    rra                                           ; $5368: $1F
    rra                                           ; $5369: $1F
    rra                                           ; $536A: $1F
    rra                                           ; $536B: $1F
    and  $0F                                      ; $536C: $E6 $0F
    ld   e, a                                     ; $536E: $5F
    ld   d, b                                     ; $536F: $50
    ld   hl, $537F                                ; $5370: $21 $7F $53
    add  hl, de                                   ; $5373: $19
    ld   a, [hl]                                  ; $5374: $7E
    call label_3B0C                               ; $5375: $CD $0C $3B
    ld   hl, $C340                                ; $5378: $21 $40 $C3
    add  hl, bc                                   ; $537B: $09
    ld   [hl], $48                                ; $537C: $36 $48

jr_004_537E:
    ret                                           ; $537E: $C9

    ld   [bc], a                                  ; $537F: $02
    ld   bc, $FF00                                ; $5380: $01 $00 $FF
    rst  $38                                      ; $5383: $FF
    rst  $38                                      ; $5384: $FF
    rst  $38                                      ; $5385: $FF
    rst  $38                                      ; $5386: $FF
    rst  $38                                      ; $5387: $FF
    rst  $38                                      ; $5388: $FF
    rst  $38                                      ; $5389: $FF
    rst  $38                                      ; $538A: $FF
    rst  $38                                      ; $538B: $FF
    nop                                           ; $538C: $00
    ld   bc, $F802                                ; $538D: $01 $02 $F8
    ld   a, [rSVBK]                               ; $5390: $F0 $70
    inc  bc                                       ; $5392: $03
    ld   hl, sp-$08                               ; $5393: $F8 $F8
    ld   [hl], d                                  ; $5395: $72
    inc  bc                                       ; $5396: $03
    ld   hl, sp+$10                               ; $5397: $F8 $10
    ld   [hl], d                                  ; $5399: $72
    inc  hl                                       ; $539A: $23
    ld   hl, sp+$18                               ; $539B: $F8 $18
    ld   [hl], b                                  ; $539D: $70
    inc  hl                                       ; $539E: $23
    ld   [$7CF8], sp                              ; $539F: $08 $F8 $7C
    inc  bc                                       ; $53A2: $03
    ld   [$7E00], sp                              ; $53A3: $08 $00 $7E
    inc  bc                                       ; $53A6: $03
    ld   [$7E08], sp                              ; $53A7: $08 $08 $7E
    inc  hl                                       ; $53AA: $23
    ld   [$7C10], sp                              ; $53AB: $08 $10 $7C
    inc  hl                                       ; $53AE: $23
    ld   hl, sp-$10                               ; $53AF: $F8 $F0
    ld   [hl], h                                  ; $53B1: $74
    inc  bc                                       ; $53B2: $03
    ld   hl, sp-$08                               ; $53B3: $F8 $F8
    db   $76                                      ; $53B5: $76
    inc  bc                                       ; $53B6: $03
    ld   hl, sp+$10                               ; $53B7: $F8 $10
    db   $76                                      ; $53B9: $76
    inc  hl                                       ; $53BA: $23
    ld   hl, sp+$18                               ; $53BB: $F8 $18
    ld   [hl], h                                  ; $53BD: $74
    inc  hl                                       ; $53BE: $23
    ld   [$7CF8], sp                              ; $53BF: $08 $F8 $7C
    inc  bc                                       ; $53C2: $03
    ld   [$7E00], sp                              ; $53C3: $08 $00 $7E
    inc  bc                                       ; $53C6: $03
    ld   [$7E08], sp                              ; $53C7: $08 $08 $7E
    inc  hl                                       ; $53CA: $23
    ld   [$7C10], sp                              ; $53CB: $08 $10 $7C
    inc  hl                                       ; $53CE: $23
    ld   hl, sp-$10                               ; $53CF: $F8 $F0
    ld   [hl], h                                  ; $53D1: $74
    inc  bc                                       ; $53D2: $03
    ld   hl, sp-$08                               ; $53D3: $F8 $F8
    db   $76                                      ; $53D5: $76
    inc  bc                                       ; $53D6: $03
    ld   hl, sp+$10                               ; $53D7: $F8 $10
    db   $76                                      ; $53D9: $76
    inc  hl                                       ; $53DA: $23
    ld   hl, sp+$18                               ; $53DB: $F8 $18
    ld   [hl], h                                  ; $53DD: $74
    inc  hl                                       ; $53DE: $23
    ld   [$60F8], sp                              ; $53DF: $08 $F8 $60
    inc  bc                                       ; $53E2: $03
    ld   [$6200], sp                              ; $53E3: $08 $00 $62
    inc  bc                                       ; $53E6: $03
    ld   [$6208], sp                              ; $53E7: $08 $08 $62
    inc  hl                                       ; $53EA: $23
    ld   [$6010], sp                              ; $53EB: $08 $10 $60
    inc  hl                                       ; $53EE: $23
    ld   hl, sp-$10                               ; $53EF: $F8 $F0
    ld   a, b                                     ; $53F1: $78
    inc  bc                                       ; $53F2: $03
    ld   hl, sp-$08                               ; $53F3: $F8 $F8
    ld   a, d                                     ; $53F5: $7A
    inc  bc                                       ; $53F6: $03
    ld   hl, sp+$10                               ; $53F7: $F8 $10
    ld   a, d                                     ; $53F9: $7A
    inc  hl                                       ; $53FA: $23
    ld   hl, sp+$18                               ; $53FB: $F8 $18
    ld   a, b                                     ; $53FD: $78
    inc  hl                                       ; $53FE: $23
    ld   [$60F8], sp                              ; $53FF: $08 $F8 $60
    inc  bc                                       ; $5402: $03
    ld   [$6200], sp                              ; $5403: $08 $00 $62
    inc  bc                                       ; $5406: $03
    ld   [$6208], sp                              ; $5407: $08 $08 $62
    inc  hl                                       ; $540A: $23
    ld   [$6010], sp                              ; $540B: $08 $10 $60
    inc  hl                                       ; $540E: $23
    ld   hl, sp-$10                               ; $540F: $F8 $F0
    ld   [hl], b                                  ; $5411: $70
    inc  bc                                       ; $5412: $03
    ld   hl, sp-$08                               ; $5413: $F8 $F8
    ld   [hl], d                                  ; $5415: $72
    inc  bc                                       ; $5416: $03
    ld   hl, sp+$10                               ; $5417: $F8 $10
    ld   [hl], d                                  ; $5419: $72
    inc  hl                                       ; $541A: $23
    ld   hl, sp+$18                               ; $541B: $F8 $18
    ld   [hl], b                                  ; $541D: $70
    inc  hl                                       ; $541E: $23
    ld   [$60F8], sp                              ; $541F: $08 $F8 $60
    inc  bc                                       ; $5422: $03
    ld   [$6200], sp                              ; $5423: $08 $00 $62
    inc  bc                                       ; $5426: $03
    ld   [$6208], sp                              ; $5427: $08 $08 $62
    inc  hl                                       ; $542A: $23
    ld   [$6010], sp                              ; $542B: $08 $10 $60
    inc  hl                                       ; $542E: $23

func_004_542F:
    ld   hl, $C3B0                                ; $542F: $21 $B0 $C3
    add  hl, bc                                   ; $5432: $09
    ld   a, [hl]                                  ; $5433: $7E
    rla                                           ; $5434: $17
    rla                                           ; $5435: $17
    rla                                           ; $5436: $17
    rla                                           ; $5437: $17
    rla                                           ; $5438: $17
    and  $E0                                      ; $5439: $E6 $E0
    ld   e, a                                     ; $543B: $5F
    ld   d, b                                     ; $543C: $50
    ld   hl, $538F                                ; $543D: $21 $8F $53
    add  hl, de                                   ; $5440: $19
    ld   c, $08                                   ; $5441: $0E $08
    jp   label_3CE6                               ; $5443: $C3 $E6 $3C

    ld   l, b                                     ; $5446: $68
    ld   b, $68                                   ; $5447: $06 $68
    ld   h, $6A                                   ; $5449: $26 $6A
    ld   b, $6A                                   ; $544B: $06 $6A
    ld   h, $6C                                   ; $544D: $26 $6C
    ld   b, $6C                                   ; $544F: $06 $6C
    ld   h, $6E                                   ; $5451: $26 $6E
    ld   b, $6E                                   ; $5453: $06 $6E
    ld   h, $00                                   ; $5455: $26 $00
    ld   bc, $0302                                ; $5457: $01 $02 $03
    inc  bc                                       ; $545A: $03
    inc  bc                                       ; $545B: $03
    inc  bc                                       ; $545C: $03
    inc  bc                                       ; $545D: $03
    inc  bc                                       ; $545E: $03
    ld   [bc], a                                  ; $545F: $02
    ld   bc, $0000                                ; $5460: $01 $00 $00
    nop                                           ; $5463: $00
    nop                                           ; $5464: $00
    nop                                           ; $5465: $00
    ld   de, $5446                                ; $5466: $11 $46 $54
    call label_3BC0                               ; $5469: $CD $C0 $3B
    call func_004_7FA3                            ; $546C: $CD $A3 $7F
    call IsEntityFrameCounterZero                 ; $546F: $CD $05 $0C
    jp   z, label_004_6D7A                        ; $5472: $CA $7A $6D

    cp   $50                                      ; $5475: $FE $50
    jr   nz, jr_004_547E                          ; $5477: $20 $05

    ld   hl, hJingle                                ; $5479: $21 $F2 $FF
    ld   [hl], $40                                ; $547C: $36 $40

jr_004_547E:
    rra                                           ; $547E: $1F
    rra                                           ; $547F: $1F
    rra                                           ; $5480: $1F
    and  $0F                                      ; $5481: $E6 $0F
    ld   e, a                                     ; $5483: $5F
    ld   d, b                                     ; $5484: $50
    ld   hl, $5456                                ; $5485: $21 $56 $54
    add  hl, de                                   ; $5488: $19
    ld   a, [hl]                                  ; $5489: $7E
    call label_3B0C                               ; $548A: $CD $0C $3B
    cp   $03                                      ; $548D: $FE $03
    jr   nz, jr_004_54F0                          ; $548F: $20 $5F

    ld   a, [wLinkMotionState]                    ; $5491: $FA $1C $C1
    cp   $06                                      ; $5494: $FE $06
    jr   z, jr_004_54F0                           ; $5496: $28 $58

    ldh  a, [$FFA2]                               ; $5498: $F0 $A2
    and  a                                        ; $549A: $A7
    jr   nz, jr_004_54F0                          ; $549B: $20 $53

    call func_004_6E35                            ; $549D: $CD $35 $6E
    add  $08                                      ; $54A0: $C6 $08
    cp   $10                                      ; $54A2: $FE $10
    jr   nc, jr_004_54F0                          ; $54A4: $30 $4A

    call func_004_6E45                            ; $54A6: $CD $45 $6E
    add  $08                                      ; $54A9: $C6 $08
    cp   $10                                      ; $54AB: $FE $10
    jr   nc, jr_004_54F0                          ; $54AD: $30 $41

    ld   a, $0C                                   ; $54AF: $3E $0C
    call label_3BB5                               ; $54B1: $CD $B5 $3B
    ldh  a, [hScratchA]                               ; $54B4: $F0 $D7
    cpl                                           ; $54B6: $2F
    inc  a                                        ; $54B7: $3C
    ldh  [hLinkPositionYIncrement], a                               ; $54B8: $E0 $9B
    ldh  a, [hScratchB]                               ; $54BA: $F0 $D8
    cpl                                           ; $54BC: $2F
    inc  a                                        ; $54BD: $3C
    ldh  [hLinkPositionXIncrement], a                               ; $54BE: $E0 $9A
    push bc                                       ; $54C0: $C5
    call UpdateFinalLinkPosition                  ; $54C1: $CD $A8 $21
    pop  bc                                       ; $54C4: $C1
    call func_004_6E35                            ; $54C5: $CD $35 $6E
    add  $03                                      ; $54C8: $C6 $03
    cp   $06                                      ; $54CA: $FE $06
    jr   nc, jr_004_54F0                          ; $54CC: $30 $22

    call func_004_6E45                            ; $54CE: $CD $45 $6E
    add  $03                                      ; $54D1: $C6 $03
    cp   $06                                      ; $54D3: $FE $06
    jr   nc, jr_004_54F0                          ; $54D5: $30 $19

    ldh  a, [wActiveEntityPosX]                               ; $54D7: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $54D9: $E0 $98
    ld   a, $06                                   ; $54DB: $3E $06
    ld   [wLinkMotionState], a                    ; $54DD: $EA $1C $C1
    call label_CAF                                ; $54E0: $CD $AF $0C
    ld   [$C198], a                               ; $54E3: $EA $98 $C1
    call IsEntityFrameCounterZero                 ; $54E6: $CD $05 $0C
    ld   [hl], $40                                ; $54E9: $36 $40
    ld   a, $50                                   ; $54EB: $3E $50
    ld   [$DBCB], a                               ; $54ED: $EA $CB $DB

jr_004_54F0:
    ret                                           ; $54F0: $C9

    ld   b, b                                     ; $54F1: $40
    ld   b, $40                                   ; $54F2: $06 $40
    ld   h, $42                                   ; $54F4: $26 $42
    ld   b, $42                                   ; $54F6: $06 $42
    ld   h, $70                                   ; $54F8: $26 $70
    ld   b, $70                                   ; $54FA: $06 $70
    ld   h, $72                                   ; $54FC: $26 $72
    ld   b, $72                                   ; $54FE: $06 $72
    ld   h, $40                                   ; $5500: $26 $40
    rlca                                          ; $5502: $07
    ld   b, b                                     ; $5503: $40
    daa                                           ; $5504: $27
    ld   b, d                                     ; $5505: $42
    rlca                                          ; $5506: $07
    ld   b, d                                     ; $5507: $42
    daa                                           ; $5508: $27
    ld   de, $5501                                ; $5509: $11 $01 $55
    ldh  a, [hMapId]                              ; $550C: $F0 $F7
    cp   $06                                      ; $550E: $FE $06
    jr   z, jr_004_551C                           ; $5510: $28 $0A

    ld   de, $54F1                                ; $5512: $11 $F1 $54
    cp   $01                                      ; $5515: $FE $01
    jr   nz, jr_004_551C                          ; $5517: $20 $03

    ld   de, $54F9                                ; $5519: $11 $F9 $54

jr_004_551C:
    call label_3BC0                               ; $551C: $CD $C0 $3B
    call label_C56                                ; $551F: $CD $56 $0C
    ld   hl, $C420                                ; $5522: $21 $20 $C4
    add  hl, bc                                   ; $5525: $09
    ld   a, [hl]                                  ; $5526: $7E
    and  a                                        ; $5527: $A7
    jr   nz, jr_004_5596                          ; $5528: $20 $6C

    call func_004_7FA3                            ; $552A: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $552D: $F0 $E7
    rra                                           ; $552F: $1F
    rra                                           ; $5530: $1F
    rra                                           ; $5531: $1F
    and  $01                                      ; $5532: $E6 $01
    call label_3B0C                               ; $5534: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5537: $F0 $E7
    and  $07                                      ; $5539: $E6 $07
    jr   nz, jr_004_5541                          ; $553B: $20 $04

    ld   a, $3F                                   ; $553D: $3E $3F
    ldh  [hJingle], a                               ; $553F: $E0 $F2

jr_004_5541:
    ldh  a, [hActiveEntityWalking]                               ; $5541: $F0 $F0
    JP_TABLE                                      ; $5543: $C7
    ld   c, d                                     ; $5544: $4A
    ld   d, l                                     ; $5545: $55
    ld   l, c                                     ; $5546: $69
    ld   d, l                                     ; $5547: $55
    add  [hl]                                     ; $5548: $86
    ld   d, l                                     ; $5549: $55
    call IsEntityFrameCounterZero                 ; $554A: $CD $05 $0C
    ld   [hl], $60                                ; $554D: $36 $60
    call IncrementEntityWalkingAttr               ; $554F: $CD $12 $3B
    ld   hl, $C440                                ; $5552: $21 $40 $C4
    add  hl, bc                                   ; $5555: $09
    ld   a, [hl]                                  ; $5556: $7E
    cp   $01                                      ; $5557: $FE $01
    jp   z, label_004_5607                        ; $5559: $CA $07 $56

    cp   $10                                      ; $555C: $FE $10
    jp   z, label_004_5615                        ; $555E: $CA $15 $56

    cp   $20                                      ; $5561: $FE $20
    jp   z, label_004_560E                        ; $5563: $CA $0E $56

    jp   label_004_5623                           ; $5566: $C3 $23 $56

    call label_3B70                               ; $5569: $CD $70 $3B
    call IsEntityFrameCounterZero                 ; $556C: $CD $05 $0C
    jr   z, jr_004_557E                           ; $556F: $28 $0D

    cp   $30                                      ; $5571: $FE $30
    ret  c                                        ; $5573: $D8

    and  $03                                      ; $5574: $E6 $03
    jr   nz, jr_004_557D                          ; $5576: $20 $05

    ld   hl, $C310                                ; $5578: $21 $10 $C3
    add  hl, bc                                   ; $557B: $09
    inc  [hl]                                     ; $557C: $34

jr_004_557D:
    ret                                           ; $557D: $C9

jr_004_557E:
    call IncrementEntityWalkingAttr               ; $557E: $CD $12 $3B
    ld   a, $18                                   ; $5581: $3E $18
    jp   label_3BAA                               ; $5583: $C3 $AA $3B

    call func_004_6DCA                            ; $5586: $CD $CA $6D
    call label_3B23                               ; $5589: $CD $23 $3B
    call label_3B39                               ; $558C: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable               ; $558F: $21 $A0 $C2
    add  hl, bc                                   ; $5592: $09
    ld   a, [hl]                                  ; $5593: $7E
    and  a                                        ; $5594: $A7
    ret  z                                        ; $5595: $C8

label_004_5596:
jr_004_5596:
    jp   label_3E34                               ; $5596: $C3 $34 $3E

    ld   a, [rNR21]                               ; $5599: $F0 $16
    ldh  a, [$FF36]                               ; $559B: $F0 $36
    ld   de, $5599                                ; $559D: $11 $99 $55
    call label_3BC0                               ; $55A0: $CD $C0 $3B
    ld   hl, $C420                                ; $55A3: $21 $20 $C4
    add  hl, bc                                   ; $55A6: $09
    ld   a, [hl]                                  ; $55A7: $7E
    and  a                                        ; $55A8: $A7
    jr   nz, jr_004_5596                          ; $55A9: $20 $EB

    call func_004_7FA3                            ; $55AB: $CD $A3 $7F
    ldh  a, [hActiveEntityWalking]                               ; $55AE: $F0 $F0
    JP_TABLE                                      ; $55B0: $C7
    or   a                                        ; $55B1: $B7
    ld   d, l                                     ; $55B2: $55
    jp   $E055                                    ; $55B3: $C3 $55 $E0

    ld   d, l                                     ; $55B6: $55
    call func_004_561C                            ; $55B7: $CD $1C $56
    call IncrementEntityWalkingAttr               ; $55BA: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $55BD: $CD $05 $0C
    ld   [hl], $60                                ; $55C0: $36 $60
    ret                                           ; $55C2: $C9

    call label_3B70                               ; $55C3: $CD $70 $3B
    call IsEntityFrameCounterZero                 ; $55C6: $CD $05 $0C
    jr   z, jr_004_55D8                           ; $55C9: $28 $0D

    cp   $30                                      ; $55CB: $FE $30
    ret  c                                        ; $55CD: $D8

    and  $03                                      ; $55CE: $E6 $03
    jr   nz, jr_004_55D7                          ; $55D0: $20 $05

    ld   hl, $C310                                ; $55D2: $21 $10 $C3
    add  hl, bc                                   ; $55D5: $09
    inc  [hl]                                     ; $55D6: $34

jr_004_55D7:
    ret                                           ; $55D7: $C9

jr_004_55D8:
    call IncrementEntityWalkingAttr               ; $55D8: $CD $12 $3B
    ld   a, $18                                   ; $55DB: $3E $18
    jp   label_3BAA                               ; $55DD: $C3 $AA $3B

    call func_004_6DCA                            ; $55E0: $CD $CA $6D
    call label_3B23                               ; $55E3: $CD $23 $3B
    call label_3B39                               ; $55E6: $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable               ; $55E9: $21 $A0 $C2
    add  hl, bc                                   ; $55EC: $09
    ld   a, [hl]                                  ; $55ED: $7E
    and  a                                        ; $55EE: $A7
    jp   nz, label_004_5596                       ; $55EF: $C2 $96 $55

    ret                                           ; $55F2: $C9

    db   $10                                      ; $55F3: $10
    ld   [de], a                                  ; $55F4: $12
    ld   de, $1013                                ; $55F5: $11 $13 $10
    ld   [de], a                                  ; $55F8: $12
    ld   de, $1413                                ; $55F9: $11 $13 $14
    ld   d, $15                                   ; $55FC: $16 $15
    rla                                           ; $55FE: $17
    db   $76                                      ; $55FF: $76
    ld   [hl], a                                  ; $5600: $77
    db   $76                                      ; $5601: $76
    ld   [hl], a                                  ; $5602: $77
    db   $76                                      ; $5603: $76
    ld   c, c                                     ; $5604: $49
    db   $76                                      ; $5605: $76
    ld   c, c                                     ; $5606: $49

label_004_5607:
    ld   de, $55FB                                ; $5607: $11 $FB $55
    ld   a, $AA                                   ; $560A: $3E $AA
    jr   jr_004_5628                              ; $560C: $18 $1A

label_004_560E:
    ld   de, $55FF                                ; $560E: $11 $FF $55
    ld   a, $AE                                   ; $5611: $3E $AE
    jr   jr_004_5628                              ; $5613: $18 $13

label_004_5615:
    ld   de, $5603                                ; $5615: $11 $03 $56
    ld   a, $1D                                   ; $5618: $3E $1D
    jr   jr_004_5628                              ; $561A: $18 $0C

func_004_561C:
    ld   de, $55F7                                ; $561C: $11 $F7 $55
    ld   a, $0D                                   ; $561F: $3E $0D
    jr   jr_004_5628                              ; $5621: $18 $05

label_004_5623:
    ld   de, $55F3                                ; $5623: $11 $F3 $55
    ld   a, $0D                                   ; $5626: $3E $0D

jr_004_5628:
    ldh  [hScratchA], a                               ; $5628: $E0 $D7
    push de                                       ; $562A: $D5
    ldh  a, [$FFEF]                               ; $562B: $F0 $EF
    sub  $0F                                      ; $562D: $D6 $0F
    ldh  [hSwordIntersectedAreaY], a                               ; $562F: $E0 $CD
    ldh  a, [wActiveEntityPosX]                               ; $5631: $F0 $EE
    sub  $07                                      ; $5633: $D6 $07
    ldh  [hSwordIntersectedAreaX], a                               ; $5635: $E0 $CE
    swap a                                        ; $5637: $CB $37
    and  $0F                                      ; $5639: $E6 $0F
    ld   e, a                                     ; $563B: $5F
    ldh  a, [hSwordIntersectedAreaY]                               ; $563C: $F0 $CD
    and  $F0                                      ; $563E: $E6 $F0
    or   e                                        ; $5640: $B3
    ld   e, a                                     ; $5641: $5F
    ld   d, $00                                   ; $5642: $16 $00
    ld   hl, wRoomObjects                       ; $5644: $21 $11 $D7
    add  hl, de                                   ; $5647: $19
    ldh  a, [hScratchA]                               ; $5648: $F0 $D7
    ld   [hl], a                                  ; $564A: $77
    call label_2887                               ; $564B: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $564E: $F0 $FE
    and  a                                        ; $5650: $A7
    jr   z, jr_004_565F                           ; $5651: $28 $0C

    push bc                                       ; $5653: $C5
    ldh  a, [hScratchA]                               ; $5654: $F0 $D7
    ld   [$DDD8], a                               ; $5656: $EA $D8 $DD
    ld   a, $04                                   ; $5659: $3E $04
    call label_91D                                ; $565B: $CD $1D $09
    pop  bc                                       ; $565E: $C1

jr_004_565F:
    ld   a, [wRequests]                           ; $565F: $FA $00 $D6
    ld   e, a                                     ; $5662: $5F
    ld   d, $00                                   ; $5663: $16 $00
    ld   hl, wRequestDestinationHigh              ; $5665: $21 $01 $D6
    add  hl, de                                   ; $5668: $19
    add  $0A                                      ; $5669: $C6 $0A
    ld   [wRequests], a                           ; $566B: $EA $00 $D6
    pop  de                                       ; $566E: $D1
    ldh  a, [$FFCF]                               ; $566F: $F0 $CF
    ld   [hl+], a                                 ; $5671: $22
    ldh  a, [$FFD0]                               ; $5672: $F0 $D0
    ld   [hl+], a                                 ; $5674: $22
    ld   a, $81                                   ; $5675: $3E $81
    ld   [hl+], a                                 ; $5677: $22
    ld   a, [de]                                  ; $5678: $1A
    inc  de                                       ; $5679: $13
    ld   [hl+], a                                 ; $567A: $22
    ld   a, [de]                                  ; $567B: $1A
    inc  de                                       ; $567C: $13
    ld   [hl+], a                                 ; $567D: $22
    ldh  a, [$FFCF]                               ; $567E: $F0 $CF
    ld   [hl+], a                                 ; $5680: $22
    ldh  a, [$FFD0]                               ; $5681: $F0 $D0
    inc  a                                        ; $5683: $3C
    ld   [hl+], a                                 ; $5684: $22
    ld   a, $81                                   ; $5685: $3E $81
    ld   [hl+], a                                 ; $5687: $22
    ld   a, [de]                                  ; $5688: $1A
    inc  de                                       ; $5689: $13
    ld   [hl+], a                                 ; $568A: $22
    ld   a, [de]                                  ; $568B: $1A
    ld   [hl+], a                                 ; $568C: $22
    xor  a                                        ; $568D: $AF
    ld   [hl], a                                  ; $568E: $77
    ret                                           ; $568F: $C9

label_004_5690:
    xor  a                                        ; $5690: $AF
    ld   [$D201], a                               ; $5691: $EA $01 $D2
    ld   e, $80                                   ; $5694: $1E $80
    ld   hl, $D100                                ; $5696: $21 $00 $D1

jr_004_5699:
    xor  a                                        ; $5699: $AF
    ld   [hl+], a                                 ; $569A: $22
    dec  e                                        ; $569B: $1D
    jr   nz, jr_004_5699                          ; $569C: $20 $FB

    ret                                           ; $569E: $C9

    ld   b, $07                                   ; $569F: $06 $07
    nop                                           ; $56A1: $00
    ld   bc, $0302                                ; $56A2: $01 $02 $03
    inc  b                                        ; $56A5: $04
    dec  b                                        ; $56A6: $05

func_004_56A7:
    call func_004_7FA3                            ; $56A7: $CD $A3 $7F
    jp   label_3B39                               ; $56AA: $C3 $39 $3B

    call label_394D                               ; $56AD: $CD $4D $39
    call func_004_56A7                            ; $56B0: $CD $A7 $56
    call $5902                                    ; $56B3: $CD $02 $59
    call label_C56                                ; $56B6: $CD $56 $0C
    ld   a, [wRoomTransitionState]                ; $56B9: $FA $24 $C1
    and  a                                        ; $56BC: $A7
    jp   nz, label_004_5690                       ; $56BD: $C2 $90 $56

    call label_3EE8                               ; $56C0: $CD $E8 $3E
    ldh  a, [hActiveEntityType]                               ; $56C3: $F0 $EA
    cp   $05                                      ; $56C5: $FE $05
    jp   z, label_004_5791                        ; $56C7: $CA $91 $57

    ldh  a, [hActiveEntityWalking]                               ; $56CA: $F0 $F0
    JP_TABLE                                      ; $56CC: $C7
    push de                                       ; $56CD: $D5
    ld   d, [hl]                                  ; $56CE: $56
    db   $e3                                      ; $56CF: $E3
    ld   d, [hl]                                  ; $56D0: $56
    ld   a, [$ff00+c]                             ; $56D1: $F2
    ld   d, [hl]                                  ; $56D2: $56
    dec  e                                        ; $56D3: $1D
    ld   d, a                                     ; $56D4: $57
    call IsEntityFrameCounterZero                 ; $56D5: $CD $05 $0C
    ld   [hl], $60                                ; $56D8: $36 $60
    ld   hl, $C420                                ; $56DA: $21 $20 $C4
    add  hl, bc                                   ; $56DD: $09
    ld   [hl], $FF                                ; $56DE: $36 $FF
    jp   IncrementEntityWalkingAttr               ; $56E0: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $56E3: $CD $05 $0C
    ret  nz                                       ; $56E6: $C0

    ld   [hl], $FF                                ; $56E7: $36 $FF
    ld   hl, $C420                                ; $56E9: $21 $20 $C4
    add  hl, bc                                   ; $56EC: $09
    ld   [hl], $FF                                ; $56ED: $36 $FF
    jp   IncrementEntityWalkingAttr               ; $56EF: $C3 $12 $3B

    call IsEntityFrameCounterZero                 ; $56F2: $CD $05 $0C
    and  $1F                                      ; $56F5: $E6 $1F
    ret  nz                                       ; $56F7: $C0

    ld   hl, wEntitiesUnknownTableD               ; $56F8: $21 $D0 $C2
    add  hl, bc                                   ; $56FB: $09
    ld   a, [hl]                                  ; $56FC: $7E
    cp   $04                                      ; $56FD: $FE $04
    jr   z, jr_004_5705                           ; $56FF: $28 $04

    inc  [hl]                                     ; $5701: $34
    jp   label_004_5A05                           ; $5702: $C3 $05 $5A

jr_004_5705:
    call IsEntityFrameCounterZero                 ; $5705: $CD $05 $0C
    ld   [hl], $30                                ; $5708: $36 $30
    jp   IncrementEntityWalkingAttr               ; $570A: $C3 $12 $3B

    nop                                           ; $570D: $00
    ld   b, $08                                   ; $570E: $06 $08
    ld   b, $00                                   ; $5710: $06 $00
    ld   a, [$FAF8]                               ; $5712: $FA $F8 $FA
    ld   hl, sp-$06                               ; $5715: $F8 $FA
    nop                                           ; $5717: $00
    ld   b, $08                                   ; $5718: $06 $08
    ld   b, $00                                   ; $571A: $06 $00
    ld   a, [$05CD]                               ; $571C: $FA $CD $05
    inc  c                                        ; $571F: $0C
    jp   z, label_004_5751                        ; $5720: $CA $51 $57

    and  $03                                      ; $5723: $E6 $03
    jr   nz, jr_004_5750                          ; $5725: $20 $29

    ld   a, [hl]                                  ; $5727: $7E
    rra                                           ; $5728: $1F
    rra                                           ; $5729: $1F
    and  $07                                      ; $572A: $E6 $07
    ld   e, a                                     ; $572C: $5F
    ld   d, b                                     ; $572D: $50
    ld   hl, $570D                                ; $572E: $21 $0D $57
    add  hl, de                                   ; $5731: $19
    ldh  a, [wActiveEntityPosX]                               ; $5732: $F0 $EE
    add  [hl]                                     ; $5734: $86
    ldh  [wActiveEntityPosX], a                               ; $5735: $E0 $EE
    ld   hl, $5715                                ; $5737: $21 $15 $57
    add  hl, de                                   ; $573A: $19
    ldh  a, [wActiveEntityPosY]                               ; $573B: $F0 $EC
    add  [hl]                                     ; $573D: $86
    ldh  [wActiveEntityPosY], a                               ; $573E: $E0 $EC
    call func_004_5A05                            ; $5740: $CD $05 $5A
    call IsEntityFrameCounterZero                 ; $5743: $CD $05 $0C
    cp   $10                                      ; $5746: $FE $10
    jr   nz, jr_004_5750                          ; $5748: $20 $06

    ld   hl, wEntitiesUnknownTableD               ; $574A: $21 $D0 $C2
    add  hl, bc                                   ; $574D: $09
    ld   [hl], $05                                ; $574E: $36 $05

jr_004_5750:
    ret                                           ; $5750: $C9

label_004_5751:
    ld   a, $36                                   ; $5751: $3E $36
    call label_3B86                               ; $5753: $CD $86 $3B
    ldh  a, [hScratchA]                               ; $5756: $F0 $D7
    cp   $88                                      ; $5758: $FE $88
    jr   c, jr_004_575E                           ; $575A: $38 $02

    ld   a, $88                                   ; $575C: $3E $88

jr_004_575E:
    cp   $18                                      ; $575E: $FE $18
    jr   nc, jr_004_5764                          ; $5760: $30 $02

    ld   a, $18                                   ; $5762: $3E $18

jr_004_5764:
    ld   hl, wEntity0PosX                         ; $5764: $21 $00 $C2
    add  hl, de                                   ; $5767: $19
    ld   [hl], a                                  ; $5768: $77
    ldh  a, [hScratchB]                               ; $5769: $F0 $D8
    cp   $70                                      ; $576B: $FE $70
    jr   c, jr_004_5771                           ; $576D: $38 $02

    ld   a, $70                                   ; $576F: $3E $70

jr_004_5771:
    cp   $20                                      ; $5771: $FE $20
    jr   nc, jr_004_5777                          ; $5773: $30 $02

    ld   a, $20                                   ; $5775: $3E $20

jr_004_5777:
    ld   hl, wEntitiesPosYTable                   ; $5777: $21 $10 $C2
    add  hl, de                                   ; $577A: $19
    ld   [hl], a                                  ; $577B: $77
    ld   hl, $C320                                ; $577C: $21 $20 $C3
    add  hl, de                                   ; $577F: $19
    ld   [hl], $10                                ; $5780: $36 $10
    ldh  a, [hScratchD]                               ; $5782: $F0 $DA
    ld   hl, $C310                                ; $5784: $21 $10 $C3
    add  hl, de                                   ; $5787: $19
    ld   [hl], a                                  ; $5788: $77
    ld   hl, hNextSFX                             ; $5789: $21 $F4 $FF
    ld   [hl], $1A                                ; $578C: $36 $1A
    jp   label_004_6D7A                           ; $578E: $C3 $7A $6D

label_004_5791:
    call label_3D8A                               ; $5791: $CD $8A $3D
    call func_004_7FA3                            ; $5794: $CD $A3 $7F
    xor  a                                        ; $5797: $AF
    ld   [$D3D6], a                               ; $5798: $EA $D6 $D3
    ld   e, $10                                   ; $579B: $1E $10
    ld   hl, $C360                                ; $579D: $21 $60 $C3
    add  hl, bc                                   ; $57A0: $09
    ld   a, [hl]                                  ; $57A1: $7E
    cp   $02                                      ; $57A2: $FE $02
    jr   c, jr_004_57AE                           ; $57A4: $38 $08

    ld   hl, $C300                                ; $57A6: $21 $00 $C3
    add  hl, bc                                   ; $57A9: $09
    ld   a, [hl]                                  ; $57AA: $7E
    and  a                                        ; $57AB: $A7
    jr   z, jr_004_57B8                           ; $57AC: $28 $0A

jr_004_57AE:
    call func_004_57C6                            ; $57AE: $CD $C6 $57
    ld   a, $01                                   ; $57B1: $3E $01
    ld   [$D3D6], a                               ; $57B3: $EA $D6 $D3
    ld   e, $0B                                   ; $57B6: $1E $0B

jr_004_57B8:
    ld   hl, $D201                                ; $57B8: $21 $01 $D2
    ld   a, [hl]                                  ; $57BB: $7E
    inc  a                                        ; $57BC: $3C
    ld   [hl], a                                  ; $57BD: $77
    cp   e                                        ; $57BE: $BB
    jr   c, jr_004_57C6                           ; $57BF: $38 $05

    ld   [hl], b                                  ; $57C1: $70
    ld   a, $1B                                   ; $57C2: $3E $1B
    ldh  [hNextSFX], a                            ; $57C4: $E0 $F4

func_004_57C6:
jr_004_57C6:
    ld   hl, $C3D0                                ; $57C6: $21 $D0 $C3
    add  hl, bc                                   ; $57C9: $09
    ld   a, [hl]                                  ; $57CA: $7E
    inc  a                                        ; $57CB: $3C
    and  $7F                                      ; $57CC: $E6 $7F
    ld   [hl], a                                  ; $57CE: $77
    ld   e, a                                     ; $57CF: $5F
    ld   d, b                                     ; $57D0: $50
    ld   hl, $D000                                ; $57D1: $21 $00 $D0
    add  hl, de                                   ; $57D4: $19
    ldh  a, [wActiveEntityPosX]                               ; $57D5: $F0 $EE
    ld   [hl], a                                  ; $57D7: $77
    ld   hl, $D100                                ; $57D8: $21 $00 $D1
    add  hl, de                                   ; $57DB: $19
    ldh  a, [wActiveEntityPosY]                               ; $57DC: $F0 $EC
    ld   [hl], a                                  ; $57DE: $77
    call func_004_5AE6                            ; $57DF: $CD $E6 $5A
    ld   hl, wEntitiesUnknownTableB               ; $57E2: $21 $B0 $C2
    add  hl, bc                                   ; $57E5: $09
    ld   e, [hl]                                  ; $57E6: $5E
    srl  e                                        ; $57E7: $CB $3B
    ld   d, b                                     ; $57E9: $50
    ld   hl, $569F                                ; $57EA: $21 $9F $56
    add  hl, de                                   ; $57ED: $19
    ld   a, [hl]                                  ; $57EE: $7E
    jp   label_3B0C                               ; $57EF: $C3 $0C $3B

Data_004_57F2::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $64, $00, $08, $00, $66, $00, $08, $08, $66, $20, $08, $10, $64, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $6C, $00, $08, $00, $6E, $00, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $68, $00, $F8, $00, $6A, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $68, $40, $08, $00, $6A, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $6C, $40, $F8, $00, $6E, $40, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $64, $40, $F8, $00, $66, $40, $F8, $08, $66, $60, $F8, $10, $64, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6E, $60, $F8, $10, $6C, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6A, $20, $F8, $10, $68, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6A, $60, $08, $10, $68, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6E, $20, $08, $10, $6C, $20
    db   $70, $00, $70, $20, $72, $00, $72, $20, $74, $00, $74, $20, $76, $00, $76

    jr   nz, jr_004_5924                          ; $5901: $20 $21

    ret  nc                                       ; $5903: $D0

    jp   nz, label_004_7E09                       ; $5904: $C2 $09 $7E

    cp   $05                                      ; $5907: $FE $05
    jp   nc, label_004_5A04                       ; $5909: $D2 $04 $5A

    ld   hl, $C340                                ; $590C: $21 $40 $C3
    add  hl, bc                                   ; $590F: $09
    ld   [hl], $08                                ; $5910: $36 $08
    ld   hl, $C3B0                                ; $5912: $21 $B0 $C3
    add  hl, bc                                   ; $5915: $09
    ld   a, [hl]                                  ; $5916: $7E
    rla                                           ; $5917: $17
    rla                                           ; $5918: $17
    rla                                           ; $5919: $17
    rla                                           ; $591A: $17
    rla                                           ; $591B: $17
    and  $E0                                      ; $591C: $E6 $E0
    ld   e, a                                     ; $591E: $5F
    ld   d, b                                     ; $591F: $50
    ld   hl, Data_004_57F2                        ; $5920: $21 $F2 $57
    add  hl, de                                   ; $5923: $19

jr_004_5924:
    ld   c, $08                                   ; $5924: $0E $08
    call label_3CE6                               ; $5926: $CD $E6 $3C
    ld   hl, $C340                                ; $5929: $21 $40 $C3
    add  hl, bc                                   ; $592C: $09
    ld   [hl], $02                                ; $592D: $36 $02
    ld   hl, $C3D0                                ; $592F: $21 $D0 $C3
    add  hl, bc                                   ; $5932: $09
    ld   a, [hl]                                  ; $5933: $7E
    ldh  [hScratchA], a                               ; $5934: $E0 $D7
    ld   hl, wEntitiesUnknownTableD               ; $5936: $21 $D0 $C2
    add  hl, bc                                   ; $5939: $09
    ld   a, [hl]                                  ; $593A: $7E
    cp   $04                                      ; $593B: $FE $04
    jp   nc, label_004_5A04                       ; $593D: $D2 $04 $5A

    ldh  a, [hScratchA]                               ; $5940: $F0 $D7
    sub  $0C                                      ; $5942: $D6 $0C
    and  $7F                                      ; $5944: $E6 $7F
    ld   e, a                                     ; $5946: $5F
    ld   d, b                                     ; $5947: $50
    ld   hl, $D000                                ; $5948: $21 $00 $D0
    add  hl, de                                   ; $594B: $19
    ld   a, [hl]                                  ; $594C: $7E
    ldh  [wActiveEntityPosX], a                               ; $594D: $E0 $EE
    ld   hl, $D100                                ; $594F: $21 $00 $D1
    add  hl, de                                   ; $5952: $19
    ld   a, [hl]                                  ; $5953: $7E
    ldh  [wActiveEntityPosY], a                               ; $5954: $E0 $EC
    ld   a, $00                                   ; $5956: $3E $00
    ldh  [$FFF1], a                               ; $5958: $E0 $F1
    ld   de, $58F2                                ; $595A: $11 $F2 $58
    call label_3BC0                               ; $595D: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableD               ; $5960: $21 $D0 $C2
    add  hl, bc                                   ; $5963: $09
    ld   a, [hl]                                  ; $5964: $7E
    cp   $03                                      ; $5965: $FE $03
    jp   nc, label_004_5A04                       ; $5967: $D2 $04 $5A

    ldh  a, [hScratchA]                               ; $596A: $F0 $D7
    sub  $18                                      ; $596C: $D6 $18
    and  $7F                                      ; $596E: $E6 $7F
    ld   e, a                                     ; $5970: $5F
    ld   d, b                                     ; $5971: $50
    ld   hl, $D000                                ; $5972: $21 $00 $D0
    add  hl, de                                   ; $5975: $19
    ld   a, [hl]                                  ; $5976: $7E
    ldh  [wActiveEntityPosX], a                               ; $5977: $E0 $EE
    ld   hl, $D100                                ; $5979: $21 $00 $D1
    add  hl, de                                   ; $597C: $19
    ld   a, [hl]                                  ; $597D: $7E
    ldh  [wActiveEntityPosY], a                               ; $597E: $E0 $EC
    ld   a, $00                                   ; $5980: $3E $00
    ldh  [$FFF1], a                               ; $5982: $E0 $F1
    ld   de, $58F2                                ; $5984: $11 $F2 $58
    call label_3BC0                               ; $5987: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableD               ; $598A: $21 $D0 $C2
    add  hl, bc                                   ; $598D: $09
    ld   a, [hl]                                  ; $598E: $7E
    cp   $02                                      ; $598F: $FE $02
    jr   nc, jr_004_5A04                          ; $5991: $30 $71

    ldh  a, [hScratchA]                               ; $5993: $F0 $D7
    sub  $24                                      ; $5995: $D6 $24
    and  $7F                                      ; $5997: $E6 $7F
    ld   e, a                                     ; $5999: $5F
    ld   d, b                                     ; $599A: $50
    ld   hl, $D000                                ; $599B: $21 $00 $D0
    add  hl, de                                   ; $599E: $19
    ld   a, [hl]                                  ; $599F: $7E
    ldh  [wActiveEntityPosX], a                               ; $59A0: $E0 $EE
    ld   hl, $D100                                ; $59A2: $21 $00 $D1
    add  hl, de                                   ; $59A5: $19
    ld   a, [hl]                                  ; $59A6: $7E
    ldh  [wActiveEntityPosY], a                               ; $59A7: $E0 $EC
    ld   a, $01                                   ; $59A9: $3E $01
    ldh  [$FFF1], a                               ; $59AB: $E0 $F1
    ld   de, $58F2                                ; $59AD: $11 $F2 $58
    call label_3BC0                               ; $59B0: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableD               ; $59B3: $21 $D0 $C2
    add  hl, bc                                   ; $59B6: $09
    ld   a, [hl]                                  ; $59B7: $7E
    and  a                                        ; $59B8: $A7
    jr   nz, jr_004_5A04                          ; $59B9: $20 $49

    ldh  a, [hScratchA]                               ; $59BB: $F0 $D7
    sub  $2E                                      ; $59BD: $D6 $2E
    and  $7F                                      ; $59BF: $E6 $7F
    ld   e, a                                     ; $59C1: $5F
    ld   d, b                                     ; $59C2: $50
    ld   hl, $D000                                ; $59C3: $21 $00 $D0
    add  hl, de                                   ; $59C6: $19
    ld   a, [hl]                                  ; $59C7: $7E
    ldh  [wActiveEntityPosX], a                               ; $59C8: $E0 $EE
    ld   hl, $D100                                ; $59CA: $21 $00 $D1
    add  hl, de                                   ; $59CD: $19
    ld   a, [hl]                                  ; $59CE: $7E
    ldh  [wActiveEntityPosY], a                               ; $59CF: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $59D1: $F0 $E7
    rra                                           ; $59D3: $1F
    rra                                           ; $59D4: $1F
    rra                                           ; $59D5: $1F
    and  $01                                      ; $59D6: $E6 $01
    add  $02                                      ; $59D8: $C6 $02
    ldh  [$FFF1], a                               ; $59DA: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $59DC: $F0 $E7
    rla                                           ; $59DE: $17
    rla                                           ; $59DF: $17
    and  $10                                      ; $59E0: $E6 $10
    ld   hl, $FFED                                ; $59E2: $21 $ED $FF
    xor  [hl]                                     ; $59E5: $AE
    ld   [hl], a                                  ; $59E6: $77
    ld   de, $58F2                                ; $59E7: $11 $F2 $58
    call label_3BC0                               ; $59EA: $CD $C0 $3B
    ld   hl, $C420                                ; $59ED: $21 $20 $C4
    add  hl, bc                                   ; $59F0: $09
    ld   a, [hl]                                  ; $59F1: $7E
    and  a                                        ; $59F2: $A7
    jr   nz, jr_004_5A04                          ; $59F3: $20 $0F

    ld   hl, $C430                                ; $59F5: $21 $30 $C4
    add  hl, bc                                   ; $59F8: $09
    ld   [hl], $90                                ; $59F9: $36 $90
    call label_3B70                               ; $59FB: $CD $70 $3B
    ld   hl, $C430                                ; $59FE: $21 $30 $C4
    add  hl, bc                                   ; $5A01: $09
    ld   [hl], $D0                                ; $5A02: $36 $D0

label_004_5A04:
jr_004_5A04:
    ret                                           ; $5A04: $C9

func_004_5A05:
label_004_5A05:
    call func_004_7FA9                            ; $5A05: $CD $A9 $7F
    ldh  a, [wActiveEntityPosX]                               ; $5A08: $F0 $EE
    ldh  [hScratchA], a                               ; $5A0A: $E0 $D7
    ldh  a, [wActiveEntityPosY]                               ; $5A0C: $F0 $EC
    ldh  [hScratchB], a                               ; $5A0E: $E0 $D8
    ld   a, $02                                   ; $5A10: $3E $02
    call label_CC7                                ; $5A12: $CD $C7 $0C
    ld   a, $13                                   ; $5A15: $3E $13
    ldh  [hNextSFX], a                            ; $5A17: $E0 $F4
    ret                                           ; $5A19: $C9

func_004_5A1A:
    ld   hl, $C460                                ; $5A1A: $21 $60 $C4
    add  hl, bc                                   ; $5A1D: $09
    ld   e, [hl]                                  ; $5A1E: $5E
    sla  e                                        ; $5A1F: $CB $23
    sla  e                                        ; $5A21: $CB $23
    sla  e                                        ; $5A23: $CB $23
    sla  e                                        ; $5A25: $CB $23
    sla  e                                        ; $5A27: $CB $23
    ld   d, b                                     ; $5A29: $50
    ld   hl, $D000                                ; $5A2A: $21 $00 $D0
    add  hl, de                                   ; $5A2D: $19
    push de                                       ; $5A2E: $D5
    ld   e, $20                                   ; $5A2F: $1E $20

jr_004_5A31:
    xor  a                                        ; $5A31: $AF
    ld   [hl+], a                                 ; $5A32: $22
    dec  e                                        ; $5A33: $1D
    ld   a, e                                     ; $5A34: $7B
    cp   $00                                      ; $5A35: $FE $00
    jr   nz, jr_004_5A31                          ; $5A37: $20 $F8

    pop  de                                       ; $5A39: $D1
    ld   hl, $D100                                ; $5A3A: $21 $00 $D1
    add  hl, de                                   ; $5A3D: $19
    ld   e, $20                                   ; $5A3E: $1E $20

jr_004_5A40:
    xor  a                                        ; $5A40: $AF
    ld   [hl+], a                                 ; $5A41: $22
    dec  e                                        ; $5A42: $1D
    ld   a, e                                     ; $5A43: $7B
    cp   $00                                      ; $5A44: $FE $00
    jr   nz, jr_004_5A40                          ; $5A46: $20 $F8

    ret                                           ; $5A48: $C9

Data_004_5A49::
    db   $70, $00, $70, $20, $70, $40, $70, $60, $72, $00, $74, $00, $74, $20, $72, $20
    db   $76, $00, $78, $00, $78, $20, $76, $20, $76, $40, $78, $40, $78, $60, $76, $60
    db   $7A, $00, $7A, $20, $7C, $00, $7C, $20, $03, $03, $05, $05, $00, $00, $04, $04
    db   $02, $02, $06, $06, $01, $01, $07, $07, $00, $06, $0C, $0E, $10, $0E, $0C, $06
    db   $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E, $CD, $7F, $5B

    ld   a, [wRoomTransitionState]                ; $5A98: $FA $24 $C1
    and  a                                        ; $5A9B: $A7
    jr   nz, jr_004_5AA6                          ; $5A9C: $20 $08

    ld   hl, $C410                                ; $5A9E: $21 $10 $C4
    add  hl, bc                                   ; $5AA1: $09
    ld   a, [hl]                                  ; $5AA2: $7E
    and  a                                        ; $5AA3: $A7
    jr   z, jr_004_5AA9                           ; $5AA4: $28 $03

jr_004_5AA6:
    call func_004_5A1A                            ; $5AA6: $CD $1A $5A

jr_004_5AA9:
    call func_004_7FA3                            ; $5AA9: $CD $A3 $7F
    ld   hl, $C3D0                                ; $5AAC: $21 $D0 $C3
    add  hl, bc                                   ; $5AAF: $09
    ld   a, [hl]                                  ; $5AB0: $7E
    inc  a                                        ; $5AB1: $3C
    and  $1F                                      ; $5AB2: $E6 $1F
    ld   [hl], a                                  ; $5AB4: $77
    ldh  [hScratchA], a                               ; $5AB5: $E0 $D7
    ld   hl, $C460                                ; $5AB7: $21 $60 $C4
    add  hl, bc                                   ; $5ABA: $09
    ld   e, [hl]                                  ; $5ABB: $5E
    sla  e                                        ; $5ABC: $CB $23
    sla  e                                        ; $5ABE: $CB $23
    sla  e                                        ; $5AC0: $CB $23
    sla  e                                        ; $5AC2: $CB $23
    sla  e                                        ; $5AC4: $CB $23
    ld   d, $00                                   ; $5AC6: $16 $00
    push de                                       ; $5AC8: $D5
    ld   hl, $D000                                ; $5AC9: $21 $00 $D0
    add  hl, de                                   ; $5ACC: $19
    ldh  a, [hScratchA]                               ; $5ACD: $F0 $D7
    ld   e, a                                     ; $5ACF: $5F
    add  hl, de                                   ; $5AD0: $19
    ldh  a, [wActiveEntityPosX]                               ; $5AD1: $F0 $EE
    ld   [hl], a                                  ; $5AD3: $77
    pop  de                                       ; $5AD4: $D1
    ld   hl, $D100                                ; $5AD5: $21 $00 $D1
    add  hl, de                                   ; $5AD8: $19
    ldh  a, [hScratchA]                               ; $5AD9: $F0 $D7
    ld   e, a                                     ; $5ADB: $5F
    add  hl, de                                   ; $5ADC: $19
    ldh  a, [wActiveEntityPosY]                               ; $5ADD: $F0 $EC
    ld   [hl], a                                  ; $5ADF: $77
    call func_004_6D80                            ; $5AE0: $CD $80 $6D
    call label_3B39                               ; $5AE3: $CD $39 $3B

func_004_5AE6:
    ld   hl, $C420                                ; $5AE6: $21 $20 $C4
    add  hl, bc                                   ; $5AE9: $09
    ld   a, [hl]                                  ; $5AEA: $7E
    and  a                                        ; $5AEB: $A7
    jr   nz, jr_004_5AF1                          ; $5AEC: $20 $03

    call func_004_6DCA                            ; $5AEE: $CD $CA $6D

jr_004_5AF1:
    call label_3B23                               ; $5AF1: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable               ; $5AF4: $21 $A0 $C2
    add  hl, bc                                   ; $5AF7: $09
    ld   a, [hl]                                  ; $5AF8: $7E
    and  a                                        ; $5AF9: $A7
    jr   z, jr_004_5B28                           ; $5AFA: $28 $2C

    ld   e, $08                                   ; $5AFC: $1E $08
    bit  0, a                                     ; $5AFE: $CB $47
    jr   nz, jr_004_5B10                          ; $5B00: $20 $0E

    ld   e, $00                                   ; $5B02: $1E $00
    bit  1, a                                     ; $5B04: $CB $4F
    jr   nz, jr_004_5B10                          ; $5B06: $20 $08

    ld   e, $04                                   ; $5B08: $1E $04
    bit  2, a                                     ; $5B0A: $CB $57
    jr   nz, jr_004_5B10                          ; $5B0C: $20 $02

    ld   e, $0C                                   ; $5B0E: $1E $0C

jr_004_5B10:
    ld   hl, wEntitiesUnknownTableB               ; $5B10: $21 $B0 $C2
    add  hl, bc                                   ; $5B13: $09
    ld   [hl], e                                  ; $5B14: $73
    call GetRandomByte                            ; $5B15: $CD $0D $28
    rra                                           ; $5B18: $1F
    jr   c, jr_004_5B23                           ; $5B19: $38 $08

    ld   hl, wEntitiesUnknownTableC               ; $5B1B: $21 $C0 $C2
    add  hl, bc                                   ; $5B1E: $09
    ld   a, [hl]                                  ; $5B1F: $7E
    cpl                                           ; $5B20: $2F
    inc  a                                        ; $5B21: $3C
    ld   [hl], a                                  ; $5B22: $77

jr_004_5B23:
    call IsEntityFrameCounterZero                 ; $5B23: $CD $05 $0C
    ld   [hl], $10                                ; $5B26: $36 $10

jr_004_5B28:
    call label_C00                                ; $5B28: $CD $00 $0C
    jr   nz, jr_004_5B66                          ; $5B2B: $20 $39

    ld   [hl], $04                                ; $5B2D: $36 $04
    ldh  a, [$FFEB]                               ; $5B2F: $F0 $EB
    cp   $59                                      ; $5B31: $FE $59
    jr   nz, jr_004_5B37                          ; $5B33: $20 $02

    ld   [hl], $06                                ; $5B35: $36 $06

jr_004_5B37:
    ld   hl, wEntitiesUnknownTableC               ; $5B37: $21 $C0 $C2
    add  hl, bc                                   ; $5B3A: $09
    ld   a, [hl]                                  ; $5B3B: $7E
    ld   hl, wEntitiesUnknownTableB               ; $5B3C: $21 $B0 $C2
    add  hl, bc                                   ; $5B3F: $09
    add  [hl]                                     ; $5B40: $86
    and  $0F                                      ; $5B41: $E6 $0F
    ld   [hl], a                                  ; $5B43: $77
    ld   hl, wEntitiesUnknownTableB               ; $5B44: $21 $B0 $C2
    add  hl, bc                                   ; $5B47: $09
    ld   e, [hl]                                  ; $5B48: $5E
    ld   d, b                                     ; $5B49: $50
    ld   hl, $5A71                                ; $5B4A: $21 $71 $5A
    add  hl, de                                   ; $5B4D: $19
    ld   a, [hl]                                  ; $5B4E: $7E
    call label_3B0C                               ; $5B4F: $CD $0C $3B
    ld   hl, $5A81                                ; $5B52: $21 $81 $5A
    add  hl, de                                   ; $5B55: $19
    ld   a, [hl]                                  ; $5B56: $7E
    ld   hl, $C250                                ; $5B57: $21 $50 $C2
    add  hl, bc                                   ; $5B5A: $09
    ld   [hl], a                                  ; $5B5B: $77
    ld   hl, $5A85                                ; $5B5C: $21 $85 $5A
    add  hl, de                                   ; $5B5F: $19
    ld   a, [hl]                                  ; $5B60: $7E
    ld   hl, $C240                                ; $5B61: $21 $40 $C2
    add  hl, bc                                   ; $5B64: $09
    ld   [hl], a                                  ; $5B65: $77

jr_004_5B66:
    call IsEntityFrameCounterZero                 ; $5B66: $CD $05 $0C
    jr   nz, jr_004_5B7E                          ; $5B69: $20 $13

    call GetRandomByte                            ; $5B6B: $CD $0D $28
    and  $1F                                      ; $5B6E: $E6 $1F
    add  $10                                      ; $5B70: $C6 $10
    ld   [hl], a                                  ; $5B72: $77
    call GetRandomByte                            ; $5B73: $CD $0D $28
    and  $02                                      ; $5B76: $E6 $02
    dec  a                                        ; $5B78: $3D
    ld   hl, wEntitiesUnknownTableC               ; $5B79: $21 $C0 $C2
    add  hl, bc                                   ; $5B7C: $09
    ld   [hl], a                                  ; $5B7D: $77

jr_004_5B7E:
    ret                                           ; $5B7E: $C9

    ld   de, Data_004_5A49                        ; $5B7F: $11 $49 $5A
    call label_3BC0                               ; $5B82: $CD $C0 $3B
    call func_004_7FA3                            ; $5B85: $CD $A3 $7F
    ld   hl, $C3D0                                ; $5B88: $21 $D0 $C3
    add  hl, bc                                   ; $5B8B: $09
    ld   a, [hl]                                  ; $5B8C: $7E
    ldh  [hScratchA], a                               ; $5B8D: $E0 $D7
    ld   hl, $C460                                ; $5B8F: $21 $60 $C4
    add  hl, bc                                   ; $5B92: $09
    ld   e, [hl]                                  ; $5B93: $5E
    sla  e                                        ; $5B94: $CB $23
    sla  e                                        ; $5B96: $CB $23
    sla  e                                        ; $5B98: $CB $23
    sla  e                                        ; $5B9A: $CB $23
    sla  e                                        ; $5B9C: $CB $23
    ld   d, b                                     ; $5B9E: $50
    push de                                       ; $5B9F: $D5
    push de                                       ; $5BA0: $D5
    ld   hl, $D000                                ; $5BA1: $21 $00 $D0
    add  hl, de                                   ; $5BA4: $19
    ldh  a, [hScratchA]                               ; $5BA5: $F0 $D7
    sub  $09                                      ; $5BA7: $D6 $09
    and  $1F                                      ; $5BA9: $E6 $1F
    ld   e, a                                     ; $5BAB: $5F
    ld   d, b                                     ; $5BAC: $50
    add  hl, de                                   ; $5BAD: $19
    ld   a, [hl]                                  ; $5BAE: $7E
    ldh  [wActiveEntityPosX], a                               ; $5BAF: $E0 $EE
    pop  de                                       ; $5BB1: $D1
    ld   hl, $D100                                ; $5BB2: $21 $00 $D1
    add  hl, de                                   ; $5BB5: $19
    ldh  a, [hScratchA]                               ; $5BB6: $F0 $D7
    sub  $09                                      ; $5BB8: $D6 $09
    and  $1F                                      ; $5BBA: $E6 $1F
    ld   e, a                                     ; $5BBC: $5F
    ld   d, b                                     ; $5BBD: $50
    add  hl, de                                   ; $5BBE: $19
    ld   a, [hl]                                  ; $5BBF: $7E
    ldh  [wActiveEntityPosY], a                               ; $5BC0: $E0 $EC
    ld   a, $08                                   ; $5BC2: $3E $08
    ldh  [$FFF1], a                               ; $5BC4: $E0 $F1
    ld   de, Data_004_5A49                        ; $5BC6: $11 $49 $5A
    call label_3BC0                               ; $5BC9: $CD $C0 $3B
    pop  de                                       ; $5BCC: $D1
    push de                                       ; $5BCD: $D5
    ld   hl, $D000                                ; $5BCE: $21 $00 $D0
    add  hl, de                                   ; $5BD1: $19
    ldh  a, [hScratchA]                               ; $5BD2: $F0 $D7
    sub  $10                                      ; $5BD4: $D6 $10
    and  $1F                                      ; $5BD6: $E6 $1F
    ld   e, a                                     ; $5BD8: $5F
    ld   d, b                                     ; $5BD9: $50
    add  hl, de                                   ; $5BDA: $19
    ld   a, [hl]                                  ; $5BDB: $7E
    ldh  [wActiveEntityPosX], a                               ; $5BDC: $E0 $EE
    pop  de                                       ; $5BDE: $D1
    ld   hl, $D100                                ; $5BDF: $21 $00 $D1
    add  hl, de                                   ; $5BE2: $19
    ldh  a, [hScratchA]                               ; $5BE3: $F0 $D7
    sub  $10                                      ; $5BE5: $D6 $10
    and  $1F                                      ; $5BE7: $E6 $1F
    ld   e, a                                     ; $5BE9: $5F
    ld   d, b                                     ; $5BEA: $50
    add  hl, de                                   ; $5BEB: $19
    ld   a, [hl]                                  ; $5BEC: $7E
    ldh  [wActiveEntityPosY], a                               ; $5BED: $E0 $EC
    ld   a, $09                                   ; $5BEF: $3E $09
    ldh  [$FFF1], a                               ; $5BF1: $E0 $F1
    ld   de, Data_004_5A49                        ; $5BF3: $11 $49 $5A
    call label_3BC0                               ; $5BF6: $CD $C0 $3B
    jp   label_3D8A                               ; $5BF9: $C3 $8A $3D

    ld   e, b                                     ; $5BFC: $58
    ld   [bc], a                                  ; $5BFD: $02
    ld   e, d                                     ; $5BFE: $5A
    ld   [bc], a                                  ; $5BFF: $02
    ld   e, h                                     ; $5C00: $5C
    ld   [bc], a                                  ; $5C01: $02
    ld   e, [hl]                                  ; $5C02: $5E
    ld   [bc], a                                  ; $5C03: $02
    inc  c                                        ; $5C04: $0C
    db   $f4                                      ; $5C05: $F4
    ld   [$CDF8], sp                              ; $5C06: $08 $F8 $CD
    and  [hl]                                     ; $5C09: $A6
    ld   e, l                                     ; $5C0A: $5D
    jr   jr_004_5C16                              ; $5C0B: $18 $09

    call func_004_7F90                            ; $5C0D: $CD $90 $7F
    ld   de, $5BFC                                ; $5C10: $11 $FC $5B
    call label_3BC0                               ; $5C13: $CD $C0 $3B

jr_004_5C16:
    ldh  a, [hActiveEntityWalking]                               ; $5C16: $F0 $F0
    and  a                                        ; $5C18: $A7
    jr   z, jr_004_5C43                           ; $5C19: $28 $28

    ld   a, $FF                                   ; $5C1B: $3E $FF
    call label_3B0C                               ; $5C1D: $CD $0C $3B
    call func_004_6E35                            ; $5C20: $CD $35 $6E
    add  $10                                      ; $5C23: $C6 $10
    cp   $20                                      ; $5C25: $FE $20
    jr   nc, jr_004_5C42                          ; $5C27: $30 $19

    call func_004_6E45                            ; $5C29: $CD $45 $6E
    add  $10                                      ; $5C2C: $C6 $10
    cp   $20                                      ; $5C2E: $FE $20
    jr   nc, jr_004_5C42                          ; $5C30: $30 $10

    ld   a, [wCollisionType]                               ; $5C32: $FA $33 $C1
    and  a                                        ; $5C35: $A7
    jr   z, jr_004_5C42                           ; $5C36: $28 $0A

    call IncrementEntityWalkingAttr               ; $5C38: $CD $12 $3B
    ld   [hl], b                                  ; $5C3B: $70
    ld   hl, $C300                                ; $5C3C: $21 $00 $C3
    add  hl, bc                                   ; $5C3F: $09
    ld   [hl], $30                                ; $5C40: $36 $30

jr_004_5C42:
    ret                                           ; $5C42: $C9

jr_004_5C43:
    ldh  a, [hFrameCounter]                       ; $5C43: $F0 $E7
    rra                                           ; $5C45: $1F
    rra                                           ; $5C46: $1F
    rra                                           ; $5C47: $1F
    rra                                           ; $5C48: $1F
    xor  c                                        ; $5C49: $A9
    and  $01                                      ; $5C4A: $E6 $01
    call label_3B0C                               ; $5C4C: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5C4F: $F0 $E7
    and  $00                                      ; $5C51: $E6 $00
    jr   z, jr_004_5C5A                           ; $5C53: $28 $05

    ld   a, $FF                                   ; $5C55: $3E $FF
    call label_3B0C                               ; $5C57: $CD $0C $3B

jr_004_5C5A:
    call func_004_7FA3                            ; $5C5A: $CD $A3 $7F
    call func_004_6D80                            ; $5C5D: $CD $80 $6D
    call label_3B70                               ; $5C60: $CD $70 $3B
    call func_004_6DCA                            ; $5C63: $CD $CA $6D
    call func_004_6E03                            ; $5C66: $CD $03 $6E
    call func_004_5D08                            ; $5C69: $CD $08 $5D
    ld   hl, $C300                                ; $5C6C: $21 $00 $C3
    add  hl, bc                                   ; $5C6F: $09
    ld   a, [hl]                                  ; $5C70: $7E
    and  a                                        ; $5C71: $A7
    jp   nz, label_004_5D07                       ; $5C72: $C2 $07 $5D

    call label_3B44                               ; $5C75: $CD $44 $3B
    call IsEntityFrameCounterZero                 ; $5C78: $CD $05 $0C
    jr   nz, jr_004_5C8C                          ; $5C7B: $20 $0F

    call GetRandomByte                            ; $5C7D: $CD $0D $28
    and  $1F                                      ; $5C80: $E6 $1F
    add  $20                                      ; $5C82: $C6 $20
    ld   [hl], a                                  ; $5C84: $77
    and  $01                                      ; $5C85: $E6 $01
    ld   hl, wEntitiesUnknownTableB               ; $5C87: $21 $B0 $C2
    add  hl, bc                                   ; $5C8A: $09
    ld   [hl], a                                  ; $5C8B: $77

jr_004_5C8C:
    call label_C00                                ; $5C8C: $CD $00 $0C
    jr   nz, jr_004_5CA0                          ; $5C8F: $20 $0F

    call GetRandomByte                            ; $5C91: $CD $0D $28
    and  $0F                                      ; $5C94: $E6 $0F
    add  $18                                      ; $5C96: $C6 $18
    ld   [hl], a                                  ; $5C98: $77
    and  $01                                      ; $5C99: $E6 $01
    ld   hl, wEntitiesUnknownTableC               ; $5C9B: $21 $C0 $C2
    add  hl, bc                                   ; $5C9E: $09
    ld   [hl], a                                  ; $5C9F: $77

jr_004_5CA0:
    ldh  a, [hFrameCounter]                       ; $5CA0: $F0 $E7
    xor  c                                        ; $5CA2: $A9
    and  $03                                      ; $5CA3: $E6 $03
    jr   nz, jr_004_5D07                          ; $5CA5: $20 $60

    ld   hl, wEntitiesUnknownTableB               ; $5CA7: $21 $B0 $C2
    add  hl, bc                                   ; $5CAA: $09
    ldh  a, [wActiveEntityPosX]                               ; $5CAB: $F0 $EE
    cp   $28                                      ; $5CAD: $FE $28
    jr   nc, jr_004_5CB5                          ; $5CAF: $30 $04

    ld   [hl], $00                                ; $5CB1: $36 $00
    jr   jr_004_5CBB                              ; $5CB3: $18 $06

jr_004_5CB5:
    cp   $78                                      ; $5CB5: $FE $78
    jr   c, jr_004_5CC0                           ; $5CB7: $38 $07

    ld   [hl], $01                                ; $5CB9: $36 $01

jr_004_5CBB:
    call IsEntityFrameCounterZero                 ; $5CBB: $CD $05 $0C
    ld   [hl], $20                                ; $5CBE: $36 $20

jr_004_5CC0:
    ld   hl, wEntitiesUnknownTableC               ; $5CC0: $21 $C0 $C2
    add  hl, bc                                   ; $5CC3: $09
    ldh  a, [wActiveEntityPosY]                               ; $5CC4: $F0 $EC
    cp   $28                                      ; $5CC6: $FE $28
    jr   nc, jr_004_5CCE                          ; $5CC8: $30 $04

    ld   [hl], $00                                ; $5CCA: $36 $00
    jr   jr_004_5CD4                              ; $5CCC: $18 $06

jr_004_5CCE:
    cp   $60                                      ; $5CCE: $FE $60
    jr   c, jr_004_5CD9                           ; $5CD0: $38 $07

    ld   [hl], $01                                ; $5CD2: $36 $01

jr_004_5CD4:
    call label_C00                                ; $5CD4: $CD $00 $0C
    ld   [hl], $20                                ; $5CD7: $36 $20

jr_004_5CD9:
    ld   hl, wEntitiesUnknownTableB               ; $5CD9: $21 $B0 $C2
    add  hl, bc                                   ; $5CDC: $09
    ld   e, [hl]                                  ; $5CDD: $5E
    ld   d, b                                     ; $5CDE: $50
    ld   hl, $5C04                                ; $5CDF: $21 $04 $5C
    add  hl, de                                   ; $5CE2: $19
    ld   a, [hl]                                  ; $5CE3: $7E
    ld   hl, $C240                                ; $5CE4: $21 $40 $C2
    add  hl, bc                                   ; $5CE7: $09
    sub  [hl]                                     ; $5CE8: $96
    and  $80                                      ; $5CE9: $E6 $80
    jr   nz, jr_004_5CEF                          ; $5CEB: $20 $02

    inc  [hl]                                     ; $5CED: $34
    inc  [hl]                                     ; $5CEE: $34

jr_004_5CEF:
    dec  [hl]                                     ; $5CEF: $35
    ld   hl, wEntitiesUnknownTableC               ; $5CF0: $21 $C0 $C2
    add  hl, bc                                   ; $5CF3: $09
    ld   e, [hl]                                  ; $5CF4: $5E
    ld   d, b                                     ; $5CF5: $50
    ld   hl, $5C06                                ; $5CF6: $21 $06 $5C
    add  hl, de                                   ; $5CF9: $19
    ld   a, [hl]                                  ; $5CFA: $7E
    ld   hl, $C250                                ; $5CFB: $21 $50 $C2
    add  hl, bc                                   ; $5CFE: $09
    sub  [hl]                                     ; $5CFF: $96
    and  $80                                      ; $5D00: $E6 $80
    jr   nz, jr_004_5D06                          ; $5D02: $20 $02

    inc  [hl]                                     ; $5D04: $34
    inc  [hl]                                     ; $5D05: $34

jr_004_5D06:
    dec  [hl]                                     ; $5D06: $35

label_004_5D07:
jr_004_5D07:
    ret                                           ; $5D07: $C9

func_004_5D08:
    ldh  a, [hFrameCounter]                       ; $5D08: $F0 $E7
    and  $03                                      ; $5D0A: $E6 $03
    jr   nz, jr_004_5D25                          ; $5D0C: $20 $17

    ld   hl, $C310                                ; $5D0E: $21 $10 $C3
    add  hl, bc                                   ; $5D11: $09
    ld   a, [hl]                                  ; $5D12: $7E
    cp   $10                                      ; $5D13: $FE $10
    jr   z, jr_004_5D25                           ; $5D15: $28 $0E

    bit  7, a                                     ; $5D17: $CB $7F
    jr   z, jr_004_5D1E                           ; $5D19: $28 $03

    inc  [hl]                                     ; $5D1B: $34
    jr   jr_004_5D25                              ; $5D1C: $18 $07

jr_004_5D1E:
    cp   $10                                      ; $5D1E: $FE $10
    jr   nc, jr_004_5D24                          ; $5D20: $30 $02

    inc  [hl]                                     ; $5D22: $34
    ret                                           ; $5D23: $C9

jr_004_5D24:
    dec  [hl]                                     ; $5D24: $35

jr_004_5D25:
    ret                                           ; $5D25: $C9

    ld   hl, sp-$08                               ; $5D26: $F8 $F8
    ld   h, b                                     ; $5D28: $60
    ld   [bc], a                                  ; $5D29: $02
    ld   hl, sp+$00                               ; $5D2A: $F8 $00
    ld   h, d                                     ; $5D2C: $62
    ld   [bc], a                                  ; $5D2D: $02
    ld   hl, sp+$08                               ; $5D2E: $F8 $08
    ld   h, d                                     ; $5D30: $62
    ld   [hl+], a                                 ; $5D31: $22
    ld   hl, sp+$10                               ; $5D32: $F8 $10
    ld   h, b                                     ; $5D34: $60
    ld   [hl+], a                                 ; $5D35: $22
    ld   [$64F8], sp                              ; $5D36: $08 $F8 $64
    ld   [bc], a                                  ; $5D39: $02
    ld   [$6600], sp                              ; $5D3A: $08 $00 $66
    ld   [bc], a                                  ; $5D3D: $02
    ld   [$6808], sp                              ; $5D3E: $08 $08 $68
    ld   [bc], a                                  ; $5D41: $02
    ld   [$6A10], sp                              ; $5D42: $08 $10 $6A
    ld   [bc], a                                  ; $5D45: $02
    ld   hl, sp-$08                               ; $5D46: $F8 $F8
    ld   h, b                                     ; $5D48: $60
    ld   [bc], a                                  ; $5D49: $02
    ld   hl, sp+$00                               ; $5D4A: $F8 $00
    ld   h, d                                     ; $5D4C: $62
    ld   [bc], a                                  ; $5D4D: $02
    ld   hl, sp+$08                               ; $5D4E: $F8 $08
    ld   h, d                                     ; $5D50: $62
    ld   [hl+], a                                 ; $5D51: $22
    ld   hl, sp+$10                               ; $5D52: $F8 $10
    ld   h, b                                     ; $5D54: $60
    ld   [hl+], a                                 ; $5D55: $22
    ld   [$64F8], sp                              ; $5D56: $08 $F8 $64
    ld   [bc], a                                  ; $5D59: $02
    ld   [$6C00], sp                              ; $5D5A: $08 $00 $6C
    ld   [bc], a                                  ; $5D5D: $02
    ld   [$6E08], sp                              ; $5D5E: $08 $08 $6E
    ld   [bc], a                                  ; $5D61: $02
    ld   [$6A10], sp                              ; $5D62: $08 $10 $6A
    ld   [bc], a                                  ; $5D65: $02
    ld   hl, sp-$08                               ; $5D66: $F8 $F8
    ld   h, b                                     ; $5D68: $60
    ld   [bc], a                                  ; $5D69: $02
    ld   hl, sp+$00                               ; $5D6A: $F8 $00
    ld   h, d                                     ; $5D6C: $62
    ld   [bc], a                                  ; $5D6D: $02
    ld   hl, sp+$08                               ; $5D6E: $F8 $08
    ld   h, d                                     ; $5D70: $62
    ld   [hl+], a                                 ; $5D71: $22
    ld   hl, sp+$10                               ; $5D72: $F8 $10
    ld   h, b                                     ; $5D74: $60
    ld   [hl+], a                                 ; $5D75: $22
    ld   [$6AF8], sp                              ; $5D76: $08 $F8 $6A
    ld   [hl+], a                                 ; $5D79: $22
    ld   [$6800], sp                              ; $5D7A: $08 $00 $68
    ld   [hl+], a                                 ; $5D7D: $22
    ld   [$6608], sp                              ; $5D7E: $08 $08 $66
    ld   [hl+], a                                 ; $5D81: $22
    ld   [$6410], sp                              ; $5D82: $08 $10 $64
    ld   [hl+], a                                 ; $5D85: $22
    ld   hl, sp-$08                               ; $5D86: $F8 $F8
    ld   h, b                                     ; $5D88: $60
    ld   [bc], a                                  ; $5D89: $02
    ld   hl, sp+$00                               ; $5D8A: $F8 $00
    ld   h, d                                     ; $5D8C: $62
    ld   [bc], a                                  ; $5D8D: $02
    ld   hl, sp+$08                               ; $5D8E: $F8 $08
    ld   h, d                                     ; $5D90: $62
    ld   [hl+], a                                 ; $5D91: $22
    ld   hl, sp+$10                               ; $5D92: $F8 $10
    ld   h, b                                     ; $5D94: $60
    ld   [hl+], a                                 ; $5D95: $22
    ld   [$6AF8], sp                              ; $5D96: $08 $F8 $6A
    ld   [hl+], a                                 ; $5D99: $22
    ld   [$6E00], sp                              ; $5D9A: $08 $00 $6E
    ld   [hl+], a                                 ; $5D9D: $22
    ld   [$6C08], sp                              ; $5D9E: $08 $08 $6C
    ld   [hl+], a                                 ; $5DA1: $22
    ld   [$6410], sp                              ; $5DA2: $08 $10 $64
    ld   [hl+], a                                 ; $5DA5: $22
    call func_004_7F90                            ; $5DA6: $CD $90 $7F
    ldh  a, [$FFED]                               ; $5DA9: $F0 $ED
    push af                                       ; $5DAB: $F5
    rla                                           ; $5DAC: $17
    and  $40                                      ; $5DAD: $E6 $40
    ldh  [hScratchA], a                               ; $5DAF: $E0 $D7
    pop  af                                       ; $5DB1: $F1
    and  $0F                                      ; $5DB2: $E6 $0F
    ldh  [$FFED], a                               ; $5DB4: $E0 $ED
    ld   hl, $C3B0                                ; $5DB6: $21 $B0 $C3
    add  hl, bc                                   ; $5DB9: $09
    ld   a, [hl]                                  ; $5DBA: $7E
    rla                                           ; $5DBB: $17
    rla                                           ; $5DBC: $17
    rla                                           ; $5DBD: $17
    rla                                           ; $5DBE: $17
    rla                                           ; $5DBF: $17
    and  $E0                                      ; $5DC0: $E6 $E0
    ld   hl, hScratchA                                ; $5DC2: $21 $D7 $FF
    add  [hl]                                     ; $5DC5: $86
    ld   e, a                                     ; $5DC6: $5F
    ld   d, b                                     ; $5DC7: $50
    ld   hl, $5D26                                ; $5DC8: $21 $26 $5D
    add  hl, de                                   ; $5DCB: $19
    ld   c, $08                                   ; $5DCC: $0E $08
    jp   label_3CE6                               ; $5DCE: $C3 $E6 $3C

    ld   [hl], b                                  ; $5DD1: $70
    ld   bc, $0172                                ; $5DD2: $01 $72 $01
    ld   [hl], d                                  ; $5DD5: $72
    ld   hl, $2170                                ; $5DD6: $21 $70 $21
    ld   [hl], h                                  ; $5DD9: $74
    ld   bc, $2174                                ; $5DDA: $01 $74 $21
    nop                                           ; $5DDD: $00
    nop                                           ; $5DDE: $00
    nop                                           ; $5DDF: $00
    nop                                           ; $5DE0: $00
    ld   a, d                                     ; $5DE1: $7A
    ld   bc, $217A                                ; $5DE2: $01 $7A $21
    rst  $38                                      ; $5DE5: $FF
    nop                                           ; $5DE6: $00
    rst  $38                                      ; $5DE7: $FF
    nop                                           ; $5DE8: $00
    db   $76                                      ; $5DE9: $76
    ld   bc, $0178                                ; $5DEA: $01 $78 $01
    ld   a, b                                     ; $5DED: $78
    ld   hl, $2176                                ; $5DEE: $21 $76 $21
    ldh  a, [$FFF1]                               ; $5DF1: $F0 $F1
    cp   $03                                      ; $5DF3: $FE $03
    jr   nz, jr_004_5E1C                          ; $5DF5: $20 $25

    ldh  a, [wActiveEntityPosX]                               ; $5DF7: $F0 $EE
    sub  $08                                      ; $5DF9: $D6 $08
    ldh  [wActiveEntityPosX], a                               ; $5DFB: $E0 $EE
    ld   a, $06                                   ; $5DFD: $3E $06
    ldh  [$FFF1], a                               ; $5DFF: $E0 $F1
    ld   de, $5DD1                                ; $5E01: $11 $D1 $5D
    call label_3BC0                               ; $5E04: $CD $C0 $3B
    ldh  a, [wActiveEntityPosX]                               ; $5E07: $F0 $EE

label_004_5E09:
    add  $10                                      ; $5E09: $C6 $10
    ldh  [wActiveEntityPosX], a                               ; $5E0B: $E0 $EE
    ld   a, $07                                   ; $5E0D: $3E $07
    ldh  [$FFF1], a                               ; $5E0F: $E0 $F1
    ld   de, $5DD1                                ; $5E11: $11 $D1 $5D
    call label_3BC0                               ; $5E14: $CD $C0 $3B
    call label_3D8A                               ; $5E17: $CD $8A $3D
    jr   jr_004_5E22                              ; $5E1A: $18 $06

jr_004_5E1C:
    ld   de, $5DD1                                ; $5E1C: $11 $D1 $5D
    call label_3BC0                               ; $5E1F: $CD $C0 $3B

jr_004_5E22:
    call func_004_7FA3                            ; $5E22: $CD $A3 $7F
    call func_004_6D80                            ; $5E25: $CD $80 $6D
    ldh  a, [hActiveEntityWalking]                               ; $5E28: $F0 $F0
    JP_TABLE                                      ; $5E2A: $C7
    ld   sp, $765E                                ; $5E2B: $31 $5E $76
    ld   e, [hl]                                  ; $5E2E: $5E
    or   [hl]                                     ; $5E2F: $B6
    ld   e, [hl]                                  ; $5E30: $5E
    call label_3B39                               ; $5E31: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $5E34: $F0 $E7
    rra                                           ; $5E36: $1F
    rra                                           ; $5E37: $1F
    rra                                           ; $5E38: $1F
    rra                                           ; $5E39: $1F
    and  $01                                      ; $5E3A: $E6 $01
    call label_3B0C                               ; $5E3C: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $5E3F: $CD $05 $0C
    cp   $18                                      ; $5E42: $FE $18
    jr   nz, jr_004_5E4A                          ; $5E44: $20 $04

    call func_004_5EC6                            ; $5E46: $CD $C6 $5E
    and  a                                        ; $5E49: $A7

jr_004_5E4A:
    jr   nc, jr_004_5E72                          ; $5E4A: $30 $26

    call func_004_6E35                            ; $5E4C: $CD $35 $6E
    add  $20                                      ; $5E4F: $C6 $20
    cp   $40                                      ; $5E51: $FE $40
    jr   nc, jr_004_5E72                          ; $5E53: $30 $1D

    call func_004_6E45                            ; $5E55: $CD $45 $6E
    add  $20                                      ; $5E58: $C6 $20
    cp   $40                                      ; $5E5A: $FE $40
    jr   nc, jr_004_5E72                          ; $5E5C: $30 $14

    ld   hl, $C420                                ; $5E5E: $21 $20 $C4
    add  hl, bc                                   ; $5E61: $09
    ld   a, [hl]                                  ; $5E62: $7E
    and  a                                        ; $5E63: $A7
    jr   nz, jr_004_5E72                          ; $5E64: $20 $0C

    call IsEntityFrameCounterZero                 ; $5E66: $CD $05 $0C
    ld   [hl], $20                                ; $5E69: $36 $20
    call IncrementEntityWalkingAttr               ; $5E6B: $CD $12 $3B
    ld   a, JINGLE_ENNEMY_SHRIEK                  ; $5E6E: $3E $3C
    ldh  [hJingle], a                             ; $5E70: $E0 $F2

jr_004_5E72:
    ret                                           ; $5E72: $C9

    inc  b                                        ; $5E73: $04
    inc  bc                                       ; $5E74: $03
    ld   [bc], a                                  ; $5E75: $02
    call IsEntityFrameCounterZero                 ; $5E76: $CD $05 $0C
    cp   $18                                      ; $5E79: $FE $18
    jp   nc, label_3B39                           ; $5E7B: $D2 $39 $3B

    and  a                                        ; $5E7E: $A7
    jr   nz, jr_004_5EA4                          ; $5E7F: $20 $23

    ld   [hl], $40                                ; $5E81: $36 $40
    call IncrementEntityWalkingAttr               ; $5E83: $CD $12 $3B
    ld   a, $FF                                   ; $5E86: $3E $FF
    call label_3B0C                               ; $5E88: $CD $0C $3B
    ld   hl, wEntitiesPosYTable                   ; $5E8B: $21 $10 $C2
    add  hl, bc                                   ; $5E8E: $09
    ld   a, [hl]                                  ; $5E8F: $7E
    sub  $48                                      ; $5E90: $D6 $48
    ld   e, a                                     ; $5E92: $5F
    ld   a, $48                                   ; $5E93: $3E $48
    sub  e                                        ; $5E95: $93
    ld   [hl], a                                  ; $5E96: $77
    ld   hl, wEntity0PosX                         ; $5E97: $21 $00 $C2
    add  hl, bc                                   ; $5E9A: $09
    ld   a, [hl]                                  ; $5E9B: $7E
    sub  $50                                      ; $5E9C: $D6 $50
    ld   e, a                                     ; $5E9E: $5F
    ld   a, $50                                   ; $5E9F: $3E $50
    sub  e                                        ; $5EA1: $93
    ld   [hl], a                                  ; $5EA2: $77
    ret                                           ; $5EA3: $C9

jr_004_5EA4:
    rra                                           ; $5EA4: $1F
    rra                                           ; $5EA5: $1F
    rra                                           ; $5EA6: $1F
    and  $03                                      ; $5EA7: $E6 $03
    ld   e, a                                     ; $5EA9: $5F
    ld   d, b                                     ; $5EAA: $50
    ld   hl, $5E73                                ; $5EAB: $21 $73 $5E
    add  hl, de                                   ; $5EAE: $19
    ld   a, [hl]                                  ; $5EAF: $7E
    jp   label_3B0C                               ; $5EB0: $C3 $0C $3B

    ld   [bc], a                                  ; $5EB3: $02
    inc  bc                                       ; $5EB4: $03
    inc  b                                        ; $5EB5: $04
    call IsEntityFrameCounterZero                 ; $5EB6: $CD $05 $0C
    cp   $18                                      ; $5EB9: $FE $18
    ret  nc                                       ; $5EBB: $D0

    and  a                                        ; $5EBC: $A7
    jr   nz, jr_004_5EE5                          ; $5EBD: $20 $26

    ld   [hl], $30                                ; $5EBF: $36 $30
    call IncrementEntityWalkingAttr               ; $5EC1: $CD $12 $3B
    ld   [hl], b                                  ; $5EC4: $70
    ret                                           ; $5EC5: $C9

func_004_5EC6:
    ld   a, $58                                   ; $5EC6: $3E $58
    call label_3B86                               ; $5EC8: $CD $86 $3B
    jr   c, jr_004_5EE4                           ; $5ECB: $38 $17

    ld   hl, wEntity0PosX                         ; $5ECD: $21 $00 $C2
    add  hl, de                                   ; $5ED0: $19
    ldh  a, [hScratchA]                               ; $5ED1: $F0 $D7
    ld   [hl], a                                  ; $5ED3: $77
    ld   hl, wEntitiesPosYTable                   ; $5ED4: $21 $10 $C2
    add  hl, de                                   ; $5ED7: $19
    ldh  a, [hScratchB]                               ; $5ED8: $F0 $D8
    ld   [hl], a                                  ; $5EDA: $77
    push bc                                       ; $5EDB: $C5
    ld   c, e                                     ; $5EDC: $4B
    ld   b, d                                     ; $5EDD: $42
    ld   a, $18                                   ; $5EDE: $3E $18
    call label_3BAA                               ; $5EE0: $CD $AA $3B
    pop  bc                                       ; $5EE3: $C1

jr_004_5EE4:
    ret                                           ; $5EE4: $C9

jr_004_5EE5:
    rra                                           ; $5EE5: $1F
    rra                                           ; $5EE6: $1F
    rra                                           ; $5EE7: $1F
    and  $03                                      ; $5EE8: $E6 $03
    ld   e, a                                     ; $5EEA: $5F
    ld   d, b                                     ; $5EEB: $50
    ld   hl, $5EB3                                ; $5EEC: $21 $B3 $5E
    add  hl, de                                   ; $5EEF: $19
    ld   a, [hl]                                  ; $5EF0: $7E
    jp   label_3B0C                               ; $5EF1: $C3 $0C $3B

    ld   a, h                                     ; $5EF4: $7C
    nop                                           ; $5EF5: $00
    ld   a, h                                     ; $5EF6: $7C
    jr   nz, @+$80                                ; $5EF7: $20 $7E

    nop                                           ; $5EF9: $00
    ld   a, [hl]                                  ; $5EFA: $7E
    jr   nz, @+$13                                ; $5EFB: $20 $11

    db   $f4                                      ; $5EFD: $F4
    ld   e, [hl]                                  ; $5EFE: $5E
    call label_3BC0                               ; $5EFF: $CD $C0 $3B
    call func_004_7FA3                            ; $5F02: $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ; $5F05: $F0 $E7
    rra                                           ; $5F07: $1F
    rra                                           ; $5F08: $1F
    rra                                           ; $5F09: $1F
    and  $01                                      ; $5F0A: $E6 $01
    call label_3B0C                               ; $5F0C: $CD $0C $3B
    call func_004_6DCA                            ; $5F0F: $CD $CA $6D
    call label_3B2E                               ; $5F12: $CD $2E $3B
    call label_3B4F                               ; $5F15: $CD $4F $3B
    call label_3B70                               ; $5F18: $CD $70 $3B
    ld   hl, wEntitiesCollisionsTable               ; $5F1B: $21 $A0 $C2
    add  hl, bc                                   ; $5F1E: $09
    ld   a, [hl]                                  ; $5F1F: $7E
    and  a                                        ; $5F20: $A7
    ret  z                                        ; $5F21: $C8

    call func_004_6D7A                            ; $5F22: $CD $7A $6D
    jp   label_004_6C20                           ; $5F25: $C3 $20 $6C

Data_004_5F28::
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $7C, $01, $00, $F8, $7E, $01, $00, $00, $70, $01, $00, $08, $72, $01
    db   $00, $F0, $78, $01, $00, $F8, $7A, $01, $00, $00, $74, $01, $00, $08, $76

    ld   bc, $169A                                ; $5F57: $01 $9A $16
    sbc  h                                        ; $5F5A: $9C
    ld   d, $21                                   ; $5F5B: $16 $21
    ld   b, b                                     ; $5F5D: $40
    call nz, func_004_7E09                        ; $5F5E: $C4 $09 $7E
    and  a                                        ; $5F61: $A7
    jr   z, jr_004_5F96                           ; $5F62: $28 $32

    ldh  a, [wActiveEntityPosY]                               ; $5F64: $F0 $EC
    add  $04                                      ; $5F66: $C6 $04
    ldh  [wActiveEntityPosY], a                               ; $5F68: $E0 $EC
    ld   de, $5F58                                ; $5F6A: $11 $58 $5F
    call label_3BC0                               ; $5F6D: $CD $C0 $3B
    call func_004_6DCA                            ; $5F70: $CD $CA $6D
    call func_004_6E03                            ; $5F73: $CD $03 $6E
    ld   hl, $C320                                ; $5F76: $21 $20 $C3
    add  hl, bc                                   ; $5F79: $09
    dec  [hl]                                     ; $5F7A: $35
    ld   hl, $C310                                ; $5F7B: $21 $10 $C3
    add  hl, bc                                   ; $5F7E: $09
    ld   a, [hl]                                  ; $5F7F: $7E
    and  $80                                      ; $5F80: $E6 $80
    jr   z, jr_004_5F91                           ; $5F82: $28 $0D

    call func_004_6D7A                            ; $5F84: $CD $7A $6D
    xor  a                                        ; $5F87: $AF
    ld   [$DB7F], a                               ; $5F88: $EA $7F $DB
    ld   [wC167], a                               ; $5F8B: $EA $67 $C1
    jp   label_C0C                                ; $5F8E: $C3 $0C $0C

jr_004_5F91:
    ld   a, $02                                   ; $5F91: $3E $02
    ldh  [$FFA1], a                               ; $5F93: $E0 $A1
    ret                                           ; $5F95: $C9

jr_004_5F96:
    ldh  a, [hIsSideScrolling]                    ; $5F96: $F0 $F9
    and  a                                        ; $5F98: $A7
    jp   nz, $60A4                                ; $5F99: $C2 $A4 $60

    ld   hl, $C340                                ; $5F9C: $21 $40 $C3
    add  hl, bc                                   ; $5F9F: $09
    ld   [hl], $84                                ; $5FA0: $36 $84
    ld   hl, $C390                                ; $5FA2: $21 $90 $C3
    add  hl, bc                                   ; $5FA5: $09
    ld   a, [hl]                                  ; $5FA6: $7E
    ldh  [hFFE8], a                               ; $5FA7: $E0 $E8
    ld   a, [wDialogState]                        ; $5FA9: $FA $9F $C1
    and  a                                        ; $5FAC: $A7
    ld   hl, $5F48                                ; $5FAD: $21 $48 $5F
    jr   nz, jr_004_5FC2                          ; $5FB0: $20 $10

    ld   hl, $C3D0                                ; $5FB2: $21 $D0 $C3
    add  hl, bc                                   ; $5FB5: $09
    ld   a, [hl]                                  ; $5FB6: $7E
    inc  [hl]                                     ; $5FB7: $34
    ld   hl, Data_004_5F28                        ; $5FB8: $21 $28 $5F
    and  $30                                      ; $5FBB: $E6 $30
    jr   z, jr_004_5FC2                           ; $5FBD: $28 $03

    ld   hl, $5F38                                ; $5FBF: $21 $38 $5F

jr_004_5FC2:
    ld   c, $04                                   ; $5FC2: $0E $04
    call label_3CE6                               ; $5FC4: $CD $E6 $3C
    ld   a, $04                                   ; $5FC7: $3E $04
    call label_3DA0                               ; $5FC9: $CD $A0 $3D
    call func_004_7BE3                            ; $5FCC: $CD $E3 $7B
    ldh  a, [hActiveEntityWalking]                               ; $5FCF: $F0 $F0
    JP_TABLE                                      ; $5FD1: $C7
    ret  c                                        ; $5FD2: $D8

    ld   e, a                                     ; $5FD3: $5F
    rst  $28                                      ; $5FD4: $EF
    ld   e, a                                     ; $5FD5: $5F
    ld   b, c                                     ; $5FD6: $41
    ld   h, b                                     ; $5FD7: $60
    ld   a, [wGameplayType]                       ; $5FD8: $FA $95 $DB
    cp   $0B                                      ; $5FDB: $FE $0B
    ret  nz                                       ; $5FDD: $C0

    call func_004_7C4B                            ; $5FDE: $CD $4B $7C
    ret  nc                                       ; $5FE1: $D0

    ld   a, $02                                   ; $5FE2: $3E $02
    ld   [wC167], a                               ; $5FE4: $EA $67 $C1
    ld   a, $45                                   ; $5FE7: $3E $45
    call OpenDialog                               ; $5FE9: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $5FEC: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $5FEF: $FA $9F $C1
    and  a                                        ; $5FF2: $A7
    ret  nz                                       ; $5FF3: $C0

    call IncrementEntityWalkingAttr               ; $5FF4: $CD $12 $3B
    ld   a, [wC177]                               ; $5FF7: $FA $77 $C1
    and  a                                        ; $5FFA: $A7
    jr   z, jr_004_6007                           ; $5FFB: $28 $0A

    ld   [hl], b                                  ; $5FFD: $70
    xor  a                                        ; $5FFE: $AF
    ld   [wC167], a                               ; $5FFF: $EA $67 $C1
    ld   a, $46                                   ; $6002: $3E $46
    jp   OpenDialog                               ; $6004: $C3 $85 $23

jr_004_6007:
    push hl                                       ; $6007: $E5
    push de                                       ; $6008: $D5
    ld   a, [wAddRupeeBufferHigh]                 ; $6009: $FA $90 $DB
    ld   e, a                                     ; $600C: $5F
    ld   a, [$DB8F]                               ; $600D: $FA $8F $DB
    ld   d, a                                     ; $6010: $57
    ld   a, [wRupeeCountLow]                      ; $6011: $FA $5E $DB
    ld   l, a                                     ; $6014: $6F
    ld   a, [wRupeeCountHigh]                     ; $6015: $FA $5D $DB
    ld   h, a                                     ; $6018: $67

jr_004_6019:
    ld   a, e                                     ; $6019: $7B
    or   d                                        ; $601A: $B2
    jr   z, jr_004_6023                           ; $601B: $28 $06

    daa                                           ; $601D: $27
    inc  hl                                       ; $601E: $23
    daa                                           ; $601F: $27
    dec  de                                       ; $6020: $1B
    jr   jr_004_6019                              ; $6021: $18 $F6

jr_004_6023:
    ld   a, l                                     ; $6023: $7D
    sub  $10                                      ; $6024: $D6 $10
    ld   a, h                                     ; $6026: $7C
    sbc  $00                                      ; $6027: $DE $00
    pop  de                                       ; $6029: $D1
    pop  hl                                       ; $602A: $E1
    jr   c, jr_004_6037                           ; $602B: $38 $0A

    ld   a, $0A                                   ; $602D: $3E $0A
    ld   [wSubstractRupeeBufferHigh], a           ; $602F: $EA $92 $DB
    ld   a, $47                                   ; $6032: $3E $47
    jp   OpenDialog                               ; $6034: $C3 $85 $23

jr_004_6037:
    ld   [hl], b                                  ; $6037: $70
    xor  a                                        ; $6038: $AF
    ld   [wC167], a                               ; $6039: $EA $67 $C1
    ld   a, $4E                                   ; $603C: $3E $4E
    jp   OpenDialog                               ; $603E: $C3 $85 $23

    ld   a, [wDialogState]                        ; $6041: $FA $9F $C1

jr_004_6044:
    and  a                                        ; $6044: $A7
    ret  nz                                       ; $6045: $C0

    call label_3E83                               ; $6046: $CD $83 $3E
    jp   label_004_67FB                           ; $6049: $C3 $FB $67

Data_004_604C::
    db   $58, $00, $5A, $00, $56, $20, $FF, $00, $5C, $00, $5E, $00, $58, $00, $5A, $00
    db   $58, $00, $5A, $00, $5C, $00, $5E, $00, $5C, $00, $5E, $00, $56, $00, $FF, $00
    db   $5E, $20, $5C, $20, $58, $00, $5A, $00, $06, $16, $10, $10, $38, $38, $39, $39
    db   $16, $38, $F6, $00, $F1, $F0, $F0, $F0, $F0, $FE, $04, $F2, $00, $F0, $FA, $00
    db   $00, $F8, $F8, $F8, $F2, $FE, $E8, $00, $E0, $E8, $00, $00, $00, $00, $14, $10
    db   $E0, $F8, $10, $00, $00, $00, $00

    ldh  a, [$FF3E]                               ; $60A3: $F0 $3E
    ld   bc, $67EA                                ; $60A5: $01 $EA $67
    pop  bc                                       ; $60A8: $C1
    ld   hl, wEntitiesUnknownTableB               ; $60A9: $21 $B0 $C2
    add  hl, bc                                   ; $60AC: $09
    ld   a, [hl]                                  ; $60AD: $7E
    JP_TABLE                                      ; $60AE: $C7
    ret  nc                                       ; $60AF: $D0

    ld   h, b                                     ; $60B0: $60
    add  c                                        ; $60B1: $81
    ld   h, d                                     ; $60B2: $62
    ld   a, [hl-]                                 ; $60B3: $3A
    ld   h, h                                     ; $60B4: $64
    ld   hl, $1867                                ; $60B5: $21 $67 $18
    ld   e, b                                     ; $60B8: $58
    ld   h, b                                     ; $60B9: $60
    jr   jr_004_6044                              ; $60BA: $18 $88

    ld   b, b                                     ; $60BC: $40
    ld   c, h                                     ; $60BD: $4C
    inc  [hl]                                     ; $60BE: $34
    ld   l, b                                     ; $60BF: $68
    ld   d, b                                     ; $60C0: $50
    ld   bc, $0000                                ; $60C1: $01 $00 $00
    ld   bc, $0200                                ; $60C4: $01 $00 $02
    ld   [bc], a                                  ; $60C7: $02
    ld   [bc], a                                  ; $60C8: $02
    inc  bc                                       ; $60C9: $03
    inc  bc                                       ; $60CA: $03
    nop                                           ; $60CB: $00
    ld   a, $1E                                   ; $60CC: $3E $1E
    db   $10                                      ; $60CE: $10
    jr   nc, @+$40                                ; $60CF: $30 $3E

    ld   [bc], a                                  ; $60D1: $02
    ldh  [$FFA1], a                               ; $60D2: $E0 $A1
    ld   hl, wEntitiesUnknownTableC               ; $60D4: $21 $C0 $C2
    add  hl, bc                                   ; $60D7: $09
    ld   a, [hl]                                  ; $60D8: $7E
    and  a                                        ; $60D9: $A7
    jr   nz, jr_004_6120                          ; $60DA: $20 $44

    inc  [hl]                                     ; $60DC: $34
    push bc                                       ; $60DD: $C5
    ld   c, $05                                   ; $60DE: $0E $05

jr_004_60E0:
    ld   a, $54                                   ; $60E0: $3E $54
    call label_3B86                               ; $60E2: $CD $86 $3B
    ld   hl, $60B6                                ; $60E5: $21 $B6 $60
    add  hl, bc                                   ; $60E8: $09
    ld   a, [hl]                                  ; $60E9: $7E
    ld   hl, wEntity0PosX                         ; $60EA: $21 $00 $C2
    add  hl, de                                   ; $60ED: $19
    ld   [hl], a                                  ; $60EE: $77
    ld   hl, $60BB                                ; $60EF: $21 $BB $60
    add  hl, bc                                   ; $60F2: $09
    ld   a, [hl]                                  ; $60F3: $7E
    ld   hl, wEntitiesPosYTable                   ; $60F4: $21 $10 $C2
    add  hl, de                                   ; $60F7: $19
    ld   [hl], a                                  ; $60F8: $77
    ld   hl, $60C0                                ; $60F9: $21 $C0 $60
    add  hl, bc                                   ; $60FC: $09
    ld   a, [hl]                                  ; $60FD: $7E
    ld   hl, $C380                                ; $60FE: $21 $80 $C3
    add  hl, de                                   ; $6101: $19
    ld   [hl], a                                  ; $6102: $77
    ld   hl, $60C5                                ; $6103: $21 $C5 $60
    add  hl, bc                                   ; $6106: $09
    ld   a, [hl]                                  ; $6107: $7E
    ld   hl, wEntitiesUnknownTableB               ; $6108: $21 $B0 $C2
    add  hl, de                                   ; $610B: $19
    ld   [hl], a                                  ; $610C: $77
    ld   hl, $60CA                                ; $610D: $21 $CA $60
    add  hl, bc                                   ; $6110: $09
    ld   a, [hl]                                  ; $6111: $7E
    ld   hl, wEntitiesFrameCounterTable           ; $6112: $21 $E0 $C2
    add  hl, de                                   ; $6115: $19
    ld   [hl], a                                  ; $6116: $77
    dec  c                                        ; $6117: $0D
    jr   nz, jr_004_60E0                          ; $6118: $20 $C6

    xor  a                                        ; $611A: $AF
    ld   [$D004], a                               ; $611B: $EA $04 $D0
    pop  bc                                       ; $611E: $C1
    ret                                           ; $611F: $C9

jr_004_6120:
    ldh  a, [$FFF1]                               ; $6120: $F0 $F1
    ld   e, a                                     ; $6122: $5F
    ld   d, b                                     ; $6123: $50
    ld   hl, $6074                                ; $6124: $21 $74 $60
    add  hl, de                                   ; $6127: $19
    ld   a, [hl]                                  ; $6128: $7E
    ldh  [hLinkAnimationState], a                 ; $6129: $E0 $9D
    ld   hl, $607E                                ; $612B: $21 $7E $60
    add  hl, de                                   ; $612E: $19
    ldh  a, [hLinkPositionX]                      ; $612F: $F0 $98
    add  [hl]                                     ; $6131: $86
    ldh  [wActiveEntityPosX], a                               ; $6132: $E0 $EE
    ld   hl, $6088                                ; $6134: $21 $88 $60
    add  hl, de                                   ; $6137: $19
    ldh  a, [hLinkPositionY]                      ; $6138: $F0 $99
    add  [hl]                                     ; $613A: $86
    ldh  [wActiveEntityPosY], a                               ; $613B: $E0 $EC
    ld   de, Data_004_604C                        ; $613D: $11 $4C $60
    call label_3BC0                               ; $6140: $CD $C0 $3B
    ldh  a, [hActiveEntityWalking]                               ; $6143: $F0 $F0
    JP_TABLE                                      ; $6145: $C7
    ld   d, h                                     ; $6146: $54
    ld   h, c                                     ; $6147: $61
    ld   a, e                                     ; $6148: $7B
    ld   h, c                                     ; $6149: $61
    db   $e4                                      ; $614A: $E4
    ld   h, c                                     ; $614B: $61
    push hl                                       ; $614C: $E5
    ld   h, c                                     ; $614D: $61
    ld   b, a                                     ; $614E: $47
    ld   h, d                                     ; $614F: $62
    ld   d, d                                     ; $6150: $52
    ld   h, d                                     ; $6151: $62
    ld   l, h                                     ; $6152: $6C
    ld   h, d                                     ; $6153: $62
    ld   a, [wDialogState]                        ; $6154: $FA $9F $C1
    and  a                                        ; $6157: $A7
    jr   nz, jr_004_616C                          ; $6158: $20 $12

    ldh  a, [hFFCC]                               ; $615A: $F0 $CC
    and  $30                                      ; $615C: $E6 $30
    jr   z, jr_004_616C                           ; $615E: $28 $0C

    call IncrementEntityWalkingAttr               ; $6160: $CD $12 $3B
    call IsEntityFrameCounterZero                 ; $6163: $CD $05 $0C
    ld   [hl], $23                                ; $6166: $36 $23
    xor  a                                        ; $6168: $AF
    ld   [wIntroSubTimer], a                      ; $6169: $EA $02 $D0

jr_004_616C:
    ld   a, $09                                   ; $616C: $3E $09
    jp   label_004_61BA                           ; $616E: $C3 $BA $61

    ld   bc, label_808                            ; $6171: $01 $08 $08
    ld   [label_808], sp                          ; $6174: $08 $08 $08
    ld   bc, $0302                                ; $6177: $01 $02 $03
    nop                                           ; $617A: $00
    call IsEntityFrameCounterZero                 ; $617B: $CD $05 $0C
    jr   nz, jr_004_61B6                          ; $617E: $20 $36

    call IncrementEntityWalkingAttr               ; $6180: $CD $12 $3B
    ld   a, $02                                   ; $6183: $3E $02
    ld   [$C3B0], a                               ; $6185: $EA $B0 $C3
    ld   a, $54                                   ; $6188: $3E $54
    call label_3B86                               ; $618A: $CD $86 $3B
    ld   hl, wEntity0PosX                         ; $618D: $21 $00 $C2
    add  hl, de                                   ; $6190: $19
    ld   [hl], $78                                ; $6191: $36 $78
    ld   hl, wEntitiesPosYTable                   ; $6193: $21 $10 $C2
    add  hl, de                                   ; $6196: $19
    ld   [hl], $18                                ; $6197: $36 $18
    ld   hl, $C240                                ; $6199: $21 $40 $C2
    add  hl, de                                   ; $619C: $19
    ld   [hl], $E2                                ; $619D: $36 $E2
    ld   hl, $C250                                ; $619F: $21 $50 $C2
    add  hl, de                                   ; $61A2: $19
    ld   [hl], $FA                                ; $61A3: $36 $FA
    ld   hl, wEntitiesUnknownTableB               ; $61A5: $21 $B0 $C2
    add  hl, de                                   ; $61A8: $19
    ld   [hl], $01                                ; $61A9: $36 $01
    ld   hl, wEntitiesFrameCounterTable           ; $61AB: $21 $E0 $C2
    add  hl, de                                   ; $61AE: $19
    ld   [hl], $14                                ; $61AF: $36 $14
    ld   a, JINGLE_JUMP_DOWN                      ; $61B1: $3E $08
    ldh  [hJingle], a                             ; $61B3: $E0 $F2
    ret                                           ; $61B5: $C9

jr_004_61B6:
    rra                                           ; $61B6: $1F
    rra                                           ; $61B7: $1F
    and  $1F                                      ; $61B8: $E6 $1F

label_004_61BA:
    ld   e, a                                     ; $61BA: $5F
    ld   d, b                                     ; $61BB: $50
    ld   hl, $6171                                ; $61BC: $21 $71 $61
    add  hl, de                                   ; $61BF: $19
    ld   a, [hl]                                  ; $61C0: $7E
    ld   [$C3B0], a                               ; $61C1: $EA $B0 $C3
    ld   e, a                                     ; $61C4: $5F
    ld   d, b                                     ; $61C5: $50
    ld   hl, $6092                                ; $61C6: $21 $92 $60
    add  hl, de                                   ; $61C9: $19
    ldh  a, [hLinkPositionX]                      ; $61CA: $F0 $98
    add  [hl]                                     ; $61CC: $86
    ldh  [wActiveEntityPosX], a                               ; $61CD: $E0 $EE
    ld   hl, $609B                                ; $61CF: $21 $9B $60
    add  hl, de                                   ; $61D2: $19
    ldh  a, [hLinkPositionY]                      ; $61D3: $F0 $99
    add  [hl]                                     ; $61D5: $86
    ldh  [wActiveEntityPosY], a                               ; $61D6: $E0 $EC
    xor  a                                        ; $61D8: $AF
    ldh  [$FFF1], a                               ; $61D9: $E0 $F1
    ld   de, $626D                                ; $61DB: $11 $6D $62
    call label_3BC0                               ; $61DE: $CD $C0 $3B
    jp   label_3D8A                               ; $61E1: $C3 $8A $3D

    ret                                           ; $61E4: $C9

    ld   a, [wDialogState]                        ; $61E5: $FA $9F $C1
    and  a                                        ; $61E8: $A7
    ret  nz                                       ; $61E9: $C0

    ld   a, [wC177]                               ; $61EA: $FA $77 $C1
    and  a                                        ; $61ED: $A7
    jr   nz, jr_004_6237                          ; $61EE: $20 $47

    ld   a, [$D004]                               ; $61F0: $FA $04 $D0
    cp   $05                                      ; $61F3: $FE $05
    jr   c, jr_004_6202                           ; $61F5: $38 $0B

    ld   a, $4B                                   ; $61F7: $3E $4B
    call OpenDialog                               ; $61F9: $CD $85 $23
    call IncrementEntityWalkingAttr               ; $61FC: $CD $12 $3B
    ld   [hl], $05                                ; $61FF: $36 $05
    ret                                           ; $6201: $C9

jr_004_6202:
    push hl                                       ; $6202: $E5
    push de                                       ; $6203: $D5
    ld   a, [wAddRupeeBufferHigh]                 ; $6204: $FA $90 $DB
    ld   e, a                                     ; $6207: $5F
    ld   a, [$DB8F]                               ; $6208: $FA $8F $DB
    ld   d, a                                     ; $620B: $57
    ld   a, [wRupeeCountLow]                      ; $620C: $FA $5E $DB
    ld   l, a                                     ; $620F: $6F
    ld   a, [wRupeeCountHigh]                     ; $6210: $FA $5D $DB
    ld   h, a                                     ; $6213: $67

jr_004_6214:
    ld   a, e                                     ; $6214: $7B
    or   d                                        ; $6215: $B2
    jr   z, jr_004_621E                           ; $6216: $28 $06

    daa                                           ; $6218: $27
    inc  hl                                       ; $6219: $23
    daa                                           ; $621A: $27
    dec  de                                       ; $621B: $1B
    jr   jr_004_6214                              ; $621C: $18 $F6

jr_004_621E:
    ld   a, l                                     ; $621E: $7D
    sub  $10                                      ; $621F: $D6 $10
    ld   a, h                                     ; $6221: $7C
    sbc  $00                                      ; $6222: $DE $00
    pop  de                                       ; $6224: $D1
    pop  hl                                       ; $6225: $E1
    jr   c, jr_004_623F                           ; $6226: $38 $17

    ld   a, $0A                                   ; $6228: $3E $0A
    ld   [wSubstractRupeeBufferHigh], a           ; $622A: $EA $92 $DB
    ld   a, $47                                   ; $622D: $3E $47
    call OpenDialog                               ; $622F: $CD $85 $23
    call IncrementEntityWalkingAttr               ; $6232: $CD $12 $3B
    ld   [hl], b                                  ; $6235: $70
    ret                                           ; $6236: $C9

jr_004_6237:
    ld   a, $46                                   ; $6237: $3E $46
    call OpenDialog                               ; $6239: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $623C: $C3 $12 $3B

jr_004_623F:
    ld   a, $4E                                   ; $623F: $3E $4E
    call OpenDialog                               ; $6241: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $6244: $C3 $12 $3B

    ld   a, [wDialogState]                        ; $6247: $FA $9F $C1
    and  a                                        ; $624A: $A7
    ret  nz                                       ; $624B: $C0

    call label_3E83                               ; $624C: $CD $83 $3E
    jp   label_004_67FB                           ; $624F: $C3 $FB $67

    ld   a, [wDialogState]                        ; $6252: $FA $9F $C1
    and  a                                        ; $6255: $A7
    ret  nz                                       ; $6256: $C0

    call IncrementEntityWalkingAttr               ; $6257: $CD $12 $3B
    ld   [hl], $04                                ; $625A: $36 $04
    ld   a, [wC177]                               ; $625C: $FA $77 $C1
    and  a                                        ; $625F: $A7
    jr   nz, jr_004_6267                          ; $6260: $20 $05

    ld   a, $4C                                   ; $6262: $3E $4C
    jp   OpenDialog                               ; $6264: $C3 $85 $23

jr_004_6267:
    ld   a, $46                                   ; $6267: $3E $46
    jp   OpenDialog                               ; $6269: $C3 $85 $23

    ret                                           ; $626C: $C9

    ld   d, b                                     ; $626D: $50
    ld   [bc], a                                  ; $626E: $02
    ld   d, h                                     ; $626F: $54
    ld   [bc], a                                  ; $6270: $02
    ld   d, b                                     ; $6271: $50
    ld   [bc], a                                  ; $6272: $02
    ld   d, d                                     ; $6273: $52
    ld   [bc], a                                  ; $6274: $02
    ld   d, b                                     ; $6275: $50
    ld   b, d                                     ; $6276: $42
    ld   d, h                                     ; $6277: $54
    ld   [bc], a                                  ; $6278: $02
    ld   d, h                                     ; $6279: $54
    ld   b, d                                     ; $627A: $42
    ld   d, b                                     ; $627B: $50
    ld   b, d                                     ; $627C: $42
    ld   d, h                                     ; $627D: $54
    ld   h, d                                     ; $627E: $62
    ld   d, b                                     ; $627F: $50
    ld   h, d                                     ; $6280: $62
    ld   a, c                                     ; $6281: $79
    ld   [$D003], a                               ; $6282: $EA $03 $D0
    ld   de, $626D                                ; $6285: $11 $6D $62
    call label_3BC0                               ; $6288: $CD $C0 $3B
    ldh  a, [wActiveEntityPosX]                               ; $628B: $F0 $EE
    ld   [$D000], a                               ; $628D: $EA $00 $D0
    ldh  a, [$FFEF]                               ; $6290: $F0 $EF
    ld   [wIntroTimer], a                         ; $6292: $EA $01 $D0
    call func_004_7FA3                            ; $6295: $CD $A3 $7F
    ldh  a, [hActiveEntityWalking]                               ; $6298: $F0 $F0
    JP_TABLE                                      ; $629A: $C7
    sbc  a                                        ; $629B: $9F
    ld   h, d                                     ; $629C: $62
    ld   [$CD63], sp                              ; $629D: $08 $63 $CD
    rst  $10                                      ; $62A0: $D7
    ld   l, l                                     ; $62A1: $6D
    call func_004_6DCD                            ; $62A2: $CD $CD $6D
    ldh  a, [hPressedButtonsMask]                 ; $62A5: $F0 $CB
    and  $01                                      ; $62A7: $E6 $01
    jr   z, jr_004_62BC                           ; $62A9: $28 $11

    ldh  a, [hFrameCounter]                       ; $62AB: $F0 $E7
    and  $01                                      ; $62AD: $E6 $01
    jr   nz, jr_004_62BC                          ; $62AF: $20 $0B

    ld   hl, $C240                                ; $62B1: $21 $40 $C2
    add  hl, bc                                   ; $62B4: $09
    ld   a, [hl]                                  ; $62B5: $7E
    and  a                                        ; $62B6: $A7
    jr   z, jr_004_62BC                           ; $62B7: $28 $03

    inc  [hl]                                     ; $62B9: $34
    jr   jr_004_62C1                              ; $62BA: $18 $05

jr_004_62BC:
    call IsEntityFrameCounterZero                 ; $62BC: $CD $05 $0C
    jr   nz, jr_004_62E7                          ; $62BF: $20 $26

jr_004_62C1:
    ldh  a, [hFrameCounter]                       ; $62C1: $F0 $E7
    and  $01                                      ; $62C3: $E6 $01
    jr   nz, jr_004_62D1                          ; $62C5: $20 $0A

    ld   hl, $C250                                ; $62C7: $21 $50 $C2
    add  hl, bc                                   ; $62CA: $09
    ld   a, [hl]                                  ; $62CB: $7E
    cp   $20                                      ; $62CC: $FE $20
    jr   z, jr_004_62D1                           ; $62CE: $28 $01

    inc  [hl]                                     ; $62D0: $34

jr_004_62D1:
    ld   hl, $C3D0                                ; $62D1: $21 $D0 $C3
    add  hl, bc                                   ; $62D4: $09
    ld   a, [hl]                                  ; $62D5: $7E
    inc  a                                        ; $62D6: $3C
    cp   $03                                      ; $62D7: $FE $03
    ld   [hl], a                                  ; $62D9: $77
    jr   nz, jr_004_62E7                          ; $62DA: $20 $0B

    xor  a                                        ; $62DC: $AF
    ld   [hl], a                                  ; $62DD: $77
    ld   hl, $C240                                ; $62DE: $21 $40 $C2
    add  hl, bc                                   ; $62E1: $09
    ld   a, [hl]                                  ; $62E2: $7E
    and  a                                        ; $62E3: $A7
    jr   z, jr_004_62E7                           ; $62E4: $28 $01

    inc  [hl]                                     ; $62E6: $34

jr_004_62E7:
    ld   hl, wEntitiesPosYTable                   ; $62E7: $21 $10 $C2
    add  hl, bc                                   ; $62EA: $09
    ld   a, [hl]                                  ; $62EB: $7E
    cp   $2A                                      ; $62EC: $FE $2A
    jr   c, jr_004_6307                           ; $62EE: $38 $17

    call label_3D7F                               ; $62F0: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $62F3: $CD $12 $3B

label_004_62F6:
    ldh  a, [wActiveEntityPosY]                               ; $62F6: $F0 $EC
    ldh  [hScratchB], a                               ; $62F8: $E0 $D8
    ldh  a, [wActiveEntityPosX]                               ; $62FA: $F0 $EE
    ldh  [hScratchA], a                               ; $62FC: $E0 $D7
    ld   a, $01                                   ; $62FE: $3E $01
    call label_CC7                                ; $6300: $CD $C7 $0C
    ld   a, JINGLE_WATER_DIVE                     ; $6303: $3E $0E
    ldh  [hJingle], a                             ; $6305: $E0 $F2

jr_004_6307:
    ret                                           ; $6307: $C9

    ld   hl, $C3B0                                ; $6308: $21 $B0 $C3
    ld   [hl], $00                                ; $630B: $36 $00
    call IsEntityFrameCounterZero                 ; $630D: $CD $05 $0C
    jr   z, jr_004_6317                           ; $6310: $28 $05

    ld   hl, $C3B0                                ; $6312: $21 $B0 $C3
    ld   [hl], $04                                ; $6315: $36 $04

jr_004_6317:
    call label_C00                                ; $6317: $CD $00 $0C
    jr   z, jr_004_6321                           ; $631A: $28 $05

    ld   hl, $C3B0                                ; $631C: $21 $B0 $C3
    ld   [hl], $05                                ; $631F: $36 $05

jr_004_6321:
    ldh  a, [hFrameCounter]                       ; $6321: $F0 $E7
    rra                                           ; $6323: $1F
    rra                                           ; $6324: $1F
    rra                                           ; $6325: $1F
    rra                                           ; $6326: $1F
    and  $01                                      ; $6327: $E6 $01
    call label_3B0C                               ; $6329: $CD $0C $3B
    call func_004_6DCA                            ; $632C: $CD $CA $6D
    ldh  a, [hFrameCounter]                       ; $632F: $F0 $E7
    and  $07                                      ; $6331: $E6 $07
    jr   nz, jr_004_6354                          ; $6333: $20 $1F

    ld   hl, $C250                                ; $6335: $21 $50 $C2
    add  hl, bc                                   ; $6338: $09
    ld   a, [hl]                                  ; $6339: $7E
    sub  $04                                      ; $633A: $D6 $04
    jr   z, jr_004_6345                           ; $633C: $28 $07

    and  $80                                      ; $633E: $E6 $80
    jr   z, jr_004_6344                           ; $6340: $28 $02

    inc  [hl]                                     ; $6342: $34
    inc  [hl]                                     ; $6343: $34

jr_004_6344:
    dec  [hl]                                     ; $6344: $35

jr_004_6345:
    ld   hl, $C240                                ; $6345: $21 $40 $C2
    add  hl, bc                                   ; $6348: $09
    ld   a, [hl]                                  ; $6349: $7E
    and  a                                        ; $634A: $A7
    jr   z, jr_004_6354                           ; $634B: $28 $07

    and  $80                                      ; $634D: $E6 $80
    jr   z, jr_004_6353                           ; $634F: $28 $02

    inc  [hl]                                     ; $6351: $34
    inc  [hl]                                     ; $6352: $34

jr_004_6353:
    dec  [hl]                                     ; $6353: $35

jr_004_6354:
    ldh  a, [hFFCC]                               ; $6354: $F0 $CC
    and  $30                                      ; $6356: $E6 $30
    jr   z, jr_004_63B9                           ; $6358: $28 $5F

    call IsEntityFrameCounterZero                 ; $635A: $CD $05 $0C
    ld   [hl], $08                                ; $635D: $36 $08
    ldh  a, [hLinkPositionX]                      ; $635F: $F0 $98
    push af                                       ; $6361: $F5
    sub  $17                                      ; $6362: $D6 $17
    ldh  [hLinkPositionX], a                      ; $6364: $E0 $98
    ld   a, $04                                   ; $6366: $3E $04
    call label_3BAA                               ; $6368: $CD $AA $3B
    pop  af                                       ; $636B: $F1
    ldh  [hLinkPositionX], a                      ; $636C: $E0 $98
    ldh  a, [wActiveEntityPosY]                               ; $636E: $F0 $EC
    cp   $25                                      ; $6370: $FE $25
    jr   nc, jr_004_63AD                          ; $6372: $30 $39

    ldh  a, [wActiveEntityPosX]                               ; $6374: $F0 $EE
    cp   $70                                      ; $6376: $FE $70
    jr   c, jr_004_63AD                           ; $6378: $38 $33

    ld   hl, wEntitiesWalkingTable                ; $637A: $21 $90 $C2
    ld   [hl], $03                                ; $637D: $36 $03
    ld   a, $48                                   ; $637F: $3E $48
    call OpenDialog                               ; $6381: $CD $85 $23
    call func_004_6D7A                            ; $6384: $CD $7A $6D
    ld   e, $0F                                   ; $6387: $1E $0F
    ld   d, b                                     ; $6389: $50

jr_004_638A:
    ld   hl, wEntitiesTypeTable                   ; $638A: $21 $80 $C2
    add  hl, de                                   ; $638D: $19
    ld   a, [hl]                                  ; $638E: $7E
    and  a                                        ; $638F: $A7
    jr   z, jr_004_63A7                           ; $6390: $28 $15

    ld   hl, wEntitiesUnknownTableB               ; $6392: $21 $B0 $C2
    add  hl, de                                   ; $6395: $19
    ld   a, [hl]                                  ; $6396: $7E
    cp   $02                                      ; $6397: $FE $02
    jr   c, jr_004_63A7                           ; $6399: $38 $0C

    ld   hl, wEntitiesWalkingTable                ; $639B: $21 $90 $C2
    add  hl, de                                   ; $639E: $19
    ld   a, [hl]                                  ; $639F: $7E
    cp   $02                                      ; $63A0: $FE $02
    jr   c, jr_004_63A7                           ; $63A2: $38 $03

    and  $01                                      ; $63A4: $E6 $01
    ld   [hl], a                                  ; $63A6: $77

jr_004_63A7:
    dec  e                                        ; $63A7: $1D
    ld   a, e                                     ; $63A8: $7B
    cp   $FF                                      ; $63A9: $FE $FF
    jr   nz, jr_004_638A                          ; $63AB: $20 $DD

jr_004_63AD:
    ldh  a, [hFrameCounter]                       ; $63AD: $F0 $E7
    rra                                           ; $63AF: $1F
    rra                                           ; $63B0: $1F
    rra                                           ; $63B1: $1F
    and  $01                                      ; $63B2: $E6 $01
    call label_3B0C                               ; $63B4: $CD $0C $3B
    jr   jr_004_63DE                              ; $63B7: $18 $25

jr_004_63B9:
    ldh  a, [hFFCC]                               ; $63B9: $F0 $CC
    and  $05                                      ; $63BB: $E6 $05
    jr   z, jr_004_63DE                           ; $63BD: $28 $1F

    ldh  a, [wActiveEntityPosY]                               ; $63BF: $F0 $EC
    cp   $30                                      ; $63C1: $FE $30
    jr   c, jr_004_63DE                           ; $63C3: $38 $19

    ld   hl, $C300                                ; $63C5: $21 $00 $C3
    add  hl, bc                                   ; $63C8: $09
    ld   a, [hl]                                  ; $63C9: $7E
    and  a                                        ; $63CA: $A7
    jr   nz, jr_004_63DE                          ; $63CB: $20 $11

    ld   hl, $C250                                ; $63CD: $21 $50 $C2
    add  hl, bc                                   ; $63D0: $09
    ld   [hl], $FA                                ; $63D1: $36 $FA
    ld   hl, $C300                                ; $63D3: $21 $00 $C3
    add  hl, bc                                   ; $63D6: $09
    ld   [hl], $50                                ; $63D7: $36 $50
    call label_C00                                ; $63D9: $CD $00 $0C
    ld   [hl], $10                                ; $63DC: $36 $10

jr_004_63DE:
    ldh  a, [wActiveEntityPosX]                               ; $63DE: $F0 $EE
    ld   hl, wEntity0PosX                         ; $63E0: $21 $00 $C2
    add  hl, bc                                   ; $63E3: $09
    cp   [hl]                                     ; $63E4: $BE
    jr   nz, jr_004_63F0                          ; $63E5: $20 $09

    ldh  a, [$FFEF]                               ; $63E7: $F0 $EF
    ld   hl, wEntitiesPosYTable                   ; $63E9: $21 $10 $C2
    add  hl, bc                                   ; $63EC: $09
    cp   [hl]                                     ; $63ED: $BE
    jr   z, jr_004_6402                           ; $63EE: $28 $12

jr_004_63F0:
    ld   hl, $C250                                ; $63F0: $21 $50 $C2
    add  hl, bc                                   ; $63F3: $09
    ld   a, [hl]                                  ; $63F4: $7E
    push af                                       ; $63F5: $F5
    push hl                                       ; $63F6: $E5
    and  $80                                      ; $63F7: $E6 $80
    jr   z, jr_004_63FC                           ; $63F9: $28 $01

    ld   [hl], b                                  ; $63FB: $70

jr_004_63FC:
    call label_3B23                               ; $63FC: $CD $23 $3B
    pop  hl                                       ; $63FF: $E1
    pop  af                                       ; $6400: $F1
    ld   [hl], a                                  ; $6401: $77

jr_004_6402:
    ld   hl, wEntitiesCollisionsTable               ; $6402: $21 $A0 $C2
    add  hl, bc                                   ; $6405: $09
    ld   a, [hl]                                  ; $6406: $7E
    and  a                                        ; $6407: $A7
    jr   z, jr_004_640E                           ; $6408: $28 $04

    xor  a                                        ; $640A: $AF
    call label_3B0C                               ; $640B: $CD $0C $3B

jr_004_640E:
    ld   hl, $C250                                ; $640E: $21 $50 $C2
    add  hl, bc                                   ; $6411: $09
    ld   a, [hl]                                  ; $6412: $7E
    rla                                           ; $6413: $17
    ret  c                                        ; $6414: $D8

    ld   a, $02                                   ; $6415: $3E $02
    jp   label_3B0C                               ; $6417: $C3 $0C $3B

Data_004_641A::
    db   $4C, $00, $4A, $00, $4C, $00, $4E, $00, $48, $00, $4A, $00, $48, $00, $4E, $00
    db   $4A, $20, $4C, $20, $4E, $20, $4C, $20, $4A, $20, $48, $20, $4E, $20, $48, $20
    db   $21

    add  b                                        ; $643B: $80
    jp   label_004_7E09                           ; $643C: $C3 $09 $7E

    and  a                                        ; $643F: $A7
    jr   nz, jr_004_6448                          ; $6440: $20 $06

    ldh  a, [$FFF1]                               ; $6442: $F0 $F1
    add  $04                                      ; $6444: $C6 $04
    ldh  [$FFF1], a                               ; $6446: $E0 $F1

jr_004_6448:
    ld   de, Data_004_641A                        ; $6448: $11 $1A $64
    call label_3BC0                               ; $644B: $CD $C0 $3B

label_004_644E:
    call func_004_7FA3                            ; $644E: $CD $A3 $7F
    call func_004_6DCA                            ; $6451: $CD $CA $6D
    ldh  a, [hActiveEntityWalking]                               ; $6454: $F0 $F0
    JP_TABLE                                      ; $6456: $C7
    ld   h, e                                     ; $6457: $63
    ld   h, h                                     ; $6458: $64
    sbc  e                                        ; $6459: $9B
    ld   h, h                                     ; $645A: $64
    ld   a, [$ff00+c]                             ; $645B: $F2
    ld   h, h                                     ; $645C: $64
    dec  l                                        ; $645D: $2D
    ld   h, l                                     ; $645E: $65
    ld   a, d                                     ; $645F: $7A
    ld   h, l                                     ; $6460: $65
    adc  c                                        ; $6461: $89
    ld   h, [hl]                                  ; $6462: $66
    call func_004_679B                            ; $6463: $CD $9B $67
    ld   hl, wEntitiesUnknownTableB               ; $6466: $21 $B0 $C2
    add  hl, bc                                   ; $6469: $09
    ld   a, [hl]                                  ; $646A: $7E
    cp   $03                                      ; $646B: $FE $03
    jp   z, label_004_6738                        ; $646D: $CA $38 $67

    call IsEntityFrameCounterZero                 ; $6470: $CD $05 $0C
    jr   nz, jr_004_6482                          ; $6473: $20 $0D

    ld   [hl], $30                                ; $6475: $36 $30
    ld   hl, $C380                                ; $6477: $21 $80 $C3
    add  hl, bc                                   ; $647A: $09
    ld   a, [hl]                                  ; $647B: $7E
    xor  $01                                      ; $647C: $EE $01
    ld   [hl], a                                  ; $647E: $77
    call IncrementEntityWalkingAttr               ; $647F: $CD $12 $3B

jr_004_6482:
    ldh  a, [hFrameCounter]                       ; $6482: $F0 $E7
    and  $03                                      ; $6484: $E6 $03
    jr   nz, jr_004_6497                          ; $6486: $20 $0F

    ld   hl, $C240                                ; $6488: $21 $40 $C2
    add  hl, bc                                   ; $648B: $09
    ld   a, [hl]                                  ; $648C: $7E
    and  a                                        ; $648D: $A7
    jr   z, jr_004_6497                           ; $648E: $28 $07

    and  $80                                      ; $6490: $E6 $80
    jr   z, jr_004_6496                           ; $6492: $28 $02

    inc  [hl]                                     ; $6494: $34
    inc  [hl]                                     ; $6495: $34

jr_004_6496:
    dec  [hl]                                     ; $6496: $35

jr_004_6497:
    jr   jr_004_64E0                              ; $6497: $18 $47

    db   $10                                      ; $6499: $10
    ldh  a, [hSwordIntersectedAreaY]                               ; $649A: $F0 $CD
    sbc  e                                        ; $649C: $9B
    ld   h, a                                     ; $649D: $67
    ld   hl, wEntitiesUnknownTableB               ; $649E: $21 $B0 $C2
    add  hl, bc                                   ; $64A1: $09
    ld   a, [hl]                                  ; $64A2: $7E
    cp   $03                                      ; $64A3: $FE $03
    jp   z, $6762                                 ; $64A5: $CA $62 $67

    call IsEntityFrameCounterZero                 ; $64A8: $CD $05 $0C
    jr   nz, jr_004_64B3                          ; $64AB: $20 $06

    ld   [hl], $50                                ; $64AD: $36 $50
    call IncrementEntityWalkingAttr               ; $64AF: $CD $12 $3B
    ld   [hl], b                                  ; $64B2: $70

jr_004_64B3:
    ldh  a, [hFrameCounter]                       ; $64B3: $F0 $E7
    rra                                           ; $64B5: $1F
    rra                                           ; $64B6: $1F
    rra                                           ; $64B7: $1F
    and  $01                                      ; $64B8: $E6 $01
    call label_3B0C                               ; $64BA: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $64BD: $F0 $E7
    and  $03                                      ; $64BF: $E6 $03
    jr   nz, jr_004_64E0                          ; $64C1: $20 $1D

    ld   hl, $C240                                ; $64C3: $21 $40 $C2
    add  hl, bc                                   ; $64C6: $09
    ld   a, [hl]                                  ; $64C7: $7E
    push hl                                       ; $64C8: $E5
    ld   hl, $C380                                ; $64C9: $21 $80 $C3
    add  hl, bc                                   ; $64CC: $09
    ld   e, [hl]                                  ; $64CD: $5E
    ld   d, $00                                   ; $64CE: $16 $00
    ld   hl, $6499                                ; $64D0: $21 $99 $64
    add  hl, de                                   ; $64D3: $19
    sub  [hl]                                     ; $64D4: $96
    pop  hl                                       ; $64D5: $E1
    and  a                                        ; $64D6: $A7
    jr   z, jr_004_64E0                           ; $64D7: $28 $07

    and  $80                                      ; $64D9: $E6 $80
    jr   z, jr_004_64DF                           ; $64DB: $28 $02

    inc  [hl]                                     ; $64DD: $34
    inc  [hl]                                     ; $64DE: $34

jr_004_64DF:
    dec  [hl]                                     ; $64DF: $35

jr_004_64E0:
    ld   hl, wEntitiesPosYTable                   ; $64E0: $21 $10 $C2
    add  hl, bc                                   ; $64E3: $09
    ld   a, [hl]                                  ; $64E4: $7E
    cp   $34                                      ; $64E5: $FE $34
    jr   nc, jr_004_64EF                          ; $64E7: $30 $06

    inc  [hl]                                     ; $64E9: $34
    ld   hl, $C250                                ; $64EA: $21 $50 $C2
    add  hl, bc                                   ; $64ED: $09
    ld   [hl], b                                  ; $64EE: $70

jr_004_64EF:
    ret                                           ; $64EF: $C9

    ld   a, [$ff00+c]                             ; $64F0: $F2
    inc  d                                        ; $64F1: $14
    ldh  a, [hFrameCounter]                       ; $64F2: $F0 $E7
    rra                                           ; $64F4: $1F
    rra                                           ; $64F5: $1F
    rra                                           ; $64F6: $1F
    and  $01                                      ; $64F7: $E6 $01
    call label_3B0C                               ; $64F9: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $64FC: $CD $05 $0C
    jr   nz, jr_004_6504                          ; $64FF: $20 $03

    call IncrementEntityWalkingAttr               ; $6501: $CD $12 $3B

jr_004_6504:
    ldh  a, [hLinkPositionX]                      ; $6504: $F0 $98
    push af                                       ; $6506: $F5
    ldh  a, [hLinkPositionY]                      ; $6507: $F0 $99
    push af                                       ; $6509: $F5
    ld   hl, $C380                                ; $650A: $21 $80 $C3
    add  hl, bc                                   ; $650D: $09
    ld   e, [hl]                                  ; $650E: $5E
    ld   d, b                                     ; $650F: $50
    ld   hl, $64F0                                ; $6510: $21 $F0 $64
    add  hl, de                                   ; $6513: $19
    ld   a, [$D000]                               ; $6514: $FA $00 $D0
    add  [hl]                                     ; $6517: $86
    ldh  [hLinkPositionX], a                      ; $6518: $E0 $98
    ld   a, [wIntroTimer]                         ; $651A: $FA $01 $D0
    ldh  [hLinkPositionY], a                      ; $651D: $E0 $99
    ld   a, $04                                   ; $651F: $3E $04
    call label_3BAA                               ; $6521: $CD $AA $3B
    pop  af                                       ; $6524: $F1
    ldh  [hLinkPositionY], a                      ; $6525: $E0 $99
    pop  af                                       ; $6527: $F1
    ldh  [hLinkPositionX], a                      ; $6528: $E0 $98
    jp   label_004_6DCA                           ; $652A: $C3 $CA $6D

    ldh  a, [hFrameCounter]                       ; $652D: $F0 $E7
    rra                                           ; $652F: $1F
    rra                                           ; $6530: $1F
    and  $01                                      ; $6531: $E6 $01
    add  $02                                      ; $6533: $C6 $02
    call label_3B0C                               ; $6535: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $6538: $F0 $98
    push af                                       ; $653A: $F5
    ldh  a, [hLinkPositionY]                      ; $653B: $F0 $99
    push af                                       ; $653D: $F5
    ld   a, [$D000]                               ; $653E: $FA $00 $D0
    add  $04                                      ; $6541: $C6 $04
    ldh  [hLinkPositionX], a                      ; $6543: $E0 $98
    ld   a, [wIntroTimer]                         ; $6545: $FA $01 $D0
    ldh  [hLinkPositionY], a                      ; $6548: $E0 $99
    ld   a, $10                                   ; $654A: $3E $10
    call label_3BAA                               ; $654C: $CD $AA $3B
    pop  af                                       ; $654F: $F1
    ldh  [hLinkPositionY], a                      ; $6550: $E0 $99
    pop  af                                       ; $6552: $F1
    ldh  [hLinkPositionX], a                      ; $6553: $E0 $98
    call func_004_6DCA                            ; $6555: $CD $CA $6D
    ld   a, [$D000]                               ; $6558: $FA $00 $D0
    ld   hl, wActiveEntityPosX                                ; $655B: $21 $EE $FF
    sub  [hl]                                     ; $655E: $96
    add  $08                                      ; $655F: $C6 $08
    cp   $10                                      ; $6561: $FE $10
    jr   nc, jr_004_6575                          ; $6563: $30 $10

    call label_3D7F                               ; $6565: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $6568: $CD $12 $3B
    ld   a, [$D003]                               ; $656B: $FA $03 $D0
    ld   e, a                                     ; $656E: $5F
    ld   d, b                                     ; $656F: $50
    ld   hl, wEntitiesTypeTable                   ; $6570: $21 $80 $C2
    add  hl, de                                   ; $6573: $19
    ld   [hl], b                                  ; $6574: $70

jr_004_6575:
    ret                                           ; $6575: $C9

    ld   d, h                                     ; $6576: $54
    nop                                           ; $6577: $00
    ld   [$21F8], sp                              ; $6578: $08 $F8 $21
    add  b                                        ; $657B: $80
    jp   label_004_5E09                           ; $657C: $C3 $09 $5E

    ld   d, b                                     ; $657F: $50
    ld   hl, $6578                                ; $6580: $21 $78 $65
    add  hl, de                                   ; $6583: $19
    ldh  a, [wActiveEntityPosX]                               ; $6584: $F0 $EE
    add  [hl]                                     ; $6586: $86
    ldh  [wActiveEntityPosX], a                               ; $6587: $E0 $EE
    ld   hl, $FFF1                                ; $6589: $21 $F1 $FF
    ld   [hl], b                                  ; $658C: $70
    ld   de, $6576                                ; $658D: $11 $76 $65
    call label_3C77                               ; $6590: $CD $77 $3C
    call label_3D8A                               ; $6593: $CD $8A $3D
    ldh  a, [hFrameCounter]                       ; $6596: $F0 $E7
    rra                                           ; $6598: $1F
    rra                                           ; $6599: $1F
    rra                                           ; $659A: $1F
    and  $01                                      ; $659B: $E6 $01
    call label_3B0C                               ; $659D: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $65A0: $F0 $E7
    and  $07                                      ; $65A2: $E6 $07
    jr   nz, jr_004_65DB                          ; $65A4: $20 $35

    ldh  a, [hLinkPositionX]                      ; $65A6: $F0 $98
    push af                                       ; $65A8: $F5
    ldh  a, [hLinkPositionY]                      ; $65A9: $F0 $99
    push af                                       ; $65AB: $F5
    ld   a, $00                                   ; $65AC: $3E $00
    ldh  [hLinkPositionX], a                      ; $65AE: $E0 $98
    ld   a, $59                                   ; $65B0: $3E $59
    ldh  [hLinkPositionY], a                      ; $65B2: $E0 $99
    ld   a, $08                                   ; $65B4: $3E $08
    call label_3BB5                               ; $65B6: $CD $B5 $3B
    ldh  a, [hScratchA]                               ; $65B9: $F0 $D7
    ld   hl, $C250                                ; $65BB: $21 $50 $C2
    add  hl, bc                                   ; $65BE: $09
    sub  [hl]                                     ; $65BF: $96
    inc  [hl]                                     ; $65C0: $34
    and  $80                                      ; $65C1: $E6 $80
    jr   z, jr_004_65C7                           ; $65C3: $28 $02

    dec  [hl]                                     ; $65C5: $35
    dec  [hl]                                     ; $65C6: $35

jr_004_65C7:
    ldh  a, [hScratchB]                               ; $65C7: $F0 $D8
    ld   hl, $C240                                ; $65C9: $21 $40 $C2
    add  hl, bc                                   ; $65CC: $09
    sub  [hl]                                     ; $65CD: $96
    inc  [hl]                                     ; $65CE: $34
    and  $80                                      ; $65CF: $E6 $80
    jr   z, jr_004_65D5                           ; $65D1: $28 $02

    dec  [hl]                                     ; $65D3: $35
    dec  [hl]                                     ; $65D4: $35

jr_004_65D5:
    pop  af                                       ; $65D5: $F1
    ldh  [hLinkPositionY], a                      ; $65D6: $E0 $99
    pop  af                                       ; $65D8: $F1
    ldh  [hLinkPositionX], a                      ; $65D9: $E0 $98

jr_004_65DB:
    ldh  a, [hFFCC]                               ; $65DB: $F0 $CC
    and  $30                                      ; $65DD: $E6 $30
    jr   z, jr_004_6631                           ; $65DF: $28 $50

    ld   hl, wEntitiesUnknownTableB               ; $65E1: $21 $B0 $C2
    add  hl, bc                                   ; $65E4: $09
    ld   a, [hl]                                  ; $65E5: $7E
    cp   $03                                      ; $65E6: $FE $03
    jr   nz, jr_004_65F1                          ; $65E8: $20 $07

    call GetRandomByte                            ; $65EA: $CD $0D $28
    and  $03                                      ; $65ED: $E6 $03
    jr   z, jr_004_6631                           ; $65EF: $28 $40

jr_004_65F1:
    ldh  a, [hLinkPositionX]                      ; $65F1: $F0 $98
    push af                                       ; $65F3: $F5
    sub  $14                                      ; $65F4: $D6 $14
    ldh  [hLinkPositionX], a                      ; $65F6: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $65F8: $F0 $99
    push af                                       ; $65FA: $F5
    add  $08                                      ; $65FB: $C6 $08
    ldh  [hLinkPositionY], a                      ; $65FD: $E0 $99
    ld   a, $03                                   ; $65FF: $3E $03
    call label_3BB5                               ; $6601: $CD $B5 $3B
    ldh  a, [hScratchA]                               ; $6604: $F0 $D7
    ld   hl, $C250                                ; $6606: $21 $50 $C2
    add  hl, bc                                   ; $6609: $09
    sub  [hl]                                     ; $660A: $96
    inc  [hl]                                     ; $660B: $34
    inc  [hl]                                     ; $660C: $34
    and  $80                                      ; $660D: $E6 $80
    jr   z, jr_004_6615                           ; $660F: $28 $04

    dec  [hl]                                     ; $6611: $35
    dec  [hl]                                     ; $6612: $35
    dec  [hl]                                     ; $6613: $35
    dec  [hl]                                     ; $6614: $35

jr_004_6615:
    ldh  a, [hScratchB]                               ; $6615: $F0 $D8
    ld   hl, $C240                                ; $6617: $21 $40 $C2
    add  hl, bc                                   ; $661A: $09
    sub  [hl]                                     ; $661B: $96
    inc  [hl]                                     ; $661C: $34
    inc  [hl]                                     ; $661D: $34
    and  $80                                      ; $661E: $E6 $80
    jr   z, jr_004_6626                           ; $6620: $28 $04

    dec  [hl]                                     ; $6622: $35
    dec  [hl]                                     ; $6623: $35
    dec  [hl]                                     ; $6624: $35
    dec  [hl]                                     ; $6625: $35

jr_004_6626:
    pop  af                                       ; $6626: $F1
    ldh  [hLinkPositionY], a                      ; $6627: $E0 $99
    pop  af                                       ; $6629: $F1
    ldh  [hLinkPositionX], a                      ; $662A: $E0 $98
    call IsEntityFrameCounterZero                 ; $662C: $CD $05 $0C
    ld   [hl], $10                                ; $662F: $36 $10

jr_004_6631:
    call func_004_6DCA                            ; $6631: $CD $CA $6D
    ld   hl, $C240                                ; $6634: $21 $40 $C2
    add  hl, bc                                   ; $6637: $09
    ld   a, [hl]                                  ; $6638: $7E
    and  a                                        ; $6639: $A7
    jr   z, jr_004_6644                           ; $663A: $28 $08

    rlca                                          ; $663C: $07
    and  $01                                      ; $663D: $E6 $01
    ld   hl, $C380                                ; $663F: $21 $80 $C3
    add  hl, bc                                   ; $6642: $09
    ld   [hl], a                                  ; $6643: $77

jr_004_6644:
    ld   hl, $C3B0                                ; $6644: $21 $B0 $C3
    ld   [hl], $05                                ; $6647: $36 $05
    call IsEntityFrameCounterZero                 ; $6649: $CD $05 $0C
    jr   z, jr_004_6659                           ; $664C: $28 $0B

    ldh  a, [hFrameCounter]                       ; $664E: $F0 $E7
    and  $30                                      ; $6650: $E6 $30
    jr   z, jr_004_6659                           ; $6652: $28 $05

    ld   hl, $C3B0                                ; $6654: $21 $B0 $C3
    ld   [hl], $07                                ; $6657: $36 $07

jr_004_6659:
    ldh  a, [wActiveEntityPosY]                               ; $6659: $F0 $EC
    cp   $2C                                      ; $665B: $FE $2C
    jr   nc, jr_004_6677                          ; $665D: $30 $18

    ldh  a, [wActiveEntityPosX]                               ; $665F: $F0 $EE
    cp   $74                                      ; $6661: $FE $74
    jr   c, jr_004_6677                           ; $6663: $38 $12

    call IncrementEntityWalkingAttr               ; $6665: $CD $12 $3B
    ld   hl, $C240                                ; $6668: $21 $40 $C2
    add  hl, bc                                   ; $666B: $09
    ld   [hl], $05                                ; $666C: $36 $05
    ld   hl, $C250                                ; $666E: $21 $50 $C2
    add  hl, bc                                   ; $6671: $09
    ld   [hl], $F0                                ; $6672: $36 $F0
    jp   label_004_62F6                           ; $6674: $C3 $F6 $62

jr_004_6677:
    ldh  a, [wActiveEntityPosX]                               ; $6677: $F0 $EE
    cp   $03                                      ; $6679: $FE $03
    ret  nc                                       ; $667B: $D0

    ld   hl, wEntitiesWalkingTable                ; $667C: $21 $90 $C2
    ld   [hl], $03                                ; $667F: $36 $03
    ld   a, $49                                   ; $6681: $3E $49
    call OpenDialog                               ; $6683: $CD $85 $23
    jp   label_004_6D7A                           ; $6686: $C3 $7A $6D

    ld   hl, $C3B0                                ; $6689: $21 $B0 $C3
    ld   [hl], $01                                ; $668C: $36 $01
    call func_004_6DCA                            ; $668E: $CD $CA $6D
    ld   hl, $C250                                ; $6691: $21 $50 $C2
    add  hl, bc                                   ; $6694: $09
    inc  [hl]                                     ; $6695: $34
    nop                                           ; $6696: $00
    ld   a, [hl]                                  ; $6697: $7E
    cp   $0C                                      ; $6698: $FE $0C
    ret  nz                                       ; $669A: $C0

    ld   hl, wEntitiesWalkingTable                ; $669B: $21 $90 $C2
    ld   [hl], $03                                ; $669E: $36 $03
    ld   a, c                                     ; $66A0: $79
    cp   $0F                                      ; $66A1: $FE $0F
    jr   nz, jr_004_66E6                          ; $66A3: $20 $41

    ldh  a, [hRoomStatus]                               ; $66A5: $F0 $F8
    and  $10                                      ; $66A7: $E6 $10
    jr   nz, jr_004_66E6                          ; $66A9: $20 $3B

    ld   a, JINGLE_TREASURE_FOUND                 ; $66AB: $3E $01
    ldh  [hJingle], a                             ; $66AD: $E0 $F2
    ldh  a, [hMapRoom]                            ; $66AF: $F0 $F6
    ld   e, a                                     ; $66B1: $5F
    ld   d, $01                                   ; $66B2: $16 $01
    ld   hl, $D900                                ; $66B4: $21 $00 $D9
    add  hl, de                                   ; $66B7: $19
    ld   a, [hl]                                  ; $66B8: $7E
    or   $10                                      ; $66B9: $F6 $10
    ld   [hl], a                                  ; $66BB: $77
    ldh  [hRoomStatus], a                               ; $66BC: $E0 $F8
    ld   a, [wHeartPiecesCount]                               ; $66BE: $FA $5C $DB
    inc  a                                        ; $66C1: $3C
    ld   [wHeartPiecesCount], a                               ; $66C2: $EA $5C $DB
    cp   $04                                      ; $66C5: $FE $04
    jr   nz, jr_004_66DA                          ; $66C7: $20 $11

    xor  a                                        ; $66C9: $AF
    ld   [wHeartPiecesCount], a                               ; $66CA: $EA $5C $DB
    ld   hl, wSubstractRupeeBufferLow             ; $66CD: $21 $93 $DB
    ld   [hl], $40                                ; $66D0: $36 $40
    ld   hl, wMaxHealth                                ; $66D2: $21 $5B $DB
    inc  [hl]                                     ; $66D5: $34
    ld   a, $FF                                   ; $66D6: $3E $FF
    jr   jr_004_66DC                              ; $66D8: $18 $02

jr_004_66DA:
    ld   a, $FE                                   ; $66DA: $3E $FE

jr_004_66DC:
    call OpenDialogInTable1                       ; $66DC: $CD $73 $23
    ld   hl, wAddRupeeBufferHigh                  ; $66DF: $21 $90 $DB
    ld   [hl], $14                                ; $66E2: $36 $14
    jr   jr_004_66FE                              ; $66E4: $18 $18

jr_004_66E6:
    ld   hl, wEntitiesUnknownTableB               ; $66E6: $21 $B0 $C2
    add  hl, bc                                   ; $66E9: $09
    ld   a, [hl]                                  ; $66EA: $7E
    cp   $03                                      ; $66EB: $FE $03
    ld   e, $14                                   ; $66ED: $1E $14
    ld   a, $4A                                   ; $66EF: $3E $4A
    jr   z, jr_004_66F7                           ; $66F1: $28 $04

    ld   e, $05                                   ; $66F3: $1E $05
    ld   a, $4D                                   ; $66F5: $3E $4D

jr_004_66F7:
    ld   hl, wAddRupeeBufferHigh                  ; $66F7: $21 $90 $DB
    ld   [hl], e                                  ; $66FA: $73
    call OpenDialog                               ; $66FB: $CD $85 $23

jr_004_66FE:
    jp   label_004_6D7A                           ; $66FE: $C3 $7A $6D

Data_004_6701::
    db   $44, $00, $42, $00, $44, $00, $46, $00, $40, $00, $42, $00, $40, $00, $46, $00
    db   $42, $20, $44, $20, $46, $20, $44, $20, $42, $20, $40, $20, $46, $20, $40, $20
    db   $21

    add  b                                        ; $6722: $80
    jp   label_004_7E09                           ; $6723: $C3 $09 $7E

    and  a                                        ; $6726: $A7
    jr   nz, jr_004_672F                          ; $6727: $20 $06

    ldh  a, [$FFF1]                               ; $6729: $F0 $F1
    add  $04                                      ; $672B: $C6 $04
    ldh  [$FFF1], a                               ; $672D: $E0 $F1

jr_004_672F:
    ld   de, Data_004_6701                        ; $672F: $11 $01 $67
    call label_3BC0                               ; $6732: $CD $C0 $3B
    jp   label_004_644E                           ; $6735: $C3 $4E $64

label_004_6738:
    call IsEntityFrameCounterZero                 ; $6738: $CD $05 $0C
    jr   nz, jr_004_674A                          ; $673B: $20 $0D

    ld   [hl], $18                                ; $673D: $36 $18
    ld   hl, $C380                                ; $673F: $21 $80 $C3
    add  hl, bc                                   ; $6742: $09
    ld   a, [hl]                                  ; $6743: $7E
    xor  $01                                      ; $6744: $EE $01
    ld   [hl], a                                  ; $6746: $77
    call IncrementEntityWalkingAttr               ; $6747: $CD $12 $3B

jr_004_674A:
    ldh  a, [hFrameCounter]                       ; $674A: $F0 $E7
    and  $03                                      ; $674C: $E6 $03
    jr   nz, jr_004_675F                          ; $674E: $20 $0F

    ld   hl, $C240                                ; $6750: $21 $40 $C2
    add  hl, bc                                   ; $6753: $09
    ld   a, [hl]                                  ; $6754: $7E
    and  a                                        ; $6755: $A7
    jr   z, jr_004_675F                           ; $6756: $28 $07

    and  $80                                      ; $6758: $E6 $80
    jr   z, jr_004_675E                           ; $675A: $28 $02

    inc  [hl]                                     ; $675C: $34
    inc  [hl]                                     ; $675D: $34

jr_004_675E:
    dec  [hl]                                     ; $675E: $35

jr_004_675F:
    ret                                           ; $675F: $C9

    ld   [$CDF8], sp                              ; $6760: $08 $F8 $CD
    dec  b                                        ; $6763: $05
    inc  c                                        ; $6764: $0C
    jr   nz, jr_004_676D                          ; $6765: $20 $06

    ld   [hl], $50                                ; $6767: $36 $50
    call IncrementEntityWalkingAttr               ; $6769: $CD $12 $3B
    ld   [hl], b                                  ; $676C: $70

jr_004_676D:
    ldh  a, [hFrameCounter]                       ; $676D: $F0 $E7
    rra                                           ; $676F: $1F
    rra                                           ; $6770: $1F
    rra                                           ; $6771: $1F
    and  $01                                      ; $6772: $E6 $01
    call label_3B0C                               ; $6774: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $6777: $F0 $E7
    and  $03                                      ; $6779: $E6 $03
    jr   nz, jr_004_679A                          ; $677B: $20 $1D

    ld   hl, $C240                                ; $677D: $21 $40 $C2
    add  hl, bc                                   ; $6780: $09
    ld   a, [hl]                                  ; $6781: $7E
    push hl                                       ; $6782: $E5
    ld   hl, $C380                                ; $6783: $21 $80 $C3
    add  hl, bc                                   ; $6786: $09
    ld   e, [hl]                                  ; $6787: $5E
    ld   d, $00                                   ; $6788: $16 $00
    ld   hl, $6760                                ; $678A: $21 $60 $67
    add  hl, de                                   ; $678D: $19
    sub  [hl]                                     ; $678E: $96
    pop  hl                                       ; $678F: $E1
    and  a                                        ; $6790: $A7
    jr   z, jr_004_679A                           ; $6791: $28 $07

    and  $80                                      ; $6793: $E6 $80
    jr   z, jr_004_6799                           ; $6795: $28 $02

    inc  [hl]                                     ; $6797: $34
    inc  [hl]                                     ; $6798: $34

jr_004_6799:
    dec  [hl]                                     ; $6799: $35

jr_004_679A:
    ret                                           ; $679A: $C9

func_004_679B:
    ld   a, [wIntroSubTimer]                      ; $679B: $FA $02 $D0
    and  a                                        ; $679E: $A7
    jr   nz, jr_004_67FA                          ; $679F: $20 $59

    ld   a, [$D003]                               ; $67A1: $FA $03 $D0
    ld   e, a                                     ; $67A4: $5F
    ld   d, b                                     ; $67A5: $50
    ld   hl, wEntitiesTypeTable                   ; $67A6: $21 $80 $C2
    add  hl, de                                   ; $67A9: $19
    ld   a, [hl]                                  ; $67AA: $7E
    and  a                                        ; $67AB: $A7
    jr   z, jr_004_67FA                           ; $67AC: $28 $4C

    ld   hl, wEntitiesWalkingTable                ; $67AE: $21 $90 $C2
    add  hl, de                                   ; $67B1: $19
    ld   a, [hl]                                  ; $67B2: $7E
    and  a                                        ; $67B3: $A7
    jr   z, jr_004_67FA                           ; $67B4: $28 $44

    ld   a, [$D000]                               ; $67B6: $FA $00 $D0
    ld   hl, wActiveEntityPosX                                ; $67B9: $21 $EE $FF
    sub  [hl]                                     ; $67BC: $96
    rlca                                          ; $67BD: $07
    rlca                                          ; $67BE: $07
    and  $01                                      ; $67BF: $E6 $01
    ld   hl, $C380                                ; $67C1: $21 $80 $C3
    add  hl, bc                                   ; $67C4: $09
    cp   [hl]                                     ; $67C5: $BE
    jr   nz, jr_004_67FA                          ; $67C6: $20 $32

    ld   a, [$D000]                               ; $67C8: $FA $00 $D0
    ld   hl, wActiveEntityPosX                                ; $67CB: $21 $EE $FF
    sub  [hl]                                     ; $67CE: $96
    add  $18                                      ; $67CF: $C6 $18
    cp   $30                                      ; $67D1: $FE $30
    jr   nc, jr_004_67FA                          ; $67D3: $30 $25

    ld   a, [wIntroTimer]                         ; $67D5: $FA $01 $D0
    ld   hl, $FFEF                                ; $67D8: $21 $EF $FF
    sub  [hl]                                     ; $67DB: $96
    add  $10                                      ; $67DC: $C6 $10
    cp   $20                                      ; $67DE: $FE $20
    jr   nc, jr_004_67FA                          ; $67E0: $30 $18

    call IncrementEntityWalkingAttr               ; $67E2: $CD $12 $3B
    ld   [hl], $02                                ; $67E5: $36 $02
    ld   hl, wIntroSubTimer                       ; $67E7: $21 $02 $D0
    inc  [hl]                                     ; $67EA: $34
    ld   hl, $D004                                ; $67EB: $21 $04 $D0
    inc  [hl]                                     ; $67EE: $34
    call IsEntityFrameCounterZero                 ; $67EF: $CD $05 $0C
    call GetRandomByte                            ; $67F2: $CD $0D $28
    and  $3F                                      ; $67F5: $E6 $3F
    add  $30                                      ; $67F7: $C6 $30
    ld   [hl], a                                  ; $67F9: $77

jr_004_67FA:
    ret                                           ; $67FA: $C9

label_004_67FB:
    call $0C83                                    ; $67FB: $CD $83 $0C
    ldh  a, [hLinkPositionX]                      ; $67FE: $F0 $98
    swap a                                        ; $6800: $CB $37
    and  $0F                                      ; $6802: $E6 $0F
    ld   e, a                                     ; $6804: $5F
    ldh  a, [hLinkPositionY]                      ; $6805: $F0 $99
    sub  $08                                      ; $6807: $D6 $08
    and  $F0                                      ; $6809: $E6 $F0
    or   e                                        ; $680B: $B3
    ld   [wWarp0PositionTileIndex], a             ; $680C: $EA $16 $D4
    xor  a                                        ; $680F: $AF
    ld   [wC167], a                               ; $6810: $EA $67 $C1
    ret                                           ; $6813: $C9

    ld   c, h                                     ; $6814: $4C
    rlca                                          ; $6815: $07
    ld   c, h                                     ; $6816: $4C
    daa                                           ; $6817: $27
    ld   c, [hl]                                  ; $6818: $4E
    inc  b                                        ; $6819: $04
    ld   c, [hl]                                  ; $681A: $4E
    inc  h                                        ; $681B: $24
    ld   a, h                                     ; $681C: $7C
    rlca                                          ; $681D: $07
    ld   a, h                                     ; $681E: $7C
    daa                                           ; $681F: $27
    ld   a, [hl]                                  ; $6820: $7E
    inc  b                                        ; $6821: $04
    ld   a, [hl]                                  ; $6822: $7E
    inc  h                                        ; $6823: $24
    ld   hl, $D45E                                ; $6824: $21 $5E $D4
    inc  [hl]                                     ; $6827: $34
    ld   de, $6814                                ; $6828: $11 $14 $68
    ldh  a, [hMapId]                              ; $682B: $F0 $F7
    cp   $01                                      ; $682D: $FE $01
    jr   nz, jr_004_6834                          ; $682F: $20 $03

    ld   de, $681C                                ; $6831: $11 $1C $68

jr_004_6834:
    call label_3BC0                               ; $6834: $CD $C0 $3B
    call func_004_7FA3                            ; $6837: $CD $A3 $7F
    call label_3B70                               ; $683A: $CD $70 $3B
    ldh  a, [hActiveEntityWalking]                               ; $683D: $F0 $F0
    JP_TABLE                                      ; $683F: $C7
    ld   c, b                                     ; $6840: $48
    ld   l, b                                     ; $6841: $68
    db   $fd                                      ; $6842: $FD
    ld   l, b                                     ; $6843: $68
    nop                                           ; $6844: $00
    inc  bc                                       ; $6845: $03
    ld   bc, $CD02                                ; $6846: $01 $02 $CD
    ei                                            ; $6849: $FB
    dec  bc                                       ; $684A: $0B
    jr   nz, jr_004_6852                          ; $684B: $20 $05

    ld   [hl], $10                                ; $684D: $36 $10
    jp   IncrementEntityWalkingAttr               ; $684F: $C3 $12 $3B

jr_004_6852:
    ld   a, [wLinkMotionState]                    ; $6852: $FA $1C $C1
    cp   $00                                      ; $6855: $FE $00
    jp   nz, label_004_68E4                       ; $6857: $C2 $E4 $68

    ldh  a, [hLinkPositionXIncrement]                               ; $685A: $F0 $9A
    push af                                       ; $685C: $F5
    ldh  a, [hLinkPositionYIncrement]                               ; $685D: $F0 $9B
    push af                                       ; $685F: $F5
    ld   e, $00                                   ; $6860: $1E $00
    ldh  a, [$FFEB]                               ; $6862: $F0 $EB
    cp   $52                                      ; $6864: $FE $52
    ld   a, $14                                   ; $6866: $3E $14
    jr   nz, jr_004_686D                          ; $6868: $20 $03

    inc  e                                        ; $686A: $1C
    ld   a, $08                                   ; $686B: $3E $08

jr_004_686D:
    push de                                       ; $686D: $D5
    call label_3BB5                               ; $686E: $CD $B5 $3B
    pop  de                                       ; $6871: $D1
    ldh  a, [hScratchA]                               ; $6872: $F0 $D7
    bit  0, e                                     ; $6874: $CB $43
    jr   z, jr_004_687A                           ; $6876: $28 $02

    cpl                                           ; $6878: $2F
    inc  a                                        ; $6879: $3C

jr_004_687A:
    ldh  [hLinkPositionYIncrement], a                               ; $687A: $E0 $9B
    ldh  a, [hScratchB]                               ; $687C: $F0 $D8
    bit  0, e                                     ; $687E: $CB $43
    jr   z, jr_004_6884                           ; $6880: $28 $02

    cpl                                           ; $6882: $2F
    inc  a                                        ; $6883: $3C

jr_004_6884:
    ldh  [hLinkPositionXIncrement], a                               ; $6884: $E0 $9A
    push bc                                       ; $6886: $C5
    call UpdateFinalLinkPosition                  ; $6887: $CD $A8 $21
    call label_3E19                               ; $688A: $CD $19 $3E
    pop  bc                                       ; $688D: $C1
    pop  af                                       ; $688E: $F1
    ldh  [hLinkPositionYIncrement], a                               ; $688F: $E0 $9B
    pop  af                                       ; $6891: $F1
    ldh  [hLinkPositionXIncrement], a                               ; $6892: $E0 $9A
    xor  a                                        ; $6894: $AF
    ld   [$C144], a                               ; $6895: $EA $44 $C1
    ldh  a, [$FFEB]                               ; $6898: $F0 $EB
    cp   $52                                      ; $689A: $FE $52
    jp   nz, label_004_68E4                       ; $689C: $C2 $E4 $68

    ld   a, [$C146]                               ; $689F: $FA $46 $C1
    and  a                                        ; $68A2: $A7
    jr   nz, jr_004_68D4                          ; $68A3: $20 $2F

    call func_004_6E35                            ; $68A5: $CD $35 $6E
    add  $04                                      ; $68A8: $C6 $04
    cp   $08                                      ; $68AA: $FE $08
    jr   nc, jr_004_68D4                          ; $68AC: $30 $26

    call func_004_6E45                            ; $68AE: $CD $45 $6E
    add  $04                                      ; $68B1: $C6 $04
    cp   $08                                      ; $68B3: $FE $08
    jr   nc, jr_004_68D4                          ; $68B5: $30 $1D

    ldh  a, [wActiveEntityPosX]                               ; $68B7: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $68B9: $E0 $98
    ldh  a, [wActiveEntityPosY]                               ; $68BB: $F0 $EC
    ldh  [hLinkPositionY], a                      ; $68BD: $E0 $99
    ld   a, $06                                   ; $68BF: $3E $06
    ld   [wLinkMotionState], a                    ; $68C1: $EA $1C $C1
    call label_CAF                                ; $68C4: $CD $AF $0C
    ld   [$C198], a                               ; $68C7: $EA $98 $C1
    ld   a, $FF                                   ; $68CA: $3E $FF
    ld   [$DBCB], a                               ; $68CC: $EA $CB $DB
    ld   a, $0C                                   ; $68CF: $3E $0C
    ldh  [hSFX], a                                ; $68D1: $E0 $F3
    ret                                           ; $68D3: $C9

jr_004_68D4:
    ldh  a, [hFrameCounter]                       ; $68D4: $F0 $E7
    rra                                           ; $68D6: $1F
    rra                                           ; $68D7: $1F
    rra                                           ; $68D8: $1F
    and  $03                                      ; $68D9: $E6 $03
    ld   e, a                                     ; $68DB: $5F
    ld   d, b                                     ; $68DC: $50
    ld   hl, $6844                                ; $68DD: $21 $44 $68
    add  hl, de                                   ; $68E0: $19
    ld   a, [hl]                                  ; $68E1: $7E
    ldh  [hLinkDirection], a                      ; $68E2: $E0 $9E

label_004_68E4:
    call func_004_690D                            ; $68E4: $CD $0D $69
    ldh  a, [hFrameCounter]                       ; $68E7: $F0 $E7
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    rra                                           ; $68EB: $1F
    rra                                           ; $68EC: $1F
    and  $01                                      ; $68ED: $E6 $01
    call label_3B0C                               ; $68EF: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $68F2: $F0 $E7
    and  $1F                                      ; $68F4: $E6 $1F
    jr   nz, jr_004_68FC                          ; $68F6: $20 $04

    ld   a, $1F                                   ; $68F8: $3E $1F
    ldh  [hNextSFX], a                            ; $68FA: $E0 $F4

jr_004_68FC:
    ret                                           ; $68FC: $C9

    call label_BFB                                ; $68FD: $CD $FB $0B
    jr   nz, jr_004_6908                          ; $6900: $20 $06

    ld   [hl], $40                                ; $6902: $36 $40
    call IncrementEntityWalkingAttr               ; $6904: $CD $12 $3B
    ld   [hl], b                                  ; $6907: $70

jr_004_6908:
    ld   a, $00                                   ; $6908: $3E $00
    jp   label_3B0C                               ; $690A: $C3 $0C $3B

func_004_690D:
    ld   e, $0F                                   ; $690D: $1E $0F
    ld   d, b                                     ; $690F: $50

label_004_6910:
    push de                                       ; $6910: $D5
    ld   a, e                                     ; $6911: $7B
    cp   c                                        ; $6912: $B9
    jp   z, label_004_69A5                        ; $6913: $CA $A5 $69

    ld   hl, wEntitiesTypeTable                   ; $6916: $21 $80 $C2
    add  hl, de                                   ; $6919: $19
    ld   a, [hl]                                  ; $691A: $7E
    and  a                                        ; $691B: $A7
    jp   z, label_004_69A5                        ; $691C: $CA $A5 $69

    call label_3D8A                               ; $691F: $CD $8A $3D
    push bc                                       ; $6922: $C5
    ld   c, e                                     ; $6923: $4B
    ld   b, d                                     ; $6924: $42
    ldh  a, [hFrameCounter]                       ; $6925: $F0 $E7
    xor  c                                        ; $6927: $A9
    and  $01                                      ; $6928: $E6 $01
    jr   nz, jr_004_69A4                          ; $692A: $20 $78

    ldh  a, [hLinkPositionX]                      ; $692C: $F0 $98
    push af                                       ; $692E: $F5
    ldh  a, [hLinkPositionY]                      ; $692F: $F0 $99
    push af                                       ; $6931: $F5
    ldh  a, [wActiveEntityPosX]                               ; $6932: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $6934: $E0 $98
    ldh  a, [$FFEF]                               ; $6936: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $6938: $E0 $99
    ld   hl, $C240                                ; $693A: $21 $40 $C2
    add  hl, bc                                   ; $693D: $09
    ld   a, [hl]                                  ; $693E: $7E
    push af                                       ; $693F: $F5
    ld   hl, $C250                                ; $6940: $21 $50 $C2
    add  hl, bc                                   ; $6943: $09
    ld   a, [hl]                                  ; $6944: $7E
    push af                                       ; $6945: $F5
    ld   a, $10                                   ; $6946: $3E $10
    call label_3BB5                               ; $6948: $CD $B5 $3B
    ld   e, $00                                   ; $694B: $1E $00
    ldh  a, [$FFEB]                               ; $694D: $F0 $EB
    cp   $52                                      ; $694F: $FE $52
    jr   nz, jr_004_6954                          ; $6951: $20 $01

    inc  e                                        ; $6953: $1C

jr_004_6954:
    ldh  a, [hScratchA]                               ; $6954: $F0 $D7
    bit  0, e                                     ; $6956: $CB $43
    jr   nz, jr_004_695C                          ; $6958: $20 $02

    cpl                                           ; $695A: $2F
    inc  a                                        ; $695B: $3C

jr_004_695C:
    ld   hl, $C250                                ; $695C: $21 $50 $C2
    add  hl, bc                                   ; $695F: $09
    ld   [hl], a                                  ; $6960: $77
    ldh  a, [hScratchB]                               ; $6961: $F0 $D8
    bit  0, e                                     ; $6963: $CB $43
    jr   nz, jr_004_6969                          ; $6965: $20 $02

    cpl                                           ; $6967: $2F
    inc  a                                        ; $6968: $3C

jr_004_6969:
    ld   hl, $C240                                ; $6969: $21 $40 $C2
    add  hl, bc                                   ; $696C: $09
    ld   [hl], a                                  ; $696D: $77
    call label_3D8A                               ; $696E: $CD $8A $3D
    call func_004_6DCA                            ; $6971: $CD $CA $6D
    call label_3B23                               ; $6974: $CD $23 $3B
    ldh  a, [wActiveEntityPosX]                               ; $6977: $F0 $EE
    ld   hl, hLinkPositionX                       ; $6979: $21 $98 $FF
    sub  [hl]                                     ; $697C: $96
    add  $02                                      ; $697D: $C6 $02
    cp   $04                                      ; $697F: $FE $04
    jr   nc, jr_004_6992                          ; $6981: $30 $0F

    ldh  a, [wActiveEntityPosY]                               ; $6983: $F0 $EC
    ld   hl, hLinkPositionY                       ; $6985: $21 $99 $FF
    sub  [hl]                                     ; $6988: $96
    add  $02                                      ; $6989: $C6 $02
    cp   $04                                      ; $698B: $FE $04
    jr   nc, jr_004_6992                          ; $698D: $30 $03

    call func_004_6D7A                            ; $698F: $CD $7A $6D

jr_004_6992:
    pop  af                                       ; $6992: $F1
    ld   hl, $C250                                ; $6993: $21 $50 $C2
    add  hl, bc                                   ; $6996: $09
    ld   [hl], a                                  ; $6997: $77
    pop  af                                       ; $6998: $F1
    ld   hl, $C240                                ; $6999: $21 $40 $C2
    add  hl, bc                                   ; $699C: $09
    ld   [hl], a                                  ; $699D: $77
    pop  af                                       ; $699E: $F1
    ldh  [hLinkPositionY], a                      ; $699F: $E0 $99
    pop  af                                       ; $69A1: $F1
    ldh  [hLinkPositionX], a                      ; $69A2: $E0 $98

jr_004_69A4:
    pop  bc                                       ; $69A4: $C1

label_004_69A5:
    pop  de                                       ; $69A5: $D1
    dec  e                                        ; $69A6: $1D
    ld   a, e                                     ; $69A7: $7B
    cp   $FF                                      ; $69A8: $FE $FF
    jp   nz, label_004_6910                       ; $69AA: $C2 $10 $69

    ret                                           ; $69AD: $C9

    ldh  a, [hMapId]                              ; $69AE: $F0 $F7
    cp   $14                                      ; $69B0: $FE $14
    jr   c, jr_004_69C9                           ; $69B2: $38 $15

    ldh  a, [hRoomStatus]                               ; $69B4: $F0 $F8
    and  $10                                      ; $69B6: $E6 $10
    jp   nz, label_004_6D7A                       ; $69B8: $C2 $7A $6D

    ld   hl, $C460                                ; $69BB: $21 $60 $C4
    add  hl, bc                                   ; $69BE: $09
    ld   [hl], $FF                                ; $69BF: $36 $FF
    ld   hl, $C4E0                                ; $69C1: $21 $E0 $C4
    add  hl, bc                                   ; $69C4: $09
    ld   [hl], $3C                                ; $69C5: $36 $3C
    jr   jr_004_69D5                              ; $69C7: $18 $0C

jr_004_69C9:
    ld   e, a                                     ; $69C9: $5F
    ld   d, b                                     ; $69CA: $50
    ld   hl, wHasInstrument1                      ; $69CB: $21 $65 $DB
    add  hl, de                                   ; $69CE: $19
    ld   a, [hl]                                  ; $69CF: $7E
    and  $01                                      ; $69D0: $E6 $01
    jp   nz, label_004_6D7A                       ; $69D2: $C2 $7A $6D

jr_004_69D5:
    call $6AC7                                    ; $69D5: $CD $C7 $6A
    call label_3D8A                               ; $69D8: $CD $8A $3D
    call func_004_7FA3                            ; $69DB: $CD $A3 $7F
    call func_004_6D80                            ; $69DE: $CD $80 $6D
    ld   hl, $C430                                ; $69E1: $21 $30 $C4
    add  hl, bc                                   ; $69E4: $09
    ld   [hl], $00                                ; $69E5: $36 $00
    call label_3B39                               ; $69E7: $CD $39 $3B
    ldh  a, [hActiveEntityWalking]                               ; $69EA: $F0 $F0
    JP_TABLE                                      ; $69EC: $C7
    di                                            ; $69ED: $F3
    ld   l, c                                     ; $69EE: $69
    dec  a                                        ; $69EF: $3D
    ld   l, d                                     ; $69F0: $6A
    ld   l, d                                     ; $69F1: $6A
    ld   l, d                                     ; $69F2: $6A
    call IsEntityFrameCounterZero                 ; $69F3: $CD $05 $0C
    jr   nz, jr_004_6A25                          ; $69F6: $20 $2D

    ldh  a, [hFrameCounter]                       ; $69F8: $F0 $E7
    xor  c                                        ; $69FA: $A9
    and  $07                                      ; $69FB: $E6 $07
    jr   nz, jr_004_6A04                          ; $69FD: $20 $05

    ld   a, $04                                   ; $69FF: $3E $04
    call label_3BAA                               ; $6A01: $CD $AA $3B

jr_004_6A04:
    call func_004_6DCA                            ; $6A04: $CD $CA $6D
    call label_3B23                               ; $6A07: $CD $23 $3B
    call func_004_6E35                            ; $6A0A: $CD $35 $6E
    add  $30                                      ; $6A0D: $C6 $30
    cp   $60                                      ; $6A0F: $FE $60
    jr   nc, jr_004_6A25                          ; $6A11: $30 $12

    call func_004_6E45                            ; $6A13: $CD $45 $6E
    add  $30                                      ; $6A16: $C6 $30
    cp   $60                                      ; $6A18: $FE $60
    jr   nc, jr_004_6A25                          ; $6A1A: $30 $09

    call IsEntityFrameCounterZero                 ; $6A1C: $CD $05 $0C
    ld   [hl], $28                                ; $6A1F: $36 $28
    jp   IncrementEntityWalkingAttr               ; $6A21: $C3 $12 $3B

jr_004_6A24:
    ret                                           ; $6A24: $C9

jr_004_6A25:
    ldh  a, [hFrameCounter]                       ; $6A25: $F0 $E7
    and  $01                                      ; $6A27: $E6 $01
    jr   nz, jr_004_6A24                          ; $6A29: $20 $F9

label_004_6A2B:
    ld   hl, $C3D0                                ; $6A2B: $21 $D0 $C3
    add  hl, bc                                   ; $6A2E: $09
    inc  [hl]                                     ; $6A2F: $34
    ld   a, [hl]                                  ; $6A30: $7E
    rra                                           ; $6A31: $1F
    rra                                           ; $6A32: $1F
    rra                                           ; $6A33: $1F
    and  $01                                      ; $6A34: $E6 $01
    jp   label_3B0C                               ; $6A36: $C3 $0C $3B

    inc  b                                        ; $6A39: $04
    inc  c                                        ; $6A3A: $0C
    nop                                           ; $6A3B: $00
    ld   [$05CD], sp                              ; $6A3C: $08 $CD $05
    inc  c                                        ; $6A3F: $0C
    jr   nz, jr_004_6A67                          ; $6A40: $20 $25

    call func_004_6E55                            ; $6A42: $CD $55 $6E
    ld   hl, $C380                                ; $6A45: $21 $80 $C3
    add  hl, bc                                   ; $6A48: $09
    ld   [hl], e                                  ; $6A49: $73
    ld   d, b                                     ; $6A4A: $50
    ld   hl, $C3D0                                ; $6A4B: $21 $D0 $C3
    add  hl, bc                                   ; $6A4E: $09
    ld   a, [hl]                                  ; $6A4F: $7E
    and  $0F                                      ; $6A50: $E6 $0F
    ld   hl, $6A39                                ; $6A52: $21 $39 $6A
    add  hl, de                                   ; $6A55: $19
    cp   [hl]                                     ; $6A56: $BE
    jr   nz, jr_004_6A67                          ; $6A57: $20 $0E

    ld   hl, wEntitiesUnknownTableB               ; $6A59: $21 $B0 $C2
    add  hl, bc                                   ; $6A5C: $09
    ld   [hl], $38                                ; $6A5D: $36 $38
    ld   hl, $C440                                ; $6A5F: $21 $40 $C4
    add  hl, bc                                   ; $6A62: $09
    ld   [hl], b                                  ; $6A63: $70
    call IncrementEntityWalkingAttr               ; $6A64: $CD $12 $3B

jr_004_6A67:
    jp   label_004_6A2B                           ; $6A67: $C3 $2B $6A

    call func_004_6E1D                            ; $6A6A: $CD $1D $6E
    ld   hl, wEntitiesUnknownTableB               ; $6A6D: $21 $B0 $C2
    add  hl, bc                                   ; $6A70: $09
    dec  [hl]                                     ; $6A71: $35
    dec  [hl]                                     ; $6A72: $35
    ldh  a, [hFrameCounter]                       ; $6A73: $F0 $E7
    and  $03                                      ; $6A75: $E6 $03
    jr   nz, jr_004_6A7E                          ; $6A77: $20 $05

    ld   hl, $C440                                ; $6A79: $21 $40 $C4
    add  hl, bc                                   ; $6A7C: $09
    inc  [hl]                                     ; $6A7D: $34

jr_004_6A7E:
    ld   hl, wEntitiesUnknownTableD               ; $6A7E: $21 $D0 $C2
    add  hl, bc                                   ; $6A81: $09
    ld   a, [hl]                                  ; $6A82: $7E
    and  a                                        ; $6A83: $A7
    jr   z, jr_004_6A8A                           ; $6A84: $28 $04

    and  $80                                      ; $6A86: $E6 $80
    jr   z, jr_004_6AA6                           ; $6A88: $28 $1C

jr_004_6A8A:
    ld   [hl], b                                  ; $6A8A: $70
    call IncrementEntityWalkingAttr               ; $6A8B: $CD $12 $3B
    ld   [hl], b                                  ; $6A8E: $70
    call IsEntityFrameCounterZero                 ; $6A8F: $CD $05 $0C
    ld   [hl], $10                                ; $6A92: $36 $10
    ld   hl, $C380                                ; $6A94: $21 $80 $C3
    add  hl, bc                                   ; $6A97: $09
    ld   e, [hl]                                  ; $6A98: $5E
    ld   d, b                                     ; $6A99: $50
    ld   hl, $6A39                                ; $6A9A: $21 $39 $6A
    add  hl, de                                   ; $6A9D: $19
    ld   a, [hl]                                  ; $6A9E: $7E
    add  $08                                      ; $6A9F: $C6 $08
    ld   hl, $C3D0                                ; $6AA1: $21 $D0 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], a                                  ; $6AA5: $77

jr_004_6AA6:
    ret                                           ; $6AA6: $C9

    ld   [hl], b                                  ; $6AA7: $70
    ld   [bc], a                                  ; $6AA8: $02
    ld   [hl], d                                  ; $6AA9: $72
    ld   [bc], a                                  ; $6AAA: $02
    ld   [hl], h                                  ; $6AAB: $74
    ld   [bc], a                                  ; $6AAC: $02
    db   $76                                      ; $6AAD: $76
    ld   [bc], a                                  ; $6AAE: $02
    ld   a, b                                     ; $6AAF: $78
    ld   [bc], a                                  ; $6AB0: $02
    ld   a, b                                     ; $6AB1: $78
    ld   [hl+], a                                 ; $6AB2: $22
    ld   a, [bc]                                  ; $6AB3: $0A
    ld   b, $03                                   ; $6AB4: $06 $03
    ld   bc, $0100                                ; $6AB6: $01 $00 $01
    inc  bc                                       ; $6AB9: $03
    ld   b, $0A                                   ; $6ABA: $06 $0A
    ld   c, $11                                   ; $6ABC: $0E $11
    inc  de                                       ; $6ABE: $13
    inc  d                                        ; $6ABF: $14
    inc  de                                       ; $6AC0: $13
    ld   de, $0A0E                                ; $6AC1: $11 $0E $0A
    ld   b, $03                                   ; $6AC4: $06 $03
    ld   bc, $A711                                ; $6AC6: $01 $11 $A7
    ld   l, d                                     ; $6AC9: $6A
    call label_3BC0                               ; $6ACA: $CD $C0 $3B
    ld   hl, wEntitiesUnknownTableD               ; $6ACD: $21 $D0 $C2
    add  hl, bc                                   ; $6AD0: $09
    ld   a, [hl]                                  ; $6AD1: $7E
    and  a                                        ; $6AD2: $A7
    jr   z, jr_004_6B31                           ; $6AD3: $28 $5C

    xor  a                                        ; $6AD5: $AF
    ldh  [hScratchA], a                               ; $6AD6: $E0 $D7
    ld   hl, $C380                                ; $6AD8: $21 $80 $C3
    add  hl, bc                                   ; $6ADB: $09
    ld   a, [hl]                                  ; $6ADC: $7E
    ld   hl, wEntitiesUnknownTableD               ; $6ADD: $21 $D0 $C2
    add  hl, bc                                   ; $6AE0: $09
    bit  1, a                                     ; $6AE1: $CB $4F
    jr   nz, jr_004_6B0B                          ; $6AE3: $20 $26

    cp   $01                                      ; $6AE5: $FE $01
    ld   a, [hl]                                  ; $6AE7: $7E
    jr   nz, jr_004_6AF0                          ; $6AE8: $20 $06

    ld   hl, hScratchA                                ; $6AEA: $21 $D7 $FF
    inc  [hl]                                     ; $6AED: $34
    cpl                                           ; $6AEE: $2F
    inc  a                                        ; $6AEF: $3C

jr_004_6AF0:
    ld   hl, wActiveEntityPosX                                ; $6AF0: $21 $EE $FF
    add  [hl]                                     ; $6AF3: $86
    ld   [hl], a                                  ; $6AF4: $77
    ld   hl, $C440                                ; $6AF5: $21 $40 $C4
    add  hl, bc                                   ; $6AF8: $09
    ldh  a, [hScratchA]                               ; $6AF9: $F0 $D7
    and  a                                        ; $6AFB: $A7
    ld   a, [hl]                                  ; $6AFC: $7E
    jr   z, jr_004_6B02                           ; $6AFD: $28 $03

    cpl                                           ; $6AFF: $2F
    and  $0F                                      ; $6B00: $E6 $0F

jr_004_6B02:
    ld   hl, wActiveEntityPosY                                ; $6B02: $21 $EC $FF
    add  [hl]                                     ; $6B05: $86
    add  $F3                                      ; $6B06: $C6 $F3
    ld   [hl], a                                  ; $6B08: $77
    jr   jr_004_6B51                              ; $6B09: $18 $46

jr_004_6B0B:
    cp   $02                                      ; $6B0B: $FE $02
    ld   a, [hl]                                  ; $6B0D: $7E
    jr   nz, jr_004_6B16                          ; $6B0E: $20 $06

    ld   hl, hScratchA                                ; $6B10: $21 $D7 $FF
    inc  [hl]                                     ; $6B13: $34
    cpl                                           ; $6B14: $2F
    inc  a                                        ; $6B15: $3C

jr_004_6B16:
    ld   hl, wActiveEntityPosY                                ; $6B16: $21 $EC $FF
    add  [hl]                                     ; $6B19: $86
    ld   [hl], a                                  ; $6B1A: $77
    ld   hl, $C440                                ; $6B1B: $21 $40 $C4
    add  hl, bc                                   ; $6B1E: $09
    ldh  a, [hScratchA]                               ; $6B1F: $F0 $D7
    and  a                                        ; $6B21: $A7
    ld   a, [hl]                                  ; $6B22: $7E
    jr   nz, jr_004_6B28                          ; $6B23: $20 $03

    cpl                                           ; $6B25: $2F
    and  $0F                                      ; $6B26: $E6 $0F

jr_004_6B28:
    ld   hl, wActiveEntityPosX                                ; $6B28: $21 $EE $FF
    add  [hl]                                     ; $6B2B: $86
    add  $F8                                      ; $6B2C: $C6 $F8
    ld   [hl], a                                  ; $6B2E: $77
    jr   jr_004_6B51                              ; $6B2F: $18 $20

jr_004_6B31:
    ld   hl, $C3D0                                ; $6B31: $21 $D0 $C3
    add  hl, bc                                   ; $6B34: $09
    ld   a, [hl]                                  ; $6B35: $7E
    and  $0F                                      ; $6B36: $E6 $0F
    ld   e, a                                     ; $6B38: $5F
    ld   d, $00                                   ; $6B39: $16 $00
    ld   hl, $6AB3                                ; $6B3B: $21 $B3 $6A
    add  hl, de                                   ; $6B3E: $19
    ldh  a, [wActiveEntityPosY]                               ; $6B3F: $F0 $EC
    add  [hl]                                     ; $6B41: $86
    add  $F0                                      ; $6B42: $C6 $F0
    ldh  [wActiveEntityPosY], a                               ; $6B44: $E0 $EC
    ld   hl, $6AB7                                ; $6B46: $21 $B7 $6A
    add  hl, de                                   ; $6B49: $19
    ldh  a, [wActiveEntityPosX]                               ; $6B4A: $F0 $EE
    add  [hl]                                     ; $6B4C: $86
    add  $F3                                      ; $6B4D: $C6 $F3
    ldh  [wActiveEntityPosX], a                               ; $6B4F: $E0 $EE

jr_004_6B51:
    ld   a, $02                                   ; $6B51: $3E $02
    ldh  [$FFF1], a                               ; $6B53: $E0 $F1
    ld   de, $6AA7                                ; $6B55: $11 $A7 $6A
    call label_3BC0                               ; $6B58: $CD $C0 $3B
    ld   hl, $C440                                ; $6B5B: $21 $40 $C4
    add  hl, bc                                   ; $6B5E: $09
    ld   a, [hl]                                  ; $6B5F: $7E
    and  a                                        ; $6B60: $A7
    ret  z                                        ; $6B61: $C8

    ld   hl, wEntitiesUnknownTableB               ; $6B62: $21 $B0 $C2
    add  hl, bc                                   ; $6B65: $09
    ld   a, [hl]                                  ; $6B66: $7E
    and  $80                                      ; $6B67: $E6 $80
    jr   nz, jr_004_6B7C                          ; $6B69: $20 $11

    call label_C00                                ; $6B6B: $CD $00 $0C
    jr   nz, jr_004_6B7C                          ; $6B6E: $20 $0C

    ld   hl, $C430                                ; $6B70: $21 $30 $C4
    add  hl, bc                                   ; $6B73: $09
    ld   [hl], $40                                ; $6B74: $36 $40
    call label_3B39                               ; $6B76: $CD $39 $3B
    call func_004_6BE1                            ; $6B79: $CD $E1 $6B

jr_004_6B7C:
    ldh  a, [wActiveEntityPosX]                               ; $6B7C: $F0 $EE
    add  $04                                      ; $6B7E: $C6 $04
    ld   hl, wEntity0PosX                         ; $6B80: $21 $00 $C2
    add  hl, bc                                   ; $6B83: $09
    sub  [hl]                                     ; $6B84: $96
    sra  a                                        ; $6B85: $CB $2F
    sra  a                                        ; $6B87: $CB $2F
    ldh  [hScratchA], a                               ; $6B89: $E0 $D7
    ldh  [hScratchC], a                               ; $6B8B: $E0 $D9
    ldh  a, [wActiveEntityPosY]                               ; $6B8D: $F0 $EC
    ld   hl, wEntitiesPosYTable                   ; $6B8F: $21 $10 $C2
    add  hl, bc                                   ; $6B92: $09
    sub  [hl]                                     ; $6B93: $96
    sra  a                                        ; $6B94: $CB $2F
    sra  a                                        ; $6B96: $CB $2F
    ldh  [hScratchB], a                               ; $6B98: $E0 $D8
    ldh  [hScratchD], a                               ; $6B9A: $E0 $DA
    ld   a, [$C3C0]                               ; $6B9C: $FA $C0 $C3
    ld   e, a                                     ; $6B9F: $5F
    ld   d, $00                                   ; $6BA0: $16 $00
    ld   hl, $C030                                ; $6BA2: $21 $30 $C0
    add  hl, de                                   ; $6BA5: $19
    ld   e, l                                     ; $6BA6: $5D
    ld   d, h                                     ; $6BA7: $54
    call label_3D8A                               ; $6BA8: $CD $8A $3D
    ld   a, $03                                   ; $6BAB: $3E $03

jr_004_6BAD:
    ldh  [$FFDB], a                               ; $6BAD: $E0 $DB
    ldh  a, [wActiveEntityPosY]                               ; $6BAF: $F0 $EC
    ld   hl, hScratchB                                ; $6BB1: $21 $D8 $FF
    add  [hl]                                     ; $6BB4: $86
    ld   [de], a                                  ; $6BB5: $12
    inc  de                                       ; $6BB6: $13
    ldh  a, [wActiveEntityPosX]                               ; $6BB7: $F0 $EE
    ld   hl, hScratchA                                ; $6BB9: $21 $D7 $FF
    add  [hl]                                     ; $6BBC: $86
    ld   [de], a                                  ; $6BBD: $12
    inc  de                                       ; $6BBE: $13
    ld   a, $24                                   ; $6BBF: $3E $24
    ld   [de], a                                  ; $6BC1: $12
    inc  de                                       ; $6BC2: $13
    ld   a, $00                                   ; $6BC3: $3E $00
    ld   [de], a                                  ; $6BC5: $12
    inc  de                                       ; $6BC6: $13
    ldh  a, [hScratchA]                               ; $6BC7: $F0 $D7
    ld   hl, hScratchC                                ; $6BC9: $21 $D9 $FF
    add  [hl]                                     ; $6BCC: $86
    ldh  [hScratchA], a                               ; $6BCD: $E0 $D7
    ldh  a, [hScratchB]                               ; $6BCF: $F0 $D8
    ld   hl, hScratchD                                ; $6BD1: $21 $DA $FF
    add  [hl]                                     ; $6BD4: $86
    ldh  [hScratchB], a                               ; $6BD5: $E0 $D8
    ldh  a, [$FFDB]                               ; $6BD7: $F0 $DB
    dec  a                                        ; $6BD9: $3D
    jr   nz, jr_004_6BAD                          ; $6BDA: $20 $D1

    ld   a, $03                                   ; $6BDC: $3E $03
    jp   label_3DA0                               ; $6BDE: $C3 $A0 $3D

func_004_6BE1:
    ldh  a, [wActiveEntityPosX]                               ; $6BE1: $F0 $EE
    ldh  [$FFDB], a                               ; $6BE3: $E0 $DB
    swap a                                        ; $6BE5: $CB $37
    and  $0F                                      ; $6BE7: $E6 $0F
    ld   e, a                                     ; $6BE9: $5F
    ldh  a, [wActiveEntityPosY]                               ; $6BEA: $F0 $EC
    sub  $10                                      ; $6BEC: $D6 $10
    add  $04                                      ; $6BEE: $C6 $04
    ldh  [$FFDC], a                               ; $6BF0: $E0 $DC
    and  $F0                                      ; $6BF2: $E6 $F0
    or   e                                        ; $6BF4: $B3
    ld   e, a                                     ; $6BF5: $5F
    ld   d, $00                                   ; $6BF6: $16 $00
    ld   hl, wRoomObjects                       ; $6BF8: $21 $11 $D7
    ld   a, h                                     ; $6BFB: $7C
    add  hl, de                                   ; $6BFC: $19
    ld   h, a                                     ; $6BFD: $67
    ld   a, [hl]                                  ; $6BFE: $7E
    ldh  [$FFAF], a                               ; $6BFF: $E0 $AF
    ld   e, a                                     ; $6C01: $5F
    ld   a, [wIsIndoor]                         ; $6C02: $FA $A5 $DB
    ld   d, a                                     ; $6C05: $57
    call label_2A26                               ; $6C06: $CD $26 $2A
    cp   $00                                      ; $6C09: $FE $00
    ret  z                                        ; $6C0B: $C8

    cp   $01                                      ; $6C0C: $FE $01
    ret  nz                                       ; $6C0E: $C0

    ld   hl, wEntitiesUnknownTableB               ; $6C0F: $21 $B0 $C2
    add  hl, bc                                   ; $6C12: $09
    ld   a, [hl]                                  ; $6C13: $7E
    cpl                                           ; $6C14: $2F
    inc  a                                        ; $6C15: $3C
    ld   [hl], a                                  ; $6C16: $77
    call label_C00                                ; $6C17: $CD $00 $0C
    ld   [hl], $08                                ; $6C1A: $36 $08
    ld   a, JINGLE_SWORD_POKING                   ; $6C1C: $3E $07
    ldh  [hJingle], a                             ; $6C1E: $E0 $F2

label_004_6C20:
    ldh  a, [wActiveEntityPosX]                               ; $6C20: $F0 $EE
    ldh  [hScratchA], a                               ; $6C22: $E0 $D7
    ldh  a, [wActiveEntityPosY]                               ; $6C24: $F0 $EC
    ldh  [hScratchB], a                               ; $6C26: $E0 $D8
    ld   a, $05                                   ; $6C28: $3E $05
    jp   label_CC7                                ; $6C2A: $C3 $C7 $0C

    ld   [hl], b                                  ; $6C2D: $70
    inc  bc                                       ; $6C2E: $03
    ld   [hl], b                                  ; $6C2F: $70
    inc  hl                                       ; $6C30: $23
    ld   a, b                                     ; $6C31: $78
    inc  bc                                       ; $6C32: $03
    ld   a, d                                     ; $6C33: $7A
    inc  bc                                       ; $6C34: $03
    ld   [hl], h                                  ; $6C35: $74
    inc  bc                                       ; $6C36: $03
    db   $76                                      ; $6C37: $76
    inc  bc                                       ; $6C38: $03
    ld   a, h                                     ; $6C39: $7C
    inc  bc                                       ; $6C3A: $03
    ld   a, [hl]                                  ; $6C3B: $7E
    inc  bc                                       ; $6C3C: $03
    ld   [hl], d                                  ; $6C3D: $72
    inc  bc                                       ; $6C3E: $03
    ld   [hl], d                                  ; $6C3F: $72
    inc  hl                                       ; $6C40: $23
    ld   a, [hl]                                  ; $6C41: $7E
    inc  hl                                       ; $6C42: $23
    ld   a, h                                     ; $6C43: $7C
    inc  hl                                       ; $6C44: $23
    db   $76                                      ; $6C45: $76
    inc  hl                                       ; $6C46: $23
    ld   [hl], h                                  ; $6C47: $74
    inc  hl                                       ; $6C48: $23
    ld   a, d                                     ; $6C49: $7A
    inc  hl                                       ; $6C4A: $23
    ld   a, b                                     ; $6C4B: $78
    inc  hl                                       ; $6C4C: $23
    db   $10                                      ; $6C4D: $10
    ld   c, $0C                                   ; $6C4E: $0E $0C
    ld   b, $00                                   ; $6C50: $06 $00
    ld   a, [$F2F4]                               ; $6C52: $FA $F4 $F2
    ldh  a, [hJingle]                               ; $6C55: $F0 $F2
    db   $f4                                      ; $6C57: $F4
    ld   a, [$0600]                               ; $6C58: $FA $00 $06
    inc  c                                        ; $6C5B: $0C
    ld   c, $10                                   ; $6C5C: $0E $10
    ld   c, $0C                                   ; $6C5E: $0E $0C
    ld   b, $F0                                   ; $6C60: $06 $F0
    ldh  a, [hAnimatedTilesDataOffset]                               ; $6C62: $F0 $A7
    jp   nz, label_004_6D0F                       ; $6C64: $C2 $0F $6D

    ld   de, $6C2D                                ; $6C67: $11 $2D $6C
    call label_3BC0                               ; $6C6A: $CD $C0 $3B
    call func_004_7FA3                            ; $6C6D: $CD $A3 $7F
    call label_3B44                               ; $6C70: $CD $44 $3B
    call label_3B23                               ; $6C73: $CD $23 $3B
    call IsEntityFrameCounterZero                 ; $6C76: $CD $05 $0C
    jr   z, jr_004_6CB4                           ; $6C79: $28 $39

    cp   $10                                      ; $6C7B: $FE $10
    jr   nz, jr_004_6CB3                          ; $6C7D: $20 $34

    ld   a, $2B                                   ; $6C7F: $3E $2B
    call label_3B86                               ; $6C81: $CD $86 $3B
    jr   c, jr_004_6CB3                           ; $6C84: $38 $2D

    ld   a, $08                                   ; $6C86: $3E $08
    ldh  [hNextSFX], a                            ; $6C88: $E0 $F4
    ldh  a, [hScratchA]                               ; $6C8A: $F0 $D7
    ld   hl, wEntity0PosX                         ; $6C8C: $21 $00 $C2
    add  hl, de                                   ; $6C8F: $19
    ld   [hl], a                                  ; $6C90: $77
    ldh  a, [hScratchB]                               ; $6C91: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6C93: $21 $10 $C2
    add  hl, de                                   ; $6C96: $19
    ld   [hl], a                                  ; $6C97: $77
    ldh  a, [hScratchC]                               ; $6C98: $F0 $D9
    ld   hl, $C380                                ; $6C9A: $21 $80 $C3
    add  hl, de                                   ; $6C9D: $19
    ld   [hl], a                                  ; $6C9E: $77
    ld   hl, $C240                                ; $6C9F: $21 $40 $C2
    add  hl, bc                                   ; $6CA2: $09
    ld   a, [hl]                                  ; $6CA3: $7E
    ld   hl, $C240                                ; $6CA4: $21 $40 $C2
    add  hl, de                                   ; $6CA7: $19
    ld   [hl], a                                  ; $6CA8: $77
    ld   hl, $C250                                ; $6CA9: $21 $50 $C2
    add  hl, bc                                   ; $6CAC: $09
    ld   a, [hl]                                  ; $6CAD: $7E
    ld   hl, $C250                                ; $6CAE: $21 $50 $C2
    add  hl, de                                   ; $6CB1: $19
    ld   [hl], a                                  ; $6CB2: $77

jr_004_6CB3:
    ret                                           ; $6CB3: $C9

jr_004_6CB4:
    ld   hl, $C3D0                                ; $6CB4: $21 $D0 $C3
    add  hl, bc                                   ; $6CB7: $09
    ld   a, [hl]                                  ; $6CB8: $7E
    inc  a                                        ; $6CB9: $3C
    ld   [hl], a                                  ; $6CBA: $77
    and  $07                                      ; $6CBB: $E6 $07
    jr   nz, jr_004_6D0E                          ; $6CBD: $20 $4F

    ld   hl, $C380                                ; $6CBF: $21 $80 $C3
    add  hl, bc                                   ; $6CC2: $09
    ld   a, [hl]                                  ; $6CC3: $7E
    inc  a                                        ; $6CC4: $3C
    and  $0F                                      ; $6CC5: $E6 $0F
    ld   [hl], a                                  ; $6CC7: $77
    srl  a                                        ; $6CC8: $CB $3F
    ld   hl, $C3B0                                ; $6CCA: $21 $B0 $C3
    add  hl, bc                                   ; $6CCD: $09
    ld   [hl], a                                  ; $6CCE: $77
    ld   a, $2A                                   ; $6CCF: $3E $2A
    call label_3B86                               ; $6CD1: $CD $86 $3B
    jr   c, jr_004_6D0E                           ; $6CD4: $38 $38

    ldh  a, [hScratchA]                               ; $6CD6: $F0 $D7
    ld   hl, wEntity0PosX                         ; $6CD8: $21 $00 $C2
    add  hl, de                                   ; $6CDB: $19
    ld   [hl], a                                  ; $6CDC: $77
    ldh  a, [hScratchB]                               ; $6CDD: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6CDF: $21 $10 $C2
    add  hl, de                                   ; $6CE2: $19
    ld   [hl], a                                  ; $6CE3: $77
    ld   hl, wEntitiesWalkingTable                ; $6CE4: $21 $90 $C2
    add  hl, de                                   ; $6CE7: $19
    ld   [hl], $01                                ; $6CE8: $36 $01
    ld   hl, wEntitiesUnknownTableB               ; $6CEA: $21 $B0 $C2
    add  hl, de                                   ; $6CED: $19
    ld   [hl], c                                  ; $6CEE: $71
    ld   hl, $C340                                ; $6CEF: $21 $40 $C3
    add  hl, de                                   ; $6CF2: $19
    ld   [hl], $C0                                ; $6CF3: $36 $C0
    push bc                                       ; $6CF5: $C5
    ldh  a, [hScratchC]                               ; $6CF6: $F0 $D9
    ld   c, a                                     ; $6CF8: $4F
    ld   hl, $6C51                                ; $6CF9: $21 $51 $6C
    add  hl, bc                                   ; $6CFC: $09
    ld   a, [hl]                                  ; $6CFD: $7E
    ld   hl, $C240                                ; $6CFE: $21 $40 $C2
    add  hl, de                                   ; $6D01: $19
    ld   [hl], a                                  ; $6D02: $77
    ld   hl, $6C4D                                ; $6D03: $21 $4D $6C
    add  hl, bc                                   ; $6D06: $09
    ld   a, [hl]                                  ; $6D07: $7E
    ld   hl, $C250                                ; $6D08: $21 $50 $C2
    add  hl, de                                   ; $6D0B: $19
    ld   [hl], a                                  ; $6D0C: $77
    pop  bc                                       ; $6D0D: $C1

jr_004_6D0E:
    ret                                           ; $6D0E: $C9

label_004_6D0F:
    call label_3B2E                               ; $6D0F: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable               ; $6D12: $21 $A0 $C2
    add  hl, bc                                   ; $6D15: $09
    ld   a, [hl]                                  ; $6D16: $7E
    and  a                                        ; $6D17: $A7
    jp   nz, label_004_6D7A                       ; $6D18: $C2 $7A $6D

    ldh  a, [wActiveEntityPosX]                               ; $6D1B: $F0 $EE
    ld   hl, hLinkPositionX                       ; $6D1D: $21 $98 $FF
    sub  [hl]                                     ; $6D20: $96
    add  $10                                      ; $6D21: $C6 $10
    cp   $20                                      ; $6D23: $FE $20
    jr   nc, jr_004_6D5C                          ; $6D25: $30 $35

    ldh  a, [$FFEF]                               ; $6D27: $F0 $EF
    ld   hl, hLinkPositionY                       ; $6D29: $21 $99 $FF
    sub  [hl]                                     ; $6D2C: $96
    add  $10                                      ; $6D2D: $C6 $10
    cp   $20                                      ; $6D2F: $FE $20
    jr   nc, jr_004_6D5C                          ; $6D31: $30 $29

    call func_004_6D7A                            ; $6D33: $CD $7A $6D
    ld   a, [$DBC7]                               ; $6D36: $FA $C7 $DB
    and  a                                        ; $6D39: $A7
    jr   nz, jr_004_6D5C                          ; $6D3A: $20 $20

    ld   hl, wEntitiesUnknownTableB               ; $6D3C: $21 $B0 $C2
    add  hl, bc                                   ; $6D3F: $09
    ld   e, [hl]                                  ; $6D40: $5E
    ld   d, b                                     ; $6D41: $50
    ld   hl, wEntitiesFrameCounterTable           ; $6D42: $21 $E0 $C2
    add  hl, de                                   ; $6D45: $19
    ld   a, [hl]                                  ; $6D46: $7E
    and  a                                        ; $6D47: $A7
    jr   nz, jr_004_6D5C                          ; $6D48: $20 $12

    ld   [hl], $20                                ; $6D4A: $36 $20
    ld   hl, $C420                                ; $6D4C: $21 $20 $C4
    add  hl, de                                   ; $6D4F: $19
    ld   [hl], $10                                ; $6D50: $36 $10
    push bc                                       ; $6D52: $C5
    ld   c, e                                     ; $6D53: $4B
    ld   b, d                                     ; $6D54: $42
    ld   a, $40                                   ; $6D55: $3E $40
    call label_3BAA                               ; $6D57: $CD $AA $3B
    pop  bc                                       ; $6D5A: $C1
    ret                                           ; $6D5B: $C9

jr_004_6D5C:
    ld   hl, $C240                                ; $6D5C: $21 $40 $C2
    add  hl, bc                                   ; $6D5F: $09
    ld   a, [hl]                                  ; $6D60: $7E
    ld   hl, wEntity0PosX                         ; $6D61: $21 $00 $C2
    add  hl, bc                                   ; $6D64: $09
    add  [hl]                                     ; $6D65: $86
    ld   [hl], a                                  ; $6D66: $77
    cp   $9C                                      ; $6D67: $FE $9C
    jp   nc, label_004_6D7A                       ; $6D69: $D2 $7A $6D

    ld   hl, $C250                                ; $6D6C: $21 $50 $C2
    add  hl, bc                                   ; $6D6F: $09
    ld   a, [hl]                                  ; $6D70: $7E
    ld   hl, wEntitiesPosYTable                   ; $6D71: $21 $10 $C2
    add  hl, bc                                   ; $6D74: $09
    add  [hl]                                     ; $6D75: $86
    ld   [hl], a                                  ; $6D76: $77
    cp   $78                                      ; $6D77: $FE $78
    ret  c                                        ; $6D79: $D8

func_004_6D7A:
label_004_6D7A:
    ld   hl, wEntitiesTypeTable                   ; $6D7A: $21 $80 $C2
    add  hl, bc                                   ; $6D7D: $09
    ld   [hl], b                                  ; $6D7E: $70
    ret                                           ; $6D7F: $C9

func_004_6D80:
    ld   hl, $C410                                ; $6D80: $21 $10 $C4
    add  hl, bc                                   ; $6D83: $09
    ld   a, [hl]                                  ; $6D84: $7E
    and  a                                        ; $6D85: $A7
    jr   z, jr_004_6DC9                           ; $6D86: $28 $41

    dec  a                                        ; $6D88: $3D
    ld   [hl], a                                  ; $6D89: $77
    call label_3E8E                               ; $6D8A: $CD $8E $3E
    ld   hl, $C240                                ; $6D8D: $21 $40 $C2
    add  hl, bc                                   ; $6D90: $09
    ld   a, [hl]                                  ; $6D91: $7E
    push af                                       ; $6D92: $F5
    ld   hl, $C250                                ; $6D93: $21 $50 $C2
    add  hl, bc                                   ; $6D96: $09
    ld   a, [hl]                                  ; $6D97: $7E
    push af                                       ; $6D98: $F5
    ld   hl, $C3F0                                ; $6D99: $21 $F0 $C3
    add  hl, bc                                   ; $6D9C: $09
    ld   a, [hl]                                  ; $6D9D: $7E
    ld   hl, $C240                                ; $6D9E: $21 $40 $C2
    add  hl, bc                                   ; $6DA1: $09
    ld   [hl], a                                  ; $6DA2: $77
    ld   hl, $C400                                ; $6DA3: $21 $00 $C4
    add  hl, bc                                   ; $6DA6: $09
    ld   a, [hl]                                  ; $6DA7: $7E
    ld   hl, $C250                                ; $6DA8: $21 $50 $C2
    add  hl, bc                                   ; $6DAB: $09
    ld   [hl], a                                  ; $6DAC: $77
    call func_004_6DCA                            ; $6DAD: $CD $CA $6D
    ld   hl, $C430                                ; $6DB0: $21 $30 $C4
    add  hl, bc                                   ; $6DB3: $09
    ld   a, [hl]                                  ; $6DB4: $7E
    and  $20                                      ; $6DB5: $E6 $20
    jr   nz, jr_004_6DBC                          ; $6DB7: $20 $03

    call label_3B23                               ; $6DB9: $CD $23 $3B

jr_004_6DBC:
    ld   hl, $C250                                ; $6DBC: $21 $50 $C2
    add  hl, bc                                   ; $6DBF: $09
    pop  af                                       ; $6DC0: $F1
    ld   [hl], a                                  ; $6DC1: $77
    ld   hl, $C240                                ; $6DC2: $21 $40 $C2
    add  hl, bc                                   ; $6DC5: $09
    pop  af                                       ; $6DC6: $F1
    ld   [hl], a                                  ; $6DC7: $77
    pop  af                                       ; $6DC8: $F1

jr_004_6DC9:
    ret                                           ; $6DC9: $C9

func_004_6DCA:
label_004_6DCA:
    call func_004_6DD7                            ; $6DCA: $CD $D7 $6D

func_004_6DCD:
    push bc                                       ; $6DCD: $C5
    ld   a, c                                     ; $6DCE: $79
    add  $10                                      ; $6DCF: $C6 $10
    ld   c, a                                     ; $6DD1: $4F
    call func_004_6DD7                            ; $6DD2: $CD $D7 $6D
    pop  bc                                       ; $6DD5: $C1
    ret                                           ; $6DD6: $C9

func_004_6DD7:
    ld   hl, $C240                                ; $6DD7: $21 $40 $C2
    add  hl, bc                                   ; $6DDA: $09
    ld   a, [hl]                                  ; $6DDB: $7E
    and  a                                        ; $6DDC: $A7
    jr   z, jr_004_6E02                           ; $6DDD: $28 $23

    push af                                       ; $6DDF: $F5
    swap a                                        ; $6DE0: $CB $37
    and  $F0                                      ; $6DE2: $E6 $F0
    ld   hl, $C260                                ; $6DE4: $21 $60 $C2
    add  hl, bc                                   ; $6DE7: $09
    add  [hl]                                     ; $6DE8: $86
    ld   [hl], a                                  ; $6DE9: $77
    rl   d                                        ; $6DEA: $CB $12
    ld   hl, wEntity0PosX                         ; $6DEC: $21 $00 $C2

label_004_6DEF:
jr_004_6DEF:
    add  hl, bc                                   ; $6DEF: $09
    pop  af                                       ; $6DF0: $F1
    ld   e, $00                                   ; $6DF1: $1E $00
    bit  7, a                                     ; $6DF3: $CB $7F
    jr   z, jr_004_6DF9                           ; $6DF5: $28 $02

    ld   e, $F0                                   ; $6DF7: $1E $F0

jr_004_6DF9:
    swap a                                        ; $6DF9: $CB $37
    and  $0F                                      ; $6DFB: $E6 $0F
    or   e                                        ; $6DFD: $B3
    rr   d                                        ; $6DFE: $CB $1A
    adc  [hl]                                     ; $6E00: $8E
    ld   [hl], a                                  ; $6E01: $77

jr_004_6E02:
    ret                                           ; $6E02: $C9

func_004_6E03:
    ld   hl, $C320                                ; $6E03: $21 $20 $C3
    add  hl, bc                                   ; $6E06: $09
    ld   a, [hl]                                  ; $6E07: $7E
    and  a                                        ; $6E08: $A7
    jr   z, jr_004_6E02                           ; $6E09: $28 $F7

    push af                                       ; $6E0B: $F5
    swap a                                        ; $6E0C: $CB $37
    and  $F0                                      ; $6E0E: $E6 $F0
    ld   hl, $C330                                ; $6E10: $21 $30 $C3
    add  hl, bc                                   ; $6E13: $09
    add  [hl]                                     ; $6E14: $86
    ld   [hl], a                                  ; $6E15: $77
    rl   d                                        ; $6E16: $CB $12
    ld   hl, $C310                                ; $6E18: $21 $10 $C3
    jr   jr_004_6DEF                              ; $6E1B: $18 $D2

func_004_6E1D:
    ld   hl, wEntitiesUnknownTableB               ; $6E1D: $21 $B0 $C2
    add  hl, bc                                   ; $6E20: $09
    ld   a, [hl]                                  ; $6E21: $7E
    push af                                       ; $6E22: $F5
    swap a                                        ; $6E23: $CB $37
    and  $F0                                      ; $6E25: $E6 $F0
    ld   hl, wEntitiesUnknownTableC               ; $6E27: $21 $C0 $C2
    add  hl, bc                                   ; $6E2A: $09
    add  [hl]                                     ; $6E2B: $86
    ld   [hl], a                                  ; $6E2C: $77
    rl   d                                        ; $6E2D: $CB $12
    ld   hl, wEntitiesUnknownTableD               ; $6E2F: $21 $D0 $C2
    jp   label_004_6DEF                           ; $6E32: $C3 $EF $6D

func_004_6E35:
    ld   e, $00                                   ; $6E35: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6E37: $F0 $98
    ld   hl, wEntity0PosX                         ; $6E39: $21 $00 $C2
    add  hl, bc                                   ; $6E3C: $09
    sub  [hl]                                     ; $6E3D: $96
    bit  7, a                                     ; $6E3E: $CB $7F
    jr   z, jr_004_6E43                           ; $6E40: $28 $01

    inc  e                                        ; $6E42: $1C

jr_004_6E43:
    ld   d, a                                     ; $6E43: $57
    ret                                           ; $6E44: $C9

func_004_6E45:
    ld   e, $02                                   ; $6E45: $1E $02
    ldh  a, [hLinkPositionY]                      ; $6E47: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $6E49: $21 $10 $C2
    add  hl, bc                                   ; $6E4C: $09
    sub  [hl]                                     ; $6E4D: $96
    bit  7, a                                     ; $6E4E: $CB $7F
    jr   nz, jr_004_6E53                          ; $6E50: $20 $01

    inc  e                                        ; $6E52: $1C

jr_004_6E53:
    ld   d, a                                     ; $6E53: $57
    ret                                           ; $6E54: $C9

func_004_6E55:
    call func_004_6E35                            ; $6E55: $CD $35 $6E
    ld   a, e                                     ; $6E58: $7B
    ldh  [hScratchA], a                               ; $6E59: $E0 $D7
    ld   a, d                                     ; $6E5B: $7A
    bit  7, a                                     ; $6E5C: $CB $7F
    jr   z, jr_004_6E62                           ; $6E5E: $28 $02

    cpl                                           ; $6E60: $2F
    inc  a                                        ; $6E61: $3C

jr_004_6E62:
    push af                                       ; $6E62: $F5
    call func_004_6E45                            ; $6E63: $CD $45 $6E
    ld   a, e                                     ; $6E66: $7B
    ldh  [hScratchB], a                               ; $6E67: $E0 $D8
    ld   a, d                                     ; $6E69: $7A
    bit  7, a                                     ; $6E6A: $CB $7F
    jr   z, jr_004_6E70                           ; $6E6C: $28 $02

    cpl                                           ; $6E6E: $2F
    inc  a                                        ; $6E6F: $3C

jr_004_6E70:
    pop  de                                       ; $6E70: $D1
    cp   d                                        ; $6E71: $BA
    jr   nc, jr_004_6E78                          ; $6E72: $30 $04

    ldh  a, [hScratchA]                               ; $6E74: $F0 $D7
    jr   jr_004_6E7A                              ; $6E76: $18 $02

jr_004_6E78:
    ldh  a, [hScratchB]                               ; $6E78: $F0 $D8

jr_004_6E7A:
    ld   e, a                                     ; $6E7A: $5F
    ret                                           ; $6E7B: $C9

    ld   a, [wIsMarinFollowingLink]               ; $6E7C: $FA $73 $DB
    push af                                       ; $6E7F: $F5
    ldh  a, [hRoomStatus]                               ; $6E80: $F0 $F8
    and  $10                                      ; $6E82: $E6 $10
    jr   z, jr_004_6E8A                           ; $6E84: $28 $04

    xor  a                                        ; $6E86: $AF
    ld   [wIsMarinFollowingLink], a               ; $6E87: $EA $73 $DB

jr_004_6E8A:
    call func_004_6E92                            ; $6E8A: $CD $92 $6E
    pop  af                                       ; $6E8D: $F1
    ld   [wIsMarinFollowingLink], a               ; $6E8E: $EA $73 $DB
    ret                                           ; $6E91: $C9

func_004_6E92:
    ld   hl, wEntitiesUnknownTableB               ; $6E92: $21 $B0 $C2
    add  hl, bc                                   ; $6E95: $09
    ld   a, [hl]                                  ; $6E96: $7E
    and  a                                        ; $6E97: $A7
    jp   nz, label_004_74D9                       ; $6E98: $C2 $D9 $74

    ld   a, c                                     ; $6E9B: $79
    ld   [$D210], a                               ; $6E9C: $EA $10 $D2
    ld   a, $02                                   ; $6E9F: $3E $02
    ld   [$C50A], a                               ; $6EA1: $EA $0A $C5
    call label_C00                                ; $6EA4: $CD $00 $0C
    dec  a                                        ; $6EA7: $3D
    jr   nz, jr_004_6EAE                          ; $6EA8: $20 $04

    ld   a, JINGLE_NEW_HEART                      ; $6EAA: $3E $19
    ldh  [hJingle], a                             ; $6EAC: $E0 $F2

jr_004_6EAE:
    ldh  a, [$FFF1]                               ; $6EAE: $F0 $F1
    inc  a                                        ; $6EB0: $3C
    jr   z, jr_004_6ECA                           ; $6EB1: $28 $17

    ldh  a, [hFrameCounter]                       ; $6EB3: $F0 $E7
    and  $1F                                      ; $6EB5: $E6 $1F
    jr   nz, jr_004_6EC1                          ; $6EB7: $20 $08

    call func_004_6E55                            ; $6EB9: $CD $55 $6E
    ld   hl, $C380                                ; $6EBC: $21 $80 $C3
    add  hl, bc                                   ; $6EBF: $09
    ld   [hl], e                                  ; $6EC0: $73

jr_004_6EC1:
    call func_004_7C98                            ; $6EC1: $CD $98 $7C
    ld   de, $76CB                                ; $6EC4: $11 $CB $76
    call label_3BC0                               ; $6EC7: $CD $C0 $3B

jr_004_6ECA:
    call func_004_73FE                            ; $6ECA: $CD $FE $73
    call label_3D8A                               ; $6ECD: $CD $8A $3D
    call func_004_7BE3                            ; $6ED0: $CD $E3 $7B
    call func_004_73B7                            ; $6ED3: $CD $B7 $73
    ldh  a, [hActiveEntityWalking]                               ; $6ED6: $F0 $F0
    cp   $03                                      ; $6ED8: $FE $03
    jr   c, jr_004_6EE9                           ; $6EDA: $38 $0D

    ld   a, [wIsMarinFollowingLink]               ; $6EDC: $FA $73 $DB
    and  a                                        ; $6EDF: $A7
    jr   z, jr_004_6EE9                           ; $6EE0: $28 $07

    ld   a, $02                                   ; $6EE2: $3E $02
    ldh  [$FFA1], a                               ; $6EE4: $E0 $A1
    ld   [wC167], a                               ; $6EE6: $EA $67 $C1

jr_004_6EE9:
    ld   a, [wGameplayType]                       ; $6EE9: $FA $95 $DB
    cp   $0B                                      ; $6EEC: $FE $0B
    ret  nz                                       ; $6EEE: $C0

    ld   a, [wTransitionSequenceCounter]          ; $6EEF: $FA $6B $C1
    cp   $04                                      ; $6EF2: $FE $04
    ret  nz                                       ; $6EF4: $C0

    ldh  a, [hActiveEntityWalking]                               ; $6EF5: $F0 $F0
    JP_TABLE                                      ; $6EF7: $C7
    jr   c, @+$71                                 ; $6EF8: $38 $6F

    add  $6F                                      ; $6EFA: $C6 $6F
    jr   nz, @+$72                                ; $6EFC: $20 $70

    ld   a, a                                     ; $6EFE: $7F
    ld   [hl], b                                  ; $6EFF: $70
    inc  c                                        ; $6F00: $0C
    ld   [hl], c                                  ; $6F01: $71
    ld   a, c                                     ; $6F02: $79
    ld   [hl], c                                  ; $6F03: $71
    or   b                                        ; $6F04: $B0
    ld   [hl], c                                  ; $6F05: $71
    rst  $38                                      ; $6F06: $FF
    ld   [hl], c                                  ; $6F07: $71
    ld   c, c                                     ; $6F08: $49
    ld   [hl], d                                  ; $6F09: $72
    ld   a, h                                     ; $6F0A: $7C
    ld   [hl], d                                  ; $6F0B: $72
    sub  [hl]                                     ; $6F0C: $96
    ld   [hl], d                                  ; $6F0D: $72
    rst  $28                                      ; $6F0E: $EF
    ld   [hl], d                                  ; $6F0F: $72
    cpl                                           ; $6F10: $2F
    ld   [hl], e                                  ; $6F11: $73
    jr   c, jr_004_6F6C                           ; $6F12: $38 $58

    ld   a, b                                     ; $6F14: $78
    ld   e, b                                     ; $6F15: $58
    ld   b, b                                     ; $6F16: $40
    ld   [hl], b                                  ; $6F17: $70
    ld   l, $2E                                   ; $6F18: $2E $2E
    ld   l, $3E                                   ; $6F1A: $2E $3E
    ld   c, [hl]                                  ; $6F1C: $4E
    ld   c, [hl]                                  ; $6F1D: $4E
    nop                                           ; $6F1E: $00
    nop                                           ; $6F1F: $00
    nop                                           ; $6F20: $00
    inc  b                                        ; $6F21: $04
    ld   bc, $0502                                ; $6F22: $01 $02 $05
    ld   [bc], a                                  ; $6F25: $02
    ld   [bc], a                                  ; $6F26: $02
    nop                                           ; $6F27: $00
    inc  bc                                       ; $6F28: $03
    inc  b                                        ; $6F29: $04
    add  c                                        ; $6F2A: $81
    add  c                                        ; $6F2B: $81
    add  c                                        ; $6F2C: $81
    add  d                                        ; $6F2D: $82
    add  c                                        ; $6F2E: $81
    add  c                                        ; $6F2F: $81
    rst  $38                                      ; $6F30: $FF
    ld   b, a                                     ; $6F31: $47
    ld   sp, $C552                                ; $6F32: $31 $52 $C5
    jr   z, jr_004_6F37                           ; $6F35: $28 $00

jr_004_6F37:
    nop                                           ; $6F37: $00
    ld   e, $06                                   ; $6F38: $1E $06
    ld   d, $00                                   ; $6F3A: $16 $00

jr_004_6F3C:
    push de                                       ; $6F3C: $D5
    ld   a, $4F                                   ; $6F3D: $3E $4F
    ld   e, $0E                                   ; $6F3F: $1E $0E
    call label_3B98                               ; $6F41: $CD $98 $3B
    ld   hl, wEntitiesUnknownTableB               ; $6F44: $21 $B0 $C2
    add  hl, de                                   ; $6F47: $19
    ld   [hl], $01                                ; $6F48: $36 $01
    ld   hl, $6F09                                ; $6F4A: $21 $09 $6F
    add  hl, de                                   ; $6F4D: $19
    ld   a, [hl]                                  ; $6F4E: $7E
    ld   hl, wEntity0PosX                         ; $6F4F: $21 $00 $C2
    add  hl, de                                   ; $6F52: $19
    ld   [hl], a                                  ; $6F53: $77
    ld   hl, $6F0F                                ; $6F54: $21 $0F $6F
    add  hl, de                                   ; $6F57: $19
    ld   a, [hl]                                  ; $6F58: $7E
    ld   hl, wEntitiesPosYTable                   ; $6F59: $21 $10 $C2
    add  hl, de                                   ; $6F5C: $19
    ld   [hl], a                                  ; $6F5D: $77
    ld   hl, $6F1B                                ; $6F5E: $21 $1B $6F
    add  hl, de                                   ; $6F61: $19
    ld   a, [hl]                                  ; $6F62: $7E
    ld   hl, $C3B0                                ; $6F63: $21 $B0 $C3
    add  hl, de                                   ; $6F66: $19
    ld   [hl], a                                  ; $6F67: $77
    ld   hl, $6F21                                ; $6F68: $21 $21 $6F
    add  hl, de                                   ; $6F6B: $19

jr_004_6F6C:
    ld   a, [hl]                                  ; $6F6C: $7E
    ld   hl, $C340                                ; $6F6D: $21 $40 $C3
    add  hl, de                                   ; $6F70: $19
    ld   [hl], a                                  ; $6F71: $77
    ld   hl, $6F15                                ; $6F72: $21 $15 $6F
    add  hl, de                                   ; $6F75: $19
    ld   a, [hl]                                  ; $6F76: $7E
    ld   hl, $C380                                ; $6F77: $21 $80 $C3
    add  hl, de                                   ; $6F7A: $19
    ld   [hl], a                                  ; $6F7B: $77
    push bc                                       ; $6F7C: $C5
    ld   c, e                                     ; $6F7D: $4B
    ld   b, d                                     ; $6F7E: $42
    call func_004_76B3                            ; $6F7F: $CD $B3 $76
    pop  bc                                       ; $6F82: $C1
    pop  de                                       ; $6F83: $D1
    dec  e                                        ; $6F84: $1D
    jr   nz, jr_004_6F3C                          ; $6F85: $20 $B5

    xor  a                                        ; $6F87: $AF
    ld   [$D206], a                               ; $6F88: $EA $06 $D2
    ld   a, $10                                   ; $6F8B: $3E $10
    ld   [$D202], a                               ; $6F8D: $EA $02 $D2
    ld   [$D203], a                               ; $6F90: $EA $03 $D2
    ld   a, $16                                   ; $6F93: $3E $16
    ld   [$D205], a                               ; $6F95: $EA $05 $D2
    ld   a, $18                                   ; $6F98: $3E $18
    ld   [$D204], a                               ; $6F9A: $EA $04 $D2
    ld   a, $00                                   ; $6F9D: $3E $00
    ld   [$D200], a                               ; $6F9F: $EA $00 $D2
    ld   a, $04                                   ; $6FA2: $3E $04
    ld   [$D201], a                               ; $6FA4: $EA $01 $D2
    call IncrementEntityWalkingAttr               ; $6FA7: $CD $12 $3B
    ld   a, [wTradeSequenceItem]                  ; $6FAA: $FA $0E $DB
    ld   hl, $C390                                ; $6FAD: $21 $90 $C3
    add  hl, bc                                   ; $6FB0: $09
    ld   [hl], a                                  ; $6FB1: $77
    ld   hl, $DC78                                ; $6FB2: $21 $78 $DC
    ld   de, $6F30                                ; $6FB5: $11 $30 $6F

jr_004_6FB8:
    ld   a, [de]                                  ; $6FB8: $1A
    ld   [hl+], a                                 ; $6FB9: $22
    inc  de                                       ; $6FBA: $13
    ld   a, l                                     ; $6FBB: $7D
    and  $07                                      ; $6FBC: $E6 $07
    jr   nz, jr_004_6FB8                          ; $6FBE: $20 $F8

    ld   a, $02                                   ; $6FC0: $3E $02
    ld   [$DDD1], a                               ; $6FC2: $EA $D1 $DD
    ret                                           ; $6FC5: $C9

    ld   a, [wC167]                               ; $6FC6: $FA $67 $C1
    and  a                                        ; $6FC9: $A7
    ret  nz                                       ; $6FCA: $C0

    ld   a, [wIsMarinFollowingLink]               ; $6FCB: $FA $73 $DB
    and  a                                        ; $6FCE: $A7
    jr   z, jr_004_6FE2                           ; $6FCF: $28 $11

    ldh  a, [hLinkPositionX]                      ; $6FD1: $F0 $98
    cp   $6C                                      ; $6FD3: $FE $6C
    jr   c, jr_004_6FE2                           ; $6FD5: $38 $0B

    ld   hl, $DAA0                                ; $6FD7: $21 $A0 $DA
    set  4, [hl]                                  ; $6FDA: $CB $E6
    ld   a, $6B                                   ; $6FDC: $3E $6B
    ldh  [hLinkPositionX], a                      ; $6FDE: $E0 $98
    jr   jr_004_6FE6                              ; $6FE0: $18 $04

jr_004_6FE2:
    call func_004_7C06                            ; $6FE2: $CD $06 $7C
    ret  nc                                       ; $6FE5: $D0

jr_004_6FE6:
    xor  a                                        ; $6FE6: $AF
    ld   [wC120], a                               ; $6FE7: $EA $20 $C1
    ldh  [hLinkPositionXIncrement], a                               ; $6FEA: $E0 $9A
    ld   e, $06                                   ; $6FEC: $1E $06
    ld   hl, $C390                                ; $6FEE: $21 $90 $C3
    add  hl, bc                                   ; $6FF1: $09
    ld   a, [hl]                                  ; $6FF2: $7E
    and  a                                        ; $6FF3: $A7
    jr   z, jr_004_6FF7                           ; $6FF4: $28 $01

    dec  e                                        ; $6FF6: $1D

jr_004_6FF7:
    ld   hl, $C440                                ; $6FF7: $21 $40 $C4
    add  hl, bc                                   ; $6FFA: $09
    ld   a, [hl]                                  ; $6FFB: $7E
    cp   e                                        ; $6FFC: $BB
    jr   c, jr_004_7004                           ; $6FFD: $38 $05

    ld   a, $40                                   ; $6FFF: $3E $40
    jp   OpenDialog                               ; $7001: $C3 $85 $23

jr_004_7004:
    ld   a, [wIsMarinFollowingLink]               ; $7004: $FA $73 $DB
    and  a                                        ; $7007: $A7
    jr   z, jr_004_700E                           ; $7008: $28 $04

    ld   a, $F7                                   ; $700A: $3E $F7
    jr   jr_004_701A                              ; $700C: $18 $0C

jr_004_700E:
    ld   hl, wEntitiesUnknownTableD               ; $700E: $21 $D0 $C2
    add  hl, bc                                   ; $7011: $09
    ld   a, [hl]                                  ; $7012: $7E
    and  a                                        ; $7013: $A7
    ld   a, $3B                                   ; $7014: $3E $3B
    jr   z, jr_004_701A                           ; $7016: $28 $02

    ld   a, $3E                                   ; $7018: $3E $3E

jr_004_701A:
    call OpenDialog                               ; $701A: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $701D: $C3 $12 $3B

    ld   a, $02                                   ; $7020: $3E $02
    ldh  [$FFA1], a                               ; $7022: $E0 $A1
    ld   a, [wDialogState]                        ; $7024: $FA $9F $C1
    and  a                                        ; $7027: $A7
    jr   nz, jr_004_705C                          ; $7028: $20 $32

    ld   a, [wDialogIndex]                        ; $702A: $FA $73 $C1
    cp   $F8                                      ; $702D: $FE $F8
    jr   z, jr_004_7038                           ; $702F: $28 $07

    ld   a, [wC177]                               ; $7031: $FA $77 $C1
    cp   $01                                      ; $7034: $FE $01
    jr   nc, jr_004_704B                          ; $7036: $30 $13

jr_004_7038:
    ld   a, [wRupeeCountLow]                      ; $7038: $FA $5E $DB
    sub  $10                                      ; $703B: $D6 $10
    ld   a, [wRupeeCountHigh]                     ; $703D: $FA $5D $DB
    sbc  $00                                      ; $7040: $DE $00
    jr   nc, jr_004_705D                          ; $7042: $30 $19

    ld   a, $34                                   ; $7044: $3E $34
    call OpenDialog                               ; $7046: $CD $85 $23
    jr   jr_004_7056                              ; $7049: $18 $0B

jr_004_704B:
    ld   a, [wIsMarinFollowingLink]               ; $704B: $FA $73 $DB
    and  a                                        ; $704E: $A7
    jr   z, jr_004_7056                           ; $704F: $28 $05

    ld   a, $F8                                   ; $7051: $3E $F8
    jp   OpenDialog                               ; $7053: $C3 $85 $23

label_004_7056:
jr_004_7056:
    ld   hl, wEntitiesWalkingTable                ; $7056: $21 $90 $C2
    add  hl, bc                                   ; $7059: $09
    ld   [hl], $01                                ; $705A: $36 $01

jr_004_705C:
    ret                                           ; $705C: $C9

jr_004_705D:
    ld   a, [wIsMarinFollowingLink]               ; $705D: $FA $73 $DB
    and  a                                        ; $7060: $A7
    jr   z, jr_004_7066                           ; $7061: $28 $03

    ld   [$DB74], a                               ; $7063: $EA $74 $DB

jr_004_7066:
    ld   hl, wEntitiesUnknownTableD               ; $7066: $21 $D0 $C2
    add  hl, bc                                   ; $7069: $09
    ld   a, [hl]                                  ; $706A: $7E
    ld   [hl], $01                                ; $706B: $36 $01
    and  a                                        ; $706D: $A7
    ld   a, $3C                                   ; $706E: $3E $3C
    jr   z, jr_004_7074                           ; $7070: $28 $02

    ld   a, $3F                                   ; $7072: $3E $3F

jr_004_7074:
    call OpenDialog                               ; $7074: $CD $85 $23
    ld   a, $0A                                   ; $7077: $3E $0A
    ld   [wSubstractRupeeBufferHigh], a           ; $7079: $EA $92 $DB
    jp   IncrementEntityWalkingAttr               ; $707C: $C3 $12 $3B

    ldh  a, [hFrameCounter]                       ; $707F: $F0 $E7
    rra                                           ; $7081: $1F
    rra                                           ; $7082: $1F
    rra                                           ; $7083: $1F
    rra                                           ; $7084: $1F
    and  $01                                      ; $7085: $E6 $01
    ld   [$D200], a                               ; $7087: $EA $00 $D2
    ld   a, $10                                   ; $708A: $3E $10
    ld   [$D203], a                               ; $708C: $EA $03 $D2
    ldh  a, [hIsGBC]                              ; $708F: $F0 $FE
    and  a                                        ; $7091: $A7
    jr   z, jr_004_70A2                           ; $7092: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7094: $F0 $E7
    and  $08                                      ; $7096: $E6 $08
    srl  a                                        ; $7098: $CB $3F
    srl  a                                        ; $709A: $CB $3F
    srl  a                                        ; $709C: $CB $3F
    add  $03                                      ; $709E: $C6 $03
    jr   jr_004_70A6                              ; $70A0: $18 $04

jr_004_70A2:
    ldh  a, [hFrameCounter]                       ; $70A2: $F0 $E7
    and  $10                                      ; $70A4: $E6 $10

jr_004_70A6:
    ld   [$D202], a                               ; $70A6: $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ; $70A9: $FA $73 $DB
    and  a                                        ; $70AC: $A7
    jr   z, jr_004_70F4                           ; $70AD: $28 $45

    call label_BFB                                ; $70AF: $CD $FB $0B
    jr   z, jr_004_70B9                           ; $70B2: $28 $05

    dec  a                                        ; $70B4: $3D
    ret  nz                                       ; $70B5: $C0

    jp   label_004_7104                           ; $70B6: $C3 $04 $71

jr_004_70B9:
    call func_004_7FA3                            ; $70B9: $CD $A3 $7F
    push bc                                       ; $70BC: $C5
    ld   a, [$C50F]                               ; $70BD: $FA $0F $C5
    ld   c, a                                     ; $70C0: $4F
    ldh  a, [hFrameCounter]                       ; $70C1: $F0 $E7
    and  $10                                      ; $70C3: $E6 $10
    ld   a, $04                                   ; $70C5: $3E $04
    jr   z, jr_004_70CA                           ; $70C7: $28 $01

    inc  a                                        ; $70C9: $3C

jr_004_70CA:
    call label_3B0C                               ; $70CA: $CD $0C $3B
    ld   hl, $C240                                ; $70CD: $21 $40 $C2
    add  hl, bc                                   ; $70D0: $09
    ld   [hl], $F8                                ; $70D1: $36 $F8
    call func_004_6DD7                            ; $70D3: $CD $D7 $6D
    ld   hl, wEntity0PosX                         ; $70D6: $21 $00 $C2
    add  hl, bc                                   ; $70D9: $09
    pop  bc                                       ; $70DA: $C1
    ld   a, [hl]                                  ; $70DB: $7E
    cp   $28                                      ; $70DC: $FE $28
    ret  nz                                       ; $70DE: $C0

    call label_BFB                                ; $70DF: $CD $FB $0B
    ld   [hl], $18                                ; $70E2: $36 $18
    ld   a, [$C50F]                               ; $70E4: $FA $0F $C5
    ld   e, a                                     ; $70E7: $5F
    ld   d, b                                     ; $70E8: $50
    ld   hl, $C3B0                                ; $70E9: $21 $B0 $C3
    add  hl, de                                   ; $70EC: $19
    ld   [hl], $02                                ; $70ED: $36 $02
    ld   e, $01                                   ; $70EF: $1E $01
    jp   label_004_723B                           ; $70F1: $C3 $3B $72

jr_004_70F4:
    ldh  a, [hPressedButtonsMask]                 ; $70F4: $F0 $CB
    and  $20                                      ; $70F6: $E6 $20
    jr   z, jr_004_710B                           ; $70F8: $28 $11

    ldh  a, [hLinkPositionX]                      ; $70FA: $F0 $98
    cp   $20                                      ; $70FC: $FE $20
    jr   c, jr_004_710B                           ; $70FE: $38 $0B

    cp   $30                                      ; $7100: $FE $30
    jr   nc, jr_004_710B                          ; $7102: $30 $07

label_004_7104:
    call IncrementEntityWalkingAttr               ; $7104: $CD $12 $3B

func_004_7107:
label_004_7107:
    ld   a, $20                                   ; $7107: $3E $20
    ldh  [hNextSFX], a                            ; $7109: $E0 $F4

jr_004_710B:
    ret                                           ; $710B: $C9

    call func_004_7165                            ; $710C: $CD $65 $71
    ld   a, $10                                   ; $710F: $3E $10
    ld   [$D203], a                               ; $7111: $EA $03 $D2
    ldh  a, [hIsGBC]                              ; $7114: $F0 $FE
    and  a                                        ; $7116: $A7
    jr   z, jr_004_7127                           ; $7117: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7119: $F0 $E7
    and  $08                                      ; $711B: $E6 $08
    srl  a                                        ; $711D: $CB $3F
    srl  a                                        ; $711F: $CB $3F
    srl  a                                        ; $7121: $CB $3F
    add  $03                                      ; $7123: $C6 $03
    jr   jr_004_712B                              ; $7125: $18 $04

jr_004_7127:
    ldh  a, [hFrameCounter]                       ; $7127: $F0 $E7
    and  $10                                      ; $7129: $E6 $10

jr_004_712B:
    ld   [$D202], a                               ; $712B: $EA $02 $D2
    ld   a, [wIsMarinFollowingLink]               ; $712E: $FA $73 $DB
    and  a                                        ; $7131: $A7
    jr   z, jr_004_713B                           ; $7132: $28 $07

    ld   e, $02                                   ; $7134: $1E $02
    call func_004_723B                            ; $7136: $CD $3B $72
    jr   jr_004_7141                              ; $7139: $18 $06

jr_004_713B:
    ldh  a, [hPressedButtonsMask]                 ; $713B: $F0 $CB
    and  $20                                      ; $713D: $E6 $20
    jr   z, jr_004_7152                           ; $713F: $28 $11

jr_004_7141:
    ldh  a, [hFrameCounter]                       ; $7141: $F0 $E7
    and  $03                                      ; $7143: $E6 $03
    jr   nz, jr_004_7164                          ; $7145: $20 $1D

    ld   a, [$D204]                               ; $7147: $FA $04 $D2
    inc  a                                        ; $714A: $3C
    ld   [$D204], a                               ; $714B: $EA $04 $D2
    cp   $88                                      ; $714E: $FE $88
    jr   c, jr_004_7164                           ; $7150: $38 $12

jr_004_7152:
    call IncrementEntityWalkingAttr               ; $7152: $CD $12 $3B
    ld   a, [wIsMarinFollowingLink]               ; $7155: $FA $73 $DB
    and  a                                        ; $7158: $A7
    jr   z, jr_004_7160                           ; $7159: $28 $05

    call label_BFB                                ; $715B: $CD $FB $0B
    ld   [hl], $10                                ; $715E: $36 $10

func_004_7160:
label_004_7160:
jr_004_7160:
    ld   a, $21                                   ; $7160: $3E $21
    ldh  [hNextSFX], a                            ; $7162: $E0 $F4

jr_004_7164:
    ret                                           ; $7164: $C9

func_004_7165:
    ldh  a, [hFrameCounter]                       ; $7165: $F0 $E7
    rra                                           ; $7167: $1F
    rra                                           ; $7168: $1F
    rra                                           ; $7169: $1F
    rra                                           ; $716A: $1F
    and  $01                                      ; $716B: $E6 $01
    ld   [$D200], a                               ; $716D: $EA $00 $D2
    ld   a, $01                                   ; $7170: $3E $01
    ldh  [$FFA1], a                               ; $7172: $E0 $A1
    ld   a, $02                                   ; $7174: $3E $02
    ldh  [hLinkDirection], a                      ; $7176: $E0 $9E
    ret                                           ; $7178: $C9

    call func_004_7165                            ; $7179: $CD $65 $71
    ld   a, $10                                   ; $717C: $3E $10
    ld   [$D202], a                               ; $717E: $EA $02 $D2
    ldh  a, [hIsGBC]                              ; $7181: $F0 $FE
    and  a                                        ; $7183: $A7
    jr   z, jr_004_7194                           ; $7184: $28 $0E

    ldh  a, [hFrameCounter]                       ; $7186: $F0 $E7
    and  $08                                      ; $7188: $E6 $08
    srl  a                                        ; $718A: $CB $3F
    srl  a                                        ; $718C: $CB $3F
    srl  a                                        ; $718E: $CB $3F
    add  $03                                      ; $7190: $C6 $03
    jr   jr_004_7198                              ; $7192: $18 $04

jr_004_7194:
    ldh  a, [hFrameCounter]                       ; $7194: $F0 $E7
    and  $10                                      ; $7196: $E6 $10

jr_004_7198:
    ld   [$D203], a                               ; $7198: $EA $03 $D2
    call label_BFB                                ; $719B: $CD $FB $0B
    ret  nz                                       ; $719E: $C0

    ld   a, [wIsMarinFollowingLink]               ; $719F: $FA $73 $DB
    and  a                                        ; $71A2: $A7
    jr   nz, jr_004_71AA                          ; $71A3: $20 $05

    ldh  a, [hPressedButtonsMask]                 ; $71A5: $F0 $CB
    and  $10                                      ; $71A7: $E6 $10
    ret  z                                        ; $71A9: $C8

jr_004_71AA:
    call func_004_7107                            ; $71AA: $CD $07 $71
    jp   IncrementEntityWalkingAttr               ; $71AD: $C3 $12 $3B

    call func_004_7165                            ; $71B0: $CD $65 $71
    ld   a, $10                                   ; $71B3: $3E $10
    ld   [$D202], a                               ; $71B5: $EA $02 $D2
    ldh  a, [hIsGBC]                              ; $71B8: $F0 $FE
    and  a                                        ; $71BA: $A7
    jr   z, jr_004_71CB                           ; $71BB: $28 $0E

    ldh  a, [hFrameCounter]                       ; $71BD: $F0 $E7
    and  $08                                      ; $71BF: $E6 $08
    srl  a                                        ; $71C1: $CB $3F
    srl  a                                        ; $71C3: $CB $3F
    srl  a                                        ; $71C5: $CB $3F
    add  $03                                      ; $71C7: $C6 $03
    jr   jr_004_71CF                              ; $71C9: $18 $04

jr_004_71CB:
    ldh  a, [hFrameCounter]                       ; $71CB: $F0 $E7
    and  $10                                      ; $71CD: $E6 $10

jr_004_71CF:
    ld   [$D203], a                               ; $71CF: $EA $03 $D2
    ld   a, [wIsMarinFollowingLink]               ; $71D2: $FA $73 $DB
    and  a                                        ; $71D5: $A7
    jr   z, jr_004_71DA                           ; $71D6: $28 $02

    jr   jr_004_71E0                              ; $71D8: $18 $06

jr_004_71DA:
    ldh  a, [hPressedButtonsMask]                 ; $71DA: $F0 $CB
    and  $10                                      ; $71DC: $E6 $10
    jr   z, jr_004_71EF                           ; $71DE: $28 $0F

jr_004_71E0:
    ldh  a, [hFrameCounter]                       ; $71E0: $F0 $E7
    and  $03                                      ; $71E2: $E6 $03
    ret  nz                                       ; $71E4: $C0

    ld   a, [$D205]                               ; $71E5: $FA $05 $D2
    inc  a                                        ; $71E8: $3C
    ld   [$D205], a                               ; $71E9: $EA $05 $D2
    cp   $55                                      ; $71EC: $FE $55
    ret  c                                        ; $71EE: $D8

jr_004_71EF:
    call IncrementEntityWalkingAttr               ; $71EF: $CD $12 $3B
    call func_004_7160                            ; $71F2: $CD $60 $71
    call IsEntityFrameCounterZero                 ; $71F5: $CD $05 $0C
    ld   [hl], $60                                ; $71F8: $36 $60
    ld   e, $00                                   ; $71FA: $1E $00
    jp   label_004_723B                           ; $71FC: $C3 $3B $72

    ldh  a, [hFrameCounter]                       ; $71FF: $F0 $E7
    rra                                           ; $7201: $1F
    rra                                           ; $7202: $1F
    rra                                           ; $7203: $1F
    and  $01                                      ; $7204: $E6 $01
    ld   [$D200], a                               ; $7206: $EA $00 $D2
    ld   a, $10                                   ; $7209: $3E $10
    ld   [$D202], a                               ; $720B: $EA $02 $D2
    ld   [$D203], a                               ; $720E: $EA $03 $D2
    call IsEntityFrameCounterZero                 ; $7211: $CD $05 $0C
    cp   $30                                      ; $7214: $FE $30
    jr   nc, jr_004_721D                          ; $7216: $30 $05

    ld   hl, $D201                                ; $7218: $21 $01 $D2
    ld   [hl], $02                                ; $721B: $36 $02

jr_004_721D:
    and  a                                        ; $721D: $A7
    jr   nz, jr_004_7248                          ; $721E: $20 $28

    ldh  a, [hFrameCounter]                       ; $7220: $F0 $E7
    and  $03                                      ; $7222: $E6 $03
    jr   nz, jr_004_7248                          ; $7224: $20 $22

    ld   a, [$D206]                               ; $7226: $FA $06 $D2
    inc  a                                        ; $7229: $3C
    ld   [$D206], a                               ; $722A: $EA $06 $D2
    cp   $0F                                      ; $722D: $FE $0F
    jr   nz, jr_004_7248                          ; $722F: $20 $17

    call IsEntityFrameCounterZero                 ; $7231: $CD $05 $0C
    ld   [hl], $FF                                ; $7234: $36 $FF
    call IncrementEntityWalkingAttr               ; $7236: $CD $12 $3B
    ld   e, $00                                   ; $7239: $1E $00

func_004_723B:
label_004_723B:
    ld   a, [wIsMarinFollowingLink]               ; $723B: $FA $73 $DB
    and  a                                        ; $723E: $A7
    ret  z                                        ; $723F: $C8

    ld   a, e                                     ; $7240: $7B
    ldh  [hLinkDirection], a                      ; $7241: $E0 $9E
    push bc                                       ; $7243: $C5
    call $0BF0                                    ; $7244: $CD $F0 $0B
    pop  bc                                       ; $7247: $C1

jr_004_7248:
    ret                                           ; $7248: $C9

    ldh  a, [hFrameCounter]                       ; $7249: $F0 $E7
    rra                                           ; $724B: $1F
    rra                                           ; $724C: $1F
    rra                                           ; $724D: $1F
    and  $01                                      ; $724E: $E6 $01
    ld   [$D200], a                               ; $7250: $EA $00 $D2
    call IsEntityFrameCounterZero                 ; $7253: $CD $05 $0C
    cp   $C8                                      ; $7256: $FE $C8
    jr   nz, jr_004_725F                          ; $7258: $20 $05

    ld   hl, $D206                                ; $725A: $21 $06 $D2
    ld   [hl], $10                                ; $725D: $36 $10

jr_004_725F:
    cp   $A0                                      ; $725F: $FE $A0
    jr   nz, jr_004_7268                          ; $7261: $20 $05

    ld   hl, $D201                                ; $7263: $21 $01 $D2
    ld   [hl], $03                                ; $7266: $36 $03

jr_004_7268:
    cp   $50                                      ; $7268: $FE $50
    jr   nz, jr_004_7274                          ; $726A: $20 $08

    ld   hl, $D201                                ; $726C: $21 $01 $D2
    ld   [hl], $04                                ; $726F: $36 $04
    jp   label_004_7332                           ; $7271: $C3 $32 $73

jr_004_7274:
    and  a                                        ; $7274: $A7
    ret  nz                                       ; $7275: $C0

    call IncrementEntityWalkingAttr               ; $7276: $CD $12 $3B
    jp   label_004_7107                           ; $7279: $C3 $07 $71

    ldh  a, [hFrameCounter]                       ; $727C: $F0 $E7
    rra                                           ; $727E: $1F
    rra                                           ; $727F: $1F
    rra                                           ; $7280: $1F
    and  $01                                      ; $7281: $E6 $01
    ld   [$D200], a                               ; $7283: $EA $00 $D2
    ldh  a, [hFrameCounter]                       ; $7286: $F0 $E7
    and  $03                                      ; $7288: $E6 $03
    ret  nz                                       ; $728A: $C0

    ld   a, [$D206]                               ; $728B: $FA $06 $D2
    dec  a                                        ; $728E: $3D
    ld   [$D206], a                               ; $728F: $EA $06 $D2
    ret  nz                                       ; $7292: $C0

    jp   IncrementEntityWalkingAttr               ; $7293: $C3 $12 $3B

    ldh  a, [hFrameCounter]                       ; $7296: $F0 $E7
    rra                                           ; $7298: $1F
    rra                                           ; $7299: $1F
    rra                                           ; $729A: $1F
    and  $01                                      ; $729B: $E6 $01
    ld   [$D200], a                               ; $729D: $EA $00 $D2
    ldh  a, [hLinkPositionX]                      ; $72A0: $F0 $98
    push af                                       ; $72A2: $F5
    ldh  a, [hLinkPositionY]                      ; $72A3: $F0 $99
    push af                                       ; $72A5: $F5
    ld   a, $16                                   ; $72A6: $3E $16
    ldh  [hLinkPositionY], a                      ; $72A8: $E0 $99
    ld   a, $18                                   ; $72AA: $3E $18
    ldh  [hLinkPositionX], a                      ; $72AC: $E0 $98
    ld   a, [$D204]                               ; $72AE: $FA $04 $D2
    ld   [wEntity1PosX], a                        ; $72B1: $EA $01 $C2
    ld   a, [$D205]                               ; $72B4: $FA $05 $D2
    ld   [$C211], a                               ; $72B7: $EA $11 $C2
    push bc                                       ; $72BA: $C5
    ld   c, $01                                   ; $72BB: $0E $01
    ld   a, $04                                   ; $72BD: $3E $04
    call label_3BAA                               ; $72BF: $CD $AA $3B
    call func_004_6DCA                            ; $72C2: $CD $CA $6D
    ld   a, [wEntity1PosX]                        ; $72C5: $FA $01 $C2
    ld   [$D204], a                               ; $72C8: $EA $04 $D2
    ld   a, [$C211]                               ; $72CB: $FA $11 $C2
    ld   [$D205], a                               ; $72CE: $EA $05 $D2
    pop  bc                                       ; $72D1: $C1
    pop  af                                       ; $72D2: $F1
    ldh  [hLinkPositionY], a                      ; $72D3: $E0 $99
    pop  af                                       ; $72D5: $F1
    ldh  [hLinkPositionX], a                      ; $72D6: $E0 $98
    ld   a, [$D204]                               ; $72D8: $FA $04 $D2
    cp   $18                                      ; $72DB: $FE $18
    ret  nz                                       ; $72DD: $C0

    ld   a, [$D205]                               ; $72DE: $FA $05 $D2
    cp   $16                                      ; $72E1: $FE $16
    ret  nz                                       ; $72E3: $C0

    call IsEntityFrameCounterZero                 ; $72E4: $CD $05 $0C
    ld   [hl], $C0                                ; $72E7: $36 $C0
    call IncrementEntityWalkingAttr               ; $72E9: $CD $12 $3B
    jp   label_004_7160                           ; $72EC: $C3 $60 $71

    ldh  a, [hFrameCounter]                       ; $72EF: $F0 $E7
    rra                                           ; $72F1: $1F
    rra                                           ; $72F2: $1F
    rra                                           ; $72F3: $1F
    and  $01                                      ; $72F4: $E6 $01
    ld   [$D200], a                               ; $72F6: $EA $00 $D2
    call IsEntityFrameCounterZero                 ; $72F9: $CD $05 $0C
    cp   $60                                      ; $72FC: $FE $60
    jr   nz, jr_004_7325                          ; $72FE: $20 $25

    ld   hl, $D201                                ; $7300: $21 $01 $D2
    ld   [hl], $02                                ; $7303: $36 $02
    ld   hl, wEntitiesUnknownTableC               ; $7305: $21 $C0 $C2
    add  hl, bc                                   ; $7308: $09
    ld   a, [hl]                                  ; $7309: $7E
    and  a                                        ; $730A: $A7
    jr   z, jr_004_7324                           ; $730B: $28 $17

    ld   [hl], $00                                ; $730D: $36 $00
    dec  a                                        ; $730F: $3D
    ld   e, a                                     ; $7310: $5F
    ld   d, b                                     ; $7311: $50
    ld   hl, wEntitiesWalkingTable                ; $7312: $21 $90 $C2
    add  hl, de                                   ; $7315: $19
    ld   [hl], $02                                ; $7316: $36 $02
    ld   a, [wIsMarinFollowingLink]               ; $7318: $FA $73 $DB
    and  a                                        ; $731B: $A7
    jr   z, jr_004_7324                           ; $731C: $28 $06

    ld   hl, $C3B0                                ; $731E: $21 $B0 $C3
    add  hl, de                                   ; $7321: $19
    ld   [hl], $07                                ; $7322: $36 $07

jr_004_7324:
    ret                                           ; $7324: $C9

jr_004_7325:
    and  a                                        ; $7325: $A7
    ret  nz                                       ; $7326: $C0

    ld   hl, $D201                                ; $7327: $21 $01 $D2
    ld   [hl], $04                                ; $732A: $36 $04
    jp   IncrementEntityWalkingAttr               ; $732C: $C3 $12 $3B

    jp   label_004_7056                           ; $732F: $C3 $56 $70

label_004_7332:
    ld   a, [wIsMarinFollowingLink]               ; $7332: $FA $73 $DB
    and  a                                        ; $7335: $A7
    jr   z, jr_004_735F                           ; $7336: $28 $27

    ld   a, $FF                                   ; $7338: $3E $FF
    call label_3B0C                               ; $733A: $CD $0C $3B
    ld   a, $4F                                   ; $733D: $3E $4F
    call label_3B86                               ; $733F: $CD $86 $3B
    ld   a, [$D204]                               ; $7342: $FA $04 $D2
    ld   hl, wEntity0PosX                         ; $7345: $21 $00 $C2
    add  hl, de                                   ; $7348: $19
    ld   [hl], a                                  ; $7349: $77
    ld   a, [$D205]                               ; $734A: $FA $05 $D2
    add  $18                                      ; $734D: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $734F: $21 $10 $C2
    add  hl, de                                   ; $7352: $19
    ld   [hl], a                                  ; $7353: $77
    ld   hl, $C3B0                                ; $7354: $21 $B0 $C3
    add  hl, de                                   ; $7357: $19
    ld   [hl], $06                                ; $7358: $36 $06
    ld   hl, wEntitiesUnknownTableB               ; $735A: $21 $B0 $C2
    add  hl, de                                   ; $735D: $19
    inc  [hl]                                     ; $735E: $34

jr_004_735F:
    ld   e, $0F                                   ; $735F: $1E $0F
    ld   d, b                                     ; $7361: $50

jr_004_7362:
    ld   hl, wEntitiesTypeTable                   ; $7362: $21 $80 $C2
    add  hl, de                                   ; $7365: $19
    ld   a, [hl]                                  ; $7366: $7E
    and  a                                        ; $7367: $A7
    jr   z, jr_004_73B0                           ; $7368: $28 $46

    ld   hl, wEntitiesWalkingTable                ; $736A: $21 $90 $C2
    add  hl, de                                   ; $736D: $19
    ld   a, [hl]                                  ; $736E: $7E
    and  a                                        ; $736F: $A7
    jr   nz, jr_004_73B0                          ; $7370: $20 $3E

    ld   hl, $C3A0                                ; $7372: $21 $A0 $C3
    add  hl, de                                   ; $7375: $19
    ld   a, [hl]                                  ; $7376: $7E
    cp   $4F                                      ; $7377: $FE $4F
    jr   nz, jr_004_73B0                          ; $7379: $20 $35

    ld   hl, wEntity0PosX                         ; $737B: $21 $00 $C2
    add  hl, de                                   ; $737E: $19
    ld   a, [$D204]                               ; $737F: $FA $04 $D2
    sub  [hl]                                     ; $7382: $96
    add  $04                                      ; $7383: $C6 $04
    cp   $08                                      ; $7385: $FE $08
    jr   nc, jr_004_73B0                          ; $7387: $30 $27

    ld   hl, wEntitiesPosYTable                   ; $7389: $21 $10 $C2
    add  hl, de                                   ; $738C: $19
    ld   a, [$D205]                               ; $738D: $FA $05 $D2
    add  $18                                      ; $7390: $C6 $18
    sub  [hl]                                     ; $7392: $96
    add  $06                                      ; $7393: $C6 $06
    cp   $0C                                      ; $7395: $FE $0C
    jr   nc, jr_004_73B0                          ; $7397: $30 $17

    ld   hl, wEntitiesWalkingTable                ; $7399: $21 $90 $C2
    add  hl, de                                   ; $739C: $19
    ld   [hl], $01                                ; $739D: $36 $01
    ld   a, e                                     ; $739F: $7B
    inc  a                                        ; $73A0: $3C
    ld   hl, wEntitiesUnknownTableC               ; $73A1: $21 $C0 $C2
    add  hl, bc                                   ; $73A4: $09
    ld   [hl], a                                  ; $73A5: $77
    call label_C00                                ; $73A6: $CD $00 $0C
    ld   [hl], $10                                ; $73A9: $36 $10
    ld   hl, $C440                                ; $73AB: $21 $40 $C4
    inc  [hl]                                     ; $73AE: $34
    ret                                           ; $73AF: $C9

jr_004_73B0:
    dec  e                                        ; $73B0: $1D
    ld   a, e                                     ; $73B1: $7B
    cp   $FF                                      ; $73B2: $FE $FF
    jr   nz, jr_004_7362                          ; $73B4: $20 $AC

    ret                                           ; $73B6: $C9

func_004_73B7:
    ld   hl, wEntitiesUnknownTableC               ; $73B7: $21 $C0 $C2
    add  hl, bc                                   ; $73BA: $09
    ld   a, [hl]                                  ; $73BB: $7E
    and  a                                        ; $73BC: $A7
    jr   z, jr_004_73E1                           ; $73BD: $28 $22

    dec  a                                        ; $73BF: $3D
    ld   e, a                                     ; $73C0: $5F
    ld   d, b                                     ; $73C1: $50
    ld   a, [$D204]                               ; $73C2: $FA $04 $D2
    ld   hl, wEntity0PosX                         ; $73C5: $21 $00 $C2
    add  hl, de                                   ; $73C8: $19
    ld   [hl], a                                  ; $73C9: $77
    ld   a, [$D205]                               ; $73CA: $FA $05 $D2
    add  $18                                      ; $73CD: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $73CF: $21 $10 $C2
    add  hl, de                                   ; $73D2: $19
    ld   [hl], a                                  ; $73D3: $77
    ld   a, $10                                   ; $73D4: $3E $10
    ld   hl, $D206                                ; $73D6: $21 $06 $D2
    sub  [hl]                                     ; $73D9: $96
    add  $FE                                      ; $73DA: $C6 $FE
    ld   hl, $C310                                ; $73DC: $21 $10 $C3
    add  hl, de                                   ; $73DF: $19
    ld   [hl], a                                  ; $73E0: $77

jr_004_73E1:
    ret                                           ; $73E1: $C9

Data_004_73E2::
    db   $76, $03, $78, $03, $78, $23, $76, $23, $70, $03, $70, $23, $72, $03, $70, $23
    db   $72, $03, $72, $23, $7E, $00, $7E, $20

Data_004_73FA::
    db   $26, $00, $26

    nop                                           ; $73FD: $00

func_004_73FE:
    ld   a, [$D204]                               ; $73FE: $FA $04 $D2
    ldh  [wActiveEntityPosX], a                               ; $7401: $E0 $EE
    ld   a, [$D205]                               ; $7403: $FA $05 $D2
    ld   hl, $D206                                ; $7406: $21 $06 $D2
    add  [hl]                                     ; $7409: $86
    add  $08                                      ; $740A: $C6 $08
    ldh  [wActiveEntityPosY], a                               ; $740C: $E0 $EC
    ld   a, [$D201]                               ; $740E: $FA $01 $D2
    ldh  [$FFF1], a                               ; $7411: $E0 $F1
    ld   de, Data_004_73E2                        ; $7413: $11 $E2 $73
    call label_3BC0                               ; $7416: $CD $C0 $3B
    ld   a, [$D204]                               ; $7419: $FA $04 $D2
    ldh  [wActiveEntityPosX], a                               ; $741C: $E0 $EE
    ld   a, [$D205]                               ; $741E: $FA $05 $D2
    ldh  [wActiveEntityPosY], a                               ; $7421: $E0 $EC
    ld   a, [$D200]                               ; $7423: $FA $00 $D2
    ldh  [$FFF1], a                               ; $7426: $E0 $F1
    ld   de, Data_004_73E2                        ; $7428: $11 $E2 $73
    call label_3BC0                               ; $742B: $CD $C0 $3B
    ld   a, [$D206]                               ; $742E: $FA $06 $D2
    cp   $08                                      ; $7431: $FE $08
    jr   c, jr_004_744B                           ; $7433: $38 $16

    ld   a, [$D204]                               ; $7435: $FA $04 $D2
    ldh  [wActiveEntityPosX], a                               ; $7438: $E0 $EE
    ld   a, [$D205]                               ; $743A: $FA $05 $D2
    add  $10                                      ; $743D: $C6 $10
    ldh  [wActiveEntityPosY], a                               ; $743F: $E0 $EC
    ld   a, $05                                   ; $7441: $3E $05
    ldh  [$FFF1], a                               ; $7443: $E0 $F1
    ld   de, Data_004_73E2                        ; $7445: $11 $E2 $73
    call label_3BC0                               ; $7448: $CD $C0 $3B

jr_004_744B:
    ldh  a, [hFrameCounter]                       ; $744B: $F0 $E7
    and  $01                                      ; $744D: $E6 $01
    jr   nz, jr_004_7477                          ; $744F: $20 $26

    ld   a, [$D204]                               ; $7451: $FA $04 $D2
    ldh  [wActiveEntityPosX], a                               ; $7454: $E0 $EE
    ld   a, [$D205]                               ; $7456: $FA $05 $D2
    add  $20                                      ; $7459: $C6 $20
    ldh  [wActiveEntityPosY], a                               ; $745B: $E0 $EC
    xor  a                                        ; $745D: $AF
    ldh  [$FFF1], a                               ; $745E: $E0 $F1
    ld   de, Data_004_73FA                        ; $7460: $11 $FA $73
    ld   a, [$C3C0]                               ; $7463: $FA $C0 $C3
    push af                                       ; $7466: $F5
    call label_3BC0                               ; $7467: $CD $C0 $3B
    pop  af                                       ; $746A: $F1
    ld   e, a                                     ; $746B: $5F
    ld   d, b                                     ; $746C: $50
    ld   hl, $C031                                ; $746D: $21 $31 $C0
    add  hl, de                                   ; $7470: $19
    inc  [hl]                                     ; $7471: $34
    inc  hl                                       ; $7472: $23
    inc  hl                                       ; $7473: $23
    inc  hl                                       ; $7474: $23
    inc  hl                                       ; $7475: $23
    dec  [hl]                                     ; $7476: $35

jr_004_7477:
    ld   hl, $C020                                ; $7477: $21 $20 $C0
    ld   a, $50                                   ; $747A: $3E $50
    ld   [hl+], a                                 ; $747C: $22
    ld   a, $28                                   ; $747D: $3E $28
    ld   [hl+], a                                 ; $747F: $22
    ld   a, $7A                                   ; $7480: $3E $7A
    ld   [hl+], a                                 ; $7482: $22
    ldh  a, [hIsGBC]                              ; $7483: $F0 $FE
    and  a                                        ; $7485: $A7
    jr   z, jr_004_748C                           ; $7486: $28 $04

    ld   a, $03                                   ; $7488: $3E $03
    jr   jr_004_748F                              ; $748A: $18 $03

jr_004_748C:
    ld   a, [$D202]                               ; $748C: $FA $02 $D2

jr_004_748F:
    ld   [hl+], a                                 ; $748F: $22
    ld   a, $60                                   ; $7490: $3E $60
    ld   [hl+], a                                 ; $7492: $22
    ld   a, $28                                   ; $7493: $3E $28
    ld   [hl+], a                                 ; $7495: $22
    ld   a, $3E                                   ; $7496: $3E $3E
    ld   [hl+], a                                 ; $7498: $22
    ld   a, [$D202]                               ; $7499: $FA $02 $D2
    ld   [hl+], a                                 ; $749C: $22
    ld   a, $50                                   ; $749D: $3E $50
    ld   [hl+], a                                 ; $749F: $22
    ld   a, $30                                   ; $74A0: $3E $30
    ld   [hl+], a                                 ; $74A2: $22
    ld   a, $7C                                   ; $74A3: $3E $7C
    ld   [hl+], a                                 ; $74A5: $22
    ldh  a, [hIsGBC]                              ; $74A6: $F0 $FE
    and  a                                        ; $74A8: $A7
    jr   z, jr_004_74AF                           ; $74A9: $28 $04

    ld   a, $03                                   ; $74AB: $3E $03
    jr   jr_004_74B2                              ; $74AD: $18 $03

jr_004_74AF:
    ld   a, [$D203]                               ; $74AF: $FA $03 $D2

jr_004_74B2:
    ld   [hl+], a                                 ; $74B2: $22
    ld   a, $60                                   ; $74B3: $3E $60
    ld   [hl+], a                                 ; $74B5: $22
    ld   a, $30                                   ; $74B6: $3E $30
    ld   [hl+], a                                 ; $74B8: $22
    ld   a, $3E                                   ; $74B9: $3E $3E
    ld   [hl+], a                                 ; $74BB: $22
    ld   a, [$D203]                               ; $74BC: $FA $03 $D2
    ld   [hl+], a                                 ; $74BF: $22
    ret                                           ; $74C0: $C9

    rst  $38                                      ; $74C1: $FF
    rst  $38                                      ; $74C2: $FF
    sbc  [hl]                                     ; $74C3: $9E
    db   $10                                      ; $74C4: $10
    and  [hl]                                     ; $74C5: $A6
    inc  d                                        ; $74C6: $14
    adc  [hl]                                     ; $74C7: $8E
    ld   d, $86                                   ; $74C8: $16 $86
    dec  d                                        ; $74CA: $15
    xor  b                                        ; $74CB: $A8
    inc  d                                        ; $74CC: $14
    sbc  d                                        ; $74CD: $9A
    rla                                           ; $74CE: $17
    sbc  h                                        ; $74CF: $9C
    rla                                           ; $74D0: $17
    ld   l, h                                     ; $74D1: $6C
    inc  bc                                       ; $74D2: $03
    ld   l, [hl]                                  ; $74D3: $6E
    inc  bc                                       ; $74D4: $03
    ld   l, [hl]                                  ; $74D5: $6E
    inc  hl                                       ; $74D6: $23
    ld   l, h                                     ; $74D7: $6C
    inc  hl                                       ; $74D8: $23

label_004_74D9:
    ldh  a, [$FFF1]                               ; $74D9: $F0 $F1
    cp   $06                                      ; $74DB: $FE $06
    jr   c, jr_004_74F1                           ; $74DD: $38 $12

    ld   de, $74B9                                ; $74DF: $11 $B9 $74
    cp   $07                                      ; $74E2: $FE $07
    jr   z, jr_004_74EF                           ; $74E4: $28 $09

    ldh  a, [hFrameCounter]                       ; $74E6: $F0 $E7
    and  $10                                      ; $74E8: $E6 $10
    jr   nz, jr_004_74EF                          ; $74EA: $20 $03

    ld   de, $74BD                                ; $74EC: $11 $BD $74

jr_004_74EF:
    jr   jr_004_750C                              ; $74EF: $18 $1B

jr_004_74F1:
    cp   $03                                      ; $74F1: $FE $03
    jr   nz, jr_004_74FE                          ; $74F3: $20 $09

    ld   a, [$DB4B]                               ; $74F5: $FA $4B $DB
    and  a                                        ; $74F8: $A7
    jp   nz, label_004_6D7A                       ; $74F9: $C2 $7A $6D

    jr   jr_004_7511                              ; $74FC: $18 $13

jr_004_74FE:
    cp   $00                                      ; $74FE: $FE $00
    jr   nz, jr_004_7511                          ; $7500: $20 $0F

    ld   a, [wTradeSequenceItem]                  ; $7502: $FA $0E $DB
    and  a                                        ; $7505: $A7
    jp   nz, label_004_6D7A                       ; $7506: $C2 $7A $6D

    ld   de, $74CD                                ; $7509: $11 $CD $74

jr_004_750C:
    call label_3BC0                               ; $750C: $CD $C0 $3B
    jr   jr_004_7517                              ; $750F: $18 $06

jr_004_7511:
    ld   de, $74C1                                ; $7511: $11 $C1 $74
    call label_3C77                               ; $7514: $CD $77 $3C

jr_004_7517:
    call func_004_7FA3                            ; $7517: $CD $A3 $7F
    ldh  a, [hActiveEntityWalking]                               ; $751A: $F0 $F0
    JP_TABLE                                      ; $751C: $C7
    add  hl, hl                                   ; $751D: $29
    ld   [hl], l                                  ; $751E: $75
    ld   e, h                                     ; $751F: $5C
    ld   [hl], l                                  ; $7520: $75
    ld   h, [hl]                                  ; $7521: $66
    ld   [hl], l                                  ; $7522: $75
    cp   h                                        ; $7523: $BC
    ld   [hl], l                                  ; $7524: $75
    add  c                                        ; $7525: $81
    db   $76                                      ; $7526: $76
    sbc  b                                        ; $7527: $98
    db   $76                                      ; $7528: $76
    call func_004_6DCA                            ; $7529: $CD $CA $6D
    ld   hl, $C380                                ; $752C: $21 $80 $C3
    add  hl, bc                                   ; $752F: $09
    ld   a, [hl]                                  ; $7530: $7E
    JP_TABLE                                      ; $7531: $C7
    inc  a                                        ; $7532: $3C
    ld   [hl], l                                  ; $7533: $75
    ld   b, h                                     ; $7534: $44
    ld   [hl], l                                  ; $7535: $75
    ld   c, h                                     ; $7536: $4C
    ld   [hl], l                                  ; $7537: $75
    ld   d, h                                     ; $7538: $54
    ld   [hl], l                                  ; $7539: $75
    ld   b, e                                     ; $753A: $43
    ld   [hl], l                                  ; $753B: $75
    ldh  a, [wActiveEntityPosX]                               ; $753C: $F0 $EE
    cp   $3A                                      ; $753E: $FE $3A
    jp   c, label_004_76AA                        ; $7540: $DA $AA $76

    ret                                           ; $7543: $C9

    ldh  a, [wActiveEntityPosY]                               ; $7544: $F0 $EC
    cp   $4E                                      ; $7546: $FE $4E
    jp   nc, label_004_76AA                       ; $7548: $D2 $AA $76

    ret                                           ; $754B: $C9

    ldh  a, [wActiveEntityPosX]                               ; $754C: $F0 $EE
    cp   $78                                      ; $754E: $FE $78
    jp   nc, label_004_76AA                       ; $7550: $D2 $AA $76

    ret                                           ; $7553: $C9

    ldh  a, [wActiveEntityPosY]                               ; $7554: $F0 $EC
    cp   $2E                                      ; $7556: $FE $2E
    jp   c, label_004_76AA                        ; $7558: $DA $AA $76

    ret                                           ; $755B: $C9

    call func_004_6E55                            ; $755C: $CD $55 $6E
    ld   a, e                                     ; $755F: $7B
    xor  $01                                      ; $7560: $EE $01
    ld   e, a                                     ; $7562: $5F
    jp   label_004_723B                           ; $7563: $C3 $3B $72

    ld   a, [wIsMarinFollowingLink]               ; $7566: $FA $73 $DB
    and  a                                        ; $7569: $A7
    jr   z, jr_004_7570                           ; $756A: $28 $04

    ld   a, $02                                   ; $756C: $3E $02
    ldh  [$FFA1], a                               ; $756E: $E0 $A1

jr_004_7570:
    call func_004_6E03                            ; $7570: $CD $03 $6E
    ld   hl, $C320                                ; $7573: $21 $20 $C3
    add  hl, bc                                   ; $7576: $09
    dec  [hl]                                     ; $7577: $35
    dec  [hl]                                     ; $7578: $35
    ld   hl, $C310                                ; $7579: $21 $10 $C3
    add  hl, bc                                   ; $757C: $09
    ld   a, [hl]                                  ; $757D: $7E
    and  $80                                      ; $757E: $E6 $80
    jr   z, jr_004_7598                           ; $7580: $28 $16

    xor  a                                        ; $7582: $AF
    ld   [hl], a                                  ; $7583: $77
    ld   hl, $C320                                ; $7584: $21 $20 $C3
    add  hl, bc                                   ; $7587: $09
    ld   a, [hl]                                  ; $7588: $7E
    sra  a                                        ; $7589: $CB $2F
    cpl                                           ; $758B: $2F
    ld   [hl], a                                  ; $758C: $77
    cp   $07                                      ; $758D: $FE $07
    jr   nc, jr_004_7594                          ; $758F: $30 $03

    ld   [hl], b                                  ; $7591: $70
    jr   jr_004_7598                              ; $7592: $18 $04

jr_004_7594:
    ld   a, JINGLE_BUMP                           ; $7594: $3E $09
    ldh  [hJingle], a                             ; $7596: $E0 $F2

jr_004_7598:
    ldh  a, [hFrameCounter]                       ; $7598: $F0 $E7
    and  $03                                      ; $759A: $E6 $03
    jr   nz, jr_004_75A9                          ; $759C: $20 $0B

    ld   hl, wEntitiesPosYTable                   ; $759E: $21 $10 $C2
    add  hl, bc                                   ; $75A1: $09
    ld   a, [hl]                                  ; $75A2: $7E
    cp   $56                                      ; $75A3: $FE $56
    jr   z, jr_004_75AA                           ; $75A5: $28 $03

    inc  a                                        ; $75A7: $3C
    ld   [hl], a                                  ; $75A8: $77

jr_004_75A9:
    ret                                           ; $75A9: $C9

jr_004_75AA:
    add  $0A                                      ; $75AA: $C6 $0A
    ld   [hl], a                                  ; $75AC: $77
    ld   hl, $C310                                ; $75AD: $21 $10 $C3
    add  hl, bc                                   ; $75B0: $09
    ld   [hl], $0A                                ; $75B1: $36 $0A
    jp   IncrementEntityWalkingAttr               ; $75B3: $C3 $12 $3B

    ld   b, h                                     ; $75B6: $44
    ld   b, e                                     ; $75B7: $43
    ld   b, d                                     ; $75B8: $42
    ld   b, c                                     ; $75B9: $41
    dec  a                                        ; $75BA: $3D
    ld   a, [hl+]                                 ; $75BB: $2A
    ld   a, [wIsMarinFollowingLink]               ; $75BC: $FA $73 $DB
    and  a                                        ; $75BF: $A7
    jr   z, jr_004_75C6                           ; $75C0: $28 $04

    ld   a, $02                                   ; $75C2: $3E $02
    ldh  [$FFA1], a                               ; $75C4: $E0 $A1

jr_004_75C6:
    call func_004_6E03                            ; $75C6: $CD $03 $6E
    ld   hl, $C320                                ; $75C9: $21 $20 $C3
    add  hl, bc                                   ; $75CC: $09
    dec  [hl]                                     ; $75CD: $35
    dec  [hl]                                     ; $75CE: $35
    ld   hl, $C310                                ; $75CF: $21 $10 $C3
    add  hl, bc                                   ; $75D2: $09
    ld   a, [hl]                                  ; $75D3: $7E
    and  $80                                      ; $75D4: $E6 $80
    jp   z, label_004_7680                        ; $75D6: $CA $80 $76

    xor  a                                        ; $75D9: $AF
    ld   [hl], a                                  ; $75DA: $77
    ld   hl, $C320                                ; $75DB: $21 $20 $C3
    add  hl, bc                                   ; $75DE: $09
    ld   a, [hl]                                  ; $75DF: $7E
    sra  a                                        ; $75E0: $CB $2F
    cpl                                           ; $75E2: $2F
    ld   [hl], a                                  ; $75E3: $77
    cp   $07                                      ; $75E4: $FE $07
    jr   nc, jr_004_75EA                          ; $75E6: $30 $02

    xor  a                                        ; $75E8: $AF
    ld   [hl], a                                  ; $75E9: $77

jr_004_75EA:
    ldh  a, [$FFF1]                               ; $75EA: $F0 $F1
    cp   $06                                      ; $75EC: $FE $06
    jr   c, jr_004_75F8                           ; $75EE: $38 $08

    ld   a, $F9                                   ; $75F0: $3E $F9
    call OpenDialog                               ; $75F2: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $75F5: $C3 $12 $3B

jr_004_75F8:
    ldh  a, [wActiveEntityPosX]                               ; $75F8: $F0 $EE
    ld   hl, hLinkPositionX                       ; $75FA: $21 $98 $FF
    sub  [hl]                                     ; $75FD: $96
    add  $07                                      ; $75FE: $C6 $07
    cp   $0E                                      ; $7600: $FE $0E
    ret  nc                                       ; $7602: $D0

    ldh  a, [wActiveEntityPosY]                               ; $7603: $F0 $EC
    ld   hl, hLinkPositionY                       ; $7605: $21 $99 $FF
    sub  [hl]                                     ; $7608: $96
    add  $05                                      ; $7609: $C6 $05
    cp   $0A                                      ; $760B: $FE $0A
    ret  nc                                       ; $760D: $D0

    ld   a, [$D210]                               ; $760E: $FA $10 $D2
    ld   e, a                                     ; $7611: $5F
    ld   d, b                                     ; $7612: $50
    ld   hl, $C480                                ; $7613: $21 $80 $C4
    add  hl, de                                   ; $7616: $19
    ld   a, [hl]                                  ; $7617: $7E
    and  a                                        ; $7618: $A7
    ret  nz                                       ; $7619: $C0

    ld   [hl], $18                                ; $761A: $36 $18
    ldh  a, [$FFF1]                               ; $761C: $F0 $F1
    cp   $00                                      ; $761E: $FE $00
    jr   nz, jr_004_762D                          ; $7620: $20 $0B

    ld   a, $01                                   ; $7622: $3E $01
    ld   [wTradeSequenceItem], a                  ; $7624: $EA $0E $DB
    call label_C0C                                ; $7627: $CD $0C $0C
    jp   label_004_6D7A                           ; $762A: $C3 $7A $6D

jr_004_762D:
    call func_004_6D7A                            ; $762D: $CD $7A $6D
    ld   hl, hSFX                                 ; $7630: $21 $F3 $FF
    ld   [hl], $01                                ; $7633: $36 $01
    ldh  a, [$FFF1]                               ; $7635: $F0 $F1
    ld   e, a                                     ; $7637: $5F
    ld   d, b                                     ; $7638: $50
    ld   hl, $75B6                                ; $7639: $21 $B6 $75
    add  hl, de                                   ; $763C: $19
    ld   a, [hl]                                  ; $763D: $7E
    call OpenDialog                               ; $763E: $CD $85 $23
    ldh  a, [$FFF1]                               ; $7641: $F0 $F1
    dec  a                                        ; $7643: $3D
    jr   nz, jr_004_7647                          ; $7644: $20 $01

    ret                                           ; $7646: $C9

jr_004_7647:
    dec  a                                        ; $7647: $3D
    jr   nz, jr_004_7653                          ; $7648: $20 $09

    ld   a, [wAddRupeeBufferHigh]                 ; $764A: $FA $90 $DB
    add  $1E                                      ; $764D: $C6 $1E
    ld   [wAddRupeeBufferHigh], a                 ; $764F: $EA $90 $DB
    ret                                           ; $7652: $C9

jr_004_7653:
    dec  a                                        ; $7653: $3D
    jr   nz, jr_004_7673                          ; $7654: $20 $1D

    ld   hl, wMaxMagicPowder                      ; $7656: $21 $76 $DB
    ld   a, [wMagicPowderCount]                   ; $7659: $FA $4C $DB
    cp   [hl]                                     ; $765C: $BE
    jr   nc, jr_004_7666                          ; $765D: $30 $07

    add  $10                                      ; $765F: $C6 $10
    daa                                           ; $7661: $27
    cp   [hl]                                     ; $7662: $BE
    jr   c, jr_004_7666                           ; $7663: $38 $01

    ld   a, [hl]                                  ; $7665: $7E

jr_004_7666:
    ld   [wMagicPowderCount], a                   ; $7666: $EA $4C $DB
    ld   d, $0C                                   ; $7669: $16 $0C
    call label_3E6B                               ; $766B: $CD $6B $3E
    ld   a, $0B                                   ; $766E: $3E $0B
    ldh  [$FFA5], a                               ; $7670: $E0 $A5
    ret                                           ; $7672: $C9

jr_004_7673:
    dec  a                                        ; $7673: $3D
    jr   nz, jr_004_767B                          ; $7674: $20 $05

    ld   d, $04                                   ; $7676: $16 $04
    jp   label_3E6B                               ; $7678: $C3 $6B $3E

jr_004_767B:
    ld   a, $FF                                   ; $767B: $3E $FF
    ld   [wSubstractRupeeBufferLow], a            ; $767D: $EA $93 $DB

label_004_7680:
    ret                                           ; $7680: $C9

    ld   a, $02                                   ; $7681: $3E $02
    ldh  [$FFA1], a                               ; $7683: $E0 $A1
    ld   [wC167], a                               ; $7685: $EA $67 $C1
    ld   a, [$C1AD]                               ; $7688: $FA $AD $C1
    and  a                                        ; $768B: $A7
    ret  nz                                       ; $768C: $C0

    ld   [$DB74], a                               ; $768D: $EA $74 $DB
    ld   a, $18                                   ; $7690: $3E $18
    ld   [wLoadPreviousMapCountdown], a                               ; $7692: $EA $BC $C1
    jp   IncrementEntityWalkingAttr               ; $7695: $C3 $12 $3B

    ld   a, $02                                   ; $7698: $3E $02
    ldh  [$FFA1], a                               ; $769A: $E0 $A1
    ld   [wC167], a                               ; $769C: $EA $67 $C1
    ret                                           ; $769F: $C9

Data_004_76A0::
    db   $FC, $00, $04, $00, $00, $00, $04, $00, $FC, $00

label_004_76AA:
    ld   hl, $C380                                ; $76AA: $21 $80 $C3
    add  hl, bc                                   ; $76AD: $09
    ld   a, [hl]                                  ; $76AE: $7E
    inc  a                                        ; $76AF: $3C
    and  $03                                      ; $76B0: $E6 $03
    ld   [hl], a                                  ; $76B2: $77

func_004_76B3:
    ld   e, a                                     ; $76B3: $5F
    ld   d, b                                     ; $76B4: $50
    ld   hl, Data_004_76A0                        ; $76B5: $21 $A0 $76
    add  hl, de                                   ; $76B8: $19
    ld   a, [hl]                                  ; $76B9: $7E
    ld   hl, $C240                                ; $76BA: $21 $40 $C2
    add  hl, bc                                   ; $76BD: $09
    ld   [hl], a                                  ; $76BE: $77
    ld   hl, $76A5                                ; $76BF: $21 $A5 $76
    add  hl, de                                   ; $76C2: $19
    ld   a, [hl]                                  ; $76C3: $7E
    ld   hl, $C250                                ; $76C4: $21 $50 $C2
    add  hl, bc                                   ; $76C7: $09
    ld   [hl], a                                  ; $76C8: $77
    ret                                           ; $76C9: $C9

    ret                                           ; $76CA: $C9

    ld   h, b                                     ; $76CB: $60
    inc  bc                                       ; $76CC: $03
    ld   h, d                                     ; $76CD: $62
    inc  bc                                       ; $76CE: $03
    ld   h, d                                     ; $76CF: $62
    inc  hl                                       ; $76D0: $23
    ld   h, b                                     ; $76D1: $60
    inc  hl                                       ; $76D2: $23
    ld   h, h                                     ; $76D3: $64
    inc  bc                                       ; $76D4: $03
    ld   h, [hl]                                  ; $76D5: $66
    inc  bc                                       ; $76D6: $03
    ld   h, [hl]                                  ; $76D7: $66
    inc  hl                                       ; $76D8: $23
    ld   h, h                                     ; $76D9: $64
    inc  hl                                       ; $76DA: $23
    ld   l, b                                     ; $76DB: $68
    inc  bc                                       ; $76DC: $03
    ld   l, d                                     ; $76DD: $6A
    inc  bc                                       ; $76DE: $03
    ld   l, h                                     ; $76DF: $6C
    inc  bc                                       ; $76E0: $03
    ld   l, [hl]                                  ; $76E1: $6E
    inc  bc                                       ; $76E2: $03
    ld   l, d                                     ; $76E3: $6A
    inc  hl                                       ; $76E4: $23
    ld   l, b                                     ; $76E5: $68
    inc  hl                                       ; $76E6: $23
    ld   l, [hl]                                  ; $76E7: $6E
    inc  hl                                       ; $76E8: $23
    ld   l, h                                     ; $76E9: $6C
    inc  hl                                       ; $76EA: $23
    ld   a, [$C50A]                               ; $76EB: $FA $0A $C5
    and  a                                        ; $76EE: $A7
    jr   nz, jr_004_76F9                          ; $76EF: $20 $08

    ld   a, $01                                   ; $76F1: $3E $01
    ld   [$C50A], a                               ; $76F3: $EA $0A $C5
    call func_004_788E                            ; $76F6: $CD $8E $78

jr_004_76F9:
    ld   a, [wSwordLevel]                         ; $76F9: $FA $4E $DB
    and  a                                        ; $76FC: $A7
    jr   z, jr_004_7705                           ; $76FD: $28 $06

    ldh  a, [hFrameCounter]                       ; $76FF: $F0 $E7
    and  $5F                                      ; $7701: $E6 $5F
    jr   nz, jr_004_770E                          ; $7703: $20 $09

jr_004_7705:
    call func_004_6E55                            ; $7705: $CD $55 $6E
    ld   a, e                                     ; $7708: $7B
    ld   hl, $C380                                ; $7709: $21 $80 $C3
    add  hl, bc                                   ; $770C: $09
    ld   [hl], a                                  ; $770D: $77

jr_004_770E:
    call func_004_7C98                            ; $770E: $CD $98 $7C
    ld   de, $76CB                                ; $7711: $11 $CB $76
    call label_3BC0                               ; $7714: $CD $C0 $3B
    call func_004_7B70                            ; $7717: $CD $70 $7B
    ldh  a, [hActiveEntityWalking]                               ; $771A: $F0 $F0
    cp   $04                                      ; $771C: $FE $04
    jr   nc, jr_004_7723                          ; $771E: $30 $03

    call func_004_7BE3                            ; $7720: $CD $E3 $7B

jr_004_7723:
    ldh  a, [hActiveEntityWalking]                               ; $7723: $F0 $F0
    JP_TABLE                                      ; $7725: $C7
    ld   hl, sp+$77                               ; $7726: $F8 $77
    xor  a                                        ; $7728: $AF
    ld   a, b                                     ; $7729: $78
    ld   e, l                                     ; $772A: $5D
    ld   a, c                                     ; $772B: $79
    db   $dd                                      ; $772C: $DD
    ld   a, d                                     ; $772D: $7A
    db   $ed                                      ; $772E: $ED
    ld   a, d                                     ; $772F: $7A
    ld   b, b                                     ; $7730: $40
    ld   a, e                                     ; $7731: $7B
    sbc  b                                        ; $7732: $98
    ld   h, e                                     ; $7733: $63
    ld   [bc], a                                  ; $7734: $02
    or   d                                        ; $7735: $B2
    or   b                                        ; $7736: $B0
    or   b                                        ; $7737: $B0
    sbc  b                                        ; $7738: $98
    and  h                                        ; $7739: $A4
    ld   bc, $7F7F                                ; $773A: $01 $7F $7F
    sbc  b                                        ; $773D: $98
    ld   h, a                                     ; $773E: $67
    ld   [bc], a                                  ; $773F: $02
    or   c                                        ; $7740: $B1
    or   b                                        ; $7741: $B0
    ld   a, a                                     ; $7742: $7F
    sbc  b                                        ; $7743: $98
    xor  b                                        ; $7744: $A8
    ld   bc, $B30A                                ; $7745: $01 $0A $B3
    sbc  b                                        ; $7748: $98
    ld   l, d                                     ; $7749: $6A
    ld   [bc], a                                  ; $774A: $02
    ld   a, a                                     ; $774B: $7F
    or   d                                        ; $774C: $B2
    or   b                                        ; $774D: $B0
    sbc  b                                        ; $774E: $98
    xor  h                                        ; $774F: $AC
    ld   bc, $B1BA                                ; $7750: $01 $BA $B1
    sbc  b                                        ; $7753: $98
    ld   l, [hl]                                  ; $7754: $6E
    ld   [bc], a                                  ; $7755: $02
    or   c                                        ; $7756: $B1
    or   b                                        ; $7757: $B0
    ld   a, a                                     ; $7758: $7F
    sbc  b                                        ; $7759: $98
    or   b                                        ; $775A: $B0
    ld   bc, $090A                                ; $775B: $01 $0A $09
    sbc  b                                        ; $775E: $98
    ld   h, e                                     ; $775F: $63
    ld   [bc], a                                  ; $7760: $02
    cp   c                                        ; $7761: $B9
    cp   b                                        ; $7762: $B8
    or   b                                        ; $7763: $B0
    sbc  b                                        ; $7764: $98
    and  h                                        ; $7765: $A4
    ld   bc, $7F7F                                ; $7766: $01 $7F $7F
    sbc  b                                        ; $7769: $98
    ld   h, e                                     ; $776A: $63
    ld   [bc], a                                  ; $776B: $02
    or   c                                        ; $776C: $B1
    or   b                                        ; $776D: $B0
    ld   a, a                                     ; $776E: $7F
    sbc  b                                        ; $776F: $98
    and  h                                        ; $7770: $A4
    ld   bc, $090A                                ; $7771: $01 $0A $09
    nop                                           ; $7774: $00
    sbc  b                                        ; $7775: $98
    ld   h, d                                     ; $7776: $62
    ld   b, e                                     ; $7777: $43
    ld   a, a                                     ; $7778: $7F
    sbc  b                                        ; $7779: $98
    add  e                                        ; $777A: $83
    ld   b, d                                     ; $777B: $42
    ld   a, a                                     ; $777C: $7F
    sbc  b                                        ; $777D: $98
    and  e                                        ; $777E: $A3
    ld   b, d                                     ; $777F: $42
    ld   a, a                                     ; $7780: $7F
    nop                                           ; $7781: $00
    nop                                           ; $7782: $00
    nop                                           ; $7783: $00
    nop                                           ; $7784: $00
    sbc  b                                        ; $7785: $98
    ld   h, [hl]                                  ; $7786: $66
    ld   b, e                                     ; $7787: $43
    ld   a, a                                     ; $7788: $7F
    sbc  b                                        ; $7789: $98
    add  a                                        ; $778A: $87
    ld   b, d                                     ; $778B: $42
    ld   a, a                                     ; $778C: $7F
    sbc  b                                        ; $778D: $98
    and  a                                        ; $778E: $A7
    ld   b, d                                     ; $778F: $42
    ld   a, a                                     ; $7790: $7F
    nop                                           ; $7791: $00
    nop                                           ; $7792: $00
    nop                                           ; $7793: $00
    nop                                           ; $7794: $00
    sbc  b                                        ; $7795: $98
    ld   l, d                                     ; $7796: $6A
    ld   b, e                                     ; $7797: $43
    ld   a, a                                     ; $7798: $7F
    sbc  b                                        ; $7799: $98
    adc  e                                        ; $779A: $8B
    ld   b, d                                     ; $779B: $42
    ld   a, a                                     ; $779C: $7F
    sbc  b                                        ; $779D: $98
    xor  e                                        ; $779E: $AB
    ld   b, d                                     ; $779F: $42
    ld   a, a                                     ; $77A0: $7F
    nop                                           ; $77A1: $00
    nop                                           ; $77A2: $00
    nop                                           ; $77A3: $00
    nop                                           ; $77A4: $00
    sbc  b                                        ; $77A5: $98
    ld   l, [hl]                                  ; $77A6: $6E
    ld   b, e                                     ; $77A7: $43
    ld   a, a                                     ; $77A8: $7F
    sbc  b                                        ; $77A9: $98
    adc  a                                        ; $77AA: $8F
    ld   b, d                                     ; $77AB: $42
    ld   a, a                                     ; $77AC: $7F
    sbc  b                                        ; $77AD: $98
    xor  a                                        ; $77AE: $AF
    ld   b, d                                     ; $77AF: $42
    ld   a, a                                     ; $77B0: $7F
    nop                                           ; $77B1: $00
    nop                                           ; $77B2: $00
    nop                                           ; $77B3: $00
    nop                                           ; $77B4: $00
    ld   bc, $0302                                ; $77B5: $01 $02 $03
    nop                                           ; $77B8: $00
    ld   bc, $0302                                ; $77B9: $01 $02 $03
    inc  b                                        ; $77BC: $04
    dec  b                                        ; $77BD: $05
    ld   [bc], a                                  ; $77BE: $02
    inc  bc                                       ; $77BF: $03
    inc  b                                        ; $77C0: $04
    ld   b, $02                                   ; $77C1: $06 $02
    inc  bc                                       ; $77C3: $03
    inc  b                                        ; $77C4: $04
    rlca                                          ; $77C5: $07
    ld   [$0A09], sp                              ; $77C6: $08 $09 $0A
    jr   nc, jr_004_77FC                          ; $77C9: $30 $31

    ld   [hl-], a                                 ; $77CB: $32
    inc  sp                                       ; $77CC: $33
    inc  l                                        ; $77CD: $2C
    dec  l                                        ; $77CE: $2D
    add  hl, sp                                   ; $77CF: $39
    nop                                           ; $77D0: $00
    nop                                           ; $77D1: $00
    nop                                           ; $77D2: $00
    nop                                           ; $77D3: $00
    ld   [bc], a                                  ; $77D4: $02
    nop                                           ; $77D5: $00
    nop                                           ; $77D6: $00
    nop                                           ; $77D7: $00
    add  hl, bc                                   ; $77D8: $09
    nop                                           ; $77D9: $00
    nop                                           ; $77DA: $00
    nop                                           ; $77DB: $00
    nop                                           ; $77DC: $00
    nop                                           ; $77DD: $00
    db   $10                                      ; $77DE: $10
    jr   nz, jr_004_77F1                          ; $77DF: $20 $10

    add  b                                        ; $77E1: $80
    stop                                          ; $77E2: $10 $00
    nop                                           ; $77E4: $00
    nop                                           ; $77E5: $00
    nop                                           ; $77E6: $00
    nop                                           ; $77E7: $00
    nop                                           ; $77E8: $00
    nop                                           ; $77E9: $00
    inc  bc                                       ; $77EA: $03
    nop                                           ; $77EB: $00
    nop                                           ; $77EC: $00
    nop                                           ; $77ED: $00
    nop                                           ; $77EE: $00
    ret  z                                        ; $77EF: $C8

    ld   a, [bc]                                  ; $77F0: $0A

jr_004_77F1:
    inc  d                                        ; $77F1: $14
    ld   a, [bc]                                  ; $77F2: $0A
    call nc, $000A                                ; $77F3: $D4 $0A $00
    nop                                           ; $77F6: $00
    nop                                           ; $77F7: $00
    ld   a, [$DB46]                               ; $77F8: $FA $46 $DB
    and  a                                        ; $77FB: $A7

jr_004_77FC:
    jr   z, jr_004_7839                           ; $77FC: $28 $3B

    ld   hl, wEntitiesPosYTable                   ; $77FE: $21 $10 $C2
    add  hl, bc                                   ; $7801: $09
    ld   [hl], $40                                ; $7802: $36 $40
    ld   hl, wEntity0PosX                         ; $7804: $21 $00 $C2
    add  hl, bc                                   ; $7807: $09
    ld   [hl], $50                                ; $7808: $36 $50
    ld   hl, $C380                                ; $780A: $21 $80 $C3
    add  hl, bc                                   ; $780D: $09
    ld   [hl], $03                                ; $780E: $36 $03
    ld   a, $02                                   ; $7810: $3E $02
    ldh  [$FFA1], a                               ; $7812: $E0 $A1
    ld   [wC167], a                               ; $7814: $EA $67 $C1
    ld   a, [wTransitionSequenceCounter]          ; $7817: $FA $6B $C1
    cp   $04                                      ; $781A: $FE $04
    jr   nz, jr_004_7838                          ; $781C: $20 $1A

    ldh  a, [hLinkPositionY]                      ; $781E: $F0 $99
    sub  $01                                      ; $7820: $D6 $01
    ldh  [hLinkPositionY], a                      ; $7822: $E0 $99
    cp   $74                                      ; $7824: $FE $74
    jr   nz, jr_004_7838                          ; $7826: $20 $10

    ld   a, $38                                   ; $7828: $3E $38
    call OpenDialog                               ; $782A: $CD $85 $23
    ld   hl, wEntitiesWalkingTable                ; $782D: $21 $90 $C2
    add  hl, bc                                   ; $7830: $09
    ld   [hl], $04                                ; $7831: $36 $04
    ld   a, $19                                   ; $7833: $3E $19
    ld   [wWorldMusicTrack], a                    ; $7835: $EA $68 $D3

jr_004_7838:
    ret                                           ; $7838: $C9

jr_004_7839:
    ld   e, $00                                   ; $7839: $1E $00
    ld   d, b                                     ; $783B: $50
    ld   a, [wHasInstrument2]                     ; $783C: $FA $66 $DB
    and  $02                                      ; $783F: $E6 $02
    jr   z, jr_004_7845                           ; $7841: $28 $02

    ld   e, $04                                   ; $7843: $1E $04

jr_004_7845:
    push bc                                       ; $7845: $C5
    ld   hl, wAButtonSlot                         ; $7846: $21 $00 $DB
    ld   c, $0B                                   ; $7849: $0E $0B

jr_004_784B:
    ld   a, [$DB7D]                               ; $784B: $FA $7D $DB
    cp   $0B                                      ; $784E: $FE $0B
    jr   z, jr_004_7857                           ; $7850: $28 $05

    ld   a, [hl+]                                 ; $7852: $2A
    cp   $0B                                      ; $7853: $FE $0B
    jr   nz, jr_004_7859                          ; $7855: $20 $02

jr_004_7857:
    ld   e, $08                                   ; $7857: $1E $08

jr_004_7859:
    dec  c                                        ; $7859: $0D
    ld   a, c                                     ; $785A: $79
    cp   $FF                                      ; $785B: $FE $FF
    jr   nz, jr_004_784B                          ; $785D: $20 $EC

    ld   hl, wAButtonSlot                         ; $785F: $21 $00 $DB
    ld   c, $0B                                   ; $7862: $0E $0B

jr_004_7864:
    ld   a, [$DB7D]                               ; $7864: $FA $7D $DB
    cp   $05                                      ; $7867: $FE $05
    jr   z, jr_004_7870                           ; $7869: $28 $05

    ld   a, [hl+]                                 ; $786B: $2A
    cp   $05                                      ; $786C: $FE $05
    jr   nz, jr_004_7872                          ; $786E: $20 $02

jr_004_7870:
    ld   e, $0C                                   ; $7870: $1E $0C

jr_004_7872:
    dec  c                                        ; $7872: $0D
    ld   a, c                                     ; $7873: $79
    cp   $FF                                      ; $7874: $FE $FF
    jr   nz, jr_004_7864                          ; $7876: $20 $EC

    ld   hl, $77B5                                ; $7878: $21 $B5 $77
    add  hl, de                                   ; $787B: $19
    ld   de, $C505                                ; $787C: $11 $05 $C5
    ld   c, $04                                   ; $787F: $0E $04

jr_004_7881:
    ld   a, [hl+]                                 ; $7881: $2A
    ld   [de], a                                  ; $7882: $12
    inc  de                                       ; $7883: $13
    dec  c                                        ; $7884: $0D
    jr   nz, jr_004_7881                          ; $7885: $20 $FA

    pop  bc                                       ; $7887: $C1
    call IncrementEntityWalkingAttr               ; $7888: $CD $12 $3B
    jp   label_004_788E                           ; $788B: $C3 $8E $78

func_004_788E:
label_004_788E:
    ld   de, wRequestDestinationHigh              ; $788E: $11 $01 $D6
    push bc                                       ; $7891: $C5
    ld   hl, $C505                                ; $7892: $21 $05 $C5
    ld   c, $04                                   ; $7895: $0E $04

jr_004_7897:
    ld   a, [hl+]                                 ; $7897: $2A
    and  a                                        ; $7898: $A7
    jr   z, jr_004_78A0                           ; $7899: $28 $05

    push hl                                       ; $789B: $E5
    call func_004_798B                            ; $789C: $CD $8B $79
    pop  hl                                       ; $789F: $E1

jr_004_78A0:
    dec  c                                        ; $78A0: $0D
    jr   nz, jr_004_7897                          ; $78A1: $20 $F4

    pop  bc                                       ; $78A3: $C1
    ret                                           ; $78A4: $C9

    nop                                           ; $78A5: $00
    nop                                           ; $78A6: $00
    nop                                           ; $78A7: $00
    ld   bc, $0201                                ; $78A8: $01 $01 $02
    ld   [bc], a                                  ; $78AB: $02
    inc  bc                                       ; $78AC: $03
    inc  bc                                       ; $78AD: $03
    inc  bc                                       ; $78AE: $03
    ld   a, [$C509]                               ; $78AF: $FA $09 $C5
    and  a                                        ; $78B2: $A7
    jr   z, jr_004_78D4                           ; $78B3: $28 $1F

    ld   hl, $C380                                ; $78B5: $21 $80 $C3
    add  hl, bc                                   ; $78B8: $09
    ld   a, [hl]                                  ; $78B9: $7E
    and  $01                                      ; $78BA: $E6 $01
    jr   z, jr_004_78D4                           ; $78BC: $28 $16

    ld   a, [wLinkMotionState]                    ; $78BE: $FA $1C $C1
    cp   $00                                      ; $78C1: $FE $00
    jr   nz, jr_004_78D4                          ; $78C3: $20 $0F

    ldh  a, [hLinkPositionY]                      ; $78C5: $F0 $99
    cp   $7B                                      ; $78C7: $FE $7B
    jr   c, jr_004_78D4                           ; $78C9: $38 $09

    sub  $02                                      ; $78CB: $D6 $02
    ldh  [hLinkPositionY], a                      ; $78CD: $E0 $99
    ld   a, $2F                                   ; $78CF: $3E $2F
    jp   OpenDialog                               ; $78D1: $C3 $85 $23

jr_004_78D4:
    ldh  a, [hLinkPositionY]                      ; $78D4: $F0 $99
    cp   $48                                      ; $78D6: $FE $48
    jr   nc, jr_004_7940                          ; $78D8: $30 $66

    ldh  a, [hLinkDirection]                      ; $78DA: $F0 $9E
    cp   $02                                      ; $78DC: $FE $02
    jr   nz, jr_004_7940                          ; $78DE: $20 $60

    ldh  a, [hFFCC]                               ; $78E0: $F0 $CC
    and  $30                                      ; $78E2: $E6 $30
    jr   z, jr_004_7940                           ; $78E4: $28 $5A

    ld   a, [$C509]                               ; $78E6: $FA $09 $C5
    and  a                                        ; $78E9: $A7
    jr   z, jr_004_7907                           ; $78EA: $28 $1B

    ldh  a, [hLinkPositionX]                      ; $78EC: $F0 $98
    add  $00                                      ; $78EE: $C6 $00
    swap a                                        ; $78F0: $CB $37
    and  $0F                                      ; $78F2: $E6 $0F
    ld   e, a                                     ; $78F4: $5F
    ld   d, b                                     ; $78F5: $50
    ld   hl, $78A5                                ; $78F6: $21 $A5 $78
    add  hl, de                                   ; $78F9: $19
    ld   a, [$C50B]                               ; $78FA: $FA $0B $C5
    cp   [hl]                                     ; $78FD: $BE
    jr   nz, jr_004_7940                          ; $78FE: $20 $40

    ld   a, JINGLE_VALIDATE                       ; $7900: $3E $13
    ldh  [hJingle], a                             ; $7902: $E0 $F2
    jp   label_004_796D                           ; $7904: $C3 $6D $79

jr_004_7907:
    ldh  a, [hLinkPositionX]                      ; $7907: $F0 $98
    add  $00                                      ; $7909: $C6 $00
    swap a                                        ; $790B: $CB $37
    and  $0F                                      ; $790D: $E6 $0F
    ld   e, a                                     ; $790F: $5F
    ld   d, b                                     ; $7910: $50
    ld   hl, $78A5                                ; $7911: $21 $A5 $78
    add  hl, de                                   ; $7914: $19
    ld   a, [hl]                                  ; $7915: $7E
    ld   [$C50B], a                               ; $7916: $EA $0B $C5
    ld   e, a                                     ; $7919: $5F
    ld   d, b                                     ; $791A: $50
    ld   hl, $C505                                ; $791B: $21 $05 $C5
    add  hl, de                                   ; $791E: $19
    ld   a, [hl]                                  ; $791F: $7E
    ld   [$C509], a                               ; $7920: $EA $09 $C5
    ld   [hl], b                                  ; $7923: $70
    and  a                                        ; $7924: $A7
    jr   z, jr_004_792B                           ; $7925: $28 $04

    ld   a, JINGLE_VALIDATE                       ; $7927: $3E $13
    ldh  [hJingle], a                             ; $7929: $E0 $F2

jr_004_792B:
    push bc                                       ; $792B: $C5
    ld   a, e                                     ; $792C: $7B
    swap a                                        ; $792D: $CB $37
    ld   e, a                                     ; $792F: $5F
    ld   hl, $7775                                ; $7930: $21 $75 $77
    add  hl, de                                   ; $7933: $19
    ld   de, wRequestDestinationHigh              ; $7934: $11 $01 $D6
    ld   c, $0D                                   ; $7937: $0E $0D

jr_004_7939:
    ld   a, [hl+]                                 ; $7939: $2A
    ld   [de], a                                  ; $793A: $12
    inc  de                                       ; $793B: $13
    dec  c                                        ; $793C: $0D
    jr   nz, jr_004_7939                          ; $793D: $20 $FA

    pop  bc                                       ; $793F: $C1

jr_004_7940:
    call func_004_7C06                            ; $7940: $CD $06 $7C
    ret  nc                                       ; $7943: $D0

    ld   a, [$C509]                               ; $7944: $FA $09 $C5
    and  a                                        ; $7947: $A7
    jr   z, jr_004_7958                           ; $7948: $28 $0E

    dec  a                                        ; $794A: $3D
    ld   e, a                                     ; $794B: $5F
    ld   d, b                                     ; $794C: $50
    ld   hl, $77C9                                ; $794D: $21 $C9 $77
    add  hl, de                                   ; $7950: $19
    ld   a, [hl]                                  ; $7951: $7E
    call OpenDialog                               ; $7952: $CD $85 $23
    jp   IncrementEntityWalkingAttr               ; $7955: $C3 $12 $3B

jr_004_7958:
    ld   a, $2E                                   ; $7958: $3E $2E
    jp   OpenDialog                               ; $795A: $C3 $85 $23

    ld   a, [wDialogState]                        ; $795D: $FA $9F $C1
    and  a                                        ; $7960: $A7
    ret  nz                                       ; $7961: $C0

    ld   a, [wC177]                               ; $7962: $FA $77 $C1
    cp   $00                                      ; $7965: $FE $00
    jr   z, jr_004_79AB                           ; $7967: $28 $42

    cp   $02                                      ; $7969: $FE $02
    jr   z, jr_004_7984                           ; $796B: $28 $17

label_004_796D:
    ld   a, [$C50B]                               ; $796D: $FA $0B $C5
    ld   e, a                                     ; $7970: $5F
    ld   d, b                                     ; $7971: $50
    ld   hl, $C505                                ; $7972: $21 $05 $C5
    add  hl, de                                   ; $7975: $19
    ld   a, [$C509]                               ; $7976: $FA $09 $C5
    ld   [hl], a                                  ; $7979: $77
    ld   de, wRequestDestinationHigh              ; $797A: $11 $01 $D6
    call func_004_798B                            ; $797D: $CD $8B $79
    xor  a                                        ; $7980: $AF
    ld   [$C509], a                               ; $7981: $EA $09 $C5

jr_004_7984:
    ld   hl, wEntitiesWalkingTable                ; $7984: $21 $90 $C2
    add  hl, bc                                   ; $7987: $09
    ld   [hl], $01                                ; $7988: $36 $01
    ret                                           ; $798A: $C9

func_004_798B:
    push de                                       ; $798B: $D5
    dec  a                                        ; $798C: $3D
    ld   d, a                                     ; $798D: $57
    sla  a                                        ; $798E: $CB $27
    ld   e, a                                     ; $7990: $5F
    sla  a                                        ; $7991: $CB $27
    sla  a                                        ; $7993: $CB $27
    add  e                                        ; $7995: $83
    add  d                                        ; $7996: $82
    ld   e, a                                     ; $7997: $5F
    ld   d, b                                     ; $7998: $50
    ld   hl, $7732                                ; $7999: $21 $32 $77
    add  hl, de                                   ; $799C: $19
    pop  de                                       ; $799D: $D1
    push bc                                       ; $799E: $C5
    ld   c, $0B                                   ; $799F: $0E $0B

jr_004_79A1:
    ld   a, [hl+]                                 ; $79A1: $2A
    ld   [de], a                                  ; $79A2: $12
    inc  de                                       ; $79A3: $13
    dec  c                                        ; $79A4: $0D
    jr   nz, jr_004_79A1                          ; $79A5: $20 $FA

    xor  a                                        ; $79A7: $AF
    ld   [de], a                                  ; $79A8: $12
    pop  bc                                       ; $79A9: $C1
    ret                                           ; $79AA: $C9

jr_004_79AB:
    ld   a, [$C509]                               ; $79AB: $FA $09 $C5
    ld   e, a                                     ; $79AE: $5F
    cp   $02                                      ; $79AF: $FE $02
    jr   nz, jr_004_79BB                          ; $79B1: $20 $08

    ld   a, [$C5A9]                               ; $79B3: $FA $A9 $C5
    and  a                                        ; $79B6: $A7
    jr   nz, jr_004_7A05                          ; $79B7: $20 $4C

    jr   jr_004_7A0C                              ; $79B9: $18 $51

jr_004_79BB:
    cp   $04                                      ; $79BB: $FE $04
    jr   nz, jr_004_79D9                          ; $79BD: $20 $1A

    ld   hl, wAButtonSlot                         ; $79BF: $21 $00 $DB
    ld   d, $0C                                   ; $79C2: $16 $0C

jr_004_79C4:
    ld   a, [hl+]                                 ; $79C4: $2A
    cp   $02                                      ; $79C5: $FE $02
    jr   z, jr_004_79CE                           ; $79C7: $28 $05

    dec  d                                        ; $79C9: $15
    jr   nz, jr_004_79C4                          ; $79CA: $20 $F8

    jr   jr_004_7A0C                              ; $79CC: $18 $3E

jr_004_79CE:
    ld   a, [wBombCount]                          ; $79CE: $FA $4D $DB
    ld   hl, wMaxBombs                            ; $79D1: $21 $77 $DB
    cp   [hl]                                     ; $79D4: $BE
    jr   nc, jr_004_7A05                          ; $79D5: $30 $2E

    jr   jr_004_7A0C                              ; $79D7: $18 $33

jr_004_79D9:
    cp   $06                                      ; $79D9: $FE $06
    jr   nz, jr_004_79F7                          ; $79DB: $20 $1A

    ld   hl, wAButtonSlot                         ; $79DD: $21 $00 $DB
    ld   d, $0C                                   ; $79E0: $16 $0C

jr_004_79E2:
    ld   a, [hl+]                                 ; $79E2: $2A
    cp   $05                                      ; $79E3: $FE $05
    jr   z, jr_004_79EC                           ; $79E5: $28 $05

    dec  d                                        ; $79E7: $15
    jr   nz, jr_004_79E2                          ; $79E8: $20 $F8

    jr   jr_004_7A0C                              ; $79EA: $18 $20

jr_004_79EC:
    ld   a, [wArrowCount]                         ; $79EC: $FA $45 $DB
    ld   hl, wMaxArrows                           ; $79EF: $21 $78 $DB
    cp   [hl]                                     ; $79F2: $BE
    jr   nc, jr_004_7A05                          ; $79F3: $30 $10

    jr   jr_004_7A0C                              ; $79F5: $18 $15

jr_004_79F7:
    cp   $03                                      ; $79F7: $FE $03
    jr   nz, jr_004_7A0C                          ; $79F9: $20 $11

    ld   hl, wAButtonSlot                         ; $79FB: $21 $00 $DB
    ld   d, $0C                                   ; $79FE: $16 $0C

jr_004_7A00:
    ld   a, [hl+]                                 ; $7A00: $2A
    cp   $04                                      ; $7A01: $FE $04
    jr   nz, jr_004_7A09                          ; $7A03: $20 $04

jr_004_7A05:
    ld   a, $29                                   ; $7A05: $3E $29
    jr   jr_004_7A24                              ; $7A07: $18 $1B

jr_004_7A09:
    dec  d                                        ; $7A09: $15
    jr   nz, jr_004_7A00                          ; $7A0A: $20 $F4

jr_004_7A0C:
    ld   d, b                                     ; $7A0C: $50
    ld   hl, $77D3                                ; $7A0D: $21 $D3 $77
    add  hl, de                                   ; $7A10: $19
    ld   a, [hl]                                  ; $7A11: $7E
    ld   hl, $77DC                                ; $7A12: $21 $DC $77
    add  hl, de                                   ; $7A15: $19
    ld   e, [hl]                                  ; $7A16: $5E
    ld   d, a                                     ; $7A17: $57
    ld   a, [wRupeeCountLow]                      ; $7A18: $FA $5E $DB
    sub  e                                        ; $7A1B: $93
    ld   a, [wRupeeCountHigh]                     ; $7A1C: $FA $5D $DB
    sbc  d                                        ; $7A1F: $9A
    jr   nc, jr_004_7A2E                          ; $7A20: $30 $0C

    ld   a, $34                                   ; $7A22: $3E $34

jr_004_7A24:
    call OpenDialog                               ; $7A24: $CD $85 $23
    ld   hl, wEntitiesWalkingTable                ; $7A27: $21 $90 $C2
    add  hl, bc                                   ; $7A2A: $09
    ld   [hl], $03                                ; $7A2B: $36 $03
    ret                                           ; $7A2D: $C9

jr_004_7A2E:
    ld   hl, $C509                                ; $7A2E: $21 $09 $C5
    ld   a, [hl]                                  ; $7A31: $7E
    push af                                       ; $7A32: $F5
    ld   [hl], $00                                ; $7A33: $36 $00
    ld   e, a                                     ; $7A35: $5F
    ld   d, b                                     ; $7A36: $50
    ld   hl, $77EE                                ; $7A37: $21 $EE $77
    add  hl, de                                   ; $7A3A: $19
    ld   a, [wSubstractRupeeBufferHigh]           ; $7A3B: $FA $92 $DB
    add  [hl]                                     ; $7A3E: $86
    ld   [wSubstractRupeeBufferHigh], a           ; $7A3F: $EA $92 $DB
    rl   a                                        ; $7A42: $CB $17
    ld   hl, $77E5                                ; $7A44: $21 $E5 $77
    add  hl, de                                   ; $7A47: $19
    rr   a                                        ; $7A48: $CB $1F
    ld   a, [wAddRupeeBufferLow]                  ; $7A4A: $FA $91 $DB
    adc  [hl]                                     ; $7A4D: $8E
    ld   [wAddRupeeBufferLow], a                  ; $7A4E: $EA $91 $DB
    ld   hl, wEntitiesWalkingTable                ; $7A51: $21 $90 $C2
    add  hl, bc                                   ; $7A54: $09
    ld   [hl], $01                                ; $7A55: $36 $01
    pop  af                                       ; $7A57: $F1
    push af                                       ; $7A58: $F5
    ld   a, $35                                   ; $7A59: $3E $35
    call OpenDialog                               ; $7A5B: $CD $85 $23
    pop  af                                       ; $7A5E: $F1

label_004_7A5F::
    dec  a                                        ; $7A5F: $3D
    JP_TABLE                                      ; $7A60: $C7
    xor  c                                        ; $7A61: $A9
    ld   a, d                                     ; $7A62: $7A
    jp   nc, $D87A                                ; $7A63: $D2 $7A $D8

    ld   a, d                                     ; $7A66: $7A
    xor  [hl]                                     ; $7A67: $AE
    ld   a, d                                     ; $7A68: $7A
    ld   [hl], e                                  ; $7A69: $73
    ld   a, d                                     ; $7A6A: $7A
    ld   a, [hl]                                  ; $7A6B: $7E
    ld   a, d                                     ; $7A6C: $7A
    adc  h                                        ; $7A6D: $8C
    ld   a, d                                     ; $7A6E: $7A
    sub  c                                        ; $7A6F: $91
    ld   a, d                                     ; $7A70: $7A
    sbc  a                                        ; $7A71: $9F
    ld   a, d                                     ; $7A72: $7A
    ld   d, $05                                   ; $7A73: $16 $05
    call label_3E6B                               ; $7A75: $CD $6B $3E
    ld   a, $20                                   ; $7A78: $3E $20
    ld   [wArrowCount], a                         ; $7A7A: $EA $45 $DB
    ret                                           ; $7A7D: $C9

    ld   a, [wArrowCount]                         ; $7A7E: $FA $45 $DB
    add  $0A                                      ; $7A81: $C6 $0A
    daa                                           ; $7A83: $27
    jr   nc, jr_004_7A88                          ; $7A84: $30 $02

    ld   a, $99                                   ; $7A86: $3E $99

jr_004_7A88:
    ld   [wArrowCount], a                         ; $7A88: $EA $45 $DB
    ret                                           ; $7A8B: $C9

    ld   d, $09                                   ; $7A8C: $16 $09
    jp   label_3E6B                               ; $7A8E: $C3 $6B $3E

    ld   a, [$DB47]                               ; $7A91: $FA $47 $DB
    add  $0A                                      ; $7A94: $C6 $0A
    daa                                           ; $7A96: $27
    jr   nc, jr_004_7A9B                          ; $7A97: $30 $02

    ld   a, $99                                   ; $7A99: $3E $99

jr_004_7A9B:
    ld   [$DB47], a                               ; $7A9B: $EA $47 $DB
    ret                                           ; $7A9E: $C9

    ld   a, [wHasMedicine]                        ; $7A9F: $FA $0D $DB
    add  $01                                      ; $7AA2: $C6 $01
    daa                                           ; $7AA4: $27
    ld   [wHasMedicine], a                        ; $7AA5: $EA $0D $DB
    ret                                           ; $7AA8: $C9

    ld   d, $0B                                   ; $7AA9: $16 $0B
    jp   label_3E6B                               ; $7AAB: $C3 $6B $3E

    ld   a, [wBombCount]                          ; $7AAE: $FA $4D $DB
    add  $0A                                      ; $7AB1: $C6 $0A
    daa                                           ; $7AB3: $27
    jr   nc, jr_004_7AB8                          ; $7AB4: $30 $02

    ld   a, $99                                   ; $7AB6: $3E $99

jr_004_7AB8:
    ld   [wBombCount], a                          ; $7AB8: $EA $4D $DB
    ld   d, $02                                   ; $7ABB: $16 $02
    jp   label_3E6B                               ; $7ABD: $C3 $6B $3E

    ld   a, [wArrowCount]                         ; $7AC0: $FA $45 $DB
    add  $0A                                      ; $7AC3: $C6 $0A
    daa                                           ; $7AC5: $27
    jr   nc, jr_004_7ACA                          ; $7AC6: $30 $02

    ld   a, $99                                   ; $7AC8: $3E $99

jr_004_7ACA:
    ld   [wArrowCount], a                         ; $7ACA: $EA $45 $DB
    ld   d, $0C                                   ; $7ACD: $16 $0C
    jp   label_3E6B                               ; $7ACF: $C3 $6B $3E

    ld   a, $18                                   ; $7AD2: $3E $18
    ld   [wSubstractRupeeBufferLow], a            ; $7AD4: $EA $93 $DB
    ret                                           ; $7AD7: $C9

    ld   d, $04                                   ; $7AD8: $16 $04
    jp   label_3E6B                               ; $7ADA: $C3 $6B $3E

    ld   a, [wDialogState]                        ; $7ADD: $FA $9F $C1
    and  a                                        ; $7AE0: $A7
    ret  nz                                       ; $7AE1: $C0

    jp   label_004_796D                           ; $7AE2: $C3 $6D $79

    inc  sp                                       ; $7AE5: $33
    ld   h, d                                     ; $7AE6: $62
    ld   a, [de]                                  ; $7AE7: $1A
    ld   bc, $0FFF                                ; $7AE8: $01 $FF $0F
    rst  $38                                      ; $7AEB: $FF
    ld   a, a                                     ; $7AEC: $7F
    ld   a, [wDialogState]                        ; $7AED: $FA $9F $C1
    and  a                                        ; $7AF0: $A7
    jr   nz, jr_004_7B3F                          ; $7AF1: $20 $4C

    ld   a, $CA                                   ; $7AF3: $3E $CA
    call label_3B86                               ; $7AF5: $CD $86 $3B
    ld   a, $26                                   ; $7AF8: $3E $26
    ldh  [hNextSFX], a                            ; $7AFA: $E0 $F4
    ldh  a, [hScratchA]                               ; $7AFC: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7AFE: $21 $00 $C2
    add  hl, de                                   ; $7B01: $19
    ld   [hl], a                                  ; $7B02: $77
    ldh  a, [hScratchB]                               ; $7B03: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7B05: $21 $10 $C2
    add  hl, de                                   ; $7B08: $19
    ld   [hl], a                                  ; $7B09: $77
    ld   hl, wEntitiesUnknownTableD               ; $7B0A: $21 $D0 $C2
    add  hl, de                                   ; $7B0D: $19
    ld   [hl], $01                                ; $7B0E: $36 $01
    ld   hl, wEntitiesFrameCounterTable           ; $7B10: $21 $E0 $C2
    add  hl, de                                   ; $7B13: $19
    ld   [hl], $C0                                ; $7B14: $36 $C0
    call IsEntityFrameCounterZero                 ; $7B16: $CD $05 $0C
    ld   [hl], $C0                                ; $7B19: $36 $C0
    call IncrementEntityWalkingAttr               ; $7B1B: $CD $12 $3B
    xor  a                                        ; $7B1E: $AF
    ld   [wHasMedicine], a                        ; $7B1F: $EA $0D $DB
    ld   a, $FF                                   ; $7B22: $3E $FF
    ld   [wDB94], a                               ; $7B24: $EA $94 $DB
    ldh  a, [hIsGBC]                              ; $7B27: $F0 $FE
    and  a                                        ; $7B29: $A7
    jr   z, jr_004_7B3F                           ; $7B2A: $28 $13

    ld   hl, $DC88                                ; $7B2C: $21 $88 $DC
    ld   de, $7AE5                                ; $7B2F: $11 $E5 $7A

jr_004_7B32:
    ld   a, [de]                                  ; $7B32: $1A
    ld   [hl+], a                                 ; $7B33: $22
    inc  de                                       ; $7B34: $13
    ld   a, l                                     ; $7B35: $7D
    and  $07                                      ; $7B36: $E6 $07
    jr   nz, jr_004_7B32                          ; $7B38: $20 $F8

    ld   a, $02                                   ; $7B3A: $3E $02
    ld   [$DDD1], a                               ; $7B3C: $EA $D1 $DD

jr_004_7B3F:
    ret                                           ; $7B3F: $C9

    ld   a, $02                                   ; $7B40: $3E $02
    ldh  [$FFA1], a                               ; $7B42: $E0 $A1
    call IsEntityFrameCounterZero                 ; $7B44: $CD $05 $0C
    ret  nz                                       ; $7B47: $C0

    ld   a, [wHealth]                               ; $7B48: $FA $5A $DB
    and  a                                        ; $7B4B: $A7
    ret  nz                                       ; $7B4C: $C0

    ld   [$DB46], a                               ; $7B4D: $EA $46 $DB
    ld   [$C50A], a                               ; $7B50: $EA $0A $C5
    jp   label_004_6D7A                           ; $7B53: $C3 $7A $6D

    dec  e                                        ; $7B56: $1D
    dec  a                                        ; $7B57: $3D
    ld   e, l                                     ; $7B58: $5D
    ld   a, l                                     ; $7B59: $7D
    sub  [hl]                                     ; $7B5A: $96
    rla                                           ; $7B5B: $17
    xor  b                                        ; $7B5C: $A8
    inc  d                                        ; $7B5D: $14
    add  [hl]                                     ; $7B5E: $86
    rla                                           ; $7B5F: $17
    add  b                                        ; $7B60: $80
    rla                                           ; $7B61: $17
    adc  b                                        ; $7B62: $88
    ld   d, $FF                                   ; $7B63: $16 $FF
    rst  $38                                      ; $7B65: $FF
    sub  b                                        ; $7B66: $90
    db   $10                                      ; $7B67: $10
    xor  [hl]                                     ; $7B68: $AE
    db   $10                                      ; $7B69: $10
    and  b                                        ; $7B6A: $A0
    db   $10                                      ; $7B6B: $10
    ld   a, [hl+]                                 ; $7B6C: $2A
    ld   b, c                                     ; $7B6D: $41
    ld   a, [hl+]                                 ; $7B6E: $2A
    ld   h, c                                     ; $7B6F: $61

func_004_7B70:
    ld   a, $04                                   ; $7B70: $3E $04

jr_004_7B72:
    ldh  [hFreeWarpDataAddress], a                               ; $7B72: $E0 $E6
    ld   e, a                                     ; $7B74: $5F
    ld   d, b                                     ; $7B75: $50
    ld   hl, $C504                                ; $7B76: $21 $04 $C5
    add  hl, de                                   ; $7B79: $19
    ld   a, [hl]                                  ; $7B7A: $7E
    and  a                                        ; $7B7B: $A7
    jr   z, jr_004_7BAC                           ; $7B7C: $28 $2E

    dec  a                                        ; $7B7E: $3D
    ldh  [$FFF1], a                               ; $7B7F: $E0 $F1
    ld   hl, $7B55                                ; $7B81: $21 $55 $7B
    ldh  a, [hFreeWarpDataAddress]                               ; $7B84: $F0 $E6
    ld   e, a                                     ; $7B86: $5F
    add  hl, de                                   ; $7B87: $19
    ld   a, [hl]                                  ; $7B88: $7E
    ldh  [wActiveEntityPosX], a                               ; $7B89: $E0 $EE
    ld   a, $32                                   ; $7B8B: $3E $32
    ldh  [wActiveEntityPosY], a                               ; $7B8D: $E0 $EC
    ldh  a, [$FFF1]                               ; $7B8F: $F0 $F1
    cp   $01                                      ; $7B91: $FE $01
    jr   nz, jr_004_7B9A                          ; $7B93: $20 $05

    ld   hl, wActiveEntityPosY                                ; $7B95: $21 $EC $FF
    ld   [hl], $2F                                ; $7B98: $36 $2F

jr_004_7B9A:
    cp   $05                                      ; $7B9A: $FE $05
    jr   nz, jr_004_7BA6                          ; $7B9C: $20 $08

    ld   de, $7B58                                ; $7B9E: $11 $58 $7B
    call label_3BC0                               ; $7BA1: $CD $C0 $3B
    jr   jr_004_7BAC                              ; $7BA4: $18 $06

jr_004_7BA6:
    ld   de, $7B5A                                ; $7BA6: $11 $5A $7B
    call label_3C77                               ; $7BA9: $CD $77 $3C

jr_004_7BAC:
    ldh  a, [hFreeWarpDataAddress]                               ; $7BAC: $F0 $E6
    dec  a                                        ; $7BAE: $3D
    jr   nz, jr_004_7B72                          ; $7BAF: $20 $C1

    call func_004_7BB7                            ; $7BB1: $CD $B7 $7B
    jp   label_3D8A                               ; $7BB4: $C3 $8A $3D

func_004_7BB7:
    ld   a, [$C509]                               ; $7BB7: $FA $09 $C5
    and  a                                        ; $7BBA: $A7
    ret  z                                        ; $7BBB: $C8

    dec  a                                        ; $7BBC: $3D
    ldh  [$FFF1], a                               ; $7BBD: $E0 $F1
    ld   a, $01                                   ; $7BBF: $3E $01
    ld   [wC15C], a                               ; $7BC1: $EA $5C $C1
    call label_CAF                                ; $7BC4: $CD $AF $0C
    ldh  a, [hLinkPositionX]                      ; $7BC7: $F0 $98
    ldh  [wActiveEntityPosX], a                               ; $7BC9: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $7BCB: $F0 $99
    sub  $0E                                      ; $7BCD: $D6 $0E
    ldh  [wActiveEntityPosY], a                               ; $7BCF: $E0 $EC
    ldh  a, [$FFF1]                               ; $7BD1: $F0 $F1
    cp   $05                                      ; $7BD3: $FE $05
    jr   nz, jr_004_7BDD                          ; $7BD5: $20 $06

    ld   de, $7B58                                ; $7BD7: $11 $58 $7B
    jp   label_3BC0                               ; $7BDA: $C3 $C0 $3B

jr_004_7BDD:
    ld   de, $7B5A                                ; $7BDD: $11 $5A $7B
    jp   label_3C77                               ; $7BE0: $C3 $77 $3C

func_004_7BE3:
    call label_3B5A                               ; $7BE3: $CD $5A $3B
    jr   nc, jr_004_7C05                          ; $7BE6: $30 $1D

    call CopyLinkFinalPositionToPosition          ; $7BE8: $CD $BE $0C
    call label_CB6                                ; $7BEB: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $7BEE: $FA $A6 $C1
    and  a                                        ; $7BF1: $A7
    jr   z, jr_004_7C05                           ; $7BF2: $28 $11

    ld   e, a                                     ; $7BF4: $5F
    ld   d, b                                     ; $7BF5: $50
    ld   hl, $C39F                                ; $7BF6: $21 $9F $C3
    add  hl, de                                   ; $7BF9: $19
    ld   a, [hl]                                  ; $7BFA: $7E
    cp   $03                                      ; $7BFB: $FE $03
    jr   nz, jr_004_7C05                          ; $7BFD: $20 $06

    ld   hl, $C28F                                ; $7BFF: $21 $8F $C2
    add  hl, de                                   ; $7C02: $19
    ld   [hl], $00                                ; $7C03: $36 $00

jr_004_7C05:
    ret                                           ; $7C05: $C9

func_004_7C06:
    ldh  a, [hLinkPositionX]                      ; $7C06: $F0 $98
    ld   hl, wActiveEntityPosX                                ; $7C08: $21 $EE $FF
    sub  [hl]                                     ; $7C0B: $96
    add  $20                                      ; $7C0C: $C6 $20
    cp   $30                                      ; $7C0E: $FE $30
    jr   nc, jr_004_7C49                          ; $7C10: $30 $37

    ldh  a, [hLinkPositionY]                      ; $7C12: $F0 $99
    ld   hl, $FFEF                                ; $7C14: $21 $EF $FF
    sub  [hl]                                     ; $7C17: $96
    add  $10                                      ; $7C18: $C6 $10
    cp   $20                                      ; $7C1A: $FE $20
    jr   nc, jr_004_7C49                          ; $7C1C: $30 $2B

    call func_004_6E55                            ; $7C1E: $CD $55 $6E
    ldh  a, [hLinkDirection]                      ; $7C21: $F0 $9E
    xor  $01                                      ; $7C23: $EE $01
    cp   e                                        ; $7C25: $BB
    jr   nz, jr_004_7C49                          ; $7C26: $20 $21

    ld   hl, $C1AD                                ; $7C28: $21 $AD $C1
    ld   [hl], $01                                ; $7C2B: $36 $01
    ld   a, [wDialogState]                        ; $7C2D: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7C30: $21 $4F $C1
    or   [hl]                                     ; $7C33: $B6
    ld   hl, $C134                                ; $7C34: $21 $34 $C1
    or   [hl]                                     ; $7C37: $B6
    jr   nz, jr_004_7C49                          ; $7C38: $20 $0F

    ld   a, [wWindowY]                            ; $7C3A: $FA $9A $DB
    cp   $80                                      ; $7C3D: $FE $80
    jr   nz, jr_004_7C49                          ; $7C3F: $20 $08

    ldh  a, [hFFCC]                               ; $7C41: $F0 $CC
    and  $10                                      ; $7C43: $E6 $10
    jr   z, jr_004_7C49                           ; $7C45: $28 $02

    scf                                           ; $7C47: $37
    ret                                           ; $7C48: $C9

jr_004_7C49:
    and  a                                        ; $7C49: $A7
    ret                                           ; $7C4A: $C9

func_004_7C4B:
    ld   a, [wDialogState]                        ; $7C4B: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7C4E: $21 $4F $C1
    or   [hl]                                     ; $7C51: $B6
    ld   hl, $C146                                ; $7C52: $21 $46 $C1
    or   [hl]                                     ; $7C55: $B6
    ld   hl, $C134                                ; $7C56: $21 $34 $C1
    or   [hl]                                     ; $7C59: $B6
    jr   nz, jr_004_7C92                          ; $7C5A: $20 $36

    ld   a, [wWindowY]                            ; $7C5C: $FA $9A $DB
    cp   $80                                      ; $7C5F: $FE $80
    jr   nz, jr_004_7C92                          ; $7C61: $20 $2F

    ldh  a, [hLinkPositionX]                      ; $7C63: $F0 $98
    ld   hl, wActiveEntityPosX                                ; $7C65: $21 $EE $FF
    sub  [hl]                                     ; $7C68: $96
    add  $10                                      ; $7C69: $C6 $10
    cp   $20                                      ; $7C6B: $FE $20
    jr   nc, jr_004_7C92                          ; $7C6D: $30 $23

    ldh  a, [hLinkPositionY]                      ; $7C6F: $F0 $99
    ld   hl, $FFEF                                ; $7C71: $21 $EF $FF
    sub  [hl]                                     ; $7C74: $96
    add  $14                                      ; $7C75: $C6 $14
    cp   $28                                      ; $7C77: $FE $28
    jr   nc, jr_004_7C92                          ; $7C79: $30 $17

    call func_004_6E55                            ; $7C7B: $CD $55 $6E
    ldh  a, [hLinkDirection]                      ; $7C7E: $F0 $9E
    xor  $01                                      ; $7C80: $EE $01
    cp   e                                        ; $7C82: $BB
    jr   nz, jr_004_7C92                          ; $7C83: $20 $0D

    ld   hl, $C1AD                                ; $7C85: $21 $AD $C1
    ld   [hl], $01                                ; $7C88: $36 $01
    ldh  a, [hFFCC]                               ; $7C8A: $F0 $CC
    and  $10                                      ; $7C8C: $E6 $10
    jr   z, jr_004_7C92                           ; $7C8E: $28 $02

    scf                                           ; $7C90: $37
    ret                                           ; $7C91: $C9

jr_004_7C92:
    and  a                                        ; $7C92: $A7
    ret                                           ; $7C93: $C9

    ld   b, $04                                   ; $7C94: $06 $04
    ld   [bc], a                                  ; $7C96: $02
    nop                                           ; $7C97: $00

func_004_7C98:
    ld   hl, $C380                                ; $7C98: $21 $80 $C3
    add  hl, bc                                   ; $7C9B: $09
    ld   e, [hl]                                  ; $7C9C: $5E
    ld   d, b                                     ; $7C9D: $50
    ld   hl, $7C94                                ; $7C9E: $21 $94 $7C
    add  hl, de                                   ; $7CA1: $19
    push hl                                       ; $7CA2: $E5
    ld   hl, $C3D0                                ; $7CA3: $21 $D0 $C3
    add  hl, bc                                   ; $7CA6: $09
    inc  [hl]                                     ; $7CA7: $34
    ld   a, [hl]                                  ; $7CA8: $7E
    rra                                           ; $7CA9: $1F
    rra                                           ; $7CAA: $1F
    rra                                           ; $7CAB: $1F
    pop  hl                                       ; $7CAC: $E1
    and  $01                                      ; $7CAD: $E6 $01
    or   [hl]                                     ; $7CAF: $B6
    jp   label_3B0C                               ; $7CB0: $C3 $0C $3B

    ld   hl, $C240                                ; $7CB3: $21 $40 $C2
    add  hl, bc                                   ; $7CB6: $09
    ld   a, [hl]                                  ; $7CB7: $7E
    push af                                       ; $7CB8: $F5
    ld   [hl], $01                                ; $7CB9: $36 $01
    ld   hl, $C250                                ; $7CBB: $21 $50 $C2
    add  hl, bc                                   ; $7CBE: $09
    ld   a, [hl]                                  ; $7CBF: $7E
    push af                                       ; $7CC0: $F5
    ld   [hl], $01                                ; $7CC1: $36 $01
    call label_3B23                               ; $7CC3: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable               ; $7CC6: $21 $A0 $C2
    add  hl, bc                                   ; $7CC9: $09
    ld   a, [hl]                                  ; $7CCA: $7E
    push af                                       ; $7CCB: $F5
    ld   hl, $C240                                ; $7CCC: $21 $40 $C2
    add  hl, bc                                   ; $7CCF: $09
    ld   [hl], $FF                                ; $7CD0: $36 $FF
    ld   hl, $C250                                ; $7CD2: $21 $50 $C2
    add  hl, bc                                   ; $7CD5: $09
    ld   [hl], $FF                                ; $7CD6: $36 $FF
    call label_3B23                               ; $7CD8: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable               ; $7CDB: $21 $A0 $C2
    add  hl, bc                                   ; $7CDE: $09
    pop  af                                       ; $7CDF: $F1
    or   [hl]                                     ; $7CE0: $B6
    ld   [hl], a                                  ; $7CE1: $77
    pop  af                                       ; $7CE2: $F1
    ld   hl, $C250                                ; $7CE3: $21 $50 $C2
    add  hl, bc                                   ; $7CE6: $09
    ld   [hl], a                                  ; $7CE7: $77
    pop  af                                       ; $7CE8: $F1
    ld   hl, $C240                                ; $7CE9: $21 $40 $C2
    add  hl, bc                                   ; $7CEC: $09
    ld   [hl], a                                  ; $7CED: $77
    ret                                           ; $7CEE: $C9

Data_004_7CEF::
    db   $7A, $20, $78, $20, $78, $00, $7A, $00, $7E, $00, $7E, $20, $70, $00, $72, $00
    db   $74, $00, $76, $00, $7C, $00, $7C, $20, $6A, $20, $68, $20, $68, $00, $6A, $00
    db   $6E, $00, $6E, $20, $60, $00, $62, $00, $64, $00, $66, $00, $6C, $00, $6C, $20
    db   $11, $EF, $7C

    ldh  a, [hMapId]                              ; $7D22: $F0 $F7
    cp   $07                                      ; $7D24: $FE $07
    jr   nz, jr_004_7D2B                          ; $7D26: $20 $03

    ld   de, $7D07                                ; $7D28: $11 $07 $7D

jr_004_7D2B:
    call label_C00                                ; $7D2B: $CD $00 $0C
    rla                                           ; $7D2E: $17
    rla                                           ; $7D2F: $17
    rla                                           ; $7D30: $17
    and  $10                                      ; $7D31: $E6 $10
    ldh  [$FFED], a                               ; $7D33: $E0 $ED
    call label_3BC0                               ; $7D35: $CD $C0 $3B
    call func_004_7FA3                            ; $7D38: $CD $A3 $7F
    ld   hl, $C410                                ; $7D3B: $21 $10 $C4
    add  hl, bc                                   ; $7D3E: $09
    ld   a, [hl]                                  ; $7D3F: $7E
    cp   $08                                      ; $7D40: $FE $08
    jr   nz, jr_004_7D51                          ; $7D42: $20 $0D

    ldh  a, [hActiveEntityWalking]                               ; $7D44: $F0 $F0
    and  a                                        ; $7D46: $A7
    jr   nz, jr_004_7D51                          ; $7D47: $20 $08

    call IncrementEntityWalkingAttr               ; $7D49: $CD $12 $3B
    call label_BFB                                ; $7D4C: $CD $FB $0B
    ld   [hl], $6F                                ; $7D4F: $36 $6F

jr_004_7D51:
    call func_004_6D80                            ; $7D51: $CD $80 $6D
    call func_004_6DCA                            ; $7D54: $CD $CA $6D
    call label_3B23                               ; $7D57: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                               ; $7D5A: $F0 $F0
    JP_TABLE                                      ; $7D5C: $C7
    ld   l, c                                     ; $7D5D: $69
    ld   a, l                                     ; $7D5E: $7D
    and  e                                        ; $7D5F: $A3
    ld   a, l                                     ; $7D60: $7D
    ld   [$00F8], sp                              ; $7D61: $08 $F8 $00
    nop                                           ; $7D64: $00
    nop                                           ; $7D65: $00
    nop                                           ; $7D66: $00
    ld   hl, sp+$00                               ; $7D67: $F8 $00
    call label_3B39                               ; $7D69: $CD $39 $3B
    call IsEntityFrameCounterZero                 ; $7D6C: $CD $05 $0C
    jr   nz, jr_004_7D91                          ; $7D6F: $20 $20

    call GetRandomByte                            ; $7D71: $CD $0D $28
    and  $1F                                      ; $7D74: $E6 $1F
    add  $30                                      ; $7D76: $C6 $30
    ld   [hl], a                                  ; $7D78: $77
    and  $03                                      ; $7D79: $E6 $03
    ld   e, a                                     ; $7D7B: $5F
    ld   d, b                                     ; $7D7C: $50
    ld   hl, $7D61                                ; $7D7D: $21 $61 $7D
    add  hl, de                                   ; $7D80: $19
    ld   a, [hl]                                  ; $7D81: $7E
    ld   hl, $C240                                ; $7D82: $21 $40 $C2
    add  hl, bc                                   ; $7D85: $09
    ld   [hl], a                                  ; $7D86: $77
    ld   hl, $7D65                                ; $7D87: $21 $65 $7D
    add  hl, de                                   ; $7D8A: $19
    ld   a, [hl]                                  ; $7D8B: $7E
    ld   hl, $C250                                ; $7D8C: $21 $50 $C2
    add  hl, bc                                   ; $7D8F: $09
    ld   [hl], a                                  ; $7D90: $77

jr_004_7D91:
    ldh  a, [hFrameCounter]                       ; $7D91: $F0 $E7
    rra                                           ; $7D93: $1F
    rra                                           ; $7D94: $1F
    rra                                           ; $7D95: $1F
    rra                                           ; $7D96: $1F
    and  $01                                      ; $7D97: $E6 $01
    jp   label_3B0C                               ; $7D99: $C3 $0C $3B

    dec  b                                        ; $7D9C: $05
    dec  b                                        ; $7D9D: $05
    inc  b                                        ; $7D9E: $04
    inc  bc                                       ; $7D9F: $03
    ld   [bc], a                                  ; $7DA0: $02
    ld   [bc], a                                  ; $7DA1: $02
    ld   [bc], a                                  ; $7DA2: $02
    ld   a, [$C14A]                               ; $7DA3: $FA $4A $C1
    and  a                                        ; $7DA6: $A7
    jr   z, jr_004_7DAE                           ; $7DA7: $28 $05

    call IncrementEntityWalkingAttr               ; $7DA9: $CD $12 $3B
    ld   [hl], b                                  ; $7DAC: $70
    ret                                           ; $7DAD: $C9

jr_004_7DAE:
    call label_3B70                               ; $7DAE: $CD $70 $3B
    call func_004_6E35                            ; $7DB1: $CD $35 $6E
    add  $12                                      ; $7DB4: $C6 $12
    cp   $24                                      ; $7DB6: $FE $24
    jr   nc, jr_004_7DC3                          ; $7DB8: $30 $09

    call func_004_6E45                            ; $7DBA: $CD $45 $6E
    add  $12                                      ; $7DBD: $C6 $12
    cp   $24                                      ; $7DBF: $FE $24
    jr   c, jr_004_7DD1                           ; $7DC1: $38 $0E

jr_004_7DC3:
    ldh  a, [hFrameCounter]                       ; $7DC3: $F0 $E7
    xor  c                                        ; $7DC5: $A9
    and  $03                                      ; $7DC6: $E6 $03
    jr   nz, jr_004_7DCF                          ; $7DC8: $20 $05

    ld   a, $0E                                   ; $7DCA: $3E $0E
    call label_3BAA                               ; $7DCC: $CD $AA $3B

jr_004_7DCF:
    jr   jr_004_7DD4                              ; $7DCF: $18 $03

jr_004_7DD1:
    call label_3D7F                               ; $7DD1: $CD $7F $3D

jr_004_7DD4:
    call label_BFB                                ; $7DD4: $CD $FB $0B
    jp   z, label_004_7EBA                        ; $7DD7: $CA $BA $7E

    cp   $18                                      ; $7DDA: $FE $18
    jr   nz, jr_004_7DE5                          ; $7DDC: $20 $07

    ld   [hl], $0A                                ; $7DDE: $36 $0A
    call label_C00                                ; $7DE0: $CD $00 $0C
    ld   [hl], $30                                ; $7DE3: $36 $30

jr_004_7DE5:
    rra                                           ; $7DE5: $1F
    rra                                           ; $7DE6: $1F
    rra                                           ; $7DE7: $1F
    rra                                           ; $7DE8: $1F
    and  $07                                      ; $7DE9: $E6 $07
    ld   e, a                                     ; $7DEB: $5F
    ld   d, b                                     ; $7DEC: $50
    ld   hl, $7D9C                                ; $7DED: $21 $9C $7D
    add  hl, de                                   ; $7DF0: $19
    ld   a, [hl]                                  ; $7DF1: $7E
    jp   label_3B0C                               ; $7DF2: $C3 $0C $3B

Data_004_7DF5::
    db   $7A, $22, $78, $22, $78, $02, $7A, $02, $6A, $22, $68, $22, $68, $02, $6A, $02
    db   $08, $F8, $00, $00

func_004_7E09:
label_004_7E09:
    nop                                           ; $7E09: $00
    nop                                           ; $7E0A: $00
    ld   hl, sp+$08                               ; $7E0B: $F8 $08
    ld   de, Data_004_7DF5                        ; $7E0D: $11 $F5 $7D
    ldh  a, [hMapId]                              ; $7E10: $F0 $F7
    cp   $07                                      ; $7E12: $FE $07
    jr   nz, jr_004_7E19                          ; $7E14: $20 $03

    ld   de, $7DFD                                ; $7E16: $11 $FD $7D

jr_004_7E19:
    call label_3BC0                               ; $7E19: $CD $C0 $3B
    call func_004_7FA3                            ; $7E1C: $CD $A3 $7F
    call func_004_6D80                            ; $7E1F: $CD $80 $6D
    call label_C00                                ; $7E22: $CD $00 $0C
    jr   nz, jr_004_7E2A                          ; $7E25: $20 $03

    call label_3B39                               ; $7E27: $CD $39 $3B

jr_004_7E2A:
    call func_004_6DCA                            ; $7E2A: $CD $CA $6D
    call label_3B23                               ; $7E2D: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                               ; $7E30: $F0 $F0
    JP_TABLE                                      ; $7E32: $C7
    add  hl, sp                                   ; $7E33: $39
    ld   a, [hl]                                  ; $7E34: $7E
    ld   c, h                                     ; $7E35: $4C
    ld   a, [hl]                                  ; $7E36: $7E
    add  e                                        ; $7E37: $83
    ld   a, [hl]                                  ; $7E38: $7E
    call IsEntityFrameCounterZero                 ; $7E39: $CD $05 $0C
    jr   nz, jr_004_7E41                          ; $7E3C: $20 $03

    call IncrementEntityWalkingAttr               ; $7E3E: $CD $12 $3B

jr_004_7E41:
    ldh  a, [hFrameCounter]                       ; $7E41: $F0 $E7
    rra                                           ; $7E43: $1F
    rra                                           ; $7E44: $1F
    rra                                           ; $7E45: $1F
    rra                                           ; $7E46: $1F
    and  $01                                      ; $7E47: $E6 $01
    jp   label_3B0C                               ; $7E49: $C3 $0C $3B

    call GetRandomByte                            ; $7E4C: $CD $0D $28
    and  $03                                      ; $7E4F: $E6 $03
    jr   z, jr_004_7E5A                           ; $7E51: $28 $07

    call GetRandomByte                            ; $7E53: $CD $0D $28
    and  $03                                      ; $7E56: $E6 $03
    jr   jr_004_7E5D                              ; $7E58: $18 $03

jr_004_7E5A:
    call func_004_6E55                            ; $7E5A: $CD $55 $6E

jr_004_7E5D:
    ld   e, a                                     ; $7E5D: $5F
    ld   d, b                                     ; $7E5E: $50
    ld   hl, $7E05                                ; $7E5F: $21 $05 $7E
    add  hl, de                                   ; $7E62: $19
    ld   a, [hl]                                  ; $7E63: $7E
    ld   hl, $C240                                ; $7E64: $21 $40 $C2
    add  hl, bc                                   ; $7E67: $09
    ld   [hl], a                                  ; $7E68: $77
    ld   hl, $7E09                                ; $7E69: $21 $09 $7E
    add  hl, de                                   ; $7E6C: $19
    ld   a, [hl]                                  ; $7E6D: $7E
    ld   hl, $C250                                ; $7E6E: $21 $50 $C2
    add  hl, bc                                   ; $7E71: $09
    ld   [hl], a                                  ; $7E72: $77
    call IsEntityFrameCounterZero                 ; $7E73: $CD $05 $0C
    call GetRandomByte                            ; $7E76: $CD $0D $28
    and  $0F                                      ; $7E79: $E6 $0F
    add  $20                                      ; $7E7B: $C6 $20
    ld   [hl], a                                  ; $7E7D: $77
    call IncrementEntityWalkingAttr               ; $7E7E: $CD $12 $3B
    ld   [hl], b                                  ; $7E81: $70
    ret                                           ; $7E82: $C9

    call label_3B7B                               ; $7E83: $CD $7B $3B
    call IsEntityFrameCounterZero                 ; $7E86: $CD $05 $0C
    jr   z, jr_004_7EBA                           ; $7E89: $28 $2F

    ld   hl, wEntitiesCollisionsTable               ; $7E8B: $21 $A0 $C2
    add  hl, bc                                   ; $7E8E: $09
    ld   a, [hl]                                  ; $7E8F: $7E
    and  $03                                      ; $7E90: $E6 $03
    jr   nz, jr_004_7E9B                          ; $7E92: $20 $07

    ld   a, [hl]                                  ; $7E94: $7E
    and  $0C                                      ; $7E95: $E6 $0C
    jr   nz, jr_004_7EA5                          ; $7E97: $20 $0C

    jr   jr_004_7EB1                              ; $7E99: $18 $16

jr_004_7E9B:
    ld   hl, $C240                                ; $7E9B: $21 $40 $C2
    add  hl, bc                                   ; $7E9E: $09
    ld   a, [hl]                                  ; $7E9F: $7E
    cpl                                           ; $7EA0: $2F
    inc  a                                        ; $7EA1: $3C
    ld   [hl], a                                  ; $7EA2: $77
    jr   jr_004_7EAD                              ; $7EA3: $18 $08

jr_004_7EA5:
    ld   hl, $C250                                ; $7EA5: $21 $50 $C2
    add  hl, bc                                   ; $7EA8: $09
    ld   a, [hl]                                  ; $7EA9: $7E
    cpl                                           ; $7EAA: $2F
    inc  a                                        ; $7EAB: $3C
    ld   [hl], a                                  ; $7EAC: $77

jr_004_7EAD:
    ld   a, JINGLE_BUMP                           ; $7EAD: $3E $09
    ldh  [hJingle], a                             ; $7EAF: $E0 $F2

jr_004_7EB1:
    ldh  a, [hFrameCounter]                       ; $7EB1: $F0 $E7
    rra                                           ; $7EB3: $1F
    rra                                           ; $7EB4: $1F
    and  $01                                      ; $7EB5: $E6 $01
    jp   label_3B0C                               ; $7EB7: $C3 $0C $3B

label_004_7EBA:
jr_004_7EBA:
    call func_004_7EC0                            ; $7EBA: $CD $C0 $7E
    jp   label_004_6D7A                           ; $7EBD: $C3 $7A $6D

func_004_7EC0:
    ld   a, $02                                   ; $7EC0: $3E $02
    call label_3B86                               ; $7EC2: $CD $86 $3B
    jr   c, jr_004_7EE4                           ; $7EC5: $38 $1D

    call label_C4B                                ; $7EC7: $CD $4B $0C
    ldh  a, [hScratchA]                               ; $7ECA: $F0 $D7
    ld   hl, wEntity0PosX                         ; $7ECC: $21 $00 $C2
    add  hl, de                                   ; $7ECF: $19
    ld   [hl], a                                  ; $7ED0: $77
    ldh  a, [hScratchB]                               ; $7ED1: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7ED3: $21 $10 $C2
    add  hl, de                                   ; $7ED6: $19
    ld   [hl], a                                  ; $7ED7: $77
    ld   hl, wEntitiesFrameCounterTable           ; $7ED8: $21 $E0 $C2
    add  hl, de                                   ; $7EDB: $19
    ld   [hl], $17                                ; $7EDC: $36 $17
    ld   hl, $C440                                ; $7EDE: $21 $40 $C4
    add  hl, de                                   ; $7EE1: $19
    ld   [hl], $01                                ; $7EE2: $36 $01

jr_004_7EE4:
    ret                                           ; $7EE4: $C9

    ld   d, [hl]                                  ; $7EE5: $56
    ld   [bc], a                                  ; $7EE6: $02
    ld   d, [hl]                                  ; $7EE7: $56
    ld   [hl+], a                                 ; $7EE8: $22
    ld   d, h                                     ; $7EE9: $54
    ld   [bc], a                                  ; $7EEA: $02
    ld   d, h                                     ; $7EEB: $54
    ld   [hl+], a                                 ; $7EEC: $22
    ld   d, d                                     ; $7EED: $52
    ld   [bc], a                                  ; $7EEE: $02
    ld   d, d                                     ; $7EEF: $52
    ld   [hl+], a                                 ; $7EF0: $22
    ld   d, b                                     ; $7EF1: $50
    ld   [bc], a                                  ; $7EF2: $02
    ld   d, b                                     ; $7EF3: $50
    ld   [hl+], a                                 ; $7EF4: $22
    ld   de, $7EE5                                ; $7EF5: $11 $E5 $7E
    call label_3BC0                               ; $7EF8: $CD $C0 $3B
    call func_004_7FA3                            ; $7EFB: $CD $A3 $7F
    call func_004_6D80                            ; $7EFE: $CD $80 $6D
    call func_004_6DCA                            ; $7F01: $CD $CA $6D
    call label_3B23                               ; $7F04: $CD $23 $3B
    ldh  a, [hActiveEntityWalking]                               ; $7F07: $F0 $F0
    and  $03                                      ; $7F09: $E6 $03
    JP_TABLE                                      ; $7F0B: $C7
    inc  d                                        ; $7F0C: $14
    ld   a, a                                     ; $7F0D: $7F
    daa                                           ; $7F0E: $27
    ld   a, a                                     ; $7F0F: $7F
    ld   c, c                                     ; $7F10: $49
    ld   a, a                                     ; $7F11: $7F
    ld   [hl], l                                  ; $7F12: $75
    ld   a, a                                     ; $7F13: $7F
    ld   a, $FF                                   ; $7F14: $3E $FF
    call label_3B0C                               ; $7F16: $CD $0C $3B
    call IsEntityFrameCounterZero                 ; $7F19: $CD $05 $0C
    ret  nz                                       ; $7F1C: $C0

    ld   [hl], $1F                                ; $7F1D: $36 $1F
    call IncrementEntityWalkingAttr               ; $7F1F: $CD $12 $3B
    jp   label_3D7F                               ; $7F22: $C3 $7F $3D

    ld   bc, $CD00                                ; $7F25: $01 $00 $CD
    dec  b                                        ; $7F28: $05
    inc  c                                        ; $7F29: $0C
    jr   nz, jr_004_7F37                          ; $7F2A: $20 $0B

    call GetRandomByte                            ; $7F2C: $CD $0D $28
    and  $3F                                      ; $7F2F: $E6 $3F
    add  $70                                      ; $7F31: $C6 $70
    ld   [hl], a                                  ; $7F33: $77
    jp   IncrementEntityWalkingAttr               ; $7F34: $C3 $12 $3B

jr_004_7F37:
    ld   hl, $7F25                                ; $7F37: $21 $25 $7F

label_004_7F3A:
    srl  a                                        ; $7F3A: $CB $3F
    srl  a                                        ; $7F3C: $CB $3F
    srl  a                                        ; $7F3E: $CB $3F
    srl  a                                        ; $7F40: $CB $3F
    ld   e, a                                     ; $7F42: $5F
    ld   d, b                                     ; $7F43: $50
    add  hl, de                                   ; $7F44: $19
    ld   a, [hl]                                  ; $7F45: $7E
    jp   label_3B0C                               ; $7F46: $C3 $0C $3B

    call label_3B39                               ; $7F49: $CD $39 $3B
    call IsEntityFrameCounterZero                 ; $7F4C: $CD $05 $0C
    jr   nz, jr_004_7F59                          ; $7F4F: $20 $08

    ld   [hl], $1F                                ; $7F51: $36 $1F
    call IncrementEntityWalkingAttr               ; $7F53: $CD $12 $3B
    jp   label_3D7F                               ; $7F56: $C3 $7F $3D

jr_004_7F59:
    ldh  a, [hFrameCounter]                       ; $7F59: $F0 $E7
    xor  c                                        ; $7F5B: $A9
    push af                                       ; $7F5C: $F5
    and  $0F                                      ; $7F5D: $E6 $0F
    jr   nz, jr_004_7F66                          ; $7F5F: $20 $05

    ld   a, $08                                   ; $7F61: $3E $08
    call label_3BAA                               ; $7F63: $CD $AA $3B

jr_004_7F66:
    pop  af                                       ; $7F66: $F1
    srl  a                                        ; $7F67: $CB $3F
    srl  a                                        ; $7F69: $CB $3F
    and  $01                                      ; $7F6B: $E6 $01
    call label_3B0C                               ; $7F6D: $CD $0C $3B
    inc  [hl]                                     ; $7F70: $34
    inc  [hl]                                     ; $7F71: $34
    ret                                           ; $7F72: $C9

    nop                                           ; $7F73: $00
    ld   bc, $05CD                                ; $7F74: $01 $CD $05
    inc  c                                        ; $7F77: $0C
    jr   nz, jr_004_7F8A                          ; $7F78: $20 $10

    call GetRandomByte                            ; $7F7A: $CD $0D $28
    and  $1F                                      ; $7F7D: $E6 $1F
    add  $30                                      ; $7F7F: $C6 $30
    ld   [hl], a                                  ; $7F81: $77
    call IncrementEntityWalkingAttr               ; $7F82: $CD $12 $3B
    ld   a, $08                                   ; $7F85: $3E $08
    jp   label_3BAA                               ; $7F87: $C3 $AA $3B

jr_004_7F8A:
    ld   hl, $7F73                                ; $7F8A: $21 $73 $7F
    jp   label_004_7F3A                           ; $7F8D: $C3 $3A $7F

func_004_7F90:
    ld   hl, $C240                                ; $7F90: $21 $40 $C2
    add  hl, bc                                   ; $7F93: $09
    ld   a, [hl]                                  ; $7F94: $7E
    rl   a                                        ; $7F95: $CB $17
    ld   a, $00                                   ; $7F97: $3E $00
    jr   c, jr_004_7F9D                           ; $7F99: $38 $02

    ld   a, $20                                   ; $7F9B: $3E $20

jr_004_7F9D:
    ld   hl, $FFED                                ; $7F9D: $21 $ED $FF
    xor  [hl]                                     ; $7FA0: $AE
    ld   [hl], a                                  ; $7FA1: $77
    ret                                           ; $7FA2: $C9

func_004_7FA3:
    ldh  a, [hActiveEntityType]                               ; $7FA3: $F0 $EA
    cp   $05                                      ; $7FA5: $FE $05
    jr   nz, jr_004_7FCE                          ; $7FA7: $20 $25

func_004_7FA9:
    ld   a, [wGameplayType]                       ; $7FA9: $FA $95 $DB
    cp   $07                                      ; $7FAC: $FE $07
    jr   z, jr_004_7FCE                           ; $7FAE: $28 $1E

    cp   $0B                                      ; $7FB0: $FE $0B
    jr   nz, jr_004_7FCE                          ; $7FB2: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7FB4: $FA $6B $C1
    cp   $04                                      ; $7FB7: $FE $04
    jr   nz, jr_004_7FCE                          ; $7FB9: $20 $13

    ld   hl, $C1A8                                ; $7FBB: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7FBE: $FA $9F $C1
    or   [hl]                                     ; $7FC1: $B6
    ld   hl, wInventoryAppearing                  ; $7FC2: $21 $4F $C1
    or   [hl]                                     ; $7FC5: $B6
    jr   nz, jr_004_7FCE                          ; $7FC6: $20 $06

    ld   a, [wRoomTransitionState]                ; $7FC8: $FA $24 $C1
    and  a                                        ; $7FCB: $A7
    jr   z, jr_004_7FCF                           ; $7FCC: $28 $01

jr_004_7FCE:
    pop  af                                       ; $7FCE: $F1

jr_004_7FCF:
    ret                                           ; $7FCF: $C9
