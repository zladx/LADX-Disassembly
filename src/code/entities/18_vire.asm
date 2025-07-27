
VireEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 18:69FC $21 $B0 $C2
    add  hl, bc                                   ;; 18:69FF $09
    ld   a, [hl]                                  ;; 18:6A00 $7E
    cp   $02                                      ;; 18:6A01 $FE $02
    jp   z, label_018_6F1F                        ;; 18:6A03 $CA $1F $6F

    and  a                                        ;; 18:6A06 $A7
    jp   nz, label_018_6F70                       ;; 18:6A07 $C2 $70 $6F

    ldh  a, [hActiveEntityStatus]                 ;; 18:6A0A $F0 $EA
    cp   $01                                      ;; 18:6A0C $FE $01
    jr   nz, jr_018_6A71                          ;; 18:6A0E $20 $61

    ldh  a, [hActiveEntityPosX]                   ;; 18:6A10 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:6A12 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6A14 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:6A16 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 18:6A18 $3E $02
    call AddTranscientVfx                         ;; 18:6A1A $CD $C7 $0C
    ld   a, $0C                                   ;; 18:6A1D $3E $0C
    ldh  [hMultiPurposeG], a                      ;; 18:6A1F $E0 $E8
    call func_018_6A31                            ;; 18:6A21 $CD $31 $6A
    ld   a, $F4                                   ;; 18:6A24 $3E $F4
    ldh  [hMultiPurposeG], a                      ;; 18:6A26 $E0 $E8
    call func_018_6A31                            ;; 18:6A28 $CD $31 $6A
    call DidKillEnemy.label_3F5E                  ;; 18:6A2B $CD $5E $3F
    jp   ClearEntityStatusBank18                  ;; 18:6A2E $C3 $08 $7F

func_018_6A31::
    ld   a, ENTITY_VIRE                           ;; 18:6A31 $3E $BD
    call SpawnNewEntity_trampoline                ;; 18:6A33 $CD $86 $3B
    jr   c, .ret_6A70                             ;; 18:6A36 $38 $38

    ld   hl, wEntitiesLoadOrderTable              ;; 18:6A38 $21 $60 $C4
    add  hl, bc                                   ;; 18:6A3B $09
    ld   a, [hl]                                  ;; 18:6A3C $7E
    ld   hl, wEntitiesLoadOrderTable              ;; 18:6A3D $21 $60 $C4
    add  hl, de                                   ;; 18:6A40 $19
    ld   [hl], a                                  ;; 18:6A41 $77
    ldh  a, [hMultiPurpose0]                      ;; 18:6A42 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:6A44 $21 $00 $C2
    add  hl, de                                   ;; 18:6A47 $19
    ld   [hl], a                                  ;; 18:6A48 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:6A49 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 18:6A4B $21 $10 $C2
    add  hl, de                                   ;; 18:6A4E $19
    ld   [hl], a                                  ;; 18:6A4F $77
    ldh  a, [hMultiPurpose3]                      ;; 18:6A50 $F0 $DA
    ld   hl, wEntitiesPosZTable                   ;; 18:6A52 $21 $10 $C3
    add  hl, de                                   ;; 18:6A55 $19
    ld   [hl], a                                  ;; 18:6A56 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 18:6A57 $21 $B0 $C2
    add  hl, de                                   ;; 18:6A5A $19
    ld   [hl], $01                                ;; 18:6A5B $36 $01
    ldh  a, [hMultiPurposeG]                      ;; 18:6A5D $F0 $E8
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6A5F $21 $40 $C2
    add  hl, de                                   ;; 18:6A62 $19
    ld   [hl], a                                  ;; 18:6A63 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:6A64 $21 $E0 $C2
    add  hl, de                                   ;; 18:6A67 $19
    ld   [hl], $20                                ;; 18:6A68 $36 $20
    ld   hl, wEntitiesHealthTable                 ;; 18:6A6A $21 $60 $C3
    add  hl, de                                   ;; 18:6A6D $19
    ld   [hl], $01                                ;; 18:6A6E $36 $01

.ret_6A70
    ret                                           ;; 18:6A70 $C9

jr_018_6A71:
    call func_018_6EFB                            ;; 18:6A71 $CD $FB $6E
    ldh  a, [hMapRoom]                            ;; 18:6A74 $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 18:6A76 $21 $E0 $C3
    add  hl, bc                                   ;; 18:6A79 $09
    cp   [hl]                                     ;; 18:6A7A $BE
    jr   z, .jr_6A8B                              ;; 18:6A7B $28 $0E

    ldh  a, [hActiveEntityPosX]                   ;; 18:6A7D $F0 $EE
    cp   $98                                      ;; 18:6A7F $FE $98
    jp   nc, ClearEntityStatusBank18              ;; 18:6A81 $D2 $08 $7F

    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6A84 $F0 $EC
    cp   $70                                      ;; 18:6A86 $FE $70
    jp   nc, ClearEntityStatusBank18              ;; 18:6A88 $D2 $08 $7F

.jr_6A8B
    call ReturnIfNonInteractive_18                ;; 18:6A8B $CD $E8 $7D
    call ApplyRecoilIfNeeded_18                   ;; 18:6A8E $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ;; 18:6A91 $CD $5F $7E
    call AddEntityZSpeedToPos_18                  ;; 18:6A94 $CD $98 $7E
    ldh  a, [hActiveEntityState]                  ;; 18:6A97 $F0 $F0
    JP_TABLE                                      ;; 18:6A99
._00 dw VireState0Handler
._01 dw VireState1Handler
._02 dw VireState2Handler
._03 dw VireState3Handler
._04 dw VireState4Handler
._05 dw VireState5Handler
._06 dw VireState6Handler
._07 dw VireState7Handler

VireState0Handler::
    ld   hl, wEntitiesHealthTable                 ;; 18:6AAA $21 $60 $C3
    add  hl, bc                                   ;; 18:6AAD $09
    ld   [hl], $03                                ;; 18:6AAE $36 $03
    call GetEntityTransitionCountdown             ;; 18:6AB0 $CD $05 $0C
    ld   [hl], $C0                                ;; 18:6AB3 $36 $C0
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:6AB5 $21 $50 $C4
    add  hl, bc                                   ;; 18:6AB8 $09
    ld   [hl], $80                                ;; 18:6AB9 $36 $80
    call ClearEntitySpeed                         ;; 18:6ABB $CD $7F $3D
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6ABE $21 $40 $C2
    add  hl, bc                                   ;; 18:6AC1 $09
    ld   [hl], $08                                ;; 18:6AC2 $36 $08
    jp   IncrementEntityState                     ;; 18:6AC4 $C3 $12 $3B

