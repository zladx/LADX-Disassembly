Data_007_52A0::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db   $08, $08, $07, $07, $07, $06, $06, $06, $08, $08, $09, $09, $09, $0A, $0A, $0A

Data_007_52C0::
    db   $04, $04, $03, $03, $03, $02, $02, $02, $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db   $04, $04, $05, $05, $05, $06, $06, $06, $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

func_007_52E0::
    ldh  a, [hMultiPurpose0]                      ; $52E0: $F0 $D7
    rlca                                          ; $52E2: $07
    and  $01                                      ; $52E3: $E6 $01
    ld   e, a                                     ; $52E5: $5F
    ldh  a, [hMultiPurpose1]                      ; $52E6: $F0 $D8
    rlca                                          ; $52E8: $07
    rla                                           ; $52E9: $17
    and  $02                                      ; $52EA: $E6 $02
    or   e                                        ; $52EC: $B3
    rla                                           ; $52ED: $17
    rla                                           ; $52EE: $17
    rla                                           ; $52EF: $17
    and  $18                                      ; $52F0: $E6 $18
    ld   h, a                                     ; $52F2: $67
    ldh  a, [hMultiPurpose1]                      ; $52F3: $F0 $D8
    bit  7, a                                     ; $52F5: $CB $7F
    jr   z, .jr_52FB                              ; $52F7: $28 $02

    cpl                                           ; $52F9: $2F
    inc  a                                        ; $52FA: $3C

.jr_52FB
    ld   d, a                                     ; $52FB: $57
    ldh  a, [hMultiPurpose0]                      ; $52FC: $F0 $D7
    bit  7, a                                     ; $52FE: $CB $7F
    jr   z, .jr_5304                              ; $5300: $28 $02

    cpl                                           ; $5302: $2F
    inc  a                                        ; $5303: $3C

.jr_5304
    cp   d                                        ; $5304: $BA
    jr   nc, .jr_5314                             ; $5305: $30 $0D

    sra  a                                        ; $5307: $CB $2F
    sra  a                                        ; $5309: $CB $2F
    add  h                                        ; $530B: $84
    ld   e, a                                     ; $530C: $5F
    ld   d, b                                     ; $530D: $50
    ld   hl, Data_007_52A0                        ; $530E: $21 $A0 $52
    add  hl, de                                   ; $5311: $19
    ld   a, [hl]                                  ; $5312: $7E
    ret                                           ; $5313: $C9

.jr_5314
    ld   a, d                                     ; $5314: $7A
    sra  a                                        ; $5315: $CB $2F
    sra  a                                        ; $5317: $CB $2F
    add  h                                        ; $5319: $84
    ld   e, a                                     ; $531A: $5F
    ld   d, b                                     ; $531B: $50
    ld   hl, Data_007_52C0                        ; $531C: $21 $C0 $52
    add  hl, de                                   ; $531F: $19
    ld   a, [hl]                                  ; $5320: $7E
    ret                                           ; $5321: $C9

PincerEntityHandler::
    ld   hl, wEntitiesGroundStatusTable           ; $5322: $21 $70 $C4
    add  hl, bc                                   ; $5325: $09
    ld   [hl], b                                  ; $5326: $70
    ld   hl, wEntitiesRecoilVelocityX             ; $5327: $21 $F0 $C3
    add  hl, bc                                   ; $532A: $09
    ld   [hl], b                                  ; $532B: $70
    ld   hl, wEntitiesRecoilVelocityY             ; $532C: $21 $00 $C4
    add  hl, bc                                   ; $532F: $09
    ld   [hl], b                                  ; $5330: $70
    call func_007_5453                            ; $5331: $CD $53 $54
    call ReturnIfNonInteractive_07                ; $5334: $CD $96 $7D
    call DecrementEntityIgnoreHitsCountdown       ; $5337: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $533A: $F0 $F0
    JP_TABLE                                      ; $533C
._00 dw func_007_5349                             ; $533D
._01 dw func_007_535A                             ; $533F
._02 dw func_007_5383                             ; $5341
._03 dw func_007_53BD                             ; $5343
._04 dw func_007_53CD                             ; $5345
._05 dw func_007_53D8                             ; $5347

func_007_5349::
    ldh  a, [hActiveEntityPosX]                   ; $5349: $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ; $534B: $21 $B0 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    ldh  a, [hActiveEntityPosY]                   ; $5350: $F0 $EF
    ld   hl, wEntitiesPrivateState2Table          ; $5352: $21 $C0 $C2
    add  hl, bc                                   ; $5355: $09
    ld   [hl], a                                  ; $5356: $77
    jp   IncrementEntityState                     ; $5357: $C3 $12 $3B

