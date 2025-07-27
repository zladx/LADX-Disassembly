; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CheepCheepSpriteVariants::
.variant0
    db $60, $01
    db $62, $01
.variant1
    db $64, $01
    db $66, $01
.variant2
    db $62, $21
    db $60, $21
.variant3
    db $66, $21
    db $64, $21

CheepCheepHorizontalEntityHandler::
CheepCheepVerticalEntityHandler::
    ld   de, CheepCheepSpriteVariants             ;; 19:6B54 $11 $44 $6B
    call RenderActiveEntitySpritesPair            ;; 19:6B57 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:6B5A $CD $3D $7D
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6B5D $21 $40 $C2
    add  hl, bc                                   ;; 19:6B60 $09
    ld   a, [hl]                                  ;; 19:6B61 $7E
    rlca                                          ;; 19:6B62 $07
    rlca                                          ;; 19:6B63 $07
    and  $02                                      ;; 19:6B64 $E6 $02
    ld   e, a                                     ;; 19:6B66 $5F
    ldh  a, [hFrameCounter]                       ;; 19:6B67 $F0 $E7
    rra                                           ;; 19:6B69 $1F
    rra                                           ;; 19:6B6A $1F
    rra                                           ;; 19:6B6B $1F
    and  $01                                      ;; 19:6B6C $E6 $01
    or   e                                        ;; 19:6B6E $B3
    call SetEntitySpriteVariant                   ;; 19:6B6F $CD $0C $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 19:6B72 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 19:6B75 $F0 $F0
    JP_TABLE                                      ;; 19:6B77
._00 dw CheepCheepState0Handler
._01 dw CheepCheepState1Handler
._02 dw CheepCheepState2Handler

CheepCheepState0Handler::
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6B7E $21 $40 $C2
    ldh  a, [hActiveEntityType]                   ;; 19:6B81 $F0 $EB
    cp   $AA                                      ;; 19:6B83 $FE $AA
    jr   z, .jr_6B8A                              ;; 19:6B85 $28 $03

    ld   hl, wEntitiesSpeedYTable                 ;; 19:6B87 $21 $50 $C2

.jr_6B8A
    add  hl, bc                                   ;; 19:6B8A $09
    ld   [hl], $08                                ;; 19:6B8B $36 $08

label_019_6B8D:
    ld   e, $80                                   ;; 19:6B8D $1E $80
    ldh  a, [hActiveEntityType]                   ;; 19:6B8F $F0 $EB
    cp   ENTITY_CHEEP_CHEEP_HORIZONTAL            ;; 19:6B91 $FE $AA
    jr   z, .jr_6B97                              ;; 19:6B93 $28 $02

    ld   e, $60                                   ;; 19:6B95 $1E $60

.jr_6B97
    call GetEntityTransitionCountdown             ;; 19:6B97 $CD $05 $0C
    ld   [hl], e                                  ;; 19:6B9A $73
    call IncrementEntityState                     ;; 19:6B9B $CD $12 $3B
    ld   [hl], $01                                ;; 19:6B9E $36 $01
    ret                                           ;; 19:6BA0 $C9

CheepCheepState1Handler::
    call GetEntityTransitionCountdown             ;; 19:6BA1 $CD $05 $0C
    jr   nz, .jr_6BAB                             ;; 19:6BA4 $20 $05

    ld   [hl], $28                                ;; 19:6BA6 $36 $28
    call IncrementEntityState                     ;; 19:6BA8 $CD $12 $3B

.jr_6BAB
    jp   UpdateEntityPosWithSpeed_19              ;; 19:6BAB $C3 $B8 $7D

