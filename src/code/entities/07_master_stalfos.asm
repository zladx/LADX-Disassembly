Data_007_6942::
    db   $3A, $D5, $D6, $D7, $3A, $3A, $CD, $E1, $CE, $3A, $03, $09, $03, $09, $C6, $1B
    db   $1B, $03, $03, $09, $0E, $1B, $1B, $1B, $1B

Data_007_695B::
    db   $02, $12, $22, $32

Data_007_695F::
    db   $42, $00, $08, $10, $18, $20, $28, $30, $38, $40, $48

label_007_696A:
    call ReturnIfNonInteractive_07                ; $696A: $CD $96 $7D
    ld   a, $02                                   ; $696D: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $696F: $E0 $A1
    ld   [wC167], a                               ; $6971: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $6974: $F0 $F0
    JP_TABLE                                      ; $6976
._00 dw func_007_697F                             ; $6977
._01 dw func_007_698A                             ; $6979
._02 dw func_007_6996                             ; $697B
._03 dw func_007_69A2                             ; $697D

func_007_697F::
    call PlayDoorUnlockedSfx                      ; $697F: $CD $00 $40
    call GetEntityTransitionCountdown             ; $6982: $CD $05 $0C
    ld   [hl], $28                                ; $6985: $36 $28
    jp   IncrementEntityState                     ; $6987: $C3 $12 $3B

func_007_698A::
    call GetEntityTransitionCountdown             ; $698A: $CD $05 $0C
    ret  nz                                       ; $698D: $C0

.jr_698E
    ld   a, MUSIC_OPEN_ANGLERS_TUNNEL             ; $698E: $3E $4C
    ld   [wMusicTrackToPlay], a                   ; $6990: $EA $68 $D3
    jp   IncrementEntityState                     ; $6993: $C3 $12 $3B

func_007_6996::
    ld   a, NOISE_SFX_OPEN_D4_D7                  ; $6996: $3E $1D
    ldh  [hNoiseSfx], a                           ; $6998: $E0 $F4
    call GetEntityTransitionCountdown             ; $699A: $CD $05 $0C
    ld   [hl], $80                                ; $699D: $36 $80
    jp   IncrementEntityState                     ; $699F: $C3 $12 $3B

func_007_69A2::
    ldh  a, [hFrameCounter]                       ; $69A2: $F0 $E7
    ld   e, $00                                   ; $69A4: $1E $00
    and  $08                                      ; $69A6: $E6 $08
    jr   z, .jr_69AC                              ; $69A8: $28 $02

    ld   e, $02                                   ; $69AA: $1E $02

.jr_69AC
    ld   a, e                                     ; $69AC: $7B
    ld   [wScreenShakeHorizontal], a              ; $69AD: $EA $55 $C1
    call GetEntityTransitionCountdown             ; $69B0: $CD $05 $0C
    ret  nz                                       ; $69B3: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $69B4: $21 $B0 $C2
    add  hl, bc                                   ; $69B7: $09
    ld   a, [hl]                                  ; $69B8: $7E
    ld   e, a                                     ; $69B9: $5F
    inc  a                                        ; $69BA: $3C
    ld   [hl], a                                  ; $69BB: $77
    ldh  [hMultiPurposeG], a                      ; $69BC: $E0 $E8
    ld   a, e                                     ; $69BE: $7B
    and  $1F                                      ; $69BF: $E6 $1F
    jp   nz, label_007_69D0                       ; $69C1: $C2 $D0 $69

    ld   hl, wEntitiesInertiaTable                ; $69C4: $21 $D0 $C3
    add  hl, bc                                   ; $69C7: $09
    ld   a, [hl]                                  ; $69C8: $7E
    cp   $0A                                      ; $69C9: $FE $0A
    jp   z, label_007_6A34                        ; $69CB: $CA $34 $6A

    inc  a                                        ; $69CE: $3C
    ld   [hl], a                                  ; $69CF: $77

label_007_69D0:
    ld   hl, wEntitiesInertiaTable                ; $69D0: $21 $D0 $C3
    add  hl, bc                                   ; $69D3: $09
    push hl                                       ; $69D4: $E5
    ld   a, [hl]                                  ; $69D5: $7E
    ld   e, a                                     ; $69D6: $5F
    ld   d, b                                     ; $69D7: $50
    ld   hl, Data_007_695F                        ; $69D8: $21 $5F $69
    add  hl, de                                   ; $69DB: $19
    ld   a, [hl]                                  ; $69DC: $7E
    ldh  [hIntersectedObjectTop], a               ; $69DD: $E0 $CD
    ld   a, $20                                   ; $69DF: $3E $20
    ldh  [hIntersectedObjectLeft], a              ; $69E1: $E0 $CE
    call label_2887                               ; $69E3: $CD $87 $28
    pop  hl                                       ; $69E6: $E1
    ld   d, h                                     ; $69E7: $54
    ld   e, l                                     ; $69E8: $5D

    ld   hl, wFarcallParams                       ; $69E9: $21 $01 $DE
    ld   a, BANK(AnglersTunnelDoorEntityHandler)  ; $69EC: $3E $1A
    ld   [hl+], a                                 ; $69EE: $22
    ld   a, HIGH(AnglersTunnelDoorEntityHandler)  ; $69EF: $3E $71
    ld   [hl+], a                                 ; $69F1: $22
    ld   a, LOW(AnglersTunnelDoorEntityHandler)   ; $69F2: $3E $11
    ld   [hl+], a                                 ; $69F4: $22
    ld   a, BANK(@)                               ; $69F5: $3E $07
    ld   [hl], a                                  ; $69F7: $77
    call Farcall                                  ; $69F8: $CD $D7 $0B

    push bc                                       ; $69FB: $C5
    ld   hl, wEntitiesInertiaTable                ; $69FC: $21 $D0 $C3
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    dec  a                                        ; $6A01: $3D
    rra                                           ; $6A02: $1F
    and  $07                                      ; $6A03: $E6 $07
    push af                                       ; $6A05: $F5
    ld   e, a                                     ; $6A06: $5F
    ld   d, b                                     ; $6A07: $50
    ld   hl, Data_007_695B                        ; $6A08: $21 $5B $69
    add  hl, de                                   ; $6A0B: $19
    ld   e, [hl]                                  ; $6A0C: $5E
    ld   hl, wRoomObjects                         ; $6A0D: $21 $11 $D7
    add  hl, de                                   ; $6A10: $19
    ld   c, l                                     ; $6A11: $4D
    ld   b, h                                     ; $6A12: $44
    pop  af                                       ; $6A13: $F1
    ld   e, a                                     ; $6A14: $5F
    sla  a                                        ; $6A15: $CB $27
    sla  a                                        ; $6A17: $CB $27
    add  e                                        ; $6A19: $83
    ld   e, a                                     ; $6A1A: $5F
    ld   d, $00                                   ; $6A1B: $16 $00
    ld   hl, Data_007_6942                        ; $6A1D: $21 $42 $69
    add  hl, de                                   ; $6A20: $19
    ld   e, $05                                   ; $6A21: $1E $05

.loop_6A23
    ld   a, [hl+]                                 ; $6A23: $2A
    ld   [bc], a                                  ; $6A24: $02
    push hl                                       ; $6A25: $E5
    ld   h, b                                     ; $6A26: $60
    ld   l, c                                     ; $6A27: $69
    ld   a, $87                                   ; $6A28: $3E $87
    call BackupObjectInRAM2                       ; $6A2A: $CD $2F $0B
    pop  hl                                       ; $6A2D: $E1
    inc  bc                                       ; $6A2E: $03
    dec  e                                        ; $6A2F: $1D
    jr   nz, .loop_6A23                           ; $6A30: $20 $F1

    pop  bc                                       ; $6A32: $C1
    ret                                           ; $6A33: $C9

