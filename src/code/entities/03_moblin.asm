OctorokSpriteVariants::
; Down
.variant0
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Up
.variant2
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db   $30, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db   $32, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
; Left
.variant4
    db   $34, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $36, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db   $38, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $3A, OAM_GBC_PAL_2 | OAMF_PAL0
; Right
.variant6
    db   $36, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $34, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db   $3A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $38, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

RoamingEnemySpeedXPerDirection::
    db   $08, $F8, $00, $00

RoamingEnemySpeedYPerDirection::
    db   $00, $00, $F8, $08

EntityVariantForDirection_03::
.right db 6
.left  db 4
.up    db 2
.down  db 0

MoblinEntityHandler::
    ldh  a, [hMapId]                              ;; 03:5827 $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ;; 03:5829 $FE $15
    jr   nz, .hideoutEnd                          ;; 03:582B $20 $08

    ld   a, [wIsBowWowFollowingLink]              ;; 03:582D $FA $56 $DB
    cp   $80                                      ;; 03:5830 $FE $80
    jp   nz, UnloadEntityAndReturn                ;; 03:5832 $C2 $8D $3F

.hideoutEnd
    ld   a, c                                     ;; 03:5835 $79
    ld   [wD153], a                               ;; 03:5836 $EA $53 $D1
    ld   de, MoblinSpriteVariants                 ;; 03:5839 $11 $17 $59
    ; fallthrough

; Animate roaming enemy (Octorok, Moblin, Iron mask)
AnimateRoamingEnemy::
    call RenderActiveEntitySpritesPair            ;; 03:583C $CD $C0 $3B
    call ReturnIfNonInteractive_03                ;; 03:583F $CD $78 $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:5842 $21 $10 $C4
    add  hl, bc                                   ;; 03:5845 $09
    ld   a, [hl]                                  ;; 03:5846 $7E
    and  a                                        ;; 03:5847 $A7
    jr   z, .recoilEnd                            ;; 03:5848 $28 $0E

    ld   hl, wEntitiesStateTable                  ;; 03:584A $21 $90 $C2
    add  hl, bc                                   ;; 03:584D $09
    ld   a, $01                                   ;; 03:584E $3E $01
    ld   [hl], a                                  ;; 03:5850 $77
    ldh  [hActiveEntityState], a                  ;; 03:5851 $E0 $F0
    call GetEntityTransitionCountdown             ;; 03:5853 $CD $05 $0C
    ld   [hl], $40                                ;; 03:5856 $36 $40

.recoilEnd
    call ApplyRecoilIfNeeded_03                   ;; 03:5858 $CD $A9 $7F
    call DefaultEnemyDamageCollisionHandler       ;; 03:585B $CD $28 $6E
    ldh  a, [hActiveEntityState]                  ;; 03:585E $F0 $F0
    and  a                                        ;; 03:5860 $A7
    jr   z, RoamingEnemyState0Handler             ;; 03:5861 $28 $74

    call GetEntityTransitionCountdown             ;; 03:5863 $CD $05 $0C
    jr   z, jr_003_5896                           ;; 03:5866 $28 $2E

    cp   $0A                                      ;; 03:5868 $FE $0A
    jr   nz, .projectileEnd                       ;; 03:586A $20 $1D

    call GetEntityPrivateCountdown1               ;; 03:586C $CD $00 $0C
    jr   nz, .projectileEnd                       ;; 03:586F $20 $18

    call GetEntityDirectionToLink_03              ;; 03:5871 $CD $FE $7E
    ld   hl, wEntitiesDirectionTable              ;; 03:5874 $21 $80 $C3
    add  hl, bc                                   ;; 03:5877 $09
    ld   a, e                                     ;; 03:5878 $7B
    cp   [hl]                                     ;; 03:5879 $BE
    jr   nz, .projectileEnd                       ;; 03:587A $20 $0D

    ldh  a, [hActiveEntityType]                   ;; 03:587C $F0 $EB
    cp   ENTITY_IRON_MASK                         ;; 03:587E $FE $24
    jr   z, .projectileEnd                        ;; 03:5880 $28 $07

    cp   ENTITY_OCTOROK                           ;; 03:5882 $FE $09
    jr   z, jr_003_588D                           ;; 03:5884 $28 $07

    call SpawnMoblinArrow                         ;; 03:5886 $CD $47 $59