CheepCheepState2Handler::
    call GetEntityTransitionCountdown             ;; 19:6BAE $CD $05 $0C
    jr   nz, .ret_6BC6                            ;; 19:6BB1 $20 $13

    ld   hl, wEntitiesSpeedXTable                 ;; 19:6BB3 $21 $40 $C2
    add  hl, bc                                   ;; 19:6BB6 $09
    ld   a, [hl]                                  ;; 19:6BB7 $7E
    cpl                                           ;; 19:6BB8 $2F
    inc  a                                        ;; 19:6BB9 $3C
    ld   [hl], a                                  ;; 19:6BBA $77
    ld   hl, wEntitiesSpeedYTable                 ;; 19:6BBB $21 $50 $C2
    add  hl, bc                                   ;; 19:6BBE $09
    ld   a, [hl]                                  ;; 19:6BBF $7E
    cpl                                           ;; 19:6BC0 $2F
    inc  a                                        ;; 19:6BC1 $3C
    ld   [hl], a                                  ;; 19:6BC2 $77
    jp   label_019_6B8D                           ;; 19:6BC3 $C3 $8D $6B

.ret_6BC6
    ret                                           ;; 19:6BC6 $C9

CheepCheepJumpingEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 19:6BC7 $F0 $F0
    cp   $05                                      ;; 19:6BC9 $FE $05
    jr   nz, .jr_6BD3                             ;; 19:6BCB $20 $06

    ldh  a, [hActiveEntityFlipAttribute]          ;; 19:6BCD $F0 $ED
    or   OAMF_YFLIP                               ;; 19:6BCF $F6 $40
    ldh  [hActiveEntityFlipAttribute], a          ;; 19:6BD1 $E0 $ED

.jr_6BD3
    ld   de, CheepCheepSpriteVariants             ;; 19:6BD3 $11 $44 $6B
    call RenderActiveEntitySpritesPair            ;; 19:6BD6 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:6BD9 $CD $3D $7D
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6BDC $21 $40 $C2
    add  hl, bc                                   ;; 19:6BDF $09
    ld   a, [hl]                                  ;; 19:6BE0 $7E
    rlca                                          ;; 19:6BE1 $07
    rlca                                          ;; 19:6BE2 $07
    and  $02                                      ;; 19:6BE3 $E6 $02
    ld   e, a                                     ;; 19:6BE5 $5F
    call ApplyRecoilIfNeeded_19                   ;; 19:6BE6 $CD $6E $7D
    ldh  a, [hActiveEntityState]                  ;; 19:6BE9 $F0 $F0
    cp   $05                                      ;; 19:6BEB $FE $05
    jr   z, .jr_6BFD                              ;; 19:6BED $28 $0E

    ldh  a, [hFrameCounter]                       ;; 19:6BEF $F0 $E7
    rra                                           ;; 19:6BF1 $1F
    rra                                           ;; 19:6BF2 $1F
    rra                                           ;; 19:6BF3 $1F
    and  $01                                      ;; 19:6BF4 $E6 $01
    or   e                                        ;; 19:6BF6 $B3
    call SetEntitySpriteVariant                   ;; 19:6BF7 $CD $0C $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 19:6BFA $CD $39 $3B

.jr_6BFD
    ldh  a, [hActiveEntityState]                  ;; 19:6BFD $F0 $F0
    JP_TABLE                                      ;; 19:6BFF
._00 dw CheepCheepJumpingState0Handler
._01 dw CheepCheepJumpingState1Handler
._02 dw CheepCheepJumpingState2Handler
._03 dw CheepCheepJumpingState3Handler
._04 dw CheepCheepJumpingState4Handler
._05 dw CheepCheepJumpingState5Handler

CheepCheepJumpingState0Handler::
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 19:6C0C $21 $80 $C4
    add  hl, bc                                   ;; 19:6C0F $09
    ld   [hl], $03                                ;; 19:6C10 $36 $03
    ldh  a, [hActiveEntityPosY]                   ;; 19:6C12 $F0 $EF
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6C14 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6C17 $09
    ld   [hl], a                                  ;; 19:6C18 $77
    jp   IncrementEntityState                     ;; 19:6C19 $C3 $12 $3B

