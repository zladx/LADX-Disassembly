; If in magnifying lens cave, and Link has no trade sequence item, make invisible
ZolGelMakeInvisibleBeforeMagnifyingLens::
    ldh  a, [hMapId]                              ; $7BE2: $F0 $F7
    cp   MAP_CAVE_B                               ; $7BE4: $FE $0A
    ret  nz                                       ; $7BE6: $C0

    ldh  a, [hMapRoom]                            ; $7BE7: $F0 $F6
    cp   ROOM_INDOOR_B_UNDER_MERMAID_STATUE       ; $7BE9: $FE $97
    jr   z, .invisible                            ; $7BEB: $28 $03
    cp   ROOM_INDOOR_B_MAGNIFYING_GLASS           ; $7BED: $FE $98
    ret  nz                                       ; $7BEF: $C0

.invisible
    ld   a, [wExchangingTradeSequenceItem]        ; $7BF0: $FA $7F $DB
    and  a                                        ; $7BF3: $A7
    ret  z                                        ; $7BF4: $C8

    ld   a, $FF                                   ; $7BF5: $3E $FF
    ldh  [hActiveEntitySpriteVariant], a          ; $7BF7: $E0 $F1
    ret                                           ; $7BF9: $C9

GelSpriteVariants::
.variant0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

GelEntityHandler::
    call ZolGelMakeInvisibleBeforeMagnifyingLens  ; $7BFE: $CD $E2 $7B
    ld   de, GelSpriteVariants                    ; $7C01: $11 $FA $7B
    call RenderActiveEntitySprite                 ; $7C04: $CD $77 $3C
    jr   AnimateZolGel                            ; $7C07: $18 $25

; Zols spawned by Slime Eye are green instead of red 
ZolSlimeEyeSpriteVariants::
.variant0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

ZolSpriteVariants::
.variant0
    db $52, OAM_GBC_PAL_0 | OAMF_PAL0
    db $52, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_0 | OAMF_PAL0
    db $54, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

ZolEntityHandler::
    call ZolGelMakeInvisibleBeforeMagnifyingLens  ; $7C19: $CD $E2 $7B
    ld   de, ZolSlimeEyeSpriteVariants            ; $7C1C: $11 $09 $7C
    ld   hl, wEntitiesHealthTable                 ; $7C1F: $21 $60 $C3
    add  hl, bc                                   ; $7C22: $09
    ld   a, [hl]                                  ; $7C23: $7E
    and  $02                                      ; $7C24: $E6 $02
    jr   nz, .render                              ; $7C26: $20 $03

    ; load different sprite variants, when health bit 2 is set
    ld   de, ZolSpriteVariants                    ; $7C28: $11 $11 $7C

.render:
    call RenderActiveEntitySpritesPair            ; $7C2B: $CD $C0 $3B

AnimateZolGel:
    ld   hl, wZolCount                            ; $7C2E: $21 $AE $C1
    inc  [hl]                                     ; $7C31: $34
    call ReturnIfNonInteractive_06                ; $7C32: $CD $C6 $64
    call AddEntityZSpeedToPos_06                  ; $7C35: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7C38: $21 $20 $C3
    add  hl, bc                                   ; $7C3B: $09
    dec  [hl]                                     ; $7C3C: $35
    dec  [hl]                                     ; $7C3D: $35
    dec  [hl]                                     ; $7C3E: $35
    ld   hl, wEntitiesPosZTable                   ; $7C3F: $21 $10 $C3
    add  hl, bc                                   ; $7C42: $09
    ld   a, [hl]                                  ; $7C43: $7E
    and  $80                                      ; $7C44: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $7C46: $E0 $E8
    jr   z, .hitGroundEnd                    ; $7C48: $28 $06

    ld   [hl], b                                  ; $7C4A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C4B: $21 $20 $C3
    add  hl, bc                                   ; $7C4E: $09
    ld   [hl], b                                  ; $7C4F: $70

