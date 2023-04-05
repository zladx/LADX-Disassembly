EntityInitHotHead::
    call GetEntityTransitionCountdown             ; $6302: $CD $05 $0C
    ld   [hl], $40                                ; $6305: $36 $40
    ld   hl, wEntitiesSpriteVariantTable          ; $6307: $21 $B0 $C3
    add  hl, bc                                   ; $630A: $09
    ld   [hl], $FF                                ; $630B: $36 $FF
    ld   hl, wEntitiesHealthTable                 ; $630D: $21 $60 $C3
    add  hl, bc                                   ; $6310: $09
    ld   [hl], $FF                                ; $6311: $36 $FF
    ret

HotHeadEntityHandler::
    call label_394D                               ; $6314: $CD $4D $39
    call BossIntro                                ; $6317: $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ; $631A: $21 $B0 $C2
    add  hl, bc                                   ; $631D: $09
    ld   a, [hl]                                  ; $631E: $7E
    and  a                                        ; $631F: $A7
    jr   z, .jr_632F                              ; $6320: $28 $0D

    cp   $01                                      ; $6322: $FE $01
    jp   z, label_005_6776                        ; $6324: $CA $76 $67

    cp   $02                                      ; $6327: $FE $02
    jp   z, label_005_6798                        ; $6329: $CA $98 $67

    jp   label_005_67EA                           ; $632C: $C3 $EA $67

.jr_632F
    call func_005_6705                            ; $632F: $CD $05 $67
    ldh  a, [hActiveEntityStatus]                 ; $6332: $F0 $EA
    cp   $01                                      ; $6334: $FE $01
    jr   nz, jr_005_6375                          ; $6336: $20 $3D

    ld   hl, wEntitiesPrivateState2Table          ; $6338: $21 $C0 $C2
    add  hl, bc                                   ; $633B: $09
    ld   a, [hl]                                  ; $633C: $7E
    JP_TABLE                                      ; $633D
._00 dw func_005_6342                             ; $633E
._01 dw func_005_634D                             ; $6340

func_005_6342::
    call GetEntityTransitionCountdown             ; $6342: $CD $05 $0C
    ld   [hl], $FF                                ; $6345: $36 $FF

label_005_6347:
    ld   hl, wEntitiesPrivateState2Table          ; $6347: $21 $C0 $C2
    add  hl, bc                                   ; $634A: $09
    inc  [hl]                                     ; $634B: $34
    ret                                           ; $634C: $C9

func_005_634D::
    call GetEntityTransitionCountdown             ; $634D: $CD $05 $0C
    jp   z, label_005_635E                        ; $6350: $CA $5E $63

    ld   hl, wEntitiesFlashCountdownTable         ; $6353: $21 $20 $C4
    add  hl, bc                                   ; $6356: $09
    ld   [hl], a                                  ; $6357: $77
    cp   $80                                      ; $6358: $FE $80
    ret  nc                                       ; $635A: $D0

    jp   label_005_7550                           ; $635B: $C3 $50 $75

label_005_635E:
    call DropHeartContainer_05                    ; $635E: $CD $85 $75
    ld   hl, wEntitiesPosXTable                   ; $6361: $21 $00 $C2
    add  hl, de                                   ; $6364: $19
    ldh  a, [hLinkPositionX]                      ; $6365: $F0 $98
    ld   [hl], a                                  ; $6367: $77
    ld   hl, wEntitiesPosYTable                   ; $6368: $21 $10 $C2
    add  hl, de                                   ; $636B: $19
    ld   [hl], $70                                ; $636C: $36 $70
    ld   hl, wEntitiesPosZTable                   ; $636E: $21 $10 $C3
    add  hl, de                                   ; $6371: $19
    ld   [hl], $70                                ; $6372: $36 $70
    ret                                           ; $6374: $C9

jr_005_6375:
    call ReturnIfNonInteractive_05                ; $6375: $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ; $6378: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $637B: $F0 $F0
    JP_TABLE                                      ; $637D
._00 dw func_005_63A8                             ; $637E
._01 dw func_005_63EB                             ; $6380
._02 dw func_005_648E                             ; $6382
._03 dw func_005_6534                             ; $6384
._04 dw func_005_6579                             ; $6386

Data_005_6388::
    db   $28, $38, $58, $68, $28, $38, $58, $68

Data_005_6390::
IF __PATCH_0__
    db   $38, $30, $30, $38, $48, $58, $58, $48
ELSE
    db   $38, $30, $30, $38, $50, $58, $58, $50
ENDC

Data_005_6398::
    db   $10, $10, $F0, $F0, $10, $10, $F0, $F0

Data_005_63A0::
    db   $FD, $03, $03, $FD, $03, $FD, $FD, $03

