MoblinKingEntityHandler::
    ld   a, [wIsBowWowFollowingLink]              ; $46B6: $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ; $46B9: $FE $80
    jp   nz, ClearEntityStatus_15                 ; $46BB: $C2 $31 $7C

    ld   hl, wEntitiesDirectionTable              ; $46BE: $21 $80 $C3
    add  hl, bc                                   ; $46C1: $09
    ld   a, [hl]                                  ; $46C2: $7E
    and  a                                        ; $46C3: $A7
    jr   nz, .jr_46D0                             ; $46C4: $20 $0A

    ldh  a, [hActiveEntitySpriteVariant]          ; $46C6: $F0 $F1
    cp   $0C                                      ; $46C8: $FE $0C
    jr   nc, .jr_46D0                             ; $46CA: $30 $04

    add  $06                                      ; $46CC: $C6 $06
    ldh  [hActiveEntitySpriteVariant], a          ; $46CE: $E0 $F1

.jr_46D0
    call func_015_4AC9                            ; $46D0: $CD $C9 $4A
    ldh  a, [hActiveEntityStatus]                 ; $46D3: $F0 $EA
    cp   $01                                      ; $46D5: $FE $01
    jr   nz, .jr_46E1                             ; $46D7: $20 $08

    ld   a, $0C                                   ; $46D9: $3E $0C
    call func_015_48B6                            ; $46DB: $CD $B6 $48
    jp   label_015_7C37                           ; $46DE: $C3 $37 $7C

.jr_46E1
    call label_394D                               ; $46E1: $CD $4D $39
    call ReturnIfNonInteractive_15                ; $46E4: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $46E7: $CD $3E $7B
    call label_3B39                               ; $46EA: $CD $39 $3B
    ld   hl, wEntitiesOptions1Table               ; $46ED: $21 $30 $C4
    add  hl, bc                                   ; $46F0: $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $46F1: $CB $F6
    ld   hl, wEntitiesPhysicsFlagsTable           ; $46F3: $21 $40 $C3
    add  hl, bc                                   ; $46F6: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $46F7: $CB $BE
    call UpdateEntityPosWithSpeed_15              ; $46F9: $CD $88 $7B
    call label_3B23                               ; $46FC: $CD $23 $3B
    call AddEntityZSpeedToPos_15                  ; $46FF: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4702: $21 $20 $C3
    add  hl, bc                                   ; $4705: $09
    dec  [hl]                                     ; $4706: $35
    dec  [hl]                                     ; $4707: $35
    dec  [hl]                                     ; $4708: $35
    ld   hl, wEntitiesPosZTable                   ; $4709: $21 $10 $C3
    add  hl, bc                                   ; $470C: $09
    ld   a, [hl]                                  ; $470D: $7E
    and  $80                                      ; $470E: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $4710: $E0 $E8
    jr   z, .jr_471A                              ; $4712: $28 $06

    ld   [hl], b                                  ; $4714: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4715: $21 $20 $C3
    add  hl, bc                                   ; $4718: $09
    ld   [hl], b                                  ; $4719: $70

.jr_471A
    ld   hl, wEntitiesStateTable                  ; $471A: $21 $90 $C2
    add  hl, bc                                   ; $471D: $09
    ld   a, [hl]                                  ; $471E: $7E
    JP_TABLE                                      ; $471F
._00 dw func_015_4734                             ; $4720
._01 dw func_015_4750                             ; $4722
._02 dw func_015_4780                             ; $4724
._03 dw func_015_483F                             ; $4726
._04 dw func_015_4873                             ; $4728
._05 dw func_015_48CF                             ; $472A
._06 dw func_015_494C                             ; $472C
._07 dw func_015_4977                             ; $472E
._08 dw func_015_499C                             ; $4730
._09 dw func_015_49C2                             ; $4732

func_015_4734::
    call GetEntityTransitionCountdown
    ld   [hl], $20                                ; $4737: $36 $20
    xor  a                                        ; $4739: $AF
    ld   [wD228], a                               ; $473A: $EA $28 $D2
    call SetEntitySpriteVariant                   ; $473D: $CD $0C $3B
    call IncrementEntityState                     ; $4740: $CD $12 $3B

func_015_4743::
    call func_015_7BDB                            ; $4743: $CD $DB $7B
    ld   a, e                                     ; $4746: $7B
    ld   [wD227], a                               ; $4747: $EA $27 $D2
    ld   hl, wEntitiesDirectionTable              ; $474A: $21 $80 $C3
    add  hl, bc                                   ; $474D: $09

