; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CuccoSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0
.variant1
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0
.variant2
    db $52, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $56, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

CuccoEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $4524: $21 $60 $C3
    add  hl, bc                                   ; $4527: $09
    ld   [hl], $4C                                ; $4528: $36 $4C
    ld   hl, wEntitiesDirectionTable              ; $452A: $21 $80 $C3
    add  hl, bc                                   ; $452D: $09
    ld   a, [hl]                                  ; $452E: $7E
    and  a                                        ; $452F: $A7
    jr   nz, .jr_4538                             ; $4530: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $4532: $F0 $F1
    add  $02                                      ; $4534: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $4536: $E0 $F1

.jr_4538
    ld   de, CuccoSpriteVariants                  ; $4538: $11 $14 $45
    call RenderActiveEntitySpritesPair            ; $453B: $CD $C0 $3B
    ldh  a, [hActiveEntityStatus]                 ; $453E: $F0 $EA
    cp   $07                                      ; $4540: $FE $07
    jr   nz, jr_005_4557                          ; $4542: $20 $13

    ldh  a, [hFrameCounter]                       ; $4544: $F0 $E7
    and  $1F                                      ; $4546: $E6 $1F
    jr   nz, .jr_454E                             ; $4548: $20 $04

    ld   a, WAVE_SFX_CUCCO_HURT                   ; $454A: $3E $13
    ldh  [hWaveSfx], a                            ; $454C: $E0 $F3

.jr_454E
    ldh  a, [hFrameCounter]                       ; $454E: $F0 $E7
    rra                                           ; $4550: $1F
    rra                                           ; $4551: $1F
    and  $01                                      ; $4552: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4554: $C3 $0C $3B

jr_005_4557:
    call ReturnIfNonInteractive_05                ; $4557: $CD $3A $7A
    call label_3B70                               ; $455A: $CD $70 $3B
    call DecrementEntityIgnoreHitsCountdown       ; $455D: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $4560: $F0 $F0
    cp   $03                                      ; $4562: $FE $03
    jr   z, .jr_4580                              ; $4564: $28 $1A

    call AddEntityZSpeedToPos_05                  ; $4566: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $4569: $21 $20 $C3
    add  hl, bc                                   ; $456C: $09
    dec  [hl]                                     ; $456D: $35
    ld   hl, wEntitiesPosZTable                   ; $456E: $21 $10 $C3
    add  hl, bc                                   ; $4571: $09
    ld   a, [hl]                                  ; $4572: $7E
    and  $80                                      ; $4573: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $4575: $E0 $E8
    jr   z, .jr_4580                              ; $4577: $28 $07

    xor  a                                        ; $4579: $AF
    ld   [hl], a                                  ; $457A: $77
    ld   hl, wEntitiesSpeedZTable                 ; $457B: $21 $20 $C3
    add  hl, bc                                   ; $457E: $09
    ld   [hl], a                                  ; $457F: $77

.jr_4580
    ld   hl, wEntitiesFlashCountdownTable         ; $4580: $21 $20 $C4
    add  hl, bc                                   ; $4583: $09
    ld   a, [hl]                                  ; $4584: $7E
    and  a                                        ; $4585: $A7
    jr   z, jr_005_45BF                           ; $4586: $28 $37

    cp   $08                                      ; $4588: $FE $08
    jr   nz, jr_005_45B7                          ; $458A: $20 $2B

    ld   a, [wIsMarinFollowingLink]               ; $458C: $FA $73 $DB
    and  a                                        ; $458F: $A7
    jr   z, jr_005_45AD                           ; $4590: $28 $1B

    dec  [hl]                                     ; $4592: $35
    ld   a, [wTransitionSequenceCounter]          ; $4593: $FA $6B $C1
    cp   $04                                      ; $4596: $FE $04
    jr   nz, jr_005_45AD                          ; $4598: $20 $13

    call GetRandomByte                            ; $459A: $CD $0D $28
    and  $3F                                      ; $459D: $E6 $3F
    jr   nz, .jr_45A8                             ; $459F: $20 $07

    call_open_dialog Dialog276                    ; $45A1
    jr   jr_005_45AD                              ; $45A6: $18 $05

.jr_45A8
    call_open_dialog Dialog08F                    ; $45A8

jr_005_45AD:
    ld   hl, wEntitiesPrivateState1Table          ; $45AD: $21 $B0 $C2
    add  hl, bc                                   ; $45B0: $09
    ld   a, [hl]                                  ; $45B1: $7E
    cp   $23                                      ; $45B2: $FE $23
    jr   z, jr_005_45B7                           ; $45B4: $28 $01

    inc  [hl]                                     ; $45B6: $34

