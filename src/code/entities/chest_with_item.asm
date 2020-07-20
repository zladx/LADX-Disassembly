
ChestItemSpriteTableAlt::
    db $82, $17        ; CHEST_POWER_BRACELET (in face shrine)
    db $86, $14        ; CHEST_SHIELD (in eagles tower)

ChestItemSpriteTable::
    db $82, $15        ; CHEST_POWER_BRACELET
    db $86, $15        ; CHEST_SHIELD
    db $88, $10        ; CHEST_BOW
    db $8A, $10        ; CHEST_HOOKSHOT
    db $8C, $14        ; CHEST_MAGIC_ROD
    db $98, $16        ; CHEST_PEGASUS_BOOTS
    db $90, $17        ; CHEST_OCARINA
    db $92, $16        ; CHEST_FEATHER
    db $96, $10        ; CHEST_SHOVEL
    db $8E, $10        ; CHEST_MAGIC_POWDER_BAG
    db $80, $15        ; CHEST_BOMB
    db $84, $10        ; CHEST_SWORD
    db $94, $15        ; CHEST_FLIPPERS
    db $9A, $10        ; CHEST_MAGNIFYING_LENS
    db $AE, $10
    db $9C, $10
    db $A0, $14        ; CHEST_MEDICINE
    db $C0, $14        ; CHEST_TAIL_KEY
    db $C2, $14        ; CHEST_ANGLER_KEY
    db $C4, $14        ; CHEST_FACE_KEY
    db $C6, $14        ; CHEST_BIRD_KEY
    db $CA, $14        ; CHEST_GOLD_LEAF
    db $C0, $14        ; CHEST_MAP
    db $C2, $15        ; CHEST_COMPASS
    db $C4, $14        ; CHEST_STONE_BEAK
    db $C6, $14        ; CHEST_NIGHTMARE_KEY
    db $CA, $17        ; CHEST_SMALL_KEY
    db $A6, $15        ; CHEST_RUPEES_50
    db $A6, $15        ; CHEST_RUPEES_20
    db $A6, $15        ; CHEST_RUPEES_100
    db $A6, $15        ; CHEST_RUPEES_200
    db $A6, $15        ; CHEST_RUPEES_500
    db $9E, $14        ; CHEST_SEASHELL

SpitObjectDialog::
    db $90 ; Dialog144
    db $91 ; Dialog145
    db $92 ; Dialog146
    db $93 ; Dialog147
    db $94, $95, $96, $97, $98, $99
    db $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1
    db $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9
    db $AA, $AC, $AB, $AD, $AE, $AE, $EF, $06

Data_007_7BBB::
    db $10, $10, $10, $10, $10, $10, $10, $10
    db $10, $01, $01, $10, $10, $10, $10, $10
    db $01, $10, $10, $10, $10, $10, $01, $01
    db $01, $01, $01, $01, $01, $01, $01, $01
    db $01, $00

; Also used when an object is spit out after a Like-like ate it
ChestWithItemEntityHandler::
    ld   a, $02                                   ; $7BDD: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7BDF: $E0 $A1
    xor  a                                        ; $7BE1: $AF
    ld   [wSwordAnimationState], a                ; $7BE2: $EA $37 $C1
    ld   [wC16A], a                               ; $7BE5: $EA $6A $C1
    ldh  a, [hActiveEntitySpriteVariant]          ; $7BE8: $F0 $F1
    cp   CHEST_GEL                                ; $7BEA: $FE $22
    jr   nz, notGelChest                          ; $7BEC: $20 $3B

    ld   a, ENTITY_GEL                            ; $7BEE: $3E $1B
    call SpawnNewEntity_trampoline                ; $7BF0: $CD $86 $3B
    jp   c, func_007_7EA4                         ; $7BF3: $DA $A4 $7E

    ldh  a, [hScratch0]                           ; $7BF6: $F0 $D7
    ld   hl, wEntitiesPosXTable                         ; $7BF8: $21 $00 $C2
    add  hl, de                                   ; $7BFB: $19
    ld   [hl], a                                  ; $7BFC: $77
    ldh  a, [hScratch1]                           ; $7BFD: $F0 $D8
    ld   hl, wEntitiesPosYTable                         ; $7BFF: $21 $10 $C2
    add  hl, de                                   ; $7C02: $19
    ld   [hl], a                                  ; $7C03: $77
    ld   hl, wEntitiesSpeedZTable                                ; $7C04: $21 $20 $C3
    add  hl, de                                   ; $7C07: $19
    ld   [hl], $18                                ; $7C08: $36 $18
    ld   hl, wEntitiesPosZTable                   ; $7C0A: $21 $10 $C3
    add  hl, de                                   ; $7C0D: $19
    ld   [hl], $06                                ; $7C0E: $36 $06
    ld   hl, wEntitiesPrivateCountdown1Table      ; $7C10: $21 $F0 $C2
    add  hl, de                                   ; $7C13: $19
    ld   [hl], $50                                ; $7C14: $36 $50
    ld   hl, wEntitiesSpeedXTable                 ; $7C16: $21 $40 $C2
    add  hl, de                                   ; $7C19: $19
    ld   [hl], $08                                ; $7C1A: $36 $08
    ld   hl, wEntitiesStateTable                  ; $7C1C: $21 $90 $C2
    add  hl, de                                   ; $7C1F: $19
    ld   [hl], $03                                ; $7C20: $36 $03
    ld   a, JINGLE_WRONG_ANSWER                   ; $7C22: $3E $1D
    ldh  [hJingle], a                             ; $7C24: $E0 $F2
    jp   func_007_7EA4                            ; $7C26: $C3 $A4 $7E

