; Note: this entity, unlike most others, use 3 spriteslots (instead of 2).
;
; Normally only 2 spriteslots can be loaded on a map transition, but this one
; has the small slimes "preloaded" so it only needs to load 2 (for the big eye)
; when entering the boss room.
Data_004_496B::
    db   $EE, $12

Data_004_496D::
    db   $F8, $08

label_004_496F:
    xor  a                                        ;; 04:496F $AF
    ldh  [hMultiPurposeG], a                      ;; 04:4970 $E0 $E8

.loop
    ld   a, ENTITY_SLIME_EYE                      ;; 04:4972 $3E $5B
    call SpawnNewEntity_trampoline                ;; 04:4974 $CD $86 $3B
    ld   hl, wEntitiesPrivateState5Table          ;; 04:4977 $21 $90 $C3
    add  hl, de                                   ;; 04:497A $19
    ld   [hl], $01                                ;; 04:497B $36 $01
    push bc                                       ;; 04:497D $C5
    ldh  a, [hMultiPurposeG]                      ;; 04:497E $F0 $E8
    ld   c, a                                     ;; 04:4980 $4F
    ld   hl, Data_004_496B                        ;; 04:4981 $21 $6B $49
    add  hl, bc                                   ;; 04:4984 $09
    ldh  a, [hMultiPurpose0]                      ;; 04:4985 $F0 $D7
    add  [hl]                                     ;; 04:4987 $86
    ld   hl, wEntitiesPosXTable                   ;; 04:4988 $21 $00 $C2
    add  hl, de                                   ;; 04:498B $19
    ld   [hl], a                                  ;; 04:498C $77
    ld   hl, Data_004_496D                        ;; 04:498D $21 $6D $49
    add  hl, bc                                   ;; 04:4990 $09
    ld   a, [hl]                                  ;; 04:4991 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:4992 $21 $40 $C2
    add  hl, de                                   ;; 04:4995 $19
    ld   [hl], a                                  ;; 04:4996 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4997 $21 $20 $C3
    add  hl, de                                   ;; 04:499A $19
    ld   [hl], $10                                ;; 04:499B $36 $10
    ld   hl, wEntitiesStateTable                  ;; 04:499D $21 $90 $C2
    add  hl, de                                   ;; 04:49A0 $19
    ld   [hl], $01                                ;; 04:49A1 $36 $01
    ldh  a, [hMultiPurpose1]                      ;; 04:49A3 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 04:49A5 $21 $10 $C2
    add  hl, de                                   ;; 04:49A8 $19
    ld   [hl], a                                  ;; 04:49A9 $77
    ld   hl, wEntitiesHealthTable                 ;; 04:49AA $21 $60 $C3
    add  hl, de                                   ;; 04:49AD $19
    ld   [hl], $05                                ;; 04:49AE $36 $05
    pop  bc                                       ;; 04:49B0 $C1
    ldh  a, [hMultiPurposeG]                      ;; 04:49B1 $F0 $E8
    inc  a                                        ;; 04:49B3 $3C
    ldh  [hMultiPurposeG], a                      ;; 04:49B4 $E0 $E8
    cp   $02                                      ;; 04:49B6 $FE $02
    jr   nz, .loop                                ;; 04:49B8 $20 $B8

    jp   ClearEntityStatusBank04                  ;; 04:49BA $C3 $7A $6D

EntityInitSlimeEye::
    ld   hl, wEntitiesPosZTable                   ;; 04:49BD $21 $10 $C3
    add  hl, bc                                   ;; 04:49C0 $09
    ld   [hl], $7E                                ;; 04:49C1 $36 $7E
    call GetEntityTransitionCountdown             ;; 04:49C3 $CD $05 $0C
    ld   [hl], $A0                                ;; 04:49C6 $36 $A0
    ret                                           ;; 04:49C8 $C9

SlimeEyeEntityHandler::
    call label_394D                               ;; 04:49C9 $CD $4D $39
    call BossIntro                                ;; 04:49CC $CD $E8 $3E
    call func_004_4E52                            ;; 04:49CF $CD $52 $4E
    ld   hl, wEntitiesPrivateState5Table          ;; 04:49D2 $21 $90 $C3
    add  hl, bc                                   ;; 04:49D5 $09
    ld   a, [hl]                                  ;; 04:49D6 $7E
    JP_TABLE                                      ;; 04:49D7 $C7
._00 dw func_004_49DC                             ;; 04:49D8
._01 dw func_004_4DFB                             ;; 04:49DA

func_004_49DC::
    ld   hl, wEntitiesHealthTable                 ;; 04:49DC $21 $60 $C3
    add  hl, bc                                   ;; 04:49DF $09
    ld   [hl], $50                                ;; 04:49E0 $36 $50
    ldh  a, [hActiveEntityState]                  ;; 04:49E2 $F0 $F0
    JP_TABLE                                      ;; 04:49E4 $C7
._00 dw SlimeEyeState0Handler                     ;; 04:49E5
._01 dw SlimeEyeState1Handler                     ;; 04:49E7
._02 dw SlimeEyeState2Handler                     ;; 04:49E9
._03 dw SlimeEyeState3Handler                     ;; 04:49EB

SlimeEyeState0Handler::
    ld   a, [wScreenShakeCountdown]               ;; 04:49ED $FA $57 $C1
    cp   $05                                      ;; 04:49F0 $FE $05
    jr   nz, .jr_49FB                             ;; 04:49F2 $20 $07

    call IncrementEntityState                     ;; 04:49F4 $CD $12 $3B
    ld   a, JINGLE_FALL_DOWN                      ;; 04:49F7 $3E $08
    ldh  [hJingle], a                             ;; 04:49F9 $E0 $F2

