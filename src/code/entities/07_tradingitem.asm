Data_007_54C2::
    db   $44, $29, $82, $CB, $64, $C1, $D0, $74, $6A, $36, $5E, $EC, $F5, $9D

Data_007_54D0::
    db   $9A, $16, $9C, $16

Data_007_54D4::
    db   $74, $00, $76, $00

Data_007_54D8::
    db   $9A, $17, $9C, $17, $9A, $17, $9C, $17, $9A, $17, $9C, $17, $9A, $17, $9C, $17
    db   $9A, $14, $9C, $14, $9A, $14, $9C, $14, $9A, $17, $9C, $17, $9A, $14, $9C, $14
    db   $9A, $17, $9C, $17, $9A, $16, $9C, $16, $9A, $17, $9C, $17, $9A, $16, $9C, $16
    db   $9A, $17, $9C, $17, $9A, $17, $9C, $17

TradingItemEntityHandler::
    ld   a, [wIsIndoor]                           ; $5510: $FA $A5 $DB
    and  a                                        ; $5513: $A7
    jr   nz, jr_007_552E                          ; $5514: $20 $18

    ldh  a, [hMapRoom]                            ; $5516: $F0 $F6
    cp   UNKNOWN_ROOM_6B                          ; $5518: $FE $6B
    jr   z, jr_007_5528                           ; $551A: $28 $0C
    cp   MOUNTAIN_CAVE_ROOM_1                     ; $551C: $FE $7A
    jr   z, jr_007_5528                           ; $551E: $28 $08
    cp   UNKNOWN_ROOM_8B                          ; $5520: $FE $8B
    jr   z, jr_007_5528                           ; $5522: $28 $04
    cp   MOUNTAIN_CAVE_ROOM_2                     ; $5524: $FE $7B
    jr   nz, jr_007_552E                          ; $5526: $20 $06

jr_007_5528:
    ld   a, [wOverworldRoomStatus + MOUNTAIN_CAVE_ROOM_2] ; $5528: $FA $7B $D8
    and  $10                                      ; $552B: $E6 $10
    ret  z                                        ; $552D: $C8

jr_007_552E:
    ldh  a, [hRoomStatus]                         ; $552E: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $5530: $E6 $20
    jp   nz, func_007_7EA4                        ; $5532: $C2 $A4 $7E

    ldh  a, [hIsGBC]                              ; $5535: $F0 $FE
    and  a                                        ; $5537: $A7
    jr   z, jr_007_555A                           ; $5538: $28 $20

    ldh  a, [hIsSideScrolling]                    ; $553A: $F0 $F9
    and  a                                        ; $553C: $A7
    jr   z, jr_007_5545                           ; $553D: $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ; $553F: $F0 $EC
    add  $02                                      ; $5541: $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $5543: $E0 $EC

jr_007_5545:
    push hl                                       ; $5545: $E5
    ld   de, Data_007_54D8                        ; $5546: $11 $D8 $54
    ld   a, [wTradeSequenceItem]                  ; $5549: $FA $0E $DB
    dec  a                                        ; $554C: $3D
    sla  a                                        ; $554D: $CB $27
    sla  a                                        ; $554F: $CB $27
    ld   l, a                                     ; $5551: $6F
    ld   h, $00                                   ; $5552: $26 $00
    add  hl, de                                   ; $5554: $19
    ld   e, l                                     ; $5555: $5D
    ld   d, h                                     ; $5556: $54
    pop  hl                                       ; $5557: $E1
    jr   jr_007_5572                              ; $5558: $18 $18

jr_007_555A:
    ld   de, Data_007_54D4                        ; $555A: $11 $D4 $54
    ld   a, [wTradeSequenceItem]                  ; $555D: $FA $0E $DB
    cp   $04                                      ; $5560: $FE $04
    jr   z, jr_007_5572                           ; $5562: $28 $0E

    ldh  a, [hIsSideScrolling]                    ; $5564: $F0 $F9
    and  a                                        ; $5566: $A7
    jr   z, jr_007_556F                           ; $5567: $28 $06

    ldh  a, [hActiveEntityVisualPosY]             ; $5569: $F0 $EC
    add  $02                                      ; $556B: $C6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $556D: $E0 $EC

jr_007_556F:
    ld   de, Data_007_54D0                        ; $556F: $11 $D0 $54

jr_007_5572:
    call RenderActiveEntitySpritesPair            ; $5572: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $5575: $CD $05 $0C
    jr   nz, jr_007_559A                          ; $5578: $20 $20

    call CheckLinkCollisionWithEnemy_trampoline   ; $557A: $CD $5A $3B
    jr   nc, jr_007_5599                          ; $557D: $30 $1A

    ld   a, MUSIC_TOOL_ACQUIRED                   ; $557F: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $5581: $EA $68 $D3
    ld   [wC167], a                               ; $5584: $EA $67 $C1
    ldh  a, [hNextDefaultMusicTrack]              ; $5587: $F0 $BF
    ldh  [hDefaultMusicTrack], a                  ; $5589: $E0 $B0
    call GetEntityTransitionCountdown             ; $558B: $CD $05 $0C
    ld   a, $68                                   ; $558E: $3E $68
    ld   [hl], a                                  ; $5590: $77
    ld   a, $66                                   ; $5591: $3E $66
    ld   [wC111], a                               ; $5593: $EA $11 $C1
    jp   ResetSpinAttack                          ; $5596: $C3 $AF $0C

