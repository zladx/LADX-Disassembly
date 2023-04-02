; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/reset_entity.asm"
include "code/entities/15_kanalet_castle_gate_switch.asm"
include "code/entities/15_moving_block.asm"
include "code/entities/15_crystal_switch.asm"
include "code/entities/15_boulders.asm"
include "code/entities/15_yarna_talking_bones.asm"
include "code/entities/15_seashell_mansion_trees.asm"
include "code/entities/15_fish.asm"

; Following code is part of the nightmare boss
Data_015_45A3::
    db   $00, $00, $46, $07, $00, $08, $7E, $07, $F0, $00, $46, $07, $F0, $08, $7E, $07
    db   $E0, $00, $46, $07, $E0, $08, $7E, $07, $D0, $00, $46, $07, $D0, $08, $7E, $07
    db   $C0, $00, $46, $07, $C0, $08, $7E, $07

label_015_45CB:
    ld   hl, wEntitiesInertiaTable                ; $45CB: $21 $D0 $C3
    add  hl, bc                                   ; $45CE: $09
    ld   a, [hl]                                  ; $45CF: $7E
    add  $01                                      ; $45D0: $C6 $01
    sla  a                                        ; $45D2: $CB $27
    ld   c, a                                     ; $45D4: $4F
    ld   hl, Data_015_45A3                        ; $45D5: $21 $A3 $45
    call RenderActiveEntitySpritesRect            ; $45D8: $CD $E6 $3C
    ld   a, $0A                                   ; $45DB: $3E $0A
    call func_015_7964_trampoline                 ; $45DD: $CD $A0 $3D
    call ReturnIfNonInteractive_15                ; $45E0: $CD $0D $7B
    ld   a, [wGameplayType]                       ; $45E3: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $45E6: $FE $01
    ret  z                                        ; $45E8: $C8

    ldh  a, [hActiveEntityState]                  ; $45E9: $F0 $F0
    JP_TABLE                                      ; $45EB
._00 dw func_015_45F6                             ; $45EC
._01 dw func_015_45FE                             ; $45EE
._02 dw func_015_4627                             ; $45F0
._03 dw func_015_463D                             ; $45F2
._04 dw func_015_4660                             ; $45F4

func_015_45F6::
    call GetEntityTransitionCountdown             ; $45F6: $CD $05 $0C
    ld   [hl], $C0                                ; $45F9: $36 $C0
    jp   IncrementEntityState                     ; $45FB: $C3 $12 $3B

func_015_45FE::
    call GetEntityTransitionCountdown             ; $45FE: $CD $05 $0C
    cp   $40                                      ; $4601: $FE $40
    jr   nz, .jr_460B                             ; $4603: $20 $06

    dec  [hl]                                     ; $4605: $35
    jp_open_dialog Dialog0D7                      ; $4606

.jr_460B
    and  a                                        ; $460B: $A7
    ret  nz                                       ; $460C: $C0

    ld   a, $50                                   ; $460D: $3E $50
    dec  a                                        ; $460F: $3D
    ldh  [hMultiPurpose0], a                      ; $4610: $E0 $D7
    ld   a, $30                                   ; $4612: $3E $30
    ldh  [hMultiPurpose1], a                      ; $4614: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $4616: $3E $02
    call AddTranscientVfx                         ; $4618: $CD $C7 $0C
    ld   a, JINGLE_POOF                           ; $461B: $3E $2F
    ldh  [hJingle], a                             ; $461D: $E0 $F2
    ld   a, $00                                   ; $461F: $3E $00
    call SetEntitySpriteVariant                   ; $4621: $CD $0C $3B
    jp   IncrementEntityState                     ; $4624: $C3 $12 $3B

func_015_4627::
    ldh  a, [hLinkPositionX]                      ; $4627: $F0 $98
    sub  $50                                      ; $4629: $D6 $50
    add  $08                                      ; $462B: $C6 $08
    cp   $10                                      ; $462D: $FE $10
    jr   nc, .jr_463A                             ; $462F: $30 $09

    ldh  a, [hLinkPositionY]                      ; $4631: $F0 $99
    sub  $30                                      ; $4633: $D6 $30
    add  $08                                      ; $4635: $C6 $08
    cp   $10                                      ; $4637: $FE $10
    ret  c                                        ; $4639: $D8

.jr_463A
    jp   IncrementEntityState                     ; $463A: $C3 $12 $3B

func_015_463D::
    ldh  a, [hLinkPositionX]                      ; $463D: $F0 $98
    sub  $50                                      ; $463F: $D6 $50
    add  $08                                      ; $4641: $C6 $08
    cp   $10                                      ; $4643: $FE $10
    jr   nc, .ret_465F                            ; $4645: $30 $18

    ldh  a, [hLinkPositionY]                      ; $4647: $F0 $99
    sub  $30                                      ; $4649: $D6 $30
    add  $08                                      ; $464B: $C6 $08
    cp   $10                                      ; $464D: $FE $10
    jr   nc, .ret_465F                            ; $464F: $30 $0E

    ld   a, [wIsLinkInTheAir]                     ; $4651: $FA $46 $C1
    and  a                                        ; $4654: $A7
    ret  nz                                       ; $4655: $C0

    call IncrementEntityState                     ; $4656: $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $4659: $21 $B0 $C2
    add  hl, bc                                   ; $465C: $09
    ld   [hl], $30                                ; $465D: $36 $30

.ret_465F
    ret                                           ; $465F: $C9

func_015_4660::
    ld   a, $02                                   ; $4660: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4662: $E0 $A1
    ld   [wC167], a                               ; $4664: $EA $67 $C1
    ld   hl, wEntitiesPrivateState1Table          ; $4667: $21 $B0 $C2
    add  hl, bc                                   ; $466A: $09
    ld   a, [hl]                                  ; $466B: $7E
    ldh  [hLinkPositionY], a                      ; $466C: $E0 $99
    ld   a, $50                                   ; $466E: $3E $50
    ldh  [hLinkPositionX], a                      ; $4670: $E0 $98
    ldh  a, [hFrameCounter]                       ; $4672: $F0 $E7
    and  $07                                      ; $4674: $E6 $07
    jr   nz, .jr_4682                             ; $4676: $20 $0A

    ld   hl, wEntitiesInertiaTable                ; $4678: $21 $D0 $C3
    add  hl, bc                                   ; $467B: $09
    ld   a, [hl]                                  ; $467C: $7E
    cp   $04                                      ; $467D: $FE $04
    jr   z, .jr_4682                              ; $467F: $28 $01

    inc  [hl]                                     ; $4681: $34

