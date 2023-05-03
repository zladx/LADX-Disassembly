
Data_015_5058::
    db   $EA, $EB, $EA, $EB, $EC, $ED, $EE, $EF, $F0, $F1, $F2, $F3

func_015_5064::
    ld   a, [wFinalNightmareForm]                 ; $5064: $FA $19 $D2
    rla                                           ; $5067: $17
    and  $FE                                      ; $5068: $E6 $FE
    ld   e, a                                     ; $506A: $5F
    ld   d, b                                     ; $506B: $50
    ld   hl, Data_015_5058                        ; $506C: $21 $58 $50
    add  hl, de                                   ; $506F: $19
    ld   a, [hl+]                                 ; $5070: $2A
    ld   [wLoadedEntitySpritesheets+2], a         ; $5071: $EA $95 $C1
    ld   a, [hl]                                  ; $5074: $7E
    ld   [wLoadedEntitySpritesheets+3], a         ; $5075: $EA $96 $C1
    ld   a, TRUE                                  ; $5078: $3E $01
    ldh  [hNeedsUpdatingEntityTilesA], a          ; $507A: $E0 $91
    ld   [wNeedsUpdatingEntityTilesB], a          ; $507C: $EA $0E $C1
    ret                                           ; $507F: $C9

; Note: this entity, unlike most others, use all 4 spriteslots available.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
;
; It also switches out sprites even during the battle.
FinalNightmareEntityHandler::
    ld   a, [wRoomTransitionState]                ; $5080: $FA $24 $C1
    and  a                                        ; $5083: $A7
    jr   nz, .jr_5093                             ; $5084: $20 $0D

    ld   a, [wC116]                               ; $5086: $FA $16 $C1
    and  a                                        ; $5089: $A7
    jr   nz, .jr_5093                             ; $508A: $20 $07

    inc  a                                        ; $508C: $3C
    ld   [wC116], a                               ; $508D: $EA $16 $C1
    call func_015_5064                            ; $5090: $CD $64 $50

.jr_5093
    ld   hl, wEntitiesPrivateState5Table          ; $5093: $21 $90 $C3
    add  hl, bc                                   ; $5096: $09
    ld   a, [hl]                                  ; $5097: $7E
    cp   $02                                      ; $5098: $FE $02
    jp   z, label_015_45CB                        ; $509A: $CA $CB $45

    and  a                                        ; $509D: $A7
    jp   nz, label_015_54D6                       ; $509E: $C2 $D6 $54

    ld   a, [wFinalNightmareForm]                 ; $50A1: $FA $19 $D2
    JP_TABLE                                      ; $50A4: $C7
._00 dw FinalNightmareForm1Handler
._01 dw FinalNightmareForm2Handler
._02 dw FinalNightmareForm3Handler
._03 dw FinalNightmareForm4Handler
._04 dw FinalNightmareForm5Handler
._05 dw FinalNightmareForm6Handler

FinalNightmareForm1Handler::
    ldh  a, [hActiveEntityState]                  ; $50B1: $F0 $F0
    JP_TABLE                                      ; $50B3
._00 dw func_015_50C2                             ; $50B4
._01 dw func_015_511D                             ; $50B6
._02 dw func_015_5138                             ; $50B8
._03 dw func_015_5153                             ; $50BA
._04 dw func_015_516E                             ; $50BC
._05 dw func_015_5191                             ; $50BE
._06 dw func_015_51B5                             ; $50C0

; Final boss dialog related
func_015_50C2::
    ld   a, [wIsLinkInTheAir]                     ; $50C2: $FA $46 $C1
    and  a                                        ; $50C5: $A7
    ret  nz                                       ; $50C6: $C0

IF __PATCH_0__
    ld   a, [wGameplayType]
    cp   GAMEPLAY_WORLD
    ret  nz
ENDC

    ld   a, MUSIC_FINAL_BOSS_INTRO                ; $50C7: $3E $5D
    ld   [wMusicTrackToPlay], a                   ; $50C9: $EA $68 $D3
    ld   hl, wIndoorBRoomStatus + $74             ; $50CC: $21 $74 $DA
    set  6, [hl]                                  ; $50CF: $CB $F6
    call_open_dialog Dialog0F5                    ; $50D1
    call GetEntityTransitionCountdown             ; $50D6: $CD $05 $0C
    ld   [hl], $50                                ; $50D9: $36 $50
    ldh  a, [hLinkPositionX]                      ; $50DB: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $50DD: $21 $00 $C2
    add  hl, bc                                   ; $50E0: $09
    ld   [hl], a                                  ; $50E1: $77
    ld   e, $80                                   ; $50E2: $1E $80
    ld   hl, wIsFileSelectionArrowShifted         ; $50E4: $21 $00 $D0

.loop_50E7
    ld   [hl+], a                                 ; $50E7: $22
    dec  e                                        ; $50E8: $1D
    jr   nz, .loop_50E7                           ; $50E9: $20 $FC

    ldh  a, [hLinkPositionY]                      ; $50EB: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $50ED: $21 $10 $C2
    add  hl, bc                                   ; $50F0: $09
    ld   [hl], a                                  ; $50F1: $77
    ld   e, $80                                   ; $50F2: $1E $80
    ld   hl, wD100                                ; $50F4: $21 $00 $D1

.loop_50F7
    ld   [hl+], a                                 ; $50F7: $22
    dec  e                                        ; $50F8: $1D
    jr   nz, .loop_50F7                           ; $50F9: $20 $FC

    xor  a                                        ; $50FB: $AF
    ld   [wD21A], a                               ; $50FC: $EA $1A $D2
    ld   [wD21B], a                               ; $50FF: $EA $1B $D2
    ld   [wD21C], a                               ; $5102: $EA $1C $D2
    ld   [wD21D], a                               ; $5105: $EA $1D $D2
    ld   [wD21E], a                               ; $5108: $EA $1E $D2

.jr_510B
    ld   [wD21F], a                               ; $510B: $EA $1F $D2
    ld   [wD220], a                               ; $510E: $EA $20 $D2
    ld   [wD221], a                               ; $5111: $EA $21 $D2
    ld   [wD222], a                               ; $5114: $EA $22 $D2
    ld   [wD223], a                               ; $5117: $EA $23 $D2
    jp   IncrementEntityState                     ; $511A: $C3 $12 $3B

func_015_511D::
    call func_015_5631                            ; $511D: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5120: $CD $05 $0C
    jr   nz, jr_015_512D                          ; $5123: $20 $08

    call IncrementEntityState                     ; $5125: $CD $12 $3B

func_015_5128::
    ld   a, JINGLE_SHADOW_MOVE                    ; $5128: $3E $35
    ldh  [hJingle], a                             ; $512A: $E0 $F2
    ret                                           ; $512C: $C9

; Final boss music initalization???
jr_015_512D:
    cp   $30                                      ; $512D: $FE $30
    jr   nz, .ret_5137                            ; $512F: $20 $06

    dec  [hl]                                     ; $5131: $35
    ld   a, MUSIC_FINAL_BOSS                      ; $5132: $3E $23
    ld   [wMusicTrackToPlay], a                   ; $5134: $EA $68 $D3

.ret_5137
    ret                                           ; $5137: $C9

func_015_5138::
    call func_015_5631                            ; $5138: $CD $31 $56
    call ReturnIfNonInteractive_15                ; $513B: $CD $0D $7B
    ld   hl, wEntitiesSpeedYTable                 ; $513E: $21 $50 $C2
    add  hl, bc                                   ; $5141: $09
    dec  [hl]                                     ; $5142: $35
    ld   a, [hl]                                  ; $5143: $7E
    cp   $E8                                      ; $5144: $FE $E8
    jr   nz, .jr_5150                             ; $5146: $20 $08

    call GetEntityTransitionCountdown             ; $5148: $CD $05 $0C
    ld   [hl], $08                                ; $514B: $36 $08
    call IncrementEntityState                     ; $514D: $CD $12 $3B

.jr_5150
    jp   UpdateEntityYPosWithSpeed_15             ; $5150: $C3 $8B $7B

func_015_5153::
    call func_015_5631                            ; $5153: $CD $31 $56
    call ReturnIfNonInteractive_15                ; $5156: $CD $0D $7B
    call UpdateEntityYPosWithSpeed_15             ; $5159: $CD $8B $7B
    call GetEntityTransitionCountdown             ; $515C: $CD $05 $0C
    ret  nz                                       ; $515F: $C0

    ld   hl, wEntitiesSpeedYTable                 ; $5160: $21 $50 $C2
    add  hl, bc                                   ; $5163: $09
    inc  [hl]                                     ; $5164: $34
    ret  nz                                       ; $5165: $C0

    call GetEntityTransitionCountdown             ; $5166: $CD $05 $0C
    ld   [hl], $80                                ; $5169: $36 $80
    jp   IncrementEntityState                     ; $516B: $C3 $12 $3B

func_015_516E::
    call func_015_5631                            ; $516E: $CD $31 $56
    call GetEntityTransitionCountdown             ; $5171: $CD $05 $0C
    jr   z, .ret_5184                             ; $5174: $28 $0E

    and  $07                                      ; $5176: $E6 $07
    jr   nz, .ret_5184                            ; $5178: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable          ; $517A: $21 $B0 $C3
    add  hl, bc                                   ; $517D: $09
    ld   a, [hl]                                  ; $517E: $7E
    cp   $05                                      ; $517F: $FE $05
    jr   z, jr_015_5185                           ; $5181: $28 $02

    inc  [hl]                                     ; $5183: $34

.ret_5184
    ret                                           ; $5184: $C9

jr_015_5185:
    call GetEntityTransitionCountdown             ; $5185: $CD $05 $0C
    ld   [hl], $C0                                ; $5188: $36 $C0
    jp   IncrementEntityState                     ; $518A: $C3 $12 $3B

Data_015_518D::
    db   $06, $05, $07, $05

func_015_5191::
    call func_015_569F                            ; $5191: $CD $9F $56
    ldh  a, [hFrameCounter]                       ; $5194: $F0 $E7
    rra                                           ; $5196: $1F
    rra                                           ; $5197: $1F
    rra                                           ; $5198: $1F
    rra                                           ; $5199: $1F
    and  $03                                      ; $519A: $E6 $03
    ld   e, a                                     ; $519C: $5F
    ld   d, b                                     ; $519D: $50
    ld   hl, Data_015_518D                        ; $519E: $21 $8D $51
    add  hl, de                                   ; $51A1: $19
    ld   a, [hl]                                  ; $51A2: $7E
    call SetEntitySpriteVariant                   ; $51A3: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $51A6: $CD $05 $0C
    ret  nz                                       ; $51A9: $C0

    ld   [hl], $2F                                ; $51AA: $36 $2F
    jp   IncrementEntityState                     ; $51AC: $C3 $12 $3B

Data_015_51AF::
    db   $08, $00, $01, $02, $03, $04

func_015_51B5::
    call func_015_569F                            ; $51B5: $CD $9F $56
    call GetEntityTransitionCountdown             ; $51B8: $CD $05 $0C
    jr   nz, .jr_51D0                             ; $51BB: $20 $13

    ld   hl, wFinalNightmareForm                  ; $51BD: $21 $19 $D2
    inc  [hl]                                     ; $51C0: $34
    xor  a                                        ; $51C1: $AF
    call SetEntitySpriteVariant                   ; $51C2: $CD $0C $3B
    call IncrementEntityState                     ; $51C5: $CD $12 $3B
    ld   [hl], b                                  ; $51C8: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $51C9: $21 $40 $C3
    add  hl, bc                                   ; $51CC: $09
    res  ENTITY_PHYSICS_B_HARMLESS, [hl]          ; $51CD: $CB $BE
    ret                                           ; $51CF: $C9

.jr_51D0
    rra                                           ; $51D0: $1F
    rra                                           ; $51D1: $1F
    rra                                           ; $51D2: $1F
    and  $0F                                      ; $51D3: $E6 $0F
    ld   e, a                                     ; $51D5: $5F
    ld   d, b                                     ; $51D6: $50
    ld   hl, Data_015_51AF                        ; $51D7: $21 $AF $51
    add  hl, de                                   ; $51DA: $19
    ld   a, [hl]                                  ; $51DB: $7E
    jp   SetEntitySpriteVariant                   ; $51DC: $C3 $0C $3B

FinalNightmareForm2Handler::
    call func_015_572B                            ; $51DF: $CD $2B $57
    call ReturnIfNonInteractive_15                ; $51E2: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $51E5: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $51E8: $F0 $F0
    JP_TABLE                                      ; $51EA
._00 dw func_015_51FF                             ; $51EB
._01 dw func_015_520C                             ; $51ED
._02 dw func_015_522C                             ; $51EF
._03 dw func_015_528A                             ; $51F1
._04 dw func_015_52AA                             ; $51F3
._05 dw func_015_52B6                             ; $51F5
._06 dw func_015_5370                             ; $51F7
._07 dw func_015_53E1                             ; $51F9
._08 dw func_015_5317                             ; $51FB
._09 dw func_015_5330                             ; $51FD

func_015_51FF::
    call GetEntityTransitionCountdown             ; $51FF: $CD $05 $0C
    ld   [hl], $80                                ; $5202: $36 $80
    ld   hl, wEntitiesInertiaTable                ; $5204: $21 $D0 $C3
    add  hl, bc                                   ; $5207: $09
    ld   [hl], b                                  ; $5208: $70
    jp   IncrementEntityState                     ; $5209: $C3 $12 $3B

func_015_520C::
    call GetEntityTransitionCountdown             ; $520C: $CD $05 $0C
    ret  nz                                       ; $520F: $C0

    ldh  a, [hFrameCounter]                       ; $5210: $F0 $E7
    and  $07                                      ; $5212: $E6 $07
    ret  nz                                       ; $5214: $C0

    ld   hl, wEntitiesSpriteVariantTable          ; $5215: $21 $B0 $C3
    add  hl, bc                                   ; $5218: $09
    inc  [hl]                                     ; $5219: $34
    ld   a, [hl]                                  ; $521A: $7E
    cp   $03                                      ; $521B: $FE $03
    ret  nz                                       ; $521D: $C0

    ld   hl, wEntitiesSpeedZTable                 ; $521E: $21 $20 $C3
    add  hl, bc                                   ; $5221: $09
    ld   [hl], $28                                ; $5222: $36 $28
    ld   a, $08                                   ; $5224: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $5226: $CD $AA $3B
    jp   IncrementEntityState                     ; $5229: $C3 $12 $3B

func_015_522C::
    call func_015_5435                            ; $522C: $CD $35 $54
    call label_3B39                               ; $522F: $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ; $5232: $CD $88 $7B
    call label_3B23                               ; $5235: $CD $23 $3B
    call AddEntityZSpeedToPos_15                  ; $5238: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $523B: $21 $20 $C3
    add  hl, bc                                   ; $523E: $09
    dec  [hl]                                     ; $523F: $35
    dec  [hl]                                     ; $5240: $35
    ld   hl, wEntitiesPosZTable                   ; $5241: $21 $10 $C3
    add  hl, bc                                   ; $5244: $09
    ld   a, [hl]                                  ; $5245: $7E
    and  $80                                      ; $5246: $E6 $80
    jr   z, jr_015_527A                           ; $5248: $28 $30

    ld   [hl], b                                  ; $524A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $524B: $21 $20 $C3
    add  hl, bc                                   ; $524E: $09
    ld   [hl], b                                  ; $524F: $70
    ld   hl, wEntitiesInertiaTable                ; $5250: $21 $D0 $C3
    add  hl, bc                                   ; $5253: $09
    ld   a, [hl]                                  ; $5254: $7E
    inc  a                                        ; $5255: $3C
    ld   [hl], a                                  ; $5256: $77
    and  $01                                      ; $5257: $E6 $01
    jr   nz, .jr_526E                             ; $5259: $20 $13

    call GetRandomByte                            ; $525B: $CD $0D $28
    and  $01                                      ; $525E: $E6 $01
    jr   nz, .jr_526E                             ; $5260: $20 $0C

    call GetEntityTransitionCountdown             ; $5262: $CD $05 $0C
    ld   [hl], $1F                                ; $5265: $36 $1F
    call IncrementEntityState                     ; $5267: $CD $12 $3B
    ld   [hl], $08                                ; $526A: $36 $08
    jr   jr_015_527A                              ; $526C: $18 $0C

.jr_526E
    ld   a, JINGLE_BOUNCE                         ; $526E: $3E $20
    ldh  [hJingle], a                             ; $5270: $E0 $F2
    call GetEntityTransitionCountdown             ; $5272: $CD $05 $0C
    ld   [hl], $30                                ; $5275: $36 $30
    call IncrementEntityState                     ; $5277: $CD $12 $3B

jr_015_527A:
    ld   e, $03                                   ; $527A: $1E $03
    ld   hl, wEntitiesPosZTable                   ; $527C: $21 $10 $C3
    add  hl, bc                                   ; $527F: $09
    ld   a, [hl]                                  ; $5280: $7E
    cp   $0C                                      ; $5281: $FE $0C
    jr   c, .jr_5286                              ; $5283: $38 $01

    inc  e                                        ; $5285: $1C

.jr_5286
    ld   a, e                                     ; $5286: $7B
    jp   SetEntitySpriteVariant                   ; $5287: $C3 $0C $3B

func_015_528A::
    ld   a, $05                                   ; $528A: $3E $05
    call SetEntitySpriteVariant                   ; $528C: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $528F: $CD $05 $0C
    jr   nz, .jr_52A4                             ; $5292: $20 $10

    ld   a, $0C                                   ; $5294: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $5296: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $5299: $21 $20 $C3
    add  hl, bc                                   ; $529C: $09
    ld   [hl], $20                                ; $529D: $36 $20
    call IncrementEntityState                     ; $529F: $CD $12 $3B
    dec  [hl]                                     ; $52A2: $35
    dec  [hl]                                     ; $52A3: $35

.jr_52A4
    call func_015_5435                            ; $52A4: $CD $35 $54
    jp   label_3B39                               ; $52A7: $C3 $39 $3B

func_015_52AA::
    call GetEntityTransitionCountdown             ; $52AA: $CD $05 $0C
    ret  nz                                       ; $52AD: $C0

    jp   label_015_5335                           ; $52AE: $C3 $35 $53

func_015_52B1::
    ld   a, WAVE_SFX_SHADOW_CHANGE_FORM           ; $52B1: $3E $23
    ldh  [hWaveSfx], a                            ; $52B3: $E0 $F3
    ret                                           ; $52B5: $C9

func_015_52B6::
    call GetEntityTransitionCountdown             ; $52B6: $CD $05 $0C
    jr   nz, jr_015_52FF                          ; $52B9: $20 $44

func_015_52BB::
    ld   a, [wFinalNightmareForm]                 ; $52BB: $FA $19 $D2
    inc  a                                        ; $52BE: $3C
    ld   [wFinalNightmareForm], a                 ; $52BF: $EA $19 $D2
    call func_015_5064                            ; $52C2: $CD $64 $50
    xor  a                                        ; $52C5: $AF
    ld   [wD221], a                               ; $52C6: $EA $21 $D2
    ld   [wD222], a                               ; $52C9: $EA $22 $D2
    ld   [wD223], a                               ; $52CC: $EA $23 $D2
    ld   [wD220], a                               ; $52CF: $EA $20 $D2
    ld   hl, wEntitiesPosZTable                   ; $52D2: $21 $10 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70
    ld   hl, wEntitiesPhysicsFlagsTable           ; $52D7: $21 $40 $C3
    add  hl, bc                                   ; $52DA: $09
    ld   [hl], ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $52DB: $36 $C0
    ld   a, $02                                   ; $52DD: $3E $02
    ld   [wEntityTilesSpriteslotIndexA], a        ; $52DF: $EA $97 $C1
    inc  a                                        ; $52E2: $3C
    ld   [wEntityTilesSpriteslotIndexB], a        ; $52E3: $EA $0D $C1
    ld   a, $FF                                   ; $52E6: $3E $FF
    call SetEntitySpriteVariant                   ; $52E8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $52EB: $CD $05 $0C
    ld   [hl], $40                                ; $52EE: $36 $40
    ld   hl, wEntitiesPrivateState1Table          ; $52F0: $21 $B0 $C2
    add  hl, bc                                   ; $52F3: $09
    ld   [hl], b                                  ; $52F4: $70
    call IncrementEntityState                     ; $52F5: $CD $12 $3B
    ld   [hl], b                                  ; $52F8: $70
    ld   a, $01                                   ; $52F9: $3E $01
    ld   [wD21A], a                               ; $52FB: $EA $1A $D2
    ret                                           ; $52FE: $C9

jr_015_52FF:
    cp   $18                                      ; $52FF: $FE $18
    ret  nc                                       ; $5301: $D0

    cp   $17                                      ; $5302: $FE $17
    jr   nz, .jr_530B                             ; $5304: $20 $05

    ld   hl, hJingle                              ; $5306: $21 $F2 $FF
    ld   [hl], JINGLE_SHADOW_MOVE                 ; $5309: $36 $35

.jr_530B
    rra                                           ; $530B: $1F
    rra                                           ; $530C: $1F
    rra                                           ; $530D: $1F
    and  $03                                      ; $530E: $E6 $03
    jp   SetEntitySpriteVariant                   ; $5310: $C3 $0C $3B

Data_015_5313::
    db   $FF, $00, $01, $02

func_015_5317::
    call GetEntityTransitionCountdown             ; $5317: $CD $05 $0C
    jr   nz, .jr_5321                             ; $531A: $20 $05

    ld   [hl], $80                                ; $531C: $36 $80
    jp   IncrementEntityState                     ; $531E: $C3 $12 $3B

.jr_5321
    rra                                           ; $5321: $1F
    rra                                           ; $5322: $1F
    rra                                           ; $5323: $1F
    and  $03                                      ; $5324: $E6 $03
    ld   e, a                                     ; $5326: $5F
    ld   d, b                                     ; $5327: $50
    ld   hl, Data_015_5313                        ; $5328: $21 $13 $53
    add  hl, de                                   ; $532B: $19
    ld   a, [hl]                                  ; $532C: $7E
    jp   SetEntitySpriteVariant                   ; $532D: $C3 $0C $3B

func_015_5330::
    call GetEntityTransitionCountdown             ; $5330: $CD $05 $0C
    jr   nz, ret_015_5355                         ; $5333: $20 $20

label_015_5335:
    call GetRandomByte                            ; $5335: $CD $0D $28
    and  $07                                      ; $5338: $E6 $07
    ld   e, a                                     ; $533A: $5F
    ld   d, b                                     ; $533B: $50
    ld   hl, Data_015_5911                        ; $533C: $21 $11 $59
    add  hl, de                                   ; $533F: $19
    ld   a, [hl]                                  ; $5340: $7E
    ld   hl, wEntitiesPosXTable                   ; $5341: $21 $00 $C2
    add  hl, bc                                   ; $5344: $09
    ld   [hl], a                                  ; $5345: $77
    ld   hl, Data_015_5919                        ; $5346: $21 $19 $59
    add  hl, de                                   ; $5349: $19
    ld   a, [hl]                                  ; $534A: $7E
    ld   hl, wEntitiesPosYTable                   ; $534B: $21 $10 $C2
    add  hl, bc                                   ; $534E: $09
    ld   [hl], a                                  ; $534F: $77
    call IncrementEntityState                     ; $5350: $CD $12 $3B
    ld   [hl], $01                                ; $5353: $36 $01

ret_015_5355:
    ret                                           ; $5355: $C9

Data_015_5356::
    db   $00, $00, $00, $00, $00, $00, $00, $00

Data_015_535E::
    db   $00, $00, $00, $00, $00, $00, $00, $00

Data_015_5366::
    db   $00, $18

Data_015_5368::
    db   $20, $18, $00, $E8, $E0, $E8, $00, $18

func_015_5370::
    ld   a, $FF                                   ; $5370: $3E $FF
    call SetEntitySpriteVariant                   ; $5372: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5375: $CD $05 $0C
    ld   [hl], $80                                ; $5378: $36 $80
    call IncrementEntityState                     ; $537A: $CD $12 $3B
    ld   [hl], $04                                ; $537D: $36 $04
    ld   a, WAVE_SFX_SHADOW_DISPERSE              ; $537F: $3E $21
    ldh  [hWaveSfx], a                            ; $5381: $E0 $F3

func_015_5383::
    xor  a                                        ; $5383: $AF

jr_015_5384:
    ldh  [hMultiPurposeG], a                      ; $5384: $E0 $E8
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $5386: $3E $E6
    call SpawnNewEntity_trampoline                ; $5388: $CD $86 $3B
    ret  c                                        ; $538B: $D8

    push bc                                       ; $538C: $C5
    ldh  a, [hMultiPurposeG]                      ; $538D: $F0 $E8
    ld   c, a                                     ; $538F: $4F
    ldh  a, [hMultiPurpose0]                      ; $5390: $F0 $D7
    ld   hl, Data_015_5356                        ; $5392: $21 $56 $53
    add  hl, bc                                   ; $5395: $09
    add  [hl]                                     ; $5396: $86
    ld   hl, wEntitiesPosXTable                   ; $5397: $21 $00 $C2
    add  hl, de                                   ; $539A: $19
    ld   [hl], a                                  ; $539B: $77
    ldh  a, [hMultiPurpose1]                      ; $539C: $F0 $D8
    ld   hl, Data_015_535E                        ; $539E: $21 $5E $53
    add  hl, bc                                   ; $53A1: $09
    add  [hl]                                     ; $53A2: $86
    ld   hl, wEntitiesPosYTable                   ; $53A3: $21 $10 $C2
    add  hl, de                                   ; $53A6: $19
    ld   [hl], a                                  ; $53A7: $77
    ldh  a, [hMultiPurpose3]                      ; $53A8: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $53AA: $21 $10 $C3
    add  hl, de                                   ; $53AD: $19
    ld   [hl], a                                  ; $53AE: $77

