; Following code is part of the nightmare boss
Data_015_45A3::
    db   $00, $00, $46, $07, $00, $08, $7E, $07, $F0, $00, $46, $07, $F0, $08, $7E, $07
    db   $E0, $00, $46, $07, $E0, $08, $7E, $07, $D0, $00, $46, $07, $D0, $08, $7E, $07
    db   $C0, $00, $46, $07, $C0, $08, $7E, $07

; This is called after Dethl is defeated, gives the victory message and shows the stairs
; And waits for link to climb the stairs and finally switches the gameplay mode to credits
FinalNightmareStairsHandler:
    ld   hl, wEntitiesInertiaTable                ;; 15:45CB $21 $D0 $C3
    add  hl, bc                                   ;; 15:45CE $09
    ld   a, [hl]                                  ;; 15:45CF $7E
    add  $01                                      ;; 15:45D0 $C6 $01
    sla  a                                        ;; 15:45D2 $CB $27
    ld   c, a                                     ;; 15:45D4 $4F
    ld   hl, Data_015_45A3                        ;; 15:45D5 $21 $A3 $45
    call RenderActiveEntitySpritesRect            ;; 15:45D8 $CD $E6 $3C
    ld   a, $0A                                   ;; 15:45DB $3E $0A
    call func_015_7964_trampoline                 ;; 15:45DD $CD $A0 $3D
    call ReturnIfNonInteractive_15                ;; 15:45E0 $CD $0D $7B
    ld   a, [wGameplayType]                       ;; 15:45E3 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 15:45E6 $FE $01
    ret  z                                        ;; 15:45E8 $C8

    ldh  a, [hActiveEntityState]                  ;; 15:45E9 $F0 $F0
    JP_TABLE                                      ;; 15:45EB
._00 dw func_015_45F6                             ;; 15:45EC
._01 dw func_015_45FE                             ;; 15:45EE
._02 dw func_015_4627                             ;; 15:45F0
._03 dw func_015_463D                             ;; 15:45F2
._04 dw func_015_4660                             ;; 15:45F4

func_015_45F6::
    call GetEntityTransitionCountdown             ;; 15:45F6 $CD $05 $0C
    ld   [hl], $C0                                ;; 15:45F9 $36 $C0
    jp   IncrementEntityState                     ;; 15:45FB $C3 $12 $3B

func_015_45FE::
    call GetEntityTransitionCountdown             ;; 15:45FE $CD $05 $0C
    cp   $40                                      ;; 15:4601 $FE $40
    jr   nz, .jr_460B                             ;; 15:4603 $20 $06

    dec  [hl]                                     ;; 15:4605 $35
    jp_open_dialog Dialog0D7                      ;; 15:4606

.jr_460B
    and  a                                        ;; 15:460B $A7
    ret  nz                                       ;; 15:460C $C0

    ld   a, $50                                   ;; 15:460D $3E $50
    dec  a                                        ;; 15:460F $3D
    ldh  [hMultiPurpose0], a                      ;; 15:4610 $E0 $D7
    ld   a, $30                                   ;; 15:4612 $3E $30
    ldh  [hMultiPurpose1], a                      ;; 15:4614 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 15:4616 $3E $02
    call AddTranscientVfx                         ;; 15:4618 $CD $C7 $0C
    ld   a, JINGLE_POOF                           ;; 15:461B $3E $2F
    ldh  [hJingle], a                             ;; 15:461D $E0 $F2
    ld   a, $00                                   ;; 15:461F $3E $00
    call SetEntitySpriteVariant                   ;; 15:4621 $CD $0C $3B
    jp   IncrementEntityState                     ;; 15:4624 $C3 $12 $3B

func_015_4627::
    ldh  a, [hLinkPositionX]                      ;; 15:4627 $F0 $98
    sub  $50                                      ;; 15:4629 $D6 $50
    add  $08                                      ;; 15:462B $C6 $08
    cp   $10                                      ;; 15:462D $FE $10
    jr   nc, .jr_463A                             ;; 15:462F $30 $09

    ldh  a, [hLinkPositionY]                      ;; 15:4631 $F0 $99
    sub  $30                                      ;; 15:4633 $D6 $30
    add  $08                                      ;; 15:4635 $C6 $08
    cp   $10                                      ;; 15:4637 $FE $10
    ret  c                                        ;; 15:4639 $D8

.jr_463A
    jp   IncrementEntityState                     ;; 15:463A $C3 $12 $3B