.jr_49FB
    call GetEntityTransitionCountdown             ;; 04:49FB $CD $05 $0C
    jr   nz, .ret_4A2C                            ;; 04:49FE $20 $2C

    ld   [hl], $50                                ;; 04:4A00 $36 $50
    ld   a, [wZolCount]                           ;; 04:4A02 $FA $AE $C1
    cp   $02                                      ;; 04:4A05 $FE $02
    jr   nc, .ret_4A2C                            ;; 04:4A07 $30 $23

    ld   a, ENTITY_ZOL                            ;; 04:4A09 $3E $1B
    call SpawnNewEntity_trampoline                ;; 04:4A0B $CD $86 $3B
    call GetRandomByte                            ;; 04:4A0E $CD $0D $28
    and  $3F                                      ;; 04:4A11 $E6 $3F
    add  $40                                      ;; 04:4A13 $C6 $40
    ld   hl, wEntitiesPosXTable                   ;; 04:4A15 $21 $00 $C2
    add  hl, de                                   ;; 04:4A18 $19
    ld   [hl], a                                  ;; 04:4A19 $77
    call GetRandomByte                            ;; 04:4A1A $CD $0D $28
    and  $3F                                      ;; 04:4A1D $E6 $3F
    add  $30                                      ;; 04:4A1F $C6 $30
    ld   hl, wEntitiesPosYTable                   ;; 04:4A21 $21 $10 $C2
    add  hl, de                                   ;; 04:4A24 $19
    ld   [hl], a                                  ;; 04:4A25 $77
    ld   hl, wEntitiesPosZTable                   ;; 04:4A26 $21 $10 $C3
    add  hl, de                                   ;; 04:4A29 $19
    ld   [hl], $70                                ;; 04:4A2A $36 $70

.ret_4A2C
    ret                                           ;; 04:4A2C $C9

SlimeEyeState1Handler::
    call func_004_4DB5                            ;; 04:4A2D $CD $B5 $4D
    call ReturnIfNonInteractive_04                ;; 04:4A30 $CD $A3 $7F
    call AddEntityZSpeedToPos_04                  ;; 04:4A33 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4A36 $21 $20 $C3
    add  hl, bc                                   ;; 04:4A39 $09
    ld   a, [hl]                                  ;; 04:4A3A $7E
    cp   $A0                                      ;; 04:4A3B $FE $A0
    jr   z, .jr_4A41                              ;; 04:4A3D $28 $02

    dec  [hl]                                     ;; 04:4A3F $35
    dec  [hl]                                     ;; 04:4A40 $35

.jr_4A41
    ld   hl, wEntitiesPosZTable                   ;; 04:4A41 $21 $10 $C3
    add  hl, bc                                   ;; 04:4A44 $09
    ld   a, [hl]                                  ;; 04:4A45 $7E
    and  $80                                      ;; 04:4A46 $E6 $80
    ret  z                                        ;; 04:4A48 $C8

    ld   [hl], b                                  ;; 04:4A49 $70
    ld   a, $50                                   ;; 04:4A4A $3E $50
    ld   [wScreenShakeCountdown], a               ;; 04:4A4C $EA $57 $C1
    ld   a, $04                                   ;; 04:4A4F $3E $04
    ld   [wC158], a                               ;; 04:4A51 $EA $58 $C1
    call GetEntityTransitionCountdown             ;; 04:4A54 $CD $05 $0C
    ld   [hl], $40                                ;; 04:4A57 $36 $40
    call PlayBombExplosionSfx                     ;; 04:4A59 $CD $4B $0C
    ld   a, [wIsLinkInTheAir]                     ;; 04:4A5C $FA $46 $C1
    and  a                                        ;; 04:4A5F $A7
    jr   nz, .jr_4A67                             ;; 04:4A60 $20 $05

    call GetEntitySlowTransitionCountdown         ;; 04:4A62 $CD $FB $0B
    ld   [hl], $14                                ;; 04:4A65 $36 $14

.jr_4A67
    jp   IncrementEntityState                     ;; 04:4A67 $C3 $12 $3B

SlimeEyeState2Handler::
    call func_004_4DB5                            ;; 04:4A6A $CD $B5 $4D
    call ReturnIfNonInteractive_04                ;; 04:4A6D $CD $A3 $7F
    call GetEntityTransitionCountdown             ;; 04:4A70 $CD $05 $0C
    jr   nz, .jr_4A78                             ;; 04:4A73 $20 $03

    call IncrementEntityState                     ;; 04:4A75 $CD $12 $3B

.jr_4A78
    call func_004_4B2E                            ;; 04:4A78 $CD $2E $4B
    jp   label_3B44                               ;; 04:4A7B $C3 $44 $3B

SlimeEyeState3Handler::
    call func_004_4DB5                            ;; 04:4A7E $CD $B5 $4D
    call ReturnIfNonInteractive_04                ;; 04:4A81 $CD $A3 $7F
    call DecrementEntityIgnoreHitsCountdown       ;; 04:4A84 $CD $56 $0C
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:4A87 $21 $00 $C3
    add  hl, bc                                   ;; 04:4A8A $09
    ld   a, [hl]                                  ;; 04:4A8B $7E
    and  a                                        ;; 04:4A8C $A7
    jr   z, jr_004_4AA5                           ;; 04:4A8D $28 $16

    cp   $01                                      ;; 04:4A8F $FE $01
    jp   z, label_004_496F                        ;; 04:4A91 $CA $6F $49

    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:4A94 $E0 $A1
    ldh  a, [hFrameCounter]                       ;; 04:4A96 $F0 $E7
    and  $01                                      ;; 04:4A98 $E6 $01
    jr   nz, .jr_4AA0                             ;; 04:4A9A $20 $04

    ld   hl, hLinkPositionY                       ;; 04:4A9C $21 $99 $FF
    dec  [hl]                                     ;; 04:4A9F $35

.jr_4AA0
    ld   a, $06                                   ;; 04:4AA0 $3E $06
    jp   SetEntitySpriteVariant                   ;; 04:4AA2 $C3 $0C $3B