func_007_535A::
    call GetEntityTransitionCountdown             ; $535A: $CD $05 $0C
    jr   nz, .jr_537F                             ; $535D: $20 $20

    ld   hl, wEntitiesPhysicsFlagsTable           ; $535F: $21 $40 $C3
    add  hl, bc                                   ; $5362: $09
    set  6, [hl]                                  ; $5363: $CB $F6
    call EntityLinkPositionXDifference_07         ; $5365: $CD $5D $7E
    add  $20                                      ; $5368: $C6 $20
    cp   $40                                      ; $536A: $FE $40
    jr   nc, .jr_537F                             ; $536C: $30 $11

    call EntityLinkPositionYDifference_07         ; $536E: $CD $6D $7E
    add  $20                                      ; $5371: $C6 $20
    cp   $40                                      ; $5373: $FE $40
    jr   nc, .jr_537F                             ; $5375: $30 $08

    call GetEntityTransitionCountdown             ; $5377: $CD $05 $0C
    ld   [hl], $30                                ; $537A: $36 $30
    call IncrementEntityState                     ; $537C: $CD $12 $3B

.jr_537F
    xor  a                                        ; $537F: $AF
    jp   SetEntitySpriteVariant                   ; $5380: $C3 $0C $3B

func_007_5383::
    call GetEntityTransitionCountdown             ; $5383: $CD $05 $0C
    jr   nz, .jr_539E                             ; $5386: $20 $16

    ld   hl, wEntitiesPrivateState3Table          ; $5388: $21 $D0 $C2
    add  hl, bc                                   ; $538B: $09
    ld   a, [hl]                                  ; $538C: $7E
    call SetEntitySpriteVariant                   ; $538D: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5390: $CD $05 $0C
    ld   [hl], $18                                ; $5393: $36 $18
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5395: $21 $40 $C3
    add  hl, bc                                   ; $5398: $09
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $5399: $CB $B6
    jp   IncrementEntityState                     ; $539B: $C3 $12 $3B

.jr_539E
    cp   $10                                      ; $539E: $FE $10
    jr   nz, .jr_53B8                             ; $53A0: $20 $16

    ld   a, $1F                                   ; $53A2: $3E $1F
    call ApplyVectorTowardsLink_trampoline        ; $53A4: $CD $AA $3B
    call func_007_52E0                            ; $53A7: $CD $E0 $52
    sra  a                                        ; $53AA: $CB $2F
    add  $02                                      ; $53AC: $C6 $02
    ld   hl, wEntitiesPrivateState3Table          ; $53AE: $21 $D0 $C2
    add  hl, bc                                   ; $53B1: $09
    ld   [hl], a                                  ; $53B2: $77
    ld   a, $18                                   ; $53B3: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $53B5: $CD $AA $3B

.jr_53B8
    ld   a, $01                                   ; $53B8: $3E $01
    jp   SetEntitySpriteVariant                   ; $53BA: $C3 $0C $3B

func_007_53BD::
    call UpdateEntityPosWithSpeed_07              ; $53BD: $CD $0A $7E
    call GetEntityTransitionCountdown             ; $53C0: $CD $05 $0C
    jr   nz, .jr_53CA                             ; $53C3: $20 $05

    ld   [hl], $20                                ; $53C5: $36 $20
    call IncrementEntityState                     ; $53C7: $CD $12 $3B

.jr_53CA
    jp   label_3B39                               ; $53CA: $C3 $39 $3B

func_007_53CD::
    call GetEntityTransitionCountdown             ; $53CD: $CD $05 $0C
    jr   nz, .jr_53D5                             ; $53D0: $20 $03

    call IncrementEntityState                     ; $53D2: $CD $12 $3B

.jr_53D5
    jp   label_3B39                               ; $53D5: $C3 $39 $3B

func_007_53D8::
    ldh  a, [hLinkPositionX]                      ; $53D8: $F0 $98
    push af                                       ; $53DA: $F5
    ldh  a, [hLinkPositionY]                      ; $53DB: $F0 $99
    push af                                       ; $53DD: $F5
    ld   hl, wEntitiesPrivateState1Table          ; $53DE: $21 $B0 $C2
    add  hl, bc                                   ; $53E1: $09
    ld   a, [hl]                                  ; $53E2: $7E
    ldh  [hLinkPositionX], a                      ; $53E3: $E0 $98
    ld   hl, wEntitiesPrivateState2Table          ; $53E5: $21 $C0 $C2
    add  hl, bc                                   ; $53E8: $09
    ld   a, [hl]                                  ; $53E9: $7E
    ldh  [hLinkPositionY], a                      ; $53EA: $E0 $99
    ld   a, $10                                   ; $53EC: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $53EE: $CD $AA $3B
    call EntityLinkPositionXDifference_07         ; $53F1: $CD $5D $7E
    add  $02                                      ; $53F4: $C6 $02
    cp   $04                                      ; $53F6: $FE $04
    jr   nc, .jr_541F                             ; $53F8: $30 $25

    call EntityLinkPositionYDifference_07         ; $53FA: $CD $6D $7E
    add  $02                                      ; $53FD: $C6 $02
    cp   $04                                      ; $53FF: $FE $04
    jr   nc, .jr_541F                             ; $5401: $30 $1C

    ld   hl, wEntitiesPosXTable                   ; $5403: $21 $00 $C2
    add  hl, bc                                   ; $5406: $09
    ldh  a, [hLinkPositionX]                      ; $5407: $F0 $98
    ld   [hl], a                                  ; $5409: $77
    ld   hl, wEntitiesPosYTable                   ; $540A: $21 $10 $C2
    add  hl, bc                                   ; $540D: $09
    ldh  a, [hLinkPositionY]                      ; $540E: $F0 $99
    ld   [hl], a                                  ; $5410: $77
    xor  a                                        ; $5411: $AF
    call SetEntitySpriteVariant                   ; $5412: $CD $0C $3B
    call IncrementEntityState                     ; $5415: $CD $12 $3B
    ld   [hl], $01                                ; $5418: $36 $01
    call GetEntityTransitionCountdown             ; $541A: $CD $05 $0C
    ld   [hl], $20                                ; $541D: $36 $20

