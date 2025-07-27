GrimCreeperEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 18:6FD6 $21 $B0 $C2
    add  hl, bc                                   ;; 18:6FD9 $09
    ld   a, [hl]                                  ;; 18:6FDA $7E

.jr_6FDB
    and  a                                        ;; 18:6FDB $A7
    jp   nz, label_018_71A3                       ;; 18:6FDC $C2 $A3 $71

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:6FDF $21 $40 $C3
    add  hl, bc                                   ;; 18:6FE2 $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:6FE3 $CB $F6
    call func_018_7181                            ;; 18:6FE5 $CD $81 $71
    call label_394D                               ;; 18:6FE8 $CD $4D $39
    call BossIntro                                ;; 18:6FEB $CD $E8 $3E
    call ReturnIfNonInteractive_18                ;; 18:6FEE $CD $E8 $7D
    ld   a, [wRoomEventEffectExecuted]            ;; 18:6FF1 $FA $8F $C1
    and  a                                        ;; 18:6FF4 $A7
    jr   z, jr_018_7028                           ;; 18:6FF5 $28 $31

    ld   hl, wEntitiesPrivateState3Table          ;; 18:6FF7 $21 $D0 $C2
    add  hl, bc                                   ;; 18:6FFA $09
    ld   a, [hl]                                  ;; 18:6FFB $7E
    and  a                                        ;; 18:6FFC $A7
    jr   nz, .jr_7008                             ;; 18:6FFD $20 $09

    inc  [hl]                                     ;; 18:6FFF $34
    call_open_dialog Dialog025                    ;; 18:7000
    jp   SetRoomStatus20                          ;; 18:7005 $C3 $B9 $7F

.jr_7008
    cp   $01                                      ;; 18:7008 $FE $01
    jr   nz, .jr_7011                             ;; 18:700A $20 $05

    ld   a, NOISE_SFX_MINIBOSS_FLEE               ;; 18:700C $3E $3F
    ldh  [hNoiseSfx], a                           ;; 18:700E $E0 $F4
    inc  [hl]                                     ;; 18:7010 $34

.jr_7011
    ld   hl, wEntitiesSpeedZTable                 ;; 18:7011 $21 $20 $C3
    add  hl, bc                                   ;; 18:7014 $09
    ld   [hl], $20                                ;; 18:7015 $36 $20
    call AddEntityZSpeedToPos_18                  ;; 18:7017 $CD $98 $7E
    ld   hl, wEntitiesPosZTable                   ;; 18:701A $21 $10 $C3
    add  hl, bc                                   ;; 18:701D $09
    ld   a, [hl]                                  ;; 18:701E $7E
    cp   $78                                      ;; 18:701F $FE $78
    ret  c                                        ;; 18:7021 $D8

    call label_27DD                               ;; 18:7022 $CD $DD $27
    jp   ClearEntityStatusBank18                  ;; 18:7025 $C3 $08 $7F

jr_018_7028:
    ldh  a, [hActiveEntityState]                  ;; 18:7028 $F0 $F0
    JP_TABLE                                      ;; 18:702A
._00 dw GrimCreeperState0Handler
._01 dw GrimCreeperState1Handler
._02 dw GrimCreeperState2Handler
._03 dw GrimCreeperState3Handler
._04 dw GrimCreeperState4Handler
._05 dw GrimCreeperState5Handler
._06 dw GrimCreeperState6Handler

GrimCreeperState0Handler::
    ld   a, $07                                   ;; 18:7039 $3E $07
    ld   [wD205], a                               ;; 18:703B $EA $05 $D2
    jp   IncrementEntityState                     ;; 18:703E $C3 $12 $3B

GrimCreeperState1Handler::
    call GetEntityTransitionCountdown             ;; 18:7041 $CD $05 $0C
    ld   [hl], $80                                ;; 18:7044 $36 $80
    xor  a                                        ;; 18:7046 $AF
    ld   [wD201], a                               ;; 18:7047 $EA $01 $D2
    ld   [wD202], a                               ;; 18:704A $EA $02 $D2
    ld   a, [wD205]                               ;; 18:704D $FA $05 $D2
    inc  a                                        ;; 18:7050 $3C
    and  $07                                      ;; 18:7051 $E6 $07
    ld   [wD205], a                               ;; 18:7053 $EA $05 $D2
    jp   IncrementEntityState                     ;; 18:7056 $C3 $12 $3B