.jr_53AF
    ld   hl, Data_015_5368                        ; $53AF: $21 $68 $53
    add  hl, bc                                   ; $53B2: $09
    ld   a, [hl]                                  ; $53B3: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $53B4: $21 $40 $C2
    add  hl, de                                   ; $53B7: $19
    ld   [hl], a                                  ; $53B8: $77
    ld   hl, Data_015_5366                        ; $53B9: $21 $66 $53
    add  hl, bc                                   ; $53BC: $09
    ld   a, [hl]                                  ; $53BD: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $53BE: $21 $50 $C2
    add  hl, de                                   ; $53C1: $19
    ld   [hl], a                                  ; $53C2: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $53C3: $21 $E0 $C2
    add  hl, de                                   ; $53C6: $19
    ld   [hl], $2F                                ; $53C7: $36 $2F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $53C9: $21 $40 $C3
    add  hl, de                                   ; $53CC: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $53CD: $36 $C2
    ld   hl, wEntitiesPrivateState5Table          ; $53CF: $21 $90 $C3
    add  hl, de                                   ; $53D2: $19
    inc  [hl]                                     ; $53D3: $34
    pop  bc                                       ; $53D4: $C1
    ldh  a, [hMultiPurposeG]                      ; $53D5: $F0 $E8
    inc  a                                        ; $53D7: $3C
    cp   $08                                      ; $53D8: $FE $08
    jr   nz, jr_015_5384                          ; $53DA: $20 $A8

    ret                                           ; $53DC: $C9

Data_015_53DD::
    db   $05, $03, $04, $03

func_015_53E1::
    call AddEntityZSpeedToPos_15                  ; $53E1: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $53E4: $21 $20 $C3
    add  hl, bc                                   ; $53E7: $09
    dec  [hl]                                     ; $53E8: $35
    dec  [hl]                                     ; $53E9: $35
    ld   hl, wEntitiesPosZTable                   ; $53EA: $21 $10 $C3
    add  hl, bc                                   ; $53ED: $09
    ld   a, [hl]                                  ; $53EE: $7E
    and  $80                                      ; $53EF: $E6 $80
    jr   z, .jr_53F9                              ; $53F1: $28 $06

    ld   [hl], b                                  ; $53F3: $70
    ld   hl, wEntitiesSpeedZTable                 ; $53F4: $21 $20 $C3
    add  hl, bc                                   ; $53F7: $09
    ld   [hl], b                                  ; $53F8: $70

.jr_53F9
    call GetEntityTransitionCountdown             ; $53F9: $CD $05 $0C
    jr   z, .jr_540E                              ; $53FC: $28 $10

    rra                                           ; $53FE: $1F
    nop                                           ; $53FF: $00
    nop                                           ; $5400: $00
    nop                                           ; $5401: $00
    and  $03                                      ; $5402: $E6 $03
    ld   e, a                                     ; $5404: $5F
    ld   d, b                                     ; $5405: $50
    ld   hl, Data_015_53DD                        ; $5406: $21 $DD $53
    add  hl, de                                   ; $5409: $19
    ld   a, [hl]                                  ; $540A: $7E
    jp   SetEntitySpriteVariant                   ; $540B: $C3 $0C $3B

.jr_540E
    ld   a, [wD220]                               ; $540E: $FA $20 $D2
    inc  a                                        ; $5411: $3C
    ld   [wD220], a                               ; $5412: $EA $20 $D2
    cp   $03                                      ; $5415: $FE $03
    jr   nc, .jr_541F                             ; $5417: $30 $06

    call IncrementEntityState                     ; $5419: $CD $12 $3B
    ld   [hl], $02                                ; $541C: $36 $02
    ret                                           ; $541E: $C9

.jr_541F
    ld   a, $06                                   ; $541F: $3E $06
    call SetEntitySpriteVariant                   ; $5421: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5424: $CD $05 $0C
    ld   [hl], $80                                ; $5427: $36 $80
    call IncrementEntityState                     ; $5429: $CD $12 $3B
    ld   [hl], $05                                ; $542C: $36 $05

func_015_542E::
    ld   a, NOISE_SFX_SHADOW_DISPERSE             ; $542E: $3E $37
    ldh  [hNoiseSfx], a                           ; $5430: $E0 $F4
    jp   func_015_5383                            ; $5432: $C3 $83 $53

func_015_5435::
    ld   a, [wHasToadstool]                       ; $5435: $FA $4B $DB
    and  a                                        ; $5438: $A7
    jr   z, jr_015_5465                           ; $5439: $28 $2A

    ld   a, [wInventoryItems.BButtonSlot]         ; $543B: $FA $00 $DB
    cp   INVENTORY_MAGIC_POWDER                   ; $543E: $FE $0C
    jr   nz, .jr_5450                             ; $5440: $20 $0E

    ldh  a, [hJoypadState]                        ; $5442: $F0 $CC
    and  J_B                                      ; $5444: $E6 $20
    jr   z, jr_015_5465                           ; $5446: $28 $1D

    ld   a, $03                                   ; $5448: $3E $03
    ld   [wD220], a                               ; $544A: $EA $20 $D2
    jp   label_015_54A2                           ; $544D: $C3 $A2 $54

.jr_5450
    ld   a, [wInventoryItems.AButtonSlot]         ; $5450: $FA $01 $DB
    cp   INVENTORY_MAGIC_POWDER                   ; $5453: $FE $0C
    jr   nz, jr_015_5465                          ; $5455: $20 $0E

    ldh  a, [hJoypadState]                        ; $5457: $F0 $CC
    and  J_A                                      ; $5459: $E6 $10
    jr   z, jr_015_5465                           ; $545B: $28 $08

    ld   a, $03                                   ; $545D: $3E $03
    ld   [wD220], a                               ; $545F: $EA $20 $D2
    jp   label_015_54A2                           ; $5462: $C3 $A2 $54

jr_015_5465:
    ld   e, $0F                                   ; $5465: $1E $0F
    ld   d, b                                     ; $5467: $50

jr_015_5468:
    ld   hl, wEntitiesStatusTable                 ; $5468: $21 $80 $C2
    add  hl, de                                   ; $546B: $19
    ld   a, [hl]                                  ; $546C: $7E
    cp   $05                                      ; $546D: $FE $05
    jr   nz, jr_015_54B7                          ; $546F: $20 $46

    ld   hl, wEntitiesTypeTable                   ; $5471: $21 $A0 $C3
    add  hl, de                                   ; $5474: $19
    ld   a, [hl]                                  ; $5475: $7E
    cp   $08                                      ; $5476: $FE $08
    jr   nz, jr_015_54B7                          ; $5478: $20 $3D

    ld   hl, wEntitiesTransitionCountdownTable    ; $547A: $21 $E0 $C2
    add  hl, de                                   ; $547D: $19
    ld   a, [hl]                                  ; $547E: $7E
    cp   $08                                      ; $547F: $FE $08
    jr   nz, jr_015_54B7                          ; $5481: $20 $34

    ld   hl, wEntitiesPosXTable                   ; $5483: $21 $00 $C2
    add  hl, de                                   ; $5486: $19
    ldh  a, [hActiveEntityPosX]                   ; $5487: $F0 $EE
    sub  [hl]                                     ; $5489: $96
    add  $0C                                      ; $548A: $C6 $0C
    cp   $18                                      ; $548C: $FE $18
    jr   nc, jr_015_54B7                          ; $548E: $30 $27

    ld   hl, wEntitiesPosYTable                   ; $5490: $21 $10 $C2
    add  hl, de                                   ; $5493: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5494: $F0 $EC
    sub  [hl]                                     ; $5496: $96
    add  $0C                                      ; $5497: $C6 $0C
    cp   $18                                      ; $5499: $FE $18
    jr   nc, jr_015_54B7                          ; $549B: $30 $1A

    call GetEntityTransitionCountdown             ; $549D: $CD $05 $0C
    ld   [hl], $80                                ; $54A0: $36 $80

label_015_54A2:
    ld   hl, wEntitiesFlashCountdownTable         ; $54A2: $21 $20 $C4
    add  hl, bc                                   ; $54A5: $09
    ld   [hl], $14                                ; $54A6: $36 $14
    ld   a, WAVE_SFX_BOSS_HURT                    ; $54A8: $3E $07
    ldh  [hWaveSfx], a                            ; $54AA: $E0 $F3
    ld   a, JINGLE_SHADOW_ZOL_HURT                ; $54AC: $3E $37
    ldh  [hJingle], a                             ; $54AE: $E0 $F2
    call IncrementEntityState                     ; $54B0: $CD $12 $3B
    ld   [hl], $07                                ; $54B3: $36 $07
    pop  af                                       ; $54B5: $F1
    ret                                           ; $54B6: $C9

jr_015_54B7:
    dec  e                                        ; $54B7: $1D
    ld   a, e                                     ; $54B8: $7B
    cp   $FF                                      ; $54B9: $FE $FF
    jr   nz, jr_015_5468                          ; $54BB: $20 $AB

    ret                                           ; $54BD: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown047SpriteVariants::
.variant0
    db $4E, $00
    db $4E, $20
.variant1
    db $4C, $00
    db $4C, $20
.variant2
    db $4A, $00
    db $4A, $20

Data_015_54CA::
    db   $02, $02, $02, $01, $01, $00

Data_015_54D0::
    db   $0F, $07, $03, $01, $00, $00

label_015_54D6:
    ld   de, Unknown047SpriteVariants             ; $54D6: $11 $BE $54
    call RenderActiveEntitySpritesPair            ; $54D9: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $54DC: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $54DF: $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ; $54E2: $CA $31 $7C

    rra                                           ; $54E5: $1F
    rra                                           ; $54E6: $1F
    rra                                           ; $54E7: $1F
    and  $07                                      ; $54E8: $E6 $07
    ld   e, a                                     ; $54EA: $5F
    ld   d, b                                     ; $54EB: $50
    ld   hl, Data_015_54CA                        ; $54EC: $21 $CA $54
    add  hl, de                                   ; $54EF: $19
    push de                                       ; $54F0: $D5
    ld   a, [hl]                                  ; $54F1: $7E
    call SetEntitySpriteVariant                   ; $54F2: $CD $0C $3B
    pop  de                                       ; $54F5: $D1
    ld   hl, Data_015_54D0                        ; $54F6: $21 $D0 $54
    add  hl, de                                   ; $54F9: $19
    ldh  a, [hFrameCounter]                       ; $54FA: $F0 $E7
    and  [hl]                                     ; $54FC: $A6
    ret  nz                                       ; $54FD: $C0

    jp   UpdateEntityPosWithSpeed_15              ; $54FE: $C3 $88 $7B

Data_015_5501::
    db   $00, $00, $4C, $00, $00, $08, $4C, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60
    db   $F8, $F8, $7A, $00, $F8, $00, $7C, $00, $F8, $08, $7C, $20, $F8, $10, $7A, $20
    db   $08, $F8, $7A, $40, $08, $00, $7C, $40, $08, $08, $7C, $60, $08, $10, $7A, $60
    db   $F8, $F8, $76, $00, $F8, $00, $78, $00, $F8, $08, $78, $20, $F8, $10, $76, $20
    db   $08, $F8, $76, $40, $08, $00, $78, $40, $08, $08, $78, $60, $08, $10, $76, $60
    db   $F8, $F8, $72, $00, $F8, $00, $74, $00, $F8, $08, $74, $20, $F8, $10, $72, $20
    db   $08, $F8, $72, $40, $08, $00, $74, $40, $08, $08, $74, $60, $08, $10, $72, $60
    db   $F8, $F8, $66, $00, $F8, $00, $68, $00, $F8, $08, $68, $20, $F8, $10, $66, $20
    db   $08, $F8, $66, $40, $08, $00, $6A, $00, $08, $08, $6A, $20, $08, $10, $66, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $64, $00, $08, $08, $64, $20, $08, $10, $60, $60
    db   $F8, $F8, $6C, $00, $F8, $00, $6E, $00, $F8, $08, $6E, $20, $F8, $10, $6C, $20
    db   $08, $F8, $6C, $40, $08, $00, $70, $00, $08, $08, $70, $20, $08, $10, $6C, $60
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $00, $08, $FF, $20, $00, $10, $FF, $20
    db   $00, $F8, $FF, $40, $00, $00, $FF, $40, $00, $08, $FF, $60, $00, $10, $FF, $60

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown048SpriteVariants::
.variant0
    db $4C, $00
    db $4C, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown052SpriteVariants::
.variant0
    db $48, $00
    db $48, $20

Data_015_5629::
    db   $28, $23, $1E, $19, $14, $0F, $0A, $05

func_015_5631::
    ld   hl, wEntitiesInertiaTable                ; $5631: $21 $D0 $C3
    add  hl, bc                                   ; $5634: $09
    ld   a, [hl]                                  ; $5635: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $5636: $E0 $E9
    xor  a                                        ; $5638: $AF

jr_015_5639:
    ldh  [hMultiPurposeG], a                      ; $5639: $E0 $E8
    ld   e, a                                     ; $563B: $5F
    ld   d, b                                     ; $563C: $50
    ld   hl, Data_015_5629                        ; $563D: $21 $29 $56
    add  hl, de                                   ; $5640: $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $5641: $F0 $E9
    sub  [hl]                                     ; $5643: $96
    and  $7F                                      ; $5644: $E6 $7F
    ld   e, a                                     ; $5646: $5F
    ld   d, b                                     ; $5647: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $5648: $21 $00 $D0
    add  hl, de                                   ; $564B: $19
    ld   a, [hl]                                  ; $564C: $7E
    ldh  [hActiveEntityPosX], a                   ; $564D: $E0 $EE
    ld   hl, wD100                                ; $564F: $21 $00 $D1

.jr_5652
    add  hl, de                                   ; $5652: $19
    ld   a, [hl]                                  ; $5653: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $5654: $E0 $EC
    ld   de, Unknown052SpriteVariants             ; $5656: $11 $25 $56
    ldh  a, [hMultiPurposeG]                      ; $5659: $F0 $E8
    cp   $00                                      ; $565B: $FE $00
    jr   z, .render                               ; $565D: $28 $0C

    ld   hl, wEntitiesPosYTable                   ; $565F: $21 $10 $C2
    add  hl, bc                                   ; $5662: $09
    ldh  a, [hActiveEntityVisualPosY]             ; $5663: $F0 $EC
    cp   [hl]                                     ; $5665: $BE
    jr   z, jr_015_5676                           ; $5666: $28 $0E

    ld   de, Unknown048SpriteVariants             ; $5668: $11 $21 $56

.render
    xor  a                                        ; $566B: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $566C: $E0 $F1
    call RenderActiveEntitySpritesPair            ; $566E: $CD $C0 $3B
    ld   a, $02                                   ; $5671: $3E $02
    call func_015_7964_trampoline                 ; $5673: $CD $A0 $3D

jr_015_5676:
    ldh  a, [hMultiPurposeG]                      ; $5676: $F0 $E8
    inc  a                                        ; $5678: $3C
    cp   $08                                      ; $5679: $FE $08
    jr   nz, jr_015_5639                          ; $567B: $20 $BC

    call CopyEntityPositionToActivePosition       ; $567D: $CD $8A $3D
    call func_015_569F                            ; $5680: $CD $9F $56
    call ReturnIfNonInteractive_15                ; $5683: $CD $0D $7B
    ld   hl, wEntitiesInertiaTable                ; $5686: $21 $D0 $C3
    add  hl, bc                                   ; $5689: $09
    ld   a, [hl]                                  ; $568A: $7E
    inc  [hl]                                     ; $568B: $34
    and  $7F                                      ; $568C: $E6 $7F
    ld   e, a                                     ; $568E: $5F
    ld   d, b                                     ; $568F: $50
    ldh  a, [hActiveEntityVisualPosY]             ; $5690: $F0 $EC
    ld   hl, wD100                                ; $5692: $21 $00 $D1
    add  hl, de                                   ; $5695: $19
    ld   [hl], a                                  ; $5696: $77
    ldh  a, [hActiveEntityPosX]                   ; $5697: $F0 $EE
    ld   hl, wIsFileSelectionArrowShifted         ; $5699: $21 $00 $D0
    add  hl, de                                   ; $569C: $19
    ld   [hl], a                                  ; $569D: $77
    ret                                           ; $569E: $C9

func_015_569F::
    ld   hl, wEntitiesSpriteVariantTable          ; $569F: $21 $B0 $C3
    add  hl, bc                                   ; $56A2: $09
    ld   a, [hl]                                  ; $56A3: $7E
    rla                                           ; $56A4: $17
    rla                                           ; $56A5: $17
    rla                                           ; $56A6: $17
    rla                                           ; $56A7: $17
    rla                                           ; $56A8: $17
    and  $E0                                      ; $56A9: $E6 $E0
    ld   e, a                                     ; $56AB: $5F
    ld   d, b                                     ; $56AC: $50
    ld   hl, Data_015_5501                        ; $56AD: $21 $01 $55
    add  hl, de                                   ; $56B0: $19
    ld   c, $08                                   ; $56B1: $0E $08
    call RenderActiveEntitySpritesRect            ; $56B3: $CD $E6 $3C
    ld   a, $08                                   ; $56B6: $3E $08
    jp   func_015_7964_trampoline                 ; $56B8: $C3 $A0 $3D

Data_015_56BB::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $00, $00, $4C, $00, $00, $08, $4C, $20, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $00, $00, $FF, $00, $00, $00, $FF, $20
    db   $F0, $00, $5C, $00, $F0, $08, $5C, $20, $00, $00, $5E, $00, $00, $08, $5E, $20
    db   $F0, $00, $44, $00, $F0, $08, $44, $20, $00, $00, $44, $40, $00, $08, $44, $60
    db   $00, $FC, $40, $00, $00, $04, $42, $00, $00, $0C, $40, $20, $00, $00, $FF, $00
    db   $00, $00, $48, $00, $00, $08, $48, $20, $00, $00, $FF, $00, $00, $00, $FF, $20

func_015_572B::
    ldh  a, [hActiveEntitySpriteVariant]          ; $572B: $F0 $F1
    rla                                           ; $572D: $17
    rla                                           ; $572E: $17
    rla                                           ; $572F: $17
    rla                                           ; $5730: $17
    and  $F0                                      ; $5731: $E6 $F0
    ld   e, a                                     ; $5733: $5F
    ld   d, b                                     ; $5734: $50
    ld   hl, Data_015_56BB                        ; $5735: $21 $BB $56
    add  hl, de                                   ; $5738: $19
    ld   c, $04                                   ; $5739: $0E $04
    call RenderActiveEntitySpritesRect            ; $573B: $CD $E6 $3C
    ld   a, $04                                   ; $573E: $3E $04
    jp   func_015_7964_trampoline                 ; $5740: $C3 $A0 $3D

FinalNightmareForm3Handler::
    ld   hl, wEntitiesPrivateState4Table          ; $5743: $21 $40 $C4
    add  hl, bc                                   ; $5746: $09
    ld   a, [hl]                                  ; $5747: $7E
    cp   $02                                      ; $5748: $FE $02
    jp   z, label_015_5DD5                        ; $574A: $CA $D5 $5D

    and  a                                        ; $574D: $A7
    jp   nz, label_015_5DED                       ; $574E: $C2 $ED $5D

    ld   a, c                                     ; $5751: $79
    ld   [wD201], a                               ; $5752: $EA $01 $D2
    ld   a, [wD21A]                               ; $5755: $FA $1A $D2
    and  a                                        ; $5758: $A7
    jr   nz, .jr_575E                             ; $5759: $20 $03

    call func_015_5A67                            ; $575B: $CD $67 $5A

.jr_575E
    call ReturnIfNonInteractive_15                ; $575E: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $5761: $CD $3E $7B
    ldh  a, [hActiveEntityState]                  ; $5764: $F0 $F0
    JP_TABLE                                      ; $5766
._00 dw func_015_577B                             ; $5767
._01 dw func_015_57CF                             ; $5769
._02 dw func_015_580B                             ; $576B
._03 dw func_015_5854                             ; $576D
._04 dw func_015_58ED                             ; $576F
._05 dw func_015_5926                             ; $5771
._06 dw func_015_5963                             ; $5773
._07 dw func_015_59B9                             ; $5775
._08 dw func_015_5A05                             ; $5777
._09 dw func_015_5A1F                             ; $5779

func_015_577B::
    xor  a                                        ; $577B: $AF
    call SetEntitySpriteVariant                   ; $577C: $CD $0C $3B
    call func_015_572B                            ; $577F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5782: $F0 $98
    push af                                       ; $5784: $F5
    ldh  a, [hLinkPositionY]                      ; $5785: $F0 $99
    push af                                       ; $5787: $F5
    ld   a, $50                                   ; $5788: $3E $50
    ldh  [hLinkPositionX], a                      ; $578A: $E0 $98
    ld   a, $30                                   ; $578C: $3E $30
    ldh  [hLinkPositionY], a                      ; $578E: $E0 $99
    ld   a, $10                                   ; $5790: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $5792: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5795: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $5798: $F0 $EC
    sub  [hl]                                     ; $579A: $96
    add  $03                                      ; $579B: $C6 $03
    cp   $06                                      ; $579D: $FE $06
    jr   nc, .jr_57B7                             ; $579F: $30 $16

    ld   hl, hLinkPositionX                       ; $57A1: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $57A4: $F0 $EE
    sub  [hl]                                     ; $57A6: $96
    add  $03                                      ; $57A7: $C6 $03
    cp   $06                                      ; $57A9: $FE $06
    jr   nc, .jr_57B7                             ; $57AB: $30 $0A

    call GetEntityTransitionCountdown             ; $57AD: $CD $05 $0C
    ld   [hl], $50                                ; $57B0: $36 $50
    call IncrementEntityState                     ; $57B2: $CD $12 $3B
    ld   [hl], $01                                ; $57B5: $36 $01

.jr_57B7
    pop  af                                       ; $57B7: $F1
    ldh  [hLinkPositionY], a                      ; $57B8: $E0 $99
    pop  af                                       ; $57BA: $F1
    ldh  [hLinkPositionX], a                      ; $57BB: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $57BD: $C3 $88 $7B

Data_015_57C0::
    db   $04, $03, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_57CF::
    call GetEntityTransitionCountdown             ; $57CF: $CD $05 $0C
    jr   z, .jr_57E5                              ; $57D2: $28 $11

    rra                                           ; $57D4: $1F
    rra                                           ; $57D5: $1F
    rra                                           ; $57D6: $1F
    and  $0F                                      ; $57D7: $E6 $0F
    ld   e, a                                     ; $57D9: $5F
    ld   d, b                                     ; $57DA: $50
    ld   hl, Data_015_57C0                        ; $57DB: $21 $C0 $57
    add  hl, de                                   ; $57DE: $19
    ld   a, [hl]                                  ; $57DF: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $57E0: $E0 $F1
    jp   func_015_572B                            ; $57E2: $C3 $2B $57

.jr_57E5
    xor  a                                        ; $57E5: $AF
    ld   [wD21A], a                               ; $57E6: $EA $1A $D2
    call func_015_5819                            ; $57E9: $CD $19 $58
    ld   hl, wEntitiesPosYTable                   ; $57EC: $21 $10 $C2
    add  hl, bc                                   ; $57EF: $09
    ld   a, [hl]                                  ; $57F0: $7E
    sub  $08                                      ; $57F1: $D6 $08
    ld   [hl], a                                  ; $57F3: $77
    call GetEntityTransitionCountdown             ; $57F4: $CD $05 $0C
    ld   [hl], $40                                ; $57F7: $36 $40
    call IncrementEntityState                     ; $57F9: $CD $12 $3B
    ld   hl, wEntitiesPrivateState3Table          ; $57FC: $21 $D0 $C2
    add  hl, bc                                   ; $57FF: $09
    ld   a, [hl]                                  ; $5800: $7E
    and  a                                        ; $5801: $A7
    ret  nz                                       ; $5802: $C0

    inc  [hl]                                     ; $5803: $34
    jp   func_015_52B1                            ; $5804: $C3 $B1 $52

Data_015_5807::
    db   $0F, $0A, $05, $00

func_015_580B::
    call GetEntityTransitionCountdown             ; $580B: $CD $05 $0C
    jr   nz, func_015_5819                        ; $580E: $20 $09

    ld   a, WAVE_SFX_AGAHNIM_CHARGE               ; $5810: $3E $22
    ldh  [hWaveSfx], a                            ; $5812: $E0 $F3
    ld   [hl], $C0                                ; $5814: $36 $C0
    jp   IncrementEntityState                     ; $5816: $C3 $12 $3B

func_015_5819::
    call func_015_7C0A                            ; $5819: $CD $0A $7C
    ld   a, e                                     ; $581C: $7B
    ld   [wD21E], a                               ; $581D: $EA $1E $D2
    ld   d, b                                     ; $5820: $50
    ld   hl, Data_015_5807                        ; $5821: $21 $07 $58
    add  hl, de                                   ; $5824: $19
    ld   a, [hl]                                  ; $5825: $7E
    ld   hl, wEntitiesDirectionTable              ; $5826: $21 $80 $C3
    add  hl, bc                                   ; $5829: $09
    ld   [hl], a                                  ; $582A: $77

label_015_582B:
    ld   hl, wEntitiesDirectionTable              ; $582B: $21 $80 $C3
    add  hl, bc                                   ; $582E: $09
    ld   a, [hl]                                  ; $582F: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $5830: $21 $B0 $C2
    add  hl, bc                                   ; $5833: $09
    add  [hl]                                     ; $5834: $86
    jp   SetEntitySpriteVariant                   ; $5835: $C3 $0C $3B

    nop                                           ; $5838: $00
    ld   bc, $0302                                ; $5839: $01 $02 $03

Data_015_583C::
    db   $03, $03, $03, $03, $02, $02, $02, $02, $01, $01, $01, $01, $00, $00, $00, $00

Data_015_584C::
    db   $18, $E8, $00, $00

Data_015_5850::
    db   $00, $00, $F0, $00

