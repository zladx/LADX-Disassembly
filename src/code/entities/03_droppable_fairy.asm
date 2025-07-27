data_003_6157::
    db $20, $21, $20, $01

DroppableFairyEntityHandler::
    call DroppableRevealOrReturnIfNeeded          ;; 03:615B $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:615E $CD $8C $60
    ld   de, data_003_6157                        ;; 03:6161 $11 $57 $61
    call RenderActiveEntitySprite                 ;; 03:6164 $CD $77 $3C
    call ReturnIfNonInteractive_03                ;; 03:6167 $CD $78 $7F
    call PickableHandleGrabbedByItemIfNeeded      ;; 03:616A $CD $AF $62
    call PickableCollectIfNeeded                  ;; 03:616D $CD $EB $62
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6170 $21 $40 $C2
    add  hl, bc                                   ;; 03:6173 $09
    ld   a, [hl]                                  ;; 03:6174 $7E
    rlca                                          ;; 03:6175 $07
    and  $01                                      ;; 03:6176 $E6 $01
    call SetEntitySpriteVariant                   ;; 03:6178 $CD $0C $3B
    call UpdateEntityPosWithSpeed_03              ;; 03:617B $CD $25 $7F
    call func_003_61C0                            ;; 03:617E $CD $C0 $61
    call ApplyEntityInteractionWithBackground     ;; 03:6181 $CD $93 $78
    call GetEntityXDistanceToLink_03              ;; 03:6184 $CD $D9 $7E
    ld   a, d                                     ;; 03:6187 $7A
    bit  7, a                                     ;; 03:6188 $CB $7F
    jr   z, .jr_618C                              ;; 03:618A $28 $00

.jr_618C
    cp   $20                                      ;; 03:618C $FE $20
    jr   c, jr_003_619C                           ;; 03:618E $38 $0C

    call GetEntityYDistanceToLink_03              ;; 03:6190 $CD $E9 $7E
    ld   a, d                                     ;; 03:6193 $7A
    bit  7, a                                     ;; 03:6194 $CB $7F
    jr   z, .jr_6198                              ;; 03:6196 $28 $00

.jr_6198
    cp   $20                                      ;; 03:6198 $FE $20
    jr   nc, jr_003_61BB                          ;; 03:619A $30 $1F

jr_003_619C:
    call GetEntityTransitionCountdown             ;; 03:619C $CD $05 $0C
    ret  nz                                       ;; 03:619F $C0

    ld   [hl], $30                                ;; 03:61A0 $36 $30
    call GetRandomByte                            ;; 03:61A2 $CD $0D $28
    and  $0F                                      ;; 03:61A5 $E6 $0F
    sub  $08                                      ;; 03:61A7 $D6 $08
    ld   hl, wEntitiesSpeedXTable                 ;; 03:61A9 $21 $40 $C2
    add  hl, bc                                   ;; 03:61AC $09
    ld   [hl], a                                  ;; 03:61AD $77
    call GetRandomByte                            ;; 03:61AE $CD $0D $28
    and  $0F                                      ;; 03:61B1 $E6 $0F
    sub  $08                                      ;; 03:61B3 $D6 $08
    ld   hl, wEntitiesSpeedYTable                 ;; 03:61B5 $21 $50 $C2
    add  hl, bc                                   ;; 03:61B8 $09
    ld   [hl], a                                  ;; 03:61B9 $77
    ret                                           ;; 03:61BA $C9

jr_003_61BB:
    ld   a, $09                                   ;; 03:61BB $3E $09
    jp   ApplyVectorTowardsLinkAndReturn          ;; 03:61BD $C3 $C7 $7E
