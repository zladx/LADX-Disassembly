; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Reset all values for a given entity to zero.
; Inputs:
;   bc   entity slot index
ResetEntity::
    call ClearEntitySpeed                         ; $4000: $CD $7F $3D
    ld   hl, wEntitiesUnknowTableK                ; $4003: $21 $30 $C3
    add  hl, bc                                   ; $4006: $09
    ld   [hl], b                                  ; $4007: $70
    ld   hl, wEntitiesUnknowTableN                ; $4008: $21 $60 $C2
    add  hl, bc                                   ; $400B: $09
    ld   [hl], b                                  ; $400C: $70
    ld   hl, wEntitiesUnknowTableO                ; $400D: $21 $70 $C2
    add  hl, bc                                   ; $4010: $09
    ld   [hl], b                                  ; $4011: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4012: $21 $20 $C3
    add  hl, bc                                   ; $4015: $09
    ld   [hl], b                                  ; $4016: $70
    ld   hl, wEntitiesStateTable                  ; $4017: $21 $90 $C2
    add  hl, bc                                   ; $401A: $09
    ld   [hl], b                                  ; $401B: $70
    ld   hl, wEntitiesCollisionsTable             ; $401C: $21 $A0 $C2
    add  hl, bc                                   ; $401F: $09
    ld   [hl], b                                  ; $4020: $70
    ld   hl, wEntitiesUnknownTableB               ; $4021: $21 $B0 $C2
    add  hl, bc                                   ; $4024: $09
    ld   [hl], b                                  ; $4025: $70
    ld   hl, wEntitiesUnknownTableC               ; $4026: $21 $C0 $C2
    add  hl, bc                                   ; $4029: $09
    ld   [hl], b                                  ; $402A: $70
    ld   hl, wEntitiesUnknownTableD               ; $402B: $21 $D0 $C2
    add  hl, bc                                   ; $402E: $09
    ld   [hl], b                                  ; $402F: $70
    ld   hl, wEntitiesUnknowTableP                ; $4030: $21 $40 $C4
    add  hl, bc                                   ; $4033: $09
    ld   [hl], b                                  ; $4034: $70
    ld   hl, wEntitiesUnknowTableR                ; $4035: $21 $90 $C3
    add  hl, bc                                   ; $4038: $09
    ld   [hl], b                                  ; $4039: $70
    ld   hl, wEntitiesTransitionCountdownTable    ; $403A: $21 $E0 $C2
    add  hl, bc                                   ; $403D: $09
    ld   [hl], b                                  ; $403E: $70
    ld   hl, wEntitiesUnknowTableF                ; $403F: $21 $F0 $C2
    add  hl, bc                                   ; $4042: $09
    ld   [hl], b                                  ; $4043: $70
    ld   hl, wEntitiesUnknowTableG                ; $4044: $21 $00 $C3
    add  hl, bc                                   ; $4047: $09
    ld   [hl], b                                  ; $4048: $70
    ld   hl, wEntitiesPosZTable                   ; $4049: $21 $10 $C3
    add  hl, bc                                   ; $404C: $09
    ld   [hl], b                                  ; $404D: $70
    ld   hl, wEntitiesUnknowTableQ                ; $404E: $21 $80 $C3
    add  hl, bc                                   ; $4051: $09
    ld   [hl], b                                  ; $4052: $70
    xor  a                                        ; $4053: $AF
    call SetEntitySpriteVariant                   ; $4054: $CD $0C $3B
    ld   hl, wEntitiesUnknowTableY                ; $4057: $21 $D0 $C3
    add  hl, bc                                   ; $405A: $09
    ld   [hl], b                                  ; $405B: $70
    ld   hl, wEntitiesHealthTable                 ; $405C: $21 $60 $C3
    add  hl, bc                                   ; $405F: $09
    ld   [hl], b                                  ; $4060: $70
    ld   hl, wEntitiesUnknowTableT                ; $4061: $21 $10 $C4
    add  hl, bc                                   ; $4064: $09
    ld   [hl], b                                  ; $4065: $70
    ld   hl, wEntitiesPosXSignTable                                ; $4066: $21 $20 $C2
    add  hl, bc                                   ; $4069: $09
    ld   [hl], b                                  ; $406A: $70
    ld   hl, wEntitiesPosYSignTable                                ; $406B: $21 $30 $C2
    add  hl, bc                                   ; $406E: $09
    ld   [hl], b                                  ; $406F: $70
    ld   hl, wEntitiesUnknowTableI                ; $4070: $21 $70 $C4
    add  hl, bc                                   ; $4073: $09
    ld   [hl], b                                  ; $4074: $70
    ld   hl, wEntitiesDropTimerTable                                ; $4075: $21 $50 $C4
    add  hl, bc                                   ; $4078: $09
    ld   [hl], b                                  ; $4079: $70
    ld   hl, wEntitiesUnknowTableV                ; $407A: $21 $80 $C4
    add  hl, bc                                   ; $407D: $09
    ld   [hl], b                                  ; $407E: $70
    ld   hl, wEntitiesUnknowTableW                ; $407F: $21 $90 $C4
    add  hl, bc                                   ; $4082: $09
    ld   [hl], b                                  ; $4083: $70
    ld   hl, wEntitiesUnknowTableU                ; $4084: $21 $20 $C4
    add  hl, bc                                   ; $4087: $09
    ld   [hl], b                                  ; $4088: $70
    ld   hl, wEntitiesUnknowTableX                ; $4089: $21 $E0 $C4
    add  hl, bc                                   ; $408C: $09
    ld   [hl], b                                  ; $408D: $70
    ld   hl, wEntitiesUnknowTableJ                ; $408E: $21 $F0 $C4
    add  hl, bc                                   ; $4091: $09
    ld   [hl], b                                  ; $4092: $70
    ld   hl, $C5D0                                ; $4093: $21 $D0 $C5
    add  hl, bc                                   ; $4096: $09
    ld   [hl], $FF                                ; $4097: $36 $FF
    ld   hl, wEntitiesUnknowTableZ                ; $4099: $21 $A0 $C4
    add  hl, bc                                   ; $409C: $09
    ld   [hl], b                                  ; $409D: $70
    ret                                           ; $409E: $C9

KanaletCastleGateSwitchEntityHandler::
    ldh  a, [hRoomStatus]                         ; $409F: $F0 $F8
    and  $20                                      ; $40A1: $E6 $20
    jp   nz, ClearEntityStatusAndReturn           ; $40A3: $C2 $31 $7C

    call func_015_7B0D                            ; $40A6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $40A9: $F0 $F0
    rst  $00                                      ; $40AB: $C7
    or   d                                        ; $40AC: $B2
    ld   b, b                                     ; $40AD: $40
    pop  bc                                       ; $40AE: $C1
    ld   b, b                                     ; $40AF: $40
    push de                                       ; $40B0: $D5
    ld   b, b                                     ; $40B1: $40
    ld   a, [$C1CB]                               ; $40B2: $FA $CB $C1
    and  a                                        ; $40B5: $A7
    jr   z, jr_015_40C0                           ; $40B6: $28 $08

    call IncrementEntityWalkingAttr               ; $40B8: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $40BB: $CD $05 $0C
    ld   [hl], $20                                ; $40BE: $36 $20

jr_015_40C0:
    ret                                           ; $40C0: $C9

    ld   a, $02                                   ; $40C1: $3E $02
    ldh  [$FFA1], a                               ; $40C3: $E0 $A1
    ld   [wC167], a                               ; $40C5: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $40C8: $CD $05 $0C
    ret  nz                                       ; $40CB: $C0

    ld   [hl], $30                                ; $40CC: $36 $30
    ld   a, $11                                   ; $40CE: $3E $11
    ldh  [hNoiseSfx], a                           ; $40D0: $E0 $F4
    jp   IncrementEntityWalkingAttr               ; $40D2: $C3 $12 $3B

    ld   a, $02                                   ; $40D5: $3E $02
    ldh  [$FFA1], a                               ; $40D7: $E0 $A1
    call GetEntityTransitionCountdown             ; $40D9: $CD $05 $0C
    jr   nz, jr_015_40EF                          ; $40DC: $20 $11

    ld   [wC167], a                               ; $40DE: $EA $67 $C1
    ld   [wScreenShakeHorizontal], a              ; $40E1: $EA $55 $C1
    ld   a, $39                                   ; $40E4: $3E $39
    call OpenDialog                               ; $40E6: $CD $85 $23
    call func_015_7CDB                            ; $40E9: $CD $DB $7C
    jp   ClearEntityStatusAndReturn               ; $40EC: $C3 $31 $7C

jr_015_40EF:
    ld   e, $01                                   ; $40EF: $1E $01
    and  $04                                      ; $40F1: $E6 $04
    jr   z, jr_015_40F7                           ; $40F3: $28 $02

    ld   e, $FF                                   ; $40F5: $1E $FF

jr_015_40F7:
    ld   a, e                                     ; $40F7: $7B
    ld   [wScreenShakeHorizontal], a              ; $40F8: $EA $55 $C1
    ret                                           ; $40FB: $C9

    ld   hl, sp+$17                               ; $40FC: $F8 $17
    db   $FA, $17                                 ; $40FE: $FA $17

MovingBlockLeftTopEntityHandler::
    db   $11                                      ; $4100
    db   $FC                                      ; $4101: $FC
    ld   b, b                                     ; $4102: $40
    call RenderAnimatedActiveEntity                               ; $4103: $CD $C0 $3B
    call func_015_7B0D                            ; $4106: $CD $0D $7B
    xor  a                                        ; $4109: $AF
    ldh  [hFFE8], a                               ; $410A: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $410C: $F0 $F0
    rst  $00                                      ; $410E: $C7
    inc  de                                       ; $410F: $13
    ld   b, c                                     ; $4110: $41
    daa                                           ; $4111: $27
    ld   b, c                                     ; $4112: $41
    ld   hl, wEntitiesPosYTable                         ; $4113: $21 $10 $C2
    add  hl, bc                                   ; $4116: $09
    ld   a, [hl]                                  ; $4117: $7E
    ld   hl, wEntitiesUnknownTableC               ; $4118: $21 $C0 $C2
    add  hl, bc                                   ; $411B: $09
    ld   [hl], a                                  ; $411C: $77
    add  $10                                      ; $411D: $C6 $10
    ld   hl, wEntitiesUnknownTableB               ; $411F: $21 $B0 $C2
    add  hl, bc                                   ; $4122: $09
    ld   [hl], a                                  ; $4123: $77
    jp   IncrementEntityWalkingAttr               ; $4124: $C3 $12 $3B

    ldh  a, [$FFBA]                               ; $4127: $F0 $BA
    cp   $02                                      ; $4129: $FE $02
    jr   z, jr_015_416F                           ; $412B: $28 $42

    and  a                                        ; $412D: $A7
    jr   z, jr_015_414D                           ; $412E: $28 $1D

    ld   hl, wEntitiesUnknowTableY                ; $4130: $21 $D0 $C3
    add  hl, bc                                   ; $4133: $09
    inc  [hl]                                     ; $4134: $34
    ld   a, [hl]                                  ; $4135: $7E
    cp   $0A                                      ; $4136: $FE $0A
    jr   c, jr_015_414C                           ; $4138: $38 $12

    ld   [hl], b                                  ; $413A: $70
    ld   a, $11                                   ; $413B: $3E $11
    ldh  [hNoiseSfx], a                           ; $413D: $E0 $F4
    ld   hl, wEntitiesUnknownTableC               ; $413F: $21 $C0 $C2
    add  hl, bc                                   ; $4142: $09
    ld   a, [hl]                                  ; $4143: $7E
    ld   hl, wEntitiesPosYTable                         ; $4144: $21 $10 $C2
    add  hl, bc                                   ; $4147: $09
    cp   [hl]                                     ; $4148: $BE
    jr   z, jr_015_414C                           ; $4149: $28 $01

    dec  [hl]                                     ; $414B: $35

jr_015_414C:
    ret                                           ; $414C: $C9

jr_015_414D:
    ld   hl, wEntitiesUnknownTableB               ; $414D: $21 $B0 $C2
    add  hl, bc                                   ; $4150: $09
    ld   a, [hl]                                  ; $4151: $7E
    ld   hl, wEntitiesPosYTable                         ; $4152: $21 $10 $C2
    add  hl, bc                                   ; $4155: $09
    cp   [hl]                                     ; $4156: $BE
    jr   z, jr_015_416B                           ; $4157: $28 $12

    ld   hl, wEntitiesUnknowTableY                ; $4159: $21 $D0 $C3
    add  hl, bc                                   ; $415C: $09
    ld   a, [hl]                                  ; $415D: $7E
    inc  [hl]                                     ; $415E: $34
    cp   $0D                                      ; $415F: $FE $0D
    jr   c, jr_015_416F                           ; $4161: $38 $0C

    ld   [hl], b                                  ; $4163: $70
    ld   hl, wEntitiesPosYTable                         ; $4164: $21 $10 $C2
    add  hl, bc                                   ; $4167: $09
    inc  [hl]                                     ; $4168: $34
    jr   jr_015_416F                              ; $4169: $18 $04

jr_015_416B:
    ld   hl, hFFE8                                ; $416B: $21 $E8 $FF
    inc  [hl]                                     ; $416E: $34

label_015_416F:
jr_015_416F:
    call label_3D8A                               ; $416F: $CD $8A $3D
    call func_015_7BDB                            ; $4172: $CD $DB $7B
    add  $0C                                      ; $4175: $C6 $0C
    cp   $18                                      ; $4177: $FE $18
    jr   nc, jr_015_41C9                          ; $4179: $30 $4E

    call func_015_7BEB                            ; $417B: $CD $EB $7B
    add  $10                                      ; $417E: $C6 $10
    cp   $1C                                      ; $4180: $FE $1C
    jr   nc, jr_015_41C9                          ; $4182: $30 $45

    call ResetPegasusBoots                                ; $4184: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $4187: $CD $8E $17
    call func_015_7C0A                            ; $418A: $CD $0A $7C
    ld   a, e                                     ; $418D: $7B
    cp   $00                                      ; $418E: $FE $00
    jr   nz, jr_015_4199                          ; $4190: $20 $07

    ldh  a, [wActiveEntityPosX]                   ; $4192: $F0 $EE
    add  $0C                                      ; $4194: $C6 $0C
    ldh  [hLinkPositionX], a                      ; $4196: $E0 $98
    ret                                           ; $4198: $C9

jr_015_4199:
    cp   $01                                      ; $4199: $FE $01
    jr   nz, jr_015_41A4                          ; $419B: $20 $07

    ldh  a, [wActiveEntityPosX]                   ; $419D: $F0 $EE
    add  $F4                                      ; $419F: $C6 $F4
    ldh  [hLinkPositionX], a                      ; $41A1: $E0 $98
    ret                                           ; $41A3: $C9

jr_015_41A4:
    cp   $02                                      ; $41A4: $FE $02
    jr   nz, jr_015_41B9                          ; $41A6: $20 $11

    ldh  a, [hActiveEntityType]                   ; $41A8: $F0 $EB
    cp   $47                                      ; $41AA: $FE $47
    jr   nz, jr_015_41B2                          ; $41AC: $20 $04

    ldh  a, [hFFE8]                               ; $41AE: $F0 $E8
    and  a                                        ; $41B0: $A7
    ret  nz                                       ; $41B1: $C0

jr_015_41B2:
    ldh  a, [wActiveEntityPosY]                   ; $41B2: $F0 $EC
    add  $F0                                      ; $41B4: $C6 $F0
    ldh  [hLinkPositionY], a                      ; $41B6: $E0 $99
    ret                                           ; $41B8: $C9

jr_015_41B9:
    ldh  a, [hActiveEntityType]                   ; $41B9: $F0 $EB
    cp   $46                                      ; $41BB: $FE $46
    jr   nz, jr_015_41C3                          ; $41BD: $20 $04

    ldh  a, [hFFE8]                               ; $41BF: $F0 $E8
    and  a                                        ; $41C1: $A7
    ret  nz                                       ; $41C2: $C0

jr_015_41C3:
    ldh  a, [wActiveEntityPosY]                   ; $41C3: $F0 $EC
    add  $0C                                      ; $41C5: $C6 $0C
    ldh  [hLinkPositionY], a                      ; $41C7: $E0 $99

jr_015_41C9:
    ret                                           ; $41C9: $C9

MovingBlockLeftBottomEntityHandler::
    ld   de, $40FC                                ; $41CA: $11 $FC $40
    call RenderAnimatedActiveEntity                               ; $41CD: $CD $C0 $3B
    call func_015_7B0D                            ; $41D0: $CD $0D $7B
    xor  a                                        ; $41D3: $AF
    ldh  [hFFE8], a                               ; $41D4: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $41D6: $F0 $F0
    rst  $00                                      ; $41D8: $C7
    db   $DD                                      ; $41D9: $DD
    ld   b, c                                     ; $41DA: $41
    pop  af                                       ; $41DB: $F1
    ld   b, c                                     ; $41DC: $41
    ld   hl, wEntitiesPosYTable                         ; $41DD: $21 $10 $C2
    add  hl, bc                                   ; $41E0: $09
    ld   a, [hl]                                  ; $41E1: $7E
    ld   hl, wEntitiesUnknownTableC               ; $41E2: $21 $C0 $C2
    add  hl, bc                                   ; $41E5: $09
    ld   [hl], a                                  ; $41E6: $77
    sub  $10                                      ; $41E7: $D6 $10
    ld   hl, wEntitiesUnknownTableB               ; $41E9: $21 $B0 $C2
    add  hl, bc                                   ; $41EC: $09
    ld   [hl], a                                  ; $41ED: $77
    jp   IncrementEntityWalkingAttr               ; $41EE: $C3 $12 $3B

    ldh  a, [$FFBA]                               ; $41F1: $F0 $BA
    cp   $02                                      ; $41F3: $FE $02
    jr   z, jr_015_4239                           ; $41F5: $28 $42

    and  a                                        ; $41F7: $A7
    jr   z, jr_015_4217                           ; $41F8: $28 $1D

    ld   hl, wEntitiesUnknowTableY                ; $41FA: $21 $D0 $C3
    add  hl, bc                                   ; $41FD: $09
    inc  [hl]                                     ; $41FE: $34
    ld   a, [hl]                                  ; $41FF: $7E
    cp   $0A                                      ; $4200: $FE $0A
    jr   c, jr_015_4216                           ; $4202: $38 $12

    ld   [hl], b                                  ; $4204: $70
    ld   a, $11                                   ; $4205: $3E $11
    ldh  [hNoiseSfx], a                           ; $4207: $E0 $F4
    ld   hl, wEntitiesUnknownTableC               ; $4209: $21 $C0 $C2
    add  hl, bc                                   ; $420C: $09
    ld   a, [hl]                                  ; $420D: $7E
    ld   hl, wEntitiesPosYTable                         ; $420E: $21 $10 $C2
    add  hl, bc                                   ; $4211: $09
    cp   [hl]                                     ; $4212: $BE
    jr   z, jr_015_4216                           ; $4213: $28 $01

    inc  [hl]                                     ; $4215: $34

jr_015_4216:
    ret                                           ; $4216: $C9

jr_015_4217:
    ld   hl, wEntitiesUnknownTableB               ; $4217: $21 $B0 $C2
    add  hl, bc                                   ; $421A: $09
    ld   a, [hl]                                  ; $421B: $7E
    ld   hl, wEntitiesPosYTable                         ; $421C: $21 $10 $C2
    add  hl, bc                                   ; $421F: $09
    cp   [hl]                                     ; $4220: $BE
    jr   z, jr_015_4235                           ; $4221: $28 $12

    ld   hl, wEntitiesUnknowTableY                ; $4223: $21 $D0 $C3
    add  hl, bc                                   ; $4226: $09
    ld   a, [hl]                                  ; $4227: $7E
    inc  [hl]                                     ; $4228: $34
    cp   $0D                                      ; $4229: $FE $0D
    jr   c, jr_015_4239                           ; $422B: $38 $0C

    ld   [hl], b                                  ; $422D: $70
    ld   hl, wEntitiesPosYTable                         ; $422E: $21 $10 $C2
    add  hl, bc                                   ; $4231: $09
    dec  [hl]                                     ; $4232: $35
    jr   jr_015_4239                              ; $4233: $18 $04

jr_015_4235:
    ld   hl, hFFE8                                ; $4235: $21 $E8 $FF
    inc  [hl]                                     ; $4238: $34

jr_015_4239:
    jp   label_015_416F                           ; $4239: $C3 $6F $41

MovingBlockBottomLeftEntityHandler::
    ld   de, $40FC                                ; $423C: $11 $FC $40
    call RenderAnimatedActiveEntity                               ; $423F: $CD $C0 $3B
    call func_015_7B0D                            ; $4242: $CD $0D $7B
    xor  a                                        ; $4245: $AF
    ldh  [hFFE8], a                               ; $4246: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $4248: $F0 $F0
    rst  $00                                      ; $424A: $C7
    ld   c, a                                     ; $424B: $4F
    ld   b, d                                     ; $424C: $42
    ld   h, e                                     ; $424D: $63
    ld   b, d                                     ; $424E: $42
    ld   hl, wEntitiesPosXTable                         ; $424F: $21 $00 $C2
    add  hl, bc                                   ; $4252: $09
    ld   a, [hl]                                  ; $4253: $7E
    ld   hl, wEntitiesUnknownTableC               ; $4254: $21 $C0 $C2
    add  hl, bc                                   ; $4257: $09
    ld   [hl], a                                  ; $4258: $77
    add  $10                                      ; $4259: $C6 $10
    ld   hl, wEntitiesUnknownTableB               ; $425B: $21 $B0 $C2
    add  hl, bc                                   ; $425E: $09
    ld   [hl], a                                  ; $425F: $77
    jp   IncrementEntityWalkingAttr               ; $4260: $C3 $12 $3B

    ldh  a, [$FFBA]                               ; $4263: $F0 $BA
    cp   $02                                      ; $4265: $FE $02
    jr   z, jr_015_42AB                           ; $4267: $28 $42

    and  a                                        ; $4269: $A7
    jr   z, jr_015_4289                           ; $426A: $28 $1D

    ld   hl, wEntitiesUnknowTableY                ; $426C: $21 $D0 $C3
    add  hl, bc                                   ; $426F: $09
    inc  [hl]                                     ; $4270: $34
    ld   a, [hl]                                  ; $4271: $7E
    cp   $0A                                      ; $4272: $FE $0A
    jr   c, jr_015_4288                           ; $4274: $38 $12

    ld   [hl], b                                  ; $4276: $70
    ld   a, $11                                   ; $4277: $3E $11
    ldh  [hNoiseSfx], a                           ; $4279: $E0 $F4
    ld   hl, wEntitiesUnknownTableC               ; $427B: $21 $C0 $C2
    add  hl, bc                                   ; $427E: $09
    ld   a, [hl]                                  ; $427F: $7E
    ld   hl, wEntitiesPosXTable                         ; $4280: $21 $00 $C2
    add  hl, bc                                   ; $4283: $09
    cp   [hl]                                     ; $4284: $BE
    jr   z, jr_015_4288                           ; $4285: $28 $01

    dec  [hl]                                     ; $4287: $35

jr_015_4288:
    ret                                           ; $4288: $C9

jr_015_4289:
    ld   hl, wEntitiesUnknownTableB               ; $4289: $21 $B0 $C2
    add  hl, bc                                   ; $428C: $09
    ld   a, [hl]                                  ; $428D: $7E
    ld   hl, wEntitiesPosXTable                         ; $428E: $21 $00 $C2
    add  hl, bc                                   ; $4291: $09
    cp   [hl]                                     ; $4292: $BE
    jr   z, jr_015_42A7                           ; $4293: $28 $12

    ld   hl, wEntitiesUnknowTableY                ; $4295: $21 $D0 $C3
    add  hl, bc                                   ; $4298: $09
    ld   a, [hl]                                  ; $4299: $7E
    inc  [hl]                                     ; $429A: $34
    cp   $0D                                      ; $429B: $FE $0D
    jr   c, jr_015_42AB                           ; $429D: $38 $0C

    ld   [hl], b                                  ; $429F: $70
    ld   hl, wEntitiesPosXTable                         ; $42A0: $21 $00 $C2
    add  hl, bc                                   ; $42A3: $09
    inc  [hl]                                     ; $42A4: $34
    jr   jr_015_42AB                              ; $42A5: $18 $04

jr_015_42A7:
    ld   hl, hFFE8                                ; $42A7: $21 $E8 $FF
    inc  [hl]                                     ; $42AA: $34

jr_015_42AB:
    jp   label_015_416F                           ; $42AB: $C3 $6F $41

MovingBlockBottomRightEntityHandler
    ld   de, $40FC                                ; $42AE: $11 $FC $40
    call RenderAnimatedActiveEntity                               ; $42B1: $CD $C0 $3B
    call func_015_7B0D                            ; $42B4: $CD $0D $7B
    xor  a                                        ; $42B7: $AF
    ldh  [hFFE8], a                               ; $42B8: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $42BA: $F0 $F0
    rst  $00                                      ; $42BC: $C7
    pop  bc                                       ; $42BD: $C1
    ld   b, d                                     ; $42BE: $42
    push de                                       ; $42BF: $D5
    ld   b, d                                     ; $42C0: $42
    ld   hl, wEntitiesPosXTable                         ; $42C1: $21 $00 $C2
    add  hl, bc                                   ; $42C4: $09
    ld   a, [hl]                                  ; $42C5: $7E
    ld   hl, wEntitiesUnknownTableC               ; $42C6: $21 $C0 $C2
    add  hl, bc                                   ; $42C9: $09
    ld   [hl], a                                  ; $42CA: $77
    sub  $10                                      ; $42CB: $D6 $10
    ld   hl, wEntitiesUnknownTableB               ; $42CD: $21 $B0 $C2
    add  hl, bc                                   ; $42D0: $09
    ld   [hl], a                                  ; $42D1: $77
    jp   IncrementEntityWalkingAttr               ; $42D2: $C3 $12 $3B

    ldh  a, [$FFBA]                               ; $42D5: $F0 $BA
    cp   $02                                      ; $42D7: $FE $02
    jr   z, jr_015_431D                           ; $42D9: $28 $42

    and  a                                        ; $42DB: $A7
    jr   z, jr_015_42FB                           ; $42DC: $28 $1D

    ld   hl, wEntitiesUnknowTableY                ; $42DE: $21 $D0 $C3
    add  hl, bc                                   ; $42E1: $09
    inc  [hl]                                     ; $42E2: $34
    ld   a, [hl]                                  ; $42E3: $7E
    cp   $0A                                      ; $42E4: $FE $0A
    jr   c, jr_015_42FA                           ; $42E6: $38 $12

    ld   [hl], b                                  ; $42E8: $70
    ld   a, $11                                   ; $42E9: $3E $11
    ldh  [hNoiseSfx], a                           ; $42EB: $E0 $F4
    ld   hl, wEntitiesUnknownTableC               ; $42ED: $21 $C0 $C2
    add  hl, bc                                   ; $42F0: $09
    ld   a, [hl]                                  ; $42F1: $7E
    ld   hl, wEntitiesPosXTable                         ; $42F2: $21 $00 $C2
    add  hl, bc                                   ; $42F5: $09
    cp   [hl]                                     ; $42F6: $BE
    jr   z, jr_015_42FA                           ; $42F7: $28 $01

    inc  [hl]                                     ; $42F9: $34

jr_015_42FA:
    ret                                           ; $42FA: $C9

jr_015_42FB:
    ld   hl, wEntitiesUnknownTableB               ; $42FB: $21 $B0 $C2
    add  hl, bc                                   ; $42FE: $09
    ld   a, [hl]                                  ; $42FF: $7E
    ld   hl, wEntitiesPosXTable                         ; $4300: $21 $00 $C2
    add  hl, bc                                   ; $4303: $09
    cp   [hl]                                     ; $4304: $BE
    jr   z, jr_015_4319                           ; $4305: $28 $12

    ld   hl, wEntitiesUnknowTableY                ; $4307: $21 $D0 $C3
    add  hl, bc                                   ; $430A: $09
    ld   a, [hl]                                  ; $430B: $7E
    inc  [hl]                                     ; $430C: $34
    cp   $0D                                      ; $430D: $FE $0D
    jr   c, jr_015_431D                           ; $430F: $38 $0C

    ld   [hl], b                                  ; $4311: $70
    ld   hl, wEntitiesPosXTable                         ; $4312: $21 $00 $C2
    add  hl, bc                                   ; $4315: $09
    dec  [hl]                                     ; $4316: $35
    jr   jr_015_431D                              ; $4317: $18 $04

jr_015_4319:
    ld   hl, hFFE8                                ; $4319: $21 $E8 $FF
    inc  [hl]                                     ; $431C: $34

jr_015_431D:
    jp   label_015_416F                           ; $431D: $C3 $6F $41

    ld   e, b                                     ; $4320: $58
    inc  bc                                       ; $4321: $03
    ld   e, b                                     ; $4322: $58
    inc  hl                                       ; $4323: $23

CrystalSwitchEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $4324: $21 $60 $C3
    add  hl, bc                                   ; $4327: $09
    ld   [hl], $FF                                ; $4328: $36 $FF
    call GetEntityTransitionCountdown             ; $432A: $CD $05 $0C
    rla                                           ; $432D: $17
    and  $10                                      ; $432E: $E6 $10
    ldh  [$FFED], a                               ; $4330: $E0 $ED
    ld   de, $4320                                ; $4332: $11 $20 $43
    call RenderAnimatedActiveEntity                               ; $4335: $CD $C0 $3B
    call func_015_7B0D                            ; $4338: $CD $0D $7B
    call label_C56                                ; $433B: $CD $56 $0C
    call label_3B70                               ; $433E: $CD $70 $3B
    call func_015_7A6E                            ; $4341: $CD $6E $7A
    call label_3B23                               ; $4344: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableU                ; $4347: $21 $20 $C4
    add  hl, bc                                   ; $434A: $09
    ld   a, [hl]                                  ; $434B: $7E
    and  a                                        ; $434C: $A7
    jr   z, jr_015_4364                           ; $434D: $28 $15

    ld   [hl], b                                  ; $434F: $70
    ld   a, [$D6F8]                               ; $4350: $FA $F8 $D6
    and  a                                        ; $4353: $A7
    jr   nz, jr_015_4364                          ; $4354: $20 $0E

    ld   a, $01                                   ; $4356: $3E $01
    ld   [$D6F8], a                               ; $4358: $EA $F8 $D6
    call GetEntityTransitionCountdown             ; $435B: $CD $05 $0C
    ld   [hl], $18                                ; $435E: $36 $18
    ld   a, $0E                                   ; $4360: $3E $0E
    ldh  [hWaveSfx], a                            ; $4362: $E0 $F3

jr_015_4364:
    ret                                           ; $4364: $C9

BouldersEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $4365: $F0 $F0
    and  a                                        ; $4367: $A7
    jp   nz, $43CA                                ; $4368: $C2 $CA $43

    call func_015_7B0D                            ; $436B: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $436E: $CD $05 $0C
    jr   nz, jr_015_43AD                          ; $4371: $20 $3A

    call GetRandomByte                            ; $4373: $CD $0D $28
    and  $3F                                      ; $4376: $E6 $3F
    add  $30                                      ; $4378: $C6 $30
    ld   [hl], a                                  ; $437A: $77
    ldh  a, [hLinkPositionY]                      ; $437B: $F0 $99
    cp   $18                                      ; $437D: $FE $18
    ret  c                                        ; $437F: $D8

    ld   a, $45                                   ; $4380: $3E $45
    call func_003_64CA_trampoline                               ; $4382: $CD $86 $3B
    ret  c                                        ; $4385: $D8

    call GetRandomByte                            ; $4386: $CD $0D $28
    rla                                           ; $4389: $17
    rla                                           ; $438A: $17
    rla                                           ; $438B: $17
    rla                                           ; $438C: $17
    and  $70                                      ; $438D: $E6 $70
    add  $18                                      ; $438F: $C6 $18
    ld   hl, wEntitiesPosXTable                         ; $4391: $21 $00 $C2
    add  hl, de                                   ; $4394: $19
    ld   [hl], a                                  ; $4395: $77
    ld   hl, wEntitiesPosYTable                         ; $4396: $21 $10 $C2
    add  hl, de                                   ; $4399: $19
    ld   [hl], $10                                ; $439A: $36 $10
    ld   hl, wEntitiesUnknowTableL                ; $439C: $21 $40 $C3
    add  hl, de                                   ; $439F: $19
    ld   [hl], $12                                ; $43A0: $36 $12
    ld   hl, wEntitiesUnknowTableM                ; $43A2: $21 $50 $C3
    add  hl, de                                   ; $43A5: $19
    set  7, [hl]                                  ; $43A6: $CB $FE
    ld   hl, wEntitiesStateTable                  ; $43A8: $21 $90 $C2
    add  hl, de                                   ; $43AB: $19
    inc  [hl]                                     ; $43AC: $34

jr_015_43AD:
    ret                                           ; $43AD: $C9

    ld   e, h                                     ; $43AE: $5C
    nop                                           ; $43AF: $00
    ld   e, [hl]                                  ; $43B0: $5E
    nop                                           ; $43B1: $00
    ld   e, [hl]                                  ; $43B2: $5E
    jr   nz, jr_015_4411                          ; $43B3: $20 $5C

    jr   nz, jr_015_4415                          ; $43B5: $20 $5E

    ld   h, b                                     ; $43B7: $60
    ld   e, h                                     ; $43B8: $5C
    ld   h, b                                     ; $43B9: $60
    ld   e, h                                     ; $43BA: $5C
    ld   b, b                                     ; $43BB: $40
    ld   e, [hl]                                  ; $43BC: $5E
    ld   b, b                                     ; $43BD: $40
    inc  c                                        ; $43BE: $0C
    db   $F4                                      ; $43BF: $F4
    dec  b                                        ; $43C0: $05
    ei                                            ; $43C1: $FB
    ld   [$060A], sp                              ; $43C2: $08 $0A $06
    inc  c                                        ; $43C5: $0C
    jr   @+$22                                    ; $43C6: $18 $20

    inc  e                                        ; $43C8: $1C
    jr   z, jr_015_43DC                           ; $43C9: $28 $11

    xor  [hl]                                     ; $43CB: $AE
    ld   b, e                                     ; $43CC: $43
    call RenderAnimatedActiveEntity                               ; $43CD: $CD $C0 $3B
    call func_015_7B0D                            ; $43D0: $CD $0D $7B
    call label_C56                                ; $43D3: $CD $56 $0C
    call label_3B39                               ; $43D6: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $43D9: $F0 $E7
    rra                                           ; $43DB: $1F

jr_015_43DC:
    rra                                           ; $43DC: $1F
    rra                                           ; $43DD: $1F
    and  $03                                      ; $43DE: $E6 $03
    call SetEntitySpriteVariant                   ; $43E0: $CD $0C $3B
    call func_015_7B88                            ; $43E3: $CD $88 $7B
    call func_015_7BC1                            ; $43E6: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $43E9: $21 $20 $C3
    add  hl, bc                                   ; $43EC: $09
    dec  [hl]                                     ; $43ED: $35
    dec  [hl]                                     ; $43EE: $35
    ld   hl, wEntitiesPosZTable                   ; $43EF: $21 $10 $C3
    add  hl, bc                                   ; $43F2: $09
    ld   a, [hl]                                  ; $43F3: $7E
    and  $80                                      ; $43F4: $E6 $80
    jr   z, jr_015_4430                           ; $43F6: $28 $38

    ld   [hl], b                                  ; $43F8: $70
    call GetRandomByte                            ; $43F9: $CD $0D $28
    and  $03                                      ; $43FC: $E6 $03
    ld   e, a                                     ; $43FE: $5F
    ld   d, b                                     ; $43FF: $50
    ld   hl, $43BE                                ; $4400: $21 $BE $43
    add  hl, de                                   ; $4403: $19
    ld   a, [hl]                                  ; $4404: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4405: $21 $40 $C2
    add  hl, bc                                   ; $4408: $09
    ld   [hl], a                                  ; $4409: $77
    call GetRandomByte                            ; $440A: $CD $0D $28
    and  $03                                      ; $440D: $E6 $03
    ld   e, a                                     ; $440F: $5F
    ld   d, b                                     ; $4410: $50

jr_015_4411:
    ld   hl, $43C2                                ; $4411: $21 $C2 $43
    add  hl, de                                   ; $4414: $19

jr_015_4415:
    ld   a, [hl]                                  ; $4415: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4416: $21 $50 $C2
    add  hl, bc                                   ; $4419: $09
    ld   [hl], a                                  ; $441A: $77
    call GetRandomByte                            ; $441B: $CD $0D $28
    and  $03                                      ; $441E: $E6 $03
    ld   e, a                                     ; $4420: $5F
    ld   d, b                                     ; $4421: $50
    ld   hl, $43C6                                ; $4422: $21 $C6 $43
    add  hl, de                                   ; $4425: $19
    ld   a, [hl]                                  ; $4426: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4427: $21 $20 $C3
    add  hl, bc                                   ; $442A: $09
    ld   [hl], a                                  ; $442B: $77
    ld   a, $20                                   ; $442C: $3E $20
    ldh  [hJingle], a                             ; $442E: $E0 $F2

jr_015_4430:
    ldh  a, [wActiveEntityPosX]                   ; $4430: $F0 $EE
    cp   $A8                                      ; $4432: $FE $A8
    jp   nc, ClearEntityStatusAndReturn                       ; $4434: $D2 $31 $7C

    ldh  a, [wActiveEntityPosY]                   ; $4437: $F0 $EC
    cp   $84                                      ; $4439: $FE $84
    jp   nc, ClearEntityStatusAndReturn                       ; $443B: $D2 $31 $7C

    ret                                           ; $443E: $C9

YarnaTalkingBonesEntityHandler::
    call func_015_7B0D                            ; $443F: $CD $0D $7B
    ld   e, $0F                                   ; $4442: $1E $0F
    ld   d, b                                     ; $4444: $50

jr_015_4445:
    ld   hl, wEntitiesStatusTable                        ; $4445: $21 $80 $C2
    add  hl, de                                   ; $4448: $19
    ld   a, [hl]                                  ; $4449: $7E
    cp   $05                                      ; $444A: $FE $05
    jr   nz, jr_015_448C                          ; $444C: $20 $3E

    ld   hl, wEntitiesTypeTable                   ; $444E: $21 $A0 $C3
    add  hl, de                                   ; $4451: $19
    ld   a, [hl]                                  ; $4452: $7E
    cp   $08                                      ; $4453: $FE $08
    jr   nz, jr_015_448C                          ; $4455: $20 $35

    ld   hl, wEntitiesTransitionCountdownTable    ; $4457: $21 $E0 $C2
    add  hl, de                                   ; $445A: $19
    ld   a, [hl]                                  ; $445B: $7E
    cp   $08                                      ; $445C: $FE $08
    jr   nz, jr_015_448C                          ; $445E: $20 $2C

    ld   hl, wEntitiesPosXTable                         ; $4460: $21 $00 $C2
    add  hl, de                                   ; $4463: $19
    ldh  a, [wActiveEntityPosX]                   ; $4464: $F0 $EE
    sub  [hl]                                     ; $4466: $96
    add  $08                                      ; $4467: $C6 $08
    cp   $10                                      ; $4469: $FE $10
    jr   nc, jr_015_448C                          ; $446B: $30 $1F

    ld   hl, wEntitiesPosYTable                         ; $446D: $21 $10 $C2
    add  hl, de                                   ; $4470: $19
    ldh  a, [wActiveEntityPosY]                   ; $4471: $F0 $EC
    sub  [hl]                                     ; $4473: $96
    add  $08                                      ; $4474: $C6 $08
    cp   $10                                      ; $4476: $FE $10
    jr   nc, jr_015_448C                          ; $4478: $30 $12

    ldh  a, [hMapRoom]                            ; $447A: $F0 $F6
    cp   $DF                                      ; $447C: $FE $DF
    ld   a, $92                                   ; $447E: $3E $92
    jr   z, jr_015_4489                           ; $4480: $28 $07

    ld   a, [wIsGhostFollowingLink]               ; $4482: $FA $79 $DB
    and  a                                        ; $4485: $A7
    ret  nz                                       ; $4486: $C0

    ld   a, $43                                   ; $4487: $3E $43

jr_015_4489:
    jp   OpenDialog                               ; $4489: $C3 $85 $23

jr_015_448C:
    dec  e                                        ; $448C: $1D
    ld   a, e                                     ; $448D: $7B
    cp   $FF                                      ; $448E: $FE $FF
    jr   nz, jr_015_4445                          ; $4490: $20 $B3

    ret                                           ; $4492: $C9

SeashellMansionTreesEntityHandler::
    call func_015_7B0D                            ; $4493: $CD $0D $7B
    call ShouldLinkTalkToEntity                   ; $4496: $CD $BC $7A
    ret  nc                                       ; $4499: $D0

    ld   a, $12                                   ; $449A: $3E $12
    jp   OpenDialog                               ; $449C: $C3 $85 $23

    rst  $38                                      ; $449F: $FF
    nop                                           ; $44A0: $00
    rst  $38                                      ; $44A1: $FF
    nop                                           ; $44A2: $00
    ld   d, h                                     ; $44A3: $54
    nop                                           ; $44A4: $00
    ld   d, [hl]                                  ; $44A5: $56
    nop                                           ; $44A6: $00
    ld   e, b                                     ; $44A7: $58
    nop                                           ; $44A8: $00
    ld   e, d                                     ; $44A9: $5A
    nop                                           ; $44AA: $00
    ld   d, [hl]                                  ; $44AB: $56
    jr   nz, @+$56                                ; $44AC: $20 $54

    jr   nz, @+$5C                                ; $44AE: $20 $5A

    jr   nz, @+$5A                                ; $44B0: $20 $58

    jr   nz, @+$5E                                ; $44B2: $20 $5C

    nop                                           ; $44B4: $00
    ld   e, h                                     ; $44B5: $5C
    jr   nz, @+$60                                ; $44B6: $20 $5E

    nop                                           ; $44B8: $00
    ld   e, [hl]                                  ; $44B9: $5E
    nop                                           ; $44BA: $00

FishEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $44BB: $F0 $F1
    cp   $FF                                      ; $44BD: $FE $FF
    jr   z, jr_015_44D7                           ; $44BF: $28 $16

    cp   $05                                      ; $44C1: $FE $05
    jr   c, jr_015_44D1                           ; $44C3: $38 $0C

    sub  $05                                      ; $44C5: $D6 $05
    ldh  [hActiveEntitySpriteVariant], a               ; $44C7: $E0 $F1
    ld   de, $44B3                                ; $44C9: $11 $B3 $44
    call RenderSimpleEntityWithSpriteVariantToOAM ; $44CC: $CD $77 $3C
    jr   jr_015_44D7                              ; $44CF: $18 $06

jr_015_44D1:
    ld   de, $449F                                ; $44D1: $11 $9F $44
    call RenderAnimatedActiveEntity                               ; $44D4: $CD $C0 $3B

jr_015_44D7:
    call func_015_7B0D                            ; $44D7: $CD $0D $7B
    call func_015_7B3E                            ; $44DA: $CD $3E $7B
    call func_015_7B88                            ; $44DD: $CD $88 $7B
    call label_3B23                               ; $44E0: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $44E3: $F0 $F0
    rst  $00                                      ; $44E5: $C7
    db   $EC                                      ; $44E6: $EC
    ld   b, h                                     ; $44E7: $44
    nop                                           ; $44E8: $00
    ld   b, l                                     ; $44E9: $45
    ld   d, e                                     ; $44EA: $53
    ld   b, l                                     ; $44EB: $45
    ld   hl, wEntitiesSpeedXTable                       ; $44EC: $21 $40 $C2
    add  hl, bc                                   ; $44EF: $09
    ld   [hl], $08                                ; $44F0: $36 $08
    call GetEntityTransitionCountdown             ; $44F2: $CD $05 $0C
    call GetRandomByte                            ; $44F5: $CD $0D $28
    and  $7F                                      ; $44F8: $E6 $7F
    add  $40                                      ; $44FA: $C6 $40
    ld   [hl], a                                  ; $44FC: $77
    jp   IncrementEntityWalkingAttr               ; $44FD: $C3 $12 $3B

    call label_3B44                               ; $4500: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $4503: $CD $05 $0C
    jr   nz, jr_015_4530                          ; $4506: $20 $28

    ld   hl, wEntitiesUnknowTableL                ; $4508: $21 $40 $C3
    add  hl, bc                                   ; $450B: $09
    ld   [hl], $12                                ; $450C: $36 $12
    ld   hl, wEntitiesSpeedZTable                 ; $450E: $21 $20 $C3
    add  hl, bc                                   ; $4511: $09
    ld   [hl], $18                                ; $4512: $36 $18
    call IncrementEntityWalkingAttr               ; $4514: $CD $12 $3B
    ld   hl, wEntitiesSpeedXTable                       ; $4517: $21 $40 $C2
    add  hl, bc                                   ; $451A: $09
    sla  [hl]                                     ; $451B: $CB $26

func_015_451D:
    ld   a, $0E                                   ; $451D: $3E $0E
    ldh  [hJingle], a                             ; $451F: $E0 $F2
    ldh  a, [wActiveEntityPosX]                   ; $4521: $F0 $EE
    ldh  [hScratch0], a                           ; $4523: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4525: $F0 $EC
    add  $00                                      ; $4527: $C6 $00
    ldh  [hScratch1], a                           ; $4529: $E0 $D8
    ld   a, $01                                   ; $452B: $3E $01
    jp   label_CC7                                ; $452D: $C3 $C7 $0C

jr_015_4530:
    ld   hl, wEntitiesCollisionsTable             ; $4530: $21 $A0 $C2
    add  hl, bc                                   ; $4533: $09
    ld   a, [hl]                                  ; $4534: $7E
    and  $03                                      ; $4535: $E6 $03
    jr   z, jr_015_4541                           ; $4537: $28 $08

    ld   hl, wEntitiesSpeedXTable                       ; $4539: $21 $40 $C2
    add  hl, bc                                   ; $453C: $09
    ld   a, [hl]                                  ; $453D: $7E
    cpl                                           ; $453E: $2F
    inc  a                                        ; $453F: $3C
    ld   [hl], a                                  ; $4540: $77

jr_015_4541:
    ld   hl, wEntitiesSpeedXTable                       ; $4541: $21 $40 $C2
    add  hl, bc                                   ; $4544: $09
    ld   e, $06                                   ; $4545: $1E $06
    ld   a, [hl]                                  ; $4547: $7E
    and  $80                                      ; $4548: $E6 $80
    jr   z, jr_015_454E                           ; $454A: $28 $02

    ld   e, $05                                   ; $454C: $1E $05

jr_015_454E:
    ld   a, e                                     ; $454E: $7B
    jp   SetEntitySpriteVariant                   ; $454F: $C3 $0C $3B

    ret                                           ; $4552: $C9

    call label_3B39                               ; $4553: $CD $39 $3B
    call func_015_7BC1                            ; $4556: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4559: $21 $20 $C3
    add  hl, bc                                   ; $455C: $09
    dec  [hl]                                     ; $455D: $35
    ld   hl, wEntitiesPosZTable                   ; $455E: $21 $10 $C3
    add  hl, bc                                   ; $4561: $09
    ld   a, [hl]                                  ; $4562: $7E
    and  $80                                      ; $4563: $E6 $80
    jr   z, jr_015_4588                           ; $4565: $28 $21

    ld   [hl], b                                  ; $4567: $70
    call func_015_451D                            ; $4568: $CD $1D $45
    call GetEntityTransitionCountdown             ; $456B: $CD $05 $0C
    call GetRandomByte                            ; $456E: $CD $0D $28
    and  $7F                                      ; $4571: $E6 $7F
    add  $50                                      ; $4573: $C6 $50
    ld   [hl], a                                  ; $4575: $77
    ld   hl, wEntitiesSpeedXTable                       ; $4576: $21 $40 $C2
    add  hl, bc                                   ; $4579: $09
    sra  [hl]                                     ; $457A: $CB $2E
    ld   hl, wEntitiesUnknowTableL                ; $457C: $21 $40 $C3
    add  hl, bc                                   ; $457F: $09
    ld   [hl], $52                                ; $4580: $36 $52
    call IncrementEntityWalkingAttr               ; $4582: $CD $12 $3B
    ld   [hl], $01                                ; $4585: $36 $01
    ret                                           ; $4587: $C9

jr_015_4588:
    ld   e, $01                                   ; $4588: $1E $01
    ld   hl, wEntitiesSpeedXTable                       ; $458A: $21 $40 $C2
    add  hl, bc                                   ; $458D: $09
    ld   a, [hl]                                  ; $458E: $7E
    and  $80                                      ; $458F: $E6 $80
    jr   nz, jr_015_4595                          ; $4591: $20 $02

    ld   e, $03                                   ; $4593: $1E $03

jr_015_4595:
    ld   hl, wEntitiesSpeedZTable                 ; $4595: $21 $20 $C3
    add  hl, bc                                   ; $4598: $09
    ld   a, [hl]                                  ; $4599: $7E
    and  $80                                      ; $459A: $E6 $80
    jr   z, jr_015_459F                           ; $459C: $28 $01

    inc  e                                        ; $459E: $1C

jr_015_459F:
    ld   a, e                                     ; $459F: $7B
    jp   SetEntitySpriteVariant                   ; $45A0: $C3 $0C $3B

    nop                                           ; $45A3: $00
    nop                                           ; $45A4: $00
    ld   b, [hl]                                  ; $45A5: $46
    rlca                                          ; $45A6: $07
    nop                                           ; $45A7: $00
    ld   [$077E], sp                              ; $45A8: $08 $7E $07
    ldh  a, [rP1]                                 ; $45AB: $F0 $00
    ld   b, [hl]                                  ; $45AD: $46
    rlca                                          ; $45AE: $07
    ldh  a, [$FF08]                               ; $45AF: $F0 $08
    ld   a, [hl]                                  ; $45B1: $7E
    rlca                                          ; $45B2: $07
    ldh  [rP1], a                                 ; $45B3: $E0 $00
    ld   b, [hl]                                  ; $45B5: $46
    rlca                                          ; $45B6: $07
    ldh  [$FF08], a                               ; $45B7: $E0 $08
    ld   a, [hl]                                  ; $45B9: $7E
    rlca                                          ; $45BA: $07
    ret  nc                                       ; $45BB: $D0

    nop                                           ; $45BC: $00
    ld   b, [hl]                                  ; $45BD: $46
    rlca                                          ; $45BE: $07
    ret  nc                                       ; $45BF: $D0

    ld   [$077E], sp                              ; $45C0: $08 $7E $07
    ret  nz                                       ; $45C3: $C0

    nop                                           ; $45C4: $00
    ld   b, [hl]                                  ; $45C5: $46
    rlca                                          ; $45C6: $07
    ret  nz                                       ; $45C7: $C0

    ld   [$077E], sp                              ; $45C8: $08 $7E $07

label_015_45CB:
    ld   hl, wEntitiesUnknowTableY                ; $45CB: $21 $D0 $C3
    add  hl, bc                                   ; $45CE: $09
    ld   a, [hl]                                  ; $45CF: $7E
    add  $01                                      ; $45D0: $C6 $01
    sla  a                                        ; $45D2: $CB $27
    ld   c, a                                     ; $45D4: $4F
    ld   hl, $45A3                                ; $45D5: $21 $A3 $45
    call label_3CE6                               ; $45D8: $CD $E6 $3C
    ld   a, $0A                                   ; $45DB: $3E $0A
    call label_3DA0                               ; $45DD: $CD $A0 $3D
    call func_015_7B0D                            ; $45E0: $CD $0D $7B
    ld   a, [wGameplayType]                       ; $45E3: $FA $95 $DB
    cp   $01                                      ; $45E6: $FE $01
    ret  z                                        ; $45E8: $C8

    ldh  a, [hActiveEntityState]                  ; $45E9: $F0 $F0
    rst  $00                                      ; $45EB: $C7
    or   $45                                      ; $45EC: $F6 $45
    cp   $45                                      ; $45EE: $FE $45
    daa                                           ; $45F0: $27
    ld   b, [hl]                                  ; $45F1: $46
    dec  a                                        ; $45F2: $3D
    ld   b, [hl]                                  ; $45F3: $46
    ld   h, b                                     ; $45F4: $60
    ld   b, [hl]                                  ; $45F5: $46
    call GetEntityTransitionCountdown             ; $45F6: $CD $05 $0C
    ld   [hl], $C0                                ; $45F9: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $45FB: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $45FE: $CD $05 $0C
    cp   $40                                      ; $4601: $FE $40
    jr   nz, jr_015_460B                          ; $4603: $20 $06

    dec  [hl]                                     ; $4605: $35
    ld   a, $D7                                   ; $4606: $3E $D7
    jp   OpenDialog                               ; $4608: $C3 $85 $23

jr_015_460B:
    and  a                                        ; $460B: $A7
    ret  nz                                       ; $460C: $C0

    ld   a, $50                                   ; $460D: $3E $50
    dec  a                                        ; $460F: $3D
    ldh  [hScratch0], a                           ; $4610: $E0 $D7
    ld   a, $30                                   ; $4612: $3E $30
    ldh  [hScratch1], a                           ; $4614: $E0 $D8
    ld   a, $02                                   ; $4616: $3E $02
    call label_CC7                                ; $4618: $CD $C7 $0C
    ld   a, $2F                                   ; $461B: $3E $2F
    ldh  [hJingle], a                             ; $461D: $E0 $F2
    ld   a, $00                                   ; $461F: $3E $00
    call SetEntitySpriteVariant                   ; $4621: $CD $0C $3B
    jp   IncrementEntityWalkingAttr               ; $4624: $C3 $12 $3B

    ldh  a, [hLinkPositionX]                      ; $4627: $F0 $98
    sub  $50                                      ; $4629: $D6 $50
    add  $08                                      ; $462B: $C6 $08
    cp   $10                                      ; $462D: $FE $10
    jr   nc, jr_015_463A                          ; $462F: $30 $09

    ldh  a, [hLinkPositionY]                      ; $4631: $F0 $99
    sub  $30                                      ; $4633: $D6 $30
    add  $08                                      ; $4635: $C6 $08
    cp   $10                                      ; $4637: $FE $10
    ret  c                                        ; $4639: $D8

jr_015_463A:
    jp   IncrementEntityWalkingAttr               ; $463A: $C3 $12 $3B

    ldh  a, [hLinkPositionX]                      ; $463D: $F0 $98
    sub  $50                                      ; $463F: $D6 $50
    add  $08                                      ; $4641: $C6 $08
    cp   $10                                      ; $4643: $FE $10
    jr   nc, jr_015_465F                          ; $4645: $30 $18

    ldh  a, [hLinkPositionY]                      ; $4647: $F0 $99
    sub  $30                                      ; $4649: $D6 $30
    add  $08                                      ; $464B: $C6 $08
    cp   $10                                      ; $464D: $FE $10
    jr   nc, jr_015_465F                          ; $464F: $30 $0E

    ld   a, [$C146]                               ; $4651: $FA $46 $C1
    and  a                                        ; $4654: $A7
    ret  nz                                       ; $4655: $C0

    call IncrementEntityWalkingAttr               ; $4656: $CD $12 $3B
    ld   hl, wEntitiesUnknownTableB               ; $4659: $21 $B0 $C2
    add  hl, bc                                   ; $465C: $09
    ld   [hl], $30                                ; $465D: $36 $30

jr_015_465F:
    ret                                           ; $465F: $C9

    ld   a, $02                                   ; $4660: $3E $02
    ldh  [$FFA1], a                               ; $4662: $E0 $A1
    ld   [wC167], a                               ; $4664: $EA $67 $C1
    ld   hl, wEntitiesUnknownTableB               ; $4667: $21 $B0 $C2
    add  hl, bc                                   ; $466A: $09
    ld   a, [hl]                                  ; $466B: $7E
    ldh  [hLinkPositionY], a                      ; $466C: $E0 $99
    ld   a, $50                                   ; $466E: $3E $50
    ldh  [hLinkPositionX], a                      ; $4670: $E0 $98
    ldh  a, [hFrameCounter]                       ; $4672: $F0 $E7
    and  $07                                      ; $4674: $E6 $07
    jr   nz, jr_015_4682                          ; $4676: $20 $0A

    ld   hl, wEntitiesUnknowTableY                ; $4678: $21 $D0 $C3
    add  hl, bc                                   ; $467B: $09
    ld   a, [hl]                                  ; $467C: $7E
    cp   $04                                      ; $467D: $FE $04
    jr   z, jr_015_4682                           ; $467F: $28 $01

    inc  [hl]                                     ; $4681: $34

jr_015_4682:
    ldh  a, [hFrameCounter]                       ; $4682: $F0 $E7
    and  $03                                      ; $4684: $E6 $03
    jr   nz, jr_015_469C                          ; $4686: $20 $14

    ld   hl, wEntitiesUnknownTableB               ; $4688: $21 $B0 $C2
    add  hl, bc                                   ; $468B: $09
    dec  [hl]                                     ; $468C: $35
    ld   a, [hl]                                  ; $468D: $7E
    cp   $12                                      ; $468E: $FE $12
    jr   nc, jr_015_469C                          ; $4690: $30 $0A

    xor  a                                        ; $4692: $AF
    ld   [wGameplaySubtype], a                    ; $4693: $EA $96 $DB
    ld   a, $01                                   ; $4696: $3E $01
    ld   [wGameplayType], a                       ; $4698: $EA $95 $DB
    ret                                           ; $469B: $C9

jr_015_469C:
    ld   a, $02                                   ; $469C: $3E $02
    ldh  [hLinkDirection], a                      ; $469E: $E0 $9E
    ldh  a, [hFrameCounter]                       ; $46A0: $F0 $E7
    and  $08                                      ; $46A2: $E6 $08
    ld   [wC120], a                               ; $46A4: $EA $20 $C1
    push bc                                       ; $46A7: $C5
    call $0BF0                                    ; $46A8: $CD $F0 $0B
    pop  bc                                       ; $46AB: $C1
    call ResetSpinAttack                                ; $46AC: $CD $AF $0C
    ld   [wSwordAnimationState], a                ; $46AF: $EA $37 $C1
    ld   [wC16A], a                               ; $46B2: $EA $6A $C1
    ret                                           ; $46B5: $C9

MoblinKingEntityHandler::
    ld   a, [wIsBowWowFollowingLink]              ; $46B6: $FA $56 $DB
    cp   $80                                      ; $46B9: $FE $80
    jp   nz, ClearEntityStatusAndReturn           ; $46BB: $C2 $31 $7C

    ld   hl, wEntitiesUnknowTableQ                ; $46BE: $21 $80 $C3
    add  hl, bc                                   ; $46C1: $09
    ld   a, [hl]                                  ; $46C2: $7E
    and  a                                        ; $46C3: $A7
    jr   nz, jr_015_46D0                          ; $46C4: $20 $0A

    ldh  a, [hActiveEntitySpriteVariant]               ; $46C6: $F0 $F1
    cp   $0C                                      ; $46C8: $FE $0C
    jr   nc, jr_015_46D0                          ; $46CA: $30 $04

    add  $06                                      ; $46CC: $C6 $06
    ldh  [hActiveEntitySpriteVariant], a               ; $46CE: $E0 $F1

jr_015_46D0:
    call func_015_4AC9                            ; $46D0: $CD $C9 $4A
    ldh  a, [hActiveEntityStatus]                 ; $46D3: $F0 $EA
    cp   $01                                      ; $46D5: $FE $01
    jr   nz, jr_015_46E1                          ; $46D7: $20 $08

    ld   a, $0C                                   ; $46D9: $3E $0C
    call func_015_48B6                            ; $46DB: $CD $B6 $48
    jp   label_015_7C37                           ; $46DE: $C3 $37 $7C

jr_015_46E1:
    call label_394D                               ; $46E1: $CD $4D $39
    call func_015_7B0D                            ; $46E4: $CD $0D $7B
    call func_015_7B3E                            ; $46E7: $CD $3E $7B
    call label_3B39                               ; $46EA: $CD $39 $3B
    ld   hl, wEntitiesUnknowTableH                ; $46ED: $21 $30 $C4
    add  hl, bc                                   ; $46F0: $09
    set  6, [hl]                                  ; $46F1: $CB $F6
    ld   hl, wEntitiesUnknowTableL                ; $46F3: $21 $40 $C3
    add  hl, bc                                   ; $46F6: $09
    res  7, [hl]                                  ; $46F7: $CB $BE
    call func_015_7B88                            ; $46F9: $CD $88 $7B
    call label_3B23                               ; $46FC: $CD $23 $3B
    call func_015_7BC1                            ; $46FF: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4702: $21 $20 $C3
    add  hl, bc                                   ; $4705: $09
    dec  [hl]                                     ; $4706: $35
    dec  [hl]                                     ; $4707: $35
    dec  [hl]                                     ; $4708: $35
    ld   hl, wEntitiesPosZTable                   ; $4709: $21 $10 $C3
    add  hl, bc                                   ; $470C: $09
    ld   a, [hl]                                  ; $470D: $7E
    and  $80                                      ; $470E: $E6 $80
    ldh  [hFFE8], a                               ; $4710: $E0 $E8
    jr   z, jr_015_471A                           ; $4712: $28 $06

    ld   [hl], b                                  ; $4714: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4715: $21 $20 $C3
    add  hl, bc                                   ; $4718: $09
    ld   [hl], b                                  ; $4719: $70

jr_015_471A:
    ld   hl, wEntitiesStateTable                  ; $471A: $21 $90 $C2
    add  hl, bc                                   ; $471D: $09
    ld   a, [hl]                                  ; $471E: $7E
    rst  $00                                      ; $471F: $C7
    inc  [hl]                                     ; $4720: $34
    ld   b, a                                     ; $4721: $47
    ld   d, b                                     ; $4722: $50
    ld   b, a                                     ; $4723: $47
    add  b                                        ; $4724: $80
    ld   b, a                                     ; $4725: $47
    ccf                                           ; $4726: $3F
    ld   c, b                                     ; $4727: $48
    ld   [hl], e                                  ; $4728: $73
    ld   c, b                                     ; $4729: $48
    rst  $08                                      ; $472A: $CF
    ld   c, b                                     ; $472B: $48
    ld   c, h                                     ; $472C: $4C
    ld   c, c                                     ; $472D: $49
    ld   [hl], a                                  ; $472E: $77
    ld   c, c                                     ; $472F: $49
    sbc  h                                        ; $4730: $9C
    ld   c, c                                     ; $4731: $49
    jp   nz, $CD49                                ; $4732: $C2 $49 $CD

    dec  b                                        ; $4735: $05
    inc  c                                        ; $4736: $0C
    ld   [hl], $20                                ; $4737: $36 $20
    xor  a                                        ; $4739: $AF
    ld   [$D228], a                               ; $473A: $EA $28 $D2
    call SetEntitySpriteVariant                   ; $473D: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $4740: $CD $12 $3B

func_015_4743:
label_015_4743:
    call func_015_7BDB                            ; $4743: $CD $DB $7B
    ld   a, e                                     ; $4746: $7B
    ld   [$D227], a                               ; $4747: $EA $27 $D2
    ld   hl, wEntitiesUnknowTableQ                ; $474A: $21 $80 $C3
    add  hl, bc                                   ; $474D: $09

jr_015_474E:
    ld   [hl], a                                  ; $474E: $77
    ret                                           ; $474F: $C9

    call GetEntityTransitionCountdown             ; $4750: $CD $05 $0C
    ret  nz                                       ; $4753: $C0

    ld   a, $91                                   ; $4754: $3E $91
    call OpenDialogInTable1                       ; $4756: $CD $73 $23
    ld   hl, wDialogState                         ; $4759: $21 $9F $C1

jr_015_475C:
    res  7, [hl]                                  ; $475C: $CB $BE
    call IncrementEntityWalkingAttr               ; $475E: $CD $12 $3B
    call label_BFB                                ; $4761: $CD $FB $0B
    ld   [hl], $30                                ; $4764: $36 $30
    ld   hl, wEntitiesUnknowTableH                ; $4766: $21 $30 $C4
    add  hl, bc                                   ; $4769: $09
    ld   [hl], $84                                ; $476A: $36 $84
    ld   a, $01                                   ; $476C: $3E $01
    ld   [$D228], a                               ; $476E: $EA $28 $D2
    ld   a, $01                                   ; $4771: $3E $01
    jp   SetEntitySpriteVariant                   ; $4773: $C3 $0C $3B

    ld   [$FCF8], sp                              ; $4776: $08 $F8 $FC
    db   $FC                                      ; $4779: $FC
    jr   nz, jr_015_475C                          ; $477A: $20 $E0

    nop                                           ; $477C: $00
    nop                                           ; $477D: $00
    ret  nc                                       ; $477E: $D0

    jr   nc, jr_015_474E                          ; $477F: $30 $CD

    nop                                           ; $4781: $00
    inc  c                                        ; $4782: $0C
    jr   z, jr_015_47E3                           ; $4783: $28 $5E

    cp   $0C                                      ; $4785: $FE $0C
    jr   nz, jr_015_47D1                          ; $4787: $20 $48

    ld   a, $0C                                   ; $4789: $3E $0C
    call func_003_64CA_trampoline                               ; $478B: $CD $86 $3B
    jr   c, jr_015_47D1                           ; $478E: $38 $41

    ld   a, $0A                                   ; $4790: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4792: $E0 $F4
    push bc                                       ; $4794: $C5
    ldh  a, [hScratch2]                           ; $4795: $F0 $D9
    ld   c, a                                     ; $4797: $4F
    ld   hl, $4776                                ; $4798: $21 $76 $47
    add  hl, bc                                   ; $479B: $09
    ldh  a, [hScratch0]                           ; $479C: $F0 $D7
    add  [hl]                                     ; $479E: $86
    ld   hl, wEntitiesPosXTable                         ; $479F: $21 $00 $C2
    add  hl, de                                   ; $47A2: $19
    ld   [hl], a                                  ; $47A3: $77
    ld   hl, $4778                                ; $47A4: $21 $78 $47
    add  hl, bc                                   ; $47A7: $09
    ldh  a, [hScratch1]                           ; $47A8: $F0 $D8
    add  [hl]                                     ; $47AA: $86
    ld   hl, wEntitiesPosYTable                         ; $47AB: $21 $10 $C2
    add  hl, de                                   ; $47AE: $19
    ld   [hl], a                                  ; $47AF: $77
    ld   hl, $477A                                ; $47B0: $21 $7A $47
    add  hl, bc                                   ; $47B3: $09
    ld   a, [hl]                                  ; $47B4: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $47B5: $21 $40 $C2
    add  hl, de                                   ; $47B8: $19
    ld   [hl], a                                  ; $47B9: $77
    ld   hl, $477C                                ; $47BA: $21 $7C $47
    add  hl, bc                                   ; $47BD: $09
    ld   a, [hl]                                  ; $47BE: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $47BF: $21 $50 $C2
    add  hl, de                                   ; $47C2: $19
    ld   [hl], a                                  ; $47C3: $77
    ldh  a, [hScratch2]                           ; $47C4: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable               ; $47C6: $21 $B0 $C3
    add  hl, de                                   ; $47C9: $19
    ld   [hl], a                                  ; $47CA: $77
    ld   hl, wEntitiesUnknowTableQ                ; $47CB: $21 $80 $C3
    add  hl, de                                   ; $47CE: $19
    ld   [hl], a                                  ; $47CF: $77
    pop  bc                                       ; $47D0: $C1

jr_015_47D1:
    call IsEntityUnknownFZero                     ; $47D1: $CD $00 $0C
    ld   e, $00                                   ; $47D4: $1E $00
    cp   $0C                                      ; $47D6: $FE $0C
    jr   c, jr_015_47DC                           ; $47D8: $38 $02

    ld   e, $02                                   ; $47DA: $1E $02

jr_015_47DC:
    ld   a, e                                     ; $47DC: $7B
    call SetEntitySpriteVariant                   ; $47DD: $CD $0C $3B
    jp   ClearEntitySpeed                               ; $47E0: $C3 $7F $3D

jr_015_47E3:
    call label_BFB                                ; $47E3: $CD $FB $0B
    jr   nz, jr_015_47F3                          ; $47E6: $20 $0B

    call GetEntityTransitionCountdown             ; $47E8: $CD $05 $0C
    ld   [hl], $30                                ; $47EB: $36 $30
    call ClearEntitySpeed                         ; $47ED: $CD $7F $3D
    jp   IncrementEntityWalkingAttr               ; $47F0: $C3 $12 $3B

jr_015_47F3:
    ldh  a, [hFFE8]                               ; $47F3: $F0 $E8
    and  a                                        ; $47F5: $A7
    jr   z, jr_015_4816                           ; $47F6: $28 $1E

    ldh  a, [hLinkPositionX]                      ; $47F8: $F0 $98
    push af                                       ; $47FA: $F5
    call func_015_7BDB                            ; $47FB: $CD $DB $7B
    ld   d, b                                     ; $47FE: $50
    ld   hl, $477E                                ; $47FF: $21 $7E $47
    add  hl, de                                   ; $4802: $19
    ldh  a, [hLinkPositionX]                      ; $4803: $F0 $98
    add  [hl]                                     ; $4805: $86
    ldh  [hLinkPositionX], a                      ; $4806: $E0 $98
    ld   a, $0C                                   ; $4808: $3E $0C
    call label_3BAA                               ; $480A: $CD $AA $3B
    pop  af                                       ; $480D: $F1
    ldh  [hLinkPositionX], a                      ; $480E: $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ; $4810: $21 $20 $C3
    add  hl, bc                                   ; $4813: $09
    ld   [hl], $10                                ; $4814: $36 $10

jr_015_4816:
    ldh  a, [hFrameCounter]                       ; $4816: $F0 $E7
    rra                                           ; $4818: $1F
    rra                                           ; $4819: $1F
    rra                                           ; $481A: $1F
    rra                                           ; $481B: $1F
    and  $01                                      ; $481C: $E6 $01
    call SetEntitySpriteVariant                   ; $481E: $CD $0C $3B
    ld   [$D228], a                               ; $4821: $EA $28 $D2
    call func_015_4743                            ; $4824: $CD $43 $47
    ld   hl, wEntitiesUnknowTableG                ; $4827: $21 $00 $C3
    add  hl, bc                                   ; $482A: $09
    ld   a, [hl]                                  ; $482B: $7E
    and  a                                        ; $482C: $A7
    jr   nz, jr_015_483C                          ; $482D: $20 $0D

    call GetRandomByte                            ; $482F: $CD $0D $28
    and  $3F                                      ; $4832: $E6 $3F
    add  $30                                      ; $4834: $C6 $30
    ld   [hl], a                                  ; $4836: $77
    call IsEntityUnknownFZero                     ; $4837: $CD $00 $0C
    ld   [hl], $18                                ; $483A: $36 $18

jr_015_483C:
    ret                                           ; $483C: $C9

    jr   z, @-$26                                 ; $483D: $28 $D8

    call GetEntityTransitionCountdown             ; $483F: $CD $05 $0C
    jr   nz, jr_015_485C                          ; $4842: $20 $18

    ld   [hl], $22                                ; $4844: $36 $22
    call ClearEntitySpeed                         ; $4846: $CD $7F $3D
    ld   hl, wEntitiesUnknowTableQ                ; $4849: $21 $80 $C3
    add  hl, bc                                   ; $484C: $09
    ld   e, [hl]                                  ; $484D: $5E
    ld   d, b                                     ; $484E: $50
    ld   hl, $483D                                ; $484F: $21 $3D $48
    add  hl, de                                   ; $4852: $19
    ld   a, [hl]                                  ; $4853: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4854: $21 $40 $C2
    add  hl, bc                                   ; $4857: $09
    ld   [hl], a                                  ; $4858: $77
    jp   IncrementEntityWalkingAttr               ; $4859: $C3 $12 $3B

jr_015_485C:
    and  $07                                      ; $485C: $E6 $07
    jr   nz, jr_015_4864                          ; $485E: $20 $04

    ld   a, $09                                   ; $4860: $3E $09
    ldh  [hJingle], a                             ; $4862: $E0 $F2

jr_015_4864:
    call ClearEntitySpeed                         ; $4864: $CD $7F $3D
    ldh  a, [hFrameCounter]                       ; $4867: $F0 $E7
    rra                                           ; $4869: $1F
    rra                                           ; $486A: $1F
    rra                                           ; $486B: $1F
    and  $01                                      ; $486C: $E6 $01
    add  $02                                      ; $486E: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4870: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $4873: $CD $05 $0C
    jr   nz, jr_015_487E                          ; $4876: $20 $06

    call IncrementEntityWalkingAttr               ; $4878: $CD $12 $3B
    jp   IncrementEntityWalkingAttr               ; $487B: $C3 $12 $3B

jr_015_487E:
    ld   hl, wEntitiesCollisionsTable             ; $487E: $21 $A0 $C2
    add  hl, bc                                   ; $4881: $09
    ld   a, [hl]                                  ; $4882: $7E
    and  $03                                      ; $4883: $E6 $03
    jr   z, jr_015_48AE                           ; $4885: $28 $27

    xor  a                                        ; $4887: $AF
    ld   [$C158], a                               ; $4888: $EA $58 $C1
    ld   a, $20                                   ; $488B: $3E $20
    ld   [$C157], a                               ; $488D: $EA $57 $C1
    ld   a, $0B                                   ; $4890: $3E $0B
    ldh  [hJingle], a                             ; $4892: $E0 $F2
    ld   hl, wEntitiesSpeedXTable                       ; $4894: $21 $40 $C2
    add  hl, bc                                   ; $4897: $09
    sra  [hl]                                     ; $4898: $CB $2E
    sra  [hl]                                     ; $489A: $CB $2E
    ld   a, [hl]                                  ; $489C: $7E
    cpl                                           ; $489D: $2F
    inc  a                                        ; $489E: $3C
    ld   [hl], a                                  ; $489F: $77
    ld   hl, wEntitiesSpeedZTable                 ; $48A0: $21 $20 $C3
    add  hl, bc                                   ; $48A3: $09
    ld   [hl], $28                                ; $48A4: $36 $28
    call IncrementEntityWalkingAttr               ; $48A6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $48A9: $CD $05 $0C
    ld   [hl], $60                                ; $48AC: $36 $60

jr_015_48AE:
    ldh  a, [hFrameCounter]                       ; $48AE: $F0 $E7
    rra                                           ; $48B0: $1F
    rra                                           ; $48B1: $1F
    and  $01                                      ; $48B2: $E6 $01
    add  $04                                      ; $48B4: $C6 $04

func_015_48B6:
    call SetEntitySpriteVariant                   ; $48B6: $CD $0C $3B
    ld   a, $FF                                   ; $48B9: $3E $FF
    ld   [$D228], a                               ; $48BB: $EA $28 $D2
    ret                                           ; $48BE: $C9

    nop                                           ; $48BF: $00
    cp   $FD                                      ; $48C0: $FE $FD
    cp   $00                                      ; $48C2: $FE $00
    ld   [bc], a                                  ; $48C4: $02
    inc  bc                                       ; $48C5: $03
    ld   [bc], a                                  ; $48C6: $02
    nop                                           ; $48C7: $00
    inc  b                                        ; $48C8: $04
    ld   [$100C], sp                              ; $48C9: $08 $0C $10
    inc  c                                        ; $48CC: $0C
    ld   [$2104], sp                              ; $48CD: $08 $04 $21
    jr   nc, @-$3A                                ; $48D0: $30 $C4

    add  hl, bc                                   ; $48D2: $09
    res  6, [hl]                                  ; $48D3: $CB $B6
    ld   hl, wEntitiesUnknowTableL                ; $48D5: $21 $40 $C3
    add  hl, bc                                   ; $48D8: $09
    set  7, [hl]                                  ; $48D9: $CB $FE
    call GetEntityTransitionCountdown             ; $48DB: $CD $05 $0C
    jr   nz, jr_015_48F0                          ; $48DE: $20 $10

    ld   [hl], $40                                ; $48E0: $36 $40
    call IncrementEntityWalkingAttr               ; $48E2: $CD $12 $3B
    call IncrementEntityWalkingAttr               ; $48E5: $CD $12 $3B
    ld   a, $00                                   ; $48E8: $3E $00
    ld   [$D228], a                               ; $48EA: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $48ED: $C3 $0C $3B

jr_015_48F0:
    ldh  a, [hFFE8]                               ; $48F0: $F0 $E8
    and  a                                        ; $48F2: $A7
    jr   z, jr_015_48F8                           ; $48F3: $28 $03

    call ClearEntitySpeed                         ; $48F5: $CD $7F $3D

jr_015_48F8:
    ldh  a, [hFrameCounter]                       ; $48F8: $F0 $E7
    rra                                           ; $48FA: $1F
    rra                                           ; $48FB: $1F
    rra                                           ; $48FC: $1F
    and  $01                                      ; $48FD: $E6 $01
    add  $0C                                      ; $48FF: $C6 $0C
    call SetEntitySpriteVariant                   ; $4901: $CD $0C $3B
    ld   a, [$C3C0]                               ; $4904: $FA $C0 $C3
    ld   e, a                                     ; $4907: $5F
    ld   d, b                                     ; $4908: $50
    ld   hl, wDynamicOAMBuffer                    ; $4909: $21 $30 $C0
    add  hl, de                                   ; $490C: $19
    ldh  a, [hFrameCounter]                       ; $490D: $F0 $E7
    rra                                           ; $490F: $1F
    rra                                           ; $4910: $1F
    rra                                           ; $4911: $1F
    and  $07                                      ; $4912: $E6 $07
    call func_015_491C                            ; $4914: $CD $1C $49
    ld   a, $02                                   ; $4917: $3E $02
    jp   label_3DA0                               ; $4919: $C3 $A0 $3D

func_015_491C:
    call func_015_4928                            ; $491C: $CD $28 $49
    ldh  a, [hFrameCounter]                       ; $491F: $F0 $E7
    rra                                           ; $4921: $1F
    rra                                           ; $4922: $1F
    rra                                           ; $4923: $1F
    add  $04                                      ; $4924: $C6 $04
    and  $07                                      ; $4926: $E6 $07

func_015_4928:
    push bc                                       ; $4928: $C5
    push hl                                       ; $4929: $E5
    ld   e, a                                     ; $492A: $5F
    ld   d, $00                                   ; $492B: $16 $00
    ld   hl, $48BF                                ; $492D: $21 $BF $48
    add  hl, de                                   ; $4930: $19
    ld   b, [hl]                                  ; $4931: $46
    ld   hl, $48C7                                ; $4932: $21 $C7 $48
    add  hl, de                                   ; $4935: $19
    ld   c, [hl]                                  ; $4936: $4E
    pop  hl                                       ; $4937: $E1
    ldh  a, [wActiveEntityPosY]                   ; $4938: $F0 $EC
    add  b                                        ; $493A: $80
    add  $F6                                      ; $493B: $C6 $F6
    ld   [hl+], a                                 ; $493D: $22
    ldh  a, [wActiveEntityPosX]                   ; $493E: $F0 $EE
    add  c                                        ; $4940: $81
    add  $FC                                      ; $4941: $C6 $FC
    ld   [hl+], a                                 ; $4943: $22
    ld   [hl], $24                                ; $4944: $36 $24
    inc  hl                                       ; $4946: $23
    ld   [hl], $00                                ; $4947: $36 $00
    inc  hl                                       ; $4949: $23
    pop  bc                                       ; $494A: $C1
    ret                                           ; $494B: $C9

    ld   hl, wEntitiesSpeedXTable                       ; $494C: $21 $40 $C2
    add  hl, bc                                   ; $494F: $09
    ld   a, [hl]                                  ; $4950: $7E
    and  $FE                                      ; $4951: $E6 $FE
    jr   nz, jr_015_4960                          ; $4953: $20 $0B

    call ClearEntitySpeed                         ; $4955: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $4958: $CD $05 $0C
    ld   [hl], $40                                ; $495B: $36 $40
    jp   IncrementEntityWalkingAttr               ; $495D: $C3 $12 $3B

jr_015_4960:
    ld   hl, wEntitiesSpeedXTable                       ; $4960: $21 $40 $C2
    add  hl, bc                                   ; $4963: $09
    ld   a, [hl]                                  ; $4964: $7E
    and  $80                                      ; $4965: $E6 $80
    jr   z, jr_015_496D                           ; $4967: $28 $04

    inc  [hl]                                     ; $4969: $34
    inc  [hl]                                     ; $496A: $34
    inc  [hl]                                     ; $496B: $34
    inc  [hl]                                     ; $496C: $34

jr_015_496D:
    dec  [hl]                                     ; $496D: $35
    dec  [hl]                                     ; $496E: $35
    ld   a, $00                                   ; $496F: $3E $00
    ld   [$D228], a                               ; $4971: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $4974: $C3 $0C $3B

    call ClearEntitySpeed                         ; $4977: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $497A: $CD $05 $0C
    jr   nz, jr_015_4990                          ; $497D: $20 $11

label_015_497F:
    call label_BFB                                ; $497F: $CD $FB $0B
    call GetRandomByte                            ; $4982: $CD $0D $28
    and  $1F                                      ; $4985: $E6 $1F
    add  $20                                      ; $4987: $C6 $20
    ld   [hl], a                                  ; $4989: $77
    call IncrementEntityWalkingAttr               ; $498A: $CD $12 $3B
    ld   [hl], $02                                ; $498D: $36 $02
    ret                                           ; $498F: $C9

jr_015_4990:
    ldh  a, [hFrameCounter]                       ; $4990: $F0 $E7
    rra                                           ; $4992: $1F
    rra                                           ; $4993: $1F
    rra                                           ; $4994: $1F
    rra                                           ; $4995: $1F
    and  $01                                      ; $4996: $E6 $01
    ld   [$D227], a                               ; $4998: $EA $27 $D2
    ret                                           ; $499B: $C9

    call IncrementEntityWalkingAttr               ; $499C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $499F: $CD $05 $0C
    ld   [hl], $60                                ; $49A2: $36 $60
    ld   hl, wEntitiesSpeedXTable                       ; $49A4: $21 $40 $C2
    add  hl, bc                                   ; $49A7: $09
    ld   a, [hl]                                  ; $49A8: $7E
    ldh  [hLinkPositionXIncrement], a             ; $49A9: $E0 $9A
    ld   a, $28                                   ; $49AB: $3E $28
    ld   [$C13E], a                               ; $49AD: $EA $3E $C1
    ld   a, $40                                   ; $49B0: $3E $40
    ld   [$DBC7], a                               ; $49B2: $EA $C7 $DB
    ld   a, [wDB94]                               ; $49B5: $FA $94 $DB
    add  $08                                      ; $49B8: $C6 $08
    ld   [wDB94], a                               ; $49BA: $EA $94 $DB
    ld   a, $0B                                   ; $49BD: $3E $0B
    ldh  [hJingle], a                             ; $49BF: $E0 $F2
    ret                                           ; $49C1: $C9

    call ClearEntitySpeed                         ; $49C2: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $49C5: $CD $05 $0C
    jr   nz, jr_015_49CD                          ; $49C8: $20 $03

    jp   label_015_497F                           ; $49CA: $C3 $7F $49

jr_015_49CD:
    cp   $40                                      ; $49CD: $FE $40
    ld   a, $00                                   ; $49CF: $3E $00
    jr   nc, jr_015_49DC                          ; $49D1: $30 $09

    ldh  a, [hFrameCounter]                       ; $49D3: $F0 $E7
    rra                                           ; $49D5: $1F
    rra                                           ; $49D6: $1F
    rra                                           ; $49D7: $1F
    rra                                           ; $49D8: $1F
    rra                                           ; $49D9: $1F
    and  $01                                      ; $49DA: $E6 $01

jr_015_49DC:
    call SetEntitySpriteVariant                   ; $49DC: $CD $0C $3B
    ld   [$D228], a                               ; $49DF: $EA $28 $D2
    jp   label_015_4743                           ; $49E2: $C3 $43 $47

    ld   hl, sp-$04                               ; $49E5: $F8 $FC
    ld   d, h                                     ; $49E7: $54
    ld   [hl+], a                                 ; $49E8: $22
    ld   hl, sp+$04                               ; $49E9: $F8 $04
    ld   d, d                                     ; $49EB: $52
    ld   [hl+], a                                 ; $49EC: $22
    ld   hl, sp+$0C                               ; $49ED: $F8 $0C
    ld   d, b                                     ; $49EF: $50
    ld   [hl+], a                                 ; $49F0: $22
    rst  $30                                      ; $49F1: $F7
    db   $FC                                      ; $49F2: $FC
    ld   d, h                                     ; $49F3: $54
    ld   [hl+], a                                 ; $49F4: $22
    rst  $30                                      ; $49F5: $F7
    inc  b                                        ; $49F6: $04
    ld   d, d                                     ; $49F7: $52
    ld   [hl+], a                                 ; $49F8: $22
    rst  $30                                      ; $49F9: $F7
    inc  c                                        ; $49FA: $0C
    ld   d, b                                     ; $49FB: $50
    ld   [hl+], a                                 ; $49FC: $22
    ld   hl, sp-$04                               ; $49FD: $F8 $FC
    ld   d, b                                     ; $49FF: $50
    ld   [bc], a                                  ; $4A00: $02
    ld   hl, sp+$04                               ; $4A01: $F8 $04
    ld   d, d                                     ; $4A03: $52
    ld   [bc], a                                  ; $4A04: $02
    ld   hl, sp+$0C                               ; $4A05: $F8 $0C
    ld   d, h                                     ; $4A07: $54
    ld   [bc], a                                  ; $4A08: $02
    rst  $30                                      ; $4A09: $F7
    db   $FC                                      ; $4A0A: $FC
    ld   d, b                                     ; $4A0B: $50
    ld   [bc], a                                  ; $4A0C: $02
    rst  $30                                      ; $4A0D: $F7
    inc  b                                        ; $4A0E: $04
    ld   d, d                                     ; $4A0F: $52
    ld   [bc], a                                  ; $4A10: $02
    rst  $30                                      ; $4A11: $F7
    inc  c                                        ; $4A12: $0C
    ld   d, h                                     ; $4A13: $54
    ld   [bc], a                                  ; $4A14: $02
    nop                                           ; $4A15: $00
    db   $FC                                      ; $4A16: $FC
    ld   d, [hl]                                  ; $4A17: $56
    ld   [bc], a                                  ; $4A18: $02
    nop                                           ; $4A19: $00
    inc  b                                        ; $4A1A: $04
    ld   e, b                                     ; $4A1B: $58
    ld   [bc], a                                  ; $4A1C: $02
    nop                                           ; $4A1D: $00
    inc  c                                        ; $4A1E: $0C
    ld   e, d                                     ; $4A1F: $5A
    ld   [bc], a                                  ; $4A20: $02
    nop                                           ; $4A21: $00
    db   $FC                                      ; $4A22: $FC
    ld   e, h                                     ; $4A23: $5C
    ld   [bc], a                                  ; $4A24: $02
    nop                                           ; $4A25: $00
    inc  b                                        ; $4A26: $04
    ld   e, b                                     ; $4A27: $58
    ld   [bc], a                                  ; $4A28: $02
    nop                                           ; $4A29: $00
    inc  c                                        ; $4A2A: $0C
    ld   e, [hl]                                  ; $4A2B: $5E
    ld   [bc], a                                  ; $4A2C: $02
    nop                                           ; $4A2D: $00
    db   $FC                                      ; $4A2E: $FC
    ld   e, h                                     ; $4A2F: $5C
    ld   [bc], a                                  ; $4A30: $02
    nop                                           ; $4A31: $00
    inc  b                                        ; $4A32: $04
    ld   e, b                                     ; $4A33: $58
    ld   [bc], a                                  ; $4A34: $02
    nop                                           ; $4A35: $00
    inc  c                                        ; $4A36: $0C
    ld   e, d                                     ; $4A37: $5A
    ld   [bc], a                                  ; $4A38: $02
    nop                                           ; $4A39: $00
    db   $FC                                      ; $4A3A: $FC
    ld   d, [hl]                                  ; $4A3B: $56
    ld   [bc], a                                  ; $4A3C: $02
    nop                                           ; $4A3D: $00
    inc  b                                        ; $4A3E: $04
    ld   e, b                                     ; $4A3F: $58
    ld   [bc], a                                  ; $4A40: $02
    nop                                           ; $4A41: $00
    inc  c                                        ; $4A42: $0C
    ld   e, [hl]                                  ; $4A43: $5E
    ld   [bc], a                                  ; $4A44: $02
    nop                                           ; $4A45: $00
    db   $FC                                      ; $4A46: $FC
    ld   [hl], b                                  ; $4A47: $70
    ld   [bc], a                                  ; $4A48: $02
    nop                                           ; $4A49: $00
    inc  b                                        ; $4A4A: $04
    ld   [hl], d                                  ; $4A4B: $72
    ld   [bc], a                                  ; $4A4C: $02
    nop                                           ; $4A4D: $00
    inc  c                                        ; $4A4E: $0C
    ld   [hl], h                                  ; $4A4F: $74
    ld   [bc], a                                  ; $4A50: $02
    ld   bc, $70FC                                ; $4A51: $01 $FC $70
    ld   [bc], a                                  ; $4A54: $02
    nop                                           ; $4A55: $00
    inc  b                                        ; $4A56: $04
    db   $76                                      ; $4A57: $76
    ld   [bc], a                                  ; $4A58: $02
    nop                                           ; $4A59: $00
    inc  c                                        ; $4A5A: $0C
    ld   a, b                                     ; $4A5B: $78
    ld   [bc], a                                  ; $4A5C: $02
    nop                                           ; $4A5D: $00
    db   $FC                                      ; $4A5E: $FC
    ld   e, d                                     ; $4A5F: $5A
    ld   [hl+], a                                 ; $4A60: $22
    nop                                           ; $4A61: $00
    inc  b                                        ; $4A62: $04
    ld   e, b                                     ; $4A63: $58
    ld   [hl+], a                                 ; $4A64: $22
    nop                                           ; $4A65: $00
    inc  c                                        ; $4A66: $0C
    ld   d, [hl]                                  ; $4A67: $56
    ld   [hl+], a                                 ; $4A68: $22
    nop                                           ; $4A69: $00
    db   $FC                                      ; $4A6A: $FC
    ld   e, [hl]                                  ; $4A6B: $5E
    ld   [hl+], a                                 ; $4A6C: $22
    nop                                           ; $4A6D: $00
    inc  b                                        ; $4A6E: $04
    ld   e, b                                     ; $4A6F: $58
    ld   [hl+], a                                 ; $4A70: $22
    nop                                           ; $4A71: $00
    inc  c                                        ; $4A72: $0C
    ld   e, h                                     ; $4A73: $5C
    ld   [hl+], a                                 ; $4A74: $22
    nop                                           ; $4A75: $00
    db   $FC                                      ; $4A76: $FC
    ld   e, d                                     ; $4A77: $5A
    ld   [hl+], a                                 ; $4A78: $22
    nop                                           ; $4A79: $00
    inc  b                                        ; $4A7A: $04
    ld   e, b                                     ; $4A7B: $58
    ld   [hl+], a                                 ; $4A7C: $22
    nop                                           ; $4A7D: $00
    inc  c                                        ; $4A7E: $0C
    ld   e, h                                     ; $4A7F: $5C
    ld   [hl+], a                                 ; $4A80: $22
    nop                                           ; $4A81: $00
    db   $FC                                      ; $4A82: $FC
    ld   e, [hl]                                  ; $4A83: $5E
    ld   [hl+], a                                 ; $4A84: $22
    nop                                           ; $4A85: $00
    inc  b                                        ; $4A86: $04
    ld   e, b                                     ; $4A87: $58
    ld   [hl+], a                                 ; $4A88: $22
    nop                                           ; $4A89: $00
    inc  c                                        ; $4A8A: $0C
    ld   d, [hl]                                  ; $4A8B: $56
    ld   [hl+], a                                 ; $4A8C: $22
    nop                                           ; $4A8D: $00
    db   $FC                                      ; $4A8E: $FC
    ld   [hl], h                                  ; $4A8F: $74
    ld   [hl+], a                                 ; $4A90: $22
    nop                                           ; $4A91: $00
    inc  b                                        ; $4A92: $04
    ld   [hl], d                                  ; $4A93: $72
    ld   [hl+], a                                 ; $4A94: $22
    nop                                           ; $4A95: $00
    inc  c                                        ; $4A96: $0C
    ld   [hl], b                                  ; $4A97: $70
    ld   [hl+], a                                 ; $4A98: $22
    nop                                           ; $4A99: $00
    db   $FC                                      ; $4A9A: $FC
    ld   a, b                                     ; $4A9B: $78
    ld   [hl+], a                                 ; $4A9C: $22
    nop                                           ; $4A9D: $00
    inc  b                                        ; $4A9E: $04
    db   $76                                      ; $4A9F: $76
    ld   [hl+], a                                 ; $4AA0: $22
    ld   bc, $700C                                ; $4AA1: $01 $0C $70
    ld   [hl+], a                                 ; $4AA4: $22
    nop                                           ; $4AA5: $00
    db   $FC                                      ; $4AA6: $FC
    ld   a, d                                     ; $4AA7: $7A
    ld   [bc], a                                  ; $4AA8: $02
    nop                                           ; $4AA9: $00
    inc  b                                        ; $4AAA: $04
    ld   a, h                                     ; $4AAB: $7C
    ld   [bc], a                                  ; $4AAC: $02
    nop                                           ; $4AAD: $00
    inc  c                                        ; $4AAE: $0C
    ld   a, [hl]                                  ; $4AAF: $7E
    ld   [bc], a                                  ; $4AB0: $02
    nop                                           ; $4AB1: $00
    db   $FC                                      ; $4AB2: $FC
    ld   a, [hl]                                  ; $4AB3: $7E
    ld   [hl+], a                                 ; $4AB4: $22
    nop                                           ; $4AB5: $00
    inc  b                                        ; $4AB6: $04
    ld   a, h                                     ; $4AB7: $7C
    ld   [hl+], a                                 ; $4AB8: $22
    nop                                           ; $4AB9: $00
    inc  c                                        ; $4ABA: $0C
    ld   a, d                                     ; $4ABB: $7A
    ld   [hl+], a                                 ; $4ABC: $22
    inc  c                                        ; $4ABD: $0C
    rst  $38                                      ; $4ABE: $FF
    ld   h, $02                                   ; $4ABF: $26 $02
    inc  c                                        ; $4AC1: $0C
    inc  b                                        ; $4AC2: $04
    ld   h, $02                                   ; $4AC3: $26 $02
    inc  c                                        ; $4AC5: $0C
    add  hl, bc                                   ; $4AC6: $09
    ld   h, $02                                   ; $4AC7: $26 $02

func_015_4AC9:
    ld   a, [$D227]                               ; $4AC9: $FA $27 $D2
    sla  a                                        ; $4ACC: $CB $27
    ld   e, a                                     ; $4ACE: $5F
    ld   a, [$D228]                               ; $4ACF: $FA $28 $D2
    cp   $FF                                      ; $4AD2: $FE $FF
    jr   z, jr_015_4AEB                           ; $4AD4: $28 $15

    add  e                                        ; $4AD6: $83
    rla                                           ; $4AD7: $17
    rla                                           ; $4AD8: $17
    and  $FC                                      ; $4AD9: $E6 $FC
    ld   e, a                                     ; $4ADB: $5F
    rla                                           ; $4ADC: $17
    and  $F8                                      ; $4ADD: $E6 $F8
    add  e                                        ; $4ADF: $83
    ld   e, a                                     ; $4AE0: $5F
    ld   d, b                                     ; $4AE1: $50
    ld   hl, $49E5                                ; $4AE2: $21 $E5 $49
    add  hl, de                                   ; $4AE5: $19
    ld   c, $03                                   ; $4AE6: $0E $03
    call label_3CE6                               ; $4AE8: $CD $E6 $3C

jr_015_4AEB:
    ldh  a, [hActiveEntitySpriteVariant]               ; $4AEB: $F0 $F1
    rla                                           ; $4AED: $17
    rla                                           ; $4AEE: $17
    and  $FC                                      ; $4AEF: $E6 $FC
    ld   e, a                                     ; $4AF1: $5F
    rla                                           ; $4AF2: $17
    and  $F8                                      ; $4AF3: $E6 $F8
    add  e                                        ; $4AF5: $83
    ld   e, a                                     ; $4AF6: $5F
    ld   d, b                                     ; $4AF7: $50
    ld   hl, $4A15                                ; $4AF8: $21 $15 $4A
    add  hl, de                                   ; $4AFB: $19
    ld   c, $03                                   ; $4AFC: $0E $03
    call label_3CE6                               ; $4AFE: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $4B01: $21 $10 $C3
    add  hl, bc                                   ; $4B04: $09
    ld   a, [hl]                                  ; $4B05: $7E
    and  a                                        ; $4B06: $A7
    ret  z                                        ; $4B07: $C8

    ldh  a, [$FFEF]                               ; $4B08: $F0 $EF
    ldh  [wActiveEntityPosY], a                   ; $4B0A: $E0 $EC
    ld   hl, $4ABD                                ; $4B0C: $21 $BD $4A
    ld   c, $03                                   ; $4B0F: $0E $03
    call label_3CE6                               ; $4B11: $CD $E6 $3C

jr_015_4B14:
    jp   label_3D8A                               ; $4B14: $C3 $8A $3D

    add  sp, -$02                                 ; $4B17: $E8 $FE
    ld   [hl], h                                  ; $4B19: $74
    nop                                           ; $4B1A: $00
    add  sp, $06                                  ; $4B1B: $E8 $06
    ld   [hl], h                                  ; $4B1D: $74
    jr   nz, jr_015_4B14                          ; $4B1E: $20 $F4

    ld   bc, $0076                                ; $4B20: $01 $76 $00
    db   $F4                                      ; $4B23: $F4
    add  hl, bc                                   ; $4B24: $09
    db   $76                                      ; $4B25: $76
    jr   nz, jr_015_4B28                          ; $4B26: $20 $00

jr_015_4B28:
    nop                                           ; $4B28: $00
    halt                                          ; $4B29: $76 $00
    nop                                           ; $4B2B: $00

jr_015_4B2C:
    ld   [$2076], sp                              ; $4B2C: $08 $76 $20
    add  sp, $00                                  ; $4B2F: $E8 $00
    ld   [hl], h                                  ; $4B31: $74
    nop                                           ; $4B32: $00
    add  sp, $08                                  ; $4B33: $E8 $08
    ld   [hl], h                                  ; $4B35: $74
    jr   nz, jr_015_4B2C                          ; $4B36: $20 $F4

    nop                                           ; $4B38: $00
    halt                                          ; $4B39: $76 $00
    db   $F4                                      ; $4B3B: $F4
    ld   [$2076], sp                              ; $4B3C: $08 $76 $20
    nop                                           ; $4B3F: $00
    nop                                           ; $4B40: $00
    halt                                          ; $4B41: $76 $00
    nop                                           ; $4B43: $00

jr_015_4B44:
    ld   [$2076], sp                              ; $4B44: $08 $76 $20
    add  sp, $02                                  ; $4B47: $E8 $02
    ld   [hl], h                                  ; $4B49: $74
    nop                                           ; $4B4A: $00
    add  sp, $0A                                  ; $4B4B: $E8 $0A
    ld   [hl], h                                  ; $4B4D: $74
    jr   nz, jr_015_4B44                          ; $4B4E: $20 $F4

    rst  $38                                      ; $4B50: $FF
    halt                                          ; $4B51: $76 $00
    db   $F4                                      ; $4B53: $F4
    rlca                                          ; $4B54: $07
    db   $76                                      ; $4B55: $76
    jr   nz, jr_015_4B58                          ; $4B56: $20 $00

jr_015_4B58:
    nop                                           ; $4B58: $00
    halt                                          ; $4B59: $76 $00
    nop                                           ; $4B5B: $00

jr_015_4B5C:
    ld   [$2076], sp                              ; $4B5C: $08 $76 $20
    add  sp, $00                                  ; $4B5F: $E8 $00
    ld   [hl], h                                  ; $4B61: $74
    nop                                           ; $4B62: $00
    add  sp, $08                                  ; $4B63: $E8 $08
    ld   [hl], h                                  ; $4B65: $74
    jr   nz, jr_015_4B5C                          ; $4B66: $20 $F4

    nop                                           ; $4B68: $00
    halt                                          ; $4B69: $76 $00
    db   $F4                                      ; $4B6B: $F4
    ld   [$2076], sp                              ; $4B6C: $08 $76 $20
    nop                                           ; $4B6F: $00
    nop                                           ; $4B70: $00
    halt                                          ; $4B71: $76 $00
    nop                                           ; $4B73: $00
    ld   [$2076], sp                              ; $4B74: $08 $76 $20
    db   $F4                                      ; $4B77: $F4
    rst  $38                                      ; $4B78: $FF
    ld   [hl], h                                  ; $4B79: $74
    nop                                           ; $4B7A: $00
    db   $F4                                      ; $4B7B: $F4
    rlca                                          ; $4B7C: $07
    ld   [hl], h                                  ; $4B7D: $74
    jr   nz, jr_015_4B80                          ; $4B7E: $20 $00

jr_015_4B80:
    nop                                           ; $4B80: $00
    halt                                          ; $4B81: $76 $00
    nop                                           ; $4B83: $00
    ld   [$2076], sp                              ; $4B84: $08 $76 $20
    db   $F4                                      ; $4B87: $F4
    nop                                           ; $4B88: $00
    ld   [hl], h                                  ; $4B89: $74
    nop                                           ; $4B8A: $00
    db   $F4                                      ; $4B8B: $F4
    ld   [$2074], sp                              ; $4B8C: $08 $74 $20
    nop                                           ; $4B8F: $00
    nop                                           ; $4B90: $00
    halt                                          ; $4B91: $76 $00
    nop                                           ; $4B93: $00
    ld   [$2076], sp                              ; $4B94: $08 $76 $20
    db   $F4                                      ; $4B97: $F4
    ld   bc, $0074                                ; $4B98: $01 $74 $00
    db   $F4                                      ; $4B9B: $F4
    add  hl, bc                                   ; $4B9C: $09
    ld   [hl], h                                  ; $4B9D: $74
    jr   nz, jr_015_4BA0                          ; $4B9E: $20 $00

jr_015_4BA0:
    nop                                           ; $4BA0: $00
    halt                                          ; $4BA1: $76 $00
    nop                                           ; $4BA3: $00
    ld   [$2076], sp                              ; $4BA4: $08 $76 $20
    db   $F4                                      ; $4BA7: $F4
    nop                                           ; $4BA8: $00
    ld   [hl], h                                  ; $4BA9: $74
    nop                                           ; $4BAA: $00
    db   $F4                                      ; $4BAB: $F4
    ld   [$2074], sp                              ; $4BAC: $08 $74 $20
    nop                                           ; $4BAF: $00
    nop                                           ; $4BB0: $00
    halt                                          ; $4BB1: $76 $00
    nop                                           ; $4BB3: $00
    ld   [$2076], sp                              ; $4BB4: $08 $76 $20
    nop                                           ; $4BB7: $00
    rst  $38                                      ; $4BB8: $FF
    ld   [hl], h                                  ; $4BB9: $74
    nop                                           ; $4BBA: $00
    nop                                           ; $4BBB: $00
    rlca                                          ; $4BBC: $07
    ld   [hl], h                                  ; $4BBD: $74
    jr   nz, jr_015_4BC0                          ; $4BBE: $20 $00

jr_015_4BC0:
    nop                                           ; $4BC0: $00
    ld   [hl], h                                  ; $4BC1: $74
    nop                                           ; $4BC2: $00
    nop                                           ; $4BC3: $00
    ld   [$2074], sp                              ; $4BC4: $08 $74 $20
    nop                                           ; $4BC7: $00
    ld   bc, $0074                                ; $4BC8: $01 $74 $00
    nop                                           ; $4BCB: $00
    add  hl, bc                                   ; $4BCC: $09
    ld   [hl], h                                  ; $4BCD: $74
    jr   nz, jr_015_4BD0                          ; $4BCE: $20 $00

jr_015_4BD0:
    nop                                           ; $4BD0: $00
    ld   [hl], h                                  ; $4BD1: $74
    nop                                           ; $4BD2: $00
    nop                                           ; $4BD3: $00
    ld   [$2074], sp                              ; $4BD4: $08 $74 $20
    ld   a, [$00FC]                               ; $4BD7: $FA $FC $00
    inc  b                                        ; $4BDA: $04
    ld   b, $04                                   ; $4BDB: $06 $04
    nop                                           ; $4BDD: $00
    db   $FC                                      ; $4BDE: $FC
    db   $FA, $FC                                 ; $4BDF: $FA $FC

PokeyEntityHandler::
    db   $21
    or   b                                        ; $4BE2: $B0
    jp   nz, label_015_7E09                       ; $4BE3: $C2 $09 $7E

    and  a                                        ; $4BE6: $A7
    jp   nz, $4CD9                                ; $4BE7: $C2 $D9 $4C

    call func_015_4C85                            ; $4BEA: $CD $85 $4C
    call func_015_7B0D                            ; $4BED: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $4BF0: $21 $D0 $C3
    add  hl, bc                                   ; $4BF3: $09
    ld   a, [hl]                                  ; $4BF4: $7E
    cp   $02                                      ; $4BF5: $FE $02
    jr   nc, jr_015_4C49                          ; $4BF7: $30 $50

    ld   hl, wEntitiesHealthTable                 ; $4BF9: $21 $60 $C3
    add  hl, bc                                   ; $4BFC: $09
    ld   [hl], $02                                ; $4BFD: $36 $02
    ld   hl, wEntitiesUnknowTableU                ; $4BFF: $21 $20 $C4
    add  hl, bc                                   ; $4C02: $09
    ld   a, [hl]                                  ; $4C03: $7E
    cp   $14                                      ; $4C04: $FE $14
    jr   nz, jr_015_4C49                          ; $4C06: $20 $41

    dec  [hl]                                     ; $4C08: $35
    ld   hl, wEntitiesUnknowTableY                ; $4C09: $21 $D0 $C3
    add  hl, bc                                   ; $4C0C: $09
    inc  [hl]                                     ; $4C0D: $34
    ld   a, $E3                                   ; $4C0E: $3E $E3
    call func_003_64CA_trampoline                               ; $4C10: $CD $86 $3B
    jr   c, jr_015_4C49                           ; $4C13: $38 $34

    ldh  a, [hScratch0]                           ; $4C15: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4C17: $21 $00 $C2
    add  hl, de                                   ; $4C1A: $19
    ld   [hl], a                                  ; $4C1B: $77
    ldh  a, [hScratch1]                           ; $4C1C: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $4C1E: $21 $10 $C2
    add  hl, de                                   ; $4C21: $19
    ld   [hl], a                                  ; $4C22: $77
    ld   hl, wEntitiesUnknownTableB               ; $4C23: $21 $B0 $C2
    add  hl, de                                   ; $4C26: $19
    inc  [hl]                                     ; $4C27: $34
    push bc                                       ; $4C28: $C5
    ld   c, e                                     ; $4C29: $4B
    ld   b, d                                     ; $4C2A: $42
    ld   a, $20                                   ; $4C2B: $3E $20
    call GetVectorTowardsLink_trampoline          ; $4C2D: $CD $B5 $3B
    ldh  a, [hScratch1]                           ; $4C30: $F0 $D8
    cpl                                           ; $4C32: $2F
    inc  a                                        ; $4C33: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $4C34: $21 $40 $C2
    add  hl, bc                                   ; $4C37: $09
    ld   [hl], a                                  ; $4C38: $77
    ldh  a, [hScratch0]                           ; $4C39: $F0 $D7
    cpl                                           ; $4C3B: $2F
    inc  a                                        ; $4C3C: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $4C3D: $21 $50 $C2
    add  hl, bc                                   ; $4C40: $09
    ld   [hl], a                                  ; $4C41: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $4C42: $21 $E0 $C2
    add  hl, bc                                   ; $4C45: $09
    ld   [hl], $18                                ; $4C46: $36 $18
    pop  bc                                       ; $4C48: $C1

jr_015_4C49:
    call label_C56                                ; $4C49: $CD $56 $0C
    call label_3B39                               ; $4C4C: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $4C4F: $F0 $E7
    rra                                           ; $4C51: $1F
    rra                                           ; $4C52: $1F
    rra                                           ; $4C53: $1F
    nop                                           ; $4C54: $00
    and  $03                                      ; $4C55: $E6 $03
    call SetEntitySpriteVariant                   ; $4C57: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $4C5A: $CD $05 $0C
    jr   nz, jr_015_4C7F                          ; $4C5D: $20 $20

    call GetRandomByte                            ; $4C5F: $CD $0D $28
    and  $3F                                      ; $4C62: $E6 $3F
    add  $30                                      ; $4C64: $C6 $30
    ld   [hl], a                                  ; $4C66: $77
    and  $07                                      ; $4C67: $E6 $07
    ld   e, a                                     ; $4C69: $5F
    ld   d, b                                     ; $4C6A: $50
    ld   hl, $4BD9                                ; $4C6B: $21 $D9 $4B
    add  hl, de                                   ; $4C6E: $19
    ld   a, [hl]                                  ; $4C6F: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4C70: $21 $40 $C2
    add  hl, bc                                   ; $4C73: $09
    ld   [hl], a                                  ; $4C74: $77
    ld   hl, $4BD7                                ; $4C75: $21 $D7 $4B
    add  hl, de                                   ; $4C78: $19
    ld   a, [hl]                                  ; $4C79: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4C7A: $21 $50 $C2
    add  hl, bc                                   ; $4C7D: $09
    ld   [hl], a                                  ; $4C7E: $77

jr_015_4C7F:
    call func_015_7B88                            ; $4C7F: $CD $88 $7B
    jp   label_3B23                               ; $4C82: $C3 $23 $3B

func_015_4C85:
    ld   d, b                                     ; $4C85: $50
    ld   hl, wEntitiesUnknowTableY                ; $4C86: $21 $D0 $C3
    add  hl, bc                                   ; $4C89: $09
    ld   a, [hl]                                  ; $4C8A: $7E
    and  a                                        ; $4C8B: $A7
    jr   nz, jr_015_4CA9                          ; $4C8C: $20 $1B

    ldh  a, [hActiveEntitySpriteVariant]               ; $4C8E: $F0 $F1
    rla                                           ; $4C90: $17
    rla                                           ; $4C91: $17
    rla                                           ; $4C92: $17
    and  $F8                                      ; $4C93: $E6 $F8
    ld   e, a                                     ; $4C95: $5F
    rla                                           ; $4C96: $17
    and  $F0                                      ; $4C97: $E6 $F0
    add  e                                        ; $4C99: $83
    ld   e, a                                     ; $4C9A: $5F
    ld   hl, $4B17                                ; $4C9B: $21 $17 $4B
    add  hl, de                                   ; $4C9E: $19
    ld   c, $06                                   ; $4C9F: $0E $06
    call label_3CE6                               ; $4CA1: $CD $E6 $3C
    ld   a, $04                                   ; $4CA4: $3E $04
    jp   label_3DA0                               ; $4CA6: $C3 $A0 $3D

jr_015_4CA9:
    cp   $02                                      ; $4CA9: $FE $02
    jr   z, jr_015_4CC4                           ; $4CAB: $28 $17

    ldh  a, [hActiveEntitySpriteVariant]               ; $4CAD: $F0 $F1
    rla                                           ; $4CAF: $17
    rla                                           ; $4CB0: $17
    rla                                           ; $4CB1: $17
    rla                                           ; $4CB2: $17
    and  $F0                                      ; $4CB3: $E6 $F0
    ld   e, a                                     ; $4CB5: $5F
    ld   hl, $4B77                                ; $4CB6: $21 $77 $4B
    add  hl, de                                   ; $4CB9: $19
    ld   c, $04                                   ; $4CBA: $0E $04
    call label_3CE6                               ; $4CBC: $CD $E6 $3C
    ld   a, $02                                   ; $4CBF: $3E $02
    jp   label_3DA0                               ; $4CC1: $C3 $A0 $3D

jr_015_4CC4:
    ldh  a, [hActiveEntitySpriteVariant]               ; $4CC4: $F0 $F1
    rla                                           ; $4CC6: $17
    rla                                           ; $4CC7: $17
    rla                                           ; $4CC8: $17
    and  $F8                                      ; $4CC9: $E6 $F8
    ld   e, a                                     ; $4CCB: $5F
    ld   hl, $4BB7                                ; $4CCC: $21 $B7 $4B
    add  hl, de                                   ; $4CCF: $19
    ld   c, $02                                   ; $4CD0: $0E $02
    jp   label_3CE6                               ; $4CD2: $C3 $E6 $3C

    halt                                          ; $4CD5: $76 $00
    db   $76                                      ; $4CD7: $76
    jr   nz, @+$13                                ; $4CD8: $20 $11

    push de                                       ; $4CDA: $D5
    ld   c, h                                     ; $4CDB: $4C
    call RenderAnimatedActiveEntity                               ; $4CDC: $CD $C0 $3B
    call func_015_7B0D                            ; $4CDF: $CD $0D $7B
    call func_015_7B3E                            ; $4CE2: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4CE5: $CD $05 $0C
    jr   nz, jr_015_4CED                          ; $4CE8: $20 $03

    call label_3B39                               ; $4CEA: $CD $39 $3B

jr_015_4CED:
    call func_015_7B88                            ; $4CED: $CD $88 $7B
    call label_3B23                               ; $4CF0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4CF3: $21 $A0 $C2
    add  hl, bc                                   ; $4CF6: $09
    ld   a, [hl]                                  ; $4CF7: $7E
    and  $03                                      ; $4CF8: $E6 $03
    jr   z, jr_015_4D03                           ; $4CFA: $28 $07

    ld   hl, wEntitiesSpeedXTable                       ; $4CFC: $21 $40 $C2
    call func_015_4D0F                            ; $4CFF: $CD $0F $4D
    ret  c                                        ; $4D02: $D8

jr_015_4D03:
    ld   hl, wEntitiesCollisionsTable             ; $4D03: $21 $A0 $C2
    add  hl, bc                                   ; $4D06: $09
    ld   a, [hl]                                  ; $4D07: $7E
    and  $0C                                      ; $4D08: $E6 $0C
    jr   z, jr_015_4D39                           ; $4D0A: $28 $2D

    ld   hl, wEntitiesSpeedYTable                       ; $4D0C: $21 $50 $C2

func_015_4D0F:
    add  hl, bc                                   ; $4D0F: $09
    ld   a, [hl]                                  ; $4D10: $7E
    cpl                                           ; $4D11: $2F
    inc  a                                        ; $4D12: $3C
    ld   [hl], a                                  ; $4D13: $77
    ld   a, $09                                   ; $4D14: $3E $09
    ldh  [hJingle], a                             ; $4D16: $E0 $F2
    ld   hl, wEntitiesUnknowTableY                ; $4D18: $21 $D0 $C3
    add  hl, bc                                   ; $4D1B: $09
    ld   a, [hl]                                  ; $4D1C: $7E
    inc  a                                        ; $4D1D: $3C
    ld   [hl], a                                  ; $4D1E: $77
    cp   $03                                      ; $4D1F: $FE $03
    jr   c, jr_015_4D39                           ; $4D21: $38 $16

    ldh  a, [wActiveEntityPosX]                   ; $4D23: $F0 $EE
    ldh  [hScratch0], a                           ; $4D25: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4D27: $F0 $EC
    ldh  [hScratch1], a                           ; $4D29: $E0 $D8
    ld   a, $02                                   ; $4D2B: $3E $02
    call label_CC7                                ; $4D2D: $CD $C7 $0C
    ld   a, $2F                                   ; $4D30: $3E $2F
    ldh  [hJingle], a                             ; $4D32: $E0 $F2
    call ClearEntityStatus                        ; $4D34: $CD $31 $7C
    scf                                           ; $4D37: $37
    ret                                           ; $4D38: $C9

jr_015_4D39:
    and  a                                        ; $4D39: $A7
    ret                                           ; $4D3A: $C9

    ld   [hl], b                                  ; $4D3B: $70
    ld   [bc], a                                  ; $4D3C: $02
    ld   [hl], b                                  ; $4D3D: $70
    ld   [hl+], a                                 ; $4D3E: $22
    ld   [hl], d                                  ; $4D3F: $72
    inc  bc                                       ; $4D40: $03
    ld   [hl], d                                  ; $4D41: $72
    inc  hl                                       ; $4D42: $23

FlameShooterEntityHandler::
    ld   hl, wEntitiesUnknownTableB               ; $4D43: $21 $B0 $C2
    add  hl, bc                                   ; $4D46: $09
    ld   a, [hl]                                  ; $4D47: $7E
    and  a                                        ; $4D48: $A7
    jp   nz, label_015_4DB5                       ; $4D49: $C2 $B5 $4D

    ld   de, $4D3B                                ; $4D4C: $11 $3B $4D
    call RenderAnimatedActiveEntity                               ; $4D4F: $CD $C0 $3B
    call IsEntityUnknownFZero                     ; $4D52: $CD $00 $0C
    ld   e, $00                                   ; $4D55: $1E $00
    and  a                                        ; $4D57: $A7
    jr   z, jr_015_4D5B                           ; $4D58: $28 $01

    inc  e                                        ; $4D5A: $1C

jr_015_4D5B:
    ld   a, e                                     ; $4D5B: $7B
    call SetEntitySpriteVariant                   ; $4D5C: $CD $0C $3B
    call func_015_7B0D                            ; $4D5F: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $4D62: $21 $D0 $C3
    add  hl, bc                                   ; $4D65: $09
    inc  [hl]                                     ; $4D66: $34
    ld   a, [hl]                                  ; $4D67: $7E
    and  $0F                                      ; $4D68: $E6 $0F
    jr   nz, jr_015_4D9C                          ; $4D6A: $20 $30

    call IsEntityUnknownFZero                     ; $4D6C: $CD $00 $0C
    ld   [hl], $08                                ; $4D6F: $36 $08
    ld   a, $E2                                   ; $4D71: $3E $E2
    call func_003_64CA_trampoline                               ; $4D73: $CD $86 $3B
    ret  c                                        ; $4D76: $D8

    ld   a, $12                                   ; $4D77: $3E $12
    ldh  [hNoiseSfx], a                           ; $4D79: $E0 $F4
    ldh  a, [hScratch0]                           ; $4D7B: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4D7D: $21 $00 $C2
    add  hl, de                                   ; $4D80: $19
    ld   [hl], a                                  ; $4D81: $77
    ldh  a, [hScratch1]                           ; $4D82: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $4D84: $21 $10 $C2
    add  hl, de                                   ; $4D87: $19
    add  $04                                      ; $4D88: $C6 $04
    ld   [hl], a                                  ; $4D8A: $77
    ld   hl, wEntitiesUnknownTableB               ; $4D8B: $21 $B0 $C2
    add  hl, de                                   ; $4D8E: $19
    inc  [hl]                                     ; $4D8F: $34
    ld   hl, wEntitiesSpeedYTable                       ; $4D90: $21 $50 $C2
    add  hl, de                                   ; $4D93: $19
    ld   [hl], $10                                ; $4D94: $36 $10
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D96: $21 $E0 $C2
    add  hl, de                                   ; $4D99: $19
    ld   [hl], $30                                ; $4D9A: $36 $30

jr_015_4D9C:
    ret                                           ; $4D9C: $C9

    ld   a, b                                     ; $4D9D: $78
    ld   [bc], a                                  ; $4D9E: $02
    ld   a, b                                     ; $4D9F: $78
    ld   [hl+], a                                 ; $4DA0: $22
    db   $76                                      ; $4DA1: $76
    ld   [bc], a                                  ; $4DA2: $02
    db   $76                                      ; $4DA3: $76
    ld   [hl+], a                                 ; $4DA4: $22
    ld   [hl], h                                  ; $4DA5: $74
    ld   [bc], a                                  ; $4DA6: $02
    ld   [hl], h                                  ; $4DA7: $74
    ld   [hl+], a                                 ; $4DA8: $22
    ld   a, d                                     ; $4DA9: $7A
    ld   [bc], a                                  ; $4DAA: $02
    ld   a, h                                     ; $4DAB: $7C
    ld   [bc], a                                  ; $4DAC: $02
    ld   a, h                                     ; $4DAD: $7C
    ld   [hl+], a                                 ; $4DAE: $22
    ld   a, d                                     ; $4DAF: $7A
    ld   [hl+], a                                 ; $4DB0: $22
    db   $FC                                      ; $4DB1: $FC
    inc  b                                        ; $4DB2: $04
    db   $F4                                      ; $4DB3: $F4
    inc  c                                        ; $4DB4: $0C

label_015_4DB5:
    cp   $02                                      ; $4DB5: $FE $02
    jp   z, label_015_4E62                        ; $4DB7: $CA $62 $4E

    ldh  a, [hFrameCounter]                       ; $4DBA: $F0 $E7
    rla                                           ; $4DBC: $17
    rla                                           ; $4DBD: $17
    and  $10                                      ; $4DBE: $E6 $10
    ldh  [$FFED], a                               ; $4DC0: $E0 $ED
    ld   de, $4D9D                                ; $4DC2: $11 $9D $4D
    call RenderAnimatedActiveEntity                               ; $4DC5: $CD $C0 $3B
    call func_015_7B0D                            ; $4DC8: $CD $0D $7B
    call label_C56                                ; $4DCB: $CD $56 $0C
    call label_3B70                               ; $4DCE: $CD $70 $3B
    ld   a, [$DBC7]                               ; $4DD1: $FA $C7 $DB
    push af                                       ; $4DD4: $F5
    call label_3B5A                               ; $4DD5: $CD $5A $3B
    pop  af                                       ; $4DD8: $F1
    ld   e, a                                     ; $4DD9: $5F
    ld   a, [$DBC7]                               ; $4DDA: $FA $C7 $DB
    cp   e                                        ; $4DDD: $BB
    jr   z, jr_015_4DF2                           ; $4DDE: $28 $12

    cp   $20                                      ; $4DE0: $FE $20
    jr   c, jr_015_4DF2                           ; $4DE2: $38 $0E

    ld   a, $1F                                   ; $4DE4: $3E $1F
    ld   [$DBC7], a                               ; $4DE6: $EA $C7 $DB
    ld   a, $30                                   ; $4DE9: $3E $30
    call GetVectorTowardsLink_trampoline          ; $4DEB: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4DEE: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $4DF0: $E0 $9B

jr_015_4DF2:
    call func_015_7B8B                            ; $4DF2: $CD $8B $7B
    ldh  a, [hActiveEntityState]                  ; $4DF5: $F0 $F0
    and  a                                        ; $4DF7: $A7
    jr   z, jr_015_4E49                           ; $4DF8: $28 $4F

    xor  a                                        ; $4DFA: $AF

jr_015_4DFB:
    ldh  [hFFE8], a                               ; $4DFB: $E0 $E8
    ld   a, $E2                                   ; $4DFD: $3E $E2
    call func_003_64CA_trampoline                               ; $4DFF: $CD $86 $3B
    jr   c, jr_015_4E46                           ; $4E02: $38 $42

    ld   hl, wEntitiesUnknownTableB               ; $4E04: $21 $B0 $C2
    add  hl, de                                   ; $4E07: $19
    ld   [hl], $02                                ; $4E08: $36 $02
    push bc                                       ; $4E0A: $C5
    ldh  a, [hFFE8]                               ; $4E0B: $F0 $E8
    ld   c, a                                     ; $4E0D: $4F
    ld   hl, wEntitiesSpriteVariantTable               ; $4E0E: $21 $B0 $C3
    add  hl, de                                   ; $4E11: $19
    ld   [hl], a                                  ; $4E12: $77
    ld   hl, $4DB1                                ; $4E13: $21 $B1 $4D
    add  hl, bc                                   ; $4E16: $09
    ldh  a, [hScratch0]                           ; $4E17: $F0 $D7
    add  [hl]                                     ; $4E19: $86
    ld   hl, wEntitiesPosXTable                         ; $4E1A: $21 $00 $C2
    add  hl, de                                   ; $4E1D: $19
    ld   [hl], a                                  ; $4E1E: $77
    ld   hl, $4DB3                                ; $4E1F: $21 $B3 $4D
    add  hl, bc                                   ; $4E22: $09
    ld   a, [hl]                                  ; $4E23: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4E24: $21 $40 $C2
    add  hl, de                                   ; $4E27: $19
    ld   [hl], a                                  ; $4E28: $77
    ldh  a, [hScratch1]                           ; $4E29: $F0 $D8
    add  $00                                      ; $4E2B: $C6 $00
    ld   hl, wEntitiesPosYTable                         ; $4E2D: $21 $10 $C2
    add  hl, de                                   ; $4E30: $19
    ld   [hl], a                                  ; $4E31: $77
    ld   hl, wEntitiesSpeedYTable                       ; $4E32: $21 $50 $C2
    add  hl, de                                   ; $4E35: $19
    ld   [hl], $0C                                ; $4E36: $36 $0C
    ld   hl, wEntitiesTransitionCountdownTable    ; $4E38: $21 $E0 $C2
    add  hl, de                                   ; $4E3B: $19
    ld   [hl], $20                                ; $4E3C: $36 $20
    pop  bc                                       ; $4E3E: $C1
    ldh  a, [hFFE8]                               ; $4E3F: $F0 $E8
    inc  a                                        ; $4E41: $3C
    cp   $02                                      ; $4E42: $FE $02
    jr   c, jr_015_4DFB                           ; $4E44: $38 $B5

jr_015_4E46:
    jp   ClearEntityStatusAndReturn               ; $4E46: $C3 $31 $7C

jr_015_4E49:
    call GetEntityTransitionCountdown             ; $4E49: $CD $05 $0C
    jp   z, ClearEntityStatusAndReturn            ; $4E4C: $CA $31 $7C

    ld   hl, wEntitiesSpriteVariantTable               ; $4E4F: $21 $B0 $C3
    add  hl, bc                                   ; $4E52: $09
    cp   $10                                      ; $4E53: $FE $10
    jr   z, jr_015_4E5B                           ; $4E55: $28 $04

    cp   $20                                      ; $4E57: $FE $20
    jr   nz, jr_015_4E61                          ; $4E59: $20 $06

jr_015_4E5B:
    ld   a, [hl]                                  ; $4E5B: $7E
    cp   $02                                      ; $4E5C: $FE $02
    jr   z, jr_015_4E61                           ; $4E5E: $28 $01

    inc  [hl]                                     ; $4E60: $34

jr_015_4E61:
    ret                                           ; $4E61: $C9

label_015_4E62:
    ldh  a, [hFrameCounter]                       ; $4E62: $F0 $E7
    rla                                           ; $4E64: $17
    rla                                           ; $4E65: $17
    and  $10                                      ; $4E66: $E6 $10
    ldh  [$FFED], a                               ; $4E68: $E0 $ED
    ld   de, $4DA9                                ; $4E6A: $11 $A9 $4D
    call RenderAnimatedActiveEntity                               ; $4E6D: $CD $C0 $3B
    call func_015_7B0D                            ; $4E70: $CD $0D $7B
    call func_015_7B88                            ; $4E73: $CD $88 $7B
    call GetEntityTransitionCountdown             ; $4E76: $CD $05 $0C
    jp   z, ClearEntityStatusAndReturn            ; $4E79: $CA $31 $7C

    ret                                           ; $4E7C: $C9

    ld   c, d                                     ; $4E7D: $4A
    ld   bc, $014c                                ; $4E7E: $01 $4C $01
    ld   c, h                                     ; $4E81: $4C
    ld   hl, $214A                                ; $4E82: $21 $4A $21
    ld   c, [hl]                                  ; $4E85: $4E
    ld   bc, clearC15FAndReturn                   ; $4E86: $01 $4E $21
    nop                                           ; $4E89: $00
    ld   b, $FA                                   ; $4E8A: $06 $FA
    ld   a, [$4806]                               ; $4E8C: $FA $06 $48
    ld   bc, $6148                                ; $4E8F: $01 $48 $61
    ld   c, b                                     ; $4E92: $48
    ld   b, c                                     ; $4E93: $41
    ld   c, b                                     ; $4E94: $48
    db   $21                                      ; $4E95: $21

StalfosEvasiveEntityHandler::
    db   $21, $B0                                 ; $4E96
    jp   nz, label_015_7E09                       ; $4E98: $C2 $09 $7E

    and  a                                        ; $4E9B: $A7
    jr   z, jr_015_4EEE                           ; $4E9C: $28 $50

    ld   de, $4E8E                                ; $4E9E: $11 $8E $4E
    call RenderAnimatedActiveEntity                               ; $4EA1: $CD $C0 $3B
    call func_015_7B0D                            ; $4EA4: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $4EA7: $F0 $E7
    rra                                           ; $4EA9: $1F
    rra                                           ; $4EAA: $1F
    rra                                           ; $4EAB: $1F
    and  $01                                      ; $4EAC: $E6 $01
    call SetEntitySpriteVariant                   ; $4EAE: $CD $0C $3B
    call func_015_7B88                            ; $4EB1: $CD $88 $7B
    call label_3B23                               ; $4EB4: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $4EB7: $21 $A0 $C2
    add  hl, bc                                   ; $4EBA: $09
    ld   a, [hl]                                  ; $4EBB: $7E
    and  a                                        ; $4EBC: $A7
    jp   nz, label_015_4ECB                       ; $4EBD: $C2 $CB $4E

    call label_3B39                               ; $4EC0: $CD $39 $3B
    ld   hl, wEntitiesUnknowTableT                ; $4EC3: $21 $10 $C4
    add  hl, bc                                   ; $4EC6: $09
    ld   a, [hl]                                  ; $4EC7: $7E
    and  a                                        ; $4EC8: $A7
    jr   z, jr_015_4EDF                           ; $4EC9: $28 $14

label_015_4ECB:
    ldh  a, [wActiveEntityPosX]                   ; $4ECB: $F0 $EE
    ldh  [hScratch0], a                           ; $4ECD: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $4ECF: $F0 $EC
    ldh  [hScratch1], a                           ; $4ED1: $E0 $D8
    ld   a, $07                                   ; $4ED3: $3E $07
    ldh  [hJingle], a                             ; $4ED5: $E0 $F2
    ld   a, $05                                   ; $4ED7: $3E $05
    call label_CC7                                ; $4ED9: $CD $C7 $0C
    jp   ClearEntityStatusAndReturn               ; $4EDC: $C3 $31 $7C

jr_015_4EDF:
    ldh  a, [wActiveEntityPosX]                   ; $4EDF: $F0 $EE
    cp   $A8                                      ; $4EE1: $FE $A8
    jp   nc, ClearEntityStatusAndReturn                       ; $4EE3: $D2 $31 $7C

    ldh  a, [wActiveEntityPosY]                   ; $4EE6: $F0 $EC
    cp   $84                                      ; $4EE8: $FE $84
    jp   nc, ClearEntityStatusAndReturn                       ; $4EEA: $D2 $31 $7C

    ret                                           ; $4EED: $C9

jr_015_4EEE:
    ld   de, $4E7D                                ; $4EEE: $11 $7D $4E
    call RenderAnimatedActiveEntity                               ; $4EF1: $CD $C0 $3B
    call func_015_7B0D                            ; $4EF4: $CD $0D $7B
    call func_015_7B3E                            ; $4EF7: $CD $3E $7B
    call GetEntityTransitionCountdown             ; $4EFA: $CD $05 $0C
    jr   nz, jr_015_4F02                          ; $4EFD: $20 $03

    call label_3B39                               ; $4EFF: $CD $39 $3B

jr_015_4F02:
    call IsEntityUnknownFZero                     ; $4F02: $CD $00 $0C
    cp   $01                                      ; $4F05: $FE $01
    jr   nz, jr_015_4F50                          ; $4F07: $20 $47

    ldh  a, [hMapId]                              ; $4F09: $F0 $F7
    cp   $03                                      ; $4F0B: $FE $03
    ret  c                                        ; $4F0D: $D8

    ld   a, $1E                                   ; $4F0E: $3E $1E
    call func_003_64CA_trampoline                               ; $4F10: $CD $86 $3B
    ret  c                                        ; $4F13: $D8

    ld   a, $0A                                   ; $4F14: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4F16: $E0 $F4
    ld   hl, wEntitiesUnknowTableT                ; $4F18: $21 $10 $C4
    add  hl, de                                   ; $4F1B: $19
    ld   [hl], b                                  ; $4F1C: $70
    ld   hl, wEntitiesUnknowTableL                ; $4F1D: $21 $40 $C3
    add  hl, de                                   ; $4F20: $19
    set  6, [hl]                                  ; $4F21: $CB $F6
    set  4, [hl]                                  ; $4F23: $CB $E6
    ld   hl, wEntitiesUnknowTableH                ; $4F25: $21 $30 $C4
    add  hl, de                                   ; $4F28: $19
    set  1, [hl]                                  ; $4F29: $CB $CE
    set  4, [hl]                                  ; $4F2B: $CB $E6
    ldh  a, [hScratch0]                           ; $4F2D: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $4F2F: $21 $00 $C2
    add  hl, de                                   ; $4F32: $19
    ld   [hl], a                                  ; $4F33: $77
    ldh  a, [hScratch1]                           ; $4F34: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $4F36: $21 $10 $C2
    add  hl, de                                   ; $4F39: $19
    ld   [hl], a                                  ; $4F3A: $77
    ldh  a, [hScratch3]                           ; $4F3B: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $4F3D: $21 $10 $C3
    add  hl, de                                   ; $4F40: $19
    ld   [hl], a                                  ; $4F41: $77
    ld   hl, wEntitiesUnknownTableB               ; $4F42: $21 $B0 $C2
    add  hl, de                                   ; $4F45: $19
    inc  [hl]                                     ; $4F46: $34
    push bc                                       ; $4F47: $C5
    ld   c, e                                     ; $4F48: $4B
    ld   b, d                                     ; $4F49: $42
    ld   a, $18                                   ; $4F4A: $3E $18
    call label_3BAA                               ; $4F4C: $CD $AA $3B
    pop  bc                                       ; $4F4F: $C1

jr_015_4F50:
    ld   hl, wEntitiesUnknowTableY                ; $4F50: $21 $D0 $C3
    add  hl, bc                                   ; $4F53: $09
    ld   a, [hl]                                  ; $4F54: $7E
    rst  $00                                      ; $4F55: $C7
    ld   e, d                                     ; $4F56: $5A
    ld   c, a                                     ; $4F57: $4F
    ld   a, [de]                                  ; $4F58: $1A
    ld   d, b                                     ; $4F59: $50
    call func_015_7B88                            ; $4F5A: $CD $88 $7B
    call label_3B23                               ; $4F5D: $CD $23 $3B
    ldh  a, [hJoypadState]                               ; $4F60: $F0 $CC
    and  $30                                      ; $4F62: $E6 $30
    jr   z, jr_015_4FAE                           ; $4F64: $28 $48

    call func_015_7BDB                            ; $4F66: $CD $DB $7B
    add  $24                                      ; $4F69: $C6 $24
    cp   $48                                      ; $4F6B: $FE $48
    jr   nc, jr_015_4FAE                          ; $4F6D: $30 $3F

    call func_015_7BEB                            ; $4F6F: $CD $EB $7B
    add  $24                                      ; $4F72: $C6 $24
    cp   $48                                      ; $4F74: $FE $48
    jr   nc, jr_015_4FAE                          ; $4F76: $30 $36

    call GetEntityTransitionCountdown             ; $4F78: $CD $05 $0C
    ld   [hl], $08                                ; $4F7B: $36 $08
    call IsEntityUnknownFZero                     ; $4F7D: $CD $00 $0C
    ld   [hl], b                                  ; $4F80: $70
    ld   hl, wEntitiesUnknowTableY                ; $4F81: $21 $D0 $C3
    add  hl, bc                                   ; $4F84: $09
    inc  [hl]                                     ; $4F85: $34
    ld   hl, wEntitiesSpeedZTable                 ; $4F86: $21 $20 $C3
    add  hl, bc                                   ; $4F89: $09
    ld   [hl], $15                                ; $4F8A: $36 $15
    ld   a, $24                                   ; $4F8C: $3E $24
    ldh  [hJingle], a                             ; $4F8E: $E0 $F2
    ld   a, $12                                   ; $4F90: $3E $12
    call GetVectorTowardsLink_trampoline          ; $4F92: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4F95: $F0 $D7
    cpl                                           ; $4F97: $2F
    inc  a                                        ; $4F98: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $4F99: $21 $50 $C2
    add  hl, bc                                   ; $4F9C: $09
    ld   [hl], a                                  ; $4F9D: $77
    ldh  a, [hScratch1]                           ; $4F9E: $F0 $D8
    cpl                                           ; $4FA0: $2F
    inc  a                                        ; $4FA1: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $4FA2: $21 $40 $C2
    add  hl, bc                                   ; $4FA5: $09
    ld   [hl], a                                  ; $4FA6: $77
    ld   hl, wEntitiesSpriteVariantTable               ; $4FA7: $21 $B0 $C3
    add  hl, bc                                   ; $4FAA: $09
    ld   [hl], $02                                ; $4FAB: $36 $02
    ret                                           ; $4FAD: $C9

jr_015_4FAE:
    ld   hl, wEntitiesCollisionsTable             ; $4FAE: $21 $A0 $C2
    add  hl, bc                                   ; $4FB1: $09
    ld   a, [hl]                                  ; $4FB2: $7E
    and  $03                                      ; $4FB3: $E6 $03
    jr   nz, jr_015_4FC6                          ; $4FB5: $20 $0F

    ld   a, [hl]                                  ; $4FB7: $7E
    and  $0C                                      ; $4FB8: $E6 $0C
    jr   z, jr_015_4FCE                           ; $4FBA: $28 $12

    ld   hl, wEntitiesSpeedYTable                       ; $4FBC: $21 $50 $C2
    add  hl, bc                                   ; $4FBF: $09
    ld   a, [hl]                                  ; $4FC0: $7E
    xor  $F0                                      ; $4FC1: $EE $F0
    ld   [hl], a                                  ; $4FC3: $77
    jr   jr_015_4FCE                              ; $4FC4: $18 $08

jr_015_4FC6:
    ld   hl, wEntitiesSpeedXTable                       ; $4FC6: $21 $40 $C2
    add  hl, bc                                   ; $4FC9: $09
    ld   a, [hl]                                  ; $4FCA: $7E
    xor  $F0                                      ; $4FCB: $EE $F0
    ld   [hl], a                                  ; $4FCD: $77

jr_015_4FCE:
    ld   hl, wEntitiesStateTable                  ; $4FCE: $21 $90 $C2
    add  hl, bc                                   ; $4FD1: $09
    ld   a, [hl]                                  ; $4FD2: $7E
    and  a                                        ; $4FD3: $A7
    jr   nz, jr_015_4FDD                          ; $4FD4: $20 $07

    call GetRandomByte                            ; $4FD6: $CD $0D $28
    and  $2F                                      ; $4FD9: $E6 $2F
    jr   nz, jr_015_500A                          ; $4FDB: $20 $2D

jr_015_4FDD:
    xor  a                                        ; $4FDD: $AF
    ld   hl, wEntitiesSpeedYTable                       ; $4FDE: $21 $50 $C2
    add  hl, bc                                   ; $4FE1: $09
    ld   [hl], a                                  ; $4FE2: $77
    call GetRandomByte                            ; $4FE3: $CD $0D $28
    and  $03                                      ; $4FE6: $E6 $03
    ld   e, a                                     ; $4FE8: $5F
    ld   d, b                                     ; $4FE9: $50
    ld   hl, $4E89                                ; $4FEA: $21 $89 $4E
    add  hl, de                                   ; $4FED: $19
    ld   a, [hl]                                  ; $4FEE: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4FEF: $21 $40 $C2
    add  hl, bc                                   ; $4FF2: $09
    ld   [hl], a                                  ; $4FF3: $77
    and  a                                        ; $4FF4: $A7
    jr   nz, jr_015_500A                          ; $4FF5: $20 $13

    call GetRandomByte                            ; $4FF7: $CD $0D $28
    and  $01                                      ; $4FFA: $E6 $01
    add  $03                                      ; $4FFC: $C6 $03
    ld   e, a                                     ; $4FFE: $5F
    ld   d, b                                     ; $4FFF: $50
    ld   hl, $4E89                                ; $5000: $21 $89 $4E
    add  hl, de                                   ; $5003: $19
    ld   a, [hl]                                  ; $5004: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5005: $21 $50 $C2
    add  hl, bc                                   ; $5008: $09
    ld   [hl], a                                  ; $5009: $77

jr_015_500A:
    ld   hl, wEntitiesStateTable                  ; $500A: $21 $90 $C2
    add  hl, bc                                   ; $500D: $09
    xor  a                                        ; $500E: $AF
    ld   [hl], a                                  ; $500F: $77
    ldh  a, [hFrameCounter]                       ; $5010: $F0 $E7
    rra                                           ; $5012: $1F
    rra                                           ; $5013: $1F
    rra                                           ; $5014: $1F
    and  $01                                      ; $5015: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5017: $C3 $0C $3B

    call func_015_7B88                            ; $501A: $CD $88 $7B
    ld   hl, wEntitiesUnknowTableT                ; $501D: $21 $10 $C4
    add  hl, bc                                   ; $5020: $09
    ld   a, [hl]                                  ; $5021: $7E
    push hl                                       ; $5022: $E5
    ld   [hl], $01                                ; $5023: $36 $01
    call label_3B23                               ; $5025: $CD $23 $3B
    pop  hl                                       ; $5028: $E1
    ld   [hl], b                                  ; $5029: $70
    call func_015_7BC1                            ; $502A: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $502D: $21 $20 $C3
    add  hl, bc                                   ; $5030: $09
    dec  [hl]                                     ; $5031: $35
    ld   hl, wEntitiesPosZTable                   ; $5032: $21 $10 $C3
    add  hl, bc                                   ; $5035: $09
    ld   a, [hl]                                  ; $5036: $7E
    and  $80                                      ; $5037: $E6 $80
    jr   z, jr_015_5057                           ; $5039: $28 $1C

    ld   [hl], b                                  ; $503B: $70
    ld   hl, wEntitiesSpeedZTable                 ; $503C: $21 $20 $C3
    add  hl, bc                                   ; $503F: $09
    ld   [hl], b                                  ; $5040: $70
    ld   hl, wEntitiesSpeedYTable                       ; $5041: $21 $50 $C2
    add  hl, bc                                   ; $5044: $09
    ld   [hl], $08                                ; $5045: $36 $08
    ld   hl, wEntitiesSpeedXTable                       ; $5047: $21 $40 $C2
    add  hl, bc                                   ; $504A: $09
    ld   [hl], $08                                ; $504B: $36 $08
    ld   hl, wEntitiesUnknowTableY                ; $504D: $21 $D0 $C3
    add  hl, bc                                   ; $5050: $09
    ld   [hl], b                                  ; $5051: $70
    call IsEntityUnknownFZero                     ; $5052: $CD $00 $0C
    ld   [hl], $10                                ; $5055: $36 $10

jr_015_5057:
    ret                                           ; $5057: $C9

    ld   [$EAEB], a                               ; $5058: $EA $EB $EA
    db   $EB                                      ; $505B: $EB
    db   $EC                                      ; $505C: $EC
    db   $ED                                      ; $505D: $ED
    xor  $EF                                      ; $505E: $EE $EF
    ldh  a, [hActiveEntitySpriteVariant]               ; $5060: $F0 $F1
    ld   a, [c]                                   ; $5062: $F2
    di                                            ; $5063: $F3

func_015_5064:
    ld   a, [wFinalNightmareForm]                               ; $5064: $FA $19 $D2
    rla                                           ; $5067: $17
    and  $FE                                      ; $5068: $E6 $FE
    ld   e, a                                     ; $506A: $5F
    ld   d, b                                     ; $506B: $50
    ld   hl, $5058                                ; $506C: $21 $58 $50
    add  hl, de                                   ; $506F: $19
    ld   a, [hl+]                                 ; $5070: $2A
    ld   [$C195], a                               ; $5071: $EA $95 $C1
    ld   a, [hl]                                  ; $5074: $7E
    ld   [$C196], a                               ; $5075: $EA $96 $C1
    ld   a, $01                                   ; $5078: $3E $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a         ; $507A: $E0 $91
    ld   [wNeedsUpdatingNPCTiles], a              ; $507C: $EA $0E $C1
    ret                                           ; $507F: $C9

FinalNightmareEntityHandler::
    ld   a, [wRoomTransitionState]                ; $5080: $FA $24 $C1
    and  a                                        ; $5083: $A7
    jr   nz, jr_015_5093                          ; $5084: $20 $0D

    ld   a, [wC116]                               ; $5086: $FA $16 $C1
    and  a                                        ; $5089: $A7
    jr   nz, jr_015_5093                          ; $508A: $20 $07

    inc  a                                        ; $508C: $3C
    ld   [wC116], a                               ; $508D: $EA $16 $C1
    call func_015_5064                            ; $5090: $CD $64 $50

jr_015_5093:
    ld   hl, wEntitiesUnknowTableR                ; $5093: $21 $90 $C3
    add  hl, bc                                   ; $5096: $09
    ld   a, [hl]                                  ; $5097: $7E
    cp   $02                                      ; $5098: $FE $02
    jp   z, label_015_45CB                        ; $509A: $CA $CB $45

    and  a                                        ; $509D: $A7
    jp   nz, label_015_54D6                       ; $509E: $C2 $D6 $54

    ld   a, [wFinalNightmareForm]                               ; $50A1: $FA $19 $D2
    JP_TABLE                                      ; $50A4: $C7
._00 dw FinalNightmareForm1Handler
._01 dw FinalNightmareForm2Handler
._02 dw FinalNightmareForm3Handler
._03 dw FinalNightmareForm4Handler
._04 dw FinalNightmareForm5Handler
._05 dw FinalNightmareForm6Handler

FinalNightmareForm1Handler::
    ldh  a, [hActiveEntityState]                  ; $50B1: $F0 $F0
    rst  $00                                      ; $50B3: $C7
    jp   nz, $1D50                                ; $50B4: $C2 $50 $1D

    ld   d, c                                     ; $50B7: $51
    jr   c, jr_015_510B                           ; $50B8: $38 $51

    ld   d, e                                     ; $50BA: $53
    ld   d, c                                     ; $50BB: $51
    ld   l, [hl]                                  ; $50BC: $6E
    ld   d, c                                     ; $50BD: $51
    sub  c                                        ; $50BE: $91
    ld   d, c                                     ; $50BF: $51
    or   l                                        ; $50C0: $B5
    ld   d, c                                     ; $50C1: $51
    ld   a, [$C146]                               ; $50C2: $FA $46 $C1
    and  a                                        ; $50C5: $A7
    ret  nz                                       ; $50C6: $C0

    ld   a, $5D                                   ; $50C7: $3E $5D
    ld   [wActiveMusicTrack], a                   ; $50C9: $EA $68 $D3
    ld   hl, $DA74                                ; $50CC: $21 $74 $DA
    set  6, [hl]                                  ; $50CF: $CB $F6
    ld   a, $F5                                   ; $50D1: $3E $F5
    call OpenDialog                               ; $50D3: $CD $85 $23
    call GetEntityTransitionCountdown             ; $50D6: $CD $05 $0C
    ld   [hl], $50                                ; $50D9: $36 $50
    ldh  a, [hLinkPositionX]                      ; $50DB: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $50DD: $21 $00 $C2
    add  hl, bc                                   ; $50E0: $09
    ld   [hl], a                                  ; $50E1: $77
    ld   e, $80                                   ; $50E2: $1E $80
    ld   hl, wIsFileSelectionArrowShifted         ; $50E4: $21 $00 $D0

jr_015_50E7:
    ld   [hl+], a                                 ; $50E7: $22
    dec  e                                        ; $50E8: $1D
    jr   nz, jr_015_50E7                          ; $50E9: $20 $FC

    ldh  a, [hLinkPositionY]                      ; $50EB: $F0 $99
    ld   hl, wEntitiesPosYTable                         ; $50ED: $21 $10 $C2
    add  hl, bc                                   ; $50F0: $09
    ld   [hl], a                                  ; $50F1: $77
    ld   e, $80                                   ; $50F2: $1E $80
    ld   hl, $D100                                ; $50F4: $21 $00 $D1

jr_015_50F7:
    ld   [hl+], a                                 ; $50F7: $22
    dec  e                                        ; $50F8: $1D
    jr   nz, jr_015_50F7                          ; $50F9: $20 $FC

    xor  a                                        ; $50FB: $AF
    ld   [$D21A], a                               ; $50FC: $EA $1A $D2
    ld   [$D21B], a                               ; $50FF: $EA $1B $D2
    ld   [$D21C], a                               ; $5102: $EA $1C $D2
    ld   [$D21D], a                               ; $5105: $EA $1D $D2
    ld   [$D21E], a                               ; $5108: $EA $1E $D2

jr_015_510B:
    ld   [$D21F], a                               ; $510B: $EA $1F $D2
    ld   [$D220], a                               ; $510E: $EA $20 $D2
    ld   [$D221], a                               ; $5111: $EA $21 $D2
    ld   [$D222], a                               ; $5114: $EA $22 $D2
    ld   [$D223], a                               ; $5117: $EA $23 $D2
    jp   IncrementEntityWalkingAttr               ; $511A: $C3 $12 $3B

    call func_015_5631                            ; $511D: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5120: $CD $05 $0C
    jr   nz, jr_015_512D                          ; $5123: $20 $08

    call IncrementEntityWalkingAttr               ; $5125: $CD $12 $3B

func_015_5128:
label_015_5128:
    ld   a, $35                                   ; $5128: $3E $35
    ldh  [hJingle], a                             ; $512A: $E0 $F2
    ret                                           ; $512C: $C9

jr_015_512D:
    cp   $30                                      ; $512D: $FE $30
    jr   nz, jr_015_5137                          ; $512F: $20 $06

    dec  [hl]                                     ; $5131: $35
    ld   a, $23                                   ; $5132: $3E $23
    ld   [wActiveMusicTrack], a                   ; $5134: $EA $68 $D3

jr_015_5137:
    ret                                           ; $5137: $C9

    call func_015_5631                            ; $5138: $CD $31 $56
    call func_015_7B0D                            ; $513B: $CD $0D $7B
    ld   hl, wEntitiesSpeedYTable                       ; $513E: $21 $50 $C2
    add  hl, bc                                   ; $5141: $09
    dec  [hl]                                     ; $5142: $35
    ld   a, [hl]                                  ; $5143: $7E
    cp   $E8                                      ; $5144: $FE $E8
    jr   nz, jr_015_5150                          ; $5146: $20 $08

    call GetEntityTransitionCountdown             ; $5148: $CD $05 $0C
    ld   [hl], $08                                ; $514B: $36 $08
    call IncrementEntityWalkingAttr               ; $514D: $CD $12 $3B

jr_015_5150:
    jp   label_015_7B8B                           ; $5150: $C3 $8B $7B

    call func_015_5631                            ; $5153: $CD $31 $56
    call func_015_7B0D                            ; $5156: $CD $0D $7B
    call func_015_7B8B                            ; $5159: $CD $8B $7B
    call GetEntityTransitionCountdown             ; $515C: $CD $05 $0C
    ret  nz                                       ; $515F: $C0

    ld   hl, wEntitiesSpeedYTable                       ; $5160: $21 $50 $C2
    add  hl, bc                                   ; $5163: $09
    inc  [hl]                                     ; $5164: $34
    ret  nz                                       ; $5165: $C0

    call GetEntityTransitionCountdown             ; $5166: $CD $05 $0C
    ld   [hl], $80                                ; $5169: $36 $80
    jp   IncrementEntityWalkingAttr               ; $516B: $C3 $12 $3B

    call func_015_5631                            ; $516E: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5171: $CD $05 $0C
    jr   z, jr_015_5184                           ; $5174: $28 $0E

    and  $07                                      ; $5176: $E6 $07
    jr   nz, jr_015_5184                          ; $5178: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable               ; $517A: $21 $B0 $C3
    add  hl, bc                                   ; $517D: $09
    ld   a, [hl]                                  ; $517E: $7E
    cp   $05                                      ; $517F: $FE $05
    jr   z, jr_015_5185                           ; $5181: $28 $02

    inc  [hl]                                     ; $5183: $34

jr_015_5184:
    ret                                           ; $5184: $C9

jr_015_5185:
    call GetEntityTransitionCountdown             ; $5185: $CD $05 $0C
    ld   [hl], $C0                                ; $5188: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $518A: $C3 $12 $3B

    ld   b, $05                                   ; $518D: $06 $05
    rlca                                          ; $518F: $07
    dec  b                                        ; $5190: $05
    call func_015_569F                            ; $5191: $CD $9F $56
    ldh  a, [hFrameCounter]                       ; $5194: $F0 $E7
    rra                                           ; $5196: $1F
    rra                                           ; $5197: $1F
    rra                                           ; $5198: $1F
    rra                                           ; $5199: $1F
    and  $03                                      ; $519A: $E6 $03
    ld   e, a                                     ; $519C: $5F
    ld   d, b                                     ; $519D: $50
    ld   hl, $518D                                ; $519E: $21 $8D $51
    add  hl, de                                   ; $51A1: $19
    ld   a, [hl]                                  ; $51A2: $7E
    call SetEntitySpriteVariant                   ; $51A3: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $51A6: $CD $05 $0C
    ret  nz                                       ; $51A9: $C0

    ld   [hl], $2F                                ; $51AA: $36 $2F
    jp   IncrementEntityWalkingAttr               ; $51AC: $C3 $12 $3B

    ld   [$0100], sp                              ; $51AF: $08 $00 $01
    ld   [bc], a                                  ; $51B2: $02
    inc  bc                                       ; $51B3: $03
    inc  b                                        ; $51B4: $04
    call func_015_569F                            ; $51B5: $CD $9F $56
    call GetEntityTransitionCountdown             ; $51B8: $CD $05 $0C
    jr   nz, jr_015_51D0                          ; $51BB: $20 $13

    ld   hl, wFinalNightmareForm                                ; $51BD: $21 $19 $D2
    inc  [hl]                                     ; $51C0: $34
    xor  a                                        ; $51C1: $AF
    call SetEntitySpriteVariant                   ; $51C2: $CD $0C $3B
    call IncrementEntityWalkingAttr               ; $51C5: $CD $12 $3B
    ld   [hl], b                                  ; $51C8: $70
    ld   hl, wEntitiesUnknowTableL                ; $51C9: $21 $40 $C3
    add  hl, bc                                   ; $51CC: $09
    res  7, [hl]                                  ; $51CD: $CB $BE
    ret                                           ; $51CF: $C9

jr_015_51D0:
    rra                                           ; $51D0: $1F
    rra                                           ; $51D1: $1F
    rra                                           ; $51D2: $1F
    and  $0F                                      ; $51D3: $E6 $0F
    ld   e, a                                     ; $51D5: $5F
    ld   d, b                                     ; $51D6: $50
    ld   hl, $51AF                                ; $51D7: $21 $AF $51
    add  hl, de                                   ; $51DA: $19
    ld   a, [hl]                                  ; $51DB: $7E
    jp   SetEntitySpriteVariant                   ; $51DC: $C3 $0C $3B

FinalNightmareForm2Handler::
    call $572B                                    ; $51DF: $CD $2B $57
    call func_015_7B0D                            ; $51E2: $CD $0D $7B
    call label_C56                                ; $51E5: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $51E8: $F0 $F0
    rst  $00                                      ; $51EA: $C7
    rst  $38                                      ; $51EB: $FF
    ld   d, c                                     ; $51EC: $51
    inc  c                                        ; $51ED: $0C
    ld   d, d                                     ; $51EE: $52
    inc  l                                        ; $51EF: $2C
    ld   d, d                                     ; $51F0: $52
    adc  d                                        ; $51F1: $8A
    ld   d, d                                     ; $51F2: $52
    xor  d                                        ; $51F3: $AA
    ld   d, d                                     ; $51F4: $52
    or   [hl]                                     ; $51F5: $B6
    ld   d, d                                     ; $51F6: $52
    ld   [hl], b                                  ; $51F7: $70
    ld   d, e                                     ; $51F8: $53
    pop  hl                                       ; $51F9: $E1
    ld   d, e                                     ; $51FA: $53
    rla                                           ; $51FB: $17
    ld   d, e                                     ; $51FC: $53
    jr   nc, @+$55                                ; $51FD: $30 $53

    call GetEntityTransitionCountdown             ; $51FF: $CD $05 $0C
    ld   [hl], $80                                ; $5202: $36 $80
    ld   hl, wEntitiesUnknowTableY                ; $5204: $21 $D0 $C3
    add  hl, bc                                   ; $5207: $09
    ld   [hl], b                                  ; $5208: $70
    jp   IncrementEntityWalkingAttr               ; $5209: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $520C: $CD $05 $0C
    ret  nz                                       ; $520F: $C0

    ldh  a, [hFrameCounter]                       ; $5210: $F0 $E7
    and  $07                                      ; $5212: $E6 $07
    ret  nz                                       ; $5214: $C0

    ld   hl, wEntitiesSpriteVariantTable               ; $5215: $21 $B0 $C3
    add  hl, bc                                   ; $5218: $09
    inc  [hl]                                     ; $5219: $34
    ld   a, [hl]                                  ; $521A: $7E
    cp   $03                                      ; $521B: $FE $03
    ret  nz                                       ; $521D: $C0

    ld   hl, wEntitiesSpeedZTable                 ; $521E: $21 $20 $C3
    add  hl, bc                                   ; $5221: $09
    ld   [hl], $28                                ; $5222: $36 $28
    ld   a, $08                                   ; $5224: $3E $08
    call label_3BAA                               ; $5226: $CD $AA $3B
    jp   IncrementEntityWalkingAttr               ; $5229: $C3 $12 $3B

    call func_015_5435                            ; $522C: $CD $35 $54
    call label_3B39                               ; $522F: $CD $39 $3B
    call func_015_7B88                            ; $5232: $CD $88 $7B
    call label_3B23                               ; $5235: $CD $23 $3B
    call func_015_7BC1                            ; $5238: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $523B: $21 $20 $C3
    add  hl, bc                                   ; $523E: $09
    dec  [hl]                                     ; $523F: $35
    dec  [hl]                                     ; $5240: $35
    ld   hl, wEntitiesPosZTable                   ; $5241: $21 $10 $C3
    add  hl, bc                                   ; $5244: $09
    ld   a, [hl]                                  ; $5245: $7E
    and  $80                                      ; $5246: $E6 $80
    jr   z, jr_015_527A                           ; $5248: $28 $30

    ld   [hl], b                                  ; $524A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $524B: $21 $20 $C3
    add  hl, bc                                   ; $524E: $09
    ld   [hl], b                                  ; $524F: $70
    ld   hl, wEntitiesUnknowTableY                ; $5250: $21 $D0 $C3
    add  hl, bc                                   ; $5253: $09
    ld   a, [hl]                                  ; $5254: $7E
    inc  a                                        ; $5255: $3C
    ld   [hl], a                                  ; $5256: $77
    and  $01                                      ; $5257: $E6 $01
    jr   nz, jr_015_526E                          ; $5259: $20 $13

    call GetRandomByte                            ; $525B: $CD $0D $28
    and  $01                                      ; $525E: $E6 $01
    jr   nz, jr_015_526E                          ; $5260: $20 $0C

    call GetEntityTransitionCountdown             ; $5262: $CD $05 $0C
    ld   [hl], $1F                                ; $5265: $36 $1F
    call IncrementEntityWalkingAttr               ; $5267: $CD $12 $3B
    ld   [hl], $08                                ; $526A: $36 $08
    jr   jr_015_527A                              ; $526C: $18 $0C

jr_015_526E:
    ld   a, $20                                   ; $526E: $3E $20
    ldh  [hJingle], a                             ; $5270: $E0 $F2
    call GetEntityTransitionCountdown             ; $5272: $CD $05 $0C
    ld   [hl], $30                                ; $5275: $36 $30
    call IncrementEntityWalkingAttr               ; $5277: $CD $12 $3B

jr_015_527A:
    ld   e, $03                                   ; $527A: $1E $03
    ld   hl, wEntitiesPosZTable                   ; $527C: $21 $10 $C3
    add  hl, bc                                   ; $527F: $09
    ld   a, [hl]                                  ; $5280: $7E
    cp   $0C                                      ; $5281: $FE $0C
    jr   c, jr_015_5286                           ; $5283: $38 $01

    inc  e                                        ; $5285: $1C

jr_015_5286:
    ld   a, e                                     ; $5286: $7B
    jp   SetEntitySpriteVariant                   ; $5287: $C3 $0C $3B

    ld   a, $05                                   ; $528A: $3E $05
    call SetEntitySpriteVariant                   ; $528C: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $528F: $CD $05 $0C
    jr   nz, jr_015_52A4                          ; $5292: $20 $10

    ld   a, $0C                                   ; $5294: $3E $0C
    call label_3BAA                               ; $5296: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $5299: $21 $20 $C3
    add  hl, bc                                   ; $529C: $09
    ld   [hl], $20                                ; $529D: $36 $20
    call IncrementEntityWalkingAttr               ; $529F: $CD $12 $3B
    dec  [hl]                                     ; $52A2: $35
    dec  [hl]                                     ; $52A3: $35

jr_015_52A4:
    call func_015_5435                            ; $52A4: $CD $35 $54
    jp   label_3B39                               ; $52A7: $C3 $39 $3B

    call GetEntityTransitionCountdown             ; $52AA: $CD $05 $0C
    ret  nz                                       ; $52AD: $C0

    jp   label_015_5335                           ; $52AE: $C3 $35 $53

func_015_52B1:
label_015_52B1:
    ld   a, $23                                   ; $52B1: $3E $23
    ldh  [hWaveSfx], a                            ; $52B3: $E0 $F3
    ret                                           ; $52B5: $C9

    call GetEntityTransitionCountdown             ; $52B6: $CD $05 $0C
    jr   nz, jr_015_52FF                          ; $52B9: $20 $44

func_015_52BB:
    ld   a, [wFinalNightmareForm]                               ; $52BB: $FA $19 $D2
    inc  a                                        ; $52BE: $3C
    ld   [wFinalNightmareForm], a                               ; $52BF: $EA $19 $D2
    call func_015_5064                            ; $52C2: $CD $64 $50
    xor  a                                        ; $52C5: $AF
    ld   [$D221], a                               ; $52C6: $EA $21 $D2
    ld   [$D222], a                               ; $52C9: $EA $22 $D2
    ld   [$D223], a                               ; $52CC: $EA $23 $D2
    ld   [$D220], a                               ; $52CF: $EA $20 $D2
    ld   hl, wEntitiesPosZTable                   ; $52D2: $21 $10 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70
    ld   hl, wEntitiesUnknowTableL                ; $52D7: $21 $40 $C3
    add  hl, bc                                   ; $52DA: $09
    ld   [hl], $C0                                ; $52DB: $36 $C0
    ld   a, $02                                   ; $52DD: $3E $02
    ld   [$C197], a                               ; $52DF: $EA $97 $C1
    inc  a                                        ; $52E2: $3C
    ld   [wC10D], a                               ; $52E3: $EA $0D $C1
    ld   a, $FF                                   ; $52E6: $3E $FF
    call SetEntitySpriteVariant                   ; $52E8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $52EB: $CD $05 $0C
    ld   [hl], $40                                ; $52EE: $36 $40
    ld   hl, wEntitiesUnknownTableB               ; $52F0: $21 $B0 $C2
    add  hl, bc                                   ; $52F3: $09
    ld   [hl], b                                  ; $52F4: $70
    call IncrementEntityWalkingAttr               ; $52F5: $CD $12 $3B
    ld   [hl], b                                  ; $52F8: $70
    ld   a, $01                                   ; $52F9: $3E $01
    ld   [$D21A], a                               ; $52FB: $EA $1A $D2
    ret                                           ; $52FE: $C9

jr_015_52FF:
    cp   $18                                      ; $52FF: $FE $18
    ret  nc                                       ; $5301: $D0

    cp   $17                                      ; $5302: $FE $17
    jr   nz, jr_015_530B                          ; $5304: $20 $05

    ld   hl, hJingle                              ; $5306: $21 $F2 $FF
    ld   [hl], $35                                ; $5309: $36 $35

jr_015_530B:
    rra                                           ; $530B: $1F
    rra                                           ; $530C: $1F
    rra                                           ; $530D: $1F
    and  $03                                      ; $530E: $E6 $03
    jp   SetEntitySpriteVariant                   ; $5310: $C3 $0C $3B

    rst  $38                                      ; $5313: $FF
    nop                                           ; $5314: $00
    ld   bc, $CD02                                ; $5315: $01 $02 $CD
    dec  b                                        ; $5318: $05
    inc  c                                        ; $5319: $0C
    jr   nz, jr_015_5321                          ; $531A: $20 $05

    ld   [hl], $80                                ; $531C: $36 $80
    jp   IncrementEntityWalkingAttr               ; $531E: $C3 $12 $3B

jr_015_5321:
    rra                                           ; $5321: $1F
    rra                                           ; $5322: $1F
    rra                                           ; $5323: $1F
    and  $03                                      ; $5324: $E6 $03
    ld   e, a                                     ; $5326: $5F
    ld   d, b                                     ; $5327: $50
    ld   hl, $5313                                ; $5328: $21 $13 $53
    add  hl, de                                   ; $532B: $19
    ld   a, [hl]                                  ; $532C: $7E
    jp   SetEntitySpriteVariant                   ; $532D: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $5330: $CD $05 $0C
    jr   nz, jr_015_5355                          ; $5333: $20 $20

label_015_5335:
    call GetRandomByte                            ; $5335: $CD $0D $28
    and  $07                                      ; $5338: $E6 $07
    ld   e, a                                     ; $533A: $5F
    ld   d, b                                     ; $533B: $50
    ld   hl, $5911                                ; $533C: $21 $11 $59
    add  hl, de                                   ; $533F: $19
    ld   a, [hl]                                  ; $5340: $7E
    ld   hl, wEntitiesPosXTable                         ; $5341: $21 $00 $C2
    add  hl, bc                                   ; $5344: $09
    ld   [hl], a                                  ; $5345: $77
    ld   hl, $5919                                ; $5346: $21 $19 $59
    add  hl, de                                   ; $5349: $19
    ld   a, [hl]                                  ; $534A: $7E
    ld   hl, wEntitiesPosYTable                         ; $534B: $21 $10 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    call IncrementEntityWalkingAttr               ; $5350: $CD $12 $3B
    ld   [hl], $01                                ; $5353: $36 $01

jr_015_5355:
    ret                                           ; $5355: $C9

    nop                                           ; $5356: $00
    nop                                           ; $5357: $00
    nop                                           ; $5358: $00
    nop                                           ; $5359: $00
    nop                                           ; $535A: $00
    nop                                           ; $535B: $00
    nop                                           ; $535C: $00
    nop                                           ; $535D: $00
    nop                                           ; $535E: $00
    nop                                           ; $535F: $00
    nop                                           ; $5360: $00
    nop                                           ; $5361: $00
    nop                                           ; $5362: $00
    nop                                           ; $5363: $00
    nop                                           ; $5364: $00
    nop                                           ; $5365: $00

func_015_5366:
    nop                                           ; $5366: $00
    jr   @+$22                                    ; $5367: $18 $20

    jr   jr_015_536B                              ; $5369: $18 $00

jr_015_536B:
    add  sp, -$20                                 ; $536B: $E8 $E0
    add  sp, $00                                  ; $536D: $E8 $00
    jr   jr_015_53AF                              ; $536F: $18 $3E

    rst  $38                                      ; $5371: $FF
    call SetEntitySpriteVariant                   ; $5372: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5375: $CD $05 $0C
    ld   [hl], $80                                ; $5378: $36 $80
    call IncrementEntityWalkingAttr               ; $537A: $CD $12 $3B
    ld   [hl], $04                                ; $537D: $36 $04
    ld   a, $21                                   ; $537F: $3E $21
    ldh  [hWaveSfx], a                            ; $5381: $E0 $F3

func_015_5383:
label_015_5383:
    xor  a                                        ; $5383: $AF

jr_015_5384:
    ldh  [hFFE8], a                               ; $5384: $E0 $E8
    ld   a, $E6                                   ; $5386: $3E $E6
    call func_003_64CA_trampoline                               ; $5388: $CD $86 $3B
    ret  c                                        ; $538B: $D8

    push bc                                       ; $538C: $C5
    ldh  a, [hFFE8]                               ; $538D: $F0 $E8
    ld   c, a                                     ; $538F: $4F
    ldh  a, [hScratch0]                           ; $5390: $F0 $D7
    ld   hl, $5356                                ; $5392: $21 $56 $53
    add  hl, bc                                   ; $5395: $09
    add  [hl]                                     ; $5396: $86
    ld   hl, wEntitiesPosXTable                         ; $5397: $21 $00 $C2
    add  hl, de                                   ; $539A: $19
    ld   [hl], a                                  ; $539B: $77
    ldh  a, [hScratch1]                           ; $539C: $F0 $D8
    ld   hl, $535E                                ; $539E: $21 $5E $53
    add  hl, bc                                   ; $53A1: $09
    add  [hl]                                     ; $53A2: $86
    ld   hl, wEntitiesPosYTable                         ; $53A3: $21 $10 $C2
    add  hl, de                                   ; $53A6: $19
    ld   [hl], a                                  ; $53A7: $77
    ldh  a, [hScratch3]                           ; $53A8: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $53AA: $21 $10 $C3
    add  hl, de                                   ; $53AD: $19
    ld   [hl], a                                  ; $53AE: $77

jr_015_53AF:
    ld   hl, $5368                                ; $53AF: $21 $68 $53
    add  hl, bc                                   ; $53B2: $09
    ld   a, [hl]                                  ; $53B3: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $53B4: $21 $40 $C2
    add  hl, de                                   ; $53B7: $19
    ld   [hl], a                                  ; $53B8: $77
    ld   hl, $5366                                ; $53B9: $21 $66 $53
    add  hl, bc                                   ; $53BC: $09
    ld   a, [hl]                                  ; $53BD: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $53BE: $21 $50 $C2
    add  hl, de                                   ; $53C1: $19
    ld   [hl], a                                  ; $53C2: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $53C3: $21 $E0 $C2
    add  hl, de                                   ; $53C6: $19
    ld   [hl], $2F                                ; $53C7: $36 $2F
    ld   hl, wEntitiesUnknowTableL                ; $53C9: $21 $40 $C3
    add  hl, de                                   ; $53CC: $19
    ld   [hl], $C2                                ; $53CD: $36 $C2
    ld   hl, wEntitiesUnknowTableR                ; $53CF: $21 $90 $C3
    add  hl, de                                   ; $53D2: $19
    inc  [hl]                                     ; $53D3: $34
    pop  bc                                       ; $53D4: $C1
    ldh  a, [hFFE8]                               ; $53D5: $F0 $E8
    inc  a                                        ; $53D7: $3C
    cp   $08                                      ; $53D8: $FE $08
    jr   nz, jr_015_5384                          ; $53DA: $20 $A8

    ret                                           ; $53DC: $C9

    dec  b                                        ; $53DD: $05
    inc  bc                                       ; $53DE: $03
    inc  b                                        ; $53DF: $04
    inc  bc                                       ; $53E0: $03
    call func_015_7BC1                            ; $53E1: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $53E4: $21 $20 $C3
    add  hl, bc                                   ; $53E7: $09
    dec  [hl]                                     ; $53E8: $35
    dec  [hl]                                     ; $53E9: $35
    ld   hl, wEntitiesPosZTable                   ; $53EA: $21 $10 $C3
    add  hl, bc                                   ; $53ED: $09
    ld   a, [hl]                                  ; $53EE: $7E
    and  $80                                      ; $53EF: $E6 $80
    jr   z, jr_015_53F9                           ; $53F1: $28 $06

    ld   [hl], b                                  ; $53F3: $70
    ld   hl, wEntitiesSpeedZTable                 ; $53F4: $21 $20 $C3
    add  hl, bc                                   ; $53F7: $09
    ld   [hl], b                                  ; $53F8: $70

jr_015_53F9:
    call GetEntityTransitionCountdown             ; $53F9: $CD $05 $0C
    jr   z, jr_015_540E                           ; $53FC: $28 $10

    rra                                           ; $53FE: $1F
    nop                                           ; $53FF: $00
    nop                                           ; $5400: $00
    nop                                           ; $5401: $00
    and  $03                                      ; $5402: $E6 $03
    ld   e, a                                     ; $5404: $5F
    ld   d, b                                     ; $5405: $50
    ld   hl, $53DD                                ; $5406: $21 $DD $53
    add  hl, de                                   ; $5409: $19
    ld   a, [hl]                                  ; $540A: $7E
    jp   SetEntitySpriteVariant                   ; $540B: $C3 $0C $3B

jr_015_540E:
    ld   a, [$D220]                               ; $540E: $FA $20 $D2
    inc  a                                        ; $5411: $3C
    ld   [$D220], a                               ; $5412: $EA $20 $D2
    cp   $03                                      ; $5415: $FE $03
    jr   nc, jr_015_541F                          ; $5417: $30 $06

    call IncrementEntityWalkingAttr               ; $5419: $CD $12 $3B
    ld   [hl], $02                                ; $541C: $36 $02
    ret                                           ; $541E: $C9

jr_015_541F:
    ld   a, $06                                   ; $541F: $3E $06
    call SetEntitySpriteVariant                   ; $5421: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5424: $CD $05 $0C
    ld   [hl], $80                                ; $5427: $36 $80
    call IncrementEntityWalkingAttr               ; $5429: $CD $12 $3B
    ld   [hl], $05                                ; $542C: $36 $05

func_015_542E:
    ld   a, $37                                   ; $542E: $3E $37
    ldh  [hNoiseSfx], a                           ; $5430: $E0 $F4
    jp   label_015_5383                           ; $5432: $C3 $83 $53

func_015_5435:
    ld   a, [wHasToadstool]                       ; $5435: $FA $4B $DB
    and  a                                        ; $5438: $A7
    jr   z, jr_015_5465                           ; $5439: $28 $2A

    ld   a, [wAButtonSlot]                        ; $543B: $FA $00 $DB
    cp   $0C                                      ; $543E: $FE $0C
    jr   nz, jr_015_5450                          ; $5440: $20 $0E

    ldh  a, [hJoypadState]                               ; $5442: $F0 $CC
    and  $20                                      ; $5444: $E6 $20
    jr   z, jr_015_5465                           ; $5446: $28 $1D

    ld   a, $03                                   ; $5448: $3E $03
    ld   [$D220], a                               ; $544A: $EA $20 $D2
    jp   label_015_54A2                           ; $544D: $C3 $A2 $54

jr_015_5450:
    ld   a, [wBButtonSlot]                        ; $5450: $FA $01 $DB
    cp   $0C                                      ; $5453: $FE $0C
    jr   nz, jr_015_5465                          ; $5455: $20 $0E

    ldh  a, [hJoypadState]                               ; $5457: $F0 $CC
    and  $10                                      ; $5459: $E6 $10
    jr   z, jr_015_5465                           ; $545B: $28 $08

    ld   a, $03                                   ; $545D: $3E $03
    ld   [$D220], a                               ; $545F: $EA $20 $D2
    jp   label_015_54A2                           ; $5462: $C3 $A2 $54

jr_015_5465:
    ld   e, $0F                                   ; $5465: $1E $0F
    ld   d, b                                     ; $5467: $50

jr_015_5468:
    ld   hl, wEntitiesStatusTable                        ; $5468: $21 $80 $C2
    add  hl, de                                   ; $546B: $19
    ld   a, [hl]                                  ; $546C: $7E
    cp   $05                                      ; $546D: $FE $05
    jr   nz, jr_015_54B7                          ; $546F: $20 $46

    ld   hl, wEntitiesTypeTable                   ; $5471: $21 $A0 $C3
    add  hl, de                                   ; $5474: $19
    ld   a, [hl]                                  ; $5475: $7E
    cp   $08                                      ; $5476: $FE $08
    jr   nz, jr_015_54B7                          ; $5478: $20 $3D

    ld   hl, wEntitiesTransitionCountdownTable    ; $547A: $21 $E0 $C2
    add  hl, de                                   ; $547D: $19
    ld   a, [hl]                                  ; $547E: $7E
    cp   $08                                      ; $547F: $FE $08
    jr   nz, jr_015_54B7                          ; $5481: $20 $34

    ld   hl, wEntitiesPosXTable                         ; $5483: $21 $00 $C2
    add  hl, de                                   ; $5486: $19
    ldh  a, [wActiveEntityPosX]                   ; $5487: $F0 $EE
    sub  [hl]                                     ; $5489: $96
    add  $0C                                      ; $548A: $C6 $0C
    cp   $18                                      ; $548C: $FE $18
    jr   nc, jr_015_54B7                          ; $548E: $30 $27

    ld   hl, wEntitiesPosYTable                         ; $5490: $21 $10 $C2
    add  hl, de                                   ; $5493: $19
    ldh  a, [wActiveEntityPosY]                   ; $5494: $F0 $EC
    sub  [hl]                                     ; $5496: $96
    add  $0C                                      ; $5497: $C6 $0C
    cp   $18                                      ; $5499: $FE $18
    jr   nc, jr_015_54B7                          ; $549B: $30 $1A

    call GetEntityTransitionCountdown             ; $549D: $CD $05 $0C
    ld   [hl], $80                                ; $54A0: $36 $80

label_015_54A2:
    ld   hl, wEntitiesUnknowTableU                ; $54A2: $21 $20 $C4
    add  hl, bc                                   ; $54A5: $09
    ld   [hl], $14                                ; $54A6: $36 $14
    ld   a, $07                                   ; $54A8: $3E $07
    ldh  [hWaveSfx], a                            ; $54AA: $E0 $F3
    ld   a, $37                                   ; $54AC: $3E $37
    ldh  [hJingle], a                             ; $54AE: $E0 $F2
    call IncrementEntityWalkingAttr               ; $54B0: $CD $12 $3B
    ld   [hl], $07                                ; $54B3: $36 $07
    pop  af                                       ; $54B5: $F1
    ret                                           ; $54B6: $C9

jr_015_54B7:
    dec  e                                        ; $54B7: $1D
    ld   a, e                                     ; $54B8: $7B
    cp   $FF                                      ; $54B9: $FE $FF
    jr   nz, jr_015_5468                          ; $54BB: $20 $AB

    ret                                           ; $54BD: $C9

    ld   c, [hl]                                  ; $54BE: $4E
    nop                                           ; $54BF: $00
    ld   c, [hl]                                  ; $54C0: $4E
    jr   nz, jr_015_550F                          ; $54C1: $20 $4C

    nop                                           ; $54C3: $00
    ld   c, h                                     ; $54C4: $4C
    jr   nz, @+$4C                                ; $54C5: $20 $4A

    nop                                           ; $54C7: $00
    ld   c, d                                     ; $54C8: $4A
    jr   nz, jr_015_54CD                          ; $54C9: $20 $02

    ld   [bc], a                                  ; $54CB: $02
    ld   [bc], a                                  ; $54CC: $02

jr_015_54CD:
    ld   bc, $0001                                ; $54CD: $01 $01 $00
    rrca                                          ; $54D0: $0F
    rlca                                          ; $54D1: $07
    inc  bc                                       ; $54D2: $03
    ld   bc, $0000                                ; $54D3: $01 $00 $00

label_015_54D6:
    ld   de, $54BE                                ; $54D6: $11 $BE $54
    call RenderAnimatedActiveEntity                               ; $54D9: $CD $C0 $3B
    call func_015_7B0D                            ; $54DC: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $54DF: $CD $05 $0C
    jp   z, ClearEntityStatusAndReturn            ; $54E2: $CA $31 $7C

    rra                                           ; $54E5: $1F
    rra                                           ; $54E6: $1F
    rra                                           ; $54E7: $1F
    and  $07                                      ; $54E8: $E6 $07
    ld   e, a                                     ; $54EA: $5F
    ld   d, b                                     ; $54EB: $50
    ld   hl, $54CA                                ; $54EC: $21 $CA $54
    add  hl, de                                   ; $54EF: $19
    push de                                       ; $54F0: $D5
    ld   a, [hl]                                  ; $54F1: $7E
    call SetEntitySpriteVariant                   ; $54F2: $CD $0C $3B
    pop  de                                       ; $54F5: $D1
    ld   hl, $54D0                                ; $54F6: $21 $D0 $54
    add  hl, de                                   ; $54F9: $19
    ldh  a, [hFrameCounter]                       ; $54FA: $F0 $E7
    and  [hl]                                     ; $54FC: $A6
    ret  nz                                       ; $54FD: $C0

    jp   label_015_7B88                           ; $54FE: $C3 $88 $7B

    nop                                           ; $5501: $00
    nop                                           ; $5502: $00
    ld   c, h                                     ; $5503: $4C
    nop                                           ; $5504: $00
    nop                                           ; $5505: $00
    ld   [$204C], sp                              ; $5506: $08 $4C $20
    nop                                           ; $5509: $00
    ld   [$20FF], sp                              ; $550A: $08 $FF $20
    nop                                           ; $550D: $00
    db   $10                                      ; $550E: $10

jr_015_550F:
    rst  $38                                      ; $550F: $FF
    jr   nz, jr_015_5512                          ; $5510: $20 $00

jr_015_5512:
    ld   hl, sp-$01                               ; $5512: $F8 $FF
    ld   b, b                                     ; $5514: $40
    nop                                           ; $5515: $00
    nop                                           ; $5516: $00
    rst  $38                                      ; $5517: $FF
    ld   b, b                                     ; $5518: $40
    nop                                           ; $5519: $00
    ld   [$60FF], sp                              ; $551A: $08 $FF $60
    nop                                           ; $551D: $00
    db   $10                                      ; $551E: $10
    rst  $38                                      ; $551F: $FF
    ld   h, b                                     ; $5520: $60
    nop                                           ; $5521: $00
    nop                                           ; $5522: $00
    ld   c, [hl]                                  ; $5523: $4E
    nop                                           ; $5524: $00
    nop                                           ; $5525: $00
    ld   [$204E], sp                              ; $5526: $08 $4E $20
    nop                                           ; $5529: $00
    ld   [$20FF], sp                              ; $552A: $08 $FF $20
    nop                                           ; $552D: $00
    db   $10                                      ; $552E: $10
    rst  $38                                      ; $552F: $FF
    jr   nz, jr_015_5532                          ; $5530: $20 $00

jr_015_5532:
    ld   hl, sp-$01                               ; $5532: $F8 $FF
    ld   b, b                                     ; $5534: $40
    nop                                           ; $5535: $00
    nop                                           ; $5536: $00
    rst  $38                                      ; $5537: $FF
    ld   b, b                                     ; $5538: $40
    nop                                           ; $5539: $00
    ld   [$60FF], sp                              ; $553A: $08 $FF $60
    nop                                           ; $553D: $00
    db   $10                                      ; $553E: $10
    rst  $38                                      ; $553F: $FF
    ld   h, b                                     ; $5540: $60
    ld   hl, sp-$08                               ; $5541: $F8 $F8
    ld   a, d                                     ; $5543: $7A
    nop                                           ; $5544: $00
    ld   hl, sp+$00                               ; $5545: $F8 $00
    ld   a, h                                     ; $5547: $7C
    nop                                           ; $5548: $00
    ld   hl, sp+$08                               ; $5549: $F8 $08
    ld   a, h                                     ; $554B: $7C
    jr   nz, @-$06                                ; $554C: $20 $F8

    db   $10                                      ; $554E: $10
    ld   a, d                                     ; $554F: $7A
    jr   nz, @+$0A                                ; $5550: $20 $08

    ld   hl, sp+$7A                               ; $5552: $F8 $7A
    ld   b, b                                     ; $5554: $40
    ld   [$7C00], sp                              ; $5555: $08 $00 $7C
    ld   b, b                                     ; $5558: $40
    ld   [$7C08], sp                              ; $5559: $08 $08 $7C
    ld   h, b                                     ; $555C: $60
    ld   [$7A10], sp                              ; $555D: $08 $10 $7A
    ld   h, b                                     ; $5560: $60
    ld   hl, sp-$08                               ; $5561: $F8 $F8
    halt                                          ; $5563: $76 $00
    ld   hl, sp+$00                               ; $5565: $F8 $00
    ld   a, b                                     ; $5567: $78
    nop                                           ; $5568: $00
    ld   hl, sp+$08                               ; $5569: $F8 $08
    ld   a, b                                     ; $556B: $78
    jr   nz, @-$06                                ; $556C: $20 $F8

    db   $10                                      ; $556E: $10
    db   $76                                      ; $556F: $76
    jr   nz, @+$0A                                ; $5570: $20 $08

    ld   hl, sp+$76                               ; $5572: $F8 $76
    ld   b, b                                     ; $5574: $40
    ld   [$7800], sp                              ; $5575: $08 $00 $78
    ld   b, b                                     ; $5578: $40
    ld   [$7808], sp                              ; $5579: $08 $08 $78
    ld   h, b                                     ; $557C: $60
    ld   [$7610], sp                              ; $557D: $08 $10 $76
    ld   h, b                                     ; $5580: $60
    ld   hl, sp-$08                               ; $5581: $F8 $F8
    ld   [hl], d                                  ; $5583: $72
    nop                                           ; $5584: $00
    ld   hl, sp+$00                               ; $5585: $F8 $00
    ld   [hl], h                                  ; $5587: $74
    nop                                           ; $5588: $00
    ld   hl, sp+$08                               ; $5589: $F8 $08
    ld   [hl], h                                  ; $558B: $74
    jr   nz, @-$06                                ; $558C: $20 $F8

    db   $10                                      ; $558E: $10
    ld   [hl], d                                  ; $558F: $72
    jr   nz, @+$0A                                ; $5590: $20 $08

    ld   hl, sp+$72                               ; $5592: $F8 $72
    ld   b, b                                     ; $5594: $40
    ld   [$7400], sp                              ; $5595: $08 $00 $74
    ld   b, b                                     ; $5598: $40
    ld   [$7408], sp                              ; $5599: $08 $08 $74
    ld   h, b                                     ; $559C: $60
    ld   [$7210], sp                              ; $559D: $08 $10 $72
    ld   h, b                                     ; $55A0: $60
    ld   hl, sp-$08                               ; $55A1: $F8 $F8
    ld   h, [hl]                                  ; $55A3: $66
    nop                                           ; $55A4: $00
    ld   hl, sp+$00                               ; $55A5: $F8 $00
    ld   l, b                                     ; $55A7: $68
    nop                                           ; $55A8: $00
    ld   hl, sp+$08                               ; $55A9: $F8 $08
    ld   l, b                                     ; $55AB: $68
    jr   nz, @-$06                                ; $55AC: $20 $F8

    db   $10                                      ; $55AE: $10
    ld   h, [hl]                                  ; $55AF: $66
    jr   nz, @+$0A                                ; $55B0: $20 $08

    ld   hl, sp+$66                               ; $55B2: $F8 $66
    ld   b, b                                     ; $55B4: $40
    ld   [$6A00], sp                              ; $55B5: $08 $00 $6A
    nop                                           ; $55B8: $00
    ld   [$6A08], sp                              ; $55B9: $08 $08 $6A
    jr   nz, @+$0A                                ; $55BC: $20 $08

    db   $10                                      ; $55BE: $10
    ld   h, [hl]                                  ; $55BF: $66
    ld   h, b                                     ; $55C0: $60
    ld   hl, sp-$08                               ; $55C1: $F8 $F8
    ld   h, b                                     ; $55C3: $60
    nop                                           ; $55C4: $00
    ld   hl, sp+$00                               ; $55C5: $F8 $00
    ld   h, d                                     ; $55C7: $62
    nop                                           ; $55C8: $00
    ld   hl, sp+$08                               ; $55C9: $F8 $08
    ld   h, d                                     ; $55CB: $62
    jr   nz, @-$06                                ; $55CC: $20 $F8

    db   $10                                      ; $55CE: $10
    ld   h, b                                     ; $55CF: $60
    jr   nz, @+$0A                                ; $55D0: $20 $08

    ld   hl, sp+$60                               ; $55D2: $F8 $60
    ld   b, b                                     ; $55D4: $40
    ld   [$6400], sp                              ; $55D5: $08 $00 $64
    nop                                           ; $55D8: $00
    ld   [$6408], sp                              ; $55D9: $08 $08 $64
    jr   nz, @+$0A                                ; $55DC: $20 $08

    db   $10                                      ; $55DE: $10
    ld   h, b                                     ; $55DF: $60
    ld   h, b                                     ; $55E0: $60
    ld   hl, sp-$08                               ; $55E1: $F8 $F8
    ld   l, h                                     ; $55E3: $6C
    nop                                           ; $55E4: $00
    ld   hl, sp+$00                               ; $55E5: $F8 $00
    ld   l, [hl]                                  ; $55E7: $6E
    nop                                           ; $55E8: $00
    ld   hl, sp+$08                               ; $55E9: $F8 $08
    ld   l, [hl]                                  ; $55EB: $6E
    jr   nz, @-$06                                ; $55EC: $20 $F8

    db   $10                                      ; $55EE: $10
    ld   l, h                                     ; $55EF: $6C
    jr   nz, @+$0A                                ; $55F0: $20 $08

    ld   hl, sp+$6C                               ; $55F2: $F8 $6C
    ld   b, b                                     ; $55F4: $40
    ld   [$7000], sp                              ; $55F5: $08 $00 $70
    nop                                           ; $55F8: $00
    ld   [$7008], sp                              ; $55F9: $08 $08 $70
    jr   nz, jr_015_5606                          ; $55FC: $20 $08

    db   $10                                      ; $55FE: $10
    ld   l, h                                     ; $55FF: $6C
    ld   h, b                                     ; $5600: $60
    nop                                           ; $5601: $00
    nop                                           ; $5602: $00
    ld   c, d                                     ; $5603: $4A
    nop                                           ; $5604: $00
    nop                                           ; $5605: $00

jr_015_5606:
    ld   [$204A], sp                              ; $5606: $08 $4A $20
    nop                                           ; $5609: $00
    ld   [$20FF], sp                              ; $560A: $08 $FF $20
    nop                                           ; $560D: $00
    db   $10                                      ; $560E: $10
    rst  $38                                      ; $560F: $FF
    jr   nz, jr_015_5612                          ; $5610: $20 $00

jr_015_5612:
    ld   hl, sp-$01                               ; $5612: $F8 $FF
    ld   b, b                                     ; $5614: $40
    nop                                           ; $5615: $00
    nop                                           ; $5616: $00
    rst  $38                                      ; $5617: $FF
    ld   b, b                                     ; $5618: $40
    nop                                           ; $5619: $00
    ld   [$60FF], sp                              ; $561A: $08 $FF $60
    nop                                           ; $561D: $00
    db   $10                                      ; $561E: $10
    rst  $38                                      ; $561F: $FF
    ld   h, b                                     ; $5620: $60
    ld   c, h                                     ; $5621: $4C
    nop                                           ; $5622: $00
    ld   c, h                                     ; $5623: $4C
    jr   nz, jr_015_566E                          ; $5624: $20 $48

    nop                                           ; $5626: $00
    ld   c, b                                     ; $5627: $48
    jr   nz, jr_015_5652                          ; $5628: $20 $28

    inc  hl                                       ; $562A: $23
    ld   e, $19                                   ; $562B: $1E $19
    inc  d                                        ; $562D: $14
    rrca                                          ; $562E: $0F
    ld   a, [bc]                                  ; $562F: $0A
    dec  b                                        ; $5630: $05

func_015_5631:
    ld   hl, wEntitiesUnknowTableY                ; $5631: $21 $D0 $C3
    add  hl, bc                                   ; $5634: $09
    ld   a, [hl]                                  ; $5635: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $5636: $E0 $E9
    xor  a                                        ; $5638: $AF

jr_015_5639:
    ldh  [hFFE8], a                               ; $5639: $E0 $E8
    ld   e, a                                     ; $563B: $5F
    ld   d, b                                     ; $563C: $50
    ld   hl, $5629                                ; $563D: $21 $29 $56
    add  hl, de                                   ; $5640: $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $5641: $F0 $E9
    sub  [hl]                                     ; $5643: $96
    and  $7F                                      ; $5644: $E6 $7F
    ld   e, a                                     ; $5646: $5F
    ld   d, b                                     ; $5647: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5648: $21 $00 $D0
    add  hl, de                                   ; $564B: $19
    ld   a, [hl]                                  ; $564C: $7E
    ldh  [wActiveEntityPosX], a                   ; $564D: $E0 $EE
    ld   hl, $D100                                ; $564F: $21 $00 $D1

jr_015_5652:
    add  hl, de                                   ; $5652: $19
    ld   a, [hl]                                  ; $5653: $7E
    ldh  [wActiveEntityPosY], a                   ; $5654: $E0 $EC
    ld   de, $5625                                ; $5656: $11 $25 $56
    ldh  a, [hFFE8]                               ; $5659: $F0 $E8
    cp   $00                                      ; $565B: $FE $00
    jr   z, jr_015_566B                           ; $565D: $28 $0C

    ld   hl, wEntitiesPosYTable                         ; $565F: $21 $10 $C2
    add  hl, bc                                   ; $5662: $09
    ldh  a, [wActiveEntityPosY]                   ; $5663: $F0 $EC
    cp   [hl]                                     ; $5665: $BE
    jr   z, jr_015_5676                           ; $5666: $28 $0E

    ld   de, $5621                                ; $5668: $11 $21 $56

jr_015_566B:
    xor  a                                        ; $566B: $AF
    ldh  [hActiveEntitySpriteVariant], a               ; $566C: $E0 $F1

jr_015_566E:
    call RenderAnimatedActiveEntity                               ; $566E: $CD $C0 $3B
    ld   a, $02                                   ; $5671: $3E $02
    call label_3DA0                               ; $5673: $CD $A0 $3D

jr_015_5676:
    ldh  a, [hFFE8]                               ; $5676: $F0 $E8
    inc  a                                        ; $5678: $3C
    cp   $08                                      ; $5679: $FE $08
    jr   nz, jr_015_5639                          ; $567B: $20 $BC

    call label_3D8A                               ; $567D: $CD $8A $3D
    call func_015_569F                            ; $5680: $CD $9F $56
    call func_015_7B0D                            ; $5683: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableY                ; $5686: $21 $D0 $C3
    add  hl, bc                                   ; $5689: $09
    ld   a, [hl]                                  ; $568A: $7E
    inc  [hl]                                     ; $568B: $34
    and  $7F                                      ; $568C: $E6 $7F
    ld   e, a                                     ; $568E: $5F
    ld   d, b                                     ; $568F: $50
    ldh  a, [wActiveEntityPosY]                   ; $5690: $F0 $EC
    ld   hl, $D100                                ; $5692: $21 $00 $D1
    add  hl, de                                   ; $5695: $19
    ld   [hl], a                                  ; $5696: $77
    ldh  a, [wActiveEntityPosX]                   ; $5697: $F0 $EE
    ld   hl, wIsFileSelectionArrowShifted         ; $5699: $21 $00 $D0
    add  hl, de                                   ; $569C: $19
    ld   [hl], a                                  ; $569D: $77
    ret                                           ; $569E: $C9

func_015_569F:
    ld   hl, wEntitiesSpriteVariantTable               ; $569F: $21 $B0 $C3
    add  hl, bc                                   ; $56A2: $09
    ld   a, [hl]                                  ; $56A3: $7E
    rla                                           ; $56A4: $17
    rla                                           ; $56A5: $17
    rla                                           ; $56A6: $17
    rla                                           ; $56A7: $17
    rla                                           ; $56A8: $17
    and  $E0                                      ; $56A9: $E6 $E0
    ld   e, a                                     ; $56AB: $5F
    ld   d, b                                     ; $56AC: $50
    ld   hl, $5501                                ; $56AD: $21 $01 $55
    add  hl, de                                   ; $56B0: $19
    ld   c, $08                                   ; $56B1: $0E $08
    call label_3CE6                               ; $56B3: $CD $E6 $3C
    ld   a, $08                                   ; $56B6: $3E $08
    jp   label_3DA0                               ; $56B8: $C3 $A0 $3D

    nop                                           ; $56BB: $00
    nop                                           ; $56BC: $00
    ld   c, d                                     ; $56BD: $4A
    nop                                           ; $56BE: $00
    nop                                           ; $56BF: $00
    ld   [$204A], sp                              ; $56C0: $08 $4A $20
    nop                                           ; $56C3: $00
    nop                                           ; $56C4: $00
    rst  $38                                      ; $56C5: $FF
    nop                                           ; $56C6: $00
    nop                                           ; $56C7: $00
    nop                                           ; $56C8: $00
    rst  $38                                      ; $56C9: $FF
    nop                                           ; $56CA: $00
    nop                                           ; $56CB: $00
    nop                                           ; $56CC: $00
    ld   c, h                                     ; $56CD: $4C
    nop                                           ; $56CE: $00
    nop                                           ; $56CF: $00
    ld   [$204C], sp                              ; $56D0: $08 $4C $20
    nop                                           ; $56D3: $00
    nop                                           ; $56D4: $00
    rst  $38                                      ; $56D5: $FF
    nop                                           ; $56D6: $00
    nop                                           ; $56D7: $00
    nop                                           ; $56D8: $00
    rst  $38                                      ; $56D9: $FF
    nop                                           ; $56DA: $00
    nop                                           ; $56DB: $00

jr_015_56DC:
    nop                                           ; $56DC: $00
    ld   c, [hl]                                  ; $56DD: $4E
    nop                                           ; $56DE: $00
    nop                                           ; $56DF: $00
    ld   [$204E], sp                              ; $56E0: $08 $4E $20
    nop                                           ; $56E3: $00
    nop                                           ; $56E4: $00
    rst  $38                                      ; $56E5: $FF
    nop                                           ; $56E6: $00
    nop                                           ; $56E7: $00
    nop                                           ; $56E8: $00
    rst  $38                                      ; $56E9: $FF
    jr   nz, jr_015_56DC                          ; $56EA: $20 $F0

    nop                                           ; $56EC: $00
    ld   e, h                                     ; $56ED: $5C
    nop                                           ; $56EE: $00
    ldh  a, [$FF08]                               ; $56EF: $F0 $08
    ld   e, h                                     ; $56F1: $5C
    jr   nz, jr_015_56F4                          ; $56F2: $20 $00

jr_015_56F4:
    nop                                           ; $56F4: $00
    ld   e, [hl]                                  ; $56F5: $5E
    nop                                           ; $56F6: $00
    nop                                           ; $56F7: $00
    ld   [$205E], sp                              ; $56F8: $08 $5E $20
    ldh  a, [rP1]                                 ; $56FB: $F0 $00
    ld   b, h                                     ; $56FD: $44
    nop                                           ; $56FE: $00
    ldh  a, [$FF08]                               ; $56FF: $F0 $08
    ld   b, h                                     ; $5701: $44
    jr   nz, jr_015_5704                          ; $5702: $20 $00

jr_015_5704:
    nop                                           ; $5704: $00
    ld   b, h                                     ; $5705: $44
    ld   b, b                                     ; $5706: $40
    nop                                           ; $5707: $00
    ld   [$6044], sp                              ; $5708: $08 $44 $60
    nop                                           ; $570B: $00
    db   $FC                                      ; $570C: $FC
    ld   b, b                                     ; $570D: $40
    nop                                           ; $570E: $00
    nop                                           ; $570F: $00
    inc  b                                        ; $5710: $04
    ld   b, d                                     ; $5711: $42
    nop                                           ; $5712: $00
    nop                                           ; $5713: $00
    inc  c                                        ; $5714: $0C
    ld   b, b                                     ; $5715: $40
    jr   nz, jr_015_5718                          ; $5716: $20 $00

jr_015_5718:
    nop                                           ; $5718: $00
    rst  $38                                      ; $5719: $FF
    nop                                           ; $571A: $00
    nop                                           ; $571B: $00

jr_015_571C:
    nop                                           ; $571C: $00
    ld   c, b                                     ; $571D: $48
    nop                                           ; $571E: $00
    nop                                           ; $571F: $00
    ld   [$2048], sp                              ; $5720: $08 $48 $20
    nop                                           ; $5723: $00
    nop                                           ; $5724: $00
    rst  $38                                      ; $5725: $FF
    nop                                           ; $5726: $00
    nop                                           ; $5727: $00
    nop                                           ; $5728: $00
    rst  $38                                      ; $5729: $FF
    jr   nz, jr_015_571C                          ; $572A: $20 $F0

    pop  af                                       ; $572C: $F1
    rla                                           ; $572D: $17
    rla                                           ; $572E: $17
    rla                                           ; $572F: $17
    rla                                           ; $5730: $17
    and  $F0                                      ; $5731: $E6 $F0
    ld   e, a                                     ; $5733: $5F
    ld   d, b                                     ; $5734: $50
    ld   hl, $56BB                                ; $5735: $21 $BB $56
    add  hl, de                                   ; $5738: $19
    ld   c, $04                                   ; $5739: $0E $04
    call label_3CE6                               ; $573B: $CD $E6 $3C
    ld   a, $04                                   ; $573E: $3E $04
    jp   label_3DA0                               ; $5740: $C3 $A0 $3D

FinalNightmareForm3Handler::
    ld   hl, wEntitiesUnknowTableP                ; $5743: $21 $40 $C4
    add  hl, bc                                   ; $5746: $09
    ld   a, [hl]                                  ; $5747: $7E
    cp   $02                                      ; $5748: $FE $02
    jp   z, label_015_5DD5                        ; $574A: $CA $D5 $5D

    and  a                                        ; $574D: $A7
    jp   nz, $5DED                                ; $574E: $C2 $ED $5D

    ld   a, c                                     ; $5751: $79
    ld   [$D201], a                               ; $5752: $EA $01 $D2
    ld   a, [$D21A]                               ; $5755: $FA $1A $D2
    and  a                                        ; $5758: $A7
    jr   nz, jr_015_575E                          ; $5759: $20 $03

    call func_015_5A67                            ; $575B: $CD $67 $5A

jr_015_575E:
    call func_015_7B0D                            ; $575E: $CD $0D $7B
    call func_015_7B3E                            ; $5761: $CD $3E $7B
    ldh  a, [hActiveEntityState]                  ; $5764: $F0 $F0
    rst  $00                                      ; $5766: $C7
    ld   a, e                                     ; $5767: $7B
    ld   d, a                                     ; $5768: $57
    rst  $08                                      ; $5769: $CF
    ld   d, a                                     ; $576A: $57
    dec  bc                                       ; $576B: $0B
    ld   e, b                                     ; $576C: $58
    ld   d, h                                     ; $576D: $54
    ld   e, b                                     ; $576E: $58
    db   $ED                                      ; $576F: $ED
    ld   e, b                                     ; $5770: $58
    ld   h, $59                                   ; $5771: $26 $59
    ld   h, e                                     ; $5773: $63
    ld   e, c                                     ; $5774: $59
    cp   c                                        ; $5775: $B9
    ld   e, c                                     ; $5776: $59
    dec  b                                        ; $5777: $05
    ld   e, d                                     ; $5778: $5A
    rra                                           ; $5779: $1F
    ld   e, d                                     ; $577A: $5A
    xor  a                                        ; $577B: $AF
    call SetEntitySpriteVariant                   ; $577C: $CD $0C $3B
    call $572B                                    ; $577F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5782: $F0 $98
    push af                                       ; $5784: $F5
    ldh  a, [hLinkPositionY]                      ; $5785: $F0 $99
    push af                                       ; $5787: $F5
    ld   a, $50                                   ; $5788: $3E $50
    ldh  [hLinkPositionX], a                      ; $578A: $E0 $98
    ld   a, $30                                   ; $578C: $3E $30
    ldh  [hLinkPositionY], a                      ; $578E: $E0 $99
    ld   a, $10                                   ; $5790: $3E $10
    call label_3BAA                               ; $5792: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5795: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $5798: $F0 $EC
    sub  [hl]                                     ; $579A: $96
    add  $03                                      ; $579B: $C6 $03
    cp   $06                                      ; $579D: $FE $06
    jr   nc, jr_015_57B7                          ; $579F: $30 $16

    ld   hl, hLinkPositionX                       ; $57A1: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $57A4: $F0 $EE
    sub  [hl]                                     ; $57A6: $96
    add  $03                                      ; $57A7: $C6 $03
    cp   $06                                      ; $57A9: $FE $06
    jr   nc, jr_015_57B7                          ; $57AB: $30 $0A

    call GetEntityTransitionCountdown             ; $57AD: $CD $05 $0C
    ld   [hl], $50                                ; $57B0: $36 $50
    call IncrementEntityWalkingAttr               ; $57B2: $CD $12 $3B
    ld   [hl], $01                                ; $57B5: $36 $01

jr_015_57B7:
    pop  af                                       ; $57B7: $F1
    ldh  [hLinkPositionY], a                      ; $57B8: $E0 $99
    pop  af                                       ; $57BA: $F1
    ldh  [hLinkPositionX], a                      ; $57BB: $E0 $98
    jp   label_015_7B88                           ; $57BD: $C3 $88 $7B

    inc  b                                        ; $57C0: $04
    inc  bc                                       ; $57C1: $03
    ld   [bc], a                                  ; $57C2: $02
    ld   bc, $0000                                ; $57C3: $01 $00 $00
    nop                                           ; $57C6: $00
    nop                                           ; $57C7: $00
    nop                                           ; $57C8: $00
    nop                                           ; $57C9: $00
    nop                                           ; $57CA: $00
    nop                                           ; $57CB: $00
    nop                                           ; $57CC: $00
    nop                                           ; $57CD: $00
    nop                                           ; $57CE: $00
    call GetEntityTransitionCountdown             ; $57CF: $CD $05 $0C
    jr   z, jr_015_57E5                           ; $57D2: $28 $11

    rra                                           ; $57D4: $1F
    rra                                           ; $57D5: $1F
    rra                                           ; $57D6: $1F
    and  $0F                                      ; $57D7: $E6 $0F
    ld   e, a                                     ; $57D9: $5F
    ld   d, b                                     ; $57DA: $50
    ld   hl, $57C0                                ; $57DB: $21 $C0 $57
    add  hl, de                                   ; $57DE: $19
    ld   a, [hl]                                  ; $57DF: $7E
    ldh  [hActiveEntitySpriteVariant], a               ; $57E0: $E0 $F1
    jp   $572B                                    ; $57E2: $C3 $2B $57

jr_015_57E5:
    xor  a                                        ; $57E5: $AF
    ld   [$D21A], a                               ; $57E6: $EA $1A $D2
    call func_015_5819                            ; $57E9: $CD $19 $58
    ld   hl, wEntitiesPosYTable                         ; $57EC: $21 $10 $C2
    add  hl, bc                                   ; $57EF: $09
    ld   a, [hl]                                  ; $57F0: $7E
    sub  $08                                      ; $57F1: $D6 $08
    ld   [hl], a                                  ; $57F3: $77
    call GetEntityTransitionCountdown             ; $57F4: $CD $05 $0C
    ld   [hl], $40                                ; $57F7: $36 $40
    call IncrementEntityWalkingAttr               ; $57F9: $CD $12 $3B
    ld   hl, wEntitiesUnknownTableD               ; $57FC: $21 $D0 $C2
    add  hl, bc                                   ; $57FF: $09
    ld   a, [hl]                                  ; $5800: $7E
    and  a                                        ; $5801: $A7
    ret  nz                                       ; $5802: $C0

    inc  [hl]                                     ; $5803: $34
    jp   label_015_52B1                           ; $5804: $C3 $B1 $52

    rrca                                          ; $5807: $0F
    ld   a, [bc]                                  ; $5808: $0A
    dec  b                                        ; $5809: $05
    nop                                           ; $580A: $00
    call GetEntityTransitionCountdown             ; $580B: $CD $05 $0C
    jr   nz, jr_015_5819                          ; $580E: $20 $09

    ld   a, $22                                   ; $5810: $3E $22
    ldh  [hWaveSfx], a                            ; $5812: $E0 $F3
    ld   [hl], $C0                                ; $5814: $36 $C0
    jp   IncrementEntityWalkingAttr               ; $5816: $C3 $12 $3B

func_015_5819:
label_015_5819:
jr_015_5819:
    call func_015_7C0A                            ; $5819: $CD $0A $7C
    ld   a, e                                     ; $581C: $7B
    ld   [$D21E], a                               ; $581D: $EA $1E $D2
    ld   d, b                                     ; $5820: $50
    ld   hl, $5807                                ; $5821: $21 $07 $58
    add  hl, de                                   ; $5824: $19
    ld   a, [hl]                                  ; $5825: $7E
    ld   hl, wEntitiesUnknowTableQ                ; $5826: $21 $80 $C3
    add  hl, bc                                   ; $5829: $09
    ld   [hl], a                                  ; $582A: $77

label_015_582B:
    ld   hl, wEntitiesUnknowTableQ                ; $582B: $21 $80 $C3
    add  hl, bc                                   ; $582E: $09
    ld   a, [hl]                                  ; $582F: $7E
    ld   hl, wEntitiesUnknownTableB               ; $5830: $21 $B0 $C2
    add  hl, bc                                   ; $5833: $09
    add  [hl]                                     ; $5834: $86
    jp   SetEntitySpriteVariant                   ; $5835: $C3 $0C $3B

    nop                                           ; $5838: $00
    ld   bc, $0302                                ; $5839: $01 $02 $03
    inc  bc                                       ; $583C: $03
    inc  bc                                       ; $583D: $03
    inc  bc                                       ; $583E: $03
    inc  bc                                       ; $583F: $03
    ld   [bc], a                                  ; $5840: $02
    ld   [bc], a                                  ; $5841: $02
    ld   [bc], a                                  ; $5842: $02
    ld   [bc], a                                  ; $5843: $02
    ld   bc, $0101                                ; $5844: $01 $01 $01
    ld   bc, $0000                                ; $5847: $01 $00 $00
    nop                                           ; $584A: $00
    nop                                           ; $584B: $00
    jr   @-$16                                    ; $584C: $18 $E8

    nop                                           ; $584E: $00
    nop                                           ; $584F: $00
    nop                                           ; $5850: $00
    nop                                           ; $5851: $00
    ldh  a, [rP1]                                 ; $5852: $F0 $00
    call GetEntityTransitionCountdown             ; $5854: $CD $05 $0C
    jr   nz, jr_015_58C0                          ; $5857: $20 $67

    ld   [$D21D], a                               ; $5859: $EA $1D $D2
    ld   [hl], $50                                ; $585C: $36 $50
    ld   a, $E6                                   ; $585E: $3E $E6
    call func_003_64CA_trampoline                               ; $5860: $CD $86 $3B
    ld   hl, wEntitiesUnknowTableP                ; $5863: $21 $40 $C4
    add  hl, de                                   ; $5866: $19
    inc  [hl]                                     ; $5867: $34
    push bc                                       ; $5868: $C5
    ld   a, [$D21E]                               ; $5869: $FA $1E $D2
    ld   c, a                                     ; $586C: $4F
    ld   hl, $584C                                ; $586D: $21 $4C $58
    add  hl, bc                                   ; $5870: $09
    ldh  a, [hScratch0]                           ; $5871: $F0 $D7
    add  [hl]                                     ; $5873: $86
    ld   hl, wEntitiesPosXTable                         ; $5874: $21 $00 $C2
    add  hl, de                                   ; $5877: $19
    ld   [hl], a                                  ; $5878: $77
    ld   hl, $5850                                ; $5879: $21 $50 $58
    add  hl, bc                                   ; $587C: $09
    ldh  a, [hScratch1]                           ; $587D: $F0 $D8
    add  [hl]                                     ; $587F: $86
    ld   hl, wEntitiesPosYTable                         ; $5880: $21 $10 $C2
    add  hl, de                                   ; $5883: $19
    ld   [hl], a                                  ; $5884: $77
    ld   hl, wEntitiesUnknowTableL                ; $5885: $21 $40 $C3
    add  hl, de                                   ; $5888: $19
    ld   [hl], $42                                ; $5889: $36 $42
    ld   hl, wEntitiesUnknowTableM                ; $588B: $21 $50 $C3
    add  hl, de                                   ; $588E: $19
    ld   [hl], d                                  ; $588F: $72
    ld   a, $38                                   ; $5890: $3E $38
    ldh  [hNoiseSfx], a                           ; $5892: $E0 $F4
    ld   a, [$D220]                               ; $5894: $FA $20 $D2
    cp   $02                                      ; $5897: $FE $02
    jr   c, jr_015_58B5                           ; $5899: $38 $1A

    ldh  a, [hLinkPositionX]                      ; $589B: $F0 $98
    ld   hl, hFrameCounter                        ; $589D: $21 $E7 $FF
    add  [hl]                                     ; $58A0: $86
    and  $01                                      ; $58A1: $E6 $01
    jr   nz, jr_015_58B5                          ; $58A3: $20 $10

    ld   hl, wEntitiesStateTable                  ; $58A5: $21 $90 $C2
    add  hl, de                                   ; $58A8: $19
    ld   [hl], $03                                ; $58A9: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $58AB: $21 $E0 $C2
    add  hl, de                                   ; $58AE: $19
    ld   [hl], $1C                                ; $58AF: $36 $1C
    ld   a, $39                                   ; $58B1: $3E $39
    ldh  [hNoiseSfx], a                           ; $58B3: $E0 $F4

jr_015_58B5:
    ld   c, e                                     ; $58B5: $4B
    ld   b, d                                     ; $58B6: $42
    ld   a, $18                                   ; $58B7: $3E $18
    call label_3BAA                               ; $58B9: $CD $AA $3B
    pop  bc                                       ; $58BC: $C1
    jp   IncrementEntityWalkingAttr               ; $58BD: $C3 $12 $3B

jr_015_58C0:
    rra                                           ; $58C0: $1F
    rra                                           ; $58C1: $1F
    rra                                           ; $58C2: $1F
    and  $03                                      ; $58C3: $E6 $03
    ld   hl, wEntitiesUnknownTableB               ; $58C5: $21 $B0 $C2
    add  hl, bc                                   ; $58C8: $09
    ld   [hl], a                                  ; $58C9: $77
    call GetEntityTransitionCountdown             ; $58CA: $CD $05 $0C
    rra                                           ; $58CD: $1F
    rra                                           ; $58CE: $1F
    rra                                           ; $58CF: $1F
    rra                                           ; $58D0: $1F
    and  $0F                                      ; $58D1: $E6 $0F
    ld   e, a                                     ; $58D3: $5F
    ld   d, b                                     ; $58D4: $50
    ld   hl, $583C                                ; $58D5: $21 $3C $58
    add  hl, de                                   ; $58D8: $19
    ld   a, [hl]                                  ; $58D9: $7E
    ld   [$D21D], a                               ; $58DA: $EA $1D $D2
    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    cp   $40                                      ; $58E0: $FE $40
    jp   c, label_015_582B                        ; $58E2: $DA $2B $58

    and  $1F                                      ; $58E5: $E6 $1F
    jp   z, label_015_5819                        ; $58E7: $CA $19 $58

    jp   label_015_582B                           ; $58EA: $C3 $2B $58

    call GetEntityTransitionCountdown             ; $58ED: $CD $05 $0C
    jr   nz, jr_015_5908                          ; $58F0: $20 $16

    ld   [hl], $27                                ; $58F2: $36 $27
    ld   a, $35                                   ; $58F4: $3E $35
    ldh  [hJingle], a                             ; $58F6: $E0 $F2
    ld   hl, wEntitiesPosYTable                         ; $58F8: $21 $10 $C2
    add  hl, bc                                   ; $58FB: $09
    ld   a, [hl]                                  ; $58FC: $7E
    add  $08                                      ; $58FD: $C6 $08
    ld   [hl], a                                  ; $58FF: $77
    ld   a, $01                                   ; $5900: $3E $01
    ld   [$D21A], a                               ; $5902: $EA $1A $D2
    jp   IncrementEntityWalkingAttr               ; $5905: $C3 $12 $3B

jr_015_5908:
    ld   hl, wEntitiesUnknownTableB               ; $5908: $21 $B0 $C2
    add  hl, bc                                   ; $590B: $09
    ld   [hl], $04                                ; $590C: $36 $04
    jp   label_015_582B                           ; $590E: $C3 $2B $58

    ld   d, b                                     ; $5911: $50
    jr   z, @+$7A                                 ; $5912: $28 $78

    jr   @-$76                                    ; $5914: $18 $88

    jr   c, jr_015_5980                           ; $5916: $38 $68

    ld   d, b                                     ; $5918: $50
    jr   nc, jr_015_594B                          ; $5919: $30 $30

    jr   nc, @+$52                                ; $591B: $30 $50

    ld   d, b                                     ; $591D: $50
    ld   [hl], b                                  ; $591E: $70
    ld   [hl], b                                  ; $591F: $70
    ld   [hl], h                                  ; $5920: $74
    nop                                           ; $5921: $00
    ld   bc, $0302                                ; $5922: $01 $02 $03
    inc  b                                        ; $5925: $04
    call GetEntityTransitionCountdown             ; $5926: $CD $05 $0C
    jr   nz, jr_015_594A                          ; $5929: $20 $1F

    call GetRandomByte                            ; $592B: $CD $0D $28
    and  $07                                      ; $592E: $E6 $07
    ld   e, a                                     ; $5930: $5F
    ld   d, b                                     ; $5931: $50
    ld   hl, $5911                                ; $5932: $21 $11 $59
    add  hl, de                                   ; $5935: $19
    ld   a, [hl]                                  ; $5936: $7E
    ld   [$D21B], a                               ; $5937: $EA $1B $D2
    ld   hl, $5919                                ; $593A: $21 $19 $59
    add  hl, de                                   ; $593D: $19
    ld   a, [hl]                                  ; $593E: $7E
    ld   [$D21C], a                               ; $593F: $EA $1C $D2
    call GetEntityTransitionCountdown             ; $5942: $CD $05 $0C
    ld   [hl], $1F                                ; $5945: $36 $1F
    jp   IncrementEntityWalkingAttr               ; $5947: $C3 $12 $3B

jr_015_594A:
    rra                                           ; $594A: $1F

jr_015_594B:
    rra                                           ; $594B: $1F
    rra                                           ; $594C: $1F
    and  $0F                                      ; $594D: $E6 $0F
    ld   e, a                                     ; $594F: $5F
    ld   d, b                                     ; $5950: $50
    ld   hl, $5921                                ; $5951: $21 $21 $59
    add  hl, de                                   ; $5954: $19
    ld   a, [hl]                                  ; $5955: $7E
    ldh  [hActiveEntitySpriteVariant], a               ; $5956: $E0 $F1
    jp   $572B                                    ; $5958: $C3 $2B $57

    jr   @+$16                                    ; $595B: $18 $14

    db   $10                                      ; $595D: $10
    inc  c                                        ; $595E: $0C
    ld   [$0205], sp                              ; $595F: $08 $05 $02
    ld   bc, $E0AF                                ; $5962: $01 $AF $E0
    pop  af                                       ; $5965: $F1
    call $572B                                    ; $5966: $CD $2B $57
    ldh  a, [hLinkPositionY]                      ; $5969: $F0 $99
    push af                                       ; $596B: $F5
    ldh  a, [hLinkPositionX]                      ; $596C: $F0 $98
    push af                                       ; $596E: $F5
    ld   a, [$D21B]                               ; $596F: $FA $1B $D2
    ldh  [hLinkPositionX], a                      ; $5972: $E0 $98
    ld   a, [$D21C]                               ; $5974: $FA $1C $D2
    ldh  [hLinkPositionY], a                      ; $5977: $E0 $99
    call GetEntityTransitionCountdown             ; $5979: $CD $05 $0C
    rra                                           ; $597C: $1F
    rra                                           ; $597D: $1F
    and  $07                                      ; $597E: $E6 $07

jr_015_5980:
    ld   e, a                                     ; $5980: $5F
    ld   d, b                                     ; $5981: $50
    ld   hl, $595B                                ; $5982: $21 $5B $59
    add  hl, de                                   ; $5985: $19
    ld   a, [hl]                                  ; $5986: $7E
    call label_3BAA                               ; $5987: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $598A: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $598D: $F0 $EC
    sub  [hl]                                     ; $598F: $96
    add  $03                                      ; $5990: $C6 $03
    cp   $06                                      ; $5992: $FE $06
    jr   nc, jr_015_59AC                          ; $5994: $30 $16

    ld   hl, hLinkPositionX                       ; $5996: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $5999: $F0 $EE
    sub  [hl]                                     ; $599B: $96
    add  $03                                      ; $599C: $C6 $03
    cp   $06                                      ; $599E: $FE $06
    jr   nc, jr_015_59AC                          ; $59A0: $30 $0A

    call GetEntityTransitionCountdown             ; $59A2: $CD $05 $0C
    ld   [hl], $50                                ; $59A5: $36 $50
    call IncrementEntityWalkingAttr               ; $59A7: $CD $12 $3B
    ld   [hl], $01                                ; $59AA: $36 $01

jr_015_59AC:
    pop  af                                       ; $59AC: $F1
    ldh  [hLinkPositionX], a                      ; $59AD: $E0 $98
    pop  af                                       ; $59AF: $F1
    ldh  [hLinkPositionY], a                      ; $59B0: $E0 $99
    jp   label_015_7B88                           ; $59B2: $C3 $88 $7B

    nop                                           ; $59B5: $00
    ld   a, [bc]                                  ; $59B6: $0A
    rrca                                          ; $59B7: $0F
    dec  b                                        ; $59B8: $05
    call GetEntityTransitionCountdown             ; $59B9: $CD $05 $0C
    jr   nz, jr_015_59D3                          ; $59BC: $20 $15

    call func_015_542E                            ; $59BE: $CD $2E $54
    ld   a, $01                                   ; $59C1: $3E $01
    ld   [$D21A], a                               ; $59C3: $EA $1A $D2
    ld   a, $06                                   ; $59C6: $3E $06
    call SetEntitySpriteVariant                   ; $59C8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $59CB: $CD $05 $0C
    ld   [hl], $50                                ; $59CE: $36 $50
    jp   IncrementEntityWalkingAttr               ; $59D0: $C3 $12 $3B

jr_015_59D3:
    ld   a, [$D221]                               ; $59D3: $FA $21 $D2
    cp   $80                                      ; $59D6: $FE $80
    jr   nc, jr_015_59DE                          ; $59D8: $30 $04

    inc  a                                        ; $59DA: $3C
    ld   [$D221], a                               ; $59DB: $EA $21 $D2

jr_015_59DE:
    ld   a, [$D221]                               ; $59DE: $FA $21 $D2
    ld   hl, $D222                                ; $59E1: $21 $22 $D2
    add  [hl]                                     ; $59E4: $86
    ld   [hl], a                                  ; $59E5: $77
    jr   nc, jr_015_59EC                          ; $59E6: $30 $04

    ld   hl, $D223                                ; $59E8: $21 $23 $D2
    inc  [hl]                                     ; $59EB: $34

jr_015_59EC:
    ld   a, [$D223]                               ; $59EC: $FA $23 $D2
    and  $03                                      ; $59EF: $E6 $03
    ld   e, a                                     ; $59F1: $5F
    ld   d, b                                     ; $59F2: $50
    ld   hl, $59B5                                ; $59F3: $21 $B5 $59
    add  hl, de                                   ; $59F6: $19
    ld   a, [hl]                                  ; $59F7: $7E
    ld   hl, wEntitiesUnknowTableQ                ; $59F8: $21 $80 $C3
    add  hl, bc                                   ; $59FB: $09
    ld   [hl], a                                  ; $59FC: $77
    ld   hl, wEntitiesUnknownTableB               ; $59FD: $21 $B0 $C2
    add  hl, bc                                   ; $5A00: $09
    ld   [hl], b                                  ; $5A01: $70
    jp   label_015_582B                           ; $5A02: $C3 $2B $58

    call GetEntityTransitionCountdown             ; $5A05: $CD $05 $0C
    jr   nz, jr_015_5A10                          ; $5A08: $20 $06

    call func_015_5128                            ; $5A0A: $CD $28 $51
    jp   IncrementEntityWalkingAttr               ; $5A0D: $C3 $12 $3B

jr_015_5A10:
    cp   $18                                      ; $5A10: $FE $18
    jr   nc, jr_015_5A1C                          ; $5A12: $30 $08

    rra                                           ; $5A14: $1F
    rra                                           ; $5A15: $1F
    rra                                           ; $5A16: $1F
    and  $03                                      ; $5A17: $E6 $03
    call SetEntitySpriteVariant                   ; $5A19: $CD $0C $3B

jr_015_5A1C:
    jp   $572B                                    ; $5A1C: $C3 $2B $57

    call $572B                                    ; $5A1F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5A22: $F0 $98
    push af                                       ; $5A24: $F5
    ldh  a, [hLinkPositionY]                      ; $5A25: $F0 $99
    push af                                       ; $5A27: $F5
    ld   a, $50                                   ; $5A28: $3E $50
    ldh  [hLinkPositionX], a                      ; $5A2A: $E0 $98
    ld   a, $30                                   ; $5A2C: $3E $30
    ldh  [hLinkPositionY], a                      ; $5A2E: $E0 $99
    ld   a, $10                                   ; $5A30: $3E $10
    call label_3BAA                               ; $5A32: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5A35: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $5A38: $F0 $EC
    sub  [hl]                                     ; $5A3A: $96
    add  $03                                      ; $5A3B: $C6 $03
    cp   $06                                      ; $5A3D: $FE $06
    jr   nc, jr_015_5A5E                          ; $5A3F: $30 $1D

    ld   hl, hLinkPositionX                       ; $5A41: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $5A44: $F0 $EE
    sub  [hl]                                     ; $5A46: $96
    add  $03                                      ; $5A47: $C6 $03
    cp   $06                                      ; $5A49: $FE $06
    jr   nc, jr_015_5A5E                          ; $5A4B: $30 $11

    call func_015_52BB                            ; $5A4D: $CD $BB $52
    call GetEntityTransitionCountdown             ; $5A50: $CD $05 $0C
    ld   [hl], $31                                ; $5A53: $36 $31
    ld   hl, wEntitiesHealthTable                 ; $5A55: $21 $60 $C3
    add  hl, bc                                   ; $5A58: $09
    ld   [hl], $FF                                ; $5A59: $36 $FF
    call func_015_5F9A                            ; $5A5B: $CD $9A $5F

jr_015_5A5E:
    pop  af                                       ; $5A5E: $F1
    ldh  [hLinkPositionY], a                      ; $5A5F: $E0 $99
    pop  af                                       ; $5A61: $F1
    ldh  [hLinkPositionX], a                      ; $5A62: $E0 $98
    jp   label_015_7B88                           ; $5A64: $C3 $88 $7B

func_015_5A67:
    call func_015_5D8D                            ; $5A67: $CD $8D $5D
    call func_015_5B2C                            ; $5A6A: $CD $2C $5B
    call func_015_5B0B                            ; $5A6D: $CD $0B $5B
    jp   label_015_5D48                           ; $5A70: $C3 $48 $5D

    ld   l, d                                     ; $5A73: $6A
    nop                                           ; $5A74: $00
    ld   l, h                                     ; $5A75: $6C
    nop                                           ; $5A76: $00
    ld   l, h                                     ; $5A77: $6C
    jr   nz, jr_015_5AE4                          ; $5A78: $20 $6A

    jr   nz, jr_015_5AE6                          ; $5A7A: $20 $6A

    nop                                           ; $5A7C: $00
    rst  $38                                      ; $5A7D: $FF
    rst  $38                                      ; $5A7E: $FF
    ld   l, d                                     ; $5A7F: $6A
    jr   nz, @+$01                                ; $5A80: $20 $FF

    rst  $38                                      ; $5A82: $FF
    nop                                           ; $5A83: $00
    nop                                           ; $5A84: $00
    ld   l, d                                     ; $5A85: $6A
    nop                                           ; $5A86: $00
    ld   [$7A08], sp                              ; $5A87: $08 $08 $7A
    nop                                           ; $5A8A: $00
    ld   [$7A00], sp                              ; $5A8B: $08 $00 $7A
    jr   nz, jr_015_5A90                          ; $5A8E: $20 $00

jr_015_5A90:
    ld   [$206A], sp                              ; $5A90: $08 $6A $20
    nop                                           ; $5A93: $00
    nop                                           ; $5A94: $00
    nop                                           ; $5A95: $00
    nop                                           ; $5A96: $00
    ld   [bc], a                                  ; $5A97: $02
    nop                                           ; $5A98: $00
    nop                                           ; $5A99: $00
    nop                                           ; $5A9A: $00
    nop                                           ; $5A9B: $00
    ld   [bc], a                                  ; $5A9C: $02
    inc  b                                        ; $5A9D: $04
    inc  b                                        ; $5A9E: $04
    inc  b                                        ; $5A9F: $04
    inc  b                                        ; $5AA0: $04
    inc  b                                        ; $5AA1: $04
    dec  b                                        ; $5AA2: $05
    dec  b                                        ; $5AA3: $05
    dec  b                                        ; $5AA4: $05
    dec  b                                        ; $5AA5: $05
    dec  b                                        ; $5AA6: $05
    ldh  a, [hWaveSfx]                            ; $5AA7: $F0 $F3
    di                                            ; $5AA9: $F3
    ldh  a, [hFFF5]                               ; $5AAA: $F0 $F5
    ldh  a, [hWaveSfx]                            ; $5AAC: $F0 $F3
    di                                            ; $5AAE: $F3
    ldh  a, [hFFF5]                               ; $5AAF: $F0 $F5
    pop  af                                       ; $5AB1: $F1
    ldh  a, [hActiveEntitySpriteVariant]               ; $5AB2: $F0 $F1
    ld   a, [c]                                   ; $5AB4: $F2
    ldh  a, [rIF]                                 ; $5AB5: $F0 $0F
    db   $10                                      ; $5AB7: $10
    rrca                                          ; $5AB8: $0F
    ld   c, $10                                   ; $5AB9: $0E $10
    db   $ED                                      ; $5ABB: $ED
    db   $ED                                      ; $5ABC: $ED
    pop  af                                       ; $5ABD: $F1
    pop  af                                       ; $5ABE: $F1
    db   $FD                                      ; $5ABF: $FD
    db   $ED                                      ; $5AC0: $ED
    db   $ED                                      ; $5AC1: $ED
    pop  af                                       ; $5AC2: $F1
    pop  af                                       ; $5AC3: $F1
    db   $FD                                      ; $5AC4: $FD
    db   $F4                                      ; $5AC5: $F4
    or   $F7                                      ; $5AC6: $F6 $F7
    or   $F8                                      ; $5AC8: $F6 $F8
    db   $F4                                      ; $5ACA: $F4
    or   $F7                                      ; $5ACB: $F6 $F7
    or   $F8                                      ; $5ACD: $F6 $F8
    ld   bc, $0101                                ; $5ACF: $01 $01 $01
    ld   bc, $0103                                ; $5AD2: $01 $03 $01
    ld   bc, $0101                                ; $5AD5: $01 $01 $01
    inc  bc                                       ; $5AD8: $03
    ld   [bc], a                                  ; $5AD9: $02
    ld   [bc], a                                  ; $5ADA: $02
    ld   [bc], a                                  ; $5ADB: $02
    ld   [bc], a                                  ; $5ADC: $02
    ld   [bc], a                                  ; $5ADD: $02
    inc  bc                                       ; $5ADE: $03
    inc  bc                                       ; $5ADF: $03
    inc  bc                                       ; $5AE0: $03
    inc  bc                                       ; $5AE1: $03
    inc  bc                                       ; $5AE2: $03
    db   $10                                      ; $5AE3: $10

jr_015_5AE4:
    dec  c                                        ; $5AE4: $0D
    dec  c                                        ; $5AE5: $0D

jr_015_5AE6:
    db   $10                                      ; $5AE6: $10
    inc  de                                       ; $5AE7: $13
    db   $10                                      ; $5AE8: $10
    dec  c                                        ; $5AE9: $0D
    dec  c                                        ; $5AEA: $0D
    db   $10                                      ; $5AEB: $10
    inc  de                                       ; $5AEC: $13
    push af                                       ; $5AED: $F5
    or   $F5                                      ; $5AEE: $F6 $F5
    db   $F4                                      ; $5AF0: $F4
    di                                            ; $5AF1: $F3
    inc  de                                       ; $5AF2: $13
    ld   [de], a                                  ; $5AF3: $12
    inc  de                                       ; $5AF4: $13
    inc  d                                        ; $5AF5: $14
    dec  d                                        ; $5AF6: $15
    db   $ED                                      ; $5AF7: $ED
    db   $ED                                      ; $5AF8: $ED
    pop  af                                       ; $5AF9: $F1
    pop  af                                       ; $5AFA: $F1
    db   $FD                                      ; $5AFB: $FD
    db   $ED                                      ; $5AFC: $ED
    db   $ED                                      ; $5AFD: $ED
    pop  af                                       ; $5AFE: $F1
    pop  af                                       ; $5AFF: $F1
    db   $FD                                      ; $5B00: $FD
    db   $EB                                      ; $5B01: $EB
    db   $EC                                      ; $5B02: $EC
    db   $ED                                      ; $5B03: $ED
    db   $EC                                      ; $5B04: $EC
    ld   a, [c]                                   ; $5B05: $F2
    db   $EB                                      ; $5B06: $EB
    db   $EC                                      ; $5B07: $EC
    db   $ED                                      ; $5B08: $ED
    db   $EC                                      ; $5B09: $EC
    ld   a, [c]                                   ; $5B0A: $F2

func_015_5B0B:
    ld   hl, wEntitiesSpriteVariantTable               ; $5B0B: $21 $B0 $C3
    add  hl, bc                                   ; $5B0E: $09
    ld   a, [hl]                                  ; $5B0F: $7E
    ld   e, a                                     ; $5B10: $5F
    ld   d, b                                     ; $5B11: $50
    ld   hl, $5AE3                                ; $5B12: $21 $E3 $5A
    add  hl, de                                   ; $5B15: $19
    ldh  a, [wActiveEntityPosX]                   ; $5B16: $F0 $EE
    add  [hl]                                     ; $5B18: $86
    ldh  [wActiveEntityPosX], a                   ; $5B19: $E0 $EE
    ld   hl, $5AF7                                ; $5B1B: $21 $F7 $5A
    add  hl, de                                   ; $5B1E: $19
    ldh  a, [wActiveEntityPosY]                   ; $5B1F: $F0 $EC
    add  $08                                      ; $5B21: $C6 $08
    add  [hl]                                     ; $5B23: $86
    ldh  [wActiveEntityPosY], a                   ; $5B24: $E0 $EC
    ld   hl, $5ACF                                ; $5B26: $21 $CF $5A
    add  hl, de                                   ; $5B29: $19
    jr   jr_015_5B4B                              ; $5B2A: $18 $1F

func_015_5B2C:
    ld   hl, wEntitiesSpriteVariantTable               ; $5B2C: $21 $B0 $C3
    add  hl, bc                                   ; $5B2F: $09
    ld   a, [hl]                                  ; $5B30: $7E
    ld   e, a                                     ; $5B31: $5F
    ld   d, b                                     ; $5B32: $50
    ld   hl, $5AA7                                ; $5B33: $21 $A7 $5A
    add  hl, de                                   ; $5B36: $19
    ldh  a, [wActiveEntityPosX]                   ; $5B37: $F0 $EE
    add  [hl]                                     ; $5B39: $86
    ldh  [wActiveEntityPosX], a                   ; $5B3A: $E0 $EE
    ld   hl, $5ABB                                ; $5B3C: $21 $BB $5A
    add  hl, de                                   ; $5B3F: $19
    ldh  a, [wActiveEntityPosY]                   ; $5B40: $F0 $EC
    add  $08                                      ; $5B42: $C6 $08
    add  [hl]                                     ; $5B44: $86
    ldh  [wActiveEntityPosY], a                   ; $5B45: $E0 $EC
    ld   hl, $5A93                                ; $5B47: $21 $93 $5A
    add  hl, de                                   ; $5B4A: $19

jr_015_5B4B:
    ld   a, [hl]                                  ; $5B4B: $7E
    cp   $04                                      ; $5B4C: $FE $04
    jr   nc, jr_015_5B5A                          ; $5B4E: $30 $0A

    ldh  [hActiveEntitySpriteVariant], a               ; $5B50: $E0 $F1
    ld   de, $5A73                                ; $5B52: $11 $73 $5A
    call RenderAnimatedActiveEntity                               ; $5B55: $CD $C0 $3B
    jr   jr_015_5B6C                              ; $5B58: $18 $12

jr_015_5B5A:
    sub  $04                                      ; $5B5A: $D6 $04
    rla                                           ; $5B5C: $17
    rla                                           ; $5B5D: $17
    rla                                           ; $5B5E: $17
    and  $F8                                      ; $5B5F: $E6 $F8
    ld   e, a                                     ; $5B61: $5F
    ld   d, b                                     ; $5B62: $50
    ld   hl, $5A83                                ; $5B63: $21 $83 $5A
    add  hl, de                                   ; $5B66: $19
    ld   c, $02                                   ; $5B67: $0E $02
    call label_3CE6                               ; $5B69: $CD $E6 $3C

jr_015_5B6C:
    ld   a, $02                                   ; $5B6C: $3E $02
    call label_3DA0                               ; $5B6E: $CD $A0 $3D
    jp   label_3D8A                               ; $5B71: $C3 $8A $3D

    ld   hl, sp-$08                               ; $5B74: $F8 $F8
    ld   h, b                                     ; $5B76: $60
    nop                                           ; $5B77: $00
    ld   hl, sp+$00                               ; $5B78: $F8 $00
    ld   h, d                                     ; $5B7A: $62
    nop                                           ; $5B7B: $00
    ld   hl, sp+$08                               ; $5B7C: $F8 $08
    ld   h, d                                     ; $5B7E: $62
    jr   nz, @-$06                                ; $5B7F: $20 $F8

    db   $10                                      ; $5B81: $10
    ld   h, b                                     ; $5B82: $60
    jr   nz, @+$07                                ; $5B83: $20 $05

    ld   hl, sp+$6E                               ; $5B85: $F8 $6E
    nop                                           ; $5B87: $00
    ld   [$6400], sp                              ; $5B88: $08 $00 $64
    nop                                           ; $5B8B: $00
    ld   [$6408], sp                              ; $5B8C: $08 $08 $64
    jr   nz, @+$07                                ; $5B8F: $20 $05

    db   $10                                      ; $5B91: $10
    ld   l, [hl]                                  ; $5B92: $6E
    jr   nz, @-$06                                ; $5B93: $20 $F8

    ld   hl, sp+$60                               ; $5B95: $F8 $60
    nop                                           ; $5B97: $00
    ld   hl, sp+$00                               ; $5B98: $F8 $00
    ld   h, d                                     ; $5B9A: $62
    nop                                           ; $5B9B: $00
    ld   hl, sp+$08                               ; $5B9C: $F8 $08
    ld   h, d                                     ; $5B9E: $62
    jr   nz, @-$06                                ; $5B9F: $20 $F8

    db   $10                                      ; $5BA1: $10
    ld   h, b                                     ; $5BA2: $60
    jr   nz, @+$07                                ; $5BA3: $20 $05

    ld   sp, hl                                   ; $5BA5: $F9
    ld   l, [hl]                                  ; $5BA6: $6E
    nop                                           ; $5BA7: $00
    ld   [$6400], sp                              ; $5BA8: $08 $00 $64
    nop                                           ; $5BAB: $00
    ld   [$6408], sp                              ; $5BAC: $08 $08 $64
    jr   nz, @+$07                                ; $5BAF: $20 $05

    rrca                                          ; $5BB1: $0F
    ld   l, [hl]                                  ; $5BB2: $6E
    jr   nz, @-$06                                ; $5BB3: $20 $F8

    ld   hl, sp+$60                               ; $5BB5: $F8 $60
    nop                                           ; $5BB7: $00
    ld   hl, sp+$00                               ; $5BB8: $F8 $00
    ld   h, d                                     ; $5BBA: $62
    nop                                           ; $5BBB: $00
    ld   hl, sp+$08                               ; $5BBC: $F8 $08
    ld   h, d                                     ; $5BBE: $62
    jr   nz, @-$06                                ; $5BBF: $20 $F8

    db   $10                                      ; $5BC1: $10
    ld   h, b                                     ; $5BC2: $60
    jr   nz, jr_015_5BCB                          ; $5BC3: $20 $06

    ld   sp, hl                                   ; $5BC5: $F9
    ld   l, [hl]                                  ; $5BC6: $6E
    nop                                           ; $5BC7: $00
    ld   [$6400], sp                              ; $5BC8: $08 $00 $64

jr_015_5BCB:
    nop                                           ; $5BCB: $00
    ld   [$6408], sp                              ; $5BCC: $08 $08 $64
    jr   nz, jr_015_5BD7                          ; $5BCF: $20 $06

    rrca                                          ; $5BD1: $0F
    ld   l, [hl]                                  ; $5BD2: $6E
    jr   nz, @-$06                                ; $5BD3: $20 $F8

    ld   hl, sp+$60                               ; $5BD5: $F8 $60

jr_015_5BD7:
    nop                                           ; $5BD7: $00
    ld   hl, sp+$00                               ; $5BD8: $F8 $00
    ld   h, d                                     ; $5BDA: $62
    nop                                           ; $5BDB: $00
    ld   hl, sp+$08                               ; $5BDC: $F8 $08
    ld   h, d                                     ; $5BDE: $62
    jr   nz, @-$06                                ; $5BDF: $20 $F8

    db   $10                                      ; $5BE1: $10
    ld   h, b                                     ; $5BE2: $60
    jr   nz, jr_015_5BEB                          ; $5BE3: $20 $06

    ld   hl, sp+$6E                               ; $5BE5: $F8 $6E
    nop                                           ; $5BE7: $00
    ld   [$6400], sp                              ; $5BE8: $08 $00 $64

jr_015_5BEB:
    nop                                           ; $5BEB: $00
    ld   [$6408], sp                              ; $5BEC: $08 $08 $64

jr_015_5BEF:
    jr   nz, jr_015_5BF7                          ; $5BEF: $20 $06

    db   $10                                      ; $5BF1: $10
    ld   l, [hl]                                  ; $5BF2: $6E
    jr   nz, jr_015_5BEF                          ; $5BF3: $20 $FA

    ld   hl, sp+$60                               ; $5BF5: $F8 $60

jr_015_5BF7:
    nop                                           ; $5BF7: $00
    ld   a, [$6200]                               ; $5BF8: $FA $00 $62

jr_015_5BFB:
    nop                                           ; $5BFB: $00
    ld   a, [$6208]                               ; $5BFC: $FA $08 $62
    jr   nz, jr_015_5BFB                          ; $5BFF: $20 $FA

    db   $10                                      ; $5C01: $10
    ld   h, b                                     ; $5C02: $60
    jr   nz, @+$0A                                ; $5C03: $20 $08

    ld   hl, sp+$6E                               ; $5C05: $F8 $6E
    nop                                           ; $5C07: $00
    ld   [$6400], sp                              ; $5C08: $08 $00 $64
    nop                                           ; $5C0B: $00
    ld   [$6408], sp                              ; $5C0C: $08 $08 $64

jr_015_5C0F:
    jr   nz, @+$0A                                ; $5C0F: $20 $08

    db   $10                                      ; $5C11: $10
    ld   l, [hl]                                  ; $5C12: $6E
    jr   nz, jr_015_5C0F                          ; $5C13: $20 $FA

    ld   hl, sp+$60                               ; $5C15: $F8 $60
    nop                                           ; $5C17: $00
    ld   a, [$6600]                               ; $5C18: $FA $00 $66

jr_015_5C1B:
    nop                                           ; $5C1B: $00
    ld   a, [$6608]                               ; $5C1C: $FA $08 $66
    jr   nz, jr_015_5C1B                          ; $5C1F: $20 $FA

    db   $10                                      ; $5C21: $10
    ld   h, b                                     ; $5C22: $60
    jr   nz, @+$07                                ; $5C23: $20 $05

    ld   hl, sp+$6E                               ; $5C25: $F8 $6E
    nop                                           ; $5C27: $00
    ld   [$6800], sp                              ; $5C28: $08 $00 $68
    nop                                           ; $5C2B: $00
    ld   [$6808], sp                              ; $5C2C: $08 $08 $68

jr_015_5C2F:
    jr   nz, @+$07                                ; $5C2F: $20 $05

    db   $10                                      ; $5C31: $10
    ld   l, [hl]                                  ; $5C32: $6E
    jr   nz, jr_015_5C2F                          ; $5C33: $20 $FA

    ld   hl, sp+$60                               ; $5C35: $F8 $60
    nop                                           ; $5C37: $00
    ld   a, [$6600]                               ; $5C38: $FA $00 $66

jr_015_5C3B:
    nop                                           ; $5C3B: $00
    ld   a, [$6608]                               ; $5C3C: $FA $08 $66
    jr   nz, jr_015_5C3B                          ; $5C3F: $20 $FA

    db   $10                                      ; $5C41: $10
    ld   h, b                                     ; $5C42: $60
    jr   nz, @+$07                                ; $5C43: $20 $05

    ld   sp, hl                                   ; $5C45: $F9
    ld   l, [hl]                                  ; $5C46: $6E
    nop                                           ; $5C47: $00
    ld   [$6800], sp                              ; $5C48: $08 $00 $68
    nop                                           ; $5C4B: $00
    ld   [$6808], sp                              ; $5C4C: $08 $08 $68

jr_015_5C4F:
    jr   nz, @+$07                                ; $5C4F: $20 $05

    rrca                                          ; $5C51: $0F
    ld   l, [hl]                                  ; $5C52: $6E
    jr   nz, jr_015_5C4F                          ; $5C53: $20 $FA

    ld   hl, sp+$60                               ; $5C55: $F8 $60
    nop                                           ; $5C57: $00
    ld   a, [$6600]                               ; $5C58: $FA $00 $66

jr_015_5C5B:
    nop                                           ; $5C5B: $00
    ld   a, [$6608]                               ; $5C5C: $FA $08 $66
    jr   nz, jr_015_5C5B                          ; $5C5F: $20 $FA

    db   $10                                      ; $5C61: $10
    ld   h, b                                     ; $5C62: $60
    jr   nz, jr_015_5C6B                          ; $5C63: $20 $06

    ld   sp, hl                                   ; $5C65: $F9
    ld   l, [hl]                                  ; $5C66: $6E
    nop                                           ; $5C67: $00
    ld   [$6800], sp                              ; $5C68: $08 $00 $68

jr_015_5C6B:
    nop                                           ; $5C6B: $00
    ld   [$6808], sp                              ; $5C6C: $08 $08 $68

jr_015_5C6F:
    jr   nz, jr_015_5C77                          ; $5C6F: $20 $06

    rrca                                          ; $5C71: $0F
    ld   l, [hl]                                  ; $5C72: $6E
    jr   nz, jr_015_5C6F                          ; $5C73: $20 $FA

    ld   hl, sp+$60                               ; $5C75: $F8 $60

jr_015_5C77:
    nop                                           ; $5C77: $00
    ld   a, [$6600]                               ; $5C78: $FA $00 $66

jr_015_5C7B:
    nop                                           ; $5C7B: $00
    ld   a, [$6608]                               ; $5C7C: $FA $08 $66
    jr   nz, jr_015_5C7B                          ; $5C7F: $20 $FA

    db   $10                                      ; $5C81: $10
    ld   h, b                                     ; $5C82: $60
    jr   nz, jr_015_5C8B                          ; $5C83: $20 $06

    ld   hl, sp+$6E                               ; $5C85: $F8 $6E
    nop                                           ; $5C87: $00
    ld   [$6800], sp                              ; $5C88: $08 $00 $68

jr_015_5C8B:
    nop                                           ; $5C8B: $00
    ld   [$6808], sp                              ; $5C8C: $08 $08 $68
    jr   nz, jr_015_5C97                          ; $5C8F: $20 $06

    db   $10                                      ; $5C91: $10
    ld   l, [hl]                                  ; $5C92: $6E
    jr   nz, @-$06                                ; $5C93: $20 $F8

    ld   hl, sp+$60                               ; $5C95: $F8 $60

jr_015_5C97:
    nop                                           ; $5C97: $00
    ld   hl, sp+$00                               ; $5C98: $F8 $00
    ld   h, [hl]                                  ; $5C9A: $66
    nop                                           ; $5C9B: $00
    ld   hl, sp+$08                               ; $5C9C: $F8 $08
    ld   h, [hl]                                  ; $5C9E: $66
    jr   nz, @-$06                                ; $5C9F: $20 $F8

    db   $10                                      ; $5CA1: $10
    ld   h, b                                     ; $5CA2: $60
    jr   nz, @+$06                                ; $5CA3: $20 $04

    ld   hl, sp+$6E                               ; $5CA5: $F8 $6E
    nop                                           ; $5CA7: $00
    ld   [$6800], sp                              ; $5CA8: $08 $00 $68
    nop                                           ; $5CAB: $00
    ld   [$6808], sp                              ; $5CAC: $08 $08 $68
    jr   nz, jr_015_5CB5                          ; $5CAF: $20 $04

    db   $10                                      ; $5CB1: $10
    ld   l, [hl]                                  ; $5CB2: $6E
    jr   nz, @-$06                                ; $5CB3: $20 $F8

jr_015_5CB5:
    db   $FC                                      ; $5CB5: $FC
    ld   [hl], d                                  ; $5CB6: $72
    nop                                           ; $5CB7: $00
    ld   hl, sp+$04                               ; $5CB8: $F8 $04
    ld   [hl], h                                  ; $5CBA: $74
    nop                                           ; $5CBB: $00
    ld   [$7600], sp                              ; $5CBC: $08 $00 $76
    nop                                           ; $5CBF: $00
    ld   [$7808], sp                              ; $5CC0: $08 $08 $78
    nop                                           ; $5CC3: $00
    rst  $38                                      ; $5CC4: $FF
    rst  $38                                      ; $5CC5: $FF
    rst  $38                                      ; $5CC6: $FF
    rst  $38                                      ; $5CC7: $FF
    rst  $38                                      ; $5CC8: $FF
    rst  $38                                      ; $5CC9: $FF
    rst  $38                                      ; $5CCA: $FF
    rst  $38                                      ; $5CCB: $FF
    rst  $38                                      ; $5CCC: $FF
    rst  $38                                      ; $5CCD: $FF
    rst  $38                                      ; $5CCE: $FF
    rst  $38                                      ; $5CCF: $FF
    rst  $38                                      ; $5CD0: $FF
    rst  $38                                      ; $5CD1: $FF
    rst  $38                                      ; $5CD2: $FF
    rst  $38                                      ; $5CD3: $FF
    ld   a, [$72FB]                               ; $5CD4: $FA $FB $72
    nop                                           ; $5CD7: $00
    ld   a, [$7403]                               ; $5CD8: $FA $03 $74
    nop                                           ; $5CDB: $00
    ld   [$7600], sp                              ; $5CDC: $08 $00 $76
    nop                                           ; $5CDF: $00
    ld   [$7808], sp                              ; $5CE0: $08 $08 $78
    nop                                           ; $5CE3: $00
    rst  $38                                      ; $5CE4: $FF
    rst  $38                                      ; $5CE5: $FF
    rst  $38                                      ; $5CE6: $FF
    rst  $38                                      ; $5CE7: $FF
    rst  $38                                      ; $5CE8: $FF
    rst  $38                                      ; $5CE9: $FF
    rst  $38                                      ; $5CEA: $FF
    rst  $38                                      ; $5CEB: $FF
    rst  $38                                      ; $5CEC: $FF
    rst  $38                                      ; $5CED: $FF
    rst  $38                                      ; $5CEE: $FF
    rst  $38                                      ; $5CEF: $FF
    rst  $38                                      ; $5CF0: $FF

jr_015_5CF1:
    rst  $38                                      ; $5CF1: $FF
    rst  $38                                      ; $5CF2: $FF
    rst  $38                                      ; $5CF3: $FF
    ld   hl, sp+$04                               ; $5CF4: $F8 $04
    ld   [hl], h                                  ; $5CF6: $74
    jr   nz, jr_015_5CF1                          ; $5CF7: $20 $F8

    inc  c                                        ; $5CF9: $0C
    ld   [hl], d                                  ; $5CFA: $72
    jr   nz, jr_015_5D05                          ; $5CFB: $20 $08

    nop                                           ; $5CFD: $00
    ld   a, b                                     ; $5CFE: $78
    jr   nz, jr_015_5D09                          ; $5CFF: $20 $08

    ld   [$2076], sp                              ; $5D01: $08 $76 $20
    rst  $38                                      ; $5D04: $FF

jr_015_5D05:
    rst  $38                                      ; $5D05: $FF
    rst  $38                                      ; $5D06: $FF
    rst  $38                                      ; $5D07: $FF
    rst  $38                                      ; $5D08: $FF

jr_015_5D09:
    rst  $38                                      ; $5D09: $FF
    rst  $38                                      ; $5D0A: $FF
    rst  $38                                      ; $5D0B: $FF
    rst  $38                                      ; $5D0C: $FF
    rst  $38                                      ; $5D0D: $FF
    rst  $38                                      ; $5D0E: $FF
    rst  $38                                      ; $5D0F: $FF
    rst  $38                                      ; $5D10: $FF
    rst  $38                                      ; $5D11: $FF
    rst  $38                                      ; $5D12: $FF

jr_015_5D13:
    rst  $38                                      ; $5D13: $FF
    ld   a, [$7405]                               ; $5D14: $FA $05 $74
    jr   nz, jr_015_5D13                          ; $5D17: $20 $FA

    dec  c                                        ; $5D19: $0D
    ld   [hl], d                                  ; $5D1A: $72
    jr   nz, jr_015_5D25                          ; $5D1B: $20 $08

    nop                                           ; $5D1D: $00
    ld   a, b                                     ; $5D1E: $78
    jr   nz, jr_015_5D29                          ; $5D1F: $20 $08

    ld   [$2076], sp                              ; $5D21: $08 $76 $20
    rst  $38                                      ; $5D24: $FF

jr_015_5D25:
    rst  $38                                      ; $5D25: $FF
    rst  $38                                      ; $5D26: $FF
    rst  $38                                      ; $5D27: $FF
    rst  $38                                      ; $5D28: $FF

jr_015_5D29:
    rst  $38                                      ; $5D29: $FF
    rst  $38                                      ; $5D2A: $FF
    rst  $38                                      ; $5D2B: $FF
    rst  $38                                      ; $5D2C: $FF
    rst  $38                                      ; $5D2D: $FF
    rst  $38                                      ; $5D2E: $FF
    rst  $38                                      ; $5D2F: $FF
    rst  $38                                      ; $5D30: $FF
    rst  $38                                      ; $5D31: $FF
    rst  $38                                      ; $5D32: $FF
    rst  $38                                      ; $5D33: $FF
    nop                                           ; $5D34: $00
    ld   bc, $0302                                ; $5D35: $01 $02 $03
    inc  b                                        ; $5D38: $04
    dec  b                                        ; $5D39: $05
    ld   b, $07                                   ; $5D3A: $06 $07
    ld   [$0A09], sp                              ; $5D3C: $08 $09 $0A
    ld   a, [bc]                                  ; $5D3F: $0A
    ld   a, [bc]                                  ; $5D40: $0A
    ld   a, [bc]                                  ; $5D41: $0A
    dec  bc                                       ; $5D42: $0B
    inc  c                                        ; $5D43: $0C
    inc  c                                        ; $5D44: $0C
    inc  c                                        ; $5D45: $0C
    inc  c                                        ; $5D46: $0C
    dec  c                                        ; $5D47: $0D

label_015_5D48:
    ld   hl, wEntitiesSpriteVariantTable               ; $5D48: $21 $B0 $C3
    add  hl, bc                                   ; $5D4B: $09
    ld   a, [hl]                                  ; $5D4C: $7E
    ld   e, a                                     ; $5D4D: $5F
    ld   d, b                                     ; $5D4E: $50
    ld   hl, $5D34                                ; $5D4F: $21 $34 $5D
    add  hl, de                                   ; $5D52: $19
    ld   a, [hl]                                  ; $5D53: $7E
    ld   d, $00                                   ; $5D54: $16 $00
    ld   e, a                                     ; $5D56: $5F
    sla  e                                        ; $5D57: $CB $23
    rl   d                                        ; $5D59: $CB $12
    sla  e                                        ; $5D5B: $CB $23
    rl   d                                        ; $5D5D: $CB $12
    sla  e                                        ; $5D5F: $CB $23
    rl   d                                        ; $5D61: $CB $12
    sla  e                                        ; $5D63: $CB $23
    rl   d                                        ; $5D65: $CB $12
    sla  e                                        ; $5D67: $CB $23
    rl   d                                        ; $5D69: $CB $12
    ld   hl, $5B74                                ; $5D6B: $21 $74 $5B
    add  hl, de                                   ; $5D6E: $19
    ld   c, $08                                   ; $5D6F: $0E $08
    call label_3CE6                               ; $5D71: $CD $E6 $3C
    ld   a, $08                                   ; $5D74: $3E $08
    jp   label_3DA0                               ; $5D76: $C3 $A0 $3D

    ld   e, $00                                   ; $5D79: $1E $00
    ld   e, $60                                   ; $5D7B: $1E $60
    ld   a, h                                     ; $5D7D: $7C
    nop                                           ; $5D7E: $00
    ld   a, h                                     ; $5D7F: $7C
    jr   nz, @+$80                                ; $5D80: $20 $7E

    nop                                           ; $5D82: $00
    ld   a, [hl]                                  ; $5D83: $7E
    jr   nz, jr_015_5D9A                          ; $5D84: $20 $14

    db   $EC                                      ; $5D86: $EC
    nop                                           ; $5D87: $00
    nop                                           ; $5D88: $00
    nop                                           ; $5D89: $00
    nop                                           ; $5D8A: $00
    ldh  a, [rDIV]                                ; $5D8B: $F0 $04

func_015_5D8D:
    ldh  a, [$FFED]                               ; $5D8D: $F0 $ED
    push af                                       ; $5D8F: $F5
    call func_015_5D97                            ; $5D90: $CD $97 $5D
    pop  af                                       ; $5D93: $F1
    ldh  [$FFED], a                               ; $5D94: $E0 $ED
    ret                                           ; $5D96: $C9

func_015_5D97:
    ld   a, [$D21D]                               ; $5D97: $FA $1D $D2

jr_015_5D9A:
    and  a                                        ; $5D9A: $A7
    ret  z                                        ; $5D9B: $C8

    dec  a                                        ; $5D9C: $3D
    ldh  [hActiveEntitySpriteVariant], a               ; $5D9D: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $5D9F: $F0 $E7
    rla                                           ; $5DA1: $17
    rla                                           ; $5DA2: $17
    rla                                           ; $5DA3: $17
    and  $50                                      ; $5DA4: $E6 $50
    ldh  [$FFED], a                               ; $5DA6: $E0 $ED
    ld   a, [$D21E]                               ; $5DA8: $FA $1E $D2
    ld   e, a                                     ; $5DAB: $5F
    ld   d, b                                     ; $5DAC: $50
    ld   hl, $5D85                                ; $5DAD: $21 $85 $5D
    add  hl, de                                   ; $5DB0: $19
    ldh  a, [wActiveEntityPosX]                   ; $5DB1: $F0 $EE
    add  [hl]                                     ; $5DB3: $86
    ldh  [wActiveEntityPosX], a                   ; $5DB4: $E0 $EE
    ld   hl, $5D89                                ; $5DB6: $21 $89 $5D
    add  hl, de                                   ; $5DB9: $19
    ldh  a, [wActiveEntityPosY]                   ; $5DBA: $F0 $EC
    add  [hl]                                     ; $5DBC: $86
    ldh  [wActiveEntityPosY], a                   ; $5DBD: $E0 $EC
    ld   de, $5D79                                ; $5DBF: $11 $79 $5D
    call RenderAnimatedActiveEntity                               ; $5DC2: $CD $C0 $3B
    ld   a, $02                                   ; $5DC5: $3E $02
    call label_3DA0                               ; $5DC7: $CD $A0 $3D
    jp   label_3D8A                               ; $5DCA: $C3 $8A $3D

    ld   b, [hl]                                  ; $5DCD: $46
    nop                                           ; $5DCE: $00
    ld   b, [hl]                                  ; $5DCF: $46
    ld   h, b                                     ; $5DD0: $60
    ld   [hl], b                                  ; $5DD1: $70
    nop                                           ; $5DD2: $00
    rst  $38                                      ; $5DD3: $FF
    rst  $38                                      ; $5DD4: $FF

label_015_5DD5:
    ld   de, $5DCD                                ; $5DD5: $11 $CD $5D
    ret                                           ; $5DD8: $C9

    ld   a, [hl]                                  ; $5DD9: $7E
    nop                                           ; $5DDA: $00
    ld   a, [hl]                                  ; $5DDB: $7E
    jr   nz, @+$7E                                ; $5DDC: $20 $7C

jr_015_5DDE:
    nop                                           ; $5DDE: $00
    ld   a, h                                     ; $5DDF: $7C
    jr   nz, @+$20                                ; $5DE0: $20 $1E

    nop                                           ; $5DE2: $00
    ld   e, $60                                   ; $5DE3: $1E $60
    ld   e, b                                     ; $5DE5: $58
    nop                                           ; $5DE6: $00
    ld   e, b                                     ; $5DE7: $58
    jr   nz, @+$5C                                ; $5DE8: $20 $5A

    nop                                           ; $5DEA: $00
    ld   e, d                                     ; $5DEB: $5A
    jr   nz, jr_015_5DDE                          ; $5DEC: $20 $F0

    rst  $20                                      ; $5DEE: $E7
    rla                                           ; $5DEF: $17
    rla                                           ; $5DF0: $17
    rla                                           ; $5DF1: $17
    and  $50                                      ; $5DF2: $E6 $50
    ldh  [$FFED], a                               ; $5DF4: $E0 $ED
    ld   de, $5DD9                                ; $5DF6: $11 $D9 $5D
    call RenderAnimatedActiveEntity                               ; $5DF9: $CD $C0 $3B
    call func_015_7B0D                            ; $5DFC: $CD $0D $7B
    call label_C56                                ; $5DFF: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $5E02: $F0 $F0
    cp   $04                                      ; $5E04: $FE $04
    jr   nz, jr_015_5E24                          ; $5E06: $20 $1C

    call IsEntityUnknownFZero                     ; $5E08: $CD $00 $0C
    jp   z, ClearEntityStatusAndReturn            ; $5E0B: $CA $31 $7C

    xor  c                                        ; $5E0E: $A9
    bit  0, a                                     ; $5E0F: $CB $47
    ld   e, $FF                                   ; $5E11: $1E $FF
    jr   z, jr_015_5E20                           ; $5E13: $28 $0B

    call IsEntityUnknownFZero                     ; $5E15: $CD $00 $0C
    ld   e, $01                                   ; $5E18: $1E $01
    cp   $08                                      ; $5E1A: $FE $08
    jr   nc, jr_015_5E20                          ; $5E1C: $30 $02

    ld   e, $02                                   ; $5E1E: $1E $02

jr_015_5E20:
    ld   a, e                                     ; $5E20: $7B
    jp   SetEntitySpriteVariant                   ; $5E21: $C3 $0C $3B

jr_015_5E24:
    call func_015_7B88                            ; $5E24: $CD $88 $7B
    call label_3B23                               ; $5E27: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $5E2A: $F0 $F0
    rst  $00                                      ; $5E2C: $C7
    dec  [hl]                                     ; $5E2D: $35
    ld   e, [hl]                                  ; $5E2E: $5E
    add  l                                        ; $5E2F: $85
    ld   e, [hl]                                  ; $5E30: $5E
    xor  h                                        ; $5E31: $AC
    ld   e, [hl]                                  ; $5E32: $5E
    ld   [hl+], a                                 ; $5E33: $22
    ld   e, a                                     ; $5E34: $5F
    call label_3B39                               ; $5E35: $CD $39 $3B

func_015_5E38:
    ld   hl, wEntitiesUnknowTableY                ; $5E38: $21 $D0 $C3
    add  hl, bc                                   ; $5E3B: $09
    ld   a, [hl]                                  ; $5E3C: $7E
    inc  a                                        ; $5E3D: $3C
    ld   [hl], a                                  ; $5E3E: $77
    and  $03                                      ; $5E3F: $E6 $03
    jr   nz, jr_015_5E79                          ; $5E41: $20 $36

    ld   a, $E6                                   ; $5E43: $3E $E6
    call func_003_64CA_trampoline                               ; $5E45: $CD $86 $3B
    ret  c                                        ; $5E48: $D8

    ld   hl, wEntitiesUnknowTableL                ; $5E49: $21 $40 $C3
    add  hl, de                                   ; $5E4C: $19
    ld   [hl], $C2                                ; $5E4D: $36 $C2
    ld   hl, wEntitiesUnknowTableM                ; $5E4F: $21 $50 $C3
    add  hl, de                                   ; $5E52: $19
    ld   [hl], d                                  ; $5E53: $72
    ld   hl, wEntitiesUnknowTableP                ; $5E54: $21 $40 $C4
    add  hl, de                                   ; $5E57: $19
    inc  [hl]                                     ; $5E58: $34
    ldh  a, [hScratch0]                           ; $5E59: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $5E5B: $21 $00 $C2
    add  hl, de                                   ; $5E5E: $19
    ld   [hl], a                                  ; $5E5F: $77
    ldh  a, [hScratch1]                           ; $5E60: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5E62: $21 $10 $C2
    add  hl, de                                   ; $5E65: $19
    ld   [hl], a                                  ; $5E66: $77
    ld   hl, wEntitiesUnknowTableF                ; $5E67: $21 $F0 $C2
    add  hl, de                                   ; $5E6A: $19
    ld   [hl], $0F                                ; $5E6B: $36 $0F
    ld   hl, wEntitiesSpriteVariantTable               ; $5E6D: $21 $B0 $C3
    add  hl, de                                   ; $5E70: $19
    ld   [hl], $01                                ; $5E71: $36 $01
    ld   hl, wEntitiesStateTable                  ; $5E73: $21 $90 $C2
    add  hl, de                                   ; $5E76: $19
    ld   [hl], $04                                ; $5E77: $36 $04

jr_015_5E79:
    ld   hl, wEntitiesCollisionsTable             ; $5E79: $21 $A0 $C2
    add  hl, bc                                   ; $5E7C: $09
    ld   a, [hl]                                  ; $5E7D: $7E
    and  a                                        ; $5E7E: $A7
    jr   z, jr_015_5E84                           ; $5E7F: $28 $03

    jp   ClearEntityStatusAndReturn               ; $5E81: $C3 $31 $7C

jr_015_5E84:
    ret                                           ; $5E84: $C9

    ld   a, $08                                   ; $5E85: $3E $08
    ldh  [hNoiseSfx], a                           ; $5E87: $E0 $F4
    ld   a, $18                                   ; $5E89: $3E $18
    call GetVectorTowardsLink_trampoline          ; $5E8B: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $5E8E: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $5E90: $E0 $9B
    cpl                                           ; $5E92: $2F
    inc  a                                        ; $5E93: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $5E94: $21 $50 $C2
    add  hl, bc                                   ; $5E97: $09
    ld   [hl], a                                  ; $5E98: $77
    ldh  a, [hScratch1]                           ; $5E99: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $5E9B: $E0 $9A
    cpl                                           ; $5E9D: $2F
    inc  a                                        ; $5E9E: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $5E9F: $21 $40 $C2
    add  hl, bc                                   ; $5EA2: $09
    ld   [hl], a                                  ; $5EA3: $77
    ld   a, $10                                   ; $5EA4: $3E $10
    ld   [$C13E], a                               ; $5EA6: $EA $3E $C1
    jp   IncrementEntityWalkingAttr               ; $5EA9: $C3 $12 $3B

    call func_015_5E38                            ; $5EAC: $CD $38 $5E
    ld   a, [$D21A]                               ; $5EAF: $FA $1A $D2
    and  a                                        ; $5EB2: $A7
    ret  nz                                       ; $5EB3: $C0

    ld   a, [$D201]                               ; $5EB4: $FA $01 $D2
    ld   e, a                                     ; $5EB7: $5F
    ld   d, b                                     ; $5EB8: $50
    ld   hl, wEntitiesPosXTable                         ; $5EB9: $21 $00 $C2
    add  hl, de                                   ; $5EBC: $19
    ldh  a, [wActiveEntityPosX]                   ; $5EBD: $F0 $EE
    sub  [hl]                                     ; $5EBF: $96
    add  $10                                      ; $5EC0: $C6 $10
    cp   $20                                      ; $5EC2: $FE $20
    jr   nc, jr_015_5F19                          ; $5EC4: $30 $53

    ld   hl, wEntitiesPosYTable                         ; $5EC6: $21 $10 $C2
    add  hl, de                                   ; $5EC9: $19
    ldh  a, [wActiveEntityPosY]                   ; $5ECA: $F0 $EC
    sub  [hl]                                     ; $5ECC: $96
    add  $0C                                      ; $5ECD: $C6 $0C
    cp   $18                                      ; $5ECF: $FE $18
    jr   nc, jr_015_5F19                          ; $5ED1: $30 $46

    ld   hl, wEntitiesSpeedXTable                       ; $5ED3: $21 $40 $C2
    add  hl, bc                                   ; $5ED6: $09
    ld   a, [hl]                                  ; $5ED7: $7E
    sla  a                                        ; $5ED8: $CB $27
    ld   hl, $C3F0                                ; $5EDA: $21 $F0 $C3
    add  hl, de                                   ; $5EDD: $19
    ld   [hl], a                                  ; $5EDE: $77
    ld   hl, wEntitiesSpeedYTable                       ; $5EDF: $21 $50 $C2
    add  hl, bc                                   ; $5EE2: $09
    ld   a, [hl]                                  ; $5EE3: $7E
    sla  a                                        ; $5EE4: $CB $27
    ld   hl, wEntitiesUnknowTableS                ; $5EE6: $21 $00 $C4
    add  hl, de                                   ; $5EE9: $19
    ld   [hl], a                                  ; $5EEA: $77
    ld   hl, wEntitiesUnknowTableT                ; $5EEB: $21 $10 $C4
    add  hl, de                                   ; $5EEE: $19
    ld   [hl], $12                                ; $5EEF: $36 $12
    call ClearEntityStatus                        ; $5EF1: $CD $31 $7C
    ld   a, [$D220]                               ; $5EF4: $FA $20 $D2
    inc  a                                        ; $5EF7: $3C
    ld   [$D220], a                               ; $5EF8: $EA $20 $D2
    cp   $04                                      ; $5EFB: $FE $04
    jr   c, jr_015_5F0F                           ; $5EFD: $38 $10

    ld   hl, wEntitiesStateTable                  ; $5EFF: $21 $90 $C2

jr_015_5F02:
    add  hl, de                                   ; $5F02: $19
    ld   [hl], $07                                ; $5F03: $36 $07
    ld   hl, wEntitiesTransitionCountdownTable    ; $5F05: $21 $E0 $C2
    add  hl, de                                   ; $5F08: $19
    ld   [hl], $C0                                ; $5F09: $36 $C0
    ld   a, $36                                   ; $5F0B: $3E $36
    ldh  [hJingle], a                             ; $5F0D: $E0 $F2

jr_015_5F0F:
    ld   hl, wEntitiesUnknowTableU                ; $5F0F: $21 $20 $C4
    add  hl, de                                   ; $5F12: $19
    ld   [hl], $14                                ; $5F13: $36 $14
    ld   a, $07                                   ; $5F15: $3E $07
    ldh  [hWaveSfx], a                            ; $5F17: $E0 $F3

jr_015_5F19:
    ret                                           ; $5F19: $C9

    jr   nz, jr_015_5F3C                          ; $5F1A: $20 $20

    ldh  [hBGMapOffsetHigh], a                    ; $5F1C: $E0 $E0
    jr   nz, @-$1E                                ; $5F1E: $20 $E0

    jr   nz, jr_015_5F02                          ; $5F20: $20 $E0

    call label_3B44                               ; $5F22: $CD $44 $3B
    ldh  a, [hFrameCounter]                       ; $5F25: $F0 $E7
    rra                                           ; $5F27: $1F
    rra                                           ; $5F28: $1F
    rra                                           ; $5F29: $1F
    and  $01                                      ; $5F2A: $E6 $01
    add  $03                                      ; $5F2C: $C6 $03
    call SetEntitySpriteVariant                   ; $5F2E: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5F31: $CD $05 $0C
    jr   z, jr_015_5F3F                           ; $5F34: $28 $09

    and  $01                                      ; $5F36: $E6 $01
    jr   nz, jr_015_5F3F                          ; $5F38: $20 $05

    ld   a, $18                                   ; $5F3A: $3E $18

jr_015_5F3C:
    call label_3BAA                               ; $5F3C: $CD $AA $3B

jr_015_5F3F:
    ld   hl, wEntitiesCollisionsTable             ; $5F3F: $21 $A0 $C2
    add  hl, bc                                   ; $5F42: $09
    ld   a, [hl]                                  ; $5F43: $7E
    and  a                                        ; $5F44: $A7
    jr   z, jr_015_5F99                           ; $5F45: $28 $52

    ld   a, $36                                   ; $5F47: $3E $36
    ldh  [hNoiseSfx], a                           ; $5F49: $E0 $F4
    xor  a                                        ; $5F4B: $AF

jr_015_5F4C:
    ldh  [hFFE8], a                               ; $5F4C: $E0 $E8
    ld   a, $7D                                   ; $5F4E: $3E $7D
    call func_003_64CA_trampoline                               ; $5F50: $CD $86 $3B
    jr   c, jr_015_5F96                           ; $5F53: $38 $41

    ldh  a, [hScratch0]                           ; $5F55: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $5F57: $21 $00 $C2
    add  hl, de                                   ; $5F5A: $19
    ld   [hl], a                                  ; $5F5B: $77
    ldh  a, [hScratch1]                           ; $5F5C: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5F5E: $21 $10 $C2
    add  hl, de                                   ; $5F61: $19
    ld   [hl], a                                  ; $5F62: $77
    ld   hl, wEntitiesUnknownTableB               ; $5F63: $21 $B0 $C2
    add  hl, de                                   ; $5F66: $19
    inc  [hl]                                     ; $5F67: $34
    push bc                                       ; $5F68: $C5
    ldh  a, [hScratch0]                           ; $5F69: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $5F6B: $21 $00 $C2
    add  hl, de                                   ; $5F6E: $19
    ld   [hl], a                                  ; $5F6F: $77
    ldh  a, [hScratch1]                           ; $5F70: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $5F72: $21 $10 $C2
    add  hl, de                                   ; $5F75: $19
    ld   [hl], a                                  ; $5F76: $77
    ldh  a, [hFFE8]                               ; $5F77: $F0 $E8
    ld   c, a                                     ; $5F79: $4F
    ld   hl, $5F1A                                ; $5F7A: $21 $1A $5F
    add  hl, bc                                   ; $5F7D: $09
    ld   a, [hl]                                  ; $5F7E: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $5F7F: $21 $40 $C2
    add  hl, de                                   ; $5F82: $19
    ld   [hl], a                                  ; $5F83: $77
    ld   hl, $5F1E                                ; $5F84: $21 $1E $5F
    add  hl, bc                                   ; $5F87: $09
    ld   a, [hl]                                  ; $5F88: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $5F89: $21 $50 $C2
    add  hl, de                                   ; $5F8C: $19
    ld   [hl], a                                  ; $5F8D: $77
    pop  bc                                       ; $5F8E: $C1
    ldh  a, [hFFE8]                               ; $5F8F: $F0 $E8
    inc  a                                        ; $5F91: $3C
    cp   $04                                      ; $5F92: $FE $04
    jr   nz, jr_015_5F4C                          ; $5F94: $20 $B6

jr_015_5F96:
    jp   ClearEntityStatusAndReturn               ; $5F96: $C3 $31 $7C

jr_015_5F99:
    ret                                           ; $5F99: $C9

func_015_5F9A:
    ld   e, $80                                   ; $5F9A: $1E $80
    ld   hl, $D100                                ; $5F9C: $21 $00 $D1

jr_015_5F9F:
    xor  a                                        ; $5F9F: $AF
    ld   [hl+], a                                 ; $5FA0: $22
    dec  e                                        ; $5FA1: $1D
    jr   nz, jr_015_5F9F                          ; $5FA2: $20 $FB

    ret                                           ; $5FA4: $C9

    inc  bc                                       ; $5FA5: $03
    inc  bc                                       ; $5FA6: $03
    dec  b                                        ; $5FA7: $05
    dec  b                                        ; $5FA8: $05
    nop                                           ; $5FA9: $00
    nop                                           ; $5FAA: $00
    inc  b                                        ; $5FAB: $04
    inc  b                                        ; $5FAC: $04
    ld   [bc], a                                  ; $5FAD: $02
    ld   [bc], a                                  ; $5FAE: $02
    ld   b, $06                                   ; $5FAF: $06 $06
    ld   bc, $0701                                ; $5FB1: $01 $01 $07
    rlca                                          ; $5FB4: $07
    nop                                           ; $5FB5: $00
    ld   b, $0C                                   ; $5FB6: $06 $0C
    ld   c, $10                                   ; $5FB8: $0E $10
    ld   c, $0C                                   ; $5FBA: $0E $0C
    ld   b, $00                                   ; $5FBC: $06 $00
    ld   a, [$F2F4]                               ; $5FBE: $FA $F4 $F2
    ldh  a, [hJingle]                             ; $5FC1: $F0 $F2
    db   $F4                                      ; $5FC3: $F4
    ld   a, [$0600]                               ; $5FC4: $FA $00 $06
    inc  c                                        ; $5FC7: $0C
    ld   c, $06                                   ; $5FC8: $0E $06
    rlca                                          ; $5FCA: $07
    nop                                           ; $5FCB: $00
    ld   bc, $0302                                ; $5FCC: $01 $02 $03
    inc  b                                        ; $5FCF: $04
    dec  b                                        ; $5FD0: $05

func_015_5FD1:
    call func_015_7B0D                            ; $5FD1: $CD $0D $7B
    jp   label_3B39                               ; $5FD4: $C3 $39 $3B

FinalNightmareForm4Handler::
    ldh  a, [hActiveEntityState]                  ; $5FD7: $F0 $F0
    rst  $00                                      ; $5FD9: $C7
    ld   c, d                                     ; $5FDA: $4A
    ld   h, b                                     ; $5FDB: $60
    call nc, $C160                                ; $5FDC: $D4 $60 $C1
    ld   h, b                                     ; $5FDF: $60
    adc  h                                        ; $5FE0: $8C
    ld   h, b                                     ; $5FE1: $60
    nop                                           ; $5FE2: $00
    nop                                           ; $5FE3: $00
    ld   c, d                                     ; $5FE4: $4A
    nop                                           ; $5FE5: $00
    nop                                           ; $5FE6: $00
    ld   [$204A], sp                              ; $5FE7: $08 $4A $20
    rst  $38                                      ; $5FEA: $FF
    rst  $38                                      ; $5FEB: $FF
    rst  $38                                      ; $5FEC: $FF
    rst  $38                                      ; $5FED: $FF
    rst  $38                                      ; $5FEE: $FF
    rst  $38                                      ; $5FEF: $FF
    rst  $38                                      ; $5FF0: $FF
    rst  $38                                      ; $5FF1: $FF
    rst  $38                                      ; $5FF2: $FF
    rst  $38                                      ; $5FF3: $FF
    rst  $38                                      ; $5FF4: $FF
    rst  $38                                      ; $5FF5: $FF
    rst  $38                                      ; $5FF6: $FF
    rst  $38                                      ; $5FF7: $FF
    rst  $38                                      ; $5FF8: $FF
    rst  $38                                      ; $5FF9: $FF
    nop                                           ; $5FFA: $00
    nop                                           ; $5FFB: $00
    ld   c, h                                     ; $5FFC: $4C
    nop                                           ; $5FFD: $00
    nop                                           ; $5FFE: $00
    ld   [$204C], sp                              ; $5FFF: $08 $4C $20
    rst  $38                                      ; $6002: $FF
    rst  $38                                      ; $6003: $FF
    rst  $38                                      ; $6004: $FF
    rst  $38                                      ; $6005: $FF
    rst  $38                                      ; $6006: $FF
    rst  $38                                      ; $6007: $FF
    rst  $38                                      ; $6008: $FF
    rst  $38                                      ; $6009: $FF
    rst  $38                                      ; $600A: $FF
    rst  $38                                      ; $600B: $FF
    rst  $38                                      ; $600C: $FF
    rst  $38                                      ; $600D: $FF
    rst  $38                                      ; $600E: $FF
    rst  $38                                      ; $600F: $FF
    rst  $38                                      ; $6010: $FF
    rst  $38                                      ; $6011: $FF
    nop                                           ; $6012: $00
    nop                                           ; $6013: $00
    ld   c, [hl]                                  ; $6014: $4E
    nop                                           ; $6015: $00
    nop                                           ; $6016: $00
    ld   [$204E], sp                              ; $6017: $08 $4E $20
    rst  $38                                      ; $601A: $FF
    rst  $38                                      ; $601B: $FF
    rst  $38                                      ; $601C: $FF
    rst  $38                                      ; $601D: $FF
    rst  $38                                      ; $601E: $FF
    rst  $38                                      ; $601F: $FF
    rst  $38                                      ; $6020: $FF
    rst  $38                                      ; $6021: $FF
    rst  $38                                      ; $6022: $FF
    rst  $38                                      ; $6023: $FF
    rst  $38                                      ; $6024: $FF
    rst  $38                                      ; $6025: $FF
    rst  $38                                      ; $6026: $FF
    rst  $38                                      ; $6027: $FF
    rst  $38                                      ; $6028: $FF
    rst  $38                                      ; $6029: $FF
    nop                                           ; $602A: $00
    ld   hl, sp+$78                               ; $602B: $F8 $78
    nop                                           ; $602D: $00
    ld   hl, sp+$00                               ; $602E: $F8 $00
    ld   a, d                                     ; $6030: $7A
    nop                                           ; $6031: $00
    ld   hl, sp+$08                               ; $6032: $F8 $08
    ld   a, d                                     ; $6034: $7A
    jr   nz, jr_015_6037                          ; $6035: $20 $00

jr_015_6037:
    db   $10                                      ; $6037: $10
    ld   a, b                                     ; $6038: $78
    jr   nz, jr_015_6043                          ; $6039: $20 $08

    nop                                           ; $603B: $00
    ld   a, h                                     ; $603C: $7C
    nop                                           ; $603D: $00
    ld   [$7C08], sp                              ; $603E: $08 $08 $7C
    jr   nz, @+$05                                ; $6041: $20 $03

jr_015_6043:
    inc  bc                                       ; $6043: $03
    ld   [bc], a                                  ; $6044: $02
    ld   bc, $0000                                ; $6045: $01 $00 $00
    nop                                           ; $6048: $00
    nop                                           ; $6049: $00
    xor  a                                        ; $604A: $AF
    ldh  [hActiveEntitySpriteVariant], a               ; $604B: $E0 $F1
    call GetEntityTransitionCountdown             ; $604D: $CD $05 $0C
    jr   nz, jr_015_6055                          ; $6050: $20 $03

    jp   IncrementEntityWalkingAttr               ; $6052: $C3 $12 $3B

jr_015_6055:
    cp   $20                                      ; $6055: $FE $20
    jr   nz, jr_015_605F                          ; $6057: $20 $06

    dec  [hl]                                     ; $6059: $35
    call func_015_52B1                            ; $605A: $CD $B1 $52
    ld   a, $20                                   ; $605D: $3E $20

jr_015_605F:
    rra                                           ; $605F: $1F
    rra                                           ; $6060: $1F
    rra                                           ; $6061: $1F
    and  $07                                      ; $6062: $E6 $07
    ld   e, a                                     ; $6064: $5F
    ld   d, b                                     ; $6065: $50
    ld   hl, $6042                                ; $6066: $21 $42 $60

jr_015_6069:
    add  hl, de                                   ; $6069: $19
    ld   a, [hl]                                  ; $606A: $7E
    rla                                           ; $606B: $17
    rla                                           ; $606C: $17
    rla                                           ; $606D: $17
    and  $F8                                      ; $606E: $E6 $F8
    ld   e, a                                     ; $6070: $5F
    rla                                           ; $6071: $17
    and  $F0                                      ; $6072: $E6 $F0
    add  e                                        ; $6074: $83
    ld   e, a                                     ; $6075: $5F
    ld   hl, $5FE2                                ; $6076: $21 $E2 $5F
    add  hl, de                                   ; $6079: $19
    ld   c, $06                                   ; $607A: $0E $06
    call label_3CE6                               ; $607C: $CD $E6 $3C
    ld   a, $06                                   ; $607F: $3E $06
    jp   label_3DA0                               ; $6081: $C3 $A0 $3D

    nop                                           ; $6084: $00
    nop                                           ; $6085: $00
    ld   bc, $0201                                ; $6086: $01 $01 $02
    ld   [bc], a                                  ; $6089: $02
    inc  bc                                       ; $608A: $03
    inc  bc                                       ; $608B: $03
    xor  a                                        ; $608C: $AF
    ldh  [hActiveEntitySpriteVariant], a               ; $608D: $E0 $F1
    call GetEntityTransitionCountdown             ; $608F: $CD $05 $0C
    jr   nz, jr_015_60B5                          ; $6092: $20 $21

    call func_015_52BB                            ; $6094: $CD $BB $52
    call func_015_5128                            ; $6097: $CD $28 $51
    ld   hl, wEntitiesHealthTable                 ; $609A: $21 $60 $C3
    add  hl, bc                                   ; $609D: $09
    ld   [hl], $FF                                ; $609E: $36 $FF
    ld   hl, wEntitiesUnknowTableL                ; $60A0: $21 $40 $C3
    add  hl, bc                                   ; $60A3: $09
    ld   [hl], $40                                ; $60A4: $36 $40
    ld   hl, wEntitiesUnknowTableM                ; $60A6: $21 $50 $C3
    add  hl, bc                                   ; $60A9: $09
    ld   [hl], $0A                                ; $60AA: $36 $0A
    ld   hl, wEntitiesUnknowTableH                ; $60AC: $21 $30 $C4
    add  hl, bc                                   ; $60AF: $09
    ld   [hl], $90                                ; $60B0: $36 $90
    jp   label_3AEA                               ; $60B2: $C3 $EA $3A

jr_015_60B5:
    rra                                           ; $60B5: $1F
    rra                                           ; $60B6: $1F
    rra                                           ; $60B7: $1F
    and  $07                                      ; $60B8: $E6 $07
    ld   e, a                                     ; $60BA: $5F
    ld   d, b                                     ; $60BB: $50
    ld   hl, $6084                                ; $60BC: $21 $84 $60
    jr   jr_015_6069                              ; $60BF: $18 $A8

    ld   hl, wEntitiesUnknowTableV                ; $60C1: $21 $80 $C4
    add  hl, bc                                   ; $60C4: $09
    ld   a, [hl]                                  ; $60C5: $7E
    and  a                                        ; $60C6: $A7
    jr   nz, jr_015_60D4                          ; $60C7: $20 $0B

    call GetEntityTransitionCountdown             ; $60C9: $CD $05 $0C
    ld   [hl], $1F                                ; $60CC: $36 $1F
    call func_015_542E                            ; $60CE: $CD $2E $54
    jp   IncrementEntityWalkingAttr               ; $60D1: $C3 $12 $3B

jr_015_60D4:
    call func_015_5FD1                            ; $60D4: $CD $D1 $5F
    call $6245                                    ; $60D7: $CD $45 $62
    call label_C56                                ; $60DA: $CD $56 $0C
    call label_3D8A                               ; $60DD: $CD $8A $3D
    call func_015_7B0D                            ; $60E0: $CD $0D $7B
    xor  a                                        ; $60E3: $AF
    ld   [$D3D6], a                               ; $60E4: $EA $D6 $D3
    ld   e, $0C                                   ; $60E7: $1E $0C
    ld   hl, wEntitiesUnknowTableG                ; $60E9: $21 $00 $C3
    add  hl, bc                                   ; $60EC: $09
    ld   a, [hl]                                  ; $60ED: $7E
    and  a                                        ; $60EE: $A7
    jr   z, jr_015_60FB                           ; $60EF: $28 $0A

    call func_015_6109                            ; $60F1: $CD $09 $61
    ld   a, $01                                   ; $60F4: $3E $01
    ld   [$D3D6], a                               ; $60F6: $EA $D6 $D3
    ld   e, $0C                                   ; $60F9: $1E $0C

jr_015_60FB:
    ld   hl, $D202                                ; $60FB: $21 $02 $D2
    ld   a, [hl]                                  ; $60FE: $7E
    inc  a                                        ; $60FF: $3C
    ld   [hl], a                                  ; $6100: $77
    cp   e                                        ; $6101: $BB
    jr   c, jr_015_6109                           ; $6102: $38 $05

    ld   [hl], b                                  ; $6104: $70
    ld   a, $38                                   ; $6105: $3E $38
    ldh  [hJingle], a                             ; $6107: $E0 $F2

func_015_6109:
jr_015_6109:
    ld   hl, wEntitiesUnknowTableY                ; $6109: $21 $D0 $C3
    add  hl, bc                                   ; $610C: $09
    ld   a, [hl]                                  ; $610D: $7E
    inc  a                                        ; $610E: $3C
    and  $7F                                      ; $610F: $E6 $7F
    ld   [hl], a                                  ; $6111: $77
    ld   e, a                                     ; $6112: $5F
    ld   d, b                                     ; $6113: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6114: $21 $00 $D0
    add  hl, de                                   ; $6117: $19
    ldh  a, [wActiveEntityPosX]                   ; $6118: $F0 $EE
    ld   [hl], a                                  ; $611A: $77
    ld   hl, $D100                                ; $611B: $21 $00 $D1
    add  hl, de                                   ; $611E: $19
    ldh  a, [wActiveEntityPosY]                   ; $611F: $F0 $EC
    ld   [hl], a                                  ; $6121: $77
    call func_015_6331                            ; $6122: $CD $31 $63
    ld   hl, wEntitiesUnknownTableB               ; $6125: $21 $B0 $C2
    add  hl, bc                                   ; $6128: $09
    ld   e, [hl]                                  ; $6129: $5E
    srl  e                                        ; $612A: $CB $3B
    ld   d, b                                     ; $612C: $50
    ld   hl, $5FC9                                ; $612D: $21 $C9 $5F
    add  hl, de                                   ; $6130: $19
    ld   a, [hl]                                  ; $6131: $7E
    jp   SetEntitySpriteVariant                   ; $6132: $C3 $0C $3B

    ld   hl, sp-$08                               ; $6135: $F8 $F8
    ld   h, b                                     ; $6137: $60
    nop                                           ; $6138: $00
    ld   hl, sp+$00                               ; $6139: $F8 $00
    ld   h, d                                     ; $613B: $62
    nop                                           ; $613C: $00
    ld   hl, sp+$08                               ; $613D: $F8 $08
    ld   h, d                                     ; $613F: $62
    jr   nz, @-$06                                ; $6140: $20 $F8

    db   $10                                      ; $6142: $10
    ld   h, b                                     ; $6143: $60
    jr   nz, @+$0A                                ; $6144: $20 $08

    ld   hl, sp+$64                               ; $6146: $F8 $64
    nop                                           ; $6148: $00
    ld   [$6600], sp                              ; $6149: $08 $00 $66
    nop                                           ; $614C: $00
    ld   [$6608], sp                              ; $614D: $08 $08 $66
    jr   nz, @+$0A                                ; $6150: $20 $08

    db   $10                                      ; $6152: $10
    ld   h, h                                     ; $6153: $64
    jr   nz, @-$06                                ; $6154: $20 $F8

    ld   hl, sp+$60                               ; $6156: $F8 $60
    nop                                           ; $6158: $00
    ld   hl, sp+$00                               ; $6159: $F8 $00
    ld   h, d                                     ; $615B: $62
    nop                                           ; $615C: $00
    ld   hl, sp+$08                               ; $615D: $F8 $08
    ld   h, d                                     ; $615F: $62
    jr   nz, @-$06                                ; $6160: $20 $F8

    db   $10                                      ; $6162: $10
    ld   h, b                                     ; $6163: $60
    jr   nz, @+$0A                                ; $6164: $20 $08

    ld   hl, sp+$6C                               ; $6166: $F8 $6C
    nop                                           ; $6168: $00
    ld   [$6E00], sp                              ; $6169: $08 $00 $6E
    nop                                           ; $616C: $00
    ld   [$6208], sp                              ; $616D: $08 $08 $62
    ld   h, b                                     ; $6170: $60
    ld   [$6010], sp                              ; $6171: $08 $10 $60
    ld   h, b                                     ; $6174: $60
    ld   hl, sp-$08                               ; $6175: $F8 $F8
    ld   l, b                                     ; $6177: $68
    nop                                           ; $6178: $00
    ld   hl, sp+$00                               ; $6179: $F8 $00
    ld   l, d                                     ; $617B: $6A
    nop                                           ; $617C: $00
    ld   hl, sp+$08                               ; $617D: $F8 $08
    ld   h, d                                     ; $617F: $62
    jr   nz, @-$06                                ; $6180: $20 $F8

    db   $10                                      ; $6182: $10
    ld   h, b                                     ; $6183: $60
    jr   nz, @+$0A                                ; $6184: $20 $08

    ld   hl, sp+$68                               ; $6186: $F8 $68
    ld   b, b                                     ; $6188: $40
    ld   [$6A00], sp                              ; $6189: $08 $00 $6A
    ld   b, b                                     ; $618C: $40
    ld   [$6208], sp                              ; $618D: $08 $08 $62
    ld   h, b                                     ; $6190: $60
    ld   [$6010], sp                              ; $6191: $08 $10 $60
    ld   h, b                                     ; $6194: $60
    ld   hl, sp-$08                               ; $6195: $F8 $F8
    ld   l, h                                     ; $6197: $6C
    ld   b, b                                     ; $6198: $40
    ld   hl, sp+$00                               ; $6199: $F8 $00
    ld   l, [hl]                                  ; $619B: $6E
    ld   b, b                                     ; $619C: $40
    ld   hl, sp+$08                               ; $619D: $F8 $08
    ld   h, d                                     ; $619F: $62
    jr   nz, @-$06                                ; $61A0: $20 $F8

    db   $10                                      ; $61A2: $10
    ld   h, b                                     ; $61A3: $60
    jr   nz, @+$0A                                ; $61A4: $20 $08

    ld   hl, sp+$60                               ; $61A6: $F8 $60
    ld   b, b                                     ; $61A8: $40
    ld   [$6200], sp                              ; $61A9: $08 $00 $62
    ld   b, b                                     ; $61AC: $40
    ld   [$6208], sp                              ; $61AD: $08 $08 $62
    ld   h, b                                     ; $61B0: $60
    ld   [$6010], sp                              ; $61B1: $08 $10 $60
    ld   h, b                                     ; $61B4: $60
    ld   hl, sp-$08                               ; $61B5: $F8 $F8
    ld   h, h                                     ; $61B7: $64
    ld   b, b                                     ; $61B8: $40
    ld   hl, sp+$00                               ; $61B9: $F8 $00
    ld   h, [hl]                                  ; $61BB: $66
    ld   b, b                                     ; $61BC: $40
    ld   hl, sp+$08                               ; $61BD: $F8 $08
    ld   h, [hl]                                  ; $61BF: $66
    ld   h, b                                     ; $61C0: $60
    ld   hl, sp+$10                               ; $61C1: $F8 $10
    ld   h, h                                     ; $61C3: $64
    ld   h, b                                     ; $61C4: $60
    ld   [$60F8], sp                              ; $61C5: $08 $F8 $60
    ld   b, b                                     ; $61C8: $40
    ld   [$6200], sp                              ; $61C9: $08 $00 $62
    ld   b, b                                     ; $61CC: $40
    ld   [$6208], sp                              ; $61CD: $08 $08 $62
    ld   h, b                                     ; $61D0: $60
    ld   [$6010], sp                              ; $61D1: $08 $10 $60
    ld   h, b                                     ; $61D4: $60
    ld   hl, sp-$08                               ; $61D5: $F8 $F8
    ld   h, b                                     ; $61D7: $60
    nop                                           ; $61D8: $00
    ld   hl, sp+$00                               ; $61D9: $F8 $00
    ld   h, d                                     ; $61DB: $62
    nop                                           ; $61DC: $00
    ld   hl, sp+$08                               ; $61DD: $F8 $08
    ld   l, [hl]                                  ; $61DF: $6E
    ld   h, b                                     ; $61E0: $60
    ld   hl, sp+$10                               ; $61E1: $F8 $10
    ld   l, h                                     ; $61E3: $6C
    ld   h, b                                     ; $61E4: $60
    ld   [$60F8], sp                              ; $61E5: $08 $F8 $60
    ld   b, b                                     ; $61E8: $40
    ld   [$6200], sp                              ; $61E9: $08 $00 $62
    ld   b, b                                     ; $61EC: $40
    ld   [$6208], sp                              ; $61ED: $08 $08 $62
    ld   h, b                                     ; $61F0: $60
    ld   [$6010], sp                              ; $61F1: $08 $10 $60
    ld   h, b                                     ; $61F4: $60
    ld   hl, sp-$08                               ; $61F5: $F8 $F8
    ld   h, b                                     ; $61F7: $60
    nop                                           ; $61F8: $00
    ld   hl, sp+$00                               ; $61F9: $F8 $00
    ld   h, d                                     ; $61FB: $62
    nop                                           ; $61FC: $00
    ld   hl, sp+$08                               ; $61FD: $F8 $08
    ld   l, d                                     ; $61FF: $6A
    jr   nz, @-$06                                ; $6200: $20 $F8

    db   $10                                      ; $6202: $10
    ld   l, b                                     ; $6203: $68
    jr   nz, @+$0A                                ; $6204: $20 $08

    ld   hl, sp+$60                               ; $6206: $F8 $60
    ld   b, b                                     ; $6208: $40
    ld   [$6200], sp                              ; $6209: $08 $00 $62
    ld   b, b                                     ; $620C: $40
    ld   [$6A08], sp                              ; $620D: $08 $08 $6A
    ld   h, b                                     ; $6210: $60
    ld   [$6810], sp                              ; $6211: $08 $10 $68
    ld   h, b                                     ; $6214: $60
    ld   hl, sp-$08                               ; $6215: $F8 $F8
    ld   h, b                                     ; $6217: $60
    nop                                           ; $6218: $00
    ld   hl, sp+$00                               ; $6219: $F8 $00
    ld   h, d                                     ; $621B: $62
    nop                                           ; $621C: $00
    ld   hl, sp+$08                               ; $621D: $F8 $08
    ld   h, d                                     ; $621F: $62
    jr   nz, @-$06                                ; $6220: $20 $F8

    db   $10                                      ; $6222: $10
    ld   h, b                                     ; $6223: $60
    jr   nz, @+$0A                                ; $6224: $20 $08

    ld   hl, sp+$60                               ; $6226: $F8 $60
    ld   b, b                                     ; $6228: $40
    ld   [$6200], sp                              ; $6229: $08 $00 $62
    ld   b, b                                     ; $622C: $40
    ld   [$6E08], sp                              ; $622D: $08 $08 $6E
    jr   nz, jr_015_623A                          ; $6230: $20 $08

    db   $10                                      ; $6232: $10
    ld   l, h                                     ; $6233: $6C
    jr   nz, @+$72                                ; $6234: $20 $70

    nop                                           ; $6236: $00
    ld   [hl], b                                  ; $6237: $70
    jr   nz, jr_015_62AC                          ; $6238: $20 $72

jr_015_623A:
    nop                                           ; $623A: $00
    ld   [hl], d                                  ; $623B: $72
    jr   nz, @+$76                                ; $623C: $20 $74

    nop                                           ; $623E: $00
    ld   [hl], h                                  ; $623F: $74
    jr   nz, @+$78                                ; $6240: $20 $76

    nop                                           ; $6242: $00
    db   $76                                      ; $6243: $76
    jr   nz, @+$23                                ; $6244: $20 $21

    ld   b, b                                     ; $6246: $40
    jp   $3609                                    ; $6247: $C3 $09 $36

    ld   c, b                                     ; $624A: $48
    ld   hl, wEntitiesSpriteVariantTable               ; $624B: $21 $B0 $C3
    add  hl, bc                                   ; $624E: $09
    ld   a, [hl]                                  ; $624F: $7E
    rla                                           ; $6250: $17
    rla                                           ; $6251: $17
    rla                                           ; $6252: $17
    rla                                           ; $6253: $17
    rla                                           ; $6254: $17
    and  $E0                                      ; $6255: $E6 $E0
    ld   e, a                                     ; $6257: $5F
    ld   d, b                                     ; $6258: $50
    ld   hl, $6135                                ; $6259: $21 $35 $61
    add  hl, de                                   ; $625C: $19
    ld   c, $08                                   ; $625D: $0E $08
    call label_3CE6                               ; $625F: $CD $E6 $3C
    ld   hl, wEntitiesUnknowTableL                ; $6262: $21 $40 $C3
    add  hl, bc                                   ; $6265: $09
    ld   [hl], $42                                ; $6266: $36 $42
    ld   hl, wEntitiesUnknowTableY                ; $6268: $21 $D0 $C3
    add  hl, bc                                   ; $626B: $09
    ld   a, [hl]                                  ; $626C: $7E
    ldh  [hScratch0], a                           ; $626D: $E0 $D7
    ldh  a, [hScratch0]                           ; $626F: $F0 $D7
    sub  $0C                                      ; $6271: $D6 $0C
    and  $7F                                      ; $6273: $E6 $7F
    ld   e, a                                     ; $6275: $5F
    ld   d, b                                     ; $6276: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6277: $21 $00 $D0
    add  hl, de                                   ; $627A: $19
    ld   a, [hl]                                  ; $627B: $7E
    ldh  [wActiveEntityPosX], a                   ; $627C: $E0 $EE
    ld   hl, $D100                                ; $627E: $21 $00 $D1
    add  hl, de                                   ; $6281: $19
    ld   a, [hl]                                  ; $6282: $7E
    ldh  [wActiveEntityPosY], a                   ; $6283: $E0 $EC
    ld   a, $00                                   ; $6285: $3E $00
    ldh  [hActiveEntitySpriteVariant], a               ; $6287: $E0 $F1
    ld   de, $6235                                ; $6289: $11 $35 $62
    call RenderAnimatedActiveEntity                               ; $628C: $CD $C0 $3B
    ldh  a, [hScratch0]                           ; $628F: $F0 $D7
    sub  $18                                      ; $6291: $D6 $18
    and  $7F                                      ; $6293: $E6 $7F
    ld   e, a                                     ; $6295: $5F
    ld   d, b                                     ; $6296: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6297: $21 $00 $D0
    add  hl, de                                   ; $629A: $19
    ld   a, [hl]                                  ; $629B: $7E
    ldh  [wActiveEntityPosX], a                   ; $629C: $E0 $EE
    ld   hl, $D100                                ; $629E: $21 $00 $D1
    add  hl, de                                   ; $62A1: $19
    ld   a, [hl]                                  ; $62A2: $7E
    ldh  [wActiveEntityPosY], a                   ; $62A3: $E0 $EC
    ld   a, $00                                   ; $62A5: $3E $00
    ldh  [hActiveEntitySpriteVariant], a               ; $62A7: $E0 $F1
    ld   de, $6235                                ; $62A9: $11 $35 $62

jr_015_62AC:
    call RenderAnimatedActiveEntity                               ; $62AC: $CD $C0 $3B
    ldh  a, [hScratch0]                           ; $62AF: $F0 $D7
    sub  $24                                      ; $62B1: $D6 $24
    and  $7F                                      ; $62B3: $E6 $7F
    ld   e, a                                     ; $62B5: $5F
    ld   d, b                                     ; $62B6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62B7: $21 $00 $D0
    add  hl, de                                   ; $62BA: $19
    ld   a, [hl]                                  ; $62BB: $7E
    ldh  [wActiveEntityPosX], a                   ; $62BC: $E0 $EE
    ld   hl, $D100                                ; $62BE: $21 $00 $D1
    add  hl, de                                   ; $62C1: $19
    ld   a, [hl]                                  ; $62C2: $7E
    ldh  [wActiveEntityPosY], a                   ; $62C3: $E0 $EC
    ld   a, $01                                   ; $62C5: $3E $01
    ldh  [hActiveEntitySpriteVariant], a               ; $62C7: $E0 $F1
    ld   de, $6235                                ; $62C9: $11 $35 $62
    call RenderAnimatedActiveEntity                               ; $62CC: $CD $C0 $3B
    ldh  a, [hScratch0]                           ; $62CF: $F0 $D7
    sub  $2E                                      ; $62D1: $D6 $2E
    and  $7F                                      ; $62D3: $E6 $7F
    ld   e, a                                     ; $62D5: $5F
    ld   d, b                                     ; $62D6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62D7: $21 $00 $D0
    add  hl, de                                   ; $62DA: $19
    ld   a, [hl]                                  ; $62DB: $7E
    ldh  [wActiveEntityPosX], a                   ; $62DC: $E0 $EE
    ld   hl, $D100                                ; $62DE: $21 $00 $D1
    add  hl, de                                   ; $62E1: $19
    ld   a, [hl]                                  ; $62E2: $7E
    ldh  [wActiveEntityPosY], a                   ; $62E3: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $62E5: $F0 $E7
    rra                                           ; $62E7: $1F
    rra                                           ; $62E8: $1F
    rra                                           ; $62E9: $1F
    and  $01                                      ; $62EA: $E6 $01
    add  $02                                      ; $62EC: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a               ; $62EE: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $62F0: $F0 $E7
    rla                                           ; $62F2: $17
    rla                                           ; $62F3: $17
    and  $10                                      ; $62F4: $E6 $10
    ld   hl, $FFED                                ; $62F6: $21 $ED $FF
    xor  [hl]                                     ; $62F9: $AE
    ld   [hl], a                                  ; $62FA: $77
    ld   de, $6235                                ; $62FB: $11 $35 $62
    call RenderAnimatedActiveEntity                               ; $62FE: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $6301: $F0 $F0
    cp   $02                                      ; $6303: $FE $02
    jr   nc, jr_015_6330                          ; $6305: $30 $29

    ld   hl, wEntitiesUnknowTableU                ; $6307: $21 $20 $C4
    add  hl, bc                                   ; $630A: $09
    ld   a, [hl]                                  ; $630B: $7E
    and  a                                        ; $630C: $A7
    jr   nz, jr_015_6330                          ; $630D: $20 $21

    ld   hl, wEntitiesUnknowTableH                ; $630F: $21 $30 $C4
    add  hl, bc                                   ; $6312: $09
    ld   [hl], $90                                ; $6313: $36 $90
    call label_3B70                               ; $6315: $CD $70 $3B
    ld   hl, wEntitiesUnknowTableH                ; $6318: $21 $30 $C4
    add  hl, bc                                   ; $631B: $09
    ld   [hl], $D0                                ; $631C: $36 $D0
    ld   hl, wEntitiesHealthTable                 ; $631E: $21 $60 $C3
    add  hl, bc                                   ; $6321: $09
    ld   a, [hl]                                  ; $6322: $7E
    cp   $F0                                      ; $6323: $FE $F0
    jr   nc, jr_015_6330                          ; $6325: $30 $09

    call IncrementEntityWalkingAttr               ; $6327: $CD $12 $3B
    ld   hl, wEntitiesUnknowTableV                ; $632A: $21 $80 $C4
    add  hl, bc                                   ; $632D: $09
    ld   [hl], $50                                ; $632E: $36 $50

jr_015_6330:
    ret                                           ; $6330: $C9

func_015_6331:
    ldh  a, [hActiveEntityState]                  ; $6331: $F0 $F0
    cp   $02                                      ; $6333: $FE $02
    jr   nc, jr_015_6342                          ; $6335: $30 $0B

    ld   hl, wEntitiesUnknowTableU                ; $6337: $21 $20 $C4
    add  hl, bc                                   ; $633A: $09
    ld   a, [hl]                                  ; $633B: $7E
    and  a                                        ; $633C: $A7
    jr   nz, jr_015_6342                          ; $633D: $20 $03

    call func_015_7B88                            ; $633F: $CD $88 $7B

jr_015_6342:
    call label_3B23                               ; $6342: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6345: $21 $A0 $C2
    add  hl, bc                                   ; $6348: $09
    ld   a, [hl]                                  ; $6349: $7E
    and  a                                        ; $634A: $A7
    jr   z, jr_015_6379                           ; $634B: $28 $2C

    ld   e, $08                                   ; $634D: $1E $08
    bit  0, a                                     ; $634F: $CB $47
    jr   nz, jr_015_6361                          ; $6351: $20 $0E

    ld   e, $00                                   ; $6353: $1E $00
    bit  1, a                                     ; $6355: $CB $4F
    jr   nz, jr_015_6361                          ; $6357: $20 $08

    ld   e, $04                                   ; $6359: $1E $04
    bit  2, a                                     ; $635B: $CB $57
    jr   nz, jr_015_6361                          ; $635D: $20 $02

    ld   e, $0C                                   ; $635F: $1E $0C

jr_015_6361:
    ld   hl, wEntitiesUnknownTableB               ; $6361: $21 $B0 $C2
    add  hl, bc                                   ; $6364: $09
    ld   [hl], e                                  ; $6365: $73
    call GetRandomByte                            ; $6366: $CD $0D $28
    rra                                           ; $6369: $1F
    jr   c, jr_015_6374                           ; $636A: $38 $08

    ld   hl, wEntitiesUnknownTableC               ; $636C: $21 $C0 $C2
    add  hl, bc                                   ; $636F: $09
    ld   a, [hl]                                  ; $6370: $7E
    cpl                                           ; $6371: $2F
    inc  a                                        ; $6372: $3C
    ld   [hl], a                                  ; $6373: $77

jr_015_6374:
    call GetEntityTransitionCountdown             ; $6374: $CD $05 $0C
    ld   [hl], $10                                ; $6377: $36 $10

jr_015_6379:
    call IsEntityUnknownFZero                     ; $6379: $CD $00 $0C
    jr   nz, jr_015_63AF                          ; $637C: $20 $31

    ld   [hl], $06                                ; $637E: $36 $06
    ld   hl, wEntitiesUnknownTableC               ; $6380: $21 $C0 $C2
    add  hl, bc                                   ; $6383: $09
    ld   a, [hl]                                  ; $6384: $7E
    ld   hl, wEntitiesUnknownTableB               ; $6385: $21 $B0 $C2
    add  hl, bc                                   ; $6388: $09
    add  [hl]                                     ; $6389: $86
    and  $0F                                      ; $638A: $E6 $0F
    ld   [hl], a                                  ; $638C: $77
    ld   hl, wEntitiesUnknownTableB               ; $638D: $21 $B0 $C2
    add  hl, bc                                   ; $6390: $09
    ld   e, [hl]                                  ; $6391: $5E
    ld   d, b                                     ; $6392: $50
    ld   hl, $5FA5                                ; $6393: $21 $A5 $5F
    add  hl, de                                   ; $6396: $19
    ld   a, [hl]                                  ; $6397: $7E
    call SetEntitySpriteVariant                   ; $6398: $CD $0C $3B
    ld   hl, $5FB5                                ; $639B: $21 $B5 $5F
    add  hl, de                                   ; $639E: $19
    ld   a, [hl]                                  ; $639F: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $63A0: $21 $50 $C2
    add  hl, bc                                   ; $63A3: $09
    ld   [hl], a                                  ; $63A4: $77
    ld   hl, $5FB9                                ; $63A5: $21 $B9 $5F
    add  hl, de                                   ; $63A8: $19
    ld   a, [hl]                                  ; $63A9: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $63AA: $21 $40 $C2
    add  hl, bc                                   ; $63AD: $09
    ld   [hl], a                                  ; $63AE: $77

jr_015_63AF:
    call GetEntityTransitionCountdown             ; $63AF: $CD $05 $0C
    jr   nz, jr_015_63C7                          ; $63B2: $20 $13

    call GetRandomByte                            ; $63B4: $CD $0D $28
    and  $1F                                      ; $63B7: $E6 $1F
    add  $10                                      ; $63B9: $C6 $10
    ld   [hl], a                                  ; $63BB: $77
    call GetRandomByte                            ; $63BC: $CD $0D $28
    and  $02                                      ; $63BF: $E6 $02
    dec  a                                        ; $63C1: $3D
    ld   hl, wEntitiesUnknownTableC               ; $63C2: $21 $C0 $C2
    add  hl, bc                                   ; $63C5: $09
    ld   [hl], a                                  ; $63C6: $77

jr_015_63C7:
    ret                                           ; $63C7: $C9

FinalNightmareForm5Handler::
    ld   hl, wEntitiesUnknownTableB               ; $63C8: $21 $B0 $C2
    add  hl, bc                                   ; $63CB: $09
    ld   a, [hl]                                  ; $63CC: $7E
    cp   $03                                      ; $63CD: $FE $03
    jp   z, $6D40                                 ; $63CF: $CA $40 $6D

    cp   $02                                      ; $63D2: $FE $02
    jp   z, $6D6E                                 ; $63D4: $CA $6E $6D

    and  a                                        ; $63D7: $A7
    jp   nz, label_015_6C61                       ; $63D8: $C2 $61 $6C

    ldh  a, [hActiveEntityState]                  ; $63DB: $F0 $F0
    cp   $02                                      ; $63DD: $FE $02
    jr   c, jr_015_6425                           ; $63DF: $38 $44

    cp   $0B                                      ; $63E1: $FE $0B
    jr   z, jr_015_63E9                           ; $63E3: $28 $04

    cp   $0C                                      ; $63E5: $FE $0C
    jr   nz, jr_015_63F2                          ; $63E7: $20 $09

jr_015_63E9:
    ld   a, $06                                   ; $63E9: $3E $06
    ldh  [hActiveEntitySpriteVariant], a               ; $63EB: $E0 $F1
    call $572B                                    ; $63ED: $CD $2B $57
    jr   jr_015_63F5                              ; $63F0: $18 $03

jr_015_63F2:
    call func_015_692A                            ; $63F2: $CD $2A $69

jr_015_63F5:
    call func_015_7B0D                            ; $63F5: $CD $0D $7B
    call label_C56                                ; $63F8: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $63FB: $F0 $F0
    cp   $09                                      ; $63FD: $FE $09
    jr   nc, jr_015_6425                          ; $63FF: $30 $24

    call label_3B39                               ; $6401: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6404: $21 $60 $C3
    add  hl, bc                                   ; $6407: $09
    ld   a, [hl]                                  ; $6408: $7E
    cp   $E8                                      ; $6409: $FE $E8
    jr   nc, jr_015_6425                          ; $640B: $30 $18

    call IncrementEntityWalkingAttr               ; $640D: $CD $12 $3B
    ld   [hl], $09                                ; $6410: $36 $09
    ld   a, $09                                   ; $6412: $3E $09
    ldh  [hActiveEntityState], a                  ; $6414: $E0 $F0
    ld   a, $10                                   ; $6416: $3E $10
    ldh  [hWaveSfx], a                            ; $6418: $E0 $F3
    call GetEntityTransitionCountdown             ; $641A: $CD $05 $0C
    ld   [hl], $80                                ; $641D: $36 $80
    ld   hl, wEntitiesUnknowTableU                ; $641F: $21 $20 $C4
    add  hl, bc                                   ; $6422: $09
    ld   [hl], $80                                ; $6423: $36 $80

jr_015_6425:
    ldh  a, [hActiveEntityState]                  ; $6425: $F0 $F0
    rst  $00                                      ; $6427: $C7
    cp   h                                        ; $6428: $BC
    ld   h, h                                     ; $6429: $64
    ld   c, $65                                   ; $642A: $0E $65
    ld   d, e                                     ; $642C: $53
    ld   h, l                                     ; $642D: $65
    and  [hl]                                     ; $642E: $A6
    ld   h, l                                     ; $642F: $65
    jr   jr_015_6498                              ; $6430: $18 $66

    call z, func_015_5366                         ; $6432: $CC $66 $53
    ld   h, a                                     ; $6435: $67
    adc  a                                        ; $6436: $8F
    ld   h, a                                     ; $6437: $67
    ld   [c], a                                   ; $6438: $E2
    ld   h, a                                     ; $6439: $67
    db   $E3                                      ; $643A: $E3
    ld   h, a                                     ; $643B: $67
    ld   a, [$1167]                               ; $643C: $FA $67 $11
    ld   l, b                                     ; $643F: $68
    sub  [hl]                                     ; $6440: $96
    ld   l, b                                     ; $6441: $68
    rst  $20                                      ; $6442: $E7
    ld   l, b                                     ; $6443: $68
    nop                                           ; $6444: $00
    nop                                           ; $6445: $00
    ld   c, d                                     ; $6446: $4A
    nop                                           ; $6447: $00
    nop                                           ; $6448: $00
    ld   [$204A], sp                              ; $6449: $08 $4A $20
    rst  $38                                      ; $644C: $FF
    rst  $38                                      ; $644D: $FF
    rst  $38                                      ; $644E: $FF
    rst  $38                                      ; $644F: $FF
    rst  $38                                      ; $6450: $FF
    rst  $38                                      ; $6451: $FF
    rst  $38                                      ; $6452: $FF
    rst  $38                                      ; $6453: $FF
    rst  $38                                      ; $6454: $FF
    rst  $38                                      ; $6455: $FF
    rst  $38                                      ; $6456: $FF
    rst  $38                                      ; $6457: $FF
    rst  $38                                      ; $6458: $FF
    rst  $38                                      ; $6459: $FF
    rst  $38                                      ; $645A: $FF
    rst  $38                                      ; $645B: $FF
    nop                                           ; $645C: $00
    nop                                           ; $645D: $00
    ld   c, h                                     ; $645E: $4C
    nop                                           ; $645F: $00
    nop                                           ; $6460: $00
    ld   [$204C], sp                              ; $6461: $08 $4C $20
    rst  $38                                      ; $6464: $FF
    rst  $38                                      ; $6465: $FF
    rst  $38                                      ; $6466: $FF
    rst  $38                                      ; $6467: $FF
    rst  $38                                      ; $6468: $FF
    rst  $38                                      ; $6469: $FF
    rst  $38                                      ; $646A: $FF
    rst  $38                                      ; $646B: $FF
    rst  $38                                      ; $646C: $FF
    rst  $38                                      ; $646D: $FF
    rst  $38                                      ; $646E: $FF
    rst  $38                                      ; $646F: $FF
    rst  $38                                      ; $6470: $FF
    rst  $38                                      ; $6471: $FF
    rst  $38                                      ; $6472: $FF
    rst  $38                                      ; $6473: $FF
    nop                                           ; $6474: $00
    nop                                           ; $6475: $00
    ld   c, [hl]                                  ; $6476: $4E
    nop                                           ; $6477: $00
    nop                                           ; $6478: $00
    ld   [$204E], sp                              ; $6479: $08 $4E $20
    rst  $38                                      ; $647C: $FF
    rst  $38                                      ; $647D: $FF
    rst  $38                                      ; $647E: $FF
    rst  $38                                      ; $647F: $FF
    rst  $38                                      ; $6480: $FF
    rst  $38                                      ; $6481: $FF
    rst  $38                                      ; $6482: $FF
    rst  $38                                      ; $6483: $FF
    rst  $38                                      ; $6484: $FF
    rst  $38                                      ; $6485: $FF
    rst  $38                                      ; $6486: $FF
    rst  $38                                      ; $6487: $FF
    rst  $38                                      ; $6488: $FF
    rst  $38                                      ; $6489: $FF
    rst  $38                                      ; $648A: $FF
    rst  $38                                      ; $648B: $FF
    ldh  a, [rP1]                                 ; $648C: $F0 $00
    ld   e, h                                     ; $648E: $5C
    nop                                           ; $648F: $00
    ldh  a, [$FF08]                               ; $6490: $F0 $08
    ld   e, h                                     ; $6492: $5C
    jr   nz, jr_015_6495                          ; $6493: $20 $00

jr_015_6495:
    nop                                           ; $6495: $00
    ld   e, [hl]                                  ; $6496: $5E
    nop                                           ; $6497: $00

jr_015_6498:
    nop                                           ; $6498: $00
    ld   [$205E], sp                              ; $6499: $08 $5E $20
    rst  $38                                      ; $649C: $FF
    rst  $38                                      ; $649D: $FF
    rst  $38                                      ; $649E: $FF
    rst  $38                                      ; $649F: $FF
    rst  $38                                      ; $64A0: $FF
    rst  $38                                      ; $64A1: $FF
    rst  $38                                      ; $64A2: $FF
    rst  $38                                      ; $64A3: $FF

jr_015_64A4:
    nop                                           ; $64A4: $00
    db   $FC                                      ; $64A5: $FC
    ld   l, d                                     ; $64A6: $6A
    nop                                           ; $64A7: $00
    nop                                           ; $64A8: $00
    inc  b                                        ; $64A9: $04
    ld   l, h                                     ; $64AA: $6C
    jr   nz, jr_015_64AD                          ; $64AB: $20 $00

jr_015_64AD:
    inc  c                                        ; $64AD: $0C
    ld   l, d                                     ; $64AE: $6A
    jr   nz, jr_015_64A4                          ; $64AF: $20 $F3

    db   $FC                                      ; $64B1: $FC
    ld   d, b                                     ; $64B2: $50
    nop                                           ; $64B3: $00
    di                                            ; $64B4: $F3
    inc  b                                        ; $64B5: $04
    ld   d, d                                     ; $64B6: $52
    nop                                           ; $64B7: $00
    di                                            ; $64B8: $F3
    inc  c                                        ; $64B9: $0C
    ld   l, [hl]                                  ; $64BA: $6E
    nop                                           ; $64BB: $00
    xor  a                                        ; $64BC: $AF
    ldh  [hActiveEntitySpriteVariant], a               ; $64BD: $E0 $F1
    call SetEntitySpriteVariant                   ; $64BF: $CD $0C $3B
    call $572B                                    ; $64C2: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $64C5: $F0 $98
    push af                                       ; $64C7: $F5
    ldh  a, [hLinkPositionY]                      ; $64C8: $F0 $99
    push af                                       ; $64CA: $F5
    ld   a, $50                                   ; $64CB: $3E $50
    ldh  [hLinkPositionX], a                      ; $64CD: $E0 $98
    ld   a, $30                                   ; $64CF: $3E $30
    ldh  [hLinkPositionY], a                      ; $64D1: $E0 $99
    ld   a, $10                                   ; $64D3: $3E $10
    call label_3BAA                               ; $64D5: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $64D8: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $64DB: $F0 $EC
    sub  [hl]                                     ; $64DD: $96
    add  $03                                      ; $64DE: $C6 $03
    cp   $06                                      ; $64E0: $FE $06
    jr   nc, jr_015_64F8                          ; $64E2: $30 $14

    ld   hl, hLinkPositionX                       ; $64E4: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $64E7: $F0 $EE
    sub  [hl]                                     ; $64E9: $96
    add  $03                                      ; $64EA: $C6 $03
    cp   $06                                      ; $64EC: $FE $06
    jr   nc, jr_015_64F8                          ; $64EE: $30 $08

    call GetEntityTransitionCountdown             ; $64F0: $CD $05 $0C
    ld   [hl], $60                                ; $64F3: $36 $60
    call IncrementEntityWalkingAttr               ; $64F5: $CD $12 $3B

jr_015_64F8:
    pop  af                                       ; $64F8: $F1
    ldh  [hLinkPositionY], a                      ; $64F9: $E0 $99
    pop  af                                       ; $64FB: $F1
    ldh  [hLinkPositionX], a                      ; $64FC: $E0 $98
    jp   label_015_7B88                           ; $64FE: $C3 $88 $7B

    inc  b                                        ; $6501: $04
    inc  bc                                       ; $6502: $03
    ld   [bc], a                                  ; $6503: $02
    ld   bc, $0000                                ; $6504: $01 $00 $00
    nop                                           ; $6507: $00
    nop                                           ; $6508: $00
    nop                                           ; $6509: $00
    nop                                           ; $650A: $00
    nop                                           ; $650B: $00
    nop                                           ; $650C: $00
    nop                                           ; $650D: $00
    call GetEntityTransitionCountdown             ; $650E: $CD $05 $0C
    jr   nz, jr_015_652E                          ; $6511: $20 $1B

    ld   [$D224], a                               ; $6513: $EA $24 $D2
    ld   hl, wEntitiesPosYTable                         ; $6516: $21 $10 $C2
    add  hl, bc                                   ; $6519: $09
    ld   a, [hl]                                  ; $651A: $7E
    sub  $08                                      ; $651B: $D6 $08
    ld   [hl], a                                  ; $651D: $77
    call GetEntityTransitionCountdown             ; $651E: $CD $05 $0C
    ld   [hl], $08                                ; $6521: $36 $08
    ld   a, $04                                   ; $6523: $3E $04
    call SetEntitySpriteVariant                   ; $6525: $CD $0C $3B
    call func_015_52B1                            ; $6528: $CD $B1 $52
    jp   IncrementEntityWalkingAttr               ; $652B: $C3 $12 $3B

jr_015_652E:
    rra                                           ; $652E: $1F
    rra                                           ; $652F: $1F
    rra                                           ; $6530: $1F
    and  $0F                                      ; $6531: $E6 $0F
    ld   e, a                                     ; $6533: $5F
    ld   d, b                                     ; $6534: $50
    ld   hl, $6501                                ; $6535: $21 $01 $65
    add  hl, de                                   ; $6538: $19
    ld   a, [hl]                                  ; $6539: $7E
    rla                                           ; $653A: $17
    rla                                           ; $653B: $17
    rla                                           ; $653C: $17
    and  $F8                                      ; $653D: $E6 $F8
    ld   e, a                                     ; $653F: $5F
    rla                                           ; $6540: $17
    and  $F0                                      ; $6541: $E6 $F0
    add  e                                        ; $6543: $83
    ld   e, a                                     ; $6544: $5F
    ld   hl, $6444                                ; $6545: $21 $44 $64
    add  hl, de                                   ; $6548: $19
    ld   c, $06                                   ; $6549: $0E $06
    call label_3CE6                               ; $654B: $CD $E6 $3C
    ld   a, $06                                   ; $654E: $3E $06
    jp   label_3DA0                               ; $6550: $C3 $A0 $3D

    call GetEntityTransitionCountdown             ; $6553: $CD $05 $0C
    jr   nz, jr_015_6565                          ; $6556: $20 $0D

    ld   [hl], $7F                                ; $6558: $36 $7F
    jp   IncrementEntityWalkingAttr               ; $655A: $C3 $12 $3B

func_015_655D:
    call func_015_7BDB                            ; $655D: $CD $DB $7B
    ld   a, e                                     ; $6560: $7B
    ld   [$D21E], a                               ; $6561: $EA $1E $D2
    ret                                           ; $6564: $C9

jr_015_6565:
    ret                                           ; $6565: $C9

    inc  b                                        ; $6566: $04
    inc  b                                        ; $6567: $04
    inc  b                                        ; $6568: $04
    inc  b                                        ; $6569: $04
    inc  b                                        ; $656A: $04
    inc  b                                        ; $656B: $04
    inc  b                                        ; $656C: $04
    inc  b                                        ; $656D: $04
    inc  b                                        ; $656E: $04
    inc  b                                        ; $656F: $04
    inc  b                                        ; $6570: $04
    inc  b                                        ; $6571: $04
    inc  b                                        ; $6572: $04
    inc  b                                        ; $6573: $04
    inc  b                                        ; $6574: $04
    inc  b                                        ; $6575: $04
    nop                                           ; $6576: $00
    nop                                           ; $6577: $00
    nop                                           ; $6578: $00
    nop                                           ; $6579: $00
    nop                                           ; $657A: $00
    nop                                           ; $657B: $00
    nop                                           ; $657C: $00
    nop                                           ; $657D: $00
    nop                                           ; $657E: $00
    nop                                           ; $657F: $00
    nop                                           ; $6580: $00
    nop                                           ; $6581: $00
    nop                                           ; $6582: $00
    nop                                           ; $6583: $00
    nop                                           ; $6584: $00
    nop                                           ; $6585: $00
    dec  b                                        ; $6586: $05
    dec  b                                        ; $6587: $05
    dec  b                                        ; $6588: $05
    dec  b                                        ; $6589: $05
    dec  b                                        ; $658A: $05
    dec  b                                        ; $658B: $05
    dec  b                                        ; $658C: $05
    dec  b                                        ; $658D: $05
    dec  b                                        ; $658E: $05
    dec  b                                        ; $658F: $05
    dec  b                                        ; $6590: $05
    dec  b                                        ; $6591: $05
    dec  b                                        ; $6592: $05
    dec  b                                        ; $6593: $05
    dec  b                                        ; $6594: $05
    dec  b                                        ; $6595: $05
    ld   [bc], a                                  ; $6596: $02
    rlca                                          ; $6597: $07
    ld   [$0000], sp                              ; $6598: $08 $00 $00
    nop                                           ; $659B: $00
    nop                                           ; $659C: $00
    nop                                           ; $659D: $00
    nop                                           ; $659E: $00
    nop                                           ; $659F: $00
    nop                                           ; $65A0: $00
    nop                                           ; $65A1: $00
    nop                                           ; $65A2: $00
    nop                                           ; $65A3: $00
    nop                                           ; $65A4: $00
    nop                                           ; $65A5: $00
    ld   a, $00                                   ; $65A6: $3E $00
    ld   [$D21E], a                               ; $65A8: $EA $1E $D2
    call GetEntityTransitionCountdown             ; $65AB: $CD $05 $0C
    jr   nz, jr_015_65BB                          ; $65AE: $20 $0B

    call label_BFB                                ; $65B0: $CD $FB $0B
    ld   [hl], $4C                                ; $65B3: $36 $4C
    call func_015_655D                            ; $65B5: $CD $5D $65
    jp   IncrementEntityWalkingAttr               ; $65B8: $C3 $12 $3B

jr_015_65BB:
    cp   $40                                      ; $65BB: $FE $40
    jr   nz, jr_015_65C4                          ; $65BD: $20 $05

    ld   hl, hNoiseSfx                            ; $65BF: $21 $F4 $FF
    ld   [hl], $19                                ; $65C2: $36 $19

jr_015_65C4:
    cp   $58                                      ; $65C4: $FE $58
    jr   nz, jr_015_65CD                          ; $65C6: $20 $05

    ld   hl, hJingle                              ; $65C8: $21 $F2 $FF
    ld   [hl], $39                                ; $65CB: $36 $39

jr_015_65CD:
    rra                                           ; $65CD: $1F
    rra                                           ; $65CE: $1F
    and  $3F                                      ; $65CF: $E6 $3F
    ld   e, a                                     ; $65D1: $5F
    ld   d, b                                     ; $65D2: $50
    ld   hl, $6586                                ; $65D3: $21 $86 $65
    add  hl, de                                   ; $65D6: $19
    ld   a, [hl]                                  ; $65D7: $7E
    ld   [$D224], a                               ; $65D8: $EA $24 $D2
    ld   hl, $6566                                ; $65DB: $21 $66 $65
    add  hl, de                                   ; $65DE: $19
    ld   a, [hl]                                  ; $65DF: $7E
    call SetEntitySpriteVariant                   ; $65E0: $CD $0C $3B
    ld   a, [$D224]                               ; $65E3: $FA $24 $D2

jr_015_65E6:
    cp   $05                                      ; $65E6: $FE $05
    jr   z, jr_015_65F5                           ; $65E8: $28 $0B

    ld   a, $F3                                   ; $65EA: $3E $F3
    ld   [$D225], a                               ; $65EC: $EA $25 $D2
    ld   a, $F0                                   ; $65EF: $3E $F0
    ld   [$D226], a                               ; $65F1: $EA $26 $D2
    ret                                           ; $65F4: $C9

jr_015_65F5:
    ld   a, $F8                                   ; $65F5: $3E $F8
    ld   [$D225], a                               ; $65F7: $EA $25 $D2
    ld   a, $FE                                   ; $65FA: $3E $FE
    ld   [$D226], a                               ; $65FC: $EA $26 $D2
    ret                                           ; $65FF: $C9

    inc  bc                                       ; $6600: $03
    ld   [bc], a                                  ; $6601: $02
    ld   bc, $0000                                ; $6602: $01 $00 $00
    ld   bc, $0302                                ; $6605: $01 $02 $03
    add  sp, $00                                  ; $6608: $E8 $00
    jr   @+$1A                                    ; $660A: $18 $18

    nop                                           ; $660C: $00
    add  sp, -$18                                 ; $660D: $E8 $E8
    nop                                           ; $660F: $00
    db   $10                                      ; $6610: $10
    jr   jr_015_6623                              ; $6611: $18 $10

    ldh  a, [hFFE8]                               ; $6613: $F0 $E8
    ldh  a, [rNR10]                               ; $6615: $F0 $10
    jr   jr_015_65E6                              ; $6617: $18 $CD

    ei                                            ; $6619: $FB
    dec  bc                                       ; $661A: $0B
    jr   nz, jr_015_6628                          ; $661B: $20 $0B

    ld   [$D221], a                               ; $661D: $EA $21 $D2
    call GetEntityTransitionCountdown             ; $6620: $CD $05 $0C

jr_015_6623:
    ld   [hl], $30                                ; $6623: $36 $30
    jp   IncrementEntityWalkingAttr               ; $6625: $C3 $12 $3B

jr_015_6628:
    ld   a, [$D21E]                               ; $6628: $FA $1E $D2
    and  a                                        ; $662B: $A7
    ld   a, $F5                                   ; $662C: $3E $F5
    jr   z, jr_015_6632                           ; $662E: $28 $02

    ld   a, $0B                                   ; $6630: $3E $0B

jr_015_6632:
    ld   [$D225], a                               ; $6632: $EA $25 $D2
    ld   a, $EE                                   ; $6635: $3E $EE
    ld   [$D226], a                               ; $6637: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $663A: $F0 $E7
    rra                                           ; $663C: $1F
    rra                                           ; $663D: $1F
    rra                                           ; $663E: $1F
    nop                                           ; $663F: $00
    and  $01                                      ; $6640: $E6 $01
    call SetEntitySpriteVariant                   ; $6642: $CD $0C $3B
    ld   a, [$D21E]                               ; $6645: $FA $1E $D2
    and  a                                        ; $6648: $A7
    ld   hl, $6600                                ; $6649: $21 $00 $66
    jr   z, jr_015_6651                           ; $664C: $28 $03

    ld   hl, $6604                                ; $664E: $21 $04 $66

jr_015_6651:
    ldh  a, [hFrameCounter]                       ; $6651: $F0 $E7
    rra                                           ; $6653: $1F
    rra                                           ; $6654: $1F
    rra                                           ; $6655: $1F
    nop                                           ; $6656: $00
    nop                                           ; $6657: $00
    and  $03                                      ; $6658: $E6 $03
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    add  hl, de                                   ; $665C: $19
    ld   a, [hl]                                  ; $665D: $7E
    inc  a                                        ; $665E: $3C
    ld   [$D224], a                               ; $665F: $EA $24 $D2
    ldh  a, [hFrameCounter]                       ; $6662: $F0 $E7
    and  $1F                                      ; $6664: $E6 $1F
    jr   nz, jr_015_66C7                          ; $6666: $20 $5F

    ld   a, [$D221]                               ; $6668: $FA $21 $D2
    cp   $06                                      ; $666B: $FE $06
    jr   nc, jr_015_66C7                          ; $666D: $30 $58

    ld   a, $E6                                   ; $666F: $3E $E6
    call func_003_64CA_trampoline                               ; $6671: $CD $86 $3B
    ret  c                                        ; $6674: $D8

    ld   hl, wEntitiesTransitionCountdownTable    ; $6675: $21 $E0 $C2
    add  hl, de                                   ; $6678: $19
    ld   [hl], $30                                ; $6679: $36 $30
    ld   hl, wEntitiesUnknownTableB               ; $667B: $21 $B0 $C2
    add  hl, de                                   ; $667E: $19
    ld   [hl], $02                                ; $667F: $36 $02
    push bc                                       ; $6681: $C5
    ld   hl, wEntitiesUnknowTableL                ; $6682: $21 $40 $C3
    add  hl, de                                   ; $6685: $19
    ld   [hl], $42                                ; $6686: $36 $42
    ld   hl, wEntitiesUnknowTableM                ; $6688: $21 $50 $C3
    add  hl, de                                   ; $668B: $19
    ld   [hl], $00                                ; $668C: $36 $00
    push de                                       ; $668E: $D5
    ld   c, e                                     ; $668F: $4B
    ld   b, d                                     ; $6690: $42
    call label_3AEA                               ; $6691: $CD $EA $3A
    pop  de                                       ; $6694: $D1
    ld   a, [$D21E]                               ; $6695: $FA $1E $D2
    and  a                                        ; $6698: $A7
    ld   a, [$D221]                               ; $6699: $FA $21 $D2
    jr   nz, jr_015_66A0                          ; $669C: $20 $02

    xor  $07                                      ; $669E: $EE $07

jr_015_66A0:
    ld   c, a                                     ; $66A0: $4F
    ld   hl, $6610                                ; $66A1: $21 $10 $66
    add  hl, bc                                   ; $66A4: $09
    ld   a, [$D225]                               ; $66A5: $FA $25 $D2
    add  [hl]                                     ; $66A8: $86
    ld   hl, hScratch0                            ; $66A9: $21 $D7 $FF
    add  [hl]                                     ; $66AC: $86
    ld   hl, wEntitiesPosXTable                         ; $66AD: $21 $00 $C2
    add  hl, de                                   ; $66B0: $19
    ld   [hl], a                                  ; $66B1: $77
    ld   hl, $6608                                ; $66B2: $21 $08 $66
    add  hl, bc                                   ; $66B5: $09
    ld   a, [hl]                                  ; $66B6: $7E
    sub  $0C                                      ; $66B7: $D6 $0C
    ld   hl, hScratch1                            ; $66B9: $21 $D8 $FF
    add  [hl]                                     ; $66BC: $86
    ld   hl, wEntitiesPosYTable                         ; $66BD: $21 $10 $C2
    add  hl, de                                   ; $66C0: $19
    ld   [hl], a                                  ; $66C1: $77
    ld   hl, $D221                                ; $66C2: $21 $21 $D2
    inc  [hl]                                     ; $66C5: $34
    pop  bc                                       ; $66C6: $C1

jr_015_66C7:
    ret                                           ; $66C7: $C9

    dec  bc                                       ; $66C8: $0B
    ld   a, [bc]                                  ; $66C9: $0A
    ld   [bc], a                                  ; $66CA: $02
    ld   a, [bc]                                  ; $66CB: $0A
    ld   a, [$D21E]                               ; $66CC: $FA $1E $D2
    and  a                                        ; $66CF: $A7
    ld   a, $FD                                   ; $66D0: $3E $FD
    jr   z, jr_015_66D6                           ; $66D2: $28 $02

    ld   a, $03                                   ; $66D4: $3E $03

jr_015_66D6:
    ld   [$D225], a                               ; $66D6: $EA $25 $D2
    ld   a, $EC                                   ; $66D9: $3E $EC
    ld   [$D226], a                               ; $66DB: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $66DE: $F0 $E7
    rra                                           ; $66E0: $1F
    rra                                           ; $66E1: $1F
    rra                                           ; $66E2: $1F
    nop                                           ; $66E3: $00
    nop                                           ; $66E4: $00
    and  $03                                      ; $66E5: $E6 $03
    ld   e, a                                     ; $66E7: $5F
    ld   d, b                                     ; $66E8: $50
    ld   hl, $66C8                                ; $66E9: $21 $C8 $66
    add  hl, de                                   ; $66EC: $19
    ld   a, [hl]                                  ; $66ED: $7E
    inc  a                                        ; $66EE: $3C
    ld   [$D224], a                               ; $66EF: $EA $24 $D2
    call GetEntityTransitionCountdown             ; $66F2: $CD $05 $0C
    jr   nz, jr_015_674E                          ; $66F5: $20 $57

    ld   [hl], $40                                ; $66F7: $36 $40
    xor  a                                        ; $66F9: $AF
    ld   [$D224], a                               ; $66FA: $EA $24 $D2
    call IncrementEntityWalkingAttr               ; $66FD: $CD $12 $3B
    ld   a, $E6                                   ; $6700: $3E $E6
    call func_003_64CA_trampoline                               ; $6702: $CD $86 $3B
    jr   c, jr_015_674E                           ; $6705: $38 $47

    ld   hl, wEntitiesUnknownTableB               ; $6707: $21 $B0 $C2
    add  hl, de                                   ; $670A: $19
    inc  [hl]                                     ; $670B: $34
    ldh  a, [hScratch1]                           ; $670C: $F0 $D8
    sub  $10                                      ; $670E: $D6 $10
    ld   hl, wEntitiesPosYTable                         ; $6710: $21 $10 $C2
    add  hl, de                                   ; $6713: $19
    ld   [hl], a                                  ; $6714: $77
    ld   a, [$D21E]                               ; $6715: $FA $1E $D2
    ld   hl, wEntitiesUnknowTableQ                ; $6718: $21 $80 $C3
    add  hl, de                                   ; $671B: $19
    ld   [hl], a                                  ; $671C: $77
    and  a                                        ; $671D: $A7
    ld   a, $08                                   ; $671E: $3E $08
    jr   nz, jr_015_6724                          ; $6720: $20 $02

    ld   a, $F8                                   ; $6722: $3E $F8

jr_015_6724:
    ld   hl, hScratch0                            ; $6724: $21 $D7 $FF
    add  [hl]                                     ; $6727: $86
    ld   hl, wEntitiesPosXTable                         ; $6728: $21 $00 $C2
    add  hl, de                                   ; $672B: $19
    ld   [hl], a                                  ; $672C: $77
    ld   hl, wEntitiesUnknowTableL                ; $672D: $21 $40 $C3
    add  hl, de                                   ; $6730: $19
    ld   [hl], $40                                ; $6731: $36 $40
    ld   hl, wEntitiesUnknowTableM                ; $6733: $21 $50 $C3
    add  hl, de                                   ; $6736: $19
    ld   [hl], $08                                ; $6737: $36 $08
    push bc                                       ; $6739: $C5
    ld   c, e                                     ; $673A: $4B
    ld   b, d                                     ; $673B: $42
    call label_3AEA                               ; $673C: $CD $EA $3A
    ld   a, $18                                   ; $673F: $3E $18
    call label_3BAA                               ; $6741: $CD $AA $3B
    call GetEntityTransitionCountdown             ; $6744: $CD $05 $0C
    ld   [hl], $30                                ; $6747: $36 $30
    ld   a, $27                                   ; $6749: $3E $27
    ldh  [hNoiseSfx], a                           ; $674B: $E0 $F4
    pop  bc                                       ; $674D: $C1

jr_015_674E:
    ld   a, $02                                   ; $674E: $3E $02
    jp   SetEntitySpriteVariant                   ; $6750: $C3 $0C $3B

    call GetEntityTransitionCountdown             ; $6753: $CD $05 $0C
    jr   nz, jr_015_676A                          ; $6756: $20 $12

    ld   [hl], $1F                                ; $6758: $36 $1F
    call GetRandomByte                            ; $675A: $CD $0D $28
    and  $07                                      ; $675D: $E6 $07
    ld   hl, wEntitiesUnknownTableC               ; $675F: $21 $C0 $C2
    add  hl, bc                                   ; $6762: $09
    ld   [hl], a                                  ; $6763: $77
    call func_015_5128                            ; $6764: $CD $28 $51
    call IncrementEntityWalkingAttr               ; $6767: $CD $12 $3B

jr_015_676A:
    ld   a, $03                                   ; $676A: $3E $03
    jp   SetEntitySpriteVariant                   ; $676C: $C3 $0C $3B

    jr   z, jr_015_67C1                           ; $676F: $28 $50

    ld   a, b                                     ; $6771: $78
    jr   z, @+$7A                                 ; $6772: $28 $78

    jr   z, jr_015_67C6                           ; $6774: $28 $50

    ld   a, b                                     ; $6776: $78
    jr   nz, @+$2A                                ; $6777: $20 $28

    jr   nz, jr_015_67AB                          ; $6779: $20 $30

    jr   nc, jr_015_67CD                          ; $677B: $30 $50

    ld   d, b                                     ; $677D: $50
    ld   d, b                                     ; $677E: $50
    jr   nz, jr_015_679F                          ; $677F: $20 $1E

    inc  e                                        ; $6781: $1C
    ld   a, [de]                                  ; $6782: $1A
    jr   @+$18                                    ; $6783: $18 $16

    inc  d                                        ; $6785: $14
    ld   [de], a                                  ; $6786: $12
    db   $10                                      ; $6787: $10
    ld   c, $0C                                   ; $6788: $0E $0C
    ld   a, [bc]                                  ; $678A: $0A
    ld   [$0406], sp                              ; $678B: $08 $06 $04
    ld   [bc], a                                  ; $678E: $02
    ld   a, $04                                   ; $678F: $3E $04
    call SetEntitySpriteVariant                   ; $6791: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $6794: $F0 $98
    push af                                       ; $6796: $F5
    ldh  a, [hLinkPositionY]                      ; $6797: $F0 $99
    push af                                       ; $6799: $F5
    ld   hl, wEntitiesUnknownTableC               ; $679A: $21 $C0 $C2
    add  hl, bc                                   ; $679D: $09
    ld   e, [hl]                                  ; $679E: $5E

jr_015_679F:
    ld   d, b                                     ; $679F: $50
    ld   hl, $676F                                ; $67A0: $21 $6F $67
    add  hl, de                                   ; $67A3: $19
    ld   a, [hl]                                  ; $67A4: $7E
    ldh  [hLinkPositionX], a                      ; $67A5: $E0 $98
    ld   hl, $6777                                ; $67A7: $21 $77 $67
    add  hl, de                                   ; $67AA: $19

jr_015_67AB:
    ld   a, [hl]                                  ; $67AB: $7E
    ldh  [hLinkPositionY], a                      ; $67AC: $E0 $99
    call GetEntityTransitionCountdown             ; $67AE: $CD $05 $0C
    rra                                           ; $67B1: $1F
    and  $0F                                      ; $67B2: $E6 $0F
    ld   e, a                                     ; $67B4: $5F
    ld   d, b                                     ; $67B5: $50
    ld   hl, $677F                                ; $67B6: $21 $7F $67
    add  hl, de                                   ; $67B9: $19
    ld   a, [hl]                                  ; $67BA: $7E
    call label_3BAA                               ; $67BB: $CD $AA $3B
    ld   hl, wActiveEntityPosX                    ; $67BE: $21 $EE $FF

jr_015_67C1:
    ldh  a, [hLinkPositionX]                      ; $67C1: $F0 $98
    sub  [hl]                                     ; $67C3: $96
    add  $03                                      ; $67C4: $C6 $03

jr_015_67C6:
    cp   $06                                      ; $67C6: $FE $06
    jr   nc, jr_015_67D9                          ; $67C8: $30 $0F

    ld   hl, wActiveEntityPosY                    ; $67CA: $21 $EC $FF

jr_015_67CD:
    ldh  a, [hLinkPositionY]                      ; $67CD: $F0 $99
    sub  [hl]                                     ; $67CF: $96
    add  $03                                      ; $67D0: $C6 $03
    cp   $06                                      ; $67D2: $FE $06
    jr   nc, jr_015_67D9                          ; $67D4: $30 $03

    call IncrementEntityWalkingAttr               ; $67D6: $CD $12 $3B

jr_015_67D9:
    pop  af                                       ; $67D9: $F1
    ldh  [hLinkPositionY], a                      ; $67DA: $E0 $99
    pop  af                                       ; $67DC: $F1
    ldh  [hLinkPositionX], a                      ; $67DD: $E0 $98
    jp   label_015_7B88                           ; $67DF: $C3 $88 $7B

    ret                                           ; $67E2: $C9

    call GetEntityTransitionCountdown             ; $67E3: $CD $05 $0C
    jr   nz, jr_015_67F9                          ; $67E6: $20 $11

    ld   [hl], $40                                ; $67E8: $36 $40
    call func_015_542E                            ; $67EA: $CD $2E $54
    call IncrementEntityWalkingAttr               ; $67ED: $CD $12 $3B
    ld   a, $00                                   ; $67F0: $3E $00
    call SetEntitySpriteVariant                   ; $67F2: $CD $0C $3B
    xor  a                                        ; $67F5: $AF
    ld   [$D224], a                               ; $67F6: $EA $24 $D2

jr_015_67F9:
    ret                                           ; $67F9: $C9

    ld   a, $06                                   ; $67FA: $3E $06
    ldh  [hActiveEntitySpriteVariant], a               ; $67FC: $E0 $F1
    call $572B                                    ; $67FE: $CD $2B $57
    call GetEntityTransitionCountdown             ; $6801: $CD $05 $0C
    ret  nz                                       ; $6804: $C0

    ld   hl, wEntitiesUnknowTableL                ; $6805: $21 $40 $C3
    add  hl, bc                                   ; $6808: $09
    res  6, [hl]                                  ; $6809: $CB $B6
    call IncrementEntityWalkingAttr               ; $680B: $CD $12 $3B
    jp   ClearEntitySpeed                               ; $680E: $C3 $7F $3D

    call label_3B39                               ; $6811: $CD $39 $3B
    call func_015_7B88                            ; $6814: $CD $88 $7B
    call label_3B23                               ; $6817: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $681A: $F0 $E7
    and  $01                                      ; $681C: $E6 $01
    jr   nz, jr_015_683F                          ; $681E: $20 $1F

    ld   a, $18                                   ; $6820: $3E $18
    call GetVectorTowardsLink_trampoline          ; $6822: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $6825: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                       ; $6827: $21 $50 $C2
    sub  [hl]                                     ; $682A: $96
    bit  7, a                                     ; $682B: $CB $7F
    jr   z, jr_015_6831                           ; $682D: $28 $02

    dec  [hl]                                     ; $682F: $35
    dec  [hl]                                     ; $6830: $35

jr_015_6831:
    inc  [hl]                                     ; $6831: $34
    ldh  a, [hScratch1]                           ; $6832: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                       ; $6834: $21 $40 $C2
    sub  [hl]                                     ; $6837: $96
    bit  7, a                                     ; $6838: $CB $7F
    jr   z, jr_015_683E                           ; $683A: $28 $02

    dec  [hl]                                     ; $683C: $35
    dec  [hl]                                     ; $683D: $35

jr_015_683E:
    inc  [hl]                                     ; $683E: $34

jr_015_683F:
    ld   hl, wEntitiesUnknowTableU                ; $683F: $21 $20 $C4
    add  hl, bc                                   ; $6842: $09
    ld   a, [hl]                                  ; $6843: $7E
    and  a                                        ; $6844: $A7
    jr   z, jr_015_685F                           ; $6845: $28 $18

    ld   hl, wEntitiesUnknowTableL                ; $6847: $21 $40 $C3
    add  hl, bc                                   ; $684A: $09
    set  6, [hl]                                  ; $684B: $CB $F6
    call GetEntityTransitionCountdown             ; $684D: $CD $05 $0C
    ld   [hl], $80                                ; $6850: $36 $80
    call label_27F2                               ; $6852: $CD $F2 $27
    ld   a, $10                                   ; $6855: $3E $10
    ldh  [hWaveSfx], a                            ; $6857: $E0 $F3
    call func_015_5383                            ; $6859: $CD $83 $53
    jp   IncrementEntityWalkingAttr               ; $685C: $C3 $12 $3B

jr_015_685F:
    ld   hl, wEntitiesUnknowTableY                ; $685F: $21 $D0 $C3
    add  hl, bc                                   ; $6862: $09
    ld   a, [hl]                                  ; $6863: $7E
    inc  a                                        ; $6864: $3C
    ld   [hl], a                                  ; $6865: $77
    and  $07                                      ; $6866: $E6 $07
    ret  nz                                       ; $6868: $C0

    ld   a, $E6                                   ; $6869: $3E $E6
    call func_003_64CA_trampoline                               ; $686B: $CD $86 $3B
    ret  c                                        ; $686E: $D8

    ldh  a, [hScratch0]                           ; $686F: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $6871: $21 $00 $C2
    add  hl, de                                   ; $6874: $19
    ld   [hl], a                                  ; $6875: $77
    ldh  a, [hScratch1]                           ; $6876: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $6878: $21 $10 $C2
    add  hl, de                                   ; $687B: $19
    ld   [hl], a                                  ; $687C: $77
    ld   hl, wEntitiesUnknownTableB               ; $687D: $21 $B0 $C2
    add  hl, de                                   ; $6880: $19
    ld   [hl], $03                                ; $6881: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6883: $21 $E0 $C2
    add  hl, de                                   ; $6886: $19
    ld   [hl], $1F                                ; $6887: $36 $1F
    ld   hl, wEntitiesUnknowTableL                ; $6889: $21 $40 $C3
    add  hl, de                                   ; $688C: $19
    ld   [hl], $C2                                ; $688D: $36 $C2
    ld   hl, wEntitiesSpriteVariantTable               ; $688F: $21 $B0 $C3
    add  hl, de                                   ; $6892: $19
    ld   [hl], $01                                ; $6893: $36 $01
    ret                                           ; $6895: $C9

    call GetEntityTransitionCountdown             ; $6896: $CD $05 $0C
    cp   $01                                      ; $6899: $FE $01
    jr   nz, jr_015_68A1                          ; $689B: $20 $04

    dec  [hl]                                     ; $689D: $35
    jp   label_015_5128                           ; $689E: $C3 $28 $51

jr_015_68A1:
    and  a                                        ; $68A1: $A7
    ret  nz                                       ; $68A2: $C0

    ldh  a, [hLinkPositionX]                      ; $68A3: $F0 $98
    push af                                       ; $68A5: $F5
    ldh  a, [hLinkPositionY]                      ; $68A6: $F0 $99
    push af                                       ; $68A8: $F5
    ld   a, $50                                   ; $68A9: $3E $50
    ldh  [hLinkPositionX], a                      ; $68AB: $E0 $98
    ld   a, $30                                   ; $68AD: $3E $30
    ldh  [hLinkPositionY], a                      ; $68AF: $E0 $99
    ld   a, $0C                                   ; $68B1: $3E $0C
    call label_3BAA                               ; $68B3: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $68B6: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $68B9: $F0 $EC
    sub  [hl]                                     ; $68BB: $96
    add  $03                                      ; $68BC: $C6 $03
    cp   $06                                      ; $68BE: $FE $06
    jr   nc, jr_015_68D6                          ; $68C0: $30 $14

    ld   hl, hLinkPositionX                       ; $68C2: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $68C5: $F0 $EE
    sub  [hl]                                     ; $68C7: $96
    add  $03                                      ; $68C8: $C6 $03
    cp   $06                                      ; $68CA: $FE $06
    jr   nc, jr_015_68D6                          ; $68CC: $30 $08

    call GetEntityTransitionCountdown             ; $68CE: $CD $05 $0C
    ld   [hl], $5F                                ; $68D1: $36 $5F
    call IncrementEntityWalkingAttr               ; $68D3: $CD $12 $3B

jr_015_68D6:
    pop  af                                       ; $68D6: $F1
    ldh  [hLinkPositionY], a                      ; $68D7: $E0 $99
    pop  af                                       ; $68D9: $F1
    ldh  [hLinkPositionX], a                      ; $68DA: $E0 $98
    jp   label_015_7B88                           ; $68DC: $C3 $88 $7B

    nop                                           ; $68DF: $00
    nop                                           ; $68E0: $00
    nop                                           ; $68E1: $00
    ld   bc, $0101                                ; $68E2: $01 $01 $01
    ld   [bc], a                                  ; $68E5: $02
    ld   [bc], a                                  ; $68E6: $02
    call GetEntityTransitionCountdown             ; $68E7: $CD $05 $0C
    jr   nz, jr_015_6914                          ; $68EA: $20 $28

    call ClearEntitySpeed                         ; $68EC: $CD $7F $3D
    call func_015_52BB                            ; $68EF: $CD $BB $52
    ld   hl, wEntitiesHealthTable                 ; $68F2: $21 $60 $C3
    add  hl, bc                                   ; $68F5: $09
    ld   [hl], $FF                                ; $68F6: $36 $FF
    ld   hl, wEntitiesUnknowTableL                ; $68F8: $21 $40 $C3
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], $00                                ; $68FC: $36 $00
    ld   hl, wEntitiesUnknowTableH                ; $68FE: $21 $30 $C4
    add  hl, bc                                   ; $6901: $09
    ld   [hl], $C0                                ; $6902: $36 $C0
    call label_BFB                                ; $6904: $CD $FB $0B
    ld   [hl], $90                                ; $6907: $36 $90
    xor  a                                        ; $6909: $AF
    ld   [$D223], a                               ; $690A: $EA $23 $D2
    ld   hl, wEntitiesUnknowTableG                ; $690D: $21 $00 $C3
    add  hl, bc                                   ; $6910: $09
    ld   [hl], $3F                                ; $6911: $36 $3F
    ret                                           ; $6913: $C9

jr_015_6914:
    cp   $20                                      ; $6914: $FE $20
    jr   c, jr_015_691A                           ; $6916: $38 $02

    ld   a, $1F                                   ; $6918: $3E $1F

jr_015_691A:
    rra                                           ; $691A: $1F
    rra                                           ; $691B: $1F
    and  $07                                      ; $691C: $E6 $07
    ld   e, a                                     ; $691E: $5F
    ld   d, b                                     ; $691F: $50
    ld   hl, $68DF                                ; $6920: $21 $DF $68
    add  hl, de                                   ; $6923: $19
    ld   a, [hl]                                  ; $6924: $7E
    ldh  [hActiveEntitySpriteVariant], a               ; $6925: $E0 $F1
    jp   $572B                                    ; $6927: $C3 $2B $57

func_015_692A:
    ldh  a, [hActiveEntityState]                  ; $692A: $F0 $F0
    cp   $0A                                      ; $692C: $FE $0A
    ret  nc                                       ; $692E: $D0

    ldh  a, [hActiveEntitySpriteVariant]               ; $692F: $F0 $F1
    inc  a                                        ; $6931: $3C
    ret  z                                        ; $6932: $C8

    ld   a, [$D21E]                               ; $6933: $FA $1E $D2
    and  a                                        ; $6936: $A7
    ldh  a, [hActiveEntitySpriteVariant]               ; $6937: $F0 $F1
    jr   z, jr_015_693D                           ; $6939: $28 $02

    add  $05                                      ; $693B: $C6 $05

jr_015_693D:
    ldh  [hActiveEntitySpriteVariant], a               ; $693D: $E0 $F1
    call func_015_69D2                            ; $693F: $CD $D2 $69
    call func_015_6A69                            ; $6942: $CD $69 $6A
    jp   label_015_6C10                           ; $6945: $C3 $10 $6C

    ld   hl, sp-$04                               ; $6948: $F8 $FC
    ld   d, b                                     ; $694A: $50
    nop                                           ; $694B: $00
    ld   hl, sp+$04                               ; $694C: $F8 $04
    ld   d, d                                     ; $694E: $52
    nop                                           ; $694F: $00
    ld   hl, sp+$0C                               ; $6950: $F8 $0C
    ld   l, [hl]                                  ; $6952: $6E
    nop                                           ; $6953: $00
    ld   [$6AF8], sp                              ; $6954: $08 $F8 $6A
    nop                                           ; $6957: $00
    ld   [$6C00], sp                              ; $6958: $08 $00 $6C
    nop                                           ; $695B: $00
    ld   [$6C08], sp                              ; $695C: $08 $08 $6C
    jr   nz, jr_015_6969                          ; $695F: $20 $08

    db   $10                                      ; $6961: $10
    ld   l, d                                     ; $6962: $6A
    jr   nz, @+$01                                ; $6963: $20 $FF

    rst  $38                                      ; $6965: $FF
    rst  $38                                      ; $6966: $FF
    rst  $38                                      ; $6967: $FF
    ei                                            ; $6968: $FB

jr_015_6969:
    cp   $50                                      ; $6969: $FE $50
    nop                                           ; $696B: $00
    ei                                            ; $696C: $FB
    ld   b, $52                                   ; $696D: $06 $52
    nop                                           ; $696F: $00
    ei                                            ; $6970: $FB
    ld   c, $6E                                   ; $6971: $0E $6E
    nop                                           ; $6973: $00
    ld   [$6AF8], sp                              ; $6974: $08 $F8 $6A
    nop                                           ; $6977: $00
    ld   [$6C00], sp                              ; $6978: $08 $00 $6C
    nop                                           ; $697B: $00
    ld   [$6C08], sp                              ; $697C: $08 $08 $6C
    jr   nz, @+$0A                                ; $697F: $20 $08

    db   $10                                      ; $6981: $10
    ld   l, d                                     ; $6982: $6A
    jr   nz, @+$01                                ; $6983: $20 $FF

jr_015_6985:
    rst  $38                                      ; $6985: $FF
    rst  $38                                      ; $6986: $FF
    rst  $38                                      ; $6987: $FF
    ld   hl, sp-$04                               ; $6988: $F8 $FC
    ld   l, [hl]                                  ; $698A: $6E
    jr   nz, jr_015_6985                          ; $698B: $20 $F8

    inc  b                                        ; $698D: $04
    ld   d, d                                     ; $698E: $52
    jr   nz, @-$06                                ; $698F: $20 $F8

    inc  c                                        ; $6991: $0C
    ld   d, b                                     ; $6992: $50
    jr   nz, @+$0A                                ; $6993: $20 $08

    ld   hl, sp+$6A                               ; $6995: $F8 $6A
    nop                                           ; $6997: $00
    ld   [$6C00], sp                              ; $6998: $08 $00 $6C
    nop                                           ; $699B: $00
    ld   [$6C08], sp                              ; $699C: $08 $08 $6C
    jr   nz, jr_015_69A9                          ; $699F: $20 $08

    db   $10                                      ; $69A1: $10
    ld   l, d                                     ; $69A2: $6A
    jr   nz, @+$01                                ; $69A3: $20 $FF

    rst  $38                                      ; $69A5: $FF
    rst  $38                                      ; $69A6: $FF
    rst  $38                                      ; $69A7: $FF
    ei                                            ; $69A8: $FB

jr_015_69A9:
    ld   a, [$206E]                               ; $69A9: $FA $6E $20

jr_015_69AC:
    ei                                            ; $69AC: $FB
    ld   [bc], a                                  ; $69AD: $02
    ld   d, d                                     ; $69AE: $52
    jr   nz, jr_015_69AC                          ; $69AF: $20 $FB

    ld   a, [bc]                                  ; $69B1: $0A
    ld   d, b                                     ; $69B2: $50
    jr   nz, @+$0A                                ; $69B3: $20 $08

    ld   hl, sp+$6A                               ; $69B5: $F8 $6A
    nop                                           ; $69B7: $00
    ld   [$6C00], sp                              ; $69B8: $08 $00 $6C
    nop                                           ; $69BB: $00
    ld   [$6C08], sp                              ; $69BC: $08 $08 $6C
    jr   nz, jr_015_69C9                          ; $69BF: $20 $08

    db   $10                                      ; $69C1: $10
    ld   l, d                                     ; $69C2: $6A
    jr   nz, @+$01                                ; $69C3: $20 $FF

    rst  $38                                      ; $69C5: $FF
    rst  $38                                      ; $69C6: $FF
    rst  $38                                      ; $69C7: $FF
    nop                                           ; $69C8: $00

jr_015_69C9:
    nop                                           ; $69C9: $00
    ld   [bc], a                                  ; $69CA: $02
    ld   bc, $0200                                ; $69CB: $01 $00 $02
    ld   [bc], a                                  ; $69CE: $02
    nop                                           ; $69CF: $00
    inc  bc                                       ; $69D0: $03
    ld   [bc], a                                  ; $69D1: $02

func_015_69D2:
    ldh  a, [hActiveEntitySpriteVariant]               ; $69D2: $F0 $F1
    ld   e, a                                     ; $69D4: $5F
    ld   d, b                                     ; $69D5: $50
    ld   hl, $69C8                                ; $69D6: $21 $C8 $69
    add  hl, de                                   ; $69D9: $19
    ld   a, [hl]                                  ; $69DA: $7E
    rla                                           ; $69DB: $17
    rla                                           ; $69DC: $17
    rla                                           ; $69DD: $17
    rla                                           ; $69DE: $17
    rla                                           ; $69DF: $17
    and  $70                                      ; $69E0: $E6 $70
    ld   e, a                                     ; $69E2: $5F
    ld   hl, $6948                                ; $69E3: $21 $48 $69
    add  hl, de                                   ; $69E6: $19
    ld   c, $07                                   ; $69E7: $0E $07
    call label_3CE6                               ; $69E9: $CD $E6 $3C
    ld   a, $07                                   ; $69EC: $3E $07
    jp   label_3DA0                               ; $69EE: $C3 $A0 $3D

    db   $F4                                      ; $69F1: $F4
    ld   hl, sp+$64                               ; $69F2: $F8 $64
    nop                                           ; $69F4: $00
    cp   $11                                      ; $69F5: $FE $11
    ld   h, b                                     ; $69F7: $60
    nop                                           ; $69F8: $00
    cp   $19                                      ; $69F9: $FE $19
    ld   h, d                                     ; $69FB: $62
    nop                                           ; $69FC: $00
    db   $F4                                      ; $69FD: $F4
    ld   sp, hl                                   ; $69FE: $F9
    ld   h, h                                     ; $69FF: $64
    nop                                           ; $6A00: $00
    cp   $11                                      ; $6A01: $FE $11
    ld   h, b                                     ; $6A03: $60
    nop                                           ; $6A04: $00
    cp   $19                                      ; $6A05: $FE $19
    ld   h, d                                     ; $6A07: $62
    nop                                           ; $6A08: $00
    ldh  a, [rP1]                                 ; $6A09: $F0 $00
    ld   h, h                                     ; $6A0B: $64
    jr   nz, @+$01                                ; $6A0C: $20 $FF

    rst  $38                                      ; $6A0E: $FF
    rst  $38                                      ; $6A0F: $FF
    rst  $38                                      ; $6A10: $FF
    rst  $38                                      ; $6A11: $FF
    rst  $38                                      ; $6A12: $FF
    rst  $38                                      ; $6A13: $FF
    rst  $38                                      ; $6A14: $FF
    rst  $38                                      ; $6A15: $FF
    rst  $38                                      ; $6A16: $FF
    rst  $38                                      ; $6A17: $FF
    rst  $38                                      ; $6A18: $FF
    ei                                            ; $6A19: $FB
    db   $10                                      ; $6A1A: $10
    ld   h, b                                     ; $6A1B: $60
    nop                                           ; $6A1C: $00
    ei                                            ; $6A1D: $FB
    jr   @+$64                                    ; $6A1E: $18 $62

    nop                                           ; $6A20: $00
    nop                                           ; $6A21: $00
    ld   hl, sp+$66                               ; $6A22: $F8 $66
    nop                                           ; $6A24: $00
    cp   $10                                      ; $6A25: $FE $10
    ld   h, [hl]                                  ; $6A27: $66
    jr   nz, @+$01                                ; $6A28: $20 $FF

    rst  $38                                      ; $6A2A: $FF
    rst  $38                                      ; $6A2B: $FF
    rst  $38                                      ; $6A2C: $FF
    db   $F4                                      ; $6A2D: $F4

jr_015_6A2E:
    db   $10                                      ; $6A2E: $10
    ld   h, h                                     ; $6A2F: $64

jr_015_6A30:
    jr   nz, jr_015_6A30                          ; $6A30: $20 $FE

    rst  $28                                      ; $6A32: $EF
    ld   h, d                                     ; $6A33: $62

jr_015_6A34:
    jr   nz, jr_015_6A34                          ; $6A34: $20 $FE

jr_015_6A36:
    rst  $30                                      ; $6A36: $F7
    ld   h, b                                     ; $6A37: $60
    jr   nz, jr_015_6A2E                          ; $6A38: $20 $F4

    rrca                                          ; $6A3A: $0F
    ld   h, h                                     ; $6A3B: $64

jr_015_6A3C:
    jr   nz, jr_015_6A3C                          ; $6A3C: $20 $FE

    rst  $28                                      ; $6A3E: $EF
    ld   h, d                                     ; $6A3F: $62

jr_015_6A40:
    jr   nz, jr_015_6A40                          ; $6A40: $20 $FE

    rst  $30                                      ; $6A42: $F7
    ld   h, b                                     ; $6A43: $60
    jr   nz, jr_015_6A36                          ; $6A44: $20 $F0

    ld   [$0064], sp                              ; $6A46: $08 $64 $00
    rst  $38                                      ; $6A49: $FF
    rst  $38                                      ; $6A4A: $FF
    rst  $38                                      ; $6A4B: $FF
    rst  $38                                      ; $6A4C: $FF
    rst  $38                                      ; $6A4D: $FF
    rst  $38                                      ; $6A4E: $FF
    rst  $38                                      ; $6A4F: $FF
    rst  $38                                      ; $6A50: $FF
    rst  $38                                      ; $6A51: $FF
    rst  $38                                      ; $6A52: $FF
    rst  $38                                      ; $6A53: $FF
    rst  $38                                      ; $6A54: $FF

jr_015_6A55:
    ei                                            ; $6A55: $FB
    ldh  a, [$FF62]                               ; $6A56: $F0 $62
    jr   nz, jr_015_6A55                          ; $6A58: $20 $FB

    ld   hl, sp+$60                               ; $6A5A: $F8 $60

jr_015_6A5C:
    jr   nz, jr_015_6A5C                          ; $6A5C: $20 $FE

    ld   hl, sp+$66                               ; $6A5E: $F8 $66
    nop                                           ; $6A60: $00
    nop                                           ; $6A61: $00
    db   $10                                      ; $6A62: $10
    ld   h, [hl]                                  ; $6A63: $66
    jr   nz, @+$01                                ; $6A64: $20 $FF

    rst  $38                                      ; $6A66: $FF
    rst  $38                                      ; $6A67: $FF
    rst  $38                                      ; $6A68: $FF

func_015_6A69:
    ldh  a, [hActiveEntitySpriteVariant]               ; $6A69: $F0 $F1
    rla                                           ; $6A6B: $17
    rla                                           ; $6A6C: $17
    and  $FC                                      ; $6A6D: $E6 $FC
    ld   e, a                                     ; $6A6F: $5F
    rla                                           ; $6A70: $17
    and  $F8                                      ; $6A71: $E6 $F8
    add  e                                        ; $6A73: $83
    ld   e, a                                     ; $6A74: $5F
    ld   d, b                                     ; $6A75: $50
    ld   hl, $69F1                                ; $6A76: $21 $F1 $69
    add  hl, de                                   ; $6A79: $19
    ld   c, $03                                   ; $6A7A: $0E $03
    call label_3CE6                               ; $6A7C: $CD $E6 $3C
    ld   a, $03                                   ; $6A7F: $3E $03
    jp   label_3DA0                               ; $6A81: $C3 $A0 $3D

    db   $EC                                      ; $6A84: $EC
    nop                                           ; $6A85: $00
    ld   [hl], b                                  ; $6A86: $70
    nop                                           ; $6A87: $00
    db   $EC                                      ; $6A88: $EC
    ld   [$2070], sp                              ; $6A89: $08 $70 $20
    db   $F4                                      ; $6A8C: $F4
    nop                                           ; $6A8D: $00
    ld   a, h                                     ; $6A8E: $7C
    nop                                           ; $6A8F: $00
    db   $F4                                      ; $6A90: $F4
    ld   [$207C], sp                              ; $6A91: $08 $7C $20
    ld   [$7C00], sp                              ; $6A94: $08 $00 $7C
    ld   b, b                                     ; $6A97: $40
    ld   [$7C08], sp                              ; $6A98: $08 $08 $7C
    ld   h, b                                     ; $6A9B: $60
    inc  d                                        ; $6A9C: $14
    nop                                           ; $6A9D: $00
    ld   [hl], b                                  ; $6A9E: $70
    ld   b, b                                     ; $6A9F: $40
    inc  d                                        ; $6AA0: $14
    ld   [$6070], sp                              ; $6AA1: $08 $70 $60

jr_015_6AA4:
    nop                                           ; $6AA4: $00
    nop                                           ; $6AA5: $00
    ld   a, [hl]                                  ; $6AA6: $7E
    ld   b, b                                     ; $6AA7: $40
    nop                                           ; $6AA8: $00
    ld   [$207E], sp                              ; $6AA9: $08 $7E $20
    di                                            ; $6AAC: $F3
    dec  c                                        ; $6AAD: $0D
    ld   a, b                                     ; $6AAE: $78
    jr   nz, jr_015_6AA4                          ; $6AAF: $20 $F3

    dec  d                                        ; $6AB1: $15
    db   $76                                      ; $6AB2: $76
    jr   nz, jr_015_6AC2                          ; $6AB3: $20 $0D

    di                                            ; $6AB5: $F3
    db   $76                                      ; $6AB6: $76
    ld   b, b                                     ; $6AB7: $40
    dec  c                                        ; $6AB8: $0D
    ei                                            ; $6AB9: $FB
    ld   a, b                                     ; $6ABA: $78
    ld   b, b                                     ; $6ABB: $40
    rst  $38                                      ; $6ABC: $FF
    rst  $38                                      ; $6ABD: $FF
    rst  $38                                      ; $6ABE: $FF
    rst  $38                                      ; $6ABF: $FF
    rst  $38                                      ; $6AC0: $FF
    rst  $38                                      ; $6AC1: $FF

jr_015_6AC2:
    rst  $38                                      ; $6AC2: $FF
    rst  $38                                      ; $6AC3: $FF
    nop                                           ; $6AC4: $00
    db   $EC                                      ; $6AC5: $EC
    ld   [hl], d                                  ; $6AC6: $72
    nop                                           ; $6AC7: $00
    nop                                           ; $6AC8: $00
    db   $F4                                      ; $6AC9: $F4
    ld   [hl], h                                  ; $6ACA: $74
    nop                                           ; $6ACB: $00
    nop                                           ; $6ACC: $00
    db   $FC                                      ; $6ACD: $FC
    ld   a, d                                     ; $6ACE: $7A
    nop                                           ; $6ACF: $00
    nop                                           ; $6AD0: $00
    inc  c                                        ; $6AD1: $0C
    ld   a, d                                     ; $6AD2: $7A
    nop                                           ; $6AD3: $00
    nop                                           ; $6AD4: $00
    inc  d                                        ; $6AD5: $14
    ld   [hl], h                                  ; $6AD6: $74
    jr   nz, jr_015_6AD9                          ; $6AD7: $20 $00

jr_015_6AD9:
    inc  e                                        ; $6AD9: $1C
    ld   [hl], d                                  ; $6ADA: $72
    jr   nz, jr_015_6ADD                          ; $6ADB: $20 $00

jr_015_6ADD:
    nop                                           ; $6ADD: $00
    rst  $38                                      ; $6ADE: $FF
    rst  $38                                      ; $6ADF: $FF
    nop                                           ; $6AE0: $00
    nop                                           ; $6AE1: $00
    rst  $38                                      ; $6AE2: $FF
    rst  $38                                      ; $6AE3: $FF
    nop                                           ; $6AE4: $00
    nop                                           ; $6AE5: $00
    ld   a, [hl]                                  ; $6AE6: $7E
    nop                                           ; $6AE7: $00
    nop                                           ; $6AE8: $00
    ld   [$607E], sp                              ; $6AE9: $08 $7E $60
    di                                            ; $6AEC: $F3
    di                                            ; $6AED: $F3
    halt                                          ; $6AEE: $76 $00
    di                                            ; $6AF0: $F3
    ei                                            ; $6AF1: $FB
    ld   a, b                                     ; $6AF2: $78
    nop                                           ; $6AF3: $00
    dec  c                                        ; $6AF4: $0D
    dec  c                                        ; $6AF5: $0D
    ld   a, b                                     ; $6AF6: $78
    ld   h, b                                     ; $6AF7: $60
    dec  c                                        ; $6AF8: $0D
    dec  d                                        ; $6AF9: $15

jr_015_6AFA:
    db   $76                                      ; $6AFA: $76
    ld   h, b                                     ; $6AFB: $60
    rst  $38                                      ; $6AFC: $FF
    rst  $38                                      ; $6AFD: $FF
    rst  $38                                      ; $6AFE: $FF
    rst  $38                                      ; $6AFF: $FF
    rst  $38                                      ; $6B00: $FF
    rst  $38                                      ; $6B01: $FF
    rst  $38                                      ; $6B02: $FF
    rst  $38                                      ; $6B03: $FF
    pop  af                                       ; $6B04: $F1
    rrca                                          ; $6B05: $0F
    ld   a, b                                     ; $6B06: $78
    jr   nz, jr_015_6AFA                          ; $6B07: $20 $F1

    rla                                           ; $6B09: $17
    db   $76                                      ; $6B0A: $76
    jr   nz, @+$0F                                ; $6B0B: $20 $0D

    di                                            ; $6B0D: $F3
    db   $76                                      ; $6B0E: $76
    ld   b, b                                     ; $6B0F: $40
    dec  c                                        ; $6B10: $0D
    ei                                            ; $6B11: $FB
    ld   a, b                                     ; $6B12: $78
    ld   b, b                                     ; $6B13: $40
    nop                                           ; $6B14: $00
    nop                                           ; $6B15: $00
    rst  $38                                      ; $6B16: $FF
    rst  $38                                      ; $6B17: $FF
    nop                                           ; $6B18: $00
    ld   [$FFFF], sp                              ; $6B19: $08 $FF $FF
    rst  $38                                      ; $6B1C: $FF
    rst  $38                                      ; $6B1D: $FF
    rst  $38                                      ; $6B1E: $FF
    rst  $38                                      ; $6B1F: $FF
    rst  $38                                      ; $6B20: $FF
    rst  $38                                      ; $6B21: $FF
    rst  $38                                      ; $6B22: $FF
    rst  $38                                      ; $6B23: $FF
    pop  af                                       ; $6B24: $F1
    pop  af                                       ; $6B25: $F1
    halt                                          ; $6B26: $76 $00
    pop  af                                       ; $6B28: $F1
    ld   sp, hl                                   ; $6B29: $F9
    ld   a, b                                     ; $6B2A: $78
    nop                                           ; $6B2B: $00
    dec  c                                        ; $6B2C: $0D
    dec  c                                        ; $6B2D: $0D
    ld   a, b                                     ; $6B2E: $78
    ld   h, b                                     ; $6B2F: $60
    dec  c                                        ; $6B30: $0D
    dec  d                                        ; $6B31: $15
    db   $76                                      ; $6B32: $76
    ld   h, b                                     ; $6B33: $60
    nop                                           ; $6B34: $00
    nop                                           ; $6B35: $00
    rst  $38                                      ; $6B36: $FF
    rst  $38                                      ; $6B37: $FF
    nop                                           ; $6B38: $00
    ld   [$FFFF], sp                              ; $6B39: $08 $FF $FF
    rst  $38                                      ; $6B3C: $FF
    rst  $38                                      ; $6B3D: $FF
    rst  $38                                      ; $6B3E: $FF
    rst  $38                                      ; $6B3F: $FF
    rst  $38                                      ; $6B40: $FF

jr_015_6B41:
    rst  $38                                      ; $6B41: $FF
    rst  $38                                      ; $6B42: $FF
    rst  $38                                      ; $6B43: $FF
    ld   hl, sp+$08                               ; $6B44: $F8 $08
    ld   a, b                                     ; $6B46: $78
    jr   nz, jr_015_6B41                          ; $6B47: $20 $F8

    db   $10                                      ; $6B49: $10
    db   $76                                      ; $6B4A: $76
    jr   nz, jr_015_6B55                          ; $6B4B: $20 $08

    ld   hl, sp+$76                               ; $6B4D: $F8 $76
    ld   b, b                                     ; $6B4F: $40
    ld   [$7800], sp                              ; $6B50: $08 $00 $78
    ld   b, b                                     ; $6B53: $40
    nop                                           ; $6B54: $00

jr_015_6B55:
    nop                                           ; $6B55: $00
    rst  $38                                      ; $6B56: $FF
    ld   b, b                                     ; $6B57: $40
    nop                                           ; $6B58: $00
    ld   [$20FF], sp                              ; $6B59: $08 $FF $20
    rst  $38                                      ; $6B5C: $FF
    rst  $38                                      ; $6B5D: $FF
    rst  $38                                      ; $6B5E: $FF
    rst  $38                                      ; $6B5F: $FF
    rst  $38                                      ; $6B60: $FF
    rst  $38                                      ; $6B61: $FF
    rst  $38                                      ; $6B62: $FF
    rst  $38                                      ; $6B63: $FF
    db   $FC                                      ; $6B64: $FC

jr_015_6B65:
    inc  b                                        ; $6B65: $04
    ld   a, b                                     ; $6B66: $78
    jr   nz, jr_015_6B65                          ; $6B67: $20 $FC

    inc  c                                        ; $6B69: $0C
    db   $76                                      ; $6B6A: $76
    jr   nz, jr_015_6B71                          ; $6B6B: $20 $04

    db   $FC                                      ; $6B6D: $FC
    db   $76                                      ; $6B6E: $76
    ld   b, b                                     ; $6B6F: $40
    inc  b                                        ; $6B70: $04

jr_015_6B71:
    inc  b                                        ; $6B71: $04
    ld   a, b                                     ; $6B72: $78
    ld   b, b                                     ; $6B73: $40
    nop                                           ; $6B74: $00
    nop                                           ; $6B75: $00
    rst  $38                                      ; $6B76: $FF
    ld   b, b                                     ; $6B77: $40
    nop                                           ; $6B78: $00
    ld   [$20FF], sp                              ; $6B79: $08 $FF $20
    rst  $38                                      ; $6B7C: $FF
    rst  $38                                      ; $6B7D: $FF
    rst  $38                                      ; $6B7E: $FF
    rst  $38                                      ; $6B7F: $FF
    rst  $38                                      ; $6B80: $FF
    rst  $38                                      ; $6B81: $FF
    rst  $38                                      ; $6B82: $FF
    rst  $38                                      ; $6B83: $FF
    ld   hl, sp-$08                               ; $6B84: $F8 $F8
    halt                                          ; $6B86: $76 $00
    ld   hl, sp+$00                               ; $6B88: $F8 $00
    ld   a, b                                     ; $6B8A: $78
    nop                                           ; $6B8B: $00
    ld   [$7808], sp                              ; $6B8C: $08 $08 $78
    ld   h, b                                     ; $6B8F: $60
    ld   [$7610], sp                              ; $6B90: $08 $10 $76
    ld   h, b                                     ; $6B93: $60
    nop                                           ; $6B94: $00
    nop                                           ; $6B95: $00
    rst  $38                                      ; $6B96: $FF
    nop                                           ; $6B97: $00
    nop                                           ; $6B98: $00
    ld   [$60FF], sp                              ; $6B99: $08 $FF $60
    rst  $38                                      ; $6B9C: $FF
    rst  $38                                      ; $6B9D: $FF
    rst  $38                                      ; $6B9E: $FF
    rst  $38                                      ; $6B9F: $FF
    rst  $38                                      ; $6BA0: $FF
    rst  $38                                      ; $6BA1: $FF
    rst  $38                                      ; $6BA2: $FF
    rst  $38                                      ; $6BA3: $FF
    db   $FC                                      ; $6BA4: $FC
    db   $FC                                      ; $6BA5: $FC
    halt                                          ; $6BA6: $76 $00
    db   $FC                                      ; $6BA8: $FC
    inc  b                                        ; $6BA9: $04
    ld   a, b                                     ; $6BAA: $78
    nop                                           ; $6BAB: $00
    inc  b                                        ; $6BAC: $04
    inc  b                                        ; $6BAD: $04
    ld   a, b                                     ; $6BAE: $78
    ld   h, b                                     ; $6BAF: $60
    inc  b                                        ; $6BB0: $04
    inc  c                                        ; $6BB1: $0C
    db   $76                                      ; $6BB2: $76
    ld   h, b                                     ; $6BB3: $60
    nop                                           ; $6BB4: $00
    nop                                           ; $6BB5: $00
    rst  $38                                      ; $6BB6: $FF
    nop                                           ; $6BB7: $00
    nop                                           ; $6BB8: $00
    ld   [$60FF], sp                              ; $6BB9: $08 $FF $60
    rst  $38                                      ; $6BBC: $FF
    rst  $38                                      ; $6BBD: $FF
    rst  $38                                      ; $6BBE: $FF
    rst  $38                                      ; $6BBF: $FF
    rst  $38                                      ; $6BC0: $FF
    rst  $38                                      ; $6BC1: $FF
    rst  $38                                      ; $6BC2: $FF
    rst  $38                                      ; $6BC3: $FF
    nop                                           ; $6BC4: $00
    ld   hl, sp+$72                               ; $6BC5: $F8 $72
    nop                                           ; $6BC7: $00
    nop                                           ; $6BC8: $00
    nop                                           ; $6BC9: $00
    ld   [hl], h                                  ; $6BCA: $74
    nop                                           ; $6BCB: $00
    nop                                           ; $6BCC: $00
    ld   [$2074], sp                              ; $6BCD: $08 $74 $20
    nop                                           ; $6BD0: $00
    db   $10                                      ; $6BD1: $10
    ld   [hl], d                                  ; $6BD2: $72
    jr   nz, jr_015_6BD5                          ; $6BD3: $20 $00

jr_015_6BD5:
    ld   [$FFFF], sp                              ; $6BD5: $08 $FF $FF
    nop                                           ; $6BD8: $00
    db   $10                                      ; $6BD9: $10
    rst  $38                                      ; $6BDA: $FF
    rst  $38                                      ; $6BDB: $FF
    nop                                           ; $6BDC: $00
    nop                                           ; $6BDD: $00
    rst  $38                                      ; $6BDE: $FF
    rst  $38                                      ; $6BDF: $FF
    nop                                           ; $6BE0: $00
    nop                                           ; $6BE1: $00
    rst  $38                                      ; $6BE2: $FF
    rst  $38                                      ; $6BE3: $FF
    nop                                           ; $6BE4: $00
    ei                                            ; $6BE5: $FB
    ld   [hl], d                                  ; $6BE6: $72
    nop                                           ; $6BE7: $00
    nop                                           ; $6BE8: $00
    inc  bc                                       ; $6BE9: $03
    ld   [hl], h                                  ; $6BEA: $74
    nop                                           ; $6BEB: $00
    nop                                           ; $6BEC: $00
    dec  b                                        ; $6BED: $05
    ld   [hl], h                                  ; $6BEE: $74
    jr   nz, jr_015_6BF1                          ; $6BEF: $20 $00

jr_015_6BF1:
    dec  c                                        ; $6BF1: $0D
    ld   [hl], d                                  ; $6BF2: $72
    jr   nz, jr_015_6BF5                          ; $6BF3: $20 $00

jr_015_6BF5:
    db   $FC                                      ; $6BF5: $FC
    rst  $38                                      ; $6BF6: $FF
    rst  $38                                      ; $6BF7: $FF
    nop                                           ; $6BF8: $00
    inc  c                                        ; $6BF9: $0C
    rst  $38                                      ; $6BFA: $FF
    rst  $38                                      ; $6BFB: $FF
    nop                                           ; $6BFC: $00
    nop                                           ; $6BFD: $00
    rst  $38                                      ; $6BFE: $FF
    rst  $38                                      ; $6BFF: $FF
    nop                                           ; $6C00: $00
    nop                                           ; $6C01: $00
    rst  $38                                      ; $6C02: $FF
    rst  $38                                      ; $6C03: $FF
    ld   [$0606], sp                              ; $6C04: $08 $06 $06
    ld   b, $04                                   ; $6C07: $06 $04
    inc  b                                        ; $6C09: $04
    inc  b                                        ; $6C0A: $04
    inc  b                                        ; $6C0B: $04
    inc  b                                        ; $6C0C: $04
    inc  b                                        ; $6C0D: $04
    inc  b                                        ; $6C0E: $04
    inc  b                                        ; $6C0F: $04

func_015_6C10:
label_015_6C10:
    ld   a, [$D224]                               ; $6C10: $FA $24 $D2
    and  a                                        ; $6C13: $A7
    ret  z                                        ; $6C14: $C8

    ld   a, [$D225]                               ; $6C15: $FA $25 $D2
    ld   hl, wActiveEntityPosX                    ; $6C18: $21 $EE $FF
    add  [hl]                                     ; $6C1B: $86
    ld   [hl], a                                  ; $6C1C: $77
    ld   a, [$D226]                               ; $6C1D: $FA $26 $D2
    ld   hl, wActiveEntityPosY                    ; $6C20: $21 $EC $FF
    add  [hl]                                     ; $6C23: $86
    ld   [hl], a                                  ; $6C24: $77
    ld   a, [$D224]                               ; $6C25: $FA $24 $D2
    dec  a                                        ; $6C28: $3D
    ld   e, a                                     ; $6C29: $5F
    ld   d, b                                     ; $6C2A: $50
    ld   hl, $6C04                                ; $6C2B: $21 $04 $6C
    add  hl, de                                   ; $6C2E: $19
    ld   c, [hl]                                  ; $6C2F: $4E
    ld   d, b                                     ; $6C30: $50
    sla  e                                        ; $6C31: $CB $23
    rl   d                                        ; $6C33: $CB $12
    sla  e                                        ; $6C35: $CB $23
    rl   d                                        ; $6C37: $CB $12
    sla  e                                        ; $6C39: $CB $23
    rl   d                                        ; $6C3B: $CB $12
    sla  e                                        ; $6C3D: $CB $23
    rl   d                                        ; $6C3F: $CB $12
    sla  e                                        ; $6C41: $CB $23
    rl   d                                        ; $6C43: $CB $12
    ld   a, e                                     ; $6C45: $7B
    and  $E0                                      ; $6C46: $E6 $E0
    ld   e, a                                     ; $6C48: $5F
    ld   hl, $6A84                                ; $6C49: $21 $84 $6A
    add  hl, de                                   ; $6C4C: $19
    push bc                                       ; $6C4D: $C5
    call label_3CE6                               ; $6C4E: $CD $E6 $3C
    pop  de                                       ; $6C51: $D1
    ld   a, e                                     ; $6C52: $7B
    call label_3DA0                               ; $6C53: $CD $A0 $3D
    jp   label_3D8A                               ; $6C56: $C3 $8A $3D

    inc  bc                                       ; $6C59: $03
    ld   [bc], a                                  ; $6C5A: $02
    ld   bc, $0000                                ; $6C5B: $01 $00 $00
    ld   bc, $0302                                ; $6C5E: $01 $02 $03

label_015_6C61:
    ld   a, [$D201]                               ; $6C61: $FA $01 $D2
    ld   e, a                                     ; $6C64: $5F
    ld   d, b                                     ; $6C65: $50
    ld   hl, wEntitiesStateTable                  ; $6C66: $21 $90 $C2
    add  hl, de                                   ; $6C69: $19
    ld   a, [hl]                                  ; $6C6A: $7E
    cp   $09                                      ; $6C6B: $FE $09
    jp   nc, ClearEntityStatusAndReturn                       ; $6C6D: $D2 $31 $7C

    ld   hl, wEntitiesUnknowTableY                ; $6C70: $21 $D0 $C3
    add  hl, bc                                   ; $6C73: $09
    ld   a, [hl]                                  ; $6C74: $7E
    rra                                           ; $6C75: $1F
    rra                                           ; $6C76: $1F
    rra                                           ; $6C77: $1F
    and  $03                                      ; $6C78: $E6 $03
    ld   e, a                                     ; $6C7A: $5F
    ld   d, b                                     ; $6C7B: $50
    ld   hl, wEntitiesUnknowTableQ                ; $6C7C: $21 $80 $C3
    add  hl, bc                                   ; $6C7F: $09
    ld   a, [hl]                                  ; $6C80: $7E
    and  a                                        ; $6C81: $A7
    ld   hl, $6C59                                ; $6C82: $21 $59 $6C
    jr   z, jr_015_6C8A                           ; $6C85: $28 $03

    ld   hl, $6C5D                                ; $6C87: $21 $5D $6C

jr_015_6C8A:
    add  hl, de                                   ; $6C8A: $19
    ld   a, [hl]                                  ; $6C8B: $7E
    inc  a                                        ; $6C8C: $3C
    ld   [$D224], a                               ; $6C8D: $EA $24 $D2
    xor  a                                        ; $6C90: $AF
    ld   [$D225], a                               ; $6C91: $EA $25 $D2
    ld   [$D226], a                               ; $6C94: $EA $26 $D2
    call func_015_6C10                            ; $6C97: $CD $10 $6C
    xor  a                                        ; $6C9A: $AF
    ld   [$D224], a                               ; $6C9B: $EA $24 $D2
    call func_015_7B0D                            ; $6C9E: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $6CA1: $F0 $E7
    and  $0F                                      ; $6CA3: $E6 $0F
    jr   nz, jr_015_6CAB                          ; $6CA5: $20 $04

    ld   a, $3A                                   ; $6CA7: $3E $3A
    ldh  [hNoiseSfx], a                           ; $6CA9: $E0 $F4

jr_015_6CAB:
    ld   hl, wEntitiesUnknowTableY                ; $6CAB: $21 $D0 $C3
    add  hl, bc                                   ; $6CAE: $09
    inc  [hl]                                     ; $6CAF: $34
    call func_015_7B88                            ; $6CB0: $CD $88 $7B
    call label_3B44                               ; $6CB3: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $6CB6: $CD $05 $0C
    jr   z, jr_015_6CBC                           ; $6CB9: $28 $01

    ret                                           ; $6CBB: $C9

jr_015_6CBC:
    ldh  a, [hLinkPositionX]                      ; $6CBC: $F0 $98
    push af                                       ; $6CBE: $F5
    ldh  a, [hLinkPositionY]                      ; $6CBF: $F0 $99
    push af                                       ; $6CC1: $F5
    ld   a, [$D201]                               ; $6CC2: $FA $01 $D2
    ld   e, a                                     ; $6CC5: $5F
    ld   d, b                                     ; $6CC6: $50
    ld   hl, wEntitiesPosXTable                         ; $6CC7: $21 $00 $C2
    add  hl, de                                   ; $6CCA: $19
    ld   a, [hl]                                  ; $6CCB: $7E
    ldh  [hLinkPositionX], a                      ; $6CCC: $E0 $98
    ld   hl, wEntitiesPosYTable                         ; $6CCE: $21 $10 $C2
    add  hl, de                                   ; $6CD1: $19
    ld   a, [hl]                                  ; $6CD2: $7E
    sub  $0C                                      ; $6CD3: $D6 $0C
    ldh  [hLinkPositionY], a                      ; $6CD5: $E0 $99
    ld   a, $10                                   ; $6CD7: $3E $10
    call GetVectorTowardsLink_trampoline          ; $6CD9: $CD $B5 $3B
    ld   hl, wEntitiesSpeedYTable                       ; $6CDC: $21 $50 $C2
    add  hl, bc                                   ; $6CDF: $09
    ldh  a, [hScratch0]                           ; $6CE0: $F0 $D7
    sub  [hl]                                     ; $6CE2: $96
    and  $80                                      ; $6CE3: $E6 $80
    jr   nz, jr_015_6CE9                          ; $6CE5: $20 $02

    inc  [hl]                                     ; $6CE7: $34
    inc  [hl]                                     ; $6CE8: $34

jr_015_6CE9:
    dec  [hl]                                     ; $6CE9: $35
    ld   hl, wEntitiesSpeedXTable                       ; $6CEA: $21 $40 $C2
    add  hl, bc                                   ; $6CED: $09
    ldh  a, [hScratch1]                           ; $6CEE: $F0 $D8
    sub  [hl]                                     ; $6CF0: $96
    and  $80                                      ; $6CF1: $E6 $80
    jr   nz, jr_015_6CF7                          ; $6CF3: $20 $02

    inc  [hl]                                     ; $6CF5: $34
    inc  [hl]                                     ; $6CF6: $34

jr_015_6CF7:
    dec  [hl]                                     ; $6CF7: $35
    ld   hl, hLinkPositionY                       ; $6CF8: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $6CFB: $F0 $EC
    sub  [hl]                                     ; $6CFD: $96
    add  $03                                      ; $6CFE: $C6 $03
    cp   $06                                      ; $6D00: $FE $06
    jr   nc, jr_015_6D29                          ; $6D02: $30 $25

    ld   hl, hLinkPositionX                       ; $6D04: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $6D07: $F0 $EE
    sub  [hl]                                     ; $6D09: $96
    add  $03                                      ; $6D0A: $C6 $03
    cp   $06                                      ; $6D0C: $FE $06
    jr   nc, jr_015_6D29                          ; $6D0E: $30 $19

    ld   a, [$D201]                               ; $6D10: $FA $01 $D2
    ld   e, a                                     ; $6D13: $5F
    ld   d, b                                     ; $6D14: $50
    ld   hl, wEntitiesStateTable                  ; $6D15: $21 $90 $C2
    add  hl, de                                   ; $6D18: $19
    ld   a, [hl]                                  ; $6D19: $7E
    cp   $08                                      ; $6D1A: $FE $08
    jr   nz, jr_015_6D29                          ; $6D1C: $20 $0B

    ld   [hl], $03                                ; $6D1E: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6D20: $21 $E0 $C2
    add  hl, de                                   ; $6D23: $19
    ld   [hl], $4C                                ; $6D24: $36 $4C
    call ClearEntityStatus                        ; $6D26: $CD $31 $7C

jr_015_6D29:
    pop  af                                       ; $6D29: $F1
    ldh  [hLinkPositionY], a                      ; $6D2A: $E0 $99
    pop  af                                       ; $6D2C: $F1
    ldh  [hLinkPositionX], a                      ; $6D2D: $E0 $98
    ret                                           ; $6D2F: $C9

    ld   c, d                                     ; $6D30: $4A
    nop                                           ; $6D31: $00
    ld   c, d                                     ; $6D32: $4A
    jr   nz, jr_015_6D81                          ; $6D33: $20 $4C

    nop                                           ; $6D35: $00
    ld   c, h                                     ; $6D36: $4C
    jr   nz, @+$50                                ; $6D37: $20 $4E

    nop                                           ; $6D39: $00
    ld   c, [hl]                                  ; $6D3A: $4E
    jr   nz, jr_015_6D3D                          ; $6D3B: $20 $00

jr_015_6D3D:
    nop                                           ; $6D3D: $00
    ld   bc, $1101                                ; $6D3E: $01 $01 $11
    jr   nc, @+$6F                                ; $6D41: $30 $6D

    call RenderAnimatedActiveEntity                               ; $6D43: $CD $C0 $3B
    call func_015_7B0D                            ; $6D46: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $6D49: $CD $05 $0C
    jp   z, ClearEntityStatusAndReturn            ; $6D4C: $CA $31 $7C

    rra                                           ; $6D4F: $1F
    rra                                           ; $6D50: $1F
    rra                                           ; $6D51: $1F
    and  $03                                      ; $6D52: $E6 $03
    ld   e, a                                     ; $6D54: $5F
    ld   d, b                                     ; $6D55: $50
    ld   hl, $6D3C                                ; $6D56: $21 $3C $6D
    add  hl, de                                   ; $6D59: $19
    ld   a, [hl]                                  ; $6D5A: $7E
    jp   SetEntitySpriteVariant                   ; $6D5B: $C3 $0C $3B

    ld   e, $00                                   ; $6D5E: $1E $00
    ld   e, $60                                   ; $6D60: $1E $60
    inc  [hl]                                     ; $6D62: $34
    nop                                           ; $6D63: $00
    inc  [hl]                                     ; $6D64: $34
    jr   nz, jr_015_6DBB                          ; $6D65: $20 $54

    nop                                           ; $6D67: $00
    ld   d, h                                     ; $6D68: $54
    jr   nz, jr_015_6DC1                          ; $6D69: $20 $56

    nop                                           ; $6D6B: $00
    ld   d, [hl]                                  ; $6D6C: $56
    jr   nz, @-$0E                                ; $6D6D: $20 $F0

    rst  $20                                      ; $6D6F: $E7
    rla                                           ; $6D70: $17
    rla                                           ; $6D71: $17
    and  $10                                      ; $6D72: $E6 $10
    ldh  [$FFED], a                               ; $6D74: $E0 $ED
    ld   de, $6D5E                                ; $6D76: $11 $5E $6D
    call RenderAnimatedActiveEntity                               ; $6D79: $CD $C0 $3B
    call func_015_7B0D                            ; $6D7C: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6D7F: $F0 $F0

jr_015_6D81:
    rst  $00                                      ; $6D81: $C7
    add  [hl]                                     ; $6D82: $86
    ld   l, l                                     ; $6D83: $6D
    sbc  h                                        ; $6D84: $9C
    ld   l, l                                     ; $6D85: $6D
    call GetEntityTransitionCountdown             ; $6D86: $CD $05 $0C
    jr   nz, jr_015_6D90                          ; $6D89: $20 $05

    ld   [hl], $20                                ; $6D8B: $36 $20
    jp   IncrementEntityWalkingAttr               ; $6D8D: $C3 $12 $3B

jr_015_6D90:
    ld   e, $00                                   ; $6D90: $1E $00
    cp   $18                                      ; $6D92: $FE $18
    jr   nc, jr_015_6D98                          ; $6D94: $30 $02

    ld   e, $01                                   ; $6D96: $1E $01

jr_015_6D98:
    ld   a, e                                     ; $6D98: $7B
    jp   SetEntitySpriteVariant                   ; $6D99: $C3 $0C $3B

    ldh  a, [hFrameCounter]                       ; $6D9C: $F0 $E7
    rra                                           ; $6D9E: $1F
    rra                                           ; $6D9F: $1F
    rra                                           ; $6DA0: $1F
    and  $01                                      ; $6DA1: $E6 $01
    add  $02                                      ; $6DA3: $C6 $02
    call SetEntitySpriteVariant                   ; $6DA5: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DA8: $CD $05 $0C
    cp   $01                                      ; $6DAB: $FE $01
    jr   nz, jr_015_6DB8                          ; $6DAD: $20 $09

    ld   a, $28                                   ; $6DAF: $3E $28
    ldh  [hNoiseSfx], a                           ; $6DB1: $E0 $F4
    ld   a, $30                                   ; $6DB3: $3E $30
    call label_3BAA                               ; $6DB5: $CD $AA $3B

jr_015_6DB8:
    ldh  a, [hFrameCounter]                       ; $6DB8: $F0 $E7
    xor  c                                        ; $6DBA: $A9

jr_015_6DBB:
    rra                                           ; $6DBB: $1F
    jr   nc, jr_015_6DC4                          ; $6DBC: $30 $06

    call func_015_7B88                            ; $6DBE: $CD $88 $7B

jr_015_6DC1:
    call label_3B44                               ; $6DC1: $CD $44 $3B

jr_015_6DC4:
    ldh  a, [wActiveEntityPosX]                   ; $6DC4: $F0 $EE
    cp   $A8                                      ; $6DC6: $FE $A8
    jp   nc, ClearEntityStatusAndReturn                       ; $6DC8: $D2 $31 $7C

    ldh  a, [wActiveEntityPosY]                   ; $6DCB: $F0 $EC
    cp   $88                                      ; $6DCD: $FE $88
    jp   nc, ClearEntityStatusAndReturn                       ; $6DCF: $D2 $31 $7C

    ret                                           ; $6DD2: $C9

    ld   bc, $0302                                ; $6DD3: $01 $02 $03
    inc  bc                                       ; $6DD6: $03
    inc  bc                                       ; $6DD7: $03
    inc  bc                                       ; $6DD8: $03
    ld   [bc], a                                  ; $6DD9: $02
    ld   bc, $2320                                ; $6DDA: $01 $20 $23
    ld   h, $29                                   ; $6DDD: $26 $29
    inc  l                                        ; $6DDF: $2C
    cpl                                           ; $6DE0: $2F
    ld   [hl-], a                                 ; $6DE1: $32
    dec  [hl]                                     ; $6DE2: $35
    jr   c, jr_015_6E1D                           ; $6DE3: $38 $38

    jr   c, jr_015_6E1F                           ; $6DE5: $38 $38

    jr   c, jr_015_6E21                           ; $6DE7: $38 $38

    jr   c, jr_015_6E23                           ; $6DE9: $38 $38

    jr   c, jr_015_6E25                           ; $6DEB: $38 $38

    jr   c, @+$3A                                 ; $6DED: $38 $38

    jr   c, jr_015_6E29                           ; $6DEF: $38 $38

    db   $38, $38                                 ; $6DF1: $38 $38

    jr   nz, jr_015_6E18                          ; $6DF3: $20 $23

    ld   h, $29                                   ; $6DF5: $26 $29
    inc  l                                        ; $6DF7: $2C
    cpl                                           ; $6DF8: $2F
    ld   [hl-], a                                 ; $6DF9: $32
    inc  [hl]                                     ; $6DFA: $34
    inc  [hl]                                     ; $6DFB: $34
    inc  [hl]                                     ; $6DFC: $34
    inc  [hl]                                     ; $6DFD: $34
    inc  [hl]                                     ; $6DFE: $34
    inc  [hl]                                     ; $6DFF: $34
    inc  [hl]                                     ; $6E00: $34
    inc  [hl]                                     ; $6E01: $34
    inc  [hl]                                     ; $6E02: $34
    inc  [hl]                                     ; $6E03: $34
    inc  [hl]                                     ; $6E04: $34
    inc  [hl]                                     ; $6E05: $34
    inc  [hl]                                     ; $6E06: $34
    inc  [hl]                                     ; $6E07: $34
    inc  [hl]                                     ; $6E08: $34
    inc  [hl]                                     ; $6E09: $34
    inc  [hl]                                     ; $6E0A: $34
    jr   z, @+$29                                 ; $6E0B: $28 $27

    ld   h, $25                                   ; $6E0D: $26 $25
    inc  h                                        ; $6E0F: $24
    inc  hl                                       ; $6E10: $23
    ld   [hl+], a                                 ; $6E11: $22
    ld   hl, $1F20                                ; $6E12: $21 $20 $1F
    ld   e, $1D                                   ; $6E15: $1E $1D
    inc  e                                        ; $6E17: $1C

jr_015_6E18:
    dec  de                                       ; $6E18: $1B
    ld   a, [de]                                  ; $6E19: $1A
    add  hl, de                                   ; $6E1A: $19
    jr   jr_015_6E35                              ; $6E1B: $18 $18

jr_015_6E1D:
    jr   jr_015_6E37                              ; $6E1D: $18 $18

jr_015_6E1F:
    jr   @+$1A                                    ; $6E1F: $18 $18

jr_015_6E21:
    jr   jr_015_6E3B                              ; $6E21: $18 $18

jr_015_6E23:
    inc  bc                                       ; $6E23: $03
    ld   [bc], a                                  ; $6E24: $02

jr_015_6E25:
    ld   bc, $0000                                ; $6E25: $01 $00 $00
    nop                                           ; $6E28: $00

jr_015_6E29:
    nop                                           ; $6E29: $00
    nop                                           ; $6E2A: $00

FinalNightmareForm6Handler::
    ld   hl, wEntitiesUnknowTableG                ; $6E2B: $21 $00 $C3
    add  hl, bc                                   ; $6E2E: $09
    ld   a, [hl]                                  ; $6E2F: $7E
    and  a                                        ; $6E30: $A7
    jr   z, jr_015_6E4E                           ; $6E31: $28 $1B

    cp   $10                                      ; $6E33: $FE $10

jr_015_6E35:
    jr   nz, jr_015_6E3D                          ; $6E35: $20 $06

jr_015_6E37:
    dec  [hl]                                     ; $6E37: $35
    call func_015_52B1                            ; $6E38: $CD $B1 $52

jr_015_6E3B:
    ld   a, $10                                   ; $6E3B: $3E $10

jr_015_6E3D:
    rra                                           ; $6E3D: $1F
    rra                                           ; $6E3E: $1F
    rra                                           ; $6E3F: $1F
    and  $07                                      ; $6E40: $E6 $07
    ld   e, a                                     ; $6E42: $5F
    ld   d, b                                     ; $6E43: $50
    ld   hl, $6E23                                ; $6E44: $21 $23 $6E
    add  hl, de                                   ; $6E47: $19
    ld   a, [hl]                                  ; $6E48: $7E
    ldh  [hActiveEntitySpriteVariant], a               ; $6E49: $E0 $F1
    jp   $572B                                    ; $6E4B: $C3 $2B $57

jr_015_6E4E:
    call $7056                                    ; $6E4E: $CD $56 $70
    ldh  a, [hActiveEntityState]                  ; $6E51: $F0 $F0
    and  a                                        ; $6E53: $A7
    jr   z, jr_015_6E5A                           ; $6E54: $28 $04

    xor  a                                        ; $6E56: $AF
    ld   [wDB94], a                               ; $6E57: $EA $94 $DB

jr_015_6E5A:
    call func_015_7B0D                            ; $6E5A: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6E5D: $F0 $F0
    rst  $00                                      ; $6E5F: $C7
    ld   h, [hl]                                  ; $6E60: $66
    ld   l, [hl]                                  ; $6E61: $6E
    and  c                                        ; $6E62: $A1
    ld   l, a                                     ; $6E63: $6F
    cp   h                                        ; $6E64: $BC
    ld   l, a                                     ; $6E65: $6F
    ld   hl, wEntitiesHealthTable                 ; $6E66: $21 $60 $C3
    add  hl, bc                                   ; $6E69: $09
    ld   a, [hl]                                  ; $6E6A: $7E
    cp   $F0                                      ; $6E6B: $FE $F0
    jr   nc, jr_015_6E9B                          ; $6E6D: $30 $2C

    ld   a, $03                                   ; $6E6F: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $6E71: $EA $A7 $C5
    ld   a, $F6                                   ; $6E74: $3E $F6
    call OpenDialog                               ; $6E76: $CD $85 $23
    ld   a, $5E                                   ; $6E79: $3E $5E
    ld   [wActiveMusicTrack], a                   ; $6E7B: $EA $68 $D3
    call GetEntityTransitionCountdown             ; $6E7E: $CD $05 $0C
    ld   [hl], $80                                ; $6E81: $36 $80
    ld   hl, wEntitiesUnknowTableU                ; $6E83: $21 $20 $C4
    add  hl, bc                                   ; $6E86: $09
    ld   [hl], $80                                ; $6E87: $36 $80
    ld   hl, wEntitiesUnknowTableM                ; $6E89: $21 $50 $C3
    add  hl, bc                                   ; $6E8C: $09
    res  7, [hl]                                  ; $6E8D: $CB $BE
    ld   hl, wEntitiesUnknowTableL                ; $6E8F: $21 $40 $C3
    add  hl, bc                                   ; $6E92: $09
    set  6, [hl]                                  ; $6E93: $CB $F6
    call label_27F2                               ; $6E95: $CD $F2 $27
    jp   IncrementEntityWalkingAttr               ; $6E98: $C3 $12 $3B

jr_015_6E9B:
    ldh  a, [hFrameCounter]                       ; $6E9B: $F0 $E7
    and  $0F                                      ; $6E9D: $E6 $0F
    jr   nz, jr_015_6EB5                          ; $6E9F: $20 $14

    ld   a, [$D223]                               ; $6EA1: $FA $23 $D2
    cp   $04                                      ; $6EA4: $FE $04
    jr   nc, jr_015_6EB5                          ; $6EA6: $30 $0D

    inc  a                                        ; $6EA8: $3C
    ld   [$D223], a                               ; $6EA9: $EA $23 $D2
    cp   $01                                      ; $6EAC: $FE $01
    jr   nz, jr_015_6EB5                          ; $6EAE: $20 $05

    ld   hl, wActiveMusicTrack                    ; $6EB0: $21 $68 $D3
    ld   [hl], $50                                ; $6EB3: $36 $50

jr_015_6EB5:
    call label_C56                                ; $6EB5: $CD $56 $0C
    ld   hl, wEntitiesHealthTable                 ; $6EB8: $21 $60 $C3
    add  hl, bc                                   ; $6EBB: $09
    ld   a, [hl]                                  ; $6EBC: $7E
    cpl                                           ; $6EBD: $2F
    cp   $17                                      ; $6EBE: $FE $17
    jr   c, jr_015_6EC4                           ; $6EC0: $38 $02

    ld   a, $17                                   ; $6EC2: $3E $17

jr_015_6EC4:
    ld   e, a                                     ; $6EC4: $5F
    ld   d, b                                     ; $6EC5: $50
    ld   hl, $6DDB                                ; $6EC6: $21 $DB $6D
    add  hl, de                                   ; $6EC9: $19
    ld   a, [hl]                                  ; $6ECA: $7E
    ld   hl, wEntitiesUnknownTableB               ; $6ECB: $21 $B0 $C2
    add  hl, bc                                   ; $6ECE: $09
    ld   [hl], a                                  ; $6ECF: $77
    ld   hl, $6DF3                                ; $6ED0: $21 $F3 $6D
    add  hl, de                                   ; $6ED3: $19
    ld   a, [hl]                                  ; $6ED4: $7E
    ld   hl, wEntitiesUnknownTableC               ; $6ED5: $21 $C0 $C2
    add  hl, bc                                   ; $6ED8: $09
    ld   [hl], a                                  ; $6ED9: $77
    ld   hl, $6E0B                                ; $6EDA: $21 $0B $6E
    add  hl, de                                   ; $6EDD: $19
    ld   a, [$D210]                               ; $6EDE: $FA $10 $D2
    inc  a                                        ; $6EE1: $3C
    cp   [hl]                                     ; $6EE2: $BE
    jr   c, jr_015_6EEA                           ; $6EE3: $38 $05

    ld   a, $3D                                   ; $6EE5: $3E $3D
    ldh  [hJingle], a                             ; $6EE7: $E0 $F2
    xor  a                                        ; $6EE9: $AF

jr_015_6EEA:
    ld   [$D210], a                               ; $6EEA: $EA $10 $D2
    ld   a, $00                                   ; $6EED: $3E $00
    call SetEntitySpriteVariant                   ; $6EEF: $CD $0C $3B
    call label_BFB                                ; $6EF2: $CD $FB $0B
    jr   nz, jr_015_6F0B                          ; $6EF5: $20 $14

    call GetRandomByte                            ; $6EF7: $CD $0D $28
    and  $0F                                      ; $6EFA: $E6 $0F
    add  $20                                      ; $6EFC: $C6 $20
    ld   [hl], a                                  ; $6EFE: $77
    call GetRandomByte                            ; $6EFF: $CD $0D $28
    and  $01                                      ; $6F02: $E6 $01
    jr   nz, jr_015_6F0B                          ; $6F04: $20 $05

    call IsEntityUnknownFZero                     ; $6F06: $CD $00 $0C
    ld   [hl], $7F                                ; $6F09: $36 $7F

jr_015_6F0B:
    ld   hl, wEntitiesUnknowTableM                ; $6F0B: $21 $50 $C3
    add  hl, bc                                   ; $6F0E: $09
    set  7, [hl]                                  ; $6F0F: $CB $FE
    call IsEntityUnknownFZero                     ; $6F11: $CD $00 $0C
    jr   z, jr_015_6F30                           ; $6F14: $28 $1A

    rra                                           ; $6F16: $1F
    rra                                           ; $6F17: $1F
    rra                                           ; $6F18: $1F
    rra                                           ; $6F19: $1F
    and  $07                                      ; $6F1A: $E6 $07
    ld   e, a                                     ; $6F1C: $5F
    ld   d, b                                     ; $6F1D: $50
    ld   hl, $6DD3                                ; $6F1E: $21 $D3 $6D
    add  hl, de                                   ; $6F21: $19
    ld   a, [hl]                                  ; $6F22: $7E
    call SetEntitySpriteVariant                   ; $6F23: $CD $0C $3B
    cp   $03                                      ; $6F26: $FE $03
    jr   nz, jr_015_6F30                          ; $6F28: $20 $06

    ld   hl, wEntitiesUnknowTableM                ; $6F2A: $21 $50 $C3
    add  hl, bc                                   ; $6F2D: $09
    res  7, [hl]                                  ; $6F2E: $CB $BE

jr_015_6F30:
    call label_3B39                               ; $6F30: $CD $39 $3B
    ld   e, $0F                                   ; $6F33: $1E $0F
    ld   hl, wEntitiesHealthTable                 ; $6F35: $21 $60 $C3
    add  hl, bc                                   ; $6F38: $09
    ld   a, [hl]                                  ; $6F39: $7E
    cp   $F8                                      ; $6F3A: $FE $F8
    jr   nc, jr_015_6F40                          ; $6F3C: $30 $02

    ld   e, $07                                   ; $6F3E: $1E $07

jr_015_6F40:
    ldh  a, [hFrameCounter]                       ; $6F40: $F0 $E7
    and  e                                        ; $6F42: $A3
    jr   nz, jr_015_6F70                          ; $6F43: $20 $2B

    ldh  a, [hLinkPositionY]                      ; $6F45: $F0 $99
    push af                                       ; $6F47: $F5
    sub  $20                                      ; $6F48: $D6 $20
    ldh  [hLinkPositionY], a                      ; $6F4A: $E0 $99
    ld   a, $08                                   ; $6F4C: $3E $08
    call GetVectorTowardsLink_trampoline          ; $6F4E: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $6F51: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                       ; $6F53: $21 $50 $C2
    add  hl, bc                                   ; $6F56: $09
    sub  [hl]                                     ; $6F57: $96
    and  $80                                      ; $6F58: $E6 $80
    jr   nz, jr_015_6F5E                          ; $6F5A: $20 $02

    inc  [hl]                                     ; $6F5C: $34
    inc  [hl]                                     ; $6F5D: $34

jr_015_6F5E:
    dec  [hl]                                     ; $6F5E: $35
    ldh  a, [hScratch1]                           ; $6F5F: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                       ; $6F61: $21 $40 $C2
    add  hl, bc                                   ; $6F64: $09
    sub  [hl]                                     ; $6F65: $96
    and  $80                                      ; $6F66: $E6 $80
    jr   nz, jr_015_6F6C                          ; $6F68: $20 $02

    inc  [hl]                                     ; $6F6A: $34
    inc  [hl]                                     ; $6F6B: $34

jr_015_6F6C:
    dec  [hl]                                     ; $6F6C: $35
    pop  af                                       ; $6F6D: $F1
    ldh  [hLinkPositionY], a                      ; $6F6E: $E0 $99

jr_015_6F70:
    call func_015_7B88                            ; $6F70: $CD $88 $7B
    call label_3B23                               ; $6F73: $CD $23 $3B
    ld   hl, wEntitiesUnknownTableB               ; $6F76: $21 $B0 $C2
    add  hl, bc                                   ; $6F79: $09
    ld   e, [hl]                                  ; $6F7A: $5E
    ld   hl, wEntitiesUnknowTableY                ; $6F7B: $21 $D0 $C3
    add  hl, bc                                   ; $6F7E: $09
    ld   a, [hl]                                  ; $6F7F: $7E
    add  e                                        ; $6F80: $83
    ld   [hl], a                                  ; $6F81: $77
    jr   nc, jr_015_6F8B                          ; $6F82: $30 $07

    ld   a, [$D221]                               ; $6F84: $FA $21 $D2
    inc  a                                        ; $6F87: $3C
    ld   [$D221], a                               ; $6F88: $EA $21 $D2

jr_015_6F8B:
    ld   hl, wEntitiesUnknownTableC               ; $6F8B: $21 $C0 $C2
    add  hl, bc                                   ; $6F8E: $09
    ld   e, [hl]                                  ; $6F8F: $5E
    ld   hl, wEntitiesUnknownTableD               ; $6F90: $21 $D0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    add  e                                        ; $6F95: $83
    ld   [hl], a                                  ; $6F96: $77
    jr   nc, jr_015_6FA0                          ; $6F97: $30 $07

    ld   a, [$D222]                               ; $6F99: $FA $22 $D2
    dec  a                                        ; $6F9C: $3D
    ld   [$D222], a                               ; $6F9D: $EA $22 $D2

jr_015_6FA0:
    ret                                           ; $6FA0: $C9

    call GetEntityTransitionCountdown             ; $6FA1: $CD $05 $0C
    cp   $02                                      ; $6FA4: $FE $02
    jr   nz, jr_015_6FAD                          ; $6FA6: $20 $05

    ld   hl, wActiveMusicTrack                    ; $6FA8: $21 $68 $D3
    ld   [hl], $5F                                ; $6FAB: $36 $5F

jr_015_6FAD:
    and  a                                        ; $6FAD: $A7
    ret  nz                                       ; $6FAE: $C0

    ld   [hl], $80                                ; $6FAF: $36 $80
    ld   a, $3D                                   ; $6FB1: $3E $3D
    ldh  [hNoiseSfx], a                           ; $6FB3: $E0 $F4
    ld   a, $10                                   ; $6FB5: $3E $10
    ldh  [hWaveSfx], a                            ; $6FB7: $E0 $F3
    jp   IncrementEntityWalkingAttr               ; $6FB9: $C3 $12 $3B

    call GetEntityTransitionCountdown             ; $6FBC: $CD $05 $0C
    and  $0F                                      ; $6FBF: $E6 $0F
    jr   nz, jr_015_6FF5                          ; $6FC1: $20 $32

    ld   a, [$D223]                               ; $6FC3: $FA $23 $D2
    cp   $00                                      ; $6FC6: $FE $00
    jr   nz, jr_015_6FF1                          ; $6FC8: $20 $27

    call PlayBombExplosionSfx                     ; $6FCA: $CD $4B $0C
    call func_015_5383                            ; $6FCD: $CD $83 $53
    call ClearEntityStatus                        ; $6FD0: $CD $31 $7C
    ld   a, $E6                                   ; $6FD3: $3E $E6
    call func_003_64CA_trampoline                               ; $6FD5: $CD $86 $3B
    ld   hl, wEntitiesUnknowTableR                ; $6FD8: $21 $90 $C3
    add  hl, de                                   ; $6FDB: $19
    ld   [hl], $02                                ; $6FDC: $36 $02
    ld   hl, wEntitiesPosYTable                         ; $6FDE: $21 $10 $C2
    add  hl, de                                   ; $6FE1: $19
    ld   [hl], $30                                ; $6FE2: $36 $30
    ld   hl, wEntitiesPosXTable                         ; $6FE4: $21 $00 $C2
    add  hl, de                                   ; $6FE7: $19
    ld   [hl], $50                                ; $6FE8: $36 $50
    ld   hl, wEntitiesSpriteVariantTable               ; $6FEA: $21 $B0 $C3
    add  hl, de                                   ; $6FED: $19
    ld   [hl], $FF                                ; $6FEE: $36 $FF
    ret                                           ; $6FF0: $C9

jr_015_6FF1:
    dec  a                                        ; $6FF1: $3D
    ld   [$D223], a                               ; $6FF2: $EA $23 $D2

jr_015_6FF5:
    ret                                           ; $6FF5: $C9

    ldh  a, [hFFFC]                               ; $6FF6: $F0 $FC
    ld   h, b                                     ; $6FF8: $60
    nop                                           ; $6FF9: $00
    ldh  a, [rDIV]                                ; $6FFA: $F0 $04
    ld   h, d                                     ; $6FFC: $62
    nop                                           ; $6FFD: $00
    ldh  a, [$FF0C]                               ; $6FFE: $F0 $0C
    ld   h, b                                     ; $7000: $60
    jr   nz, @-$0E                                ; $7001: $20 $F0

    db   $FC                                      ; $7003: $FC
    ld   h, h                                     ; $7004: $64
    nop                                           ; $7005: $00
    ldh  a, [rDIV]                                ; $7006: $F0 $04
    ld   h, [hl]                                  ; $7008: $66
    nop                                           ; $7009: $00
    ldh  a, [$FF0C]                               ; $700A: $F0 $0C
    ld   h, h                                     ; $700C: $64
    jr   nz, @-$0E                                ; $700D: $20 $F0

    db   $FC                                      ; $700F: $FC
    ld   l, b                                     ; $7010: $68
    nop                                           ; $7011: $00
    ldh  a, [rDIV]                                ; $7012: $F0 $04
    ld   l, d                                     ; $7014: $6A
    nop                                           ; $7015: $00
    ldh  a, [$FF0C]                               ; $7016: $F0 $0C
    ld   l, b                                     ; $7018: $68
    jr   nz, @-$0E                                ; $7019: $20 $F0

    db   $FC                                      ; $701B: $FC
    ld   h, h                                     ; $701C: $64
    nop                                           ; $701D: $00
    ldh  a, [rDIV]                                ; $701E: $F0 $04
    ld   h, [hl]                                  ; $7020: $66
    nop                                           ; $7021: $00
    ldh  a, [$FF0C]                               ; $7022: $F0 $0C
    ld   h, h                                     ; $7024: $64
    jr   nz, jr_015_7027                          ; $7025: $20 $00

jr_015_7027:
    db   $FC                                      ; $7027: $FC
    ld   l, h                                     ; $7028: $6C
    nop                                           ; $7029: $00
    nop                                           ; $702A: $00
    inc  b                                        ; $702B: $04
    ld   l, [hl]                                  ; $702C: $6E
    nop                                           ; $702D: $00
    nop                                           ; $702E: $00
    inc  c                                        ; $702F: $0C
    ld   l, h                                     ; $7030: $6C
    jr   nz, jr_015_7033                          ; $7031: $20 $00

jr_015_7033:
    db   $FC                                      ; $7033: $FC
    ld   [hl], b                                  ; $7034: $70
    nop                                           ; $7035: $00
    nop                                           ; $7036: $00
    inc  b                                        ; $7037: $04
    ld   [hl], d                                  ; $7038: $72
    nop                                           ; $7039: $00
    nop                                           ; $703A: $00
    inc  c                                        ; $703B: $0C
    ld   [hl], b                                  ; $703C: $70
    jr   nz, jr_015_703F                          ; $703D: $20 $00

jr_015_703F:
    db   $FC                                      ; $703F: $FC
    ld   [hl], h                                  ; $7040: $74
    nop                                           ; $7041: $00
    nop                                           ; $7042: $00
    inc  b                                        ; $7043: $04
    halt                                          ; $7044: $76 $00
    nop                                           ; $7046: $00

jr_015_7047:
    inc  c                                        ; $7047: $0C
    ld   [hl], h                                  ; $7048: $74
    jr   nz, jr_015_704B                          ; $7049: $20 $00

jr_015_704B:
    db   $FC                                      ; $704B: $FC
    ld   a, b                                     ; $704C: $78
    nop                                           ; $704D: $00
    nop                                           ; $704E: $00
    inc  b                                        ; $704F: $04
    ld   a, d                                     ; $7050: $7A
    nop                                           ; $7051: $00
    nop                                           ; $7052: $00
    inc  c                                        ; $7053: $0C
    ld   a, b                                     ; $7054: $78
    jr   nz, jr_015_7047                          ; $7055: $20 $F0

    rst  $20                                      ; $7057: $E7
    rra                                           ; $7058: $1F
    rra                                           ; $7059: $1F
    rra                                           ; $705A: $1F
    and  $03                                      ; $705B: $E6 $03
    rla                                           ; $705D: $17
    rla                                           ; $705E: $17
    and  $FC                                      ; $705F: $E6 $FC
    ld   e, a                                     ; $7061: $5F
    rla                                           ; $7062: $17
    and  $F8                                      ; $7063: $E6 $F8
    add  e                                        ; $7065: $83
    ld   e, a                                     ; $7066: $5F
    ld   d, b                                     ; $7067: $50
    ld   hl, $6FF6                                ; $7068: $21 $F6 $6F
    add  hl, de                                   ; $706B: $19
    ld   c, $03                                   ; $706C: $0E $03
    call label_3CE6                               ; $706E: $CD $E6 $3C
    ld   a, $03                                   ; $7071: $3E $03
    call label_3DA0                               ; $7073: $CD $A0 $3D
    ldh  a, [hActiveEntitySpriteVariant]               ; $7076: $F0 $F1
    rla                                           ; $7078: $17
    rla                                           ; $7079: $17
    and  $FC                                      ; $707A: $E6 $FC
    ld   e, a                                     ; $707C: $5F
    rla                                           ; $707D: $17
    and  $F8                                      ; $707E: $E6 $F8
    add  e                                        ; $7080: $83
    ld   e, a                                     ; $7081: $5F
    ld   d, b                                     ; $7082: $50
    ld   hl, $7026                                ; $7083: $21 $26 $70
    add  hl, de                                   ; $7086: $19
    ld   c, $03                                   ; $7087: $0E $03
    call label_3CE6                               ; $7089: $CD $E6 $3C
    ld   a, $03                                   ; $708C: $3E $03
    call label_3DA0                               ; $708E: $CD $A0 $3D
    ld   hl, wEntitiesPosYTable                         ; $7091: $21 $10 $C2
    add  hl, bc                                   ; $7094: $09
    ld   a, [hl]                                  ; $7095: $7E
    push af                                       ; $7096: $F5
    push hl                                       ; $7097: $E5
    sub  $08                                      ; $7098: $D6 $08
    ld   [hl], a                                  ; $709A: $77
    call label_3D8A                               ; $709B: $CD $8A $3D
    call func_015_717B                            ; $709E: $CD $7B $71
    pop  hl                                       ; $70A1: $E1
    pop  af                                       ; $70A2: $F1
    ld   [hl], a                                  ; $70A3: $77
    jp   label_3D8A                               ; $70A4: $C3 $8A $3D

    ret  nc                                       ; $70A7: $D0

    pop  de                                       ; $70A8: $D1
    call nc, $DFD9                                ; $70A9: $D4 $D9 $DF
    and  $EE                                      ; $70AC: $E6 $EE
    rst  $30                                      ; $70AE: $F7
    nop                                           ; $70AF: $00
    add  hl, bc                                   ; $70B0: $09
    ld   [de], a                                  ; $70B1: $12
    ld   a, [de]                                  ; $70B2: $1A
    ld   hl, $2C27                                ; $70B3: $21 $27 $2C
    cpl                                           ; $70B6: $2F
    jr   nc, jr_015_70E8                          ; $70B7: $30 $2F

    inc  l                                        ; $70B9: $2C
    daa                                           ; $70BA: $27
    ld   hl, $121A                                ; $70BB: $21 $1A $12
    add  hl, bc                                   ; $70BE: $09
    nop                                           ; $70BF: $00
    rst  $30                                      ; $70C0: $F7
    xor  $E6                                      ; $70C1: $EE $E6
    rst  $18                                      ; $70C3: $DF
    reti                                          ; $70C4: $D9

    call nc, $D0D1                                ; $70C5: $D4 $D1 $D0
    pop  de                                       ; $70C8: $D1
    call nc, $DFD9                                ; $70C9: $D4 $D9 $DF
    and  $EE                                      ; $70CC: $E6 $EE
    rst  $30                                      ; $70CE: $F7
    jp   c, $DDDB                                 ; $70CF: $DA $DB $DD

    pop  hl                                       ; $70D2: $E1
    and  $EB                                      ; $70D3: $E6 $EB
    ld   a, [c]                                   ; $70D5: $F2
    ld   sp, hl                                   ; $70D6: $F9
    nop                                           ; $70D7: $00
    rlca                                          ; $70D8: $07
    ld   c, $15                                   ; $70D9: $0E $15
    ld   a, [de]                                  ; $70DB: $1A
    rra                                           ; $70DC: $1F
    inc  hl                                       ; $70DD: $23
    dec  h                                        ; $70DE: $25
    ld   h, $25                                   ; $70DF: $26 $25
    inc  hl                                       ; $70E1: $23
    rra                                           ; $70E2: $1F
    ld   a, [de]                                  ; $70E3: $1A
    dec  d                                        ; $70E4: $15
    ld   c, $07                                   ; $70E5: $0E $07
    nop                                           ; $70E7: $00

jr_015_70E8:
    ld   sp, hl                                   ; $70E8: $F9
    ld   a, [c]                                   ; $70E9: $F2
    db   $EB                                      ; $70EA: $EB
    and  $E1                                      ; $70EB: $E6 $E1
    db   $DD                                      ; $70ED: $DD
    db   $DB                                      ; $70EE: $DB
    jp   c, $DDDB                                 ; $70EF: $DA $DB $DD

    pop  hl                                       ; $70F2: $E1
    and  $EB                                      ; $70F3: $E6 $EB
    ld   a, [c]                                   ; $70F5: $F2
    ld   sp, hl                                   ; $70F6: $F9
    db   $E4                                      ; $70F7: $E4
    push hl                                       ; $70F8: $E5
    rst  $20                                      ; $70F9: $E7
    jp   hl                                       ; $70FA: $E9

    db   $ED                                      ; $70FB: $ED
    pop  af                                       ; $70FC: $F1
    or   $FB                                      ; $70FD: $F6 $FB
    nop                                           ; $70FF: $00
    dec  b                                        ; $7100: $05
    ld   a, [bc]                                  ; $7101: $0A
    rrca                                          ; $7102: $0F
    inc  de                                       ; $7103: $13
    rla                                           ; $7104: $17
    add  hl, de                                   ; $7105: $19
    dec  de                                       ; $7106: $1B
    inc  e                                        ; $7107: $1C
    dec  de                                       ; $7108: $1B
    add  hl, de                                   ; $7109: $19
    rla                                           ; $710A: $17
    inc  de                                       ; $710B: $13
    rrca                                          ; $710C: $0F
    ld   a, [bc]                                  ; $710D: $0A
    dec  b                                        ; $710E: $05
    nop                                           ; $710F: $00
    ei                                            ; $7110: $FB
    or   $F1                                      ; $7111: $F6 $F1
    db   $ED                                      ; $7113: $ED
    jp   hl                                       ; $7114: $E9

    rst  $20                                      ; $7115: $E7
    push hl                                       ; $7116: $E5
    db   $E4                                      ; $7117: $E4
    push hl                                       ; $7118: $E5
    rst  $20                                      ; $7119: $E7
    jp   hl                                       ; $711A: $E9

    db   $ED                                      ; $711B: $ED
    pop  af                                       ; $711C: $F1
    or   $FB                                      ; $711D: $F6 $FB
    xor  $EF                                      ; $711F: $EE $EF
    ldh  a, [hJingle]                             ; $7121: $F0 $F2
    db   $F4                                      ; $7123: $F4
    or   $FA                                      ; $7124: $F6 $FA
    db   $FD                                      ; $7126: $FD
    nop                                           ; $7127: $00
    inc  bc                                       ; $7128: $03
    ld   b, $0A                                   ; $7129: $06 $0A
    inc  c                                        ; $712B: $0C
    ld   c, $10                                   ; $712C: $0E $10
    ld   de, $1112                                ; $712E: $11 $12 $11
    db   $10                                      ; $7131: $10
    ld   c, $0C                                   ; $7132: $0E $0C
    ld   a, [bc]                                  ; $7134: $0A
    ld   b, $03                                   ; $7135: $06 $03
    nop                                           ; $7137: $00
    db   $FD                                      ; $7138: $FD
    ld   a, [$F4F6]                               ; $7139: $FA $F6 $F4
    ld   a, [c]                                   ; $713C: $F2
    ldh  a, [$FFEF]                               ; $713D: $F0 $EF
    xor  $EF                                      ; $713F: $EE $EF
    ldh  a, [hJingle]                             ; $7141: $F0 $F2
    db   $F4                                      ; $7143: $F4
    or   $FA                                      ; $7144: $F6 $FA
    db   $FD                                      ; $7146: $FD
    ld   hl, sp-$07                               ; $7147: $F8 $F9
    ld   a, [$FBFB]                               ; $7149: $FA $FB $FB
    db   $FC                                      ; $714C: $FC
    db   $FD                                      ; $714D: $FD
    rst  $38                                      ; $714E: $FF
    nop                                           ; $714F: $00
    ld   bc, $0403                                ; $7150: $01 $03 $04
    dec  b                                        ; $7153: $05
    dec  b                                        ; $7154: $05
    ld   b, $07                                   ; $7155: $06 $07
    ld   [$0607], sp                              ; $7157: $08 $07 $06
    dec  b                                        ; $715A: $05
    dec  b                                        ; $715B: $05
    inc  b                                        ; $715C: $04
    inc  bc                                       ; $715D: $03
    ld   bc, $FF00                                ; $715E: $01 $00 $FF
    db   $FD                                      ; $7161: $FD
    db   $FC                                      ; $7162: $FC
    ei                                            ; $7163: $FB
    ei                                            ; $7164: $FB
    ld   a, [$F8F9]                               ; $7165: $FA $F9 $F8
    ld   sp, hl                                   ; $7168: $F9
    ld   a, [$FBFB]                               ; $7169: $FA $FB $FB
    db   $FC                                      ; $716C: $FC
    db   $FD                                      ; $716D: $FD
    rst  $38                                      ; $716E: $FF
    ld   c, [hl]                                  ; $716F: $4E
    nop                                           ; $7170: $00
    ld   c, [hl]                                  ; $7171: $4E
    jr   nz, jr_015_71C0                          ; $7172: $20 $4C

    nop                                           ; $7174: $00
    ld   c, h                                     ; $7175: $4C
    jr   nz, jr_015_71F4                          ; $7176: $20 $7C

    ld   [bc], a                                  ; $7178: $02
    ld   a, h                                     ; $7179: $7C
    ld   [hl+], a                                 ; $717A: $22

func_015_717B:
    ld   a, [$D223]                               ; $717B: $FA $23 $D2
    cp   $04                                      ; $717E: $FE $04
    jr   c, jr_015_71A0                           ; $7180: $38 $1E

    ld   a, [$D221]                               ; $7182: $FA $21 $D2
    and  $1F                                      ; $7185: $E6 $1F
    ld   e, a                                     ; $7187: $5F
    ld   d, b                                     ; $7188: $50
    ld   hl, $70AF                                ; $7189: $21 $AF $70
    add  hl, de                                   ; $718C: $19
    ldh  a, [wActiveEntityPosX]                   ; $718D: $F0 $EE
    add  [hl]                                     ; $718F: $86
    ldh  [wActiveEntityPosX], a                   ; $7190: $E0 $EE
    ld   hl, $70A7                                ; $7192: $21 $A7 $70
    add  hl, de                                   ; $7195: $19
    ldh  a, [wActiveEntityPosY]                   ; $7196: $F0 $EC
    add  [hl]                                     ; $7198: $86
    ldh  [wActiveEntityPosY], a                   ; $7199: $E0 $EC
    ld   a, $02                                   ; $719B: $3E $02
    call func_015_72CF                            ; $719D: $CD $CF $72

jr_015_71A0:
    ld   a, [$D223]                               ; $71A0: $FA $23 $D2
    cp   $03                                      ; $71A3: $FE $03
    jr   c, jr_015_71C5                           ; $71A5: $38 $1E

    ld   a, [$D221]                               ; $71A7: $FA $21 $D2
    and  $1F                                      ; $71AA: $E6 $1F
    ld   e, a                                     ; $71AC: $5F
    ld   d, b                                     ; $71AD: $50
    ld   hl, $70D7                                ; $71AE: $21 $D7 $70
    add  hl, de                                   ; $71B1: $19
    ldh  a, [wActiveEntityPosX]                   ; $71B2: $F0 $EE
    add  [hl]                                     ; $71B4: $86
    ldh  [wActiveEntityPosX], a                   ; $71B5: $E0 $EE
    ld   hl, $70CF                                ; $71B7: $21 $CF $70
    add  hl, de                                   ; $71BA: $19
    ldh  a, [wActiveEntityPosY]                   ; $71BB: $F0 $EC
    add  [hl]                                     ; $71BD: $86
    ldh  [wActiveEntityPosY], a                   ; $71BE: $E0 $EC

jr_015_71C0:
    ld   a, $01                                   ; $71C0: $3E $01
    call func_015_72CF                            ; $71C2: $CD $CF $72

jr_015_71C5:
    ld   a, [$D223]                               ; $71C5: $FA $23 $D2
    cp   $02                                      ; $71C8: $FE $02
    jr   c, jr_015_71EA                           ; $71CA: $38 $1E

    ld   a, [$D221]                               ; $71CC: $FA $21 $D2
    and  $1F                                      ; $71CF: $E6 $1F
    ld   e, a                                     ; $71D1: $5F
    ld   d, b                                     ; $71D2: $50
    ld   hl, $70FF                                ; $71D3: $21 $FF $70
    add  hl, de                                   ; $71D6: $19
    ldh  a, [wActiveEntityPosX]                   ; $71D7: $F0 $EE
    add  [hl]                                     ; $71D9: $86
    ldh  [wActiveEntityPosX], a                   ; $71DA: $E0 $EE
    ld   hl, $70F7                                ; $71DC: $21 $F7 $70
    add  hl, de                                   ; $71DF: $19
    ldh  a, [wActiveEntityPosY]                   ; $71E0: $F0 $EC
    add  [hl]                                     ; $71E2: $86
    ldh  [wActiveEntityPosY], a                   ; $71E3: $E0 $EC
    ld   a, $01                                   ; $71E5: $3E $01
    call func_015_72CF                            ; $71E7: $CD $CF $72

jr_015_71EA:
    ld   a, [$D223]                               ; $71EA: $FA $23 $D2
    cp   $01                                      ; $71ED: $FE $01
    jr   c, jr_015_7226                           ; $71EF: $38 $35

    ld   a, [$D221]                               ; $71F1: $FA $21 $D2

jr_015_71F4:
    and  $0F                                      ; $71F4: $E6 $0F
    cp   $07                                      ; $71F6: $FE $07
    jr   z, jr_015_7202                           ; $71F8: $28 $08

    cp   $08                                      ; $71FA: $FE $08
    jr   z, jr_015_7202                           ; $71FC: $28 $04

    cp   $09                                      ; $71FE: $FE $09
    jr   nz, jr_015_7208                          ; $7200: $20 $06

jr_015_7202:
    ldh  a, [hFrameCounter]                       ; $7202: $F0 $E7
    and  $01                                      ; $7204: $E6 $01
    jr   nz, jr_015_7226                          ; $7206: $20 $1E

jr_015_7208:
    ld   a, [$D221]                               ; $7208: $FA $21 $D2
    and  $1F                                      ; $720B: $E6 $1F
    ld   e, a                                     ; $720D: $5F
    ld   d, b                                     ; $720E: $50
    ld   hl, $7127                                ; $720F: $21 $27 $71
    add  hl, de                                   ; $7212: $19
    ldh  a, [wActiveEntityPosX]                   ; $7213: $F0 $EE
    add  [hl]                                     ; $7215: $86
    ldh  [wActiveEntityPosX], a                   ; $7216: $E0 $EE
    ld   hl, $711F                                ; $7218: $21 $1F $71
    add  hl, de                                   ; $721B: $19
    ldh  a, [wActiveEntityPosY]                   ; $721C: $F0 $EC
    add  [hl]                                     ; $721E: $86
    ldh  [wActiveEntityPosY], a                   ; $721F: $E0 $EC
    ld   a, $00                                   ; $7221: $3E $00
    call func_015_72CF                            ; $7223: $CD $CF $72

jr_015_7226:
    ld   a, [$D223]                               ; $7226: $FA $23 $D2
    cp   $04                                      ; $7229: $FE $04
    jr   c, jr_015_724B                           ; $722B: $38 $1E

    ld   a, [$D222]                               ; $722D: $FA $22 $D2
    and  $1F                                      ; $7230: $E6 $1F
    ld   e, a                                     ; $7232: $5F
    ld   d, b                                     ; $7233: $50
    ld   hl, $70AF                                ; $7234: $21 $AF $70
    add  hl, de                                   ; $7237: $19
    ldh  a, [wActiveEntityPosX]                   ; $7238: $F0 $EE
    add  [hl]                                     ; $723A: $86
    ldh  [wActiveEntityPosX], a                   ; $723B: $E0 $EE
    ld   hl, $70A7                                ; $723D: $21 $A7 $70
    add  hl, de                                   ; $7240: $19
    ldh  a, [wActiveEntityPosY]                   ; $7241: $F0 $EC
    add  [hl]                                     ; $7243: $86
    ldh  [wActiveEntityPosY], a                   ; $7244: $E0 $EC
    ld   a, $02                                   ; $7246: $3E $02
    call func_015_72CF                            ; $7248: $CD $CF $72

jr_015_724B:
    ld   a, [$D223]                               ; $724B: $FA $23 $D2
    cp   $03                                      ; $724E: $FE $03
    jr   c, jr_015_7270                           ; $7250: $38 $1E

    ld   a, [$D222]                               ; $7252: $FA $22 $D2
    and  $1F                                      ; $7255: $E6 $1F
    ld   e, a                                     ; $7257: $5F
    ld   d, b                                     ; $7258: $50
    ld   hl, $70D7                                ; $7259: $21 $D7 $70
    add  hl, de                                   ; $725C: $19
    ldh  a, [wActiveEntityPosX]                   ; $725D: $F0 $EE
    add  [hl]                                     ; $725F: $86
    ldh  [wActiveEntityPosX], a                   ; $7260: $E0 $EE
    ld   hl, $70CF                                ; $7262: $21 $CF $70
    add  hl, de                                   ; $7265: $19
    ldh  a, [wActiveEntityPosY]                   ; $7266: $F0 $EC
    add  [hl]                                     ; $7268: $86
    ldh  [wActiveEntityPosY], a                   ; $7269: $E0 $EC
    ld   a, $01                                   ; $726B: $3E $01
    call func_015_72CF                            ; $726D: $CD $CF $72

jr_015_7270:
    ld   a, [$D223]                               ; $7270: $FA $23 $D2
    cp   $02                                      ; $7273: $FE $02
    jr   c, jr_015_7295                           ; $7275: $38 $1E

    ld   a, [$D222]                               ; $7277: $FA $22 $D2
    and  $1F                                      ; $727A: $E6 $1F
    ld   e, a                                     ; $727C: $5F
    ld   d, b                                     ; $727D: $50
    ld   hl, $70FF                                ; $727E: $21 $FF $70
    add  hl, de                                   ; $7281: $19
    ldh  a, [wActiveEntityPosX]                   ; $7282: $F0 $EE
    add  [hl]                                     ; $7284: $86
    ldh  [wActiveEntityPosX], a                   ; $7285: $E0 $EE
    ld   hl, $70F7                                ; $7287: $21 $F7 $70
    add  hl, de                                   ; $728A: $19
    ldh  a, [wActiveEntityPosY]                   ; $728B: $F0 $EC
    add  [hl]                                     ; $728D: $86
    ldh  [wActiveEntityPosY], a                   ; $728E: $E0 $EC
    ld   a, $01                                   ; $7290: $3E $01
    call func_015_72CF                            ; $7292: $CD $CF $72

jr_015_7295:
    ld   a, [$D223]                               ; $7295: $FA $23 $D2
    cp   $01                                      ; $7298: $FE $01
    ret  c                                        ; $729A: $D8

    ld   a, [$D222]                               ; $729B: $FA $22 $D2
    and  $0F                                      ; $729E: $E6 $0F
    cp   $07                                      ; $72A0: $FE $07
    jr   z, jr_015_72AC                           ; $72A2: $28 $08

    cp   $08                                      ; $72A4: $FE $08
    jr   z, jr_015_72AC                           ; $72A6: $28 $04

    cp   $09                                      ; $72A8: $FE $09
    jr   nz, jr_015_72B1                          ; $72AA: $20 $05

jr_015_72AC:
    ldh  a, [hFrameCounter]                       ; $72AC: $F0 $E7
    and  $01                                      ; $72AE: $E6 $01
    ret  z                                        ; $72B0: $C8

jr_015_72B1:
    ld   a, [$D222]                               ; $72B1: $FA $22 $D2
    and  $1F                                      ; $72B4: $E6 $1F
    ld   e, a                                     ; $72B6: $5F
    ld   d, b                                     ; $72B7: $50
    ld   hl, $7127                                ; $72B8: $21 $27 $71
    add  hl, de                                   ; $72BB: $19
    ldh  a, [wActiveEntityPosX]                   ; $72BC: $F0 $EE
    add  [hl]                                     ; $72BE: $86
    ldh  [wActiveEntityPosX], a                   ; $72BF: $E0 $EE
    ld   hl, $711F                                ; $72C1: $21 $1F $71
    add  hl, de                                   ; $72C4: $19
    ldh  a, [wActiveEntityPosY]                   ; $72C5: $F0 $EC
    add  [hl]                                     ; $72C7: $86
    ldh  [wActiveEntityPosY], a                   ; $72C8: $E0 $EC
    ld   a, $00                                   ; $72CA: $3E $00
    jp   label_015_72CF                           ; $72CC: $C3 $CF $72

func_015_72CF:
label_015_72CF:
    ldh  [hActiveEntitySpriteVariant], a               ; $72CF: $E0 $F1
    ld   de, $716F                                ; $72D1: $11 $6F $71
    call RenderAnimatedActiveEntity                               ; $72D4: $CD $C0 $3B
    ld   a, $02                                   ; $72D7: $3E $02
    call label_3DA0                               ; $72D9: $CD $A0 $3D
    ld   hl, hLinkPositionX                       ; $72DC: $21 $98 $FF
    ldh  a, [wActiveEntityPosX]                   ; $72DF: $F0 $EE
    sub  [hl]                                     ; $72E1: $96
    add  $08                                      ; $72E2: $C6 $08
    cp   $10                                      ; $72E4: $FE $10
    jr   nc, jr_015_731D                          ; $72E6: $30 $35

    ld   hl, hLinkPositionY                       ; $72E8: $21 $99 $FF
    ldh  a, [wActiveEntityPosY]                   ; $72EB: $F0 $EC
    sub  [hl]                                     ; $72ED: $96
    add  $08                                      ; $72EE: $C6 $08
    cp   $10                                      ; $72F0: $FE $10
    jr   nc, jr_015_731D                          ; $72F2: $30 $29

    ld   hl, $C146                                ; $72F4: $21 $46 $C1
    ld   a, [$DBC7]                               ; $72F7: $FA $C7 $DB
    or   [hl]                                     ; $72FA: $B6
    jr   nz, jr_015_731D                          ; $72FB: $20 $20

    ld   a, $08                                   ; $72FD: $3E $08
    ld   [wDB94], a                               ; $72FF: $EA $94 $DB
    ld   a, $20                                   ; $7302: $3E $20
    call GetVectorTowardsLink_trampoline          ; $7304: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $7307: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $7309: $E0 $9B
    ldh  a, [hScratch1]                           ; $730B: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $730D: $E0 $9A
    ld   a, $10                                   ; $730F: $3E $10
    ld   [$C13E], a                               ; $7311: $EA $3E $C1
    ld   a, $30                                   ; $7314: $3E $30
    ld   [$DBC7], a                               ; $7316: $EA $C7 $DB
    ld   a, $03                                   ; $7319: $3E $03
    ldh  [hWaveSfx], a                            ; $731B: $E0 $F3

jr_015_731D:
    jp   label_3D8A                               ; $731D: $C3 $8A $3D

    ld   e, b                                     ; $7320: $58
    ld   [bc], a                                  ; $7321: $02
    ld   e, b                                     ; $7322: $58
    ld   [hl+], a                                 ; $7323: $22
    ld   e, d                                     ; $7324: $5A
    ld   [bc], a                                  ; $7325: $02
    ld   e, d                                     ; $7326: $5A
    ld   [hl+], a                                 ; $7327: $22
    db   $10                                      ; $7328: $10
    ldh  a, [rP1]                                 ; $7329: $F0 $00
    nop                                           ; $732B: $00
    nop                                           ; $732C: $00
    nop                                           ; $732D: $00
    ei                                            ; $732E: $FB
    dec  b                                        ; $732F: $05

SandCrabEntityHandler::
    ld   de, $7320                                ; $7330: $11 $20 $73
    call RenderAnimatedActiveEntity                               ; $7333: $CD $C0 $3B
    call func_015_7B0D                            ; $7336: $CD $0D $7B
    call func_015_7B3E                            ; $7339: $CD $3E $7B
    call func_015_7B88                            ; $733C: $CD $88 $7B
    call label_3B23                               ; $733F: $CD $23 $3B
    call label_3B39                               ; $7342: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $7345: $F0 $E7
    rra                                           ; $7347: $1F
    rra                                           ; $7348: $1F
    rra                                           ; $7349: $1F
    and  $01                                      ; $734A: $E6 $01
    call SetEntitySpriteVariant                   ; $734C: $CD $0C $3B
    ld   hl, wEntitiesCollisionsTable             ; $734F: $21 $A0 $C2
    add  hl, bc                                   ; $7352: $09
    ld   a, [hl]                                  ; $7353: $7E
    and  a                                        ; $7354: $A7
    jr   nz, jr_015_735C                          ; $7355: $20 $05

    call GetEntityTransitionCountdown             ; $7357: $CD $05 $0C
    jr   nz, jr_015_7382                          ; $735A: $20 $26

jr_015_735C:
    call GetEntityTransitionCountdown             ; $735C: $CD $05 $0C
    call GetRandomByte                            ; $735F: $CD $0D $28
    and  $7F                                      ; $7362: $E6 $7F
    add  $30                                      ; $7364: $C6 $30
    ld   [hl], a                                  ; $7366: $77
    call GetRandomByte                            ; $7367: $CD $0D $28
    and  $03                                      ; $736A: $E6 $03
    ld   e, a                                     ; $736C: $5F
    ld   d, b                                     ; $736D: $50
    ld   hl, $7328                                ; $736E: $21 $28 $73
    add  hl, de                                   ; $7371: $19
    ld   a, [hl]                                  ; $7372: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7373: $21 $40 $C2
    add  hl, bc                                   ; $7376: $09
    ld   [hl], a                                  ; $7377: $77
    ld   hl, $732C                                ; $7378: $21 $2C $73
    add  hl, de                                   ; $737B: $19
    ld   a, [hl]                                  ; $737C: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $737D: $21 $50 $C2
    add  hl, bc                                   ; $7380: $09
    ld   [hl], a                                  ; $7381: $77

jr_015_7382:
    ret                                           ; $7382: $C9

    ld   e, h                                     ; $7383: $5C
    inc  bc                                       ; $7384: $03
    ld   e, [hl]                                  ; $7385: $5E
    inc  bc                                       ; $7386: $03
    ld   e, [hl]                                  ; $7387: $5E
    inc  hl                                       ; $7388: $23
    ld   e, h                                     ; $7389: $5C
    inc  hl                                       ; $738A: $23
    ld   e, [hl]                                  ; $738B: $5E
    ld   h, e                                     ; $738C: $63
    ld   e, h                                     ; $738D: $5C
    ld   h, e                                     ; $738E: $63
    ld   e, h                                     ; $738F: $5C
    ld   b, e                                     ; $7390: $43
    ld   e, [hl]                                  ; $7391: $5E
    ld   b, e                                     ; $7392: $43
    inc  l                                        ; $7393: $2C
    inc  bc                                       ; $7394: $03
    ld   l, $03                                   ; $7395: $2E $03
    ld   l, $23                                   ; $7397: $2E $23
    inc  l                                        ; $7399: $2C
    inc  hl                                       ; $739A: $23
    ld   l, $63                                   ; $739B: $2E $63
    inc  l                                        ; $739D: $2C
    ld   h, e                                     ; $739E: $63
    inc  l                                        ; $739F: $2C
    ld   b, e                                     ; $73A0: $43
    ld   l, $43                                   ; $73A1: $2E $43
    db   $FD                                      ; $73A3: $FD
    inc  bc                                       ; $73A4: $03
    nop                                           ; $73A5: $00
    nop                                           ; $73A6: $00
    nop                                           ; $73A7: $00
    nop                                           ; $73A8: $00
    inc  bc                                       ; $73A9: $03
    db   $FD                                      ; $73AA: $FD

UrchinEntityHandler::
    ld   de, $7383                                ; $73AB: $11 $83 $73
    ld   a, [wGameplayType]                       ; $73AE: $FA $95 $DB
    cp   $01                                      ; $73B1: $FE $01
    jr   nz, jr_015_73B8                          ; $73B3: $20 $03

    ld   de, $7393                                ; $73B5: $11 $93 $73

jr_015_73B8:
    call RenderAnimatedActiveEntity                               ; $73B8: $CD $C0 $3B
    call func_015_7B0D                            ; $73BB: $CD $0D $7B
    call func_015_7B3E                            ; $73BE: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $73C1: $F0 $E7
    rra                                           ; $73C3: $1F
    rra                                           ; $73C4: $1F
    rra                                           ; $73C5: $1F
    rra                                           ; $73C6: $1F
    and  $03                                      ; $73C7: $E6 $03
    call SetEntitySpriteVariant                   ; $73C9: $CD $0C $3B
    call func_015_7C0A                            ; $73CC: $CD $0A $7C
    ld   hl, wEntitiesUnknowTableQ                ; $73CF: $21 $80 $C3
    add  hl, bc                                   ; $73D2: $09
    ld   [hl], e                                  ; $73D3: $73
    ld   hl, wEntitiesUnknowTableL                ; $73D4: $21 $40 $C3
    add  hl, bc                                   ; $73D7: $09
    res  7, [hl]                                  ; $73D8: $CB $BE
    ld   a, [wIsUsingShield]                      ; $73DA: $FA $5B $C1
    and  a                                        ; $73DD: $A7
    jr   z, jr_015_73E9                           ; $73DE: $28 $09

    ldh  a, [hLinkDirection]                      ; $73E0: $F0 $9E
    xor  $01                                      ; $73E2: $EE $01
    cp   e                                        ; $73E4: $BB
    jr   nz, jr_015_73E9                          ; $73E5: $20 $02

    set  7, [hl]                                  ; $73E7: $CB $FE

jr_015_73E9:
    call label_3B5A                               ; $73E9: $CD $5A $3B
    jr   nc, jr_015_7428                          ; $73EC: $30 $3A

    call CopyLinkFinalPositionToPosition          ; $73EE: $CD $BE $0C
    ld   hl, wEntitiesUnknowTableL                ; $73F1: $21 $40 $C3
    add  hl, bc                                   ; $73F4: $09
    ld   a, [hl]                                  ; $73F5: $7E
    and  $80                                      ; $73F6: $E6 $80
    ret  z                                        ; $73F8: $C8

    ld   hl, wEntitiesUnknowTableQ                ; $73F9: $21 $80 $C3
    add  hl, bc                                   ; $73FC: $09
    ld   e, [hl]                                  ; $73FD: $5E
    ld   d, b                                     ; $73FE: $50
    ld   hl, $73A3                                ; $73FF: $21 $A3 $73
    add  hl, de                                   ; $7402: $19
    ld   a, [hl]                                  ; $7403: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7404: $21 $40 $C2
    add  hl, bc                                   ; $7407: $09

jr_015_7408:
    ld   [hl], a                                  ; $7408: $77
    ld   hl, $73A7                                ; $7409: $21 $A7 $73
    add  hl, de                                   ; $740C: $19
    ld   a, [hl]                                  ; $740D: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $740E: $21 $50 $C2
    add  hl, bc                                   ; $7411: $09
    ld   [hl], a                                  ; $7412: $77
    ld   a, $3E                                   ; $7413: $3E $3E
    ldh  [hJingle], a                             ; $7415: $E0 $F2
    call func_015_7B88                            ; $7417: $CD $88 $7B
    ld   hl, wEntitiesUnknowTableT                ; $741A: $21 $10 $C4
    add  hl, bc                                   ; $741D: $09
    ld   [hl], $03                                ; $741E: $36 $03
    call label_3B23                               ; $7420: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableT                ; $7423: $21 $10 $C4
    add  hl, bc                                   ; $7426: $09
    ld   [hl], b                                  ; $7427: $70

jr_015_7428:
    ld   a, [wC16A]                               ; $7428: $FA $6A $C1
    and  a                                        ; $742B: $A7
    jr   nz, jr_015_7433                          ; $742C: $20 $05

    ld   a, [wIsUsingShield]                      ; $742E: $FA $5B $C1
    and  a                                        ; $7431: $A7
    ret  nz                                       ; $7432: $C0

jr_015_7433:
    jp   label_3B70                               ; $7433: $C3 $70 $3B

    jr   nc, jr_015_7408                          ; $7436: $30 $D0

Entity68Handler::
    call func_015_7B0D                            ; $7438: $CD $0D $7B
    ld   hl, wEntitiesUnknowTableQ                ; $743B: $21 $80 $C3
    add  hl, bc                                   ; $743E: $09
    ld   e, [hl]                                  ; $743F: $5E
    ld   d, b                                     ; $7440: $50
    ld   hl, $7436                                ; $7441: $21 $36 $74
    add  hl, de                                   ; $7444: $19
    ld   a, [hl]                                  ; $7445: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7446: $21 $50 $C2
    add  hl, bc                                   ; $7449: $09
    ld   [hl], a                                  ; $744A: $77
    call func_015_7B8B                            ; $744B: $CD $8B $7B
    call label_3B23                               ; $744E: $CD $23 $3B
    ldh  a, [hObjectUnderEntity]                  ; $7451: $F0 $AF
    cp   $9D                                      ; $7453: $FE $9D
    jr   z, jr_015_746A                           ; $7455: $28 $13

    ld   e, a                                     ; $7457: $5F
    ld   d, $01                                   ; $7458: $16 $01
    call ReadValueFromBaseMap_trampoline                               ; $745A: $CD $26 $2A
    and  a                                        ; $745D: $A7
    jr   nz, jr_015_746A                          ; $745E: $20 $0A

    call ClearEntityStatus                        ; $7460: $CD $31 $7C
    ld   hl, wEntitiesStatusTable                        ; $7463: $21 $80 $C2
    add  hl, bc                                   ; $7466: $09
    ld   a, [hl]                                  ; $7467: $7E
    ldh  [hActiveEntityStatus], a                  ; $7468: $E0 $EA

jr_015_746A:
    ldh  a, [wActiveEntityPosX]                   ; $746A: $F0 $EE
    sub  $08                                      ; $746C: $D6 $08
    ldh  [hSwordIntersectedAreaX], a              ; $746E: $E0 $CE
    swap a                                        ; $7470: $CB $37
    and  $0F                                      ; $7472: $E6 $0F
    ld   e, a                                     ; $7474: $5F
    ldh  a, [wActiveEntityPosY]                   ; $7475: $F0 $EC
    add  $04                                      ; $7477: $C6 $04
    sub  $10                                      ; $7479: $D6 $10
    ldh  [hSwordIntersectedAreaY], a              ; $747B: $E0 $CD
    and  $F0                                      ; $747D: $E6 $F0
    or   e                                        ; $747F: $B3
    ld   e, a                                     ; $7480: $5F
    ld   d, $00                                   ; $7481: $16 $00
    ld   hl, wRoomObjects                         ; $7483: $21 $11 $D7
    add  hl, de                                   ; $7486: $19
    ld   [hl], $9D                                ; $7487: $36 $9D
    call label_2887                               ; $7489: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $748C: $F0 $FE
    and  a                                        ; $748E: $A7
    jr   z, jr_015_749D                           ; $748F: $28 $0C

    push bc                                       ; $7491: $C5
    ld   a, $9D                                   ; $7492: $3E $9D
    ld   [$DDD8], a                               ; $7494: $EA $D8 $DD
    ld   a, $15                                   ; $7497: $3E $15
    call label_91D                                ; $7499: $CD $1D $09
    pop  bc                                       ; $749C: $C1

jr_015_749D:
    ld   hl, wRequestDestinationHigh              ; $749D: $21 $01 $D6
    ld   a, [wRequests]                           ; $74A0: $FA $00 $D6
    ld   e, a                                     ; $74A3: $5F
    add  $0A                                      ; $74A4: $C6 $0A
    ld   [wRequests], a                           ; $74A6: $EA $00 $D6
    ld   d, $00                                   ; $74A9: $16 $00
    add  hl, de                                   ; $74AB: $19
    ldh  a, [$FFCF]                               ; $74AC: $F0 $CF
    ld   [hl+], a                                 ; $74AE: $22
    ldh  a, [$FFD0]                               ; $74AF: $F0 $D0
    ld   [hl+], a                                 ; $74B1: $22
    ld   a, $81                                   ; $74B2: $3E $81
    ld   [hl+], a                                 ; $74B4: $22
    push hl                                       ; $74B5: $E5
    ld   hl, wEntitiesUnknowTableQ                ; $74B6: $21 $80 $C3
    add  hl, bc                                   ; $74B9: $09
    ld   a, [hl]                                  ; $74BA: $7E
    pop  hl                                       ; $74BB: $E1
    and  a                                        ; $74BC: $A7
    jr   nz, jr_015_74E6                          ; $74BD: $20 $27

    ld   a, $04                                   ; $74BF: $3E $04
    ld   [hl+], a                                 ; $74C1: $22
    ldh  a, [hActiveEntityStatus]                 ; $74C2: $F0 $EA
    and  a                                        ; $74C4: $A7
    ld   a, $08                                   ; $74C5: $3E $08
    jr   nz, jr_015_74CB                          ; $74C7: $20 $02

    ld   a, $04                                   ; $74C9: $3E $04

jr_015_74CB:
    ld   [hl+], a                                 ; $74CB: $22
    ldh  a, [$FFCF]                               ; $74CC: $F0 $CF
    ld   [hl+], a                                 ; $74CE: $22
    ldh  a, [$FFD0]                               ; $74CF: $F0 $D0
    inc  a                                        ; $74D1: $3C
    ld   [hl+], a                                 ; $74D2: $22
    ld   a, $81                                   ; $74D3: $3E $81
    ld   [hl+], a                                 ; $74D5: $22
    ld   a, $05                                   ; $74D6: $3E $05
    ld   [hl+], a                                 ; $74D8: $22
    ldh  a, [hActiveEntityStatus]                 ; $74D9: $F0 $EA
    and  a                                        ; $74DB: $A7
    ld   a, $09                                   ; $74DC: $3E $09
    jr   nz, jr_015_74E2                          ; $74DE: $20 $02

    ld   a, $05                                   ; $74E0: $3E $05

jr_015_74E2:
    ld   [hl+], a                                 ; $74E2: $22
    ld   [hl], $00                                ; $74E3: $36 $00
    ret                                           ; $74E5: $C9

jr_015_74E6:
    ldh  a, [hActiveEntityStatus]                 ; $74E6: $F0 $EA
    and  a                                        ; $74E8: $A7
    ld   a, $0A                                   ; $74E9: $3E $0A
    jr   nz, jr_015_74EF                          ; $74EB: $20 $02

    ld   a, $04                                   ; $74ED: $3E $04

jr_015_74EF:
    ld   [hl+], a                                 ; $74EF: $22
    ld   a, $04                                   ; $74F0: $3E $04
    ld   [hl+], a                                 ; $74F2: $22
    ldh  a, [$FFCF]                               ; $74F3: $F0 $CF
    ld   [hl+], a                                 ; $74F5: $22
    ldh  a, [$FFD0]                               ; $74F6: $F0 $D0
    inc  a                                        ; $74F8: $3C
    ld   [hl+], a                                 ; $74F9: $22
    ld   a, $81                                   ; $74FA: $3E $81
    ld   [hl+], a                                 ; $74FC: $22
    ldh  a, [hActiveEntityStatus]                 ; $74FD: $F0 $EA
    and  a                                        ; $74FF: $A7
    ld   a, $0B                                   ; $7500: $3E $0B
    jr   nz, jr_015_7506                          ; $7502: $20 $02

    ld   a, $05                                   ; $7504: $3E $05

jr_015_7506:
    ld   [hl+], a                                 ; $7506: $22
    ld   a, $05                                   ; $7507: $3E $05
    ld   [hl+], a                                 ; $7509: $22
    ld   [hl], $00                                ; $750A: $36 $00
    ret                                           ; $750C: $C9

BeetleSpawnerEntityHandler::
    ld   hl, wEntitiesUnknownTableD               ; $750D: $21 $D0 $C2
    add  hl, bc                                   ; $7510: $09
    ld   a, [hl]                                  ; $7511: $7E
    and  a                                        ; $7512: $A7
    jp   nz, $757F                                ; $7513: $C2 $7F $75

    call func_015_7B0D                            ; $7516: $CD $0D $7B
    call func_015_7BDB                            ; $7519: $CD $DB $7B
    add  $20                                      ; $751C: $C6 $20
    cp   $40                                      ; $751E: $FE $40
    jr   nc, jr_015_756E                          ; $7520: $30 $4C

    call func_015_7BEB                            ; $7522: $CD $EB $7B
    add  $20                                      ; $7525: $C6 $20
    cp   $40                                      ; $7527: $FE $40
    jr   nc, jr_015_756E                          ; $7529: $30 $43

    ld   hl, wEntitiesUnknowTableY                ; $752B: $21 $D0 $C3
    add  hl, bc                                   ; $752E: $09
    ld   a, [hl]                                  ; $752F: $7E
    inc  a                                        ; $7530: $3C
    ld   [hl], a                                  ; $7531: $77
    and  $3F                                      ; $7532: $E6 $3F
    jr   nz, jr_015_756E                          ; $7534: $20 $38

    ld   a, $B2                                   ; $7536: $3E $B2
    ld   e, $04                                   ; $7538: $1E $04
    call label_3B98                               ; $753A: $CD $98 $3B
    jr   c, jr_015_756E                           ; $753D: $38 $2F

    ldh  a, [hScratch0]                           ; $753F: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7541: $21 $00 $C2
    add  hl, de                                   ; $7544: $19
    ld   [hl], a                                  ; $7545: $77
    ldh  a, [hScratch1]                           ; $7546: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7548: $21 $10 $C2
    add  hl, de                                   ; $754B: $19
    ld   [hl], a                                  ; $754C: $77
    ld   hl, wEntitiesUnknowTableL                ; $754D: $21 $40 $C3
    add  hl, de                                   ; $7550: $19
    ld   [hl], $12                                ; $7551: $36 $12
    ld   hl, wEntitiesUnknownTableD               ; $7553: $21 $D0 $C2
    add  hl, de                                   ; $7556: $19
    ld   [hl], $01                                ; $7557: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $7559: $21 $E0 $C2
    add  hl, de                                   ; $755C: $19
    ld   [hl], $18                                ; $755D: $36 $18
    ld   hl, wEntitiesUnknowTableF                ; $755F: $21 $F0 $C2
    add  hl, de                                   ; $7562: $19
    ld   [hl], $20                                ; $7563: $36 $20
    push bc                                       ; $7565: $C5
    ld   c, e                                     ; $7566: $4B
    ld   b, d                                     ; $7567: $42
    ld   a, $08                                   ; $7568: $3E $08
    call label_3BAA                               ; $756A: $CD $AA $3B
    pop  bc                                       ; $756D: $C1

jr_015_756E:
    ret                                           ; $756E: $C9

    ld   [$00F8], sp                              ; $756F: $08 $F8 $00
    nop                                           ; $7572: $00
    nop                                           ; $7573: $00
    nop                                           ; $7574: $00
    ld   hl, sp+$08                               ; $7575: $F8 $08
    ld   [hl], b                                  ; $7577: $70
    nop                                           ; $7578: $00
    ld   [hl], d                                  ; $7579: $72
    nop                                           ; $757A: $00
    ld   [hl], d                                  ; $757B: $72
    jr   nz, @+$72                                ; $757C: $20 $70

    jr   nz, @+$13                                ; $757E: $20 $11

    ld   [hl], a                                  ; $7580: $77
    ld   [hl], l                                  ; $7581: $75
    call RenderAnimatedActiveEntity                               ; $7582: $CD $C0 $3B
    call func_015_7B0D                            ; $7585: $CD $0D $7B
    call func_015_7B3E                            ; $7588: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $758B: $F0 $E7
    rra                                           ; $758D: $1F
    rra                                           ; $758E: $1F
    rra                                           ; $758F: $1F
    and  $01                                      ; $7590: $E6 $01
    call SetEntitySpriteVariant                   ; $7592: $CD $0C $3B
    call func_015_7B88                            ; $7595: $CD $88 $7B
    call IsEntityUnknownFZero                     ; $7598: $CD $00 $0C
    jr   nz, jr_015_75A0                          ; $759B: $20 $03

    call label_3B23                               ; $759D: $CD $23 $3B

jr_015_75A0:
    call label_3B39                               ; $75A0: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $75A3: $CD $05 $0C
    jr   nz, jr_015_75CB                          ; $75A6: $20 $23

    call GetRandomByte                            ; $75A8: $CD $0D $28
    and  $1F                                      ; $75AB: $E6 $1F
    add  $20                                      ; $75AD: $C6 $20
    ld   [hl], a                                  ; $75AF: $77
    call GetRandomByte                            ; $75B0: $CD $0D $28
    and  $03                                      ; $75B3: $E6 $03
    ld   e, a                                     ; $75B5: $5F
    ld   d, b                                     ; $75B6: $50
    ld   hl, $756F                                ; $75B7: $21 $6F $75
    add  hl, de                                   ; $75BA: $19
    ld   a, [hl]                                  ; $75BB: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $75BC: $21 $40 $C2
    add  hl, bc                                   ; $75BF: $09
    ld   [hl], a                                  ; $75C0: $77
    ld   hl, $7573                                ; $75C1: $21 $73 $75
    add  hl, de                                   ; $75C4: $19
    ld   a, [hl]                                  ; $75C5: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $75C6: $21 $50 $C2
    add  hl, bc                                   ; $75C9: $09
    ld   [hl], a                                  ; $75CA: $77

jr_015_75CB:
    ret                                           ; $75CB: $C9

    ld   a, $01                                   ; $75CC: $3E $01
    ld   hl, sp+$08                               ; $75CE: $F8 $08
    nop                                           ; $75D0: $00
    nop                                           ; $75D1: $00
    nop                                           ; $75D2: $00
    nop                                           ; $75D3: $00
    db   $08, $F8                                 ; $75D4: $08 $F8

LaserBeamEntityHandler::
    db   $CD                                      ; $75D6
    dec  c                                        ; $75D7: $0D
    ld   a, e                                     ; $75D8: $7B
    ldh  a, [hActiveEntityState]                  ; $75D9: $F0 $F0
    and  a                                        ; $75DB: $A7
    jr   nz, jr_015_75E1                          ; $75DC: $20 $03

    call label_3B4F                               ; $75DE: $CD $4F $3B

jr_015_75E1:
    call func_015_7B88                            ; $75E1: $CD $88 $7B
    call label_3B2E                               ; $75E4: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $75E7: $21 $A0 $C2
    add  hl, bc                                   ; $75EA: $09
    ld   a, [hl]                                  ; $75EB: $7E
    and  a                                        ; $75EC: $A7
    jr   z, jr_015_7639                           ; $75ED: $28 $4A

    push hl                                       ; $75EF: $E5
    ldh  a, [wActiveEntityPosX]                   ; $75F0: $F0 $EE
    ldh  [hScratch0], a                           ; $75F2: $E0 $D7
    ldh  a, [$FFEF]                               ; $75F4: $F0 $EF
    ldh  [hScratch1], a                           ; $75F6: $E0 $D8
    ld   a, $05                                   ; $75F8: $3E $05
    call label_CC7                                ; $75FA: $CD $C7 $0C
    pop  hl                                       ; $75FD: $E1
    ld   a, [hl]                                  ; $75FE: $7E
    cp   $02                                      ; $75FF: $FE $02
    jp   nz, ClearEntityStatusAndReturn           ; $7601: $C2 $31 $7C

    ld   [hl], $00                                ; $7604: $36 $00
    ld   hl, wEntitiesStateTable                  ; $7606: $21 $90 $C2
    add  hl, bc                                   ; $7609: $09
    ld   [hl], a                                  ; $760A: $77
    ldh  a, [hLinkDirection]                      ; $760B: $F0 $9E
    and  $02                                      ; $760D: $E6 $02
    jr   nz, jr_015_7616                          ; $760F: $20 $05

    ld   hl, wEntitiesSpeedXTable                       ; $7611: $21 $40 $C2
    jr   jr_015_7619                              ; $7614: $18 $03

jr_015_7616:
    ld   hl, wEntitiesSpeedYTable                       ; $7616: $21 $50 $C2

jr_015_7619:
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    cpl                                           ; $761B: $2F
    inc  a                                        ; $761C: $3C
    ld   [hl], a                                  ; $761D: $77
    call ResetSpinAttack                                ; $761E: $CD $AF $0C
    ld   a, $10                                   ; $7621: $3E $10
    ld   [$C13E], a                               ; $7623: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7626: $F0 $9E
    ld   e, a                                     ; $7628: $5F
    ld   d, b                                     ; $7629: $50
    ld   hl, $75CE                                ; $762A: $21 $CE $75
    add  hl, de                                   ; $762D: $19
    ld   a, [hl]                                  ; $762E: $7E
    ldh  [hLinkPositionXIncrement], a             ; $762F: $E0 $9A
    ld   hl, $75D2                                ; $7631: $21 $D2 $75
    add  hl, de                                   ; $7634: $19
    ld   a, [hl]                                  ; $7635: $7E
    ldh  [hLinkPositionYIncrement], a             ; $7636: $E0 $9B
    ret                                           ; $7638: $C9

jr_015_7639:
    ldh  a, [wActiveEntityPosX]                   ; $7639: $F0 $EE
    add  $04                                      ; $763B: $C6 $04
    ldh  [hScratch0], a                           ; $763D: $E0 $D7
    ldh  a, [$FFEF]                               ; $763F: $F0 $EF
    ldh  [hScratch1], a                           ; $7641: $E0 $D8
    ld   a, $06                                   ; $7643: $3E $06
    call label_CC7                                ; $7645: $CD $C7 $0C
    ld   [hl], $10                                ; $7648: $36 $10
    ret                                           ; $764A: $C9

    nop                                           ; $764B: $00
    nop                                           ; $764C: $00
    ld   [hl], h                                  ; $764D: $74
    ld   [bc], a                                  ; $764E: $02
    nop                                           ; $764F: $00
    ld   [$2274], sp                              ; $7650: $08 $74 $22
    nop                                           ; $7653: $00
    nop                                           ; $7654: $00
    rst  $38                                      ; $7655: $FF
    ld   [bc], a                                  ; $7656: $02
    ldh  a, [$FF08]                               ; $7657: $F0 $08
    ld   a, d                                     ; $7659: $7A
    ld   [bc], a                                  ; $765A: $02
    nop                                           ; $765B: $00
    nop                                           ; $765C: $00
    db   $76                                      ; $765D: $76
    ld   [bc], a                                  ; $765E: $02
    nop                                           ; $765F: $00
    ld   [$0278], sp                              ; $7660: $08 $78 $02
    ldh  a, [rP1]                                 ; $7663: $F0 $00
    ld   a, d                                     ; $7665: $7A
    ld   [hl+], a                                 ; $7666: $22
    nop                                           ; $7667: $00
    nop                                           ; $7668: $00
    ld   a, b                                     ; $7669: $78
    ld   [hl+], a                                 ; $766A: $22
    nop                                           ; $766B: $00
    ld   [$2276], sp                              ; $766C: $08 $76 $22
    nop                                           ; $766F: $00
    nop                                           ; $7670: $00
    ld   [hl], h                                  ; $7671: $74
    ld   b, d                                     ; $7672: $42
    nop                                           ; $7673: $00
    ld   [$6274], sp                              ; $7674: $08 $74 $62
    nop                                           ; $7677: $00
    nop                                           ; $7678: $00
    rst  $38                                      ; $7679: $FF
    ld   [bc], a                                  ; $767A: $02

MonkeyEntityHandler::
    ld   hl, wEntitiesUnknownTableB               ; $767B: $21 $B0 $C2
    add  hl, bc                                   ; $767E: $09
    ld   a, [hl]                                  ; $767F: $7E
    and  a                                        ; $7680: $A7
    jp   nz, label_015_7825                       ; $7681: $C2 $25 $78

    ld   hl, $764B                                ; $7684: $21 $4B $76
    ldh  a, [hActiveEntitySpriteVariant]               ; $7687: $F0 $F1
    rla                                           ; $7689: $17
    rla                                           ; $768A: $17
    and  $FC                                      ; $768B: $E6 $FC
    ld   e, a                                     ; $768D: $5F
    rla                                           ; $768E: $17
    add  e                                        ; $768F: $83
    ld   e, a                                     ; $7690: $5F
    ld   d, b                                     ; $7691: $50
    add  hl, de                                   ; $7692: $19
    ld   c, $03                                   ; $7693: $0E $03
    call label_3CE6                               ; $7695: $CD $E6 $3C
    call label_3CD9                               ; $7698: $CD $D9 $3C
    ldh  a, [hActiveEntityState]                  ; $769B: $F0 $F0
    cp   $02                                      ; $769D: $FE $02
    jr   nc, jr_015_76EF                          ; $769F: $30 $4E

    ld   a, [$C157]                               ; $76A1: $FA $57 $C1
    and  a                                        ; $76A4: $A7
    jr   z, jr_015_76EF                           ; $76A5: $28 $48

    ld   a, [wC178]                               ; $76A7: $FA $78 $C1
    and  a                                        ; $76AA: $A7
    jr   z, jr_015_76EF                           ; $76AB: $28 $42

    ldh  a, [wActiveEntityPosX]                   ; $76AD: $F0 $EE
    add  $08                                      ; $76AF: $C6 $08
    ld   hl, wC179                                ; $76B1: $21 $79 $C1
    sub  [hl]                                     ; $76B4: $96
    add  $10                                      ; $76B5: $C6 $10
    cp   $20                                      ; $76B7: $FE $20
    jr   nc, jr_015_76EF                          ; $76B9: $30 $34

    ldh  a, [$FFEF]                               ; $76BB: $F0 $EF
    add  $08                                      ; $76BD: $C6 $08
    ld   hl, wC17a                                ; $76BF: $21 $7A $C1
    sub  [hl]                                     ; $76C2: $96
    add  $10                                      ; $76C3: $C6 $10
    cp   $20                                      ; $76C5: $FE $20
    jr   nc, jr_015_76EF                          ; $76C7: $30 $26

    ld   hl, wEntitiesPosYTable                         ; $76C9: $21 $10 $C2
    add  hl, bc                                   ; $76CC: $09
    ld   a, [hl]                                  ; $76CD: $7E
    add  $18                                      ; $76CE: $C6 $18
    ld   [hl], a                                  ; $76D0: $77
    ld   hl, wEntitiesPosZTable                   ; $76D1: $21 $10 $C3
    add  hl, bc                                   ; $76D4: $09
    ld   [hl], $18                                ; $76D5: $36 $18
    call IncrementEntityWalkingAttr               ; $76D7: $CD $12 $3B
    ld   [hl], $02                                ; $76DA: $36 $02
    ld   hl, wEntitiesSpeedZTable                 ; $76DC: $21 $20 $C3
    add  hl, bc                                   ; $76DF: $09
    ld   [hl], $15                                ; $76E0: $36 $15
    ld   hl, wEntitiesSpeedYTable                       ; $76E2: $21 $50 $C2
    add  hl, bc                                   ; $76E5: $09
    ld   [hl], $0C                                ; $76E6: $36 $0C
    ld   hl, wEntitiesSpeedXTable                       ; $76E8: $21 $40 $C2
    add  hl, bc                                   ; $76EB: $09
    ld   [hl], $FA                                ; $76EC: $36 $FA
    ret                                           ; $76EE: $C9

jr_015_76EF:
    ldh  a, [hActiveEntityState]                  ; $76EF: $F0 $F0
    rst  $00                                      ; $76F1: $C7
    ld   a, [$0A76]                               ; $76F2: $FA $76 $0A
    ld   [hl], a                                  ; $76F5: $77
    sub  e                                        ; $76F6: $93
    ld   [hl], a                                  ; $76F7: $77
    cp   a                                        ; $76F8: $BF
    ld   [hl], a                                  ; $76F9: $77
    ld   hl, wEntitiesPosXTable                         ; $76FA: $21 $00 $C2
    add  hl, bc                                   ; $76FD: $09
    ld   a, [hl]                                  ; $76FE: $7E
    add  $08                                      ; $76FF: $C6 $08
    ld   [hl], a                                  ; $7701: $77
    call GetEntityTransitionCountdown             ; $7702: $CD $05 $0C
    ld   [hl], $80                                ; $7705: $36 $80
    jp   IncrementEntityWalkingAttr               ; $7707: $C3 $12 $3B

    call func_015_7B0D                            ; $770A: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $770D: $CD $05 $0C
    ret  nz                                       ; $7710: $C0

    ld   [hl], $50                                ; $7711: $36 $50
    ld   hl, wEntitiesSpriteVariantTable               ; $7713: $21 $B0 $C3
    add  hl, bc                                   ; $7716: $09
    ld   a, [hl]                                  ; $7717: $7E
    inc  a                                        ; $7718: $3C
    cp   $03                                      ; $7719: $FE $03
    jr   nz, jr_015_771E                          ; $771B: $20 $01

    xor  a                                        ; $771D: $AF

jr_015_771E:
    ld   [hl], a                                  ; $771E: $77
    ldh  [hActiveEntitySpriteVariant], a               ; $771F: $E0 $F1
    cp   $00                                      ; $7721: $FE $00
    jr   z, jr_015_7792                           ; $7723: $28 $6D

    call GetEntityTransitionCountdown             ; $7725: $CD $05 $0C
    ld   [hl], $28                                ; $7728: $36 $28
    ld   hl, wEntitiesUnknowTableY                ; $772A: $21 $D0 $C3
    add  hl, bc                                   ; $772D: $09
    inc  [hl]                                     ; $772E: $34
    ld   a, [hl]                                  ; $772F: $7E
    and  $0F                                      ; $7730: $E6 $0F
    jr   nz, jr_015_7738                          ; $7732: $20 $04

    ld   a, $02                                   ; $7734: $3E $02
    jr   jr_015_773A                              ; $7736: $18 $02

jr_015_7738:
    ld   a, $E0                                   ; $7738: $3E $E0

jr_015_773A:
    call func_003_64CA_trampoline                               ; $773A: $CD $86 $3B
    ret  c                                        ; $773D: $D8

    ldh  a, [hScratch0]                           ; $773E: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7740: $21 $00 $C2
    add  hl, de                                   ; $7743: $19
    ld   [hl], a                                  ; $7744: $77
    ldh  a, [hScratch1]                           ; $7745: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7747: $21 $10 $C2
    add  hl, de                                   ; $774A: $19
    sub  $0C                                      ; $774B: $D6 $0C
    add  $18                                      ; $774D: $C6 $18
    ld   [hl], a                                  ; $774F: $77
    ld   hl, wEntitiesPosZTable                   ; $7750: $21 $10 $C3
    add  hl, de                                   ; $7753: $19
    ld   [hl], $18                                ; $7754: $36 $18
    ld   hl, wEntitiesUnknownTableB               ; $7756: $21 $B0 $C2
    add  hl, de                                   ; $7759: $19
    inc  [hl]                                     ; $775A: $34
    ld   hl, wEntitiesSpeedZTable                 ; $775B: $21 $20 $C3
    add  hl, de                                   ; $775E: $19
    ld   [hl], $20                                ; $775F: $36 $20
    ldh  a, [hActiveEntitySpriteVariant]               ; $7761: $F0 $F1
    cp   $01                                      ; $7763: $FE $01
    ld   a, $F8                                   ; $7765: $3E $F8
    jr   z, jr_015_776B                           ; $7767: $28 $02

    ld   a, $08                                   ; $7769: $3E $08

jr_015_776B:
    ld   hl, wEntitiesSpeedXTable                       ; $776B: $21 $40 $C2
    add  hl, de                                   ; $776E: $19
    ld   [hl], a                                  ; $776F: $77
    ld   hl, wEntitiesSpeedYTable                       ; $7770: $21 $50 $C2
    add  hl, de                                   ; $7773: $19
    ld   [hl], $0C                                ; $7774: $36 $0C
    ld   hl, wEntitiesUnknowTableL                ; $7776: $21 $40 $C3
    add  hl, de                                   ; $7779: $19
    ld   [hl], $12                                ; $777A: $36 $12
    ld   hl, wEntitiesUnknowTableH                ; $777C: $21 $30 $C4
    add  hl, de                                   ; $777F: $19
    set  0, [hl]                                  ; $7780: $CB $C6
    ld   a, $08                                   ; $7782: $3E $08
    ldh  [hJingle], a                             ; $7784: $E0 $F2
    ld   hl, wEntitiesTransitionCountdownTable    ; $7786: $21 $E0 $C2
    add  hl, de                                   ; $7789: $19
    ld   [hl], $60                                ; $778A: $36 $60
    ld   hl, wEntitiesUnknowTableP                ; $778C: $21 $40 $C4
    add  hl, de                                   ; $778F: $19
    ld   [hl], $01                                ; $7790: $36 $01

jr_015_7792:
    ret                                           ; $7792: $C9

    ld   a, $03                                   ; $7793: $3E $03
    call SetEntitySpriteVariant                   ; $7795: $CD $0C $3B
    call func_015_7B88                            ; $7798: $CD $88 $7B
    call func_015_7BC1                            ; $779B: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $779E: $21 $20 $C3
    add  hl, bc                                   ; $77A1: $09
    dec  [hl]                                     ; $77A2: $35
    dec  [hl]                                     ; $77A3: $35
    ld   hl, wEntitiesPosZTable                   ; $77A4: $21 $10 $C3
    add  hl, bc                                   ; $77A7: $09
    ld   a, [hl]                                  ; $77A8: $7E
    and  $80                                      ; $77A9: $E6 $80
    jr   z, jr_015_77BE                           ; $77AB: $28 $11

    ld   [hl], b                                  ; $77AD: $70
    ld   hl, wEntitiesSpeedZTable                 ; $77AE: $21 $20 $C3
    add  hl, bc                                   ; $77B1: $09
    ld   [hl], $20                                ; $77B2: $36 $20
    call ClearEntitySpeed                         ; $77B4: $CD $7F $3D
    call IncrementEntityWalkingAttr               ; $77B7: $CD $12 $3B

jr_015_77BA:
    ld   a, $14                                   ; $77BA: $3E $14
    ldh  [hWaveSfx], a                            ; $77BC: $E0 $F3

jr_015_77BE:
    ret                                           ; $77BE: $C9

    ld   a, $00                                   ; $77BF: $3E $00
    call SetEntitySpriteVariant                   ; $77C1: $CD $0C $3B
    call func_015_7B88                            ; $77C4: $CD $88 $7B
    call func_015_7BC1                            ; $77C7: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $77CA: $21 $20 $C3
    add  hl, bc                                   ; $77CD: $09
    dec  [hl]                                     ; $77CE: $35
    dec  [hl]                                     ; $77CF: $35
    ld   hl, wEntitiesPosZTable                   ; $77D0: $21 $10 $C3
    add  hl, bc                                   ; $77D3: $09
    ld   a, [hl]                                  ; $77D4: $7E
    and  $80                                      ; $77D5: $E6 $80
    jr   z, jr_015_77FE                           ; $77D7: $28 $25

    ld   [hl], $01                                ; $77D9: $36 $01
    call GetRandomByte                            ; $77DB: $CD $0D $28
    and  $0F                                      ; $77DE: $E6 $0F
    add  $08                                      ; $77E0: $C6 $08
    ld   hl, wEntitiesSpeedZTable                 ; $77E2: $21 $20 $C3
    add  hl, bc                                   ; $77E5: $09
    ld   [hl], a                                  ; $77E6: $77
    ld   a, $10                                   ; $77E7: $3E $10
    call GetVectorTowardsLink_trampoline          ; $77E9: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $77EC: $F0 $D7
    cpl                                           ; $77EE: $2F
    inc  a                                        ; $77EF: $3C
    ld   hl, wEntitiesSpeedYTable                       ; $77F0: $21 $50 $C2
    add  hl, bc                                   ; $77F3: $09
    ld   [hl], a                                  ; $77F4: $77
    ldh  a, [hScratch1]                           ; $77F5: $F0 $D8
    cpl                                           ; $77F7: $2F
    inc  a                                        ; $77F8: $3C
    ld   hl, wEntitiesSpeedXTable                       ; $77F9: $21 $40 $C2
    add  hl, bc                                   ; $77FC: $09
    ld   [hl], a                                  ; $77FD: $77

jr_015_77FE:
    ldh  a, [wActiveEntityPosX]                   ; $77FE: $F0 $EE
    cp   $A8                                      ; $7800: $FE $A8
    jp   nc, ClearEntityStatusAndReturn                       ; $7802: $D2 $31 $7C

    ldh  a, [wActiveEntityPosY]                   ; $7805: $F0 $EC
    cp   $80                                      ; $7807: $FE $80
    jp   nc, ClearEntityStatusAndReturn                       ; $7809: $D2 $31 $7C

    ldh  a, [hFrameCounter]                       ; $780C: $F0 $E7
    and  $0F                                      ; $780E: $E6 $0F
    jr   z, jr_015_77BA                           ; $7810: $28 $A8

    ret                                           ; $7812: $C9

    ld   a, h                                     ; $7813: $7C
    ld   bc, $017E                                ; $7814: $01 $7E $01
    ld   a, [hl]                                  ; $7817: $7E
    ld   hl, $217C                                ; $7818: $21 $7C $21
    nop                                           ; $781B: $00
    inc  c                                        ; $781C: $0C
    db   $10                                      ; $781D: $10
    inc  c                                        ; $781E: $0C
    nop                                           ; $781F: $00
    db   $F4                                      ; $7820: $F4
    ldh  a, [hNoiseSfx]                           ; $7821: $F0 $F4
    nop                                           ; $7823: $00
    inc  c                                        ; $7824: $0C

label_015_7825:
    ld   de, $7813                                ; $7825: $11 $13 $78
    call RenderAnimatedActiveEntity                               ; $7828: $CD $C0 $3B
    call func_015_7B0D                            ; $782B: $CD $0D $7B
    call func_015_7B3E                            ; $782E: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $7831: $F0 $E7
    rra                                           ; $7833: $1F
    rra                                           ; $7834: $1F
    rra                                           ; $7835: $1F
    rra                                           ; $7836: $1F
    and  $01                                      ; $7837: $E6 $01
    call SetEntitySpriteVariant                   ; $7839: $CD $0C $3B
    call label_3B39                               ; $783C: $CD $39 $3B
    call func_015_7B88                            ; $783F: $CD $88 $7B
    call func_015_7BC1                            ; $7842: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $7845: $21 $20 $C3
    add  hl, bc                                   ; $7848: $09
    dec  [hl]                                     ; $7849: $35
    dec  [hl]                                     ; $784A: $35
    ld   hl, wEntitiesPosZTable                   ; $784B: $21 $10 $C3
    add  hl, bc                                   ; $784E: $09
    ld   a, [hl]                                  ; $784F: $7E
    and  $80                                      ; $7850: $E6 $80
    jr   z, jr_015_788C                           ; $7852: $28 $38

    ld   [hl], b                                  ; $7854: $70
    call GetRandomByte                            ; $7855: $CD $0D $28
    and  $0F                                      ; $7858: $E6 $0F
    add  $10                                      ; $785A: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $785C: $21 $20 $C3
    add  hl, bc                                   ; $785F: $09
    ld   [hl], a                                  ; $7860: $77
    call GetRandomByte                            ; $7861: $CD $0D $28
    and  $07                                      ; $7864: $E6 $07
    ld   e, a                                     ; $7866: $5F
    ld   d, b                                     ; $7867: $50
    ld   hl, $781D                                ; $7868: $21 $1D $78
    add  hl, de                                   ; $786B: $19
    ld   a, [hl]                                  ; $786C: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $786D: $21 $40 $C2
    add  hl, bc                                   ; $7870: $09
    ld   [hl], a                                  ; $7871: $77
    ld   hl, $781B                                ; $7872: $21 $1B $78
    add  hl, de                                   ; $7875: $19
    ld   a, [hl]                                  ; $7876: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7877: $21 $50 $C2
    add  hl, bc                                   ; $787A: $09
    ld   [hl], a                                  ; $787B: $77
    ld   hl, wEntitiesUnknowTableY                ; $787C: $21 $D0 $C3
    add  hl, bc                                   ; $787F: $09
    ld   a, [hl]                                  ; $7880: $7E
    inc  [hl]                                     ; $7881: $34
    ld   a, [hl]                                  ; $7882: $7E
    cp   $04                                      ; $7883: $FE $04
    jp   z, ClearEntityStatusAndReturn            ; $7885: $CA $31 $7C

    ld   a, $09                                   ; $7888: $3E $09
    ldh  [hJingle], a                             ; $788A: $E0 $F2

jr_015_788C:
    ret                                           ; $788C: $C9

    ld   d, b                                     ; $788D: $50
    inc  bc                                       ; $788E: $03
    ld   d, d                                     ; $788F: $52
    inc  bc                                       ; $7890: $03
    ld   d, h                                     ; $7891: $54
    inc  bc                                       ; $7892: $03
    ld   d, [hl]                                  ; $7893: $56
    inc  bc                                       ; $7894: $03
    ld   d, d                                     ; $7895: $52
    inc  hl                                       ; $7896: $23
    ld   d, b                                     ; $7897: $50
    inc  hl                                       ; $7898: $23
    ld   d, [hl]                                  ; $7899: $56
    inc  hl                                       ; $789A: $23
    ld   d, h                                     ; $789B: $54
    inc  hl                                       ; $789C: $23

WitchRatEntityHandler::
    ld   hl, wEntitiesUnknowTableQ                ; $789D: $21 $80 $C3
    add  hl, bc                                   ; $78A0: $09
    ld   a, [hl]                                  ; $78A1: $7E
    and  a                                        ; $78A2: $A7
    jr   nz, jr_015_78AB                          ; $78A3: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]               ; $78A5: $F0 $F1
    add  $02                                      ; $78A7: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a               ; $78A9: $E0 $F1

jr_015_78AB:
    ld   de, $788D                                ; $78AB: $11 $8D $78
    call RenderAnimatedActiveEntity                               ; $78AE: $CD $C0 $3B
    call func_015_7B0D                            ; $78B1: $CD $0D $7B
    call func_015_7BC1                            ; $78B4: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $78B7: $21 $20 $C3
    add  hl, bc                                   ; $78BA: $09
    dec  [hl]                                     ; $78BB: $35
    dec  [hl]                                     ; $78BC: $35
    ld   hl, wEntitiesPosZTable                   ; $78BD: $21 $10 $C3
    add  hl, bc                                   ; $78C0: $09
    ld   a, [hl]                                  ; $78C1: $7E
    and  $80                                      ; $78C2: $E6 $80
    ldh  [hFFE8], a                               ; $78C4: $E0 $E8
    jr   z, jr_015_78CF                           ; $78C6: $28 $07

    xor  a                                        ; $78C8: $AF
    ld   [hl], a                                  ; $78C9: $77
    ld   hl, wEntitiesSpeedZTable                 ; $78CA: $21 $20 $C3
    add  hl, bc                                   ; $78CD: $09
    ld   [hl], a                                  ; $78CE: $77

jr_015_78CF:
    ldh  a, [hActiveEntityState]                  ; $78CF: $F0 $F0
    rst  $00                                      ; $78D1: $C7
    sbc  $78                                      ; $78D2: $DE $78
    ld   l, $79                                   ; $78D4: $2E $79
    ld   [bc], a                                  ; $78D6: $02
    ld   [SwitchBank], sp                         ; $78D7: $08 $0C $08
    cp   $F8                                      ; $78DA: $FE $F8
    db   $F4                                      ; $78DC: $F4
    ld   hl, sp-$33                               ; $78DD: $F8 $CD
    dec  b                                        ; $78DF: $05
    inc  c                                        ; $78E0: $0C
    jr   nz, jr_015_791A                          ; $78E1: $20 $37

    call GetRandomByte                            ; $78E3: $CD $0D $28
    and  $07                                      ; $78E6: $E6 $07
    ld   e, a                                     ; $78E8: $5F
    ld   d, b                                     ; $78E9: $50
    ld   hl, $78D6                                ; $78EA: $21 $D6 $78
    add  hl, de                                   ; $78ED: $19
    ld   a, [hl]                                  ; $78EE: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $78EF: $21 $40 $C2
    add  hl, bc                                   ; $78F2: $09
    ld   [hl], a                                  ; $78F3: $77
    ld   a, e                                     ; $78F4: $7B
    and  $04                                      ; $78F5: $E6 $04
    ld   hl, wEntitiesUnknowTableQ                ; $78F7: $21 $80 $C3
    add  hl, bc                                   ; $78FA: $09
    ld   [hl], a                                  ; $78FB: $77
    call GetRandomByte                            ; $78FC: $CD $0D $28
    and  $07                                      ; $78FF: $E6 $07
    ld   e, a                                     ; $7901: $5F
    ld   hl, $78D6                                ; $7902: $21 $D6 $78
    add  hl, de                                   ; $7905: $19
    ld   a, [hl]                                  ; $7906: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7907: $21 $50 $C2
    add  hl, bc                                   ; $790A: $09
    ld   [hl], a                                  ; $790B: $77
    call GetEntityTransitionCountdown             ; $790C: $CD $05 $0C
    call GetRandomByte                            ; $790F: $CD $0D $28
    and  $1F                                      ; $7912: $E6 $1F
    add  $30                                      ; $7914: $C6 $30
    ld   [hl], a                                  ; $7916: $77
    jp   IncrementEntityWalkingAttr               ; $7917: $C3 $12 $3B

jr_015_791A:
    ld   a, $01                                   ; $791A: $3E $01
    call SetEntitySpriteVariant                   ; $791C: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $791F: $F0 $E7
    and  $1F                                      ; $7921: $E6 $1F
    jr   nz, jr_015_792D                          ; $7923: $20 $08

    ld   hl, wEntitiesUnknowTableQ                ; $7925: $21 $80 $C3
    add  hl, bc                                   ; $7928: $09
    ld   a, [hl]                                  ; $7929: $7E
    xor  $04                                      ; $792A: $EE $04
    ld   [hl], a                                  ; $792C: $77

jr_015_792D:
    ret                                           ; $792D: $C9

    call func_015_7B88                            ; $792E: $CD $88 $7B
    call label_3B23                               ; $7931: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $7934: $F0 $E8
    and  a                                        ; $7936: $A7
    jr   z, jr_015_7950                           ; $7937: $28 $17

    call GetEntityTransitionCountdown             ; $7939: $CD $05 $0C
    jr   nz, jr_015_7945                          ; $793C: $20 $07

    ld   [hl], $48                                ; $793E: $36 $48
    call IncrementEntityWalkingAttr               ; $7940: $CD $12 $3B
    ld   [hl], b                                  ; $7943: $70
    ret                                           ; $7944: $C9

jr_015_7945:
    ld   hl, wEntitiesSpeedZTable                 ; $7945: $21 $20 $C3
    add  hl, bc                                   ; $7948: $09
    ld   [hl], $08                                ; $7949: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $794B: $21 $10 $C3
    add  hl, bc                                   ; $794E: $09
    inc  [hl]                                     ; $794F: $34

jr_015_7950:
    ld   a, $00                                   ; $7950: $3E $00
    jp   SetEntitySpriteVariant                   ; $7952: $C3 $0C $3B

    nop                                           ; $7955: $00
    ld   [$1810], sp                              ; $7956: $08 $10 $18
    jr   nz, jr_015_7983                          ; $7959: $20 $28

    jr   nc, func_015_7995                        ; $795B: $30 $38

func_015_795D::
    ld   hl, wEntitiesUnknowTableL                ; $795D: $21 $40 $C3
    add  hl, bc                                   ; $7960: $09
    ld   a, [hl]                                  ; $7961: $7E
    and  $0F                                      ; $7962: $E6 $0F

func_015_7964::
label_015_7964:
    sla  a                                        ; $7964: $CB $27
    sla  a                                        ; $7966: $CB $27
    ld   e, a                                     ; $7968: $5F
    ld   a, [$C3C0]                               ; $7969: $FA $C0 $C3
    add  e                                        ; $796C: $83
    cp   $60                                      ; $796D: $FE $60
    jr   c, jr_015_7973                           ; $796F: $38 $02

    sub  $60                                      ; $7971: $D6 $60

jr_015_7973:
    ld   [$C3C0], a                               ; $7973: $EA $C0 $C3
    ld   a, [$C3C1]                               ; $7976: $FA $C1 $C3
    add  e                                        ; $7979: $83
    ld   [$C3C1], a                               ; $797A: $EA $C1 $C3
    cp   $60                                      ; $797D: $FE $60
    jr   c, jr_015_7994                           ; $797F: $38 $13

    ldh  a, [hFrameCounter]                       ; $7981: $F0 $E7

jr_015_7983:
    ld   hl, wLinkWalkingFrameCount               ; $7983: $21 $23 $C1
    add  [hl]                                     ; $7986: $86
    and  $07                                      ; $7987: $E6 $07
    ld   e, a                                     ; $7989: $5F
    ld   d, $00                                   ; $798A: $16 $00
    ld   hl, $7955                                ; $798C: $21 $55 $79
    add  hl, de                                   ; $798F: $19
    ld   a, [hl]                                  ; $7990: $7E
    ld   [$C3C0], a                               ; $7991: $EA $C0 $C3

jr_015_7994:
    ret                                           ; $7994: $C9

func_015_7995::
    ldh  a, [hActiveEntityStatus]                 ; $7995: $F0 $EA
    cp   $07                                      ; $7997: $FE $07
    ret  z                                        ; $7999: $C8

    ld   hl, wEntitiesUnknowTableI                ; $799A: $21 $70 $C4
    add  hl, bc                                   ; $799D: $09
    ld   a, [hl]                                  ; $799E: $7E
    cp   $02                                      ; $799F: $FE $02
    jp   z, label_015_79DF                        ; $79A1: $CA $DF $79

    cp   $03                                      ; $79A4: $FE $03
    jp   z, label_015_7A27                        ; $79A6: $CA $27 $7A

    ld   hl, wEntitiesPosZTable                   ; $79A9: $21 $10 $C3
    add  hl, bc                                   ; $79AC: $09
    ld   a, [hl]                                  ; $79AD: $7E
    and  a                                        ; $79AE: $A7
    ret  z                                        ; $79AF: $C8

    ldh  a, [hIsSideScrolling]                    ; $79B0: $F0 $F9
    and  a                                        ; $79B2: $A7
    ret  nz                                       ; $79B3: $C0

    ld   hl, wEntitiesUnknowTableL                ; $79B4: $21 $40 $C3
    add  hl, bc                                   ; $79B7: $09
    ld   a, [hl]                                  ; $79B8: $7E
    and  $10                                      ; $79B9: $E6 $10
    ret  z                                        ; $79BB: $C8

    ldh  a, [hFrameCounter]                       ; $79BC: $F0 $E7
    xor  c                                        ; $79BE: $A9
    and  $01                                      ; $79BF: $E6 $01
    ret  nz                                       ; $79C1: $C0

    ld   a, [$C3C0]                               ; $79C2: $FA $C0 $C3
    ld   l, a                                     ; $79C5: $6F
    ld   h, $00                                   ; $79C6: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79C8: $11 $30 $C0
    add  hl, de                                   ; $79CB: $19
    ldh  a, [$FFEF]                               ; $79CC: $F0 $EF
    add  $0A                                      ; $79CE: $C6 $0A
    ld   [hl+], a                                 ; $79D0: $22
    ldh  a, [wActiveEntityPosX]                   ; $79D1: $F0 $EE
    add  $04                                      ; $79D3: $C6 $04
    ld   [hl+], a                                 ; $79D5: $22
    ld   a, $26                                   ; $79D6: $3E $26
    ld   [hl+], a                                 ; $79D8: $22
    ld   [hl], b                                  ; $79D9: $70
    ld   a, $01                                   ; $79DA: $3E $01
    jp   label_015_7964                           ; $79DC: $C3 $64 $79

label_015_79DF:
    ldh  a, [hActiveEntityType]                   ; $79DF: $F0 $EB
    cp   $02                                      ; $79E1: $FE $02
    jr   nz, jr_015_79F0                          ; $79E3: $20 $0B

    ld   hl, wActiveEntityPosY                    ; $79E5: $21 $EC $FF
    dec  [hl]                                     ; $79E8: $35
    dec  [hl]                                     ; $79E9: $35
    call func_015_79F0                            ; $79EA: $CD $F0 $79
    jp   label_3D8A                               ; $79ED: $C3 $8A $3D

func_015_79F0:
jr_015_79F0:
    ld   a, [$C3C0]                               ; $79F0: $FA $C0 $C3
    ld   l, a                                     ; $79F3: $6F
    ld   h, $00                                   ; $79F4: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79F6: $11 $30 $C0
    add  hl, de                                   ; $79F9: $19
    ld   e, $00                                   ; $79FA: $1E $00
    ldh  a, [hFrameCounter]                       ; $79FC: $F0 $E7
    and  $04                                      ; $79FE: $E6 $04
    jr   z, jr_015_7A04                           ; $7A00: $28 $02

    ld   e, $10                                   ; $7A02: $1E $10

jr_015_7A04:
    ldh  a, [wActiveEntityPosY]                   ; $7A04: $F0 $EC
    add  $0B                                      ; $7A06: $C6 $0B
    ld   [hl+], a                                 ; $7A08: $22
    ldh  a, [wActiveEntityPosX]                   ; $7A09: $F0 $EE
    ld   [hl+], a                                 ; $7A0B: $22
    ld   a, $1C                                   ; $7A0C: $3E $1C
    ld   [hl+], a                                 ; $7A0E: $22
    ld   a, e                                     ; $7A0F: $7B
    ld   [hl+], a                                 ; $7A10: $22
    ldh  a, [wActiveEntityPosY]                   ; $7A11: $F0 $EC
    add  $0B                                      ; $7A13: $C6 $0B
    ld   [hl+], a                                 ; $7A15: $22
    ldh  a, [wActiveEntityPosX]                   ; $7A16: $F0 $EE
    add  $08                                      ; $7A18: $C6 $08
    ld   [hl+], a                                 ; $7A1A: $22
    ld   a, $1C                                   ; $7A1B: $3E $1C
    ld   [hl+], a                                 ; $7A1D: $22
    ld   a, e                                     ; $7A1E: $7B
    or   $20                                      ; $7A1F: $F6 $20
    ld   [hl+], a                                 ; $7A21: $22
    ld   a, $02                                   ; $7A22: $3E $02
    jp   label_015_7964                           ; $7A24: $C3 $64 $79

label_015_7A27:
    push bc                                       ; $7A27: $C5
    ld   hl, wEntitiesUnknowTableY                ; $7A28: $21 $D0 $C3
    add  hl, bc                                   ; $7A2B: $09
    ld   e, [hl]                                  ; $7A2C: $5E
    ld   hl, wEntitiesSpeedXTable                       ; $7A2D: $21 $40 $C2
    add  hl, bc                                   ; $7A30: $09
    ld   a, [hl]                                  ; $7A31: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7A32: $21 $50 $C2
    add  hl, bc                                   ; $7A35: $09
    ld   c, b                                     ; $7A36: $48
    or   [hl]                                     ; $7A37: $B6
    jr   z, jr_015_7A40                           ; $7A38: $28 $06

    ld   a, e                                     ; $7A3A: $7B
    rla                                           ; $7A3B: $17
    rla                                           ; $7A3C: $17
    and  $20                                      ; $7A3D: $E6 $20
    ld   c, a                                     ; $7A3F: $4F

jr_015_7A40:
    ld   a, [$C3C0]                               ; $7A40: $FA $C0 $C3
    ld   l, a                                     ; $7A43: $6F
    ld   h, $00                                   ; $7A44: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $7A46: $11 $30 $C0
    add  hl, de                                   ; $7A49: $19
    ldh  a, [wActiveEntityPosY]                   ; $7A4A: $F0 $EC
    add  $08                                      ; $7A4C: $C6 $08
    ld   [hl+], a                                 ; $7A4E: $22
    ldh  a, [wActiveEntityPosX]                   ; $7A4F: $F0 $EE
    dec  a                                        ; $7A51: $3D
    ld   [hl+], a                                 ; $7A52: $22
    ld   a, $1A                                   ; $7A53: $3E $1A
    ld   [hl+], a                                 ; $7A55: $22
    ld   a, c                                     ; $7A56: $79
    ld   [hl+], a                                 ; $7A57: $22
    ldh  a, [wActiveEntityPosY]                   ; $7A58: $F0 $EC
    add  $08                                      ; $7A5A: $C6 $08
    ld   [hl+], a                                 ; $7A5C: $22
    ldh  a, [wActiveEntityPosX]                   ; $7A5D: $F0 $EE
    add  $07                                      ; $7A5F: $C6 $07
    ld   [hl+], a                                 ; $7A61: $22
    ld   a, $1A                                   ; $7A62: $3E $1A
    ld   [hl+], a                                 ; $7A64: $22
    ld   a, c                                     ; $7A65: $79
    ld   [hl], a                                  ; $7A66: $77
    pop  bc                                       ; $7A67: $C1
    ld   a, $02                                   ; $7A68: $3E $02
    jp   label_015_7964                           ; $7A6A: $C3 $64 $79

    ret                                           ; $7A6D: $C9

func_015_7A6E:
    call label_3B5A                               ; $7A6E: $CD $5A $3B
    jr   nc, jr_015_7A9A                          ; $7A71: $30 $27

    call CopyLinkFinalPositionToPosition          ; $7A73: $CD $BE $0C
    ld   a, [$C1A6]                               ; $7A76: $FA $A6 $C1
    and  a                                        ; $7A79: $A7
    jr   z, jr_015_7A8D                           ; $7A7A: $28 $11

    ld   e, a                                     ; $7A7C: $5F
    ld   d, b                                     ; $7A7D: $50
    ld   hl, $C39F                                ; $7A7E: $21 $9F $C3
    add  hl, de                                   ; $7A81: $19
    ld   a, [hl]                                  ; $7A82: $7E
    cp   $03                                      ; $7A83: $FE $03
    jr   nz, jr_015_7A8D                          ; $7A85: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $7A87: $21 $8F $C2
    add  hl, de                                   ; $7A8A: $19
    ld   [hl], $00                                ; $7A8B: $36 $00

jr_015_7A8D:
    ld   a, [wIsRunningWithPegasusBoots]          ; $7A8D: $FA $4A $C1
    ld   e, a                                     ; $7A90: $5F
    call ResetPegasusBoots                                ; $7A91: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $7A94: $CD $8E $17
    ld   a, e                                     ; $7A97: $7B
    scf                                           ; $7A98: $37
    ret                                           ; $7A99: $C9

jr_015_7A9A:
    and  a                                        ; $7A9A: $A7
    ret                                           ; $7A9B: $C9

    ld   b, $04                                   ; $7A9C: $06 $04
    ld   [bc], a                                  ; $7A9E: $02
    nop                                           ; $7A9F: $00
    ld   hl, wEntitiesUnknowTableQ                ; $7AA0: $21 $80 $C3
    add  hl, bc                                   ; $7AA3: $09
    ld   e, [hl]                                  ; $7AA4: $5E
    ld   d, b                                     ; $7AA5: $50
    ld   hl, $7A9C                                ; $7AA6: $21 $9C $7A
    add  hl, de                                   ; $7AA9: $19
    push hl                                       ; $7AAA: $E5
    ld   hl, wEntitiesUnknowTableY                ; $7AAB: $21 $D0 $C3
    add  hl, bc                                   ; $7AAE: $09
    inc  [hl]                                     ; $7AAF: $34
    ld   a, [hl]                                  ; $7AB0: $7E
    rra                                           ; $7AB1: $1F
    rra                                           ; $7AB2: $1F
    rra                                           ; $7AB3: $1F
    rra                                           ; $7AB4: $1F
    pop  hl                                       ; $7AB5: $E1
    and  $01                                      ; $7AB6: $E6 $01
    or   [hl]                                     ; $7AB8: $B6
    jp   SetEntitySpriteVariant                   ; $7AB9: $C3 $0C $3B

; Tell if the player is currently trying to talk to an entity.
; That is when:
;  - Link is close to the entity
;  - Link is facing the entity
;  - A dialog box can appear at this time
;  - The A button is pressed
;
; Return:
;   The carry flag is set if Link is trying to talk to the entity.
;   It is not set otherwise.
ShouldLinkTalkToEntity::
    ld   e, b                                     ; $7ABC: $58
    ldh  a, [hLinkPositionY]                      ; $7ABD: $F0 $99
    ld   hl, $FFEF                                ; $7ABF: $21 $EF $FF
    sub  [hl]                                     ; $7AC2: $96
    add  $14                                      ; $7AC3: $C6 $14
    cp   $28                                      ; $7AC5: $FE $28
    jr   nc, jr_015_7B0B                          ; $7AC7: $30 $42

    ldh  a, [hLinkPositionX]                      ; $7AC9: $F0 $98
    ld   hl, wActiveEntityPosX                    ; $7ACB: $21 $EE $FF
    sub  [hl]                                     ; $7ACE: $96
    add  $10                                      ; $7ACF: $C6 $10
    cp   $20                                      ; $7AD1: $FE $20
    jr   nc, jr_015_7B0B                          ; $7AD3: $30 $36

    inc  e                                        ; $7AD5: $1C
    push de                                       ; $7AD6: $D5
    call func_015_7C0A                            ; $7AD7: $CD $0A $7C
    ldh  a, [hLinkDirection]                      ; $7ADA: $F0 $9E
    xor  $01                                      ; $7ADC: $EE $01
    cp   e                                        ; $7ADE: $BB
    pop  de                                       ; $7ADF: $D1
    jr   nz, jr_015_7B0B                          ; $7AE0: $20 $29

    ld   hl, $C1AD                                ; $7AE2: $21 $AD $C1
    ld   [hl], $01                                ; $7AE5: $36 $01
    ld   a, [wDialogState]                        ; $7AE7: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7AEA: $21 $4F $C1
    or   [hl]                                     ; $7AED: $B6
    ld   hl, $C146                                ; $7AEE: $21 $46 $C1
    or   [hl]                                     ; $7AF1: $B6
    ld   hl, $C134                                ; $7AF2: $21 $34 $C1
    or   [hl]                                     ; $7AF5: $B6
    ld   hl, $DE05                                ; $7AF6: $21 $05 $DE
    or   [hl]                                     ; $7AF9: $B6
    jr   nz, jr_015_7B0B                          ; $7AFA: $20 $0F

    ld   a, [wWindowY]                            ; $7AFC: $FA $9A $DB
    cp   $80                                      ; $7AFF: $FE $80
    jr   nz, jr_015_7B0B                          ; $7B01: $20 $08

    ldh  a, [hJoypadState]                               ; $7B03: $F0 $CC
    and  $10                                      ; $7B05: $E6 $10
    jr   z, jr_015_7B0B                           ; $7B07: $28 $02

    scf                                           ; $7B09: $37
    ret                                           ; $7B0A: $C9

jr_015_7B0B:
    and  a                                        ; $7B0B: $A7
    ret                                           ; $7B0C: $C9

func_015_7B0D:
    ldh  a, [hActiveEntityStatus]                 ; $7B0D: $F0 $EA
    cp   $05                                      ; $7B0F: $FE $05
    jr   nz, jr_015_7B3C                          ; $7B11: $20 $29

func_015_7B13:
    ld   a, [wGameplayType]                       ; $7B13: $FA $95 $DB
    cp   $07                                      ; $7B16: $FE $07
    jr   z, jr_015_7B3C                           ; $7B18: $28 $22

    cp   $01                                      ; $7B1A: $FE $01
    jr   z, jr_015_7B29                           ; $7B1C: $28 $0B

    cp   $0B                                      ; $7B1E: $FE $0B
    jr   nz, jr_015_7B3C                          ; $7B20: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7B22: $FA $6B $C1
    cp   $04                                      ; $7B25: $FE $04
    jr   nz, jr_015_7B3C                          ; $7B27: $20 $13

jr_015_7B29:
    ld   hl, $C1A8                                ; $7B29: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7B2C: $FA $9F $C1
    or   [hl]                                     ; $7B2F: $B6
    ld   hl, wInventoryAppearing                  ; $7B30: $21 $4F $C1
    or   [hl]                                     ; $7B33: $B6
    jr   nz, jr_015_7B3C                          ; $7B34: $20 $06

    ld   a, [wRoomTransitionState]                ; $7B36: $FA $24 $C1
    and  a                                        ; $7B39: $A7
    jr   z, jr_015_7B3D                           ; $7B3A: $28 $01

jr_015_7B3C:
    pop  af                                       ; $7B3C: $F1

jr_015_7B3D:
    ret                                           ; $7B3D: $C9

func_015_7B3E:
    ld   hl, wEntitiesUnknowTableT                ; $7B3E: $21 $10 $C4
    add  hl, bc                                   ; $7B41: $09
    ld   a, [hl]                                  ; $7B42: $7E
    and  a                                        ; $7B43: $A7
    jr   z, jr_015_7B87                           ; $7B44: $28 $41

    dec  a                                        ; $7B46: $3D
    ld   [hl], a                                  ; $7B47: $77
    call label_3E8E                               ; $7B48: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                       ; $7B4B: $21 $40 $C2
    add  hl, bc                                   ; $7B4E: $09
    ld   a, [hl]                                  ; $7B4F: $7E
    push af                                       ; $7B50: $F5
    ld   hl, wEntitiesSpeedYTable                       ; $7B51: $21 $50 $C2
    add  hl, bc                                   ; $7B54: $09
    ld   a, [hl]                                  ; $7B55: $7E
    push af                                       ; $7B56: $F5
    ld   hl, $C3F0                                ; $7B57: $21 $F0 $C3
    add  hl, bc                                   ; $7B5A: $09
    ld   a, [hl]                                  ; $7B5B: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $7B5C: $21 $40 $C2
    add  hl, bc                                   ; $7B5F: $09
    ld   [hl], a                                  ; $7B60: $77
    ld   hl, wEntitiesUnknowTableS                ; $7B61: $21 $00 $C4
    add  hl, bc                                   ; $7B64: $09
    ld   a, [hl]                                  ; $7B65: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $7B66: $21 $50 $C2
    add  hl, bc                                   ; $7B69: $09
    ld   [hl], a                                  ; $7B6A: $77
    call func_015_7B88                            ; $7B6B: $CD $88 $7B
    ld   hl, wEntitiesUnknowTableH                ; $7B6E: $21 $30 $C4
    add  hl, bc                                   ; $7B71: $09
    ld   a, [hl]                                  ; $7B72: $7E
    and  $20                                      ; $7B73: $E6 $20
    jr   nz, jr_015_7B7A                          ; $7B75: $20 $03

    call label_3B23                               ; $7B77: $CD $23 $3B

jr_015_7B7A:
    ld   hl, wEntitiesSpeedYTable                       ; $7B7A: $21 $50 $C2
    add  hl, bc                                   ; $7B7D: $09
    pop  af                                       ; $7B7E: $F1
    ld   [hl], a                                  ; $7B7F: $77
    ld   hl, wEntitiesSpeedXTable                       ; $7B80: $21 $40 $C2
    add  hl, bc                                   ; $7B83: $09
    pop  af                                       ; $7B84: $F1
    ld   [hl], a                                  ; $7B85: $77
    pop  af                                       ; $7B86: $F1

jr_015_7B87:
    ret                                           ; $7B87: $C9

func_015_7B88:
label_015_7B88:
    call func_015_7B95                            ; $7B88: $CD $95 $7B

func_015_7B8B:
label_015_7B8B:
    push bc                                       ; $7B8B: $C5
    ld   a, c                                     ; $7B8C: $79
    add  $10                                      ; $7B8D: $C6 $10
    ld   c, a                                     ; $7B8F: $4F
    call func_015_7B95                            ; $7B90: $CD $95 $7B
    pop  bc                                       ; $7B93: $C1
    ret                                           ; $7B94: $C9

func_015_7B95:
    ld   hl, wEntitiesSpeedXTable                       ; $7B95: $21 $40 $C2
    add  hl, bc                                   ; $7B98: $09
    ld   a, [hl]                                  ; $7B99: $7E
    and  a                                        ; $7B9A: $A7
    jr   z, jr_015_7BC0                           ; $7B9B: $28 $23

    push af                                       ; $7B9D: $F5
    swap a                                        ; $7B9E: $CB $37
    and  $F0                                      ; $7BA0: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $7BA2: $21 $60 $C2
    add  hl, bc                                   ; $7BA5: $09
    add  [hl]                                     ; $7BA6: $86
    ld   [hl], a                                  ; $7BA7: $77
    rl   d                                        ; $7BA8: $CB $12
    ld   hl, wEntitiesPosXTable                         ; $7BAA: $21 $00 $C2

jr_015_7BAD:
    add  hl, bc                                   ; $7BAD: $09
    pop  af                                       ; $7BAE: $F1
    ld   e, $00                                   ; $7BAF: $1E $00
    bit  7, a                                     ; $7BB1: $CB $7F
    jr   z, jr_015_7BB7                           ; $7BB3: $28 $02

    ld   e, $F0                                   ; $7BB5: $1E $F0

jr_015_7BB7:
    swap a                                        ; $7BB7: $CB $37
    and  $0F                                      ; $7BB9: $E6 $0F
    or   e                                        ; $7BBB: $B3
    rr   d                                        ; $7BBC: $CB $1A
    adc  [hl]                                     ; $7BBE: $8E
    ld   [hl], a                                  ; $7BBF: $77

jr_015_7BC0:
    ret                                           ; $7BC0: $C9

func_015_7BC1:
    ld   hl, wEntitiesSpeedZTable                 ; $7BC1: $21 $20 $C3
    add  hl, bc                                   ; $7BC4: $09
    ld   a, [hl]                                  ; $7BC5: $7E
    and  a                                        ; $7BC6: $A7
    jr   z, jr_015_7BC0                           ; $7BC7: $28 $F7

    push af                                       ; $7BC9: $F5
    swap a                                        ; $7BCA: $CB $37
    and  $F0                                      ; $7BCC: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $7BCE: $21 $30 $C3
    add  hl, bc                                   ; $7BD1: $09
    add  [hl]                                     ; $7BD2: $86
    ld   [hl], a                                  ; $7BD3: $77
    rl   d                                        ; $7BD4: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7BD6: $21 $10 $C3
    jr   jr_015_7BAD                              ; $7BD9: $18 $D2

func_015_7BDB:
    ld   e, $00                                   ; $7BDB: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7BDD: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $7BDF: $21 $00 $C2
    add  hl, bc                                   ; $7BE2: $09
    sub  [hl]                                     ; $7BE3: $96
    bit  7, a                                     ; $7BE4: $CB $7F
    jr   z, jr_015_7BE9                           ; $7BE6: $28 $01

    inc  e                                        ; $7BE8: $1C

jr_015_7BE9:
    ld   d, a                                     ; $7BE9: $57
    ret                                           ; $7BEA: $C9

func_015_7BEB:
    ld   e, $02                                   ; $7BEB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BED: $F0 $99
    ld   hl, wEntitiesPosYTable                         ; $7BEF: $21 $10 $C2
    add  hl, bc                                   ; $7BF2: $09
    sub  [hl]                                     ; $7BF3: $96
    bit  7, a                                     ; $7BF4: $CB $7F
    jr   nz, jr_015_7BF9                          ; $7BF6: $20 $01

    inc  e                                        ; $7BF8: $1C

jr_015_7BF9:
    ld   d, a                                     ; $7BF9: $57
    ret                                           ; $7BFA: $C9

    ld   e, $02                                   ; $7BFB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BFD: $F0 $99
    ld   hl, wActiveEntityPosY                    ; $7BFF: $21 $EC $FF
    sub  [hl]                                     ; $7C02: $96
    bit  7, a                                     ; $7C03: $CB $7F
    jr   nz, jr_015_7C08                          ; $7C05: $20 $01

    inc  e                                        ; $7C07: $1C

jr_015_7C08:
    ld   d, a                                     ; $7C08: $57
    ret                                           ; $7C09: $C9

func_015_7C0A:
    call func_015_7BDB                            ; $7C0A: $CD $DB $7B
    ld   a, e                                     ; $7C0D: $7B
    ldh  [hScratch0], a                           ; $7C0E: $E0 $D7
    ld   a, d                                     ; $7C10: $7A
    bit  7, a                                     ; $7C11: $CB $7F
    jr   z, jr_015_7C17                           ; $7C13: $28 $02

    cpl                                           ; $7C15: $2F
    inc  a                                        ; $7C16: $3C

jr_015_7C17:
    push af                                       ; $7C17: $F5
    call func_015_7BEB                            ; $7C18: $CD $EB $7B
    ld   a, e                                     ; $7C1B: $7B
    ldh  [hScratch1], a                           ; $7C1C: $E0 $D8
    ld   a, d                                     ; $7C1E: $7A
    bit  7, a                                     ; $7C1F: $CB $7F
    jr   z, jr_015_7C25                           ; $7C21: $28 $02

    cpl                                           ; $7C23: $2F
    inc  a                                        ; $7C24: $3C

jr_015_7C25:
    pop  de                                       ; $7C25: $D1
    cp   d                                        ; $7C26: $BA
    jr   nc, jr_015_7C2D                          ; $7C27: $30 $04

    ldh  a, [hScratch0]                           ; $7C29: $F0 $D7
    jr   jr_015_7C2F                              ; $7C2B: $18 $02

jr_015_7C2D:
    ldh  a, [hScratch1]                           ; $7C2D: $F0 $D8

jr_015_7C2F:
    ld   e, a                                     ; $7C2F: $5F
    ret                                           ; $7C30: $C9

ClearEntityStatus::
ClearEntityStatusAndReturn::
    ld   hl, wEntitiesStatusTable                        ; $7C31: $21 $80 $C2
    add  hl, bc                                   ; $7C34: $09
    ld   [hl], b                                  ; $7C35: $70
    ret                                           ; $7C36: $C9

label_015_7C37:
    ld   hl, wEntitiesUnknownTableC               ; $7C37: $21 $C0 $C2
    add  hl, bc                                   ; $7C3A: $09
    ld   a, [hl]                                  ; $7C3B: $7E
    rst  $00                                      ; $7C3C: $C7
    ld   b, e                                     ; $7C3D: $43
    ld   a, h                                     ; $7C3E: $7C
    ld   d, h                                     ; $7C3F: $54
    ld   a, h                                     ; $7C40: $7C
    ld   h, e                                     ; $7C41: $63
    ld   a, h                                     ; $7C42: $7C
    call GetEntityTransitionCountdown             ; $7C43: $CD $05 $0C
    ld   [hl], $A0                                ; $7C46: $36 $A0
    ld   hl, wEntitiesUnknowTableU                ; $7C48: $21 $20 $C4
    add  hl, bc                                   ; $7C4B: $09
    ld   [hl], $FF                                ; $7C4C: $36 $FF

label_015_7C4E:
    ld   hl, wEntitiesUnknownTableC               ; $7C4E: $21 $C0 $C2
    add  hl, bc                                   ; $7C51: $09
    inc  [hl]                                     ; $7C52: $34
    ret                                           ; $7C53: $C9

    call GetEntityTransitionCountdown             ; $7C54: $CD $05 $0C
    ret  nz                                       ; $7C57: $C0

    ld   [hl], $C0                                ; $7C58: $36 $C0
    ld   hl, wEntitiesUnknowTableU                ; $7C5A: $21 $20 $C4
    add  hl, bc                                   ; $7C5D: $09
    ld   [hl], $FF                                ; $7C5E: $36 $FF
    jp   label_015_7C4E                           ; $7C60: $C3 $4E $7C

    call GetEntityTransitionCountdown             ; $7C63: $CD $05 $0C
    jr   nz, jr_015_7C6E                          ; $7C66: $20 $06

    call PlayBombExplosionSfx                     ; $7C68: $CD $4B $0C
    jp   label_3F50                               ; $7C6B: $C3 $50 $3F

jr_015_7C6E:
    jp   label_015_7C71                           ; $7C6E: $C3 $71 $7C

label_015_7C71:
    and  $07                                      ; $7C71: $E6 $07
    ret  nz                                       ; $7C73: $C0

    call GetRandomByte                            ; $7C74: $CD $0D $28
    and  $1F                                      ; $7C77: $E6 $1F
    sub  $10                                      ; $7C79: $D6 $10
    ld   e, a                                     ; $7C7B: $5F
    ld   hl, wActiveEntityPosX                    ; $7C7C: $21 $EE $FF
    add  [hl]                                     ; $7C7F: $86
    ld   [hl], a                                  ; $7C80: $77
    call GetRandomByte                            ; $7C81: $CD $0D $28
    and  $1F                                      ; $7C84: $E6 $1F
    sub  $14                                      ; $7C86: $D6 $14
    ld   e, a                                     ; $7C88: $5F
    ld   hl, wActiveEntityPosY                    ; $7C89: $21 $EC $FF
    add  [hl]                                     ; $7C8C: $86
    ld   [hl], a                                  ; $7C8D: $77
    jp   label_015_7C91                           ; $7C8E: $C3 $91 $7C

label_015_7C91:
    call func_015_7B13                            ; $7C91: $CD $13 $7B
    ldh  a, [wActiveEntityPosX]                   ; $7C94: $F0 $EE
    ldh  [hScratch0], a                           ; $7C96: $E0 $D7
    ldh  a, [wActiveEntityPosY]                   ; $7C98: $F0 $EC
    ldh  [hScratch1], a                           ; $7C9A: $E0 $D8
    ld   a, $02                                   ; $7C9C: $3E $02
    call label_CC7                                ; $7C9E: $CD $C7 $0C
    ld   a, $13                                   ; $7CA1: $3E $13
    ldh  [hNoiseSfx], a                           ; $7CA3: $E0 $F4
    ret                                           ; $7CA5: $C9

    ld   a, $36                                   ; $7CA6: $3E $36
    call func_003_64CA_trampoline                               ; $7CA8: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7CAB: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7CAD: $21 $00 $C2
    add  hl, de                                   ; $7CB0: $19
    ld   [hl], a                                  ; $7CB1: $77
    ldh  a, [hScratch1]                           ; $7CB2: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7CB4: $21 $10 $C2
    add  hl, de                                   ; $7CB7: $19
    ld   [hl], a                                  ; $7CB8: $77
    ldh  a, [hIsSideScrolling]                    ; $7CB9: $F0 $F9
    and  a                                        ; $7CBB: $A7
    jr   z, jr_015_7CC6                           ; $7CBC: $28 $08

    ld   hl, wEntitiesSpeedYTable                       ; $7CBE: $21 $50 $C2
    add  hl, bc                                   ; $7CC1: $09
    ld   [hl], $F0                                ; $7CC2: $36 $F0
    jr   jr_015_7CD2                              ; $7CC4: $18 $0C

jr_015_7CC6:
    ld   hl, wEntitiesSpeedZTable                 ; $7CC6: $21 $20 $C3
    add  hl, de                                   ; $7CC9: $19
    ld   [hl], $10                                ; $7CCA: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7CCC: $21 $10 $C3
    add  hl, de                                   ; $7CCF: $19
    ld   [hl], $08                                ; $7CD0: $36 $08

jr_015_7CD2:
    call ClearEntityStatus                        ; $7CD2: $CD $31 $7C
    ld   hl, hNoiseSfx                            ; $7CD5: $21 $F4 $FF
    ld   [hl], $1A                                ; $7CD8: $36 $1A
    ret                                           ; $7CDA: $C9

func_015_7CDB:
    ld   hl, wOverworldRoomStatus                 ; $7CDB: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7CDE: $F0 $F6
    ld   e, a                                     ; $7CE0: $5F
    ld   a, [wIsIndoor]                           ; $7CE1: $FA $A5 $DB
    ld   d, a                                     ; $7CE4: $57
    ldh  a, [hMapId]                              ; $7CE5: $F0 $F7
    cp   $1A                                      ; $7CE7: $FE $1A
    jr   nc, jr_015_7CF0                          ; $7CE9: $30 $05

    cp   $06                                      ; $7CEB: $FE $06
    jr   c, jr_015_7CF0                           ; $7CED: $38 $01

    inc  d                                        ; $7CEF: $14

jr_015_7CF0:
    add  hl, de                                   ; $7CF0: $19
    ld   a, [hl]                                  ; $7CF1: $7E
    or   $20                                      ; $7CF2: $F6 $20
    ld   [hl], a                                  ; $7CF4: $77
    ldh  [hRoomStatus], a                         ; $7CF5: $E0 $F8
    ret                                           ; $7CF7: $C9

DreamShrineBedEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $7CF8: $F0 $F0
    rst  $00                                      ; $7CFA: $C7
    ld   bc, $787D                                ; $7CFB: $01 $7D $78
    ld   a, l                                     ; $7CFE: $7D
    ld   sp, $CD7E                                ; $7CFF: $31 $7E $CD
    db   $DB                                      ; $7D02: $DB
    ld   a, e                                     ; $7D03: $7B
    add  $0E                                      ; $7D04: $C6 $0E
    cp   $1C                                      ; $7D06: $FE $1C
    jr   nc, jr_015_7D4F                          ; $7D08: $30 $45

    call func_015_7BEB                            ; $7D0A: $CD $EB $7B
    add  $0C                                      ; $7D0D: $C6 $0C
    cp   $18                                      ; $7D0F: $FE $18
    jr   nc, jr_015_7D4F                          ; $7D11: $30 $3C

    ldh  a, [hLinkDirection]                      ; $7D13: $F0 $9E
    and  a                                        ; $7D15: $A7
    jr   nz, jr_015_7D4F                          ; $7D16: $20 $37

    ld   a, [wCollisionType]                      ; $7D18: $FA $33 $C1
    and  a                                        ; $7D1B: $A7
    jr   z, jr_015_7D4F                           ; $7D1C: $28 $31

    call IncrementEntityWalkingAttr               ; $7D1E: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7D21: $CD $05 $0C
    ld   [hl], $A0                                ; $7D24: $36 $A0
    ld   a, $01                                   ; $7D26: $3E $01
    ldh  [$FFA2], a                               ; $7D28: $E0 $A2
    ld   a, $02                                   ; $7D2A: $3E $02
    ld   [$C146], a                               ; $7D2C: $EA $46 $C1
    ld   a, $12                                   ; $7D2F: $3E $12
    ldh  [$FFA3], a                               ; $7D31: $E0 $A3
    ld   a, $0C                                   ; $7D33: $3E $0C
    ldh  [hLinkPositionXIncrement], a             ; $7D35: $E0 $9A
    xor  a                                        ; $7D37: $AF
    ldh  [hLinkPositionYIncrement], a             ; $7D38: $E0 $9B
    ld   a, $00                                   ; $7D3A: $3E $00
    ldh  [hLinkDirection], a                      ; $7D3C: $E0 $9E
    ld   a, $01                                   ; $7D3E: $3E $01
    ld   [wC10A], a                               ; $7D40: $EA $0A $C1
    ld   a, $1E                                   ; $7D43: $3E $1E
    ld   [wActiveMusicTrack], a                   ; $7D45: $EA $68 $D3
    xor  a                                        ; $7D48: $AF
    ld   [wTransitionSequenceCounter], a          ; $7D49: $EA $6B $C1
    ld   [wC16C], a                               ; $7D4C: $EA $6C $C1

jr_015_7D4F:
    ret                                           ; $7D4F: $C9

    ld   d, b                                     ; $7D50: $50
    rlca                                          ; $7D51: $07
    ld   d, d                                     ; $7D52: $52
    rlca                                          ; $7D53: $07
    ld   d, h                                     ; $7D54: $54
    nop                                           ; $7D55: $00
    ld   d, [hl]                                  ; $7D56: $56
    nop                                           ; $7D57: $00
    ld   d, b                                     ; $7D58: $50
    rlca                                          ; $7D59: $07
    ld   d, d                                     ; $7D5A: $52
    rlca                                          ; $7D5B: $07
    ld   d, h                                     ; $7D5C: $54
    ld   [bc], a                                  ; $7D5D: $02
    ld   d, [hl]                                  ; $7D5E: $56
    ld   [bc], a                                  ; $7D5F: $02
    ld   d, b                                     ; $7D60: $50
    rlca                                          ; $7D61: $07
    ld   d, d                                     ; $7D62: $52
    rlca                                          ; $7D63: $07
    ld   d, h                                     ; $7D64: $54
    inc  bc                                       ; $7D65: $03
    ld   d, [hl]                                  ; $7D66: $56
    inc  bc                                       ; $7D67: $03
    nop                                           ; $7D68: $00
    nop                                           ; $7D69: $00
    ld   e, [hl]                                  ; $7D6A: $5E
    ld   b, $00                                   ; $7D6B: $06 $00
    ld   [$265E], sp                              ; $7D6D: $08 $5E $26
    sbc  b                                        ; $7D70: $98
    ld   b, d                                     ; $7D71: $42
    sbc  b                                        ; $7D72: $98
    ld   d, b                                     ; $7D73: $50
    sbc  c                                        ; $7D74: $99
    sub  b                                        ; $7D75: $90
    sbc  c                                        ; $7D76: $99
    add  d                                        ; $7D77: $82
    ld   a, [$C146]                               ; $7D78: $FA $46 $C1
    and  a                                        ; $7D7B: $A7
    ret  nz                                       ; $7D7C: $C0

    call GetEntityTransitionCountdown             ; $7D7D: $CD $05 $0C
    jr   nz, jr_015_7D94                          ; $7D80: $20 $12

    ld   a, $01                                   ; $7D82: $3E $01
    ld   [wTransitionGfx], a                      ; $7D84: $EA $7F $C1
    xor  a                                        ; $7D87: $AF
    ld   [wTransitionGfxFrameCount], a            ; $7D88: $EA $80 $C1
    ld   a, $08                                   ; $7D8B: $3E $08
    ld   [$C3CA], a                               ; $7D8D: $EA $CA $C3
    call IncrementEntityWalkingAttr               ; $7D90: $CD $12 $3B
    xor  a                                        ; $7D93: $AF

jr_015_7D94:
    push af                                       ; $7D94: $F5
    cp   $80                                      ; $7D95: $FE $80
    jr   nc, jr_015_7DEC                          ; $7D97: $30 $53

    push af                                       ; $7D99: $F5
    and  $1F                                      ; $7D9A: $E6 $1F
    jr   nz, jr_015_7DAF                          ; $7D9C: $20 $11

    ld   a, [wTransitionSequenceCounter]          ; $7D9E: $FA $6B $C1
    cp   $02                                      ; $7DA1: $FE $02
    jr   z, jr_015_7DAF                           ; $7DA3: $28 $0A

    ld   a, $03                                   ; $7DA5: $3E $03
    ld   [wC16C], a                               ; $7DA7: $EA $6C $C1
    push bc                                       ; $7DAA: $C5
    call label_1A22                               ; $7DAB: $CD $22 $1A
    pop  bc                                       ; $7DAE: $C1

jr_015_7DAF:
    pop  af                                       ; $7DAF: $F1
    and  $0F                                      ; $7DB0: $E6 $0F
    jr   nz, jr_015_7DEC                          ; $7DB2: $20 $38

    ld   hl, wEntitiesUnknownTableC               ; $7DB4: $21 $C0 $C2
    add  hl, bc                                   ; $7DB7: $09
    ld   a, [hl]                                  ; $7DB8: $7E
    cp   $04                                      ; $7DB9: $FE $04
    jr   z, jr_015_7DEC                           ; $7DBB: $28 $2F

    ld   a, [wRequests]                           ; $7DBD: $FA $00 $D6
    ld   e, a                                     ; $7DC0: $5F
    ld   d, b                                     ; $7DC1: $50
    add  $05                                      ; $7DC2: $C6 $05
    ld   [wRequests], a                           ; $7DC4: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $7DC7: $21 $01 $D6
    add  hl, de                                   ; $7DCA: $19
    push hl                                       ; $7DCB: $E5
    ld   hl, wEntitiesUnknownTableC               ; $7DCC: $21 $C0 $C2
    add  hl, bc                                   ; $7DCF: $09
    ld   a, [hl]                                  ; $7DD0: $7E
    inc  [hl]                                     ; $7DD1: $34
    sla  a                                        ; $7DD2: $CB $27
    ld   e, a                                     ; $7DD4: $5F
    ld   d, b                                     ; $7DD5: $50
    ld   hl, $7D70                                ; $7DD6: $21 $70 $7D
    add  hl, de                                   ; $7DD9: $19
    ld   e, l                                     ; $7DDA: $5D
    ld   d, h                                     ; $7DDB: $54
    pop  hl                                       ; $7DDC: $E1
    ld   a, [de]                                  ; $7DDD: $1A
    inc  de                                       ; $7DDE: $13
    ld   [hl+], a                                 ; $7DDF: $22
    ld   a, [de]                                  ; $7DE0: $1A
    ld   [hl+], a                                 ; $7DE1: $22
    ld   a, $01                                   ; $7DE2: $3E $01
    ld   [hl+], a                                 ; $7DE4: $22
    ld   a, $64                                   ; $7DE5: $3E $64
    ld   [hl+], a                                 ; $7DE7: $22
    ld   a, $65                                   ; $7DE8: $3E $65
    ld   [hl+], a                                 ; $7DEA: $22
    ld   [hl], b                                  ; $7DEB: $70

jr_015_7DEC:
    pop  af                                       ; $7DEC: $F1
    ld   e, $00                                   ; $7DED: $1E $00
    cp   $80                                      ; $7DEF: $FE $80
    jr   c, jr_015_7DF4                           ; $7DF1: $38 $01

    inc  e                                        ; $7DF3: $1C

jr_015_7DF4:
    ld   a, e                                     ; $7DF4: $7B

func_015_7DF5:
    ldh  [hActiveEntitySpriteVariant], a               ; $7DF5: $E0 $F1
    ld   a, $58                                   ; $7DF7: $3E $58
    ldh  [wActiveEntityPosX], a                   ; $7DF9: $E0 $EE
    ldh  [hLinkPositionX], a                      ; $7DFB: $E0 $98
    ld   a, $44                                   ; $7DFD: $3E $44
    ldh  [wActiveEntityPosY], a                   ; $7DFF: $E0 $EC
    ldh  [hLinkPositionY], a                      ; $7E01: $E0 $99
    ld   a, $02                                   ; $7E03: $3E $02
    ldh  [$FFA1], a                               ; $7E05: $E0 $A1
    ld   a, $FF                                   ; $7E07: $3E $FF

label_015_7E09:
    ldh  [hLinkAnimationState], a                 ; $7E09: $E0 $9D
    ld   de, $7D50                                ; $7E0B: $11 $50 $7D
    ld   a, [wTunicType]                          ; $7E0E: $FA $0F $DC
    and  a                                        ; $7E11: $A7
    jr   z, jr_015_7E1E                           ; $7E12: $28 $0A

    ld   de, $7D58                                ; $7E14: $11 $58 $7D
    cp   $01                                      ; $7E17: $FE $01
    jr   z, jr_015_7E1E                           ; $7E19: $28 $03

    ld   de, $7D60                                ; $7E1B: $11 $60 $7D

jr_015_7E1E:
    call RenderAnimatedActiveEntity                               ; $7E1E: $CD $C0 $3B
    ldh  a, [hIsGBC]                              ; $7E21: $F0 $FE
    and  a                                        ; $7E23: $A7
    jr   z, jr_015_7E2E                           ; $7E24: $28 $08

    ld   hl, $7D68                                ; $7E26: $21 $68 $7D
    ld   c, $02                                   ; $7E29: $0E $02
    call label_3CE6                               ; $7E2B: $CD $E6 $3C

jr_015_7E2E:
    jp   label_3D8A                               ; $7E2E: $C3 $8A $3D

    xor  a                                        ; $7E31: $AF
    call func_015_7DF5                            ; $7E32: $CD $F5 $7D
    ld   a, [wTransitionGfx]                      ; $7E35: $FA $7F $C1
    and  a                                        ; $7E38: $A7
    ret  nz                                       ; $7E39: $C0

    xor  a                                        ; $7E3A: $AF
    ldh  [hLinkAnimationState], a                 ; $7E3B: $E0 $9D
    ld   hl, wWarpStructs                         ; $7E3D: $21 $01 $D4
    ld   a, $01                                   ; $7E40: $3E $01
    ld   [hl+], a                                 ; $7E42: $22
    ldh  a, [hMapId]                              ; $7E43: $F0 $F7
    ld   [hl+], a                                 ; $7E45: $22
    ld   a, $CE                                   ; $7E46: $3E $CE
    ld   [hl+], a                                 ; $7E48: $22
    ld   a, $50                                   ; $7E49: $3E $50
    ld   [hl+], a                                 ; $7E4B: $22
    ld   a, $7C                                   ; $7E4C: $3E $7C
    ld   [hl], a                                  ; $7E4E: $77
    call ClearEntityStatus                        ; $7E4F: $CD $31 $7C
    jp   label_C9E                                ; $7E52: $C3 $9E $0C

    ld   e, b                                     ; $7E55: $58
    nop                                           ; $7E56: $00
    ld   e, b                                     ; $7E57: $58
    ld   bc, $0258                                ; $7E58: $01 $58 $02
    ld   e, b                                     ; $7E5B: $58
    inc  bc                                       ; $7E5C: $03
    ld   e, b                                     ; $7E5D: $58
    ld   bc, $7E55                                ; $7E5E: $01 $55 $7E
    ld   d, a                                     ; $7E61: $57
    ld   a, [hl]                                  ; $7E62: $7E
    ld   e, c                                     ; $7E63: $59
    ld   a, [hl]                                  ; $7E64: $7E
    ld   e, e                                     ; $7E65: $5B

jr_015_7E66:
    ld   a, [hl]                                  ; $7E66: $7E
    ld   e, c                                     ; $7E67: $59
    ld   a, [hl]                                  ; $7E68: $7E
    ld   e, e                                     ; $7E69: $5B
    ld   a, [hl]                                  ; $7E6A: $7E
    ld   d, l                                     ; $7E6B: $55
    ld   a, [hl]                                  ; $7E6C: $7E
    ld   e, l                                     ; $7E6D: $5D
    ld   a, [hl]                                  ; $7E6E: $7E
    ld   e, b                                     ; $7E6F: $58
    nop                                           ; $7E70: $00
    ld   e, d                                     ; $7E71: $5A
    nop                                           ; $7E72: $00
    ld   e, d                                     ; $7E73: $5A
    db   $20                                      ; $7E74: $20

BookEntityHandler::
    db   $F0
    pop  af                                       ; $7E76: $F1
    and  a                                        ; $7E77: $A7
    jr   z, jr_015_7E82                           ; $7E78: $28 $08

    ld   de, $7E6D                                ; $7E7A: $11 $6D $7E
    call RenderAnimatedActiveEntity                               ; $7E7D: $CD $C0 $3B
    jr   jr_015_7EA6                              ; $7E80: $18 $24

jr_015_7E82:
    ldh  a, [hIsGBC]                              ; $7E82: $F0 $FE
    and  a                                        ; $7E84: $A7
    jr   z, jr_015_7EA0                           ; $7E85: $28 $19

    push bc                                       ; $7E87: $C5
    ld   hl, $7E5F                                ; $7E88: $21 $5F $7E
    ldh  a, [hMapRoom]                            ; $7E8B: $F0 $F6
    cp   $B5                                      ; $7E8D: $FE $B5
    jr   z, jr_015_7E96                           ; $7E8F: $28 $05

    sla  c                                        ; $7E91: $CB $21
    rl   b                                        ; $7E93: $CB $10
    add  hl, bc                                   ; $7E95: $09

jr_015_7E96:
    ld   a, [hl+]                                 ; $7E96: $2A
    ld   e, a                                     ; $7E97: $5F
    ld   a, [hl]                                  ; $7E98: $7E
    ld   d, a                                     ; $7E99: $57
    pop  bc                                       ; $7E9A: $C1
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7E9B: $CD $77 $3C
    jr   jr_015_7EA6                              ; $7E9E: $18 $06

jr_015_7EA0:
    ld   de, $7E6F                                ; $7EA0: $11 $6F $7E
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7EA3: $CD $77 $3C

jr_015_7EA6:
    call func_015_7B0D                            ; $7EA6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $7EA9: $F0 $F0
    rst  $00                                      ; $7EAB: $C7
    cp   c                                        ; $7EAC: $B9
    ld   a, [hl]                                  ; $7EAD: $7E
    inc  b                                        ; $7EAE: $04
    ld   a, a                                     ; $7EAF: $7F
    ld   [bc], a                                  ; $7EB0: $02
    inc  b                                        ; $7EB1: $04
    ld   b, $00                                   ; $7EB2: $06 $00
    ld   a, [bc]                                  ; $7EB4: $0A
    ld   [$0D0C], sp                              ; $7EB5: $08 $0C $0D
    dec  hl                                       ; $7EB8: $2B
    ld   a, [wGameplayType]                       ; $7EB9: $FA $95 $DB
    cp   $07                                      ; $7EBC: $FE $07
    jr   z, jr_015_7EC4                           ; $7EBE: $28 $04

    xor  a                                        ; $7EC0: $AF
    ld   [$C5A2], a                               ; $7EC1: $EA $A2 $C5

jr_015_7EC4:
    xor  a                                        ; $7EC4: $AF
    call SetEntitySpriteVariant                   ; $7EC5: $CD $0C $3B
    call ShouldLinkTalkToEntity                   ; $7EC8: $CD $BC $7A
    ret  nc                                       ; $7ECB: $D0

    ldh  a, [hMapRoom]                            ; $7ECC: $F0 $F6
    cp   $B5                                      ; $7ECE: $FE $B5
    jr   nz, jr_015_7ED6                          ; $7ED0: $20 $04

    ld   e, $08                                   ; $7ED2: $1E $08
    jr   jr_015_7EF3                              ; $7ED4: $18 $1D

jr_015_7ED6:
    ld   e, $00                                   ; $7ED6: $1E $00
    ldh  a, [wActiveEntityPosX]                   ; $7ED8: $F0 $EE
    cp   $20                                      ; $7EDA: $FE $20
    jr   c, jr_015_7EE9                           ; $7EDC: $38 $0B

    inc  e                                        ; $7EDE: $1C
    cp   $40                                      ; $7EDF: $FE $40
    jr   c, jr_015_7EE9                           ; $7EE1: $38 $06

    inc  e                                        ; $7EE3: $1C
    cp   $70                                      ; $7EE4: $FE $70
    jr   c, jr_015_7EE9                           ; $7EE6: $38 $01

    inc  e                                        ; $7EE8: $1C

jr_015_7EE9:
    ldh  a, [$FFEF]                               ; $7EE9: $F0 $EF
    cp   $40                                      ; $7EEB: $FE $40
    jr   c, jr_015_7EF3                           ; $7EED: $38 $04

    ld   a, e                                     ; $7EEF: $7B
    add  $04                                      ; $7EF0: $C6 $04
    ld   e, a                                     ; $7EF2: $5F

jr_015_7EF3:
    ld   d, b                                     ; $7EF3: $50
    ld   hl, $7EB0                                ; $7EF4: $21 $B0 $7E
    add  hl, de                                   ; $7EF7: $19
    ld   a, [hl]                                  ; $7EF8: $7E
    ld   hl, wEntitiesUnknownTableB               ; $7EF9: $21 $B0 $C2
    add  hl, bc                                   ; $7EFC: $09
    ld   [hl], a                                  ; $7EFD: $77
    call OpenDialogInTable2                       ; $7EFE: $CD $7C $23
    jp   IncrementEntityWalkingAttr               ; $7F01: $C3 $12 $3B

    ld   a, $01                                   ; $7F04: $3E $01
    call SetEntitySpriteVariant                   ; $7F06: $CD $0C $3B
    ld   a, [wDialogState]                        ; $7F09: $FA $9F $C1
    and  a                                        ; $7F0C: $A7
    ret  nz                                       ; $7F0D: $C0

    call IncrementEntityWalkingAttr               ; $7F0E: $CD $12 $3B
    ld   [hl], b                                  ; $7F11: $70
    ld   a, [wC177]                               ; $7F12: $FA $77 $C1
    and  a                                        ; $7F15: $A7
    jr   nz, jr_015_7F82                          ; $7F16: $20 $6A

    ld   hl, wEntitiesUnknownTableB               ; $7F18: $21 $B0 $C2
    add  hl, bc                                   ; $7F1B: $09
    ld   a, [hl]                                  ; $7F1C: $7E
    inc  a                                        ; $7F1D: $3C
    ld   e, a                                     ; $7F1E: $5F
    cp   $0E                                      ; $7F1F: $FE $0E
    jr   nz, jr_015_7F4F                          ; $7F21: $20 $2C

    ld   a, [wTradeSequenceItem]                  ; $7F23: $FA $0E $DB
    cp   $0E                                      ; $7F26: $FE $0E
    jr   nz, jr_015_7F4F                          ; $7F28: $20 $25

    ld   a, [$DB7F]                               ; $7F2A: $FA $7F $DB
    and  a                                        ; $7F2D: $A7
    jr   nz, jr_015_7F4F                          ; $7F2E: $20 $1F

    ldh  a, [hRoomStatus]                         ; $7F30: $F0 $F8
    and  $20                                      ; $7F32: $E6 $20
    jr   nz, jr_015_7F44                          ; $7F34: $20 $0E

    call func_015_7CDB                            ; $7F36: $CD $DB $7C
    call GetRandomByte                            ; $7F39: $CD $0D $28
    rla                                           ; $7F3C: $17
    rla                                           ; $7F3D: $17
    rla                                           ; $7F3E: $17
    and  $18                                      ; $7F3F: $E6 $18
    ld   [$DB7C], a                               ; $7F41: $EA $7C $DB

jr_015_7F44:
    ld   a, [$DB7C]                               ; $7F44: $FA $7C $DB
    rra                                           ; $7F47: $1F
    rra                                           ; $7F48: $1F
    rra                                           ; $7F49: $1F
    and  $03                                      ; $7F4A: $E6 $03
    add  $17                                      ; $7F4C: $C6 $17
    ld   e, a                                     ; $7F4E: $5F

jr_015_7F4F:
    ldh  a, [hMapRoom]                            ; $7F4F: $F0 $F6
    cp   $B5                                      ; $7F51: $FE $B5
    jr   z, jr_015_7F72                           ; $7F53: $28 $1D

    ld   a, e                                     ; $7F55: $7B
    cp   $0D                                      ; $7F56: $FE $0D
    jr   nz, jr_015_7F6F                          ; $7F58: $20 $15

    xor  a                                        ; $7F5A: $AF
    ld   [wTransitionSequenceCounter], a          ; $7F5B: $EA $6B $C1
    ld   [wC16C], a                               ; $7F5E: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $7F61: $EA $96 $DB
    ld   a, $07                                   ; $7F64: $3E $07
    ld   [wGameplayType], a                       ; $7F66: $EA $95 $DB
    ld   a, $01                                   ; $7F69: $3E $01
    ld   [$C5A2], a                               ; $7F6B: $EA $A2 $C5
    ret                                           ; $7F6E: $C9

jr_015_7F6F:
    jp   OpenDialogInTable2                       ; $7F6F: $C3 $7C $23

jr_015_7F72:
    xor  a                                        ; $7F72: $AF
    ld   [wTransitionSequenceCounter], a          ; $7F73: $EA $6B $C1
    ld   [wC16C], a                               ; $7F76: $EA $6C $C1
    ld   [wGameplaySubtype], a                    ; $7F79: $EA $96 $DB
    ld   a, $0D                                   ; $7F7C: $3E $0D
    ld   [wGameplayType], a                       ; $7F7E: $EA $95 $DB
    ret                                           ; $7F81: $C9

jr_015_7F82:
    xor  a                                        ; $7F82: $AF
    jp   SetEntitySpriteVariant                   ; $7F83: $C3 $0C $3B

    ld   [hl], h                                  ; $7F86: $74
    inc  bc                                       ; $7F87: $03
    db   $76                                      ; $7F88: $76
    inc  bc                                       ; $7F89: $03
    ld   [hl], b                                  ; $7F8A: $70
    inc  bc                                       ; $7F8B: $03
    ld   [hl], d                                  ; $7F8C: $72
    inc  bc                                       ; $7F8D: $03
    db   $76                                      ; $7F8E: $76
    inc  hl                                       ; $7F8F: $23
    ld   [hl], h                                  ; $7F90: $74
    inc  hl                                       ; $7F91: $23
    ld   [hl], d                                  ; $7F92: $72
    inc  hl                                       ; $7F93: $23
    ld   [hl], b                                  ; $7F94: $70
    inc  hl                                       ; $7F95: $23

AnimalD1EntityHandler::
    ld   a, [$DB74]                               ; $7F96: $FA $74 $DB
    and  a                                        ; $7F99: $A7
    jp   z, ClearEntityStatusAndReturn            ; $7F9A: $CA $31 $7C

    ld   de, $7F86                                ; $7F9D: $11 $86 $7F
    call RenderAnimatedActiveEntity                               ; $7FA0: $CD $C0 $3B
    ld   a, [$C50F]                               ; $7FA3: $FA $0F $C5
    ld   e, a                                     ; $7FA6: $5F
    ld   d, b                                     ; $7FA7: $50
    ld   hl, wEntitiesPosXTable                         ; $7FA8: $21 $00 $C2
    add  hl, de                                   ; $7FAB: $19
    ldh  a, [wActiveEntityPosX]                   ; $7FAC: $F0 $EE
    ld   e, $00                                   ; $7FAE: $1E $00
    cp   [hl]                                     ; $7FB0: $BE
    jr   nc, jr_015_7FB5                          ; $7FB1: $30 $02

    ld   e, $02                                   ; $7FB3: $1E $02

jr_015_7FB5:
    ldh  a, [hFrameCounter]                       ; $7FB5: $F0 $E7
    rra                                           ; $7FB7: $1F
    rra                                           ; $7FB8: $1F
    rra                                           ; $7FB9: $1F
    rra                                           ; $7FBA: $1F
    rra                                           ; $7FBB: $1F
    and  $01                                      ; $7FBC: $E6 $01
    add  e                                        ; $7FBE: $83
    call SetEntitySpriteVariant                   ; $7FBF: $CD $0C $3B
    call func_015_7A6E                            ; $7FC2: $CD $6E $7A

    call ShouldLinkTalkToEntity                   ; $7FC5: $CD $BC $7A
    ret  nc                                       ; $7FC8: $D0
    ld   a, $96                                   ; $7FC9: $3E $96
    jp   OpenDialogInTable1                       ; $7FCB: $C3 $73 $23