CheepCheepJumpingState1Handler::
    call GetEntityTransitionCountdown             ;; 19:6C1C $CD $05 $0C
    call GetRandomByte                            ;; 19:6C1F $CD $0D $28
    and  $7F                                      ;; 19:6C22 $E6 $7F
    add  $30                                      ;; 19:6C24 $C6 $30
    ld   [hl], a                                  ;; 19:6C26 $77
    call GetRandomByte                            ;; 19:6C27 $CD $0D $28
    ld   e, $F4                                   ;; 19:6C2A $1E $F4
    and  $01                                      ;; 19:6C2C $E6 $01
    jr   z, .jr_6C32                              ;; 19:6C2E $28 $02

    ld   e, $0C                                   ;; 19:6C30 $1E $0C

.jr_6C32
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6C32 $21 $40 $C2
    add  hl, bc                                   ;; 19:6C35 $09
    ld   [hl], e                                  ;; 19:6C36 $73
    jp   IncrementEntityState                     ;; 19:6C37 $C3 $12 $3B

CheepCheepJumpingState2Handler::
    call GetEntityTransitionCountdown             ;; 19:6C3A $CD $05 $0C
    jr   nz, .jr_6C53                             ;; 19:6C3D $20 $14

    ld   hl, wEntitiesSpeedYTable                 ;; 19:6C3F $21 $50 $C2
    add  hl, bc                                   ;; 19:6C42 $09
    ld   [hl], $D4                                ;; 19:6C43 $36 $D4
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:6C45 $F0 $EC
    sub  $08                                      ;; 19:6C47 $D6 $08
    call func_019_6CD3                            ;; 19:6C49 $CD $D3 $6C
    ld   a, JINGLE_JUMP                           ;; 19:6C4C $3E $24
    ldh  [hJingle], a                             ;; 19:6C4E $E0 $F2
    jp   IncrementEntityState                     ;; 19:6C50 $C3 $12 $3B

.jr_6C53
    call GetEntityPrivateCountdown1               ;; 19:6C53 $CD $00 $0C
    jr   nz, .jr_6C68                             ;; 19:6C56 $20 $10

    call GetRandomByte                            ;; 19:6C58 $CD $0D $28
    and  $3F                                      ;; 19:6C5B $E6 $3F
    or   $10                                      ;; 19:6C5D $F6 $10
    ld   [hl], a                                  ;; 19:6C5F $77
    ld   hl, wEntitiesSpeedXTable                 ;; 19:6C60 $21 $40 $C2
    add  hl, bc                                   ;; 19:6C63 $09
    ld   a, [hl]                                  ;; 19:6C64 $7E
    cpl                                           ;; 19:6C65 $2F
    inc  a                                        ;; 19:6C66 $3C
    ld   [hl], a                                  ;; 19:6C67 $77

.jr_6C68
    call AddEntitySpeedToPos_19                   ;; 19:6C68 $CD $C5 $7D
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 19:6C6B $C3 $23 $3B

CheepCheepJumpingState3Handler::
    call GetEntityTransitionCountdown             ;; 19:6C6E $CD $05 $0C
    ret  nz                                       ;; 19:6C71 $C0

    call UpdateEntityYPosWithSpeed_19             ;; 19:6C72 $CD $BB $7D
    call func_019_6C99                            ;; 19:6C75 $CD $99 $6C
    ld   hl, wEntitiesSpeedYTable                 ;; 19:6C78 $21 $50 $C2
    add  hl, bc                                   ;; 19:6C7B $09
    inc  [hl]                                     ;; 19:6C7C $34
    ld   a, [hl]                                  ;; 19:6C7D $7E
    cp   $18                                      ;; 19:6C7E $FE $18
    ret  nz                                       ;; 19:6C80 $C0

    jp   IncrementEntityState                     ;; 19:6C81 $C3 $12 $3B