.jr_474E
    ld   [hl], a                                  ; $474E: $77
    ret                                           ; $474F: $C9

func_015_4750::
    call GetEntityTransitionCountdown             ; $4750: $CD $05 $0C
    ret  nz                                       ; $4753: $C0

    call_open_dialog Dialog191                    ; $4754
    ld   hl, wDialogState                         ; $4759: $21 $9F $C1

.jr_475C
    res  DIALOG_BOX_BOTTOM_BIT, [hl]              ; $475C: $CB $BE
    call IncrementEntityState                     ; $475E: $CD $12 $3B
    call GetEntityDropTimer                       ; $4761: $CD $FB $0B
    ld   [hl], $30                                ; $4764: $36 $30
    ld   hl, wEntitiesOptions1Table               ; $4766: $21 $30 $C4
    add  hl, bc                                   ; $4769: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IS_MINI_BOSS ; $476A: $36 $84
    ld   a, $01                                   ; $476C: $3E $01
    ld   [wD228], a                               ; $476E: $EA $28 $D2
    ld   a, $01                                   ; $4771: $3E $01
    jp   SetEntitySpriteVariant                   ; $4773: $C3 $0C $3B

Data_015_4776::
    db   $08, $F8

Data_015_4778::
    db   $FC, $FC

Data_015_477A::
    db   $20, $E0

Data_015_477C::
    db   $00, $00

Data_015_477E::
    db   $D0, $30

func_015_4780::
    call GetEntityPrivateCountdown1               ; $4780: $CD $00 $0C
    jr   z, jr_015_47E3                           ; $4783: $28 $5E

    cp   $0C                                      ; $4785: $FE $0C
    jr   nz, .jr_47D1                             ; $4787: $20 $48

    ld   a, ENTITY_MOBLIN_ARROW                   ; $4789: $3E $0C
    call SpawnNewEntity_trampoline                ; $478B: $CD $86 $3B
    jr   c, .jr_47D1                              ; $478E: $38 $41

    ld   a, NOISE_SFX_WHOOSH                      ; $4790: $3E $0A
    ldh  [hNoiseSfx], a                           ; $4792: $E0 $F4
    push bc                                       ; $4794: $C5
    ldh  a, [hMultiPurpose2]                      ; $4795: $F0 $D9
    ld   c, a                                     ; $4797: $4F
    ld   hl, Data_015_4776                        ; $4798: $21 $76 $47
    add  hl, bc                                   ; $479B: $09
    ldh  a, [hMultiPurpose0]                      ; $479C: $F0 $D7
    add  [hl]                                     ; $479E: $86
    ld   hl, wEntitiesPosXTable                   ; $479F: $21 $00 $C2
    add  hl, de                                   ; $47A2: $19
    ld   [hl], a                                  ; $47A3: $77
    ld   hl, Data_015_4778                        ; $47A4: $21 $78 $47
    add  hl, bc                                   ; $47A7: $09
    ldh  a, [hMultiPurpose1]                      ; $47A8: $F0 $D8
    add  [hl]                                     ; $47AA: $86
    ld   hl, wEntitiesPosYTable                   ; $47AB: $21 $10 $C2
    add  hl, de                                   ; $47AE: $19
    ld   [hl], a                                  ; $47AF: $77
    ld   hl, Data_015_477A                        ; $47B0: $21 $7A $47
    add  hl, bc                                   ; $47B3: $09
    ld   a, [hl]                                  ; $47B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $47B5: $21 $40 $C2
    add  hl, de                                   ; $47B8: $19
    ld   [hl], a                                  ; $47B9: $77
    ld   hl, Data_015_477C                        ; $47BA: $21 $7C $47
    add  hl, bc                                   ; $47BD: $09
    ld   a, [hl]                                  ; $47BE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $47BF: $21 $50 $C2
    add  hl, de                                   ; $47C2: $19
    ld   [hl], a                                  ; $47C3: $77
    ldh  a, [hMultiPurpose2]                      ; $47C4: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $47C6: $21 $B0 $C3
    add  hl, de                                   ; $47C9: $19
    ld   [hl], a                                  ; $47CA: $77
    ld   hl, wEntitiesDirectionTable              ; $47CB: $21 $80 $C3
    add  hl, de                                   ; $47CE: $19
    ld   [hl], a                                  ; $47CF: $77
    pop  bc                                       ; $47D0: $C1

