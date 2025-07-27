YarnaTalkingBonesEntityHandler::
    call ReturnIfNonInteractive_15                ;; 15:443F $CD $0D $7B
    ld   e, $0F                                   ;; 15:4442 $1E $0F
    ld   d, b                                     ;; 15:4444 $50

jr_015_4445:
    ld   hl, wEntitiesStatusTable                 ;; 15:4445 $21 $80 $C2
    add  hl, de                                   ;; 15:4448 $19
    ld   a, [hl]                                  ;; 15:4449 $7E
    cp   $05                                      ;; 15:444A $FE $05
    jr   nz, jr_015_448C                          ;; 15:444C $20 $3E

    ld   hl, wEntitiesTypeTable                   ;; 15:444E $21 $A0 $C3
    add  hl, de                                   ;; 15:4451 $19
    ld   a, [hl]                                  ;; 15:4452 $7E
    cp   $08                                      ;; 15:4453 $FE $08
    jr   nz, jr_015_448C                          ;; 15:4455 $20 $35

    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:4457 $21 $E0 $C2
    add  hl, de                                   ;; 15:445A $19
    ld   a, [hl]                                  ;; 15:445B $7E
    cp   $08                                      ;; 15:445C $FE $08
    jr   nz, jr_015_448C                          ;; 15:445E $20 $2C

    ld   hl, wEntitiesPosXTable                   ;; 15:4460 $21 $00 $C2
    add  hl, de                                   ;; 15:4463 $19
    ldh  a, [hActiveEntityPosX]                   ;; 15:4464 $F0 $EE
    sub  [hl]                                     ;; 15:4466 $96
    add  $08                                      ;; 15:4467 $C6 $08
    cp   $10                                      ;; 15:4469 $FE $10
    jr   nc, jr_015_448C                          ;; 15:446B $30 $1F

    ld   hl, wEntitiesPosYTable                   ;; 15:446D $21 $10 $C2
    add  hl, de                                   ;; 15:4470 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 15:4471 $F0 $EC
    sub  [hl]                                     ;; 15:4473 $96
    add  $08                                      ;; 15:4474 $C6 $08
    cp   $10                                      ;; 15:4476 $FE $10
    jr   nc, jr_015_448C                          ;; 15:4478 $30 $12

    ldh  a, [hMapRoom]                            ;; 15:447A $F0 $F6
    cp   UNKNOWN_ROOM_DF                          ;; 15:447C $FE $DF
    ld_dialog_low a, Dialog092                    ;; 15:447E $3E $92
    jr   z, .jr_4489                              ;; 15:4480 $28 $07

    ld   a, [wIsGhostFollowingLink]               ;; 15:4482 $FA $79 $DB
    and  a                                        ;; 15:4485 $A7
    ret  nz                                       ;; 15:4486 $C0

    ld_dialog_low a, Dialog043                    ;; 15:4487 $3E $43

.jr_4489
    jp   OpenDialogInTable0                       ;; 15:4489 $C3 $85 $23

jr_015_448C:
    dec  e                                        ;; 15:448C $1D
    ld   a, e                                     ;; 15:448D $7B
    cp   $FF                                      ;; 15:448E $FE $FF
    jr   nz, jr_015_4445                          ;; 15:4490 $20 $B3

    ret                                           ;; 15:4492 $C9
