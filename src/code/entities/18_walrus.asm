Data_018_54B9::
    db   $24, $00, $3E, $00

label_018_54BD:
    ld   de, Data_018_54B9                        ;; 18:54BD $11 $B9 $54
    call RenderActiveEntitySprite                 ;; 18:54C0 $CD $77 $3C
    call ReturnIfNonInteractive_18                ;; 18:54C3 $CD $E8 $7D
    call GetEntityTransitionCountdown             ;; 18:54C6 $CD $05 $0C
    jp   z, ClearEntityStatusBank18               ;; 18:54C9 $CA $08 $7F

    ld   e, $01                                   ;; 18:54CC $1E $01
    cp   $40                                      ;; 18:54CE $FE $40
    jr   c, jr_018_54DF                           ;; 18:54D0 $38 $0D

    jr   nz, .jr_54DE                             ;; 18:54D2 $20 $0A

    ld   hl, wEntitiesPosYTable                   ;; 18:54D4 $21 $10 $C2
    add  hl, bc                                   ;; 18:54D7 $09
    ld   a, [hl]                                  ;; 18:54D8 $7E
    add  $04                                      ;; 18:54D9 $C6 $04
    ld   [hl], a                                  ;; 18:54DB $77
    jr   jr_018_54DF                              ;; 18:54DC $18 $01

.jr_54DE
    dec  e                                        ;; 18:54DE $1D

jr_018_54DF:
    ld   a, e                                     ;; 18:54DF $7B
    call SetEntitySpriteVariant                   ;; 18:54E0 $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 18:54E3 $CD $05 $0C
    ld   e, $FE                                   ;; 18:54E6 $1E $FE
    and  $20                                      ;; 18:54E8 $E6 $20
    jr   z, .jr_54EE                              ;; 18:54EA $28 $02

    ld   e, $FC                                   ;; 18:54EC $1E $FC

.jr_54EE
    ld   hl, wEntitiesSpeedYTable                 ;; 18:54EE $21 $50 $C2
    add  hl, bc                                   ;; 18:54F1 $09
    ld   [hl], e                                  ;; 18:54F2 $73
    ld   hl, wEntitiesSpeedXTable                 ;; 18:54F3 $21 $40 $C2
    add  hl, bc                                   ;; 18:54F6 $09
    ld   [hl], $FF                                ;; 18:54F7 $36 $FF
    ldh  a, [hFrameCounter]                       ;; 18:54F9 $F0 $E7
    and  $03                                      ;; 18:54FB $E6 $03
    ret  nz                                       ;; 18:54FD $C0

    jp   UpdateEntityPosWithSpeed_18              ;; 18:54FE $C3 $5F $7E

; Note: this entity, unlike most others, use 3 spriteslots:
; 2 spriteslots when sleeping, and then another one for Marin singing, so 3.
;
; It uses the same trick as the slime boss, so the walrus spriteslots are loaded
; one room before the actual walrus. So Marin's singing sprite can be loaded when
; entering the room with the walrus.
WalrusEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 18:5501 $21 $B0 $C2
    add  hl, bc                                   ;; 18:5504 $09
    ld   a, [hl]                                  ;; 18:5505 $7E
    and  a                                        ;; 18:5506 $A7
    jp   nz, label_018_54BD                       ;; 18:5507 $C2 $BD $54

    ld   a, [wOverworldRoomStatus + $FD]          ;; 18:550A $FA $FD $D8
    and  OW_ROOM_STATUS_OWL_TALKED                ;; 18:550D $E6 $20
    jp   nz, label_018_589A                       ;; 18:550F $C2 $9A $58

    call func_018_586B                            ;; 18:5512 $CD $6B $58
    call ReturnIfNonInteractive_18                ;; 18:5515 $CD $E8 $7D
    call AddEntityZSpeedToPos_18                  ;; 18:5518 $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 18:551B $21 $20 $C3
    add  hl, bc                                   ;; 18:551E $09
    dec  [hl]                                     ;; 18:551F $35
    ld   hl, wEntitiesPosZTable                   ;; 18:5520 $21 $10 $C3
    add  hl, bc                                   ;; 18:5523 $09
    ld   a, [hl]                                  ;; 18:5524 $7E
    and  $80                                      ;; 18:5525 $E6 $80
    jr   z, .jr_552F                              ;; 18:5527 $28 $06

    ld   [hl], b                                  ;; 18:5529 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 18:552A $21 $20 $C3
    add  hl, bc                                   ;; 18:552D $09
    ld   [hl], b                                  ;; 18:552E $70