jr_004_4AA5:
    call func_004_4B52                            ;; 04:4AA5 $CD $52 $4B
    ldh  a, [hFrameCounter]                       ;; 04:4AA8 $F0 $E7
    rra                                           ;; 04:4AAA $1F
    rra                                           ;; 04:4AAB $1F
    rra                                           ;; 04:4AAC $1F
    rra                                           ;; 04:4AAD $1F
    and  $01                                      ;; 04:4AAE $E6 $01
    call SetEntitySpriteVariant                   ;; 04:4AB0 $CD $0C $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4AB3 $21 $B0 $C2
    add  hl, bc                                   ;; 04:4AB6 $09
    ld   a, [hl]                                  ;; 04:4AB7 $7E
    and  a                                        ;; 04:4AB8 $A7
    jr   z, .jr_4ACB                              ;; 04:4AB9 $28 $10

    inc  a                                        ;; 04:4ABB $3C
    call SetEntitySpriteVariant                   ;; 04:4ABC $CD $0C $3B
    call GetEntityPrivateCountdown1               ;; 04:4ABF $CD $00 $0C
    jr   nz, .jr_4ACB                             ;; 04:4AC2 $20 $07

    ld   [hl], $28                                ;; 04:4AC4 $36 $28
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4AC6 $21 $B0 $C2
    add  hl, bc                                   ;; 04:4AC9 $09
    dec  [hl]                                     ;; 04:4ACA $35

.jr_4ACB
    xor  a                                        ;; 04:4ACB $AF
    ldh  [hMultiPurposeG], a                      ;; 04:4ACC $E0 $E8
    ld   a, $14                                   ;; 04:4ACE $3E $14
    call func_004_4B37                            ;; 04:4AD0 $CD $37 $4B
    call label_3B70                               ;; 04:4AD3 $CD $70 $3B
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:4AD6 $21 $20 $C4
    add  hl, bc                                   ;; 04:4AD9 $09
    ld   a, [hl]                                  ;; 04:4ADA $7E
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 04:4ADB $21 $00 $C3
    add  hl, bc                                   ;; 04:4ADE $09
    or   [hl]                                     ;; 04:4ADF $B6
    jr   nz, .jr_4AEF                             ;; 04:4AE0 $20 $0D

    call func_004_4B2E                            ;; 04:4AE2 $CD $2E $4B
    call label_3B44                               ;; 04:4AE5 $CD $44 $3B
    ld   a, $01                                   ;; 04:4AE8 $3E $01
    ldh  [hMultiPurposeG], a                      ;; 04:4AEA $E0 $E8
    call label_3B70                               ;; 04:4AEC $CD $70 $3B

.jr_4AEF
    ld   a, $14                                   ;; 04:4AEF $3E $14
    call func_004_4B37                            ;; 04:4AF1 $CD $37 $4B
    ld   hl, wEntitiesFlashCountdownTable         ;; 04:4AF4 $21 $20 $C4
    add  hl, bc                                   ;; 04:4AF7 $09
    ld   a, [hl]                                  ;; 04:4AF8 $7E
    and  a                                        ;; 04:4AF9 $A7
    jr   z, .ret_4B11                             ;; 04:4AFA $28 $15

    ldh  a, [hFrameCounter]                       ;; 04:4AFC $F0 $E7
    and  $1F                                      ;; 04:4AFE $E6 $1F
    jr   nz, .ret_4B11                            ;; 04:4B00 $20 $0F

    call GetEntityPrivateCountdown1               ;; 04:4B02 $CD $00 $0C
    ld   [hl], $50                                ;; 04:4B05 $36 $50
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4B07 $21 $B0 $C2
    add  hl, bc                                   ;; 04:4B0A $09
    ld   a, [hl]                                  ;; 04:4B0B $7E
    cp   $04                                      ;; 04:4B0C $FE $04
    jr   z, .ret_4B11                             ;; 04:4B0E $28 $01

    inc  [hl]                                     ;; 04:4B10 $34

.ret_4B11
    ret                                           ;; 04:4B11 $C9

Data_004_4B12::
  db   $08, $14, $00, $0C, $08, $15, $00, $0B     ;; 04:4B12
  db   $08, $16, $00, $08, $08, $17, $00, $06     ;; 04:4B1A
  db   $08, $18, $00, $04, $08, $03, $08, $03     ;; 04:4B22
  db   $08, $0C, $02, $0C                         ;; 04:4B2A

func_004_4B2E::
    ld   hl, wEntitiesPrivateState1Table          ;; 04:4B2E $21 $B0 $C2
    add  hl, bc                                   ;; 04:4B31 $09
    ld   a, [hl]                                  ;; 04:4B32 $7E
    sla  a                                        ;; 04:4B33 $CB $27
    sla  a                                        ;; 04:4B35 $CB $27

func_004_4B37::
    ld   e, a                                     ;; 04:4B37 $5F
    ld   d, b                                     ;; 04:4B38 $50
    ld   hl, Data_004_4B12                        ;; 04:4B39 $21 $12 $4B
    add  hl, de                                   ;; 04:4B3C $19
    ld   e, l                                     ;; 04:4B3D $5D
    ld   d, h                                     ;; 04:4B3E $54
    push bc                                       ;; 04:4B3F $C5
    sla  c                                        ;; 04:4B40 $CB $21
    sla  c                                        ;; 04:4B42 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 04:4B44 $21 $80 $D5
    add  hl, bc                                   ;; 04:4B47 $09
    ld   c, $04                                   ;; 04:4B48 $0E $04

.loop_4B4A
    ld   a, [de]                                  ;; 04:4B4A $1A
    inc  de                                       ;; 04:4B4B $13
    ld   [hl+], a                                 ;; 04:4B4C $22
    dec  c                                        ;; 04:4B4D $0D
    jr   nz, .loop_4B4A                           ;; 04:4B4E $20 $FA

    pop  bc                                       ;; 04:4B50 $C1
    ret                                           ;; 04:4B51 $C9

func_004_4B52::
    ld   hl, wEntitiesPrivateState3Table          ;; 04:4B52 $21 $D0 $C2
    add  hl, bc                                   ;; 04:4B55 $09
    ld   a, [hl]                                  ;; 04:4B56 $7E
    JP_TABLE                                      ;; 04:4B57 $C7
