; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
CrowSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_3 | OAMF_PAL0
    db $52, OAM_GBC_PAL_3 | OAMF_PAL0
.variant1
    db $54, OAM_GBC_PAL_3 | OAMF_PAL0
    db $56, OAM_GBC_PAL_3 | OAMF_PAL0
.variant2
    db $52, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $56, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

CrowEntityHandler::
    ldh  a, [hMapRoom]                            ;; 06:5C99 $F0 $F6
    cp   ROOM_OW_KANALET_CASTLE_CROW              ;; 06:5C9B $FE $58
    jr   nz, jr_006_5CBE                          ;; 06:5C9D $20 $1F

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 06:5C9F $21 $10 $C4
    add  hl, bc                                   ;; 06:5CA2 $09
    ld   a, [hl]                                  ;; 06:5CA3 $7E
    cp   $10                                      ;; 06:5CA4 $FE $10
    jr   c, .jr_5CAB                              ;; 06:5CA6 $38 $03

    srl  a                                        ;; 06:5CA8 $CB $3F
IF __PATCH_0__
    srl  a
ENDC

    ld   [hl], a                                  ;; 06:5CAA $77

.jr_5CAB
    ldh  a, [hRoomStatus]                         ;; 06:5CAB $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 06:5CAD $E6 $10
    jp   nz, ClearEntityStatus_06                 ;; 06:5CAF $C2 $DB $65

    ld   hl, wEntitiesLoadOrderTable              ;; 06:5CB2 $21 $60 $C4
    add  hl, bc                                   ;; 06:5CB5 $09
    ld   [hl], $FF                                ;; 06:5CB6 $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ;; 06:5CB8 $21 $E0 $C4
    add  hl, bc                                   ;; 06:5CBB $09
    ld   [hl], ENTITY_HIDING_SLIME_KEY            ;; 06:5CBC $36 $3C

jr_006_5CBE:
    ld   hl, wEntitiesDirectionTable              ;; 06:5CBE $21 $80 $C3
    add  hl, bc                                   ;; 06:5CC1 $09
    ld   a, [hl]                                  ;; 06:5CC2 $7E
    and  a                                        ;; 06:5CC3 $A7
    jr   nz, .jr_5CCC                             ;; 06:5CC4 $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ;; 06:5CC6 $F0 $F1
    add  $02                                      ;; 06:5CC8 $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:5CCA $E0 $F1

.jr_5CCC
    ld   de, CrowSpriteVariants                   ;; 06:5CCC $11 $89 $5C
    call RenderActiveEntitySpritesPair            ;; 06:5CCF $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ;; 06:5CD2 $F0 $F0
    and  a                                        ;; 06:5CD4 $A7
    jr   nz, .jr_5CE5                             ;; 06:5CD5 $20 $0E

    ld   hl, wEntitiesPosYTable                   ;; 06:5CD7 $21 $10 $C2
    add  hl, bc                                   ;; 06:5CDA $09
    ld   a, [hl]                                  ;; 06:5CDB $7E
    sub  $04                                      ;; 06:5CDC $D6 $04
    ld   [hl], a                                  ;; 06:5CDE $77
    call IncrementEntityState                     ;; 06:5CDF $CD $12 $3B
    ld   a, [hl]                                  ;; 06:5CE2 $7E
    ldh  [hActiveEntityState], a                  ;; 06:5CE3 $E0 $F0

.jr_5CE5
    call ReturnIfNonInteractive_06                ;; 06:5CE5 $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ;; 06:5CE8 $CD $F7 $64
    ldh  a, [hActiveEntityState]                  ;; 06:5CEB $F0 $F0
    dec  a                                        ;; 06:5CED $3D
    JP_TABLE                                      ;; 06:5CEE
._00 dw CrowState0Handler
._01 dw CrowState1Handler
._02 dw CrowState2Handler
._03 dw CrowState3Handler

CrowState0Handler::
    ldh  a, [hMapRoom]                            ;; 06:5CF7 $F0 $F6
    cp   ROOM_OW_KANALET_CASTLE_CROW              ;; 06:5CF9 $FE $58
    jp   nz, label_006_5D8A                       ;; 06:5CFB $C2 $8A $5D

    ld   hl, wEntitiesPosXTable                   ;; 06:5CFE $21 $00 $C2
    add  hl, bc                                   ;; 06:5D01 $09
    ld   a, [hl]                                  ;; 06:5D02 $7E
    ldh  [hMultiPurpose0], a                      ;; 06:5D03 $E0 $D7
    ld   hl, wEntitiesPosYTable                   ;; 06:5D05 $21 $10 $C2
    add  hl, bc                                   ;; 06:5D08 $09
    ld   a, [hl]                                  ;; 06:5D09 $7E
    ldh  [hMultiPurpose1], a                      ;; 06:5D0A $E0 $D8
    ld   de, $00                                  ;; 06:5D0C $11 $00 $00