.jr_4682
    ldh  a, [hFrameCounter]                       ; $4682: $F0 $E7
    and  $03                                      ; $4684: $E6 $03
    jr   nz, .jr_469C                             ; $4686: $20 $14

    ld   hl, wEntitiesPrivateState1Table          ; $4688: $21 $B0 $C2
    add  hl, bc                                   ; $468B: $09
    dec  [hl]                                     ; $468C: $35
    ld   a, [hl]                                  ; $468D: $7E
    cp   $12                                      ; $468E: $FE $12
    jr   nc, .jr_469C                             ; $4690: $30 $0A

    xor  a                                        ; $4692: $AF
    ld   [wGameplaySubtype], a                    ; $4693: $EA $96 $DB
    ld   a, GAMEPLAY_CREDITS                      ; $4696: $3E $01
    ld   [wGameplayType], a                       ; $4698: $EA $95 $DB
    ret                                           ; $469B: $C9

.jr_469C
    ld   a, $02                                   ; $469C: $3E $02
    ldh  [hLinkDirection], a                      ; $469E: $E0 $9E
    ldh  a, [hFrameCounter]                       ; $46A0: $F0 $E7
    and  $08                                      ; $46A2: $E6 $08
    ld   [wConsecutiveStepsCount], a              ; $46A4: $EA $20 $C1
    push bc                                       ; $46A7: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $46A8: $CD $F0 $0B
    pop  bc                                       ; $46AB: $C1
    call ResetSpinAttack                          ; $46AC: $CD $AF $0C
    ; a = 0
    ; wSwordAnimationState = SWORD_ANIMATION_STATE_NONE
    ld   [wSwordAnimationState], a                ; $46AF: $EA $37 $C1
    ld   [wC16A], a                               ; $46B2: $EA $6A $C1
    ret                                           ; $46B5: $C9

include "code/entities/15_moblin_king.asm"
include "code/entities/15_pokey.asm"
include "code/entities/15_flame_shooter.asm"
include "code/entities/15_stalfos_evasive.asm"
include "code/entities/15_final_nightmare.asm"
include "code/entities/15_sand_crab.asm"
include "code/entities/15_urchin.asm"


Data_015_7436::
    db   $30, $D0

HookshotBridgeHandler::
    call ReturnIfNonInteractive_15                ; $7438: $CD $0D $7B
    ld   hl, wEntitiesDirectionTable              ; $743B: $21 $80 $C3
    add  hl, bc                                   ; $743E: $09
    ld   e, [hl]                                  ; $743F: $5E
    ld   d, b                                     ; $7440: $50
    ld   hl, Data_015_7436                        ; $7441: $21 $36 $74
    add  hl, de                                   ; $7444: $19
    ld   a, [hl]                                  ; $7445: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7446: $21 $50 $C2
    add  hl, bc                                   ; $7449: $09
    ld   [hl], a                                  ; $744A: $77
    call UpdateEntityYPosWithSpeed_15             ; $744B: $CD $8B $7B
    call label_3B23                               ; $744E: $CD $23 $3B
    ldh  a, [hObjectUnderEntity]                  ; $7451: $F0 $AF
    cp   $9D                                      ; $7453: $FE $9D
    jr   z, .jr_746A                              ; $7455: $28 $13

    ld   e, a                                     ; $7457: $5F
    ld   d, $01                                   ; $7458: $16 $01
    call GetObjectPhysicsFlags_trampoline         ; $745A: $CD $26 $2A
    and  a                                        ; $745D: $A7
    jr   nz, .jr_746A                             ; $745E: $20 $0A

    call ClearEntityStatus_15                     ; $7460: $CD $31 $7C
    ld   hl, wEntitiesStatusTable                 ; $7463: $21 $80 $C2
    add  hl, bc                                   ; $7466: $09
    ld   a, [hl]                                  ; $7467: $7E
    ldh  [hActiveEntityStatus], a                 ; $7468: $E0 $EA

.jr_746A
    ldh  a, [hActiveEntityPosX]                   ; $746A: $F0 $EE
    sub  $08                                      ; $746C: $D6 $08
    ldh  [hIntersectedObjectLeft], a              ; $746E: $E0 $CE
    swap a                                        ; $7470: $CB $37
    and  $0F                                      ; $7472: $E6 $0F
    ld   e, a                                     ; $7474: $5F
    ldh  a, [hActiveEntityVisualPosY]             ; $7475: $F0 $EC
    add  $04                                      ; $7477: $C6 $04
    sub  $10                                      ; $7479: $D6 $10
    ldh  [hIntersectedObjectTop], a               ; $747B: $E0 $CD
    and  $F0                                      ; $747D: $E6 $F0
    or   e                                        ; $747F: $B3
    ld   e, a                                     ; $7480: $5F
    ld   d, $00                                   ; $7481: $16 $00
    ld   hl, wRoomObjects                         ; $7483: $21 $11 $D7
    add  hl, de                                   ; $7486: $19
    ld   [hl], $9D                                ; $7487: $36 $9D
    call label_2887                               ; $7489: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $748C: $F0 $FE
    and  a                                        ; $748E: $A7
    jr   z, .jr_749D                              ; $748F: $28 $0C

    push bc                                       ; $7491: $C5
    ld   a, $9D                                   ; $7492: $3E $9D
    ld   [wDDD8], a                               ; $7494: $EA $D8 $DD
    ld   a, $15                                   ; $7497: $3E $15
    call func_91D                                 ; $7499: $CD $1D $09
    pop  bc                                       ; $749C: $C1