func_005_63A8::
    call GetEntityTransitionCountdown             ; $63A8: $CD $05 $0C
    ret  nz                                       ; $63AB: $C0

    call GetRandomByte                            ; $63AC: $CD $0D $28
    and  $07                                      ; $63AF: $E6 $07
    ld   e, a                                     ; $63B1: $5F
    ld   d, b                                     ; $63B2: $50
    ld   hl, Data_005_6388                        ; $63B3: $21 $88 $63
    add  hl, de                                   ; $63B6: $19
    ld   a, [hl]                                  ; $63B7: $7E
    ld   hl, wEntitiesPosXTable                   ; $63B8: $21 $00 $C2
    add  hl, bc                                   ; $63BB: $09
    ld   [hl], a                                  ; $63BC: $77
    ld   hl, Data_005_6390                        ; $63BD: $21 $90 $63
    add  hl, de                                   ; $63C0: $19
    ld   a, [hl]                                  ; $63C1: $7E

.jr_63C2
    ld   hl, wEntitiesPosYTable                   ; $63C2: $21 $10 $C2
    add  hl, bc                                   ; $63C5: $09

.jr_63C6
    ld   [hl], a                                  ; $63C6: $77
    ld   hl, Data_005_6398                        ; $63C7: $21 $98 $63
    add  hl, de                                   ; $63CA: $19
    ld   a, [hl]                                  ; $63CB: $7E

.jr_63CC
    ld   hl, wEntitiesSpeedXTable                 ; $63CC: $21 $40 $C2
    add  hl, bc                                   ; $63CF: $09
    ld   [hl], a                                  ; $63D0: $77
    ld   hl, Data_005_63A0                        ; $63D1: $21 $A0 $63
    add  hl, de                                   ; $63D4: $19
    ld   a, [hl]                                  ; $63D5: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $63D6: $21 $50 $C2
    add  hl, bc                                   ; $63D9: $09
    ld   [hl], a                                  ; $63DA: $77
    ld   hl, wEntitiesSpeedZTable                 ; $63DB: $21 $20 $C3
    add  hl, bc                                   ; $63DE: $09
    ld   [hl], $18                                ; $63DF: $36 $18
    ld   a, WAVE_SFX_BOSS_GROWL                   ; $63E1: $3E $16
    ldh  [hWaveSfx], a                            ; $63E3: $E0 $F3
    call func_005_65D9                            ; $63E5: $CD $D9 $65
    jp   IncrementEntityState                     ; $63E8: $C3 $12 $3B

func_005_63EB::
    ld   hl, wEntitiesSpeedXTable                 ; $63EB: $21 $40 $C2
    add  hl, bc                                   ; $63EE: $09
    ld   a, [hl]                                  ; $63EF: $7E
    and  a                                        ; $63F0: $A7
    jr   z, jr_005_6444                           ; $63F1: $28 $51

    ld   hl, wEntitiesFlashCountdownTable         ; $63F3: $21 $20 $C4
    add  hl, bc                                   ; $63F6: $09
    ld   a, [hl]                                  ; $63F7: $7E
    cp   $0B                                      ; $63F8: $FE $0B
    jr   c, jr_005_6444                           ; $63FA: $38 $48

    ld   hl, wEntitiesInertiaTable                ; $63FC: $21 $D0 $C3
    add  hl, bc                                   ; $63FF: $09
    ld   a, [hl]                                  ; $6400: $7E
    cp   $05                                      ; $6401: $FE $05
    jr   nc, ret_005_6443                         ; $6403: $30 $3E

    call IncrementEntityState                     ; $6405: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6408: $CD $05 $0C
    ld   [hl], $40                                ; $640B: $36 $40
    ld   hl, wEntitiesSpeedXTable                 ; $640D: $21 $40 $C2
    add  hl, bc                                   ; $6410: $09
    ld   [hl], $18                                ; $6411: $36 $18
    ld   hl, wEntitiesSpeedYTable                 ; $6413: $21 $50 $C2
    add  hl, bc                                   ; $6416: $09
    ld   [hl], $18                                ; $6417: $36 $18
    ld   hl, wEntitiesSpeedZTable                 ; $6419: $21 $20 $C3
    add  hl, bc                                   ; $641C: $09
    ld   [hl], b                                  ; $641D: $70
    call GetEntityDropTimer                       ; $641E: $CD $FB $0B
    ld   [hl], $40                                ; $6421: $36 $40
    ldh  a, [hActiveEntityPosX]                   ; $6423: $F0 $EE
    add  $F8                                      ; $6425: $C6 $F8
    ldh  [hMultiPurpose0], a                      ; $6427: $E0 $D7
    call func_005_6432                            ; $6429: $CD $32 $64
    ldh  a, [hActiveEntityPosX]                   ; $642C: $F0 $EE
    add  $08                                      ; $642E: $C6 $08
    ldh  [hMultiPurpose0], a                      ; $6430: $E0 $D7