jr_006_5D0F:
    ld   hl, wEntitiesTypeTable                   ;; 06:5D0F $21 $A0 $C3
    add  hl, de                                   ;; 06:5D12 $19
    ld   a, [hl]                                  ;; 06:5D13 $7E
    cp   $02                                      ;; 06:5D14 $FE $02
    jr   nz, jr_006_5D4F                          ;; 06:5D16 $20 $37

    ld   hl, wEntitiesFlashCountdownTable         ;; 06:5D18 $21 $20 $C4
    add  hl, de                                   ;; 06:5D1B $19
    ld   a, [hl]                                  ;; 06:5D1C $7E
    and  a                                        ;; 06:5D1D $A7
    jr   z, jr_006_5D4F                           ;; 06:5D1E $28 $2F

    ld   hl, wEntitiesTransitionCountdownTable    ;; 06:5D20 $21 $E0 $C2
    add  hl, de                                   ;; 06:5D23 $19
    ld   a, [hl]                                  ;; 06:5D24 $7E
    cp   $22                                      ;; 06:5D25 $FE $22
    jr   nc, jr_006_5D4F                          ;; 06:5D27 $30 $26

    ld   hl, wEntitiesPosXTable                   ;; 06:5D29 $21 $00 $C2
    add  hl, de                                   ;; 06:5D2C $19
    ld   l, [hl]                                  ;; 06:5D2D $6E
    ldh  a, [hMultiPurpose0]                      ;; 06:5D2E $F0 $D7
    sub  l                                        ;; 06:5D30 $95
    bit  7, a                                     ;; 06:5D31 $CB $7F
    jr   z, .jr_5D37                              ;; 06:5D33 $28 $02

    cpl                                           ;; 06:5D35 $2F
    inc  a                                        ;; 06:5D36 $3C

.jr_5D37
    cp   $20                                      ;; 06:5D37 $FE $20
    jr   nc, jr_006_5D4F                          ;; 06:5D39 $30 $14

    ld   hl, wEntitiesPosYTable                   ;; 06:5D3B $21 $10 $C2
    add  hl, de                                   ;; 06:5D3E $19
    ld   l, [hl]                                  ;; 06:5D3F $6E
    ldh  a, [hMultiPurpose1]                      ;; 06:5D40 $F0 $D8
    sub  l                                        ;; 06:5D42 $95
    bit  7, a                                     ;; 06:5D43 $CB $7F
    jr   z, .jr_5D49                              ;; 06:5D45 $28 $02

    cpl                                           ;; 06:5D47 $2F
    inc  a                                        ;; 06:5D48 $3C

.jr_5D49
    cp   $20                                      ;; 06:5D49 $FE $20
    jr   nc, jr_006_5D4F                          ;; 06:5D4B $30 $02

    jr   jr_006_5D9F                              ;; 06:5D4D $18 $50

jr_006_5D4F:
    inc  de                                       ;; 06:5D4F $13
    ld   a, e                                     ;; 06:5D50 $7B
    and  $0F                                      ;; 06:5D51 $E6 $0F
    jr   nz, jr_006_5D0F                          ;; 06:5D53 $20 $BA

    ld   a, [wPickedUpRockIndex]                  ;; 06:5D55 $FA $0C $C5
    ld   e, a                                     ;; 06:5D58 $5F
    ld   d, b                                     ;; 06:5D59 $50
    ld   hl, wEntitiesStatusTable                 ;; 06:5D5A $21 $80 $C2
    add  hl, de                                   ;; 06:5D5D $19
    ld   a, [hl]                                  ;; 06:5D5E $7E
    and  a                                        ;; 06:5D5F $A7
    ret  z                                        ;; 06:5D60 $C8

    ld   hl, wEntitiesTypeTable                   ;; 06:5D61 $21 $A0 $C3
    add  hl, de                                   ;; 06:5D64 $19
    ld   a, [hl]                                  ;; 06:5D65 $7E
    cp   $05                                      ;; 06:5D66 $FE $05
    ret  nz                                       ;; 06:5D68 $C0

    ld   hl, wEntitiesPrivateCountdown1Table      ;; 06:5D69 $21 $F0 $C2
    add  hl, de                                   ;; 06:5D6C $19
    ld   a, [hl]                                  ;; 06:5D6D $7E
    and  a                                        ;; 06:5D6E $A7
    ret  z                                        ;; 06:5D6F $C8

    ld   hl, wEntitiesPosXTable                   ;; 06:5D70 $21 $00 $C2
    add  hl, de                                   ;; 06:5D73 $19
    ldh  a, [hActiveEntityPosX]                   ;; 06:5D74 $F0 $EE
    sub  [hl]                                     ;; 06:5D76 $96
    add  $10                                      ;; 06:5D77 $C6 $10
    cp   $20                                      ;; 06:5D79 $FE $20
    ret  nc                                       ;; 06:5D7B $D0

    ld   hl, wEntitiesPosYTable                   ;; 06:5D7C $21 $10 $C2
    add  hl, de                                   ;; 06:5D7F $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:5D80 $F0 $EC
    sub  [hl]                                     ;; 06:5D82 $96
    add  $28                                      ;; 06:5D83 $C6 $28
    cp   $50                                      ;; 06:5D85 $FE $50
    ret  nc                                       ;; 06:5D87 $D0

    jr   jr_006_5D9F                              ;; 06:5D88 $18 $15