.hitGroundEnd
    ldh  a, [hActiveEntityType]                   ; $7C50: $F0 $EB
    cp   ENTITY_ZOL                               ; $7C52: $FE $1B
    jr   nz, .splitEnd                            ; $7C54: $20 $61

    ld   hl, wEntitiesFlashCountdownTable         ; $7C56: $21 $20 $C4
    add  hl, bc                                   ; $7C59: $09
    ld   a, [hl]                                  ; $7C5A: $7E
    cp   $08                                      ; $7C5B: $FE $08
    jr   nz, .splitEnd                            ; $7C5D: $20 $58

    ld   [hl], b                                  ; $7C5F: $70
    ld   hl, wEntitiesLoadOrderTable              ; $7C60: $21 $60 $C4
    add  hl, bc                                   ; $7C63: $09
    ld   a, [hl]                                  ; $7C64: $7E
    push hl                                       ; $7C65: $E5
    push af                                       ; $7C66: $F5
    ld   hl, wEntitiesTypeTable                   ; $7C67: $21 $A0 $C3
    add  hl, bc                                   ; $7C6A: $09
    ld   [hl], ENTITY_GEL                         ; $7C6B: $36 $1C
    call ConfigureNewEntity_trampoline            ; $7C6D: $CD $65 $39
    pop  af                                       ; $7C70: $F1
    pop  hl                                       ; $7C71: $E1
    ld   [hl], a                                  ; $7C72: $77
    ld   hl, wEntitiesPosXTable                   ; $7C73: $21 $00 $C2
    add  hl, bc                                   ; $7C76: $09
    ld   a, [hl]                                  ; $7C77: $7E
    sub  $04                                      ; $7C78: $D6 $04
    ld   [hl], a                                  ; $7C7A: $77
    call ClearEntitySpeed                         ; $7C7B: $CD $7F $3D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7C7E: $21 $10 $C4
    add  hl, bc                                   ; $7C81: $09
    ld   [hl], b                                  ; $7C82: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C83: $21 $20 $C3
    add  hl, bc                                   ; $7C86: $09
    ld   [hl], $20                                ; $7C87: $36 $20
    ld   a, ENTITY_GEL                            ; $7C89: $3E $1C
    call SpawnNewEntity_trampoline                ; $7C8B: $CD $86 $3B
    jr   c, .splitEnd                             ; $7C8E: $38 $27

    ld   hl, wEntitiesLoadOrderTable              ; $7C90: $21 $60 $C4
    add  hl, bc                                   ; $7C93: $09
    ld   a, [hl]                                  ; $7C94: $7E
    ld   hl, wEntitiesLoadOrderTable              ; $7C95: $21 $60 $C4
    add  hl, de                                   ; $7C98: $19
    ld   [hl], a                                  ; $7C99: $77
    ldh  a, [hMultiPurpose0]                      ; $7C9A: $F0 $D7
    add  $08                                      ; $7C9C: $C6 $08
    ld   hl, wEntitiesPosXTable                   ; $7C9E: $21 $00 $C2
    add  hl, de                                   ; $7CA1: $19
    ld   [hl], a                                  ; $7CA2: $77
    ldh  a, [hMultiPurpose1]                      ; $7CA3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7CA5: $21 $10 $C2
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    ldh  a, [hMultiPurpose3]                      ; $7CAA: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $7CAC: $21 $10 $C3
    add  hl, de                                   ; $7CAF: $19
    ld   [hl], a                                  ; $7CB0: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7CB1: $21 $20 $C3
    add  hl, de                                   ; $7CB4: $19
    ld   [hl], $20                                ; $7CB5: $36 $20

.splitEnd
    call ApplyRecoilIfNeeded_06                   ; $7CB7: $CD $F7 $64
    ld   hl, wEntitiesPrivateCountdown2Table      ; $7CBA: $21 $00 $C3
    add  hl, bc                                   ; $7CBD: $09
    ld   a, [hl]                                  ; $7CBE: $7E
    and  a                                        ; $7CBF: $A7
    jr   nz, .jr_7CD4                             ; $7CC0: $20 $12

    ldh  a, [hActiveEntityState]                  ; $7CC2: $F0 $F0
    and  $01                                      ; $7CC4: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ; $7CC6: $21 $B0 $C3
    add  hl, bc                                   ; $7CC9: $09
    ld   [hl], a                                  ; $7CCA: $77
    dec  a                                        ; $7CCB: $3D
    jr   nz, .jr_7CD4                             ; $7CCC: $20 $06

    ld   hl, wEntitiesPrivateCountdown2Table      ; $7CCE: $21 $00 $C3
    add  hl, bc                                   ; $7CD1: $09
    ld   [hl], $08                                ; $7CD2: $36 $08

