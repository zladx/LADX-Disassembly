label_019_4D9B:
    ldh  a, [hRoomStatus]                         ;; 19:4D9B $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 19:4D9D $E6 $20
    jp   nz, ClearEntityStatus_19                 ;; 19:4D9F $C2 $61 $7E

    ld   hl, wEntitiesPrivateState1Table          ;; 19:4DA2 $21 $B0 $C2
    add  hl, bc                                   ;; 19:4DA5 $09
    ld   a, [hl]                                  ;; 19:4DA6 $7E
    and  a                                        ;; 19:4DA7 $A7
    jp   nz, label_019_4F30                       ;; 19:4DA8 $C2 $30 $4F

    ldh  a, [hActiveEntityState]                  ;; 19:4DAB $F0 $F0
    JP_TABLE                                      ;; 19:4DAD
._00 dw func_019_4DBC                             ;; 19:4DAE
._01 dw func_019_4E00                             ;; 19:4DB0
._02 dw func_019_4E09                             ;; 19:4DB2
._03 dw func_019_4E43                             ;; 19:4DB4
._04 dw func_019_4E74                             ;; 19:4DB6

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown064SpriteVariants::
.variant0
    db $60, $07
    db $62, $07

; Spawns the flying rooster?
func_019_4DBC::
    ld   a, c                                     ;; 19:4DBC $79
    ld   [wD201], a                               ;; 19:4DBD $EA $01 $D2
    ld   hl, wEntitiesPosXTable                   ;; 19:4DC0 $21 $00 $C2
    add  hl, bc                                   ;; 19:4DC3 $09
    ld   [hl], $50                                ;; 19:4DC4 $36 $50
    call func_019_4E00                            ;; 19:4DC6 $CD $00 $4E
    ld   a, [wOcarinaSongFlags]                   ;; 19:4DC9 $FA $49 $DB
    and  FROGS_SONG_OF_THE_SOUL_FLAG              ;; 19:4DCC $E6 $01
    ret  z                                        ;; 19:4DCE $C8

    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 19:4DCF $FA $66 $C1
    cp   $01                                      ;; 19:4DD2 $FE $01
    ret  nz                                       ;; 19:4DD4 $C0

    ld   a, [wSelectedSongIndex]                  ;; 19:4DD5 $FA $4A $DB
    cp   $02                                      ;; 19:4DD8 $FE $02
    ret  nz                                       ;; 19:4DDA $C0

    ld   a, ENTITY_FLYING_ROOSTER_EVENTS          ;; 19:4DDB $3E $DC
    call SpawnNewEntity_trampoline                ;; 19:4DDD $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:4DE0 $21 $00 $C2
    add  hl, de                                   ;; 19:4DE3 $19
    ld   [hl], $94                                ;; 19:4DE4 $36 $94
    ld   hl, wEntitiesPosYTable                   ;; 19:4DE6 $21 $10 $C2
    add  hl, de                                   ;; 19:4DE9 $19
    ld   [hl], $D8                                ;; 19:4DEA $36 $D8
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4DEC $21 $B0 $C2
    add  hl, de                                   ;; 19:4DEF $19
    inc  [hl]                                     ;; 19:4DF0 $34
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:4DF1 $21 $40 $C3
    add  hl, de                                   ;; 19:4DF4 $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:4DF5 $36 $C1
    ld   a, MUSIC_ROOSTER_REVIVAL                 ;; 19:4DF7 $3E $55
    ld   [wMusicTrackToPlay], a                   ;; 19:4DF9 $EA $68 $D3
    jp   IncrementEntityState                     ;; 19:4DFC $C3 $12 $3B

    ret                                           ;; 19:4DFF $C9

func_019_4E00::
    ld   de, Unknown064SpriteVariants             ;; 19:4E00 $11 $B8 $4D
    call RenderActiveEntitySpritesPair            ;; 19:4E03 $CD $C0 $3B
    jp   PushLinkOutOfEntity_19                   ;; 19:4E06 $C3 $A2 $7C

func_019_4E09::
    ld   a, $02                                   ;; 19:4E09 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4E0B $E0 $A1
    ld   [wC167], a                               ;; 19:4E0D $EA $67 $C1
    call func_019_4E00                            ;; 19:4E10 $CD $00 $4E
    call GetEntityTransitionCountdown             ;; 19:4E13 $CD $05 $0C
    jr   nz, .ret_4E36                            ;; 19:4E16 $20 $1E

    ld   [hl], $A0                                ;; 19:4E18 $36 $A0
    call IncrementEntityState                     ;; 19:4E1A $CD $12 $3B
    ld   a, ENTITY_BOMB                           ;; 19:4E1D $3E $02
    call SpawnNewEntity_trampoline                ;; 19:4E1F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 19:4E22 $21 $00 $C2
    add  hl, de                                   ;; 19:4E25 $19
    ldh  a, [hMultiPurpose0]                      ;; 19:4E26 $F0 $D7
    ld   [hl], a                                  ;; 19:4E28 $77
    ld   hl, wEntitiesPosYTable                   ;; 19:4E29 $21 $10 $C2
    add  hl, de                                   ;; 19:4E2C $19
    ldh  a, [hMultiPurpose1]                      ;; 19:4E2D $F0 $D8
    ld   [hl], a                                  ;; 19:4E2F $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:4E30 $21 $E0 $C2
    add  hl, de                                   ;; 19:4E33 $19
    ld   [hl], $20                                ;; 19:4E34 $36 $20

.ret_4E36
    ret                                           ;; 19:4E36 $C9

Data_019_4E37::
    db   $F0, $00, $64, $03, $00, $00, $66, $03, $00, $08, $68, $03