Data_018_6AC7::
    db   $08

Data_018_6AC8::
    db   $F8, $08, $F8

VireState1Handler::
    call func_018_6E3B                            ;; 18:6ACB $CD $3B $6E
    call func_018_7EB2                            ;; 18:6ACE $CD $B2 $7E
    add  $1C                                      ;; 18:6AD1 $C6 $1C
    cp   $38                                      ;; 18:6AD3 $FE $38
    jr   nc, .jr_6B02                             ;; 18:6AD5 $30 $2B

    call func_018_7ED2                            ;; 18:6AD7 $CD $D2 $7E
    add  $20                                      ;; 18:6ADA $C6 $20
    cp   $40                                      ;; 18:6ADC $FE $40
    jr   nc, .jr_6B02                             ;; 18:6ADE $30 $22

    ld   a, $10                                   ;; 18:6AE0 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 18:6AE2 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 18:6AE5 $F0 $D7
    cpl                                           ;; 18:6AE7 $2F
    inc  a                                        ;; 18:6AE8 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6AE9 $21 $50 $C2
    add  hl, bc                                   ;; 18:6AEC $09
    ld   [hl], a                                  ;; 18:6AED $77
    ldh  a, [hMultiPurpose1]                      ;; 18:6AEE $F0 $D8
    cpl                                           ;; 18:6AF0 $2F
    inc  a                                        ;; 18:6AF1 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6AF2 $21 $40 $C2
    add  hl, bc                                   ;; 18:6AF5 $09
    ld   [hl], a                                  ;; 18:6AF6 $77
    call IncrementEntityState                     ;; 18:6AF7 $CD $12 $3B
    ld   [hl], $03                                ;; 18:6AFA $36 $03
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6AFC $21 $C0 $C2
    add  hl, bc                                   ;; 18:6AFF $09
    ld   [hl], $FF                                ;; 18:6B00 $36 $FF

.jr_6B02
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:6B02 $21 $50 $C4
    add  hl, bc                                   ;; 18:6B05 $09
    ld   a, [hl]                                  ;; 18:6B06 $7E
    and  a                                        ;; 18:6B07 $A7
    jr   nz, .jr_6B15                             ;; 18:6B08 $20 $0B

    call IncrementEntityState                     ;; 18:6B0A $CD $12 $3B
    ld   [hl], $02                                ;; 18:6B0D $36 $02
    call GetEntityTransitionCountdown             ;; 18:6B0F $CD $05 $0C
    ld   [hl], $20                                ;; 18:6B12 $36 $20
    ret                                           ;; 18:6B14 $C9

.jr_6B15
    ld   hl, wEntitiesSpeedZTable                 ;; 18:6B15 $21 $20 $C3
    add  hl, bc                                   ;; 18:6B18 $09
    ld   [hl], b                                  ;; 18:6B19 $70
    ld   hl, wEntitiesPosZTable                   ;; 18:6B1A $21 $10 $C3
    add  hl, bc                                   ;; 18:6B1D $09
    ld   a, [hl]                                  ;; 18:6B1E $7E
    sub  $28                                      ;; 18:6B1F $D6 $28
    jr   z, jr_018_6B30                           ;; 18:6B21 $28 $0D

    ld   e, $08                                   ;; 18:6B23 $1E $08
    and  $80                                      ;; 18:6B25 $E6 $80
    jr   nz, .jr_6B2B                             ;; 18:6B27 $20 $02

    ld   e, $F8                                   ;; 18:6B29 $1E $F8

.jr_6B2B
    ld   hl, wEntitiesSpeedZTable                 ;; 18:6B2B $21 $20 $C3
    add  hl, bc                                   ;; 18:6B2E $09
    ld   [hl], e                                  ;; 18:6B2F $73

jr_018_6B30:
    ld   hl, wEntitiesCollisionsTable             ;; 18:6B30 $21 $A0 $C2
    add  hl, bc                                   ;; 18:6B33 $09
    ld   a, [hl]                                  ;; 18:6B34 $7E
    and  $03                                      ;; 18:6B35 $E6 $03
    jr   z, .jr_6B4B                              ;; 18:6B37 $28 $12

    ld   e, a                                     ;; 18:6B39 $5F
    ld   d, b                                     ;; 18:6B3A $50
    ld   hl, Data_018_6AC8                        ;; 18:6B3B $21 $C8 $6A
    add  hl, de                                   ;; 18:6B3E $19
    ld   a, [hl]                                  ;; 18:6B3F $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6B40 $21 $50 $C2
    add  hl, bc                                   ;; 18:6B43 $09
    ld   [hl], a                                  ;; 18:6B44 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6B45 $21 $40 $C2
    add  hl, bc                                   ;; 18:6B48 $09
    ld   [hl], $00                                ;; 18:6B49 $36 $00

.jr_6B4B
    ld   hl, wEntitiesCollisionsTable             ;; 18:6B4B $21 $A0 $C2
    add  hl, bc                                   ;; 18:6B4E $09
    ld   a, [hl]                                  ;; 18:6B4F $7E
    rra                                           ;; 18:6B50 $1F
    rra                                           ;; 18:6B51 $1F
    and  $03                                      ;; 18:6B52 $E6 $03
    jr   z, .jr_6B68                              ;; 18:6B54 $28 $12

    ld   e, a                                     ;; 18:6B56 $5F
    ld   d, b                                     ;; 18:6B57 $50
    ld   hl, Data_018_6AC7 - 1                    ;; 18:6B58 $21 $C6 $6A
    add  hl, de                                   ;; 18:6B5B $19
    ld   a, [hl]                                  ;; 18:6B5C $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6B5D $21 $40 $C2
    add  hl, bc                                   ;; 18:6B60 $09
    ld   [hl], a                                  ;; 18:6B61 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6B62 $21 $50 $C2
    add  hl, bc                                   ;; 18:6B65 $09
    ld   [hl], $00                                ;; 18:6B66 $36 $00

.jr_6B68
    call GetEntityTransitionCountdown             ;; 18:6B68 $CD $05 $0C
    jr   nz, .jr_6B7B                             ;; 18:6B6B $20 $0E

    call GetRandomByte                            ;; 18:6B6D $CD $0D $28
    and  $7F                                      ;; 18:6B70 $E6 $7F
    add  $40                                      ;; 18:6B72 $C6 $40
    ld   [hl], a                                  ;; 18:6B74 $77
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 18:6B75 $21 $F0 $C2
    add  hl, bc                                   ;; 18:6B78 $09
    ld   [hl], $10                                ;; 18:6B79 $36 $10

