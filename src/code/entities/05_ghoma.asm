Data_005_7B51::
    db   $10, $F0

Data_005_7B53::
    db   $18, $E8

Data_005_7B55::
    db   $00, $F0, $64, $00, $00, $F8, $66, $00, $00, $00, $60, $00, $00, $08, $60, $20
    db   $00, $10, $6A, $20, $00, $18, $68, $20, $00, $F0, $6C, $00, $00, $F8, $6E, $00
    db   $00, $00, $60, $00, $00, $08, $60, $20, $00, $10, $6E, $20, $00, $18, $6C, $20
    db   $00, $F0, $68, $00, $00, $F8, $6A, $00, $00, $00, $60, $00, $00, $08, $60, $20
    db   $00, $10, $66, $20, $00, $18, $64, $20, $00, $F0, $64, $00, $00, $F8, $66, $00
    db   $00, $00, $62, $00, $00, $08, $62, $20, $00, $10, $6A, $20, $00, $18, $68, $20
    db   $00, $F0, $6C, $00, $00, $F8, $6E, $00, $00, $00, $62, $00, $00, $08, $62, $20
    db   $00, $10, $6E, $20, $00, $18, $6C, $20, $00, $F0, $68, $00, $00, $F8, $6A, $00
    db   $00, $00, $62, $00, $00, $08, $62, $20, $00, $10, $66, $20, $00, $18, $64, $20

GhomaEntityHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 05:7BE5 $FA $66 $C1
    cp   $01                                      ;; 05:7BE8 $FE $01
    jr   nz, .jr_7BF6                             ;; 05:7BEA $20 $0A

    call func_005_7CD5                            ;; 05:7BEC $CD $D5 $7C
    ld   hl, wEntitiesStateTable                  ;; 05:7BEF $21 $90 $C2
    add  hl, bc                                   ;; 05:7BF2 $09
    ld   a, [hl]                                  ;; 05:7BF3 $7E
    ldh  [hActiveEntityState], a                  ;; 05:7BF4 $E0 $F0

.jr_7BF6
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:7BF6 $F0 $F1
    rla                                           ;; 05:7BF8 $17
    rla                                           ;; 05:7BF9 $17
    rla                                           ;; 05:7BFA $17
    and  $F8                                      ;; 05:7BFB $E6 $F8
    ld   c, a                                     ;; 05:7BFD $4F
    rla                                           ;; 05:7BFE $17
    and  $F0                                      ;; 05:7BFF $E6 $F0
    add  c                                        ;; 05:7C01 $81
    ld   e, a                                     ;; 05:7C02 $5F
    ld   d, b                                     ;; 05:7C03 $50
    ld   hl, Data_005_7B55                        ;; 05:7C04 $21 $55 $7B
    add  hl, de                                   ;; 05:7C07 $19
    ld   c, $06                                   ;; 05:7C08 $0E $06
    call RenderActiveEntitySpritesRect            ;; 05:7C0A $CD $E6 $3C
    ld   a, $06                                   ;; 05:7C0D $3E $06
    call func_015_7964_trampoline                 ;; 05:7C0F $CD $A0 $3D
    ldh  a, [hActiveEntityStatus]                 ;; 05:7C12 $F0 $EA
    cp   $05                                      ;; 05:7C14 $FE $05
    jp   nz, label_005_7E6C                       ;; 05:7C16 $C2 $6C $7E

    call ReturnIfNonInteractive_05                ;; 05:7C19 $CD $3A $7A

.jr_7C1C
    call BossIntro                                ;; 05:7C1C $CD $E8 $3E
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 05:7C1F $CD $39 $3B
    call UpdateEntityPosWithSpeed_05              ;; 05:7C22 $CD $B1 $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:7C25 $CD $23 $3B
    call DecrementEntityIgnoreHitsCountdown       ;; 05:7C28 $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 05:7C2B $F0 $F0
    JP_TABLE                                      ;; 05:7C2D