func_005_6432::
    ldh  a, [hActiveEntityVisualPosY]             ; $6432: $F0 $EC
    sub  $10                                      ; $6434: $D6 $10
    ldh  [hMultiPurpose1], a                      ; $6436: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $6438: $3E $02
    call AddTranscientVfx                         ; $643A: $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ; $643D: $21 $20 $C5
    add  hl, de                                   ; $6440: $19
    ld   [hl], $0F                                ; $6441: $36 $0F

ret_005_6443:
    ret                                           ; $6443: $C9

jr_005_6444:
    call UpdateEntityPosWithSpeed_05              ; $6444: $CD $B1 $7A
    call AddEntityZSpeedToPos_05                  ; $6447: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $644A: $21 $20 $C3
    add  hl, bc                                   ; $644D: $09
    dec  [hl]                                     ; $644E: $35
    ld   hl, wEntitiesPosZTable                   ; $644F: $21 $10 $C3
    add  hl, bc                                   ; $6452: $09
    ld   a, [hl]                                  ; $6453: $7E
    and  $80                                      ; $6454: $E6 $80
    jr   z, .jr_6471                              ; $6456: $28 $19

    ld   [hl], b                                  ; $6458: $70
    call GetEntityTransitionCountdown             ; $6459: $CD $05 $0C
    ld   [hl], $40                                ; $645C: $36 $40
    call IncrementEntityState                     ; $645E: $CD $12 $3B
    ld   [hl], b                                  ; $6461: $70
    call func_005_6611                            ; $6462: $CD $11 $66
    call func_005_65D9                            ; $6465: $CD $D9 $65
    ld   a, JINGLE_HOT_HEAD_SPLASH                ; $6468: $3E $32
    ldh  [hJingle], a                             ; $646A: $E0 $F2
    ld   a, $FF                                   ; $646C: $3E $FF
    jp   SetEntitySpriteVariant                   ; $646E: $C3 $0C $3B

.jr_6471
    ld   hl, wEntitiesInertiaTable                ; $6471: $21 $D0 $C3
    add  hl, bc                                   ; $6474: $09
    ld   a, [hl]                                  ; $6475: $7E
    cp   $05                                      ; $6476: $FE $05
    jp   nc, jr_005_656D                          ; $6478: $D2 $6D $65

    ld   hl, wEntitiesSpeedXTable                 ; $647B: $21 $40 $C2
    add  hl, bc                                   ; $647E: $09
    ld   a, [hl]                                  ; $647F: $7E
    and  a                                        ; $6480: $A7
    jr   z, .ret_648D                             ; $6481: $28 $0A

    ldh  a, [hFrameCounter]                       ; $6483: $F0 $E7
    rra                                           ; $6485: $1F
    rra                                           ; $6486: $1F
    rra                                           ; $6487: $1F
    and  $01                                      ; $6488: $E6 $01
    jp   SetEntitySpriteVariant                   ; $648A: $C3 $0C $3B

.ret_648D
    ret                                           ; $648D: $C9

func_005_648E::
    ld   a, $02                                   ; $648E: $3E $02
    call SetEntitySpriteVariant                   ; $6490: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6493: $CD $05 $0C
    jr   z, jr_005_64AF                           ; $6496: $28 $17

    and  $02                                      ; $6498: $E6 $02
    ld   e, $08                                   ; $649A: $1E $08
    jr   z, .jr_64A0                              ; $649C: $28 $02

    ld   e, $F8                                   ; $649E: $1E $F8

.jr_64A0
    ld   hl, wEntitiesSpeedXTable                 ; $64A0: $21 $40 $C2
    add  hl, bc                                   ; $64A3: $09
    push hl                                       ; $64A4: $E5
    ld   a, [hl]                                  ; $64A5: $7E
    push af                                       ; $64A6: $F5
    ld   [hl], e                                  ; $64A7: $73
    call AddEntitySpeedToPos_05                   ; $64A8: $CD $BE $7A
    pop  af                                       ; $64AB: $F1
    pop  hl                                       ; $64AC: $E1
    ld   [hl], a                                  ; $64AD: $77
    ret                                           ; $64AE: $C9

jr_005_64AF:
    call label_3B39                               ; $64AF: $CD $39 $3B
    call GetEntityDropTimer                       ; $64B2: $CD $FB $0B
    jr   nz, .jr_64CC                             ; $64B5: $20 $15

    ldh  a, [hActiveEntityPosX]                   ; $64B7: $F0 $EE
    cp   $70                                      ; $64B9: $FE $70
    jr   nc, .jr_64CC                             ; $64BB: $30 $0F

    ldh  a, [hActiveEntityVisualPosY]             ; $64BD: $F0 $EC
IF __PATCH_0__
    cp   $58
ELSE
    cp   $50                                      ; $64BF: $FE $50