.jr_749D
    ld   hl, wDrawCommand                         ; $749D: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $74A0: $FA $00 $D6
    ld   e, a                                     ; $74A3: $5F
    add  $0A                                      ; $74A4: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $74A6: $EA $00 $D6
    ld   d, $00                                   ; $74A9: $16 $00
    add  hl, de                                   ; $74AB: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $74AC: $F0 $CF
    ld   [hl+], a                                 ; $74AE: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $74AF: $F0 $D0
    ld   [hl+], a                                 ; $74B1: $22
    ld   a, $81                                   ; $74B2: $3E $81
    ld   [hl+], a                                 ; $74B4: $22
    push hl                                       ; $74B5: $E5
    ld   hl, wEntitiesDirectionTable              ; $74B6: $21 $80 $C3
    add  hl, bc                                   ; $74B9: $09
    ld   a, [hl]                                  ; $74BA: $7E
    pop  hl                                       ; $74BB: $E1
    and  a                                        ; $74BC: $A7
    jr   nz, jr_015_74E6                          ; $74BD: $20 $27

    ld   a, $04                                   ; $74BF: $3E $04
    ld   [hl+], a                                 ; $74C1: $22
    ldh  a, [hActiveEntityStatus]                 ; $74C2: $F0 $EA
    and  a                                        ; $74C4: $A7
    ld   a, $08                                   ; $74C5: $3E $08
    jr   nz, .jr_74CB                             ; $74C7: $20 $02

    ld   a, $04                                   ; $74C9: $3E $04

.jr_74CB
    ld   [hl+], a                                 ; $74CB: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $74CC: $F0 $CF
    ld   [hl+], a                                 ; $74CE: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $74CF: $F0 $D0
    inc  a                                        ; $74D1: $3C
    ld   [hl+], a                                 ; $74D2: $22
    ld   a, $81                                   ; $74D3: $3E $81
    ld   [hl+], a                                 ; $74D5: $22
    ld   a, $05                                   ; $74D6: $3E $05
    ld   [hl+], a                                 ; $74D8: $22
    ldh  a, [hActiveEntityStatus]                 ; $74D9: $F0 $EA
    and  a                                        ; $74DB: $A7
    ld   a, $09                                   ; $74DC: $3E $09
    jr   nz, .jr_74E2                             ; $74DE: $20 $02

    ld   a, $05                                   ; $74E0: $3E $05

.jr_74E2
    ld   [hl+], a                                 ; $74E2: $22
    ld   [hl], $00                                ; $74E3: $36 $00
    ret                                           ; $74E5: $C9

jr_015_74E6:
    ldh  a, [hActiveEntityStatus]                 ; $74E6: $F0 $EA
    and  a                                        ; $74E8: $A7
    ld   a, $0A                                   ; $74E9: $3E $0A
    jr   nz, .jr_74EF                             ; $74EB: $20 $02

    ld   a, $04                                   ; $74ED: $3E $04

.jr_74EF
    ld   [hl+], a                                 ; $74EF: $22
    ld   a, $04                                   ; $74F0: $3E $04
    ld   [hl+], a                                 ; $74F2: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $74F3: $F0 $CF
    ld   [hl+], a                                 ; $74F5: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $74F6: $F0 $D0
    inc  a                                        ; $74F8: $3C
    ld   [hl+], a                                 ; $74F9: $22
    ld   a, $81                                   ; $74FA: $3E $81
    ld   [hl+], a                                 ; $74FC: $22
    ldh  a, [hActiveEntityStatus]                 ; $74FD: $F0 $EA
    and  a                                        ; $74FF: $A7
    ld   a, $0B                                   ; $7500: $3E $0B
    jr   nz, .jr_7506                             ; $7502: $20 $02

    ld   a, $05                                   ; $7504: $3E $05

.jr_7506
    ld   [hl+], a                                 ; $7506: $22
    ld   a, $05                                   ; $7507: $3E $05
    ld   [hl+], a                                 ; $7509: $22
    ld   [hl], $00                                ; $750A: $36 $00
    ret                                           ; $750C: $C9

include "code/entities/15_beetle_spawner.asm"
include "code/entities/15_laser_beam.asm"
include "code/entities/15_monkey.asm"
include "code/entities/15_witch_rat.asm"

Data_015_7955::
    db   $00, $08, $10, $18, $20, $28, $30, $38

func_015_795D::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $795D: $21 $40 $C3
    add  hl, bc                                   ; $7960: $09
    ld   a, [hl]                                  ; $7961: $7E
    and  ~ENTITY_PHYSICS_MASK                     ; $7962: $E6 $0F

; Increment wOAMNextAvailableSlot by `a * 4` tiles
; (plus special conditions)
;
; Inputs:
;   a  number of tiles / 4
func_015_7964::
    ; e = a * 4
    sla  a                                        ; $7964: $CB $27
    sla  a                                        ; $7966: $CB $27
    ld   e, a                                     ; $7968: $5F

    ld   a, [wOAMNextAvailableSlot]               ; $7969: $FA $C0 $C3
    add  e                                        ; $796C: $83
    cp   $60                                      ; $796D: $FE $60
    jr   c, .overflowEnd                          ; $796F: $38 $02
    sub  $60                                      ; $7971: $D6 $60
.overflowEnd

    ld   [wOAMNextAvailableSlot], a               ; $7973: $EA $C0 $C3

    ; [wC3C1] += e
    ld   a, [wC3C1]                               ; $7976: $FA $C1 $C3
    add  e                                        ; $7979: $83
    ld   [wC3C1], a                               ; $797A: $EA $C1 $C3

    cp   $60                                      ; $797D: $FE $60
    jr   c, .return                               ; $797F: $38 $13

    ldh  a, [hFrameCounter]                       ; $7981: $F0 $E7

    ld   hl, wActiveEntityIndex                   ; $7983: $21 $23 $C1
    add  [hl]                                     ; $7986: $86
    and  $07                                      ; $7987: $E6 $07
    ld   e, a                                     ; $7989: $5F
    ld   d, $00                                   ; $798A: $16 $00
    ld   hl, Data_015_7955                        ; $798C: $21 $55 $79
    add  hl, de                                   ; $798F: $19
    ld   a, [hl]                                  ; $7990: $7E
    ld   [wOAMNextAvailableSlot], a               ; $7991: $EA $C0 $C3

