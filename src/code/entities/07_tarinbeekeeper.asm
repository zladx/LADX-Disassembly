; Tarin picking up the honeycomb
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TarinBeekeeperSpriteVariants::
.variant0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $5C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
.variant7
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant8
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0

TarinBeekeeperEntityHandler::
    ld   a, c                                     ;; 07:4EB1 $79
    ld   [wD204], a                               ;; 07:4EB2 $EA $04 $D2
    ld   hl, wEntitiesPrivateState5Table          ;; 07:4EB5 $21 $90 $C3
    add  hl, bc                                   ;; 07:4EB8 $09
    ld   a, [hl]                                  ;; 07:4EB9 $7E
    and  a                                        ;; 07:4EBA $A7
    jr   nz, .jr_4EC5                             ;; 07:4EBB $20 $08

    inc  [hl]                                     ;; 07:4EBD $34
    ldh  a, [hRoomStatus]                         ;; 07:4EBE $F0 $F8
    and  ROOM_STATUS_EVENT_3                      ;; 07:4EC0 $E6 $40
    jp   nz, ClearEntityStatus_07                 ;; 07:4EC2 $C2 $A4 $7E

.jr_4EC5
    ld   a, [wHasInstrument3]                     ;; 07:4EC5 $FA $67 $DB
    and  $02                                      ;; 07:4EC8 $E6 $02
    jp   z, ClearEntityStatus_07                  ;; 07:4ECA $CA $A4 $7E

    ld   de, TarinBeekeeperSpriteVariants         ;; 07:4ECD $11 $8D $4E
    call RenderActiveEntitySpritesPair            ;; 07:4ED0 $CD $C0 $3B
    call ReturnIfNonInteractive_07                ;; 07:4ED3 $CD $96 $7D
    call AddEntityZSpeedToPos_07                  ;; 07:4ED6 $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4ED9 $21 $20 $C3
    add  hl, bc                                   ;; 07:4EDC $09
    dec  [hl]                                     ;; 07:4EDD $35
    dec  [hl]                                     ;; 07:4EDE $35
    ld   hl, wEntitiesPosZTable                   ;; 07:4EDF $21 $10 $C3
    add  hl, bc                                   ;; 07:4EE2 $09
    ld   a, [hl]                                  ;; 07:4EE3 $7E
    and  $80                                      ;; 07:4EE4 $E6 $80
    jr   z, .jr_4EEE                              ;; 07:4EE6 $28 $06

    ld   [hl], b                                  ;; 07:4EE8 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:4EE9 $21 $20 $C3
    add  hl, bc                                   ;; 07:4EEC $09
    ld   [hl], b                                  ;; 07:4EED $70

.jr_4EEE
    ldh  a, [hActiveEntityState]                  ;; 07:4EEE $F0 $F0
    JP_TABLE                                      ;; 07:4EF0
._00 dw func_007_4EFF                             ;; 07:4EF1
._01 dw func_007_4F1F                             ;; 07:4EF3
._02 dw func_007_4F56                             ;; 07:4EF5
._03 dw func_007_4FC6                             ;; 07:4EF7
._04 dw func_007_504E                             ;; 07:4EF9
._05 dw func_007_50B4                             ;; 07:4EFB
._06 dw func_007_50E3                             ;; 07:4EFD

func_007_4EFF::
    ld   a, $02                                   ;; 07:4EFF $3E $02
    call SetEntitySpriteVariant                   ;; 07:4F01 $CD $0C $3B
    ld   hl, wEntitiesPosXTable                   ;; 07:4F04 $21 $00 $C2
    add  hl, bc                                   ;; 07:4F07 $09
    ld   [hl], $60                                ;; 07:4F08 $36 $60
    ld   hl, wEntitiesPosYTable                   ;; 07:4F0A $21 $10 $C2
    add  hl, bc                                   ;; 07:4F0D $09
    ld   [hl], $58                                ;; 07:4F0E $36 $58
    call PushLinkOutOfEntity_07                   ;; 07:4F10 $CD $F0 $7C
    call func_007_7D43                            ;; 07:4F13 $CD $43 $7D
    ret  nc                                       ;; 07:4F16 $D0

    call_open_dialog Dialog1C0                    ;; 07:4F17
    jp   IncrementEntityState                     ;; 07:4F1C $C3 $12 $3B

