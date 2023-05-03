; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MovingBlockSpriteVariants:: ; $40FC
.variant0
    db $F8, OAM_GBC_PAL_7 | OAMF_PAL1
    db $FA, OAM_GBC_PAL_7 | OAMF_PAL1

MovingBlockLeftTopEntityHandler::
    ld   de, MovingBlockSpriteVariants            ; $4100 $11 $FC $40
    call RenderActiveEntitySpritesPair            ; $4103: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4106: $CD $0D $7B
    xor  a                                        ; $4109: $AF
    ldh  [hMultiPurposeG], a                      ; $410A: $E0 $E8

    ldh  a, [hActiveEntityState]                  ; $410C: $F0 $F0
    JP_TABLE                                      ; $410E
._00 dw MovingBlockLeftTopState0Handler           ; $410F
._01 dw MovingBlockLeftTopState1Handler           ; $4111

MovingBlockLeftTopState0Handler::
    ld   hl, wEntitiesPosYTable                   ; $4113: $21 $10 $C2
    add  hl, bc                                   ; $4116: $09
    ld   a, [hl]                                  ; $4117: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $4118: $21 $C0 $C2
    add  hl, bc                                   ; $411B: $09
    ld   [hl], a                                  ; $411C: $77
    add  $10                                      ; $411D: $C6 $10
    ld   hl, wEntitiesPrivateState1Table          ; $411F: $21 $B0 $C2
    add  hl, bc                                   ; $4122: $09
    ld   [hl], a                                  ; $4123: $77
    jp   IncrementEntityState                     ; $4124: $C3 $12 $3B

MovingBlockLeftTopState1Handler::
    ldh  a, [hMovingBlockMoverState]              ; $4127: $F0 $BA
    cp   $02                                      ; $4129: $FE $02
    jr   z, jr_015_416F                           ; $412B: $28 $42

    and  a                                        ; $412D: $A7
    jr   z, jr_015_414D                           ; $412E: $28 $1D

    ld   hl, wEntitiesInertiaTable                ; $4130: $21 $D0 $C3
    add  hl, bc                                   ; $4133: $09
    inc  [hl]                                     ; $4134: $34
    ld   a, [hl]                                  ; $4135: $7E
    cp   $0A                                      ; $4136: $FE $0A
    jr   c, .ret_414C                             ; $4138: $38 $12

    ld   [hl], b                                  ; $413A: $70
    ld   a, NOISE_SFX_RUMBLE                      ; $413B: $3E $11
    ldh  [hNoiseSfx], a                           ; $413D: $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ; $413F: $21 $C0 $C2
    add  hl, bc                                   ; $4142: $09
    ld   a, [hl]                                  ; $4143: $7E
    ld   hl, wEntitiesPosYTable                   ; $4144: $21 $10 $C2
    add  hl, bc                                   ; $4147: $09
    cp   [hl]                                     ; $4148: $BE
    jr   z, .ret_414C                             ; $4149: $28 $01

    dec  [hl]                                     ; $414B: $35

.ret_414C
    ret                                           ; $414C: $C9

jr_015_414D:
    ld   hl, wEntitiesPrivateState1Table          ; $414D: $21 $B0 $C2
    add  hl, bc                                   ; $4150: $09
    ld   a, [hl]                                  ; $4151: $7E
    ld   hl, wEntitiesPosYTable                   ; $4152: $21 $10 $C2
    add  hl, bc                                   ; $4155: $09
    cp   [hl]                                     ; $4156: $BE
    jr   z, .jr_416B                              ; $4157: $28 $12

    ld   hl, wEntitiesInertiaTable                ; $4159: $21 $D0 $C3
    add  hl, bc                                   ; $415C: $09
    ld   a, [hl]                                  ; $415D: $7E
    inc  [hl]                                     ; $415E: $34
    cp   $0D                                      ; $415F: $FE $0D
    jr   c, jr_015_416F                           ; $4161: $38 $0C

    ld   [hl], b                                  ; $4163: $70
    ld   hl, wEntitiesPosYTable                   ; $4164: $21 $10 $C2
    add  hl, bc                                   ; $4167: $09
    inc  [hl]                                     ; $4168: $34
    jr   jr_015_416F                              ; $4169: $18 $04