.return
    ret                                           ; $7994: $C9

func_015_7995::
    ldh  a, [hActiveEntityStatus]                 ; $7995: $F0 $EA
    cp   ENTITY_STATUS_LIFTED                     ; $7997: $FE $07
    ret  z                                        ; $7999: $C8

    ld   hl, wEntitiesGroundStatusTable           ; $799A: $21 $70 $C4
    add  hl, bc                                   ; $799D: $09
    ld   a, [hl]                                  ; $799E: $7E
    cp   $02                                      ; $799F: $FE $02
    jp   z, label_015_79DF                        ; $79A1: $CA $DF $79

    cp   $03                                      ; $79A4: $FE $03
    jp   z, label_015_7A27                        ; $79A6: $CA $27 $7A

    ld   hl, wEntitiesPosZTable                   ; $79A9: $21 $10 $C3
    add  hl, bc                                   ; $79AC: $09
    ld   a, [hl]                                  ; $79AD: $7E
    and  a                                        ; $79AE: $A7
    ret  z                                        ; $79AF: $C8

    ldh  a, [hIsSideScrolling]                    ; $79B0: $F0 $F9
    and  a                                        ; $79B2: $A7
    ret  nz                                       ; $79B3: $C0

    ld   hl, wEntitiesPhysicsFlagsTable           ; $79B4: $21 $40 $C3
    add  hl, bc                                   ; $79B7: $09
    ld   a, [hl]                                  ; $79B8: $7E
    and  ENTITY_PHYSICS_SHADOW                    ; $79B9: $E6 $10
    ret  z                                        ; $79BB: $C8

    ldh  a, [hFrameCounter]                       ; $79BC: $F0 $E7
    xor  c                                        ; $79BE: $A9
    and  $01                                      ; $79BF: $E6 $01
    ret  nz                                       ; $79C1: $C0

    ld   a, [wOAMNextAvailableSlot]               ; $79C2: $FA $C0 $C3
    ld   l, a                                     ; $79C5: $6F
    ld   h, $00                                   ; $79C6: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79C8: $11 $30 $C0
    add  hl, de                                   ; $79CB: $19
    ldh  a, [hActiveEntityPosY]                   ; $79CC: $F0 $EF
    add  $0A                                      ; $79CE: $C6 $0A
    ld   [hl+], a                                 ; $79D0: $22
    ldh  a, [hActiveEntityPosX]                   ; $79D1: $F0 $EE
    add  $04                                      ; $79D3: $C6 $04
    ld   [hl+], a                                 ; $79D5: $22
    ld   a, $26                                   ; $79D6: $3E $26
    ld   [hl+], a                                 ; $79D8: $22
    ld   [hl], b                                  ; $79D9: $70
    ld   a, $01                                   ; $79DA: $3E $01
    jp   func_015_7964                            ; $79DC: $C3 $64 $79

label_015_79DF:
    ldh  a, [hActiveEntityType]                   ; $79DF: $F0 $EB
    cp   ENTITY_BOMB                              ; $79E1: $FE $02
    jr   nz, func_015_79F0                        ; $79E3: $20 $0B

    ld   hl, hActiveEntityVisualPosY              ; $79E5: $21 $EC $FF
    dec  [hl]                                     ; $79E8: $35
    dec  [hl]                                     ; $79E9: $35
    call func_015_79F0                            ; $79EA: $CD $F0 $79
    jp   CopyEntityPositionToActivePosition       ; $79ED: $C3 $8A $3D

func_015_79F0::
    ld   a, [wOAMNextAvailableSlot]               ; $79F0: $FA $C0 $C3
    ld   l, a                                     ; $79F3: $6F
    ld   h, $00                                   ; $79F4: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $79F6: $11 $30 $C0
    add  hl, de                                   ; $79F9: $19
IF __PATCH_0__
    ld   e, $03
ELSE
    ld   e, $00                                   ; $79FA: $1E $00
ENDC
    ldh  a, [hFrameCounter]                       ; $79FC: $F0 $E7
    and  $04                                      ; $79FE: $E6 $04
    jr   z, .jr_7A04                              ; $7A00: $28 $02

IF __PATCH_0__
    ld   e, $15
ELSE
    ld   e, $10                                   ; $7A02: $1E $10
ENDC

.jr_7A04
    ldh  a, [hActiveEntityVisualPosY]             ; $7A04: $F0 $EC
    add  $0B                                      ; $7A06: $C6 $0B
    ld   [hl+], a                                 ; $7A08: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A09: $F0 $EE
    ld   [hl+], a                                 ; $7A0B: $22
    ld   a, $1C                                   ; $7A0C: $3E $1C
    ld   [hl+], a                                 ; $7A0E: $22
    ld   a, e                                     ; $7A0F: $7B
    ld   [hl+], a                                 ; $7A10: $22
    ldh  a, [hActiveEntityVisualPosY]             ; $7A11: $F0 $EC
    add  $0B                                      ; $7A13: $C6 $0B
    ld   [hl+], a                                 ; $7A15: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A16: $F0 $EE
    add  $08                                      ; $7A18: $C6 $08
    ld   [hl+], a                                 ; $7A1A: $22
    ld   a, $1C                                   ; $7A1B: $3E $1C
    ld   [hl+], a                                 ; $7A1D: $22
    ld   a, e                                     ; $7A1E: $7B
    or   $20                                      ; $7A1F: $F6 $20
    ld   [hl+], a                                 ; $7A21: $22
    ld   a, $02                                   ; $7A22: $3E $02
    jp   func_015_7964                            ; $7A24: $C3 $64 $79

