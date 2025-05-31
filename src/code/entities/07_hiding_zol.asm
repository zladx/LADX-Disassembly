
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HidingZol2SpriteVariants::
.variant0
    db $FF, $FF
    db $FF, $FF
.variant1
    db $FF, $FF
    db $FF, $FF
.variant2
    db $54, $00
    db $54, $20
.variant3
    db $52, $00
    db $52, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HidingZol1SpriteVariants::
.variant0
    db $56, $00
    db $56, $00

HidingZolEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 07:72AF $F0 $F1
    cp   $01                                      ;; 07:72B1 $FE $01
    jr   nz, .jr_72BD                             ;; 07:72B3 $20 $08

    ld   de, HidingZol1SpriteVariants             ;; 07:72B5 $11 $AB $72
    call RenderActiveEntitySprite                 ;; 07:72B8 $CD $77 $3C
    jr   jr_007_72C3                              ;; 07:72BB $18 $06

.jr_72BD
    ld   de, HidingZol2SpriteVariants             ;; 07:72BD $11 $9B $72
    call RenderActiveEntitySpritesPair            ;; 07:72C0 $CD $C0 $3B

jr_007_72C3:
    call ReturnIfNonInteractive_07                ;; 07:72C3 $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ;; 07:72C6 $CD $C3 $7D
    call AddEntityZSpeedToPos_07                  ;; 07:72C9 $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:72CC $21 $20 $C3
    add  hl, bc                                   ;; 07:72CF $09
    dec  [hl]                                     ;; 07:72D0 $35
    dec  [hl]                                     ;; 07:72D1 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:72D2 $21 $10 $C3
    add  hl, bc                                   ;; 07:72D5 $09
    ld   a, [hl]                                  ;; 07:72D6 $7E
    and  $80                                      ;; 07:72D7 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 07:72D9 $E0 $E8
    jr   z, .jr_72E3                              ;; 07:72DB $28 $06

    ld   [hl], b                                  ;; 07:72DD $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:72DE $21 $20 $C3
    add  hl, bc                                   ;; 07:72E1 $09
    ld   [hl], b                                  ;; 07:72E2 $70

.jr_72E3
    ldh  a, [hActiveEntityState]                  ;; 07:72E3 $F0 $F0
    JP_TABLE                                      ;; 07:72E5
._00 dw func_007_72F4                             ;; 07:72E6
._01 dw func_007_7320                             ;; 07:72E8
._02 dw func_007_7350                             ;; 07:72EA
._03 dw func_007_735C                             ;; 07:72EC
._04 dw func_007_737C                             ;; 07:72EE
._05 dw func_007_73A0                             ;; 07:72F0
._06 dw func_007_73D7                             ;; 07:72F2

func_007_72F4::
    call GetEntityTransitionCountdown             ;; 07:72F4 $CD $05 $0C
    jr   nz, ret_007_731F                         ;; 07:72F7 $20 $26

    call GetEntityXDistanceToLink_07              ;; 07:72F9 $CD $5D $7E
    add  $20                                      ;; 07:72FC $C6 $20
    cp   $40                                      ;; 07:72FE $FE $40
    jr   nc, ret_007_731F                         ;; 07:7300 $30 $1D

.jr_7302
    call GetEntityYDistanceToLink_07              ;; 07:7302 $CD $6D $7E
    add  $20                                      ;; 07:7305 $C6 $20
    cp   $40                                      ;; 07:7307 $FE $40
    jr   nc, ret_007_731F                         ;; 07:7309 $30 $14

    call IncrementEntityState                     ;; 07:730B $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:730E $CD $05 $0C
    ld   [hl], $20                                ;; 07:7311 $36 $20
    call GetRandomByte                            ;; 07:7313 $CD $0D $28
    and  $03                                      ;; 07:7316 $E6 $03
    add  $03                                      ;; 07:7318 $C6 $03
    ld   hl, wEntitiesPrivateState1Table          ;; 07:731A $21 $B0 $C2
    add  hl, bc                                   ;; 07:731D $09
    ld   [hl], a                                  ;; 07:731E $77

