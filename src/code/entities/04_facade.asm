EntityInitFacade::
    call GetEntityTransitionCountdown             ;; 04:504B $CD $05 $0C
    ld   [hl], $FF                                ;; 04:504E $36 $FF
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:5050 $21 $10 $C4
    add  hl, bc                                   ;; 04:5053 $09
    ld   [hl], $08                                ;; 04:5054 $36 $08
    ld   hl, wEntitiesHealthTable                 ;; 04:5056 $21 $60 $C3
    add  hl, bc                                   ;; 04:5059 $09
    ld   [hl], $12                                ;; 04:505A $36 $12
    ld   hl, wEntitiesPosXTable                   ;; 04:505C $21 $00 $C2
    add  hl, bc                                   ;; 04:505F $09
    call func_004_5067                            ;; 04:5060 $CD $67 $50
    ld   hl, wEntitiesPosYTable                   ;; 04:5063 $21 $10 $C2
    add  hl, bc                                   ;; 04:5066 $09

func_004_5067::
    ld   a, [hl]                                  ;; 04:5067 $7E

func_004_5068::
    add  $08                                      ;; 04:5068 $C6 $08
    ld   [hl], a                                  ;; 04:506A $77
    ld   a, $FF                                   ;; 04:506B $3E $FF
    jp   SetEntitySpriteVariant                   ;; 04:506D $C3 $0C $3B

FacadeEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 04:5070 $21 $B0 $C2
    add  hl, bc                                   ;; 04:5073 $09
    ld   a, [hl]                                  ;; 04:5074 $7E
    JP_TABLE                                      ;; 04:5075
._00 dw FacadeMainBossHandler                     ;; 04:5076
._01 dw FacadePitHandler                          ;; 04:5078
._02 dw FacadeFlyingTileHandler                   ;; 04:507A
._03 dw FacadeFlyingPotHandler                    ;; 04:507C

FacadeMainBossHandler::
    xor  a                                        ;; 04:507E $AF
    ld   [wScreenShakeHorizontal], a              ;; 04:507F $EA $55 $C1
    call BossIntro                                ;; 04:5082 $CD $E8 $3E
    call label_394D                               ;; 04:5085 $CD $4D $39
    call FacadeRenderFace                         ;; 04:5088 $CD $2F $54
    ldh  a, [hActiveEntityStatus]                 ;; 04:508B $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 04:508D $FE $05
    jp   z, FacadeMainBossNotDead                 ;; 04:508F $CA $0F $51

    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5092 $21 $20 $C4
    add  hl, bc                                   ;; 04:5095 $09
    ldh  a, [hFrameCounter]                       ;; 04:5096 $F0 $E7
    ld   [hl], a                                  ;; 04:5098 $77
    ld   hl, wEntitiesPrivateState4Table          ;; 04:5099 $21 $40 $C4
    add  hl, bc                                   ;; 04:509C $09
    ld   a, [hl]                                  ;; 04:509D $7E
    JP_TABLE                                      ;; 04:509E
._00 dw FacadeDeathState0                         ;; 04:509F
._01 dw FacadeDeathState1                         ;; 04:50A1
._02 dw FacadeDeathState2                         ;; 04:50A3

FacadeDeathState0::
    call GetEntityTransitionCountdown             ;; 04:50A5 $CD $05 $0C
    ld   [hl], $80                                ;; 04:50A8 $36 $80
    ld   e, $0F                                   ;; 04:50AA $1E $0F
    ld   d, b                                     ;; 04:50AC $50

.jr_50AD
    ld   a, c                                     ;; 04:50AD $79
    cp   e                                        ;; 04:50AE $BB
    jr   z, .jr_50D5                              ;; 04:50AF $28 $24

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:50B1 $21 $40 $C3
    add  hl, de                                   ;; 04:50B4 $19
    ld   a, [hl]                                  ;; 04:50B5 $7E
    and  $80                                      ;; 04:50B6 $E6 $80
    jr   nz, .jr_50D5                             ;; 04:50B8 $20 $1B

    ld   hl, wEntitiesStatusTable                 ;; 04:50BA $21 $80 $C2
    add  hl, de                                   ;; 04:50BD $19
    ld   a, [hl]                                  ;; 04:50BE $7E
    cp   $05                                      ;; 04:50BF $FE $05
    jr   c, .jr_50D5                              ;; 04:50C1 $38 $12

    ld   [hl], $01                                ;; 04:50C3 $36 $01
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 04:50C5 $21 $80 $C4
    add  hl, de                                   ;; 04:50C8 $19
    ld   [hl], $1F                                ;; 04:50C9 $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:50CB $21 $40 $C3
    add  hl, de                                   ;; 04:50CE $19
    ld   a, [hl]                                  ;; 04:50CF $7E
    and  ENTITY_PHYSICS_MASK                      ;; 04:50D0 $E6 $F0
    ; Set the entity's sprite count to 2
    or   2                                        ;; 04:50D2 $F6 $02
    ld   [hl], a                                  ;; 04:50D4 $77

.jr_50D5
    dec  e                                        ;; 04:50D5 $1D
    ld   a, e                                     ;; 04:50D6 $7B
    cp   $FF                                      ;; 04:50D7 $FE $FF
    jr   nz, .jr_50AD                             ;; 04:50D9 $20 $D2

jr_004_50DB:
    ld   hl, wEntitiesPrivateState4Table          ;; 04:50DB $21 $40 $C4
    add  hl, bc                                   ;; 04:50DE $09
    inc  [hl]                                     ;; 04:50DF $34
    ret                                           ;; 04:50E0 $C9

FacadeDeathState1::
    call GetEntityTransitionCountdown             ;; 04:50E1 $CD $05 $0C
    ret  nz                                       ;; 04:50E4 $C0

    ld   [hl], $FF                                ;; 04:50E5 $36 $FF
    jr   jr_004_50DB                              ;; 04:50E7 $18 $F2

FacadeDeathState2::
    call GetEntityTransitionCountdown             ;; 04:50E9 $CD $05 $0C
    jp   z, DropHeartContainer_04                 ;; 04:50EC $CA $51 $57

