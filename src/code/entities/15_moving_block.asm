; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MovingBlockSpriteVariants:: ;; 15:40FC
.variant0
    db $F8, OAM_GBC_PAL_7 | OAMF_PAL1
    db $FA, OAM_GBC_PAL_7 | OAMF_PAL1

MovingBlockLeftTopEntityHandler::
    ld   de, MovingBlockSpriteVariants            ;; 15:4100 $11 $FC $40
    call RenderActiveEntitySpritesPair            ;; 15:4103 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4106 $CD $0D $7B
    xor  a                                        ;; 15:4109 $AF
    ldh  [hMultiPurposeG], a                      ;; 15:410A $E0 $E8

    ldh  a, [hActiveEntityState]                  ;; 15:410C $F0 $F0
    JP_TABLE                                      ;; 15:410E
._00 dw MovingBlockLeftTopInitHandler             ;; 15:410F
._01 dw MovingBlockLeftTopUpdateHandler           ;; 15:4111

MovingBlockLeftTopInitHandler::
    ld   hl, wEntitiesPosYTable                   ;; 15:4113 $21 $10 $C2
    add  hl, bc                                   ;; 15:4116 $09
    ld   a, [hl]                                  ;; 15:4117 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 15:4118 $21 $C0 $C2
    add  hl, bc                                   ;; 15:411B $09
    ld   [hl], a                                  ;; 15:411C $77
    add  $10                                      ;; 15:411D $C6 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 15:411F $21 $B0 $C2
    add  hl, bc                                   ;; 15:4122 $09
    ld   [hl], a                                  ;; 15:4123 $77
    jp   IncrementEntityState                     ;; 15:4124 $C3 $12 $3B

MovingBlockLeftTopUpdateHandler::
    ldh  a, [hMovingBlockMoverState]              ;; 15:4127 $F0 $BA
    cp   $02                                      ;; 15:4129 $FE $02
    jr   z, MovingBlockPushLinkIfNeeded           ;; 15:412B $28 $42

    and  a                                        ;; 15:412D $A7
    jr   z, .moverNotGrabbed                      ;; 15:412E $28 $1D

    ; If the moving block mover is being pulled
    ld   hl, wEntitiesInertiaTable                ;; 15:4130 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4133 $09
    inc  [hl]                                     ;; 15:4134 $34
    ld   a, [hl]                                  ;; 15:4135 $7E
    cp   $0A                                      ;; 15:4136 $FE $0A
    jr   c, .return                               ;; 15:4138 $38 $12

    ld   [hl], b                                  ;; 15:413A $70
    ld   a, NOISE_SFX_RUMBLE                      ;; 15:413B $3E $11
    ldh  [hNoiseSfx], a                           ;; 15:413D $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ;; 15:413F $21 $C0 $C2
    add  hl, bc                                   ;; 15:4142 $09
    ld   a, [hl]                                  ;; 15:4143 $7E
    ld   hl, wEntitiesPosYTable                   ;; 15:4144 $21 $10 $C2
    add  hl, bc                                   ;; 15:4147 $09
    cp   [hl]                                     ;; 15:4148 $BE
    jr   z, .return                               ;; 15:4149 $28 $01

    dec  [hl]                                     ;; 15:414B $35

.return
    ret                                           ;; 15:414C $C9

.moverNotGrabbed
    ld   hl, wEntitiesPrivateState1Table          ;; 15:414D $21 $B0 $C2
    add  hl, bc                                   ;; 15:4150 $09
    ld   a, [hl]                                  ;; 15:4151 $7E
    ld   hl, wEntitiesPosYTable                   ;; 15:4152 $21 $10 $C2
    add  hl, bc                                   ;; 15:4155 $09
    cp   [hl]                                     ;; 15:4156 $BE
    jr   z, .fullyClosed                          ;; 15:4157 $28 $12

    ld   hl, wEntitiesInertiaTable                ;; 15:4159 $21 $D0 $C3
    add  hl, bc                                   ;; 15:415C $09
    ld   a, [hl]                                  ;; 15:415D $7E
    inc  [hl]                                     ;; 15:415E $34
    cp   $0D                                      ;; 15:415F $FE $0D
    jr   c, MovingBlockPushLinkIfNeeded           ;; 15:4161 $38 $0C

    ld   [hl], b                                  ;; 15:4163 $70
    ld   hl, wEntitiesPosYTable                   ;; 15:4164 $21 $10 $C2
    add  hl, bc                                   ;; 15:4167 $09
    inc  [hl]                                     ;; 15:4168 $34
    jr   MovingBlockPushLinkIfNeeded              ;; 15:4169 $18 $04

