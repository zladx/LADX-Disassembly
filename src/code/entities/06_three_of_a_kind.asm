; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
ThreeOfAKindSpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $72, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0
.variant5
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0
.variant7
    db $7E, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

ThreeOfAKindEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $4931: $21 $60 $C3
    add  hl, bc                                   ; $4934: $09
    ld   [hl], $20                                ; $4935: $36 $20
    ld   de, ThreeOfAKindSpriteVariants           ; $4937: $11 $11 $49
    call RenderActiveEntitySpritesPair            ; $493A: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $493D: $CD $C6 $64
    call DecrementEntityIgnoreHitsCountdown       ; $4940: $CD $56 $0C
    call UpdateEntityPosWithSpeed_06              ; $4943: $CD $41 $65
    call label_3B23                               ; $4946: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $4949: $F0 $F0
    JP_TABLE                                      ; $494B
._00 dw ThreeOfAKindState0Handler
._01 dw ThreeOfAKindState1Handler
._02 dw ThreeOfAKindState2Handler

ThreeOfAKindState0Handler::
    call label_3B39
    call GetEntityTransitionCountdown             ; $4955: $CD $05 $0C
    jr   nz, .jr_4962                             ; $4958: $20 $08

    ld   [hl], $20                                ; $495A: $36 $20
    call ClearEntitySpeed                         ; $495C: $CD $7F $3D
    call IncrementEntityState                     ; $495F: $CD $12 $3B

.jr_4962
    ld   hl, wEntitiesInertiaTable                ; $4962: $21 $D0 $C3
    add  hl, bc                                   ; $4965: $09
    inc  [hl]                                     ; $4966: $34

jr_006_4967:
    ld   hl, wEntitiesDirectionTable              ; $4967: $21 $80 $C3
    add  hl, bc                                   ; $496A: $09
    ldh  a, [hFrameCounter]                       ; $496B: $F0 $E7
    and  $0F                                      ; $496D: $E6 $0F
    jr   nz, .jr_4976                             ; $496F: $20 $05

    ld   a, [hl]                                  ; $4971: $7E
    inc  a                                        ; $4972: $3C
    and  $03                                      ; $4973: $E6 $03
    ld   [hl], a                                  ; $4975: $77

.jr_4976
    ld   e, [hl]                                  ; $4976: $5E
    sla  e                                        ; $4977: $CB $23
    ld   hl, wEntitiesInertiaTable                ; $4979: $21 $D0 $C3
    add  hl, bc                                   ; $497C: $09
    ld   a, [hl]                                  ; $497D: $7E
    rra                                           ; $497E: $1F
    rra                                           ; $497F: $1F
    rra                                           ; $4980: $1F
    and  $01                                      ; $4981: $E6 $01
    or   e                                        ; $4983: $B3
    call SetEntitySpriteVariant                   ; $4984: $CD $0C $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4987: $21 $10 $C4
    add  hl, bc                                   ; $498A: $09
    ld   a, [hl]                                  ; $498B: $7E
    and  a                                        ; $498C: $A7
    ret  z                                        ; $498D: $C8

    call IncrementEntityState                     ; $498E: $CD $12 $3B
    ld   [hl], $02                                ; $4991: $36 $02
    call GetEntityTransitionCountdown             ; $4993: $CD $05 $0C
    ld   [hl], $40                                ; $4996: $36 $40
    jp   ClearEntitySpeed                         ; $4998: $C3 $7F $3D

Data_006_499B::
    db   $0C, $F4, $00, $00

Data_006_499F::
    db   $00, $00, $F4, $0C

ThreeOfAKindState1Handler::
    call label_3B39                               ; $49A3: $CD $39 $3B

.jr_49A6
    call GetEntityTransitionCountdown             ; $49A6: $CD $05 $0C
    jr   nz, .jr_49D2                             ; $49A9: $20 $27

    call GetRandomByte                            ; $49AB: $CD $0D $28
    and  $1F                                      ; $49AE: $E6 $1F
    add  $20                                      ; $49B0: $C6 $20
    ld   [hl], a                                  ; $49B2: $77
    call IncrementEntityState                     ; $49B3: $CD $12 $3B
    ld   [hl], b                                  ; $49B6: $70
    call GetRandomByte                            ; $49B7: $CD $0D $28
    and  $03                                      ; $49BA: $E6 $03
    ld   e, a                                     ; $49BC: $5F
    ld   d, b                                     ; $49BD: $50
    ld   hl, Data_006_499B                        ; $49BE: $21 $9B $49
    add  hl, de                                   ; $49C1: $19
    ld   a, [hl]                                  ; $49C2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $49C3: $21 $40 $C2
    add  hl, bc                                   ; $49C6: $09
    ld   [hl], a                                  ; $49C7: $77
    ld   hl, Data_006_499F                        ; $49C8: $21 $9F $49
    add  hl, de                                   ; $49CB: $19
    ld   a, [hl]                                  ; $49CC: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $49CD: $21 $50 $C2
    add  hl, bc                                   ; $49D0: $09
    ld   [hl], a                                  ; $49D1: $77

