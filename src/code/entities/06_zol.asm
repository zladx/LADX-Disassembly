; If in magnifying lens cave, and Link has no trade sequence item, make invisible
ZolGelMakeInvisibleBeforeMagnifyingLens::
    ldh  a, [hMapId]                              ;; 06:7BE2 $F0 $F7
    cp   MAP_CAVE_B                               ;; 06:7BE4 $FE $0A
    ret  nz                                       ;; 06:7BE6 $C0

    ldh  a, [hMapRoom]                            ;; 06:7BE7 $F0 $F6
    cp   ROOM_INDOOR_B_UNDER_MERMAID_STATUE       ;; 06:7BE9 $FE $97
    jr   z, .invisible                            ;; 06:7BEB $28 $03
    cp   ROOM_INDOOR_B_MAGNIFYING_GLASS           ;; 06:7BED $FE $98
    ret  nz                                       ;; 06:7BEF $C0

.invisible
    ld   a, [wExchangingTradeSequenceItem]        ;; 06:7BF0 $FA $7F $DB
    and  a                                        ;; 06:7BF3 $A7
    ret  z                                        ;; 06:7BF4 $C8

    ld   a, $FF                                   ;; 06:7BF5 $3E $FF
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:7BF7 $E0 $F1
    ret                                           ;; 06:7BF9 $C9

GelSpriteVariants::
.variant0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

GelEntityHandler::
    call ZolGelMakeInvisibleBeforeMagnifyingLens  ;; 06:7BFE $CD $E2 $7B
    ld   de, GelSpriteVariants                    ;; 06:7C01 $11 $FA $7B
    call RenderActiveEntitySprite                 ;; 06:7C04 $CD $77 $3C
    jr   AnimateZolGel                            ;; 06:7C07 $18 $25

ZolSpriteVariants::
.variant0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; Zols spawned by Slime Eye are green instead of red 
ZolSlimeEyeSpriteVariants::
.variant0
    db $52, OAM_GBC_PAL_0 | OAMF_PAL0
    db $52, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_0 | OAMF_PAL0
    db $54, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

ZolEntityHandler::
    call ZolGelMakeInvisibleBeforeMagnifyingLens  ;; 06:7C19 $CD $E2 $7B
    ld   de, ZolSpriteVariants                    ;; 06:7C1C $11 $09 $7C
    ld   hl, wEntitiesHealthTable                 ;; 06:7C1F $21 $60 $C3
    add  hl, bc                                   ;; 06:7C22 $09
    ld   a, [hl]                                  ;; 06:7C23 $7E
    and  $02                                      ;; 06:7C24 $E6 $02
    jr   nz, .render                              ;; 06:7C26 $20 $03

    ; load different sprite variants, when health bit 2 is not set
    ld   de, ZolSlimeEyeSpriteVariants            ;; 06:7C28 $11 $11 $7C

.render:
    call RenderActiveEntitySpritesPair            ;; 06:7C2B $CD $C0 $3B

AnimateZolGel:
    ld   hl, wZolCount                            ;; 06:7C2E $21 $AE $C1
    inc  [hl]                                     ;; 06:7C31 $34
    call ReturnIfNonInteractive_06                ;; 06:7C32 $CD $C6 $64
    call AddEntityZSpeedToPos_06                  ;; 06:7C35 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7C38 $21 $20 $C3
    add  hl, bc                                   ;; 06:7C3B $09
    dec  [hl]                                     ;; 06:7C3C $35
    dec  [hl]                                     ;; 06:7C3D $35
    dec  [hl]                                     ;; 06:7C3E $35
    ld   hl, wEntitiesPosZTable                   ;; 06:7C3F $21 $10 $C3
    add  hl, bc                                   ;; 06:7C42 $09
    ld   a, [hl]                                  ;; 06:7C43 $7E
    and  $80                                      ;; 06:7C44 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 06:7C46 $E0 $E8
    jr   z, .hitGroundEnd                         ;; 06:7C48 $28 $06

    ld   [hl], b                                  ;; 06:7C4A $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7C4B $21 $20 $C3
    add  hl, bc                                   ;; 06:7C4E $09
    ld   [hl], b                                  ;; 06:7C4F $70