label_007_6A34:
    xor  a                                        ; $6A34: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A35: $EA $55 $C1
    ld   [wC167], a                               ; $6A38: $EA $67 $C1
    call label_27DD                               ; $6A3B: $CD $DD $27
    jp   ClearEntityStatus_07                     ; $6A3E: $C3 $A4 $7E

; Entity handler for:
;  - Master Stalfos
;  - Angler's Tunnel cascade
MasterStalfosEntityHandler::
    ld   hl, wEntitiesPrivateState4Table          ; $6A41: $21 $40 $C4
    add  hl, bc                                   ; $6A44: $09
    ld   a, [hl]                                  ; $6A45: $7E
    cp   $FF                                      ; $6A46: $FE $FF
    jp   z, label_007_696A                        ; $6A48: $CA $6A $69

    and  a                                        ; $6A4B: $A7
    jr   nz, .jr_6A52                             ; $6A4C: $20 $04

    inc  [hl]                                     ; $6A4E: $34
    call func_007_6ED0                            ; $6A4F: $CD $D0 $6E

.jr_6A52
    call func_007_6FB1                            ; $6A52: $CD $B1 $6F
    ldh  a, [hActiveEntityStatus]                 ; $6A55: $F0 $EA
    cp   $05                                      ; $6A57: $FE $05
    jp   nz, label_007_7EAA                       ; $6A59: $C2 $AA $7E

    call ReturnIfNonInteractive_07                ; $6A5C: $CD $96 $7D
    call label_394D                               ; $6A5F: $CD $4D $39
    call BossIntro                                ; $6A62: $CD $E8 $3E
    ld   hl, wEntitiesFlashCountdownTable         ; $6A65: $21 $20 $C4
    add  hl, bc                                   ; $6A68: $09
    ld   a, [hl]                                  ; $6A69: $7E
    cp   $16                                      ; $6A6A: $FE $16
    jr   nz, jr_007_6A89                          ; $6A6C: $20 $1B

    ldh  a, [hActiveEntityState]                  ; $6A6E: $F0 $F0
    cp   $09                                      ; $6A70: $FE $09
    jr   nc, .jr_6A84                             ; $6A72: $30 $10

    ld   [hl], b                                  ; $6A74: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6A75: $21 $20 $C3
    add  hl, bc                                   ; $6A78: $09
    ld   [hl], b                                  ; $6A79: $70
    call IncrementEntityState                     ; $6A7A: $CD $12 $3B
    ld   a, $09                                   ; $6A7D: $3E $09
    ld   [hl], a                                  ; $6A7F: $77
    ldh  [hActiveEntityState], a                  ; $6A80: $E0 $F0
    jr   jr_007_6A89                              ; $6A82: $18 $05

.jr_6A84
    ld   hl, wEntitiesInertiaTable                ; $6A84: $21 $D0 $C3
    add  hl, bc                                   ; $6A87: $09
    inc  [hl]                                     ; $6A88: $34

jr_007_6A89:
    call ApplyRecoilIfNeeded_07                   ; $6A89: $CD $C3 $7D
    call AddEntityZSpeedToPos_07                  ; $6A8C: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6A8F: $21 $20 $C3
    add  hl, bc                                   ; $6A92: $09
    dec  [hl]                                     ; $6A93: $35
    dec  [hl]                                     ; $6A94: $35
    ld   hl, wEntitiesPosZTable                   ; $6A95: $21 $10 $C3
    add  hl, bc                                   ; $6A98: $09
    ld   a, [hl]                                  ; $6A99: $7E
    and  $80                                      ; $6A9A: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6A9C: $E0 $E8
    jr   z, .jr_6AA6                              ; $6A9E: $28 $06

    ld   [hl], b                                  ; $6AA0: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6AA1: $21 $20 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], b                                  ; $6AA5: $70

.jr_6AA6
    ldh  a, [hActiveEntityState]                  ; $6AA6: $F0 $F0
    cp   $09                                      ; $6AA8: $FE $09
    jr   nc, .jr_6AC0                             ; $6AAA: $30 $14

    call label_3B65                               ; $6AAC: $CD $65 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6AAF: $21 $10 $C4
    add  hl, bc                                   ; $6AB2: $09
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $6AB3: $FA $3E $C1
    or   [hl]                                     ; $6AB6: $B6
    and  a                                        ; $6AB7: $A7
    jr   nz, .jr_6AC0                             ; $6AB8: $20 $06

    call CheckLinkCollisionWithEnemy_trampoline   ; $6ABA: $CD $5A $3B
    call label_3B70                               ; $6ABD: $CD $70 $3B

.jr_6AC0
    ldh  a, [hActiveEntityState]                  ; $6AC0: $F0 $F0
     JP_TABLE                                      ; $6AC2
._00 dw func_007_6ADF                             ; $6AC3
._01 dw func_007_6AF5                             ; $6AC5
._02 dw func_007_6B16                             ; $6AC7
._03 dw func_007_6B68                             ; $6AC9
._04 dw func_007_6BC8                             ; $6ACB
._05 dw func_007_6BF4                             ; $6ACD
._06 dw func_007_6C39                             ; $6ACF
._07 dw func_007_6D18                             ; $6AD1
._08 dw func_007_6D5F                             ; $6AD3
._09 dw func_007_6D7F                             ; $6AD5
._0A dw func_007_6D9F                             ; $6AD7
._0B dw func_007_6DD9                             ; $6AD9
._0C dw func_007_6DF6                             ; $6ADB
._0D dw func_007_6E58                             ; $6ADD

func_007_6ADF::
    ld   hl, wEntitiesSpeedZTable                 ; $6ADF: $21 $20 $C3
    add  hl, bc                                   ; $6AE2: $09
    ld   [hl], b                                  ; $6AE3: $70
    call GetEntityTransitionCountdown             ; $6AE4: $CD $05 $0C
    jr   nz, .ret_6AF4                            ; $6AE7: $20 $0B

    ld   [hl], $30                                ; $6AE9: $36 $30
    call IncrementEntityState                     ; $6AEB: $CD $12 $3B
    ld   hl, wEntitiesPosZTable                   ; $6AEE: $21 $10 $C3
    add  hl, bc                                   ; $6AF1: $09
    ld   [hl], $6F                                ; $6AF2: $36 $6F

.ret_6AF4
    ret                                           ; $6AF4: $C9

func_007_6AF5::
    call GetEntityTransitionCountdown             ; $6AF5: $CD $05 $0C
    jr   z, jr_007_6B08                           ; $6AF8: $28 $0E

    cp   $01                                      ; $6AFA: $FE $01
    jr   nz, .jr_6B02                             ; $6AFC: $20 $04

    ld   a, JINGLE_FALL_DOWN                      ; $6AFE: $3E $08
    ldh  [hJingle], a                             ; $6B00: $E0 $F2

.jr_6B02
    ld   hl, wEntitiesSpeedZTable                 ; $6B02: $21 $20 $C3
    add  hl, bc                                   ; $6B05: $09
    ld   [hl], b                                  ; $6B06: $70
    ret                                           ; $6B07: $C9