.fullyClosed
    ld   hl, hMultiPurposeG                       ;; 15:416B $21 $E8 $FF
    inc  [hl]                                     ;; 15:416E $34
    ; fallthrough

MovingBlockPushLinkIfNeeded:
    call CopyEntityPositionToActivePosition       ;; 15:416F $CD $8A $3D
    call GetEntityXDistanceToLink_15              ;; 15:4172 $CD $DB $7B
    add  $0C                                      ;; 15:4175 $C6 $0C
    cp   $18                                      ;; 15:4177 $FE $18
    jr   nc, .linkCollisionEnd                    ;; 15:4179 $30 $4E

    call GetEntityRealYDistanceToLink_15          ;; 15:417B $CD $EB $7B
    add  $10                                      ;; 15:417E $C6 $10
    cp   $1C                                      ;; 15:4180 $FE $1C
    jr   nc, .linkCollisionEnd                    ;; 15:4182 $30 $45

    call ResetPegasusBoots                        ;; 15:4184 $CD $B6 $0C
    call ClearLinkPositionIncrement               ;; 15:4187 $CD $8E $17
    call GetEntityDirectionToLink_15              ;; 15:418A $CD $0A $7C
    ld   a, e                                     ;; 15:418D $7B
    cp   DIRECTION_RIGHT                          ;; 15:418E $FE $00
    jr   nz, .pushRightEnd                        ;; 15:4190 $20 $07

    ; Push Link to the right
    ldh  a, [hActiveEntityPosX]                   ;; 15:4192 $F0 $EE
    add  $0C                                      ;; 15:4194 $C6 $0C
    ldh  [hLinkPositionX], a                      ;; 15:4196 $E0 $98
    ret                                           ;; 15:4198 $C9

.pushRightEnd
    cp   DIRECTION_LEFT                           ;; 15:4199 $FE $01
    jr   nz, .pushLeftEnd                         ;; 15:419B $20 $07

    ; Push Link to the left
    ldh  a, [hActiveEntityPosX]                   ;; 15:419D $F0 $EE
    add  $F4                                      ;; 15:419F $C6 $F4
    ldh  [hLinkPositionX], a                      ;; 15:41A1 $E0 $98
    ret                                           ;; 15:41A3 $C9

.pushLeftEnd
    cp   DIRECTION_UP                             ;; 15:41A4 $FE $02
    jr   nz, .pushUpEnd                           ;; 15:41A6 $20 $11

    ldh  a, [hActiveEntityType]                   ;; 15:41A8 $F0 $EB
    cp   ENTITY_MOVING_BLOCK_LEFT_BOTTOM          ;; 15:41AA $FE $47
    jr   nz, .notLeftBottomBlock                  ;; 15:41AC $20 $04

    ldh  a, [hMultiPurposeG]                      ;; 15:41AE $F0 $E8
    and  a                                        ;; 15:41B0 $A7
    ret  nz                                       ;; 15:41B1 $C0

.notLeftBottomBlock
    ; Push Link up
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:41B2 $F0 $EC
    add  $F0                                      ;; 15:41B4 $C6 $F0
    ldh  [hLinkPositionY], a                      ;; 15:41B6 $E0 $99
    ret                                           ;; 15:41B8 $C9

.pushUpEnd
    ldh  a, [hActiveEntityType]                   ;; 15:41B9 $F0 $EB
    cp   ENTITY_MOVING_BLOCK_LEFT_TOP             ;; 15:41BB $FE $46
    jr   nz, .notLeftTopBlock                     ;; 15:41BD $20 $04

    ldh  a, [hMultiPurposeG]                      ;; 15:41BF $F0 $E8
    and  a                                        ;; 15:41C1 $A7
    ret  nz                                       ;; 15:41C2 $C0

.notLeftTopBlock
    ; Push Link down
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:41C3 $F0 $EC
    add  $0C                                      ;; 15:41C5 $C6 $0C
    ldh  [hLinkPositionY], a                      ;; 15:41C7 $E0 $99

.linkCollisionEnd
    ret                                           ;; 15:41C9 $C9

MovingBlockLeftBottomEntityHandler::
    ld   de, MovingBlockSpriteVariants            ;; 15:41CA $11 $FC $40
    call RenderActiveEntitySpritesPair            ;; 15:41CD $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:41D0 $CD $0D $7B
    xor  a                                        ;; 15:41D3 $AF
    ldh  [hMultiPurposeG], a                      ;; 15:41D4 $E0 $E8

    ldh  a, [hActiveEntityState]                  ;; 15:41D6 $F0 $F0
    JP_TABLE                                      ;; 15:41D8
