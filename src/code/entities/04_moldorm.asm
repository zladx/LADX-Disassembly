EntityInitMoldorm::
    xor  a                                        ; $5690: $AF
    ld   [wD201], a                               ; $5691: $EA $01 $D2
    ld   e, $80                                   ; $5694: $1E $80
    ld   hl, wD100                                ; $5696: $21 $00 $D1

.loop_5699
    xor  a                                        ; $5699: $AF
    ld   [hl+], a                                 ; $569A: $22
    dec  e                                        ; $569B: $1D
    jr   nz, .loop_5699                           ; $569C: $20 $FB

    ret                                           ; $569E: $C9

Data_004_569F::
    db   $06, $07, $00, $01, $02, $03, $04, $05

func_004_56A7::
    call ReturnIfNonInteractive_04                ; $56A7: $CD $A3 $7F
    jp   label_3B39                               ; $56AA: $C3 $39 $3B

MoldormEntityHandler::
    call label_394D                               ; $56AD: $CD $4D $39
    call func_004_56A7                            ; $56B0: $CD $A7 $56
    call func_004_5902                            ; $56B3: $CD $02 $59
    call DecrementEntityIgnoreHitsCountdown       ; $56B6: $CD $56 $0C
    ld   a, [wRoomTransitionState]                ; $56B9: $FA $24 $C1
    and  a                                        ; $56BC: $A7
    jp   nz, EntityInitMoldorm                    ; $56BD: $C2 $90 $56

    call BossIntro                                ; $56C0: $CD $E8 $3E
    ldh  a, [hActiveEntityStatus]                 ; $56C3: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $56C5: $FE $05
    jp   z, MoldormEntityActiveHandler            ; $56C7: $CA $91 $57

    ; Where to jump to load reward for killing boss of level 1
    ldh  a, [hActiveEntityState]                  ; $56CA: $F0 $F0
    JP_TABLE                                      ; $56CC: $C7
._00 dw MoldormDestructionFlashInitHandler
._01 dw MoldormDestructionFlash1Handler
._02 dw MoldormDestructionFlash2Handler
._03 dw BossDestructionHandler_04

MoldormDestructionFlashInitHandler::
    call GetEntityTransitionCountdown             ; $56D5: $CD $05 $0C
    ld   [hl], $60                                ; $56D8: $36 $60
    ld   hl, wEntitiesFlashCountdownTable         ; $56DA: $21 $20 $C4
    add  hl, bc                                   ; $56DD: $09
    ld   [hl], $FF                                ; $56DE: $36 $FF
    jp   IncrementEntityState                     ; $56E0: $C3 $12 $3B

MoldormDestructionFlash1Handler::
    call GetEntityTransitionCountdown             ; $56E3: $CD $05 $0C
    ret  nz                                       ; $56E6: $C0

    ; Transition to next stage
    ld   [hl], $FF                                ; $56E7: $36 $FF
    ld   hl, wEntitiesFlashCountdownTable         ; $56E9: $21 $20 $C4
    add  hl, bc                                   ; $56EC: $09
    ld   [hl], $FF                                ; $56ED: $36 $FF
    jp   IncrementEntityState                     ; $56EF: $C3 $12 $3B

MoldormDestructionFlash2Handler::
    call GetEntityTransitionCountdown             ; $56F2: $CD $05 $0C
    and  $1F                                      ; $56F5: $E6 $1F
    ret  nz                                       ; $56F7: $C0

    ; Transition to next stage
    ld   hl, wEntitiesPrivateState3Table          ; $56F8: $21 $D0 $C2
    add  hl, bc                                   ; $56FB: $09
    ld   a, [hl]                                  ; $56FC: $7E
    cp   $04                                      ; $56FD: $FE $04
    jr   z, .jr_5705                              ; $56FF: $28 $04

    inc  [hl]                                     ; $5701: $34
    jp   func_004_5A05                            ; $5702: $C3 $05 $5A

.jr_5705
    call GetEntityTransitionCountdown             ; $5705: $CD $05 $0C
    ld   [hl], $30                                ; $5708: $36 $30
    jp   IncrementEntityState                     ; $570A: $C3 $12 $3B

Data_004_570D::
    db   $00, $06, $08, $06, $00, $FA, $F8, $FA