.jr_416B
    ld   hl, hMultiPurposeG                       ; $416B: $21 $E8 $FF
    inc  [hl]                                     ; $416E: $34

label_015_416F:
jr_015_416F:
    call CopyEntityPositionToActivePosition       ; $416F: $CD $8A $3D
    call func_015_7BDB                            ; $4172: $CD $DB $7B
    add  $0C                                      ; $4175: $C6 $0C
    cp   $18                                      ; $4177: $FE $18
    jr   nc, ret_015_41C9                         ; $4179: $30 $4E

    call func_015_7BEB                            ; $417B: $CD $EB $7B
    add  $10                                      ; $417E: $C6 $10
    cp   $1C                                      ; $4180: $FE $1C
    jr   nc, ret_015_41C9                         ; $4182: $30 $45

    call ResetPegasusBoots                        ; $4184: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $4187: $CD $8E $17
    call func_015_7C0A                            ; $418A: $CD $0A $7C
    ld   a, e                                     ; $418D: $7B
    cp   $00                                      ; $418E: $FE $00
    jr   nz, .jr_4199                             ; $4190: $20 $07

    ldh  a, [hActiveEntityPosX]                   ; $4192: $F0 $EE
    add  $0C                                      ; $4194: $C6 $0C
    ldh  [hLinkPositionX], a                      ; $4196: $E0 $98
    ret                                           ; $4198: $C9

.jr_4199
    cp   $01                                      ; $4199: $FE $01
    jr   nz, .jr_41A4                             ; $419B: $20 $07

    ldh  a, [hActiveEntityPosX]                   ; $419D: $F0 $EE
    add  $F4                                      ; $419F: $C6 $F4
    ldh  [hLinkPositionX], a                      ; $41A1: $E0 $98
    ret                                           ; $41A3: $C9

.jr_41A4
    cp   $02                                      ; $41A4: $FE $02
    jr   nz, jr_015_41B9                          ; $41A6: $20 $11

    ldh  a, [hActiveEntityType]                   ; $41A8: $F0 $EB
    cp   ENTITY_MOVING_BLOCK_LEFT_BOTTOM          ; $41AA: $FE $47
    jr   nz, .jr_41B2                             ; $41AC: $20 $04

    ldh  a, [hMultiPurposeG]                      ; $41AE: $F0 $E8
    and  a                                        ; $41B0: $A7
    ret  nz                                       ; $41B1: $C0

.jr_41B2
    ldh  a, [hActiveEntityVisualPosY]             ; $41B2: $F0 $EC
    add  $F0                                      ; $41B4: $C6 $F0
    ldh  [hLinkPositionY], a                      ; $41B6: $E0 $99
    ret                                           ; $41B8: $C9

jr_015_41B9:
    ldh  a, [hActiveEntityType]                   ; $41B9: $F0 $EB
    cp   ENTITY_MOVING_BLOCK_LEFT_TOP             ; $41BB: $FE $46
    jr   nz, .jr_41C3                             ; $41BD: $20 $04

    ldh  a, [hMultiPurposeG]                      ; $41BF: $F0 $E8
    and  a                                        ; $41C1: $A7
    ret  nz                                       ; $41C2: $C0

.jr_41C3
    ldh  a, [hActiveEntityVisualPosY]             ; $41C3: $F0 $EC
    add  $0C                                      ; $41C5: $C6 $0C
    ldh  [hLinkPositionY], a                      ; $41C7: $E0 $99

ret_015_41C9:
    ret                                           ; $41C9: $C9

MovingBlockLeftBottomEntityHandler::
    ld   de, MovingBlockSpriteVariants            ; $41CA: $11 $FC $40
    call RenderActiveEntitySpritesPair            ; $41CD: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $41D0: $CD $0D $7B
    xor  a                                        ; $41D3: $AF
    ldh  [hMultiPurposeG], a                      ; $41D4: $E0 $E8

    ldh  a, [hActiveEntityState]                  ; $41D6: $F0 $F0
    JP_TABLE                                      ; $41D8
