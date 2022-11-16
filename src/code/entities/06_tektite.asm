; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
TektiteSpriteVariants::
.variant0
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

Data_006_78BF::
    db   $10, $F0, $10, $F0

Data_006_78C3::
    db   $10, $10, $F0, $F0

TektiteEntityHandler::
    ld   de, TektiteSpriteVariants                ; $78C7: $11 $B7 $78
    call RenderActiveEntitySpritesPair            ; $78CA: $CD $C0 $3B

.jr_78CD
    call ReturnIfNonInteractive_06                ; $78CD: $CD $C6 $64
    call ApplyRecoilIfNeeded_06                   ; $78D0: $CD $F7 $64
    call label_3B39                               ; $78D3: $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ; $78D6: $CD $41 $65
    call label_3B23                               ; $78D9: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $78DC: $21 $A0 $C2
    add  hl, bc                                   ; $78DF: $09
    ld   a, [hl]                                  ; $78E0: $7E
    and  $03                                      ; $78E1: $E6 $03
    jr   z, .jr_78E8                              ; $78E3: $28 $03

    call func_006_7979                            ; $78E5: $CD $79 $79

.jr_78E8
    ld   a, [hl]                                  ; $78E8: $7E
    and  $0C                                      ; $78E9: $E6 $0C
    jr   z, .jr_78F0                              ; $78EB: $28 $03

    call func_006_797E                            ; $78ED: $CD $7E $79

.jr_78F0
    ldh  a, [hActiveEntityState]                  ; $78F0: $F0 $F0
    and  a                                        ; $78F2: $A7
    jr   nz, jr_006_7921                          ; $78F3: $20 $2C

    ld   hl, wEntitiesPosZTable                   ; $78F5: $21 $10 $C3
    add  hl, bc                                   ; $78F8: $09
    ld   a, [hl]                                  ; $78F9: $7E
    and  $80                                      ; $78FA: $E6 $80
    jr   z, .jr_7918                              ; $78FC: $28 $1A

    xor  a                                        ; $78FE: $AF
    ld   [hl], a                                  ; $78FF: $77
    call ClearEntitySpeed                         ; $7900: $CD $7F $3D
    ld   hl, wEntitiesStateTable                  ; $7903: $21 $90 $C2
    add  hl, bc                                   ; $7906: $09
    inc  [hl]                                     ; $7907: $34
    call GetEntityTransitionCountdown             ; $7908: $CD $05 $0C
    call GetRandomByte                            ; $790B: $CD $0D $28
    and  $3F                                      ; $790E: $E6 $3F
    add  $10                                      ; $7910: $C6 $10
    ld   [hl], a                                  ; $7912: $77
    ld   a, $01                                   ; $7913: $3E $01
    jp   SetEntitySpriteVariant                   ; $7915: $C3 $0C $3B

.jr_7918
    call AddEntityZSpeedToPos_06                  ; $7918: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $791B: $21 $20 $C3
    add  hl, bc                                   ; $791E: $09
    dec  [hl]                                     ; $791F: $35
    ret                                           ; $7920: $C9

jr_006_7921:
    ld   hl, wEntitiesInertiaTable                ; $7921: $21 $D0 $C3
    add  hl, bc                                   ; $7924: $09
    inc  [hl]                                     ; $7925: $34
    ld   a, [hl]                                  ; $7926: $7E
    and  $10                                      ; $7927: $E6 $10
    srl  a                                        ; $7929: $CB $3F
    srl  a                                        ; $792B: $CB $3F
    srl  a                                        ; $792D: $CB $3F
    srl  a                                        ; $792F: $CB $3F
    call SetEntitySpriteVariant                   ; $7931: $CD $0C $3B
    and  a                                        ; $7934: $A7
    ret  nz                                       ; $7935: $C0

    call GetEntityTransitionCountdown             ; $7936: $CD $05 $0C
    ret  nz                                       ; $7939: $C0

    call GetRandomByte                            ; $793A: $CD $0D $28
    and  $07                                      ; $793D: $E6 $07
    add  $10                                      ; $793F: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $7941: $21 $20 $C3
    add  hl, bc                                   ; $7944: $09
    ld   [hl], a                                  ; $7945: $77
    call AddEntityZSpeedToPos_06                  ; $7946: $CD $7A $65
    call GetRandomByte                            ; $7949: $CD $0D $28
    and  $03                                      ; $794C: $E6 $03
    ld   e, a                                     ; $794E: $5F
    ld   d, b                                     ; $794F: $50
    ld   hl, Data_006_78BF                        ; $7950: $21 $BF $78
    add  hl, de                                   ; $7953: $19
    ld   a, [hl]                                  ; $7954: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7955: $21 $40 $C2
    add  hl, bc                                   ; $7958: $09
    ld   [hl], a                                  ; $7959: $77
    ld   hl, Data_006_78C3                        ; $795A: $21 $C3 $78
    add  hl, de                                   ; $795D: $19
    ld   a, [hl]                                  ; $795E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $795F: $21 $50 $C2
    add  hl, bc                                   ; $7962: $09
    ld   [hl], a                                  ; $7963: $77
    call GetRandomByte                            ; $7964: $CD $0D $28
    and  $01                                      ; $7967: $E6 $01
    jr   z, .jr_7970                              ; $7969: $28 $05

    ld   a, $14                                   ; $796B: $3E $14
    call ApplyVectorTowardsLink_trampoline        ; $796D: $CD $AA $3B

.jr_7970
    ld   hl, wEntitiesStateTable                  ; $7970: $21 $90 $C2
    add  hl, bc                                   ; $7973: $09
    xor  a                                        ; $7974: $AF
    ld   [hl], a                                  ; $7975: $77
    jp   SetEntitySpriteVariant                   ; $7976: $C3 $0C $3B

func_006_7979::
    ld   hl, wEntitiesSpeedXTable                 ; $7979: $21 $40 $C2
    jr   jr_006_7982                              ; $797C: $18 $04

func_006_797E::
    ld   hl, wEntitiesSpeedXTable                 ; $797E: $21 $40 $C2
    add  hl, bc                                   ; $7981: $09

jr_006_7982:
    ld   a, [hl]                                  ; $7982: $7E
    cpl                                           ; $7983: $2F
    inc  a                                        ; $7984: $3C
    sra  a                                        ; $7985: $CB $2F
    ld   [hl], a                                  ; $7987: $77
    ret                                           ; $7988: $C9
