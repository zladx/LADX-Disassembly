; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

PlayDoorUnlockedSfx::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $4000: $3E $04
    ldh  [hNoiseSfx], a                           ; $4002: $E0 $F4
    ret                                           ; $4004: $C9

GetEntitySpeedYAddress::
    ld   hl, wEntitiesSpeedYTable                 ; $4005: $21 $50 $C2
    add  hl, bc                                   ; $4008: $09
    ret                                           ; $4009: $C9

include "code/entities/07_bushcrawler.asm"
include "code/entities/07_fisherman_under_bridge.asm"
include "code/entities/07_mermaid.asm"
include "code/entities/07_papahl.asm"
include "code/entities/07_bear.asm"
include "code/entities/07_honeycomb.asm"
include "code/entities/07_tarinbeekeeper.asm"
include "code/entities/07_holefiller.asm"
include "code/entities/07_pincer.asm"
include "code/entities/07_tradingitem.asm"
include "code/entities/07_wingedoctorok.asm"
include "code/entities/07_kiki.asm"
include "code/entities/07_blooper.asm"
include "code/entities/07_smashablepillar.asm"
include "code/entities/07_wreckingball.asm"
include "code/entities/07_sideviewweights.asm"
include "code/entities/07_sideviewplatform.asm"
include "code/entities/07_goomba.asm"
include "code/entities/07_peahat.asm"
include "code/entities/07_snake.asm"
include "code/entities/07_master_stalfos.asm"
include "code/entities/07_fireball_shooter.asm"
include "code/entities/07_kanalet_bombable_wall.asm"
include "code/entities/07_star.asm"
include "code/entities/07_hiding_zol.asm"
include "code/entities/07_flying_tiles_spawner.asm"
include "code/entities/07_water_tektite.asm"
include "code/entities/07_horse_piece.asm"
include "code/entities/07_spiked_beetle.asm"
include "code/entities/07_moblin_sword.asm"
include "code/entities/07_chest_with_item.asm"

PushLinkOutOfEntity_07::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7CF0: $CD $5A $3B
    jr   nc, .jr_007_7D14                         ; $7CF3: $30 $1F

    call CopyLinkFinalPositionToPosition          ; $7CF5: $CD $BE $0C
    call ResetPegasusBoots                        ; $7CF8: $CD $B6 $0C
    ld   a, [wC1A6]                               ; $7CFB: $FA $A6 $C1
    and  a                                        ; $7CFE: $A7
    jr   z, .jr_7D12                              ; $7CFF: $28 $11

    ld   e, a                                     ; $7D01: $5F
    ld   d, b                                     ; $7D02: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7D03: $21 $9F $C3
    add  hl, de                                   ; $7D06: $19
    ld   a, [hl]                                  ; $7D07: $7E
    cp   $03                                      ; $7D08: $FE $03
    jr   nz, .jr_7D12                             ; $7D0A: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $7D0C: $21 $8F $C2
    add  hl, de                                   ; $7D0F: $19
    ld   [hl], $00                                ; $7D10: $36 $00

.jr_7D12
    scf                                           ; $7D12: $37
    ret                                           ; $7D13: $C9

.jr_007_7D14
    and  a                                        ; $7D14: $A7
    ret                                           ; $7D15: $C9

Data_007_7D16::
    db   $06, $04, $02, $00

func_007_7D1A::
    ld   hl, wEntitiesDirectionTable              ; $7D1A: $21 $80 $C3
    add  hl, bc                                   ; $7D1D: $09
    ld   e, [hl]                                  ; $7D1E: $5E
    ld   d, b                                     ; $7D1F: $50
    ld   hl, Data_007_7D16                        ; $7D20: $21 $16 $7D
    add  hl, de                                   ; $7D23: $19
    push hl                                       ; $7D24: $E5
    ld   hl, wEntitiesInertiaTable                ; $7D25: $21 $D0 $C3
    add  hl, bc                                   ; $7D28: $09
    inc  [hl]                                     ; $7D29: $34
    ld   a, [hl]                                  ; $7D2A: $7E
    rra                                           ; $7D2B: $1F
    rra                                           ; $7D2C: $1F
    rra                                           ; $7D2D: $1F
    rra                                           ; $7D2E: $1F
    pop  hl                                       ; $7D2F: $E1
    and  $01                                      ; $7D30: $E6 $01
    or   [hl]                                     ; $7D32: $B6
    jp   SetEntitySpriteVariant                   ; $7D33: $C3 $0C $3B