.jr_552F
    call PushLinkOutOfEntity_18                   ;; 18:552F $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ;; 18:5532 $F0 $F0
    JP_TABLE                                      ;; 18:5534
._00 dw WalrusState0Handler                       ;; 18:5535
._01 dw WalrusWakingUpHandler                     ;; 18:5537
._02 dw WalrusState2Handler                       ;; 18:5539
._03 dw WalrusState3Handler                       ;; 18:553B
._04 dw WalrusState4Handler                       ;; 18:553D
._05 dw WalrusState5Handler                       ;; 18:553F
._06 dw WalrusDisappearHandler                    ;; 18:5541
._07 dw WalrusState7Handler                       ;; 18:5543
._08 dw WalrusState8Handler                       ;; 18:5545

WalrusState0Handler::
    ld   hl, wEntitiesInertiaTable                ;; 18:5547 $21 $D0 $C3
    add  hl, bc                                   ;; 18:554A $09
    inc  [hl]                                     ;; 18:554B $34
    ld   a, $7F                                   ;; 18:554C $3E $7F
    and  [hl]                                     ;; 18:554E $A6
    jr   nz, .jr_557B                             ;; 18:554F $20 $2A

    ld   a, ENTITY_WALRUS                         ;; 18:5551 $3E $C4
    call SpawnNewEntity_trampoline                ;; 18:5553 $CD $86 $3B
    jr   c, .jr_557B                              ;; 18:5556 $38 $23

    ldh  a, [hMultiPurpose0]                      ;; 18:5558 $F0 $D7
    sub  $08                                      ;; 18:555A $D6 $08
    ld   hl, wEntitiesPosXTable                   ;; 18:555C $21 $00 $C2
    add  hl, de                                   ;; 18:555F $19
    ld   [hl], a                                  ;; 18:5560 $77
    ldh  a, [hMultiPurpose1]                      ;; 18:5561 $F0 $D8
    add  $02                                      ;; 18:5563 $C6 $02
    ld   hl, wEntitiesPosYTable                   ;; 18:5565 $21 $10 $C2
    add  hl, de                                   ;; 18:5568 $19
    ld   [hl], a                                  ;; 18:5569 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:556A $21 $E0 $C2
    add  hl, de                                   ;; 18:556D $19
    ld   [hl], $60                                ;; 18:556E $36 $60
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 18:5570 $21 $40 $C3
    add  hl, de                                   ;; 18:5573 $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 18:5574 $36 $C1
    ld   hl, wEntitiesPrivateState1Table          ;; 18:5576 $21 $B0 $C2
    add  hl, de                                   ;; 18:5579 $19
    inc  [hl]                                     ;; 18:557A $34

.jr_557B
    ld   a, [wIsMarinFollowingLink]               ;; 18:557B $FA $73 $DB
    and  a                                        ;; 18:557E $A7
    jr   nz, .jr_558A                             ;; 18:557F $20 $09

    call func_018_7D7C                            ;; 18:5581 $CD $7C $7D
    ret  nc                                       ;; 18:5584 $D0

    jp_open_dialog Dialog1E0                      ;; 18:5585

.jr_558A
    call func_018_7EB2                            ;; 18:558A $CD $B2 $7E
    add  $13                                      ;; 18:558D $C6 $13
    cp   $26                                      ;; 18:558F $FE $26
    ret  nc                                       ;; 18:5591 $D0

    call func_018_7EC2                            ;; 18:5592 $CD $C2 $7E
    add  $20                                      ;; 18:5595 $C6 $20
    cp   $40                                      ;; 18:5597 $FE $40
    ret  nc                                       ;; 18:5599 $D0

    call ResetSpinAttack                          ;; 18:559A $CD $AF $0C
    call ClearLinkPositionIncrement               ;; 18:559D $CD $8E $17
    ld   a, [wIsLinkInTheAir]                     ;; 18:55A0 $FA $46 $C1
    and  a                                        ;; 18:55A3 $A7
    ret  nz                                       ;; 18:55A4 $C0

    ld   a, [wMarinEntityIndex]                   ;; 18:55A5 $FA $0F $C5
    ld   e, a                                     ;; 18:55A8 $5F
    ld   d, b                                     ;; 18:55A9 $50
    ld   hl, wEntitiesPosZTable                   ;; 18:55AA $21 $10 $C3
    add  hl, de                                   ;; 18:55AD $19
    ld   a, [hl]                                  ;; 18:55AE $7E
    and  a                                        ;; 18:55AF $A7
    ret  nz                                       ;; 18:55B0 $C0

    call IncrementEntityState                     ;; 18:55B1 $CD $12 $3B
    call_open_dialog Dialog1E1                    ;; 18:55B4
    jp   label_018_59AC                           ;; 18:55B9 $C3 $AC $59

