RotoswitchRedEntityHandler::
RotoswitchYellowEntityHandler::
RotoswitchBlueEntityHandler::
    ld   hl, wEntitiesHealthTable                 ;; 36:6241 $21 $60 $C3
    add  hl, bc                                   ;; 36:6244 $09
    ld   [hl], $FF                                ;; 36:6245 $36 $FF
    call renderRotoswitch                         ;; 36:6247 $CD $C2 $63
    call PushLinkOutOfEntity_36                   ;; 36:624A $CD $5C $6B
    ld   a, [wRoomEventEffectExecuted]            ;; 36:624D $FA $8F $C1
    and  a                                        ;; 36:6250 $A7
    jr   z, .puzzleNotCompleted                   ;; 36:6251 $28 $0C

    xor  a                                        ;; 36:6253 $AF
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:6254 $21 $20 $C4
    add  hl, bc                                   ;; 36:6257 $09
    ld   [hl], a                                  ;; 36:6258 $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:6259 $21 $10 $C4
    add  hl, bc                                   ;; 36:625C $09
    ld   [hl], a                                  ;; 36:625D $77
    ret                                           ;; 36:625E $C9

.puzzleNotCompleted
    ldh  a, [hActiveEntityState]                  ;; 36:625F $F0 $F0
    bit  7, a                                     ;; 36:6261 $CB $7F
    ret  nz                                       ;; 36:6263 $C0

    ldh  a, [hActiveEntityState]                  ;; 36:6264 $F0 $F0
    JP_TABLE                                      ;; 36:6266
._00 dw RotoswitchState0Handler
._01 dw RotoswitchState1Handler
._02 dw RotoswitchState2Handler

RotoswitchState0Handler::
    call ReturnIfNonInteractive_36                ;; 36:626D $CD $40 $6A
    call label_3B70                               ;; 36:6270 $CD $70 $3B

.jr_6273
    call ApplyEntityInteractionWithBackground_trampoline ;; 36:6273 $CD $23 $3B
    call PointHLToEntitySpriteVariant             ;; 36:6276 $CD $02 $6C
    ld   a, [hl]                                  ;; 36:6279 $7E
    and  $03                                      ;; 36:627A $E6 $03
    jr   nz, .ret_629E                            ;; 36:627C $20 $20

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:627E $21 $10 $C4
    add  hl, bc                                   ;; 36:6281 $09
    ld   a, [hl]                                  ;; 36:6282 $7E
    and  a                                        ;; 36:6283 $A7
    jr   z, .ret_629E                             ;; 36:6284 $28 $18

    ld   a, $04                                   ;; 36:6286 $3E $04
    call SetEntityTransitionCountdown_36          ;; 36:6288 $CD $83 $6C
    call PointHLToEntitySpriteVariant             ;; 36:628B $CD $02 $6C
    inc  [hl]                                     ;; 36:628E $34
    xor  a                                        ;; 36:628F $AF
    ld   hl, wEntitiesFlashCountdownTable         ;; 36:6290 $21 $20 $C4
    add  hl, bc                                   ;; 36:6293 $09
    ld   [hl], a                                  ;; 36:6294 $77
    call func_036_629F                            ;; 36:6295 $CD $9F $62
    call IncrementEntityState                     ;; 36:6298 $CD $12 $3B
    call IncrementEntityState                     ;; 36:629B $CD $12 $3B

.ret_629E
    ret                                           ;; 36:629E $C9

func_036_629F::
    call PointHLToEntityPosX                      ;; 36:629F $CD $23 $6C
    ld   a, [hl]                                  ;; 36:62A2 $7E
    ldh  [hMultiPurpose0], a                      ;; 36:62A3 $E0 $D7
    call PointHLToEntityPosY                      ;; 36:62A5 $CD $28 $6C
    ld   a, [hl]                                  ;; 36:62A8 $7E
    ldh  [hMultiPurpose1], a                      ;; 36:62A9 $E0 $D8
    ld   de, $00                                  ;; 36:62AB $11 $00 $00

jr_036_62AE:
    ld   a, e                                     ;; 36:62AE $7B
    sub  c                                        ;; 36:62AF $91
    jr   z, jr_036_631A                           ;; 36:62B0 $28 $68

    ld   hl, wEntitiesTypeTable                   ;; 36:62B2 $21 $A0 $C3
    add  hl, de                                   ;; 36:62B5 $19
    ld   a, [hl]                                  ;; 36:62B6 $7E
    cp   $EF                                      ;; 36:62B7 $FE $EF
    jr   z, .jr_62C3                              ;; 36:62B9 $28 $08

    cp   $F0                                      ;; 36:62BB $FE $F0
    jr   z, .jr_62C3                              ;; 36:62BD $28 $04

    cp   $F1                                      ;; 36:62BF $FE $F1
    jr   nz, jr_036_631A                          ;; 36:62C1 $20 $57