CheepCheepJumpingState4Handler::
    ld   hl, wEntitiesPrivateState1Table          ;; 19:6C84 $21 $B0 $C2
    add  hl, bc                                   ;; 19:6C87 $09
    ld   a, [hl]                                  ;; 19:6C88 $7E
    ld   hl, wEntitiesPosYTable                   ;; 19:6C89 $21 $10 $C2
    add  hl, bc                                   ;; 19:6C8C $09
    cp   [hl]                                     ;; 19:6C8D $BE
    jr   nc, .jr_6C96                             ;; 19:6C8E $30 $06

    call IncrementEntityState                     ;; 19:6C90 $CD $12 $3B
    ld   [hl], $01                                ;; 19:6C93 $36 $01
    ret                                           ;; 19:6C95 $C9

.jr_6C96
    call UpdateEntityYPosWithSpeed_19             ;; 19:6C96 $CD $BB $7D

func_019_6C99::
    ld   hl, wEntitiesOptions1Table               ;; 19:6C99 $21 $30 $C4
    add  hl, bc                                   ;; 19:6C9C $09
    set  ENTITY_OPT1_B_NO_WALL_COLLISION, [hl]    ;; 19:6C9D $CB $C6
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:6C9F $CD $23 $3B
    ld   hl, wEntitiesOptions1Table               ;; 19:6CA2 $21 $30 $C4
    add  hl, bc                                   ;; 19:6CA5 $09
    res  ENTITY_OPT1_B_NO_WALL_COLLISION, [hl]    ;; 19:6CA6 $CB $86
    ret                                           ;; 19:6CA8 $C9

CheepCheepJumpingState5Handler::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:6CA9 $21 $40 $C3
    add  hl, bc                                   ;; 19:6CAC $09
    set  ENTITY_PHYSICS_B_HARMLESS, [hl]          ;; 19:6CAD $CB $FE
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 19:6CAF $CB $F6
    ld   hl, wEntitiesSpeedYTable                 ;; 19:6CB1 $21 $50 $C2
    add  hl, bc                                   ;; 19:6CB4 $09
    inc  [hl]                                     ;; 19:6CB5 $34
    push hl                                       ;; 19:6CB6 $E5
    ld   hl, wEntitiesGroundStatusTable           ;; 19:6CB7 $21 $70 $C4
    add  hl, bc                                   ;; 19:6CBA $09
    ld   a, [hl]                                  ;; 19:6CBB $7E
    pop  hl                                       ;; 19:6CBC $E1
    and  a                                        ;; 19:6CBD $A7
    jr   z, .jr_6CC2                              ;; 19:6CBE $28 $02

    ld   [hl], $06                                ;; 19:6CC0 $36 $06

.jr_6CC2
    call UpdateEntityYPosWithSpeed_19             ;; 19:6CC2 $CD $BB $7D
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:6CC5 $F0 $EC
    cp   $70                                      ;; 19:6CC7 $FE $70
    jr   c, func_019_6C99                         ;; 19:6CC9 $38 $CE

    cp   $88                                      ;; 19:6CCB $FE $88
    jp   nc, ClearEntityStatus_19                 ;; 19:6CCD $D2 $61 $7E

    ret                                           ;; 19:6CD0 $C9

    ldh  a, [hActiveEntityVisualPosY]             ;; 19:6CD1 $F0 $EC

func_019_6CD3::
    ldh  [hMultiPurpose1], a                      ;; 19:6CD3 $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ;; 19:6CD5 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 19:6CD7 $E0 $D7
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 19:6CD9 $3E $01
    call AddTranscientVfx                         ;; 19:6CDB $CD $C7 $0C
    ld   a, JINGLE_WATER_SPLASH                   ;; 19:6CDE $3E $0E
    ldh  [hJingle], a                             ;; 19:6CE0 $E0 $F2
    ret                                           ;; 19:6CE2 $C9
