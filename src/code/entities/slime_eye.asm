Data_004_496B::
    db   $EE, $12

Data_004_496D::
    db   $F8, $08

label_004_496F:
    xor  a                                        ; $496F: $AF
    ldh  [hFFE8], a                               ; $4970: $E0 $E8

.loop
    ld   a, $5B                                   ; $4972: $3E $5B
    call SpawnNewEntity_trampoline                ; $4974: $CD $86 $3B
    ld   hl, wEntitiesUnknowTableR                ; $4977: $21 $90 $C3
    add  hl, de                                   ; $497A: $19
    ld   [hl], $01                                ; $497B: $36 $01
    push bc                                       ; $497D: $C5
    ldh  a, [hFFE8]                               ; $497E: $F0 $E8
    ld   c, a                                     ; $4980: $4F
    ld   hl, Data_004_496B                        ; $4981: $21 $6B $49
    add  hl, bc                                   ; $4984: $09
    ldh  a, [hScratch0]                               ; $4985: $F0 $D7
    add  [hl]                                     ; $4987: $86
    ld   hl, wEntitiesPosXTable                         ; $4988: $21 $00 $C2
    add  hl, de                                   ; $498B: $19
    ld   [hl], a                                  ; $498C: $77
    ld   hl, Data_004_496D                        ; $498D: $21 $6D $49
    add  hl, bc                                   ; $4990: $09
    ld   a, [hl]                                  ; $4991: $7E
    ld   hl, wEntitiesSpeedXTable                                ; $4992: $21 $40 $C2
    add  hl, de                                   ; $4995: $19
    ld   [hl], a                                  ; $4996: $77
    ld   hl, wEntitiesSpeedZTable                                ; $4997: $21 $20 $C3
    add  hl, de                                   ; $499A: $19
    ld   [hl], $10                                ; $499B: $36 $10
    ld   hl, wEntitiesStateTable                  ; $499D: $21 $90 $C2
    add  hl, de                                   ; $49A0: $19
    ld   [hl], $01                                ; $49A1: $36 $01
    ldh  a, [hScratch1]                               ; $49A3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $49A5: $21 $10 $C2
    add  hl, de                                   ; $49A8: $19
    ld   [hl], a                                  ; $49A9: $77
    ld   hl, wEntitiesHealthTable                                ; $49AA: $21 $60 $C3
    add  hl, de                                   ; $49AD: $19
    ld   [hl], $05                                ; $49AE: $36 $05
    pop  bc                                       ; $49B0: $C1
    ldh  a, [hFFE8]                               ; $49B1: $F0 $E8
    inc  a                                        ; $49B3: $3C
    ldh  [hFFE8], a                               ; $49B4: $E0 $E8
    cp   $02                                      ; $49B6: $FE $02
    jr   nz, .loop                                ; $49B8: $20 $B8

    jp   func_004_6D7A                            ; $49BA: $C3 $7A $6D

EntityInitSlimeEye::
    ld   hl, wEntitiesPosZTable                                ; $49BD: $21 $10 $C3
    add  hl, bc                                   ; $49C0: $09
    ld   [hl], $7E                                ; $49C1: $36 $7E
    call GetEntityTransitionCountdown                 ; $49C3: $CD $05 $0C
    ld   [hl], $A0                                ; $49C6: $36 $A0
    ret                                           ; $49C8: $C9

SlimeEyeEntityHandler::
    call label_394D                               ; $49C9: $CD $4D $39
    call BossIntro                                ; $49CC: $CD $E8 $3E
    call func_004_4E52                            ; $49CF: $CD $52 $4E
    ld   hl, wEntitiesUnknowTableR                ; $49D2: $21 $90 $C3
    add  hl, bc                                   ; $49D5: $09
    ld   a, [hl]                                  ; $49D6: $7E
    JP_TABLE                                      ; $49D7: $C7
._00 dw func_004_49DC                             ; $49D8
._01 dw func_004_4DFB                             ; $49DA

func_004_49DC::
    ld   hl, wEntitiesHealthTable                 ; $49DC: $21 $60 $C3
    add  hl, bc                                   ; $49DF: $09
    ld   [hl], $50                                ; $49E0: $36 $50
    ldh  a, [hActiveEntityState]                               ; $49E2: $F0 $F0
    JP_TABLE                                      ; $49E4: $C7
._00 dw SlimeEyeState0Handler                     ; $49E5
._01 dw SlimeEyeState1Handler                     ; $49E7
._02 dw SlimeEyeState2Handler                     ; $49E9
._03 dw SlimeEyeState3Handler                     ; $49EB

SlimeEyeState0Handler::
    ld   a, [$C157]                               ; $49ED: $FA $57 $C1
    cp   $05                                      ; $49F0: $FE $05
    jr   nz, jr_004_49FB                          ; $49F2: $20 $07

    call IncrementEntityState                     ; $49F4: $CD $12 $3B
    ld   a, JINGLE_JUMP_DOWN                      ; $49F7: $3E $08
    ldh  [hJingle], a                             ; $49F9: $E0 $F2

