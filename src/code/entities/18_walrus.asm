; Note: this entity, unlike most others, use 3 spriteslots:
; 2 spriteslots when sleeping, and then another one for Marin singing, so 3.
;
; It uses the same trick as the slime boss, so the walrus spriteslots are loaded
; one room before the actual walrus. So Marin's singing sprite can be loaded when
; entering the room with the walrus.
WalrusEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $5501: $21 $B0 $C2
    add  hl, bc                                   ; $5504: $09
    ld   a, [hl]                                  ; $5505: $7E
    and  a                                        ; $5506: $A7
    jp   nz, label_018_54BD                       ; $5507: $C2 $BD $54

    ld   a, [wOverworldRoomStatus + $FD]          ; $550A: $FA $FD $D8
    and  OW_ROOM_STATUS_OWL_TALKED                ; $550D: $E6 $20
    jp   nz, label_018_589A                       ; $550F: $C2 $9A $58

    call func_018_586B                            ; $5512: $CD $6B $58
    call ReturnIfNonInteractive_18                ; $5515: $CD $E8 $7D
    call AddEntityZSpeedToPos_18                  ; $5518: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $551B: $21 $20 $C3
    add  hl, bc                                   ; $551E: $09
    dec  [hl]                                     ; $551F: $35
    ld   hl, wEntitiesPosZTable                   ; $5520: $21 $10 $C3
    add  hl, bc                                   ; $5523: $09
    ld   a, [hl]                                  ; $5524: $7E
    and  $80                                      ; $5525: $E6 $80
    jr   z, .jr_552F                              ; $5527: $28 $06

    ld   [hl], b                                  ; $5529: $70
    ld   hl, wEntitiesSpeedZTable                 ; $552A: $21 $20 $C3
    add  hl, bc                                   ; $552D: $09
    ld   [hl], b                                  ; $552E: $70

.jr_552F
    call PushLinkOutOfEntity_18                   ; $552F: $CD $36 $7D
    ldh  a, [hActiveEntityState]                  ; $5532: $F0 $F0
    JP_TABLE                                      ; $5534
._00 dw WalrusState0Handler                       ; $5535
._01 dw WalrusWakingUpHandler                     ; $5537
._02 dw WalrusState2Handler                       ; $5539
._03 dw WalrusState3Handler                       ; $553B
._04 dw WalrusState4Handler                       ; $553D
._05 dw WalrusState5Handler                       ; $553F
._06 dw WalrusDisappearHandler                    ; $5541
._07 dw WalrusState7Handler                       ; $5543
._08 dw WalrusState8Handler                       ; $5545

WalrusState0Handler::
    ld   hl, wEntitiesInertiaTable                ; $5547: $21 $D0 $C3
    add  hl, bc                                   ; $554A: $09
    inc  [hl]                                     ; $554B: $34
    ld   a, $7F                                   ; $554C: $3E $7F
    and  [hl]                                     ; $554E: $A6
    jr   nz, .jr_557B                             ; $554F: $20 $2A

    ld   a, ENTITY_WALRUS                         ; $5551: $3E $C4
    call SpawnNewEntity_trampoline                ; $5553: $CD $86 $3B
    jr   c, .jr_557B                              ; $5556: $38 $23

    ldh  a, [hMultiPurpose0]                      ; $5558: $F0 $D7
    sub  $08                                      ; $555A: $D6 $08
    ld   hl, wEntitiesPosXTable                   ; $555C: $21 $00 $C2
    add  hl, de                                   ; $555F: $19
    ld   [hl], a                                  ; $5560: $77
    ldh  a, [hMultiPurpose1]                      ; $5561: $F0 $D8
    add  $02                                      ; $5563: $C6 $02
    ld   hl, wEntitiesPosYTable                   ; $5565: $21 $10 $C2
    add  hl, de                                   ; $5568: $19
    ld   [hl], a                                  ; $5569: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $556A: $21 $E0 $C2
    add  hl, de                                   ; $556D: $19
    ld   [hl], $60                                ; $556E: $36 $60
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5570: $21 $40 $C3
    add  hl, de                                   ; $5573: $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $5574: $36 $C1
    ld   hl, wEntitiesPrivateState1Table          ; $5576: $21 $B0 $C2
    add  hl, de                                   ; $5579: $19
    inc  [hl]                                     ; $557A: $34