.projectileEnd
    call ApplyEntityInteractionWithBackground     ;; 03:5889 $CD $93 $78
    ret                                           ;; 03:588C $C9

jr_003_588D:
    ld   a, [wGameplayType]                       ;; 03:588D $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 03:5890 $FE $01
    ret  z                                        ;; 03:5892 $C8

    jp   SpawnOctorokRock                         ;; 03:5893 $C3 $98 $59

jr_003_5896:
    call GetRandomByte                            ;; 03:5896 $CD $0D $28
    and  $1F                                      ;; 03:5899 $E6 $1F
    or   $20                                      ;; 03:589B $F6 $20
    ld   [hl], a                                  ;; 03:589D $77
    ld   hl, wEntitiesStateTable                  ;; 03:589E $21 $90 $C2
    add  hl, bc                                   ;; 03:58A1 $09
    ld   [hl], $00                                ;; 03:58A2 $36 $00
    ld   hl, wEntitiesPrivateState1Table          ;; 03:58A4 $21 $B0 $C2
    add  hl, bc                                   ;; 03:58A7 $09
    ld   a, [hl]                                  ;; 03:58A8 $7E
    inc  a                                        ;; 03:58A9 $3C
    and  $03                                      ;; 03:58AA $E6 $03
    ld   [hl], a                                  ;; 03:58AC $77
    cp   $00                                      ;; 03:58AD $FE $00
    jr   nz, .jr_58B6                             ;; 03:58AF $20 $05

    call GetEntityDirectionToLink_03              ;; 03:58B1 $CD $FE $7E
    jr   jr_003_58B9                              ;; 03:58B4 $18 $03

.jr_58B6
    call GetRandomByte                            ;; 03:58B6 $CD $0D $28

jr_003_58B9:
    and  $03                                      ;; 03:58B9 $E6 $03
    ld   hl, wEntitiesDirectionTable              ;; 03:58BB $21 $80 $C3
    add  hl, bc                                   ;; 03:58BE $09
    ld   [hl], a                                  ;; 03:58BF $77
    ld   e, a                                     ;; 03:58C0 $5F
    ld   d, b                                     ;; 03:58C1 $50
    ld   hl, RoamingEnemySpeedXPerDirection       ;; 03:58C2 $21 $1B $58
    add  hl, de                                   ;; 03:58C5 $19
    ld   a, [hl]                                  ;; 03:58C6 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:58C7 $21 $40 $C2
    add  hl, bc                                   ;; 03:58CA $09
    ld   [hl], a                                  ;; 03:58CB $77
    ld   hl, RoamingEnemySpeedYPerDirection       ;; 03:58CC $21 $1F $58
    add  hl, de                                   ;; 03:58CF $19
    ld   a, [hl]                                  ;; 03:58D0 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:58D1 $21 $50 $C2
    add  hl, bc                                   ;; 03:58D4 $09
    ld   [hl], a                                  ;; 03:58D5 $77
    ret                                           ;; 03:58D6 $C9

RoamingEnemyState0Handler:
    ld   hl, wEntitiesCollisionsTable             ;; 03:58D7 $21 $A0 $C2
    add  hl, bc                                   ;; 03:58DA $09
    ld   a, [hl]                                  ;; 03:58DB $7E
    and  $0F                                      ;; 03:58DC $E6 $0F
    jr   nz, .collided                            ;; 03:58DE $20 $05

    call GetEntityTransitionCountdown             ;; 03:58E0 $CD $05 $0C
    jr   nz, StopWalkingEnd                       ;; 03:58E3 $20 $11

.collided
    call GetRandomByte                            ;; 03:58E5 $CD $0D $28
    and  $0F                                      ;; 03:58E8 $E6 $0F
    or   $10                                      ;; 03:58EA $F6 $10
    ld   [hl], a                                  ;; 03:58EC $77
    ld   hl, wEntitiesStateTable                  ;; 03:58ED $21 $90 $C2
    add  hl, bc                                   ;; 03:58F0 $09
    ld   [hl], $01                                ;; 03:58F1 $36 $01
    call ClearEntitySpeed                         ;; 03:58F3 $CD $7F $3D

