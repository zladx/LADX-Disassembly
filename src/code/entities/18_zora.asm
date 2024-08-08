; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ZoraSpriteVariants::
.variant0
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
.variant1
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant2
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

ZoraEntityHandler::
    ld   de, ZoraSpriteVariants                   ;; 18:49D4 $11 $C0 $49
    call RenderActiveEntitySpritesPair            ;; 18:49D7 $CD $C0 $3B
    ld   a, [wIsIndoor]                           ;; 18:49DA $FA $A5 $DB
    and  a                                        ;; 18:49DD $A7
    jr   z, jr_018_4A2A                           ;; 18:49DE $28 $4A

    ldh  a, [hMapRoom]                            ;; 18:49E0 $F0 $F6
    cp   UNKNOWN_ROOM_DA                          ;; 18:49E2 $FE $DA
    jr   nz, jr_018_4A2A                          ;; 18:49E4 $20 $44

    ld   a, [wDialogState]                        ;; 18:49E6 $FA $9F $C1
    and  a                                        ;; 18:49E9 $A7
    ret  nz                                       ;; 18:49EA $C0

    ld   a, [wPhotos1]                            ;; 18:49EB $FA $0C $DC
    and  $01                                      ;; 18:49EE $E6 $01
    jp   z, ClearEntityStatusBank18               ;; 18:49F0 $CA $08 $7F

    ld   a, [wTradeSequenceItem]                  ;; 18:49F3 $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 18:49F6 $FE $0E
    jp   nz, ClearEntityStatusBank18              ;; 18:49F8 $C2 $08 $7F

    ld   a, [wExchangingTradeSequenceItem]        ;; 18:49FB $FA $7F $DB
    and  a                                        ;; 18:49FE $A7
    jp   nz, ClearEntityStatusBank18              ;; 18:49FF $C2 $08 $7F

    ld   a, [wPhotos2]                            ;; 18:4A02 $FA $0D $DC
    and  $01                                      ;; 18:4A05 $E6 $01
    jr   nz, .jr_4A0E                             ;; 18:4A07 $20 $05

    ld   a, $18                                   ;; 18:4A09 $3E $18
    jp   func_036_4A77_trampoline                 ;; 18:4A0B $C3 $DE $0A

.jr_4A0E
    call func_018_7D95                            ;; 18:4A0E $CD $95 $7D
    jr   nc, .jr_4A18                             ;; 18:4A11 $30 $05

    call_open_dialog Dialog126                    ;; 18:4A13

.jr_4A18
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:4A18 $21 $40 $C3
    add  hl, bc                                   ;; 18:4A1B $09
    ld   a, [hl]                                  ;; 18:4A1C $7E
    or   ENTITY_PHYSICS_HARMLESS                  ;; 18:4A1D $F6 $80
    ld   [hl], a                                  ;; 18:4A1F $77
    call CheckLinkCollisionWithEnemy_trampoline   ;; 18:4A20 $CD $5A $3B
    ret  nc                                       ;; 18:4A23 $D0

    call CopyLinkFinalPositionToPosition          ;; 18:4A24 $CD $BE $0C
    jp   ResetPegasusBoots                        ;; 18:4A27 $C3 $B6 $0C

jr_018_4A2A:
    call ReturnIfNonInteractive_18                ;; 18:4A2A $CD $E8 $7D
    call ApplyRecoilIfNeeded_18                   ;; 18:4A2D $CD $15 $7E
    ldh  a, [hActiveEntityState]                  ;; 18:4A30 $F0 $F0
    JP_TABLE                                      ;; 18:4A32
._00 dw ZoraState0Handler
._01 dw ZoraState1Handler
._02 dw ZoraState2Handler
._03 dw ZoraState3Handler

ZoraState0Handler::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:4A3B $21 $40 $C3
    add  hl, bc                                   ;; 18:4A3E $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:4A3F $CB $F6
    call GetRandomByte                            ;; 18:4A41 $CD $0D $28
    and  $07                                      ;; 18:4A44 $E6 $07
    ld   e, a                                     ;; 18:4A46 $5F
    ld   d, b                                     ;; 18:4A47 $50
    ld   hl, Data_018_6385                        ;; 18:4A48 $21 $85 $63
    add  hl, de                                   ;; 18:4A4B $19
    ld   a, [hl]                                  ;; 18:4A4C $7E
    ld   hl, wEntitiesPosXTable                   ;; 18:4A4D $21 $00 $C2
    add  hl, bc                                   ;; 18:4A50 $09
    ld   [hl], a                                  ;; 18:4A51 $77
    ld   hl, Data_018_637D                        ;; 18:4A52 $21 $7D $63
    add  hl, de                                   ;; 18:4A55 $19
    ld   a, [hl]                                  ;; 18:4A56 $7E
    ld   hl, wEntitiesPosYTable                   ;; 18:4A57 $21 $10 $C2
    add  hl, bc                                   ;; 18:4A5A $09
    ld   [hl], a                                  ;; 18:4A5B $77
    call func_018_6493                            ;; 18:4A5C $CD $93 $64
    ldh  a, [hMultiPurpose3]                      ;; 18:4A5F $F0 $DA
    cp   $07                                      ;; 18:4A61 $FE $07
    ret  nz                                       ;; 18:4A63 $C0

    call GetEntityTransitionCountdown             ;; 18:4A64 $CD $05 $0C
    call GetRandomByte                            ;; 18:4A67 $CD $0D $28
    and  $7F                                      ;; 18:4A6A $E6 $7F
    or   $40                                      ;; 18:4A6C $F6 $40
    ld   [hl], a                                  ;; 18:4A6E $77
    jp   IncrementEntityState                     ;; 18:4A6F $C3 $12 $3B