ret_007_731F:
    ret                                           ;; 07:731F $C9

func_007_7320::
    call GetEntityTransitionCountdown             ;; 07:7320 $CD $05 $0C
    jr   nz, jr_007_7344                          ;; 07:7323 $20 $1F

    ld   hl, wEntitiesPosZTable                   ;; 07:7325 $21 $10 $C3
    add  hl, bc                                   ;; 07:7328 $09
    ld   [hl], $08                                ;; 07:7329 $36 $08
    ld   hl, wEntitiesSpeedZTable                 ;; 07:732B $21 $20 $C3
    add  hl, bc                                   ;; 07:732E $09
    ld   [hl], $08                                ;; 07:732F $36 $08
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:7331 $21 $40 $C3
    add  hl, bc                                   ;; 07:7334 $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 07:7335 $36 $12
    ld   a, $03                                   ;; 07:7337 $3E $03
    call SetEntitySpriteVariant                   ;; 07:7339 $CD $0C $3B
    call IncrementEntityState                     ;; 07:733C $CD $12 $3B

; Also called from various other entities.
func_007_733F::
    ld   a, JINGLE_JUMP                           ;; 07:733F $3E $24
    ldh  [hJingle], a                             ;; 07:7341 $E0 $F2
    ret                                           ;; 07:7343 $C9

jr_007_7344:
    ld   e, $01                                   ;; 07:7344 $1E $01
    cp   $10                                      ;; 07:7346 $FE $10
    jr   nc, .jr_734C                             ;; 07:7348 $30 $02

    ld   e, $02                                   ;; 07:734A $1E $02

.jr_734C
    ld   a, e                                     ;; 07:734C $7B
    jp   SetEntitySpriteVariant                   ;; 07:734D $C3 $0C $3B

func_007_7350::
    ldh  a, [hMultiPurposeG]                      ;; 07:7350 $F0 $E8
    and  a                                        ;; 07:7352 $A7
    ret  z                                        ;; 07:7353 $C8

    call GetEntityTransitionCountdown             ;; 07:7354 $CD $05 $0C
    ld   [hl], $20                                ;; 07:7357 $36 $20
    jp   IncrementEntityState                     ;; 07:7359 $C3 $12 $3B

func_007_735C::
    call label_3B70                               ;; 07:735C $CD $70 $3B
    call GetEntityTransitionCountdown             ;; 07:735F $CD $05 $0C
    jr   nz, .jr_736C                             ;; 07:7362 $20 $08

    ld   [hl], $10                                ;; 07:7364 $36 $10
    call ClearEntitySpeed                         ;; 07:7366 $CD $7F $3D
    jp   IncrementEntityState                     ;; 07:7369 $C3 $12 $3B

.jr_736C
    ld   e, $08                                   ;; 07:736C $1E $08
    and  $04                                      ;; 07:736E $E6 $04
    jr   z, .jr_7374                              ;; 07:7370 $28 $02

    ld   e, $F8                                   ;; 07:7372 $1E $F8

.jr_7374
    ld   hl, wEntitiesSpeedXTable                 ;; 07:7374 $21 $40 $C2
    add  hl, bc                                   ;; 07:7377 $09
    ld   [hl], e                                  ;; 07:7378 $73
    jp   AddEntitySpeedToPos_07                   ;; 07:7379 $C3 $17 $7E

func_007_737C::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:737C $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:737F $CD $0A $7E
    call func_007_73F7                            ;; 07:7382 $CD $F7 $73
    call GetEntityTransitionCountdown             ;; 07:7385 $CD $05 $0C
    jr   nz, .jr_739B                             ;; 07:7388 $20 $11

    ld   a, $0C                                   ;; 07:738A $3E $0C
    call ApplyVectorTowardsLink_trampoline        ;; 07:738C $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 07:738F $21 $20 $C3
    add  hl, bc                                   ;; 07:7392 $09
    ld   [hl], $18                                ;; 07:7393 $36 $18
    call func_007_733F                            ;; 07:7395 $CD $3F $73
    call IncrementEntityState                     ;; 07:7398 $CD $12 $3B

