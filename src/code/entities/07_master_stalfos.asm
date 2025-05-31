Data_007_6942::
    db   $3A, $D5, $D6, $D7, $3A, $3A, $CD, $E1, $CE, $3A, $03, $09, $03, $09, $C6, $1B
    db   $1B, $03, $03, $09, $0E, $1B, $1B, $1B, $1B

Data_007_695B::
    db   $02, $12, $22, $32

Data_007_695F::
    db   $42, $00, $08, $10, $18, $20, $28, $30, $38, $40, $48

label_007_696A:
    call ReturnIfNonInteractive_07                ;; 07:696A $CD $96 $7D
    ld   a, $02                                   ;; 07:696D $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 07:696F $E0 $A1
    ld   [wC167], a                               ;; 07:6971 $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ;; 07:6974 $F0 $F0
    JP_TABLE                                      ;; 07:6976
._00 dw func_007_697F                             ;; 07:6977
._01 dw func_007_698A                             ;; 07:6979
._02 dw func_007_6996                             ;; 07:697B
._03 dw func_007_69A2                             ;; 07:697D

func_007_697F::
    call PlayDoorUnlockedSfx                      ;; 07:697F $CD $00 $40
    call GetEntityTransitionCountdown             ;; 07:6982 $CD $05 $0C
    ld   [hl], $28                                ;; 07:6985 $36 $28
    jp   IncrementEntityState                     ;; 07:6987 $C3 $12 $3B

func_007_698A::
    call GetEntityTransitionCountdown             ;; 07:698A $CD $05 $0C
    ret  nz                                       ;; 07:698D $C0

; fallthrough if not zero
    ld   a, MUSIC_OPEN_ANGLERS_TUNNEL             ;; 07:698E $3E $4C
    ld   [wMusicTrackToPlay], a                   ;; 07:6990 $EA $68 $D3
    jp   IncrementEntityState                     ;; 07:6993 $C3 $12 $3B

func_007_6996::
    ld   a, NOISE_SFX_OPEN_D4_D7                  ;; 07:6996 $3E $1D
    ldh  [hNoiseSfx], a                           ;; 07:6998 $E0 $F4
    call GetEntityTransitionCountdown             ;; 07:699A $CD $05 $0C
    ld   [hl], $80                                ;; 07:699D $36 $80
    jp   IncrementEntityState                     ;; 07:699F $C3 $12 $3B

func_007_69A2::
    ldh  a, [hFrameCounter]                       ;; 07:69A2 $F0 $E7
    ld   e, $00                                   ;; 07:69A4 $1E $00
    and  $08                                      ;; 07:69A6 $E6 $08
    jr   z, .jr_69AC                              ;; 07:69A8 $28 $02

    ld   e, $02                                   ;; 07:69AA $1E $02

.jr_69AC
    ld   a, e                                     ;; 07:69AC $7B
    ld   [wScreenShakeHorizontal], a              ;; 07:69AD $EA $55 $C1
    call GetEntityTransitionCountdown             ;; 07:69B0 $CD $05 $0C
    ret  nz                                       ;; 07:69B3 $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 07:69B4 $21 $B0 $C2
    add  hl, bc                                   ;; 07:69B7 $09
    ld   a, [hl]                                  ;; 07:69B8 $7E
    ld   e, a                                     ;; 07:69B9 $5F
    inc  a                                        ;; 07:69BA $3C
    ld   [hl], a                                  ;; 07:69BB $77
    ldh  [hMultiPurposeG], a                      ;; 07:69BC $E0 $E8
    ld   a, e                                     ;; 07:69BE $7B
    and  $1F                                      ;; 07:69BF $E6 $1F
    jp   nz, label_007_69D0                       ;; 07:69C1 $C2 $D0 $69

    ld   hl, wEntitiesInertiaTable                ;; 07:69C4 $21 $D0 $C3
    add  hl, bc                                   ;; 07:69C7 $09
    ld   a, [hl]                                  ;; 07:69C8 $7E
    cp   $0A                                      ;; 07:69C9 $FE $0A
    jp   z, label_007_6A34                        ;; 07:69CB $CA $34 $6A

    inc  a                                        ;; 07:69CE $3C
    ld   [hl], a                                  ;; 07:69CF $77

label_007_69D0:
    ld   hl, wEntitiesInertiaTable                ;; 07:69D0 $21 $D0 $C3
    add  hl, bc                                   ;; 07:69D3 $09
    push hl                                       ;; 07:69D4 $E5
    ld   a, [hl]                                  ;; 07:69D5 $7E
    ld   e, a                                     ;; 07:69D6 $5F
    ld   d, b                                     ;; 07:69D7 $50
    ld   hl, Data_007_695F                        ;; 07:69D8 $21 $5F $69
    add  hl, de                                   ;; 07:69DB $19
    ld   a, [hl]                                  ;; 07:69DC $7E
    ldh  [hIntersectedObjectTop], a               ;; 07:69DD $E0 $CD
    ld   a, $20                                   ;; 07:69DF $3E $20
    ldh  [hIntersectedObjectLeft], a              ;; 07:69E1 $E0 $CE
    call label_2887                               ;; 07:69E3 $CD $87 $28
    pop  hl                                       ;; 07:69E6 $E1
    ld   d, h                                     ;; 07:69E7 $54
    ld   e, l                                     ;; 07:69E8 $5D

    ld   hl, wFarcallParams                       ;; 07:69E9 $21 $01 $DE
    ld   a, BANK(AnglersTunnelDoorEntityHandler)  ;; 07:69EC $3E $1A
    ld   [hl+], a                                 ;; 07:69EE $22
    ld   a, HIGH(AnglersTunnelDoorEntityHandler)  ;; 07:69EF $3E $71
    ld   [hl+], a                                 ;; 07:69F1 $22
    ld   a, LOW(AnglersTunnelDoorEntityHandler)   ;; 07:69F2 $3E $11
    ld   [hl+], a                                 ;; 07:69F4 $22
    ld   a, BANK(@)                               ;; 07:69F5 $3E $07
    ld   [hl], a                                  ;; 07:69F7 $77
    call Farcall                                  ;; 07:69F8 $CD $D7 $0B

    push bc                                       ;; 07:69FB $C5
    ld   hl, wEntitiesInertiaTable                ;; 07:69FC $21 $D0 $C3
    add  hl, bc                                   ;; 07:69FF $09
    ld   a, [hl]                                  ;; 07:6A00 $7E
    dec  a                                        ;; 07:6A01 $3D
    rra                                           ;; 07:6A02 $1F
    and  $07                                      ;; 07:6A03 $E6 $07
    push af                                       ;; 07:6A05 $F5
    ld   e, a                                     ;; 07:6A06 $5F
    ld   d, b                                     ;; 07:6A07 $50
    ld   hl, Data_007_695B                        ;; 07:6A08 $21 $5B $69
    add  hl, de                                   ;; 07:6A0B $19
    ld   e, [hl]                                  ;; 07:6A0C $5E
    ld   hl, wRoomObjects                         ;; 07:6A0D $21 $11 $D7
    add  hl, de                                   ;; 07:6A10 $19
    ld   c, l                                     ;; 07:6A11 $4D
    ld   b, h                                     ;; 07:6A12 $44
    pop  af                                       ;; 07:6A13 $F1
    ld   e, a                                     ;; 07:6A14 $5F
    sla  a                                        ;; 07:6A15 $CB $27
    sla  a                                        ;; 07:6A17 $CB $27
    add  e                                        ;; 07:6A19 $83
    ld   e, a                                     ;; 07:6A1A $5F
    ld   d, $00                                   ;; 07:6A1B $16 $00
    ld   hl, Data_007_6942                        ;; 07:6A1D $21 $42 $69
    add  hl, de                                   ;; 07:6A20 $19
    ld   e, $05                                   ;; 07:6A21 $1E $05

.loop_6A23
    ld   a, [hl+]                                 ;; 07:6A23 $2A
    ld   [bc], a                                  ;; 07:6A24 $02
    push hl                                       ;; 07:6A25 $E5
    ld   h, b                                     ;; 07:6A26 $60
    ld   l, c                                     ;; 07:6A27 $69
    ld   a, $87                                   ;; 07:6A28 $3E $87
    call BackupObjectInRAM2                       ;; 07:6A2A $CD $2F $0B
    pop  hl                                       ;; 07:6A2D $E1
    inc  bc                                       ;; 07:6A2E $03
    dec  e                                        ;; 07:6A2F $1D
    jr   nz, .loop_6A23                           ;; 07:6A30 $20 $F1

    pop  bc                                       ;; 07:6A32 $C1
    ret                                           ;; 07:6A33 $C9

