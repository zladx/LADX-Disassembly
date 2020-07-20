EntityInitDodongoSnake::
    ld   hl, wEntitiesLoadOrderTable              ; $6818: $21 $60 $C4
    add  hl, bc                                   ; $681B: $09
    ld   e, [hl]                                  ; $681C: $5E
    sla  e                                        ; $681D: $CB $23
    sla  e                                        ; $681F: $CB $23
    sla  e                                        ; $6821: $CB $23
    sla  e                                        ; $6823: $CB $23
    sla  e                                        ; $6825: $CB $23
    sla  e                                        ; $6827: $CB $23
    ld   d, b                                     ; $6829: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $682A: $21 $00 $D0
    add  hl, de                                   ; $682D: $19
    push de                                       ; $682E: $D5
    ld   e, $20                                   ; $682F: $1E $20

jr_005_6831:
    xor  a                                        ; $6831: $AF
    ld   [hl+], a                                 ; $6832: $22
    dec  e                                        ; $6833: $1D
    ld   a, e                                     ; $6834: $7B
    cp   $00                                      ; $6835: $FE $00
    jr   nz, jr_005_6831                          ; $6837: $20 $F8

    pop  de                                       ; $6839: $D1
    ld   hl, $D100                                ; $683A: $21 $00 $D1
    add  hl, de                                   ; $683D: $19
    ld   e, $20                                   ; $683E: $1E $20

jr_005_6840:
    xor  a                                        ; $6840: $AF
    ld   [hl+], a                                 ; $6841: $22
    dec  e                                        ; $6842: $1D
    ld   a, e                                     ; $6843: $7B
    cp   $00                                      ; $6844: $FE $00
    jr   nz, jr_005_6840                          ; $6846: $20 $F8

    ld   hl, wEntitiesSpeedYTable                 ; $6848: $21 $50 $C2
    add  hl, bc                                   ; $684B: $09
    ld   [hl], $06                                ; $684C: $36 $06
    call GetEntityTransitionCountdown             ; $684E: $CD $05 $0C
    ld   [hl], $40                                ; $6851: $36 $40
    call GetEntityPrivateCountdown1               ; $6853: $CD $00 $0C
    ld   [hl], $40                                ; $6856: $36 $40

func_005_6858::
    ld   hl, wEntitiesSpriteVariantTable          ; $6858: $21 $B0 $C3
    add  hl, bc                                   ; $685B: $09
    ld   [hl], $03                                ; $685C: $36 $03
    ret

Data_005_685F::
    db   $06, $FA, $00, $00

Data_005_6863::
    db   $00, $00, $FA, $06

Data_005_6867::
    db   $02, $01, $00, $01

Data_005_686B::
    db   $21, $22, $23, $22

DodongoSnakeEntityHandler::
    ldh  a, [hMapId]                              ; $686F: $F0 $F7
    cp   $07                                      ; $6871: $FE $07
    jr   nz, jr_005_6879                          ; $6873: $20 $04

    ld   a, $10                                   ; $6875: $3E $10
    ldh  [hActiveEntityTilesOffset], a            ; $6877: $E0 $F5

jr_005_6879:
    call func_005_6A38                            ; $6879: $CD $38 $6A
    call func_005_7A3A                            ; $687C: $CD $3A $7A
    call BossIntro                                ; $687F: $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ; $6882: $CD $56 $0C
    call label_3B39                               ; $6885: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $6888: $F0 $F0
    JP_TABLE                                      ; $688A
._00 dw func_005_6891                             ; $688B
._01 dw func_005_6957                             ; $688D
._02 dw func_005_69B1                             ; $688F

func_005_6891::
    call GetEntityTransitionCountdown             ; $6891: $CD $05 $0C
    jr   nz, jr_005_689B                          ; $6894: $20 $05

    ld   [hl], $00                                ; $6896: $36 $00
    call IncrementEntityState                     ; $6898: $CD $12 $3B