jr_007_6B08:
    ldh  a, [hMultiPurposeG]                      ; $6B08: $F0 $E8
    and  a                                        ; $6B0A: $A7
    jr   z, ret_007_6B15                          ; $6B0B: $28 $08

    call GetEntityTransitionCountdown             ; $6B0D: $CD $05 $0C
    ld   [hl], $40                                ; $6B10: $36 $40
    call IncrementEntityState                     ; $6B12: $CD $12 $3B

ret_007_6B15:
    ret                                           ; $6B15: $C9

func_007_6B16::
    call GetEntityTransitionCountdown             ; $6B16: $CD $05 $0C
    cp   $01                                      ; $6B19: $FE $01
    jr   nz, jr_007_6B33                          ; $6B1B: $20 $16

    ld_dialog_low e, Dialog112 ; "You found me!"  ; $6B1D: $1E $12
    ldh  a, [hMapRoom]                            ; $6B1F: $F0 $F6
    cp   ROOM_INDOOR_A_MASTER_STALFOS_2           ; $6B21: $FE $92
    jr   z, .jr_6B2F                              ; $6B23: $28 $0A
    cp   ROOM_INDOOR_A_MASTER_STALFOS_3           ; $6B25: $FE $84
    jr   z, .jr_6B2F                              ; $6B27: $28 $06
    cp   ROOM_INDOOR_A_MASTER_STALFOS_FINAL       ; $6B29: $FE $80
    jr   nz, jr_007_6B33                          ; $6B2B: $20 $06

    ld_dialog_low e, Dialog114 ; "I can't outlast you" ; $6B2D: $1E $14

.jr_6B2F
    ld   a, e                                     ; $6B2F: $7B
    call OpenDialogInTable1                       ; $6B30: $CD $73 $23

jr_007_6B33:
    call GetEntityTransitionCountdown             ; $6B33: $CD $05 $0C
    jr   nz, jr_007_6B45                          ; $6B36: $20 $0D

    ld   [hl], $A0                                ; $6B38: $36 $A0
    ldh  a, [hMapRoom]                            ; $6B3A: $F0 $F6
    cp   UNKNOWN_ROOM_95                          ; $6B3C: $FE $95
    jr   z, jr_007_6B42                           ; $6B3E: $28 $02

.jr_6B40
    ld   [hl], $20                                ; $6B40: $36 $20

jr_007_6B42:
    jp   IncrementEntityState                     ; $6B42: $C3 $12 $3B

jr_007_6B45:
    ld   hl, wD20E                                ; $6B45: $21 $0E $D2
    ld   [hl], $F0                                ; $6B48: $36 $F0
    ld   hl, wD20B                                ; $6B4A: $21 $0B $D2
    ld   [hl], $F8                                ; $6B4D: $36 $F8
    ld   hl, wD20D                                ; $6B4F: $21 $0D $D2
    ld   [hl], $F0                                ; $6B52: $36 $F0
    cp   $20                                      ; $6B54: $FE $20
    jr   c, .ret_6B67                             ; $6B56: $38 $0F

    ld   hl, wD20E                                ; $6B58: $21 $0E $D2
    ld   [hl], $F2                                ; $6B5B: $36 $F2
    ld   hl, wD20B                                ; $6B5D: $21 $0B $D2
    ld   [hl], $FA                                ; $6B60: $36 $FA
    ld   hl, wD20D                                ; $6B62: $21 $0D $D2
    ld   [hl], $F2                                ; $6B65: $36 $F2

.ret_6B67
    ret                                           ; $6B67: $C9

func_007_6B68::
    call GetEntityTransitionCountdown             ; $6B68: $CD $05 $0C
    jr   nz, .jr_6B72                             ; $6B6B: $20 $05

    ld   [hl], $20                                ; $6B6D: $36 $20
    jp   IncrementEntityState                     ; $6B6F: $C3 $12 $3B

.jr_6B72
    and  $3F                                      ; $6B72: $E6 $3F
    jr   nz, .jr_6B76                             ; $6B74: $20 $00

.jr_6B76
    call GetEntityTransitionCountdown             ; $6B76: $CD $05 $0C
    and  $40                                      ; $6B79: $E6 $40
    jr   z, func_007_6BA3                         ; $6B7B: $28 $26

func_007_6B7D::
    call func_007_6EF0                            ; $6B7D: $CD $F0 $6E
    ld   hl, wD208                                ; $6B80: $21 $08 $D2
    ld   [hl], $01                                ; $6B83: $36 $01
    ld   hl, wD209                                ; $6B85: $21 $09 $D2
    ld   [hl], b                                  ; $6B88: $70
    ld   hl, wD20A                                ; $6B89: $21 $0A $D2
    ld   [hl], $F0                                ; $6B8C: $36 $F0
    ld   hl, wD20B                                ; $6B8E: $21 $0B $D2
    ld   [hl], $F8                                ; $6B91: $36 $F8
    ld   hl, wD20D                                ; $6B93: $21 $0D $D2
    ld   [hl], $F3                                ; $6B96: $36 $F3
    ld   hl, wD20C                                ; $6B98: $21 $0C $D2
    ld   [hl], $10                                ; $6B9B: $36 $10
    ld   hl, wD207                                ; $6B9D: $21 $07 $D2
    ld   [hl], $00                                ; $6BA0: $36 $00
    ret                                           ; $6BA2: $C9

func_007_6BA3::
    call func_007_6EF0                            ; $6BA3: $CD $F0 $6E
    ld   hl, wD208                                ; $6BA6: $21 $08 $D2
    ld   [hl], b                                  ; $6BA9: $70
    ld   hl, wD209                                ; $6BAA: $21 $09 $D2
    ld   [hl], b                                  ; $6BAD: $70
    ld   hl, wD20A                                ; $6BAE: $21 $0A $D2
    ld   [hl], $F8                                ; $6BB1: $36 $F8
    ld   hl, wD20B                                ; $6BB3: $21 $0B $D2
    ld   [hl], $F8                                ; $6BB6: $36 $F8
    ld   hl, wD20D                                ; $6BB8: $21 $0D $D2
    ld   [hl], $F0                                ; $6BBB: $36 $F0
    ld   hl, wD20C                                ; $6BBD: $21 $0C $D2
    ld   [hl], $10                                ; $6BC0: $36 $10
    ld   hl, wD207                                ; $6BC2: $21 $07 $D2
    ld   [hl], $00                                ; $6BC5: $36 $00
    ret                                           ; $6BC7: $C9

func_007_6BC8::
    call func_007_6EA2                            ; $6BC8: $CD $A2 $6E
    call GetEntityTransitionCountdown             ; $6BCB: $CD $05 $0C
    ret  nz                                       ; $6BCE: $C0

    call GetRandomByte                            ; $6BCF: $CD $0D $28
    and  $1F                                      ; $6BD2: $E6 $1F
    add  $30                                      ; $6BD4: $C6 $30
    ld   [hl], a                                  ; $6BD6: $77
    ld   a, $08                                   ; $6BD7: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6BD9: $CD $AA $3B
    call IncrementEntityState                     ; $6BDC: $CD $12 $3B

label_007_6BDF:
    call EntityLinkPositionXDifference_07         ; $6BDF: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $6BE2: $21 $80 $C3
    add  hl, bc                                   ; $6BE5: $09
    ld   [hl], e                                  ; $6BE6: $73

func_007_6BE7::
    call func_007_6B7D                            ; $6BE7: $CD $7D $6B
    ld   hl, wEntitiesDirectionTable              ; $6BEA: $21 $80 $C3
    add  hl, bc                                   ; $6BED: $09
    ld   a, [hl]                                  ; $6BEE: $7E
    and  a                                        ; $6BEF: $A7
    ret  nz                                       ; $6BF0: $C0

    jp   func_007_6BA3                            ; $6BF1: $C3 $A3 $6B