label_007_6A34:
    xor  a                                        ;; 07:6A34 $AF
    ld   [wScreenShakeHorizontal], a              ;; 07:6A35 $EA $55 $C1
    ld   [wC167], a                               ;; 07:6A38 $EA $67 $C1
    call label_27DD                               ;; 07:6A3B $CD $DD $27
    jp   ClearEntityStatus_07                     ;; 07:6A3E $C3 $A4 $7E

; Entity handler for:
;  - Master Stalfos
;  - Angler's Tunnel cascade
MasterStalfosEntityHandler::
    ld   hl, wEntitiesPrivateState4Table          ;; 07:6A41 $21 $40 $C4
    add  hl, bc                                   ;; 07:6A44 $09
    ld   a, [hl]                                  ;; 07:6A45 $7E
    cp   $FF                                      ;; 07:6A46 $FE $FF
    jp   z, label_007_696A                        ;; 07:6A48 $CA $6A $69

    and  a                                        ;; 07:6A4B $A7
    jr   nz, .jr_6A52                             ;; 07:6A4C $20 $04

    inc  [hl]                                     ;; 07:6A4E $34
    call func_007_6ED0                            ;; 07:6A4F $CD $D0 $6E

.jr_6A52
    call func_007_6FB1                            ;; 07:6A52 $CD $B1 $6F
    ldh  a, [hActiveEntityStatus]                 ;; 07:6A55 $F0 $EA
    cp   $05                                      ;; 07:6A57 $FE $05
    jp   nz, label_007_7EAA                       ;; 07:6A59 $C2 $AA $7E

    call ReturnIfNonInteractive_07                ;; 07:6A5C $CD $96 $7D
    call label_394D                               ;; 07:6A5F $CD $4D $39
    call BossIntro                                ;; 07:6A62 $CD $E8 $3E
    ld   hl, wEntitiesFlashCountdownTable         ;; 07:6A65 $21 $20 $C4
    add  hl, bc                                   ;; 07:6A68 $09
    ld   a, [hl]                                  ;; 07:6A69 $7E
    cp   $16                                      ;; 07:6A6A $FE $16
    jr   nz, jr_007_6A89                          ;; 07:6A6C $20 $1B

    ldh  a, [hActiveEntityState]                  ;; 07:6A6E $F0 $F0
    cp   $09                                      ;; 07:6A70 $FE $09
    jr   nc, .jr_6A84                             ;; 07:6A72 $30 $10

    ld   [hl], b                                  ;; 07:6A74 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6A75 $21 $20 $C3
    add  hl, bc                                   ;; 07:6A78 $09
    ld   [hl], b                                  ;; 07:6A79 $70
    call IncrementEntityState                     ;; 07:6A7A $CD $12 $3B
    ld   a, $09                                   ;; 07:6A7D $3E $09
    ld   [hl], a                                  ;; 07:6A7F $77
    ldh  [hActiveEntityState], a                  ;; 07:6A80 $E0 $F0
    jr   jr_007_6A89                              ;; 07:6A82 $18 $05

.jr_6A84
    ld   hl, wEntitiesInertiaTable                ;; 07:6A84 $21 $D0 $C3
    add  hl, bc                                   ;; 07:6A87 $09
    inc  [hl]                                     ;; 07:6A88 $34

jr_007_6A89:
    call ApplyRecoilIfNeeded_07                   ;; 07:6A89 $CD $C3 $7D
    call AddEntityZSpeedToPos_07                  ;; 07:6A8C $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6A8F $21 $20 $C3
    add  hl, bc                                   ;; 07:6A92 $09
    dec  [hl]                                     ;; 07:6A93 $35
    dec  [hl]                                     ;; 07:6A94 $35
    ld   hl, wEntitiesPosZTable                   ;; 07:6A95 $21 $10 $C3
    add  hl, bc                                   ;; 07:6A98 $09
    ld   a, [hl]                                  ;; 07:6A99 $7E
    and  $80                                      ;; 07:6A9A $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 07:6A9C $E0 $E8
    jr   z, .jr_6AA6                              ;; 07:6A9E $28 $06

    ld   [hl], b                                  ;; 07:6AA0 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6AA1 $21 $20 $C3
    add  hl, bc                                   ;; 07:6AA4 $09
    ld   [hl], b                                  ;; 07:6AA5 $70

.jr_6AA6
    ldh  a, [hActiveEntityState]                  ;; 07:6AA6 $F0 $F0
    cp   $09                                      ;; 07:6AA8 $FE $09
    jr   nc, .jr_6AC0                             ;; 07:6AAA $30 $14

    call label_3B65                               ;; 07:6AAC $CD $65 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 07:6AAF $21 $10 $C4
    add  hl, bc                                   ;; 07:6AB2 $09
    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 07:6AB3 $FA $3E $C1
    or   [hl]                                     ;; 07:6AB6 $B6
    and  a                                        ;; 07:6AB7 $A7
    jr   nz, .jr_6AC0                             ;; 07:6AB8 $20 $06

    call CheckLinkCollisionWithEnemy_trampoline   ;; 07:6ABA $CD $5A $3B
    call label_3B70                               ;; 07:6ABD $CD $70 $3B

.jr_6AC0
    ldh  a, [hActiveEntityState]                  ;; 07:6AC0 $F0 $F0
     JP_TABLE                                      ;; 07:6AC2
._00 dw func_007_6ADF                             ;; 07:6AC3
._01 dw func_007_6AF5                             ;; 07:6AC5
._02 dw func_007_6B16                             ;; 07:6AC7
._03 dw func_007_6B68                             ;; 07:6AC9
._04 dw func_007_6BC8                             ;; 07:6ACB
._05 dw func_007_6BF4                             ;; 07:6ACD
._06 dw func_007_6C39                             ;; 07:6ACF
._07 dw func_007_6D18                             ;; 07:6AD1
._08 dw func_007_6D5F                             ;; 07:6AD3
._09 dw func_007_6D7F                             ;; 07:6AD5
._0A dw func_007_6D9F                             ;; 07:6AD7
._0B dw func_007_6DD9                             ;; 07:6AD9
._0C dw func_007_6DF6                             ;; 07:6ADB
._0D dw func_007_6E58                             ;; 07:6ADD

func_007_6ADF::
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6ADF $21 $20 $C3
    add  hl, bc                                   ;; 07:6AE2 $09
    ld   [hl], b                                  ;; 07:6AE3 $70
    call GetEntityTransitionCountdown             ;; 07:6AE4 $CD $05 $0C
    jr   nz, .ret_6AF4                            ;; 07:6AE7 $20 $0B

    ld   [hl], $30                                ;; 07:6AE9 $36 $30
    call IncrementEntityState                     ;; 07:6AEB $CD $12 $3B
    ld   hl, wEntitiesPosZTable                   ;; 07:6AEE $21 $10 $C3
    add  hl, bc                                   ;; 07:6AF1 $09
    ld   [hl], $6F                                ;; 07:6AF2 $36 $6F

.ret_6AF4
    ret                                           ;; 07:6AF4 $C9

func_007_6AF5::
    call GetEntityTransitionCountdown             ;; 07:6AF5 $CD $05 $0C
    jr   z, jr_007_6B08                           ;; 07:6AF8 $28 $0E

    cp   $01                                      ;; 07:6AFA $FE $01
    jr   nz, .jr_6B02                             ;; 07:6AFC $20 $04

    ld   a, JINGLE_FALL_DOWN                      ;; 07:6AFE $3E $08
    ldh  [hJingle], a                             ;; 07:6B00 $E0 $F2

.jr_6B02
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6B02 $21 $20 $C3
    add  hl, bc                                   ;; 07:6B05 $09
    ld   [hl], b                                  ;; 07:6B06 $70
    ret                                           ;; 07:6B07 $C9

jr_007_6B08:
    ldh  a, [hMultiPurposeG]                      ;; 07:6B08 $F0 $E8
    and  a                                        ;; 07:6B0A $A7
    jr   z, ret_007_6B15                          ;; 07:6B0B $28 $08

    call GetEntityTransitionCountdown             ;; 07:6B0D $CD $05 $0C
    ld   [hl], $40                                ;; 07:6B10 $36 $40
    call IncrementEntityState                     ;; 07:6B12 $CD $12 $3B

