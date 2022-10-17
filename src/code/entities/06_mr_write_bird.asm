; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWriteSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $6A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $66, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MrWriteBirdChristineHouseSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
.variant2
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

MrWriteBirdEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $723C: $21 $80 $C3
    add  hl, bc                                   ; $723F: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $7240: $F0 $F1
    add  [hl]                                     ; $7242: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $7243: $E0 $F1
    ld   hl, wEntitiesSpeedXTable                 ; $7245: $21 $40 $C2
    add  hl, bc                                   ; $7248: $09
    ld   a, [hl]                                  ; $7249: $7E
    and  a                                        ; $724A: $A7
    jr   z, jr_006_725A                           ; $724B: $28 $0D

    and  $80                                      ; $724D: $E6 $80
    ld   a, $00                                   ; $724F: $3E $00
    jr   nz, .jr_7255                             ; $7251: $20 $02

    ld   a, $03                                   ; $7253: $3E $03

.jr_7255
    ld   hl, wEntitiesDirectionTable              ; $7255: $21 $80 $C3
    add  hl, bc                                   ; $7258: $09
    ld   [hl], a                                  ; $7259: $77

jr_006_725A:
    ld   de, MrWriteSpriteVariants                ; $725A: $11 $0C $72
    ldh  a, [hMapRoom]                            ; $725D: $F0 $F6
    cp   ROOM_INDOOR_B_CHRISTINE_HOUSE            ; $725F: $FE $D9
    jr   nz, .jr_7266                             ; $7261: $20 $03

    ld   de, MrWriteBirdChristineHouseSpriteVariants ; $7263: $11 $24 $72

.jr_7266
    call RenderActiveEntitySpritesPair            ; $7266: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $7269: $CD $C6 $64
    ld   a, [wIsIndoor]                           ; $726C: $FA $A5 $DB
    and  a                                        ; $726F: $A7
    jp   z, label_006_7372                        ; $7270: $CA $72 $73

    call AddEntityZSpeedToPos_06                  ; $7273: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7276: $21 $20 $C3
    add  hl, bc                                   ; $7279: $09
    dec  [hl]                                     ; $727A: $35
    ld   hl, wEntitiesPosZTable                   ; $727B: $21 $10 $C3
    add  hl, bc                                   ; $727E: $09
    ld   a, [hl]                                  ; $727F: $7E
    and  $80                                      ; $7280: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $7282: $E0 $E8
    jr   z, .jr_728C                              ; $7284: $28 $06

    ld   [hl], b                                  ; $7286: $70
    ld   hl, wEntitiesPosZTable                   ; $7287: $21 $10 $C3
    add  hl, bc                                   ; $728A: $09
    ld   [hl], b                                  ; $728B: $70

.jr_728C
    ldh  a, [hActiveEntityState]                  ; $728C: $F0 $F0
    JP_TABLE                                      ; $728E
._00 dw MrWriteBirdState0Handler
._01 dw MrWriteBirdState1Handler
._02 dw MrWriteBirdState2Handler

Data_006_7295::
    db   $02, $06, $08, $06, $FE, $FA, $F8, $FA

MrWriteBirdState0Handler::
    call func_006_7335                            ; $729D: $CD $35 $73
    xor  a                                        ; $72A0: $AF
    call SetEntitySpriteVariant                   ; $72A1: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $72A4: $CD $05 $0C

.jr_72A7
    jr   nz, .jr_72E0                             ; $72A7: $20 $37

    call GetRandomByte                            ; $72A9: $CD $0D $28
    and  $07                                      ; $72AC: $E6 $07
    ld   e, a                                     ; $72AE: $5F
    ld   d, b                                     ; $72AF: $50
    ld   hl, Data_006_7295                        ; $72B0: $21 $95 $72
    add  hl, de                                   ; $72B3: $19
    ld   a, [hl]                                  ; $72B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $72B5: $21 $40 $C2
    add  hl, bc                                   ; $72B8: $09
    ld   [hl], a                                  ; $72B9: $77
    ld   a, e                                     ; $72BA: $7B
    and  $04                                      ; $72BB: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $72BD: $21 $80 $C3
    add  hl, bc                                   ; $72C0: $09
    ld   [hl], a                                  ; $72C1: $77
    call GetRandomByte                            ; $72C2: $CD $0D $28
    and  $07                                      ; $72C5: $E6 $07
    ld   e, a                                     ; $72C7: $5F
    ld   hl, Data_006_7295                        ; $72C8: $21 $95 $72
    add  hl, de                                   ; $72CB: $19
    ld   a, [hl]                                  ; $72CC: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $72CD: $21 $50 $C2
    add  hl, bc                                   ; $72D0: $09
    ld   [hl], a                                  ; $72D1: $77
    call GetEntityTransitionCountdown             ; $72D2: $CD $05 $0C
    call GetRandomByte                            ; $72D5: $CD $0D $28
    and  $1F                                      ; $72D8: $E6 $1F
    add  $20                                      ; $72DA: $C6 $20
    ld   [hl], a                                  ; $72DC: $77
    call IncrementEntityState                     ; $72DD: $CD $12 $3B