.jr_739B
    ld   a, $03                                   ;; 07:739B $3E $03
    jp   SetEntitySpriteVariant                   ;; 07:739D $C3 $0C $3B

func_007_73A0::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 07:73A0 $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ;; 07:73A3 $CD $0A $7E
    call func_007_73F7                            ;; 07:73A6 $CD $F7 $73
    ldh  a, [hMultiPurposeG]                      ;; 07:73A9 $F0 $E8
    and  a                                        ;; 07:73AB $A7
    jr   z, .jr_73D2                              ;; 07:73AC $28 $24

    call ClearEntitySpeed                         ;; 07:73AE $CD $7F $3D
    call IncrementEntityState                     ;; 07:73B1 $CD $12 $3B
    ld   [hl], $04                                ;; 07:73B4 $36 $04
    call GetEntityTransitionCountdown             ;; 07:73B6 $CD $05 $0C
    ld   [hl], $20                                ;; 07:73B9 $36 $20
    ld   hl, wEntitiesPrivateState1Table          ;; 07:73BB $21 $B0 $C2
    add  hl, bc                                   ;; 07:73BE $09
    dec  [hl]                                     ;; 07:73BF $35
    jr   nz, .jr_73D2                             ;; 07:73C0 $20 $10

    call IncrementEntityState                     ;; 07:73C2 $CD $12 $3B
    ld   [hl], $06                                ;; 07:73C5 $36 $06
    call GetEntityTransitionCountdown             ;; 07:73C7 $CD $05 $0C
    ld   [hl], $30                                ;; 07:73CA $36 $30
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 07:73CC $21 $40 $C3
    add  hl, bc                                   ;; 07:73CF $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_PROJECTILE_NOCLIP | ENTITY_PHYSICS_HARMLESS ;; 07:73D0 $36 $D2

.jr_73D2
    ld   a, $02                                   ;; 07:73D2 $3E $02
    jp   SetEntitySpriteVariant                   ;; 07:73D4 $C3 $0C $3B

func_007_73D7::
    call GetEntityTransitionCountdown             ;; 07:73D7 $CD $05 $0C
    jr   nz, .jr_73E6                             ;; 07:73DA $20 $0A

    ld   [hl], $50                                ;; 07:73DC $36 $50
    call IncrementEntityState                     ;; 07:73DE $CD $12 $3B
    ld   [hl], b                                  ;; 07:73E1 $70
    xor  a                                        ;; 07:73E2 $AF
    jp   SetEntitySpriteVariant                   ;; 07:73E3 $C3 $0C $3B

.jr_73E6
    ld   e, $03                                   ;; 07:73E6 $1E $03
    cp   $20                                      ;; 07:73E8 $FE $20
    jr   nc, .jr_73F3                             ;; 07:73EA $30 $07

    ld   e, $01                                   ;; 07:73EC $1E $01
    cp   $10                                      ;; 07:73EE $FE $10
    jr   c, .jr_73F3                              ;; 07:73F0 $38 $01

    inc  e                                        ;; 07:73F2 $1C

.jr_73F3
    ld   a, e                                     ;; 07:73F3 $7B
    jp   SetEntitySpriteVariant                   ;; 07:73F4 $C3 $0C $3B

func_007_73F7::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:73F7 $21 $10 $C4
    add  hl, bc                                   ;; 07:73FA $09
    ld   [hl], $03                                ;; 07:73FB $36 $03
    call ApplyEntityInteractionWithBackground_trampoline ;; 07:73FD $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:7400 $21 $10 $C4
    add  hl, bc                                   ;; 07:7403 $09
    ld   [hl], b                                  ;; 07:7404 $70
    ret                                           ;; 07:7405 $C9