GrimCreeperState2Handler::
    call GetEntityTransitionCountdown             ;; 18:7059 $CD $05 $0C
    jr   nz, ret_018_7088                         ;; 18:705C $20 $2A

    ld   [hl], $FF                                ;; 18:705E $36 $FF
    ld   hl, wEntitiesOptions1Table               ;; 18:7060 $21 $30 $C4
    add  hl, bc                                   ;; 18:7063 $09
    res  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl] ;; 18:7064 $CB $8E
    ld   e, $0F                                   ;; 18:7066 $1E $0F
    ld   d, b                                     ;; 18:7068 $50

jr_018_7069:
    ld   hl, wEntitiesTypeTable                   ;; 18:7069 $21 $A0 $C3
    add  hl, de                                   ;; 18:706C $19
    ld   a, [hl]                                  ;; 18:706D $7E
    cp   $BC                                      ;; 18:706E $FE $BC
    jr   nz, .jr_707F                             ;; 18:7070 $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ;; 18:7072 $21 $B0 $C2
    add  hl, de                                   ;; 18:7075 $19
    ld   a, [hl]                                  ;; 18:7076 $7E
    and  a                                        ;; 18:7077 $A7
    jr   z, .jr_707F                              ;; 18:7078 $28 $05

    ld   hl, wEntitiesStatusTable                 ;; 18:707A $21 $80 $C2
    add  hl, de                                   ;; 18:707D $19
    ld   [hl], b                                  ;; 18:707E $70

.jr_707F
    dec  e                                        ;; 18:707F $1D
    ld   a, e                                     ;; 18:7080 $7B
    cp   $FF                                      ;; 18:7081 $FE $FF
    jr   nz, jr_018_7069                          ;; 18:7083 $20 $E4

    jp   IncrementEntityState                     ;; 18:7085 $C3 $12 $3B

ret_018_7088:
    ret                                           ;; 18:7088 $C9

Data_018_7089::
    db   $78, $68, $58, $48, $38, $28

Data_018_708F::
    db   $00, $00, $00, $00, $00, $00

GrimCreeperState3Handler::
    call GetEntityTransitionCountdown             ;; 18:7095 $CD $05 $0C
    jr   nz, .jr_70A4                             ;; 18:7098 $20 $0A

    ld   hl, wEntitiesOptions1Table               ;; 18:709A $21 $30 $C4
    add  hl, bc                                   ;; 18:709D $09
    set  ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL, [hl] ;; 18:709E $CB $CE
    call IncrementEntityState                     ;; 18:70A0 $CD $12 $3B
    xor  a                                        ;; 18:70A3 $AF

