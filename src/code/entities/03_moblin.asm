Data_003_57FB::
    db   $30, $02, $30, $22, $32, $02, $32, $22, $30, $42, $30, $62, $32, $42, $32, $62
    db   $34, $02, $36, $02, $38, $02, $3A, $02, $36, $22, $34, $22, $3A, $22, $38, $22

Data_003_581B::
    db   $08, $F8, $00, $00

Data_003_581F::
    db   $00, $00, $F8, $08

Data_003_5823::
    db   $06, $04, $02, $00

MoblinEntityHandler::
    ldh  a, [hMapId]                              ; $5827: $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ; $5829: $FE $15
    jr   nz, .jr_5835                             ; $582B: $20 $08

    ld   a, [wIsBowWowFollowingLink]              ; $582D: $FA $56 $DB
    cp   $80                                      ; $5830: $FE $80
    jp   nz, UnloadEntityAndReturn                ; $5832: $C2 $8D $3F

.jr_5835
    ld   a, c                                     ; $5835: $79
    ld   [wD153], a                               ; $5836: $EA $53 $D1
    ld   de, Unknown009SpriteVariants             ; $5839: $11 $17 $59
    ; fallthrough

; Animate roaming enemy (Octorok, Moblin, Iron mask)
AnimateRoamingEnemy::
    call RenderActiveEntitySpritesPair            ; $583C: $CD $C0 $3B
    call ReturnIfNonInteractive_03                ; $583F: $CD $78 $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5842: $21 $10 $C4
    add  hl, bc                                   ; $5845: $09
    ld   a, [hl]                                  ; $5846: $7E

.jr_5847
    and  a                                        ; $5847: $A7
    jr   z, .jr_5858                              ; $5848: $28 $0E

    ld   hl, wEntitiesStateTable                  ; $584A: $21 $90 $C2
    add  hl, bc                                   ; $584D: $09
    ld   a, $01                                   ; $584E: $3E $01
    ld   [hl], a                                  ; $5850: $77
    ldh  [hActiveEntityState], a                  ; $5851: $E0 $F0
    call GetEntityTransitionCountdown             ; $5853: $CD $05 $0C
    ld   [hl], $40                                ; $5856: $36 $40

.jr_5858
    call ApplyRecoilIfNeeded_03                   ; $5858: $CD $A9 $7F
    call func_003_6E28                            ; $585B: $CD $28 $6E
    ldh  a, [hActiveEntityState]                  ; $585E: $F0 $F0
    and  a                                        ; $5860: $A7
    jr   z, jr_003_58D7                           ; $5861: $28 $74

    call GetEntityTransitionCountdown             ; $5863: $CD $05 $0C
    jr   z, jr_003_5896                           ; $5866: $28 $2E

    cp   $0A                                      ; $5868: $FE $0A
    jr   nz, .jr_5889                             ; $586A: $20 $1D

    call GetEntityPrivateCountdown1               ; $586C: $CD $00 $0C
    jr   nz, .jr_5889                             ; $586F: $20 $18

    call func_003_7EFE                            ; $5871: $CD $FE $7E
    ld   hl, wEntitiesDirectionTable              ; $5874: $21 $80 $C3
    add  hl, bc                                   ; $5877: $09
    ld   a, e                                     ; $5878: $7B
    cp   [hl]                                     ; $5879: $BE
    jr   nz, .jr_5889                             ; $587A: $20 $0D

    ldh  a, [hActiveEntityType]                   ; $587C: $F0 $EB
    cp   ENTITY_IRON_MASK                         ; $587E: $FE $24
    jr   z, .jr_5889                              ; $5880: $28 $07

    cp   ENTITY_OCTOROK                           ; $5882: $FE $09
    jr   z, jr_003_588D                           ; $5884: $28 $07

    call SpawnMoblinArrow                         ; $5886: $CD $47 $59

.jr_5889
    call func_003_7893                            ; $5889: $CD $93 $78
    ret                                           ; $588C: $C9

jr_003_588D:
    ld   a, [wGameplayType]                       ; $588D: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $5890: $FE $01
    ret  z                                        ; $5892: $C8

    jp   SpawnOctorokRock                         ; $5893: $C3 $98 $59

jr_003_5896:
    call GetRandomByte                            ; $5896: $CD $0D $28
    and  $1F                                      ; $5899: $E6 $1F
    or   $20                                      ; $589B: $F6 $20
    ld   [hl], a                                  ; $589D: $77
    ld   hl, wEntitiesStateTable                  ; $589E: $21 $90 $C2
    add  hl, bc                                   ; $58A1: $09
    ld   [hl], $00                                ; $58A2: $36 $00
    ld   hl, wEntitiesPrivateState1Table          ; $58A4: $21 $B0 $C2
    add  hl, bc                                   ; $58A7: $09
    ld   a, [hl]                                  ; $58A8: $7E
    inc  a                                        ; $58A9: $3C
    and  $03                                      ; $58AA: $E6 $03
    ld   [hl], a                                  ; $58AC: $77
    cp   $00                                      ; $58AD: $FE $00
    jr   nz, .jr_58B6                             ; $58AF: $20 $05

    call func_003_7EFE                            ; $58B1: $CD $FE $7E
    jr   jr_003_58B9                              ; $58B4: $18 $03