ret_007_6B15:
    ret                                           ;; 07:6B15 $C9

func_007_6B16::
    call GetEntityTransitionCountdown             ;; 07:6B16 $CD $05 $0C
    cp   $01                                      ;; 07:6B19 $FE $01
    jr   nz, jr_007_6B33                          ;; 07:6B1B $20 $16

    ld_dialog_low e, Dialog112 ; "You found me!"  ;; 07:6B1D $1E $12
    ldh  a, [hMapRoom]                            ;; 07:6B1F $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_2    ;; 07:6B21 $FE $92
    jr   z, .jr_6B2F                              ;; 07:6B23 $28 $0A
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_3    ;; 07:6B25 $FE $84
    jr   z, .jr_6B2F                              ;; 07:6B27 $28 $06
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_4    ;; 07:6B29 $FE $80
    jr   nz, jr_007_6B33                          ;; 07:6B2B $20 $06

    ld_dialog_low e, Dialog114 ; "I can't outlast you" ;; 07:6B2D $1E $14

.jr_6B2F
    ld   a, e                                     ;; 07:6B2F $7B
    call OpenDialogInTable1                       ;; 07:6B30 $CD $73 $23

jr_007_6B33:
    call GetEntityTransitionCountdown             ;; 07:6B33 $CD $05 $0C
    jr   nz, jr_007_6B45                          ;; 07:6B36 $20 $0D

    ld   [hl], $A0                                ;; 07:6B38 $36 $A0
    ldh  a, [hMapRoom]                            ;; 07:6B3A $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_1    ;; 07:6B3C $FE $95
    jr   z, jr_007_6B42                           ;; 07:6B3E $28 $02

.jr_6B40
    ld   [hl], $20                                ;; 07:6B40 $36 $20

jr_007_6B42:
    jp   IncrementEntityState                     ;; 07:6B42 $C3 $12 $3B

jr_007_6B45:
    ld   hl, wD20E                                ;; 07:6B45 $21 $0E $D2
    ld   [hl], $F0                                ;; 07:6B48 $36 $F0
    ld   hl, wD20B                                ;; 07:6B4A $21 $0B $D2
    ld   [hl], $F8                                ;; 07:6B4D $36 $F8
    ld   hl, wD20D                                ;; 07:6B4F $21 $0D $D2
    ld   [hl], $F0                                ;; 07:6B52 $36 $F0
    cp   $20                                      ;; 07:6B54 $FE $20
    jr   c, .ret_6B67                             ;; 07:6B56 $38 $0F

    ld   hl, wD20E                                ;; 07:6B58 $21 $0E $D2
    ld   [hl], $F2                                ;; 07:6B5B $36 $F2
    ld   hl, wD20B                                ;; 07:6B5D $21 $0B $D2
    ld   [hl], $FA                                ;; 07:6B60 $36 $FA
    ld   hl, wD20D                                ;; 07:6B62 $21 $0D $D2
    ld   [hl], $F2                                ;; 07:6B65 $36 $F2

.ret_6B67
    ret                                           ;; 07:6B67 $C9

func_007_6B68::
    call GetEntityTransitionCountdown             ;; 07:6B68 $CD $05 $0C
    jr   nz, .jr_6B72                             ;; 07:6B6B $20 $05

    ld   [hl], $20                                ;; 07:6B6D $36 $20
    jp   IncrementEntityState                     ;; 07:6B6F $C3 $12 $3B

.jr_6B72
    and  $3F                                      ;; 07:6B72 $E6 $3F
    jr   nz, .jr_6B76                             ;; 07:6B74 $20 $00

.jr_6B76
    call GetEntityTransitionCountdown             ;; 07:6B76 $CD $05 $0C
    and  $40                                      ;; 07:6B79 $E6 $40
    jr   z, func_007_6BA3                         ;; 07:6B7B $28 $26

func_007_6B7D::
    call func_007_6EF0                            ;; 07:6B7D $CD $F0 $6E
    ld   hl, wD208                                ;; 07:6B80 $21 $08 $D2
    ld   [hl], $01                                ;; 07:6B83 $36 $01
    ld   hl, wD209                                ;; 07:6B85 $21 $09 $D2
    ld   [hl], b                                  ;; 07:6B88 $70
    ld   hl, wD20A                                ;; 07:6B89 $21 $0A $D2
    ld   [hl], $F0                                ;; 07:6B8C $36 $F0
    ld   hl, wD20B                                ;; 07:6B8E $21 $0B $D2
    ld   [hl], $F8                                ;; 07:6B91 $36 $F8
    ld   hl, wD20D                                ;; 07:6B93 $21 $0D $D2
    ld   [hl], $F3                                ;; 07:6B96 $36 $F3
    ld   hl, wD20C                                ;; 07:6B98 $21 $0C $D2
    ld   [hl], $10                                ;; 07:6B9B $36 $10
    ld   hl, wD207                                ;; 07:6B9D $21 $07 $D2
    ld   [hl], $00                                ;; 07:6BA0 $36 $00
    ret                                           ;; 07:6BA2 $C9

func_007_6BA3::
    call func_007_6EF0                            ;; 07:6BA3 $CD $F0 $6E
    ld   hl, wD208                                ;; 07:6BA6 $21 $08 $D2
    ld   [hl], b                                  ;; 07:6BA9 $70
    ld   hl, wD209                                ;; 07:6BAA $21 $09 $D2
    ld   [hl], b                                  ;; 07:6BAD $70
    ld   hl, wD20A                                ;; 07:6BAE $21 $0A $D2
    ld   [hl], $F8                                ;; 07:6BB1 $36 $F8
    ld   hl, wD20B                                ;; 07:6BB3 $21 $0B $D2
    ld   [hl], $F8                                ;; 07:6BB6 $36 $F8
    ld   hl, wD20D                                ;; 07:6BB8 $21 $0D $D2
    ld   [hl], $F0                                ;; 07:6BBB $36 $F0
    ld   hl, wD20C                                ;; 07:6BBD $21 $0C $D2
    ld   [hl], $10                                ;; 07:6BC0 $36 $10
    ld   hl, wD207                                ;; 07:6BC2 $21 $07 $D2
    ld   [hl], $00                                ;; 07:6BC5 $36 $00
    ret                                           ;; 07:6BC7 $C9

func_007_6BC8::
    call func_007_6EA2                            ;; 07:6BC8 $CD $A2 $6E
    call GetEntityTransitionCountdown             ;; 07:6BCB $CD $05 $0C
    ret  nz                                       ;; 07:6BCE $C0

    call GetRandomByte                            ;; 07:6BCF $CD $0D $28
    and  $1F                                      ;; 07:6BD2 $E6 $1F
    add  $30                                      ;; 07:6BD4 $C6 $30
    ld   [hl], a                                  ;; 07:6BD6 $77
    ld   a, $08                                   ;; 07:6BD7 $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 07:6BD9 $CD $AA $3B
    call IncrementEntityState                     ;; 07:6BDC $CD $12 $3B

label_007_6BDF:
    call GetEntityXDistanceToLink_07              ;; 07:6BDF $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ;; 07:6BE2 $21 $80 $C3
    add  hl, bc                                   ;; 07:6BE5 $09
    ld   [hl], e                                  ;; 07:6BE6 $73

func_007_6BE7::
    call func_007_6B7D                            ;; 07:6BE7 $CD $7D $6B
    ld   hl, wEntitiesDirectionTable              ;; 07:6BEA $21 $80 $C3
    add  hl, bc                                   ;; 07:6BED $09
    ld   a, [hl]                                  ;; 07:6BEE $7E
    and  a                                        ;; 07:6BEF $A7
    ret  nz                                       ;; 07:6BF0 $C0

    jp   func_007_6BA3                            ;; 07:6BF1 $C3 $A3 $6B

func_007_6BF4::
    call func_007_6EA2                            ;; 07:6BF4 $CD $A2 $6E
    call GetEntityXDistanceToLink_07              ;; 07:6BF7 $CD $5D $7E
    add  $20                                      ;; 07:6BFA $C6 $20
    cp   $40                                      ;; 07:6BFC $FE $40
    jr   nc, .jr_6C14                             ;; 07:6BFE $30 $14

    call GetEntityYDistanceToLink_07              ;; 07:6C00 $CD $6D $7E
    add  $1C                                      ;; 07:6C03 $C6 $1C
    cp   $38                                      ;; 07:6C05 $FE $38
    jr   nc, .jr_6C14                             ;; 07:6C07 $30 $0B

    call IncrementEntityState                     ;; 07:6C09 $CD $12 $3B
    ld   [hl], $06                                ;; 07:6C0C $36 $06
    call GetEntityTransitionCountdown             ;; 07:6C0E $CD $05 $0C
    ld   [hl], $30                                ;; 07:6C11 $36 $30
    ret                                           ;; 07:6C13 $C9