.jr_70A4
    and  $1F                                      ;; 18:70A4 $E6 $1F
    jr   nz, label_018_70FD                       ;; 18:70A6 $20 $55

    ld   hl, wEntitiesInertiaTable                ;; 18:70A8 $21 $D0 $C3
    add  hl, bc                                   ;; 18:70AB $09
    ld   a, [hl]                                  ;; 18:70AC $7E
    cp   $06                                      ;; 18:70AD $FE $06
    jr   nc, label_018_70FD                       ;; 18:70AF $30 $4C

    ld   a, ENTITY_GRIM_CREEPER                   ;; 18:70B1 $3E $BC
    call SpawnNewEntity_trampoline                ;; 18:70B3 $CD $86 $3B
    jr   c, label_018_70FD                        ;; 18:70B6 $38 $45

    ld   a, JINGLE_GRIM_CREEPER_BATS              ;; 18:70B8 $3E $31
    ldh  [hJingle], a                             ;; 18:70BA $E0 $F2
    ld   hl, wEntitiesInertiaTable                ;; 18:70BC $21 $D0 $C3
    add  hl, bc                                   ;; 18:70BF $09
    push bc                                       ;; 18:70C0 $C5
    ld   c, [hl]                                  ;; 18:70C1 $4E
    inc  [hl]                                     ;; 18:70C2 $34
    ld   hl, Data_018_7089                        ;; 18:70C3 $21 $89 $70
    add  hl, bc                                   ;; 18:70C6 $09
    ld   a, [hl]                                  ;; 18:70C7 $7E
    ld   hl, wEntitiesPosXTable                   ;; 18:70C8 $21 $00 $C2
    add  hl, de                                   ;; 18:70CB $19
    ld   [hl], a                                  ;; 18:70CC $77
    ld   hl, Data_018_708F                        ;; 18:70CD $21 $8F $70
    add  hl, bc                                   ;; 18:70D0 $09
    ld   a, [hl]                                  ;; 18:70D1 $7E
    ld   hl, wEntitiesPosYTable                   ;; 18:70D2 $21 $10 $C2
    add  hl, de                                   ;; 18:70D5 $19
    ld   [hl], a                                  ;; 18:70D6 $77
    ld   hl, wEntitiesPosZTable                   ;; 18:70D7 $21 $10 $C3
    add  hl, de                                   ;; 18:70DA $19
    ld   [hl], $1C                                ;; 18:70DB $36 $1C
    ld   hl, wEntitiesInertiaTable                ;; 18:70DD $21 $D0 $C3
    add  hl, de                                   ;; 18:70E0 $19
    ld   [hl], c                                  ;; 18:70E1 $71
    ld   hl, wEntitiesOptions1Table               ;; 18:70E2 $21 $30 $C4
    add  hl, de                                   ;; 18:70E5 $19
    ld   a, [hl]                                  ;; 18:70E6 $7E
    and  $7B                                      ;; 18:70E7 $E6 $7B
    ld   [hl], a                                  ;; 18:70E9 $77
    ld   hl, wEntitiesHealthTable                 ;; 18:70EA $21 $60 $C3
    add  hl, de                                   ;; 18:70ED $19
    ld   [hl], $01                                ;; 18:70EE $36 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 18:70F0 $21 $B0 $C2
    add  hl, de                                   ;; 18:70F3 $19
    ld   [hl], $01                                ;; 18:70F4 $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:70F6 $21 $40 $C3
    add  hl, de                                   ;; 18:70F9 $19
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:70FA $CB $F6
    pop  bc                                       ;; 18:70FC $C1

label_018_70FD:
    ldh  a, [hFrameCounter]                       ;; 18:70FD $F0 $E7
    rra                                           ;; 18:70FF $1F
    rra                                           ;; 18:7100 $1F
    rra                                           ;; 18:7101 $1F
    rra                                           ;; 18:7102 $1F
    rra                                           ;; 18:7103 $1F
    and  $01                                      ;; 18:7104 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 18:7106 $C3 $0C $3B

GrimCreeperState4Handler::
    ld   a, [wD201]                               ;; 18:7109 $FA $01 $D2
    cp   $06                                      ;; 18:710C $FE $06
    jr   nz, .jr_7121                             ;; 18:710E $20 $11

    ld   hl, wEntitiesInertiaTable                ;; 18:7110 $21 $D0 $C3
    add  hl, bc                                   ;; 18:7113 $09
    ld   [hl], b                                  ;; 18:7114 $70
    xor  a                                        ;; 18:7115 $AF
    ld   [wD201], a                               ;; 18:7116 $EA $01 $D2
    call GetEntityTransitionCountdown             ;; 18:7119 $CD $05 $0C
    ld   [hl], $40                                ;; 18:711C $36 $40
    call IncrementEntityState                     ;; 18:711E $CD $12 $3B

.jr_7121
    jp   label_018_70FD                           ;; 18:7121 $C3 $FD $70

GrimCreeperState5Handler::
    call GetEntityTransitionCountdown             ;; 18:7124 $CD $05 $0C
    ret  nz                                       ;; 18:7127 $C0

    ld   a, $FF                                   ;; 18:7128 $3E $FF
    ld   [wD201], a                               ;; 18:712A $EA $01 $D2
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:712D $21 $50 $C4
    add  hl, bc                                   ;; 18:7130 $09
    ld   [hl], $40                                ;; 18:7131 $36 $40
    jp   IncrementEntityState                     ;; 18:7133 $C3 $12 $3B