func_007_6BF4::
    call func_007_6EA2                            ; $6BF4: $CD $A2 $6E
    call EntityLinkPositionXDifference_07         ; $6BF7: $CD $5D $7E
    add  $20                                      ; $6BFA: $C6 $20
    cp   $40                                      ; $6BFC: $FE $40
    jr   nc, .jr_6C14                             ; $6BFE: $30 $14

    call EntityLinkPositionYDifference_07         ; $6C00: $CD $6D $7E
    add  $1C                                      ; $6C03: $C6 $1C
    cp   $38                                      ; $6C05: $FE $38
    jr   nc, .jr_6C14                             ; $6C07: $30 $0B

    call IncrementEntityState                     ; $6C09: $CD $12 $3B
    ld   [hl], $06                                ; $6C0C: $36 $06
    call GetEntityTransitionCountdown             ; $6C0E: $CD $05 $0C
    ld   [hl], $30                                ; $6C11: $36 $30
    ret                                           ; $6C13: $C9

.jr_6C14
    call GetEntityTransitionCountdown             ; $6C14: $CD $05 $0C
    jr   nz, .jr_6C27                             ; $6C17: $20 $0E

    call GetRandomByte                            ; $6C19: $CD $0D $28
    and  $0F                                      ; $6C1C: $E6 $0F
    add  $10                                      ; $6C1E: $C6 $10
    ld   [hl], a                                  ; $6C20: $77
    call IncrementEntityState                     ; $6C21: $CD $12 $3B
    ld   [hl], $04                                ; $6C24: $36 $04
    ret                                           ; $6C26: $C9

.jr_6C27
    and  $0F                                      ; $6C27: $E6 $0F
    jr   nz, func_007_6C33                        ; $6C29: $20 $08

    ld   a, [wD209]                               ; $6C2B: $FA $09 $D2
    xor  $01                                      ; $6C2E: $EE $01
    ld   [wD209], a                               ; $6C30: $EA $09 $D2

func_007_6C33::
    call UpdateEntityPosWithSpeed_07              ; $6C33: $CD $0A $7E
    jp   label_3B23                               ; $6C36: $C3 $23 $3B

func_007_6C39::
    call GetEntityTransitionCountdown             ; $6C39: $CD $05 $0C
    jr   nz, jr_007_6C55                          ; $6C3C: $20 $17

func_007_6C3E::
    call GetEntityTransitionCountdown             ; $6C3E: $CD $05 $0C
    ld   [hl], $20                                ; $6C41: $36 $20
    call IncrementEntityState                     ; $6C43: $CD $12 $3B
    ld   [hl], $04                                ; $6C46: $36 $04
    ld   hl, wEntitiesHitboxFlagsTable            ; $6C48: $21 $50 $C3
    add  hl, bc                                   ; $6C4B: $09
    set  7, [hl]                                  ; $6C4C: $CB $FE
    ld   hl, wEntitiesOptions1Table               ; $6C4E: $21 $30 $C4
    add  hl, bc                                   ; $6C51: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $6C52: $CB $B6
    ret                                           ; $6C54: $C9

jr_007_6C55:
    ld   hl, wEntitiesDirectionTable              ; $6C55: $21 $80 $C3
    add  hl, bc                                   ; $6C58: $09
    ld   a, [hl]                                  ; $6C59: $7E
    and  a                                        ; $6C5A: $A7
    jr   nz, jr_007_6CB8                          ; $6C5B: $20 $5B

    call GetEntityTransitionCountdown             ; $6C5D: $CD $05 $0C
    cp   $18                                      ; $6C60: $FE $18
    jr   c, .jr_6C77                              ; $6C62: $38 $13

    call func_007_6BA3                            ; $6C64: $CD $A3 $6B
    ld   a, $08                                   ; $6C67: $3E $08
    ld   [wD20C], a                               ; $6C69: $EA $0C $D2
    ld   a, $E0                                   ; $6C6C: $3E $E0
    ld   [wD20D], a                               ; $6C6E: $EA $0D $D2
    ld   a, $01                                   ; $6C71: $3E $01
    ld   [wD207], a                               ; $6C73: $EA $07 $D2
    ret                                           ; $6C76: $C9

.jr_6C77
    cp   $10                                      ; $6C77: $FE $10
    jr   c, jr_007_6C9E                           ; $6C79: $38 $23

    cp   $17                                      ; $6C7B: $FE $17
    jr   nz, .jr_6C89                             ; $6C7D: $20 $0A

    ld   a, NOISE_SFX_WEAPON_SWING                ; $6C7F: $3E $27
    ldh  [hNoiseSfx], a                           ; $6C81: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6C83: $21 $00 $C3
    add  hl, bc                                   ; $6C86: $09
    ld   [hl], $10                                ; $6C87: $36 $10

.jr_6C89
    ld   a, $FF                                   ; $6C89: $3E $FF
    ld   [wD207], a                               ; $6C8B: $EA $07 $D2
    ld   a, $F0                                   ; $6C8E: $3E $F0
    ld   [wD20A], a                               ; $6C90: $EA $0A $D2
    ld   a, $F4                                   ; $6C93: $3E $F4
    ld   [wD20B], a                               ; $6C95: $EA $0B $D2
    ld   a, $01                                   ; $6C98: $3E $01
    ld   [wD208], a                               ; $6C9A: $EA $08 $D2
    ret                                           ; $6C9D: $C9

jr_007_6C9E:
    ld   a, $03                                   ; $6C9E: $3E $03
    ld   [wD207], a                               ; $6CA0: $EA $07 $D2
    ld   a, $F8                                   ; $6CA3: $3E $F8
    ld   [wD20C], a                               ; $6CA5: $EA $0C $D2
    ld   a, $08                                   ; $6CA8: $3E $08
    ld   [wD20D], a                               ; $6CAA: $EA $0D $D2
    ld   a, $F0                                   ; $6CAD: $3E $F0
    ld   [wD20A], a                               ; $6CAF: $EA $0A $D2
    ld   a, $F0                                   ; $6CB2: $3E $F0
    ld   [wD20B], a                               ; $6CB4: $EA $0B $D2
    ret                                           ; $6CB7: $C9

jr_007_6CB8:
    call GetEntityTransitionCountdown             ; $6CB8: $CD $05 $0C
    cp   $18                                      ; $6CBB: $FE $18
    jr   c, .jr_6CD7                              ; $6CBD: $38 $18

    call func_007_6B7D                            ; $6CBF: $CD $7D $6B
    ld   a, $01                                   ; $6CC2: $3E $01
    ld   [wD209], a                               ; $6CC4: $EA $09 $D2
    ld   a, $F8                                   ; $6CC7: $3E $F8
    ld   [wD20C], a                               ; $6CC9: $EA $0C $D2
    ld   a, $E8                                   ; $6CCC: $3E $E8
    ld   [wD20D], a                               ; $6CCE: $EA $0D $D2
    ld   a, $00                                   ; $6CD1: $3E $00
    ld   [wD207], a                               ; $6CD3: $EA $07 $D2
    ret                                           ; $6CD6: $C9