._00 dw MovingBlockLeftBottomState0Handler        ; $41D9
._01 dw MovingBlockLeftBottomState1Handler        ; $41DB

MovingBlockLeftBottomState0Handler::
    ld   hl, wEntitiesPosYTable                   ; $41DD: $21 $10 $C2
    add  hl, bc                                   ; $41E0: $09
    ld   a, [hl]                                  ; $41E1: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $41E2: $21 $C0 $C2
    add  hl, bc                                   ; $41E5: $09
    ld   [hl], a                                  ; $41E6: $77
    sub  $10                                      ; $41E7: $D6 $10
    ld   hl, wEntitiesPrivateState1Table          ; $41E9: $21 $B0 $C2
    add  hl, bc                                   ; $41EC: $09
    ld   [hl], a                                  ; $41ED: $77
    jp   IncrementEntityState                     ; $41EE: $C3 $12 $3B

MovingBlockLeftBottomState1Handler::
    ldh  a, [hMovingBlockMoverState]              ; $41F1: $F0 $BA
    cp   $02                                      ; $41F3: $FE $02
    jr   z, jr_015_4239                           ; $41F5: $28 $42

    and  a                                        ; $41F7: $A7
    jr   z, jr_015_4217                           ; $41F8: $28 $1D

    ld   hl, wEntitiesInertiaTable                ; $41FA: $21 $D0 $C3
    add  hl, bc                                   ; $41FD: $09
    inc  [hl]                                     ; $41FE: $34
    ld   a, [hl]                                  ; $41FF: $7E
    cp   $0A                                      ; $4200: $FE $0A
    jr   c, .ret_4216                             ; $4202: $38 $12

    ld   [hl], b                                  ; $4204: $70
    ld   a, NOISE_SFX_RUMBLE                      ; $4205: $3E $11
    ldh  [hNoiseSfx], a                           ; $4207: $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ; $4209: $21 $C0 $C2
    add  hl, bc                                   ; $420C: $09
    ld   a, [hl]                                  ; $420D: $7E
    ld   hl, wEntitiesPosYTable                   ; $420E: $21 $10 $C2
    add  hl, bc                                   ; $4211: $09
    cp   [hl]                                     ; $4212: $BE
    jr   z, .ret_4216                             ; $4213: $28 $01

    inc  [hl]                                     ; $4215: $34

.ret_4216
    ret                                           ; $4216: $C9

jr_015_4217:
    ld   hl, wEntitiesPrivateState1Table          ; $4217: $21 $B0 $C2
    add  hl, bc                                   ; $421A: $09
    ld   a, [hl]                                  ; $421B: $7E
    ld   hl, wEntitiesPosYTable                   ; $421C: $21 $10 $C2
    add  hl, bc                                   ; $421F: $09
    cp   [hl]                                     ; $4220: $BE
    jr   z, .jr_4235                              ; $4221: $28 $12

    ld   hl, wEntitiesInertiaTable                ; $4223: $21 $D0 $C3
    add  hl, bc                                   ; $4226: $09
    ld   a, [hl]                                  ; $4227: $7E
    inc  [hl]                                     ; $4228: $34
    cp   $0D                                      ; $4229: $FE $0D
    jr   c, jr_015_4239                           ; $422B: $38 $0C

    ld   [hl], b                                  ; $422D: $70
    ld   hl, wEntitiesPosYTable                   ; $422E: $21 $10 $C2
    add  hl, bc                                   ; $4231: $09
    dec  [hl]                                     ; $4232: $35
    jr   jr_015_4239                              ; $4233: $18 $04

.jr_4235
    ld   hl, hMultiPurposeG                       ; $4235: $21 $E8 $FF
    inc  [hl]                                     ; $4238: $34

jr_015_4239:
    jp   label_015_416F                           ; $4239: $C3 $6F $41

MovingBlockBottomLeftEntityHandler::
    ld   de, MovingBlockSpriteVariants            ; $423C: $11 $FC $40
    call RenderActiveEntitySpritesPair            ; $423F: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $4242: $CD $0D $7B
    xor  a                                        ; $4245: $AF
    ldh  [hMultiPurposeG], a                      ; $4246: $E0 $E8

    ldh  a, [hActiveEntityState]                  ; $4248: $F0 $F0
    JP_TABLE                                      ; $424A