label_006_5D8A:
    call GetEntityXDistanceToLink_06              ;; 06:5D8A $CD $94 $65
    ld   hl, wEntitiesDirectionTable              ;; 06:5D8D $21 $80 $C3
    add  hl, bc                                   ;; 06:5D90 $09
    ld   [hl], e                                  ;; 06:5D91 $73
    add  $18                                      ;; 06:5D92 $C6 $18
    cp   $30                                      ;; 06:5D94 $FE $30
    ret  nc                                       ;; 06:5D96 $D0

    call GetEntityYDistanceToLink_06              ;; 06:5D97 $CD $A4 $65
    add  $30                                      ;; 06:5D9A $C6 $30
    cp   $60                                      ;; 06:5D9C $FE $60
    ret  nc                                       ;; 06:5D9E $D0

jr_006_5D9F:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 06:5D9F $21 $40 $C3
    add  hl, bc                                   ;; 06:5DA2 $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ;; 06:5DA3 $36 $12
    call GetEntityTransitionCountdown             ;; 06:5DA5 $CD $05 $0C
    ld   [hl], $22                                ;; 06:5DA8 $36 $22
    jp   IncrementEntityState                     ;; 06:5DAA $C3 $12 $3B

CrowState1Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5DAD $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 06:5DB0 $CD $05 $0C
    jr   nz, .jr_5DBA                             ;; 06:5DB3 $20 $05

    ld   [hl], $30                                ;; 06:5DB5 $36 $30
    jp   IncrementEntityState                     ;; 06:5DB7 $C3 $12 $3B

.jr_5DBA
    call ClearEntitySpeed                         ;; 06:5DBA $CD $7F $3D
    ld   hl, wEntitiesSpeedZTable                 ;; 06:5DBD $21 $20 $C3
    add  hl, bc                                   ;; 06:5DC0 $09
    ld   [hl], $08                                ;; 06:5DC1 $36 $08
    call AddEntityZSpeedToPos_06                  ;; 06:5DC3 $CD $7A $65
    jr   jr_006_5E08                              ;; 06:5DC6 $18 $40

CrowState2Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5DC8 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 06:5DCB $CD $05 $0C
    jp   z, IncrementEntityState                  ;; 06:5DCE $CA $12 $3B

    and  $01                                      ;; 06:5DD1 $E6 $01
    jr   nz, func_006_5E02                        ;; 06:5DD3 $20 $2D

    ld   a, $20                                   ;; 06:5DD5 $3E $20
    call GetVectorTowardsLink_trampoline          ;; 06:5DD7 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:5DDA $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5DDC $21 $50 $C2
    add  hl, bc                                   ;; 06:5DDF $09
    sub  [hl]                                     ;; 06:5DE0 $96
    and  $80                                      ;; 06:5DE1 $E6 $80
    jr   nz, .jr_5DE7                             ;; 06:5DE3 $20 $02

    inc  [hl]                                     ;; 06:5DE5 $34
    inc  [hl]                                     ;; 06:5DE6 $34

.jr_5DE7
    dec  [hl]                                     ;; 06:5DE7 $35
    ldh  a, [hMultiPurpose1]                      ;; 06:5DE8 $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 06:5DEA $21 $40 $C2
    add  hl, bc                                   ;; 06:5DED $09
    sub  [hl]                                     ;; 06:5DEE $96
    and  $80                                      ;; 06:5DEF $E6 $80
    jr   nz, .jr_5DF5                             ;; 06:5DF1 $20 $02

    inc  [hl]                                     ;; 06:5DF3 $34
    inc  [hl]                                     ;; 06:5DF4 $34