._00 dw func_005_7C36                             ;; 05:7C2E
._01 dw func_005_7C52                             ;; 05:7C30
._02 dw func_005_7D62                             ;; 05:7C32
._03 dw func_005_7E0A                             ;; 05:7C34

func_005_7C36::
    call GetRandomByte                            ;; 05:7C36 $CD $0D $28
    and  $01                                      ;; 05:7C39 $E6 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 05:7C3B $21 $B0 $C2
    add  hl, bc                                   ;; 05:7C3E $09
    ld   [hl], a                                  ;; 05:7C3F $77
    ld   e, a                                     ;; 05:7C40 $5F
    ld   d, b                                     ;; 05:7C41 $50
    ld   hl, Data_005_7B51                        ;; 05:7C42 $21 $51 $7B
    add  hl, de                                   ;; 05:7C45 $19
    ld   a, [hl]                                  ;; 05:7C46 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7C47 $21 $40 $C2
    add  hl, bc                                   ;; 05:7C4A $09
    ld   [hl], a                                  ;; 05:7C4B $77
    call IncrementEntityState                     ;; 05:7C4C $CD $12 $3B
    ld   [hl], $01                                ;; 05:7C4F $36 $01
    ret                                           ;; 05:7C51 $C9

func_005_7C52::
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:7C52 $21 $00 $C3
    add  hl, bc                                   ;; 05:7C55 $09
    ld   a, [hl]                                  ;; 05:7C56 $7E
    and  a                                        ;; 05:7C57 $A7
    ret  nz                                       ;; 05:7C58 $C0

    call GetEntityPrivateCountdown1               ;; 05:7C59 $CD $00 $0C
    jp   nz, label_005_7CE8                       ;; 05:7C5C $C2 $E8 $7C

    call GetEntityTransitionCountdown             ;; 05:7C5F $CD $05 $0C
    jr   z, .jr_7C89                              ;; 05:7C62 $28 $25

    cp   $01                                      ;; 05:7C64 $FE $01
    jr   nz, jr_005_7C9C                          ;; 05:7C66 $20 $34

    call GetEntityToLinkPositionDeltaX_05         ;; 05:7C68 $CD $04 $7B
    ld   d, b                                     ;; 05:7C6B $50
    ld   hl, Data_005_7B53                        ;; 05:7C6C $21 $53 $7B
    add  hl, de                                   ;; 05:7C6F $19
    ld   a, [hl]                                  ;; 05:7C70 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7C71 $21 $40 $C2
    add  hl, bc                                   ;; 05:7C74 $09
    ld   [hl], a                                  ;; 05:7C75 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7C76 $21 $50 $C2
    add  hl, bc                                   ;; 05:7C79 $09
    ld   [hl], b                                  ;; 05:7C7A $70
    call GetEntityPrivateCountdown1               ;; 05:7C7B $CD $00 $0C
    call GetRandomByte                            ;; 05:7C7E $CD $0D $28
    and  $3F                                      ;; 05:7C81 $E6 $3F
    add  $60                                      ;; 05:7C83 $C6 $60
    ld   [hl], a                                  ;; 05:7C85 $77
    jp   label_005_7CE8                           ;; 05:7C86 $C3 $E8 $7C

.jr_7C89
    ld   hl, wEntitiesPosYTable                   ;; 05:7C89 $21 $10 $C2
    add  hl, bc                                   ;; 05:7C8C $09
    ld   a, [hl]                                  ;; 05:7C8D $7E
    add  $08                                      ;; 05:7C8E $C6 $08
    ld   hl, hLinkPositionY                       ;; 05:7C90 $21 $99 $FF
    cp   [hl]                                     ;; 05:7C93 $BE
    jp   c, label_005_7CB3                        ;; 05:7C94 $DA $B3 $7C

    call GetEntityTransitionCountdown             ;; 05:7C97 $CD $05 $0C
    ld   [hl], $60                                ;; 05:7C9A $36 $60

