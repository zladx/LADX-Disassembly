; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PeaHatSpriteVariants::
.variant0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0
    db $40, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0
    db $42, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

PeaHatEntityHandler::
    ld   de, PeaHatSpriteVariants                 ; $6709: $11 $01 $67
    call RenderActiveEntitySpritesPair            ; $670C: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $670F: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $6712: $CD $C3 $7D
    call label_3B39                               ; $6715: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $6718: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $671B: $CD $43 $7E
    call label_3B23                               ; $671E: $CD $23 $3B
    ld   hl, wEntitiesHitboxFlagsTable            ; $6721: $21 $50 $C3
    add  hl, bc                                   ; $6724: $09
    set  7, [hl]                                  ; $6725: $CB $FE
    ld   hl, wEntitiesOptions1Table               ; $6727: $21 $30 $C4
    add  hl, bc                                   ; $672A: $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $672B: $CB $F6
    ldh  a, [hActiveEntityState]                  ; $672D: $F0 $F0
    JP_TABLE                                      ; $672F
._00 dw func_007_6736                             ; $6730
._01 dw func_007_6790                             ; $6732
._02 dw func_007_67D7                             ; $6734

func_007_6736::
    ld   hl, wEntitiesPosZTable                   ; $6736: $21 $10 $C3
    add  hl, bc                                   ; $6739: $09
    ld   a, [hl]                                  ; $673A: $7E
    and  a                                        ; $673B: $A7
    jr   z, .jr_6747                              ; $673C: $28 $09

    ldh  a, [hFrameCounter]                       ; $673E: $F0 $E7
    and  $07                                      ; $6740: $E6 $07
    jr   nz, jr_007_6753                          ; $6742: $20 $0F

    dec  [hl]                                     ; $6744: $35
    jr   jr_007_6753                              ; $6745: $18 $0C

.jr_6747
    ld   hl, wEntitiesHitboxFlagsTable            ; $6747: $21 $50 $C3
    add  hl, bc                                   ; $674A: $09
    res  7, [hl]                                  ; $674B: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $674D: $21 $30 $C4
    add  hl, bc                                   ; $6750: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $6751: $CB $B6

jr_007_6753:
    ldh  a, [hFrameCounter]                       ; $6753: $F0 $E7
    and  $07                                      ; $6755: $E6 $07
    jr   nz, jr_007_6776                          ; $6757: $20 $1D

    ld   hl, wEntitiesSpeedXTable                 ; $6759: $21 $40 $C2
    add  hl, bc                                   ; $675C: $09
    ld   a, [hl]                                  ; $675D: $7E
    and  a                                        ; $675E: $A7
    jr   z, jr_007_6768                           ; $675F: $28 $07

    and  $80                                      ; $6761: $E6 $80
    jr   z, .jr_6767                              ; $6763: $28 $02

    inc  [hl]                                     ; $6765: $34
    inc  [hl]                                     ; $6766: $34

.jr_6767
    dec  [hl]                                     ; $6767: $35

jr_007_6768:
    call GetEntitySpeedYAddress                   ; $6768: $CD $05 $40
    ld   a, [hl]                                  ; $676B: $7E
    and  a                                        ; $676C: $A7
    jr   z, jr_007_6776                           ; $676D: $28 $07

    and  $80                                      ; $676F: $E6 $80
    jr   z, .jr_6775                              ; $6771: $28 $02

    inc  [hl]                                     ; $6773: $34
    inc  [hl]                                     ; $6774: $34

.jr_6775
    dec  [hl]                                     ; $6775: $35

jr_007_6776:
    call GetEntityDropTimer                       ; $6776: $CD $FB $0B
    jr   nz, .jr_677E                             ; $6779: $20 $03

    call IncrementEntityState                     ; $677B: $CD $12 $3B

.jr_677E
    ld   hl, wEntitiesPrivateState1Table          ; $677E: $21 $B0 $C2
    add  hl, bc                                   ; $6781: $09
    ld   a, [hl]                                  ; $6782: $7E
    and  a                                        ; $6783: $A7
    jr   z, .jr_678D                              ; $6784: $28 $07

    ldh  a, [hFrameCounter]                       ; $6786: $F0 $E7
    and  $1F                                      ; $6788: $E6 $1F
    jr   nz, .jr_678D                             ; $678A: $20 $01

    dec  [hl]                                     ; $678C: $35

.jr_678D
    jp   func_007_67AE                            ; $678D: $C3 $AE $67

func_007_6790::
    ld   hl, wEntitiesPrivateState1Table          ; $6790: $21 $B0 $C2
    add  hl, bc                                   ; $6793: $09
    ld   a, [hl]                                  ; $6794: $7E
    cp   $08                                      ; $6795: $FE $08
    jr   c, .jr_67A7                              ; $6797: $38 $0E

    call GetEntityDropTimer                       ; $6799: $CD $FB $0B
    call GetRandomByte                            ; $679C: $CD $0D $28
    and  $1F                                      ; $679F: $E6 $1F
    add  $80                                      ; $67A1: $C6 $80
    ld   [hl], a                                  ; $67A3: $77
    jp   IncrementEntityState                     ; $67A4: $C3 $12 $3B