ENDC
    jr   nc, .jr_64CC                             ; $64C1: $30 $09

    call ClearEntitySpeed                         ; $64C3: $CD $7F $3D
    call IncrementEntityState                     ; $64C6: $CD $12 $3B
    ld   [hl], $01                                ; $64C9: $36 $01
    ret                                           ; $64CB: $C9

.jr_64CC
    ld   hl, wEntitiesFlashCountdownTable         ; $64CC: $21 $20 $C4
    add  hl, bc                                   ; $64CF: $09
    ld   a, [hl]                                  ; $64D0: $7E
    cp   $08                                      ; $64D1: $FE $08
    jr   nz, .jr_64F7                             ; $64D3: $20 $22

    ldh  a, [hActiveEntityPosX]                   ; $64D5: $F0 $EE
    cp   $70                                      ; $64D7: $FE $70
    jr   nc, .jr_64F7                             ; $64D9: $30 $1C

    ldh  a, [hActiveEntityVisualPosY]             ; $64DB: $F0 $EC
IF __PATCH_0__
    cp   $58
ELSE
    cp   $50                                      ; $64DD: $FE $50
ENDC
    jr   nc, .jr_64F7                             ; $64DF: $30 $16

    ld   hl, wEntitiesInertiaTable                ; $64E1: $21 $D0 $C3
    add  hl, bc                                   ; $64E4: $09
    inc  [hl]                                     ; $64E5: $34
    ld   a, [hl]                                  ; $64E6: $7E
    cp   $05                                      ; $64E7: $FE $05
    jr   c, .jr_64F7                              ; $64E9: $38 $0C

    call IncrementEntityState                     ; $64EB: $CD $12 $3B
    call ClearEntitySpeed                         ; $64EE: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $64F1: $CD $05 $0C
    ld   [hl], $80                                ; $64F4: $36 $80
    ret                                           ; $64F6: $C9

.jr_64F7
    ld   hl, wEntitiesFlashCountdownTable         ; $64F7: $21 $20 $C4
    add  hl, bc                                   ; $64FA: $09
    ld   a, [hl]                                  ; $64FB: $7E
    cp   $0B                                      ; $64FC: $FE $0B
    ret  nc                                       ; $64FE: $D0

    call UpdateEntityPosWithSpeed_05              ; $64FF: $CD $B1 $7A
    call label_3B23                               ; $6502: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6505: $21 $A0 $C2
    add  hl, bc                                   ; $6508: $09
    ld   a, [hl]                                  ; $6509: $7E
    push af                                       ; $650A: $F5
    and  $03                                      ; $650B: $E6 $03
    jr   z, .jr_6515                              ; $650D: $28 $06

    ld   hl, wEntitiesSpeedXTable                 ; $650F: $21 $40 $C2
    call func_005_651D                            ; $6512: $CD $1D $65

.jr_6515
    pop  af                                       ; $6515: $F1
    and  $0C                                      ; $6516: $E6 $0C
    jr   z, jr_005_6522                           ; $6518: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $651A: $21 $50 $C2

func_005_651D::
    add  hl, bc                                   ; $651D: $09
    ld   a, [hl]                                  ; $651E: $7E
    cpl                                           ; $651F: $2F
    inc  a                                        ; $6520: $3C
    ld   [hl], a                                  ; $6521: $77

jr_005_6522:
    ldh  a, [hFrameCounter]                       ; $6522: $F0 $E7
    and  $07                                      ; $6524: $E6 $07
    ret  nz                                       ; $6526: $C0

    ldh  a, [hActiveEntityPosX]                   ; $6527: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $6529: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $652B: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $652D: $E0 $D8
    ld   a, TRANSCIENT_VFX_LAVA_SPLASH            ; $652F: $3E $0A
    jp   AddTranscientVfx                         ; $6531: $C3 $C7 $0C

func_005_6534::
    call GetEntityTransitionCountdown             ; $6534: $CD $05 $0C
    cp   $40                                      ; $6537: $FE $40
    jr   c, jr_005_655B                           ; $6539: $38 $20

    jr   nz, .jr_6544                             ; $653B: $20 $07

    ld   a, NOISE_SFX_BREAK                       ; $653D: $3E $29
    ldh  [hNoiseSfx], a                           ; $653F: $E0 $F4
    call func_005_657F                            ; $6541: $CD $7F $65

.jr_6544
    and  $02                                      ; $6544: $E6 $02
    ld   e, $10                                   ; $6546: $1E $10
    jr   z, .jr_654C                              ; $6548: $28 $02

    ld   e, $F0                                   ; $654A: $1E $F0