jr_005_689B:
    ld   hl, wEntitiesUnknowTableY                ; $689B: $21 $D0 $C3
    add  hl, bc                                   ; $689E: $09
    ld   a, [hl]                                  ; $689F: $7E
    inc  a                                        ; $68A0: $3C
    and  $3F                                      ; $68A1: $E6 $3F
    ld   [hl], a                                  ; $68A3: $77
    ldh  [hScratch0], a                           ; $68A4: $E0 $D7
    rra                                           ; $68A6: $1F
    rra                                           ; $68A7: $1F
    nop                                           ; $68A8: $00
    and  $03                                      ; $68A9: $E6 $03
    ld   e, a                                     ; $68AB: $5F
    ld   d, $00                                   ; $68AC: $16 $00
    ld   hl, Data_005_6867                        ; $68AE: $21 $67 $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $68B3: $21 $B0 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, Data_005_686B                        ; $68B8: $21 $6B $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $68BD: $21 $C0 $C2
    add  hl, bc                                   ; $68C0: $09
    ld   [hl], a                                  ; $68C1: $77
    ld   hl, wEntitiesLoadOrderTable              ; $68C2: $21 $60 $C4
    add  hl, bc                                   ; $68C5: $09
    ld   e, [hl]                                  ; $68C6: $5E
    sla  e                                        ; $68C7: $CB $23
    sla  e                                        ; $68C9: $CB $23
    sla  e                                        ; $68CB: $CB $23
    sla  e                                        ; $68CD: $CB $23
    sla  e                                        ; $68CF: $CB $23
    sla  e                                        ; $68D1: $CB $23
    ld   d, $00                                   ; $68D3: $16 $00
    push de                                       ; $68D5: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $68D6: $21 $00 $D0
    add  hl, de                                   ; $68D9: $19
    ldh  a, [hScratch0]                           ; $68DA: $F0 $D7
    ld   e, a                                     ; $68DC: $5F
    add  hl, de                                   ; $68DD: $19
    ldh  a, [hActiveEntityPosX]                   ; $68DE: $F0 $EE
    ld   [hl], a                                  ; $68E0: $77
    pop  de                                       ; $68E1: $D1
    ld   hl, $D100                                ; $68E2: $21 $00 $D1
    add  hl, de                                   ; $68E5: $19
    ldh  a, [hScratch0]                           ; $68E6: $F0 $D7
    ld   e, a                                     ; $68E8: $5F
    add  hl, de                                   ; $68E9: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $68EA: $F0 $EC
    ld   [hl], a                                  ; $68EC: $77
    call UpdateEntityPosWithSpeed_05              ; $68ED: $CD $B1 $7A
    call label_3B23                               ; $68F0: $CD $23 $3B
    ld   e, $0F                                   ; $68F3: $1E $0F
    ld   d, b                                     ; $68F5: $50