jr_005_45B7:
    call IncrementEntityState                     ; $45B7: $CD $12 $3B
    ld   a, $02                                   ; $45BA: $3E $02
    ld   [hl], a                                  ; $45BC: $77
    ldh  [hActiveEntityState], a                  ; $45BD: $E0 $F0

jr_005_45BF:
    call CheckLinkCollisionWithEnemy_trampoline   ; $45BF: $CD $5A $3B
    jr   nc, jr_005_4611                          ; $45C2: $30 $4D

    ldh  a, [hActiveEntityState]                  ; $45C4: $F0 $F0
    cp   $03                                      ; $45C6: $FE $03
    jr   z, jr_005_4611                           ; $45C8: $28 $47

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $45CA: $FA $9B $C1
    and  a                                        ; $45CD: $A7
    jr   nz, jr_005_4611                          ; $45CE: $20 $41

    ld   a, [wInventoryItems.BButtonSlot]         ; $45D0: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $45D3: $FE $03
    jr   nz, .jr_45DF                             ; $45D5: $20 $08

    ldh  a, [hJoypadState]                        ; $45D7: $F0 $CC
    and  J_B                                      ; $45D9: $E6 $20
    jr   nz, jr_005_45EC                          ; $45DB: $20 $0F

    jr   jr_005_4611                              ; $45DD: $18 $32

.jr_45DF
    ld   a, [wInventoryItems.AButtonSlot]         ; $45DF: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $45E2: $FE $03
    jr   nz, jr_005_4611                          ; $45E4: $20 $2B

    ldh  a, [hJoypadState]                        ; $45E6: $F0 $CC
    and  J_A                                      ; $45E8: $E6 $10
    jr   z, jr_005_4611                           ; $45EA: $28 $25

jr_005_45EC:
    ld   a, [wC3CF]                               ; $45EC: $FA $CF $C3
    and  a                                        ; $45EF: $A7
    jr   nz, jr_005_4611                          ; $45F0: $20 $1F

    inc  a                                        ; $45F2: $3C
    ld   [wC3CF], a                               ; $45F3: $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ; $45F6: $21 $80 $C2
    add  hl, bc                                   ; $45F9: $09
    ld   [hl], $07                                ; $45FA: $36 $07
    ld   hl, wEntitiesLiftedTable                 ; $45FC: $21 $90 $C4
    add  hl, bc                                   ; $45FF: $09
    ld   [hl], b                                  ; $4600: $70
    ldh  a, [hLinkDirection]                      ; $4601: $F0 $9E
    ld   [wC15D], a                               ; $4603: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $4606: $CD $05 $0C
    ld   [hl], $02                                ; $4609: $36 $02
    ld   hl, hWaveSfx                             ; $460B: $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ; $460E: $36 $02
    ret                                           ; $4610: $C9

jr_005_4611:
    ldh  a, [hActiveEntityState]                  ; $4611: $F0 $F0
    JP_TABLE                                      ; $4613
._00 dw func_005_4624                             ; $4614
._01 dw func_005_4663                             ; $4616
._02 dw func_005_46AF                             ; $4618
._03 dw func_005_474E                             ; $461A

Data_005_461C::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

func_005_4624::
    xor  a                                        ; $4624: $AF
    call SetEntitySpriteVariant                   ; $4625: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $4628: $CD $05 $0C
    ret  nz                                       ; $462B: $C0

    call GetRandomByte                            ; $462C: $CD $0D $28
    and  $07                                      ; $462F: $E6 $07
    ld   e, a                                     ; $4631: $5F
    ld   d, b                                     ; $4632: $50
    ld   hl, Data_005_461C                        ; $4633: $21 $1C $46
    add  hl, de                                   ; $4636: $19
    ld   a, [hl]                                  ; $4637: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4638: $21 $40 $C2
    add  hl, bc                                   ; $463B: $09
    ld   [hl], a                                  ; $463C: $77
    ld   a, e                                     ; $463D: $7B
    and  $04                                      ; $463E: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $4640: $21 $80 $C3
    add  hl, bc                                   ; $4643: $09
    ld   [hl], a                                  ; $4644: $77
    call GetRandomByte                            ; $4645: $CD $0D $28
    and  $07                                      ; $4648: $E6 $07
    ld   e, a                                     ; $464A: $5F
    ld   hl, Data_005_461C                        ; $464B: $21 $1C $46
    add  hl, de                                   ; $464E: $19
    ld   a, [hl]                                  ; $464F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4650: $21 $50 $C2
    add  hl, bc                                   ; $4653: $09
    ld   [hl], a                                  ; $4654: $77
    call GetEntityTransitionCountdown             ; $4655: $CD $05 $0C
    call GetRandomByte                            ; $4658: $CD $0D $28
    and  $1F                                      ; $465B: $E6 $1F
    add  $30                                      ; $465D: $C6 $30
    ld   [hl], a                                  ; $465F: $77
    jp   IncrementEntityState                     ; $4660: $C3 $12 $3B