.jr_6B7B
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 18:6B7B $21 $F0 $C2
    add  hl, bc                                   ;; 18:6B7E $09
    ld   a, [hl]                                  ;; 18:6B7F $7E
    and  a                                        ;; 18:6B80 $A7
    jr   z, jr_018_6B8F                           ;; 18:6B81 $28 $0C

    cp   $08                                      ;; 18:6B83 $FE $08
    jr   nz, .jr_6B8A                             ;; 18:6B85 $20 $03

    call func_018_6D98                            ;; 18:6B87 $CD $98 $6D

.jr_6B8A
    ld   a, $02                                   ;; 18:6B8A $3E $02
    jp   SetEntitySpriteVariant                   ;; 18:6B8C $C3 $0C $3B

jr_018_6B8F:
    call func_018_6E57                            ;; 18:6B8F $CD $57 $6E

label_018_6B92:
    ldh  a, [hFrameCounter]                       ;; 18:6B92 $F0 $E7
    rra                                           ;; 18:6B94 $1F
    rra                                           ;; 18:6B95 $1F
    rra                                           ;; 18:6B96 $1F
    and  $01                                      ;; 18:6B97 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 18:6B99 $C3 $0C $3B

VireState2Handler::
    call GetEntityTransitionCountdown             ;; 18:6B9C $CD $05 $0C
    jr   nz, jr_018_6BD4                          ;; 18:6B9F $20 $33

    call IncrementEntityState                     ;; 18:6BA1 $CD $12 $3B
    ld   [hl], $03                                ;; 18:6BA4 $36 $03
    ldh  a, [hLinkPositionY]                      ;; 18:6BA6 $F0 $99
    push af                                       ;; 18:6BA8 $F5
    sub  $14                                      ;; 18:6BA9 $D6 $14
    ldh  [hLinkPositionY], a                      ;; 18:6BAB $E0 $99
    ld   a, $20                                   ;; 18:6BAD $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 18:6BAF $CD $AA $3B
    pop  af                                       ;; 18:6BB2 $F1
    ldh  [hLinkPositionY], a                      ;; 18:6BB3 $E0 $99
    ld   hl, wEntitiesSpeedZTable                 ;; 18:6BB5 $21 $20 $C3
    add  hl, bc                                   ;; 18:6BB8 $09
    ld   [hl], $EC                                ;; 18:6BB9 $36 $EC
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:6BBB $21 $50 $C4
    add  hl, bc                                   ;; 18:6BBE $09
    ld   [hl], $30                                ;; 18:6BBF $36 $30
    call GetRandomByte                            ;; 18:6BC1 $CD $0D $28
    and  $03                                      ;; 18:6BC4 $E6 $03
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6BC6 $21 $C0 $C2
    add  hl, bc                                   ;; 18:6BC9 $09
    ld   [hl], a                                  ;; 18:6BCA $77
    and  a                                        ;; 18:6BCB $A7
    jr   nz, .ret_6BD3                            ;; 18:6BCC $20 $05

    call GetEntityTransitionCountdown             ;; 18:6BCE $CD $05 $0C
    ld   [hl], $10                                ;; 18:6BD1 $36 $10

.ret_6BD3
    ret                                           ;; 18:6BD3 $C9

jr_018_6BD4:
    call func_018_6CD3                            ;; 18:6BD4 $CD $D3 $6C
    ld   a, $02                                   ;; 18:6BD7 $3E $02
    jp   SetEntitySpriteVariant                   ;; 18:6BD9 $C3 $0C $3B

VireState3Handler::
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6BDC $21 $C0 $C2
    add  hl, bc                                   ;; 18:6BDF $09
    ld   a, [hl]                                  ;; 18:6BE0 $7E
    cp   $FF                                      ;; 18:6BE1 $FE $FF
    jr   z, .jr_6C27                              ;; 18:6BE3 $28 $42

    call func_018_7EB2                            ;; 18:6BE5 $CD $B2 $7E
    add  $18                                      ;; 18:6BE8 $C6 $18
    cp   $30                                      ;; 18:6BEA $FE $30
    jr   nc, .jr_6C27                             ;; 18:6BEC $30 $39

    call func_018_7ED2                            ;; 18:6BEE $CD $D2 $7E
    add  $18                                      ;; 18:6BF1 $C6 $18
    cp   $30                                      ;; 18:6BF3 $FE $30
    jr   nc, .jr_6C27                             ;; 18:6BF5 $30 $30

    ld   hl, wEntitiesFlashCountdownTable         ;; 18:6BF7 $21 $20 $C4
    add  hl, bc                                   ;; 18:6BFA $09
    ld   a, [hl]                                  ;; 18:6BFB $7E
    and  a                                        ;; 18:6BFC $A7
    jr   nz, .jr_6C27                             ;; 18:6BFD $20 $28
    ; if wSwordAnimationState == SWORD_ANIMATION_STATE_NONE jump to .jr_6C27
    ld   a, [wSwordAnimationState]                ;; 18:6BFF $FA $37 $C1
    and  a                                        ;; 18:6C02 $A7
    jr   z, .jr_6C27                              ;; 18:6C03 $28 $22

    ld   a, $20                                   ;; 18:6C05 $3E $20
    call GetVectorTowardsLink_trampoline          ;; 18:6C07 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 18:6C0A $F0 $D7
    cpl                                           ;; 18:6C0C $2F
    inc  a                                        ;; 18:6C0D $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6C0E $21 $50 $C2
    add  hl, bc                                   ;; 18:6C11 $09
    ld   [hl], a                                  ;; 18:6C12 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:6C13 $F0 $D8
    cpl                                           ;; 18:6C15 $2F
    inc  a                                        ;; 18:6C16 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6C17 $21 $40 $C2
    add  hl, bc                                   ;; 18:6C1A $09
    ld   [hl], a                                  ;; 18:6C1B $77
    call GetEntityTransitionCountdown             ;; 18:6C1C $CD $05 $0C
    ld   [hl], $0B                                ;; 18:6C1F $36 $0B
    call IncrementEntityState                     ;; 18:6C21 $CD $12 $3B
    ld   [hl], $06                                ;; 18:6C24 $36 $06
    ret                                           ;; 18:6C26 $C9

.jr_6C27
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6C27 $21 $C0 $C2
    add  hl, bc                                   ;; 18:6C2A $09
    ld   a, [hl]                                  ;; 18:6C2B $7E
    cp   $FF                                      ;; 18:6C2C $FE $FF
    jr   z, .jr_6C38                              ;; 18:6C2E $28 $08

    and  a                                        ;; 18:6C30 $A7
    jr   nz, jr_018_6C63                          ;; 18:6C31 $20 $30

    call GetEntityTransitionCountdown             ;; 18:6C33 $CD $05 $0C
    jr   nz, jr_018_6C63                          ;; 18:6C36 $20 $2B