ret_007_5599:
    ret                                           ; $5599: $C9

jr_007_559A:
    cp   $10                                      ; $559A: $FE $10
    jr   nz, jr_007_55BA                          ; $559C: $20 $1C

    dec  [hl]                                     ; $559E: $35
    ld   a, [wTradeSequenceItem]                  ; $559F: $FA $0E $DB
    ld   e, a                                     ; $55A2: $5F
    ld   d, b                                     ; $55A3: $50
    ld   hl, Data_007_54C2 - 1                    ; $55A4: $21 $C1 $54
    add  hl, de                                   ; $55A7: $19
    ld   a, [hl]                                  ; $55A8: $7E
    cp   $9D                                      ; $55A9: $FE $9D
    jr   z, jr_007_55B1                           ; $55AB: $28 $04

    cp   $44                                      ; $55AD: $FE $44
    jr   nz, jr_007_55B6                          ; $55AF: $20 $05

jr_007_55B1:
    call OpenDialog                               ; $55B1: $CD $85 $23
    jr   jr_007_55B9                              ; $55B4: $18 $03

jr_007_55B6:
    call OpenDialogInTable1                       ; $55B6: $CD $73 $23

jr_007_55B9:
    xor  a                                        ; $55B9: $AF

jr_007_55BA:
    dec  a                                        ; $55BA: $3D
    jr   nz, jr_007_55CD                          ; $55BB: $20 $10

    xor  a                                        ; $55BD: $AF
    ld   [wDB7F], a                               ; $55BE: $EA $7F $DB
    ld   [wC167], a                               ; $55C1: $EA $67 $C1
    call func_007_560D                            ; $55C4: $CD $0D $56
    or   $20                                      ; $55C7: $F6 $20
    ld   [hl], a                                  ; $55C9: $77
    jp   func_007_7EA4                            ; $55CA: $C3 $A4 $7E

jr_007_55CD:
    ldh  a, [hLinkPositionX]                      ; $55CD: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $55CF: $21 $00 $C2
    add  hl, bc                                   ; $55D2: $09
    ld   [hl], a                                  ; $55D3: $77
    ldh  a, [hMapRoom]                            ; $55D4: $F0 $F6
    cp   ROOM_OW_SIREN                            ; $55D6: $FE $C9
    jr   nz, jr_007_55DF                          ; $55D8: $20 $05

    ld   a, $04                                   ; $55DA: $3E $04
    ld   [wC13B], a                               ; $55DC: $EA $3B $C1

jr_007_55DF:
    ld   hl, wC13B                                ; $55DF: $21 $3B $C1
    ldh  a, [hLinkPositionY]                      ; $55E2: $F0 $99
    add  [hl]                                     ; $55E4: $86
    ld   hl, wEntitiesPosYTable                   ; $55E5: $21 $10 $C2
    add  hl, bc                                   ; $55E8: $09
    sub  $10                                      ; $55E9: $D6 $10
    ld   [hl], a                                  ; $55EB: $77
    ldh  a, [hLinkPositionZ]                  ; $55EC: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $55EE: $21 $10 $C3
    add  hl, bc                                   ; $55F1: $09
    ld   [hl], a                                  ; $55F2: $77
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM       ; $55F3: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $55F5: $E0 $9D
    ld   a, $02                                   ; $55F7: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $55F9: $E0 $A1
    ld   a, $03                                   ; $55FB: $3E $03
    ldh  [hLinkDirection], a                      ; $55FD: $E0 $9E
    ; reset sword parameter
    xor  a                                        ; $55FF: $AF
    ld   [wSwordAnimationState], a                ; $5600: $EA $37 $C1
    ld   [wC16A], a                               ; $5603: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $5606: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $5609: $EA $21 $C1
    ret                                           ; $560C: $C9

func_007_560D::
    ld   hl, wOverworldRoomStatus                 ; $560D: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $5610: $F0 $F6
    ld   e, a                                     ; $5612: $5F
    ld   a, [wIsIndoor]                           ; $5613: $FA $A5 $DB
    ld   d, a                                     ; $5616: $57

    ldh  a, [hMapId]                              ; $5617: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $5619: $FE $1A
    jr   nc, .indoorBEnd                          ; $561B: $30 $05
    cp   MAP_INDOORS_B_START                      ; $561D: $FE $06
    jr   c, .indoorBEnd                           ; $561F: $38 $01
    inc  d                                        ; $5621: $14
.indoorBEnd

    add  hl, de                                   ; $5622: $19
    ld   a, [hl]                                  ; $5623: $7E
    ret                                           ; $5624: $C9