Data_004_5715::
    db   $F8, $FA, $00, $06, $08, $06, $00, $FA

; Loop until boss destruction animation is done, then call to load heart
; Used from 4 different bosses: Moldorm, Genie, Slime Eye, Facade
BossDestructionHandler_04::
    call GetEntityTransitionCountdown             ; $571D
    jp   z, DropHeartContainer_04                 ; $5720: $CA $51 $57

    and  $03                                      ; $5723: $E6 $03
    jr   nz, .return                              ; $5725: $20 $29

    ld   a, [hl]                                  ; $5727: $7E
    rra                                           ; $5728: $1F
    rra                                           ; $5729: $1F
    and  $07                                      ; $572A: $E6 $07
    ld   e, a                                     ; $572C: $5F
    ld   d, b                                     ; $572D: $50
    ld   hl, Data_004_570D                        ; $572E: $21 $0D $57
    add  hl, de                                   ; $5731: $19
    ldh  a, [hActiveEntityPosX]                   ; $5732: $F0 $EE
    add  [hl]                                     ; $5734: $86
    ldh  [hActiveEntityPosX], a                   ; $5735: $E0 $EE
    ld   hl, Data_004_5715                        ; $5737: $21 $15 $57
    add  hl, de                                   ; $573A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $573B: $F0 $EC
    add  [hl]                                     ; $573D: $86
    ldh  [hActiveEntityVisualPosY], a             ; $573E: $E0 $EC
    call func_004_5A05                            ; $5740: $CD $05 $5A
    call GetEntityTransitionCountdown             ; $5743: $CD $05 $0C
    cp   $10                                      ; $5746: $FE $10
    jr   nz, .return                              ; $5748: $20 $06

    ld   hl, wEntitiesPrivateState3Table          ; $574A: $21 $D0 $C2
    add  hl, bc                                   ; $574D: $09
    ld   [hl], $05                                ; $574E: $36 $05

.return
    ret                                           ; $5750: $C9

; Load heart container value to load when boss is killed
; Used from 4 different bosses: Moldorm, Genie, Slime Eye, Facade
DropHeartContainer_04::
    ld   a, ENTITY_HEART_CONTAINER                ; $5751: $3E $36
    call SpawnNewEntity_trampoline                ; $5753: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $5756: $F0 $D7
    cp   $88                                      ; $5758: $FE $88
    jr   c, .jr_575E                              ; $575A: $38 $02

    ld   a, $88                                   ; $575C: $3E $88

.jr_575E
    cp   $18                                      ; $575E: $FE $18
    jr   nc, .jr_5764                             ; $5760: $30 $02

    ld   a, $18                                   ; $5762: $3E $18

.jr_5764
    ld   hl, wEntitiesPosXTable                   ; $5764: $21 $00 $C2
    add  hl, de                                   ; $5767: $19
    ld   [hl], a                                  ; $5768: $77
    ldh  a, [hMultiPurpose1]                      ; $5769: $F0 $D8
    cp   $70                                      ; $576B: $FE $70
    jr   c, .jr_5771                              ; $576D: $38 $02

    ld   a, $70                                   ; $576F: $3E $70

.jr_5771
    cp   $20                                      ; $5771: $FE $20
    jr   nc, .jr_5777                             ; $5773: $30 $02

    ld   a, $20                                   ; $5775: $3E $20

.jr_5777
    ld   hl, wEntitiesPosYTable                   ; $5777: $21 $10 $C2
    add  hl, de                                   ; $577A: $19
    ld   [hl], a                                  ; $577B: $77
    ld   hl, wEntitiesSpeedZTable                 ; $577C: $21 $20 $C3
    add  hl, de                                   ; $577F: $19
    ld   [hl], $10                                ; $5780: $36 $10
    ldh  a, [hMultiPurpose3]                      ; $5782: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $5784: $21 $10 $C3
    add  hl, de                                   ; $5787: $19
    ld   [hl], a                                  ; $5788: $77
    ld   hl, hNoiseSfx                            ; $5789: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $578C: $36 $1A
    jp   ClearEntityStatusBank04                  ; $578E: $C3 $7A $6D