.jr_6CD7
    cp   $10                                      ; $6CD7: $FE $10
    jr   c, jr_007_6CFE                           ; $6CD9: $38 $23

    cp   $17                                      ; $6CDB: $FE $17
    jr   nz, .jr_6CE9                             ; $6CDD: $20 $0A

    ld   a, NOISE_SFX_WEAPON_SWING                ; $6CDF: $3E $27
    ldh  [hNoiseSfx], a                           ; $6CE1: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6CE3: $21 $00 $C3
    add  hl, bc                                   ; $6CE6: $09
    ld   [hl], $10                                ; $6CE7: $36 $10

.jr_6CE9
    ld   a, $FF                                   ; $6CE9: $3E $FF
    ld   [wD207], a                               ; $6CEB: $EA $07 $D2
    ld   a, $F0                                   ; $6CEE: $3E $F0
    ld   [wD20A], a                               ; $6CF0: $EA $0A $D2
    ld   a, $F0                                   ; $6CF3: $3E $F0
    ld   [wD20B], a                               ; $6CF5: $EA $0B $D2
    ld   a, $00                                   ; $6CF8: $3E $00
    ld   [wD208], a                               ; $6CFA: $EA $08 $D2
    ret                                           ; $6CFD: $C9

jr_007_6CFE:
    ld   a, $02                                   ; $6CFE: $3E $02
    ld   [wD207], a                               ; $6D00: $EA $07 $D2
    ld   a, $10                                   ; $6D03: $3E $10
    ld   [wD20C], a                               ; $6D05: $EA $0C $D2
    ld   a, $08                                   ; $6D08: $3E $08
    ld   [wD20D], a                               ; $6D0A: $EA $0D $D2
    ld   a, $F0                                   ; $6D0D: $3E $F0
    ld   [wD20A], a                               ; $6D0F: $EA $0A $D2
    ld   a, $EC                                   ; $6D12: $3E $EC
    ld   [wD20B], a                               ; $6D14: $EA $0B $D2
    ret                                           ; $6D17: $C9

func_007_6D18::
    call func_007_6BE7                            ; $6D18: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6D1B: $CD $05 $0C
    jr   nz, jr_007_6D46                          ; $6D1E: $20 $26

    call IncrementEntityState                     ; $6D20: $CD $12 $3B
    call func_007_733F                            ; $6D23: $CD $3F $73
    ld   hl, wEntitiesPrivateState1Table          ; $6D26: $21 $B0 $C2
    add  hl, bc                                   ; $6D29: $09
    ld   a, [hl]                                  ; $6D2A: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6D2B: $21 $20 $C3
    add  hl, bc                                   ; $6D2E: $09
    ld   [hl], $30                                ; $6D2F: $36 $30
    and  a                                        ; $6D31: $A7
    jr   nz, .jr_6D3B                             ; $6D32: $20 $07

    ld   [hl], $28                                ; $6D34: $36 $28
    ld   a, $18                                   ; $6D36: $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ; $6D38: $C3 $AA $3B

.jr_6D3B
    ld   a, $08                                   ; $6D3B: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6D3D: $CD $AA $3B
    call GetEntitySpeedYAddress                   ; $6D40: $CD $05 $40
    ld   [hl], $F0                                ; $6D43: $36 $F0
    ret                                           ; $6D45: $C9

jr_007_6D46:
    ld   a, [wD20E]                               ; $6D46: $FA $0E $D2
    add  $02                                      ; $6D49: $C6 $02
    ld   [wD20E], a                               ; $6D4B: $EA $0E $D2
    ld   a, [wD20B]                               ; $6D4E: $FA $0B $D2
    add  $02                                      ; $6D51: $C6 $02
    ld   [wD20B], a                               ; $6D53: $EA $0B $D2
    ld   a, [wD20D]                               ; $6D56: $FA $0D $D2
    add  $02                                      ; $6D59: $C6 $02
    ld   [wD20D], a                               ; $6D5B: $EA $0D $D2
    ret                                           ; $6D5E: $C9

func_007_6D5F::
    call GetEntityTransitionCountdown             ; $6D5F: $CD $05 $0C
    jr   z, jr_007_6D70                           ; $6D62: $28 $0C

    dec  a                                        ; $6D64: $3D
    jr   nz, .jr_6D6A                             ; $6D65: $20 $03

    call func_007_6C3E                            ; $6D67: $CD $3E $6C

.jr_6D6A
    call func_007_6BE7                            ; $6D6A: $CD $E7 $6B
    jp   jr_007_6D46                              ; $6D6D: $C3 $46 $6D

jr_007_6D70:
    call func_007_6C33                            ; $6D70: $CD $33 $6C
    ldh  a, [hMultiPurposeG]                      ; $6D73: $F0 $E8
    and  a                                        ; $6D75: $A7
    ret  z                                        ; $6D76: $C8

    call GetEntityTransitionCountdown             ; $6D77: $CD $05 $0C
    ld   [hl], $10                                ; $6D7A: $36 $10
    jp   ret_007_6B15                             ; $6D7C: $C3 $15 $6B

func_007_6D7F::
    ldh  a, [hMultiPurposeG]                      ; $6D7F: $F0 $E8
    and  a                                        ; $6D81: $A7
    jr   z, .jr_6D9C                              ; $6D82: $28 $18

    call IncrementEntityState                     ; $6D84: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6D87: $CD $05 $0C
    ld   [hl], $20                                ; $6D8A: $36 $20
    ld   hl, wEntitiesHitboxFlagsTable            ; $6D8C: $21 $50 $C3
    add  hl, bc                                   ; $6D8F: $09
    res  7, [hl]                                  ; $6D90: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $6D92: $21 $30 $C4
    add  hl, bc                                   ; $6D95: $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $6D96: $CB $F6
    ld   a, JINGLE_STALFOS_COLLAPSE               ; $6D98: $3E $28
    ldh  [hJingle], a                             ; $6D9A: $E0 $F2

.jr_6D9C
    jp   func_007_6C33                            ; $6D9C: $C3 $33 $6C

func_007_6D9F::
    call GetEntityTransitionCountdown             ; $6D9F: $CD $05 $0C
    jr   nz, .jr_6DA9                             ; $6DA2: $20 $05

    ld   [hl], $C0                                ; $6DA4: $36 $C0
    jp   IncrementEntityState                     ; $6DA6: $C3 $12 $3B

.jr_6DA9
    ld   hl, wD20B                                ; $6DA9: $21 $0B $D2
    ld   a, [hl]                                  ; $6DAC: $7E
    sub  $03                                      ; $6DAD: $D6 $03
    jr   z, jr_007_6DB8                           ; $6DAF: $28 $07

    bit  7, a                                     ; $6DB1: $CB $7F
    jr   z, .jr_6DB7                              ; $6DB3: $28 $02

    inc  [hl]                                     ; $6DB5: $34
    inc  [hl]                                     ; $6DB6: $34

.jr_6DB7
    dec  [hl]                                     ; $6DB7: $35

jr_007_6DB8:
    ld   hl, wD20D                                ; $6DB8: $21 $0D $D2
    ld   a, [hl]                                  ; $6DBB: $7E
    sub  $03                                      ; $6DBC: $D6 $03
    jr   z, jr_007_6DC7                           ; $6DBE: $28 $07

    bit  7, a                                     ; $6DC0: $CB $7F
    jr   z, .jr_6DC6                              ; $6DC2: $28 $02

    inc  [hl]                                     ; $6DC4: $34
    inc  [hl]                                     ; $6DC5: $34

.jr_6DC6
    dec  [hl]                                     ; $6DC6: $35