WalrusWakingUpHandler::
    ld   a, [wDialogState]                        ;; 18:55BC $FA $9F $C1
    and  a                                        ;; 18:55BF $A7
    ret  nz                                       ;; 18:55C0 $C0

    call IncrementEntityState                     ;; 18:55C1 $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ;; 18:55C4 $FA $77 $C1
    and  a                                        ;; 18:55C7 $A7
    jr   nz, .jr_55D8                             ;; 18:55C8 $20 $0E

    ld   a, MUSIC_MARIN_SING                      ;; 18:55CA $3E $2F
    ld   [wMusicTrackToPlay], a                   ;; 18:55CC $EA $68 $D3
    ld   [wIsMarinSinging], a                     ;; 18:55CF $EA $C8 $C3
    call GetEntitySlowTransitionCountdown         ;; 18:55D2 $CD $FB $0B
    ld   [hl], $50                                ;; 18:55D5 $36 $50
    ret                                           ;; 18:55D7 $C9

.jr_55D8
    ld   [hl], $08                                ;; 18:55D8 $36 $08
    jp_open_dialog Dialog1E4                      ;; 18:55DA

WalrusState2Handler::
    ld   a, $01                                   ;; 18:55DF $3E $01
    ld   [wC167], a                               ;; 18:55E1 $EA $67 $C1
    ld   a, $02                                   ;; 18:55E4 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:55E6 $E0 $A1
    call GetEntitySlowTransitionCountdown         ;; 18:55E8 $CD $FB $0B
    jr   nz, .jr_55F2                             ;; 18:55EB $20 $05

    ld   [hl], $C0                                ;; 18:55ED $36 $C0
    jp   IncrementEntityState                     ;; 18:55EF $C3 $12 $3B

.jr_55F2
    ld   e, $00                                   ;; 18:55F2 $1E $00
    cp   $40                                      ;; 18:55F4 $FE $40
    jr   nc, jr_018_5612                          ;; 18:55F6 $30 $1A

    ld   e, $02                                   ;; 18:55F8 $1E $02
    cp   $10                                      ;; 18:55FA $FE $10
    jr   c, jr_018_5612                           ;; 18:55FC $38 $14

    ld   e, $00                                   ;; 18:55FE $1E $00
    cp   $3C                                      ;; 18:5600 $FE $3C
    jr   nc, .jr_5610                             ;; 18:5602 $30 $0C

    cp   $20                                      ;; 18:5604 $FE $20
    jr   z, jr_018_5612                           ;; 18:5606 $28 $0A

    cp   $21                                      ;; 18:5608 $FE $21
    jr   z, jr_018_5612                           ;; 18:560A $28 $06

    cp   $22                                      ;; 18:560C $FE $22
    jr   z, jr_018_5612                           ;; 18:560E $28 $02

.jr_5610
    ld   e, $01                                   ;; 18:5610 $1E $01

jr_018_5612:
    ld   a, e                                     ;; 18:5612 $7B
    jp   SetEntitySpriteVariant                   ;; 18:5613 $C3 $0C $3B

Data_018_5616::
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02

WalrusState3Handler::
    ld   a, $01                                   ;; 18:5676 $3E $01
    ld   [wC167], a                               ;; 18:5678 $EA $67 $C1
    ld   a, $02                                   ;; 18:567B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:567D $E0 $A1
    call GetEntitySlowTransitionCountdown         ;; 18:567F $CD $FB $0B
    jr   nz, .jr_5698                             ;; 18:5682 $20 $14

    ld   [wIsMarinSinging], a                     ;; 18:5684 $EA $C8 $C3
    ld   a, NOISE_SFX_RUMBLE                      ;; 18:5687 $3E $11
    ldh  [hNoiseSfx], a                           ;; 18:5689 $E0 $F4
    call GetEntityTransitionCountdown             ;; 18:568B $CD $05 $0C
    ld   [hl], $08                                ;; 18:568E $36 $08
    ld   a, $02                                   ;; 18:5690 $3E $02
    call SetEntitySpriteVariant                   ;; 18:5692 $CD $0C $3B
    jp   IncrementEntityState                     ;; 18:5695 $C3 $12 $3B