dw func_004_4B7C
dw func_004_4BC7

Data_004_4B5C::
    db   $10, $0C
    db   $06, $02
    db   $F0, $F4
    db   $FA, $FE
    db   $10, $0C
    db   $06, $02
    db   $F0, $F4
    db   $FA, $FE

Data_004_4B6C::
    db   $02, $06
    db   $0C, $10
    db   $02, $06
    db   $0C, $10
    db   $FE, $FA
    db   $F4, $F0
    db   $FE, $FA
    db   $F4, $F0

func_004_4B7C::
    call GetEntityTransitionCountdown             ;; 04:4B7C $CD $05 $0C
    and  a                                        ;; 04:4B7F $A7
    jr   nz, ret_004_4BC6                         ;; 04:4B80 $20 $44

    call GetRandomByte                            ;; 04:4B82 $CD $0D $28
    and  $1F                                      ;; 04:4B85 $E6 $1F
    add  $10                                      ;; 04:4B87 $C6 $10
    ld   [hl], a                                  ;; 04:4B89 $77
    ld   hl, wEntitiesPrivateState3Table          ;; 04:4B8A $21 $D0 $C2
    add  hl, bc                                   ;; 04:4B8D $09
    inc  [hl]                                     ;; 04:4B8E $34
    ld   e, $00                                   ;; 04:4B8F $1E $00
    ldh  a, [hActiveEntityPosX]                   ;; 04:4B91 $F0 $EE
    cp   $50                                      ;; 04:4B93 $FE $50
    jr   c, .jr_4B98                              ;; 04:4B95 $38 $01

    inc  e                                        ;; 04:4B97 $1C

.jr_4B98
    ld   d, $00                                   ;; 04:4B98 $16 $00
    ldh  a, [hActiveEntityVisualPosY]             ;; 04:4B9A $F0 $EC
    cp   $48                                      ;; 04:4B9C $FE $48
    jr   c, .jr_4BA2                              ;; 04:4B9E $38 $02

    inc  d                                        ;; 04:4BA0 $14
    inc  d                                        ;; 04:4BA1 $14

.jr_4BA2
    ld   a, d                                     ;; 04:4BA2 $7A
    or   e                                        ;; 04:4BA3 $B3
    sla  a                                        ;; 04:4BA4 $CB $27
    sla  a                                        ;; 04:4BA6 $CB $27
    push af                                       ;; 04:4BA8 $F5
    call GetRandomByte                            ;; 04:4BA9 $CD $0D $28
    and  $03                                      ;; 04:4BAC $E6 $03
    pop  de                                       ;; 04:4BAE $D1
    or   d                                        ;; 04:4BAF $B2
    ld   e, a                                     ;; 04:4BB0 $5F
    ld   d, b                                     ;; 04:4BB1 $50
    ld   hl, Data_004_4B5C                        ;; 04:4BB2 $21 $5C $4B
    add  hl, de                                   ;; 04:4BB5 $19
    ld   a, [hl]                                  ;; 04:4BB6 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:4BB7 $21 $40 $C2
    add  hl, bc                                   ;; 04:4BBA $09
    ld   [hl], a                                  ;; 04:4BBB $77
    ld   hl, Data_004_4B6C                        ;; 04:4BBC $21 $6C $4B
    add  hl, de                                   ;; 04:4BBF $19
    ld   a, [hl]                                  ;; 04:4BC0 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4BC1 $21 $50 $C2
    add  hl, bc                                   ;; 04:4BC4 $09
    ld   [hl], a                                  ;; 04:4BC5 $77

ret_004_4BC6:
    ret                                           ;; 04:4BC6 $C9

func_004_4BC7::
    call GetEntityTransitionCountdown             ;; 04:4BC7 $CD $05 $0C
    jr   z, .jr_4BD5                              ;; 04:4BCA $28 $09

    and  $0E                                      ;; 04:4BCC $E6 $0E
    ret  nz                                       ;; 04:4BCE $C0

    call UpdateEntityPosWithSpeed_04              ;; 04:4BCF $CD $CA $6D
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 04:4BD2 $C3 $23 $3B

.jr_4BD5
    ld   [hl], $30                                ;; 04:4BD5 $36 $30
    ld   hl, wEntitiesPrivateState3Table          ;; 04:4BD7 $21 $D0 $C2
    add  hl, bc                                   ;; 04:4BDA $09
    ld   [hl], b                                  ;; 04:4BDB $70
    ret                                           ;; 04:4BDC $C9