.jr_58B6
    call GetRandomByte                            ; $58B6: $CD $0D $28

jr_003_58B9:
    and  $03                                      ; $58B9: $E6 $03
    ld   hl, wEntitiesDirectionTable              ; $58BB: $21 $80 $C3
    add  hl, bc                                   ; $58BE: $09
    ld   [hl], a                                  ; $58BF: $77
    ld   e, a                                     ; $58C0: $5F
    ld   d, b                                     ; $58C1: $50
    ld   hl, Data_003_581B                        ; $58C2: $21 $1B $58
    add  hl, de                                   ; $58C5: $19
    ld   a, [hl]                                  ; $58C6: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $58C7: $21 $40 $C2
    add  hl, bc                                   ; $58CA: $09
    ld   [hl], a                                  ; $58CB: $77
    ld   hl, Data_003_581F                        ; $58CC: $21 $1F $58
    add  hl, de                                   ; $58CF: $19
    ld   a, [hl]                                  ; $58D0: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $58D1: $21 $50 $C2
    add  hl, bc                                   ; $58D4: $09
    ld   [hl], a                                  ; $58D5: $77
    ret                                           ; $58D6: $C9

jr_003_58D7:
    ld   hl, wEntitiesCollisionsTable             ; $58D7: $21 $A0 $C2
    add  hl, bc                                   ; $58DA: $09
    ld   a, [hl]                                  ; $58DB: $7E
    and  $0F                                      ; $58DC: $E6 $0F
    jr   nz, .jr_58E5                             ; $58DE: $20 $05

    call GetEntityTransitionCountdown             ; $58E0: $CD $05 $0C
    jr   nz, jr_003_58F6                          ; $58E3: $20 $11

.jr_58E5
    call GetRandomByte                            ; $58E5: $CD $0D $28
    and  $0F                                      ; $58E8: $E6 $0F
    or   $10                                      ; $58EA: $F6 $10
    ld   [hl], a                                  ; $58EC: $77
    ld   hl, wEntitiesStateTable                  ; $58ED: $21 $90 $C2
    add  hl, bc                                   ; $58F0: $09
    ld   [hl], $01                                ; $58F1: $36 $01
    call ClearEntitySpeed                         ; $58F3: $CD $7F $3D

jr_003_58F6:
    call UpdateEntityPosWithSpeed_03              ; $58F6: $CD $25 $7F
    call func_003_7893                            ; $58F9: $CD $93 $78

func_003_58FC::
    ld   hl, wEntitiesDirectionTable              ; $58FC: $21 $80 $C3
    add  hl, bc                                   ; $58FF: $09
    ld   e, [hl]                                  ; $5900: $5E
    ld   d, b                                     ; $5901: $50
    ld   hl, Data_003_5823                        ; $5902: $21 $23 $58
    add  hl, de                                   ; $5905: $19
    push hl                                       ; $5906: $E5
    ld   hl, wEntitiesInertiaTable                ; $5907: $21 $D0 $C3
    add  hl, bc                                   ; $590A: $09
    inc  [hl]                                     ; $590B: $34
    ld   a, [hl]                                  ; $590C: $7E
    rra                                           ; $590D: $1F
    rra                                           ; $590E: $1F
    rra                                           ; $590F: $1F
    pop  hl                                       ; $5910: $E1
    and  $01                                      ; $5911: $E6 $01
    or   [hl]                                     ; $5913: $B6
    jp   SetEntitySpriteVariant                   ; $5914: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown009SpriteVariants::
.variant0
    db $60, OAM_GBC_PAL_3
    db $62, OAM_GBC_PAL_3
.variant1
    db $62, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $60, OAM_GBC_PAL_3 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_3
    db $66, OAM_GBC_PAL_3
.variant3
    db $66, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_3 | OAMF_XFLIP
.variant4
    db $68, OAM_GBC_PAL_3
    db $6A, OAM_GBC_PAL_3
.variant5
    db $6C, OAM_GBC_PAL_3
    db $6E, OAM_GBC_PAL_3
.variant6
    db $6A, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $68, OAM_GBC_PAL_3 | OAMF_XFLIP
.variant7
    db $6E, OAM_GBC_PAL_3 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_3 | OAMF_XFLIP

Data_003_5937::
    db   $08, $F8, $04, $FC

Data_003_593B::
    db   $FC, $FC, $F8, $00

Data_003_593F::
    db   $20, $E0, $00, $00

Data_003_5943::
    db   $00, $00, $E0, $20

