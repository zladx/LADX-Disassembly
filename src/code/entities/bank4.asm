; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/04_genie.asm"
include "code/entities/04_slime_eye.asm"
include "code/entities/04_facade.asm"
include "code/entities/04_moldorm.asm"
include "code/entities/04_minimoldorm.asm"
include "code/entities/04_ghini.asm"
include "code/entities/04_pairodd.asm"
include "code/entities/04_fishinggame.asm"
include "code/entities/04_tractordevice.asm"
include "code/entities/04_knight.asm"
include "code/entities/04_laser.asm"

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

ClearEntityStatusBank04::
    ld   hl, wEntitiesStatusTable                 ; $6D7A: $21 $80 $C2
    add  hl, bc                                   ; $6D7D: $09
    ld   [hl], b                                  ; $6D7E: $70
    ret                                           ; $6D7F: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_04::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6D80: $21 $10 $C4
    add  hl, bc                                   ; $6D83: $09
    ld   a, [hl]                                  ; $6D84: $7E
    and  a                                        ; $6D85: $A7
    jr   z, .return                               ; $6D86: $28 $41

    dec  a                                        ; $6D88: $3D
    ld   [hl], a                                  ; $6D89: $77

    call label_3E8E                               ; $6D8A: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $6D8D: $21 $40 $C2
    add  hl, bc                                   ; $6D90: $09
    ld   a, [hl]                                  ; $6D91: $7E
    push af                                       ; $6D92: $F5

    ld   hl, wEntitiesSpeedYTable                 ; $6D93: $21 $50 $C2
    add  hl, bc                                   ; $6D96: $09
    ld   a, [hl]                                  ; $6D97: $7E
    push af                                       ; $6D98: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $6D99: $21 $F0 $C3
    add  hl, bc                                   ; $6D9C: $09
    ld   a, [hl]                                  ; $6D9D: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6D9E: $21 $40 $C2
    add  hl, bc                                   ; $6DA1: $09
    ld   [hl], a                                  ; $6DA2: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $6DA3: $21 $00 $C4
    add  hl, bc                                   ; $6DA6: $09
    ld   a, [hl]                                  ; $6DA7: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6DA8: $21 $50 $C2
    add  hl, bc                                   ; $6DAB: $09
    ld   [hl], a                                  ; $6DAC: $77

    call UpdateEntityPosWithSpeed_04              ; $6DAD: $CD $CA $6D

    ld   hl, wEntitiesOptions1Table               ; $6DB0: $21 $30 $C4
    add  hl, bc                                   ; $6DB3: $09
    ld   a, [hl]                                  ; $6DB4: $7E
    and  $20                                      ; $6DB5: $E6 $20
    jr   nz, .restoreOriginalVelocity             ; $6DB7: $20 $03

    call label_3B23                               ; $6DB9: $CD $23 $3B

.restoreOriginalVelocity
    ld   hl, wEntitiesSpeedYTable                 ; $6DBC: $21 $50 $C2
    add  hl, bc                                   ; $6DBF: $09
    pop  af                                       ; $6DC0: $F1
    ld   [hl], a                                  ; $6DC1: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6DC2: $21 $40 $C2
    add  hl, bc                                   ; $6DC5: $09
    pop  af                                       ; $6DC6: $F1
    ld   [hl], a                                  ; $6DC7: $77
    pop  af                                       ; $6DC8: $F1

.return
    ret                                           ; $6DC9: $C9

UpdateEntityPosWithSpeed_04::
    call AddEntitySpeedToPos_04                   ; $6DCA: $CD $D7 $6D

