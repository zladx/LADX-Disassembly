Data_018_64CA::
    db   $EC, $14

BlainoEntityHandler::
    call func_018_68EA                            ; $64CC: $CD $EA $68
    ldh  a, [hActiveEntityStatus]                 ; $64CF: $F0 $EA
    cp   $01                                      ; $64D1: $FE $01
    jp   z, AnimateBossAgony_18                   ; $64D3: $CA $0F $7F

    call ReturnIfNonInteractive_18                ; $64D6: $CD $E8 $7D
    call BossIntro                                ; $64D9: $CD $E8 $3E
    ld   hl, wEntitiesPrivateState1Table          ; $64DC: $21 $B0 $C2
    add  hl, bc                                   ; $64DF: $09
    ld   a, [hl]                                  ; $64E0: $7E
    and  a                                        ; $64E1: $A7
    jr   nz, .jr_64EA                             ; $64E2: $20 $06

    inc  [hl]                                     ; $64E4: $34
    call GetEntityDropTimer                       ; $64E5: $CD $FB $0B
    ld   [hl], $20                                ; $64E8: $36 $20

.jr_64EA
    call GetEntityPrivateCountdown1               ; $64EA: $CD $00 $0C
    jr   z, jr_018_650A                           ; $64ED: $28 $1B

    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $64EF: $FA $3E $C1
    and  a                                        ; $64F2: $A7
    cp   $01                                      ; $64F3: $FE $01
    jr   nz, .jr_64FC                             ; $64F5: $20 $05

    ld   hl, hJingle                              ; $64F7: $21 $F2 $FF
    ld   [hl], JINGLE_LINK_DAZED                  ; $64FA: $36 $33

.jr_64FC
    and  a                                        ; $64FC: $A7
    jr   nz, jr_018_650A                          ; $64FD: $20 $0B

    ld   a, $02                                   ; $64FF: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6501: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6A       ; $6503: $3E $6A
    ldh  [hLinkAnimationState], a                 ; $6505: $E0 $9D
    call func_018_69C5                            ; $6507: $CD $C5 $69

jr_018_650A:
    call ApplyRecoilIfNeeded_18                   ; $650A: $CD $15 $7E
    call label_3B65                               ; $650D: $CD $65 $3B
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $6510: $FA $3E $C1
    and  a                                        ; $6513: $A7
    jr   nz, .jr_6519                             ; $6514: $20 $03

    call DefaultEnemyDamageCollisionHandler_trampoline ; $6516: $CD $39 $3B

.jr_6519
    call UpdateEntityPosWithVelocity_18           ; $6519: $CD $5F $7E
    call DefaultEntityPhysics_trampoline          ; $651C: $CD $23 $3B
    call AddEntityZVelocityToPos_18               ; $651F: $CD $98 $7E
    ld   hl, wEntitiesVelocityZTable              ; $6522: $21 $20 $C3
    add  hl, bc                                   ; $6525: $09
    dec  [hl]                                     ; $6526: $35
    dec  [hl]                                     ; $6527: $35
    dec  [hl]                                     ; $6528: $35
    ld   hl, wEntitiesPosZTable                   ; $6529: $21 $10 $C3
    add  hl, bc                                   ; $652C: $09
    ld   a, [hl]                                  ; $652D: $7E
    and  $80                                      ; $652E: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6530: $E0 $E8
    and  a                                        ; $6532: $A7
    jr   z, .jr_653E                              ; $6533: $28 $09

    ld   [hl], b                                  ; $6535: $70
    ld   hl, wEntitiesVelocityZTable              ; $6536: $21 $20 $C3
    add  hl, bc                                   ; $6539: $09
    ld   [hl], b                                  ; $653A: $70
    call ClearEntityVelocity                      ; $653B: $CD $7F $3D

.jr_653E
    call func_018_65CF                            ; $653E: $CD $CF $65
    call func_018_7EB2                            ; $6541: $CD $B2 $7E
    ld   hl, wEntitiesDirectionTable              ; $6544: $21 $80 $C3
    add  hl, bc                                   ; $6547: $09
    ld   [hl], e                                  ; $6548: $73
    call func_018_7EC2                            ; $6549: $CD $C2 $7E
    cp   $00                                      ; $654C: $FE $00
    jr   z, .jr_655B                              ; $654E: $28 $0B

    ld   d, b                                     ; $6550: $50
    ld   hl, Data_018_64CA - 2                    ; $6551: $21 $C8 $64
    add  hl, de                                   ; $6554: $19
    ld   a, [hl]                                  ; $6555: $7E
    ld   hl, wEntitiesVelocityYTable              ; $6556: $21 $50 $C2
    add  hl, bc                                   ; $6559: $09
    ld   [hl], a                                  ; $655A: $77