.jr_654C
    ld   hl, wEntitiesSpeedXTable                 ; $654C: $21 $40 $C2
    add  hl, bc                                   ; $654F: $09
    push hl                                       ; $6550: $E5
    ld   a, [hl]                                  ; $6551: $7E
    push af                                       ; $6552: $F5
    ld   [hl], e                                  ; $6553: $73
    call AddEntitySpeedToPos_05                   ; $6554: $CD $BE $7A
    pop  af                                       ; $6557: $F1
    pop  hl                                       ; $6558: $E1
    ld   [hl], a                                  ; $6559: $77
    ret                                           ; $655A: $C9

jr_005_655B:
    and  a                                        ; $655B: $A7
    jr   nz, jr_005_656D                          ; $655C: $20 $0F

    call IncrementEntityState                     ; $655E: $CD $12 $3B
    ld   [hl], $01                                ; $6561: $36 $01
    call ClearEntitySpeed                         ; $6563: $CD $7F $3D
    ld   hl, wEntitiesHealthTable                 ; $6566: $21 $60 $C3
    add  hl, bc                                   ; $6569: $09
    ld   [hl], $08                                ; $656A: $36 $08
    ret                                           ; $656C: $C9

jr_005_656D:
    ldh  a, [hFrameCounter]                       ; $656D: $F0 $E7
    rra                                           ; $656F: $1F
    rra                                           ; $6570: $1F
    rra                                           ; $6571: $1F
    and  $01                                      ; $6572: $E6 $01
    add  $03                                      ; $6574: $C6 $03
    jp   SetEntitySpriteVariant                   ; $6576: $C3 $0C $3B

func_005_6579::
    ret                                           ; $6579: $C9

Data_005_657A::
    db   $C9, $F8

Data_005_657C::
    db   $08, $F8, $08

func_005_657F::
    ld   a, $02                                   ; $657F: $3E $02

jr_005_6581:
    ldh  [hMultiPurposeG], a                      ; $6581: $E0 $E8
    ld   a, ENTITY_HOT_HEAD                       ; $6583: $3E $62
    call SpawnNewEntity_trampoline                ; $6585: $CD $86 $3B
    jr   c, .jr_65D3                              ; $6588: $38 $49

    ld   hl, wEntitiesPrivateState1Table          ; $658A: $21 $B0 $C2
    add  hl, de                                   ; $658D: $19
    ld   [hl], $03                                ; $658E: $36 $03
    push bc                                       ; $6590: $C5
    ldh  a, [hMultiPurposeG]                      ; $6591: $F0 $E8
    ld   c, a                                     ; $6593: $4F
    ld   hl, Data_005_657A                        ; $6594: $21 $7A $65
    add  hl, bc                                   ; $6597: $09
    ldh  a, [hMultiPurpose0]                      ; $6598: $F0 $D7
    add  [hl]                                     ; $659A: $86
    ld   hl, wEntitiesPosXTable                   ; $659B: $21 $00 $C2
    add  hl, de                                   ; $659E: $19
    ld   [hl], a                                  ; $659F: $77
    ldh  a, [hMultiPurpose1]                      ; $65A0: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $65A2: $21 $10 $C2
    add  hl, de                                   ; $65A5: $19
    ld   [hl], a                                  ; $65A6: $77
    ldh  a, [hMultiPurpose3]                      ; $65A7: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $65A9: $21 $10 $C3
    add  hl, de                                   ; $65AC: $19
    ld   [hl], a                                  ; $65AD: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $65AE: $21 $B0 $C3
    add  hl, de                                   ; $65B1: $19
    ldh  a, [hMultiPurposeG]                      ; $65B2: $F0 $E8
    dec  a                                        ; $65B4: $3D
    ld   [hl], a                                  ; $65B5: $77
    ld   hl, Data_005_657C                        ; $65B6: $21 $7C $65
    add  hl, bc                                   ; $65B9: $09
    ld   a, [hl]                                  ; $65BA: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $65BB: $21 $40 $C2
    add  hl, de                                   ; $65BE: $19
    ld   [hl], a                                  ; $65BF: $77
    ld   hl, wEntitiesSpeedYTable                 ; $65C0: $21 $50 $C2
    add  hl, de                                   ; $65C3: $19
    ld   [hl], $04                                ; $65C4: $36 $04
    pop  bc                                       ; $65C6: $C1
    ld   hl, wEntitiesSpeedZTable                 ; $65C7: $21 $20 $C3
    add  hl, de                                   ; $65CA: $19
    ld   [hl], $08                                ; $65CB: $36 $08
    ld   hl, wEntitiesPhysicsFlagsTable           ; $65CD: $21 $40 $C3
    add  hl, de                                   ; $65D0: $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $65D1: $36 $42

.jr_65D3
    ldh  a, [hMultiPurposeG]                      ; $65D3: $F0 $E8
    dec  a                                        ; $65D5: $3D
    jr   nz, jr_005_6581                          ; $65D6: $20 $A9

    ret                                           ; $65D8: $C9

