; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RollingBonesSpriteVariants::
.variant0
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_YFLIP
    db $6C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

Data_006_6EDD::
    db   $70, $60, $50, $40, $30, $20

RollingBonesBarEntityHandler::
    ldh  a, [hMapId]                              ;; 06:6EE3 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 06:6EE5 $FE $07
    jr   nz, .jr_6EED                             ;; 06:6EE7 $20 $04

    ld   a, $10                                   ;; 06:6EE9 $3E $10
    ldh  [hActiveEntityTilesOffset], a            ;; 06:6EEB $E0 $F5

.jr_6EED
    ldh  a, [hRoomStatus]                         ;; 06:6EED $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 06:6EEF $E6 $20
    jp   nz, ClearEntityStatus_06                 ;; 06:6EF1 $C2 $DB $65

    ld   a, c                                     ;; 06:6EF4 $79
    ld   [wD201], a                               ;; 06:6EF5 $EA $01 $D2
    call func_006_6FEA                            ;; 06:6EF8 $CD $EA $6F
    call ReturnIfNonInteractive_06                ;; 06:6EFB $CD $C6 $64
    ld   a, [wD202]                               ;; 06:6EFE $FA $02 $D2
    ld   e, a                                     ;; 06:6F01 $5F
    ld   d, b                                     ;; 06:6F02 $50

.jr_6F03
    ld   hl, wEntitiesStatusTable                 ;; 06:6F03 $21 $80 $C2
    add  hl, de                                   ;; 06:6F06 $19
    ld   a, [hl]                                  ;; 06:6F07 $7E
    cp   $01                                      ;; 06:6F08 $FE $01
    ret  z                                        ;; 06:6F0A $C8

    and  a                                        ;; 06:6F0B $A7
    jr   nz, jr_006_6F48                          ;; 06:6F0C $20 $3A

    call GetEntityTransitionCountdown             ;; 06:6F0E $CD $05 $0C
    jr   nz, ret_006_6F47                         ;; 06:6F11 $20 $34

    ld   [hl], $03                                ;; 06:6F13 $36 $03
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6F15 $21 $B0 $C2
    add  hl, bc                                   ;; 06:6F18 $09
    ldh  a, [hActiveEntityPosX]                   ;; 06:6F19 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 06:6F1B $E0 $D7
    ld   e, [hl]                                  ;; 06:6F1D $5E
    inc  [hl]                                     ;; 06:6F1E $34
    ld   a, [hl]                                  ;; 06:6F1F $7E
    cp   $06                                      ;; 06:6F20 $FE $06
    jr   nz, .jr_6F3C                             ;; 06:6F22 $20 $18

    call ClearEntityStatus_06                     ;; 06:6F24 $CD $DB $65
    ld   hl, wEntitiesLoadOrderTable              ;; 06:6F27 $21 $60 $C4
    add  hl, bc                                   ;; 06:6F2A $09
    ld   e, [hl]                                  ;; 06:6F2B $5E
    ld   d, b                                     ;; 06:6F2C $50
    ld   hl, data_3F48                            ;; 06:6F2D $21 $48 $3F
    add  hl, de                                   ;; 06:6F30 $19
    ldh  a, [hMapRoom]                            ;; 06:6F31 $F0 $F6
    ld   e, a                                     ;; 06:6F33 $5F
    ld   d, b                                     ;; 06:6F34 $50
    ld   a, [hl]                                  ;; 06:6F35 $7E
    ld   hl, wEntitiesClearedRooms                ;; 06:6F36 $21 $00 $CF
    add  hl, de                                   ;; 06:6F39 $19
    or   [hl]                                     ;; 06:6F3A $B6
    ld   [hl], a                                  ;; 06:6F3B $77

.jr_6F3C
    ld   d, b                                     ;; 06:6F3C $50
    ld   hl, Data_006_6EDD                        ;; 06:6F3D $21 $DD $6E
    add  hl, de                                   ;; 06:6F40 $19
    ld   a, [hl]                                  ;; 06:6F41 $7E
    ldh  [hMultiPurpose1], a                      ;; 06:6F42 $E0 $D8
    jp   label_006_7035                           ;; 06:6F44 $C3 $35 $70