label_015_7A27:
    push bc                                       ; $7A27: $C5
    ld   hl, wEntitiesInertiaTable                ; $7A28: $21 $D0 $C3
    add  hl, bc                                   ; $7A2B: $09
    ld   e, [hl]                                  ; $7A2C: $5E
    ld   hl, wEntitiesSpeedXTable                 ; $7A2D: $21 $40 $C2
    add  hl, bc                                   ; $7A30: $09
    ld   a, [hl]                                  ; $7A31: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7A32: $21 $50 $C2
    add  hl, bc                                   ; $7A35: $09
    ld   c, b                                     ; $7A36: $48
    or   [hl]                                     ; $7A37: $B6
    jr   z, .jr_7A40                              ; $7A38: $28 $06

    ld   a, e                                     ; $7A3A: $7B
    rla                                           ; $7A3B: $17
    rla                                           ; $7A3C: $17
    and  $20                                      ; $7A3D: $E6 $20
    ld   c, a                                     ; $7A3F: $4F

.jr_7A40
    ld   a, [wOAMNextAvailableSlot]               ; $7A40: $FA $C0 $C3
    ld   l, a                                     ; $7A43: $6F
    ld   h, $00                                   ; $7A44: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $7A46: $11 $30 $C0
    add  hl, de                                   ; $7A49: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $7A4A: $F0 $EC
    add  $08                                      ; $7A4C: $C6 $08
    ld   [hl+], a                                 ; $7A4E: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A4F: $F0 $EE
    dec  a                                        ; $7A51: $3D
    ld   [hl+], a                                 ; $7A52: $22
    ld   a, $1A                                   ; $7A53: $3E $1A
    ld   [hl+], a                                 ; $7A55: $22
    ld   a, c                                     ; $7A56: $79
    ld   [hl+], a                                 ; $7A57: $22
    ldh  a, [hActiveEntityVisualPosY]             ; $7A58: $F0 $EC
    add  $08                                      ; $7A5A: $C6 $08
    ld   [hl+], a                                 ; $7A5C: $22
    ldh  a, [hActiveEntityPosX]                   ; $7A5D: $F0 $EE
    add  $07                                      ; $7A5F: $C6 $07
    ld   [hl+], a                                 ; $7A61: $22
    ld   a, $1A                                   ; $7A62: $3E $1A
    ld   [hl+], a                                 ; $7A64: $22
    ld   a, c                                     ; $7A65: $79
    ld   [hl], a                                  ; $7A66: $77
    pop  bc                                       ; $7A67: $C1
    ld   a, $02                                   ; $7A68: $3E $02
    jp   func_015_7964                            ; $7A6A: $C3 $64 $79

    ret                                           ; $7A6D: $C9

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

PushLinkOutOfEntity_15::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7A6E: $CD $5A $3B
    jr   nc, jr_015_7A9A                          ; $7A71: $30 $27

    call CopyLinkFinalPositionToPosition          ; $7A73: $CD $BE $0C
    ld   a, [wC1A6]                               ; $7A76: $FA $A6 $C1
    and  a                                        ; $7A79: $A7
    jr   z, .jr_7A8D                              ; $7A7A: $28 $11

    ld   e, a                                     ; $7A7C: $5F
    ld   d, b                                     ; $7A7D: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7A7E: $21 $9F $C3
    add  hl, de                                   ; $7A81: $19
    ld   a, [hl]                                  ; $7A82: $7E
    cp   $03                                      ; $7A83: $FE $03
    jr   nz, .jr_7A8D                             ; $7A85: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $7A87: $21 $8F $C2
    add  hl, de                                   ; $7A8A: $19
    ld   [hl], $00                                ; $7A8B: $36 $00

.jr_7A8D
    ld   a, [wIsRunningWithPegasusBoots]          ; $7A8D: $FA $4A $C1
    ld   e, a                                     ; $7A90: $5F
    call ResetPegasusBoots                        ; $7A91: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $7A94: $CD $8E $17
    ld   a, e                                     ; $7A97: $7B
    scf                                           ; $7A98: $37
    ret                                           ; $7A99: $C9

jr_015_7A9A:
    and  a                                        ; $7A9A: $A7
    ret                                           ; $7A9B: $C9

Data_015_7A9C::
    db   $06, $04, $02, $00

label_015_7AA0:
    ld   hl, wEntitiesDirectionTable              ; $7AA0: $21 $80 $C3
    add  hl, bc                                   ; $7AA3: $09
    ld   e, [hl]                                  ; $7AA4: $5E
    ld   d, b                                     ; $7AA5: $50
    ld   hl, Data_015_7A9C                        ; $7AA6: $21 $9C $7A
    add  hl, de                                   ; $7AA9: $19
    push hl                                       ; $7AAA: $E5
    ld   hl, wEntitiesInertiaTable                ; $7AAB: $21 $D0 $C3
    add  hl, bc                                   ; $7AAE: $09
    inc  [hl]                                     ; $7AAF: $34
    ld   a, [hl]                                  ; $7AB0: $7E
    rra                                           ; $7AB1: $1F
    rra                                           ; $7AB2: $1F
    rra                                           ; $7AB3: $1F
    rra                                           ; $7AB4: $1F
    pop  hl                                       ; $7AB5: $E1
    and  $01                                      ; $7AB6: $E6 $01
    or   [hl]                                     ; $7AB8: $B6
    jp   SetEntitySpriteVariant                   ; $7AB9: $C3 $0C $3B

