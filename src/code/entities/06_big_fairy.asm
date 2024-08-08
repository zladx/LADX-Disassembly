Data_006_7071::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01, $F0, $0C, $54, $01, $00, $FC, $56, $01
    db   $00, $04, $58, $01, $00, $0C, $5A, $01

Data_006_7089::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01, $F0, $0C, $54, $01, $00, $FC, $5C, $01
    db   $00, $04, $58, $01, $00, $0C, $5E, $01

Data_006_70A1::
    db   $A8, $14

Data_006_70A3::
    db   $01, $FF

Data_006_70A5::
    db   $18, $E8

BigFairyEntityHandler::
    ld   a, [wIsIndoor]                           ;; 06:70A7 $FA $A5 $DB
    and  a                                        ;; 06:70AA $A7
    jr   z, .jr_70B8                              ;; 06:70AB $28 $0B

    ldh  a, [hMapId]                              ;; 06:70AD $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 06:70AF $FE $FF
    jr   nz, .jr_70B8                             ;; 06:70B1 $20 $05

    ld   a, $06                                   ;; 06:70B3 $3E $06
    jp   func_036_505F_trampoline                 ;; 06:70B5 $C3 $47 $0A

.jr_70B8
    ld   hl, wEntitiesPrivateState3Table          ;; 06:70B8 $21 $D0 $C2
    add  hl, bc                                   ;; 06:70BB $09
    ld   a, [hl]                                  ;; 06:70BC $7E
    and  a                                        ;; 06:70BD $A7
    jp   z, label_006_7123                        ;; 06:70BE $CA $23 $71

    ld   hl, wEntitiesStatusTable                 ;; 06:70C1 $21 $80 $C2
    ld   a, [wD201]                               ;; 06:70C4 $FA $01 $D2
    ld   e, a                                     ;; 06:70C7 $5F
    ld   d, b                                     ;; 06:70C8 $50
    add  hl, de                                   ;; 06:70C9 $19
    ld   a, [hl]                                  ;; 06:70CA $7E
    and  a                                        ;; 06:70CB $A7
    jp   z, ClearEntityStatus_06                  ;; 06:70CC $CA $DB $65

    ld   a, [wD202]                               ;; 06:70CF $FA $02 $D2
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:70D2 $E0 $F1
    ld   de, Data_006_70A1                        ;; 06:70D4 $11 $A1 $70
    call RenderActiveEntitySprite                 ;; 06:70D7 $CD $77 $3C
    ldh  a, [hFrameCounter]                       ;; 06:70DA $F0 $E7
    and  $01                                      ;; 06:70DC $E6 $01
    jr   nz, jr_006_7120                          ;; 06:70DE $20 $40

    ld   hl, wEntitiesPrivateState1Table          ;; 06:70E0 $21 $B0 $C2
    add  hl, bc                                   ;; 06:70E3 $09
    ld   e, [hl]                                  ;; 06:70E4 $5E
    ld   d, b                                     ;; 06:70E5 $50
    ld   hl, Data_006_70A3                        ;; 06:70E6 $21 $A3 $70
    add  hl, de                                   ;; 06:70E9 $19
    ld   a, [hl]                                  ;; 06:70EA $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 06:70EB $21 $40 $C2
    add  hl, bc                                   ;; 06:70EE $09
    add  [hl]                                     ;; 06:70EF $86
    ld   [hl], a                                  ;; 06:70F0 $77
    ld   hl, Data_006_70A5                        ;; 06:70F1 $21 $A5 $70
    add  hl, de                                   ;; 06:70F4 $19
    cp   [hl]                                     ;; 06:70F5 $BE
    jr   nz, .jr_7100                             ;; 06:70F6 $20 $08

    ld   hl, wEntitiesPrivateState1Table          ;; 06:70F8 $21 $B0 $C2
    add  hl, bc                                   ;; 06:70FB $09
    ld   a, [hl]                                  ;; 06:70FC $7E
    xor  $01                                      ;; 06:70FD $EE $01
    ld   [hl], a                                  ;; 06:70FF $77