.jr_47D1
    call GetEntityPrivateCountdown1               ; $47D1: $CD $00 $0C
    ld   e, $00                                   ; $47D4: $1E $00
    cp   $0C                                      ; $47D6: $FE $0C
    jr   c, .jr_47DC                              ; $47D8: $38 $02

    ld   e, $02                                   ; $47DA: $1E $02

.jr_47DC
    ld   a, e                                     ; $47DC: $7B
    call SetEntitySpriteVariant                   ; $47DD: $CD $0C $3B
    jp   ClearEntitySpeed                         ; $47E0: $C3 $7F $3D

jr_015_47E3:
    call GetEntityDropTimer                       ; $47E3: $CD $FB $0B
    jr   nz, .jr_47F3                             ; $47E6: $20 $0B

    call GetEntityTransitionCountdown             ; $47E8: $CD $05 $0C
    ld   [hl], $30                                ; $47EB: $36 $30
    call ClearEntitySpeed                         ; $47ED: $CD $7F $3D
    jp   IncrementEntityState                     ; $47F0: $C3 $12 $3B

.jr_47F3
    ldh  a, [hMultiPurposeG]                      ; $47F3: $F0 $E8
    and  a                                        ; $47F5: $A7
    jr   z, .jr_4816                              ; $47F6: $28 $1E

    ldh  a, [hLinkPositionX]                      ; $47F8: $F0 $98
    push af                                       ; $47FA: $F5
    call func_015_7BDB                            ; $47FB: $CD $DB $7B
    ld   d, b                                     ; $47FE: $50
    ld   hl, Data_015_477E                        ; $47FF: $21 $7E $47
    add  hl, de                                   ; $4802: $19
    ldh  a, [hLinkPositionX]                      ; $4803: $F0 $98
    add  [hl]                                     ; $4805: $86
    ldh  [hLinkPositionX], a                      ; $4806: $E0 $98
    ld   a, $0C                                   ; $4808: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $480A: $CD $AA $3B
    pop  af                                       ; $480D: $F1
    ldh  [hLinkPositionX], a                      ; $480E: $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ; $4810: $21 $20 $C3
    add  hl, bc                                   ; $4813: $09
    ld   [hl], $10                                ; $4814: $36 $10

.jr_4816
    ldh  a, [hFrameCounter]                       ; $4816: $F0 $E7
    rra                                           ; $4818: $1F
    rra                                           ; $4819: $1F
    rra                                           ; $481A: $1F
    rra                                           ; $481B: $1F
    and  $01                                      ; $481C: $E6 $01
    call SetEntitySpriteVariant                   ; $481E: $CD $0C $3B
    ld   [wD228], a                               ; $4821: $EA $28 $D2
    call func_015_4743                            ; $4824: $CD $43 $47
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4827: $21 $00 $C3
    add  hl, bc                                   ; $482A: $09
    ld   a, [hl]                                  ; $482B: $7E
    and  a                                        ; $482C: $A7
    jr   nz, .ret_483C                            ; $482D: $20 $0D

    call GetRandomByte                            ; $482F: $CD $0D $28
    and  $3F                                      ; $4832: $E6 $3F
    add  $30                                      ; $4834: $C6 $30
    ld   [hl], a                                  ; $4836: $77
    call GetEntityPrivateCountdown1               ; $4837: $CD $00 $0C
    ld   [hl], $18                                ; $483A: $36 $18

.ret_483C
    ret                                           ; $483C: $C9

Data_015_483D::
    db   $28, $D8

func_015_483F::
    call GetEntityTransitionCountdown             ; $483F: $CD $05 $0C
    jr   nz, .jr_485C                             ; $4842: $20 $18

    ld   [hl], $22                                ; $4844: $36 $22
    call ClearEntitySpeed                         ; $4846: $CD $7F $3D
    ld   hl, wEntitiesDirectionTable              ; $4849: $21 $80 $C3
    add  hl, bc                                   ; $484C: $09
    ld   e, [hl]                                  ; $484D: $5E
    ld   d, b                                     ; $484E: $50
    ld   hl, Data_015_483D                        ; $484F: $21 $3D $48
    add  hl, de                                   ; $4852: $19
    ld   a, [hl]                                  ; $4853: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4854: $21 $40 $C2
    add  hl, bc                                   ; $4857: $09
    ld   [hl], a                                  ; $4858: $77
    jp   IncrementEntityState                     ; $4859: $C3 $12 $3B

