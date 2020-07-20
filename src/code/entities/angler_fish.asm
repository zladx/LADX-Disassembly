AnglerFishEntityHandler::
    ld   hl, wEntitiesUnknownTableD               ; $5576: $21 $D0 $C2
    add  hl, bc                                   ; $5579: $09
    ld   a, [hl]                                  ; $557A: $7E
    JP_TABLE                                      ; $557B
._00 dw func_005_5584                             ; $557C
._01 dw func_005_593A                             ; $557E
._02 dw func_005_5901                             ; $5580
._03 dw func_005_5984                             ; $5582

func_005_5584::
    call BossIntro                                ; $5584: $CD $E8 $3E
    call func_005_58D4                            ; $5587: $CD $D4 $58
    ldh  a, [hActiveEntityStatus]                 ; $558A: $F0 $EA
    cp   $05                                      ; $558C: $FE $05
    jr   z, @+$3C                                 ; $558E: $28 $3A

    ld   [$C1C6], a                               ; $5590: $EA $C6 $C1
    ld   hl, wEntitiesPrivateState2Table          ; $5593: $21 $C0 $C2
    add  hl, bc                                   ; $5596: $09
    ld   a, [hl]                                  ; $5597: $7E
    JP_TABLE                                      ; $5598
._00 dw func_005_559D                             ; $5599
._01 dw func_005_55AB                             ; $559B

func_005_559D::
    call GetEntityTransitionCountdown             ; $559D: $CD $05 $0C
    ld   [hl], $FF                                ; $55A0: $36 $FF
    ld   hl, wEntitiesFlashCountdownTable         ; $55A2: $21 $20 $C4
    add  hl, bc                                   ; $55A5: $09
    ld   [hl], $FF                                ; $55A6: $36 $FF
    jp   label_005_6347                           ; $55A8: $C3 $47 $63

func_005_55AB::
    call GetEntityTransitionCountdown             ; $55AB: $CD $05 $0C
    jp   z, label_005_55BC                        ; $55AE: $CA $BC $55

    ld   hl, wEntitiesFlashCountdownTable         ; $55B1: $21 $20 $C4
    add  hl, bc                                   ; $55B4: $09
    ld   [hl], a                                  ; $55B5: $77
    cp   $80                                      ; $55B6: $FE $80
    ret  nc                                       ; $55B8: $D0

    jp   label_005_7550                           ; $55B9: $C3 $50 $75

label_005_55BC:
    call func_005_7585                            ; $55BC: $CD $85 $75
    ld   hl, wEntitiesUnknowTableV                ; $55BF: $21 $80 $C4
    add  hl, de                                   ; $55C2: $19
    ld   [hl], $08                                ; $55C3: $36 $08
    ret                                           ; $55C5: $C9

Data_005_55C6::
    db   $F8, $A8

Data_005_55C8::
    db   $08, $F8

func_005_55CA::
    call func_005_7A3A
    ld   hl, wEntitiesPrivateCountdown2Table
    add  hl, bc                                   ; $55D0: $09
    ld   a, [hl]                                  ; $55D1: $7E
    and  a                                        ; $55D2: $A7
    jr   z, jr_005_561E                           ; $55D3: $28 $49

    and  $3F                                      ; $55D5: $E6 $3F
    jr   nz, jr_005_561E                          ; $55D7: $20 $45

    ld   a, $65                                   ; $55D9: $3E $65
    ld   e, $04                                   ; $55DB: $1E $04
    call SpawnNewEntityInRange_trampoline         ; $55DD: $CD $98 $3B
    jr   c, jr_005_5650                           ; $55E0: $38 $6E

    ld   hl, wEntitiesPhysicsFlagsTable                ; $55E2: $21 $40 $C3
    add  hl, de                                   ; $55E5: $19
    ld   [hl], $02                                ; $55E6: $36 $02
    ld   hl, wEntitiesHitboxFlagsTable                ; $55E8: $21 $50 $C3
    add  hl, de                                   ; $55EB: $19
    ld   [hl], $80                                ; $55EC: $36 $80
    ld   hl, wEntitiesUnknowTableH                ; $55EE: $21 $30 $C4
    add  hl, de                                   ; $55F1: $19
    ld   [hl], $40                                ; $55F2: $36 $40
    ld   hl, wEntitiesUnknownTableD               ; $55F4: $21 $D0 $C2
    add  hl, de                                   ; $55F7: $19
    ld   [hl], $01                                ; $55F8: $36 $01
    ld   hl, wEntitiesPosXTable                         ; $55FA: $21 $00 $C2
    add  hl, de                                   ; $55FD: $19
    ld   a, [$D202]                               ; $55FE: $FA $02 $D2
    ld   [hl], a                                  ; $5601: $77
    add  $20                                      ; $5602: $C6 $20
    ld   [$D202], a                               ; $5604: $EA $02 $D2
    cp   $A8                                      ; $5607: $FE $A8
    jr   c, jr_005_5610                           ; $5609: $38 $05

    ld   a, $08                                   ; $560B: $3E $08
    ld   [$D202], a                               ; $560D: $EA $02 $D2