func_007_7D36::
    ld   e, b                                     ; $7D36: $58
    ldh  a, [hLinkPositionY]                      ; $7D37: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D39: $21 $EF $FF
    sub  [hl]                                     ; $7D3C: $96
    add  $14                                      ; $7D3D: $C6 $14
    cp   $38                                      ; $7D3F: $FE $38
    jr   jr_007_7D4E                              ; $7D41: $18 $0B

func_007_7D43::
    ld   e, b                                     ; $7D43: $58
    ldh  a, [hLinkPositionY]                      ; $7D44: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D46: $21 $EF $FF
    sub  [hl]                                     ; $7D49: $96
    add  $14                                      ; $7D4A: $C6 $14
    cp   $28                                      ; $7D4C: $FE $28

jr_007_7D4E:
    jr   nc, jr_007_7D94                          ; $7D4E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7D50: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7D52: $21 $EE $FF
    sub  [hl]                                     ; $7D55: $96
    add  $10                                      ; $7D56: $C6 $10
    cp   $20                                      ; $7D58: $FE $20
    jr   nc, jr_007_7D94                          ; $7D5A: $30 $38

    inc  e                                        ; $7D5C: $1C
    ldh  a, [hActiveEntityType]                   ; $7D5D: $F0 $EB
    cp   ENTITY_BEAR                              ; $7D5F: $FE $B5
    jr   z, .jr_7D6F                              ; $7D61: $28 $0C

    push de                                       ; $7D63: $D5
    call func_007_7E7D                            ; $7D64: $CD $7D $7E
    ldh  a, [hLinkDirection]                      ; $7D67: $F0 $9E
    xor  $01                                      ; $7D69: $EE $01
    cp   e                                        ; $7D6B: $BB
    pop  de                                       ; $7D6C: $D1
    jr   nz, jr_007_7D94                          ; $7D6D: $20 $25

.jr_7D6F
    ld   hl, wItemUsageContext                    ; $7D6F: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7D72: $36 $01
    ld   a, [wDialogState]                        ; $7D74: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D77: $21 $4F $C1
    or   [hl]                                     ; $7D7A: $B6
    ld   hl, wIsLinkInTheAir                      ; $7D7B: $21 $46 $C1
    or   [hl]                                     ; $7D7E: $B6
    ld   hl, wDialogCooldown                      ; $7D7F: $21 $34 $C1
    or   [hl]                                     ; $7D82: $B6
    jr   nz, jr_007_7D94                          ; $7D83: $20 $0F

    ld   a, [wWindowY]                            ; $7D85: $FA $9A $DB
    cp   $80                                      ; $7D88: $FE $80
    jr   nz, jr_007_7D94                          ; $7D8A: $20 $08

    ldh  a, [hJoypadState]                        ; $7D8C: $F0 $CC
    and  J_A                                      ; $7D8E: $E6 $10
    jr   z, jr_007_7D94                           ; $7D90: $28 $02

    scf                                           ; $7D92: $37
    ret                                           ; $7D93: $C9