; Tell if the player is currently trying to talk to an entity.
; That is when:
;  - Link is close to the entity
;  - Link is facing the entity
;  - A dialog box can appear at this time
;  - The A button is pressed
;
; Return:
;   The carry flag is set if Link is trying to talk to the entity.
;   It is not set otherwise.
ShouldLinkTalkToEntity_15::
    ld   e, b                                     ; $7ABC: $58
    ldh  a, [hLinkPositionY]                      ; $7ABD: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7ABF: $21 $EF $FF
    sub  [hl]                                     ; $7AC2: $96
    add  $14                                      ; $7AC3: $C6 $14
    cp   $28                                      ; $7AC5: $FE $28
    jr   nc, .jr_7B0B                             ; $7AC7: $30 $42

    ldh  a, [hLinkPositionX]                      ; $7AC9: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7ACB: $21 $EE $FF
    sub  [hl]                                     ; $7ACE: $96
    add  $10                                      ; $7ACF: $C6 $10
    cp   $20                                      ; $7AD1: $FE $20
    jr   nc, .jr_7B0B                             ; $7AD3: $30 $36

    inc  e                                        ; $7AD5: $1C
    push de                                       ; $7AD6: $D5
    call func_015_7C0A                            ; $7AD7: $CD $0A $7C
    ldh  a, [hLinkDirection]                      ; $7ADA: $F0 $9E
    xor  $01                                      ; $7ADC: $EE $01
    cp   e                                        ; $7ADE: $BB
    pop  de                                       ; $7ADF: $D1
    jr   nz, .jr_7B0B                             ; $7AE0: $20 $29

    ld   hl, wItemUsageContext                    ; $7AE2: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7AE5: $36 $01
    ld   a, [wDialogState]                        ; $7AE7: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7AEA: $21 $4F $C1
    or   [hl]                                     ; $7AED: $B6
    ld   hl, wIsLinkInTheAir                      ; $7AEE: $21 $46 $C1
    or   [hl]                                     ; $7AF1: $B6
    ld   hl, wDialogCooldown                      ; $7AF2: $21 $34 $C1
    or   [hl]                                     ; $7AF5: $B6
    ld   hl, wPhotoAlbumCooldown                  ; $7AF6: $21 $05 $DE
    or   [hl]                                     ; $7AF9: $B6
    jr   nz, .jr_7B0B                             ; $7AFA: $20 $0F

    ld   a, [wWindowY]                            ; $7AFC: $FA $9A $DB
    cp   $80                                      ; $7AFF: $FE $80
    jr   nz, .jr_7B0B                             ; $7B01: $20 $08

    ldh  a, [hJoypadState]                        ; $7B03: $F0 $CC
    and  J_A                                      ; $7B05: $E6 $10
    jr   z, .jr_7B0B                              ; $7B07: $28 $02

    scf                                           ; $7B09: $37
    ret                                           ; $7B0A: $C9

.jr_7B0B
    and  a                                        ; $7B0B: $A7
    ret                                           ; $7B0C: $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_15::
    ldh  a, [hActiveEntityStatus]                 ; $7B0D: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7B0F: $FE $05
    jr   nz, .skip                                ; $7B11: $20 $29

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7B13: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7B16: $FE $07
    jr   z, .skip                                 ; $7B18: $28 $22

    cp   GAMEPLAY_CREDITS                         ; $7B1A: $FE $01
    jr   z, .creditsEnd                           ; $7B1C: $28 $0B

    cp   GAMEPLAY_WORLD                           ; $7B1E: $FE $0B
    jr   nz, .skip                                ; $7B20: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7B22: $FA $6B $C1
    cp   $04                                      ; $7B25: $FE $04
    jr   nz, .skip                                ; $7B27: $20 $13
.creditsEnd

    ld   hl, wC1A8                                ; $7B29: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7B2C: $FA $9F $C1
    or   [hl]                                     ; $7B2F: $B6
    ld   hl, wInventoryAppearing                  ; $7B30: $21 $4F $C1
    or   [hl]                                     ; $7B33: $B6
    jr   nz, .skip                                ; $7B34: $20 $06

    ld   a, [wRoomTransitionState]                ; $7B36: $FA $24 $C1
    and  a                                        ; $7B39: $A7
    jr   z, .return                               ; $7B3A: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7B3C: $F1

.return
    ret                                           ; $7B3D: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_15::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7B3E: $21 $10 $C4
    add  hl, bc                                   ; $7B41: $09
    ld   a, [hl]                                  ; $7B42: $7E
    and  a                                        ; $7B43: $A7
    jr   z, .return                               ; $7B44: $28 $41

    dec  a                                        ; $7B46: $3D
    ld   [hl], a                                  ; $7B47: $77

    call label_3E8E                               ; $7B48: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7B4B: $21 $40 $C2
    add  hl, bc                                   ; $7B4E: $09
    ld   a, [hl]                                  ; $7B4F: $7E
    push af                                       ; $7B50: $F5

    ld   hl, wEntitiesSpeedYTable                 ; $7B51: $21 $50 $C2
    add  hl, bc                                   ; $7B54: $09
    ld   a, [hl]                                  ; $7B55: $7E
    push af                                       ; $7B56: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7B57: $21 $F0 $C3
    add  hl, bc                                   ; $7B5A: $09
    ld   a, [hl]                                  ; $7B5B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7B5C: $21 $40 $C2
    add  hl, bc                                   ; $7B5F: $09
    ld   [hl], a                                  ; $7B60: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7B61: $21 $00 $C4
    add  hl, bc                                   ; $7B64: $09
    ld   a, [hl]                                  ; $7B65: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7B66: $21 $50 $C2
    add  hl, bc                                   ; $7B69: $09
    ld   [hl], a                                  ; $7B6A: $77

    call UpdateEntityPosWithSpeed_15              ; $7B6B: $CD $88 $7B

    ld   hl, wEntitiesOptions1Table               ; $7B6E: $21 $30 $C4
    add  hl, bc                                   ; $7B71: $09
    ld   a, [hl]                                  ; $7B72: $7E
    and  $20                                      ; $7B73: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7B75: $20 $03

    call label_3B23                               ; $7B77: $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ; $7B7A: $21 $50 $C2
    add  hl, bc                                   ; $7B7D: $09
    pop  af                                       ; $7B7E: $F1
    ld   [hl], a                                  ; $7B7F: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7B80: $21 $40 $C2
    add  hl, bc                                   ; $7B83: $09
    pop  af                                       ; $7B84: $F1
    ld   [hl], a                                  ; $7B85: $77
    pop  af                                       ; $7B86: $F1

.return
    ret                                           ; $7B87: $C9

UpdateEntityPosWithSpeed_15::
    call AddEntitySpeedToPos_15                   ; $7B88: $CD $95 $7B