._00 dw MovingBlockLeftBottomInitHandler          ;; 15:41D9
._01 dw MovingBlockLeftBottomUpdateHandler        ;; 15:41DB

MovingBlockLeftBottomInitHandler::
    ld   hl, wEntitiesPosYTable                   ;; 15:41DD $21 $10 $C2
    add  hl, bc                                   ;; 15:41E0 $09
    ld   a, [hl]                                  ;; 15:41E1 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 15:41E2 $21 $C0 $C2
    add  hl, bc                                   ;; 15:41E5 $09
    ld   [hl], a                                  ;; 15:41E6 $77
    sub  $10                                      ;; 15:41E7 $D6 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 15:41E9 $21 $B0 $C2
    add  hl, bc                                   ;; 15:41EC $09
    ld   [hl], a                                  ;; 15:41ED $77
    jp   IncrementEntityState                     ;; 15:41EE $C3 $12 $3B

MovingBlockLeftBottomUpdateHandler::
    ldh  a, [hMovingBlockMoverState]              ;; 15:41F1 $F0 $BA
    cp   $02                                      ;; 15:41F3 $FE $02
    jr   z, .pushLink                             ;; 15:41F5 $28 $42

    and  a                                        ;; 15:41F7 $A7
    jr   z, .moverNotGrabbed                      ;; 15:41F8 $28 $1D

    ; If the moving block mover is being pulled
    ld   hl, wEntitiesInertiaTable                ;; 15:41FA $21 $D0 $C3
    add  hl, bc                                   ;; 15:41FD $09
    inc  [hl]                                     ;; 15:41FE $34
    ld   a, [hl]                                  ;; 15:41FF $7E
    cp   $0A                                      ;; 15:4200 $FE $0A
    jr   c, .return                               ;; 15:4202 $38 $12

    ld   [hl], b                                  ;; 15:4204 $70
    ld   a, NOISE_SFX_RUMBLE                      ;; 15:4205 $3E $11
    ldh  [hNoiseSfx], a                           ;; 15:4207 $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ;; 15:4209 $21 $C0 $C2
    add  hl, bc                                   ;; 15:420C $09
    ld   a, [hl]                                  ;; 15:420D $7E
    ld   hl, wEntitiesPosYTable                   ;; 15:420E $21 $10 $C2
    add  hl, bc                                   ;; 15:4211 $09
    cp   [hl]                                     ;; 15:4212 $BE
    jr   z, .return                               ;; 15:4213 $28 $01

    inc  [hl]                                     ;; 15:4215 $34

.return
    ret                                           ;; 15:4216 $C9

.moverNotGrabbed
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4217 $21 $B0 $C2
    add  hl, bc                                   ;; 15:421A $09
    ld   a, [hl]                                  ;; 15:421B $7E
    ld   hl, wEntitiesPosYTable                   ;; 15:421C $21 $10 $C2
    add  hl, bc                                   ;; 15:421F $09
    cp   [hl]                                     ;; 15:4220 $BE
    jr   z, .fullyClosed                          ;; 15:4221 $28 $12

    ld   hl, wEntitiesInertiaTable                ;; 15:4223 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4226 $09
    ld   a, [hl]                                  ;; 15:4227 $7E
    inc  [hl]                                     ;; 15:4228 $34
    cp   $0D                                      ;; 15:4229 $FE $0D
    jr   c, .pushLink                             ;; 15:422B $38 $0C

    ld   [hl], b                                  ;; 15:422D $70
    ld   hl, wEntitiesPosYTable                   ;; 15:422E $21 $10 $C2
    add  hl, bc                                   ;; 15:4231 $09
    dec  [hl]                                     ;; 15:4232 $35
    jr   .pushLink                                ;; 15:4233 $18 $04

.fullyClosed
    ld   hl, hMultiPurposeG                       ;; 15:4235 $21 $E8 $FF
    inc  [hl]                                     ;; 15:4238 $34

.pushLink:
    jp   MovingBlockPushLinkIfNeeded              ;; 15:4239 $C3 $6F $41

MovingBlockBottomLeftEntityHandler::
    ld   de, MovingBlockSpriteVariants            ;; 15:423C $11 $FC $40
    call RenderActiveEntitySpritesPair            ;; 15:423F $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:4242 $CD $0D $7B
    xor  a                                        ;; 15:4245 $AF
    ldh  [hMultiPurposeG], a                      ;; 15:4246 $E0 $E8

    ldh  a, [hActiveEntityState]                  ;; 15:4248 $F0 $F0
    JP_TABLE                                      ;; 15:424A