BossDeathRandomExplosion: ; Also called from genie and slime eye
    and  $07                                      ;; 04:50EF $E6 $07
    ret  nz                                       ;; 04:50F1 $C0

    call GetRandomByte                            ;; 04:50F2 $CD $0D $28
    and  $1F                                      ;; 04:50F5 $E6 $1F
    sub  $10                                      ;; 04:50F7 $D6 $10
    ld   e, a                                     ;; 04:50F9 $5F
    ld   hl, hActiveEntityPosX                    ;; 04:50FA $21 $EE $FF
    add  [hl]                                     ;; 04:50FD $86
    ld   [hl], a                                  ;; 04:50FE $77
    call GetRandomByte                            ;; 04:50FF $CD $0D $28
    and  $1F                                      ;; 04:5102 $E6 $1F
    sub  $10                                      ;; 04:5104 $D6 $10
    ld   e, a                                     ;; 04:5106 $5F
    ld   hl, hActiveEntityVisualPosY              ;; 04:5107 $21 $EC $FF
    add  [hl]                                     ;; 04:510A $86
    ld   [hl], a                                  ;; 04:510B $77
    jp   CreatePoofVfx                            ;; 04:510C $C3 $05 $5A

FacadeMainBossNotDead:
    call ReturnIfNonInteractive_04                ;; 04:510F $CD $A3 $7F
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5112 $21 $20 $C4
    add  hl, bc                                   ;; 04:5115 $09
    ld   a, [hl]                                  ;; 04:5116 $7E
    and  a                                        ;; 04:5117 $A7
    jr   z, .notFlashing                          ;; 04:5118 $28 $06

    ld   hl, wEntitiesPrivateState5Table          ;; 04:511A $21 $90 $C3
    add  hl, bc                                   ;; 04:511D $09
    ld   [hl], $FF                                ;; 04:511E $36 $FF

.notFlashing
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:5120 $21 $40 $C3
    add  hl, bc                                   ;; 04:5123 $09
    ld   [hl], 8                                  ;; 04:5124 $36 $08

    ldh  a, [hActiveEntityState]                  ;; 04:5126 $F0 $F0
    JP_TABLE                                      ;; 04:5128
._00 dw FacadeMainBossState0                      ;; 04:5129
._01 dw FacadeMainBossState1                      ;; 04:512B
._02 dw FacadeMainBossState2                      ;; 04:512D

; First state of facade is just a delay where he is hidden.
FacadeMainBossState0::
    call GetEntityTransitionCountdown             ;; 04:512F $CD $05 $0C
    ret  nz                                       ;; 04:5132 $C0

    ld   [hl], $FF                                ;; 04:5133 $36 $FF
    jp   IncrementEntityState                     ;; 04:5135 $C3 $12 $3B

Data_004_5138::
    db   $03, $03, $03, $03, $03, $02, $01, $00, $01, $00, $01, $01, $01, $01, $01, $01
    db   $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00

; Second spawning state, showing up and opening eyes, ends with the dialog.
FacadeMainBossState1::
    call GetEntityTransitionCountdown             ;; 04:5158 $CD $05 $0C
    jr   z, .countdownReachedZero                 ;; 04:515B $28 $0F

    rra                                           ;; 04:515D $1F
    rra                                           ;; 04:515E $1F
    rra                                           ;; 04:515F $1F
    and  $1F                                      ;; 04:5160 $E6 $1F
    ld   e, a                                     ;; 04:5162 $5F
    ld   d, b                                     ;; 04:5163 $50
    ld   hl, Data_004_5138                        ;; 04:5164 $21 $38 $51
    add  hl, de                                   ;; 04:5167 $19
    ld   a, [hl]                                  ;; 04:5168 $7E
    jp   SetEntitySpriteVariant                   ;; 04:5169 $C3 $0C $3B

.countdownReachedZero
    call IncrementEntityState                     ;; 04:516C $CD $12 $3B
    call GetEntityPrivateCountdown1               ;; 04:516F $CD $00 $0C
    ld   [hl], $A0                                ;; 04:5172 $36 $A0
    call GetEntitySlowTransitionCountdown         ;; 04:5174 $CD $FB $0B
    ld   [hl], $FF                                ;; 04:5177 $36 $FF
    jp_open_dialog Dialog0B6                      ;; 04:5179

Data_004_517E::
    db   $03, $02, $04, $02

Data_004_5182::
    db   $28, $38, $48, $58, $68, $78, $28, $78, $28, $78, $28, $38, $48, $58, $68, $78

Data_004_5192::
    db   $30, $30, $30, $30, $30, $30, $40, $40, $50, $50, $60, $60, $60, $60, $60, $60

Data_004_51A2::
    db   $28, $38, $48, $58, $68, $78, $18, $88, $18, $88, $18, $88, $18, $88, $28, $38
    db   $48, $58, $68, $78

Data_004_51B6::
    db   $20, $20, $20, $20, $20, $20, $30, $30, $40, $40, $50, $50, $60, $60, $70, $70
    db   $70, $70, $70, $70

Data_004_51CA::
    db   $00, $13, $01, $12, $02, $11, $03, $10, $04, $0F, $05, $0E, $06, $0D, $07, $0C
    db   $08, $0B, $09, $0A

Data_004_51DE::
    db   $18, $88, $18, $88

Data_004_51E2::
    db   $20, $70, $70, $20

Data_004_51E6::
    db   $00, $FF

; Facade-entity related code
FacadeMainBossState2::
    ldh  a, [hFrameCounter]                       ;; 04:51E8 $F0 $E7

.jr_51EA
    and  $3F                                      ;; 04:51EA $E6 $3F
    jr   nz, jr_004_51FA                          ;; 04:51EC $20 $0C

.jr_51EE
    call GetRandomByte                            ;; 04:51EE $CD $0D $28
    and  $01                                      ;; 04:51F1 $E6 $01
    jr   nz, jr_004_51FA                          ;; 04:51F3 $20 $05

    call GetEntityTransitionCountdown             ;; 04:51F5 $CD $05 $0C
    ld   [hl], $1F                                ;; 04:51F8 $36 $1F