jr_005_68F6:
    ld   hl, wEntitiesStatusTable                 ; $68F6: $21 $80 $C2
    add  hl, de                                   ; $68F9: $19
    ld   a, [hl]                                  ; $68FA: $7E
    cp   $05                                      ; $68FB: $FE $05
    jr   nz, jr_005_6953                          ; $68FD: $20 $54

    ld   hl, wEntitiesTypeTable                   ; $68FF: $21 $A0 $C3
    add  hl, de                                   ; $6902: $19
    ld   a, [hl]                                  ; $6903: $7E
    cp   $02                                      ; $6904: $FE $02
    jr   nz, jr_005_6953                          ; $6906: $20 $4B

    ld   hl, wEntitiesTransitionCountdownTable    ; $6908: $21 $E0 $C2
    add  hl, de                                   ; $690B: $19
    ld   a, [hl]                                  ; $690C: $7E
    cp   $38                                      ; $690D: $FE $38
    jr   c, jr_005_6953                           ; $690F: $38 $42

    ld   hl, wEntitiesPosXTable                   ; $6911: $21 $00 $C2
    add  hl, de                                   ; $6914: $19
    ldh  a, [hActiveEntityPosX]                   ; $6915: $F0 $EE
    sub  [hl]                                     ; $6917: $96
    add  $06                                      ; $6918: $C6 $06
    cp   $0C                                      ; $691A: $FE $0C
    jr   nc, jr_005_6953                          ; $691C: $30 $35

    ld   hl, wEntitiesPosYTable                   ; $691E: $21 $10 $C2
    add  hl, de                                   ; $6921: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $6922: $F0 $EC
    sub  [hl]                                     ; $6924: $96
    add  $06                                      ; $6925: $C6 $06
    cp   $0C                                      ; $6927: $FE $0C
    jr   nc, jr_005_6953                          ; $6929: $30 $28

    ld   hl, wEntitiesPosZTable                   ; $692B: $21 $10 $C3
    add  hl, de                                   ; $692E: $19
    ld   a, [hl]                                  ; $692F: $7E
    and  a                                        ; $6930: $A7
    jr   nz, jr_005_6953                          ; $6931: $20 $20

    ld   hl, wEntitiesStatusTable                 ; $6933: $21 $80 $C2
    add  hl, de                                   ; $6936: $19
    ld   [hl], b                                  ; $6937: $70
    call IncrementEntityState                     ; $6938: $CD $12 $3B
    ld   [hl], $02                                ; $693B: $36 $02
    ld   hl, wEntitiesPrivateCountdown2Table      ; $693D: $21 $00 $C3
    add  hl, bc                                   ; $6940: $09
    ld   [hl], $60                                ; $6941: $36 $60
    ld   hl, wEntitiesFlashCountdownTable         ; $6943: $21 $20 $C4
    add  hl, bc                                   ; $6946: $09
    ld   [hl], $0C                                ; $6947: $36 $0C
    ld   hl, wEntitiesUnknowTableP                ; $6949: $21 $40 $C4
    add  hl, bc                                   ; $694C: $09
    inc  [hl]                                     ; $694D: $34
    ld   a, JINGLE_DODONGO_EAT_BOMB               ; $694E: $3E $2A
    ldh  [hJingle], a                             ; $6950: $E0 $F2
    ret                                           ; $6952: $C9

jr_005_6953:
    dec  e                                        ; $6953: $1D
    jr   nz, jr_005_68F6                          ; $6954: $20 $A0

    ret                                           ; $6956: $C9

func_005_6957::
    call GetEntityTransitionCountdown             ; $6957: $CD $05 $0C
    jr   nz, jr_005_69A0                          ; $695A: $20 $44

    call GetRandomByte                            ; $695C: $CD $0D $28
    and  $1F                                      ; $695F: $E6 $1F
    add  $40                                      ; $6961: $C6 $40
    ld   [hl], a                                  ; $6963: $77
    call IncrementEntityState                     ; $6964: $CD $12 $3B
    ld   [hl], b                                  ; $6967: $70
    ld   hl, wEntitiesUnknownTableD               ; $6968: $21 $D0 $C2
    add  hl, bc                                   ; $696B: $09
    ld   a, [hl]                                  ; $696C: $7E
    inc  a                                        ; $696D: $3C
    and  $03                                      ; $696E: $E6 $03
    ld   [hl], a                                  ; $6970: $77
    jr   nz, jr_005_6978                          ; $6971: $20 $05

    call func_005_7B24                            ; $6973: $CD $24 $7B
    jr   jr_005_697E                              ; $6976: $18 $06

jr_005_6978:
    call GetRandomByte                            ; $6978: $CD $0D $28
    and  $03                                      ; $697B: $E6 $03
    ld   e, a                                     ; $697D: $5F