._00 dw MovingBlockBottomLeftInitHandler          ;; 15:424B
._01 dw MovingBlockBottomLeftUpdateHandler        ;; 15:424D

MovingBlockBottomLeftInitHandler::
    ld   hl, wEntitiesPosXTable                   ;; 15:424F $21 $00 $C2
    add  hl, bc                                   ;; 15:4252 $09
    ld   a, [hl]                                  ;; 15:4253 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 15:4254 $21 $C0 $C2
    add  hl, bc                                   ;; 15:4257 $09
    ld   [hl], a                                  ;; 15:4258 $77
    add  $10                                      ;; 15:4259 $C6 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 15:425B $21 $B0 $C2
    add  hl, bc                                   ;; 15:425E $09
    ld   [hl], a                                  ;; 15:425F $77
    jp   IncrementEntityState                     ;; 15:4260 $C3 $12 $3B

MovingBlockBottomLeftUpdateHandler::
    ldh  a, [hMovingBlockMoverState]              ;; 15:4263 $F0 $BA
    cp   $02                                      ;; 15:4265 $FE $02
    jr   z, .pushLink                             ;; 15:4267 $28 $42

    and  a                                        ;; 15:4269 $A7
    jr   z, .moverNotGrabbed                      ;; 15:426A $28 $1D
    
    ; If the moving block mover is being pulled
    ld   hl, wEntitiesInertiaTable                ;; 15:426C $21 $D0 $C3
    add  hl, bc                                   ;; 15:426F $09
    inc  [hl]                                     ;; 15:4270 $34
    ld   a, [hl]                                  ;; 15:4271 $7E
    cp   $0A                                      ;; 15:4272 $FE $0A
    jr   c, .return                               ;; 15:4274 $38 $12

    ld   [hl], b                                  ;; 15:4276 $70
    ld   a, NOISE_SFX_RUMBLE                      ;; 15:4277 $3E $11
    ldh  [hNoiseSfx], a                           ;; 15:4279 $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ;; 15:427B $21 $C0 $C2
    add  hl, bc                                   ;; 15:427E $09
    ld   a, [hl]                                  ;; 15:427F $7E
    ld   hl, wEntitiesPosXTable                   ;; 15:4280 $21 $00 $C2
    add  hl, bc                                   ;; 15:4283 $09
    cp   [hl]                                     ;; 15:4284 $BE
    jr   z, .return                               ;; 15:4285 $28 $01

    dec  [hl]                                     ;; 15:4287 $35

.return
    ret                                           ;; 15:4288 $C9

.moverNotGrabbed
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4289 $21 $B0 $C2
    add  hl, bc                                   ;; 15:428C $09
    ld   a, [hl]                                  ;; 15:428D $7E
    ld   hl, wEntitiesPosXTable                   ;; 15:428E $21 $00 $C2
    add  hl, bc                                   ;; 15:4291 $09
    cp   [hl]                                     ;; 15:4292 $BE
    jr   z, .fullyClosed                          ;; 15:4293 $28 $12

    ld   hl, wEntitiesInertiaTable                ;; 15:4295 $21 $D0 $C3
    add  hl, bc                                   ;; 15:4298 $09
    ld   a, [hl]                                  ;; 15:4299 $7E
    inc  [hl]                                     ;; 15:429A $34
    cp   $0D                                      ;; 15:429B $FE $0D
    jr   c, .pushLink                             ;; 15:429D $38 $0C

    ld   [hl], b                                  ;; 15:429F $70
    ld   hl, wEntitiesPosXTable                   ;; 15:42A0 $21 $00 $C2
    add  hl, bc                                   ;; 15:42A3 $09
    inc  [hl]                                     ;; 15:42A4 $34
    jr   .pushLink                                ;; 15:42A5 $18 $04

.fullyClosed
    ld   hl, hMultiPurposeG                       ;; 15:42A7 $21 $E8 $FF
    inc  [hl]                                     ;; 15:42AA $34

.pushLink
    jp   MovingBlockPushLinkIfNeeded              ;; 15:42AB $C3 $6F $41

MovingBlockBottomRightEntityHandler:
    ld   de, MovingBlockSpriteVariants            ;; 15:42AE $11 $FC $40
    call RenderActiveEntitySpritesPair            ;; 15:42B1 $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:42B4 $CD $0D $7B
    xor  a                                        ;; 15:42B7 $AF
    ldh  [hMultiPurposeG], a                      ;; 15:42B8 $E0 $E8

    ldh  a, [hActiveEntityState]                  ;; 15:42BA $F0 $F0
    JP_TABLE                                      ;; 15:42BC