jr_007_7D94:
    and  a                                        ; $7D94: $A7
    ret                                           ; $7D95: $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_07::
    ldh  a, [hActiveEntityStatus]                 ; $7D96: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7D98: $FE $05
    jr   nz, .skip                                ; $7D9A: $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7D9C: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7D9F: $FE $07
    jr   z, .skip                                 ; $7DA1: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7DA3: $FE $0B
    jr   nz, .skip                                ; $7DA5: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DA7: $FA $6B $C1
    cp   $04                                      ; $7DAA: $FE $04
    jr   nz, .skip                                ; $7DAC: $20 $13

    ld   a, [wDialogState]                        ; $7DAE: $FA $9F $C1
    ld   hl, wC1A8                                ; $7DB1: $21 $A8 $C1
    or   [hl]                                     ; $7DB4: $B6
    ld   hl, wInventoryAppearing                  ; $7DB5: $21 $4F $C1
    or   [hl]                                     ; $7DB8: $B6
    jr   nz, .skip                                ; $7DB9: $20 $06

    ld   a, [wRoomTransitionState]                ; $7DBB: $FA $24 $C1
    and  a                                        ; $7DBE: $A7
    jr   z, .return                               ; $7DBF: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7DC1: $F1

.return
    ret                                           ; $7DC2: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_07::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7DC3: $21 $10 $C4
    add  hl, bc                                   ; $7DC6: $09
    ld   a, [hl]                                  ; $7DC7: $7E
    and  a                                        ; $7DC8: $A7
    jr   z, .return                               ; $7DC9: $28 $3E

    dec  a                                        ; $7DCB: $3D
    ld   [hl], a                                  ; $7DCC: $77

    call label_3E8E                               ; $7DCD: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7DD0: $21 $40 $C2
    add  hl, bc                                   ; $7DD3: $09
    ld   a, [hl]                                  ; $7DD4: $7E
    push af                                       ; $7DD5: $F5

    call GetEntitySpeedYAddress                   ; $7DD6: $CD $05 $40
    ld   a, [hl]                                  ; $7DD9: $7E
    push af                                       ; $7DDA: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7DDB: $21 $F0 $C3
    add  hl, bc                                   ; $7DDE: $09
    ld   a, [hl]                                  ; $7DDF: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7DE0: $21 $40 $C2
    add  hl, bc                                   ; $7DE3: $09
    ld   [hl], a                                  ; $7DE4: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7DE5: $21 $00 $C4
    add  hl, bc                                   ; $7DE8: $09
    ld   a, [hl]                                  ; $7DE9: $7E
    call GetEntitySpeedYAddress                   ; $7DEA: $CD $05 $40
    ld   [hl], a                                  ; $7DED: $77

    call UpdateEntityPosWithSpeed_07              ; $7DEE: $CD $0A $7E

    ld   hl, wEntitiesOptions1Table               ; $7DF1: $21 $30 $C4
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  $20                                      ; $7DF6: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7DF8: $20 $03

    call label_3B23                               ; $7DFA: $CD $23 $3B

.restoreOriginalSpeed
    call GetEntitySpeedYAddress                   ; $7DFD: $CD $05 $40
    pop  af                                       ; $7E00: $F1
    ld   [hl], a                                  ; $7E01: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7E02: $21 $40 $C2
    add  hl, bc                                   ; $7E05: $09
    pop  af                                       ; $7E06: $F1
    ld   [hl], a                                  ; $7E07: $77
    pop  af                                       ; $7E08: $F1

.return
    ret                                           ; $7E09: $C9