._00 dw MovingBlockBottomLeftState0Handler        ; $424B
._01 dw MovingBlockBottomLeftState1Handler        ; $424D

MovingBlockBottomLeftState0Handler::
    ld   hl, wEntitiesPosXTable                   ; $424F: $21 $00 $C2
    add  hl, bc                                   ; $4252: $09
    ld   a, [hl]                                  ; $4253: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $4254: $21 $C0 $C2
    add  hl, bc                                   ; $4257: $09
    ld   [hl], a                                  ; $4258: $77
    add  $10                                      ; $4259: $C6 $10
    ld   hl, wEntitiesPrivateState1Table          ; $425B: $21 $B0 $C2
    add  hl, bc                                   ; $425E: $09
    ld   [hl], a                                  ; $425F: $77
    jp   IncrementEntityState                     ; $4260: $C3 $12 $3B

MovingBlockBottomLeftState1Handler::
    ldh  a, [hMovingBlockMoverState]              ; $4263: $F0 $BA
    cp   $02                                      ; $4265: $FE $02
    jr   z, jr_015_42AB                           ; $4267: $28 $42

    and  a                                        ; $4269: $A7
    jr   z, jr_015_4289                           ; $426A: $28 $1D

    ld   hl, wEntitiesInertiaTable                ; $426C: $21 $D0 $C3
    add  hl, bc                                   ; $426F: $09
    inc  [hl]                                     ; $4270: $34
    ld   a, [hl]                                  ; $4271: $7E
    cp   $0A                                      ; $4272: $FE $0A
    jr   c, .ret_4288                             ; $4274: $38 $12

    ld   [hl], b                                  ; $4276: $70
    ld   a, NOISE_SFX_RUMBLE                      ; $4277: $3E $11
    ldh  [hNoiseSfx], a                           ; $4279: $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ; $427B: $21 $C0 $C2
    add  hl, bc                                   ; $427E: $09
    ld   a, [hl]                                  ; $427F: $7E
    ld   hl, wEntitiesPosXTable                   ; $4280: $21 $00 $C2
    add  hl, bc                                   ; $4283: $09
    cp   [hl]                                     ; $4284: $BE
    jr   z, .ret_4288                             ; $4285: $28 $01

    dec  [hl]                                     ; $4287: $35

.ret_4288
    ret                                           ; $4288: $C9

jr_015_4289:
    ld   hl, wEntitiesPrivateState1Table          ; $4289: $21 $B0 $C2
    add  hl, bc                                   ; $428C: $09
    ld   a, [hl]                                  ; $428D: $7E
    ld   hl, wEntitiesPosXTable                   ; $428E: $21 $00 $C2
    add  hl, bc                                   ; $4291: $09
    cp   [hl]                                     ; $4292: $BE
    jr   z, .jr_42A7                              ; $4293: $28 $12

    ld   hl, wEntitiesInertiaTable                ; $4295: $21 $D0 $C3
    add  hl, bc                                   ; $4298: $09
    ld   a, [hl]                                  ; $4299: $7E
    inc  [hl]                                     ; $429A: $34
    cp   $0D                                      ; $429B: $FE $0D
    jr   c, jr_015_42AB                           ; $429D: $38 $0C

    ld   [hl], b                                  ; $429F: $70
    ld   hl, wEntitiesPosXTable                   ; $42A0: $21 $00 $C2
    add  hl, bc                                   ; $42A3: $09
    inc  [hl]                                     ; $42A4: $34
    jr   jr_015_42AB                              ; $42A5: $18 $04

.jr_42A7
    ld   hl, hMultiPurposeG                       ; $42A7: $21 $E8 $FF
    inc  [hl]                                     ; $42AA: $34

jr_015_42AB:
    jp   label_015_416F                           ; $42AB: $C3 $6F $41