func_005_4663::
    call UpdateEntityPosWithSpeed_05              ; $4663: $CD $B1 $7A
    call label_3B23                               ; $4666: $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ; $4669: $F0 $E8
    and  a                                        ; $466B: $A7
    jr   z, jr_005_4685                           ; $466C: $28 $17

    call GetEntityTransitionCountdown             ; $466E: $CD $05 $0C
    jr   nz, .jr_467A                             ; $4671: $20 $07

    ld   [hl], $30                                ; $4673: $36 $30
    call IncrementEntityState                     ; $4675: $CD $12 $3B
    ld   [hl], b                                  ; $4678: $70
    ret                                           ; $4679: $C9

.jr_467A
    ld   hl, wEntitiesSpeedZTable                 ; $467A: $21 $20 $C3
    add  hl, bc                                   ; $467D: $09
    ld   [hl], $05                                ; $467E: $36 $05
    ld   hl, wEntitiesPosZTable                   ; $4680: $21 $10 $C3
    add  hl, bc                                   ; $4683: $09
    inc  [hl]                                     ; $4684: $34

jr_005_4685:
    ldh  a, [hFrameCounter]                       ; $4685: $F0 $E7
    rra                                           ; $4687: $1F
    rra                                           ; $4688: $1F
    rra                                           ; $4689: $1F
    and  $01                                      ; $468A: $E6 $01
    jp   SetEntitySpriteVariant                   ; $468C: $C3 $0C $3B

Data_005_468F::
    db   $28, $48, $68, $88, $18, $38, $58, $78, $00, $00, $00, $00, $A0, $A0, $A0, $A0

Data_005_469F::
    db   $00, $00, $00, $00, $90, $90, $90, $90, $20, $40, $60, $80, $20, $40, $60, $80

func_005_46AF::
    ld   hl, wEntitiesPosZTable                   ; $46AF: $21 $10 $C3
    add  hl, bc                                   ; $46B2: $09
    ldh  a, [hFrameCounter]                       ; $46B3: $F0 $E7
    xor  c                                        ; $46B5: $A9
    and  $1F                                      ; $46B6: $E6 $1F
    or   [hl]                                     ; $46B8: $B6
    jr   nz, jr_005_46D2                          ; $46B9: $20 $17

    ld   a, $0C                                   ; $46BB: $3E $0C
    call GetVectorTowardsLink_trampoline          ; $46BD: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $46C0: $F0 $D7
    cpl                                           ; $46C2: $2F
    inc  a                                        ; $46C3: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $46C4: $21 $50 $C2
    add  hl, bc                                   ; $46C7: $09
    ld   [hl], a                                  ; $46C8: $77
    ldh  a, [hMultiPurpose1]                      ; $46C9: $F0 $D8
    cpl                                           ; $46CB: $2F
    inc  a                                        ; $46CC: $3C

.jr_46CD
    ld   hl, wEntitiesSpeedXTable                 ; $46CD: $21 $40 $C2
    add  hl, bc                                   ; $46D0: $09
    ld   [hl], a                                  ; $46D1: $77

jr_005_46D2:
    call UpdateEntityPosWithSpeed_05              ; $46D2: $CD $B1 $7A
    call label_3B23                               ; $46D5: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $46D8: $F0 $E7
    rra                                           ; $46DA: $1F
    rra                                           ; $46DB: $1F
    and  $01                                      ; $46DC: $E6 $01
    call SetEntitySpriteVariant                   ; $46DE: $CD $0C $3B
    call func_005_7B04                            ; $46E1: $CD $04 $7B
    ld   hl, wEntitiesDirectionTable              ; $46E4: $21 $80 $C3
    add  hl, bc                                   ; $46E7: $09
    ld   a, e                                     ; $46E8: $7B

