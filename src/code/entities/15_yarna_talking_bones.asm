YarnaTalkingBonesEntityHandler::
    call ReturnIfNonInteractive_15                ; $443F: $CD $0D $7B
    ld   e, $0F                                   ; $4442: $1E $0F
    ld   d, b                                     ; $4444: $50

jr_015_4445:
    ld   hl, wEntitiesStatusTable                 ; $4445: $21 $80 $C2
    add  hl, de                                   ; $4448: $19
    ld   a, [hl]                                  ; $4449: $7E
    cp   $05                                      ; $444A: $FE $05
    jr   nz, jr_015_448C                          ; $444C: $20 $3E

    ld   hl, wEntitiesTypeTable                   ; $444E: $21 $A0 $C3
    add  hl, de                                   ; $4451: $19
    ld   a, [hl]                                  ; $4452: $7E
    cp   $08                                      ; $4453: $FE $08
    jr   nz, jr_015_448C                          ; $4455: $20 $35

    ld   hl, wEntitiesTransitionCountdownTable    ; $4457: $21 $E0 $C2
    add  hl, de                                   ; $445A: $19
    ld   a, [hl]                                  ; $445B: $7E
    cp   $08                                      ; $445C: $FE $08
    jr   nz, jr_015_448C                          ; $445E: $20 $2C

    ld   hl, wEntitiesPosXTable                   ; $4460: $21 $00 $C2
    add  hl, de                                   ; $4463: $19
    ldh  a, [hActiveEntityPosX]                   ; $4464: $F0 $EE
    sub  [hl]                                     ; $4466: $96
    add  $08                                      ; $4467: $C6 $08
    cp   $10                                      ; $4469: $FE $10
    jr   nc, jr_015_448C                          ; $446B: $30 $1F

    ld   hl, wEntitiesPosYTable                   ; $446D: $21 $10 $C2
    add  hl, de                                   ; $4470: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4471: $F0 $EC
    sub  [hl]                                     ; $4473: $96
    add  $08                                      ; $4474: $C6 $08
    cp   $10                                      ; $4476: $FE $10
    jr   nc, jr_015_448C                          ; $4478: $30 $12

    ldh  a, [hMapRoom]                            ; $447A: $F0 $F6
    cp   UNKNOWN_ROOM_DF                          ; $447C: $FE $DF
    ld_dialog_low a, Dialog092                    ; $447E: $3E $92
    jr   z, .jr_4489                              ; $4480: $28 $07

    ld   a, [wIsGhostFollowingLink]               ; $4482: $FA $79 $DB
    and  a                                        ; $4485: $A7
    ret  nz                                       ; $4486: $C0

    ld_dialog_low a, Dialog043                    ; $4487: $3E $43

.jr_4489
    jp   OpenDialogInTable0                       ; $4489: $C3 $85 $23

jr_015_448C:
    dec  e                                        ; $448C: $1D
    ld   a, e                                     ; $448D: $7B
    cp   $FF                                      ; $448E: $FE $FF
    jr   nz, jr_015_4445                          ; $4490: $20 $B3

    ret                                           ; $4492: $C9