.jr_557B
    ld   a, [wIsMarinFollowingLink]               ; $557B: $FA $73 $DB
    and  a                                        ; $557E: $A7
    jr   nz, .jr_558A                             ; $557F: $20 $09

    call func_018_7D7C                            ; $5581: $CD $7C $7D
    ret  nc                                       ; $5584: $D0

    jp_open_dialog Dialog1E0                      ; $5585

.jr_558A
    call func_018_7EB2                            ; $558A: $CD $B2 $7E
    add  $13                                      ; $558D: $C6 $13
    cp   $26                                      ; $558F: $FE $26
    ret  nc                                       ; $5591: $D0

    call func_018_7EC2                            ; $5592: $CD $C2 $7E
    add  $20                                      ; $5595: $C6 $20
    cp   $40                                      ; $5597: $FE $40
    ret  nc                                       ; $5599: $D0

    call ResetSpinAttack                          ; $559A: $CD $AF $0C
    call ClearLinkPositionIncrement               ; $559D: $CD $8E $17
    ld   a, [wIsLinkInTheAir]                     ; $55A0: $FA $46 $C1
    and  a                                        ; $55A3: $A7
    ret  nz                                       ; $55A4: $C0

    ld   a, [wMarinEntityIndex]                   ; $55A5: $FA $0F $C5
    ld   e, a                                     ; $55A8: $5F
    ld   d, b                                     ; $55A9: $50
    ld   hl, wEntitiesPosZTable                   ; $55AA: $21 $10 $C3
    add  hl, de                                   ; $55AD: $19
    ld   a, [hl]                                  ; $55AE: $7E
    and  a                                        ; $55AF: $A7
    ret  nz                                       ; $55B0: $C0

    call IncrementEntityState                     ; $55B1: $CD $12 $3B
    call_open_dialog Dialog1E1                    ; $55B4
    jp   label_018_59AC                           ; $55B9: $C3 $AC $59

WalrusWakingUpHandler::
    ld   a, [wDialogState]                        ; $55BC: $FA $9F $C1
    and  a                                        ; $55BF: $A7
    ret  nz                                       ; $55C0: $C0

    call IncrementEntityState                     ; $55C1: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $55C4: $FA $77 $C1
    and  a                                        ; $55C7: $A7
    jr   nz, .jr_55D8                             ; $55C8: $20 $0E

    ld   a, MUSIC_MARIN_SING                      ; $55CA: $3E $2F
    ld   [wMusicTrackToPlay], a                   ; $55CC: $EA $68 $D3
    ld   [wIsMarinSinging], a                     ; $55CF: $EA $C8 $C3
    call GetEntityDropTimer                       ; $55D2: $CD $FB $0B
    ld   [hl], $50                                ; $55D5: $36 $50
    ret                                           ; $55D7: $C9

.jr_55D8
    ld   [hl], $08                                ; $55D8: $36 $08
    jp_open_dialog Dialog1E4                      ; $55DA

WalrusState2Handler::
    ld   a, $01                                   ; $55DF: $3E $01
    ld   [wC167], a                               ; $55E1: $EA $67 $C1
    ld   a, $02                                   ; $55E4: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $55E6: $E0 $A1
    call GetEntityDropTimer                       ; $55E8: $CD $FB $0B
    jr   nz, .jr_55F2                             ; $55EB: $20 $05

    ld   [hl], $C0                                ; $55ED: $36 $C0
    jp   IncrementEntityState                     ; $55EF: $C3 $12 $3B

.jr_55F2
    ld   e, $00                                   ; $55F2: $1E $00
    cp   $40                                      ; $55F4: $FE $40
    jr   nc, jr_018_5612                          ; $55F6: $30 $1A

    ld   e, $02                                   ; $55F8: $1E $02
    cp   $10                                      ; $55FA: $FE $10
    jr   c, jr_018_5612                           ; $55FC: $38 $14

    ld   e, $00                                   ; $55FE: $1E $00
    cp   $3C                                      ; $5600: $FE $3C
    jr   nc, .jr_5610                             ; $5602: $30 $0C

    cp   $20                                      ; $5604: $FE $20
    jr   z, jr_018_5612                           ; $5606: $28 $0A

    cp   $21                                      ; $5608: $FE $21
    jr   z, jr_018_5612                           ; $560A: $28 $06

    cp   $22                                      ; $560C: $FE $22
    jr   z, jr_018_5612                           ; $560E: $28 $02

