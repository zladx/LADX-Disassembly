RenderSmashablePillar::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:5CA5 $F0 $F1
    inc  a                                        ;; 07:5CA7 $3C
    jr   z, .invisible                            ;; 07:5CA8 $28 $49

    push hl                                       ;; 07:5CAA $E5
    ld   a, [wOAMNextAvailableSlot]               ;; 07:5CAB $FA $C0 $C3
    ld   e, a                                     ;; 07:5CAE $5F
    ld   d, $00                                   ;; 07:5CAF $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 07:5CB1 $21 $30 $C0
    add  hl, de                                   ;; 07:5CB4 $19
    ld   e, l                                     ;; 07:5CB5 $5D
    ld   d, h                                     ;; 07:5CB6 $54
    pop  hl                                       ;; 07:5CB7 $E1

.loop:
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5CB8 $F0 $EC
    add  [hl]                                     ;; 07:5CBA $86
    cp   $7E                                      ;; 07:5CBB $FE $7E
    jr   c, .positiveY                            ;; 07:5CBD $38 $01

    xor  a                                        ;; 07:5CBF $AF

.positiveY
    ld   [de], a                                  ;; 07:5CC0 $12
    inc  hl                                       ;; 07:5CC1 $23
    inc  de                                       ;; 07:5CC2 $13
    push bc                                       ;; 07:5CC3 $C5
    ld   a, [wScreenShakeHorizontal]              ;; 07:5CC4 $FA $55 $C1
    ld   c, a                                     ;; 07:5CC7 $4F
    ldh  a, [hActiveEntityPosX]                   ;; 07:5CC8 $F0 $EE
    add  [hl]                                     ;; 07:5CCA $86
    sub  c                                        ;; 07:5CCB $91
    ld   [de], a                                  ;; 07:5CCC $12
    inc  hl                                       ;; 07:5CCD $23
    inc  de                                       ;; 07:5CCE $13
    ldh  a, [hActiveEntityTilesOffset]            ;; 07:5CCF $F0 $F5
    ld   c, a                                     ;; 07:5CD1 $4F
    ld   a, [hl+]                                 ;; 07:5CD2 $2A
    push af                                       ;; 07:5CD3 $F5
    add  c                                        ;; 07:5CD4 $81
    ld   [de], a                                  ;; 07:5CD5 $12
    pop  af                                       ;; 07:5CD6 $F1
    cp   $FF                                      ;; 07:5CD7 $FE $FF
    jr   nz, .visibleSprite                       ;; 07:5CD9 $20 $04

    dec  de                                       ;; 07:5CDB $1B
    xor  a                                        ;; 07:5CDC $AF
    ld   [de], a                                  ;; 07:5CDD $12
    inc  de                                       ;; 07:5CDE $13

.visibleSprite
    pop  bc                                       ;; 07:5CDF $C1
    inc  de                                       ;; 07:5CE0 $13
    ldh  a, [hActiveEntityFlipAttribute]          ;; 07:5CE1 $F0 $ED
    xor  [hl]                                     ;; 07:5CE3 $AE
    inc  hl                                       ;; 07:5CE4 $23
    ld   [de], a                                  ;; 07:5CE5 $12
    inc  de                                       ;; 07:5CE6 $13
    dec  c                                        ;; 07:5CE7 $0D
    jr   nz, .loop                                ;; 07:5CE8 $20 $CE

    ld   a, [wActiveEntityIndex]                  ;; 07:5CEA $FA $23 $C1
    ld   c, a                                     ;; 07:5CED $4F
    ld   a, $0A                                   ;; 07:5CEE $3E $0A
    jp   func_015_7964_trampoline                 ;; 07:5CF0 $C3 $A0 $3D

.invisible
    ld   a, [wActiveEntityIndex]                  ;; 07:5CF3 $FA $23 $C1
    ld   c, a                                     ;; 07:5CF6 $4F
    ret                                           ;; 07:5CF7 $C9

