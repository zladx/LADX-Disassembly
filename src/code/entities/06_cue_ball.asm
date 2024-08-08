Data_006_4B76::
    db   $00, $03, $01, $02

CueBallEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 06:4B7A $21 $B0 $C2
    add  hl, bc                                   ;; 06:4B7D $09
    ld   a, [hl]                                  ;; 06:4B7E $7E
    and  a                                        ;; 06:4B7F $A7
    jp   nz, label_006_4E88                       ;; 06:4B80 $C2 $88 $4E

    ld   hl, wEntitiesPrivateState3Table          ;; 06:4B83 $21 $D0 $C2
    add  hl, bc                                   ;; 06:4B86 $09
    ld   a, [hl]                                  ;; 06:4B87 $7E
    and  a                                        ;; 06:4B88 $A7
    jr   nz, .jr_4B98                             ;; 06:4B89 $20 $0D

    inc  [hl]                                     ;; 06:4B8B $34
    ld   hl, wEntitiesHealthTable                 ;; 06:4B8C $21 $60 $C3
    add  hl, bc                                   ;; 06:4B8F $09
    ld   [hl], $08                                ;; 06:4B90 $36 $08
    ld   hl, wEntitiesPrivateState4Table          ;; 06:4B92 $21 $40 $C4
    add  hl, bc                                   ;; 06:4B95 $09
    ld   [hl], $01                                ;; 06:4B96 $36 $01

.jr_4B98
    call label_394D                               ;; 06:4B98 $CD $4D $39
    call func_006_4E64                            ;; 06:4B9B $CD $64 $4E
    ldh  a, [hActiveEntityStatus]                 ;; 06:4B9E $F0 $EA
    cp   $05                                      ;; 06:4BA0 $FE $05
    jp   nz, label_006_5308                       ;; 06:4BA2 $C2 $08 $53

    call ReturnIfNonInteractive_06                ;; 06:4BA5 $CD $C6 $64
    call BossIntro                                ;; 06:4BA8 $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ;; 06:4BAB $CD $56 $0C
    call label_3B44                               ;; 06:4BAE $CD $44 $3B
    call UpdateEntityPosWithSpeed_06              ;; 06:4BB1 $CD $41 $65
    ld   a, [wIsLinkInTheAir]                     ;; 06:4BB4 $FA $46 $C1
    and  a                                        ;; 06:4BB7 $A7
    jr   nz, jr_006_4BE1                          ;; 06:4BB8 $20 $27

    ld   hl, wEntitiesOptions1Table               ;; 06:4BBA $21 $30 $C4
    add  hl, bc                                   ;; 06:4BBD $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IS_MINI_BOSS ;; 06:4BBE $36 $C4
    ldh  a, [hActiveEntityState]                  ;; 06:4BC0 $F0 $F0
    and  a                                        ;; 06:4BC2 $A7
    jr   nz, .jr_4BDE                             ;; 06:4BC3 $20 $19

    ld   hl, wEntitiesDirectionTable              ;; 06:4BC5 $21 $80 $C3
    add  hl, bc                                   ;; 06:4BC8 $09
    ld   e, [hl]                                  ;; 06:4BC9 $5E
    ld   d, b                                     ;; 06:4BCA $50
    ld   hl, Data_006_4B76                        ;; 06:4BCB $21 $76 $4B
    add  hl, de                                   ;; 06:4BCE $19
    ld   a, [hl]                                  ;; 06:4BCF $7E
    push af                                       ;; 06:4BD0 $F5
    call GetEntityDirectionToLink_06              ;; 06:4BD1 $CD $B4 $65
    pop  af                                       ;; 06:4BD4 $F1
    cp   e                                        ;; 06:4BD5 $BB
    jr   z, .jr_4BDE                              ;; 06:4BD6 $28 $06

    ld   hl, wEntitiesOptions1Table               ;; 06:4BD8 $21 $30 $C4
    add  hl, bc                                   ;; 06:4BDB $09
    ld   [hl], ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_IS_MINI_BOSS ;; 06:4BDC $36 $84

.jr_4BDE
    call label_3B70                               ;; 06:4BDE $CD $70 $3B

jr_006_4BE1:
    ldh  a, [hActiveEntityState]                  ;; 06:4BE1 $F0 $F0
    JP_TABLE                                      ;; 06:4BE3
._00 dw CueBallState0Handler
._01 dw CueBallState1Handler

Data_006_4BE8::
    db   $14, $00, $EC, $00