jr_005_7C9C:
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7C9C $21 $50 $C2
    add  hl, bc                                   ;; 05:7C9F $09
    ld   [hl], b                                  ;; 05:7CA0 $70
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7CA1 $21 $40 $C2
    add  hl, bc                                   ;; 05:7CA4 $09
    and  $04                                      ;; 05:7CA5 $E6 $04
    jr   nz, .jr_7CAE                             ;; 05:7CA7 $20 $05

    ld   [hl], $08                                ;; 05:7CA9 $36 $08
    jp   label_005_7D40                           ;; 05:7CAB $C3 $40 $7D

.jr_7CAE
    ld   [hl], $F8                                ;; 05:7CAE $36 $F8
    jp   label_005_7D40                           ;; 05:7CB0 $C3 $40 $7D

label_005_7CB3:
    ld   hl, wEntitiesPosYTable                   ;; 05:7CB3 $21 $10 $C2
    add  hl, bc                                   ;; 05:7CB6 $09
    ldh  a, [hLinkPositionY]                      ;; 05:7CB7 $F0 $99
    sub  [hl]                                     ;; 05:7CB9 $96
    cp   $28                                      ;; 05:7CBA $FE $28
    jr   nc, label_005_7CE8                       ;; 05:7CBC $30 $2A

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 05:7CBE $21 $80 $C4
    add  hl, bc                                   ;; 05:7CC1 $09
    ld   a, [hl]                                  ;; 05:7CC2 $7E
    and  a                                        ;; 05:7CC3 $A7
    jr   nz, label_005_7CE8                       ;; 05:7CC4 $20 $22

    call GetRandomByte                            ;; 05:7CC6 $CD $0D $28
    and  $7F                                      ;; 05:7CC9 $E6 $7F
    add  $40                                      ;; 05:7CCB $C6 $40
    ld   [hl], a                                  ;; 05:7CCD $77
    and  $03                                      ;; 05:7CCE $E6 $03
    jr   z, jr_005_7D21                           ;; 05:7CD0 $28 $4F

    dec  a                                        ;; 05:7CD2 $3D
    jr   nz, label_005_7CE8                       ;; 05:7CD3 $20 $13

func_005_7CD5::
    call IncrementEntityState                     ;; 05:7CD5 $CD $12 $3B
    ld   [hl], $03                                ;; 05:7CD8 $36 $03
    call ClearEntitySpeed                         ;; 05:7CDA $CD $7F $3D
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:7CDD $21 $00 $C3
    add  hl, bc                                   ;; 05:7CE0 $09
    ld   [hl], $40                                ;; 05:7CE1 $36 $40

IF __PATCH_3__
    ld   hl, wEntitiesHitboxFlagsTable
    add  hl, bc
    ld   [hl], $80
ENDC

    ld   a, $01                                   ;; 05:7CE3 $3E $01
    jp   label_005_7D5F                           ;; 05:7CE5 $C3 $5F $7D

label_005_7CE8:
    ld   hl, wEntitiesCollisionsTable             ;; 05:7CE8 $21 $A0 $C2
    add  hl, bc                                   ;; 05:7CEB $09
    ld   a, [hl]                                  ;; 05:7CEC $7E
    and  $03                                      ;; 05:7CED $E6 $03
    jr   z, jr_005_7D09                           ;; 05:7CEF $28 $18

    call GetEntityPrivateCountdown1               ;; 05:7CF1 $CD $00 $0C
    jr   z, .jr_7D01                              ;; 05:7CF4 $28 $0B

    ld   hl, wEntitiesSpeedXTable                 ;; 05:7CF6 $21 $40 $C2
    add  hl, bc                                   ;; 05:7CF9 $09
    ld   a, [hl]                                  ;; 05:7CFA $7E
    xor  $F0                                      ;; 05:7CFB $EE $F0
    ld   [hl], a                                  ;; 05:7CFD $77
    jp   label_005_7D40                           ;; 05:7CFE $C3 $40 $7D