; Receive flying rooster 'item'
func_019_4E43::
    ld   a, $02                                   ;; 19:4E43 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4E45 $E0 $A1
    ld   [wC167], a                               ;; 19:4E47 $EA $67 $C1
    ld   hl, Data_019_4E37                        ;; 19:4E4A $21 $37 $4E
    ld   c, $03                                   ;; 19:4E4D $0E $03
    call RenderActiveEntitySpritesRect            ;; 19:4E4F $CD $E6 $3C
    call GetEntityTransitionCountdown             ;; 19:4E52 $CD $05 $0C
    jp   z, label_019_4E62                        ;; 19:4E55 $CA $62 $4E

    cp   $70                                      ;; 19:4E58 $FE $70
    jr   nz, .ret_4E61                            ;; 19:4E5A $20 $05

    ld   a, MUSIC_OBTAIN_ITEM                     ;; 19:4E5C $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 19:4E5E $EA $68 $D3

.ret_4E61
    ret                                           ;; 19:4E61 $C9

label_019_4E62:
    ldh  a, [hLinkPositionY]                      ;; 19:4E62 $F0 $99
    push af                                       ;; 19:4E64 $F5
    ld   a, $10                                   ;; 19:4E65 $3E $10
    ldh  [hLinkPositionY], a                      ;; 19:4E67 $E0 $99
    call_open_dialog Dialog16D                    ;; 19:4E69
    pop  af                                       ;; 19:4E6E $F1
    ldh  [hLinkPositionY], a                      ;; 19:4E6F $E0 $99
    jp   IncrementEntityState                     ;; 19:4E71 $C3 $12 $3B

func_019_4E74::
    ld   a, $02                                   ;; 19:4E74 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4E76 $E0 $A1
    ld   [wC167], a                               ;; 19:4E78 $EA $67 $C1
    ld   hl, Data_019_4E37                        ;; 19:4E7B $21 $37 $4E
    ld   c, $03                                   ;; 19:4E7E $0E $03
    call RenderActiveEntitySpritesRect            ;; 19:4E80 $CD $E6 $3C
    ld   a, [wDialogState]                        ;; 19:4E83 $FA $9F $C1
    and  a                                        ;; 19:4E86 $A7
    ret  nz                                       ;; 19:4E87 $C0

    ld   a, ENTITY_ROOSTER                        ;; 19:4E88 $3E $D5
    call SpawnNewEntity_trampoline                ;; 19:4E8A $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 19:4E8D $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 19:4E8F $21 $00 $C2
    add  hl, de                                   ;; 19:4E92 $19
    ld   [hl], a                                  ;; 19:4E93 $77
    ldh  a, [hMultiPurpose1]                      ;; 19:4E94 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:4E96 $21 $10 $C2
    add  hl, de                                   ;; 19:4E99 $19
    ld   [hl], a                                  ;; 19:4E9A $77
    ld   a, $01                                   ;; 19:4E9B $3E $01
    ld   [wIsRoosterFollowingLink], a             ;; 19:4E9D $EA $7B $DB
    xor  a                                        ;; 19:4EA0 $AF
    ld   [wC167], a                               ;; 19:4EA1 $EA $67 $C1
    call func_019_7F0E                            ;; 19:4EA4 $CD $0E $7F
    jp   ClearEntityStatus_19                     ;; 19:4EA7 $C3 $61 $7E

Data_019_4EAA::
    db   $6A, $06, $6C, $06, $6E, $06

Data_019_4EB0::
    db   $02, $02, $01, $01

Data_019_4EB4::
    db   $04, $04, $04, $04, $04, $04, $04, $04, $05, $06, $07, $08, $07, $06, $05, $04
    db   $04, $04, $03, $02, $01, $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $08
    db   $09, $0A, $0B, $0C, $0C, $0C, $0B, $0A, $09, $08, $07, $06, $05, $04, $05, $06
    db   $07, $08, $09, $0A, $0B, $0B, $0A, $09, $08, $07, $06, $05, $04, $03, $02, $01
    db   $00, $01, $02, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04

Data_019_4F1C::
    db   $00, $03, $06, $07

Data_019_4F20::
    db   $08, $07, $06, $03, $00, $FD, $FA, $F9, $F8, $F9, $FA, $FD, $00, $03, $06, $07

label_019_4F30:
    ldh  a, [hFrameCounter]                       ;; 19:4F30 $F0 $E7
    rla                                           ;; 19:4F32 $17
    rla                                           ;; 19:4F33 $17
    and  OAMF_PAL1                                ;; 19:4F34 $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ;; 19:4F36 $E0 $ED
    ld   de, Data_019_4EAA                        ;; 19:4F38 $11 $AA $4E
    call RenderActiveEntitySprite                 ;; 19:4F3B $CD $77 $3C
    call ReturnIfNonInteractive_19                ;; 19:4F3E $CD $3D $7D
    call GetEntityTransitionCountdown             ;; 19:4F41 $CD $05 $0C
    jr   z, .jr_4F5A                              ;; 19:4F44 $28 $14

    cp   $01                                      ;; 19:4F46 $FE $01
    jp   z, ClearEntityStatus_19                  ;; 19:4F48 $CA $61 $7E

    rra                                           ;; 19:4F4B $1F
    rra                                           ;; 19:4F4C $1F
    rra                                           ;; 19:4F4D $1F
    and  $03                                      ;; 19:4F4E $E6 $03
    ld   e, a                                     ;; 19:4F50 $5F
    ld   d, b                                     ;; 19:4F51 $50
    ld   hl, Data_019_4EB0                        ;; 19:4F52 $21 $B0 $4E
    add  hl, de                                   ;; 19:4F55 $19
    ld   a, [hl]                                  ;; 19:4F56 $7E
    jp   SetEntitySpriteVariant                   ;; 19:4F57 $C3 $0C $3B