.jr_5610
    ld   e, $01                                   ; $5610: $1E $01

jr_018_5612:
    ld   a, e                                     ; $5612: $7B
    jp   SetEntitySpriteVariant                   ; $5613: $C3 $0C $3B

Data_018_5616::
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02
    db   $01, $02, $01, $02, $01, $01, $02, $02, $01, $02, $01, $02, $01, $01, $02, $02

WalrusState3Handler::
    ld   a, $01                                   ; $5676: $3E $01
    ld   [wC167], a                               ; $5678: $EA $67 $C1
    ld   a, $02                                   ; $567B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $567D: $E0 $A1
    call GetEntityDropTimer                       ; $567F: $CD $FB $0B
    jr   nz, .jr_5698                             ; $5682: $20 $14

    ld   [wIsMarinSinging], a                     ; $5684: $EA $C8 $C3
    ld   a, NOISE_SFX_RUMBLE                      ; $5687: $3E $11
    ldh  [hNoiseSfx], a                           ; $5689: $E0 $F4
    call GetEntityTransitionCountdown             ; $568B: $CD $05 $0C
    ld   [hl], $08                                ; $568E: $36 $08
    ld   a, $02                                   ; $5690: $3E $02
    call SetEntitySpriteVariant                   ; $5692: $CD $0C $3B
    jp   IncrementEntityState                     ; $5695: $C3 $12 $3B

.jr_5698
    ld   hl, wEntitiesPrivateState3Table          ; $5698: $21 $D0 $C2
    add  hl, bc                                   ; $569B: $09
    ld   e, [hl]                                  ; $569C: $5E
    ld   d, b                                     ; $569D: $50
    ldh  a, [hFrameCounter]                       ; $569E: $F0 $E7
    and  $07                                      ; $56A0: $E6 $07
    jr   nz, .jr_56B8                             ; $56A2: $20 $14

    inc  [hl]                                     ; $56A4: $34
    ld   a, [hl]                                  ; $56A5: $7E
    cp   $60                                      ; $56A6: $FE $60
    jr   nc, .jr_56B8                             ; $56A8: $30 $0E

    and  $0F                                      ; $56AA: $E6 $0F
    jr   nz, .jr_56B8                             ; $56AC: $20 $0A

    ld   hl, wEntitiesSpeedZTable                 ; $56AE: $21 $20 $C3
    add  hl, bc                                   ; $56B1: $09
    ld   [hl], $10                                ; $56B2: $36 $10
    ld   a, JINGLE_JUMP                           ; $56B4: $3E $24
    ldh  [hJingle], a                             ; $56B6: $E0 $F2

.jr_56B8
    ld   hl, Data_018_5616                        ; $56B8: $21 $16 $56
    add  hl, de                                   ; $56BB: $19
    ld   a, [hl]                                  ; $56BC: $7E
    cp   $02                                      ; $56BD: $FE $02
    jr   nz, jr_018_56CE                          ; $56BF: $20 $0D

    ldh  a, [hFrameCounter]                       ; $56C1: $F0 $E7
    and  $3F                                      ; $56C3: $E6 $3F
    jr   nz, .jr_56CC                             ; $56C5: $20 $05

    ld   hl, hJingle                              ; $56C7: $21 $F2 $FF
    ld   [hl], JINGLE_WALRUS                      ; $56CA: $36 $27

.jr_56CC
    ld   a, $02                                   ; $56CC: $3E $02

jr_018_56CE:
    call SetEntitySpriteVariant                   ; $56CE: $CD $0C $3B
    ld   hl, wEntitiesPosZTable                   ; $56D1: $21 $10 $C3
    add  hl, bc                                   ; $56D4: $09
    ld   a, [hl]                                  ; $56D5: $7E
    and  a                                        ; $56D6: $A7
    ret  z                                        ; $56D7: $C8

    ld   e, $01                                   ; $56D8: $1E $01
    ld   hl, wEntitiesSpeedZTable                 ; $56DA: $21 $20 $C3
    add  hl, bc                                   ; $56DD: $09
    ld   a, [hl]                                  ; $56DE: $7E
    sub  $F8                                      ; $56DF: $D6 $F8
    and  $80                                      ; $56E1: $E6 $80
    jr   nz, .jr_56E6                             ; $56E3: $20 $01

    inc  e                                        ; $56E5: $1C