.jr_7D01
    ld   hl, wEntitiesPrivateState1Table          ;; 05:7D01 $21 $B0 $C2
    add  hl, bc                                   ;; 05:7D04 $09
    ld   a, [hl]                                  ;; 05:7D05 $7E
    xor  $01                                      ;; 05:7D06 $EE $01
    ld   [hl], a                                  ;; 05:7D08 $77

jr_005_7D09:
    call GetEntityPrivateCountdown1               ;; 05:7D09 $CD $00 $0C
    jr   nz, label_005_7D40                       ;; 05:7D0C $20 $32

    ld   hl, wEntitiesPrivateState1Table          ;; 05:7D0E $21 $B0 $C2
    add  hl, bc                                   ;; 05:7D11 $09
    ld   a, [hl]                                  ;; 05:7D12 $7E
    ld   e, a                                     ;; 05:7D13 $5F
    ld   d, b                                     ;; 05:7D14 $50
    ld   hl, Data_005_7B51                        ;; 05:7D15 $21 $51 $7B
    add  hl, de                                   ;; 05:7D18 $19
    ld   a, [hl]                                  ;; 05:7D19 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7D1A $21 $40 $C2
    add  hl, bc                                   ;; 05:7D1D $09
    ld   [hl], a                                  ;; 05:7D1E $77
    jr   jr_005_7D48                              ;; 05:7D1F $18 $27

jr_005_7D21:
    call GetEntityTransitionCountdown             ;; 05:7D21 $CD $05 $0C
    ld   [hl], $60                                ;; 05:7D24 $36 $60
    call GetEntityPrivateCountdown1               ;; 05:7D26 $CD $00 $0C
    ld   [hl], b                                  ;; 05:7D29 $70
    call IncrementEntityState                     ;; 05:7D2A $CD $12 $3B
    ld   [hl], $02                                ;; 05:7D2D $36 $02
    ld   hl, wEntitiesPrivateState1Table          ;; 05:7D2F $21 $B0 $C2
    add  hl, bc                                   ;; 05:7D32 $09
    ld   [hl], b                                  ;; 05:7D33 $70
    ld   hl, wEntitiesPosYTable                   ;; 05:7D34 $21 $10 $C2
    add  hl, bc                                   ;; 05:7D37 $09
    ld   a, [hl]                                  ;; 05:7D38 $7E
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7D39 $21 $D0 $C2
    add  hl, bc                                   ;; 05:7D3C $09
    ld   [hl], a                                  ;; 05:7D3D $77
    jr   jr_005_7D48                              ;; 05:7D3E $18 $08

label_005_7D40:
    ldh  a, [hFrameCounter]                       ;; 05:7D40 $F0 $E7
    and  $07                                      ;; 05:7D42 $E6 $07
    jr   z, jr_005_7D4E                           ;; 05:7D44 $28 $08

    jr   jr_005_7D5A                              ;; 05:7D46 $18 $12

jr_005_7D48:
    ldh  a, [hFrameCounter]                       ;; 05:7D48 $F0 $E7
    and  $0F                                      ;; 05:7D4A $E6 $0F
    jr   nz, jr_005_7D5A                          ;; 05:7D4C $20 $0C

jr_005_7D4E:
    ld   hl, wEntitiesInertiaTable                ;; 05:7D4E $21 $D0 $C3
    add  hl, bc                                   ;; 05:7D51 $09
    inc  [hl]                                     ;; 05:7D52 $34
    ld   a, [hl]                                  ;; 05:7D53 $7E
    cp   $03                                      ;; 05:7D54 $FE $03
    jr   nz, jr_005_7D5A                          ;; 05:7D56 $20 $02

    ld   [hl], $00                                ;; 05:7D58 $36 $00

jr_005_7D5A:
    ld   hl, wEntitiesInertiaTable                ;; 05:7D5A $21 $D0 $C3
    add  hl, bc                                   ;; 05:7D5D $09
    ld   a, [hl]                                  ;; 05:7D5E $7E

