; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle1SpriteVariants:: ; $7784
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

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle2SpriteVariants::
.variant0
    db $60, $00
    db $60, $20
.variant1
    db $62, $00
    db $62, $20
.variant2
    db $64, $00
    db $64, $20
.variant3
    db $66, $00
    db $66, $20

SpikedBeetleEntityHandler::
    ld   de, SpikedBeetle1SpriteVariants          ; $77A4: $11 $84 $77
    ldh  a, [hMapId]                              ; $77A7: $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ; $77A9: $FE $03
    jr   nz, .render                              ; $77AB: $20 $03

    ld   de, SpikedBeetle2SpriteVariants          ; $77AD: $11 $94 $77

.render
    call RenderActiveEntitySpritesPair            ; $77B0: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $77B3: $CD $96 $7D

.jr_77B6
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $77B6: $21 $10 $C4
    add  hl, bc                                   ; $77B9: $09
    ld   a, [hl]                                  ; $77BA: $7E
    and  a                                        ; $77BB: $A7
    jr   z, .jr_77C1                              ; $77BC: $28 $03

    call ClearEntitySpeed                         ; $77BE: $CD $7F $3D

.jr_77C1
    call ApplyRecoilIfNeeded_07                   ; $77C1: $CD $C3 $7D
    call label_3B39                               ; $77C4: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $77C7: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $77CA: $CD $43 $7E
    call label_3B23                               ; $77CD: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $77D0: $21 $20 $C3
    add  hl, bc                                   ; $77D3: $09
    dec  [hl]                                     ; $77D4: $35
    dec  [hl]                                     ; $77D5: $35
    ld   hl, wEntitiesPosZTable                   ; $77D6: $21 $10 $C3
    add  hl, bc                                   ; $77D9: $09
    ld   a, [hl]                                  ; $77DA: $7E
    bit  7, a                                     ; $77DB: $CB $7F
    jr   nz, .jr_77E2                             ; $77DD: $20 $03

    and  a                                        ; $77DF: $A7
    jr   nz, jr_007_780D                          ; $77E0: $20 $2B

.jr_77E2
    ld   [hl], b                                  ; $77E2: $70
    ldh  a, [hActiveEntityState]                  ; $77E3: $F0 $F0
    cp   $03                                      ; $77E5: $FE $03
    jr   nz, jr_007_7808                          ; $77E7: $20 $1F

    ld   hl, wEntitiesSpeedXTable                 ; $77E9: $21 $40 $C2
    add  hl, bc                                   ; $77EC: $09
    sra  [hl]                                     ; $77ED: $CB $2E
    call GetEntitySpeedYAddress                   ; $77EF: $CD $05 $40
    sra  [hl]                                     ; $77F2: $CB $2E
    ld   hl, wEntitiesSpeedZTable                 ; $77F4: $21 $20 $C3
    add  hl, bc                                   ; $77F7: $09
    ld   a, [hl]                                  ; $77F8: $7E
    sra  a                                        ; $77F9: $CB $2F

.jr_77FB
    cpl                                           ; $77FB: $2F
    ld   [hl], a                                  ; $77FC: $77
    cp   $07                                      ; $77FD: $FE $07
    jp   nc, jr_007_780D                          ; $77FF: $D2 $0D $78

    ld   [hl], b                                  ; $7802: $70
    call ClearEntitySpeed                         ; $7803: $CD $7F $3D
    jr   jr_007_780D                              ; $7806: $18 $05

jr_007_7808:
    ld   hl, wEntitiesSpeedZTable                 ; $7808: $21 $20 $C3
    add  hl, bc                                   ; $780B: $09
    ld   [hl], b                                  ; $780C: $70

jr_007_780D:
    ldh  a, [hActiveEntityState]                  ; $780D: $F0 $F0
    cp   $04                                      ; $780F: $FE $04
    jr   c, .jr_7814                              ; $7811: $38 $01

    ret                                           ; $7813: $C9

.jr_7814
    JP_TABLE                                      ; $7814
._00 dw func_007_7825                             ; $7815
._01 dw func_007_7860                             ; $7817
._02 dw func_007_78A5                             ; $7819
._03 dw func_007_78EC                             ; $781B

Data_007_781D::
    db   $06, $FA, $00, $00

Data_007_7821::
    db   $00, $00, $FA, $06