.hitGroundEnd
    ldh  a, [hActiveEntityType]                   ;; 06:7C50 $F0 $EB
    cp   ENTITY_ZOL                               ;; 06:7C52 $FE $1B
    jr   nz, .splitEnd                            ;; 06:7C54 $20 $61

    ld   hl, wEntitiesFlashCountdownTable         ;; 06:7C56 $21 $20 $C4
    add  hl, bc                                   ;; 06:7C59 $09
    ld   a, [hl]                                  ;; 06:7C5A $7E
    cp   $08                                      ;; 06:7C5B $FE $08
    jr   nz, .splitEnd                            ;; 06:7C5D $20 $58

    ld   [hl], b                                  ;; 06:7C5F $70
    ld   hl, wEntitiesLoadOrderTable              ;; 06:7C60 $21 $60 $C4
    add  hl, bc                                   ;; 06:7C63 $09
    ld   a, [hl]                                  ;; 06:7C64 $7E
    push hl                                       ;; 06:7C65 $E5
    push af                                       ;; 06:7C66 $F5
    ld   hl, wEntitiesTypeTable                   ;; 06:7C67 $21 $A0 $C3
    add  hl, bc                                   ;; 06:7C6A $09
    ld   [hl], ENTITY_GEL                         ;; 06:7C6B $36 $1C
    call ConfigureNewEntity_trampoline            ;; 06:7C6D $CD $65 $39
    pop  af                                       ;; 06:7C70 $F1
    pop  hl                                       ;; 06:7C71 $E1
    ld   [hl], a                                  ;; 06:7C72 $77
    ld   hl, wEntitiesPosXTable                   ;; 06:7C73 $21 $00 $C2
    add  hl, bc                                   ;; 06:7C76 $09
    ld   a, [hl]                                  ;; 06:7C77 $7E
    sub  $04                                      ;; 06:7C78 $D6 $04
    ld   [hl], a                                  ;; 06:7C7A $77
    call ClearEntitySpeed                         ;; 06:7C7B $CD $7F $3D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:7C7E $21 $10 $C4
    add  hl, bc                                   ;; 06:7C81 $09
    ld   [hl], b                                  ;; 06:7C82 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7C83 $21 $20 $C3
    add  hl, bc                                   ;; 06:7C86 $09
    ld   [hl], $20                                ;; 06:7C87 $36 $20
    ld   a, ENTITY_GEL                            ;; 06:7C89 $3E $1C
    call SpawnNewEntity_trampoline                ;; 06:7C8B $CD $86 $3B
    jr   c, .splitEnd                             ;; 06:7C8E $38 $27

    ld   hl, wEntitiesLoadOrderTable              ;; 06:7C90 $21 $60 $C4
    add  hl, bc                                   ;; 06:7C93 $09
    ld   a, [hl]                                  ;; 06:7C94 $7E
    ld   hl, wEntitiesLoadOrderTable              ;; 06:7C95 $21 $60 $C4
    add  hl, de                                   ;; 06:7C98 $19
    ld   [hl], a                                  ;; 06:7C99 $77
    ldh  a, [hMultiPurpose0]                      ;; 06:7C9A $F0 $D7
    add  $08                                      ;; 06:7C9C $C6 $08
    ld   hl, wEntitiesPosXTable                   ;; 06:7C9E $21 $00 $C2
    add  hl, de                                   ;; 06:7CA1 $19
    ld   [hl], a                                  ;; 06:7CA2 $77
    ldh  a, [hMultiPurpose1]                      ;; 06:7CA3 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 06:7CA5 $21 $10 $C2
    add  hl, de                                   ;; 06:7CA8 $19
    ld   [hl], a                                  ;; 06:7CA9 $77
    ldh  a, [hMultiPurpose3]                      ;; 06:7CAA $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 06:7CAC $21 $10 $C3
    add  hl, de                                   ;; 06:7CAF $19
    ld   [hl], a                                  ;; 06:7CB0 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7CB1 $21 $20 $C3
    add  hl, de                                   ;; 06:7CB4 $19
    ld   [hl], $20                                ;; 06:7CB5 $36 $20

.splitEnd
    call ApplyRecoilIfNeeded_06                   ;; 06:7CB7 $CD $F7 $64
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 06:7CBA $21 $00 $C3
    add  hl, bc                                   ;; 06:7CBD $09
    ld   a, [hl]                                  ;; 06:7CBE $7E
    and  a                                        ;; 06:7CBF $A7
    jr   nz, .jr_7CD4                             ;; 06:7CC0 $20 $12

    ldh  a, [hActiveEntityState]                  ;; 06:7CC2 $F0 $F0
    and  $01                                      ;; 06:7CC4 $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:7CC6 $21 $B0 $C3
    add  hl, bc                                   ;; 06:7CC9 $09
    ld   [hl], a                                  ;; 06:7CCA $77
    dec  a                                        ;; 06:7CCB $3D
    jr   nz, .jr_7CD4                             ;; 06:7CCC $20 $06

    ld   hl, wEntitiesPrivateCountdown2Table      ;; 06:7CCE $21 $00 $C3
    add  hl, bc                                   ;; 06:7CD1 $09
    ld   [hl], $08                                ;; 06:7CD2 $36 $08

