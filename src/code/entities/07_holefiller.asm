; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HoleFillerSpriteVariants::
.variant0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

HoleFillerEntityHandler::
    ld   de, HoleFillerSpriteVariants             ;; 07:510C $11 $04 $51
    call RenderActiveEntitySpritesPair            ;; 07:510F $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:5112 $CD $96 $7D
    ldh  a, [hFrameCounter]                       ;; 07:5115 $F0 $E7
    rra                                           ;; 07:5117 $1F
    rra                                           ;; 07:5118 $1F
    rra                                           ;; 07:5119 $1F
    rra                                           ;; 07:511A $1F
    and  $01                                      ;; 07:511B $E6 $01
    call SetEntitySpriteVariant                   ;; 07:511D $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ;; 07:5120 $F0 $F0
    JP_TABLE                                      ;; 07:5122
._00 dw HoleFillerIdleState                       ;; 07:5123
._01 dw HoleFillerMovingState                     ;; 07:5125

HoleFillerDirectionToXSpeedTable::
    db   $08, $F8, $00, $00

HoleFillerDirectionToYSpeedTable::
    db   $00, $00, $F8, $08

HoleFillerIdleState::
    call PushLinkOutOfEntity_07                   ;; 07:512F $CD $F0 $7C
    jr   nc, .doNotStartMovement                  ;; 07:5132 $30 $3A

    ldh  a, [hPressedButtonsMask]                 ;; 07:5134 $F0 $CB
    and  $0F                                      ;; 07:5136 $E6 $0F
    jr   z, .doNotStartMovement                   ;; 07:5138 $28 $34

    ld   a, $01                                   ;; 07:513A $3E $01
    ld   [wIsLinkPushing], a                      ;; 07:513C $EA $44 $C1
    ld   hl, wEntitiesInertiaTable                ;; 07:513F $21 $D0 $C3
    add  hl, bc                                   ;; 07:5142 $09
    ld   a, [hl]                                  ;; 07:5143 $7E
    inc  a                                        ;; 07:5144 $3C
    ld   [hl], a                                  ;; 07:5145 $77
    cp   $10                                      ;; 07:5146 $FE $10
    jr   nz, .ret                                 ;; 07:5148 $20 $29

    call IncrementEntityState                     ;; 07:514A $CD $12 $3B
    call GetEntityDirectionToLink_07              ;; 07:514D $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:5150 $21 $80 $C3
    add  hl, bc                                   ;; 07:5153 $09
    ld   a, e                                     ;; 07:5154 $7B
    xor  $01                                      ;; 07:5155 $EE $01
    ld   e, a                                     ;; 07:5157 $5F
    ld   [hl], e                                  ;; 07:5158 $73
; Set the speed by the direction in register E
.setSpeedByDirection::
    ld   d, b                                     ;; 07:5159 $50
    ld   hl, HoleFillerDirectionToXSpeedTable     ;; 07:515A $21 $27 $51
    add  hl, de                                   ;; 07:515D $19
    ld   a, [hl]                                  ;; 07:515E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:515F $21 $40 $C2
    add  hl, bc                                   ;; 07:5162 $09
    ld   [hl], a                                  ;; 07:5163 $77
    ld   hl, HoleFillerDirectionToYSpeedTable     ;; 07:5164 $21 $2B $51
    add  hl, de                                   ;; 07:5167 $19
    ld   a, [hl]                                  ;; 07:5168 $7E
    call GetEntitySpeedYAddress                   ;; 07:5169 $CD $05 $40
    ld   [hl], a                                  ;; 07:516C $77
    ret                                           ;; 07:516D $C9

.doNotStartMovement:
    ld   hl, wEntitiesInertiaTable                ;; 07:516E $21 $D0 $C3
    add  hl, bc                                   ;; 07:5171 $09
    ld   [hl], b                                  ;; 07:5172 $70

.ret:
    ret                                           ;; 07:5173 $C9

Data_007_5174::
    db   $10, $F0, $00, $00

Data_007_5178::
    db   $00, $00, $F0, $10

HoleFillerMovingState::
    ld   a, $01                                   ;; 07:517C $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:517E $E0 $A1
    ld   a, JINGLE_URCHIN_PUSH                    ;; 07:5180 $3E $3E
    ldh  [hJingle], a                             ;; 07:5182 $E0 $F2
    ldh  a, [hJoypadState]                        ;; 07:5184 $F0 $CC
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 07:5186 $E6 $0F
    ld   d, a                                     ;; 07:5188 $57
    jr   z, jr_007_51AA                           ;; 07:5189 $28 $1F

    and  $03                                      ;; 07:518B $E6 $03
    jr   z, jr_007_5198                           ;; 07:518D $28 $09

    ld   e, $00                                   ;; 07:518F $1E $00
    and  $01                                      ;; 07:5191 $E6 $01
    jr   nz, .jr_5196                             ;; 07:5193 $20 $01

    inc  e                                        ;; 07:5195 $1C