.jr_655B
    ldh  a, [hMultiPurposeG]                      ; $655B: $F0 $E8
    and  a                                        ; $655D: $A7
    jr   z, .jr_6588                              ; $655E: $28 $28

    ld   hl, wEntitiesVelocityZTable              ; $6560: $21 $20 $C3
    add  hl, bc                                   ; $6563: $09
    ld   [hl], $10                                ; $6564: $36 $10
    call GetRandomByte                            ; $6566: $CD $0D $28
    and  $0F                                      ; $6569: $E6 $0F
    sub  $08                                      ; $656B: $D6 $08
    ld   hl, wEntitiesVelocityXTable              ; $656D: $21 $40 $C2
    add  hl, bc                                   ; $6570: $09
    ld   [hl], a                                  ; $6571: $77
    call func_018_7EB2                            ; $6572: $CD $B2 $7E
    add  $28                                      ; $6575: $C6 $28
    cp   $50                                      ; $6577: $FE $50
    jr   c, .jr_6588                              ; $6579: $38 $0D

    ld   a, $08                                   ; $657B: $3E $08
    call GetVectorTowardsLink_trampoline          ; $657D: $CD $B5 $3B
    ldh  a, [hMultiPurpose1]                      ; $6580: $F0 $D8
    ld   hl, wEntitiesVelocityXTable              ; $6582: $21 $40 $C2
    add  hl, bc                                   ; $6585: $09
    add  [hl]                                     ; $6586: $86
    ld   [hl], a                                  ; $6587: $77

.jr_6588
    call func_018_6596                            ; $6588: $CD $96 $65
    ldh  a, [hFrameCounter]                       ; $658B: $F0 $E7
    rra                                           ; $658D: $1F
    rra                                           ; $658E: $1F
    rra                                           ; $658F: $1F
    rra                                           ; $6590: $1F
    and  $01                                      ; $6591: $E6 $01
    jp   SetEntitySpriteVariant                   ; $6593: $C3 $0C $3B

func_018_6596::
    call GetEntityPrivateCountdown1               ; $6596: $CD $00 $0C
    jr   z, .jr_659F                              ; $6599: $28 $04

    ld   a, $03                                   ; $659B: $3E $03
    jr   label_018_65B8                           ; $659D: $18 $19

.jr_659F
    call GetEntityDropTimer                       ; $659F: $CD $FB $0B
    jr   nz, ret_018_65CE                         ; $65A2: $20 $2A

    ld   hl, wEntitiesPrivateState1Table          ; $65A4: $21 $B0 $C2
    add  hl, bc                                   ; $65A7: $09
    ld   a, [hl]                                  ; $65A8: $7E
    cp   $05                                      ; $65A9: $FE $05
    jr   nc, .jr_65B2                             ; $65AB: $30 $05

    inc  [hl]                                     ; $65AD: $34
    ld   a, $01                                   ; $65AE: $3E $01
    jr   label_018_65B8                           ; $65B0: $18 $06

.jr_65B2
    call GetRandomByte                            ; $65B2: $CD $0D $28
    and  $03                                      ; $65B5: $E6 $03
    inc  a                                        ; $65B7: $3C

label_018_65B8:
    ld   [wD205], a                               ; $65B8: $EA $05 $D2
    cp   $01                                      ; $65BB: $FE $01
    jr   nz, .jr_65C3                             ; $65BD: $20 $04

    ld   a, NOISE_SFX_WHOOSH                      ; $65BF: $3E $0A
    ldh  [hNoiseSfx], a                           ; $65C1: $E0 $F4

.jr_65C3
    call GetEntityTransitionCountdown             ; $65C3: $CD $05 $0C
    ld   [hl], $00                                ; $65C6: $36 $00
    ld   hl, wEntitiesInertiaTable                ; $65C8: $21 $D0 $C3
    add  hl, bc                                   ; $65CB: $09
    ld   [hl], $00                                ; $65CC: $36 $00

