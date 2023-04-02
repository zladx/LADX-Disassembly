Data_006_55E3::
    db   $00, $04

Data_006_55E5::
    db   $FC, $08, $F8

DesertLanmolaEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ; $55E8: $21 $D0 $C2
    add  hl, bc                                   ; $55EB: $09
    ld   a, [hl]                                  ; $55EC: $7E
    cp   $02                                      ; $55ED: $FE $02
    jp   z, label_006_5988                        ; $55EF: $CA $88 $59

    cp   $00                                      ; $55F2: $FE $00
    jr   nz, jr_006_5611                          ; $55F4: $20 $1B

    inc  [hl]                                     ; $55F6: $34
    ld   a, MUSIC_MINIBOSS                        ; $55F7: $3E $50
    ldh  [hDefaultMusicTrack], a                  ; $55F9: $E0 $B0
    ld   hl, wEntitiesPosZTable                   ; $55FB: $21 $10 $C3
    add  hl, bc                                   ; $55FE: $09
    ld   [hl], $FF                                ; $55FF: $36 $FF
    call GetEntityTransitionCountdown             ; $5601: $CD $05 $0C
    ld   [hl], $50                                ; $5604: $36 $50
    ld   e, $00                                   ; $5606: $1E $00
    ld   a, $FF                                   ; $5608: $3E $FF
    ld   hl, wD200                                ; $560A: $21 $00 $D2

.loop_560D
    ld   [hl+], a                                 ; $560D: $22
    dec  e                                        ; $560E: $1D
    jr   nz, .loop_560D                           ; $560F: $20 $FC

jr_006_5611:
    call func_006_58C9                            ; $5611: $CD $C9 $58
    ldh  a, [hActiveEntityStatus]                 ; $5614: $F0 $EA
    cp   $01                                      ; $5616: $FE $01
    jp   nz, label_006_56C8                       ; $5618: $C2 $C8 $56

    ld   hl, wEntitiesPrivateState2Table          ; $561B: $21 $C0 $C2
    add  hl, bc                                   ; $561E: $09
    ld   a, [hl]                                  ; $561F: $7E
    JP_TABLE                                      ; $5620
._00 dw func_006_5629                             ; $5621
._01 dw func_006_563A                             ; $5623
._02 dw func_006_564B                             ; $5625
._03 dw func_006_56C7                             ; $5627

func_006_5629::
    ld   hl, wEntitiesFlashCountdownTable         ; $5629: $21 $20 $C4
    add  hl, bc                                   ; $562C: $09
    ld   [hl], $FF                                ; $562D: $36 $FF
    call GetEntityTransitionCountdown             ; $562F: $CD $05 $0C
    ld   [hl], $60                                ; $5632: $36 $60

IncrementEntityPrivateState2::
    ld   hl, wEntitiesPrivateState2Table          ; $5634: $21 $C0 $C2
    add  hl, bc                                   ; $5637: $09
    inc  [hl]                                     ; $5638: $34
    ret                                           ; $5639: $C9

func_006_563A::
    call GetEntityTransitionCountdown             ; $563A: $CD $05 $0C
    jr   nz, .ret_564A                            ; $563D: $20 $0B

    ld   [hl], $CF                                ; $563F: $36 $CF
    call IncrementEntityPrivateState2             ; $5641: $CD $34 $56
    ld   hl, wEntitiesPrivateState4Table          ; $5644: $21 $40 $C4
    add  hl, bc                                   ; $5647: $09
    ld   [hl], $05                                ; $5648: $36 $05

.ret_564A
    ret                                           ; $564A: $C9