func_015_5854::
    call GetEntityTransitionCountdown             ; $5854: $CD $05 $0C
    jr   nz, jr_015_58C0                          ; $5857: $20 $67

    ld   [wD21D], a                               ; $5859: $EA $1D $D2
    ld   [hl], $50                                ; $585C: $36 $50
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $585E: $3E $E6
    call SpawnNewEntity_trampoline                ; $5860: $CD $86 $3B
    ld   hl, wEntitiesPrivateState4Table          ; $5863: $21 $40 $C4
    add  hl, de                                   ; $5866: $19
    inc  [hl]                                     ; $5867: $34
    push bc                                       ; $5868: $C5
    ld   a, [wD21E]                               ; $5869: $FA $1E $D2
    ld   c, a                                     ; $586C: $4F
    ld   hl, Data_015_584C                        ; $586D: $21 $4C $58
    add  hl, bc                                   ; $5870: $09
    ldh  a, [hMultiPurpose0]                      ; $5871: $F0 $D7
    add  [hl]                                     ; $5873: $86
    ld   hl, wEntitiesPosXTable                   ; $5874: $21 $00 $C2
    add  hl, de                                   ; $5877: $19
    ld   [hl], a                                  ; $5878: $77
    ld   hl, Data_015_5850                        ; $5879: $21 $50 $58
    add  hl, bc                                   ; $587C: $09
    ldh  a, [hMultiPurpose1]                      ; $587D: $F0 $D8
    add  [hl]                                     ; $587F: $86
    ld   hl, wEntitiesPosYTable                   ; $5880: $21 $10 $C2
    add  hl, de                                   ; $5883: $19
    ld   [hl], a                                  ; $5884: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5885: $21 $40 $C3
    add  hl, de                                   ; $5888: $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5889: $36 $42
    ld   hl, wEntitiesHitboxFlagsTable            ; $588B: $21 $50 $C3
    add  hl, de                                   ; $588E: $19
    ld   [hl], d                                  ; $588F: $72
    ld   a, NOISE_SFX_AGAHNIM_BALL                ; $5890: $3E $38
    ldh  [hNoiseSfx], a                           ; $5892: $E0 $F4
    ld   a, [wD220]                               ; $5894: $FA $20 $D2
    cp   $02                                      ; $5897: $FE $02
    jr   c, .jr_58B5                              ; $5899: $38 $1A

    ldh  a, [hLinkPositionX]                      ; $589B: $F0 $98
    ld   hl, hFrameCounter                        ; $589D: $21 $E7 $FF
    add  [hl]                                     ; $58A0: $86
    and  $01                                      ; $58A1: $E6 $01
    jr   nz, .jr_58B5                             ; $58A3: $20 $10

    ld   hl, wEntitiesStateTable                  ; $58A5: $21 $90 $C2
    add  hl, de                                   ; $58A8: $19
    ld   [hl], $03                                ; $58A9: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $58AB: $21 $E0 $C2
    add  hl, de                                   ; $58AE: $19
    ld   [hl], $1C                                ; $58AF: $36 $1C
    ld   a, NOISE_SFX_AGAHNIM_FAKE_BALL           ; $58B1: $3E $39
    ldh  [hNoiseSfx], a                           ; $58B3: $E0 $F4

.jr_58B5
    ld   c, e                                     ; $58B5: $4B
    ld   b, d                                     ; $58B6: $42
    ld   a, $18                                   ; $58B7: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $58B9: $CD $AA $3B
    pop  bc                                       ; $58BC: $C1
    jp   IncrementEntityState                     ; $58BD: $C3 $12 $3B

jr_015_58C0:
    rra                                           ; $58C0: $1F
    rra                                           ; $58C1: $1F
    rra                                           ; $58C2: $1F
    and  $03                                      ; $58C3: $E6 $03
    ld   hl, wEntitiesPrivateState1Table          ; $58C5: $21 $B0 $C2
    add  hl, bc                                   ; $58C8: $09
    ld   [hl], a                                  ; $58C9: $77
    call GetEntityTransitionCountdown             ; $58CA: $CD $05 $0C
    rra                                           ; $58CD: $1F
    rra                                           ; $58CE: $1F
    rra                                           ; $58CF: $1F
    rra                                           ; $58D0: $1F
    and  $0F                                      ; $58D1: $E6 $0F
    ld   e, a                                     ; $58D3: $5F
    ld   d, b                                     ; $58D4: $50
    ld   hl, Data_015_583C                        ; $58D5: $21 $3C $58
    add  hl, de                                   ; $58D8: $19
    ld   a, [hl]                                  ; $58D9: $7E
    ld   [wD21D], a                               ; $58DA: $EA $1D $D2
    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    cp   $40                                      ; $58E0: $FE $40
    jp   c, label_015_582B                        ; $58E2: $DA $2B $58

    and  $1F                                      ; $58E5: $E6 $1F
    jp   z, func_015_5819                         ; $58E7: $CA $19 $58

    jp   label_015_582B                           ; $58EA: $C3 $2B $58

func_015_58ED::
    call GetEntityTransitionCountdown             ; $58ED: $CD $05 $0C
    jr   nz, .jr_5908                             ; $58F0: $20 $16

    ld   [hl], $27                                ; $58F2: $36 $27
    ld   a, JINGLE_SHADOW_MOVE                    ; $58F4: $3E $35
    ldh  [hJingle], a                             ; $58F6: $E0 $F2
    ld   hl, wEntitiesPosYTable                   ; $58F8: $21 $10 $C2
    add  hl, bc                                   ; $58FB: $09
    ld   a, [hl]                                  ; $58FC: $7E
    add  $08                                      ; $58FD: $C6 $08
    ld   [hl], a                                  ; $58FF: $77
    ld   a, $01                                   ; $5900: $3E $01
    ld   [wD21A], a                               ; $5902: $EA $1A $D2
    jp   IncrementEntityState                     ; $5905: $C3 $12 $3B

.jr_5908
    ld   hl, wEntitiesPrivateState1Table          ; $5908: $21 $B0 $C2
    add  hl, bc                                   ; $590B: $09
    ld   [hl], $04                                ; $590C: $36 $04
    jp   label_015_582B                           ; $590E: $C3 $2B $58

Data_015_5911::
    db   $50, $28, $78, $18, $88, $38, $68, $50

Data_015_5919::
    db   $30, $30, $30, $50, $50, $70, $70, $74

Data_015_5921::
    db   $00, $01, $02, $03, $04

func_015_5926::
    call GetEntityTransitionCountdown             ; $5926: $CD $05 $0C
    jr   nz, .jr_594A                             ; $5929: $20 $1F

    call GetRandomByte                            ; $592B: $CD $0D $28
    and  $07                                      ; $592E: $E6 $07
    ld   e, a                                     ; $5930: $5F
    ld   d, b                                     ; $5931: $50
    ld   hl, Data_015_5911                        ; $5932: $21 $11 $59
    add  hl, de                                   ; $5935: $19
    ld   a, [hl]                                  ; $5936: $7E
    ld   [wD21B], a                               ; $5937: $EA $1B $D2
    ld   hl, Data_015_5919                        ; $593A: $21 $19 $59
    add  hl, de                                   ; $593D: $19
    ld   a, [hl]                                  ; $593E: $7E
    ld   [wD21C], a                               ; $593F: $EA $1C $D2
    call GetEntityTransitionCountdown             ; $5942: $CD $05 $0C
    ld   [hl], $1F                                ; $5945: $36 $1F
    jp   IncrementEntityState                     ; $5947: $C3 $12 $3B

.jr_594A
    rra                                           ; $594A: $1F

.jr_594B
    rra                                           ; $594B: $1F
    rra                                           ; $594C: $1F
    and  $0F                                      ; $594D: $E6 $0F
    ld   e, a                                     ; $594F: $5F
    ld   d, b                                     ; $5950: $50
    ld   hl, Data_015_5921                        ; $5951: $21 $21 $59
    add  hl, de                                   ; $5954: $19
    ld   a, [hl]                                  ; $5955: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $5956: $E0 $F1
    jp   func_015_572B                            ; $5958: $C3 $2B $57

Data_015_595B::
    db   $18, $14, $10, $0C, $08, $05, $02, $01

func_015_5963::
    xor  a                                        ; $5963: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $5964: $E0 $F1
    call func_015_572B                            ; $5966: $CD $2B $57
    ldh  a, [hLinkPositionY]                      ; $5969: $F0 $99
    push af                                       ; $596B: $F5
    ldh  a, [hLinkPositionX]                      ; $596C: $F0 $98
    push af                                       ; $596E: $F5
    ld   a, [wD21B]                               ; $596F: $FA $1B $D2
    ldh  [hLinkPositionX], a                      ; $5972: $E0 $98
    ld   a, [wD21C]                               ; $5974: $FA $1C $D2
    ldh  [hLinkPositionY], a                      ; $5977: $E0 $99
    call GetEntityTransitionCountdown             ; $5979: $CD $05 $0C
    rra                                           ; $597C: $1F
    rra                                           ; $597D: $1F
    and  $07                                      ; $597E: $E6 $07

.jr_5980
    ld   e, a                                     ; $5980: $5F
    ld   d, b                                     ; $5981: $50
    ld   hl, Data_015_595B                        ; $5982: $21 $5B $59
    add  hl, de                                   ; $5985: $19
    ld   a, [hl]                                  ; $5986: $7E
    call ApplyVectorTowardsLink_trampoline        ; $5987: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $598A: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $598D: $F0 $EC
    sub  [hl]                                     ; $598F: $96
    add  $03                                      ; $5990: $C6 $03
    cp   $06                                      ; $5992: $FE $06
    jr   nc, .jr_59AC                             ; $5994: $30 $16

    ld   hl, hLinkPositionX                       ; $5996: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $5999: $F0 $EE
    sub  [hl]                                     ; $599B: $96
    add  $03                                      ; $599C: $C6 $03
    cp   $06                                      ; $599E: $FE $06
    jr   nc, .jr_59AC                             ; $59A0: $30 $0A

    call GetEntityTransitionCountdown             ; $59A2: $CD $05 $0C
    ld   [hl], $50                                ; $59A5: $36 $50
    call IncrementEntityState                     ; $59A7: $CD $12 $3B
    ld   [hl], $01                                ; $59AA: $36 $01

.jr_59AC
    pop  af                                       ; $59AC: $F1
    ldh  [hLinkPositionX], a                      ; $59AD: $E0 $98
    pop  af                                       ; $59AF: $F1
    ldh  [hLinkPositionY], a                      ; $59B0: $E0 $99
    jp   UpdateEntityPosWithSpeed_15              ; $59B2: $C3 $88 $7B

Data_015_59B5::
    db   $00, $0A, $0F, $05

func_015_59B9::
    call GetEntityTransitionCountdown             ; $59B9: $CD $05 $0C
    jr   nz, .jr_59D3                             ; $59BC: $20 $15

    call func_015_542E                            ; $59BE: $CD $2E $54
    ld   a, $01                                   ; $59C1: $3E $01
    ld   [wD21A], a                               ; $59C3: $EA $1A $D2
    ld   a, $06                                   ; $59C6: $3E $06
    call SetEntitySpriteVariant                   ; $59C8: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $59CB: $CD $05 $0C
    ld   [hl], $50                                ; $59CE: $36 $50
    jp   IncrementEntityState                     ; $59D0: $C3 $12 $3B

.jr_59D3
    ld   a, [wD221]                               ; $59D3: $FA $21 $D2
    cp   $80                                      ; $59D6: $FE $80
    jr   nc, .jr_59DE                             ; $59D8: $30 $04

    inc  a                                        ; $59DA: $3C
    ld   [wD221], a                               ; $59DB: $EA $21 $D2

.jr_59DE
    ld   a, [wD221]                               ; $59DE: $FA $21 $D2
    ld   hl, wD222                                ; $59E1: $21 $22 $D2
    add  [hl]                                     ; $59E4: $86
    ld   [hl], a                                  ; $59E5: $77
    jr   nc, .jr_59EC                             ; $59E6: $30 $04

    ld   hl, wD223                                ; $59E8: $21 $23 $D2
    inc  [hl]                                     ; $59EB: $34

.jr_59EC
    ld   a, [wD223]                               ; $59EC: $FA $23 $D2
    and  $03                                      ; $59EF: $E6 $03
    ld   e, a                                     ; $59F1: $5F
    ld   d, b                                     ; $59F2: $50
    ld   hl, Data_015_59B5                        ; $59F3: $21 $B5 $59
    add  hl, de                                   ; $59F6: $19
    ld   a, [hl]                                  ; $59F7: $7E
    ld   hl, wEntitiesDirectionTable              ; $59F8: $21 $80 $C3
    add  hl, bc                                   ; $59FB: $09
    ld   [hl], a                                  ; $59FC: $77
    ld   hl, wEntitiesPrivateState1Table          ; $59FD: $21 $B0 $C2
    add  hl, bc                                   ; $5A00: $09
    ld   [hl], b                                  ; $5A01: $70
    jp   label_015_582B                           ; $5A02: $C3 $2B $58

func_015_5A05::
    call GetEntityTransitionCountdown             ; $5A05: $CD $05 $0C
    jr   nz, .jr_5A10                             ; $5A08: $20 $06

    call func_015_5128                            ; $5A0A: $CD $28 $51
    jp   IncrementEntityState                     ; $5A0D: $C3 $12 $3B

.jr_5A10
    cp   $18                                      ; $5A10: $FE $18
    jr   nc, .jr_5A1C                             ; $5A12: $30 $08

    rra                                           ; $5A14: $1F
    rra                                           ; $5A15: $1F
    rra                                           ; $5A16: $1F
    and  $03                                      ; $5A17: $E6 $03
    call SetEntitySpriteVariant                   ; $5A19: $CD $0C $3B

.jr_5A1C
    jp   func_015_572B                            ; $5A1C: $C3 $2B $57

func_015_5A1F::
    call func_015_572B                            ; $5A1F: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $5A22: $F0 $98
    push af                                       ; $5A24: $F5
    ldh  a, [hLinkPositionY]                      ; $5A25: $F0 $99
    push af                                       ; $5A27: $F5
    ld   a, $50                                   ; $5A28: $3E $50
    ldh  [hLinkPositionX], a                      ; $5A2A: $E0 $98
    ld   a, $30                                   ; $5A2C: $3E $30
    ldh  [hLinkPositionY], a                      ; $5A2E: $E0 $99
    ld   a, $10                                   ; $5A30: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $5A32: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $5A35: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $5A38: $F0 $EC
    sub  [hl]                                     ; $5A3A: $96
    add  $03                                      ; $5A3B: $C6 $03
    cp   $06                                      ; $5A3D: $FE $06
    jr   nc, .jr_5A5E                             ; $5A3F: $30 $1D

    ld   hl, hLinkPositionX                       ; $5A41: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $5A44: $F0 $EE
    sub  [hl]                                     ; $5A46: $96
    add  $03                                      ; $5A47: $C6 $03
    cp   $06                                      ; $5A49: $FE $06
    jr   nc, .jr_5A5E                             ; $5A4B: $30 $11

    call func_015_52BB                            ; $5A4D: $CD $BB $52
    call GetEntityTransitionCountdown             ; $5A50: $CD $05 $0C
    ld   [hl], $31                                ; $5A53: $36 $31
    ld   hl, wEntitiesHealthTable                 ; $5A55: $21 $60 $C3
    add  hl, bc                                   ; $5A58: $09
    ld   [hl], $FF                                ; $5A59: $36 $FF
    call func_015_5F9A                            ; $5A5B: $CD $9A $5F

.jr_5A5E
    pop  af                                       ; $5A5E: $F1
    ldh  [hLinkPositionY], a                      ; $5A5F: $E0 $99
    pop  af                                       ; $5A61: $F1
    ldh  [hLinkPositionX], a                      ; $5A62: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $5A64: $C3 $88 $7B

func_015_5A67::
    call func_015_5D8D                            ; $5A67: $CD $8D $5D
    call func_015_5B2C                            ; $5A6A: $CD $2C $5B
    call func_015_5B0B                            ; $5A6D: $CD $0B $5B
    jp   label_015_5D48                           ; $5A70: $C3 $48 $5D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown049SpriteVariants::
.variant0
    db $6A, $00
    db $6C, $00
.variant1
    db $6C, $20
    db $6A, $20
.variant2
    db $6A, $00
    db $FF, $FF
.variant3
    db $6A, $20
    db $FF, $FF

Data_015_5A83::
    db   $00, $00, $6A, $00, $08, $08, $7A, $00, $08, $00, $7A, $20, $00, $08, $6A, $20

Data_015_5A93::
    db   $00, $00, $00, $00, $02, $00, $00, $00, $00, $02, $04, $04, $04, $04, $04, $05
    db   $05, $05, $05, $05

Data_015_5AA7::
    db   $F0, $F3, $F3, $F0, $F5, $F0, $F3, $F3, $F0, $F5, $F1, $F0, $F1, $F2, $F0, $0F
    db   $10, $0F, $0E, $10

Data_015_5ABB::
    db   $ED, $ED, $F1, $F1, $FD, $ED, $ED, $F1, $F1, $FD, $F4, $F6, $F7, $F6, $F8, $F4
    db   $F6, $F7, $F6, $F8

Data_015_5ACF::
    db   $01, $01, $01, $01, $03, $01, $01, $01, $01, $03, $02, $02, $02, $02, $02, $03
    db   $03, $03, $03, $03

Data_015_5AE3::
    db   $10, $0D, $0D, $10, $13, $10, $0D, $0D, $10, $13, $F5, $F6, $F5, $F4, $F3, $13
    db   $12, $13, $14, $15

Data_015_5AF7::
    db   $ED, $ED, $F1, $F1, $FD, $ED, $ED, $F1, $F1, $FD, $EB, $EC, $ED, $EC, $F2, $EB
    db   $EC, $ED, $EC, $F2

func_015_5B0B::
    ld   hl, wEntitiesSpriteVariantTable          ; $5B0B: $21 $B0 $C3
    add  hl, bc                                   ; $5B0E: $09
    ld   a, [hl]                                  ; $5B0F: $7E
    ld   e, a                                     ; $5B10: $5F
    ld   d, b                                     ; $5B11: $50
    ld   hl, Data_015_5AE3                        ; $5B12: $21 $E3 $5A
    add  hl, de                                   ; $5B15: $19
    ldh  a, [hActiveEntityPosX]                   ; $5B16: $F0 $EE
    add  [hl]                                     ; $5B18: $86
    ldh  [hActiveEntityPosX], a                   ; $5B19: $E0 $EE
    ld   hl, Data_015_5AF7                        ; $5B1B: $21 $F7 $5A
    add  hl, de                                   ; $5B1E: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5B1F: $F0 $EC
    add  $08                                      ; $5B21: $C6 $08
    add  [hl]                                     ; $5B23: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5B24: $E0 $EC
    ld   hl, Data_015_5ACF                        ; $5B26: $21 $CF $5A
    add  hl, de                                   ; $5B29: $19
    jr   jr_015_5B4B                              ; $5B2A: $18 $1F

func_015_5B2C::
    ld   hl, wEntitiesSpriteVariantTable          ; $5B2C: $21 $B0 $C3
    add  hl, bc                                   ; $5B2F: $09
    ld   a, [hl]                                  ; $5B30: $7E
    ld   e, a                                     ; $5B31: $5F
    ld   d, b                                     ; $5B32: $50
    ld   hl, Data_015_5AA7                        ; $5B33: $21 $A7 $5A
    add  hl, de                                   ; $5B36: $19
    ldh  a, [hActiveEntityPosX]                   ; $5B37: $F0 $EE
    add  [hl]                                     ; $5B39: $86
    ldh  [hActiveEntityPosX], a                   ; $5B3A: $E0 $EE
    ld   hl, Data_015_5ABB                        ; $5B3C: $21 $BB $5A
    add  hl, de                                   ; $5B3F: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5B40: $F0 $EC
    add  $08                                      ; $5B42: $C6 $08
    add  [hl]                                     ; $5B44: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5B45: $E0 $EC
    ld   hl, Data_015_5A93                        ; $5B47: $21 $93 $5A
    add  hl, de                                   ; $5B4A: $19

jr_015_5B4B:
    ld   a, [hl]                                  ; $5B4B: $7E
    cp   $04                                      ; $5B4C: $FE $04
    jr   nc, .jr_5B5A                             ; $5B4E: $30 $0A

    ldh  [hActiveEntitySpriteVariant], a          ; $5B50: $E0 $F1
    ld   de, Unknown049SpriteVariants             ; $5B52: $11 $73 $5A
    call RenderActiveEntitySpritesPair            ; $5B55: $CD $C0 $3B
    jr   jr_015_5B6C                              ; $5B58: $18 $12

.jr_5B5A
    sub  $04                                      ; $5B5A: $D6 $04
    rla                                           ; $5B5C: $17
    rla                                           ; $5B5D: $17
    rla                                           ; $5B5E: $17
    and  $F8                                      ; $5B5F: $E6 $F8
    ld   e, a                                     ; $5B61: $5F
    ld   d, b                                     ; $5B62: $50
    ld   hl, Data_015_5A83                        ; $5B63: $21 $83 $5A
    add  hl, de                                   ; $5B66: $19
    ld   c, $02                                   ; $5B67: $0E $02
    call RenderActiveEntitySpritesRect            ; $5B69: $CD $E6 $3C

jr_015_5B6C:
    ld   a, $02                                   ; $5B6C: $3E $02
    call func_015_7964_trampoline                 ; $5B6E: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5B71: $C3 $8A $3D

Data_015_5B74::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $05, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $05, $10, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $05, $F9, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $05, $0F, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $06, $F9, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $06, $0F, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $06, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $06, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $62, $00, $FA, $08, $62, $20, $FA, $10, $60, $20
    db   $08, $F8, $6E, $00, $08, $00, $64, $00, $08, $08, $64, $20, $08, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $05, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $05, $10, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $05, $F9, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $05, $0F, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $06, $F9, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $06, $0F, $6E, $20
    db   $FA, $F8, $60, $00, $FA, $00, $66, $00, $FA, $08, $66, $20, $FA, $10, $60, $20
    db   $06, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $06, $10, $6E, $20
    db   $F8, $F8, $60, $00, $F8, $00, $66, $00, $F8, $08, $66, $20, $F8, $10, $60, $20
    db   $04, $F8, $6E, $00, $08, $00, $68, $00, $08, $08, $68, $20, $04, $10, $6E, $20
    db   $F8, $FC, $72, $00, $F8, $04, $74, $00, $08, $00, $76, $00, $08, $08, $78, $00
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FA, $FB, $72, $00, $FA, $03, $74, $00, $08, $00, $76, $00, $08, $08, $78, $00
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $04, $74, $20, $F8, $0C, $72, $20, $08, $00, $78, $20, $08, $08, $76, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FA, $05, $74, $20, $FA, $0D, $72, $20, $08, $00, $78, $20, $08, $08, $76, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Data_015_5D34::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0A, $0A, $0A, $0B, $0C
    db   $0C, $0C, $0C, $0D

label_015_5D48:
    ld   hl, wEntitiesSpriteVariantTable          ; $5D48: $21 $B0 $C3
    add  hl, bc                                   ; $5D4B: $09
    ld   a, [hl]                                  ; $5D4C: $7E
    ld   e, a                                     ; $5D4D: $5F
    ld   d, b                                     ; $5D4E: $50
    ld   hl, Data_015_5D34                        ; $5D4F: $21 $34 $5D
    add  hl, de                                   ; $5D52: $19
    ld   a, [hl]                                  ; $5D53: $7E
    ld   d, $00                                   ; $5D54: $16 $00
    ld   e, a                                     ; $5D56: $5F
    sla  e                                        ; $5D57: $CB $23
    rl   d                                        ; $5D59: $CB $12
    sla  e                                        ; $5D5B: $CB $23
    rl   d                                        ; $5D5D: $CB $12
    sla  e                                        ; $5D5F: $CB $23
    rl   d                                        ; $5D61: $CB $12
    sla  e                                        ; $5D63: $CB $23
    rl   d                                        ; $5D65: $CB $12
    sla  e                                        ; $5D67: $CB $23
    rl   d                                        ; $5D69: $CB $12
    ld   hl, Data_015_5B74                        ; $5D6B: $21 $74 $5B
    add  hl, de                                   ; $5D6E: $19
    ld   c, $08                                   ; $5D6F: $0E $08
    call RenderActiveEntitySpritesRect            ; $5D71: $CD $E6 $3C
    ld   a, $08                                   ; $5D74: $3E $08
    jp   func_015_7964_trampoline                 ; $5D76: $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown050SpriteVariants::
.variant0
    db $1E, $00
    db $1E, $60
.variant1
    db $7C, $00
    db $7C, $20
.variant2
    db $7E, $00
    db $7E, $20

Data_015_5D85::
    db   $14, $EC, $00, $00

Data_015_5D89::
    db   $00, $00, $F0, $04

func_015_5D8D::
    ldh  a, [hActiveEntityFlipAttribute]          ; $5D8D: $F0 $ED
    push af                                       ; $5D8F: $F5
    call func_015_5D97                            ; $5D90: $CD $97 $5D
    pop  af                                       ; $5D93: $F1
    ldh  [hActiveEntityFlipAttribute], a          ; $5D94: $E0 $ED
    ret                                           ; $5D96: $C9

func_015_5D97::
    ld   a, [wD21D]                               ; $5D97: $FA $1D $D2

.jr_5D9A
    and  a                                        ; $5D9A: $A7
    ret  z                                        ; $5D9B: $C8

    dec  a                                        ; $5D9C: $3D
    ldh  [hActiveEntitySpriteVariant], a          ; $5D9D: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $5D9F: $F0 $E7
    rla                                           ; $5DA1: $17
    rla                                           ; $5DA2: $17
    rla                                           ; $5DA3: $17
    and  $50                                      ; $5DA4: $E6 $50
    ldh  [hActiveEntityFlipAttribute], a          ; $5DA6: $E0 $ED
    ld   a, [wD21E]                               ; $5DA8: $FA $1E $D2
    ld   e, a                                     ; $5DAB: $5F
    ld   d, b                                     ; $5DAC: $50
    ld   hl, Data_015_5D85                        ; $5DAD: $21 $85 $5D
    add  hl, de                                   ; $5DB0: $19
    ldh  a, [hActiveEntityPosX]                   ; $5DB1: $F0 $EE
    add  [hl]                                     ; $5DB3: $86
    ldh  [hActiveEntityPosX], a                   ; $5DB4: $E0 $EE
    ld   hl, Data_015_5D89                        ; $5DB6: $21 $89 $5D
    add  hl, de                                   ; $5DB9: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5DBA: $F0 $EC
    add  [hl]                                     ; $5DBC: $86
    ldh  [hActiveEntityVisualPosY], a             ; $5DBD: $E0 $EC
    ld   de, Unknown050SpriteVariants             ; $5DBF: $11 $79 $5D
    call RenderActiveEntitySpritesPair            ; $5DC2: $CD $C0 $3B
    ld   a, $02                                   ; $5DC5: $3E $02
    call func_015_7964_trampoline                 ; $5DC7: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5DCA: $C3 $8A $3D

