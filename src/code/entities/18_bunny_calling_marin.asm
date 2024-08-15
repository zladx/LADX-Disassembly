; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BunnyCallingMarinSpriteVariants::
.variant0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0

BunnyCallingMarinEntityHandler::
    ld   de, BunnyCallingMarinSpriteVariants      ;; 18:52A6 $11 $96 $52
    call RenderActiveEntitySpritesPair            ;; 18:52A9 $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ;; 18:52AC $F0 $E7
    rra                                           ;; 18:52AE $1F
    rra                                           ;; 18:52AF $1F
    rra                                           ;; 18:52B0 $1F
    and  $01                                      ;; 18:52B1 $E6 $01
    call SetEntitySpriteVariant                   ;; 18:52B3 $CD $0C $3B
    ld   a, $02                                   ;; 18:52B6 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:52B8 $E0 $A1
    ld   [wC167], a                               ;; 18:52BA $EA $67 $C1
    call AddEntityZSpeedToPos_18                  ;; 18:52BD $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 18:52C0 $21 $20 $C3
    add  hl, bc                                   ;; 18:52C3 $09
    dec  [hl]                                     ;; 18:52C4 $35
    dec  [hl]                                     ;; 18:52C5 $35
    ld   hl, wEntitiesPosZTable                   ;; 18:52C6 $21 $10 $C3
    add  hl, bc                                   ;; 18:52C9 $09
    ld   a, [hl]                                  ;; 18:52CA $7E
    and  $80                                      ;; 18:52CB $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 18:52CD $E0 $E8
    jr   z, .jr_52D7                              ;; 18:52CF $28 $06

    ld   [hl], b                                  ;; 18:52D1 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 18:52D2 $21 $20 $C3
    add  hl, bc                                   ;; 18:52D5 $09
    ld   [hl], b                                  ;; 18:52D6 $70

.jr_52D7
    ldh  a, [hActiveEntityState]                  ;; 18:52D7 $F0 $F0
    JP_TABLE                                      ;; 18:52D9
._00 dw BunnyCallingMarinState0Handler
._01 dw BunnyCallingMarinState1Handler
._02 dw BunnyCallingMarinState2Handler
._03 dw BunnyCallingMarinState3Handler

BunnyCallingMarinState0Handler::
    call GetEntityTransitionCountdown             ;; 18:52E2 $CD $05 $0C
    ret  nz                                       ;; 18:52E5 $C0

    ld   hl, wEntitiesSpeedXTable                 ;; 18:52E6 $21 $40 $C2
    add  hl, bc                                   ;; 18:52E9 $09
    ld   [hl], $0C                                ;; 18:52EA $36 $0C
    call AddEntitySpeedToPos_18                   ;; 18:52EC $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ;; 18:52EF $F0 $EE
    cp   $20                                      ;; 18:52F1 $FE $20
    jr   nz, .jr_5304                             ;; 18:52F3 $20 $0F

    ld   a, $01                                   ;; 18:52F5 $3E $01
    call func_018_59AE                            ;; 18:52F7 $CD $AE $59
    ld   a, $01                                   ;; 18:52FA $3E $01
    ldh  [hLinkDirection], a                      ;; 18:52FC $E0 $9E
    push bc                                       ;; 18:52FE $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 18:52FF $CD $F0 $0B
    pop  bc                                       ;; 18:5302 $C1
    ret                                           ;; 18:5303 $C9

.jr_5304
    cp   $48                                      ;; 18:5304 $FE $48
    ret  nz                                       ;; 18:5306 $C0

    call GetEntityTransitionCountdown             ;; 18:5307 $CD $05 $0C
    ld   [hl], $40                                ;; 18:530A $36 $40
    jp   IncrementEntityState                     ;; 18:530C $C3 $12 $3B

BunnyCallingMarinState1Handler::
    call GetEntityTransitionCountdown             ;; 18:530F $CD $05 $0C
    jr   nz, func_018_5321                        ;; 18:5312 $20 $0D

    call_open_dialog Dialog1E3                    ;; 18:5314
    call GetEntityTransitionCountdown             ;; 18:5319 $CD $05 $0C
    ld   [hl], $10                                ;; 18:531C $36 $10
    call IncrementEntityState                     ;; 18:531E $CD $12 $3B

func_018_5321::
    ldh  a, [hMultiPurposeG]                      ;; 18:5321 $F0 $E8
    and  a                                        ;; 18:5323 $A7
    jr   z, .ret_5337                             ;; 18:5324 $28 $11

    ld   hl, wEntitiesPrivateState4Table          ;; 18:5326 $21 $40 $C4
    add  hl, bc                                   ;; 18:5329 $09
    ld   a, [hl]                                  ;; 18:532A $7E
    dec  [hl]                                     ;; 18:532B $35
    and  a                                        ;; 18:532C $A7
    jr   nz, .ret_5337                            ;; 18:532D $20 $08

    ld   [hl], $08                                ;; 18:532F $36 $08
    ld   hl, wEntitiesSpeedZTable                 ;; 18:5331 $21 $20 $C3
    add  hl, bc                                   ;; 18:5334 $09
    ld   [hl], $12                                ;; 18:5335 $36 $12

.ret_5337
    ret                                           ;; 18:5337 $C9

