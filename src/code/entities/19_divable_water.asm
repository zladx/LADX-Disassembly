
CatfishMawSwimWarpDataLeft::
    db   $02, $11, $C0, $30, $14

CatfishMawSwimWarpDataRight::
    db   $02, $11, $C1, $50, $14

FisherUnderBridgeWarpData::
    db   $02, $0F, $F5, $94, $52

DivableWaterEntityHandler::
    call ReturnIfNonInteractive_19                ;; 19:4847 $CD $3D $7D
    call GetEntityTransitionCountdown             ;; 19:484A $CD $05 $0C
    jr   z, jr_019_4869                           ;; 19:484D $28 $1A

    cp   $01                                      ;; 19:484F $FE $01
    jr   nz, .jr_485C                             ;; 19:4851 $20 $09

    ld   a, [wLinkMotionState]                    ;; 19:4853 $FA $1C $C1
    ld   [wD463], a                               ;; 19:4856 $EA $63 $D4
    call func_019_4891                            ;; 19:4859 $CD $91 $48

.jr_485C
    ld   a, $02                                   ;; 19:485C $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:485E $E0 $A1
    ld   [wC167], a                               ;; 19:4860 $EA $67 $C1
    ld   a, $04                                   ;; 19:4863 $3E $04
    ld   [wC13B], a                               ;; 19:4865 $EA $3B $C1
    ret                                           ;; 19:4868 $C9

jr_019_4869:
    ld   a, [wLinkMotionState]                    ;; 19:4869 $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 19:486C $FE $01
    jr   nz, .ret_4890                            ;; 19:486E $20 $20

    ldh  a, [hLinkPhysicsModifier]                ;; 19:4870 $F0 $9C
    and  a                                        ;; 19:4872 $A7
    jr   z, .ret_4890                             ;; 19:4873 $28 $1B

    call EntityLinkPositionXDifference_19         ;; 19:4875 $CD $0B $7E
    add  $0C                                      ;; 19:4878 $C6 $0C
    cp   $18                                      ;; 19:487A $FE $18
    jr   nc, .ret_4890                            ;; 19:487C $30 $12

    call EntityLinkPositionYDifference_19         ;; 19:487E $CD $1B $7E
    add  $0C                                      ;; 19:4881 $C6 $0C
    cp   $18                                      ;; 19:4883 $FE $18
    jr   nc, .ret_4890                            ;; 19:4885 $30 $09

    xor  a                                        ;; 19:4887 $AF
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 19:4888 $EA $66 $C1
    call GetEntityTransitionCountdown             ;; 19:488B $CD $05 $0C
    ld   [hl], $10                                ;; 19:488E $36 $10

.ret_4890
    ret                                           ;; 19:4890 $C9

func_019_4891::
    ld   de, FisherUnderBridgeWarpData            ;; 19:4891 $11 $42 $48
    ldh  a, [hMapRoom]                            ;; 19:4894 $F0 $F6
    cp   ROOM_OW_FISHER_UNDER_BRIDGE              ;; 19:4896 $FE $EA
    jr   z, .jr_48A6                              ;; 19:4898 $28 $0C

    ld   de, CatfishMawSwimWarpDataLeft           ;; 19:489A $11 $38 $48
    ldh  a, [hLinkPositionX]                      ;; 19:489D $F0 $98
    cp   $30                                      ;; 19:489F $FE $30
    jr   c, .jr_48A6                              ;; 19:48A1 $38 $03

    ld   de, CatfishMawSwimWarpDataRight          ;; 19:48A3 $11 $3D $48

.jr_48A6
    ld   hl, wWarpStructs                         ;; 19:48A6 $21 $01 $D4
    push bc                                       ;; 19:48A9 $C5
    ld   c, $05                                   ;; 19:48AA $0E $05

.loop_48AC
    ld   a, [de]                                  ;; 19:48AC $1A
    inc  de                                       ;; 19:48AD $13
    ld   [hl+], a                                 ;; 19:48AE $22
    dec  c                                        ;; 19:48AF $0D
    jr   nz, .loop_48AC                           ;; 19:48B0 $20 $FA

    pop  bc                                       ;; 19:48B2 $C1
    call ClearEntityStatus_19                     ;; 19:48B3 $CD $61 $7E
    ldh  a, [hLinkPositionX]                      ;; 19:48B6 $F0 $98
    swap a                                        ;; 19:48B8 $CB $37
    and  $0F                                      ;; 19:48BA $E6 $0F
    ld   e, a                                     ;; 19:48BC $5F
    ldh  a, [hLinkPositionY]                      ;; 19:48BD $F0 $99
    sub  $08                                      ;; 19:48BF $D6 $08
    and  $F0                                      ;; 19:48C1 $E6 $F0
    or   e                                        ;; 19:48C3 $B3
    ld   [wWarp0PositionTileIndex], a             ;; 19:48C4 $EA $16 $D4
    jp   ApplyMapFadeOutTransition                ;; 19:48C7 $C3 $83 $0C