.jr_4F5A
    ld   a, $02                                   ;; 19:4F5A $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:4F5C $E0 $A1
    ld   [wC167], a                               ;; 19:4F5E $EA $67 $C1
    ld   hl, wEntitiesInertiaTable                ;; 19:4F61 $21 $D0 $C3
    add  hl, bc                                   ;; 19:4F64 $09
    ld   a, [hl]                                  ;; 19:4F65 $7E
    inc  a                                        ;; 19:4F66 $3C
    ld   [hl], a                                  ;; 19:4F67 $77
    and  $07                                      ;; 19:4F68 $E6 $07
    jr   nz, .jr_4F8F                             ;; 19:4F6A $20 $23

    ld   hl, wEntitiesPrivateState2Table          ;; 19:4F6C $21 $C0 $C2
    add  hl, bc                                   ;; 19:4F6F $09
    inc  [hl]                                     ;; 19:4F70 $34
    ld   a, [hl]                                  ;; 19:4F71 $7E
    cp   $49                                      ;; 19:4F72 $FE $49
    jr   nz, .jr_4F8F                             ;; 19:4F74 $20 $19

    ld   a, [wD201]                               ;; 19:4F76 $FA $01 $D2
    ld   e, a                                     ;; 19:4F79 $5F
    ld   d, b                                     ;; 19:4F7A $50
    ld   hl, wEntitiesStateTable                  ;; 19:4F7B $21 $90 $C2
    add  hl, de                                   ;; 19:4F7E $19
    inc  [hl]                                     ;; 19:4F7F $34
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:4F80 $21 $20 $C4
    add  hl, de                                   ;; 19:4F83 $19
    ld   [hl], $40                                ;; 19:4F84 $36 $40
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:4F86 $21 $E0 $C2
    add  hl, de                                   ;; 19:4F89 $19
    ld   [hl], $80                                ;; 19:4F8A $36 $80
    jp   ClearEntityStatus_19                     ;; 19:4F8C $C3 $61 $7E

.jr_4F8F
    ld   hl, wEntitiesPrivateState2Table          ;; 19:4F8F $21 $C0 $C2
    add  hl, bc                                   ;; 19:4F92 $09
    ld   e, [hl]                                  ;; 19:4F93 $5E
    ld   d, b                                     ;; 19:4F94 $50
    ld   hl, Data_019_4EB4                        ;; 19:4F95 $21 $B4 $4E
    add  hl, de                                   ;; 19:4F98 $19
    ld   e, [hl]                                  ;; 19:4F99 $5E
    ld   hl, Data_019_4F20                        ;; 19:4F9A $21 $20 $4F
    add  hl, de                                   ;; 19:4F9D $19
    ld   a, [hl]                                  ;; 19:4F9E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:4F9F $21 $40 $C2
    add  hl, bc                                   ;; 19:4FA2 $09
    ld   [hl], a                                  ;; 19:4FA3 $77
    ld   hl, Data_019_4F1C                        ;; 19:4FA4 $21 $1C $4F
    add  hl, de                                   ;; 19:4FA7 $19
    ld   a, [hl]                                  ;; 19:4FA8 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:4FA9 $21 $50 $C2
    add  hl, bc                                   ;; 19:4FAC $09
    ld   [hl], a                                  ;; 19:4FAD $77
    call UpdateEntityPosWithSpeed_19              ;; 19:4FAE $CD $B8 $7D
    ld   hl, wEntitiesInertiaTable                ;; 19:4FB1 $21 $D0 $C3
    add  hl, bc                                   ;; 19:4FB4 $09
    ld   a, [hl]                                  ;; 19:4FB5 $7E
    and  $07                                      ;; 19:4FB6 $E6 $07
    jr   nz, .ret_4FDA                            ;; 19:4FB8 $20 $20

    ld   a, ENTITY_FLYING_ROOSTER_EVENTS          ;; 19:4FBA $3E $DC
    call SpawnNewEntity_trampoline                ;; 19:4FBC $CD $86 $3B
    ret  c                                        ;; 19:4FBF $D8

    ldh  a, [hMultiPurpose0]                      ;; 19:4FC0 $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 19:4FC2 $21 $00 $C2
    add  hl, de                                   ;; 19:4FC5 $19
    ld   [hl], a                                  ;; 19:4FC6 $77
    ldh  a, [hMultiPurpose1]                      ;; 19:4FC7 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:4FC9 $21 $10 $C2
    add  hl, de                                   ;; 19:4FCC $19
    ld   [hl], a                                  ;; 19:4FCD $77
    ld   hl, wEntitiesPrivateState1Table          ;; 19:4FCE $21 $B0 $C2
    add  hl, de                                   ;; 19:4FD1 $19
    ld   [hl], $01                                ;; 19:4FD2 $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:4FD4 $21 $E0 $C2
    add  hl, de                                   ;; 19:4FD7 $19
    ld   [hl], $1F                                ;; 19:4FD8 $36 $1F

.ret_4FDA
    ret                                           ;; 19:4FDA $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown065SpriteVariants::
.variant0
    db $60, $00
    db $62, $00
.variant1
    db $64, $00
    db $66, $00
.variant2
    db $62, $20
    db $60, $20
.variant3
    db $66, $20
    db $64, $20
.variant4
    db $68, $00
    db $6A, $00
.variant5
    db $6C, $00
    db $6E, $00
.variant6
    db $6A, $20
    db $68, $20
.variant7
    db $6E, $20
    db $6C, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown066SpriteVariants::
.variant0
    db $70, $03
    db $72, $03
.variant1
    db $74, $03
    db $76, $03
.variant2
    db $72, $23
    db $70, $23
.variant3
    db $76, $23
    db $74, $23

Data_019_500B::
    db   $F2, $0E