.jr_485C
    and  $07                                      ; $485C: $E6 $07
    jr   nz, .jr_4864                             ; $485E: $20 $04

    ld   a, JINGLE_BUMP                           ; $4860: $3E $09
    ldh  [hJingle], a                             ; $4862: $E0 $F2

.jr_4864
    call ClearEntitySpeed                         ; $4864: $CD $7F $3D
    ldh  a, [hFrameCounter]                       ; $4867: $F0 $E7
    rra                                           ; $4869: $1F
    rra                                           ; $486A: $1F
    rra                                           ; $486B: $1F
    and  $01                                      ; $486C: $E6 $01
    add  $02                                      ; $486E: $C6 $02
    jp   SetEntitySpriteVariant                   ; $4870: $C3 $0C $3B

func_015_4873::
    call GetEntityTransitionCountdown             ; $4873: $CD $05 $0C
    jr   nz, .jr_487E                             ; $4876: $20 $06

    call IncrementEntityState                     ; $4878: $CD $12 $3B
    jp   IncrementEntityState                     ; $487B: $C3 $12 $3B

.jr_487E
    ld   hl, wEntitiesCollisionsTable             ; $487E: $21 $A0 $C2
    add  hl, bc                                   ; $4881: $09
    ld   a, [hl]                                  ; $4882: $7E
    and  $03                                      ; $4883: $E6 $03
    jr   z, .jr_48AE                              ; $4885: $28 $27

    xor  a                                        ; $4887: $AF
    ld   [wC158], a                               ; $4888: $EA $58 $C1
    ld   a, $20                                   ; $488B: $3E $20
    ld   [wC157], a                               ; $488D: $EA $57 $C1
    ld   a, JINGLE_STRONG_BUMP                    ; $4890: $3E $0B
    ldh  [hJingle], a                             ; $4892: $E0 $F2
    ld   hl, wEntitiesSpeedXTable                 ; $4894: $21 $40 $C2
    add  hl, bc                                   ; $4897: $09
    sra  [hl]                                     ; $4898: $CB $2E
    sra  [hl]                                     ; $489A: $CB $2E
    ld   a, [hl]                                  ; $489C: $7E
    cpl                                           ; $489D: $2F
    inc  a                                        ; $489E: $3C
    ld   [hl], a                                  ; $489F: $77
    ld   hl, wEntitiesSpeedZTable                 ; $48A0: $21 $20 $C3
    add  hl, bc                                   ; $48A3: $09
    ld   [hl], $28                                ; $48A4: $36 $28
    call IncrementEntityState                     ; $48A6: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $48A9: $CD $05 $0C
    ld   [hl], $60                                ; $48AC: $36 $60

.jr_48AE
    ldh  a, [hFrameCounter]                       ; $48AE: $F0 $E7
    rra                                           ; $48B0: $1F
    rra                                           ; $48B1: $1F
    and  $01                                      ; $48B2: $E6 $01
    add  $04                                      ; $48B4: $C6 $04

func_015_48B6::
    call SetEntitySpriteVariant                   ; $48B6: $CD $0C $3B
    ld   a, $FF                                   ; $48B9: $3E $FF
    ld   [wD228], a                               ; $48BB: $EA $28 $D2
    ret                                           ; $48BE: $C9

Data_015_48BF::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02

Data_015_48C7::
    db   $00, $04, $08, $0C, $10, $0C, $08, $04

func_015_48CF::
    ld   hl, wEntitiesOptions1Table               ; $48CF: $21 $30 $C4
    add  hl, bc                                   ; $48D2: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $48D3: $CB $B6
    ld   hl, wEntitiesPhysicsFlagsTable           ; $48D5: $21 $40 $C3
    add  hl, bc                                   ; $48D8: $09
    set  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $48D9: $CB $FE
    call GetEntityTransitionCountdown             ; $48DB: $CD $05 $0C
    jr   nz, .jr_48F0                             ; $48DE: $20 $10

    ld   [hl], $40                                ; $48E0: $36 $40
    call IncrementEntityState                     ; $48E2: $CD $12 $3B
    call IncrementEntityState                     ; $48E5: $CD $12 $3B
    ld   a, $00                                   ; $48E8: $3E $00
    ld   [wD228], a                               ; $48EA: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $48ED: $C3 $0C $3B

