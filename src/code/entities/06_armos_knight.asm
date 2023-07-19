ArmosKnightEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $52DE: $21 $60 $C4
    add  hl, bc                                   ; $52E1: $09
    ld   [hl], $FF                                ; $52E2: $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ; $52E4: $21 $E0 $C4
    add  hl, bc                                   ; $52E7: $09
    ld   [hl], ENTITY_KEY_DROP_POINT              ; $52E8: $36 $30
    ld   hl, wEntitiesHealthTable                 ; $52EA: $21 $60 $C3
    add  hl, bc                                   ; $52ED: $09
    ld   a, [hl]                                  ; $52EE: $7E
    cp   $08                                      ; $52EF: $FE $08
    jr   nc, jr_006_52FF                          ; $52F1: $30 $0C

    ld   e, $02                                   ; $52F3: $1E $02
    cp   $04                                      ; $52F5: $FE $04
    jr   nc, .jr_52FB                             ; $52F7: $30 $02

    ld   e, $03                                   ; $52F9: $1E $03

.jr_52FB
    ld   a, e                                     ; $52FB: $7B
    call SetEntitySpriteVariant                   ; $52FC: $CD $0C $3B

jr_006_52FF:
    call func_006_55B3                            ; $52FF: $CD $B3 $55
    ldh  a, [hActiveEntityStatus]                 ; $5302: $F0 $EA
    cp   $05                                      ; $5304: $FE $05
    jr   z, jr_006_5361                           ; $5306: $28 $59

label_006_5308:
    ld   hl, wEntitiesPrivateState2Table          ; $5308: $21 $C0 $C2
    add  hl, bc                                   ; $530B: $09
    ld   a, [hl]                                  ; $530C: $7E
    JP_TABLE                                      ; $530D
._00 dw ArmosKnightPrivateState0Handler                             ; $530E
._01 dw ArmosKnightPrivateState1Handler                             ; $5310
._02 dw ArmosKnightPrivateState2Handler                             ; $5312
._03 dw ArmosKnightPrivateState3Handler                             ; $5314

ArmosKnightPrivateState0Handler::
    call GetEntityTransitionCountdown             ; $5316: $CD $05 $0C
    ld   [hl], $A0                                ; $5319: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $531B: $21 $20 $C4
    add  hl, bc                                   ; $531E: $09
    ld   [hl], $FF                                ; $531F: $36 $FF
    jp   IncrementEntityPrivateState2             ; $5321: $C3 $34 $56

ArmosKnightPrivateState1Handler::
    call GetEntityTransitionCountdown             ; $5324: $CD $05 $0C
    ret  nz                                       ; $5327: $C0

    ld   [hl], $C0                                ; $5328: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $532A: $21 $20 $C4
    add  hl, bc                                   ; $532D: $09
    ld   [hl], $FF                                ; $532E: $36 $FF
    jp   IncrementEntityPrivateState2             ; $5330: $C3 $34 $56

ArmosKnightPrivateState2Handler::
    call GetEntityTransitionCountdown             ; $5333: $CD $05 $0C
    jr   nz, jr_006_535D                          ; $5336: $20 $25

    ld   a, NOISE_SFX_BOSS_EXPLOSION              ; $5338: $3E $1A
    ldh  [hNoiseSfx], a                           ; $533A: $E0 $F4
    call label_27DD                               ; $533C: $CD $DD $27
    call DidKillEnemy                             ; $533F: $CD $50 $3F
    ldh  a, [hActiveEntityType]                   ; $5342: $F0 $EB
    cp   ENTITY_ARMOS_KNIGHT                      ; $5344: $FE $88
    ret  z                                        ; $5346: $C8

    ldh  a, [hActiveEntityType]                   ; $5347: $F0 $EB
    cp   ENTITY_HINOX                             ; $5349: $FE $89
    jr   z, .jr_5355                              ; $534B: $28 $08

    cp   ENTITY_CUE_BALL                          ; $534D: $FE $8E
    jr   z, .jr_5355                              ; $534F: $28 $04

    cp   ENTITY_SMASHER                           ; $5351: $FE $92
    jr   nz, jr_006_535A                          ; $5353: $20 $05

.jr_5355
    ldh  a, [hMapId]                              ; $5355: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $5357: $FE $06
    ret  nc                                       ; $5359: $D0

