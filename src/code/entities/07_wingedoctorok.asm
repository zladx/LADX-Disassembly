Data_007_5625::
    db   $08, $F8, $00, $00

Data_007_5629::
    db   $00, $00, $F8, $08

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WingedOctorokSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP
.variant4
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

WingedOctorokEntityHandler::
    ld   de, WingedOctorokSpriteVariants          ; $564D: $11 $2D $56
    call RenderActiveEntitySpritesPair            ; $5650: $CD $C0 $3B
    call func_007_5805                            ; $5653: $CD $05 $58
    call ReturnIfNonInteractive_07                ; $5656: $CD $96 $7D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5659: $21 $10 $C4
    add  hl, bc                                   ; $565C: $09
    ld   a, [hl]                                  ; $565D: $7E
    and  a                                        ; $565E: $A7
    jr   z, .jr_566F                              ; $565F: $28 $0E

    ld   hl, wEntitiesStateTable                  ; $5661: $21 $90 $C2
    add  hl, bc                                   ; $5664: $09
    ld   a, $01                                   ; $5665: $3E $01
    ld   [hl], a                                  ; $5667: $77
    ldh  [hActiveEntityState], a                  ; $5668: $E0 $F0
    call GetEntityTransitionCountdown             ; $566A: $CD $05 $0C
    ld   [hl], $40                                ; $566D: $36 $40

.jr_566F
    call ApplyRecoilIfNeeded_07                   ; $566F: $CD $C3 $7D
    call UpdateEntityPosWithSpeed_07              ; $5672: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $5675: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5678: $21 $20 $C3
    add  hl, bc                                   ; $567B: $09
    dec  [hl]                                     ; $567C: $35
    ld   hl, wEntitiesPosZTable                   ; $567D: $21 $10 $C3
    add  hl, bc                                   ; $5680: $09
    ld   a, [hl]                                  ; $5681: $7E
    and  $80                                      ; $5682: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $5684: $E0 $E8
    jr   z, .jr_5693                              ; $5686: $28 $0B

    ld   [hl], b                                  ; $5688: $70
    ld   hl, wEntitiesSpeedZTable                 ; $5689: $21 $20 $C3
    add  hl, bc                                   ; $568C: $09
    ld   [hl], b                                  ; $568D: $70
    ld   hl, wEntitiesPrivateState2Table          ; $568E: $21 $C0 $C2
    add  hl, bc                                   ; $5691: $09
    ld   [hl], b                                  ; $5692: $70

.jr_5693
    call label_3B23                               ; $5693: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $5696: $F0 $F0
    cp   $02                                      ; $5698: $FE $02
    jp   z, label_007_577A                        ; $569A: $CA $7A $57

    and  a                                        ; $569D: $A7
    jr   z, jr_007_56FF                           ; $569E: $28 $5F

    call GetEntityTransitionCountdown             ; $56A0: $CD $05 $0C
    jr   z, jr_007_56BD                           ; $56A3: $28 $18

    cp   $0A                                      ; $56A5: $FE $0A
    jr   nz, .jr_56B7                             ; $56A7: $20 $0E

    call func_007_7E7D                            ; $56A9: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $56AC: $21 $80 $C3
    add  hl, bc                                   ; $56AF: $09
    ld   a, e                                     ; $56B0: $7B
    cp   [hl]                                     ; $56B1: $BE
    jr   nz, .jr_56B7                             ; $56B2: $20 $03

    call func_007_57B0                            ; $56B4: $CD $B0 $57

.jr_56B7
    call ClearEntitySpeed                         ; $56B7: $CD $7F $3D
    jp   label_007_5721                           ; $56BA: $C3 $21 $57

jr_007_56BD:
    call GetRandomByte                            ; $56BD: $CD $0D $28
    and  $1F                                      ; $56C0: $E6 $1F
    or   $20                                      ; $56C2: $F6 $20
    ld   [hl], a                                  ; $56C4: $77
    ld   hl, wEntitiesStateTable                  ; $56C5: $21 $90 $C2
    add  hl, bc                                   ; $56C8: $09
    ld   [hl], $00                                ; $56C9: $36 $00
    ld   hl, wEntitiesPrivateState1Table          ; $56CB: $21 $B0 $C2
    add  hl, bc                                   ; $56CE: $09
    ld   a, [hl]                                  ; $56CF: $7E
    inc  a                                        ; $56D0: $3C
    and  $03                                      ; $56D1: $E6 $03
    ld   [hl], a                                  ; $56D3: $77
    cp   $00                                      ; $56D4: $FE $00
    jr   nz, .jr_56DD                             ; $56D6: $20 $05

    call func_007_7E7D                            ; $56D8: $CD $7D $7E
    jr   jr_007_56E0                              ; $56DB: $18 $03

.jr_56DD
    call GetRandomByte                            ; $56DD: $CD $0D $28