func_006_564B::
    call GetEntityTransitionCountdown             ; $564B: $CD $05 $0C
    jr   nz, .jr_568A                             ; $564E: $20 $3A

    call label_27DD                               ; $5650: $CD $DD $27
    ld   a, ENTITY_KEY_DROP_POINT                 ; $5653: $3E $30
    call SpawnNewEntity_trampoline                ; $5655: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $5658: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $565A: $21 $00 $C2
    add  hl, de                                   ; $565D: $19
    ld   [hl], a                                  ; $565E: $77
    ldh  a, [hMultiPurpose1]                      ; $565F: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5661: $21 $10 $C2
    add  hl, de                                   ; $5664: $19
    ld   [hl], a                                  ; $5665: $77
    ldh  a, [hMultiPurpose3]                      ; $5666: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $5668: $21 $10 $C3
    add  hl, de                                   ; $566B: $19
    ld   [hl], a                                  ; $566C: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $566D: $21 $B0 $C3
    add  hl, de                                   ; $5670: $19
    ld   [hl], $02                                ; $5671: $36 $02
    ld   hl, wEntitiesSpeedZTable                 ; $5673: $21 $20 $C3
    add  hl, de                                   ; $5676: $19
    ld   [hl], $10                                ; $5677: $36 $10
    ld   hl, wEntitiesPrivateCountdown1Table      ; $5679: $21 $F0 $C2
    add  hl, de                                   ; $567C: $19
    ld   [hl], $10                                ; $567D: $36 $10
    call ClearEntityStatus_06                     ; $567F: $CD $DB $65
    ldh  a, [hActiveEntityPosX]                   ; $5682: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5684: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5686: $F0 $EC
    jr   jr_006_56BB                              ; $5688: $18 $31

.jr_568A
    and  $1F                                      ; $568A: $E6 $1F
    jr   nz, ret_006_56C6                         ; $568C: $20 $38

    ld   hl, wEntitiesInertiaTable                ; $568E: $21 $D0 $C3
    add  hl, bc                                   ; $5691: $09
    ld   a, [hl]                                  ; $5692: $7E
    ld   hl, wEntitiesPrivateState4Table          ; $5693: $21 $40 $C4
    add  hl, bc                                   ; $5696: $09
    ld   e, [hl]                                  ; $5697: $5E
    dec  [hl]                                     ; $5698: $35
    ld   d, b                                     ; $5699: $50
    ld   hl, Data_006_58C3                        ; $569A: $21 $C3 $58
    add  hl, de                                   ; $569D: $19
    sub  [hl]                                     ; $569E: $96
    ld   e, a                                     ; $569F: $5F
    ld   d, b                                     ; $56A0: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $56A1: $21 $00 $D0
    add  hl, de                                   ; $56A4: $19
    ld   a, [hl]                                  ; $56A5: $7E
    ldh  [hMultiPurpose0], a                      ; $56A6: $E0 $D7
    ld   hl, wD200                                ; $56A8: $21 $00 $D2
    add  hl, de                                   ; $56AB: $19
    ld   a, [hl]                                  ; $56AC: $7E
    and  $80                                      ; $56AD: $E6 $80
    jr   nz, ret_006_56C6                         ; $56AF: $20 $15

    push hl                                       ; $56B1: $E5
    ld   hl, wD100                                ; $56B2: $21 $00 $D1
    add  hl, de                                   ; $56B5: $19
    ld   a, [hl]                                  ; $56B6: $7E
    pop  hl                                       ; $56B7: $E1
    sub  [hl]                                     ; $56B8: $96
    ld   [hl], $FF                                ; $56B9: $36 $FF

jr_006_56BB:
    ldh  [hMultiPurpose1], a                      ; $56BB: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $56BD: $3E $02
    call AddTranscientVfx                         ; $56BF: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $56C2: $3E $13
    ldh  [hNoiseSfx], a                           ; $56C4: $E0 $F4

ret_006_56C6:
    ret                                           ; $56C6: $C9

func_006_56C7::
    ret                                           ; $56C7: $C9

label_006_56C8:
    call ReturnIfNonInteractive_06                ; $56C8: $CD $C6 $64
    call BossIntro                                ; $56CB: $CD $E8 $3E
    call GetEntityPrivateCountdown1               ; $56CE: $CD $00 $0C
    jr   z, jr_006_5726                           ; $56D1: $28 $53

    and  $0F                                      ; $56D3: $E6 $0F
    jr   nz, jr_006_5726                          ; $56D5: $20 $4F

    ld   a, $02                                   ; $56D7: $3E $02