jr_004_49FB:
    call GetEntityTransitionCountdown                 ; $49FB: $CD $05 $0C
    jr   nz, jr_004_4A2C                          ; $49FE: $20 $2C

    ld   [hl], $50                                ; $4A00: $36 $50
    ld   a, [$C1AE]                               ; $4A02: $FA $AE $C1
    cp   $02                                      ; $4A05: $FE $02
    jr   nc, jr_004_4A2C                          ; $4A07: $30 $23

    ld   a, $1B                                   ; $4A09: $3E $1B
    call SpawnNewEntity_trampoline                ; $4A0B: $CD $86 $3B
    call GetRandomByte                            ; $4A0E: $CD $0D $28
    and  $3F                                      ; $4A11: $E6 $3F
    add  $40                                      ; $4A13: $C6 $40
    ld   hl, wEntitiesPosXTable                         ; $4A15: $21 $00 $C2
    add  hl, de                                   ; $4A18: $19
    ld   [hl], a                                  ; $4A19: $77
    call GetRandomByte                            ; $4A1A: $CD $0D $28
    and  $3F                                      ; $4A1D: $E6 $3F
    add  $30                                      ; $4A1F: $C6 $30
    ld   hl, wEntitiesPosYTable                   ; $4A21: $21 $10 $C2
    add  hl, de                                   ; $4A24: $19
    ld   [hl], a                                  ; $4A25: $77
    ld   hl, wEntitiesPosZTable                                ; $4A26: $21 $10 $C3
    add  hl, de                                   ; $4A29: $19
    ld   [hl], $70                                ; $4A2A: $36 $70

jr_004_4A2C:
    ret                                           ; $4A2C: $C9

SlimeEyeState1Handler::
    call func_004_4DB5                            ; $4A2D: $CD $B5 $4D
    call func_004_7FA3                            ; $4A30: $CD $A3 $7F
    call func_004_6E03                            ; $4A33: $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                                ; $4A36: $21 $20 $C3
    add  hl, bc                                   ; $4A39: $09
    ld   a, [hl]                                  ; $4A3A: $7E
    cp   $A0                                      ; $4A3B: $FE $A0
    jr   z, jr_004_4A41                           ; $4A3D: $28 $02

    dec  [hl]                                     ; $4A3F: $35
    dec  [hl]                                     ; $4A40: $35

jr_004_4A41:
    ld   hl, wEntitiesPosZTable                                ; $4A41: $21 $10 $C3
    add  hl, bc                                   ; $4A44: $09
    ld   a, [hl]                                  ; $4A45: $7E
    and  $80                                      ; $4A46: $E6 $80
    ret  z                                        ; $4A48: $C8

    ld   [hl], b                                  ; $4A49: $70
    ld   a, $50                                   ; $4A4A: $3E $50
    ld   [$C157], a                               ; $4A4C: $EA $57 $C1
    ld   a, $04                                   ; $4A4F: $3E $04
    ld   [$C158], a                               ; $4A51: $EA $58 $C1
    call GetEntityTransitionCountdown                 ; $4A54: $CD $05 $0C
    ld   [hl], $40                                ; $4A57: $36 $40
    call PlayBombExplosionSfx                                ; $4A59: $CD $4B $0C
    ld   a, [$C146]                               ; $4A5C: $FA $46 $C1
    and  a                                        ; $4A5F: $A7
    jr   nz, jr_004_4A67                          ; $4A60: $20 $05

    call GetEntityDropTimer                       ; $4A62: $CD $FB $0B
    ld   [hl], $14                                ; $4A65: $36 $14

jr_004_4A67:
    jp   IncrementEntityState                     ; $4A67: $C3 $12 $3B

SlimeEyeState2Handler::
    call func_004_4DB5                            ; $4A6A: $CD $B5 $4D
    call func_004_7FA3                            ; $4A6D: $CD $A3 $7F
    call GetEntityTransitionCountdown                 ; $4A70: $CD $05 $0C
    jr   nz, jr_004_4A78                          ; $4A73: $20 $03

    call IncrementEntityState                     ; $4A75: $CD $12 $3B

jr_004_4A78:
    call func_004_4B2E                            ; $4A78: $CD $2E $4B
    jp   label_3B44                               ; $4A7B: $C3 $44 $3B

