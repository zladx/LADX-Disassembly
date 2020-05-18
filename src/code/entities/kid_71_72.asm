Data_006_604D::
    db   $70, $00, $72, $00, $72, $20, $70, $20, $74, $00, $76, $00, $76, $20, $74, $20

Data_006_605D::
    db   $70, $02, $72, $02, $72, $22, $70, $22, $74, $02, $76, $02, $76, $22, $74, $22

Data_006_606D::
    db   $78, $02, $7A, $02, $7C, $02, $7E, $02, $7A, $20, $78, $20, $7E, $20, $7C, $20

Data_006_607D::
    db   $3E, $00

Kid71EntityHandler::
Kid72EntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $607F: $21 $B0 $C2
    add  hl, bc                                   ; $6082: $09
    ld   a, [hl]                                  ; $6083: $7E
    and  a                                        ; $6084: $A7
    jr   z, jr_006_60A2                           ; $6085: $28 $1B

    ld   de, Data_006_607D                        ; $6087: $11 $7D $60
    call RenderActiveEntitySprite                 ; $608A: $CD $77 $3C
    call func_006_64C6                            ; $608D: $CD $C6 $64
    call func_006_6541                            ; $6090: $CD $41 $65
    call func_006_657A                            ; $6093: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6096: $21 $20 $C3
    add  hl, bc                                   ; $6099: $09
    dec  [hl]                                     ; $609A: $35
    call GetEntityTransitionCountdown             ; $609B: $CD $05 $0C
    jp   z, ClearEntityStatus_06                  ; $609E: $CA $DB $65

    ret                                           ; $60A1: $C9

jr_006_60A2:
    ld   a, [wIsBowWowFollowingLink]              ; $60A2: $FA $56 $DB
    cp   $80                                      ; $60A5: $FE $80
    jp   nz, label_006_6170                       ; $60A7: $C2 $70 $61

    ld   a, [wGameplayType]                       ; $60AA: $FA $95 $DB
    cp   $01                                      ; $60AD: $FE $01
    jp   z, label_006_6170                        ; $60AF: $CA $70 $61

    ld   de, Data_006_604D                        ; $60B2: $11 $4D $60
    ld   hl, wEntitiesTypeTable                   ; $60B5: $21 $A0 $C3
    add  hl, bc                                   ; $60B8: $09
    ld   a, [hl]                                  ; $60B9: $7E
    cp   $72                                      ; $60BA: $FE $72

jr_006_60BC:
    jr   nz, jr_006_60C1                          ; $60BC: $20 $03

    ld   de, Data_006_605D                        ; $60BE: $11 $5D $60

jr_006_60C1:
    call RenderActiveEntitySpritesPair            ; $60C1: $CD $C0 $3B

jr_006_60C4:
    call func_006_65A4                            ; $60C4: $CD $A4 $65
    ld   a, e                                     ; $60C7: $7B
    dec  a                                        ; $60C8: $3D
    and  $02                                      ; $60C9: $E6 $02
    xor  $02                                      ; $60CB: $EE $02
    ld   e, a                                     ; $60CD: $5F

jr_006_60CE:
    ldh  a, [hFrameCounter]                       ; $60CE: $F0 $E7

jr_006_60D0:
    rra                                           ; $60D0: $1F
    rra                                           ; $60D1: $1F
    rra                                           ; $60D2: $1F
    and  $01                                      ; $60D3: $E6 $01
    add  e                                        ; $60D5: $83
    call SetEntitySpriteVariant                   ; $60D6: $CD $0C $3B
    ld   hl, wEntitiesUnknownTableD               ; $60D9: $21 $D0 $C2
    add  hl, bc                                   ; $60DC: $09
    ld   a, [hl]                                  ; $60DD: $7E
    JP_TABLE                                      ; $60DE
._00 dw func_006_60E5                             ; $60DF
._01 dw func_006_60FD                             ; $60E1
._02 dw func_006_6134                             ; $60E3

func_006_60E5::
    call func_006_64C6                            ; $60E5: $CD $C6 $64
    ld   hl, wEntitiesPrivateState2Table          ; $60E8: $21 $C0 $C2
    add  hl, bc                                   ; $60EB: $09
    ld   [hl], $30                                ; $60EC: $36 $30
    ld   a, $0E                                   ; $60EE: $3E $0E

jr_006_60F0:
    ld   [wMusicTrackToPlay], a                   ; $60F0: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $60F3: $E0 $B0
    ldh  [$FFBD], a                               ; $60F5: $E0 $BD