jr_005_697E:
    ld   hl, hActiveEntitySpriteVariant           ; $697E: $21 $F1 $FF
    xor  [hl]                                     ; $6981: $AE
    and  $02                                      ; $6982: $E6 $02
    jr   z, jr_005_6978                           ; $6984: $28 $F2

    ld   d, b                                     ; $6986: $50
    ld   hl, wEntitiesSpriteVariantTable          ; $6987: $21 $B0 $C3
    add  hl, bc                                   ; $698A: $09
    ld   [hl], e                                  ; $698B: $73
    ld   hl, Data_005_685F                        ; $698C: $21 $5F $68
    add  hl, de                                   ; $698F: $19
    ld   a, [hl]                                  ; $6990: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6991: $21 $40 $C2
    add  hl, bc                                   ; $6994: $09
    ld   [hl], a                                  ; $6995: $77
    ld   hl, Data_005_6863                        ; $6996: $21 $63 $68
    add  hl, de                                   ; $6999: $19
    ld   a, [hl]                                  ; $699A: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $699B: $21 $50 $C2
    add  hl, bc                                   ; $699E: $09
    ld   [hl], a                                  ; $699F: $77

jr_005_69A0:
    ret                                           ; $69A0: $C9

Data_005_69A1::
    db   $F3, $0D, $00, $00

Data_005_69A5::
    db   $00, $00, $0D, $F3

Data_005_69A9::
    db   $0C, $F4, $00, $00

Data_005_69AD::
    db   $00, $00, $F4, $0C

func_005_69B1::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $69B1: $21 $00 $C3
    add  hl, bc                                   ; $69B4: $09
    ld   a, [hl]                                  ; $69B5: $7E
    and  a                                        ; $69B6: $A7
    jr   nz, jr_005_69C4                          ; $69B7: $20 $0B

    call GetEntityTransitionCountdown             ; $69B9: $CD $05 $0C
    ld   [hl], $30                                ; $69BC: $36 $30
    call IncrementEntityState                     ; $69BE: $CD $12 $3B
    ld   [hl], $01                                ; $69C1: $36 $01
    ret                                           ; $69C3: $C9

jr_005_69C4:
    cp   $24                                      ; $69C4: $FE $24
    jr   nz, jr_005_69CB                          ; $69C6: $20 $03

    call PlayBombExplosionSfx                     ; $69C8: $CD $4B $0C

jr_005_69CB:
    cp   $04                                      ; $69CB: $FE $04
    jr   nz, jr_005_69EB                          ; $69CD: $20 $1C

    ldh  a, [hActiveEntitySpriteVariant]          ; $69CF: $F0 $F1
    ld   e, a                                     ; $69D1: $5F
    ld   d, b                                     ; $69D2: $50
    ld   hl, Data_005_69A9                        ; $69D3: $21 $A9 $69
    add  hl, de                                   ; $69D6: $19
    ldh  a, [hActiveEntityPosX]                   ; $69D7: $F0 $EE
    add  [hl]                                     ; $69D9: $86
    ldh  [hScratch0], a                           ; $69DA: $E0 $D7
    ld   hl, Data_005_69AD                        ; $69DC: $21 $AD $69
    add  hl, de                                   ; $69DF: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $69E0: $F0 $EC
    add  [hl]                                     ; $69E2: $86
    ldh  [hScratch1], a                           ; $69E3: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $69E5: $3E $02
    call AddTranscientVfx                         ; $69E7: $CD $C7 $0C
    xor  a                                        ; $69EA: $AF