Data_015_5DCD::
    db   $46, $00, $46, $60, $70, $00, $FF, $FF

label_015_5DD5:
    ld   de, Data_015_5DCD                        ; $5DD5: $11 $CD $5D
    ret                                           ; $5DD8: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown051SpriteVariants::
.variant0
    db $7E, $00
    db $7E, $20
.variant1
    db $7C, $00
    db $7C, $20
.variant2
    db $1E, $00
    db $1E, $60
.variant3
    db $58, $00
    db $58, $20
.variant4
    db $5A, $00
    db $5A, $20

label_015_5DED:
    ldh  a, [hFrameCounter]                       ; $5DED: $F0 $E7
    rla                                           ; $5DEF: $17
    rla                                           ; $5DF0: $17
    rla                                           ; $5DF1: $17
    and  $50                                      ; $5DF2: $E6 $50
    ldh  [hActiveEntityFlipAttribute], a          ; $5DF4: $E0 $ED
    ld   de, Unknown051SpriteVariants             ; $5DF6: $11 $D9 $5D
    call RenderActiveEntitySpritesPair            ; $5DF9: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $5DFC: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $5DFF: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $5E02: $F0 $F0
    cp   $04                                      ; $5E04: $FE $04
    jr   nz, jr_015_5E24                          ; $5E06: $20 $1C

    call GetEntityPrivateCountdown1               ; $5E08: $CD $00 $0C
    jp   z, ClearEntityStatus_15                  ; $5E0B: $CA $31 $7C

    xor  c                                        ; $5E0E: $A9
    bit  0, a                                     ; $5E0F: $CB $47
    ld   e, $FF                                   ; $5E11: $1E $FF
    jr   z, .jr_5E20                              ; $5E13: $28 $0B

    call GetEntityPrivateCountdown1               ; $5E15: $CD $00 $0C
    ld   e, $01                                   ; $5E18: $1E $01
    cp   $08                                      ; $5E1A: $FE $08
    jr   nc, .jr_5E20                             ; $5E1C: $30 $02

    ld   e, $02                                   ; $5E1E: $1E $02

.jr_5E20
    ld   a, e                                     ; $5E20: $7B
    jp   SetEntitySpriteVariant                   ; $5E21: $C3 $0C $3B

jr_015_5E24:
    call UpdateEntityPosWithSpeed_15              ; $5E24: $CD $88 $7B
    call label_3B23                               ; $5E27: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $5E2A: $F0 $F0
    JP_TABLE                                      ; $5E2C
._00 dw func_015_5E35                             ; $5E2D
._01 dw func_015_5E85                             ; $5E2F
._02 dw func_015_5EAC                             ; $5E31
._03 dw func_015_5F22                             ; $5E33

func_015_5E35::
    call label_3B39                               ; $5E35: $CD $39 $3B

func_015_5E38::
    ld   hl, wEntitiesInertiaTable                ; $5E38: $21 $D0 $C3
    add  hl, bc                                   ; $5E3B: $09
    ld   a, [hl]                                  ; $5E3C: $7E
    inc  a                                        ; $5E3D: $3C
    ld   [hl], a                                  ; $5E3E: $77
    and  $03                                      ; $5E3F: $E6 $03
    jr   nz, .jr_5E79                             ; $5E41: $20 $36

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $5E43: $3E $E6
    call SpawnNewEntity_trampoline                ; $5E45: $CD $86 $3B
    ret  c                                        ; $5E48: $D8

    ld   hl, wEntitiesPhysicsFlagsTable           ; $5E49: $21 $40 $C3
    add  hl, de                                   ; $5E4C: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5E4D: $36 $C2
    ld   hl, wEntitiesHitboxFlagsTable            ; $5E4F: $21 $50 $C3
    add  hl, de                                   ; $5E52: $19
    ld   [hl], d                                  ; $5E53: $72
    ld   hl, wEntitiesPrivateState4Table          ; $5E54: $21 $40 $C4
    add  hl, de                                   ; $5E57: $19
    inc  [hl]                                     ; $5E58: $34
    ldh  a, [hMultiPurpose0]                      ; $5E59: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5E5B: $21 $00 $C2
    add  hl, de                                   ; $5E5E: $19
    ld   [hl], a                                  ; $5E5F: $77
    ldh  a, [hMultiPurpose1]                      ; $5E60: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5E62: $21 $10 $C2
    add  hl, de                                   ; $5E65: $19
    ld   [hl], a                                  ; $5E66: $77
    ld   hl, wEntitiesPrivateCountdown1Table      ; $5E67: $21 $F0 $C2
    add  hl, de                                   ; $5E6A: $19
    ld   [hl], $0F                                ; $5E6B: $36 $0F
    ld   hl, wEntitiesSpriteVariantTable          ; $5E6D: $21 $B0 $C3
    add  hl, de                                   ; $5E70: $19
    ld   [hl], $01                                ; $5E71: $36 $01
    ld   hl, wEntitiesStateTable                  ; $5E73: $21 $90 $C2
    add  hl, de                                   ; $5E76: $19
    ld   [hl], $04                                ; $5E77: $36 $04

.jr_5E79
    ld   hl, wEntitiesCollisionsTable             ; $5E79: $21 $A0 $C2
    add  hl, bc                                   ; $5E7C: $09
    ld   a, [hl]                                  ; $5E7D: $7E
    and  a                                        ; $5E7E: $A7
    jr   z, .ret_5E84                             ; $5E7F: $28 $03

    jp   ClearEntityStatus_15                     ; $5E81: $C3 $31 $7C

.ret_5E84
    ret                                           ; $5E84: $C9

func_015_5E85::
    ld   a, NOISE_SFX_BEAMOS_LASER                ; $5E85: $3E $08
    ldh  [hNoiseSfx], a                           ; $5E87: $E0 $F4
    ld   a, $18                                   ; $5E89: $3E $18
    call GetVectorTowardsLink_trampoline          ; $5E8B: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $5E8E: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $5E90: $E0 $9B
    cpl                                           ; $5E92: $2F
    inc  a                                        ; $5E93: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $5E94: $21 $50 $C2
    add  hl, bc                                   ; $5E97: $09
    ld   [hl], a                                  ; $5E98: $77
    ldh  a, [hMultiPurpose1]                      ; $5E99: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $5E9B: $E0 $9A
    cpl                                           ; $5E9D: $2F
    inc  a                                        ; $5E9E: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $5E9F: $21 $40 $C2
    add  hl, bc                                   ; $5EA2: $09
    ld   [hl], a                                  ; $5EA3: $77
    ld   a, $10                                   ; $5EA4: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $5EA6: $EA $3E $C1
    jp   IncrementEntityState                     ; $5EA9: $C3 $12 $3B

func_015_5EAC::
    call func_015_5E38                            ; $5EAC: $CD $38 $5E
    ld   a, [wD21A]                               ; $5EAF: $FA $1A $D2
    and  a                                        ; $5EB2: $A7
    ret  nz                                       ; $5EB3: $C0

    ld   a, [wD201]                               ; $5EB4: $FA $01 $D2
    ld   e, a                                     ; $5EB7: $5F
    ld   d, b                                     ; $5EB8: $50
    ld   hl, wEntitiesPosXTable                   ; $5EB9: $21 $00 $C2
    add  hl, de                                   ; $5EBC: $19
    ldh  a, [hActiveEntityPosX]                   ; $5EBD: $F0 $EE
    sub  [hl]                                     ; $5EBF: $96
    add  $10                                      ; $5EC0: $C6 $10
    cp   $20                                      ; $5EC2: $FE $20
    jr   nc, ret_015_5F19                         ; $5EC4: $30 $53

    ld   hl, wEntitiesPosYTable                   ; $5EC6: $21 $10 $C2
    add  hl, de                                   ; $5EC9: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $5ECA: $F0 $EC
    sub  [hl]                                     ; $5ECC: $96
    add  $0C                                      ; $5ECD: $C6 $0C
    cp   $18                                      ; $5ECF: $FE $18
    jr   nc, ret_015_5F19                         ; $5ED1: $30 $46

    ld   hl, wEntitiesSpeedXTable                 ; $5ED3: $21 $40 $C2
    add  hl, bc                                   ; $5ED6: $09
    ld   a, [hl]                                  ; $5ED7: $7E
    sla  a                                        ; $5ED8: $CB $27
    ld   hl, wEntitiesRecoilVelocityX             ; $5EDA: $21 $F0 $C3
    add  hl, de                                   ; $5EDD: $19
    ld   [hl], a                                  ; $5EDE: $77
    ld   hl, wEntitiesSpeedYTable                 ; $5EDF: $21 $50 $C2
    add  hl, bc                                   ; $5EE2: $09
    ld   a, [hl]                                  ; $5EE3: $7E
    sla  a                                        ; $5EE4: $CB $27
    ld   hl, wEntitiesRecoilVelocityY             ; $5EE6: $21 $00 $C4
    add  hl, de                                   ; $5EE9: $19
    ld   [hl], a                                  ; $5EEA: $77
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5EEB: $21 $10 $C4
    add  hl, de                                   ; $5EEE: $19
    ld   [hl], $12                                ; $5EEF: $36 $12
    call ClearEntityStatus_15                     ; $5EF1: $CD $31 $7C
    ld   a, [wD220]                               ; $5EF4: $FA $20 $D2
    inc  a                                        ; $5EF7: $3C
    ld   [wD220], a                               ; $5EF8: $EA $20 $D2
    cp   $04                                      ; $5EFB: $FE $04
    jr   c, jr_015_5F0F                           ; $5EFD: $38 $10

    ld   hl, wEntitiesStateTable                  ; $5EFF: $21 $90 $C2

.jr_5F02
    add  hl, de                                   ; $5F02: $19
    ld   [hl], $07                                ; $5F03: $36 $07
    ld   hl, wEntitiesTransitionCountdownTable    ; $5F05: $21 $E0 $C2
    add  hl, de                                   ; $5F08: $19
    ld   [hl], $C0                                ; $5F09: $36 $C0
    ld   a, JINGLE_SHADOW_AGAHNIM_DEFEAT          ; $5F0B: $3E $36
    ldh  [hJingle], a                             ; $5F0D: $E0 $F2

jr_015_5F0F:
    ld   hl, wEntitiesFlashCountdownTable         ; $5F0F: $21 $20 $C4
    add  hl, de                                   ; $5F12: $19
    ld   [hl], $14                                ; $5F13: $36 $14
    ld   a, WAVE_SFX_BOSS_HURT                    ; $5F15: $3E $07
    ldh  [hWaveSfx], a                            ; $5F17: $E0 $F3

ret_015_5F19:
    ret                                           ; $5F19: $C9

Data_015_5F1A::
    db   $20, $20, $E0, $E0

Data_015_5F1E::
    db   $20, $E0, $20, $E0

func_015_5F22::
    call label_3B44                               ; $5F22: $CD $44 $3B
    ldh  a, [hFrameCounter]                       ; $5F25: $F0 $E7
    rra                                           ; $5F27: $1F
    rra                                           ; $5F28: $1F
    rra                                           ; $5F29: $1F
    and  $01                                      ; $5F2A: $E6 $01
    add  $03                                      ; $5F2C: $C6 $03
    call SetEntitySpriteVariant                   ; $5F2E: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5F31: $CD $05 $0C
    jr   z, jr_015_5F3F                           ; $5F34: $28 $09

    and  $01                                      ; $5F36: $E6 $01
    jr   nz, jr_015_5F3F                          ; $5F38: $20 $05

    ld   a, $18                                   ; $5F3A: $3E $18

.jr_5F3C
    call ApplyVectorTowardsLink_trampoline        ; $5F3C: $CD $AA $3B

jr_015_5F3F:
    ld   hl, wEntitiesCollisionsTable             ; $5F3F: $21 $A0 $C2
    add  hl, bc                                   ; $5F42: $09
    ld   a, [hl]                                  ; $5F43: $7E
    and  a                                        ; $5F44: $A7
    jr   z, ret_015_5F99                          ; $5F45: $28 $52

    ld   a, NOISE_SFX_AGAHNIM_FAKE_BALL_EXPLODE   ; $5F47: $3E $36
    ldh  [hNoiseSfx], a                           ; $5F49: $E0 $F4
    xor  a                                        ; $5F4B: $AF

.loop_5F4C
    ldh  [hMultiPurposeG], a                      ; $5F4C: $E0 $E8
    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $5F4E: $3E $7D
    call SpawnNewEntity_trampoline                ; $5F50: $CD $86 $3B
    jr   c, .jr_5F96                              ; $5F53: $38 $41

    ldh  a, [hMultiPurpose0]                      ; $5F55: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5F57: $21 $00 $C2
    add  hl, de                                   ; $5F5A: $19
    ld   [hl], a                                  ; $5F5B: $77
    ldh  a, [hMultiPurpose1]                      ; $5F5C: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F5E: $21 $10 $C2
    add  hl, de                                   ; $5F61: $19
    ld   [hl], a                                  ; $5F62: $77
    ld   hl, wEntitiesPrivateState1Table          ; $5F63: $21 $B0 $C2
    add  hl, de                                   ; $5F66: $19
    inc  [hl]                                     ; $5F67: $34
    push bc                                       ; $5F68: $C5
    ldh  a, [hMultiPurpose0]                      ; $5F69: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5F6B: $21 $00 $C2
    add  hl, de                                   ; $5F6E: $19
    ld   [hl], a                                  ; $5F6F: $77
    ldh  a, [hMultiPurpose1]                      ; $5F70: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F72: $21 $10 $C2
    add  hl, de                                   ; $5F75: $19
    ld   [hl], a                                  ; $5F76: $77
    ldh  a, [hMultiPurposeG]                      ; $5F77: $F0 $E8
    ld   c, a                                     ; $5F79: $4F
    ld   hl, Data_015_5F1A                        ; $5F7A: $21 $1A $5F
    add  hl, bc                                   ; $5F7D: $09
    ld   a, [hl]                                  ; $5F7E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5F7F: $21 $40 $C2
    add  hl, de                                   ; $5F82: $19
    ld   [hl], a                                  ; $5F83: $77
    ld   hl, Data_015_5F1E                        ; $5F84: $21 $1E $5F
    add  hl, bc                                   ; $5F87: $09
    ld   a, [hl]                                  ; $5F88: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5F89: $21 $50 $C2
    add  hl, de                                   ; $5F8C: $19
    ld   [hl], a                                  ; $5F8D: $77
    pop  bc                                       ; $5F8E: $C1
    ldh  a, [hMultiPurposeG]                      ; $5F8F: $F0 $E8
    inc  a                                        ; $5F91: $3C
    cp   $04                                      ; $5F92: $FE $04
    jr   nz, .loop_5F4C                           ; $5F94: $20 $B6

.jr_5F96
    jp   ClearEntityStatus_15                     ; $5F96: $C3 $31 $7C

ret_015_5F99:
    ret                                           ; $5F99: $C9

func_015_5F9A::
    ld   e, $80                                   ; $5F9A: $1E $80
    ld   hl, wD100                                ; $5F9C: $21 $00 $D1

.loop_5F9F
    xor  a                                        ; $5F9F: $AF
    ld   [hl+], a                                 ; $5FA0: $22
    dec  e                                        ; $5FA1: $1D
    jr   nz, .loop_5F9F                           ; $5FA2: $20 $FB

    ret                                           ; $5FA4: $C9

Data_015_5FA5::
    db   $03, $03, $05, $05, $00, $00, $04, $04, $02, $02, $06, $06, $01, $01, $07, $07

Data_015_5FB5::
    db   $00, $06, $0C, $0E

Data_015_5FB9::
    db   $10, $0E, $0C, $06, $00, $FA, $F4, $F2, $F0, $F2, $F4, $FA, $00, $06, $0C, $0E

Data_015_5FC9::
    db   $06, $07, $00, $01, $02, $03, $04, $05

func_015_5FD1::
    call ReturnIfNonInteractive_15                ; $5FD1: $CD $0D $7B
    jp   label_3B39                               ; $5FD4: $C3 $39 $3B

FinalNightmareForm4Handler::
    ldh  a, [hActiveEntityState]                  ; $5FD7: $F0 $F0
    JP_TABLE                                      ; $5FD9
._00 dw func_015_604A                             ; $5FDA
._01 dw func_015_60D4                             ; $5FDC
._02 dw func_015_60C1                             ; $5FDE
._03 dw func_015_608C                             ; $5FE0

Data_015_5FE2::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $4C, $00, $00, $08, $4C, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $F8, $78, $00, $F8, $00, $7A, $00
    db   $F8, $08, $7A, $20, $00, $10, $78, $20, $08, $00, $7C, $00, $08, $08, $7C, $20

Data_015_6042::
    db   $03, $03, $02, $01, $00, $00, $00, $00

func_015_604A::
    xor  a                                        ; $604A: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $604B: $E0 $F1
    call GetEntityTransitionCountdown             ; $604D: $CD $05 $0C
    jr   nz, .jr_6055                             ; $6050: $20 $03

    jp   IncrementEntityState                     ; $6052: $C3 $12 $3B

.jr_6055
    cp   $20                                      ; $6055: $FE $20
    jr   nz, .jr_605F                             ; $6057: $20 $06

    dec  [hl]                                     ; $6059: $35
    call func_015_52B1                            ; $605A: $CD $B1 $52
    ld   a, $20                                   ; $605D: $3E $20

.jr_605F
    rra                                           ; $605F: $1F
    rra                                           ; $6060: $1F
    rra                                           ; $6061: $1F
    and  $07                                      ; $6062: $E6 $07
    ld   e, a                                     ; $6064: $5F
    ld   d, b                                     ; $6065: $50
    ld   hl, Data_015_6042                        ; $6066: $21 $42 $60

jr_015_6069:
    add  hl, de                                   ; $6069: $19
    ld   a, [hl]                                  ; $606A: $7E
    rla                                           ; $606B: $17
    rla                                           ; $606C: $17
    rla                                           ; $606D: $17
    and  $F8                                      ; $606E: $E6 $F8
    ld   e, a                                     ; $6070: $5F
    rla                                           ; $6071: $17
    and  $F0                                      ; $6072: $E6 $F0
    add  e                                        ; $6074: $83
    ld   e, a                                     ; $6075: $5F
    ld   hl, Data_015_5FE2                        ; $6076: $21 $E2 $5F
    add  hl, de                                   ; $6079: $19
    ld   c, $06                                   ; $607A: $0E $06
    call RenderActiveEntitySpritesRect            ; $607C: $CD $E6 $3C
    ld   a, $06                                   ; $607F: $3E $06
    jp   func_015_7964_trampoline                 ; $6081: $C3 $A0 $3D

Data_015_6084::
    db   $00, $00, $01, $01, $02, $02, $03, $03

func_015_608C::
    xor  a                                        ; $608C: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $608D: $E0 $F1
    call GetEntityTransitionCountdown             ; $608F: $CD $05 $0C
    jr   nz, .jr_60B5                             ; $6092: $20 $21

    call func_015_52BB                            ; $6094: $CD $BB $52
    call func_015_5128                            ; $6097: $CD $28 $51
    ld   hl, wEntitiesHealthTable                 ; $609A: $21 $60 $C3
    add  hl, bc                                   ; $609D: $09
    ld   [hl], $FF                                ; $609E: $36 $FF
    ld   hl, wEntitiesPhysicsFlagsTable           ; $60A0: $21 $40 $C3
    add  hl, bc                                   ; $60A3: $09
    ld   [hl], ENTITY_PHYSICS_PROJECTILE_NOCLIP   ; $60A4: $36 $40
    ld   hl, wEntitiesHitboxFlagsTable            ; $60A6: $21 $50 $C3
    add  hl, bc                                   ; $60A9: $09
    ld   [hl], $0A                                ; $60AA: $36 $0A
    ld   hl, wEntitiesOptions1Table               ; $60AC: $21 $30 $C4
    add  hl, bc                                   ; $60AF: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IMMUNE_WATER_PIT ; $60B0: $36 $90
    jp   ConfigureEntityHitbox                    ; $60B2: $C3 $EA $3A

.jr_60B5
    rra                                           ; $60B5: $1F
    rra                                           ; $60B6: $1F
    rra                                           ; $60B7: $1F
    and  $07                                      ; $60B8: $E6 $07
    ld   e, a                                     ; $60BA: $5F
    ld   d, b                                     ; $60BB: $50
    ld   hl, Data_015_6084                        ; $60BC: $21 $84 $60
    jr   jr_015_6069                              ; $60BF: $18 $A8

func_015_60C1::
    ld   hl, wEntitiesPrivateCountdown3Table      ; $60C1: $21 $80 $C4
    add  hl, bc                                   ; $60C4: $09
    ld   a, [hl]                                  ; $60C5: $7E
    and  a                                        ; $60C6: $A7
    jr   nz, func_015_60D4                        ; $60C7: $20 $0B

    call GetEntityTransitionCountdown             ; $60C9: $CD $05 $0C
    ld   [hl], $1F                                ; $60CC: $36 $1F
    call func_015_542E                            ; $60CE: $CD $2E $54
    jp   IncrementEntityState                     ; $60D1: $C3 $12 $3B

func_015_60D4::
    call func_015_5FD1                            ; $60D4: $CD $D1 $5F
    call func_015_6245                            ; $60D7: $CD $45 $62
    call DecrementEntityIgnoreHitsCountdown       ; $60DA: $CD $56 $0C
    call CopyEntityPositionToActivePosition       ; $60DD: $CD $8A $3D
    call ReturnIfNonInteractive_15                ; $60E0: $CD $0D $7B
    xor  a                                        ; $60E3: $AF
    ld   [wD3D6], a                               ; $60E4: $EA $D6 $D3
    ld   e, $0C                                   ; $60E7: $1E $0C
    ld   hl, wEntitiesPrivateCountdown2Table      ; $60E9: $21 $00 $C3
    add  hl, bc                                   ; $60EC: $09
    ld   a, [hl]                                  ; $60ED: $7E
    and  a                                        ; $60EE: $A7
    jr   z, .jr_60FB                              ; $60EF: $28 $0A

    call jr_015_6109                              ; $60F1: $CD $09 $61
    ld   a, $01                                   ; $60F4: $3E $01
    ld   [wD3D6], a                               ; $60F6: $EA $D6 $D3
    ld   e, $0C                                   ; $60F9: $1E $0C

.jr_60FB
    ld   hl, wD202                                ; $60FB: $21 $02 $D2
    ld   a, [hl]                                  ; $60FE: $7E
    inc  a                                        ; $60FF: $3C
    ld   [hl], a                                  ; $6100: $77
    cp   e                                        ; $6101: $BB
    jr   c, jr_015_6109                           ; $6102: $38 $05

    ld   [hl], b                                  ; $6104: $70
    ld   a, JINGLE_SHADOW_MOLDORM_ROAM            ; $6105: $3E $38
    ldh  [hJingle], a                             ; $6107: $E0 $F2

jr_015_6109:
    ld   hl, wEntitiesInertiaTable                ; $6109: $21 $D0 $C3
    add  hl, bc                                   ; $610C: $09
    ld   a, [hl]                                  ; $610D: $7E
    inc  a                                        ; $610E: $3C
    and  $7F                                      ; $610F: $E6 $7F
    ld   [hl], a                                  ; $6111: $77
    ld   e, a                                     ; $6112: $5F
    ld   d, b                                     ; $6113: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6114: $21 $00 $D0
    add  hl, de                                   ; $6117: $19
    ldh  a, [hActiveEntityPosX]                   ; $6118: $F0 $EE
    ld   [hl], a                                  ; $611A: $77
    ld   hl, wD100                                ; $611B: $21 $00 $D1
    add  hl, de                                   ; $611E: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $611F: $F0 $EC
    ld   [hl], a                                  ; $6121: $77
    call func_015_6331                            ; $6122: $CD $31 $63
    ld   hl, wEntitiesPrivateState1Table          ; $6125: $21 $B0 $C2
    add  hl, bc                                   ; $6128: $09
    ld   e, [hl]                                  ; $6129: $5E
    srl  e                                        ; $612A: $CB $3B
    ld   d, b                                     ; $612C: $50
    ld   hl, Data_015_5FC9                        ; $612D: $21 $C9 $5F
    add  hl, de                                   ; $6130: $19
    ld   a, [hl]                                  ; $6131: $7E
    jp   SetEntitySpriteVariant                   ; $6132: $C3 $0C $3B

Data_015_6135::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $64, $00, $08, $00, $66, $00, $08, $08, $66, $20, $08, $10, $64, $20
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $6C, $00, $08, $00, $6E, $00, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $68, $00, $F8, $00, $6A, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $68, $40, $08, $00, $6A, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $6C, $40, $F8, $00, $6E, $40, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $64, $40, $F8, $00, $66, $40, $F8, $08, $66, $60, $F8, $10, $64, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6E, $60, $F8, $10, $6C, $60
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $6A, $20, $F8, $10, $68, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6A, $60, $08, $10, $68, $60
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $6E, $20, $08, $10, $6C, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown053SpriteVariants::
.variant0
    db $70, $00
    db $70, $20
.variant1
    db $72, $00
    db $72, $20
.variant2
    db $74, $00
    db $74, $20
.variant3
    db $76, $00
    db $76, $20