label_005_7D5F:
    jp   SetEntitySpriteVariant                   ;; 05:7D5F $C3 $0C $3B

func_005_7D62::
    ld   hl, wEntitiesPrivateState1Table          ;; 05:7D62 $21 $B0 $C2
    add  hl, bc                                   ;; 05:7D65 $09
    ld   a, [hl]                                  ;; 05:7D66 $7E
    and  a                                        ;; 05:7D67 $A7
    jp   nz, label_005_7DDC                       ;; 05:7D68 $C2 $DC $7D

    call GetEntityTransitionCountdown             ;; 05:7D6B $CD $05 $0C
    cp   $02                                      ;; 05:7D6E $FE $02
    jr   nc, jr_005_7DCC                          ;; 05:7D70 $30 $5A

    cp   $00                                      ;; 05:7D72 $FE $00
    jr   z, jr_005_7DA8                           ;; 05:7D74 $28 $32

    ld   hl, hLinkPositionY                       ;; 05:7D76 $21 $99 $FF
    ld   a, [hl]                                  ;; 05:7D79 $7E
    ld   hl, wEntitiesPrivateState5Table          ;; 05:7D7A $21 $90 $C3
    add  hl, bc                                   ;; 05:7D7D $09
    ld   [hl], a                                  ;; 05:7D7E $77
    call GetRandomByte                            ;; 05:7D7F $CD $0D $28
    and  $02                                      ;; 05:7D82 $E6 $02
    jr   z, .jr_7D92                              ;; 05:7D84 $28 $0C

    call ClearEntitySpeed                         ;; 05:7D86 $CD $7F $3D
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7D89 $21 $50 $C2
    add  hl, bc                                   ;; 05:7D8C $09
    ld   [hl], $10                                ;; 05:7D8D $36 $10
    jp   label_005_7D97                           ;; 05:7D8F $C3 $97 $7D

.jr_7D92
    ld   a, $10                                   ;; 05:7D92 $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 05:7D94 $CD $AA $3B

label_005_7D97:
    ld   hl, wEntitiesPosYTable                   ;; 05:7D97 $21 $10 $C2
    add  hl, bc                                   ;; 05:7D9A $09
    ld   a, [hl]                                  ;; 05:7D9B $7E
    add  $08                                      ;; 05:7D9C $C6 $08
    ld   hl, hLinkPositionY                       ;; 05:7D9E $21 $99 $FF
    cp   [hl]                                     ;; 05:7DA1 $BE
    jp   nc, label_005_7DE8                       ;; 05:7DA2 $D2 $E8 $7D

    jp   label_005_7DF0                           ;; 05:7DA5 $C3 $F0 $7D

jr_005_7DA8:
    ld   hl, wEntitiesPrivateState5Table          ;; 05:7DA8 $21 $90 $C3
    add  hl, bc                                   ;; 05:7DAB $09
    ld   a, [hl]                                  ;; 05:7DAC $7E
    sub  $08                                      ;; 05:7DAD $D6 $08
    ld   hl, wEntitiesPosYTable                   ;; 05:7DAF $21 $10 $C2
    add  hl, bc                                   ;; 05:7DB2 $09
    cp   [hl]                                     ;; 05:7DB3 $BE
    jp   nc, label_005_7DF0                       ;; 05:7DB4 $D2 $F0 $7D

    ld   hl, wEntitiesPrivateState1Table          ;; 05:7DB7 $21 $B0 $C2
    add  hl, bc                                   ;; 05:7DBA $09
    inc  [hl]                                     ;; 05:7DBB $34
    call ClearEntitySpeed                         ;; 05:7DBC $CD $7F $3D
    ld   hl, wEntitiesSpeedYTable                 ;; 05:7DBF $21 $50 $C2
    add  hl, bc                                   ;; 05:7DC2 $09
    ld   [hl], $F0                                ;; 05:7DC3 $36 $F0
    ld   a, WAVE_SFX_BOSS_GROWL                   ;; 05:7DC5 $3E $16
    ldh  [hWaveSfx], a                            ;; 05:7DC7 $E0 $F3
    jp   label_005_7DF0                           ;; 05:7DC9 $C3 $F0 $7D

