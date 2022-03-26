
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PodobooSpriteVariants::
.variant0
    db $7A, $42
    db $7A, $62
.variant1
    db $7A, $54
    db $7A, $74
.variant2
    db $7A, $02
    db $7A, $22
.variant3
    db $7A, $14
    db $7A, $34

PodobooEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $53F0: $21 $B0 $C2
    add  hl, bc                                   ; $53F3: $09
    ld   a, [hl]                                  ; $53F4: $7E
    and  a                                        ; $53F5: $A7
    jp   nz, label_019_54FD                       ; $53F6: $C2 $FD $54

    ldh  a, [hActiveEntityState]                  ; $53F9: $F0 $F0
    JP_TABLE                                      ; $53FB
._00 dw PodobooState0Handler
._01 dw PodobooState1Handler
._02 dw PodobooState2Handler

PodobooState0Handler::
    call GetEntityTransitionCountdown             ; $5402: $CD $05 $0C
    call GetRandomByte                            ; $5405: $CD $0D $28
    and  $3F                                      ; $5408: $E6 $3F
    add  $30                                      ; $540A: $C6 $30
    ld   [hl], a                                  ; $540C: $77
    jp   IncrementEntityState                     ; $540D: $C3 $12 $3B

Data_019_5410::
    db   $FF, $01

Data_019_5412::
    db   $FD, $03

Data_019_5414::
    db   $F4, $F4

PodobooState1Handler::
    call GetEntityTransitionCountdown             ; $5416: $CD $05 $0C
    jr   nz, ret_019_546E                         ; $5419: $20 $53

    ld   a, [wC5A1]                               ; $541B: $FA $A1 $C5
    cp   $02                                      ; $541E: $FE $02
    ret  nc                                       ; $5420: $D0

    ld   hl, wEntitiesSpeedYTable                 ; $5421: $21 $50 $C2
    add  hl, bc                                   ; $5424: $09
    ld   [hl], $D0                                ; $5425: $36 $D0
    call IncrementEntityState                     ; $5427: $CD $12 $3B

func_019_542A::
    ld   a, $01                                   ; $542A: $3E $01

.loop_542C
    ldh  [hMultiPurposeH], a                      ; $542C: $E0 $E9
    ld   a, ENTITY_PODOBOO                        ; $542E: $3E $DA
    call SpawnNewEntity_trampoline                ; $5430: $CD $86 $3B
    ret  c                                        ; $5433: $D8

    ldh  a, [hMultiPurpose1]                      ; $5434: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5436: $21 $10 $C2
    add  hl, de                                   ; $5439: $19
    ld   [hl], a                                  ; $543A: $77
    ld   hl, wEntitiesPrivateState1Table          ; $543B: $21 $B0 $C2
    add  hl, de                                   ; $543E: $19
    ld   [hl], $02                                ; $543F: $36 $02
    push bc                                       ; $5441: $C5
    ldh  a, [hMultiPurposeH]                      ; $5442: $F0 $E9
    ld   c, a                                     ; $5444: $4F
    ld   hl, Data_019_5410                        ; $5445: $21 $10 $54
    add  hl, bc                                   ; $5448: $09
    ldh  a, [hMultiPurpose0]                      ; $5449: $F0 $D7
    add  [hl]                                     ; $544B: $86
    ld   hl, wEntitiesPosXTable                   ; $544C: $21 $00 $C2
    add  hl, de                                   ; $544F: $19
    ld   [hl], a                                  ; $5450: $77
    ld   hl, Data_019_5412                        ; $5451: $21 $12 $54
    add  hl, bc                                   ; $5454: $09
    ld   a, [hl]                                  ; $5455: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5456: $21 $40 $C2
    add  hl, de                                   ; $5459: $19
    ld   [hl], a                                  ; $545A: $77
    ld   hl, Data_019_5414                        ; $545B: $21 $14 $54
    add  hl, bc                                   ; $545E: $09
    ld   a, [hl]                                  ; $545F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5460: $21 $50 $C2
    add  hl, de                                   ; $5463: $19
    ld   [hl], a                                  ; $5464: $77
    pop  bc                                       ; $5465: $C1
    ldh  a, [hMultiPurposeH]                      ; $5466: $F0 $E9
    dec  a                                        ; $5468: $3D
    cp   $FF                                      ; $5469: $FE $FF
    jr   nz, .loop_542C                           ; $546B: $20 $BF

    ret                                           ; $546D: $C9

ret_019_546E:
    ret                                           ; $546E: $C9

PodobooState2Handler::
    ld   hl, wC5A0                                ; $546F: $21 $A0 $C5
    inc  [hl]                                     ; $5472: $34
    ld   de, PodobooSpriteVariants                ; $5473: $11 $E0 $53
    call RenderActiveEntitySpritesPair            ; $5476: $CD $C0 $3B
    call ReturnIfNonInteractive_19                ; $5479: $CD $3D $7D
    call label_3B44                               ; $547C: $CD $44 $3B
    call UpdateEntityYPosWithSpeed_19             ; $547F: $CD $BB $7D
    ld   hl, wEntitiesSpeedYTable                 ; $5482: $21 $50 $C2
    add  hl, bc                                   ; $5485: $09
    inc  [hl]                                     ; $5486: $34
    ld   e, $00                                   ; $5487: $1E $00
    ld   a, [hl]                                  ; $5489: $7E
    and  $80                                      ; $548A: $E6 $80
    jr   nz, .jr_5490                             ; $548C: $20 $02

    ld   e, $02                                   ; $548E: $1E $02