func_015_6245::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6245: $21 $40 $C3
    add  hl, bc                                   ; $6248: $09
    ld   [hl], 8 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6249: $36 $48
    ld   hl, wEntitiesSpriteVariantTable          ; $624B: $21 $B0 $C3
    add  hl, bc                                   ; $624E: $09
    ld   a, [hl]                                  ; $624F: $7E
    rla                                           ; $6250: $17
    rla                                           ; $6251: $17
    rla                                           ; $6252: $17
    rla                                           ; $6253: $17
    rla                                           ; $6254: $17
    and  $E0                                      ; $6255: $E6 $E0
    ld   e, a                                     ; $6257: $5F
    ld   d, b                                     ; $6258: $50
    ld   hl, Data_015_6135                        ; $6259: $21 $35 $61
    add  hl, de                                   ; $625C: $19
    ld   c, $08                                   ; $625D: $0E $08
    call RenderActiveEntitySpritesRect            ; $625F: $CD $E6 $3C
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6262: $21 $40 $C3
    add  hl, bc                                   ; $6265: $09
    ld   [hl], $42                                ; $6266: $36 $42
    ld   hl, wEntitiesInertiaTable                ; $6268: $21 $D0 $C3
    add  hl, bc                                   ; $626B: $09
    ld   a, [hl]                                  ; $626C: $7E
    ldh  [hMultiPurpose0], a                      ; $626D: $E0 $D7
    ldh  a, [hMultiPurpose0]                      ; $626F: $F0 $D7
    sub  $0C                                      ; $6271: $D6 $0C
    and  $7F                                      ; $6273: $E6 $7F
    ld   e, a                                     ; $6275: $5F
    ld   d, b                                     ; $6276: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6277: $21 $00 $D0
    add  hl, de                                   ; $627A: $19
    ld   a, [hl]                                  ; $627B: $7E
    ldh  [hActiveEntityPosX], a                   ; $627C: $E0 $EE
    ld   hl, wD100                                ; $627E: $21 $00 $D1
    add  hl, de                                   ; $6281: $19
    ld   a, [hl]                                  ; $6282: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6283: $E0 $EC
    ld   a, $00                                   ; $6285: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $6287: $E0 $F1
    ld   de, Unknown053SpriteVariants             ; $6289: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $628C: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $628F: $F0 $D7
    sub  $18                                      ; $6291: $D6 $18
    and  $7F                                      ; $6293: $E6 $7F
    ld   e, a                                     ; $6295: $5F
    ld   d, b                                     ; $6296: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $6297: $21 $00 $D0
    add  hl, de                                   ; $629A: $19
    ld   a, [hl]                                  ; $629B: $7E
    ldh  [hActiveEntityPosX], a                   ; $629C: $E0 $EE
    ld   hl, wD100                                ; $629E: $21 $00 $D1
    add  hl, de                                   ; $62A1: $19
    ld   a, [hl]                                  ; $62A2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62A3: $E0 $EC
    ld   a, $00                                   ; $62A5: $3E $00
    ldh  [hActiveEntitySpriteVariant], a          ; $62A7: $E0 $F1
    ld   de, Unknown053SpriteVariants             ; $62A9: $11 $35 $62

.jr_62AC
    call RenderActiveEntitySpritesPair            ; $62AC: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $62AF: $F0 $D7
    sub  $24                                      ; $62B1: $D6 $24
    and  $7F                                      ; $62B3: $E6 $7F
    ld   e, a                                     ; $62B5: $5F
    ld   d, b                                     ; $62B6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62B7: $21 $00 $D0
    add  hl, de                                   ; $62BA: $19
    ld   a, [hl]                                  ; $62BB: $7E
    ldh  [hActiveEntityPosX], a                   ; $62BC: $E0 $EE
    ld   hl, wD100                                ; $62BE: $21 $00 $D1
    add  hl, de                                   ; $62C1: $19
    ld   a, [hl]                                  ; $62C2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62C3: $E0 $EC
    ld   a, $01                                   ; $62C5: $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ; $62C7: $E0 $F1
    ld   de, Unknown053SpriteVariants             ; $62C9: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $62CC: $CD $C0 $3B
    ldh  a, [hMultiPurpose0]                      ; $62CF: $F0 $D7
    sub  $2E                                      ; $62D1: $D6 $2E
    and  $7F                                      ; $62D3: $E6 $7F
    ld   e, a                                     ; $62D5: $5F
    ld   d, b                                     ; $62D6: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $62D7: $21 $00 $D0
    add  hl, de                                   ; $62DA: $19
    ld   a, [hl]                                  ; $62DB: $7E
    ldh  [hActiveEntityPosX], a                   ; $62DC: $E0 $EE
    ld   hl, wD100                                ; $62DE: $21 $00 $D1
    add  hl, de                                   ; $62E1: $19
    ld   a, [hl]                                  ; $62E2: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $62E3: $E0 $EC
    ldh  a, [hFrameCounter]                       ; $62E5: $F0 $E7
    rra                                           ; $62E7: $1F
    rra                                           ; $62E8: $1F
    rra                                           ; $62E9: $1F
    and  $01                                      ; $62EA: $E6 $01
    add  $02                                      ; $62EC: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $62EE: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $62F0: $F0 $E7
    rla                                           ; $62F2: $17
    rla                                           ; $62F3: $17
    and  OAMF_PAL1                                ; $62F4: $E6 $10
    ld   hl, hActiveEntityFlipAttribute           ; $62F6: $21 $ED $FF
    xor  [hl]                                     ; $62F9: $AE
    ld   [hl], a                                  ; $62FA: $77
    ld   de, Unknown053SpriteVariants             ; $62FB: $11 $35 $62
    call RenderActiveEntitySpritesPair            ; $62FE: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $6301: $F0 $F0
    cp   $02                                      ; $6303: $FE $02
    jr   nc, ret_015_6330                         ; $6305: $30 $29

    ld   hl, wEntitiesFlashCountdownTable         ; $6307: $21 $20 $C4
    add  hl, bc                                   ; $630A: $09
    ld   a, [hl]                                  ; $630B: $7E
    and  a                                        ; $630C: $A7
IF __OPTIMIZATIONS_1__
    jr   nz, .jr_6324
ELSE
    jr   nz, ret_015_6330                         ; $630D: $20 $21
ENDC

    ld   hl, wEntitiesOptions1Table               ; $630F: $21 $30 $C4
    add  hl, bc                                   ; $6312: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IMMUNE_WATER_PIT ; $6313: $36 $90
    call label_3B70                               ; $6315: $CD $70 $3B
    ld   hl, wEntitiesOptions1Table               ; $6318: $21 $30 $C4
    add  hl, bc                                   ; $631B: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IMMUNE_WATER_PIT ; $631C: $36 $D0

.jr_6324
    ld   hl, wEntitiesHealthTable                 ; $631E: $21 $60 $C3
    add  hl, bc                                   ; $6321: $09
    ld   a, [hl]                                  ; $6322: $7E
    cp   $F0                                      ; $6323: $FE $F0
    jr   nc, ret_015_6330                         ; $6325: $30 $09

    call IncrementEntityState                     ; $6327: $CD $12 $3B
    ld   hl, wEntitiesPrivateCountdown3Table      ; $632A: $21 $80 $C4
    add  hl, bc                                   ; $632D: $09
    ld   [hl], $50                                ; $632E: $36 $50

ret_015_6330:
    ret                                           ; $6330: $C9

func_015_6331::
    ldh  a, [hActiveEntityState]                  ; $6331: $F0 $F0
    cp   $02                                      ; $6333: $FE $02
    jr   nc, .jr_6342                             ; $6335: $30 $0B

    ld   hl, wEntitiesFlashCountdownTable         ; $6337: $21 $20 $C4
    add  hl, bc                                   ; $633A: $09
    ld   a, [hl]                                  ; $633B: $7E
    and  a                                        ; $633C: $A7
    jr   nz, .jr_6342                             ; $633D: $20 $03

    call UpdateEntityPosWithSpeed_15              ; $633F: $CD $88 $7B

.jr_6342
    call label_3B23                               ; $6342: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6345: $21 $A0 $C2
    add  hl, bc                                   ; $6348: $09
    ld   a, [hl]                                  ; $6349: $7E
    and  a                                        ; $634A: $A7
    jr   z, jr_015_6379                           ; $634B: $28 $2C

    ld   e, $08                                   ; $634D: $1E $08
    bit  0, a                                     ; $634F: $CB $47
    jr   nz, .jr_6361                             ; $6351: $20 $0E

    ld   e, $00                                   ; $6353: $1E $00
    bit  1, a                                     ; $6355: $CB $4F
    jr   nz, .jr_6361                             ; $6357: $20 $08

    ld   e, $04                                   ; $6359: $1E $04
    bit  2, a                                     ; $635B: $CB $57
    jr   nz, .jr_6361                             ; $635D: $20 $02

    ld   e, $0C                                   ; $635F: $1E $0C

.jr_6361
    ld   hl, wEntitiesPrivateState1Table          ; $6361: $21 $B0 $C2
    add  hl, bc                                   ; $6364: $09
    ld   [hl], e                                  ; $6365: $73
    call GetRandomByte                            ; $6366: $CD $0D $28
    rra                                           ; $6369: $1F
    jr   c, .jr_6374                              ; $636A: $38 $08

    ld   hl, wEntitiesPrivateState2Table          ; $636C: $21 $C0 $C2
    add  hl, bc                                   ; $636F: $09
    ld   a, [hl]                                  ; $6370: $7E
    cpl                                           ; $6371: $2F
    inc  a                                        ; $6372: $3C
    ld   [hl], a                                  ; $6373: $77

.jr_6374
    call GetEntityTransitionCountdown             ; $6374: $CD $05 $0C
    ld   [hl], $10                                ; $6377: $36 $10

jr_015_6379:
    call GetEntityPrivateCountdown1               ; $6379: $CD $00 $0C
    jr   nz, .jr_63AF                             ; $637C: $20 $31

    ld   [hl], $06                                ; $637E: $36 $06
    ld   hl, wEntitiesPrivateState2Table          ; $6380: $21 $C0 $C2
    add  hl, bc                                   ; $6383: $09
    ld   a, [hl]                                  ; $6384: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6385: $21 $B0 $C2
    add  hl, bc                                   ; $6388: $09
    add  [hl]                                     ; $6389: $86
    and  $0F                                      ; $638A: $E6 $0F
    ld   [hl], a                                  ; $638C: $77
    ld   hl, wEntitiesPrivateState1Table          ; $638D: $21 $B0 $C2
    add  hl, bc                                   ; $6390: $09
    ld   e, [hl]                                  ; $6391: $5E
    ld   d, b                                     ; $6392: $50
    ld   hl, Data_015_5FA5                        ; $6393: $21 $A5 $5F
    add  hl, de                                   ; $6396: $19
    ld   a, [hl]                                  ; $6397: $7E
    call SetEntitySpriteVariant                   ; $6398: $CD $0C $3B
    ld   hl, Data_015_5FB5                        ; $639B: $21 $B5 $5F
    add  hl, de                                   ; $639E: $19
    ld   a, [hl]                                  ; $639F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $63A0: $21 $50 $C2
    add  hl, bc                                   ; $63A3: $09
    ld   [hl], a                                  ; $63A4: $77
    ld   hl, Data_015_5FB9                        ; $63A5: $21 $B9 $5F
    add  hl, de                                   ; $63A8: $19
    ld   a, [hl]                                  ; $63A9: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $63AA: $21 $40 $C2
    add  hl, bc                                   ; $63AD: $09
    ld   [hl], a                                  ; $63AE: $77

.jr_63AF
    call GetEntityTransitionCountdown             ; $63AF: $CD $05 $0C
    jr   nz, .ret_63C7                            ; $63B2: $20 $13

    call GetRandomByte                            ; $63B4: $CD $0D $28
    and  $1F                                      ; $63B7: $E6 $1F
    add  $10                                      ; $63B9: $C6 $10
    ld   [hl], a                                  ; $63BB: $77
    call GetRandomByte                            ; $63BC: $CD $0D $28
    and  $02                                      ; $63BF: $E6 $02
    dec  a                                        ; $63C1: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $63C2: $21 $C0 $C2
    add  hl, bc                                   ; $63C5: $09
    ld   [hl], a                                  ; $63C6: $77

.ret_63C7
    ret                                           ; $63C7: $C9

FinalNightmareForm5Handler::
    ld   hl, wEntitiesPrivateState1Table          ; $63C8: $21 $B0 $C2
    add  hl, bc                                   ; $63CB: $09
    ld   a, [hl]                                  ; $63CC: $7E
    cp   $03                                      ; $63CD: $FE $03
    jp   z, label_015_6D40                        ; $63CF: $CA $40 $6D

    cp   $02                                      ; $63D2: $FE $02
    jp   z, label_015_6D6E                        ; $63D4: $CA $6E $6D

    and  a                                        ; $63D7: $A7
    jp   nz, label_015_6C61                       ; $63D8: $C2 $61 $6C

    ldh  a, [hActiveEntityState]                  ; $63DB: $F0 $F0
    cp   $02                                      ; $63DD: $FE $02
    jr   c, jr_015_6425                           ; $63DF: $38 $44

    cp   $0B                                      ; $63E1: $FE $0B
    jr   z, .jr_63E9                              ; $63E3: $28 $04

    cp   $0C                                      ; $63E5: $FE $0C
    jr   nz, jr_015_63F2                          ; $63E7: $20 $09

.jr_63E9
    ld   a, $06                                   ; $63E9: $3E $06
    ldh  [hActiveEntitySpriteVariant], a          ; $63EB: $E0 $F1
    call func_015_572B                            ; $63ED: $CD $2B $57
    jr   jr_015_63F5                              ; $63F0: $18 $03

jr_015_63F2:
    call func_015_692A                            ; $63F2: $CD $2A $69

jr_015_63F5:
    call ReturnIfNonInteractive_15                ; $63F5: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $63F8: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $63FB: $F0 $F0
    cp   $09                                      ; $63FD: $FE $09
    jr   nc, jr_015_6425                          ; $63FF: $30 $24

    call label_3B39                               ; $6401: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6404: $21 $60 $C3
    add  hl, bc                                   ; $6407: $09
    ld   a, [hl]                                  ; $6408: $7E
    cp   $E8                                      ; $6409: $FE $E8
    jr   nc, jr_015_6425                          ; $640B: $30 $18

    call IncrementEntityState                     ; $640D: $CD $12 $3B
    ld   [hl], $09                                ; $6410: $36 $09
    ld   a, $09                                   ; $6412: $3E $09
    ldh  [hActiveEntityState], a                  ; $6414: $E0 $F0
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ; $6416: $3E $10
    ldh  [hWaveSfx], a                            ; $6418: $E0 $F3
    call GetEntityTransitionCountdown             ; $641A: $CD $05 $0C
    ld   [hl], $80                                ; $641D: $36 $80
    ld   hl, wEntitiesFlashCountdownTable         ; $641F: $21 $20 $C4
    add  hl, bc                                   ; $6422: $09
    ld   [hl], $80                                ; $6423: $36 $80

jr_015_6425:
    ldh  a, [hActiveEntityState]                  ; $6425: $F0 $F0
    JP_TABLE                                      ; $6427
._00 dw func_015_64BC                             ; $6428
._01 dw func_015_650E                             ; $642A
._02 dw func_015_6553                             ; $642C
._03 dw func_015_65A6                             ; $642E
._04 dw func_015_6618                             ; $6430
._05 dw func_015_66CC                             ; $6432
._06 dw func_015_6753                             ; $6434
._07 dw func_015_678F                             ; $6436
._08 dw func_015_67E2                             ; $6438
._09 dw func_015_67E3                             ; $643A
._0A dw func_015_67FA                             ; $643C
._0B dw func_015_6811                             ; $643E
._0C dw func_015_6896                             ; $6440
._0D dw func_015_68E7                             ; $6442

Data_015_6444::
    db   $00, $00, $4A, $00, $00, $08, $4A, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $4C, $00, $00, $08, $4C, $20
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $4E, $00, $00, $08, $4E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F0, $00, $5C, $00, $F0, $08, $5C, $20
    db   $00, $00, $5E, $00, $00, $08, $5E, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $FC, $6A, $00, $00, $04, $6C, $20, $00, $0C, $6A, $20, $F3, $FC, $50, $00
    db   $F3, $04, $52, $00, $F3, $0C, $6E, $00

func_015_64BC::
    xor  a                                        ; $64BC: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $64BD: $E0 $F1
    call SetEntitySpriteVariant                   ; $64BF: $CD $0C $3B
    call func_015_572B                            ; $64C2: $CD $2B $57
    ldh  a, [hLinkPositionX]                      ; $64C5: $F0 $98
    push af                                       ; $64C7: $F5
    ldh  a, [hLinkPositionY]                      ; $64C8: $F0 $99
    push af                                       ; $64CA: $F5
    ld   a, $50                                   ; $64CB: $3E $50
    ldh  [hLinkPositionX], a                      ; $64CD: $E0 $98
    ld   a, $30                                   ; $64CF: $3E $30
    ldh  [hLinkPositionY], a                      ; $64D1: $E0 $99
    ld   a, $10                                   ; $64D3: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $64D5: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $64D8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $64DB: $F0 $EC
    sub  [hl]                                     ; $64DD: $96
    add  $03                                      ; $64DE: $C6 $03
    cp   $06                                      ; $64E0: $FE $06
    jr   nc, .jr_64F8                             ; $64E2: $30 $14

    ld   hl, hLinkPositionX                       ; $64E4: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $64E7: $F0 $EE
    sub  [hl]                                     ; $64E9: $96
    add  $03                                      ; $64EA: $C6 $03
    cp   $06                                      ; $64EC: $FE $06
    jr   nc, .jr_64F8                             ; $64EE: $30 $08

    call GetEntityTransitionCountdown             ; $64F0: $CD $05 $0C
    ld   [hl], $60                                ; $64F3: $36 $60
    call IncrementEntityState                     ; $64F5: $CD $12 $3B

.jr_64F8
    pop  af                                       ; $64F8: $F1
    ldh  [hLinkPositionY], a                      ; $64F9: $E0 $99
    pop  af                                       ; $64FB: $F1
    ldh  [hLinkPositionX], a                      ; $64FC: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $64FE: $C3 $88 $7B

Data_015_6501::
    db   $04, $03, $02, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_650E::
    call GetEntityTransitionCountdown             ; $650E: $CD $05 $0C
    jr   nz, .jr_652E                             ; $6511: $20 $1B

    ld   [wD224], a                               ; $6513: $EA $24 $D2
    ld   hl, wEntitiesPosYTable                   ; $6516: $21 $10 $C2
    add  hl, bc                                   ; $6519: $09
    ld   a, [hl]                                  ; $651A: $7E
    sub  $08                                      ; $651B: $D6 $08
    ld   [hl], a                                  ; $651D: $77
    call GetEntityTransitionCountdown             ; $651E: $CD $05 $0C
    ld   [hl], $08                                ; $6521: $36 $08
    ld   a, $04                                   ; $6523: $3E $04
    call SetEntitySpriteVariant                   ; $6525: $CD $0C $3B
    call func_015_52B1                            ; $6528: $CD $B1 $52
    jp   IncrementEntityState                     ; $652B: $C3 $12 $3B

.jr_652E
    rra                                           ; $652E: $1F
    rra                                           ; $652F: $1F
    rra                                           ; $6530: $1F
    and  $0F                                      ; $6531: $E6 $0F
    ld   e, a                                     ; $6533: $5F
    ld   d, b                                     ; $6534: $50
    ld   hl, Data_015_6501                        ; $6535: $21 $01 $65
    add  hl, de                                   ; $6538: $19
    ld   a, [hl]                                  ; $6539: $7E
    rla                                           ; $653A: $17
    rla                                           ; $653B: $17
    rla                                           ; $653C: $17
    and  $F8                                      ; $653D: $E6 $F8
    ld   e, a                                     ; $653F: $5F
    rla                                           ; $6540: $17
    and  $F0                                      ; $6541: $E6 $F0
    add  e                                        ; $6543: $83
    ld   e, a                                     ; $6544: $5F
    ld   hl, Data_015_6444                        ; $6545: $21 $44 $64
    add  hl, de                                   ; $6548: $19
    ld   c, $06                                   ; $6549: $0E $06
    call RenderActiveEntitySpritesRect            ; $654B: $CD $E6 $3C
    ld   a, $06                                   ; $654E: $3E $06
    jp   func_015_7964_trampoline                 ; $6550: $C3 $A0 $3D

func_015_6553::
    call GetEntityTransitionCountdown             ; $6553: $CD $05 $0C
    jr   nz, ret_015_6565                         ; $6556: $20 $0D

    ld   [hl], $7F                                ; $6558: $36 $7F
    jp   IncrementEntityState                     ; $655A: $C3 $12 $3B

func_015_655D::
    call func_015_7BDB                            ; $655D: $CD $DB $7B
    ld   a, e                                     ; $6560: $7B
    ld   [wD21E], a                               ; $6561: $EA $1E $D2
    ret                                           ; $6564: $C9

ret_015_6565:
    ret                                           ; $6565: $C9

Data_015_6566::
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_015_6586::
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $02, $07, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_015_65A6::
    ld   a, $00                                   ; $65A6: $3E $00
    ld   [wD21E], a                               ; $65A8: $EA $1E $D2
    call GetEntityTransitionCountdown             ; $65AB: $CD $05 $0C
    jr   nz, .jr_65BB                             ; $65AE: $20 $0B

    call GetEntityDropTimer                       ; $65B0: $CD $FB $0B
    ld   [hl], $4C                                ; $65B3: $36 $4C
    call func_015_655D                            ; $65B5: $CD $5D $65
    jp   IncrementEntityState                     ; $65B8: $C3 $12 $3B

.jr_65BB
    cp   $40                                      ; $65BB: $FE $40
    jr   nz, .jr_65C4                             ; $65BD: $20 $05

    ld   hl, hNoiseSfx                            ; $65BF: $21 $F4 $FF
    ld   [hl], NOISE_SFX_PING                     ; $65C2: $36 $19

.jr_65C4
    cp   $58                                      ; $65C4: $FE $58
    jr   nz, .jr_65CD                             ; $65C6: $20 $05

    ld   hl, hJingle                              ; $65C8: $21 $F2 $FF
    ld   [hl], JINGLE_GANON_TRIDENT_APPEAR        ; $65CB: $36 $39

.jr_65CD
    rra                                           ; $65CD: $1F
    rra                                           ; $65CE: $1F
    and  $3F                                      ; $65CF: $E6 $3F
    ld   e, a                                     ; $65D1: $5F
    ld   d, b                                     ; $65D2: $50
    ld   hl, Data_015_6586                        ; $65D3: $21 $86 $65
    add  hl, de                                   ; $65D6: $19
    ld   a, [hl]                                  ; $65D7: $7E
    ld   [wD224], a                               ; $65D8: $EA $24 $D2
    ld   hl, Data_015_6566                        ; $65DB: $21 $66 $65
    add  hl, de                                   ; $65DE: $19
    ld   a, [hl]                                  ; $65DF: $7E
    call SetEntitySpriteVariant                   ; $65E0: $CD $0C $3B
    ld   a, [wD224]                               ; $65E3: $FA $24 $D2

.jr_65E6
    cp   $05                                      ; $65E6: $FE $05
    jr   z, .jr_65F5                              ; $65E8: $28 $0B

    ld   a, $F3                                   ; $65EA: $3E $F3
    ld   [wD225], a                               ; $65EC: $EA $25 $D2
    ld   a, $F0                                   ; $65EF: $3E $F0
    ld   [wD226], a                               ; $65F1: $EA $26 $D2
    ret                                           ; $65F4: $C9

.jr_65F5
    ld   a, $F8                                   ; $65F5: $3E $F8
    ld   [wD225], a                               ; $65F7: $EA $25 $D2
    ld   a, $FE                                   ; $65FA: $3E $FE
    ld   [wD226], a                               ; $65FC: $EA $26 $D2
    ret                                           ; $65FF: $C9

Data_015_6600::
    db   $03, $02, $01, $00

Data_015_6604::
    db   $00, $01, $02, $03

Data_015_6608::
    db   $E8, $00, $18, $18, $00, $E8, $E8, $00

Data_015_6610::
    db   $10, $18, $10, $F0, $E8, $F0, $10, $18

func_015_6618::
    call GetEntityDropTimer                       ; $6618: $CD $FB $0B
    jr   nz, jr_015_6628                          ; $661B: $20 $0B

    ld   [wD221], a                               ; $661D: $EA $21 $D2
    call GetEntityTransitionCountdown             ; $6620: $CD $05 $0C

.jr_6623
    ld   [hl], $30                                ; $6623: $36 $30
    jp   IncrementEntityState                     ; $6625: $C3 $12 $3B

jr_015_6628:
    ld   a, [wD21E]                               ; $6628: $FA $1E $D2
    and  a                                        ; $662B: $A7
    ld   a, $F5                                   ; $662C: $3E $F5
    jr   z, .jr_6632                              ; $662E: $28 $02

    ld   a, $0B                                   ; $6630: $3E $0B

.jr_6632
    ld   [wD225], a                               ; $6632: $EA $25 $D2
    ld   a, $EE                                   ; $6635: $3E $EE
    ld   [wD226], a                               ; $6637: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $663A: $F0 $E7
    rra                                           ; $663C: $1F
    rra                                           ; $663D: $1F
    rra                                           ; $663E: $1F
    nop                                           ; $663F: $00
    and  $01                                      ; $6640: $E6 $01
    call SetEntitySpriteVariant                   ; $6642: $CD $0C $3B
    ld   a, [wD21E]                               ; $6645: $FA $1E $D2
    and  a                                        ; $6648: $A7
    ld   hl, Data_015_6600                        ; $6649: $21 $00 $66
    jr   z, .jr_6651                              ; $664C: $28 $03

    ld   hl, Data_015_6604                        ; $664E: $21 $04 $66