.jr_56E6
    ld   a, e                                     ; $56E6: $7B
    jp   SetEntitySpriteVariant                   ; $56E7: $C3 $0C $3B

WalrusState4Handler::
    ld   a, $02                                   ; $56EA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $56EC: $E0 $A1
    call GetEntityTransitionCountdown             ; $56EE: $CD $05 $0C
    ret  nz                                       ; $56F1: $C0

    ld   [hl], $10                                ; $56F2: $36 $10
    ld   hl, wEntitiesPosYTable                   ; $56F4: $21 $10 $C2
    add  hl, bc                                   ; $56F7: $09
    ld   a, [hl]                                  ; $56F8: $7E
    add  $04                                      ; $56F9: $C6 $04
    ld   [hl], a                                  ; $56FB: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $56FC: $21 $B0 $C3
    add  hl, bc                                   ; $56FF: $09
    ld   a, [hl]                                  ; $5700: $7E
    inc  a                                        ; $5701: $3C
    ld   [hl], a                                  ; $5702: $77
    cp   $04                                      ; $5703: $FE $04
    ret  nz                                       ; $5705: $C0

    ld   hl, wEntitiesPosZTable                   ; $5706: $21 $10 $C3
    add  hl, bc                                   ; $5709: $09
    ld   [hl], $18                                ; $570A: $36 $18
    ld   hl, wEntitiesPosYTable                   ; $570C: $21 $10 $C2
    add  hl, bc                                   ; $570F: $09
    ld   a, [hl]                                  ; $5710: $7E
    add  $18                                      ; $5711: $C6 $18
    ld   [hl], a                                  ; $5713: $77
    ld   a, JINGLE_FALL_DOWN                      ; $5714: $3E $08
    ldh  [hJingle], a                             ; $5716: $E0 $F2
    jp   IncrementEntityState                     ; $5718: $C3 $12 $3B

WalrusState5Handler::
    ld   a, $02                                   ; $571B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $571D: $E0 $A1
    ld   hl, wEntitiesPosZTable                   ; $571F: $21 $10 $C3
    add  hl, bc                                   ; $5722: $09
    ld   a, [hl]                                  ; $5723: $7E
    and  a                                        ; $5724: $A7
    ret  nz                                       ; $5725: $C0

    call IncrementEntityState                     ; $5726: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5729: $CD $05 $0C
    ld   [hl], $08                                ; $572C: $36 $08

; Walrus splash VFX
func_018_572E::
    ld   a, NOISE_SFX_WALRUS_SPLASH               ; $572E: $3E $24
    ldh  [hNoiseSfx], a                           ; $5730: $E0 $F4
    ldh  a, [hActiveEntityPosX]                   ; $5732: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $5734: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5736: $F0 $EC
    add  $10                                      ; $5738: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $573A: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $573C: $3E $01
    call AddTranscientVfx                         ; $573E: $CD $C7 $0C
    ldh  a, [hActiveEntityPosX]                   ; $5741: $F0 $EE
    add  $10                                      ; $5743: $C6 $10
    ldh  [hMultiPurpose0], a                      ; $5745: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $5747: $F0 $EC
    add  $10                                      ; $5749: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $574B: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $574D: $3E $01
    jp   AddTranscientVfx                         ; $574F: $C3 $C7 $0C

; When the walrus disappears and Link looks down and the normal music resumes.
WalrusDisappearHandler::
    call GetEntityTransitionCountdown             ; $5752: $CD $05 $0C
    jr   nz, .jr_5778                             ; $5755: $20 $21

    call IncrementEntityState                     ; $5757: $CD $12 $3B
    ; Resumes the normal music after the walrus has disappeared
    ldh  a, [hDefaultMusicTrack]                  ; $575A: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $575C: $EA $68 $D3
    ld   a, $FF                                   ; $575F: $3E $FF
    call SetEntitySpriteVariant                   ; $5761: $CD $0C $3B
    call_open_dialog Dialog1E2                    ; $5764
    ld   a, $03                                   ; $5769: $3E $03
    call func_018_59AE                            ; $576B: $CD $AE $59
    ld   a, DIRECTION_DOWN                        ; $576E: $3E $03
    ldh  [hLinkDirection], a                      ; $5770: $E0 $9E
    push bc                                       ; $5772: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $5773: $CD $F0 $0B
    pop  bc                                       ; $5776: $C1
    ret                                           ; $5777: $C9