.jr_7CD4
    ldh  a, [hActiveEntityState]                  ;; 06:7CD4 $F0 $F0
    cp   $04                                      ;; 06:7CD6 $FE $04
    jr   z, .skipCollision                        ;; 06:7CD8 $28 $0B

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 06:7CDA $21 $80 $C4
    add  hl, bc                                   ;; 06:7CDD $09
    ld   a, [hl]                                  ;; 06:7CDE $7E
    and  a                                        ;; 06:7CDF $A7
    jr   nz, .skipCollision                       ;; 06:7CE0 $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:7CE2 $CD $39 $3B

.skipCollision
    ldh  a, [hActiveEntityState]                  ;; 06:7CE5 $F0 $F0
    JP_TABLE                                      ;; 06:7CE7
._00 dw ZolGelState0Handler
._01 dw ZolGelState1Handler
._02 dw ZolGelState2Handler
._03 dw ZolGelState3Handler
._04 dw GelState4Handler

; Inching (up)
ZolGelState1Handler::
    call GetEntityTransitionCountdown             ;; 06:7CF2 $CD $05 $0C
    jr   nz, ZolGelPhysics                        ;; 06:7CF5 $20 $18

    ld   [hl], $10                                ;; 06:7CF7 $36 $10
    call ClearEntitySpeed                         ;; 06:7CF9 $CD $7F $3D
    call GetRandomByte                            ;; 06:7CFC $CD $0D $28
    and  $0F                                      ;; 06:7CFF $E6 $0F
    jr   nz, .skipLeap                            ;; 06:7D01 $20 $08

    call GetEntityTransitionCountdown             ;; 06:7D03 $CD $05 $0C
    ld   [hl], $50                                ;; 06:7D06 $36 $50
    jp   IncrementEntityState                     ;; 06:7D08 $C3 $12 $3B

.skipLeap
    call IncrementEntityState                     ;; 06:7D0B $CD $12 $3B
    ld   [hl], b                                  ;; 06:7D0E $70

ZolGelPhysics::
    call UpdateEntityPosWithSpeed_06              ;; 06:7D0F $CD $41 $65
    call GetEntityPrivateCountdown1               ;; 06:7D12 $CD $00 $0C
    ret  nz                                       ;; 06:7D15 $C0

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:7D16 $21 $10 $C4
    add  hl, bc                                   ;; 06:7D19 $09
    ld   [hl], $02                                ;; 06:7D1A $36 $02
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7D1C $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:7D1F $21 $10 $C4
    add  hl, bc                                   ;; 06:7D22 $09
    ld   [hl], b                                  ;; 06:7D23 $70
    ret                                           ;; 06:7D24 $C9

; Inching (down)
ZolGelState0Handler::
    call ZolGelPhysics                            ;; 06:7D25 $CD $0F $7D
    call GetEntityTransitionCountdown             ;; 06:7D28 $CD $05 $0C
    ret  nz                                       ;; 06:7D2B $C0

    ld   [hl], $07                                ;; 06:7D2C $36 $07
    call IncrementEntityState                     ;; 06:7D2E $CD $12 $3B
    ld   a, $04                                   ;; 06:7D31 $3E $04
    jp   ApplyVectorTowardsLink_trampoline        ;; 06:7D33 $C3 $AA $3B

; Preparing to leap
ZolGelState2Handler::
    call GetEntityTransitionCountdown             ;; 06:7D36 $CD $05 $0C
    jr   nz, .leapEnd                             ;; 06:7D39 $20 $0F

    call IncrementEntityState                     ;; 06:7D3B $CD $12 $3B
    ld   a, $10                                   ;; 06:7D3E $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 06:7D40 $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7D43 $21 $20 $C3
    add  hl, bc                                   ;; 06:7D46 $09
    ld   [hl], $20                                ;; 06:7D47 $36 $20
    ret                                           ;; 06:7D49 $C9

.leapEnd
    call GetEntityTransitionCountdown             ;; 06:7D4A $CD $05 $0C
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7D4D $21 $40 $C2
    add  hl, bc                                   ;; 06:7D50 $09
    and  $04                                      ;; 06:7D51 $E6 $04
    jr   nz, .negative                            ;; 06:7D53 $20 $04

    ld   [hl], $08                                ;; 06:7D55 $36 $08
    jr   .setSpeed                                ;; 06:7D57 $18 $02

.negative
    ld   [hl], $F8                                ;; 06:7D59 $36 $F8