func_007_4F1F::
    call PushLinkOutOfEntity_07                   ;; 07:4F1F $CD $F0 $7C
    ld   a, [wDialogState]                        ;; 07:4F22 $FA $9F $C1
    and  a                                        ;; 07:4F25 $A7
    jr   nz, ret_007_4F4D                         ;; 07:4F26 $20 $25

    ld   a, [wDialogAskSelectionIndex]            ;; 07:4F28 $FA $77 $C1
    and  a                                        ;; 07:4F2B $A7
    jr   nz, .jr_4F44                             ;; 07:4F2C $20 $16

    ld   a, $02                                   ;; 07:4F2E $3E $02
    ld   [wExchangingTradeSequenceItem], a        ;; 07:4F30 $EA $7F $DB
    ld   hl, wOverworldRoomStatus + $87           ;; 07:4F33 $21 $87 $D8
    set  OW_ROOM_STATUS_FLAG_UNKNOWN_6, [hl]      ;; 07:4F36 $CB $F6
    call GetEntityTransitionCountdown             ;; 07:4F38 $CD $05 $0C
    ld   [hl], $A0                                ;; 07:4F3B $36 $A0
    ld   a, JINGLE_TREASURE_FOUND                 ;; 07:4F3D $3E $01
    ldh  [hJingle], a                             ;; 07:4F3F $E0 $F2
    jp   IncrementEntityState                     ;; 07:4F41 $C3 $12 $3B

.jr_4F44
    call_open_dialog Dialog1C2                    ;; 07:4F44
    call IncrementEntityState                     ;; 07:4F49 $CD $12 $3B
    ld   [hl], b                                  ;; 07:4F4C $70

ret_007_4F4D:
    ret                                           ;; 07:4F4D $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown102SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db $FF, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_1 | OAMF_PAL0

func_007_4F56::
    ld   a, $01                                   ;; 07:4F56 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:4F58 $E0 $A1
    ld   [wC167], a                               ;; 07:4F5A $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 07:4F5D $CD $05 $0C
    cp   $30                                      ;; 07:4F60 $FE $30
    jr   c, .jr_4F7B                              ;; 07:4F62 $38 $17

    xor  a                                        ;; 07:4F64 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4F65 $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:4F67 $F0 $EC
    sub  $10                                      ;; 07:4F69 $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 07:4F6B $E0 $EC
    ld   de, Unknown102SpriteVariants             ;; 07:4F6D $11 $4E $4F
    call RenderActiveEntitySpritesPair            ;; 07:4F70 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4F73 $CD $8A $3D
    ld   a, $08                                   ;; 07:4F76 $3E $08
    jp   SetEntitySpriteVariant                   ;; 07:4F78 $C3 $0C $3B

; Tarin beehive cutscene related
.jr_4F7B
    cp   $18                                      ;; 07:4F7B $FE $18
    jr   nc, .jr_4FA5                             ;; 07:4F7D $30 $26

    ld   a, $02                                   ;; 07:4F7F $3E $02
    ldh  [hLinkDirection], a                      ;; 07:4F81 $E0 $9E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:4F83 $21 $40 $C2
    add  hl, bc                                   ;; 07:4F86 $09
    ld   [hl], $FE                                ;; 07:4F87 $36 $FE
    call GetEntitySpeedYAddress                   ;; 07:4F89 $CD $05 $40
    ld   [hl], $F4                                ;; 07:4F8C $36 $F4
    call UpdateEntityPosWithSpeed_07              ;; 07:4F8E $CD $0A $7E
    call GetEntityTransitionCountdown             ;; 07:4F91 $CD $05 $0C
    jr   nz, .jr_4FA5                             ;; 07:4F94 $20 $0F

    ld   a, MUSIC_TARIN_BEES                      ;; 07:4F96 $3E $34
    ld   [wMusicTrackToPlay], a                   ;; 07:4F98 $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ;; 07:4F9B $E0 $B0
    call GetEntityTransitionCountdown             ;; 07:4F9D $CD $05 $0C
    ld   [hl], $C0                                ;; 07:4FA0 $36 $C0
    jp   IncrementEntityState                     ;; 07:4FA2 $C3 $12 $3B