jr_004_51FA:
    ldh  a, [hFrameCounter]                       ;; 04:51FA $F0 $E7
    rra                                           ;; 04:51FC $1F
    rra                                           ;; 04:51FD $1F
    rra                                           ;; 04:51FE $1F
    and  $01                                      ;; 04:51FF $E6 $01
    ld   e, a                                     ;; 04:5201 $5F

.jr_5202
    ld   d, b                                     ;; 04:5202 $50
    ld   hl, Data_004_51E6                        ;; 04:5203 $21 $E6 $51
    add  hl, de                                   ;; 04:5206 $19
    ld   a, [hl]                                  ;; 04:5207 $7E
    ld   [wScreenShakeHorizontal], a              ;; 04:5208 $EA $55 $C1
    call GetEntitySlowTransitionCountdown         ;; 04:520B $CD $FB $0B
    jr   nz, jr_004_5273                          ;; 04:520E $20 $63

    call GetRandomByte                            ;; 04:5210 $CD $0D $28
    and  $0F                                      ;; 04:5213 $E6 $0F
    add  $18                                      ;; 04:5215 $C6 $18
    ld   [hl], a                                  ;; 04:5217 $77
    ld   hl, wEntitiesInertiaTable                ;; 04:5218 $21 $D0 $C3
    add  hl, bc                                   ;; 04:521B $09
    ld   a, [hl]                                  ;; 04:521C $7E
    cp   $14                                      ;; 04:521D $FE $14
    jr   c, jr_004_5273                           ;; 04:521F $38 $52

    ld   hl, wEntitiesPrivateState3Table          ;; 04:5221 $21 $D0 $C2
    add  hl, bc                                   ;; 04:5224 $09
    ld   a, [hl]                                  ;; 04:5225 $7E
    cp   $04                                      ;; 04:5226 $FE $04
    jr   c, jr_004_5273                           ;; 04:5228 $38 $49

    ld   a, ENTITY_FACADE                         ;; 04:522A $3E $5A
    call SpawnNewEntity_trampoline                ;; 04:522C $CD $86 $3B
    jr   c, jr_004_5273                           ;; 04:522F $38 $42

    ld   hl, wEntitiesPrivateState1Table          ;; 04:5231 $21 $B0 $C2
    add  hl, de                                   ;; 04:5234 $19
    ld   [hl], $01                                ;; 04:5235 $36 $01

.loop_5237
    call GetRandomByte                            ;; 04:5237 $CD $0D $28
    and  $0F                                      ;; 04:523A $E6 $0F
    ld   hl, wEntitiesPrivateState2Table          ;; 04:523C $21 $C0 $C2
    add  hl, bc                                   ;; 04:523F $09
    cp   [hl]                                     ;; 04:5240 $BE
    jr   z, .loop_5237                            ;; 04:5241 $28 $F4

    ld   [hl], a                                  ;; 04:5243 $77
    push bc                                       ;; 04:5244 $C5
    ld   c, a                                     ;; 04:5245 $4F
    ld   hl, Data_004_5182                        ;; 04:5246 $21 $82 $51
    add  hl, bc                                   ;; 04:5249 $09
    ld   a, [hl]                                  ;; 04:524A $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:524B $21 $00 $C2
    add  hl, de                                   ;; 04:524E $19
    ld   [hl], a                                  ;; 04:524F $77
    ld   hl, Data_004_5192                        ;; 04:5250 $21 $92 $51
    add  hl, bc                                   ;; 04:5253 $09

    ld   a, [hl]                                  ;; 04:5254 $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:5255 $21 $10 $C2
    add  hl, de                                   ;; 04:5258 $19
    ld   [hl], a                                  ;; 04:5259 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 04:525A $21 $E0 $C2
    add  hl, de                                   ;; 04:525D $19
    ld   [hl], $7F                                ;; 04:525E $36 $7F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:5260 $21 $40 $C3
    add  hl, de                                   ;; 04:5263 $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 04:5264 $36 $C2
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:5266 $21 $50 $C3
    add  hl, de                                   ;; 04:5269 $19
    ld   [hl], $00                                ;; 04:526A $36 $00
    ld   hl, wEntitiesOptions1Table               ;; 04:526C $21 $30 $C4
    add  hl, de                                   ;; 04:526F $19
    ld   [hl], ENTITY_OPT1_NONE                   ;; 04:5270 $36 $00
    pop  bc                                       ;; 04:5272 $C1