jr_006_535A:
    jp   label_006_6CC9                           ; $535A: $C3 $C9 $6C

jr_006_535D:
    jp   func_006_700A                            ; $535D: $C3 $0A $70

ArmosKnightPrivateState3Handler::
    ret                                           ; $5360: $C9

jr_006_5361:
    call ReturnIfNonInteractive_06                ; $5361: $CD $C6 $64
    call BossIntro                                ; $5364: $CD $E8 $3E
    call label_3B70                               ; $5367: $CD $70 $3B
    call PushLinkOutOfEntity_06                   ; $536A: $CD $1A $64
    call AddEntityZSpeedToPos_06                  ; $536D: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $5370: $21 $20 $C3
    add  hl, bc                                   ; $5373: $09
    dec  [hl]                                     ; $5374: $35
    dec  [hl]                                     ; $5375: $35
    ld   hl, wEntitiesPosZTable                   ; $5376: $21 $10 $C3
    add  hl, bc                                   ; $5379: $09
    ld   a, [hl]                                  ; $537A: $7E
    and  $80                                      ; $537B: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $537D: $E0 $E8
    jr   z, .jr_5387                              ; $537F: $28 $06

    ld   [hl], b                                  ; $5381: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5382: $21 $20 $C3
    add  hl, bc                                   ; $5385: $09
    ld   [hl], b                                  ; $5386: $70

.jr_5387
    call GetEntityPrivateCountdown1               ; $5387: $CD $00 $0C
    jr   z, .jr_5394                              ; $538A: $28 $08

    ld   a, $02                                   ; $538C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $538E: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $5390: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $5392: $E0 $9D

.jr_5394
    ld   hl, wEntitiesHealthTable                 ; $5394: $21 $60 $C3
    add  hl, bc                                   ; $5397: $09
    ld   a, [hl]                                  ; $5398: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $5399: $21 $B0 $C2
    add  hl, bc                                   ; $539C: $09
    cp   [hl]                                     ; $539D: $BE
    ld   [hl], a                                  ; $539E: $77
    jp   z, label_006_5411                        ; $539F: $CA $11 $54

    cp   $08                                      ; $53A2: $FE $08
    jr   nc, label_006_5411                       ; $53A4: $30 $6B

    cp   $04                                      ; $53A6: $FE $04
    jr   nc, .jr_53D3                             ; $53A8: $30 $29

    ld   hl, wEntitiesInertiaTable                ; $53AA: $21 $D0 $C3
    add  hl, bc                                   ; $53AD: $09
    ld   a, [hl]                                  ; $53AE: $7E
    cp   $02                                      ; $53AF: $FE $02
    jr   nc, label_006_5411                       ; $53B1: $30 $5E

    inc  [hl]                                     ; $53B3: $34
    ld   a, ENTITY_LIFTABLE_ROCK                  ; $53B4: $3E $05
    call SpawnNewEntity_trampoline                ; $53B6: $CD $86 $3B
    jr   c, label_006_5411                        ; $53B9: $38 $56

    ldh  a, [hMultiPurpose0]                      ; $53BB: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $53BD: $21 $00 $C2
    add  hl, de                                   ; $53C0: $19
    dec  a                                        ; $53C1: $3D
    ld   [hl], a                                  ; $53C2: $77
    ldh  [hMultiPurpose0], a                      ; $53C3: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $53C5: $F0 $D8
    ld   hl, hMultiPurpose3                       ; $53C7: $21 $DA $FF
    sub  [hl]                                     ; $53CA: $96
    ld   hl, wEntitiesPosYTable                   ; $53CB: $21 $10 $C2
    add  hl, de                                   ; $53CE: $19
    sub  $10                                      ; $53CF: $D6 $10
    jr   jr_006_53F9                              ; $53D1: $18 $26