.jr_4FA5
    ld   a, $01                                   ;; 07:4FA5 $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:4FA7 $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ;; 07:4FA9 $F0 $EE
    sub  $0C                                      ;; 07:4FAB $D6 $0C
    ldh  [hActiveEntityPosX], a                   ;; 07:4FAD $E0 $EE
    ld   de, Unknown102SpriteVariants             ;; 07:4FAF $11 $4E $4F
    call RenderActiveEntitySpritesPair            ;; 07:4FB2 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:4FB5 $CD $8A $3D
    call GetEntityTransitionCountdown             ;; 07:4FB8 $CD $05 $0C
    rra                                           ;; 07:4FBB $1F
    rra                                           ;; 07:4FBC $1F
    rra                                           ;; 07:4FBD $1F
    rra                                           ;; 07:4FBE $1F
    and  $01                                      ;; 07:4FBF $E6 $01
    add  $02                                      ;; 07:4FC1 $C6 $02
    jp   SetEntitySpriteVariant                   ;; 07:4FC3 $C3 $0C $3B

func_007_4FC6::
    ld   a, $01                                   ;; 07:4FC6 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:4FC8 $E0 $A1
    call GetEntityTransitionCountdown             ;; 07:4FCA $CD $05 $0C
    jr   nz, .jr_4FD4                             ;; 07:4FCD $20 $05

    ld   [hl], $0C                                ;; 07:4FCF $36 $0C
    call IncrementEntityState                     ;; 07:4FD1 $CD $12 $3B

.jr_4FD4
    call GetEntityTransitionCountdown             ;; 07:4FD4 $CD $05 $0C
    cp   $20                                      ;; 07:4FD7 $FE $20
    jr   nz, .jr_4FE5                             ;; 07:4FD9 $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ;; 07:4FDB $21 $20 $C3
    add  hl, bc                                   ;; 07:4FDE $09
    ld   [hl], $18                                ;; 07:4FDF $36 $18
    call func_007_733F                            ;; 07:4FE1 $CD $3F $73
    xor  a                                        ;; 07:4FE4 $AF

.jr_4FE5
    cp   $60                                      ;; 07:4FE5 $FE $60
    jr   nz, .jr_4FED                             ;; 07:4FE7 $20 $04

    ld   hl, wD202                                ;; 07:4FE9 $21 $02 $D2
    inc  [hl]                                     ;; 07:4FEC $34

.jr_4FED
    cp   $A0                                      ;; 07:4FED $FE $A0
    jr   nz, .jr_4FFC                             ;; 07:4FEF $20 $0B

    ld   a, [wD201]                               ;; 07:4FF1 $FA $01 $D2
    ld   e, a                                     ;; 07:4FF4 $5F
    ld   d, b                                     ;; 07:4FF5 $50
    ld   hl, wEntitiesTransitionCountdownTable    ;; 07:4FF6 $21 $E0 $C2
    add  hl, de                                   ;; 07:4FF9 $19
    ld   [hl], $A0                                ;; 07:4FFA $36 $A0

.jr_4FFC
    and  $20                                      ;; 07:4FFC $E6 $20
    jr   z, .jr_5012                              ;; 07:4FFE $28 $12

    ld   a, $01                                   ;; 07:5000 $3E $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:5002 $E0 $F1
    ldh  a, [hActiveEntityPosX]                   ;; 07:5004 $F0 $EE
    sub  $0E                                      ;; 07:5006 $D6 $0E
    ldh  [hActiveEntityPosX], a                   ;; 07:5008 $E0 $EE
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:500A $F0 $EC
    sub  $08                                      ;; 07:500C $D6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 07:500E $E0 $EC
    jr   jr_007_501B                              ;; 07:5010 $18 $09