.jr_6C14
    call GetEntityTransitionCountdown             ;; 07:6C14 $CD $05 $0C
    jr   nz, .jr_6C27                             ;; 07:6C17 $20 $0E

    call GetRandomByte                            ;; 07:6C19 $CD $0D $28
    and  $0F                                      ;; 07:6C1C $E6 $0F
    add  $10                                      ;; 07:6C1E $C6 $10
    ld   [hl], a                                  ;; 07:6C20 $77
    call IncrementEntityState                     ;; 07:6C21 $CD $12 $3B
    ld   [hl], $04                                ;; 07:6C24 $36 $04
    ret                                           ;; 07:6C26 $C9

.jr_6C27
    and  $0F                                      ;; 07:6C27 $E6 $0F
    jr   nz, func_007_6C33                        ;; 07:6C29 $20 $08

    ld   a, [wD209]                               ;; 07:6C2B $FA $09 $D2
    xor  $01                                      ;; 07:6C2E $EE $01
    ld   [wD209], a                               ;; 07:6C30 $EA $09 $D2

func_007_6C33::
    call UpdateEntityPosWithSpeed_07              ;; 07:6C33 $CD $0A $7E
    jp   ApplyEntityInteractionWithBackground_trampoline ;; 07:6C36 $C3 $23 $3B

func_007_6C39::
    call GetEntityTransitionCountdown             ;; 07:6C39 $CD $05 $0C
    jr   nz, jr_007_6C55                          ;; 07:6C3C $20 $17

func_007_6C3E::
    call GetEntityTransitionCountdown             ;; 07:6C3E $CD $05 $0C
    ld   [hl], $20                                ;; 07:6C41 $36 $20
    call IncrementEntityState                     ;; 07:6C43 $CD $12 $3B
    ld   [hl], $04                                ;; 07:6C46 $36 $04
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:6C48 $21 $50 $C3
    add  hl, bc                                   ;; 07:6C4B $09
    set  7, [hl]                                  ;; 07:6C4C $CB $FE
    ld   hl, wEntitiesOptions1Table               ;; 07:6C4E $21 $30 $C4
    add  hl, bc                                   ;; 07:6C51 $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 07:6C52 $CB $B6
    ret                                           ;; 07:6C54 $C9

jr_007_6C55:
    ld   hl, wEntitiesDirectionTable              ;; 07:6C55 $21 $80 $C3
    add  hl, bc                                   ;; 07:6C58 $09
    ld   a, [hl]                                  ;; 07:6C59 $7E
    and  a                                        ;; 07:6C5A $A7
    jr   nz, jr_007_6CB8                          ;; 07:6C5B $20 $5B

    call GetEntityTransitionCountdown             ;; 07:6C5D $CD $05 $0C
    cp   $18                                      ;; 07:6C60 $FE $18
    jr   c, .jr_6C77                              ;; 07:6C62 $38 $13

    call func_007_6BA3                            ;; 07:6C64 $CD $A3 $6B
    ld   a, $08                                   ;; 07:6C67 $3E $08
    ld   [wD20C], a                               ;; 07:6C69 $EA $0C $D2
    ld   a, $E0                                   ;; 07:6C6C $3E $E0
    ld   [wD20D], a                               ;; 07:6C6E $EA $0D $D2
    ld   a, $01                                   ;; 07:6C71 $3E $01
    ld   [wD207], a                               ;; 07:6C73 $EA $07 $D2
    ret                                           ;; 07:6C76 $C9

.jr_6C77
    cp   $10                                      ;; 07:6C77 $FE $10
    jr   c, jr_007_6C9E                           ;; 07:6C79 $38 $23

    cp   $17                                      ;; 07:6C7B $FE $17
    jr   nz, .jr_6C89                             ;; 07:6C7D $20 $0A

    ld   a, NOISE_SFX_WEAPON_SWING                ;; 07:6C7F $3E $27
    ldh  [hNoiseSfx], a                           ;; 07:6C81 $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 07:6C83 $21 $00 $C3
    add  hl, bc                                   ;; 07:6C86 $09
    ld   [hl], $10                                ;; 07:6C87 $36 $10

.jr_6C89
    ld   a, $FF                                   ;; 07:6C89 $3E $FF
    ld   [wD207], a                               ;; 07:6C8B $EA $07 $D2
    ld   a, $F0                                   ;; 07:6C8E $3E $F0
    ld   [wD20A], a                               ;; 07:6C90 $EA $0A $D2
    ld   a, $F4                                   ;; 07:6C93 $3E $F4
    ld   [wD20B], a                               ;; 07:6C95 $EA $0B $D2
    ld   a, $01                                   ;; 07:6C98 $3E $01
    ld   [wD208], a                               ;; 07:6C9A $EA $08 $D2
    ret                                           ;; 07:6C9D $C9

jr_007_6C9E:
    ld   a, $03                                   ;; 07:6C9E $3E $03
    ld   [wD207], a                               ;; 07:6CA0 $EA $07 $D2
    ld   a, $F8                                   ;; 07:6CA3 $3E $F8
    ld   [wD20C], a                               ;; 07:6CA5 $EA $0C $D2
    ld   a, $08                                   ;; 07:6CA8 $3E $08
    ld   [wD20D], a                               ;; 07:6CAA $EA $0D $D2
    ld   a, $F0                                   ;; 07:6CAD $3E $F0
    ld   [wD20A], a                               ;; 07:6CAF $EA $0A $D2
    ld   a, $F0                                   ;; 07:6CB2 $3E $F0
    ld   [wD20B], a                               ;; 07:6CB4 $EA $0B $D2
    ret                                           ;; 07:6CB7 $C9

jr_007_6CB8:
    call GetEntityTransitionCountdown             ;; 07:6CB8 $CD $05 $0C
    cp   $18                                      ;; 07:6CBB $FE $18
    jr   c, .jr_6CD7                              ;; 07:6CBD $38 $18

    call func_007_6B7D                            ;; 07:6CBF $CD $7D $6B
    ld   a, $01                                   ;; 07:6CC2 $3E $01
    ld   [wD209], a                               ;; 07:6CC4 $EA $09 $D2
    ld   a, $F8                                   ;; 07:6CC7 $3E $F8
    ld   [wD20C], a                               ;; 07:6CC9 $EA $0C $D2
    ld   a, $E8                                   ;; 07:6CCC $3E $E8
    ld   [wD20D], a                               ;; 07:6CCE $EA $0D $D2
    ld   a, $00                                   ;; 07:6CD1 $3E $00
    ld   [wD207], a                               ;; 07:6CD3 $EA $07 $D2
    ret                                           ;; 07:6CD6 $C9

.jr_6CD7
    cp   $10                                      ;; 07:6CD7 $FE $10
    jr   c, jr_007_6CFE                           ;; 07:6CD9 $38 $23

    cp   $17                                      ;; 07:6CDB $FE $17
    jr   nz, .jr_6CE9                             ;; 07:6CDD $20 $0A

    ld   a, NOISE_SFX_WEAPON_SWING                ;; 07:6CDF $3E $27
    ldh  [hNoiseSfx], a                           ;; 07:6CE1 $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 07:6CE3 $21 $00 $C3
    add  hl, bc                                   ;; 07:6CE6 $09
    ld   [hl], $10                                ;; 07:6CE7 $36 $10

.jr_6CE9
    ld   a, $FF                                   ;; 07:6CE9 $3E $FF
    ld   [wD207], a                               ;; 07:6CEB $EA $07 $D2
    ld   a, $F0                                   ;; 07:6CEE $3E $F0
    ld   [wD20A], a                               ;; 07:6CF0 $EA $0A $D2
    ld   a, $F0                                   ;; 07:6CF3 $3E $F0
    ld   [wD20B], a                               ;; 07:6CF5 $EA $0B $D2
    ld   a, $00                                   ;; 07:6CF8 $3E $00
    ld   [wD208], a                               ;; 07:6CFA $EA $08 $D2
    ret                                           ;; 07:6CFD $C9