UpdateEntityYPosWithSpeed_04::
    push bc                                       ; $6DCD: $C5
    ld   a, c                                     ; $6DCE: $79
    add  $10                                      ; $6DCF: $C6 $10
    ld   c, a                                     ; $6DD1: $4F
    call AddEntitySpeedToPos_04                   ; $6DD2: $CD $D7 $6D
    pop  bc                                       ; $6DD5: $C1
    ret                                           ; $6DD6: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_04::
    ld   hl, wEntitiesSpeedXTable                 ; $6DD7: $21 $40 $C2
    add  hl, bc                                   ; $6DDA: $09
    ld   a, [hl]                                  ; $6DDB: $7E
    and  a                                        ; $6DDC: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $6DDD: $28 $23

    push af                                       ; $6DDF: $F5
    swap a                                        ; $6DE0: $CB $37
    and  $F0                                      ; $6DE2: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $6DE4: $21 $60 $C2
    add  hl, bc                                   ; $6DE7: $09
    add  [hl]                                     ; $6DE8: $86
    ld   [hl], a                                  ; $6DE9: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $6DEA: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $6DEC: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $6DEF: $09
    pop  af                                       ; $6DF0: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $6DF1: $1E $00
    bit  7, a                                     ; $6DF3: $CB $7F
    jr   z, .positive                             ; $6DF5: $28 $02

    ld   e, $F0                                   ; $6DF7: $1E $F0

.positive
    swap a                                        ; $6DF9: $CB $37
    and  $0F                                      ; $6DFB: $E6 $0F
    or   e                                        ; $6DFD: $B3
    ; Get carry back from d
    rr   d                                        ; $6DFE: $CB $1A
    adc  [hl]                                     ; $6E00: $8E
    ld   [hl], a                                  ; $6E01: $77

.return
    ret                                           ; $6E02: $C9

AddEntityZSpeedToPos_04::
    ld   hl, wEntitiesSpeedZTable                 ; $6E03: $21 $20 $C3
    add  hl, bc                                   ; $6E06: $09
    ld   a, [hl]                                  ; $6E07: $7E
    and  a                                        ; $6E08: $A7
    jr   z, AddEntitySpeedToPos_04.return         ; $6E09: $28 $F7

    push af                                       ; $6E0B: $F5
    swap a                                        ; $6E0C: $CB $37
    and  $F0                                      ; $6E0E: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $6E10: $21 $30 $C3
    add  hl, bc                                   ; $6E13: $09
    add  [hl]                                     ; $6E14: $86
    ld   [hl], a                                  ; $6E15: $77
    rl   d                                        ; $6E16: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $6E18: $21 $10 $C3
    jr   AddEntitySpeedToPos_04.updatePosition    ; $6E1B: $18 $D2

func_004_6E1D::
    ld   hl, wEntitiesPrivateState1Table          ; $6E1D: $21 $B0 $C2
    add  hl, bc                                   ; $6E20: $09
    ld   a, [hl]                                  ; $6E21: $7E
    push af                                       ; $6E22: $F5
    swap a                                        ; $6E23: $CB $37
    and  $F0                                      ; $6E25: $E6 $F0
    ld   hl, wEntitiesPrivateState2Table          ; $6E27: $21 $C0 $C2
    add  hl, bc                                   ; $6E2A: $09
    add  [hl]                                     ; $6E2B: $86
    ld   [hl], a                                  ; $6E2C: $77
    rl   d                                        ; $6E2D: $CB $12
    ld   hl, wEntitiesPrivateState3Table          ; $6E2F: $21 $D0 $C2
    jp   AddEntitySpeedToPos_04.updatePosition    ; $6E32: $C3 $EF $6D

func_004_6E35::
    ld   e, $00                                   ; $6E35: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6E37: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $6E39: $21 $00 $C2
    add  hl, bc                                   ; $6E3C: $09
    sub  [hl]                                     ; $6E3D: $96
    bit  7, a                                     ; $6E3E: $CB $7F
    jr   z, .jr_6E43                              ; $6E40: $28 $01

    inc  e                                        ; $6E42: $1C

.jr_6E43
    ld   d, a                                     ; $6E43: $57
    ret                                           ; $6E44: $C9

func_004_6E45::
    ld   e, $02                                   ; $6E45: $1E $02
    ldh  a, [hLinkPositionY]                      ; $6E47: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $6E49: $21 $10 $C2
    add  hl, bc                                   ; $6E4C: $09
    sub  [hl]                                     ; $6E4D: $96
    bit  7, a                                     ; $6E4E: $CB $7F
    jr   nz, .jr_6E53                             ; $6E50: $20 $01

    inc  e                                        ; $6E52: $1C

.jr_6E53
    ld   d, a                                     ; $6E53: $57
    ret                                           ; $6E54: $C9