.jr_62C3
    ld   hl, wEntitiesStateTable                  ;; 36:62C3 $21 $90 $C2
    add  hl, de                                   ;; 36:62C6 $19
    inc  [hl]                                     ;; 36:62C7 $34
    ld   hl, wEntitiesPosXTable                   ;; 36:62C8 $21 $00 $C2
    add  hl, de                                   ;; 36:62CB $19
    ldh  a, [hMultiPurpose0]                      ;; 36:62CC $F0 $D7
    cp   [hl]                                     ;; 36:62CE $BE
    jr   nz, jr_036_62EA                          ;; 36:62CF $20 $19

    ldh  a, [hMapRoom]                            ;; 36:62D1 $F0 $F6
    cp   UNKNOWN_ROOM_0A                          ;; 36:62D3 $FE $0A
    jr   nz, jr_036_630A                          ;; 36:62D5 $20 $33

    ld   hl, wEntitiesPosYTable                   ;; 36:62D7 $21 $10 $C2
    add  hl, de                                   ;; 36:62DA $19
    ldh  a, [hMultiPurpose1]                      ;; 36:62DB $F0 $D8
    sub  [hl]                                     ;; 36:62DD $96
    bit  7, a                                     ;; 36:62DE $CB $7F
    jr   z, .jr_62E4                              ;; 36:62E0 $28 $02

    cpl                                           ;; 36:62E2 $2F
    inc  a                                        ;; 36:62E3 $3C

.jr_62E4
    cp   $20                                      ;; 36:62E4 $FE $20
    jr   nz, jr_036_62EA                          ;; 36:62E6 $20 $02

    jr   jr_036_630A                              ;; 36:62E8 $18 $20

jr_036_62EA:
    ld   hl, wEntitiesPosYTable                   ;; 36:62EA $21 $10 $C2
    add  hl, de                                   ;; 36:62ED $19
    ldh  a, [hMultiPurpose1]                      ;; 36:62EE $F0 $D8
    cp   [hl]                                     ;; 36:62F0 $BE
    jr   nz, jr_036_631A                          ;; 36:62F1 $20 $27

    ldh  a, [hMapRoom]                            ;; 36:62F3 $F0 $F6
    cp   UNKNOWN_ROOM_0A                          ;; 36:62F5 $FE $0A
    jr   nz, jr_036_630A                          ;; 36:62F7 $20 $11

    ld   hl, wEntitiesPosXTable                   ;; 36:62F9 $21 $00 $C2
    add  hl, de                                   ;; 36:62FC $19
    ldh  a, [hMultiPurpose0]                      ;; 36:62FD $F0 $D7
    sub  [hl]                                     ;; 36:62FF $96
    bit  7, a                                     ;; 36:6300 $CB $7F
    jr   z, .jr_6306                              ;; 36:6302 $28 $02

    cpl                                           ;; 36:6304 $2F
    inc  a                                        ;; 36:6305 $3C

.jr_6306
    cp   $20                                      ;; 36:6306 $FE $20
    jr   nz, jr_036_631A                          ;; 36:6308 $20 $10

jr_036_630A:
    ld   hl, wEntitiesSpriteVariantTable          ;; 36:630A $21 $B0 $C3
    add  hl, de                                   ;; 36:630D $19
    inc  [hl]                                     ;; 36:630E $34
    ld   hl, wEntitiesTransitionCountdownTable    ;; 36:630F $21 $E0 $C2
    add  hl, de                                   ;; 36:6312 $19
    ld   [hl], $04                                ;; 36:6313 $36 $04
    ld   hl, wEntitiesStateTable                  ;; 36:6315 $21 $90 $C2
    add  hl, de                                   ;; 36:6318 $19
    inc  [hl]                                     ;; 36:6319 $34

jr_036_631A:
    inc  de                                       ;; 36:631A $13
    ld   a, e                                     ;; 36:631B $7B
    and  $0F                                      ;; 36:631C $E6 $0F
    jr   nz, jr_036_62AE                          ;; 36:631E $20 $8E

    ret                                           ;; 36:6320 $C9

RotoswitchState1Handler::
    ld   de, $00                                  ;; 36:6321 $11 $00 $00

jr_036_6324:
    ld   hl, wEntitiesTypeTable                   ;; 36:6324 $21 $A0 $C3
    add  hl, de                                   ;; 36:6327 $19
    ld   a, [hl]                                  ;; 36:6328 $7E
    cp   $EF                                      ;; 36:6329 $FE $EF
    jr   z, .jr_6335                              ;; 36:632B $28 $08

    cp   $F0                                      ;; 36:632D $FE $F0
    jr   z, .jr_6335                              ;; 36:632F $28 $04

    cp   $F1                                      ;; 36:6331 $FE $F1
    jr   nz, jr_036_634A                          ;; 36:6333 $20 $15