GrimCreeperState6Handler::
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:7136 $21 $50 $C4
    add  hl, bc                                   ;; 18:7139 $09
    ld   a, [hl]                                  ;; 18:713A $7E
    and  a                                        ;; 18:713B $A7
    jr   nz, jr_018_7157                          ;; 18:713C $20 $19

    ld   a, [wRoomEventEffectExecuted]            ;; 18:713E $FA $8F $C1
    and  a                                        ;; 18:7141 $A7
    jr   nz, .jr_7152                             ;; 18:7142 $20 $0E

    ld   hl, wEntitiesPrivateState2Table          ;; 18:7144 $21 $C0 $C2
    add  hl, bc                                   ;; 18:7147 $09
    ld   a, [hl]                                  ;; 18:7148 $7E
    and  a                                        ;; 18:7149 $A7
    jr   nz, .jr_7152                             ;; 18:714A $20 $06

    inc  [hl]                                     ;; 18:714C $34
    call_open_dialog Dialog1DF                    ;; 18:714D

.jr_7152
    call IncrementEntityState                     ;; 18:7152 $CD $12 $3B
    ld   [hl], $01                                ;; 18:7155 $36 $01

jr_018_7157:
    ld   a, $02                                   ;; 18:7157 $3E $02
    jp   SetEntitySpriteVariant                   ;; 18:7159 $C3 $0C $3B

    ret                                           ;; 18:715C $C9

Data_018_715D::
    db   $00, $F8, $60, $02, $00, $00, $62, $02, $00, $08, $64, $02, $00, $F8, $66, $02
    db   $00, $00, $62, $02, $00, $08, $64, $02, $10, $00, $68, $02, $00, $00, $62, $02
    db   $00, $08, $64, $02

func_018_7181::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:7181 $F0 $F1
    rla                                           ;; 18:7183 $17
    rla                                           ;; 18:7184 $17
    and  $FC                                      ;; 18:7185 $E6 $FC
    ld   e, a                                     ;; 18:7187 $5F
    sla  a                                        ;; 18:7188 $CB $27
    add  e                                        ;; 18:718A $83
    ld   e, a                                     ;; 18:718B $5F
    ld   d, b                                     ;; 18:718C $50
    ld   hl, Data_018_715D                        ;; 18:718D $21 $5D $71
    add  hl, de                                   ;; 18:7190 $19
    ld   c, $03                                   ;; 18:7191 $0E $03
    call RenderActiveEntitySpritesRect            ;; 18:7193 $CD $E6 $3C
    ld   a, $01                                   ;; 18:7196 $3E $01
    jp   func_015_7964_trampoline                 ;; 18:7198 $C3 $A0 $3D

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
GrimCreeperSpriteVariants::
.variant0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

label_018_71A3:
    ld   de, GrimCreeperSpriteVariants            ;; 18:71A3 $11 $9B $71
    call RenderActiveEntitySpritesPair            ;; 18:71A6 $CD $C0 $3B
    call ReturnIfNonInteractive_18                ;; 18:71A9 $CD $E8 $7D
    call DecrementEntityIgnoreHitsCountdown       ;; 18:71AC $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ;; 18:71AF $F0 $F0
    JP_TABLE                                      ;; 18:71B1
._00 dw func_018_721C                             ;; 18:71B2
._01 dw func_018_7288                             ;; 18:71B4
._02 dw func_018_72A5                             ;; 18:71B6
._03 dw func_018_72C8                             ;; 18:71B8
._04 dw func_018_72F4                             ;; 18:71BA

Data_018_71BC::
    db   $28, $38, $48, $58, $68, $78, $38, $68, $48, $58, $48, $58, $18, $88, $28, $78
    db   $60, $40, $28, $78, $78, $28, $60, $40, $28, $78, $28, $78, $50, $50, $38, $68
    db   $50, $50, $38, $68, $38, $68, $38, $68, $38, $68, $28, $78, $38, $48, $68, $58