jr_005_5610:
    call GetRandomByte                            ; $5610: $CD $0D $28
    ld   hl, wEntitiesUnknowTableY                ; $5613: $21 $D0 $C3
    add  hl, de                                   ; $5616: $19
    ld   [hl], a                                  ; $5617: $77
    ld   hl, wEntitiesPosYTable                         ; $5618: $21 $10 $C2
    add  hl, de                                   ; $561B: $19
    ld   [hl], $00                                ; $561C: $36 $00

jr_005_561E:
    ld   a, [$D201]                               ; $561E: $FA $01 $D2
    inc  a                                        ; $5621: $3C
    ld   [$D201], a                               ; $5622: $EA $01 $D2
    and  $7F                                      ; $5625: $E6 $7F
    jr   nz, jr_005_5650                          ; $5627: $20 $27

    ld   a, $65                                   ; $5629: $3E $65
    ld   e, $04                                   ; $562B: $1E $04
    call SpawnNewEntityInRange_trampoline         ; $562D: $CD $98 $3B
    jr   c, jr_005_5650                           ; $5630: $38 $1E

    ld   hl, wEntitiesPhysicsFlagsTable                ; $5632: $21 $40 $C3
    add  hl, de                                   ; $5635: $19
    ld   [hl], $41                                ; $5636: $36 $41
    ld   hl, wEntitiesUnknownTableD               ; $5638: $21 $D0 $C2
    add  hl, de                                   ; $563B: $19
    ld   [hl], $02                                ; $563C: $36 $02
    ldh  a, [hScratch0]                           ; $563E: $F0 $D7
    sub  $14                                      ; $5640: $D6 $14
    ld   hl, wEntitiesPosXTable                         ; $5642: $21 $00 $C2
    add  hl, de                                   ; $5645: $19
    ld   [hl], a                                  ; $5646: $77
    ldh  a, [hScratch1]                           ; $5647: $F0 $D8
    sub  $04                                      ; $5649: $D6 $04
    ld   hl, wEntitiesPosYTable                         ; $564B: $21 $10 $C2
    add  hl, de                                   ; $564E: $19
    ld   [hl], a                                  ; $564F: $77