.jr_5196
    jr   jr_007_519F                              ;; 07:5196 $18 $07

jr_007_5198:
    ld   e, $02                                   ;; 07:5198 $1E $02
    bit  2, d                                     ;; 07:519A $CB $52
    jr   nz, jr_007_519F                          ;; 07:519C $20 $01

    inc  e                                        ;; 07:519E $1C

jr_007_519F:
    ld   hl, wEntitiesDirectionTable              ;; 07:519F $21 $80 $C3
    add  hl, bc                                   ;; 07:51A2 $09
    ld   a, [hl]                                  ;; 07:51A3 $7E
    xor  e                                        ;; 07:51A4 $AB
    cp   $01                                      ;; 07:51A5 $FE $01
    jr   z, jr_007_51AA                           ;; 07:51A7 $28 $01

    ld   [hl], e                                  ;; 07:51A9 $73

jr_007_51AA:
    call UpdateEntityPosWithSpeed_07              ;; 07:51AA $CD $0A $7E
    ld   hl, wEntitiesPosXTable                   ;; 07:51AD $21 $00 $C2
    add  hl, bc                                   ;; 07:51B0 $09
    ld   a, [hl]                                  ;; 07:51B1 $7E
    sub  $08                                      ;; 07:51B2 $D6 $08
    ld   hl, wEntitiesPosYTable                   ;; 07:51B4 $21 $10 $C2
    add  hl, bc                                   ;; 07:51B7 $09
    or   [hl]                                     ;; 07:51B8 $B6
    and  $0F                                      ;; 07:51B9 $E6 $0F
    jp   nz, .ret                                 ;; 07:51BB $C2 $9F $52

    ld   a, [hl]                                  ;; 07:51BE $7E
    sub  $10                                      ;; 07:51BF $D6 $10
    ldh  [hIntersectedObjectTop], a               ;; 07:51C1 $E0 $CD
    ld   hl, wEntitiesPosXTable                   ;; 07:51C3 $21 $00 $C2
    add  hl, bc                                   ;; 07:51C6 $09
    ld   a, [hl]                                  ;; 07:51C7 $7E
    sub  $08                                      ;; 07:51C8 $D6 $08
    ldh  [hIntersectedObjectLeft], a              ;; 07:51CA $E0 $CE
    swap a                                        ;; 07:51CC $CB $37
    and  $0F                                      ;; 07:51CE $E6 $0F
    ld   e, a                                     ;; 07:51D0 $5F
    ldh  a, [hIntersectedObjectTop]               ;; 07:51D1 $F0 $CD
    and  $F0                                      ;; 07:51D3 $E6 $F0
    or   e                                        ;; 07:51D5 $B3
    ld   e, a                                     ;; 07:51D6 $5F
    ld   d, b                                     ;; 07:51D7 $50
    ld   hl, wRoomObjects                         ;; 07:51D8 $21 $11 $D7
    add  hl, de                                   ;; 07:51DB $19
    ld   [hl], $0D                                ;; 07:51DC $36 $0D
    call label_2887                               ;; 07:51DE $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 07:51E1 $F0 $FE
    and  a                                        ;; 07:51E3 $A7
    jr   z, .noGBC                                ;; 07:51E4 $28 $0C
    push bc                                       ;; 07:51E6 $C5
    ld   a, $0D                                   ;; 07:51E7 $3E $0D
    ld   [wDDD8], a                               ;; 07:51E9 $EA $D8 $DD
    ld   a, $07                                   ;; 07:51EC $3E $07
    call func_91D                                 ;; 07:51EE $CD $1D $09
    pop  bc                                       ;; 07:51F1 $C1