Data_006_4BEC::
    db   $00, $14, $00, $EC

Data_006_4BF0::
    db   $06, $07, $00, $01, $04, $05, $02, $03

Data_006_4BF8::
    db   $10, $10, $F4, $0C, $F0, $F0, $F4, $0C

Data_006_4C00::
    db   $F4, $0C, $10, $10, $F4, $0C, $F0, $F0

Data_006_4C08::
    db   $80, $80, $80, $7F, $7F, $7F, $80, $7F

Data_006_4C10::
    db   $80, $7F, $80, $80, $80, $7F, $7F, $7F

Data_006_4C18::
    db   $00, $02, $00, $01, $01, $03, $02, $03

CueBallState0Handler::
    ld   hl, wEntitiesFlashCountdownTable         ;; 06:4C20 $21 $20 $C4
    add  hl, bc                                   ;; 06:4C23 $09
    ld   a, [hl]                                  ;; 06:4C24 $7E
    and  a                                        ;; 06:4C25 $A7
    jr   z, jr_006_4C4F                           ;; 06:4C26 $28 $27

    call func_006_4C59                            ;; 06:4C28 $CD $59 $4C
    call IncrementEntityState                     ;; 06:4C2B $CD $12 $3B
    ld   hl, wEntitiesDirectionTable              ;; 06:4C2E $21 $80 $C3
    add  hl, bc                                   ;; 06:4C31 $09

.jr_4C32
    ld   a, [hl]                                  ;; 06:4C32 $7E
    ld   hl, wEntitiesPrivateState5Table          ;; 06:4C33 $21 $90 $C3
    add  hl, bc                                   ;; 06:4C36 $09
    ld   [hl], a                                  ;; 06:4C37 $77
    call GetEntityTransitionCountdown             ;; 06:4C38 $CD $05 $0C
    ld   [hl], $58                                ;; 06:4C3B $36 $58
    call GetRandomByte                            ;; 06:4C3D $CD $0D $28
    and  $01                                      ;; 06:4C40 $E6 $01
    jr   nz, .jr_4C4C                             ;; 06:4C42 $20 $08

    ld   hl, wEntitiesPrivateState4Table          ;; 06:4C44 $21 $40 $C4
    add  hl, bc                                   ;; 06:4C47 $09
    ld   a, [hl]                                  ;; 06:4C48 $7E
    cpl                                           ;; 06:4C49 $2F
    inc  a                                        ;; 06:4C4A $3C
    ld   [hl], a                                  ;; 06:4C4B $77

.jr_4C4C
    jp   ClearEntitySpeed                         ;; 06:4C4C $C3 $7F $3D

jr_006_4C4F:
    call GetEntityTransitionCountdown             ;; 06:4C4F $CD $05 $0C
    jr   z, func_006_4C59                         ;; 06:4C52 $28 $05

    cp   $01                                      ;; 06:4C54 $FE $01
    jr   z, jr_006_4C83                           ;; 06:4C56 $28 $2B

    ret                                           ;; 06:4C58 $C9

func_006_4C59::
    ld   hl, wEntitiesPosXTable                   ;; 06:4C59 $21 $00 $C2
    add  hl, bc                                   ;; 06:4C5C $09
    ld   a, [hl]                                  ;; 06:4C5D $7E
    cp   $20                                      ;; 06:4C5E $FE $20
    jr   c, jr_006_4C78                           ;; 06:4C60 $38 $16

    cp   $80                                      ;; 06:4C62 $FE $80
    jr   nc, jr_006_4C78                          ;; 06:4C64 $30 $12

    ld   hl, wEntitiesPosYTable                   ;; 06:4C66 $21 $10 $C2
    add  hl, bc                                   ;; 06:4C69 $09
    ld   a, [hl]                                  ;; 06:4C6A $7E
    cp   $28                                      ;; 06:4C6B $FE $28
    jr   c, .jr_4C73                              ;; 06:4C6D $38 $04

    cp   $68                                      ;; 06:4C6F $FE $68
    jr   c, func_006_4C91                         ;; 06:4C71 $38 $1E

.jr_4C73
    ldh  a, [hActiveEntityPosY]                   ;; 06:4C73 $F0 $EF
    ld   [hl], a                                  ;; 06:4C75 $77
    jr   jr_006_4C7B                              ;; 06:4C76 $18 $03

jr_006_4C78:
    ldh  a, [hActiveEntityPosX]                   ;; 06:4C78 $F0 $EE
    ld   [hl], a                                  ;; 06:4C7A $77