; Y position, X position, tile n°, attribute 
SmashablePillarSpriteVariants::
.variant0
    db $00, $00, $4C, OAM_GBC_PAL_7 | OAMF_PAL0, $00, $08, $4C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $F0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $E0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $E0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $D0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $D0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $C0, $00, $48, OAM_GBC_PAL_7 | OAMF_PAL0, $C0, $08, $48, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $00, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $00, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $F0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $E0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $E0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $D0, $00, $48, OAM_GBC_PAL_7 | OAMF_PAL0, $D0, $08, $48, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $C0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $C0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $00, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $00, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $F0, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $E0, $00, $48, OAM_GBC_PAL_7 | OAMF_PAL0, $E0, $08, $48, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $D0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $D0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $C0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $C0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $00, $00, $4A, OAM_GBC_PAL_7 | OAMF_PAL0, $00, $08, $4A, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $00, $48, OAM_GBC_PAL_7 | OAMF_PAL0, $F0, $08, $48, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $E0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $E0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $D0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $D0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $C0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $C0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $00, $00, $48, OAM_GBC_PAL_7 | OAMF_PAL0, $00, $08, $48, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $F0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $F0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $E0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $E0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $D0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $D0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
    db $C0, $00, $FF, OAM_GBC_PAL_7 | OAMF_PAL0, $C0, $08, $FF, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP

SmashablePillarEntityHandler::
    ldh  a, [hLinkPositionY]                      ;; 07:5DC0 $F0 $99
    ld   e, a                                     ;; 07:5DC2 $5F
    ld   hl, wEntitiesPosYTable                   ;; 07:5DC3 $21 $10 $C2
    add  hl, bc                                   ;; 07:5DC6 $09
    ld   a, [hl]                                  ;; 07:5DC7 $7E
    sub  e                                        ;; 07:5DC8 $93
    jr   c, .aboveLink                            ;; 07:5DC9 $38 $05

    ld   a, $01                                   ;; 07:5DCB $3E $01
    ld   [wDE00], a                               ;; 07:5DCD $EA $00 $DE

.aboveLink
    ld   hl, wEntitiesPrivateState1Table          ;; 07:5DD0 $21 $B0 $C2
    add  hl, bc                                   ;; 07:5DD3 $09
    ld   a, [hl]                                  ;; 07:5DD4 $7E
    cp   $02                                      ;; 07:5DD5 $FE $02
    jp   z, SmashablePillarDebrisHandler          ;; 07:5DD7 $CA $AB $5F

    and  a                                        ;; 07:5DDA $A7
    jp   nz, SmashablePillarDustHandler           ;; 07:5DDB $C2 $4D $5F

    ldh  a, [hRoomStatus]                         ;; 07:5DDE $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 07:5DE0 $E6 $20
    jp   nz, ClearEntityStatus_07                 ;; 07:5DE2 $C2 $A4 $7E

    ld   a, [wRoomTransitionState]                ;; 07:5DE5 $FA $24 $C1
    and  a                                        ;; 07:5DE8 $A7
    jr   nz, .roomTransition                      ;; 07:5DE9 $20 $0A

    ld   hl, wEntitiesRoomTable                   ;; 07:5DEB $21 $E0 $C3
    add  hl, bc                                   ;; 07:5DEE $09
    ldh  a, [hMapRoom]                            ;; 07:5DEF $F0 $F6
    cp   [hl]                                     ;; 07:5DF1 $BE
    jp   nz, ClearEntityStatus_07                 ;; 07:5DF2 $C2 $A4 $7E

.roomTransition
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:5DF5 $F0 $F1
    cp   $05                                      ;; 07:5DF7 $FE $05
    jr   nc, .variant5End                         ;; 07:5DF9 $30 $17

    rla                                           ;; 07:5DFB $17
    rla                                           ;; 07:5DFC $17
    and  $FC                                      ;; 07:5DFD $E6 $FC
    sla  a                                        ;; 07:5DFF $CB $27
    ld   e, a                                     ;; 07:5E01 $5F
    sla  a                                        ;; 07:5E02 $CB $27
    sla  a                                        ;; 07:5E04 $CB $27
    add  e                                        ;; 07:5E06 $83
    ld   e, a                                     ;; 07:5E07 $5F
    ld   d, b                                     ;; 07:5E08 $50
    ld   hl, SmashablePillarSpriteVariants        ;; 07:5E09 $21 $F8 $5C
    add  hl, de                                   ;; 07:5E0C $19
    ld   c, $0A                                   ;; 07:5E0D $0E $0A
    call RenderSmashablePillar                    ;; 07:5E0F $CD $A5 $5C

.variant5End
    call DecrementEntityIgnoreHitsCountdown       ;; 07:5E12 $CD $56 $0C
    call label_3B70                               ;; 07:5E15 $CD $70 $3B
    call PushLinkOutOfEntity_07                   ;; 07:5E18 $CD $F0 $7C
    ldh  a, [hActiveEntityState]                  ;; 07:5E1B $F0 $F0
    JP_TABLE                                      ;; 07:5E1D
