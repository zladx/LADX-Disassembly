Data_006_7604::
    db   $6E, $00, $6E, $20, $66, $20, $64, $20, $64, $00, $66, $00, $62, $00, $62, $20
    db   $60, $00, $60, $20

Data_006_7618::
    db   $08, $F8, $00, $00

Data_006_761C::
    db   $00, $00, $F8, $08

Data_006_7620::
    db   $20, $E0, $00, $00

Data_006_7624::
    db   $00, $00, $E0, $20

WizrobeEntityHandler::
    ld   de, Data_006_7604                        ; $7628: $11 $04 $76
    call RenderActiveEntitySpritesPair            ; $762B: $CD $C0 $3B
    call func_006_64C6                            ; $762E: $CD $C6 $64
    call func_006_64F7                            ; $7631: $CD $F7 $64
    call UpdateEntityPosWithSpeed_06              ; $7634: $CD $41 $65
    call label_3B23                               ; $7637: $CD $23 $3B
    ld   hl, wEntitiesStateTable                  ; $763A: $21 $90 $C2
    add  hl, bc                                   ; $763D: $09
    ld   a, [hl]                                  ; $763E: $7E
    JP_TABLE                                      ; $763F
._00 dw WizrobeState0Handler                             ; $7640
._01 dw WizrobeState1Handler                             ; $7642
._02 dw WizrobeState2Handler                             ; $7644
._03 dw WizrobeState3Handler                             ; $7646

WizrobeState0Handler::
    ld   hl, wEntitiesTransitionCountdownTable    ; $7648: $21 $E0 $C2
    add  hl, bc                                   ; $764B: $09
    ld   a, [hl]                                  ; $764C: $7E
    and  a                                        ; $764D: $A7
    jr   nz, jr_006_765E                          ; $764E: $20 $0E

    call IncrementEntityState                     ; $7650: $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $7653: $21 $B0 $C2
    add  hl, bc                                   ; $7656: $09
    ld   [hl], $01                                ; $7657: $36 $01
    call GetEntityPrivateCountdown1               ; $7659: $CD $00 $0C
    ld   [hl], $20                                ; $765C: $36 $20

jr_006_765E:
    jr   jr_006_767E                              ; $765E: $18 $1E

WizrobeState1Handler::
    call GetEntityPrivateCountdown1               ; $7660: $CD $00 $0C
    jr   nz, jr_006_7679                          ; $7663: $20 $14

    ld   hl, wEntitiesPrivateState1Table          ; $7665: $21 $B0 $C2
    add  hl, bc                                   ; $7668: $09
    ld   a, [hl]                                  ; $7669: $7E
    ld   hl, wEntitiesStateTable                  ; $766A: $21 $90 $C2
    add  hl, bc                                   ; $766D: $09
    add  [hl]                                     ; $766E: $86

jr_006_766F:
    ld   [hl], a                                  ; $766F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $7670: $21 $E0 $C2
    add  hl, bc                                   ; $7673: $09
    ld   [hl], $30                                ; $7674: $36 $30
    jp   label_006_7735                           ; $7676: $C3 $35 $77

jr_006_7679:
    ld   a, [hl]                                  ; $7679: $7E
    and  $02                                      ; $767A: $E6 $02
    jr   nz, jr_006_7686                          ; $767C: $20 $08

jr_006_767E:
    ld   a, $FF                                   ; $767E: $3E $FF
    call SetEntitySpriteVariant                   ; $7680: $CD $0C $3B
    jp   label_006_7735                           ; $7683: $C3 $35 $77

jr_006_7686:
    xor  a                                        ; $7686: $AF
    call SetEntitySpriteVariant                   ; $7687: $CD $0C $3B
    jp   label_006_7735                           ; $768A: $C3 $35 $77

WizrobeState2Handler::
    xor  a                                        ; $768D: $AF
    call SetEntitySpriteVariant                   ; $768E: $CD $0C $3B
    call GetEntityPrivateCountdown1               ; $7691: $CD $00 $0C
    cp   $02                                      ; $7694: $FE $02
    jr   nc, jr_006_76B6                          ; $7696: $30 $1E

    ld   a, [hl]                                  ; $7698: $7E
    cp   $01                                      ; $7699: $FE $01
    jr   z, jr_006_76A2                           ; $769B: $28 $05

    ld   [hl], $18                                ; $769D: $36 $18
    jp   label_006_7735                           ; $769F: $C3 $35 $77

jr_006_76A2:
    ld   hl, wEntitiesPrivateState1Table          ; $76A2: $21 $B0 $C2
    add  hl, bc                                   ; $76A5: $09
    ld   a, [hl]                                  ; $76A6: $7E
    ld   hl, wEntitiesStateTable                  ; $76A7: $21 $90 $C2
    add  hl, bc                                   ; $76AA: $09
    add  [hl]                                     ; $76AB: $86
    ld   [hl], a                                  ; $76AC: $77
    cp   $01                                      ; $76AD: $FE $01
    jr   nz, jr_006_76B6                          ; $76AF: $20 $05

    call GetEntityPrivateCountdown1               ; $76B1: $CD $00 $0C
    ld   [hl], $20                                ; $76B4: $36 $20