jr_007_6DC7:
    call GetEntityTransitionCountdown             ; $6DC7: $CD $05 $0C
    cp   $14                                      ; $6DCA: $FE $14
    jr   nc, .ret_6DD8                            ; $6DCC: $30 $0A

    ld   a, [wD20E]                               ; $6DCE: $FA $0E $D2
    and  a                                        ; $6DD1: $A7
    jr   z, .ret_6DD8                             ; $6DD2: $28 $04

    inc  a                                        ; $6DD4: $3C
    ld   [wD20E], a                               ; $6DD5: $EA $0E $D2

.ret_6DD8
    ret                                           ; $6DD8: $C9

func_007_6DD9::
    call GetEntityTransitionCountdown             ; $6DD9: $CD $05 $0C
    jr   nz, .jr_6DE3                             ; $6DDC: $20 $05

    ld   [hl], $30                                ; $6DDE: $36 $30
    jp   IncrementEntityState                     ; $6DE0: $C3 $12 $3B

.jr_6DE3
    cp   $30                                      ; $6DE3: $FE $30
    jr   nc, .ret_6DF5                            ; $6DE5: $30 $0E

    and  $03                                      ; $6DE7: $E6 $03
    jr   nz, .ret_6DF5                            ; $6DE9: $20 $0A

    ld   a, [wD20E]                               ; $6DEB: $FA $0E $D2
    add  $02                                      ; $6DEE: $C6 $02
    cpl                                           ; $6DF0: $2F
    inc  a                                        ; $6DF1: $3C
    ld   [wD20E], a                               ; $6DF2: $EA $0E $D2

.ret_6DF5
    ret                                           ; $6DF5: $C9

func_007_6DF6::
    ld   a, [wD20E]                               ; $6DF6: $FA $0E $D2
    cp   $F0                                      ; $6DF9: $FE $F0
    jr   z, .jr_6E01                              ; $6DFB: $28 $04

    dec  a                                        ; $6DFD: $3D
    ld   [wD20E], a                               ; $6DFE: $EA $0E $D2

.jr_6E01
    call GetEntityTransitionCountdown             ; $6E01: $CD $05 $0C
    jr   nz, jr_007_6E35                          ; $6E04: $20 $2F

    ld   e, $FF                                   ; $6E06: $1E $FF
    ldh  a, [hMapRoom]                            ; $6E08: $F0 $F6
    cp   UNKNOWN_ROOM_80                          ; $6E0A: $FE $80
    jr   z, .jr_6E16                              ; $6E0C: $28 $08
    ld   e, $03                                   ; $6E0E: $1E $03
    cp   UNKNOWN_ROOM_95                          ; $6E10: $FE $95
    jr   z, .jr_6E16                              ; $6E12: $28 $02
    ld   e, $02                                   ; $6E14: $1E $02

.jr_6E16
    ld   hl, wEntitiesInertiaTable                ; $6E16: $21 $D0 $C3
    add  hl, bc                                   ; $6E19: $09
    ld   a, [hl]                                  ; $6E1A: $7E
    cp   e                                        ; $6E1B: $BB
    jr   c, .jr_6E32                              ; $6E1C: $38 $14

    ld   hl, wEntitiesHitboxFlagsTable            ; $6E1E: $21 $50 $C3
    add  hl, bc                                   ; $6E21: $09
    set  7, [hl]                                  ; $6E22: $CB $FE
    call IncrementEntityState                     ; $6E24: $CD $12 $3B
    call_open_dialog Dialog113                    ; $6E27
    call GetEntityTransitionCountdown             ; $6E2C: $CD $05 $0C
    ld   [hl], $04                                ; $6E2F: $36 $04
    ret                                           ; $6E31: $C9

.jr_6E32
    jp   func_007_6C3E                            ; $6E32: $C3 $3E $6C

jr_007_6E35:
    cp   $24                                      ; $6E35: $FE $24
    jr   nc, ret_007_6E57                         ; $6E37: $30 $1E

    ld   hl, wD20B                                ; $6E39: $21 $0B $D2
    ld   a, [hl]                                  ; $6E3C: $7E
    sub  $F8                                      ; $6E3D: $D6 $F8
    jr   z, jr_007_6E48                           ; $6E3F: $28 $07

    bit  7, a                                     ; $6E41: $CB $7F
    jr   z, .jr_6E47                              ; $6E43: $28 $02

    inc  [hl]                                     ; $6E45: $34
    inc  [hl]                                     ; $6E46: $34

.jr_6E47
    dec  [hl]                                     ; $6E47: $35

jr_007_6E48:
    ld   hl, wD20D                                ; $6E48: $21 $0D $D2
    ld   a, [hl]                                  ; $6E4B: $7E
    sub  $F0                                      ; $6E4C: $D6 $F0
    jr   z, ret_007_6E57                          ; $6E4E: $28 $07

    bit  7, a                                     ; $6E50: $CB $7F
    jr   z, .jr_6E56                              ; $6E52: $28 $02

    inc  [hl]                                     ; $6E54: $34
    inc  [hl]                                     ; $6E55: $34

.jr_6E56
    dec  [hl]                                     ; $6E56: $35

ret_007_6E57:
    ret                                           ; $6E57: $C9

func_007_6E58::
    call func_007_6BE7                            ; $6E58: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6E5B: $CD $05 $0C
    jr   z, jr_007_6E6A                           ; $6E5E: $28 $0A

    dec  a                                        ; $6E60: $3D
    jr   nz, .jr_6E67                             ; $6E61: $20 $04

    ld   a, NOISE_SFX_MINIBOSS_FLEE               ; $6E63: $3E $3F
    ldh  [hNoiseSfx], a                           ; $6E65: $E0 $F4

.jr_6E67
    jp   jr_007_6D46                              ; $6E67: $C3 $46 $6D

jr_007_6E6A:
    ld   hl, wEntitiesSpeedZTable                 ; $6E6A: $21 $20 $C3
    add  hl, bc                                   ; $6E6D: $09
    ld   [hl], $30                                ; $6E6E: $36 $30
    ld   hl, wEntitiesPosZTable                   ; $6E70: $21 $10 $C3
    add  hl, bc                                   ; $6E73: $09
    ld   a, [hl]                                  ; $6E74: $7E
    cp   $78                                      ; $6E75: $FE $78
    jr   c, ret_007_6EA1                          ; $6E77: $38 $28

    call label_27DD                               ; $6E79: $CD $DD $27
    call ClearEntityStatus_07                     ; $6E7C: $CD $A4 $7E

; Also used by smashable pillar to set ROOM_STATUS_EVENT_2 on the current room.
func_007_6E7F::
    ld   hl, wIndoorARoomStatus                   ; $6E7F: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6E82: $F0 $F6
    cp   UNKNOWN_ROOM_FF                          ; $6E84: $FE $FF
    jr   nz, .jr_6E8D                             ; $6E86: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6E88: $21 $E0 $DD
    jr   jr_007_6E9A                              ; $6E8B: $18 $0D

.jr_6E8D
    ld   e, a                                     ; $6E8D: $5F
    ld   d, b                                     ; $6E8E: $50

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ; $6E8F: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $6E91: $FE $1A
    jr   nc, jr_007_6E9A                          ; $6E93: $30 $05
    cp   MAP_INDOORS_B_START                      ; $6E95: $FE $06
    jr   c, jr_007_6E9A                           ; $6E97: $38 $01
    ; increase offset in wIndoorARoomStatus by 0x100
    inc  d                                        ; $6E99: $14