notGelChest:
    cp   CHEST_MESSAGE                            ; $7C29: $FE $21
    jr   z, jr_007_7C5E                           ; $7C2B: $28 $31

    cp   CHEST_MEDICINE                           ; $7C2D: $FE $10
    jr   nz, jr_007_7C36                          ; $7C2F: $20 $05

    ld   a, $01                                   ; $7C31: $3E $01
    ld   [wHasMedicine], a                        ; $7C33: $EA $0D $DB

jr_007_7C36:
    ldh  a, [hIsGBC]                              ; $7C36: $F0 $FE
    and  a                                        ; $7C38: $A7
    jr   z, jr_007_7C58                           ; $7C39: $28 $1D

    ldh  a, [hMapId]                              ; $7C3B: $F0 $F7
    cp   MAP_FACE_SHRINE
    jr   nz, jr_007_7C49                          ; $7C3F: $20 $08

    ldh  a, [hMapRoom]                            ; $7C41: $F0 $F6
    cp   $CE                     ; @TODO ?? L2 power bracelet chest in Face Shrine?
    jr   nz, jr_007_7C58         ; maybe related to incrementing an item level

    jr   jr_007_7C53                              ; $7C47: $18 $0A

jr_007_7C49:
    cp   MAP_EAGLES_TOWER
    jr   nz, jr_007_7C58                          ; $7C4B: $20 $0B

    ldh  a, [hMapRoom]                            ; $7C4D: $F0 $F6
    cp   $1A                     ; @TODO ?? L2 shield in Eagle's Tower?
    jr   nz, jr_007_7C58                          ; $7C51: $20 $05

jr_007_7C53:
    ld   de, ChestItemSpriteTableAlt                        ; $7C53: $11 $53 $7B
    jr   jr_007_7C5B                              ; $7C56: $18 $03

jr_007_7C58:
    ld   de, ChestItemSpriteTable                 ; $7C58: $11 $57 $7B

jr_007_7C5B:
    call RenderActiveEntitySprite                 ; $7C5B: $CD $77 $3C

jr_007_7C5E:
    ld   a, [wDialogState]                        ; $7C5E: $FA $9F $C1
    and  a                                        ; $7C61: $A7
    ret  nz                                       ; $7C62: $C0

    call UpdateEntityPosWithSpeed_07              ; $7C63: $CD $0A $7E
    ld   hl, wEntitiesUnknowTableY                ; $7C66: $21 $D0 $C3
    add  hl, bc                                   ; $7C69: $09
    ld   a, [hl]                                  ; $7C6A: $7E
    inc  a                                        ; $7C6B: $3C
    ld   [hl], a                                  ; $7C6C: $77
    cp   $10                                      ; $7C6D: $FE $10
    jr   nz, jr_007_7C76                          ; $7C6F: $20 $05

    call GetEntitySpeedYAddress                            ; $7C71: $CD $05 $40
    ld   [hl], $00                                ; $7C74: $36 $00