StopWalkingEnd:
    call UpdateEntityPosWithSpeed_03              ;; 03:58F6 $CD $25 $7F
    call ApplyEntityInteractionWithBackground     ;; 03:58F9 $CD $93 $78

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_03::
    ld   hl, wEntitiesDirectionTable              ;; 03:58FC $21 $80 $C3
    add  hl, bc                                   ;; 03:58FF $09
    ld   e, [hl]                                  ;; 03:5900 $5E
    ld   d, b                                     ;; 03:5901 $50
    ld   hl, EntityVariantForDirection_03         ;; 03:5902 $21 $23 $58
    add  hl, de                                   ;; 03:5905 $19
    push hl                                       ;; 03:5906 $E5
    ld   hl, wEntitiesInertiaTable                ;; 03:5907 $21 $D0 $C3
    add  hl, bc                                   ;; 03:590A $09
    inc  [hl]                                     ;; 03:590B $34
    ld   a, [hl]                                  ;; 03:590C $7E
    rra                                           ;; 03:590D $1F
    rra                                           ;; 03:590E $1F
    rra                                           ;; 03:590F $1F
    pop  hl                                       ;; 03:5910 $E1
    and  $01                                      ;; 03:5911 $E6 $01
    or   [hl]                                     ;; 03:5913 $B6
    jp   SetEntitySpriteVariant                   ;; 03:5914 $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MoblinSpriteVariants::
; Down
.variant0
    db $60, OAM_GBC_PAL_3
    db $62, OAM_GBC_PAL_3
.variant1
    db $62, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_3 | OAMF_XFLIP
; Up
.variant2
    db $64, OAM_GBC_PAL_3
    db $66, OAM_GBC_PAL_3
.variant3
    db $66, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_3 | OAMF_XFLIP
; Left
.variant4
    db $68, OAM_GBC_PAL_3
    db $6A, OAM_GBC_PAL_3
.variant5
    db $6C, OAM_GBC_PAL_3
    db $6E, OAM_GBC_PAL_3
; Right
.variant6
    db $6A, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_3 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_3 | OAMF_XFLIP

MoblinArrowOffsetXPerDirection::
    db   $08, $F8, $04, $FC

MoblinArrowOffsetYPerDirection::
    db   $FC, $FC, $F8, $00

MoblinArrowSpeedXPerDirection::
    db   $20, $E0, $00, $00

MoblinArrowSpeedYPerDirection::
    db   $00, $00, $E0, $20

SpawnMoblinArrow::
    ld   a, ENTITY_MOBLIN_ARROW                   ;; 03:5947 $3E $0C
    call SpawnNewEntity                           ;; 03:5949 $CD $CA $64
    jr   c, ret_003_598B                          ;; 03:594C $38 $3D

    push bc                                       ;; 03:594E $C5
    ldh  a, [hMultiPurpose2]                      ;; 03:594F $F0 $D9
    ld   c, a                                     ;; 03:5951 $4F
    ld   hl, MoblinArrowOffsetXPerDirection       ;; 03:5952 $21 $37 $59
    add  hl, bc                                   ;; 03:5955 $09
    ldh  a, [hMultiPurpose0]                      ;; 03:5956 $F0 $D7
    add  [hl]                                     ;; 03:5958 $86
    ld   hl, wEntitiesPosXTable                   ;; 03:5959 $21 $00 $C2
    add  hl, de                                   ;; 03:595C $19
    ld   [hl], a                                  ;; 03:595D $77
    ld   hl, MoblinArrowOffsetYPerDirection       ;; 03:595E $21 $3B $59
    add  hl, bc                                   ;; 03:5961 $09
    ldh  a, [hMultiPurpose1]                      ;; 03:5962 $F0 $D8
    add  [hl]                                     ;; 03:5964 $86
    ld   hl, wEntitiesPosYTable                   ;; 03:5965 $21 $10 $C2
    add  hl, de                                   ;; 03:5968 $19
    ld   [hl], a                                  ;; 03:5969 $77
    ld   hl, MoblinArrowSpeedXPerDirection        ;; 03:596A $21 $3F $59
    add  hl, bc                                   ;; 03:596D $09
    ld   a, [hl]                                  ;; 03:596E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:596F $21 $40 $C2
    add  hl, de                                   ;; 03:5972 $19
    ld   [hl], a                                  ;; 03:5973 $77
    ld   hl, MoblinArrowSpeedYPerDirection        ;; 03:5974 $21 $43 $59
    add  hl, bc                                   ;; 03:5977 $09
    ld   a, [hl]                                  ;; 03:5978 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:5979 $21 $50 $C2
    add  hl, de                                   ;; 03:597C $19
    ld   [hl], a                                  ;; 03:597D $77
    ldh  a, [hMultiPurpose2]                      ;; 03:597E $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:5980 $21 $B0 $C3
    add  hl, de                                   ;; 03:5983 $19
    ld   [hl], a                                  ;; 03:5984 $77
    ld   hl, wEntitiesDirectionTable              ;; 03:5985 $21 $80 $C3
    add  hl, de                                   ;; 03:5988 $19
    ld   [hl], a                                  ;; 03:5989 $77
    pop  bc                                       ;; 03:598A $C1