jr_007_6CFE:
    ld   a, $02                                   ;; 07:6CFE $3E $02
    ld   [wD207], a                               ;; 07:6D00 $EA $07 $D2
    ld   a, $10                                   ;; 07:6D03 $3E $10
    ld   [wD20C], a                               ;; 07:6D05 $EA $0C $D2
    ld   a, $08                                   ;; 07:6D08 $3E $08
    ld   [wD20D], a                               ;; 07:6D0A $EA $0D $D2
    ld   a, $F0                                   ;; 07:6D0D $3E $F0
    ld   [wD20A], a                               ;; 07:6D0F $EA $0A $D2
    ld   a, $EC                                   ;; 07:6D12 $3E $EC
    ld   [wD20B], a                               ;; 07:6D14 $EA $0B $D2
    ret                                           ;; 07:6D17 $C9

func_007_6D18::
    call func_007_6BE7                            ;; 07:6D18 $CD $E7 $6B
    call GetEntityTransitionCountdown             ;; 07:6D1B $CD $05 $0C
    jr   nz, jr_007_6D46                          ;; 07:6D1E $20 $26

    call IncrementEntityState                     ;; 07:6D20 $CD $12 $3B
    call func_007_733F                            ;; 07:6D23 $CD $3F $73
    ld   hl, wEntitiesPrivateState1Table          ;; 07:6D26 $21 $B0 $C2
    add  hl, bc                                   ;; 07:6D29 $09
    ld   a, [hl]                                  ;; 07:6D2A $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6D2B $21 $20 $C3
    add  hl, bc                                   ;; 07:6D2E $09
    ld   [hl], $30                                ;; 07:6D2F $36 $30
    and  a                                        ;; 07:6D31 $A7
    jr   nz, .jr_6D3B                             ;; 07:6D32 $20 $07

    ld   [hl], $28                                ;; 07:6D34 $36 $28
    ld   a, $18                                   ;; 07:6D36 $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ;; 07:6D38 $C3 $AA $3B

.jr_6D3B
    ld   a, $08                                   ;; 07:6D3B $3E $08
    call ApplyVectorTowardsLink_trampoline        ;; 07:6D3D $CD $AA $3B
    call GetEntitySpeedYAddress                   ;; 07:6D40 $CD $05 $40
    ld   [hl], $F0                                ;; 07:6D43 $36 $F0
    ret                                           ;; 07:6D45 $C9

jr_007_6D46:
    ld   a, [wD20E]                               ;; 07:6D46 $FA $0E $D2
    add  $02                                      ;; 07:6D49 $C6 $02
    ld   [wD20E], a                               ;; 07:6D4B $EA $0E $D2
    ld   a, [wD20B]                               ;; 07:6D4E $FA $0B $D2
    add  $02                                      ;; 07:6D51 $C6 $02
    ld   [wD20B], a                               ;; 07:6D53 $EA $0B $D2
    ld   a, [wD20D]                               ;; 07:6D56 $FA $0D $D2
    add  $02                                      ;; 07:6D59 $C6 $02
    ld   [wD20D], a                               ;; 07:6D5B $EA $0D $D2
    ret                                           ;; 07:6D5E $C9

func_007_6D5F::
    call GetEntityTransitionCountdown             ;; 07:6D5F $CD $05 $0C
    jr   z, jr_007_6D70                           ;; 07:6D62 $28 $0C

    dec  a                                        ;; 07:6D64 $3D
    jr   nz, .jr_6D6A                             ;; 07:6D65 $20 $03

    call func_007_6C3E                            ;; 07:6D67 $CD $3E $6C

.jr_6D6A
    call func_007_6BE7                            ;; 07:6D6A $CD $E7 $6B
    jp   jr_007_6D46                              ;; 07:6D6D $C3 $46 $6D

jr_007_6D70:
    call func_007_6C33                            ;; 07:6D70 $CD $33 $6C
    ldh  a, [hMultiPurposeG]                      ;; 07:6D73 $F0 $E8
    and  a                                        ;; 07:6D75 $A7
    ret  z                                        ;; 07:6D76 $C8

    call GetEntityTransitionCountdown             ;; 07:6D77 $CD $05 $0C
    ld   [hl], $10                                ;; 07:6D7A $36 $10
    jp   ret_007_6B15                             ;; 07:6D7C $C3 $15 $6B

func_007_6D7F::
    ldh  a, [hMultiPurposeG]                      ;; 07:6D7F $F0 $E8
    and  a                                        ;; 07:6D81 $A7
    jr   z, .jr_6D9C                              ;; 07:6D82 $28 $18

    call IncrementEntityState                     ;; 07:6D84 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 07:6D87 $CD $05 $0C
    ld   [hl], $20                                ;; 07:6D8A $36 $20
    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:6D8C $21 $50 $C3
    add  hl, bc                                   ;; 07:6D8F $09
    res  7, [hl]                                  ;; 07:6D90 $CB $BE
    ld   hl, wEntitiesOptions1Table               ;; 07:6D92 $21 $30 $C4
    add  hl, bc                                   ;; 07:6D95 $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ;; 07:6D96 $CB $F6
    ld   a, JINGLE_STALFOS_COLLAPSE               ;; 07:6D98 $3E $28
    ldh  [hJingle], a                             ;; 07:6D9A $E0 $F2

.jr_6D9C
    jp   func_007_6C33                            ;; 07:6D9C $C3 $33 $6C

func_007_6D9F::
    call GetEntityTransitionCountdown             ;; 07:6D9F $CD $05 $0C
    jr   nz, .jr_6DA9                             ;; 07:6DA2 $20 $05

    ld   [hl], $C0                                ;; 07:6DA4 $36 $C0
    jp   IncrementEntityState                     ;; 07:6DA6 $C3 $12 $3B

.jr_6DA9
    ld   hl, wD20B                                ;; 07:6DA9 $21 $0B $D2
    ld   a, [hl]                                  ;; 07:6DAC $7E
    sub  $03                                      ;; 07:6DAD $D6 $03
    jr   z, jr_007_6DB8                           ;; 07:6DAF $28 $07

    bit  7, a                                     ;; 07:6DB1 $CB $7F
    jr   z, .jr_6DB7                              ;; 07:6DB3 $28 $02

    inc  [hl]                                     ;; 07:6DB5 $34
    inc  [hl]                                     ;; 07:6DB6 $34

.jr_6DB7
    dec  [hl]                                     ;; 07:6DB7 $35

jr_007_6DB8:
    ld   hl, wD20D                                ;; 07:6DB8 $21 $0D $D2
    ld   a, [hl]                                  ;; 07:6DBB $7E
    sub  $03                                      ;; 07:6DBC $D6 $03
    jr   z, jr_007_6DC7                           ;; 07:6DBE $28 $07

    bit  7, a                                     ;; 07:6DC0 $CB $7F
    jr   z, .jr_6DC6                              ;; 07:6DC2 $28 $02

    inc  [hl]                                     ;; 07:6DC4 $34
    inc  [hl]                                     ;; 07:6DC5 $34

.jr_6DC6
    dec  [hl]                                     ;; 07:6DC6 $35

jr_007_6DC7:
    call GetEntityTransitionCountdown             ;; 07:6DC7 $CD $05 $0C
    cp   $14                                      ;; 07:6DCA $FE $14
    jr   nc, .ret_6DD8                            ;; 07:6DCC $30 $0A

    ld   a, [wD20E]                               ;; 07:6DCE $FA $0E $D2
    and  a                                        ;; 07:6DD1 $A7
    jr   z, .ret_6DD8                             ;; 07:6DD2 $28 $04

    inc  a                                        ;; 07:6DD4 $3C
    ld   [wD20E], a                               ;; 07:6DD5 $EA $0E $D2

.ret_6DD8
    ret                                           ;; 07:6DD8 $C9

func_007_6DD9::
    call GetEntityTransitionCountdown             ;; 07:6DD9 $CD $05 $0C
    jr   nz, .jr_6DE3                             ;; 07:6DDC $20 $05

    ld   [hl], $30                                ;; 07:6DDE $36 $30
    jp   IncrementEntityState                     ;; 07:6DE0 $C3 $12 $3B