MovingBlockBottomRightEntityHandler:
    ld   de, MovingBlockSpriteVariants            ; $42AE: $11 $FC $40
    call RenderActiveEntitySpritesPair            ; $42B1: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $42B4: $CD $0D $7B
    xor  a                                        ; $42B7: $AF
    ldh  [hMultiPurposeG], a                      ; $42B8: $E0 $E8

    ldh  a, [hActiveEntityState]                  ; $42BA: $F0 $F0
    JP_TABLE                                      ; $42BC
._00 dw MovingBlockBottomRightState0Handler       ; $42BD
._01 dw MovingBlockBottomRightState1Handler       ; $42BF

MovingBlockBottomRightState0Handler::
    ld   hl, wEntitiesPosXTable                   ; $42C1: $21 $00 $C2
    add  hl, bc                                   ; $42C4: $09
    ld   a, [hl]                                  ; $42C5: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $42C6: $21 $C0 $C2
    add  hl, bc                                   ; $42C9: $09
    ld   [hl], a                                  ; $42CA: $77
    sub  $10                                      ; $42CB: $D6 $10
    ld   hl, wEntitiesPrivateState1Table          ; $42CD: $21 $B0 $C2
    add  hl, bc                                   ; $42D0: $09
    ld   [hl], a                                  ; $42D1: $77
    jp   IncrementEntityState                     ; $42D2: $C3 $12 $3B

MovingBlockBottomRightState1Handler::
    ldh  a, [hMovingBlockMoverState]              ; $42D5: $F0 $BA
    cp   $02                                      ; $42D7: $FE $02
    jr   z, jr_015_431D                           ; $42D9: $28 $42

    and  a                                        ; $42DB: $A7
    jr   z, jr_015_42FB                           ; $42DC: $28 $1D

    ld   hl, wEntitiesInertiaTable                ; $42DE: $21 $D0 $C3
    add  hl, bc                                   ; $42E1: $09
    inc  [hl]                                     ; $42E2: $34
    ld   a, [hl]                                  ; $42E3: $7E
    cp   $0A                                      ; $42E4: $FE $0A
    jr   c, .ret_42FA                             ; $42E6: $38 $12

    ld   [hl], b                                  ; $42E8: $70
    ld   a, NOISE_SFX_RUMBLE                      ; $42E9: $3E $11
    ldh  [hNoiseSfx], a                           ; $42EB: $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ; $42ED: $21 $C0 $C2
    add  hl, bc                                   ; $42F0: $09
    ld   a, [hl]                                  ; $42F1: $7E
    ld   hl, wEntitiesPosXTable                   ; $42F2: $21 $00 $C2
    add  hl, bc                                   ; $42F5: $09
    cp   [hl]                                     ; $42F6: $BE
    jr   z, .ret_42FA                             ; $42F7: $28 $01

    inc  [hl]                                     ; $42F9: $34

.ret_42FA
    ret                                           ; $42FA: $C9

jr_015_42FB:
    ld   hl, wEntitiesPrivateState1Table          ; $42FB: $21 $B0 $C2
    add  hl, bc                                   ; $42FE: $09
    ld   a, [hl]                                  ; $42FF: $7E
    ld   hl, wEntitiesPosXTable                   ; $4300: $21 $00 $C2
    add  hl, bc                                   ; $4303: $09
    cp   [hl]                                     ; $4304: $BE
    jr   z, .jr_4319                              ; $4305: $28 $12

    ld   hl, wEntitiesInertiaTable                ; $4307: $21 $D0 $C3
    add  hl, bc                                   ; $430A: $09
    ld   a, [hl]                                  ; $430B: $7E
    inc  [hl]                                     ; $430C: $34
    cp   $0D                                      ; $430D: $FE $0D
    jr   c, jr_015_431D                           ; $430F: $38 $0C

    ld   [hl], b                                  ; $4311: $70
    ld   hl, wEntitiesPosXTable                   ; $4312: $21 $00 $C2
    add  hl, bc                                   ; $4315: $09
    dec  [hl]                                     ; $4316: $35
    jr   jr_015_431D                              ; $4317: $18 $04

.jr_4319
    ld   hl, hMultiPurposeG                       ; $4319: $21 $E8 $FF
    inc  [hl]                                     ; $431C: $34

jr_015_431D:
    jp   label_015_416F                           ; $431D: $C3 $6F $41