.jr_5698
    ld   hl, wEntitiesPrivateState3Table          ;; 18:5698 $21 $D0 $C2
    add  hl, bc                                   ;; 18:569B $09
    ld   e, [hl]                                  ;; 18:569C $5E
    ld   d, b                                     ;; 18:569D $50
    ldh  a, [hFrameCounter]                       ;; 18:569E $F0 $E7
    and  $07                                      ;; 18:56A0 $E6 $07
    jr   nz, .jr_56B8                             ;; 18:56A2 $20 $14

    inc  [hl]                                     ;; 18:56A4 $34
    ld   a, [hl]                                  ;; 18:56A5 $7E
    cp   $60                                      ;; 18:56A6 $FE $60
    jr   nc, .jr_56B8                             ;; 18:56A8 $30 $0E

    and  $0F                                      ;; 18:56AA $E6 $0F
    jr   nz, .jr_56B8                             ;; 18:56AC $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ;; 18:56AE $21 $20 $C3
    add  hl, bc                                   ;; 18:56B1 $09
    ld   [hl], $10                                ;; 18:56B2 $36 $10
    ld   a, JINGLE_JUMP                           ;; 18:56B4 $3E $24
    ldh  [hJingle], a                             ;; 18:56B6 $E0 $F2

.jr_56B8
    ld   hl, Data_018_5616                        ;; 18:56B8 $21 $16 $56
    add  hl, de                                   ;; 18:56BB $19
    ld   a, [hl]                                  ;; 18:56BC $7E
    cp   $02                                      ;; 18:56BD $FE $02
    jr   nz, jr_018_56CE                          ;; 18:56BF $20 $0D

    ldh  a, [hFrameCounter]                       ;; 18:56C1 $F0 $E7
    and  $3F                                      ;; 18:56C3 $E6 $3F
    jr   nz, .jr_56CC                             ;; 18:56C5 $20 $05

    ld   hl, hJingle                              ;; 18:56C7 $21 $F2 $FF
    ld   [hl], JINGLE_WALRUS                      ;; 18:56CA $36 $27

.jr_56CC
    ld   a, $02                                   ;; 18:56CC $3E $02

jr_018_56CE:
    call SetEntitySpriteVariant                   ;; 18:56CE $CD $0C $3B
    ld   hl, wEntitiesPosZTable                   ;; 18:56D1 $21 $10 $C3
    add  hl, bc                                   ;; 18:56D4 $09
    ld   a, [hl]                                  ;; 18:56D5 $7E
    and  a                                        ;; 18:56D6 $A7
    ret  z                                        ;; 18:56D7 $C8

    ld   e, $01                                   ;; 18:56D8 $1E $01
    ld   hl, wEntitiesSpeedZTable                 ;; 18:56DA $21 $20 $C3
    add  hl, bc                                   ;; 18:56DD $09
    ld   a, [hl]                                  ;; 18:56DE $7E
    sub  $F8                                      ;; 18:56DF $D6 $F8
    and  $80                                      ;; 18:56E1 $E6 $80
    jr   nz, .jr_56E6                             ;; 18:56E3 $20 $01

    inc  e                                        ;; 18:56E5 $1C

.jr_56E6
    ld   a, e                                     ;; 18:56E6 $7B
    jp   SetEntitySpriteVariant                   ;; 18:56E7 $C3 $0C $3B