Data_018_71EC::
    db   $20, $30, $40, $40, $30, $20, $60, $60, $50, $70, $70, $50, $38, $38, $58, $58
    db   $70, $70, $30, $30, $70, $70, $50, $50, $30, $70, $70, $30, $30, $70, $40, $60
    db   $70, $30, $60, $40, $30, $30, $50, $50, $70, $70, $40, $40, $50, $40, $50, $40

func_018_721C::
    ldh  a, [hLinkPositionX]                      ;; 18:721C $F0 $98

.jr_721E
    push af                                       ;; 18:721E $F5
    ldh  a, [hLinkPositionY]                      ;; 18:721F $F0 $99
    push af                                       ;; 18:7221 $F5
    ld   a, [wD205]                               ;; 18:7222 $FA $05 $D2
    rla                                           ;; 18:7225 $17
    and  $FE                                      ;; 18:7226 $E6 $FE
    ld   e, a                                     ;; 18:7228 $5F
    rla                                           ;; 18:7229 $17
    and  $FC                                      ;; 18:722A $E6 $FC

.jr_722C
    add  e                                        ;; 18:722C $83
    ld   hl, wEntitiesInertiaTable                ;; 18:722D $21 $D0 $C3

.jr_7230
    add  hl, bc                                   ;; 18:7230 $09
    add  [hl]                                     ;; 18:7231 $86

.jr_7232
    ld   e, a                                     ;; 18:7232 $5F

.jr_7233
    ld   d, b                                     ;; 18:7233 $50
    ld   hl, Data_018_71BC                        ;; 18:7234 $21 $BC $71
    add  hl, de                                   ;; 18:7237 $19
    ld   a, [hl]                                  ;; 18:7238 $7E

.jr_7239
    ldh  [hLinkPositionX], a                      ;; 18:7239 $E0 $98
    ld   hl, Data_018_71EC                        ;; 18:723B $21 $EC $71
    add  hl, de                                   ;; 18:723E $19
    ld   a, [hl]                                  ;; 18:723F $7E
    ldh  [hLinkPositionY], a                      ;; 18:7240 $E0 $99

.jr_7242
    ldh  a, [hFrameCounter]                       ;; 18:7242 $F0 $E7

.jr_7244
    xor  c                                        ;; 18:7244 $A9
    and  $03                                      ;; 18:7245 $E6 $03
    jr   nz, .jr_724E                             ;; 18:7247 $20 $05

    ld   a, $10                                   ;; 18:7249 $3E $10
    call ApplyVectorTowardsLink_trampoline        ;; 18:724B $CD $AA $3B

.jr_724E
    ld   hl, hActiveEntityPosX                    ;; 18:724E $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ;; 18:7251 $F0 $98
    sub  [hl]                                     ;; 18:7253 $96
    add  $03                                      ;; 18:7254 $C6 $03
    cp   $06                                      ;; 18:7256 $FE $06
    jr   nc, jr_018_726D                          ;; 18:7258 $30 $13

    ld   hl, hActiveEntityVisualPosY              ;; 18:725A $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ;; 18:725D $F0 $99
    sub  [hl]                                     ;; 18:725F $96

.jr_7260
    add  $03                                      ;; 18:7260 $C6 $03
    cp   $06                                      ;; 18:7262 $FE $06
    jr   nc, jr_018_726D                          ;; 18:7264 $30 $07

    ld   hl, wD201                                ;; 18:7266 $21 $01 $D2
    inc  [hl]                                     ;; 18:7269 $34
    call IncrementEntityState                     ;; 18:726A $CD $12 $3B

jr_018_726D:
    pop  af                                       ;; 18:726D $F1
    ldh  [hLinkPositionY], a                      ;; 18:726E $E0 $99
    pop  af                                       ;; 18:7270 $F1
    ldh  [hLinkPositionX], a                      ;; 18:7271 $E0 $98

func_018_7273::
    call UpdateEntityPosWithSpeed_18              ;; 18:7273 $CD $5F $7E