._00 dw SmashablePillarState0Handler              ;; 07:5E1E
._01 dw SmashablePillarState1Handler              ;; 07:5E20
._02 dw SmashablePillarState2Handler              ;; 07:5E22
._03 dw SmashablePillarState3Handler              ;; 07:5E24
._04 dw SmashablePillarState4Handler              ;; 07:5E26
._05 dw SmashablePillarState5Handler              ;; 07:5E28

SmashablePillarState0Handler::
    ret

SmashablePillarState1Handler::
    call func_007_5EEA                            ;; 07:5E2B $CD $EA $5E
    call GetEntityTransitionCountdown             ;; 07:5E2E $CD $05 $0C
    jr   nz, SmashablePillarShakeScreen           ;; 07:5E31 $20 $03

    jp   IncrementEntityState                     ;; 07:5E33 $C3 $12 $3B

SmashablePillarShakeScreen::
    ld   e, $00                                   ;; 07:5E36 $1E $00
    and  $04                                      ;; 07:5E38 $E6 $04
    jr   z, .shakeRight                           ;; 07:5E3A $28 $02

    ld   e, $02                                   ;; 07:5E3C $1E $02

.shakeRight
    ld   a, e                                     ;; 07:5E3E $7B
    ld   [wScreenShakeHorizontal], a              ;; 07:5E3F $EA $55 $C1
    ret                                           ;; 07:5E42 $C9

SmashablePillarState2Handler::
    call func_007_5EEA                            ;; 07:5E43 $CD $EA $5E
    ldh  a, [hFrameCounter]                       ;; 07:5E46 $F0 $E7
    call SmashablePillarShakeScreen               ;; 07:5E48 $CD $36 $5E
    ldh  a, [hFrameCounter]                       ;; 07:5E4B $F0 $E7
    and  $1F                                      ;; 07:5E4D $E6 $1F
    jr   nz, .spawnDebrisEnd                      ;; 07:5E4F $20 $16

    ld   hl, wEntitiesSpriteVariantTable          ;; 07:5E51 $21 $B0 $C3
    add  hl, bc                                   ;; 07:5E54 $09
    ld   a, [hl]                                  ;; 07:5E55 $7E
    inc  a                                        ;; 07:5E56 $3C
    ld   [hl], a                                  ;; 07:5E57 $77
    cp   $05                                      ;; 07:5E58 $FE $05
    jp   z, SmashablePillarDestroyed              ;; 07:5E5A $CA $A7 $5E

    call GetRandomByte                            ;; 07:5E5D $CD $0D $28
    and  $03                                      ;; 07:5E60 $E6 $03
    jr   z, .spawnDebrisEnd                       ;; 07:5E62 $28 $03

    call SmashablePillarSpawnDebris               ;; 07:5E64 $CD $61 $5F

.spawnDebrisEnd
    ldh  a, [hFrameCounter]                       ;; 07:5E67 $F0 $E7
    and  $03                                      ;; 07:5E69 $E6 $03
    jr   nz, .return                              ;; 07:5E6B $20 $39

    ld   a, ENTITY_SMASHABLE_PILLAR               ;; 07:5E6D $3E $A7
    call SpawnNewEntity_trampoline                ;; 07:5E6F $CD $86 $3B
    jr   c, .return                               ;; 07:5E72 $38 $32

    call GetRandomByte                            ;; 07:5E74 $CD $0D $28
    and  $07                                      ;; 07:5E77 $E6 $07
    sub  $04                                      ;; 07:5E79 $D6 $04
    ld   hl, hMultiPurpose1                       ;; 07:5E7B $21 $D8 $FF
    add  [hl]                                     ;; 07:5E7E $86
    ld   hl, wEntitiesPosYTable                   ;; 07:5E7F $21 $10 $C2
    add  hl, de                                   ;; 07:5E82 $19
    ld   [hl], a                                  ;; 07:5E83 $77
    call GetRandomByte                            ;; 07:5E84 $CD $0D $28
    and  $1F                                      ;; 07:5E87 $E6 $1F
    sub  $10                                      ;; 07:5E89 $D6 $10
    ld   hl, hMultiPurpose0                       ;; 07:5E8B $21 $D7 $FF
    add  [hl]                                     ;; 07:5E8E $86
    ld   hl, wEntitiesPosXTable                   ;; 07:5E8F $21 $00 $C2
    add  hl, de                                   ;; 07:5E92 $19
    ld   [hl], a                                  ;; 07:5E93 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:5E94 $21 $40 $C3
    add  hl, de                                   ;; 07:5E97 $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 07:5E98 $36 $C2
    ld   hl, wEntitiesTransitionCountdownTable    ;; 07:5E9A $21 $E0 $C2
    add  hl, de                                   ;; 07:5E9D $19
    ld   [hl], $10                                ;; 07:5E9E $36 $10
    ld   hl, wEntitiesPrivateState1Table          ;; 07:5EA0 $21 $B0 $C2
    add  hl, de                                   ;; 07:5EA3 $19
    ld   [hl], $01                                ;; 07:5EA4 $36 $01