ret_018_65CE:
    ret                                           ; $65CE: $C9

func_018_65CF::
    ld   a, [wD205]                               ; $65CF: $FA $05 $D2
    and  a                                        ; $65D2: $A7
    ret  z                                        ; $65D3: $C8

    pop  de                                       ; $65D4: $D1
    dec  a                                        ; $65D5: $3D
    JP_TABLE                                      ; $65D6
._00 dw func_018_65EC                             ; $65D7
._01 dw func_018_6643                             ; $65D9
._02 dw func_018_66CD                             ; $65DB
._03 dw func_018_65EC                             ; $65DD

Data_018_65DF::
    db   $01, $01, $01, $02, $02, $03, $03, $03, $03, $03, $02, $02, $01

func_018_65EC::
    call GetEntityTransitionCountdown             ; $65EC: $CD $05 $0C
    jr   nz, .ret_660B                            ; $65EF: $20 $1A

    ld   hl, wEntitiesInertiaTable                ; $65F1: $21 $D0 $C3
    add  hl, bc                                   ; $65F4: $09
    ld   a, [hl]                                  ; $65F5: $7E
    cp   $0D                                      ; $65F6: $FE $0D
    jp   z, label_018_660C                        ; $65F8: $CA $0C $66

    inc  [hl]                                     ; $65FB: $34
    ld   e, a                                     ; $65FC: $5F
    ld   d, b                                     ; $65FD: $50
    ld   hl, Data_018_65DF                        ; $65FE: $21 $DF $65
    add  hl, de                                   ; $6601: $19
    ld   a, [hl]                                  ; $6602: $7E
    call SetEntitySpriteVariant                   ; $6603: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6606: $CD $05 $0C
    ld   [hl], $01                                ; $6609: $36 $01

.ret_660B
    ret                                           ; $660B: $C9

label_018_660C:
    call GetRandomByte                            ; $660C: $CD $0D $28
    and  $03                                      ; $660F: $E6 $03
    jp   z, label_018_672A                        ; $6611: $CA $2A $67

    ld   a, $01                                   ; $6614: $3E $01
    jp   label_018_65B8                           ; $6616: $C3 $B8 $65

Data_018_6619::
    db   $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $06, $07, $08, $08, $08
    db   $08, $08, $07, $06, $01

Data_018_662E::
    db   $08, $10, $08, $08, $02, $00, $00, $00, $FC, $F8, $F0, $F8, $E0, $90, $A0, $00
    db   $00, $00, $00, $00, $00

func_018_6643::
    call GetEntityTransitionCountdown             ; $6643: $CD $05 $0C
    jr   nz, ret_018_6678                         ; $6646: $20 $30

    ld   hl, wEntitiesInertiaTable                ; $6648: $21 $D0 $C3
    add  hl, bc                                   ; $664B: $09
    ld   a, [hl]                                  ; $664C: $7E
    cp   $15                                      ; $664D: $FE $15
    jp   z, label_018_672A                        ; $664F: $CA $2A $67

    inc  [hl]                                     ; $6652: $34
    ld   e, a                                     ; $6653: $5F
    ld   d, b                                     ; $6654: $50
    ld   hl, Data_018_6619                        ; $6655: $21 $19 $66
    add  hl, de                                   ; $6658: $19
    ld   a, [hl]                                  ; $6659: $7E
    call SetEntitySpriteVariant                   ; $665A: $CD $0C $3B
    ld   hl, Data_018_662E                        ; $665D: $21 $2E $66
    add  hl, de                                   ; $6660: $19
    ld   e, [hl]                                  ; $6661: $5E
    ld   hl, wEntitiesDirectionTable              ; $6662: $21 $80 $C3
    add  hl, bc                                   ; $6665: $09
    ld   a, [hl]                                  ; $6666: $7E
    and  a                                        ; $6667: $A7
    jr   nz, .jr_666E                             ; $6668: $20 $04

    ld   a, e                                     ; $666A: $7B
    cpl                                           ; $666B: $2F
    inc  a                                        ; $666C: $3C
    ld   e, a                                     ; $666D: $5F