jr_007_6E9A:

    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    or   ROOM_STATUS_EVENT_2                      ; $6E9C: $F6 $20
    ld   [hl], a                                  ; $6E9E: $77
    ldh  [hRoomStatus], a                         ; $6E9F: $E0 $F8

ret_007_6EA1:
    ret                                           ; $6EA1: $C9

func_007_6EA2::
    ld   hl, wEntitiesPrivateState1Table          ; $6EA2: $21 $B0 $C2
    add  hl, bc                                   ; $6EA5: $09
    ld   [hl], b                                  ; $6EA6: $70
    call EntityLinkPositionXDifference_07         ; $6EA7: $CD $5D $7E
    add  $30                                      ; $6EAA: $C6 $30
    cp   $60                                      ; $6EAC: $FE $60
    jr   nc, .jr_6EC3                             ; $6EAE: $30 $13

    call EntityLinkPositionYDifference_07         ; $6EB0: $CD $6D $7E
    add  $30                                      ; $6EB3: $C6 $30
    cp   $60                                      ; $6EB5: $FE $60
    jr   nc, .jr_6EC3                             ; $6EB7: $30 $0A

    ld   a, e                                     ; $6EB9: $7B
    cp   $02                                      ; $6EBA: $FE $02
    ret  nz                                       ; $6EBC: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $6EBD: $21 $B0 $C2
    add  hl, bc                                   ; $6EC0: $09
    ld   [hl], $01                                ; $6EC1: $36 $01

.jr_6EC3
    call IncrementEntityState                     ; $6EC3: $CD $12 $3B
    ld   [hl], $07                                ; $6EC6: $36 $07
    call GetEntityTransitionCountdown             ; $6EC8: $CD $05 $0C
    ld   [hl], $20                                ; $6ECB: $36 $20
    jp   label_007_6BDF                           ; $6ECD: $C3 $DF $6B

func_007_6ED0::
    ld   hl, wEntitiesPosZTable                   ; $6ED0: $21 $10 $C3
    add  hl, bc                                   ; $6ED3: $09
    ld   [hl], $7F                                ; $6ED4: $36 $7F
    call GetEntityTransitionCountdown             ; $6ED6: $CD $05 $0C
    ld   [hl], $80                                ; $6ED9: $36 $80
    ldh  a, [hDefaultMusicTrack]                  ; $6EDB: $F0 $B0
    ld   hl, wEntitiesPrivateState5Table          ; $6EDD: $21 $90 $C3
    add  hl, bc                                   ; $6EE0: $09
    ld   [hl], a                                  ; $6EE1: $77
    ld   hl, wEntitiesHealthTable                 ; $6EE2: $21 $60 $C3
    add  hl, bc                                   ; $6EE5: $09
    ld   [hl], $FF                                ; $6EE6: $36 $FF
    ldh  a, [hMapRoom]                            ; $6EE8: $F0 $F6
    cp   UNKNOWN_ROOM_80                          ; $6EEA: $FE $80
    jr   nz, func_007_6EF0                        ; $6EEC: $20 $02

    ld   [hl], $C0                                ; $6EEE: $36 $C0

func_007_6EF0::
    ld   a, $F8                                   ; $6EF0: $3E $F8
    ld   [wD20A], a                               ; $6EF2: $EA $0A $D2
    ld   a, $F8                                   ; $6EF5: $3E $F8
    ld   [wD20B], a                               ; $6EF7: $EA $0B $D2
    ld   a, $F0                                   ; $6EFA: $3E $F0
    ld   [wD20E], a                               ; $6EFC: $EA $0E $D2
    ld   a, $00                                   ; $6EFF: $3E $00
    ld   [wD207], a                               ; $6F01: $EA $07 $D2
    ld   [wD208], a                               ; $6F04: $EA $08 $D2
    ld   [wD209], a                               ; $6F07: $EA $09 $D2
    ld   a, $10                                   ; $6F0A: $3E $10
    ld   [wD20C], a                               ; $6F0C: $EA $0C $D2
    ld   a, $F0                                   ; $6F0F: $3E $F0
    ld   [wD20D], a                               ; $6F11: $EA $0D $D2
    ret                                           ; $6F14: $C9

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
    ld   hl, wEntitiesPosZTable                   ; $6FB1: $21 $10 $C3
    add  hl, bc                                   ; $6FB4: $09
    ld   a, [hl]                                  ; $6FB5: $7E
    cp   $70                                      ; $6FB6: $FE $70
    ret  nc                                       ; $6FB8: $D0

    call func_007_6FE6                            ; $6FB9: $CD $E6 $6F
    call func_007_7015                            ; $6FBC: $CD $15 $70
    call func_007_703A                            ; $6FBF: $CD $3A $70
    call func_007_706F                            ; $6FC2: $CD $6F $70
    call func_007_7090                            ; $6FC5: $CD $90 $70
    ld   hl, wEntitiesPosZTable                   ; $6FC8: $21 $10 $C3
    add  hl, bc                                   ; $6FCB: $09
    ld   a, [hl]                                  ; $6FCC: $7E
    and  a                                        ; $6FCD: $A7
    jr   z, .jr_6FE3                              ; $6FCE: $28 $13

    ldh  a, [hActiveEntityPosY]                   ; $6FD0: $F0 $EF
    sub  $02                                      ; $6FD2: $D6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $6FD4: $E0 $EC
    ld   hl, Data_007_6FA1                        ; $6FD6: $21 $A1 $6F
    ld   c, $04                                   ; $6FD9: $0E $04
    call RenderActiveEntitySpritesRect            ; $6FDB: $CD $E6 $3C
    ld   a, $04                                   ; $6FDE: $3E $04
    call func_015_7964_trampoline                 ; $6FE0: $CD $A0 $3D

.jr_6FE3
    jp   CopyEntityPositionToActivePosition       ; $6FE3: $C3 $8A $3D

func_007_6FE6::
    ld   a, [wD20C]                               ; $6FE6: $FA $0C $D2
    ld   hl, hActiveEntityPosX                    ; $6FE9: $21 $EE $FF
    add  [hl]                                     ; $6FEC: $86
    ld   [hl], a                                  ; $6FED: $77
    ld   a, [wD20D]                               ; $6FEE: $FA $0D $D2
    ld   hl, hActiveEntityVisualPosY              ; $6FF1: $21 $EC $FF
    add  [hl]                                     ; $6FF4: $86
    ld   [hl], a                                  ; $6FF5: $77
    ld   a, [wD207]                               ; $6FF6: $FA $07 $D2
    cp   $FF                                      ; $6FF9: $FE $FF
    jr   z, .jr_7012                              ; $6FFB: $28 $15

    rla                                           ; $6FFD: $17
    rla                                           ; $6FFE: $17
    rla                                           ; $6FFF: $17
    and  $F8                                      ; $7000: $E6 $F8
    ld   e, a                                     ; $7002: $5F
    ld   d, b                                     ; $7003: $50
    ld   hl, Data_007_6F59                        ; $7004: $21 $59 $6F
    add  hl, de                                   ; $7007: $19
    ld   c, $02                                   ; $7008: $0E $02
    call RenderActiveEntitySpritesRect            ; $700A: $CD $E6 $3C
    ld   a, $02                                   ; $700D: $3E $02
    jp   label_007_7034                           ; $700F: $C3 $34 $70

.jr_7012
    jp   CopyEntityPositionToActivePosition       ; $7012: $C3 $8A $3D