.jr_6651
    ldh  a, [hFrameCounter]                       ; $6651: $F0 $E7
    rra                                           ; $6653: $1F
    rra                                           ; $6654: $1F
    rra                                           ; $6655: $1F
    nop                                           ; $6656: $00
    nop                                           ; $6657: $00
    and  $03                                      ; $6658: $E6 $03
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    add  hl, de                                   ; $665C: $19
    ld   a, [hl]                                  ; $665D: $7E
    inc  a                                        ; $665E: $3C
    ld   [wD224], a                               ; $665F: $EA $24 $D2
    ldh  a, [hFrameCounter]                       ; $6662: $F0 $E7
    and  $1F                                      ; $6664: $E6 $1F
    jr   nz, ret_015_66C7                         ; $6666: $20 $5F

    ld   a, [wD221]                               ; $6668: $FA $21 $D2
    cp   $06                                      ; $666B: $FE $06
    jr   nc, ret_015_66C7                         ; $666D: $30 $58

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $666F: $3E $E6
    call SpawnNewEntity_trampoline                ; $6671: $CD $86 $3B
    ret  c                                        ; $6674: $D8

    ld   hl, wEntitiesTransitionCountdownTable    ; $6675: $21 $E0 $C2
    add  hl, de                                   ; $6678: $19
    ld   [hl], $30                                ; $6679: $36 $30
    ld   hl, wEntitiesPrivateState1Table          ; $667B: $21 $B0 $C2
    add  hl, de                                   ; $667E: $19
    ld   [hl], $02                                ; $667F: $36 $02
    push bc                                       ; $6681: $C5
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6682: $21 $40 $C3
    add  hl, de                                   ; $6685: $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $6686: $36 $42
    ld   hl, wEntitiesHitboxFlagsTable            ; $6688: $21 $50 $C3
    add  hl, de                                   ; $668B: $19
    ld   [hl], $00                                ; $668C: $36 $00
    push de                                       ; $668E: $D5
    ld   c, e                                     ; $668F: $4B
    ld   b, d                                     ; $6690: $42
    call ConfigureEntityHitbox                    ; $6691: $CD $EA $3A
    pop  de                                       ; $6694: $D1
    ld   a, [wD21E]                               ; $6695: $FA $1E $D2
    and  a                                        ; $6698: $A7
    ld   a, [wD221]                               ; $6699: $FA $21 $D2
    jr   nz, .jr_66A0                             ; $669C: $20 $02

    xor  $07                                      ; $669E: $EE $07

.jr_66A0
    ld   c, a                                     ; $66A0: $4F
    ld   hl, Data_015_6610                        ; $66A1: $21 $10 $66
    add  hl, bc                                   ; $66A4: $09
    ld   a, [wD225]                               ; $66A5: $FA $25 $D2
    add  [hl]                                     ; $66A8: $86
    ld   hl, hMultiPurpose0                       ; $66A9: $21 $D7 $FF
    add  [hl]                                     ; $66AC: $86
    ld   hl, wEntitiesPosXTable                   ; $66AD: $21 $00 $C2
    add  hl, de                                   ; $66B0: $19
    ld   [hl], a                                  ; $66B1: $77
    ld   hl, Data_015_6608                        ; $66B2: $21 $08 $66
    add  hl, bc                                   ; $66B5: $09
    ld   a, [hl]                                  ; $66B6: $7E
    sub  $0C                                      ; $66B7: $D6 $0C
    ld   hl, hMultiPurpose1                       ; $66B9: $21 $D8 $FF
    add  [hl]                                     ; $66BC: $86
    ld   hl, wEntitiesPosYTable                   ; $66BD: $21 $10 $C2
    add  hl, de                                   ; $66C0: $19
    ld   [hl], a                                  ; $66C1: $77
    ld   hl, wD221                                ; $66C2: $21 $21 $D2
    inc  [hl]                                     ; $66C5: $34
    pop  bc                                       ; $66C6: $C1

ret_015_66C7:
    ret                                           ; $66C7: $C9

Data_015_66C8::
    db   $0B, $0A, $02, $0A

func_015_66CC::
    ld   a, [wD21E]                               ; $66CC: $FA $1E $D2
    and  a                                        ; $66CF: $A7
    ld   a, $FD                                   ; $66D0: $3E $FD
    jr   z, .jr_66D6                              ; $66D2: $28 $02

    ld   a, $03                                   ; $66D4: $3E $03

.jr_66D6
    ld   [wD225], a                               ; $66D6: $EA $25 $D2
    ld   a, $EC                                   ; $66D9: $3E $EC
    ld   [wD226], a                               ; $66DB: $EA $26 $D2
    ldh  a, [hFrameCounter]                       ; $66DE: $F0 $E7
    rra                                           ; $66E0: $1F
    rra                                           ; $66E1: $1F
    rra                                           ; $66E2: $1F
    nop                                           ; $66E3: $00
    nop                                           ; $66E4: $00
    and  $03                                      ; $66E5: $E6 $03
    ld   e, a                                     ; $66E7: $5F
    ld   d, b                                     ; $66E8: $50
    ld   hl, Data_015_66C8                        ; $66E9: $21 $C8 $66
    add  hl, de                                   ; $66EC: $19
    ld   a, [hl]                                  ; $66ED: $7E
    inc  a                                        ; $66EE: $3C
    ld   [wD224], a                               ; $66EF: $EA $24 $D2
    call GetEntityTransitionCountdown             ; $66F2: $CD $05 $0C
    jr   nz, jr_015_674E                          ; $66F5: $20 $57

    ld   [hl], $40                                ; $66F7: $36 $40
    xor  a                                        ; $66F9: $AF
    ld   [wD224], a                               ; $66FA: $EA $24 $D2
    call IncrementEntityState                     ; $66FD: $CD $12 $3B
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6700: $3E $E6
    call SpawnNewEntity_trampoline                ; $6702: $CD $86 $3B
    jr   c, jr_015_674E                           ; $6705: $38 $47

    ld   hl, wEntitiesPrivateState1Table          ; $6707: $21 $B0 $C2
    add  hl, de                                   ; $670A: $19
    inc  [hl]                                     ; $670B: $34
    ldh  a, [hMultiPurpose1]                      ; $670C: $F0 $D8
    sub  $10                                      ; $670E: $D6 $10
    ld   hl, wEntitiesPosYTable                   ; $6710: $21 $10 $C2
    add  hl, de                                   ; $6713: $19
    ld   [hl], a                                  ; $6714: $77
    ld   a, [wD21E]                               ; $6715: $FA $1E $D2
    ld   hl, wEntitiesDirectionTable              ; $6718: $21 $80 $C3
    add  hl, de                                   ; $671B: $19
    ld   [hl], a                                  ; $671C: $77
    and  a                                        ; $671D: $A7
    ld   a, $08                                   ; $671E: $3E $08
    jr   nz, .jr_6724                             ; $6720: $20 $02

    ld   a, $F8                                   ; $6722: $3E $F8

.jr_6724
    ld   hl, hMultiPurpose0                       ; $6724: $21 $D7 $FF
    add  [hl]                                     ; $6727: $86
    ld   hl, wEntitiesPosXTable                   ; $6728: $21 $00 $C2
    add  hl, de                                   ; $672B: $19
    ld   [hl], a                                  ; $672C: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $672D: $21 $40 $C3
    add  hl, de                                   ; $6730: $19
    ld   [hl], ENTITY_PHYSICS_PROJECTILE_NOCLIP   ; $6731: $36 $40
    ld   hl, wEntitiesHitboxFlagsTable            ; $6733: $21 $50 $C3
    add  hl, de                                   ; $6736: $19
    ld   [hl], $08                                ; $6737: $36 $08
    push bc                                       ; $6739: $C5
    ld   c, e                                     ; $673A: $4B
    ld   b, d                                     ; $673B: $42
    call ConfigureEntityHitbox                    ; $673C: $CD $EA $3A
    ld   a, $18                                   ; $673F: $3E $18
    call ApplyVectorTowardsLink_trampoline        ; $6741: $CD $AA $3B
    call GetEntityTransitionCountdown             ; $6744: $CD $05 $0C
    ld   [hl], $30                                ; $6747: $36 $30
    ld   a, NOISE_SFX_WEAPON_SWING                ; $6749: $3E $27
    ldh  [hNoiseSfx], a                           ; $674B: $E0 $F4
    pop  bc                                       ; $674D: $C1

jr_015_674E:
    ld   a, $02                                   ; $674E: $3E $02
    jp   SetEntitySpriteVariant                   ; $6750: $C3 $0C $3B

func_015_6753::
    call GetEntityTransitionCountdown             ; $6753: $CD $05 $0C
    jr   nz, .jr_676A                             ; $6756: $20 $12

    ld   [hl], $1F                                ; $6758: $36 $1F
    call GetRandomByte                            ; $675A: $CD $0D $28
    and  $07                                      ; $675D: $E6 $07
    ld   hl, wEntitiesPrivateState2Table          ; $675F: $21 $C0 $C2
    add  hl, bc                                   ; $6762: $09
    ld   [hl], a                                  ; $6763: $77
    call func_015_5128                            ; $6764: $CD $28 $51
    call IncrementEntityState                     ; $6767: $CD $12 $3B

.jr_676A
    ld   a, $03                                   ; $676A: $3E $03
    jp   SetEntitySpriteVariant                   ; $676C: $C3 $0C $3B

Data_015_676F::
    db   $28, $50, $78, $28, $78, $28, $50, $78

Data_015_6777::
    db   $20, $28, $20, $30, $30, $50, $50, $50

Data_015_677F::
    db   $20, $1E, $1C, $1A, $18, $16, $14, $12, $10, $0E, $0C, $0A, $08, $06, $04, $02

func_015_678F::
    ld   a, $04                                   ; $678F: $3E $04
    call SetEntitySpriteVariant                   ; $6791: $CD $0C $3B
    ldh  a, [hLinkPositionX]                      ; $6794: $F0 $98
    push af                                       ; $6796: $F5
    ldh  a, [hLinkPositionY]                      ; $6797: $F0 $99
    push af                                       ; $6799: $F5
    ld   hl, wEntitiesPrivateState2Table          ; $679A: $21 $C0 $C2
    add  hl, bc                                   ; $679D: $09
    ld   e, [hl]                                  ; $679E: $5E

.jr_679F
    ld   d, b                                     ; $679F: $50
    ld   hl, Data_015_676F                        ; $67A0: $21 $6F $67
    add  hl, de                                   ; $67A3: $19
    ld   a, [hl]                                  ; $67A4: $7E
    ldh  [hLinkPositionX], a                      ; $67A5: $E0 $98
    ld   hl, Data_015_6777                        ; $67A7: $21 $77 $67
    add  hl, de                                   ; $67AA: $19

.jr_67AB
    ld   a, [hl]                                  ; $67AB: $7E
    ldh  [hLinkPositionY], a                      ; $67AC: $E0 $99
    call GetEntityTransitionCountdown             ; $67AE: $CD $05 $0C
    rra                                           ; $67B1: $1F
    and  $0F                                      ; $67B2: $E6 $0F
    ld   e, a                                     ; $67B4: $5F
    ld   d, b                                     ; $67B5: $50
    ld   hl, Data_015_677F                        ; $67B6: $21 $7F $67
    add  hl, de                                   ; $67B9: $19
    ld   a, [hl]                                  ; $67BA: $7E
    call ApplyVectorTowardsLink_trampoline        ; $67BB: $CD $AA $3B
    ld   hl, hActiveEntityPosX                    ; $67BE: $21 $EE $FF

.jr_67C1
    ldh  a, [hLinkPositionX]                      ; $67C1: $F0 $98
    sub  [hl]                                     ; $67C3: $96
    add  $03                                      ; $67C4: $C6 $03

.jr_67C6
    cp   $06                                      ; $67C6: $FE $06
    jr   nc, jr_015_67D9                          ; $67C8: $30 $0F

    ld   hl, hActiveEntityVisualPosY              ; $67CA: $21 $EC $FF

.jr_67CD
    ldh  a, [hLinkPositionY]                      ; $67CD: $F0 $99
    sub  [hl]                                     ; $67CF: $96
    add  $03                                      ; $67D0: $C6 $03
    cp   $06                                      ; $67D2: $FE $06
    jr   nc, jr_015_67D9                          ; $67D4: $30 $03

    call IncrementEntityState                     ; $67D6: $CD $12 $3B

jr_015_67D9:
    pop  af                                       ; $67D9: $F1
    ldh  [hLinkPositionY], a                      ; $67DA: $E0 $99
    pop  af                                       ; $67DC: $F1
    ldh  [hLinkPositionX], a                      ; $67DD: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $67DF: $C3 $88 $7B

func_015_67E2::
    ret                                           ; $67E2: $C9

func_015_67E3::
    call GetEntityTransitionCountdown             ; $67E3: $CD $05 $0C
    jr   nz, .ret_67F9                            ; $67E6: $20 $11

    ld   [hl], $40                                ; $67E8: $36 $40
    call func_015_542E                            ; $67EA: $CD $2E $54
    call IncrementEntityState                     ; $67ED: $CD $12 $3B
    ld   a, $00                                   ; $67F0: $3E $00
    call SetEntitySpriteVariant                   ; $67F2: $CD $0C $3B
    xor  a                                        ; $67F5: $AF
    ld   [wD224], a                               ; $67F6: $EA $24 $D2

.ret_67F9
    ret                                           ; $67F9: $C9

func_015_67FA::
    ld   a, $06                                   ; $67FA: $3E $06
    ldh  [hActiveEntitySpriteVariant], a          ; $67FC: $E0 $F1
    call func_015_572B                            ; $67FE: $CD $2B $57
    call GetEntityTransitionCountdown             ; $6801: $CD $05 $0C
    ret  nz                                       ; $6804: $C0

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6805: $21 $40 $C3
    add  hl, bc                                   ; $6808: $09
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $6809: $CB $B6
    call IncrementEntityState                     ; $680B: $CD $12 $3B
    jp   ClearEntitySpeed                         ; $680E: $C3 $7F $3D

func_015_6811::
    call label_3B39                               ; $6811: $CD $39 $3B
    call UpdateEntityPosWithSpeed_15              ; $6814: $CD $88 $7B
    call label_3B23                               ; $6817: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $681A: $F0 $E7
    and  $01                                      ; $681C: $E6 $01
    jr   nz, jr_015_683F                          ; $681E: $20 $1F

    ld   a, $18                                   ; $6820: $3E $18
    call GetVectorTowardsLink_trampoline          ; $6822: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6825: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $6827: $21 $50 $C2
    sub  [hl]                                     ; $682A: $96
    bit  7, a                                     ; $682B: $CB $7F
    jr   z, .jr_6831                              ; $682D: $28 $02

    dec  [hl]                                     ; $682F: $35
    dec  [hl]                                     ; $6830: $35

.jr_6831
    inc  [hl]                                     ; $6831: $34
    ldh  a, [hMultiPurpose1]                      ; $6832: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $6834: $21 $40 $C2
    sub  [hl]                                     ; $6837: $96
    bit  7, a                                     ; $6838: $CB $7F
    jr   z, .jr_683E                              ; $683A: $28 $02

    dec  [hl]                                     ; $683C: $35
    dec  [hl]                                     ; $683D: $35

.jr_683E
    inc  [hl]                                     ; $683E: $34

jr_015_683F:
    ld   hl, wEntitiesFlashCountdownTable         ; $683F: $21 $20 $C4
    add  hl, bc                                   ; $6842: $09
    ld   a, [hl]                                  ; $6843: $7E
    and  a                                        ; $6844: $A7
    jr   z, .jr_685F                              ; $6845: $28 $18

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6847: $21 $40 $C3
    add  hl, bc                                   ; $684A: $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $684B: $CB $F6
    call GetEntityTransitionCountdown             ; $684D: $CD $05 $0C
    ld   [hl], $80                                ; $6850: $36 $80
    call label_27F2                               ; $6852: $CD $F2 $27
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ; $6855: $3E $10
    ldh  [hWaveSfx], a                            ; $6857: $E0 $F3
    call func_015_5383                            ; $6859: $CD $83 $53
    jp   IncrementEntityState                     ; $685C: $C3 $12 $3B

.jr_685F
    ld   hl, wEntitiesInertiaTable                ; $685F: $21 $D0 $C3
    add  hl, bc                                   ; $6862: $09
    ld   a, [hl]                                  ; $6863: $7E
    inc  a                                        ; $6864: $3C
    ld   [hl], a                                  ; $6865: $77
    and  $07                                      ; $6866: $E6 $07
    ret  nz                                       ; $6868: $C0

    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6869: $3E $E6
    call SpawnNewEntity_trampoline                ; $686B: $CD $86 $3B
    ret  c                                        ; $686E: $D8

    ldh  a, [hMultiPurpose0]                      ; $686F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6871: $21 $00 $C2
    add  hl, de                                   ; $6874: $19
    ld   [hl], a                                  ; $6875: $77
    ldh  a, [hMultiPurpose1]                      ; $6876: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6878: $21 $10 $C2
    add  hl, de                                   ; $687B: $19
    ld   [hl], a                                  ; $687C: $77
    ld   hl, wEntitiesPrivateState1Table          ; $687D: $21 $B0 $C2
    add  hl, de                                   ; $6880: $19
    ld   [hl], $03                                ; $6881: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6883: $21 $E0 $C2
    add  hl, de                                   ; $6886: $19
    ld   [hl], $1F                                ; $6887: $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6889: $21 $40 $C3
    add  hl, de                                   ; $688C: $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $688D: $36 $C2
    ld   hl, wEntitiesSpriteVariantTable          ; $688F: $21 $B0 $C3
    add  hl, de                                   ; $6892: $19
    ld   [hl], $01                                ; $6893: $36 $01
    ret                                           ; $6895: $C9

func_015_6896::
    call GetEntityTransitionCountdown             ; $6896: $CD $05 $0C
    cp   $01                                      ; $6899: $FE $01
    jr   nz, .jr_68A1                             ; $689B: $20 $04

    dec  [hl]                                     ; $689D: $35
    jp   func_015_5128                            ; $689E: $C3 $28 $51

.jr_68A1
    and  a                                        ; $68A1: $A7
    ret  nz                                       ; $68A2: $C0

    ldh  a, [hLinkPositionX]                      ; $68A3: $F0 $98
    push af                                       ; $68A5: $F5
    ldh  a, [hLinkPositionY]                      ; $68A6: $F0 $99
    push af                                       ; $68A8: $F5
    ld   a, $50                                   ; $68A9: $3E $50
    ldh  [hLinkPositionX], a                      ; $68AB: $E0 $98
    ld   a, $30                                   ; $68AD: $3E $30
    ldh  [hLinkPositionY], a                      ; $68AF: $E0 $99
    ld   a, $0C                                   ; $68B1: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $68B3: $CD $AA $3B
    ld   hl, hLinkPositionY                       ; $68B6: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $68B9: $F0 $EC
    sub  [hl]                                     ; $68BB: $96
    add  $03                                      ; $68BC: $C6 $03
    cp   $06                                      ; $68BE: $FE $06
    jr   nc, .jr_68D6                             ; $68C0: $30 $14

    ld   hl, hLinkPositionX                       ; $68C2: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $68C5: $F0 $EE
    sub  [hl]                                     ; $68C7: $96
    add  $03                                      ; $68C8: $C6 $03
    cp   $06                                      ; $68CA: $FE $06
    jr   nc, .jr_68D6                             ; $68CC: $30 $08

    call GetEntityTransitionCountdown             ; $68CE: $CD $05 $0C
    ld   [hl], $5F                                ; $68D1: $36 $5F
    call IncrementEntityState                     ; $68D3: $CD $12 $3B

.jr_68D6
    pop  af                                       ; $68D6: $F1
    ldh  [hLinkPositionY], a                      ; $68D7: $E0 $99
    pop  af                                       ; $68D9: $F1
    ldh  [hLinkPositionX], a                      ; $68DA: $E0 $98
    jp   UpdateEntityPosWithSpeed_15              ; $68DC: $C3 $88 $7B

Data_015_68DF::
    db   $00, $00, $00, $01, $01, $01, $02, $02

func_015_68E7::
    call GetEntityTransitionCountdown             ; $68E7: $CD $05 $0C
    jr   nz, .jr_6914                             ; $68EA: $20 $28

    call ClearEntitySpeed                         ; $68EC: $CD $7F $3D
    call func_015_52BB                            ; $68EF: $CD $BB $52
    ld   hl, wEntitiesHealthTable                 ; $68F2: $21 $60 $C3
    add  hl, bc                                   ; $68F5: $09
    ld   [hl], $FF                                ; $68F6: $36 $FF
    ld   hl, wEntitiesPhysicsFlagsTable           ; $68F8: $21 $40 $C3
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], $00                                ; $68FC: $36 $00
    ld   hl, wEntitiesOptions1Table               ; $68FE: $21 $30 $C4
    add  hl, bc                                   ; $6901: $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF ; $6902: $36 $C0
    call GetEntityDropTimer                       ; $6904: $CD $FB $0B
    ld   [hl], $90                                ; $6907: $36 $90
    xor  a                                        ; $6909: $AF
    ld   [wD223], a                               ; $690A: $EA $23 $D2
    ld   hl, wEntitiesPrivateCountdown2Table      ; $690D: $21 $00 $C3
    add  hl, bc                                   ; $6910: $09
    ld   [hl], $3F                                ; $6911: $36 $3F
    ret                                           ; $6913: $C9

.jr_6914
    cp   $20                                      ; $6914: $FE $20
    jr   c, .jr_691A                              ; $6916: $38 $02

    ld   a, $1F                                   ; $6918: $3E $1F

.jr_691A
    rra                                           ; $691A: $1F
    rra                                           ; $691B: $1F
    and  $07                                      ; $691C: $E6 $07
    ld   e, a                                     ; $691E: $5F
    ld   d, b                                     ; $691F: $50
    ld   hl, Data_015_68DF                        ; $6920: $21 $DF $68
    add  hl, de                                   ; $6923: $19
    ld   a, [hl]                                  ; $6924: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $6925: $E0 $F1
    jp   func_015_572B                            ; $6927: $C3 $2B $57

func_015_692A::
    ldh  a, [hActiveEntityState]                  ; $692A: $F0 $F0
    cp   $0A                                      ; $692C: $FE $0A
    ret  nc                                       ; $692E: $D0

    ldh  a, [hActiveEntitySpriteVariant]          ; $692F: $F0 $F1
    inc  a                                        ; $6931: $3C
    ret  z                                        ; $6932: $C8

    ld   a, [wD21E]                               ; $6933: $FA $1E $D2
    and  a                                        ; $6936: $A7
    ldh  a, [hActiveEntitySpriteVariant]          ; $6937: $F0 $F1
    jr   z, .jr_693D                              ; $6939: $28 $02

    add  $05                                      ; $693B: $C6 $05

.jr_693D
    ldh  [hActiveEntitySpriteVariant], a          ; $693D: $E0 $F1
    call func_015_69D2                            ; $693F: $CD $D2 $69
    call func_015_6A69                            ; $6942: $CD $69 $6A
    jp   func_015_6C10                            ; $6945: $C3 $10 $6C

Data_015_6948::
    db   $F8, $FC, $50, $00, $F8, $04, $52, $00, $F8, $0C, $6E, $00, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $FB, $FE, $50, $00, $FB, $06, $52, $00, $FB, $0E, $6E, $00, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $F8, $FC, $6E, $20, $F8, $04, $52, $20, $F8, $0C, $50, $20, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF
    db   $FB, $FA, $6E, $20, $FB, $02, $52, $20, $FB, $0A, $50, $20, $08, $F8, $6A, $00
    db   $08, $00, $6C, $00, $08, $08, $6C, $20, $08, $10, $6A, $20, $FF, $FF, $FF, $FF

Data_015_69C8::
    db   $00, $00, $02, $01, $00, $02, $02, $00, $03, $02

func_015_69D2::
    ldh  a, [hActiveEntitySpriteVariant]          ; $69D2: $F0 $F1
    ld   e, a                                     ; $69D4: $5F
    ld   d, b                                     ; $69D5: $50
    ld   hl, Data_015_69C8                        ; $69D6: $21 $C8 $69
    add  hl, de                                   ; $69D9: $19
    ld   a, [hl]                                  ; $69DA: $7E
    rla                                           ; $69DB: $17
    rla                                           ; $69DC: $17
    rla                                           ; $69DD: $17
    rla                                           ; $69DE: $17
    rla                                           ; $69DF: $17
    and  $70                                      ; $69E0: $E6 $70
    ld   e, a                                     ; $69E2: $5F
    ld   hl, Data_015_6948                        ; $69E3: $21 $48 $69
    add  hl, de                                   ; $69E6: $19
    ld   c, $07                                   ; $69E7: $0E $07
    call RenderActiveEntitySpritesRect            ; $69E9: $CD $E6 $3C
    ld   a, $07                                   ; $69EC: $3E $07
    jp   func_015_7964_trampoline                 ; $69EE: $C3 $A0 $3D

Data_015_69F1::
    db   $F4, $F8, $64, $00, $FE, $11, $60, $00, $FE, $19, $62, $00, $F4, $F9, $64, $00
    db   $FE, $11, $60, $00, $FE, $19, $62, $00, $F0, $00, $64, $20, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB, $10, $60, $00, $FB, $18, $62, $00
    db   $00, $F8, $66, $00, $FE, $10, $66, $20, $FF, $FF, $FF, $FF, $F4, $10, $64, $20
    db   $FE, $EF, $62, $20, $FE, $F7, $60, $20, $F4, $0F, $64, $20, $FE, $EF, $62, $20
    db   $FE, $F7, $60, $20, $F0, $08, $64, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF, $FB, $F0, $62, $20, $FB, $F8, $60, $20, $FE, $F8, $66, $00
    db   $00, $10, $66, $20, $FF, $FF, $FF, $FF

func_015_6A69::
    ldh  a, [hActiveEntitySpriteVariant]          ; $6A69: $F0 $F1
    rla                                           ; $6A6B: $17
    rla                                           ; $6A6C: $17
    and  $FC                                      ; $6A6D: $E6 $FC
    ld   e, a                                     ; $6A6F: $5F
    rla                                           ; $6A70: $17
    and  $F8                                      ; $6A71: $E6 $F8
    add  e                                        ; $6A73: $83
    ld   e, a                                     ; $6A74: $5F
    ld   d, b                                     ; $6A75: $50
    ld   hl, Data_015_69F1                        ; $6A76: $21 $F1 $69
    add  hl, de                                   ; $6A79: $19
    ld   c, $03                                   ; $6A7A: $0E $03
    call RenderActiveEntitySpritesRect            ; $6A7C: $CD $E6 $3C
    ld   a, $03                                   ; $6A7F: $3E $03
    jp   func_015_7964_trampoline                 ; $6A81: $C3 $A0 $3D