.jr_53D3
    ld   hl, wEntitiesInertiaTable                ; $53D3: $21 $D0 $C3
    add  hl, bc                                   ; $53D6: $09
    ld   a, [hl]                                  ; $53D7: $7E
    cp   $01                                      ; $53D8: $FE $01
    jr   nc, label_006_5411                       ; $53DA: $30 $35

    inc  [hl]                                     ; $53DC: $34
    ld   a, ENTITY_LIFTABLE_ROCK                  ; $53DD: $3E $05
    call SpawnNewEntity_trampoline                ; $53DF: $CD $86 $3B
    jr   c, label_006_5411                        ; $53E2: $38 $2D

    ldh  a, [hMultiPurpose0]                      ; $53E4: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $53E6: $21 $00 $C2
    add  hl, de                                   ; $53E9: $19
    add  $07                                      ; $53EA: $C6 $07
    ld   [hl], a                                  ; $53EC: $77
    ldh  [hMultiPurpose0], a                      ; $53ED: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $53EF: $F0 $D8
    ld   hl, hMultiPurpose3                       ; $53F1: $21 $DA $FF
    sub  [hl]                                     ; $53F4: $96
    ld   hl, wEntitiesPosYTable                   ; $53F5: $21 $10 $C2
    add  hl, de                                   ; $53F8: $19

jr_006_53F9:
    ld   [hl], a                                  ; $53F9: $77
    ldh  [hMultiPurpose1], a                      ; $53FA: $E0 $D8
    ld   hl, wEntitiesPrivateCountdown1Table      ; $53FC: $21 $F0 $C2
    add  hl, de                                   ; $53FF: $19
    ld   [hl], $0F                                ; $5400: $36 $0F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5402: $21 $40 $C3
    add  hl, de                                   ; $5405: $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5406: $36 $C4
    ld   a, TRANSCIENT_VFX_POOF                   ; $5408: $3E $02
    call AddTranscientVfx                         ; $540A: $CD $C7 $0C
    ld   a, NOISE_SFX_BREAK                       ; $540D: $3E $29
    ldh  [hNoiseSfx], a                           ; $540F: $E0 $F4

label_006_5411:
    ldh  a, [hActiveEntityState]                  ; $5411: $F0 $F0
    JP_TABLE                                      ; $5413
._00 dw ArmosKnightState0Handler
._01 dw ArmosKnightState1Handler
._02 dw ArmosKnightState2Handler
._03 dw ArmosKnightState3Handler
._04 dw ArmosKnightState4Handler
._05 dw ArmosKnightState5Handler
._06 dw ArmosKnightState6Handler
._07 dw ArmosKnightState7Handler

ArmosKnightState0Handler::
    call DecrementEntityIgnoreHitsCountdown       ; $5424: $CD $56 $0C
    call func_006_6594                            ; $5427: $CD $94 $65
    add  $20                                      ; $542A: $C6 $20
    cp   $40                                      ; $542C: $FE $40
    jr   nc, .ret_5441                            ; $542E: $30 $11

    call func_006_65A4                            ; $5430: $CD $A4 $65
    add  $20                                      ; $5433: $C6 $20
    cp   $40                                      ; $5435: $FE $40
    jr   nc, .ret_5441                            ; $5437: $30 $08

    call IncrementEntityState                     ; $5439: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $543C: $CD $05 $0C
    ld   [hl], $30                                ; $543F: $36 $30

.ret_5441
    ret                                           ; $5441: $C9

ArmosKnightState1Handler::
    call DecrementEntityIgnoreHitsCountdown       ; $5442: $CD $56 $0C
    call GetEntityTransitionCountdown             ; $5445: $CD $05 $0C
    jr   nz, .jr_544F                             ; $5448: $20 $05

    ld   [hl], $80                                ; $544A: $36 $80
    call IncrementEntityState                     ; $544C: $CD $12 $3B

.jr_544F
    rra                                           ; $544F: $1F
    rra                                           ; $5450: $1F
    and  $01                                      ; $5451: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5453: $C3 $0C $3B

ArmosKnightState2Handler::
    call DecrementEntityIgnoreHitsCountdown       ; $5456: $CD $56 $0C
    call GetEntityTransitionCountdown             ; $5459: $CD $05 $0C
    jr   nz, .jr_5476                             ; $545C: $20 $18

    ld   [hl], $50                                ; $545E: $36 $50
    call IncrementEntityState                     ; $5460: $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5463: $21 $40 $C3
    add  hl, bc                                   ; $5466: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $5467: $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ; $5469: $21 $50 $C3
    add  hl, bc                                   ; $546C: $09
    res  7, [hl]                                  ; $546D: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $546F: $21 $30 $C4
    add  hl, bc                                   ; $5472: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $5473: $CB $B6
    ret                                           ; $5475: $C9

