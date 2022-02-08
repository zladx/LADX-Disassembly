
; Reset all values for a given entity to zero.
;
; This function likely was moved from bank 3 to free some space.
;
; Inputs:
;   bc   entity slot index
ResetEntity::
    call ClearEntitySpeed                         ; $4000: $CD $7F $3D
    ld   hl, wEntitiesSpeedZAccTable              ; $4003: $21 $30 $C3
    add  hl, bc                                   ; $4006: $09
    ld   [hl], b                                  ; $4007: $70
    ld   hl, wEntitiesSpeedXAccTable              ; $4008: $21 $60 $C2
    add  hl, bc                                   ; $400B: $09
    ld   [hl], b                                  ; $400C: $70
    ld   hl, wEntitiesSpeedYAccTable              ; $400D: $21 $70 $C2
    add  hl, bc                                   ; $4010: $09
    ld   [hl], b                                  ; $4011: $70
    ld   hl, wEntitiesSpeedZTable                 ; $4012: $21 $20 $C3
    add  hl, bc                                   ; $4015: $09
    ld   [hl], b                                  ; $4016: $70
    ld   hl, wEntitiesStateTable                  ; $4017: $21 $90 $C2
    add  hl, bc                                   ; $401A: $09
    ld   [hl], b                                  ; $401B: $70
    ld   hl, wEntitiesCollisionsTable             ; $401C: $21 $A0 $C2
    add  hl, bc                                   ; $401F: $09
    ld   [hl], b                                  ; $4020: $70
    ld   hl, wEntitiesPrivateState1Table          ; $4021: $21 $B0 $C2
    add  hl, bc                                   ; $4024: $09
    ld   [hl], b                                  ; $4025: $70
    ld   hl, wEntitiesPrivateState2Table          ; $4026: $21 $C0 $C2
    add  hl, bc                                   ; $4029: $09
    ld   [hl], b                                  ; $402A: $70
    ld   hl, wEntitiesPrivateState3Table          ; $402B: $21 $D0 $C2
    add  hl, bc                                   ; $402E: $09
    ld   [hl], b                                  ; $402F: $70
    ld   hl, wEntitiesPrivateState4Table          ; $4030: $21 $40 $C4
    add  hl, bc                                   ; $4033: $09
    ld   [hl], b                                  ; $4034: $70
    ld   hl, wEntitiesUnknowTableR                ; $4035: $21 $90 $C3
    add  hl, bc                                   ; $4038: $09
    ld   [hl], b                                  ; $4039: $70
    ld   hl, wEntitiesTransitionCountdownTable    ; $403A: $21 $E0 $C2
    add  hl, bc                                   ; $403D: $09
    ld   [hl], b                                  ; $403E: $70
    ld   hl, wEntitiesPrivateCountdown1Table      ; $403F: $21 $F0 $C2
    add  hl, bc                                   ; $4042: $09
    ld   [hl], b                                  ; $4043: $70
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4044: $21 $00 $C3
    add  hl, bc                                   ; $4047: $09
    ld   [hl], b                                  ; $4048: $70
    ld   hl, wEntitiesPosZTable                   ; $4049: $21 $10 $C3
    add  hl, bc                                   ; $404C: $09
    ld   [hl], b                                  ; $404D: $70
    ld   hl, wEntitiesDirectionTable              ; $404E: $21 $80 $C3
    add  hl, bc                                   ; $4051: $09
    ld   [hl], b                                  ; $4052: $70
    xor  a                                        ; $4053: $AF
    call SetEntitySpriteVariant                   ; $4054: $CD $0C $3B
    ld   hl, wEntitiesUnknowTableY                ; $4057: $21 $D0 $C3
    add  hl, bc                                   ; $405A: $09
    ld   [hl], b                                  ; $405B: $70
    ld   hl, wEntitiesHealthTable                 ; $405C: $21 $60 $C3
    add  hl, bc                                   ; $405F: $09
    ld   [hl], b                                  ; $4060: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4061: $21 $10 $C4
    add  hl, bc                                   ; $4064: $09
    ld   [hl], b                                  ; $4065: $70
    ld   hl, wEntitiesPosXSignTable               ; $4066: $21 $20 $C2
    add  hl, bc                                   ; $4069: $09
    ld   [hl], b                                  ; $406A: $70
    ld   hl, wEntitiesPosYSignTable               ; $406B: $21 $30 $C2
    add  hl, bc                                   ; $406E: $09
    ld   [hl], b                                  ; $406F: $70
    ld   hl, wEntitiesUnknowTableI                ; $4070: $21 $70 $C4
    add  hl, bc                                   ; $4073: $09
    ld   [hl], b                                  ; $4074: $70
    ld   hl, wEntitiesDropTimerTable              ; $4075: $21 $50 $C4
    add  hl, bc                                   ; $4078: $09
    ld   [hl], b                                  ; $4079: $70
    ld   hl, wEntitiesUnknowTableV                ; $407A: $21 $80 $C4
    add  hl, bc                                   ; $407D: $09
    ld   [hl], b                                  ; $407E: $70
    ld   hl, wEntitiesUnknowTableW                ; $407F: $21 $90 $C4
    add  hl, bc                                   ; $4082: $09
    ld   [hl], b                                  ; $4083: $70
    ld   hl, wEntitiesFlashCountdownTable         ; $4084: $21 $20 $C4
    add  hl, bc                                   ; $4087: $09
    ld   [hl], b                                  ; $4088: $70
    ld   hl, wEntitiesDroppedItemTable            ; $4089: $21 $E0 $C4
    add  hl, bc                                   ; $408C: $09
    ld   [hl], b                                  ; $408D: $70
    ld   hl, wEntitiesUnknowTableJ                ; $408E: $21 $F0 $C4
    add  hl, bc                                   ; $4091: $09
    ld   [hl], b                                  ; $4092: $70
    ld   hl, wC5D0                                ; $4093: $21 $D0 $C5
    add  hl, bc                                   ; $4096: $09
    ld   [hl], $FF                                ; $4097: $36 $FF
    ld   hl, wEntitiesPowerRecoilingTable         ; $4099: $21 $A0 $C4
    add  hl, bc                                   ; $409C: $09
    ld   [hl], b                                  ; $409D: $70
    ret                                           ; $409E: $C9