jr_005_7DCC:
    ld   hl, wEntitiesSpeedXTable                 ;; 05:7DCC $21 $40 $C2
    add  hl, bc                                   ;; 05:7DCF $09
    and  $04                                      ;; 05:7DD0 $E6 $04
    jr   nz, .jr_7DD8                             ;; 05:7DD2 $20 $04

    ld   [hl], $08                                ;; 05:7DD4 $36 $08
    jr   label_005_7DF0                           ;; 05:7DD6 $18 $18

.jr_7DD8
    ld   [hl], $F8                                ;; 05:7DD8 $36 $F8
    jr   label_005_7DF0                           ;; 05:7DDA $18 $14

label_005_7DDC:
    ld   hl, wEntitiesPrivateState3Table          ;; 05:7DDC $21 $D0 $C2
    add  hl, bc                                   ;; 05:7DDF $09
    ld   a, [hl]                                  ;; 05:7DE0 $7E
    ld   hl, wEntitiesPosYTable                   ;; 05:7DE1 $21 $10 $C2
    add  hl, bc                                   ;; 05:7DE4 $09
    cp   [hl]                                     ;; 05:7DE5 $BE
    jr   c, label_005_7DF0                        ;; 05:7DE6 $38 $08

label_005_7DE8:
    call ClearEntitySpeed                         ;; 05:7DE8 $CD $7F $3D
    call IncrementEntityState                     ;; 05:7DEB $CD $12 $3B
    ld   [hl], $01                                ;; 05:7DEE $36 $01

label_005_7DF0:
    ldh  a, [hFrameCounter]                       ;; 05:7DF0 $F0 $E7
    and  $0F                                      ;; 05:7DF2 $E6 $0F
    jr   nz, .jr_7E02                             ;; 05:7DF4 $20 $0C

    ld   hl, wEntitiesInertiaTable                ;; 05:7DF6 $21 $D0 $C3
    add  hl, bc                                   ;; 05:7DF9 $09
    inc  [hl]                                     ;; 05:7DFA $34
    ld   a, [hl]                                  ;; 05:7DFB $7E
    cp   $03                                      ;; 05:7DFC $FE $03
    jr   nz, .jr_7E02                             ;; 05:7DFE $20 $02

    ld   [hl], $00                                ;; 05:7E00 $36 $00

.jr_7E02
    ld   hl, wEntitiesInertiaTable                ;; 05:7E02 $21 $D0 $C3
    add  hl, bc                                   ;; 05:7E05 $09
    ld   a, [hl]                                  ;; 05:7E06 $7E
    jp   SetEntitySpriteVariant                   ;; 05:7E07 $C3 $0C $3B

func_005_7E0A::
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:7E0A $21 $00 $C3
    add  hl, bc                                   ;; 05:7E0D $09
    ld   a, [hl]                                  ;; 05:7E0E $7E
    and  a                                        ;; 05:7E0F $A7
    jr   z, .jr_7E13                              ;; 05:7E10 $28 $01

    ret                                           ;; 05:7E12 $C9

.jr_7E13
    call GetEntityPrivateCountdown1               ;; 05:7E13 $CD $00 $0C
    cp   $02                                      ;; 05:7E16 $FE $02
    jr   nc, jr_005_7E3A                          ;; 05:7E18 $30 $20

    cp   $00                                      ;; 05:7E1A $FE $00
    jr   z, .jr_7E35                              ;; 05:7E1C $28 $17

    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:7E1E $21 $50 $C3
    add  hl, bc                                   ;; 05:7E21 $09
    ld   [hl], $80                                ;; 05:7E22 $36 $80
    ld   a, $01                                   ;; 05:7E24 $3E $01
    call SetEntitySpriteVariant                   ;; 05:7E26 $CD $0C $3B
    call IncrementEntityState                     ;; 05:7E29 $CD $12 $3B
    ld   [hl], $01                                ;; 05:7E2C $36 $01
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:7E2E $21 $00 $C3
    add  hl, bc                                   ;; 05:7E31 $09
    ld   [hl], $40                                ;; 05:7E32 $36 $40
    ret                                           ;; 05:7E34 $C9