.jr_5490
    ldh  a, [hFrameCounter]                       ; $5490: $F0 $E7
    rra                                           ; $5492: $1F
    rra                                           ; $5493: $1F
    and  $01                                      ; $5494: $E6 $01
    add  e                                        ; $5496: $83
    call SetEntitySpriteVariant                   ; $5497: $CD $0C $3B
    ld   hl, wEntitiesPosYTable                   ; $549A: $21 $10 $C2
    add  hl, bc                                   ; $549D: $09
    ld   a, [hl]                                  ; $549E: $7E
    cp   $70                                      ; $549F: $FE $70
    jr   c, .jr_54AC                              ; $54A1: $38 $09

    ld   [hl], $70                                ; $54A3: $36 $70
    call IncrementEntityState                     ; $54A5: $CD $12 $3B
    ld   [hl], b                                  ; $54A8: $70
    call func_019_542A                            ; $54A9: $CD $2A $54

.jr_54AC
    ldh  a, [hFrameCounter]                       ; $54AC: $F0 $E7
    xor  c                                        ; $54AE: $A9
    and  $0F                                      ; $54AF: $E6 $0F
    ret  nz                                       ; $54B1: $C0

    ld   a, ENTITY_PODOBOO                        ; $54B2: $3E $DA
    call SpawnNewEntity_trampoline                ; $54B4: $CD $86 $3B
    ret  c                                        ; $54B7: $D8

    ldh  a, [hMultiPurpose0]                      ; $54B8: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $54BA: $21 $00 $C2
    add  hl, de                                   ; $54BD: $19
    ld   [hl], a                                  ; $54BE: $77
    ldh  a, [hMultiPurpose1]                      ; $54BF: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $54C1: $21 $10 $C2
    add  hl, de                                   ; $54C4: $19
    ld   [hl], a                                  ; $54C5: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $54C6: $21 $E0 $C2
    add  hl, de                                   ; $54C9: $19
    ld   [hl], $18                                ; $54CA: $36 $18
    ld   hl, wEntitiesPrivateState1Table          ; $54CC: $21 $B0 $C2
    add  hl, de                                   ; $54CF: $19
    ld   [hl], $01                                ; $54D0: $36 $01
    ldh  a, [hActiveEntitySpriteVariant]          ; $54D2: $F0 $F1
    rla                                           ; $54D4: $17
    and  $04                                      ; $54D5: $E6 $04
    ld   hl, wEntitiesSpriteVariantTable          ; $54D7: $21 $B0 $C3
    add  hl, de                                   ; $54DA: $19
    ld   [hl], a                                  ; $54DB: $77
    ret                                           ; $54DC: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown067SpriteVariants::
.variant0
    db $7C, $42
    db $7C, $62
.variant1
    db $7C, $54
    db $7C, $74
.variant2
    db $7E, $42
    db $7E, $62
.variant3
    db $7E, $54
    db $7E, $74
.variant4
    db $7C, $02
    db $7C, $22
.variant5
    db $7C, $14
    db $7C, $34

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown068SpriteVariants::
.variant0
    db $7E, $02
    db $7E, $22
.variant1
    db $7E, $14
    db $7E, $34

label_019_54FD:
    cp   $02                                      ; $54FD: $FE $02
    jr   z, jr_019_552D                           ; $54FF: $28 $2C

    ldh  a, [hFrameCounter]                       ; $5501: $F0 $E7
    xor  c                                        ; $5503: $A9
    rra                                           ; $5504: $1F
    jr   c, .jr_5519                              ; $5505: $38 $12

    ldh  a, [hFrameCounter]                       ; $5507: $F0 $E7
    rra                                           ; $5509: $1F
    rra                                           ; $550A: $1F
    and  $01                                      ; $550B: $E6 $01
    ld   e, a                                     ; $550D: $5F
    ldh  a, [hActiveEntitySpriteVariant]          ; $550E: $F0 $F1
    add  e                                        ; $5510: $83
    ldh  [hActiveEntitySpriteVariant], a          ; $5511: $E0 $F1
    ld   de, Unknown067SpriteVariants             ; $5513: $11 $DD $54
    call RenderActiveEntitySpritesPair            ; $5516: $CD $C0 $3B

.jr_5519
    call ReturnIfNonInteractive_19                ; $5519: $CD $3D $7D
    call GetEntityTransitionCountdown             ; $551C: $CD $05 $0C
    jp   z, ClearEntityStatus_19                  ; $551F: $CA $61 $7E

    cp   $08                                      ; $5522: $FE $08
    jr   nz, .ret_552C                            ; $5524: $20 $06

    ld   hl, wEntitiesSpriteVariantTable          ; $5526: $21 $B0 $C3
    add  hl, bc                                   ; $5529: $09
    inc  [hl]                                     ; $552A: $34
    inc  [hl]                                     ; $552B: $34

.ret_552C
    ret                                           ; $552C: $C9

jr_019_552D:
    ld   de, Unknown068SpriteVariants             ; $552D: $11 $F5 $54
    call RenderActiveEntitySpritesPair            ; $5530: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $5533: $F0 $E7
    rra                                           ; $5535: $1F
    rra                                           ; $5536: $1F
    and  $01                                      ; $5537: $E6 $01
    call SetEntitySpriteVariant                   ; $5539: $CD $0C $3B
    call UpdateEntityPosWithSpeed_19              ; $553C: $CD $B8 $7D
    ld   hl, wEntitiesSpeedYTable                 ; $553F: $21 $50 $C2
    add  hl, bc                                   ; $5542: $09
    inc  [hl]                                     ; $5543: $34
    ld   a, [hl]                                  ; $5544: $7E
    cp   $10                                      ; $5545: $FE $10
    ret  nz                                       ; $5547: $C0

    jp   ClearEntityStatus_19                     ; $5548: $C3 $61 $7E