UpdateEntityPosWithSpeed_07::
    call AddEntitySpeedToPos_07                   ; $7E0A: $CD $17 $7E
    push bc                                       ; $7E0D: $C5
    ld   a, c                                     ; $7E0E: $79
    add  $10                                      ; $7E0F: $C6 $10
    ld   c, a                                     ; $7E11: $4F
    call AddEntitySpeedToPos_07                   ; $7E12: $CD $17 $7E
    pop  bc                                       ; $7E15: $C1
    ret                                           ; $7E16: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_07::
    ld   hl, wEntitiesSpeedXTable                 ; $7E17: $21 $40 $C2
    add  hl, bc                                   ; $7E1A: $09
    ld   a, [hl]                                  ; $7E1B: $7E
    and  a                                        ; $7E1C: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7E1D: $28 $23

    push af                                       ; $7E1F: $F5
    swap a                                        ; $7E20: $CB $37
    and  $F0                                      ; $7E22: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7E24: $21 $60 $C2
    add  hl, bc                                   ; $7E27: $09
    add  [hl]                                     ; $7E28: $86
    ld   [hl], a                                  ; $7E29: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7E2A: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7E2C: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7E2F: $09
    pop  af                                       ; $7E30: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7E31: $1E $00
    bit  7, a                                     ; $7E33: $CB $7F
    jr   z, .positive                             ; $7E35: $28 $02

    ld   e, $F0                                   ; $7E37: $1E $F0

.positive
    swap a                                        ; $7E39: $CB $37
    and  $0F                                      ; $7E3B: $E6 $0F
    or   e                                        ; $7E3D: $B3
    ; Get carry back from d
    rr   d                                        ; $7E3E: $CB $1A
    adc  [hl]                                     ; $7E40: $8E
    ld   [hl], a                                  ; $7E41: $77

.return
    ret                                           ; $7E42: $C9

AddEntityZSpeedToPos_07::
    ld   hl, wEntitiesSpeedZTable                 ; $7E43: $21 $20 $C3
    add  hl, bc                                   ; $7E46: $09
    ld   a, [hl]                                  ; $7E47: $7E
    and  a                                        ; $7E48: $A7
    jr   z, AddEntitySpeedToPos_07.return         ; $7E49: $28 $F7

    push af                                       ; $7E4B: $F5
    swap a                                        ; $7E4C: $CB $37
    and  $F0                                      ; $7E4E: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7E50: $21 $30 $C3
    add  hl, bc                                   ; $7E53: $09
    add  [hl]                                     ; $7E54: $86
    ld   [hl], a                                  ; $7E55: $77
    rl   d                                        ; $7E56: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7E58: $21 $10 $C3
    jr   AddEntitySpeedToPos_07.updatePosition    ; $7E5B: $18 $D2

EntityLinkPositionXDifference_07::
    ld   e, $00                                   ; $7E5D: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E5F: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7E61: $21 $00 $C2
    add  hl, bc                                   ; $7E64: $09
    sub  [hl]                                     ; $7E65: $96
    bit  7, a                                     ; $7E66: $CB $7F
    jr   z, .jr_7E6B                              ; $7E68: $28 $01

    inc  e                                        ; $7E6A: $1C

.jr_7E6B
    ld   d, a                                     ; $7E6B: $57
    ret                                           ; $7E6C: $C9

EntityLinkPositionYDifference_07::
    ld   e, $02                                   ; $7E6D: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E6F: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7E71: $21 $10 $C2
    add  hl, bc                                   ; $7E74: $09
    sub  [hl]                                     ; $7E75: $96
    bit  7, a                                     ; $7E76: $CB $7F
    jr   nz, .jr_7E7B                             ; $7E78: $20 $01

    inc  e                                        ; $7E7A: $1C

.jr_7E7B
    ld   d, a                                     ; $7E7B: $57
    ret                                           ; $7E7C: $C9

func_007_7E7D::
    call EntityLinkPositionXDifference_07         ; $7E7D: $CD $5D $7E
    ld   a, e                                     ; $7E80: $7B
    ldh  [hMultiPurpose0], a                      ; $7E81: $E0 $D7
    ld   a, d                                     ; $7E83: $7A
    bit  7, a                                     ; $7E84: $CB $7F
    jr   z, .jr_7E8A                              ; $7E86: $28 $02

    cpl                                           ; $7E88: $2F
    inc  a                                        ; $7E89: $3C