.jr_6C38
    ld   a, $20                                   ;; 18:6C38 $3E $20
    call GetVectorTowardsLink_trampoline          ;; 18:6C3A $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 18:6C3D $F0 $D7
    cpl                                           ;; 18:6C3F $2F
    inc  a                                        ;; 18:6C40 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6C41 $21 $50 $C2
    add  hl, bc                                   ;; 18:6C44 $09
    sub  [hl]                                     ;; 18:6C45 $96
    and  $80                                      ;; 18:6C46 $E6 $80
    jr   nz, .jr_6C4E                             ;; 18:6C48 $20 $04

    inc  [hl]                                     ;; 18:6C4A $34
    inc  [hl]                                     ;; 18:6C4B $34
    inc  [hl]                                     ;; 18:6C4C $34
    inc  [hl]                                     ;; 18:6C4D $34

.jr_6C4E
    dec  [hl]                                     ;; 18:6C4E $35
    dec  [hl]                                     ;; 18:6C4F $35
    ldh  a, [hMultiPurpose1]                      ;; 18:6C50 $F0 $D8
    cpl                                           ;; 18:6C52 $2F
    inc  a                                        ;; 18:6C53 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6C54 $21 $40 $C2
    add  hl, bc                                   ;; 18:6C57 $09
    sub  [hl]                                     ;; 18:6C58 $96
    and  $80                                      ;; 18:6C59 $E6 $80
    jr   nz, .jr_6C61                             ;; 18:6C5B $20 $04

    inc  [hl]                                     ;; 18:6C5D $34
    inc  [hl]                                     ;; 18:6C5E $34
    inc  [hl]                                     ;; 18:6C5F $34
    inc  [hl]                                     ;; 18:6C60 $34

.jr_6C61
    dec  [hl]                                     ;; 18:6C61 $35
    dec  [hl]                                     ;; 18:6C62 $35

jr_018_6C63:
    ld   hl, wEntitiesPosZTable                   ;; 18:6C63 $21 $10 $C3
    add  hl, bc                                   ;; 18:6C66 $09
    ld   a, [hl]                                  ;; 18:6C67 $7E
    cp   $40                                      ;; 18:6C68 $FE $40
    jr   c, .jr_6C78                              ;; 18:6C6A $38 $0C

    ld   hl, wEntitiesSpeedZTable                 ;; 18:6C6C $21 $20 $C3
    add  hl, bc                                   ;; 18:6C6F $09
    ld   a, [hl]                                  ;; 18:6C70 $7E
    and  $80                                      ;; 18:6C71 $E6 $80
    jr   nz, .jr_6C78                             ;; 18:6C73 $20 $03

    ld   [hl], b                                  ;; 18:6C75 $70
    jr   jr_018_6C88                              ;; 18:6C76 $18 $10

.jr_6C78
    ld   hl, wEntitiesSpeedZTable                 ;; 18:6C78 $21 $20 $C3
    add  hl, bc                                   ;; 18:6C7B $09
    ldh  a, [hFrameCounter]                       ;; 18:6C7C $F0 $E7
    and  $01                                      ;; 18:6C7E $E6 $01
    jr   nz, .jr_6C83                             ;; 18:6C80 $20 $01

    inc  [hl]                                     ;; 18:6C82 $34

.jr_6C83
    ld   a, [hl]                                  ;; 18:6C83 $7E
    and  $80                                      ;; 18:6C84 $E6 $80
    jr   nz, func_018_6CB8                        ;; 18:6C86 $20 $30

jr_018_6C88:
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:6C88 $21 $50 $C4
    add  hl, bc                                   ;; 18:6C8B $09
    ld   a, [hl]                                  ;; 18:6C8C $7E
    and  a                                        ;; 18:6C8D $A7
    jr   z, .jr_6CA0                              ;; 18:6C8E $28 $10

    ldh  a, [hActiveEntityPosX]                   ;; 18:6C90 $F0 $EE
    cp   $A8                                      ;; 18:6C92 $FE $A8
    jr   nc, .jr_6CA0                             ;; 18:6C94 $30 $0A

    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6C96 $F0 $EC
    cp   $90                                      ;; 18:6C98 $FE $90
    jr   c, func_018_6CB8                         ;; 18:6C9A $38 $1C

    cp   $C0                                      ;; 18:6C9C $FE $C0
    jr   nc, func_018_6CB8                        ;; 18:6C9E $30 $18

.jr_6CA0
    call IncrementEntityState                     ;; 18:6CA0 $CD $12 $3B
    ld   [hl], $04                                ;; 18:6CA3 $36 $04
    call func_018_6CD3                            ;; 18:6CA5 $CD $D3 $6C
    call GetEntityTransitionCountdown             ;; 18:6CA8 $CD $05 $0C
    call GetRandomByte                            ;; 18:6CAB $CD $0D $28
    and  $3F                                      ;; 18:6CAE $E6 $3F
    add  $20                                      ;; 18:6CB0 $C6 $20
    ld   [hl], a                                  ;; 18:6CB2 $77
    ld   a, $FF                                   ;; 18:6CB3 $3E $FF
    jp   SetEntitySpriteVariant                   ;; 18:6CB5 $C3 $0C $3B

func_018_6CB8::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 18:6CB8 $CD $39 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 18:6CBB $21 $20 $C4
    add  hl, bc                                   ;; 18:6CBE $09
    ld   a, [hl]                                  ;; 18:6CBF $7E
    and  a                                        ;; 18:6CC0 $A7
    jr   z, .jr_6CCD                              ;; 18:6CC1 $28 $0A

    call ClearEntitySpeed                         ;; 18:6CC3 $CD $7F $3D
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6CC6 $21 $C0 $C2
    add  hl, bc                                   ;; 18:6CC9 $09
    ld   [hl], $FF                                ;; 18:6CCA $36 $FF
    ret                                           ;; 18:6CCC $C9

.jr_6CCD
    call func_018_6E57                            ;; 18:6CCD $CD $57 $6E
    jp   label_018_6B92                           ;; 18:6CD0 $C3 $92 $6B

func_018_6CD3::
    call ClearEntitySpeed                         ;; 18:6CD3 $CD $7F $3D
    ld   hl, wEntitiesSpeedZTable                 ;; 18:6CD6 $21 $20 $C3
    add  hl, bc                                   ;; 18:6CD9 $09
    ld   [hl], b                                  ;; 18:6CDA $70
    ret                                           ;; 18:6CDB $C9