jr_004_5273:
    call GetEntityPrivateCountdown1               ;; 04:5273 $CD $00 $0C
    jr   nz, .jr_52C9                             ;; 04:5276 $20 $51

    ld   [hl], $40                                ;; 04:5278 $36 $40
    ld   hl, wEntitiesInertiaTable                ;; 04:527A $21 $D0 $C3
    add  hl, bc                                   ;; 04:527D $09
    ld   a, [hl]                                  ;; 04:527E $7E
    cp   $14                                      ;; 04:527F $FE $14
    jr   nc, .jr_52C9                             ;; 04:5281 $30 $46

    ld   a, ENTITY_FACADE                         ;; 04:5283 $3E $5A
    call SpawnNewEntity_trampoline                ;; 04:5285 $CD $86 $3B
    jr   c, .jr_52C9                              ;; 04:5288 $38 $3F

    ld   hl, wEntitiesPrivateState1Table          ;; 04:528A $21 $B0 $C2
    add  hl, de                                   ;; 04:528D $19
    ld   [hl], $02                                ;; 04:528E $36 $02
    push bc                                       ;; 04:5290 $C5
    ld   hl, wEntitiesInertiaTable                ;; 04:5291 $21 $D0 $C3
    add  hl, bc                                   ;; 04:5294 $09
    ld   c, [hl]                                  ;; 04:5295 $4E
    inc  [hl]                                     ;; 04:5296 $34
    ld   hl, Data_004_51CA                        ;; 04:5297 $21 $CA $51
    add  hl, bc                                   ;; 04:529A $09
    ld   c, [hl]                                  ;; 04:529B $4E
    ld   hl, Data_004_51A2                        ;; 04:529C $21 $A2 $51
    add  hl, bc                                   ;; 04:529F $09
    ld   a, [hl]                                  ;; 04:52A0 $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:52A1 $21 $00 $C2
    add  hl, de                                   ;; 04:52A4 $19
    ld   [hl], a                                  ;; 04:52A5 $77
    ld   hl, Data_004_51B6                        ;; 04:52A6 $21 $B6 $51
    add  hl, bc                                   ;; 04:52A9 $09
    ld   a, [hl]                                  ;; 04:52AA $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:52AB $21 $10 $C2
    add  hl, de                                   ;; 04:52AE $19
    ld   [hl], a                                  ;; 04:52AF $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:52B0 $21 $40 $C3
    add  hl, de                                   ;; 04:52B3 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 04:52B4 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:52B6 $21 $50 $C3
    add  hl, de                                   ;; 04:52B9 $19
    ld   [hl], $00                                ;; 04:52BA $36 $00
    ld   hl, wEntitiesOptions1Table               ;; 04:52BC $21 $30 $C4
    add  hl, de                                   ;; 04:52BF $19
    ld   [hl], ENTITY_OPT1_NONE                   ;; 04:52C0 $36 $00
    ld   hl, wEntitiesHealthGroup                 ;; 04:52C2 $21 $D0 $C4
    add  hl, de                                   ;; 04:52C5 $19
    ld   [hl], $02                                ;; 04:52C6 $36 $02
    pop  bc                                       ;; 04:52C8 $C1

.jr_52C9
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:52C9 $21 $00 $C3
    add  hl, bc                                   ;; 04:52CC $09
    ld   a, [hl]                                  ;; 04:52CD $7E
    and  a                                        ;; 04:52CE $A7
    jr   nz, jr_004_5340                          ;; 04:52CF $20 $6F

    ld   [hl], $40                                ;; 04:52D1 $36 $40
    ld   hl, wEntitiesPrivateState3Table          ;; 04:52D3 $21 $D0 $C2
    add  hl, bc                                   ;; 04:52D6 $09
    ld   a, [hl]                                  ;; 04:52D7 $7E
    cp   $04                                      ;; 04:52D8 $FE $04
    jr   nc, jr_004_5340                          ;; 04:52DA $30 $64

    ld   hl, wEntitiesInertiaTable                ;; 04:52DC $21 $D0 $C3
    add  hl, bc                                   ;; 04:52DF $09
    ld   a, [hl]                                  ;; 04:52E0 $7E
    cp   $12                                      ;; 04:52E1 $FE $12
    jr   c, jr_004_5340                           ;; 04:52E3 $38 $5B

    ld   a, ENTITY_FACADE                         ;; 04:52E5 $3E $5A
    call SpawnNewEntity_trampoline                ;; 04:52E7 $CD $86 $3B
    jr   c, jr_004_5340                           ;; 04:52EA $38 $54

    ld   hl, wEntitiesPrivateState1Table          ;; 04:52EC $21 $B0 $C2
    add  hl, de                                   ;; 04:52EF $19
    ld   [hl], $03                                ;; 04:52F0 $36 $03
    push bc                                       ;; 04:52F2 $C5
    ld   hl, wEntitiesPrivateState3Table          ;; 04:52F3 $21 $D0 $C2
    add  hl, bc                                   ;; 04:52F6 $09
    ld   c, [hl]                                  ;; 04:52F7 $4E
    inc  [hl]                                     ;; 04:52F8 $34
    ld   hl, Data_004_51DE                        ;; 04:52F9 $21 $DE $51
    add  hl, bc                                   ;; 04:52FC $09
    ld   a, [hl]                                  ;; 04:52FD $7E
    ld   hl, wEntitiesPosXTable                   ;; 04:52FE $21 $00 $C2
    add  hl, de                                   ;; 04:5301 $19
    ld   [hl], a                                  ;; 04:5302 $77
    ldh  [hActiveEntityPosX], a                   ;; 04:5303 $E0 $EE
    ld   hl, Data_004_51E2                        ;; 04:5305 $21 $E2 $51
    add  hl, bc                                   ;; 04:5308 $09
    ld   a, [hl]                                  ;; 04:5309 $7E
    ld   hl, wEntitiesPosYTable                   ;; 04:530A $21 $10 $C2
    add  hl, de                                   ;; 04:530D $19
    ld   [hl], a                                  ;; 04:530E $77
    ldh  [hActiveEntityPosY], a                   ;; 04:530F $E0 $EF
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:5311 $21 $40 $C3
    add  hl, de                                   ;; 04:5314 $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 04:5315 $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ;; 04:5317 $21 $50 $C3
    add  hl, de                                   ;; 04:531A $19
    ld   [hl], $00                                ;; 04:531B $36 $00
    ld   hl, wEntitiesOptions1Table               ;; 04:531D $21 $30 $C4
    add  hl, de                                   ;; 04:5320 $19
    ld   [hl], ENTITY_OPT1_NONE                   ;; 04:5321 $36 $00
    ld   hl, wEntitiesHealthGroup                 ;; 04:5323 $21 $D0 $C4
    add  hl, de                                   ;; 04:5326 $19
    ld   [hl], $1B                                ;; 04:5327 $36 $1B
    ld   c, e                                     ;; 04:5329 $4B
    ld   b, d                                     ;; 04:532A $42
    ld   hl, wEntitiesSpeedXTable                 ;; 04:532B $21 $40 $C2
    add  hl, bc                                   ;; 04:532E $09
    ld   [hl], $01                                ;; 04:532F $36 $01
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:5331 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:5334 $21 $A0 $C2
    add  hl, bc                                   ;; 04:5337 $09
    ld   a, [hl]                                  ;; 04:5338 $7E
    and  a                                        ;; 04:5339 $A7
    jr   nz, .jr_533F                             ;; 04:533A $20 $03

    call ClearEntityStatusBank04                  ;; 04:533C $CD $7A $6D