.loop_56D9
    ldh  [hMultiPurposeG], a                      ; $56D9: $E0 $E8
    ld   a, ENTITY_DESERT_LANMOLA                 ; $56DB: $3E $87
    call SpawnNewEntity_trampoline                ; $56DD: $CD $86 $3B
    jr   c, jr_006_5726                           ; $56E0: $38 $44

    push bc                                       ; $56E2: $C5
    ldh  a, [hMultiPurposeG]                      ; $56E3: $F0 $E8
    ld   c, a                                     ; $56E5: $4F
    ld   hl, wEntitiesSpriteVariantTable          ; $56E6: $21 $B0 $C3
    add  hl, de                                   ; $56E9: $19
    and  $02                                      ; $56EA: $E6 $02
    ld   [hl], a                                  ; $56EC: $77
    ld   a, [wC1CD]                               ; $56ED: $FA $CD $C1
    ld   hl, Data_006_55E3                        ; $56F0: $21 $E3 $55
    add  hl, bc                                   ; $56F3: $09
    add  [hl]                                     ; $56F4: $86
    ld   hl, wEntitiesPosXTable                   ; $56F5: $21 $00 $C2
    add  hl, de                                   ; $56F8: $19
    ld   [hl], a                                  ; $56F9: $77
    ld   hl, Data_006_55E5                        ; $56FA: $21 $E5 $55
    add  hl, bc                                   ; $56FD: $09
    ld   a, [hl]                                  ; $56FE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $56FF: $21 $40 $C2
    add  hl, de                                   ; $5702: $19
    ld   [hl], a                                  ; $5703: $77
    ld   a, [wC1CE]                               ; $5704: $FA $CE $C1
    add  $00                                      ; $5707: $C6 $00
    ld   hl, wEntitiesPosYTable                   ; $5709: $21 $10 $C2
    add  hl, de                                   ; $570C: $19
    ld   [hl], a                                  ; $570D: $77
    ld   hl, wEntitiesSpeedYTable                 ; $570E: $21 $50 $C2
    add  hl, de                                   ; $5711: $19
    ld   [hl], $F0                                ; $5712: $36 $F0
    ld   hl, wEntitiesPrivateState3Table          ; $5714: $21 $D0 $C2
    add  hl, de                                   ; $5717: $19
    ld   [hl], $02                                ; $5718: $36 $02
    ld   hl, wEntitiesPhysicsFlagsTable           ; $571A: $21 $40 $C3
    add  hl, de                                   ; $571D: $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $571E: $36 $C1
    pop  bc                                       ; $5720: $C1
    ldh  a, [hMultiPurposeG]                      ; $5721: $F0 $E8
    dec  a                                        ; $5723: $3D
    jr   nz, .loop_56D9                           ; $5724: $20 $B3

jr_006_5726:
    call func_006_594C                            ; $5726: $CD $4C $59
    call DecrementEntityIgnoreHitsCountdown       ; $5729: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $572C: $F0 $F0
    cp   $02                                      ; $572E: $FE $02
    jr   c, .jr_5754                              ; $5730: $38 $22

    ld   hl, wEntitiesInertiaTable                ; $5732: $21 $D0 $C3
    add  hl, bc                                   ; $5735: $09
    ld   a, [hl]                                  ; $5736: $7E
    inc  [hl]                                     ; $5737: $34
    and  $FF                                      ; $5738: $E6 $FF
    ld   e, a                                     ; $573A: $5F
    ld   d, b                                     ; $573B: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $573C: $21 $00 $D0
    add  hl, de                                   ; $573F: $19
    ldh  a, [hActiveEntityPosX]                   ; $5740: $F0 $EE
    ld   [hl], a                                  ; $5742: $77
    ld   hl, wD100                                ; $5743: $21 $00 $D1
    add  hl, de                                   ; $5746: $19
    ldh  a, [hActiveEntityPosY]                   ; $5747: $F0 $EF
    ld   [hl], a                                  ; $5749: $77
    ld   hl, wEntitiesPosZTable                   ; $574A: $21 $10 $C3
    add  hl, bc                                   ; $574D: $09
    ld   a, [hl]                                  ; $574E: $7E
    ld   hl, wD200                                ; $574F: $21 $00 $D2
    add  hl, de                                   ; $5752: $19
    ld   [hl], a                                  ; $5753: $77