Data_018_6CDC::
    db   $00, $00, $D0, $D0, $40, $40, $80, $80

Data_018_6CE4::
    db   $08, $98, $38, $78, $F8, $A8, $F8, $A8

VireState4Handler::
    call GetEntityTransitionCountdown             ;; 18:6CEC $CD $05 $0C
    jr   nz, .ret_6D17                            ;; 18:6CEF $20 $26

    ld   hl, wEntitiesPosZTable                   ;; 18:6CF1 $21 $10 $C3
    add  hl, bc                                   ;; 18:6CF4 $09
    ld   [hl], $28                                ;; 18:6CF5 $36 $28
    call IncrementEntityState                     ;; 18:6CF7 $CD $12 $3B
    ld   [hl], $05                                ;; 18:6CFA $36 $05
    call GetRandomByte                            ;; 18:6CFC $CD $0D $28
    and  $07                                      ;; 18:6CFF $E6 $07
    ld   e, a                                     ;; 18:6D01 $5F
    ld   d, b                                     ;; 18:6D02 $50
    ld   hl, Data_018_6CDC                        ;; 18:6D03 $21 $DC $6C
    add  hl, de                                   ;; 18:6D06 $19
    ld   a, [hl]                                  ;; 18:6D07 $7E
    ld   hl, wEntitiesPosYTable                   ;; 18:6D08 $21 $10 $C2
    add  hl, bc                                   ;; 18:6D0B $09
    ld   [hl], a                                  ;; 18:6D0C $77
    ld   hl, Data_018_6CE4                        ;; 18:6D0D $21 $E4 $6C
    add  hl, de                                   ;; 18:6D10 $19
    ld   a, [hl]                                  ;; 18:6D11 $7E
    ld   hl, wEntitiesPosXTable                   ;; 18:6D12 $21 $00 $C2
    add  hl, bc                                   ;; 18:6D15 $09
    ld   [hl], a                                  ;; 18:6D16 $77

.ret_6D17
    ret                                           ;; 18:6D17 $C9

VireState5Handler::
    ld   a, $08                                   ;; 18:6D18 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 18:6D1A $CD $AA $3B
    ldh  a, [hActiveEntityPosX]                   ;; 18:6D1D $F0 $EE
    cp   $09                                      ;; 18:6D1F $FE $09
    jr   c, .jr_6D52                              ;; 18:6D21 $38 $2F

    cp   $97                                      ;; 18:6D23 $FE $97
    jr   nc, .jr_6D52                             ;; 18:6D25 $30 $2B

    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6D27 $F0 $EC
    cp   $20                                      ;; 18:6D29 $FE $20
    jr   c, .jr_6D52                              ;; 18:6D2B $38 $25

    cp   $70                                      ;; 18:6D2D $FE $70
    jr   nc, .jr_6D52                             ;; 18:6D2F $30 $21

    call IncrementEntityState                     ;; 18:6D31 $CD $12 $3B
    ld   [hl], $01                                ;; 18:6D34 $36 $01
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:6D36 $21 $50 $C4
    add  hl, bc                                   ;; 18:6D39 $09
    call GetRandomByte                            ;; 18:6D3A $CD $0D $28
    and  $3F                                      ;; 18:6D3D $E6 $3F
    add  $20                                      ;; 18:6D3F $C6 $20
    ld   [hl], a                                  ;; 18:6D41 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6D42 $21 $40 $C2
    add  hl, bc                                   ;; 18:6D45 $09
    ld   a, [hl]                                  ;; 18:6D46 $7E
    cpl                                           ;; 18:6D47 $2F
    inc  a                                        ;; 18:6D48 $3C
    ld   [hl], a                                  ;; 18:6D49 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6D4A $21 $50 $C2
    add  hl, bc                                   ;; 18:6D4D $09
    ld   a, [hl]                                  ;; 18:6D4E $7E
    cpl                                           ;; 18:6D4F $2F
    inc  a                                        ;; 18:6D50 $3C
    ld   [hl], a                                  ;; 18:6D51 $77

.jr_6D52
    jp   label_018_6B92                           ;; 18:6D52 $C3 $92 $6B

Data_018_6D55::
    db   $00, $09, $12, $15

Data_018_6D59::
    db   $18, $15, $12, $09, $00, $F7, $EE, $EB, $E8, $EB, $EE, $F7, $00, $09, $12, $15

VireState6Handler::
    call GetEntityTransitionCountdown             ;; 18:6D69 $CD $05 $0C
    jr   nz, jr_018_6D78                          ;; 18:6D6C $20 $0A

    ld   [hl], $20                                ;; 18:6D6E $36 $20

.jr_6D70
    call IncrementEntityState                     ;; 18:6D70 $CD $12 $3B
    ld   [hl], $07                                ;; 18:6D73 $36 $07
    jp   func_018_6CD3                            ;; 18:6D75 $C3 $D3 $6C

jr_018_6D78:
    cp   $08                                      ;; 18:6D78 $FE $08
    jr   c, .jr_6D7F                              ;; 18:6D7A $38 $03

    call func_018_6CB8                            ;; 18:6D7C $CD $B8 $6C

.jr_6D7F
    jp   label_018_6B92                           ;; 18:6D7F $C3 $92 $6B

VireState7Handler::
    call GetEntityTransitionCountdown             ;; 18:6D82 $CD $05 $0C
    jr   nz, .jr_6D93                             ;; 18:6D85 $20 $0C

    ld   hl, wEntitiesPrivateState2Table          ;; 18:6D87 $21 $C0 $C2
    add  hl, bc                                   ;; 18:6D8A $09
    ld   [hl], $FF                                ;; 18:6D8B $36 $FF
    call IncrementEntityState                     ;; 18:6D8D $CD $12 $3B
    ld   [hl], $03                                ;; 18:6D90 $36 $03
    ret                                           ;; 18:6D92 $C9

.jr_6D93
    cp   $08                                      ;; 18:6D93 $FE $08
    jp   nz, label_018_6E36                       ;; 18:6D95 $C2 $36 $6E