func_007_7015::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $7015: $21 $00 $C3
    add  hl, bc                                   ; $7018: $09
    ld   a, [hl]                                  ; $7019: $7E
    and  a                                        ; $701A: $A7
    ret  z                                        ; $701B: $C8

    call func_007_70B7                            ; $701C: $CD $B7 $70
    ld   hl, wEntitiesDirectionTable              ; $701F: $21 $80 $C3
    add  hl, bc                                   ; $7022: $09
    ld   a, [hl]                                  ; $7023: $7E
    ld   hl, Data_007_6F79                        ; $7024: $21 $79 $6F
    and  a                                        ; $7027: $A7
    jr   z, .jr_702D                              ; $7028: $28 $03

    ld   hl, Data_007_6F8D                        ; $702A: $21 $8D $6F

.jr_702D
    ld   c, $05                                   ; $702D: $0E $05
    call RenderActiveEntitySpritesRect            ; $702F: $CD $E6 $3C
    ld   a, $05                                   ; $7032: $3E $05

label_007_7034:
    call func_015_7964_trampoline                 ; $7034: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $7037: $C3 $8A $3D

func_007_703A::
    ld   a, [wD20A]                               ; $703A: $FA $0A $D2
    ld   hl, hActiveEntityPosX                    ; $703D: $21 $EE $FF
    add  [hl]                                     ; $7040: $86
    ld   [hl], a                                  ; $7041: $77
    ld   a, [wD20A]                               ; $7042: $FA $0A $D2
    add  $0C                                      ; $7045: $C6 $0C
    ld   [wD5C0], a                               ; $7047: $EA $C0 $D5
    ld   a, [wD20B]                               ; $704A: $FA $0B $D2
    ld   hl, hActiveEntityVisualPosY              ; $704D: $21 $EC $FF
    add  [hl]                                     ; $7050: $86
    ld   [hl], a                                  ; $7051: $77
    ld   a, [wD20B]                               ; $7052: $FA $0B $D2
    add  $08                                      ; $7055: $C6 $08
    ld   [wD5C2], a                               ; $7057: $EA $C2 $D5
    ld   a, $08                                   ; $705A: $3E $08
    ld   [wD5C0+1], a                             ; $705C: $EA $C1 $D5
    ld   a, $06                                   ; $705F: $3E $06
    ld   [wD5C2+1], a                             ; $7061: $EA $C3 $D5
    ld   de, Unknown041SpriteVariants             ; $7064: $11 $15 $6F
    call RenderActiveEntitySpritesPair            ; $7067: $CD $C0 $3B
    ld   a, $02                                   ; $706A: $3E $02
    jp   label_007_7034                           ; $706C: $C3 $34 $70

func_007_706F::
    ld   a, [wD20E]                               ; $706F: $FA $0E $D2
    ld   hl, hActiveEntityVisualPosY              ; $7072: $21 $EC $FF
    add  [hl]                                     ; $7075: $86
    ld   [hl], a                                  ; $7076: $77
    ld   a, [wD208]                               ; $7077: $FA $08 $D2
    rla                                           ; $707A: $17
    rla                                           ; $707B: $17
    rla                                           ; $707C: $17
    rla                                           ; $707D: $17
    and  $F0                                      ; $707E: $E6 $F0
    ld   e, a                                     ; $7080: $5F
    ld   d, b                                     ; $7081: $50
    ld   hl, Data_007_6F19                        ; $7082: $21 $19 $6F
    add  hl, de                                   ; $7085: $19
    ld   c, $04                                   ; $7086: $0E $04
    call RenderActiveEntitySpritesRect            ; $7088: $CD $E6 $3C
    ld   a, $04                                   ; $708B: $3E $04
    jp   label_007_7034                           ; $708D: $C3 $34 $70

func_007_7090::
    ld   a, [wD20E]                               ; $7090: $FA $0E $D2
    cp   $00                                      ; $7093: $FE $00
    ret  z                                        ; $7095: $C8

    ld   a, [wD20F]                               ; $7096: $FA $0F $D2
    ld   hl, hActiveEntityVisualPosY              ; $7099: $21 $EC $FF
    add  [hl]                                     ; $709C: $86
    ld   [hl], a                                  ; $709D: $77
    ld   a, [wD209]                               ; $709E: $FA $09 $D2
    rla                                           ; $70A1: $17
    rla                                           ; $70A2: $17
    rla                                           ; $70A3: $17
    rla                                           ; $70A4: $17
    and  $F0                                      ; $70A5: $E6 $F0
    ld   e, a                                     ; $70A7: $5F
    ld   d, b                                     ; $70A8: $50
    ld   hl, Data_007_6F39                        ; $70A9: $21 $39 $6F
    add  hl, de                                   ; $70AC: $19
    ld   c, $04                                   ; $70AD: $0E $04
    call RenderActiveEntitySpritesRect            ; $70AF: $CD $E6 $3C
    ld   a, $04                                   ; $70B2: $3E $04
    jp   label_007_7034                           ; $70B4: $C3 $34 $70

func_007_70B7::
    ld   hl, wIsLinkInTheAir                      ; $70B7: $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ; $70BA: $FA $C7 $DB
    or   [hl]                                     ; $70BD: $B6
    jr   nz, ret_007_7111                         ; $70BE: $20 $51

    ldh  a, [hActiveEntityVisualPosY]             ; $70C0: $F0 $EC
    add  $18                                      ; $70C2: $C6 $18
    ld   e, a                                     ; $70C4: $5F
    ldh  a, [hLinkPositionY]                      ; $70C5: $F0 $99
    ld   hl, hLinkPositionZ                       ; $70C7: $21 $A2 $FF
    sub  [hl]                                     ; $70CA: $96
    add  $08                                      ; $70CB: $C6 $08
    sub  e                                        ; $70CD: $93
    add  $0C                                      ; $70CE: $C6 $0C
    cp   $18                                      ; $70D0: $FE $18
    jr   nc, ret_007_7111                         ; $70D2: $30 $3D

    ld   hl, wEntitiesDirectionTable              ; $70D4: $21 $80 $C3
    add  hl, bc                                   ; $70D7: $09
    ld   e, $08                                   ; $70D8: $1E $08
    ld   a, [hl]                                  ; $70DA: $7E
    and  a                                        ; $70DB: $A7
    jr   z, .jr_70E0                              ; $70DC: $28 $02

    ld   e, $F8                                   ; $70DE: $1E $F8

.jr_70E0
    ldh  a, [hActiveEntityPosX]                   ; $70E0: $F0 $EE
    add  e                                        ; $70E2: $83
    ld   hl, hLinkPositionX                       ; $70E3: $21 $98 $FF
    sub  [hl]                                     ; $70E6: $96
    add  $1A                                      ; $70E7: $C6 $1A
    cp   $34                                      ; $70E9: $FE $34
    jr   nc, ret_007_7111                         ; $70EB: $30 $24

    ld   a, $28                                   ; $70ED: $3E $28
    call GetVectorTowardsLink_trampoline          ; $70EF: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $70F2: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $70F4: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $70F6: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $70F8: $E0 $9A
    ld   a, $02                                   ; $70FA: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $70FC: $EA $46 $C1
    ld   a, $13                                   ; $70FF: $3E $13
    ldh  [hLinkVelocityZ], a                      ; $7101: $E0 $A3
    ld   a, $08                                   ; $7103: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $7105: $EA $94 $DB
    ld   a, $20                                   ; $7108: $3E $20
    ld   [wInvincibilityCounter], a               ; $710A: $EA $C7 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ; $710D: $3E $03
    ldh  [hWaveSfx], a                            ; $710F: $E0 $F3

ret_007_7111:
    ret                                           ; $7111: $C9