func_007_7825::
    call ClearEntitySpeed                         ; $7825: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $7828: $CD $05 $0C
    jr   nz, jr_007_785E                          ; $782B: $20 $31

    call GetRandomByte                            ; $782D: $CD $0D $28
    and  $1F                                      ; $7830: $E6 $1F
    add  $30                                      ; $7832: $C6 $30
    ld   [hl], a                                  ; $7834: $77
    call IncrementEntityState                     ; $7835: $CD $12 $3B
    call GetRandomByte                            ; $7838: $CD $0D $28
    and  $06                                      ; $783B: $E6 $06
    jr   nz, .jr_7844                             ; $783D: $20 $05

    call func_007_7E7D                            ; $783F: $CD $7D $7E
    jr   jr_007_784A                              ; $7842: $18 $06

.jr_7844
    call GetRandomByte                            ; $7844: $CD $0D $28
    and  $03                                      ; $7847: $E6 $03
    ld   e, a                                     ; $7849: $5F

jr_007_784A:
    ld   d, b                                     ; $784A: $50
    ld   hl, Data_007_781D                        ; $784B: $21 $1D $78
    add  hl, de                                   ; $784E: $19
    ld   a, [hl]                                  ; $784F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7850: $21 $40 $C2
    add  hl, bc                                   ; $7853: $09
    ld   [hl], a                                  ; $7854: $77
    ld   hl, Data_007_7821                        ; $7855: $21 $21 $78
    add  hl, de                                   ; $7858: $19
    ld   a, [hl]                                  ; $7859: $7E
    call GetEntitySpeedYAddress                   ; $785A: $CD $05 $40
    ld   [hl], a                                  ; $785D: $77

jr_007_785E:
    jr   jr_007_786E                              ; $785E: $18 $0E

func_007_7860::
    call GetEntityTransitionCountdown             ; $7860: $CD $05 $0C
    jr   nz, .jr_786B                             ; $7863: $20 $06

    ld   [hl], $18                                ; $7865: $36 $18
    call IncrementEntityState                     ; $7867: $CD $12 $3B
    ld   [hl], b                                  ; $786A: $70

.jr_786B
    call func_007_78E1                            ; $786B: $CD $E1 $78

jr_007_786E:
    ld   hl, wEntitiesHitboxFlagsTable            ; $786E: $21 $50 $C3
    add  hl, bc                                   ; $7871: $09
    ld   [hl], $80                                ; $7872: $36 $80
    ld   hl, wEntitiesOptions1Table               ; $7874: $21 $30 $C4
    add  hl, bc                                   ; $7877: $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_SPLASH_IN_WATER ; $7878: $36 $48
    call EntityLinkPositionXDifference_07         ; $787A: $CD $5D $7E
    add  $06                                      ; $787D: $C6 $06
    cp   $0A                                      ; $787F: $FE $0A
    jr   c, .jr_788C                              ; $7881: $38 $09

    call EntityLinkPositionYDifference_07         ; $7883: $CD $6D $7E
    add  $06                                      ; $7886: $C6 $06
    cp   $0A                                      ; $7888: $FE $0A
    jr   nc, ret_007_789C                         ; $788A: $30 $10

.jr_788C
    call func_007_7E7D                            ; $788C: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $788F: $21 $80 $C3
    add  hl, bc                                   ; $7892: $09
    ld   [hl], e                                  ; $7893: $73
    call IncrementEntityState                     ; $7894: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7897: $CD $05 $0C
    ld   [hl], $FF                                ; $789A: $36 $FF

ret_007_789C:
    ret                                           ; $789C: $C9

Data_007_789D::
    db   $18, $E8, $00, $00

Data_007_78A1::
    db   $00, $00, $E8, $18

func_007_78A5::
    call GetEntityTransitionCountdown             ; $78A5: $CD $05 $0C
    jr   z, jr_007_78DD                           ; $78A8: $28 $33

    ld   hl, wEntitiesDirectionTable              ; $78AA: $21 $80 $C3
    add  hl, bc                                   ; $78AD: $09
    ld   e, [hl]                                  ; $78AE: $5E
    ld   d, b                                     ; $78AF: $50
    ld   hl, Data_007_789D                        ; $78B0: $21 $9D $78
    add  hl, de                                   ; $78B3: $19
    ld   a, [hl]                                  ; $78B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $78B5: $21 $40 $C2
    add  hl, bc                                   ; $78B8: $09
    sub  [hl]                                     ; $78B9: $96
    jr   z, jr_007_78C3                           ; $78BA: $28 $07

    and  $80                                      ; $78BC: $E6 $80
    jr   nz, .jr_78C2                             ; $78BE: $20 $02

    inc  [hl]                                     ; $78C0: $34
    inc  [hl]                                     ; $78C1: $34