jr_005_5650:
    ld   hl, wEntitiesHealthTable                                ; $5650: $21 $60 $C3
    add  hl, bc                                   ; $5653: $09
    ld   a, [hl]                                  ; $5654: $7E
    cp   $0A                                      ; $5655: $FE $0A
    jr   nc, jr_005_56B1                          ; $5657: $30 $58

    ld   a, [$D201]                               ; $5659: $FA $01 $D2
    add  $40                                      ; $565C: $C6 $40
    and  $FF                                      ; $565E: $E6 $FF
    jr   nz, jr_005_56B1                          ; $5660: $20 $4F

    ld   a, $65                                   ; $5662: $3E $65
    ld   e, $04                                   ; $5664: $1E $04
    call SpawnNewEntityInRange_trampoline         ; $5666: $CD $98 $3B
    jr   c, jr_005_56B1                           ; $5669: $38 $46

    ld   hl, $C4D0                                ; $566B: $21 $D0 $C4
    add  hl, de                                   ; $566E: $19
    ld   [hl], d                                  ; $566F: $72
    ld   hl, wEntitiesPhysicsFlagsTable                ; $5670: $21 $40 $C3
    add  hl, de                                   ; $5673: $19
    ld   [hl], $02                                ; $5674: $36 $02
    ld   hl, wEntitiesUnknowTableH                ; $5676: $21 $30 $C4
    add  hl, de                                   ; $5679: $19
    ld   [hl], d                                  ; $567A: $72
    ld   hl, wEntitiesHealthTable                                ; $567B: $21 $60 $C3
    add  hl, de                                   ; $567E: $19
    ld   [hl], d                                  ; $567F: $72
    ld   hl, wEntitiesUnknownTableD               ; $5680: $21 $D0 $C2
    add  hl, de                                   ; $5683: $19
    ld   [hl], $03                                ; $5684: $36 $03
    call GetRandomByte                            ; $5686: $CD $0D $28
    and  $3F                                      ; $5689: $E6 $3F
    add  $20                                      ; $568B: $C6 $20
    ld   hl, wEntitiesPosYTable                         ; $568D: $21 $10 $C2
    add  hl, de                                   ; $5690: $19
    ld   [hl], a                                  ; $5691: $77
    push bc                                       ; $5692: $C5
    and  $01                                      ; $5693: $E6 $01
    ld   c, a                                     ; $5695: $4F
    ld   hl, Data_005_55C6                        ; $5696: $21 $C6 $55
    add  hl, bc                                   ; $5699: $09
    ld   a, [hl]                                  ; $569A: $7E
    ld   hl, wEntitiesPosXTable                         ; $569B: $21 $00 $C2
    add  hl, de                                   ; $569E: $19
    ld   [hl], a                                  ; $569F: $77
    ld   hl, Data_005_55C8                        ; $56A0: $21 $C8 $55
    add  hl, bc                                   ; $56A3: $09
    ld   a, [hl]                                  ; $56A4: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $56A5: $21 $40 $C2
    add  hl, de                                   ; $56A8: $19
    ld   [hl], a                                  ; $56A9: $77
    ld   hl, wEntitiesTransitionCountdownTable           ; $56AA: $21 $E0 $C2
    add  hl, de                                   ; $56AD: $19
    ld   [hl], $40                                ; $56AE: $36 $40
    pop  bc                                       ; $56B0: $C1

jr_005_56B1:
    call DecrementEntityIgnoreHitsCountdown       ; $56B1: $CD $56 $0C
    ld   hl, wEntitiesUnknowTableY                ; $56B4: $21 $D0 $C3
    add  hl, bc                                   ; $56B7: $09
    ld   a, [hl]                                  ; $56B8: $7E
    inc  [hl]                                     ; $56B9: $34
    rra                                           ; $56BA: $1F
    rra                                           ; $56BB: $1F
    rra                                           ; $56BC: $1F
    rra                                           ; $56BD: $1F
    and  $01                                      ; $56BE: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable               ; $56C0: $21 $B0 $C3
    add  hl, bc                                   ; $56C3: $09
    ld   [hl], a                                  ; $56C4: $77
    ldh  a, [hActiveEntityPosX]                   ; $56C5: $F0 $EE

jr_005_56C7:
    sub  $10                                      ; $56C7: $D6 $10
    ldh  [hActiveEntityPosX], a                   ; $56C9: $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ; $56CB: $F0 $EC
    sub  $10                                      ; $56CD: $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ; $56CF: $E0 $EC
    ld   hl, wEntitiesHitboxFlagsTable                ; $56D1: $21 $50 $C3
    add  hl, bc                                   ; $56D4: $09
    ld   [hl], $00                                ; $56D5: $36 $00
    call ConfigureEntityHitbox                               ; $56D7: $CD $EA $3A
    call label_3B70                               ; $56DA: $CD $70 $3B
    call CopyEntityPositionToActivePosition       ; $56DD: $CD $8A $3D
    ld   hl, wEntitiesHitboxFlagsTable                ; $56E0: $21 $50 $C3
    add  hl, bc                                   ; $56E3: $09
    ld   [hl], $14                                ; $56E4: $36 $14
    call ConfigureEntityHitbox                               ; $56E6: $CD $EA $3A
    call label_3B44                               ; $56E9: $CD $44 $3B
    ldh  a, [hActiveEntityState]                  ; $56EC: $F0 $F0
    JP_TABLE                                      ; $56EE