.jr_541F
    pop  af                                       ; $541F: $F1
    ldh  [hLinkPositionY], a                      ; $5420: $E0 $99
    pop  af                                       ; $5422: $F1
    ldh  [hLinkPositionX], a                      ; $5423: $E0 $98
    call UpdateEntityPosWithSpeed_07              ; $5425: $CD $0A $7E
    jp   label_3B39                               ; $5428: $C3 $39 $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown100SpriteVariants::
.variant0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $62, OAM_GBC_PAL_2 | OAMF_PAL0
    db $64, OAM_GBC_PAL_2 | OAMF_PAL0
.variant7
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
.variant8
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant9
    db $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

func_007_5453::
    ld   de, Unknown100SpriteVariants             ; $5453: $11 $2B $54
    call RenderActiveEntitySpritesPair            ; $5456: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $5459: $F0 $F0
    cp   $03                                      ; $545B: $FE $03
    ret  c                                        ; $545D: $D8

    ldh  a, [hActiveEntityPosX]                   ; $545E: $F0 $EE
    ld   hl, wEntitiesPrivateState1Table          ; $5460: $21 $B0 $C2
    add  hl, bc                                   ; $5463: $09
    sub  [hl]                                     ; $5464: $96
    sra  a                                        ; $5465: $CB $2F
    sra  a                                        ; $5467: $CB $2F
    ldh  [hMultiPurpose0], a                      ; $5469: $E0 $D7
    ldh  [hMultiPurpose2], a                      ; $546B: $E0 $D9
    ldh  a, [hActiveEntityVisualPosY]             ; $546D: $F0 $EC
    ld   hl, wEntitiesPrivateState2Table          ; $546F: $21 $C0 $C2
    add  hl, bc                                   ; $5472: $09
    sub  [hl]                                     ; $5473: $96
    sra  a                                        ; $5474: $CB $2F
    sra  a                                        ; $5476: $CB $2F
    ldh  [hMultiPurpose1], a                      ; $5478: $E0 $D8
    ldh  [hMultiPurpose3], a                      ; $547A: $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ; $547C: $FA $C0 $C3
    ld   e, a                                     ; $547F: $5F
    ld   d, $00                                   ; $5480: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $5482: $21 $30 $C0
    add  hl, de                                   ; $5485: $19
    ld   e, l                                     ; $5486: $5D
    ld   d, h                                     ; $5487: $54
    ld   a, $03                                   ; $5488: $3E $03

jr_007_548A:
    ldh  [hMultiPurpose4], a                      ; $548A: $E0 $DB
    ld   hl, wEntitiesPrivateState2Table          ; $548C: $21 $C0 $C2
    add  hl, bc                                   ; $548F: $09
    ldh  a, [hMultiPurpose1]                      ; $5490: $F0 $D8
    add  [hl]                                     ; $5492: $86
    ld   [de], a                                  ; $5493: $12
    inc  de                                       ; $5494: $13
    ld   hl, wEntitiesPrivateState1Table          ; $5495: $21 $B0 $C2
    add  hl, bc                                   ; $5498: $09
    ldh  a, [hMultiPurpose0]                      ; $5499: $F0 $D7
    add  [hl]                                     ; $549B: $86

.jr_549C
    add  $04                                      ; $549C: $C6 $04
    ld   [de], a                                  ; $549E: $12
    inc  de                                       ; $549F: $13
    ld   a, $6A                                   ; $54A0: $3E $6A
    ld   [de], a                                  ; $54A2: $12
    inc  de                                       ; $54A3: $13
    ld   a, $02                                   ; $54A4: $3E $02
    ld   [de], a                                  ; $54A6: $12
    inc  de                                       ; $54A7: $13
    ldh  a, [hMultiPurpose0]                      ; $54A8: $F0 $D7
    ld   hl, hMultiPurpose2                       ; $54AA: $21 $D9 $FF
    add  [hl]                                     ; $54AD: $86
    ldh  [hMultiPurpose0], a                      ; $54AE: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $54B0: $F0 $D8
    ld   hl, hMultiPurpose3                       ; $54B2: $21 $DA $FF
    add  [hl]                                     ; $54B5: $86
    ldh  [hMultiPurpose1], a                      ; $54B6: $E0 $D8
    ldh  a, [hMultiPurpose4]                      ; $54B8: $F0 $DB
    dec  a                                        ; $54BA: $3D
    jr   nz, jr_007_548A                          ; $54BB: $20 $CD

    ld   a, $03                                   ; $54BD: $3E $03
    jp   func_015_7964_trampoline