.jr_7E35
    call GetEntityPrivateCountdown1               ;; 05:7E35 $CD $00 $0C
    ld   [hl], $30                                ;; 05:7E38 $36 $30

jr_005_7E3A:
    cp   $18                                      ;; 05:7E3A $FE $18
    jr   nz, .jr_7E61                             ;; 05:7E3C $20 $23

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ;; 05:7E3E $3E $7D
    call SpawnNewEntity_trampoline                ;; 05:7E40 $CD $86 $3B
    jr   c, .jr_7E61                              ;; 05:7E43 $38 $1C

    ldh  a, [hMultiPurpose0]                      ;; 05:7E45 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 05:7E47 $21 $00 $C2
    add  hl, de                                   ;; 05:7E4A $19
    ld   [hl], a                                  ;; 05:7E4B $77
    ldh  a, [hMultiPurpose1]                      ;; 05:7E4C $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 05:7E4E $21 $10 $C2
    add  hl, de                                   ;; 05:7E51 $19
    ld   [hl], a                                  ;; 05:7E52 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 05:7E53 $21 $B0 $C2
    add  hl, de                                   ;; 05:7E56 $19
    inc  [hl]                                     ;; 05:7E57 $34
    push bc                                       ;; 05:7E58 $C5
    ld   c, e                                     ;; 05:7E59 $4B
    ld   b, d                                     ;; 05:7E5A $42
    ld   a, $18                                   ;; 05:7E5B $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 05:7E5D $CD $AA $3B
    pop  bc                                       ;; 05:7E60 $C1

.jr_7E61
    ld   hl, wEntitiesHitboxFlagsTable            ;; 05:7E61 $21 $50 $C3
    add  hl, bc                                   ;; 05:7E64 $09
    ld   [hl], $00                                ;; 05:7E65 $36 $00
    ld   a, $04                                   ;; 05:7E67 $3E $04
    jp   SetEntitySpriteVariant                   ;; 05:7E69 $C3 $0C $3B

label_005_7E6C:
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7E6C $21 $C0 $C2
    add  hl, bc                                   ;; 05:7E6F $09
    ld   a, [hl]                                  ;; 05:7E70 $7E
    JP_TABLE                                      ;; 05:7E71
._00 dw func_005_7E78                             ;; 05:7E72
._01 dw func_005_7E89                             ;; 05:7E74
._02 dw func_005_7E98                             ;; 05:7E76

func_005_7E78::
    call GetEntityTransitionCountdown             ;; 05:7E78 $CD $05 $0C
    ld   [hl], $A0                                ;; 05:7E7B $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:7E7D $21 $20 $C4
    add  hl, bc                                   ;; 05:7E80 $09
    ld   [hl], $FF                                ;; 05:7E81 $36 $FF

label_005_7E83:
    ld   hl, wEntitiesPrivateState2Table          ;; 05:7E83 $21 $C0 $C2
    add  hl, bc                                   ;; 05:7E86 $09
    inc  [hl]                                     ;; 05:7E87 $34
    ret                                           ;; 05:7E88 $C9

func_005_7E89::
    call GetEntityTransitionCountdown             ;; 05:7E89 $CD $05 $0C
    ret  nz                                       ;; 05:7E8C $C0

    ld   [hl], $C0                                ;; 05:7E8D $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:7E8F $21 $20 $C4
    add  hl, bc                                   ;; 05:7E92 $09
    ld   [hl], $FF                                ;; 05:7E93 $36 $FF
    jp   label_005_7E83                           ;; 05:7E95 $C3 $83 $7E