.jr_666E
    ld   hl, wEntitiesVelocityXTable              ; $666E: $21 $40 $C2
    add  hl, bc                                   ; $6671: $09
    ld   [hl], e                                  ; $6672: $73
    call GetEntityTransitionCountdown             ; $6673: $CD $05 $0C
    ld   [hl], $03                                ; $6676: $36 $03

ret_018_6678:
    ret                                           ; $6678: $C9

Data_018_6679::
    db   $09, $09, $0A, $0A, $0B, $0B, $0C, $0C, $09, $09, $0A, $0A, $0B, $0B, $0C, $0C
    db   $09, $09, $0A, $0A, $0B, $0B, $0C, $0C, $09, $09, $09, $09, $09, $09, $09, $09
    db   $09, $09, $0D, $0E, $0F, $10, $11, $11, $11, $01

Data_018_66A3::
    db   $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $08, $08, $08, $08, $08, $08, $08, $08
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $F0, $E0, $D0, $C0, $C0, $E0, $F0, $00, $00, $00

func_018_66CD::
    call GetEntityTransitionCountdown             ; $66CD: $CD $05 $0C
    jr   nz, ret_018_6729                         ; $66D0: $20 $57

    ld   hl, wEntitiesInertiaTable                ; $66D2: $21 $D0 $C3
    add  hl, bc                                   ; $66D5: $09
    ld   a, [hl]                                  ; $66D6: $7E
    cp   $2A                                      ; $66D7: $FE $2A
    jp   z, label_018_672A                        ; $66D9: $CA $2A $67

    ld   e, a                                     ; $66DC: $5F
    cp   $28                                      ; $66DD: $FE $28
    jr   nz, .jr_66E8                             ; $66DF: $20 $07

    ld   a, [wLinkMotionState]                    ; $66E1: $FA $1C $C1
    cp   LINK_MOTION_UNKNOWN_0A                   ; $66E4: $FE $0A
    jr   z, jr_018_66E9                           ; $66E6: $28 $01

.jr_66E8
    inc  [hl]                                     ; $66E8: $34

jr_018_66E9:
    ld   d, b                                     ; $66E9: $50
    ld   hl, Data_018_6679                        ; $66EA: $21 $79 $66
    add  hl, de                                   ; $66ED: $19
    ld   a, [hl]                                  ; $66EE: $7E
    call SetEntitySpriteVariant                   ; $66EF: $CD $0C $3B
    ld   hl, Data_018_66A3                        ; $66F2: $21 $A3 $66
    add  hl, de                                   ; $66F5: $19
    ld   e, [hl]                                  ; $66F6: $5E
    ld   hl, wEntitiesDirectionTable              ; $66F7: $21 $80 $C3
    add  hl, bc                                   ; $66FA: $09
    ld   a, [hl]                                  ; $66FB: $7E
    and  a                                        ; $66FC: $A7
    jr   nz, .jr_6703                             ; $66FD: $20 $04

    ld   a, e                                     ; $66FF: $7B
    cpl                                           ; $6700: $2F
    inc  a                                        ; $6701: $3C
    ld   e, a                                     ; $6702: $5F

.jr_6703
    ld   hl, wEntitiesVelocityXTable              ; $6703: $21 $40 $C2
    add  hl, bc                                   ; $6706: $09
    ld   [hl], e                                  ; $6707: $73
    call GetEntityPrivateCountdown1               ; $6708: $CD $00 $0C
    jr   z, .jr_6724                              ; $670B: $28 $17

    call func_018_7EB2                            ; $670D: $CD $B2 $7E
    add  $30                                      ; $6710: $C6 $30
    cp   $60                                      ; $6712: $FE $60
    jr   c, .jr_6724                              ; $6714: $38 $0E

    ld   hl, wEntitiesInertiaTable                ; $6716: $21 $D0 $C3
    add  hl, bc                                   ; $6719: $09
    ld   a, [hl]                                  ; $671A: $7E
    cp   $18                                      ; $671B: $FE $18
    jr   nc, .jr_6724                             ; $671D: $30 $05

    ld   a, $10                                   ; $671F: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $6721: $CD $AA $3B

.jr_6724
    call GetEntityTransitionCountdown             ; $6724: $CD $05 $0C
    ld   [hl], $03                                ; $6727: $36 $03

ret_018_6729:
    ret                                           ; $6729: $C9