._00 dw func_005_56F9                             ; $56EF
._01 dw func_005_5737                             ; $56F1
._02 dw func_005_576E                             ; $56F3

Data_005_56F5::
    db   $08, $F8

Data_005_56F7::
    db   $60, $18

func_005_56F9::
    call GetEntityDropTimer
    jr   nz, jr_005_5713                          ; $56FC: $20 $15

    call GetEntityTransitionCountdown             ; $56FE: $CD $05 $0C
    ld   [hl], $80                                ; $5701: $36 $80
    call IncrementEntityState                     ; $5703: $CD $12 $3B
    call GetRandomByte                            ; $5706: $CD $0D $28
    and  $1F                                      ; $5709: $E6 $1F
    add  $60                                      ; $570B: $C6 $60
    ld   hl, wEntitiesPrivateState1Table          ; $570D: $21 $B0 $C2
    add  hl, bc                                   ; $5710: $09
    ld   [hl], a                                  ; $5711: $77
    ret                                           ; $5712: $C9

jr_005_5713:
    ld   hl, wEntitiesDirectionTable              ; $5713: $21 $80 $C3
    add  hl, bc                                   ; $5716: $09
    ld   e, [hl]                                  ; $5717: $5E
    ld   d, b                                     ; $5718: $50
    ld   hl, Data_005_56F7                        ; $5719: $21 $F7 $56
    add  hl, de                                   ; $571C: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $571D: $F0 $EC
    cp   [hl]                                     ; $571F: $BE
    jr   nz, jr_005_572A                          ; $5720: $20 $08

    ld   a, e                                     ; $5722: $7B
    xor  $01                                      ; $5723: $EE $01
    ld   hl, wEntitiesDirectionTable              ; $5725: $21 $80 $C3
    add  hl, bc                                   ; $5728: $09
    ld   [hl], a                                  ; $5729: $77

jr_005_572A:
    ld   hl, Data_005_56F5                        ; $572A: $21 $F5 $56
    add  hl, de                                   ; $572D: $19
    ld   a, [hl]                                  ; $572E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $572F: $21 $50 $C2
    add  hl, bc                                   ; $5732: $09
    ld   [hl], a                                  ; $5733: $77
    jp   UpdateEntityYPosWithSpeed_05             ; $5734: $C3 $B4 $7A

func_005_5737::
    ld   hl, wEntitiesUnknowTableY                ; $5737: $21 $D0 $C3
    add  hl, bc                                   ; $573A: $09
    ld   a, [hl]                                  ; $573B: $7E
    inc  [hl]                                     ; $573C: $34
    inc  [hl]                                     ; $573D: $34
    call GetEntityTransitionCountdown             ; $573E: $CD $05 $0C
    cp   $60                                      ; $5741: $FE $60
    jr   nz, jr_005_574A                          ; $5743: $20 $05

    ld   hl, hWaveSfx                             ; $5745: $21 $F3 $FF
    ld   [hl], $0D                                ; $5748: $36 $0D

jr_005_574A:
    ret  nc                                       ; $574A: $D0

    ld   hl, wEntitiesSpeedXTable                 ; $574B: $21 $40 $C2
    add  hl, bc                                   ; $574E: $09
    ld   [hl], $D0                                ; $574F: $36 $D0
    call AddEntitySpeedToPos_05                   ; $5751: $CD $BE $7A
    ldh  a, [hActiveEntityPosX]                   ; $5754: $F0 $EE
    cp   $18                                      ; $5756: $FE $18
    ret  nc                                       ; $5758: $D0

    ld   a, $30                                   ; $5759: $3E $30
    ld   [$C157], a                               ; $575B: $EA $57 $C1
    xor  a                                        ; $575E: $AF
    ld   [$C158], a                               ; $575F: $EA $58 $C1
    call PlayBombExplosionSfx                     ; $5762: $CD $4B $0C
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5765: $21 $00 $C3
    add  hl, bc                                   ; $5768: $09
    ld   [hl], $FF                                ; $5769: $36 $FF
    jp   IncrementEntityState                     ; $576B: $C3 $12 $3B