label_018_7276:
    ldh  a, [hFrameCounter]                       ;; 18:7276 $F0 $E7
    rra                                           ;; 18:7278 $1F
    rra                                           ;; 18:7279 $1F
    rra                                           ;; 18:727A $1F
    and  $01                                      ;; 18:727B $E6 $01
    jp   SetEntitySpriteVariant                   ;; 18:727D $C3 $0C $3B

Data_018_7280::
    db   $04, $0C, $14, $1C, $24, $2C, $34, $3C

func_018_7288::
    ld   a, [wD201]                               ;; 18:7288 $FA $01 $D2
    cp   $FF                                      ;; 18:728B $FE $FF
    jr   nz, .jr_72A2                             ;; 18:728D $20 $13

    ld   hl, wEntitiesInertiaTable                ;; 18:728F $21 $D0 $C3
    add  hl, bc                                   ;; 18:7292 $09
    ld   e, [hl]                                  ;; 18:7293 $5E
    ld   d, b                                     ;; 18:7294 $50
    ld   hl, Data_018_7280                        ;; 18:7295 $21 $80 $72
    add  hl, de                                   ;; 18:7298 $19
    ld   a, [hl]                                  ;; 18:7299 $7E
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:729A $21 $50 $C4
    add  hl, bc                                   ;; 18:729D $09
    ld   [hl], a                                  ;; 18:729E $77
    call IncrementEntityState                     ;; 18:729F $CD $12 $3B

.jr_72A2
    jp   label_018_7276                           ;; 18:72A2 $C3 $76 $72

func_018_72A5::
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 18:72A5 $21 $50 $C4
    add  hl, bc                                   ;; 18:72A8 $09
    ld   a, [hl]                                  ;; 18:72A9 $7E
    and  a                                        ;; 18:72AA $A7
    jr   nz, .jr_72C5                             ;; 18:72AB $20 $18

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:72AD $21 $40 $C3
    add  hl, bc                                   ;; 18:72B0 $09
    res  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ;; 18:72B1 $CB $B6
    ld   a, $20                                   ;; 18:72B3 $3E $20
    call ApplyVectorTowardsLink_trampoline        ;; 18:72B5 $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ;; 18:72B8 $21 $20 $C3
    add  hl, bc                                   ;; 18:72BB $09
    ld   [hl], $F4                                ;; 18:72BC $36 $F4
    ld   a, JINGLE_GRIM_CREEPER_BATS              ;; 18:72BE $3E $31
    ldh  [hJingle], a                             ;; 18:72C0 $E0 $F2
    call IncrementEntityState                     ;; 18:72C2 $CD $12 $3B

.jr_72C5
    jp   label_018_7276                           ;; 18:72C5 $C3 $76 $72

func_018_72C8::
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 18:72C8 $CD $39 $3B
    call func_018_7273                            ;; 18:72CB $CD $73 $72
    call AddEntityZSpeedToPos_18                  ;; 18:72CE $CD $98 $7E
    ldh  a, [hFrameCounter]                       ;; 18:72D1 $F0 $E7
    and  $03                                      ;; 18:72D3 $E6 $03
    jr   nz, .jr_72E1                             ;; 18:72D5 $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ;; 18:72D7 $21 $20 $C3
    add  hl, bc                                   ;; 18:72DA $09
    ld   a, [hl]                                  ;; 18:72DB $7E
    cp   $0C                                      ;; 18:72DC $FE $0C
    jr   z, .jr_72E1                              ;; 18:72DE $28 $01

    inc  [hl]                                     ;; 18:72E0 $34

.jr_72E1
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:72E1 $F0 $EC
    cp   $88                                      ;; 18:72E3 $FE $88
    jr   nc, .jr_72EC                             ;; 18:72E5 $30 $05

    ldh  a, [hActiveEntityPosX]                   ;; 18:72E7 $F0 $EE
    cp   $A8                                      ;; 18:72E9 $FE $A8
    ret  c                                        ;; 18:72EB $D8

.jr_72EC
    call IncrementEntityState                     ;; 18:72EC $CD $12 $3B
    ld   a, $FF                                   ;; 18:72EF $3E $FF
    jp   SetEntitySpriteVariant                   ;; 18:72F1 $C3 $0C $3B

func_018_72F4::
    ret                                           ;; 18:72F4 $C9