jr_005_69EB:
    cp   $20                                      ; $69EB: $FE $20
    ret  nz                                       ; $69ED: $C0

    ld   hl, wEntitiesUnknowTableP                ; $69EE: $21 $40 $C4
    add  hl, bc                                   ; $69F1: $09
    ld   a, [hl]                                  ; $69F2: $7E
    cp   $03                                      ; $69F3: $FE $03
    ret  nz                                       ; $69F5: $C0

    ld   a, ENTITY_BOMB                           ; $69F6: $3E $02
    call SpawnNewEntity_trampoline                ; $69F8: $CD $86 $3B
    ret  c                                        ; $69FB: $D8

    ld   hl, wEntitiesTransitionCountdownTable    ; $69FC: $21 $E0 $C2
    add  hl, de                                   ; $69FF: $19
    ld   [hl], $17                                ; $6A00: $36 $17
    push bc                                       ; $6A02: $C5
    ld   hl, wEntitiesSpriteVariantTable          ; $6A03: $21 $B0 $C3
    add  hl, bc                                   ; $6A06: $09
    ld   c, [hl]                                  ; $6A07: $4E
    ld   hl, Data_005_69A1                        ; $6A08: $21 $A1 $69
    add  hl, bc                                   ; $6A0B: $09
    ldh  a, [hScratch0]                           ; $6A0C: $F0 $D7
    add  [hl]                                     ; $6A0E: $86
    ld   hl, wEntitiesPosXTable                   ; $6A0F: $21 $00 $C2
    add  hl, de                                   ; $6A12: $19
    ld   [hl], a                                  ; $6A13: $77
    ld   hl, Data_005_69A5                        ; $6A14: $21 $A5 $69
    add  hl, bc                                   ; $6A17: $09
    ldh  a, [hScratch1]                           ; $6A18: $F0 $D8
    add  [hl]                                     ; $6A1A: $86
    ld   hl, wEntitiesPosYTable                   ; $6A1B: $21 $10 $C2
    add  hl, de                                   ; $6A1E: $19
    ld   [hl], a                                  ; $6A1F: $77
    pop  bc                                       ; $6A20: $C1
    jp   label_005_7E9D                           ; $6A21: $C3 $9D $7E

Data_005_6A24::
    db   $66, $23, $64, $23, $64, $03, $66, $03, $62, $03, $62, $23, $60, $03, $60, $23
    db   $68, $03, $68, $23

func_005_6A38::
    call GetEntityPrivateCountdown1               ; $6A38: $CD $00 $0C
    ld   hl, wRoomTransitionState                 ; $6A3B: $21 $24 $C1
    or   [hl]                                     ; $6A3E: $B6
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6A3F: $21 $00 $C3
    add  hl, bc                                   ; $6A42: $09
    or   [hl]                                     ; $6A43: $B6
    jp   nz, label_005_6C77                       ; $6A44: $C2 $77 $6C

    ldh  a, [hActiveEntitySpriteVariant]          ; $6A47: $F0 $F1
    cp   $02                                      ; $6A49: $FE $02
    jr   nz, jr_005_6A56                          ; $6A4B: $20 $09

    call func_005_6AA5                            ; $6A4D: $CD $A5 $6A
    call func_005_6A5F                            ; $6A50: $CD $5F $6A
    jp   CopyEntityPositionToActivePosition       ; $6A53: $C3 $8A $3D

jr_005_6A56:
    call func_005_6A5F                            ; $6A56: $CD $5F $6A
    call func_005_6AA5                            ; $6A59: $CD $A5 $6A
    jp   CopyEntityPositionToActivePosition       ; $6A5C: $C3 $8A $3D