.jr_5754
    ldh  a, [hActiveEntityState]                  ; $5754: $F0 $F0
    JP_TABLE                                      ; $5756
._00 dw func_006_5773                             ; $5757
._01 dw func_006_57A8                             ; $5759
._02 dw func_006_57ED                             ; $575B
._03 dw func_006_580C                             ; $575D
._04 dw func_006_5835                             ; $575F
._05 dw DesertLanmolaSpriteVariants               ; $5761

Data_006_5763::
    db   $28, $38, $48, $58, $68, $78, $88, $28

Data_006_576B::
    db   $30, $40, $50, $60, $70, $30, $40, $50

func_006_5773::
    call GetEntityTransitionCountdown             ; $5773: $CD $05 $0C
    ret  nz                                       ; $5776: $C0

    call GetEntityTransitionCountdown             ; $5777: $CD $05 $0C
    ld   [hl], $18                                ; $577A: $36 $18
    call GetRandomByte                            ; $577C: $CD $0D $28
    and  $07                                      ; $577F: $E6 $07
    ld   e, a                                     ; $5781: $5F
    ld   d, b                                     ; $5782: $50
    ld   hl, Data_006_5763                        ; $5783: $21 $63 $57
    add  hl, de                                   ; $5786: $19
    ld   a, [hl]                                  ; $5787: $7E
    ld   hl, wEntitiesPosXTable                   ; $5788: $21 $00 $C2
    add  hl, bc                                   ; $578B: $09
    ld   [hl], a                                  ; $578C: $77
    call GetRandomByte                            ; $578D: $CD $0D $28
    and  $07                                      ; $5790: $E6 $07
    ld   e, a                                     ; $5792: $5F
    ld   hl, Data_006_576B                        ; $5793: $21 $6B $57
    add  hl, de                                   ; $5796: $19
    ld   a, [hl]                                  ; $5797: $7E
    ld   hl, wEntitiesPosYTable                   ; $5798: $21 $10 $C2
    add  hl, bc                                   ; $579B: $09

.jr_579C
    ld   [hl], a                                  ; $579C: $77

.jr_579D
    ld   hl, wEntitiesPosZTable                   ; $579D: $21 $10 $C3
    add  hl, bc                                   ; $57A0: $09
    ld   [hl], b                                  ; $57A1: $70
    call CopyEntityPositionToActivePosition       ; $57A2: $CD $8A $3D
    jp   IncrementEntityState                     ; $57A5: $C3 $12 $3B

func_006_57A8::
    call GetEntityTransitionCountdown             ; $57A8: $CD $05 $0C
    jr   nz, jr_006_57E0                          ; $57AB: $20 $33

    ld   [hl], $20                                ; $57AD: $36 $20
    ldh  a, [hLinkPositionX]                      ; $57AF: $F0 $98
    push af                                       ; $57B1: $F5