.jr_6335
    ld   hl, wEntitiesStateTable                  ;; 36:6335 $21 $90 $C2
    add  hl, de                                   ;; 36:6338 $19
    ld   a, [hl]                                  ;; 36:6339 $7E
    cp   $00                                      ;; 36:633A $FE $00
    jr   nz, jr_036_634A                          ;; 36:633C $20 $0C

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:633E $21 $10 $C4
    add  hl, bc                                   ;; 36:6341 $09
    xor  a                                        ;; 36:6342 $AF
    ld   [hl], a                                  ;; 36:6343 $77
    ld   a, $00                                   ;; 36:6344 $3E $00
    call SetEntityState                           ;; 36:6346 $CD $07 $6C
    ret                                           ;; 36:6349 $C9

jr_036_634A:
    inc  de                                       ;; 36:634A $13
    ld   a, e                                     ;; 36:634B $7B
    and  $0F                                      ;; 36:634C $E6 $0F
    jr   nz, jr_036_6324                          ;; 36:634E $20 $D4

    ret                                           ;; 36:6350 $C9

RotoswitchState2Handler::
    call GetEntityTransitionCountdown             ;; 36:6351 $CD $05 $0C
    jr   nz, .ret                                 ;; 36:6354 $20 $2B

    call PointHLToEntitySpriteVariant             ;; 36:6356 $CD $02 $6C
    ldh  a, [hMapRoom]                            ;; 36:6359 $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ;; 36:635B $FE $08
    jr   z, .jr_6364                              ;; 36:635D $28 $05

    call func_036_6382                            ;; 36:635F $CD $82 $63
    jr   .jr_6366                                 ;; 36:6362 $18 $02

.jr_6364
    ld   a, [hl]                                  ;; 36:6364 $7E
    inc  a                                        ;; 36:6365 $3C

.jr_6366:
    ld   [hl], a                                  ;; 36:6366 $77
    cp   $0C                                      ;; 36:6367 $FE $0C
    jr   nz, .jr_636C                             ;; 36:6369 $20 $01

    xor  a                                        ;; 36:636B $AF

.jr_636C
    ld   [hl], a                                  ;; 36:636C $77
    and  $03                                      ;; 36:636D $E6 $03
    jr   nz, .jr_637C                             ;; 36:636F $20 $0B

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 36:6371 $21 $10 $C4
    add  hl, bc                                   ;; 36:6374 $09
    xor  a                                        ;; 36:6375 $AF
    ld   [hl], a                                  ;; 36:6376 $77
    ld   a, $00                                   ;; 36:6377 $3E $00
    call SetEntityState                           ;; 36:6379 $CD $07 $6C

.jr_637C
    ld   a, $04                                   ;; 36:637C $3E $04
    call SetEntityTransitionCountdown_36          ;; 36:637E $CD $83 $6C

.ret:
    ret                                           ;; 36:6381 $C9

func_036_6382::
    ld   a, [hl]                                  ;; 36:6382 $7E
    inc  a                                        ;; 36:6383 $3C
    cp   $02                                      ;; 36:6384 $FE $02
    ret  nz                                       ;; 36:6386 $C0

    ld   a, $06                                   ;; 36:6387 $3E $06
    ret                                           ;; 36:6389 $C9

    ld   a, [hl]                                  ;; 36:638A $7E
    inc  a                                        ;; 36:638B $3C
    cp   $0A                                      ;; 36:638C $FE $0A
    ret  nz                                       ;; 36:638E $C0

    ld   a, $02                                   ;; 36:638F $3E $02
    ret                                           ;; 36:6391 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RotoswitchSpriteVariants::
.variant0
    db $70, $02
    db $70, $22
.variant1
    db $72, $02
    db $74, $02
.variant2
    db $76, $01
    db $76, $21
.variant3
    db $74, $21
    db $72, $21
.variant4
    db $70, $01
    db $70, $21
.variant5
    db $72, $01
    db $74, $01
.variant6
    db $76, $03
    db $76, $23
.variant7
    db $74, $23
    db $72, $23
.variant8
    db $70, $03
    db $70, $23
.variant9
    db $72, $03
    db $74, $03
.variant10
    db $76, $02
    db $76, $22
.variant11
    db $74, $22
    db $72, $22

renderRotoswitch::
    ld   de, RotoswitchSpriteVariants             ;; 36:63C2 $11 $92 $63
    call RenderActiveEntitySpritesPair            ;; 36:63C5 $CD $C0 $3B
    ret                                           ;; 36:63C8 $C9