.jr_5778
    ld   a, $05                                   ; $5778: $3E $05
    jp   SetEntitySpriteVariant                   ; $577A: $C3 $0C $3B

WalrusState7Handler::
    ld   a, ENTITY_BUNNY_CALLING_MARIN            ; $577D: $3E $C8
    call SpawnNewEntity_trampoline                ; $577F: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $5782: $21 $00 $C2
    add  hl, de                                   ; $5785: $19
    ld   [hl], $F8                                ; $5786: $36 $F8
    ld   hl, wEntitiesTransitionCountdownTable    ; $5788: $21 $E0 $C2
    add  hl, de                                   ; $578B: $19
    ld   [hl], $20                                ; $578C: $36 $20
    ld   hl, wEntitiesPosYTable                   ; $578E: $21 $10 $C2
    add  hl, de                                   ; $5791: $19
    ld   [hl], $48                                ; $5792: $36 $48
    call ClearEntityStatusBank18                  ; $5794: $CD $08 $7F
    jp   SetRoomStatus20                          ; $5797: $C3 $B9 $7F

WalrusState8Handler::
    ret                                           ; $579A: $C9

Data_018_579B::
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $579B
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57A3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ; $57AB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57B3
    db   $00, $00, $60, $01, $00, $08, $70, $01   ; $57BB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57C3
    db   $10, $00, $68, $01, $10, $08, $6A, $01   ; $57CB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57D3
    db   $00, $00, $72, $01, $00, $08, $74, $01   ; $57DB
    db   $00, $10, $64, $01, $00, $18, $66, $01   ; $57E3
    db   $10, $00, $76, $01, $10, $08, $6A, $01   ; $57EB
    db   $10, $10, $6C, $01, $10, $18, $6E, $01   ; $57F3
    db   $00, $00, $78, $01, $00, $08, $7A, $01   ; $57FB
    db   $00, $10, $7C, $01, $00, $18, $7E, $01   ; $5803
    db   $10, $00, $78, $41, $10, $08, $7A, $41   ; $580B
    db   $10, $10, $7C, $41, $10, $18, $7E, $41   ; $5813
    db   $00, $00, $68, $41, $00, $08, $6A, $41   ; $581B
    db   $00, $10, $6C, $41, $00, $18, $6E, $41   ; $5823
    db   $10, $00, $60, $41, $10, $08, $62, $41   ; $582B
    db   $10, $10, $64, $41, $10, $18, $66, $41   ; $5833
    db   $0E, $00, $68, $41, $0E, $08, $6A, $41   ; $583B
    db   $0E, $10, $6C, $41, $0E, $18, $6E, $41   ; $5843
    db   $10, $00, $FF, $41, $10, $08, $FF, $41   ; $584B
    db   $10, $10, $FF, $41, $10, $18, $FF, $41   ; $5853

Data_018_585B::
    db   $17, $03, $26, $00, $17, $09, $26, $00, $17, $0F, $26, $00, $17, $15, $26, $00

; Render Walrus?
func_018_586B::
    ldh  a, [hActiveEntitySpriteVariant]          ; $586B: $F0 $F1
    rla                                           ; $586D: $17
    rla                                           ; $586E: $17
    rla                                           ; $586F: $17
    rla                                           ; $5870: $17
    rla                                           ; $5871: $17
    and  $E0                                      ; $5872: $E6 $E0
    ld   e, a                                     ; $5874: $5F
    ld   d, b                                     ; $5875: $50
    ld   hl, Data_018_579B                        ; $5876: $21 $9B $57
    add  hl, de                                   ; $5879: $19
    ld   c, $08                                   ; $587A: $0E $08
    call RenderActiveEntitySpritesRect            ; $587C: $CD $E6 $3C
    ld   hl, wEntitiesPosZTable                   ; $587F: $21 $10 $C3
    add  hl, bc                                   ; $5882: $09
    ld   a, [hl]                                  ; $5883: $7E
    and  a                                        ; $5884: $A7
    ret  z                                        ; $5885: $C8

    ldh  a, [hActiveEntityPosY]                   ; $5886: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $5888: $E0 $EC
    ld   hl, Data_018_585B                        ; $588A: $21 $5B $58
    ld   c, $04                                   ; $588D: $0E $04
    call RenderActiveEntitySpritesRect            ; $588F: $CD $E6 $3C
    ld   a, $04                                   ; $5892: $3E $04
    call func_015_7964_trampoline                 ; $5894: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $5897: $C3 $8A $3D