label_018_672A:
    xor  a                                        ; $672A: $AF
    ld   [wD205], a                               ; $672B: $EA $05 $D2
    call GetEntityDropTimer                       ; $672E: $CD $FB $0B
    call GetRandomByte                            ; $6731: $CD $0D $28
    and  $0F                                      ; $6734: $E6 $0F
    add  $0C                                      ; $6736: $C6 $0C
    ld   [hl], a                                  ; $6738: $77
    ret                                           ; $6739: $C9

Data_018_673A::
    db   $00, $F8, $6C, $03, $00, $00, $6E, $03   ; $673A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6742
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $674A
    db   $FF, $F8, $6C, $03, $FF, $00, $6E, $03   ; $6752
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $675A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6762
    db   $00, $F8, $6E, $23, $00, $00, $6C, $23   ; $676A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6772
    db   $FD, $F8, $6C, $03, $FD, $00, $6E, $03   ; $677A
    db   $FD, $F0, $6C, $03, $FD, $F8, $6E, $03   ; $6782
    db   $00, $F8, $6E, $23, $00, $00, $6C, $23   ; $678A
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6792
    db   $00, $00, $6E, $23, $00, $08, $6C, $23   ; $679A
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $67A2
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $67AA
    db   $FD, $08, $6E, $23, $FD, $10, $6C, $23   ; $67B2
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $67BA
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $67C2
    db   $00, $F8, $6C, $03, $00, $00, $6E, $03   ; $67CA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $67D2
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $67DA
    db   $00, $F0, $6C, $03, $00, $F8, $6E, $03   ; $67E2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $67EA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $67F2
    db   $00, $E8, $6C, $03, $00, $F0, $6E, $03   ; $67FA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $6802
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $680A
    db   $F8, $10, $6C, $03, $F8, $18, $6E, $03   ; $6812
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $681A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6822
    db   $F0, $08, $6C, $03, $F0, $10, $6E, $03   ; $682A
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $6832
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $683A
    db   $FC, $08, $6E, $23, $FC, $10, $6C, $23   ; $6842
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $684A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6852
    db   $00, $10, $6E, $23, $00, $18, $6C, $23   ; $685A
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $6862
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $686A
    db   $04, $08, $6E, $23, $04, $10, $6C, $23   ; $6872
    db   $00, $00, $68, $01, $00, $08, $6A, $01   ; $687A
    db   $FD, $F8, $6E, $23, $FD, $00, $6C, $23   ; $6882
    db   $08, $00, $6C, $03, $08, $08, $6E, $03   ; $688A
    db   $00, $00, $64, $01, $00, $08, $66, $01   ; $6892
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $689A
    db   $08, $F8, $6C, $03, $08, $00, $6E, $03   ; $68A2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68AA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68B2
    db   $05, $F0, $6C, $03, $05, $F8, $6E, $03   ; $68BA
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68C2
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68CA
    db   $F4, $F0, $6E, $23, $F4, $F8, $6C, $23   ; $68D2
    db   $00, $00, $60, $01, $00, $08, $62, $01   ; $68DA
    db   $00, $00, $FF, $00, $00, $00, $FF, $00   ; $68E2

func_018_68EA::
    ld   a, $80                                   ; $68EA: $3E $80
    ld   [wD5C0], a                               ; $68EC: $EA $C0 $D5
    ld   [wD5C2], a                               ; $68EF: $EA $C2 $D5
    ldh  a, [hActiveEntitySpriteVariant]          ; $68F2: $F0 $F1
    sla  a                                        ; $68F4: $CB $27
    sla  a                                        ; $68F6: $CB $27
    ld   d, b                                     ; $68F8: $50
    sla  a                                        ; $68F9: $CB $27
    ld   e, a                                     ; $68FB: $5F
    rl   d                                        ; $68FC: $CB $12
    sla  a                                        ; $68FE: $CB $27
    rl   d                                        ; $6900: $CB $12
    add  e                                        ; $6902: $83
    ld   e, a                                     ; $6903: $5F
    ld   a, d                                     ; $6904: $7A
    adc  $00                                      ; $6905: $CE $00
    ld   d, a                                     ; $6907: $57
    xor  a                                        ; $6908: $AF
    ldh  [hMultiPurposeG], a                      ; $6909: $E0 $E8
    ld   hl, wEntitiesDirectionTable              ; $690B: $21 $80 $C3
    add  hl, bc                                   ; $690E: $09
    ld   a, [hl]                                  ; $690F: $7E
    and  a                                        ; $6910: $A7
    jr   nz, .jr_691B                             ; $6911: $20 $08

    inc  a                                        ; $6913: $3C
    ldh  [hMultiPurposeG], a                      ; $6914: $E0 $E8
    ld   hl, hActiveEntityFlipAttribute           ; $6916: $21 $ED $FF
    set  OAMB_XFLIP, [hl]                         ; $6919: $CB $EE

