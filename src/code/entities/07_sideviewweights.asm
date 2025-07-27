; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SideViewWeightsSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_7 | OAMF_PAL0
    db $50, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP

SideViewWeightsEntityHandler::
    ld   de, SideViewWeightsSpriteVariants        ;; 07:61D2 $11 $CE $61
    call RenderActiveEntitySpritesPair            ;; 07:61D5 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:61D8 $CD $96 $7D
    call func_007_639E                            ;; 07:61DB $CD $9E $63
    ld   hl, wEntitiesPrivateState3Table          ;; 07:61DE $21 $D0 $C2
    add  hl, bc                                   ;; 07:61E1 $09
    ld   a, [hl]                                  ;; 07:61E2 $7E
    ld   e, a                                     ;; 07:61E3 $5F
    and  a                                        ;; 07:61E4 $A7
    jr   nz, .jr_61FA                             ;; 07:61E5 $20 $13

    ld   hl, wEntitiesPrivateState2Table          ;; 07:61E7 $21 $C0 $C2
    add  hl, bc                                   ;; 07:61EA $09
    ld   a, [hl]                                  ;; 07:61EB $7E
    and  a                                        ;; 07:61EC $A7
    jr   z, jr_007_6248                           ;; 07:61ED $28 $59

    call func_007_631C                            ;; 07:61EF $CD $1C $63
    ld   hl, wEntitiesPrivateState3Table          ;; 07:61F2 $21 $D0 $C2
    add  hl, de                                   ;; 07:61F5 $19
    ld   [hl], $F0                                ;; 07:61F6 $36 $F0
    ld   e, $10                                   ;; 07:61F8 $1E $10

.jr_61FA
    ldh  a, [hFrameCounter]                       ;; 07:61FA $F0 $E7
    and  $01                                      ;; 07:61FC $E6 $01
    jr   nz, jr_007_620E                          ;; 07:61FE $20 $0E

    call GetEntitySpeedYAddress                   ;; 07:6200 $CD $05 $40
    ld   a, [hl]                                  ;; 07:6203 $7E
    sub  e                                        ;; 07:6204 $93
    jr   z, jr_007_620E                           ;; 07:6205 $28 $07

    and  $80                                      ;; 07:6207 $E6 $80
    jr   z, .jr_620D                              ;; 07:6209 $28 $02

    inc  [hl]                                     ;; 07:620B $34
    inc  [hl]                                     ;; 07:620C $34

.jr_620D
    dec  [hl]                                     ;; 07:620D $35

jr_007_620E:
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:620E $21 $50 $C3
    add  hl, bc                                   ;; 07:6211 $09
    ld   [hl], $02                                ;; 07:6212 $36 $02
    call GetEntitySpeedYAddress                   ;; 07:6214 $CD $05 $40
    ld   a, [hl]                                  ;; 07:6217 $7E
    push hl                                       ;; 07:6218 $E5
    push af                                       ;; 07:6219 $F5
    ld   [hl], e                                  ;; 07:621A $73
    ld   hl, wEntitiesPosYTable                   ;; 07:621B $21 $10 $C2
    add  hl, bc                                   ;; 07:621E $09
    ld   a, [hl]                                  ;; 07:621F $7E
    push hl                                       ;; 07:6220 $E5
    push af                                       ;; 07:6221 $F5
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:6222 $CD $23 $3B
    pop  af                                       ;; 07:6225 $F1
    pop  hl                                       ;; 07:6226 $E1
    ld   [hl], a                                  ;; 07:6227 $77
    pop  af                                       ;; 07:6228 $F1
    pop  hl                                       ;; 07:6229 $E1
    ld   [hl], a                                  ;; 07:622A $77
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:622B $21 $50 $C3
    add  hl, bc                                   ;; 07:622E $09
    ld   [hl], $30                                ;; 07:622F $36 $30
    ld   hl, wEntitiesCollisionsTable             ;; 07:6231 $21 $A0 $C2
    add  hl, bc                                   ;; 07:6234 $09
    ld   a, [hl]                                  ;; 07:6235 $7E
    and  a                                        ;; 07:6236 $A7
    jr   z, .jr_6246                              ;; 07:6237 $28 $0D

    call GetEntitySpeedYAddress                   ;; 07:6239 $CD $05 $40
    ld   [hl], b                                  ;; 07:623C $70
    call func_007_631C                            ;; 07:623D $CD $1C $63
    ld   hl, wEntitiesSpeedYTable                 ;; 07:6240 $21 $50 $C2
    add  hl, de                                   ;; 07:6243 $19
    ld   [hl], $00                                ;; 07:6244 $36 $00

.jr_6246
    jr   jr_007_625F                              ;; 07:6246 $18 $17