MoldormEntityActiveHandler::
    call CopyEntityPositionToActivePosition       ; $5791: $CD $8A $3D
    call ReturnIfNonInteractive_04                ; $5794: $CD $A3 $7F
    xor  a                                        ; $5797: $AF
    ld   [wD3D6], a                               ; $5798: $EA $D6 $D3
    ld   e, $10                                   ; $579B: $1E $10
    ld   hl, wEntitiesHealthTable                 ; $579D: $21 $60 $C3
    add  hl, bc                                   ; $57A0: $09
    ld   a, [hl]                                  ; $57A1: $7E
    cp   $02                                      ; $57A2: $FE $02
    jr   c, .jr_57AE                              ; $57A4: $38 $08

    ld   hl, wEntitiesPrivateCountdown2Table      ; $57A6: $21 $00 $C3
    add  hl, bc                                   ; $57A9: $09
    ld   a, [hl]                                  ; $57AA: $7E
    and  a                                        ; $57AB: $A7
    jr   z, jr_004_57B8                           ; $57AC: $28 $0A

.jr_57AE
    call jr_004_57C6                              ; $57AE: $CD $C6 $57
    ld   a, $01                                   ; $57B1: $3E $01
    ld   [wD3D6], a                               ; $57B3: $EA $D6 $D3
    ld   e, $0B                                   ; $57B6: $1E $0B

jr_004_57B8:
    ld   hl, wD201                                ; $57B8: $21 $01 $D2
    ld   a, [hl]                                  ; $57BB: $7E
    inc  a                                        ; $57BC: $3C
    ld   [hl], a                                  ; $57BD: $77
    cp   e                                        ; $57BE: $BB
    jr   c, jr_004_57C6                           ; $57BF: $38 $05

    ld   [hl], b                                  ; $57C1: $70
    ld   a, NOISE_SFX_MOLDORM_ROAM                ; $57C2: $3E $1B
    ldh  [hNoiseSfx], a                           ; $57C4: $E0 $F4

jr_004_57C6:
    ld   hl, wEntitiesInertiaTable                ; $57C6: $21 $D0 $C3
    add  hl, bc                                   ; $57C9: $09
    ld   a, [hl]                                  ; $57CA: $7E
    inc  a                                        ; $57CB: $3C
    and  $7F                                      ; $57CC: $E6 $7F
    ld   [hl], a                                  ; $57CE: $77
    ld   e, a                                     ; $57CF: $5F
    ld   d, b                                     ; $57D0: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $57D1: $21 $00 $D0
    add  hl, de                                   ; $57D4: $19
    ldh  a, [hActiveEntityPosX]                   ; $57D5: $F0 $EE
    ld   [hl], a                                  ; $57D7: $77
    ld   hl, wD100                                ; $57D8: $21 $00 $D1
    add  hl, de                                   ; $57DB: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $57DC: $F0 $EC
    ld   [hl], a                                  ; $57DE: $77
    call func_004_5AE6                            ; $57DF: $CD $E6 $5A
    ld   hl, wEntitiesPrivateState1Table          ; $57E2: $21 $B0 $C2
    add  hl, bc                                   ; $57E5: $09
    ld   e, [hl]                                  ; $57E6: $5E
    srl  e                                        ; $57E7: $CB $3B
    ld   d, b                                     ; $57E9: $50
    ld   hl, Data_004_569F                        ; $57EA: $21 $9F $56
    add  hl, de                                   ; $57ED: $19
    ld   a, [hl]                                  ; $57EE: $7E
    jp   SetEntitySpriteVariant                   ; $57EF: $C3 $0C $3B