.jr_49D2
    jr   jr_006_4967                              ; $49D2: $18 $93

ThreeOfAKindState2Handler::
    ld   hl, wEntitiesLoadOrderTable              ; $49D4: $21 $60 $C4
    add  hl, bc                                   ; $49D7: $09
    ld   a, [hl]                                  ; $49D8: $7E
    and  a                                        ; $49D9: $A7
    jp   nz, label_006_4AA7                       ; $49DA: $C2 $A7 $4A

    ldh  [hMultiPurpose0], a                      ; $49DD: $E0 $D7
    ld   e, $0F                                   ; $49DF: $1E $0F
    ld   d, b                                     ; $49E1: $50

jr_006_49E2:
    ld   hl, wEntitiesStatusTable                 ; $49E2: $21 $80 $C2
    add  hl, de                                   ; $49E5: $19
    ld   a, [hl]                                  ; $49E6: $7E
    and  a                                        ; $49E7: $A7
    jr   z, .jr_4A09                              ; $49E8: $28 $1F

    ld   hl, wEntitiesTypeTable                   ; $49EA: $21 $A0 $C3
    add  hl, de                                   ; $49ED: $19
    ld   a, [hl]                                  ; $49EE: $7E
    cp   $90                                      ; $49EF: $FE $90
    jr   nz, .jr_4A09                             ; $49F1: $20 $16

    ld   hl, wEntitiesStateTable                  ; $49F3: $21 $90 $C2
    add  hl, de                                   ; $49F6: $19
    ld   a, [hl]                                  ; $49F7: $7E
    cp   $02                                      ; $49F8: $FE $02
    jr   nz, .jr_4A09                             ; $49FA: $20 $0D

    ld   hl, wEntitiesTransitionCountdownTable    ; $49FC: $21 $E0 $C2
    add  hl, de                                   ; $49FF: $19
    ld   a, [hl]                                  ; $4A00: $7E
    and  a                                        ; $4A01: $A7
    jr   nz, .jr_4A09                             ; $4A02: $20 $05

    ldh  a, [hMultiPurpose0]                      ; $4A04: $F0 $D7
    inc  a                                        ; $4A06: $3C
    ldh  [hMultiPurpose0], a                      ; $4A07: $E0 $D7

.jr_4A09
    dec  e                                        ; $4A09: $1D
    ld   a, e                                     ; $4A0A: $7B
    cp   $FF                                      ; $4A0B: $FE $FF
    jr   nz, jr_006_49E2                          ; $4A0D: $20 $D3

    ldh  a, [hMultiPurpose0]                      ; $4A0F: $F0 $D7
    cp   $03                                      ; $4A11: $FE $03
    jp   nz, label_006_4AA7                       ; $4A13: $C2 $A7 $4A

    push bc                                       ; $4A16: $C5
    ld   c, b                                     ; $4A17: $48
    ld   e, $0F                                   ; $4A18: $1E $0F
    ld   d, b                                     ; $4A1A: $50

jr_006_4A1B:
    ld   hl, wEntitiesStatusTable                 ; $4A1B: $21 $80 $C2
    add  hl, de                                   ; $4A1E: $19
    ld   a, [hl]                                  ; $4A1F: $7E
    and  a                                        ; $4A20: $A7
    jr   z, .jr_4A37                              ; $4A21: $28 $14

    ld   hl, wEntitiesTypeTable                   ; $4A23: $21 $A0 $C3
    add  hl, de                                   ; $4A26: $19
    ld   a, [hl]                                  ; $4A27: $7E
    cp   $90                                      ; $4A28: $FE $90
    jr   nz, .jr_4A37                             ; $4A2A: $20 $0B

    ld   hl, wEntitiesDirectionTable              ; $4A2C: $21 $80 $C3
    add  hl, de                                   ; $4A2F: $19
    ld   a, [hl]                                  ; $4A30: $7E
    ld   hl, hMultiPurpose2                       ; $4A31: $21 $D9 $FF
    add  hl, bc                                   ; $4A34: $09
    ld   [hl], a                                  ; $4A35: $77
    inc  bc                                       ; $4A36: $03