Data_015_6A84::
    db   $EC, $00, $70, $00, $EC, $08, $70, $20, $F4, $00, $7C, $00, $F4, $08, $7C, $20
    db   $08, $00, $7C, $40, $08, $08, $7C, $60, $14, $00, $70, $40, $14, $08, $70, $60
    db   $00, $00, $7E, $40, $00, $08, $7E, $20, $F3, $0D, $78, $20, $F3, $15, $76, $20
    db   $0D, $F3, $76, $40, $0D, $FB, $78, $40, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $EC, $72, $00, $00, $F4, $74, $00, $00, $FC, $7A, $00, $00, $0C, $7A, $00
    db   $00, $14, $74, $20, $00, $1C, $72, $20, $00, $00, $FF, $FF, $00, $00, $FF, $FF
    db   $00, $00, $7E, $00, $00, $08, $7E, $60, $F3, $F3, $76, $00, $F3, $FB, $78, $00
    db   $0D, $0D, $78, $60, $0D, $15, $76, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F1, $0F, $78, $20, $F1, $17, $76, $20, $0D, $F3, $76, $40, $0D, $FB, $78, $40
    db   $00, $00, $FF, $FF, $00, $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F1, $F1, $76, $00, $F1, $F9, $78, $00, $0D, $0D, $78, $60, $0D, $15, $76, $60
    db   $00, $00, $FF, $FF, $00, $08, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $08, $78, $20, $F8, $10, $76, $20, $08, $F8, $76, $40, $08, $00, $78, $40
    db   $00, $00, $FF, $40, $00, $08, $FF, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FC, $04, $78, $20, $FC, $0C, $76, $20, $04, $FC, $76, $40, $04, $04, $78, $40
    db   $00, $00, $FF, $40, $00, $08, $FF, $20, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $F8, $76, $00, $F8, $00, $78, $00, $08, $08, $78, $60, $08, $10, $76, $60
    db   $00, $00, $FF, $00, $00, $08, $FF, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FC, $FC, $76, $00, $FC, $04, $78, $00, $04, $04, $78, $60, $04, $0C, $76, $60
    db   $00, $00, $FF, $00, $00, $08, $FF, $60, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $F8, $72, $00, $00, $00, $74, $00, $00, $08, $74, $20, $00, $10, $72, $20
    db   $00, $08, $FF, $FF, $00, $10, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF
    db   $00, $FB, $72, $00, $00, $03, $74, $00, $00, $05, $74, $20, $00, $0D, $72, $20
    db   $00, $FC, $FF, $FF, $00, $0C, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF

Data_015_6C04::
    db   $08, $06, $06, $06, $04, $04, $04, $04, $04, $04, $04, $04

func_015_6C10::
    ld   a, [wD224]                               ; $6C10: $FA $24 $D2
    and  a                                        ; $6C13: $A7
    ret  z                                        ; $6C14: $C8

    ld   a, [wD225]                               ; $6C15: $FA $25 $D2
    ld   hl, hActiveEntityPosX                    ; $6C18: $21 $EE $FF
    add  [hl]                                     ; $6C1B: $86
    ld   [hl], a                                  ; $6C1C: $77
    ld   a, [wD226]                               ; $6C1D: $FA $26 $D2
    ld   hl, hActiveEntityVisualPosY              ; $6C20: $21 $EC $FF
    add  [hl]                                     ; $6C23: $86
    ld   [hl], a                                  ; $6C24: $77
    ld   a, [wD224]                               ; $6C25: $FA $24 $D2
    dec  a                                        ; $6C28: $3D
    ld   e, a                                     ; $6C29: $5F
    ld   d, b                                     ; $6C2A: $50
    ld   hl, Data_015_6C04                        ; $6C2B: $21 $04 $6C
    add  hl, de                                   ; $6C2E: $19
    ld   c, [hl]                                  ; $6C2F: $4E
    ld   d, b                                     ; $6C30: $50
    sla  e                                        ; $6C31: $CB $23
    rl   d                                        ; $6C33: $CB $12
    sla  e                                        ; $6C35: $CB $23
    rl   d                                        ; $6C37: $CB $12
    sla  e                                        ; $6C39: $CB $23
    rl   d                                        ; $6C3B: $CB $12
    sla  e                                        ; $6C3D: $CB $23
    rl   d                                        ; $6C3F: $CB $12
    sla  e                                        ; $6C41: $CB $23
    rl   d                                        ; $6C43: $CB $12
    ld   a, e                                     ; $6C45: $7B
    and  $E0                                      ; $6C46: $E6 $E0
    ld   e, a                                     ; $6C48: $5F
    ld   hl, Data_015_6A84                        ; $6C49: $21 $84 $6A
    add  hl, de                                   ; $6C4C: $19
    push bc                                       ; $6C4D: $C5
    call RenderActiveEntitySpritesRect            ; $6C4E: $CD $E6 $3C
    pop  de                                       ; $6C51: $D1
    ld   a, e                                     ; $6C52: $7B
    call func_015_7964_trampoline                 ; $6C53: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $6C56: $C3 $8A $3D

Data_015_6C59::
    db   $03, $02, $01, $00

Data_015_6C5D::
    db   $00, $01, $02, $03

label_015_6C61:
    ld   a, [wD201]                               ; $6C61: $FA $01 $D2
    ld   e, a                                     ; $6C64: $5F
    ld   d, b                                     ; $6C65: $50
    ld   hl, wEntitiesStateTable                  ; $6C66: $21 $90 $C2
    add  hl, de                                   ; $6C69: $19
    ld   a, [hl]                                  ; $6C6A: $7E
    cp   $09                                      ; $6C6B: $FE $09
    jp   nc, ClearEntityStatus_15                 ; $6C6D: $D2 $31 $7C

    ld   hl, wEntitiesInertiaTable                ; $6C70: $21 $D0 $C3
    add  hl, bc                                   ; $6C73: $09
    ld   a, [hl]                                  ; $6C74: $7E
    rra                                           ; $6C75: $1F
    rra                                           ; $6C76: $1F
    rra                                           ; $6C77: $1F
    and  $03                                      ; $6C78: $E6 $03
    ld   e, a                                     ; $6C7A: $5F
    ld   d, b                                     ; $6C7B: $50
    ld   hl, wEntitiesDirectionTable              ; $6C7C: $21 $80 $C3
    add  hl, bc                                   ; $6C7F: $09
    ld   a, [hl]                                  ; $6C80: $7E
    and  a                                        ; $6C81: $A7
    ld   hl, Data_015_6C59                        ; $6C82: $21 $59 $6C
    jr   z, .jr_6C8A                              ; $6C85: $28 $03

    ld   hl, Data_015_6C5D                        ; $6C87: $21 $5D $6C

.jr_6C8A
    add  hl, de                                   ; $6C8A: $19
    ld   a, [hl]                                  ; $6C8B: $7E
    inc  a                                        ; $6C8C: $3C
    ld   [wD224], a                               ; $6C8D: $EA $24 $D2
    xor  a                                        ; $6C90: $AF
    ld   [wD225], a                               ; $6C91: $EA $25 $D2
    ld   [wD226], a                               ; $6C94: $EA $26 $D2
    call func_015_6C10                            ; $6C97: $CD $10 $6C
    xor  a                                        ; $6C9A: $AF
    ld   [wD224], a                               ; $6C9B: $EA $24 $D2
    call ReturnIfNonInteractive_15                ; $6C9E: $CD $0D $7B
    ldh  a, [hFrameCounter]                       ; $6CA1: $F0 $E7
    and  $0F                                      ; $6CA3: $E6 $0F
    jr   nz, .jr_6CAB                             ; $6CA5: $20 $04

    ld   a, NOISE_SFX_GANON_FLYING_TRIDENT        ; $6CA7: $3E $3A
    ldh  [hNoiseSfx], a                           ; $6CA9: $E0 $F4

.jr_6CAB
    ld   hl, wEntitiesInertiaTable                ; $6CAB: $21 $D0 $C3
    add  hl, bc                                   ; $6CAE: $09
    inc  [hl]                                     ; $6CAF: $34
    call UpdateEntityPosWithSpeed_15              ; $6CB0: $CD $88 $7B
    call label_3B44                               ; $6CB3: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $6CB6: $CD $05 $0C
    jr   z, .jr_6CBC                              ; $6CB9: $28 $01

    ret                                           ; $6CBB: $C9

.jr_6CBC
    ldh  a, [hLinkPositionX]                      ; $6CBC: $F0 $98
    push af                                       ; $6CBE: $F5
    ldh  a, [hLinkPositionY]                      ; $6CBF: $F0 $99
    push af                                       ; $6CC1: $F5
    ld   a, [wD201]                               ; $6CC2: $FA $01 $D2
    ld   e, a                                     ; $6CC5: $5F
    ld   d, b                                     ; $6CC6: $50
    ld   hl, wEntitiesPosXTable                   ; $6CC7: $21 $00 $C2
    add  hl, de                                   ; $6CCA: $19
    ld   a, [hl]                                  ; $6CCB: $7E
    ldh  [hLinkPositionX], a                      ; $6CCC: $E0 $98
    ld   hl, wEntitiesPosYTable                   ; $6CCE: $21 $10 $C2
    add  hl, de                                   ; $6CD1: $19
    ld   a, [hl]                                  ; $6CD2: $7E
    sub  $0C                                      ; $6CD3: $D6 $0C
    ldh  [hLinkPositionY], a                      ; $6CD5: $E0 $99
    ld   a, $10                                   ; $6CD7: $3E $10
    call GetVectorTowardsLink_trampoline          ; $6CD9: $CD $B5 $3B
    ld   hl, wEntitiesSpeedYTable                 ; $6CDC: $21 $50 $C2
    add  hl, bc                                   ; $6CDF: $09
    ldh  a, [hMultiPurpose0]                      ; $6CE0: $F0 $D7
    sub  [hl]                                     ; $6CE2: $96
    and  $80                                      ; $6CE3: $E6 $80
    jr   nz, .jr_6CE9                             ; $6CE5: $20 $02

    inc  [hl]                                     ; $6CE7: $34
    inc  [hl]                                     ; $6CE8: $34

.jr_6CE9
    dec  [hl]                                     ; $6CE9: $35
    ld   hl, wEntitiesSpeedXTable                 ; $6CEA: $21 $40 $C2
    add  hl, bc                                   ; $6CED: $09
    ldh  a, [hMultiPurpose1]                      ; $6CEE: $F0 $D8
    sub  [hl]                                     ; $6CF0: $96
    and  $80                                      ; $6CF1: $E6 $80
    jr   nz, .jr_6CF7                             ; $6CF3: $20 $02

    inc  [hl]                                     ; $6CF5: $34
    inc  [hl]                                     ; $6CF6: $34

.jr_6CF7
    dec  [hl]                                     ; $6CF7: $35
    ld   hl, hLinkPositionY                       ; $6CF8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $6CFB: $F0 $EC
    sub  [hl]                                     ; $6CFD: $96
    add  $03                                      ; $6CFE: $C6 $03
    cp   $06                                      ; $6D00: $FE $06
    jr   nc, .jr_6D29                             ; $6D02: $30 $25

    ld   hl, hLinkPositionX                       ; $6D04: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $6D07: $F0 $EE
    sub  [hl]                                     ; $6D09: $96
    add  $03                                      ; $6D0A: $C6 $03
    cp   $06                                      ; $6D0C: $FE $06
    jr   nc, .jr_6D29                             ; $6D0E: $30 $19

    ld   a, [wD201]                               ; $6D10: $FA $01 $D2
    ld   e, a                                     ; $6D13: $5F
    ld   d, b                                     ; $6D14: $50
    ld   hl, wEntitiesStateTable                  ; $6D15: $21 $90 $C2
    add  hl, de                                   ; $6D18: $19
    ld   a, [hl]                                  ; $6D19: $7E
    cp   $08                                      ; $6D1A: $FE $08
    jr   nz, .jr_6D29                             ; $6D1C: $20 $0B

    ld   [hl], $03                                ; $6D1E: $36 $03
    ld   hl, wEntitiesTransitionCountdownTable    ; $6D20: $21 $E0 $C2
    add  hl, de                                   ; $6D23: $19
    ld   [hl], $4C                                ; $6D24: $36 $4C
    call ClearEntityStatus_15                     ; $6D26: $CD $31 $7C

.jr_6D29
    pop  af                                       ; $6D29: $F1
    ldh  [hLinkPositionY], a                      ; $6D2A: $E0 $99
    pop  af                                       ; $6D2C: $F1
    ldh  [hLinkPositionX], a                      ; $6D2D: $E0 $98
    ret                                           ; $6D2F: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown054SpriteVariants:: ; $6D30
.variant0
    db $4A, $00
    db $4A, $20
.variant1
    db $4C, $00
    db $4C, $20
.variant2
    db $4E, $00
    db $4E, $20

Data_015_6D3C::
    db   $00, $00, $01, $01

label_015_6D40:
    ld   de, Unknown054SpriteVariants             ; $6D40: $11 $30 $6D
    call RenderActiveEntitySpritesPair            ; $6D43: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $6D46: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $6D49: $CD $05 $0C
    jp   z, ClearEntityStatus_15                  ; $6D4C: $CA $31 $7C

    rra                                           ; $6D4F: $1F
    rra                                           ; $6D50: $1F
    rra                                           ; $6D51: $1F
    and  $03                                      ; $6D52: $E6 $03
    ld   e, a                                     ; $6D54: $5F
    ld   d, b                                     ; $6D55: $50
    ld   hl, Data_015_6D3C                        ; $6D56: $21 $3C $6D
    add  hl, de                                   ; $6D59: $19
    ld   a, [hl]                                  ; $6D5A: $7E
    jp   SetEntitySpriteVariant                   ; $6D5B: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown055SpriteVariants::
.variant0
    db $1E, $00
    db $1E, $60
.variant1
    db $34, $00
    db $34, $20
.variant2
    db $54, $00
    db $54, $20
.variant3
    db $56, $00
    db $56, $20

label_015_6D6E:
    ldh  a, [hFrameCounter]                       ; $6D6E: $F0 $E7
    rla                                           ; $6D70: $17
    rla                                           ; $6D71: $17
    and  OAMF_PAL1                                ; $6D72: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $6D74: $E0 $ED
    ld   de, Unknown055SpriteVariants             ; $6D76: $11 $5E $6D
    call RenderActiveEntitySpritesPair            ; $6D79: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $6D7C: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6D7F: $F0 $F0

.jr_6D81
    JP_TABLE                                      ; $6D81
._00 dw func_015_6D86                             ; $6D82
._01 dw func_015_6D9C                             ; $6D84

func_015_6D86::
    call GetEntityTransitionCountdown             ; $6D86: $CD $05 $0C
    jr   nz, .jr_6D90                             ; $6D89: $20 $05

    ld   [hl], $20                                ; $6D8B: $36 $20
    jp   IncrementEntityState                     ; $6D8D: $C3 $12 $3B

.jr_6D90
    ld   e, $00                                   ; $6D90: $1E $00
    cp   $18                                      ; $6D92: $FE $18
    jr   nc, .jr_6D98                             ; $6D94: $30 $02

    ld   e, $01                                   ; $6D96: $1E $01

.jr_6D98
    ld   a, e                                     ; $6D98: $7B
    jp   SetEntitySpriteVariant                   ; $6D99: $C3 $0C $3B

func_015_6D9C::
    ldh  a, [hFrameCounter]                       ; $6D9C: $F0 $E7
    rra                                           ; $6D9E: $1F
    rra                                           ; $6D9F: $1F
    rra                                           ; $6DA0: $1F
    and  $01                                      ; $6DA1: $E6 $01
    add  $02                                      ; $6DA3: $C6 $02
    call SetEntitySpriteVariant                   ; $6DA5: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DA8: $CD $05 $0C
    cp   $01                                      ; $6DAB: $FE $01
    jr   nz, .jr_6DB8                             ; $6DAD: $20 $09

    ld   a, NOISE_SFX_GENIE_FIREBALL              ; $6DAF: $3E $28
    ldh  [hNoiseSfx], a                           ; $6DB1: $E0 $F4
    ld   a, $30                                   ; $6DB3: $3E $30
    call ApplyVectorTowardsLink_trampoline        ; $6DB5: $CD $AA $3B

.jr_6DB8
    ldh  a, [hFrameCounter]                       ; $6DB8: $F0 $E7
    xor  c                                        ; $6DBA: $A9

.jr_6DBB
    rra                                           ; $6DBB: $1F
    jr   nc, jr_015_6DC4                          ; $6DBC: $30 $06

    call UpdateEntityPosWithSpeed_15              ; $6DBE: $CD $88 $7B

.jr_6DC1
    call label_3B44                               ; $6DC1: $CD $44 $3B

jr_015_6DC4:
    ldh  a, [hActiveEntityPosX]                   ; $6DC4: $F0 $EE
    cp   $A8                                      ; $6DC6: $FE $A8
    jp   nc, ClearEntityStatus_15                 ; $6DC8: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $6DCB: $F0 $EC
    cp   $88                                      ; $6DCD: $FE $88
    jp   nc, ClearEntityStatus_15                 ; $6DCF: $D2 $31 $7C

    ret                                           ; $6DD2: $C9

Data_015_6DD3::
    db   $01, $02, $03, $03, $03, $03, $02, $01

Data_015_6DDB::
    db   $20, $23, $26, $29, $2C, $2F, $32, $35, $38, $38, $38, $38, $38, $38, $38, $38
    db   $38, $38, $38, $38, $38, $38, $38, $38

Data_015_6DF3::
    db   $20, $23, $26, $29, $2C, $2F, $32, $34, $34, $34, $34, $34, $34, $34, $34, $34
    db   $34, $34, $34, $34, $34, $34, $34, $34

Data_015_6E0B::
    db   $28, $27, $26, $25, $24, $23, $22, $21, $20, $1F, $1E, $1D, $1C, $1B, $1A, $19
    db   $18, $18, $18, $18, $18, $18, $18, $18

Data_015_6E23::
    db   $03, $02, $01, $00, $00, $00, $00, $00

FinalNightmareForm6Handler::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6E2B: $21 $00 $C3
    add  hl, bc                                   ; $6E2E: $09
    ld   a, [hl]                                  ; $6E2F: $7E
    and  a                                        ; $6E30: $A7
    jr   z, jr_015_6E4E                           ; $6E31: $28 $1B

    cp   $10                                      ; $6E33: $FE $10

.jr_6E35
    jr   nz, jr_015_6E3D                          ; $6E35: $20 $06

.jr_6E37
    dec  [hl]                                     ; $6E37: $35
    call func_015_52B1                            ; $6E38: $CD $B1 $52

.jr_6E3B
    ld   a, $10                                   ; $6E3B: $3E $10

jr_015_6E3D:
    rra                                           ; $6E3D: $1F
    rra                                           ; $6E3E: $1F
    rra                                           ; $6E3F: $1F
    and  $07                                      ; $6E40: $E6 $07
    ld   e, a                                     ; $6E42: $5F
    ld   d, b                                     ; $6E43: $50
    ld   hl, Data_015_6E23                        ; $6E44: $21 $23 $6E
    add  hl, de                                   ; $6E47: $19
    ld   a, [hl]                                  ; $6E48: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $6E49: $E0 $F1
    jp   func_015_572B                            ; $6E4B: $C3 $2B $57

jr_015_6E4E:
    call func_015_7056                            ; $6E4E: $CD $56 $70
IF !__PATCH_0__
    ldh  a, [hActiveEntityState]                  ; $6E51: $F0 $F0
    and  a                                        ; $6E53: $A7
    jr   z, .jr_6E5A                              ; $6E54: $28 $04

    xor  a                                        ; $6E56: $AF
    ld   [wSubtractHealthBuffer], a               ; $6E57: $EA $94 $DB
ENDC

.jr_6E5A
    call ReturnIfNonInteractive_15                ; $6E5A: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $6E5D: $F0 $F0
    JP_TABLE                                      ; $6E5F
._00 dw func_015_6E66                             ; $6E60
._01 dw func_015_6FA1                             ; $6E62
._02 dw func_015_6FBC                             ; $6E64

; After a boss is defeated??? Scream and defeated boss' dialog
func_015_6E66::
    ld   hl, wEntitiesHealthTable                 ; $6E66: $21 $60 $C3
    add  hl, bc                                   ; $6E69: $09
    ld   a, [hl]                                  ; $6E6A: $7E
    cp   $F0                                      ; $6E6B: $FE $F0
    jr   nc, .jr_6E9B                             ; $6E6D: $30 $2C

    ld   a, $03                                   ; $6E6F: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $6E71: $EA $A7 $C5
    call_open_dialog Dialog0F6                    ; $6E74
    ld   a, MUSIC_BOSS_DEFEAT                     ; $6E79: $3E $5E
    ld   [wMusicTrackToPlay], a                   ; $6E7B: $EA $68 $D3
    call GetEntityTransitionCountdown             ; $6E7E: $CD $05 $0C
    ld   [hl], $80                                ; $6E81: $36 $80
    ld   hl, wEntitiesFlashCountdownTable         ; $6E83: $21 $20 $C4
    add  hl, bc                                   ; $6E86: $09
    ld   [hl], $80                                ; $6E87: $36 $80
    ld   hl, wEntitiesHitboxFlagsTable            ; $6E89: $21 $50 $C3
    add  hl, bc                                   ; $6E8C: $09
    res  7, [hl]                                  ; $6E8D: $CB $BE
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6E8F: $21 $40 $C3
    add  hl, bc                                   ; $6E92: $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $6E93: $CB $F6
    call label_27F2                               ; $6E95: $CD $F2 $27
    jp   IncrementEntityState                     ; $6E98: $C3 $12 $3B

; Miniboss initalization???
.jr_6E9B
    ldh  a, [hFrameCounter]                       ; $6E9B: $F0 $E7
    and  $0F                                      ; $6E9D: $E6 $0F
    jr   nz, .jr_6EB5                             ; $6E9F: $20 $14

    ld   a, [wD223]                               ; $6EA1: $FA $23 $D2
    cp   $04                                      ; $6EA4: $FE $04
    jr   nc, .jr_6EB5                             ; $6EA6: $30 $0D

    inc  a                                        ; $6EA8: $3C
    ld   [wD223], a                               ; $6EA9: $EA $23 $D2
    cp   $01                                      ; $6EAC: $FE $01
    jr   nz, .jr_6EB5                             ; $6EAE: $20 $05

    ld   hl, wMusicTrackToPlay                    ; $6EB0: $21 $68 $D3
    ld   [hl], MUSIC_MINIBOSS                     ; $6EB3: $36 $50

.jr_6EB5
    call DecrementEntityIgnoreHitsCountdown       ; $6EB5: $CD $56 $0C
    ld   hl, wEntitiesHealthTable                 ; $6EB8: $21 $60 $C3
    add  hl, bc                                   ; $6EBB: $09
    ld   a, [hl]                                  ; $6EBC: $7E
    cpl                                           ; $6EBD: $2F
    cp   $17                                      ; $6EBE: $FE $17
    jr   c, .jr_6EC4                              ; $6EC0: $38 $02

    ld   a, $17                                   ; $6EC2: $3E $17

.jr_6EC4
    ld   e, a                                     ; $6EC4: $5F
    ld   d, b                                     ; $6EC5: $50
    ld   hl, Data_015_6DDB                        ; $6EC6: $21 $DB $6D
    add  hl, de                                   ; $6EC9: $19
    ld   a, [hl]                                  ; $6ECA: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6ECB: $21 $B0 $C2
    add  hl, bc                                   ; $6ECE: $09
    ld   [hl], a                                  ; $6ECF: $77
    ld   hl, Data_015_6DF3                        ; $6ED0: $21 $F3 $6D
    add  hl, de                                   ; $6ED3: $19
    ld   a, [hl]                                  ; $6ED4: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $6ED5: $21 $C0 $C2
    add  hl, bc                                   ; $6ED8: $09
    ld   [hl], a                                  ; $6ED9: $77
    ld   hl, Data_015_6E0B                        ; $6EDA: $21 $0B $6E
    add  hl, de                                   ; $6EDD: $19
    ld   a, [wD210]                               ; $6EDE: $FA $10 $D2
    inc  a                                        ; $6EE1: $3C
    cp   [hl]                                     ; $6EE2: $BE
    jr   c, .jr_6EEA                              ; $6EE3: $38 $05

    ld   a, JINGLE_DETHI_HANDS                    ; $6EE5: $3E $3D
    ldh  [hJingle], a                             ; $6EE7: $E0 $F2
    xor  a                                        ; $6EE9: $AF

.jr_6EEA
    ld   [wD210], a                               ; $6EEA: $EA $10 $D2
    ld   a, $00                                   ; $6EED: $3E $00
    call SetEntitySpriteVariant                   ; $6EEF: $CD $0C $3B
    call GetEntityDropTimer                       ; $6EF2: $CD $FB $0B
    jr   nz, .jr_6F0B                             ; $6EF5: $20 $14

    call GetRandomByte                            ; $6EF7: $CD $0D $28
    and  $0F                                      ; $6EFA: $E6 $0F
    add  $20                                      ; $6EFC: $C6 $20
    ld   [hl], a                                  ; $6EFE: $77
    call GetRandomByte                            ; $6EFF: $CD $0D $28
    and  $01                                      ; $6F02: $E6 $01
    jr   nz, .jr_6F0B                             ; $6F04: $20 $05

    call GetEntityPrivateCountdown1               ; $6F06: $CD $00 $0C
    ld   [hl], $7F                                ; $6F09: $36 $7F

.jr_6F0B
    ld   hl, wEntitiesHitboxFlagsTable            ; $6F0B: $21 $50 $C3
    add  hl, bc                                   ; $6F0E: $09
    set  7, [hl]                                  ; $6F0F: $CB $FE
    call GetEntityPrivateCountdown1               ; $6F11: $CD $00 $0C
    jr   z, .jr_6F30                              ; $6F14: $28 $1A

    rra                                           ; $6F16: $1F
    rra                                           ; $6F17: $1F
    rra                                           ; $6F18: $1F
    rra                                           ; $6F19: $1F
    and  $07                                      ; $6F1A: $E6 $07
    ld   e, a                                     ; $6F1C: $5F
    ld   d, b                                     ; $6F1D: $50
    ld   hl, Data_015_6DD3                        ; $6F1E: $21 $D3 $6D
    add  hl, de                                   ; $6F21: $19
    ld   a, [hl]                                  ; $6F22: $7E
    call SetEntitySpriteVariant                   ; $6F23: $CD $0C $3B
    cp   $03                                      ; $6F26: $FE $03
    jr   nz, .jr_6F30                             ; $6F28: $20 $06

    ld   hl, wEntitiesHitboxFlagsTable            ; $6F2A: $21 $50 $C3
    add  hl, bc                                   ; $6F2D: $09
    res  7, [hl]                                  ; $6F2E: $CB $BE