func_005_65D9::
    ld   a, ENTITY_HOT_HEAD                       ; $65D9: $3E $62
    call SpawnNewEntity_trampoline                ; $65DB: $CD $86 $3B
    jr   c, Data_005_6601 - 1                     ; $65DE: $38 $20

    ld   hl, wEntitiesPrivateState1Table          ; $65E0: $21 $B0 $C2
    add  hl, de                                   ; $65E3: $19
    ld   [hl], $01                                ; $65E4: $36 $01
    ldh  a, [hMultiPurpose0]                      ; $65E6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $65E8: $21 $00 $C2
    add  hl, de                                   ; $65EB: $19
    ld   [hl], a                                  ; $65EC: $77
    ldh  a, [hMultiPurpose1]                      ; $65ED: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $65EF: $21 $10 $C2
    add  hl, de                                   ; $65F2: $19
    ld   [hl], a                                  ; $65F3: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $65F4: $21 $E0 $C2
    add  hl, de                                   ; $65F7: $19
    ld   [hl], $14                                ; $65F8: $36 $14
    ld   hl, wEntitiesPhysicsFlagsTable           ; $65FA: $21 $40 $C3
    add  hl, de                                   ; $65FD: $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $65FE: $36 $C4
    ret                                           ; $6600: $C9

Data_005_6601::
    db   $F8, $08, $F8, $08

Data_005_6605::
    db   $FC, $FC, $04, $04

Data_005_6609::
    db   $F4, $0C, $F4, $0C

Data_005_660D::
    db   $F4, $F4, $0C, $0C

func_005_6611::
    ld   a, $04                                   ; $6611: $3E $04

jr_005_6613:
    ldh  [hMultiPurposeG], a                      ; $6613: $E0 $E8
    ld   a, ENTITY_HOT_HEAD                       ; $6615: $3E $62
    call SpawnNewEntity_trampoline                ; $6617: $CD $86 $3B
    jr   c, .jr_665F                              ; $661A: $38 $43

    ld   hl, wEntitiesPrivateState1Table          ; $661C: $21 $B0 $C2
    add  hl, de                                   ; $661F: $19
    ld   [hl], $02                                ; $6620: $36 $02
    push bc                                       ; $6622: $C5
    ldh  a, [hMultiPurposeG]                      ; $6623: $F0 $E8
    ld   c, a                                     ; $6625: $4F
    ld   hl, Data_005_6601 - 1                    ; $6626: $21 $00 $66
    add  hl, bc                                   ; $6629: $09
    ldh  a, [hMultiPurpose0]                      ; $662A: $F0 $D7
    add  [hl]                                     ; $662C: $86
    ld   hl, wEntitiesPosXTable                   ; $662D: $21 $00 $C2
    add  hl, de                                   ; $6630: $19
    ld   [hl], a                                  ; $6631: $77
    ld   hl, Data_005_6605 - 1                    ; $6632: $21 $04 $66
    add  hl, bc                                   ; $6635: $09
    ldh  a, [hMultiPurpose1]                      ; $6636: $F0 $D8
    add  [hl]                                     ; $6638: $86
    ld   hl, wEntitiesPosYTable                   ; $6639: $21 $10 $C2
    add  hl, de                                   ; $663C: $19
    ld   [hl], a                                  ; $663D: $77
    ld   hl, Data_005_6609 - 1                    ; $663E: $21 $08 $66
    add  hl, bc                                   ; $6641: $09
    ld   a, [hl]                                  ; $6642: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6643: $21 $40 $C2
    add  hl, de                                   ; $6646: $19
    ld   [hl], a                                  ; $6647: $77
    ld   hl, Data_005_660D - 1                    ; $6648: $21 $0C $66
    add  hl, bc                                   ; $664B: $09
    ld   a, [hl]                                  ; $664C: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $664D: $21 $50 $C2
    add  hl, de                                   ; $6650: $19
    ld   [hl], a                                  ; $6651: $77
    pop  bc                                       ; $6652: $C1
    ld   hl, wEntitiesSpeedZTable                 ; $6653: $21 $20 $C3
    add  hl, de                                   ; $6656: $19
    ld   [hl], $13                                ; $6657: $36 $13
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6659: $21 $40 $C3
    add  hl, de                                   ; $665C: $19
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $665D: $36 $42

.jr_665F
    ldh  a, [hMultiPurposeG]                      ; $665F: $F0 $E8
    dec  a                                        ; $6661: $3D
    jr   nz, jr_005_6613                          ; $6662: $20 $AF

    ret                                           ; $6664: $C9

Data_005_6665::
    db   $F0, $F8, $60, $02, $F0, $00, $62, $02, $F0, $08, $64, $02, $F0, $10, $66, $02
    db   $00, $F8, $68, $02, $00, $00, $6A, $02, $00, $08, $6A, $22, $00, $10, $68, $22
    db   $F0, $F8, $66, $21, $F0, $00, $64, $21, $F0, $08, $62, $21, $F0, $10, $60, $21
    db   $00, $F8, $68, $01, $00, $00, $6A, $01, $00, $08, $6A, $21, $00, $10, $68, $21