func_005_6A5F::
    ld   hl, wEntitiesUnknowTableY                ; $6A5F: $21 $D0 $C3
    add  hl, bc                                   ; $6A62: $09
    ld   a, [hl]                                  ; $6A63: $7E
    ldh  [hScratch0], a                           ; $6A64: $E0 $D7
    push bc                                       ; $6A66: $C5
    ld   hl, wEntitiesLoadOrderTable              ; $6A67: $21 $60 $C4
    add  hl, bc                                   ; $6A6A: $09
    ld   e, [hl]                                  ; $6A6B: $5E
    ld   hl, wEntitiesPrivateState1Table          ; $6A6C: $21 $B0 $C2
    add  hl, bc                                   ; $6A6F: $09
    ld   c, [hl]                                  ; $6A70: $4E
    sla  e                                        ; $6A71: $CB $23
    sla  e                                        ; $6A73: $CB $23
    sla  e                                        ; $6A75: $CB $23
    sla  e                                        ; $6A77: $CB $23
    sla  e                                        ; $6A79: $CB $23
    sla  e                                        ; $6A7B: $CB $23
    ld   d, b                                     ; $6A7D: $50
    push de                                       ; $6A7E: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $6A7F: $21 $00 $D0
    add  hl, de                                   ; $6A82: $19
    ldh  a, [hScratch0]                           ; $6A83: $F0 $D7
    sub  c                                        ; $6A85: $91
    and  $3F                                      ; $6A86: $E6 $3F
    ld   e, a                                     ; $6A88: $5F
    ld   d, b                                     ; $6A89: $50
    add  hl, de                                   ; $6A8A: $19
    ld   a, [hl]                                  ; $6A8B: $7E
    ldh  [hActiveEntityPosX], a                   ; $6A8C: $E0 $EE
    pop  de                                       ; $6A8E: $D1
    ld   hl, $D100                                ; $6A8F: $21 $00 $D1
    add  hl, de                                   ; $6A92: $19
    ldh  a, [hScratch0]                           ; $6A93: $F0 $D7
    sub  c                                        ; $6A95: $91
    and  $3F                                      ; $6A96: $E6 $3F
    ld   e, a                                     ; $6A98: $5F
    ld   d, b                                     ; $6A99: $50
    add  hl, de                                   ; $6A9A: $19
    ld   a, [hl]                                  ; $6A9B: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6A9C: $E0 $EC
    pop  bc                                       ; $6A9E: $C1
    ld   de, Data_005_6A24                        ; $6A9F: $11 $24 $6A
    jp   RenderActiveEntitySpritesPair                ; $6AA2: $C3 $C0 $3B

func_005_6AA5::
    ld   hl, wEntitiesUnknowTableY                ; $6AA5: $21 $D0 $C3
    add  hl, bc                                   ; $6AA8: $09
    ld   a, [hl]                                  ; $6AA9: $7E
    ldh  [hScratch0], a                           ; $6AAA: $E0 $D7
    push bc                                       ; $6AAC: $C5
    ld   hl, wEntitiesLoadOrderTable              ; $6AAD: $21 $60 $C4
    add  hl, bc                                   ; $6AB0: $09
    ld   e, [hl]                                  ; $6AB1: $5E
    ld   hl, wEntitiesPrivateState2Table          ; $6AB2: $21 $C0 $C2
    add  hl, bc                                   ; $6AB5: $09
    ld   c, [hl]                                  ; $6AB6: $4E
    sla  e                                        ; $6AB7: $CB $23
    sla  e                                        ; $6AB9: $CB $23
    sla  e                                        ; $6ABB: $CB $23
    sla  e                                        ; $6ABD: $CB $23
    sla  e                                        ; $6ABF: $CB $23
    sla  e                                        ; $6AC1: $CB $23
    ld   d, b                                     ; $6AC3: $50
    push de                                       ; $6AC4: $D5
    ld   hl, wIsFileSelectionArrowShifted         ; $6AC5: $21 $00 $D0
    add  hl, de                                   ; $6AC8: $19
    ldh  a, [hScratch0]                           ; $6AC9: $F0 $D7
    sub  c                                        ; $6ACB: $91
    and  $3F                                      ; $6ACC: $E6 $3F
    ld   e, a                                     ; $6ACE: $5F
    ld   d, b                                     ; $6ACF: $50
    add  hl, de                                   ; $6AD0: $19
    ld   a, [hl]                                  ; $6AD1: $7E
    ldh  [hActiveEntityPosX], a                   ; $6AD2: $E0 $EE
    pop  de                                       ; $6AD4: $D1
    ld   hl, $D100                                ; $6AD5: $21 $00 $D1
    add  hl, de                                   ; $6AD8: $19
    ldh  a, [hScratch0]                           ; $6AD9: $F0 $D7
    sub  c                                        ; $6ADB: $91
    and  $3F                                      ; $6ADC: $E6 $3F
    ld   e, a                                     ; $6ADE: $5F
    ld   d, b                                     ; $6ADF: $50
    add  hl, de                                   ; $6AE0: $19
    ld   a, [hl]                                  ; $6AE1: $7E
    ldh  [hActiveEntityVisualPosY], a             ; $6AE2: $E0 $EC
    pop  bc                                       ; $6AE4: $C1
    ld   a, $04                                   ; $6AE5: $3E $04
    ldh  [hActiveEntitySpriteVariant], a          ; $6AE7: $E0 $F1
    ld   de, Data_005_6A24                        ; $6AE9: $11 $24 $6A
    call RenderActiveEntitySpritesPair            ; $6AEC: $CD $C0 $3B
    ld   hl, wEntitiesSpriteVariantTable          ; $6AEF: $21 $B0 $C3
    add  hl, bc                                   ; $6AF2: $09
    ld   a, [hl]                                  ; $6AF3: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $6AF4: $E0 $F1
    ret                                           ; $6AF6: $C9