.jr_6DE3
    cp   $30                                      ;; 07:6DE3 $FE $30
    jr   nc, .ret_6DF5                            ;; 07:6DE5 $30 $0E

    and  $03                                      ;; 07:6DE7 $E6 $03
    jr   nz, .ret_6DF5                            ;; 07:6DE9 $20 $0A

    ld   a, [wD20E]                               ;; 07:6DEB $FA $0E $D2
    add  $02                                      ;; 07:6DEE $C6 $02
    cpl                                           ;; 07:6DF0 $2F
    inc  a                                        ;; 07:6DF1 $3C
    ld   [wD20E], a                               ;; 07:6DF2 $EA $0E $D2

.ret_6DF5
    ret                                           ;; 07:6DF5 $C9

func_007_6DF6::
    ld   a, [wD20E]                               ;; 07:6DF6 $FA $0E $D2
    cp   $F0                                      ;; 07:6DF9 $FE $F0
    jr   z, .jr_6E01                              ;; 07:6DFB $28 $04

    dec  a                                        ;; 07:6DFD $3D
    ld   [wD20E], a                               ;; 07:6DFE $EA $0E $D2

.jr_6E01
    call GetEntityTransitionCountdown             ;; 07:6E01 $CD $05 $0C
    jr   nz, jr_007_6E35                          ;; 07:6E04 $20 $2F

    ld   e, $FF                                   ;; 07:6E06 $1E $FF
    ldh  a, [hMapRoom]                            ;; 07:6E08 $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_4    ;; 07:6E0A $FE $80
    jr   z, .jr_6E16                              ;; 07:6E0C $28 $08
    ld   e, $03                                   ;; 07:6E0E $1E $03
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_1    ;; 07:6E10 $FE $95
    jr   z, .jr_6E16                              ;; 07:6E12 $28 $02
    ld   e, $02                                   ;; 07:6E14 $1E $02

.jr_6E16
    ld   hl, wEntitiesInertiaTable                ;; 07:6E16 $21 $D0 $C3
    add  hl, bc                                   ;; 07:6E19 $09
    ld   a, [hl]                                  ;; 07:6E1A $7E
    cp   e                                        ;; 07:6E1B $BB
    jr   c, .jr_6E32                              ;; 07:6E1C $38 $14

    ld   hl, wEntitiesHitboxFlagsTable            ;; 07:6E1E $21 $50 $C3
    add  hl, bc                                   ;; 07:6E21 $09
    set  7, [hl]                                  ;; 07:6E22 $CB $FE
    call IncrementEntityState                     ;; 07:6E24 $CD $12 $3B
    call_open_dialog Dialog113                    ;; 07:6E27
    call GetEntityTransitionCountdown             ;; 07:6E2C $CD $05 $0C
    ld   [hl], $04                                ;; 07:6E2F $36 $04
    ret                                           ;; 07:6E31 $C9

.jr_6E32
    jp   func_007_6C3E                            ;; 07:6E32 $C3 $3E $6C

jr_007_6E35:
    cp   $24                                      ;; 07:6E35 $FE $24
    jr   nc, ret_007_6E57                         ;; 07:6E37 $30 $1E

    ld   hl, wD20B                                ;; 07:6E39 $21 $0B $D2
    ld   a, [hl]                                  ;; 07:6E3C $7E
    sub  $F8                                      ;; 07:6E3D $D6 $F8
    jr   z, jr_007_6E48                           ;; 07:6E3F $28 $07

    bit  7, a                                     ;; 07:6E41 $CB $7F
    jr   z, .jr_6E47                              ;; 07:6E43 $28 $02

    inc  [hl]                                     ;; 07:6E45 $34
    inc  [hl]                                     ;; 07:6E46 $34

.jr_6E47
    dec  [hl]                                     ;; 07:6E47 $35

jr_007_6E48:
    ld   hl, wD20D                                ;; 07:6E48 $21 $0D $D2
    ld   a, [hl]                                  ;; 07:6E4B $7E
    sub  $F0                                      ;; 07:6E4C $D6 $F0
    jr   z, ret_007_6E57                          ;; 07:6E4E $28 $07

    bit  7, a                                     ;; 07:6E50 $CB $7F
    jr   z, .jr_6E56                              ;; 07:6E52 $28 $02

    inc  [hl]                                     ;; 07:6E54 $34
    inc  [hl]                                     ;; 07:6E55 $34

.jr_6E56
    dec  [hl]                                     ;; 07:6E56 $35

ret_007_6E57:
    ret                                           ;; 07:6E57 $C9

func_007_6E58::
    call func_007_6BE7                            ;; 07:6E58 $CD $E7 $6B
    call GetEntityTransitionCountdown             ;; 07:6E5B $CD $05 $0C
    jr   z, jr_007_6E6A                           ;; 07:6E5E $28 $0A

    dec  a                                        ;; 07:6E60 $3D
    jr   nz, .jr_6E67                             ;; 07:6E61 $20 $04

    ld   a, NOISE_SFX_MINIBOSS_FLEE               ;; 07:6E63 $3E $3F
    ldh  [hNoiseSfx], a                           ;; 07:6E65 $E0 $F4

.jr_6E67
    jp   jr_007_6D46                              ;; 07:6E67 $C3 $46 $6D

jr_007_6E6A:
    ld   hl, wEntitiesSpeedZTable                 ;; 07:6E6A $21 $20 $C3
    add  hl, bc                                   ;; 07:6E6D $09
    ld   [hl], $30                                ;; 07:6E6E $36 $30
    ld   hl, wEntitiesPosZTable                   ;; 07:6E70 $21 $10 $C3
    add  hl, bc                                   ;; 07:6E73 $09
    ld   a, [hl]                                  ;; 07:6E74 $7E
    cp   $78                                      ;; 07:6E75 $FE $78
    jr   c, ret_007_6EA1                          ;; 07:6E77 $38 $28

    call label_27DD                               ;; 07:6E79 $CD $DD $27
    call ClearEntityStatus_07                     ;; 07:6E7C $CD $A4 $7E

; Also used by smashable pillar to set ROOM_STATUS_EVENT_2 on the current room.
func_007_6E7F::
    ld   hl, wIndoorARoomStatus                   ;; 07:6E7F $21 $00 $D9
    ldh  a, [hMapRoom]                            ;; 07:6E82 $F0 $F6
    cp   UNKNOWN_ROOM_FF                          ;; 07:6E84 $FE $FF
    jr   nz, .jr_6E8D                             ;; 07:6E86 $20 $05

    ld   hl, wColorDungeonRoomStatus              ;; 07:6E88 $21 $E0 $DD
    jr   jr_007_6E9A                              ;; 07:6E8B $18 $0D

.jr_6E8D
    ld   e, a                                     ;; 07:6E8D $5F
    ld   d, b                                     ;; 07:6E8E $50

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ;; 07:6E8F $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 07:6E91 $FE $1A
    jr   nc, jr_007_6E9A                          ;; 07:6E93 $30 $05
    cp   MAP_INDOORS_B_START                      ;; 07:6E95 $FE $06
    jr   c, jr_007_6E9A                           ;; 07:6E97 $38 $01
    ; increase offset in wIndoorARoomStatus by 0x100
    inc  d                                        ;; 07:6E99 $14
jr_007_6E9A:

    add  hl, de                                   ;; 07:6E9A $19
    ld   a, [hl]                                  ;; 07:6E9B $7E
    or   ROOM_STATUS_EVENT_2                      ;; 07:6E9C $F6 $20
    ld   [hl], a                                  ;; 07:6E9E $77
    ldh  [hRoomStatus], a                         ;; 07:6E9F $E0 $F8

ret_007_6EA1:
    ret                                           ;; 07:6EA1 $C9

func_007_6EA2::
    ld   hl, wEntitiesPrivateState1Table          ;; 07:6EA2 $21 $B0 $C2
    add  hl, bc                                   ;; 07:6EA5 $09
    ld   [hl], b                                  ;; 07:6EA6 $70
    call GetEntityXDistanceToLink_07              ;; 07:6EA7 $CD $5D $7E
    add  $30                                      ;; 07:6EAA $C6 $30
    cp   $60                                      ;; 07:6EAC $FE $60
    jr   nc, .jr_6EC3                             ;; 07:6EAE $30 $13

    call GetEntityYDistanceToLink_07              ;; 07:6EB0 $CD $6D $7E
    add  $30                                      ;; 07:6EB3 $C6 $30
    cp   $60                                      ;; 07:6EB5 $FE $60
    jr   nc, .jr_6EC3                             ;; 07:6EB7 $30 $0A

    ld   a, e                                     ;; 07:6EB9 $7B
    cp   $02                                      ;; 07:6EBA $FE $02
    ret  nz                                       ;; 07:6EBC $C0

    ld   hl, wEntitiesPrivateState1Table          ;; 07:6EBD $21 $B0 $C2
    add  hl, bc                                   ;; 07:6EC0 $09
    ld   [hl], $01                                ;; 07:6EC1 $36 $01