.jr_7E8A
    push af                                       ; $7E8A: $F5
    call EntityLinkPositionYDifference_07         ; $7E8B: $CD $6D $7E
    ld   a, e                                     ; $7E8E: $7B
    ldh  [hMultiPurpose1], a                      ; $7E8F: $E0 $D8
    ld   a, d                                     ; $7E91: $7A
    bit  7, a                                     ; $7E92: $CB $7F
    jr   z, .jr_7E98                              ; $7E94: $28 $02

    cpl                                           ; $7E96: $2F
    inc  a                                        ; $7E97: $3C

.jr_7E98
    pop  de                                       ; $7E98: $D1
    cp   d                                        ; $7E99: $BA
    jr   nc, .jr_7EA0                             ; $7E9A: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7E9C: $F0 $D7
    jr   jr_007_7EA2                              ; $7E9E: $18 $02

.jr_7EA0
    ldh  a, [hMultiPurpose1]                      ; $7EA0: $F0 $D8

jr_007_7EA2:
    ld   e, a                                     ; $7EA2: $5F
    ret                                           ; $7EA3: $C9

ClearEntityStatus_07::
    ld   hl, wEntitiesStatusTable                 ; $7EA4: $21 $80 $C2
    add  hl, bc                                   ; $7EA7: $09
    ld   [hl], b                                  ; $7EA8: $70
    ret                                           ; $7EA9: $C9

; Code related to master stalfos
label_007_7EAA:
    ld   hl, wEntitiesPrivateState2Table          ; $7EAA: $21 $C0 $C2
    add  hl, bc                                   ; $7EAD: $09
    ld   a, [hl]                                  ; $7EAE: $7E
    JP_TABLE                                      ; $7EAF
._00 dw func_007_7EB6                             ; $7EB0
._01 dw func_007_7EC7                             ; $7EB2
._02 dw func_007_7ED6                             ; $7EB4

func_007_7EB6::
    call GetEntityTransitionCountdown             ; $7EB6: $CD $05 $0C
    ld   [hl], $A0                                ; $7EB9: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7EBB: $21 $20 $C4
    add  hl, bc                                   ; $7EBE: $09
    ld   [hl], $FF                                ; $7EBF: $36 $FF

label_007_7EC1:
    ld   hl, wEntitiesPrivateState2Table          ; $7EC1: $21 $C0 $C2
    add  hl, bc                                   ; $7EC4: $09
    inc  [hl]                                     ; $7EC5: $34
    ret                                           ; $7EC6: $C9

func_007_7EC7::
    call GetEntityTransitionCountdown             ; $7EC7: $CD $05 $0C
    ret  nz                                       ; $7ECA: $C0

    ld   [hl], $C0                                ; $7ECB: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7ECD: $21 $20 $C4
    add  hl, bc                                   ; $7ED0: $09
    ld   [hl], $FF                                ; $7ED1: $36 $FF
    jp   label_007_7EC1                           ; $7ED3: $C3 $C1 $7E

func_007_7ED6::
    call GetEntityTransitionCountdown             ; $7ED6: $CD $05 $0C
    jr   nz, jr_007_7F13                          ; $7ED9: $20 $38

    ldh  a, [hActiveEntityType]                   ; $7EDB: $F0 $EB
    cp   ENTITY_MASTER_STALFOS                    ; $7EDD: $FE $5F
    jr   nz, .jr_7F0A                             ; $7EDF: $20 $29

    ld   a, ENTITY_KEY_DROP_POINT                 ; $7EE1: $3E $30
    call SpawnNewEntity_trampoline                ; $7EE3: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7EE6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7EE8: $21 $00 $C2
    add  hl, de                                   ; $7EEB: $19
    ld   [hl], a                                  ; $7EEC: $77
    ldh  a, [hMultiPurpose1]                      ; $7EED: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7EEF: $21 $10 $C2
    add  hl, de                                   ; $7EF2: $19
    ld   [hl], a                                  ; $7EF3: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7EF4: $21 $20 $C3
    add  hl, de                                   ; $7EF7: $19
    ld   [hl], $18                                ; $7EF8: $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $7EFA: $21 $F0 $C2
    add  hl, de                                   ; $7EFD: $19
    ld   [hl], $20                                ; $7EFE: $36 $20
    ld   hl, wEntitiesPrivateState5Table          ; $7F00: $21 $90 $C3
    add  hl, bc                                   ; $7F03: $09
    ld   a, [hl]                                  ; $7F04: $7E
    ldh  [hDefaultMusicTrack], a                  ; $7F05: $E0 $B0
    jp   jr_007_7F76                              ; $7F07: $C3 $76 $7F