jr_007_56E0:
    and  $03                                      ; $56E0: $E6 $03
    ld   hl, wEntitiesDirectionTable              ; $56E2: $21 $80 $C3
    add  hl, bc                                   ; $56E5: $09
    ld   [hl], a                                  ; $56E6: $77
    ld   e, a                                     ; $56E7: $5F
    ld   d, b                                     ; $56E8: $50
    ld   hl, Data_007_5625                        ; $56E9: $21 $25 $56
    add  hl, de                                   ; $56EC: $19
    ld   a, [hl]                                  ; $56ED: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $56EE: $21 $40 $C2
    add  hl, bc                                   ; $56F1: $09
    ld   [hl], a                                  ; $56F2: $77
    ld   hl, Data_007_5629                        ; $56F3: $21 $29 $56
    add  hl, de                                   ; $56F6: $19
    ld   a, [hl]                                  ; $56F7: $7E
    call GetEntitySpeedYAddress                   ; $56F8: $CD $05 $40
    ld   [hl], a                                  ; $56FB: $77
    jp   label_007_5721                           ; $56FC: $C3 $21 $57

jr_007_56FF:
    ld   hl, wEntitiesCollisionsTable             ; $56FF: $21 $A0 $C2
    add  hl, bc                                   ; $5702: $09
    ld   a, [hl]                                  ; $5703: $7E
    and  $0F                                      ; $5704: $E6 $0F
    jr   nz, .jr_570D                             ; $5706: $20 $05

    call GetEntityTransitionCountdown             ; $5708: $CD $05 $0C
    jr   nz, jr_007_571E                          ; $570B: $20 $11

.jr_570D
    call GetRandomByte                            ; $570D: $CD $0D $28
    and  $0F                                      ; $5710: $E6 $0F
    or   $10                                      ; $5712: $F6 $10
    ld   [hl], a                                  ; $5714: $77
    ld   hl, wEntitiesStateTable                  ; $5715: $21 $90 $C2
    add  hl, bc                                   ; $5718: $09
    ld   [hl], $01                                ; $5719: $36 $01
    call ClearEntitySpeed                         ; $571B: $CD $7F $3D

jr_007_571E:
    call func_007_7D1A                            ; $571E: $CD $1A $7D

label_007_5721:
    ld   hl, wEntitiesPrivateCountdown2Table      ; $5721: $21 $00 $C3
    add  hl, bc                                   ; $5724: $09
    ld   a, [hl]                                  ; $5725: $7E
    and  a                                        ; $5726: $A7
    jr   nz, jr_007_5777                          ; $5727: $20 $4E

    call EntityLinkPositionXDifference_07         ; $5729: $CD $5D $7E
    add  $20                                      ; $572C: $C6 $20
    cp   $40                                      ; $572E: $FE $40
    jr   nc, jr_007_5777                          ; $5730: $30 $45

    call EntityLinkPositionYDifference_07         ; $5732: $CD $6D $7E
    add  $20                                      ; $5735: $C6 $20
    cp   $40                                      ; $5737: $FE $40
    jr   nc, jr_007_5777                          ; $5739: $30 $3C

    ld   a, [wInventoryItems.BButtonSlot]         ; $573B: $FA $00 $DB
    cp   INVENTORY_SWORD                          ; $573E: $FE $01
    jr   nz, .jr_574A                             ; $5740: $20 $08

    ldh  a, [hJoypadState]                        ; $5742: $F0 $CC
    and  J_B                                      ; $5744: $E6 $20
    jr   nz, jr_007_5757                          ; $5746: $20 $0F

    jr   jr_007_5777                              ; $5748: $18 $2D

.jr_574A
    ld   a, [wInventoryItems.AButtonSlot]         ; $574A: $FA $01 $DB
    cp   INVENTORY_SWORD                          ; $574D: $FE $01
    jr   nz, jr_007_5777                          ; $574F: $20 $26

    ldh  a, [hJoypadState]                        ; $5751: $F0 $CC
    and  J_A                                      ; $5753: $E6 $10
    jr   z, jr_007_5777                           ; $5755: $28 $20

jr_007_5757:
    call func_007_7E7D                            ; $5757: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $575A: $21 $80 $C3
    add  hl, bc                                   ; $575D: $09
    ld   a, [hl]                                  ; $575E: $7E
    xor  $01                                      ; $575F: $EE $01
    cp   e                                        ; $5761: $BB
    jr   z, jr_007_5777                           ; $5762: $28 $13

    ld   hl, wEntitiesSpeedZTable                 ; $5764: $21 $20 $C3
    add  hl, bc                                   ; $5767: $09
    ld   [hl], $18                                ; $5768: $36 $18
    ld   a, $10                                   ; $576A: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $576C: $CD $AA $3B
    call IncrementEntityState                     ; $576F: $CD $12 $3B
    ld   [hl], $02                                ; $5772: $36 $02
    jp   func_007_733F                            ; $5774: $C3 $3F $73

jr_007_5777:
    jp   label_3B39                               ; $5777: $C3 $39 $3B