func_019_500D::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:500D $21 $40 $C3
    add  hl, bc                                   ;; 19:5010 $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 19:5011 $36 $D2
    ld   de, Unknown065SpriteVariants             ;; 19:5013 $11 $DB $4F
    call RenderActiveEntitySpritesPair            ;; 19:5016 $CD $C0 $3B
    ld   hl, wEntitiesPrivateState3Table          ;; 19:5019 $21 $D0 $C2
    add  hl, bc                                   ;; 19:501C $09
    ld   a, [hl]                                  ;; 19:501D $7E
    and  a                                        ;; 19:501E $A7
    jr   nz, .jr_5027                             ;; 19:501F $20 $06

    inc  [hl]                                     ;; 19:5021 $34
    ld   a, MUSIC_HENHOUSE                        ;; 19:5022 $3E $57
    ld   [wMusicTrackToPlay], a                   ;; 19:5024 $EA $68 $D3

.jr_5027
    ld   a, [wIsRoosterFollowingLink]             ;; 19:5027 $FA $7B $DB
    and  a                                        ;; 19:502A $A7
    jr   nz, .jr_5034                             ;; 19:502B $20 $07

    ld   a, [wHasInstrument7]                     ;; 19:502D $FA $6B $DB
    and  a                                        ;; 19:5030 $A7
    jp   nz, label_019_50C4                       ;; 19:5031 $C2 $C4 $50

.jr_5034
    call ReturnIfNonInteractive_19                ;; 19:5034 $CD $3D $7D
    call PushLinkOutOfEntity_19                   ;; 19:5037 $CD $A2 $7C
    ldh  a, [hFrameCounter]                       ;; 19:503A $F0 $E7
    and  $7F                                      ;; 19:503C $E6 $7F
    jr   nz, .jr_504A                             ;; 19:503E $20 $0A

    call GetRandomByte                            ;; 19:5040 $CD $0D $28
    and  $02                                      ;; 19:5043 $E6 $02
    ld   hl, wEntitiesDirectionTable              ;; 19:5045 $21 $80 $C3
    add  hl, bc                                   ;; 19:5048 $09
    ld   [hl], a                                  ;; 19:5049 $77

.jr_504A
    ldh  a, [hFrameCounter]                       ;; 19:504A $F0 $E7
    ld   e, $00                                   ;; 19:504C $1E $00

.jr_504E
    and  $30                                      ;; 19:504E $E6 $30
    jr   z, .jr_5053                              ;; 19:5050 $28 $01

    inc  e                                        ;; 19:5052 $1C

.jr_5053
    ld   hl, wEntitiesDirectionTable              ;; 19:5053 $21 $80 $C3
    add  hl, bc                                   ;; 19:5056 $09
    ld   a, e                                     ;; 19:5057 $7B
    add  [hl]                                     ;; 19:5058 $86
    call SetEntitySpriteVariant                   ;; 19:5059 $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 19:505C $F0 $E7

.jr_505E
    and  $3F                                      ;; 19:505E $E6 $3F
    cp   $0F                                      ;; 19:5060 $FE $0F
    jr   nz, jr_019_5093                          ;; 19:5062 $20 $2F

    ld   a, ENTITY_MAGIC_POWDER_SPRINKLE          ;; 19:5064 $3E $08
    call SpawnNewEntity_trampoline                ;; 19:5066 $CD $86 $3B
    jr   c, ret_019_5092                          ;; 19:5069 $38 $27

    push bc                                       ;; 19:506B $C5

.jr_506C
    ld   hl, wEntitiesDirectionTable              ;; 19:506C $21 $80 $C3
    add  hl, bc                                   ;; 19:506F $09
    ld   c, [hl]                                  ;; 19:5070 $4E
    srl  c                                        ;; 19:5071 $CB $39
    ld   hl, Data_019_500B                        ;; 19:5073 $21 $0B $50
    add  hl, bc                                   ;; 19:5076 $09
    ldh  a, [hMultiPurpose0]                      ;; 19:5077 $F0 $D7
    add  [hl]                                     ;; 19:5079 $86
    ld   hl, wEntitiesPosXTable                   ;; 19:507A $21 $00 $C2
    add  hl, de                                   ;; 19:507D $19
    ld   [hl], a                                  ;; 19:507E $77
    ldh  a, [hMultiPurpose1]                      ;; 19:507F $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:5081 $21 $10 $C2
    add  hl, de                                   ;; 19:5084 $19
    ld   [hl], a                                  ;; 19:5085 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 19:5086 $21 $E0 $C2
    add  hl, de                                   ;; 19:5089 $19
    ld   [hl], $17                                ;; 19:508A $36 $17
    ld   hl, wEntitiesPrivateState4Table          ;; 19:508C $21 $40 $C4
    add  hl, de                                   ;; 19:508F $19
    inc  [hl]                                     ;; 19:5090 $34
    pop  bc                                       ;; 19:5091 $C1

ret_019_5092:
    ret                                           ;; 19:5092 $C9

jr_019_5093:
    call func_019_7CF0                            ;; 19:5093 $CD $F0 $7C
    ret  nc                                       ;; 19:5096 $D0

    ld   a, [wIsRoosterFollowingLink]             ;; 19:5097 $FA $7B $DB
    and  a                                        ;; 19:509A $A7
    ld_dialog_low a, Dialog18B                    ;; 19:509B $3E $8B
    jr   z, .jr_50A1                              ;; 19:509D $28 $02

    ld_dialog_low a, Dialog18C                    ;; 19:509F $3E $8C

.jr_50A1
    jp   OpenDialogInTable1                       ;; 19:50A1 $C3 $73 $23

Data_019_50A4::
    db   $10, $11, $12, $13, $13, $12, $11, $10

Data_019_50AC::
    db   $00, $09, $02, $09, $00, $F7, $FE, $F7

Data_019_50B4::
    db   $0C, $09, $0A, $F7, $F4, $F7, $F6, $09

Data_019_50BC::
    db   $03, $01, $00, $00, $00, $00, $01, $03