.jr_533F
    pop  bc                                       ;; 04:533F $C1

jr_004_5340:
    call GetEntityTransitionCountdown             ;; 04:5340 $CD $05 $0C
    rra                                           ;; 04:5343 $1F
    rra                                           ;; 04:5344 $1F
    rra                                           ;; 04:5345 $1F
    and  $03                                      ;; 04:5346 $E6 $03
    ld   e, a                                     ;; 04:5348 $5F
    ld   d, b                                     ;; 04:5349 $50
    ld   hl, Data_004_517E                        ;; 04:534A $21 $7E $51
    add  hl, de                                   ;; 04:534D $19
    ld   a, [hl]                                  ;; 04:534E $7E
    call SetEntitySpriteVariant                   ;; 04:534F $CD $0C $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5352 $21 $20 $C4
    add  hl, bc                                   ;; 04:5355 $09
    ld   a, [hl]                                  ;; 04:5356 $7E
    and  a                                        ;; 04:5357 $A7
    jr   z, .jr_535F                              ;; 04:5358 $28 $05

    ld   a, $02                                   ;; 04:535A $3E $02
    call SetEntitySpriteVariant                   ;; 04:535C $CD $0C $3B

.jr_535F
    ld   hl, wEntitiesPrivateState5Table          ;; 04:535F $21 $90 $C3
    add  hl, bc                                   ;; 04:5362 $09
    ld   a, [hl]                                  ;; 04:5363 $7E
    and  a                                        ;; 04:5364 $A7
    jr   z, .ret_537E                             ;; 04:5365 $28 $17

    dec  [hl]                                     ;; 04:5367 $35
    rra                                           ;; 04:5368 $1F
    rra                                           ;; 04:5369 $1F
    rra                                           ;; 04:536A $1F
    rra                                           ;; 04:536B $1F
    and  $0F                                      ;; 04:536C $E6 $0F
    ld   e, a                                     ;; 04:536E $5F
    ld   d, b                                     ;; 04:536F $50
    ld   hl, Data_004_537F                        ;; 04:5370 $21 $7F $53
    add  hl, de                                   ;; 04:5373 $19
    ld   a, [hl]                                  ;; 04:5374 $7E
    call SetEntitySpriteVariant                   ;; 04:5375 $CD $0C $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 04:5378 $21 $40 $C3
    add  hl, bc                                   ;; 04:537B $09
    ld   [hl], 8 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 04:537C $36 $48

.ret_537E
    ret                                           ;; 04:537E $C9

Data_004_537F::
    db   $02, $01, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $01, $02

Data_004_538F::
    db   $F8, $F0, $70, $03, $F8, $F8, $72, $03, $F8, $10, $72, $23, $F8, $18, $70, $23
    db   $08, $F8, $7C, $03, $08, $00, $7E, $03, $08, $08, $7E, $23, $08, $10, $7C, $23
    db   $F8, $F0, $74, $03, $F8, $F8, $76, $03, $F8, $10, $76, $23, $F8, $18, $74, $23
    db   $08, $F8, $7C, $03, $08, $00, $7E, $03, $08, $08, $7E, $23, $08, $10, $7C, $23
    db   $F8, $F0, $74, $03, $F8, $F8, $76, $03, $F8, $10, $76, $23, $F8, $18, $74, $23
    db   $08, $F8, $60, $03, $08, $00, $62, $03, $08, $08, $62, $23, $08, $10, $60, $23
    db   $F8, $F0, $78, $03, $F8, $F8, $7A, $03, $F8, $10, $7A, $23, $F8, $18, $78, $23
    db   $08, $F8, $60, $03, $08, $00, $62, $03, $08, $08, $62, $23, $08, $10, $60, $23
    db   $F8, $F0, $70, $03, $F8, $F8, $72, $03, $F8, $10, $72, $23, $F8, $18, $70, $23
    db   $08, $F8, $60, $03, $08, $00, $62, $03, $08, $08, $62, $23, $08, $10, $60, $23

FacadeRenderFace::
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:542F $21 $B0 $C3
    add  hl, bc                                   ;; 04:5432 $09
    ld   a, [hl]                                  ;; 04:5433 $7E
    rla                                           ;; 04:5434 $17
    rla                                           ;; 04:5435 $17
    rla                                           ;; 04:5436 $17
    rla                                           ;; 04:5437 $17
    rla                                           ;; 04:5438 $17
    and  $E0                                      ;; 04:5439 $E6 $E0
    ld   e, a                                     ;; 04:543B $5F
    ld   d, b                                     ;; 04:543C $50
    ld   hl, Data_004_538F                        ;; 04:543D $21 $8F $53
    add  hl, de                                   ;; 04:5440 $19
    ld   c, $08                                   ;; 04:5441 $0E $08
    jp   RenderActiveEntitySpritesRect            ;; 04:5443 $C3 $E6 $3C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FacadePitSpriteVariants::
.variant0
    db $68, OAM_GBC_PAL_6 | OAMF_PAL0
    db $68, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6A, OAM_GBC_PAL_6 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $6C, OAM_GBC_PAL_6 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $6E, OAM_GBC_PAL_6 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP

Data_004_5456::
    db   $00, $01, $02, $03, $03, $03, $03, $03, $03, $02, $01, $00, $00, $00, $00, $00

; The pit that randomly spawns after all flying tiles are done.
FacadePitHandler:
    ld   de, FacadePitSpriteVariants              ;; 04:5466 $11 $46 $54
    call RenderActiveEntitySpritesPair            ;; 04:5469 $CD $C0 $3B
    call ReturnIfNonInteractive_04                ;; 04:546C $CD $A3 $7F
    call GetEntityTransitionCountdown             ;; 04:546F $CD $05 $0C
    jp   z, ClearEntityStatusBank04               ;; 04:5472 $CA $7A $6D

    cp   $50                                      ;; 04:5475 $FE $50
    jr   nz, .jr_547E                             ;; 04:5477 $20 $05

    ld   hl, hJingle                              ;; 04:5479 $21 $F2 $FF
    ld   [hl], JINGLE_FACADE_HOLE                 ;; 04:547C $36 $40