Data_004_4BDD::
    db   $F0, $F0, $60, $03, $F0, $F8, $62, $03, $F0, $00, $70, $03, $F0, $08, $70, $23
    db   $F0, $10, $62, $23, $F0, $18, $60, $23, $00, $F0, $64, $03, $00, $F8, $6E, $03
    db   $00, $00, $72, $03, $00, $08, $72, $23, $00, $10, $6E, $23, $00, $18, $64, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $F0, $68, $03, $F0, $F8, $6A, $03, $F0, $00, $7E, $03, $F0, $08, $7E, $23
    db   $F0, $10, $6A, $23, $F0, $18, $68, $23, $00, $F0, $6C, $03, $00, $F8, $6E, $03
    db   $00, $00, $72, $03, $00, $08, $72, $23, $00, $10, $6E, $23, $00, $18, $6C, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $F0, $60, $03, $F0, $F8, $62, $03, $F0, $00, $62, $23, $F0, $08, $62, $03
    db   $F0, $10, $62, $23, $F0, $18, $60, $23, $00, $F0, $64, $03, $00, $F8, $66, $03
    db   $00, $00, $66, $23, $00, $08, $66, $03, $00, $10, $66, $23, $00, $18, $64, $23
    db   $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $EC, $60, $03, $F0, $F4, $62, $03, $F0, $FC, $62, $23, $F0, $04, $74, $03
    db   $F0, $0C, $62, $03, $F0, $14, $62, $23, $F0, $1C, $60, $23, $00, $EC, $64, $03
    db   $00, $F4, $66, $03, $00, $FC, $66, $23, $00, $04, $76, $03, $00, $0C, $66, $03
    db   $00, $14, $66, $23, $00, $1C, $64, $23, $00, $00, $FF, $00, $00, $00, $FF, $00
    db   $F0, $E8, $60, $03, $F0, $F0, $62, $03, $F0, $F8, $62, $23, $F0, $00, $78, $03
    db   $F0, $08, $78, $23, $F0, $10, $62, $03, $F0, $18, $62, $23, $F0, $20, $60, $23
    db   $00, $E8, $64, $03, $00, $F0, $66, $03, $00, $F8, $66, $23, $00, $00, $7A, $03
    db   $00, $08, $7A, $23, $00, $10, $66, $03, $00, $18, $66, $23, $00, $20, $64, $23
    db   $F0, $E8, $60, $03, $F0, $F0, $62, $03, $F0, $F8, $62, $23, $F0, $00, $78, $03
    db   $F0, $08, $78, $23, $F0, $10, $62, $03, $F0, $18, $62, $23, $F0, $20, $60, $23
    db   $00, $E8, $64, $03, $00, $F0, $66, $03, $00, $F8, $66, $23, $00, $00, $7C, $03
    db   $00, $08, $7C, $23, $00, $10, $66, $03, $00, $18, $66, $23, $00, $20, $64, $23
    db   $F0, $E6, $60, $03, $F0, $EE, $62, $03, $F0, $F6, $62, $23, $F0, $FE, $78, $03
    db   $F0, $0A, $78, $23, $F0, $12, $62, $03, $F0, $1A, $62, $23, $F0, $22, $60, $23
    db   $00, $E6, $64, $03, $00, $EE, $66, $03, $00, $F6, $66, $23, $00, $FE, $7C, $03
    db   $00, $0A, $7C, $23, $00, $12, $66, $03, $00, $1A, $66, $23, $00, $22, $64, $23

Data_004_4D9D::
    db   $0C, $F5, $26, $00, $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00
    db   $0C, $0D, $26, $00, $0C, $13, $26, $00

func_004_4DB5::
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:4DB5 $21 $B0 $C3
    add  hl, bc                                   ;; 04:4DB8 $09
    ld   a, [hl]                                  ;; 04:4DB9 $7E
    ld   d, b                                     ;; 04:4DBA $50
    rla                                           ;; 04:4DBB $17
    rl   d                                        ;; 04:4DBC $CB $12

.jr_4DBE
    rla                                           ;; 04:4DBE $17
    rl   d                                        ;; 04:4DBF $CB $12
    rla                                           ;; 04:4DC1 $17
    rl   d                                        ;; 04:4DC2 $CB $12
    rla                                           ;; 04:4DC4 $17
    rl   d                                        ;; 04:4DC5 $CB $12
    rla                                           ;; 04:4DC7 $17
    rl   d                                        ;; 04:4DC8 $CB $12
    rla                                           ;; 04:4DCA $17
    rl   d                                        ;; 04:4DCB $CB $12
    and  $C0                                      ;; 04:4DCD $E6 $C0
    ld   e, a                                     ;; 04:4DCF $5F
    ld   hl, Data_004_4BDD                        ;; 04:4DD0 $21 $DD $4B
    add  hl, de                                   ;; 04:4DD3 $19
    ld   c, $10                                   ;; 04:4DD4 $0E $10
    call RenderActiveEntitySpritesRect            ;; 04:4DD6 $CD $E6 $3C
    ld   a, $10                                   ;; 04:4DD9 $3E $10
    call func_015_7964_trampoline                 ;; 04:4DDB $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ;; 04:4DDE $21 $10 $C3
    add  hl, bc                                   ;; 04:4DE1 $09
    ld   a, [hl]                                  ;; 04:4DE2 $7E
    and  a                                        ;; 04:4DE3 $A7
    ret  z                                        ;; 04:4DE4 $C8

    ldh  a, [hActiveEntityPosY]                   ;; 04:4DE5 $F0 $EF
    sub  $08                                      ;; 04:4DE7 $D6 $08
    ldh  [hActiveEntityVisualPosY], a             ;; 04:4DE9 $E0 $EC
    ld   hl, Data_004_4D9D                        ;; 04:4DEB $21 $9D $4D
    ld   c, $06                                   ;; 04:4DEE $0E $06
    call RenderActiveEntitySpritesRect            ;; 04:4DF0 $CD $E6 $3C
    ld   a, $06                                   ;; 04:4DF3 $3E $06
    call func_015_7964_trampoline                 ;; 04:4DF5 $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ;; 04:4DF8 $C3 $8A $3D

func_004_4DFB::
    call func_004_4FFE                            ;; 04:4DFB $CD $FE $4F
    ldh  a, [hActiveEntityStatus]                 ;; 04:4DFE $F0 $EA
    cp   $05                                      ;; 04:4E00 $FE $05
    jp   z, label_004_4E60                        ;; 04:4E02 $CA $60 $4E

    ld   hl, wEntitiesFlashCountdownTable         ;; 04:4E05 $21 $20 $C4
    add  hl, bc                                   ;; 04:4E08 $09
    ldh  a, [hFrameCounter]                       ;; 04:4E09 $F0 $E7
    ld   [hl], a                                  ;; 04:4E0B $77
    ldh  a, [hActiveEntityState]                  ;; 04:4E0C $F0 $F0
    JP_TABLE                                      ;; 04:4E0E $C7
._00 dw func_004_4E15                             ;; 04:4E0F
._01 dw func_004_4E1D                             ;; 04:4E11
._02 dw func_004_4E26                             ;; 04:4E13

func_004_4E15::
    call GetEntityTransitionCountdown             ;; 04:4E15 $CD $05 $0C
    ld   [hl], $40                                ;; 04:4E18 $36 $40
    jp   IncrementEntityState                     ;; 04:4E1A $C3 $12 $3B