label_006_60F7:
    ld   hl, wEntitiesUnknownTableD               ; $60F7: $21 $D0 $C2
    add  hl, bc                                   ; $60FA: $09
    inc  [hl]                                     ; $60FB: $34
    ret                                           ; $60FC: $C9

func_006_60FD::
    call func_006_64C6                            ; $60FD: $CD $C6 $64
    call func_006_65A4                            ; $6100: $CD $A4 $65
    add  $20                                      ; $6103: $C6 $20
    cp   $40                                      ; $6105: $FE $40
    jr   c, jr_006_6110                           ; $6107: $38 $07

    ld   hl, wEntitiesPrivateState2Table          ; $6109: $21 $C0 $C2
    add  hl, bc                                   ; $610C: $09
    dec  [hl]                                     ; $610D: $35
    jr   nz, jr_006_6124                          ; $610E: $20 $14

jr_006_6110:
    ld   a, [wTransitionSequenceCounter]          ; $6110: $FA $6B $C1
    cp   $04                                      ; $6113: $FE $04
    ret  nz                                       ; $6115: $C0

    ldh  a, [hActiveEntityType]                   ; $6116: $F0 $EB
    cp   ENTITY_KID_71                            ; $6118: $FE $71
    jr   nz, .kid71End                            ; $611A: $20 $05

    call_open_dialog $220                         ; $611C
.kid71End

    jp   label_006_60F7                           ; $6121: $C3 $F7 $60

jr_006_6124:
    ld   a, $08                                   ; $6124: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6126: $CD $AA $3B
    call func_006_6541                            ; $6129: $CD $41 $65
    ld   a, $02                                   ; $612C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $612E: $E0 $A1
    ld   [wC167], a                               ; $6130: $EA $67 $C1
    ret                                           ; $6133: $C9

func_006_6134::
    xor  a                                        ; $6134: $AF
    ld   [wC167], a                               ; $6135: $EA $67 $C1
    ldh  a, [hActiveEntityPosY]                   ; $6138: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $613A: $E0 $EC
    call func_006_641A                            ; $613C: $CD $1A $64
    call CopyEntityPositionToActivePosition       ; $613F: $CD $8A $3D
    call func_006_645D                            ; $6142: $CD $5D $64
    jr   nc, jr_006_614C                          ; $6145: $30 $05

    call_open_dialog $220                         ; $6147

jr_006_614C:
    call func_006_657A                            ; $614C: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $614F: $21 $20 $C3
    add  hl, bc                                   ; $6152: $09
    dec  [hl]                                     ; $6153: $35
    dec  [hl]                                     ; $6154: $35
    ld   hl, wEntitiesPosZTable                   ; $6155: $21 $10 $C3
    add  hl, bc                                   ; $6158: $09
    ld   a, [hl]                                  ; $6159: $7E
    and  a                                        ; $615A: $A7
    jr   z, jr_006_6161                           ; $615B: $28 $04

    and  $80                                      ; $615D: $E6 $80
    jr   z, jr_006_616F                           ; $615F: $28 $0E

jr_006_6161:
    ld   [hl], b                                  ; $6161: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6162: $21 $20 $C3
    add  hl, bc                                   ; $6165: $09
    ld   [hl], b                                  ; $6166: $70
    ldh  a, [hFrameCounter]                       ; $6167: $F0 $E7
    and  $1F                                      ; $6169: $E6 $1F
    jr   nz, jr_006_616F                          ; $616B: $20 $02

    ld   [hl], $10                                ; $616D: $36 $10

jr_006_616F:
    ret                                           ; $616F: $C9

label_006_6170:
    ld   hl, wEntitiesDirectionTable              ; $6170: $21 $80 $C3
    add  hl, bc                                   ; $6173: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6174: $F0 $F1
    or   [hl]                                     ; $6176: $B6
    ldh  [hActiveEntitySpriteVariant], a          ; $6177: $E0 $F1
    ld   de, Data_006_606D                        ; $6179: $11 $6D $60
    call RenderActiveEntitySpritesPair            ; $617C: $CD $C0 $3B
    call func_006_64C6                            ; $617F: $CD $C6 $64
    call func_006_6230                            ; $6182: $CD $30 $62
    call func_006_657A                            ; $6185: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6188: $21 $20 $C3
    add  hl, bc                                   ; $618B: $09
    dec  [hl]                                     ; $618C: $35
    ld   hl, wEntitiesPosZTable                   ; $618D: $21 $10 $C3
    add  hl, bc                                   ; $6190: $09
    ld   a, [hl]                                  ; $6191: $7E
    and  $80                                      ; $6192: $E6 $80
    ldh  [hFFE8], a                               ; $6194: $E0 $E8
    jr   z, jr_006_619F                           ; $6196: $28 $07

    xor  a                                        ; $6198: $AF
    ld   [hl], a                                  ; $6199: $77
    ld   hl, wEntitiesSpeedZTable                 ; $619A: $21 $20 $C3
    add  hl, bc                                   ; $619D: $09
    ld   [hl], a                                  ; $619E: $77