.jr_6EC3
    call IncrementEntityState                     ;; 07:6EC3 $CD $12 $3B
    ld   [hl], $07                                ;; 07:6EC6 $36 $07
    call GetEntityTransitionCountdown             ;; 07:6EC8 $CD $05 $0C
    ld   [hl], $20                                ;; 07:6ECB $36 $20
    jp   label_007_6BDF                           ;; 07:6ECD $C3 $DF $6B

func_007_6ED0::
    ld   hl, wEntitiesPosZTable                   ;; 07:6ED0 $21 $10 $C3
    add  hl, bc                                   ;; 07:6ED3 $09
    ld   [hl], $7F                                ;; 07:6ED4 $36 $7F
    call GetEntityTransitionCountdown             ;; 07:6ED6 $CD $05 $0C
    ld   [hl], $80                                ;; 07:6ED9 $36 $80
    ldh  a, [hDefaultMusicTrack]                  ;; 07:6EDB $F0 $B0
    ld   hl, wEntitiesPrivateState5Table          ;; 07:6EDD $21 $90 $C3
    add  hl, bc                                   ;; 07:6EE0 $09
    ld   [hl], a                                  ;; 07:6EE1 $77
    ld   hl, wEntitiesHealthTable                 ;; 07:6EE2 $21 $60 $C3
    add  hl, bc                                   ;; 07:6EE5 $09
    ld   [hl], $FF                                ;; 07:6EE6 $36 $FF
    ldh  a, [hMapRoom]                            ;; 07:6EE8 $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_4    ;; 07:6EEA $FE $80
    jr   nz, func_007_6EF0                        ;; 07:6EEC $20 $02

    ld   [hl], $C0                                ;; 07:6EEE $36 $C0

func_007_6EF0::
    ld   a, $F8                                   ;; 07:6EF0 $3E $F8
    ld   [wD20A], a                               ;; 07:6EF2 $EA $0A $D2
    ld   a, $F8                                   ;; 07:6EF5 $3E $F8
    ld   [wD20B], a                               ;; 07:6EF7 $EA $0B $D2
    ld   a, $F0                                   ;; 07:6EFA $3E $F0
    ld   [wD20E], a                               ;; 07:6EFC $EA $0E $D2
    ld   a, $00                                   ;; 07:6EFF $3E $00
    ld   [wD207], a                               ;; 07:6F01 $EA $07 $D2
    ld   [wD208], a                               ;; 07:6F04 $EA $08 $D2
    ld   [wD209], a                               ;; 07:6F07 $EA $09 $D2
    ld   a, $10                                   ;; 07:6F0A $3E $10
    ld   [wD20C], a                               ;; 07:6F0C $EA $0C $D2
    ld   a, $F0                                   ;; 07:6F0F $3E $F0
    ld   [wD20D], a                               ;; 07:6F11 $EA $0D $D2
    ret                                           ;; 07:6F14 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown041SpriteVariants::
.variant0
    db $70, $01
    db $70, $21

Data_007_6F19::
    db   $00, $F8, $60, $00, $00, $00, $62, $00, $00, $08, $64, $00, $00, $10, $66, $00
    db   $00, $F8, $66, $20, $00, $00, $64, $20, $00, $08, $62, $20, $00, $10, $60, $20

Data_007_6F39::
    db   $00, $F8, $68, $00, $00, $00, $6A, $00, $00, $08, $6C, $00, $00, $10, $6E, $00
    db   $00, $F8, $6E, $20, $00, $00, $6C, $20, $00, $08, $6A, $20, $00, $10, $68, $20

Data_007_6F59::
    db   $00, $00, $72, $03, $F8, $08, $74, $03, $F8, $00, $74, $23, $00, $08, $72, $23
    db   $00, $00, $72, $43, $08, $08, $74, $43, $08, $00, $74, $63, $00, $08, $72, $63

Data_007_6F79::
    db   $10, $00, $76, $00, $10, $08, $78, $00, $10, $10, $7A, $00, $08, $18, $7C, $00
    db   $F8, $18, $7E, $00

Data_007_6F8D::
    db   $10, $08, $76, $20, $10, $00, $78, $20, $10, $F8, $7A, $20, $08, $F0, $7C, $20
    db   $F8, $F0, $7E, $20

Data_007_6FA1::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_007_6FB1::
    ld   hl, wEntitiesPosZTable                   ;; 07:6FB1 $21 $10 $C3
    add  hl, bc                                   ;; 07:6FB4 $09
    ld   a, [hl]                                  ;; 07:6FB5 $7E
    cp   $70                                      ;; 07:6FB6 $FE $70
    ret  nc                                       ;; 07:6FB8 $D0

    call func_007_6FE6                            ;; 07:6FB9 $CD $E6 $6F
    call func_007_7015                            ;; 07:6FBC $CD $15 $70
    call func_007_703A                            ;; 07:6FBF $CD $3A $70
    call func_007_706F                            ;; 07:6FC2 $CD $6F $70
    call func_007_7090                            ;; 07:6FC5 $CD $90 $70
    ld   hl, wEntitiesPosZTable                   ;; 07:6FC8 $21 $10 $C3
    add  hl, bc                                   ;; 07:6FCB $09
    ld   a, [hl]                                  ;; 07:6FCC $7E
    and  a                                        ;; 07:6FCD $A7
    jr   z, .jr_6FE3                              ;; 07:6FCE $28 $13

    ldh  a, [hActiveEntityPosY]                   ;; 07:6FD0 $F0 $EF
    sub  $02                                      ;; 07:6FD2 $D6 $02
    ldh  [hActiveEntityVisualPosY], a             ;; 07:6FD4 $E0 $EC
    ld   hl, Data_007_6FA1                        ;; 07:6FD6 $21 $A1 $6F
    ld   c, $04                                   ;; 07:6FD9 $0E $04
    call RenderActiveEntitySpritesRect            ;; 07:6FDB $CD $E6 $3C
    ld   a, $04                                   ;; 07:6FDE $3E $04
    call func_015_7964_trampoline                 ;; 07:6FE0 $CD $A0 $3D

.jr_6FE3
    jp   CopyEntityPositionToActivePosition       ;; 07:6FE3 $C3 $8A $3D

func_007_6FE6::
    ld   a, [wD20C]                               ;; 07:6FE6 $FA $0C $D2
    ld   hl, hActiveEntityPosX                    ;; 07:6FE9 $21 $EE $FF
    add  [hl]                                     ;; 07:6FEC $86
    ld   [hl], a                                  ;; 07:6FED $77
    ld   a, [wD20D]                               ;; 07:6FEE $FA $0D $D2
    ld   hl, hActiveEntityVisualPosY              ;; 07:6FF1 $21 $EC $FF
    add  [hl]                                     ;; 07:6FF4 $86
    ld   [hl], a                                  ;; 07:6FF5 $77
    ld   a, [wD207]                               ;; 07:6FF6 $FA $07 $D2
    cp   $FF                                      ;; 07:6FF9 $FE $FF
    jr   z, .jr_7012                              ;; 07:6FFB $28 $15

    rla                                           ;; 07:6FFD $17
    rla                                           ;; 07:6FFE $17
    rla                                           ;; 07:6FFF $17
    and  $F8                                      ;; 07:7000 $E6 $F8
    ld   e, a                                     ;; 07:7002 $5F
    ld   d, b                                     ;; 07:7003 $50
    ld   hl, Data_007_6F59                        ;; 07:7004 $21 $59 $6F
    add  hl, de                                   ;; 07:7007 $19
    ld   c, $02                                   ;; 07:7008 $0E $02
    call RenderActiveEntitySpritesRect            ;; 07:700A $CD $E6 $3C
    ld   a, $02                                   ;; 07:700D $3E $02
    jp   label_007_7034                           ;; 07:700F $C3 $34 $70

.jr_7012
    jp   CopyEntityPositionToActivePosition       ;; 07:7012 $C3 $8A $3D