UpdateEntityYPosWithSpeed_15::
    push bc                                       ; $7B8B: $C5
    ld   a, c                                     ; $7B8C: $79
    add  $10                                      ; $7B8D: $C6 $10
    ld   c, a                                     ; $7B8F: $4F
    call AddEntitySpeedToPos_15                   ; $7B90: $CD $95 $7B
    pop  bc                                       ; $7B93: $C1
    ret                                           ; $7B94: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_15::
    ld   hl, wEntitiesSpeedXTable                 ; $7B95: $21 $40 $C2
    add  hl, bc                                   ; $7B98: $09
    ld   a, [hl]                                  ; $7B99: $7E
    and  a                                        ; $7B9A: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7B9B: $28 $23

    push af                                       ; $7B9D: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7B9E: $CB $37
    and  $F0                                      ; $7BA0: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7BA2: $21 $60 $C2
    add  hl, bc                                   ; $7BA5: $09
    add  [hl]                                     ; $7BA6: $86
    ld   [hl], a                                  ; $7BA7: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7BA8: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7BAA: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7BAD: $09
    pop  af                                       ; $7BAE: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7BAF: $1E $00
    bit  7, a                                     ; $7BB1: $CB $7F
    jr   z, .positive                             ; $7BB3: $28 $02

    ld   e, $F0                                   ; $7BB5: $1E $F0

.positive
    swap a                                        ; $7BB7: $CB $37
    and  $0F                                      ; $7BB9: $E6 $0F
    or   e                                        ; $7BBB: $B3
    ; Get carry back from d
    rr   d                                        ; $7BBC: $CB $1A
    adc  [hl]                                     ; $7BBE: $8E
    ld   [hl], a                                  ; $7BBF: $77

.return
    ret                                           ; $7BC0: $C9

AddEntityZSpeedToPos_15::
    ld   hl, wEntitiesSpeedZTable                 ; $7BC1: $21 $20 $C3
    add  hl, bc                                   ; $7BC4: $09
    ld   a, [hl]                                  ; $7BC5: $7E
    and  a                                        ; $7BC6: $A7
    jr   z, AddEntitySpeedToPos_15.return         ; $7BC7: $28 $F7

    push af                                       ; $7BC9: $F5
    swap a                                        ; $7BCA: $CB $37
    and  $F0                                      ; $7BCC: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7BCE: $21 $30 $C3
    add  hl, bc                                   ; $7BD1: $09
    add  [hl]                                     ; $7BD2: $86
    ld   [hl], a                                  ; $7BD3: $77
    rl   d                                        ; $7BD4: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7BD6: $21 $10 $C3
    jr   AddEntitySpeedToPos_15.updatePosition    ; $7BD9: $18 $D2

func_015_7BDB::
    ld   e, $00                                   ; $7BDB: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7BDD: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7BDF: $21 $00 $C2
    add  hl, bc                                   ; $7BE2: $09
    sub  [hl]                                     ; $7BE3: $96
    bit  7, a                                     ; $7BE4: $CB $7F
    jr   z, .jr_7BE9                              ; $7BE6: $28 $01

    inc  e                                        ; $7BE8: $1C

.jr_7BE9
    ld   d, a                                     ; $7BE9: $57
    ret                                           ; $7BEA: $C9

func_015_7BEB::
    ld   e, $02                                   ; $7BEB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BED: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7BEF: $21 $10 $C2
    add  hl, bc                                   ; $7BF2: $09
    sub  [hl]                                     ; $7BF3: $96
    bit  7, a                                     ; $7BF4: $CB $7F
    jr   nz, .jr_7BF9                             ; $7BF6: $20 $01

    inc  e                                        ; $7BF8: $1C

.jr_7BF9
    ld   d, a                                     ; $7BF9: $57
    ret                                           ; $7BFA: $C9

    ld   e, $02                                   ; $7BFB: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7BFD: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7BFF: $21 $EC $FF
    sub  [hl]                                     ; $7C02: $96
    bit  7, a                                     ; $7C03: $CB $7F
    jr   nz, .jr_7C08                             ; $7C05: $20 $01

    inc  e                                        ; $7C07: $1C

.jr_7C08
    ld   d, a                                     ; $7C08: $57
    ret                                           ; $7C09: $C9

func_015_7C0A::
    call func_015_7BDB                            ; $7C0A: $CD $DB $7B
    ld   a, e                                     ; $7C0D: $7B
    ldh  [hMultiPurpose0], a                      ; $7C0E: $E0 $D7
    ld   a, d                                     ; $7C10: $7A
    bit  7, a                                     ; $7C11: $CB $7F
    jr   z, .jr_7C17                              ; $7C13: $28 $02

    cpl                                           ; $7C15: $2F
    inc  a                                        ; $7C16: $3C

.jr_7C17
    push af                                       ; $7C17: $F5
    call func_015_7BEB                            ; $7C18: $CD $EB $7B
    ld   a, e                                     ; $7C1B: $7B
    ldh  [hMultiPurpose1], a                      ; $7C1C: $E0 $D8
    ld   a, d                                     ; $7C1E: $7A
    bit  7, a                                     ; $7C1F: $CB $7F
    jr   z, .jr_7C25                              ; $7C21: $28 $02

    cpl                                           ; $7C23: $2F
    inc  a                                        ; $7C24: $3C

.jr_7C25
    pop  de                                       ; $7C25: $D1
    cp   d                                        ; $7C26: $BA
    jr   nc, .jr_7C2D                             ; $7C27: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7C29: $F0 $D7
    jr   jr_015_7C2F                              ; $7C2B: $18 $02

.jr_7C2D
    ldh  a, [hMultiPurpose1]                      ; $7C2D: $F0 $D8

jr_015_7C2F:
    ld   e, a                                     ; $7C2F: $5F
    ret                                           ; $7C30: $C9

; Reset the entity status to 0, thus removing the entity.
;
; Inputs:
;   bc   entity index
ClearEntityStatus_15::
    ld   hl, wEntitiesStatusTable                 ; $7C31: $21 $80 $C2
    add  hl, bc                                   ; $7C34: $09
    ld   [hl], b                                  ; $7C35: $70
    ret                                           ; $7C36: $C9

label_015_7C37:
    ld   hl, wEntitiesPrivateState2Table          ; $7C37: $21 $C0 $C2
    add  hl, bc                                   ; $7C3A: $09
    ld   a, [hl]                                  ; $7C3B: $7E
    JP_TABLE                                      ; $7C3C