.jr_57B2
    ldh  a, [hLinkPositionY]                      ; $57B2: $F0 $99
    push af                                       ; $57B4: $F5
    ld   a, $58                                   ; $57B5: $3E $58
    ldh  [hLinkPositionX], a                      ; $57B7: $E0 $98
    ld   a, $50                                   ; $57B9: $3E $50
    ldh  [hLinkPositionY], a                      ; $57BB: $E0 $99
    ld   a, $08                                   ; $57BD: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $57BF: $CD $AA $3B
    pop  af                                       ; $57C2: $F1
    ldh  [hLinkPositionY], a                      ; $57C3: $E0 $99
    pop  af                                       ; $57C5: $F1
    ldh  [hLinkPositionX], a                      ; $57C6: $E0 $98
    ld   hl, wEntitiesSpeedZTable                 ; $57C8: $21 $20 $C3
    add  hl, bc                                   ; $57CB: $09
    ld   [hl], $08                                ; $57CC: $36 $08
    ldh  a, [hActiveEntityPosX]                   ; $57CE: $F0 $EE
    ld   [wC1CD], a                               ; $57D0: $EA $CD $C1
    ldh  a, [hActiveEntityPosY]                   ; $57D3: $F0 $EF
    ld   [wC1CE], a                               ; $57D5: $EA $CE $C1
    call GetEntityPrivateCountdown1               ; $57D8: $CD $00 $0C
    ld   [hl], $61                                ; $57DB: $36 $61
    call IncrementEntityState                     ; $57DD: $CD $12 $3B

jr_006_57E0:
    ldh  a, [hFrameCounter]                       ; $57E0: $F0 $E7
    rra                                           ; $57E2: $1F
    rra                                           ; $57E3: $1F
    rra                                           ; $57E4: $1F
    rra                                           ; $57E5: $1F
    and  $01                                      ; $57E6: $E6 $01
    add  $05                                      ; $57E8: $C6 $05
    jp   SetEntitySpriteVariant                   ; $57EA: $C3 $0C $3B

func_006_57ED::
    call GetEntityTransitionCountdown             ; $57ED: $CD $05 $0C
    jr   nz, .jr_5803                             ; $57F0: $20 $11

    call GetRandomByte                            ; $57F2: $CD $0D $28
    and  $1F                                      ; $57F5: $E6 $1F
    add  $20                                      ; $57F7: $C6 $20
    ld   [hl], a                                  ; $57F9: $77
    ld   hl, wEntitiesPrivateState1Table          ; $57FA: $21 $B0 $C2
    add  hl, bc                                   ; $57FD: $09
    ld   [hl], $20                                ; $57FE: $36 $20
    call IncrementEntityState                     ; $5800: $CD $12 $3B

.jr_5803
    call UpdateEntityPosWithSpeed_06              ; $5803: $CD $41 $65
    call AddEntityZSpeedToPos_06                  ; $5806: $CD $7A $65
    jp   label_3B39                               ; $5809: $C3 $39 $3B

func_006_580C::
    call GetEntityTransitionCountdown             ; $580C: $CD $05 $0C
    jr   nz, .jr_5816                             ; $580F: $20 $05

    ld   [hl], $80                                ; $5811: $36 $80
    call IncrementEntityState                     ; $5813: $CD $12 $3B

.jr_5816
    ld   hl, wEntitiesPrivateState1Table          ; $5816: $21 $B0 $C2
    add  hl, bc                                   ; $5819: $09
    ld   a, [hl]                                  ; $581A: $7E
    inc  [hl]                                     ; $581B: $34
    ld   a, [hl]                                  ; $581C: $7E
    bit  0, a                                     ; $581D: $CB $47
    jr   nz, jr_006_582C                          ; $581F: $20 $0B

    ld   hl, wEntitiesSpeedZTable                 ; $5821: $21 $20 $C3
    add  hl, bc                                   ; $5824: $09
    and  $20                                      ; $5825: $E6 $20
    jr   nz, .jr_582B                             ; $5827: $20 $02

    inc  [hl]                                     ; $5829: $34
    inc  [hl]                                     ; $582A: $34

.jr_582B
    dec  [hl]                                     ; $582B: $35

jr_006_582C:
    call UpdateEntityPosWithSpeed_06              ; $582C: $CD $41 $65
    call AddEntityZSpeedToPos_06                  ; $582F: $CD $7A $65
    jp   label_3B39                               ; $5832: $C3 $39 $3B