.jr_5DF5
    dec  [hl]                                     ;; 06:5DF5 $35
    ld   hl, wEntitiesSpeedXTable                 ;; 06:5DF6 $21 $40 $C2
    add  hl, bc                                   ;; 06:5DF9 $09
    ld   a, [hl]                                  ;; 06:5DFA $7E
    and  $80                                      ;; 06:5DFB $E6 $80
    ld   hl, wEntitiesDirectionTable              ;; 06:5DFD $21 $80 $C3
    add  hl, bc                                   ;; 06:5E00 $09
    ld   [hl], a                                  ;; 06:5E01 $77

func_006_5E02::
    call UpdateEntityPosWithSpeed_06              ;; 06:5E02 $CD $41 $65
    call func_006_5E14                            ;; 06:5E05 $CD $14 $5E

jr_006_5E08:
    call func_006_5E14                            ;; 06:5E08 $CD $14 $5E
    ld   a, [hl]                                  ;; 06:5E0B $7E
    rra                                           ;; 06:5E0C $1F
    rra                                           ;; 06:5E0D $1F
    rra                                           ;; 06:5E0E $1F
    and  $01                                      ;; 06:5E0F $E6 $01
    jp   SetEntitySpriteVariant                   ;; 06:5E11 $C3 $0C $3B

func_006_5E14::
    jp   PlayBoomerangSfx_trampoline              ;; 06:5E14 $C3 $F8 $29

CrowState3Handler::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:5E17 $CD $39 $3B
    ldh  a, [hFrameCounter]                       ;; 06:5E1A $F0 $E7
    and  $03                                      ;; 06:5E1C $E6 $03
    jr   nz, jr_006_5E51                          ;; 06:5E1E $20 $31

    ld   a, $20                                   ;; 06:5E20 $3E $20
    call GetVectorTowardsLink_trampoline          ;; 06:5E22 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:5E25 $F0 $D7
    cpl                                           ;; 06:5E27 $2F
    inc  a                                        ;; 06:5E28 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 06:5E29 $21 $50 $C2
    add  hl, bc                                   ;; 06:5E2C $09
    sub  [hl]                                     ;; 06:5E2D $96
    and  $80                                      ;; 06:5E2E $E6 $80
    jr   nz, .jr_5E34                             ;; 06:5E30 $20 $02

    inc  [hl]                                     ;; 06:5E32 $34
    inc  [hl]                                     ;; 06:5E33 $34

.jr_5E34
    dec  [hl]                                     ;; 06:5E34 $35
    ldh  a, [hMultiPurpose1]                      ;; 06:5E35 $F0 $D8
    cpl                                           ;; 06:5E37 $2F
    inc  a                                        ;; 06:5E38 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 06:5E39 $21 $40 $C2
    add  hl, bc                                   ;; 06:5E3C $09
    sub  [hl]                                     ;; 06:5E3D $96
    and  $80                                      ;; 06:5E3E $E6 $80
    jr   nz, .jr_5E44                             ;; 06:5E40 $20 $02

    inc  [hl]                                     ;; 06:5E42 $34
    inc  [hl]                                     ;; 06:5E43 $34

.jr_5E44
    dec  [hl]                                     ;; 06:5E44 $35
    ld   hl, wEntitiesSpeedXTable                 ;; 06:5E45 $21 $40 $C2
    add  hl, bc                                   ;; 06:5E48 $09
    ld   a, [hl]                                  ;; 06:5E49 $7E
    and  $80                                      ;; 06:5E4A $E6 $80
    ld   hl, wEntitiesDirectionTable              ;; 06:5E4C $21 $80 $C3
    add  hl, bc                                   ;; 06:5E4F $09
    ld   [hl], a                                  ;; 06:5E50 $77

jr_006_5E51:
    call func_006_5E02                            ;; 06:5E51 $CD $02 $5E

func_006_5E54::
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:5E54 $F0 $EC
    cp   $88                                      ;; 06:5E56 $FE $88
    jp   nc, ClearEntityStatus_06                 ;; 06:5E58 $D2 $DB $65

    ldh  a, [hActiveEntityPosX]                   ;; 06:5E5B $F0 $EE
    cp   $A8                                      ;; 06:5E5D $FE $A8
    jp   nc, ClearEntityStatus_06                 ;; 06:5E5F $D2 $DB $65

    ret                                           ;; 06:5E62 $C9