.jr_78C2
    dec  [hl]                                     ; $78C2: $35

jr_007_78C3:
    ld   hl, Data_007_78A1                        ; $78C3: $21 $A1 $78
    add  hl, de                                   ; $78C6: $19
    ld   a, [hl]                                  ; $78C7: $7E
    call GetEntitySpeedYAddress                   ; $78C8: $CD $05 $40
    sub  [hl]                                     ; $78CB: $96
    jr   z, jr_007_78D5                           ; $78CC: $28 $07

    and  $80                                      ; $78CE: $E6 $80
    jr   nz, .jr_78D4                             ; $78D0: $20 $02

    inc  [hl]                                     ; $78D2: $34
    inc  [hl]                                     ; $78D3: $34

.jr_78D4
    dec  [hl]                                     ; $78D4: $35

jr_007_78D5:
    ld   hl, wEntitiesCollisionsTable             ; $78D5: $21 $A0 $C2
    add  hl, bc                                   ; $78D8: $09
    ld   a, [hl]                                  ; $78D9: $7E
    and  a                                        ; $78DA: $A7
    jr   z, func_007_78E1                         ; $78DB: $28 $04

jr_007_78DD:
    call IncrementEntityState                     ; $78DD: $CD $12 $3B
    ld   [hl], b                                  ; $78E0: $70

func_007_78E1::
    ldh  a, [hFrameCounter]                       ; $78E1: $F0 $E7
    rra                                           ; $78E3: $1F
    rra                                           ; $78E4: $1F
    rra                                           ; $78E5: $1F
    rra                                           ; $78E6: $1F
    and  $01                                      ; $78E7: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78E9: $C3 $0C $3B

func_007_78EC::
    ld   hl, wEntitiesOptions1Table               ; $78EC: $21 $30 $C4
    add  hl, bc                                   ; $78EF: $09
    ld   [hl], ENTITY_OPT1_SPLASH_IN_WATER        ; $78F0: $36 $08
    ld   hl, wEntitiesHitboxFlagsTable            ; $78F2: $21 $50 $C3
    add  hl, bc                                   ; $78F5: $09
    ld   [hl], $00                                ; $78F6: $36 $00
    ldh  a, [hFrameCounter]                       ; $78F8: $F0 $E7
    rra                                           ; $78FA: $1F
    rra                                           ; $78FB: $1F
    rra                                           ; $78FC: $1F
    rra                                           ; $78FD: $1F
    and  $01                                      ; $78FE: $E6 $01
    inc  a                                        ; $7900: $3C
    inc  a                                        ; $7901: $3C
    call SetEntitySpriteVariant                   ; $7902: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $7905: $CD $05 $0C
    jr   nz, .jr_791A                             ; $7908: $20 $10

    call IncrementEntityState                     ; $790A: $CD $12 $3B
    ld   [hl], b                                  ; $790D: $70
    ld   hl, wEntitiesSpeedZTable                 ; $790E: $21 $20 $C3
    add  hl, bc                                   ; $7911: $09
    ld   [hl], $18                                ; $7912: $36 $18
    ld   hl, wEntitiesSpeedXTable                 ; $7914: $21 $40 $C2
    add  hl, bc                                   ; $7917: $09
    ld   [hl], b                                  ; $7918: $70
    ret                                           ; $7919: $C9

.jr_791A
    cp   $60                                      ; $791A: $FE $60
    jr   nc, jr_007_792B                          ; $791C: $30 $0D

    and  $04                                      ; $791E: $E6 $04
    ld   a, $08                                   ; $7920: $3E $08
    jr   nz, .jr_7926                             ; $7922: $20 $02

    ld   a, $F8                                   ; $7924: $3E $F8

.jr_7926
    ld   hl, wEntitiesSpeedXTable                 ; $7926: $21 $40 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77

jr_007_792B:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $792B: $21 $10 $C4
    add  hl, bc                                   ; $792E: $09
    ld   a, [hl]                                  ; $792F: $7E
    push af                                       ; $7930: $F5
    ld   [hl], $01                                ; $7931: $36 $01
    call label_3B23                               ; $7933: $CD $23 $3B
    pop  af                                       ; $7936: $F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7937: $21 $10 $C4
    add  hl, bc                                   ; $793A: $09
    ld   [hl], a                                  ; $793B: $77
    ret                                           ; $793C: $C9