jr_006_76B6:
    jp   label_006_7735                           ; $76B6: $C3 $35 $77

WizrobeState3Handler::
    call label_3B39                               ; $76B9: $CD $39 $3B
    call GetEntityPrivateCountdown1               ; $76BC: $CD $00 $0C
    cp   $28                                      ; $76BF: $FE $28
    jr   z, jr_006_76E9                           ; $76C1: $28 $26

    cp   $02                                      ; $76C3: $FE $02
    jr   nc, jr_006_772D                          ; $76C5: $30 $66

    ld   a, [hl]                                  ; $76C7: $7E
    cp   $01                                      ; $76C8: $FE $01
    jr   z, jr_006_76DD                           ; $76CA: $28 $11

    ld   [hl], $40                                ; $76CC: $36 $40
    call func_006_65B4                            ; $76CE: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $76D1: $21 $80 $C3
    add  hl, bc                                   ; $76D4: $09
    ld   [hl], a                                  ; $76D5: $77
    inc  a                                        ; $76D6: $3C
    ld   hl, wEntitiesSpriteVariantTable          ; $76D7: $21 $B0 $C3
    add  hl, bc                                   ; $76DA: $09
    ld   [hl], a                                  ; $76DB: $77
    ret                                           ; $76DC: $C9

jr_006_76DD:
    ld   hl, wEntitiesPrivateState1Table          ; $76DD: $21 $B0 $C2
    add  hl, bc                                   ; $76E0: $09
    ld   [hl], $FF                                ; $76E1: $36 $FF
    ld   hl, wEntitiesStateTable                  ; $76E3: $21 $90 $C2
    add  hl, bc                                   ; $76E6: $09
    dec  [hl]                                     ; $76E7: $35
    ret                                           ; $76E8: $C9

jr_006_76E9:
    ld   a, $22                                   ; $76E9: $3E $22
    call SpawnNewEntity_trampoline                ; $76EB: $CD $86 $3B
    jr   c, jr_006_772D                           ; $76EE: $38 $3D

    push bc                                       ; $76F0: $C5
    ldh  a, [hScratch2]                           ; $76F1: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $76F3: $21 $80 $C3
    add  hl, de                                   ; $76F6: $19
    ld   [hl], a                                  ; $76F7: $77
    ld   c, a                                     ; $76F8: $4F
    ld   hl, Data_006_7618                        ; $76F9: $21 $18 $76
    add  hl, bc                                   ; $76FC: $09
    ldh  a, [hScratch0]                           ; $76FD: $F0 $D7
    add  [hl]                                     ; $76FF: $86
    ld   hl, wEntitiesPosXTable                   ; $7700: $21 $00 $C2
    add  hl, de                                   ; $7703: $19
    ld   [hl], a                                  ; $7704: $77
    ld   hl, Data_006_761C                        ; $7705: $21 $1C $76
    add  hl, bc                                   ; $7708: $09

label_006_7709:
    ldh  a, [hScratch1]                           ; $7709: $F0 $D8
    add  [hl]                                     ; $770B: $86
    ld   hl, wEntitiesPosYTable                   ; $770C: $21 $10 $C2
    add  hl, de                                   ; $770F: $19
    ld   [hl], a                                  ; $7710: $77
    ld   hl, Data_006_7620                        ; $7711: $21 $20 $76
    add  hl, bc                                   ; $7714: $09
    ld   a, [hl]                                  ; $7715: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7716: $21 $40 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], a                                  ; $771A: $77
    ld   hl, Data_006_7624                        ; $771B: $21 $24 $76
    add  hl, bc                                   ; $771E: $09
    ld   a, [hl]                                  ; $771F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7720: $21 $50 $C2
    add  hl, de                                   ; $7723: $19
    ld   [hl], a                                  ; $7724: $77

jr_006_7725:
    pop  bc                                       ; $7725: $C1
    ldh  a, [hScratch2]                           ; $7726: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $7728: $21 $B0 $C3
    add  hl, de                                   ; $772B: $19
    ld   [hl], a                                  ; $772C: $77

jr_006_772D:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $772D: $21 $40 $C3
    add  hl, bc                                   ; $7730: $09
    ld   a, $02                                   ; $7731: $3E $02
    ld   [hl], a                                  ; $7733: $77
    ret                                           ; $7734: $C9

label_006_7735:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7735: $21 $40 $C3
    add  hl, bc                                   ; $7738: $09
    ld   [hl], $42                                ; $7739: $36 $42
    ret                                           ; $773B: $C9