jr_007_6248:
    call GetEntitySpeedYAddress                   ;; 07:6248 $CD $05 $40
    ld   a, [hl]                                  ;; 07:624B $7E
    and  a                                        ;; 07:624C $A7
    jr   z, jr_007_6256                           ;; 07:624D $28 $07

    and  $80                                      ;; 07:624F $E6 $80
    jr   z, .jr_6255                              ;; 07:6251 $28 $02

    inc  [hl]                                     ;; 07:6253 $34
    inc  [hl]                                     ;; 07:6254 $34

.jr_6255
    dec  [hl]                                     ;; 07:6255 $35

jr_007_6256:
    call func_007_631C                            ;; 07:6256 $CD $1C $63
    ld   hl, wEntitiesPrivateState3Table          ;; 07:6259 $21 $D0 $C2
    add  hl, de                                   ;; 07:625C $19
    ld   [hl], $00                                ;; 07:625D $36 $00

jr_007_625F:
    ldh  a, [hActiveEntityPosY]                   ;; 07:625F $F0 $EF
    and  $0F                                      ;; 07:6261 $E6 $0F
    cp   $00                                      ;; 07:6263 $FE $00
    jr   nz, ret_007_62D1                         ;; 07:6265 $20 $6A

    ldh  a, [hActiveEntityPosY]                   ;; 07:6267 $F0 $EF
    sub  $10                                      ;; 07:6269 $D6 $10
    ldh  [hIntersectedObjectTop], a               ;; 07:626B $E0 $CD
    and  $F0                                      ;; 07:626D $E6 $F0
    ld   e, a                                     ;; 07:626F $5F
    ldh  a, [hActiveEntityPosX]                   ;; 07:6270 $F0 $EE
    sub  $08                                      ;; 07:6272 $D6 $08
    ldh  [hIntersectedObjectLeft], a              ;; 07:6274 $E0 $CE
    swap a                                        ;; 07:6276 $CB $37
    and  $0F                                      ;; 07:6278 $E6 $0F
    or   e                                        ;; 07:627A $B3
    ld   e, a                                     ;; 07:627B $5F
    ld   d, b                                     ;; 07:627C $50
    call GetEntitySpeedYAddress                   ;; 07:627D $CD $05 $40
    ld   a, [hl]                                  ;; 07:6280 $7E
    and  a                                        ;; 07:6281 $A7
    jr   z, ret_007_62D1                          ;; 07:6282 $28 $4D

    and  $80                                      ;; 07:6284 $E6 $80
    jr   nz, jr_007_62D2                          ;; 07:6286 $20 $4A

    ld   hl, wRoomObjects                         ;; 07:6288 $21 $11 $D7
    add  hl, de                                   ;; 07:628B $19
    ld   [hl], $4D                                ;; 07:628C $36 $4D
    call label_2887                               ;; 07:628E $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 07:6291 $F0 $FE
    and  a                                        ;; 07:6293 $A7
    jr   z, .jr_62A2                              ;; 07:6294 $28 $0C

    push bc                                       ;; 07:6296 $C5
    ld   a, $4D                                   ;; 07:6297 $3E $4D
    ld   [wDDD8], a                               ;; 07:6299 $EA $D8 $DD
    ld   a, $07                                   ;; 07:629C $3E $07
    call func_91D                                 ;; 07:629E $CD $1D $09
    pop  bc                                       ;; 07:62A1 $C1

.jr_62A2
    ld   hl, wDrawCommand                         ;; 07:62A2 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 07:62A5 $FA $00 $D6
    ld   e, a                                     ;; 07:62A8 $5F
    add  $0A                                      ;; 07:62A9 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 07:62AB $EA $00 $D6
    ld   d, $00                                   ;; 07:62AE $16 $00
    add  hl, de                                   ;; 07:62B0 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:62B1 $F0 $CF
    ld   [hl+], a                                 ;; 07:62B3 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:62B4 $F0 $D0
    ld   [hl+], a                                 ;; 07:62B6 $22
    ld   a, $81                                   ;; 07:62B7 $3E $81
    ld   [hl+], a                                 ;; 07:62B9 $22
    ld   a, $44                                   ;; 07:62BA $3E $44
    ld   [hl+], a                                 ;; 07:62BC $22
    ld   a, $54                                   ;; 07:62BD $3E $54
    ld   [hl+], a                                 ;; 07:62BF $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:62C0 $F0 $CF
    ld   [hl+], a                                 ;; 07:62C2 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:62C3 $F0 $D0
    inc  a                                        ;; 07:62C5 $3C
    ld   [hl+], a                                 ;; 07:62C6 $22
    ld   a, $81                                   ;; 07:62C7 $3E $81
    ld   [hl+], a                                 ;; 07:62C9 $22
    ld   a, $45                                   ;; 07:62CA $3E $45
    ld   [hl+], a                                 ;; 07:62CC $22
    ld   a, $55                                   ;; 07:62CD $3E $55
    ld   [hl+], a                                 ;; 07:62CF $22
    ld   [hl], b                                  ;; 07:62D0 $70