func_004_6E55::
    call func_004_6E35                            ; $6E55: $CD $35 $6E
    ld   a, e                                     ; $6E58: $7B
    ldh  [hMultiPurpose0], a                      ; $6E59: $E0 $D7
    ld   a, d                                     ; $6E5B: $7A
    bit  7, a                                     ; $6E5C: $CB $7F
    jr   z, .jr_6E62                              ; $6E5E: $28 $02

    cpl                                           ; $6E60: $2F
    inc  a                                        ; $6E61: $3C

.jr_6E62
    push af                                       ; $6E62: $F5
    call func_004_6E45                            ; $6E63: $CD $45 $6E
    ld   a, e                                     ; $6E66: $7B
    ldh  [hMultiPurpose1], a                      ; $6E67: $E0 $D8
    ld   a, d                                     ; $6E69: $7A
    bit  7, a                                     ; $6E6A: $CB $7F
    jr   z, .jr_6E70                              ; $6E6C: $28 $02

    cpl                                           ; $6E6E: $2F
    inc  a                                        ; $6E6F: $3C

.jr_6E70
    pop  de                                       ; $6E70: $D1
    cp   d                                        ; $6E71: $BA
    jr   nc, .jr_6E78                             ; $6E72: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $6E74: $F0 $D7
    jr   jr_004_6E7A                              ; $6E76: $18 $02

.jr_6E78
    ldh  a, [hMultiPurpose1]                      ; $6E78: $F0 $D8

jr_004_6E7A:
    ld   e, a                                     ; $6E7A: $5F
    ret                                           ; $6E7B: $C9

include "code/entities/04_trendy.asm"

Disabled4EEntityHandler::
    ret                                           ; $76CA: $C9

include "code/entities/04_shop.asm"

func_004_7C4B:: ; called only from fishing minigame
    ld   a, [wDialogState]                        ; $7C4B: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7C4E: $21 $4F $C1
    or   [hl]                                     ; $7C51: $B6
    ld   hl, wIsLinkInTheAir                      ; $7C52: $21 $46 $C1
    or   [hl]                                     ; $7C55: $B6
    ld   hl, wDialogCooldown                      ; $7C56: $21 $34 $C1
    or   [hl]                                     ; $7C59: $B6
    jr   nz, .jr_7C92                             ; $7C5A: $20 $36

    ld   a, [wWindowY]                            ; $7C5C: $FA $9A $DB
    cp   $80                                      ; $7C5F: $FE $80
    jr   nz, .jr_7C92                             ; $7C61: $20 $2F

    ldh  a, [hLinkPositionX]                      ; $7C63: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7C65: $21 $EE $FF
    sub  [hl]                                     ; $7C68: $96
    add  $10                                      ; $7C69: $C6 $10
    cp   $20                                      ; $7C6B: $FE $20
    jr   nc, .jr_7C92                             ; $7C6D: $30 $23

    ldh  a, [hLinkPositionY]                      ; $7C6F: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7C71: $21 $EF $FF
    sub  [hl]                                     ; $7C74: $96
    add  $14                                      ; $7C75: $C6 $14
    cp   $28                                      ; $7C77: $FE $28
    jr   nc, .jr_7C92                             ; $7C79: $30 $17

    call func_004_6E55                            ; $7C7B: $CD $55 $6E
    ldh  a, [hLinkDirection]                      ; $7C7E: $F0 $9E
    xor  $01                                      ; $7C80: $EE $01
    cp   e                                        ; $7C82: $BB
    jr   nz, .jr_7C92                             ; $7C83: $20 $0D

    ld   hl, wItemUsageContext                    ; $7C85: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7C88: $36 $01
    ldh  a, [hJoypadState]                        ; $7C8A: $F0 $CC
    and  J_A                                      ; $7C8C: $E6 $10
    jr   z, .jr_7C92                              ; $7C8E: $28 $02

    scf                                           ; $7C90: $37
    ret                                           ; $7C91: $C9

.jr_7C92
    and  a                                        ; $7C92: $A7
    ret                                           ; $7C93: $C9

Data_004_7C94::
    db   $06, $04, $02, $00