.jr_5012
    xor  a                                        ;; 07:5012 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 07:5013 $E0 $F1
    ldh  a, [hActiveEntityVisualPosY]             ;; 07:5015 $F0 $EC
    sub  $10                                      ;; 07:5017 $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 07:5019 $E0 $EC

jr_007_501B:
    ld   de, Unknown102SpriteVariants             ;; 07:501B $11 $4E $4F
    call RenderActiveEntitySpritesPair            ;; 07:501E $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 07:5021 $CD $8A $3D
    call GetEntityTransitionCountdown             ;; 07:5024 $CD $05 $0C
    ld   e, $02                                   ;; 07:5027 $1E $02
    and  $20                                      ;; 07:5029 $E6 $20
    jr   z, .jr_502E                              ;; 07:502B $28 $01

    inc  e                                        ;; 07:502D $1C

.jr_502E
    ld   a, e                                     ;; 07:502E $7B
    jp   SetEntitySpriteVariant                   ;; 07:502F $C3 $0C $3B

Data_007_5032::
    db   $20, $00, $E0, $00

Data_007_5036::
    db   $00, $E0, $00, $20

Data_007_503A::
    db   $00, $02, $01

Data_007_503D::
    db   $03, $16, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28

Data_007_504A::
    db   $00, $02, $04, $06

func_007_504E::
    ld   a, $01                                   ;; 07:504E $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:5050 $E0 $A1
    call GetEntityTransitionCountdown             ;; 07:5052 $CD $05 $0C
    jr   nz, jr_007_506E                          ;; 07:5055 $20 $17

    ld   hl, wEntitiesInertiaTable                ;; 07:5057 $21 $D0 $C3
    add  hl, bc                                   ;; 07:505A $09
    ld   a, [hl]                                  ;; 07:505B $7E
    inc  a                                        ;; 07:505C $3C
    ld   [hl], a                                  ;; 07:505D $77
    cp   $0B                                      ;; 07:505E $FE $0B
    jp   z, IncrementEntityState                  ;; 07:5060 $CA $12 $3B

    ld   e, a                                     ;; 07:5063 $5F
    ld   d, b                                     ;; 07:5064 $50
    ld   hl, Data_007_503D                        ;; 07:5065 $21 $3D $50
    add  hl, de                                   ;; 07:5068 $19

.jr_5069
    ld   e, [hl]                                  ;; 07:5069 $5E
    call GetEntityTransitionCountdown             ;; 07:506A $CD $05 $0C

.jr_506D
    ld   [hl], e                                  ;; 07:506D $73

jr_007_506E:
    ld   hl, wEntitiesInertiaTable                ;; 07:506E $21 $D0 $C3

.jr_5071
    add  hl, bc                                   ;; 07:5071 $09
    ld   a, [hl]                                  ;; 07:5072 $7E
    and  $03                                      ;; 07:5073 $E6 $03
    ld   e, a                                     ;; 07:5075 $5F
    ld   d, b                                     ;; 07:5076 $50
    ld   hl, Data_007_5032                        ;; 07:5077 $21 $32 $50
    add  hl, de                                   ;; 07:507A $19
    ld   a, [hl]                                  ;; 07:507B $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 07:507C $21 $40 $C2
    add  hl, bc                                   ;; 07:507F $09
    ld   [hl], a                                  ;; 07:5080 $77
    ld   hl, Data_007_5036                        ;; 07:5081 $21 $36 $50
    add  hl, de                                   ;; 07:5084 $19
    ld   a, [hl]                                  ;; 07:5085 $7E
    call GetEntitySpeedYAddress                   ;; 07:5086 $CD $05 $40
    ld   [hl], a                                  ;; 07:5089 $77
    ld   hl, Data_007_503A                        ;; 07:508A $21 $3A $50
    add  hl, de                                   ;; 07:508D $19
    ld   a, [hl]                                  ;; 07:508E $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:508F $21 $80 $C3
    add  hl, bc                                   ;; 07:5092 $09
    ld   [hl], a                                  ;; 07:5093 $77
    call GetEntityDirectionToLink_07              ;; 07:5094 $CD $7D $7E
    ld   a, e                                     ;; 07:5097 $7B
    xor  $01                                      ;; 07:5098 $EE $01