jr_007_7C76:
    cp   $08                                      ; $7C76: $FE $08
    jr   nz, jr_007_7C93                          ; $7C78: $20 $19

    ldh  a, [hActiveEntitySpriteVariant]          ; $7C7A: $F0 $F1
    ld   e, a                                     ; $7C7C: $5F
    ld   d, b                                     ; $7C7D: $50
    ld   hl, Data_007_7BBB                        ; $7C7E: $21 $BB $7B
    add  hl, de                                   ; $7C81: $19
    ld   a, [hl]                                  ; $7C82: $7E
    and  a                                        ; $7C83: $A7
    jr   z, jr_007_7C93                           ; $7C84: $28 $0D

    cp   $01                                      ; $7C86: $FE $01
    jr   nz, jr_007_7C90                          ; $7C88: $20 $06

    ld   a, JINGLE_TREASURE_FOUND                 ; $7C8A: $3E $01
    ldh  [hJingle], a                             ; $7C8C: $E0 $F2
    jr   jr_007_7C93                              ; $7C8E: $18 $03

jr_007_7C90:
    ld   [wMusicTrackToPlay], a                   ; $7C90: $EA $68 $D3

jr_007_7C93:
    ld   hl, wEntitiesUnknowTableY                ; $7C93: $21 $D0 $C3
    add  hl, bc                                   ; $7C96: $09
    ld   a, [hl]                                  ; $7C97: $7E
    cp   $26                                      ; $7C98: $FE $26
    jr   nz, jr_007_7CEA                          ; $7C9A: $20 $4E

    ldh  a, [hActiveEntitySpriteVariant]               ; $7C9C: $F0 $F1
    ld   e, a                                     ; $7C9E: $5F
    ld   d, b                                     ; $7C9F: $50
    cp   CHEST_MESSAGE                            ; $7CA0: $FE $21
    jr   nz, jr_007_7CB1                          ; $7CA2: $20 $0D

    ldh  a, [hMapRoom]                            ; $7CA4: $F0 $F6
    cp   $96                             ; @TODO Master Stalfos "screw you" letter chest?
    jr   nz, jr_007_7CB1                          ; $7CA8: $20 $07

    call_open_dialog $111                         ; $7CAA
    jr   jr_007_7CE9                              ; $7CAF: $18 $38

jr_007_7CB1:
    ld   a, e                                     ; $7CB1: $7B
    cp   CHEST_SHIELD                             ; $7CB2: $FE $01
    jr   nz, jr_007_7CC1                          ; $7CB4: $20 $0B

    ld   a, [wShieldLevel]                        ; $7CB6: $FA $44 $DB
    cp   $02                                      ; $7CB9: $FE $02
    jr   nz, jr_007_7CC1                          ; $7CBB: $20 $04

    ld   a, $ED                                   ; $7CBD: $3E $ED
    jr   jr_007_7CE6                              ; $7CBF: $18 $25

jr_007_7CC1:
    ld   a, e                                     ; $7CC1: $7B
    cp   CHEST_SWORD                              ; $7CC2: $FE $0B
    jr   nz, jr_007_7CD1                          ; $7CC4: $20 $0B

    ld   a, [wSwordLevel]                ; @TODO ??? Is this used by the Seashell Mansion??
    cp   $02                                      ; $7CC9: $FE $02
    jr   nz, jr_007_7CD1                          ; $7CCB: $20 $04

    ld   a, $9F                                   ; $7CCD: $3E $9F
    jr   jr_007_7CE6                              ; $7CCF: $18 $15

jr_007_7CD1:
    ld   a, e                                     ; $7CD1: $7B
    cp   CHEST_POWER_BRACELET                     ; $7CD2: $FE $00
    jr   nz, jr_007_7CE1                          ; $7CD4: $20 $0B

    ld   a, [wPowerBraceletLevel]                 ; $7CD6: $FA $43 $DB
    cp   $02                                      ; $7CD9: $FE $02
    jr   nz, jr_007_7CE1                          ; $7CDB: $20 $04

    ld   a, $EE                                   ; $7CDD: $3E $EE
    jr   jr_007_7CE6                              ; $7CDF: $18 $05

jr_007_7CE1:
    ld   hl, SpitObjectDialog                     ; $7CE1: $21 $99 $7B
    add  hl, de                                   ; $7CE4: $19
    ld   a, [hl]                                  ; $7CE5: $7E

jr_007_7CE6:
    call OpenDialog                               ; $7CE6: $CD $85 $23

jr_007_7CE9:
    xor  a                                        ; $7CE9: $AF

jr_007_7CEA:
    cp   $28                                      ; $7CEA: $FE $28
    ret  nz                                       ; $7CEC: $C0

    jp   func_007_7EA4                            ; $7CED: $C3 $A4 $7E