func_005_576E::
    ld   hl, wEntitiesUnknowTableY                ; $576E: $21 $D0 $C3
    add  hl, bc                                   ; $5771: $09
    ld   a, [hl]                                  ; $5772: $7E
    inc  [hl]                                     ; $5773: $34
    ld   a, [$C157]                               ; $5774: $FA $57 $C1
    and  a                                        ; $5777: $A7
    jr   nz, jr_005_579B                          ; $5778: $20 $21

    ld   hl, wEntitiesSpeedXTable                 ; $577A: $21 $40 $C2
    add  hl, bc                                   ; $577D: $09
    ld   [hl], $20                                ; $577E: $36 $20
    call AddEntitySpeedToPos_05                   ; $5780: $CD $BE $7A
    ld   hl, wEntitiesPrivateState1Table          ; $5783: $21 $B0 $C2
    add  hl, bc                                   ; $5786: $09
    ldh  a, [hActiveEntityPosX]                   ; $5787: $F0 $EE
    cp   [hl]                                     ; $5789: $BE
    jr   c, jr_005_579B                           ; $578A: $38 $0F

    call GetEntityDropTimer                       ; $578C: $CD $FB $0B
    call GetRandomByte                            ; $578F: $CD $0D $28
    and  $1F                                      ; $5792: $E6 $1F
    add  $40                                      ; $5794: $C6 $40
    ld   [hl], a                                  ; $5796: $77
    call IncrementEntityState                     ; $5797: $CD $12 $3B
    ld   [hl], b                                  ; $579A: $70

jr_005_579B:
    ret                                           ; $579B: $C9

Data_005_579C::
    db   $F0, $F0, $40, $07, $F0, $F8, $42, $07, $F0, $00, $44, $07, $F0, $08, $46, $16
    db   $F0, $10, $48, $16, $F0, $18, $4A, $16, $00, $F0, $4C, $07, $00, $F8, $4E, $07
    db   $00, $00, $50, $16, $00, $08, $52, $16, $00, $10, $54, $16, $00, $18, $56, $16
    db   $00, $20, $58, $16, $10, $F8, $5A, $16, $10, $00, $5C, $16, $10, $08, $5E, $16
    db   $10, $10, $60, $16, $10, $18, $62, $16, $10, $20, $64, $16, $00, $00, $FF, $00
    db   $F0, $F0, $66, $07, $F0, $F8, $42, $07, $F0, $00, $44, $07, $F0, $08, $46, $16
    db   $F0, $10, $48, $16, $F0, $18, $4A, $16, $00, $F0, $68, $07, $00, $F8, $4E, $07
    db   $00, $00, $50, $16, $00, $08, $52, $16, $00, $10, $54, $16, $00, $18, $56, $16
    db   $00, $20, $6A, $16, $10, $F8, $5A, $16, $10, $00, $5C, $16, $10, $08, $5E, $16
    db   $10, $10, $60, $16, $10, $18, $62, $16, $10, $20, $6C, $16

Data_005_5838::
    db   $F0, $18, $4A, $16, $F0, $08, $46, $16   ; $5838
    db   $F0, $10, $48, $16, $F0, $F8, $42, $07   ; $5840
    db   $F0, $00, $44, $07, $F0, $F0, $40, $07   ; $5848
    db   $00, $20, $58, $16, $00, $08, $52, $16   ; $5850
    db   $00, $10, $54, $16, $00, $18, $56, $16   ; $5858
    db   $00, $F8, $4E, $07, $00, $00, $50, $16   ; $5860
    db   $00, $F0, $4C, $07, $10, $20, $64, $16   ; $5868
    db   $10, $10, $60, $16, $10, $18, $62, $16   ; $5870
    db   $10, $00, $5C, $16, $10, $08, $5E, $16   ; $5878
    db   $10, $F8, $5A, $16, $00, $00, $FF, $00   ; $5880
    db   $F0, $18, $4A, $16, $F0, $08, $46, $16   ; $5888
    db   $F0, $10, $48, $16, $F0, $F8, $42, $07   ; $5890
    db   $F0, $00, $44, $07, $F0, $F0, $66, $07   ; $5898
    db   $00, $20, $6A, $16, $00, $08, $52, $16   ; $58A0
    db   $00, $10, $54, $16, $00, $18, $56, $16   ; $58A8
    db   $00, $F8, $4E, $07, $00, $00, $50, $16   ; $58B0
    db   $00, $F0, $68, $07, $10, $20, $6C, $16   ; $58B8
    db   $10, $10, $60, $16, $10, $18, $62, $16   ; $58C0
    db   $10, $00, $5C, $16, $10, $08, $5E, $16   ; $58C8
    db   $10, $F8, $5A, $16                       ; $58D0