func_015_463D::
    ldh  a, [hLinkPositionX]                      ;; 15:463D $F0 $98
    sub  $50                                      ;; 15:463F $D6 $50
    add  $08                                      ;; 15:4641 $C6 $08
    cp   $10                                      ;; 15:4643 $FE $10
    jr   nc, .ret_465F                            ;; 15:4645 $30 $18

    ldh  a, [hLinkPositionY]                      ;; 15:4647 $F0 $99
    sub  $30                                      ;; 15:4649 $D6 $30
    add  $08                                      ;; 15:464B $C6 $08
    cp   $10                                      ;; 15:464D $FE $10
    jr   nc, .ret_465F                            ;; 15:464F $30 $0E

    ld   a, [wIsLinkInTheAir]                     ;; 15:4651 $FA $46 $C1
    and  a                                        ;; 15:4654 $A7
    ret  nz                                       ;; 15:4655 $C0

    call IncrementEntityState                     ;; 15:4656 $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4659 $21 $B0 $C2
    add  hl, bc                                   ;; 15:465C $09
    ld   [hl], $30                                ;; 15:465D $36 $30

.ret_465F
    ret                                           ;; 15:465F $C9

func_015_4660::
    ld   a, $02                                   ;; 15:4660 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 15:4662 $E0 $A1
    ld   [wC167], a                               ;; 15:4664 $EA $67 $C1
    ld   hl, wEntitiesPrivateState1Table          ;; 15:4667 $21 $B0 $C2
    add  hl, bc                                   ;; 15:466A $09
    ld   a, [hl]                                  ;; 15:466B $7E
    ldh  [hLinkPositionY], a                      ;; 15:466C $E0 $99
    ld   a, $50                                   ;; 15:466E $3E $50
    ldh  [hLinkPositionX], a                      ;; 15:4670 $E0 $98
    ldh  a, [hFrameCounter]                       ;; 15:4672 $F0 $E7
    and  $07                                      ;; 15:4674 $E6 $07
    jr   nz, .jr_4682                             ;; 15:4676 $20 $0A

    ld   hl, wEntitiesInertiaTable                ;; 15:4678 $21 $D0 $C3
    add  hl, bc                                   ;; 15:467B $09
    ld   a, [hl]                                  ;; 15:467C $7E
    cp   $04                                      ;; 15:467D $FE $04
    jr   z, .jr_4682                              ;; 15:467F $28 $01

    inc  [hl]                                     ;; 15:4681 $34

.jr_4682
    ldh  a, [hFrameCounter]                       ;; 15:4682 $F0 $E7
    and  $03                                      ;; 15:4684 $E6 $03
    jr   nz, .jr_469C                             ;; 15:4686 $20 $14

    ld   hl, wEntitiesPrivateState1Table          ;; 15:4688 $21 $B0 $C2
    add  hl, bc                                   ;; 15:468B $09
    dec  [hl]                                     ;; 15:468C $35
    ld   a, [hl]                                  ;; 15:468D $7E
    cp   $12                                      ;; 15:468E $FE $12
    jr   nc, .jr_469C                             ;; 15:4690 $30 $0A

    xor  a                                        ;; 15:4692 $AF
    ld   [wGameplaySubtype], a                    ;; 15:4693 $EA $96 $DB
    ld   a, GAMEPLAY_CREDITS                      ;; 15:4696 $3E $01
    ld   [wGameplayType], a                       ;; 15:4698 $EA $95 $DB
    ret                                           ;; 15:469B $C9

.jr_469C
    ld   a, $02                                   ;; 15:469C $3E $02
    ldh  [hLinkDirection], a                      ;; 15:469E $E0 $9E
    ldh  a, [hFrameCounter]                       ;; 15:46A0 $F0 $E7
    and  $08                                      ;; 15:46A2 $E6 $08
    ld   [wConsecutiveStepsCount], a              ;; 15:46A4 $EA $20 $C1
    push bc                                       ;; 15:46A7 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 15:46A8 $CD $F0 $0B
    pop  bc                                       ;; 15:46AB $C1
    call ResetSpinAttack                          ;; 15:46AC $CD $AF $0C
    ; a = 0
    ; wSwordAnimationState = SWORD_ANIMATION_STATE_NONE
    ld   [wSwordAnimationState], a                ;; 15:46AF $EA $37 $C1
    ld   [wC16A], a                               ;; 15:46B2 $EA $6A $C1
    ret                                           ;; 15:46B5 $C9