jr_007_509A:
    ldh  [hLinkDirection], a                      ;; 07:509A $E0 $9E
    call UpdateEntityPosWithSpeed_07              ;; 07:509C $CD $0A $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:509F $21 $80 $C3
    add  hl, bc                                   ;; 07:50A2 $09
    ld   e, [hl]                                  ;; 07:50A3 $5E
    ld   d, b                                     ;; 07:50A4 $50
    ld   hl, Data_007_504A                        ;; 07:50A5 $21 $4A $50
    add  hl, de                                   ;; 07:50A8 $19
    ldh  a, [hFrameCounter]                       ;; 07:50A9 $F0 $E7
    rra                                           ;; 07:50AB $1F
    rra                                           ;; 07:50AC $1F
    rra                                           ;; 07:50AD $1F
    and  $01                                      ;; 07:50AE $E6 $01
    or   [hl]                                     ;; 07:50B0 $B6
    jp   SetEntitySpriteVariant                   ;; 07:50B1 $C3 $0C $3B

func_007_50B4::
    ld   a, $01                                   ;; 07:50B4 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:50B6 $E0 $A1
    ld   hl, wEntitiesDirectionTable              ;; 07:50B8 $21 $80 $C3
    add  hl, bc                                   ;; 07:50BB $09
    ld   a, $01                                   ;; 07:50BC $3E $01
    ld   [hl], a                                  ;; 07:50BE $77
    ld   hl, wEntitiesSpeedXTable                 ;; 07:50BF $21 $40 $C2
    add  hl, bc                                   ;; 07:50C2 $09
    ld   [hl], $E4                                ;; 07:50C3 $36 $E4
    call GetEntitySpeedYAddress                   ;; 07:50C5 $CD $05 $40
    ld   [hl], $08                                ;; 07:50C8 $36 $08
    call UpdateEntityPosWithSpeed_07              ;; 07:50CA $CD $0A $7E
    ldh  a, [hActiveEntityPosX]                   ;; 07:50CD $F0 $EE
    cp   $C0                                      ;; 07:50CF $FE $C0
    jr   c, label_007_50DF                        ;; 07:50D1 $38 $0C

    cp   $C4                                      ;; 07:50D3 $FE $C4
    jp   nc, label_007_50DF                       ;; 07:50D5 $D2 $DF $50

    xor  a                                        ;; 07:50D8 $AF
    ld   [wC167], a                               ;; 07:50D9 $EA $67 $C1
    call IncrementEntityState                     ;; 07:50DC $CD $12 $3B

label_007_50DF:
    ld   a, $01                                   ;; 07:50DF $3E $01
    jr   jr_007_509A                              ;; 07:50E1 $18 $B7

func_007_50E3::
    ld   a, [wD201]                               ;; 07:50E3 $FA $01 $D2
    ld   e, a                                     ;; 07:50E6 $5F
    ld   d, b                                     ;; 07:50E7 $50
    ld   hl, wEntitiesStateTable                  ;; 07:50E8 $21 $90 $C2
    add  hl, de                                   ;; 07:50EB $19
    inc  [hl]                                     ;; 07:50EC $34
    ld   hl, wEntitiesTransitionCountdownTable    ;; 07:50ED $21 $E0 $C2
    add  hl, de                                   ;; 07:50F0 $19
    ld   [hl], $50                                ;; 07:50F1 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 07:50F3 $21 $10 $C2
    add  hl, de                                   ;; 07:50F6 $19
    ld   a, [hl]                                  ;; 07:50F7 $7E
    add  $10                                      ;; 07:50F8 $C6 $10
    ld   [hl], a                                  ;; 07:50FA $77
    ld   hl, wEntitiesPosZTable                   ;; 07:50FB $21 $10 $C3
    add  hl, de                                   ;; 07:50FE $19
    ld   [hl], $10                                ;; 07:50FF $36 $10
    jp   ClearEntityStatus_07                     ;; 07:5101 $C3 $A4 $7E