func_018_6D98::
    ld   a, NOISE_SFX_MAGIC_ROD                   ;; 18:6D98 $3E $0D
    ldh  [hNoiseSfx], a                           ;; 18:6D9A $E0 $F4
    ldh  a, [hLinkPositionY]                      ;; 18:6D9C $F0 $99
    push af                                       ;; 18:6D9E $F5
    sub  $08                                      ;; 18:6D9F $D6 $08
    ldh  [hLinkPositionY], a                      ;; 18:6DA1 $E0 $99
    ld   a, $1F                                   ;; 18:6DA3 $3E $1F
    call GetVectorTowardsLink_trampoline          ;; 18:6DA5 $CD $B5 $3B
    pop  af                                       ;; 18:6DA8 $F1
    ldh  [hLinkPositionY], a                      ;; 18:6DA9 $E0 $99
    call func_018_7B9D                            ;; 18:6DAB $CD $9D $7B
    and  $0F                                      ;; 18:6DAE $E6 $0F
    ldh  [hMultiPurposeG], a                      ;; 18:6DB0 $E0 $E8
    ld   e, $00                                   ;; 18:6DB2 $1E $00
    call func_018_6DB9                            ;; 18:6DB4 $CD $B9 $6D
    ld   e, $01                                   ;; 18:6DB7 $1E $01

func_018_6DB9::
    ldh  a, [hMultiPurposeG]                      ;; 18:6DB9 $F0 $E8
    add  e                                        ;; 18:6DBB $83
    and  $0F                                      ;; 18:6DBC $E6 $0F
    ldh  [hMultiPurposeG], a                      ;; 18:6DBE $E0 $E8
    ld   e, $0F                                   ;; 18:6DC0 $1E $0F
    ld   d, b                                     ;; 18:6DC2 $50

jr_018_6DC3:
    ld   hl, wEntitiesStatusTable                 ;; 18:6DC3 $21 $80 $C2
    add  hl, de                                   ;; 18:6DC6 $19
    ld   a, [hl]                                  ;; 18:6DC7 $7E
    and  a                                        ;; 18:6DC8 $A7
    jr   z, .jr_6DDE                              ;; 18:6DC9 $28 $13

    ld   hl, wEntitiesTypeTable                   ;; 18:6DCB $21 $A0 $C3
    add  hl, de                                   ;; 18:6DCE $19
    ld   a, [hl]                                  ;; 18:6DCF $7E
    cp   $BD                                      ;; 18:6DD0 $FE $BD
    jr   nz, .jr_6DDE                             ;; 18:6DD2 $20 $0A

    ld   hl, wEntitiesPrivateState1Table          ;; 18:6DD4 $21 $B0 $C2
    add  hl, de                                   ;; 18:6DD7 $19
    ld   a, [hl]                                  ;; 18:6DD8 $7E
    cp   $02                                      ;; 18:6DD9 $FE $02
    jr   nz, .jr_6DDE                             ;; 18:6DDB $20 $01

    inc  b                                        ;; 18:6DDD $04

.jr_6DDE
    dec  e                                        ;; 18:6DDE $1D
    ld   a, e                                     ;; 18:6DDF $7B
    cp   $FF                                      ;; 18:6DE0 $FE $FF
    jr   nz, jr_018_6DC3                          ;; 18:6DE2 $20 $DF

    ld   a, b                                     ;; 18:6DE4 $78
    ld   b, $00                                   ;; 18:6DE5 $06 $00
    cp   $03                                      ;; 18:6DE7 $FE $03
    jr   nc, .ret_6E35                            ;; 18:6DE9 $30 $4A

    ld   a, ENTITY_VIRE                           ;; 18:6DEB $3E $BD
    call SpawnNewEntity_trampoline                ;; 18:6DED $CD $86 $3B
    jr   c, .ret_6E35                             ;; 18:6DF0 $38 $43

    ldh  a, [hMultiPurpose0]                      ;; 18:6DF2 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 18:6DF4 $21 $00 $C2
    add  hl, de                                   ;; 18:6DF7 $19
    ld   [hl], a                                  ;; 18:6DF8 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:6DF9 $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 18:6DFB $21 $DA $FF
    sub  [hl]                                     ;; 18:6DFE $96
    ld   hl, wEntitiesPosYTable                   ;; 18:6DFF $21 $10 $C2
    add  hl, de                                   ;; 18:6E02 $19
    ld   [hl], a                                  ;; 18:6E03 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 18:6E04 $21 $B0 $C2
    add  hl, de                                   ;; 18:6E07 $19
    ld   [hl], $02                                ;; 18:6E08 $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:6E0A $21 $40 $C3
    add  hl, de                                   ;; 18:6E0D $19
    ld   [hl], 2                                  ;; 18:6E0E $36 $02
    ld   hl, wEntitiesHealthTable                 ;; 18:6E10 $21 $60 $C3
    add  hl, de                                   ;; 18:6E13 $19
    ld   [hl], $4C                                ;; 18:6E14 $36 $4C
    push bc                                       ;; 18:6E16 $C5
    ldh  a, [hMultiPurposeG]                      ;; 18:6E17 $F0 $E8
    ld   c, a                                     ;; 18:6E19 $4F
    ld   hl, Data_018_6D59                        ;; 18:6E1A $21 $59 $6D
    add  hl, bc                                   ;; 18:6E1D $09
    ld   a, [hl]                                  ;; 18:6E1E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6E1F $21 $40 $C2
    add  hl, de                                   ;; 18:6E22 $19
    ld   [hl], a                                  ;; 18:6E23 $77
    ld   hl, Data_018_6D55                        ;; 18:6E24 $21 $55 $6D
    add  hl, bc                                   ;; 18:6E27 $09
    ld   a, [hl]                                  ;; 18:6E28 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6E29 $21 $50 $C2
    add  hl, de                                   ;; 18:6E2C $19
    ld   [hl], a                                  ;; 18:6E2D $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:6E2E $21 $E0 $C2
    add  hl, de                                   ;; 18:6E31 $19
    ld   [hl], $20                                ;; 18:6E32 $36 $20
    pop  bc                                       ;; 18:6E34 $C1

.ret_6E35
    ret                                           ;; 18:6E35 $C9

label_018_6E36:
    ld   a, $02                                   ;; 18:6E36 $3E $02
    jp   SetEntitySpriteVariant                   ;; 18:6E38 $C3 $0C $3B

func_018_6E3B::
    ld   hl, wEntitiesPosYTable                   ;; 18:6E3B $21 $10 $C2
    add  hl, bc                                   ;; 18:6E3E $09
    ld   a, [hl]                                  ;; 18:6E3F $7E
    sub  $28                                      ;; 18:6E40 $D6 $28
    ld   [hl], a                                  ;; 18:6E42 $77
    ldh  a, [hActiveEntityPosY]                   ;; 18:6E43 $F0 $EF
    sub  $28                                      ;; 18:6E45 $D6 $28
    ldh  [hActiveEntityPosY], a                   ;; 18:6E47 $E0 $EF
    call ApplyEntityInteractionWithBackground_trampoline ;; 18:6E49 $CD $23 $3B
    ld   hl, wEntitiesPosYTable                   ;; 18:6E4C $21 $10 $C2
    add  hl, bc                                   ;; 18:6E4F $09
    ld   a, [hl]                                  ;; 18:6E50 $7E
    add  $28                                      ;; 18:6E51 $C6 $28
    ld   [hl], a                                  ;; 18:6E53 $77
    jp   CopyEntityPositionToActivePosition       ;; 18:6E54 $C3 $8A $3D