.jr_7100
    ld   hl, wEntitiesPrivateState2Table          ;; 06:7100 $21 $C0 $C2
    add  hl, bc                                   ;; 06:7103 $09
    ld   e, [hl]                                  ;; 06:7104 $5E
    ld   d, b                                     ;; 06:7105 $50
    ld   hl, Data_006_70A3                        ;; 06:7106 $21 $A3 $70
    add  hl, de                                   ;; 06:7109 $19
    ld   a, [hl]                                  ;; 06:710A $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 06:710B $21 $50 $C2
    add  hl, bc                                   ;; 06:710E $09
    add  [hl]                                     ;; 06:710F $86
    ld   [hl], a                                  ;; 06:7110 $77
    ld   hl, Data_006_70A5                        ;; 06:7111 $21 $A5 $70
    add  hl, de                                   ;; 06:7114 $19
    cp   [hl]                                     ;; 06:7115 $BE
    jr   nz, jr_006_7120                          ;; 06:7116 $20 $08

    ld   hl, wEntitiesPrivateState2Table          ;; 06:7118 $21 $C0 $C2
    add  hl, bc                                   ;; 06:711B $09
    ld   a, [hl]                                  ;; 06:711C $7E
    xor  $01                                      ;; 06:711D $EE $01
    ld   [hl], a                                  ;; 06:711F $77

jr_006_7120:
    jp   UpdateEntityPosWithSpeed_06              ;; 06:7120 $C3 $41 $65

label_006_7123:
    ld   hl, Data_006_7071                        ;; 06:7123 $21 $71 $70
    ldh  a, [hFrameCounter]                       ;; 06:7126 $F0 $E7
    and  $08                                      ;; 06:7128 $E6 $08
    jr   z, .jr_712F                              ;; 06:712A $28 $03

    ld   hl, Data_006_7089                        ;; 06:712C $21 $89 $70

.jr_712F
    ld   c, $06                                   ;; 06:712F $0E $06
    call RenderActiveEntitySpritesRect            ;; 06:7131 $CD $E6 $3C
    ld   a, $06                                   ;; 06:7134 $3E $06
    call func_015_7964_trampoline                 ;; 06:7136 $CD $A0 $3D
    call label_3CD9                               ;; 06:7139 $CD $D9 $3C
    ld   e, $FE                                   ;; 06:713C $1E $FE
    ld   hl, wEntitiesInertiaTable                ;; 06:713E $21 $D0 $C3
    add  hl, bc                                   ;; 06:7141 $09
    inc  [hl]                                     ;; 06:7142 $34
    ld   a, [hl]                                  ;; 06:7143 $7E
    and  $40                                      ;; 06:7144 $E6 $40
    jr   z, .jr_714A                              ;; 06:7146 $28 $02

    ld   e, $02                                   ;; 06:7148 $1E $02

.jr_714A
    ld   hl, wEntitiesSpeedZTable                 ;; 06:714A $21 $20 $C3
    add  hl, bc                                   ;; 06:714D $09
    ld   [hl], e                                  ;; 06:714E $73
    call AddEntityZSpeedToPos_06                  ;; 06:714F $CD $7A $65
    call ReturnIfNonInteractive_06                ;; 06:7152 $CD $C6 $64
    ldh  a, [hActiveEntityState]                  ;; 06:7155 $F0 $F0
    JP_TABLE                                      ;; 06:7157
._00 dw BigFairyWaitingHandler
._01 dw BigFairyHealingHandler
._02 dw BigFairyDisappearingHandler

BigFairyWaitingHandler::
    xor  a                                        ;; 06:715E $AF
    ld   [wD202], a                               ;; 06:715F $EA $02 $D2
    ld   a, c                                     ;; 06:7162 $79
    ld   [wD201], a                               ;; 06:7163 $EA $01 $D2
    ldh  a, [hLinkPositionX]                      ;; 06:7166 $F0 $98
    sub  $50                                      ;; 06:7168 $D6 $50
    add  $08                                      ;; 06:716A $C6 $08
    cp   $10                                      ;; 06:716C $FE $10
    ret  nc                                       ;; 06:716E $D0

    ldh  a, [hLinkPositionY]                      ;; 06:716F $F0 $99
    sub  $58                                      ;; 06:7171 $D6 $58
    add  $08                                      ;; 06:7173 $C6 $08
    cp   $10                                      ;; 06:7175 $FE $10
    ret  nc                                       ;; 06:7177 $D0

    call IncrementEntityState                     ;; 06:7178 $CD $12 $3B
    call GetEntitySlowTransitionCountdown         ;; 06:717B $CD $FB $0B
    ld   [hl], $48                                ;; 06:717E $36 $48
    jp_open_dialog Dialog024                      ;; 06:7180