.return
    ret                                           ;; 07:5EA6 $C9

SmashablePillarDestroyed:
    ld   a, $00                                   ;; 07:5EA7 $3E $00
    ld   [wScreenShakeHorizontal], a              ;; 07:5EA9 $EA $55 $C1
    ld   a, [wNumberOfDungeon7PillarsDestroyed]   ;; 07:5EAC $FA $72 $DB
    inc  a                                        ;; 07:5EAF $3C
    ld   [wNumberOfDungeon7PillarsDestroyed], a   ;; 07:5EB0 $EA $72 $DB
    cp   $04                                      ;; 07:5EB3 $FE $04
    jr   c, .lastPillar                           ;; 07:5EB5 $38 $08

    call GetEntityTransitionCountdown             ;; 07:5EB7 $CD $05 $0C
    ld   [hl], $20                                ;; 07:5EBA $36 $20
    jp   IncrementEntityState                     ;; 07:5EBC $C3 $12 $3B

.lastPillar
    call func_007_6E7F                            ;; 07:5EBF $CD $7F $6E
    jp   ClearEntityStatus_07                     ;; 07:5EC2 $C3 $A4 $7E

SmashablePillarState3Handler::
    call GetEntityTransitionCountdown             ;; 07:5EC5 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 07:5EC8 $20 $14

    ld   [hl], $20                                ;; 07:5ECA $36 $20
    ld   a, GAMEPLAY_CUTSCENE                     ;; 07:5ECC $3E $08
    ld   [wGameplayType], a                       ;; 07:5ECE $EA $95 $DB
    xor  a                                        ;; 07:5ED1 $AF
    ld   [wTransitionSequenceCounter], a          ;; 07:5ED2 $EA $6B $C1
    ld   [wC16C], a                               ;; 07:5ED5 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 07:5ED8 $EA $96 $DB
    jp   IncrementEntityState                     ;; 07:5EDB $C3 $12 $3B

.skipIncrementState
    ld   e, $00                                   ;; 07:5EDE $1E $00
    and  $04                                      ;; 07:5EE0 $E6 $04
    jr   z, .shakeRight                           ;; 07:5EE2 $28 $02

    ld   e, $02                                   ;; 07:5EE4 $1E $02

.shakeRight
    ld   a, e                                     ;; 07:5EE6 $7B
    ld   [wScreenShakeHorizontal], a              ;; 07:5EE7 $EA $55 $C1

func_007_5EEA::
    ld   a, $02                                   ;; 07:5EEA $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:5EEC $E0 $A1
    ld   [wC111], a                               ;; 07:5EEE $EA $11 $C1
    ret                                           ;; 07:5EF1 $C9

SmashablePillarState4Handler::
    xor  a                                        ;; 07:5EF2 $AF
    ld   [wScreenShakeHorizontal], a              ;; 07:5EF3 $EA $55 $C1
    call GetEntityTransitionCountdown             ;; 07:5EF6 $CD $05 $0C
    jr   nz, .skipCollapseTower                   ;; 07:5EF9 $20 $0B

    call func_007_6E7F                            ;; 07:5EFB $CD $7F $6E
    ld   hl, wHasInstrument7                      ;; 07:5EFE $21 $6B $DB
    set  2, [hl]                                  ;; 07:5F01 $CB $D6
    jp   ClearEntityStatus_07                     ;; 07:5F03 $C3 $A4 $7E

.skipCollapseTower
    jp   func_007_5EEA                            ;; 07:5F06 $C3 $EA $5E

Data_007_5F09::
    db   $00, $02, $04, $06, $06, $04, $02, $00