WalrusState4Handler::
    ld   a, $02                                   ;; 18:56EA $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:56EC $E0 $A1
    call GetEntityTransitionCountdown             ;; 18:56EE $CD $05 $0C
    ret  nz                                       ;; 18:56F1 $C0

    ld   [hl], $10                                ;; 18:56F2 $36 $10
    ld   hl, wEntitiesPosYTable                   ;; 18:56F4 $21 $10 $C2
    add  hl, bc                                   ;; 18:56F7 $09
    ld   a, [hl]                                  ;; 18:56F8 $7E
    add  $04                                      ;; 18:56F9 $C6 $04
    ld   [hl], a                                  ;; 18:56FB $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 18:56FC $21 $B0 $C3
    add  hl, bc                                   ;; 18:56FF $09
    ld   a, [hl]                                  ;; 18:5700 $7E
    inc  a                                        ;; 18:5701 $3C
    ld   [hl], a                                  ;; 18:5702 $77
    cp   $04                                      ;; 18:5703 $FE $04
    ret  nz                                       ;; 18:5705 $C0

    ld   hl, wEntitiesPosZTable                   ;; 18:5706 $21 $10 $C3
    add  hl, bc                                   ;; 18:5709 $09
    ld   [hl], $18                                ;; 18:570A $36 $18
    ld   hl, wEntitiesPosYTable                   ;; 18:570C $21 $10 $C2
    add  hl, bc                                   ;; 18:570F $09
    ld   a, [hl]                                  ;; 18:5710 $7E
    add  $18                                      ;; 18:5711 $C6 $18
    ld   [hl], a                                  ;; 18:5713 $77
    ld   a, JINGLE_FALL_DOWN                      ;; 18:5714 $3E $08
    ldh  [hJingle], a                             ;; 18:5716 $E0 $F2
    jp   IncrementEntityState                     ;; 18:5718 $C3 $12 $3B

WalrusState5Handler::
    ld   a, $02                                   ;; 18:571B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:571D $E0 $A1
    ld   hl, wEntitiesPosZTable                   ;; 18:571F $21 $10 $C3
    add  hl, bc                                   ;; 18:5722 $09
    ld   a, [hl]                                  ;; 18:5723 $7E
    and  a                                        ;; 18:5724 $A7
    ret  nz                                       ;; 18:5725 $C0

    call IncrementEntityState                     ;; 18:5726 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 18:5729 $CD $05 $0C
    ld   [hl], $08                                ;; 18:572C $36 $08

; Walrus splash VFX
func_018_572E::
    ld   a, NOISE_SFX_WALRUS_SPLASH               ;; 18:572E $3E $24
    ldh  [hNoiseSfx], a                           ;; 18:5730 $E0 $F4
    ldh  a, [hActiveEntityPosX]                   ;; 18:5732 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 18:5734 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5736 $F0 $EC
    add  $10                                      ;; 18:5738 $C6 $10
    ldh  [hMultiPurpose1], a                      ;; 18:573A $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 18:573C $3E $01
    call AddTranscientVfx                         ;; 18:573E $CD $C7 $0C
    ldh  a, [hActiveEntityPosX]                   ;; 18:5741 $F0 $EE
    add  $10                                      ;; 18:5743 $C6 $10
    ldh  [hMultiPurpose0], a                      ;; 18:5745 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:5747 $F0 $EC
    add  $10                                      ;; 18:5749 $C6 $10
    ldh  [hMultiPurpose1], a                      ;; 18:574B $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 18:574D $3E $01
    jp   AddTranscientVfx                         ;; 18:574F $C3 $C7 $0C

; When the walrus disappears and Link looks down and the normal music resumes.
WalrusDisappearHandler::
    call GetEntityTransitionCountdown             ;; 18:5752 $CD $05 $0C
    jr   nz, .jr_5778                             ;; 18:5755 $20 $21

    call IncrementEntityState                     ;; 18:5757 $CD $12 $3B
    ; Resumes the normal music after the walrus has disappeared
    ldh  a, [hDefaultMusicTrack]                  ;; 18:575A $F0 $B0
    ld   [wMusicTrackToPlay], a                   ;; 18:575C $EA $68 $D3
    ld   a, $FF                                   ;; 18:575F $3E $FF
    call SetEntitySpriteVariant                   ;; 18:5761 $CD $0C $3B
    call_open_dialog Dialog1E2                    ;; 18:5764
    ld   a, $03                                   ;; 18:5769 $3E $03
    call func_018_59AE                            ;; 18:576B $CD $AE $59
    ld   a, DIRECTION_DOWN                        ;; 18:576E $3E $03
    ldh  [hLinkDirection], a                      ;; 18:5770 $E0 $9E
    push bc                                       ;; 18:5772 $C5
    call UpdateLinkWalkingAnimation_trampoline    ;; 18:5773 $CD $F0 $0B
    pop  bc                                       ;; 18:5776 $C1
    ret                                           ;; 18:5777 $C9

.jr_5778
    ld   a, $05                                   ;; 18:5778 $3E $05
    jp   SetEntitySpriteVariant                   ;; 18:577A $C3 $0C $3B