func_005_7E98::
    call GetEntityTransitionCountdown             ;; 05:7E98 $CD $05 $0C
    jr   nz, jr_005_7ED4                          ;; 05:7E9B $20 $37

label_005_7E9D:
    ld   a, NOISE_SFX_BOSS_EXPLOSION              ;; 05:7E9D $3E $1A
    ldh  [hNoiseSfx], a                           ;; 05:7E9F $E0 $F4
    ldh  a, [hActiveEntityType]                   ;; 05:7EA1 $F0 $EB
    cp   ENTITY_EVIL_EAGLE                        ;; 05:7EA3 $FE $63
    jp   z, DropHeartContainer_05.evilEagle       ;; 05:7EA5 $CA $8C $75

    call DidKillEnemy                             ;; 05:7EA8 $CD $50 $3F
    ld   e, $0F                                   ;; 05:7EAB $1E $0F
    ld   d, b                                     ;; 05:7EAD $50

jr_005_7EAE:
    ld   hl, wEntitiesStatusTable                 ;; 05:7EAE $21 $80 $C2
    add  hl, de                                   ;; 05:7EB1 $19
    ld   a, [hl]                                  ;; 05:7EB2 $7E
    and  a                                        ;; 05:7EB3 $A7
    jr   z, .jr_7EBF                              ;; 05:7EB4 $28 $09

    ld   hl, wEntitiesOptions1Table               ;; 05:7EB6 $21 $30 $C4
    add  hl, de                                   ;; 05:7EB9 $19
    ld   a, [hl]                                  ;; 05:7EBA $7E
    and  $80                                      ;; 05:7EBB $E6 $80
    jr   nz, jr_005_7ECC                          ;; 05:7EBD $20 $0D

.jr_7EBF
    dec  e                                        ;; 05:7EBF $1D
    ld   a, e                                     ;; 05:7EC0 $7B
    cp   $FF                                      ;; 05:7EC1 $FE $FF
    jr   nz, jr_005_7EAE                          ;; 05:7EC3 $20 $E9

    xor  a                                        ;; 05:7EC5 $AF
    ld   [wC1CF], a                               ;; 05:7EC6 $EA $CF $C1
    jp   label_27DD                               ;; 05:7EC9 $C3 $DD $27

jr_005_7ECC:
    ldh  a, [hMapId]                              ;; 05:7ECC $F0 $F7
    cp   MAP_FACE_SHRINE                          ;; 05:7ECE $FE $05
    ret  nc                                       ;; 05:7ED0 $D0

    jp   label_005_7ED7                           ;; 05:7ED1 $C3 $D7 $7E

jr_005_7ED4:
    jp   label_005_7550                           ;; 05:7ED4 $C3 $50 $75

label_005_7ED7:
    ld   hl, wIndoorARoomStatus                   ;; 05:7ED7 $21 $00 $D9
    ldh  a, [hMapRoom]                            ;; 05:7EDA $F0 $F6
    ld   e, a                                     ;; 05:7EDC $5F
    ld   d, b                                     ;; 05:7EDD $50
    ldh  a, [hMapId]                              ;; 05:7EDE $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 05:7EE0 $FE $FF
    jr   nz, .jr_7EE9                             ;; 05:7EE2 $20 $05

    ld   hl, wColorDungeonRoomStatus              ;; 05:7EE4 $21 $E0 $DD
    jr   jr_005_7EF2                              ;; 05:7EE7 $18 $09

.jr_7EE9
    cp   $1A                                      ;; 05:7EE9 $FE $1A
    jr   nc, jr_005_7EF2                          ;; 05:7EEB $30 $05

    cp   $06                                      ;; 05:7EED $FE $06
    jr   c, jr_005_7EF2                           ;; 05:7EEF $38 $01

    inc  d                                        ;; 05:7EF1 $14

jr_005_7EF2:
    add  hl, de                                   ;; 05:7EF2 $19
    set  5, [hl]                                  ;; 05:7EF3 $CB $EE
    ret                                           ;; 05:7EF5 $C9