._00 dw func_015_7C43                             ; $7C3D
._01 dw func_015_7C54                             ; $7C3F
._02 dw func_015_7C63                             ; $7C41

func_015_7C43::
    call GetEntityTransitionCountdown             ; $7C43: $CD $05 $0C
    ld   [hl], $A0                                ; $7C46: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7C48: $21 $20 $C4
    add  hl, bc                                   ; $7C4B: $09
    ld   [hl], $FF                                ; $7C4C: $36 $FF

label_015_7C4E:
    ld   hl, wEntitiesPrivateState2Table          ; $7C4E: $21 $C0 $C2
    add  hl, bc                                   ; $7C51: $09
    inc  [hl]                                     ; $7C52: $34
    ret                                           ; $7C53: $C9

func_015_7C54::
    call GetEntityTransitionCountdown             ; $7C54: $CD $05 $0C
    ret  nz                                       ; $7C57: $C0

    ld   [hl], $C0                                ; $7C58: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7C5A: $21 $20 $C4
    add  hl, bc                                   ; $7C5D: $09
    ld   [hl], $FF                                ; $7C5E: $36 $FF
    jp   label_015_7C4E                           ; $7C60: $C3 $4E $7C

func_015_7C63::
    call GetEntityTransitionCountdown             ; $7C63: $CD $05 $0C
    jr   nz, .jr_7C6E                             ; $7C66: $20 $06

    call PlayBombExplosionSfx                     ; $7C68: $CD $4B $0C
    jp   DidKillEnemy                             ; $7C6B: $C3 $50 $3F

.jr_7C6E
    jp   label_015_7C71                           ; $7C6E: $C3 $71 $7C

label_015_7C71:
    and  $07                                      ; $7C71: $E6 $07
    ret  nz                                       ; $7C73: $C0

    call GetRandomByte                            ; $7C74: $CD $0D $28
    and  $1F                                      ; $7C77: $E6 $1F
    sub  $10                                      ; $7C79: $D6 $10
    ld   e, a                                     ; $7C7B: $5F
    ld   hl, hActiveEntityPosX                    ; $7C7C: $21 $EE $FF
    add  [hl]                                     ; $7C7F: $86
    ld   [hl], a                                  ; $7C80: $77
    call GetRandomByte                            ; $7C81: $CD $0D $28
    and  $1F                                      ; $7C84: $E6 $1F
    sub  $14                                      ; $7C86: $D6 $14
    ld   e, a                                     ; $7C88: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7C89: $21 $EC $FF
    add  [hl]                                     ; $7C8C: $86
    ld   [hl], a                                  ; $7C8D: $77
    jp   label_015_7C91                           ; $7C8E: $C3 $91 $7C

label_015_7C91:
    call ReturnIfNonInteractive_15.allowInactiveEntity ; $7C91: $CD $13 $7B
    ldh  a, [hActiveEntityPosX]                   ; $7C94: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7C96: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7C98: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7C9A: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7C9C: $3E $02
    call AddTranscientVfx                         ; $7C9E: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7CA1: $3E $13
    ldh  [hNoiseSfx], a                           ; $7CA3: $E0 $F4
    ret                                           ; $7CA5: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7CA6: $3E $36
    call SpawnNewEntity_trampoline                ; $7CA8: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7CAB: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7CAD: $21 $00 $C2
    add  hl, de                                   ; $7CB0: $19
    ld   [hl], a                                  ; $7CB1: $77
    ldh  a, [hMultiPurpose1]                      ; $7CB2: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7CB4: $21 $10 $C2
    add  hl, de                                   ; $7CB7: $19
    ld   [hl], a                                  ; $7CB8: $77
    ldh  a, [hIsSideScrolling]                    ; $7CB9: $F0 $F9
    and  a                                        ; $7CBB: $A7
    jr   z, .jr_7CC6                              ; $7CBC: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7CBE: $21 $50 $C2
    add  hl, bc                                   ; $7CC1: $09
    ld   [hl], $F0                                ; $7CC2: $36 $F0
    jr   jr_015_7CD2                              ; $7CC4: $18 $0C

.jr_7CC6
    ld   hl, wEntitiesSpeedZTable                 ; $7CC6: $21 $20 $C3
    add  hl, de                                   ; $7CC9: $19
    ld   [hl], $10                                ; $7CCA: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7CCC: $21 $10 $C3
    add  hl, de                                   ; $7CCF: $19
    ld   [hl], $08                                ; $7CD0: $36 $08

jr_015_7CD2:
    call ClearEntityStatus_15                     ; $7CD2: $CD $31 $7C
    ld   hl, hNoiseSfx                            ; $7CD5: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $7CD8: $36 $1A
    ret                                           ; $7CDA: $C9

func_015_7CDB::
    ld   hl, wOverworldRoomStatus                 ; $7CDB: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7CDE: $F0 $F6
    ld   e, a                                     ; $7CE0: $5F
    ld   a, [wIsIndoor]                           ; $7CE1: $FA $A5 $DB
    ld   d, a                                     ; $7CE4: $57

    ldh  a, [hMapId]                              ; $7CE5: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $7CE7: $FE $1A
    jr   nc, .jr_7CF0                             ; $7CE9: $30 $05

    cp   MAP_INDOORS_B_START                      ; $7CEB: $FE $06
    jr   c, .jr_7CF0                              ; $7CED: $38 $01

    inc  d                                        ; $7CEF: $14

.jr_7CF0
    add  hl, de                                   ; $7CF0: $19
    ld   a, [hl]                                  ; $7CF1: $7E
    or   ROOM_STATUS_EVENT_2                      ; $7CF2: $F6 $20
    ld   [hl], a                                  ; $7CF4: $77
    ldh  [hRoomStatus], a                         ; $7CF5: $E0 $F8
    ret                                           ; $7CF7: $C9

include "code/entities/15_dream_shrine_bed.asm"
include "code/entities/15_book.asm"
include "code/entities/15_animal_d1.asm"