.jr_72E0
    jp   label_006_7308                           ; $72E0: $C3 $08 $73

MrWriteBirdState1Handler::
    call func_006_7335                            ; $72E3: $CD $35 $73
    call UpdateEntityPosWithSpeed_06              ; $72E6: $CD $41 $65
    call label_3B23                               ; $72E9: $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ; $72EC: $F0 $E8
    and  a                                        ; $72EE: $A7
    jr   z, label_006_7308                        ; $72EF: $28 $17

    call GetEntityTransitionCountdown             ; $72F1: $CD $05 $0C
    jr   nz, .jr_72FD                             ; $72F4: $20 $07

    ld   [hl], $30                                ; $72F6: $36 $30
    call IncrementEntityState                     ; $72F8: $CD $12 $3B
    ld   [hl], b                                  ; $72FB: $70
    ret                                           ; $72FC: $C9

.jr_72FD
    ld   hl, wEntitiesSpeedZTable                 ; $72FD: $21 $20 $C3
    add  hl, bc                                   ; $7300: $09
    ld   [hl], $08                                ; $7301: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $7303: $21 $10 $C3
    add  hl, bc                                   ; $7306: $09
    inc  [hl]                                     ; $7307: $34

label_006_7308:
    ldh  a, [hFrameCounter]                       ; $7308: $F0 $E7
    rra                                           ; $730A: $1F
    rra                                           ; $730B: $1F
    rra                                           ; $730C: $1F
    and  $01                                      ; $730D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $730F: $C3 $0C $3B

MrWriteBirdState2Handler::
    call UpdateEntityPosWithSpeed_06              ; $7312: $CD $41 $65
    call label_3B23                               ; $7315: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7318: $F0 $E7
    and  $01                                      ; $731A: $E6 $01
    jr   nz, .jr_7323                             ; $731C: $20 $05

    ld   hl, wEntitiesSpeedZTable                 ; $731E: $21 $20 $C3
    add  hl, bc                                   ; $7321: $09
    inc  [hl]                                     ; $7322: $34

.jr_7323
    ldh  a, [hMultiPurposeG]                      ; $7323: $F0 $E8
    and  a                                        ; $7325: $A7
    jr   z, .jr_732C                              ; $7326: $28 $04

    call IncrementEntityState                     ; $7328: $CD $12 $3B
    ld   [hl], b                                  ; $732B: $70

.jr_732C
    ldh  a, [hFrameCounter]                       ; $732C: $F0 $E7
    rra                                           ; $732E: $1F
    and  $02                                      ; $732F: $E6 $02
    call SetEntitySpriteVariant                   ; $7331: $CD $0C $3B
    ret                                           ; $7334: $C9

func_006_7335::
    ld   a, [wSwordAnimationState]                ; $7335: $FA $37 $C1
    cp   SWORD_ANIMATION_STATE_SWING_START        ; $7338: $FE $02
    jr   nz, .ret_7371                            ; $733A: $20 $35

    call func_006_6594                            ; $733C: $CD $94 $65
    add  $18                                      ; $733F: $C6 $18
    cp   $30                                      ; $7341: $FE $30
    jr   nc, .ret_7371                            ; $7343: $30 $2C

    call func_006_65A4                            ; $7345: $CD $A4 $65
    add  $18                                      ; $7348: $C6 $18
    cp   $30                                      ; $734A: $FE $30
    jr   nc, .ret_7371                            ; $734C: $30 $23

    call IncrementEntityState                     ; $734E: $CD $12 $3B
    ld   [hl], $02                                ; $7351: $36 $02
    ld   a, $10                                   ; $7353: $3E $10
    call GetVectorTowardsLink_trampoline          ; $7355: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7358: $F0 $D7
    cpl                                           ; $735A: $2F
    inc  a                                        ; $735B: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $735C: $21 $50 $C2
    add  hl, bc                                   ; $735F: $09
    ld   [hl], a                                  ; $7360: $77
    ldh  a, [hMultiPurpose1]                      ; $7361: $F0 $D8
    cpl                                           ; $7363: $2F
    inc  a                                        ; $7364: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $7365: $21 $40 $C2
    add  hl, bc                                   ; $7368: $09
    ld   [hl], a                                  ; $7369: $77
    ld   hl, wEntitiesSpeedZTable                 ; $736A: $21 $20 $C3
    add  hl, bc                                   ; $736D: $09
    ld   [hl], $0C                                ; $736E: $36 $0C
    pop  af                                       ; $7370: $F1

.ret_7371
    ret                                           ; $7371: $C9

label_006_7372:
    ret                                           ; $7372: $C9