func_004_4E1D::
    call GetEntityTransitionCountdown             ;; 04:4E1D $CD $05 $0C
    ret  nz                                       ;; 04:4E20 $C0

    ld   [hl], $A0                                ;; 04:4E21 $36 $A0
    jp   IncrementEntityState                     ;; 04:4E23 $C3 $12 $3B

func_004_4E26::
    call GetEntityTransitionCountdown             ;; 04:4E26 $CD $05 $0C
    jr   nz, jr_004_4E4F                          ;; 04:4E29 $20 $24

    ld   e, $0F                                   ;; 04:4E2B $1E $0F
    ld   d, b                                     ;; 04:4E2D $50

jr_004_4E2E:
    ld   a, c                                     ;; 04:4E2E $79
    cp   e                                        ;; 04:4E2F $BB
    jr   z, .jr_4E43                              ;; 04:4E30 $28 $11

    ld   hl, wEntitiesStatusTable                 ;; 04:4E32 $21 $80 $C2
    add  hl, de                                   ;; 04:4E35 $19
    ld   a, [hl]                                  ;; 04:4E36 $7E
    and  a                                        ;; 04:4E37 $A7
    jr   z, .jr_4E43                              ;; 04:4E38 $28 $09

    ld   hl, wEntitiesTypeTable                   ;; 04:4E3A $21 $A0 $C3
    add  hl, de                                   ;; 04:4E3D $19
    ld   a, [hl]                                  ;; 04:4E3E $7E
    cp   $5B                                      ;; 04:4E3F $FE $5B
    jr   z, jr_004_4E4C                           ;; 04:4E41 $28 $09

.jr_4E43
    dec  e                                        ;; 04:4E43 $1D
    ld   a, e                                     ;; 04:4E44 $7B
    cp   $FF                                      ;; 04:4E45 $FE $FF
    jr   nz, jr_004_4E2E                          ;; 04:4E47 $20 $E5

    jp   DropHeartContainer_04                    ;; 04:4E49 $C3 $51 $57

jr_004_4E4C:
    jp   ClearEntityStatusBank04                  ;; 04:4E4C $C3 $7A $6D

jr_004_4E4F:
    jp   BossDeathRandomExplosion                 ;; 04:4E4F $C3 $EF $50

func_004_4E52::
    call GetEntitySlowTransitionCountdown         ;; 04:4E52 $CD $FB $0B
    jr   z, .ret_4E5F                             ;; 04:4E55 $28 $08

    ld   a, $02                                   ;; 04:4E57 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 04:4E59 $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ;; 04:4E5B $3E $6A
    ldh  [hLinkAnimationState], a                 ;; 04:4E5D $E0 $9D

.ret_4E5F
    ret                                           ;; 04:4E5F $C9

label_004_4E60:
    call ReturnIfNonInteractive_04                ;; 04:4E60 $CD $A3 $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 04:4E63 $21 $10 $C4
    add  hl, bc                                   ;; 04:4E66 $09
    ld   a, [hl]                                  ;; 04:4E67 $7E
    cp   $02                                      ;; 04:4E68 $FE $02
    jr   nz, jr_004_4E83                          ;; 04:4E6A $20 $17

    ld   hl, wEntitiesPrivateState1Table          ;; 04:4E6C $21 $B0 $C2
    add  hl, bc                                   ;; 04:4E6F $09
    ld   a, [hl]                                  ;; 04:4E70 $7E
    and  a                                        ;; 04:4E71 $A7
    jr   z, .jr_4E82                              ;; 04:4E72 $28 $0E

    call IncrementEntityState                     ;; 04:4E74 $CD $12 $3B
    ld   [hl], $02                                ;; 04:4E77 $36 $02
    ld   a, JINGLE_JUMP                           ;; 04:4E79 $3E $24
    ldh  [hJingle], a                             ;; 04:4E7B $E0 $F2
    call ClearEntitySpeed                         ;; 04:4E7D $CD $7F $3D
    jr   jr_004_4E83                              ;; 04:4E80 $18 $01

.jr_4E82
    inc  [hl]                                     ;; 04:4E82 $34

jr_004_4E83:
    call ApplyRecoilIfNeeded_04                   ;; 04:4E83 $CD $80 $6D
    xor  a                                        ;; 04:4E86 $AF
    ldh  [hMultiPurposeG], a                      ;; 04:4E87 $E0 $E8
    ldh  a, [hActiveEntityState]                  ;; 04:4E89 $F0 $F0
    JP_TABLE                                      ;; 04:4E8B $C7
._00 dw func_004_4EA4                             ;; 04:4E8C
._01 dw func_004_4EEB                             ;; 04:4E8E
._02 dw func_004_4F65                             ;; 04:4E90
._03 dw func_004_4F7E                             ;; 04:4E92

Data_004_4E94::
    db   $10, $0C, $00, $F4, $F0, $F4, $00, $0C

Data_004_4E9C::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

func_004_4EA4::
    ld   a, $18                                   ;; 04:4EA4 $3E $18
    call func_004_4B37                            ;; 04:4EA6 $CD $37 $4B
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 04:4EA9 $CD $39 $3B
    call GetEntityTransitionCountdown             ;; 04:4EAC $CD $05 $0C
    jr   nz, jr_004_4EE7                          ;; 04:4EAF $20 $36

    call GetRandomByte                            ;; 04:4EB1 $CD $0D $28
    and  $07                                      ;; 04:4EB4 $E6 $07
    ld   e, a                                     ;; 04:4EB6 $5F
    ld   d, b                                     ;; 04:4EB7 $50
    ld   hl, Data_004_4E94                        ;; 04:4EB8 $21 $94 $4E
    add  hl, de                                   ;; 04:4EBB $19
    ld   a, [hl]                                  ;; 04:4EBC $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 04:4EBD $21 $40 $C2
    add  hl, bc                                   ;; 04:4EC0 $09
    ld   [hl], a                                  ;; 04:4EC1 $77
    ld   hl, Data_004_4E9C                        ;; 04:4EC2 $21 $9C $4E
    add  hl, de                                   ;; 04:4EC5 $19
    ld   a, [hl]                                  ;; 04:4EC6 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 04:4EC7 $21 $50 $C2
    add  hl, bc                                   ;; 04:4ECA $09
    ld   [hl], a                                  ;; 04:4ECB $77
    call GetRandomByte                            ;; 04:4ECC $CD $0D $28
    and  $03                                      ;; 04:4ECF $E6 $03
    jr   nz, .jr_4ED8                             ;; 04:4ED1 $20 $05

    ld   a, $18                                   ;; 04:4ED3 $3E $18
    call ApplyVectorTowardsLink_trampoline        ;; 04:4ED5 $CD $AA $3B