func_007_7015::
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 07:7015 $21 $00 $C3
    add  hl, bc                                   ;; 07:7018 $09
    ld   a, [hl]                                  ;; 07:7019 $7E
    and  a                                        ;; 07:701A $A7
    ret  z                                        ;; 07:701B $C8

    call func_007_70B7                            ;; 07:701C $CD $B7 $70
    ld   hl, wEntitiesDirectionTable              ;; 07:701F $21 $80 $C3
    add  hl, bc                                   ;; 07:7022 $09
    ld   a, [hl]                                  ;; 07:7023 $7E
    ld   hl, Data_007_6F79                        ;; 07:7024 $21 $79 $6F
    and  a                                        ;; 07:7027 $A7
    jr   z, .jr_702D                              ;; 07:7028 $28 $03

    ld   hl, Data_007_6F8D                        ;; 07:702A $21 $8D $6F

.jr_702D
    ld   c, $05                                   ;; 07:702D $0E $05
    call RenderActiveEntitySpritesRect            ;; 07:702F $CD $E6 $3C
    ld   a, $05                                   ;; 07:7032 $3E $05

label_007_7034:
    call func_015_7964_trampoline                 ;; 07:7034 $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ;; 07:7037 $C3 $8A $3D

func_007_703A::
    ld   a, [wD20A]                               ;; 07:703A $FA $0A $D2
    ld   hl, hActiveEntityPosX                    ;; 07:703D $21 $EE $FF
    add  [hl]                                     ;; 07:7040 $86
    ld   [hl], a                                  ;; 07:7041 $77
    ld   a, [wD20A]                               ;; 07:7042 $FA $0A $D2
    add  $0C                                      ;; 07:7045 $C6 $0C
    ld   [wD5C0], a                               ;; 07:7047 $EA $C0 $D5
    ld   a, [wD20B]                               ;; 07:704A $FA $0B $D2
    ld   hl, hActiveEntityVisualPosY              ;; 07:704D $21 $EC $FF
    add  [hl]                                     ;; 07:7050 $86
    ld   [hl], a                                  ;; 07:7051 $77
    ld   a, [wD20B]                               ;; 07:7052 $FA $0B $D2
    add  $08                                      ;; 07:7055 $C6 $08
    ld   [wD5C2], a                               ;; 07:7057 $EA $C2 $D5
    ld   a, $08                                   ;; 07:705A $3E $08
    ld   [wD5C0+1], a                             ;; 07:705C $EA $C1 $D5
    ld   a, $06                                   ;; 07:705F $3E $06
    ld   [wD5C2+1], a                             ;; 07:7061 $EA $C3 $D5
    ld   de, Unknown041SpriteVariants             ;; 07:7064 $11 $15 $6F
    call RenderActiveEntitySpritesPair            ;; 07:7067 $CD $C0 $3B
    ld   a, $02                                   ;; 07:706A $3E $02
    jp   label_007_7034                           ;; 07:706C $C3 $34 $70

func_007_706F::
    ld   a, [wD20E]                               ;; 07:706F $FA $0E $D2
    ld   hl, hActiveEntityVisualPosY              ;; 07:7072 $21 $EC $FF
    add  [hl]                                     ;; 07:7075 $86
    ld   [hl], a                                  ;; 07:7076 $77
    ld   a, [wD208]                               ;; 07:7077 $FA $08 $D2
    rla                                           ;; 07:707A $17
    rla                                           ;; 07:707B $17
    rla                                           ;; 07:707C $17
    rla                                           ;; 07:707D $17
    and  $F0                                      ;; 07:707E $E6 $F0
    ld   e, a                                     ;; 07:7080 $5F
    ld   d, b                                     ;; 07:7081 $50
    ld   hl, Data_007_6F19                        ;; 07:7082 $21 $19 $6F
    add  hl, de                                   ;; 07:7085 $19
    ld   c, $04                                   ;; 07:7086 $0E $04
    call RenderActiveEntitySpritesRect            ;; 07:7088 $CD $E6 $3C
    ld   a, $04                                   ;; 07:708B $3E $04
    jp   label_007_7034                           ;; 07:708D $C3 $34 $70

func_007_7090::
    ld   a, [wD20E]                               ;; 07:7090 $FA $0E $D2
    cp   $00                                      ;; 07:7093 $FE $00
    ret  z                                        ;; 07:7095 $C8

    ld   a, [wD20F]                               ;; 07:7096 $FA $0F $D2
    ld   hl, hActiveEntityVisualPosY              ;; 07:7099 $21 $EC $FF
    add  [hl]                                     ;; 07:709C $86
    ld   [hl], a                                  ;; 07:709D $77
    ld   a, [wD209]                               ;; 07:709E $FA $09 $D2
    rla                                           ;; 07:70A1 $17
    rla                                           ;; 07:70A2 $17
    rla                                           ;; 07:70A3 $17
    rla                                           ;; 07:70A4 $17
    and  $F0                                      ;; 07:70A5 $E6 $F0
    ld   e, a                                     ;; 07:70A7 $5F
    ld   d, b                                     ;; 07:70A8 $50
    ld   hl, Data_007_6F39                        ;; 07:70A9 $21 $39 $6F
    add  hl, de                                   ;; 07:70AC $19
    ld   c, $04                                   ;; 07:70AD $0E $04
    call RenderActiveEntitySpritesRect            ;; 07:70AF $CD $E6 $3C
    ld   a, $04                                   ;; 07:70B2 $3E $04
    jp   label_007_7034                           ;; 07:70B4 $C3 $34 $70

func_007_70B7::
    ld   hl, wIsLinkInTheAir                      ;; 07:70B7 $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ;; 07:70BA $FA $C7 $DB
    or   [hl]                                     ;; 07:70BD $B6
    jr   nz, ret_007_7111                         ;; 07:70BE $20 $51

    ldh  a, [hActiveEntityVisualPosY]             ;; 07:70C0 $F0 $EC
    add  $18                                      ;; 07:70C2 $C6 $18
    ld   e, a                                     ;; 07:70C4 $5F
    ldh  a, [hLinkPositionY]                      ;; 07:70C5 $F0 $99
    ld   hl, hLinkPositionZ                       ;; 07:70C7 $21 $A2 $FF
    sub  [hl]                                     ;; 07:70CA $96
    add  $08                                      ;; 07:70CB $C6 $08
    sub  e                                        ;; 07:70CD $93
    add  $0C                                      ;; 07:70CE $C6 $0C
    cp   $18                                      ;; 07:70D0 $FE $18
    jr   nc, ret_007_7111                         ;; 07:70D2 $30 $3D

    ld   hl, wEntitiesDirectionTable              ;; 07:70D4 $21 $80 $C3
    add  hl, bc                                   ;; 07:70D7 $09
    ld   e, $08                                   ;; 07:70D8 $1E $08
    ld   a, [hl]                                  ;; 07:70DA $7E
    and  a                                        ;; 07:70DB $A7
    jr   z, .jr_70E0                              ;; 07:70DC $28 $02

    ld   e, $F8                                   ;; 07:70DE $1E $F8

.jr_70E0
    ldh  a, [hActiveEntityPosX]                   ;; 07:70E0 $F0 $EE
    add  e                                        ;; 07:70E2 $83
    ld   hl, hLinkPositionX                       ;; 07:70E3 $21 $98 $FF
    sub  [hl]                                     ;; 07:70E6 $96
    add  $1A                                      ;; 07:70E7 $C6 $1A
    cp   $34                                      ;; 07:70E9 $FE $34
    jr   nc, ret_007_7111                         ;; 07:70EB $30 $24

    ld   a, $28                                   ;; 07:70ED $3E $28
    call GetVectorTowardsLink_trampoline          ;; 07:70EF $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 07:70F2 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 07:70F4 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 07:70F6 $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 07:70F8 $E0 $9A
    ld   a, $02                                   ;; 07:70FA $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 07:70FC $EA $46 $C1
    ld   a, $13                                   ;; 07:70FF $3E $13
    ldh  [hLinkVelocityZ], a                      ;; 07:7101 $E0 $A3
    ld   a, $08                                   ;; 07:7103 $3E $08
    ld   [wSubtractHealthBuffer], a               ;; 07:7105 $EA $94 $DB
    ld   a, $20                                   ;; 07:7108 $3E $20
    ld   [wInvincibilityCounter], a               ;; 07:710A $EA $C7 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ;; 07:710D $3E $03
    ldh  [hWaveSfx], a                            ;; 07:710F $E0 $F3

ret_007_7111:
    ret                                           ;; 07:7111 $C9