ret_007_62D1:
    ret                                           ;; 07:62D1 $C9

jr_007_62D2:
    ld   hl, wRoomObjects                         ;; 07:62D2 $21 $11 $D7
    add  hl, de                                   ;; 07:62D5 $19
    ld   [hl], $04                                ;; 07:62D6 $36 $04
    call label_2887                               ;; 07:62D8 $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 07:62DB $F0 $FE
    and  a                                        ;; 07:62DD $A7
    jr   z, .jr_62EC                              ;; 07:62DE $28 $0C

    push bc                                       ;; 07:62E0 $C5
    ld   a, $04                                   ;; 07:62E1 $3E $04
    ld   [wDDD8], a                               ;; 07:62E3 $EA $D8 $DD
    ld   a, $07                                   ;; 07:62E6 $3E $07
    call func_91D                                 ;; 07:62E8 $CD $1D $09
    pop  bc                                       ;; 07:62EB $C1

.jr_62EC
    ld   hl, wDrawCommand                         ;; 07:62EC $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 07:62EF $FA $00 $D6
    ld   e, a                                     ;; 07:62F2 $5F
    add  $0A                                      ;; 07:62F3 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 07:62F5 $EA $00 $D6
    ld   d, $00                                   ;; 07:62F8 $16 $00
    add  hl, de                                   ;; 07:62FA $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:62FB $F0 $CF
    ld   [hl+], a                                 ;; 07:62FD $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:62FE $F0 $D0
    ld   [hl+], a                                 ;; 07:6300 $22
    ld   a, $81                                   ;; 07:6301 $3E $81
    ld   [hl+], a                                 ;; 07:6303 $22
    ld   a, $7E                                   ;; 07:6304 $3E $7E
    ld   [hl+], a                                 ;; 07:6306 $22
    ld   a, $7E                                   ;; 07:6307 $3E $7E
    ld   [hl+], a                                 ;; 07:6309 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 07:630A $F0 $CF
    ld   [hl+], a                                 ;; 07:630C $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 07:630D $F0 $D0
    inc  a                                        ;; 07:630F $3C
    ld   [hl+], a                                 ;; 07:6310 $22
    ld   a, $81                                   ;; 07:6311 $3E $81
    ld   [hl+], a                                 ;; 07:6313 $22
    ld   a, $7E                                   ;; 07:6314 $3E $7E
    ld   [hl+], a                                 ;; 07:6316 $22
    ld   a, $7E                                   ;; 07:6317 $3E $7E
    ld   [hl+], a                                 ;; 07:6319 $22
    ld   [hl], b                                  ;; 07:631A $70
    ret                                           ;; 07:631B $C9

func_007_631C::
    ld   hl, wEntitiesLoadOrderTable              ;; 07:631C $21 $60 $C4
    add  hl, bc                                   ;; 07:631F $09
    ld   a, [hl]                                  ;; 07:6320 $7E
    xor  $01                                      ;; 07:6321 $EE $01
    ldh  [hMultiPurpose0], a                      ;; 07:6323 $E0 $D7
    ld   e, b                                     ;; 07:6325 $58
    ld   d, b                                     ;; 07:6326 $50

jr_007_6327:
    ld   hl, wEntitiesStatusTable                 ;; 07:6327 $21 $80 $C2
    add  hl, de                                   ;; 07:632A $19
    ld   a, [hl]                                  ;; 07:632B $7E
    and  a                                        ;; 07:632C $A7
    jr   z, .jr_6341                              ;; 07:632D $28 $12

    ld   hl, wEntitiesTypeTable                   ;; 07:632F $21 $A0 $C3
    add  hl, de                                   ;; 07:6332 $19
    ld   a, [hl]                                  ;; 07:6333 $7E
    cp   $A6                                      ;; 07:6334 $FE $A6
    jr   nz, .jr_6341                             ;; 07:6336 $20 $09

    ld   hl, wEntitiesLoadOrderTable              ;; 07:6338 $21 $60 $C4
    add  hl, de                                   ;; 07:633B $19
    ldh  a, [hMultiPurpose0]                      ;; 07:633C $F0 $D7
    cp   [hl]                                     ;; 07:633E $BE
    jr   z, ret_007_6347                          ;; 07:633F $28 $06

.jr_6341
    inc  e                                        ;; 07:6341 $1C
    ld   a, e                                     ;; 07:6342 $7B
    cp   $10                                      ;; 07:6343 $FE $10
    jr   nz, jr_007_6327                          ;; 07:6345 $20 $E0

ret_007_6347:
    ret                                           ;; 07:6347 $C9