.jr_691B
    ld   hl, Data_018_673A                        ; $691B: $21 $3A $67
    add  hl, de                                   ; $691E: $19
    ld   c, $06                                   ; $691F: $0E $06
    push hl                                       ; $6921: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $6922: $FA $C0 $C3
    ld   e, a                                     ; $6925: $5F
    ld   d, $00                                   ; $6926: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $6928: $21 $30 $C0
    add  hl, de                                   ; $692B: $19
    ld   e, l                                     ; $692C: $5D
    ld   d, h                                     ; $692D: $54
    pop  hl                                       ; $692E: $E1
    ld   a, c                                     ; $692F: $79
    ldh  [hMultiPurpose0], a                      ; $6930: $E0 $D7
    ld   a, [wActiveEntityIndex]                  ; $6932: $FA $23 $C1
    ld   c, a                                     ; $6935: $4F
    call SkipDisabledEntityDuringRoomTransition   ; $6936: $CD $57 $3D
    ldh  a, [hMultiPurpose0]                      ; $6939: $F0 $D7
    ld   c, a                                     ; $693B: $4F

jr_018_693C:
    ld   a, [wD5C2]                               ; $693C: $FA $C2 $D5
    cp   $80                                      ; $693F: $FE $80
    jr   nz, .jr_6949                             ; $6941: $20 $06

    ld   a, [hl]                                  ; $6943: $7E
    add  $08                                      ; $6944: $C6 $08
    ld   [wD5C2], a                               ; $6946: $EA $C2 $D5

.jr_6949
    ldh  a, [hActiveEntityVisualPosY]             ; $6949: $F0 $EC
    add  [hl]                                     ; $694B: $86
    ld   [de], a                                  ; $694C: $12
    inc  hl                                       ; $694D: $23
    inc  de                                       ; $694E: $13
    push bc                                       ; $694F: $C5
    ld   a, [wScreenShakeHorizontal]              ; $6950: $FA $55 $C1
    ld   c, a                                     ; $6953: $4F
    ld   b, [hl]                                  ; $6954: $46
    ldh  a, [hMultiPurposeG]                      ; $6955: $F0 $E8
    and  a                                        ; $6957: $A7
    jr   z, .jr_6960                              ; $6958: $28 $06

    ld   a, b                                     ; $695A: $78
    cpl                                           ; $695B: $2F
    inc  a                                        ; $695C: $3C
    add  $08                                      ; $695D: $C6 $08
    ld   b, a                                     ; $695F: $47

.jr_6960
    ld   a, [wD5C0]                               ; $6960: $FA $C0 $D5
    cp   $80                                      ; $6963: $FE $80
    jr   nz, jr_018_6972                          ; $6965: $20 $0B

    ldh  a, [hMultiPurposeG]                      ; $6967: $F0 $E8
    and  a                                        ; $6969: $A7
    ld   a, b                                     ; $696A: $78
    jr   nz, .jr_696F                             ; $696B: $20 $02

    add  $08                                      ; $696D: $C6 $08

.jr_696F
    ld   [wD5C0], a                               ; $696F: $EA $C0 $D5

jr_018_6972:
    ldh  a, [hActiveEntityPosX]                   ; $6972: $F0 $EE
    add  b                                        ; $6974: $80
    sub  c                                        ; $6975: $91
    ld   [de], a                                  ; $6976: $12
    inc  hl                                       ; $6977: $23
    inc  de                                       ; $6978: $13
    pop  bc                                       ; $6979: $C1
    ld   a, [hl+]                                 ; $697A: $2A
    ld   [de], a                                  ; $697B: $12
    cp   $FF                                      ; $697C: $FE $FF
    jr   nz, .jr_6984                             ; $697E: $20 $04

    dec  de                                       ; $6980: $1B
    xor  a                                        ; $6981: $AF
    ld   [de], a                                  ; $6982: $12
    inc  de                                       ; $6983: $13