Data_005_6AF7::
    db   $00, $00, $66, $20
    db   $00, $08, $64, $20
    db   $00, $F3, $68, $00
    db   $00, $FB, $68, $20
    db   $00, $00, $64, $00
    db   $00, $08, $66, $00
    db   $00, $0D, $68, $00
    db   $00, $15, $68, $20
    db   $00, $00, $62, $00
    db   $00, $08, $62, $20
    db   $0D, $00, $68, $00
    db   $0D, $08, $68, $20
    db   $00, $00, $60, $00
    db   $00, $08, $60, $20
    db   $F3, $00, $68, $00
    db   $F3, $08, $68, $20

Data_005_6B37::
    db   $00, $04, $66, $20, $00, $0C, $64, $20
    db   $F8, $EC, $6C, $00, $F8, $F4, $6A, $00
    db   $F8, $FC, $6A, $20, $F8, $04, $6C, $20
    db   $08, $EC, $6C, $40, $08, $F4, $6E, $40
    db   $08, $FC, $6E, $60, $08, $04, $6C, $60
    db   $00, $FC, $64, $00, $00, $04, $66, $00
    db   $F8, $04, $6C, $00, $F8, $0C, $6A, $00
    db   $F8, $14, $6A, $20, $F8, $1C, $6C, $20
    db   $08, $04, $6C, $40, $08, $0C, $6E, $40
    db   $08, $14, $6E, $60, $08, $1C, $6C, $60
    db   $04, $F8, $6C, $00, $04, $00, $6A, $00
    db   $04, $08, $6A, $20, $04, $10, $6C, $20
    db   $14, $F8, $6C, $40, $14, $00, $6E, $40
    db   $14, $08, $6E, $60, $14, $10, $6C, $60
    db   $FC, $00, $62, $00, $FC, $08, $62, $20
    db   $04, $00, $60, $00, $04, $08, $60, $20
    db   $EC, $F8, $6C, $00, $EC, $00, $6A, $00
    db   $EC, $08, $6A, $20, $EC, $10, $6C, $20
    db   $FC, $F8, $6C, $40, $FC, $00, $6E, $40
    db   $FC, $08, $6E, $60, $FC, $10, $6C, $60