jr_006_4C7B:
    call GetEntityTransitionCountdown             ;; 06:4C7B $CD $05 $0C
    ld   [hl], $15                                ;; 06:4C7E $36 $15
    jp   ClearEntitySpeed                         ;; 06:4C80 $C3 $7F $3D

jr_006_4C83:
    ld   hl, wEntitiesPrivateState4Table          ;; 06:4C83 $21 $40 $C4
    add  hl, bc                                   ;; 06:4C86 $09
    ld   e, [hl]                                  ;; 06:4C87 $5E
    ld   hl, wEntitiesDirectionTable              ;; 06:4C88 $21 $80 $C3
    add  hl, bc                                   ;; 06:4C8B $09
    ld   a, [hl]                                  ;; 06:4C8C $7E
    add  e                                        ;; 06:4C8D $83
    and  $03                                      ;; 06:4C8E $E6 $03
    ld   [hl], a                                  ;; 06:4C90 $77

func_006_4C91::
    ld   hl, wEntitiesDirectionTable              ;; 06:4C91 $21 $80 $C3
    add  hl, bc                                   ;; 06:4C94 $09
    ld   a, [hl]                                  ;; 06:4C95 $7E
    ld   e, a                                     ;; 06:4C96 $5F
    ld   d, b                                     ;; 06:4C97 $50
    ld   hl, Data_006_4BE8                        ;; 06:4C98 $21 $E8 $4B
    add  hl, de                                   ;; 06:4C9B $19
    ld   a, [hl]                                  ;; 06:4C9C $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:4C9D $21 $40 $C2
    add  hl, bc                                   ;; 06:4CA0 $09
    ld   [hl], a                                  ;; 06:4CA1 $77
    ld   hl, Data_006_4BEC                        ;; 06:4CA2 $21 $EC $4B
    add  hl, de                                   ;; 06:4CA5 $19
    ld   a, [hl]                                  ;; 06:4CA6 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4CA7 $21 $50 $C2
    add  hl, bc                                   ;; 06:4CAA $09
    ld   [hl], a                                  ;; 06:4CAB $77
    sla  e                                        ;; 06:4CAC $CB $23
    ldh  a, [hFrameCounter]                       ;; 06:4CAE $F0 $E7
    rra                                           ;; 06:4CB0 $1F
    rra                                           ;; 06:4CB1 $1F
    rra                                           ;; 06:4CB2 $1F
    and  $01                                      ;; 06:4CB3 $E6 $01
    or   e                                        ;; 06:4CB5 $B3
    and  $07                                      ;; 06:4CB6 $E6 $07
    ld   e, a                                     ;; 06:4CB8 $5F
    ld   d, b                                     ;; 06:4CB9 $50
    ld   hl, Data_006_4BF0                        ;; 06:4CBA $21 $F0 $4B
    add  hl, de                                   ;; 06:4CBD $19
    ld   a, [hl]                                  ;; 06:4CBE $7E
    call SetEntitySpriteVariant                   ;; 06:4CBF $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 06:4CC2 $F0 $E7
    and  $0F                                      ;; 06:4CC4 $E6 $0F
    jr   nz, ret_006_4D3A                         ;; 06:4CC6 $20 $72

    ld   a, NOISE_SFX_CUEBALL_SPLASH              ;; 06:4CC8 $3E $2F
    ldh  [hNoiseSfx], a                           ;; 06:4CCA $E0 $F4
    ld   a, $01                                   ;; 06:4CCC $3E $01