ret_003_598B:
    ret                                           ;; 03:598B $C9

OctorokRockOffsetXPerDirection::
    db   $08, $F8

OctorokRockOffsetYPerDirection::
    db   $00, $00, $F8, $08

OctorokRockSpeedXPerDirection::
    db   $20, $E0

OctorokRockSpeedYPerDirection::
    db   $00, $00, $E0, $20

SpawnOctorokRock::
    ld   a, ENTITY_OCTOROK_ROCK                   ;; 03:5998 $3E $0A
    call SpawnNewEntity                           ;; 03:599A $CD $CA $64
    jr   c, .return                               ;; 03:599D $38 $37

    push bc                                       ;; 03:599F $C5
    ldh  a, [hMultiPurpose2]                      ;; 03:59A0 $F0 $D9
    ld   hl, wEntitiesDirectionTable              ;; 03:59A2 $21 $80 $C3
    add  hl, de                                   ;; 03:59A5 $19
    ld   [hl], a                                  ;; 03:59A6 $77
    ld   c, a                                     ;; 03:59A7 $4F
    ld   hl, OctorokRockOffsetXPerDirection       ;; 03:59A8 $21 $8C $59
    add  hl, bc                                   ;; 03:59AB $09
    ldh  a, [hMultiPurpose0]                      ;; 03:59AC $F0 $D7
    add  [hl]                                     ;; 03:59AE $86
    ld   hl, wEntitiesPosXTable                   ;; 03:59AF $21 $00 $C2
    add  hl, de                                   ;; 03:59B2 $19
    ld   [hl], a                                  ;; 03:59B3 $77
    ld   hl, OctorokRockOffsetYPerDirection       ;; 03:59B4 $21 $8E $59
    add  hl, bc                                   ;; 03:59B7 $09
    ldh  a, [hMultiPurpose1]                      ;; 03:59B8 $F0 $D8
    add  [hl]                                     ;; 03:59BA $86
    ld   hl, wEntitiesPosYTable                   ;; 03:59BB $21 $10 $C2
    add  hl, de                                   ;; 03:59BE $19
    ld   [hl], a                                  ;; 03:59BF $77
    ld   hl, OctorokRockSpeedXPerDirection        ;; 03:59C0 $21 $92 $59
    add  hl, bc                                   ;; 03:59C3 $09
    ld   a, [hl]                                  ;; 03:59C4 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:59C5 $21 $40 $C2
    add  hl, de                                   ;; 03:59C8 $19
    ld   [hl], a                                  ;; 03:59C9 $77
    ld   hl, OctorokRockSpeedYPerDirection        ;; 03:59CA $21 $94 $59
    add  hl, bc                                   ;; 03:59CD $09
    ld   a, [hl]                                  ;; 03:59CE $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:59CF $21 $50 $C2
    add  hl, de                                   ;; 03:59D2 $19
    ld   [hl], a                                  ;; 03:59D3 $77
    pop  bc                                       ;; 03:59D4 $C1
    and  a                                        ;; 03:59D5 $A7

.return
IF !__OPTIMIZATIONS_1__
    ; Small optimization: This RET isn't needed since we just
    ; fall through to EntityInitBrokenHeartContainer, which only
    ; contains RET.
    ret                                           ;; 03:59D6 $C9
ENDC