.noGBC
    ld   hl, wDrawCommand                         ;; 07:51F2 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 07:51F5 $FA $00 $D6
    ld   e, a                                     ;; 07:51F8 $5F
    add  $0A                                      ;; 07:51F9 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 07:51FB $EA $00 $D6
    ld   d, $00                                   ;; 07:51FE $16 $00
    add  hl, de                                   ;; 07:5200 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:5201 $F0 $CF
    ld   [hl+], a                                 ;; 07:5203 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:5204 $F0 $D0
    ld   [hl+], a                                 ;; 07:5206 $22
    ld   a, $81                                   ;; 07:5207 $3E $81
    ld   [hl+], a                                 ;; 07:5209 $22
    ld   a, $10                                   ;; 07:520A $3E $10
    ld   [hl+], a                                 ;; 07:520C $22
    ld   a, $12                                   ;; 07:520D $3E $12
    ld   [hl+], a                                 ;; 07:520F $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:5210 $F0 $CF
    ld   [hl+], a                                 ;; 07:5212 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:5213 $F0 $D0
    inc  a                                        ;; 07:5215 $3C
    ld   [hl+], a                                 ;; 07:5216 $22
    ld   a, $81                                   ;; 07:5217 $3E $81
    ld   [hl+], a                                 ;; 07:5219 $22
    ld   a, $11                                   ;; 07:521A $3E $11
    ld   [hl+], a                                 ;; 07:521C $22
    ld   a, $13                                   ;; 07:521D $3E $13
    ld   [hl+], a                                 ;; 07:521F $22
    ld   [hl], b                                  ;; 07:5220 $70
    ld   hl, wEntitiesDirectionTable              ;; 07:5221 $21 $80 $C3
    add  hl, bc                                   ;; 07:5224 $09
    ld   e, [hl]                                  ;; 07:5225 $5E
    call HoleFillerIdleState.setSpeedByDirection  ;; 07:5226 $CD $59 $51
    ld   hl, wEntitiesDirectionTable              ;; 07:5229 $21 $80 $C3
    add  hl, bc                                   ;; 07:522C $09
    ld   e, [hl]                                  ;; 07:522D $5E
    ld   d, b                                     ;; 07:522E $50
    ld   hl, Data_007_5174                        ;; 07:522F $21 $74 $51
    add  hl, de                                   ;; 07:5232 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 07:5233 $F0 $CE
    add  [hl]                                     ;; 07:5235 $86
    swap a                                        ;; 07:5236 $CB $37
    and  $0F                                      ;; 07:5238 $E6 $0F
    push af                                       ;; 07:523A $F5
    ld   hl, Data_007_5178                        ;; 07:523B $21 $78 $51
    add  hl, de                                   ;; 07:523E $19
    pop  af                                       ;; 07:523F $F1
    ld   e, a                                     ;; 07:5240 $5F
    ldh  a, [hIntersectedObjectTop]               ;; 07:5241 $F0 $CD
    add  [hl]                                     ;; 07:5243 $86
    and  $F0                                      ;; 07:5244 $E6 $F0
    or   e                                        ;; 07:5246 $B3
    ld   e, a                                     ;; 07:5247 $5F
    ld   d, b                                     ;; 07:5248 $50
    ld   hl, wRoomObjects                         ;; 07:5249 $21 $11 $D7
    add  hl, de                                   ;; 07:524C $19
    ld   e, [hl]                                  ;; 07:524D $5E
    ld   d, $01                                   ;; 07:524E $16 $01
    call GetObjectPhysicsFlags_trampoline         ;; 07:5250 $CD $26 $2A
    cp   $0B                                      ;; 07:5253 $FE $0B
    jr   z, .ret                                  ;; 07:5255 $28 $48

    cp   $50                                      ;; 07:5257 $FE $50
    jr   z, .ret                                  ;; 07:5259 $28 $44

    cp   $51                                      ;; 07:525B $FE $51
    jr   z, .ret                                  ;; 07:525D $28 $40

    ldh  a, [hActiveEntityPosX]                   ;; 07:525F $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 07:5261 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5263 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 07:5265 $E0 $D8
    ld   a, JINGLE_POOF                           ;; 07:5267 $3E $2F
    ldh  [hJingle], a                             ;; 07:5269 $E0 $F2
    ld   a, TRANSCIENT_VFX_POOF                   ;; 07:526B $3E $02
    call AddTranscientVfx                         ;; 07:526D $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ;; 07:5270 $21 $20 $C5
    add  hl, de                                   ;; 07:5273 $19
    ld   [hl], $0F                                ;; 07:5274 $36 $0F
    call ClearEntityStatus_07                     ;; 07:5276 $CD $A4 $7E
    ld   a, [wRoomEvent]                          ;; 07:5279 $FA $8E $C1
    and  $0F                                      ;; 07:527C $E6 $0F
    cp   TRIGGER_FILL_LAVA_GAPS                   ;; 07:527E $FE $0E
    jr   nz, .ret                                 ;; 07:5280 $20 $1D

    push bc                                       ;; 07:5282 $C5
    ld   c, b                                     ;; 07:5283 $48
    ld   hl, wRoomObjectsArea                     ;; 07:5284 $21 $00 $D7

.loop_5287
    ld   a, [hl+]                                 ;; 07:5287 $2A
    push hl                                       ;; 07:5288 $E5
    ld   e, a                                     ;; 07:5289 $5F
    ld   d, $01                                   ;; 07:528A $16 $01
    call GetObjectPhysicsFlags_trampoline         ;; 07:528C $CD $26 $2A
    pop  hl                                       ;; 07:528F $E1
    cp   $50                                      ;; 07:5290 $FE $50
    jr   z, .jr_529E                              ;; 07:5292 $28 $0A

    cp   $51                                      ;; 07:5294 $FE $51
    jr   z, .jr_529E                              ;; 07:5296 $28 $06

    dec  c                                        ;; 07:5298 $0D
    jr   nz, .loop_5287                           ;; 07:5299 $20 $EC

    call MarkTriggerAsResolved                    ;; 07:529B $CD $60 $0C

.jr_529E
    pop  bc                                       ;; 07:529E $C1

.ret:
    ret                                           ;; 07:529F $C9