Data_004_57F2::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00   ; $57F2
    db   $F8, $08, $62, $20, $F8, $10, $60, $20   ; $57FA
    db   $08, $F8, $64, $00, $08, $00, $66, $00   ; $5802
    db   $08, $08, $66, $20, $08, $10, $64, $20   ; $580A
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00   ; $5812
    db   $F8, $08, $62, $20, $F8, $10, $60, $20   ; $581A
    db   $08, $F8, $6C, $00, $08, $00, $6E, $00   ; $5822
    db   $08, $08, $62, $60, $08, $10, $60, $60   ; $582A
    db   $F8, $F8, $68, $00, $F8, $00, $6A, $00   ; $5832
    db   $F8, $08, $62, $20, $F8, $10, $60, $20   ; $583A
    db   $08, $F8, $68, $40, $08, $00, $6A, $40   ; $5842
    db   $08, $08, $62, $60, $08, $10, $60, $60   ; $584A
    db   $F8, $F8, $6C, $40, $F8, $00, $6E, $40   ; $5852
    db   $F8, $08, $62, $20, $F8, $10, $60, $20   ; $585A
    db   $08, $F8, $60, $40, $08, $00, $62, $40   ; $5862
    db   $08, $08, $62, $60, $08, $10, $60, $60   ; $586A
    db   $F8, $F8, $64, $40, $F8, $00, $66, $40   ; $5872
    db   $F8, $08, $66, $60, $F8, $10, $64, $60   ; $587A
    db   $08, $F8, $60, $40, $08, $00, $62, $40   ; $5882
    db   $08, $08, $62, $60, $08, $10, $60, $60   ; $588A
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00   ; $5892
    db   $F8, $08, $6E, $60, $F8, $10, $6C, $60   ; $589A
    db   $08, $F8, $60, $40, $08, $00, $62, $40   ; $58A2
    db   $08, $08, $62, $60, $08, $10, $60, $60   ; $58AA
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00   ; $58B2
    db   $F8, $08, $6A, $20, $F8, $10, $68, $20   ; $58BA
    db   $08, $F8, $60, $40, $08, $00, $62, $40   ; $58C2
    db   $08, $08, $6A, $60, $08, $10, $68, $60   ; $58CA
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00   ; $58D2
    db   $F8, $08, $62, $20, $F8, $10, $60, $20   ; $58DA
    db   $08, $F8, $60, $40, $08, $00, $62, $40   ; $58E2
    db   $08, $08, $6E, $20, $08, $10, $6C, $20   ; $58EA

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
MoldormSpriteVariants:: ; $58F2
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

func_004_5902::
    ld   hl, wEntitiesPrivateState3Table          ; $5902: $21 $D0 $C2
    add  hl, bc                                   ; $5905: $09
    ld   a, [hl]                                  ; $5906: $7E
    cp   $05                                      ; $5907: $FE $05
    jp   nc, ret_004_5A04                         ; $5909: $D2 $04 $5A

    ld   hl, wEntitiesPhysicsFlagsTable           ; $590C: $21 $40 $C3
    add  hl, bc                                   ; $590F: $09
    ld   [hl], 8                                  ; $5910: $36 $08
    ld   hl, wEntitiesSpriteVariantTable          ; $5912: $21 $B0 $C3
    add  hl, bc                                   ; $5915: $09
    ld   a, [hl]                                  ; $5916: $7E
    rla                                           ; $5917: $17
    rla                                           ; $5918: $17
    rla                                           ; $5919: $17
    rla                                           ; $591A: $17
    rla                                           ; $591B: $17
    and  $E0                                      ; $591C: $E6 $E0
    ld   e, a                                     ; $591E: $5F
    ld   d, b                                     ; $591F: $50
    ld   hl, Data_004_57F2                        ; $5920: $21 $F2 $57
    add  hl, de                                   ; $5923: $19

.jr_5924
    ld   c, $08                                   ; $5924: $0E $08
    call RenderActiveEntitySpritesRect            ; $5926: $CD $E6 $3C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5929: $21 $40 $C3
    add  hl, bc                                   ; $592C: $09
    ld   [hl], 2                                  ; $592D: $36 $02
    ld   hl, wEntitiesInertiaTable                ; $592F: $21 $D0 $C3
    add  hl, bc                                   ; $5932: $09
    ld   a, [hl]                                  ; $5933: $7E
    ldh  [hMultiPurpose0], a                      ; $5934: $E0 $D7
    ld   hl, wEntitiesPrivateState3Table          ; $5936: $21 $D0 $C2
    add  hl, bc                                   ; $5939: $09
    ld   a, [hl]                                  ; $593A: $7E
    cp   $04                                      ; $593B: $FE $04
    jp   nc, ret_004_5A04                         ; $593D: $D2 $04 $5A

    ldh  a, [hMultiPurpose0]                      ; $5940: $F0 $D7
    sub  $0C                                      ; $5942: $D6 $0C
    and  $7F                                      ; $5944: $E6 $7F
    ld   e, a                                     ; $5946: $5F
    ld   d, b                                     ; $5947: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5948: $21 $00 $D0
    add  hl, de                                   ; $594B: $19
    ld   a, [hl]                                  ; $594C: $7E
    ldh  [hActiveEntityPosX], a                   ; $594D: $E0 $EE
    ld   hl, wD100                                ; $594F: $21 $00 $D1
    add  hl, de                                   ; $5952: $19
    ld   a, [hl]                                  ; $5953: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5954: $E0 $EC
    ld   a, $00                                   ; $5956: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $5958: $E0 $F1
    ld   de, MoldormSpriteVariants                ; $595A: $11 $F2 $58
    call RenderActiveEntitySpritesPair            ; $595D: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState3Table          ; $5960: $21 $D0 $C2