.jr_67A7
    ldh  a, [hFrameCounter]                       ; $67A7: $F0 $E7
    and  $0F                                      ; $67A9: $E6 $0F
    jr   nz, func_007_67AE                        ; $67AB: $20 $01

    inc  [hl]                                     ; $67AD: $34

func_007_67AE::
    ld   hl, wEntitiesPrivateState1Table          ; $67AE: $21 $B0 $C2
    add  hl, bc                                   ; $67B1: $09
    ld   a, [hl]                                  ; $67B2: $7E
    ld   hl, wEntitiesInertiaTable                ; $67B3: $21 $D0 $C3
    add  hl, bc                                   ; $67B6: $09
    add  [hl]                                     ; $67B7: $86
    ld   [hl], a                                  ; $67B8: $77
    rra                                           ; $67B9: $1F
    rra                                           ; $67BA: $1F
    rra                                           ; $67BB: $1F
    rra                                           ; $67BC: $1F
    rra                                           ; $67BD: $1F
    and  $01                                      ; $67BE: $E6 $01
    jp   SetEntitySpriteVariant                   ; $67C0: $C3 $0C $3B

Data_007_67C3::
    db   $00, $05, $0A, $0D

Data_007_67C7::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

func_007_67D7::
    call func_007_67AE                            ; $67D7: $CD $AE $67
    ld   hl, wEntitiesPosZTable                   ; $67DA: $21 $10 $C3
    add  hl, bc                                   ; $67DD: $09
    ld   a, [hl]                                  ; $67DE: $7E
    cp   $10                                      ; $67DF: $FE $10
    jr   z, jr_007_67EB                           ; $67E1: $28 $08

    ldh  a, [hFrameCounter]                       ; $67E3: $F0 $E7
    and  $07                                      ; $67E5: $E6 $07
    jr   nz, .ret_67EA                            ; $67E7: $20 $01

    inc  [hl]                                     ; $67E9: $34

.ret_67EA
    ret                                           ; $67EA: $C9

jr_007_67EB:
    call GetEntityDropTimer                       ; $67EB: $CD $FB $0B
    jr   nz, .jr_67F6                             ; $67EE: $20 $06

    ld   [hl], $60                                ; $67F0: $36 $60
    call IncrementEntityState                     ; $67F2: $CD $12 $3B
    ld   [hl], b                                  ; $67F5: $70

.jr_67F6
    ld   hl, wEntitiesPrivateState3Table          ; $67F6: $21 $D0 $C2
    add  hl, bc                                   ; $67F9: $09
    inc  [hl]                                     ; $67FA: $34
    ld   a, [hl]                                  ; $67FB: $7E
    cp   $18                                      ; $67FC: $FE $18
    jr   c, .ret_683D                             ; $67FE: $38 $3D

    ld   [hl], b                                  ; $6800: $70
    ld   hl, wEntitiesPrivateState2Table          ; $6801: $21 $C0 $C2
    add  hl, bc                                   ; $6804: $09
    ld   a, [hl]                                  ; $6805: $7E
    ld   hl, wEntitiesPrivateState4Table          ; $6806: $21 $40 $C4
    add  hl, bc                                   ; $6809: $09
    add  [hl]                                     ; $680A: $86
    and  $0F                                      ; $680B: $E6 $0F
    ld   [hl], a                                  ; $680D: $77
    ld   hl, wEntitiesPrivateState4Table          ; $680E: $21 $40 $C4
    add  hl, bc                                   ; $6811: $09
    ld   e, [hl]                                  ; $6812: $5E
    ld   d, b                                     ; $6813: $50
    ld   hl, Data_007_67C3                        ; $6814: $21 $C3 $67
    add  hl, de                                   ; $6817: $19
    ld   a, [hl]                                  ; $6818: $7E
    sra  a                                        ; $6819: $CB $2F
    call GetEntitySpeedYAddress                   ; $681B: $CD $05 $40
    ld   [hl], a                                  ; $681E: $77
    ld   hl, Data_007_67C7                        ; $681F: $21 $C7 $67
    add  hl, de                                   ; $6822: $19
    ld   a, [hl]                                  ; $6823: $7E
    sra  a                                        ; $6824: $CB $2F
    ld   hl, wEntitiesSpeedXTable                 ; $6826: $21 $40 $C2
    add  hl, bc                                   ; $6829: $09
    ld   [hl], a                                  ; $682A: $77
    call GetRandomByte                            ; $682B: $CD $0D $28
    and  $07                                      ; $682E: $E6 $07
    jr   nz, .ret_683D                            ; $6830: $20 $0B

    call GetRandomByte                            ; $6832: $CD $0D $28
    and  $02                                      ; $6835: $E6 $02
    dec  a                                        ; $6837: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $6838: $21 $C0 $C2
    add  hl, bc                                   ; $683B: $09
    ld   [hl], a                                  ; $683C: $77

.ret_683D
    ret                                           ; $683D: $C9