func_004_7C98::
    ld   hl, wEntitiesDirectionTable              ; $7C98: $21 $80 $C3
    add  hl, bc                                   ; $7C9B: $09
    ld   e, [hl]                                  ; $7C9C: $5E
    ld   d, b                                     ; $7C9D: $50
    ld   hl, Data_004_7C94                        ; $7C9E: $21 $94 $7C
    add  hl, de                                   ; $7CA1: $19
    push hl                                       ; $7CA2: $E5
    ld   hl, wEntitiesInertiaTable                ; $7CA3: $21 $D0 $C3
    add  hl, bc                                   ; $7CA6: $09
    inc  [hl]                                     ; $7CA7: $34
    ld   a, [hl]                                  ; $7CA8: $7E
    rra                                           ; $7CA9: $1F
    rra                                           ; $7CAA: $1F
    rra                                           ; $7CAB: $1F
    pop  hl                                       ; $7CAC: $E1
    and  $01                                      ; $7CAD: $E6 $01
    or   [hl]                                     ; $7CAF: $B6
    jp   SetEntitySpriteVariant                   ; $7CB0: $C3 $0C $3B

    ld   hl, wEntitiesSpeedXTable                 ; $7CB3: $21 $40 $C2
    add  hl, bc                                   ; $7CB6: $09
    ld   a, [hl]                                  ; $7CB7: $7E
    push af                                       ; $7CB8: $F5
    ld   [hl], $01                                ; $7CB9: $36 $01
    ld   hl, wEntitiesSpeedYTable                 ; $7CBB: $21 $50 $C2
    add  hl, bc                                   ; $7CBE: $09
    ld   a, [hl]                                  ; $7CBF: $7E
    push af                                       ; $7CC0: $F5
    ld   [hl], $01                                ; $7CC1: $36 $01
    call label_3B23                               ; $7CC3: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7CC6: $21 $A0 $C2
    add  hl, bc                                   ; $7CC9: $09
    ld   a, [hl]                                  ; $7CCA: $7E
    push af                                       ; $7CCB: $F5
    ld   hl, wEntitiesSpeedXTable                 ; $7CCC: $21 $40 $C2
    add  hl, bc                                   ; $7CCF: $09
    ld   [hl], $FF                                ; $7CD0: $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ; $7CD2: $21 $50 $C2
    add  hl, bc                                   ; $7CD5: $09
    ld   [hl], $FF                                ; $7CD6: $36 $FF
    call label_3B23                               ; $7CD8: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7CDB: $21 $A0 $C2
    add  hl, bc                                   ; $7CDE: $09
    pop  af                                       ; $7CDF: $F1
    or   [hl]                                     ; $7CE0: $B6
    ld   [hl], a                                  ; $7CE1: $77
    pop  af                                       ; $7CE2: $F1
    ld   hl, wEntitiesSpeedYTable                 ; $7CE3: $21 $50 $C2
    add  hl, bc                                   ; $7CE6: $09
    ld   [hl], a                                  ; $7CE7: $77
    pop  af                                       ; $7CE8: $F1
    ld   hl, wEntitiesSpeedXTable                 ; $7CE9: $21 $40 $C2
    add  hl, bc                                   ; $7CEC: $09
    ld   [hl], a                                  ; $7CED: $77
    ret                                           ; $7CEE: $C9

include "code/entities/04_bombite.asm"
include "code/entities/04_leever.asm"

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_04::
    ldh  a, [hActiveEntityStatus]                 ; $7FA3: $F0 $EA
    cp   $05                                      ; $7FA5: $FE $05
    jr   nz, .skip                                ; $7FA7: $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7FA9: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7FAC: $FE $07
    jr   z, .skip                                 ; $7FAE: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7FB0: $FE $0B
    jr   nz, .skip                                ; $7FB2: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7FB4: $FA $6B $C1
    cp   $04                                      ; $7FB7: $FE $04
    jr   nz, .skip                                ; $7FB9: $20 $13

    ld   hl, wC1A8                                ; $7FBB: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7FBE: $FA $9F $C1
    or   [hl]                                     ; $7FC1: $B6
    ld   hl, wInventoryAppearing                  ; $7FC2: $21 $4F $C1
    or   [hl]                                     ; $7FC5: $B6
    jr   nz, .skip                                ; $7FC6: $20 $06

    ld   a, [wRoomTransitionState]                ; $7FC8: $FA $24 $C1
    and  a                                        ; $7FCB: $A7
    jr   z, .return                               ; $7FCC: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7FCE: $F1

.return
    ret                                           ; $7FCF: $C9