func_018_6E57::
    ld   e, $0F                                   ;; 18:6E57 $1E $0F

jr_018_6E59:
    ld   d, b                                     ;; 18:6E59 $50
    ld   hl, wEntitiesStatusTable                 ;; 18:6E5A $21 $80 $C2
    add  hl, de                                   ;; 18:6E5D $19
    ld   a, [hl]                                  ;; 18:6E5E $7E
    cp   $05                                      ;; 18:6E5F $FE $05
    jr   nz, jr_018_6ED0                          ;; 18:6E61 $20 $6D

    ld   hl, wEntitiesTypeTable                   ;; 18:6E63 $21 $A0 $C3
    add  hl, de                                   ;; 18:6E66 $19
    ld   a, [hl]                                  ;; 18:6E67 $7E
    cp   $03                                      ;; 18:6E68 $FE $03
    jr   z, .jr_6E74                              ;; 18:6E6A $28 $08

    cp   $00                                      ;; 18:6E6C $FE $00
    jr   z, .jr_6E74                              ;; 18:6E6E $28 $04

    cp   $02                                      ;; 18:6E70 $FE $02
    jr   nz, jr_018_6ED0                          ;; 18:6E72 $20 $5C

.jr_6E74
    ld   hl, wEntitiesPosXTable                   ;; 18:6E74 $21 $00 $C2
    add  hl, de                                   ;; 18:6E77 $19
    ldh  a, [hActiveEntityPosX]                   ;; 18:6E78 $F0 $EE
    sub  [hl]                                     ;; 18:6E7A $96
    add  $18                                      ;; 18:6E7B $C6 $18
    cp   $30                                      ;; 18:6E7D $FE $30
    jr   nc, jr_018_6ED0                          ;; 18:6E7F $30 $4F

    ld   hl, wEntitiesPosYTable                   ;; 18:6E81 $21 $10 $C2
    add  hl, de                                   ;; 18:6E84 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6E85 $F0 $EC
    sub  [hl]                                     ;; 18:6E87 $96
    add  $20                                      ;; 18:6E88 $C6 $20
    cp   $40                                      ;; 18:6E8A $FE $40
    jr   nc, jr_018_6ED0                          ;; 18:6E8C $30 $42

    ldh  a, [hLinkPositionY]                      ;; 18:6E8E $F0 $99
    push af                                       ;; 18:6E90 $F5
    ldh  a, [hLinkPositionX]                      ;; 18:6E91 $F0 $98
    push af                                       ;; 18:6E93 $F5
    ld   a, [hl]                                  ;; 18:6E94 $7E
    ldh  [hLinkPositionY], a                      ;; 18:6E95 $E0 $99
    ld   hl, wEntitiesPosXTable                   ;; 18:6E97 $21 $00 $C2
    add  hl, de                                   ;; 18:6E9A $19
    ld   a, [hl]                                  ;; 18:6E9B $7E
    ldh  [hLinkPositionX], a                      ;; 18:6E9C $E0 $98
    push de                                       ;; 18:6E9E $D5
    ld   a, $20                                   ;; 18:6E9F $3E $20
    call GetVectorTowardsLink_trampoline          ;; 18:6EA1 $CD $B5 $3B
    pop  de                                       ;; 18:6EA4 $D1
    ldh  a, [hMultiPurpose1]                      ;; 18:6EA5 $F0 $D8
    cpl                                           ;; 18:6EA7 $2F
    inc  a                                        ;; 18:6EA8 $3C
    jr   nz, .jr_6EAD                             ;; 18:6EA9 $20 $02

    ld   a, $20                                   ;; 18:6EAB $3E $20

.jr_6EAD
    ld   hl, wEntitiesSpeedXTable                 ;; 18:6EAD $21 $40 $C2
    add  hl, bc                                   ;; 18:6EB0 $09
    ld   [hl], a                                  ;; 18:6EB1 $77
    ldh  a, [hMultiPurpose0]                      ;; 18:6EB2 $F0 $D7
    cpl                                           ;; 18:6EB4 $2F
    inc  a                                        ;; 18:6EB5 $3C
    jr   nz, .jr_6EBA                             ;; 18:6EB6 $20 $02

    ld   a, $20                                   ;; 18:6EB8 $3E $20

.jr_6EBA
    ld   hl, wEntitiesSpeedYTable                 ;; 18:6EBA $21 $50 $C2
    add  hl, bc                                   ;; 18:6EBD $09
    ld   [hl], a                                  ;; 18:6EBE $77
    pop  af                                       ;; 18:6EBF $F1
    ldh  [hLinkPositionX], a                      ;; 18:6EC0 $E0 $98
    pop  af                                       ;; 18:6EC2 $F1
    ldh  [hLinkPositionY], a                      ;; 18:6EC3 $E0 $99
    call IncrementEntityState                     ;; 18:6EC5 $CD $12 $3B
    ld   [hl], $03                                ;; 18:6EC8 $36 $03
    ld   hl, wEntitiesPrivateState2Table          ;; 18:6ECA $21 $C0 $C2
    add  hl, bc                                   ;; 18:6ECD $09
    ld   [hl], $01                                ;; 18:6ECE $36 $01

jr_018_6ED0:
    dec  e                                        ;; 18:6ED0 $1D
    ld   a, e                                     ;; 18:6ED1 $7B
    cp   $FF                                      ;; 18:6ED2 $FE $FF
    jr   nz, jr_018_6E59                          ;; 18:6ED4 $20 $83

    ret                                           ;; 18:6ED6 $C9

Data_018_6ED7::
    db   $00, $FC, $60, $02, $00, $04, $62, $02, $00, $0C, $60, $22, $00, $FC, $64, $02
    db   $00, $04, $66, $02, $00, $0C, $64, $22, $00, $FC, $68, $02, $00, $04, $6A, $02
    db   $00, $0C, $68, $22