label_019_50C4::
    ldh  a, [hActiveEntityState]
    and  a                                        ;; 19:50C6 $A7
    jr   nz, .jr_50D2                             ;; 19:50C7 $20 $09

    ld   hl, wEntitiesPosYTable                   ;; 19:50C9 $21 $10 $C2
    add  hl, bc                                   ;; 19:50CC $09
    ld   [hl], $50                                ;; 19:50CD $36 $50
    call IncrementEntityState                     ;; 19:50CF $CD $12 $3B

.jr_50D2
    ld   e, $00                                   ;; 19:50D2 $1E $00
    ld   hl, wEntitiesSpeedXTable                 ;; 19:50D4 $21 $40 $C2
    add  hl, bc                                   ;; 19:50D7 $09
    ld   a, [hl]                                  ;; 19:50D8 $7E
    and  $80                                      ;; 19:50D9 $E6 $80
    jr   nz, .jr_50DF                             ;; 19:50DB $20 $02

    ld   e, $02                                   ;; 19:50DD $1E $02

.jr_50DF
    ld   hl, wEntitiesDirectionTable              ;; 19:50DF $21 $80 $C3
    add  hl, bc                                   ;; 19:50E2 $09
    ld   [hl], e                                  ;; 19:50E3 $73
    ldh  a, [hFrameCounter]                       ;; 19:50E4 $F0 $E7
    rra                                           ;; 19:50E6 $1F
    rra                                           ;; 19:50E7 $1F
    rra                                           ;; 19:50E8 $1F
    and  $07                                      ;; 19:50E9 $E6 $07
    ld   e, a                                     ;; 19:50EB $5F
    ld   d, b                                     ;; 19:50EC $50
    ld   hl, Data_019_50A4                        ;; 19:50ED $21 $A4 $50
    add  hl, de                                   ;; 19:50F0 $19
    ld   a, [hl]                                  ;; 19:50F1 $7E
    sub  $03                                      ;; 19:50F2 $D6 $03
    ld   hl, wEntitiesPosZTable                   ;; 19:50F4 $21 $10 $C3
    add  hl, bc                                   ;; 19:50F7 $09
    ld   [hl], a                                  ;; 19:50F8 $77
    ld   hl, wEntitiesDirectionTable              ;; 19:50F9 $21 $80 $C3
    add  hl, bc                                   ;; 19:50FC $09
    ldh  a, [hFrameCounter]                       ;; 19:50FD $F0 $E7
    and  $20                                      ;; 19:50FF $E6 $20
    ld   a, $04                                   ;; 19:5101 $3E $04
    jr   nz, .jr_5107                             ;; 19:5103 $20 $02

    ld   a, $05                                   ;; 19:5105 $3E $05

.jr_5107
    add  [hl]                                     ;; 19:5107 $86
    call SetEntitySpriteVariant                   ;; 19:5108 $CD $0C $3B
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:510B $F0 $EC
    sub  $10                                      ;; 19:510D $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 19:510F $E0 $EC
    ld   hl, wEntitiesDirectionTable              ;; 19:5111 $21 $80 $C3
    add  hl, bc                                   ;; 19:5114 $09
    ldh  a, [hFrameCounter]                       ;; 19:5115 $F0 $E7
    rra                                           ;; 19:5117 $1F
    rra                                           ;; 19:5118 $1F
    and  $01                                      ;; 19:5119 $E6 $01
    add  [hl]                                     ;; 19:511B $86
    ldh  [hActiveEntitySpriteVariant], a          ;; 19:511C $E0 $F1
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 19:511E $21 $40 $C3
    add  hl, bc                                   ;; 19:5121 $09
    res  ENTITY_PHYSICS_B_SHADOW, [hl]            ;; 19:5122 $CB $A6
    ld   de, Unknown066SpriteVariants             ;; 19:5124 $11 $FB $4F
    call RenderActiveEntitySpritesPair            ;; 19:5127 $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ;; 19:512A $CD $8A $3D
    call ReturnIfNonInteractive_19                ;; 19:512D $CD $3D $7D
    ldh  a, [hFrameCounter]                       ;; 19:5130 $F0 $E7
    and  $3F                                      ;; 19:5132 $E6 $3F
    jr   nz, .jr_5158                             ;; 19:5134 $20 $22

    call GetRandomByte                            ;; 19:5136 $CD $0D $28
    and  $01                                      ;; 19:5139 $E6 $01
    jr   nz, .jr_5158                             ;; 19:513B $20 $1B

    call GetRandomByte                            ;; 19:513D $CD $0D $28
    and  $07                                      ;; 19:5140 $E6 $07
    ld   e, a                                     ;; 19:5142 $5F
    ld   d, b                                     ;; 19:5143 $50
    ld   hl, Data_019_50B4                        ;; 19:5144 $21 $B4 $50
    add  hl, de                                   ;; 19:5147 $19
    ld   a, [hl]                                  ;; 19:5148 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:5149 $21 $40 $C2
    add  hl, bc                                   ;; 19:514C $09
    ld   [hl], a                                  ;; 19:514D $77
    ld   hl, Data_019_50AC                        ;; 19:514E $21 $AC $50
    add  hl, de                                   ;; 19:5151 $19
    ld   a, [hl]                                  ;; 19:5152 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5153 $21 $50 $C2
    add  hl, bc                                   ;; 19:5156 $09
    ld   [hl], a                                  ;; 19:5157 $77