WalrusState7Handler::
    ld   a, ENTITY_BUNNY_CALLING_MARIN            ;; 18:577D $3E $C8
    call SpawnNewEntity_trampoline                ;; 18:577F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 18:5782 $21 $00 $C2
    add  hl, de                                   ;; 18:5785 $19
    ld   [hl], $F8                                ;; 18:5786 $36 $F8
    ld   hl, wEntitiesTransitionCountdownTable    ;; 18:5788 $21 $E0 $C2
    add  hl, de                                   ;; 18:578B $19
    ld   [hl], $20                                ;; 18:578C $36 $20
    ld   hl, wEntitiesPosYTable                   ;; 18:578E $21 $10 $C2
    add  hl, de                                   ;; 18:5791 $19
    ld   [hl], $48                                ;; 18:5792 $36 $48
    call ClearEntityStatusBank18                  ;; 18:5794 $CD $08 $7F
    jp   SetRoomStatus20                          ;; 18:5797 $C3 $B9 $7F

WalrusState8Handler::
    ret                                           ;; 18:579A $C9

Data_018_579B::
    db   $00, $00, $60, $01, $00, $08, $62, $01   ;; 18:579B
    db   $00, $10, $64, $01, $00, $18, $66, $01   ;; 18:57A3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ;; 18:57AB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ;; 18:57B3
    db   $00, $00, $60, $01, $00, $08, $70, $01   ;; 18:57BB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ;; 18:57C3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ;; 18:57CB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ;; 18:57D3
    db   $00, $00, $72, $01, $00, $08, $74, $01   ;; 18:57DB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ;; 18:57E3
    db   $10, $00, $76, $01, $10, $08, $6A, $01   ;; 18:57EB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ;; 18:57F3
    db   $00, $00, $78, $01, $00, $08, $7A, $01   ;; 18:57FB
    db   $00, $10, $7C, $01, $00, $18, $7E, $01   ;; 18:5803
    db   $10, $00, $78, $41, $10, $08, $7A, $41   ;; 18:580B
    db   $10, $10, $7C, $41, $10, $18, $7E, $41   ;; 18:5813
    db   $00, $00, $68, $41, $00, $08, $6A, $41   ;; 18:581B
    db   $00, $10, $6C, $41, $00, $18, $6E, $41   ;; 18:5823
    db   $10, $00, $60, $41, $10, $08, $62, $41   ;; 18:582B
    db   $10, $10, $64, $41, $10, $18, $66, $41   ;; 18:5833
    db   $0E, $00, $68, $41, $0E, $08, $6A, $41   ;; 18:583B
    db   $0E, $10, $6C, $41, $0E, $18, $6E, $41   ;; 18:5843
    db   $10, $00, $FF, $41, $10, $08, $FF, $41   ;; 18:584B
    db   $10, $10, $FF, $41, $10, $18, $FF, $41   ;; 18:5853

Data_018_585B::
    db   $17, $03, $26, $00, $17, $09, $26, $00, $17, $0F, $26, $00, $17, $15, $26, $00

; Render Walrus?
func_018_586B::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:586B $F0 $F1
    rla                                           ;; 18:586D $17
    rla                                           ;; 18:586E $17
    rla                                           ;; 18:586F $17
    rla                                           ;; 18:5870 $17
    rla                                           ;; 18:5871 $17
    and  $E0                                      ;; 18:5872 $E6 $E0
    ld   e, a                                     ;; 18:5874 $5F
    ld   d, b                                     ;; 18:5875 $50
    ld   hl, Data_018_579B                        ;; 18:5876 $21 $9B $57
    add  hl, de                                   ;; 18:5879 $19
    ld   c, $08                                   ;; 18:587A $0E $08
    call RenderActiveEntitySpritesRect            ;; 18:587C $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ;; 18:587F $21 $10 $C3
    add  hl, bc                                   ;; 18:5882 $09
    ld   a, [hl]                                  ;; 18:5883 $7E
    and  a                                        ;; 18:5884 $A7
    ret  z                                        ;; 18:5885 $C8

    ldh  a, [hActiveEntityPosY]                   ;; 18:5886 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 18:5888 $E0 $EC
    ld   hl, Data_018_585B                        ;; 18:588A $21 $5B $58
    ld   c, $04                                   ;; 18:588D $0E $04
    call RenderActiveEntitySpritesRect            ;; 18:588F $CD $E6 $3C
    ld   a, $04                                   ;; 18:5892 $3E $04
    call func_015_7964_trampoline                 ;; 18:5894 $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ;; 18:5897 $C3 $8A $3D

