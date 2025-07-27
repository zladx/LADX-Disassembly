; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TektiteSpriteVariants::
.variant0
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

TektiteXSpeeds::
    db   $10, $F0, $10, $F0

TektiteYSpeeds::
    db   $10, $10, $F0, $F0

TektiteEntityHandler::
    ld   de, TektiteSpriteVariants                ;; 06:78C7 $11 $B7 $78
    call RenderActiveEntitySpritesPair            ;; 06:78CA $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:78CD $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:78D0 $CD $F7 $64
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:78D3 $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:78D6 $CD $41 $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:78D9 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 06:78DC $21 $A0 $C2
    add  hl, bc                                   ;; 06:78DF $09
    ld   a, [hl]                                  ;; 06:78E0 $7E
    and  $03                                      ;; 06:78E1 $E6 $03
    jr   z, .noCollisionX                         ;; 06:78E3 $28 $03

    call TektiteHorizontalCollision               ;; 06:78E5 $CD $79 $79

.noCollisionX
    ld   a, [hl]                                  ;; 06:78E8 $7E
    and  $0C                                      ;; 06:78E9 $E6 $0C
    jr   z, .noCollisionY                         ;; 06:78EB $28 $03

    call TektiteVerticalCollision                 ;; 06:78ED $CD $7E $79

.noCollisionY
    ldh  a, [hActiveEntityState]                  ;; 06:78F0 $F0 $F0
    and  a                                        ;; 06:78F2 $A7
    jr   nz, TektiteState1Handler                 ;; 06:78F3 $20 $2C

    ld   hl, wEntitiesPosZTable                   ;; 06:78F5 $21 $10 $C3
    add  hl, bc                                   ;; 06:78F8 $09
    ld   a, [hl]                                  ;; 06:78F9 $7E
    and  $80                                      ;; 06:78FA $E6 $80
    jr   z, .hitGroundEnd                         ;; 06:78FC $28 $1A

    xor  a                                        ;; 06:78FE $AF
    ld   [hl], a                                  ;; 06:78FF $77
    call ClearEntitySpeed                         ;; 06:7900 $CD $7F $3D
    ld   hl, wEntitiesStateTable                  ;; 06:7903 $21 $90 $C2
    add  hl, bc                                   ;; 06:7906 $09
    inc  [hl]                                     ;; 06:7907 $34
    call GetEntityTransitionCountdown             ;; 06:7908 $CD $05 $0C
    call GetRandomByte                            ;; 06:790B $CD $0D $28
    and  $3F                                      ;; 06:790E $E6 $3F
    add  $10                                      ;; 06:7910 $C6 $10
    ld   [hl], a                                  ;; 06:7912 $77
    ld   a, $01                                   ;; 06:7913 $3E $01
    jp   SetEntitySpriteVariant                   ;; 06:7915 $C3 $0C $3B

.hitGroundEnd
    call AddEntityZSpeedToPos_06                  ;; 06:7918 $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ;; 06:791B $21 $20 $C3
    add  hl, bc                                   ;; 06:791E $09
    dec  [hl]                                     ;; 06:791F $35
    ret                                           ;; 06:7920 $C9

TektiteState1Handler::
    ld   hl, wEntitiesInertiaTable                ;; 06:7921 $21 $D0 $C3
    add  hl, bc                                   ;; 06:7924 $09
    inc  [hl]                                     ;; 06:7925 $34
    ld   a, [hl]                                  ;; 06:7926 $7E
    and  $10                                      ;; 06:7927 $E6 $10
    srl  a                                        ;; 06:7929 $CB $3F
    srl  a                                        ;; 06:792B $CB $3F
    srl  a                                        ;; 06:792D $CB $3F
    srl  a                                        ;; 06:792F $CB $3F
    call SetEntitySpriteVariant                   ;; 06:7931 $CD $0C $3B
    and  a                                        ;; 06:7934 $A7
    ret  nz                                       ;; 06:7935 $C0

    call GetEntityTransitionCountdown             ;; 06:7936 $CD $05 $0C
    ret  nz                                       ;; 06:7939 $C0

    call GetRandomByte                            ;; 06:793A $CD $0D $28
    and  $07                                      ;; 06:793D $E6 $07
    add  $10                                      ;; 06:793F $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ;; 06:7941 $21 $20 $C3
    add  hl, bc                                   ;; 06:7944 $09
    ld   [hl], a                                  ;; 06:7945 $77
    call AddEntityZSpeedToPos_06                  ;; 06:7946 $CD $7A $65
    call GetRandomByte                            ;; 06:7949 $CD $0D $28
    and  $03                                      ;; 06:794C $E6 $03
    ld   e, a                                     ;; 06:794E $5F
    ld   d, b                                     ;; 06:794F $50
    ld   hl, TektiteXSpeeds                       ;; 06:7950 $21 $BF $78
    add  hl, de                                   ;; 06:7953 $19
    ld   a, [hl]                                  ;; 06:7954 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7955 $21 $40 $C2
    add  hl, bc                                   ;; 06:7958 $09
    ld   [hl], a                                  ;; 06:7959 $77
    ld   hl, TektiteYSpeeds                       ;; 06:795A $21 $C3 $78
    add  hl, de                                   ;; 06:795D $19
    ld   a, [hl]                                  ;; 06:795E $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:795F $21 $50 $C2
    add  hl, bc                                   ;; 06:7962 $09
    ld   [hl], a                                  ;; 06:7963 $77
    call GetRandomByte                            ;; 06:7964 $CD $0D $28
    and  $01                                      ;; 06:7967 $E6 $01
    jr   z, .skipMoveTowardsLink                  ;; 06:7969 $28 $05

    ld   a, $14                                   ;; 06:796B $3E $14
    call ApplyVectorTowardsLink_trampoline        ;; 06:796D $CD $AA $3B

.skipMoveTowardsLink
    ld   hl, wEntitiesStateTable                  ;; 06:7970 $21 $90 $C2
    add  hl, bc                                   ;; 06:7973 $09
    xor  a                                        ;; 06:7974 $AF
    ld   [hl], a                                  ;; 06:7975 $77
    jp   SetEntitySpriteVariant                   ;; 06:7976 $C3 $0C $3B

TektiteHorizontalCollision::
    ld   hl, wEntitiesSpeedXTable                 ;; 06:7979 $21 $40 $C2
    jr   jr_006_7982                              ;; 06:797C $18 $04

TektiteVerticalCollision::
    ld   hl, wEntitiesSpeedXTable                 ;; 06:797E $21 $40 $C2
    add  hl, bc                                   ;; 06:7981 $09

jr_006_7982:
    ld   a, [hl]                                  ;; 06:7982 $7E
    cpl                                           ;; 06:7983 $2F
    inc  a                                        ;; 06:7984 $3C
    sra  a                                        ;; 06:7985 $CB $2F
    ld   [hl], a                                  ;; 06:7987 $77
    ret                                           ;; 06:7988 $C9