.jr_48F0
    ldh  a, [hMultiPurposeG]                      ; $48F0: $F0 $E8
    and  a                                        ; $48F2: $A7
    jr   z, .jr_48F8                              ; $48F3: $28 $03

    call ClearEntitySpeed                         ; $48F5: $CD $7F $3D

.jr_48F8
    ldh  a, [hFrameCounter]                       ; $48F8: $F0 $E7
    rra                                           ; $48FA: $1F
    rra                                           ; $48FB: $1F
    rra                                           ; $48FC: $1F
    and  $01                                      ; $48FD: $E6 $01
    add  $0C                                      ; $48FF: $C6 $0C
    call SetEntitySpriteVariant                   ; $4901: $CD $0C $3B
    ld   a, [wOAMNextAvailableSlot]               ; $4904: $FA $C0 $C3
    ld   e, a                                     ; $4907: $5F
    ld   d, b                                     ; $4908: $50
    ld   hl, wDynamicOAMBuffer                    ; $4909: $21 $30 $C0
    add  hl, de                                   ; $490C: $19
    ldh  a, [hFrameCounter]                       ; $490D: $F0 $E7
    rra                                           ; $490F: $1F
    rra                                           ; $4910: $1F
    rra                                           ; $4911: $1F
    and  $07                                      ; $4912: $E6 $07
    call func_015_491C                            ; $4914: $CD $1C $49
    ld   a, $02                                   ; $4917: $3E $02
    jp   func_015_7964_trampoline                 ; $4919: $C3 $A0 $3D

func_015_491C::
    call func_015_4928                            ; $491C: $CD $28 $49
    ldh  a, [hFrameCounter]                       ; $491F: $F0 $E7
    rra                                           ; $4921: $1F
    rra                                           ; $4922: $1F
    rra                                           ; $4923: $1F
    add  $04                                      ; $4924: $C6 $04
    and  $07                                      ; $4926: $E6 $07

func_015_4928::
    push bc                                       ; $4928: $C5
    push hl                                       ; $4929: $E5
    ld   e, a                                     ; $492A: $5F
    ld   d, $00                                   ; $492B: $16 $00
    ld   hl, Data_015_48BF                        ; $492D: $21 $BF $48
    add  hl, de                                   ; $4930: $19
    ld   b, [hl]                                  ; $4931: $46
    ld   hl, Data_015_48C7                        ; $4932: $21 $C7 $48
    add  hl, de                                   ; $4935: $19
    ld   c, [hl]                                  ; $4936: $4E
    pop  hl                                       ; $4937: $E1
    ldh  a, [hActiveEntityVisualPosY]             ; $4938: $F0 $EC
    add  b                                        ; $493A: $80
    add  $F6                                      ; $493B: $C6 $F6
    ld   [hl+], a                                 ; $493D: $22
    ldh  a, [hActiveEntityPosX]                   ; $493E: $F0 $EE
    add  c                                        ; $4940: $81
    add  $FC                                      ; $4941: $C6 $FC
    ld   [hl+], a                                 ; $4943: $22
    ld   [hl], $24                                ; $4944: $36 $24
    inc  hl                                       ; $4946: $23
    ld   [hl], $00                                ; $4947: $36 $00
    inc  hl                                       ; $4949: $23
    pop  bc                                       ; $494A: $C1
    ret                                           ; $494B: $C9

func_015_494C::
    ld   hl, wEntitiesSpeedXTable                 ; $494C: $21 $40 $C2
    add  hl, bc                                   ; $494F: $09
    ld   a, [hl]                                  ; $4950: $7E
    and  $FE                                      ; $4951: $E6 $FE
    jr   nz, .jr_4960                             ; $4953: $20 $0B

    call ClearEntitySpeed                         ; $4955: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $4958: $CD $05 $0C
    ld   [hl], $40                                ; $495B: $36 $40
    jp   IncrementEntityState                     ; $495D: $C3 $12 $3B

.jr_4960
    ld   hl, wEntitiesSpeedXTable                 ; $4960: $21 $40 $C2
    add  hl, bc                                   ; $4963: $09
    ld   a, [hl]                                  ; $4964: $7E
    and  $80                                      ; $4965: $E6 $80
    jr   z, .jr_496D                              ; $4967: $28 $04

    inc  [hl]                                     ; $4969: $34
    inc  [hl]                                     ; $496A: $34
    inc  [hl]                                     ; $496B: $34
    inc  [hl]                                     ; $496C: $34