ZoraState1Handler::
    call GetEntityTransitionCountdown             ;; 18:4A72 $CD $05 $0C
    ret  nz                                       ;; 18:4A75 $C0

    ld   [hl], $60                                ;; 18:4A76 $36 $60
    jp   IncrementEntityState                     ;; 18:4A78 $C3 $12 $3B

ZoraState2Handler::
    call GetEntityTransitionCountdown             ;; 18:4A7B $CD $05 $0C
    jr   nz, .jr_4A90                             ;; 18:4A7E $20 $10

    ld   [hl], $60                                ;; 18:4A80 $36 $60
    ld   hl, wEntitiesInertiaTable                ;; 18:4A82 $21 $D0 $C3
    add  hl, bc                                   ;; 18:4A85 $09
    ld   [hl], b                                  ;; 18:4A86 $70
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:4A87 $21 $40 $C3
    add  hl, bc                                   ;; 18:4A8A $09
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:4A8B $CB $B6
    jp   IncrementEntityState                     ;; 18:4A8D $C3 $12 $3B

.jr_4A90
    and  $04                                      ;; 18:4A90 $E6 $04
    ld   a, $01                                   ;; 18:4A92 $3E $01
    jr   z, .jr_4A97                              ;; 18:4A94 $28 $01

    inc  a                                        ;; 18:4A96 $3C

.jr_4A97
    jp   SetEntitySpriteVariant                   ;; 18:4A97 $C3 $0C $3B

Data_018_4A9A::
    db   $00, $00, $01, $02, $02, $02, $01, $00

ZoraState3Handler::
    ld   hl, wEntitiesInertiaTable                ;; 18:4AA2 $21 $D0 $C3
    add  hl, bc                                   ;; 18:4AA5 $09
    ld   a, [hl]                                  ;; 18:4AA6 $7E
    inc  [hl]                                     ;; 18:4AA7 $34
    rra                                           ;; 18:4AA8 $1F
    rra                                           ;; 18:4AA9 $1F
    rra                                           ;; 18:4AAA $1F
    and  $07                                      ;; 18:4AAB $E6 $07
    ld   e, a                                     ;; 18:4AAD $5F
    ld   d, b                                     ;; 18:4AAE $50
    ld   hl, Data_018_4A9A                        ;; 18:4AAF $21 $9A $4A
    add  hl, de                                   ;; 18:4AB2 $19
    ld   a, [hl]                                  ;; 18:4AB3 $7E
    ld   hl, wEntitiesPosZTable                   ;; 18:4AB4 $21 $10 $C3
    add  hl, bc                                   ;; 18:4AB7 $09
    ld   [hl], a                                  ;; 18:4AB8 $77
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 18:4AB9 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 18:4ABC $CD $05 $0C
    jr   nz, .jr_4ADC                             ;; 18:4ABF $20 $1B

    call IncrementEntityState                     ;; 18:4AC1 $CD $12 $3B
    ld   [hl], b                                  ;; 18:4AC4 $70
    xor  a                                        ;; 18:4AC5 $AF
    call SetEntitySpriteVariant                   ;; 18:4AC6 $CD $0C $3B
    ld   a, JINGLE_WATER_SPLASH                   ;; 18:4AC9 $3E $0E
    ldh  [hJingle], a                             ;; 18:4ACB $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ;; 18:4ACD $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:4ACF $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:4AD1 $F0 $EC
    add  $00                                      ;; 18:4AD3 $C6 $00
    ldh  [hMultiPurpose1], a                      ;; 18:4AD5 $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 18:4AD7 $3E $01
    jp   AddTranscientVfx                         ;; 18:4AD9 $C3 $C7 $0C

.jr_4ADC
    cp   $30                                      ;; 18:4ADC $FE $30
    jr   nz, .jr_4B03                             ;; 18:4ADE $20 $23

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ;; 18:4AE0 $3E $7D
    call SpawnNewEntity_trampoline                ;; 18:4AE2 $CD $86 $3B
    jr   c, .jr_4B03                              ;; 18:4AE5 $38 $1C

    ldh  a, [hMultiPurpose0]                      ;; 18:4AE7 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:4AE9 $21 $00 $C2
    add  hl, de                                   ;; 18:4AEC $19
    ld   [hl], a                                  ;; 18:4AED $77
    ldh  a, [hMultiPurpose1]                      ;; 18:4AEE $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:4AF0 $21 $10 $C2
    add  hl, de                                   ;; 18:4AF3 $19
    ld   [hl], a                                  ;; 18:4AF4 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 18:4AF5 $21 $B0 $C2
    add  hl, de                                   ;; 18:4AF8 $19
    inc  [hl]                                     ;; 18:4AF9 $34
    push bc                                       ;; 18:4AFA $C5
    ld   c, e                                     ;; 18:4AFB $4B
    ld   b, d                                     ;; 18:4AFC $42
    ld   a, $18                                   ;; 18:4AFD $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 18:4AFF $CD $AA $3B
    pop  bc                                       ;; 18:4B02 $C1

.jr_4B03
    call GetEntityTransitionCountdown             ;; 18:4B03 $CD $05 $0C
    ld   e, $03                                   ;; 18:4B06 $1E $03
    cp   $50                                      ;; 18:4B08 $FE $50
    jr   nc, .jr_4B11                             ;; 18:4B0A $30 $05

    cp   $20                                      ;; 18:4B0C $FE $20
    jr   c, .jr_4B11                              ;; 18:4B0E $38 $01

    inc  e                                        ;; 18:4B10 $1C

.jr_4B11
    ld   a, e                                     ;; 18:4B11 $7B
    jp   SetEntitySpriteVariant                   ;; 18:4B12 $C3 $0C $3B