jr_006_619F:
    ldh  a, [hActiveEntityState]                  ; $619F: $F0 $F0
    JP_TABLE                                      ; $61A1
._00 dw func_006_61A6                             ; $61A2
._01 dw func_006_61EC                             ; $61A4

func_006_61A6::
    call GetEntityTransitionCountdown             ; $61A6: $CD $05 $0C
    jr   nz, jr_006_61EB                          ; $61A9: $20 $40

    ld   [hl], $80                                ; $61AB: $36 $80
    call IncrementEntityState                     ; $61AD: $CD $12 $3B
    ld   a, $01                                   ; $61B0: $3E $01
    call SetEntitySpriteVariant                   ; $61B2: $CD $0C $3B
    ld   a, $71                                   ; $61B5: $3E $71
    call SpawnNewEntity_trampoline                ; $61B7: $CD $86 $3B
    jr   c, jr_006_61EB                           ; $61BA: $38 $2F

    ldh  a, [hScratch0]                           ; $61BC: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $61BE: $21 $00 $C2
    add  hl, de                                   ; $61C1: $19
    ld   [hl], a                                  ; $61C2: $77
    ldh  a, [hScratch1]                           ; $61C3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $61C5: $21 $10 $C2
    add  hl, de                                   ; $61C8: $19
    ld   [hl], a                                  ; $61C9: $77
    ld   hl, wEntitiesPrivateState1Table          ; $61CA: $21 $B0 $C2
    add  hl, de                                   ; $61CD: $19
    ld   [hl], $01                                ; $61CE: $36 $01
    ld   hl, wEntitiesSpeedZTable                 ; $61D0: $21 $20 $C3
    add  hl, de                                   ; $61D3: $19
    ld   [hl], $10                                ; $61D4: $36 $10
    ldh  a, [hActiveEntityType]                   ; $61D6: $F0 $EB
    cp   ENTITY_KID_71                            ; $61D8: $FE $71
    ld   a, $14                                   ; $61DA: $3E $14
    jr   z, jr_006_61E0                           ; $61DC: $28 $02

    ld   a, $EC                                   ; $61DE: $3E $EC

jr_006_61E0:
    ld   hl, wEntitiesSpeedXTable                 ; $61E0: $21 $40 $C2
    add  hl, de                                   ; $61E3: $19
    ld   [hl], a                                  ; $61E4: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $61E5: $21 $E0 $C2
    add  hl, de                                   ; $61E8: $19
    ld   [hl], $24                                ; $61E9: $36 $24

jr_006_61EB:
    ret                                           ; $61EB: $C9

func_006_61EC::
    call GetEntityTransitionCountdown             ; $61EC: $CD $05 $0C
    jr   nz, jr_006_61F8                          ; $61EF: $20 $07

    ld   [hl], $60                                ; $61F1: $36 $60
    call IncrementEntityState                     ; $61F3: $CD $12 $3B
    ld   [hl], b                                  ; $61F6: $70
    ret                                           ; $61F7: $C9

jr_006_61F8:
    cp   $60                                      ; $61F8: $FE $60
    ret  nc                                       ; $61FA: $D0

    cp   $40                                      ; $61FB: $FE $40
    jr   nc, jr_006_620A                          ; $61FD: $30 $0B

    ldh  a, [hFFE8]                               ; $61FF: $F0 $E8
    and  a                                        ; $6201: $A7
    jr   z, jr_006_620A                           ; $6202: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6204: $21 $20 $C3
    add  hl, bc                                   ; $6207: $09
    ld   [hl], $08                                ; $6208: $36 $08

jr_006_620A:
    xor  a                                        ; $620A: $AF
    jp   SetEntitySpriteVariant                   ; $620B: $C3 $0C $3B