Data_005_66A5::
    db   $00, $F8, $6C, $02, $00, $00, $6E, $02, $00, $08, $6E, $22, $00, $10, $6C, $22
    db   $00, $FC, $7C, $02, $00, $04, $7E, $02, $00, $0C, $7C, $22, $00, $00, $FF, $00
    db   $00, $FC, $7C, $02, $00, $04, $7E, $22, $00, $0C, $7C, $22, $00, $00, $FF, $00
    db   $00, $F8, $74, $02, $00, $00, $76, $02, $00, $08, $76, $22, $00, $10, $74, $22
    db   $00, $F8, $70, $02, $00, $00, $72, $02, $00, $08, $72, $22, $00, $10, $70, $22

Data_005_66F5::
    db   $0A, $FB, $26, $02, $0A, $01, $26, $02, $0A, $06, $26, $02, $0A, $0C, $26, $02

func_005_6705::
    ldh  a, [hActiveEntitySpriteVariant]          ; $6705: $F0 $F1
    cp   $02                                      ; $6707: $FE $02
    jr   nc, label_005_6754                       ; $6709: $30 $49

    ld   hl, wEntitiesPhysicsFlagsTable           ; $670B: $21 $40 $C3
    add  hl, bc                                   ; $670E: $09
    ld   a, [hl]                                  ; $670F: $7E
    and  ENTITY_PHYSICS_MASK                      ; $6710: $E6 $F0
    or   8                                        ; $6712: $F6 $08
    ld   [hl], a                                  ; $6714: $77
    ldh  a, [hActiveEntitySpriteVariant]          ; $6715: $F0 $F1
    rla                                           ; $6717: $17
    rla                                           ; $6718: $17
    rla                                           ; $6719: $17
    rla                                           ; $671A: $17
    rla                                           ; $671B: $17
    and  $E0                                      ; $671C: $E6 $E0
    ld   e, a                                     ; $671E: $5F
    ld   d, b                                     ; $671F: $50
    ld   hl, Data_005_6665                        ; $6720: $21 $65 $66
    add  hl, de                                   ; $6723: $19
    ld   c, $08                                   ; $6724: $0E $08
    call RenderActiveEntitySpritesRect            ; $6726: $CD $E6 $3C
    nop                                           ; $6729: $00

label_005_672A:
    ldh  a, [hActiveEntitySpriteVariant]          ; $672A: $F0 $F1
    cp   $05                                      ; $672C: $FE $05
    ret  nc                                       ; $672E: $D0

    ld   hl, wEntitiesPosZTable                   ; $672F: $21 $10 $C3
    add  hl, bc                                   ; $6732: $09
    ld   a, [hl]                                  ; $6733: $7E
    dec  a                                        ; $6734: $3D
    cp   $08                                      ; $6735: $FE $08
    ret  c                                        ; $6737: $D8

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6738: $21 $40 $C3
    add  hl, bc                                   ; $673B: $09
    ld   a, [hl]                                  ; $673C: $7E
    and  ENTITY_PHYSICS_MASK                      ; $673D: $E6 $F0
    or   4                                        ; $673F: $F6 $04
    ld   [hl], a                                  ; $6741: $77
    ldh  a, [hActiveEntityPosY]                   ; $6742: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $6744: $E0 $EC
    xor  a                                        ; $6746: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $6747: $E0 $F1
    ld   hl, Data_005_66F5                        ; $6749: $21 $F5 $66
    ld   c, $04                                   ; $674C: $0E $04
    call RenderActiveEntitySpritesRect            ; $674E: $CD $E6 $3C
    jp   CopyEntityPositionToActivePosition       ; $6751: $C3 $8A $3D

label_005_6754:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6754: $21 $40 $C3
    add  hl, bc                                   ; $6757: $09
    ld   a, [hl]                                  ; $6758: $7E
    and  ENTITY_PHYSICS_MASK                      ; $6759: $E6 $F0
    or   4                                        ; $675B: $F6 $04
    ld   [hl], a                                  ; $675D: $77
    ldh  a, [hActiveEntitySpriteVariant]          ; $675E: $F0 $F1
    dec  a                                        ; $6760: $3D
    dec  a                                        ; $6761: $3D
    rla                                           ; $6762: $17
    rla                                           ; $6763: $17
    rla                                           ; $6764: $17
    rla                                           ; $6765: $17
    and  $F0                                      ; $6766: $E6 $F0
    ld   e, a                                     ; $6768: $5F
    ld   d, b                                     ; $6769: $50
    ld   hl, Data_005_66A5                        ; $676A: $21 $A5 $66
    add  hl, de                                   ; $676D: $19
    ld   c, $04                                   ; $676E: $0E $04
    call RenderActiveEntitySpritesRect            ; $6770: $CD $E6 $3C
    jp   label_005_672A                           ; $6773: $C3 $2A $67