.loop_4CCE
    ldh  [hMultiPurposeG], a                      ;; 06:4CCE $E0 $E8
    ld   a, ENTITY_CUE_BALL                       ;; 06:4CD0 $3E $8E
    call SpawnNewEntity_trampoline                ;; 06:4CD2 $CD $86 $3B
    jr   c, ret_006_4D3A                          ;; 06:4CD5 $38 $63

    push bc                                       ;; 06:4CD7 $C5
    ld   hl, wEntitiesDirectionTable              ;; 06:4CD8 $21 $80 $C3
    add  hl, bc                                   ;; 06:4CDB $09
    ld   a, [hl]                                  ;; 06:4CDC $7E
    sla  a                                        ;; 06:4CDD $CB $27
    ld   hl, hMultiPurposeG                       ;; 06:4CDF $21 $E8 $FF
    or   [hl]                                     ;; 06:4CE2 $B6
    ld   c, a                                     ;; 06:4CE3 $4F
    ld   hl, Data_006_4BF8                        ;; 06:4CE4 $21 $F8 $4B
    add  hl, bc                                   ;; 06:4CE7 $09
    ldh  a, [hMultiPurpose0]                      ;; 06:4CE8 $F0 $D7
    add  [hl]                                     ;; 06:4CEA $86
    ld   hl, wEntitiesPosXTable                   ;; 06:4CEB $21 $00 $C2
    add  hl, de                                   ;; 06:4CEE $19
    ld   [hl], a                                  ;; 06:4CEF $77
    ld   hl, Data_006_4C00                        ;; 06:4CF0 $21 $00 $4C
    add  hl, bc                                   ;; 06:4CF3 $09
    ldh  a, [hMultiPurpose1]                      ;; 06:4CF4 $F0 $D8
    add  [hl]                                     ;; 06:4CF6 $86
    ld   hl, wEntitiesPosYTable                   ;; 06:4CF7 $21 $10 $C2
    add  hl, de                                   ;; 06:4CFA $19
    ld   [hl], a                                  ;; 06:4CFB $77
    ld   hl, Data_006_4C08                        ;; 06:4CFC $21 $08 $4C
    add  hl, bc                                   ;; 06:4CFF $09
    ld   a, [hl]                                  ;; 06:4D00 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:4D01 $21 $40 $C2
    add  hl, de                                   ;; 06:4D04 $19
    ld   [hl], a                                  ;; 06:4D05 $77
    ld   hl, Data_006_4C10                        ;; 06:4D06 $21 $10 $4C
    add  hl, bc                                   ;; 06:4D09 $09
    ld   a, [hl]                                  ;; 06:4D0A $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:4D0B $21 $50 $C2
    add  hl, de                                   ;; 06:4D0E $19
    ld   [hl], a                                  ;; 06:4D0F $77
    ld   hl, Data_006_4C18                        ;; 06:4D10 $21 $18 $4C
    add  hl, bc                                   ;; 06:4D13 $09
    ld   a, [hl]                                  ;; 06:4D14 $7E
    ld   hl, wEntitiesSpriteVariantTable          ;; 06:4D15 $21 $B0 $C3
    add  hl, de                                   ;; 06:4D18 $19
    ld   [hl], a                                  ;; 06:4D19 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 06:4D1A $21 $B0 $C2
    add  hl, de                                   ;; 06:4D1D $19
    ld   [hl], $01                                ;; 06:4D1E $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:4D20 $21 $40 $C3
    add  hl, de                                   ;; 06:4D23 $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 06:4D24 $36 $C2
    ld   hl, wEntitiesOptions1Table               ;; 06:4D26 $21 $30 $C4
    add  hl, de                                   ;; 06:4D29 $19
    ld   [hl], ENTITY_OPT1_NONE                   ;; 06:4D2A $36 $00
    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:4D2C $21 $E0 $C2
    add  hl, de                                   ;; 06:4D2F $19
    ld   [hl], $0C                                ;; 06:4D30 $36 $0C
    pop  bc                                       ;; 06:4D32 $C1
    ldh  a, [hMultiPurposeG]                      ;; 06:4D33 $F0 $E8
    dec  a                                        ;; 06:4D35 $3D
    cp   $FF                                      ;; 06:4D36 $FE $FF
    jr   nz, .loop_4CCE                           ;; 06:4D38 $20 $94

ret_006_4D3A:
    ret                                           ;; 06:4D3A $C9

CueBallState1Handler::
    call GetEntityTransitionCountdown             ;; 06:4D3B $CD $05 $0C
    jr   nz, .jr_4D51                             ;; 06:4D3E $20 $11

    ld   hl, wEntitiesPrivateState5Table          ;; 06:4D40 $21 $90 $C3
    add  hl, bc                                   ;; 06:4D43 $09
    ld   a, [hl]                                  ;; 06:4D44 $7E
    xor  $02                                      ;; 06:4D45 $EE $02
    ld   hl, wEntitiesDirectionTable              ;; 06:4D47 $21 $80 $C3
    add  hl, bc                                   ;; 06:4D4A $09
    ld   [hl], a                                  ;; 06:4D4B $77
    call IncrementEntityState                     ;; 06:4D4C $CD $12 $3B
    ld   [hl], b                                  ;; 06:4D4F $70
    ret                                           ;; 06:4D50 $C9