label_007_577A:
    ldh  a, [hFrameCounter]                       ; $577A: $F0 $E7
    rra                                           ; $577C: $1F
    rra                                           ; $577D: $1F
    and  $01                                      ; $577E: $E6 $01
    ld   hl, wEntitiesPrivateState2Table          ; $5780: $21 $C0 $C2
    add  hl, bc                                   ; $5783: $09
    ld   [hl], a                                  ; $5784: $77
    call func_007_7E7D                            ; $5785: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $5788: $21 $80 $C3
    add  hl, bc                                   ; $578B: $09
    ld   [hl], e                                  ; $578C: $73
    call func_007_7D1A                            ; $578D: $CD $1A $7D
    ldh  a, [hMultiPurposeG]                      ; $5790: $F0 $E8
    and  a                                        ; $5792: $A7
    jr   z, .ret_579F                             ; $5793: $28 $0A

    call IncrementEntityState                     ; $5795: $CD $12 $3B
    ld   [hl], $01                                ; $5798: $36 $01
    call GetEntityTransitionCountdown             ; $579A: $CD $05 $0C
    ld   [hl], $20                                ; $579D: $36 $20

.ret_579F
    ret                                           ; $579F: $C9

Data_007_57A0::
    db   $08, $F8, $00, $00

Data_007_57A4::
    db   $00, $00, $F8, $08

Data_007_57A8::
    db   $20, $E0, $00, $00

Data_007_57AC::
    db   $00, $00, $E0, $20

func_007_57B0::
    ld   a, ENTITY_OCTOROK_ROCK                   ; $57B0: $3E $0A
    call SpawnNewEntity_trampoline                ; $57B2: $CD $86 $3B
    jr   c, .ret_57F4                             ; $57B5: $38 $3D

    push bc                                       ; $57B7: $C5
    ld   hl, wEntitiesSpriteVariantTable          ; $57B8: $21 $B0 $C3
    add  hl, de                                   ; $57BB: $19
    ld   [hl], $01                                ; $57BC: $36 $01
    ldh  a, [hMultiPurpose2]                      ; $57BE: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $57C0: $21 $80 $C3
    add  hl, de                                   ; $57C3: $19
    ld   [hl], a                                  ; $57C4: $77
    ld   c, a                                     ; $57C5: $4F
    ld   hl, Data_007_57A0                        ; $57C6: $21 $A0 $57
    add  hl, bc                                   ; $57C9: $09
    ldh  a, [hMultiPurpose0]                      ; $57CA: $F0 $D7
    add  [hl]                                     ; $57CC: $86
    ld   hl, wEntitiesPosXTable                   ; $57CD: $21 $00 $C2
    add  hl, de                                   ; $57D0: $19
    ld   [hl], a                                  ; $57D1: $77
    ld   hl, Data_007_57A4                        ; $57D2: $21 $A4 $57
    add  hl, bc                                   ; $57D5: $09
    ldh  a, [hMultiPurpose1]                      ; $57D6: $F0 $D8
    add  [hl]                                     ; $57D8: $86
    ld   hl, wEntitiesPosYTable                   ; $57D9: $21 $10 $C2
    add  hl, de                                   ; $57DC: $19
    ld   [hl], a                                  ; $57DD: $77
    ld   hl, Data_007_57A8                        ; $57DE: $21 $A8 $57
    add  hl, bc                                   ; $57E1: $09
    ld   a, [hl]                                  ; $57E2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $57E3: $21 $40 $C2
    add  hl, de                                   ; $57E6: $19
    ld   [hl], a                                  ; $57E7: $77
    ld   hl, Data_007_57AC                        ; $57E8: $21 $AC $57
    add  hl, bc                                   ; $57EB: $09
    ld   a, [hl]                                  ; $57EC: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $57ED: $21 $50 $C2
    add  hl, de                                   ; $57F0: $19
    ld   [hl], a                                  ; $57F1: $77
    pop  bc                                       ; $57F2: $C1
    and  a                                        ; $57F3: $A7

.ret_57F4
    ret                                           ; $57F4: $C9

Data_007_57F5::
    db   $00, $FC, $22, $40, $00, $0C, $22, $60, $00, $FC, $22, $00, $00, $0C, $22, $20

func_007_5805::
    ld   hl, wEntitiesPrivateState2Table          ; $5805: $21 $C0 $C2
    add  hl, bc                                   ; $5808: $09
    ld   a, [hl]                                  ; $5809: $7E
    rla                                           ; $580A: $17
    rla                                           ; $580B: $17
    rla                                           ; $580C: $17
    and  $F8                                      ; $580D: $E6 $F8
    ld   e, a                                     ; $580F: $5F
    ld   d, b                                     ; $5810: $50
    ld   hl, Data_007_57F5                        ; $5811: $21 $F5 $57
    add  hl, de                                   ; $5814: $19
    ld   c, $02                                   ; $5815: $0E $02
    jp   RenderActiveEntitySpritesRect            ; $5817: $C3 $E6 $3C