func_006_5835::
    call GetEntityTransitionCountdown             ; $5835: $CD $05 $0C
    jr   nz, .jr_5841                             ; $5838: $20 $07

    ld   [hl], $60                                ; $583A: $36 $60
    call IncrementEntityState                     ; $583C: $CD $12 $3B
    ld   [hl], b                                  ; $583F: $70
    ret                                           ; $5840: $C9

.jr_5841
    cp   $78                                      ; $5841: $FE $78
    jr   nz, .jr_5858                             ; $5843: $20 $13

    ldh  a, [hActiveEntityPosX]                   ; $5845: $F0 $EE
    ld   [wC1CD], a                               ; $5847: $EA $CD $C1
    ldh  a, [hActiveEntityPosY]                   ; $584A: $F0 $EF
    ld   [wC1CE], a                               ; $584C: $EA $CE $C1
    call GetEntityPrivateCountdown1               ; $584F: $CD $00 $0C
    ld   [hl], $60                                ; $5852: $36 $60
    ld   a, NOISE_SFX_LANMOLA_BURROW              ; $5854: $3E $23
    ldh  [hNoiseSfx], a                           ; $5856: $E0 $F4

.jr_5858
    ld   hl, wEntitiesSpeedZTable                 ; $5858: $21 $20 $C3
    add  hl, bc                                   ; $585B: $09
    ld   a, [hl]                                  ; $585C: $7E
    sub  $F4                                      ; $585D: $D6 $F4
    and  $80                                      ; $585F: $E6 $80
    jr   nz, .jr_5864                             ; $5861: $20 $01

    dec  [hl]                                     ; $5863: $35

.jr_5864
    ldh  a, [hFrameCounter]                       ; $5864: $F0 $E7
    and  $07                                      ; $5866: $E6 $07
    jr   nz, jr_006_5888                          ; $5868: $20 $1E

    ld   hl, wEntitiesSpeedXTable                 ; $586A: $21 $40 $C2
    add  hl, bc                                   ; $586D: $09
    ld   a, [hl]                                  ; $586E: $7E
    and  a                                        ; $586F: $A7
    jr   z, jr_006_5879                           ; $5870: $28 $07

    and  $80                                      ; $5872: $E6 $80
    jr   z, .jr_5878                              ; $5874: $28 $02

    inc  [hl]                                     ; $5876: $34
    inc  [hl]                                     ; $5877: $34

.jr_5878
    dec  [hl]                                     ; $5878: $35

jr_006_5879:
    ld   hl, wEntitiesSpeedYTable                 ; $5879: $21 $50 $C2
    add  hl, bc                                   ; $587C: $09
    ld   a, [hl]                                  ; $587D: $7E
    and  a                                        ; $587E: $A7
    jr   z, jr_006_5888                           ; $587F: $28 $07

    and  $80                                      ; $5881: $E6 $80
    jr   z, .jr_5887                              ; $5883: $28 $02

    inc  [hl]                                     ; $5885: $34
    inc  [hl]                                     ; $5886: $34

.jr_5887
    dec  [hl]                                     ; $5887: $35

jr_006_5888:
    call UpdateEntityPosWithSpeed_06              ; $5888: $CD $41 $65
    call AddEntityZSpeedToPos_06                  ; $588B: $CD $7A $65
    ld   hl, wEntitiesPosZTable                   ; $588E: $21 $10 $C3
    add  hl, bc                                   ; $5891: $09
    ld   a, [hl]                                  ; $5892: $7E
    and  $80                                      ; $5893: $E6 $80
    jr   nz, .jr_589A                             ; $5895: $20 $03

    call label_3B39                               ; $5897: $CD $39 $3B

.jr_589A
    ld   a, $02                                   ; $589A: $3E $02
    jp   SetEntitySpriteVariant                   ; $589C: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
DesertLanmolaSpriteVariants::
.variant0
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $74, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $72, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $70, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant4
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0
    db $76, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant6
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant8
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_YFLIP
    db $78, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

Data_006_58C3::
    db   $0C, $18, $24, $30, $3C, $48

