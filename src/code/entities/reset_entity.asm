
; Reset all values for a given entity to zero.
;
; This function likely was moved from bank 3 to free some space.
;
; Inputs:
;   bc   entity slot index
ResetEntity::
    call ClearEntitySpeed                         ;; 15:4000 $CD $7F $3D
    ld   hl, wEntitiesSpeedZAccTable              ;; 15:4003 $21 $30 $C3
    add  hl, bc                                   ;; 15:4006 $09
    ld   [hl], b                                  ;; 15:4007 $70
    ld   hl, wEntitiesSpeedXAccTable              ;; 15:4008 $21 $60 $C2
    add  hl, bc                                   ;; 15:400B $09
    ld   [hl], b                                  ;; 15:400C $70
    ld   hl, wEntitiesSpeedYAccTable              ;; 15:400D $21 $70 $C2
    add  hl, bc                                   ;; 15:4010 $09
    ld   [hl], b                                  ;; 15:4011 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 15:4012 $21 $20 $C3
    add  hl, bc                                   ;; 15:4015 $09
    ld   [hl], b                                  ;; 15:4016 $70
    ld   hl, wEntitiesStateTable                  ;; 15:4017 $21 $90 $C2
    add  hl, bc                                   ;; 15:401A $09
    ld   [hl], b                                  ;; 15:401B $70
    ld   hl, wEntitiesCollisionsTable             ;; 15:401C $21 $A0 $C2
    add  hl, bc                                   ;; 15:401F $09
    ld   [hl], b                                  ;; 15:4020 $70
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4021 $21 $B0 $C2
    add  hl, bc                                   ;; 15:4024 $09
    ld   [hl], b                                  ;; 15:4025 $70
    ld   hl, wEntitiesPrivateState2Table          ;; 15:4026 $21 $C0 $C2
    add  hl, bc                                   ;; 15:4029 $09
    ld   [hl], b                                  ;; 15:402A $70
    ld   hl, wEntitiesPrivateState3Table          ;; 15:402B $21 $D0 $C2
    add  hl, bc                                   ;; 15:402E $09
    ld   [hl], b                                  ;; 15:402F $70
    ld   hl, wEntitiesPrivateState4Table          ;; 15:4030 $21 $40 $C4
    add  hl, bc                                   ;; 15:4033 $09
    ld   [hl], b                                  ;; 15:4034 $70
    ld   hl, wEntitiesPrivateState5Table          ;; 15:4035 $21 $90 $C3
    add  hl, bc                                   ;; 15:4038 $09
    ld   [hl], b                                  ;; 15:4039 $70
    ld   hl, wEntitiesTransitionCountdownTable    ;; 15:403A $21 $E0 $C2
    add  hl, bc                                   ;; 15:403D $09
    ld   [hl], b                                  ;; 15:403E $70
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 15:403F $21 $F0 $C2
    add  hl, bc                                   ;; 15:4042 $09
    ld   [hl], b                                  ;; 15:4043 $70
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 15:4044 $21 $00 $C3
    add  hl, bc                                   ;; 15:4047 $09
    ld   [hl], b                                  ;; 15:4048 $70
    ld   hl, wEntitiesPosZTable                   ;; 15:4049 $21 $10 $C3
    add  hl, bc                                   ;; 15:404C $09
    ld   [hl], b                                  ;; 15:404D $70
    ld   hl, wEntitiesDirectionTable              ;; 15:404E $21 $80 $C3
    add  hl, bc                                   ;; 15:4051 $09
    ld   [hl], b                                  ;; 15:4052 $70
    xor  a                                        ;; 15:4053 $AF
    call SetEntitySpriteVariant                   ;; 15:4054 $CD $0C $3B
    ld   hl, wEntitiesInertiaTable                ;; 15:4057 $21 $D0 $C3
    add  hl, bc                                   ;; 15:405A $09
    ld   [hl], b                                  ;; 15:405B $70
    ld   hl, wEntitiesHealthTable                 ;; 15:405C $21 $60 $C3
    add  hl, bc                                   ;; 15:405F $09
    ld   [hl], b                                  ;; 15:4060 $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 15:4061 $21 $10 $C4
    add  hl, bc                                   ;; 15:4064 $09
    ld   [hl], b                                  ;; 15:4065 $70
    ld   hl, wEntitiesPosXSignTable               ;; 15:4066 $21 $20 $C2
    add  hl, bc                                   ;; 15:4069 $09
    ld   [hl], b                                  ;; 15:406A $70
    ld   hl, wEntitiesPosYSignTable               ;; 15:406B $21 $30 $C2
    add  hl, bc                                   ;; 15:406E $09
    ld   [hl], b                                  ;; 15:406F $70
    ld   hl, wEntitiesGroundStatusTable           ;; 15:4070 $21 $70 $C4
    add  hl, bc                                   ;; 15:4073 $09
    ld   [hl], b                                  ;; 15:4074 $70
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 15:4075 $21 $50 $C4
    add  hl, bc                                   ;; 15:4078 $09
    ld   [hl], b                                  ;; 15:4079 $70
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 15:407A $21 $80 $C4
    add  hl, bc                                   ;; 15:407D $09
    ld   [hl], b                                  ;; 15:407E $70
    ld   hl, wEntitiesLiftedTable                 ;; 15:407F $21 $90 $C4
    add  hl, bc                                   ;; 15:4082 $09
    ld   [hl], b                                  ;; 15:4083 $70
    ld   hl, wEntitiesFlashCountdownTable         ;; 15:4084 $21 $20 $C4
    add  hl, bc                                   ;; 15:4087 $09
    ld   [hl], b                                  ;; 15:4088 $70
    ld   hl, wEntitiesDroppedItemTable            ;; 15:4089 $21 $E0 $C4
    add  hl, bc                                   ;; 15:408C $09
    ld   [hl], b                                  ;; 15:408D $70
    ld   hl, wEntitiesUnknowTableJ                ;; 15:408E $21 $F0 $C4
    add  hl, bc                                   ;; 15:4091 $09
    ld   [hl], b                                  ;; 15:4092 $70
    ld   hl, wEntitiesThrownDirectionTable        ;; 15:4093 $21 $D0 $C5
    add  hl, bc                                   ;; 15:4096 $09
    ld   [hl], $FF                                ;; 15:4097 $36 $FF
    ld   hl, wEntitiesPowerRecoilingTable         ;; 15:4099 $21 $A0 $C4
    add  hl, bc                                   ;; 15:409C $09
    ld   [hl], b                                  ;; 15:409D $70
    ret                                           ;; 15:409E $C9
