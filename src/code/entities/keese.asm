Data_006_6708::
    db   $42, $00, $42, $20, $40, $00, $40, $20   ; $6708

Data_006_6710::
    db   $62, $00, $62, $20, $60, $00, $60, $20

Data_006_6718::
    db   $00, $05, $0A, $0D

Data_006_671C::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

Data_006_672C::
    db   $0C, $04, $08, $00

KeeseEntityHandler::
    ld   de, Data_006_6708                        ; $6730: $11 $08 $67
    ldh  a, [hMapId]                              ; $6733: $F0 $F7
    cp   $0A                                      ; $6735: $FE $0A
    jr   nz, jr_006_673C                          ; $6737: $20 $03

    ld   de, Data_006_6710                        ; $6739: $11 $10 $67

jr_006_673C:
    call RenderActiveEntitySpritesPair            ; $673C: $CD $C0 $3B
    call func_006_64C6                            ; $673F: $CD $C6 $64
    call func_006_64F7                            ; $6742: $CD $F7 $64
    call label_3B39                               ; $6745: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $6748: $F0 $F0
    JP_TABLE                                      ; $674A
._00 dw KeeseRestingHandler
._01 dw KeeseFlyingHandler

KeeseRestingHandler::
    call GetEntityTransitionCountdown             ; $674F: $CD $05 $0C
    jp   nz, label_006_67E6                       ; $6752: $C2 $E6 $67

    call func_006_6594                            ; $6755: $CD $94 $65
    add  $20                                      ; $6758: $C6 $20
    cp   $40                                      ; $675A: $FE $40
    jp   nc, label_006_67E6                       ; $675C: $D2 $E6 $67

    call func_006_65A4                            ; $675F: $CD $A4 $65
    add  $20                                      ; $6762: $C6 $20
    cp   $40                                      ; $6764: $FE $40
    jp   nc, label_006_67E6                       ; $6766: $D2 $E6 $67

    call func_006_65B4                            ; $6769: $CD $B4 $65
    ld   d, $00                                   ; $676C: $16 $00
    ld   hl, Data_006_672C                        ; $676E: $21 $2C $67
    add  hl, de                                   ; $6771: $19
    ld   a, [hl]                                  ; $6772: $7E

jr_006_6773:
    ld   hl, wEntitiesPrivateState1Table          ; $6773: $21 $B0 $C2
    add  hl, bc                                   ; $6776: $09
    ld   [hl], a                                  ; $6777: $77
    call GetEntityTransitionCountdown             ; $6778: $CD $05 $0C
    call GetRandomByte                            ; $677B: $CD $0D $28
    and  $3F                                      ; $677E: $E6 $3F
    add  $50                                      ; $6780: $C6 $50
    ld   [hl], a                                  ; $6782: $77
    ld   hl, wEntitiesPrivateState2Table          ; $6783: $21 $C0 $C2
    add  hl, bc                                   ; $6786: $09
    ld   [hl], $01                                ; $6787: $36 $01
    call IncrementEntityState                     ; $6789: $CD $12 $3B
    jp   label_006_67E6                           ; $678C: $C3 $E6 $67

KeeseFlyingHandler::
    call func_006_6541                            ; $678F: $CD $41 $65
    call label_3B23                               ; $6792: $CD $23 $3B
    call GetEntityTransitionCountdown             ; $6795: $CD $05 $0C
    jr   nz, jr_006_67A2                          ; $6798: $20 $08

    ld   [hl], $20                                ; $679A: $36 $20
    call IncrementEntityState                     ; $679C: $CD $12 $3B
    ld   [hl], b                                  ; $679F: $70
    jr   label_006_67E6                           ; $67A0: $18 $44

jr_006_67A2:
    ld   hl, wEntitiesUnknownTableD               ; $67A2: $21 $D0 $C2
    add  hl, bc                                   ; $67A5: $09
    inc  [hl]                                     ; $67A6: $34
    ld   a, [hl]                                  ; $67A7: $7E
    cp   $0A                                      ; $67A8: $FE $0A
    jr   c, label_006_67E6                        ; $67AA: $38 $3A

    ld   [hl], b                                  ; $67AC: $70
    ld   hl, wEntitiesPrivateState2Table          ; $67AD: $21 $C0 $C2
    add  hl, bc                                   ; $67B0: $09
    ld   a, [hl]                                  ; $67B1: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $67B2: $21 $B0 $C2
    add  hl, bc                                   ; $67B5: $09
    add  [hl]                                     ; $67B6: $86
    and  $0F                                      ; $67B7: $E6 $0F
    ld   [hl], a                                  ; $67B9: $77
    ld   hl, wEntitiesPrivateState1Table          ; $67BA: $21 $B0 $C2
    add  hl, bc                                   ; $67BD: $09
    ld   e, [hl]                                  ; $67BE: $5E
    ld   d, b                                     ; $67BF: $50
    ld   hl, Data_006_6718                        ; $67C0: $21 $18 $67
    add  hl, de                                   ; $67C3: $19
    ld   a, [hl]                                  ; $67C4: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $67C5: $21 $50 $C2
    add  hl, bc                                   ; $67C8: $09
    ld   [hl], a                                  ; $67C9: $77
    ld   hl, Data_006_671C                        ; $67CA: $21 $1C $67
    add  hl, de                                   ; $67CD: $19
    ld   a, [hl]                                  ; $67CE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $67CF: $21 $40 $C2
    add  hl, bc                                   ; $67D2: $09
    ld   [hl], a                                  ; $67D3: $77
    call GetRandomByte                            ; $67D4: $CD $0D $28
    and  $1F                                      ; $67D7: $E6 $1F
    jr   nz, label_006_67E6                       ; $67D9: $20 $0B

    call GetRandomByte                            ; $67DB: $CD $0D $28
    and  $02                                      ; $67DE: $E6 $02
    dec  a                                        ; $67E0: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $67E1: $21 $C0 $C2
    add  hl, bc                                   ; $67E4: $09
    ld   [hl], a                                  ; $67E5: $77

label_006_67E6:
    ldh  a, [hActiveEntityState]                  ; $67E6: $F0 $F0
    and  a                                        ; $67E8: $A7
    jr   z, jr_006_67F2                           ; $67E9: $28 $07

    ldh  a, [hFrameCounter]                       ; $67EB: $F0 $E7
    rra                                           ; $67ED: $1F
    rra                                           ; $67EE: $1F
    rra                                           ; $67EF: $1F
    and  $01                                      ; $67F0: $E6 $01

jr_006_67F2:
    jp   SetEntitySpriteVariant                   ; $67F2: $C3 $0C $3B