.jr_496D
    dec  [hl]                                     ; $496D: $35
    dec  [hl]                                     ; $496E: $35
    ld   a, $00                                   ; $496F: $3E $00
    ld   [wD228], a                               ; $4971: $EA $28 $D2
    jp   SetEntitySpriteVariant                   ; $4974: $C3 $0C $3B

func_015_4977::
    call ClearEntitySpeed                         ; $4977: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $497A: $CD $05 $0C
    jr   nz, jr_015_4990                          ; $497D: $20 $11

label_015_497F:
    call GetEntityDropTimer                       ; $497F: $CD $FB $0B
    call GetRandomByte                            ; $4982: $CD $0D $28
    and  $1F                                      ; $4985: $E6 $1F
    add  $20                                      ; $4987: $C6 $20
    ld   [hl], a                                  ; $4989: $77
    call IncrementEntityState                     ; $498A: $CD $12 $3B
    ld   [hl], $02                                ; $498D: $36 $02
    ret                                           ; $498F: $C9

jr_015_4990:
    ldh  a, [hFrameCounter]                       ; $4990: $F0 $E7
    rra                                           ; $4992: $1F
    rra                                           ; $4993: $1F
    rra                                           ; $4994: $1F
    rra                                           ; $4995: $1F
    and  $01                                      ; $4996: $E6 $01
    ld   [wD227], a                               ; $4998: $EA $27 $D2
    ret                                           ; $499B: $C9

func_015_499C::
    call IncrementEntityState                     ; $499C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $499F: $CD $05 $0C
    ld   [hl], $60                                ; $49A2: $36 $60
    ld   hl, wEntitiesSpeedXTable                 ; $49A4: $21 $40 $C2
    add  hl, bc                                   ; $49A7: $09
    ld   a, [hl]                                  ; $49A8: $7E
    ldh  [hLinkSpeedX], a                         ; $49A9: $E0 $9A
    ld   a, $28                                   ; $49AB: $3E $28
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $49AD: $EA $3E $C1
    ld   a, $40                                   ; $49B0: $3E $40
    ld   [wInvincibilityCounter], a               ; $49B2: $EA $C7 $DB
    ld   a, [wSubtractHealthBuffer]               ; $49B5: $FA $94 $DB
    add  $08                                      ; $49B8: $C6 $08
    ld   [wSubtractHealthBuffer], a               ; $49BA: $EA $94 $DB
    ld   a, JINGLE_STRONG_BUMP                    ; $49BD: $3E $0B
    ldh  [hJingle], a                             ; $49BF: $E0 $F2
    ret                                           ; $49C1: $C9

func_015_49C2::
    call ClearEntitySpeed                         ; $49C2: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $49C5: $CD $05 $0C
    jr   nz, .jr_49CD                             ; $49C8: $20 $03

    jp   label_015_497F                           ; $49CA: $C3 $7F $49

.jr_49CD
    cp   $40                                      ; $49CD: $FE $40
    ld   a, $00                                   ; $49CF: $3E $00
    jr   nc, .jr_49DC                             ; $49D1: $30 $09

    ldh  a, [hFrameCounter]                       ; $49D3: $F0 $E7
    rra                                           ; $49D5: $1F
    rra                                           ; $49D6: $1F
    rra                                           ; $49D7: $1F
    rra                                           ; $49D8: $1F
    rra                                           ; $49D9: $1F
    and  $01                                      ; $49DA: $E6 $01

.jr_49DC
    call SetEntitySpriteVariant                   ; $49DC: $CD $0C $3B
    ld   [wD228], a                               ; $49DF: $EA $28 $D2
    jp   func_015_4743                            ; $49E2: $C3 $43 $47

Data_015_49E5::
    db   $F8, $FC, $54, $22, $F8, $04, $52, $22, $F8, $0C, $50, $22, $F7, $FC, $54, $22
    db   $F7, $04, $52, $22, $F7, $0C, $50, $22, $F8, $FC, $50, $02, $F8, $04, $52, $02
    db   $F8, $0C, $54, $02, $F7, $FC, $50, $02, $F7, $04, $52, $02, $F7, $0C, $54, $02