func_005_58D4::
    ldh  a, [hActiveEntitySpriteVariant]
    sla  a                                        ; $58D6: $CB $27
    sla  a                                        ; $58D8: $CB $27
    sla  a                                        ; $58DA: $CB $27
    sla  a                                        ; $58DC: $CB $27
    ld   e, a                                     ; $58DE: $5F
    sla  a                                        ; $58DF: $CB $27
    sla  a                                        ; $58E1: $CB $27
    add  e                                        ; $58E3: $83
    ld   e, a                                     ; $58E4: $5F
    ld   d, b                                     ; $58E5: $50
    ld   hl, Data_005_579C                        ; $58E6: $21 $9C $57
    ldh  a, [hFrameCounter]                       ; $58E9: $F0 $E7
    and  $01                                      ; $58EB: $E6 $01
    jr   z, jr_005_58F2                           ; $58ED: $28 $03

    ld   hl, Data_005_5838                        ; $58EF: $21 $38 $58

jr_005_58F2:
    add  hl, de                                   ; $58F2: $19
    ld   c, $13                                   ; $58F3: $0E $13
    call RenderActiveEntitySpritesRect            ; $58F5: $CD $E6 $3C
    ld   a, $13                                   ; $58F8: $3E $13
    jp   label_3DA0                               ; $58FA: $C3 $A0 $3D

Data_005_58FD::
    db   $72, $00, $72, $20

func_005_5901::
    ld   de, Data_005_58FD
    call RenderActiveEntitySprite                 ; $5904: $CD $77 $3C
    call func_005_7A3A                            ; $5907: $CD $3A $7A
    ld   hl, wEntitiesUnknowTableY                ; $590A: $21 $D0 $C3

jr_005_590D:
    add  hl, bc                                   ; $590D: $09
    inc  [hl]                                     ; $590E: $34
    ld   a, [hl]                                  ; $590F: $7E
    rra                                           ; $5910: $1F
    rra                                           ; $5911: $1F
    rra                                           ; $5912: $1F

jr_005_5913:
    and  $01                                      ; $5913: $E6 $01
    call SetEntitySpriteVariant                   ; $5915: $CD $0C $3B
    ld   hl, wEntitiesUnknowTableY                ; $5918: $21 $D0 $C3
    add  hl, bc                                   ; $591B: $09
    ld   a, [hl]                                  ; $591C: $7E
    and  $30                                      ; $591D: $E6 $30
    jr   z, jr_005_592A                           ; $591F: $28 $09

    ld   hl, wEntitiesSpeedYTable                 ; $5921: $21 $50 $C2
    add  hl, bc                                   ; $5924: $09
    ld   [hl], $F8                                ; $5925: $36 $F8
    call UpdateEntityYPosWithSpeed_05             ; $5927: $CD $B4 $7A

jr_005_592A:
    ldh  a, [hActiveEntityVisualPosY]             ; $592A: $F0 $EC
    cp   $10                                      ; $592C: $FE $10
    jp   c, func_005_7B4B                         ; $592E: $DA $4B $7B

    ret                                           ; $5931: $C9

Data_005_5932::
    db   $74, $05, $76, $05, $76, $25, $74, $25

func_005_593A::
    ld   de, Data_005_5932                        ; $593A: $11 $32 $59
    call RenderActiveEntitySpritesPair            ; $593D: $CD $C0 $3B
    call func_005_7A3A                            ; $5940: $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ; $5943: $CD $56 $0C
    ld   hl, wEntitiesUnknowTableY                ; $5946: $21 $D0 $C3
    add  hl, bc                                   ; $5949: $09
    inc  [hl]                                     ; $594A: $34
    ld   a, [hl]                                  ; $594B: $7E
    push af                                       ; $594C: $F5
    rra                                           ; $594D: $1F
    rra                                           ; $594E: $1F
    rra                                           ; $594F: $1F
    rra                                           ; $5950: $1F
    and  $01                                      ; $5951: $E6 $01
    call SetEntitySpriteVariant                   ; $5953: $CD $0C $3B
    call label_3B39                               ; $5956: $CD $39 $3B
    pop  af                                       ; $5959: $F1
    ld   e, $FC                                   ; $595A: $1E $FC
    and  $10                                      ; $595C: $E6 $10
    jr   z, jr_005_5962                           ; $595E: $28 $02

    ld   e, $04                                   ; $5960: $1E $04