SmashablePillarState5Handler::
    xor  a                                        ;; 07:5F11 $AF
    ld   [wScreenShakeVertical], a                ;; 07:5F12 $EA $56 $C1
    call GetEntityTransitionCountdown             ;; 07:5F15 $CD $05 $0C
    jr   nz, .skipClearStatus                     ;; 07:5F18 $20 $03

    jp   ClearEntityStatus_07                     ;; 07:5F1A $C3 $A4 $7E

.skipClearStatus
    push af                                       ;; 07:5F1D $F5
    and  $07                                      ;; 07:5F1E $E6 $07
    ld   e, a                                     ;; 07:5F20 $5F
    ld   d, b                                     ;; 07:5F21 $50
    ld   hl, Data_007_5F09                        ;; 07:5F22 $21 $09 $5F
    add  hl, de                                   ;; 07:5F25 $19
    ld   a, [hl]                                  ;; 07:5F26 $7E
    ld   [wScreenShakeVertical], a                ;; 07:5F27 $EA $56 $C1
    pop  af                                       ;; 07:5F2A $F1
    cp   $20                                      ;; 07:5F2B $FE $20
    jr   nc, .skipSpawnDebris                     ;; 07:5F2D $30 $08

    and  $03                                      ;; 07:5F2F $E6 $03
    jr   nz, .skipSpawnDebris                     ;; 07:5F31 $20 $04

    call SmashablePillarSpawnDebris               ;; 07:5F33 $CD $61 $5F
    xor  a                                        ;; 07:5F36 $AF

.skipSpawnDebris
    cp   $40                                      ;; 07:5F37 $FE $40
    jr   c, .return                               ;; 07:5F39 $38 $09

    and  $07                                      ;; 07:5F3B $E6 $07
    jr   nz, .return                              ;; 07:5F3D $20 $05

    ld   hl, hNoiseSfx                            ;; 07:5F3F $21 $F4 $FF
    ld   [hl], NOISE_SFX_EXPLOSION                ;; 07:5F42 $36 $0C

.return
    ret                                           ;; 07:5F44 $C9

SmashablePillarDustSpriteVariants::
.variant0
    db $30, OAM_GBC_PAL_1 | OAMF_PAL0
    db $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $32, OAM_GBC_PAL_1 | OAMF_PAL0
    db $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

SmashablePillarDustHandler::
    ld   de, SmashablePillarDustSpriteVariants    ;; 07:5F4D $11 $45 $5F
    call RenderActiveEntitySpritesPair            ;; 07:5F50 $CD $C0 $3B
    call GetEntityTransitionCountdown             ;; 07:5F53 $CD $05 $0C
    jp   z, ClearEntityStatus_07                  ;; 07:5F56 $CA $A4 $7E

    cp   $04                                      ;; 07:5F59 $FE $04
    ret  nz                                       ;; 07:5F5B $C0

    ld   a, $01                                   ;; 07:5F5C $3E $01
    jp   SetEntitySpriteVariant                   ;; 07:5F5E $C3 $0C $3B

SmashablePillarSpawnDebris::
    ld   a, ENTITY_SMASHABLE_PILLAR               ;; 07:5F61 $3E $A7
    call SpawnNewEntity_trampoline                ;; 07:5F63 $CD $86 $3B
    jr   c, .return                               ;; 07:5F66 $38 $32

    ld   hl, wEntitiesPrivateState1Table          ;; 07:5F68 $21 $B0 $C2
    add  hl, de                                   ;; 07:5F6B $19
    ld   [hl], $02                                ;; 07:5F6C $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:5F6E $21 $40 $C3
    add  hl, de                                   ;; 07:5F71 $19
    ld   [hl], 1 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 07:5F72 $36 $D1
    ld   hl, wEntitiesPosZTable                   ;; 07:5F74 $21 $10 $C3
    add  hl, de                                   ;; 07:5F77 $19
    ld   [hl], $70                                ;; 07:5F78 $36 $70
    call GetRandomByte                            ;; 07:5F7A $CD $0D $28
    and  $3F                                      ;; 07:5F7D $E6 $3F
    sub  $20                                      ;; 07:5F7F $D6 $20
    ld   hl, hMultiPurpose0                       ;; 07:5F81 $21 $D7 $FF
    add  [hl]                                     ;; 07:5F84 $86
    ld   hl, wEntitiesPosXTable                   ;; 07:5F85 $21 $00 $C2
    add  hl, de                                   ;; 07:5F88 $19
    ld   [hl], a                                  ;; 07:5F89 $77
    call GetRandomByte                            ;; 07:5F8A $CD $0D $28
    and  $3F                                      ;; 07:5F8D $E6 $3F
    sub  $20                                      ;; 07:5F8F $D6 $20
    ld   hl, hMultiPurpose1                       ;; 07:5F91 $21 $D8 $FF
    add  [hl]                                     ;; 07:5F94 $86
    ld   hl, wEntitiesPosYTable                   ;; 07:5F95 $21 $10 $C2
    add  hl, de                                   ;; 07:5F98 $19
    ld   [hl], a                                  ;; 07:5F99 $77