.jr_46E9
    xor  $01                                      ; $46E9: $EE $01
    ld   [hl], a                                  ; $46EB: $77
    ld   hl, wEntitiesPrivateState1Table          ; $46EC: $21 $B0 $C2
    add  hl, bc                                   ; $46EF: $09
    ld   a, [hl]                                  ; $46F0: $7E
    cp   $23                                      ; $46F1: $FE $23
    jr   nz, .ret_474D                            ; $46F3: $20 $58

    ld   hl, wIsIndoor                            ; $46F5: $21 $A5 $DB
    ldh  a, [hFrameCounter]                       ; $46F8: $F0 $E7
    and  $0F                                      ; $46FA: $E6 $0F
    or   [hl]                                     ; $46FC: $B6
    jr   nz, .ret_474D                            ; $46FD: $20 $4E

    ld   a, ENTITY_CUCCO                          ; $46FF: $3E $6C
    ld   e, $07                                   ; $4701: $1E $07
    call SpawnNewEntityInRange_trampoline         ; $4703: $CD $98 $3B
    jr   c, .ret_474D                             ; $4706: $38 $45

    ld   a, WAVE_SFX_CUCCO_HURT                   ; $4708: $3E $13
    ldh  [hWaveSfx], a                            ; $470A: $E0 $F3
    ld   hl, wEntitiesStateTable                  ; $470C: $21 $90 $C2
    add  hl, de                                   ; $470F: $19
    ld   [hl], $03                                ; $4710: $36 $03
    ld   hl, wEntitiesPosZTable                   ; $4712: $21 $10 $C3
    add  hl, de                                   ; $4715: $19
    ld   [hl], $10                                ; $4716: $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4718: $21 $40 $C3
    add  hl, de                                   ; $471B: $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ; $471C: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $471E: $21 $50 $C3
    add  hl, de                                   ; $4721: $19
    ld   [hl], $80                                ; $4722: $36 $80
    ld   hl, wEntitiesOptions1Table               ; $4724: $21 $30 $C4
    add  hl, de                                   ; $4727: $19
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF        ; $4728: $36 $40
    push bc                                       ; $472A: $C5
    call GetRandomByte                            ; $472B: $CD $0D $28
    and  $0F                                      ; $472E: $E6 $0F
    ld   c, a                                     ; $4730: $4F
    ld   hl, Data_005_468F                        ; $4731: $21 $8F $46
    add  hl, bc                                   ; $4734: $09
    ld   a, [hl]                                  ; $4735: $7E
    ld   hl, wEntitiesPosXTable                   ; $4736: $21 $00 $C2
    add  hl, de                                   ; $4739: $19
    ld   [hl], a                                  ; $473A: $77
    ld   hl, Data_005_469F                        ; $473B: $21 $9F $46
    add  hl, bc                                   ; $473E: $09
    ld   a, [hl]                                  ; $473F: $7E
    ld   hl, wEntitiesPosYTable                   ; $4740: $21 $10 $C2
    add  hl, de                                   ; $4743: $19
    ld   [hl], a                                  ; $4744: $77
    ld   c, e                                     ; $4745: $4B
    ld   b, d                                     ; $4746: $42
    ld   a, $18                                   ; $4747: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $4749: $CD $AA $3B
    pop  bc                                       ; $474C: $C1

.ret_474D
    ret                                           ; $474D: $C9

func_005_474E::
    call label_3B44                               ; $474E: $CD $44 $3B
    call UpdateEntityPosWithSpeed_05              ; $4751: $CD $B1 $7A
    ldh  a, [hActiveEntityPosX]                   ; $4754: $F0 $EE
    cp   $A9                                      ; $4756: $FE $A9
    jp   nc, ClearEntityStatus_05                 ; $4758: $D2 $4B $7B

    ldh  a, [hActiveEntityVisualPosY]             ; $475B: $F0 $EC
    cp   $91                                      ; $475D: $FE $91
    jp   nc, ClearEntityStatus_05                 ; $475F: $D2 $4B $7B

    ldh  a, [hFrameCounter]                       ; $4762: $F0 $E7
    rra                                           ; $4764: $1F
    rra                                           ; $4765: $1F
    and  $01                                      ; $4766: $E6 $01
    call SetEntitySpriteVariant                   ; $4768: $CD $0C $3B
    ld   e, $00                                   ; $476B: $1E $00
    ld   hl, wEntitiesSpeedXTable                 ; $476D: $21 $40 $C2
    add  hl, bc                                   ; $4770: $09
    ld   a, [hl]                                  ; $4771: $7E
    and  $80                                      ; $4772: $E6 $80
    jr   z, .jr_4777                              ; $4774: $28 $01

    inc  e                                        ; $4776: $1C

.jr_4777
    ld   hl, wEntitiesDirectionTable              ; $4777: $21 $80 $C3
    add  hl, bc                                   ; $477A: $09
    ld   [hl], e                                  ; $477B: $73
    jp   PlayBoomerangSfx_trampoline              ; $477C: $C3 $F8 $29

    ret                                           ; $477F: $C9