.jr_5476
    ld   e, $08                                   ; $5476: $1E $08
    and  $04                                      ; $5478: $E6 $04
    jr   z, .jr_547E                              ; $547A: $28 $02

    ld   e, $F8                                   ; $547C: $1E $F8

.jr_547E
    ld   hl, wEntitiesSpeedXTable                 ; $547E: $21 $40 $C2
    add  hl, bc                                   ; $5481: $09
    ld   [hl], e                                  ; $5482: $73
    jp   AddEntitySpeedToPos_06                   ; $5483: $C3 $4E $65

ArmosKnightState3Handler::
    call ApplyRecoilIfNeeded_06                   ; $5486: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $5489: $CD $05 $0C
    jr   nz, .jr_549C                             ; $548C: $20 $0E

    ld   hl, wEntitiesSpeedZTable                 ; $548E: $21 $20 $C3
    add  hl, bc                                   ; $5491: $09
    ld   [hl], $30                                ; $5492: $36 $30
    call IncrementEntityState                     ; $5494: $CD $12 $3B
    ld   a, JINGLE_JUMP                           ; $5497: $3E $24
    ldh  [hJingle], a                             ; $5499: $E0 $F2
    ret                                           ; $549B: $C9

.jr_549C
    ldh  a, [hMultiPurposeG]                      ; $549C: $F0 $E8
    and  a                                        ; $549E: $A7
    jr   z, jr_006_54BB                           ; $549F: $28 $1A

    ld   hl, wEntitiesSpeedZTable                 ; $54A1: $21 $20 $C3
    add  hl, bc                                   ; $54A4: $09
    ld   [hl], $0C                                ; $54A5: $36 $0C
    ld   hl, wEntitiesHealthTable                 ; $54A7: $21 $60 $C3
    add  hl, bc                                   ; $54AA: $09
    ld   a, [hl]                                  ; $54AB: $7E
    cp   $05                                      ; $54AC: $FE $05
    ld   a, $08                                   ; $54AE: $3E $08
    jr   nc, .jr_54B4                             ; $54B0: $30 $02

    ld   a, $0C                                   ; $54B2: $3E $0C

.jr_54B4
    call ApplyVectorTowardsLink_trampoline        ; $54B4: $CD $AA $3B
    ld   a, JINGLE_BOUNCE                         ; $54B7: $3E $20
    ldh  [hJingle], a                             ; $54B9: $E0 $F2

jr_006_54BB:
    jp   UpdateEntityPosWithSpeed_06              ; $54BB: $C3 $41 $65

ArmosKnightState4Handler::
    call ApplyRecoilIfNeeded_06                   ; $54BE: $CD $F7 $64
    ld   hl, wEntitiesSpeedZTable                 ; $54C1: $21 $20 $C3
    add  hl, bc                                   ; $54C4: $09
    ld   a, [hl]                                  ; $54C5: $7E
    and  $FE                                      ; $54C6: $E6 $FE
    jr   nz, .jr_54D5                             ; $54C8: $20 $0B

    call GetEntityTransitionCountdown             ; $54CA: $CD $05 $0C
    ld   [hl], $10                                ; $54CD: $36 $10
    call ClearEntitySpeed                         ; $54CF: $CD $7F $3D
    call IncrementEntityState                     ; $54D2: $CD $12 $3B

.jr_54D5
    jp   UpdateEntityPosWithSpeed_06              ; $54D5: $C3 $41 $65

ArmosKnightState5Handler::
    call ApplyRecoilIfNeeded_06                   ; $54D8: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $54DB: $CD $05 $0C
    ld   a, $00                                   ; $54DE: $3E $00
    jr   nz, .jr_54E7                             ; $54E0: $20 $05

    call IncrementEntityState                     ; $54E2: $CD $12 $3B
    ld   a, $B0                                   ; $54E5: $3E $B0

.jr_54E7
    ld   hl, wEntitiesSpeedZTable                 ; $54E7: $21 $20 $C3
    add  hl, bc                                   ; $54EA: $09
    ld   [hl], a                                  ; $54EB: $77
    ret                                           ; $54EC: $C9