SpawnMoblinArrow::
    ld   a, ENTITY_MOBLIN_ARROW                   ; $5947: $3E $0C
    call SpawnNewEntity                           ; $5949: $CD $CA $64
    jr   c, ret_003_598B                          ; $594C: $38 $3D

    push bc                                       ; $594E: $C5
    ldh  a, [hMultiPurpose2]                      ; $594F: $F0 $D9
    ld   c, a                                     ; $5951: $4F
    ld   hl, Data_003_5937                        ; $5952: $21 $37 $59
    add  hl, bc                                   ; $5955: $09
    ldh  a, [hMultiPurpose0]                      ; $5956: $F0 $D7
    add  [hl]                                     ; $5958: $86
    ld   hl, wEntitiesPosXTable                   ; $5959: $21 $00 $C2
    add  hl, de                                   ; $595C: $19
    ld   [hl], a                                  ; $595D: $77
    ld   hl, Data_003_593B                        ; $595E: $21 $3B $59
    add  hl, bc                                   ; $5961: $09
    ldh  a, [hMultiPurpose1]                      ; $5962: $F0 $D8
    add  [hl]                                     ; $5964: $86
    ld   hl, wEntitiesPosYTable                   ; $5965: $21 $10 $C2
    add  hl, de                                   ; $5968: $19
    ld   [hl], a                                  ; $5969: $77
    ld   hl, Data_003_593F                        ; $596A: $21 $3F $59
    add  hl, bc                                   ; $596D: $09
    ld   a, [hl]                                  ; $596E: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $596F: $21 $40 $C2
    add  hl, de                                   ; $5972: $19
    ld   [hl], a                                  ; $5973: $77

.jr_5974
    ld   hl, Data_003_5943                        ; $5974: $21 $43 $59
    add  hl, bc                                   ; $5977: $09
    ld   a, [hl]                                  ; $5978: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5979: $21 $50 $C2
    add  hl, de                                   ; $597C: $19
    ld   [hl], a                                  ; $597D: $77
    ldh  a, [hMultiPurpose2]                      ; $597E: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $5980: $21 $B0 $C3
    add  hl, de                                   ; $5983: $19
    ld   [hl], a                                  ; $5984: $77
    ld   hl, wEntitiesDirectionTable              ; $5985: $21 $80 $C3
    add  hl, de                                   ; $5988: $19
    ld   [hl], a                                  ; $5989: $77
    pop  bc                                       ; $598A: $C1

ret_003_598B:
    ret                                           ; $598B: $C9

Data_003_598C::
    db   $08, $F8

Data_003_598E::
    db   $00, $00, $F8, $08

Data_003_5992::
    db   $20, $E0

Data_003_5994::
    db   $00, $00, $E0, $20

SpawnOctorokRock::
    ld   a, ENTITY_OCTOROK_ROCK                   ; $5998: $3E $0A
    call SpawnNewEntity                           ; $599A: $CD $CA $64
    jr   c, .return                               ; $599D: $38 $37

    push bc                                       ; $599F: $C5
    ldh  a, [hMultiPurpose2]                      ; $59A0: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $59A2: $21 $80 $C3
    add  hl, de                                   ; $59A5: $19
    ld   [hl], a                                  ; $59A6: $77
    ld   c, a                                     ; $59A7: $4F
    ld   hl, Data_003_598C                        ; $59A8: $21 $8C $59
    add  hl, bc                                   ; $59AB: $09
    ldh  a, [hMultiPurpose0]                      ; $59AC: $F0 $D7
    add  [hl]                                     ; $59AE: $86
    ld   hl, wEntitiesPosXTable                   ; $59AF: $21 $00 $C2
    add  hl, de                                   ; $59B2: $19
    ld   [hl], a                                  ; $59B3: $77
    ld   hl, Data_003_598E                        ; $59B4: $21 $8E $59
    add  hl, bc                                   ; $59B7: $09
    ldh  a, [hMultiPurpose1]                      ; $59B8: $F0 $D8
    add  [hl]                                     ; $59BA: $86
    ld   hl, wEntitiesPosYTable                   ; $59BB: $21 $10 $C2
    add  hl, de                                   ; $59BE: $19
    ld   [hl], a                                  ; $59BF: $77
    ld   hl, Data_003_5992                        ; $59C0: $21 $92 $59
    add  hl, bc                                   ; $59C3: $09
    ld   a, [hl]                                  ; $59C4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $59C5: $21 $40 $C2
    add  hl, de                                   ; $59C8: $19
    ld   [hl], a                                  ; $59C9: $77
    ld   hl, Data_003_5994                        ; $59CA: $21 $94 $59
    add  hl, bc                                   ; $59CD: $09
    ld   a, [hl]                                  ; $59CE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $59CF: $21 $50 $C2
    add  hl, de                                   ; $59D2: $19
    ld   [hl], a                                  ; $59D3: $77
    pop  bc                                       ; $59D4: $C1
    and  a                                        ; $59D5: $A7

.return
IF !__OPTIMIZATIONS_1__
    ; Small optimization: This RET isn't needed since we just
    ; fall through to EntityInitBrokenHeartContainer, which only
    ; contains RET.
    ret                                           ; $59D6: $C9
ENDC