.return
    ret                                           ;; 07:5F9A $C9

SmashablePillarDebrisSpriteVariants::
.variant0
    db $16, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $16, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

; Initial z speed is lower for each consecutive bounce
SmashablePillarDebrisZSpeeds::
    db   $18, $10, $0C, $08

SmashablePillarDebrisXSpeeds::
    db   $0C, $F4, $0C, $F4

SmashablePillarDebrisYSpeeds::
    db   $F4, $F4, $0C, $0C

SmashablePillarDebrisHandler::
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5FAB $F0 $EC
    add  $08                                      ;; 07:5FAD $C6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 07:5FAF $E0 $EC
    ld   de, SmashablePillarDebrisSpriteVariants  ;; 07:5FB1 $11 $9B $5F
    call RenderActiveEntitySprite                 ;; 07:5FB4 $CD $77 $3C
    call UpdateEntityPosWithSpeed_07              ;; 07:5FB7 $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ;; 07:5FBA $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:5FBD $21 $20 $C3
    add  hl, bc                                   ;; 07:5FC0 $09
    dec  [hl]                                     ;; 07:5FC1 $35
    dec  [hl]                                     ;; 07:5FC2 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:5FC3 $21 $10 $C3
    add  hl, bc                                   ;; 07:5FC6 $09
    ld   a, [hl]                                  ;; 07:5FC7 $7E
    and  $80                                      ;; 07:5FC8 $E6 $80
    ret  z                                        ;; 07:5FCA $C8

    ld   [hl], b                                  ;; 07:5FCB $70
    ld   hl, wEntitiesStateTable                  ;; 07:5FCC $21 $90 $C2
    add  hl, bc                                   ;; 07:5FCF $09
    ld   a, [hl]                                  ;; 07:5FD0 $7E
    inc  [hl]                                     ;; 07:5FD1 $34
    cp   $04                                      ;; 07:5FD2 $FE $04
    jp   z, ClearEntityStatus_07                  ;; 07:5FD4 $CA $A4 $7E

    ld   e, a                                     ;; 07:5FD7 $5F
    ld   d, b                                     ;; 07:5FD8 $50
    ld   hl, SmashablePillarDebrisZSpeeds         ;; 07:5FD9 $21 $9F $5F
    add  hl, de                                   ;; 07:5FDC $19
    ld   a, [hl]                                  ;; 07:5FDD $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:5FDE $21 $20 $C3
    add  hl, bc                                   ;; 07:5FE1 $09
    ld   [hl], a                                  ;; 07:5FE2 $77
    call GetRandomByte                            ;; 07:5FE3 $CD $0D $28
    and  $03                                      ;; 07:5FE6 $E6 $03
    ld   e, a                                     ;; 07:5FE8 $5F
    ld   d, b                                     ;; 07:5FE9 $50
    ld   hl, SmashablePillarDebrisXSpeeds         ;; 07:5FEA $21 $A3 $5F
    add  hl, de                                   ;; 07:5FED $19
    ld   a, [hl]                                  ;; 07:5FEE $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:5FEF $21 $40 $C2
    add  hl, bc                                   ;; 07:5FF2 $09
    ld   [hl], a                                  ;; 07:5FF3 $77
    ld   hl, SmashablePillarDebrisYSpeeds         ;; 07:5FF4 $21 $A7 $5F
    add  hl, de                                   ;; 07:5FF7 $19
    ld   a, [hl]                                  ;; 07:5FF8 $7E
    call GetEntitySpeedYAddress                   ;; 07:5FF9 $CD $05 $40
    ld   [hl], a                                  ;; 07:5FFC $77
    ld   a, e                                     ;; 07:5FFD $7B
    and  $01                                      ;; 07:5FFE $E6 $01
    jp   SetEntitySpriteVariant                   ;; 07:6000 $C3 $0C $3B