.jr_547E
    rra                                           ;; 04:547E $1F
    rra                                           ;; 04:547F $1F
    rra                                           ;; 04:5480 $1F
    and  $0F                                      ;; 04:5481 $E6 $0F
    ld   e, a                                     ;; 04:5483 $5F
    ld   d, b                                     ;; 04:5484 $50
    ld   hl, Data_004_5456                        ;; 04:5485 $21 $56 $54
    add  hl, de                                   ;; 04:5488 $19
    ld   a, [hl]                                  ;; 04:5489 $7E
    call SetEntitySpriteVariant                   ;; 04:548A $CD $0C $3B
    cp   $03                                      ;; 04:548D $FE $03
    jr   nz, .ret_54F0                            ;; 04:548F $20 $5F

    ld   a, [wLinkMotionState]                    ;; 04:5491 $FA $1C $C1
    cp   LINK_MOTION_FALLING_DOWN                 ;; 04:5494 $FE $06
    jr   z, .ret_54F0                             ;; 04:5496 $28 $58

    ldh  a, [hLinkPositionZ]                      ;; 04:5498 $F0 $A2
    and  a                                        ;; 04:549A $A7
    jr   nz, .ret_54F0                            ;; 04:549B $20 $53

    call GetEntityXDistanceToLink_04              ;; 04:549D $CD $35 $6E
    add  $08                                      ;; 04:54A0 $C6 $08
    cp   $10                                      ;; 04:54A2 $FE $10
    jr   nc, .ret_54F0                            ;; 04:54A4 $30 $4A

    call GetEntityYDistanceToLink_04              ;; 04:54A6 $CD $45 $6E
    add  $08                                      ;; 04:54A9 $C6 $08
    cp   $10                                      ;; 04:54AB $FE $10
    jr   nc, .ret_54F0                            ;; 04:54AD $30 $41

    ld   a, $0C                                   ;; 04:54AF $3E $0C
    call GetVectorTowardsLink_trampoline          ;; 04:54B1 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 04:54B4 $F0 $D7
    cpl                                           ;; 04:54B6 $2F
    inc  a                                        ;; 04:54B7 $3C
    ldh  [hLinkSpeedY], a                         ;; 04:54B8 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 04:54BA $F0 $D8
    cpl                                           ;; 04:54BC $2F
    inc  a                                        ;; 04:54BD $3C
    ldh  [hLinkSpeedX], a                         ;; 04:54BE $E0 $9A
    push bc                                       ;; 04:54C0 $C5
    call UpdateFinalLinkPosition                  ;; 04:54C1 $CD $A8 $21
    pop  bc                                       ;; 04:54C4 $C1
    call GetEntityXDistanceToLink_04              ;; 04:54C5 $CD $35 $6E
    add  $03                                      ;; 04:54C8 $C6 $03
    cp   $06                                      ;; 04:54CA $FE $06
    jr   nc, .ret_54F0                            ;; 04:54CC $30 $22

    call GetEntityYDistanceToLink_04              ;; 04:54CE $CD $45 $6E
    add  $03                                      ;; 04:54D1 $C6 $03
    cp   $06                                      ;; 04:54D3 $FE $06
    jr   nc, .ret_54F0                            ;; 04:54D5 $30 $19

    ldh  a, [hActiveEntityPosX]                   ;; 04:54D7 $F0 $EE
    ldh  [hLinkPositionX], a                      ;; 04:54D9 $E0 $98
    ld   a, LINK_MOTION_FALLING_DOWN              ;; 04:54DB $3E $06
    ld   [wLinkMotionState], a                    ;; 04:54DD $EA $1C $C1
    call ResetSpinAttack                          ;; 04:54E0 $CD $AF $0C
    ld   [wLinkAnimationFrame], a                 ;; 04:54E3 $EA $98 $C1
    call GetEntityTransitionCountdown             ;; 04:54E6 $CD $05 $0C
    ld   [hl], $40                                ;; 04:54E9 $36 $40
    ld   a, OBJ_PHYSICS_PIT                       ;; 04:54EB $3E $50
    ld   [wLinkFallingDownObjectPhysics], a       ;; 04:54ED $EA $CB $DB

.ret_54F0
    ret                                           ;; 04:54F0 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FacadeFlyingTileSpriteVariants0::
.variant0
    db $40, OAM_GBC_PAL_6 | OAMF_PAL0
    db $40, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $42, OAM_GBC_PAL_6 | OAMF_PAL0
    db $42, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FacadeFlyingTileSpriteVariants1::
.variant0
    db $70, OAM_GBC_PAL_6 | OAMF_PAL0
    db $70, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_6 | OAMF_PAL0
    db $72, OAM_GBC_PAL_6 | OAMF_PAL0 | OAMF_XFLIP

FacadeFlyingTileSpriteVariants2::
    db   $40, $07, $40, $27, $42, $07, $42, $27

FacadeFlyingTileHandler:
    ld   de, FacadeFlyingTileSpriteVariants2      ;; 04:5509 $11 $01 $55
    ldh  a, [hMapId]                              ;; 04:550C $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; @TODO ??? Is this right?
    jr   z, .jr_551C                              ;; 04:5510 $28 $0A

    ld   de, FacadeFlyingTileSpriteVariants0      ;; 04:5512 $11 $F1 $54
    cp   $01                                      ;; 04:5515 $FE $01
    jr   nz, .jr_551C                             ;; 04:5517 $20 $03

    ld   de, FacadeFlyingTileSpriteVariants1      ;; 04:5519 $11 $F9 $54