BigFairyHealingHandler::
    call GetEntitySlowTransitionCountdown         ;; 06:7185 $CD $FB $0B
    jr   nz, .jr_7197                             ;; 06:7188 $20 $0D

    call GetEntityTransitionCountdown             ;; 06:718A $CD $05 $0C
    ld   [hl], $48                                ;; 06:718D $36 $48
    call IncrementEntityState                     ;; 06:718F $CD $12 $3B
    ld   a, JINGLE_DISAPPEAR                      ;; 06:7192 $3E $26
    ldh  [hJingle], a                             ;; 06:7194 $E0 $F2
    ret                                           ;; 06:7196 $C9

.jr_7197
    ld   a, $02                                   ;; 06:7197 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:7199 $E0 $A1
    ld   a, JINGLE_FAIRY_HEAL                     ;; 06:719B $3E $1A
    ldh  [hJingle], a                             ;; 06:719D $E0 $F2
    call ReturnIfNonInteractive_06                ;; 06:719F $CD $C6 $64
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 06:71A2 $21 $00 $C3
    add  hl, bc                                   ;; 06:71A5 $09
    ld   a, [hl]                                  ;; 06:71A6 $7E
    and  a                                        ;; 06:71A7 $A7
    jr   nz, .jr_71BA                             ;; 06:71A8 $20 $10

    ld   [hl], $01                                ;; 06:71AA $36 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 06:71AC $21 $B0 $C2
    add  hl, bc                                   ;; 06:71AF $09
    ld   a, [hl]                                  ;; 06:71B0 $7E
    cp   $04                                      ;; 06:71B1 $FE $04
    jr   c, .jr_71BA                              ;; 06:71B3 $38 $05

    ld   a, $04                                   ;; 06:71B5 $3E $04
    ld   [wAddHealthBuffer], a                    ;; 06:71B7 $EA $93 $DB

.jr_71BA
    call GetEntityPrivateCountdown1               ;; 06:71BA $CD $00 $0C
    jr   nz, .ret_71F0                            ;; 06:71BD $20 $31

    ld   [hl], $13                                ;; 06:71BF $36 $13
    ld   hl, wEntitiesPrivateState1Table          ;; 06:71C1 $21 $B0 $C2
    add  hl, bc                                   ;; 06:71C4 $09
    ld   a, [hl]                                  ;; 06:71C5 $7E
    cp   $0A                                      ;; 06:71C6 $FE $0A
    jr   z, .ret_71F0                             ;; 06:71C8 $28 $26

    inc  [hl]                                     ;; 06:71CA $34
    ld   a, ENTITY_BIG_FAIRY                      ;; 06:71CB $3E $84
    call SpawnNewEntity_trampoline                ;; 06:71CD $CD $86 $3B
    jr   c, .ret_71F0                             ;; 06:71D0 $38 $1E

    ld   hl, wEntitiesPrivateState3Table          ;; 06:71D2 $21 $D0 $C2
    add  hl, de                                   ;; 06:71D5 $19
    ld   [hl], $01                                ;; 06:71D6 $36 $01
    ldh  a, [hMultiPurpose0]                      ;; 06:71D8 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 06:71DA $21 $00 $C2
    add  hl, de                                   ;; 06:71DD $19
    add  $00                                      ;; 06:71DE $C6 $00
    ld   [hl], a                                  ;; 06:71E0 $77
    ldh  a, [hMultiPurpose1]                      ;; 06:71E1 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 06:71E3 $21 $10 $C2
    add  hl, de                                   ;; 06:71E6 $19
    sub  $0E                                      ;; 06:71E7 $D6 $0E
    ld   [hl], a                                  ;; 06:71E9 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 06:71EA $21 $40 $C2
    add  hl, de                                   ;; 06:71ED $19
    ld   [hl], $E8                                ;; 06:71EE $36 $E8

.ret_71F0
    ret                                           ;; 06:71F0 $C9

BigFairyDisappearingHandler::
    call GetEntityTransitionCountdown             ;; 06:71F1 $CD $05 $0C
    jp   z, ClearEntityStatus_06                  ;; 06:71F4 $CA $DB $65

    ldh  a, [hFrameCounter]                       ;; 06:71F7 $F0 $E7
    and  $02                                      ;; 06:71F9 $E6 $02
    ld   a, $00                                   ;; 06:71FB $3E $00
    jr   z, .jr_7201                              ;; 06:71FD $28 $02

    ld   a, $FF                                   ;; 06:71FF $3E $FF

.jr_7201
    ld   [wD202], a                               ;; 06:7201 $EA $02 $D2
    call SetEntitySpriteVariant                   ;; 06:7204 $CD $0C $3B
    ld   a, $02                                   ;; 06:7207 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:7209 $E0 $A1
    ret                                           ;; 06:720B $C9