BunnyCallingMarinState2Handler::
    call func_018_5321                            ;; 18:5338 $CD $21 $53
    ld   a, [wDialogState]                        ;; 18:533B $FA $9F $C1
    and  a                                        ;; 18:533E $A7
    ret  nz                                       ;; 18:533F $C0

    call GetEntityTransitionCountdown             ;; 18:5340 $CD $05 $0C
    jr   nz, .jr_534F                             ;; 18:5343 $20 $0A

    ld   [hl], $10                                ;; 18:5345 $36 $10
    call_open_dialog Dialog1E5                    ;; 18:5347
    jp   IncrementEntityState                     ;; 18:534C $C3 $12 $3B

.jr_534F
    ld   e, $02                                   ;; 18:534F $1E $02
    cp   $08                                      ;; 18:5351 $FE $08
    jr   nc, .jr_5357                             ;; 18:5353 $30 $02

    ld   e, $00                                   ;; 18:5355 $1E $00

.jr_5357
    ld   a, e                                     ;; 18:5357 $7B
    jp   func_018_59AE                            ;; 18:5358 $C3 $AE $59

BunnyCallingMarinState3Handler::
    call func_018_5321                            ;; 18:535B $CD $21 $53
    ld   a, [wDialogState]                        ;; 18:535E $FA $9F $C1
    and  a                                        ;; 18:5361 $A7
    jr   nz, ret_018_53CD                         ;; 18:5362 $20 $69

    call GetEntityTransitionCountdown             ;; 18:5364 $CD $05 $0C
    jr   z, jr_018_5375                           ;; 18:5367 $28 $0C

    ld   e, $01                                   ;; 18:5369 $1E $01
    cp   $08                                      ;; 18:536B $FE $08
    jr   c, .jr_5371                              ;; 18:536D $38 $02

    ld   e, $02                                   ;; 18:536F $1E $02

.jr_5371
    ld   a, e                                     ;; 18:5371 $7B
    jp   func_018_59AE                            ;; 18:5372 $C3 $AE $59

jr_018_5375:
    ldh  a, [hFrameCounter]                       ;; 18:5375 $F0 $E7
    rra                                           ;; 18:5377 $1F
    rra                                           ;; 18:5378 $1F
    rra                                           ;; 18:5379 $1F
    and  $01                                      ;; 18:537A $E6 $01
    add  $02                                      ;; 18:537C $C6 $02
    call SetEntitySpriteVariant                   ;; 18:537E $CD $0C $3B
    ld   hl, wIsMarinInAnimalVillage              ;; 18:5381 $21 $74 $DB
    ld   [hl], $01                                ;; 18:5384 $36 $01
    ldh  a, [hActiveEntityPosX]                   ;; 18:5386 $F0 $EE
    and  $FC                                      ;; 18:5388 $E6 $FC
    cp   $E0                                      ;; 18:538A $FE $E0
    jr   z, .jr_5397                              ;; 18:538C $28 $09

    ld   hl, wEntitiesSpeedXTable                 ;; 18:538E $21 $40 $C2
    add  hl, bc                                   ;; 18:5391 $09
    ld   [hl], $EC                                ;; 18:5392 $36 $EC
    call AddEntitySpeedToPos_18                   ;; 18:5394 $CD $6C $7E

.jr_5397
    ld   a, [wMarinEntityIndex]                   ;; 18:5397 $FA $0F $C5
    ld   e, a                                     ;; 18:539A $5F
    ld   d, b                                     ;; 18:539B $50
    ld   hl, wEntitiesSpeedXTable                 ;; 18:539C $21 $40 $C2
    add  hl, de                                   ;; 18:539F $19
    ld   [hl], $F4                                ;; 18:53A0 $36 $F4
    ldh  a, [hFrameCounter]                       ;; 18:53A2 $F0 $E7
    rra                                           ;; 18:53A4 $1F
    rra                                           ;; 18:53A5 $1F
    rra                                           ;; 18:53A6 $1F
    and  $01                                      ;; 18:53A7 $E6 $01
    add  $04                                      ;; 18:53A9 $C6 $04
    ld   hl, wEntitiesSpriteVariantTable          ;; 18:53AB $21 $B0 $C3
    add  hl, de                                   ;; 18:53AE $19
    ld   [hl], a                                  ;; 18:53AF $77
    push de                                       ;; 18:53B0 $D5
    push bc                                       ;; 18:53B1 $C5
    ld   c, e                                     ;; 18:53B2 $4B
    ld   b, d                                     ;; 18:53B3 $42
    call AddEntitySpeedToPos_18                   ;; 18:53B4 $CD $6C $7E
    pop  bc                                       ;; 18:53B7 $C1
    pop  de                                       ;; 18:53B8 $D1
    ld   hl, wEntitiesPosXTable                   ;; 18:53B9 $21 $00 $C2
    add  hl, de                                   ;; 18:53BC $19
    ld   a, [hl]                                  ;; 18:53BD $7E
    cp   $F0                                      ;; 18:53BE $FE $F0
    jr   nz, ret_018_53CD                         ;; 18:53C0 $20 $0B

    call ClearEntityStatusBank18                  ;; 18:53C2 $CD $08 $7F
    xor  a                                        ;; 18:53C5 $AF
    ld   [wIsMarinFollowingLink], a               ;; 18:53C6 $EA $73 $DB
    xor  a                                        ;; 18:53C9 $AF
    ld   [wC167], a                               ;; 18:53CA $EA $67 $C1

ret_018_53CD:
    ret                                           ;; 18:53CD $C9