func_018_6EFB::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:6EFB $F0 $F1
    cp   $FF                                      ;; 18:6EFD $FE $FF
    ret  z                                        ;; 18:6EFF $C8

    rla                                           ;; 18:6F00 $17
    rla                                           ;; 18:6F01 $17
    and  $FC                                      ;; 18:6F02 $E6 $FC
    ld   e, a                                     ;; 18:6F04 $5F
    rla                                           ;; 18:6F05 $17
    and  $F8                                      ;; 18:6F06 $E6 $F8
    add  e                                        ;; 18:6F08 $83
    ld   e, a                                     ;; 18:6F09 $5F
    ld   d, b                                     ;; 18:6F0A $50
    ld   hl, Data_018_6ED7                        ;; 18:6F0B $21 $D7 $6E
    add  hl, de                                   ;; 18:6F0E $19
    ld   c, $03                                   ;; 18:6F0F $0E $03
    call RenderActiveEntitySpritesRect            ;; 18:6F11 $CD $E6 $3C
    jp   label_3CD9                               ;; 18:6F14 $C3 $D9 $3C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Vire1SpriteVariants::
.variant0
    db $1E, OAM_GBC_PAL_3 | OAMF_PAL0
    db $1E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant1
    db $1E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $1E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

label_018_6F1F:
    ld   de, Vire1SpriteVariants                  ;; 18:6F1F $11 $17 $6F
    call RenderActiveEntitySpritesPair            ;; 18:6F22 $CD $C0 $3B
    call ReturnIfNonInteractive_18                ;; 18:6F25 $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 18:6F28 $CD $56 $0C
    ldh  a, [hFrameCounter]                       ;; 18:6F2B $F0 $E7
    rra                                           ;; 18:6F2D $1F
    rra                                           ;; 18:6F2E $1F
    and  $01                                      ;; 18:6F2F $E6 $01
    call SetEntitySpriteVariant                   ;; 18:6F31 $CD $0C $3B
    call label_3B70                               ;; 18:6F34 $CD $70 $3B
    call label_3B44                               ;; 18:6F37 $CD $44 $3B
    jr   c, .jr_6F51                              ;; 18:6F3A $38 $15

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 18:6F3C $21 $10 $C4
    add  hl, bc                                   ;; 18:6F3F $09
    ld   a, [hl]                                  ;; 18:6F40 $7E
    and  a                                        ;; 18:6F41 $A7
    jr   z, jr_018_6F54                           ;; 18:6F42 $28 $10

    ldh  a, [hActiveEntityPosX]                   ;; 18:6F44 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:6F46 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:6F48 $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 18:6F4A $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 18:6F4C $3E $02
    call AddTranscientVfx                         ;; 18:6F4E $CD $C7 $0C

.jr_6F51
    jp   ClearEntityStatusBank18                  ;; 18:6F51 $C3 $08 $7F

jr_018_6F54:
    call UpdateEntityPosWithSpeed_18              ;; 18:6F54 $CD $5F $7E
    call GetEntityTransitionCountdown             ;; 18:6F57 $CD $05 $0C
    ret  nz                                       ;; 18:6F5A $C0

    call ApplyEntityInteractionWithBackground_trampoline ;; 18:6F5B $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 18:6F5E $21 $A0 $C2
    add  hl, bc                                   ;; 18:6F61 $09
    ld   a, [hl]                                  ;; 18:6F62 $7E
    and  a                                        ;; 18:6F63 $A7
    jp   nz, ClearEntityStatusBank18              ;; 18:6F64 $C2 $08 $7F

    ret                                           ;; 18:6F67 $C9

Vire2SpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

label_018_6F70:
    ld   de, Vire2SpriteVariants
    call RenderActiveEntitySpritesPair            ;; 18:6F73 $CD $C0 $3B
    call ReturnIfNonInteractive_18                ;; 18:6F76 $CD $E8 $7D
    call ApplyRecoilIfNeeded_18                   ;; 18:6F79 $CD $15 $7E
    call UpdateEntityPosWithSpeed_18              ;; 18:6F7C $CD $5F $7E
    ldh  a, [hFrameCounter]                       ;; 18:6F7F $F0 $E7
    and  $03                                      ;; 18:6F81 $E6 $03
    jr   nz, jr_018_6F95                          ;; 18:6F83 $20 $10

    ld   hl, wEntitiesPosZTable                   ;; 18:6F85 $21 $10 $C3
    add  hl, bc                                   ;; 18:6F88 $09
    ld   a, [hl]                                  ;; 18:6F89 $7E
    sub  $10                                      ;; 18:6F8A $D6 $10
    jr   z, jr_018_6F95                           ;; 18:6F8C $28 $07

    and  $80                                      ;; 18:6F8E $E6 $80
    jr   z, .jr_6F94                              ;; 18:6F90 $28 $02

    inc  [hl]                                     ;; 18:6F92 $34
    inc  [hl]                                     ;; 18:6F93 $34

.jr_6F94
    dec  [hl]                                     ;; 18:6F94 $35

jr_018_6F95:
    ldh  a, [hFrameCounter]                       ;; 18:6F95 $F0 $E7
    rra                                           ;; 18:6F97 $1F
    rra                                           ;; 18:6F98 $1F
    rra                                           ;; 18:6F99 $1F
    and  $01                                      ;; 18:6F9A $E6 $01
    call SetEntitySpriteVariant                   ;; 18:6F9C $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ;; 18:6F9F $F0 $F0
    JP_TABLE                                      ;; 18:6FA1
._00 dw func_018_6FA8                             ;; 18:6FA2
._01 dw func_018_6FB4                             ;; 18:6FA4
._02 dw func_018_6FC2                             ;; 18:6FA6

func_018_6FA8::
    call GetEntityTransitionCountdown
    ret  nz                                       ;; 18:6FAB $C0

    ld   [hl], $20                                ;; 18:6FAC $36 $20
    call ClearEntitySpeed                         ;; 18:6FAE $CD $7F $3D
    jp   IncrementEntityState                     ;; 18:6FB1 $C3 $12 $3B

func_018_6FB4::
    call GetEntityTransitionCountdown             ;; 18:6FB4 $CD $05 $0C
    ret  nz                                       ;; 18:6FB7 $C0

    ld   [hl], $20                                ;; 18:6FB8 $36 $20
    ld   a, $20                                   ;; 18:6FBA $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 18:6FBC $CD $AA $3B
    jp   IncrementEntityState                     ;; 18:6FBF $C3 $12 $3B

func_018_6FC2::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 18:6FC2 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 18:6FC5 $CD $05 $0C
    ret  nz                                       ;; 18:6FC8 $C0

    call ApplyEntityInteractionWithBackground_trampoline ;; 18:6FC9 $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 18:6FCC $21 $A0 $C2
    add  hl, bc                                   ;; 18:6FCF $09
    ld   a, [hl]                                  ;; 18:6FD0 $7E
    and  a                                        ;; 18:6FD1 $A7
    jp   nz, ClearEntityStatusBank18              ;; 18:6FD2 $C2 $08 $7F

    ret                                           ;; 18:6FD5 $C9
