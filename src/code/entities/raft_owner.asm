Data_005_533E::
    db   $60, $00, $62, $00, $62, $20, $60, $20, $64, $00, $66, $00, $66, $20, $64, $20
    db   $68, $00, $6A, $00, $6C, $00, $6E, $00, $6A, $20, $68, $20, $6E, $20, $6C, $20

; Handler for Raft Owner (and also the raft itself?)
EntityRaftOwnerHandler::
    ld   a, [wIsIndoor]                           ; $535E: $FA $A5 $DB
    and  a                                        ; $5361: $A7
    jr   z, raftOnOverworld                       ; $5362: $28 $78

    ldh  a, [hFrameCounter]                       ; $5364: $F0 $E7
    and  $1F                                      ; $5366: $E6 $1F
    jr   nz, jr_005_5372                          ; $5368: $20 $08

    call func_005_7B24                            ; $536A: $CD $24 $7B
    ld   hl, wEntitiesDirectionTable              ; $536D: $21 $80 $C3
    add  hl, bc                                   ; $5370: $09
    ld   [hl], e                                  ; $5371: $73

jr_005_5372:
    call func_005_54EA                            ; $5372: $CD $EA $54
    ld   de, Data_005_533E                        ; $5375: $11 $3E $53
    call RenderActiveEntitySpritesPair            ; $5378: $CD $C0 $3B
    call func_005_7A3A                            ; $537B: $CD $3A $7A
    call func_005_54C3                            ; $537E: $CD $C3 $54
    ldh  a, [hActiveEntityState]                  ; $5381: $F0 $F0
    JP_TABLE                                      ; $5383
._00 dw func_005_538A                             ; $5384
._01 dw func_005_539C                             ; $5386
._02 dw func_005_53CB                             ; $5388

func_005_538A::
    ld   a, [$D477]                               ; $538A: $FA $77 $D4
    and  a                                        ; $538D: $A7
    jr   nz, func_005_53CB                        ; $538E: $20 $3B

    call func_005_5506                            ; $5390: $CD $06 $55
    ret  nc                                       ; $5393: $D0

    ld   a, $F0                                   ; $5394: $3E $F0
    call OpenDialog                               ; $5396: $CD $85 $23
    jp   IncrementEntityState                     ; $5399: $C3 $12 $3B

func_005_539C::
    ld   a, [wDialogState]                        ; $539C: $FA $9F $C1
    and  a                                        ; $539F: $A7
    ret  nz                                       ; $53A0: $C0

    call IncrementEntityState                     ; $53A1: $CD $12 $3B
    ld   a, [wC177]                               ; $53A4: $FA $77 $C1
    and  a                                        ; $53A7: $A7
    jr   z, jr_005_53AC                           ; $53A8: $28 $02

    ld   [hl], b                                  ; $53AA: $70

jr_005_53AB:
    ret                                           ; $53AB: $C9

jr_005_53AC:
    ld   a, [wRupeeCountLow]                      ; $53AC: $FA $5E $DB
    sub  $00                                      ; $53AF: $D6 $00

jr_005_53B1:
    ld   a, [wRupeeCountHigh]                     ; $53B1: $FA $5D $DB
    sbc  $01                                      ; $53B4: $DE $01
    jr   c, jr_005_53C5                           ; $53B6: $38 $0D

    ld   a, $64                                   ; $53B8: $3E $64
    ld   [wSubstractRupeeBufferLow], a            ; $53BA: $EA $92 $DB
    ld   a, $F1                                   ; $53BD: $3E $F1
    ld   [$D477], a                               ; $53BF: $EA $77 $D4
    jp   OpenDialog                               ; $53C2: $C3 $85 $23

jr_005_53C5:
    ld   [hl], b                                  ; $53C5: $70
    ld   a, $4E                                   ; $53C6: $3E $4E
    jp   OpenDialog                               ; $53C8: $C3 $85 $23

func_005_53CB::
    call func_005_5506                            ; $53CB: $CD $06 $55
    ret  nc                                       ; $53CE: $D0

    jp_open_dialog $0F1                           ; $53CF

Data_005_53D4::
    db   $5C, $01, $5C, $21, $5E, $01, $5E, $21   ; $53D4