func_006_58C9::
    ld   hl, wEntitiesPosZTable                   ; $58C9: $21 $10 $C3
    add  hl, bc                                   ; $58CC: $09
    ld   a, [hl]                                  ; $58CD: $7E
    and  $80                                      ; $58CE: $E6 $80
    jr   nz, .jr_58D8                             ; $58D0: $20 $06

    ld   de, DesertLanmolaSpriteVariants          ; $58D2: $11 $9F $58
    call RenderActiveEntitySpritesPair            ; $58D5: $CD $C0 $3B

.jr_58D8
    ld   hl, wEntitiesInertiaTable                ; $58D8: $21 $D0 $C3
    add  hl, bc                                   ; $58DB: $09
    ld   a, [hl]                                  ; $58DC: $7E
    ldh  [hMultiPurpose0], a                      ; $58DD: $E0 $D7
    ldh  a, [hFrameCounter]                       ; $58DF: $F0 $E7
    and  $01                                      ; $58E1: $E6 $01
    jr   z, .jr_58ED                              ; $58E3: $28 $08

    ld   a, $06                                   ; $58E5: $3E $06
    ldh  [hIndexOfObjectBelowLink], a             ; $58E7: $E0 $E9
    ld   a, $00                                   ; $58E9: $3E $00
    jr   jr_006_58F3                              ; $58EB: $18 $06

.jr_58ED
    ld   a, $FF                                   ; $58ED: $3E $FF
    ldh  [hIndexOfObjectBelowLink], a             ; $58EF: $E0 $E9
    ld   a, $05                                   ; $58F1: $3E $05

jr_006_58F3:
    ldh  [hMultiPurposeG], a                      ; $58F3: $E0 $E8
    ld   e, a                                     ; $58F5: $5F
    ld   d, b                                     ; $58F6: $50
    ld   hl, Data_006_58C3                        ; $58F7: $21 $C3 $58
    add  hl, de                                   ; $58FA: $19
    ldh  a, [hMultiPurpose0]                      ; $58FB: $F0 $D7
    sub  [hl]                                     ; $58FD: $96
    and  $FF                                      ; $58FE: $E6 $FF
    ld   e, a                                     ; $5900: $5F
    ld   d, $00                                   ; $5901: $16 $00
    ld   hl, wIsFileSelectionArrowShifted         ; $5903: $21 $00 $D0
    add  hl, de                                   ; $5906: $19
    ld   a, [hl]                                  ; $5907: $7E
    ldh  [hActiveEntityPosX], a                   ; $5908: $E0 $EE
    ld   hl, wD100                                ; $590A: $21 $00 $D1
    add  hl, de                                   ; $590D: $19
    ld   a, [hl]                                  ; $590E: $7E
    ldh  [hActiveEntityPosY], a                   ; $590F: $E0 $EF
    ld   hl, wD200                                ; $5911: $21 $00 $D2
    add  hl, de                                   ; $5914: $19
    sub  [hl]                                     ; $5915: $96
    ldh  [hActiveEntityVisualPosY], a             ; $5916: $E0 $EC
    ld   a, [hl]                                  ; $5918: $7E
    and  $80                                      ; $5919: $E6 $80
    jr   nz, jr_006_5936                          ; $591B: $20 $19

    ldh  a, [hMultiPurposeG]                      ; $591D: $F0 $E8
    cp   $05                                      ; $591F: $FE $05
    ld   a, $04                                   ; $5921: $3E $04
    jr   nz, .jr_592E                             ; $5923: $20 $09

    ldh  a, [hFrameCounter]                       ; $5925: $F0 $E7
    rra                                           ; $5927: $1F
    rra                                           ; $5928: $1F
    rra                                           ; $5929: $1F
    and  $01                                      ; $592A: $E6 $01
    add  $07                                      ; $592C: $C6 $07

.jr_592E
    ldh  [hActiveEntitySpriteVariant], a          ; $592E: $E0 $F1
    ld   de, DesertLanmolaSpriteVariants          ; $5930: $11 $9F $58
    call RenderActiveEntitySpritesPair            ; $5933: $CD $C0 $3B