.jr_551C
    call RenderActiveEntitySpritesPair            ;; 04:551C $CD $C0 $3B
    call DecrementEntityIgnoreHitsCountdown       ;; 04:551F $CD $56 $0C
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:5522 $21 $20 $C4
    add  hl, bc                                   ;; 04:5525 $09
    ld   a, [hl]                                  ;; 04:5526 $7E
    and  a                                        ;; 04:5527 $A7
    jr   nz, label_004_5596                       ;; 04:5528 $20 $6C

    call ReturnIfNonInteractive_04                ;; 04:552A $CD $A3 $7F
    ldh  a, [hFrameCounter]                       ;; 04:552D $F0 $E7
    rra                                           ;; 04:552F $1F
    rra                                           ;; 04:5530 $1F
    rra                                           ;; 04:5531 $1F
    and  $01                                      ;; 04:5532 $E6 $01
    call SetEntitySpriteVariant                   ;; 04:5534 $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 04:5537 $F0 $E7
    and  $07                                      ;; 04:5539 $E6 $07
    jr   nz, .jr_5541                             ;; 04:553B $20 $04

    ld   a, JINGLE_FLYING_TILE                    ;; 04:553D $3E $3F
    ldh  [hJingle], a                             ;; 04:553F $E0 $F2

.jr_5541
    ldh  a, [hActiveEntityState]                  ;; 04:5541 $F0 $F0
    JP_TABLE                                      ;; 04:5543
._00 dw func_004_554A                             ;; 04:5544
._01 dw func_004_5569                             ;; 04:5546
._02 dw func_004_5586                             ;; 04:5548

func_004_554A::
    call GetEntityTransitionCountdown             ;; 04:554A $CD $05 $0C
    ld   [hl], $60                                ;; 04:554D $36 $60
    call IncrementEntityState                     ;; 04:554F $CD $12 $3B
    ld   hl, wEntitiesPrivateState4Table          ;; 04:5552 $21 $40 $C4
    add  hl, bc                                   ;; 04:5555 $09
    ld   a, [hl]                                  ;; 04:5556 $7E
    cp   $01                                      ;; 04:5557 $FE $01
    jp   z, label_004_5607                        ;; 04:5559 $CA $07 $56

    cp   $10                                      ;; 04:555C $FE $10
    jp   z, label_004_5615                        ;; 04:555E $CA $15 $56

    cp   $20                                      ;; 04:5561 $FE $20
    jp   z, label_004_560E                        ;; 04:5563 $CA $0E $56

    jp   label_004_5623                           ;; 04:5566 $C3 $23 $56

func_004_5569::
    call label_3B70                               ;; 04:5569 $CD $70 $3B
    call GetEntityTransitionCountdown             ;; 04:556C $CD $05 $0C
    jr   z, jr_004_557E                           ;; 04:556F $28 $0D

    cp   $30                                      ;; 04:5571 $FE $30
    ret  c                                        ;; 04:5573 $D8

    and  $03                                      ;; 04:5574 $E6 $03
    jr   nz, .ret_557D                            ;; 04:5576 $20 $05

    ld   hl, wEntitiesPosZTable                   ;; 04:5578 $21 $10 $C3
    add  hl, bc                                   ;; 04:557B $09
    inc  [hl]                                     ;; 04:557C $34

.ret_557D
    ret                                           ;; 04:557D $C9

jr_004_557E:
    call IncrementEntityState                     ;; 04:557E $CD $12 $3B
    ld   a, $18                                   ;; 04:5581 $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ;; 04:5583 $C3 $AA $3B

func_004_5586::
    call UpdateEntityPosWithSpeed_04              ;; 04:5586 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:5589 $CD $23 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:558C $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:558F $21 $A0 $C2
    add  hl, bc                                   ;; 04:5592 $09
    ld   a, [hl]                                  ;; 04:5593 $7E
    and  a                                        ;; 04:5594 $A7
    ret  z                                        ;; 04:5595 $C8

label_004_5596:
    jp   label_3E34                               ;; 04:5596 $C3 $34 $3E

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Facade4SpriteVariants::
.variant0
    db $F0, OAM_GBC_PAL_6 | OAMF_PAL1
    db $F0, OAM_GBC_PAL_6 | OAMF_PAL1 | OAMF_XFLIP

FacadeFlyingPotHandler::
    ld   de, Facade4SpriteVariants                ;; 04:559D $11 $99 $55
    call RenderActiveEntitySpritesPair            ;; 04:55A0 $CD $C0 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:55A3 $21 $20 $C4
    add  hl, bc                                   ;; 04:55A6 $09
    ld   a, [hl]                                  ;; 04:55A7 $7E
    and  a                                        ;; 04:55A8 $A7
    jr   nz, label_004_5596                       ;; 04:55A9 $20 $EB

    call ReturnIfNonInteractive_04                ;; 04:55AB $CD $A3 $7F
    ldh  a, [hActiveEntityState]                  ;; 04:55AE $F0 $F0
    JP_TABLE                                      ;; 04:55B0
._00 dw func_004_55B7                             ;; 04:55B1
._01 dw func_004_55C3                             ;; 04:55B3
._02 dw func_004_55E0                             ;; 04:55B5

func_004_55B7::
    call func_004_561C                            ;; 04:55B7 $CD $1C $56
    call IncrementEntityState                     ;; 04:55BA $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 04:55BD $CD $05 $0C
    ld   [hl], $60                                ;; 04:55C0 $36 $60
    ret                                           ;; 04:55C2 $C9

func_004_55C3::
    call label_3B70                               ;; 04:55C3 $CD $70 $3B
    call GetEntityTransitionCountdown             ;; 04:55C6 $CD $05 $0C
    jr   z, jr_004_55D8                           ;; 04:55C9 $28 $0D

    cp   $30                                      ;; 04:55CB $FE $30
    ret  c                                        ;; 04:55CD $D8

    and  $03                                      ;; 04:55CE $E6 $03
    jr   nz, .ret_55D7                            ;; 04:55D0 $20 $05

    ld   hl, wEntitiesPosZTable                   ;; 04:55D2 $21 $10 $C3
    add  hl, bc                                   ;; 04:55D5 $09
    inc  [hl]                                     ;; 04:55D6 $34

.ret_55D7
    ret                                           ;; 04:55D7 $C9

jr_004_55D8:
    call IncrementEntityState                     ;; 04:55D8 $CD $12 $3B
    ld   a, $18                                   ;; 04:55DB $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ;; 04:55DD $C3 $AA $3B