.jr_7CD4
    ldh  a, [hActiveEntityState]                  ; $7CD4: $F0 $F0
    cp   $04                                      ; $7CD6: $FE $04
    jr   z, .skipCollision                        ; $7CD8: $28 $0B

    ld   hl, wEntitiesPrivateCountdown3Table      ; $7CDA: $21 $80 $C4
    add  hl, bc                                   ; $7CDD: $09
    ld   a, [hl]                                  ; $7CDE: $7E
    and  a                                        ; $7CDF: $A7
    jr   nz, .skipCollision                       ; $7CE0: $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ; $7CE2: $CD $39 $3B

.skipCollision
    ldh  a, [hActiveEntityState]                  ; $7CE5: $F0 $F0
    JP_TABLE                                      ; $7CE7
._00 dw ZolGelState0Handler
._01 dw ZolGelState1Handler
._02 dw ZolGelState2Handler
._03 dw ZolGelState3Handler
._04 dw GelState4Handler

; Inching (up)
ZolGelState1Handler::
    call GetEntityTransitionCountdown             ; $7CF2: $CD $05 $0C
    jr   nz, ZolGelPhysics                        ; $7CF5: $20 $18

    ld   [hl], $10                                ; $7CF7: $36 $10
    call ClearEntitySpeed                         ; $7CF9: $CD $7F $3D
    call GetRandomByte                            ; $7CFC: $CD $0D $28
    and  $0F                                      ; $7CFF: $E6 $0F
    jr   nz, .skipLeap                            ; $7D01: $20 $08

    call GetEntityTransitionCountdown             ; $7D03: $CD $05 $0C
    ld   [hl], $50                                ; $7D06: $36 $50
    jp   IncrementEntityState                     ; $7D08: $C3 $12 $3B

.skipLeap
    call IncrementEntityState                     ; $7D0B: $CD $12 $3B
    ld   [hl], b                                  ; $7D0E: $70

ZolGelPhysics::
    call UpdateEntityPosWithSpeed_06              ; $7D0F: $CD $41 $65
    call GetEntityPrivateCountdown1               ; $7D12: $CD $00 $0C
    ret  nz                                       ; $7D15: $C0

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7D16: $21 $10 $C4
    add  hl, bc                                   ; $7D19: $09
    ld   [hl], $02                                ; $7D1A: $36 $02
    call DefaultEntityPhysics_trampoline          ; $7D1C: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7D1F: $21 $10 $C4
    add  hl, bc                                   ; $7D22: $09
    ld   [hl], b                                  ; $7D23: $70
    ret                                           ; $7D24: $C9

; Inching (down)
ZolGelState0Handler::
    call ZolGelPhysics                            ; $7D25: $CD $0F $7D
    call GetEntityTransitionCountdown             ; $7D28: $CD $05 $0C
    ret  nz                                       ; $7D2B: $C0

    ld   [hl], $07                                ; $7D2C: $36 $07
    call IncrementEntityState                     ; $7D2E: $CD $12 $3B
    ld   a, $04                                   ; $7D31: $3E $04
    jp   ApplyVectorTowardsLink_trampoline        ; $7D33: $C3 $AA $3B

; Preparing to leap
ZolGelState2Handler::
    call GetEntityTransitionCountdown             ; $7D36: $CD $05 $0C
    jr   nz, .leapEnd                             ; $7D39: $20 $0F

    call IncrementEntityState                     ; $7D3B: $CD $12 $3B
    ld   a, $10                                   ; $7D3E: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $7D40: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D43: $21 $20 $C3
    add  hl, bc                                   ; $7D46: $09
    ld   [hl], $20                                ; $7D47: $36 $20
    ret                                           ; $7D49: $C9

.leapEnd
    call GetEntityTransitionCountdown             ; $7D4A: $CD $05 $0C
    ld   hl, wEntitiesSpeedXTable                 ; $7D4D: $21 $40 $C2
    add  hl, bc                                   ; $7D50: $09
    and  $04                                      ; $7D51: $E6 $04
    jr   nz, .negative                            ; $7D53: $20 $04

    ld   [hl], $08                                ; $7D55: $36 $08
    jr   .setSpeed                                ; $7D57: $18 $02

.negative
    ld   [hl], $F8                                ; $7D59: $36 $F8

