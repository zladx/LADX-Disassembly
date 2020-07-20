Data_006_7373::
    db   $70, $01, $70, $21, $72, $01, $72, $21

PolsVoiceEntityHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ; $737B: $FA $66 $C1
    cp   $01                                      ; $737E: $FE $01
    jr   nz, jr_006_73AD                          ; $7380: $20 $2B

    ld   a, [wOcarinaSongFlags]                   ; $7382: $FA $49 $DB
    and  $04                                      ; $7385: $E6 $04
    jr   z, jr_006_73AD                           ; $7387: $28 $24

    ld   a, [wSelectedSongIndex]                               ; $7389: $FA $4A $DB
    and  a                                        ; $738C: $A7
    jr   nz, jr_006_73AD                          ; $738D: $20 $1E

    ldh  a, [hActiveEntityStatus]                 ; $738F: $F0 $EA
    cp   $01                                      ; $7391: $FE $01
    jr   z, jr_006_73AD                           ; $7393: $28 $18

    ld   hl, wEntitiesUnknowTableV                ; $7395: $21 $80 $C4
    add  hl, bc                                   ; $7398: $09
    ld   [hl], $1F                                ; $7399: $36 $1F
    ld   hl, wEntitiesStatusTable                 ; $739B: $21 $80 $C2
    add  hl, bc                                   ; $739E: $09
    ld   [hl], $01                                ; $739F: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73A1: $21 $40 $C3
    add  hl, bc                                   ; $73A4: $09
    ld   [hl], $04                                ; $73A5: $36 $04
    ld   hl, hNoiseSfx                            ; $73A7: $21 $F4 $FF
    ld   [hl], $13                                ; $73AA: $36 $13
    ret                                           ; $73AC: $C9

jr_006_73AD:
    ld   de, Data_006_7373                        ; $73AD: $11 $73 $73
    call RenderActiveEntitySpritesPair            ; $73B0: $CD $C0 $3B
    call func_006_64C6                            ; $73B3: $CD $C6 $64
    call func_006_64F7                            ; $73B6: $CD $F7 $64
    call UpdateEntityPosWithSpeed_06              ; $73B9: $CD $41 $65
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $73BC: $21 $10 $C4
    add  hl, bc                                   ; $73BF: $09
    ld   [hl], $01                                ; $73C0: $36 $01
    push hl                                       ; $73C2: $E5
    call label_3B23                               ; $73C3: $CD $23 $3B
    pop  hl                                       ; $73C6: $E1
    ld   [hl], b                                  ; $73C7: $70
    call label_3B39                               ; $73C8: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $73CB: $F0 $F0
    and  $01                                      ; $73CD: $E6 $01
    JP_TABLE                                      ; $73CF
._00 dw func_006_73E0                             ; $73D0
._01 dw func_006_7423                             ; $73D2

Data_006_73D4::
    db   $08, $08, $F8, $F8, $04, $FC

Data_006_73DA::
    db   $FC, $04, $FC, $04, $08, $F8

func_006_73E0::
    ld   hl, wEntitiesSpriteVariantTable          ; $73E0: $21 $B0 $C3
    add  hl, bc                                   ; $73E3: $09
    ld   [hl], $01                                ; $73E4: $36 $01
    call GetEntityTransitionCountdown             ; $73E6: $CD $05 $0C
    ret  nz                                       ; $73E9: $C0

    call IncrementEntityState                     ; $73EA: $CD $12 $3B
    call GetRandomByte                            ; $73ED: $CD $0D $28
    and  $07                                      ; $73F0: $E6 $07
    add  $10                                      ; $73F2: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $73F4: $21 $20 $C3
    add  hl, bc                                   ; $73F7: $09
    ld   [hl], a                                  ; $73F8: $77
    call GetRandomByte                            ; $73F9: $CD $0D $28
    and  $07                                      ; $73FC: $E6 $07
    cp   $06                                      ; $73FE: $FE $06
    jr   c, jr_006_7409                           ; $7400: $38 $07

    ld   a, $0A                                   ; $7402: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $7404: $CD $AA $3B
    jr   jr_006_741F                              ; $7407: $18 $16

jr_006_7409:
    ld   e, a                                     ; $7409: $5F
    ld   d, b                                     ; $740A: $50
    ld   hl, Data_006_73D4                        ; $740B: $21 $D4 $73
    add  hl, de                                   ; $740E: $19
    ld   a, [hl]                                  ; $740F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7410: $21 $40 $C2
    add  hl, bc                                   ; $7413: $09
    ld   [hl], a                                  ; $7414: $77
    ld   hl, Data_006_73DA                        ; $7415: $21 $DA $73
    add  hl, de                                   ; $7418: $19
    ld   a, [hl]                                  ; $7419: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $741A: $21 $50 $C2
    add  hl, bc                                   ; $741D: $09
    ld   [hl], a                                  ; $741E: $77

jr_006_741F:
    xor  a                                        ; $741F: $AF
    jp   SetEntitySpriteVariant                   ; $7420: $C3 $0C $3B

func_006_7423::
    call AddEntityZSpeedToPos_06                  ; $7423: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7426: $21 $20 $C3
    add  hl, bc                                   ; $7429: $09
    dec  [hl]                                     ; $742A: $35
    ld   hl, wEntitiesPosZTable                   ; $742B: $21 $10 $C3
    add  hl, bc                                   ; $742E: $09
    ld   a, [hl]                                  ; $742F: $7E
    and  $80                                      ; $7430: $E6 $80
    ret  z                                        ; $7432: $C8

    xor  a                                        ; $7433: $AF
    ld   [hl], a                                  ; $7434: $77
    call IncrementEntityState                     ; $7435: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7438: $CD $05 $0C
    call GetRandomByte                            ; $743B: $CD $0D $28
    and  $0F                                      ; $743E: $E6 $0F
    add  $18                                      ; $7440: $C6 $18
    ld   [hl], a                                  ; $7442: $77
    jp   ClearEntitySpeed                         ; $7443: $C3 $7F $3D