.jr_7F0A
    call PlayBombExplosionSfx                     ; $7F0A: $CD $4B $0C
    call label_27DD                               ; $7F0D: $CD $DD $27
    jp   DidKillEnemy                             ; $7F10: $C3 $50 $3F

jr_007_7F13:
    jp   label_007_7F16                           ; $7F13: $C3 $16 $7F

label_007_7F16:
    and  $07                                      ; $7F16: $E6 $07
    ret  nz                                       ; $7F18: $C0

    call GetRandomByte                            ; $7F19: $CD $0D $28
    and  $1F                                      ; $7F1C: $E6 $1F
    sub  $10                                      ; $7F1E: $D6 $10
    ld   e, a                                     ; $7F20: $5F
    ld   hl, hActiveEntityPosX                    ; $7F21: $21 $EE $FF
    add  [hl]                                     ; $7F24: $86
    ld   [hl], a                                  ; $7F25: $77
    call GetRandomByte                            ; $7F26: $CD $0D $28
    and  $1F                                      ; $7F29: $E6 $1F
    sub  $14                                      ; $7F2B: $D6 $14
    ld   e, a                                     ; $7F2D: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7F2E: $21 $EC $FF
    add  [hl]                                     ; $7F31: $86
    ld   [hl], a                                  ; $7F32: $77
    jp   label_007_7F36                           ; $7F33: $C3 $36 $7F

label_007_7F36:
    call ReturnIfNonInteractive_07.allowInactiveEntity ; $7F36: $CD $9C $7D
    ldh  a, [hActiveEntityPosX]                   ; $7F39: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7F3B: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7F3D: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7F3F: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7F41: $3E $02
    call AddTranscientVfx                         ; $7F43: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7F46: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F48: $E0 $F4
    ret                                           ; $7F4A: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7F4B: $3E $36
    call SpawnNewEntity_trampoline                ; $7F4D: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7F50: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7F52: $21 $00 $C2
    add  hl, de                                   ; $7F55: $19
    ld   [hl], a                                  ; $7F56: $77
    ldh  a, [hMultiPurpose1]                      ; $7F57: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7F59: $21 $10 $C2
    add  hl, de                                   ; $7F5C: $19
    ld   [hl], a                                  ; $7F5D: $77
    ldh  a, [hIsSideScrolling]                    ; $7F5E: $F0 $F9
    and  a                                        ; $7F60: $A7
    jr   z, .jr_7F6A                              ; $7F61: $28 $07

    call GetEntitySpeedYAddress                   ; $7F63: $CD $05 $40
    ld   [hl], $F0                                ; $7F66: $36 $F0
    jr   jr_007_7F76                              ; $7F68: $18 $0C

.jr_7F6A
    ld   hl, wEntitiesSpeedZTable                 ; $7F6A: $21 $20 $C3
    add  hl, de                                   ; $7F6D: $19
    ld   [hl], $10                                ; $7F6E: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7F70: $21 $10 $C3
    add  hl, de                                   ; $7F73: $19
    ld   [hl], $08                                ; $7F74: $36 $08

jr_007_7F76:
    call ClearEntityStatus_07                     ; $7F76: $CD $A4 $7E
    ld   hl, hNoiseSfx                            ; $7F79: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $7F7C: $36 $1A
    ret                                           ; $7F7E: $C9