.jr_5158
    ldh  a, [hFrameCounter]                       ;; 19:5158 $F0 $E7
    rra                                           ;; 19:515A $1F
    rra                                           ;; 19:515B $1F
    rra                                           ;; 19:515C $1F
    nop                                           ;; 19:515D $00
    nop                                           ;; 19:515E $00
    and  $07                                      ;; 19:515F $E6 $07
    ld   e, a                                     ;; 19:5161 $5F
    ld   d, b                                     ;; 19:5162 $50
    ld   hl, Data_019_50BC                        ;; 19:5163 $21 $BC $50
    add  hl, de                                   ;; 19:5166 $19
    ldh  a, [hFrameCounter]                       ;; 19:5167 $F0 $E7
    and  [hl]                                     ;; 19:5169 $A6
    call z, UpdateEntityPosWithSpeed_19           ;; 19:516A $CC $B8 $7D
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:516D $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ;; 19:5170 $21 $A0 $C2
    add  hl, bc                                   ;; 19:5173 $09
    ld   a, [hl]                                  ;; 19:5174 $7E
    and  $03                                      ;; 19:5175 $E6 $03
    jr   z, .jr_5181                              ;; 19:5177 $28 $08

    ld   hl, wEntitiesSpeedXTable                 ;; 19:5179 $21 $40 $C2
    add  hl, bc                                   ;; 19:517C $09
    ld   a, [hl]                                  ;; 19:517D $7E
    cpl                                           ;; 19:517E $2F
    inc  a                                        ;; 19:517F $3C
    ld   [hl], a                                  ;; 19:5180 $77

.jr_5181
    ld   hl, wEntitiesCollisionsTable             ;; 19:5181 $21 $A0 $C2
    add  hl, bc                                   ;; 19:5184 $09
    ld   a, [hl]                                  ;; 19:5185 $7E
    and  $0C                                      ;; 19:5186 $E6 $0C
    jr   z, .jr_5192                              ;; 19:5188 $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 19:518A $21 $50 $C2
    add  hl, bc                                   ;; 19:518D $09
    ld   a, [hl]                                  ;; 19:518E $7E
    cpl                                           ;; 19:518F $2F
    inc  a                                        ;; 19:5190 $3C
    ld   [hl], a                                  ;; 19:5191 $77

.jr_5192
    call EntityLinkPositionXDifference_19         ;; 19:5192 $CD $0B $7E
    add  $12                                      ;; 19:5195 $C6 $12
    cp   $24                                      ;; 19:5197 $FE $24
    ret  nc                                       ;; 19:5199 $D0

    call EntityLinkPositionYDifference_19         ;; 19:519A $CD $1B $7E
    add  $10                                      ;; 19:519D $C6 $10
    cp   $20                                      ;; 19:519F $FE $20
    ret  nc                                       ;; 19:51A1 $D0

    call GetEntityTransitionCountdown             ;; 19:51A2 $CD $05 $0C
    ret  nz                                       ;; 19:51A5 $C0

    ld   [hl], $80                                ;; 19:51A6 $36 $80
    jp_open_dialog Dialog18D                      ;; 19:51A8

Data_019_51AD::
    db   $F0, $00, $78, $07, $F0, $08, $7A, $07, $00, $00, $7C, $07, $00, $08, $7E, $07

FlyingRoosterEventsEntityHandler::
    ld   a, [wIsIndoor]                           ;; 19:51BD $FA $A5 $DB
    and  a                                        ;; 19:51C0 $A7
    jr   z, .jr_51D2                              ;; 19:51C1 $28 $0F

    ldh  a, [hMapRoom]                            ;; 19:51C3 $F0 $F6
    cp   UNKNOWN_ROOM_E4                          ;; 19:51C5 $FE $E4
    jp   z, label_019_4D9B                        ;; 19:51C7 $CA $9B $4D

    cp   UNKNOWN_ROOM_F4                          ;; 19:51CA $FE $F4
    jp   z, label_019_4D9B                        ;; 19:51CC $CA $9B $4D

    jp   func_019_500D                            ;; 19:51CF $C3 $0D $50

.jr_51D2
    ldh  a, [hRoomStatus]                         ;; 19:51D2 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 19:51D4 $E6 $20
    jp   nz, ClearEntityStatus_19                 ;; 19:51D6 $C2 $61 $7E

    ldh  a, [hActiveEntityState]                  ;; 19:51D9 $F0 $F0
    JP_TABLE                                      ;; 19:51DB
._00 dw FlyingRoosterState0Handler
._01 dw FlyingRoosterState1Handler