.setSpeed:
    ld   hl, wEntitiesSpeedYTable                 ;; 06:7D5B $21 $50 $C2
    add  hl, bc                                   ;; 06:7D5E $09
    ld   [hl], b                                  ;; 06:7D5F $70
    jp   ZolGelPhysics                            ;; 06:7D60 $C3 $0F $7D

; Leaping
ZolGelState3Handler::
    call ZolGelPhysics                            ;; 06:7D63 $CD $0F $7D
    ldh  a, [hMultiPurposeG]                      ;; 06:7D66 $F0 $E8
    and  a                                        ;; 06:7D68 $A7
    jr   z, .hitGroundEnd                         ;; 06:7D69 $28 $04

    call IncrementEntityState                     ;; 06:7D6B $CD $12 $3B
    ld   [hl], b                                  ;; 06:7D6E $70

.hitGroundEnd
    ret                                           ;; 06:7D6F $C9

; Clinging
GelState4Handler::
    call GetEntityTransitionCountdown             ;; 06:7D70 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 06:7D73 $20 $1C

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 06:7D75 $21 $80 $C4
    add  hl, bc                                   ;; 06:7D78 $09
    ld   [hl], $30                                ;; 06:7D79 $36 $30
    ld   a, $10                                   ;; 06:7D7B $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 06:7D7D $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7D80 $21 $20 $C3
    add  hl, bc                                   ;; 06:7D83 $09
    ld   [hl], $20                                ;; 06:7D84 $36 $20
    ld   hl, wEntitiesPosZTable                   ;; 06:7D86 $21 $10 $C3
    add  hl, bc                                   ;; 06:7D89 $09
    inc  [hl]                                     ;; 06:7D8A $34
    call IncrementEntityState                     ;; 06:7D8B $CD $12 $3B
    ld   [hl], $03                                ;; 06:7D8E $36 $03
    ret                                           ;; 06:7D90 $C9

.skipIncrementState
    push af                                       ;; 06:7D91 $F5
    rra                                           ;; 06:7D92 $1F
    and  $07                                      ;; 06:7D93 $E6 $07
    sub  $04                                      ;; 06:7D95 $D6 $04
    ld   e, a                                     ;; 06:7D97 $5F
    ldh  a, [hLinkPositionX]                      ;; 06:7D98 $F0 $98
    sub  e                                        ;; 06:7D9A $93
    ld   hl, wEntitiesPosXTable                   ;; 06:7D9B $21 $00 $C2
    add  hl, bc                                   ;; 06:7D9E $09
    ld   [hl], a                                  ;; 06:7D9F $77
    pop  af                                       ;; 06:7DA0 $F1
    rra                                           ;; 06:7DA1 $1F
    rra                                           ;; 06:7DA2 $1F
    and  $07                                      ;; 06:7DA3 $E6 $07
    sub  $04                                      ;; 06:7DA5 $D6 $04
    ld   e, a                                     ;; 06:7DA7 $5F
    ldh  a, [hLinkPositionY]                      ;; 06:7DA8 $F0 $99
    sub  e                                        ;; 06:7DAA $93
    ld   hl, wEntitiesPosYTable                   ;; 06:7DAB $21 $10 $C2
    add  hl, bc                                   ;; 06:7DAE $09
    ld   [hl], a                                  ;; 06:7DAF $77
    ldh  a, [hLinkPositionZ]                      ;; 06:7DB0 $F0 $A2
    ld   hl, wEntitiesPosZTable                   ;; 06:7DB2 $21 $10 $C3
    add  hl, bc                                   ;; 06:7DB5 $09
    ld   [hl], a                                  ;; 06:7DB6 $77
    ld   a, $01                                   ;; 06:7DB7 $3E $01
    ld   [wIsGelClingingToLink], a                ;; 06:7DB9 $EA $17 $C1
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:7DBC $CD $23 $3B
    ldh  a, [hJoypadState]                        ;; 06:7DBF $F0 $CC
    and  a                                        ;; 06:7DC1 $A7
    jr   z, DecreaseEntityTransitionCountdown.return ;; 06:7DC2 $28 $0F

    call DecreaseEntityTransitionCountdown        ;; 06:7DC4 $CD $CD $7D
    call DecreaseEntityTransitionCountdown        ;; 06:7DC7 $CD $CD $7D
    call DecreaseEntityTransitionCountdown        ;; 06:7DCA $CD $CD $7D

DecreaseEntityTransitionCountdown::
    call GetEntityTransitionCountdown             ;; 06:7DCD $CD $05 $0C
    jr   z, .return                               ;; 06:7DD0 $28 $01

    dec  [hl]                                     ;; 06:7DD2 $35

.return
    ret                                           ;; 06:7DD3 $C9
