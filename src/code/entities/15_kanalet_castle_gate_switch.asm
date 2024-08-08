KanaletCastleGateSwitchEntityHandler::
    ldh  a, [hRoomStatus]                         ;; 15:409F $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 15:40A1 $E6 $20
    jp   nz, ClearEntityStatus_15                 ;; 15:40A3 $C2 $31 $7C

    call ReturnIfNonInteractive_15                ;; 15:40A6 $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ;; 15:40A9 $F0 $F0
    JP_TABLE                                      ;; 15:40AB
._00 dw func_015_40B2                             ;; 15:40AC
._01 dw func_015_40C1                             ;; 15:40AE
._02 dw func_015_40D5                             ;; 15:40B0

func_015_40B2::
    ld   a, [wSwitchButtonPressed]                ;; 15:40B2 $FA $CB $C1
    and  a                                        ;; 15:40B5 $A7
    jr   z, .return                               ;; 15:40B6 $28 $08

    call IncrementEntityState                     ;; 15:40B8 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 15:40BB $CD $05 $0C
    ld   [hl], $20                                ;; 15:40BE $36 $20

.return
    ret                                           ;; 15:40C0 $C9

func_015_40C1::
    ld   a, $02                                   ;; 15:40C1 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 15:40C3 $E0 $A1
    ld   [wC167], a                               ;; 15:40C5 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 15:40C8 $CD $05 $0C
    ret  nz                                       ;; 15:40CB $C0

    ld   [hl], $30                                ;; 15:40CC $36 $30
    ld   a, NOISE_SFX_RUMBLE                      ;; 15:40CE $3E $11
    ldh  [hNoiseSfx], a                           ;; 15:40D0 $E0 $F4
    jp   IncrementEntityState                     ;; 15:40D2 $C3 $12 $3B

func_015_40D5::
    ld   a, $02                                   ;; 15:40D5 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 15:40D7 $E0 $A1
    call GetEntityTransitionCountdown             ;; 15:40D9 $CD $05 $0C
    jr   nz, .jr_40EF                             ;; 15:40DC $20 $11

    ld   [wC167], a                               ;; 15:40DE $EA $67 $C1
    ld   [wScreenShakeHorizontal], a              ;; 15:40E1 $EA $55 $C1
    call_open_dialog Dialog039                    ;; 15:40E4
    call func_015_7CDB                            ;; 15:40E9 $CD $DB $7C
    jp   ClearEntityStatus_15                     ;; 15:40EC $C3 $31 $7C

.jr_40EF
    ld   e, $01                                   ;; 15:40EF $1E $01
    and  $04                                      ;; 15:40F1 $E6 $04
    jr   z, .jr_40F7                              ;; 15:40F3 $28 $02

    ld   e, $FF                                   ;; 15:40F5 $1E $FF

.jr_40F7
    ld   a, e                                     ;; 15:40F7 $7B
    ld   [wScreenShakeHorizontal], a              ;; 15:40F8 $EA $55 $C1
    ret                                           ;; 15:40FB $C9
