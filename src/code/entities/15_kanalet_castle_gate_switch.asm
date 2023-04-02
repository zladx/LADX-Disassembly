KanaletCastleGateSwitchEntityHandler::
    ldh  a, [hRoomStatus]                         ; $409F: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $40A1: $E6 $20
    jp   nz, ClearEntityStatus_15                 ; $40A3: $C2 $31 $7C

    call ReturnIfNonInteractive_15                ; $40A6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $40A9: $F0 $F0
    JP_TABLE                                      ; $40AB
._00 dw func_015_40B2                             ; $40AC
._01 dw func_015_40C1                             ; $40AE
._02 dw func_015_40D5                             ; $40B0

func_015_40B2::
    ld   a, [wSwitchButtonPressed]                ; $40B2: $FA $CB $C1
    and  a                                        ; $40B5: $A7
    jr   z, .return                               ; $40B6: $28 $08

    call IncrementEntityState                     ; $40B8: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $40BB: $CD $05 $0C
    ld   [hl], $20                                ; $40BE: $36 $20

.return
    ret                                           ; $40C0: $C9

func_015_40C1::
    ld   a, $02                                   ; $40C1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40C3: $E0 $A1
    ld   [wC167], a                               ; $40C5: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $40C8: $CD $05 $0C
    ret  nz                                       ; $40CB: $C0

    ld   [hl], $30                                ; $40CC: $36 $30
    ld   a, NOISE_SFX_RUMBLE                      ; $40CE: $3E $11
    ldh  [hNoiseSfx], a                           ; $40D0: $E0 $F4
    jp   IncrementEntityState                     ; $40D2: $C3 $12 $3B

func_015_40D5::
    ld   a, $02                                   ; $40D5: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $40D7: $E0 $A1
    call GetEntityTransitionCountdown             ; $40D9: $CD $05 $0C
    jr   nz, .jr_40EF                             ; $40DC: $20 $11

    ld   [wC167], a                               ; $40DE: $EA $67 $C1
    ld   [wScreenShakeHorizontal], a              ; $40E1: $EA $55 $C1
    call_open_dialog Dialog039                    ; $40E4
    call func_015_7CDB                            ; $40E9: $CD $DB $7C
    jp   ClearEntityStatus_15                     ; $40EC: $C3 $31 $7C

.jr_40EF
    ld   e, $01                                   ; $40EF: $1E $01
    and  $04                                      ; $40F1: $E6 $04
    jr   z, .jr_40F7                              ; $40F3: $28 $02

    ld   e, $FF                                   ; $40F5: $1E $FF

.jr_40F7
    ld   a, e                                     ; $40F7: $7B
    ld   [wScreenShakeHorizontal], a              ; $40F8: $EA $55 $C1
    ret                                           ; $40FB: $C9