.jr_4D51
    and  $03                                      ;; 06:4D51 $E6 $03
    jr   nz, .jr_4D5E                             ;; 06:4D53 $20 $09

    ld   hl, wEntitiesDirectionTable              ;; 06:4D55 $21 $80 $C3
    add  hl, bc                                   ;; 06:4D58 $09
    ld   a, [hl]                                  ;; 06:4D59 $7E
    inc  a                                        ;; 06:4D5A $3C
    and  $03                                      ;; 06:4D5B $E6 $03
    ld   [hl], a                                  ;; 06:4D5D $77

.jr_4D5E
    call func_006_4C91                            ;; 06:4D5E $CD $91 $4C
    jp   ClearEntitySpeed                         ;; 06:4D61 $C3 $7F $3D

Data_006_4D64::
    db   $F8, $F8, $60, $02, $F8, $00, $62, $02, $F8, $08, $62, $22, $F8, $10, $60, $22
    db   $08, $F8, $64, $02, $08, $00, $66, $02, $08, $08, $66, $22, $08, $10, $64, $22
    db   $FA, $F8, $60, $02, $FA, $00, $62, $02, $FA, $08, $62, $22, $FA, $10, $60, $22
    db   $08, $F8, $64, $02, $08, $00, $66, $02, $08, $08, $66, $22, $08, $10, $64, $22
    db   $F8, $F8, $64, $42, $F8, $00, $66, $42, $F8, $08, $66, $62, $F8, $10, $64, $62
    db   $08, $F8, $60, $42, $08, $00, $62, $42, $08, $08, $62, $62, $08, $10, $60, $62
    db   $F8, $F8, $64, $42, $F8, $00, $66, $42, $F8, $08, $66, $62, $F8, $10, $64, $62
    db   $06, $F8, $60, $42, $06, $00, $62, $42, $06, $08, $62, $62, $06, $10, $60, $62
    db   $F8, $F8, $68, $02, $F8, $00, $6A, $02, $F8, $08, $62, $22, $F8, $10, $60, $22
    db   $08, $F8, $68, $42, $08, $00, $6A, $42, $08, $08, $62, $62, $08, $10, $60, $62
    db   $F8, $F8, $68, $02, $F8, $00, $6A, $02, $F8, $06, $62, $22, $F8, $0E, $60, $22
    db   $08, $F8, $68, $42, $08, $00, $6A, $42, $08, $06, $62, $62, $08, $0E, $60, $62
    db   $F8, $F8, $60, $02, $F8, $00, $62, $02, $F8, $08, $6A, $22, $F8, $10, $68, $22
    db   $08, $F8, $60, $42, $08, $00, $62, $42, $08, $08, $6A, $62, $08, $10, $68, $62
    db   $F8, $FA, $60, $02, $F8, $02, $62, $02, $F8, $08, $6A, $22, $F8, $10, $68, $22
    db   $08, $FA, $60, $42, $08, $02, $62, $42, $08, $08, $6A, $62, $08, $10, $68, $62

func_006_4E64::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:4E64 $F0 $F1
    rla                                           ;; 06:4E66 $17
    rla                                           ;; 06:4E67 $17
    rla                                           ;; 06:4E68 $17
    rla                                           ;; 06:4E69 $17
    rla                                           ;; 06:4E6A $17
    and  $E0                                      ;; 06:4E6B $E6 $E0
    ld   e, a                                     ;; 06:4E6D $5F
    ld   d, b                                     ;; 06:4E6E $50
    ld   hl, Data_006_4D64                        ;; 06:4E6F $21 $64 $4D
    add  hl, de                                   ;; 06:4E72 $19
    ld   c, $08                                   ;; 06:4E73 $0E $08
    jp   RenderActiveEntitySpritesRect            ;; 06:4E75 $C3 $E6 $3C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CueBallSpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
.variant3
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

label_006_4E88:
    ld   de, CueBallSpriteVariants                ;; 06:4E88 $11 $78 $4E
    call RenderActiveEntitySpritesPair            ;; 06:4E8B $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:4E8E $CD $C6 $64
    call GetEntityTransitionCountdown             ;; 06:4E91 $CD $05 $0C
    jp   z, ClearEntityStatus_06                  ;; 06:4E94 $CA $DB $65

    cp   $06                                      ;; 06:4E97 $FE $06
    ret  nz                                       ;; 06:4E99 $C0

    jp   UpdateEntityPosWithSpeed_06              ;; 06:4E9A $C3 $41 $65