ret_006_6F47:
    ret                                           ;; 06:6F47 $C9

jr_006_6F48:
    call DecrementEntityIgnoreHitsCountdown       ;; 06:6F48 $CD $56 $0C
    ldh  a, [hLinkPositionZ]                      ;; 06:6F4B $F0 $A2
    and  a                                        ;; 06:6F4D $A7
    jr   nz, .jr_6F53                             ;; 06:6F4E $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ;; 06:6F50 $CD $39 $3B

.jr_6F53
    call AddEntitySpeedToPos_06                   ;; 06:6F53 $CD $4E $65
    call ApplyEntityInteractionWithBackground_trampoline ;; 06:6F56 $CD $23 $3B
    ld   hl, wEntitiesSpeedXTable                 ;; 06:6F59 $21 $40 $C2
    add  hl, bc                                   ;; 06:6F5C $09
    ld   a, [hl]                                  ;; 06:6F5D $7E
    and  a                                        ;; 06:6F5E $A7
    jr   z, jr_006_6F86                           ;; 06:6F5F $28 $25

    bit  7, a                                     ;; 06:6F61 $CB $7F
    jr   z, .jr_6F67                              ;; 06:6F63 $28 $02

    cpl                                           ;; 06:6F65 $2F
    inc  a                                        ;; 06:6F66 $3C

.jr_6F67
    ld   e, $04                                   ;; 06:6F67 $1E $04
    cp   $08                                      ;; 06:6F69 $FE $08
    jr   nc, .jr_6F6F                             ;; 06:6F6B $30 $02

    ld   e, $08                                   ;; 06:6F6D $1E $08

.jr_6F6F
    cp   $04                                      ;; 06:6F6F $FE $04
    jr   nc, .jr_6F75                             ;; 06:6F71 $30 $02

    ld   e, $10                                   ;; 06:6F73 $1E $10

.jr_6F75
    cp   $02                                      ;; 06:6F75 $FE $02
    jr   nc, .jr_6F7B                             ;; 06:6F77 $30 $02

    ld   e, $20                                   ;; 06:6F79 $1E $20

.jr_6F7B
    ld   d, b                                     ;; 06:6F7B $50
    ldh  a, [hFrameCounter]                       ;; 06:6F7C $F0 $E7
    and  e                                        ;; 06:6F7E $A3
    jr   z, .jr_6F82                              ;; 06:6F7F $28 $01

    inc  d                                        ;; 06:6F81 $14

.jr_6F82
    ld   a, d                                     ;; 06:6F82 $7A
    call SetEntitySpriteVariant                   ;; 06:6F83 $CD $0C $3B

jr_006_6F86:
    ldh  a, [hActiveEntityState]                  ;; 06:6F86 $F0 $F0
    JP_TABLE                                      ;; 06:6F88
._00 dw RollingBonesBarRestingHandler
._01 dw RollingBonesBarRollingHandler
._02 dw RollingBonesBarDeceleratingHandler

RollingBonesBarRestingHandler::
    ret

RollingBonesBarRollingHandler::
    ld   hl, wEntitiesCollisionsTable             ;; 06:6F90 $21 $A0 $C2
    add  hl, bc                                   ;; 06:6F93 $09
    ld   a, [hl]                                  ;; 06:6F94 $7E
    and  $03                                      ;; 06:6F95 $E6 $03
    jr   z, .jr_6FB3                              ;; 06:6F97 $28 $1A

    ld   hl, wEntitiesSpeedXTable                 ;; 06:6F99 $21 $40 $C2
    add  hl, bc                                   ;; 06:6F9C $09
    ld   a, [hl]                                  ;; 06:6F9D $7E
    sra  a                                        ;; 06:6F9E $CB $2F
    cpl                                           ;; 06:6FA0 $2F
    inc  a                                        ;; 06:6FA1 $3C
    ld   [hl], a                                  ;; 06:6FA2 $77
    ld   a, $20                                   ;; 06:6FA3 $3E $20
    ld   [wScreenShakeCountdown], a               ;; 06:6FA5 $EA $57 $C1
    xor  a                                        ;; 06:6FA8 $AF
    ld   [wC158], a                               ;; 06:6FA9 $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 06:6FAC $3E $0B
    ldh  [hJingle], a                             ;; 06:6FAE $E0 $F2
    call IncrementEntityState                     ;; 06:6FB0 $CD $12 $3B