SlimeEyeState3Handler::
    call func_004_4DB5                            ; $4A7E: $CD $B5 $4D
    call func_004_7FA3                            ; $4A81: $CD $A3 $7F
    call DecrementEntityIgnoreHitsCountdown       ; $4A84: $CD $56 $0C
    ld   hl, $C300                                ; $4A87: $21 $00 $C3
    add  hl, bc                                   ; $4A8A: $09
    ld   a, [hl]                                  ; $4A8B: $7E
    and  a                                        ; $4A8C: $A7
    jr   z, jr_004_4AA5                           ; $4A8D: $28 $16

    cp   $01                                      ; $4A8F: $FE $01
    jp   z, label_004_496F                        ; $4A91: $CA $6F $49

    ldh  [hLinkInteractiveMotionBlocked], a       ; $4A94: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $4A96: $F0 $E7
    and  $01                                      ; $4A98: $E6 $01
    jr   nz, jr_004_4AA0                          ; $4A9A: $20 $04

    ld   hl, hLinkPositionY                       ; $4A9C: $21 $99 $FF
    dec  [hl]                                     ; $4A9F: $35

jr_004_4AA0:
    ld   a, $06                                   ; $4AA0: $3E $06
    jp   SetEntitySpriteVariant                   ; $4AA2: $C3 $0C $3B

jr_004_4AA5:
    call func_004_4B52                            ; $4AA5: $CD $52 $4B
    ldh  a, [hFrameCounter]                       ; $4AA8: $F0 $E7
    rra                                           ; $4AAA: $1F
    rra                                           ; $4AAB: $1F
    rra                                           ; $4AAC: $1F
    rra                                           ; $4AAD: $1F
    and  $01                                      ; $4AAE: $E6 $01
    call SetEntitySpriteVariant                   ; $4AB0: $CD $0C $3B
    ld   hl, wEntitiesPrivateState1Table          ; $4AB3: $21 $B0 $C2
    add  hl, bc                                   ; $4AB6: $09
    ld   a, [hl]                                  ; $4AB7: $7E
    and  a                                        ; $4AB8: $A7
    jr   z, jr_004_4ACB                           ; $4AB9: $28 $10

    inc  a                                        ; $4ABB: $3C
    call SetEntitySpriteVariant                   ; $4ABC: $CD $0C $3B
    call GetEntityPrivateCountdown1                                      ; $4ABF: $CD $00 $0C
    jr   nz, jr_004_4ACB                          ; $4AC2: $20 $07

    ld   [hl], $28                                ; $4AC4: $36 $28
    ld   hl, wEntitiesPrivateState1Table          ; $4AC6: $21 $B0 $C2
    add  hl, bc                                   ; $4AC9: $09
    dec  [hl]                                     ; $4ACA: $35

jr_004_4ACB:
    xor  a                                        ; $4ACB: $AF
    ldh  [hFFE8], a                               ; $4ACC: $E0 $E8
    ld   a, $14                                   ; $4ACE: $3E $14
    call func_004_4B37                            ; $4AD0: $CD $37 $4B
    call label_3B70                               ; $4AD3: $CD $70 $3B
    ld   hl, wEntitiesFlashCountdownTable         ; $4AD6: $21 $20 $C4
    add  hl, bc                                   ; $4AD9: $09
    ld   a, [hl]                                  ; $4ADA: $7E
    ld   hl, $C300                                ; $4ADB: $21 $00 $C3
    add  hl, bc                                   ; $4ADE: $09
    or   [hl]                                     ; $4ADF: $B6
    jr   nz, jr_004_4AEF                          ; $4AE0: $20 $0D

    call func_004_4B2E                            ; $4AE2: $CD $2E $4B
    call label_3B44                               ; $4AE5: $CD $44 $3B
    ld   a, $01                                   ; $4AE8: $3E $01
    ldh  [hFFE8], a                               ; $4AEA: $E0 $E8
    call label_3B70                               ; $4AEC: $CD $70 $3B

jr_004_4AEF:
    ld   a, $14                                   ; $4AEF: $3E $14
    call func_004_4B37                            ; $4AF1: $CD $37 $4B
    ld   hl, wEntitiesFlashCountdownTable         ; $4AF4: $21 $20 $C4
    add  hl, bc                                   ; $4AF7: $09
    ld   a, [hl]                                  ; $4AF8: $7E
    and  a                                        ; $4AF9: $A7
    jr   z, jr_004_4B11                           ; $4AFA: $28 $15

    ldh  a, [hFrameCounter]                       ; $4AFC: $F0 $E7
    and  $1F                                      ; $4AFE: $E6 $1F
    jr   nz, jr_004_4B11                          ; $4B00: $20 $0F

    call GetEntityPrivateCountdown1                                      ; $4B02: $CD $00 $0C
    ld   [hl], $50                                ; $4B05: $36 $50
    ld   hl, wEntitiesPrivateState1Table          ; $4B07: $21 $B0 $C2
    add  hl, bc                                   ; $4B0A: $09
    ld   a, [hl]                                  ; $4B0B: $7E
    cp   $04                                      ; $4B0C: $FE $04
    jr   z, jr_004_4B11                           ; $4B0E: $28 $01

    inc  [hl]                                     ; $4B10: $34

jr_004_4B11:
    ret                                           ; $4B11: $C9