.jr_4ED8
    call GetRandomByte                            ;; 04:4ED8 $CD $0D $28
    and  $0F                                      ;; 04:4EDB $E6 $0F
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4EDD $21 $20 $C3
    add  hl, bc                                   ;; 04:4EE0 $09
    add  $08                                      ;; 04:4EE1 $C6 $08
    ld   [hl], a                                  ;; 04:4EE3 $77
    call IncrementEntityState                     ;; 04:4EE4 $CD $12 $3B

jr_004_4EE7:
    ld   a, b                                     ;; 04:4EE7 $78
    jp   SetEntitySpriteVariant                   ;; 04:4EE8 $C3 $0C $3B

func_004_4EEB::
    call GetEntityTransitionCountdown             ;; 04:4EEB $CD $05 $0C
    and  a                                        ;; 04:4EEE $A7
    jr   nz, jr_004_4F60                          ;; 04:4EEF $20 $6F

    call UpdateEntityPosWithSpeed_04              ;; 04:4EF1 $CD $CA $6D
    call ApplyEntityInteractionWithBackground_trampoline ;; 04:4EF4 $CD $23 $3B
    call AddEntityZSpeedToPos_04                  ;; 04:4EF7 $CD $03 $6E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4EFA $21 $20 $C3
    add  hl, bc                                   ;; 04:4EFD $09
    dec  [hl]                                     ;; 04:4EFE $35
    dec  [hl]                                     ;; 04:4EFF $35
    ld   a, $18                                   ;; 04:4F00 $3E $18
    call func_004_4B37                            ;; 04:4F02 $CD $37 $4B
    call label_3B44                               ;; 04:4F05 $CD $44 $3B
    ld   hl, wEntitiesPrivateState4Table          ;; 04:4F08 $21 $40 $C4
    add  hl, bc                                   ;; 04:4F0B $09
    ld   a, [hl]                                  ;; 04:4F0C $7E
    and  a                                        ;; 04:4F0D $A7
    jr   nz, .jr_4F14                             ;; 04:4F0E $20 $04

    call label_3B70                               ;; 04:4F10 $CD $70 $3B
    xor  a                                        ;; 04:4F13 $AF

.jr_4F14
    ld   hl, wEntitiesPosZTable                   ;; 04:4F14 $21 $10 $C3
    add  hl, bc                                   ;; 04:4F17 $09
    ld   a, [hl]                                  ;; 04:4F18 $7E
    and  $80                                      ;; 04:4F19 $E6 $80
    jr   z, jr_004_4F60                           ;; 04:4F1B $28 $43

    ld   [hl], b                                  ;; 04:4F1D $70
    ld   hl, wEntitiesPrivateState4Table          ;; 04:4F1E $21 $40 $C4
    add  hl, bc                                   ;; 04:4F21 $09
    ld   [hl], b                                  ;; 04:4F22 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4F23 $21 $20 $C3
    add  hl, bc                                   ;; 04:4F26 $09
    ld   a, [hl]                                  ;; 04:4F27 $7E
    sub  $E0                                      ;; 04:4F28 $D6 $E0
    and  $80                                      ;; 04:4F2A $E6 $80
    jr   z, .jr_4F49                              ;; 04:4F2C $28 $1B

    ld   a, $18                                   ;; 04:4F2E $3E $18
    ld   [wScreenShakeCountdown], a               ;; 04:4F30 $EA $57 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 04:4F33 $3E $0B
    ldh  [hJingle], a                             ;; 04:4F35 $E0 $F2
    ld   a, [wIsLinkInTheAir]                     ;; 04:4F37 $FA $46 $C1
    and  a                                        ;; 04:4F3A $A7
    jr   nz, .jr_4F49                             ;; 04:4F3B $20 $0C

    call GetEntitySlowTransitionCountdown         ;; 04:4F3D $CD $FB $0B
    ld   [hl], $0E                                ;; 04:4F40 $36 $0E
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4F42 $21 $20 $C3
    add  hl, bc                                   ;; 04:4F45 $09
    ld   [hl], b                                  ;; 04:4F46 $70
    jr   jr_004_4F57                              ;; 04:4F47 $18 $0E

.jr_4F49
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4F49 $21 $20 $C3
    add  hl, bc                                   ;; 04:4F4C $09
    ld   a, [hl]                                  ;; 04:4F4D $7E
    ld   [hl], b                                  ;; 04:4F4E $70
    cp   $F2                                      ;; 04:4F4F $FE $F2
    jr   nc, jr_004_4F57                          ;; 04:4F51 $30 $04

    ld   a, JINGLE_BOUNCE                         ;; 04:4F53 $3E $20
    ldh  [hJingle], a                             ;; 04:4F55 $E0 $F2

jr_004_4F57:
    call IncrementEntityState                     ;; 04:4F57 $CD $12 $3B
    ld   [hl], b                                  ;; 04:4F5A $70
    call GetEntityTransitionCountdown             ;; 04:4F5B $CD $05 $0C
    ld   [hl], $20                                ;; 04:4F5E $36 $20

jr_004_4F60:
    ld   a, $01                                   ;; 04:4F60 $3E $01
    jp   SetEntitySpriteVariant                   ;; 04:4F62 $C3 $0C $3B