.jr_6FB3
    ld   a, [wD210]                               ;; 06:6FB3 $FA $10 $D2
    inc  a                                        ;; 06:6FB6 $3C
    cp   $09                                      ;; 06:6FB7 $FE $09
    jr   c, .jr_6FC0                              ;; 06:6FB9 $38 $05

    ld   a, WAVE_SFX_ROLLING_SPIKE_BAR            ;; 06:6FBB $3E $1A
    ldh  [hWaveSfx], a                            ;; 06:6FBD $E0 $F3
    xor  a                                        ;; 06:6FBF $AF

.jr_6FC0
    ld   [wD210], a                               ;; 06:6FC0 $EA $10 $D2
    ret                                           ;; 06:6FC3 $C9

RollingBonesBarDeceleratingHandler::
    ldh  a, [hFrameCounter]                       ;; 06:6FC4 $F0 $E7
    and  $07                                      ;; 06:6FC6 $E6 $07
    jr   nz, ret_006_6FD9                         ;; 06:6FC8 $20 $0F

    ld   hl, wEntitiesSpeedXTable                 ;; 06:6FCA $21 $40 $C2

.jr_6FCD
    add  hl, bc                                   ;; 06:6FCD $09
    ld   a, [hl]                                  ;; 06:6FCE $7E
    and  a                                        ;; 06:6FCF $A7
    jr   z, jr_006_6FDA                           ;; 06:6FD0 $28 $08

    and  $80                                      ;; 06:6FD2 $E6 $80
    jr   z, .jr_6FD8                              ;; 06:6FD4 $28 $02

    inc  [hl]                                     ;; 06:6FD6 $34
    inc  [hl]                                     ;; 06:6FD7 $34

.jr_6FD8
    dec  [hl]                                     ;; 06:6FD8 $35

ret_006_6FD9:
    ret                                           ;; 06:6FD9 $C9

jr_006_6FDA:
    call IncrementEntityState                     ;; 06:6FDA $CD $12 $3B
    ld   [hl], b                                  ;; 06:6FDD $70
    call GetEntityTransitionCountdown             ;; 06:6FDE $CD $05 $0C
    ld   [hl], $50                                ;; 06:6FE1 $36 $50
    ret                                           ;; 06:6FE3 $C9

Data_006_6FE4::
    db    $80, $70, $60, $50, $40, $30

func_006_6FEA::
    ld   a, $20
    ldh  [hActiveEntityVisualPosY], a

.loop
    ld   de, RollingBonesSpriteVariants           ;; 06:6FEE $11 $D5 $6E
    call RenderActiveEntitySpritesPair            ;; 06:6FF1 $CD $C0 $3B
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:6FF4 $F0 $EC
    add  $10                                      ;; 06:6FF6 $C6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 06:6FF8 $E0 $EC
    ld   hl, wEntitiesPrivateState1Table          ;; 06:6FFA $21 $B0 $C2
    add  hl, bc                                   ;; 06:6FFD $09
    ld   e, [hl]                                  ;; 06:6FFE $5E
    ld   d, b                                     ;; 06:6FFF $50
    ld   hl, Data_006_6FE4                        ;; 06:7000 $21 $E4 $6F
    add  hl, de                                   ;; 06:7003 $19
    cp   [hl]                                     ;; 06:7004 $BE
    jr   nz, .loop                                ;; 06:7005 $20 $E7

    jp   CopyEntityPositionToActivePosition       ;; 06:7007 $C3 $8A $3D