.jr_4A37
    dec  e                                        ; $4A37: $1D
    ld   a, e                                     ; $4A38: $7B
    cp   $FF                                      ; $4A39: $FE $FF
    jr   nz, jr_006_4A1B                          ; $4A3B: $20 $DE

    pop  bc                                       ; $4A3D: $C1
    call PlayWrongAnswerJingle                    ; $4A3E: $CD $20 $0C
    ld   e, $00                                   ; $4A41: $1E $00
    ldh  a, [hMultiPurpose2]                      ; $4A43: $F0 $D9
    ld   hl, hMultiPurpose3                       ; $4A45: $21 $DA $FF
    cp   [hl]                                     ; $4A48: $BE
    jr   nz, .jr_4A62                             ; $4A49: $20 $17

    inc  hl                                       ; $4A4B: $23
    cp   [hl]                                     ; $4A4C: $BE
    jr   nz, .jr_4A62                             ; $4A4D: $20 $13

IF __PATCH_0__
    ld   hl, hJingle
    ld   [hl], JINGLE_PUZZLE_SOLVED
ENDC

    ld   e, $FF                                   ; $4A4F: $1E $FF
    cp   $02                                      ; $4A51: $FE $02
    jr   nc, .jr_4A62                             ; $4A53: $30 $0D

IF !__PATCH_0__
    ld   hl, hJingle                              ; $4A55: $21 $F2 $FF
    ld   [hl], JINGLE_PUZZLE_SOLVED               ; $4A58: $36 $02
ENDC

    ld   e, $2D                                   ; $4A5A: $1E $2D
    cp   $01                                      ; $4A5C: $FE $01
    jr   nz, .jr_4A62                             ; $4A5E: $20 $02

    ld   e, $2E                                   ; $4A60: $1E $2E

.jr_4A62
    ld   a, e                                     ; $4A62: $7B
    ldh  [hMultiPurposeG], a                      ; $4A63: $E0 $E8
    ld   e, $0F                                   ; $4A65: $1E $0F
    ld   d, b                                     ; $4A67: $50

jr_006_4A68:
    ld   hl, wEntitiesStatusTable                 ; $4A68: $21 $80 $C2
    add  hl, de                                   ; $4A6B: $19
    ld   a, [hl]                                  ; $4A6C: $7E
    and  a                                        ; $4A6D: $A7
    jr   z, jr_006_4AA1                           ; $4A6E: $28 $31

    ld   hl, wEntitiesTypeTable                   ; $4A70: $21 $A0 $C3
    add  hl, de                                   ; $4A73: $19
    ld   a, [hl]                                  ; $4A74: $7E
    cp   $90                                      ; $4A75: $FE $90
    jr   nz, jr_006_4AA1                          ; $4A77: $20 $28

    ldh  a, [hMultiPurposeG]                      ; $4A79: $F0 $E8
    and  a                                        ; $4A7B: $A7
    jr   nz, .jr_4A85                             ; $4A7C: $20 $07

    ld   hl, wEntitiesStateTable                  ; $4A7E: $21 $90 $C2
    add  hl, de                                   ; $4A81: $19
    ld   [hl], d                                  ; $4A82: $72
    jr   jr_006_4AA1                              ; $4A83: $18 $1C

.jr_4A85
    ld   hl, wEntitiesDroppedItemTable            ; $4A85: $21 $E0 $C4
    add  hl, de                                   ; $4A88: $19
    ld   [hl], a                                  ; $4A89: $77
    ld   hl, wEntitiesPrivateCountdown3Table      ; $4A8A: $21 $80 $C4
    add  hl, de                                   ; $4A8D: $19
    ld   [hl], $1F                                ; $4A8E: $36 $1F
    ld   hl, wEntitiesStatusTable                 ; $4A90: $21 $80 $C2
    add  hl, de                                   ; $4A93: $19
    ld   [hl], $01                                ; $4A94: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A96: $21 $40 $C3
    add  hl, de                                   ; $4A99: $19
    ld   [hl], 4                                  ; $4A9A: $36 $04
    ld   hl, hNoiseSfx                            ; $4A9C: $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ; $4A9F: $36 $13

jr_006_4AA1:
    dec  e                                        ; $4AA1: $1D
    ld   a, e                                     ; $4AA2: $7B
    cp   $FF                                      ; $4AA3: $FE $FF
    jr   nz, jr_006_4A68                          ; $4AA5: $20 $C1

label_006_4AA7:
    ret                                           ; $4AA7: $C9