._00 dw MovingBlockBottomRightInitHandler         ;; 15:42BD
._01 dw MovingBlockBottomRightUpdateHandler       ;; 15:42BF

MovingBlockBottomRightInitHandler::
    ld   hl, wEntitiesPosXTable                   ;; 15:42C1 $21 $00 $C2
    add  hl, bc                                   ;; 15:42C4 $09
    ld   a, [hl]                                  ;; 15:42C5 $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 15:42C6 $21 $C0 $C2
    add  hl, bc                                   ;; 15:42C9 $09
    ld   [hl], a                                  ;; 15:42CA $77
    sub  $10                                      ;; 15:42CB $D6 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 15:42CD $21 $B0 $C2
    add  hl, bc                                   ;; 15:42D0 $09
    ld   [hl], a                                  ;; 15:42D1 $77
    jp   IncrementEntityState                     ;; 15:42D2 $C3 $12 $3B

MovingBlockBottomRightUpdateHandler::
    ldh  a, [hMovingBlockMoverState]              ;; 15:42D5 $F0 $BA
    cp   $02                                      ;; 15:42D7 $FE $02
    jr   z, .pushLink                             ;; 15:42D9 $28 $42

    and  a                                        ;; 15:42DB $A7
    jr   z, .moverNotGrabbed                      ;; 15:42DC $28 $1D

    ; If the moving block mover is being pulled
    ld   hl, wEntitiesInertiaTable                ;; 15:42DE $21 $D0 $C3
    add  hl, bc                                   ;; 15:42E1 $09
    inc  [hl]                                     ;; 15:42E2 $34
    ld   a, [hl]                                  ;; 15:42E3 $7E
    cp   $0A                                      ;; 15:42E4 $FE $0A
    jr   c, .return                               ;; 15:42E6 $38 $12

    ld   [hl], b                                  ;; 15:42E8 $70
    ld   a, NOISE_SFX_RUMBLE                      ;; 15:42E9 $3E $11
    ldh  [hNoiseSfx], a                           ;; 15:42EB $E0 $F4
    ld   hl, wEntitiesPrivateState2Table          ;; 15:42ED $21 $C0 $C2
    add  hl, bc                                   ;; 15:42F0 $09
    ld   a, [hl]                                  ;; 15:42F1 $7E
    ld   hl, wEntitiesPosXTable                   ;; 15:42F2 $21 $00 $C2
    add  hl, bc                                   ;; 15:42F5 $09
    cp   [hl]                                     ;; 15:42F6 $BE
    jr   z, .return                               ;; 15:42F7 $28 $01

    inc  [hl]                                     ;; 15:42F9 $34

.return
    ret                                           ;; 15:42FA $C9

.moverNotGrabbed
    ld   hl, wEntitiesPrivateState1Table          ;; 15:42FB $21 $B0 $C2
    add  hl, bc                                   ;; 15:42FE $09
    ld   a, [hl]                                  ;; 15:42FF $7E
    ld   hl, wEntitiesPosXTable                   ;; 15:4300 $21 $00 $C2
    add  hl, bc                                   ;; 15:4303 $09
    cp   [hl]                                     ;; 15:4304 $BE
    jr   z, .fullyClosed                          ;; 15:4305 $28 $12

    ld   hl, wEntitiesInertiaTable                ;; 15:4307 $21 $D0 $C3
    add  hl, bc                                   ;; 15:430A $09
    ld   a, [hl]                                  ;; 15:430B $7E
    inc  [hl]                                     ;; 15:430C $34
    cp   $0D                                      ;; 15:430D $FE $0D
    jr   c, .pushLink                             ;; 15:430F $38 $0C

    ld   [hl], b                                  ;; 15:4311 $70
    ld   hl, wEntitiesPosXTable                   ;; 15:4312 $21 $00 $C2
    add  hl, bc                                   ;; 15:4315 $09
    dec  [hl]                                     ;; 15:4316 $35
    jr   .pushLink                                ;; 15:4317 $18 $04

.fullyClosed
    ld   hl, hMultiPurposeG                       ;; 15:4319 $21 $E8 $FF
    inc  [hl]                                     ;; 15:431C $34

.pushLink
    jp   MovingBlockPushLinkIfNeeded              ;; 15:431D $C3 $6F $41