label_018_589A:
    call func_018_596B                            ;; 18:589A $CD $6B $59
    ld   a, [wRoomTransitionState]                ;; 18:589D $FA $24 $C1

.jr_58A0
    and  a                                        ;; 18:58A0 $A7
    ret  nz                                       ;; 18:58A1 $C0

    ldh  a, [hActiveEntityState]                  ;; 18:58A2 $F0 $F0
    JP_TABLE                                      ;; 18:58A4
._00 dw func_018_58AD                             ;; 18:58A5
._01 dw func_018_58C1                             ;; 18:58A7
._02 dw func_018_58DD                             ;; 18:58A9
._03 dw func_018_58F1                             ;; 18:58AB

func_018_58AD::
    ld   hl, wEntitiesPosYTable                   ;; 18:58AD $21 $10 $C2
    add  hl, bc                                   ;; 18:58B0 $09
    ld   [hl], $68                                ;; 18:58B1 $36 $68
    ld   hl, wEntitiesPosXTable                   ;; 18:58B3 $21 $00 $C2
    add  hl, bc                                   ;; 18:58B6 $09
    ld   [hl], $80                                ;; 18:58B7 $36 $80
    call GetEntityTransitionCountdown             ;; 18:58B9 $CD $05 $0C
    ld   [hl], $20                                ;; 18:58BC $36 $20
    jp   IncrementEntityState                     ;; 18:58BE $C3 $12 $3B

func_018_58C1::
    call GetEntityTransitionCountdown             ;; 18:58C1 $CD $05 $0C
    ret  nz                                       ;; 18:58C4 $C0

    ld   a, [wSelectedSongIndex]                  ;; 18:58C5 $FA $4A $DB
    cp   $00                                      ;; 18:58C8 $FE $00
    ret  nz                                       ;; 18:58CA $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 18:58CB $FA $66 $C1
    and  a                                        ;; 18:58CE $A7
    cp   $40                                      ;; 18:58CF $FE $40
    ret  nz                                       ;; 18:58D1 $C0

    call IncrementEntityState                     ;; 18:58D2 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 18:58D5 $CD $05 $0C
    ld   [hl], $20                                ;; 18:58D8 $36 $20
    jp   func_018_572E                            ;; 18:58DA $C3 $2E $57

func_018_58DD::
    call GetEntityTransitionCountdown             ;; 18:58DD $CD $05 $0C
    jr   nz, .jr_58E7                             ;; 18:58E0 $20 $05

    ld   [hl], $C8                                ;; 18:58E2 $36 $C8
    jp   IncrementEntityState                     ;; 18:58E4 $C3 $12 $3B

.jr_58E7
    cp   $10                                      ;; 18:58E7 $FE $10
    ld   a, $01                                   ;; 18:58E9 $3E $01
    jr   c, .jr_58EE                              ;; 18:58EB $38 $01

    inc  a                                        ;; 18:58ED $3C

.jr_58EE
    jp   SetEntitySpriteVariant                   ;; 18:58EE $C3 $0C $3B

func_018_58F1::
    call GetEntityTransitionCountdown             ;; 18:58F1 $CD $05 $0C
    jr   nz, .jr_58FC                             ;; 18:58F4 $20 $06

    call func_018_572E                            ;; 18:58F6 $CD $2E $57
    jp   ClearEntityStatusBank18                  ;; 18:58F9 $C3 $08 $7F

.jr_58FC
    cp   $B0                                      ;; 18:58FC $FE $B0
    jr   nz, .jr_5900                             ;; 18:58FE $20 $00

.jr_5900
    call GetEntityTransitionCountdown             ;; 18:5900 $CD $05 $0C
    cp   $80                                      ;; 18:5903 $FE $80
    jr   nz, .jr_590D                             ;; 18:5905 $20 $06

    dec  [hl]                                     ;; 18:5907 $35
    call_open_dialog Dialog1E6                    ;; 18:5908

.jr_590D
    call GetEntityTransitionCountdown             ;; 18:590D $CD $05 $0C
    ld   d, $00                                   ;; 18:5910 $16 $00
    cp   $10                                      ;; 18:5912 $FE $10
    ld   e, $02                                   ;; 18:5914 $1E $02
    jr   c, .jr_591E                              ;; 18:5916 $38 $06

    dec  e                                        ;; 18:5918 $1D
    cp   $20                                      ;; 18:5919 $FE $20
    jr   c, .jr_591E                              ;; 18:591B $38 $01

    inc  d                                        ;; 18:591D $14