FlyingRoosterState0Handler::
    call ReturnIfNonInteractive_19                ;; 19:51E0 $CD $3D $7D
    ld   a, [wPowerBraceletLevel]                 ;; 19:51E3 $FA $43 $DB
    cp   $02                                      ;; 19:51E6 $FE $02
    ret  c                                        ;; 19:51E8 $D8

    call EntityLinkPositionXDifference_19         ;; 19:51E9 $CD $0B $7E
    add  $08                                      ;; 19:51EC $C6 $08
    cp   $10                                      ;; 19:51EE $FE $10
    jp   nc, label_019_52AB                       ;; 19:51F0 $D2 $AB $52

    call EntityLinkPositionYDifference_19         ;; 19:51F3 $CD $1B $7E
    add  $10                                      ;; 19:51F6 $C6 $10
    cp   $20                                      ;; 19:51F8 $FE $20
    jp   nc, label_019_52AB                       ;; 19:51FA $D2 $AB $52

    ld   a, [wCollisionType]                      ;; 19:51FD $FA $33 $C1
    and  a                                        ;; 19:5200 $A7
    jp   z, label_019_52AB                        ;; 19:5201 $CA $AB $52

    ldh  a, [hLinkDirection]                      ;; 19:5204 $F0 $9E
    cp   $02                                      ;; 19:5206 $FE $02
    jp   nz, label_019_52AB                       ;; 19:5208 $C2 $AB $52

    ld   hl, wEntitiesInertiaTable                ;; 19:520B $21 $D0 $C3
    add  hl, bc                                   ;; 19:520E $09
    ld   a, [hl]                                  ;; 19:520F $7E
    inc  a                                        ;; 19:5210 $3C
    ld   [hl], a                                  ;; 19:5211 $77
    cp   $18                                      ;; 19:5212 $FE $18
    ret  nz                                       ;; 19:5214 $C0

    call GetEntityTransitionCountdown             ;; 19:5215 $CD $05 $0C
    ld   [hl], $40                                ;; 19:5218 $36 $40
    ld   hl, wRoomObjects + $35                   ;; 19:521A $21 $46 $D7
    ld   [hl], $0C                                ;; 19:521D $36 $0C
    ld   hl, wRoomObjects + $45                   ;; 19:521F $21 $56 $D7
    ld   [hl], $C6                                ;; 19:5222 $36 $C6
    ld   a, $99                                   ;; 19:5224 $3E $99
    call BackupObjectInRAM2                       ;; 19:5226 $CD $2F $0B
    ld   a, $50                                   ;; 19:5229 $3E $50
    ldh  [hIntersectedObjectLeft], a              ;; 19:522B $E0 $CE
    ld   a, $30                                   ;; 19:522D $3E $30
    ldh  [hIntersectedObjectTop], a               ;; 19:522F $E0 $CD
    call label_2887                               ;; 19:5231 $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 19:5234 $F0 $FE
    and  a                                        ;; 19:5236 $A7
    jr   z, .jr_5267                              ;; 19:5237 $28 $2E

    push bc                                       ;; 19:5239 $C5
    ld   a, $0C                                   ;; 19:523A $3E $0C
    ld   [wDDD8], a                               ;; 19:523C $EA $D8 $DD
    ld   a, $19                                   ;; 19:523F $3E $19
    call func_91D                                 ;; 19:5241 $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:5244 $F0 $CF
    ld   h, a                                     ;; 19:5246 $67
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:5247 $F0 $D0
    ld   l, a                                     ;; 19:5249 $6F
    push hl                                       ;; 19:524A $E5
    ld   de, $40                                  ;; 19:524B $11 $40 $00
    add  hl, de                                   ;; 19:524E $19
    ld   a, h                                     ;; 19:524F $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:5250 $E0 $CF
    ld   a, l                                     ;; 19:5252 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:5253 $E0 $D0
    ld   a, $C6                                   ;; 19:5255 $3E $C6
    ld   [wDDD8], a                               ;; 19:5257 $EA $D8 $DD
    ld   a, $19                                   ;; 19:525A $3E $19
    call func_91D                                 ;; 19:525C $CD $1D $09
    pop  hl                                       ;; 19:525F $E1
    ld   a, h                                     ;; 19:5260 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:5261 $E0 $CF
    ld   a, l                                     ;; 19:5263 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:5264 $E0 $D0
    pop  bc                                       ;; 19:5266 $C1

.jr_5267
    ld   hl, wDrawCommand                         ;; 19:5267 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 19:526A $FA $00 $D6
    ld   e, a                                     ;; 19:526D $5F
    add  $0E                                      ;; 19:526E $C6 $0E
    ld   [wDrawCommandsSize], a                   ;; 19:5270 $EA $00 $D6
    ld   d, $00                                   ;; 19:5273 $16 $00
    add  hl, de                                   ;; 19:5275 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:5276 $F0 $CF
    ld   [hl+], a                                 ;; 19:5278 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:5279 $F0 $D0
    ld   [hl+], a                                 ;; 19:527B $22
    ld   a, $83                                   ;; 19:527C $3E $83
    ld   [hl+], a                                 ;; 19:527E $22
    ld   a, $0F                                   ;; 19:527F $3E $0F
    ld   [hl+], a                                 ;; 19:5281 $22
    ld   a, $0F                                   ;; 19:5282 $3E $0F
    ld   [hl+], a                                 ;; 19:5284 $22
    ld   a, $68                                   ;; 19:5285 $3E $68
    ld   [hl+], a                                 ;; 19:5287 $22
    ld   a, $77                                   ;; 19:5288 $3E $77
    ld   [hl+], a                                 ;; 19:528A $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:528B $F0 $CF
    ld   [hl+], a                                 ;; 19:528D $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:528E $F0 $D0
    inc  a                                        ;; 19:5290 $3C
    ld   [hl+], a                                 ;; 19:5291 $22
    ld   a, $83                                   ;; 19:5292 $3E $83
    ld   [hl+], a                                 ;; 19:5294 $22
    ld   a, $0F                                   ;; 19:5295 $3E $0F
    ld   [hl+], a                                 ;; 19:5297 $22
    ld   a, $0F                                   ;; 19:5298 $3E $0F
    ld   [hl+], a                                 ;; 19:529A $22
    ld   a, $69                                   ;; 19:529B $3E $69
    ld   [hl+], a                                 ;; 19:529D $22
    ld   a, $4B                                   ;; 19:529E $3E $4B
    ld   [hl+], a                                 ;; 19:52A0 $22
    ld   [hl], b                                  ;; 19:52A1 $70
    ld   a, NOISE_SFX_RUMBLE                      ;; 19:52A2 $3E $11
    ldh  [hNoiseSfx], a                           ;; 19:52A4 $E0 $F4
    call IncrementEntityState                     ;; 19:52A6 $CD $12 $3B
    jr   FlyingRoosterState1Handler               ;; 19:52A9 $18 $06

label_019_52AB:
    ld   hl, wEntitiesInertiaTable                ;; 19:52AB $21 $D0 $C3
    add  hl, bc                                   ;; 19:52AE $09
    ld   [hl], b                                  ;; 19:52AF $70
    ret                                           ;; 19:52B0 $C9