func_004_4F65::
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4F65 $21 $20 $C3
    add  hl, bc                                   ;; 04:4F68 $09
    ld   [hl], $60                                ;; 04:4F69 $36 $60
    call AddEntityZSpeedToPos_04                  ;; 04:4F6B $CD $03 $6E
    ld   hl, wEntitiesPosZTable                   ;; 04:4F6E $21 $10 $C3
    add  hl, bc                                   ;; 04:4F71 $09
    ld   a, [hl]                                  ;; 04:4F72 $7E
    cp   $70                                      ;; 04:4F73 $FE $70
    ret  c                                        ;; 04:4F75 $D8

    call GetEntityTransitionCountdown             ;; 04:4F76 $CD $05 $0C
    ld   [hl], $30                                ;; 04:4F79 $36 $30
    jp   IncrementEntityState                     ;; 04:4F7B $C3 $12 $3B

func_004_4F7E::
    ld   a, $FF                                   ;; 04:4F7E $3E $FF
    call SetEntitySpriteVariant                   ;; 04:4F80 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 04:4F83 $CD $05 $0C
    jr   nz, .ret_4FAD                            ;; 04:4F86 $20 $25

    ld   [hl], $18                                ;; 04:4F88 $36 $18
    ld   hl, wEntitiesPrivateState4Table          ;; 04:4F8A $21 $40 $C4
    add  hl, bc                                   ;; 04:4F8D $09
    ld   [hl], $01                                ;; 04:4F8E $36 $01
    call IncrementEntityState                     ;; 04:4F90 $CD $12 $3B
    ld   [hl], $01                                ;; 04:4F93 $36 $01
    ld   hl, wEntitiesSpeedZTable                 ;; 04:4F95 $21 $20 $C3
    add  hl, bc                                   ;; 04:4F98 $09
    ld   [hl], $C0                                ;; 04:4F99 $36 $C0
    ldh  a, [hLinkPositionX]                      ;; 04:4F9B $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 04:4F9D $21 $00 $C2
    add  hl, bc                                   ;; 04:4FA0 $09
    ld   [hl], a                                  ;; 04:4FA1 $77
    ldh  a, [hLinkPositionY]                      ;; 04:4FA2 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 04:4FA4 $21 $10 $C2
    add  hl, bc                                   ;; 04:4FA7 $09
    ld   [hl], a                                  ;; 04:4FA8 $77
    ld   a, JINGLE_FALL_DOWN                      ;; 04:4FA9 $3E $08
    ldh  [hJingle], a                             ;; 04:4FAB $E0 $F2

.ret_4FAD
    ret                                           ;; 04:4FAD $C9

Data_004_4FAE::
    db   $F0, $F8, $60, $03, $F0, $00, $62, $03, $F0, $08, $62, $23, $F0, $10, $60, $23
    db   $00, $F8, $64, $03, $00, $00, $66, $03, $00, $08, $66, $23, $00, $10, $64, $23
    db   $F0, $F8, $68, $03, $F0, $00, $6A, $03, $F0, $08, $6A, $23, $F0, $10, $68, $23
    db   $00, $F8, $6C, $03, $00, $00, $66, $03, $00, $08, $66, $23, $00, $10, $6C, $23

Data_004_4FEE::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_004_4FFE::
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:4FFE $21 $B0 $C3
    add  hl, bc                                   ;; 04:5001 $09
    ld   a, [hl]                                  ;; 04:5002 $7E
    ld   d, b                                     ;; 04:5003 $50
    rla                                           ;; 04:5004 $17
    rl   d                                        ;; 04:5005 $CB $12
    rla                                           ;; 04:5007 $17
    rl   d                                        ;; 04:5008 $CB $12
    rla                                           ;; 04:500A $17
    rl   d                                        ;; 04:500B $CB $12
    rla                                           ;; 04:500D $17
    rl   d                                        ;; 04:500E $CB $12
    rla                                           ;; 04:5010 $17
    rl   d                                        ;; 04:5011 $CB $12
    and  $E0                                      ;; 04:5013 $E6 $E0
    ld   e, a                                     ;; 04:5015 $5F
    ld   hl, Data_004_4FAE                        ;; 04:5016 $21 $AE $4F
    add  hl, de                                   ;; 04:5019 $19
    ld   c, $08                                   ;; 04:501A $0E $08
    call RenderActiveEntitySpritesRect            ;; 04:501C $CD $E6 $3C
    ld   a, $08                                   ;; 04:501F $3E $08
    call func_015_7964_trampoline                 ;; 04:5021 $CD $A0 $3D
    ld   hl, wEntitiesSpriteVariantTable          ;; 04:5024 $21 $B0 $C3
    add  hl, bc                                   ;; 04:5027 $09
    ld   a, [hl]                                  ;; 04:5028 $7E
    cp   $FF                                      ;; 04:5029 $FE $FF
    jr   z, .jr_5048                              ;; 04:502B $28 $1B

    ld   hl, wEntitiesPosZTable                   ;; 04:502D $21 $10 $C3
    add  hl, bc                                   ;; 04:5030 $09
    ld   a, [hl]                                  ;; 04:5031 $7E
    and  a                                        ;; 04:5032 $A7
    jr   z, .jr_5048                              ;; 04:5033 $28 $13

    ldh  a, [hActiveEntityPosY]                   ;; 04:5035 $F0 $EF
    sub  $02                                      ;; 04:5037 $D6 $02
    ldh  [hActiveEntityVisualPosY], a             ;; 04:5039 $E0 $EC
    ld   hl, Data_004_4FEE                        ;; 04:503B $21 $EE $4F
    ld   c, $04                                   ;; 04:503E $0E $04
    call RenderActiveEntitySpritesRect            ;; 04:5040 $CD $E6 $3C
    ld   a, $04                                   ;; 04:5043 $3E $04
    call func_015_7964_trampoline                 ;; 04:5045 $CD $A0 $3D

.jr_5048
    jp   CopyEntityPositionToActivePosition       ;; 04:5048 $C3 $8A $3D