.jr_6984
    inc  de                                       ; $6984: $13
    ldh  a, [hActiveEntityFlipAttribute]          ; $6985: $F0 $ED
    xor  [hl]                                     ; $6987: $AE
    ld   [de], a                                  ; $6988: $12
    ldh  a, [hIsGBC]                              ; $6989: $F0 $FE
    and  a                                        ; $698B: $A7
    jr   z, .jr_699A                              ; $698C: $28 $0C

    ldh  a, [hActiveEntityFlipAttribute]          ; $698E: $F0 $ED
    bit  OAMB_PAL1, a                             ; $6990: $CB $67
    jr   z, .jr_699A                              ; $6992: $28 $06

    ld   a, [de]                                  ; $6994: $1A
    and  $F8                                      ; $6995: $E6 $F8
    or   $04                                      ; $6997: $F6 $04
    ld   [de], a                                  ; $6999: $12

.jr_699A
    inc  hl                                       ; $699A: $23
    inc  de                                       ; $699B: $13
    dec  c                                        ; $699C: $0D
    jr   nz, jr_018_693C                          ; $699D: $20 $9D

    ld   a, $08                                   ; $699F: $3E $08
    ld   [wD5C0+1], a                             ; $69A1: $EA $C1 $D5
    ld   a, $04                                   ; $69A4: $3E $04
    ld   [wD5C2+1], a                             ; $69A6: $EA $C3 $D5
    ld   a, [wActiveEntityIndex]                  ; $69A9: $FA $23 $C1
    ld   c, a                                     ; $69AC: $4F
    ld   a, $06                                   ; $69AD: $3E $06
    call func_015_7964_trampoline                 ; $69AF: $CD $A0 $3D
    jp   label_3CD9                               ; $69B2: $C3 $D9 $3C

Data_018_69B5::
    db   $00, $FE, $FD, $FE, $00, $02, $03, $02

Data_018_69BD::
    db   $00, $04, $08, $0C, $10, $0C, $08, $04

func_018_69C5::
    ld   hl, wOAMBuffer+$10                       ; $69C5: $21 $10 $C0
    ldh  a, [hFrameCounter]                       ; $69C8: $F0 $E7
    rra                                           ; $69CA: $1F
    rra                                           ; $69CB: $1F
    rra                                           ; $69CC: $1F
    push af                                       ; $69CD: $F5
    and  $07                                      ; $69CE: $E6 $07
    call func_018_69D8                            ; $69D0: $CD $D8 $69
    pop  af                                       ; $69D3: $F1
    add  $04                                      ; $69D4: $C6 $04
    and  $07                                      ; $69D6: $E6 $07

func_018_69D8::
    push bc                                       ; $69D8: $C5
    push hl                                       ; $69D9: $E5
    ld   e, a                                     ; $69DA: $5F
    ld   d, $00                                   ; $69DB: $16 $00
    ld   hl, Data_018_69B5                        ; $69DD: $21 $B5 $69
    add  hl, de                                   ; $69E0: $19
    ld   b, [hl]                                  ; $69E1: $46
    ld   hl, Data_018_69BD                        ; $69E2: $21 $BD $69
    add  hl, de                                   ; $69E5: $19
    ld   c, [hl]                                  ; $69E6: $4E
    pop  hl                                       ; $69E7: $E1
    ldh  a, [hLinkPositionY]                      ; $69E8: $F0 $99
    add  b                                        ; $69EA: $80
    add  $F6                                      ; $69EB: $C6 $F6
    ld   [hl+], a                                 ; $69ED: $22
    ldh  a, [hLinkPositionX]                      ; $69EE: $F0 $98
    add  c                                        ; $69F0: $81
    add  $FC                                      ; $69F1: $C6 $FC
    ld   [hl+], a                                 ; $69F3: $22
    ld   [hl], $24                                ; $69F4: $36 $24
    inc  hl                                       ; $69F6: $23
    ld   [hl], $00                                ; $69F7: $36 $00
    inc  hl                                       ; $69F9: $23
    pop  bc                                       ; $69FA: $C1
    ret                                           ; $69FB: $C9