raftOnOverworld:
    ld   hl, wEntitiesUnknowTableP                ; $53DC: $21 $40 $C4
    add  hl, bc                                   ; $53DF: $09
    ld   a, [$D477]                               ; $53E0: $FA $77 $D4
    or   [hl]                                     ; $53E3: $B6
    jr   nz, jr_005_5411                          ; $53E4: $20 $2B

    ld   e, $0F                                   ; $53E6: $1E $0F
    ld   d, b                                     ; $53E8: $50

jr_005_53E9:
    ld   a, e                                     ; $53E9: $7B
    cp   c                                        ; $53EA: $B9
    jr   z, jr_005_53FF                           ; $53EB: $28 $12

    ld   hl, wEntitiesStatusTable                         ; $53ED: $21 $80 $C2
    add  hl, de                                   ; $53F0: $19
    ld   a, [hl]                                  ; $53F1: $7E
    and  a                                        ; $53F2: $A7
    jr   z, jr_005_53FF                           ; $53F3: $28 $0A

    ld   hl, wEntitiesTypeTable                   ; $53F5: $21 $A0 $C3
    add  hl, de                                   ; $53F8: $19
    ld   a, [hl]                                  ; $53F9: $7E
    cp   $6A                                      ; $53FA: $FE $6A
    jp   z, func_005_7B4B                        ; $53FC: $CA $4B $7B

jr_005_53FF:
    dec  e                                        ; $53FF: $1D
    ld   a, e                                     ; $5400: $7B
    cp   $FF                                      ; $5401: $FE $FF
    jr   nz, jr_005_53E9                          ; $5403: $20 $E4

    ld   de, Data_005_53D4                        ; $5405: $11 $D4 $53
    call RenderActiveEntitySpritesPair            ; $5408: $CD $C0 $3B
    call func_005_7A3A                            ; $540B: $CD $3A $7A
    jp   func_005_54C3                            ; $540E: $C3 $C3 $54

jr_005_5411:
    ldh  a, [hFrameCounter]                       ; $5411: $F0 $E7
    rra                                           ; $5413: $1F
    rra                                           ; $5414: $1F
    rra                                           ; $5415: $1F
    rra                                           ; $5416: $1F
    and  $01                                      ; $5417: $E6 $01
    call SetEntitySpriteVariant                   ; $5419: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $541C: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $541E: $21 $EE $FF
    sub  [hl]                                     ; $5421: $96
    add  $10                                      ; $5422: $C6 $10
    cp   $20                                      ; $5424: $FE $20
    jr   nc, jr_005_5440                          ; $5426: $30 $18

    ldh  a, [hLinkPositionY]                      ; $5428: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $542A: $21 $EF $FF
    sub  [hl]                                     ; $542D: $96
    add  $14                                      ; $542E: $C6 $14
    cp   $1C                                      ; $5430: $FE $1C
    jr   nc, jr_005_5440                          ; $5432: $30 $0C

    ld   a, $80                                   ; $5434: $3E $80
    ld   [$C1AD], a                               ; $5436: $EA $AD $C1
    ldh  a, [hLinkPositionX]                      ; $5439: $F0 $98
    ld   hl, wEntitiesPosXTable                         ; $543B: $21 $00 $C2
    add  hl, bc                                   ; $543E: $09
    ld   [hl], a                                  ; $543F: $77

jr_005_5440:
    ld   a, [wLinkGroundStatus]                   ; $5440: $FA $1F $C1
    and  a                                        ; $5443: $A7
    jr   z, jr_005_544C                           ; $5444: $28 $06

    call IncrementEntityState                     ; $5446: $CD $12 $3B
    ld   [hl], b                                  ; $5449: $70
    jr   jr_005_5487                              ; $544A: $18 $3B

jr_005_544C:
    ldh  a, [hActiveEntityState]                  ; $544C: $F0 $F0
    JP_TABLE                                      ; $544E
._00 dw func_005_5455                             ; $544F
._01 dw func_005_546C                             ; $5451
._02 dw func_005_5490                             ; $5453

func_005_5455::
    call func_005_7B04                            ; $5455: $CD $04 $7B
    add  $08                                      ; $5458: $C6 $08
    cp   $10                                      ; $545A: $FE $10
    jr   nc, jr_005_546A                          ; $545C: $30 $0C

    call func_005_7B14                            ; $545E: $CD $14 $7B
    add  $09                                      ; $5461: $C6 $09
    cp   $12                                      ; $5463: $FE $12
    jr   nc, jr_005_546A                          ; $5465: $30 $03

    call IncrementEntityState                     ; $5467: $CD $12 $3B