Data_015_4A15::
    db   $00, $FC, $56, $02, $00, $04, $58, $02, $00, $0C, $5A, $02, $00, $FC, $5C, $02
    db   $00, $04, $58, $02, $00, $0C, $5E, $02, $00, $FC, $5C, $02, $00, $04, $58, $02
    db   $00, $0C, $5A, $02, $00, $FC, $56, $02, $00, $04, $58, $02, $00, $0C, $5E, $02
    db   $00, $FC, $70, $02, $00, $04, $72, $02, $00, $0C, $74, $02, $01, $FC, $70, $02
    db   $00, $04, $76, $02, $00, $0C, $78, $02, $00, $FC, $5A, $22, $00, $04, $58, $22
    db   $00, $0C, $56, $22, $00, $FC, $5E, $22, $00, $04, $58, $22, $00, $0C, $5C, $22
    db   $00, $FC, $5A, $22, $00, $04, $58, $22, $00, $0C, $5C, $22, $00, $FC, $5E, $22
    db   $00, $04, $58, $22, $00, $0C, $56, $22, $00, $FC, $74, $22, $00, $04, $72, $22
    db   $00, $0C, $70, $22, $00, $FC, $78, $22, $00, $04, $76, $22, $01, $0C, $70, $22
    db   $00, $FC, $7A, $02, $00, $04, $7C, $02, $00, $0C, $7E, $02, $00, $FC, $7E, $22
    db   $00, $04, $7C, $22, $00, $0C, $7A, $22

Data_015_4ABD::
    db   $0C, $FF, $26, $02, $0C, $04, $26, $02, $0C, $09, $26, $02

func_015_4AC9::
    ld   a, [wD227]                               ; $4AC9: $FA $27 $D2
    sla  a                                        ; $4ACC: $CB $27
    ld   e, a                                     ; $4ACE: $5F
    ld   a, [wD228]                               ; $4ACF: $FA $28 $D2
    cp   $FF                                      ; $4AD2: $FE $FF
    jr   z, .jr_4AEB                              ; $4AD4: $28 $15

    add  e                                        ; $4AD6: $83
    rla                                           ; $4AD7: $17
    rla                                           ; $4AD8: $17
    and  $FC                                      ; $4AD9: $E6 $FC
    ld   e, a                                     ; $4ADB: $5F
    rla                                           ; $4ADC: $17
    and  $F8                                      ; $4ADD: $E6 $F8
    add  e                                        ; $4ADF: $83
    ld   e, a                                     ; $4AE0: $5F
    ld   d, b                                     ; $4AE1: $50
    ld   hl, Data_015_49E5                        ; $4AE2: $21 $E5 $49
    add  hl, de                                   ; $4AE5: $19
    ld   c, $03                                   ; $4AE6: $0E $03
    call RenderActiveEntitySpritesRect            ; $4AE8: $CD $E6 $3C

.jr_4AEB
    ldh  a, [hActiveEntitySpriteVariant]          ; $4AEB: $F0 $F1
    rla                                           ; $4AED: $17
    rla                                           ; $4AEE: $17
    and  $FC                                      ; $4AEF: $E6 $FC
    ld   e, a                                     ; $4AF1: $5F
    rla                                           ; $4AF2: $17
    and  $F8                                      ; $4AF3: $E6 $F8
    add  e                                        ; $4AF5: $83
    ld   e, a                                     ; $4AF6: $5F
    ld   d, b                                     ; $4AF7: $50
    ld   hl, Data_015_4A15                        ; $4AF8: $21 $15 $4A
    add  hl, de                                   ; $4AFB: $19
    ld   c, $03                                   ; $4AFC: $0E $03
    call RenderActiveEntitySpritesRect            ; $4AFE: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $4B01: $21 $10 $C3
    add  hl, bc                                   ; $4B04: $09
    ld   a, [hl]                                  ; $4B05: $7E
    and  a                                        ; $4B06: $A7
    ret  z                                        ; $4B07: $C8

    ldh  a, [hActiveEntityPosY]                   ; $4B08: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $4B0A: $E0 $EC
    ld   hl, Data_015_4ABD                        ; $4B0C: $21 $BD $4A
    ld   c, $03                                   ; $4B0F: $0E $03
    call RenderActiveEntitySpritesRect            ; $4B11: $CD $E6 $3C

.jr_4B14
    jp   CopyEntityPositionToActivePosition       ; $4B14: $C3 $8A $3D