.jr_5963
    add  hl, bc                                   ; $5963: $09
    ld   a, [hl]                                  ; $5964: $7E
    cp   $03                                      ; $5965: $FE $03
    jp   nc, ret_004_5A04                         ; $5967: $D2 $04 $5A

    ldh  a, [hMultiPurpose0]                      ; $596A: $F0 $D7
    sub  $18                                      ; $596C: $D6 $18
    and  $7F                                      ; $596E: $E6 $7F
    ld   e, a                                     ; $5970: $5F
    ld   d, b                                     ; $5971: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5972: $21 $00 $D0
    add  hl, de                                   ; $5975: $19
    ld   a, [hl]                                  ; $5976: $7E
    ldh  [hActiveEntityPosX], a                   ; $5977: $E0 $EE
    ld   hl, wD100                                ; $5979: $21 $00 $D1
    add  hl, de                                   ; $597C: $19
    ld   a, [hl]                                  ; $597D: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $597E: $E0 $EC
    ld   a, $00                                   ; $5980: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $5982: $E0 $F1
    ld   de, MoldormSpriteVariants                ; $5984: $11 $F2 $58
    call RenderActiveEntitySpritesPair            ; $5987: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState3Table          ; $598A: $21 $D0 $C2
    add  hl, bc                                   ; $598D: $09
    ld   a, [hl]                                  ; $598E: $7E
    cp   $02                                      ; $598F: $FE $02
    jr   nc, ret_004_5A04                         ; $5991: $30 $71

    ldh  a, [hMultiPurpose0]                      ; $5993: $F0 $D7
    sub  $24                                      ; $5995: $D6 $24
    and  $7F                                      ; $5997: $E6 $7F
    ld   e, a                                     ; $5999: $5F
    ld   d, b                                     ; $599A: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $599B: $21 $00 $D0
    add  hl, de                                   ; $599E: $19
    ld   a, [hl]                                  ; $599F: $7E
    ldh  [hActiveEntityPosX], a                   ; $59A0: $E0 $EE
    ld   hl, wD100                                ; $59A2: $21 $00 $D1
    add  hl, de                                   ; $59A5: $19
    ld   a, [hl]                                  ; $59A6: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $59A7: $E0 $EC
    ld   a, $01                                   ; $59A9: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $59AB: $E0 $F1
    ld   de, MoldormSpriteVariants                ; $59AD: $11 $F2 $58
    call RenderActiveEntitySpritesPair            ; $59B0: $CD $C0 $3B
    ld   hl, wEntitiesPrivateState3Table          ; $59B3: $21 $D0 $C2
    add  hl, bc                                   ; $59B6: $09
    ld   a, [hl]                                  ; $59B7: $7E
    and  a                                        ; $59B8: $A7
    jr   nz, ret_004_5A04                         ; $59B9: $20 $49

    ldh  a, [hMultiPurpose0]                      ; $59BB: $F0 $D7
    sub  $2E                                      ; $59BD: $D6 $2E
    and  $7F                                      ; $59BF: $E6 $7F
    ld   e, a                                     ; $59C1: $5F
    ld   d, b                                     ; $59C2: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $59C3: $21 $00 $D0
    add  hl, de                                   ; $59C6: $19
    ld   a, [hl]                                  ; $59C7: $7E
    ldh  [hActiveEntityPosX], a                   ; $59C8: $E0 $EE
    ld   hl, wD100                                ; $59CA: $21 $00 $D1
    add  hl, de                                   ; $59CD: $19
    ld   a, [hl]                                  ; $59CE: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $59CF: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $59D1: $F0 $E7
    rra                                           ; $59D3: $1F
    rra                                           ; $59D4: $1F
    rra                                           ; $59D5: $1F
    and  $01                                      ; $59D6: $E6 $01
    add  $02                                      ; $59D8: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $59DA: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $59DC: $F0 $E7
    rla                                           ; $59DE: $17
    rla                                           ; $59DF: $17
    and  OAMF_PAL1                                ; $59E0: $E6 $10
    ld   hl, hActiveEntityFlipAttribute           ; $59E2: $21 $ED $FF
    xor  [hl]                                     ; $59E5: $AE
    ld   [hl], a                                  ; $59E6: $77
    ld   de, MoldormSpriteVariants                ; $59E7: $11 $F2 $58
    call RenderActiveEntitySpritesPair            ; $59EA: $CD $C0 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $59ED: $21 $20 $C4
    add  hl, bc                                   ; $59F0: $09
    ld   a, [hl]                                  ; $59F1: $7E
    and  a                                        ; $59F2: $A7
    jr   nz, ret_004_5A04                         ; $59F3: $20 $0F

    ld   hl, wEntitiesOptions1Table               ; $59F5: $21 $30 $C4
    add  hl, bc                                   ; $59F8: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IMMUNE_WATER_PIT ; $59F9: $36 $90
    call label_3B70                               ; $59FB: $CD $70 $3B
    ld   hl, wEntitiesOptions1Table               ; $59FE: $21 $30 $C4
    add  hl, bc                                   ; $5A01: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IMMUNE_WATER_PIT ; $5A02: $36 $D0