label_018_589A:
    call func_018_596B                            ; $589A: $CD $6B $59
    ld   a, [wRoomTransitionState]                ; $589D: $FA $24 $C1

.jr_58A0
    and  a                                        ; $58A0: $A7
    ret  nz                                       ; $58A1: $C0

    ldh  a, [hActiveEntityState]                  ; $58A2: $F0 $F0
    JP_TABLE                                      ; $58A4
._00 dw func_018_58AD                             ; $58A5
._01 dw func_018_58C1                             ; $58A7
._02 dw func_018_58DD                             ; $58A9
._03 dw func_018_58F1                             ; $58AB

func_018_58AD::
    ld   hl, wEntitiesPosYTable                   ; $58AD: $21 $10 $C2
    add  hl, bc                                   ; $58B0: $09
    ld   [hl], $68                                ; $58B1: $36 $68
    ld   hl, wEntitiesPosXTable                   ; $58B3: $21 $00 $C2
    add  hl, bc                                   ; $58B6: $09
    ld   [hl], $80                                ; $58B7: $36 $80
    call GetEntityTransitionCountdown             ; $58B9: $CD $05 $0C
    ld   [hl], $20                                ; $58BC: $36 $20
    jp   IncrementEntityState                     ; $58BE: $C3 $12 $3B

func_018_58C1::
    call GetEntityTransitionCountdown             ; $58C1: $CD $05 $0C
    ret  nz                                       ; $58C4: $C0

    ld   a, [wSelectedSongIndex]                  ; $58C5: $FA $4A $DB
    cp   $00                                      ; $58C8: $FE $00
    ret  nz                                       ; $58CA: $C0

    ld   a, [wLinkPlayingOcarinaCountdown]        ; $58CB: $FA $66 $C1
    and  a                                        ; $58CE: $A7
    cp   $40                                      ; $58CF: $FE $40
    ret  nz                                       ; $58D1: $C0

    call IncrementEntityState                     ; $58D2: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $58D5: $CD $05 $0C
    ld   [hl], $20                                ; $58D8: $36 $20
    jp   func_018_572E                            ; $58DA: $C3 $2E $57

func_018_58DD::
    call GetEntityTransitionCountdown             ; $58DD: $CD $05 $0C
    jr   nz, .jr_58E7                             ; $58E0: $20 $05

    ld   [hl], $C8                                ; $58E2: $36 $C8
    jp   IncrementEntityState                     ; $58E4: $C3 $12 $3B

.jr_58E7
    cp   $10                                      ; $58E7: $FE $10
    ld   a, $01                                   ; $58E9: $3E $01
    jr   c, .jr_58EE                              ; $58EB: $38 $01

    inc  a                                        ; $58ED: $3C

.jr_58EE
    jp   SetEntitySpriteVariant                   ; $58EE: $C3 $0C $3B

func_018_58F1::
    call GetEntityTransitionCountdown             ; $58F1: $CD $05 $0C
    jr   nz, .jr_58FC                             ; $58F4: $20 $06

    call func_018_572E                            ; $58F6: $CD $2E $57
    jp   ClearEntityStatusBank18                  ; $58F9: $C3 $08 $7F

.jr_58FC
    cp   $B0                                      ; $58FC: $FE $B0
    jr   nz, .jr_5900                             ; $58FE: $20 $00

.jr_5900
    call GetEntityTransitionCountdown             ; $5900: $CD $05 $0C
    cp   $80                                      ; $5903: $FE $80
    jr   nz, .jr_590D                             ; $5905: $20 $06

    dec  [hl]                                     ; $5907: $35
    call_open_dialog Dialog1E6                    ; $5908