label_005_6776:
    call GetEntityTransitionCountdown             ; $6776: $CD $05 $0C
    jp   z, ClearEntityStatus_05                  ; $6779: $CA $4B $7B

    cp   $0A                                      ; $677C: $FE $0A
    ld   a, $05                                   ; $677E: $3E $05
    jr   c, .jr_6783                              ; $6780: $38 $01

    inc  a                                        ; $6782: $3C

.jr_6783
    ldh  [hActiveEntitySpriteVariant], a          ; $6783: $E0 $F1
    jp   label_005_6754                           ; $6785: $C3 $54 $67

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HotHead1SpriteVariants::
.variant0
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant1
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $1E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

label_005_6798:
    ld   de, HotHead1SpriteVariants               ; $6798: $11 $88 $67
    call RenderActiveEntitySpritesPair            ; $679B: $CD $C0 $3B
    call ReturnIfNonInteractive_05                ; $679E: $CD $3A $7A
    call label_3B44                               ; $67A1: $CD $44 $3B
    ldh  a, [hActiveEntityState]                  ; $67A4: $F0 $F0
    JP_TABLE                                      ; $67A6
._00 dw func_005_67AB                             ; $67A7
._01 dw func_005_67D2                             ; $67A9

func_005_67AB::
    call UpdateEntityPosWithSpeed_05
    call AddEntityZSpeedToPos_05                  ; $67AE: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $67B1: $21 $20 $C3
    add  hl, bc                                   ; $67B4: $09
    dec  [hl]                                     ; $67B5: $35
    ld   hl, wEntitiesPosZTable                   ; $67B6: $21 $10 $C3
    add  hl, bc                                   ; $67B9: $09
    ld   a, [hl]                                  ; $67BA: $7E
    and  $80                                      ; $67BB: $E6 $80
    jr   z, .jr_67C8                              ; $67BD: $28 $09

    ld   [hl], b                                  ; $67BF: $70
    call IncrementEntityState                     ; $67C0: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $67C3: $CD $05 $0C
    ld   [hl], $0F                                ; $67C6: $36 $0F

.jr_67C8
    ldh  a, [hFrameCounter]                       ; $67C8: $F0 $E7
    rra                                           ; $67CA: $1F
    rra                                           ; $67CB: $1F
    rra                                           ; $67CC: $1F
    and  $01                                      ; $67CD: $E6 $01
    jp   SetEntitySpriteVariant                   ; $67CF: $C3 $0C $3B

func_005_67D2::
    call GetEntityTransitionCountdown             ; $67D2: $CD $05 $0C
    jp   z, ClearEntityStatus_05                  ; $67D5: $CA $4B $7B

    rra                                           ; $67D8: $1F
    rra                                           ; $67D9: $1F
    rra                                           ; $67DA: $1F
    and  $01                                      ; $67DB: $E6 $01
    inc  a                                        ; $67DD: $3C
    inc  a                                        ; $67DE: $3C
    jp   SetEntitySpriteVariant                   ; $67DF: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HotHead2SpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $6E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

label_005_67EA:
    ld   de, HotHead2SpriteVariants               ; $67EA: $11 $E2 $67
    call RenderActiveEntitySpritesPair            ; $67ED: $CD $C0 $3B
    call ReturnIfNonInteractive_05                ; $67F0: $CD $3A $7A
    call UpdateEntityPosWithSpeed_05              ; $67F3: $CD $B1 $7A
    call AddEntityZSpeedToPos_05                  ; $67F6: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $67F9: $21 $20 $C3
    add  hl, bc                                   ; $67FC: $09
    dec  [hl]                                     ; $67FD: $35
    ld   hl, wEntitiesPosZTable                   ; $67FE: $21 $10 $C3
    add  hl, bc                                   ; $6801: $09
    ld   a, [hl]                                  ; $6802: $7E
    and  $80                                      ; $6803: $E6 $80
    ret  z                                        ; $6805: $C8

    xor  a                                        ; $6806: $AF
    ld   [hl], a                                  ; $6807: $77
    call GetEntityTransitionCountdown             ; $6808: $CD $05 $0C
    ld   [hl], $0F                                ; $680B: $36 $0F
    ld   hl, wEntitiesPrivateState1Table          ; $680D: $21 $B0 $C2
    add  hl, bc                                   ; $6810: $09
    ld   [hl], $02                                ; $6811: $36 $02
    ld   a, $FF                                   ; $6813: $3E $FF
    jp   SetEntitySpriteVariant                   ; $6815: $C3 $0C $3B