ret_004_5A04:
    ret                                           ; $5A04: $C9

func_004_5A05::
    call ReturnIfNonInteractive_04.allowInactiveEntity ; $5A05: $CD $A9 $7F
    ldh  a, [hActiveEntityPosX]                   ; $5A08: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5A0A: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5A0C: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $5A0E: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $5A10: $3E $02
    call AddTranscientVfx                         ; $5A12: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $5A15: $3E $13
    ldh  [hNoiseSfx], a                           ; $5A17: $E0 $F4
    ret                                           ; $5A19: $C9

; Also called from initialization of mini moldorm.
func_004_5A1A::
    ld   hl, wEntitiesLoadOrderTable              ; $5A1A: $21 $60 $C4
    add  hl, bc                                   ; $5A1D: $09
    ld   e, [hl]                                  ; $5A1E: $5E
    sla  e                                        ; $5A1F: $CB $23
    sla  e                                        ; $5A21: $CB $23
    sla  e                                        ; $5A23: $CB $23
    sla  e                                        ; $5A25: $CB $23
    sla  e                                        ; $5A27: $CB $23
    ld   d, b                                     ; $5A29: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5A2A: $21 $00 $D0
    add  hl, de                                   ; $5A2D: $19
    push de                                       ; $5A2E: $D5
    ld   e, $20                                   ; $5A2F: $1E $20

.loop_5A31
    xor  a                                        ; $5A31: $AF
    ld   [hl+], a                                 ; $5A32: $22
    dec  e                                        ; $5A33: $1D
    ld   a, e                                     ; $5A34: $7B
    cp   $00                                      ; $5A35: $FE $00
    jr   nz, .loop_5A31                           ; $5A37: $20 $F8

    pop  de                                       ; $5A39: $D1
    ld   hl, wD100                                ; $5A3A: $21 $00 $D1
    add  hl, de                                   ; $5A3D: $19
    ld   e, $20                                   ; $5A3E: $1E $20

.loop_5A40
    xor  a                                        ; $5A40: $AF
    ld   [hl+], a                                 ; $5A41: $22
    dec  e                                        ; $5A42: $1D
    ld   a, e                                     ; $5A43: $7B
    cp   $00                                      ; $5A44: $FE $00
    jr   nz, .loop_5A40                           ; $5A46: $20 $F8

    ret                                           ; $5A48: $C9