jr_005_546A:
    jr   jr_005_5487                              ; $546A: $18 $1B

func_005_546C::
    ldh  a, [hActiveEntityPosX]                   ; $546C: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $546E: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $5470: $F0 $EC
    sub  $05                                      ; $5472: $D6 $05
    ldh  [hLinkPositionY], a                      ; $5474: $E0 $99
    call IncrementEntityState                     ; $5476: $CD $12 $3B
    ld   hl, wEntitiesUnknowTableP                ; $5479: $21 $40 $C4
    add  hl, bc                                   ; $547C: $09
    ld   [hl], $01                                ; $547D: $36 $01
    xor  a                                        ; $547F: $AF
    ld   [$D477], a                               ; $5480: $EA $77 $D4

jr_005_5483:
    ld   a, $01                                   ; $5483: $3E $01
    ldh  [hFFB2], a                               ; $5485: $E0 $B2

jr_005_5487:
    call CopyEntityPositionToActivePosition       ; $5487: $CD $8A $3D
    ld   de, Data_005_53D4                        ; $548A: $11 $D4 $53
    jp   RenderActiveEntitySpritesPair                ; $548D: $C3 $C0 $3B

func_005_5490::
    ldh  a, [hFrameCounter]                       ; $5490: $F0 $E7
    rra                                           ; $5492: $1F
    rra                                           ; $5493: $1F
    rra                                           ; $5494: $1F
    rra                                           ; $5495: $1F
    and  $01                                      ; $5496: $E6 $01
    ld   [$C13B], a                               ; $5498: $EA $3B $C1
    ldh  a, [hMapRoom]                            ; $549B: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $549D: $21 $E0 $C3
    add  hl, bc                                   ; $54A0: $09
    ld   [hl], a                                  ; $54A1: $77
    ldh  a, [hLinkPositionX]                      ; $54A2: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $54A4: $21 $00 $C2
    add  hl, bc                                   ; $54A7: $09
    ld   [hl], a                                  ; $54A8: $77
    ldh  a, [hLinkPositionY]                      ; $54A9: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $54AB: $21 $10 $C2
    add  hl, bc                                   ; $54AE: $09
    add  $05                                      ; $54AF: $C6 $05
    ld   [hl], a                                  ; $54B1: $77
    ld   hl, wEntitiesPosZTable                   ; $54B2: $21 $10 $C3
    add  hl, bc                                   ; $54B5: $09
    ld   [hl], b                                  ; $54B6: $70
    ld   a, [wLinkMotionState]                    ; $54B7: $FA $1C $C1
    cp   $02                                      ; $54BA: $FE $02
    jr   nz, jr_005_54C1                          ; $54BC: $20 $03

    ldh  a, [hLinkPositionZ]                      ; $54BE: $F0 $A2
    ld   [hl], a                                  ; $54C0: $77

jr_005_54C1:
    jr   jr_005_5483                              ; $54C1: $18 $C0

func_005_54C3::
    call CheckLinkCollisionWithEnemy_trampoline   ; $54C3: $CD $5A $3B
    jr   nc, jr_005_54E5                          ; $54C6: $30 $1D

    call CopyLinkFinalPositionToPosition          ; $54C8: $CD $BE $0C
    call ResetPegasusBoots                        ; $54CB: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $54CE: $FA $A6 $C1
    and  a                                        ; $54D1: $A7
    jr   z, jr_005_54E5                           ; $54D2: $28 $11

    ld   e, a                                     ; $54D4: $5F
    ld   d, b                                     ; $54D5: $50
    ld   hl, $C39F                                ; $54D6: $21 $9F $C3
    add  hl, de                                   ; $54D9: $19
    ld   a, [hl]                                  ; $54DA: $7E
    cp   $03                                      ; $54DB: $FE $03
    jr   nz, jr_005_54E5                          ; $54DD: $20 $06

    ld   hl, $C28F                                ; $54DF: $21 $8F $C2
    add  hl, de                                   ; $54E2: $19
    ld   [hl], $00                                ; $54E3: $36 $00

jr_005_54E5:
    ret                                           ; $54E5: $C9

Data_005_54E6::
    db   $06, $04, $02, $00