Data_005_6BD7::
    db   $00, $02, $66, $20, $00, $0A, $64, $20
    db   $FB, $EF, $6C, $00, $FB, $F7, $6E, $00
    db   $FB, $F9, $6E, $20, $FB, $01, $6C, $20
    db   $05, $EF, $6C, $40, $05, $F7, $6E, $40
    db   $05, $F9, $6E, $60, $05, $01, $6C, $60
    db   $00, $FE, $64, $00, $00, $02, $66, $00
    db   $FB, $07, $6C, $00, $FB, $0F, $6E, $00
    db   $FB, $11, $6E, $20, $FB, $19, $6C, $20
    db   $05, $07, $6C, $40, $05, $0F, $6E, $40
    db   $05, $11, $6E, $60, $05, $19, $6C, $60
    db   $07, $FB, $6C, $00, $07, $03, $6E, $00
    db   $07, $05, $6E, $20, $07, $0D, $6C, $20
    db   $11, $FB, $6C, $40, $11, $03, $6E, $40
    db   $11, $05, $6E, $60, $11, $0D, $6C, $60
    db   $FE, $00, $62, $00, $FE, $08, $62, $20
    db   $02, $00, $60, $00, $02, $08, $60, $20
    db   $EF, $FB, $6C, $00, $EF, $03, $6E, $00
    db   $EF, $05, $6E, $20, $EF, $0D, $6C, $20
    db   $F9, $FB, $6C, $40, $F9, $03, $6E, $40
    db   $F9, $05, $6E, $60, $F9, $0D, $6C, $60

label_005_6C77:
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6C77: $21 $00 $C3
    add  hl, bc                                   ; $6C7A: $09
    ld   a, [hl]                                  ; $6C7B: $7E
    cp   $08                                      ; $6C7C: $FE $08
    jr   c, jr_005_6CAE                           ; $6C7E: $38 $2E

    cp   $28                                      ; $6C80: $FE $28
    jr   nc, jr_005_6CAE                          ; $6C82: $30 $2A

    ld   hl, Data_005_6BD7                        ; $6C84: $21 $D7 $6B
    cp   $0E                                      ; $6C87: $FE $0E
    jr   c, jr_005_6C92                           ; $6C89: $38 $07

    cp   $22                                      ; $6C8B: $FE $22
    jr   nc, jr_005_6C92                          ; $6C8D: $30 $03

    ld   hl, Data_005_6B37                        ; $6C8F: $21 $37 $6B

jr_005_6C92:
    ldh  a, [hActiveEntitySpriteVariant]          ; $6C92: $F0 $F1
    ld   e, a                                     ; $6C94: $5F
    ld   d, b                                     ; $6C95: $50
    sla  e                                        ; $6C96: $CB $23
    sla  e                                        ; $6C98: $CB $23
    sla  e                                        ; $6C9A: $CB $23
    ld   a, e                                     ; $6C9C: $7B
    sla  e                                        ; $6C9D: $CB $23
    sla  e                                        ; $6C9F: $CB $23
    add  e                                        ; $6CA1: $83
    ld   e, a                                     ; $6CA2: $5F
    add  hl, de                                   ; $6CA3: $19
    ld   c, $0A                                   ; $6CA4: $0E $0A
    call RenderActiveEntitySpritesRect            ; $6CA6: $CD $E6 $3C
    ld   a, $08                                   ; $6CA9: $3E $08
    jp   label_3DA0                               ; $6CAB: $C3 $A0 $3D

jr_005_6CAE:
    ldh  a, [hActiveEntitySpriteVariant]          ; $6CAE: $F0 $F1
    rla                                           ; $6CB0: $17
    rla                                           ; $6CB1: $17
    rla                                           ; $6CB2: $17
    rla                                           ; $6CB3: $17
    and  $F0                                      ; $6CB4: $E6 $F0
    ld   e, a                                     ; $6CB6: $5F
    ld   d, b                                     ; $6CB7: $50
    ld   hl, Data_005_6AF7                        ; $6CB8: $21 $F7 $6A
    add  hl, de                                   ; $6CBB: $19
    ld   c, $04                                   ; $6CBC: $0E $04
    call RenderActiveEntitySpritesRect            ; $6CBE: $CD $E6 $3C
    ld   a, $02                                   ; $6CC1: $3E $02
    jp   label_3DA0                               ; $6CC3: $C3 $A0 $3D