jr_006_5936:
    ld   e, $FF                                   ; $5936: $1E $FF
    ldh  a, [hFrameCounter]                       ; $5938: $F0 $E7
    and  $01                                      ; $593A: $E6 $01
    jr   z, .jr_5940                              ; $593C: $28 $02

    ld   e, $01                                   ; $593E: $1E $01

.jr_5940
    ld   hl, hIndexOfObjectBelowLink              ; $5940: $21 $E9 $FF
    ldh  a, [hMultiPurposeG]                      ; $5943: $F0 $E8
    add  e                                        ; $5945: $83
    cp   [hl]                                     ; $5946: $BE
    jr   nz, jr_006_58F3                          ; $5947: $20 $AA

    jp   CopyEntityPositionToActivePosition       ; $5949: $C3 $8A $3D

func_006_594C::
    ld   hl, wEntitiesSpeedXTable                 ; $594C: $21 $40 $C2
    add  hl, bc                                   ; $594F: $09
    ld   a, [hl]                                  ; $5950: $7E
    ld   d, a                                     ; $5951: $57
    bit  7, a                                     ; $5952: $CB $7F
    jr   z, .jr_5958                              ; $5954: $28 $02

    cpl                                           ; $5956: $2F
    inc  a                                        ; $5957: $3C

.jr_5958
    ld   e, a                                     ; $5958: $5F
    ld   hl, wEntitiesSpeedYTable                 ; $5959: $21 $50 $C2
    add  hl, bc                                   ; $595C: $09
    ld   a, [hl]                                  ; $595D: $7E
    bit  7, a                                     ; $595E: $CB $7F
    jr   z, .jr_5964                              ; $5960: $28 $02

    cpl                                           ; $5962: $2F
    inc  a                                        ; $5963: $3C

.jr_5964
    cp   e                                        ; $5964: $BB
    jr   nc, jr_006_5973                          ; $5965: $30 $0C

    bit  7, d                                     ; $5967: $CB $7A
    jr   nz, .jr_596F                             ; $5969: $20 $04

    ld   a, $01                                   ; $596B: $3E $01
    jr   jr_006_597D                              ; $596D: $18 $0E

.jr_596F
    ld   a, $00                                   ; $596F: $3E $00
    jr   jr_006_597D                              ; $5971: $18 $0A

jr_006_5973:
    bit  7, [hl]                                  ; $5973: $CB $7E
    jr   nz, .jr_597B                             ; $5975: $20 $04

    ld   a, $02                                   ; $5977: $3E $02
    jr   jr_006_597D                              ; $5979: $18 $02

.jr_597B
    ld   a, $03                                   ; $597B: $3E $03

jr_006_597D:
    jp   SetEntitySpriteVariant                   ; $597D: $C3 $0C $3B

Data_006_5980::
    db   $7C, $21, $7E, $21, $7C, $01, $7E, $01

label_006_5988:
    ld   de, Data_006_5980                        ; $5988: $11 $80 $59
    call RenderActiveEntitySprite                 ; $598B: $CD $77 $3C
    call ReturnIfNonInteractive_06                ; $598E: $CD $C6 $64
    call UpdateEntityPosWithSpeed_06              ; $5991: $CD $41 $65
    ld   hl, wEntitiesSpeedYTable                 ; $5994: $21 $50 $C2
    add  hl, bc                                   ; $5997: $09
    inc  [hl]                                     ; $5998: $34
    ld   a, [hl]                                  ; $5999: $7E
    and  a                                        ; $599A: $A7
    jr   nz, .jr_59A2                             ; $599B: $20 $05

    ld   hl, wEntitiesSpriteVariantTable          ; $599D: $21 $B0 $C3
    add  hl, bc                                   ; $59A0: $09
    inc  [hl]                                     ; $59A1: $34

.jr_59A2
    cp   $10                                      ; $59A2: $FE $10
    ret  nz                                       ; $59A4: $C0

    jp   ClearEntityStatus_06                     ; $59A5: $C3 $DB $65