.jr_6F30
    call label_3B39                               ; $6F30: $CD $39 $3B
    ld   e, $0F                                   ; $6F33: $1E $0F
    ld   hl, wEntitiesHealthTable                 ; $6F35: $21 $60 $C3
    add  hl, bc                                   ; $6F38: $09
    ld   a, [hl]                                  ; $6F39: $7E
    cp   $F8                                      ; $6F3A: $FE $F8
    jr   nc, .jr_6F40                             ; $6F3C: $30 $02

    ld   e, $07                                   ; $6F3E: $1E $07

.jr_6F40
    ldh  a, [hFrameCounter]                       ; $6F40: $F0 $E7
    and  e                                        ; $6F42: $A3
    jr   nz, jr_015_6F70                          ; $6F43: $20 $2B

    ldh  a, [hLinkPositionY]                      ; $6F45: $F0 $99
    push af                                       ; $6F47: $F5
    sub  $20                                      ; $6F48: $D6 $20
    ldh  [hLinkPositionY], a                      ; $6F4A: $E0 $99
    ld   a, $08                                   ; $6F4C: $3E $08
    call GetVectorTowardsLink_trampoline          ; $6F4E: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6F51: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $6F53: $21 $50 $C2
    add  hl, bc                                   ; $6F56: $09
    sub  [hl]                                     ; $6F57: $96
    and  $80                                      ; $6F58: $E6 $80
    jr   nz, .jr_6F5E                             ; $6F5A: $20 $02

    inc  [hl]                                     ; $6F5C: $34
    inc  [hl]                                     ; $6F5D: $34

.jr_6F5E
    dec  [hl]                                     ; $6F5E: $35
    ldh  a, [hMultiPurpose1]                      ; $6F5F: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $6F61: $21 $40 $C2
    add  hl, bc                                   ; $6F64: $09
    sub  [hl]                                     ; $6F65: $96
    and  $80                                      ; $6F66: $E6 $80
    jr   nz, .jr_6F6C                             ; $6F68: $20 $02

    inc  [hl]                                     ; $6F6A: $34
    inc  [hl]                                     ; $6F6B: $34

.jr_6F6C
    dec  [hl]                                     ; $6F6C: $35
    pop  af                                       ; $6F6D: $F1
    ldh  [hLinkPositionY], a                      ; $6F6E: $E0 $99

jr_015_6F70:
    call UpdateEntityPosWithSpeed_15              ; $6F70: $CD $88 $7B
    call label_3B23                               ; $6F73: $CD $23 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $6F76: $21 $B0 $C2
    add  hl, bc                                   ; $6F79: $09
    ld   e, [hl]                                  ; $6F7A: $5E
    ld   hl, wEntitiesInertiaTable                ; $6F7B: $21 $D0 $C3
    add  hl, bc                                   ; $6F7E: $09
    ld   a, [hl]                                  ; $6F7F: $7E
    add  e                                        ; $6F80: $83
    ld   [hl], a                                  ; $6F81: $77
    jr   nc, .jr_6F8B                             ; $6F82: $30 $07

    ld   a, [wD221]                               ; $6F84: $FA $21 $D2
    inc  a                                        ; $6F87: $3C
    ld   [wD221], a                               ; $6F88: $EA $21 $D2

.jr_6F8B
    ld   hl, wEntitiesPrivateState2Table          ; $6F8B: $21 $C0 $C2
    add  hl, bc                                   ; $6F8E: $09
    ld   e, [hl]                                  ; $6F8F: $5E
    ld   hl, wEntitiesPrivateState3Table          ; $6F90: $21 $D0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    add  e                                        ; $6F95: $83
    ld   [hl], a                                  ; $6F96: $77
    jr   nc, .ret_6FA0                            ; $6F97: $30 $07

    ld   a, [wD222]                               ; $6F99: $FA $22 $D2
    dec  a                                        ; $6F9C: $3D
    ld   [wD222], a                               ; $6F9D: $EA $22 $D2

.ret_6FA0
    ret                                           ; $6FA0: $C9

func_015_6FA1::
    call GetEntityTransitionCountdown             ; $6FA1: $CD $05 $0C
    cp   $02                                      ; $6FA4: $FE $02
    jr   nz, .jr_6FAD                             ; $6FA6: $20 $05

    ld   hl, wMusicTrackToPlay                    ; $6FA8: $21 $68 $D3
    ld   [hl], MUSIC_FINAL_BOSS_DEFEAT            ; $6FAB: $36 $5F

.jr_6FAD
    and  a                                        ; $6FAD: $A7
    ret  nz                                       ; $6FAE: $C0

    ld   [hl], $80                                ; $6FAF: $36 $80
    ld   a, NOISE_SFX_FINAL_BOSS_EXPLOSION        ; $6FB1: $3E $3D
    ldh  [hNoiseSfx], a                           ; $6FB3: $E0 $F4
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ; $6FB5: $3E $10
    ldh  [hWaveSfx], a                            ; $6FB7: $E0 $F3
    jp   IncrementEntityState                     ; $6FB9: $C3 $12 $3B

func_015_6FBC::
    call GetEntityTransitionCountdown             ; $6FBC: $CD $05 $0C
    and  $0F                                      ; $6FBF: $E6 $0F
    jr   nz, ret_015_6FF5                         ; $6FC1: $20 $32

    ld   a, [wD223]                               ; $6FC3: $FA $23 $D2
    cp   $00                                      ; $6FC6: $FE $00
    jr   nz, .jr_6FF1                             ; $6FC8: $20 $27

    call PlayBombExplosionSfx                     ; $6FCA: $CD $4B $0C
    call func_015_5383                            ; $6FCD: $CD $83 $53
    call ClearEntityStatus_15                     ; $6FD0: $CD $31 $7C
    ld   a, ENTITY_FINAL_NIGHTMARE                ; $6FD3: $3E $E6
    call SpawnNewEntity_trampoline                ; $6FD5: $CD $86 $3B
    ld   hl, wEntitiesPrivateState5Table          ; $6FD8: $21 $90 $C3
    add  hl, de                                   ; $6FDB: $19
    ld   [hl], $02                                ; $6FDC: $36 $02
    ld   hl, wEntitiesPosYTable                   ; $6FDE: $21 $10 $C2
    add  hl, de                                   ; $6FE1: $19
    ld   [hl], $30                                ; $6FE2: $36 $30
    ld   hl, wEntitiesPosXTable                   ; $6FE4: $21 $00 $C2
    add  hl, de                                   ; $6FE7: $19
    ld   [hl], $50                                ; $6FE8: $36 $50
    ld   hl, wEntitiesSpriteVariantTable          ; $6FEA: $21 $B0 $C3
    add  hl, de                                   ; $6FED: $19
    ld   [hl], $FF                                ; $6FEE: $36 $FF
    ret                                           ; $6FF0: $C9

.jr_6FF1
    dec  a                                        ; $6FF1: $3D
    ld   [wD223], a                               ; $6FF2: $EA $23 $D2

ret_015_6FF5:
    ret                                           ; $6FF5: $C9

Data_015_6FF6::
    db   $F0, $FC, $60, $00, $F0, $04, $62, $00, $F0, $0C, $60, $20, $F0, $FC, $64, $00
    db   $F0, $04, $66, $00, $F0, $0C, $64, $20, $F0, $FC, $68, $00, $F0, $04, $6A, $00
    db   $F0, $0C, $68, $20, $F0, $FC, $64, $00, $F0, $04, $66, $00, $F0, $0C, $64, $20

Data_015_7026::
    db   $00, $FC, $6C, $00, $00, $04, $6E, $00, $00, $0C, $6C, $20, $00, $FC, $70, $00
    db   $00, $04, $72, $00, $00, $0C, $70, $20, $00, $FC, $74, $00, $00, $04, $76, $00
    db   $00, $0C, $74, $20, $00, $FC, $78, $00, $00, $04, $7A, $00, $00, $0C, $78, $20

func_015_7056::
    ldh  a, [hFrameCounter]                       ; $7056: $F0 $E7
    rra                                           ; $7058: $1F
    rra                                           ; $7059: $1F
    rra                                           ; $705A: $1F
    and  $03                                      ; $705B: $E6 $03
    rla                                           ; $705D: $17
    rla                                           ; $705E: $17
    and  $FC                                      ; $705F: $E6 $FC
    ld   e, a                                     ; $7061: $5F
    rla                                           ; $7062: $17
    and  $F8                                      ; $7063: $E6 $F8
    add  e                                        ; $7065: $83
    ld   e, a                                     ; $7066: $5F
    ld   d, b                                     ; $7067: $50
    ld   hl, Data_015_6FF6                        ; $7068: $21 $F6 $6F
    add  hl, de                                   ; $706B: $19
    ld   c, $03                                   ; $706C: $0E $03
    call RenderActiveEntitySpritesRect            ; $706E: $CD $E6 $3C
    ld   a, $03                                   ; $7071: $3E $03
    call func_015_7964_trampoline                 ; $7073: $CD $A0 $3D
    ldh  a, [hActiveEntitySpriteVariant]          ; $7076: $F0 $F1
    rla                                           ; $7078: $17
    rla                                           ; $7079: $17
    and  $FC                                      ; $707A: $E6 $FC
    ld   e, a                                     ; $707C: $5F
    rla                                           ; $707D: $17
    and  $F8                                      ; $707E: $E6 $F8
    add  e                                        ; $7080: $83
    ld   e, a                                     ; $7081: $5F
    ld   d, b                                     ; $7082: $50
    ld   hl, Data_015_7026                        ; $7083: $21 $26 $70
    add  hl, de                                   ; $7086: $19
    ld   c, $03                                   ; $7087: $0E $03
    call RenderActiveEntitySpritesRect            ; $7089: $CD $E6 $3C
    ld   a, $03                                   ; $708C: $3E $03
    call func_015_7964_trampoline                 ; $708E: $CD $A0 $3D
    ld   hl, wEntitiesPosYTable                   ; $7091: $21 $10 $C2
    add  hl, bc                                   ; $7094: $09
    ld   a, [hl]                                  ; $7095: $7E
    push af                                       ; $7096: $F5
    push hl                                       ; $7097: $E5
    sub  $08                                      ; $7098: $D6 $08
    ld   [hl], a                                  ; $709A: $77
    call CopyEntityPositionToActivePosition       ; $709B: $CD $8A $3D
    call func_015_717B                            ; $709E: $CD $7B $71
    pop  hl                                       ; $70A1: $E1
    pop  af                                       ; $70A2: $F1
    ld   [hl], a                                  ; $70A3: $77
    jp   CopyEntityPositionToActivePosition       ; $70A4: $C3 $8A $3D

Data_015_70A7::
    db   $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7

Data_015_70AF::
    db   $00, $09, $12, $1A, $21, $27, $2C, $2F, $30, $2F, $2C, $27, $21, $1A, $12, $09
    db   $00, $F7, $EE, $E6, $DF, $D9, $D4, $D1, $D0, $D1, $D4, $D9, $DF, $E6, $EE, $F7

Data_015_70CF::
    db   $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9

Data_015_70D7::
    db   $00, $07, $0E, $15, $1A, $1F, $23, $25, $26, $25, $23, $1F, $1A, $15, $0E, $07
    db   $00, $F9, $F2, $EB, $E6, $E1, $DD, $DB, $DA, $DB, $DD, $E1, $E6, $EB, $F2, $F9

Data_015_70F7::
    db   $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB

Data_015_70FF::
    db   $00, $05, $0A, $0F, $13, $17, $19, $1B, $1C, $1B, $19, $17, $13, $0F, $0A, $05
    db   $00, $FB, $F6, $F1, $ED, $E9, $E7, $E5, $E4, $E5, $E7, $E9, $ED, $F1, $F6, $FB

Data_015_711F::
    db   $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD

Data_015_7127::
    db   $00, $03, $06, $0A, $0C, $0E, $10, $11, $12, $11, $10, $0E, $0C, $0A, $06, $03
    db   $00, $FD, $FA, $F6, $F4, $F2, $F0, $EF, $EE, $EF, $F0, $F2, $F4, $F6, $FA, $FD
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF, $00, $01, $03, $04, $05, $05, $06, $07
    db   $08, $07, $06, $05, $05, $04, $03, $01, $00, $FF, $FD, $FC, $FB, $FB, $FA, $F9
    db   $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FF

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown056SpriteVariants::
.variant0
    db $4E, $00
    db $4E, $20
.variant1
    db $4C, $00
    db $4C, $20
.variant2
    db $7C, $02
    db $7C, $22

func_015_717B::
    ld   a, [wD223]                               ; $717B: $FA $23 $D2
    cp   $04                                      ; $717E: $FE $04
    jr   c, .jr_71A0                              ; $7180: $38 $1E

    ld   a, [wD221]                               ; $7182: $FA $21 $D2
    and  $1F                                      ; $7185: $E6 $1F
    ld   e, a                                     ; $7187: $5F
    ld   d, b                                     ; $7188: $50
    ld   hl, Data_015_70AF                        ; $7189: $21 $AF $70
    add  hl, de                                   ; $718C: $19
    ldh  a, [hActiveEntityPosX]                   ; $718D: $F0 $EE
    add  [hl]                                     ; $718F: $86
    ldh  [hActiveEntityPosX], a                   ; $7190: $E0 $EE
    ld   hl, Data_015_70A7                        ; $7192: $21 $A7 $70
    add  hl, de                                   ; $7195: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7196: $F0 $EC
    add  [hl]                                     ; $7198: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7199: $E0 $EC
    ld   a, $02                                   ; $719B: $3E $02
    call func_015_72CF                            ; $719D: $CD $CF $72

.jr_71A0
    ld   a, [wD223]                               ; $71A0: $FA $23 $D2
    cp   $03                                      ; $71A3: $FE $03
    jr   c, jr_015_71C5                           ; $71A5: $38 $1E

    ld   a, [wD221]                               ; $71A7: $FA $21 $D2
    and  $1F                                      ; $71AA: $E6 $1F
    ld   e, a                                     ; $71AC: $5F
    ld   d, b                                     ; $71AD: $50
    ld   hl, Data_015_70D7                        ; $71AE: $21 $D7 $70
    add  hl, de                                   ; $71B1: $19
    ldh  a, [hActiveEntityPosX]                   ; $71B2: $F0 $EE
    add  [hl]                                     ; $71B4: $86
    ldh  [hActiveEntityPosX], a                   ; $71B5: $E0 $EE
    ld   hl, Data_015_70CF                        ; $71B7: $21 $CF $70
    add  hl, de                                   ; $71BA: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $71BB: $F0 $EC
    add  [hl]                                     ; $71BD: $86
    ldh  [hActiveEntityVisualPosY], a             ; $71BE: $E0 $EC

.jr_71C0
    ld   a, $01                                   ; $71C0: $3E $01
    call func_015_72CF                            ; $71C2: $CD $CF $72

jr_015_71C5:
    ld   a, [wD223]                               ; $71C5: $FA $23 $D2
    cp   $02                                      ; $71C8: $FE $02
    jr   c, .jr_71EA                              ; $71CA: $38 $1E

    ld   a, [wD221]                               ; $71CC: $FA $21 $D2
    and  $1F                                      ; $71CF: $E6 $1F
    ld   e, a                                     ; $71D1: $5F
    ld   d, b                                     ; $71D2: $50
    ld   hl, Data_015_70FF                        ; $71D3: $21 $FF $70
    add  hl, de                                   ; $71D6: $19
    ldh  a, [hActiveEntityPosX]                   ; $71D7: $F0 $EE
    add  [hl]                                     ; $71D9: $86
    ldh  [hActiveEntityPosX], a                   ; $71DA: $E0 $EE
    ld   hl, Data_015_70F7                        ; $71DC: $21 $F7 $70
    add  hl, de                                   ; $71DF: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $71E0: $F0 $EC
    add  [hl]                                     ; $71E2: $86
    ldh  [hActiveEntityVisualPosY], a             ; $71E3: $E0 $EC
    ld   a, $01                                   ; $71E5: $3E $01
    call func_015_72CF                            ; $71E7: $CD $CF $72

.jr_71EA
    ld   a, [wD223]                               ; $71EA: $FA $23 $D2
    cp   $01                                      ; $71ED: $FE $01
    jr   c, jr_015_7226                           ; $71EF: $38 $35

    ld   a, [wD221]                               ; $71F1: $FA $21 $D2

.jr_71F4
    and  $0F                                      ; $71F4: $E6 $0F
    cp   $07                                      ; $71F6: $FE $07
    jr   z, .jr_7202                              ; $71F8: $28 $08

    cp   $08                                      ; $71FA: $FE $08
    jr   z, .jr_7202                              ; $71FC: $28 $04

    cp   $09                                      ; $71FE: $FE $09
    jr   nz, jr_015_7208                          ; $7200: $20 $06

.jr_7202
    ldh  a, [hFrameCounter]                       ; $7202: $F0 $E7
    and  $01                                      ; $7204: $E6 $01
    jr   nz, jr_015_7226                          ; $7206: $20 $1E

jr_015_7208:
    ld   a, [wD221]                               ; $7208: $FA $21 $D2
    and  $1F                                      ; $720B: $E6 $1F
    ld   e, a                                     ; $720D: $5F
    ld   d, b                                     ; $720E: $50
    ld   hl, Data_015_7127                        ; $720F: $21 $27 $71
    add  hl, de                                   ; $7212: $19
    ldh  a, [hActiveEntityPosX]                   ; $7213: $F0 $EE
    add  [hl]                                     ; $7215: $86
    ldh  [hActiveEntityPosX], a                   ; $7216: $E0 $EE
    ld   hl, Data_015_711F                        ; $7218: $21 $1F $71
    add  hl, de                                   ; $721B: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $721C: $F0 $EC
    add  [hl]                                     ; $721E: $86
    ldh  [hActiveEntityVisualPosY], a             ; $721F: $E0 $EC
    ld   a, $00                                   ; $7221: $3E $00
    call func_015_72CF                            ; $7223: $CD $CF $72

jr_015_7226:
    ld   a, [wD223]                               ; $7226: $FA $23 $D2
    cp   $04                                      ; $7229: $FE $04
    jr   c, .jr_724B                              ; $722B: $38 $1E

    ld   a, [wD222]                               ; $722D: $FA $22 $D2
    and  $1F                                      ; $7230: $E6 $1F
    ld   e, a                                     ; $7232: $5F
    ld   d, b                                     ; $7233: $50
    ld   hl, Data_015_70AF                        ; $7234: $21 $AF $70
    add  hl, de                                   ; $7237: $19
    ldh  a, [hActiveEntityPosX]                   ; $7238: $F0 $EE
    add  [hl]                                     ; $723A: $86
    ldh  [hActiveEntityPosX], a                   ; $723B: $E0 $EE
    ld   hl, Data_015_70A7                        ; $723D: $21 $A7 $70
    add  hl, de                                   ; $7240: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7241: $F0 $EC
    add  [hl]                                     ; $7243: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7244: $E0 $EC
    ld   a, $02                                   ; $7246: $3E $02
    call func_015_72CF                            ; $7248: $CD $CF $72

.jr_724B
    ld   a, [wD223]                               ; $724B: $FA $23 $D2
    cp   $03                                      ; $724E: $FE $03
    jr   c, .jr_7270                              ; $7250: $38 $1E

    ld   a, [wD222]                               ; $7252: $FA $22 $D2
    and  $1F                                      ; $7255: $E6 $1F
    ld   e, a                                     ; $7257: $5F
    ld   d, b                                     ; $7258: $50
    ld   hl, Data_015_70D7                        ; $7259: $21 $D7 $70
    add  hl, de                                   ; $725C: $19
    ldh  a, [hActiveEntityPosX]                   ; $725D: $F0 $EE
    add  [hl]                                     ; $725F: $86
    ldh  [hActiveEntityPosX], a                   ; $7260: $E0 $EE
    ld   hl, Data_015_70CF                        ; $7262: $21 $CF $70
    add  hl, de                                   ; $7265: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7266: $F0 $EC
    add  [hl]                                     ; $7268: $86
    ldh  [hActiveEntityVisualPosY], a             ; $7269: $E0 $EC
    ld   a, $01                                   ; $726B: $3E $01
    call func_015_72CF                            ; $726D: $CD $CF $72

.jr_7270
    ld   a, [wD223]                               ; $7270: $FA $23 $D2
    cp   $02                                      ; $7273: $FE $02
    jr   c, .jr_7295                              ; $7275: $38 $1E

    ld   a, [wD222]                               ; $7277: $FA $22 $D2
    and  $1F                                      ; $727A: $E6 $1F
    ld   e, a                                     ; $727C: $5F
    ld   d, b                                     ; $727D: $50
    ld   hl, Data_015_70FF                        ; $727E: $21 $FF $70
    add  hl, de                                   ; $7281: $19
    ldh  a, [hActiveEntityPosX]                   ; $7282: $F0 $EE
    add  [hl]                                     ; $7284: $86
    ldh  [hActiveEntityPosX], a                   ; $7285: $E0 $EE
    ld   hl, Data_015_70F7                        ; $7287: $21 $F7 $70
    add  hl, de                                   ; $728A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $728B: $F0 $EC
    add  [hl]                                     ; $728D: $86
    ldh  [hActiveEntityVisualPosY], a             ; $728E: $E0 $EC
    ld   a, $01                                   ; $7290: $3E $01
    call func_015_72CF                            ; $7292: $CD $CF $72

.jr_7295
    ld   a, [wD223]                               ; $7295: $FA $23 $D2
    cp   $01                                      ; $7298: $FE $01
    ret  c                                        ; $729A: $D8

    ld   a, [wD222]                               ; $729B: $FA $22 $D2
    and  $0F                                      ; $729E: $E6 $0F
    cp   $07                                      ; $72A0: $FE $07
    jr   z, .jr_72AC                              ; $72A2: $28 $08

    cp   $08                                      ; $72A4: $FE $08
    jr   z, .jr_72AC                              ; $72A6: $28 $04

    cp   $09                                      ; $72A8: $FE $09
    jr   nz, jr_015_72B1                          ; $72AA: $20 $05

.jr_72AC
    ldh  a, [hFrameCounter]                       ; $72AC: $F0 $E7
    and  $01                                      ; $72AE: $E6 $01
    ret  z                                        ; $72B0: $C8

jr_015_72B1:
    ld   a, [wD222]                               ; $72B1: $FA $22 $D2
    and  $1F                                      ; $72B4: $E6 $1F
    ld   e, a                                     ; $72B6: $5F
    ld   d, b                                     ; $72B7: $50
    ld   hl, Data_015_7127                        ; $72B8: $21 $27 $71
    add  hl, de                                   ; $72BB: $19
    ldh  a, [hActiveEntityPosX]                   ; $72BC: $F0 $EE
    add  [hl]                                     ; $72BE: $86
    ldh  [hActiveEntityPosX], a                   ; $72BF: $E0 $EE
    ld   hl, Data_015_711F                        ; $72C1: $21 $1F $71
    add  hl, de                                   ; $72C4: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $72C5: $F0 $EC
    add  [hl]                                     ; $72C7: $86
    ldh  [hActiveEntityVisualPosY], a             ; $72C8: $E0 $EC
    ld   a, $00                                   ; $72CA: $3E $00
    jp   func_015_72CF                            ; $72CC: $C3 $CF $72

func_015_72CF::
    ldh  [hActiveEntitySpriteVariant], a          ; $72CF: $E0 $F1
    ld   de, Unknown056SpriteVariants             ; $72D1: $11 $6F $71
    call RenderActiveEntitySpritesPair            ; $72D4: $CD $C0 $3B
    ld   a, $02                                   ; $72D7: $3E $02
    call func_015_7964_trampoline                 ; $72D9: $CD $A0 $3D

IF __PATCH_0__
    ldh  a, [hActiveEntityState]
    and  a
    jr   nz, .jr_731D
ENDC

    ld   hl, hLinkPositionX                       ; $72DC: $21 $98 $FF
    ldh  a, [hActiveEntityPosX]                   ; $72DF: $F0 $EE
    sub  [hl]                                     ; $72E1: $96
    add  $08                                      ; $72E2: $C6 $08
    cp   $10                                      ; $72E4: $FE $10
    jr   nc, .jr_731D                             ; $72E6: $30 $35

    ld   hl, hLinkPositionY                       ; $72E8: $21 $99 $FF
    ldh  a, [hActiveEntityVisualPosY]             ; $72EB: $F0 $EC
    sub  [hl]                                     ; $72ED: $96
    add  $08                                      ; $72EE: $C6 $08
    cp   $10                                      ; $72F0: $FE $10
    jr   nc, .jr_731D                             ; $72F2: $30 $29

    ld   hl, wIsLinkInTheAir                      ; $72F4: $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ; $72F7: $FA $C7 $DB
    or   [hl]                                     ; $72FA: $B6
    jr   nz, .jr_731D                             ; $72FB: $20 $20

    ld   a, $08                                   ; $72FD: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $72FF: $EA $94 $DB
    ld   a, $20                                   ; $7302: $3E $20
    call GetVectorTowardsLink_trampoline          ; $7304: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7307: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $7309: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $730B: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $730D: $E0 $9A
    ld   a, $10                                   ; $730F: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7311: $EA $3E $C1
    ld   a, $30                                   ; $7314: $3E $30
    ld   [wInvincibilityCounter], a               ; $7316: $EA $C7 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ; $7319: $3E $03
    ldh  [hWaveSfx], a                            ; $731B: $E0 $F3

.jr_731D
    jp   CopyEntityPositionToActivePosition       ; $731D: $C3 $8A $3D