.setSpeed:
    ld   hl, wEntitiesSpeedYTable                 ; $7D5B: $21 $50 $C2
    add  hl, bc                                   ; $7D5E: $09
    ld   [hl], b                                  ; $7D5F: $70
    jp   ZolGelPhysics                            ; $7D60: $C3 $0F $7D

; Leaping
ZolGelState3Handler::
    call ZolGelPhysics                            ; $7D63: $CD $0F $7D
    ldh  a, [hMultiPurposeG]                      ; $7D66: $F0 $E8
    and  a                                        ; $7D68: $A7
    jr   z, .hitGroundEnd                    ; $7D69: $28 $04

    call IncrementEntityState                     ; $7D6B: $CD $12 $3B
    ld   [hl], b                                  ; $7D6E: $70

.hitGroundEnd
    ret                                           ; $7D6F: $C9

; Clinging
GelState4Handler::
    call GetEntityTransitionCountdown             ; $7D70: $CD $05 $0C
    jr   nz, .skipIncrementState                  ; $7D73: $20 $1C

    ld   hl, wEntitiesPrivateCountdown3Table      ; $7D75: $21 $80 $C4
    add  hl, bc                                   ; $7D78: $09
    ld   [hl], $30                                ; $7D79: $36 $30
    ld   a, $10                                   ; $7D7B: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $7D7D: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D80: $21 $20 $C3
    add  hl, bc                                   ; $7D83: $09
    ld   [hl], $20                                ; $7D84: $36 $20
    ld   hl, wEntitiesPosZTable                   ; $7D86: $21 $10 $C3
    add  hl, bc                                   ; $7D89: $09
    inc  [hl]                                     ; $7D8A: $34
    call IncrementEntityState                     ; $7D8B: $CD $12 $3B
    ld   [hl], $03                                ; $7D8E: $36 $03
    ret                                           ; $7D90: $C9

.skipIncrementState
    push af                                       ; $7D91: $F5
    rra                                           ; $7D92: $1F
    and  $07                                      ; $7D93: $E6 $07
    sub  $04                                      ; $7D95: $D6 $04
    ld   e, a                                     ; $7D97: $5F
    ldh  a, [hLinkPositionX]                      ; $7D98: $F0 $98
    sub  e                                        ; $7D9A: $93
    ld   hl, wEntitiesPosXTable                   ; $7D9B: $21 $00 $C2
    add  hl, bc                                   ; $7D9E: $09
    ld   [hl], a                                  ; $7D9F: $77
    pop  af                                       ; $7DA0: $F1
    rra                                           ; $7DA1: $1F
    rra                                           ; $7DA2: $1F
    and  $07                                      ; $7DA3: $E6 $07
    sub  $04                                      ; $7DA5: $D6 $04
    ld   e, a                                     ; $7DA7: $5F
    ldh  a, [hLinkPositionY]                      ; $7DA8: $F0 $99
    sub  e                                        ; $7DAA: $93
    ld   hl, wEntitiesPosYTable                   ; $7DAB: $21 $10 $C2
    add  hl, bc                                   ; $7DAE: $09
    ld   [hl], a                                  ; $7DAF: $77
    ldh  a, [hLinkPositionZ]                      ; $7DB0: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $7DB2: $21 $10 $C3
    add  hl, bc                                   ; $7DB5: $09
    ld   [hl], a                                  ; $7DB6: $77
    ld   a, $01                                   ; $7DB7: $3E $01
    ld   [wIsGelClingingToLink], a                ; $7DB9: $EA $17 $C1
    call DefaultEntityPhysics_trampoline          ; $7DBC: $CD $23 $3B
    ldh  a, [hJoypadState]                        ; $7DBF: $F0 $CC
    and  a                                        ; $7DC1: $A7
    jr   z, DecreaseEntityTransitionCountdown.return ; $7DC2: $28 $0F

    call DecreaseEntityTransitionCountdown        ; $7DC4: $CD $CD $7D
    call DecreaseEntityTransitionCountdown        ; $7DC7: $CD $CD $7D
    call DecreaseEntityTransitionCountdown        ; $7DCA: $CD $CD $7D

DecreaseEntityTransitionCountdown::
    call GetEntityTransitionCountdown             ; $7DCD: $CD $05 $0C
    jr   z, .return                               ; $7DD0: $28 $01

    dec  [hl]                                     ; $7DD2: $35

.return
    ret                                           ; $7DD3: $C9