func_005_54EA::
    ld   hl, wEntitiesDirectionTable              ; $54EA: $21 $80 $C3
    add  hl, bc                                   ; $54ED: $09
    ld   e, [hl]                                  ; $54EE: $5E
    ld   d, b                                     ; $54EF: $50
    ld   hl, Data_005_54E6                        ; $54F0: $21 $E6 $54
    add  hl, de                                   ; $54F3: $19
    push hl                                       ; $54F4: $E5
    ld   hl, wEntitiesUnknowTableY                ; $54F5: $21 $D0 $C3
    add  hl, bc                                   ; $54F8: $09
    inc  [hl]                                     ; $54F9: $34
    ld   a, [hl]                                  ; $54FA: $7E
    rra                                           ; $54FB: $1F
    rra                                           ; $54FC: $1F
    rra                                           ; $54FD: $1F
    rra                                           ; $54FE: $1F
    pop  hl                                       ; $54FF: $E1
    and  $01                                      ; $5500: $E6 $01
    or   [hl]                                     ; $5502: $B6
    jp   SetEntitySpriteVariant                   ; $5503: $C3 $0C $3B

func_005_5506::
    ld   e, b                                     ; $5506: $58
    ldh  a, [hActiveEntityType]                   ; $5507: $F0 $EB
    cp   ENTITY_WITCH                             ; $5509: $FE $40
    jr   nz, jr_005_5519                          ; $550B: $20 $0C

    ldh  a, [hLinkPositionY]                      ; $550D: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $550F: $21 $EF $FF
    sub  [hl]                                     ; $5512: $96
    add  $14                                      ; $5513: $C6 $14
    cp   $2B                                      ; $5515: $FE $2B
    jr   jr_005_5523                              ; $5517: $18 $0A

jr_005_5519:
    ldh  a, [hLinkPositionY]                      ; $5519: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $551B: $21 $EF $FF
    sub  [hl]                                     ; $551E: $96
    add  $14                                      ; $551F: $C6 $14
    cp   $28                                      ; $5521: $FE $28

jr_005_5523:
    jr   nc, jr_005_5569                          ; $5523: $30 $44

    ldh  a, [hLinkPositionX]                      ; $5525: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $5527: $21 $EE $FF
    sub  [hl]                                     ; $552A: $96
    add  $10                                      ; $552B: $C6 $10
    cp   $20                                      ; $552D: $FE $20
    jr   nc, jr_005_5569                          ; $552F: $30 $38

    inc  e                                        ; $5531: $1C
    ldh  a, [hActiveEntityType]                   ; $5532: $F0 $EB
    cp   ENTITY_BOW_WOW                           ; $5534: $FE $6D
    jr   z, jr_005_5544                           ; $5536: $28 $0C

    push de                                       ; $5538: $D5
    call func_005_7B24                            ; $5539: $CD $24 $7B
    ldh  a, [hLinkDirection]                      ; $553C: $F0 $9E
    xor  $01                                      ; $553E: $EE $01
    cp   e                                        ; $5540: $BB
    pop  de                                       ; $5541: $D1
    jr   nz, jr_005_5569                          ; $5542: $20 $25

jr_005_5544:
    ld   hl, $C1AD                                ; $5544: $21 $AD $C1
    ld   [hl], $01                                ; $5547: $36 $01
    ld   a, [wDialogState]                        ; $5549: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $554C: $21 $4F $C1
    or   [hl]                                     ; $554F: $B6
    ld   hl, $C146                                ; $5550: $21 $46 $C1
    or   [hl]                                     ; $5553: $B6
    ld   hl, $C134                                ; $5554: $21 $34 $C1
    or   [hl]                                     ; $5557: $B6
    jr   nz, jr_005_5569                          ; $5558: $20 $0F

    ld   a, [wWindowY]                            ; $555A: $FA $9A $DB
    cp   $80                                      ; $555D: $FE $80
    jr   nz, jr_005_5569                          ; $555F: $20 $08

    ldh  a, [hJoypadState]                        ; $5561: $F0 $CC
    and  $10                                      ; $5563: $E6 $10
    jr   z, jr_005_5569                           ; $5565: $28 $02

    scf                                           ; $5567: $37
    ret                                           ; $5568: $C9

jr_005_5569:
    and  a                                        ; $5569: $A7
    ret                                           ; $556A: $C9