func_004_55E0::
    call UpdateEntityPosWithSpeed_04              ;; 04:55E0 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:55E3 $CD $23 $3B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:55E6 $CD $39 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 04:55E9 $21 $A0 $C2
    add  hl, bc                                   ;; 04:55EC $09
    ld   a, [hl]                                  ;; 04:55ED $7E
    and  a                                        ;; 04:55EE $A7
    jp   nz, label_004_5596                       ;; 04:55EF $C2 $96 $55

    ret                                           ;; 04:55F2 $C9

Data_004_55F3::
    db   $10, $12, $11, $13

Data_004_55F7::
    db   $10, $12, $11, $13

Data_004_55FB::
    db   $14, $16, $15, $17

Data_004_55FF::
    db   $76, $77, $76, $77

Data_004_5603::
    db   $76, $49, $76, $49

label_004_5607:
    ld   de, Data_004_55FB                        ;; 04:5607 $11 $FB $55
    ld   a, $AA                                   ;; 04:560A $3E $AA
    jr   jr_004_5628                              ;; 04:560C $18 $1A

label_004_560E:
    ld   de, Data_004_55FF                        ;; 04:560E $11 $FF $55
    ld   a, $AE                                   ;; 04:5611 $3E $AE
    jr   jr_004_5628                              ;; 04:5613 $18 $13

label_004_5615:
    ld   de, Data_004_5603                        ;; 04:5615 $11 $03 $56
    ld   a, $1D                                   ;; 04:5618 $3E $1D
    jr   jr_004_5628                              ;; 04:561A $18 $0C

func_004_561C::
    ld   de, Data_004_55F7                        ;; 04:561C $11 $F7 $55
    ld   a, $0D                                   ;; 04:561F $3E $0D
    jr   jr_004_5628                              ;; 04:5621 $18 $05

label_004_5623:
    ld   de, Data_004_55F3                        ;; 04:5623 $11 $F3 $55
    ld   a, $0D                                   ;; 04:5626 $3E $0D

jr_004_5628:
    ldh  [hMultiPurpose0], a                      ;; 04:5628 $E0 $D7
    push de                                       ;; 04:562A $D5
    ldh  a, [hActiveEntityPosY]                   ;; 04:562B $F0 $EF
    sub  $0F                                      ;; 04:562D $D6 $0F
    ldh  [hIntersectedObjectTop], a               ;; 04:562F $E0 $CD
    ldh  a, [hActiveEntityPosX]                   ;; 04:5631 $F0 $EE
    sub  $07                                      ;; 04:5633 $D6 $07
    ldh  [hIntersectedObjectLeft], a              ;; 04:5635 $E0 $CE
    swap a                                        ;; 04:5637 $CB $37
    and  $0F                                      ;; 04:5639 $E6 $0F
    ld   e, a                                     ;; 04:563B $5F
    ldh  a, [hIntersectedObjectTop]               ;; 04:563C $F0 $CD
    and  $F0                                      ;; 04:563E $E6 $F0
    or   e                                        ;; 04:5640 $B3
    ld   e, a                                     ;; 04:5641 $5F
    ld   d, $00                                   ;; 04:5642 $16 $00
    ld   hl, wRoomObjects                         ;; 04:5644 $21 $11 $D7
    add  hl, de                                   ;; 04:5647 $19
    ldh  a, [hMultiPurpose0]                      ;; 04:5648 $F0 $D7
    ld   [hl], a                                  ;; 04:564A $77
    call label_2887                               ;; 04:564B $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 04:564E $F0 $FE
    and  a                                        ;; 04:5650 $A7
    jr   z, .jr_565F                              ;; 04:5651 $28 $0C

    push bc                                       ;; 04:5653 $C5
    ldh  a, [hMultiPurpose0]                      ;; 04:5654 $F0 $D7
    ld   [wDDD8], a                               ;; 04:5656 $EA $D8 $DD
    ld   a, $04                                   ;; 04:5659 $3E $04
    call func_91D                                 ;; 04:565B $CD $1D $09
    pop  bc                                       ;; 04:565E $C1

.jr_565F
    ld   a, [wDrawCommandsSize]                   ;; 04:565F $FA $00 $D6
    ld   e, a                                     ;; 04:5662 $5F
    ld   d, $00                                   ;; 04:5663 $16 $00
    ld   hl, wDrawCommand                         ;; 04:5665 $21 $01 $D6
    add  hl, de                                   ;; 04:5668 $19
    add  $0A                                      ;; 04:5669 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 04:566B $EA $00 $D6
    pop  de                                       ;; 04:566E $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 04:566F $F0 $CF
    ld   [hl+], a                                 ;; 04:5671 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 04:5672 $F0 $D0
    ld   [hl+], a                                 ;; 04:5674 $22
    ld   a, $81                                   ;; 04:5675 $3E $81
    ld   [hl+], a                                 ;; 04:5677 $22
    ld   a, [de]                                  ;; 04:5678 $1A
    inc  de                                       ;; 04:5679 $13
    ld   [hl+], a                                 ;; 04:567A $22
    ld   a, [de]                                  ;; 04:567B $1A
    inc  de                                       ;; 04:567C $13
    ld   [hl+], a                                 ;; 04:567D $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 04:567E $F0 $CF
    ld   [hl+], a                                 ;; 04:5680 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 04:5681 $F0 $D0
    inc  a                                        ;; 04:5683 $3C
    ld   [hl+], a                                 ;; 04:5684 $22
    ld   a, $81                                   ;; 04:5685 $3E $81
    ld   [hl+], a                                 ;; 04:5687 $22
    ld   a, [de]                                  ;; 04:5688 $1A
    inc  de                                       ;; 04:5689 $13
    ld   [hl+], a                                 ;; 04:568A $22
    ld   a, [de]                                  ;; 04:568B $1A
    ld   [hl+], a                                 ;; 04:568C $22
    xor  a                                        ;; 04:568D $AF
    ld   [hl], a                                  ;; 04:568E $77
    ret                                           ;; 04:568F $C9