.jr_590D
    call GetEntityTransitionCountdown             ; $590D: $CD $05 $0C
    ld   d, $00                                   ; $5910: $16 $00
    cp   $10                                      ; $5912: $FE $10
    ld   e, $02                                   ; $5914: $1E $02
    jr   c, .jr_591E                              ; $5916: $38 $06

    dec  e                                        ; $5918: $1D
    cp   $20                                      ; $5919: $FE $20
    jr   c, .jr_591E                              ; $591B: $38 $01

    inc  d                                        ; $591D: $14

.jr_591E
    ld   hl, wEntitiesPrivateState5Table          ; $591E: $21 $90 $C3
    add  hl, bc                                   ; $5921: $09
    ld   [hl], d                                  ; $5922: $72
    ld   a, e                                     ; $5923: $7B
    jp   SetEntitySpriteVariant                   ; $5924: $C3 $0C $3B

Data_018_5927::
    db   $FF, $04, $FF, $00, $FF, $0C, $FF, $00, $FF, $04, $FF, $00, $FF, $0C, $FF, $00
    db   $FF, $14, $FF, $00, $FC, $04, $70, $01, $FC, $0C, $72, $01, $0C, $04, $74, $01
    db   $0C, $0C, $76, $01, $0C, $14, $78, $01, $0C, $04, $7A, $01, $0C, $0C, $7C, $01
    db   $0C, $14, $7E, $01, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

Data_018_5963::
    db   $00, $00, $01, $02, $03, $03, $02, $01

func_018_596B::
    ldh  a, [hFrameCounter]                       ; $596B: $F0 $E7
    rra                                           ; $596D: $1F
    rra                                           ; $596E: $1F
    rra                                           ; $596F: $1F
    rra                                           ; $5970: $1F
    nop                                           ; $5971: $00
    nop                                           ; $5972: $00
    and  $07                                      ; $5973: $E6 $07
    ld   e, a                                     ; $5975: $5F
    ld   d, b                                     ; $5976: $50
    ld   hl, Data_018_5963                        ; $5977: $21 $63 $59
    add  hl, de                                   ; $597A: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $597B: $F0 $EC
    add  [hl]                                     ; $597D: $86
    ldh  [hActiveEntityVisualPosY], a             ; $597E: $E0 $EC
    ld   hl, wEntitiesPrivateState5Table          ; $5980: $21 $90 $C3
    add  hl, bc                                   ; $5983: $09
    ld   a, [hl]                                  ; $5984: $7E
    and  a                                        ; $5985: $A7
    jr   z, .jr_5995                              ; $5986: $28 $0D

    ldh  a, [hFrameCounter]                       ; $5988: $F0 $E7
    rra                                           ; $598A: $1F
    rra                                           ; $598B: $1F
    rra                                           ; $598C: $1F
    rra                                           ; $598D: $1F
    rra                                           ; $598E: $1F
    rra                                           ; $598F: $1F
    and  $01                                      ; $5990: $E6 $01
    inc  a                                        ; $5992: $3C
    ldh  [hActiveEntitySpriteVariant], a          ; $5993: $E0 $F1

.jr_5995
    ldh  a, [hActiveEntitySpriteVariant]          ; $5995: $F0 $F1
    rla                                           ; $5997: $17
    rla                                           ; $5998: $17
    and  $FC                                      ; $5999: $E6 $FC
    ld   e, a                                     ; $599B: $5F
    rla                                           ; $599C: $17
    rla                                           ; $599D: $17
    and  $F0                                      ; $599E: $E6 $F0
    add  e                                        ; $59A0: $83
    ld   e, a                                     ; $59A1: $5F
    ld   d, b                                     ; $59A2: $50
    ld   hl, Data_018_5927                        ; $59A3: $21 $27 $59
    add  hl, de                                   ; $59A6: $19
    ld   c, $05                                   ; $59A7: $0E $05
    jp   RenderActiveEntitySpritesRect            ; $59A9: $C3 $E6 $3C

label_018_59AC:
    ld   a, $00                                   ; $59AC: $3E $00

func_018_59AE::
    ld   e, $10                                   ; $59AE: $1E $10
    ld   hl, wLinkDirectionHistory                ; $59B0: $21 $B5 $D1

.loop_59B3
    ld   [hl+], a                                 ; $59B3: $22
    dec  e                                        ; $59B4: $1D
    jr   nz, .loop_59B3                           ; $59B5: $20 $FC

    ret                                           ; $59B7: $C9
