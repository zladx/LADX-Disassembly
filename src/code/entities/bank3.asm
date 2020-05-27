; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Array of wEntitiesUnknowTableH, indexed by entity index
Data_003_42F1::
    db   $12, $12, $0A, $12, $12, $0A, $02, $02   ; $42F1
    db   $02, $08, $12, $08, $12, $08, $00, $40   ; $42F9
    db   $11, $11, $11, $00, $08, $12, $12, $12   ; $4301
    db   $08, $11, $08, $08, $08, $10, $08, $08   ; $4309
    db   $08, $08, $12, $08, $08, $08, $08, $52   ; $4311
    db   $08, $08, $0A, $12, $08, $0A, $0A, $13   ; $4319
    db   $0A, $0A, $0A, $0A, $0A, $0A, $08, $0A   ; $4321
    db   $0A, $08, $0A, $0A, $1B, $1A, $02, $02   ; $4329
    db   $02, $02, $02, $02, $02, $42, $02, $02   ; $4331
    db   $02, $02, $42, $02, $12, $00, $02, $02   ; $4339
    db   $30, $08, $02, $02, $02, $08, $08, $08   ; $4341
    db   $12, $D0, $90, $90, $D0, $90, $D4, $84   ; $4349
    db   $D4, $02, $D0, $90, $02, $80, $02, $42   ; $4351
    db   $12, $02, $02, $02, $02, $43, $00, $00   ; $4359
    db   $00, $00, $00, $00, $00, $00, $00, $00   ; $4361
    db   $00, $00, $20, $00, $02, $02, $02, $40   ; $4369
    db   $00, $84, $40, $00, $00, $00, $02, $84   ; $4371
    db   $C4, $94, $00, $00, $00, $00, $84, $00   ; $4379
    db   $00, $00, $C4, $10, $00, $00, $00, $00   ; $4381
    db   $00, $10, $00, $00, $00, $42, $02, $00   ; $4389
    db   $00, $00, $00, $02, $02, $02, $02, $42   ; $4391
    db   $42, $00, $10, $10, $08, $18, $00, $13   ; $4399
    db   $00, $12, $00, $02, $02, $02, $02, $02   ; $43A1
    db   $02, $00, $01, $00, $84, $11, $84, $00   ; $43A9
    db   $00, $03, $02, $02, $02, $02, $02, $02   ; $43B1
    db   $02, $02, $02, $02, $02, $02, $02, $02   ; $43B9
    db   $00, $00, $00, $00, $00, $03, $02, $42   ; $43C1
    db   $42, $02, $02, $02, $02, $02, $02, $12   ; $43C9
    db   $02, $02, $02, $02, $00, $02, $00, $02   ; $43D1
    db   $02, $00, $00, $00, $00, $00, $00, $00   ; $43D9
    db   $00, $00, $04, $04, $94, $42, $00, $00   ; $43E1
    db   $94, $90, $12                            ; $43E9

; Indexed by wEntitiesHealthGroup, 16 bytes per entry, sub indexed by damage type ($C19E)
; $00-$03) sword, sword level add +1, spin attack adds +1, pegasus boots adds +1, piece of power OR damage tunic adds +1 (tunic makes piece of power useless)
; $01) See above, and sword beam has a fixed value of $01
; $04) ??
; $05) bow
; $06) hookshot
; $07) bomb
; $08) boomerang
; $09) magic powder
; $0A) magic rod
; $0B) hit with thrown object
; $0C) Seems to be set at the bomb arrow, but can never seem to trigger it (always get $07)
; $0D) ??
; $0E) ??
; $0F) ??
Data_003_43EC::
    db   $01, $01, $01, $00, $00, $01, $02, $01, $02, $03, $03, $02, $00, $00, $00, $00   ; $43F4
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $03, $03, $02, $00, $00, $00, $00   ; $4404
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $01, $03, $02, $00, $00, $00, $00   ; $4414
    db   $01, $01, $01, $00, $00, $02, $01, $02, $01, $01, $03, $02, $00, $00, $00, $00   ; $4424
    db   $00, $03, $03, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $00, $00   ; $4434
    db   $00, $00, $03, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $00, $00   ; $4444
    db   $00, $00, $00, $00, $00, $00, $00, $00, $02, $03, $00, $00, $00, $00, $00, $00   ; $4454
    db   $00, $00, $00, $00, $00, $01, $03, $01, $02, $03, $01, $01, $00, $00, $00, $00   ; $4464
    db   $00, $00, $00, $00, $00, $03, $01, $02, $04, $00, $00, $01, $00, $00, $00, $00   ; $4474
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; $4484
    db   $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $03, $01, $00, $00, $00, $00   ; $4494
    db   $00, $00, $00, $00, $00, $00, $01, $03, $01, $00, $00, $00, $00, $00, $00, $00   ; $44A4
    db   $00, $00, $00, $00, $00, $01, $01, $03, $01, $01, $01, $03, $00, $00, $00, $00   ; $44B4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; $44C4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; $44D4
    db   $01, $01, $01, $01, $01, $02, $01, $02, $02, $02, $03, $03, $00, $00, $00, $00   ; $44E4
    db   $00, $00, $00, $00, $00, $02, $02, $02, $04, $00, $01, $02, $00, $00, $00, $00   ; $44F4
    db   $01, $02, $02, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00   ; $4504
    db   $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00   ; $4514
    db   $01, $01, $01, $01, $02, $02, $02, $02, $02, $00, $02, $02, $00, $00, $00, $00   ; $4524
    db   $01, $01, $01, $01, $02, $02, $02, $02, $04, $00, $02, $02, $00, $00, $00, $00   ; $4534
    db   $00, $01, $01, $01, $02, $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ; $4544
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ; $4554
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ; $4564
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; $4574
    db   $01, $01, $01, $01, $01, $00, $00, $02, $00, $00, $02, $02, $00, $00, $00, $00   ; $4584
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00   ; $4594
    db   $01, $01, $01, $01, $01, $01, $00, $02, $00, $00, $01, $00, $00, $00, $00, $00   ; $45A4
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ; $45B4
    db   $01, $01, $01, $01, $01, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00   ; $45C4
    db   $01, $01, $01, $01, $01, $01, $02, $02, $00, $00, $02, $00, $00, $00, $00, $00   ; $45D4
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00   ; $45E4
    db   $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $02, $01, $00, $00, $00, $00   ; $45F4
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ; $4604
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ; $4614
    db   $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00   ; $4624
    db   $01, $01, $01, $01, $01, $01, $01, $02, $01, $00, $03, $00, $00, $00, $00, $00   ; $4634
    db   $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $02, $00, $00, $00, $00   ; $4644
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ; $4654
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ; $4664
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; $4674
    db   $00, $00, $01, $01, $01, $00, $02, $00, $02, $00, $03, $00, $00, $00, $00, $00   ; $4684
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $00, $00, $02, $00, $00, $00, $00   ; $4694
    db   $01, $01, $01, $00, $00, $02, $00, $00, $05, $02, $03, $03, $00, $00, $00, $00   ; $46A4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00   ; $46B4
    db   $01, $01, $01, $01, $01, $01, $02, $01, $04, $00, $01, $02, $00, $00, $00, $00   ; $46C4
    db   $00, $00, $00, $00, $00, $00, $00, $02, $04, $00, $02, $02, $00, $00, $00, $00   ; $46D4
    db   $01, $01, $01, $01, $01, $01, $01, $02, $04, $00, $03, $02, $00, $00, $00, $00   ; $46E4
    db   $01, $01, $01, $01, $01, $02, $02, $01, $01, $00, $03, $02, $00, $00, $00, $00   ; $46F4
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $00, $06, $06, $00, $00, $00, $00   ; $4704
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ; $4714
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ; $4724
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ; $4734


; Indexed by entry from above table + damage type ($C19E) * 8
; Amount of damage done, unless >= $F0, then special action, and $00 is damage is ignored
; $FF = stun, $FE = burn, $FD = turn into fairy ($F0-$FC seem to do nothing)
Data_003_473C::
    db   $00, $01, $02, $40, $00, $00, $FF, $00 ; sword (basic)
    db   $00, $02, $01, $40, $00, $00, $FF, $00 ; sword (+1)
    db   $00, $04, $02, $40, $00, $00, $FF, $00 ; sword (+2)
    db   $00, $08, $04, $40, $00, $00, $FF, $00 ; sword (+3)
    db   $00, $10, $08, $40, $00, $00, $FF, $00 ; ??
    db   $00, $01, $04, $40, $00, $00, $FF, $00 ; bow
    db   $00, $FF, $02, $40, $00, $00, $FF, $00 ; hookshot
    db   $00, $01, $04, $40, $00, $00, $FF, $00 ; bomb
    db   $00, $FF, $18, $FE, $02, $FD, $FF, $00 ; boomerang
    db   $00, $FF, $FD, $FE, $00, $00, $02, $00 ; magic powder
    db   $00, $01, $04, $FE, $00, $00, $FF, $00 ; magic rod
    db   $00, $FF, $02, $40, $00, $00, $FF, $00 ; thrown object
    db   $00, $01, $02, $40, $00, $00, $FF, $00 ; bomb arrow (unused?)
    db   $00, $01, $02, $40, $00, $00, $FF, $00 ; ??
    db   $00, $01, $02, $40, $00, $00, $FF, $00 ; ??
    db   $00, $01, $02, $40, $00, $00, $FF, $00 ; ??

include "data/entities/health.asm"
include "data/entities/damages.asm"

Data_003_4826::
    db   $02, $06, $01, $03, $03, $03, $0D, $08, $0A, $02, $07, $0B, $00, $04, $00, $08
    db   $04, $0E, $0E, $0E, $0E, $0E, $00, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db   $03, $02, $00, $00, $02, $00, $00, $00, $00, $06, $06, $0D, $0E, $00, $09, $03
    db   $06, $00, $02, $0E, $0E

; Configure a newly created entity: load health, flags, and so on.
;
; Inputs:
;   bc   entity index
ConfigureNewEntity::
    call ResetEntity_trampoline                   ; $485B: $CD $0A $3A

    ; Store the entity room id
    ldh  a, [hMapRoom]                            ; $485E: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $4860: $21 $E0 $C3
    add  hl, bc                                   ; $4863: $09
    ld   [hl], a                                  ; $4864: $77

    ; Set the entity load order to a default value
    ld   hl, wEntitiesLoadOrderTable              ; $4865: $21 $60 $C4
    add  hl, bc                                   ; $4868: $09
    ld   [hl], $FF                                ; $4869: $36 $FF

.attributes
    ; de = entity type
    ld   hl, wEntitiesTypeTable                   ; $486B: $21 $A0 $C3
    add  hl, bc                                   ; $486E: $09
    ld   e, [hl]                                  ; $486F: $5E
    ld   d, b                                     ; $4870: $50

    ; wEntitiesPhysicsFlagsTable = PhysicsFlagsForEntity[EntityType]
    ld   hl, PhysicsFlagsForEntity                        ; $4871: $21 $00 $40
    add  hl, de                                   ; $4874: $19
    ld   a, [hl]                                  ; $4875: $7E
    ld   hl, wEntitiesPhysicsFlagsTable                ; $4876: $21 $40 $C3
    add  hl, bc                                   ; $4879: $09
    ld   [hl], a                                  ; $487A: $77

    ; wEntitiesHitboxFlagsTable = HitboxFlagsForEntity[EntityType]
    ld   hl, HitboxFlagsForEntity                 ; $487B: $21 $FB $40
    add  hl, de                                   ; $487E: $19
    ld   a, [hl]                                  ; $487F: $7E
    ld   hl, wEntitiesHitboxFlagsTable            ; $4880: $21 $50 $C3
    add  hl, bc                                   ; $4883: $09
    ld   [hl], a                                  ; $4884: $77

    call ConfigureEntityHealth                    ; $4885: $CD $95 $48

    ld   hl, Data_003_42F1                        ; $4888: $21 $F1 $42
    add  hl, de                                   ; $488B: $19
    ld   a, [hl]                                  ; $488C: $7E
    ld   hl, wEntitiesUnknowTableH                ; $488D: $21 $30 $C4
    add  hl, bc                                   ; $4890: $09
    ld   [hl], a                                  ; $4891: $77
    jp   ConfigureEntityHitbox                    ; $4892: $C3 $EA $3A

ConfigureEntityHealth::
    push de                                       ; $4895: $D5
    ; e = HealthGroupForEntity[entity index]
    ld   hl, HealthGroupForEntity                 ; $4896: $21 $F6 $41
    add  hl, de                                   ; $4899: $19
    ld   e, [hl]                                  ; $489A: $5E
    ; wEntitiesHealthGroup[entity index] = e
    ld   hl, wEntitiesHealthGroup                 ; $489B: $21 $D0 $C4
    add  hl, bc                                   ; $489E: $09
    ld   [hl], e                                  ; $489F: $73
    ; a = InitialHealthForGroup[health group]
    ld   d, b                                     ; $48A0: $50
    ld   hl, InitialHealthForGroup                ; $48A1: $21 $BC $47
    add  hl, de                                   ; $48A4: $19
    ld   a, [hl]                                  ; $48A5: $7E
    ; wEntitiesHealthTable[entity index] = a
    ld   hl, wEntitiesHealthTable                 ; $48A6: $21 $60 $C3
    add  hl, bc                                   ; $48A9: $09
    ld   [hl], a                                  ; $48AA: $77
    pop  de                                       ; $48AB: $D1
    ret                                           ; $48AC: $C9

MasterStalfosDefeated:
    ld   a, $01                                   ; $48AD: $3E $01
    ld   [wRoomEventEffectExecuted], a            ; $48AF: $EA $8F $C1
    jp   UnloadEntityAndReturn                    ; $48B2: $C3 $8D $3F

EntityInitHandler::
    ld   hl, wEntitiesUnknowTableH                ; $48B5: $21 $30 $C4
    add  hl, bc                                   ; $48B8: $09
    ld   a, [hl]                                  ; $48B9: $7E
    and  $80                                      ; $48BA: $E6 $80
    jr   z, .callEntityInitHandler                           ; $48BC: $28 $5


    ; If the room status is $30, don't load the entity.
    ldh  a, [hRoomStatus]                         ; $48BE: $F0 $F8
    and  $30                                      ; $48C0: $E6 $30
    jr   z, .roomStatusEnd                        ; $48C2: $28 $03
    jp   UnloadEntityAndReturn                    ; $48C4: $C3 $8D $3F
.roomStatusEnd

    ;
    ; Special case for Master Stalfos
    ;

    ldh  a, [hActiveEntityType]                   ; $48C7: $F0 $EB
    cp   ENTITY_MASTER_STALFOS                    ; $48C9: $FE $5F
    jr   nz, .masterStalfosEnd                    ; $48CB: $20 $23

    ldh  a, [hMapRoom]                            ; $48CD: $F0 $F6
    cp   $95                                      ; $48CF: $FE $95
    jr   z, .masterStalfosEnd                     ; $48D1: $28 $1D

    cp   $92                                      ; $48D3: $FE $92
    jr   z, .masterStalfosEnd                     ; $48D5: $28 $19

    cp   $84                                      ; $48D7: $FE $84
    jr   z, .jr_003_48E2                          ; $48D9: $28 $07

    ld   a, [wIndoorARoomStatus + $84]                               ; $48DB: $FA $84 $D9
    and  $30                                      ; $48DE: $E6 $30
    jr   z, MasterStalfosDefeated                 ; $48E0: $28 $CB

.jr_003_48E2
    ld   a, [wIndoorARoomStatus + $92]                               ; $48E2: $FA $92 $D9
    and  $30                                      ; $48E5: $E6 $30
    jr   z, MasterStalfosDefeated                 ; $48E7: $28 $C4

    ld   a, [wIndoorARoomStatus + $95]                               ; $48E9: $FA $95 $D9
    and  $30                                      ; $48EC: $E6 $30
    jr   z, MasterStalfosDefeated                 ; $48EE: $28 $BD
.masterStalfosEnd

    ld   a, [wIsIndoor]                           ; $48F0: $FA $A5 $DB
    and  a                                        ; $48F3: $A7
    jr   z, .indoorEnd                            ; $48F4: $28 $12

    ld   a, [$D478]                               ; $48F6: $FA $78 $D4
    and  a                                        ; $48F9: $A7
    jr   nz, .jr_003_490B                         ; $48FA: $20 $0F

    ld   hl, wEntitiesUnknowTableH                ; $48FC: $21 $30 $C4
    add  hl, bc                                   ; $48FF: $09
    ld   a, [hl]                                  ; $4900: $7E
    and  $04                                      ; $4901: $E6 $04
    jr   z, .indoorEnd                            ; $4903: $28 $03

    ld   [$C1CF], a                               ; $4905: $EA $CF $C1
.indoorEnd

    call label_27F2                               ; $4908: $CD $F2 $27

.jr_003_490B
    xor  a                                        ; $490B: $AF
    ld   [wDidBossIntro], a                       ; $490C: $EA $BD $C1
    inc  a                                        ; $490F: $3C
    ld   [wInBossBattle], a                       ; $4910: $EA $BE $C1
    ld   a, $20                                   ; $4913: $3E $20
    ld   [wBossIntroDelay], a                     ; $4915: $EA $65 $C1

.callEntityInitHandler

    ; Mark the entity as active
    ld   hl, wEntitiesStatusTable                 ; $4918: $21 $80 $C2
    add  hl, bc                                   ; $491B: $09
    ld   [hl], ENTITY_STATUS_ACTIVE               ; $491C: $36 $05

    ld   a, BANK(@)                               ; $491E: $3E $03
    call GetEntityInitHandler_trampoline          ; $4920: $CD $D3 $09
    jp   hl                                       ; $4923: $E9

Data_003_4924::
    db   $01, $04

EntityInitHorsePiece::
    ld   hl, wEntitiesLoadOrderTable              ; $4926: $21 $60 $C4
    add  hl, bc                                   ; $4929: $09
    ld   e, [hl]                                  ; $492A: $5E
    ld   d, b                                     ; $492B: $50

    ld   hl, Data_003_4924                        ; $492C: $21 $24 $49
    add  hl, de                                   ; $492F: $19
    ld   a, [hl]                                  ; $4930: $7E
    jp   SetEntitySpriteVariant                   ; $4931: $C3 $0C $3B

EntityInitMarinAtTalTalHeights::
    ld   hl, wEntitiesPosYTable                   ; $4934: $21 $10 $C2
    add  hl, bc                                   ; $4937: $09
    ld   a, [hl]                                  ; $4938: $7E
    sub  $03                                      ; $4939: $D6 $03
    ld   [hl], a                                  ; $493B: $77
    ret                                           ; $493C: $C9

EntityInitSnake::
    call GetEntityPrivateCountdown1               ; $493D: $CD $00 $0C
    ld   [hl], $30                                ; $4940: $36 $30
    ret                                           ; $4942: $C9

EntityInitSideViewPlatformVertical::
    ldh  a, [hMapRoom]                            ; $4943: $F0 $F6
    cp   $65                                      ; $4945: $FE $65
    ret  nz                                       ; $4947: $C0

    ldh  a, [hActiveEntityVisualPosY]             ; $4948: $F0 $EC
    cp   $50                                      ; $494A: $FE $50
    ret  c                                        ; $494C: $D8

    ld   hl, wEntitiesPrivateState1Table          ; $494D: $21 $B0 $C2
    add  hl, bc                                   ; $4950: $09
    inc  [hl]                                     ; $4951: $34
    ret                                           ; $4952: $C9

EntityInitGel::
    ld   hl, wEntitiesHealthTable                 ; $4953: $21 $60 $C3
    add  hl, bc                                   ; $4956: $09
    ld   [hl], $02                                ; $4957: $36 $02
    ret                                           ; $4959: $C9

EntityInitMarinAtTheShore::
    ld   hl, $DB74                                ; $495A: $21 $74 $DB
    ld   a, [wIsMarinFollowingLink]               ; $495D: $FA $73 $DB
    or   [hl]                                     ; $4960: $B6
    jp   nz, UnloadEntityAndReturn                ; $4961: $C2 $8D $3F

    ret                                           ; $4964: $C9

EntityInitBomber::
    ld   hl, wEntitiesPosZTable                   ; $4965: $21 $10 $C3
    add  hl, bc                                   ; $4968: $09
    ld   [hl], $10                                ; $4969: $36 $10
    call GetRandomByte                            ; $496B: $CD $0D $28
    ld   hl, wEntitiesUnknowTableY                ; $496E: $21 $D0 $C3
    add  hl, bc                                   ; $4971: $09
    ld   [hl], a                                  ; $4972: $77

EntityInitBushCrawler::
    ret                                           ; $4973: $C9

EntityInitTarin::
    call EntityShiftPosition                      ; $4974: $CD $83 $4F
    ld   a, $02                                   ; $4977: $3E $02
    jp   SetEntitySpriteVariant                   ; $4979: $C3 $0C $3B

EntityInitTelephone::
    ld   a, MUSIC_PHONE_BOOTH                     ; $497C: $3E $33
    jr   SetMusicTrackIfHasSword                  ; $497E: $18 $15

EntityInitRichard::
    ld   a, [wGoldenLeavesCount]                  ; $4980: $FA $15 $DB
    cp   $06                                      ; $4983: $FE $06
    jr   c, .jr_003_4993                          ; $4985: $38 $0C

    ld   hl, wEntitiesPosXTable                   ; $4987: $21 $00 $C2
    add  hl, bc                                   ; $498A: $09
    ld   [hl], $58                                ; $498B: $36 $58
    ld   hl, wEntitiesDirectionTable              ; $498D: $21 $80 $C3
    add  hl, bc                                   ; $4990: $09
    ld   [hl], DIRECTION_DOWN                     ; $4991: $36 $03
.jr_003_4993

    ld   a, MUSIC_RICHARD_MANSION                 ; $4993: $3E $40
    ; fallthrough

SetMusicTrackIfHasSword::
    ld   e, a                                     ; $4995: $5F
    ld   a, [wSwordLevel]                         ; $4996: $FA $4E $DB
    and  a                                        ; $4999: $A7
    ret  z                                        ; $499A: $C8

    ld   a, e                                     ; $499B: $7B

SetMusicTrack::
    ld   [wMusicTrackToPlay], a                   ; $499C: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $499F: $E0 $B0
    ldh  [$FFBD], a                               ; $49A1: $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ; $49A3: $E0 $BF
    ret                                           ; $49A5: $C9

EntityInitFinalNightmare::
    xor  a                                        ; $49A6: $AF
    ld   [wFinalNightmareForm], a                 ; $49A7: $EA $19 $D2
    jp   label_27F2                               ; $49AA: $C3 $F2 $27

EntityInitDreamShrineBed::
    ld   a, MUSIC_DREAM_SHRINE_BED                ; $49AD: $3E $24
    jr   SetMusicTrack                            ; $49AF: $18 $EB

EntityInitFishermanUnderBridge::
    ld   a, MUSIC_FISHING_UNDER_BRIDGE            ; $49B1: $3E $3A
    jr   SetMusicTrack                            ; $49B3: $18 $E7

EntityInitKikiTheMonkey::
    xor  a                                        ; $49B5: $AF
    ld   [wC168], a                               ; $49B6: $EA $68 $C1

    ld   hl, wEntitiesPosYTable                   ; $49B9: $21 $10 $C2
    add  hl, bc                                   ; $49BC: $09
    ld   a, [hl]                                  ; $49BD: $7E
    sub  $04                                      ; $49BE: $D6 $04
    ld   [hl], a                                  ; $49C0: $77

    ret                                           ; $49C1: $C9

EntityInitFireballShooter::
    call GetRandomByte                            ; $49C2: $CD $0D $28
    jp   SetEntitySpriteVariant                   ; $49C5: $C3 $0C $3B

EntityInitAntiKirby::
    call GetEntityDropTimer                       ; $49C8: $CD $FB $0B
    call GetRandomByte                            ; $49CB: $CD $0D $28
    and  $3F                                      ; $49CE: $E6 $3F
    add  $10                                      ; $49D0: $C6 $10
    ld   [hl], a                                  ; $49D2: $77
    ret                                           ; $49D3: $C9

EntityInitMovingBlockMover::
    ld   hl, wEntitiesPosYTable                   ; $49D4: $21 $10 $C2
    add  hl, bc                                   ; $49D7: $09
    ld   a, [hl]                                  ; $49D8: $7E
    add  $0A                                      ; $49D9: $C6 $0A
    ld   [hl], a                                  ; $49DB: $77
    ld   hl, wEntitiesPrivateState2Table          ; $49DC: $21 $C0 $C2
    add  hl, bc                                   ; $49DF: $09
    ld   [hl], a                                  ; $49E0: $77
    ret                                           ; $49E1: $C9

EntityInitDesertLanmola::
    ; Sets MUSIC_NONE as the default music track. weird...
    xor  a                                        ; $49E2: $AF
    ldh  [hDefaultMusicTrack], a                  ; $49E3: $E0 $B0
    ret                                           ; $49E5: $C9

EntityInitFloatingItem2::
    call SetZPosForFloatingItem                   ; $49E6: $CD $12 $4A
    ldh  a, [hActiveEntityPosX]                   ; $49E9: $F0 $EE
    swap a                                        ; $49EB: $CB $37
    and  $01                                      ; $49ED: $E6 $01
    add  $04                                      ; $49EF: $C6 $04
    jp   SetEntitySpriteVariant                   ; $49F1: $C3 $0C $3B

EntityInitFloatingItem::
    ldh  a, [hActiveEntityPosX]                   ; $49F4: $F0 $EE
    swap a                                        ; $49F6: $CB $37
    and  $01                                      ; $49F8: $E6 $01
    ld   e, a                                     ; $49FA: $5F
    ldh  a, [hActiveEntityPosY]                   ; $49FB: $F0 $EF
    swap a                                        ; $49FD: $CB $37
    inc  a                                        ; $49FF: $3C
    rla                                           ; $4A00: $17
    and  $02                                      ; $4A01: $E6 $02
    or   e                                        ; $4A03: $B3
    call SetEntitySpriteVariant                   ; $4A04: $CD $0C $3B
    cp   $01                                      ; $4A07: $FE $01
    jr   nz, SetZPosForFloatingItem               ; $4A09: $20 $07

    ld   a, [wHasToadstool]                       ; $4A0B: $FA $4B $DB
    and  a                                        ; $4A0E: $A7
    jp   nz, UnloadEntityAndReturn                ; $4A0F: $C2 $8D $3F

SetZPosForFloatingItem::
    ld   hl, wEntitiesPosZTable                   ; $4A12: $21 $10 $C3
    add  hl, bc                                   ; $4A15: $09
    ld   [hl], $13                                ; $4A16: $36 $13
    ret                                           ; $4A18: $C9

EntityInitKid71::
    ld   hl, wEntitiesDirectionTable              ; $4A19: $21 $80 $C3
    add  hl, bc                                   ; $4A1C: $09
    ld   [hl], DIRECTION_UP                       ; $4A1D: $36 $02
    call IncrementEntityState                     ; $4A1F: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $4A22: $CD $05 $0C
    ld   [hl], $20                                ; $4A25: $36 $20

EntityInitKid72::
    ret                                           ; $4A27: $C9

EntityInitMrWrite::
    ldh  a, [hMapRoom]                            ; $4A28: $F0 $F6
    cp   $D9                                      ; $4A2A: $FE $D9
    ld   a, $32                                   ; $4A2C: $3E $32
    jr   nz, jr_003_4A32                          ; $4A2E: $20 $02

    ld   a, $37                                   ; $4A30: $3E $37

jr_003_4A32:
    jr   jr_003_4A4F                              ; $4A32: $18 $1B

EntityInitBigFairy::
    ld   hl, wEntitiesPosZTable                   ; $4A34: $21 $10 $C3
    add  hl, bc                                   ; $4A37: $09
    ld   [hl], $10                                ; $4A38: $36 $10

    ld   a, [wIsIndoor]                           ; $4A3A: $FA $A5 $DB
    and  a                                        ; $4A3D: $A7
    jr   z, .indoorEnd                            ; $4A3E: $28 $06

    ldh  a, [hMapId]                              ; $4A40: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $4A42: $FE $FF
    jr   z, jr_003_4A4D                           ; $4A44: $28 $07
.indoorEnd

    ld   a, [$C5A9]                               ; $4A46: $FA $A9 $C5
    and  a                                        ; $4A49: $A7
    jp   nz, UnloadEntityAndReturn                ; $4A4A: $C2 $8D $3F

jr_003_4A4D:
    ld   a, $0C                                   ; $4A4D: $3E $0C

jr_003_4A4F:
    call SetMusicTrackIfHasSword                  ; $4A4F: $CD $95 $49
    ld   de, wEntitiesPosXSignTable               ; $4A52: $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ; $4A55: $21 $00 $C2
    jp   EntityShiftPosition.shiftBy8             ; $4A58: $C3 $92 $4F

EntityInitBowWow::
    ldh  a, [hMapRoom]                            ; $4A5B: $F0 $F6
    cp   $E2                                      ; $4A5D: $FE $E2
    jr   nz, jr_003_4A6B                          ; $4A5F: $20 $0A

    ld   a, [wIsBowWowFollowingLink]              ; $4A61: $FA $56 $DB
    cp   $80                                      ; $4A64: $FE $80
    jr   z, jr_003_4A72                           ; $4A66: $28 $0A

    jp   UnloadEntityAndReturn                    ; $4A68: $C3 $8D $3F

jr_003_4A6B:
    ld   a, [wIsBowWowFollowingLink]              ; $4A6B: $FA $56 $DB
    and  a                                        ; $4A6E: $A7
    jp   nz, UnloadEntityAndReturn                ; $4A6F: $C2 $8D $3F

jr_003_4A72:
    ret                                           ; $4A72: $C9

EntityInitOwlEvent::
    ; Unload the owl if the event already played once
    ldh  a, [hRoomStatus]                         ; $4A73: $F0 $F8
    rra                                           ; $4A75: $1F
    jr   UnloadEntityIfRoomStatusSet              ; $4A76: $18 $02

EntityInitSword::
    ; Unload the sword if it was already picked
    ldh  a, [hRoomStatus]                         ; $4A78: $F0 $F8
    ; fallthrough

UnloadEntityIfRoomStatusSet::
    and  $10                                      ; $4A7A: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $4A7C: $C2 $8D $3F

    ret                                           ; $4A7F: $C9

EntityInitMarin::
    ldh  a, [hMapRoom]                            ; $4A80: $F0 $F6
    cp   $C0                                      ; $4A82: $FE $C0
    jr   c, .mabeWeatherVaneEnd                   ; $4A84: $38 $1D

    ld   a, [$DB74]                               ; $4A86: $FA $74 $DB
    and  a                                        ; $4A89: $A7
    jp   z, UnloadEntityAndReturn                 ; $4A8A: $CA $8D $3F

    ld   a, [wIsMarinFollowingLink]               ; $4A8D: $FA $73 $DB
    and  a                                        ; $4A90: $A7
    jp   nz, UnloadEntityAndReturn                ; $4A91: $C2 $8D $3F

    inc  a                                        ; $4A94: $3C
    ld   [$C3C8], a                               ; $4A95: $EA $C8 $C3
    ld   a, MUSIC_MARIN_SINGING                   ; $4A98: $3E $2F
    ldh  [hNextMusicTrackToFadeInto], a           ; $4A9A: $E0 $B1
    ldh  [hDefaultMusicTrack], a                  ; $4A9C: $E0 $B0
    ldh  [$FFBD], a                               ; $4A9E: $E0 $BD
    call label_27EA                               ; $4AA0: $CD $EA $27

.mabeWeatherVaneEnd

    ld   a, [ROM_DebugTool1]                      ; $4AA3: $FA $03 $00
    and  a                                        ; $4AA6: $A7
    jp   z, EntityInitNpcFacingDown               ; $4AA7: $CA $2F $4B

    ld   a, [wName]                               ; $4AAA: $FA $4F $DB
    and  a                                        ; $4AAD: $A7
    jr   nz, EntityInitNpcFacingDown              ; $4AAE: $20 $7F

    ld   a, [$DB50]                               ; $4AB0: $FA $50 $DB
    and  a                                        ; $4AB3: $A7
    jr   nz, .enableTextDebugger                  ; $4AB4: $20 $09

    ld   [wGameplaySubtype], a                    ; $4AB6: $EA $96 $DB
    ld   a, $01                                   ; $4AB9: $3E $01
    ld   [wGameplayType], a                       ; $4ABB: $EA $95 $DB
    ret                                           ; $4ABE: $C9

.enableTextDebugger
    ld   hl, wEntitiesTypeTable                   ; $4ABF: $21 $A0 $C3
    add  hl, bc                                   ; $4AC2: $09
    ld   [hl], ENTITY_TEXT_DEBUGGER               ; $4AC3: $36 $6B
    ret                                           ; $4AC5: $C9

Data_003_4AC6::
    db   $FF, $7F, $BE, $0F, $13, $02, $00, $00

EntityInitRacoon::
    ldh  a, [hIsGBC]                              ; $4ACE: $F0 $FE
    and  a                                        ; $4AD0: $A7
    jr   z, EntityInitNpcFacingDown               ; $4AD1: $28 $5C

    ld   a, [wIsIndoor]                           ; $4AD3: $FA $A5 $DB
    and  a                                        ; $4AD6: $A7
    jr   z, EntityInitNpcFacingDown               ; $4AD7: $28 $56

    ld   a, [wIsMarinFollowingLink]               ; $4AD9: $FA $73 $DB
    and  a                                        ; $4ADC: $A7
    jr   nz, EntityInitNpcFacingDown              ; $4ADD: $20 $50

    ld   a, [wHasInstrument3]                     ; $4ADF: $FA $67 $DB
    and  $02                                      ; $4AE2: $E6 $02
    jr   nz, EntityInitNpcFacingDown              ; $4AE4: $20 $49

    ld   a, [wTradeSequenceItem]                  ; $4AE6: $FA $0E $DB
    cp   TRADING_ITEM_BANANAS                     ; $4AE9: $FE $04
    jr   nc, EntityInitNpcFacingDown              ; $4AEB: $30 $42

    ld   a, [$DB48]                               ; $4AED: $FA $48 $DB
    and  a                                        ; $4AF0: $A7
    jr   z, EntityInitNpcFacingDown               ; $4AF1: $28 $3C

    cp   $01                                      ; $4AF3: $FE $01
    jr   z, EntityInitNpcFacingDown               ; $4AF5: $28 $38

    ld   a, $02                                   ; $4AF7: $3E $02
    ldh  [rSVBK], a                               ; $4AF9: $E0 $70
    ld   hl, $DC88                                ; $4AFB: $21 $88 $DC
    ld   de, Data_003_4AC6                        ; $4AFE: $11 $C6 $4A

jr_003_4B01:
    ld   a, [de]                                  ; $4B01: $1A
    ld   [hl+], a                                 ; $4B02: $22
    inc  de                                       ; $4B03: $13
    ld   a, l                                     ; $4B04: $7D
    and  $07                                      ; $4B05: $E6 $07
    jr   nz, jr_003_4B01                          ; $4B07: $20 $F8

    xor  a                                        ; $4B09: $AF
    ldh  [rSVBK], a                               ; $4B0A: $E0 $70
    jr   EntityInitNpcFacingDown                                   ; $4B0C: $18 $21

EntityInitMadamMeowMeow::
    ld   a, [wIsBowWowFollowingLink]              ; $4B0E: $FA $56 $DB
    cp   $80                                      ; $4B11: $FE $80
    jr   nz, jr_003_4B1A                          ; $4B13: $20 $05

    ld   a, MUSIC_BOWWOW_KIDNAPPED                ; $4B15: $3E $0E
    ld   [wMusicTrackToPlay], a                   ; $4B17: $EA $68 $D3

jr_003_4B1A:
    ret                                           ; $4B1A: $C9

EntityInitRaftRaftOwner::
    ld   a, [wIsIndoor]                           ; $4B1B: $FA $A5 $DB
    and  a                                        ; $4B1E: $A7
    jr   nz, EntityInitNpcFacingDown              ; $4B1F: $20 $0E

    ld   a, [$D477]                               ; $4B21: $FA $77 $D4
    and  a                                        ; $4B24: $A7
    ret  nz                                       ; $4B25: $C0

    ld   hl, wEntitiesPosYTable                   ; $4B26: $21 $10 $C2
    add  hl, bc                                   ; $4B29: $09
    ld   a, [hl]                                  ; $4B2A: $7E
    sub  $10                                      ; $4B2B: $D6 $10
    ld   [hl], a                                  ; $4B2D: $77
    ret                                           ; $4B2E: $C9

EntityInitNpcFacingDown::
    ld   hl, wEntitiesDirectionTable              ; $4B2F: $21 $80 $C3
    add  hl, bc                                   ; $4B32: $09
    ld   [hl], DIRECTION_DOWN                     ; $4B33: $36 $03
    ; fallthrough

EntityInitStoreOwner::
    ld   a, [wShieldLevel]                        ; $4B35: $FA $44 $DB
    and  a                                        ; $4B38: $A7
    jr   nz, .noShieldEnd                         ; $4B39: $20 $05
    ld   a, $1C                                   ; $4B3B: $3E $1C
    call SetMusicTrack                            ; $4B3D: $CD $9C $49
.noShieldEnd

    jr   EntityInitShopOwner.setDirectionLeft     ; $4B40: $18 $06

EntityInitWitch::
    ret                                           ; $4B42: $C9

EntityInitShopOwner::
    ld   a, MUSIC_WITCH_HUT                       ; $4B43: $3E $07
    call SetMusicTrackIfHasSword                  ; $4B45: $CD $95 $49

.setDirectionLeft
    ld   a, DIRECTION_LEFT                        ; $4B48: $3E $01
    jr   SetEntityDirection                       ; $4B4A: $18 $05

EntityInitWithRandomDirection::
    call GetRandomByte                            ; $4B4C: $CD $0D $28
    and  $03                                      ; $4B4F: $E6 $03
    ; fallthrough

SetEntityDirection::
    ld   hl, wEntitiesDirectionTable              ; $4B51: $21 $80 $C3
    add  hl, bc                                   ; $4B54: $09
    ld   [hl], a                                  ; $4B55: $77
    ; fallthrough

EntityInitNoop::
NoopFunction::
    ret                                           ; $4B56: $C9

EntityInitSouthFaceShrineDoor::
    ld   a, $03                                   ; $4B57: $3E $03
    ldh  [rIE], a                                 ; $4B59: $E0 $FF
    ret                                           ; $4B5B: $C9

EntityInitLeever::
    ld   a, $FF                                   ; $4B5C: $3E $FF
    jp   SetEntitySpriteVariant                   ; $4B5E: $C3 $0C $3B

EntityInitZora::
    ld   a, [wIsIndoor]                           ; $4B61: $FA $A5 $DB
    and  a                                        ; $4B64: $A7
    jr   z, EntityInitNoop                        ; $4B65: $28 $EF

    ldh  a, [hMapRoom]                            ; $4B67: $F0 $F6
    cp   $DA                                      ; $4B69: $FE $DA
    jr   nz, EntityInitNoop                       ; $4B6B: $20 $E9

    ld   a, [wTradeSequenceItem]                  ; $4B6D: $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFIYING_GLASS           ; $4B70: $FE $0E
    jp   nz, UnloadEntityAndReturn                ; $4B72: $C2 $8D $3F

    ld   a, [wPhotos2]                            ; $4B75: $FA $0D $DC
    and  $01                                      ; $4B78: $E6 $01
    jr   z, EntityInitNoop                        ; $4B7A: $28 $DA

    ld   a, $03                                   ; $4B7C: $3E $03
    jp   SetEntitySpriteVariant                   ; $4B7E: $C3 $0C $3B

EntityInitWithRightDirection::
    xor  a                                        ; $4B81: $AF
    jr   SetEntityDirection                       ; $4B82: $18 $CD

GetColorDungeonRoomStatus::
    ld   hl, wColorDungeonRoomStatus              ; $4B84: $21 $E0 $DD
    ldh  a, [hMapRoom]                            ; $4B87: $F0 $F6
    ld   e, a                                     ; $4B89: $5F
    ld   d, $00                                   ; $4B8A: $16 $00
    add  hl, de                                   ; $4B8C: $19
    ld   a, [hl]                                  ; $4B8D: $7E
    ret                                           ; $4B8E: $C9

EntityInitRotoswitchRed::
    call GetColorDungeonRoomStatus                ; $4B8F: $CD $84 $4B
    and  $10                                      ; $4B92: $E6 $10
    jr   nz, jr_003_4BAD                          ; $4B94: $20 $17

    xor  a                                        ; $4B96: $AF
    jp   SetEntitySpriteVariant                   ; $4B97: $C3 $0C $3B

EntityInitRotoswitchYellow::
    call GetColorDungeonRoomStatus                ; $4B9A: $CD $84 $4B
    and  $10                                      ; $4B9D: $E6 $10
    jr   nz, jr_003_4BAD                          ; $4B9F: $20 $0C

    ld   a, $04                                   ; $4BA1: $3E $04
    jp   SetEntitySpriteVariant                   ; $4BA3: $C3 $0C $3B

EntityInitRotoswitchBlue::
    call GetColorDungeonRoomStatus                ; $4BA6: $CD $84 $4B
    and  $10                                      ; $4BA9: $E6 $10
    jr   z, jr_003_4BB3                           ; $4BAB: $28 $06

jr_003_4BAD:
    ld   hl, wEntitiesStateTable                  ; $4BAD: $21 $90 $C2
    add  hl, bc                                   ; $4BB0: $09
    ld   [hl], $80                                ; $4BB1: $36 $80

jr_003_4BB3:
    ld   a, $08                                   ; $4BB3: $3E $08
    jp   SetEntitySpriteVariant                   ; $4BB5: $C3 $0C $3B

EntityInitHopper::
    ld   hl, wEntitiesStateTable                  ; $4BB8: $21 $90 $C2
    add  hl, bc                                   ; $4BBB: $09
    ld   [hl], $03                                ; $4BBC: $36 $03
    jr   EntityInitFlyingHopperBombs.setPosZ      ; $4BBE: $18 $02

EntityInitFlyingHopperBombs::
    ld   a, $04                                   ; $4BC0: $3E $04

.setPosZ
    ld   hl, wEntitiesPosZTable                   ; $4BC2: $21 $10 $C3
    add  hl, bc                                   ; $4BC5: $09
    ld   [hl], $10                                ; $4BC6: $36 $10
    jp   SetEntitySpriteVariant                   ; $4BC8: $C3 $0C $3B

EntityInitHardHitBeetle::
    ld   hl, wEntitiesHealthTable                 ; $4BCB: $21 $60 $C3
    add  hl, bc                                   ; $4BCE: $09
    ld   [hl], $10                                ; $4BCF: $36 $10
    ld   hl, wEntitiesPosXTable                   ; $4BD1: $21 $00 $C2
    add  hl, bc                                   ; $4BD4: $09
    ld   a, [hl]                                  ; $4BD5: $7E
    sub  $08                                      ; $4BD6: $D6 $08
    ld   [hl], a                                  ; $4BD8: $77
    jp   EntityInitNoop                           ; $4BD9: $C3 $56 $4B

EntityInitAvalaunch::
    ld   hl, wEntitiesPosXTable                   ; $4BDC: $21 $00 $C2
    add  hl, bc                                   ; $4BDF: $09
    ld   [hl], $50                                ; $4BE0: $36 $50
    ld   hl, wEntitiesUnknownTableD               ; $4BE2: $21 $D0 $C2
    add  hl, bc                                   ; $4BE5: $09
    ld   [hl], $00                                ; $4BE6: $36 $00
    jp   EntityInitNoop                           ; $4BE8: $C3 $56 $4B

EntityInitColorGuardianBlue::
    ldh  a, [hIsGBC]                              ; $4BEB: $F0 $FE
    and  a                                        ; $4BED: $A7
    jp   z, EntityInitNoop                        ; $4BEE: $CA $56 $4B

    call GetColorDungeonRoomStatus                ; $4BF1: $CD $84 $4B
    and  $10                                      ; $4BF4: $E6 $10
    jp   z, EntityInitNoop                        ; $4BF6: $CA $56 $4B

    ld   hl, wEntitiesPosXTable                   ; $4BF9: $21 $00 $C2
    add  hl, bc                                   ; $4BFC: $09
    ld   a, $3C                                   ; $4BFD: $3E $3C
    jr   jr_003_4C15                              ; $4BFF: $18 $14

EntityInitColorGuardianRed::
    ldh  a, [hIsGBC]                              ; $4C01: $F0 $FE
    and  a                                        ; $4C03: $A7
    jp   z, EntityInitNoop                        ; $4C04: $CA $56 $4B

    call GetColorDungeonRoomStatus                ; $4C07: $CD $84 $4B
    and  $10                                      ; $4C0A: $E6 $10
    jp   z, EntityInitNoop                        ; $4C0C: $CA $56 $4B

    ld   hl, wEntitiesPosXTable                   ; $4C0F: $21 $00 $C2
    add  hl, bc                                   ; $4C12: $09
    ld   a, $63                                   ; $4C13: $3E $63

jr_003_4C15:
    ld   [hl], a                                  ; $4C15: $77
    ld   hl, wEntitiesStateTable                  ; $4C16: $21 $90 $C2
    add  hl, bc                                   ; $4C19: $09
    ld   [hl], $04                                ; $4C1A: $36 $04
    jp   EntityInitNoop                           ; $4C1C: $C3 $56 $4B

EntityInitColorDungeonBook::
    ld   hl, wEntitiesPosYTable                   ; $4C1F: $21 $10 $C2
    add  hl, bc                                   ; $4C22: $09
    ld   a, [hl]                                  ; $4C23: $7E
    add  $02                                      ; $4C24: $C6 $02
    ld   [hl], a                                  ; $4C26: $77
    ld   hl, wEntitiesPosZTable                   ; $4C27: $21 $10 $C3
    add  hl, bc                                   ; $4C2A: $09
    ld   [hl], $04                                ; $4C2B: $36 $04
    ; fallthrough

EntityInitGiantBuzzBlob::
    ld   hl, wEntitiesHealthTable                 ; $4C2D: $21 $60 $C3
    add  hl, bc                                   ; $4C30: $09
    ld   [hl], $0C                                ; $4C31: $36 $0C
    xor  a                                        ; $4C33: $AF
    ld   hl, wEntitiesUnknownTableD               ; $4C34: $21 $D0 $C2
    add  hl, bc                                   ; $4C37: $09
    ld   [hl], a                                  ; $4C38: $77
    ld   hl, wEntitiesPosXTable                   ; $4C39: $21 $00 $C2
    add  hl, bc                                   ; $4C3C: $09
    ld   a, [hl]                                  ; $4C3D: $7E
    add  $08                                      ; $4C3E: $C6 $08
    ld   [hl], a                                  ; $4C40: $77
    jp   EntityInitNoop                           ; $4C41: $C3 $56 $4B

; Seems to be both code and data
EntityInitSmallExplosion::
EntityExplosionDisplayList::
    inc  [hl]                                     ; $4C44: $34
    ld   [bc], a                                  ; $4C45: $02
    inc  [hl]                                     ; $4C46: $34
    ld   [hl+], a                                 ; $4C47: $22
    inc  [hl]                                     ; $4C48: $34
    inc  d                                        ; $4C49: $14
    inc  [hl]                                     ; $4C4A: $34
    inc  [hl]                                     ; $4C4B: $34

EntityDestructionHandler::
    call GetEntityTransitionCountdown             ; $4C4C: $CD $05 $0C
    jr   z, .destructionEnd                       ; $4C4F: $28 $26

    ; Animate the entity destruction with explosions
    ldh  a, [hFrameCounter]                       ; $4C51: $F0 $E7
    rra                                           ; $4C53: $1F
    rra                                           ; $4C54: $1F
    rra                                           ; $4C55: $1F
    and  $01                                      ; $4C56: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $4C58: $E0 $F1
    ld   de, EntityExplosionDisplayList           ; $4C5A: $11 $44 $4C
    call RenderActiveEntitySpritesPair            ; $4C5D: $CD $C0 $3B
    ld   hl, wEntitiesSpriteVariantTable          ; $4C60: $21 $B0 $C3
    add  hl, bc                                   ; $4C63: $09
    ld   a, [hl]                                  ; $4C64: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4C65: $E0 $F1
    call ExecuteActiveEntityHandler_trampoline    ; $4C67: $CD $81 $3A
    call func_003_7F7E                            ; $4C6A: $CD $7E $7F
    call func_003_7FA9                            ; $4C6D: $CD $A9 $7F
    call func_003_60B3                            ; $4C70: $CD $B3 $60
    call ClearEntitySpeed                         ; $4C73: $CD $7F $3D
    ret                                           ; $4C76: $C9

.destructionEnd
    ; If destroying a Gibdo…
    ldh  a, [hActiveEntityType]                   ; $4C77: $F0 $EB
    cp   ENTITY_GIBDO                             ; $4C79: $FE $1F
    jr   nz, .gibdoEnd                            ; $4C7B: $20 $0F
    ; … replace it by a Stalfos.
    ld   hl, wEntitiesTypeTable                   ; $4C7D: $21 $A0 $C3
    add  hl, bc                                   ; $4C80: $09
    ld   [hl], ENTITY_STALFOS_EVASIVE             ; $4C81: $36 $1E
    ld   hl, wEntitiesStatusTable                 ; $4C83: $21 $80 $C2
    add  hl, bc                                   ; $4C86: $09
    ld   [hl], ENTITY_STATUS_ACTIVE               ; $4C87: $36 $05
    jp   ConfigureNewEntity.attributes            ; $4C89: $C3 $6B $48
.gibdoEnd

    ld   hl, wEntitiesUnknowTableV                ; $4C8C: $21 $80 $C4
    add  hl, bc                                   ; $4C8F: $09
    ld   [hl], $1F                                ; $4C90: $36 $1F
    ld   hl, wEntitiesStatusTable                 ; $4C92: $21 $80 $C2
    add  hl, bc                                   ; $4C95: $09
    ld   [hl], ENTITY_STATUS_DYING                ; $4C96: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4C98: $21 $40 $C3
    add  hl, bc                                   ; $4C9B: $09
    ld   [hl], $04                                ; $4C9C: $36 $04
    ld   hl, hNoiseSfx                            ; $4C9E: $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ; $4CA1: $36 $13
    ret                                           ; $4CA3: $C9

Data_003_4CA4::
    db   $00, $00, $04, $00

Data_003_4CA8::
    db   $00, $01, $03, $06

Data_003_4CAC::
    db   $24, $01, $24, $01, $3E, $01

Data_003_4CB2::
    db   $1E, $01, $1E, $61

EntityFallHandler::
    ldh  a, [hMapId]                              ; $4CB6: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $4CB8: $FE $FF
    jr   nz, .colorShellEnd                       ; $4CBA: $20 $20

    ld   hl, wEntitiesTypeTable                   ; $4CBC: $21 $A0 $C3
    add  hl, bc                                   ; $4CBF: $09
    ld   a, [hl]                                  ; $4CC0: $7E
    cp   ENTITY_COLOR_SHELL_RED                   ; $4CC1: $FE $E9
    jr   z, .animateColorShell                    ; $4CC3: $28 $08

    cp   ENTITY_COLOR_SHELL_GREEN                 ; $4CC5: $FE $EA
    jr   z, .animateColorShell                    ; $4CC7: $28 $04

    cp   ENTITY_COLOR_SHELL_BLUE                  ; $4CC9: $FE $EB
    jr   nz, .colorShellEnd                       ; $4CCB: $20 $0F

.animateColorShell
    ld   hl, wEntitiesStatusTable                 ; $4CCD: $21 $80 $C2
    add  hl, bc                                   ; $4CD0: $09
    ld   a, ENTITY_STATUS_ACTIVE                  ; $4CD1: $3E $05
    ld   [hl], a                                  ; $4CD3: $77
    ld   hl, wEntitiesStateTable                  ; $4CD4: $21 $90 $C2
    add  hl, bc                                   ; $4CD7: $09
    ld   a, $06                                   ; $4CD8: $3E $06
    ld   [hl], a                                  ; $4CDA: $77
    ret                                           ; $4CDB: $C9
.colorShellEnd

    call GetEntityTransitionCountdown                 ; $4CDC: $CD $05 $0C
    jr   nz, jr_003_4D07                          ; $4CDF: $20 $26

    ld   hl, wEntitiesUnknowTableH                ; $4CE1: $21 $30 $C4
    add  hl, bc                                   ; $4CE4: $09
    ld   a, [hl]                                  ; $4CE5: $7E
    and  $02                                      ; $4CE6: $E6 $02
    jr   nz, jr_003_4CEF                          ; $4CE8: $20 $05

    ld   hl, $D460                                ; $4CEA: $21 $60 $D4
    ld   [hl], $01                                ; $4CED: $36 $01

jr_003_4CEF:
    ldh  a, [hActiveEntityType]                   ; $4CEF: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $4CF1: $FE $A8
    jr   nz, jr_003_4D04                          ; $4CF3: $20 $0F

    ld   a, $16                                   ; $4CF5: $3E $16
    ld   [wWreckingBallRoom], a                   ; $4CF7: $EA $6F $DB
    ld   a, $50                                   ; $4CFA: $3E $50
    ld   [wWreckingBallPosX], a                   ; $4CFC: $EA $70 $DB
    ld   a, $27                                   ; $4CFF: $3E $27
    ld   [wWreckingBallPosY], a                   ; $4D01: $EA $71 $DB

jr_003_4D04:
    jp   UnloadEntityAndReturn                    ; $4D04: $C3 $8D $3F

jr_003_4D07:
    cp   $40                                      ; $4D07: $FE $40
    jr   c, jr_003_4D29                           ; $4D09: $38 $1E

    ldh  a, [hActiveEntityType]                   ; $4D0B: $F0 $EB
    cp   ENTITY_OCTOROCK                          ; $4D0D: $FE $09
    jr   z, jr_003_4D19                           ; $4D0F: $28 $08

    cp   ENTITY_MOBLIN                            ; $4D11: $FE $0B
    jr   z, jr_003_4D19                           ; $4D13: $28 $04

    cp   ENTITY_MOBLIN_SWORD                      ; $4D15: $FE $14
    jr   nz, jr_003_4D22                          ; $4D17: $20 $09

jr_003_4D19:
    call func_003_58FC                            ; $4D19: $CD $FC $58
    call func_003_58FC                            ; $4D1C: $CD $FC $58
    call func_003_58FC                            ; $4D1F: $CD $FC $58

jr_003_4D22:
    call ExecuteActiveEntityHandler_trampoline    ; $4D22: $CD $81 $3A
    call func_003_7F7E                            ; $4D25: $CD $7E $7F
    ret                                           ; $4D28: $C9

jr_003_4D29:
    rra                                           ; $4D29: $1F
    rra                                           ; $4D2A: $1F
    rra                                           ; $4D2B: $1F
    rra                                           ; $4D2C: $1F
    and  $03                                      ; $4D2D: $E6 $03
    ld   hl, wEntitiesSpriteVariantTable          ; $4D2F: $21 $B0 $C3
    add  hl, bc                                   ; $4D32: $09
    ld   [hl], a                                  ; $4D33: $77
    ldh  [hActiveEntitySpriteVariant], a          ; $4D34: $E0 $F1
    ld   e, a                                     ; $4D36: $5F
    ld   d, b                                     ; $4D37: $50
    ld   hl, Data_003_4CA4                        ; $4D38: $21 $A4 $4C
    add  hl, de                                   ; $4D3B: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $4D3C: $F0 $EC
    add  [hl]                                     ; $4D3E: $86
    ldh  [hActiveEntityVisualPosY], a             ; $4D3F: $E0 $EC
    ld   a, e                                     ; $4D41: $7B
    cp   $03                                      ; $4D42: $FE $03
    jr   nz, jr_003_4D51                          ; $4D44: $20 $0B

    xor  a                                        ; $4D46: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4D47: $E0 $F1
    ld   de, Data_003_4CB2                        ; $4D49: $11 $B2 $4C
    call RenderActiveEntitySpritesPair            ; $4D4C: $CD $C0 $3B
    jr   jr_003_4D57                              ; $4D4F: $18 $06

jr_003_4D51:
    ld   de, Data_003_4CAC                        ; $4D51: $11 $AC $4C
    call RenderActiveEntitySprite                 ; $4D54: $CD $77 $3C

jr_003_4D57:
    call func_003_7F7E                            ; $4D57: $CD $7E $7F
    call GetEntityTransitionCountdown             ; $4D5A: $CD $05 $0C
    cp   $3F                                      ; $4D5D: $FE $3F
    jr   nz, jr_003_4D66                          ; $4D5F: $20 $05

    ld   hl, hJingle                              ; $4D61: $21 $F2 $FF
    ld   [hl], JINGLE_ITEM_FALLING                ; $4D64: $36 $18

jr_003_4D66:
    rra                                           ; $4D66: $1F
    rra                                           ; $4D67: $1F
    rra                                           ; $4D68: $1F
    rra                                           ; $4D69: $1F
    and  $03                                      ; $4D6A: $E6 $03
    ld   e, a                                     ; $4D6C: $5F
    ld   d, b                                     ; $4D6D: $50
    ld   hl, Data_003_4CA8                        ; $4D6E: $21 $A8 $4C
    add  hl, de                                   ; $4D71: $19
    ld   e, [hl]                                  ; $4D72: $5E
    ldh  a, [hLinkPositionX]                      ; $4D73: $F0 $98
    push af                                       ; $4D75: $F5
    ld   hl, $C4B0                                ; $4D76: $21 $B0 $C4
    add  hl, bc                                   ; $4D79: $09
    ld   a, [hl]                                  ; $4D7A: $7E
    ldh  [hLinkPositionX], a                      ; $4D7B: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $4D7D: $F0 $99
    push af                                       ; $4D7F: $F5
    ld   hl, $C4C0                                ; $4D80: $21 $C0 $C4
    add  hl, bc                                   ; $4D83: $09
    ld   a, [hl]                                  ; $4D84: $7E
    ldh  [hLinkPositionY], a                      ; $4D85: $E0 $99
    ld   a, e                                     ; $4D87: $7B
    call ApplyVectorTowardsLink                   ; $4D88: $CD $C7 $7E
    pop  af                                       ; $4D8B: $F1
    ldh  [hLinkPositionY], a                      ; $4D8C: $E0 $99
    pop  af                                       ; $4D8E: $F1
    ldh  [hLinkPositionX], a                      ; $4D8F: $E0 $98
    jp   func_003_7F25                            ; $4D91: $C3 $25 $7F

EntityThrownHandler::
    call ExecuteActiveEntityHandler_trampoline    ; $4D94: $CD $81 $3A
    call func_003_7F7E                            ; $4D97: $CD $7E $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4D9A: $21 $10 $C4
    add  hl, bc                                   ; $4D9D: $09
    ld   [hl], $02                                ; $4D9E: $36 $02
    call func_003_60B3                            ; $4DA0: $CD $B3 $60
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $4DA3: $21 $10 $C4
    add  hl, bc                                   ; $4DA6: $09
    ld   [hl], b                                  ; $4DA7: $70
    call func_003_66FA                            ; $4DA8: $CD $FA $66
    call func_003_5438                            ; $4DAB: $CD $38 $54

    ldh  a, [hActiveEntityType]                   ; $4DAE: $F0 $EB
    cp   ENTITY_GENIE                             ; $4DB0: $FE $5C
    jr   nz, .genieEnd                            ; $4DB2: $20 $1E

    ld   hl, wEntitiesCollisionsTable             ; $4DB4: $21 $A0 $C2
    add  hl, bc                                   ; $4DB7: $09
    ld   a, [hl]                                  ; $4DB8: $7E
    and  a                                        ; $4DB9: $A7
    jr   z, .genieEnd                             ; $4DBA: $28 $16

    ld   hl, wEntitiesFlashCountdownTable         ; $4DBC: $21 $20 $C4
    add  hl, bc                                   ; $4DBF: $09
    ld   [hl], $20                                ; $4DC0: $36 $20
    ld   hl, hWaveSfx                             ; $4DC2: $21 $F3 $FF
    ld   [hl], WAVE_SFX_BOSS_GRAWL                ; $4DC5: $36 $07
    ld   hl, wEntitiesUnknowTableP                ; $4DC7: $21 $40 $C4
    add  hl, bc                                   ; $4DCA: $09
    ld   a, [hl]                                  ; $4DCB: $7E
    inc  a                                        ; $4DCC: $3C
    ld   [hl], a                                  ; $4DCD: $77
    cp   $03                                      ; $4DCE: $FE $03
    jr   z, .genie2                               ; $4DD0: $28 $1D
.genieEnd

    ld   a, $0B                                   ; $4DD2: $3E $0B
    ld   [$C19E], a                               ; $4DD4: $EA $9E $C1
    call func_003_75A2                            ; $4DD7: $CD $A2 $75
    ld   hl, wEntitiesSpeedXTable                 ; $4DDA: $21 $40 $C2
    add  hl, bc                                   ; $4DDD: $09
    ld   a, [hl]                                  ; $4DDE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4DDF: $21 $50 $C2
    add  hl, bc                                   ; $4DE2: $09
    or   [hl]                                     ; $4DE3: $B6
    jr   nz, .return                              ; $4DE4: $20 $1E

    call func_003_7267                            ; $4DE6: $CD $67 $72

    ldh  a, [hActiveEntityType]                   ; $4DE9: $F0 $EB
    cp   ENTITY_GENIE                             ; $4DEB: $FE $5C
    jr   nz, .return                              ; $4DED: $20 $15

.genie2
    ld   hl, wEntitiesStatusTable                 ; $4DEF: $21 $80 $C2
    add  hl, bc                                   ; $4DF2: $09
    ld   [hl], $05                                ; $4DF3: $36 $05
    call IncrementEntityState                     ; $4DF5: $CD $12 $3B
    ld   [hl], $01                                ; $4DF8: $36 $01
    call GetEntityTransitionCountdown             ; $4DFA: $CD $05 $0C
    ld   [hl], $80                                ; $4DFD: $36 $80
    ld   hl, wEntitiesUnknownTableD               ; $4DFF: $21 $D0 $C2
    add  hl, bc                                   ; $4E02: $09
    ld   [hl], b                                  ; $4E03: $70

.return
    ret                                           ; $4E04: $C9

Data_003_4E05::
    db   $10, $F0

EntityStunnedHandler::
    call ExecuteActiveEntityHandler_trampoline    ; $4E07: $CD $81 $3A
    call func_003_7F7E                            ; $4E0A: $CD $7E $7F
    call func_003_7FA9                            ; $4E0D: $CD $A9 $7F
    call func_003_60B3                            ; $4E10: $CD $B3 $60
    call ClearEntitySpeed                         ; $4E13: $CD $7F $3D
    call func_003_6E2B                            ; $4E16: $CD $2B $6E
    ld   a, [wBButtonSlot]                        ; $4E19: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $4E1C: $FE $03
    jr   nz, jr_003_4E28                          ; $4E1E: $20 $08

    ldh  a, [hJoypadState]                        ; $4E20: $F0 $CC
    and  J_B                                      ; $4E22: $E6 $20
    jr   nz, func_003_4E35                        ; $4E24: $20 $0F

    jr   jr_003_4E72                              ; $4E26: $18 $4A

jr_003_4E28:
    ld   a, [wAButtonSlot]                        ; $4E28: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $4E2B: $FE $03
    jr   nz, jr_003_4E72                          ; $4E2D: $20 $43

    ldh  a, [hJoypadState]                        ; $4E2F: $F0 $CC
    and  J_A                                      ; $4E31: $E6 $10
    jr   z, jr_003_4E72                           ; $4E33: $28 $3D

func_003_4E35::
    ld   a, [$C3CF]                               ; $4E35: $FA $CF $C3
    and  a                                        ; $4E38: $A7
    jr   nz, jr_003_4E72                          ; $4E39: $20 $37

    ld   hl, wEntitiesPhysicsFlagsTable           ; $4E3B: $21 $40 $C3
    add  hl, bc                                   ; $4E3E: $09
    ld   a, [hl]                                  ; $4E3F: $7E
    push hl                                       ; $4E40: $E5
    push af                                       ; $4E41: $F5
    or   $80                                      ; $4E42: $F6 $80
    ld   [hl], a                                  ; $4E44: $77
    call CheckLinkCollisionWithEnemy              ; $4E45: $CD $72 $6C
    rl   e                                        ; $4E48: $CB $13
    pop  af                                       ; $4E4A: $F1
    pop  hl                                       ; $4E4B: $E1
    ld   [hl], a                                  ; $4E4C: $77
    rr   e                                        ; $4E4D: $CB $1B
    jr   nc, jr_003_4E72                          ; $4E4F: $30 $21

    ld   a, $01                                   ; $4E51: $3E $01
    ld   [$C3CF], a                               ; $4E53: $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ; $4E56: $21 $80 $C2
    add  hl, bc                                   ; $4E59: $09
    ld   [hl], $07                                ; $4E5A: $36 $07
    ld   a, $02                                   ; $4E5C: $3E $02
    ldh  [hWaveSfx], a                            ; $4E5E: $E0 $F3
    ld   hl, wEntitiesUnknowTableW                ; $4E60: $21 $90 $C4
    add  hl, bc                                   ; $4E63: $09
    ld   [hl], b                                  ; $4E64: $70
    call GetEntityTransitionCountdown             ; $4E65: $CD $05 $0C
    ld   [hl], $02                                ; $4E68: $36 $02
    ldh  a, [hLinkDirection]                      ; $4E6A: $F0 $9E
    ld   [wC15D], a                               ; $4E6C: $EA $5D $C1
    jp   EntityLiftedHandler                      ; $4E6F: $C3 $32 $57

jr_003_4E72:
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4E72: $21 $00 $C3
    add  hl, bc                                   ; $4E75: $09
    ld   a, [hl]                                  ; $4E76: $7E
    and  a                                        ; $4E77: $A7
    jr   nz, jr_003_4E85                          ; $4E78: $20 $0B

    ld   hl, wEntitiesStatusTable                 ; $4E7A: $21 $80 $C2
    add  hl, bc                                   ; $4E7D: $09
    ld   [hl], $05                                ; $4E7E: $36 $05
    ld   hl, wEntitiesSpeedZTable                 ; $4E80: $21 $20 $C3
    add  hl, bc                                   ; $4E83: $09
    ld   [hl], b                                  ; $4E84: $70

jr_003_4E85:
    cp   $38                                      ; $4E85: $FE $38
    ret  nc                                       ; $4E87: $D0

    srl  a                                        ; $4E88: $CB $3F
    srl  a                                        ; $4E8A: $CB $3F
    and  $01                                      ; $4E8C: $E6 $01
    ld   e, a                                     ; $4E8E: $5F
    ld   d, b                                     ; $4E8F: $50
    ld   hl, Data_003_4E05                        ; $4E90: $21 $05 $4E
    add  hl, de                                   ; $4E93: $19
    ld   a, [hl]                                  ; $4E94: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4E95: $21 $40 $C2
    add  hl, bc                                   ; $4E98: $09
    ld   [hl], a                                  ; $4E99: $77
    call func_003_7F32                            ; $4E9A: $CD $32 $7F
    jp   ClearEntitySpeed                         ; $4E9D: $C3 $7F $3D

EntityRandomSpeedX::
    db   12, 12, -12, -12

EntityRandomSpeedY::
    db   12, -12, 12, -12

EntityInitWithRandomSpeed::
    call GetRandomByte                            ; $4EA8: $CD $0D $28
    and  $03                                      ; $4EAB: $E6 $03
    ld   e, a                                     ; $4EAD: $5F
    ld   d, b                                     ; $4EAE: $50
    ld   hl, EntityRandomSpeedX                        ; $4EAF: $21 $A0 $4E
    add  hl, de                                   ; $4EB2: $19
    ld   a, [hl]                                  ; $4EB3: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4EB4: $21 $40 $C2
    add  hl, bc                                   ; $4EB7: $09
    ld   [hl], a                                  ; $4EB8: $77
    ld   hl, EntityRandomSpeedY                        ; $4EB9: $21 $A4 $4E
    add  hl, de                                   ; $4EBC: $19
    ld   a, [hl]                                  ; $4EBD: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4EBE: $21 $50 $C2
    add  hl, bc                                   ; $4EC1: $09
    ld   [hl], a                                  ; $4EC2: $77
    ret                                           ; $4EC3: $C9

EntityInitSparkClockwise::
    ld   hl, wEntitiesPrivateState2Table          ; $4EC4: $21 $C0 $C2
    add  hl, bc                                   ; $4EC7: $09
    ld   [hl], $04                                ; $4EC8: $36 $04
    ld   a, $03                                   ; $4ECA: $3E $03
    jr   jr_003_4ED0                              ; $4ECC: $18 $02

EntityInitSparkCounterClockwise::
    ld   a, $FD                                   ; $4ECE: $3E $FD

jr_003_4ED0:
    ld   hl, wEntitiesPosYTable                   ; $4ED0: $21 $10 $C2
    add  hl, bc                                   ; $4ED3: $09
    add  [hl]                                     ; $4ED4: $86
    ld   [hl], a                                  ; $4ED5: $77
    ret                                           ; $4ED6: $C9

EntityInitWizrobe::
    call GetEntityTransitionCountdown             ; $4ED7: $CD $05 $0C
    ld   [hl], $80                                ; $4EDA: $36 $80
    ld   hl, wEntitiesSpriteVariantTable          ; $4EDC: $21 $B0 $C3
    add  hl, bc                                   ; $4EDF: $09
    dec  [hl]                                     ; $4EE0: $35
    ret                                           ; $4EE1: $C9

EntityInitMoblinSword::
    ldh  a, [hActiveEntityPosX]                   ; $4EE2: $F0 $EE
    and  $10                                      ; $4EE4: $E6 $10
    ld   a, $00                                   ; $4EE6: $3E $00
    jr   nz, jr_003_4EEC                          ; $4EE8: $20 $02

    ld   a, $03                                   ; $4EEA: $3E $03

jr_003_4EEC:
    ld   hl, wEntitiesDirectionTable              ; $4EEC: $21 $80 $C3
    add  hl, bc                                   ; $4EEF: $09
    ld   [hl], a                                  ; $4EF0: $77
    push hl                                       ; $4EF1: $E5
    call func_003_58FC                            ; $4EF2: $CD $FC $58
    pop  hl                                       ; $4EF5: $E1
    ld   a, [hl]                                  ; $4EF6: $7E
    xor  $01                                      ; $4EF7: $EE $01
    ld   [hl], a                                  ; $4EF9: $77
    ret                                           ; $4EFA: $C9

EntityInitSecretSeashell::
    ld   hl, wEntitiesUnknownTableD               ; $4EFB: $21 $D0 $C2
    add  hl, bc                                   ; $4EFE: $09
    ld   [hl], $02                                ; $4EFF: $36 $02
    ldh  a, [hMapRoom]                            ; $4F01: $F0 $F6
    cp   $A4                                      ; Overworld room A4 (1 east of Mabe's big bush field)
    jr   z, jr_003_4F0B                           ; $4F05: $28 $04

    cp   $D2                                      ; overworld room D2 (1 west of Tail Cave)
    jr   nz, jr_003_4F0F                          ; $4F09: $20 $04

jr_003_4F0B:
    dec  [hl]                                     ; $4F0B: $35
    call EntityInitWithShiftedPosition            ; $4F0C: $CD $83 $4F

jr_003_4F0F:
    jp   jr_003_4F24                              ; $4F0F: $C3 $24 $4F

func_003_4F12::
    ld   hl, wEntitiesUnknownTableD               ; $4F12: $21 $D0 $C2
    add  hl, bc                                   ; $4F15: $09
    ld   [hl], $01                                ; $4F16: $36 $01
    ld   a, [wIsIndoor]                           ; $4F18: $FA $A5 $DB
    and  a                                        ; $4F1B: $A7
    jr   z, jr_003_4F24                           ; $4F1C: $28 $06

EntityInitPermanentDroppable::
    ld   hl, wEntitiesUnknownTableD               ; $4F1E: $21 $D0 $C2
    add  hl, bc                                   ; $4F21: $09
    ld   [hl], $02                                ; $4F22: $36 $02

jr_003_4F24:
    ld   hl, wEntitiesUnknowTableH                ; $4F24: $21 $30 $C4
    add  hl, bc                                   ; $4F27: $09
    ld   a, [hl]                                  ; $4F28: $7E
    or   %00010001                                ; $4F29: $F6 $11
    ld   [hl], a                                  ; $4F2B: $77
    ret                                           ; $4F2C: $C9

EntityInitKeyDropPoint::
    ldh  a, [hMapRoom]                            ; $4F2D: $F0 $F6
    cp   $F8                                      ; In the Yarna Desert quicksand pit
    jr   nz, jr_003_4F44                          ; $4F31: $20 $11

    ; check if the angler key has dropped, and not dropped down the hole yet
    ldh  a, [hRoomStatus]                         ; $4F33: $F0 $F8
    bit  4, a                                     ; $4F35: $CB $67
    jp   nz, UnloadEntityAndReturn                ; $4F37: $C2 $8D $3F

    bit  5, a                                     ; $4F3A: $CB $6F
    jp   z, UnloadEntityAndReturn                 ; $4F3C: $CA $8D $3F

    ld   a, $02                                   ; $4F3F: $3E $02
    jp   SetEntitySpriteVariant                   ; $4F41: $C3 $0C $3B

jr_003_4F44:
    ; Handle the sprite change for the bird key
    cp   $7A                                      ; $4F44: $FE $7A
    jr   nz, jr_003_4F54                          ; $4F46: $20 $0C

    ldh  a, [hRoomStatus]                         ; $4F48: $F0 $F8
    and  $10                                      ; $4F4A: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $4F4C: $C2 $8D $3F

    ld   a, $04                                   ; $4F4F: $3E $04
    jp   SetEntitySpriteVariant                   ; $4F51: $C3 $0C $3B

jr_003_4F54:
    ; handle the key in the sidescroll room in dungeon 4 where
    ; the key drops in the hole down into the sidescrolling room with water
    cp   $7C                                      ; $4F54: $FE $7C
    jr   nz, jr_003_4F67                          ; $4F56: $20 $0F

    ld   a, [wIndoorARoomStatus + $69]            ; $4F58: $FA $69 $D9
    and  $10                                      ; $4F5B: $E6 $10
    jp   z, UnloadEntityAndReturn                 ; $4F5D: $CA $8D $3F

    ldh  a, [hRoomStatus]                         ; $4F60: $F0 $F8
    and  $10                                      ; $4F62: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $4F64: $C2 $8D $3F

jr_003_4F67:
    ret                                           ; $4F67: $C9

EntityInitTradingItem::
    ld   a, [wTradeSequenceItem]                  ; $4F68: $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFIYING_GLASS           ; $4F6B: $FE $0E
    jr   z, EntityInitWithShiftedPosition         ; $4F6D: $28 $14

    ret                                           ; $4F6F: $C9

EntityInitWarp::
    ld   a, [wIsIndoor]                           ; $4F70: $FA $A5 $DB
    and  a                                        ; $4F73: $A7
    ret  z                                        ; $4F74: $C8

    call IncrementEntityState                     ; $4F75: $CD $12 $3B
    jr   EntityInitWithShiftedPosition            ; $4F78: $18 $09

EntityInitTemporaryDroppable::
    call func_003_4F12                            ; $4F7A: $CD $12 $4F
    ld   a, [wIsIndoor]                           ; $4F7D: $FA $A5 $DB
    and  a                                        ; $4F80: $A7
    jr   nz, SetDroppableDefaultTimer             ; $4F81: $20 $26

; Increment X and Y position by 8
EntityInitWithShiftedPosition::
EntityShiftPosition::
    ld   de, wEntitiesPosXSignTable               ; $4F83: $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ; $4F86: $21 $00 $C2
    call .shiftBy8                                ; $4F89: $CD $92 $4F

    ld   de, wEntitiesPosYSignTable               ; $4F8C: $11 $30 $C2
    ld   hl, wEntitiesPosYTable                   ; $4F8F: $21 $10 $C2
    ; fallthrough

; add 8 to the position in hl
.shiftBy8
    add  hl, bc                                   ; $4F92: $09
    ld   a, [hl]                                  ; $4F93: $7E
    add  $08                                      ; $4F94: $C6 $08
    ld   [hl], a                                  ; $4F96: $77
    rla                                           ; $4F97: $17
    ld   l, e                                     ; $4F98: $6B
    ld   h, d                                     ; $4F99: $62
    add  hl, bc                                   ; $4F9A: $09
    rra                                           ; $4F9B: $1F
    ld   a, [hl]                                  ; $4F9C: $7E
    adc  $00                                      ; $4F9D: $CE $00
    ld   [hl], a                                  ; $4F9F: $77
    ret                                           ; $4FA0: $C9

EntityInitWithShiftedXPosition::
    ld   de, wEntitiesPosXSignTable               ; $4FA1: $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ; $4FA4: $21 $00 $C2
    jr   EntityShiftPosition.shiftBy8             ; $4FA7: $18 $E9

SetDroppableDefaultTimer::
    call GetEntityDropTimer                       ; $4FA9: $CD $FB $0B
    ld   [hl], $80                                ; $4FAC: $36 $80
    ret                                           ; $4FAE: $C9

EntityInitWithCountdown::
    call GetEntityPrivateCountdown1               ; $4FAF: $CD $00 $0C
    ld   [hl], $A0                                ; $4FB2: $36 $A0
    ret                                           ; $4FB4: $C9

EntityInitGhini::
    ldh  a, [hActiveEntityType]                   ; $4FB5: $F0 $EB
    cp   ENTITY_GHINI                             ; $4FB7: $FE $12
    jr   nz, .ghiniEnd                            ; $4FB9: $20 $0D

    ld   hl, wEntitiesUnknownTableD               ; $4FBB: $21 $D0 $C2
    add  hl, bc                                   ; $4FBE: $09
    ld   [hl], $01                                ; $4FBF: $36 $01
    ld   hl, wEntitiesPosZTable                   ; $4FC1: $21 $10 $C3
    add  hl, bc                                   ; $4FC4: $09
    ld   [hl], $10                                ; $4FC5: $36 $10
    ret                                           ; $4FC7: $C9
.ghiniEnd
    jp   IncrementEntityState                     ; $4FC8: $C3 $12 $3B

Data_003_4FCB::
    db   $60, $02, $62, $02, $62, $22, $60, $22, $64, $02, $66, $02, $66, $22, $64, $22
    db   $68, $02, $6A, $02, $6C, $02, $6E, $02, $6A, $22, $68, $22, $6E, $22, $6C, $22

Data_003_4FEB::
    db   $70, $02, $72, $02, $72, $22, $70, $22

Data_003_4FF3::
    db   $0C, $F4, $00, $00

Data_003_4FF7::
    db   $00, $00, $F4, $0C

IronMaskEntityHandler::
    ld   hl, wEntitiesPrivateState2Table          ; $4FFB: $21 $C0 $C2
    add  hl, bc                                   ; $4FFE: $09
    ld   a, [hl]                                  ; $4FFF: $7E
    and  a                                        ; $5000: $A7
    jr   z, .return                               ; $5001: $28 $45

    ld   de, Data_003_4FEB                        ; $5003: $11 $EB $4F
    call RenderActiveEntitySpritesPair            ; $5006: $CD $C0 $3B
    call func_003_7F78                            ; $5009: $CD $78 $7F
    call func_003_7FA9                            ; $500C: $CD $A9 $7F
    call func_003_6E28                            ; $500F: $CD $28 $6E
    call func_003_7F25                            ; $5012: $CD $25 $7F
    call func_003_7893                            ; $5015: $CD $93 $78
    call GetEntityTransitionCountdown             ; $5018: $CD $05 $0C
    jr   nz, .jp_003_503D                         ; $501B: $20 $20

    call GetRandomByte                            ; $501D: $CD $0D $28
    and  $1F                                      ; $5020: $E6 $1F
    add  $20                                      ; $5022: $C6 $20
    ld   [hl], a                                  ; $5024: $77
    and  $03                                      ; $5025: $E6 $03
    ld   e, a                                     ; $5027: $5F
    ld   d, b                                     ; $5028: $50
    ld   hl, Data_003_4FF3                        ; $5029: $21 $F3 $4F
    add  hl, de                                   ; $502C: $19
    ld   a, [hl]                                  ; $502D: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $502E: $21 $40 $C2
    add  hl, bc                                   ; $5031: $09
    ld   [hl], a                                  ; $5032: $77
    ld   hl, Data_003_4FF7                        ; $5033: $21 $F7 $4F
    add  hl, de                                   ; $5036: $19
    ld   a, [hl]                                  ; $5037: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5038: $21 $50 $C2
    add  hl, bc                                   ; $503B: $09
    ld   [hl], a                                  ; $503C: $77

.jp_003_503D
    ldh  a, [hFrameCounter]                       ; $503D: $F0 $E7
    rra                                           ; $503F: $1F
    rra                                           ; $5040: $1F
    rra                                           ; $5041: $1F
    rra                                           ; $5042: $1F
    and  $01                                      ; $5043: $E6 $01
    jp   SetEntitySpriteVariant                   ; $5045: $C3 $0C $3B

.return
    ld   de, Data_003_4FCB                        ; $5048: $11 $CB $4F
    call func_003_583C                            ; $504B: $CD $3C $58
    ret                                           ; $504E: $C9

OpenChestTilesGBC::
    db   $62, $70, $63, $71

OpenChestTiles::
    db   $62, $70, $62, $70

ChestToInventoryMappingTable::
    db   INVENTORY_POWER_BRACELET                 ; CHEST_POWER_BRACELET
    db   INVENTORY_SHIELD                         ; CHEST_SHIELD
    db   INVENTORY_BOW                            ; CHEST_BOW
    db   INVENTORY_HOOKSHOT                       ; CHEST_HOOKSHOT
    db   INVENTORY_MAGIC_ROD                      ; CHEST_MAGIC_ROD
    db   INVENTORY_PEGASUS_BOOTS                  ; CHEST_PEGASUS_BOOTS
    db   INVENTORY_OCARINA                        ; CHEST_OCARINA
    db   INVENTORY_ROCS_FEATHER                   ; CHEST_FEATHER
    db   INVENTORY_SHOVEL                         ; CHEST_SHOVEL
    db   INVENTORY_MAGIC_POWDER                   ; CHEST_MAGIC_POWDER_BAG
    db   INVENTORY_BOMBS                          ; CHEST_BOMB
    db   INVENTORY_SWORD                          ; CHEST_SWORD

    ; High and low bytes for the CHEST_RUPEE_xxx amounts of rupees
ChestRupeeCountHigh::
    db   $00, $00, $00, $00, $01
ChestRupeeCountLow::
    db   $32, $14, $64, $C8, $F4

EntityInitChestWithItem::
    ld   a, $2A                                   ; $506D: $3E $2A
    ld   [wC111], a                               ; $506F: $EA $11 $C1
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $5072: $3E $04
    ldh  [hNoiseSfx], a                           ; $5074: $E0 $F4
    ld   de, OpenChestTilesGBC                    ; $5076: $11 $4F $50
    ldh  a, [hIsGBC]                              ; $5079: $F0 $FE
    and  a                                        ; $507B: $A7
    jr   z, jr_003_5081                           ; $507C: $28 $03

    ld   de, OpenChestTiles                       ; $507E: $11 $53 $50

jr_003_5081:
    ld   b, $A1                                   ; $5081: $06 $A1
    call func_003_51C9                            ; $5083: $CD $C9 $51
    ld   hl, wEntitiesPosYTable                   ; $5086: $21 $10 $C2
    add  hl, bc                                   ; $5089: $09
    ld   a, [hl]                                  ; $508A: $7E
    sub  $08                                      ; $508B: $D6 $08
    ld   [hl], a                                  ; $508D: $77
    ld   hl, wEntitiesSpeedYTable                 ; $508E: $21 $50 $C2
    add  hl, bc                                   ; $5091: $09
    ld   [hl], $FC                                ; $5092: $36 $FC
    ld   hl, wEntitiesSpriteVariantTable          ; $5094: $21 $B0 $C3
    add  hl, bc                                   ; $5097: $09
    ld   a, [hl]                                  ; $5098: $7E
    ldh  [hFFE8], a                               ; $5099: $E0 $E8
    ld   d, b                                     ; $509B: $50
    cp   CHEST_TAIL_KEY                           ; $509C: $FE $11
    jr   nz, jr_003_50AC                          ; $509E: $20 $0C

    ; Next part seems to be related to the owl flying in when you get the tail key
    push af                                       ; $50A0: $F5
    ld   a, [$C501]                               ; $50A1: $FA $01 $C5
    ld   e, a                                     ; $50A4: $5F
    ld   hl, wEntitiesPrivateCountdown1Table      ; $50A5: $21 $F0 $C2
    add  hl, de                                   ; $50A8: $19
    ld   [hl], $38                                ; $50A9: $36 $38
    pop  af                                       ; $50AB: $F1

jr_003_50AC:
    ld   e, a                                     ; $50AC: $5F
    cp   CHEST_MESSAGE                            ; $50AD: $FE $21
    jp   nc, MarkRoomCompleted                   ; $50AF: $D2 $2A $51

    cp   CHEST_SEASHELL                           ; $50B2: $FE $20
    jr   nz, jr_003_50B9                          ; $50B4: $20 $03

    jp   label_003_636D                           ; $50B6: $C3 $6D $63

jr_003_50B9:
    cp   CHEST_RUPEES_50                          ; $50B9: $FE $1B
    jr   c, jr_003_50D8                           ; $50BB: $38 $1B

    cp   $20                                      ; $50BD: $FE $20
    jr   nc, jr_003_50D8                          ; $50BF: $30 $17

    ld   hl, (ChestRupeeCountLow - CHEST_RUPEES_50); $50C1: $21 $4D $50
    add  hl, de                                   ; $50C4: $19
    ld   a, [hl]                                  ; $50C5: $7E
    ld   [wAddRupeeBufferLow], a                  ; $50C6: $EA $90 $DB
    ld   hl, (ChestRupeeCountHigh - CHEST_RUPEES_50); $50C9: $21 $48 $50
    add  hl, de                                   ; $50CC: $19
    ld   a, [hl]                                  ; $50CD: $7E
    ld   [wAddRupeeBufferHigh], a                 ; $50CE: $EA $8F $DB
    ld   a, $18                                   ; $50D1: $3E $18
    ld   [$C3CE], a                               ; $50D3: $EA $CE $C3
    jr   MarkRoomCompleted                        ; $50D6: $18 $52

jr_003_50D8:
    cp   CHEST_MAP                                ; $50D8: $FE $16
    jr   c, jr_003_50EF                           ; $50DA: $38 $13

    cp   CHEST_RUPEES_50                          ; $50DC: $FE $1B
    jr   nc, jr_003_50EF                          ; $50DE: $30 $0F

    sub  CHEST_MAP                                ; $50E0: $D6 $16
    ld   e, a                                     ; $50E2: $5F
    ld   d, $00                                   ; $50E3: $16 $00
    ld   hl, wHasDungeonMap                       ; $50E5: $21 $CC $DB
    add  hl, de                                   ; $50E8: $19
    inc  [hl]                                     ; $50E9: $34
    call SynchronizeDungeonsItemFlags_trampoline                               ; $50EA: $CD $02 $28
    jr   MarkRoomCompleted                          ; $50ED: $18 $3B

jr_003_50EF:
    cp   CHEST_FLIPPERS                           ; $50EF: $FE $0C
    jr   nc, ChestGiveNoneInventoryItem           ; $50F1: $30 $32

    ; When finding the Shield chest…
    ldh  a, [hFFE8]                               ; $50F3: $F0 $E8
    cp   CHEST_SHIELD                             ; $50F5: $FE $01
    jr   nz, .shieldEnd                           ; $50F7: $20 $04
    ; increment the Shield level.
    ld   hl, wShieldLevel                         ; $50F9: $21 $44 $DB
    inc  [hl]                                     ; $50FC: $34
.shieldEnd

    ; When finding the Power bracelet chest…
    cp   CHEST_POWER_BRACELET                     ; $50FD: $FE $00
    jr   nz, .powerBraceletEnd                    ; $50FF: $20 $0B
    ; … and the LV2 bracelet was not found yet…
    ld   a, [wPowerBraceletLevel]                 ; $5101: $FA $43 $DB
    cp   $02                                      ; $5104: $FE $02
    jr   z, .powerBraceletEnd                     ; $5106: $28 $04

    ; increment the Power bracelet lebel.
    ld   hl, wPowerBraceletLevel                  ; $5108: $21 $43 $DB
    inc  [hl]                                     ; $510B: $34
.powerBraceletEnd

    ; When finding a bomb's chest…
    ldh  a, [hFFE8]                               ; $510C: $F0 $E8
    cp   CHEST_BOMB                               ; $510E: $FE $0A
    jr   nz, .bombsEnd                            ; $5110: $20 $08
    ; increment the bomb's count by 10
    ld   hl, wBombCount                           ; $5112: $21 $4D $DB
    ld   a, [hl]                                  ; $5115: $7E
    add  $01                                      ; $5116: $C6 $01
    daa                                           ; $5118: $27
    ld   [hl], a                                  ; $5119: $77
.bombsEnd

    ld   d, b                                     ; $511A: $50
    ld   hl, ChestToInventoryMappingTable         ; $511B: $21 $57 $50
    add  hl, de                                   ; $511E: $19
    ld   d, [hl]                                  ; $511F: $56
    call GiveInventoryItem                        ; $5120: $CD $72 $64
    jr   MarkRoomCompleted                        ; $5123: $18 $05

ChestGiveNoneInventoryItem:
    ; This handles giving keys, golden leafs and flippers
    ; by increasing the proper memory location.
    ld   hl, wBButtonSlot                         ; $5125: $21 $00 $DB
    add  hl, de                                   ; $5128: $19
    inc  [hl]                                     ; $5129: $34

MarkRoomCompleted::
    call GetRoomStatusAddressInHL                 ; $512A: $CD $34 $51
    ld   a, [hl]                                  ; $512D: $7E
    or   $10                                      ; $512E: $F6 $10
    ld   [hl], a                                  ; $5130: $77
    ldh  [hRoomStatus], a                         ; $5131: $E0 $F8
    ret                                           ; $5133: $C9

GetRoomStatusAddressInHL::
    ld   a, [wIsIndoor]                           ; $5134: $FA $A5 $DB
    ld   d, a                                     ; $5137: $57
    ld   hl, wOverworldRoomStatus                 ; $5138: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $513B: $F0 $F6
    ld   e, a                                     ; $513D: $5F
    ldh  a, [hMapId]                              ; $513E: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5140: $FE $FF
    jr   nz, jr_003_514B                          ; $5142: $20 $07

    ld   d, $00                                   ; $5144: $16 $00
    ld   hl, wColorDungeonRoomStatus              ; $5146: $21 $E0 $DD
    jr   jr_003_5154                              ; $5149: $18 $09

jr_003_514B:
    cp   $1A                                      ; @TODO MAP_UNKNOWN_1A (?)
    jr   nc, jr_003_5154                          ; $514D: $30 $05

    cp   $06                                      ; @tODO MAP_EAGLES_TOWER (?)
    jr   c, jr_003_5154                           ; $5151: $38 $01

    inc  d                                        ; $5153: $14

jr_003_5154:
    add  hl, de                                   ; $5154: $19
    ret                                           ; $5155: $C9

Data_003_5156::
    db   $6A, $7A, $6B, $7B

Data_003_515A::
    db   $10, $12, $11, $13

Data_003_515E::
    db   $F8, $F9, $FA, $FB

Data_003_5162::
    db   $0E, $1E, $0F, $1F

Data_003_5166::
    db   $68, $77, $69, $4B

Data_003_516A::
    db   $76, $76, $76, $76                       ; $516A

EntityInitPushedBlock::
    call func_003_7EFE                            ; $516E: $CD $FE $7E
    ld   d, $00                                   ; $5171: $16 $00
    ld   hl, Data_003_523D                        ; $5173: $21 $3D $52
    add  hl, de                                   ; $5176: $19
    ld   a, [hl]                                  ; $5177: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5178: $21 $40 $C2
    add  hl, bc                                   ; $517B: $09
    ld   [hl], a                                  ; $517C: $77
    ld   hl, Data_003_5241                        ; $517D: $21 $41 $52
    add  hl, de                                   ; $5180: $19
    ld   a, [hl]                                  ; $5181: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5182: $21 $50 $C2
    add  hl, bc                                   ; $5185: $09
    ld   [hl], a                                  ; $5186: $77
    call PushedBlockEntityHandler                 ; $5187: $CD $49 $52
    call func_003_7893                            ; $518A: $CD $93 $78
    ld   hl, wEntitiesCollisionsTable             ; $518D: $21 $A0 $C2
    add  hl, bc                                   ; $5190: $09
    ld   a, [hl]                                  ; $5191: $7E
    and  a                                        ; $5192: $A7
    jr   z, jr_003_5198                           ; $5193: $28 $03

    jp   UnloadEntityAndReturn                    ; $5195: $C3 $8D $3F

jr_003_5198:
    ld   a, NOISE_SFX_BLOCK_RUMBLE                ; $5198: $3E $11
    ldh  [hNoiseSfx], a                           ; $519A: $E0 $F4
    ld   de, Data_003_5166                        ; $519C: $11 $66 $51
    ld   b, $C6                                   ; $519F: $06 $C6
    ldh  a, [hMapRoom]                            ; $51A1: $F0 $F6
    cp   $77                                      ; $51A3: $FE $77
    jr   nz, jr_003_51B3                          ; $51A5: $20 $0C

    ; If the color dungeon is open…
    ld   a, [wColorDungonCorrectTombStones]       ; $51A7: $FA $D9 $DD
    cp   $80                                      ; $51AA: $FE $80
    jr   z, jr_003_51B3                           ; $51AC: $28 $05

    ld   de, Data_003_516A                        ; $51AE: $11 $6A $51
    ld   b, $03                                   ; $51B1: $06 $03

jr_003_51B3:
    ld   a, [wIsIndoor]                           ; $51B3: $FA $A5 $DB
    and  a                                        ; $51B6: $A7
    jr   z, func_003_51C9                         ; $51B7: $28 $10

    ld   de, Data_003_515A                        ; $51B9: $11 $5A $51
    ld   b, $0D                                   ; $51BC: $06 $0D
    ldh  a, [hMapRoom]                            ; $51BE: $F0 $F6
    cp   $C7                                      ; @TODO Richard's Villa?
    jr   nz, func_003_51C9                        ; $51C2: $20 $05

    ld   de, Data_003_5156                        ; $51C4: $11 $56 $51
    ld   b, $BE                                   ; $51C7: $06 $BE

func_003_51C9::
    push de                                       ; $51C9: $D5
    ld   a, b                                     ; $51CA: $78
    push af                                       ; $51CB: $F5
    ld   b, $00                                   ; $51CC: $06 $00
    ldh  a, [hActiveEntityPosY]                   ; $51CE: $F0 $EF
    sub  $0F                                      ; $51D0: $D6 $0F
    ldh  [hSwordIntersectedAreaY], a              ; $51D2: $E0 $CD
    ldh  a, [hActiveEntityPosX]                   ; $51D4: $F0 $EE
    sub  $07                                      ; $51D6: $D6 $07
    ldh  [hSwordIntersectedAreaX], a              ; $51D8: $E0 $CE
    swap a                                        ; $51DA: $CB $37
    and  $0F                                      ; $51DC: $E6 $0F
    ld   e, a                                     ; $51DE: $5F
    ldh  a, [hSwordIntersectedAreaY]              ; $51DF: $F0 $CD
    and  $F0                                      ; $51E1: $E6 $F0
    or   e                                        ; $51E3: $B3
    ld   e, a                                     ; $51E4: $5F
    ld   d, $00                                   ; $51E5: $16 $00
    ld   hl, wRoomObjects                         ; $51E7: $21 $11 $D7
    add  hl, de                                   ; $51EA: $19
    pop  af                                       ; $51EB: $F1
    ld   [hl], a                                  ; $51EC: $77
    ld   [$DDD8], a                               ; $51ED: $EA $D8 $DD
    ld   a, $03                                   ; $51F0: $3E $03
    call func_2BF                                 ; $51F2: $CD $2F $0B

label_003_51F5:
    call label_2887                               ; $51F5: $CD $87 $28
    ld   a, [wRequests]                           ; $51F8: $FA $00 $D6
    ld   e, a                                     ; $51FB: $5F
    ld   d, $00                                   ; $51FC: $16 $00
    ld   hl, wRequestDestinationHigh              ; $51FE: $21 $01 $D6
    add  hl, de                                   ; $5201: $19
    add  $0A                                      ; $5202: $C6 $0A
    ld   [wRequests], a                           ; $5204: $EA $00 $D6
    pop  de                                       ; $5207: $D1
    ldh  a, [$FFCF]                               ; $5208: $F0 $CF
    ld   [hl+], a                                 ; $520A: $22
    ldh  a, [$FFD0]                               ; $520B: $F0 $D0
    ld   [hl+], a                                 ; $520D: $22
    ld   a, $81                                   ; $520E: $3E $81
    ld   [hl+], a                                 ; $5210: $22
    ld   a, [de]                                  ; $5211: $1A
    inc  de                                       ; $5212: $13
    ld   [hl+], a                                 ; $5213: $22
    ld   a, [de]                                  ; $5214: $1A
    inc  de                                       ; $5215: $13
    ld   [hl+], a                                 ; $5216: $22
    ldh  a, [$FFCF]                               ; $5217: $F0 $CF
    ld   [hl+], a                                 ; $5219: $22
    ldh  a, [$FFD0]                               ; $521A: $F0 $D0
    inc  a                                        ; $521C: $3C
    ld   [hl+], a                                 ; $521D: $22
    ld   a, $81                                   ; $521E: $3E $81
    ld   [hl+], a                                 ; $5220: $22
    ld   a, [de]                                  ; $5221: $1A
    inc  de                                       ; $5222: $13
    ld   [hl+], a                                 ; $5223: $22
    ld   a, [de]                                  ; $5224: $1A
    ld   [hl+], a                                 ; $5225: $22
    xor  a                                        ; $5226: $AF
    ld   [hl], a                                  ; $5227: $77
    ldh  a, [hIsGBC]                              ; $5228: $F0 $FE
    and  a                                        ; $522A: $A7
    jr   z, jr_003_5234                           ; $522B: $28 $07

    push bc                                       ; $522D: $C5
    ld   a, $03                                   ; $522E: $3E $03
    call func_91D                                 ; $5230: $CD $1D $09
    pop  bc                                       ; $5233: $C1

jr_003_5234:
    ret                                           ; $5234: $C9

include "code/entities/pushed_block.asm"

func_003_52D4::
    ld   e, $0F                                   ; $52D4: $1E $0F
    ld   d, b                                     ; $52D6: $50

label_003_52D7:
    ld   hl, wEntitiesStatusTable                 ; $52D7: $21 $80 $C2
    add  hl, de                                   ; $52DA: $19
    ld   a, [hl]                                  ; $52DB: $7E
    cp   $05                                      ; $52DC: $FE $05
    jr   c, jr_003_531E                           ; $52DE: $38 $3E

    ld   hl, wEntitiesPhysicsFlagsTable           ; $52E0: $21 $40 $C3
    add  hl, de                                   ; $52E3: $19
    ld   a, [hl]                                  ; $52E4: $7E
    and  $40                                      ; $52E5: $E6 $40
    jr   nz, jr_003_531E                          ; $52E7: $20 $35

    ld   hl, wEntitiesPosXTable                   ; $52E9: $21 $00 $C2
    add  hl, de                                   ; $52EC: $19
    ldh  a, [hActiveEntityPosX]                   ; $52ED: $F0 $EE
    sub  [hl]                                     ; $52EF: $96
    add  $0C                                      ; $52F0: $C6 $0C
    cp   $18                                      ; $52F2: $FE $18
    jr   nc, jr_003_531E                          ; $52F4: $30 $28

    ld   hl, wEntitiesPosYTable                   ; $52F6: $21 $10 $C2
    add  hl, de                                   ; $52F9: $19
    ld   a, [hl]                                  ; $52FA: $7E
    ld   hl, wEntitiesPosZTable                   ; $52FB: $21 $10 $C3
    add  hl, de                                   ; $52FE: $19
    sub  [hl]                                     ; $52FF: $96
    ld   hl, hActiveEntityVisualPosY              ; $5300: $21 $EC $FF
    sub  [hl]                                     ; $5303: $96
    add  $0C                                      ; $5304: $C6 $0C
    cp   $18                                      ; $5306: $FE $18
    jr   nc, jr_003_531E                          ; $5308: $30 $14

    ld   hl, wEntitiesPhysicsFlagsTable           ; $530A: $21 $40 $C3
    add  hl, de                                   ; $530D: $19
    ld   a, [hl]                                  ; $530E: $7E
    and  $20                                      ; $530F: $E6 $20
    jr   nz, jr_003_531E                          ; $5311: $20 $0B

    push bc                                       ; $5313: $C5
    ld   c, e                                     ; $5314: $4B
    ld   b, d                                     ; $5315: $42
    push de                                       ; $5316: $D5
    ld   a, $08                                   ; $5317: $3E $08
    call func_003_6FCC                            ; $5319: $CD $CC $6F
    pop  de                                       ; $531C: $D1
    pop  bc                                       ; $531D: $C1

jr_003_531E:
    dec  e                                        ; $531E: $1D
    ld   a, e                                     ; $531F: $7B
    cp   $FF                                      ; $5320: $FE $FF
    jp   nz, label_003_52D7                       ; $5322: $C2 $D7 $52

    ret                                           ; $5325: $C9

PotEntityHandler::
    ld   d, $03                                   ; $5326: $16 $03

include "code/entities/liftable_rock.asm"

Data_003_5398::
    db   $F0, $17, $F2, $17, $F4, $16, $F6, $16

Data_003_53A0::
    db   $F0, $16, $F2, $16, $F4, $16, $F6, $16

jp_003_53A8::
    ld   a, [wIsIndoor]                           ; $53A8: $FA $A5 $DB
    and  a                                        ; $53AB: $A7
    jr   z, jr_003_53B3                           ; $53AC: $28 $05

    ld   de, Data_003_53A0                        ; $53AE: $11 $A0 $53
    jr   jr_003_53B6                              ; $53B1: $18 $03

jr_003_53B3:
    ld   de, Data_003_5398                        ; $53B3: $11 $98 $53

jr_003_53B6:
    call RenderActiveEntitySpritesPair            ; $53B6: $CD $C0 $3B
    call func_003_7F78                            ; $53B9: $CD $78 $7F
    ld   a, $0B                                   ; $53BC: $3E $0B
    ld   [$C19E], a                               ; $53BE: $EA $9E $C1
    call func_003_75A2                            ; $53C1: $CD $A2 $75
    call func_003_60B3                            ; $53C4: $CD $B3 $60
    ld   hl, wEntitiesStatusTable                 ; $53C7: $21 $80 $C2
    add  hl, bc                                   ; $53CA: $09
    ld   a, [hl]                                  ; $53CB: $7E
    cp   $02                                      ; $53CC: $FE $02
    jp   z, jr_003_5406                           ; $53CE: $CA $06 $54

    ld   hl, wEntitiesPosZTable                   ; $53D1: $21 $10 $C3
    add  hl, bc                                   ; $53D4: $09
    ld   a, [hl]                                  ; $53D5: $7E
    and  a                                        ; $53D6: $A7
    jr   z, func_003_53E4                         ; $53D7: $28 $0B

    ld   hl, wEntitiesCollisionsTable             ; $53D9: $21 $A0 $C2
    add  hl, bc                                   ; $53DC: $09
    ld   a, [hl]                                  ; $53DD: $7E
    and  a                                        ; $53DE: $A7
    jr   z, jr_003_5406                           ; $53DF: $28 $25

    call func_003_5438                            ; $53E1: $CD $38 $54

func_003_53E4::; likely cutting grass
    ld   hl, hNoiseSfx                            ; $53E4: $21 $F4 $FF
    ld   [hl], NOISE_SFX_CUT_GRASS                ; $53E7: $36 $05
    ld   e, $1F                                   ; $53E9: $1E $1F
    ldh  a, [hActiveEntitySpriteVariant]          ; $53EB: $F0 $F1
    cp   $FF                                      ; $53ED: $FE $FF
    jr   z, jr_003_53F9                           ; $53EF: $28 $08

    cp   $01                                      ; $53F1: $FE $01
    jr   z, jr_003_53F9                           ; $53F3: $28 $04

    ld   [hl], $09                                ; $53F5: $36 $09
    ld   e, $0F                                   ; $53F7: $1E $0F

jr_003_53F9:
    ld   hl, wEntitiesPrivateCountdown1Table      ; $53F9: $21 $F0 $C2
    add  hl, bc                                   ; $53FC: $09
    ld   [hl], e                                  ; $53FD: $73
    ld   hl, wEntitiesPhysicsFlagsTable           ; $53FE: $21 $40 $C3
    add  hl, bc                                   ; $5401: $09
    ld   a, [hl]                                  ; $5402: $7E
    add  $02                                      ; $5403: $C6 $02
    ld   [hl], a                                  ; $5405: $77

jr_003_5406:
    ret                                           ; $5406: $C9

SmashRock::
    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK           ; $5407: $3E $05
    call SpawnNewEntity                           ; $5409: $CD $CA $64
    ret  c                                        ; $540C: $D8

    ;
    ; Smash rock
    ;

    ldh  a, [hScratch0]                           ; $540D: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $540F: $21 $00 $C2
    add  hl, de                                   ; $5412: $19
    ld   [hl], a                                  ; $5413: $77
    ldh  a, [hScratch1]                           ; $5414: $F0 $D8
    ld   hl, hScratch3                            ; $5416: $21 $DA $FF
    sub  [hl]                                     ; $5419: $96
    ld   hl, wEntitiesPosYTable                   ; $541A: $21 $10 $C2
    add  hl, de                                   ; $541D: $19
    ld   [hl], a                                  ; $541E: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $541F: $21 $B0 $C3
    add  hl, de                                   ; $5422: $19
    ld   [hl], $00                                ; $5423: $36 $00
    ld   hl, wEntitiesPrivateCountdown1Table      ; $5425: $21 $F0 $C2
    add  hl, de                                   ; $5428: $19
    ld   [hl], $0F                                ; $5429: $36 $0F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $542B: $21 $40 $C3
    add  hl, de                                   ; $542E: $19
    ld   [hl], $C4                                ; $542F: $36 $C4
    ld   a, NOISE_SFX_POT_SMASHED                 ; $5431: $3E $09
    ldh  [hNoiseSfx], a                           ; $5433: $E0 $F4
    jp   UnloadEntityAndReturn                    ; $5435: $C3 $8D $3F

func_003_5438::
    ld   hl, wEntitiesCollisionsTable             ; $5438: $21 $A0 $C2
    add  hl, bc                                   ; $543B: $09
    ld   a, [hl]                                  ; $543C: $7E
    and  a                                        ; $543D: $A7
    ret  z                                        ; $543E: $C8

    ld   a, [wRoomEvent]                          ; $543F: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $5442: $E6 $1F
    cp   TRIGGER_THROW_POT_AT_CHEST               ; $5444: $FE $0D
    jr   nz, jr_003_5467                          ; $5446: $20 $1F

    ld   a, [$C503]                               ; $5448: $FA $03 $C5
    cp   $A0                                      ; $544B: $FE $A0
    jr   z, jr_003_5455                           ; $544D: $28 $06

    ld   a, [$C50D]                               ; $544F: $FA $0D $C5
    cp   $A0                                      ; $5452: $FE $A0
    ret  nz                                       ; $5454: $C0

jr_003_5455:
    ld   a, $30                                   ; $5455: $3E $30
    ldh  [hSwordIntersectedAreaX], a              ; $5457: $E0 $CE
    ld   a, $20                                   ; $5459: $3E $20
    ldh  [hSwordIntersectedAreaY], a              ; $545B: $E0 $CD
    ld   a, $19                                   ; $545D: $3E $19
    ldh  [hScratch8], a                           ; $545F: $E0 $DF
    call label_3E4D                               ; $5461: $CD $4D $3E
    jp   MarkTriggerAsResolved                    ; $5464: $C3 $60 $0C

jr_003_5467:
    cp   $0B                                      ; $5467: $FE $0B
    ret  nz                                       ; $5469: $C0

    ld   a, [$C50D]                               ; $546A: $FA $0D $C5
    cp   $35                                      ; $546D: $FE $35
    ret  c                                        ; $546F: $D8

    cp   $3D                                      ; $5470: $FE $3D
    jr   c, jr_003_547D                           ; $5472: $38 $09

    ld   a, [$C503]                               ; $5474: $FA $03 $C5
    cp   $35                                      ; $5477: $FE $35
    ret  c                                        ; $5479: $D8

    cp   $3D                                      ; $547A: $FE $3D
    ret  nc                                       ; $547C: $D0

jr_003_547D:
    jp   MarkTriggerAsResolved                    ; $547D: $C3 $60 $0C

; Alternate explosion GFX display list (unused?)
Data_003_5480::
    db   $32, $01, $32, $61

; Explosion GFX display list
Data_003_5484::
    db   $30, $01, $30, $61

Data_003_5488::
    db   $00, $00, $3C, $01, $00, $08, $3C, $21, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $00, $00, $3A, $01, $00, $08, $3A, $21, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $FA, $FA, $3A, $01, $FA, $02, $3A, $21, $06, $06, $3A, $01, $06, $0E, $3A, $21
    db   $04, $FC, $30, $01, $04, $04, $30, $21, $FC, $04, $30, $01, $FC, $0C, $30, $21

Data_003_54C8::
    db   $00, $00, $3A, $01, $00, $08, $3A, $21, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db   $F8, $F8, $3A, $01, $F8, $00, $3A, $21, $08, $08, $3A, $01, $08, $10, $3A, $21
    db   $08, $F8, $3A, $01, $08, $00, $3A, $21, $F8, $08, $3A, $01, $F8, $10, $3A, $21
    db   $F8, $F8, $10, $02, $F8, $00, $12, $02, $F8, $08, $12, $22, $F8, $10, $10, $22
    db   $08, $F8, $10, $42, $08, $00, $12, $42, $08, $08, $12, $62, $08, $10, $10, $62

EntityDeathHandler::
    ld   hl, wEntitiesUnknowTableH                ; $5518: $21 $30 $C4
    add  hl, bc                                   ; $551B: $09
    ld   a, [hl]                                  ; $551C: $7E
    and  $80                                      ; $551D: $E6 $80
    jr   z, .dying                                ; $551F: $28 $03

    jp   ExecuteActiveEntityHandler               ; $5521: $C3 $8D $3A

.dying
    ld   hl, wEntitiesUnknowTableV                ; $5524: $21 $80 $C4
    add  hl, bc                                   ; $5527: $09
    ld   a, [hl]                                  ; $5528: $7E
    and  a                                        ; $5529: $A7
    jp   z, DidKillEnemy                          ; $552A: $CA $50 $3F

    push af                                       ; $552D: $F5
    ld   hl, wEntitiesUnknowTableZ                ; $552E: $21 $A0 $C4
    add  hl, bc                                   ; $5531: $09
    ld   a, [hl]                                  ; $5532: $7E
    ld   hl, Data_003_5488                        ; $5533: $21 $88 $54
    and  a                                        ; $5536: $A7
    jr   z, jr_003_553C                           ; $5537: $28 $03

    ld   hl, Data_003_54C8                        ; $5539: $21 $C8 $54

jr_003_553C:
    pop  af                                       ; $553C: $F1
    cp   $20                                      ; $553D: $FE $20
    jr   nc, jr_003_556F                          ; $553F: $30 $2E

    rla                                           ; $5541: $17
    and  $30                                      ; $5542: $E6 $30
    ld   e, a                                     ; $5544: $5F
    ld   d, b                                     ; $5545: $50
    add  hl, de                                   ; $5546: $19
    cp   $30                                      ; $5547: $FE $30
    jr   nz, jr_003_5555                          ; $5549: $20 $0A

    push hl                                       ; $554B: $E5
    ld   hl, wEntitiesUnknowTableZ                ; $554C: $21 $A0 $C4
    add  hl, bc                                   ; $554F: $09
    ld   a, [hl]                                  ; $5550: $7E
    pop  hl                                       ; $5551: $E1
    and  a                                        ; $5552: $A7
    jr   nz, jr_003_555C                          ; $5553: $20 $07

jr_003_5555:
    ld   c, $04                                   ; $5555: $0E $04
    call RenderActiveEntitySpritesRect            ; $5557: $CD $E6 $3C
    jr   jr_003_5568                              ; $555A: $18 $0C

jr_003_555C:
    ld   c, $08                                   ; $555C: $0E $08
    call RenderActiveEntitySpritesRect            ; $555E: $CD $E6 $3C
    ld   a, $04                                   ; $5561: $3E $04
    call label_3DA0                               ; $5563: $CD $A0 $3D
    jr   jr_003_5568                              ; $5566: $18 $00

jr_003_5568:
    call func_003_7F78                            ; $5568: $CD $78 $7F
    call func_003_7FA9                            ; $556B: $CD $A9 $7F
    ret                                           ; $556E: $C9

jr_003_556F:
    call ExecuteActiveEntityHandler_trampoline    ; $556F: $CD $81 $3A
    call func_003_7F7E                            ; $5572: $CD $7E $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5575: $21 $10 $C4
    add  hl, bc                                   ; $5578: $09
    ld   a, [hl]                                  ; $5579: $7E
    and  a                                        ; $557A: $A7
    jr   nz, jr_003_5599                          ; $557B: $20 $1C

    ld   hl, wEntitiesUnknowTableV                ; $557D: $21 $80 $C4
    add  hl, bc                                   ; $5580: $09
    ld   [hl], $1F                                ; $5581: $36 $1F
    ld   a, [wTunicType]                          ; $5583: $FA $0F $DC
    and  a                                        ; $5586: $A7
    jr   nz, jr_003_5594                          ; $5587: $20 $0B

    ld   a, [wActivePowerUp]                      ; $5589: $FA $7C $D4
    cp   $01                                      ; $558C: $FE $01
    jr   nz, jr_003_5594                          ; $558E: $20 $04

    ld   a, $12                                   ; $5590: $3E $12
    ldh  [hWaveSfx], a                            ; $5592: $E0 $F3

jr_003_5594:
    ld   hl, hNoiseSfx                            ; $5594: $21 $F4 $FF
    ld   [hl], $13                                ; $5597: $36 $13

jr_003_5599:
    call func_003_7FA9                            ; $5599: $CD $A9 $7F
    ret                                           ; $559C: $C9

Data_003_559D::
    ; db   $C9 (data actually uses the previous `ret` instruction)
    db   $2E, $2E, $2D, $2D, $37, $2D, $FF, $FF, $2F, $37, $38, $2E, $2F

Data_003_55AA::
    db   $2F, $03, $01, $01, $00, $03, $03, $03, $03, $01, $00, $00, $00, $03

Data_003_55B8::
    db   $00, $01, $01, $01, $00, $01, $01, $01, $01, $01, $00, $00, $00, $01, $00

Data_003_55C7::
    db   $2E, $2D, $38, $2F, $2E, $2D, $38, $37

; Entities random drop tables
; Spawn a dropped item when an enemy is destroyed.
; The item can be:
;  - The shield eaten by a Like-Like
;  - A specific dropped item defined by the entity
;  - A power-up (fragment of power or guardian acorn)
;  - A random object set by the drop table
;
; Input:
;   bc   destroyed entity index
SpawnEnemyDrop::
    ldh  a, [hActiveEntityType]                   ; $55CF: $F0 $EB
    cp   ENTITY_LIKE_LIKE                         ; $55D1: $FE $23
    jr   nz, .likeLikeEnd                         ; $55D3: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $55D5: $21 $B0 $C2
    add  hl, bc                                   ; $55D8: $09
    ld   a, [hl]                                  ; $55D9: $7E
    and  a                                        ; $55DA: $A7
    jr   z, .likeLikeEnd                          ; $55DB: $28 $05

    ld   a, ENTITY_SWORD                          ; @TODO Pretty sure likelikes only eat shields and this entity is both
    jp   .dropEntity                              ; $55DF: $C3 $70 $56
.likeLikeEnd

    ld   hl, wEntitiesDroppedItemTable            ; $55E2: $21 $E0 $C4
    add  hl, bc                                   ; $55E5: $09
    ld   a, [hl]                                  ; $55E6: $7E
    cp   $FF                                      ; $55E7: $FE $FF
    ret  z                                        ; $55E9: $C8

    and  a                                        ; $55EA: $A7
    jp   nz, .dropEntity                          ; $55EB: $C2 $70 $56

    ld   a, [wGuardianAcornCounter]               ; $55EE: $FA $71 $D4
    inc  a                                        ; $55F1: $3C
    ld   [wGuardianAcornCounter], a               ; $55F2: $EA $71 $D4
    cp   $0C                                      ; $55F5: $FE $0C
    jr   c, .jr_003_560F                          ; $55F7: $38 $16

    xor  a                                        ; $55F9: $AF
    ld   [wGuardianAcornCounter], a               ; $55FA: $EA $71 $D4
    ld   a, [wInBossBattle]                       ; $55FD: $FA $BE $C1
    ld   hl, wActivePowerUp                       ; $5600: $21 $7C $D4
    or   [hl]                                     ; $5603: $B6
    ld   hl, hIsSideScrolling                     ; $5604: $21 $F9 $FF
    or   [hl]                                     ; $5607: $B6
    jr   nz, .jr_003_560F                         ; $5608: $20 $05

    ld   a, ENTITY_GUARDIAN_ACORN                 ; $560A: $3E $34
    jp   .dropEntity                              ; $560C: $C3 $70 $56

.jr_003_560F
    ld   hl, wEntitiesHealthGroup                 ; $560F: $21 $D0 $C4
    add  hl, bc                                   ; $5612: $09
    ld   d, b                                     ; $5613: $50
    ld   e, [hl]                                  ; $5614: $5E
    ld   hl, Data_003_4826                        ; $5615: $21 $26 $48
    add  hl, de                                   ; $5618: $19
    ld   a, [hl]                                  ; $5619: $7E
    and  a                                        ; $561A: $A7
    ret  z                                        ; $561B: $C8

    ld   e, a                                     ; How many enemies to kill before a Piece of Power drops?
    ld   d, $1E                                   ; Max HP 0~6: 30
    ld   a, [wMaxHealth]                          ;
    cp   $07                                      ; If max HP <= 6, skip
    jr   c, .jr_003_562E                          ;

    ld   d, $23                                   ; Max HP 7~10: 35
    cp   $0B                                      ;
    jr   c, .jr_003_562E                          ; If max HP <= 11, skip

    ld   d, $28                                   ; Max HP 11~14: 40

.jr_003_562E
    ld   hl, wPieceOfPowerKillCount               ; $562E: $21 $15 $D4
    inc  [hl]                                     ; $5631: $34
    ld   a, [hl]                                  ; $5632: $7E
    cp   d                                        ; $5633: $BA
    jr   c, .jr_003_5648                          ; $5634: $38 $12

    ld   [hl], b                                  ; $5636: $70
    ld   a, [wInBossBattle]                       ; $5637: $FA $BE $C1
    ld   hl, hIsSideScrolling                     ; $563A: $21 $F9 $FF
    or   [hl]                                     ; $563D: $B6
    ld   hl, wActivePowerUp                       ; $563E: $21 $7C $D4
    or   [hl]                                     ; $5641: $B6
    jr   nz, .jr_003_5648                         ; $5642: $20 $04

    ld   a, ENTITY_PIECE_OF_POWER                 ; $5644: $3E $33
    jr   .dropEntity                              ; $5646: $18 $28

.jr_003_5648
    ld   d, b                                     ; $5648: $50
    ld   hl, Data_003_55AA                        ; $5649: $21 $AA $55
    ld   a, [wC163]                               ; $564C: $FA $63 $C1
    and  a                                        ; $564F: $A7
    jr   z, .jr_003_5655                          ; $5650: $28 $03

    ld   hl, Data_003_55B8                        ; $5652: $21 $B8 $55

.jr_003_5655
    add  hl, de                                   ; $5655: $19
    call GetRandomByte                            ; $5656: $CD $0D $28
    and  [hl]                                     ; $5659: $A6
    ret  nz                                       ; $565A: $C0

    ld   hl, (Data_003_559D - 1)                  ; $565B: $21 $9C $55
    add  hl, de                                   ; $565E: $19
    ld   a, [hl]                                  ; $565F: $7E
    cp   $FF                                      ; $5660: $FE $FF
    jr   nz, .dropEntity                          ; $5662: $20 $0C

    call GetRandomByte                            ; $5664: $CD $0D $28
    and  $07                                      ; $5667: $E6 $07
    ld   e, a                                     ; $5669: $5F
    ld   d, b                                     ; $566A: $50
    ld   hl, Data_003_55C7                        ; $566B: $21 $C7 $55
    add  hl, de                                   ; $566E: $19
    ld   a, [hl]                                  ; $566F: $7E

.dropEntity
    ; Spawn the entity (and return if the entity could not be created)
    call SpawnNewEntity                           ; $5670: $CD $CA $64
    ret  c                                        ; $5673: $D8

    ; Configure the dropped item entity
    ld   hl, wEntitiesPrivateState1Table          ; $5674: $21 $B0 $C2
    add  hl, bc                                   ; $5677: $09
    ld   a, [hl]                                  ; $5678: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $5679: $21 $B0 $C2
    add  hl, de                                   ; $567C: $19
    ld   [hl], a                                  ; $567D: $77

    ldh  a, [hScratch0]                           ; $567E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $5680: $21 $00 $C2
    add  hl, de                                   ; $5683: $19
    ld   [hl], a                                  ; $5684: $77
    ldh  a, [hScratch1]                           ; $5685: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5687: $21 $10 $C2
    add  hl, de                                   ; $568A: $19
    ld   [hl], a                                  ; $568B: $77

    ld   hl, wEntitiesDropTimerTable              ; $568C: $21 $50 $C4
    add  hl, de                                   ; $568F: $19
    ld   [hl], $80                                ; $5690: $36 $80

    ld   hl, wEntitiesPrivateCountdown1Table      ; $5692: $21 $F0 $C2
    add  hl, de                                   ; $5695: $19
    ld   [hl], $18                                ; $5696: $36 $18

    ld   hl, wEntitiesUnknowTableV                ; $5698: $21 $80 $C4
    add  hl, de                                   ; $569B: $19
    ld   [hl], $03                                ; $569C: $36 $03

    ldh  a, [hIsSideScrolling]                    ; $569E: $F0 $F9
    and  a                                        ; $56A0: $A7
    jr   nz, .isSideScrolling                     ; $56A1: $20 $36

    ld   hl, wEntitiesTypeTable                   ; $56A3: $21 $A0 $C3
    add  hl, de                                   ; $56A6: $19
    ld   a, [hl]                                  ; $56A7: $7E
    cp   ENTITY_KEY_DROP_POINT                    ; $56A8: $FE $30
    jr   nz, .jr_003_56B8                         ; $56AA: $20 $0C

    ldh  a, [hActiveEntityType]                   ; $56AC: $F0 $EB
    cp   ENTITY_ARMOS_KNIGHT                      ; $56AE: $FE $88
    jr   nz, .jr_003_56B8                         ; $56B0: $20 $06

    ld   hl, wEntitiesSpriteVariantTable          ; $56B2: $21 $B0 $C3
    add  hl, de                                   ; $56B5: $19
    ld   [hl], $03                                ; $56B6: $36 $03

.jr_003_56B8
    cp   ENTITY_HIDING_SLIME_KEY                  ; $56B8: $FE $3C
    jr   nz, .slimeKeyEnd                         ; $56BA: $20 $15

    ldh  a, [hMapRoom]                            ; $56BC: $F0 $F6
    cp   $58                                      ; Overworld Kanalet Castle crow room
    jr   z, .moveKeyTowardsLink                   ; $56C0: $28 $04

    cp   $5A                                      ; Overwrold Kanalet Castle five-pits room
    jr   nz, .slimeKeyEnd                         ; $56C4: $20 $0B

.moveKeyTowardsLink
    push bc                                       ; $56C6: $C5
    push de                                       ; $56C7: $D5
    ld   c, e                                     ; $56C8: $4B
    ld   b, d                                     ; $56C9: $42
    ld   a, $10                                   ; $56CA: $3E $10
    call ApplyVectorTowardsLink                   ; $56CC: $CD $C7 $7E
    pop  de                                       ; $56CF: $D1
    pop  bc                                       ; $56D0: $C1
.slimeKeyEnd

    ld   hl, wEntitiesSpeedZTable                                ; $56D1: $21 $20 $C3
    add  hl, de                                   ; $56D4: $19
    ld   [hl], $18                                ; $56D5: $36 $18
    jr   .applyDefaultPosZ                        ; $56D7: $18 $06

.isSideScrolling
    ld   hl, wEntitiesSpeedYTable                 ; $56D9: $21 $50 $C2
    add  hl, de                                   ; $56DC: $19
    ld   [hl], $EC                                ; $56DD: $36 $EC

.applyDefaultPosZ
    ; Give the dropped item the same Z position than the destroyed enemy
    ld   hl, wEntitiesPosZTable                   ; $56DF: $21 $10 $C3
    add  hl, bc                                   ; $56E2: $09
    ld   a, [hl]                                  ; $56E3: $7E
    ld   hl, wEntitiesPosZTable                   ; $56E4: $21 $10 $C3
    add  hl, de                                   ; $56E7: $19
    ld   [hl], a                                  ; $56E8: $77

    ret                                           ; $56E9: $C9

Data_003_56EA::
    db   $01, $08, $08, $10

Data_003_56EE::
    db   $01, $04, $04

Data_003_56F1::
    db   $0A, $37, $37, $37, $01, $39, $39, $39, $01, $3B, $3B, $3B, $01, $3D, $3D, $3D

Data_003_5701::
    db   $01, $10, $10, $08, $00, $F0, $F0, $F8, $00, $00, $00, $00, $00, $FF, $FF, $FF

Data_003_5711::
    db   $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08

Data_003_5721::
    db   $00, $00, $00, $08, $0E, $00, $00, $08, $0E, $00, $00, $08, $0E, $00, $00, $00
    db   $0E

EntityLiftedHandler::
    ldh  a, [hActiveEntityType]                   ; $5732: $F0 $EB
    ld   [wLiftedEntityType], a                   ; $5734: $EA $A8 $C5
    cp   ENTITY_BOMB                              ; $5737: $FE $02
    jr   nz, jr_003_5745                          ; $5739: $20 $0A

    ld   hl, wEntitiesFlashCountdownTable         ; $573B: $21 $20 $C4
    add  hl, bc                                   ; $573E: $09
    ld   [hl], b                                  ; $573F: $70
    call func_003_6711                            ; $5740: $CD $11 $67
    jr   jr_003_5748                              ; $5743: $18 $03

jr_003_5745:
    call ExecuteActiveEntityHandler_trampoline    ; $5745: $CD $81 $3A

jr_003_5748:
    ld   hl, wEntitiesUnknowTableW                ; $5748: $21 $90 $C4
    add  hl, bc                                   ; $574B: $09
    ld   a, [hl]                                  ; $574C: $7E
    ld   e, a                                     ; $574D: $5F
    ld   d, b                                     ; $574E: $50
    cp   $04                                      ; $574F: $FE $04
    jr   z, jr_003_5789                           ; $5751: $28 $36

    ld   a, [wC15D]                               ; $5753: $FA $5D $C1
    ldh  [hLinkDirection], a                      ; $5756: $E0 $9E
    push hl                                       ; $5758: $E5
    call GetEntityTransitionCountdown             ; $5759: $CD $05 $0C
    pop  hl                                       ; $575C: $E1
    and  a                                        ; $575D: $A7
    jr   nz, jr_003_5789                          ; $575E: $20 $29

    inc  [hl]                                     ; $5760: $34
    ld   hl, Data_003_56EA                        ; $5761: $21 $EA $56

    ldh  a, [hActiveEntityType]                   ; $5764: $F0 $EB
    cp   ENTITY_BOMB                              ; $5766: $FE $02
    jr   z, jr_003_577F                           ; $5768: $28 $15

    ld   a, [wPowerBraceletLevel]                 ; $576A: $FA $43 $DB
    cp   $02                                      ; $576D: $FE $02
    jr   nc, jr_003_577F                          ; $576F: $30 $0E

    ld   a, [wTunicType]                          ; $5771: $FA $0F $DC
    and  $01                                      ; $5774: $E6 $01
    jr   nz, jr_003_577F                          ; $5776: $20 $07

    ld   a, [wActivePowerUp]                      ; $5778: $FA $7C $D4
    cp   $01                                      ; $577B: $FE $01
    jr   nz, jr_003_5782                          ; $577D: $20 $03

jr_003_577F:
    ld   hl, Data_003_56EE                        ; $577F: $21 $EE $56

jr_003_5782:
    add  hl, de                                   ; $5782: $19
    ld   a, [hl]                                  ; $5783: $7E
    ld   hl, wEntitiesTransitionCountdownTable    ; $5784: $21 $E0 $C2
    add  hl, bc                                   ; $5787: $09
    ld   [hl], a                                  ; $5788: $77

jr_003_5789:
    ld   a, e                                     ; $5789: $7B
    cp   $00                                      ; $578A: $FE $00
    jr   nz, jr_003_578F                          ; $578C: $20 $01

    inc  e                                        ; $578E: $1C

jr_003_578F:
    call func_003_5795                            ; $578F: $CD $95 $57
    jp   label_003_57E6                           ; $5792: $C3 $E6 $57

func_003_5795::
    ldh  a, [hLinkDirection]                      ; $5795: $F0 $9E
    sla  a                                        ; $5797: $CB $27
    sla  a                                        ; $5799: $CB $27
    add  e                                        ; $579B: $83
    ld   e, a                                     ; $579C: $5F
    ld   d, $00                                   ; $579D: $16 $00
    ld   hl, Data_003_56F1                        ; $579F: $21 $F1 $56
    add  hl, de                                   ; $57A2: $19
    ld   a, [hl]                                  ; $57A3: $7E
    ld   [wIsCarryingLiftedObject], a             ; $57A4: $EA $5C $C1
    ld   hl, Data_003_5701                        ; $57A7: $21 $01 $57
    add  hl, de                                   ; $57AA: $19
    ld   a, [hl]                                  ; $57AB: $7E
    ld   hl, hLinkPositionX                       ; $57AC: $21 $98 $FF
    add  [hl]                                     ; $57AF: $86
    ld   hl, wEntitiesPosXTable                   ; $57B0: $21 $00 $C2
    add  hl, bc                                   ; $57B3: $09
    ld   [hl], a                                  ; $57B4: $77
    ld   hl, Data_003_5711                        ; $57B5: $21 $11 $57
    add  hl, de                                   ; $57B8: $19
    ld   a, [hl]                                  ; $57B9: $7E
    ld   hl, hLinkPositionY                       ; $57BA: $21 $99 $FF
    add  [hl]                                     ; $57BD: $86
    ld   hl, $C13B                                ; $57BE: $21 $3B $C1
    add  [hl]                                     ; $57C1: $86
    ld   hl, wEntitiesPosYTable                   ; $57C2: $21 $10 $C2
    add  hl, bc                                   ; $57C5: $09
    ld   [hl], a                                  ; $57C6: $77
    ldh  a, [hIsSideScrolling]                    ; $57C7: $F0 $F9
    and  a                                        ; $57C9: $A7
    jr   z, jr_003_57D7                           ; $57CA: $28 $0B

    push hl                                       ; $57CC: $E5
    ld   hl, Data_003_5721                        ; $57CD: $21 $21 $57
    add  hl, de                                   ; $57D0: $19
    ld   e, [hl]                                  ; $57D1: $5E
    pop  hl                                       ; $57D2: $E1
    ld   a, [hl]                                  ; $57D3: $7E
    sub  e                                        ; $57D4: $93
    ld   [hl], a                                  ; $57D5: $77
    ret                                           ; $57D6: $C9

jr_003_57D7:
    ld   hl, Data_003_5721                        ; $57D7: $21 $21 $57
    add  hl, de                                   ; $57DA: $19
    ld   a, [hl]                                  ; $57DB: $7E
    ld   hl, hLinkPositionZ                       ; $57DC: $21 $A2 $FF
    add  [hl]                                     ; $57DF: $86
    ld   hl, wEntitiesPosZTable                   ; $57E0: $21 $10 $C3
    add  hl, bc                                   ; $57E3: $09
    ld   [hl], a                                  ; $57E4: $77
    ret                                           ; $57E5: $C9

label_003_57E6:
    jp   label_397B                               ; $57E6: $C3 $7B $39

OctorockEntityHandler::
    ld   de, Data_003_57FB                        ; $57E9: $11 $FB $57
    ld   a, [wGameplayType]                       ; $57EC: $FA $95 $DB
    cp   $01                                      ; $57EF: $FE $01
    jr   z, jr_003_57F7                           ; $57F1: $28 $04

    ld   a, $30                                   ; $57F3: $3E $30
    ldh  [hActiveEntityTilesOffset], a            ; $57F5: $E0 $F5

jr_003_57F7:
    call func_003_583C                            ; $57F7: $CD $3C $58
    ret                                           ; $57FA: $C9

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
    jr   nz, jr_003_5835                          ; $582B: $20 $08

    ld   a, [wIsBowWowFollowingLink]              ; $582D: $FA $56 $DB
    cp   $80                                      ; $5830: $FE $80
    jp   nz, UnloadEntityAndReturn                ; $5832: $C2 $8D $3F

jr_003_5835:
    ld   a, c                                     ; $5835: $79
    ld   [$D153], a                               ; $5836: $EA $53 $D1
    ld   de, Data_003_5917                        ; $5839: $11 $17 $59

func_003_583C::
    call RenderActiveEntitySpritesPair            ; $583C: $CD $C0 $3B
    call func_003_7F78                            ; $583F: $CD $78 $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $5842: $21 $10 $C4
    add  hl, bc                                   ; $5845: $09
    ld   a, [hl]                                  ; $5846: $7E

jr_003_5847:
    and  a                                        ; $5847: $A7
    jr   z, jr_003_5858                           ; $5848: $28 $0E

    ld   hl, wEntitiesStateTable                  ; $584A: $21 $90 $C2
    add  hl, bc                                   ; $584D: $09
    ld   a, $01                                   ; $584E: $3E $01
    ld   [hl], a                                  ; $5850: $77
    ldh  [hActiveEntityState], a                  ; $5851: $E0 $F0
    call GetEntityTransitionCountdown             ; $5853: $CD $05 $0C
    ld   [hl], $40                                ; $5856: $36 $40

jr_003_5858:
    call func_003_7FA9                            ; $5858: $CD $A9 $7F
    call func_003_6E28                            ; $585B: $CD $28 $6E
    ldh  a, [hActiveEntityState]                  ; $585E: $F0 $F0
    and  a                                        ; $5860: $A7
    jr   z, jr_003_58D7                           ; $5861: $28 $74

    call GetEntityTransitionCountdown             ; $5863: $CD $05 $0C
    jr   z, jr_003_5896                           ; $5866: $28 $2E

    cp   $0A                                      ; $5868: $FE $0A
    jr   nz, jr_003_5889                          ; $586A: $20 $1D

    call GetEntityPrivateCountdown1               ; $586C: $CD $00 $0C
    jr   nz, jr_003_5889                          ; $586F: $20 $18

    call func_003_7EFE                            ; $5871: $CD $FE $7E
    ld   hl, wEntitiesDirectionTable              ; $5874: $21 $80 $C3
    add  hl, bc                                   ; $5877: $09
    ld   a, e                                     ; $5878: $7B
    cp   [hl]                                     ; $5879: $BE
    jr   nz, jr_003_5889                          ; $587A: $20 $0D

    ldh  a, [hActiveEntityType]                   ; $587C: $F0 $EB
    cp   ENTITY_IRON_MASK                         ; $587E: $FE $24
    jr   z, jr_003_5889                           ; $5880: $28 $07

    cp   ENTITY_OCTOROCK                          ; $5882: $FE $09
    jr   z, jr_003_588D                           ; $5884: $28 $07

    call SpawnMoblinArrow                         ; $5886: $CD $47 $59

jr_003_5889:
    call func_003_7893                            ; $5889: $CD $93 $78
    ret                                           ; $588C: $C9

jr_003_588D:
    ld   a, [wGameplayType]                       ; $588D: $FA $95 $DB
    cp   $01                                      ; $5890: $FE $01
    ret  z                                        ; $5892: $C8

    jp   SpawnOctorockRock                        ; $5893: $C3 $98 $59

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
    jr   nz, jr_003_58B6                          ; $58AF: $20 $05

    call func_003_7EFE                            ; $58B1: $CD $FE $7E
    jr   jr_003_58B9                              ; $58B4: $18 $03

jr_003_58B6:
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
    jr   nz, jr_003_58E5                          ; $58DE: $20 $05

    call GetEntityTransitionCountdown             ; $58E0: $CD $05 $0C
    jr   nz, jr_003_58F6                          ; $58E3: $20 $11

jr_003_58E5:
    call GetRandomByte                            ; $58E5: $CD $0D $28
    and  $0F                                      ; $58E8: $E6 $0F
    or   $10                                      ; $58EA: $F6 $10
    ld   [hl], a                                  ; $58EC: $77
    ld   hl, wEntitiesStateTable                  ; $58ED: $21 $90 $C2
    add  hl, bc                                   ; $58F0: $09
    ld   [hl], $01                                ; $58F1: $36 $01
    call ClearEntitySpeed                         ; $58F3: $CD $7F $3D

jr_003_58F6:
    call func_003_7F25                            ; $58F6: $CD $25 $7F
    call func_003_7893                            ; $58F9: $CD $93 $78

func_003_58FC::
    ld   hl, wEntitiesDirectionTable              ; $58FC: $21 $80 $C3
    add  hl, bc                                   ; $58FF: $09
    ld   e, [hl]                                  ; $5900: $5E
    ld   d, b                                     ; $5901: $50
    ld   hl, Data_003_5823                        ; $5902: $21 $23 $58
    add  hl, de                                   ; $5905: $19
    push hl                                       ; $5906: $E5
    ld   hl, wEntitiesUnknowTableY                ; $5907: $21 $D0 $C3
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

Data_003_5917::
    db   $60, $03, $62, $03, $62, $23, $60, $23, $64, $03, $66, $03, $66, $23, $64, $23
    db   $68, $03, $6A, $03, $6C, $03, $6E, $03, $6A, $23, $68, $23, $6E, $23, $6C, $23

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
    jr   c, jr_003_598B                           ; $594C: $38 $3D

    push bc                                       ; $594E: $C5
    ldh  a, [hScratch2]                           ; $594F: $F0 $D9
    ld   c, a                                     ; $5951: $4F
    ld   hl, Data_003_5937                        ; $5952: $21 $37 $59
    add  hl, bc                                   ; $5955: $09
    ldh  a, [hScratch0]                           ; $5956: $F0 $D7
    add  [hl]                                     ; $5958: $86
    ld   hl, wEntitiesPosXTable                   ; $5959: $21 $00 $C2
    add  hl, de                                   ; $595C: $19
    ld   [hl], a                                  ; $595D: $77
    ld   hl, Data_003_593B                        ; $595E: $21 $3B $59
    add  hl, bc                                   ; $5961: $09
    ldh  a, [hScratch1]                           ; $5962: $F0 $D8
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

jr_003_5974:
    ld   hl, Data_003_5943                        ; $5974: $21 $43 $59
    add  hl, bc                                   ; $5977: $09
    ld   a, [hl]                                  ; $5978: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5979: $21 $50 $C2
    add  hl, de                                   ; $597C: $19
    ld   [hl], a                                  ; $597D: $77
    ldh  a, [hScratch2]                           ; $597E: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $5980: $21 $B0 $C3
    add  hl, de                                   ; $5983: $19
    ld   [hl], a                                  ; $5984: $77
    ld   hl, wEntitiesDirectionTable              ; $5985: $21 $80 $C3
    add  hl, de                                   ; $5988: $19
    ld   [hl], a                                  ; $5989: $77
    pop  bc                                       ; $598A: $C1

jr_003_598B:
    ret                                           ; $598B: $C9

Data_003_598C::
    db   $08, $F8

Data_003_598E::
    db   $00, $00, $F8, $08

Data_003_5992::
    db   $20, $E0

Data_003_5994::
    db   $00, $00, $E0, $20

SpawnOctorockRock::
    ld   a, ENTITY_OCTOROCK_ROCK                  ; $5998: $3E $0A
    call SpawnNewEntity                           ; $599A: $CD $CA $64
    jr   c, jr_003_59D6                           ; $599D: $38 $37

    push bc                                       ; $599F: $C5
    ldh  a, [hScratch2]                           ; $59A0: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $59A2: $21 $80 $C3
    add  hl, de                                   ; $59A5: $19
    ld   [hl], a                                  ; $59A6: $77
    ld   c, a                                     ; $59A7: $4F
    ld   hl, Data_003_598C                        ; $59A8: $21 $8C $59
    add  hl, bc                                   ; $59AB: $09
    ldh  a, [hScratch0]                           ; $59AC: $F0 $D7
    add  [hl]                                     ; $59AE: $86
    ld   hl, wEntitiesPosXTable                   ; $59AF: $21 $00 $C2
    add  hl, de                                   ; $59B2: $19
    ld   [hl], a                                  ; $59B3: $77
    ld   hl, Data_003_598E                        ; $59B4: $21 $8E $59
    add  hl, bc                                   ; $59B7: $09
    ldh  a, [hScratch1]                           ; $59B8: $F0 $D8
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

jr_003_59D6:
    ret                                           ; $59D6: $C9

EntityInitBrokenHeartContainer::
    ret                                           ; $59D7: $C9

HeartContainerTilesTable::
    ;   Tile Attr Tile Attr
    db   $AA, $14, $AA, $34

; Loop run every frame heart container is on screen
HeartContainerEntityHandler::
    ld   de, HeartContainerTilesTable             ; $59DC: $11 $D8 $59
    call RenderActiveEntitySpritesPair            ; $59DF: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $59E2: $CD $05 $0C
    jp   z, label_003_60AA                        ; $59E5: $CA $AA $60

    ; Start of when item is picked up
    dec  a                                        ; $59E8: $3D
    jr   nz, HoldEntityAboveLink                  ; $59E9: $20 $2C

    ld   a, MUSIC_BOSS_DEFEATED                   ; $59EB: $3E $18
    ld   [wMusicTrackToPlay], a                   ; $59ED: $EA $68 $D3
    ; Increase max health, and fully restore health
    ld   hl, wMaxHealth                           ; $59F0: $21 $5B $DB
    inc  [hl]                                     ; $59F3: $34
    ld   hl, wAddHealthBuffer                     ; $59F4: $21 $93 $DB
    ld   [hl], $FF                                ; $59F7: $36 $FF
    call GetRoomStatusAddressInHL                 ; $59F9: $CD $34 $51
    ld   a, [hl]                                  ; $59FC: $7E
    or   $20                                      ; @TODO Set this room's status bit
    ld   [hl], a                                  ; $59FF: $77
    ldh  [hRoomStatus], a                         ; $5A00: $E0 $F8

    ; Now, check if we should modify another room's status bits as well.
    ; This is how the Eagle's Tower and Angler's Tunnel bosses
    ; exist in different rooms -- this sets the room flag in the
    ; room where the *staircase* is, so that it opens when you return.

    ldh  a, [hMapId]

    ; Set room status pointer to Eagle's Tower Nightmare staircase room
    ; (IndoorB + $2E)
    ld   hl, wIndoorBRoomStatus + $2E
    cp   MAP_EAGLES_TOWER                         ; If we ARE in Eagle's Tower...
    jr   z, .inEaglesTower                        ; ... skip to setting the bit - address already loaded.

    cp   MAP_ANGLERS_TUNNEL                       ; If we are NOT in Angler's Tunnel...
    jr   nz, .skipSecondRoomFlags                 ; ... skip setting a second bit entirely - don't need to.

    ; Set room status pointer to Angler's Tunnel Nightmare staircase room.
    ; (IndoorA + $66)
    ; Eagle's Tower check skips this, not-Angler's-Tunnel check skips the set too.
    ld   hl, wIndoorARoomStatus + $66

.inEaglesTower:
    ; Set the room status bits for the second room.
    set  5, [hl]                                  ; or $20

.skipSecondRoomFlags:
    ; Finished setting status bits for rooms, delete this
    jp   UnloadEntityAndReturn

HoldEntityAboveLink::
    ldh  a, [hLinkPositionX]                      ; $5A17: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $5A19: $21 $00 $C2
    add  hl, bc                                   ; $5A1C: $09
    ld   [hl], a                                  ; $5A1D: $77
    ldh  a, [hLinkPositionY]                      ; $5A1E: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $5A20: $21 $10 $C2
    add  hl, bc                                   ; $5A23: $09
    sub  $0C                                      ; $5A24: $D6 $0C
    ld   [hl], a                                  ; $5A26: $77
    ldh  a, [hLinkPositionZ]                      ; $5A27: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $5A29: $21 $10 $C3
    add  hl, bc                                   ; $5A2C: $09
    ld   [hl], a                                  ; $5A2D: $77

func_003_5A2E::
    ld   a, $6C                                   ; $5A2E: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $5A30: $E0 $9D
    ld   a, $03                                   ; $5A32: $3E $03
    ldh  [hLinkDirection], a                      ; $5A34: $E0 $9E
    xor  a                                        ; $5A36: $AF
    ld   [wSwordAnimationState], a                ; $5A37: $EA $37 $C1
    ld   [wC16A], a                               ; $5A3A: $EA $6A $C1
    ld   [wSwordCharge], a                        ; $5A3D: $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ; $5A40: $EA $21 $C1
    ld   hl, wEntitiesUnknowTableI                ; $5A43: $21 $70 $C4
    add  hl, bc                                   ; $5A46: $09
    ld   [hl], a                                  ; $5A47: $77
    ld   a, $02                                   ; $5A48: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5A4A: $E0 $A1
    ret                                           ; $5A4C: $C9

Data_003_5A4D::
    db   $AC, $02, $AC, $22

HeartPieceEntityHandler::
    ldh  a, [hRoomStatus]                         ; $5A51: $F0 $F8
    and  $10                                      ; $5A53: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $5A55: $C2 $8D $3F

    ldh  a, [hActiveEntityState]                  ; $5A58: $F0 $F0
    JP_TABLE                                      ; $5A5A
._00 dw HeartPieceState0Handler                   ; $5A5B
._01 dw HeartPieceState1Handler                   ; $5A5D
._02 dw HeartPieceState2Handler                   ; $5A5F
._03 dw HeartPieceState3Handler                   ; $5A61
._04 dw HeartPieceState4Handler                   ; $5A63
._05 dw HeartPieceState5Handler                   ; $5A65
._06 dw HeartPieceState6Handler                   ; $5A67
._07 dw HeartPieceState7Handler                   ; $5A69
._08 dw HeartPieceState8Handler                   ; $5A6B

HeartPieceState1Handler::
    call HoldEntityAboveLink                      ; $5A6D: $CD $17 $5A
    call GetEntityTransitionCountdown             ; $5A70: $CD $05 $0C
    ret  nz                                       ; $5A73: $C0

    ld   a, $01                                   ; $5A74: $3E $01
    ld   [wC167], a                               ; $5A76: $EA $67 $C1
    jp   IncrementEntityState                     ; $5A79: $C3 $12 $3B

HeartPieceState2Handler::
    ld   a, $03                                   ; $5A7C: $3E $03
    ldh  [hNeedsUpdatingBGTiles], a               ; $5A7E: $E0 $90
    jp   IncrementEntityState                     ; $5A80: $C3 $12 $3B

HeartPieceState3Handler::
    ld   a, $04                                   ; $5A83: $3E $04
    ldh  [hNeedsUpdatingBGTiles], a               ; $5A85: $E0 $90
    jp   IncrementEntityState                     ; $5A87: $C3 $12 $3B

HeartPieceState4Handler::
    call_open_dialog $04F                          ; $5A8A: $3E $4F
    call IncrementEntityState                     ; $5A8F: $CD $12 $3B
    ld   a, $01                                   ; $5A92: $3E $01
    ld   [$C1AB], a                               ; $5A94: $EA $AB $C1
    ret                                           ; $5A97: $C9

HeartPieceState5Handler::
    call HoldEntityAboveLink                      ; $5A98: $CD $17 $5A
    ld   de, Data_003_5A4D                        ; $5A9B: $11 $4D $5A
    call RenderActiveEntitySpritesPair            ; $5A9E: $CD $C0 $3B
    call func_003_5B2B                            ; $5AA1: $CD $2B $5B
    ld   hl, wEntitiesUnknowTableY                ; $5AA4: $21 $D0 $C3
    add  hl, bc                                   ; $5AA7: $09
    inc  [hl]                                     ; $5AA8: $34
    ld   a, [hl]                                  ; $5AA9: $7E
    cp   $A8                                      ; $5AAA: $FE $A8
    jp   z, IncrementEntityState                  ; $5AAC: $CA $12 $3B

    cp   $38                                      ; $5AAF: $FE $38
    jr   nz, jr_003_5ABA                          ; $5AB1: $20 $07

    ld   a, [wHeartPiecesCount]                   ; $5AB3: $FA $5C $DB
    inc  a                                        ; $5AB6: $3C
    ld   [wHeartPiecesCount], a                   ; $5AB7: $EA $5C $DB

jr_003_5ABA:
    ret                                           ; $5ABA: $C9

HeartPieceState6Handler::
    call HoldEntityAboveLink                      ; $5ABB: $CD $17 $5A
    ld   de, Data_003_5A4D                        ; $5ABE: $11 $4D $5A
    call RenderActiveEntitySpritesPair            ; $5AC1: $CD $C0 $3B
    xor  a                                        ; $5AC4: $AF
    ld   [$C1AB], a                               ; $5AC5: $EA $AB $C1
    call func_003_5B2B                            ; $5AC8: $CD $2B $5B
    ld   a, [wDialogState]                        ; $5ACB: $FA $9F $C1
    and  a                                        ; $5ACE: $A7
    ret  nz                                       ; $5ACF: $C0

    ; If found 4 heart pieces…
    ld   a, [wHeartPiecesCount]                   ; $5AD0: $FA $5C $DB
    cp   $04                                      ; $5AD3: $FE $04
    jr   nz, jr_003_5AED                          ; $5AD5: $20 $16
    ; Play a success jingle
    ld   a, JINGLE_NEW_HEART                      ; $5AD7: $3E $19
    ldh  [hJingle], a                             ; $5AD9: $E0 $F2
    ; Clear heart pieces count
    xor  a                                        ; $5ADB: $AF
    ld   [wHeartPiecesCount], a                   ; $5ADC: $EA $5C $DB
    ; Configure the heart increase animation
    ld   hl, wAddHealthBuffer                     ; $5ADF: $21 $93 $DB
    ld   [hl], $40                                ; $5AE2: $36 $40
    ; Increase the maximum number of hearts
    ld   hl, wMaxHealth                           ; $5AE4: $21 $5B $DB
    inc  [hl]                                     ; $5AE7: $34
    ; Open the "4 pieces of heart collected" dialog
    call_open_dialog $050                         ; $5AE8

jr_003_5AED:
    jp   IncrementEntityState                     ; $5AED: $C3 $12 $3B

HeartPieceState7Handler::
    call HoldEntityAboveLink                      ; $5AF0: $CD $17 $5A
    ld   de, Data_003_5A4D                        ; $5AF3: $11 $4D $5A
    call RenderActiveEntitySpritesPair            ; $5AF6: $CD $C0 $3B
    ld   a, [wDialogState]                        ; $5AF9: $FA $9F $C1
    and  a                                        ; $5AFC: $A7
    ret  nz                                       ; $5AFD: $C0

    ld   a, $05                                   ; $5AFE: $3E $05
    ldh  [hNeedsUpdatingBGTiles], a               ; $5B00: $E0 $90
    jp   IncrementEntityState                     ; $5B02: $C3 $12 $3B

HeartPieceState8Handler::
    ld   a, $06                                   ; $5B05: $3E $06
    ldh  [hNeedsUpdatingBGTiles], a               ; $5B07: $E0 $90
    call UnloadEntity                             ; $5B09: $CD $8D $3F
    ld   a, $0D                                   ; $5B0C: $3E $0D
    ldh  [hFFA5], a                               ; $5B0E: $E0 $A5
    xor  a                                        ; $5B10: $AF
    ld   [wC167], a                               ; $5B11: $EA $67 $C1
    jp   MarkRoomCompleted                        ; $5B14: $C3 $2A $51

Data_003_5B17::
    db   $9A, $02, $9A, $22, $9C, $02, $9A, $22, $9E, $02, $9A, $22, $9E, $02, $9C, $22
    db   $9E, $02, $9E, $22

func_003_5B2B::
    ld   a, [wDialogState]                        ; $5B2B: $FA $9F $C1
    and  a                                        ; $5B2E: $A7
    ret  z                                        ; $5B2F: $C8

    ld   a, [wDialogCharacterIndex]               ; $5B30: $FA $70 $C1
    cp   $21                                      ; $5B33: $FE $21
    ret  nc                                       ; $5B35: $D0

    ld   a, [wDialogState]                        ; $5B36: $FA $9F $C1
    and  $80                                      ; $5B39: $E6 $80
    ld   a, $23                                   ; $5B3B: $3E $23
    jr   z, jr_003_5B41                           ; $5B3D: $28 $02

    ld   a, $6B                                   ; $5B3F: $3E $6B

jr_003_5B41:
    ldh  [hActiveEntityVisualPosY], a             ; $5B41: $E0 $EC
    ld   a, [wHeartPiecesCount]                   ; $5B43: $FA $5C $DB
    ldh  [hActiveEntitySpriteVariant], a          ; $5B46: $E0 $F1
    ld   a, $8E                                   ; $5B48: $3E $8E
    ldh  [hActiveEntityPosX], a                   ; $5B4A: $E0 $EE
    ld   de, Data_003_5B17                        ; $5B4C: $11 $17 $5B
    jp   RenderActiveEntitySpritesPair            ; $5B4F: $C3 $C0 $3B

HeartPieceState0Handler::
    ld   de, Data_003_5A4D                        ; $5B52: $11 $4D $5A
    call RenderActiveEntitySpritesPair            ; $5B55: $CD $C0 $3B
    jp   label_003_60AA                           ; $5B58: $C3 $AA $60

Data_003_5B5B::
    db   $AE, $14

GuardianAcornEntityHandler::
    ld   de, Data_003_5B5B                        ; $5B5D: $11 $5B $5B
    call RenderActiveEntitySprite                 ; $5B60: $CD $77 $3C
    jr   jr_003_5B7D                              ; $5B63: $18 $18

Data_003_5B65::
    db   $14, $02, $14, $22, $14, $14, $14, $34

PieceOfPowerEntityHandler::
    ld   de, Data_003_5B65                        ; $5B6D: $11 $65 $5B
    call RenderActiveEntitySpritesPair            ; $5B70: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $5B73: $F0 $E7
    rra                                           ; $5B75: $1F
    rra                                           ; $5B76: $1F
    rra                                           ; $5B77: $1F
    and  $01                                      ; $5B78: $E6 $01
    call SetEntitySpriteVariant                   ; $5B7A: $CD $0C $3B

jr_003_5B7D:
    jp   label_003_60AA                           ; $5B7D: $C3 $AA $60

Data_003_5B80::
    db   $74, $00, $76, $00, $76, $20, $74, $20

Entity32Handler::
    ld   de, Data_003_5B80                        ; $5B88: $11 $80 $5B
    call RenderActiveEntitySpritesPair            ; $5B8B: $CD $C0 $3B
    call func_003_7F78                            ; $5B8E: $CD $78 $7F
    call func_003_62AF                            ; $5B91: $CD $AF $62
    ret                                           ; $5B94: $C9

Data_003_5B95::
    db   $86, $17

Data_003_5B97::
    db   $84, $17

SwordEntityHandler::
    ld   de, Data_003_5B95                        ; $5B99: $11 $95 $5B
    ld   a, [wSwordLevel]                         ; $5B9C: $FA $4E $DB
    and  a                                        ; $5B9F: $A7
    jr   nz, jr_003_5BAC                          ; $5BA0: $20 $0A

    ldh  a, [hRoomStatus]                         ; $5BA2: $F0 $F8
    and  $10                                      ; $5BA4: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $5BA6: $C2 $8D $3F

    ld   de, Data_003_5B97                        ; $5BA9: $11 $97 $5B

jr_003_5BAC:
    call RenderActiveEntitySprite                 ; $5BAC: $CD $77 $3C
    ldh  a, [hActiveEntityState]                  ; $5BAF: $F0 $F0
    JP_TABLE                                      ; $5BB1
._00 dw SwordState0Handler                        ; $5BB2
._01 dw SwordState1Handler                        ; $5BB4
._02 dw SwordState2Handler                        ; $5BB6
._03 dw SwordState3Handler                        ; $5BB8

SwordState0Handler::
    call GetEntityTransitionCountdown             ; $5BBA: $CD $05 $0C
    jp   z, label_003_60AA                        ; $5BBD: $CA $AA $60

    cp   $10                                      ; $5BC0: $FE $10
    jr   nz, jr_003_5BCB                          ; $5BC2: $20 $07

    dec  [hl]                                     ; $5BC4: $35
    call_open_dialog $09B                         ; $5BC5
    xor  a                                        ; $5BCA: $AF

; Plays a heroic fanfare, when you first retrieve your sword from the beach
jr_003_5BCB:
    dec  a                                        ; $5BCB: $3D
    jr   nz, jr_003_5BE1                          ; $5BCC: $20 $13

    ld   a, MUSIC_OVERWORLD_INTRO                 ; $5BCE: $3E $31
    ld   [wMusicTrackToPlay], a                   ; $5BD0: $EA $68 $D3
    ld   a, MUSIC_OVERWORLD                       ; $5BD3: $3E $05
    ldh  [hDefaultMusicTrack], a                  ; $5BD5: $E0 $B0
    ldh  [hNextDefaultMusicTrack], a              ; $5BD7: $E0 $BF
    call GetEntityDropTimer                       ; $5BD9: $CD $FB $0B
    ld   [hl], $52                                ; $5BDC: $36 $52
    call IncrementEntityState                     ; $5BDE: $CD $12 $3B

jr_003_5BE1:
    jp   HoldEntityAboveLink                      ; $5BE1: $C3 $17 $5A

SwordState1Handler::
    call HoldEntityAboveLink                      ; $5BE4: $CD $17 $5A
    call GetEntityDropTimer                       ; $5BE7: $CD $FB $0B
    ret  nz                                       ; $5BEA: $C0

    ld   a, $FF                                   ; $5BEB: $3E $FF
    call SetEntitySpriteVariant                   ; $5BED: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $5BF0: $CD $05 $0C
    ld   [hl], $20                                ; $5BF3: $36 $20
    ld   a, $20                                   ; $5BF5: $3E $20
    ld   [wIsUsingSpinAttack], a                  ; $5BF7: $EA $21 $C1
    ld   a, $03                                   ; $5BFA: $3E $03
    ldh  [hNoiseSfx], a                           ; $5BFC: $E0 $F4
    jp   IncrementEntityState                     ; $5BFE: $C3 $12 $3B

SwordState2Handler::
    call GetEntityTransitionCountdown             ; $5C01: $CD $05 $0C
    ret  nz                                       ; $5C04: $C0

    ld   [hl], $20                                ; $5C05: $36 $20
    ld   a, $00                                   ; $5C07: $3E $00
    call SetEntitySpriteVariant                   ; $5C09: $CD $0C $3B
    jp   IncrementEntityState                     ; $5C0C: $C3 $12 $3B

SwordState3Handler::
    call HoldEntityAboveLink                      ; $5C0F: $CD $17 $5A
    ld   a, $6B                                   ; $5C12: $3E $6B
    ldh  [hLinkAnimationState], a                 ; $5C14: $E0 $9D
    ld   hl, wEntitiesPosXTable                   ; $5C16: $21 $00 $C2
    add  hl, bc                                   ; $5C19: $09
    ldh  a, [hLinkPositionX]                      ; $5C1A: $F0 $98
    sub  $04                                      ; $5C1C: $D6 $04
    ld   [hl], a                                  ; $5C1E: $77
    call GetEntityTransitionCountdown             ; $5C1F: $CD $05 $0C
    jr   nz, jr_003_5C37                          ; $5C22: $20 $13

    ld   [wC167], a                               ; $5C24: $EA $67 $C1
    ld   d, INVENTORY_SWORD                       ; $5C27: $16 $01
    call GiveInventoryItem                        ; $5C29: $CD $72 $64
    ld   a, $01                                   ; $5C2C: $3E $01
    ld   [wSwordLevel], a                         ; $5C2E: $EA $4E $DB
    call MarkRoomCompleted                        ; $5C31: $CD $2A $51
    jp   UnloadEntityAndReturn                    ; $5C34: $C3 $8D $3F

jr_003_5C37:
    cp   $1A                                      ; $5C37: $FE $1A
    jr   nz, jr_003_5C46                          ; $5C39: $20 $0B

    ldh  a, [hActiveEntityPosY]                   ; $5C3B: $F0 $EF
    sub  $0C                                      ; $5C3D: $D6 $0C
    call CheckLinkCollisionWithProjectile.func_003_6C36; $5C3F: $CD $36 $6C
    ld   a, JINGLE_SWORD_POKING                   ; $5C42: $3E $07
    ldh  [hJingle], a                             ; $5C44: $E0 $F2

jr_003_5C46:
    ret                                           ; $5C46: $C9

HookshotSpriteData::
    db   $8A, $14

label_003_5C49:
    ldh  a, [hRoomStatus]                         ; $5C49: $F0 $F8
    and  $10                                      ; $5C4B: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $5C4D: $C2 $8D $3F

    ld   de, HookshotSpriteData                   ; $5C50: $11 $47 $5C
    call RenderActiveEntitySprite                 ; $5C53: $CD $77 $3C
    call GetEntityTransitionCountdown             ; $5C56: $CD $05 $0C
    jp   z, label_003_60AA                        ; $5C59: $CA $AA $60

    cp   $10                                      ; $5C5C: $FE $10
    jr   nz, jr_003_5C67                          ; $5C5E: $20 $07

    dec  [hl]                                     ; $5C60: $35
    call_open_dialog $093                         ; $5C61
    xor  a                                        ; $5C66: $AF

jr_003_5C67:
    dec  a                                        ; $5C67: $3D
    jr   nz, jr_003_5C75                          ; $5C68: $20 $0B

    ld   d, INVENTORY_HOOKSHOT                    ; $5C6A: $16 $06
    call GiveInventoryItem                        ; $5C6C: $CD $72 $64
    call MarkRoomCompleted                        ; $5C6F: $CD $2A $51
    jp   UnloadEntityAndReturn                    ; $5C72: $C3 $8D $3F

jr_003_5C75:
    jp   HoldEntityAboveLink                      ; $5C75: $C3 $17 $5A

KeyDropSpriteTable:
    db   $CA, $17
    db   $C0, $17
    db   $C2, $14
    db   $C4, $17
    db   $C6, $14
    db   $CA, $17

KeyCollectDialogTable::
    db   $00, $A3, $A4, $A5, $00

KeyDropPointEntityHandler::
    call CheckForEntityFallingDownQuicksandHole   ; $5C89: $CD $EA $5C
    jr   nc, jr_003_5C99                          ; $5C8C: $30 $0B

    ; If dropped in the quicksand mark the angler key
    ; as available in the quicksand cave by setting the room flags.
    ld   hl, wOverworldRoomStatus + $CE           ; $5C8E: $21 $CE $D8
    set  4, [hl]                                  ; $5C91: $CB $E6
    ld   hl, wIndoorARoomStatus + $F8             ; $5C93: $21 $F8 $D9
    set  5, [hl]                                  ; $5C96: $CB $EE
    ret                                           ; $5C98: $C9

jr_003_5C99:
    ldh  a, [hMapRoom]                            ; $5C99: $F0 $F6
    cp   $80                                      ; @TODO (?) L5 Master Stalfos final room
    jp   z, label_003_5C49                        ; $5C9D: $CA $49 $5C

    ld   de, KeyDropSpriteTable                   ; $5CA0: $11 $78 $5C
    call RenderActiveEntitySprite                 ; $5CA3: $CD $77 $3C
    call GetEntityTransitionCountdown             ; $5CA6: $CD $05 $0C
    jp   z, label_003_5CD6                        ; $5CA9: $CA $D6 $5C

    cp   $10                                      ; $5CAC: $FE $10
    jr   nz, jr_003_5CCD                          ; $5CAE: $20 $1D

    dec  [hl]                                     ; $5CB0: $35
    ldh  a, [hActiveEntitySpriteVariant]          ; $5CB1: $F0 $F1
    dec  a                                        ; $5CB3: $3D
    ld   e, a                                     ; $5CB4: $5F
    ld   d, b                                     ; $5CB5: $50
    ld   hl, KeyCollectDialogTable                ; $5CB6: $21 $84 $5C
    add  hl, de                                   ; $5CB9: $19
    ld   a, [hl]                                  ; $5CBA: $7E
    call OpenDialog                               ; $5CBB: $CD $85 $23
    ldh  a, [hActiveEntitySpriteVariant]          ; $5CBE: $F0 $F1
    dec  a                                        ; $5CC0: $3D
    ld   e, a                                     ; $5CC1: $5F
    ld   d, b                                     ; $5CC2: $50
    ld   hl, wHasTailKey                          ; $5CC3: $21 $11 $DB
    add  hl, de                                   ; $5CC6: $19
    ld   [hl], $01                                ; $5CC7: $36 $01
    call MarkRoomCompleted                        ; $5CC9: $CD $2A $51
    xor  a                                        ; $5CCC: $AF

jr_003_5CCD:
    dec  a                                        ; $5CCD: $3D
    jr   nz, jr_003_5CD3                          ; $5CCE: $20 $03

    jp   UnloadEntityAndReturn                    ; $5CD0: $C3 $8D $3F

jr_003_5CD3:
    jp   HoldEntityAboveLink                      ; $5CD3: $C3 $17 $5A

label_003_5CD6:
    call func_003_7F78                            ; $5CD6: $CD $78 $7F
    call func_003_62AF                            ; $5CD9: $CD $AF $62
    ld   hl, wEntitiesPosZTable                   ; $5CDC: $21 $10 $C3
    add  hl, bc                                   ; $5CDF: $09
    ld   a, [hl]                                  ; $5CE0: $7E
    and  a                                        ; $5CE1: $A7
    jr   nz, jr_003_5CE7                          ; $5CE2: $20 $03

    call func_003_62EB                            ; $5CE4: $CD $EB $62

jr_003_5CE7:
    jp   func_003_60B3                            ; $5CE7: $C3 $B3 $60

CheckForEntityFallingDownQuicksandHole::
    ; This is called from the bomb code as well.
    ; Checks if the entity is at the center of the quicksand room and makes it drop.
    ld   a, [wIsIndoor]                           ; $5CEA: $FA $A5 $DB
    and  a                                        ; $5CED: $A7
    jr   nz, jr_003_5D34                          ; $5CEE: $20 $44

    ldh  a, [hMapRoom]                            ; $5CF0: $F0 $F6
    cp   $CE                                      ; Overworld Yarna Desert Lanmola fight
    jr   nz, jr_003_5D34                          ; $5CF4: $20 $3E

    ldh  a, [hActiveEntityPosY]                   ; $5CF6: $F0 $EF
    sub  $48                                      ; $5CF8: $D6 $48
    add  $03                                      ; $5CFA: $C6 $03
    cp   $06                                      ; $5CFC: $FE $06
    jr   nc, jr_003_5D34                          ; $5CFE: $30 $34

    ldh  a, [hActiveEntityPosX]                   ; $5D00: $F0 $EE
    sub  $50                                      ; $5D02: $D6 $50
    add  $03                                      ; $5D04: $C6 $03
    cp   $06                                      ; $5D06: $FE $06
    jr   nc, jr_003_5D34                          ; $5D08: $30 $2A

    ld   hl, wEntitiesPosZTable                   ; $5D0A: $21 $10 $C3
    add  hl, bc                                   ; $5D0D: $09
    ld   a, [hl]                                  ; $5D0E: $7E
    and  a                                        ; $5D0F: $A7
    jr   nz, jr_003_5D34                          ; $5D10: $20 $22

    ld   hl, wEntitiesStatusTable                 ; $5D12: $21 $80 $C2
    add  hl, bc                                   ; $5D15: $09
    ld   a, [hl]                                  ; $5D16: $7E
    cp   $05                                      ; $5D17: $FE $05
    jr   nz, jr_003_5D34                          ; $5D19: $20 $19

    ld   [hl], $02                                ; $5D1B: $36 $02
    ld   hl, $C4B0                                ; $5D1D: $21 $B0 $C4
    add  hl, bc                                   ; $5D20: $09
    ld   [hl], $50                                ; $5D21: $36 $50
    ld   hl, $C4C0                                ; $5D23: $21 $C0 $C4
    add  hl, bc                                   ; $5D26: $09
    ld   [hl], $48                                ; $5D27: $36 $48
    call GetEntityTransitionCountdown             ; $5D29: $CD $05 $0C
    ld   [hl], $2F                                ; $5D2C: $36 $2F
    ld   a, JINGLE_ITEM_FALLING                   ; $5D2E: $3E $18
    ldh  [hJingle], a                             ; $5D30: $E0 $F2
    scf                                           ; $5D32: $37
    ret                                           ; $5D33: $C9

jr_003_5D34:
    and  a                                        ; $5D34: $A7
    ret                                           ; $5D35: $C9

Data_003_5D36::
    db   $A8, $14

DroppableHeartEntityHandler::
    call func_003_61DE                            ; $5D38: $CD $DE $61
    call func_003_608C                            ; $5D3B: $CD $8C $60
    ld   de, Data_003_5D36                        ; $5D3E: $11 $36 $5D
    call RenderActiveEntitySprite                 ; $5D41: $CD $77 $3C
    jp   label_003_60AA                           ; $5D44: $C3 $AA $60

Data_003_5D47::
    db   $5E, $02, $5E, $22

SleepyToadstoolEntityHandler::
    ld   hl, wHasToadstool                        ; $5D4B: $21 $4B $DB
    ld   a, [wMagicPowderCount]                   ; $5D4E: $FA $4C $DB
    or   [hl]                                     ; $5D51: $B6
    jp   nz, UnloadEntityAndReturn                ; $5D52: $C2 $8D $3F

    ld   de, Data_003_5D47                        ; $5D55: $11 $47 $5D
    call RenderActiveEntitySpritesPair            ; $5D58: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $5D5B: $CD $05 $0C
    jp   z, label_003_60AA                        ; $5D5E: $CA $AA $60

    cp   $10                                      ; $5D61: $FE $10
    jr   nz, jr_003_5D6C                          ; $5D63: $20 $07

    dec  [hl]                                     ; $5D65: $35
    call_open_dialog $00F                         ; $5D66
    xor  a                                        ; $5D6B: $AF

jr_003_5D6C:
    dec  a                                        ; $5D6C: $3D
    jr   nz, jr_003_5D80                          ; $5D6D: $20 $11

    ld   a, $0A                                   ; $5D6F: $3E $0A
    ldh  [hFFA5], a                               ; $5D71: $E0 $A5
    ld   d, INVENTORY_MAGIC_POWDER                ; $5D73: $16 $0C
    call GiveInventoryItem                        ; $5D75: $CD $72 $64
    ld   a, $01                                   ; $5D78: $3E $01
    ld   [wHasToadstool], a                       ; $5D7A: $EA $4B $DB
    jp   UnloadEntityAndReturn                    ; $5D7D: $C3 $8D $3F

jr_003_5D80:
    jp   HoldEntityAboveLink                      ; $5D80: $C3 $17 $5A

Data_003_5D83::
    db   $70, $01, $72, $01, $74, $01, $76, $01, $78, $01, $7A, $01, $7C, $01, $7E, $01

SirensInstrumentEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $5D93: $21 $B0 $C2
    add  hl, bc                                   ; $5D96: $09
    ld   a, [hl]                                  ; $5D97: $7E
    JP_TABLE                                      ; $5D98
._00 dw SirensInstrumentState0Handler             ; $5D99
._01 dw SirensInstrumentState1Handler             ; $5D9B
._02 dw SirensInstrumentState2Handler             ; $5D9D

Data_003_5D9F::
    db   $E4, $E4, $E4, $E4, $90, $90, $90, $90, $40, $40, $40, $40, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_003_5DBC::
    db   $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
    db   $08, $08, $08, $08, $04, $04, $04, $04, $00, $00, $00, $00, $00

SirensInstrumentState2Handler::
    call func_006_783C_trampoline                 ; $5DD9: $CD $76 $3E
    ld   a, $01                                   ; $5DDC: $3E $01
    ld   [wC167], a                               ; $5DDE: $EA $67 $C1
    call GetEntityDropTimer                       ; $5DE1: $CD $FB $0B
    jr   nz, animateSirensInstrumentPickup        ; $5DE4: $20 $43

    call UnloadEntity                             ; $5DE6: $CD $8D $3F
    xor  a                                        ; $5DE9: $AF
    ldh  [hLinkAnimationState], a                 ; $5DEA: $E0 $9D
    ld   a, [$D201]                               ; $5DEC: $FA $01 $D2
    ld   e, a                                     ; $5DEF: $5F
    ld   d, b                                     ; $5DF0: $50
    ld   hl, wEntitiesStateTable                  ; $5DF1: $21 $90 $C2
    add  hl, de                                   ; $5DF4: $19
    inc  [hl]                                     ; $5DF5: $34
    call label_C9E                                ; $5DF6: $CD $9E $0C

    ; Execute some code specific to each dungeon
    ldh  a, [hMapId]                              ; $5DF9: $F0 $F7
    JP_TABLE                                      ; $5DFB
._00 dw AfterSirensInstrumentD1
._01 dw AfterSirensInstrumentD2
._02 dw AfterSirensInstrumentD3
._03 dw AfterSirensInstrumentD4
._04 dw AfterSirensInstrumentNone
._05 dw AfterSirensInstrumentD6
._06 dw AfterSirensInstrumentD7
._07 dw AfterSirensInstrumentNone

AfterSirensInstrumentD1::
    ; Mark Bow-Wow as kidnapped
    ld   a, $80                                   ; $5E0C: $3E $80
    ld   [wIsBowWowFollowingLink], a              ; $5E0E: $EA $56 $DB
    ret                                           ; $5E11: $C9

AfterSirensInstrumentD2::
    ld   a, $02                                   ; $5E12: $3E $02
    ld   [$DB48], a                               ; $5E14: $EA $48 $DB
    ret                                           ; $5E17: $C9

AfterSirensInstrumentD3::
    ret                                           ; $5E18: $C9

AfterSirensInstrumentD4::
    ; Mark Ghost as following Link
    ld   a, $02                                   ; $5E19: $3E $02
    ld   [wIsGhostFollowingLink], a               ; $5E1B: $EA $79 $DB

AfterSirensInstrumentNone::
    ret                                           ; $5E1E: $C9

AfterSirensInstrumentD6::
    xor  a                                        ; $5E1F: $AF
    ld   [$DB74], a                               ; $5E20: $EA $74 $DB
    ret                                           ; $5E23: $C9

AfterSirensInstrumentD7::
    ; Make the rooster not following Link anymore
    xor  a                                        ; $5E24: $AF
    ld   [wIsRoosterFollowingLink], a             ; $5E25: $EA $7B $DB
    ret                                           ; $5E28: $C9

animateSirensInstrumentPickup:
    cp   $50                                      ; $5E29: $FE $50
    jr   nc, jr_003_5E8A                          ; $5E2B: $30 $5D

    ld   hl, wEntitiesPrivateState2Table          ; $5E2D: $21 $C0 $C2
    add  hl, bc                                   ; $5E30: $09
    ld   a, [hl]                                  ; $5E31: $7E
    cp   $19                                      ; $5E32: $FE $19
    jr   nc, jr_003_5E8A                          ; $5E34: $30 $54

    ldh  a, [hFrameCounter]                       ; $5E36: $F0 $E7
    and  $07                                      ; $5E38: $E6 $07
    jr   nz, jr_003_5E5B                          ; $5E3A: $20 $1F

    ld   a, [hl]                                  ; $5E3C: $7E
    and  a                                        ; $5E3D: $A7
    jr   nz, jr_003_5E45                          ; $5E3E: $20 $05

    ld   a, $2C                                   ; $5E40: $3E $2C
    ldh  [hNoiseSfx], a                           ; $5E42: $E0 $F4
    xor  a                                        ; $5E44: $AF

jr_003_5E45:
    inc  [hl]                                     ; $5E45: $34
    cp   $18                                      ; $5E46: $FE $18
    jr   nz, jr_003_5E5B                          ; $5E48: $20 $11

    ld   a, ENTITY_GOOMBA                         ; $5E4A: $3E $9F
    call SpawnNewEntity                           ; $5E4C: $CD $CA $64
    ld   hl, wEntitiesPrivateState1Table          ; $5E4F: $21 $B0 $C2
    add  hl, de                                   ; $5E52: $19
    ld   [hl], $01                                ; $5E53: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $5E55: $21 $E0 $C2
    add  hl, de                                   ; $5E58: $19
    ld   [hl], $60                                ; $5E59: $36 $60

jr_003_5E5B:
    ldh  a, [hFrameCounter]                       ; $5E5B: $F0 $E7
    and  $03                                      ; $5E5D: $E6 $03
    ld   hl, wEntitiesPrivateState2Table          ; $5E5F: $21 $C0 $C2
    add  hl, bc                                   ; $5E62: $09
    add  [hl]                                     ; $5E63: $86
    ld   e, a                                     ; $5E64: $5F
    ld   d, b                                     ; $5E65: $50
    ldh  a, [hIsGBC]                              ; $5E66: $F0 $FE
    and  a                                        ; $5E68: $A7
    jr   z, jr_003_5E76                           ; $5E69: $28 $0B

    push bc                                       ; $5E6B: $C5
    push de                                       ; $5E6C: $D5
    ld   a, $03                                   ; $5E6D: $3E $03
    call func_020_6D0E_trampoline                 ; $5E6F: $CD $78 $09
    pop  de                                       ; $5E72: $D1
    pop  bc                                       ; $5E73: $C1
    jr   jr_003_5E8A                              ; $5E74: $18 $14

jr_003_5E76:
    ld   hl, Data_003_5D9F                        ; $5E76: $21 $9F $5D
    add  hl, de                                   ; $5E79: $19
    ld   a, [hl]                                  ; $5E7A: $7E
    ld   [wBGPalette], a                          ; $5E7B: $EA $97 $DB
    ld   hl, Data_003_5DBC                        ; $5E7E: $21 $BC $5D
    add  hl, de                                   ; $5E81: $19
    ld   a, [hl]                                  ; $5E82: $7E
    ld   [wOBJ0Palette], a                        ; $5E83: $EA $98 $DB
    xor  a                                        ; $5E86: $AF
    ld   [wOBJ1Palette], a                        ; $5E87: $EA $99 $DB

jr_003_5E8A:
    ret                                           ; $5E8A: $C9

Data_003_5E8B::
    db   $6C, $00, $FF, $FF, $6C, $00, $6E, $00

SirensInstrumentState1Handler::
    ld   de, Data_003_5E8B                        ; $5E93: $11 $8B $5E
    call RenderActiveEntitySpritesPair            ; $5E96: $CD $C0 $3B
    call func_003_7F25                            ; $5E99: $CD $25 $7F
    call GetEntityTransitionCountdown             ; $5E9C: $CD $05 $0C
    jp   z, UnloadEntityAndReturn                 ; $5E9F: $CA $8D $3F

    ret                                           ; $5EA2: $C9

SirensInstrumentState0Handler::
    ldh  a, [hActiveEntityState]                  ; $5EA3: $F0 $F0
    cp   $03                                      ; $5EA5: $FE $03
    jr   nc, jr_003_5EAE                          ; $5EA7: $30 $05

    ld   a, $03                                   ; $5EA9: $3E $03
    call func_036_70D6_trampoline                 ; $5EAB: $CD $D2 $0A

jr_003_5EAE:
    ld   a, c                                     ; $5EAE: $79
    ld   [$D201], a                               ; $5EAF: $EA $01 $D2
    ldh  a, [hRoomStatus]                         ; $5EB2: $F0 $F8
    and  $10                                      ; $5EB4: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $5EB6: $C2 $8D $3F

    ldh  a, [hMapId]                              ; $5EB9: $F0 $F7
    and  $03                                      ; $5EBB: $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ; $5EBD: $E0 $F1
    call label_394D                               ; $5EBF: $CD $4D $39
    ld   de, Data_003_5D83                        ; $5EC2: $11 $83 $5D
    call RenderActiveEntitySpritesPair            ; $5EC5: $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ; $5EC8: $F0 $F0
    JP_TABLE                                      ; $5ECA
._00 dw func_003_5ED5                             ; $5ECB
._01 dw func_003_5F0C                             ; $5ECD
._02 dw func_003_5F33                             ; $5ECF
._03 dw func_003_5FBC                             ; $5ED1
._04 dw func_003_5FBF                             ; $5ED3

func_003_5ED5::
    call GetEntityTransitionCountdown             ; $5ED5: $CD $05 $0C
    jp   z, label_003_60AA                        ; $5ED8: $CA $AA $60

    cp   $10                                      ; $5EDB: $FE $10
    jr   nz, jr_003_5EFE                          ; $5EDD: $20 $1F

    dec  [hl]                                     ; $5EDF: $35
    call IncrementEntityState                     ; $5EE0: $CD $12 $3B
    ldh  a, [hMapId]                              ; $5EE3: $F0 $F7
    add  $00                                      ; $5EE5: $C6 $00 (???)
    call OpenDialogInTable1                       ; $5EE7: $CD $73 $23
    ldh  a, [hMapId]                              ; $5EEA: $F0 $F7
    ld   e, a                                     ; $5EEC: $5F
    ld   d, b                                     ; $5EED: $50
    ld   hl, wHasInstrument1                      ; $5EEE: $21 $65 $DB
    add  hl, de                                   ; $5EF1: $19
    ld   a, [hl]                                  ; $5EF2: $7E
    or   $02                                      ; @TODO Sets instrument as acquired
    ld   [hl], a                                  ; $5EF5: $77
    call GetRoomStatusAddressInHL                 ; $5EF6: $CD $34 $51
    ld   a, [hl]                                  ; $5EF9: $7E
    or   $10                                      ; $5EFA: $F6 $10
    ld   [hl], a                                  ; $5EFC: $77
    xor  a                                        ; $5EFD: $AF

jr_003_5EFE:
    dec  a                                        ; $5EFE: $3D
    jr   nz, jr_003_5F01                          ; $5EFF: $20 $00

jr_003_5F01:
    jp   HoldEntityAboveLink                      ; $5F01: $C3 $17 $5A

InstrumentMusicTable::
    db   MUSIC_INSTRUMENT_FULL_MOON_CELLO
    db   MUSIC_INSTRUMENT_CONCH_HORN
    db   MUSIC_INSTRUMENT_SEA_LILY_BELL
    db   MUSIC_INSTRUMENT_SURF_HARP
    db   MUSIC_INSTRUMENT_WIND_MARIMBA
    db   MUSIC_INSTRUMENT_CORAL_TRIANGLE
    db   MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM
    db   MUSIC_INSTRUMENT_THUNDER_DRUM

func_003_5F0C::
    ld   a, [wActiveMusicIndex]                   ; $5F0C: $FA $69 $D3
    and  a                                        ; $5F0F: $A7
    jr   nz, jr_003_5F2C                          ; $5F10: $20 $1A

    ld   a, [wDialogState]                        ; $5F12: $FA $9F $C1
    and  a                                        ; $5F15: $A7
    jr   nz, jr_003_5F2C                          ; $5F16: $20 $14

    ldh  a, [hMapId]                              ; $5F18: $F0 $F7
    ld   e, a                                     ; $5F1A: $5F
    ld   d, b                                     ; $5F1B: $50
    ld   hl, InstrumentMusicTable                 ; $5F1C: $21 $04 $5F
    add  hl, de                                   ; $5F1F: $19
    ld   a, [hl]                                  ; $5F20: $7E
    ld   [wMusicTrackToPlay], a                   ; $5F21: $EA $68 $D3
    call IncrementEntityState                     ; $5F24: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5F27: $CD $05 $0C
    ld   [hl], $FF                                ; $5F2A: $36 $FF

jr_003_5F2C:
    jp   HoldEntityAboveLink                      ; $5F2C: $C3 $17 $5A

Data_003_5F2F::
    db   $0A, $FA

Data_003_5F31::
    db   $04, $FC

func_003_5F33::
    call GetEntityTransitionCountdown             ; $5F33: $CD $05 $0C
    jr   nz, jr_003_5F5F                          ; $5F36: $20 $27

    ld   a, JINGLE_INSTRUMENT_WARP                ; $5F38: $3E $2B
    ldh  [hJingle], a                             ; $5F3A: $E0 $F2

    ld   a, ENTITY_INSTRUMENT_OF_THE_SIRENS       ; $5F3C: $3E $39
    call SpawnNewEntity                           ; $5F3E: $CD $CA $64
    ldh  a, [hScratch0]                           ; $5F41: $F0 $D7
    dec  a                                        ; $5F43: $3D
    ld   hl, wEntitiesPosXTable                   ; $5F44: $21 $00 $C2
    add  hl, de                                   ; $5F47: $19
    ld   [hl], a                                  ; $5F48: $77
    ldh  a, [hScratch1]                           ; $5F49: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F4B: $21 $10 $C2
    add  hl, de                                   ; $5F4E: $19
    ld   [hl], a                                  ; $5F4F: $77
    ld   hl, wEntitiesPrivateState1Table          ; $5F50: $21 $B0 $C2
    add  hl, de                                   ; $5F53: $19
    ld   [hl], $02                                ; $5F54: $36 $02
    ld   hl, wEntitiesDropTimerTable              ; $5F56: $21 $50 $C4
    add  hl, de                                   ; $5F59: $19
    ld   [hl], $80                                ; $5F5A: $36 $80
    jp   IncrementEntityState                     ; $5F5C: $C3 $12 $3B

jr_003_5F5F:
    ld   hl, wEntitiesUnknownTableD               ; $5F5F: $21 $D0 $C2
    add  hl, bc                                   ; $5F62: $09
    dec  [hl]                                     ; $5F63: $35
    ld   a, [hl]                                  ; $5F64: $7E
    cp   $FF                                      ; $5F65: $FE $FF
    jr   nz, jr_003_5FB9                          ; $5F67: $20 $50

    ld   [hl], $17                                ; $5F69: $36 $17
    ld   hl, wEntitiesUnknowTableP                ; $5F6B: $21 $40 $C4
    add  hl, bc                                   ; $5F6E: $09
    inc  [hl]                                     ; $5F6F: $34
    ld   a, [hl]                                  ; $5F70: $7E
    and  $01                                      ; $5F71: $E6 $01
    ldh  [hFFE8], a                               ; $5F73: $E0 $E8
    ld   a, $39                                   ; $5F75: $3E $39
    call SpawnNewEntity                           ; $5F77: $CD $CA $64
    push bc                                       ; $5F7A: $C5
    ld   hl, wEntitiesPrivateState1Table          ; $5F7B: $21 $B0 $C2
    add  hl, de                                   ; $5F7E: $19
    inc  [hl]                                     ; $5F7F: $34
    ldh  a, [hFFE8]                               ; $5F80: $F0 $E8
    ld   c, a                                     ; $5F82: $4F
    ld   hl, Data_003_5F2F                        ; $5F83: $21 $2F $5F
    add  hl, bc                                   ; $5F86: $09
    ldh  a, [hScratch0]                           ; $5F87: $F0 $D7
    add  [hl]                                     ; $5F89: $86
    ld   hl, wEntitiesPosXTable                   ; $5F8A: $21 $00 $C2
    add  hl, de                                   ; $5F8D: $19
    ld   [hl], a                                  ; $5F8E: $77
    ld   hl, Data_003_5F31                        ; $5F8F: $21 $31 $5F
    add  hl, bc                                   ; $5F92: $09
    ld   a, [hl]                                  ; $5F93: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5F94: $21 $40 $C2
    add  hl, de                                   ; $5F97: $19
    ld   [hl], a                                  ; $5F98: $77
    ldh  a, [hScratch1]                           ; $5F99: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5F9B: $21 $10 $C2
    add  hl, de                                   ; $5F9E: $19
    add  $F8                                      ; $5F9F: $C6 $F8
    ld   [hl], a                                  ; $5FA1: $77
    ld   hl, wEntitiesSpeedYTable                 ; $5FA2: $21 $50 $C2
    add  hl, de                                   ; $5FA5: $19
    ld   [hl], $FD                                ; $5FA6: $36 $FD
    ld   hl, wEntitiesTransitionCountdownTable    ; $5FA8: $21 $E0 $C2
    add  hl, de                                   ; $5FAB: $19
    ld   [hl], $38                                ; $5FAC: $36 $38
    call GetRandomByte                            ; $5FAE: $CD $0D $28
    and  $01                                      ; $5FB1: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ; $5FB3: $21 $B0 $C3
    add  hl, de                                   ; $5FB6: $19
    ld   [hl], a                                  ; $5FB7: $77
    pop  bc                                       ; $5FB8: $C1

jr_003_5FB9:
    jp   HoldEntityAboveLink                      ; $5FB9: $C3 $17 $5A

func_003_5FBC::
    jp   HoldEntityAboveLink                      ; $5FBC: $C3 $17 $5A

func_003_5FBF::
    ret                                           ; $5FBF: $C9

Data_003_5FC0::
    db   $80, $15

DroppableBombsEntityHandler::
    call func_003_61DE                            ; $5FC2: $CD $DE $61
    call func_003_608C                            ; $5FC5: $CD $8C $60
    ld   de, Data_003_5FC0                        ; $5FC8: $11 $C0 $5F
    call RenderActiveEntitySprite                 ; $5FCB: $CD $77 $3C
    jp   label_003_60AA                           ; $5FCE: $C3 $AA $60

; Data for loading secret seashell when bush is clipped (and when dug from ground)
data_003_5FD1::
    db   $9E, $14

DroppableSeashellEntityHandler::
    ld   a, [wSwordLevel]                         ; $5FD3: $FA $4E $DB
    cp   $02                                      ; $5FD6: $FE $02
    jp   nc, UnloadEntityAndReturn                ; $5FD8: $D2 $8D $3F

    ldh  a, [hRoomStatus]                         ; $5FDB: $F0 $F8
    and  $10                                      ; $5FDD: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $5FDF: $C2 $8D $3F

    ldh  a, [hMapRoom]                            ; $5FE2: $F0 $F6
    cp   $E3                                      ; House by the Bay
    jr   nz, jr_003_5FEF                          ; $5FE6: $20 $07

    ldh  a, [hRoomStatus]                         ; $5FE8: $F0 $F8
    and  $40                                      ; $5FEA: $E6 $40
    jp   z, UnloadEntityAndReturn                 ; $5FEC: $CA $8D $3F

jr_003_5FEF:
    call func_003_61DE                            ; $5FEF: $CD $DE $61
    ld   de, data_003_5FD1                        ; $5FF2: $11 $D1 $5F
    call RenderActiveEntitySprite                 ; $5FF5: $CD $77 $3C
    jp   label_003_60AA                           ; $5FF8: $C3 $AA $60

Data_003_5FFB::
    db   $CA, $14

HidingSlimeKeyEntityHandler::
    ldh  a, [hRoomStatus]                         ; $5FFD: $F0 $F8
    and  $10                                      ; $5FFF: $E6 $10
    jp   nz, UnloadEntityAndReturn                ; $6001: $C2 $8D $3F

    call func_003_61DE                            ; $6004: $CD $DE $61
    ld   de, Data_003_5FFB                        ; $6007: $11 $FB $5F
    call RenderActiveEntitySprite                 ; $600A: $CD $77 $3C
    call GetEntityTransitionCountdown             ; $600D: $CD $05 $0C
    jp   z, label_003_60AA                        ; $6010: $CA $AA $60

    cp   $10                                      ; $6013: $FE $10
    jr   nz, jr_003_604C                          ; $6015: $20 $35

    dec  [hl]                                     ; $6017: $35
    ld   a, [wIsIndoor]                           ; $6018: $FA $A5 $DB
    and  a                                        ; $601B: $A7
    jr   nz, jr_003_6029                          ; $601C: $20 $0B

    ldh  a, [hMapRoom]                            ; $601E: $F0 $F6
    cp   $C6                                      ; Overworld Pothole Field - Slime Key
    jr   nz, jr_003_6029                          ; $6022: $20 $05

    ld   a, $05                                   ; $6024: $3E $05
    ld   [wGoldenLeavesCount], a                  ; $6026: $EA $15 $DB

jr_003_6029:
    ld   hl, wGoldenLeavesCount                   ; $6029: $21 $15 $DB
    call IncreaseValueAtHLClampAt99               ; $602C: $CD $73 $63
    call MarkRoomCompleted                        ; $602F: $CD $2A $51
    ld   hl, hRoomStatus                          ; $6032: $21 $F8 $FF
    res  4, [hl]                                  ; $6035: $CB $A6
    ld   e, $A2                                   ; $6037: $1E $A2
    ld   a, [wGoldenLeavesCount]                  ; $6039: $FA $15 $DB
    cp   $06                                      ; $603C: $FE $06
    jr   z, jr_003_6047                           ; $603E: $28 $07

    ld   e, $E8                                   ; $6040: $1E $E8
    cp   $05                                      ; $6042: $FE $05
    jr   nz, jr_003_6047                          ; $6044: $20 $01

    inc  e                                        ; $6046: $1C

jr_003_6047:
    ld   a, e                                     ; $6047: $7B
    call OpenDialog                               ; $6048: $CD $85 $23
    xor  a                                        ; $604B: $AF

jr_003_604C:
    dec  a                                        ; $604C: $3D
    jr   nz, jr_003_6052                          ; $604D: $20 $03

    jp   UnloadEntityAndReturn                    ; $604F: $C3 $8D $3F

jr_003_6052:
    jp   HoldEntityAboveLink                      ; $6052: $C3 $17 $5A

Data_003_6055::
    db   $8E, $16

DroppableMagicPowderEntityHandler::
    ld   a, [wIsIndoor]                           ; $6057: $FA $A5 $DB
    and  a                                        ; $605A: $A7
    jr   z, jr_003_6063                           ; $605B: $28 $06

    ldh  a, [hMapId]                              ; $605D: $F0 $F7
    cp   $FF                                      ; $605F: $FE $FF
    jr   z, jr_003_606A                           ; $6061: $28 $07

jr_003_6063:
    ld   a, [wHasToadstool]                       ; $6063: $FA $4B $DB
    and  a                                        ; $6066: $A7
    jp   nz, UnloadEntityAndReturn                ; $6067: $C2 $8D $3F

jr_003_606A:
    call func_003_61DE                            ; $606A: $CD $DE $61
    call func_003_608C                            ; $606D: $CD $8C $60
    ld   de, Data_003_6055                        ; $6070: $11 $55 $60
    call RenderActiveEntitySprite                 ; $6073: $CD $77 $3C
    jp   label_003_60AA                           ; $6076: $C3 $AA $60

Data_003_6079::
    db   $2A, $41, $2A, $61

DroppableArrowsEntityHandler::
    call func_003_61DE                            ; $607D: $CD $DE $61
    call func_003_608C                            ; $6080: $CD $8C $60
    ld   de, Data_003_6079                        ; $6083: $11 $79 $60
    call RenderActiveEntitySpritesPair            ; $6086: $CD $C0 $3B
    jp   label_003_60AA                           ; $6089: $C3 $AA $60

func_003_608C::
    call GetEntityDropTimer                       ; $608C: $CD $FB $0B
    cp   $1C                                      ; $608F: $FE $1C
    ret  nc                                       ; $6091: $D0

    and  a                                        ; $6092: $A7
    jp   z, UnloadEntityAndReturn                 ; $6093: $CA $8D $3F

    and  $01                                      ; $6096: $E6 $01
    dec  a                                        ; $6098: $3D
    jp   SetEntitySpriteVariant                   ; $6099: $C3 $0C $3B

Data_003_609C::
    db   $A6, $15

DroppableRupeeEntityHandler::
    call func_003_61DE                            ; $609E: $CD $DE $61
    call func_003_608C                            ; $60A1: $CD $8C $60
    ld   de, Data_003_609C                        ; $60A4: $11 $9C $60
    call RenderActiveEntitySprite                 ; $60A7: $CD $77 $3C

label_003_60AA:
    call func_003_7F78                            ; $60AA: $CD $78 $7F
    call func_003_62AF                            ; $60AD: $CD $AF $62
    call func_003_62EB                            ; $60B0: $CD $EB $62

func_003_60B3::
    call func_003_7F25                            ; $60B3: $CD $25 $7F
    call func_003_6B7B                            ; $60B6: $CD $7B $6B
    call func_003_7893                            ; $60B9: $CD $93 $78
    ldh  a, [hIsSideScrolling]                    ; $60BC: $F0 $F9
    and  a                                        ; $60BE: $A7
    jr   z, jr_003_60E3                           ; $60BF: $28 $22

    ld   hl, wEntitiesCollisionsTable             ; $60C1: $21 $A0 $C2
    add  hl, bc                                   ; $60C4: $09
    ld   a, [hl]                                  ; $60C5: $7E
    and  $08                                      ; $60C6: $E6 $08
    jp   z, jr_003_6156                           ; $60C8: $CA $56 $61

    ld   hl, wEntitiesPosYTable                   ; $60CB: $21 $10 $C2
    add  hl, bc                                   ; $60CE: $09
    ld   a, [hl]                                  ; $60CF: $7E
    and  $F0                                      ; $60D0: $E6 $F0
    add  $05                                      ; $60D2: $C6 $05
    ld   [hl], a                                  ; $60D4: $77
    ld   hl, wEntitiesSpeedYTable                 ; $60D5: $21 $50 $C2
    add  hl, bc                                   ; $60D8: $09
    ld   a, [hl]                                  ; $60D9: $7E
    cpl                                           ; $60DA: $2F
    sra  a                                        ; $60DB: $CB $2F
    cp   $F8                                      ; $60DD: $FE $F8
    jr   c, jr_003_6112                           ; $60DF: $38 $31

    jr   jr_003_6103                              ; $60E1: $18 $20

jr_003_60E3:
    ld   hl, wEntitiesPosZTable                   ; $60E3: $21 $10 $C3
    add  hl, bc                                   ; $60E6: $09
    ld   a, [hl]                                  ; $60E7: $7E
    and  $80                                      ; $60E8: $E6 $80
    jr   z, jr_003_6156                           ; $60EA: $28 $6A

    xor  a                                        ; $60EC: $AF
    ld   [hl], a                                  ; $60ED: $77
    ld   hl, wEntitiesUnknowTableI                ; $60EE: $21 $70 $C4
    add  hl, bc                                   ; $60F1: $09
    ld   a, [hl]                                  ; $60F2: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $60F3: $21 $20 $C3
    add  hl, bc                                   ; $60F6: $09
    cp   $02                                      ; $60F7: $FE $02
    jr   z, jr_003_6103                           ; $60F9: $28 $08

    ld   a, [hl]                                  ; $60FB: $7E
    sra  a                                        ; $60FC: $CB $2F
    cpl                                           ; $60FE: $2F
    cp   $07                                      ; $60FF: $FE $07
    jr   nc, jr_003_6112                          ; $6101: $30 $0F

jr_003_6103:
    xor  a                                        ; $6103: $AF
    push hl                                       ; $6104: $E5
    ld   hl, wEntitiesSpeedXTable                 ; $6105: $21 $40 $C2
    add  hl, bc                                   ; $6108: $09
    ld   [hl], a                                  ; $6109: $77
    ld   hl, wEntitiesSpeedYTable                 ; $610A: $21 $50 $C2
    add  hl, bc                                   ; $610D: $09
    ld   [hl], a                                  ; $610E: $77
    pop  hl                                       ; $610F: $E1
    jr   jr_003_6136                              ; $6110: $18 $24

jr_003_6112:
    push af                                       ; $6112: $F5
    push hl                                       ; $6113: $E5

    ldh  a, [hActiveEntityType]                   ; $6114: $F0 $EB
    cp   ENTITY_KEY_DROP_POINT                    ; $6116: $FE $30
    jr   nz, .keyDropPointEnd                     ; $6118: $20 $06

    ld   a, $17                                   ; $611A: $3E $17
    ldh  [hNoiseSfx], a                           ; $611C: $E0 $F4
    jr   .bombEnd                                 ; $611E: $18 $14
.keyDropPointEnd

    cp   ENTITY_BOMB                              ; $6120: $FE $02
    jr   nz, .bombEnd                             ; $6122: $20 $10

    ld   hl, wEntitiesStatusTable                 ; $6124: $21 $80 $C2
    add  hl, bc                                   ; $6127: $09
    ld   a, [hl]                                  ; $6128: $7E
    and  a                                        ; $6129: $A7
    jr   z, .bombEnd                              ; $612A: $28 $08

    cp   $02                                      ; $612C: $FE $02
    jr   z, .bombEnd                              ; $612E: $28 $04

    ld   a, JINGLE_BUMP                           ; $6130: $3E $09
    ldh  [hJingle], a                             ; $6132: $E0 $F2
.bombEnd

    pop  hl                                       ; $6134: $E1
    pop  af                                       ; $6135: $F1

jr_003_6136:
    ld   [hl], a                                  ; $6136: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6137: $21 $40 $C2
    add  hl, bc                                   ; $613A: $09
    ld   a, [hl]                                  ; $613B: $7E
    sra  a                                        ; $613C: $CB $2F
    cp   $FF                                      ; $613E: $FE $FF
    jr   nz, jr_003_6143                          ; $6140: $20 $01

    xor  a                                        ; $6142: $AF

jr_003_6143:
    ld   [hl], a                                  ; $6143: $77
    ldh  a, [hIsSideScrolling]                    ; $6144: $F0 $F9
    and  a                                        ; $6146: $A7
    jr   nz, jr_003_6156                          ; $6147: $20 $0D

    ld   hl, wEntitiesSpeedYTable                 ; $6149: $21 $50 $C2
    add  hl, bc                                   ; $614C: $09
    ld   a, [hl]                                  ; $614D: $7E
    sra  a                                        ; $614E: $CB $2F
    cp   $FF                                      ; $6150: $FE $FF
    jr   nz, jr_003_6155                          ; $6152: $20 $01

    xor  a                                        ; $6154: $AF

jr_003_6155:
    ld   [hl], a                                  ; $6155: $77

jr_003_6156:
    ret                                           ; $6156: $C9

include "code/entities/droppable_fairy.asm"

func_003_61C0::
    ldh  a, [hFrameCounter]                       ; $61C0: $F0 $E7
    and  $03                                      ; $61C2: $E6 $03
    jr   nz, jr_003_61DD                          ; $61C4: $20 $17

    ld   hl, wEntitiesPosZTable                   ; $61C6: $21 $10 $C3
    add  hl, bc                                   ; $61C9: $09
    ld   a, [hl]                                  ; $61CA: $7E
    cp   $10                                      ; $61CB: $FE $10
    jr   z, jr_003_61DD                           ; $61CD: $28 $0E

    bit  7, a                                     ; $61CF: $CB $7F
    jr   z, jr_003_61D6                           ; $61D1: $28 $03

    inc  [hl]                                     ; $61D3: $34
    jr   jr_003_61DD                              ; $61D4: $18 $07

jr_003_61D6:
    cp   $10                                      ; $61D6: $FE $10
    jr   nc, jr_003_61DC                          ; $61D8: $30 $02

    inc  [hl]                                     ; $61DA: $34
    ret                                           ; $61DB: $C9

jr_003_61DC:
    dec  [hl]                                     ; $61DC: $35

jr_003_61DD:
    ret                                           ; $61DD: $C9

func_003_61DE::
    ld   hl, wEntitiesUnknownTableD               ; $61DE: $21 $D0 $C2
    add  hl, bc                                   ; $61E1: $09
    ld   a, [hl]                                  ; $61E2: $7E
    and  a                                        ; $61E3: $A7
    jp   z, label_003_629D                        ; $61E4: $CA $9D $62

    ld   a, [wRoomTransitionState]                ; $61E7: $FA $24 $C1
    and  a                                        ; $61EA: $A7
    jp   nz, jr_003_629C                          ; $61EB: $C2 $9C $62

    ld   a, [hl]                                  ; $61EE: $7E
    cp   $02                                      ; $61EF: $FE $02
    jr   nz, jr_003_6243                          ; $61F1: $20 $50

    ldh  a, [hActiveEntityType]                   ; $61F3: $F0 $EB
    cp   ENTITY_DROPPABLE_SECRET_SEASHELL         ; $61F5: $FE $3D
    jr   z, jr_003_6200                           ; $61F7: $28 $07 (???: If a seashell, jump?)

    ld   a, [wIsIndoor]                           ; $61F9: $FA $A5 $DB
    and  a                                        ; $61FC: $A7
    jp   nz, jr_003_629C                          ; $61FD: $C2 $9C $62

jr_003_6200:
    call func_003_7E0E                            ; $6200: $CD $0E $7E
    ldh  a, [hActiveEntityType]                   ; $6203: $F0 $EB
    cp   ENTITY_DROPPABLE_HEART                   ; $6205: $FE $2D
    jr   z, jr_003_6227                           ; $6207: $28 $1E

    cp   ENTITY_DROPPABLE_SECRET_SEASHELL         ; $6209: $FE $3D
    jr   nz, jr_003_622F                          ; $620B: $20 $22

    ldh  a, [hMapRoom]                            ; $620D: $F0 $F6
    cp   $DA                                      ; Overworld room one north of fisherman under bridge
    jr   z, jr_003_622F                           ; $6211: $28 $1C

    cp   $A5                                      ; Overworld room two east of Mabe bush field
    jr   z, jr_003_622F                           ; $6215: $28 $18

    cp   $74                                      ; Overworld room one south of ghost's gravestone (w/zombies)
    jr   z, jr_003_622F                           ; $6219: $28 $14

    cp   $3A                                      ; Overworld room with... no seashell?
    jr   z, jr_003_622F                           ; $621D: $28 $10

    cp   $A8                                      ; Overworld room northeast-ish of Pothole Field
    jr   z, jr_003_622F                           ; $6221: $28 $0C

    cp   $B2                                      ; Overworld room - Mabe village telephone booth (...no seashell???)
    jr   z, jr_003_622F                           ; $6225: $28 $08

jr_003_6227:
    ldh  a, [hObjectUnderEntity]                  ; $6227: $F0 $AF
    cp   $04                                      ; $6229: $FE $04
    jr   z, jr_003_623B                           ; $622B: $28 $0E

    jr   jr_003_6235                              ; $622D: $18 $06

jr_003_622F:
    ld   hl, wEntitiesUnknowTableP                ; $622F: $21 $40 $C4
    add  hl, bc                                   ; $6232: $09
    ld   [hl], $01                                ; $6233: $36 $01

jr_003_6235:
    ldh  a, [hObjectUnderEntity]                  ; $6235: $F0 $AF
    cp   $CC                                      ; $6237: $FE $CC
    jr   nz, jr_003_629C                          ; $6239: $20 $61

jr_003_623B:
    ld   hl, wEntitiesUnknowTableH                ; $623B: $21 $30 $C4
    add  hl, bc                                   ; $623E: $09
    ld   [hl], $0A                                ; $623F: $36 $0A
    jr   jr_003_626B                              ; $6241: $18 $28

jr_003_6243:
    ld   a, [$C157]                               ; $6243: $FA $57 $C1
    and  a                                        ; $6246: $A7
    jr   z, jr_003_629C                           ; $6247: $28 $53

    ld   a, [wC178]                               ; $6249: $FA $78 $C1
    and  a                                        ; $624C: $A7
    jr   z, jr_003_629C                           ; $624D: $28 $4D

    ldh  a, [hActiveEntityPosX]                   ; $624F: $F0 $EE
    add  $08                                      ; $6251: $C6 $08
    ld   hl, wC179                                ; $6253: $21 $79 $C1
    sub  [hl]                                     ; $6256: $96
    add  $10                                      ; $6257: $C6 $10
    cp   $20                                      ; $6259: $FE $20
    jr   nc, jr_003_629C                          ; $625B: $30 $3F

    ldh  a, [hActiveEntityPosY]                   ; $625D: $F0 $EF
    add  $08                                      ; $625F: $C6 $08
    ld   hl, wC17a                                ; $6261: $21 $7A $C1
    sub  [hl]                                     ; $6264: $96
    add  $10                                      ; $6265: $C6 $10
    cp   $20                                      ; $6267: $FE $20
    jr   nc, jr_003_629C                          ; $6269: $30 $31

jr_003_626B:
    ld   hl, wEntitiesUnknownTableD               ; $626B: $21 $D0 $C2
    add  hl, bc                                   ; $626E: $09
    ld   [hl], b                                  ; $626F: $70
    ld   hl, wEntitiesUnknowTableP                ; $6270: $21 $40 $C4
    add  hl, bc                                   ; $6273: $09
    ld   [hl], b                                  ; $6274: $70
    call GetEntityPrivateCountdown1               ; $6275: $CD $00 $0C
    ld   [hl], $18                                ; $6278: $36 $18
    ld   a, $0C                                   ; $627A: $3E $0C
    call GetVectorTowardsLink                     ; $627C: $CD $45 $7E
    ldh  a, [hScratch1]                           ; $627F: $F0 $D8
    cpl                                           ; $6281: $2F
    inc  a                                        ; $6282: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6283: $21 $40 $C2
    add  hl, bc                                   ; $6286: $09
    ld   [hl], a                                  ; $6287: $77
    ldh  a, [hScratch0]                           ; $6288: $F0 $D7
    cpl                                           ; $628A: $2F
    inc  a                                        ; $628B: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $628C: $21 $50 $C2
    add  hl, bc                                   ; $628F: $09
    ld   [hl], a                                  ; $6290: $77
    ld   hl, wEntitiesSpeedZTable                 ; $6291: $21 $20 $C3
    add  hl, bc                                   ; $6294: $09
    ld   [hl], $20                                ; $6295: $36 $20
    call GetEntityDropTimer                       ; $6297: $CD $FB $0B
    ld   [hl], $80                                ; $629A: $36 $80

jr_003_629C:
    pop  af                                       ; $629C: $F1

label_003_629D:
    ret                                           ; $629D: $C9

Data_003_629E::
    ; Indexed by entity type
    db   $01                                      ; ENTITY_DROPPABLE_HEART
    db   $01                                      ; ENTITY_DROPPABLE_RUPEE
    db   $00                                      ; ENTITY_DROPPABLE_FAIRY
    db   $00                                      ; ENTITY_KEY_DROP_POINT
    db   $01                                      ; ENTITY_SWORD
    db   $00                                      ; ENTITY_32
    db   $01                                      ; ENTITY_PIECE_OF_POWER
    db   $01                                      ; ENTITY_GUARDIAN_ACORN
    db   $00                                      ; ENTITY_HEART_PIECE
    db   $00                                      ; ENTITY_HEART_CONTAINER
    db   $01                                      ; ENTITY_DROPPABLE_ARROWS
    db   $01                                      ; ENTITY_DROPPABLE_BOMBS
    db   $00                                      ; ENTITY_INSTRUMENT_OF_THE_SIRENS
    db   $00                                      ; ENTITY_SLEEPY_TOADSTOOL
    db   $01                                      ; ENTITY_DROPPABLE_MAGIC_POWDER
    db   $00                                      ; ENTITY_HIDING_SLIME_KEY
    db   $00                                      ; ENTITY_DROPPABLE_SECRET_SEASHELL

func_003_62AF::
    ld   hl, wEntitiesUnknowTableR                ; $62AF: $21 $90 $C3
    add  hl, bc                                   ; $62B2: $09
    ld   a, [hl]                                  ; $62B3: $7E
    and  a                                        ; $62B4: $A7
    jr   z, jr_003_62EA                           ; $62B5: $28 $33

    pop  de                                       ; $62B7: $D1
    dec  a                                        ; $62B8: $3D
    ld   e, a                                     ; $62B9: $5F
    ld   d, b                                     ; $62BA: $50
    ld   hl, wEntitiesStatusTable                 ; $62BB: $21 $80 $C2
    add  hl, de                                   ; $62BE: $19
    ld   a, [hl]                                  ; $62BF: $7E
    and  a                                        ; $62C0: $A7
    jr   z, collectPickableItem                   ; $62C1: $28 $4E

    ld   hl, wEntitiesTypeTable                   ; $62C3: $21 $A0 $C3
    add  hl, de                                   ; $62C6: $19
    ld   a, [hl]                                  ; $62C7: $7E
    cp   $01                                      ; $62C8: $FE $01
    jr   z, jr_003_62D0                           ; $62CA: $28 $04

    cp   $03                                      ; $62CC: $FE $03
    jr   nz, collectPickableItem                  ; $62CE: $20 $41

jr_003_62D0:
    ld   hl, wEntitiesPosXTable                   ; $62D0: $21 $00 $C2
    add  hl, de                                   ; $62D3: $19
    ld   a, [hl]                                  ; $62D4: $7E
    ld   hl, wEntitiesPosXTable                   ; $62D5: $21 $00 $C2
    add  hl, bc                                   ; $62D8: $09
    ld   [hl], a                                  ; $62D9: $77
    ld   hl, wEntitiesPosYTable                   ; $62DA: $21 $10 $C2
    add  hl, de                                   ; $62DD: $19
    ld   a, [hl]                                  ; $62DE: $7E
    ld   hl, wEntitiesPosYTable                   ; $62DF: $21 $10 $C2
    add  hl, bc                                   ; $62E2: $09
    ld   [hl], a                                  ; $62E3: $77
    xor  a                                        ; $62E4: $AF
    ld   hl, wEntitiesPosZTable                   ; $62E5: $21 $10 $C3
    add  hl, bc                                   ; $62E8: $09
    ld   [hl], a                                  ; $62E9: $77

jr_003_62EA:
    ret                                           ; $62EA: $C9

func_003_62EB::
    call GetEntityPrivateCountdown1               ; $62EB: $CD $00 $0C
    jr   nz, jr_003_62EA                          ; $62EE: $20 $FA

    ldh  a, [hActiveEntityType]                   ; $62F0: $F0 $EB
    sub  $2D                                      ; $62F2: $D6 $2D
    ld   e, a                                     ; $62F4: $5F
    ld   d, b                                     ; $62F5: $50
    ld   hl, Data_003_629E                        ; $62F6: $21 $9E $62
    add  hl, de                                   ; $62F9: $19
    ld   a, [hl]                                  ; $62FA: $7E
    and  a                                        ; $62FB: $A7
    jr   z, jr_003_630C                           ; $62FC: $28 $0E

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $62FE: $21 $10 $C4
    add  hl, bc                                   ; $6301: $09
    ld   a, [hl]                                  ; $6302: $7E
    push af                                       ; $6303: $F5
    push hl                                       ; $6304: $E5
    ld   [hl], b                                  ; $6305: $70
    call func_003_6E2B                            ; $6306: $CD $2B $6E
    pop  hl                                       ; $6309: $E1
    pop  af                                       ; $630A: $F1
    ld   [hl], a                                  ; $630B: $77

jr_003_630C:
    call func_003_6C6B                            ; $630C: $CD $6B $6C
    jr   nc, jr_003_62EA                          ; $630F: $30 $D9

collectPickableItem:
    ld   hl, wEntitiesLoadOrderTable              ; $6311: $21 $60 $C4
    add  hl, bc                                   ; $6314: $09
    ld   a, [hl]                                  ; $6315: $7E
    call DidKillEnemy.label_3F78                  ; $6316: $CD $78 $3F

    ldh  a, [hActiveEntityType]                   ; $6319: $F0 $EB
    sub  $2D                                      ; $631B: $D6 $2D

    ; Play a sound when picking the item
    cp   ENTITY_DROPPABLE_FAIRY - $2D             ; $631D: $FE $02
    jr   nc, .notFairy                            ; $631F: $30 $07
    ld   hl, hJingle                              ; $6321: $21 $F2 $FF
    ld   [hl], JINGLE_GOT_HEART                   ; $6324: $36 $14
    jr   .sfxEnd                                  ; $6326: $18 $05
.notFairy
    ld   hl, hWaveSfx                             ; $6328: $21 $F3 $FF
    ld   [hl], WAVE_SFX_SEASHELL                  ; $632B: $36 $01
.sfxEnd

    ; Jump to the handler for this pickable entity
    JP_TABLE
._2D dw PickDroppableHeart
._2E dw PickDroppableRupee
._2F dw PickDroppableFairy
._30 dw PickDroppableKey
._31 dw PickSword
._32 dw PickEntity32
._33 dw PickPieceOfPower
._34 dw PickGuardianAcorn
._35 dw PickHeartPiece
._36 dw PickHeartContainer
._37 dw PickDroppableArrows
._38 dw PickDroppableBombs
._39 dw PickSirensInstrument
._3A dw PickToadstoolOrDungeonKey
._3B dw PickDroppableMagicPowder
._3C dw PickToadstoolOrDungeonKey
._3D dw PickSecretSeashell

PickDroppableMagicPowder::
    ld   a, $0B                                   ; $6350: $3E $0B
    ldh  [hFFA5], a                               ; $6352: $E0 $A5
    ld   d, $0C                                   ; $6354: $16 $0C
    call GiveInventoryItem                            ; $6356: $CD $72 $64
    ld   hl, wMaxMagicPowder                      ; $6359: $21 $76 $DB
    ld   de, wMagicPowderCount                    ; $635C: $11 $4C $DB

jr_003_635F:
    ld   a, [de]                                  ; $635F: $1A
    cp   [hl]                                     ; $6360: $BE
    jr   nc, .return                              ; $6361: $30 $04

    add  $01                                      ; $6363: $C6 $01
    daa                                           ; $6365: $27
    ld   [de], a                                  ; $6366: $12

.return:
    ret                                           ; $6367: $C9

PickSecretSeashell::
    call_open_dialog $0EF                         ; $6368

label_003_636D:
    call MarkRoomCompleted                        ; $636D: $CD $2A $51
    ld   hl, wSeashellsCount                      ; $6370: $21 $0F $DB

IncreaseValueAtHLClampAt99::
    ; POI: Adds one to seashell / golden leaves count, preventing overflow if at 99.
    ; But you can never get anywhere near that! Golden Leaves even stop at 6 (slime key)!
    ld   a, [hl]                                  ; $6373: $7E
    cp   $99                                      ; $6374: $FE $99
    jr   z, jr_003_637C                           ; $6376: $28 $04

    add  $01                                      ; $6378: $C6 $01
    daa                                           ; $637A: $27
    ld   [hl], a                                  ; $637B: $77

jr_003_637C:
    ret                                           ; $637C: $C9

PickDroppableArrows::
    ld   hl, wMaxArrows                           ; $637D: $21 $78 $DB
    ld   de, wArrowCount                          ; $6380: $11 $45 $DB
    jr   jr_003_635F                              ; $6383: $18 $DA

PickDroppableBombs::
    ld   d, $02                                   ; $6385: $16 $02
    call GiveInventoryItem                            ; $6387: $CD $72 $64
    ld   hl, wMaxBombs                            ; $638A: $21 $77 $DB
    ld   de, wBombCount                           ; $638D: $11 $4D $DB
    jr   jr_003_635F                              ; $6390: $18 $CD

PickSirensInstrument::
    xor  a                                        ; $6392: $AF
    ld   [wBossDefeated], a                       ; $6393: $EA $6C $D4
    ld   [wObjectAffectingBGPalette], a           ; $6396: $EA $CB $C3
    ld   a, MUSIC_INSTRUMENT_ACQUIRED             ; $6399: $3E $1B
    ld   [wMusicTrackToPlay], a                   ; $639B: $EA $68 $D3
    ld   [wC167], a                               ; $639E: $EA $67 $C1

; Link beach sword lifting in the air animation?
func_003_63A1::
    ldh  a, [hLinkPositionX]                      ; $63A1: $F0 $98
    push af                                       ; $63A3: $F5
    add  $04                                      ; $63A4: $C6 $04
    ldh  [hLinkPositionX], a                      ; $63A6: $E0 $98
    call func_003_641E                            ; $63A8: $CD $1E $64
    pop  af                                       ; $63AB: $F1
    ldh  [hLinkPositionX], a                      ; $63AC: $E0 $98
    jr   label_003_63D2                           ; $63AE: $18 $22

PickHeartContainer::
    xor  a                                        ; $63B0: $AF
    ld   [wActivePowerUp], a                      ; $63B1: $EA $7C $D4
    ld   a, MUSIC_HEART_CONTAINER_ACQUIRED        ; $63B4: $3E $25
    ld   [wMusicTrackToPlay], a                   ; $63B6: $EA $68 $D3
    ld   [wBossDefeated], a                       ; $63B9: $EA $6C $D4
    call GetEntityTransitionCountdown             ; $63BC: $CD $05 $0C
    ld   a, $70                                   ; $63BF: $3E $70
    ld   [hl], a                                  ; $63C1: $77
    ld   [wC111], a                               ; $63C2: $EA $11 $C1
    jr   jr_003_63DB                              ; $63C5: $18 $14

PickToadstoolOrDungeonKey::
    ld   a, MUSIC_TOOL_ACQUIRED                   ; $63C7: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $63C9: $EA $68 $D3
    jr   label_003_63D2                           ; $63CC: $18 $04

    ld   a, JINGLE_TREASURE_FOUND                 ; $63CE: $3E $01
    ldh  [hJingle], a                             ; $63D0: $E0 $F2

label_003_63D2:
    call GetEntityTransitionCountdown             ; $63D2: $CD $05 $0C
    ld   a, $68                                   ; $63D5: $3E $68
    ld   [hl], a                                  ; $63D7: $77
    ld   [wC111], a                               ; $63D8: $EA $11 $C1

jr_003_63DB:
    ld   hl, wEntitiesStatusTable                 ; $63DB: $21 $80 $C2
    add  hl, bc                                   ; $63DE: $09
    ld   [hl], $05                                ; $63DF: $36 $05
    jp   ResetSpinAttack                          ; $63E1: $C3 $AF $0C

PickHeartPiece::
    ld   a, MUSIC_TOOL_ACQUIRED                   ; $63E4: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $63E6: $EA $68 $D3
    call IncrementEntityState                     ; $63E9: $CD $12 $3B
    jr   jr_003_63DB                              ; $63EC: $18 $ED

Data_003_63EE::
    db   $E4, $14, $E4, $14

Data_003_63F2::
    db   $D4, $D4, $04, $04

PickGuardianAcorn::
    ld   a, $02                                   ; $63F6: $3E $02
    ld   e, $05                                   ; $63F8: $1E $05
    jr   jr_003_6400                              ; $63FA: $18 $04

PickPieceOfPower::
    ld   a, $01                                   ; $63FC: $3E $01
    ld   e, $01                                   ; $63FE: $1E $01

jr_003_6400:
    ld   [wActivePowerUp], a                      ; $6400: $EA $7C $D4
    ld   a, e                                     ; $6403: $7B
    ld   [wDialogGotItem], a                      ; $6404: $EA $A9 $C1
    ld   a, $30                                   ; $6407: $3E $30
    ld   [wDialogGotItemCountdown], a             ; $6409: $EA $AA $C1
    ld   [wC111], a                               ; $640C: $EA $11 $C1
    xor  a                                        ; $640F: $AF
    ld   [wPowerUpHits], a                        ; $6410: $EA $7A $D4
    ld   a, MUSIC_POWERUP_ACQUIRED                ; $6413: $3E $27
    ld   [wMusicTrackToPlay], a                   ; $6415: $EA $68 $D3
    ld   a, MUSIC_ACTIVE_POWER_UP                 ; $6418: $3E $49
    ldh  [$FFBD], a                               ; $641A: $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ; $641C: $E0 $BF

func_003_641E::
    ld   e, $03                                   ; $641E: $1E $03
    ld   d, $00                                   ; $6420: $16 $00

jr_003_6422:
    push de                                       ; $6422: $D5
    ld   hl, Data_003_63EE                        ; $6423: $21 $EE $63
    add  hl, de                                   ; $6426: $19
    ldh  a, [hLinkPositionX]                      ; $6427: $F0 $98
    add  [hl]                                     ; $6429: $86
    ldh  [hScratch0], a                           ; $642A: $E0 $D7
    ld   hl, Data_003_63F2                        ; $642C: $21 $F2 $63
    add  hl, de                                   ; $642F: $19
    ldh  a, [hLinkPositionY]                      ; $6430: $F0 $99
    add  [hl]                                     ; $6432: $86
    ldh  [hScratch1], a                           ; $6433: $E0 $D8
    ld   a, TRANSCIENT_VFX_MOVING_SPARKLE         ; $6435: $3E $07
    call AddTranscientVfx                         ; $6437: $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ; $643A: $21 $20 $C5
    add  hl, de                                   ; $643D: $19
    ld   [hl], $22                                ; $643E: $36 $22
    ld   hl, $C590                                ; $6440: $21 $90 $C5
    add  hl, de                                   ; $6443: $19
    pop  de                                       ; $6444: $D1
    ld   [hl], e                                  ; $6445: $73
    dec  e                                        ; $6446: $1D
    ld   a, e                                     ; $6447: $7B
    cp   $FF                                      ; $6448: $FE $FF
    jr   nz, jr_003_6422                          ; $644A: $20 $D6

PickEntity32::
    ret                                           ; $644C: $C9

PickSword::
    ld   a, [wSwordLevel]                         ; $644D: $FA $4E $DB
    and  a                                        ; $6450: $A7
    jr   nz, jr_003_6468                          ; $6451: $20 $15

    ld   a, MUSIC_SWORD_ACQUIRED                  ; $6453: $3E $0F
    ld   [wMusicTrackToPlay], a                   ; $6455: $EA $68 $D3
    ld   [wC167], a                               ; $6458: $EA $67 $C1
    call func_003_63A1                            ; $645B: $CD $A1 $63
    call GetEntityTransitionCountdown             ; $645E: $CD $05 $0C
    ld   [hl], $A0                                ; $6461: $36 $A0
    ld   a, MUSIC_SILENCE                         ; $6463: $3E $FF
    ldh  [hNextDefaultMusicTrack], a              ; $6465: $E0 $BF
    ret                                           ; $6467: $C9

jr_003_6468:
    ; POI: If sword level > 0, it's a shield instead. Used for Like-Likes?
    ld   hl, wEntitiesPrivateState1Table          ; $6468: $21 $B0 $C2
    add  hl, bc                                   ; $646B: $09
    ld   a, [hl]                                  ; $646C: $7E
    ld   [wShieldLevel], a                        ; $646D: $EA $44 $DB
    ld   d, INVENTORY_SHIELD                      ; $6470: $16 $04

GiveInventoryItem::     ; @TODO GivePlayerItem or w/e - inserts item in [d] into first available slot
    ld   hl, wBButtonSlot                         ; $6472: $21 $00 $DB
    ld   e, $0C                                   ; $6475: $1E $0C

.checkInventorySlot:                              ; Check if we already have this item:
    ld   a, [hl+]                                 ; Check what item is in this slot
    cp   d                                        ; Is it the item we're trying to add?
    jr   z, .return                               ; If yes, return

    dec  e                                        ; Otherwise, have we checked all slots?
    jr   nz, .checkInventorySlot                  ; If no, continue

    ld   hl, wBButtonSlot                         ; Otherwise, load the inventory start again...

.checkInventorySlotEmpty:
    ld   a, [hl]                                  ; Check if an item is equipped in this slot
    and  a                                        ;
    jr   nz, .inventorySlotFull                   ; If there is an item, jump ahead

    ld   [hl], d                                  ; Otherwise, put the item into this slot
    ret                                           ; and return

.inventorySlotFull:
    inc  hl                                       ; Do we have more inventory spaces to check?
    inc  e                                        ; (e was 0C - slots checked)
    ld   a, e                                     ;
    cp   $0C                                      ; If we've checked enough to get back to 0C, we're out
    jr   nz, .checkInventorySlotEmpty             ; Otherwise, go back to check next slot

.return:
    ret                                           ; $648E: $C9

PickDroppableKey::
    ldh  a, [hMapRoom]                            ; $648F: $F0 $F6
    cp   $80                                      ; L5 Master Stalfos's final fight
    jr   z, jr_003_64A5                           ; $6493: $28 $10

    ldh  a, [hMapRoom]                            ; $6495: $F0 $F6
    cp   $7C                                      ; L4 Side-view room where the key drops
    jr   nz, jr_003_64A0                          ; $6499: $20 $05

    ld   hl, wIndoorARoomStatus + $69             ; $649B: $21 $69 $D9
    set  4, [hl]                                  ; $649E: $CB $E6

jr_003_64A0:
    ldh  a, [hActiveEntitySpriteVariant]          ; $64A0: $F0 $F1
    and  a                                        ; $64A2: $A7
    jr   z, jr_003_64AD                           ; $64A3: $28 $08

jr_003_64A5:
    ld   a, MUSIC_TOOL_ACQUIRED                   ; $64A5: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $64A7: $EA $68 $D3
    jp   label_003_63D2                           ; $64AA: $C3 $D2 $63

jr_003_64AD:
    call MarkRoomCompleted                        ; $64AD: $CD $2A $51
    ld   hl, wSmallKeysCount                      ; $64B0: $21 $D0 $DB
    inc  [hl]                                     ; $64B3: $34
    jp   SynchronizeDungeonsItemFlags_trampoline  ; $64B4: $C3 $02 $28

PickDroppableHeart::
    ld   a, $08                                   ; $64B7: $3E $08

jr_003_64B9:
    ld   hl, wAddHealthBuffer                     ; $64B9: $21 $93 $DB

jr_003_64BC:
    add  [hl]                                     ; $64BC: $86
    ld   [hl], a                                  ; $64BD: $77
    ret                                           ; $64BE: $C9

PickDroppableRupee::
    ld   a, $01                                   ; $64BF: $3E $01
    ld   hl, wAddRupeeBufferLow                   ; $64C1: $21 $90 $DB
    jr   jr_003_64BC                              ; $64C4: $18 $F6

PickDroppableFairy::
    ld   a, $30                                   ; $64C6: $3E $30
    jr   jr_003_64B9                              ; $64C8: $18 $EF

; Create a new active entity in the last available slot
; Inputs:
;   a:   entity type
;   bc:  ???
; Outputs:
;   c:   set the carry flag if no slots were available
SpawnNewEntity::
    ; Enumerate all entities (starting from the last one)
    ld   e, MAX_ENTITIES - 1                      ; $64CA: $1E $0F

; Create a new active entity in the last available slot starting from E?
; Inputs:
;   a:   entity type
;   bc:  ???
;   e:   index of slot to start the search from
; Outputs:
;   c:   set the carry flag if no slots were available
SpawnNewEntityInRange::
    push af                                       ; $64CC: $F5
    ld   d, $00                                   ; $64CD: $16 $00

    ; For each entity slot:
.loop
    ; Find an available (i.e. disabled) entity slot
    ld   hl, wEntitiesStatusTable                   ; $64CF: $21 $80 $C2
    add  hl, de                                   ; $64D2: $19
    ld   a, [hl]                                  ; $64D3: $7E
    and  a                                        ; $64D4: $A7
    jr   z, .entitySlotIsAvailable                ; $64D5: $28 $09

    ; Loop down until slot 0 is reached
    dec  e                                        ; $64D7: $1D
    ld   a, e                                     ; $64D8: $7B
    cp   $FF                                      ; $64D9: $FE $FF
    jr   nz, .loop                                ; $64DB: $20 $F2

    ; No available slot was found:
    ; set the carry flag and return.
    pop  af                                       ; $64DD: $F1
    scf                                           ; $64DE: $37
    ret                                           ; $64DF: $C9

.entitySlotIsAvailable
    ; Mark the new entity as active
    ld   [hl], ENTITY_STATUS_ACTIVE               ; $64E0: $36 $05

    ; Set the entity type
    pop  af                                       ; $64E2: $F1
    ld   hl, wEntitiesTypeTable                   ; $64E3: $21 $A0 $C3
    add  hl, de                                   ; $64E6: $19
    ld   [hl], a                                  ; $64E7: $77

    ; hScratch0 = previous entity pos X
    ld   hl, wEntitiesPosXTable                   ; $64E8: $21 $00 $C2
    add  hl, bc                                   ; $64EB: $09
    ld   a, [hl]                                  ; $64EC: $7E
    ldh  [hScratch0], a                           ; $64ED: $E0 $D7

    ; hScratch1 = previous entity pos Y
    ld   hl, wEntitiesPosYTable                   ; $64EF: $21 $10 $C2
    add  hl, bc                                   ; $64F2: $09
    ld   a, [hl]                                  ; $64F3: $7E
    ldh  [hScratch1], a                           ; $64F4: $E0 $D8

    ; hScratch2 = previous entity wEntitiesDirectionTable
    ld   hl, wEntitiesDirectionTable              ; $64F6: $21 $80 $C3
    add  hl, bc                                   ; $64F9: $09
    ld   a, [hl]                                  ; $64FA: $7E
    ldh  [hScratch2], a                           ; $64FB: $E0 $D9

    ; hScratch3 = previous entity pos Z
    ld   hl, wEntitiesPosZTable                                ; $64FD: $21 $10 $C3
    add  hl, bc                                   ; $6500: $09
    ld   a, [hl]                                  ; $6501: $7E
    ldh  [hScratch3], a                           ; $6502: $E0 $DA

    call ConfigureNewEntity_helper                            ; $6504: $CD $24 $65

    ; entity's wEntitiesIgnoreHitsCountdownTable   = 1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6507: $21 $10 $C4
    add  hl, de                                   ; $650A: $19
    ld   [hl], $01                                ; $650B: $36 $01

    ld   hl, wEntitiesPosXSignTable                                ; $650D: $21 $20 $C2
    add  hl, bc                                   ; $6510: $09
    ld   a, [hl]                                  ; $6511: $7E
    ld   hl, wEntitiesPosXSignTable               ; $6512: $21 $20 $C2
    add  hl, de                                   ; $6515: $19
    ld   [hl], a                                  ; $6516: $77
    ld   hl, wEntitiesPosYSignTable               ; $6517: $21 $30 $C2
    add  hl, bc                                   ; $651A: $09
    ld   a, [hl]                                  ; $651B: $7E
    ld   hl, wEntitiesPosYSignTable               ; $651C: $21 $30 $C2
    add  hl, de                                   ; $651F: $19
    ld   [hl], a                                  ; $6520: $77

    ; An available slot was found:
    ; clear the carry flag and return.
    scf                                           ; $6521: $37
    ccf                                           ; $6522: $3F
    ret                                           ; $6523: $C9

; Helper for calling ConfigureNewEntity, but with the argument in different registers
; Inputs:
;   de   entity index
ConfigureNewEntity_helper::
    push bc                                       ; $6524: $C5
    push de                                       ; $6525: $D5
    ; bc = de
    ld   c, e                                     ; $6526: $4B
    ld   b, d                                     ; $6527: $42
    call ConfigureNewEntity                            ; $6528: $CD $5B $48
    ; Restore bc and de
    pop  de                                       ; $652B: $D1
    pop  bc                                       ; $652C: $C1
    ret                                           ; $652D: $C9

Data_003_652E::
    db   $80, $15

Data_003_6530::
    db   $F8, $F8, $32, $01, $F8, $00, $32, $21, $F8, $08, $32, $01, $F8, $10, $32, $21
    db   $08, $F8, $32, $01, $08, $00, $32, $21, $08, $08, $32, $01, $08, $10, $32, $21
    db   $F8, $F8, $10, $02, $F8, $00, $12, $02, $F8, $08, $12, $22, $F8, $10, $10, $22
    db   $08, $F8, $10, $42, $08, $00, $12, $42, $08, $08, $12, $62, $08, $10, $10, $62
    db   $FC, $FC, $30, $11, $FC, $04, $30, $31, $FC, $04, $30, $11, $FC, $0C, $30, $31
    db   $04, $FC, $30, $11, $04, $04, $30, $31, $04, $04, $30, $11, $04, $0C, $30, $31
    db   $FC, $FC, $30, $01, $FC, $04, $30, $21, $FC, $04, $30, $01, $FC, $0C, $30, $21
    db   $04, $FC, $30, $01, $04, $04, $30, $21, $04, $04, $30, $01, $04, $0C, $30, $21

func_003_65B0::
    ld   hl, wEntitiesSpriteVariantTable          ; $65B0: $21 $B0 $C3
    add  hl, bc                                   ; $65B3: $09
    ld   a, [hl]                                  ; $65B4: $7E
    sla  a                                        ; $65B5: $CB $27
    sla  a                                        ; $65B7: $CB $27

jr_003_65B9:
    sla  a                                        ; $65B9: $CB $27
    sla  a                                        ; $65BB: $CB $27
    sla  a                                        ; $65BD: $CB $27
    ld   e, a                                     ; $65BF: $5F
    ld   d, b                                     ; $65C0: $50

jr_003_65C1:
    ld   hl, Data_003_6530                        ; $65C1: $21 $30 $65
    add  hl, de                                   ; $65C4: $19
    ld   c, $08                                   ; $65C5: $0E $08
    jp   RenderActiveEntitySpritesRect            ; $65C7: $C3 $E6 $3C

Data_003_65CA::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
    db   $02, $02, $02, $02, $03, $03, $03, $03

label_003_65E2:
    call func_003_6650                            ; $65E2: $CD $50 $66
    call func_003_7F78                            ; $65E5: $CD $78 $7F
    call GetEntityTransitionCountdown             ; $65E8: $CD $05 $0C
    and  a                                        ; $65EB: $A7
    jp   nz, label_003_65F2                       ; $65EC: $C2 $F2 $65

    jp   UnloadEntityAndReturn                    ; $65EF: $C3 $8D $3F

label_003_65F2:
    ld   e, a                                     ; $65F2: $5F
    ld   hl, wEntitiesUnknowTableP                ; $65F3: $21 $40 $C4
    add  hl, bc                                   ; $65F6: $09
    ld   a, [hl]                                  ; $65F7: $7E
    cp   $4C                                      ; $65F8: $FE $4C
    ld   a, e                                     ; $65FA: $7B
    jp   z, jr_003_664F                           ; $65FB: $CA $4F $66

    cp   $0E                                      ; $65FE: $FE $0E
    jr   c, jr_003_6614                           ; $6600: $38 $12

    cp   $17                                      ; $6602: $FE $17
    jr   nc, jr_003_6614                          ; $6604: $30 $0E

    push af                                       ; $6606: $F5
    sub  $0E                                      ; $6607: $D6 $0E
    ld   e, a                                     ; $6609: $5F
    ld   d, b                                     ; $660A: $50
    push de                                       ; $660B: $D5
    call func_003_68F8                            ; $660C: $CD $F8 $68
    pop  de                                       ; $660F: $D1
    call func_003_6771                            ; $6610: $CD $71 $67
    pop  af                                       ; $6613: $F1

jr_003_6614:
    cp   $12                                      ; $6614: $FE $12
    jr   nz, jr_003_664F                          ; $6616: $20 $37

    ld   hl, wEntitiesUnknowTableP                ; $6618: $21 $40 $C4
    add  hl, bc                                   ; $661B: $09
    ld   a, [hl]                                  ; $661C: $7E
    and  a                                        ; $661D: $A7
    jr   nz, jr_003_6625                          ; $661E: $20 $05

    call func_003_77D9                            ; $6620: $CD $D9 $77
    jr   jr_003_664A                              ; $6623: $18 $25

jr_003_6625:
    ldh  a, [hActiveEntityPosX]                   ; $6625: $F0 $EE
    ld   hl, hLinkPositionX                       ; $6627: $21 $98 $FF
    sub  [hl]                                     ; $662A: $96
    add  $18                                      ; $662B: $C6 $18
    cp   $30                                      ; $662D: $FE $30
    jr   nc, jr_003_664A                          ; $662F: $30 $19

    ldh  a, [hActiveEntityPosY]                   ; $6631: $F0 $EF
    ld   hl, hLinkPositionY                       ; $6633: $21 $99 $FF
    sub  [hl]                                     ; $6636: $96
    add  $18                                      ; $6637: $C6 $18
    cp   $30                                      ; $6639: $FE $30
    jr   nc, jr_003_664A                          ; $663B: $30 $0D

    call ApplyLinkCollisionWithEnemy              ; $663D: $CD $D5 $6C
    ld   hl, hLinkPositionXIncrement              ; $6640: $21 $9A $FF
    sla  [hl]                                     ; $6643: $CB $26
    ld   hl, hLinkPositionYIncrement              ; $6645: $21 $9B $FF
    sla  [hl]                                     ; $6648: $CB $26

jr_003_664A:
    ld   a, $04                                   ; $664A: $3E $04
    ld   [$C502], a                               ; $664C: $EA $02 $C5

jr_003_664F:
    ret                                           ; $664F: $C9

func_003_6650::
    call GetEntityTransitionCountdown             ; $6650: $CD $05 $0C
    ld   e, a                                     ; $6653: $5F
    ld   d, b                                     ; $6654: $50
    ld   hl, Data_003_65CA                        ; $6655: $21 $CA $65
    add  hl, de                                   ; $6658: $19
    ld   a, [hl]                                  ; $6659: $7E
    call SetEntitySpriteVariant                   ; $665A: $CD $0C $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $665D: $21 $40 $C3
    add  hl, bc                                   ; $6660: $09
    ld   a, [hl]                                  ; $6661: $7E
    and  $F0                                      ; $6662: $E6 $F0
    or   $08                                      ; $6664: $F6 $08
    ld   [hl], a                                  ; $6666: $77
    call func_003_65B0                            ; $6667: $CD $B0 $65
    ld   a, [wIsIndoor]                           ; $666A: $FA $A5 $DB
    and  a                                        ; $666D: $A7
    jr   z, jr_003_668B                           ; $666E: $28 $1B

    ld   a, [wTransitionSequenceCounter]          ; $6670: $FA $6B $C1
    cp   $04                                      ; $6673: $FE $04
    ret  nz                                       ; $6675: $C0

    ld   e, $E4                                   ; $6676: $1E $E4
    ld   a, [wRoomTransitionState]                ; $6678: $FA $24 $C1
    and  a                                        ; $667B: $A7
    jr   nz, jr_003_6687                          ; $667C: $20 $09

    call GetEntityTransitionCountdown             ; $667E: $CD $05 $0C
    and  $04                                      ; $6681: $E6 $04
    jr   z, jr_003_6687                           ; $6683: $28 $02

    ld   e, $84                                   ; $6685: $1E $84

jr_003_6687:
    ld   hl, wBGPalette                           ; $6687: $21 $97 $DB
    ld   [hl], e                                  ; $668A: $73

jr_003_668B:
    ret                                           ; $668B: $C9

jr_003_668C:
    ld   de, Data_003_5484                        ; $668C: $11 $84 $54
    call RenderActiveEntitySpritesPair            ; $668F: $CD $C0 $3B
    call func_003_7F78                            ; $6692: $CD $78 $7F
    ret                                           ; $6695: $C9

include "code/entities/bomb.asm"

func_003_6711::
    ld   hl, hActiveEntityVisualPosY              ; $6711: $21 $EC $FF
    inc  [hl]                                     ; $6714: $34
    inc  [hl]                                     ; $6715: $34
    ld   de, Data_003_652E                        ; $6716: $11 $2E $65
    call RenderActiveEntitySprite                 ; $6719: $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ; $671C: $C3 $8A $3D

Data_003_671F::
    db   $F8, $08, $18, $F8, $08, $18, $F8, $08, $18

Data_003_6728::
    db   $F8, $F8, $F8, $08, $08, $08, $18, $18, $18, $48, $48, $00, $90, $00, $70, $38
    db   $38

Data_003_6739::
    db   $3D, $3D, $3E, $3E

Data_003_673D::
    db   $72, $72, $73, $73, $04, $04, $04, $04, $69, $79, $69, $79, $04, $04, $04, $04

Data_003_674D::
    db   $64, $66, $65, $67

Data_003_6751::
    db   $64, $66, $64, $66

Data_003_6755::
    db   $04, $08, $02, $01

Data_003_6759::
    db   $08, $04, $01, $02

Data_003_675D::
    db   $F8, $08, $FF, $01

Data_003_6761::
    db   $72, $73, $73, $72, $00, $00, $00, $00

Data_003_6769::
    db   $00, $10, $F0, $10

Data_003_676D::
    db   $00, $00, $10, $00

func_003_6771::
    ldh  a, [hIsSideScrolling]                    ; $6771: $F0 $F9
    and  a                                        ; $6773: $A7
    jp   nz, label_003_68E5                       ; $6774: $C2 $E5 $68

    push bc                                       ; $6777: $C5
    ld   hl, wEntitiesPosXTable                   ; $6778: $21 $00 $C2
    add  hl, bc                                   ; $677B: $09
    ld   a, [hl]                                  ; $677C: $7E
    sub  $08                                      ; $677D: $D6 $08
    ld   hl, Data_003_671F                        ; $677F: $21 $1F $67
    add  hl, de                                   ; $6782: $19
    add  [hl]                                     ; $6783: $86
    and  $F0                                      ; $6784: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $6786: $E0 $CE
    swap a                                        ; $6788: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $678A: $21 $10 $C2
    add  hl, bc                                   ; $678D: $09
    ld   c, a                                     ; $678E: $4F
    ld   a, [hl]                                  ; $678F: $7E
    sub  $10                                      ; $6790: $D6 $10
    ld   hl, Data_003_6728                        ; $6792: $21 $28 $67
    add  hl, de                                   ; $6795: $19
    add  [hl]                                     ; $6796: $86
    and  $F0                                      ; $6797: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $6799: $E0 $CD
    or   c                                        ; $679B: $B1
    ld   c, a                                     ; $679C: $4F
    ld   b, $00                                   ; $679D: $06 $00
    ld   hl, wRoomObjects                         ; $679F: $21 $11 $D7
    ld   a, h                                     ; $67A2: $7C
    add  hl, bc                                   ; $67A3: $09
    ld   h, a                                     ; $67A4: $67
    ld   a, c                                     ; $67A5: $79
    ldh  [hIndexOfObjectBelowLink], a             ; $67A6: $E0 $E9
    ld   a, [hl]                                  ; $67A8: $7E
    ldh  [hObjectUnderEntity], a                  ; $67A9: $E0 $AF
    ld   e, a                                     ; $67AB: $5F
    cp   $BB                                      ; $67AC: $FE $BB
    jr   c, jr_003_6828                           ; $67AE: $38 $78

    cp   $BF                                      ; $67B0: $FE $BF
    jr   nc, jr_003_6828                          ; $67B2: $30 $74

    ld   a, [wIsIndoor]                           ; $67B4: $FA $A5 $DB
    and  a                                        ; $67B7: $A7
    jr   nz, jr_003_6828                          ; $67B8: $20 $6E

    ld   a, JINGLE_PUZZLE_SOLVED                  ; $67BA: $3E $02
    ldh  [hJingle], a                             ; $67BC: $E0 $F2
    ldh  a, [hSwordIntersectedAreaY]              ; $67BE: $F0 $CD
    and  $E0                                      ; $67C0: $E6 $E0
    ldh  [hSwordIntersectedAreaY], a              ; $67C2: $E0 $CD
    ldh  a, [hSwordIntersectedAreaX]              ; $67C4: $F0 $CE
    and  $E0                                      ; $67C6: $E6 $E0
    ldh  [hSwordIntersectedAreaX], a              ; $67C8: $E0 $CE
    ld   a, $03                                   ; $67CA: $3E $03
    call func_036_705A_trampoline                 ; $67CC: $CD $A7 $0A
    ld   a, c                                     ; $67CF: $79
    and  $EE                                      ; $67D0: $E6 $EE
    ld   c, a                                     ; $67D2: $4F
    ld   hl, wRoomObjects                         ; $67D3: $21 $11 $D7
    add  hl, bc                                   ; $67D6: $09
    ld   a, $09                                   ; $67D7: $3E $09
    ld   [hl+], a                                 ; $67D9: $22
    ld   [hl-], a                                 ; $67DA: $32
    ld   a, $83                                   ; $67DB: $3E $83
    call func_2BF                                 ; $67DD: $CD $2F $0B
    inc  hl                                       ; $67E0: $23
    ld   a, $83                                   ; $67E1: $3E $83
    call func_2BF                                 ; $67E3: $CD $2F $0B
    dec  hl                                       ; $67E6: $2B
    ld   a, l                                     ; $67E7: $7D
    add  $10                                      ; $67E8: $C6 $10
    ld   l, a                                     ; $67EA: $6F
    ld   a, $09                                   ; $67EB: $3E $09
    ld   [hl+], a                                 ; $67ED: $22
    ld   [hl], a                                  ; $67EE: $77
    ld   [$DDD8], a                               ; $67EF: $EA $D8 $DD
    ld   a, $83                                   ; $67F2: $3E $83
    call func_2BF                                 ; $67F4: $CD $2F $0B
    dec  hl                                       ; $67F7: $2B
    ld   a, $83                                   ; $67F8: $3E $83
    call func_2BF                                 ; $67FA: $CD $2F $0B
    inc  hl                                       ; $67FD: $23
    ld   c, $03                                   ; $67FE: $0E $03
    ld   b, $00                                   ; $6800: $06 $00

jr_003_6802:
    call func_003_6822                            ; $6802: $CD $22 $68
    ld   hl, Data_003_6769                        ; $6805: $21 $69 $67
    add  hl, bc                                   ; $6808: $09
    ld   a, [hl]                                  ; $6809: $7E
    ld   hl, hSwordIntersectedAreaX               ; $680A: $21 $CE $FF
    add  [hl]                                     ; $680D: $86
    ld   [hl], a                                  ; $680E: $77
    ld   hl, Data_003_676D                        ; $680F: $21 $6D $67
    add  hl, bc                                   ; $6812: $09
    ld   a, [hl]                                  ; $6813: $7E
    ld   hl, hSwordIntersectedAreaY               ; $6814: $21 $CD $FF
    add  [hl]                                     ; $6817: $86
    ld   [hl], a                                  ; $6818: $77
    dec  c                                        ; $6819: $0D
    ld   a, c                                     ; $681A: $79
    cp   $FF                                      ; $681B: $FE $FF
    jr   nz, jr_003_6802                          ; $681D: $20 $E3

    jp   label_003_68E4                           ; $681F: $C3 $E4 $68

func_003_6822::
    ld   de, Data_003_6761                        ; $6822: $11 $61 $67
    jp   jr_003_6865                              ; $6825: $C3 $65 $68

jr_003_6828:
    ld   a, [wIsIndoor]                           ; $6828: $FA $A5 $DB
    ld   d, a                                     ; $682B: $57
    call GetObjectPhysicsFlags_trampoline         ; $682C: $CD $26 $2A
    sub  $99                                      ; $682F: $D6 $99
    jp   c, label_003_68E4                        ; $6831: $DA $E4 $68

    cp   $04                                      ; $6834: $FE $04
    jp   nc, label_003_68E4                       ; $6836: $D2 $E4 $68

    ld   c, a                                     ; $6839: $4F
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $683A: $3E $02
    ldh  [hJingle], a                             ; $683C: $E0 $F2
    ld   a, [wIsIndoor]                           ; $683E: $FA $A5 $DB
    and  a                                        ; $6841: $A7
    jr   nz, jr_003_6878                          ; $6842: $20 $34

    pop  bc                                       ; $6844: $C1
    ldh  a, [hIndexOfObjectBelowLink]             ; $6845: $F0 $E9
    ld   e, a                                     ; $6847: $5F
    ld   d, b                                     ; $6848: $50
    ld   hl, wRoomObjects                         ; $6849: $21 $11 $D7
    add  hl, de                                   ; $684C: $19
    ld   a, $E1                                   ; $684D: $3E $E1
    ld   [hl], a                                  ; $684F: $77
    ld   [$DDD8], a                               ; $6850: $EA $D8 $DD
    ld   a, $83                                   ; $6853: $3E $83
    call func_2BF                                 ; $6855: $CD $2F $0B
    ldh  a, [hIsGBC]                              ; $6858: $F0 $FE
    and  a                                        ; $685A: $A7
    jr   z, jr_003_6862                           ; $685B: $28 $05

    ld   de, Data_003_6751                        ; $685D: $11 $51 $67
    jr   jr_003_6865                              ; $6860: $18 $03

jr_003_6862:
    ld   de, Data_003_674D                        ; $6862: $11 $4D $67

jr_003_6865:
    push de                                       ; $6865: $D5
    ld   hl, wOverworldRoomStatus                 ; $6866: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $6869: $F0 $F6
    ld   e, a                                     ; $686B: $5F
    ld   d, $00                                   ; $686C: $16 $00
    add  hl, de                                   ; $686E: $19
    ld   a, [hl]                                  ; $686F: $7E
    or   $04                                      ; $6870: $F6 $04
    ld   [hl], a                                  ; $6872: $77
    ldh  [hRoomStatus], a                         ; $6873: $E0 $F8
    jp   label_003_51F5                           ; $6875: $C3 $F5 $51

jr_003_6878:
    ld   hl, wIndoorARoomStatus                   ; $6878: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $687B: $F0 $F6
    ld   e, a                                     ; $687D: $5F
    ld   d, $00                                   ; $687E: $16 $00
    ldh  a, [hMapId]                              ; $6880: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $6882: $FE $FF
    jr   nz, jr_003_688B                          ; $6884: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6886: $21 $E0 $DD
    jr   jr_003_6894                              ; $6889: $18 $09

jr_003_688B:
    cp   $1A                                      ; $688B: $FE $1A
    jr   nc, jr_003_6894                          ; $688D: $30 $05

    cp   $06                                      ; $688F: $FE $06
    jr   c, jr_003_6894                           ; $6891: $38 $01

    inc  d                                        ; $6893: $14

jr_003_6894:
    add  hl, de                                   ; $6894: $19
    ld   e, l                                     ; $6895: $5D
    ld   d, h                                     ; $6896: $54
    ld   hl, Data_003_6755                        ; $6897: $21 $55 $67
    add  hl, bc                                   ; $689A: $09
    ld   a, [de]                                  ; $689B: $1A
    or   [hl]                                     ; $689C: $B6
    ld   [de], a                                  ; $689D: $12
    ldh  [hRoomStatus], a                         ; $689E: $E0 $F8
    ld   hl, Data_003_675D                        ; $68A0: $21 $5D $67
    add  hl, bc                                   ; $68A3: $09
    ld   a, [wIndoorRoom]                         ; $68A4: $FA $AE $DB
    add  [hl]                                     ; $68A7: $86
    ld   e, a                                     ; $68A8: $5F
    ld   d, $00                                   ; $68A9: $16 $00
    call label_2BC1                               ; $68AB: $CD $C1 $2B
    ld   e, l                                     ; $68AE: $5D
    ld   d, h                                     ; $68AF: $54
    ld   hl, Data_003_6759                        ; $68B0: $21 $59 $67
    add  hl, bc                                   ; $68B3: $09
    ld   a, [de]                                  ; $68B4: $1A
    or   [hl]                                     ; $68B5: $B6
    ld   [de], a                                  ; $68B6: $12
    ldh  a, [hSwordIntersectedAreaX]              ; $68B7: $F0 $CE
    swap a                                        ; $68B9: $CB $37
    and  $0F                                      ; $68BB: $E6 $0F
    ld   e, a                                     ; $68BD: $5F

jr_003_68BE:
    ldh  a, [hSwordIntersectedAreaY]              ; $68BE: $F0 $CD
    and  $F0                                      ; $68C0: $E6 $F0
    or   e                                        ; $68C2: $B3
    ld   e, a                                     ; $68C3: $5F
    ld   d, $00                                   ; $68C4: $16 $00
    ld   hl, wRoomObjects                         ; $68C6: $21 $11 $D7
    add  hl, de                                   ; $68C9: $19
    ld   e, l                                     ; $68CA: $5D
    ld   d, h                                     ; $68CB: $54
    ld   hl, Data_003_6739                        ; $68CC: $21 $39 $67
    add  hl, bc                                   ; $68CF: $09
    ld   a, [hl]                                  ; $68D0: $7E
    ld   [de], a                                  ; $68D1: $12
    ld   [$DDD8], a                               ; $68D2: $EA $D8 $DD
    ld   a, c                                     ; $68D5: $79
    and  $02                                      ; $68D6: $E6 $02
    rla                                           ; $68D8: $17
    rla                                           ; $68D9: $17
    ld   c, a                                     ; $68DA: $4F
    ld   hl, Data_003_673D                        ; $68DB: $21 $3D $67
    add  hl, bc                                   ; $68DE: $09
    pop  bc                                       ; $68DF: $C1
    push hl                                       ; $68E0: $E5
    jp   label_003_51F5                           ; $68E1: $C3 $F5 $51

label_003_68E4:
    pop  bc                                       ; $68E4: $C1

label_003_68E5:
    ret                                           ; $68E5: $C9

Data_003_68E6::
    db   $F8, $08, $18, $F8, $08, $18, $F8, $08   ; $68E6
    db   $18                                      ; $68EE

Data_003_68EF::
    db   $F8, $F8, $F8, $08, $08, $08, $18        ; $68EF
    db   $18, $18                                 ; $68F6

func_003_68F8::
    push bc                                       ; $68F8: $C5
    ld   hl, Data_003_68E6                        ; $68F9: $21 $E6 $68
    add  hl, de                                   ; $68FC: $19
    ldh  a, [hActiveEntityPosX]                   ; $68FD: $F0 $EE
    add  [hl]                                     ; $68FF: $86
    sub  $08                                      ; $6900: $D6 $08
    and  $F0                                      ; $6902: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $6904: $E0 $CE
    swap a                                        ; $6906: $CB $37
    ld   c, a                                     ; $6908: $4F
    ld   hl, Data_003_68EF                        ; $6909: $21 $EF $68
    add  hl, de                                   ; $690C: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $690D: $F0 $EC

    add  [hl]                                     ; $690F: $86
    sub  $10                                      ; $6910: $D6 $10
    and  $F0                                      ; $6912: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $6914: $E0 $CD
    or   c                                        ; $6916: $B1
    ld   e, a                                     ; $6917: $5F
    ld   hl, wRoomObjects                         ; $6918: $21 $11 $D7
    add  hl, de                                   ; $691B: $19
    ld   a, h                                     ; $691C: $7C
    cp   $D7                                      ; $691D: $FE $D7
    jp   nz, .return                              ; $691F: $C2 $A0 $69

    ld   a, [wIsIndoor]                           ; $6922: $FA $A5 $DB
    and  a                                        ; $6925: $A7
    ld   a, [hl]                                  ; $6926: $7E
    ldh  [hObjectUnderEntity], a                  ; $6927: $E0 $AF
    jr   nz, .jr_003_693C                         ; $6929: $20 $11

    ldh  [hFFE9], a                               ; $692B: $E0 $E9
    cp   $0A                                      ; $692D: $FE $0A
    jr   z, .jr_003_6964                          ; $692F: $28 $33

    cp   $D3                                      ; $6931: $FE $D3
    jr   z, .jr_003_6964                          ; $6933: $28 $2F

    cp   $5C                                      ; $6935: $FE $5C
    jr   z, .jr_003_6964                          ; $6937: $28 $2B

    jp   .return                                  ; $6939: $C3 $A0 $69

.jr_003_693C
    cp   $A9                                      ; $693C: $FE $A9
    jp   nz, .return                              ; $693E: $C2 $A0 $69

    ld   hl, wIndoorARoomStatus                   ; $6941: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6944: $F0 $F6
    ld   c, a                                     ; $6946: $4F
    ld   b, $00                                   ; $6947: $06 $00
    ldh  a, [hMapId]                              ; $6949: $F0 $F7
    cp   $FF                                      ; $694B: $FE $FF
    jr   nz, .jr_003_6954                         ; $694D: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $694F: $21 $E0 $DD
    jr   .jr_003_695D                             ; $6952: $18 $09

.jr_003_6954
    cp   $1A                                      ; $6954: $FE $1A
    jr   nc, .jr_003_695D                         ; $6956: $30 $05

    cp   $06                                      ; $6958: $FE $06
    jr   c, .jr_003_695D                          ; $695A: $38 $01

    inc  b                                        ; $695C: $04

.jr_003_695D
    add  hl, bc                                   ; $695D: $09
    ld   a, [hl]                                  ; $695E: $7E
    or   $40                                      ; $695F: $F6 $40
    ld   [hl], a                                  ; $6961: $77
    ldh  [hRoomStatus], a                         ; $6962: $E0 $F8

.jr_003_6964
    call func_014_5526_trampoline                 ; $6964: $CD $78 $21

    ld   a, ENTITY_ENTITY_LIFTABLE_ROCK           ; $6967: $3E $05
    call SpawnNewEntity                           ; $6969: $CD $CA $64
    jr   c, .return                               ; $696C: $38 $32

    xor  a                                        ; $696E: $AF
    ld   [$C19B], a                               ; $696F: $EA $9B $C1
    ld   hl, wEntitiesPosXTable                         ; $6972: $21 $00 $C2
    add  hl, de                                   ; $6975: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $6976: $F0 $CE
    add  $08                                      ; $6978: $C6 $08
    ld   [hl], a                                  ; $697A: $77
    ld   hl, wEntitiesPosYTable                         ; $697B: $21 $10 $C2
    add  hl, de                                   ; $697E: $19
    ldh  a, [hSwordIntersectedAreaY]              ; $697F: $F0 $CD
    add  $10                                      ; $6981: $C6 $10
    ld   [hl], a                                  ; $6983: $77
    ld   hl, wEntitiesSpriteVariantTable               ; $6984: $21 $B0 $C3
    add  hl, de                                   ; $6987: $19
    ld   a, [wIsIndoor]                           ; $6988: $FA $A5 $DB
    xor  $01                                      ; $698B: $EE $01
    ld   [hl], a                                  ; $698D: $77
    ldh  [hActiveEntitySpriteVariant], a               ; $698E: $E0 $F1
    ldh  a, [hFFE9]                               ; $6990: $F0 $E9
    cp   $0A                                      ; $6992: $FE $0A
    jr   nz, .jr_003_699B                         ; $6994: $20 $05

    ld   a, $FF                                   ; $6996: $3E $FF
    ld   [hl], a                                  ; $6998: $77
    ldh  [hActiveEntitySpriteVariant], a               ; $6999: $E0 $F1

.jr_003_699B
    ld   c, e                                     ; $699B: $4B
    ld   b, d                                     ; $699C: $42
    call func_003_53E4                            ; $699D: $CD $E4 $53

.return
    pop  bc                                       ; $69A0: $C1
    ret                                           ; $69A1: $C9

Data_003_69A2::
    db   $6C, $74, $6D, $75, $00, $00, $00, $00   ; $69A2

include "code/entities/hookshot_hit.asm"


Data_003_6A1E::
    db   $6C, $01, $6C, $21, $5C, $01, $5C, $21

OctorockRockEntityHandler::
    call GetEntityTransitionCountdown             ; $6A26: $CD $05 $0C
    jr   nz, jr_003_6A2E                          ; $6A29: $20 $03

    call CheckLinkCollisionWithProjectile         ; $6A2B: $CD $DE $6B

jr_003_6A2E:
    ld   de, Data_003_6A1E                        ; $6A2E: $11 $1E $6A
    jp   func_003_6AD7                            ; $6A31: $C3 $D7 $6A

include "code/entities/arrow.asm"

Data_003_6A66::
    db   $80, $15

Data_003_6A68::
    db   $04, $FC, $00, $00

Data_003_6A6C::
    db   $FE, $FE, $FA, $04

func_003_6A70::
    call GetEntityTransitionCountdown             ; $6A70: $CD $05 $0C
    jr   z, jr_003_6A96                           ; $6A73: $28 $21

    ld   a, ENTITY_BOMB                           ; $6A75: $3E $02
    call SpawnNewEntity                           ; $6A77: $CD $CA $64
    jr   c, jr_003_6A93                           ; $6A7A: $38 $17

    ldh  a, [hScratch0]                           ; $6A7C: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $6A7E: $21 $00 $C2
    add  hl, de                                   ; $6A81: $19
    ld   [hl], a                                  ; $6A82: $77
    ldh  a, [hScratch1]                           ; $6A83: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $6A85: $21 $10 $C2
    add  hl, de                                   ; $6A88: $19
    ld   [hl], a                                  ; $6A89: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $6A8A: $21 $E0 $C2
    add  hl, de                                   ; $6A8D: $19
    ld   [hl], $17                                ; $6A8E: $36 $17
    call PlayBombExplosionSfx                     ; $6A90: $CD $4B $0C

jr_003_6A93:
    jp   UnloadEntityAndReturn                    ; $6A93: $C3 $8D $3F

jr_003_6A96:
    ldh  a, [hActiveEntitySpriteVariant]          ; $6A96: $F0 $F1
    push af                                       ; $6A98: $F5
    ld   e, a                                     ; $6A99: $5F
    ld   d, b                                     ; $6A9A: $50
    xor  a                                        ; $6A9B: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $6A9C: $E0 $F1
    ld   hl, Data_003_6A68                        ; $6A9E: $21 $68 $6A
    add  hl, de                                   ; $6AA1: $19
    ldh  a, [hActiveEntityPosX]                   ; $6AA2: $F0 $EE
    add  [hl]                                     ; $6AA4: $86
    ldh  [hActiveEntityPosX], a                   ; $6AA5: $E0 $EE
    ld   hl, Data_003_6A6C                        ; $6AA7: $21 $6C $6A
    add  hl, de                                   ; $6AAA: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $6AAB: $F0 $EC
    add  [hl]                                     ; $6AAD: $86
    ldh  [hActiveEntityVisualPosY], a             ; $6AAE: $E0 $EC
    ld   de, Data_003_6A66                        ; $6AB0: $11 $66 $6A
    call RenderActiveEntitySprite                 ; $6AB3: $CD $77 $3C
    call CopyEntityPositionToActivePosition       ; $6AB6: $CD $8A $3D
    pop  af                                       ; $6AB9: $F1
    ldh  [hActiveEntitySpriteVariant], a          ; $6ABA: $E0 $F1
    ld   de, Data_003_6BC6                        ; $6ABC: $11 $C6 $6B
    call RenderActiveEntitySpritesPair            ; $6ABF: $CD $C0 $3B
    ld   a, $0C                                   ; $6AC2: $3E $0C
    ld   [$C19E], a                               ; $6AC4: $EA $9E $C1
    call func_003_75A2                            ; $6AC7: $CD $A2 $75
    jr   jr_003_6ADA                              ; $6ACA: $18 $0E

MoblinArrowEntityHandler::
    call GetEntityTransitionCountdown             ; $6ACC: $CD $05 $0C
    jr   nz, func_003_6AD4                        ; $6ACF: $20 $03

    call CheckLinkCollisionWithProjectile         ; $6AD1: $CD $DE $6B

func_003_6AD4::
    ld   de, Data_003_6BC6                        ; $6AD4: $11 $C6 $6B

func_003_6AD7::
    call RenderActiveEntitySpritesPair            ; $6AD7: $CD $C0 $3B

jr_003_6ADA:
    call func_003_7F78                            ; $6ADA: $CD $78 $7F
    call GetEntityTransitionCountdown             ; $6ADD: $CD $05 $0C
    jr   nz, @+$6C                                ; $6AE0: $20 $6A

    call func_003_7F25                            ; $6AE2: $CD $25 $7F
    call ApplySwordIntersectionWithObjects        ; $6AE5: $CD $AB $7C
    ld   hl, wEntitiesCollisionsTable             ; $6AE8: $21 $A0 $C2
    add  hl, bc                                   ; $6AEB: $09
    ld   a, [hl]                                  ; $6AEC: $7E
    and  a                                        ; $6AED: $A7
    jr   z, jr_003_6B42                           ; $6AEE: $28 $52

    call GetEntityTransitionCountdown             ; $6AF0: $CD $05 $0C

    ldh  a, [hActiveEntityType]                   ; $6AF3: $F0 $EB
    cp   ENTITY_HOOKSHOT_HIT                      ; $6AF5: $FE $04
    jr   nz, .hookshotHitEnd                      ; $6AF7: $20 $06

    call GetEntityPrivateCountdown1               ; $6AF9: $CD $00 $0C
    ld   [hl], $30                                ; $6AFC: $36 $30
    ret                                           ; $6AFE: $C9
.hookshotHitEnd

    ld   [hl], $18                                ; $6AFF: $36 $18
    ld   hl, wEntitiesSpeedZTable                 ; $6B01: $21 $20 $C3
    add  hl, bc                                   ; $6B04: $09
    ld   [hl], $10                                ; $6B05: $36 $10
    ld   hl, wEntitiesCollisionsTable             ; $6B07: $21 $A0 $C2
    add  hl, bc                                   ; $6B0A: $09
    ld   a, [hl]                                  ; $6B0B: $7E
    inc  a                                        ; $6B0C: $3C
    jr   z, jr_003_6B13                           ; $6B0D: $28 $04

    ld   a, JINGLE_SWORD_POKING                   ; $6B0F: $3E $07
    ldh  [hJingle], a                             ; $6B11: $E0 $F2

jr_003_6B13:
    call func_C50                                 ; $6B13: $CD $50 $0C

    ldh  a, [hActiveEntityType]                   ; $6B16: $F0 $EB
    cp   ENTITY_ARROW                             ; $6B18: $FE $00
    jr   nz, jr_003_6B31                          ; $6B1A: $20 $15

    call func_003_6B2C                            ; $6B1C: $CD $2C $6B
    ld   hl, wEntitiesSpeedXTable                 ; $6B1F: $21 $40 $C2

jr_003_6B22:
    add  hl, bc                                   ; $6B22: $09
    ld   a, [hl]                                  ; $6B23: $7E
    cpl                                           ; $6B24: $2F
    inc  a                                        ; $6B25: $3C
    sra  a                                        ; $6B26: $CB $2F
    sra  a                                        ; $6B28: $CB $2F
    ld   [hl], a                                  ; $6B2A: $77
    ret                                           ; $6B2B: $C9

func_003_6B2C::
    ld   hl, wEntitiesSpeedYTable                 ; $6B2C: $21 $50 $C2
    jr   jr_003_6B22                              ; $6B2F: $18 $F1

jr_003_6B31:
    call func_003_6B43                            ; $6B31: $CD $43 $6B

func_003_6B34::
    ld   hl, wEntitiesSpeedXTable                 ; $6B34: $21 $40 $C2

jr_003_6B37:
    add  hl, bc                                   ; $6B37: $09
    ld   a, [hl]                                  ; $6B38: $7E
    cpl                                           ; $6B39: $2F
    inc  a                                        ; $6B3A: $3C
    sra  a                                        ; $6B3B: $CB $2F
    sra  a                                        ; $6B3D: $CB $2F
    sra  a                                        ; $6B3F: $CB $2F
    ld   [hl], a                                  ; $6B41: $77

jr_003_6B42:
    ret                                           ; $6B42: $C9

func_003_6B43::
    ld   hl, wEntitiesSpeedYTable                 ; $6B43: $21 $50 $C2
    jr   jr_003_6B37                              ; $6B46: $18 $EF

Data_003_6B48::
    db   $00, $03, $01, $02

func_003_6B48:
    cp   $01                                      ; $6B4C: $FE $01
    jr   nz, jr_003_6B53                          ; $6B4E: $20 $03
    jp   UnloadEntityAndReturn                    ; $6B50: $C3 $8D $3F

jr_003_6B53:
    ldh  a, [hActiveEntityType]                   ; $6B53: $F0 $EB
    cp   ENTITY_OCTOROCK_ROCK                     ; $6B55: $FE $0A
    jr   z, .octorockRockEnd                      ; $6B57: $28 $15

    call GetEntityTransitionCountdown             ; $6B59: $CD $05 $0C
    srl  a                                        ; $6B5C: $CB $3F
    srl  a                                        ; $6B5E: $CB $3F
    srl  a                                        ; $6B60: $CB $3F
    and  $03                                      ; $6B62: $E6 $03
    ld   e, a                                     ; $6B64: $5F
    ld   d, b                                     ; $6B65: $50
    ld   hl, Data_003_6B48                        ; $6B66: $21 $48 $6B
    add  hl, de                                   ; $6B69: $19
    ld   a, [hl]                                  ; $6B6A: $7E
    call SetEntitySpriteVariant                   ; $6B6B: $CD $0C $3B
.octorockRockEnd

    call func_003_7F25                            ; $6B6E: $CD $25 $7F
    jr   func_003_6B7B                            ; $6B71: $18 $08

Data_003_6B73::
    db   $02, $01, $02, $02

Data_003_6B77::
    db   $40, $08, $40, $40

func_003_6B7B::
    ldh  a, [hIsSideScrolling]                    ; $6B7B: $F0 $F9
    and  a                                        ; $6B7D: $A7
    jr   nz, jr_003_6B8C                          ; $6B7E: $20 $0C

    call func_003_7F5E                            ; $6B80: $CD $5E $7F
    ld   hl, wEntitiesSpeedZTable                 ; $6B83: $21 $20 $C3
    add  hl, bc                                   ; $6B86: $09
    ld   a, [hl]                                  ; $6B87: $7E
    sub  $02                                      ; $6B88: $D6 $02
    ld   [hl], a                                  ; $6B8A: $77
    ret                                           ; $6B8B: $C9

jr_003_6B8C:
    ld   hl, wEntitiesUnknowTableI                ; $6B8C: $21 $70 $C4
    add  hl, bc                                   ; $6B8F: $09
    ld   a, [hl]                                  ; $6B90: $7E
    ld   e, a                                     ; $6B91: $5F
    ld   d, b                                     ; $6B92: $50
    and  a                                        ; $6B93: $A7
    jr   z, jr_003_6BAB                           ; $6B94: $28 $15

    ldh  a, [hFrameCounter]                       ; $6B96: $F0 $E7
    and  $07                                      ; $6B98: $E6 $07
    jr   nz, jr_003_6BAB                          ; $6B9A: $20 $0F

    ld   hl, wEntitiesSpeedXTable                 ; $6B9C: $21 $40 $C2
    add  hl, bc                                   ; $6B9F: $09
    ld   a, [hl]                                  ; $6BA0: $7E
    and  a                                        ; $6BA1: $A7
    jr   z, jr_003_6BAB                           ; $6BA2: $28 $07

    and  $80                                      ; $6BA4: $E6 $80
    jr   z, jr_003_6BAA                           ; $6BA6: $28 $02

    inc  [hl]                                     ; $6BA8: $34
    inc  [hl]                                     ; $6BA9: $34

jr_003_6BAA:
    dec  [hl]                                     ; $6BAA: $35

jr_003_6BAB:
    ld   hl, Data_003_6B73                        ; $6BAB: $21 $73 $6B
    add  hl, de                                   ; $6BAE: $19
    ld   a, [hl]                                  ; $6BAF: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6BB0: $21 $50 $C2
    add  hl, bc                                   ; $6BB3: $09
    add  [hl]                                     ; $6BB4: $86
    ld   [hl], a                                  ; $6BB5: $77
    ld   hl, Data_003_6B77                        ; $6BB6: $21 $77 $6B
    add  hl, de                                   ; $6BB9: $19
    sub  [hl]                                     ; $6BBA: $96
    and  $80                                      ; $6BBB: $E6 $80
    jr   nz, jr_003_6BC5                          ; $6BBD: $20 $06

    ld   a, [hl]                                  ; $6BBF: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6BC0: $21 $50 $C2
    add  hl, bc                                   ; $6BC3: $09
    ld   [hl], a                                  ; $6BC4: $77

jr_003_6BC5:
    ret                                           ; $6BC5: $C9

Data_003_6BC6::
    db   $2E, $21, $2C, $21, $2C, $01, $2E, $01, $2A, $41, $2A, $61, $2A, $01, $2A, $21

; For a given direction, get the opposite direction
ReversedDirectionsTable::
._right db DIRECTION_LEFT
._left  db DIRECTION_RIGHT
._up    db DIRECTION_DOWN
._down  db DIRECTION_UP

; Array indexed by Link direction
Data_003_6BDA::
._00 db $02
._01 db $0A
._02 db $0E
._03 db $06

; Check the collision of the active entity (an enemy projectile) with Link.
; If the entity is collisioning, handle whether Link has its shield up or not.
CheckLinkCollisionWithProjectile::
    ; If Link is not interactive or swimming, return.
    ld   a, [wLinkMotionState]                    ; $6BDE: $FA $1C $C1
    cp   LINK_MOTION_JUMPING                      ; $6BE1: $FE $02
    jr   nc, .return                              ; $6BE3: $30 $75

    ; If Link is in the air, return.
    ldh  a, [hLinkPositionZ]                      ; $6BE5: $F0 $A2
    and  a                                        ; $6BE7: $A7
    jr   nz, .return                              ; $6BE8: $20 $70

    ; If Link is not touching the entity, return.
    ld   hl, hActiveEntityPosX                    ; $6BEA: $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ; $6BED: $F0 $98
    sub  [hl]                                     ; $6BEF: $96
    add  $06                                      ; $6BF0: $C6 $06
    cp   $0C                                      ; $6BF2: $FE $0C
    jr   nc, .return                              ; $6BF4: $30 $64

    ld   hl, hActiveEntityVisualPosY              ; $6BF6: $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ; $6BF9: $F0 $99
    sub  [hl]                                     ; $6BFB: $96
    add  $06                                      ; $6BFC: $C6 $06
    cp   $0C                                      ; $6BFE: $FE $0C
    jr   nc, .return                              ; $6C00: $30 $58

    ;
    ; Check shield usage
    ;

    ld   a, [wIsUsingShield]                      ; $6C02: $FA $5B $C1
    and  a                                        ; $6C05: $A7
    jr   z, .shieldEnd                            ; $6C06: $28 $53

    ; Special case: laser beam against mirror shield

    ldh  a, [hActiveEntityType]                   ; $6C08: $F0 $EB
    cp   ENTITY_LASER_BEAM                        ; $6C0A: $FE $2B
    jr   nz, .laserBeamEnd                        ; $6C0C: $20 $33

    ld   a, [wShieldLevel]                        ; $6C0E: $FA $44 $DB
    cp   $02                                      ; $6C11: $FE $02
    jr   c, .shieldEnd                            ; $6C13: $38 $46

    ldh  a, [hLinkDirection]                      ; $6C15: $F0 $9E
    ld   e, a                                     ; $6C17: $5F
    ld   d, b                                     ; $6C18: $50
    ld   hl, Data_003_6BDA                        ; $6C19: $21 $DA $6B
    add  hl, de                                   ; $6C1C: $19
    ld   e, [hl]                                  ; $6C1D: $5E
    ld   hl, wEntitiesDirectionTable              ; $6C1E: $21 $80 $C3
    add  hl, bc                                   ; $6C21: $09
    ld   a, [hl]                                  ; $6C22: $7E
    sub  e                                        ; $6C23: $93
    and  $0F                                      ; $6C24: $E6 $0F
    cp   $05                                      ; $6C26: $FE $05
    jr   nc, .shieldEnd                           ; $6C28: $30 $31

    ld   hl, wEntitiesCollisionsTable             ; $6C2A: $21 $A0 $C2
    add  hl, bc                                   ; $6C2D: $09
    ld   [hl], $02                                ; $6C2E: $36 $02

    ld   a, JINGLE_SWORD_POKING                   ; $6C30: $3E $07
    ldh  [hJingle], a                             ; $6C32: $E0 $F2

    ldh  a, [hActiveEntityPosY]                   ; $6C34: $F0 $EF
.func_003_6C36
    ldh  [hScratch1], a                           ; $6C36: $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ; $6C38: $F0 $EE
    ldh  [hScratch0], a                           ; $6C3A: $E0 $D7
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $6C3C: $3E $05
    jp   AddTranscientVfx                         ; $6C3E: $C3 $C7 $0C

.laserBeamEnd

    ; If the entity is in a direction opposite to Link's direction…
    ld   hl, wEntitiesDirectionTable              ; $6C41: $21 $80 $C3
    add  hl, bc                                   ; $6C44: $09
    ld   e, [hl]                                  ; $6C45: $5E
    ld   d, b                                     ; $6C46: $50
    ld   hl, ReversedDirectionsTable              ; $6C47: $21 $D6 $6B
    add  hl, de                                   ; $6C4A: $19
    ldh  a, [hLinkDirection]                      ; $6C4B: $F0 $9E
    cp   [hl]                                     ; $6C4D: $BE
    jr   nz, .shieldEnd                           ; $6C4E: $20 $0B

    ; Play the "a projectile hits the shield" sound
    ld   a, JINGLE_SHIELD_TING                    ; $6C50: $3E $16
    ldh  [hJingle], a                             ; $6C52: $E0 $F2

.jr_003_6C54
    ld   hl, wEntitiesCollisionsTable             ; $6C54: $21 $A0 $C2
    add  hl, bc                                   ; $6C57: $09
    ld   [hl], $FF                                ; $6C58: $36 $FF

.return
    ret                                           ; $6C5A: $C9

.shieldEnd
    ; Does a lot of stuff!
    call func_003_6CC0                            ; $6C5B: $CD $C0 $6C

    ldh  a, [hActiveEntityType]                   ; $6C5E: $F0 $EB
    cp   ENTITY_LASER_BEAM                        ; $6C60: $FE $2B
    jr   z, .jr_003_6C68                          ; $6C62: $28 $04

    cp   ENTITY_MOBLIN_ARROW                      ; $6C64: $FE $0C
    jr   nz, .jr_003_6C54                         ; $6C66: $20 $EC

.jr_003_6C68
    jp   UnloadEntityAndReturn                    ; $6C68: $C3 $8D $3F

func_003_6C6B::
    ldh  a, [hFrameCounter]                       ; $6C6B: $F0 $E7
    xor  c                                        ; $6C6D: $A9
    rra                                           ; $6C6E: $1F
    jp   nc, jr_003_6CCB                          ; $6C6F: $D2 $CB $6C

; Check if Link is collisioning with an enemy entity.
; If so, apply eventual damages.
;
; Inputs:
;   bc  entity index
CheckLinkCollisionWithEnemy::
    ; If Link is in the air, skip the collision check
    ldh  a, [hLinkPositionZ]                      ; $6C72: $F0 $A2
    and  a                                        ; $6C74: $A7
    jr   nz, CheckLinkCollisionWithProjectile.return; $6C75: $20 $E3

.collisionEvenInTheAir
    ; If Link is not interactive or swimming…
    ld   a, [wLinkMotionState]                    ; $6C77: $FA $1C $C1
    cp   LINK_MOTION_JUMPING                      ; $6C7A: $FE $02
    ; … return.
    jr   nc, CheckLinkCollisionWithProjectile.return; $6C7C: $30 $DC

    push bc                                       ; $6C7E: $C5
    ; c = (entity index * 4)
    sla  c                                        ; $6C7F: $CB $21
    sla  c                                        ; $6C81: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $6C83: $21 $80 $D5
    add  hl, bc                                   ; $6C86: $09
    pop  bc                                       ; $6C87: $C1
    ; hActiveEntityPosX + wEntitiesHitboxPositionTable[c + 0]
    ldh  a, [hActiveEntityPosX]                   ; $6C88: $F0 $EE
    add  [hl]                                     ; $6C8A: $86
    push hl                                       ; $6C8B: $E5
    ld   hl, hLinkPositionX                       ; $6C8C: $21 $98 $FF
    sub  [hl]                                     ; $6C8F: $96
    sub  $08                                      ; $6C90: $D6 $08
    cp   $80                                      ; $6C92: $FE $80
    jr   c, jr_003_6C98                           ; $6C94: $38 $02

    cpl                                           ; $6C96: $2F
    inc  a                                        ; $6C97: $3C

jr_003_6C98:
    pop  hl                                       ; $6C98: $E1
    push af                                       ; $6C99: $F5
    inc  hl                                       ; $6C9A: $23
    ld   a, $04                                   ; $6C9B: $3E $04
    add  [hl]                                     ; $6C9D: $86
    ld   e, a                                     ; $6C9E: $5F
    pop  af                                       ; $6C9F: $F1
    cp   e                                        ; $6CA0: $BB
    jp   nc, jr_003_6CCB                          ; $6CA1: $D2 $CB $6C

    inc  hl                                       ; $6CA4: $23
    ldh  a, [hActiveEntityVisualPosY]             ; $6CA5: $F0 $EC
    add  [hl]                                     ; $6CA7: $86
    push hl                                       ; $6CA8: $E5
    ld   hl, hLinkPositionY                       ; $6CA9: $21 $99 $FF
    sub  [hl]                                     ; $6CAC: $96
    sub  $08                                      ; $6CAD: $D6 $08
    cp   $80                                      ; $6CAF: $FE $80
    jr   c, jr_003_6CB5                           ; $6CB1: $38 $02

    cpl                                           ; $6CB3: $2F
    inc  a                                        ; $6CB4: $3C

jr_003_6CB5:
    pop  hl                                       ; $6CB5: $E1
    push af                                       ; $6CB6: $F5
    inc  hl                                       ; $6CB7: $23
    ld   a, $04                                   ; $6CB8: $3E $04
    add  [hl]                                     ; $6CBA: $86
    ld   e, a                                     ; $6CBB: $5F
    pop  af                                       ; $6CBC: $F1
    cp   e                                        ; $6CBD: $BB
    jr   nc, jr_003_6CCB                          ; $6CBE: $30 $0B

func_003_6CC0::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6CC0: $21 $40 $C3
    add  hl, bc                                   ; $6CC3: $09
    ld   a, [hl]                                  ; $6CC4: $7E
    and  $80                                      ; $6CC5: $E6 $80
    jr   z, jr_003_6CCD                           ; $6CC7: $28 $04

jr_003_6CC9:
    scf                                           ; $6CC9: $37
    ret                                           ; $6CCA: $C9

jr_003_6CCB:
    and  a                                        ; $6CCB: $A7
    ret                                           ; $6CCC: $C9

jr_003_6CCD:
    ldh  a, [hLinkAnimationState]                 ; $6CCD: $F0 $9D
    sub  $4E                                      ; $6CCF: $D6 $4E
    cp   $02                                      ; $6CD1: $FE $02
    jr   c, jr_003_6CC9                           ; $6CD3: $38 $F4

; Handle collision between Link and the active entity.
; This will most of the case results in damages being applied to Link.
ApplyLinkCollisionWithEnemy::
    ;
    ; Special case when a cheep-cheep hurts Link
    ;

    ldh  a, [hActiveEntityType]                   ; $6CD5: $F0 $EB
    cp   ENTITY_CHEEP_CHEEP_JUMPING               ; $6CD7: $FE $AC
    jr   nz, .cheepCheepEnd                       ; $6CD9: $20 $1E

    call func_003_7EE9                            ; $6CDB: $CD $E9 $7E
    ld   a, e                                     ; $6CDE: $7B
    cp   $02                                      ; $6CDF: $FE $02
    jr   nz, .goombaEnd                          ; $6CE1: $20 $5A

    call IncrementEntityState                     ; $6CE3: $CD $12 $3B
    ld   [hl], ENTITY_STATUS_ACTIVE               ; $6CE6: $36 $05
    ld   a, $02                                   ; $6CE8: $3E $02
    ld   [$C146], a                               ; $6CEA: $EA $46 $C1
    ld   a, $F0                                   ; $6CED: $3E $F0
    ldh  [hLinkPositionYIncrement], a             ; $6CEF: $E0 $9B
    call ClearEntitySpeed                         ; $6CF1: $CD $7F $3D
    ld   a, $0E                                   ; $6CF4: $3E $0E
    ldh  [hWaveSfx], a                            ; $6CF6: $E0 $F3
    ret                                           ; $6CF8: $C9
.cheepCheepEnd

    ;
    ; Special case when a Goomba hurts Link
    ;

    ldh  a, [hActiveEntityType]                   ; $6CF9: $F0 $EB
    cp   ENTITY_GOOMBA                            ; $6CFB: $FE $9F
    jr   nz, .goombaEnd                           ; $6CFD: $20 $3E

    ld   a, [$C146]                               ; $6CFF: $FA $46 $C1
    and  a                                        ; $6D02: $A7
    jr   z, .goombaEnd                            ; $6D03: $28 $38

    ldh  a, [$FFB7]                               ; $6D05: $F0 $B7
    and  a                                        ; $6D07: $A7
    jr   nz, .jr_003_6D1B                         ; $6D08: $20 $11

    ldh  a, [hIsSideScrolling]                    ; $6D0A: $F0 $F9
    and  a                                        ; $6D0C: $A7
    jr   nz, .jr_003_6D15                         ; $6D0D: $20 $06

    ldh  a, [$FFA3]                               ; $6D0F: $F0 $A3
    xor  $80                                      ; $6D11: $EE $80
    jr   .jr_003_6D17                             ; $6D13: $18 $02

.jr_003_6D15
    ldh  a, [hLinkPositionYIncrement]             ; $6D15: $F0 $9B

.jr_003_6D17
    and  $80                                      ; $6D17: $E6 $80
    jr   nz, .goombaEnd                           ; $6D19: $20 $22

.jr_003_6D1B
    ld   a, $02                                   ; $6D1B: $3E $02
    ldh  [$FFB7], a                               ; $6D1D: $E0 $B7
    ld   hl, wEntitiesStateTable                  ; $6D1F: $21 $90 $C2
    add  hl, bc                                   ; $6D22: $09
    ld   [hl], $02                                ; $6D23: $36 $02
    call GetEntityTransitionCountdown             ; $6D25: $CD $05 $0C
    ld   [hl], $30                                ; $6D28: $36 $30
    ld   a, $0E                                   ; $6D2A: $3E $0E
    ldh  [hWaveSfx], a                            ; $6D2C: $E0 $F3
    ldh  a, [hIsSideScrolling]                    ; $6D2E: $F0 $F9
    and  a                                        ; $6D30: $A7
    jr   nz, .jr_003_6D38                         ; $6D31: $20 $05

    ld   a, $10                                   ; $6D33: $3E $10
    ldh  [$FFA3], a                               ; $6D35: $E0 $A3
    ret                                           ; $6D37: $C9

.jr_003_6D38
    ld   a, $F0                                   ; $6D38: $3E $F0
    ldh  [hLinkPositionYIncrement], a             ; $6D3A: $E0 $9B
    ret                                           ; $6D3C: $C9
.goombaEnd

    ;
    ; Special case when Link collisions with a Mini-Gel

    ldh  a, [hActiveEntityType]                   ; $6D3D: $F0 $EB
    cp   ENTITY_MINI_GEL                          ; $6D3F: $FE $1C
    jr   nz, .miniGelEnd                          ; $6D41: $20 $0B

    call GetEntityTransitionCountdown             ; $6D43: $CD $05 $0C
    ld   [hl], $80                                ; $6D46: $36 $80
    call IncrementEntityState                     ; $6D48: $CD $12 $3B
    ld   [hl], $04                                ; $6D4B: $36 $04
    ret                                           ; $6D4D: $C9
.miniGelEnd

    cp   ENTITY_CUE_BALL                          ; $6D4E: $FE $8E
    jr   z, jr_003_6D5D                           ; $6D50: $28 $0B

    cp   ENTITY_ROLLING_BONES_BAR                 ; $6D52: $FE $82
    jr   z, jr_003_6D5D                           ; $6D54: $28 $07

    ld   a, [$C13E]                               ; $6D56: $FA $3E $C1
    and  a                                        ; $6D59: $A7
    jp   nz, setCarryAndReturn                    ; $6D5A: $C2 $0A $6E

jr_003_6D5D:
    ldh  a, [hActiveEntityType]                   ; $6D5D: $F0 $EB
    cp   ENTITY_MOBLIN_KING                       ; $6D5F: $FE $E4
    jr   nz, jr_003_6D73                          ; $6D61: $20 $10

    ldh  a, [hActiveEntityState]                  ; $6D63: $F0 $F0
    cp   $04                                      ; $6D65: $FE $04
    jr   nz, jr_003_6D73                          ; $6D67: $20 $0A

    call IncrementEntityState                     ; $6D69: $CD $12 $3B
    ld   [hl], $08                                ; $6D6C: $36 $08
    ld   a, WAVE_SFX_LINK_HURT                    ; $6D6E: $3E $03
    ldh  [hWaveSfx], a                            ; $6D70: $E0 $F3
    ret                                           ; $6D72: $C9

jr_003_6D73:
    ld   a, [wInvincibilityCounter]               ; $6D73: $FA $C7 $DB
    ld   hl, $C1C6                                ; $6D76: $21 $C6 $C1
    or   [hl]                                     ; $6D79: $B6
    ld   hl, wLinkPlayingOcarinaCountdown         ; $6D7A: $21 $66 $C1
    or   [hl]                                     ; $6D7D: $B6
    ld   hl, wDialogGotItem                       ; $6D7E: $21 $A9 $C1
    or   [hl]                                     ; $6D81: $B6
    jp   nz, setCarryAndReturn                    ; $6D82: $C2 $0A $6E

    ld   a, WAVE_SFX_LINK_HURT                    ; $6D85: $3E $03
    ldh  [hWaveSfx], a                            ; $6D87: $E0 $F3

    ; Get the nominal amount of damages this entity deals
    ld   hl, wEntitiesHealthGroup                 ; $6D89: $21 $D0 $C4
    add  hl, bc                                   ; $6D8C: $09
    ld   d, b                                     ; $6D8D: $50
    ld   e, [hl]                                  ; $6D8E: $5E

    ld   hl, EntityDamagesForGroup                ; $6D8F: $21 $F1 $47
    add  hl, de                                   ; $6D92: $19
    ld   e, [hl]                                  ; $6D93: $5E

    ; If using the Blue Tunic, take half damages
    ld   a, [wTunicType]                          ; $6D94: $FA $0F $DC
    cp   $02                                      ; $6D97: $FE $02
    jr   z, .takeHalfDamages                      ; $6D99: $28 $0E

    ; If having an active Guardian Acorn, take no damages
    ld   a, [wActivePowerUp]                      ; $6D9B: $FA $7C $D4
    cp   $02                                      ; $6D9E: $FE $02
    jr   nz, .damageModifiersEnd                  ; $6DA0: $20 $09

    ld   a, e                                     ; $6DA2: $7B
    cp   $04                                      ; $6DA3: $FE $04
    jr   nz, .takeHalfDamages                    ; $6DA5: $20 $02

    ; Take no damages
    ld   e, $00                                   ; $6DA7: $1E $00

.takeHalfDamages
    ; Divide
    srl  e                                        ; $6DA9: $CB $3B
.damageModifiersEnd

    ld   a, [wSubtractHealthBuffer]               ; $6DAB: $FA $94 $DB
    add  e                                        ; $6DAE: $83
    ld   [wSubtractHealthBuffer], a               ; $6DAF: $EA $94 $DB
    ld   a, $50                                   ; $6DB2: $3E $50
    ld   [wInvincibilityCounter], a               ; $6DB4: $EA $C7 $DB
    xor  a                                        ; $6DB7: $AF
    ld   [wGuardianAcornCounter], a               ; $6DB8: $EA $71 $D4
    ld   a, [wActivePowerUp]                      ; $6DBB: $FA $7C $D4
    and  a                                        ; $6DBE: $A7
    jr   z, func_003_6DDF                         ; $6DBF: $28 $1E

    ld   hl, wPowerUpHits                         ; $6DC1: $21 $7A $D4
    inc  [hl]                                     ; $6DC4: $34
    ld   a, [hl]                                  ; $6DC5: $7E
    cp   $03                                      ; $6DC6: $FE $03
    jr   c, func_003_6DDF                         ; $6DC8: $38 $15

    xor  a                                        ; $6DCA: $AF
    ld   [wActivePowerUp], a                      ; $6DCB: $EA $7C $D4
    ld   a, [wInBossBattle]                       ; $6DCE: $FA $BE $C1
    and  a                                        ; $6DD1: $A7
    jr   nz, func_003_6DDF                        ; $6DD2: $20 $0B

    ldh  a, [hDefaultMusicTrack]                  ; $6DD4: $F0 $B0
    cp   MUSIC_OWL                                ; $6DD6: $FE $22
    jr   z, jr_003_6DDD                           ; $6DD8: $28 $03

    ld   [wMusicTrackToPlay], a                   ; $6DDA: $EA $68 $D3

jr_003_6DDD:
    ldh  [hNextDefaultMusicTrack], a              ; $6DDD: $E0 $BF

func_003_6DDF::
    call ResetPegasusBoots                        ; $6DDF: $CD $B6 $0C
    ld   a, $10                                   ; $6DE2: $3E $10
    ld   [$C13E], a                               ; $6DE4: $EA $3E $C1
    ldh  a, [hActiveEntityType]                   ; $6DE7: $F0 $EB
    ld   e, $18                                   ; $6DE9: $1E $18
    cp   ENTITY_ROLLING_BONES_BAR                 ; $6DEB: $FE $82
    jp   z, label_003_6FA7                        ; $6DED: $CA $A7 $6F

    cp   ENTITY_FACADE                            ; $6DF0: $FE $5A
    jr   nz, .facadeEnd                           ; $6DF2: $20 $06
    ld   hl, wEntitiesCollisionsTable             ; $6DF4: $21 $A0 $C2
    add  hl, bc                                   ; $6DF7: $09
    ld   [hl], $01                                ; $6DF8: $36 $01
.facadeEnd

    cp   ENTITY_MOLDORM                           ; $6DFA: $FE $59
    ld   a, $14                                   ; $6DFC: $3E $14
    jr   nz, .moldormEnd                          ; $6DFE: $20 $02
    ld   a, $18                                   ; $6E00: $3E $18
.moldormEnd

    call func_003_7565                            ; $6E02: $CD $65 $75
    ldh  a, [hIsSideScrolling]                    ; $6E05: $F0 $F9
    and  a                                        ; $6E07: $A7
    jr   nz, jr_003_6E0E                          ; $6E08: $20 $04

setCarryAndReturn:
    scf                                           ; $6E0A: $37
    ret                                           ; $6E0B: $C9

Data_003_6E0C::
    db   $0C, $F4

jr_003_6E0E:
    ldh  a, [hFF9C]                               ; $6E0E: $F0 $9C
    cp   $02                                      ; $6E10: $FE $02
    jr   z, setCarryAndReturn                           ; $6E12: $28 $F6

    call func_003_7ED9                            ; $6E14: $CD $D9 $7E
    ld   d, b                                     ; $6E17: $50
    ld   hl, Data_003_6E0C                        ; $6E18: $21 $0C $6E
    add  hl, de                                   ; $6E1B: $19
    ld   a, [hl]                                  ; $6E1C: $7E
    ldh  [hLinkPositionXIncrement], a             ; $6E1D: $E0 $9A
    ld   a, $F4                                   ; $6E1F: $3E $F4
    ldh  [hLinkPositionYIncrement], a             ; $6E21: $E0 $9B
    xor  a                                        ; $6E23: $AF
    ldh  [hFF9C], a                               ; $6E24: $E0 $9C
    scf                                           ; $6E26: $37
    ret                                           ; $6E27: $C9

func_003_6E28::
    call func_003_6C6B                            ; $6E28: $CD $6B $6C

func_003_6E2B::
    ld   a, [$C140]                               ; $6E2B: $FA $40 $C1
    cp   $00                                      ; $6E2E: $FE $00
    jp   z, label_003_73E6                        ; $6E30: $CA $E6 $73

    ld   hl, wEntitiesFlashCountdownTable         ; $6E33: $21 $20 $C4
    add  hl, bc                                   ; $6E36: $09
    ld   a, [hl]                                  ; $6E37: $7E
    and  a                                        ; $6E38: $A7
    jr   z, jr_003_6E40                           ; $6E39: $28 $05

    cp   $18                                      ; $6E3B: $FE $18
    jp   c, label_003_73E6                        ; $6E3D: $DA $E6 $73

jr_003_6E40:
    ld   a, [$C1AC]                               ; $6E40: $FA $AC $C1
    and  a                                        ; $6E43: $A7
    jr   z, jr_003_6E4B                           ; $6E44: $28 $05

    dec  a                                        ; $6E46: $3D
    cp   c                                        ; $6E47: $B9
    jp   z, label_003_73E6                        ; $6E48: $CA $E6 $73

jr_003_6E4B:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6E4B: $21 $10 $C4
    add  hl, bc                                   ; $6E4E: $09
    ld   a, [hl]                                  ; $6E4F: $7E
    and  a                                        ; $6E50: $A7
    jp   nz, label_003_73E6                       ; $6E51: $C2 $E6 $73

    ld   de, hActiveEntityPosX                    ; $6E54: $11 $EE $FF
    push bc                                       ; $6E57: $C5
    sla  c                                        ; $6E58: $CB $21
    sla  c                                        ; $6E5A: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $6E5C: $21 $80 $D5
    add  hl, bc                                   ; $6E5F: $09
    pop  bc                                       ; $6E60: $C1
    ld   a, [de]                                  ; $6E61: $1A
    add  [hl]                                     ; $6E62: $86
    push hl                                       ; $6E63: $E5
    ld   hl, $C140                                ; $6E64: $21 $40 $C1
    sub  [hl]                                     ; $6E67: $96
    cp   $80                                      ; $6E68: $FE $80
    jr   c, jr_003_6E6E                           ; $6E6A: $38 $02

    cpl                                           ; $6E6C: $2F
    inc  a                                        ; $6E6D: $3C

jr_003_6E6E:
    pop  hl                                       ; $6E6E: $E1
    push af                                       ; $6E6F: $F5
    inc  hl                                       ; $6E70: $23
    ld   a, [$C141]                               ; $6E71: $FA $41 $C1
    add  [hl]                                     ; $6E74: $86
    ld   e, a                                     ; $6E75: $5F
    pop  af                                       ; $6E76: $F1
    cp   e                                        ; $6E77: $BB
    jp   nc, label_003_73E6                       ; $6E78: $D2 $E6 $73

    inc  hl                                       ; $6E7B: $23
    push hl                                       ; $6E7C: $E5
    ld   de, hActiveEntityVisualPosY                    ; $6E7D: $11 $EC $FF
    pop  hl                                       ; $6E80: $E1
    ld   a, [de]                                  ; $6E81: $1A
    add  [hl]                                     ; $6E82: $86
    push hl                                       ; $6E83: $E5
    ld   hl, $C142                                ; $6E84: $21 $42 $C1
    sub  [hl]                                     ; $6E87: $96
    cp   $80                                      ; $6E88: $FE $80
    jr   c, jr_003_6E8E                           ; $6E8A: $38 $02

    cpl                                           ; $6E8C: $2F
    inc  a                                        ; $6E8D: $3C

jr_003_6E8E:
    pop  hl                                       ; $6E8E: $E1
    push af                                       ; $6E8F: $F5
    inc  hl                                       ; $6E90: $23
    ld   a, [wIsLinkInTheAir]                     ; $6E91: $FA $43 $C1
    add  [hl]                                     ; $6E94: $86
    ld   e, a                                     ; $6E95: $5F
    pop  af                                       ; $6E96: $F1
    cp   e                                        ; $6E97: $BB
    jp   nc, label_003_73E6                       ; $6E98: $D2 $E6 $73

    ld   hl, wEntitiesPhysicsFlagsTable           ; $6E9B: $21 $40 $C3
    add  hl, bc                                   ; $6E9E: $09
    ld   a, [hl]                                  ; $6E9F: $7E
    and  %00100000                                ; $6EA0: $E6 $20
    jp   nz, collectPickableItem                  ; $6EA2: $C2 $11 $63

    ld   a, [$C5B0]                               ; $6EA5: $FA $B0 $C5
    and  a                                        ; $6EA8: $A7
    jp   nz, label_003_6FE8                       ; $6EA9: $C2 $E8 $6F

    ld   a, [wIsRunningWithPegasusBoots]          ; $6EAC: $FA $4A $C1
    ldh  [hIndexOfObjectBelowLink], a             ; $6EAF: $E0 $E9
    call ResetPegasusBoots                        ; $6EB1: $CD $B6 $0C

    ldh  a, [hActiveEntityType]                   ; $6EB4: $F0 $EB
    cp   ENTITY_FLAME_SHOOTER                     ; $6EB6: $FE $E2
    jr   nz, .flameShooterEnd                     ; $6EB8: $20 $17

    ld   a, [wShieldLevel]                        ; $6EBA: $FA $44 $DB
    cp   $02                                      ; $6EBD: $FE $02
    ret  nz                                       ; $6EBF: $C0

    ldh  a, [hLinkDirection]                      ; $6EC0: $F0 $9E
    cp   DIRECTION_UP                             ; $6EC2: $FE $02
    ret  nz                                       ; $6EC4: $C0

    ld   a, $04                                   ; $6EC5: $3E $04
    ldh  [hLinkPositionYIncrement], a             ; $6EC7: $E0 $9B
    ld   a, $08                                   ; $6EC9: $3E $08
    ld   [$C13E], a                               ; $6ECB: $EA $3E $C1
    jp   IncrementEntityState                     ; $6ECE: $C3 $12 $3B
.flameShooterEnd

    cp   ENTITY_BOUNCING_BOMBITE                  ; $6ED1: $FE $55
    jr   nz, .bouncingBombiteEnd                  ; $6ED3: $20 $22

    ldh  a, [hActiveEntityState]                  ; $6ED5: $F0 $F0
    cp   $02                                      ; $6ED7: $FE $02
    jp   nz, func_003_6F93                        ; $6ED9: $C2 $93 $6F

    ld   hl, wEntitiesSpeedXTable                 ; $6EDC: $21 $40 $C2
    add  hl, bc                                   ; $6EDF: $09
    ld   a, [hl]                                  ; $6EE0: $7E
    cpl                                           ; $6EE1: $2F
    inc  a                                        ; $6EE2: $3C
    ld   [hl], a                                  ; $6EE3: $77
    ld   hl, wEntitiesSpeedYTable                 ; $6EE4: $21 $50 $C2
    add  hl, bc                                   ; $6EE7: $09
    ld   a, [hl]                                  ; $6EE8: $7E
    cpl                                           ; $6EE9: $2F
    inc  a                                        ; $6EEA: $3C
    ld   [hl], a                                  ; $6EEB: $77
    call GetEntityTransitionCountdown             ; $6EEC: $CD $05 $0C
    ld   [hl], $40                                ; $6EEF: $36 $40
    call GetEntityPrivateCountdown1               ; $6EF1: $CD $00 $0C
    ld   [hl], $08                                ; $6EF4: $36 $08
    ret                                           ; $6EF6: $C9
.bouncingBombiteEnd

    cp   ENTITY_KNIGHT                            ; $6EF7: $FE $51
    jr   nz, jr_003_6F20                          ; $6EF9: $20 $25

    ld   hl, wEntitiesUnknowTableH                ; $6EFB: $21 $30 $C4
    add  hl, bc                                   ; $6EFE: $09
    and  $40                                      ; $6EFF: $E6 $40
    jp   z, func_003_6F93                         ; $6F01: $CA $93 $6F

label_003_6F04:
    ld   hl, wEntitiesPrivateState1Table          ; $6F04: $21 $B0 $C2
    add  hl, bc                                   ; $6F07: $09
    ld   a, [hl]                                  ; $6F08: $7E
    cpl                                           ; $6F09: $2F
    inc  a                                        ; $6F0A: $3C
    ld   [hl], a                                  ; $6F0B: $77
    call func_003_6F5C                            ; $6F0C: $CD $5C $6F
    call GetEntityPrivateCountdown1               ; $6F0F: $CD $00 $0C
    ld   [hl], $0C                                ; $6F12: $36 $0C
    ld   a, $01                                   ; $6F14: $3E $01
    ld   [wC160], a                               ; $6F16: $EA $60 $C1
    xor  a                                        ; $6F19: $AF
    ld   [wSwordCharge], a                        ; $6F1A: $EA $22 $C1
    jp   label_003_713B                           ; $6F1D: $C3 $3B $71

jr_003_6F20:
    cp   ENTITY_PAIRODD_PROJECTILE                ; $6F20: $FE $58
    jr   nz, jr_003_6F2A                          ; $6F22: $20 $06

label_003_6F24:
    call func_003_6F93                            ; $6F24: $CD $93 $6F
    jp   CheckLinkCollisionWithProjectile.jr_003_6C54; $6F27: $C3 $54 $6C

jr_003_6F2A:
    cp   ENTITY_SPIKED_BEETLE                     ; $6F2A: $FE $2C
    jr   nz, jr_003_6F6D                          ; $6F2C: $20 $3F

    ld   hl, wEntitiesStateTable                  ; $6F2E: $21 $90 $C2
    add  hl, bc                                   ; $6F31: $09
    ld   a, [hl]                                  ; $6F32: $7E
    cp   $03                                      ; $6F33: $FE $03
    jr   z, func_003_6F5C                         ; $6F35: $28 $25

    ld   [hl], $03                                ; $6F37: $36 $03
    ld   hl, wEntitiesSpeedZTable                 ; $6F39: $21 $20 $C3
    add  hl, bc                                   ; $6F3C: $09
    ld   [hl], $20                                ; $6F3D: $36 $20
    call GetEntityTransitionCountdown             ; $6F3F: $CD $05 $0C
    ld   [hl], $FF                                ; $6F42: $36 $FF
    ldh  a, [hLinkDirection]                      ; $6F44: $F0 $9E
    ld   e, a                                     ; $6F46: $5F
    ld   d, b                                     ; $6F47: $50
    ld   hl, Data_003_6F65                        ; $6F48: $21 $65 $6F
    add  hl, de                                   ; $6F4B: $19
    ld   a, [hl]                                  ; $6F4C: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6F4D: $21 $40 $C2
    add  hl, bc                                   ; $6F50: $09
    ld   [hl], a                                  ; $6F51: $77
    ld   hl, Data_003_6F69                        ; $6F52: $21 $69 $6F
    add  hl, de                                   ; $6F55: $19
    ld   a, [hl]                                  ; $6F56: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $6F57: $21 $50 $C2
    add  hl, bc                                   ; $6F5A: $09
    ld   [hl], a                                  ; $6F5B: $77

func_003_6F5C::
    call func_003_6F93                            ; $6F5C: $CD $93 $6F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6F5F: $21 $10 $C4
    add  hl, bc                                   ; $6F62: $09
    ld   [hl], b                                  ; $6F63: $70
    ret                                           ; $6F64: $C9

Data_003_6F65::
    db   $10, $F0, $00, $00

Data_003_6F69::
    db   $00, $00, $F0, $10

jr_003_6F6D:
    cp   ENTITY_STAR                              ; $6F6D: $FE $9C
    jr   z, .starOrAntiFairy                      ; $6F6F: $28 $04

    cp   ENTITY_ANTI_FAIRY                        ; $6F71: $FE $15
    jr   nz, .starOrAntiFairyEnd                  ; $6F73: $20 $19

.starOrAntiFairy
    ldh  a, [hLinkDirection]                      ; $6F75: $F0 $9E
    and  $02                                      ; $6F77: $E6 $02
    jr   nz, .jr_003_6F81                         ; $6F79: $20 $06

    ld   hl, wEntitiesSpeedXTable                 ; $6F7B: $21 $40 $C2
    add  hl, bc                                   ; $6F7E: $09
    jr   .jr_003_6F85                             ; $6F7F: $18 $04

.jr_003_6F81
    ld   hl, wEntitiesSpeedYTable                 ; $6F81: $21 $50 $C2
    add  hl, bc                                   ; $6F84: $09

.jr_003_6F85
    ld   a, [hl]                                  ; $6F85: $7E
    cpl                                           ; $6F86: $2F
    inc  a                                        ; $6F87: $3C
    ld   [hl], a                                  ; $6F88: $77
    call func_003_6F93                            ; $6F89: $CD $93 $6F
    ld   [hl], b                                  ; $6F8C: $70
    ret                                           ; $6F8D: $C9
.starOrAntiFairyEnd

    cp   ENTITY_FACADE                            ; $6F8E: $FE $5A
    jp   z, label_003_6F24                        ; $6F90: $CA $24 $6F

func_003_6F93::
    ld   a, JINGLE_BUMP                           ; $6F93: $3E $09
    ldh  [hJingle], a                             ; $6F95: $E0 $F2
    call ResetPegasusBoots                        ; $6F97: $CD $B6 $0C
    ld   a, $0C                                   ; $6F9A: $3E $0C
    ld   [$C13E], a                               ; $6F9C: $EA $3E $C1

    ldh  a, [hActiveEntityType]                   ; $6F9F: $F0 $EB
    cp   ENTITY_ROLLING_BONES_BAR                 ; $6FA1: $FE $82
    jr   nz, jr_003_6FB9                          ; $6FA3: $20 $14

    ld   e, $10                                   ; $6FA5: $1E $10

label_003_6FA7:
    push de                                       ; $6FA7: $D5
    call func_003_7ED9                            ; $6FA8: $CD $D9 $7E
    ld   a, e                                     ; $6FAB: $7B
    and  a                                        ; $6FAC: $A7
    pop  de                                       ; $6FAD: $D1
    ld   a, e                                     ; $6FAE: $7B
    jr   z, jr_003_6FB3                           ; $6FAF: $28 $02

    cpl                                           ; $6FB1: $2F
    inc  a                                        ; $6FB2: $3C

jr_003_6FB3:
    ldh  [hLinkPositionXIncrement], a             ; $6FB3: $E0 $9A
    xor  a                                        ; $6FB5: $AF
    ldh  [hLinkPositionYIncrement], a             ; $6FB6: $E0 $9B
    ret                                           ; $6FB8: $C9

jr_003_6FB9:
    ld   a, $12                                   ; $6FB9: $3E $12
    call func_003_7565                            ; $6FBB: $CD $65 $75
    ld   hl, hIndexOfObjectBelowLink              ; $6FBE: $21 $E9 $FF
    ldh  a, [hPressedButtonsMask]                 ; $6FC1: $F0 $CB
    and  $0F                                      ; $6FC3: $E6 $0F
    ld   a, $08                                   ; $6FC5: $3E $08
    or   [hl]                                     ; $6FC7: $B6
    jr   z, func_003_6FCC                         ; $6FC8: $28 $02

    ld   a, $20                                   ; $6FCA: $3E $20

func_003_6FCC::
    call GetVectorTowardsLink                     ; $6FCC: $CD $45 $7E
    ldh  a, [hScratch0]                           ; $6FCF: $F0 $D7
    cpl                                           ; $6FD1: $2F
    inc  a                                        ; $6FD2: $3C
    ld   hl, wEntitiesUnknowTableS                ; $6FD3: $21 $00 $C4
    add  hl, bc                                   ; $6FD6: $09
    ld   [hl], a                                  ; $6FD7: $77
    ldh  a, [hScratch1]                           ; $6FD8: $F0 $D8
    cpl                                           ; $6FDA: $2F
    inc  a                                        ; $6FDB: $3C
    ld   hl, $C3F0                                ; $6FDC: $21 $F0 $C3
    add  hl, bc                                   ; $6FDF: $09
    ld   [hl], a                                  ; $6FE0: $77
    jp   func_003_73DB                            ; $6FE1: $C3 $DB $73

Data_003_6FE4::
    db   $00, $01, $02, $03

label_003_6FE8:
    ldh  a, [hActiveEntityType]                   ; $6FE8: $F0 $EB
    cp   ENTITY_FLAME_SHOOTER                     ; $6FEA: $FE $E2
    ret  z                                        ; $6FEC: $C8

    cp   ENTITY_FINAL_NIGHTMARE                   ; $6FED: $FE $E6
    jr   nz, jr_003_7018                          ; $6FEF: $20 $27

    ld   a, [wFinalNightmareForm]                 ; $6FF1: $FA $19 $D2
    JP_TABLE                                      ; $6FF4
._00 dw NoopFunction
._01 dw FinalNightmareForm2Collisions
._02 dw FinalNightmareForm3Collisions
._03 dw FinalNightmareForm4And5Collisions
._04 dw FinalNightmareForm4And5Collisions
._05 dw FinalNightmareForm6Collisions

FinalNightmareForm2Collisions::
    call IncrementEntityState                     ; $7001: $CD $12 $3B
    ld   [hl], $06                                ; $7004: $36 $06
    ret                                           ; $7006: $C9

FinalNightmareForm3Collisions::
    ld   a, [wIsUsingSpinAttack]                  ; $7007: $FA $21 $C1
    and  a                                        ; $700A: $A7
    jr   nz, jr_003_7013                          ; $700B: $20 $06

    ld   a, [wC16A]                               ; $700D: $FA $6A $C1
    cp   $04                                      ; $7010: $FE $04
    ret  nc                                       ; $7012: $D0

jr_003_7013:
    jp   IncrementEntityState                     ; $7013: $C3 $12 $3B

FinalNightmareForm4And5Collisions::
    ldh  a, [hActiveEntityType]                   ; $7016: $F0 $EB

jr_003_7018:
    cp   ENTITY_BUZZ_BLOB                         ; $7018: $FE $B9
    jr   nz, .buzzBlobEnd                         ; $701A: $20 $26

    ldh  a, [hActiveEntityStatus]                 ; $701C: $F0 $EA
    cp   $05                                      ; $701E: $FE $05
    jr   nz, FinalNightmareForm6Collisions        ; $7020: $20 $20

    call IncrementEntityState                     ; $7022: $CD $12 $3B
    ld   [hl], $01                                ; $7025: $36 $01
    call GetEntityTransitionCountdown             ; $7027: $CD $05 $0C
    ld   [hl], $40                                ; $702A: $36 $40
    ld   a, $40                                   ; $702C: $3E $40
    ld   [$D464], a                               ; $702E: $EA $64 $D4
    xor  a                                        ; $7031: $AF
    ld   [wSwordAnimationState], a                ; $7032: $EA $37 $C1
    ld   [wC16A], a                               ; $7035: $EA $6A $C1
    ld   [wIsUsingSpinAttack], a                  ; $7038: $EA $21 $C1
    ld   a, $1C                                   ; $703B: $3E $1C
    ldh  [hNoiseSfx], a                           ; $703D: $E0 $F4
    jp   ApplyLinkCollisionWithEnemy              ; $703F: $C3 $D5 $6C
.buzzBlobEnd

FinalNightmareForm6Collisions::
    ldh  a, [hActiveEntityType]                   ; $7042: $F0 $EB
    cp   ENTITY_BOUNCING_BOMBITE                  ; $7044: $FE $55
    jr   nz, .bouncingBombiteEnd                  ; $7046: $20 $27

    ld   a, $30                                   ; $7048: $3E $30
    call GetVectorTowardsLink                     ; $704A: $CD $45 $7E
    ldh  a, [hScratch0]                           ; $704D: $F0 $D7
    cpl                                           ; $704F: $2F
    inc  a                                        ; $7050: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $7051: $21 $50 $C2
    add  hl, bc                                   ; $7054: $09
    ld   [hl], a                                  ; $7055: $77
    ldh  a, [hScratch1]                           ; $7056: $F0 $D8
    cpl                                           ; $7058: $2F
    inc  a                                        ; $7059: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $705A: $21 $40 $C2
    add  hl, bc                                   ; $705D: $09
    ld   [hl], a                                  ; $705E: $77
    call IncrementEntityState                     ; $705F: $CD $12 $3B
    ld   [hl], $02                                ; $7062: $36 $02
    call GetEntityTransitionCountdown             ; $7064: $CD $05 $0C
    ld   [hl], $40                                ; $7067: $36 $40
    call GetEntityPrivateCountdown1               ; $7069: $CD $00 $0C
    ld   [hl], $08                                ; $706C: $36 $08
    ret                                           ; $706E: $C9
.bouncingBombiteEnd

    cp   ENTITY_ANGLER_FISH                       ; $706F: $FE $65
    jr   nz, .anglerFishEnd                       ; $7071: $20 $0A

    call func_003_6DDF                            ; $7073: $CD $DF $6D
    ld   a, $08                                   ; $7076: $3E $08
    ld   [$C13E], a                               ; $7078: $EA $3E $C1
    jr   jr_003_70B9                              ; $707B: $18 $3C
.anglerFishEnd

    cp   ENTITY_SLIME_EYE                         ; $707D: $FE $5B
    jr   nz, jr_003_70B9                          ; $707F: $20 $38

    ldh  a, [hFFE8]                               ; $7081: $F0 $E8
    and  a                                        ; $7083: $A7
    jr   nz, jr_003_70A9                          ; $7084: $20 $23

    ld   hl, wEntitiesPrivateState1Table          ; $7086: $21 $B0 $C2
    add  hl, bc                                   ; $7089: $09
    ld   a, [hl]                                  ; $708A: $7E
    cp   $04                                      ; $708B: $FE $04
    jp   nz, label_003_709D                       ; $708D: $C2 $9D $70

    ld   a, [wIsRunningWithPegasusBoots]          ; $7090: $FA $4A $C1
    and  a                                        ; $7093: $A7
    jr   z, label_003_7102                        ; $7094: $28 $6C

    ld   hl, wEntitiesPrivateCountdown2Table      ; $7096: $21 $00 $C3
    add  hl, bc                                   ; $7099: $09
    ld   [hl], $0C                                ; $709A: $36 $0C
    ret                                           ; $709C: $C9

label_003_709D:
    ld   a, [wIsRunningWithPegasusBoots]          ; $709D: $FA $4A $C1
    and  a                                        ; $70A0: $A7
    jr   z, jr_003_70AC                           ; $70A1: $28 $09

    call func_003_6DDF                            ; $70A3: $CD $DF $6D
    jp   label_003_7102                           ; $70A6: $C3 $02 $71

jr_003_70A9:
    jp   func_003_6DDF                            ; $70A9: $C3 $DF $6D

jr_003_70AC:
    ld   a, $04                                   ; $70AC: $3E $04
    ld   [$C13E], a                               ; $70AE: $EA $3E $C1
    ld   a, $10                                   ; $70B1: $3E $10
    call func_003_7565                            ; $70B3: $CD $65 $75
    jp   label_003_7102                           ; $70B6: $C3 $02 $71

jr_003_70B9:
    ld   hl, wEntitiesUnknowTableH                ; $70B9: $21 $30 $C4
    add  hl, bc                                   ; $70BC: $09
    ld   a, [hl]                                  ; $70BD: $7E
    and  $40                                      ; $70BE: $E6 $40
    jr   z, label_003_7102                        ; $70C0: $28 $40

    ldh  a, [hActiveEntityType]                   ; $70C2: $F0 $EB
    cp   ENTITY_KNIGHT                            ; $70C4: $FE $51
    jp   z, label_003_6F04                        ; $70C6: $CA $04 $6F

    cp   ENTITY_GENIE                             ; $70C9: $FE $5C
    jr   nz, jr_003_70E7                          ; $70CB: $20 $1A

    ld   a, [wTunicType]                          ; $70CD: $FA $0F $DC
    cp   $01                                      ; $70D0: $FE $01
    jr   z, jr_003_70DD                           ; $70D2: $28 $09

    ld   a, [wActivePowerUp]                      ; $70D4: $FA $7C $D4
    cp   $01                                      ; $70D7: $FE $01
    ld   a, $20                                   ; $70D9: $3E $20
    jr   nz, jr_003_70DF                          ; $70DB: $20 $02

jr_003_70DD:
    ld   a, $30                                   ; $70DD: $3E $30

jr_003_70DF:
    call func_003_6FCC                            ; $70DF: $CD $CC $6F
    ld   hl, wEntitiesFlashCountdownTable         ; $70E2: $21 $20 $C4
    add  hl, bc                                   ; $70E5: $09
    ld   [hl], b                                  ; $70E6: $70

jr_003_70E7:
    ld   a, c                                     ; $70E7: $79
    inc  a                                        ; $70E8: $3C
    ld   [$C1AC], a                               ; $70E9: $EA $AC $C1
    call label_D07                                ; $70EC: $CD $07 $0D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $70EF: $21 $10 $C4
    add  hl, bc                                   ; $70F2: $09
    ld   [hl], $10                                ; $70F3: $36 $10
    ld   hl, $C3F0                                ; $70F5: $21 $F0 $C3
    add  hl, bc                                   ; $70F8: $09
    ld   [hl], b                                  ; $70F9: $70
    ld   hl, wEntitiesUnknowTableS                ; $70FA: $21 $00 $C4
    add  hl, bc                                   ; $70FD: $09
    ld   [hl], b                                  ; $70FE: $70
    jp   func_003_6DDF                            ; $70FF: $C3 $DF $6D

label_003_7102:
    ldh  a, [hActiveEntityType]                   ; $7102: $F0 $EB
    cp   ENTITY_CUE_BALL                          ; $7104: $FE $8E
    jr   nz, .cueBallEnd                          ; $7106: $20 $05

    call ResetPegasusBoots                        ; $7108: $CD $B6 $0C
    jr   jr_003_714D                              ; $710B: $18 $40
.cueBallEnd

    cp   ENTITY_IRON_MASK                         ; $710D: $FE $24
    jr   nz, jr_003_7146                          ; $710F: $20 $35

    ld   hl, wEntitiesPrivateState2Table          ; $7111: $21 $C0 $C2
    add  hl, bc                                   ; $7114: $09
    ld   a, [hl]                                  ; $7115: $7E
    and  a                                        ; $7116: $A7
    jr   nz, jr_003_7146                          ; $7117: $20 $2D

    ldh  a, [hLinkDirection]                      ; $7119: $F0 $9E
    ld   e, a                                     ; $711B: $5F
    ld   d, b                                     ; $711C: $50
    ld   hl, Data_003_6FE4                        ; $711D: $21 $E4 $6F
    add  hl, de                                   ; $7120: $19
    ld   a, [hl]                                  ; $7121: $7E
    ld   hl, wEntitiesDirectionTable              ; $7122: $21 $80 $C3
    add  hl, bc                                   ; $7125: $09
    cp   [hl]                                     ; $7126: $BE
    jr   z, jr_003_714D                           ; $7127: $28 $24

    call ResetPegasusBoots                        ; $7129: $CD $B6 $0C
    ld   a, $10                                   ; $712C: $3E $10
    ld   [$C13E], a                               ; $712E: $EA $3E $C1
    ld   a, $10                                   ; $7131: $3E $10
    call func_003_7565                            ; $7133: $CD $65 $75
    ld   a, $10                                   ; $7136: $3E $10
    call func_003_6FCC                            ; $7138: $CD $CC $6F

label_003_713B:
    ldh  a, [hActiveEntityPosX]                   ; $713B: $F0 $EE
    ldh  [hScratch0], a                           ; $713D: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $713F: $F0 $EC
    ldh  [hScratch1], a                           ; $7141: $E0 $D8
    jp   label_D15                                ; $7143: $C3 $15 $0D

jr_003_7146:
    ldh  a, [hActiveEntityType]                   ; $7146: $F0 $EB
    cp   ENTITY_ANTI_FAIRY                        ; $7148: $FE $15
    jp   z, label_003_73E6                        ; $714A: $CA $E6 $73

jr_003_714D:
    ld   a, $01                                   ; $714D: $3E $01
    ld   [wC160], a                               ; $714F: $EA $60 $C1
    ld   a, [wC16A]                               ; $7152: $FA $6A $C1
    cp   $05                                      ; $7155: $FE $05
    jr   nz, jr_003_715E                          ; $7157: $20 $05

    ld   a, $0C                                   ; $7159: $3E $0C
    ld   [wC16D], a                               ; $715B: $EA $6D $C1

jr_003_715E:
    xor  a                                        ; $715E: $AF
    ld   [wSwordCharge], a                        ; $715F: $EA $22 $C1
    ld   a, $30                                   ; $7162: $3E $30
    call func_003_6FCC                            ; $7164: $CD $CC $6F
    ld   hl, hJingle                              ; $7167: $21 $F2 $FF
    ld   [hl], JINGLE_BUMP                        ; $716A: $36 $09
    ld   a, [wTunicType]                          ; $716C: $FA $0F $DC
    cp   $01                                      ; $716F: $FE $01
    jr   z, jr_003_717A                           ; $7171: $28 $07

    ld   a, [wActivePowerUp]                      ; $7173: $FA $7C $D4
    cp   $01                                      ; $7176: $FE $01
    jr   nz, func_003_719D                        ; $7178: $20 $23

jr_003_717A:
    call func_003_719D                            ; $717A: $CD $9D $71
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $717D: $21 $10 $C4
    add  hl, bc                                   ; $7180: $09
    ld   [hl], $20                                ; $7181: $36 $20
    ld   hl, wEntitiesUnknowTableZ                ; $7183: $21 $A0 $C4
    add  hl, bc                                   ; $7186: $09
    ld   [hl], $01                                ; $7187: $36 $01
    ld   a, $11                                   ; $7189: $3E $11
    ldh  [hWaveSfx], a                            ; $718B: $E0 $F3
    ld   hl, wEntitiesStatusTable                 ; $718D: $21 $80 $C2
    add  hl, bc                                   ; $7190: $09
    ld   a, [hl]                                  ; $7191: $7E
    cp   $01                                      ; $7192: $FE $01
    jr   nz, jr_003_719C                          ; $7194: $20 $06

    ld   hl, wEntitiesUnknowTableV                ; $7196: $21 $80 $C4
    add  hl, bc                                   ; $7199: $09
    ld   [hl], $40                                ; $719A: $36 $40

jr_003_719C:
    ret                                           ; $719C: $C9

func_003_719D::
    ld   a, c                                     ; $719D: $79
    inc  a                                        ; $719E: $3C
    ld   [$C1AC], a                               ; $719F: $EA $AC $C1
    ld   a, [wTunicType]                          ; $71A2: $FA $0F $DC
    and  $01                                      ; $71A5: $E6 $01
    jr   nz, jr_003_71AE                          ; $71A7: $20 $05

    ld   a, [wActivePowerUp]                      ; $71A9: $FA $7C $D4
    and  $01                                      ; $71AC: $E6 $01

jr_003_71AE:
    ld   hl, wIsUsingSpinAttack                   ; $71AE: $21 $21 $C1
    or   [hl]                                     ; $71B1: $B6
    ld   hl, wIsRunningWithPegasusBoots           ; $71B2: $21 $4A $C1
    or   [hl]                                     ; $71B5: $B6
    ld   a, [wSwordLevel]                         ; $71B6: $FA $4E $DB
    jr   z, jr_003_71BC                           ; $71B9: $28 $01

    inc  a                                        ; $71BB: $3C

jr_003_71BC:
    dec  a                                        ; $71BC: $3D
    ld   [$C19E], a                               ; $71BD: $EA $9E $C1

label_003_71C0:
    ld   hl, wEntitiesHealthGroup                 ; $71C0: $21 $D0 $C4
    add  hl, bc                                   ; $71C3: $09
    ld   e, [hl]                                  ; $71C4: $5E
    ld   d, b                                     ; $71C5: $50
    sla  e                                        ; $71C6: $CB $23
    rl   d                                        ; $71C8: $CB $12
    sla  e                                        ; $71CA: $CB $23
    rl   d                                        ; $71CC: $CB $12
    sla  e                                        ; $71CE: $CB $23
    rl   d                                        ; $71D0: $CB $12
    sla  e                                        ; $71D2: $CB $23
    rl   d                                        ; $71D4: $CB $12
    ld   hl, Data_003_43EC                        ; $71D6: $21 $EC $43
    add  hl, de                                   ; $71D9: $19
    ld   a, [$C19E]                               ; $71DA: $FA $9E $C1
    ld   e, a                                     ; $71DD: $5F
    ld   d, b                                     ; $71DE: $50
    add  hl, de                                   ; $71DF: $19
    ld   e, [hl]                                  ; $71E0: $5E
    push de                                       ; $71E1: $D5
    ld   a, [$C19E]                               ; $71E2: $FA $9E $C1
    rla                                           ; $71E5: $17
    rla                                           ; $71E6: $17
    rla                                           ; $71E7: $17
    and  $F8                                      ; $71E8: $E6 $F8
    ld   e, a                                     ; $71EA: $5F
    ld   hl, Data_003_473C                        ; $71EB: $21 $3C $47
    add  hl, de                                   ; $71EE: $19
    pop  de                                       ; $71EF: $D1
    add  hl, de                                   ; $71F0: $19
    ld   a, [hl]                                  ; $71F1: $7E
    and  a                                        ; $71F2: $A7
    ret  z                                        ; $71F3: $C8

    push af                                       ; $71F4: $F5
    ldh  a, [hActiveEntityType]                   ; $71F5: $F0 $EB
    cp   ENTITY_FINAL_NIGHTMARE                   ; $71F7: $FE $E6
    jr   nz, jr_003_7215                          ; $71F9: $20 $1A

    ld   a, [wFinalNightmareForm]                 ; $71FB: $FA $19 $D2
    cp   $04                                      ; $71FE: $FE $04
    jr   nz, jr_003_7215                          ; $7200: $20 $13

    ld   a, [wIsRunningWithPegasusBoots]          ; $7202: $FA $4A $C1
    push af                                       ; $7205: $F5
    call func_003_6DDF                            ; $7206: $CD $DF $6D
    pop  af                                       ; $7209: $F1
    and  a                                        ; $720A: $A7
    jr   nz, jr_003_7215                          ; $720B: $20 $08

    ld   a, [wIsUsingSpinAttack]                  ; $720D: $FA $21 $C1
    and  a                                        ; $7210: $A7
    jr   nz, jr_003_7215                          ; $7211: $20 $02

    pop  af                                       ; $7213: $F1
    ret                                           ; $7214: $C9

jr_003_7215:
    ld   hl, wEntitiesUnknowTableH                ; $7215: $21 $30 $C4
    add  hl, bc                                   ; $7218: $09
    ld   a, [hl]                                  ; $7219: $7E
    ld   hl, hJingle                              ; $721A: $21 $F2 $FF
    ld   [hl], JINGLE_BOW_WOW_CHOMP               ; $721D: $36 $03
    and  $80                                      ; $721F: $E6 $80
    jr   z, jr_003_7228                           ; $7221: $28 $05

    ld   hl, hWaveSfx                             ; $7223: $21 $F3 $FF
    ld   [hl], WAVE_SFX_BOSS_GRAWL                ; $7226: $36 $07

; Hurt cucco.
jr_003_7228:
    ld   hl, wEntitiesTypeTable                   ; $7228: $21 $A0 $C3
    add  hl, bc                                   ; $722B: $09
    ld   a, [hl]                                  ; $722C: $7E
    cp   $6C                                      ; $722D: $FE $6C
    jr   nz, jr_003_7235                          ; $722F: $20 $04

    ld   a, WAVE_SFX_CUCCO_HURT                   ; $7231: $3E $13
    ldh  [hWaveSfx], a                            ; $7233: $E0 $F3

jr_003_7235:
    pop  af                                       ; $7235: $F1
    cp   $F0                                      ; $7236: $FE $F0
    jr   c, jr_003_72B5                           ; $7238: $38 $7B

    cp   $FE                                      ; $723A: $FE $FE
    jr   nz, jr_003_7260                          ; $723C: $20 $22

    ld   hl, hNoiseSfx                            ; $723E: $21 $F4 $FF
    ld   [hl], $12                                ; $7241: $36 $12
    call func_003_73DB                            ; $7243: $CD $DB $73
    ld   hl, wEntitiesStatusTable                 ; $7246: $21 $80 $C2
    add  hl, bc                                   ; $7249: $09
    ld   [hl], $03                                ; $724A: $36 $03
    call GetEntityTransitionCountdown             ; $724C: $CD $05 $0C
    ld   [hl], $60                                ; $724F: $36 $60
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7251: $21 $40 $C3
    add  hl, bc                                   ; $7254: $09
    inc  [hl]                                     ; $7255: $34
    inc  [hl]                                     ; $7256: $34
    ld   hl, wEntitiesUnknowTableH                ; $7257: $21 $30 $C4
    add  hl, bc                                   ; $725A: $09
    ld   a, [hl]                                  ; $725B: $7E
    and  $C2                                      ; $725C: $E6 $C2
    ld   [hl], a                                  ; $725E: $77
    ret                                           ; $725F: $C9

jr_003_7260:
    cp   $FF                                      ; $7260: $FE $FF
    jr   nz, jr_003_7279                          ; $7262: $20 $15

    call func_003_73DB                            ; $7264: $CD $DB $73

func_003_7267::
    ld   hl, wEntitiesStatusTable                 ; $7267: $21 $80 $C2
    add  hl, bc                                   ; $726A: $09
    ld   [hl], $06                                ; $726B: $36 $06
    ld   hl, wEntitiesPrivateCountdown2Table      ; $726D: $21 $00 $C3
    add  hl, bc                                   ; $7270: $09
    ld   [hl], $FF                                ; $7271: $36 $FF
    ld   hl, wEntitiesSpeedZTable                 ; $7273: $21 $20 $C3
    add  hl, bc                                   ; $7276: $09
    ld   [hl], b                                  ; $7277: $70
    ret                                           ; $7278: $C9

jr_003_7279:
    cp   $FD                                      ; $7279: $FE $FD
    ret  nz                                       ; $727B: $C0

    ld   hl, wEntitiesTypeTable                   ; $727C: $21 $A0 $C3
    add  hl, bc                                   ; $727F: $09
    ld   a, [hl]                                  ; $7280: $7E
    cp   $F8                                      ; $7281: $FE $F8
    jr   z, jr_003_7289                           ; $7283: $28 $04

    cp   $B9                                      ; $7285: $FE $B9
    jr   nz, jr_003_7293                          ; $7287: $20 $0A

jr_003_7289:
    ld   hl, wEntitiesPrivateState1Table          ; $7289: $21 $B0 $C2
    add  hl, bc                                   ; $728C: $09
    ld   a, [hl]                                  ; $728D: $7E
    and  a                                        ; $728E: $A7
    ret  nz                                       ; $728F: $C0

    inc  [hl]                                     ; $7290: $34
    jr   jr_003_729D                              ; $7291: $18 $0A

jr_003_7293:
    ld   [hl], $2F                                ; $7293: $36 $2F
    call ConfigureNewEntity                       ; $7295: $CD $5B $48
    call GetEntityDropTimer                       ; $7298: $CD $FB $0B
    ld   [hl], $80                                ; $729B: $36 $80

jr_003_729D:
    ld   hl, wEntitiesPosXTable                   ; $729D: $21 $00 $C2
    add  hl, bc                                   ; $72A0: $09
    ld   a, [hl]                                  ; $72A1: $7E
    ldh  [hScratch0], a                           ; $72A2: $E0 $D7
    ld   hl, wEntitiesPosYTable                   ; $72A4: $21 $10 $C2
    add  hl, bc                                   ; $72A7: $09
    ld   a, [hl]                                  ; $72A8: $7E
    ld   hl, wEntitiesPosZTable                   ; $72A9: $21 $10 $C3
    add  hl, bc                                   ; $72AC: $09
    sub  [hl]                                     ; $72AD: $96
    ldh  [hScratch1], a                           ; $72AE: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $72B0: $3E $02
    jp   AddTranscientVfx                         ; $72B2: $C3 $C7 $0C

jr_003_72B5:
    ld   e, a                                     ; $72B5: $5F
    ld   hl, wEntitiesHealthTable                 ; $72B6: $21 $60 $C3
    add  hl, bc                                   ; $72B9: $09
    ld   a, [hl]                                  ; $72BA: $7E
    sub  e                                        ; $72BB: $93
    ld   [hl], a                                  ; $72BC: $77
    jr   c, jr_003_72C2                           ; $72BD: $38 $03

    jp   nz, jr_003_73B6                          ; $72BF: $C2 $B6 $73

jr_003_72C2:
    ld   hl, wEntitiesStatusTable                 ; $72C2: $21 $80 $C2
    add  hl, bc                                   ; $72C5: $09
    ld   [hl], $01                                ; $72C6: $36 $01
    ld   hl, wEntitiesUnknowTableH                ; $72C8: $21 $30 $C4
    add  hl, bc                                   ; $72CB: $09
    ld   a, [hl]                                  ; $72CC: $7E
    bit  7, a                                     ; $72CD: $CB $7F
    jr   z, jr_003_733E                           ; $72CF: $28 $6D

    bit  2, a                                     ; $72D1: $CB $57
    jr   nz, jr_003_7304                          ; $72D3: $20 $2F

    ld   e, $0F                                   ; $72D5: $1E $0F
    ld   d, b                                     ; $72D7: $50

jr_003_72D8:
    ld   a, e                                     ; $72D8: $7B
    cp   c                                        ; $72D9: $B9
    jr   z, jr_003_72EE                           ; $72DA: $28 $12

    ld   hl, wEntitiesStatusTable                 ; $72DC: $21 $80 $C2
    add  hl, de                                   ; $72DF: $19
    ld   a, [hl]                                  ; $72E0: $7E
    cp   $05                                      ; $72E1: $FE $05
    jr   nz, jr_003_72EE                          ; $72E3: $20 $09

    ld   hl, wEntitiesUnknowTableH                ; $72E5: $21 $30 $C4
    add  hl, de                                   ; $72E8: $19
    ld   a, [hl]                                  ; $72E9: $7E
    and  $80                                      ; $72EA: $E6 $80
    jr   nz, jr_003_7304                          ; $72EC: $20 $16

jr_003_72EE:
    dec  e                                        ; $72EE: $1D
    ld   a, e                                     ; $72EF: $7B
    cp   $FF                                      ; $72F0: $FE $FF
    jr   nz, jr_003_72D8                          ; $72F2: $20 $E4

    ld   a, [wCurrentBank]                        ; $72F4: $FA $AF $DB
    push af                                       ; $72F7: $F5
    ld   a, $03                                   ; $72F8: $3E $03
    call SwitchBank                               ; $72FA: $CD $0C $08
    call label_27F2                               ; $72FD: $CD $F2 $27
    pop  af                                       ; $7300: $F1
    ld   [wCurrentBank], a                        ; $7301: $EA $AF $DB

jr_003_7304:
    ld   a, $03                                   ; $7304: $3E $03
    ld   [wBossAgonySFXCountdown], a              ; $7306: $EA $A7 $C5
    ld   hl, wEntitiesPrivateState2Table          ; $7309: $21 $C0 $C2
    add  hl, bc                                   ; $730C: $09
    ld   [hl], b                                  ; $730D: $70
    ld   hl, wEntitiesTypeTable                   ; $730E: $21 $A0 $C3
    add  hl, bc                                   ; $7311: $09
    ld   a, [hl]                                  ; $7312: $7E
    ld   e, $B7                                   ; $7313: $1E $B7
    cp   $5A                                      ; $7315: $FE $5A
    jr   z, jr_003_7325                           ; $7317: $28 $0C

    ld   e, $B9                                   ; $7319: $1E $B9
    cp   $63                                      ; $731B: $FE $63
    jr   z, jr_003_7330                           ; $731D: $28 $11

    ld   e, $BD                                   ; $731F: $1E $BD
    cp   $62                                      ; $7321: $FE $62
    jr   nz, jr_003_733E                          ; $7323: $20 $19

; Boss dialog after defeating them
jr_003_7325:
    ld   a, e                                     ; $7325: $7B
    call OpenDialog                               ; $7326: $CD $85 $23
    ld   a, MUSIC_BOSS_WARNING                    ; $7329: $3E $5E
    ld   [wMusicTrackToPlay], a                   ; $732B: $EA $68 $D3
    jr   jr_003_733E                              ; $732E: $18 $0E

jr_003_7330:
    ldh  a, [hLinkPositionY]                      ; $7330: $F0 $99
    push af                                       ; $7332: $F5
    ld   a, $10                                   ; $7333: $3E $10
    ldh  [hLinkPositionY], a                      ; $7335: $E0 $99
    ld   a, e                                     ; $7337: $7B
    call OpenDialog                               ; $7338: $CD $85 $23
    pop  af                                       ; $733B: $F1
    ldh  [hLinkPositionY], a                      ; $733C: $E0 $99

jr_003_733E:
    call IncrementEntityState                     ; $733E: $CD $12 $3B
    ld   [hl], b                                  ; $7341: $70
    ld   hl, wEntitiesUnknowTableV                ; $7342: $21 $80 $C4
    add  hl, bc                                   ; $7345: $09
    ld   [hl], $2F                                ; $7346: $36 $2F
    ld   hl, wEntitiesFlashCountdownTable         ; $7348: $21 $20 $C4
    add  hl, bc                                   ; $734B: $09
    xor  a                                        ; $734C: $AF
    ld   [hl], a                                  ; $734D: $77
    ld   hl, wEntitiesUnknowTableH                ; $734E: $21 $30 $C4
    add  hl, bc                                   ; $7351: $09
    ld   a, [hl]                                  ; $7352: $7E
    and  $80                                      ; $7353: $E6 $80
    jr   nz, jr_003_7361                          ; $7355: $20 $0A

    ld   hl, wEntitiesPhysicsFlagsTable           ; $7357: $21 $40 $C3
    add  hl, bc                                   ; $735A: $09
    ld   a, [hl]                                  ; $735B: $7E
    and  $F0                                      ; $735C: $E6 $F0
    or   $04                                      ; $735E: $F6 $04
    ld   [hl], a                                  ; $7360: $77

jr_003_7361:
    ld   hl, wEntitiesTypeTable                   ; $7361: $21 $A0 $C3
    add  hl, bc                                   ; $7364: $09
    ld   a, [hl]                                  ; $7365: $7E
    cp   $12                                      ; $7366: $FE $12
    jr   nz, jr_003_73B6                          ; $7368: $20 $4C

    ld   e, $0F                                   ; $736A: $1E $0F
    ld   d, b                                     ; $736C: $50

jr_003_736D:
    ld   a, e                                     ; $736D: $7B
    cp   c                                        ; $736E: $B9
    jr   z, jr_003_73AA                           ; $736F: $28 $39

    ld   hl, wEntitiesTypeTable                   ; $7371: $21 $A0 $C3
    add  hl, de                                   ; $7374: $19
    ld   a, [hl]                                  ; $7375: $7E
    cp   $10                                      ; $7376: $FE $10
    jr   z, jr_003_737E                           ; $7378: $28 $04

    cp   $11                                      ; $737A: $FE $11
    jr   nz, jr_003_73AA                          ; $737C: $20 $2C

jr_003_737E:
    ld   hl, wEntitiesStateTable                  ; $737E: $21 $90 $C2
    add  hl, de                                   ; $7381: $19
    ld   a, [hl]                                  ; $7382: $7E
    and  a                                        ; $7383: $A7
    jr   nz, jr_003_73AA                          ; $7384: $20 $24

    ld   hl, wEntitiesStatusTable                 ; $7386: $21 $80 $C2
    add  hl, de                                   ; $7389: $19
    ld   a, [hl]                                  ; $738A: $7E
    and  a                                        ; $738B: $A7
    jr   z, jr_003_73AA                           ; $738C: $28 $1C

    ld   [hl], $01                                ; $738E: $36 $01
    ld   hl, wEntitiesUnknowTableV                ; $7390: $21 $80 $C4
    add  hl, de                                   ; $7393: $19
    ld   [hl], $1F                                ; $7394: $36 $1F
    call GetRandomByte                            ; $7396: $CD $0D $28
    and  $03                                      ; $7399: $E6 $03
    push bc                                       ; $739B: $C5
    ld   c, a                                     ; $739C: $4F
    ld   b, $00                                   ; $739D: $06 $00
    ld   hl, Data_003_73E7                        ; $739F: $21 $E7 $73
    add  hl, bc                                   ; $73A2: $09
    ld   a, [hl]                                  ; $73A3: $7E
    ld   hl, wEntitiesDroppedItemTable            ; $73A4: $21 $E0 $C4
    add  hl, de                                   ; $73A7: $19
    ld   [hl], a                                  ; $73A8: $77
    pop  bc                                       ; $73A9: $C1

jr_003_73AA:
    dec  e                                        ; $73AA: $1D
    ld   a, e                                     ; $73AB: $7B
    cp   $FF                                      ; $73AC: $FE $FF
    jr   nz, jr_003_736D                          ; $73AE: $20 $BD

    ld   hl, wEntitiesDroppedItemTable            ; $73B0: $21 $E0 $C4
    add  hl, bc                                   ; $73B3: $09
    ld   [hl], ENTITY_DROPPABLE_RUPEE             ; $73B4: $36 $2E

jr_003_73B6:
    ld   hl, wEntitiesTypeTable                   ; $73B6: $21 $A0 $C3
    add  hl, bc                                   ; $73B9: $09
    ld   a, [hl]                                  ; $73BA: $7E
    ld   hl, wEntitiesFlashCountdownTable         ; $73BB: $21 $20 $C4
    add  hl, bc                                   ; $73BE: $09
    cp   $E6                                      ; $73BF: $FE $E6
    jr   nz, jr_003_73CC                          ; $73C1: $20 $09

    ld   a, [wFinalNightmareForm]                 ; $73C3: $FA $19 $D2
    cp   $03                                      ; $73C6: $FE $03
    jr   z, jr_003_73D0                           ; $73C8: $28 $06

    jr   jr_003_73D9                              ; $73CA: $18 $0D

jr_003_73CC:
    cp   $59                                      ; $73CC: $FE $59
    jr   nz, jr_003_73D9                          ; $73CE: $20 $09

jr_003_73D0:
    ld   [hl], $28                                ; $73D0: $36 $28
    ld   hl, wEntitiesPrivateCountdown2Table      ; $73D2: $21 $00 $C3
    add  hl, bc                                   ; $73D5: $09
    ld   [hl], $C8                                ; $73D6: $36 $C8
    ret                                           ; $73D8: $C9

jr_003_73D9:
    ld   [hl], $18                                ; $73D9: $36 $18

func_003_73DB::
    ld   hl, wEntitiesUnknowTableZ                ; $73DB: $21 $A0 $C4
    add  hl, bc                                   ; $73DE: $09
    ld   [hl], b                                  ; $73DF: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $73E0: $21 $10 $C4
    add  hl, bc                                   ; $73E3: $09
    ld   [hl], $0A                                ; $73E4: $36 $0A

label_003_73E6:
    ret                                           ; $73E6: $C9

Data_003_73E7::
    db   $2D, $2E, $38, $37

func_003_73EB::
    ld   hl, $C1AC                                ; $73EB: $21 $AC $C1
    ld   a, [$C13E]                               ; $73EE: $FA $3E $C1
    or   [hl]                                     ; $73F1: $B6
    ld   hl, hFFB6                                ; $73F2: $21 $B6 $FF
    or   [hl]                                     ; $73F5: $B6
    ld   hl, wIsUsingSpinAttack                   ; $73F6: $21 $21 $C1
    or   [hl]                                     ; $73F9: $B6
    jp   nz, label_003_74E1                       ; $73FA: $C2 $E1 $74

    ld   a, [$C140]                               ; $73FD: $FA $40 $C1
    cp   $00                                      ; $7400: $FE $00
    jp   z, label_003_74E1                        ; $7402: $CA $E1 $74

    ld   hl, wEntitiesDirectionTable              ; $7405: $21 $80 $C3
    add  hl, bc                                   ; $7408: $09
    ldh  a, [hLinkDirection]                      ; $7409: $F0 $9E
    cp   [hl]                                     ; $740B: $BE
    jp   z, label_003_74E1                        ; $740C: $CA $E1 $74

    ld   de, hActiveEntityPosX                    ; $740F: $11 $EE $FF
    ld   hl, $D5C0                                ; $7412: $21 $C0 $D5
    ld   a, [de]                                  ; $7415: $1A
    add  [hl]                                     ; $7416: $86
    push hl                                       ; $7417: $E5
    ld   hl, $C140                                ; $7418: $21 $40 $C1
    sub  [hl]                                     ; $741B: $96
    cp   $80                                      ; $741C: $FE $80
    jr   c, jr_003_7422                           ; $741E: $38 $02

    cpl                                           ; $7420: $2F
    inc  a                                        ; $7421: $3C

jr_003_7422:
    pop  hl                                       ; $7422: $E1
    push af                                       ; $7423: $F5
    inc  hl                                       ; $7424: $23
    ld   a, [$C141]                               ; $7425: $FA $41 $C1
    add  [hl]                                     ; $7428: $86
    ld   e, a                                     ; $7429: $5F
    pop  af                                       ; $742A: $F1
    cp   e                                        ; $742B: $BB
    jp   nc, label_003_74E1                       ; $742C: $D2 $E1 $74

    inc  hl                                       ; $742F: $23
    ld   de, hActiveEntityVisualPosY              ; $7430: $11 $EC $FF
    ld   a, [de]                                  ; $7433: $1A
    add  [hl]                                     ; $7434: $86
    push hl                                       ; $7435: $E5
    ld   hl, $C142                                ; $7436: $21 $42 $C1
    sub  [hl]                                     ; $7439: $96
    cp   $80                                      ; $743A: $FE $80
    jr   c, jr_003_7440                           ; $743C: $38 $02

    cpl                                           ; $743E: $2F
    inc  a                                        ; $743F: $3C

jr_003_7440:
    pop  hl                                       ; $7440: $E1
    push af                                       ; $7441: $F5
    inc  hl                                       ; $7442: $23
    ld   a, [wIsLinkInTheAir]                     ; $7443: $FA $43 $C1
    add  [hl]                                     ; $7446: $86
    ld   e, a                                     ; $7447: $5F
    pop  af                                       ; $7448: $F1
    cp   e                                        ; $7449: $BB
    jp   nc, label_003_74E1                       ; $744A: $D2 $E1 $74

    call ResetPegasusBoots                        ; $744D: $CD $B6 $0C
    ld   a, $08                                   ; $7450: $3E $08
    ld   [$C13E], a                               ; $7452: $EA $3E $C1
    ld   a, $12                                   ; $7455: $3E $12
    call func_003_7565                            ; $7457: $CD $65 $75
    ld   a, $18                                   ; $745A: $3E $18
    call GetVectorTowardsLink                     ; $745C: $CD $45 $7E
    ldh  a, [hScratch0]                           ; $745F: $F0 $D7
    cpl                                           ; $7461: $2F
    inc  a                                        ; $7462: $3C
    ld   hl, wEntitiesUnknowTableS                ; $7463: $21 $00 $C4
    add  hl, bc                                   ; $7466: $09
    ld   [hl], a                                  ; $7467: $77
    ldh  a, [hScratch1]                           ; $7468: $F0 $D8
    cpl                                           ; $746A: $2F
    inc  a                                        ; $746B: $3C
    ld   hl, $C3F0                                ; $746C: $21 $F0 $C3
    add  hl, bc                                   ; $746F: $09
    ld   [hl], a                                  ; $7470: $77
    call func_003_73DB                            ; $7471: $CD $DB $73
    ld   [hl], $08                                ; $7474: $36 $08
    xor  a                                        ; $7476: $AF
    ld   [wSwordCharge], a                        ; $7477: $EA $22 $C1
    call func_C50                                 ; $747A: $CD $50 $0C
    ld   hl, wIsUsingSpinAttack                   ; $747D: $21 $21 $C1
    ld   a, [wC16A]                               ; $7480: $FA $6A $C1
    or   [hl]                                     ; $7483: $B6
    jr   z, jr_003_748B                           ; $7484: $28 $05

    ld   a, $0C                                   ; $7486: $3E $0C
    ld   [wC16D], a                               ; $7488: $EA $6D $C1

jr_003_748B:
    ldh  a, [hActiveEntityType]                   ; $748B: $F0 $EB
    cp   ENTITY_BLAINO                            ; $748D: $FE $BE
    jr   nz, jr_003_74C1                          ; $748F: $20 $30

    ld   a, JINGLE_BUMP                           ; $7491: $3E $09
    ldh  [hJingle], a                             ; $7493: $E0 $F2
    ld   a, [$D205]                               ; $7495: $FA $05 $D2
    cp   $00                                      ; $7498: $FE $00
    jr   z, jr_003_74BF                           ; $749A: $28 $23

    cp   $01                                      ; $749C: $FE $01
    jr   z, jr_003_74B5                           ; $749E: $28 $15

    cp   $04                                      ; $74A0: $FE $04
    jr   z, jr_003_74B5                           ; $74A2: $28 $11

    cp   $03                                      ; $74A4: $FE $03
    jp   z, jr_003_7571                           ; $74A6: $CA $71 $75

    ld   a, $20                                   ; $74A9: $3E $20
    ld   [$C13E], a                               ; $74AB: $EA $3E $C1
    ld   a, $20                                   ; $74AE: $3E $20
    call func_003_7565                            ; $74B0: $CD $65 $75
    jr   jr_003_74DC                              ; $74B3: $18 $27

jr_003_74B5:
    ld   a, $10                                   ; $74B5: $3E $10
    ld   [$C13E], a                               ; $74B7: $EA $3E $C1
    ld   a, $20                                   ; $74BA: $3E $20
    call func_003_7565                            ; $74BC: $CD $65 $75

jr_003_74BF:
    jr   jr_003_74DC                              ; $74BF: $18 $1B

jr_003_74C1:
    ldh  a, [hLinkDirection]                      ; $74C1: $F0 $9E
    ld   e, a                                     ; $74C3: $5F
    ld   d, b                                     ; $74C4: $50
    ld   hl, Data_003_74E4                        ; $74C5: $21 $E4 $74
    add  hl, de                                   ; $74C8: $19
    ld   a, [$C140]                               ; $74C9: $FA $40 $C1
    add  [hl]                                     ; $74CC: $86
    ldh  [hScratch0], a                           ; $74CD: $E0 $D7
    ld   hl, Data_003_74E8                        ; $74CF: $21 $E8 $74
    add  hl, de                                   ; $74D2: $19
    ld   a, [$C142]                               ; $74D3: $FA $42 $C1
    add  [hl]                                     ; $74D6: $86
    ldh  [hScratch1], a                           ; $74D7: $E0 $D8
    call label_D15                                ; $74D9: $CD $15 $0D

jr_003_74DC:
    ld   a, $0C                                   ; $74DC: $3E $0C
    ldh  [hFFB6], a                               ; $74DE: $E0 $B6
    ret                                           ; $74E0: $C9

label_003_74E1:
    jp   label_003_74EC                           ; $74E1: $C3 $EC $74

Data_003_74E4::
    db   $00, $F0, $F8, $FC

Data_003_74E8::
    db   $FC, $FC, $F0, $00

label_003_74EC:
    ldh  a, [hFrameCounter]                       ; $74EC: $F0 $E7
    xor  c                                        ; $74EE: $A9
    rra                                           ; $74EF: $1F
    jr   nc, jr_003_7570                          ; $74F0: $30 $7E

    ldh  a, [hLinkPositionX]                      ; $74F2: $F0 $98
    add  $08                                      ; $74F4: $C6 $08
    ldh  [hScratch0], a                           ; $74F6: $E0 $D7
    ldh  a, [hLinkPositionY]                      ; $74F8: $F0 $99
    add  $08                                      ; $74FA: $C6 $08
    ldh  [hScratch2], a                           ; $74FC: $E0 $D9
    ld   de, hActiveEntityPosX                    ; $74FE: $11 $EE $FF
    ld   hl, $D5C0                                ; $7501: $21 $C0 $D5
    ld   a, [de]                                  ; $7504: $1A
    add  [hl]                                     ; $7505: $86
    push hl                                       ; $7506: $E5
    ld   hl, hScratch0                            ; $7507: $21 $D7 $FF
    sub  [hl]                                     ; $750A: $96
    cp   $80                                      ; $750B: $FE $80
    jr   c, jr_003_7511                           ; $750D: $38 $02

    cpl                                           ; $750F: $2F
    inc  a                                        ; $7510: $3C

jr_003_7511:
    pop  hl                                       ; $7511: $E1
    push af                                       ; $7512: $F5
    inc  hl                                       ; $7513: $23
    ld   a, $04                                   ; $7514: $3E $04
    add  [hl]                                     ; $7516: $86
    ld   e, a                                     ; $7517: $5F
    pop  af                                       ; $7518: $F1
    cp   e                                        ; $7519: $BB
    jr   nc, jr_003_7570                          ; $751A: $30 $54

    inc  hl                                       ; $751C: $23
    ld   de, hActiveEntityVisualPosY              ; $751D: $11 $EC $FF
    ld   a, [de]                                  ; $7520: $1A
    add  [hl]                                     ; $7521: $86
    push hl                                       ; $7522: $E5
    ld   hl, hScratch2                            ; $7523: $21 $D9 $FF
    sub  [hl]                                     ; $7526: $96
    cp   $80                                      ; $7527: $FE $80
    jr   c, jr_003_752D                           ; $7529: $38 $02

    cpl                                           ; $752B: $2F
    inc  a                                        ; $752C: $3C

jr_003_752D:
    pop  hl                                       ; $752D: $E1
    push af                                       ; $752E: $F5
    inc  hl                                       ; $752F: $23
    ld   a, $05                                   ; $7530: $3E $05
    add  [hl]                                     ; $7532: $86
    ld   e, a                                     ; $7533: $5F
    pop  af                                       ; $7534: $F1
    cp   e                                        ; $7535: $BB
    jr   nc, jr_003_7570                          ; $7536: $30 $38

    ld   a, [wInvincibilityCounter]               ; $7538: $FA $C7 $DB
    and  a                                        ; $753B: $A7
    jr   nz, jr_003_7570                          ; $753C: $20 $32

    call ApplyLinkCollisionWithEnemy              ; $753E: $CD $D5 $6C
    ldh  a, [hActiveEntityType]                   ; $7541: $F0 $EB
    cp   ENTITY_BLAINO                            ; $7543: $FE $BE
    jr   nz, jr_003_7570                          ; $7545: $20 $29

    ld   a, [$D205]                               ; $7547: $FA $05 $D2
    and  a                                        ; $754A: $A7
    jr   z, jr_003_7570                           ; $754B: $28 $23

    cp   $01                                      ; $754D: $FE $01
    jr   z, jr_003_7570                           ; $754F: $28 $1F

    cp   $04                                      ; $7551: $FE $04
    jr   z, jr_003_7570                           ; $7553: $28 $1B

    cp   $02                                      ; $7555: $FE $02
    jr   nz, jr_003_7571                          ; $7557: $20 $18

    call GetEntityPrivateCountdown1               ; $7559: $CD $00 $0C
    ld   [hl], $A0                                ; $755C: $36 $A0
    ld   a, $20                                   ; $755E: $3E $20
    ld   [$C13E], a                               ; $7560: $EA $3E $C1
    ld   a, $30                                   ; $7563: $3E $30

func_003_7565::
    call GetVectorTowardsLink                     ; $7565: $CD $45 $7E
    ldh  a, [hScratch0]                           ; $7568: $F0 $D7
    ldh  [hLinkPositionYIncrement], a             ; $756A: $E0 $9B
    ldh  a, [hScratch1]                           ; $756C: $F0 $D8
    ldh  [hLinkPositionXIncrement], a             ; $756E: $E0 $9A

jr_003_7570:
    ret                                           ; $7570: $C9

jr_003_7571:
    ld   hl, wEntitiesUnknowTableY                ; $7571: $21 $D0 $C3
    add  hl, bc                                   ; $7574: $09
    ld   a, [hl]                                  ; $7575: $7E
    cp   $22                                      ; $7576: $FE $22
    jr   c, jr_003_7570                           ; $7578: $38 $F6

    ld   a, $0A                                   ; $757A: $3E $0A
    ld   [wLinkMotionState], a                    ; $757C: $EA $1C $C1
    ld   hl, wEntitiesDirectionTable              ; $757F: $21 $80 $C3
    add  hl, bc                                   ; $7582: $09
    ld   a, [hl]                                  ; $7583: $7E
    and  a                                        ; $7584: $A7
    ld   a, $30                                   ; $7585: $3E $30
    jr   z, jr_003_758B                           ; $7587: $28 $02

    ld   a, $D0                                   ; $7589: $3E $D0

jr_003_758B:
    ldh  [hLinkPositionXIncrement], a             ; $758B: $E0 $9A
    xor  a                                        ; $758D: $AF
    ldh  [hLinkPositionYIncrement], a             ; $758E: $E0 $9B
    ld   a, $30                                   ; $7590: $3E $30
    ldh  [$FFA3], a                               ; $7592: $E0 $A3
    ld   a, JINGLE_HUGE_BUMP                      ; $7594: $3E $0B
    ldh  [hJingle], a                             ; $7596: $E0 $F2
    ret                                           ; $7598: $C9

    ld   a, $20                                   ; $7599: $3E $20
    ld   [$C13E], a                               ; $759B: $EA $3E $C1
    ld   a, $20                                   ; $759E: $3E $20
    jr   func_003_7565                            ; $75A0: $18 $C3

; Check collision with other entities?
; Inputs:
;   c :  entity index
func_003_75A2::
    ld   e, $0F                                   ; $75A2: $1E $0F
    ld   d, $00                                   ; $75A4: $16 $00

    ; For each entity…
entitiesLoop:
    ; If we are checking collision against ourselves,
    ; move to the next entity
    ld   a, e                                     ; $75A6: $7B
    cp   c                                        ; $75A7: $B9
    jp   z, checkNextEntity                       ; $75A8: $CA $9F $77

    ; If we are on an even frame, move to next
    ldh  a, [hFrameCounter]                       ; $75AB: $F0 $E7
    xor  e                                        ; $75AD: $AB
    and  $01                                      ; $75AE: $E6 $01
    jp   nz, checkNextEntity                       ; $75B0: $C2 $9F $77

    ; If the entity is not interactive, move to next
    ld   hl, wEntitiesStatusTable                        ; $75B3: $21 $80 $C2
    add  hl, de                                   ; $75B6: $19
    ld   a, [hl]                                  ; $75B7: $7E
    cp   ENTITY_STATUS_ACTIVE                      ; $75B8: $FE $05
    jp   c, checkNextEntity                    ; $75BA: $DA $9F $77

    ; If wEntitiesPhysicsFlagsTable[de] is not 0, move to next
    ld   hl, wEntitiesPhysicsFlagsTable                ; $75BD: $21 $40 $C3
    add  hl, de                                   ; $75C0: $19
    ld   a, [hl]                                  ; $75C1: $7E
    and  $40                                      ; $75C2: $E6 $40
    jp   nz, checkNextEntity                      ; $75C4: $C2 $9F $77

    ; If the entities X are far appart, move to next
    ld   hl, wEntitiesPosXTable                         ; $75C7: $21 $00 $C2
    add  hl, de                                   ; $75CA: $19
    ldh  a, [hActiveEntityPosX]                   ; $75CB: $F0 $EE
    sub  [hl]                                     ; $75CD: $96
    add  $0C                                      ; $75CE: $C6 $0C
    cp   $18                                      ; $75D0: $FE $18
    jp   nc, checkNextEntity                       ; $75D2: $D2 $9F $77

    ; If the entitiesY are far appart, more to next
    ld   hl, wEntitiesPosYTable                         ; $75D5: $21 $10 $C2
    add  hl, de                                   ; $75D8: $19
    ld   a, [hl]                                  ; $75D9: $7E
    ld   hl, wEntitiesPosZTable                   ; $75DA: $21 $10 $C3
    add  hl, de                                   ; $75DD: $19
    sub  [hl]                                     ; $75DE: $96
    ld   hl, hActiveEntityVisualPosY              ; $75DF: $21 $EC $FF
    sub  [hl]                                     ; $75E2: $96
    add  $0C                                      ; $75E3: $C6 $0C
    cp   $18                                      ; $75E5: $FE $18
    jp   nc, checkNextEntity                       ; $75E7: $D2 $9F $77

    ; If wEntitiesSpriteVariantTable is $FF, move to next
    ld   hl, wEntitiesSpriteVariantTable               ; $75EA: $21 $B0 $C3
    add  hl, de                                   ; $75ED: $19
    ld   a, [hl]                                  ; $75EE: $7E
    cp   $FF                                      ; $75EF: $FE $FF
    jp   z, checkNextEntity                        ; $75F1: $CA $9F $77

    ; If the active entity is a Bouncing Bombite…
    ldh  a, [hActiveEntityType]                     ; $75F4: $F0 $EB
    cp   ENTITY_BOUNCING_BOMBITE                  ; $75F6: $FE $55
    jr   nz, .selfBombiteEnd                          ; $75F8: $20 $04
    ; wEntitiesSpriteVariantTable[de] = GetEntityTransitionCountdown
    call GetEntityTransitionCountdown                 ; $75FA: $CD $05 $0C
    ld   [hl], b                                  ; $75FD: $70
.selfBombiteEnd

    ; If the collisionned entity is a Bouncing Bombite…
    ld   hl, wEntitiesTypeTable                   ; $75FE: $21 $A0 $C3
    add  hl, de                                   ; $7601: $19
    ld   a, [hl]                                  ; $7602: $7E
    cp   ENTITY_BOUNCING_BOMBITE                  ; $7603: $FE $55
    jr   nz, .bombiteEnd                          ; $7605: $20 $29

    ld   hl, wEntitiesSpeedXTable                       ; $7607: $21 $40 $C2
    add  hl, bc                                   ; $760A: $09
    ld   a, [hl]                                  ; $760B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $760C: $21 $40 $C2
    add  hl, de                                   ; $760F: $19
    ld   [hl], a                                  ; $7610: $77
    ld   hl, wEntitiesSpeedYTable                 ; $7611: $21 $50 $C2
    add  hl, bc                                   ; $7614: $09
    ld   a, [hl]                                  ; $7615: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7616: $21 $50 $C2
    add  hl, de                                   ; $7619: $19
    ld   [hl], a                                  ; $761A: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $761B: $21 $E0 $C2
    add  hl, de                                   ; $761E: $19
    ld   [hl], $40                                ; $761F: $36 $40
    ld   hl, wEntitiesStateTable                  ; $7621: $21 $90 $C2
    add  hl, de                                   ; $7624: $19
    ld   [hl], $02                                ; $7625: $36 $02
    ld   hl, wEntitiesPrivateCountdown1Table      ; $7627: $21 $F0 $C2
    add  hl, de                                   ; $762A: $19
    ld   [hl], $08                                ; $762B: $36 $08

    jp   checkNextEntity                           ; $762D: $C3 $9F $77
.bombiteEnd

    ld   hl, wEntitiesPhysicsFlagsTable                ; $7630: $21 $40 $C3
    add  hl, de                                   ; $7633: $19
    ld   a, [hl]                                  ; $7634: $7E
    and  $20                                      ; $7635: $E6 $20
    jp   nz, label_003_7715                       ; $7637: $C2 $15 $77

    ldh  a, [hActiveEntityType]                   ; $763A: $F0 $EB
    cp   ENTITY_MAGIC_POWDER_SPRINKLE             ; $763C: $FE $08
    jr   z, forceCollisionEnd                     ; $763E: $28 $28

    ; If checking collisions against the Final Nightmare…
    ld   hl, wEntitiesTypeTable                   ; $7640: $21 $A0 $C3
    add  hl, de                                   ; $7643: $19
    ld   a, [hl]                                  ; $7644: $7E
    cp   ENTITY_FINAL_NIGHTMARE                   ; $7645: $FE $E6
    jr   nz, .finalNightmareEnd                   ; $7647: $20 $0D
    ; … and this is Final Nightmare final form…
    ld   a, [wFinalNightmareForm]                 ; $7649: $FA $19 $D2
    cp   $05                                      ; $764C: $FE $05
    jr   nz, .finalNightmareEnd                   ; $764E: $20 $06
    ; … and active sprite != 2…
    ldh  a, [hActiveEntitySpriteVariant]          ; $7650: $F0 $F1
    cp   $02                                      ; $7652: $FE $02
    ; … force a collisition.
    jr   nz, forceCollision                       ; $7654: $20 $09
.finalNightmareEnd

    ; If bit 7 of entity hitbox flag is set…
    ld   hl, wEntitiesHitboxFlagsTable            ; $7656: $21 $50 $C3
    add  hl, de                                   ; $7659: $19
    ld   a, [hl]                                  ; $765A: $7E
    and  $80                                      ; $765B: $E6 $80
    jr   z, forceCollisionEnd                     ; $765D: $28 $09
forceCollision:
    ld   hl, wEntitiesCollisionsTable             ; $765F: $21 $A0 $C2
    add  hl, bc                                   ; $7662: $09
    ld   [hl], $01                                ; $7663: $36 $01
    jp   jr_003_7737                              ; $7665: $C3 $37 $77
forceCollisionEnd:

    ldh  a, [hActiveEntityType]                   ; $7668: $F0 $EB
    cp   ENTITY_MAGIC_POWDER_SPRINKLE             ; $766A: $FE $08
    jr   nz, jr_003_76AC                          ; $766C: $20 $3E

    ld   hl, wEntitiesTypeTable                   ; $766E: $21 $A0 $C3
    add  hl, de                                   ; $7671: $19
    ld   a, [hl]                                  ; $7672: $7E
    cp   $CA                                      ; $7673: $FE $CA
    jr   nz, jr_003_7680                          ; $7675: $20 $09

    ld   hl, wEntitiesStateTable                  ; $7677: $21 $90 $C2
    add  hl, de                                   ; $767A: $19
    ld   a, [hl]                                  ; $767B: $7E
    and  a                                        ; $767C: $A7
    jr   nz, jr_003_76AC                          ; $767D: $20 $2D

    inc  [hl]                                     ; $767F: $34

jr_003_7680:
    cp   $3F                                      ; $7680: $FE $3F
    jr   nz, jr_003_76AC                          ; $7682: $20 $28

    ld   a, [wIsIndoor]                           ; $7684: $FA $A5 $DB
    and  a                                        ; $7687: $A7
    jr   nz, jr_003_76AC                          ; $7688: $20 $22

    ld   hl, wEntitiesStateTable                  ; $768A: $21 $90 $C2
    add  hl, de                                   ; $768D: $19
    ld   a, [hl]                                  ; $768E: $7E
    and  a                                        ; $768F: $A7
    jr   nz, jr_003_76AC                          ; $7690: $20 $1A

    inc  [hl]                                     ; $7692: $34
    ld   hl, wEntitiesDropTimerTable              ; $7693: $21 $50 $C4
    add  hl, de                                   ; $7696: $19
    ld   [hl], $7F                                ; $7697: $36 $7F
    ld   hl, wEntitiesFlashCountdownTable         ; $7699: $21 $20 $C4
    add  hl, de                                   ; $769C: $19
    ld   [hl], $10                                ; $769D: $36 $10
    ld   a, $03                                   ; $769F: $3E $03
    ld   [wCurrentBank], a                        ; $76A1: $EA $AF $DB
    call label_27F2                               ; $76A4: $CD $F2 $27
    ld   a, $18                                   ; $76A7: $3E $18
    ld   [wCurrentBank], a                        ; $76A9: $EA $AF $DB

jr_003_76AC:
    ld   hl, wEntitiesHitboxFlagsTable            ; $76AC: $21 $50 $C3
    add  hl, de                                   ; $76AF: $19
    ld   a, [hl]                                  ; $76B0: $7E
    and  $80                                      ; $76B1: $E6 $80
    jp   nz, checkNextEntity                      ; $76B3: $C2 $9F $77

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $76B6: $21 $10 $C4
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    and  a                                        ; $76BB: $A7
    jp   nz, checkNextEntity                      ; $76BC: $C2 $9F $77

    ld   hl, wEntitiesTypeTable                   ; $76BF: $21 $A0 $C3
    add  hl, de                                   ; $76C2: $19
    ld   a, [hl]                                  ; $76C3: $7E
    cp   $24                                      ; $76C4: $FE $24
    jr   nz, jr_003_7710                          ; $76C6: $20 $48

    ld   hl, wEntitiesDirectionTable              ; $76C8: $21 $80 $C3
    add  hl, de                                   ; $76CB: $19
    ld   a, [hl]                                  ; $76CC: $7E
    xor  $01                                      ; $76CD: $EE $01
    ld   hl, wEntitiesDirectionTable              ; $76CF: $21 $80 $C3
    add  hl, bc                                   ; $76D2: $09
    cp   [hl]                                     ; $76D3: $BE
    jr   nz, jr_003_7710                          ; $76D4: $20 $3A

    ld   hl, wEntitiesPrivateState2Table          ; $76D6: $21 $C0 $C2
    add  hl, de                                   ; $76D9: $19
    ld   a, [hl]                                  ; $76DA: $7E
    and  a                                        ; $76DB: $A7
    jr   nz, jr_003_7710                          ; $76DC: $20 $32

    ldh  a, [hActiveEntityType]                   ; $76DE: $F0 $EB
    cp   ENTITY_HOOKSHOT_CHAIN                    ; $76E0: $FE $03
    jp   nz, forceCollision                       ; $76E2: $C2 $5F $76

    ld   [hl], $01                                ; $76E5: $36 $01
    push de                                       ; $76E7: $D5

    ld   a, ENTITY_32                             ; $76E8: $3E $32
    call SpawnNewEntity                           ; $76EA: $CD $CA $64
    jr   c, jr_003_770D                           ; $76ED: $38 $1E

    ldh  a, [hScratch0]                           ; $76EF: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $76F1: $21 $00 $C2
    add  hl, de                                   ; $76F4: $19
    ld   [hl], a                                  ; $76F5: $77
    ldh  a, [hScratch1]                           ; $76F6: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $76F8: $21 $10 $C2
    add  hl, de                                   ; $76FB: $19
    ld   [hl], a                                  ; $76FC: $77
    ld   hl, wEntitiesUnknowTableR                ; $76FD: $21 $90 $C3
    add  hl, de                                   ; $7700: $19
    ld   a, c                                     ; $7701: $79
    inc  a                                        ; $7702: $3C
    ld   [hl], a                                  ; $7703: $77
    ldh  a, [hScratch2]                           ; $7704: $F0 $D9
    and  $01                                      ; $7706: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ; $7708: $21 $B0 $C3
    add  hl, de                                   ; $770B: $19
    ld   [hl], a                                  ; $770C: $77

jr_003_770D:
    pop  de                                       ; $770D: $D1
    jr   jr_003_7737                              ; $770E: $18 $27

jr_003_7710:
    call func_003_77A7                            ; $7710: $CD $A7 $77
    jr   jr_003_7737                              ; $7713: $18 $22

label_003_7715:
    ldh  a, [hActiveEntityType]                   ; $7715: $F0 $EB
    cp   ENTITY_BOOMERANG                         ; $7717: $FE $01
    jr   z, jr_003_771F                           ; $7719: $28 $04

    cp   ENTITY_HOOKSHOT_CHAIN                    ; $771B: $FE $03
    jr   nz, jr_003_7734                          ; $771D: $20 $15

jr_003_771F:
    call GetEntityTransitionCountdown             ; $771F: $CD $05 $0C
    xor  a                                        ; $7722: $AF
    ld   [hl], a                                  ; $7723: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7724: $21 $40 $C3
    add  hl, de                                   ; $7727: $19
    ld   a, [hl]                                  ; $7728: $7E
    and  $20                                      ; $7729: $E6 $20
    jr   z, jr_003_7737                           ; $772B: $28 $0A

    ld   a, c                                     ; $772D: $79
    inc  a                                        ; $772E: $3C
    ld   hl, wEntitiesUnknowTableR                ; $772F: $21 $90 $C3
    add  hl, de                                   ; $7732: $19
    ld   [hl], a                                  ; $7733: $77

jr_003_7734:
    jp   checkNextEntity                          ; $7734: $C3 $9F $77

jr_003_7737:
    ldh  a, [hActiveEntityType]                   ; $7737: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $7739: $FE $A8
    jr   z, jr_003_775A                           ; $773B: $28 $1D

    cp   ENTITY_BOOMERANG                         ; $773D: $FE $01
    jr   z, jr_003_779A                           ; $773F: $28 $59

    cp   ENTITY_HOOKSHOT_CHAIN                    ; $7741: $FE $03
    jr   z, jr_003_779A                           ; $7743: $28 $55

    cp   ENTITY_ENTITY_LIFTABLE_ROCK              ; $7745: $FE $05
    jr   nz, jr_003_7751                          ; $7747: $20 $08

    push de                                       ; $7749: $D5
    call func_003_53E4                            ; $774A: $CD $E4 $53
    pop  de                                       ; $774D: $D1
    jp   checkNextEntity                          ; $774E: $C3 $9F $77

jr_003_7751:
    ld   hl, wEntitiesStatusTable                 ; $7751: $21 $80 $C2
    add  hl, bc                                   ; $7754: $09
    ld   a, [hl]                                  ; $7755: $7E
    cp   $08                                      ; $7756: $FE $08
    jr   nz, jr_003_7782                          ; $7758: $20 $28

jr_003_775A:
    ld   hl, wEntitiesUnknowTableV                ; $775A: $21 $80 $C4
    add  hl, bc                                   ; $775D: $09
    ld   a, [hl]                                  ; $775E: $7E
    and  a                                        ; $775F: $A7
    jr   nz, checkNextEntity                      ; $7760: $20 $3D

    ld   [hl], $0C                                ; $7762: $36 $0C
    ld   hl, wEntitiesSpeedXTable                 ; $7764: $21 $40 $C2
    add  hl, bc                                   ; $7767: $09
    sra  [hl]                                     ; $7768: $CB $2E
    sra  [hl]                                     ; $776A: $CB $2E
    ld   a, [hl]                                  ; $776C: $7E
    cpl                                           ; $776D: $2F
    ld   [hl], a                                  ; $776E: $77
    ld   hl, wEntitiesSpeedYTable                 ; $776F: $21 $50 $C2
    add  hl, bc                                   ; $7772: $09
    sra  [hl]                                     ; $7773: $CB $2E
    sra  [hl]                                     ; $7775: $CB $2E
    ld   a, [hl]                                  ; $7777: $7E
    cpl                                           ; $7778: $2F
    ld   [hl], a                                  ; $7779: $77
    ld   hl, $C5D0                                ; $777A: $21 $D0 $C5
    add  hl, bc                                   ; $777D: $09
    ld   [hl], $FF                                ; $777E: $36 $FF
    jr   jr_003_779A                              ; $7780: $18 $18

jr_003_7782:
    ld   hl, wEntitiesCollisionsTable             ; $7782: $21 $A0 $C2
    add  hl, bc                                   ; $7785: $09
    ld   a, [hl]                                  ; $7786: $7E
    and  a                                        ; $7787: $A7
    jr   nz, jr_003_779A                          ; $7788: $20 $10

    ldh  a, [hActiveEntityType]                   ; $778A: $F0 $EB
    cp   ENTITY_ARROW                             ; $778C: $FE $00
    jr   nz, jr_003_7795                          ; $778E: $20 $05

    ldh  a, [hActiveEntityState]                  ; $7790: $F0 $F0
    and  a                                        ; $7792: $A7
    jr   nz, jr_003_7798                          ; $7793: $20 $03

jr_003_7795:
    call UnloadEntity                             ; $7795: $CD $8D $3F

jr_003_7798:
    jr   checkNextEntity                          ; $7798: $18 $05

jr_003_779A:
    call GetEntityTransitionCountdown             ; $779A: $CD $05 $0C
    xor  a                                        ; $779D: $AF
    ld   [hl], a                                  ; $779E: $77

checkNextEntity:
    dec  e                                        ; $779F: $1D
    ld   a, e                                     ; $77A0: $7B
    cp   $FF                                      ; $77A1: $FE $FF
    jp   nz, entitiesLoop                         ; $77A3: $C2 $A6 $75

    ret                                           ; $77A6: $C9

func_003_77A7::
    ldh  a, [hActiveEntityType]                   ; $77A7: $F0 $EB
    cp   ENTITY_ARROW                             ; $77A9: $FE $00
    jr   nz, jr_003_77B8                          ; $77AB: $20 $0B

    ldh  a, [hActiveEntityState]                  ; $77AD: $F0 $F0
    and  a                                        ; $77AF: $A7
    jr   z, jr_003_77B8                           ; $77B0: $28 $06

    call GetEntityTransitionCountdown             ; $77B2: $CD $05 $0C
    ld   [hl], $03                                ; $77B5: $36 $03
    ret                                           ; $77B7: $C9

jr_003_77B8:
    ld   hl, wEntitiesSpeedXTable                 ; $77B8: $21 $40 $C2
    add  hl, bc                                   ; $77BB: $09
    ld   a, [hl]                                  ; $77BC: $7E
    ld   hl, $C3F0                                ; $77BD: $21 $F0 $C3
    add  hl, de                                   ; $77C0: $19
    ld   [hl], a                                  ; $77C1: $77
    ld   hl, wEntitiesSpeedYTable                 ; $77C2: $21 $50 $C2
    add  hl, bc                                   ; $77C5: $09
    ld   a, [hl]                                  ; $77C6: $7E
    ld   hl, wEntitiesUnknowTableS                ; $77C7: $21 $00 $C4
    add  hl, de                                   ; $77CA: $19
    ld   [hl], a                                  ; $77CB: $77
    push bc                                       ; $77CC: $C5
    ld   c, e                                     ; $77CD: $4B
    ld   b, d                                     ; $77CE: $42
    push de                                       ; $77CF: $D5
    call func_003_77D6                            ; $77D0: $CD $D6 $77
    pop  de                                       ; $77D3: $D1
    pop  bc                                       ; $77D4: $C1
    ret                                           ; $77D5: $C9

func_003_77D6::
    jp   label_003_71C0                           ; $77D6: $C3 $C0 $71

func_003_77D9::
    ld   e, $0F                                   ; $77D9: $1E $0F
    ld   d, $00                                   ; $77DB: $16 $00

jr_003_77DD:
    ld   hl, wEntitiesStatusTable                 ; $77DD: $21 $80 $C2
    add  hl, de                                   ; $77E0: $19
    ld   a, [hl]                                  ; $77E1: $7E
    cp   $05                                      ; $77E2: $FE $05
    jr   c, jr_003_7834                           ; $77E4: $38 $4E

    ld   hl, wEntitiesPhysicsFlagsTable           ; $77E6: $21 $40 $C3
    add  hl, de                                   ; $77E9: $19
    ld   a, [hl]                                  ; $77EA: $7E
    and  $60                                      ; $77EB: $E6 $60
    jr   nz, jr_003_7834                          ; $77ED: $20 $45

    ld   hl, wEntitiesHitboxFlagsTable            ; $77EF: $21 $50 $C3
    add  hl, de                                   ; $77F2: $19
    ld   a, [hl]                                  ; $77F3: $7E
    and  $80                                      ; $77F4: $E6 $80
    jr   nz, jr_003_7834                          ; $77F6: $20 $3C

    ld   hl, wEntitiesPosXTable                   ; $77F8: $21 $00 $C2
    add  hl, de                                   ; $77FB: $19
    ldh  a, [hActiveEntityPosX]                   ; $77FC: $F0 $EE
    sub  [hl]                                     ; $77FE: $96
    add  $18                                      ; $77FF: $C6 $18
    cp   $30                                      ; $7801: $FE $30
    jr   nc, jr_003_7834                          ; $7803: $30 $2F

    ld   hl, wEntitiesPosYTable                   ; $7805: $21 $10 $C2
    add  hl, de                                   ; $7808: $19
    ld   a, [hl]                                  ; $7809: $7E
    ld   hl, wEntitiesPosZTable                   ; $780A: $21 $10 $C3
    add  hl, de                                   ; $780D: $19
    sub  [hl]                                     ; $780E: $96
    ld   hl, hActiveEntityVisualPosY              ; $780F: $21 $EC $FF
    sub  [hl]                                     ; $7812: $96
    add  $18                                      ; $7813: $C6 $18
    cp   $30                                      ; $7815: $FE $30
    jr   nc, jr_003_7834                          ; $7817: $30 $1B

    ld   a, $07                                   ; $7819: $3E $07
    ld   [$C19E], a                               ; $781B: $EA $9E $C1
    call func_003_77A7                            ; $781E: $CD $A7 $77
    ld   a, $30                                   ; $7821: $3E $30
    call func_003_783B                            ; $7823: $CD $3B $78
    ld   hl, wEntitiesUnknowTableS                ; $7826: $21 $00 $C4
    add  hl, de                                   ; $7829: $19
    ldh  a, [hScratch0]                           ; $782A: $F0 $D7
    ld   [hl], a                                  ; $782C: $77
    ld   hl, $C3F0                                ; $782D: $21 $F0 $C3
    add  hl, de                                   ; $7830: $19
    ldh  a, [hScratch1]                           ; $7831: $F0 $D8
    ld   [hl], a                                  ; $7833: $77

jr_003_7834:
    dec  e                                        ; $7834: $1D
    ld   a, e                                     ; $7835: $7B
    cp   $FF                                      ; $7836: $FE $FF
    jr   nz, jr_003_77DD                          ; $7838: $20 $A3

    ret                                           ; $783A: $C9

func_003_783B::
    ldh  [hScratch0], a                           ; $783B: $E0 $D7
    ldh  a, [hLinkPositionX]                      ; $783D: $F0 $98
    push af                                       ; $783F: $F5
    ld   hl, wEntitiesPosXTable                   ; $7840: $21 $00 $C2
    add  hl, de                                   ; $7843: $19
    ld   a, [hl]                                  ; $7844: $7E
    ldh  [hLinkPositionX], a                      ; $7845: $E0 $98
    ldh  a, [hLinkPositionY]                      ; $7847: $F0 $99
    push af                                       ; $7849: $F5
    ld   hl, wEntitiesPosYTable                   ; $784A: $21 $10 $C2
    add  hl, de                                   ; $784D: $19
    ld   a, [hl]                                  ; $784E: $7E
    ldh  [hLinkPositionY], a                      ; $784F: $E0 $99
    push de                                       ; $7851: $D5
    ldh  a, [hScratch0]                           ; $7852: $F0 $D7
    call GetVectorTowardsLink                     ; $7854: $CD $45 $7E
    pop  de                                       ; $7857: $D1
    pop  af                                       ; $7858: $F1
    ldh  [hLinkPositionY], a                      ; $7859: $E0 $99
    pop  af                                       ; $785B: $F1
    ldh  [hLinkPositionX], a                      ; $785C: $E0 $98
    ret                                           ; $785E: $C9

; Entities collision mask?
Data_003_785F::
    db   $0D, $02, $08, $08, $0A, $06, $08, $08, $10, $FF, $08, $08, $0D, $02, $08, $08

Data_003_786F::
    db   $08, $08, $02, $0D, $08, $08, $06, $0A, $08, $08, $FF, $10, $08, $08, $02, $0D

Data_003_787F::
    db   $01, $02, $04, $08

Data_003_7883::
    db   $00, $00, $FF, $01, $01, $FF, $01, $FF

Data_003_788B::
    db   $01, $FF, $00, $00, $01, $01, $FF, $FF

; Another function for entity physics
func_003_7893::
    ld   hl, wEntitiesUnknowTableI                ; $7893: $21 $70 $C4
    add  hl, bc                                   ; $7896: $09
    ld   a, [hl]                                  ; $7897: $7E
    ldh  [hScratch0], a                           ; $7898: $E0 $D7

    xor  a                                        ; $789A: $AF
    ld   [hl], a                                  ; $789B: $77
    ldh  [hScratch1], a                           ; $789C: $E0 $D8
    ld   [$C503], a                               ; $789E: $EA $03 $C5
    ld   [$C50D], a                               ; $78A1: $EA $0D $C5

    ; If entity Z & $80 == 0…
    ld   hl, wEntitiesPosZTable                   ; $78A4: $21 $10 $C3
    add  hl, bc                                   ; $78A7: $09
    ld   a, [hl]                                  ; $78A8: $7E
    bit  7, a                                     ; $78A9: $CB $7F
    jr   nz, jr_003_78B1                          ; $78AB: $20 $04
    ; … but entity Z != 0…
    and  a                                        ; $78AD: $A7
    jp   nz, jr_003_7A18                          ; $78AE: $C2 $18 $7A

jr_003_78B1:
    ld   hl, wEntitiesUnknowTableJ                ; $78B1: $21 $F0 $C4
    add  hl, bc                                   ; $78B4: $09
    ld   [hl], b                                  ; $78B5: $70
    ld   hl, wEntitiesUnknowTableH                ; $78B6: $21 $30 $C4
    add  hl, bc                                   ; $78B9: $09
    ld   a, [hl]                                  ; $78BA: $7E
    bit  4, a                                     ; $78BB: $CB $67
    jp   nz, jr_003_7A18                          ; $78BD: $C2 $18 $7A

    call func_003_7E0E                            ; $78C0: $CD $0E $7E
    jr   jr_003_78E3                              ; $78C3: $18 $1E

jr_003_78C5:
    ld   e, $02                                   ; $78C5: $1E $02
    ldh  a, [hActiveEntityType]                   ; $78C7: $F0 $EB
    cp   ENTITY_FISH                              ; $78C9: $FE $CC
    jr   z, jr_003_7907                           ; $78CB: $28 $3A

    cp   ENTITY_PEAHAT                            ; $78CD: $FE $A0
    jr   z, jr_003_7907                           ; $78CF: $28 $36

    cp   ENTITY_ROOSTER                           ; $78D1: $FE $D5
    jr   z, jr_003_7907                           ; $78D3: $28 $32

    cp   ENTITY_BOW_WOW                           ; $78D5: $FE $6D
    jr   z, jr_003_7907                           ; $78D7: $28 $2E

    cp   ENTITY_MARIN_AT_THE_SHORE                ; $78D9: $FE $C1
    jr   z, jr_003_7907                           ; $78DB: $28 $2A

    call UnloadEntity                             ; $78DD: $CD $8D $3F
    jp   label_003_795C                           ; $78E0: $C3 $5C $79

jr_003_78E3:
    ld   e, $01                                   ; $78E3: $1E $01
    ldh  a, [hObjectUnderEntity]                  ; $78E5: $F0 $AF
    cp   $67                                      ; $78E7: $FE $67
    jr   z, jr_003_7907                           ; $78E9: $28 $1C

    ldh  a, [hScratch3]                           ; $78EB: $F0 $DA
    and  a                                        ; $78ED: $A7
    jp   z, jr_003_7A18                           ; $78EE: $CA $18 $7A

    cp   $0B                                      ; $78F1: $FE $0B
    jr   z, jr_003_78C5                           ; $78F3: $28 $D0

    cp   $07                                      ; $78F5: $FE $07
    jr   z, jr_003_78C5                           ; $78F7: $28 $CC

    cp   $B0                                      ; $78F9: $FE $B0
    jr   z, jr_003_7907                           ; $78FB: $28 $0A

    inc  e                                        ; $78FD: $1C
    cp   $05                                      ; $78FE: $FE $05
    jr   z, jr_003_7907                           ; $7900: $28 $05

    cp   $06                                      ; $7902: $FE $06
    jr   nz, jr_003_790C                          ; $7904: $20 $06

    inc  e                                        ; $7906: $1C

jr_003_7907:
    ld   hl, wEntitiesUnknowTableI                ; $7907: $21 $70 $C4
    add  hl, bc                                   ; $790A: $09
    ld   [hl], e                                  ; $790B: $73

jr_003_790C:
    ld   hl, wEntitiesUnknowTableH                ; $790C: $21 $30 $C4
    add  hl, bc                                   ; $790F: $09
    ld   a, [hl]                                  ; $7910: $7E
    and  $08                                      ; $7911: $E6 $08
    jr   z, jr_003_7973                           ; $7913: $28 $5E

    ld   hl, wEntitiesUnknowTableI                ; $7915: $21 $70 $C4
    add  hl, bc                                   ; $7918: $09
    ldh  a, [hScratch0]                           ; $7919: $F0 $D7
    cp   [hl]                                     ; $791B: $BE
    jr   z, jr_003_7973                           ; $791C: $28 $55

    ld   a, [hl]                                  ; $791E: $7E
    cp   $03                                      ; $791F: $FE $03
    jr   z, jr_003_7973                           ; $7921: $28 $50

    ldh  a, [hScratch0]                           ; $7923: $F0 $D7
    cp   $03                                      ; $7925: $FE $03
    jr   z, jr_003_7973                           ; $7927: $28 $4A

    ldh  a, [hIsSideScrolling]                    ; $7929: $F0 $F9
    and  a                                        ; $792B: $A7
    jr   nz, jr_003_793D                          ; $792C: $20 $0F

    ld   hl, wEntitiesSpeedZTable                 ; $792E: $21 $20 $C3
    add  hl, bc                                   ; $7931: $09
    ld   a, [hl]                                  ; $7932: $7E
    bit  7, a                                     ; $7933: $CB $7F
    jr   z, jr_003_7973                           ; $7935: $28 $3C

    cp   $E7                                      ; $7937: $FE $E7
    jr   nc, jr_003_7973                          ; $7939: $30 $38

    jr   jr_003_7954                              ; $793B: $18 $17

jr_003_793D:
    ldh  a, [hActiveEntityType]                   ; $793D: $F0 $EB
    cp   ENTITY_CHEEP_CHEEP_JUMPING               ; $793F: $FE $AC
    jr   z, jr_003_7954                           ; $7941: $28 $11

    ld   hl, wEntitiesSpeedYTable                 ; $7943: $21 $50 $C2
    add  hl, bc                                   ; $7946: $09
    ld   a, [hl]                                  ; $7947: $7E
    bit  7, a                                     ; $7948: $CB $7F
    jr   nz, jr_003_7954                          ; $794A: $20 $08

    ld   [hl], $00                                ; $794C: $36 $00
    ld   hl, wEntitiesSpeedXTable                 ; $794E: $21 $40 $C2
    add  hl, bc                                   ; $7951: $09
    sra  [hl]                                     ; $7952: $CB $2E

jr_003_7954:
    ld   hl, wEntitiesUnknowTableV                ; $7954: $21 $80 $C4
    add  hl, bc                                   ; $7957: $09
    ld   a, [hl]                                  ; $7958: $7E
    and  a                                        ; $7959: $A7
    jr   nz, jr_003_7973                          ; $795A: $20 $17

label_003_795C:
    ld   hl, wEntitiesPosXTable                   ; $795C: $21 $00 $C2
    add  hl, bc                                   ; $795F: $09
    ld   a, [hl]                                  ; $7960: $7E
    ldh  [hScratch0], a                           ; $7961: $E0 $D7
    ld   hl, wEntitiesPosYTable                   ; $7963: $21 $10 $C2
    add  hl, bc                                   ; $7966: $09
    ld   a, [hl]                                  ; $7967: $7E
    ldh  [hScratch1], a                           ; $7968: $E0 $D8
    ld   a, JINGLE_WATER_DIVE                     ; $796A: $3E $0E
    ldh  [hJingle], a                             ; $796C: $E0 $F2
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $796E: $3E $01
    call AddTranscientVfx                         ; $7970: $CD $C7 $0C

jr_003_7973:
    ldh  a, [hScratch3]                           ; $7973: $F0 $DA
    inc  a                                        ; $7975: $3C
    cp   $F1                                      ; $7976: $FE $F1
    jr   c, jr_003_799C                           ; $7978: $38 $22

    sub  $F1                                      ; $797A: $D6 $F1
    ld   e, a                                     ; $797C: $5F
    ld   d, b                                     ; $797D: $50
    ldh  a, [hFrameCounter]                       ; $797E: $F0 $E7
    and  $03                                      ; $7980: $E6 $03
    jr   nz, jr_003_799A                          ; $7982: $20 $16

    ld   hl, Data_003_7883                        ; $7984: $21 $83 $78
    add  hl, de                                   ; $7987: $19
    ld   a, [hl]                                  ; $7988: $7E
    ld   hl, wEntitiesPosXTable                   ; $7989: $21 $00 $C2
    add  hl, bc                                   ; $798C: $09
    add  [hl]                                     ; $798D: $86
    ld   [hl], a                                  ; $798E: $77
    ld   hl, Data_003_788B                        ; $798F: $21 $8B $78
    add  hl, de                                   ; $7992: $19
    ld   a, [hl]                                  ; $7993: $7E
    ld   hl, wEntitiesPosYTable                   ; $7994: $21 $10 $C2
    add  hl, bc                                   ; $7997: $09
    add  [hl]                                     ; $7998: $86
    ld   [hl], a                                  ; $7999: $77

jr_003_799A:
    jr   jr_003_7A18                              ; $799A: $18 $7C

jr_003_799C:
    ldh  a, [hObjectUnderEntity]                  ; $799C: $F0 $AF
    cp   $61                                      ; $799E: $FE $61
    jr   z, jr_003_79AC                           ; $79A0: $28 $0A

    ldh  a, [hScratch3]                           ; $79A2: $F0 $DA
    cp   $50                                      ; $79A4: $FE $50
    jr   z, jr_003_79AC                           ; $79A6: $28 $04

    cp   $51                                      ; $79A8: $FE $51
    jr   nz, jr_003_7A18                          ; $79AA: $20 $6C

jr_003_79AC:
    ldh  a, [hActiveEntityType]                   ; $79AC: $F0 $EB
    cp   ENTITY_BOW_WOW                           ; $79AE: $FE $6D
    jr   z, jr_003_7A18                           ; $79B0: $28 $66

    cp   ENTITY_ROOSTER                           ; $79B2: $FE $D5
    jr   z, jr_003_7A18                           ; $79B4: $28 $62

    cp   ENTITY_HEART_CONTAINER                   ; $79B6: $FE $36
    jr   z, jr_003_7A18                           ; $79B8: $28 $5E

    cp   ENTITY_MARIN_AT_THE_SHORE                ; $79BA: $FE $C1
    jr   nz, jr_003_79CB                          ; $79BC: $20 $0D

    ld   a, [wLinkMotionState]                    ; $79BE: $FA $1C $C1
    cp   $06                                      ; $79C1: $FE $06
    jr   nz, jr_003_7A18                          ; $79C3: $20 $53

    ldh  a, [hObjectUnderEntity]                  ; $79C5: $F0 $AF
    cp   $61                                      ; $79C7: $FE $61
    jr   nz, jr_003_7A18                          ; $79C9: $20 $4D

jr_003_79CB:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $79CB: $21 $10 $C4
    add  hl, bc                                   ; $79CE: $09
    ld   a, [hl]                                  ; $79CF: $7E
    and  a                                        ; $79D0: $A7
    jr   z, jr_003_7A18                           ; $79D1: $28 $45

    dec  [hl]                                     ; $79D3: $35
    ld   hl, wEntitiesFlashCountdownTable         ; $79D4: $21 $20 $C4
    add  hl, bc                                   ; $79D7: $09
    ld   [hl], $00                                ; $79D8: $36 $00
    ld   hl, wEntitiesStatusTable                 ; $79DA: $21 $80 $C2
    add  hl, bc                                   ; $79DD: $09
    ld   [hl], $02                                ; $79DE: $36 $02
    ldh  a, [hSwordIntersectedAreaX]              ; $79E0: $F0 $CE
    add  $08                                      ; $79E2: $C6 $08
    ld   hl, $C4B0                                ; $79E4: $21 $B0 $C4
    add  hl, bc                                   ; $79E7: $09
    ld   [hl], a                                  ; $79E8: $77
    ldh  a, [hSwordIntersectedAreaY]              ; $79E9: $F0 $CD
    add  $10                                      ; $79EB: $C6 $10
    ld   hl, $C4C0                                ; $79ED: $21 $C0 $C4
    add  hl, bc                                   ; $79F0: $09
    ld   [hl], a                                  ; $79F1: $77
    call GetEntityTransitionCountdown             ; $79F2: $CD $05 $0C
    ld   [hl], $6F                                ; $79F5: $36 $6F

    ldh  a, [hActiveEntityType]                   ; $79F7: $F0 $EB
    cp   ENTITY_MOBLIN_SWORD                      ; $79F9: $FE $14
    jr   z, jr_003_7A18                           ; $79FB: $28 $1B

    cp   ENTITY_MOBLIN                            ; $79FD: $FE $0B
    jr   z, jr_003_7A18                           ; $79FF: $28 $17

    cp   ENTITY_OCTOROCK                          ; $7A01: $FE $09
    jr   z, jr_003_7A18                           ; $7A03: $28 $13

    ld   [hl], $48                                ; $7A05: $36 $48
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7A07: $21 $10 $C4
    add  hl, bc                                   ; $7A0A: $09
    ld   a, [hl]                                  ; $7A0B: $7E
    and  a                                        ; $7A0C: $A7
    jr   nz, jr_003_7A18                          ; $7A0D: $20 $09

    call GetEntityTransitionCountdown             ; $7A0F: $CD $05 $0C
    ld   [hl], $2F                                ; $7A12: $36 $2F
    ld   a, JINGLE_ITEM_FALLING                   ; $7A14: $3E $18
    ldh  [hJingle], a                             ; $7A16: $E0 $F2

jr_003_7A18:
    ldh  a, [hActiveEntityType]                   ; $7A18: $F0 $EB
    cp   ENTITY_BOW_WOW                           ; $7A1A: $FE $6D
    jp   z, jr_003_7A84                           ; $7A1C: $CA $84 $7A

    xor  a                                        ; $7A1F: $AF
    ld   [$C503], a                               ; $7A20: $EA $03 $C5
    ld   hl, wEntitiesHitboxFlagsTable            ; $7A23: $21 $50 $C3
    add  hl, bc                                   ; $7A26: $09
    ld   a, [hl]                                  ; $7A27: $7E
    and  $03                                      ; $7A28: $E6 $03
    sla  a                                        ; $7A2A: $CB $27
    sla  a                                        ; $7A2C: $CB $27
    ldh  [hScratch0], a                           ; $7A2E: $E0 $D7
    ld   hl, wEntitiesCollisionsTable             ; $7A30: $21 $A0 $C2
    add  hl, bc                                   ; $7A33: $09
    xor  a                                        ; $7A34: $AF
    ld   [hl], a                                  ; $7A35: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7A36: $21 $40 $C2
    add  hl, bc                                   ; $7A39: $09
    ld   a, [hl]                                  ; $7A3A: $7E
    cp   $00                                      ; $7A3B: $FE $00
    jr   z, jr_003_7A5D                           ; $7A3D: $28 $1E

    ld   de, $00                                  ; $7A3F: $11 $00 $00
    and  $80                                      ; $7A42: $E6 $80
    jr   z, jr_003_7A47                           ; $7A44: $28 $01

    inc  e                                        ; $7A46: $1C

jr_003_7A47:
    call ApplyEntityPhysics                       ; $7A47: $CD $CD $7A
    jr   c, jr_003_7A5D                           ; $7A4A: $38 $11

    ldh  a, [hObjectUnderEntity]                  ; $7A4C: $F0 $AF
    ld   [$C503], a                               ; $7A4E: $EA $03 $C5
    ldh  a, [$FFBE]                               ; $7A51: $F0 $BE
    and  a                                        ; $7A53: $A7
    jr   nz, jr_003_7A5D                          ; $7A54: $20 $07

    ld   hl, wEntitiesPosXTable                   ; $7A56: $21 $00 $C2
    add  hl, bc                                   ; $7A59: $09
    ldh  a, [hActiveEntityPosX]                   ; $7A5A: $F0 $EE
    ld   [hl], a                                  ; $7A5C: $77

jr_003_7A5D:
    ld   hl, wEntitiesSpeedYTable                 ; $7A5D: $21 $50 $C2
    add  hl, bc                                   ; $7A60: $09
    ld   a, [hl]                                  ; $7A61: $7E
    cp   $00                                      ; $7A62: $FE $00
    jr   z, jr_003_7A84                           ; $7A64: $28 $1E

    ld   de, $02                                  ; $7A66: $11 $02 $00
    and  $80                                      ; $7A69: $E6 $80
    jr   nz, jr_003_7A6E                          ; $7A6B: $20 $01

    inc  e                                        ; $7A6D: $1C

jr_003_7A6E:
    call ApplyEntityPhysics                       ; $7A6E: $CD $CD $7A
    jr   c, jr_003_7A84                           ; $7A71: $38 $11

    ldh  a, [hObjectUnderEntity]                  ; $7A73: $F0 $AF
    ld   [$C50D], a                               ; $7A75: $EA $0D $C5
    ldh  a, [$FFBE]                               ; $7A78: $F0 $BE
    and  a                                        ; $7A7A: $A7
    jr   nz, jr_003_7A84                          ; $7A7B: $20 $07

    ld   hl, wEntitiesPosYTable                   ; $7A7D: $21 $10 $C2
    add  hl, bc                                   ; $7A80: $09
    ldh  a, [hActiveEntityPosY]                   ; $7A81: $F0 $EF
    ld   [hl], a                                  ; $7A83: $77

jr_003_7A84:
    ret                                           ; $7A84: $C9

Data_003_7A85::
    db   $01, $00, $01, $00, $00, $01, $00, $01, $01, $01, $00, $00, $00, $00, $01, $01
    db   $01, $00, $01, $00, $00, $01, $00, $01, $01, $01, $00, $00, $00, $00, $01, $01
    db   $00, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00
    db   $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01
    db   $00, $01, $01, $00, $01, $00, $00, $01

; Entities collision physics?
;
; Does several things:
; - Compute the type of the object under an entity
; - Special cases depending on entity type
; - Hookshot chain
;
; Inputs:
;   bc   entity index
;
; Output:
;   hObjectUnderEntity type of the object under the entity
ApplyEntityPhysics::
    ;
    ; Compute the type of the object under the given entity
    ;
    push bc                                       ; $7ACD: $C5
    ld   hl, wEntitiesPosXTable                   ; $7ACE: $21 $00 $C2
    add  hl, bc                                   ; $7AD1: $09
    ld   a, [hl]                                  ; $7AD2: $7E
    sub  $08                                      ; $7AD3: $D6 $08
    push af                                       ; $7AD5: $F5
    ldh  a, [hScratch0]                           ; $7AD6: $F0 $D7
    ld   c, a                                     ; $7AD8: $4F
    pop  af                                       ; $7AD9: $F1
    ld   hl, Data_003_785F                        ; $7ADA: $21 $5F $78
    add  hl, bc                                   ; $7ADD: $09
    add  hl, de                                   ; $7ADE: $19
    add  [hl]                                     ; $7ADF: $86
    ldh  [hScratch4], a                           ; $7AE0: $E0 $DB
    swap a                                        ; $7AE2: $CB $37
    and  $0F                                      ; $7AE4: $E6 $0F
    ldh  [hScratch1], a                           ; $7AE6: $E0 $D8
    pop  bc                                       ; $7AE8: $C1
    push bc                                       ; $7AE9: $C5
    ld   a, e                                     ; $7AEA: $7B
    cp   $03                                      ; $7AEB: $FE $03
    jr   nz, jr_003_7B0E                          ; $7AED: $20 $1F

    ldh  a, [hActiveEntityType]                   ; $7AEF: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $7AF1: $FE $A8
    jr   z, jr_003_7AF9                           ; $7AF3: $28 $04

    cp   ENTITY_ENTITY_LIFTABLE_ROCK              ; $7AF5: $FE $05
    jr   nz, jr_003_7B0E                          ; $7AF7: $20 $15

jr_003_7AF9:
    ld   hl, wEntitiesPosYTable                   ; $7AF9: $21 $10 $C2
    add  hl, bc                                   ; $7AFC: $09
    ld   a, [hl]                                  ; $7AFD: $7E
    ld   hl, wEntitiesPosZTable                   ; $7AFE: $21 $10 $C3
    add  hl, bc                                   ; $7B01: $09
    ld   c, [hl]                                  ; $7B02: $4E
    bit  7, c                                     ; $7B03: $CB $79
    jr   z, jr_003_7B09                           ; $7B05: $28 $02

    ld   c, $00                                   ; $7B07: $0E $00

jr_003_7B09:
    srl  c                                        ; $7B09: $CB $39
    sub  c                                        ; $7B0B: $91
    jr   jr_003_7B13                              ; $7B0C: $18 $05

jr_003_7B0E:
    ld   hl, wEntitiesPosYTable                   ; $7B0E: $21 $10 $C2
    add  hl, bc                                   ; $7B11: $09
    ld   a, [hl]                                  ; $7B12: $7E

jr_003_7B13:
    sub  $10                                      ; $7B13: $D6 $10
    push af                                       ; $7B15: $F5
    ldh  a, [hScratch0]                           ; $7B16: $F0 $D7
    ld   c, a                                     ; $7B18: $4F
    pop  af                                       ; $7B19: $F1
    ld   hl, Data_003_786F                        ; $7B1A: $21 $6F $78
    add  hl, bc                                   ; $7B1D: $09
    add  hl, de                                   ; $7B1E: $19
    add  [hl]                                     ; $7B1F: $86
    ldh  [hScratch5], a                           ; $7B20: $E0 $DC
    and  $F0                                      ; $7B22: $E6 $F0
    ld   hl, hScratch1                            ; $7B24: $21 $D8 $FF
    or   [hl]                                     ; $7B27: $B6
    ld   c, a                                     ; $7B28: $4F

    ; Retrieve the room object at index
    ld   hl, wRoomObjects                         ; $7B29: $21 $11 $D7
    ld   a, h                                     ; $7B2C: $7C
    add  hl, bc                                   ; $7B2D: $09
    ld   h, a                                     ; $7B2E: $67
    pop  bc                                       ; $7B2F: $C1
    ; Save it into hObjectUnderEntity
    ld   a, [hl]                                  ; $7B30: $7E
    ldh  [hObjectUnderEntity], a                  ; $7B31: $E0 $AF

    ;
    ; Entities special cases
    ;

    cp   OBJECT_LIFTABLE_ROCK ; or liftable pot   ; $7B33: $FE $20
    jp   z, label_003_7C7B                        ; $7B35: $CA $7B $7C

    push de                                       ; $7B38: $D5
    ld   e, a                                     ; $7B39: $5F
    ld   a, [wIsIndoor]                           ; $7B3A: $FA $A5 $DB
    ld   d, a                                     ; $7B3D: $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ; $7B3E: $CD $2C $2A
    pop  de                                       ; $7B41: $D1
    ldh  [hScratch3], a                           ; $7B42: $E0 $DA

    ldh  a, [hActiveEntityType]                   ; $7B44: $F0 $EB
    cp   ENTITY_FISH                              ; $7B46: $FE $CC
    jr   z, jr_003_7B4E                           ; $7B48: $28 $04

    cp   ENTITY_WATER_TEKTITE                     ; $7B4A: $FE $99
    jr   nz, jr_003_7B5D                          ; $7B4C: $20 $0F

jr_003_7B4E:
    ldh  a, [hScratch3]                           ; $7B4E: $F0 $DA
    cp   $05                                      ; $7B50: $FE $05
    jp   z, setCarryFlagAndReturn                 ; $7B52: $CA $A7 $7C

    cp   $07                                      ; $7B55: $FE $07
    jp   z, setCarryFlagAndReturn                 ; $7B57: $CA $A7 $7C

    jp   jr_003_7C75                              ; $7B5A: $C3 $75 $7C

jr_003_7B5D:
    ldh  a, [hScratch3]                           ; $7B5D: $F0 $DA
    and  a                                        ; $7B5F: $A7
    jp   z, setCarryFlagAndReturn                 ; $7B60: $CA $A7 $7C

    cp   $0B                                      ; $7B63: $FE $0B
    jr   z, jr_003_7B6F                           ; $7B65: $28 $08

    cp   $50                                      ; $7B67: $FE $50
    jr   z, jr_003_7B6F                           ; $7B69: $28 $04

    cp   $51                                      ; $7B6B: $FE $51
    jr   nz, jr_003_7B8B                          ; $7B6D: $20 $1C

jr_003_7B6F:
    ld   hl, wEntitiesPosZTable                   ; $7B6F: $21 $10 $C3
    add  hl, bc                                   ; $7B72: $09
    ld   a, [hl]                                  ; $7B73: $7E
    and  a                                        ; $7B74: $A7
    jp   nz, setCarryFlagAndReturn                ; $7B75: $C2 $A7 $7C

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7B78: $21 $10 $C4
    add  hl, bc                                   ; $7B7B: $09
    ld   a, [hl]                                  ; $7B7C: $7E
    and  a                                        ; $7B7D: $A7
    jp   z, jr_003_7C75                           ; $7B7E: $CA $75 $7C

    ldh  a, [hActiveEntityType]                   ; $7B81: $F0 $EB
    cp   ENTITY_MOLDORM                           ; $7B83: $FE $59
    jp   z, jr_003_7C75                           ; $7B85: $CA $75 $7C

    jp   setCarryFlagAndReturn                    ; $7B88: $C3 $A7 $7C

jr_003_7B8B:
    cp   $7C                                      ; $7B8B: $FE $7C
    jp   c, label_003_7BE4                        ; $7B8D: $DA $E4 $7B

    cp   $90                                      ; $7B90: $FE $90
    jp   nc, label_003_7BE4                       ; $7B92: $D2 $E4 $7B

    cp   $80                                      ; $7B95: $FE $80
    ldh  a, [hActiveEntityType]                   ; $7B97: $F0 $EB
    jr   c, jr_003_7BA7                           ; $7B99: $38 $0C

    cp   ENTITY_WRECKING_BALL                     ; $7B9B: $FE $A8
    jp   z, setCarryFlagAndReturn                 ; $7B9D: $CA $A7 $7C

    cp   ENTITY_BOMB                              ; $7BA0: $FE $02
    jp   z, setCarryFlagAndReturn                 ; $7BA2: $CA $A7 $7C

    jr   jr_003_7BBB                              ; $7BA5: $18 $14

jr_003_7BA7:
    cp   ENTITY_SPARK_COUNTER_CLOCKWISE           ; $7BA7: $FE $16
    jp   z, jr_003_7C9A                           ; $7BA9: $CA $9A $7C

    cp   ENTITY_SPARK_CLOCKWISE                   ; $7BAC: $FE $17
    jp   z, jr_003_7C9A                           ; $7BAE: $CA $9A $7C

    ld   hl, wEntitiesUnknowTableH                ; $7BB1: $21 $30 $C4
    add  hl, bc                                   ; $7BB4: $09
    ld   a, [hl]                                  ; $7BB5: $7E
    and  $80                                      ; $7BB6: $E6 $80
    jp   nz, jr_003_7C9A                          ; $7BB8: $C2 $9A $7C

jr_003_7BBB:
    push de                                       ; $7BBB: $D5
    ldh  a, [hScratch3]                           ; $7BBC: $F0 $DA
    sub  $7C                                      ; $7BBE: $D6 $7C
    sla  a                                        ; $7BC0: $CB $27
    sla  a                                        ; $7BC2: $CB $27
    ld   e, a                                     ; $7BC4: $5F
    ld   d, $00                                   ; $7BC5: $16 $00
    ld   hl, Data_003_7A85                        ; $7BC7: $21 $85 $7A
    add  hl, de                                   ; $7BCA: $19
    ldh  a, [hScratch4]                           ; $7BCB: $F0 $DB
    rra                                           ; $7BCD: $1F
    rra                                           ; $7BCE: $1F
    rra                                           ; $7BCF: $1F
    and  $01                                      ; $7BD0: $E6 $01
    ld   e, a                                     ; $7BD2: $5F
    ldh  a, [hScratch5]                           ; $7BD3: $F0 $DC
    rra                                           ; $7BD5: $1F
    rra                                           ; $7BD6: $1F
    and  $02                                      ; $7BD7: $E6 $02
    or   e                                        ; $7BD9: $B3
    ld   e, a                                     ; $7BDA: $5F
    ld   d, $00                                   ; $7BDB: $16 $00
    add  hl, de                                   ; $7BDD: $19
    ld   a, [hl]                                  ; $7BDE: $7E
    pop  de                                       ; $7BDF: $D1
    and  a                                        ; $7BE0: $A7
    jp   z, setCarryFlagAndReturn                 ; $7BE1: $CA $A7 $7C

label_003_7BE4:
    ldh  a, [hScratch3]                           ; $7BE4: $F0 $DA
    cp   $D0                                      ; $7BE6: $FE $D0
    jr   c, jr_003_7C2B                           ; $7BE8: $38 $41

    cp   $D4                                      ; $7BEA: $FE $D4
    jr   nc, jr_003_7C2B                          ; $7BEC: $30 $3D

    sub  $D0                                      ; $7BEE: $D6 $D0
    ld   hl, $C5D0                                ; $7BF0: $21 $D0 $C5
    add  hl, bc                                   ; $7BF3: $09
    cp   [hl]                                     ; $7BF4: $BE
    jr   z, jr_003_7C1A                           ; $7BF5: $28 $23

    ldh  a, [hActiveEntityType]                   ; $7BF7: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $7BF9: $FE $A8
    jr   z, jr_003_7C75                           ; $7BFB: $28 $78

    ld   hl, wEntitiesUnknowTableJ                ; $7BFD: $21 $F0 $C4
    add  hl, bc                                   ; $7C00: $09
    ld   a, [hl]                                  ; $7C01: $7E
    and  a                                        ; $7C02: $A7
    jr   z, jr_003_7C75                           ; $7C03: $28 $70

    ldh  a, [hFrameCounter]                       ; $7C05: $F0 $E7
    and  $03                                      ; $7C07: $E6 $03
    jr   z, jr_003_7C28                           ; $7C09: $28 $1D

    ld   a, [wIsIndoor]                           ; $7C0B: $FA $A5 $DB
    and  a                                        ; $7C0E: $A7
    jr   nz, jr_003_7C17                          ; $7C0F: $20 $06

    ldh  a, [hFrameCounter]                       ; $7C11: $F0 $E7
    and  $01                                      ; $7C13: $E6 $01
    jr   z, jr_003_7C28                           ; $7C15: $28 $11

jr_003_7C17:
    dec  [hl]                                     ; $7C17: $35
    jr   jr_003_7C28                              ; $7C18: $18 $0E

jr_003_7C1A:
    ld   hl, wEntitiesPosZTable                   ; $7C1A: $21 $10 $C3
    add  hl, bc                                   ; $7C1D: $09
    ld   a, [hl]                                  ; $7C1E: $7E
    and  a                                        ; $7C1F: $A7
    jp   z, jr_003_7C75                           ; $7C20: $CA $75 $7C

    ld   hl, wEntitiesUnknowTableJ                ; $7C23: $21 $F0 $C4
    add  hl, bc                                   ; $7C26: $09
    inc  [hl]                                     ; $7C27: $34

jr_003_7C28:
    jp   setCarryFlagAndReturn                    ; $7C28: $C3 $A7 $7C

jr_003_7C2B:
    cp   $FF                                      ; $7C2B: $FE $FF
    jr   z, jr_003_7C9A                           ; $7C2D: $28 $6B

    cp   $A0                                      ; $7C2F: $FE $A0
    jr   nc, setCarryFlagAndReturn                ; $7C31: $30 $74

    cp   $10                                      ; $7C33: $FE $10
    jr   nc, jr_003_7C75                          ; $7C35: $30 $3E

    cp   $01                                      ; $7C37: $FE $01
    jr   z, hookshotEnd                           ; $7C39: $28 $56

    cp   $03                                      ; $7C3B: $FE $03
    jr   z, hookshotEnd                           ; $7C3D: $28 $52

    cp   $04                                      ; $7C3F: $FE $04
    jr   nz, setCarryFlagAndReturn                ; $7C41: $20 $64

    ldh  a, [hActiveEntityType]                   ; $7C43: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $7C45: $FE $A8
    jp   z, setCarryFlagAndReturn                 ; $7C47: $CA $A7 $7C

    cp   ENTITY_BOMB                              ; $7C4A: $FE $02
    jp   z, setCarryFlagAndReturn                 ; $7C4C: $CA $A7 $7C

    cp   ENTITY_HOOKSHOT_CHAIN                    ; $7C4F: $FE $03
    jr   nz, jr_003_7C5A                          ; $7C51: $20 $07

    ld   a, [$D6F9]                               ; $7C53: $FA $F9 $D6
    and  a                                        ; $7C56: $A7
    jp   nz, setCarryFlagAndReturn                ; $7C57: $C2 $A7 $7C

jr_003_7C5A:
    ldh  a, [hObjectUnderEntity]                  ; $7C5A: $F0 $AF
    cp   $DB                                      ; $7C5C: $FE $DB
    jr   c, jr_003_7C9A                           ; $7C5E: $38 $3A

    cp   $DD                                      ; $7C60: $FE $DD
    jr   nc, jr_003_7C9A                          ; $7C62: $30 $36

    push de                                       ; $7C64: $D5
    sub  $DB                                      ; $7C65: $D6 $DB
    ld   e, a                                     ; $7C67: $5F
    ld   d, $00                                   ; $7C68: $16 $00
    ld   hl, Data_003_7CA9                        ; $7C6A: $21 $A9 $7C
    add  hl, de                                   ; $7C6D: $19
    pop  de                                       ; $7C6E: $D1
    ld   a, [$D6FB]                               ; $7C6F: $FA $FB $D6
    xor  [hl]                                     ; $7C72: $AE
    jr   z, setCarryFlagAndReturn                 ; $7C73: $28 $32

jr_003_7C75:
    ldh  a, [hScratch3]                           ; $7C75: $F0 $DA
    cp   $60                                      ; $7C77: $FE $60
    jr   nz, hookshotEnd                          ; $7C79: $20 $16

; liftable rock or pot
label_003_7C7B:
    ldh  a, [hActiveEntityType]                   ; $7C7B: $F0 $EB
    cp   ENTITY_HOOKSHOT_CHAIN                    ; $7C7D: $FE $03
    jr   nz, hookshotEnd                          ; $7C7F: $20 $10

    call GetEntityTransitionCountdown             ; $7C81: $CD $05 $0C
    cp   $26                                      ; $7C84: $FE $26
    jr   c, .hookshotClearEnd                     ; $7C86: $38 $03
    call UnloadEntity                             ; $7C88: $CD $8D $3F
.hookshotClearEnd

    ld   hl, wEntitiesStateTable                  ; $7C8B: $21 $90 $C2
    add  hl, bc                                   ; $7C8E: $09
    ld   [hl], $01                                ; $7C8F: $36 $01
hookshotEnd:

    ld   hl, wEntitiesUnknowTableH                ; $7C91: $21 $30 $C4
    add  hl, bc                                   ; $7C94: $09
    ld   a, [hl]                                  ; $7C95: $7E
    and  $01                                      ; $7C96: $E6 $01
    jr   nz, setCarryFlagAndReturn                ; $7C98: $20 $0D

jr_003_7C9A:
    ; wEntitiesCollisionsTable[bc] |= Data_003_787F[de]
    ld   hl, Data_003_787F                        ; $7C9A: $21 $7F $78
    add  hl, de                                   ; $7C9D: $19
    ld   a, [hl]                                  ; $7C9E: $7E
    ld   hl, wEntitiesCollisionsTable             ; $7C9F: $21 $A0 $C2
    add  hl, bc                                   ; $7CA2: $09
    or   [hl]                                     ; $7CA3: $B6
    ld   [hl], a                                  ; $7CA4: $77
    and  a                                        ; $7CA5: $A7
    ret                                           ; $7CA6: $C9

setCarryFlagAndReturn:
    scf                                           ; $7CA7: $37
    ret                                           ; $7CA8: $C9

Data_003_7CA9::
    db   $00, $02

ApplySwordIntersectionWithObjects::
    ld   de, $00                                  ; $7CAB: $11 $00 $00
    push bc                                       ; $7CAE: $C5
    ld   hl, wEntitiesPosXTable                   ; $7CAF: $21 $00 $C2
    add  hl, bc                                   ; $7CB2: $09
    ld   a, [hl]                                  ; $7CB3: $7E
    ldh  [hScratch4], a                           ; $7CB4: $E0 $DB
    and  $F0                                      ; $7CB6: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $7CB8: $E0 $CE
    swap a                                        ; $7CBA: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $7CBC: $21 $10 $C2
    add  hl, bc                                   ; $7CBF: $09
    ld   c, a                                     ; $7CC0: $4F
    ld   a, [hl]                                  ; $7CC1: $7E
    sub  $08                                      ; $7CC2: $D6 $08
    ldh  [hScratch5], a                           ; $7CC4: $E0 $DC
    and  $F0                                      ; $7CC6: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $7CC8: $E0 $CD
    or   c                                        ; $7CCA: $B1
    ld   c, a                                     ; $7CCB: $4F
    ldh  [hIndexOfObjectBelowLink], a             ; $7CCC: $E0 $E9
    ld   b, $00                                   ; $7CCE: $06 $00
    ld   hl, wRoomObjects                         ; $7CD0: $21 $11 $D7
    ld   a, h                                     ; $7CD3: $7C
    add  hl, bc                                   ; $7CD4: $09
    ld   h, a                                     ; $7CD5: $67
    pop  bc                                       ; $7CD6: $C1
    ld   a, [hl]                                  ; $7CD7: $7E
    ldh  [hObjectUnderEntity], a                  ; $7CD8: $E0 $AF
    cp   OBJECT_TORCH_LIT                         ; $7CDA: $FE $AC
    jp   z, jr_003_7E03                           ; $7CDC: $CA $03 $7E

    cp   OBJECT_TORCH_UNLIT                       ; $7CDF: $FE $AB
    jp   nz, jr_003_7D6B                          ; $7CE1: $C2 $6B $7D

    ldh  a, [hIsGBC]                              ; $7CE4: $F0 $FE
    and  a                                        ; $7CE6: $A7
    jr   z, jr_003_7CFD                           ; $7CE7: $28 $14

    ld   a, [wLinkMotionState]                    ; $7CE9: $FA $1C $C1
    cp   $05                                      ; $7CEC: $FE $05
    ret  z                                        ; $7CEE: $C8

    ld   a, [$DDD6]                               ; $7CEF: $FA $D6 $DD
    and  a                                        ; $7CF2: $A7
    jp   nz, jr_003_7E03                          ; $7CF3: $C2 $03 $7E

    ld   a, [wRoomTransitionState]                ; $7CF6: $FA $24 $C1
    and  a                                        ; $7CF9: $A7
    jp   nz, jr_003_7E03                          ; $7CFA: $C2 $03 $7E

jr_003_7CFD:
    ldh  a, [hActiveEntityType]                   ; $7CFD: $F0 $EB
    cp   ENTITY_HOOKSHOT_HIT                      ; $7CFF: $FE $04
    jr   nz, jr_003_7D6B                          ; $7D01: $20 $68

    ld   a, [wIsIndoor]                           ; $7D03: $FA $A5 $DB
    and  a                                        ; $7D06: $A7
    jr   z, jr_003_7D6B                           ; $7D07: $28 $62

    push hl                                       ; $7D09: $E5
    ld   a, NOISE_SFX_BURSTING_FLAME              ; $7D0A: $3E $12
    ldh  [hNoiseSfx], a                           ; $7D0C: $E0 $F4

    ld   a, ENTITY_MAGIC_POWDER_SPRINKLE          ; $7D0E: $3E $08
    call SpawnNewEntity                           ; $7D10: $CD $CA $64
    jr   c, jr_003_7D6A                           ; $7D13: $38 $55

    pop  hl                                       ; $7D15: $E1
    ld   a, $AC                                   ; $7D16: $3E $AC
    ld   [hl], a                                  ; $7D18: $77
    ld   [$DDD8], a                               ; $7D19: $EA $D8 $DD
    push bc                                       ; $7D1C: $C5
    ld   c, e                                     ; $7D1D: $4B
    ld   b, d                                     ; $7D1E: $42
    ld   d, h                                     ; $7D1F: $54
    ld   e, l                                     ; $7D20: $5D
    ld   hl, wEntitiesPrivateState1Table          ; $7D21: $21 $B0 $C2
    add  hl, bc                                   ; $7D24: $09
    ld   [hl], d                                  ; $7D25: $72
    ld   hl, wEntitiesPrivateState2Table          ; $7D26: $21 $C0 $C2
    add  hl, bc                                   ; $7D29: $09
    ld   [hl], e                                  ; $7D2A: $73
    ldh  a, [hSwordIntersectedAreaX]              ; $7D2B: $F0 $CE
    ld   hl, wEntitiesPosXTable                   ; $7D2D: $21 $00 $C2
    add  hl, bc                                   ; $7D30: $09
    ld   [hl], a                                  ; $7D31: $77
    ldh  a, [hSwordIntersectedAreaY]              ; $7D32: $F0 $CD
    ld   hl, wEntitiesPosYTable                   ; $7D34: $21 $10 $C2
    add  hl, bc                                   ; $7D37: $09
    ld   [hl], a                                  ; $7D38: $77
    ld   hl, wEntitiesStateTable                  ; $7D39: $21 $90 $C2
    add  hl, bc                                   ; $7D3C: $09
    ld   [hl], $01                                ; $7D3D: $36 $01
    call GetEntityDropTimer                       ; $7D3F: $CD $FB $0B
    ld   [hl], $80                                ; $7D42: $36 $80
    pop  bc                                       ; $7D44: $C1
    ld   hl, $C1A2                                ; $7D45: $21 $A2 $C1
    inc  [hl]                                     ; $7D48: $34
    ld   a, [wC3CD]                               ; $7D49: $FA $CD $C3
    and  a                                        ; $7D4C: $A7
    jr   z, jr_003_7D63                           ; $7D4D: $28 $14

    sub  $04                                      ; $7D4F: $D6 $04
    ld   [wC3CD], a                               ; $7D51: $EA $CD $C3
    ldh  a, [hIsGBC]                              ; $7D54: $F0 $FE
    and  a                                        ; $7D56: $A7
    jr   z, jr_003_7D63                           ; $7D57: $28 $0A

    ld   a, $40                                   ; $7D59: $3E $40
    ld   [$DDD6], a                               ; $7D5B: $EA $D6 $DD
    ld   a, $0B                                   ; $7D5E: $3E $0B
    ld   [$DDD7], a                               ; $7D60: $EA $D7 $DD

jr_003_7D63:
    ld   de, Data_003_69A2                        ; $7D63: $11 $A2 $69
    push de                                       ; $7D66: $D5
    jp   label_003_51F5                           ; $7D67: $C3 $F5 $51

jr_003_7D6A:
    pop  hl                                       ; $7D6A: $E1

jr_003_7D6B:
    ld   a, [hl]                                  ; $7D6B: $7E
    ld   e, a                                     ; $7D6C: $5F
    ld   a, [wIsIndoor]                           ; $7D6D: $FA $A5 $DB
    ld   d, a                                     ; $7D70: $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ; $7D71: $CD $2C $2A
    ldh  [hScratch1], a                           ; $7D74: $E0 $D8
    and  a                                        ; $7D76: $A7
    jp   z, jr_003_7E03                           ; $7D77: $CA $03 $7E

    ldh  [hScratch3], a                           ; $7D7A: $E0 $DA
    cp   $FF                                      ; $7D7C: $FE $FF
    jp   z, label_003_7E05                        ; $7D7E: $CA $05 $7E

    cp   $D0                                      ; $7D81: $FE $D0
    jr   c, jr_003_7DC0                           ; $7D83: $38 $3B

    cp   $D4                                      ; $7D85: $FE $D4
    jr   nc, jr_003_7DC0                          ; $7D87: $30 $37

    sub  $D0                                      ; $7D89: $D6 $D0
    ld   hl, $C5D0                                ; $7D8B: $21 $D0 $C5
    add  hl, bc                                   ; $7D8E: $09
    cp   [hl]                                     ; $7D8F: $BE
    jr   z, jr_003_7DB0                           ; $7D90: $28 $1E

    ld   hl, wEntitiesUnknowTableJ                ; $7D92: $21 $F0 $C4
    add  hl, bc                                   ; $7D95: $09
    ld   a, [hl]                                  ; $7D96: $7E
    and  a                                        ; $7D97: $A7
    jr   z, jr_003_7DE3                           ; $7D98: $28 $49

    ldh  a, [hFrameCounter]                       ; $7D9A: $F0 $E7
    and  $03                                      ; $7D9C: $E6 $03
    jr   z, jr_003_7E03                           ; $7D9E: $28 $63

    ld   a, [wIsIndoor]                           ; $7DA0: $FA $A5 $DB
    and  a                                        ; $7DA3: $A7
    jr   nz, jr_003_7DAC                          ; $7DA4: $20 $06

    ldh  a, [hFrameCounter]                       ; $7DA6: $F0 $E7
    and  $01                                      ; $7DA8: $E6 $01
    jr   z, jr_003_7E03                           ; $7DAA: $28 $57

jr_003_7DAC:
    dec  [hl]                                     ; $7DAC: $35
    jp   jr_003_7E03                              ; $7DAD: $C3 $03 $7E

jr_003_7DB0:
    ld   hl, wEntitiesPosZTable                   ; $7DB0: $21 $10 $C3
    add  hl, bc                                   ; $7DB3: $09
    ld   a, [hl]                                  ; $7DB4: $7E
    and  a                                        ; $7DB5: $A7
    jr   z, jr_003_7DE3                           ; $7DB6: $28 $2B

    ld   hl, wEntitiesUnknowTableJ                ; $7DB8: $21 $F0 $C4
    add  hl, bc                                   ; $7DBB: $09
    inc  [hl]                                     ; $7DBC: $34
    jp   jr_003_7E03                              ; $7DBD: $C3 $03 $7E

jr_003_7DC0:
    cp   $7C                                      ; $7DC0: $FE $7C
    jp   c, label_003_7DCD                        ; $7DC2: $DA $CD $7D

    cp   $90                                      ; $7DC5: $FE $90
    jp   nc, label_003_7DCD                       ; $7DC7: $D2 $CD $7D

    jp   jr_003_7E03                              ; $7DCA: $C3 $03 $7E

label_003_7DCD:
    ldh  a, [hScratch3]                           ; $7DCD: $F0 $DA
    cp   $A0                                      ; $7DCF: $FE $A0
    jr   nc, jr_003_7E03                          ; $7DD1: $30 $30

    cp   $50                                      ; $7DD3: $FE $50
    jr   z, jr_003_7E03                           ; $7DD5: $28 $2C

    cp   $51                                      ; $7DD7: $FE $51
    jr   z, jr_003_7E03                           ; $7DD9: $28 $28

    cp   $10                                      ; $7DDB: $FE $10
    jr   nc, jr_003_7DE3                          ; $7DDD: $30 $04

    cp   $01                                      ; $7DDF: $FE $01
    jr   nz, jr_003_7E03                          ; $7DE1: $20 $20

jr_003_7DE3:
    ld   hl, wEntitiesCollisionsTable             ; $7DE3: $21 $A0 $C2
    add  hl, bc                                   ; $7DE6: $09
    ld   [hl], $01                                ; $7DE7: $36 $01
    ldh  a, [hActiveEntityType]                   ; $7DE9: $F0 $EB
    cp   ENTITY_BOOMERANG                         ; $7DEB: $FE $01
    jr   nz, jr_003_7DF3                          ; $7DED: $20 $04

    call GetEntityTransitionCountdown             ; $7DEF: $CD $05 $0C
    ret  z                                        ; $7DF2: $C8

jr_003_7DF3:
    ld   hl, wEntitiesPosXTable                   ; $7DF3: $21 $00 $C2
    add  hl, bc                                   ; $7DF6: $09
    ldh  a, [hActiveEntityPosX]                   ; $7DF7: $F0 $EE
    ld   [hl], a                                  ; $7DF9: $77
    ld   hl, wEntitiesPosYTable                   ; $7DFA: $21 $10 $C2
    add  hl, bc                                   ; $7DFD: $09
    ldh  a, [hActiveEntityPosY]                   ; $7DFE: $F0 $EF
    ld   [hl], a                                  ; $7E00: $77
    scf                                           ; $7E01: $37
    ret                                           ; $7E02: $C9

jr_003_7E03:
    and  a                                        ; $7E03: $A7
    ret                                           ; $7E04: $C9

label_003_7E05:
    ldh  a, [hActiveEntityType]                   ; $7E05: $F0 $EB
    cp   ENTITY_BOOMERANG                         ; $7E07: $FE $01

label_003_7E09:
    jr   z, jr_003_7DE3                           ; $7E09: $28 $D8

    jp   UnloadEntityAndReturn                    ; $7E0B: $C3 $8D $3F

func_003_7E0E::
    push bc                                       ; $7E0E: $C5
    ld   hl, wEntitiesPosXTable                   ; $7E0F: $21 $00 $C2
    add  hl, bc                                   ; $7E12: $09
    ld   a, [hl]                                  ; $7E13: $7E
    sub  $01                                      ; $7E14: $D6 $01
    ldh  [hScratch4], a                           ; $7E16: $E0 $DB
    and  $F0                                      ; $7E18: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $7E1A: $E0 $CE
    swap a                                        ; $7E1C: $CB $37
    ld   hl, wEntitiesPosYTable                   ; $7E1E: $21 $10 $C2
    add  hl, bc                                   ; $7E21: $09
    ld   c, a                                     ; $7E22: $4F
    ld   a, [hl]                                  ; $7E23: $7E
    sub  $07                                      ; $7E24: $D6 $07
    ldh  [hScratch5], a                           ; $7E26: $E0 $DC
    and  $F0                                      ; $7E28: $E6 $F0
    ldh  [hSwordIntersectedAreaY], a              ; $7E2A: $E0 $CD
    or   c                                        ; $7E2C: $B1
    ld   c, a                                     ; $7E2D: $4F
    ld   b, $00                                   ; $7E2E: $06 $00
    ld   hl, wRoomObjects                         ; $7E30: $21 $11 $D7
    ld   a, h                                     ; $7E33: $7C
    add  hl, bc                                   ; $7E34: $09
    ld   h, a                                     ; $7E35: $67
    pop  bc                                       ; $7E36: $C1
    ld   a, [hl]                                  ; $7E37: $7E
    ldh  [hObjectUnderEntity], a                  ; $7E38: $E0 $AF
    ld   e, a                                     ; $7E3A: $5F
    ld   a, [wIsIndoor]                           ; $7E3B: $FA $A5 $DB
    ld   d, a                                     ; $7E3E: $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ; $7E3F: $CD $2C $2A
    ldh  [hScratch3], a                           ; $7E42: $E0 $DA
    ret                                           ; $7E44: $C9

; Compute an (X, Y) vector of length A pointing from an entity position
; to the direction of Link.
; Useful to move an entity in the direction of another.
;
; Inputs:
;   a    vector length
;   ???  vector origin X
;   ???  vector origin Y
;
; Outputs:
;   hScratch0   resulting vector Y
;   hScratch1   resulting vector X
GetVectorTowardsLink::
    ldh  [hScratch1], a                           ; $7E45: $E0 $D8
    and  a                                        ; $7E47: $A7
    jp   z, label_003_7EC3                        ; $7E48: $CA $C3 $7E

    call func_003_7EE9                            ; $7E4B: $CD $E9 $7E
    dec  e                                        ; $7E4E: $1D
    dec  e                                        ; $7E4F: $1D
    ld   a, e                                     ; $7E50: $7B
    ldh  [hScratch2], a                           ; $7E51: $E0 $D9
    ld   a, d                                     ; $7E53: $7A
    bit  7, a                                     ; $7E54: $CB $7F
    jr   z, jr_003_7E5A                           ; $7E56: $28 $02

    cpl                                           ; $7E58: $2F
    inc  a                                        ; $7E59: $3C

jr_003_7E5A:
    ldh  [hScratchC], a                           ; $7E5A: $E0 $E3
    call func_003_7ED9                            ; $7E5C: $CD $D9 $7E
    ld   a, e                                     ; $7E5F: $7B
    ldh  [hScratch3], a                           ; $7E60: $E0 $DA
    ld   a, d                                     ; $7E62: $7A
    bit  7, a                                     ; $7E63: $CB $7F
    jr   z, jr_003_7E69                           ; $7E65: $28 $02

    cpl                                           ; $7E67: $2F
    inc  a                                        ; $7E68: $3C

jr_003_7E69:
    ldh  [hScratchD], a                           ; $7E69: $E0 $E4
    ld   e, $00                                   ; $7E6B: $1E $00
    ld   hl, hScratchC                            ; $7E6D: $21 $E3 $FF
    ldh  a, [hScratchD]                           ; $7E70: $F0 $E4
    cp   [hl]                                     ; $7E72: $BE
    jr   nc, jr_003_7E7E                          ; $7E73: $30 $09

    inc  e                                        ; $7E75: $1C
    push af                                       ; $7E76: $F5
    ldh  a, [hScratchC]                           ; $7E77: $F0 $E3
    ldh  [hScratchD], a                           ; $7E79: $E0 $E4
    pop  af                                       ; $7E7B: $F1
    ldh  [hScratchC], a                           ; $7E7C: $E0 $E3

jr_003_7E7E:
    xor  a                                        ; $7E7E: $AF
    ldh  [hScratchB], a                           ; $7E7F: $E0 $E2
    ldh  [hScratch0], a                           ; $7E81: $E0 $D7
    ldh  a, [hScratch1]                           ; $7E83: $F0 $D8
    ld   d, a                                     ; $7E85: $57

jr_003_7E86:
    ldh  a, [hScratchB]                           ; $7E86: $F0 $E2
    ld   hl, hScratchC                            ; $7E88: $21 $E3 $FF
    add  [hl]                                     ; $7E8B: $86
    jr   c, jr_003_7E94                           ; $7E8C: $38 $06

    ld   hl, hScratchD                            ; $7E8E: $21 $E4 $FF
    cp   [hl]                                     ; $7E91: $BE
    jr   c, jr_003_7E99                           ; $7E92: $38 $05

jr_003_7E94:
    sub  [hl]                                     ; $7E94: $96
    ld   hl, hScratch0                            ; $7E95: $21 $D7 $FF
    inc  [hl]                                     ; $7E98: $34

jr_003_7E99:
    ldh  [hScratchB], a                           ; $7E99: $E0 $E2
    dec  d                                        ; $7E9B: $15
    jr   nz, jr_003_7E86                          ; $7E9C: $20 $E8

    ld   a, e                                     ; $7E9E: $7B
    and  a                                        ; $7E9F: $A7
    jr   z, jr_003_7EAC                           ; $7EA0: $28 $0A

    ldh  a, [hScratch0]                           ; $7EA2: $F0 $D7
    push af                                       ; $7EA4: $F5
    ldh  a, [hScratch1]                           ; $7EA5: $F0 $D8
    ldh  [hScratch0], a                           ; $7EA7: $E0 $D7
    pop  af                                       ; $7EA9: $F1
    ldh  [hScratch1], a                           ; $7EAA: $E0 $D8

jr_003_7EAC:
    ldh  a, [hScratch2]                           ; $7EAC: $F0 $D9
    and  a                                        ; $7EAE: $A7
    ldh  a, [hScratch0]                           ; $7EAF: $F0 $D7
    jr   nz, jr_003_7EB7                          ; $7EB1: $20 $04

    cpl                                           ; $7EB3: $2F
    inc  a                                        ; $7EB4: $3C
    ldh  [hScratch0], a                           ; $7EB5: $E0 $D7

jr_003_7EB7:
    ldh  a, [hScratch3]                           ; $7EB7: $F0 $DA
    and  a                                        ; $7EB9: $A7
    ldh  a, [hScratch1]                           ; $7EBA: $F0 $D8
    jr   z, jr_003_7EC2                           ; $7EBC: $28 $04

    cpl                                           ; $7EBE: $2F
    inc  a                                        ; $7EBF: $3C
    ldh  [hScratch1], a                           ; $7EC0: $E0 $D8

jr_003_7EC2:
    ret                                           ; $7EC2: $C9

label_003_7EC3:
    xor  a                                        ; $7EC3: $AF
    ldh  [hScratch0], a                           ; $7EC4: $E0 $D7
    ret                                           ; $7EC6: $C9

ApplyVectorTowardsLink::
ApplyVectorTowardsLinkAndReturn::
    call GetVectorTowardsLink                     ; $7EC7: $CD $45 $7E
    ldh  a, [hScratch0]                           ; $7ECA: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $7ECC: $21 $50 $C2
    add  hl, bc                                   ; $7ECF: $09
    ld   [hl], a                                  ; $7ED0: $77
    ldh  a, [hScratch1]                           ; $7ED1: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $7ED3: $21 $40 $C2
    add  hl, bc                                   ; $7ED6: $09
    ld   [hl], a                                  ; $7ED7: $77
    ret                                           ; $7ED8: $C9

func_003_7ED9::
    ld   e, $00                                   ; $7ED9: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7EDB: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7EDD: $21 $00 $C2
    add  hl, bc                                   ; $7EE0: $09
    sub  [hl]                                     ; $7EE1: $96
    bit  7, a                                     ; $7EE2: $CB $7F
    jr   z, jr_003_7EE7                           ; $7EE4: $28 $01

    inc  e                                        ; $7EE6: $1C

jr_003_7EE7:
    ld   d, a                                     ; $7EE7: $57
    ret                                           ; $7EE8: $C9

func_003_7EE9::
    ld   e, $02                                   ; $7EE9: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7EEB: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7EED: $21 $10 $C2
    add  hl, bc                                   ; $7EF0: $09
    sub  [hl]                                     ; $7EF1: $96
    ld   hl, wEntitiesPosZTable                   ; $7EF2: $21 $10 $C3
    add  hl, bc                                   ; $7EF5: $09
    add  [hl]                                     ; $7EF6: $86
    bit  7, a                                     ; $7EF7: $CB $7F
    jr   nz, jr_003_7EFC                          ; $7EF9: $20 $01

    inc  e                                        ; $7EFB: $1C

jr_003_7EFC:
    ld   d, a                                     ; $7EFC: $57
    ret                                           ; $7EFD: $C9

func_003_7EFE::
    call func_003_7ED9                            ; $7EFE: $CD $D9 $7E
    ld   a, e                                     ; $7F01: $7B
    ldh  [hScratch0], a                           ; $7F02: $E0 $D7
    ld   a, d                                     ; $7F04: $7A
    bit  7, a                                     ; $7F05: $CB $7F
    jr   z, jr_003_7F0B                           ; $7F07: $28 $02

    cpl                                           ; $7F09: $2F
    inc  a                                        ; $7F0A: $3C

jr_003_7F0B:
    push af                                       ; $7F0B: $F5
    call func_003_7EE9                            ; $7F0C: $CD $E9 $7E
    ld   a, e                                     ; $7F0F: $7B
    ldh  [hScratch1], a                           ; $7F10: $E0 $D8
    ld   a, d                                     ; $7F12: $7A
    bit  7, a                                     ; $7F13: $CB $7F
    jr   z, jr_003_7F19                           ; $7F15: $28 $02

    cpl                                           ; $7F17: $2F
    inc  a                                        ; $7F18: $3C

jr_003_7F19:
    pop  de                                       ; $7F19: $D1
    cp   d                                        ; $7F1A: $BA
    jr   nc, jr_003_7F21                          ; $7F1B: $30 $04

    ldh  a, [hScratch0]                           ; $7F1D: $F0 $D7
    jr   jr_003_7F23                              ; $7F1F: $18 $02

jr_003_7F21:
    ldh  a, [hScratch1]                           ; $7F21: $F0 $D8

jr_003_7F23:
    ld   e, a                                     ; $7F23: $5F
    ret                                           ; $7F24: $C9

func_003_7F25::
    call func_003_7F32                            ; $7F25: $CD $32 $7F
    push bc                                       ; $7F28: $C5
    ld   a, c                                     ; $7F29: $79
    add  $10                                      ; $7F2A: $C6 $10
    ld   c, a                                     ; $7F2C: $4F
    call func_003_7F32                            ; $7F2D: $CD $32 $7F
    pop  bc                                       ; $7F30: $C1
    ret                                           ; $7F31: $C9

func_003_7F32::
    ld   hl, wEntitiesSpeedXTable                 ; $7F32: $21 $40 $C2
    add  hl, bc                                   ; $7F35: $09
    ld   a, [hl]                                  ; $7F36: $7E
    and  a                                        ; $7F37: $A7
    jr   z, jr_003_7F5D                           ; $7F38: $28 $23

    push af                                       ; $7F3A: $F5
    swap a                                        ; $7F3B: $CB $37
    and  $F0                                      ; $7F3D: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $7F3F: $21 $60 $C2
    add  hl, bc                                   ; $7F42: $09
    add  [hl]                                     ; $7F43: $86
    ld   [hl], a                                  ; $7F44: $77
    rl   d                                        ; $7F45: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7F47: $21 $00 $C2

jr_003_7F4A:
    add  hl, bc                                   ; $7F4A: $09
    pop  af                                       ; $7F4B: $F1
    ld   e, $00                                   ; $7F4C: $1E $00
    bit  7, a                                     ; $7F4E: $CB $7F
    jr   z, jr_003_7F54                           ; $7F50: $28 $02

    ld   e, $F0                                   ; $7F52: $1E $F0

jr_003_7F54:
    swap a                                        ; $7F54: $CB $37
    and  $0F                                      ; $7F56: $E6 $0F
    or   e                                        ; $7F58: $B3
    rr   d                                        ; $7F59: $CB $1A
    adc  [hl]                                     ; $7F5B: $8E
    ld   [hl], a                                  ; $7F5C: $77

jr_003_7F5D:
    ret                                           ; $7F5D: $C9

func_003_7F5E::
    ld   hl, wEntitiesSpeedZTable                 ; $7F5E: $21 $20 $C3
    add  hl, bc                                   ; $7F61: $09
    ld   a, [hl]                                  ; $7F62: $7E
    and  a                                        ; $7F63: $A7
    jr   z, jr_003_7F5D                           ; $7F64: $28 $F7

    push af                                       ; $7F66: $F5
    swap a                                        ; $7F67: $CB $37
    and  $F0                                      ; $7F69: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $7F6B: $21 $30 $C3
    add  hl, bc                                   ; $7F6E: $09
    add  [hl]                                     ; $7F6F: $86
    ld   [hl], a                                  ; $7F70: $77
    rl   d                                        ; $7F71: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7F73: $21 $10 $C3
    jr   jr_003_7F4A                              ; $7F76: $18 $D2

func_003_7F78::
    ldh  a, [hActiveEntityStatus]                 ; $7F78: $F0 $EA
    cp   $05                                      ; $7F7A: $FE $05
    jr   nz, jr_003_7FA7                          ; $7F7C: $20 $29

func_003_7F7E::
    ld   a, [wGameplayType]                       ; $7F7E: $FA $95 $DB
    cp   $07                                      ; $7F81: $FE $07
    jr   z, jr_003_7FA7                           ; $7F83: $28 $22

    cp   $01                                      ; $7F85: $FE $01
    jr   z, jr_003_7F94                           ; $7F87: $28 $0B

    cp   $0B                                      ; $7F89: $FE $0B
    jr   nz, jr_003_7FA7                          ; $7F8B: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7F8D: $FA $6B $C1
    cp   $04                                      ; $7F90: $FE $04
    jr   nz, jr_003_7FA7                          ; $7F92: $20 $13

jr_003_7F94:
    ld   a, [wDialogState]                        ; $7F94: $FA $9F $C1
    ld   hl, $C1A8                                ; $7F97: $21 $A8 $C1
    or   [hl]                                     ; $7F9A: $B6
    ld   hl, wInventoryAppearing                  ; $7F9B: $21 $4F $C1
    or   [hl]                                     ; $7F9E: $B6
    jr   nz, jr_003_7FA7                          ; $7F9F: $20 $06

    ld   a, [wRoomTransitionState]                ; $7FA1: $FA $24 $C1
    and  a                                        ; $7FA4: $A7
    jr   z, jr_003_7FA8                           ; $7FA5: $28 $01

jr_003_7FA7:
    pop  af                                       ; $7FA7: $F1

jr_003_7FA8:
    ret                                           ; $7FA8: $C9

; Inputs:
;   bc   entity index
func_003_7FA9::
    ; If entity's wEntitiesIgnoreHitsCountdownTable   != 0, return.
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7FA9: $21 $10 $C4
    add  hl, bc                                   ; $7FAC: $09
    ld   a, [hl]                                  ; $7FAD: $7E
    and  a                                        ; $7FAE: $A7
    ret  z                                        ; $7FAF: $C8

    ; Decrement wEntitiesIgnoreHitsCountdownTable
    dec  a                                        ; $7FB0: $3D
    ld   [hl], a                                  ; $7FB1: $77

    call label_3E8E                               ; $7FB2: $CD $8E $3E

    ld   hl, wEntitiesSpeedXTable                 ; $7FB5: $21 $40 $C2
    add  hl, bc                                   ; $7FB8: $09
    ld   a, [hl]                                  ; $7FB9: $7E
    push af                                       ; $7FBA: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $7FBB: $21 $50 $C2
    add  hl, bc                                   ; $7FBE: $09
    ld   a, [hl]                                  ; $7FBF: $7E
    push af                                       ; $7FC0: $F5
    ld   hl, $C3F0                                ; $7FC1: $21 $F0 $C3
    add  hl, bc                                   ; $7FC4: $09
    ld   a, [hl]                                  ; $7FC5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7FC6: $21 $40 $C2
    add  hl, bc                                   ; $7FC9: $09
    ld   [hl], a                                  ; $7FCA: $77
    ld   hl, wEntitiesUnknowTableS                ; $7FCB: $21 $00 $C4
    add  hl, bc                                   ; $7FCE: $09
    ld   a, [hl]                                  ; $7FCF: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7FD0: $21 $50 $C2
    add  hl, bc                                   ; $7FD3: $09
    ld   [hl], a                                  ; $7FD4: $77
    call func_003_7F25                            ; $7FD5: $CD $25 $7F
    ld   hl, wEntitiesUnknowTableH                ; $7FD8: $21 $30 $C4
    add  hl, bc                                   ; $7FDB: $09
    ld   a, [hl]                                  ; $7FDC: $7E
    and  $20                                      ; $7FDD: $E6 $20
    jr   nz, jr_003_7FE4                          ; $7FDF: $20 $03

    call func_003_7893                            ; $7FE1: $CD $93 $78

jr_003_7FE4:
    ld   hl, wEntitiesSpeedYTable                 ; $7FE4: $21 $50 $C2
    add  hl, bc                                   ; $7FE7: $09
    pop  af                                       ; $7FE8: $F1
    ld   [hl], a                                  ; $7FE9: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7FEA: $21 $40 $C2
    add  hl, bc                                   ; $7FED: $09
    pop  af                                       ; $7FEE: $F1
    ld   [hl], a                                  ; $7FEF: $77
    pop  af                                       ; $7FF0: $F1
    call label_3EAF                               ; $7FF1: $CD $AF $3E
    ret                                           ; $7FF4: $C9