jr_005_5962:
    ld   hl, wEntitiesSpeedXTable                 ; $5962: $21 $40 $C2
    add  hl, bc                                   ; $5965: $09
    ld   [hl], e                                  ; $5966: $73
    ld   hl, wEntitiesSpeedYTable                 ; $5967: $21 $50 $C2
    add  hl, bc                                   ; $596A: $09
    ld   [hl], $0C                                ; $596B: $36 $0C
    call UpdateEntityPosWithSpeed_05              ; $596D: $CD $B1 $7A
    ldh  a, [hActiveEntityVisualPosY]             ; $5970: $F0 $EC
    cp   $8B                                      ; $5972: $FE $8B
    jp   nc, func_005_7B4B                        ; $5974: $D2 $4B $7B

    ret                                           ; $5977: $C9

Data_005_5978::
    db   $78, $03, $7A, $03, $7C, $03, $7E, $03

Data_005_5980::
    db   $01, $FF

Data_005_5982::
    db   $08, $F8

func_005_5984::
    ld   hl, wEntitiesSpeedXTable                 ; $5984: $21 $40 $C2
    add  hl, bc                                   ; $5987: $09
    ld   a, [hl]                                  ; $5988: $7E
    cpl                                           ; $5989: $2F
    rra                                           ; $598A: $1F
    rra                                           ; $598B: $1F
    and  $20                                      ; $598C: $E6 $20
    ldh  [hActiveEntityFlipAttribute], a          ; $598E: $E0 $ED
    ld   de, Data_005_5978                        ; $5990: $11 $78 $59
    call RenderActiveEntitySpritesPair            ; $5993: $CD $C0 $3B
    call func_005_7A3A                            ; $5996: $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ; $5999: $CD $56 $0C
    ldh  a, [hFrameCounter]                       ; $599C: $F0 $E7
    rra                                           ; $599E: $1F
    rra                                           ; $599F: $1F
    rra                                           ; $59A0: $1F
    rra                                           ; $59A1: $1F
    and  $01                                      ; $59A2: $E6 $01
    call SetEntitySpriteVariant                   ; $59A4: $CD $0C $3B
    call label_3B39                               ; $59A7: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $59AA: $F0 $E7
    and  $03                                      ; $59AC: $E6 $03
    jr   nz, jr_005_59CE                          ; $59AE: $20 $1E

    ld   hl, wEntitiesStateTable                  ; $59B0: $21 $90 $C2
    add  hl, bc                                   ; $59B3: $09
    ld   a, [hl]                                  ; $59B4: $7E
    and  $01                                      ; $59B5: $E6 $01
    ld   e, a                                     ; $59B7: $5F
    ld   d, b                                     ; $59B8: $50
    ld   hl, Data_005_5980                        ; $59B9: $21 $80 $59
    add  hl, de                                   ; $59BC: $19
    ld   a, [hl]                                  ; $59BD: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $59BE: $21 $50 $C2
    add  hl, bc                                   ; $59C1: $09
    add  [hl]                                     ; $59C2: $86
    ld   [hl], a                                  ; $59C3: $77
    ld   hl, Data_005_5982                        ; $59C4: $21 $82 $59
    add  hl, de                                   ; $59C7: $19
    cp   [hl]                                     ; $59C8: $BE
    jr   nz, jr_005_59CE                          ; $59C9: $20 $03

    call IncrementEntityState                     ; $59CB: $CD $12 $3B

jr_005_59CE:
    call UpdateEntityPosWithSpeed_05              ; $59CE: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $59D1: $CD $05 $0C
    jr   nz, jr_005_59DD                          ; $59D4: $20 $07

    ldh  a, [hActiveEntityPosX]                   ; $59D6: $F0 $EE
    cp   $A8                                      ; $59D8: $FE $A8
    jp   nc, func_005_7B4B                        ; $59DA: $D2 $4B $7B

jr_005_59DD:
    ret                                           ; $59DD: $C9