FlyingRoosterState1Handler::
    call ReturnIfNonInteractive_19                ;; 19:52B1 $CD $3D $7D
    ld   a, $02                                   ;; 19:52B4 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:52B6 $E0 $A1
    ld   [wC167], a                               ;; 19:52B8 $EA $67 $C1
    ld   hl, Data_019_51AD                        ;; 19:52BB $21 $AD $51
    ld   c, $04                                   ;; 19:52BE $0E $04
    call RenderActiveEntitySpritesRect            ;; 19:52C0 $CD $E6 $3C
    call GetEntityTransitionCountdown             ;; 19:52C3 $CD $05 $0C
    jp   nz, label_019_5363                       ;; 19:52C6 $C2 $63 $53

    ld   [wC167], a                               ;; 19:52C9 $EA $67 $C1
    ld   hl, wRoomObjects + $25                   ;; 19:52CC $21 $36 $D7
    ld   [hl], $91                                ;; 19:52CF $36 $91
    ld   a, $99                                   ;; 19:52D1 $3E $99
    call BackupObjectInRAM2                       ;; 19:52D3 $CD $2F $0B
    ld   hl, wRoomObjects + $35                   ;; 19:52D6 $21 $46 $D7
    ld   [hl], $5E                                ;; 19:52D9 $36 $5E
    ld   a, $99                                   ;; 19:52DB $3E $99
    call BackupObjectInRAM2                       ;; 19:52DD $CD $2F $0B
    ld   a, $50                                   ;; 19:52E0 $3E $50
    ldh  [hIntersectedObjectLeft], a              ;; 19:52E2 $E0 $CE
    ld   a, $20                                   ;; 19:52E4 $3E $20
    ldh  [hIntersectedObjectTop], a               ;; 19:52E6 $E0 $CD
    call label_2887                               ;; 19:52E8 $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 19:52EB $F0 $FE
    and  a                                        ;; 19:52ED $A7
    jr   z, .jr_531E                              ;; 19:52EE $28 $2E

    push bc                                       ;; 19:52F0 $C5
    ld   a, $91                                   ;; 19:52F1 $3E $91
    ld   [wDDD8], a                               ;; 19:52F3 $EA $D8 $DD
    ld   a, $19                                   ;; 19:52F6 $3E $19
    call func_91D                                 ;; 19:52F8 $CD $1D $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:52FB $F0 $CF
    ld   h, a                                     ;; 19:52FD $67
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:52FE $F0 $D0
    ld   l, a                                     ;; 19:5300 $6F
    push hl                                       ;; 19:5301 $E5
    ld   de, $40                                  ;; 19:5302 $11 $40 $00
    add  hl, de                                   ;; 19:5305 $19
    ld   a, h                                     ;; 19:5306 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:5307 $E0 $CF
    ld   a, l                                     ;; 19:5309 $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:530A $E0 $D0
    ld   a, $5E                                   ;; 19:530C $3E $5E
    ld   [wDDD8], a                               ;; 19:530E $EA $D8 $DD
    ld   a, $19                                   ;; 19:5311 $3E $19
    call func_91D                                 ;; 19:5313 $CD $1D $09
    pop  hl                                       ;; 19:5316 $E1
    ld   a, h                                     ;; 19:5317 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 19:5318 $E0 $CF
    ld   a, l                                     ;; 19:531A $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 19:531B $E0 $D0
    pop  bc                                       ;; 19:531D $C1

.jr_531E
    ld   hl, wDrawCommand                         ;; 19:531E $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 19:5321 $FA $00 $D6
    ld   e, a                                     ;; 19:5324 $5F
    add  $0E                                      ;; 19:5325 $C6 $0E
    ld   [wDrawCommandsSize], a                   ;; 19:5327 $EA $00 $D6
    ld   d, $00                                   ;; 19:532A $16 $00
    add  hl, de                                   ;; 19:532C $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:532D $F0 $CF
    ld   [hl+], a                                 ;; 19:532F $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:5330 $F0 $D0
    ld   [hl+], a                                 ;; 19:5332 $22
    ld   a, $83                                   ;; 19:5333 $3E $83
    ld   [hl+], a                                 ;; 19:5335 $22
    ld   a, $00                                   ;; 19:5336 $3E $00
    ld   [hl+], a                                 ;; 19:5338 $22
    ld   a, $10                                   ;; 19:5339 $3E $10
    ld   [hl+], a                                 ;; 19:533B $22
    ld   a, $02                                   ;; 19:533C $3E $02
    ld   [hl+], a                                 ;; 19:533E $22
    ld   a, $12                                   ;; 19:533F $3E $12
    ld   [hl+], a                                 ;; 19:5341 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 19:5342 $F0 $CF
    ld   [hl+], a                                 ;; 19:5344 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 19:5345 $F0 $D0
    inc  a                                        ;; 19:5347 $3C
    ld   [hl+], a                                 ;; 19:5348 $22
    ld   a, $83                                   ;; 19:5349 $3E $83
    ld   [hl+], a                                 ;; 19:534B $22
    ld   a, $6C                                   ;; 19:534C $3E $6C
    ld   [hl+], a                                 ;; 19:534E $22
    ld   a, $6D                                   ;; 19:534F $3E $6D
    ld   [hl+], a                                 ;; 19:5351 $22
    ld   a, $03                                   ;; 19:5352 $3E $03
    ld   [hl+], a                                 ;; 19:5354 $22
    ld   a, $13                                   ;; 19:5355 $3E $13
    ld   [hl+], a                                 ;; 19:5357 $22
    ld   [hl], b                                  ;; 19:5358 $70
    ld   a, JINGLE_DUNGEON_OPENED                 ;; 19:5359 $3E $23
    ldh  [hJingle], a                             ;; 19:535B $E0 $F2
    call func_019_7F0E                            ;; 19:535D $CD $0E $7F
    jp   ClearEntityStatus_19                     ;; 19:5360 $C3 $61 $7E

label_019_5363:
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5363 $21 $50 $C2
    add  hl, bc                                   ;; 19:5366 $09
    ld   [hl], $FC                                ;; 19:5367 $36 $FC
    jp   UpdateEntityYPosWithSpeed_19             ;; 19:5369 $C3 $BB $7D