ArmosKnightState6Handler::
    call ApplyRecoilIfNeeded_06                   ; $54ED: $CD $F7 $64
    ldh  a, [hMultiPurposeG]                      ; $54F0: $F0 $E8
    and  a                                        ; $54F2: $A7
    ret  z                                        ; $54F3: $C8

    ld   a, $30                                   ; $54F4: $3E $30
    ld   [wC157], a                               ; $54F6: $EA $57 $C1
    ld   a, $04                                   ; $54F9: $3E $04
    ld   [wC158], a                               ; $54FB: $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ; $54FE: $3E $0B
    ldh  [hJingle], a                             ; $5500: $E0 $F2
    call GetEntityTransitionCountdown             ; $5502: $CD $05 $0C
    ld   [hl], $30                                ; $5505: $36 $30
    ld   a, [wIsLinkInTheAir]                     ; $5507: $FA $46 $C1
    and  a                                        ; $550A: $A7
    jr   nz, .jr_5512                             ; $550B: $20 $05

    call GetEntityPrivateCountdown1               ; $550D: $CD $00 $0C
    ld   [hl], $40                                ; $5510: $36 $40

.jr_5512
    jp   IncrementEntityState                     ; $5512: $C3 $12 $3B

ArmosKnightState7Handler::
    call ApplyRecoilIfNeeded_06                   ; $5515: $CD $F7 $64
    call GetEntityTransitionCountdown             ; $5518: $CD $05 $0C
    jr   nz, .ret_5522                            ; $551B: $20 $05

    call IncrementEntityState                     ; $551D: $CD $12 $3B
    ld   [hl], $02                                ; $5520: $36 $02

.ret_5522
    ret                                           ; $5522: $C9

Data_006_5523::
    db   $F4, $F8, $70, $03, $F4, $00, $72, $03, $F4, $08, $72, $23, $F4, $10, $70, $23
    db   $04, $F8, $74, $03, $04, $00, $76, $03, $04, $08, $7A, $03, $04, $10, $7A, $23
    db   $F4, $F8, $70, $02, $F4, $00, $78, $02, $F4, $08, $78, $22, $F4, $10, $70, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $7A, $02, $04, $10, $7A, $22
    db   $F4, $F8, $70, $02, $F4, $00, $72, $02, $F4, $08, $72, $22, $F4, $10, $70, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $76, $22, $04, $10, $74, $22
    db   $F4, $F8, $7C, $02, $F4, $00, $7E, $02, $F4, $08, $7E, $22, $F4, $10, $7C, $22
    db   $04, $F8, $74, $02, $04, $00, $76, $02, $04, $08, $76, $22, $04, $10, $74, $22

Data_006_55A3::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_006_55B3::
    ldh  a, [hActiveEntitySpriteVariant]          ; $55B3: $F0 $F1
    rla                                           ; $55B5: $17
    rla                                           ; $55B6: $17
    rla                                           ; $55B7: $17
    rla                                           ; $55B8: $17
    rla                                           ; $55B9: $17
    and  $E0                                      ; $55BA: $E6 $E0
    ld   e, a                                     ; $55BC: $5F
    ld   d, b                                     ; $55BD: $50
    ld   hl, Data_006_5523                        ; $55BE: $21 $23 $55
    add  hl, de                                   ; $55C1: $19
    ld   c, $08                                   ; $55C2: $0E $08
    call RenderActiveEntitySpritesRect            ; $55C4: $CD $E6 $3C
    ld   a, $04                                   ; $55C7: $3E $04
    call func_015_7964_trampoline                 ; $55C9: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ; $55CC: $21 $10 $C3
    add  hl, bc                                   ; $55CF: $09
    ld   a, [hl]                                  ; $55D0: $7E
    and  a                                        ; $55D1: $A7
    jr   z, .jr_55E0                              ; $55D2: $28 $0C

    ldh  a, [hActiveEntityPosY]                   ; $55D4: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $55D6: $E0 $EC
    ld   hl, Data_006_55A3                        ; $55D8: $21 $A3 $55
    ld   c, $04                                   ; $55DB: $0E $04
    call RenderActiveEntitySpritesRect            ; $55DD: $CD $E6 $3C

.jr_55E0
    jp   CopyEntityPositionToActivePosition       ; $55E0: $C3 $8A $3D