.jr_591E
    ld   hl, wEntitiesPrivateState5Table          ;; 18:591E $21 $90 $C3
    add  hl, bc                                   ;; 18:5921 $09
    ld   [hl], d                                  ;; 18:5922 $72
    ld   a, e                                     ;; 18:5923 $7B
    jp   SetEntitySpriteVariant                   ;; 18:5924 $C3 $0C $3B

Data_018_5927::
    db   $FF, $04, $FF, $00, $FF, $0C, $FF, $00, $FF, $04, $FF, $00, $FF, $0C, $FF, $00
    db   $FF, $14, $FF, $00, $FC, $04, $70, $01, $FC, $0C, $72, $01, $0C, $04, $74, $01
    db   $0C, $0C, $76, $01, $0C, $14, $78, $01, $0C, $04, $7A, $01, $0C, $0C, $7C, $01
    db   $0C, $14, $7E, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Data_018_5963::
    db   $00, $00, $01, $02, $03, $03, $02, $01

func_018_596B::
    ldh  a, [hFrameCounter]                       ;; 18:596B $F0 $E7
    rra                                           ;; 18:596D $1F
    rra                                           ;; 18:596E $1F
    rra                                           ;; 18:596F $1F
    rra                                           ;; 18:5970 $1F
    nop                                           ;; 18:5971 $00
    nop                                           ;; 18:5972 $00
    and  $07                                      ;; 18:5973 $E6 $07
    ld   e, a                                     ;; 18:5975 $5F
    ld   d, b                                     ;; 18:5976 $50
    ld   hl, Data_018_5963                        ;; 18:5977 $21 $63 $59
    add  hl, de                                   ;; 18:597A $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 18:597B $F0 $EC
    add  [hl]                                     ;; 18:597D $86
    ldh  [hActiveEntityVisualPosY], a             ;; 18:597E $E0 $EC
    ld   hl, wEntitiesPrivateState5Table          ;; 18:5980 $21 $90 $C3
    add  hl, bc                                   ;; 18:5983 $09
    ld   a, [hl]                                  ;; 18:5984 $7E
    and  a                                        ;; 18:5985 $A7
    jr   z, .jr_5995                              ;; 18:5986 $28 $0D

    ldh  a, [hFrameCounter]                       ;; 18:5988 $F0 $E7
    rra                                           ;; 18:598A $1F
    rra                                           ;; 18:598B $1F
    rra                                           ;; 18:598C $1F
    rra                                           ;; 18:598D $1F
    rra                                           ;; 18:598E $1F
    rra                                           ;; 18:598F $1F
    and  $01                                      ;; 18:5990 $E6 $01
    inc  a                                        ;; 18:5992 $3C
    ldh  [hActiveEntitySpriteVariant], a          ;; 18:5993 $E0 $F1

.jr_5995
    ldh  a, [hActiveEntitySpriteVariant]          ;; 18:5995 $F0 $F1
    rla                                           ;; 18:5997 $17
    rla                                           ;; 18:5998 $17
    and  $FC                                      ;; 18:5999 $E6 $FC
    ld   e, a                                     ;; 18:599B $5F
    rla                                           ;; 18:599C $17
    rla                                           ;; 18:599D $17
    and  $F0                                      ;; 18:599E $E6 $F0
    add  e                                        ;; 18:59A0 $83
    ld   e, a                                     ;; 18:59A1 $5F
    ld   d, b                                     ;; 18:59A2 $50
    ld   hl, Data_018_5927                        ;; 18:59A3 $21 $27 $59
    add  hl, de                                   ;; 18:59A6 $19
    ld   c, $05                                   ;; 18:59A7 $0E $05
    jp   RenderActiveEntitySpritesRect            ;; 18:59A9 $C3 $E6 $3C

label_018_59AC:
    ld   a, $00                                   ;; 18:59AC $3E $00

func_018_59AE::
    ld   e, $10                                   ;; 18:59AE $1E $10
    ld   hl, wLinkDirectionHistory                ;; 18:59B0 $21 $B5 $D1

.loop_59B3
    ld   [hl+], a                                 ;; 18:59B3 $22
    dec  e                                        ;; 18:59B4 $1D
    jr   nz, .loop_59B3                           ;; 18:59B5 $20 $FC

    ret                                           ;; 18:59B7 $C9
