; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "data/entities/options1.asm"

; Indexed by wEntitiesHealthGroup, 16 bytes per entry, sub indexed by damage type (wC19E)
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
    db   $01, $01, $01, $00, $00, $01, $02, $01, $02, $03, $03, $02, $00, $00, $00, $00   ;; 03:43F4
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $03, $03, $02, $00, $00, $00, $00   ;; 03:4404
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $01, $03, $02, $00, $00, $00, $00   ;; 03:4414
    db   $01, $01, $01, $00, $00, $02, $01, $02, $01, $01, $03, $02, $00, $00, $00, $00   ;; 03:4424
    db   $00, $03, $03, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $00, $00   ;; 03:4434
    db   $00, $00, $03, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $00, $00   ;; 03:4444
    db   $00, $00, $00, $00, $00, $00, $00, $00, $02, $03, $00, $00, $00, $00, $00, $00   ;; 03:4454
    db   $00, $00, $00, $00, $00, $01, $03, $01, $02, $03, $01, $01, $00, $00, $00, $00   ;; 03:4464
    db   $00, $00, $00, $00, $00, $03, $01, $02, $04, $00, $00, $01, $00, $00, $00, $00   ;; 03:4474
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4484
    db   $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $03, $01, $00, $00, $00, $00   ;; 03:4494
    db   $00, $00, $00, $00, $00, $00, $01, $03, $01, $00, $00, $00, $00, $00, $00, $00   ;; 03:44A4
    db   $00, $00, $00, $00, $00, $01, $01, $03, $01, $01, $01, $03, $00, $00, $00, $00   ;; 03:44B4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:44C4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:44D4
    db   $01, $01, $01, $01, $01, $02, $01, $02, $02, $02, $03, $03, $00, $00, $00, $00   ;; 03:44E4
    db   $00, $00, $00, $00, $00, $02, $02, $02, $04, $00, $01, $02, $00, $00, $00, $00   ;; 03:44F4
    db   $01, $02, $02, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4504
    db   $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4514
    db   $01, $01, $01, $01, $02, $02, $02, $02, $02, $00, $02, $02, $00, $00, $00, $00   ;; 03:4524
    db   $01, $01, $01, $01, $02, $02, $02, $02, $04, $00, $02, $02, $00, $00, $00, $00   ;; 03:4534
    db   $00, $01, $01, $01, $02, $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ;; 03:4544
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ;; 03:4554
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ;; 03:4564
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4574
    db   $01, $01, $01, $01, $01, $00, $00, $02, $00, $00, $02, $02, $00, $00, $00, $00   ;; 03:4584
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00   ;; 03:4594
    db   $01, $01, $01, $01, $01, $01, $00, $02, $00, $00, $01, $00, $00, $00, $00, $00   ;; 03:45A4
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00   ;; 03:45B4
    db   $01, $01, $01, $01, $01, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:45C4
    db   $01, $01, $01, $01, $01, $01, $02, $02, $00, $00, $02, $00, $00, $00, $00, $00   ;; 03:45D4
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00   ;; 03:45E4
    db   $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $02, $01, $00, $00, $00, $00   ;; 03:45F4
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ;; 03:4604
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ;; 03:4614
    db   $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4624
    db   $01, $01, $01, $01, $01, $01, $01, $02, $01, $00, $03, $00, $00, $00, $00, $00   ;; 03:4634
    db   $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $02, $00, $00, $00, $00   ;; 03:4644
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ;; 03:4654
    db   $01, $01, $01, $01, $01, $01, $02, $01, $02, $00, $01, $02, $00, $00, $00, $00   ;; 03:4664
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ;; 03:4674
    db   $00, $00, $01, $01, $01, $00, $02, $00, $02, $00, $03, $00, $00, $00, $00, $00   ;; 03:4684
    db   $01, $01, $01, $00, $00, $02, $02, $02, $02, $00, $00, $02, $00, $00, $00, $00   ;; 03:4694
    db   $01, $01, $01, $00, $00, $02, $00, $00, $05, $02, $03, $03, $00, $00, $00, $00   ;; 03:46A4
    db   $00, $00, $00, $00, $00, $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00   ;; 03:46B4
    db   $01, $01, $01, $01, $01, $01, $02, $01, $04, $00, $01, $02, $00, $00, $00, $00   ;; 03:46C4
    db   $00, $00, $00, $00, $00, $00, $00, $02, $04, $00, $02, $02, $00, $00, $00, $00   ;; 03:46D4
    db   $01, $01, $01, $01, $01, $01, $01, $02, $04, $00, $03, $02, $00, $00, $00, $00   ;; 03:46E4
    db   $01, $01, $01, $01, $01, $02, $02, $01, $01, $00, $03, $02, $00, $00, $00, $00   ;; 03:46F4
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $00, $06, $06, $00, $00, $00, $00   ;; 03:4704
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ;; 03:4714
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ;; 03:4724
    db   $01, $01, $01, $01, $01, $00, $00, $00, $00, $06, $00, $00, $00, $00, $00, $00   ;; 03:4734


; Indexed by entry from above table + damage type (wC19E) * 8
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

DestroyedEntityHealthGroupOffsetTable::
    ; indexed by (destroyed entity index high byte) | wEntitiesHealthGroup
    ; TODO: comment index (52 Entries -> 4*13 is possible)
    db   $02, $06, $01, $03, $03, $03, $0D, $08, $0A, $02, $07, $0B, $00, $04, $00, $08
    db   $04, $0E, $0E, $0E, $0E, $0E, $00, $03, $03, $03, $03, $03, $03, $03, $03, $03
    db   $03, $02, $00, $00, $02, $00, $00, $00, $00, $06, $06, $0D, $0E, $00, $09, $03
    db   $06, $00, $02, $0E, $0E

; Configure a newly created entity: load health, flags, and so on.
;
; Inputs:
;   bc   entity index
ConfigureNewEntity::
    call ResetEntity_trampoline                   ;; 03:485B $CD $0A $3A

    ; Store the entity room id
    ldh  a, [hMapRoom]                            ;; 03:485E $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 03:4860 $21 $E0 $C3
    add  hl, bc                                   ;; 03:4863 $09
    ld   [hl], a                                  ;; 03:4864 $77

    ; Set the entity load order to a default value
    ld   hl, wEntitiesLoadOrderTable              ;; 03:4865 $21 $60 $C4
    add  hl, bc                                   ;; 03:4868 $09
    ld   [hl], $FF                                ;; 03:4869 $36 $FF

.attributes
    ; de = entity type
    ld   hl, wEntitiesTypeTable                   ;; 03:486B $21 $A0 $C3
    add  hl, bc                                   ;; 03:486E $09
    ld   e, [hl]                                  ;; 03:486F $5E
    ld   d, b                                     ;; 03:4870 $50

    ; wEntitiesPhysicsFlagsTable = PhysicsFlagsForEntity[EntityType]
    ld   hl, PhysicsFlagsForEntity                ;; 03:4871 $21 $00 $40
    add  hl, de                                   ;; 03:4874 $19
    ld   a, [hl]                                  ;; 03:4875 $7E
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:4876 $21 $40 $C3
    add  hl, bc                                   ;; 03:4879 $09
    ld   [hl], a                                  ;; 03:487A $77

    ; wEntitiesHitboxFlagsTable = HitboxFlagsForEntity[EntityType]
    ld   hl, HitboxFlagsForEntity                 ;; 03:487B $21 $FB $40
    add  hl, de                                   ;; 03:487E $19
    ld   a, [hl]                                  ;; 03:487F $7E
    ld   hl, wEntitiesHitboxFlagsTable            ;; 03:4880 $21 $50 $C3
    add  hl, bc                                   ;; 03:4883 $09
    ld   [hl], a                                  ;; 03:4884 $77

    call ConfigureEntityHealth                    ;; 03:4885 $CD $95 $48

    ld   hl, Options1ForEntity                    ;; 03:4888 $21 $F1 $42
    add  hl, de                                   ;; 03:488B $19
    ld   a, [hl]                                  ;; 03:488C $7E
    ld   hl, wEntitiesOptions1Table               ;; 03:488D $21 $30 $C4
    add  hl, bc                                   ;; 03:4890 $09
    ld   [hl], a                                  ;; 03:4891 $77

    jp   ConfigureEntityHitbox                    ;; 03:4892 $C3 $EA $3A

ConfigureEntityHealth::
    push de                                       ;; 03:4895 $D5
    ; e = HealthGroupForEntity[entity index]
    ld   hl, HealthGroupForEntity                 ;; 03:4896 $21 $F6 $41
    add  hl, de                                   ;; 03:4899 $19
    ld   e, [hl]                                  ;; 03:489A $5E
    ; wEntitiesHealthGroup[entity index] = e
    ld   hl, wEntitiesHealthGroup                 ;; 03:489B $21 $D0 $C4
    add  hl, bc                                   ;; 03:489E $09
    ld   [hl], e                                  ;; 03:489F $73
    ; a = InitialHealthForGroup[health group]
    ld   d, b                                     ;; 03:48A0 $50
    ld   hl, InitialHealthForGroup                ;; 03:48A1 $21 $BC $47
    add  hl, de                                   ;; 03:48A4 $19
    ld   a, [hl]                                  ;; 03:48A5 $7E
    ; wEntitiesHealthTable[entity index] = a
    ld   hl, wEntitiesHealthTable                 ;; 03:48A6 $21 $60 $C3
    add  hl, bc                                   ;; 03:48A9 $09
    ld   [hl], a                                  ;; 03:48AA $77
    pop  de                                       ;; 03:48AB $D1
    ret                                           ;; 03:48AC $C9

MasterStalfosDefeated:
    ld   a, $01                                   ;; 03:48AD $3E $01
    ld   [wRoomEventEffectExecuted], a            ;; 03:48AF $EA $8F $C1
    jp   UnloadEntityAndReturn                    ;; 03:48B2 $C3 $8D $3F

EntityInitHandler::
    ; If the entity is a boss, and the room's boss is defeated, don't load the entity.
    ld   hl, wEntitiesOptions1Table               ;; 03:48B5 $21 $30 $C4
    add  hl, bc                                   ;; 03:48B8 $09
    ld   a, [hl]                                  ;; 03:48B9 $7E
    and  ENTITY_OPT1_IS_BOSS                      ;; 03:48BA $E6 $80
    jr   z, .callEntityInitHandler                ; $48BC: $28 $5
    ldh  a, [hRoomStatus]                         ;; 03:48BE $F0 $F8
    and  ROOM_STATUS_EVENT_2|ROOM_STATUS_EVENT_1  ;; 03:48C0 $E6 $30
IF __PATCH_0__ ; Could probably be moved into __OPTIMIZATIONS_1__
    jp   nz, UnloadEntityAndReturn
ELSE
    jr   z, .roomStatusEnd                        ;; 03:48C2 $28 $03
    jp   UnloadEntityAndReturn                    ;; 03:48C4 $C3 $8D $3F
ENDC

.roomStatusEnd

    ;
    ; Special case for Master Stalfos
    ;

    ldh  a, [hActiveEntityType]                   ;; 03:48C7 $F0 $EB
    cp   ENTITY_MASTER_STALFOS                    ;; 03:48C9 $FE $5F
    jr   nz, .masterStalfosEnd                    ;; 03:48CB $20 $23

    ldh  a, [hMapRoom]                            ;; 03:48CD $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_1    ;; 03:48CF $FE $95
    jr   z, .masterStalfosEnd                     ;; 03:48D1 $28 $1D
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_2    ;; 03:48D3 $FE $92
    jr   z, .masterStalfosEnd                     ;; 03:48D5 $28 $19
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_3    ;; 03:48D7 $FE $84
    jr   z, .jr_003_48E2                          ;; 03:48D9 $28 $07

    ld   a, [wIndoorARoomStatus + ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_3] ;; 03:48DB $FA $84 $D9
    and  $30                                      ;; 03:48DE $E6 $30
    jr   z, MasterStalfosDefeated                 ;; 03:48E0 $28 $CB

.jr_003_48E2
    ld   a, [wIndoorARoomStatus + ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_2] ;; 03:48E2 $FA $92 $D9
    and  $30                                      ;; 03:48E5 $E6 $30
    jr   z, MasterStalfosDefeated                 ;; 03:48E7 $28 $C4

    ld   a, [wIndoorARoomStatus + ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_1] ;; 03:48E9 $FA $95 $D9
    and  $30                                      ;; 03:48EC $E6 $30
    jr   z, MasterStalfosDefeated                 ;; 03:48EE $28 $BD
.masterStalfosEnd

    ld   a, [wIsIndoor]                           ;; 03:48F0 $FA $A5 $DB
    and  a                                        ;; 03:48F3 $A7
    jr   z, .indoorEnd                            ;; 03:48F4 $28 $12

    ld   a, [wD478]                               ;; 03:48F6 $FA $78 $D4
    and  a                                        ;; 03:48F9 $A7
    jr   nz, .jr_003_490B                         ;; 03:48FA $20 $0F

    ld   hl, wEntitiesOptions1Table               ;; 03:48FC $21 $30 $C4
    add  hl, bc                                   ;; 03:48FF $09
    ld   a, [hl]                                  ;; 03:4900 $7E
    and  ENTITY_OPT1_IS_MINI_BOSS                 ;; 03:4901 $E6 $04
    jr   z, .indoorEnd                            ;; 03:4903 $28 $03

    ld   [wC1CF], a                               ;; 03:4905 $EA $CF $C1
.indoorEnd

    call label_27F2                               ;; 03:4908 $CD $F2 $27

.jr_003_490B
    xor  a                                        ;; 03:490B $AF
    ld   [wDidBossIntro], a                       ;; 03:490C $EA $BD $C1
    inc  a                                        ;; 03:490F $3C
    ld   [wInBossBattle], a                       ;; 03:4910 $EA $BE $C1
    ld   a, $20                                   ;; 03:4913 $3E $20
    ld   [wBossIntroDelay], a                     ;; 03:4915 $EA $65 $C1

.callEntityInitHandler

    ; Mark the entity as active
    ld   hl, wEntitiesStatusTable                 ;; 03:4918 $21 $80 $C2
    add  hl, bc                                   ;; 03:491B $09
    ld   [hl], ENTITY_STATUS_ACTIVE               ;; 03:491C $36 $05

    ld   a, BANK(@)                               ;; 03:491E $3E $03
    call GetEntityInitHandler_trampoline          ;; 03:4920 $CD $D3 $09
    jp   hl                                       ;; 03:4923 $E9

Data_003_4924::
    db   $01, $04

EntityInitHorsePiece::
    ld   hl, wEntitiesLoadOrderTable              ;; 03:4926 $21 $60 $C4
    add  hl, bc                                   ;; 03:4929 $09
    ld   e, [hl]                                  ;; 03:492A $5E
    ld   d, b                                     ;; 03:492B $50

    ld   hl, Data_003_4924                        ;; 03:492C $21 $24 $49
    add  hl, de                                   ;; 03:492F $19
    ld   a, [hl]                                  ;; 03:4930 $7E
    jp   SetEntitySpriteVariant                   ;; 03:4931 $C3 $0C $3B

EntityInitMarinAtTalTalHeights::
    ld   hl, wEntitiesPosYTable                   ;; 03:4934 $21 $10 $C2
    add  hl, bc                                   ;; 03:4937 $09
    ld   a, [hl]                                  ;; 03:4938 $7E
    sub  $03                                      ;; 03:4939 $D6 $03
    ld   [hl], a                                  ;; 03:493B $77
    ret                                           ;; 03:493C $C9

EntityInitSnake::
    call GetEntityPrivateCountdown1               ;; 03:493D $CD $00 $0C
    ld   [hl], $30                                ;; 03:4940 $36 $30
    ret                                           ;; 03:4942 $C9

EntityInitSideViewPlatformVertical::
    ldh  a, [hMapRoom]                            ;; 03:4943 $F0 $F6
    cp   UNKNOWN_ROOM_65                          ;; 03:4945 $FE $65
    ret  nz                                       ;; 03:4947 $C0

    ldh  a, [hActiveEntityVisualPosY]             ;; 03:4948 $F0 $EC
    cp   $50                                      ;; 03:494A $FE $50
    ret  c                                        ;; 03:494C $D8

    ld   hl, wEntitiesPrivateState1Table          ;; 03:494D $21 $B0 $C2
    add  hl, bc                                   ;; 03:4950 $09
    inc  [hl]                                     ;; 03:4951 $34
    ret                                           ;; 03:4952 $C9

EntityInitZol::
    ld   hl, wEntitiesHealthTable                 ;; 03:4953 $21 $60 $C3
    add  hl, bc                                   ;; 03:4956 $09
    ld   [hl], $02                                ;; 03:4957 $36 $02
    ret                                           ;; 03:4959 $C9

EntityInitMarinAtTheShore::
    ld   hl, wIsMarinInAnimalVillage              ;; 03:495A $21 $74 $DB
    ld   a, [wIsMarinFollowingLink]               ;; 03:495D $FA $73 $DB
    or   [hl]                                     ;; 03:4960 $B6
    jp   nz, UnloadEntityAndReturn                ;; 03:4961 $C2 $8D $3F

    ret                                           ;; 03:4964 $C9

EntityInitBomber::
    ld   hl, wEntitiesPosZTable                   ;; 03:4965 $21 $10 $C3
    add  hl, bc                                   ;; 03:4968 $09
    ld   [hl], $10                                ;; 03:4969 $36 $10
    call GetRandomByte                            ;; 03:496B $CD $0D $28
    ld   hl, wEntitiesInertiaTable                ;; 03:496E $21 $D0 $C3
    add  hl, bc                                   ;; 03:4971 $09
    ld   [hl], a                                  ;; 03:4972 $77

EntityInitBushCrawler::
    ret                                           ;; 03:4973 $C9

EntityInitTarinBeekeeper::
    call EntityShiftPosition                      ;; 03:4974 $CD $83 $4F
    ld   a, $02                                   ;; 03:4977 $3E $02
    jp   SetEntitySpriteVariant                   ;; 03:4979 $C3 $0C $3B

EntityInitTelephone::
    ld   a, MUSIC_ULRIRA                          ;; 03:497C $3E $33
    jr   SetMusicTrackIfHasSword                  ;; 03:497E $18 $15

EntityInitRichard::
    ld   a, [wGoldenLeavesCount]                  ;; 03:4980 $FA $15 $DB
    cp   SLIME_KEY                                ;; 03:4983 $FE $06
    jr   c, .jr_003_4993                          ;; 03:4985 $38 $0C

    ld   hl, wEntitiesPosXTable                   ;; 03:4987 $21 $00 $C2
    add  hl, bc                                   ;; 03:498A $09
    ld   [hl], $58                                ;; 03:498B $36 $58
    ld   hl, wEntitiesDirectionTable              ;; 03:498D $21 $80 $C3
    add  hl, bc                                   ;; 03:4990 $09
    ld   [hl], DIRECTION_DOWN                     ;; 03:4991 $36 $03
.jr_003_4993

    ld   a, MUSIC_RICHARD_HOUSE                   ;; 03:4993 $3E $40
    ; fallthrough

SetMusicTrackIfHasSword::
    ld   e, a                                     ;; 03:4995 $5F
    ld   a, [wSwordLevel]                         ;; 03:4996 $FA $4E $DB
    and  a                                        ;; 03:4999 $A7
    ret  z                                        ;; 03:499A $C8

    ld   a, e                                     ;; 03:499B $7B

SetMusicTrack::
    ld   [wMusicTrackToPlay], a                   ;; 03:499C $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ;; 03:499F $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ;; 03:49A1 $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ;; 03:49A3 $E0 $BF
    ret                                           ;; 03:49A5 $C9

EntityInitFinalNightmare::
    xor  a                                        ;; 03:49A6 $AF
    ld   [wFinalNightmareForm], a                 ;; 03:49A7 $EA $19 $D2
    jp   label_27F2                               ;; 03:49AA $C3 $F2 $27

EntityInitDreamShrineBed::
    ld   a, MUSIC_DREAM_SHRINE_BED                ;; 03:49AD $3E $24
    jr   SetMusicTrack                            ;; 03:49AF $18 $EB

EntityInitFishermanUnderBridge::
    ld   a, MUSIC_FISHERMAN_UNDER_BRIDGE          ;; 03:49B1 $3E $3A
    jr   SetMusicTrack                            ;; 03:49B3 $18 $E7

EntityInitKikiTheMonkey::
    xor  a                                        ;; 03:49B5 $AF
    ld   [wC168], a                               ;; 03:49B6 $EA $68 $C1

    ld   hl, wEntitiesPosYTable                   ;; 03:49B9 $21 $10 $C2
    add  hl, bc                                   ;; 03:49BC $09
    ld   a, [hl]                                  ;; 03:49BD $7E
    sub  $04                                      ;; 03:49BE $D6 $04
    ld   [hl], a                                  ;; 03:49C0 $77

    ret                                           ;; 03:49C1 $C9

EntityInitFireballShooter::
    call GetRandomByte                            ;; 03:49C2 $CD $0D $28
    jp   SetEntitySpriteVariant                   ;; 03:49C5 $C3 $0C $3B

EntityInitAntiKirby::
    call GetEntitySlowTransitionCountdown         ;; 03:49C8 $CD $FB $0B
    call GetRandomByte                            ;; 03:49CB $CD $0D $28
    and  $3F                                      ;; 03:49CE $E6 $3F
    add  $10                                      ;; 03:49D0 $C6 $10
    ld   [hl], a                                  ;; 03:49D2 $77
    ret                                           ;; 03:49D3 $C9

EntityInitMovingBlockMover::
    ld   hl, wEntitiesPosYTable                   ;; 03:49D4 $21 $10 $C2
    add  hl, bc                                   ;; 03:49D7 $09
    ld   a, [hl]                                  ;; 03:49D8 $7E
    add  $0A                                      ;; 03:49D9 $C6 $0A
    ld   [hl], a                                  ;; 03:49DB $77
    ld   hl, wEntitiesPrivateState2Table          ;; 03:49DC $21 $C0 $C2
    add  hl, bc                                   ;; 03:49DF $09
    ld   [hl], a                                  ;; 03:49E0 $77
    ret                                           ;; 03:49E1 $C9

EntityInitDesertLanmola::
    ; Sets MUSIC_NONE as the default music track. weird...
    xor  a                                        ;; 03:49E2 $AF
    ldh  [hDefaultMusicTrack], a                  ;; 03:49E3 $E0 $B0
    ret                                           ;; 03:49E5 $C9

EntityInitFloatingItem2::
    call SetZPosForFloatingItem                   ;; 03:49E6 $CD $12 $4A
    ldh  a, [hActiveEntityPosX]                   ;; 03:49E9 $F0 $EE
    swap a                                        ;; 03:49EB $CB $37
    and  $01                                      ;; 03:49ED $E6 $01
    add  $04                                      ;; 03:49EF $C6 $04
    jp   SetEntitySpriteVariant                   ;; 03:49F1 $C3 $0C $3B

EntityInitFloatingItem::
    ldh  a, [hActiveEntityPosX]                   ;; 03:49F4 $F0 $EE
    swap a                                        ;; 03:49F6 $CB $37
    and  $01                                      ;; 03:49F8 $E6 $01
    ld   e, a                                     ;; 03:49FA $5F
    ldh  a, [hActiveEntityPosY]                   ;; 03:49FB $F0 $EF
    swap a                                        ;; 03:49FD $CB $37
    inc  a                                        ;; 03:49FF $3C
    rla                                           ;; 03:4A00 $17
    and  $02                                      ;; 03:4A01 $E6 $02
    or   e                                        ;; 03:4A03 $B3
    call SetEntitySpriteVariant                   ;; 03:4A04 $CD $0C $3B
    cp   $01                                      ;; 03:4A07 $FE $01
    jr   nz, SetZPosForFloatingItem               ;; 03:4A09 $20 $07

    ld   a, [wHasToadstool]                       ;; 03:4A0B $FA $4B $DB
    and  a                                        ;; 03:4A0E $A7
    jp   nz, UnloadEntityAndReturn                ;; 03:4A0F $C2 $8D $3F

SetZPosForFloatingItem::
    ld   hl, wEntitiesPosZTable                   ;; 03:4A12 $21 $10 $C3
    add  hl, bc                                   ;; 03:4A15 $09
    ld   [hl], $13                                ;; 03:4A16 $36 $13
    ret                                           ;; 03:4A18 $C9

EntityInitKid71::
    ld   hl, wEntitiesDirectionTable              ;; 03:4A19 $21 $80 $C3
    add  hl, bc                                   ;; 03:4A1C $09
    ld   [hl], DIRECTION_UP                       ;; 03:4A1D $36 $02
    call IncrementEntityState                     ;; 03:4A1F $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 03:4A22 $CD $05 $0C
    ld   [hl], $20                                ;; 03:4A25 $36 $20

EntityInitKid72::
    ret                                           ;; 03:4A27 $C9

EntityInitMrWrite::
    ldh  a, [hMapRoom]                            ;; 03:4A28 $F0 $F6
    cp   ROOM_INDOOR_B_CHRISTINE_HOUSE            ;; 03:4A2A $FE $D9
    ld   a, $32                                   ;; 03:4A2C $3E $32
    jr   nz, .jr_4A32                             ;; 03:4A2E $20 $02

    ld   a, $37                                   ;; 03:4A30 $3E $37

.jr_4A32
    jr   jr_003_4A4F                              ;; 03:4A32 $18 $1B

EntityInitBigFairy::
    ld   hl, wEntitiesPosZTable                   ;; 03:4A34 $21 $10 $C3
    add  hl, bc                                   ;; 03:4A37 $09
    ld   [hl], $10                                ;; 03:4A38 $36 $10

    ld   a, [wIsIndoor]                           ;; 03:4A3A $FA $A5 $DB
    and  a                                        ;; 03:4A3D $A7
    jr   z, .indoorEnd                            ;; 03:4A3E $28 $06

    ldh  a, [hMapId]                              ;; 03:4A40 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:4A42 $FE $FF
    jr   z, jr_003_4A4D                           ;; 03:4A44 $28 $07
.indoorEnd

    ld   a, [wFullHearts]                         ;; 03:4A46 $FA $A9 $C5
    and  a                                        ;; 03:4A49 $A7
    jp   nz, UnloadEntityAndReturn                ;; 03:4A4A $C2 $8D $3F

jr_003_4A4D:
    ld   a, $0C                                   ;; 03:4A4D $3E $0C

jr_003_4A4F:
    call SetMusicTrackIfHasSword                  ;; 03:4A4F $CD $95 $49
    ld   de, wEntitiesPosXSignTable               ;; 03:4A52 $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ;; 03:4A55 $21 $00 $C2
    jp   EntityShiftPosition.shiftBy8             ;; 03:4A58 $C3 $92 $4F

EntityInitBowWow::
    ldh  a, [hMapRoom]                            ;; 03:4A5B $F0 $F6
    cp   UNKNOWN_ROOM_E2                          ;; 03:4A5D $FE $E2
    jr   nz, .jr_4A6B                             ;; 03:4A5F $20 $0A

    ld   a, [wIsBowWowFollowingLink]              ;; 03:4A61 $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 03:4A64 $FE $80
    jr   z, .return                               ;; 03:4A66 $28 $0A

    jp   UnloadEntityAndReturn                    ;; 03:4A68 $C3 $8D $3F

.jr_4A6B
    ld   a, [wIsBowWowFollowingLink]              ;; 03:4A6B $FA $56 $DB
    and  a                                        ;; 03:4A6E $A7
    jp   nz, UnloadEntityAndReturn                ;; 03:4A6F $C2 $8D $3F

.return
    ret                                           ;; 03:4A72 $C9

EntityInitOwlEvent::
    ; Unload the owl if the event already played once
    ldh  a, [hRoomStatus]                         ;; 03:4A73 $F0 $F8
    rra                                           ;; 03:4A75 $1F
    jr   UnloadEntityIfRoomStatusSet              ;; 03:4A76 $18 $02

EntityInitSword::
    ; Unload the sword if it was already picked
    ldh  a, [hRoomStatus]                         ;; 03:4A78 $F0 $F8
    ; fallthrough

UnloadEntityIfRoomStatusSet::
    and  $10                                      ;; 03:4A7A $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:4A7C $C2 $8D $3F

    ret                                           ;; 03:4A7F $C9

EntityInitMarin::
    ; Check if the current room is > $C0, ie.
    ; below Mabe Village, which in practice means
    ; we're in Animal Village (Marin at the shore
    ; is a separate entity)
    ldh  a, [hMapRoom]                            ;; 03:4A80 $F0 $F6
    cp   UNKNOWN_ROOM_C0                          ;; 03:4A82 $FE $C0
    jr   c, .checkMarinDebug                      ;; 03:4A84 $38 $1D

    ; Check if Marin should be here
    ld   a, [wIsMarinInAnimalVillage]             ;; 03:4A86 $FA $74 $DB
    and  a                                        ;; 03:4A89 $A7
    jp   z, UnloadEntityAndReturn                 ;; 03:4A8A $CA $8D $3F

    ; Check if Marin is currently following Link
    ld   a, [wIsMarinFollowingLink]               ;; 03:4A8D $FA $73 $DB
    and  a                                        ;; 03:4A90 $A7
    jp   nz, UnloadEntityAndReturn                ;; 03:4A91 $C2 $8D $3F

    ; Marin is here and not following Link, so
    ; she should sing Ballad of the Wind Fish
    inc  a                                        ;; 03:4A94 $3C
    ld   [wIsMarinSinging], a                     ;; 03:4A95 $EA $C8 $C3
    ld   a, MUSIC_MARIN_SING                      ;; 03:4A98 $3E $2F
    ldh  [hNextMusicTrackToFadeInto], a           ;; 03:4A9A $E0 $B1
    ldh  [hDefaultMusicTrack], a                  ;; 03:4A9C $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ;; 03:4A9E $E0 $BD
    call ResetMusicFadeTimer                      ;; 03:4AA0 $CD $EA $27

.checkMarinDebug
    ; Check if Marin should trigger debugging
    ; tools
    ld   a, [ROM_DebugTool1]                      ;; 03:4AA3 $FA $03 $00
    and  a                                        ;; 03:4AA6 $A7
    jp   z, EntityInitNpcFacingDown               ;; 03:4AA7 $CA $2F $4B

    ; Check if player's name begins with 0
    ld   a, [wName]                               ;; 03:4AAA $FA $4F $DB
    and  a                                        ;; 03:4AAD $A7
    jr   nz, EntityInitNpcFacingDown              ;; 03:4AAE $20 $7F

    ld   a, [wName + 1]                           ;; 03:4AB0 $FA $50 $DB
    and  a                                        ;; 03:4AB3 $A7
    ; If player's name begins with single 0,
    ; activate the text debugger
    jr   nz, .enableTextDebugger                  ;; 03:4AB4 $20 $09

    ; If player's name begins with 00,
    ; jump to credits
    ld   [wGameplaySubtype], a                    ;; 03:4AB6 $EA $96 $DB
    ld   a, GAMEPLAY_CREDITS                      ;; 03:4AB9 $3E $01
    ld   [wGameplayType], a                       ;; 03:4ABB $EA $95 $DB
    ret                                           ;; 03:4ABE $C9

.enableTextDebugger
    ld   hl, wEntitiesTypeTable                   ;; 03:4ABF $21 $A0 $C3
    add  hl, bc                                   ;; 03:4AC2 $09
    ld   [hl], ENTITY_TEXT_DEBUGGER               ;; 03:4AC3 $36 $6B
    ret                                           ;; 03:4AC5 $C9

Data_003_4AC6::
    db   $FF, $7F, $BE, $0F, $13, $02, $00, $00

EntityInitTarin::
    ldh  a, [hIsGBC]                              ;; 03:4ACE $F0 $FE
    and  a                                        ;; 03:4AD0 $A7
    jr   z, EntityInitNpcFacingDown               ;; 03:4AD1 $28 $5C

    ld   a, [wIsIndoor]                           ;; 03:4AD3 $FA $A5 $DB
    and  a                                        ;; 03:4AD6 $A7
    jr   z, EntityInitNpcFacingDown               ;; 03:4AD7 $28 $56

    ld   a, [wIsMarinFollowingLink]               ;; 03:4AD9 $FA $73 $DB
    and  a                                        ;; 03:4ADC $A7
    jr   nz, EntityInitNpcFacingDown              ;; 03:4ADD $20 $50

    ld   a, [wHasInstrument3]                     ;; 03:4ADF $FA $67 $DB
    and  $02                                      ;; 03:4AE2 $E6 $02
    jr   nz, EntityInitNpcFacingDown              ;; 03:4AE4 $20 $49

    ld   a, [wTradeSequenceItem]                  ;; 03:4AE6 $FA $0E $DB
    cp   TRADING_ITEM_BANANAS                     ;; 03:4AE9 $FE $04
    jr   nc, EntityInitNpcFacingDown              ;; 03:4AEB $30 $42

    ld   a, [wTarinFlag]                          ;; 03:4AED $FA $48 $DB
    and  a                                        ;; 03:4AF0 $A7
    jr   z, EntityInitNpcFacingDown               ;; 03:4AF1 $28 $3C

    cp   $01                                      ;; 03:4AF3 $FE $01
    jr   z, EntityInitNpcFacingDown               ;; 03:4AF5 $28 $38

    ld   a, $02                                   ;; 03:4AF7 $3E $02
    ldh  [rSVBK], a                               ;; 03:4AF9 $E0 $70
    ld   hl, wObjPal8                             ;; 03:4AFB $21 $88 $DC
    ld   de, Data_003_4AC6                        ;; 03:4AFE $11 $C6 $4A

.loop_4B01
    ld   a, [de]                                  ;; 03:4B01 $1A
    ld   [hl+], a                                 ;; 03:4B02 $22
    inc  de                                       ;; 03:4B03 $13
    ld   a, l                                     ;; 03:4B04 $7D
    and  $07                                      ;; 03:4B05 $E6 $07
    jr   nz, .loop_4B01                           ;; 03:4B07 $20 $F8

    xor  a                                        ;; 03:4B09 $AF
    ldh  [rSVBK], a                               ;; 03:4B0A $E0 $70
    jr   EntityInitNpcFacingDown                  ;; 03:4B0C $18 $21

EntityInitMadamMeowMeow::
    ld   a, [wIsBowWowFollowingLink]              ;; 03:4B0E $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ;; 03:4B11 $FE $80
    jr   nz, .return                              ;; 03:4B13 $20 $05

    ld   a, MUSIC_BOWWOW_KIDNAPPED                ;; 03:4B15 $3E $0E
    ld   [wMusicTrackToPlay], a                   ;; 03:4B17 $EA $68 $D3

.return
    ret                                           ;; 03:4B1A $C9

EntityInitRaftRaftOwner::
    ld   a, [wIsIndoor]                           ;; 03:4B1B $FA $A5 $DB
    and  a                                        ;; 03:4B1E $A7
    jr   nz, EntityInitNpcFacingDown              ;; 03:4B1F $20 $0E

    ld   a, [wD477]                               ;; 03:4B21 $FA $77 $D4
    and  a                                        ;; 03:4B24 $A7
    ret  nz                                       ;; 03:4B25 $C0

    ld   hl, wEntitiesPosYTable                   ;; 03:4B26 $21 $10 $C2
    add  hl, bc                                   ;; 03:4B29 $09
    ld   a, [hl]                                  ;; 03:4B2A $7E
    sub  $10                                      ;; 03:4B2B $D6 $10
    ld   [hl], a                                  ;; 03:4B2D $77
    ret                                           ;; 03:4B2E $C9

EntityInitNpcFacingDown::
    ld   hl, wEntitiesDirectionTable              ;; 03:4B2F $21 $80 $C3
    add  hl, bc                                   ;; 03:4B32 $09
    ld   [hl], DIRECTION_DOWN                     ;; 03:4B33 $36 $03
    ; fallthrough

EntityInitStoreOwner::
    ld   a, [wShieldLevel]                        ;; 03:4B35 $FA $44 $DB
    and  a                                        ;; 03:4B38 $A7
    jr   nz, .noShieldEnd                         ;; 03:4B39 $20 $05
    ld   a, $1C                                   ;; 03:4B3B $3E $1C
    call SetMusicTrack                            ;; 03:4B3D $CD $9C $49
.noShieldEnd

    jr   EntityInitShopOwner.setDirectionLeft     ;; 03:4B40 $18 $06

EntityInitWitch::
    ret                                           ;; 03:4B42 $C9

EntityInitShopOwner::
    ld   a, MUSIC_SHOP                            ;; 03:4B43 $3E $07
    call SetMusicTrackIfHasSword                  ;; 03:4B45 $CD $95 $49

.setDirectionLeft
    ld   a, DIRECTION_LEFT                        ;; 03:4B48 $3E $01
    jr   SetEntityDirection                       ;; 03:4B4A $18 $05

EntityInitWithRandomDirection::
    call GetRandomByte                            ;; 03:4B4C $CD $0D $28
    and  $03                                      ;; 03:4B4F $E6 $03
    ; fallthrough

SetEntityDirection::
    ld   hl, wEntitiesDirectionTable              ;; 03:4B51 $21 $80 $C3
    add  hl, bc                                   ;; 03:4B54 $09
    ld   [hl], a                                  ;; 03:4B55 $77
    ; fallthrough

EntityInitNoop::
NoopFunction::
    ret                                           ;; 03:4B56 $C9

EntityInitSouthFaceShrineDoor::
    ld   a, IEF_STAT | IEF_VBLANK                 ;; 03:4B57 $3E $03
    ldh  [rIE], a                                 ;; 03:4B59 $E0 $FF
    ret                                           ;; 03:4B5B $C9

EntityInitLeever::
    ld   a, $FF                                   ;; 03:4B5C $3E $FF
    jp   SetEntitySpriteVariant                   ;; 03:4B5E $C3 $0C $3B

EntityInitZora::
    ld   a, [wIsIndoor]                           ;; 03:4B61 $FA $A5 $DB
    and  a                                        ;; 03:4B64 $A7
    jr   z, EntityInitNoop                        ;; 03:4B65 $28 $EF

    ldh  a, [hMapRoom]                            ;; 03:4B67 $F0 $F6
    cp   UNKNOWN_ROOM_DA                          ;; 03:4B69 $FE $DA
    jr   nz, EntityInitNoop                       ;; 03:4B6B $20 $E9

    ld   a, [wTradeSequenceItem]                  ;; 03:4B6D $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 03:4B70 $FE $0E
    jp   nz, UnloadEntityAndReturn                ;; 03:4B72 $C2 $8D $3F

    ld   a, [wPhotos2]                            ;; 03:4B75 $FA $0D $DC
    and  $01                                      ;; 03:4B78 $E6 $01
    jr   z, EntityInitNoop                        ;; 03:4B7A $28 $DA

    ld   a, $03                                   ;; 03:4B7C $3E $03
    jp   SetEntitySpriteVariant                   ;; 03:4B7E $C3 $0C $3B

EntityInitWithRightDirection::
    xor  a                                        ;; 03:4B81 $AF
    jr   SetEntityDirection                       ;; 03:4B82 $18 $CD

GetColorDungeonRoomStatus::
    ld   hl, wColorDungeonRoomStatus              ;; 03:4B84 $21 $E0 $DD
    ldh  a, [hMapRoom]                            ;; 03:4B87 $F0 $F6
    ld   e, a                                     ;; 03:4B89 $5F
    ld   d, $00                                   ;; 03:4B8A $16 $00
    add  hl, de                                   ;; 03:4B8C $19
    ld   a, [hl]                                  ;; 03:4B8D $7E
    ret                                           ;; 03:4B8E $C9

EntityInitRotoswitchRed::
    call GetColorDungeonRoomStatus                ;; 03:4B8F $CD $84 $4B
    and  $10                                      ;; 03:4B92 $E6 $10
    jr   nz, jr_003_4BAD                          ;; 03:4B94 $20 $17

    xor  a                                        ;; 03:4B96 $AF
    jp   SetEntitySpriteVariant                   ;; 03:4B97 $C3 $0C $3B

EntityInitRotoswitchYellow::
    call GetColorDungeonRoomStatus                ;; 03:4B9A $CD $84 $4B
    and  $10                                      ;; 03:4B9D $E6 $10
    jr   nz, jr_003_4BAD                          ;; 03:4B9F $20 $0C

    ld   a, $04                                   ;; 03:4BA1 $3E $04
    jp   SetEntitySpriteVariant                   ;; 03:4BA3 $C3 $0C $3B

EntityInitRotoswitchBlue::
    call GetColorDungeonRoomStatus                ;; 03:4BA6 $CD $84 $4B
    and  $10                                      ;; 03:4BA9 $E6 $10
    jr   z, jr_003_4BB3                           ;; 03:4BAB $28 $06

jr_003_4BAD:
    ld   hl, wEntitiesStateTable                  ;; 03:4BAD $21 $90 $C2
    add  hl, bc                                   ;; 03:4BB0 $09
    ld   [hl], $80                                ;; 03:4BB1 $36 $80

jr_003_4BB3:
    ld   a, $08                                   ;; 03:4BB3 $3E $08
    jp   SetEntitySpriteVariant                   ;; 03:4BB5 $C3 $0C $3B

EntityInitHopper::
    ld   hl, wEntitiesStateTable                  ;; 03:4BB8 $21 $90 $C2
    add  hl, bc                                   ;; 03:4BBB $09
    ld   [hl], $03                                ;; 03:4BBC $36 $03
    jr   EntityInitFlyingHopperBombs.setPosZ      ;; 03:4BBE $18 $02

EntityInitFlyingHopperBombs::
    ld   a, $04                                   ;; 03:4BC0 $3E $04

.setPosZ
    ld   hl, wEntitiesPosZTable                   ;; 03:4BC2 $21 $10 $C3
    add  hl, bc                                   ;; 03:4BC5 $09
    ld   [hl], $10                                ;; 03:4BC6 $36 $10
    jp   SetEntitySpriteVariant                   ;; 03:4BC8 $C3 $0C $3B

EntityInitHardHitBeetle::
    ld   hl, wEntitiesHealthTable                 ;; 03:4BCB $21 $60 $C3
    add  hl, bc                                   ;; 03:4BCE $09
    ld   [hl], $10                                ;; 03:4BCF $36 $10
    ld   hl, wEntitiesPosXTable                   ;; 03:4BD1 $21 $00 $C2
    add  hl, bc                                   ;; 03:4BD4 $09
    ld   a, [hl]                                  ;; 03:4BD5 $7E
    sub  $08                                      ;; 03:4BD6 $D6 $08
    ld   [hl], a                                  ;; 03:4BD8 $77
    jp   EntityInitNoop                           ;; 03:4BD9 $C3 $56 $4B

EntityInitAvalaunch::
    ld   hl, wEntitiesPosXTable                   ;; 03:4BDC $21 $00 $C2
    add  hl, bc                                   ;; 03:4BDF $09
    ld   [hl], $50                                ;; 03:4BE0 $36 $50
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4BE2 $21 $D0 $C2
    add  hl, bc                                   ;; 03:4BE5 $09
    ld   [hl], $00                                ;; 03:4BE6 $36 $00
    jp   EntityInitNoop                           ;; 03:4BE8 $C3 $56 $4B

EntityInitColorGuardianBlue::
    ldh  a, [hIsGBC]                              ;; 03:4BEB $F0 $FE
    and  a                                        ;; 03:4BED $A7
    jp   z, EntityInitNoop                        ;; 03:4BEE $CA $56 $4B

    call GetColorDungeonRoomStatus                ;; 03:4BF1 $CD $84 $4B
    and  $10                                      ;; 03:4BF4 $E6 $10
    jp   z, EntityInitNoop                        ;; 03:4BF6 $CA $56 $4B

    ld   hl, wEntitiesPosXTable                   ;; 03:4BF9 $21 $00 $C2
    add  hl, bc                                   ;; 03:4BFC $09
    ld   a, $3C                                   ;; 03:4BFD $3E $3C
    jr   jr_003_4C15                              ;; 03:4BFF $18 $14

EntityInitColorGuardianRed::
    ldh  a, [hIsGBC]                              ;; 03:4C01 $F0 $FE
    and  a                                        ;; 03:4C03 $A7
    jp   z, EntityInitNoop                        ;; 03:4C04 $CA $56 $4B

    call GetColorDungeonRoomStatus                ;; 03:4C07 $CD $84 $4B
    and  $10                                      ;; 03:4C0A $E6 $10
    jp   z, EntityInitNoop                        ;; 03:4C0C $CA $56 $4B

    ld   hl, wEntitiesPosXTable                   ;; 03:4C0F $21 $00 $C2
    add  hl, bc                                   ;; 03:4C12 $09
    ld   a, $63                                   ;; 03:4C13 $3E $63

jr_003_4C15:
    ld   [hl], a                                  ;; 03:4C15 $77
    ld   hl, wEntitiesStateTable                  ;; 03:4C16 $21 $90 $C2
    add  hl, bc                                   ;; 03:4C19 $09
    ld   [hl], $04                                ;; 03:4C1A $36 $04
    jp   EntityInitNoop                           ;; 03:4C1C $C3 $56 $4B

EntityInitColorDungeonBook::
    ld   hl, wEntitiesPosYTable                   ;; 03:4C1F $21 $10 $C2
    add  hl, bc                                   ;; 03:4C22 $09
IF __OPTIMIZATIONS_1__
    inc  [hl]
    inc  [hl]
ELSE
    ld   a, [hl]                                  ;; 03:4C23 $7E
    add  $02                                      ;; 03:4C24 $C6 $02
    ld   [hl], a                                  ;; 03:4C26 $77
ENDC
    ld   hl, wEntitiesPosZTable                   ;; 03:4C27 $21 $10 $C3
    add  hl, bc                                   ;; 03:4C2A $09
    ld   [hl], $04                                ;; 03:4C2B $36 $04
    ; fallthrough

EntityInitGiantBuzzBlob::
    ld   hl, wEntitiesHealthTable                 ;; 03:4C2D $21 $60 $C3
    add  hl, bc                                   ;; 03:4C30 $09
    ld   [hl], $0C                                ;; 03:4C31 $36 $0C
    xor  a                                        ;; 03:4C33 $AF
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4C34 $21 $D0 $C2
    add  hl, bc                                   ;; 03:4C37 $09
    ld   [hl], a                                  ;; 03:4C38 $77
    ld   hl, wEntitiesPosXTable                   ;; 03:4C39 $21 $00 $C2
    add  hl, bc                                   ;; 03:4C3C $09
    ld   a, [hl]                                  ;; 03:4C3D $7E
    add  $08                                      ;; 03:4C3E $C6 $08
    ld   [hl], a                                  ;; 03:4C40 $77
    jp   EntityInitNoop                           ;; 03:4C41 $C3 $56 $4B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
EntityExplosionSpriteVariants::
.variant0 ;; 03:4C44
    db $34, $02
    db $34, $22
.variant1 ;; 03:4C48
    db $34, $14
    db $34, $34

EntityDestructionHandler::
    call GetEntityTransitionCountdown             ;; 03:4C4C $CD $05 $0C
    jr   z, .destructionEnd                       ;; 03:4C4F $28 $26

    ; Animate the entity destruction with explosions
    ldh  a, [hFrameCounter]                       ;; 03:4C51 $F0 $E7
    rra                                           ;; 03:4C53 $1F
    rra                                           ;; 03:4C54 $1F
    rra                                           ;; 03:4C55 $1F
    and  $01                                      ;; 03:4C56 $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:4C58 $E0 $F1
    ld   de, EntityExplosionSpriteVariants        ;; 03:4C5A $11 $44 $4C
    call RenderActiveEntitySpritesPair            ;; 03:4C5D $CD $C0 $3B
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:4C60 $21 $B0 $C3
    add  hl, bc                                   ;; 03:4C63 $09
    ld   a, [hl]                                  ;; 03:4C64 $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:4C65 $E0 $F1
    call ExecuteActiveEntityHandler_trampoline    ;; 03:4C67 $CD $81 $3A
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:4C6A $CD $7E $7F
    call ApplyRecoilIfNeeded_03                   ;; 03:4C6D $CD $A9 $7F
    call BouncingEntityPhysics                    ;; 03:4C70 $CD $B3 $60
IF __OPTIMIZATIONS_1__
    jp   ClearEntitySpeed
ELSE
    call ClearEntitySpeed                         ;; 03:4C73 $CD $7F $3D
    ret                                           ;; 03:4C76 $C9
ENDC

.destructionEnd
    ; If destroying a Gibdo…
    ldh  a, [hActiveEntityType]                   ;; 03:4C77 $F0 $EB
    cp   ENTITY_GIBDO                             ;; 03:4C79 $FE $1F
    jr   nz, .gibdoEnd                            ;; 03:4C7B $20 $0F
    ; … replace it by a Stalfos.
    ld   hl, wEntitiesTypeTable                   ;; 03:4C7D $21 $A0 $C3
    add  hl, bc                                   ;; 03:4C80 $09
    ld   [hl], ENTITY_STALFOS_EVASIVE             ;; 03:4C81 $36 $1E
    ld   hl, wEntitiesStatusTable                 ;; 03:4C83 $21 $80 $C2
    add  hl, bc                                   ;; 03:4C86 $09
    ld   [hl], ENTITY_STATUS_ACTIVE               ;; 03:4C87 $36 $05
    jp   ConfigureNewEntity.attributes            ;; 03:4C89 $C3 $6B $48
.gibdoEnd

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:4C8C $21 $80 $C4
    add  hl, bc                                   ;; 03:4C8F $09
    ld   [hl], $1F                                ;; 03:4C90 $36 $1F
    ld   hl, wEntitiesStatusTable                 ;; 03:4C92 $21 $80 $C2
    add  hl, bc                                   ;; 03:4C95 $09
    ld   [hl], ENTITY_STATUS_DYING                ;; 03:4C96 $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:4C98 $21 $40 $C3
    add  hl, bc                                   ;; 03:4C9B $09
    ld   [hl], 4                                  ;; 03:4C9C $36 $04
    ld   hl, hNoiseSfx                            ;; 03:4C9E $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ;; 03:4CA1 $36 $13
    ret                                           ;; 03:4CA3 $C9

Data_003_4CA4::
    db   $00, $00, $04, $00

Data_003_4CA8::
    db   $00, $01, $03, $06

Data_003_4CAC::
    db   $24, $01, $24, $01, $3E, $01

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown020SpriteVariants::
.variant0
    db $1E, $01
    db $1E, $61

EntityFallHandler::
    ldh  a, [hMapId]                              ;; 03:4CB6 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:4CB8 $FE $FF
    jr   nz, .colorShellEnd                       ;; 03:4CBA $20 $20

    ld   hl, wEntitiesTypeTable                   ;; 03:4CBC $21 $A0 $C3
    add  hl, bc                                   ;; 03:4CBF $09
    ld   a, [hl]                                  ;; 03:4CC0 $7E
    cp   ENTITY_COLOR_SHELL_RED                   ;; 03:4CC1 $FE $E9
    jr   z, .animateColorShell                    ;; 03:4CC3 $28 $08

    cp   ENTITY_COLOR_SHELL_GREEN                 ;; 03:4CC5 $FE $EA
    jr   z, .animateColorShell                    ;; 03:4CC7 $28 $04

    cp   ENTITY_COLOR_SHELL_BLUE                  ;; 03:4CC9 $FE $EB
    jr   nz, .colorShellEnd                       ;; 03:4CCB $20 $0F

.animateColorShell
    ld   hl, wEntitiesStatusTable                 ;; 03:4CCD $21 $80 $C2
    add  hl, bc                                   ;; 03:4CD0 $09
    ld   a, ENTITY_STATUS_ACTIVE                  ;; 03:4CD1 $3E $05
    ld   [hl], a                                  ;; 03:4CD3 $77
    ld   hl, wEntitiesStateTable                  ;; 03:4CD4 $21 $90 $C2
    add  hl, bc                                   ;; 03:4CD7 $09
    ld   a, $06                                   ;; 03:4CD8 $3E $06
    ld   [hl], a                                  ;; 03:4CDA $77
    ret                                           ;; 03:4CDB $C9
.colorShellEnd

    call GetEntityTransitionCountdown             ;; 03:4CDC $CD $05 $0C
    jr   nz, jr_003_4D07                          ;; 03:4CDF $20 $26

    ld   hl, wEntitiesOptions1Table               ;; 03:4CE1 $21 $30 $C4
    add  hl, bc                                   ;; 03:4CE4 $09
    ld   a, [hl]                                  ;; 03:4CE5 $7E
    and  ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL       ;; 03:4CE6 $E6 $02
    jr   nz, .jr_4CEF                             ;; 03:4CE8 $20 $05
    ld   hl, wD460                                ;; 03:4CEA $21 $60 $D4
    ld   [hl], $01                                ;; 03:4CED $36 $01
.jr_4CEF

    ldh  a, [hActiveEntityType]                   ;; 03:4CEF $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ;; 03:4CF1 $FE $A8
    jr   nz, .jr_4D04                             ;; 03:4CF3 $20 $0F

    ld   a, $16                                   ;; 03:4CF5 $3E $16
    ld   [wWreckingBallRoom], a                   ;; 03:4CF7 $EA $6F $DB
    ld   a, $50                                   ;; 03:4CFA $3E $50
    ld   [wWreckingBallPosX], a                   ;; 03:4CFC $EA $70 $DB
    ld   a, $27                                   ;; 03:4CFF $3E $27
    ld   [wWreckingBallPosY], a                   ;; 03:4D01 $EA $71 $DB

.jr_4D04
    jp   UnloadEntityAndReturn                    ;; 03:4D04 $C3 $8D $3F

jr_003_4D07:
    cp   $40                                      ;; 03:4D07 $FE $40
    jr   c, jr_003_4D29                           ;; 03:4D09 $38 $1E

    ldh  a, [hActiveEntityType]                   ;; 03:4D0B $F0 $EB
    cp   ENTITY_OCTOROK                           ;; 03:4D0D $FE $09
    jr   z, .jr_4D19                              ;; 03:4D0F $28 $08

    cp   ENTITY_MOBLIN                            ;; 03:4D11 $FE $0B
    jr   z, .jr_4D19                              ;; 03:4D13 $28 $04

    cp   ENTITY_MOBLIN_SWORD                      ;; 03:4D15 $FE $14
    jr   nz, jr_003_4D22                          ;; 03:4D17 $20 $09

.jr_4D19
    call SetEntityVariantForDirection_03          ;; 03:4D19 $CD $FC $58
    call SetEntityVariantForDirection_03          ;; 03:4D1C $CD $FC $58
    call SetEntityVariantForDirection_03          ;; 03:4D1F $CD $FC $58

jr_003_4D22:
    call ExecuteActiveEntityHandler_trampoline    ;; 03:4D22 $CD $81 $3A
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:4D25 $CD $7E $7F
    ret                                           ;; 03:4D28 $C9

jr_003_4D29:
    rra                                           ;; 03:4D29 $1F
    rra                                           ;; 03:4D2A $1F
    rra                                           ;; 03:4D2B $1F
    rra                                           ;; 03:4D2C $1F
    and  $03                                      ;; 03:4D2D $E6 $03
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:4D2F $21 $B0 $C3
    add  hl, bc                                   ;; 03:4D32 $09
    ld   [hl], a                                  ;; 03:4D33 $77
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:4D34 $E0 $F1
    ld   e, a                                     ;; 03:4D36 $5F
    ld   d, b                                     ;; 03:4D37 $50
    ld   hl, Data_003_4CA4                        ;; 03:4D38 $21 $A4 $4C
    add  hl, de                                   ;; 03:4D3B $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:4D3C $F0 $EC
    add  [hl]                                     ;; 03:4D3E $86
    ldh  [hActiveEntityVisualPosY], a             ;; 03:4D3F $E0 $EC
    ld   a, e                                     ;; 03:4D41 $7B
    cp   $03                                      ;; 03:4D42 $FE $03
    jr   nz, .jr_4D51                             ;; 03:4D44 $20 $0B

    xor  a                                        ;; 03:4D46 $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:4D47 $E0 $F1
    ld   de, Unknown020SpriteVariants             ;; 03:4D49 $11 $B2 $4C
    call RenderActiveEntitySpritesPair            ;; 03:4D4C $CD $C0 $3B
    jr   jr_003_4D57                              ;; 03:4D4F $18 $06

.jr_4D51
    ld   de, Data_003_4CAC                        ;; 03:4D51 $11 $AC $4C
    call RenderActiveEntitySprite                 ;; 03:4D54 $CD $77 $3C

jr_003_4D57:
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:4D57 $CD $7E $7F
    call GetEntityTransitionCountdown             ;; 03:4D5A $CD $05 $0C
    cp   $3F                                      ;; 03:4D5D $FE $3F
    jr   nz, .jr_4D66                             ;; 03:4D5F $20 $05

    ld   hl, hJingle                              ;; 03:4D61 $21 $F2 $FF
    ld   [hl], JINGLE_ITEM_FALLING                ;; 03:4D64 $36 $18

.jr_4D66
    rra                                           ;; 03:4D66 $1F
    rra                                           ;; 03:4D67 $1F
    rra                                           ;; 03:4D68 $1F
    rra                                           ;; 03:4D69 $1F
    and  $03                                      ;; 03:4D6A $E6 $03
    ld   e, a                                     ;; 03:4D6C $5F
    ld   d, b                                     ;; 03:4D6D $50
    ld   hl, Data_003_4CA8                        ;; 03:4D6E $21 $A8 $4C
    add  hl, de                                   ;; 03:4D71 $19
    ld   e, [hl]                                  ;; 03:4D72 $5E
    ldh  a, [hLinkPositionX]                      ;; 03:4D73 $F0 $98
    push af                                       ;; 03:4D75 $F5
    ld   hl, wEntitiesFallingTargetXTable         ;; 03:4D76 $21 $B0 $C4
    add  hl, bc                                   ;; 03:4D79 $09
    ld   a, [hl]                                  ;; 03:4D7A $7E
    ldh  [hLinkPositionX], a                      ;; 03:4D7B $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 03:4D7D $F0 $99
    push af                                       ;; 03:4D7F $F5
    ld   hl, wEntitiesFallingTargetYTable         ;; 03:4D80 $21 $C0 $C4
    add  hl, bc                                   ;; 03:4D83 $09
    ld   a, [hl]                                  ;; 03:4D84 $7E
    ldh  [hLinkPositionY], a                      ;; 03:4D85 $E0 $99
    ld   a, e                                     ;; 03:4D87 $7B
    call ApplyVectorTowardsLink                   ;; 03:4D88 $CD $C7 $7E
    pop  af                                       ;; 03:4D8B $F1
    ldh  [hLinkPositionY], a                      ;; 03:4D8C $E0 $99
    pop  af                                       ;; 03:4D8E $F1
    ldh  [hLinkPositionX], a                      ;; 03:4D8F $E0 $98
    jp   UpdateEntityPosWithSpeed_03              ;; 03:4D91 $C3 $25 $7F

EntityThrownHandler::
    call ExecuteActiveEntityHandler_trampoline    ;; 03:4D94 $CD $81 $3A
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:4D97 $CD $7E $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:4D9A $21 $10 $C4
    add  hl, bc                                   ;; 03:4D9D $09
    ld   [hl], $02                                ;; 03:4D9E $36 $02
    call BouncingEntityPhysics                    ;; 03:4DA0 $CD $B3 $60
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:4DA3 $21 $10 $C4
    add  hl, bc                                   ;; 03:4DA6 $09
    ld   [hl], b                                  ;; 03:4DA7 $70
    call func_003_66FA                            ;; 03:4DA8 $CD $FA $66
    call func_003_5438                            ;; 03:4DAB $CD $38 $54

    ldh  a, [hActiveEntityType]                   ;; 03:4DAE $F0 $EB
    cp   ENTITY_GENIE                             ;; 03:4DB0 $FE $5C
    jr   nz, .genieEnd                            ;; 03:4DB2 $20 $1E

    ld   hl, wEntitiesCollisionsTable             ;; 03:4DB4 $21 $A0 $C2
    add  hl, bc                                   ;; 03:4DB7 $09
    ld   a, [hl]                                  ;; 03:4DB8 $7E
    and  a                                        ;; 03:4DB9 $A7
    jr   z, .genieEnd                             ;; 03:4DBA $28 $16

    ld   hl, wEntitiesFlashCountdownTable         ;; 03:4DBC $21 $20 $C4
    add  hl, bc                                   ;; 03:4DBF $09
    ld   [hl], $20                                ;; 03:4DC0 $36 $20
    ld   hl, hWaveSfx                             ;; 03:4DC2 $21 $F3 $FF
    ld   [hl], WAVE_SFX_BOSS_HURT                 ;; 03:4DC5 $36 $07
    ld   hl, wEntitiesPrivateState4Table          ;; 03:4DC7 $21 $40 $C4
    add  hl, bc                                   ;; 03:4DCA $09
IF __OPTIMIZATIONS_1__
    inc  [hl]
    ld   a, [hl]
ELSE
    ld   a, [hl]                                  ;; 03:4DCB $7E
    inc  a                                        ;; 03:4DCC $3C
    ld   [hl], a                                  ;; 03:4DCD $77
ENDC
    cp   $03                                      ;; 03:4DCE $FE $03
    jr   z, .genie2                               ;; 03:4DD0 $28 $1D
.genieEnd

    ld   a, $0B                                   ;; 03:4DD2 $3E $0B
    ld   [wC19E], a                               ;; 03:4DD4 $EA $9E $C1
    call func_003_75A2                            ;; 03:4DD7 $CD $A2 $75
    ld   hl, wEntitiesSpeedXTable                 ;; 03:4DDA $21 $40 $C2
    add  hl, bc                                   ;; 03:4DDD $09
    ld   a, [hl]                                  ;; 03:4DDE $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:4DDF $21 $50 $C2
    add  hl, bc                                   ;; 03:4DE2 $09
    or   [hl]                                     ;; 03:4DE3 $B6
    jr   nz, .return                              ;; 03:4DE4 $20 $1E

    call func_003_7267                            ;; 03:4DE6 $CD $67 $72

    ldh  a, [hActiveEntityType]                   ;; 03:4DE9 $F0 $EB
    cp   ENTITY_GENIE                             ;; 03:4DEB $FE $5C
    jr   nz, .return                              ;; 03:4DED $20 $15

.genie2
    ld   hl, wEntitiesStatusTable                 ;; 03:4DEF $21 $80 $C2
    add  hl, bc                                   ;; 03:4DF2 $09
    ld   [hl], $05                                ;; 03:4DF3 $36 $05
    call IncrementEntityState                     ;; 03:4DF5 $CD $12 $3B
    ld   [hl], $01                                ;; 03:4DF8 $36 $01
    call GetEntityTransitionCountdown             ;; 03:4DFA $CD $05 $0C
    ld   [hl], $80                                ;; 03:4DFD $36 $80
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4DFF $21 $D0 $C2
    add  hl, bc                                   ;; 03:4E02 $09
    ld   [hl], b                                  ;; 03:4E03 $70

.return
    ret                                           ;; 03:4E04 $C9

Data_003_4E05::
    db   $10, $F0

EntityStunnedHandler::
    call ExecuteActiveEntityHandler_trampoline    ;; 03:4E07 $CD $81 $3A
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:4E0A $CD $7E $7F
    call ApplyRecoilIfNeeded_03                   ;; 03:4E0D $CD $A9 $7F
    call BouncingEntityPhysics                    ;; 03:4E10 $CD $B3 $60
    call ClearEntitySpeed                         ;; 03:4E13 $CD $7F $3D
    call func_003_6E2B                            ;; 03:4E16 $CD $2B $6E
    ld   a, [wInventoryItems.BButtonSlot]         ;; 03:4E19 $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 03:4E1C $FE $03
    jr   nz, .noBraceletB                         ;; 03:4E1E $20 $08

    ldh  a, [hJoypadState]                        ;; 03:4E20 $F0 $CC
    and  J_B                                      ;; 03:4E22 $E6 $20
    jr   nz, func_003_4E35                        ;; 03:4E24 $20 $0F

    jr   jr_003_4E72                              ;; 03:4E26 $18 $4A

.noBraceletB
    ld   a, [wInventoryItems.AButtonSlot]         ;; 03:4E28 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 03:4E2B $FE $03
    jr   nz, jr_003_4E72                          ;; 03:4E2D $20 $43

    ldh  a, [hJoypadState]                        ;; 03:4E2F $F0 $CC
    and  J_A                                      ;; 03:4E31 $E6 $10
    jr   z, jr_003_4E72                           ;; 03:4E33 $28 $3D

func_003_4E35::
    ld   a, [wC3CF]                               ;; 03:4E35 $FA $CF $C3
    and  a                                        ;; 03:4E38 $A7
    jr   nz, jr_003_4E72                          ;; 03:4E39 $20 $37

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:4E3B $21 $40 $C3
    add  hl, bc                                   ;; 03:4E3E $09
    ld   a, [hl]                                  ;; 03:4E3F $7E
    push hl                                       ;; 03:4E40 $E5
    push af                                       ;; 03:4E41 $F5
    or   ENTITY_PHYSICS_HARMLESS                  ;; 03:4E42 $F6 $80
    ld   [hl], a                                  ;; 03:4E44 $77
    call CheckLinkCollisionWithEnemy              ;; 03:4E45 $CD $72 $6C
    rl   e                                        ;; 03:4E48 $CB $13
    pop  af                                       ;; 03:4E4A $F1
    pop  hl                                       ;; 03:4E4B $E1
    ld   [hl], a                                  ;; 03:4E4C $77
    rr   e                                        ;; 03:4E4D $CB $1B
    jr   nc, jr_003_4E72                          ;; 03:4E4F $30 $21

    ld   a, $01                                   ;; 03:4E51 $3E $01
    ld   [wC3CF], a                               ;; 03:4E53 $EA $CF $C3
    ld   hl, wEntitiesStatusTable                 ;; 03:4E56 $21 $80 $C2
    add  hl, bc                                   ;; 03:4E59 $09
    ld   [hl], $07                                ;; 03:4E5A $36 $07

    ld   a, WAVE_SFX_LIFT_UP                      ;; 03:4E5C $3E $02
    ldh  [hWaveSfx], a                            ;; 03:4E5E $E0 $F3

    ld   hl, wEntitiesLiftedTable                 ;; 03:4E60 $21 $90 $C4
    add  hl, bc                                   ;; 03:4E63 $09
    ld   [hl], b                                  ;; 03:4E64 $70

    call GetEntityTransitionCountdown             ;; 03:4E65 $CD $05 $0C
    ld   [hl], $02                                ;; 03:4E68 $36 $02
    ldh  a, [hLinkDirection]                      ;; 03:4E6A $F0 $9E
    ld   [wC15D], a                               ;; 03:4E6C $EA $5D $C1
    jp   EntityLiftedHandler                      ;; 03:4E6F $C3 $32 $57

jr_003_4E72:
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 03:4E72 $21 $00 $C3
    add  hl, bc                                   ;; 03:4E75 $09
    ld   a, [hl]                                  ;; 03:4E76 $7E
    and  a                                        ;; 03:4E77 $A7
    jr   nz, .jr_4E85                             ;; 03:4E78 $20 $0B

    ld   hl, wEntitiesStatusTable                 ;; 03:4E7A $21 $80 $C2
    add  hl, bc                                   ;; 03:4E7D $09
    ld   [hl], $05                                ;; 03:4E7E $36 $05
    ld   hl, wEntitiesSpeedZTable                 ;; 03:4E80 $21 $20 $C3
    add  hl, bc                                   ;; 03:4E83 $09
    ld   [hl], b                                  ;; 03:4E84 $70

.jr_4E85
    cp   $38                                      ;; 03:4E85 $FE $38
    ret  nc                                       ;; 03:4E87 $D0

    srl  a                                        ;; 03:4E88 $CB $3F
    srl  a                                        ;; 03:4E8A $CB $3F
    and  $01                                      ;; 03:4E8C $E6 $01
    ld   e, a                                     ;; 03:4E8E $5F
    ld   d, b                                     ;; 03:4E8F $50
    ld   hl, Data_003_4E05                        ;; 03:4E90 $21 $05 $4E
    add  hl, de                                   ;; 03:4E93 $19
    ld   a, [hl]                                  ;; 03:4E94 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:4E95 $21 $40 $C2
    add  hl, bc                                   ;; 03:4E98 $09
    ld   [hl], a                                  ;; 03:4E99 $77
    call AddEntitySpeedToPos_03                   ;; 03:4E9A $CD $32 $7F
    jp   ClearEntitySpeed                         ;; 03:4E9D $C3 $7F $3D

EntityRandomSpeedX::
    db   12, 12, -12, -12

EntityRandomSpeedY::
    db   12, -12, 12, -12

EntityInitWithRandomSpeed::
    call GetRandomByte                            ;; 03:4EA8 $CD $0D $28
    and  $03                                      ;; 03:4EAB $E6 $03
    ld   e, a                                     ;; 03:4EAD $5F
    ld   d, b                                     ;; 03:4EAE $50
    ld   hl, EntityRandomSpeedX                   ;; 03:4EAF $21 $A0 $4E
    add  hl, de                                   ;; 03:4EB2 $19
    ld   a, [hl]                                  ;; 03:4EB3 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:4EB4 $21 $40 $C2
    add  hl, bc                                   ;; 03:4EB7 $09
    ld   [hl], a                                  ;; 03:4EB8 $77
    ld   hl, EntityRandomSpeedY                   ;; 03:4EB9 $21 $A4 $4E
    add  hl, de                                   ;; 03:4EBC $19
    ld   a, [hl]                                  ;; 03:4EBD $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:4EBE $21 $50 $C2
    add  hl, bc                                   ;; 03:4EC1 $09
    ld   [hl], a                                  ;; 03:4EC2 $77
    ret                                           ;; 03:4EC3 $C9

EntityInitSparkClockwise::
    ld   hl, wEntitiesPrivateState2Table          ;; 03:4EC4 $21 $C0 $C2
    add  hl, bc                                   ;; 03:4EC7 $09
    ld   [hl], $04                                ;; 03:4EC8 $36 $04
    ld   a, $03                                   ;; 03:4ECA $3E $03
    jr   jr_003_4ED0                              ;; 03:4ECC $18 $02

EntityInitSparkCounterClockwise::
    ld   a, $FD                                   ;; 03:4ECE $3E $FD

jr_003_4ED0:
    ld   hl, wEntitiesPosYTable                   ;; 03:4ED0 $21 $10 $C2
    add  hl, bc                                   ;; 03:4ED3 $09
    add  [hl]                                     ;; 03:4ED4 $86
    ld   [hl], a                                  ;; 03:4ED5 $77
    ret                                           ;; 03:4ED6 $C9

EntityInitWizrobe::
    call GetEntityTransitionCountdown             ;; 03:4ED7 $CD $05 $0C
    ld   [hl], $80                                ;; 03:4EDA $36 $80
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:4EDC $21 $B0 $C3
    add  hl, bc                                   ;; 03:4EDF $09
    dec  [hl]                                     ;; 03:4EE0 $35
    ret                                           ;; 03:4EE1 $C9

EntityInitMoblinSword::
    ldh  a, [hActiveEntityPosX]                   ;; 03:4EE2 $F0 $EE
    and  $10                                      ;; 03:4EE4 $E6 $10
    ld   a, $00                                   ;; 03:4EE6 $3E $00
    jr   nz, .jr_4EEC                             ;; 03:4EE8 $20 $02

    ld   a, $03                                   ;; 03:4EEA $3E $03

.jr_4EEC
    ld   hl, wEntitiesDirectionTable              ;; 03:4EEC $21 $80 $C3
    add  hl, bc                                   ;; 03:4EEF $09
    ld   [hl], a                                  ;; 03:4EF0 $77
    push hl                                       ;; 03:4EF1 $E5
    call SetEntityVariantForDirection_03          ;; 03:4EF2 $CD $FC $58
    pop  hl                                       ;; 03:4EF5 $E1
    ld   a, [hl]                                  ;; 03:4EF6 $7E
    xor  $01                                      ;; 03:4EF7 $EE $01
    ld   [hl], a                                  ;; 03:4EF9 $77
    ret                                           ;; 03:4EFA $C9

EntityInitSecretSeashell::
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4EFB $21 $D0 $C2
    add  hl, bc                                   ;; 03:4EFE $09
    ld   [hl], $02                                ;; 03:4EFF $36 $02
    ldh  a, [hMapRoom]                            ;; 03:4F01 $F0 $F6
    cp   UNKNOWN_ROOM_A4                          ; Overworld room A4 (1 east of Mabe's big bush field)
    jr   z, .treeSeashell                         ;; 03:4F05 $28 $04

    cp   UNKNOWN_ROOM_D2                          ; overworld room D2 (1 west of Tail Cave)
    jr   nz, .treeSeashellEnd                     ;; 03:4F09 $20 $04

.treeSeashell
    dec  [hl]                                     ;; 03:4F0B $35
    call EntityInitWithShiftedPosition            ;; 03:4F0C $CD $83 $4F

.treeSeashellEnd
    jp   SetHiddenDroppableOptions1               ;; 03:4F0F $C3 $24 $4F

func_003_4F12::
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4F12 $21 $D0 $C2
    add  hl, bc                                   ;; 03:4F15 $09
    ld   [hl], $01                                ;; 03:4F16 $36 $01
    ld   a, [wIsIndoor]                           ;; 03:4F18 $FA $A5 $DB
    and  a                                        ;; 03:4F1B $A7
    jr   z, SetHiddenDroppableOptions1            ;; 03:4F1C $28 $06

EntityInitDiggableBushOrPotDroppable::
    ld   hl, wEntitiesPrivateState3Table          ;; 03:4F1E $21 $D0 $C2
    add  hl, bc                                   ;; 03:4F21 $09
    ld   [hl], $02                                ;; 03:4F22 $36 $02

SetHiddenDroppableOptions1::
    ld   hl, wEntitiesOptions1Table               ;; 03:4F24 $21 $30 $C4
    add  hl, bc                                   ;; 03:4F27 $09
    ld   a, [hl]                                  ;; 03:4F28 $7E
    or   ENTITY_OPT1_NO_GROUND_INTERACTION|ENTITY_OPT1_NO_WALL_COLLISION ;; 03:4F29 $F6 $11
    ld   [hl], a                                  ;; 03:4F2B $77
    ret                                           ;; 03:4F2C $C9

EntityInitKeyDropPoint::
    ldh  a, [hMapRoom]                            ;; 03:4F2D $F0 $F6
    cp   ROOM_INDOOR_A_QUICKSAND_CAVE             ; In the Yarna Desert quicksand pit
    jr   nz, .jr_4F44                             ;; 03:4F31 $20 $11

    ; check if the angler key has dropped, and not dropped down the hole yet
    ldh  a, [hRoomStatus]                         ;; 03:4F33 $F0 $F8
    bit  4, a                                     ;; 03:4F35 $CB $67
    jp   nz, UnloadEntityAndReturn                ;; 03:4F37 $C2 $8D $3F

    bit  5, a                                     ;; 03:4F3A $CB $6F
    jp   z, UnloadEntityAndReturn                 ;; 03:4F3C $CA $8D $3F

    ld   a, $02                                   ;; 03:4F3F $3E $02
    jp   SetEntitySpriteVariant                   ;; 03:4F41 $C3 $0C $3B

.jr_4F44
    ; Handle the sprite change for the bird key
    cp   ROOM_INDOOR_B_MOUNTAIN_CAVE_ROOM_1       ;; 03:4F44 $FE $7A
    jr   nz, .jr_4F54                             ;; 03:4F46 $20 $0C

IF __PATCH_0__
    ld   a, [wHasBirdKey]
    and  a
    jp   nz, UnloadEntityAndReturn
ENDC

    ldh  a, [hRoomStatus]                         ;; 03:4F48 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:4F4A $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:4F4C $C2 $8D $3F

    ld   a, $04                                   ;; 03:4F4F $3E $04
    jp   SetEntitySpriteVariant                   ;; 03:4F51 $C3 $0C $3B

.jr_4F54
    ; handle the key in the sidescroll room in dungeon 4 where
    ; the key drops in the hole down into the sidescrolling room with water
    cp   ROOM_INDOOR_A_ANGLERS_TUNNEL_KEY_FALL    ;; 03:4F54 $FE $7C
    jr   nz, .ret_4F67                            ;; 03:4F56 $20 $0F

    ld   a, [wIndoorARoomStatus + ROOM_INDOOR_A_ANGLERS_TUNNEL_KEY_DROP] ;; 03:4F58 $FA $69 $D9
    and  $10                                      ;; 03:4F5B $E6 $10
    jp   z, UnloadEntityAndReturn                 ;; 03:4F5D $CA $8D $3F

    ldh  a, [hRoomStatus]                         ;; 03:4F60 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:4F62 $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:4F64 $C2 $8D $3F

.ret_4F67
    ret                                           ;; 03:4F67 $C9

EntityInitTradingItem::
    ld   a, [wTradeSequenceItem]                  ;; 03:4F68 $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 03:4F6B $FE $0E
    jr   z, EntityInitWithShiftedPosition         ;; 03:4F6D $28 $14

    ret                                           ;; 03:4F6F $C9

EntityInitWarp::
    ld   a, [wIsIndoor]                           ;; 03:4F70 $FA $A5 $DB
    and  a                                        ;; 03:4F73 $A7
    ret  z                                        ;; 03:4F74 $C8

    call IncrementEntityState                     ;; 03:4F75 $CD $12 $3B
    jr   EntityInitWithShiftedPosition            ;; 03:4F78 $18 $09

EntityInitTreeOrPotDroppable::
    call func_003_4F12                            ;; 03:4F7A $CD $12 $4F
    ld   a, [wIsIndoor]                           ;; 03:4F7D $FA $A5 $DB
    and  a                                        ;; 03:4F80 $A7
    jr   nz, SetDroppableDefaultTimer             ;; 03:4F81 $20 $26

; Increment X and Y position by 8
EntityInitWithShiftedPosition::
EntityShiftPosition::
    ld   de, wEntitiesPosXSignTable               ;; 03:4F83 $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ;; 03:4F86 $21 $00 $C2
    call .shiftBy8                                ;; 03:4F89 $CD $92 $4F

    ld   de, wEntitiesPosYSignTable               ;; 03:4F8C $11 $30 $C2
    ld   hl, wEntitiesPosYTable                   ;; 03:4F8F $21 $10 $C2
    ; fallthrough

; add 8 to the position in hl
.shiftBy8
    add  hl, bc                                   ;; 03:4F92 $09
    ld   a, [hl]                                  ;; 03:4F93 $7E
    add  $08                                      ;; 03:4F94 $C6 $08
    ld   [hl], a                                  ;; 03:4F96 $77
    rla                                           ;; 03:4F97 $17
    ld   l, e                                     ;; 03:4F98 $6B
    ld   h, d                                     ;; 03:4F99 $62
    add  hl, bc                                   ;; 03:4F9A $09
    rra                                           ;; 03:4F9B $1F
    ld   a, [hl]                                  ;; 03:4F9C $7E
    adc  $00                                      ;; 03:4F9D $CE $00
    ld   [hl], a                                  ;; 03:4F9F $77
    ret                                           ;; 03:4FA0 $C9

EntityInitWithShiftedXPosition::
    ld   de, wEntitiesPosXSignTable               ;; 03:4FA1 $11 $20 $C2
    ld   hl, wEntitiesPosXTable                   ;; 03:4FA4 $21 $00 $C2
    jr   EntityShiftPosition.shiftBy8             ;; 03:4FA7 $18 $E9

SetDroppableDefaultTimer::
    call GetEntitySlowTransitionCountdown         ;; 03:4FA9 $CD $FB $0B
    ld   [hl], $80                                ;; 03:4FAC $36 $80
    ret                                           ;; 03:4FAE $C9

EntityInitWithCountdown::
    call GetEntityPrivateCountdown1               ;; 03:4FAF $CD $00 $0C
    ld   [hl], $A0                                ;; 03:4FB2 $36 $A0
    ret                                           ;; 03:4FB4 $C9

EntityInitGhini::
    ldh  a, [hActiveEntityType]                   ;; 03:4FB5 $F0 $EB
    cp   ENTITY_GHINI                             ;; 03:4FB7 $FE $12
    jr   nz, .hiding                              ;; 03:4FB9 $20 $0D

    ld   hl, wEntitiesPrivateState3Table          ;; 03:4FBB $21 $D0 $C2
    add  hl, bc                                   ;; 03:4FBE $09
    ld   [hl], $01                                ;; 03:4FBF $36 $01
    ld   hl, wEntitiesPosZTable                   ;; 03:4FC1 $21 $10 $C3
    add  hl, bc                                   ;; 03:4FC4 $09
    ld   [hl], $10                                ;; 03:4FC5 $36 $10
    ret                                           ;; 03:4FC7 $C9
.hiding
    jp   IncrementEntityState                     ;; 03:4FC8 $C3 $12 $3B

MaskedIronMaskSpriteVariants::
; Down
.variant0
    db   $60, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $62, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db   $62, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $60, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Up
.variant2
    db   $64, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $66, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db   $66, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $64, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
; Left
.variant4
    db   $68, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $6A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db   $6C, OAM_GBC_PAL_2 | OAMF_PAL0
    db   $6E, OAM_GBC_PAL_2 | OAMF_PAL0
; Right
.variant6
    db   $6A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $68, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db   $6E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db   $6C, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

UnmaskedIronMaskSpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

IronMaskSpeedXValues::
    db   $0C, $F4, $00, $00

IronMaskSpeedYValues::
    db   $00, $00, $F4, $0C

IronMaskEntityHandler::
    ld   hl, wEntitiesPrivateState2Table          ;; 03:4FFB $21 $C0 $C2
    add  hl, bc                                   ;; 03:4FFE $09
    ld   a, [hl]                                  ;; 03:4FFF $7E
    and  a                                        ;; 03:5000 $A7
    jr   z, .masked                               ;; 03:5001 $28 $45

    ld   de, UnmaskedIronMaskSpriteVariants       ;; 03:5003 $11 $EB $4F
    call RenderActiveEntitySpritesPair            ;; 03:5006 $CD $C0 $3B
    call ReturnIfNonInteractive_03                ;; 03:5009 $CD $78 $7F
    call ApplyRecoilIfNeeded_03                   ;; 03:500C $CD $A9 $7F
    call DefaultEnemyDamageCollisionHandler       ;; 03:500F $CD $28 $6E
    call UpdateEntityPosWithSpeed_03              ;; 03:5012 $CD $25 $7F
    call ApplyEntityInteractionWithBackground     ;; 03:5015 $CD $93 $78
    call GetEntityTransitionCountdown             ;; 03:5018 $CD $05 $0C
    jr   nz, .changeDirectionEnd                  ;; 03:501B $20 $20
    
    call GetRandomByte                            ;; 03:501D $CD $0D $28
    and  $1F                                      ;; 03:5020 $E6 $1F
    add  $20                                      ;; 03:5022 $C6 $20
    ld   [hl], a                                  ;; 03:5024 $77
    and  $03                                      ;; 03:5025 $E6 $03
    ld   e, a                                     ;; 03:5027 $5F
    ld   d, b                                     ;; 03:5028 $50
    ld   hl, IronMaskSpeedXValues                 ;; 03:5029 $21 $F3 $4F
    add  hl, de                                   ;; 03:502C $19
    ld   a, [hl]                                  ;; 03:502D $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:502E $21 $40 $C2
    add  hl, bc                                   ;; 03:5031 $09
    ld   [hl], a                                  ;; 03:5032 $77
    ld   hl, IronMaskSpeedYValues                 ;; 03:5033 $21 $F7 $4F
    add  hl, de                                   ;; 03:5036 $19
    ld   a, [hl]                                  ;; 03:5037 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:5038 $21 $50 $C2
    add  hl, bc                                   ;; 03:503B $09
    ld   [hl], a                                  ;; 03:503C $77

.changeDirectionEnd
    ldh  a, [hFrameCounter]                       ;; 03:503D $F0 $E7
    rra                                           ;; 03:503F $1F
    rra                                           ;; 03:5040 $1F
    rra                                           ;; 03:5041 $1F
    rra                                           ;; 03:5042 $1F
    and  $01                                      ;; 03:5043 $E6 $01
    jp   SetEntitySpriteVariant                   ;; 03:5045 $C3 $0C $3B

.masked
    ld   de, MaskedIronMaskSpriteVariants         ;; 03:5048 $11 $CB $4F
    call AnimateRoamingEnemy                      ;; 03:504B $CD $3C $58
    ret                                           ;; 03:504E $C9

OpenChestTilesGBC::
    db   $62, $70, $63, $71

OpenChestTiles::
    db   $62, $70, $62, $70

; POI: The bow, shovel, and sword are not placed in chests
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
; POI: A chest with 500 rupees???
ChestRupeeCountHigh::
    db   HIGH( 50), HIGH( 20), HIGH(100), HIGH(200), HIGH(500)
ChestRupeeCountLow::
    db   LOW(  50), LOW(  20), LOW( 100), LOW( 200), LOW( 500)

EntityInitChestWithItem::
    ld   a, $2A                                   ;; 03:506D $3E $2A
    ld   [wC111], a                               ;; 03:506F $EA $11 $C1
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ;; 03:5072 $3E $04
    ldh  [hNoiseSfx], a                           ;; 03:5074 $E0 $F4
    ld   de, OpenChestTilesGBC                    ;; 03:5076 $11 $4F $50
    ldh  a, [hIsGBC]                              ;; 03:5079 $F0 $FE
    and  a                                        ;; 03:507B $A7
    jr   z, .jr_5081                              ;; 03:507C $28 $03

    ld   de, OpenChestTiles                       ;; 03:507E $11 $53 $50

.jr_5081
    ld   b, $A1                                   ;; 03:5081 $06 $A1
    call func_003_51C9                            ;; 03:5083 $CD $C9 $51
    ld   hl, wEntitiesPosYTable                   ;; 03:5086 $21 $10 $C2
    add  hl, bc                                   ;; 03:5089 $09
    ld   a, [hl]                                  ;; 03:508A $7E
    sub  $08                                      ;; 03:508B $D6 $08
    ld   [hl], a                                  ;; 03:508D $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:508E $21 $50 $C2
    add  hl, bc                                   ;; 03:5091 $09
    ld   [hl], $FC                                ;; 03:5092 $36 $FC
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:5094 $21 $B0 $C3
    add  hl, bc                                   ;; 03:5097 $09
    ld   a, [hl]                                  ;; 03:5098 $7E
    ldh  [hMultiPurposeG], a                      ;; 03:5099 $E0 $E8
    ld   d, b                                     ;; 03:509B $50
    cp   CHEST_TAIL_KEY                           ;; 03:509C $FE $11
    jr   nz, .jr_50AC                             ;; 03:509E $20 $0C

    ; Next part seems to be related to the owl flying in when you get the tail key
    push af                                       ;; 03:50A0 $F5
    ld   a, [wOwlEntityIndex]                     ;; 03:50A1 $FA $01 $C5
    ld   e, a                                     ;; 03:50A4 $5F
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 03:50A5 $21 $F0 $C2
    add  hl, de                                   ;; 03:50A8 $19
    ld   [hl], $38                                ;; 03:50A9 $36 $38
    pop  af                                       ;; 03:50AB $F1

.jr_50AC
    ld   e, a                                     ;; 03:50AC $5F
    cp   CHEST_MESSAGE                            ;; 03:50AD $FE $21
    jp   nc, MarkRoomCompleted                    ;; 03:50AF $D2 $2A $51

    cp   CHEST_SEASHELL                           ;; 03:50B2 $FE $20
IF __OPTIMIZATIONS_3__
    jp   z, label_003_636D                        ;; 03:50B4 $20 $03
ELSE
    jr   nz, .jr_50B9                             ;; 03:50B4 $20 $03

    jp   label_003_636D                           ;; 03:50B6 $C3 $6D $63
ENDC

.jr_50B9
    cp   CHEST_RUPEES_50                          ;; 03:50B9 $FE $1B
    jr   c, .jr_50D8                              ;; 03:50BB $38 $1B

    cp   $20                                      ;; 03:50BD $FE $20
    jr   nc, .jr_50D8                             ;; 03:50BF $30 $17

    ld   hl, (ChestRupeeCountLow - CHEST_RUPEES_50) ;; 03:50C1 $21 $4D $50
    add  hl, de                                   ;; 03:50C4 $19
    ld   a, [hl]                                  ;; 03:50C5 $7E
    ld   [wAddRupeeBufferLow], a                  ;; 03:50C6 $EA $90 $DB
    ld   hl, (ChestRupeeCountHigh - CHEST_RUPEES_50) ;; 03:50C9 $21 $48 $50
    add  hl, de                                   ;; 03:50CC $19
    ld   a, [hl]                                  ;; 03:50CD $7E
    ld   [wAddRupeeBufferHigh], a                 ;; 03:50CE $EA $8F $DB
    ld   a, $18                                   ;; 03:50D1 $3E $18
    ld   [wC3CE], a                               ;; 03:50D3 $EA $CE $C3
    jr   MarkRoomCompleted                        ;; 03:50D6 $18 $52

.jr_50D8
    cp   CHEST_MAP                                ;; 03:50D8 $FE $16
    jr   c, .jr_50EF                              ;; 03:50DA $38 $13

    cp   CHEST_RUPEES_50                          ;; 03:50DC $FE $1B
    jr   nc, .jr_50EF                             ;; 03:50DE $30 $0F

    sub  CHEST_MAP                                ;; 03:50E0 $D6 $16
    ld   e, a                                     ;; 03:50E2 $5F
    ld   d, $00                                   ;; 03:50E3 $16 $00
    ld   hl, wHasDungeonMap                       ;; 03:50E5 $21 $CC $DB
    add  hl, de                                   ;; 03:50E8 $19
    inc  [hl]                                     ;; 03:50E9 $34
    call SynchronizeDungeonsItemFlags_trampoline  ;; 03:50EA $CD $02 $28
    jr   MarkRoomCompleted                        ;; 03:50ED $18 $3B

.jr_50EF
    cp   CHEST_FLIPPERS                           ;; 03:50EF $FE $0C
    jr   nc, ChestGiveNoneInventoryItem           ;; 03:50F1 $30 $32

    ; When finding the Shield chest…
    ldh  a, [hMultiPurposeG]                      ;; 03:50F3 $F0 $E8
    cp   CHEST_SHIELD                             ;; 03:50F5 $FE $01
    jr   nz, .shieldEnd                           ;; 03:50F7 $20 $04
    ; increment the Shield level.
    ld   hl, wShieldLevel                         ;; 03:50F9 $21 $44 $DB
    inc  [hl]                                     ;; 03:50FC $34
.shieldEnd

    ; When finding the Power bracelet chest…
    cp   CHEST_POWER_BRACELET                     ;; 03:50FD $FE $00
    jr   nz, .powerBraceletEnd                    ;; 03:50FF $20 $0B
    ; … and the LV2 bracelet was not found yet…
    ld   a, [wPowerBraceletLevel]                 ;; 03:5101 $FA $43 $DB
    cp   $02                                      ;; 03:5104 $FE $02
    jr   z, .powerBraceletEnd                     ;; 03:5106 $28 $04

    ; increment the Power bracelet level.
    ld   hl, wPowerBraceletLevel                  ;; 03:5108 $21 $43 $DB
    inc  [hl]                                     ;; 03:510B $34
.powerBraceletEnd

    ; When finding a bomb's chest…
    ldh  a, [hMultiPurposeG]                      ;; 03:510C $F0 $E8
    cp   CHEST_BOMB                               ;; 03:510E $FE $0A
    jr   nz, .bombsEnd                            ;; 03:5110 $20 $08
    ; increment the bomb's count by 1
    ld   hl, wBombCount                           ;; 03:5112 $21 $4D $DB
    ld   a, [hl]                                  ;; 03:5115 $7E
    add  $01                                      ;; 03:5116 $C6 $01
    daa                                           ;; 03:5118 $27
    ld   [hl], a                                  ;; 03:5119 $77
.bombsEnd

    ld   d, b                                     ;; 03:511A $50
    ld   hl, ChestToInventoryMappingTable         ;; 03:511B $21 $57 $50
    add  hl, de                                   ;; 03:511E $19
    ld   d, [hl]                                  ;; 03:511F $56
    call GiveInventoryItem                        ;; 03:5120 $CD $72 $64
    jr   MarkRoomCompleted                        ;; 03:5123 $18 $05

ChestGiveNoneInventoryItem:
    ; This handles giving keys, golden leafs and flippers
    ; by increasing the proper memory location.
    ld   hl, wInventoryItems.BButtonSlot          ;; 03:5125 $21 $00 $DB
    add  hl, de                                   ;; 03:5128 $19
    inc  [hl]                                     ;; 03:5129 $34

MarkRoomCompleted::
    call GetRoomStatusAddressInHL                 ;; 03:512A $CD $34 $51
    ld   a, [hl]                                  ;; 03:512D $7E
    or   ROOM_STATUS_EVENT_1                      ;; 03:512E $F6 $10
    ld   [hl], a                                  ;; 03:5130 $77
    ldh  [hRoomStatus], a                         ;; 03:5131 $E0 $F8
    ret                                           ;; 03:5133 $C9

GetRoomStatusAddressInHL::
    ld   a, [wIsIndoor]                           ;; 03:5134 $FA $A5 $DB
    ld   d, a                                     ;; 03:5137 $57
    ld   hl, wOverworldRoomStatus                 ;; 03:5138 $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 03:513B $F0 $F6
    ld   e, a                                     ;; 03:513D $5F

    ldh  a, [hMapId]                              ;; 03:513E $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:5140 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 03:5142 $20 $07
    ld   d, $00                                   ;; 03:5144 $16 $00
    ld   hl, wColorDungeonRoomStatus              ;; 03:5146 $21 $E0 $DD
    jr   .done                                    ;; 03:5149 $18 $09
.colorDungeonEnd

    ; If the map uses rooms in the indoors_b rooms group…
    cp   MAP_INDOORS_B_END                        ;
    jr   nc, .done                                ;; 03:514D $30 $05
    cp   MAP_INDOORS_B_START                      ;
    jr   c, .done                                 ;; 03:5151 $38 $01
    ; increase offset in wIndoorARoomStatus by 0x100
    inc  d                                        ;; 03:5153 $14

.done
    add  hl, de                                   ;; 03:5154 $19
    ret                                           ;; 03:5155 $C9

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
    db   $76, $76, $76, $76                       ;; 03:516A

EntityInitPushedBlock::
    call GetEntityDirectionToLink_03              ;; 03:516E $CD $FE $7E
    ld   d, $00                                   ;; 03:5171 $16 $00
    ld   hl, Data_003_523D                        ;; 03:5173 $21 $3D $52
    add  hl, de                                   ;; 03:5176 $19
    ld   a, [hl]                                  ;; 03:5177 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:5178 $21 $40 $C2
    add  hl, bc                                   ;; 03:517B $09
    ld   [hl], a                                  ;; 03:517C $77
    ld   hl, Data_003_5241                        ;; 03:517D $21 $41 $52
    add  hl, de                                   ;; 03:5180 $19
    ld   a, [hl]                                  ;; 03:5181 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:5182 $21 $50 $C2
    add  hl, bc                                   ;; 03:5185 $09
    ld   [hl], a                                  ;; 03:5186 $77
    call PushedBlockEntityHandler                 ;; 03:5187 $CD $49 $52
    call ApplyEntityInteractionWithBackground     ;; 03:518A $CD $93 $78
    ld   hl, wEntitiesCollisionsTable             ;; 03:518D $21 $A0 $C2
    add  hl, bc                                   ;; 03:5190 $09
    ld   a, [hl]                                  ;; 03:5191 $7E
    and  a                                        ;; 03:5192 $A7
IF __PATCH_0__
    jp   nz, UnloadEntityAndReturn
ELSE
    jr   z, .jr_5198                              ;; 03:5193 $28 $03
    jp   UnloadEntityAndReturn                    ;; 03:5195 $C3 $8D $3F
ENDC

.jr_5198
    ld   a, NOISE_SFX_RUMBLE                      ;; 03:5198 $3E $11
    ldh  [hNoiseSfx], a                           ;; 03:519A $E0 $F4
    ld   de, Data_003_5166                        ;; 03:519C $11 $66 $51
    ld   b, $C6                                   ;; 03:519F $06 $C6
    ldh  a, [hMapRoom]                            ;; 03:51A1 $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 03:51A3 $FE $77
    jr   nz, .jr_51B3                             ;; 03:51A5 $20 $0C

    ; If the color dungeon is open…
    ld   a, [wColorDungonCorrectTombStones]       ;; 03:51A7 $FA $D9 $DD
    cp   $80                                      ;; 03:51AA $FE $80
    jr   z, .jr_51B3                              ;; 03:51AC $28 $05

    ld   de, Data_003_516A                        ;; 03:51AE $11 $6A $51
    ld   b, $03                                   ;; 03:51B1 $06 $03

.jr_51B3
    ld   a, [wIsIndoor]                           ;; 03:51B3 $FA $A5 $DB
    and  a                                        ;; 03:51B6 $A7
    jr   z, func_003_51C9                         ;; 03:51B7 $28 $10

    ld   de, Data_003_515A                        ;; 03:51B9 $11 $5A $51
    ld   b, $0D                                   ;; 03:51BC $06 $0D
    ldh  a, [hMapRoom]                            ;; 03:51BE $F0 $F6
    cp   UNKNOWN_ROOM_C7                          ; @TODO Richard's Villa?
    jr   nz, func_003_51C9                        ;; 03:51C2 $20 $05

    ld   de, Data_003_5156                        ;; 03:51C4 $11 $56 $51
    ld   b, $BE                                   ;; 03:51C7 $06 $BE

func_003_51C9::
    push de                                       ;; 03:51C9 $D5
    ld   a, b                                     ;; 03:51CA $78
    push af                                       ;; 03:51CB $F5
    ld   b, $00                                   ;; 03:51CC $06 $00
    ldh  a, [hActiveEntityPosY]                   ;; 03:51CE $F0 $EF
    sub  $0F                                      ;; 03:51D0 $D6 $0F
    ldh  [hIntersectedObjectTop], a               ;; 03:51D2 $E0 $CD
    ldh  a, [hActiveEntityPosX]                   ;; 03:51D4 $F0 $EE
    sub  $07                                      ;; 03:51D6 $D6 $07
    ldh  [hIntersectedObjectLeft], a              ;; 03:51D8 $E0 $CE
    swap a                                        ;; 03:51DA $CB $37
    and  $0F                                      ;; 03:51DC $E6 $0F
    ld   e, a                                     ;; 03:51DE $5F
    ldh  a, [hIntersectedObjectTop]               ;; 03:51DF $F0 $CD
    and  $F0                                      ;; 03:51E1 $E6 $F0
    or   e                                        ;; 03:51E3 $B3
    ld   e, a                                     ;; 03:51E4 $5F
    ld   d, $00                                   ;; 03:51E5 $16 $00
    ld   hl, wRoomObjects                         ;; 03:51E7 $21 $11 $D7
    add  hl, de                                   ;; 03:51EA $19
    pop  af                                       ;; 03:51EB $F1
    ld   [hl], a                                  ;; 03:51EC $77
    ld   [wDDD8], a                               ;; 03:51ED $EA $D8 $DD
    ld   a, $03                                   ;; 03:51F0 $3E $03
    call BackupObjectInRAM2                       ;; 03:51F2 $CD $2F $0B

label_003_51F5:
    call label_2887                               ;; 03:51F5 $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ;; 03:51F8 $FA $00 $D6
    ld   e, a                                     ;; 03:51FB $5F
    ld   d, $00                                   ;; 03:51FC $16 $00
    ld   hl, wDrawCommand                         ;; 03:51FE $21 $01 $D6
    add  hl, de                                   ;; 03:5201 $19
    add  $0A                                      ;; 03:5202 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 03:5204 $EA $00 $D6
    pop  de                                       ;; 03:5207 $D1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 03:5208 $F0 $CF
    ld   [hl+], a                                 ;; 03:520A $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 03:520B $F0 $D0
    ld   [hl+], a                                 ;; 03:520D $22
    ld   a, $81                                   ;; 03:520E $3E $81
    ld   [hl+], a                                 ;; 03:5210 $22
    ld   a, [de]                                  ;; 03:5211 $1A
    inc  de                                       ;; 03:5212 $13
    ld   [hl+], a                                 ;; 03:5213 $22
    ld   a, [de]                                  ;; 03:5214 $1A
    inc  de                                       ;; 03:5215 $13
    ld   [hl+], a                                 ;; 03:5216 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 03:5217 $F0 $CF
    ld   [hl+], a                                 ;; 03:5219 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 03:521A $F0 $D0
    inc  a                                        ;; 03:521C $3C
    ld   [hl+], a                                 ;; 03:521D $22
    ld   a, $81                                   ;; 03:521E $3E $81
    ld   [hl+], a                                 ;; 03:5220 $22
    ld   a, [de]                                  ;; 03:5221 $1A
    inc  de                                       ;; 03:5222 $13
    ld   [hl+], a                                 ;; 03:5223 $22
    ld   a, [de]                                  ;; 03:5224 $1A
    ld   [hl+], a                                 ;; 03:5225 $22
    xor  a                                        ;; 03:5226 $AF
    ld   [hl], a                                  ;; 03:5227 $77
    ldh  a, [hIsGBC]                              ;; 03:5228 $F0 $FE
    and  a                                        ;; 03:522A $A7
    jr   z, .ret_5234                             ;; 03:522B $28 $07

    push bc                                       ;; 03:522D $C5
    ld   a, $03                                   ;; 03:522E $3E $03
    call func_91D                                 ;; 03:5230 $CD $1D $09
    pop  bc                                       ;; 03:5233 $C1

.ret_5234
    ret                                           ;; 03:5234 $C9

include "code/entities/03_pushed_block.asm"

func_003_52D4::
    ld   e, $0F                                   ;; 03:52D4 $1E $0F
    ld   d, b                                     ;; 03:52D6 $50

label_003_52D7:
    ld   hl, wEntitiesStatusTable                 ;; 03:52D7 $21 $80 $C2
    add  hl, de                                   ;; 03:52DA $19
    ld   a, [hl]                                  ;; 03:52DB $7E
    cp   $05                                      ;; 03:52DC $FE $05
    jr   c, .jr_531E                              ;; 03:52DE $38 $3E

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:52E0 $21 $40 $C3
    add  hl, de                                   ;; 03:52E3 $19
    ld   a, [hl]                                  ;; 03:52E4 $7E
    and  ENTITY_PHYSICS_PROJECTILE_NOCLIP         ;; 03:52E5 $E6 $40
    jr   nz, .jr_531E                             ;; 03:52E7 $20 $35

    ld   hl, wEntitiesPosXTable                   ;; 03:52E9 $21 $00 $C2
    add  hl, de                                   ;; 03:52EC $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:52ED $F0 $EE
    sub  [hl]                                     ;; 03:52EF $96
    add  $0C                                      ;; 03:52F0 $C6 $0C
    cp   $18                                      ;; 03:52F2 $FE $18
    jr   nc, .jr_531E                             ;; 03:52F4 $30 $28

    ld   hl, wEntitiesPosYTable                   ;; 03:52F6 $21 $10 $C2
    add  hl, de                                   ;; 03:52F9 $19
    ld   a, [hl]                                  ;; 03:52FA $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:52FB $21 $10 $C3
    add  hl, de                                   ;; 03:52FE $19
    sub  [hl]                                     ;; 03:52FF $96
    ld   hl, hActiveEntityVisualPosY              ;; 03:5300 $21 $EC $FF
    sub  [hl]                                     ;; 03:5303 $96
    add  $0C                                      ;; 03:5304 $C6 $0C
    cp   $18                                      ;; 03:5306 $FE $18
    jr   nc, .jr_531E                             ;; 03:5308 $30 $14

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:530A $21 $40 $C3
    add  hl, de                                   ;; 03:530D $19
    ld   a, [hl]                                  ;; 03:530E $7E
    and  ENTITY_PHYSICS_GRABBABLE                 ;; 03:530F $E6 $20
    jr   nz, .jr_531E                             ;; 03:5311 $20 $0B

    push bc                                       ;; 03:5313 $C5
    ld   c, e                                     ;; 03:5314 $4B
    ld   b, d                                     ;; 03:5315 $42
    push de                                       ;; 03:5316 $D5
    ld   a, $08                                   ;; 03:5317 $3E $08
    call ConfigureEntityRecoil                    ;; 03:5319 $CD $CC $6F
    pop  de                                       ;; 03:531C $D1
    pop  bc                                       ;; 03:531D $C1

.jr_531E
    dec  e                                        ;; 03:531E $1D
    ld   a, e                                     ;; 03:531F $7B
    cp   $FF                                      ;; 03:5320 $FE $FF
    jp   nz, label_003_52D7                       ;; 03:5322 $C2 $D7 $52

    ret                                           ;; 03:5325 $C9

include "code/entities/03_liftable_rock.asm"

func_003_53E4::; likely cutting grass
    ld   hl, hNoiseSfx                            ;; 03:53E4 $21 $F4 $FF
    ld   [hl], NOISE_SFX_CUT_GRASS                ;; 03:53E7 $36 $05
    ld   e, $1F                                   ;; 03:53E9 $1E $1F
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:53EB $F0 $F1
    cp   $FF                                      ;; 03:53ED $FE $FF
    jr   z, .jr_53F9                              ;; 03:53EF $28 $08

    cp   $01                                      ;; 03:53F1 $FE $01
    jr   z, .jr_53F9                              ;; 03:53F3 $28 $04

    ld   [hl], $09                                ;; 03:53F5 $36 $09
    ld   e, $0F                                   ;; 03:53F7 $1E $0F

.jr_53F9
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 03:53F9 $21 $F0 $C2
    add  hl, bc                                   ;; 03:53FC $09
    ld   [hl], e                                  ;; 03:53FD $73
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:53FE $21 $40 $C3
    add  hl, bc                                   ;; 03:5401 $09
IF __OPTIMIZATIONS_1__
    inc  [hl]
    inc  [hl]
ELSE
    ld   a, [hl]                                  ;; 03:5402 $7E
    add  $02                                      ;; 03:5403 $C6 $02
    ld   [hl], a                                  ;; 03:5405 $77
ENDC

ret_003_5406:
    ret                                           ;; 03:5406 $C9

SmashRock::
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 03:5407 $3E $05
    call SpawnNewEntity                           ;; 03:5409 $CD $CA $64
    ret  c                                        ;; 03:540C $D8

    ;
    ; Smash rock
    ;

    ldh  a, [hMultiPurpose0]                      ;; 03:540D $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 03:540F $21 $00 $C2
    add  hl, de                                   ;; 03:5412 $19
    ld   [hl], a                                  ;; 03:5413 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:5414 $F0 $D8
    ld   hl, hMultiPurpose3                       ;; 03:5416 $21 $DA $FF
    sub  [hl]                                     ;; 03:5419 $96
    ld   hl, wEntitiesPosYTable                   ;; 03:541A $21 $10 $C2
    add  hl, de                                   ;; 03:541D $19
    ld   [hl], a                                  ;; 03:541E $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:541F $21 $B0 $C3
    add  hl, de                                   ;; 03:5422 $19
    ld   [hl], $00                                ;; 03:5423 $36 $00
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 03:5425 $21 $F0 $C2
    add  hl, de                                   ;; 03:5428 $19
    ld   [hl], $0F                                ;; 03:5429 $36 $0F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:542B $21 $40 $C3
    add  hl, de                                   ;; 03:542E $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 03:542F $36 $C4
    ld   a, NOISE_SFX_POT_SMASHED                 ;; 03:5431 $3E $09
    ldh  [hNoiseSfx], a                           ;; 03:5433 $E0 $F4
    jp   UnloadEntityAndReturn                    ;; 03:5435 $C3 $8D $3F

func_003_5438::
    ld   hl, wEntitiesCollisionsTable             ;; 03:5438 $21 $A0 $C2
    add  hl, bc                                   ;; 03:543B $09
    ld   a, [hl]                                  ;; 03:543C $7E
    and  a                                        ;; 03:543D $A7
    ret  z                                        ;; 03:543E $C8

    ld   a, [wRoomEvent]                          ;; 03:543F $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 03:5442 $E6 $1F
    cp   TRIGGER_THROW_POT_AT_CHEST               ;; 03:5444 $FE $0D
    jr   nz, jr_003_5467                          ;; 03:5446 $20 $1F

    ld   a, [wEntityHorizontallyCollidedObject]   ;; 03:5448 $FA $03 $C5
    cp   $A0                                      ;; 03:544B $FE $A0
    jr   z, .jr_5455                              ;; 03:544D $28 $06

    ld   a, [wEntityVerticallyCollidedObject]     ;; 03:544F $FA $0D $C5
    cp   $A0                                      ;; 03:5452 $FE $A0
    ret  nz                                       ;; 03:5454 $C0

.jr_5455
    ld   a, $30                                   ;; 03:5455 $3E $30
    ldh  [hIntersectedObjectLeft], a              ;; 03:5457 $E0 $CE
    ld   a, $20                                   ;; 03:5459 $3E $20
    ldh  [hIntersectedObjectTop], a               ;; 03:545B $E0 $CD
    ld   a, $19                                   ;; 03:545D $3E $19
    ldh  [hMultiPurpose8], a                      ;; 03:545F $E0 $DF
    call label_3E4D                               ;; 03:5461 $CD $4D $3E
    jp   MarkTriggerAsResolved                    ;; 03:5464 $C3 $60 $0C

jr_003_5467:
    cp   $0B                                      ;; 03:5467 $FE $0B
    ret  nz                                       ;; 03:5469 $C0

    ld   a, [wEntityVerticallyCollidedObject]     ;; 03:546A $FA $0D $C5
    cp   $35                                      ;; 03:546D $FE $35
    ret  c                                        ;; 03:546F $D8

    cp   $3D                                      ;; 03:5470 $FE $3D
    jr   c, .jr_547D                              ;; 03:5472 $38 $09

    ld   a, [wEntityHorizontallyCollidedObject]   ;; 03:5474 $FA $03 $C5
    cp   $35                                      ;; 03:5477 $FE $35
    ret  c                                        ;; 03:5479 $D8

    cp   $3D                                      ;; 03:547A $FE $3D
    ret  nc                                       ;; 03:547C $D0

.jr_547D
    jp   MarkTriggerAsResolved                    ;; 03:547D $C3 $60 $0C

; Alternate explosion GFX display list (unused?)
Data_003_5480::
    db   $32, $01, $32, $61

; Explosion GFX display list
; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown022SpriteVariants::
.variant0
    db $30, $01
    db $30, $61

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
    ld   hl, wEntitiesOptions1Table               ;; 03:5518 $21 $30 $C4
    add  hl, bc                                   ;; 03:551B $09
    ld   a, [hl]                                  ;; 03:551C $7E
    and  ENTITY_OPT1_IS_BOSS                      ;; 03:551D $E6 $80
IF __OPTIMIZATIONS_1__
    jp   nz, ExecuteActiveEntityHandler
ELSE
    jr   z, .dying                                ;; 03:551F $28 $03

    jp   ExecuteActiveEntityHandler               ;; 03:5521 $C3 $8D $3A
ENDC

.dying
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:5524 $21 $80 $C4
    add  hl, bc                                   ;; 03:5527 $09
    ld   a, [hl]                                  ;; 03:5528 $7E
    and  a                                        ;; 03:5529 $A7
    jp   z, DidKillEnemy                          ;; 03:552A $CA $50 $3F

    ; hl = (wEntitiesPowerRecoilingTable[bc] == 1 ? Data_003_54C8 : Data_003_5488)
    push af                                       ;; 03:552D $F5
    ld   hl, wEntitiesPowerRecoilingTable         ;; 03:552E $21 $A0 $C4
    add  hl, bc                                   ;; 03:5531 $09
    ld   a, [hl]                                  ;; 03:5532 $7E
    ld   hl, Data_003_5488                        ;; 03:5533 $21 $88 $54
    and  a                                        ;; 03:5536 $A7
    jr   z, .jr_003_553C                          ;; 03:5537 $28 $03
    ld   hl, Data_003_54C8                        ;; 03:5539 $21 $C8 $54
.jr_003_553C

    ; a = wEntitiesPrivateCountdown3Table[bc]
    pop  af                                       ;; 03:553C $F1
    cp   $20                                      ;; 03:553D $FE $20
    jr   nc, jr_003_556F                          ;; 03:553F $30 $2E

    rla                                           ;; 03:5541 $17
    and  $30                                      ;; 03:5542 $E6 $30
    ld   e, a                                     ;; 03:5544 $5F
    ld   d, b                                     ;; 03:5545 $50
    add  hl, de                                   ;; 03:5546 $19
    cp   $30                                      ;; 03:5547 $FE $30
    jr   nz, .jr_003_5555                         ;; 03:5549 $20 $0A

    ; If the entity is recoiling from a power hit…
    push hl                                       ;; 03:554B $E5
    ld   hl, wEntitiesPowerRecoilingTable         ;; 03:554C $21 $A0 $C4
    add  hl, bc                                   ;; 03:554F $09
    ld   a, [hl]                                  ;; 03:5550 $7E
    pop  hl                                       ;; 03:5551 $E1
    and  a                                        ;; 03:5552 $A7
    jr   nz, .powerRecoil                         ;; 03:5553 $20 $07

.jr_003_5555
    ld   c, $04                                   ;; 03:5555 $0E $04
    call RenderActiveEntitySpritesRect            ;; 03:5557 $CD $E6 $3C
    jr   .renderEnd                               ;; 03:555A $18 $0C
.powerRecoil
    ld   c, $08                                   ;; 03:555C $0E $08
    call RenderActiveEntitySpritesRect            ;; 03:555E $CD $E6 $3C
    ld   a, $04                                   ;; 03:5561 $3E $04
    call func_015_7964_trampoline                 ;; 03:5563 $CD $A0 $3D
    jr   .renderEnd                               ;; 03:5566 $18 $00
.renderEnd

    call ReturnIfNonInteractive_03                ;; 03:5568 $CD $78 $7F
    call ApplyRecoilIfNeeded_03                   ;; 03:556B $CD $A9 $7F
    ret                                           ;; 03:556E $C9

jr_003_556F:
    call ExecuteActiveEntityHandler_trampoline    ;; 03:556F $CD $81 $3A
    call ReturnIfNonInteractive_03.allowInactiveEntity ;; 03:5572 $CD $7E $7F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:5575 $21 $10 $C4
    add  hl, bc                                   ;; 03:5578 $09
    ld   a, [hl]                                  ;; 03:5579 $7E
    and  a                                        ;; 03:557A $A7
    jr   nz, jr_003_5599                          ;; 03:557B $20 $1C

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:557D $21 $80 $C4
    add  hl, bc                                   ;; 03:5580 $09
    ld   [hl], $1F                                ;; 03:5581 $36 $1F
    ld   a, [wTunicType]                          ;; 03:5583 $FA $0F $DC
    and  a                                        ;; 03:5586 $A7
    jr   nz, .jr_5594                             ;; 03:5587 $20 $0B

    ld   a, [wActivePowerUp]                      ;; 03:5589 $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 03:558C $FE $01
    jr   nz, .jr_5594                             ;; 03:558E $20 $04

    ld   a, WAVE_SFX_UNKNOWN_12                   ;; 03:5590 $3E $12
    ldh  [hWaveSfx], a                            ;; 03:5592 $E0 $F3

.jr_5594
    ld   hl, hNoiseSfx                            ;; 03:5594 $21 $F4 $FF
    ld   [hl], NOISE_SFX_ENEMY_DESTROYED          ;; 03:5597 $36 $13

jr_003_5599:
    call ApplyRecoilIfNeeded_03                   ;; 03:5599 $CD $A9 $7F
    ret                                           ;; 03:559C $C9

DropTableByIndex::
    ; minimum offset is 1, so actualy used address is label -1 -> address of ret above
    ; indexed by a combination of destroyed entity index and a value from DestroyedEntityHealthGroupOffsetTable
    ; TODO: comment index
    db   ENTITY_DROPPABLE_RUPEE
    db   ENTITY_DROPPABLE_RUPEE
    db   ENTITY_DROPPABLE_HEART
    db   ENTITY_DROPPABLE_HEART
    db   ENTITY_DROPPABLE_ARROWS
    db   ENTITY_DROPPABLE_HEART
    db   ENTITY_NONE
    db   ENTITY_NONE
    db   ENTITY_DROPPABLE_FAIRY
    db   ENTITY_DROPPABLE_ARROWS
    db   ENTITY_DROPPABLE_BOMBS
    db   ENTITY_DROPPABLE_RUPEE
    db   ENTITY_DROPPABLE_FAIRY
    db   ENTITY_DROPPABLE_FAIRY

RandomDropChanceTable::
    ; minimum offset is 1, so actualy used address is label -1
    ; TODO: comment index
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_25_PERCENT
    db   DROP_CHANCE_0_PERCENT

RandomDropChanceTableLowHealth::
    ; minimum offset is 1, so actualy used address is label -1
    ; TODO: comment index
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_0_PERCENT
    db   DROP_CHANCE_50_PERCENT
    db   DROP_CHANCE_0_PERCENT

DropTableRandom::
    ; rupee  = 1/4
    ; heart  = 1/4
    ; bombs  = 1/4
    ; fairy  = 1/8
    ; arrows = 1/8
    db   ENTITY_DROPPABLE_RUPEE  ; random value 0
    db   ENTITY_DROPPABLE_HEART  ; random value 1
    db   ENTITY_DROPPABLE_BOMBS  ; random value 2
    db   ENTITY_DROPPABLE_FAIRY  ; random value 3
    db   ENTITY_DROPPABLE_RUPEE  ; random value 4
    db   ENTITY_DROPPABLE_HEART  ; random value 5
    db   ENTITY_DROPPABLE_BOMBS  ; random value 6
    db   ENTITY_DROPPABLE_ARROWS ; random value 7

; Entities random drop tables
; Spawn a dropped item when an enemy is destroyed.
; The item can be:
;  - The shield eaten by a Like-Like
;  - A specific dropped item defined by the entity
;  - A power-up (fragment of power or guardian acorn)
;  - A random object set by the drop table
;
; Input:
;   bc   destroyed entity index (b=0)
SpawnEnemyDrop::
    ldh  a, [hActiveEntityType]                   ;; 03:55CF $F0 $EB
    cp   ENTITY_LIKE_LIKE                         ;; 03:55D1 $FE $23
    jr   nz, .likeLikeEnd                         ;; 03:55D3 $20 $0D
    ; if active entity is Like-Like
    ld   hl, wEntitiesPrivateState1Table          ;; 03:55D5 $21 $B0 $C2
    add  hl, bc                                   ;; 03:55D8 $09
    ld   a, [hl]                                  ;; 03:55D9 $7E
    and  a                                        ;; 03:55DA $A7
    jr   z, .likeLikeEnd                          ;; 03:55DB $28 $05
    ; if Like-Like swollowed the shield
    ld   a, ENTITY_SWORD_SHIELD_PICKUP            ;; 03:55DD $3E $31
    jp   .dropEntity                              ;; 03:55DF $C3 $70 $56

.likeLikeEnd:
    ; look up what this entity could drop
    ld   hl, wEntitiesDroppedItemTable            ;; 03:55E2 $21 $E0 $C4
    add  hl, bc                                   ;; 03:55E5 $09
    ld   a, [hl]                                  ;; 03:55E6 $7E
    ; if nothing to drop, then return
    cp   ENTITY_NONE                              ;; 03:55E7 $FE $FF
    ret  z                                        ;; 03:55E9 $C8
    ; if drop is not random, drop the entity
    and  a                                        ;; 03:55EA $A7
    jp   nz, .dropEntity                          ;; 03:55EB $C2 $70 $56
    ; check if wGuardianAcornCounter reached limit
    ld   a, [wGuardianAcornCounter]               ;; 03:55EE $FA $71 $D4
    inc  a                                        ;; 03:55F1 $3C
    ld   [wGuardianAcornCounter], a               ;; 03:55F2 $EA $71 $D4
    cp   GUARDIAN_ACORN_COUNTER_MAX               ;; 03:55F5 $FE $0C
    jr   c, .noGuardianAcornDrop                  ;; 03:55F7 $38 $16
    ; reset counter if max value reached, even if not droped
    xor  a                                        ;; 03:55F9 $AF
    ld   [wGuardianAcornCounter], a               ;; 03:55FA $EA $71 $D4
    ; do not drop after boss battle
    ld   a, [wInBossBattle]                       ;; 03:55FD $FA $BE $C1
    ; do not drop if allready power up active
    ld   hl, wActivePowerUp                       ;; 03:5600 $21 $7C $D4
    or   [hl]                                     ;; 03:5603 $B6
    ; do not drop during side scrolling
    ld   hl, hIsSideScrolling                     ;; 03:5604 $21 $F9 $FF
    or   [hl]                                     ;; 03:5607 $B6
    jr   nz, .noGuardianAcornDrop                 ;; 03:5608 $20 $05
    ; drop the guardian acorn
    ld   a, ENTITY_GUARDIAN_ACORN                 ;; 03:560A $3E $34
    jp   .dropEntity                              ;; 03:560C $C3 $70 $56

.noGuardianAcornDrop:
    ; get an offset from the DestroyedEntityHealthGroupOffsetTable
    ; the value is used in combination with the destroyed entity type in further code as as offset by add HL, DE
    ld   hl, wEntitiesHealthGroup                 ;; 03:560F $21 $D0 $C4
    add  hl, bc                                   ;; 03:5612 $09
    ld   d, b                                     ;; 03:5613 $50
    ld   e, [hl]                                  ;; 03:5614 $5E
    ld   hl, DestroyedEntityHealthGroupOffsetTable ;; 03:5615 $21 $26 $48
    add  hl, de                                   ;; 03:5618 $19
    ld   a, [hl]                                  ;; 03:5619 $7E
    and  a                                        ;; 03:561A $A7
    ret  z                                        ;; 03:561B $C8
    ; look up the needed kill value for a piece of power
    ; in general the needed value is lower, if the max health is lower
    ; so you get the piece of power more often in the early game
    ld   e, a                                     ; How many enemies to kill before a Piece of Power drops?
    ; early game
    ld   d, PIECE_OF_POWER_COUNTER_MAX_LOW_MAX_HEALTH ; Max HP 0~6: 30
    ld   a, [wMaxHearts]                          ;
    cp   LOW_MAX_HEALTH                           ; If max HP <= 6, skip
    jr   c, .pieceOfPowerDrop                     ;
    ; mid game
    ld   d, PIECE_OF_POWER_COUNTER_MAX_MEDIUM_MAX_HEALTH ; Max HP 7~10: 35
    cp   MEDIUM_MAX_HEALTH                        ;
    jr   c, .pieceOfPowerDrop                     ; If max HP <= 11, skip
    ; late game
    ld   d, PIECE_OF_POWER_COUNTER_MAX_HIGH_MAX_HEALTH ; Max HP 11~14: 40

.pieceOfPowerDrop:
    ; increment kill counter
    ld   hl, wPieceOfPowerKillCount               ;; 03:562E $21 $15 $D4
    inc  [hl]                                     ;; 03:5631 $34
    ; no drop, if counter may not reached
    ld   a, [hl]                                  ;; 03:5632 $7E
    cp   d                                        ;; 03:5633 $BA
    jr   c, .noPieceOfPowerDrop                   ;; 03:5634 $38 $12
    ; no drop, if in boss battle
    ld   [hl], b                                  ;; 03:5636 $70
    ld   a, [wInBossBattle]                       ;; 03:5637 $FA $BE $C1
    ; no drop, if in side scrolling
    ld   hl, hIsSideScrolling                     ;; 03:563A $21 $F9 $FF
    or   [hl]                                     ;; 03:563D $B6
    ; no drop, if power up is active
    ld   hl, wActivePowerUp                       ;; 03:563E $21 $7C $D4
    or   [hl]                                     ;; 03:5641 $B6
    jr   nz, .noPieceOfPowerDrop                  ;; 03:5642 $20 $04
    ; drop piece of power
    ld   a, ENTITY_PIECE_OF_POWER                 ;; 03:5644 $3E $33
    jr   .dropEntity                              ;; 03:5646 $18 $28

.noPieceOfPowerDrop:
    ld   d, b                                     ;; 03:5648 $50
    ld   hl, (RandomDropChanceTable -1)           ;; 03:5649 $21 $AA $55
    ld   a, [wIsOnLowHeath]                       ;; 03:564C $FA $63 $C1
    and  a                                        ;; 03:564F $A7
    jr   z, .dropRandomEntity                     ;; 03:5650 $28 $03
    ; on low health load a drop table with higher chances of dropping something
    ld   hl, (RandomDropChanceTableLowHealth -1)  ;; 03:5652 $21 $B8 $55

.dropRandomEntity:
    add  hl, de                                   ;; 03:5655 $19
    ; randomize, if something is dropped at all
    call GetRandomByte                            ;; 03:5656 $CD $0D $28
    and  [hl]                                     ;; 03:5659 $A6
    ret  nz                                       ;; 03:565A $C0

    ld   hl, (DropTableByIndex - 1)               ;; 03:565B $21 $9C $55
    add  hl, de                                   ;; 03:565E $19
    ld   a, [hl]                                  ;; 03:565F $7E
    cp   ENTITY_NONE                              ;; 03:5660 $FE $FF
    jr   nz, .dropEntity                          ;; 03:5662 $20 $0C
    ; de-index was 7 or 8
    ; so lookup with other table and change the offset
    call GetRandomByte                            ;; 03:5664 $CD $0D $28
    ; only keep 3 bits, because DropTableRandom does only contain 8 values
    and  %00000111                                ;; 03:5667 $E6 $07
    ld   e, a                                     ;; 03:5669 $5F
    ld   d, b                                     ;; 03:566A $50
    ld   hl, DropTableRandom                      ;; 03:566B $21 $C7 $55
    add  hl, de                                   ;; 03:566E $19
    ld   a, [hl]                                  ;; 03:566F $7E

.dropEntity:
    ; Spawn the entity (and return if the entity could not be created)
    call SpawnNewEntity                           ;; 03:5670 $CD $CA $64
    ret  c                                        ;; 03:5673 $D8

    ; Configure the dropped item entity
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5674 $21 $B0 $C2
    add  hl, bc                                   ;; 03:5677 $09
    ld   a, [hl]                                  ;; 03:5678 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5679 $21 $B0 $C2
    add  hl, de                                   ;; 03:567C $19
    ld   [hl], a                                  ;; 03:567D $77
    ldh  a, [hMultiPurpose0]                      ;; 03:567E $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 03:5680 $21 $00 $C2
    add  hl, de                                   ;; 03:5683 $19
    ld   [hl], a                                  ;; 03:5684 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:5685 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:5687 $21 $10 $C2
    add  hl, de                                   ;; 03:568A $19
    ld   [hl], a                                  ;; 03:568B $77
    ; configure timers
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 03:568C $21 $50 $C4
    add  hl, de                                   ;; 03:568F $19
    ld   [hl], DROP_DESPAWN_TIME                  ;; 03:5690 $36 $80
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 03:5692 $21 $F0 $C2
    add  hl, de                                   ;; 03:5695 $19
    ld   [hl], DROP_COUNTDOWN_TIME                ;; 03:5696 $36 $18

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:5698 $21 $80 $C4
    add  hl, de                                   ;; 03:569B $19
    ld   [hl], $03                                ;; 03:569C $36 $03

    ldh  a, [hIsSideScrolling]                    ;; 03:569E $F0 $F9
    and  a                                        ;; 03:56A0 $A7
    jr   nz, .isSideScrolling                     ;; 03:56A1 $20 $36

    ld   hl, wEntitiesTypeTable                   ;; 03:56A3 $21 $A0 $C3
    add  hl, de                                   ;; 03:56A6 $19
    ld   a, [hl]                                  ;; 03:56A7 $7E
    cp   ENTITY_KEY_DROP_POINT                    ;; 03:56A8 $FE $30
    jr   nz, .noSpriteUpdate                      ;; 03:56AA $20 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:56AC $F0 $EB
    cp   ENTITY_ARMOS_KNIGHT                      ;; 03:56AE $FE $88
    jr   nz, .noSpriteUpdate                      ;; 03:56B0 $20 $06

    ld   hl, wEntitiesSpriteVariantTable          ;; 03:56B2 $21 $B0 $C3
    add  hl, de                                   ;; 03:56B5 $19
    ld   [hl], $03                                ;; 03:56B6 $36 $03

.noSpriteUpdate:
    cp   ENTITY_HIDING_SLIME_KEY                  ;; 03:56B8 $FE $3C
    jr   nz, .slimeKeyEnd                         ;; 03:56BA $20 $15

    ldh  a, [hMapRoom]                            ;; 03:56BC $F0 $F6
    cp   ROOM_OW_KANALET_CASTLE_CROW              ; Overworld Kanalet Castle crow room
    jr   z, .moveKeyTowardsLink                   ;; 03:56C0 $28 $04

    cp   ROOM_OW_KANALET_CASTLE_FIVE_PITS         ;; 03:56C2
    jr   nz, .slimeKeyEnd                         ;; 03:56C4 $20 $0B

.moveKeyTowardsLink:
    push bc                                       ;; 03:56C6 $C5
    push de                                       ;; 03:56C7 $D5
    ld   c, e                                     ;; 03:56C8 $4B
    ld   b, d                                     ;; 03:56C9 $42
    ld   a, $10                                   ;; 03:56CA $3E $10
    call ApplyVectorTowardsLink                   ;; 03:56CC $CD $C7 $7E
    pop  de                                       ;; 03:56CF $D1
    pop  bc                                       ;; 03:56D0 $C1

.slimeKeyEnd:
    ld   hl, wEntitiesSpeedZTable                 ;; 03:56D1 $21 $20 $C3
    add  hl, de                                   ;; 03:56D4 $19
    ld   [hl], $18                                ;; 03:56D5 $36 $18
    jr   .applyDefaultPosZ                        ;; 03:56D7 $18 $06

.isSideScrolling:
    ld   hl, wEntitiesSpeedYTable                 ;; 03:56D9 $21 $50 $C2
    add  hl, de                                   ;; 03:56DC $19
    ld   [hl], $EC                                ;; 03:56DD $36 $EC

.applyDefaultPosZ:
    ; Give the dropped item the same Z position than the destroyed enemy
    ld   hl, wEntitiesPosZTable                   ;; 03:56DF $21 $10 $C3
    add  hl, bc                                   ;; 03:56E2 $09
    ld   a, [hl]                                  ;; 03:56E3 $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:56E4 $21 $10 $C3
    add  hl, de                                   ;; 03:56E7 $19
    ld   [hl], a                                  ;; 03:56E8 $77
    ret                                           ;; 03:56E9 $C9

Data_003_56EA::
    db   $01, $08, $08, $10

Data_003_56EE::
    db   $01, $04, $04

Data_003_56F1::
.right: db  $0A, $37, $37, $37
.left:  db  $01, $39, $39, $39
.up:    db  $01, $3B, $3B, $3B
.down:  db  $01, $3D, $3D, $3D

Data_003_5701::
.right: db  $01, $10, $10, $08
.left:  db  $00, $F0, $F0, $F8
.up:    db  $00, $00, $00, $00
.down:  db  $00, $FF, $FF, $FF

Data_003_5711::
.right: db  $FF, $00, $00, $00
.left:  db  $00, $00, $00, $00
.up:    db  $00, $00, $00, $00
.down:  db  $00, $00, $00, $08

Data_003_5721::
    db  $00, $00, $00, $08
    db  $0E, $00, $00, $08
    db  $0E, $00, $00, $08
    db  $0E, $00, $00, $00
    db  $0E

EntityLiftedHandler::
    ldh  a, [hActiveEntityType]                   ;; 03:5732 $F0 $EB
    ld   [wLiftedEntityType], a                   ;; 03:5734 $EA $A8 $C5
    cp   ENTITY_BOMB                              ;; 03:5737 $FE $02
    jr   nz, .jr_5745                             ;; 03:5739 $20 $0A

    ld   hl, wEntitiesFlashCountdownTable         ;; 03:573B $21 $20 $C4
    add  hl, bc                                   ;; 03:573E $09
    ld   [hl], b                                  ;; 03:573F $70
    call func_003_6711                            ;; 03:5740 $CD $11 $67
    jr   jr_003_5748                              ;; 03:5743 $18 $03

.jr_5745
    call ExecuteActiveEntityHandler_trampoline    ;; 03:5745 $CD $81 $3A

jr_003_5748:
    ld   hl, wEntitiesLiftedTable                 ;; 03:5748 $21 $90 $C4
    add  hl, bc                                   ;; 03:574B $09
    ld   a, [hl]                                  ;; 03:574C $7E
    ld   e, a                                     ;; 03:574D $5F
    ld   d, b                                     ;; 03:574E $50
    cp   $04                                      ;; 03:574F $FE $04
    jr   z, jr_003_5789                           ;; 03:5751 $28 $36

    ld   a, [wC15D]                               ;; 03:5753 $FA $5D $C1
    ldh  [hLinkDirection], a                      ;; 03:5756 $E0 $9E
    push hl                                       ;; 03:5758 $E5
    call GetEntityTransitionCountdown             ;; 03:5759 $CD $05 $0C
    pop  hl                                       ;; 03:575C $E1
    and  a                                        ;; 03:575D $A7
    jr   nz, jr_003_5789                          ;; 03:575E $20 $29

    inc  [hl]                                     ;; 03:5760 $34
    ld   hl, Data_003_56EA                        ;; 03:5761 $21 $EA $56

    ldh  a, [hActiveEntityType]                   ;; 03:5764 $F0 $EB
    cp   ENTITY_BOMB                              ;; 03:5766 $FE $02
    jr   z, .jr_577F                              ;; 03:5768 $28 $15

    ld   a, [wPowerBraceletLevel]                 ;; 03:576A $FA $43 $DB
    cp   $02                                      ;; 03:576D $FE $02
    jr   nc, .jr_577F                             ;; 03:576F $30 $0E

    ld   a, [wTunicType]                          ;; 03:5771 $FA $0F $DC
    and  TUNIC_RED                                ;; 03:5774 $E6 $01
    jr   nz, .jr_577F                             ;; 03:5776 $20 $07

    ld   a, [wActivePowerUp]                      ;; 03:5778 $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 03:577B $FE $01
    jr   nz, jr_003_5782                          ;; 03:577D $20 $03

.jr_577F
    ld   hl, Data_003_56EE                        ;; 03:577F $21 $EE $56

jr_003_5782:
    add  hl, de                                   ;; 03:5782 $19
    ld   a, [hl]                                  ;; 03:5783 $7E
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:5784 $21 $E0 $C2
    add  hl, bc                                   ;; 03:5787 $09
    ld   [hl], a                                  ;; 03:5788 $77

jr_003_5789:
    ld   a, e                                     ;; 03:5789 $7B
    cp   $00                                      ;; 03:578A $FE $00
    jr   nz, .jr_578F                             ;; 03:578C $20 $01

    inc  e                                        ;; 03:578E $1C

.jr_578F
    call func_003_5795                            ;; 03:578F $CD $95 $57
    jp   label_003_57E6                           ;; 03:5792 $C3 $E6 $57

; e = carried object type ?
func_003_5795::
    ldh  a, [hLinkDirection]                      ;; 03:5795 $F0 $9E
    sla  a                                        ;; 03:5797 $CB $27
    sla  a                                        ;; 03:5799 $CB $27
    add  e                                        ;; 03:579B $83
    ld   e, a                                     ;; 03:579C $5F
    ld   d, $00                                   ;; 03:579D $16 $00
    ld   hl, Data_003_56F1                        ;; 03:579F $21 $F1 $56
    add  hl, de                                   ;; 03:57A2 $19
    ld   a, [hl]                                  ;; 03:57A3 $7E
    ld   [wIsCarryingLiftedObject], a             ;; 03:57A4 $EA $5C $C1
    ld   hl, Data_003_5701                        ;; 03:57A7 $21 $01 $57
    add  hl, de                                   ;; 03:57AA $19
    ld   a, [hl]                                  ;; 03:57AB $7E
    ld   hl, hLinkPositionX                       ;; 03:57AC $21 $98 $FF
    add  [hl]                                     ;; 03:57AF $86
    ld   hl, wEntitiesPosXTable                   ;; 03:57B0 $21 $00 $C2
    add  hl, bc                                   ;; 03:57B3 $09
    ld   [hl], a                                  ;; 03:57B4 $77
    ld   hl, Data_003_5711                        ;; 03:57B5 $21 $11 $57
    add  hl, de                                   ;; 03:57B8 $19
    ld   a, [hl]                                  ;; 03:57B9 $7E
    ld   hl, hLinkPositionY                       ;; 03:57BA $21 $99 $FF
    add  [hl]                                     ;; 03:57BD $86
    ld   hl, wC13B                                ;; 03:57BE $21 $3B $C1
    add  [hl]                                     ;; 03:57C1 $86
    ld   hl, wEntitiesPosYTable                   ;; 03:57C2 $21 $10 $C2
    add  hl, bc                                   ;; 03:57C5 $09
    ld   [hl], a                                  ;; 03:57C6 $77
    ldh  a, [hIsSideScrolling]                    ;; 03:57C7 $F0 $F9
    and  a                                        ;; 03:57C9 $A7
    jr   z, .jr_57D7                              ;; 03:57CA $28 $0B

    push hl                                       ;; 03:57CC $E5
    ld   hl, Data_003_5721                        ;; 03:57CD $21 $21 $57
    add  hl, de                                   ;; 03:57D0 $19
    ld   e, [hl]                                  ;; 03:57D1 $5E
    pop  hl                                       ;; 03:57D2 $E1
    ld   a, [hl]                                  ;; 03:57D3 $7E
    sub  e                                        ;; 03:57D4 $93
    ld   [hl], a                                  ;; 03:57D5 $77
    ret                                           ;; 03:57D6 $C9

.jr_57D7
    ld   hl, Data_003_5721                        ;; 03:57D7 $21 $21 $57
    add  hl, de                                   ;; 03:57DA $19
    ld   a, [hl]                                  ;; 03:57DB $7E
    ld   hl, hLinkPositionZ                       ;; 03:57DC $21 $A2 $FF
    add  [hl]                                     ;; 03:57DF $86
    ld   hl, wEntitiesPosZTable                   ;; 03:57E0 $21 $10 $C3
    add  hl, bc                                   ;; 03:57E3 $09
    ld   [hl], a                                  ;; 03:57E4 $77
    ret                                           ;; 03:57E5 $C9

label_003_57E6:
    jp   label_397B                               ;; 03:57E6 $C3 $7B $39

include "code/entities/03_octorok.asm"
include "code/entities/03_moblin.asm"

EntityInitBrokenHeartContainer::
    ret                                           ;; 03:59D7 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HeartContainerSpriteVariants::
.variant0
    db $AA, $14
    db $AA, $34

; Loop run every frame heart container is on screen
HeartContainerEntityHandler::
    ld   de, HeartContainerSpriteVariants         ;; 03:59DC $11 $D8 $59
    call RenderActiveEntitySpritesPair            ;; 03:59DF $CD $C0 $3B
    call GetEntityTransitionCountdown             ;; 03:59E2 $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:59E5 $CA $AA $60

    ; Start of when item is picked up
    dec  a                                        ;; 03:59E8 $3D
    jr   nz, HoldEntityAboveLink                  ;; 03:59E9 $20 $2C

    ld   a, MUSIC_AFTER_BOSS                      ;; 03:59EB $3E $18
    ld   [wMusicTrackToPlay], a                   ;; 03:59ED $EA $68 $D3
    ; Increase max health, and fully restore health
    ld   hl, wMaxHearts                           ;; 03:59F0 $21 $5B $DB
    inc  [hl]                                     ;; 03:59F3 $34
    ld   hl, wAddHealthBuffer                     ;; 03:59F4 $21 $93 $DB
    ld   [hl], $FF                                ;; 03:59F7 $36 $FF
    call GetRoomStatusAddressInHL                 ;; 03:59F9 $CD $34 $51
    ld   a, [hl]                                  ;; 03:59FC $7E
    or   ROOM_STATUS_EVENT_2                      ; @TODO Set this room's status bit
    ld   [hl], a                                  ;; 03:59FF $77
    ldh  [hRoomStatus], a                         ;; 03:5A00 $E0 $F8

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
    ldh  a, [hLinkPositionX]                      ;; 03:5A17 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 03:5A19 $21 $00 $C2
    add  hl, bc                                   ;; 03:5A1C $09
    ld   [hl], a                                  ;; 03:5A1D $77
    ldh  a, [hLinkPositionY]                      ;; 03:5A1E $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 03:5A20 $21 $10 $C2
    add  hl, bc                                   ;; 03:5A23 $09
    sub  $0C                                      ;; 03:5A24 $D6 $0C
    ld   [hl], a                                  ;; 03:5A26 $77
    ldh  a, [hLinkPositionZ]                      ;; 03:5A27 $F0 $A2
    ld   hl, wEntitiesPosZTable                   ;; 03:5A29 $21 $10 $C3
    add  hl, bc                                   ;; 03:5A2C $09
    ld   [hl], a                                  ;; 03:5A2D $77

func_003_5A2E::
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 03:5A2E $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 03:5A30 $E0 $9D
    ld   a, DIRECTION_DOWN                        ;; 03:5A32 $3E $03
    ldh  [hLinkDirection], a                      ;; 03:5A34 $E0 $9E
    ; reset sword parameter
    xor  a                                        ;; 03:5A36 $AF
    ld   [wSwordAnimationState], a                ;; 03:5A37 $EA $37 $C1
    ld   [wC16A], a                               ;; 03:5A3A $EA $6A $C1
    ld   [wSwordCharge], a                        ;; 03:5A3D $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ;; 03:5A40 $EA $21 $C1
    ld   hl, wEntitiesGroundStatusTable           ;; 03:5A43 $21 $70 $C4
    add  hl, bc                                   ;; 03:5A46 $09
    ld   [hl], a                                  ;; 03:5A47 $77
    ld   a, $02                                   ;; 03:5A48 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 03:5A4A $E0 $A1
    ret                                           ;; 03:5A4C $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HeartPieceEntitySprite::
    db $AC, OAM_GBC_PAL_2
    db $AC, OAM_GBC_PAL_2 | OAMF_XFLIP

HeartPieceEntityHandler::
    ldh  a, [hRoomStatus]                         ;; 03:5A51 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5A53 $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:5A55 $C2 $8D $3F

    ldh  a, [hActiveEntityState]                  ;; 03:5A58 $F0 $F0
    JP_TABLE                                      ;; 03:5A5A
._00 dw HeartPieceState0Handler                   ;; 03:5A5B
._01 dw HeartPieceState1Handler                   ;; 03:5A5D
._02 dw HeartPieceState2Handler                   ;; 03:5A5F
._03 dw HeartPieceState3Handler                   ;; 03:5A61
._04 dw HeartPieceState4Handler                   ;; 03:5A63
._05 dw HeartPieceState5Handler                   ;; 03:5A65
._06 dw HeartPieceState6Handler                   ;; 03:5A67
._07 dw HeartPieceState7Handler                   ;; 03:5A69
._08 dw HeartPieceState8Handler                   ;; 03:5A6B

HeartPieceState1Handler::
    call HoldEntityAboveLink                      ;; 03:5A6D $CD $17 $5A
    call GetEntityTransitionCountdown             ;; 03:5A70 $CD $05 $0C
    ret  nz                                       ;; 03:5A73 $C0

    ld   a, $01                                   ;; 03:5A74 $3E $01
    ld   [wC167], a                               ;; 03:5A76 $EA $67 $C1
    jp   IncrementEntityState                     ;; 03:5A79 $C3 $12 $3B

HeartPieceState2Handler::
    ld   a, TILESET_LOAD_PIECE_OF_HEART_1         ;; 03:5A7C $3E $03
    ldh  [hNeedsUpdatingBGTiles], a               ;; 03:5A7E $E0 $90
    jp   IncrementEntityState                     ;; 03:5A80 $C3 $12 $3B

HeartPieceState3Handler::
    ld   a, TILESET_LOAD_PIECE_OF_HEART_2         ;; 03:5A83 $3E $04
    ldh  [hNeedsUpdatingBGTiles], a               ;; 03:5A85 $E0 $90
    jp   IncrementEntityState                     ;; 03:5A87 $C3 $12 $3B

HeartPieceState4Handler::
    call_open_dialog Dialog04F                    ;; 03:5A8A $3E $4F
    call IncrementEntityState                     ;; 03:5A8F $CD $12 $3B
    ld   a, $01                                   ;; 03:5A92 $3E $01
    ld   [wC1AB], a                               ;; 03:5A94 $EA $AB $C1
    ret                                           ;; 03:5A97 $C9

HeartPieceState5Handler::
    call HoldEntityAboveLink                      ;; 03:5A98 $CD $17 $5A
    ld   de, HeartPieceEntitySprite               ;; 03:5A9B $11 $4D $5A
    call RenderActiveEntitySpritesPair            ;; 03:5A9E $CD $C0 $3B
    call DrawHeartPiecesInDialog                  ;; 03:5AA1 $CD $2B $5B
    ld   hl, wEntitiesInertiaTable                ;; 03:5AA4 $21 $D0 $C3
    add  hl, bc                                   ;; 03:5AA7 $09
    inc  [hl]                                     ;; 03:5AA8 $34
    ld   a, [hl]                                  ;; 03:5AA9 $7E
    cp   $A8                                      ;; 03:5AAA $FE $A8
    jp   z, IncrementEntityState                  ;; 03:5AAC $CA $12 $3B

    cp   $38                                      ;; 03:5AAF $FE $38
    jr   nz, .ret_5ABA                            ;; 03:5AB1 $20 $07

    ld   a, [wHeartPiecesCount]                   ;; 03:5AB3 $FA $5C $DB
    inc  a                                        ;; 03:5AB6 $3C
    ld   [wHeartPiecesCount], a                   ;; 03:5AB7 $EA $5C $DB

.ret_5ABA
    ret                                           ;; 03:5ABA $C9

HeartPieceState6Handler::
    call HoldEntityAboveLink                      ;; 03:5ABB $CD $17 $5A
    ld   de, HeartPieceEntitySprite               ;; 03:5ABE $11 $4D $5A
    call RenderActiveEntitySpritesPair            ;; 03:5AC1 $CD $C0 $3B
    xor  a                                        ;; 03:5AC4 $AF
    ld   [wC1AB], a                               ;; 03:5AC5 $EA $AB $C1
    call DrawHeartPiecesInDialog                  ;; 03:5AC8 $CD $2B $5B
    ld   a, [wDialogState]                        ;; 03:5ACB $FA $9F $C1
    and  a                                        ;; 03:5ACE $A7
    ret  nz                                       ;; 03:5ACF $C0

    ; If found 4 heart pieces…
    ld   a, [wHeartPiecesCount]                   ;; 03:5AD0 $FA $5C $DB
    cp   $04                                      ;; 03:5AD3 $FE $04
    jr   nz, .jr_5AED                             ;; 03:5AD5 $20 $16
    ; Play a success jingle
    ld   a, JINGLE_NEW_HEART                      ;; 03:5AD7 $3E $19
    ldh  [hJingle], a                             ;; 03:5AD9 $E0 $F2
    ; Clear heart pieces count
    xor  a                                        ;; 03:5ADB $AF
    ld   [wHeartPiecesCount], a                   ;; 03:5ADC $EA $5C $DB
    ; Configure the heart increase animation
    ld   hl, wAddHealthBuffer                     ;; 03:5ADF $21 $93 $DB
    ld   [hl], $40                                ;; 03:5AE2 $36 $40
    ; Increase the maximum number of hearts
    ld   hl, wMaxHearts                           ;; 03:5AE4 $21 $5B $DB
    inc  [hl]                                     ;; 03:5AE7 $34
    ; Open the "4 pieces of heart collected" dialog
    call_open_dialog Dialog050                    ;; 03:5AE8

.jr_5AED
    jp   IncrementEntityState                     ;; 03:5AED $C3 $12 $3B

HeartPieceState7Handler::
    call HoldEntityAboveLink                      ;; 03:5AF0 $CD $17 $5A
    ld   de, HeartPieceEntitySprite               ;; 03:5AF3 $11 $4D $5A
    call RenderActiveEntitySpritesPair            ;; 03:5AF6 $CD $C0 $3B
    ld   a, [wDialogState]                        ;; 03:5AF9 $FA $9F $C1
    and  a                                        ;; 03:5AFC $A7
    ret  nz                                       ;; 03:5AFD $C0

    ld   a, TILESET_CLEAR_PIECE_OF_HEART_1        ;; 03:5AFE $3E $05
    ldh  [hNeedsUpdatingBGTiles], a               ;; 03:5B00 $E0 $90
    jp   IncrementEntityState                     ;; 03:5B02 $C3 $12 $3B

HeartPieceState8Handler::
    ld   a, TILESET_CLEAR_PIECE_OF_HEART_2        ;; 03:5B05 $3E $06
    ldh  [hNeedsUpdatingBGTiles], a               ;; 03:5B07 $E0 $90
    call UnloadEntity                             ;; 03:5B09 $CD $8D $3F
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 03:5B0C $3E $0D
    ldh  [hReplaceTiles], a                       ;; 03:5B0E $E0 $A5
    xor  a                                        ;; 03:5B10 $AF
    ld   [wC167], a                               ;; 03:5B11 $EA $67 $C1
    jp   MarkRoomCompleted                        ;; 03:5B14 $C3 $2A $51

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HeartPieceSpriteVariants::
.variant0
    db $9A, OAM_GBC_PAL_2
    db $9A, OAM_GBC_PAL_2 | OAMF_XFLIP
.variant1
    db $9C, OAM_GBC_PAL_2
    db $9A, OAM_GBC_PAL_2 | OAMF_XFLIP
.variant2
    db $9E, OAM_GBC_PAL_2
    db $9A, OAM_GBC_PAL_2 | OAMF_XFLIP
.variant3
    db $9E, OAM_GBC_PAL_2
    db $9C, OAM_GBC_PAL_2 | OAMF_XFLIP
.variant4
    db $9E, OAM_GBC_PAL_2
    db $9E, OAM_GBC_PAL_2 | OAMF_XFLIP

DrawHeartPiecesInDialog::
    ld   a, [wDialogState]                        ;; 03:5B2B $FA $9F $C1
    and  a                                        ;; 03:5B2E $A7
    ret  z                                        ;; 03:5B2F $C8

    ld   a, [wDialogCharacterIndex]               ;; 03:5B30 $FA $70 $C1
    cp   $21                                      ;; 03:5B33 $FE $21
    ret  nc                                       ;; 03:5B35 $D0

    ld   a, [wDialogState]                        ;; 03:5B36 $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 03:5B39 $E6 $80
    ld   a, $23                                   ;; 03:5B3B $3E $23
    jr   z, .positionSprite                       ;; 03:5B3D $28 $02

    ld   a, $6B                                   ;; 03:5B3F $3E $6B

.positionSprite
    ldh  [hActiveEntityVisualPosY], a             ;; 03:5B41 $E0 $EC
    ld   a, [wHeartPiecesCount]                   ;; 03:5B43 $FA $5C $DB
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:5B46 $E0 $F1
    ld   a, $8E                                   ;; 03:5B48 $3E $8E
    ldh  [hActiveEntityPosX], a                   ;; 03:5B4A $E0 $EE
    ld   de, HeartPieceSpriteVariants             ;; 03:5B4C $11 $17 $5B
    jp   RenderActiveEntitySpritesPair            ;; 03:5B4F $C3 $C0 $3B

HeartPieceState0Handler::
    ld   de, HeartPieceEntitySprite               ;; 03:5B52 $11 $4D $5A
    call RenderActiveEntitySpritesPair            ;; 03:5B55 $CD $C0 $3B
    jp   PickableHandler                          ;; 03:5B58 $C3 $AA $60

Data_003_5B5B::
    db   $AE, $14

GuardianAcornEntityHandler::
    ld   de, Data_003_5B5B                        ;; 03:5B5D $11 $5B $5B
    call RenderActiveEntitySprite                 ;; 03:5B60 $CD $77 $3C
    jr   jr_003_5B7D                              ;; 03:5B63 $18 $18

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
PieceOfPowerSpriteVariants::
.variant0
    db $14, OAM_GBC_PAL_2 | OAMF_PAL0
    db $14, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $14, OAM_GBC_PAL_4 | OAMF_PAL1
    db $14, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP

PieceOfPowerEntityHandler::
    ld   de, PieceOfPowerSpriteVariants           ;; 03:5B6D $11 $65 $5B
    call RenderActiveEntitySpritesPair            ;; 03:5B70 $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ;; 03:5B73 $F0 $E7
    rra                                           ;; 03:5B75 $1F
    rra                                           ;; 03:5B76 $1F
    rra                                           ;; 03:5B77 $1F
    and  $01                                      ;; 03:5B78 $E6 $01
    call SetEntitySpriteVariant                   ;; 03:5B7A $CD $0C $3B

jr_003_5B7D:
    jp   PickableHandler                          ;; 03:5B7D $C3 $AA $60

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
IronMasksMaskSpriteVariants::
.variant0
    db $74, $00
    db $76, $00
.variant1
    db $76, $20
    db $74, $20

IronMasksMaskEntityHandler::
    ld   de, IronMasksMaskSpriteVariants          ;; 03:5B88 $11 $80 $5B
    call RenderActiveEntitySpritesPair            ;; 03:5B8B $CD $C0 $3B
    call ReturnIfNonInteractive_03                ;; 03:5B8E $CD $78 $7F
    call PickableHandleGrabbedByItemIfNeeded      ;; 03:5B91 $CD $AF $62
    ret                                           ;; 03:5B94 $C9

Data_003_5B95::
    db   $86, $17

Data_003_5B97::
    db   $84, $17

; Sword on beach, or Shield dropped from Like-Like
SwordShieldPickableEntityHandler::
    ld   de, Data_003_5B95                        ;; 03:5B99 $11 $95 $5B
    ld   a, [wSwordLevel]                         ;; 03:5B9C $FA $4E $DB
    and  a                                        ;; 03:5B9F $A7
    jr   nz, .jr_5BAC                             ;; 03:5BA0 $20 $0A

    ldh  a, [hRoomStatus]                         ;; 03:5BA2 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5BA4 $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:5BA6 $C2 $8D $3F

    ld   de, Data_003_5B97                        ;; 03:5BA9 $11 $97 $5B

.jr_5BAC
    call RenderActiveEntitySprite                 ;; 03:5BAC $CD $77 $3C
    ldh  a, [hActiveEntityState]                  ;; 03:5BAF $F0 $F0
    JP_TABLE                                      ;; 03:5BB1
._00 dw SwordShieldPickableState0Handler                        ;; 03:5BB2
._01 dw SwordShieldPickableState1Handler                        ;; 03:5BB4
._02 dw SwordShieldPickableState2Handler                        ;; 03:5BB6
._03 dw SwordShieldPickableState3Handler                        ;; 03:5BB8

SwordShieldPickableState0Handler::
    call GetEntityTransitionCountdown             ;; 03:5BBA $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:5BBD $CA $AA $60

    cp   $10                                      ;; 03:5BC0 $FE $10
    jr   nz, .playSwordFanfare                    ;; 03:5BC2 $20 $07

    ; decrement countdown
    dec  [hl]                                     ;; 03:5BC4 $35

    ; "You found your Sword!"
    call_open_dialog Dialog09B                    ;; 03:5BC5
    xor  a                                        ;; 03:5BCA $AF

.playSwordFanfare
    ; Plays a heroic fanfare, when you first retrieve your sword from the beach
    dec  a                                        ;; 03:5BCB $3D
    jr   nz, .holdItemAboveLink                   ;; 03:5BCC $20 $13

    ld   a, MUSIC_OVERWORLD_INTRO                 ;; 03:5BCE $3E $31
    ld   [wMusicTrackToPlay], a                   ;; 03:5BD0 $EA $68 $D3
    ld   a, MUSIC_OVERWORLD                       ;; 03:5BD3 $3E $05
    ldh  [hDefaultMusicTrack], a                  ;; 03:5BD5 $E0 $B0
    ldh  [hNextDefaultMusicTrack], a              ;; 03:5BD7 $E0 $BF
    call GetEntitySlowTransitionCountdown         ;; 03:5BD9 $CD $FB $0B
    ld   [hl], $52                                ;; 03:5BDC $36 $52
    call IncrementEntityState                     ;; 03:5BDE $CD $12 $3B

.holdItemAboveLink
    jp   HoldEntityAboveLink                      ;; 03:5BE1 $C3 $17 $5A

SwordShieldPickableState1Handler::
    call HoldEntityAboveLink                      ;; 03:5BE4 $CD $17 $5A
    call GetEntitySlowTransitionCountdown         ;; 03:5BE7 $CD $FB $0B
    ret  nz                                       ;; 03:5BEA $C0

    ; Make Link perform a spin-attack
    ld   a, $FF                                   ;; 03:5BEB $3E $FF
    call SetEntitySpriteVariant                   ;; 03:5BED $CD $0C $3B
    call GetEntityTransitionCountdown             ;; 03:5BF0 $CD $05 $0C
    ld   [hl], $20                                ;; 03:5BF3 $36 $20
    ld   a, USING_SPIN_ATTACK_MAX                 ;; 03:5BF5 $3E $20
    ld   [wIsUsingSpinAttack], a                  ;; 03:5BF7 $EA $21 $C1
    ld   a, NOISE_SFX_SPIN_ATTACK                 ;; 03:5BFA $3E $03
    ldh  [hNoiseSfx], a                           ;; 03:5BFC $E0 $F4
    jp   IncrementEntityState                     ;; 03:5BFE $C3 $12 $3B

SwordShieldPickableState2Handler::
    call GetEntityTransitionCountdown             ;; 03:5C01 $CD $05 $0C
    ret  nz                                       ;; 03:5C04 $C0

    ; Prepare Link to raise the sword for 32 more frames
    ld   [hl], 32                                 ;; 03:5C05 $36 $20
    ld   a, $00                                   ;; 03:5C07 $3E $00
    call SetEntitySpriteVariant                   ;; 03:5C09 $CD $0C $3B
    jp   IncrementEntityState                     ;; 03:5C0C $C3 $12 $3B

SwordShieldPickableState3Handler::
    call HoldEntityAboveLink                      ;; 03:5C0F $CD $17 $5A
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6B       ;; 03:5C12 $3E $6B
    ldh  [hLinkAnimationState], a                 ;; 03:5C14 $E0 $9D
    ld   hl, wEntitiesPosXTable                   ;; 03:5C16 $21 $00 $C2
    add  hl, bc                                   ;; 03:5C19 $09
    ldh  a, [hLinkPositionX]                      ;; 03:5C1A $F0 $98
    sub  $04                                      ;; 03:5C1C $D6 $04
    ld   [hl], a                                  ;; 03:5C1E $77
    call GetEntityTransitionCountdown             ;; 03:5C1F $CD $05 $0C
    jr   nz, .continueToRaiseSword                ;; 03:5C22 $20 $13

    ; Animation is done: add the L-1 sword to the inventory
    ld   [wC167], a                               ;; 03:5C24 $EA $67 $C1
    ld   d, INVENTORY_SWORD                       ;; 03:5C27 $16 $01
    call GiveInventoryItem                        ;; 03:5C29 $CD $72 $64
    ld   a, $01                                   ;; 03:5C2C $3E $01
    ld   [wSwordLevel], a                         ;; 03:5C2E $EA $4E $DB
    call MarkRoomCompleted                        ;; 03:5C31 $CD $2A $51
    jp   UnloadEntityAndReturn                    ;; 03:5C34 $C3 $8D $3F

.continueToRaiseSword
    ; When the countdown reaches 26…
    cp   26                                       ;; 03:5C37 $FE $1A
    jr   nz, .return                              ;; 03:5C39 $20 $0B
    ; …activate the sword poke VFX and SFX
    ldh  a, [hActiveEntityPosY]                   ;; 03:5C3B $F0 $EF
    sub  $0C                                      ;; 03:5C3D $D6 $0C
    call CheckLinkCollisionWithProjectile.showSwordPokeVfx ;; 03:5C3F $CD $36 $6C
    ld   a, JINGLE_SWORD_POKING                   ;; 03:5C42 $3E $07
    ldh  [hJingle], a                             ;; 03:5C44 $E0 $F2

.return
    ret                                           ;; 03:5C46 $C9

HookshotSpriteData::
    db   $8A, $14

label_003_5C49:
    ldh  a, [hRoomStatus]                         ;; 03:5C49 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5C4B $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:5C4D $C2 $8D $3F

    ld   de, HookshotSpriteData                   ;; 03:5C50 $11 $47 $5C
    call RenderActiveEntitySprite                 ;; 03:5C53 $CD $77 $3C
    call GetEntityTransitionCountdown             ;; 03:5C56 $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:5C59 $CA $AA $60

    cp   $10                                      ;; 03:5C5C $FE $10
    jr   nz, .skipUpdateSpeedY                    ;; 03:5C5E $20 $07

    dec  [hl]                                     ;; 03:5C60 $35
    call_open_dialog Dialog093                    ;; 03:5C61
    xor  a                                        ;; 03:5C66 $AF

.skipUpdateSpeedY
    dec  a                                        ;; 03:5C67 $3D
IF __OPTIMIZATIONS_3__
    jp   nz, HoldEntityAboveLink
ELSE
    jr   nz, .decSpeedX                           ;; 03:5C68 $20 $0B
ENDC

    ld   d, INVENTORY_HOOKSHOT                    ;; 03:5C6A $16 $06
    call GiveInventoryItem                        ;; 03:5C6C $CD $72 $64
    call MarkRoomCompleted                        ;; 03:5C6F $CD $2A $51
    jp   UnloadEntityAndReturn                    ;; 03:5C72 $C3 $8D $3F

IF !__OPTIMIZATIONS_3__
.decSpeedX
    jp   HoldEntityAboveLink                      ;; 03:5C75 $C3 $17 $5A
ENDC

KeyDropSpriteTable:
    db   $CA, $17
    db   $C0, $17
    db   $C2, $14
    db   $C4, $17
    db   $C6, $14
    db   $CA, $17

KeyCollectDialogs::
._0 db_dialog_low Dialog000 ; unused
._1 db_dialog_low Dialog0A3 ; Angler Key
._2 db_dialog_low Dialog0A4 ; Face Key
._3 db_dialog_low Dialog0A5 ; Bird Key
._4 db_dialog_low Dialog000 ; unused

KeyDropPointEntityHandler::
    call CheckForEntityFallingDownQuicksandHole   ;; 03:5C89 $CD $EA $5C
    jr   nc, .jr_5C99                             ;; 03:5C8C $30 $0B

    ; If dropped in the quicksand mark the angler key
    ; as available in the quicksand cave by setting the room flags.
    ld   hl, wOverworldRoomStatus + ROOM_OW_YARNA_LANMOLA ;; 03:5C8E $21 $CE $D8
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ;; 03:5C91 $CB $E6
    ld   hl, wIndoorARoomStatus + ROOM_INDOOR_A_QUICKSAND_CAVE ;; 03:5C93 $21 $F8 $D9
    set  5, [hl]                                  ;; 03:5C96 $CB $EE
    ret                                           ;; 03:5C98 $C9

.jr_5C99
    ldh  a, [hMapRoom]                            ;; 03:5C99 $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_4    ;; 03:5C9B $FE $80
    jp   z, label_003_5C49                        ;; 03:5C9D $CA $49 $5C

    ld   de, KeyDropSpriteTable                   ;; 03:5CA0 $11 $78 $5C
    call RenderActiveEntitySprite                 ;; 03:5CA3 $CD $77 $3C
    call GetEntityTransitionCountdown             ;; 03:5CA6 $CD $05 $0C
    jp   z, label_003_5CD6                        ;; 03:5CA9 $CA $D6 $5C

    cp   $10                                      ;; 03:5CAC $FE $10
    jr   nz, .jr_5CCD                             ;; 03:5CAE $20 $1D

    dec  [hl]                                     ;; 03:5CB0 $35
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:5CB1 $F0 $F1
    dec  a                                        ;; 03:5CB3 $3D
    ld   e, a                                     ;; 03:5CB4 $5F
    ld   d, b                                     ;; 03:5CB5 $50
    ld   hl, KeyCollectDialogs                    ;; 03:5CB6 $21 $84 $5C
    add  hl, de                                   ;; 03:5CB9 $19
    ld   a, [hl]                                  ;; 03:5CBA $7E
    call OpenDialogInTable0                       ;; 03:5CBB $CD $85 $23
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:5CBE $F0 $F1
    dec  a                                        ;; 03:5CC0 $3D
    ld   e, a                                     ;; 03:5CC1 $5F
    ld   d, b                                     ;; 03:5CC2 $50
    ld   hl, wHasTailKey                          ;; 03:5CC3 $21 $11 $DB
    add  hl, de                                   ;; 03:5CC6 $19
    ld   [hl], $01                                ;; 03:5CC7 $36 $01
    call MarkRoomCompleted                        ;; 03:5CC9 $CD $2A $51
    xor  a                                        ;; 03:5CCC $AF

.jr_5CCD
    dec  a                                        ;; 03:5CCD $3D
IF __OPTIMIZATIONS_3__
    jp   nz, HoldEntityAboveLink
    jp   UnloadEntityAndReturn
ELSE
    jr   nz, .jr_5CD3                             ;; 03:5CCE $20 $03

    jp   UnloadEntityAndReturn                    ;; 03:5CD0 $C3 $8D $3F

.jr_5CD3
    jp   HoldEntityAboveLink                      ;; 03:5CD3 $C3 $17 $5A
ENDC

label_003_5CD6:
    call ReturnIfNonInteractive_03                ;; 03:5CD6 $CD $78 $7F
    call PickableHandleGrabbedByItemIfNeeded      ;; 03:5CD9 $CD $AF $62
    ld   hl, wEntitiesPosZTable                   ;; 03:5CDC $21 $10 $C3
    add  hl, bc                                   ;; 03:5CDF $09
    ld   a, [hl]                                  ;; 03:5CE0 $7E
    and  a                                        ;; 03:5CE1 $A7
    jr   nz, .jr_5CE7                             ;; 03:5CE2 $20 $03

    call PickableCollectIfNeeded                  ;; 03:5CE4 $CD $EB $62

.jr_5CE7
    jp   BouncingEntityPhysics                    ;; 03:5CE7 $C3 $B3 $60

CheckForEntityFallingDownQuicksandHole::
    ; This is called from the bomb code as well.
    ; Checks if the entity is at the center of the quicksand room and makes it drop.
    ld   a, [wIsIndoor]                           ;; 03:5CEA $FA $A5 $DB
    and  a                                        ;; 03:5CED $A7
    jr   nz, .jr_5D34                             ;; 03:5CEE $20 $44

    ldh  a, [hMapRoom]                            ;; 03:5CF0 $F0 $F6
    cp   ROOM_OW_YARNA_LANMOLA                    ;; 03:5CF2 $FE $CE
    jr   nz, .jr_5D34                             ;; 03:5CF4 $20 $3E

    ldh  a, [hActiveEntityPosY]                   ;; 03:5CF6 $F0 $EF
    sub  $48                                      ;; 03:5CF8 $D6 $48
    add  $03                                      ;; 03:5CFA $C6 $03
    cp   $06                                      ;; 03:5CFC $FE $06
    jr   nc, .jr_5D34                             ;; 03:5CFE $30 $34

    ldh  a, [hActiveEntityPosX]                   ;; 03:5D00 $F0 $EE
    sub  $50                                      ;; 03:5D02 $D6 $50
    add  $03                                      ;; 03:5D04 $C6 $03
    cp   $06                                      ;; 03:5D06 $FE $06
    jr   nc, .jr_5D34                             ;; 03:5D08 $30 $2A

    ld   hl, wEntitiesPosZTable                   ;; 03:5D0A $21 $10 $C3
    add  hl, bc                                   ;; 03:5D0D $09
    ld   a, [hl]                                  ;; 03:5D0E $7E
    and  a                                        ;; 03:5D0F $A7
    jr   nz, .jr_5D34                             ;; 03:5D10 $20 $22

    ld   hl, wEntitiesStatusTable                 ;; 03:5D12 $21 $80 $C2
    add  hl, bc                                   ;; 03:5D15 $09
    ld   a, [hl]                                  ;; 03:5D16 $7E
    cp   $05                                      ;; 03:5D17 $FE $05
    jr   nz, .jr_5D34                             ;; 03:5D19 $20 $19

    ld   [hl], $02                                ;; 03:5D1B $36 $02
    ld   hl, wEntitiesFallingTargetXTable         ;; 03:5D1D $21 $B0 $C4
    add  hl, bc                                   ;; 03:5D20 $09
    ld   [hl], $50                                ;; 03:5D21 $36 $50
    ld   hl, wEntitiesFallingTargetYTable         ;; 03:5D23 $21 $C0 $C4
    add  hl, bc                                   ;; 03:5D26 $09
    ld   [hl], $48                                ;; 03:5D27 $36 $48
    call GetEntityTransitionCountdown             ;; 03:5D29 $CD $05 $0C
    ld   [hl], $2F                                ;; 03:5D2C $36 $2F
    ld   a, JINGLE_ITEM_FALLING                   ;; 03:5D2E $3E $18
    ldh  [hJingle], a                             ;; 03:5D30 $E0 $F2
    scf                                           ;; 03:5D32 $37
    ret                                           ;; 03:5D33 $C9

.jr_5D34
    and  a                                        ;; 03:5D34 $A7
    ret                                           ;; 03:5D35 $C9

DroppableHeartSprite::
    db $A8, OAM_GBC_PAL_4 | OAMF_PAL1

DroppableHeartEntityHandler::
    call DroppableRevealOrReturnIfNeeded          ;; 03:5D38 $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:5D3B $CD $8C $60
    ld   de, DroppableHeartSprite                 ;; 03:5D3E $11 $36 $5D
    call RenderActiveEntitySprite                 ;; 03:5D41 $CD $77 $3C
    jp   PickableHandler                          ;; 03:5D44 $C3 $AA $60

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SleepyToadstoolSprite::
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

SleepyToadstoolEntityHandler::
    ld   hl, wHasToadstool                        ;; 03:5D4B $21 $4B $DB
    ld   a, [wMagicPowderCount]                   ;; 03:5D4E $FA $4C $DB
    or   [hl]                                     ;; 03:5D51 $B6
    jp   nz, UnloadEntityAndReturn                ;; 03:5D52 $C2 $8D $3F

    ld   de, SleepyToadstoolSprite                ;; 03:5D55 $11 $47 $5D
    call RenderActiveEntitySpritesPair            ;; 03:5D58 $CD $C0 $3B
    call GetEntityTransitionCountdown             ;; 03:5D5B $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:5D5E $CA $AA $60

    cp   $10                                      ;; 03:5D61 $FE $10
    jr   nz, .jr_5D6C                             ;; 03:5D63 $20 $07

    dec  [hl]                                     ;; 03:5D65 $35
    call_open_dialog Dialog00F                    ;; 03:5D66
    xor  a                                        ;; 03:5D6B $AF

.jr_5D6C
    dec  a                                        ;; 03:5D6C $3D
IF __OPTIMIZATIONS_3__
    jp   nz, HoldEntityAboveLink
ELSE
    jr   nz, .jr_5D80                             ;; 03:5D6D $20 $11
ENDC

    ld   a, REPLACE_TILES_TOADSTOOL               ;; 03:5D6F $3E $0A
    ldh  [hReplaceTiles], a                       ;; 03:5D71 $E0 $A5
    ld   d, INVENTORY_MAGIC_POWDER                ;; 03:5D73 $16 $0C
    call GiveInventoryItem                        ;; 03:5D75 $CD $72 $64
    ld   a, TRUE                                  ;; 03:5D78 $3E $01
    ld   [wHasToadstool], a                       ;; 03:5D7A $EA $4B $DB
    jp   UnloadEntityAndReturn                    ;; 03:5D7D $C3 $8D $3F

IF !__OPTIMIZATIONS_3__
.jr_5D80
    jp   HoldEntityAboveLink                      ;; 03:5D80 $C3 $17 $5A
ENDC

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SirensInstrument2SpriteVariants::
.variant0
    db $70, $01
    db $72, $01
.variant1
    db $74, $01
    db $76, $01
.variant2
    db $78, $01
    db $7A, $01
.variant3
    db $7C, $01
    db $7E, $01

SirensInstrumentEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5D93 $21 $B0 $C2
    add  hl, bc                                   ;; 03:5D96 $09
    ld   a, [hl]                                  ;; 03:5D97 $7E
    JP_TABLE                                      ;; 03:5D98
._00 dw SirensInstrumentState0Handler             ;; 03:5D99
._01 dw SirensInstrumentState1Handler             ;; 03:5D9B
._02 dw SirensInstrumentState2Handler             ;; 03:5D9D

Data_003_5D9F::
    db   $E4, $E4, $E4, $E4, $90, $90, $90, $90, $40, $40, $40, $40, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_003_5DBC::
    db   $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
    db   $08, $08, $08, $08, $04, $04, $04, $04, $00, $00, $00, $00, $00

SirensInstrumentState2Handler::
    call func_006_783C_trampoline                 ;; 03:5DD9 $CD $76 $3E
    ld   a, $01                                   ;; 03:5DDC $3E $01
    ld   [wC167], a                               ;; 03:5DDE $EA $67 $C1
    call GetEntitySlowTransitionCountdown         ;; 03:5DE1 $CD $FB $0B
    jr   nz, animateSirensInstrumentPickup        ;; 03:5DE4 $20 $43

    call UnloadEntity                             ;; 03:5DE6 $CD $8D $3F
    xor  a                                        ;; 03:5DE9 $AF
    ldh  [hLinkAnimationState], a                 ;; 03:5DEA $E0 $9D
    ld   a, [wD201]                               ;; 03:5DEC $FA $01 $D2
    ld   e, a                                     ;; 03:5DEF $5F
    ld   d, b                                     ;; 03:5DF0 $50
    ld   hl, wEntitiesStateTable                  ;; 03:5DF1 $21 $90 $C2
    add  hl, de                                   ;; 03:5DF4 $19
    inc  [hl]                                     ;; 03:5DF5 $34
    call disableMovementInTransition              ;; 03:5DF6 $CD $9E $0C

    ; Execute some code specific to each dungeon
    ldh  a, [hMapId]                              ;; 03:5DF9 $F0 $F7
    JP_TABLE                                      ;; 03:5DFB
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
    ld   a, BOW_WOW_KIDNAPPED                     ;; 03:5E0C $3E $80
    ld   [wIsBowWowFollowingLink], a              ;; 03:5E0E $EA $56 $DB
    ret                                           ;; 03:5E11 $C9

AfterSirensInstrumentD2::
    ld   a, $02                                   ;; 03:5E12 $3E $02
    ld   [wTarinFlag], a                          ;; 03:5E14 $EA $48 $DB
IF !__OPTIMIZATIONS_1__
    ret                                           ;; 03:5E17 $C9
ENDC

AfterSirensInstrumentD3::
    ret                                           ;; 03:5E18 $C9

AfterSirensInstrumentD4::
    ; Mark Ghost as following Link
    ld   a, $02                                   ;; 03:5E19 $3E $02
    ld   [wIsGhostFollowingLink], a               ;; 03:5E1B $EA $79 $DB

AfterSirensInstrumentNone::
    ret                                           ;; 03:5E1E $C9

AfterSirensInstrumentD6::
    ; Mark Marin as disappeared
    xor  a                                        ;; 03:5E1F $AF
    ld   [wIsMarinInAnimalVillage], a             ;; 03:5E20 $EA $74 $DB
    ret                                           ;; 03:5E23 $C9

AfterSirensInstrumentD7::
    ; Make the rooster not following Link anymore
    xor  a                                        ;; 03:5E24 $AF
    ld   [wIsRoosterFollowingLink], a             ;; 03:5E25 $EA $7B $DB
    ret                                           ;; 03:5E28 $C9

animateSirensInstrumentPickup:
    cp   $50                                      ;; 03:5E29 $FE $50
    jr   nc, ret_003_5E8A                         ;; 03:5E2B $30 $5D

    ld   hl, wEntitiesPrivateState2Table          ;; 03:5E2D $21 $C0 $C2
    add  hl, bc                                   ;; 03:5E30 $09
    ld   a, [hl]                                  ;; 03:5E31 $7E
    cp   $19                                      ;; 03:5E32 $FE $19
    jr   nc, ret_003_5E8A                         ;; 03:5E34 $30 $54

    ldh  a, [hFrameCounter]                       ;; 03:5E36 $F0 $E7
    and  $07                                      ;; 03:5E38 $E6 $07
    jr   nz, jr_003_5E5B                          ;; 03:5E3A $20 $1F

    ld   a, [hl]                                  ;; 03:5E3C $7E
    and  a                                        ;; 03:5E3D $A7
    jr   nz, .jr_5E45                             ;; 03:5E3E $20 $05

    ld   a, NOISE_SFX_INSTRUMENT_WARP             ;; 03:5E40 $3E $2C
    ldh  [hNoiseSfx], a                           ;; 03:5E42 $E0 $F4
    xor  a                                        ;; 03:5E44 $AF

.jr_5E45
    inc  [hl]                                     ;; 03:5E45 $34
    cp   $18                                      ;; 03:5E46 $FE $18
    jr   nz, jr_003_5E5B                          ;; 03:5E48 $20 $11

    ld   a, ENTITY_GOOMBA                         ;; 03:5E4A $3E $9F
    call SpawnNewEntity                           ;; 03:5E4C $CD $CA $64
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5E4F $21 $B0 $C2
    add  hl, de                                   ;; 03:5E52 $19
    ld   [hl], $01                                ;; 03:5E53 $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:5E55 $21 $E0 $C2
    add  hl, de                                   ;; 03:5E58 $19
    ld   [hl], $60                                ;; 03:5E59 $36 $60

jr_003_5E5B:
    ldh  a, [hFrameCounter]                       ;; 03:5E5B $F0 $E7
    and  $03                                      ;; 03:5E5D $E6 $03
    ld   hl, wEntitiesPrivateState2Table          ;; 03:5E5F $21 $C0 $C2
    add  hl, bc                                   ;; 03:5E62 $09
    add  [hl]                                     ;; 03:5E63 $86
    ld   e, a                                     ;; 03:5E64 $5F
    ld   d, b                                     ;; 03:5E65 $50
    ldh  a, [hIsGBC]                              ;; 03:5E66 $F0 $FE
    and  a                                        ;; 03:5E68 $A7
    jr   z, .jr_5E76                              ;; 03:5E69 $28 $0B

    push bc                                       ;; 03:5E6B $C5
    push de                                       ;; 03:5E6C $D5
    ld   a, $03                                   ;; 03:5E6D $3E $03
    call func_020_6D0E_trampoline                 ;; 03:5E6F $CD $78 $09
    pop  de                                       ;; 03:5E72 $D1
    pop  bc                                       ;; 03:5E73 $C1
    jr   ret_003_5E8A                             ;; 03:5E74 $18 $14

.jr_5E76
    ld   hl, Data_003_5D9F                        ;; 03:5E76 $21 $9F $5D
    add  hl, de                                   ;; 03:5E79 $19
    ld   a, [hl]                                  ;; 03:5E7A $7E
    ld   [wBGPalette], a                          ;; 03:5E7B $EA $97 $DB
    ld   hl, Data_003_5DBC                        ;; 03:5E7E $21 $BC $5D
    add  hl, de                                   ;; 03:5E81 $19
    ld   a, [hl]                                  ;; 03:5E82 $7E
    ld   [wOBJ0Palette], a                        ;; 03:5E83 $EA $98 $DB
    xor  a                                        ;; 03:5E86 $AF
    ld   [wOBJ1Palette], a                        ;; 03:5E87 $EA $99 $DB

ret_003_5E8A:
    ret                                           ;; 03:5E8A $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SirensInstrument1SpriteVariants::
.variant0
    db $6C, $00
    db $FF, $FF
.variant1
    db $6C, $00
    db $6E, $00

SirensInstrumentState1Handler::
    ld   de, SirensInstrument1SpriteVariants      ;; 03:5E93 $11 $8B $5E
    call RenderActiveEntitySpritesPair            ;; 03:5E96 $CD $C0 $3B
    call UpdateEntityPosWithSpeed_03              ;; 03:5E99 $CD $25 $7F
    call GetEntityTransitionCountdown             ;; 03:5E9C $CD $05 $0C
    jp   z, UnloadEntityAndReturn                 ;; 03:5E9F $CA $8D $3F

    ret                                           ;; 03:5EA2 $C9

SirensInstrumentState0Handler::
    ldh  a, [hActiveEntityState]                  ;; 03:5EA3 $F0 $F0
    cp   $03                                      ;; 03:5EA5 $FE $03
    jr   nc, .jr_5EAE                             ;; 03:5EA7 $30 $05

    ld   a, $03                                   ;; 03:5EA9 $3E $03
    call cycleInstrumentItemColor_trampoline      ;; 03:5EAB $CD $D2 $0A

.jr_5EAE
    ld   a, c                                     ;; 03:5EAE $79
    ld   [wD201], a                               ;; 03:5EAF $EA $01 $D2
    ldh  a, [hRoomStatus]                         ;; 03:5EB2 $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5EB4 $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:5EB6 $C2 $8D $3F

    ldh  a, [hMapId]                              ;; 03:5EB9 $F0 $F7
    and  $03                                      ;; 03:5EBB $E6 $03
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:5EBD $E0 $F1
    call label_394D                               ;; 03:5EBF $CD $4D $39
    ld   de, SirensInstrument2SpriteVariants      ;; 03:5EC2 $11 $83 $5D
    call RenderActiveEntitySpritesPair            ;; 03:5EC5 $CD $C0 $3B
    ldh  a, [hActiveEntityState]                  ;; 03:5EC8 $F0 $F0
    JP_TABLE                                      ;; 03:5ECA
._00 dw func_003_5ED5                             ;; 03:5ECB
._01 dw func_003_5F0C                             ;; 03:5ECD
._02 dw func_003_5F33                             ;; 03:5ECF
._03 dw func_003_5FBC                             ;; 03:5ED1
._04 dw func_003_5FBF                             ;; 03:5ED3
IF __PATCH_3__
._05 dw func_003_5FBF
._06 dw func_003_5FBF
ENDC

func_003_5ED5::
    call GetEntityTransitionCountdown             ;; 03:5ED5 $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:5ED8 $CA $AA $60

    cp   $10                                      ;; 03:5EDB $FE $10
    jr   nz, .jr_5EFE                             ;; 03:5EDD $20 $1F

    dec  [hl]                                     ;; 03:5EDF $35
    call IncrementEntityState                     ;; 03:5EE0 $CD $12 $3B

IF __PATCH_0__
    xor  a
    ld   [wActivePowerUp], a
ENDC

    ; Open "You got XXXX instrument" dialog.
    ;
    ; Dialog id is $100 + hMapId. That yields:
    ;
    ; Dialog100
    ; Dialog101
    ; Dialog102
    ; Dialog103
    ; Dialog104
    ; Dialog105
    ; Dialog106
    ; Dialog107
    ldh  a, [hMapId]                              ;; 03:5EE3 $F0 $F7
    add  $00                                      ; $5EE5: $C6 $00 (???)
    call OpenDialogInTable1                       ;; 03:5EE7 $CD $73 $23

    ldh  a, [hMapId]                              ;; 03:5EEA $F0 $F7
    ld   e, a                                     ;; 03:5EEC $5F
    ld   d, b                                     ;; 03:5EED $50
    ld   hl, wHasInstrument1                      ;; 03:5EEE $21 $65 $DB
    add  hl, de                                   ;; 03:5EF1 $19
    ld   a, [hl]                                  ;; 03:5EF2 $7E
    or   $02                                      ; @TODO Sets instrument as acquired
    ld   [hl], a                                  ;; 03:5EF5 $77
    call GetRoomStatusAddressInHL                 ;; 03:5EF6 $CD $34 $51
    ld   a, [hl]                                  ;; 03:5EF9 $7E
    or   $10                                      ;; 03:5EFA $F6 $10
    ld   [hl], a                                  ;; 03:5EFC $77
    xor  a                                        ;; 03:5EFD $AF

.jr_5EFE
    dec  a                                        ;; 03:5EFE $3D
IF __OPTIMIZATIONS_1__
    jp   HoldEntityAboveLink
ELSE
    jr   nz, jr_003_5F01                          ;; 03:5EFF $20 $00

jr_003_5F01:
    jp   HoldEntityAboveLink                      ;; 03:5F01 $C3 $17 $5A
ENDC

InstrumentMusicTable::
    db   MUSIC_INSTRUMENT_FULL_MOON_CELLO
    db   MUSIC_INSTRUMENT_CONCH_HORN
    db   MUSIC_INSTRUMENT_SEA_LILYS_BELL
    db   MUSIC_INSTRUMENT_SURF_HARP
    db   MUSIC_INSTRUMENT_WIND_MARIMBA
    db   MUSIC_INSTRUMENT_CORAL_TRIANGLE
    db   MUSIC_INSTRUMENT_ORGAN_OF_EVENING_CALM
    db   MUSIC_INSTRUMENT_THUNDER_DRUM

func_003_5F0C::
    ld   a, [wActiveMusicIndex]                   ;; 03:5F0C $FA $69 $D3
    and  a                                        ;; 03:5F0F $A7
    jr   nz, .jr_5F2C                             ;; 03:5F10 $20 $1A

    ld   a, [wDialogState]                        ;; 03:5F12 $FA $9F $C1
    and  a                                        ;; 03:5F15 $A7
    jr   nz, .jr_5F2C                             ;; 03:5F16 $20 $14

    ldh  a, [hMapId]                              ;; 03:5F18 $F0 $F7
    ld   e, a                                     ;; 03:5F1A $5F
    ld   d, b                                     ;; 03:5F1B $50
    ld   hl, InstrumentMusicTable                 ;; 03:5F1C $21 $04 $5F
    add  hl, de                                   ;; 03:5F1F $19
    ld   a, [hl]                                  ;; 03:5F20 $7E
    ld   [wMusicTrackToPlay], a                   ;; 03:5F21 $EA $68 $D3
    call IncrementEntityState                     ;; 03:5F24 $CD $12 $3B
    call GetEntityTransitionCountdown             ;; 03:5F27 $CD $05 $0C
    ld   [hl], $FF                                ;; 03:5F2A $36 $FF

.jr_5F2C
    jp   HoldEntityAboveLink                      ;; 03:5F2C $C3 $17 $5A

Data_003_5F2F::
    db   $0A, $FA

Data_003_5F31::
    db   $04, $FC

func_003_5F33::
    call GetEntityTransitionCountdown             ;; 03:5F33 $CD $05 $0C
    jr   nz, .jr_5F5F                             ;; 03:5F36 $20 $27

    ld   a, JINGLE_INSTRUMENT_WARP                ;; 03:5F38 $3E $2B
    ldh  [hJingle], a                             ;; 03:5F3A $E0 $F2

    ld   a, ENTITY_INSTRUMENT_OF_THE_SIRENS       ;; 03:5F3C $3E $39
    call SpawnNewEntity                           ;; 03:5F3E $CD $CA $64
    ldh  a, [hMultiPurpose0]                      ;; 03:5F41 $F0 $D7
    dec  a                                        ;; 03:5F43 $3D
    ld   hl, wEntitiesPosXTable                   ;; 03:5F44 $21 $00 $C2
    add  hl, de                                   ;; 03:5F47 $19
    ld   [hl], a                                  ;; 03:5F48 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:5F49 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:5F4B $21 $10 $C2
    add  hl, de                                   ;; 03:5F4E $19
    ld   [hl], a                                  ;; 03:5F4F $77
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5F50 $21 $B0 $C2
    add  hl, de                                   ;; 03:5F53 $19
    ld   [hl], $02                                ;; 03:5F54 $36 $02
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 03:5F56 $21 $50 $C4
    add  hl, de                                   ;; 03:5F59 $19
    ld   [hl], $80                                ;; 03:5F5A $36 $80
    jp   IncrementEntityState                     ;; 03:5F5C $C3 $12 $3B

.jr_5F5F
    ld   hl, wEntitiesPrivateState3Table          ;; 03:5F5F $21 $D0 $C2
    add  hl, bc                                   ;; 03:5F62 $09
    dec  [hl]                                     ;; 03:5F63 $35
    ld   a, [hl]                                  ;; 03:5F64 $7E
    cp   $FF                                      ;; 03:5F65 $FE $FF
    jr   nz, .jr_5FB9                             ;; 03:5F67 $20 $50

    ld   [hl], $17                                ;; 03:5F69 $36 $17
    ld   hl, wEntitiesPrivateState4Table          ;; 03:5F6B $21 $40 $C4
    add  hl, bc                                   ;; 03:5F6E $09
    inc  [hl]                                     ;; 03:5F6F $34
    ld   a, [hl]                                  ;; 03:5F70 $7E
    and  $01                                      ;; 03:5F71 $E6 $01
    ldh  [hMultiPurposeG], a                      ;; 03:5F73 $E0 $E8
    ld   a, ENTITY_INSTRUMENT_OF_THE_SIRENS       ;; 03:5F75 $3E $39
    call SpawnNewEntity                           ;; 03:5F77 $CD $CA $64
    push bc                                       ;; 03:5F7A $C5
    ld   hl, wEntitiesPrivateState1Table          ;; 03:5F7B $21 $B0 $C2
    add  hl, de                                   ;; 03:5F7E $19
    inc  [hl]                                     ;; 03:5F7F $34
    ldh  a, [hMultiPurposeG]                      ;; 03:5F80 $F0 $E8
    ld   c, a                                     ;; 03:5F82 $4F
    ld   hl, Data_003_5F2F                        ;; 03:5F83 $21 $2F $5F
    add  hl, bc                                   ;; 03:5F86 $09
    ldh  a, [hMultiPurpose0]                      ;; 03:5F87 $F0 $D7
    add  [hl]                                     ;; 03:5F89 $86
    ld   hl, wEntitiesPosXTable                   ;; 03:5F8A $21 $00 $C2
    add  hl, de                                   ;; 03:5F8D $19
    ld   [hl], a                                  ;; 03:5F8E $77
    ld   hl, Data_003_5F31                        ;; 03:5F8F $21 $31 $5F
    add  hl, bc                                   ;; 03:5F92 $09
    ld   a, [hl]                                  ;; 03:5F93 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:5F94 $21 $40 $C2
    add  hl, de                                   ;; 03:5F97 $19
    ld   [hl], a                                  ;; 03:5F98 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:5F99 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:5F9B $21 $10 $C2
    add  hl, de                                   ;; 03:5F9E $19
    add  $F8                                      ;; 03:5F9F $C6 $F8
    ld   [hl], a                                  ;; 03:5FA1 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:5FA2 $21 $50 $C2
    add  hl, de                                   ;; 03:5FA5 $19
    ld   [hl], $FD                                ;; 03:5FA6 $36 $FD
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:5FA8 $21 $E0 $C2
    add  hl, de                                   ;; 03:5FAB $19
    ld   [hl], $38                                ;; 03:5FAC $36 $38
    call GetRandomByte                            ;; 03:5FAE $CD $0D $28
    and  $01                                      ;; 03:5FB1 $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:5FB3 $21 $B0 $C3
    add  hl, de                                   ;; 03:5FB6 $19
    ld   [hl], a                                  ;; 03:5FB7 $77
    pop  bc                                       ;; 03:5FB8 $C1

.jr_5FB9
IF !__PATCH_0__
    jp   HoldEntityAboveLink                      ;; 03:5FB9 $C3 $17 $5A
ENDC

func_003_5FBC::
IF __PATCH_0__
    ld   a, [wObjPal1 + 1*2]
    inc  a
    jp   nz, HoldEntityAboveLink
    ld   a, $80
    ldh  [hLinkPositionZ], a
    ld   a, $02
    ldh  [hLinkInteractiveMotionBlocked], a
ELSE
    jp   HoldEntityAboveLink                      ;; 03:5FBC $C3 $17 $5A
ENDC

func_003_5FBF::
    ret                                           ;; 03:5FBF $C9

DroppableBombsSprite::
    db $80, OAM_GBC_PAL_5 | OAMF_PAL1

DroppableBombsEntityHandler::
    call DroppableRevealOrReturnIfNeeded          ;; 03:5FC2 $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:5FC5 $CD $8C $60
    ld   de, DroppableBombsSprite                 ;; 03:5FC8 $11 $C0 $5F
    call RenderActiveEntitySprite                 ;; 03:5FCB $CD $77 $3C
    jp   PickableHandler                          ;; 03:5FCE $C3 $AA $60

; Data for loading secret seashell when bush is clipped (and when dug from ground)
DroppableSeashellSprite::
    db $9E, OAM_GBC_PAL_4 | OAMF_PAL1

DroppableSeashellEntityHandler::
    ld   a, [wSwordLevel]                         ;; 03:5FD3 $FA $4E $DB
    cp   $02                                      ;; 03:5FD6 $FE $02
    jp   nc, UnloadEntityAndReturn                ;; 03:5FD8 $D2 $8D $3F

    ldh  a, [hRoomStatus]                         ;; 03:5FDB $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5FDD $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:5FDF $C2 $8D $3F

    ldh  a, [hMapRoom]                            ;; 03:5FE2 $F0 $F6
    cp   UNKNOWN_ROOM_E3                          ; House by the Bay
    jr   nz, .jr_5FEF                             ;; 03:5FE6 $20 $07

    ldh  a, [hRoomStatus]                         ;; 03:5FE8 $F0 $F8
    and  ROOM_STATUS_EVENT_3                      ;; 03:5FEA $E6 $40
    jp   z, UnloadEntityAndReturn                 ;; 03:5FEC $CA $8D $3F

.jr_5FEF
    call DroppableRevealOrReturnIfNeeded          ;; 03:5FEF $CD $DE $61
    ld   de, DroppableSeashellSprite              ;; 03:5FF2 $11 $D1 $5F
    call RenderActiveEntitySprite                 ;; 03:5FF5 $CD $77 $3C
    jp   PickableHandler                          ;; 03:5FF8 $C3 $AA $60

HidingSlimeKeySprite::
    db $CA, OAM_GBC_PAL_4 | OAMF_PAL1

HidingSlimeKeyEntityHandler::
    ldh  a, [hRoomStatus]                         ;; 03:5FFD $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ;; 03:5FFF $E6 $10
    jp   nz, UnloadEntityAndReturn                ;; 03:6001 $C2 $8D $3F

    call DroppableRevealOrReturnIfNeeded          ;; 03:6004 $CD $DE $61
    ld   de, HidingSlimeKeySprite                 ;; 03:6007 $11 $FB $5F
    call RenderActiveEntitySprite                 ;; 03:600A $CD $77 $3C
    call GetEntityTransitionCountdown             ;; 03:600D $CD $05 $0C
    jp   z, PickableHandler                       ;; 03:6010 $CA $AA $60

    cp   $10                                      ;; 03:6013 $FE $10
    jr   nz, jr_003_604C                          ;; 03:6015 $20 $35

    dec  [hl]                                     ;; 03:6017 $35
    ld   a, [wIsIndoor]                           ;; 03:6018 $FA $A5 $DB
    and  a                                        ;; 03:601B $A7
    jr   nz, .jr_6029                             ;; 03:601C $20 $0B

    ldh  a, [hMapRoom]                            ;; 03:601E $F0 $F6
    cp   ROOM_OW_POTHOLE_FIELD_SLIME_KEY          ; Overworld Pothole Field - Slime Key
    jr   nz, .jr_6029                             ;; 03:6022 $20 $05

    ld   a, GOLDEN_LEAVES_5                       ;; 03:6024 $3E $05
    ld   [wGoldenLeavesCount], a                  ;; 03:6026 $EA $15 $DB

.jr_6029
    ld   hl, wGoldenLeavesCount                   ;; 03:6029 $21 $15 $DB
    call IncreaseValueAtHLClampAt99               ;; 03:602C $CD $73 $63
    call MarkRoomCompleted                        ;; 03:602F $CD $2A $51
    ld   hl, hRoomStatus                          ;; 03:6032 $21 $F8 $FF
    res  4, [hl]                                  ;; 03:6035 $CB $A6
    ld_dialog_low e, Dialog0A2 ; "Got the Slime Key" ;; 03:6037 $1E $A2
    ld   a, [wGoldenLeavesCount]                  ;; 03:6039 $FA $15 $DB
    cp   SLIME_KEY                                ;; 03:603C $FE $06
    jr   z, .openDialog                           ;; 03:603E $28 $07

    ld_dialog_low e, Dialog0E8 ; "Found a Gold Leaf" ;; 03:6040 $1E $E8
    cp   GOLDEN_LEAVES_5                          ;; 03:6042 $FE $05
    jr   nz, .openDialog                          ;; 03:6044 $20 $01

    inc  e ; Dialog0E9 "Found the final Golden Leaf" ;; 03:6046 $1C

.openDialog
    ld   a, e                                     ;; 03:6047 $7B
    call OpenDialogInTable0                       ;; 03:6048 $CD $85 $23
    xor  a                                        ;; 03:604B $AF

jr_003_604C:
    dec  a                                        ;; 03:604C $3D
IF __OPTIMIZATIONS_3__
    jp   nz, HoldEntityAboveLink
    jp   UnloadEntityAndReturn
ELSE
    jr   nz, .jr_6052                             ;; 03:604D $20 $03
    jp   UnloadEntityAndReturn                    ;; 03:604F $C3 $8D $3F

.jr_6052
    jp   HoldEntityAboveLink                      ;; 03:6052 $C3 $17 $5A
ENDC

DroppableMagicPowderSprite::
    db $8E, OAM_GBC_PAL_6 | OAMF_PAL1

DroppableMagicPowderEntityHandler::
    ld   a, [wIsIndoor]                           ;; 03:6057 $FA $A5 $DB
    and  a                                        ;; 03:605A $A7
    jr   z, .jr_6063                              ;; 03:605B $28 $06

    ldh  a, [hMapId]                              ;; 03:605D $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:605F $FE $FF
    jr   z, jr_003_606A                           ;; 03:6061 $28 $07

.jr_6063
    ld   a, [wHasToadstool]                       ;; 03:6063 $FA $4B $DB
    and  a                                        ;; 03:6066 $A7
    jp   nz, UnloadEntityAndReturn                ;; 03:6067 $C2 $8D $3F

jr_003_606A:
    call DroppableRevealOrReturnIfNeeded          ;; 03:606A $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:606D $CD $8C $60
    ld   de, DroppableMagicPowderSprite           ;; 03:6070 $11 $55 $60
    call RenderActiveEntitySprite                 ;; 03:6073 $CD $77 $3C
    jp   PickableHandler                          ;; 03:6076 $C3 $AA $60

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
DroppableArrowSprite::
    db $2A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP
    db $2A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_YFLIP | OAMF_XFLIP

DroppableArrowsEntityHandler::
    call DroppableRevealOrReturnIfNeeded          ;; 03:607D $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:6080 $CD $8C $60
    ld   de, DroppableArrowSprite                 ;; 03:6083 $11 $79 $60
    call RenderActiveEntitySpritesPair            ;; 03:6086 $CD $C0 $3B
    jp   PickableHandler                          ;; 03:6089 $C3 $AA $60

; After enough time, fade away and disappear.
DroppableDisappearIfNeeded::
    call GetEntitySlowTransitionCountdown         ;; 03:608C $CD $FB $0B
    cp   $1C                                      ;; 03:608F $FE $1C
    ret  nc                                       ;; 03:6091 $D0

    and  a                                        ;; 03:6092 $A7
    jp   z, UnloadEntityAndReturn                 ;; 03:6093 $CA $8D $3F

    and  $01                                      ;; 03:6096 $E6 $01
    dec  a                                        ;; 03:6098 $3D
    jp   SetEntitySpriteVariant                   ;; 03:6099 $C3 $0C $3B

DroppableRupeeSprite::
    db $A6, OAM_GBC_PAL_5 | OAMF_PAL1

DroppableRupeeEntityHandler::
    call DroppableRevealOrReturnIfNeeded          ;; 03:609E $CD $DE $61
    call DroppableDisappearIfNeeded               ;; 03:60A1 $CD $8C $60
    ld   de, DroppableRupeeSprite                 ;; 03:60A4 $11 $9C $60
    call RenderActiveEntitySprite                 ;; 03:60A7 $CD $77 $3C
    ; fallthrough

PickableHandler::
    call ReturnIfNonInteractive_03                ;; 03:60AA $CD $78 $7F
    call PickableHandleGrabbedByItemIfNeeded      ;; 03:60AD $CD $AF $62
    call PickableCollectIfNeeded                  ;; 03:60B0 $CD $EB $62
    ; fallthrough

BouncingEntityPhysics::
    call UpdateEntityPosWithSpeed_03              ;; 03:60B3 $CD $25 $7F
    call func_003_6B7B                            ;; 03:60B6 $CD $7B $6B
    call ApplyEntityInteractionWithBackground     ;; 03:60B9 $CD $93 $78
    ldh  a, [hIsSideScrolling]                    ;; 03:60BC $F0 $F9
    and  a                                        ;; 03:60BE $A7
    jr   z, .sidescrollingEnd                     ;; 03:60BF $28 $22

    ; If colliding with the ground, bounce. Otherwise, return.
    ld   hl, wEntitiesCollisionsTable             ;; 03:60C1 $21 $A0 $C2
    add  hl, bc                                   ;; 03:60C4 $09
    ld   a, [hl]                                  ;; 03:60C5 $7E
    and  $08                                      ;; 03:60C6 $E6 $08
    jp   z, .return                               ;; 03:60C8 $CA $56 $61

    ld   hl, wEntitiesPosYTable                   ;; 03:60CB $21 $10 $C2
    add  hl, bc                                   ;; 03:60CE $09
    ld   a, [hl]                                  ;; 03:60CF $7E
    and  $F0                                      ;; 03:60D0 $E6 $F0
    add  $05                                      ;; 03:60D2 $C6 $05
    ld   [hl], a                                  ;; 03:60D4 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:60D5 $21 $50 $C2
    add  hl, bc                                   ;; 03:60D8 $09
    ld   a, [hl]                                  ;; 03:60D9 $7E
    cpl                                           ;; 03:60DA $2F
    sra  a                                        ;; 03:60DB $CB $2F
    cp   $F8                                      ;; 03:60DD $FE $F8
    jr   c, .makeBouncingNoise                    ;; 03:60DF $38 $31

    jr   .shallowWaterEnd                         ;; 03:60E1 $18 $20

.sidescrollingEnd
    ; If colliding with the ground (and not on shallow water), bounce. Otherwise, return.
    ld   hl, wEntitiesPosZTable                   ;; 03:60E3 $21 $10 $C3
    add  hl, bc                                   ;; 03:60E6 $09
    ld   a, [hl]                                  ;; 03:60E7 $7E
    and  $80                                      ;; 03:60E8 $E6 $80
    jr   z, .return                               ;; 03:60EA $28 $6A

    xor  a                                        ;; 03:60EC $AF
    ld   [hl], a                                  ;; 03:60ED $77
    ld   hl, wEntitiesGroundStatusTable           ;; 03:60EE $21 $70 $C4
    add  hl, bc                                   ;; 03:60F1 $09
    ld   a, [hl]                                  ;; 03:60F2 $7E
    ld   hl, wEntitiesSpeedZTable                 ;; 03:60F3 $21 $20 $C3
    add  hl, bc                                   ;; 03:60F6 $09
    cp   ENTITY_GROUND_STATUS_SHALLOW_WATER       ;; 03:60F7 $FE $02
    jr   z, .shallowWaterEnd                      ;; 03:60F9 $28 $08

    ld   a, [hl]                                  ;; 03:60FB $7E
    sra  a                                        ;; 03:60FC $CB $2F
    cpl                                           ;; 03:60FE $2F
    cp   $07                                      ;; 03:60FF $FE $07
    jr   nc, .makeBouncingNoise                   ;; 03:6101 $30 $0F

.shallowWaterEnd
    xor  a                                        ;; 03:6103 $AF
    push hl                                       ;; 03:6104 $E5
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6105 $21 $40 $C2
    add  hl, bc                                   ;; 03:6108 $09
    ld   [hl], a                                  ;; 03:6109 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:610A $21 $50 $C2
    add  hl, bc                                   ;; 03:610D $09
    ld   [hl], a                                  ;; 03:610E $77
    pop  hl                                       ;; 03:610F $E1
    jr   .makeBouncingNoiseEnd                    ;; 03:6110 $18 $24

.makeBouncingNoise
    push af                                       ;; 03:6112 $F5
    push hl                                       ;; 03:6113 $E5

    ; If key or bomb, make appropriate sound
    ldh  a, [hActiveEntityType]                   ;; 03:6114 $F0 $EB
    cp   ENTITY_KEY_DROP_POINT                    ;; 03:6116 $FE $30
    jr   nz, .keyEnd                              ;; 03:6118 $20 $06

    ld   a, NOISE_SFX_CLINK                       ;; 03:611A $3E $17
    ldh  [hNoiseSfx], a                           ;; 03:611C $E0 $F4
    jr   .bombEnd                                 ;; 03:611E $18 $14
.keyEnd

    cp   ENTITY_BOMB                              ;; 03:6120 $FE $02
    jr   nz, .bombEnd                             ;; 03:6122 $20 $10

    ld   hl, wEntitiesStatusTable                 ;; 03:6124 $21 $80 $C2
    add  hl, bc                                   ;; 03:6127 $09
    ld   a, [hl]                                  ;; 03:6128 $7E
    and  a                                        ;; 03:6129 $A7
    jr   z, .bombEnd                              ;; 03:612A $28 $08

    cp   ENTITY_STATUS_FALLING                    ;; 03:612C $FE $02
    jr   z, .bombEnd                              ;; 03:612E $28 $04

    ld   a, JINGLE_BUMP                           ;; 03:6130 $3E $09
    ldh  [hJingle], a                             ;; 03:6132 $E0 $F2
.bombEnd

    pop  hl                                       ;; 03:6134 $E1
    pop  af                                       ;; 03:6135 $F1

.makeBouncingNoiseEnd
    ; Halve x speed
    ld   [hl], a                                  ;; 03:6136 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6137 $21 $40 $C2
    add  hl, bc                                   ;; 03:613A $09
    ld   a, [hl]                                  ;; 03:613B $7E
    sra  a                                        ;; 03:613C $CB $2F
    cp   $FF                                      ;; 03:613E $FE $FF
    jr   nz, .clearXSpeedEnd                      ;; 03:6140 $20 $01

    xor  a                                        ;; 03:6142 $AF

.clearXSpeedEnd
    ; If not side scrolling, also halve y speed
    ld   [hl], a                                  ;; 03:6143 $77
    ldh  a, [hIsSideScrolling]                    ;; 03:6144 $F0 $F9
    and  a                                        ;; 03:6146 $A7
    jr   nz, .return                              ;; 03:6147 $20 $0D

    ld   hl, wEntitiesSpeedYTable                 ;; 03:6149 $21 $50 $C2
    add  hl, bc                                   ;; 03:614C $09
    ld   a, [hl]                                  ;; 03:614D $7E
    sra  a                                        ;; 03:614E $CB $2F
    cp   $FF                                      ;; 03:6150 $FE $FF
    jr   nz, .clearYSpeedEnd                      ;; 03:6152 $20 $01

    xor  a                                        ;; 03:6154 $AF

.clearYSpeedEnd
    ld   [hl], a                                  ;; 03:6155 $77

.return
    ret                                           ;; 03:6156 $C9

include "code/entities/03_droppable_fairy.asm"

func_003_61C0::
    ldh  a, [hFrameCounter]                       ;; 03:61C0 $F0 $E7
    and  $03                                      ;; 03:61C2 $E6 $03
    jr   nz, ret_003_61DD                         ;; 03:61C4 $20 $17

    ld   hl, wEntitiesPosZTable                   ;; 03:61C6 $21 $10 $C3
    add  hl, bc                                   ;; 03:61C9 $09
    ld   a, [hl]                                  ;; 03:61CA $7E
    cp   $10                                      ;; 03:61CB $FE $10
    jr   z, ret_003_61DD                          ;; 03:61CD $28 $0E

    bit  7, a                                     ;; 03:61CF $CB $7F
    jr   z, .jr_61D6                              ;; 03:61D1 $28 $03

    inc  [hl]                                     ;; 03:61D3 $34
    jr   ret_003_61DD                             ;; 03:61D4 $18 $07

.jr_61D6
    cp   $10                                      ;; 03:61D6 $FE $10
    jr   nc, .jr_61DC                             ;; 03:61D8 $30 $02

    inc  [hl]                                     ;; 03:61DA $34
    ret                                           ;; 03:61DB $C9

.jr_61DC
    dec  [hl]                                     ;; 03:61DC $35

ret_003_61DD:
    ret                                           ;; 03:61DD $C9

; For hidden items, either stay hidden (by returning early), or be revealed if dug up, etc.
DroppableRevealOrReturnIfNeeded::
    ld   hl, wEntitiesPrivateState3Table          ;; 03:61DE $21 $D0 $C2
    add  hl, bc                                   ;; 03:61E1 $09
    ld   a, [hl]                                  ;; 03:61E2 $7E
    and  a                                        ;; 03:61E3 $A7
    jp   z, .return                               ;; 03:61E4 $CA $9D $62

    ld   a, [wRoomTransitionState]                ;; 03:61E7 $FA $24 $C1
    and  a                                        ;; 03:61EA $A7
    jp   nz, .remainInvisible                     ;; 03:61EB $C2 $9C $62

    ld   a, [hl]                                  ;; 03:61EE $7E
    cp   $02                                      ;; 03:61EF $FE $02
    jr   nz, .checkPegasusBootsCollision          ;; 03:61F1 $20 $50

    ; Items buried, hidden in bushes, or indoors:
    ldh  a, [hActiveEntityType]                   ;; 03:61F3 $F0 $EB
    cp   ENTITY_DROPPABLE_SECRET_SEASHELL         ;; 03:61F5 $FE $3D
    jr   z, .skipNotActiveIfIndoors               ; $61F7: $28 $07 (???: If a seashell, jump?)

    ; If indoors and not a seashell, the item can't be dug up or dropped by bushes.
    ld   a, [wIsIndoor]                           ;; 03:61F9 $FA $A5 $DB
    and  a                                        ;; 03:61FC $A7
    jp   nz, .remainInvisible                     ;; 03:61FD $C2 $9C $62

.skipNotActiveIfIndoors
    call func_003_7E0E                            ;; 03:6200 $CD $0E $7E
    ldh  a, [hActiveEntityType]                   ;; 03:6203 $F0 $EB
    cp   ENTITY_DROPPABLE_HEART                   ;; 03:6205 $FE $2D
    jr   z, .activeIfOnShortGrass                 ;; 03:6207 $28 $1E

    cp   ENTITY_DROPPABLE_SECRET_SEASHELL         ;; 03:6209 $FE $3D
    jr   nz, .activeIfOnShortGrassEnd             ;; 03:620B $20 $22

    ; Seashells buried under short grass (some of these don't exist)
    ldh  a, [hMapRoom]                            ;; 03:620D $F0 $F6
    cp   UNKNOWN_ROOM_DA                          ; Overworld room one north of fisherman under bridge
    jr   z, .activeIfOnShortGrassEnd              ;; 03:6211 $28 $1C
    cp   UNKNOWN_ROOM_A5                          ; Overworld room two east of Mabe bush field
    jr   z, .activeIfOnShortGrassEnd              ;; 03:6215 $28 $18
    cp   UNKNOWN_ROOM_74                          ; Overworld room one south of ghost's gravestone (w/zombies)
    jr   z, .activeIfOnShortGrassEnd              ;; 03:6219 $28 $14
    cp   UNKNOWN_ROOM_3A                          ; Overworld room with... no seashell?
    jr   z, .activeIfOnShortGrassEnd              ;; 03:621D $28 $10
    cp   UNKNOWN_ROOM_A8                          ; Overworld room northeast-ish of Pothole Field
    jr   z, .activeIfOnShortGrassEnd              ;; 03:6221 $28 $0C
    cp   UNKNOWN_ROOM_B2                          ; Overworld room - Mabe village telephone booth (...no seashell???)
    jr   z, .activeIfOnShortGrassEnd              ;; 03:6225 $28 $08

.activeIfOnShortGrass
    ldh  a, [hObjectUnderEntity]                  ;; 03:6227 $F0 $AF
    cp   OBJECT_SHORT_GRASS                       ;; 03:6229 $FE $04
    jr   z, .setOptionsAndReveal                  ;; 03:622B $28 $0E

    jr   .activeIfOnShovelHole                    ;; 03:622D $18 $06

.activeIfOnShortGrassEnd
    ld   hl, wEntitiesPrivateState4Table          ;; 03:622F $21 $40 $C4
    add  hl, bc                                   ;; 03:6232 $09
    ld   [hl], $01                                ;; 03:6233 $36 $01

.activeIfOnShovelHole
    ldh  a, [hObjectUnderEntity]                  ;; 03:6235 $F0 $AF
    cp   OBJECT_SHOVEL_HOLE                       ;; 03:6237 $FE $CC
    jr   nz, .remainInvisible                     ;; 03:6239 $20 $61

.setOptionsAndReveal
    ld   hl, wEntitiesOptions1Table               ;; 03:623B $21 $30 $C4
    add  hl, bc                                   ;; 03:623E $09
    ld   [hl], ENTITY_OPT1_SPLASH_IN_WATER|ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL ;; 03:623F $36 $0A
    jr   .reveal                                  ;; 03:6241 $18 $28

.checkPegasusBootsCollision
    ; Items knocked down with the Pegasus Boots:
    ld   a, [wScreenShakeCountdown]               ;; 03:6243 $FA $57 $C1
    and  a                                        ;; 03:6246 $A7
    jr   z, .remainInvisible                      ;; 03:6247 $28 $53

    ld   a, [wPegasusBootsCollisionCountdown]     ;; 03:6249 $FA $78 $C1
    and  a                                        ;; 03:624C $A7
    jr   z, .remainInvisible                      ;; 03:624D $28 $4D

    ldh  a, [hActiveEntityPosX]                   ;; 03:624F $F0 $EE
    add  $08                                      ;; 03:6251 $C6 $08
    ld   hl, wPegasusBootsCollisionPosX           ;; 03:6253 $21 $79 $C1
    sub  [hl]                                     ;; 03:6256 $96
    add  $10                                      ;; 03:6257 $C6 $10
    cp   $20                                      ;; 03:6259 $FE $20
    jr   nc, .remainInvisible                     ;; 03:625B $30 $3F

    ldh  a, [hActiveEntityPosY]                   ;; 03:625D $F0 $EF
    add  $08                                      ;; 03:625F $C6 $08
    ld   hl, wPegasusBootsCollisionPosY           ;; 03:6261 $21 $7A $C1
    sub  [hl]                                     ;; 03:6264 $96
    add  $10                                      ;; 03:6265 $C6 $10
    cp   $20                                      ;; 03:6267 $FE $20
    jr   nc, .remainInvisible                     ;; 03:6269 $30 $31

.reveal
    ; Items revealed are thrown away from Link
    ld   hl, wEntitiesPrivateState3Table          ;; 03:626B $21 $D0 $C2
    add  hl, bc                                   ;; 03:626E $09
    ld   [hl], b                                  ;; 03:626F $70
    ld   hl, wEntitiesPrivateState4Table          ;; 03:6270 $21 $40 $C4
    add  hl, bc                                   ;; 03:6273 $09
    ld   [hl], b                                  ;; 03:6274 $70
    call GetEntityPrivateCountdown1               ;; 03:6275 $CD $00 $0C
    ld   [hl], $18                                ;; 03:6278 $36 $18
    ld   a, $0C                                   ;; 03:627A $3E $0C
    call GetVectorTowardsLink                     ;; 03:627C $CD $45 $7E
    ldh  a, [hMultiPurpose1]                      ;; 03:627F $F0 $D8
    cpl                                           ;; 03:6281 $2F
    inc  a                                        ;; 03:6282 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6283 $21 $40 $C2
    add  hl, bc                                   ;; 03:6286 $09
    ld   [hl], a                                  ;; 03:6287 $77
    ldh  a, [hMultiPurpose0]                      ;; 03:6288 $F0 $D7
    cpl                                           ;; 03:628A $2F
    inc  a                                        ;; 03:628B $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 03:628C $21 $50 $C2
    add  hl, bc                                   ;; 03:628F $09
    ld   [hl], a                                  ;; 03:6290 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 03:6291 $21 $20 $C3
    add  hl, bc                                   ;; 03:6294 $09
    ld   [hl], $20                                ;; 03:6295 $36 $20
    call GetEntitySlowTransitionCountdown         ;; 03:6297 $CD $FB $0B
    ld   [hl], $80                                ;; 03:629A $36 $80

.remainInvisible
    pop  af                                       ;; 03:629C $F1

.return
    ret                                           ;; 03:629D $C9

PickableCanBeCollectedBySwordTable::
    ; Indexed by entity type
    db   TRUE                                     ; ENTITY_DROPPABLE_HEART
    db   TRUE                                     ; ENTITY_DROPPABLE_RUPEE
    db   FALSE                                    ; ENTITY_DROPPABLE_FAIRY
    db   FALSE                                    ; ENTITY_KEY_DROP_POINT
    db   TRUE                                     ; ENTITY_SWORD_SHIELD_PICKUP
    db   FALSE                                    ; ENTITY_IRON_MASKS_MASK
    db   TRUE                                     ; ENTITY_PIECE_OF_POWER
    db   TRUE                                     ; ENTITY_GUARDIAN_ACORN
    db   FALSE                                    ; ENTITY_HEART_PIECE
    db   FALSE                                    ; ENTITY_HEART_CONTAINER
    db   TRUE                                     ; ENTITY_DROPPABLE_ARROWS
    db   TRUE                                     ; ENTITY_DROPPABLE_BOMBS
    db   FALSE                                    ; ENTITY_INSTRUMENT_OF_THE_SIRENS
    db   FALSE                                    ; ENTITY_SLEEPY_TOADSTOOL
    db   TRUE                                     ; ENTITY_DROPPABLE_MAGIC_POWDER
    db   FALSE                                    ; ENTITY_HIDING_SLIME_KEY
    db   FALSE                                    ; ENTITY_DROPPABLE_SECRET_SEASHELL

; If an item has been grabbed with the Boomerang or Hookshot, this function handles that
PickableHandleGrabbedByItemIfNeeded::
    ld   hl, wEntitiesPrivateState5Table          ;; 03:62AF $21 $90 $C3
    add  hl, bc                                   ;; 03:62B2 $09
    ld   a, [hl]                                  ;; 03:62B3 $7E
    and  a                                        ;; 03:62B4 $A7
    jr   z, .return                               ;; 03:62B5 $28 $33

    pop  de                                       ;; 03:62B7 $D1
    dec  a                                        ;; 03:62B8 $3D
    ld   e, a                                     ;; 03:62B9 $5F
    ld   d, b                                     ;; 03:62BA $50
    ld   hl, wEntitiesStatusTable                 ;; 03:62BB $21 $80 $C2
    add  hl, de                                   ;; 03:62BE $19
    ld   a, [hl]                                  ;; 03:62BF $7E
    and  a                                        ;; 03:62C0 $A7
    jr   z, PickableCollectIfNeeded.collect       ;; 03:62C1 $28 $4E

    ld   hl, wEntitiesTypeTable                   ;; 03:62C3 $21 $A0 $C3
    add  hl, de                                   ;; 03:62C6 $19
    ld   a, [hl]                                  ;; 03:62C7 $7E
    cp   ENTITY_BOOMERANG                         ;; 03:62C8 $FE $01
    jr   z, .snapToBoomerangOrHookshot            ;; 03:62CA $28 $04

    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:62CC $FE $03
    jr   nz, PickableCollectIfNeeded.collect      ;; 03:62CE $20 $41

.snapToBoomerangOrHookshot
    ld   hl, wEntitiesPosXTable                   ;; 03:62D0 $21 $00 $C2
    add  hl, de                                   ;; 03:62D3 $19
    ld   a, [hl]                                  ;; 03:62D4 $7E
    ld   hl, wEntitiesPosXTable                   ;; 03:62D5 $21 $00 $C2
    add  hl, bc                                   ;; 03:62D8 $09
    ld   [hl], a                                  ;; 03:62D9 $77
    ld   hl, wEntitiesPosYTable                   ;; 03:62DA $21 $10 $C2
    add  hl, de                                   ;; 03:62DD $19
    ld   a, [hl]                                  ;; 03:62DE $7E
    ld   hl, wEntitiesPosYTable                   ;; 03:62DF $21 $10 $C2
    add  hl, bc                                   ;; 03:62E2 $09
    ld   [hl], a                                  ;; 03:62E3 $77
    xor  a                                        ;; 03:62E4 $AF
    ld   hl, wEntitiesPosZTable                   ;; 03:62E5 $21 $10 $C3
    add  hl, bc                                   ;; 03:62E8 $09
    ld   [hl], a                                  ;; 03:62E9 $77

.return
    ret                                           ;; 03:62EA $C9

PickableCollectIfNeeded::
    call GetEntityPrivateCountdown1               ;; 03:62EB $CD $00 $0C
    jr   nz, PickableHandleGrabbedByItemIfNeeded.return ;; 03:62EE $20 $FA

    ldh  a, [hActiveEntityType]                   ;; 03:62F0 $F0 $EB
    sub  $2D                                      ;; 03:62F2 $D6 $2D
    ld   e, a                                     ;; 03:62F4 $5F
    ld   d, b                                     ;; 03:62F5 $50
    ld   hl, PickableCanBeCollectedBySwordTable   ;; 03:62F6 $21 $9E $62
    add  hl, de                                   ;; 03:62F9 $19
    ld   a, [hl]                                  ;; 03:62FA $7E
    and  a                                        ;; 03:62FB $A7
    jr   z, .cannotBeCollectedBySword             ;; 03:62FC $28 $0E

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:62FE $21 $10 $C4
    add  hl, bc                                   ;; 03:6301 $09
    ld   a, [hl]                                  ;; 03:6302 $7E
    push af                                       ;; 03:6303 $F5
    push hl                                       ;; 03:6304 $E5
    ld   [hl], b                                  ;; 03:6305 $70
    call func_003_6E2B                            ;; 03:6306 $CD $2B $6E
    pop  hl                                       ;; 03:6309 $E1
    pop  af                                       ;; 03:630A $F1
    ld   [hl], a                                  ;; 03:630B $77

.cannotBeCollectedBySword
    call func_003_6C6B                            ;; 03:630C $CD $6B $6C
    jr   nc, PickableHandleGrabbedByItemIfNeeded.return ;; 03:630F $30 $D9

.collect
    ld   hl, wEntitiesLoadOrderTable              ;; 03:6311 $21 $60 $C4
    add  hl, bc                                   ;; 03:6314 $09
    ld   a, [hl]                                  ;; 03:6315 $7E
    call DidKillEnemy.label_3F78                  ;; 03:6316 $CD $78 $3F

    ldh  a, [hActiveEntityType]                   ;; 03:6319 $F0 $EB
    sub  $2D                                      ;; 03:631B $D6 $2D

    ; Play a sound when picking the item
    cp   ENTITY_DROPPABLE_FAIRY - $2D             ;; 03:631D $FE $02
    jr   nc, .heartOrRupeeEnd                     ;; 03:631F $30 $07
    ld   hl, hJingle                              ;; 03:6321 $21 $F2 $FF
    ld   [hl], JINGLE_GOT_HEART                   ;; 03:6324 $36 $14
    jr   .sfxEnd                                  ;; 03:6326 $18 $05
.heartOrRupeeEnd
    ld   hl, hWaveSfx                             ;; 03:6328 $21 $F3 $FF
    ld   [hl], WAVE_SFX_SEASHELL                  ;; 03:632B $36 $01
.sfxEnd

    ; Jump to the handler for this pickable entity
    JP_TABLE
._2D dw PickDroppableHeart
._2E dw PickDroppableRupee
._2F dw PickDroppableFairy
._30 dw PickDroppableKey
._31 dw PickSword
._32 dw MovePickupInTheAir.return
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
    ld   a, REPLACE_TILES_MAGIC_POWDER            ;; 03:6350 $3E $0B
    ldh  [hReplaceTiles], a                       ;; 03:6352 $E0 $A5

    ld   d, $0C                                   ;; 03:6354 $16 $0C
    call GiveInventoryItem                        ;; 03:6356 $CD $72 $64

    ld   hl, wMaxMagicPowder                      ;; 03:6359 $21 $76 $DB
    ld   de, wMagicPowderCount                    ;; 03:635C $11 $4C $DB

jr_003_635F:
    ld   a, [de]                                  ;; 03:635F $1A
    cp   [hl]                                     ;; 03:6360 $BE
    jr   nc, .return                              ;; 03:6361 $30 $04

    add  $01                                      ;; 03:6363 $C6 $01
    daa                                           ;; 03:6365 $27
    ld   [de], a                                  ;; 03:6366 $12

.return
    ret                                           ;; 03:6367 $C9

PickSecretSeashell::
    call_open_dialog Dialog0EF                    ;; 03:6368

label_003_636D:
    call MarkRoomCompleted                        ;; 03:636D $CD $2A $51
    ld   hl, wSeashellsCount                      ;; 03:6370 $21 $0F $DB

IncreaseValueAtHLClampAt99::
    ; POI: Adds one to seashell / golden leaves count, preventing overflow if at 99.
    ; But you can never get anywhere near that! Golden Leaves even stop at 6 (slime key)!
    ld   a, [hl]                                  ;; 03:6373 $7E
    cp   $99                                      ;; 03:6374 $FE $99
    jr   z, .ret_637C                             ;; 03:6376 $28 $04

    add  $01                                      ;; 03:6378 $C6 $01
    daa                                           ;; 03:637A $27
    ld   [hl], a                                  ;; 03:637B $77

.ret_637C
    ret                                           ;; 03:637C $C9

PickDroppableArrows::
    ld   hl, wMaxArrows                           ;; 03:637D $21 $78 $DB
    ld   de, wArrowCount                          ;; 03:6380 $11 $45 $DB
    jr   jr_003_635F                              ;; 03:6383 $18 $DA

PickDroppableBombs::
    ld   d, $02                                   ;; 03:6385 $16 $02
    call GiveInventoryItem                        ;; 03:6387 $CD $72 $64
    ld   hl, wMaxBombs                            ;; 03:638A $21 $77 $DB
    ld   de, wBombCount                           ;; 03:638D $11 $4D $DB
    jr   jr_003_635F                              ;; 03:6390 $18 $CD

PickSirensInstrument::
    xor  a                                        ;; 03:6392 $AF
    ld   [wBossDefeated], a                       ;; 03:6393 $EA $6C $D4
    ld   [wObjectAffectingBGPalette], a           ;; 03:6396 $EA $CB $C3
    ld   a, MUSIC_OBTAIN_INSTRUMENT               ;; 03:6399 $3E $1B
    ld   [wMusicTrackToPlay], a                   ;; 03:639B $EA $68 $D3
    ld   [wC167], a                               ;; 03:639E $EA $67 $C1

; Link beach sword lifting in the air animation?
HoldPickupInTheAir::
    ldh  a, [hLinkPositionX]                      ;; 03:63A1 $F0 $98
    push af                                       ;; 03:63A3 $F5
    add  $04                                      ;; 03:63A4 $C6 $04
    ldh  [hLinkPositionX], a                      ;; 03:63A6 $E0 $98
    call MovePickupInTheAir                       ;; 03:63A8 $CD $1E $64
    ; reset hLinkPositionX to previous value
    pop  af                                       ;; 03:63AB $F1
    ldh  [hLinkPositionX], a                      ;; 03:63AC $E0 $98
    jr   label_003_63D2                           ;; 03:63AE $18 $22

PickHeartContainer::
    xor  a                                        ;; 03:63B0 $AF
    ld   [wActivePowerUp], a                      ;; 03:63B1 $EA $7C $D4
    ld   a, MUSIC_HEART_CONTAINER                 ;; 03:63B4 $3E $25
    ld   [wMusicTrackToPlay], a                   ;; 03:63B6 $EA $68 $D3
    ld   [wBossDefeated], a                       ;; 03:63B9 $EA $6C $D4
    call GetEntityTransitionCountdown             ;; 03:63BC $CD $05 $0C
    ld   a, $70                                   ;; 03:63BF $3E $70
    ld   [hl], a                                  ;; 03:63C1 $77
    ld   [wC111], a                               ;; 03:63C2 $EA $11 $C1
    jr   jr_003_63DB                              ;; 03:63C5 $18 $14

PickToadstoolOrDungeonKey::
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 03:63C7 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 03:63C9 $EA $68 $D3
    jr   label_003_63D2                           ;; 03:63CC $18 $04

    ld   a, JINGLE_TREASURE_FOUND                 ;; 03:63CE $3E $01
    ldh  [hJingle], a                             ;; 03:63D0 $E0 $F2

label_003_63D2:
    call GetEntityTransitionCountdown             ;; 03:63D2 $CD $05 $0C
    ld   a, $68                                   ;; 03:63D5 $3E $68
    ld   [hl], a                                  ;; 03:63D7 $77
    ld   [wC111], a                               ;; 03:63D8 $EA $11 $C1

jr_003_63DB:
    ld   hl, wEntitiesStatusTable                 ;; 03:63DB $21 $80 $C2
    add  hl, bc                                   ;; 03:63DE $09
    ld   [hl], $05                                ;; 03:63DF $36 $05
    jp   ResetSpinAttack                          ;; 03:63E1 $C3 $AF $0C

PickHeartPiece::
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 03:63E4 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 03:63E6 $EA $68 $D3
    call IncrementEntityState                     ;; 03:63E9 $CD $12 $3B
    jr   jr_003_63DB                              ;; 03:63EC $18 $ED

; X offset to links position
Data_003_63EE::
    ;    loop-end  loop-next2 loop-next1 loop-start
    db   $E4,      $14,       $E4,       $14

; Y offset to links position
Data_003_63F2::
    ;    loop-end  loop-next2 loop-next1 loop-start
    db   $D4,      $D4,       $04,       $04

PickGuardianAcorn::
    ld   a, ACTIVE_POWER_UP_GUARDIAN_ACORN        ;; 03:63F6 $3E $02
    ld   e, DIALOG_GOT_GUARDIAN_ACORN             ;; 03:63F8 $1E $05
    jr   ProcessPowerUp                           ;; 03:63FA $18 $04

PickPieceOfPower::
    ld   a, ACTIVE_POWER_UP_PIECE_OF_POWER        ;; 03:63FC $3E $01
    ld   e, DIALOG_GOT_PIECE_OF_POWER             ;; 03:63FE $1E $01

; a = active power up
; e = dialog type for power up pickup
ProcessPowerUp:
    ld   [wActivePowerUp], a                      ;; 03:6400 $EA $7C $D4
    ld   a, e                                     ;; 03:6403 $7B
    ld   [wDialogGotItem], a                      ;; 03:6404 $EA $A9 $C1
    ld   a, $30                                   ;; 03:6407 $3E $30
    ld   [wDialogGotItemCountdown], a             ;; 03:6409 $EA $AA $C1
    ld   [wC111], a                               ;; 03:640C $EA $11 $C1
    xor  a                                        ;; 03:640F $AF
    ld   [wPowerUpHits], a                        ;; 03:6410 $EA $7A $D4
    ld   a, MUSIC_OBTAIN_POWERUP                  ;; 03:6413 $3E $27
    ld   [wMusicTrackToPlay], a                   ;; 03:6415 $EA $68 $D3
    ld   a, MUSIC_ACTIVE_POWER_UP                 ;; 03:6418 $3E $49
    ldh  [hDefaultMusicTrackAlt], a               ;; 03:641A $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ;; 03:641C $E0 $BF

MovePickupInTheAir::
    ; set loop counter
    ld   e, $03                                   ;; 03:641E $1E $03
    ld   d, $00                                   ;; 03:6420 $16 $00

.movePickupHigher::
    push de                                       ;; 03:6422 $D5
    ld   hl, Data_003_63EE                        ;; 03:6423 $21 $EE $63
    add  hl, de                                   ;; 03:6426 $19
    ldh  a, [hLinkPositionX]                      ;; 03:6427 $F0 $98
    add  [hl]                                     ;; 03:6429 $86
    ldh  [hMultiPurpose0], a                      ;; 03:642A $E0 $D7
    ld   hl, Data_003_63F2                        ;; 03:642C $21 $F2 $63
    add  hl, de                                   ;; 03:642F $19
    ldh  a, [hLinkPositionY]                      ;; 03:6430 $F0 $99
    add  [hl]                                     ;; 03:6432 $86
    ldh  [hMultiPurpose1], a                      ;; 03:6433 $E0 $D8
    ld   a, TRANSCIENT_VFX_MOVING_SPARKLE         ;; 03:6435 $3E $07
    call AddTranscientVfx                         ;; 03:6437 $CD $C7 $0C
    ld   hl, wTranscientVfxCountdownTable         ;; 03:643A $21 $20 $C5
    add  hl, de                                   ;; 03:643D $19
    ld   [hl], $22                                ;; 03:643E $36 $22
    ld   hl, wC590                                ;; 03:6440 $21 $90 $C5
    add  hl, de                                   ;; 03:6443 $19
    pop  de                                       ;; 03:6444 $D1
    ld   [hl], e                                  ;; 03:6445 $73
    dec  e                                        ;; 03:6446 $1D
    ld   a, e                                     ;; 03:6447 $7B
    cp   $FF                                      ;; 03:6448 $FE $FF
    jr   nz, .movePickupHigher                    ;; 03:644A $20 $D6

.return::
    ret                                           ;; 03:644C $C9

PickSword::
    ld   a, [wSwordLevel]                         ;; 03:644D $FA $4E $DB
    and  a                                        ;; 03:6450 $A7
    jr   nz, .jr_6468                             ;; 03:6451 $20 $15

    ld   a, MUSIC_OBTAIN_SWORD                    ;; 03:6453 $3E $0F
    ld   [wMusicTrackToPlay], a                   ;; 03:6455 $EA $68 $D3
    ld   [wC167], a                               ;; 03:6458 $EA $67 $C1
    call HoldPickupInTheAir                       ;; 03:645B $CD $A1 $63
    call GetEntityTransitionCountdown             ;; 03:645E $CD $05 $0C
    ld   [hl], $A0                                ;; 03:6461 $36 $A0
    ld   a, MUSIC_SILENCE                         ;; 03:6463 $3E $FF
    ldh  [hNextDefaultMusicTrack], a              ;; 03:6465 $E0 $BF
    ret                                           ;; 03:6467 $C9

.jr_6468
    ; POI: If sword level > 0, it's a shield instead. Used for Like-Likes?
    ld   hl, wEntitiesPrivateState1Table          ;; 03:6468 $21 $B0 $C2
    add  hl, bc                                   ;; 03:646B $09
    ld   a, [hl]                                  ;; 03:646C $7E
    ld   [wShieldLevel], a                        ;; 03:646D $EA $44 $DB
    ld   d, INVENTORY_SHIELD                      ;; 03:6470 $16 $04

GiveInventoryItem::     ; @TODO GivePlayerItem or w/e - inserts item in [d] into first available slot
    ld   hl, wInventoryItems.BButtonSlot          ;; 03:6472 $21 $00 $DB
    ld   e, $0C                                   ;; 03:6475 $1E $0C

.checkInventorySlot:                              ; Check if we already have this item:
    ld   a, [hl+]                                 ; Check what item is in this slot
    cp   d                                        ; Is it the item we're trying to add?
    jr   z, .return                               ; If yes, return

    dec  e                                        ; Otherwise, have we checked all slots?
    jr   nz, .checkInventorySlot                  ; If no, continue

    ld   hl, wInventoryItems.BButtonSlot                         ; Otherwise, load the inventory start again...

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
    ret                                           ;; 03:648E $C9

PickDroppableKey::
    ldh  a, [hMapRoom]                            ;; 03:648F $F0 $F6
    cp   ROOM_INDOOR_A_CATFISHS_MAW_MSTALFOS_4    ; Hookshot drops after Master Stalfos is defeated.
    jr   z, jr_003_64A5                           ;; 03:6493 $28 $10

    ldh  a, [hMapRoom]                            ;; 03:6495 $F0 $F6
    cp   ROOM_INDOOR_A_ANGLERS_TUNNEL_KEY_FALL    ; L4 Side-view room where the key drops
    jr   nz, .jr_64A0                             ;; 03:6499 $20 $05

    ld   hl, wIndoorARoomStatus + $69             ;; 03:649B $21 $69 $D9
    set  4, [hl]                                  ;; 03:649E $CB $E6

.jr_64A0
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:64A0 $F0 $F1
    and  a                                        ;; 03:64A2 $A7
    jr   z, jr_003_64AD                           ;; 03:64A3 $28 $08

jr_003_64A5:
    ld   a, MUSIC_OBTAIN_ITEM                     ;; 03:64A5 $3E $10
    ld   [wMusicTrackToPlay], a                   ;; 03:64A7 $EA $68 $D3
    jp   label_003_63D2                           ;; 03:64AA $C3 $D2 $63

jr_003_64AD:
    call MarkRoomCompleted                        ;; 03:64AD $CD $2A $51
    ld   hl, wSmallKeysCount                      ;; 03:64B0 $21 $D0 $DB
    inc  [hl]                                     ;; 03:64B3 $34
    jp   SynchronizeDungeonsItemFlags_trampoline  ;; 03:64B4 $C3 $02 $28

PickDroppableHeart::
    ld   a, $08                                   ;; 03:64B7 $3E $08

jr_003_64B9:
    ld   hl, wAddHealthBuffer                     ;; 03:64B9 $21 $93 $DB

jr_003_64BC:
    add  [hl]                                     ;; 03:64BC $86
    ld   [hl], a                                  ;; 03:64BD $77
    ret                                           ;; 03:64BE $C9

PickDroppableRupee::
    ld   a, $01                                   ;; 03:64BF $3E $01
    ld   hl, wAddRupeeBufferLow                   ;; 03:64C1 $21 $90 $DB
    jr   jr_003_64BC                              ;; 03:64C4 $18 $F6

PickDroppableFairy::
    ld   a, $30                                   ;; 03:64C6 $3E $30
    jr   jr_003_64B9                              ;; 03:64C8 $18 $EF

; Create a new active entity in the last available slot
; Inputs:
;   a:   entity type
;   b:   0
;   c:   entity index
; Outputs:
;   c:   set the carry flag if no slots were available
SpawnNewEntity::
    ; Enumerate all entities (starting from the last one)
    ld   e, MAX_ENTITIES - 1                      ;; 03:64CA $1E $0F

; Create a new active entity in the last available slot starting from E?
; Inputs:
;   a:   entity type
;   bc:  ???
;   e:   index of slot to start the search from
; Outputs:
;   c:   set the carry flag if no slots were available
SpawnNewEntityInRange::
    push af                                       ;; 03:64CC $F5
    ld   d, $00                                   ;; 03:64CD $16 $00

    ; For each entity slot:
.loop
    ; Find an available (i.e. disabled) entity slot
    ld   hl, wEntitiesStatusTable                 ;; 03:64CF $21 $80 $C2
    add  hl, de                                   ;; 03:64D2 $19
    ld   a, [hl]                                  ;; 03:64D3 $7E
    and  a                                        ;; 03:64D4 $A7
    jr   z, .entitySlotIsAvailable                ;; 03:64D5 $28 $09

    ; Loop down until slot 0 is reached
    dec  e                                        ;; 03:64D7 $1D
    ld   a, e                                     ;; 03:64D8 $7B
    cp   $FF                                      ;; 03:64D9 $FE $FF
    jr   nz, .loop                                ;; 03:64DB $20 $F2

    ; No available slot was found:
    ; set the carry flag and return.
    pop  af                                       ;; 03:64DD $F1
    scf                                           ;; 03:64DE $37
    ret                                           ;; 03:64DF $C9

.entitySlotIsAvailable
    ; Mark the new entity as active
    ld   [hl], ENTITY_STATUS_ACTIVE               ;; 03:64E0 $36 $05

    ; Set the entity type
    pop  af                                       ;; 03:64E2 $F1
    ld   hl, wEntitiesTypeTable                   ;; 03:64E3 $21 $A0 $C3
    add  hl, de                                   ;; 03:64E6 $19
    ld   [hl], a                                  ;; 03:64E7 $77

    ; hMultiPurpose0 = previous entity pos X
    ld   hl, wEntitiesPosXTable                   ;; 03:64E8 $21 $00 $C2
    add  hl, bc                                   ;; 03:64EB $09
    ld   a, [hl]                                  ;; 03:64EC $7E
    ldh  [hMultiPurpose0], a                      ;; 03:64ED $E0 $D7

    ; hMultiPurpose1 = previous entity pos Y
    ld   hl, wEntitiesPosYTable                   ;; 03:64EF $21 $10 $C2
    add  hl, bc                                   ;; 03:64F2 $09
    ld   a, [hl]                                  ;; 03:64F3 $7E
    ldh  [hMultiPurpose1], a                      ;; 03:64F4 $E0 $D8

    ; hMultiPurpose2 = previous entity wEntitiesDirectionTable
    ld   hl, wEntitiesDirectionTable              ;; 03:64F6 $21 $80 $C3
    add  hl, bc                                   ;; 03:64F9 $09
    ld   a, [hl]                                  ;; 03:64FA $7E
    ldh  [hMultiPurpose2], a                      ;; 03:64FB $E0 $D9

    ; hMultiPurpose3 = previous entity pos Z
    ld   hl, wEntitiesPosZTable                   ;; 03:64FD $21 $10 $C3
    add  hl, bc                                   ;; 03:6500 $09
    ld   a, [hl]                                  ;; 03:6501 $7E
    ldh  [hMultiPurpose3], a                      ;; 03:6502 $E0 $DA

    call ConfigureNewEntity_helper                ;; 03:6504 $CD $24 $65

    ; entity's wEntitiesIgnoreHitsCountdownTable   = 1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:6507 $21 $10 $C4
    add  hl, de                                   ;; 03:650A $19
    ld   [hl], $01                                ;; 03:650B $36 $01

    ld   hl, wEntitiesPosXSignTable               ;; 03:650D $21 $20 $C2
    add  hl, bc                                   ;; 03:6510 $09
    ld   a, [hl]                                  ;; 03:6511 $7E
    ld   hl, wEntitiesPosXSignTable               ;; 03:6512 $21 $20 $C2
    add  hl, de                                   ;; 03:6515 $19
    ld   [hl], a                                  ;; 03:6516 $77
    ld   hl, wEntitiesPosYSignTable               ;; 03:6517 $21 $30 $C2
    add  hl, bc                                   ;; 03:651A $09
    ld   a, [hl]                                  ;; 03:651B $7E
    ld   hl, wEntitiesPosYSignTable               ;; 03:651C $21 $30 $C2
    add  hl, de                                   ;; 03:651F $19
    ld   [hl], a                                  ;; 03:6520 $77

    ; An available slot was found:
    ; clear the carry flag and return.
    scf                                           ;; 03:6521 $37
    ccf                                           ;; 03:6522 $3F
    ret                                           ;; 03:6523 $C9

; Helper for calling ConfigureNewEntity, but with the argument in different registers
; Inputs:
;   de   entity index
ConfigureNewEntity_helper::
    push bc                                       ;; 03:6524 $C5
    push de                                       ;; 03:6525 $D5
    ; bc = de
    ld   c, e                                     ;; 03:6526 $4B
    ld   b, d                                     ;; 03:6527 $42
    call ConfigureNewEntity                       ;; 03:6528 $CD $5B $48
    ; Restore bc and de
    pop  de                                       ;; 03:652B $D1
    pop  bc                                       ;; 03:652C $C1
    ret                                           ;; 03:652D $C9

include "code/entities/03_bomb.asm"

Data_003_69A2::
    db   $6C, $74, $6D, $75, $00, $00, $00, $00   ;; 03:69A2

include "code/entities/03_magic_rod_fireball.asm"

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
OctorokRockSpriteVariants::
.variant0
    db $6C, $01
    db $6C, $21
.variant1
    db $5C, $01
    db $5C, $21

OctorokRockEntityHandler::
    call GetEntityTransitionCountdown             ;; 03:6A26 $CD $05 $0C
    jr   nz, .jr_6A2E                             ;; 03:6A29 $20 $03

    call CheckLinkCollisionWithProjectile         ;; 03:6A2B $CD $DE $6B

.jr_6A2E
    ld   de, OctorokRockSpriteVariants            ;; 03:6A2E $11 $1E $6A
    jp   RenderActiveEntitySpritesPairSubcall     ;; 03:6A31 $C3 $D7 $6A

include "code/entities/03_arrow.asm"

Data_003_6A66::
    db   $80, $15

Data_003_6A68::
    db   $04, $FC, $00, $00

Data_003_6A6C::
    db   $FE, $FE, $FA, $04

func_003_6A70::
    call GetEntityTransitionCountdown             ;; 03:6A70 $CD $05 $0C
    jr   z, jr_003_6A96                           ;; 03:6A73 $28 $21

    ld   a, ENTITY_BOMB                           ;; 03:6A75 $3E $02
    call SpawnNewEntity                           ;; 03:6A77 $CD $CA $64
    jr   c, .jr_6A93                              ;; 03:6A7A $38 $17

    ldh  a, [hMultiPurpose0]                      ;; 03:6A7C $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 03:6A7E $21 $00 $C2
    add  hl, de                                   ;; 03:6A81 $19
    ld   [hl], a                                  ;; 03:6A82 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:6A83 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:6A85 $21 $10 $C2
    add  hl, de                                   ;; 03:6A88 $19
    ld   [hl], a                                  ;; 03:6A89 $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:6A8A $21 $E0 $C2
    add  hl, de                                   ;; 03:6A8D $19
    ld   [hl], $17                                ;; 03:6A8E $36 $17
    call PlayBombExplosionSfx                     ;; 03:6A90 $CD $4B $0C

.jr_6A93
    jp   UnloadEntityAndReturn                    ;; 03:6A93 $C3 $8D $3F

jr_003_6A96:
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:6A96 $F0 $F1
    push af                                       ;; 03:6A98 $F5
    ld   e, a                                     ;; 03:6A99 $5F
    ld   d, b                                     ;; 03:6A9A $50
    xor  a                                        ;; 03:6A9B $AF
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:6A9C $E0 $F1
    ld   hl, Data_003_6A68                        ;; 03:6A9E $21 $68 $6A
    add  hl, de                                   ;; 03:6AA1 $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:6AA2 $F0 $EE
    add  [hl]                                     ;; 03:6AA4 $86
    ldh  [hActiveEntityPosX], a                   ;; 03:6AA5 $E0 $EE
    ld   hl, Data_003_6A6C                        ;; 03:6AA7 $21 $6C $6A
    add  hl, de                                   ;; 03:6AAA $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:6AAB $F0 $EC
    add  [hl]                                     ;; 03:6AAD $86
    ldh  [hActiveEntityVisualPosY], a             ;; 03:6AAE $E0 $EC
    ld   de, Data_003_6A66                        ;; 03:6AB0 $11 $66 $6A
    call RenderActiveEntitySprite                 ;; 03:6AB3 $CD $77 $3C
    call CopyEntityPositionToActivePosition       ;; 03:6AB6 $CD $8A $3D
    pop  af                                       ;; 03:6AB9 $F1
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:6ABA $E0 $F1
    ld   de, EntityMoblinArrowSpriteVariants      ;; 03:6ABC $11 $C6 $6B
    call RenderActiveEntitySpritesPair            ;; 03:6ABF $CD $C0 $3B
    ld   a, $0C                                   ;; 03:6AC2 $3E $0C
    ld   [wC19E], a                               ;; 03:6AC4 $EA $9E $C1
    call func_003_75A2                            ;; 03:6AC7 $CD $A2 $75
    jr   jr_003_6ADA                              ;; 03:6ACA $18 $0E

MoblinArrowEntityHandler::
    call GetEntityTransitionCountdown             ;; 03:6ACC $CD $05 $0C
    jr   nz, LoadMobilArrowSpriteVariants         ;; 03:6ACF $20 $03

    call CheckLinkCollisionWithProjectile         ;; 03:6AD1 $CD $DE $6B

LoadMobilArrowSpriteVariants::
    ld   de, EntityMoblinArrowSpriteVariants      ;; 03:6AD4 $11 $C6 $6B

RenderActiveEntitySpritesPairSubcall::
    call RenderActiveEntitySpritesPair            ;; 03:6AD7 $CD $C0 $3B

jr_003_6ADA:
    call ReturnIfNonInteractive_03                ;; 03:6ADA $CD $78 $7F
    call GetEntityTransitionCountdown             ;; 03:6ADD $CD $05 $0C
    jr   nz, func_003_6B48                        ;; 03:6AE0 $20 $6A

    call UpdateEntityPosWithSpeed_03              ;; 03:6AE2 $CD $25 $7F
    call ApplySwordIntersectionWithObjects        ;; 03:6AE5 $CD $AB $7C
    ld   hl, wEntitiesCollisionsTable             ;; 03:6AE8 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6AEB $09
    ld   a, [hl]                                  ;; 03:6AEC $7E
    and  a                                        ;; 03:6AED $A7
    jr   z, ret_003_6B42                          ;; 03:6AEE $28 $52

    call GetEntityTransitionCountdown             ;; 03:6AF0 $CD $05 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:6AF3 $F0 $EB
    cp   ENTITY_MAGIC_ROD_FIREBALL                ;; 03:6AF5 $FE $04
    jr   nz, .fireballEnd                         ;; 03:6AF7 $20 $06

    call GetEntityPrivateCountdown1               ;; 03:6AF9 $CD $00 $0C
    ld   [hl], $30                                ;; 03:6AFC $36 $30
    ret                                           ;; 03:6AFE $C9
.fireballEnd

    ld   [hl], $18                                ;; 03:6AFF $36 $18
    ld   hl, wEntitiesSpeedZTable                 ;; 03:6B01 $21 $20 $C3
    add  hl, bc                                   ;; 03:6B04 $09
    ld   [hl], $10                                ;; 03:6B05 $36 $10
    ld   hl, wEntitiesCollisionsTable             ;; 03:6B07 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6B0A $09
    ld   a, [hl]                                  ;; 03:6B0B $7E
    inc  a                                        ;; 03:6B0C $3C
    jr   z, .jr_6B13                              ;; 03:6B0D $28 $04

    ld   a, JINGLE_SWORD_POKING                   ;; 03:6B0F $3E $07
    ldh  [hJingle], a                             ;; 03:6B11 $E0 $F2

.jr_6B13
    call func_C50                                 ;; 03:6B13 $CD $50 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:6B16 $F0 $EB
    cp   ENTITY_ARROW                             ;; 03:6B18 $FE $00
    jr   nz, jr_003_6B31                          ;; 03:6B1A $20 $15

    call func_003_6B2C                            ;; 03:6B1C $CD $2C $6B
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6B1F $21 $40 $C2

jr_003_6B22:
    add  hl, bc                                   ;; 03:6B22 $09
    ld   a, [hl]                                  ;; 03:6B23 $7E
    cpl                                           ;; 03:6B24 $2F
    inc  a                                        ;; 03:6B25 $3C
    sra  a                                        ;; 03:6B26 $CB $2F
    sra  a                                        ;; 03:6B28 $CB $2F
    ld   [hl], a                                  ;; 03:6B2A $77
    ret                                           ;; 03:6B2B $C9

func_003_6B2C::
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6B2C $21 $50 $C2
    jr   jr_003_6B22                              ;; 03:6B2F $18 $F1

jr_003_6B31:
    call func_003_6B43                            ;; 03:6B31 $CD $43 $6B

func_003_6B34::
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6B34 $21 $40 $C2

jr_003_6B37:
    add  hl, bc                                   ;; 03:6B37 $09
    ld   a, [hl]                                  ;; 03:6B38 $7E
    cpl                                           ;; 03:6B39 $2F
    inc  a                                        ;; 03:6B3A $3C
    sra  a                                        ;; 03:6B3B $CB $2F
    sra  a                                        ;; 03:6B3D $CB $2F
    sra  a                                        ;; 03:6B3F $CB $2F
    ld   [hl], a                                  ;; 03:6B41 $77

ret_003_6B42:
    ret                                           ;; 03:6B42 $C9

func_003_6B43::
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6B43 $21 $50 $C2
    jr   jr_003_6B37                              ;; 03:6B46 $18 $EF

Data_003_6B48::
    db   $00, $03, $01, $02

func_003_6B48:
    cp   $01                                      ;; 03:6B4C $FE $01
IF __OPTIMIZATIONS_3__
    jp   z, UnloadEntityAndReturn
ELSE
    jr   nz, .jr_6B53                             ;; 03:6B4E $20 $03
    jp   UnloadEntityAndReturn                    ;; 03:6B50 $C3 $8D $3F
ENDC

.jr_6B53
    ldh  a, [hActiveEntityType]                   ;; 03:6B53 $F0 $EB
    cp   ENTITY_OCTOROK_ROCK                      ;; 03:6B55 $FE $0A
    jr   z, .octorokRockEnd                       ;; 03:6B57 $28 $15

    call GetEntityTransitionCountdown             ;; 03:6B59 $CD $05 $0C
    srl  a                                        ;; 03:6B5C $CB $3F
    srl  a                                        ;; 03:6B5E $CB $3F
    srl  a                                        ;; 03:6B60 $CB $3F
    and  $03                                      ;; 03:6B62 $E6 $03
    ld   e, a                                     ;; 03:6B64 $5F
    ld   d, b                                     ;; 03:6B65 $50
    ld   hl, Data_003_6B48                        ;; 03:6B66 $21 $48 $6B
    add  hl, de                                   ;; 03:6B69 $19
    ld   a, [hl]                                  ;; 03:6B6A $7E
    call SetEntitySpriteVariant                   ;; 03:6B6B $CD $0C $3B
.octorokRockEnd

    call UpdateEntityPosWithSpeed_03              ;; 03:6B6E $CD $25 $7F
    jr   func_003_6B7B                            ;; 03:6B71 $18 $08

Data_003_6B73::
    db   $02, $01, $02, $02

Data_003_6B77::
    db   $40, $08, $40, $40

; Apply gravity and, if underwater in a sidescrolling section, reduce horizontal speed
func_003_6B7B::
    ldh  a, [hIsSideScrolling]                    ;; 03:6B7B $F0 $F9
    and  a                                        ;; 03:6B7D $A7
    jr   nz, .sideScrolling                       ;; 03:6B7E $20 $0C

    call AddEntityZSpeedToPos_03                  ;; 03:6B80 $CD $5E $7F
    ld   hl, wEntitiesSpeedZTable                 ;; 03:6B83 $21 $20 $C3
    add  hl, bc                                   ;; 03:6B86 $09
    ld   a, [hl]                                  ;; 03:6B87 $7E
    sub  $02                                      ;; 03:6B88 $D6 $02
    ld   [hl], a                                  ;; 03:6B8A $77
    ret                                           ;; 03:6B8B $C9

.sideScrolling
    ld   hl, wEntitiesGroundStatusTable           ;; 03:6B8C $21 $70 $C4
    add  hl, bc                                   ;; 03:6B8F $09
    ld   a, [hl]                                  ;; 03:6B90 $7E
    ld   e, a                                     ;; 03:6B91 $5F
    ld   d, b                                     ;; 03:6B92 $50
    and  a                                        ;; 03:6B93 $A7
    jr   z, .updateXSpeedEnd                      ;; 03:6B94 $28 $15

    ldh  a, [hFrameCounter]                       ;; 03:6B96 $F0 $E7
    and  $07                                      ;; 03:6B98 $E6 $07
    jr   nz, .updateXSpeedEnd                     ;; 03:6B9A $20 $0F

    ld   hl, wEntitiesSpeedXTable                 ;; 03:6B9C $21 $40 $C2
    add  hl, bc                                   ;; 03:6B9F $09
    ld   a, [hl]                                  ;; 03:6BA0 $7E
    and  a                                        ;; 03:6BA1 $A7
    jr   z, .updateXSpeedEnd                      ;; 03:6BA2 $28 $07

    and  $80                                      ;; 03:6BA4 $E6 $80
    jr   z, .positiveDifferenceX                  ;; 03:6BA6 $28 $02

; get here every 8 frames, if underwater and X speed is not 0
    inc  [hl]                                     ;; 03:6BA8 $34
    inc  [hl]                                     ;; 03:6BA9 $34

.positiveDifferenceX
    dec  [hl]                                     ;; 03:6BAA $35

.updateXSpeedEnd
    ld   hl, Data_003_6B73                        ;; 03:6BAB $21 $73 $6B
    add  hl, de                                   ;; 03:6BAE $19
    ld   a, [hl]                                  ;; 03:6BAF $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6BB0 $21 $50 $C2
    add  hl, bc                                   ;; 03:6BB3 $09
    add  [hl]                                     ;; 03:6BB4 $86
    ld   [hl], a                                  ;; 03:6BB5 $77
    ld   hl, Data_003_6B77                        ;; 03:6BB6 $21 $77 $6B
    add  hl, de                                   ;; 03:6BB9 $19
    sub  [hl]                                     ;; 03:6BBA $96
    and  $80                                      ;; 03:6BBB $E6 $80
    jr   nz, .return                              ;; 03:6BBD $20 $06

    ld   a, [hl]                                  ;; 03:6BBF $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6BC0 $21 $50 $C2
    add  hl, bc                                   ;; 03:6BC3 $09
    ld   [hl], a                                  ;; 03:6BC4 $77

.return
    ret                                           ;; 03:6BC5 $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
EntityMoblinArrowSpriteVariants::
.variant0
    db $2E, $21
    db $2C, $21
.variant1
    db $2C, $01
    db $2E, $01
.variant2
    db $2A, $41
    db $2A, $61
.variant3
    db $2A, $01
    db $2A, $21

; For a given direction, get the opposite direction
ReversedDirectionsTable::
.right: db DIRECTION_LEFT
.left:  db DIRECTION_RIGHT
.up:    db DIRECTION_DOWN
.down:  db DIRECTION_UP

; Array indexed by Link direction
Data_003_6BDA::
.right: db $02
.left:  db $0A
.up:    db $0E
.down:  db $06

; Check the collision of the active entity (an enemy projectile) with Link.
; If the entity is collisioning, handle whether Link has its shield up or not.
CheckLinkCollisionWithProjectile::
    ; If Link is not interactive, return.
    ld   a, [wLinkMotionState]                    ;; 03:6BDE $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 03:6BE1 $FE $02
    jr   nc, .return                              ;; 03:6BE3 $30 $75

    ; If Link is in the air, return.
    ldh  a, [hLinkPositionZ]                      ;; 03:6BE5 $F0 $A2
    and  a                                        ;; 03:6BE7 $A7
    jr   nz, .return                              ;; 03:6BE8 $20 $70

    ; If Link is not touching the entity, return.
    ld   hl, hActiveEntityPosX                    ;; 03:6BEA $21 $EE $FF
    ldh  a, [hLinkPositionX]                      ;; 03:6BED $F0 $98
    sub  [hl]                                     ;; 03:6BEF $96
    add  $06                                      ;; 03:6BF0 $C6 $06
    cp   $0C                                      ;; 03:6BF2 $FE $0C
    jr   nc, .return                              ;; 03:6BF4 $30 $64

    ld   hl, hActiveEntityVisualPosY              ;; 03:6BF6 $21 $EC $FF
    ldh  a, [hLinkPositionY]                      ;; 03:6BF9 $F0 $99
    sub  [hl]                                     ;; 03:6BFB $96
    add  $06                                      ;; 03:6BFC $C6 $06
    cp   $0C                                      ;; 03:6BFE $FE $0C
    jr   nc, .return                              ;; 03:6C00 $30 $58

    ;
    ; Check shield usage
    ;

    ld   a, [wIsUsingShield]                      ;; 03:6C02 $FA $5B $C1
    and  a                                        ;; 03:6C05 $A7
    jr   z, .shieldEnd                            ;; 03:6C06 $28 $53

    ; Special case: laser beam against mirror shield

    ldh  a, [hActiveEntityType]                   ;; 03:6C08 $F0 $EB
    cp   ENTITY_LASER_BEAM                        ;; 03:6C0A $FE $2B
    jr   nz, .laserBeamEnd                        ;; 03:6C0C $20 $33

    ld   a, [wShieldLevel]                        ;; 03:6C0E $FA $44 $DB
    cp   $02                                      ;; 03:6C11 $FE $02
    jr   c, .shieldEnd                            ;; 03:6C13 $38 $46

    ldh  a, [hLinkDirection]                      ;; 03:6C15 $F0 $9E
    ld   e, a                                     ;; 03:6C17 $5F
    ld   d, b                                     ;; 03:6C18 $50
    ld   hl, Data_003_6BDA                        ;; 03:6C19 $21 $DA $6B
    add  hl, de                                   ;; 03:6C1C $19
    ld   e, [hl]                                  ;; 03:6C1D $5E
    ld   hl, wEntitiesDirectionTable              ;; 03:6C1E $21 $80 $C3
    add  hl, bc                                   ;; 03:6C21 $09
    ld   a, [hl]                                  ;; 03:6C22 $7E
    sub  e                                        ;; 03:6C23 $93
    and  $0F                                      ;; 03:6C24 $E6 $0F
    cp   $05                                      ;; 03:6C26 $FE $05
    jr   nc, .shieldEnd                           ;; 03:6C28 $30 $31

    ld   hl, wEntitiesCollisionsTable             ;; 03:6C2A $21 $A0 $C2
    add  hl, bc                                   ;; 03:6C2D $09
    ld   [hl], $02                                ;; 03:6C2E $36 $02

    ld   a, JINGLE_SWORD_POKING                   ;; 03:6C30 $3E $07
    ldh  [hJingle], a                             ;; 03:6C32 $E0 $F2

    ldh  a, [hActiveEntityPosY]                   ;; 03:6C34 $F0 $EF
.showSwordPokeVfx
    ldh  [hMultiPurpose1], a                      ;; 03:6C36 $E0 $D8
    ldh  a, [hActiveEntityPosX]                   ;; 03:6C38 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 03:6C3A $E0 $D7
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 03:6C3C $3E $05
    jp   AddTranscientVfx                         ;; 03:6C3E $C3 $C7 $0C

.laserBeamEnd

    ; If the entity is in a direction opposite to Link's direction…
    ld   hl, wEntitiesDirectionTable              ;; 03:6C41 $21 $80 $C3
    add  hl, bc                                   ;; 03:6C44 $09
    ld   e, [hl]                                  ;; 03:6C45 $5E
    ld   d, b                                     ;; 03:6C46 $50
    ld   hl, ReversedDirectionsTable              ;; 03:6C47 $21 $D6 $6B
    add  hl, de                                   ;; 03:6C4A $19
    ldh  a, [hLinkDirection]                      ;; 03:6C4B $F0 $9E
    cp   [hl]                                     ;; 03:6C4D $BE
    jr   nz, .shieldEnd                           ;; 03:6C4E $20 $0B

    ; Play the "a projectile hits the shield" sound
    ld   a, JINGLE_SHIELD_TING                    ;; 03:6C50 $3E $16
    ldh  [hJingle], a                             ;; 03:6C52 $E0 $F2

.jr_003_6C54
    ld   hl, wEntitiesCollisionsTable             ;; 03:6C54 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6C57 $09
    ld   [hl], $FF                                ;; 03:6C58 $36 $FF

.return
    ret                                           ;; 03:6C5A $C9

.shieldEnd
    ; Does a lot of stuff!
    call func_003_6CC0                            ;; 03:6C5B $CD $C0 $6C

    ldh  a, [hActiveEntityType]                   ;; 03:6C5E $F0 $EB
    cp   ENTITY_LASER_BEAM                        ;; 03:6C60 $FE $2B
    jr   z, .jr_003_6C68                          ;; 03:6C62 $28 $04

    cp   ENTITY_MOBLIN_ARROW                      ;; 03:6C64 $FE $0C
    jr   nz, .jr_003_6C54                         ;; 03:6C66 $20 $EC

.jr_003_6C68
    jp   UnloadEntityAndReturn                    ;; 03:6C68 $C3 $8D $3F

func_003_6C6B::
    ldh  a, [hFrameCounter]                       ;; 03:6C6B $F0 $E7
    xor  c                                        ;; 03:6C6D $A9
    rra                                           ;; 03:6C6E $1F
    jp   nc, jr_003_6CCB                          ;; 03:6C6F $D2 $CB $6C

; Check if Link is collisioning with an enemy entity.
; If so, apply eventual damages.
;
; Inputs:
;   bc  entity index
CheckLinkCollisionWithEnemy::
    ; If Link is in the air, skip the collision check
    ldh  a, [hLinkPositionZ]                      ;; 03:6C72 $F0 $A2
    and  a                                        ;; 03:6C74 $A7
    jr   nz, CheckLinkCollisionWithProjectile.return ;; 03:6C75 $20 $E3

.collisionEvenInTheAir
    ; If Link is not interactive, return.
    ld   a, [wLinkMotionState]                    ;; 03:6C77 $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 03:6C7A $FE $02
    jr   nc, CheckLinkCollisionWithProjectile.return ;; 03:6C7C $30 $DC

    push bc                                       ;; 03:6C7E $C5
    ; c = (entity index * 4)
    sla  c                                        ;; 03:6C7F $CB $21
    sla  c                                        ;; 03:6C81 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 03:6C83 $21 $80 $D5
    add  hl, bc                                   ;; 03:6C86 $09
    pop  bc                                       ;; 03:6C87 $C1
    ; hActiveEntityPosX + wEntitiesHitboxPositionTable[c + 0]
    ldh  a, [hActiveEntityPosX]                   ;; 03:6C88 $F0 $EE
    add  [hl]                                     ;; 03:6C8A $86
    push hl                                       ;; 03:6C8B $E5
    ld   hl, hLinkPositionX                       ;; 03:6C8C $21 $98 $FF
    sub  [hl]                                     ;; 03:6C8F $96
    sub  $08                                      ;; 03:6C90 $D6 $08
    cp   $80                                      ;; 03:6C92 $FE $80
    jr   c, .jr_6C98                              ;; 03:6C94 $38 $02

    cpl                                           ;; 03:6C96 $2F
    inc  a                                        ;; 03:6C97 $3C

.jr_6C98
    pop  hl                                       ;; 03:6C98 $E1
    push af                                       ;; 03:6C99 $F5
    inc  hl                                       ;; 03:6C9A $23
    ld   a, $04                                   ;; 03:6C9B $3E $04
    add  [hl]                                     ;; 03:6C9D $86
    ld   e, a                                     ;; 03:6C9E $5F
    pop  af                                       ;; 03:6C9F $F1
    cp   e                                        ;; 03:6CA0 $BB
    jp   nc, jr_003_6CCB                          ;; 03:6CA1 $D2 $CB $6C

    inc  hl                                       ;; 03:6CA4 $23
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:6CA5 $F0 $EC
    add  [hl]                                     ;; 03:6CA7 $86
    push hl                                       ;; 03:6CA8 $E5
    ld   hl, hLinkPositionY                       ;; 03:6CA9 $21 $99 $FF
    sub  [hl]                                     ;; 03:6CAC $96
    sub  $08                                      ;; 03:6CAD $D6 $08
    cp   $80                                      ;; 03:6CAF $FE $80
    jr   c, .jr_6CB5                              ;; 03:6CB1 $38 $02

    cpl                                           ;; 03:6CB3 $2F
    inc  a                                        ;; 03:6CB4 $3C

.jr_6CB5
    pop  hl                                       ;; 03:6CB5 $E1
    push af                                       ;; 03:6CB6 $F5
    inc  hl                                       ;; 03:6CB7 $23
    ld   a, $04                                   ;; 03:6CB8 $3E $04
    add  [hl]                                     ;; 03:6CBA $86
    ld   e, a                                     ;; 03:6CBB $5F
    pop  af                                       ;; 03:6CBC $F1
    cp   e                                        ;; 03:6CBD $BB
    jr   nc, jr_003_6CCB                          ;; 03:6CBE $30 $0B

func_003_6CC0::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:6CC0 $21 $40 $C3
    add  hl, bc                                   ;; 03:6CC3 $09
    ld   a, [hl]                                  ;; 03:6CC4 $7E
    and  ENTITY_PHYSICS_HARMLESS                  ;; 03:6CC5 $E6 $80
    jr   z, jr_003_6CCD                           ;; 03:6CC7 $28 $04

jr_003_6CC9:
    scf                                           ;; 03:6CC9 $37
    ret                                           ;; 03:6CCA $C9

jr_003_6CCB:
    and  a                                        ;; 03:6CCB $A7
    ret                                           ;; 03:6CCC $C9

jr_003_6CCD:
    ldh  a, [hLinkAnimationState]                 ;; 03:6CCD $F0 $9D
    sub  $4E                                      ;; 03:6CCF $D6 $4E
    cp   $02                                      ;; 03:6CD1 $FE $02
    jr   c, jr_003_6CC9                           ;; 03:6CD3 $38 $F4

; Handle collision between Link and the active entity.
; This will most of the case results in damages being applied to Link.
ApplyLinkCollisionWithEnemy::
    ;
    ; Special case when a cheep-cheep hurts Link
    ;

    ldh  a, [hActiveEntityType]                   ;; 03:6CD5 $F0 $EB
    cp   ENTITY_CHEEP_CHEEP_JUMPING               ;; 03:6CD7 $FE $AC
    jr   nz, .cheepCheepEnd                       ;; 03:6CD9 $20 $1E

    call GetEntityYDistanceToLink_03              ;; 03:6CDB $CD $E9 $7E
    ld   a, e                                     ;; 03:6CDE $7B
    cp   $02                                      ;; 03:6CDF $FE $02
    jr   nz, .goombaEnd                           ;; 03:6CE1 $20 $5A

    call IncrementEntityState                     ;; 03:6CE3 $CD $12 $3B
    ld   [hl], ENTITY_STATUS_ACTIVE               ;; 03:6CE6 $36 $05
    ld   a, $02                                   ;; 03:6CE8 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 03:6CEA $EA $46 $C1
    ld   a, $F0                                   ;; 03:6CED $3E $F0
    ldh  [hLinkSpeedY], a                         ;; 03:6CEF $E0 $9B
    call ClearEntitySpeed                         ;; 03:6CF1 $CD $7F $3D
    ld   a, WAVE_SFX_FLOOR_SWITCH                 ;; 03:6CF4 $3E $0E
    ldh  [hWaveSfx], a                            ;; 03:6CF6 $E0 $F3
    ret                                           ;; 03:6CF8 $C9
.cheepCheepEnd

    ;
    ; Special case when a Goomba hurts Link
    ;

    ldh  a, [hActiveEntityType]                   ;; 03:6CF9 $F0 $EB
    cp   ENTITY_GOOMBA                            ;; 03:6CFB $FE $9F
    jr   nz, .goombaEnd                           ;; 03:6CFD $20 $3E

    ld   a, [wIsLinkInTheAir]                     ;; 03:6CFF $FA $46 $C1
    and  a                                        ;; 03:6D02 $A7
    jr   z, .goombaEnd                            ;; 03:6D03 $28 $38

    ldh  a, [hLinkCountdown]                      ;; 03:6D05 $F0 $B7
    and  a                                        ;; 03:6D07 $A7
    jr   nz, .jr_003_6D1B                         ;; 03:6D08 $20 $11

    ldh  a, [hIsSideScrolling]                    ;; 03:6D0A $F0 $F9
    and  a                                        ;; 03:6D0C $A7
    jr   nz, .jr_003_6D15                         ;; 03:6D0D $20 $06

    ldh  a, [hLinkVelocityZ]                      ;; 03:6D0F $F0 $A3
    xor  $80                                      ;; 03:6D11 $EE $80
    jr   .jr_003_6D17                             ;; 03:6D13 $18 $02

.jr_003_6D15
    ldh  a, [hLinkSpeedY]                         ;; 03:6D15 $F0 $9B

.jr_003_6D17
    and  $80                                      ;; 03:6D17 $E6 $80
    jr   nz, .goombaEnd                           ;; 03:6D19 $20 $22

.jr_003_6D1B
    ld   a, $02                                   ;; 03:6D1B $3E $02
    ldh  [hLinkCountdown], a                      ;; 03:6D1D $E0 $B7
    ld   hl, wEntitiesStateTable                  ;; 03:6D1F $21 $90 $C2
    add  hl, bc                                   ;; 03:6D22 $09
    ld   [hl], $02                                ;; 03:6D23 $36 $02
    call GetEntityTransitionCountdown             ;; 03:6D25 $CD $05 $0C
    ld   [hl], $30                                ;; 03:6D28 $36 $30
    ld   a, WAVE_SFX_FLOOR_SWITCH                 ;; 03:6D2A $3E $0E
    ldh  [hWaveSfx], a                            ;; 03:6D2C $E0 $F3
    ldh  a, [hIsSideScrolling]                    ;; 03:6D2E $F0 $F9
    and  a                                        ;; 03:6D30 $A7
    jr   nz, .jr_003_6D38                         ;; 03:6D31 $20 $05

    ld   a, $10                                   ;; 03:6D33 $3E $10
    ldh  [hLinkVelocityZ], a                      ;; 03:6D35 $E0 $A3
    ret                                           ;; 03:6D37 $C9

.jr_003_6D38
    ld   a, $F0                                   ;; 03:6D38 $3E $F0
    ldh  [hLinkSpeedY], a                         ;; 03:6D3A $E0 $9B
    ret                                           ;; 03:6D3C $C9
.goombaEnd

    ;
    ; Special case when Link collides with a Gel

    ldh  a, [hActiveEntityType]                   ;; 03:6D3D $F0 $EB
    cp   ENTITY_GEL                               ;; 03:6D3F $FE $1C
    jr   nz, .gelEnd                              ;; 03:6D41 $20 $0B

    call GetEntityTransitionCountdown             ;; 03:6D43 $CD $05 $0C
    ld   [hl], $80                                ;; 03:6D46 $36 $80
    call IncrementEntityState                     ;; 03:6D48 $CD $12 $3B
    ld   [hl], $04                                ;; 03:6D4B $36 $04
    ret                                           ;; 03:6D4D $C9
.gelEnd

    cp   ENTITY_CUE_BALL                          ;; 03:6D4E $FE $8E
    jr   z, .jr_6D5D                              ;; 03:6D50 $28 $0B

    cp   ENTITY_ROLLING_BONES_BAR                 ;; 03:6D52 $FE $82
    jr   z, .jr_6D5D                              ;; 03:6D54 $28 $07

    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 03:6D56 $FA $3E $C1
    and  a                                        ;; 03:6D59 $A7
    jp   nz, setCarryAndReturn                    ;; 03:6D5A $C2 $0A $6E

.jr_6D5D
    ldh  a, [hActiveEntityType]                   ;; 03:6D5D $F0 $EB
    cp   ENTITY_MOBLIN_KING                       ;; 03:6D5F $FE $E4
    jr   nz, .jr_6D73                             ;; 03:6D61 $20 $10

    ldh  a, [hActiveEntityState]                  ;; 03:6D63 $F0 $F0
    cp   $04                                      ;; 03:6D65 $FE $04
    jr   nz, .jr_6D73                             ;; 03:6D67 $20 $0A

    call IncrementEntityState                     ;; 03:6D69 $CD $12 $3B
    ld   [hl], $08                                ;; 03:6D6C $36 $08
    ld   a, WAVE_SFX_LINK_HURT                    ;; 03:6D6E $3E $03
    ldh  [hWaveSfx], a                            ;; 03:6D70 $E0 $F3
    ret                                           ;; 03:6D72 $C9

.jr_6D73
    ld   a, [wInvincibilityCounter]               ;; 03:6D73 $FA $C7 $DB
    ld   hl, wC1C6                                ;; 03:6D76 $21 $C6 $C1
    or   [hl]                                     ;; 03:6D79 $B6
    ld   hl, wLinkPlayingOcarinaCountdown         ;; 03:6D7A $21 $66 $C1
    or   [hl]                                     ;; 03:6D7D $B6
    ld   hl, wDialogGotItem                       ;; 03:6D7E $21 $A9 $C1
    or   [hl]                                     ;; 03:6D81 $B6
    jp   nz, setCarryAndReturn                    ;; 03:6D82 $C2 $0A $6E

    ld   a, WAVE_SFX_LINK_HURT                    ;; 03:6D85 $3E $03
    ldh  [hWaveSfx], a                            ;; 03:6D87 $E0 $F3

    ; Get the nominal amount of damages this entity deals
    ld   hl, wEntitiesHealthGroup                 ;; 03:6D89 $21 $D0 $C4
    add  hl, bc                                   ;; 03:6D8C $09
    ld   d, b                                     ;; 03:6D8D $50
    ld   e, [hl]                                  ;; 03:6D8E $5E

    ld   hl, EntityDamagesForGroup                ;; 03:6D8F $21 $F1 $47
    add  hl, de                                   ;; 03:6D92 $19
    ld   e, [hl]                                  ;; 03:6D93 $5E

    ; If using the Blue Tunic, take half damages
    ld   a, [wTunicType]                          ;; 03:6D94 $FA $0F $DC
    cp   TUNIC_BLUE                               ;; 03:6D97 $FE $02
    jr   z, .takeHalfDamages                      ;; 03:6D99 $28 $0E

    ; If having an active Guardian Acorn, take no damages
    ld   a, [wActivePowerUp]                      ;; 03:6D9B $FA $7C $D4
    cp   ACTIVE_POWER_UP_GUARDIAN_ACORN           ;; 03:6D9E $FE $02
    jr   nz, .damageModifiersEnd                  ;; 03:6DA0 $20 $09

    ld   a, e                                     ;; 03:6DA2 $7B
    cp   $04                                      ;; 03:6DA3 $FE $04
    jr   nz, .takeHalfDamages                     ;; 03:6DA5 $20 $02

    ; Take no damages
    ld   e, $00                                   ;; 03:6DA7 $1E $00

.takeHalfDamages
    ; Divide
    srl  e                                        ;; 03:6DA9 $CB $3B
.damageModifiersEnd

    ld   a, [wSubtractHealthBuffer]               ;; 03:6DAB $FA $94 $DB
    add  e                                        ;; 03:6DAE $83
    ld   [wSubtractHealthBuffer], a               ;; 03:6DAF $EA $94 $DB
    ld   a, $50                                   ;; 03:6DB2 $3E $50
    ld   [wInvincibilityCounter], a               ;; 03:6DB4 $EA $C7 $DB
    xor  a                                        ;; 03:6DB7 $AF
    ld   [wGuardianAcornCounter], a               ;; 03:6DB8 $EA $71 $D4
    ld   a, [wActivePowerUp]                      ;; 03:6DBB $FA $7C $D4
    and  a                                        ;; 03:6DBE $A7
    jr   z, func_003_6DDF                         ;; 03:6DBF $28 $1E

    ld   hl, wPowerUpHits                         ;; 03:6DC1 $21 $7A $D4
    inc  [hl]                                     ;; 03:6DC4 $34
    ld   a, [hl]                                  ;; 03:6DC5 $7E
    cp   $03                                      ;; 03:6DC6 $FE $03
    jr   c, func_003_6DDF                         ;; 03:6DC8 $38 $15

    xor  a                                        ;; 03:6DCA $AF
    ld   [wActivePowerUp], a                      ;; 03:6DCB $EA $7C $D4
    ld   a, [wInBossBattle]                       ;; 03:6DCE $FA $BE $C1
    and  a                                        ;; 03:6DD1 $A7
    jr   nz, func_003_6DDF                        ;; 03:6DD2 $20 $0B

    ldh  a, [hDefaultMusicTrack]                  ;; 03:6DD4 $F0 $B0
    cp   MUSIC_OWL                                ;; 03:6DD6 $FE $22
    jr   z, .jr_6DDD                              ;; 03:6DD8 $28 $03

    ld   [wMusicTrackToPlay], a                   ;; 03:6DDA $EA $68 $D3

.jr_6DDD
    ldh  [hNextDefaultMusicTrack], a              ;; 03:6DDD $E0 $BF

func_003_6DDF::
    call ResetPegasusBoots                        ;; 03:6DDF $CD $B6 $0C
    ld   a, $10                                   ;; 03:6DE2 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:6DE4 $EA $3E $C1
    ldh  a, [hActiveEntityType]                   ;; 03:6DE7 $F0 $EB
    ld   e, $18                                   ;; 03:6DE9 $1E $18
    cp   ENTITY_ROLLING_BONES_BAR                 ;; 03:6DEB $FE $82
    jp   z, label_003_6FA7                        ;; 03:6DED $CA $A7 $6F

    cp   ENTITY_FACADE                            ;; 03:6DF0 $FE $5A
    jr   nz, .facadeEnd                           ;; 03:6DF2 $20 $06
    ld   hl, wEntitiesCollisionsTable             ;; 03:6DF4 $21 $A0 $C2
    add  hl, bc                                   ;; 03:6DF7 $09
    ld   [hl], $01                                ;; 03:6DF8 $36 $01
.facadeEnd

    cp   ENTITY_MOLDORM                           ;; 03:6DFA $FE $59
    ld   a, $14                                   ;; 03:6DFC $3E $14
    jr   nz, .moldormEnd                          ;; 03:6DFE $20 $02
    ld   a, $18                                   ;; 03:6E00 $3E $18
.moldormEnd

    call func_003_7565                            ;; 03:6E02 $CD $65 $75
    ldh  a, [hIsSideScrolling]                    ;; 03:6E05 $F0 $F9
    and  a                                        ;; 03:6E07 $A7
    jr   nz, jr_003_6E0E                          ;; 03:6E08 $20 $04

setCarryAndReturn:
    scf                                           ;; 03:6E0A $37
    ret                                           ;; 03:6E0B $C9

Data_003_6E0C::
    db   $0C, $F4

jr_003_6E0E:
    ldh  a, [hLinkPhysicsModifier]                ;; 03:6E0E $F0 $9C
    cp   $02                                      ;; 03:6E10 $FE $02
    jr   z, setCarryAndReturn                     ;; 03:6E12 $28 $F6

    call GetEntityXDistanceToLink_03              ;; 03:6E14 $CD $D9 $7E
    ld   d, b                                     ;; 03:6E17 $50
    ld   hl, Data_003_6E0C                        ;; 03:6E18 $21 $0C $6E
    add  hl, de                                   ;; 03:6E1B $19
    ld   a, [hl]                                  ;; 03:6E1C $7E
    ldh  [hLinkSpeedX], a                         ;; 03:6E1D $E0 $9A
    ld   a, $F4                                   ;; 03:6E1F $3E $F4
    ldh  [hLinkSpeedY], a                         ;; 03:6E21 $E0 $9B
    xor  a                                        ;; 03:6E23 $AF
    ldh  [hLinkPhysicsModifier], a                ;; 03:6E24 $E0 $9C
    scf                                           ;; 03:6E26 $37
    ret                                           ;; 03:6E27 $C9

; Handle collision and damages between Link and the active entity.
; This includes the entity being damaged by sword, the position of Link being modified, etc.
DefaultEnemyDamageCollisionHandler::
    call func_003_6C6B                            ;; 03:6E28 $CD $6B $6C

func_003_6E2B::
    ld   a, [wC140]                               ;; 03:6E2B $FA $40 $C1
    cp   $00                                      ;; 03:6E2E $FE $00
    jp   z, label_003_73E6                        ;; 03:6E30 $CA $E6 $73

    ld   hl, wEntitiesFlashCountdownTable         ;; 03:6E33 $21 $20 $C4
    add  hl, bc                                   ;; 03:6E36 $09
    ld   a, [hl]                                  ;; 03:6E37 $7E
    and  a                                        ;; 03:6E38 $A7
    jr   z, .jr_6E40                              ;; 03:6E39 $28 $05

    cp   $18                                      ;; 03:6E3B $FE $18
    jp   c, label_003_73E6                        ;; 03:6E3D $DA $E6 $73

.jr_6E40
    ld   a, [wC1AC]                               ;; 03:6E40 $FA $AC $C1
    and  a                                        ;; 03:6E43 $A7
    jr   z, .jr_6E4B                              ;; 03:6E44 $28 $05

    dec  a                                        ;; 03:6E46 $3D
    cp   c                                        ;; 03:6E47 $B9
    jp   z, label_003_73E6                        ;; 03:6E48 $CA $E6 $73

.jr_6E4B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:6E4B $21 $10 $C4
    add  hl, bc                                   ;; 03:6E4E $09
    ld   a, [hl]                                  ;; 03:6E4F $7E
    and  a                                        ;; 03:6E50 $A7
    jp   nz, label_003_73E6                       ;; 03:6E51 $C2 $E6 $73

    ld   de, hActiveEntityPosX                    ;; 03:6E54 $11 $EE $FF
    push bc                                       ;; 03:6E57 $C5
    sla  c                                        ;; 03:6E58 $CB $21
    sla  c                                        ;; 03:6E5A $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 03:6E5C $21 $80 $D5
    add  hl, bc                                   ;; 03:6E5F $09
    pop  bc                                       ;; 03:6E60 $C1
    ld   a, [de]                                  ;; 03:6E61 $1A
    add  [hl]                                     ;; 03:6E62 $86
    push hl                                       ;; 03:6E63 $E5
    ld   hl, wC140                                ;; 03:6E64 $21 $40 $C1
    sub  [hl]                                     ;; 03:6E67 $96
    cp   $80                                      ;; 03:6E68 $FE $80
    jr   c, .jr_6E6E                              ;; 03:6E6A $38 $02

    cpl                                           ;; 03:6E6C $2F
    inc  a                                        ;; 03:6E6D $3C

.jr_6E6E
    pop  hl                                       ;; 03:6E6E $E1
    push af                                       ;; 03:6E6F $F5
    inc  hl                                       ;; 03:6E70 $23
    ld   a, [wC141]                               ;; 03:6E71 $FA $41 $C1
    add  [hl]                                     ;; 03:6E74 $86
    ld   e, a                                     ;; 03:6E75 $5F
    pop  af                                       ;; 03:6E76 $F1
    cp   e                                        ;; 03:6E77 $BB
    jp   nc, label_003_73E6                       ;; 03:6E78 $D2 $E6 $73

    inc  hl                                       ;; 03:6E7B $23
    push hl                                       ;; 03:6E7C $E5
    ld   de, hActiveEntityVisualPosY              ;; 03:6E7D $11 $EC $FF
    pop  hl                                       ;; 03:6E80 $E1
    ld   a, [de]                                  ;; 03:6E81 $1A
    add  [hl]                                     ;; 03:6E82 $86
    push hl                                       ;; 03:6E83 $E5
    ld   hl, wC142                                ;; 03:6E84 $21 $42 $C1
    sub  [hl]                                     ;; 03:6E87 $96
    cp   $80                                      ;; 03:6E88 $FE $80
    jr   c, .jr_6E8E                              ;; 03:6E8A $38 $02

    cpl                                           ;; 03:6E8C $2F
    inc  a                                        ;; 03:6E8D $3C

.jr_6E8E
    pop  hl                                       ;; 03:6E8E $E1
    push af                                       ;; 03:6E8F $F5
    inc  hl                                       ;; 03:6E90 $23
    ld   a, [wC143]                               ;; 03:6E91 $FA $43 $C1
    add  [hl]                                     ;; 03:6E94 $86
    ld   e, a                                     ;; 03:6E95 $5F
    pop  af                                       ;; 03:6E96 $F1
    cp   e                                        ;; 03:6E97 $BB
    jp   nc, label_003_73E6                       ;; 03:6E98 $D2 $E6 $73

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:6E9B $21 $40 $C3
    add  hl, bc                                   ;; 03:6E9E $09
    ld   a, [hl]                                  ;; 03:6E9F $7E
    and  ENTITY_PHYSICS_GRABBABLE                 ;; 03:6EA0 $E6 $20
    jp   nz, PickableCollectIfNeeded.collect      ;; 03:6EA2 $C2 $11 $63
    ; if sword collision is enabled jump to EnemyCollidedWithSword
    ld   a, [wSwordCollisionEnabled]              ;; 03:6EA5 $FA $B0 $C5
    and  a                                        ;; 03:6EA8 $A7
    jp   nz, EnemyCollidedWithSword               ;; 03:6EA9 $C2 $E8 $6F

    ld   a, [wIsRunningWithPegasusBoots]          ;; 03:6EAC $FA $4A $C1
    ldh  [hIndexOfObjectBelowLink], a             ;; 03:6EAF $E0 $E9
    call ResetPegasusBoots                        ;; 03:6EB1 $CD $B6 $0C

    ldh  a, [hActiveEntityType]                   ;; 03:6EB4 $F0 $EB
    cp   ENTITY_FLAME_SHOOTER                     ;; 03:6EB6 $FE $E2
    jr   nz, .flameShooterEnd                     ;; 03:6EB8 $20 $17

    ld   a, [wShieldLevel]                        ;; 03:6EBA $FA $44 $DB
    cp   $02                                      ;; 03:6EBD $FE $02
    ret  nz                                       ;; 03:6EBF $C0

    ldh  a, [hLinkDirection]                      ;; 03:6EC0 $F0 $9E
    cp   DIRECTION_UP                             ;; 03:6EC2 $FE $02
    ret  nz                                       ;; 03:6EC4 $C0

    ld   a, $04                                   ;; 03:6EC5 $3E $04
    ldh  [hLinkSpeedY], a                         ;; 03:6EC7 $E0 $9B
    ld   a, $08                                   ;; 03:6EC9 $3E $08
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:6ECB $EA $3E $C1
    jp   IncrementEntityState                     ;; 03:6ECE $C3 $12 $3B
.flameShooterEnd

    cp   ENTITY_BOUNCING_BOMBITE                  ;; 03:6ED1 $FE $55
    jr   nz, .bouncingBombiteEnd                  ;; 03:6ED3 $20 $22

    ldh  a, [hActiveEntityState]                  ;; 03:6ED5 $F0 $F0
    cp   $02                                      ;; 03:6ED7 $FE $02
    jp   nz, func_003_6F93                        ;; 03:6ED9 $C2 $93 $6F

    ld   hl, wEntitiesSpeedXTable                 ;; 03:6EDC $21 $40 $C2
    add  hl, bc                                   ;; 03:6EDF $09
    ld   a, [hl]                                  ;; 03:6EE0 $7E
    cpl                                           ;; 03:6EE1 $2F
    inc  a                                        ;; 03:6EE2 $3C
    ld   [hl], a                                  ;; 03:6EE3 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6EE4 $21 $50 $C2
    add  hl, bc                                   ;; 03:6EE7 $09
    ld   a, [hl]                                  ;; 03:6EE8 $7E
    cpl                                           ;; 03:6EE9 $2F
    inc  a                                        ;; 03:6EEA $3C
    ld   [hl], a                                  ;; 03:6EEB $77
    call GetEntityTransitionCountdown             ;; 03:6EEC $CD $05 $0C
    ld   [hl], $40                                ;; 03:6EEF $36 $40
    call GetEntityPrivateCountdown1               ;; 03:6EF1 $CD $00 $0C
    ld   [hl], $08                                ;; 03:6EF4 $36 $08
    ret                                           ;; 03:6EF6 $C9
.bouncingBombiteEnd

    cp   ENTITY_KNIGHT                            ;; 03:6EF7 $FE $51
    jr   nz, jr_003_6F20                          ;; 03:6EF9 $20 $25

    ld   hl, wEntitiesOptions1Table               ;; 03:6EFB $21 $30 $C4
    add  hl, bc                                   ;; 03:6EFE $09
    and  ENTITY_OPT1_SWORD_CLINK_OFF              ;; 03:6EFF $E6 $40
    jp   z, func_003_6F93                         ;; 03:6F01 $CA $93 $6F

label_003_6F04:
    ld   hl, wEntitiesPrivateState1Table          ;; 03:6F04 $21 $B0 $C2
    add  hl, bc                                   ;; 03:6F07 $09
    ld   a, [hl]                                  ;; 03:6F08 $7E
    cpl                                           ;; 03:6F09 $2F
    inc  a                                        ;; 03:6F0A $3C
    ld   [hl], a                                  ;; 03:6F0B $77
    call func_003_6F5C                            ;; 03:6F0C $CD $5C $6F
    call GetEntityPrivateCountdown1               ;; 03:6F0F $CD $00 $0C
    ld   [hl], $0C                                ;; 03:6F12 $36 $0C
    ld   a, $01                                   ;; 03:6F14 $3E $01
    ld   [wC160], a                               ;; 03:6F16 $EA $60 $C1
    ; reset sword charge
    xor  a                                        ;; 03:6F19 $AF
    ld   [wSwordCharge], a                        ;; 03:6F1A $EA $22 $C1
    jp   EnemyCollidedWithSword.label_003_713B    ;; 03:6F1D $C3 $3B $71

jr_003_6F20:
    cp   ENTITY_PAIRODD_PROJECTILE                ;; 03:6F20 $FE $58
    jr   nz, jr_003_6F2A                          ;; 03:6F22 $20 $06

label_003_6F24:
    call func_003_6F93                            ;; 03:6F24 $CD $93 $6F
    jp   CheckLinkCollisionWithProjectile.jr_003_6C54 ;; 03:6F27 $C3 $54 $6C

jr_003_6F2A:
    cp   ENTITY_SPIKED_BEETLE                     ;; 03:6F2A $FE $2C
    jr   nz, jr_003_6F6D                          ;; 03:6F2C $20 $3F

    ld   hl, wEntitiesStateTable                  ;; 03:6F2E $21 $90 $C2
    add  hl, bc                                   ;; 03:6F31 $09
    ld   a, [hl]                                  ;; 03:6F32 $7E
    cp   $03                                      ;; 03:6F33 $FE $03
    jr   z, func_003_6F5C                         ;; 03:6F35 $28 $25

    ld   [hl], $03                                ;; 03:6F37 $36 $03
    ld   hl, wEntitiesSpeedZTable                 ;; 03:6F39 $21 $20 $C3
    add  hl, bc                                   ;; 03:6F3C $09
    ld   [hl], $20                                ;; 03:6F3D $36 $20
    call GetEntityTransitionCountdown             ;; 03:6F3F $CD $05 $0C
    ld   [hl], $FF                                ;; 03:6F42 $36 $FF
    ldh  a, [hLinkDirection]                      ;; 03:6F44 $F0 $9E
    ld   e, a                                     ;; 03:6F46 $5F
    ld   d, b                                     ;; 03:6F47 $50
    ld   hl, Data_003_6F65                        ;; 03:6F48 $21 $65 $6F
    add  hl, de                                   ;; 03:6F4B $19
    ld   a, [hl]                                  ;; 03:6F4C $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:6F4D $21 $40 $C2
    add  hl, bc                                   ;; 03:6F50 $09
    ld   [hl], a                                  ;; 03:6F51 $77
    ld   hl, Data_003_6F69                        ;; 03:6F52 $21 $69 $6F
    add  hl, de                                   ;; 03:6F55 $19
    ld   a, [hl]                                  ;; 03:6F56 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6F57 $21 $50 $C2
    add  hl, bc                                   ;; 03:6F5A $09
    ld   [hl], a                                  ;; 03:6F5B $77

func_003_6F5C::
    call func_003_6F93                            ;; 03:6F5C $CD $93 $6F
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:6F5F $21 $10 $C4
    add  hl, bc                                   ;; 03:6F62 $09
    ld   [hl], b                                  ;; 03:6F63 $70
    ret                                           ;; 03:6F64 $C9

Data_003_6F65::
.right: db  16
.left:  db -16
.up:    db   0
.down:  db   0

Data_003_6F69::
.right: db   0
.left:  db   0
.up:    db -16
.down:  db  16

jr_003_6F6D:
    cp   ENTITY_STAR                              ;; 03:6F6D $FE $9C
    jr   z, .starOrAntiFairy                      ;; 03:6F6F $28 $04

    cp   ENTITY_ANTI_FAIRY                        ;; 03:6F71 $FE $15
    jr   nz, .starOrAntiFairyEnd                  ;; 03:6F73 $20 $19

.starOrAntiFairy
    ldh  a, [hLinkDirection]                      ;; 03:6F75 $F0 $9E
    and  DIRECTION_VERTICAL_MASK                  ;; 03:6F77 $E6 $02
    jr   nz, .jr_003_6F81                         ;; 03:6F79 $20 $06

    ld   hl, wEntitiesSpeedXTable                 ;; 03:6F7B $21 $40 $C2
    add  hl, bc                                   ;; 03:6F7E $09
    jr   .jr_003_6F85                             ;; 03:6F7F $18 $04

.jr_003_6F81
    ld   hl, wEntitiesSpeedYTable                 ;; 03:6F81 $21 $50 $C2
    add  hl, bc                                   ;; 03:6F84 $09

.jr_003_6F85
    ld   a, [hl]                                  ;; 03:6F85 $7E
    cpl                                           ;; 03:6F86 $2F
    inc  a                                        ;; 03:6F87 $3C
    ld   [hl], a                                  ;; 03:6F88 $77
    call func_003_6F93                            ;; 03:6F89 $CD $93 $6F
    ld   [hl], b                                  ;; 03:6F8C $70
    ret                                           ;; 03:6F8D $C9
.starOrAntiFairyEnd

    cp   ENTITY_FACADE                            ;; 03:6F8E $FE $5A
    jp   z, label_003_6F24                        ;; 03:6F90 $CA $24 $6F

func_003_6F93::
    ld   a, JINGLE_BUMP                           ;; 03:6F93 $3E $09
    ldh  [hJingle], a                             ;; 03:6F95 $E0 $F2
    call ResetPegasusBoots                        ;; 03:6F97 $CD $B6 $0C
    ld   a, $0C                                   ;; 03:6F9A $3E $0C
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:6F9C $EA $3E $C1

    ldh  a, [hActiveEntityType]                   ;; 03:6F9F $F0 $EB
    cp   ENTITY_ROLLING_BONES_BAR                 ;; 03:6FA1 $FE $82
    jr   nz, jr_003_6FB9                          ;; 03:6FA3 $20 $14

    ld   e, $10                                   ;; 03:6FA5 $1E $10

label_003_6FA7:
    push de                                       ;; 03:6FA7 $D5
    call GetEntityXDistanceToLink_03              ;; 03:6FA8 $CD $D9 $7E
    ld   a, e                                     ;; 03:6FAB $7B
    and  a                                        ;; 03:6FAC $A7
    pop  de                                       ;; 03:6FAD $D1
    ld   a, e                                     ;; 03:6FAE $7B
    jr   z, .jr_6FB3                              ;; 03:6FAF $28 $02

    cpl                                           ;; 03:6FB1 $2F
    inc  a                                        ;; 03:6FB2 $3C

.jr_6FB3
    ldh  [hLinkSpeedX], a                         ;; 03:6FB3 $E0 $9A
    xor  a                                        ;; 03:6FB5 $AF
    ldh  [hLinkSpeedY], a                         ;; 03:6FB6 $E0 $9B
    ret                                           ;; 03:6FB8 $C9

jr_003_6FB9:
    ld   a, $12                                   ;; 03:6FB9 $3E $12
    call func_003_7565                            ;; 03:6FBB $CD $65 $75
    ld   hl, hIndexOfObjectBelowLink              ;; 03:6FBE $21 $E9 $FF
    ldh  a, [hPressedButtonsMask]                 ;; 03:6FC1 $F0 $CB
    and  $0F                                      ;; 03:6FC3 $E6 $0F
    ld   a, $08                                   ;; 03:6FC5 $3E $08
    or   [hl]                                     ;; 03:6FC7 $B6
    jr   z, ConfigureEntityRecoil                 ;; 03:6FC8 $28 $02

    ld   a, $20                                   ;; 03:6FCA $3E $20

; Make enemy recoil from sword hit.
;
; Inputs:
;   a  amount of recoil
ConfigureEntityRecoil::
    ; Get a vector _towards_ Link of length a
    call GetVectorTowardsLink                     ;; 03:6FCC $CD $45 $7E

    ; Negate the X vector component, and set recoilX
    ldh  a, [hMultiPurpose0]                      ;; 03:6FCF $F0 $D7
    cpl                                           ;; 03:6FD1 $2F
    inc  a                                        ;; 03:6FD2 $3C
    ld   hl, wEntitiesRecoilVelocityY             ;; 03:6FD3 $21 $00 $C4
    add  hl, bc                                   ;; 03:6FD6 $09
    ld   [hl], a                                  ;; 03:6FD7 $77

    ; Negate the Y vector component, and set recoilX
    ldh  a, [hMultiPurpose1]                      ;; 03:6FD8 $F0 $D8
    cpl                                           ;; 03:6FDA $2F
    inc  a                                        ;; 03:6FDB $3C
    ld   hl, wEntitiesRecoilVelocityX             ;; 03:6FDC $21 $F0 $C3
    add  hl, bc                                   ;; 03:6FDF $09
    ld   [hl], a                                  ;; 03:6FE0 $77

    jp   StartIgnoringHitsForEntity               ;; 03:6FE1 $C3 $DB $73

Data_003_6FE4::
.right: db  $00
.left:  db  $01
.up:    db  $02
.down:  db  $03

; Apply the collision between Link's sword and an enemy.
; In most cases, this will result in the enemy being hurt and recoil away from the player.
EnemyCollidedWithSword::
    ; Ignore collisions between the flame shooter and the player sword.
    ldh  a, [hActiveEntityType]                   ;; 03:6FE8 $F0 $EB
    cp   ENTITY_FLAME_SHOOTER                     ;; 03:6FEA $FE $E2
    ret  z                                        ;; 03:6FEC $C8

    ;
    ; Special cases for the Final Nightmare
    ;

    cp   ENTITY_FINAL_NIGHTMARE                   ;; 03:6FED $FE $E6
    jr   nz, .defaultSwordCollision               ;; 03:6FEF $20 $27

    ld   a, [wFinalNightmareForm]                 ;; 03:6FF1 $FA $19 $D2
    JP_TABLE                                      ;; 03:6FF4
._00 dw NoopFunction
._01 dw .finalNightmareForm2Collisions
._02 dw .finalNightmareForm3Collisions
._03 dw .finalNightmareDefaultCollisions
._04 dw .finalNightmareDefaultCollisions
._05 dw .standardSwordCollision

.finalNightmareForm2Collisions
    call IncrementEntityState                     ;; 03:7001 $CD $12 $3B
    ld   [hl], $06                                ;; 03:7004 $36 $06
    ret                                           ;; 03:7006 $C9

.finalNightmareForm3Collisions::
    ld   a, [wIsUsingSpinAttack]                  ;; 03:7007 $FA $21 $C1
    and  a                                        ;; 03:700A $A7
    jr   nz, .usingSpinAttack                     ;; 03:700B $20 $06

    ld   a, [wC16A]                               ;; 03:700D $FA $6A $C1
    cp   $04                                      ;; 03:7010 $FE $04
    ret  nc                                       ;; 03:7012 $D0

.usingSpinAttack
    jp   IncrementEntityState                     ;; 03:7013 $C3 $12 $3B

.finalNightmareDefaultCollisions
    ldh  a, [hActiveEntityType]                   ;; 03:7016 $F0 $EB

.defaultSwordCollision
    ;
    ; Special case for Buzz Blob
    ;

    cp   ENTITY_BUZZ_BLOB                         ;; 03:7018 $FE $B9
    jr   nz, .buzzBlobEnd                         ;; 03:701A $20 $26

    ldh  a, [hActiveEntityStatus]                 ;; 03:701C $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 03:701E $FE $05
    jr   nz, .buzzBlobEnd                         ;; 03:7020 $20 $20

    call IncrementEntityState                     ;; 03:7022 $CD $12 $3B
    ld   [hl], $01                                ;; 03:7025 $36 $01
    call GetEntityTransitionCountdown             ;; 03:7027 $CD $05 $0C
    ld   [hl], $40                                ;; 03:702A $36 $40
    ld   a, $40                                   ;; 03:702C $3E $40
    ld   [wD464], a                               ;; 03:702E $EA $64 $D4
    ; reset sword parameter
    xor  a                                        ;; 03:7031 $AF
    ld   [wSwordAnimationState], a                ;; 03:7032 $EA $37 $C1
    ld   [wC16A], a                               ;; 03:7035 $EA $6A $C1
    ld   [wIsUsingSpinAttack], a                  ;; 03:7038 $EA $21 $C1
    ld   a, NOISE_SFX_BUZZ_BLOB_ELECTROCUTE       ;; 03:703B $3E $1C
    ldh  [hNoiseSfx], a                           ;; 03:703D $E0 $F4
    jp   ApplyLinkCollisionWithEnemy              ;; 03:703F $C3 $D5 $6C
.buzzBlobEnd

.standardSwordCollision
    ;
    ; Special case for Bouncing Bombite
    ;

    ldh  a, [hActiveEntityType]                   ;; 03:7042 $F0 $EB
    cp   ENTITY_BOUNCING_BOMBITE                  ;; 03:7044 $FE $55
    jr   nz, .bouncingBombiteEnd                  ;; 03:7046 $20 $27

    ld   a, $30                                   ;; 03:7048 $3E $30
    call GetVectorTowardsLink                     ;; 03:704A $CD $45 $7E
    ldh  a, [hMultiPurpose0]                      ;; 03:704D $F0 $D7
    cpl                                           ;; 03:704F $2F
    inc  a                                        ;; 03:7050 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7051 $21 $50 $C2
    add  hl, bc                                   ;; 03:7054 $09
    ld   [hl], a                                  ;; 03:7055 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:7056 $F0 $D8
    cpl                                           ;; 03:7058 $2F
    inc  a                                        ;; 03:7059 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 03:705A $21 $40 $C2
    add  hl, bc                                   ;; 03:705D $09
    ld   [hl], a                                  ;; 03:705E $77
    call IncrementEntityState                     ;; 03:705F $CD $12 $3B
    ld   [hl], $02                                ;; 03:7062 $36 $02
    call GetEntityTransitionCountdown             ;; 03:7064 $CD $05 $0C
    ld   [hl], $40                                ;; 03:7067 $36 $40
    call GetEntityPrivateCountdown1               ;; 03:7069 $CD $00 $0C
    ld   [hl], $08                                ;; 03:706C $36 $08
    ret                                           ;; 03:706E $C9
.bouncingBombiteEnd

    ;
    ; Special case for Angler Fish
    ;

    cp   ENTITY_ANGLER_FISH                       ;; 03:706F $FE $65
    jr   nz, .anglerFishEnd                       ;; 03:7071 $20 $0A

    call func_003_6DDF                            ;; 03:7073 $CD $DF $6D
    ld   a, $08                                   ;; 03:7076 $3E $08
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:7078 $EA $3E $C1
    jr   .slimeEyeEnd                             ;; 03:707B $18 $3C
.anglerFishEnd

    ;
    ; Special case for Slime Eye
    ;

    cp   ENTITY_SLIME_EYE                         ;; 03:707D $FE $5B
    jr   nz, .slimeEyeEnd                         ;; 03:707F $20 $38

    ldh  a, [hMultiPurposeG]                      ;; 03:7081 $F0 $E8
    and  a                                        ;; 03:7083 $A7
IF __OPTIMIZATIONS_3__
    jp   nz, func_003_6DDF
ELSE
    jr   nz, .jr_003_70A9                         ;; 03:7084 $20 $23
ENDC

    ld   hl, wEntitiesPrivateState1Table          ;; 03:7086 $21 $B0 $C2
    add  hl, bc                                   ;; 03:7089 $09
    ld   a, [hl]                                  ;; 03:708A $7E
    cp   $04                                      ;; 03:708B $FE $04
    jp   nz, .jr_003_709D                         ;; 03:708D $C2 $9D $70

    ld   a, [wIsRunningWithPegasusBoots]          ;; 03:7090 $FA $4A $C1
    and  a                                        ;; 03:7093 $A7
    jr   z, .continueDefaultCollision             ;; 03:7094 $28 $6C

    ld   hl, wEntitiesPrivateCountdown2Table      ;; 03:7096 $21 $00 $C3
    add  hl, bc                                   ;; 03:7099 $09
    ld   [hl], $0C                                ;; 03:709A $36 $0C
    ret                                           ;; 03:709C $C9

.jr_003_709D
    ld   a, [wIsRunningWithPegasusBoots]          ;; 03:709D $FA $4A $C1
    and  a                                        ;; 03:70A0 $A7
    jr   z, .jr_003_70AC                          ;; 03:70A1 $28 $09

    call func_003_6DDF                            ;; 03:70A3 $CD $DF $6D
    jp   .continueDefaultCollision                ;; 03:70A6 $C3 $02 $71

IF !__OPTIMIZATIONS_3__
.jr_003_70A9
    jp   func_003_6DDF                            ;; 03:70A9 $C3 $DF $6D
ENDC

.jr_003_70AC
    ld   a, $04                                   ;; 03:70AC $3E $04
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:70AE $EA $3E $C1
    ld   a, $10                                   ;; 03:70B1 $3E $10
    call func_003_7565                            ;; 03:70B3 $CD $65 $75
    jp   .continueDefaultCollision                ;; 03:70B6 $C3 $02 $71
.slimeEyeEnd

    ; If sword clink is disabled…
    ld   hl, wEntitiesOptions1Table               ;; 03:70B9 $21 $30 $C4
    add  hl, bc                                   ;; 03:70BC $09
    ld   a, [hl]                                  ;; 03:70BD $7E
    and  ENTITY_OPT1_SWORD_CLINK_OFF              ;; 03:70BE $E6 $40
    jr   z, .continueDefaultCollision             ;; 03:70C0 $28 $40

    ldh  a, [hActiveEntityType]                   ;; 03:70C2 $F0 $EB
    cp   ENTITY_KNIGHT                            ;; 03:70C4 $FE $51
    jp   z, label_003_6F04                        ;; 03:70C6 $CA $04 $6F

    ; … and colliding with the Genie…
    cp   ENTITY_GENIE                             ;; 03:70C9 $FE $5C
    jr   nz, .genieEnd                            ;; 03:70CB $20 $1A

    ; … make the Genie jar recoil less than usual enemies…
    ld   a, [wTunicType]                          ;; 03:70CD $FA $0F $DC
    cp   TUNIC_RED                                ;; 03:70D0 $FE $01
    jr   z, .genieJarExtraRecoil                  ;; 03:70D2 $28 $09
    ld   a, [wActivePowerUp]                      ;; 03:70D4 $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 03:70D7 $FE $01
    ld   a, SWORD_RECOIL_GENIE_JAR_DEFAULT        ;; 03:70D9 $3E $20
    jr   nz, .genieJarStandardRecoil              ;; 03:70DB $20 $02
.genieJarExtraRecoil
    ld   a, SWORD_RECOIL_GENIE_JAR_STRONGER       ;; 03:70DD $3E $30
.genieJarStandardRecoil
    call ConfigureEntityRecoil                    ;; 03:70DF $CD $CC $6F

    ; …but without flashing from damages.
    ld   hl, wEntitiesFlashCountdownTable         ;; 03:70E2 $21 $20 $C4
    add  hl, bc                                   ;; 03:70E5 $09
    ld   [hl], b                                  ;; 03:70E6 $70
.genieEnd

    ld   a, c                                     ;; 03:70E7 $79
    inc  a                                        ;; 03:70E8 $3C
    ld   [wC1AC], a                               ;; 03:70E9 $EA $AC $C1
    call label_D07                                ;; 03:70EC $CD $07 $0D
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:70EF $21 $10 $C4
    add  hl, bc                                   ;; 03:70F2 $09
    ld   [hl], $10                                ;; 03:70F3 $36 $10
    ld   hl, wEntitiesRecoilVelocityX             ;; 03:70F5 $21 $F0 $C3
    add  hl, bc                                   ;; 03:70F8 $09
    ld   [hl], b                                  ;; 03:70F9 $70
    ld   hl, wEntitiesRecoilVelocityY             ;; 03:70FA $21 $00 $C4
    add  hl, bc                                   ;; 03:70FD $09
    ld   [hl], b                                  ;; 03:70FE $70
    jp   func_003_6DDF                            ;; 03:70FF $C3 $DF $6D

.continueDefaultCollision

    ldh  a, [hActiveEntityType]                   ;; 03:7102 $F0 $EB
    cp   ENTITY_CUE_BALL                          ;; 03:7104 $FE $8E
    jr   nz, .cueBallEnd                          ;; 03:7106 $20 $05

    call ResetPegasusBoots                        ;; 03:7108 $CD $B6 $0C
    jr   .jr_003_714D                             ;; 03:710B $18 $40
.cueBallEnd

    ;
    ; Special case for Iron Mask
    ;

    cp   ENTITY_IRON_MASK                         ;; 03:710D $FE $24
    jr   nz, .ironMaskEnd                         ;; 03:710F $20 $35

    ld   hl, wEntitiesPrivateState2Table          ;; 03:7111 $21 $C0 $C2
    add  hl, bc                                   ;; 03:7114 $09
    ld   a, [hl]                                  ;; 03:7115 $7E
    and  a                                        ;; 03:7116 $A7
    jr   nz, .ironMaskEnd                         ;; 03:7117 $20 $2D

    ldh  a, [hLinkDirection]                      ;; 03:7119 $F0 $9E
    ld   e, a                                     ;; 03:711B $5F
    ld   d, b                                     ;; 03:711C $50
    ld   hl, Data_003_6FE4                        ;; 03:711D $21 $E4 $6F
    add  hl, de                                   ;; 03:7120 $19
    ld   a, [hl]                                  ;; 03:7121 $7E
    ld   hl, wEntitiesDirectionTable              ;; 03:7122 $21 $80 $C3
    add  hl, bc                                   ;; 03:7125 $09
    cp   [hl]                                     ;; 03:7126 $BE
    jr   z, .jr_003_714D                          ;; 03:7127 $28 $24

    call ResetPegasusBoots                        ;; 03:7129 $CD $B6 $0C
    ld   a, $10                                   ;; 03:712C $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:712E $EA $3E $C1
    ld   a, $10                                   ;; 03:7131 $3E $10
    call func_003_7565                            ;; 03:7133 $CD $65 $75
    ld   a, $10                                   ;; 03:7136 $3E $10
    call ConfigureEntityRecoil                    ;; 03:7138 $CD $CC $6F

.label_003_713B
    ldh  a, [hActiveEntityPosX]                   ;; 03:713B $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 03:713D $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:713F $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 03:7141 $E0 $D8
    jp   label_D15                                ;; 03:7143 $C3 $15 $0D

.ironMaskEnd

    ldh  a, [hActiveEntityType]                   ;; 03:7146 $F0 $EB
    cp   ENTITY_ANTI_FAIRY                        ;; 03:7148 $FE $15
    jp   z, label_003_73E6                        ;; 03:714A $CA $E6 $73

.jr_003_714D
    ld   a, $01                                   ;; 03:714D $3E $01
    ld   [wC160], a                               ;; 03:714F $EA $60 $C1
    ld   a, [wC16A]                               ;; 03:7152 $FA $6A $C1
    cp   $05                                      ;; 03:7155 $FE $05
    jr   nz, .jr_003_715E                         ;; 03:7157 $20 $05
    ld   a, $0C                                   ;; 03:7159 $3E $0C
    ld   [wC16D], a                               ;; 03:715B $EA $6D $C1
.jr_003_715E

    ; Reset sword charge
    xor  a                                        ;; 03:715E $AF
    ld   [wSwordCharge], a                        ;; 03:715F $EA $22 $C1

    ; Apply default sword recoil
    ld   a, SWORD_RECOIL_DEFAULT                  ;; 03:7162 $3E $30
    call ConfigureEntityRecoil                    ;; 03:7164 $CD $CC $6F

    ; Play the recoil sound
    ld   hl, hJingle                              ;; 03:7167 $21 $F2 $FF
    ld   [hl], JINGLE_BUMP                        ;; 03:716A $36 $09

    ;
    ; Power recoil
    ;

    ; If wearing the attack tunic or having a Piece of power…
    ld   a, [wTunicType]                          ;; 03:716C $FA $0F $DC
    cp   TUNIC_RED                                ;; 03:716F $FE $01
    jr   z, .powerRecoil                          ;; 03:7171 $28 $07

    ld   a, [wActivePowerUp]                      ;; 03:7173 $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 03:7176 $FE $01
    jr   nz, ApplySwordDamagesToEnemy             ;; 03:7178 $20 $23

.powerRecoil
    ; Damage the enemy
    call ApplySwordDamagesToEnemy                 ;; 03:717A $CD $9D $71

    ; Ignore hits for longer than usual
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:717D $21 $10 $C4
    add  hl, bc                                   ;; 03:7180 $09
    ld   [hl], $20                                ;; 03:7181 $36 $20

    ; Mark the entity as recoiling from a power sword hit
    ld   hl, wEntitiesPowerRecoilingTable         ;; 03:7183 $21 $A0 $C4
    add  hl, bc                                   ;; 03:7186 $09
    ld   [hl], TRUE                               ;; 03:7187 $36 $01

    ; Play the power recoil SFX
    ld   a, WAVE_SFX_POWER_HIT                    ;; 03:7189 $3E $11
    ldh  [hWaveSfx], a                            ;; 03:718B $E0 $F3

    ld   hl, wEntitiesStatusTable                 ;; 03:718D $21 $80 $C2
    add  hl, bc                                   ;; 03:7190 $09
    ld   a, [hl]                                  ;; 03:7191 $7E
    cp   ENTITY_STATUS_DYING                      ;; 03:7192 $FE $01
    jr   nz, .dyingEnd                            ;; 03:7194 $20 $06

    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:7196 $21 $80 $C4
    add  hl, bc                                   ;; 03:7199 $09
    ld   [hl], $40                                ;; 03:719A $36 $40
.dyingEnd

    ret                                           ;; 03:719C $C9

; Apply enemy damages from sword collision
;
; Inputs:
;   bc   entity slot of enemy
ApplySwordDamagesToEnemy::
    ld   a, c                                     ;; 03:719D $79
    inc  a                                        ;; 03:719E $3C
    ld   [wC1AC], a                               ;; 03:719F $EA $AC $C1

    ; If the player:
    ; - wears the attack tunic,
    ; - or has a Piece of power,
    ; - or is using a Spin attack…
    ; - or is running with the Pegasus boots…
    ld   a, [wTunicType]                          ;; 03:71A2 $FA $0F $DC
    and  TUNIC_RED                                ;; 03:71A5 $E6 $01
    jr   nz, .wearingRedTunic                     ;; 03:71A7 $20 $05
    ld   a, [wActivePowerUp]                      ;; 03:71A9 $FA $7C $D4
    and  ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 03:71AC $E6 $01
.wearingRedTunic
    ld   hl, wIsUsingSpinAttack                   ;; 03:71AE $21 $21 $C1
    or   [hl]                                     ;; 03:71B1 $B6
    ld   hl, wIsRunningWithPegasusBoots           ;; 03:71B2 $21 $4A $C1
    or   [hl]                                     ;; 03:71B5 $B6
    ; … increase the sword level for this hit.
    ld   a, [wSwordLevel]                         ;; 03:71B6 $FA $4E $DB
    jr   z, .useStandardSwordLevel                ;; 03:71B9 $28 $01
    inc  a                                        ;; 03:71BB $3C
.useStandardSwordLevel

    dec  a                                        ;; 03:71BC $3D
    ld   [wC19E], a                               ;; 03:71BD $EA $9E $C1

label_003_71C0:
    ld   hl, wEntitiesHealthGroup                 ;; 03:71C0 $21 $D0 $C4
    add  hl, bc                                   ;; 03:71C3 $09
    ld   e, [hl]                                  ;; 03:71C4 $5E
    ld   d, b                                     ;; 03:71C5 $50
    sla  e                                        ;; 03:71C6 $CB $23
    rl   d                                        ;; 03:71C8 $CB $12
    sla  e                                        ;; 03:71CA $CB $23
    rl   d                                        ;; 03:71CC $CB $12
    sla  e                                        ;; 03:71CE $CB $23
    rl   d                                        ;; 03:71D0 $CB $12
    sla  e                                        ;; 03:71D2 $CB $23
    rl   d                                        ;; 03:71D4 $CB $12
    ld   hl, Data_003_43EC                        ;; 03:71D6 $21 $EC $43
    add  hl, de                                   ;; 03:71D9 $19
    ld   a, [wC19E]                               ;; 03:71DA $FA $9E $C1
    ld   e, a                                     ;; 03:71DD $5F
    ld   d, b                                     ;; 03:71DE $50
    add  hl, de                                   ;; 03:71DF $19
    ld   e, [hl]                                  ;; 03:71E0 $5E
    push de                                       ;; 03:71E1 $D5
    ld   a, [wC19E]                               ;; 03:71E2 $FA $9E $C1
    rla                                           ;; 03:71E5 $17
    rla                                           ;; 03:71E6 $17
    rla                                           ;; 03:71E7 $17
    and  $F8                                      ;; 03:71E8 $E6 $F8
    ld   e, a                                     ;; 03:71EA $5F
    ld   hl, Data_003_473C                        ;; 03:71EB $21 $3C $47
    add  hl, de                                   ;; 03:71EE $19
    pop  de                                       ;; 03:71EF $D1
    add  hl, de                                   ;; 03:71F0 $19
    ld   a, [hl]                                  ;; 03:71F1 $7E
    and  a                                        ;; 03:71F2 $A7
    ret  z                                        ;; 03:71F3 $C8

    push af                                       ;; 03:71F4 $F5
    ldh  a, [hActiveEntityType]                   ;; 03:71F5 $F0 $EB
    cp   ENTITY_FINAL_NIGHTMARE                   ;; 03:71F7 $FE $E6
    jr   nz, .jr_7215                             ;; 03:71F9 $20 $1A

    ld   a, [wFinalNightmareForm]                 ;; 03:71FB $FA $19 $D2
    cp   $04                                      ;; 03:71FE $FE $04
    jr   nz, .jr_7215                             ;; 03:7200 $20 $13

    ld   a, [wIsRunningWithPegasusBoots]          ;; 03:7202 $FA $4A $C1
    push af                                       ;; 03:7205 $F5
    call func_003_6DDF                            ;; 03:7206 $CD $DF $6D
    pop  af                                       ;; 03:7209 $F1
    and  a                                        ;; 03:720A $A7
    jr   nz, .jr_7215                             ;; 03:720B $20 $08

    ld   a, [wIsUsingSpinAttack]                  ;; 03:720D $FA $21 $C1
    and  a                                        ;; 03:7210 $A7
    jr   nz, .jr_7215                             ;; 03:7211 $20 $02

    pop  af                                       ;; 03:7213 $F1
    ret                                           ;; 03:7214 $C9

.jr_7215
    ld   hl, wEntitiesOptions1Table               ;; 03:7215 $21 $30 $C4
    add  hl, bc                                   ;; 03:7218 $09
    ld   a, [hl]                                  ;; 03:7219 $7E
    ld   hl, hJingle                              ;; 03:721A $21 $F2 $FF
    ld   [hl], JINGLE_ENEMY_HIT                   ;; 03:721D $36 $03
    and  $80                                      ;; 03:721F $E6 $80
    jr   z, .jr_7228                              ;; 03:7221 $28 $05

    ld   hl, hWaveSfx                             ;; 03:7223 $21 $F3 $FF
    ld   [hl], WAVE_SFX_BOSS_HURT                 ;; 03:7226 $36 $07

; Hurt cucco.
.jr_7228
    ld   hl, wEntitiesTypeTable                   ;; 03:7228 $21 $A0 $C3
    add  hl, bc                                   ;; 03:722B $09
    ld   a, [hl]                                  ;; 03:722C $7E
    cp   ENTITY_CUCCO                             ;; 03:722D $FE $6C
    jr   nz, .jr_7235                             ;; 03:722F $20 $04

    ld   a, WAVE_SFX_CUCCO_HURT                   ;; 03:7231 $3E $13
    ldh  [hWaveSfx], a                            ;; 03:7233 $E0 $F3

.jr_7235
    ; pop damages type and amount
    pop  af                                       ;; 03:7235 $F1

    cp   $F0                                      ;; 03:7236 $FE $F0
    jr   c, jr_003_72B5                           ;; 03:7238 $38 $7B

    cp   $FE ; damage-type: burn                               ;; 03:723A $FE $FE
    jr   nz, .jr_7260                             ;; 03:723C $20 $22

    ld   hl, hNoiseSfx                            ;; 03:723E $21 $F4 $FF
    ld   [hl], NOISE_SFX_BURSTING_FLAME           ;; 03:7241 $36 $12
    call StartIgnoringHitsForEntity               ;; 03:7243 $CD $DB $73
    ld   hl, wEntitiesStatusTable                 ;; 03:7246 $21 $80 $C2
    add  hl, bc                                   ;; 03:7249 $09
    ld   [hl], ENTITY_STATUS_DESTROYING           ;; 03:724A $36 $03
    call GetEntityTransitionCountdown             ;; 03:724C $CD $05 $0C
    ld   [hl], $60                                ;; 03:724F $36 $60
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:7251 $21 $40 $C3
    add  hl, bc                                   ;; 03:7254 $09
    inc  [hl]                                     ;; 03:7255 $34
    inc  [hl]                                     ;; 03:7256 $34
    ld   hl, wEntitiesOptions1Table               ;; 03:7257 $21 $30 $C4
    add  hl, bc                                   ;; 03:725A $09
    ld   a, [hl]                                  ;; 03:725B $7E
    and  ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL|ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_IS_BOSS ;; 03:725C $E6 $C2
    ld   [hl], a                                  ;; 03:725E $77
    ret                                           ;; 03:725F $C9

.jr_7260
    cp   $FF                                      ;; 03:7260 $FE $FF
    jr   nz, jr_003_7279                          ;; 03:7262 $20 $15

    call StartIgnoringHitsForEntity               ;; 03:7264 $CD $DB $73

func_003_7267::
    ld   hl, wEntitiesStatusTable                 ;; 03:7267 $21 $80 $C2
    add  hl, bc                                   ;; 03:726A $09
    ld   [hl], $06                                ;; 03:726B $36 $06
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 03:726D $21 $00 $C3
    add  hl, bc                                   ;; 03:7270 $09
    ld   [hl], $FF                                ;; 03:7271 $36 $FF
    ld   hl, wEntitiesSpeedZTable                 ;; 03:7273 $21 $20 $C3
    add  hl, bc                                   ;; 03:7276 $09
    ld   [hl], b                                  ;; 03:7277 $70
    ret                                           ;; 03:7278 $C9

jr_003_7279:
    cp   $FD                                      ;; 03:7279 $FE $FD
    ret  nz                                       ;; 03:727B $C0

    ld   hl, wEntitiesTypeTable                   ;; 03:727C $21 $A0 $C3
    add  hl, bc                                   ;; 03:727F $09
    ld   a, [hl]                                  ;; 03:7280 $7E
    cp   ENTITY_GIANT_BUZZ_BLOB                   ;; 03:7281 $FE $F8
    jr   z, .jr_7289                              ;; 03:7283 $28 $04

    cp   ENTITY_BUZZ_BLOB                         ;; 03:7285 $FE $B9
    jr   nz, jr_003_7293                          ;; 03:7287 $20 $0A

.jr_7289
    ld   hl, wEntitiesPrivateState1Table          ;; 03:7289 $21 $B0 $C2
    add  hl, bc                                   ;; 03:728C $09
    ld   a, [hl]                                  ;; 03:728D $7E
    and  a                                        ;; 03:728E $A7
    ret  nz                                       ;; 03:728F $C0

    inc  [hl]                                     ;; 03:7290 $34
    jr   jr_003_729D                              ;; 03:7291 $18 $0A

jr_003_7293:
    ld   [hl], $2F                                ;; 03:7293 $36 $2F
    call ConfigureNewEntity                       ;; 03:7295 $CD $5B $48
    call GetEntitySlowTransitionCountdown         ;; 03:7298 $CD $FB $0B
    ld   [hl], $80                                ;; 03:729B $36 $80

jr_003_729D:
    ld   hl, wEntitiesPosXTable                   ;; 03:729D $21 $00 $C2
    add  hl, bc                                   ;; 03:72A0 $09
    ld   a, [hl]                                  ;; 03:72A1 $7E
    ldh  [hMultiPurpose0], a                      ;; 03:72A2 $E0 $D7
    ld   hl, wEntitiesPosYTable                   ;; 03:72A4 $21 $10 $C2
    add  hl, bc                                   ;; 03:72A7 $09
    ld   a, [hl]                                  ;; 03:72A8 $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:72A9 $21 $10 $C3
    add  hl, bc                                   ;; 03:72AC $09
    sub  [hl]                                     ;; 03:72AD $96
    ldh  [hMultiPurpose1], a                      ;; 03:72AE $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 03:72B0 $3E $02
    jp   AddTranscientVfx                         ;; 03:72B2 $C3 $C7 $0C

jr_003_72B5:
    ld   e, a                                     ;; 03:72B5 $5F
    ld   hl, wEntitiesHealthTable                 ;; 03:72B6 $21 $60 $C3
    add  hl, bc                                   ;; 03:72B9 $09
    ld   a, [hl]                                  ;; 03:72BA $7E
    sub  e                                        ;; 03:72BB $93
    ld   [hl], a                                  ;; 03:72BC $77
    jr   c, .jr_72C2                              ;; 03:72BD $38 $03

    jp   nz, jr_003_73B6                          ;; 03:72BF $C2 $B6 $73

.jr_72C2
    ld   hl, wEntitiesStatusTable                 ;; 03:72C2 $21 $80 $C2
    add  hl, bc                                   ;; 03:72C5 $09
    ld   [hl], $01                                ;; 03:72C6 $36 $01
    ld   hl, wEntitiesOptions1Table               ;; 03:72C8 $21 $30 $C4
    add  hl, bc                                   ;; 03:72CB $09
    ld   a, [hl]                                  ;; 03:72CC $7E
    bit  ENTITY_OPT1_B_IS_BOSS, a                 ;; 03:72CD $CB $7F
    jr   z, jr_003_733E                           ;; 03:72CF $28 $6D

    bit  ENTITY_OPT1_B_IS_MINI_BOSS, a            ;; 03:72D1 $CB $57
    jr   nz, jr_003_7304                          ;; 03:72D3 $20 $2F

    ld   e, $0F                                   ;; 03:72D5 $1E $0F
    ld   d, b                                     ;; 03:72D7 $50

jr_003_72D8:
    ld   a, e                                     ;; 03:72D8 $7B
    cp   c                                        ;; 03:72D9 $B9
    jr   z, .jr_72EE                              ;; 03:72DA $28 $12

    ld   hl, wEntitiesStatusTable                 ;; 03:72DC $21 $80 $C2
    add  hl, de                                   ;; 03:72DF $19
    ld   a, [hl]                                  ;; 03:72E0 $7E
    cp   $05                                      ;; 03:72E1 $FE $05
    jr   nz, .jr_72EE                             ;; 03:72E3 $20 $09

    ld   hl, wEntitiesOptions1Table               ;; 03:72E5 $21 $30 $C4
    add  hl, de                                   ;; 03:72E8 $19
    ld   a, [hl]                                  ;; 03:72E9 $7E
    and  ENTITY_OPT1_IS_BOSS                      ;; 03:72EA $E6 $80
    jr   nz, jr_003_7304                          ;; 03:72EC $20 $16

.jr_72EE
    dec  e                                        ;; 03:72EE $1D
    ld   a, e                                     ;; 03:72EF $7B
    cp   $FF                                      ;; 03:72F0 $FE $FF
    jr   nz, jr_003_72D8                          ;; 03:72F2 $20 $E4

    ld   a, [wCurrentBank]                        ;; 03:72F4 $FA $AF $DB
    push af                                       ;; 03:72F7 $F5
    ld   a, $03                                   ;; 03:72F8 $3E $03
    call SwitchBank                               ;; 03:72FA $CD $0C $08
    call label_27F2                               ;; 03:72FD $CD $F2 $27
    pop  af                                       ;; 03:7300 $F1
    ld   [wCurrentBank], a                        ;; 03:7301 $EA $AF $DB

jr_003_7304:
    ld   a, $03                                   ;; 03:7304 $3E $03
    ld   [wBossAgonySFXCountdown], a              ;; 03:7306 $EA $A7 $C5

    ld   hl, wEntitiesPrivateState2Table          ;; 03:7309 $21 $C0 $C2
    add  hl, bc                                   ;; 03:730C $09
    ld   [hl], b                                  ;; 03:730D $70

    ld   hl, wEntitiesTypeTable                   ;; 03:730E $21 $A0 $C3
    add  hl, bc                                   ;; 03:7311 $09
    ld   a, [hl]                                  ;; 03:7312 $7E

    ld_dialog_low e, Dialog0B7                    ;; 03:7313 $1E $B7
    cp   ENTITY_FACADE                            ;; 03:7315 $FE $5A
    jr   z, .openBossDefeatedDialog               ;; 03:7317 $28 $0C

    ld_dialog_low e, Dialog0B9                    ;; 03:7319 $1E $B9
    cp   ENTITY_EVIL_EAGLE                        ;; 03:731B $FE $63
    jr   z, .openDialogAtBottom                   ;; 03:731D $28 $11

    ld_dialog_low e, Dialog0BD                    ;; 03:731F $1E $BD
    cp   ENTITY_HOT_HEAD                          ;; 03:7321 $FE $62
    jr   nz, jr_003_733E                          ;; 03:7323 $20 $19

; Boss dialog after defeating them
.openBossDefeatedDialog
    ld   a, e                                     ;; 03:7325 $7B
    call OpenDialogInTable0                       ;; 03:7326 $CD $85 $23
    ld   a, MUSIC_BOSS_DEFEAT                     ;; 03:7329 $3E $5E
    ld   [wMusicTrackToPlay], a                   ;; 03:732B $EA $68 $D3
    jr   jr_003_733E                              ;; 03:732E $18 $0E

.openDialogAtBottom
IF __PATCH_0__
    ld   a, $01
    ld   [wDE0B], a
ENDC
    ldh  a, [hLinkPositionY]                      ;; 03:7330 $F0 $99
    push af                                       ;; 03:7332 $F5
    ld   a, $10                                   ;; 03:7333 $3E $10
    ldh  [hLinkPositionY], a                      ;; 03:7335 $E0 $99
    ld   a, e                                     ;; 03:7337 $7B
    call OpenDialogInTable0                       ;; 03:7338 $CD $85 $23
    pop  af                                       ;; 03:733B $F1
    ldh  [hLinkPositionY], a                      ;; 03:733C $E0 $99

jr_003_733E:
    call IncrementEntityState                     ;; 03:733E $CD $12 $3B
    ld   [hl], b                                  ;; 03:7341 $70
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:7342 $21 $80 $C4
    add  hl, bc                                   ;; 03:7345 $09
    ld   [hl], $2F                                ;; 03:7346 $36 $2F
    ld   hl, wEntitiesFlashCountdownTable         ;; 03:7348 $21 $20 $C4
    add  hl, bc                                   ;; 03:734B $09
    xor  a                                        ;; 03:734C $AF
    ld   [hl], a                                  ;; 03:734D $77
    ld   hl, wEntitiesOptions1Table               ;; 03:734E $21 $30 $C4
    add  hl, bc                                   ;; 03:7351 $09
    ld   a, [hl]                                  ;; 03:7352 $7E
    and  ENTITY_OPT1_IS_BOSS                      ;; 03:7353 $E6 $80
    jr   nz, .jr_7361                             ;; 03:7355 $20 $0A

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:7357 $21 $40 $C3
    add  hl, bc                                   ;; 03:735A $09
    ld   a, [hl]                                  ;; 03:735B $7E
    and  $F0                                      ;; 03:735C $E6 $F0
    or   $04                                      ;; 03:735E $F6 $04
    ld   [hl], a                                  ;; 03:7360 $77

.jr_7361
    ld   hl, wEntitiesTypeTable                   ;; 03:7361 $21 $A0 $C3
    add  hl, bc                                   ;; 03:7364 $09
    ld   a, [hl]                                  ;; 03:7365 $7E
    cp   $12                                      ;; 03:7366 $FE $12
    jr   nz, jr_003_73B6                          ;; 03:7368 $20 $4C

    ld   e, $0F                                   ;; 03:736A $1E $0F
    ld   d, b                                     ;; 03:736C $50

jr_003_736D:
    ld   a, e                                     ;; 03:736D $7B
    cp   c                                        ;; 03:736E $B9
    jr   z, jr_003_73AA                           ;; 03:736F $28 $39

    ld   hl, wEntitiesTypeTable                   ;; 03:7371 $21 $A0 $C3
    add  hl, de                                   ;; 03:7374 $19
    ld   a, [hl]                                  ;; 03:7375 $7E
    cp   $10                                      ;; 03:7376 $FE $10
    jr   z, .jr_737E                              ;; 03:7378 $28 $04

    cp   $11                                      ;; 03:737A $FE $11
    jr   nz, jr_003_73AA                          ;; 03:737C $20 $2C

.jr_737E
    ld   hl, wEntitiesStateTable                  ;; 03:737E $21 $90 $C2
    add  hl, de                                   ;; 03:7381 $19
    ld   a, [hl]                                  ;; 03:7382 $7E
    and  a                                        ;; 03:7383 $A7
    jr   nz, jr_003_73AA                          ;; 03:7384 $20 $24

    ld   hl, wEntitiesStatusTable                 ;; 03:7386 $21 $80 $C2
    add  hl, de                                   ;; 03:7389 $19
    ld   a, [hl]                                  ;; 03:738A $7E
    and  a                                        ;; 03:738B $A7
    jr   z, jr_003_73AA                           ;; 03:738C $28 $1C

    ld   [hl], $01                                ;; 03:738E $36 $01
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:7390 $21 $80 $C4
    add  hl, de                                   ;; 03:7393 $19
    ld   [hl], $1F                                ;; 03:7394 $36 $1F
    call GetRandomByte                            ;; 03:7396 $CD $0D $28
    and  $03                                      ;; 03:7399 $E6 $03
    push bc                                       ;; 03:739B $C5
    ld   c, a                                     ;; 03:739C $4F
    ld   b, $00                                   ;; 03:739D $06 $00
    ld   hl, Data_003_73E7                        ;; 03:739F $21 $E7 $73
    add  hl, bc                                   ;; 03:73A2 $09
    ld   a, [hl]                                  ;; 03:73A3 $7E
    ld   hl, wEntitiesDroppedItemTable            ;; 03:73A4 $21 $E0 $C4
    add  hl, de                                   ;; 03:73A7 $19
    ld   [hl], a                                  ;; 03:73A8 $77
    pop  bc                                       ;; 03:73A9 $C1

jr_003_73AA:
    dec  e                                        ;; 03:73AA $1D
    ld   a, e                                     ;; 03:73AB $7B
    cp   $FF                                      ;; 03:73AC $FE $FF
    jr   nz, jr_003_736D                          ;; 03:73AE $20 $BD

    ld   hl, wEntitiesDroppedItemTable            ;; 03:73B0 $21 $E0 $C4
    add  hl, bc                                   ;; 03:73B3 $09
    ld   [hl], ENTITY_DROPPABLE_RUPEE             ;; 03:73B4 $36 $2E

jr_003_73B6:
    ld   hl, wEntitiesTypeTable                   ;; 03:73B6 $21 $A0 $C3
    add  hl, bc                                   ;; 03:73B9 $09
    ld   a, [hl]                                  ;; 03:73BA $7E
    ld   hl, wEntitiesFlashCountdownTable         ;; 03:73BB $21 $20 $C4
    add  hl, bc                                   ;; 03:73BE $09
    cp   $E6                                      ;; 03:73BF $FE $E6
    jr   nz, .jr_73CC                             ;; 03:73C1 $20 $09

    ld   a, [wFinalNightmareForm]                 ;; 03:73C3 $FA $19 $D2
    cp   $03                                      ;; 03:73C6 $FE $03
    jr   z, jr_003_73D0                           ;; 03:73C8 $28 $06

    jr   jr_003_73D9                              ;; 03:73CA $18 $0D

.jr_73CC
    cp   $59                                      ;; 03:73CC $FE $59
    jr   nz, jr_003_73D9                          ;; 03:73CE $20 $09

jr_003_73D0:
    ld   [hl], $28                                ;; 03:73D0 $36 $28
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 03:73D2 $21 $00 $C3
    add  hl, bc                                   ;; 03:73D5 $09
    ld   [hl], $C8                                ;; 03:73D6 $36 $C8
    ret                                           ;; 03:73D8 $C9

jr_003_73D9:
    ld   [hl], $18                                ;; 03:73D9 $36 $18

StartIgnoringHitsForEntity::
    ld   hl, wEntitiesPowerRecoilingTable         ;; 03:73DB $21 $A0 $C4
    add  hl, bc                                   ;; 03:73DE $09
    ld   [hl], b                                  ;; 03:73DF $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:73E0 $21 $10 $C4
    add  hl, bc                                   ;; 03:73E3 $09
    ld   [hl], $0A                                ;; 03:73E4 $36 $0A

label_003_73E6:
    ret                                           ;; 03:73E6 $C9

Data_003_73E7::
    db   $2D, $2E, $38, $37

func_003_73EB::
    ld   hl, wC1AC                                ;; 03:73EB $21 $AC $C1
    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 03:73EE $FA $3E $C1
    or   [hl]                                     ;; 03:73F1 $B6
    ld   hl, hLinkPunchedAwayCountdown            ;; 03:73F2 $21 $B6 $FF
    or   [hl]                                     ;; 03:73F5 $B6
    ld   hl, wIsUsingSpinAttack                   ;; 03:73F6 $21 $21 $C1
    or   [hl]                                     ;; 03:73F9 $B6
    jp   nz, label_003_74E1                       ;; 03:73FA $C2 $E1 $74

    ld   a, [wC140]                               ;; 03:73FD $FA $40 $C1
    cp   $00                                      ;; 03:7400 $FE $00
    jp   z, label_003_74E1                        ;; 03:7402 $CA $E1 $74

    ld   hl, wEntitiesDirectionTable              ;; 03:7405 $21 $80 $C3
    add  hl, bc                                   ;; 03:7408 $09
    ldh  a, [hLinkDirection]                      ;; 03:7409 $F0 $9E
    cp   [hl]                                     ;; 03:740B $BE
    jp   z, label_003_74E1                        ;; 03:740C $CA $E1 $74

    ld   de, hActiveEntityPosX                    ;; 03:740F $11 $EE $FF
    ld   hl, wD5C0                                ;; 03:7412 $21 $C0 $D5
    ld   a, [de]                                  ;; 03:7415 $1A
    add  [hl]                                     ;; 03:7416 $86
    push hl                                       ;; 03:7417 $E5
    ld   hl, wC140                                ;; 03:7418 $21 $40 $C1
    sub  [hl]                                     ;; 03:741B $96
    cp   $80                                      ;; 03:741C $FE $80
    jr   c, .jr_7422                              ;; 03:741E $38 $02

    cpl                                           ;; 03:7420 $2F
    inc  a                                        ;; 03:7421 $3C

.jr_7422
    pop  hl                                       ;; 03:7422 $E1
    push af                                       ;; 03:7423 $F5
    inc  hl                                       ;; 03:7424 $23
    ld   a, [wC141]                               ;; 03:7425 $FA $41 $C1
    add  [hl]                                     ;; 03:7428 $86
    ld   e, a                                     ;; 03:7429 $5F
    pop  af                                       ;; 03:742A $F1
    cp   e                                        ;; 03:742B $BB
    jp   nc, label_003_74E1                       ;; 03:742C $D2 $E1 $74

    inc  hl                                       ;; 03:742F $23
    ld   de, hActiveEntityVisualPosY              ;; 03:7430 $11 $EC $FF
    ld   a, [de]                                  ;; 03:7433 $1A
    add  [hl]                                     ;; 03:7434 $86
    push hl                                       ;; 03:7435 $E5
    ld   hl, wC142                                ;; 03:7436 $21 $42 $C1
    sub  [hl]                                     ;; 03:7439 $96
    cp   $80                                      ;; 03:743A $FE $80
    jr   c, .jr_7440                              ;; 03:743C $38 $02

    cpl                                           ;; 03:743E $2F
    inc  a                                        ;; 03:743F $3C

.jr_7440
    pop  hl                                       ;; 03:7440 $E1
    push af                                       ;; 03:7441 $F5
    inc  hl                                       ;; 03:7442 $23
    ld   a, [wC143]                               ;; 03:7443 $FA $43 $C1
    add  [hl]                                     ;; 03:7446 $86
    ld   e, a                                     ;; 03:7447 $5F
    pop  af                                       ;; 03:7448 $F1
    cp   e                                        ;; 03:7449 $BB
    jp   nc, label_003_74E1                       ;; 03:744A $D2 $E1 $74

    call ResetPegasusBoots                        ;; 03:744D $CD $B6 $0C
    ld   a, $08                                   ;; 03:7450 $3E $08
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:7452 $EA $3E $C1
    ld   a, $12                                   ;; 03:7455 $3E $12
    call func_003_7565                            ;; 03:7457 $CD $65 $75
    ld   a, $18                                   ;; 03:745A $3E $18
    call GetVectorTowardsLink                     ;; 03:745C $CD $45 $7E
    ldh  a, [hMultiPurpose0]                      ;; 03:745F $F0 $D7
    cpl                                           ;; 03:7461 $2F
    inc  a                                        ;; 03:7462 $3C
    ld   hl, wEntitiesRecoilVelocityY             ;; 03:7463 $21 $00 $C4
    add  hl, bc                                   ;; 03:7466 $09
    ld   [hl], a                                  ;; 03:7467 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:7468 $F0 $D8
    cpl                                           ;; 03:746A $2F
    inc  a                                        ;; 03:746B $3C
    ld   hl, wEntitiesRecoilVelocityX             ;; 03:746C $21 $F0 $C3
    add  hl, bc                                   ;; 03:746F $09
    ld   [hl], a                                  ;; 03:7470 $77
    call StartIgnoringHitsForEntity               ;; 03:7471 $CD $DB $73
    ld   [hl], $08                                ;; 03:7474 $36 $08
    ; reset sword charge
    xor  a                                        ;; 03:7476 $AF
    ld   [wSwordCharge], a                        ;; 03:7477 $EA $22 $C1
    call func_C50                                 ;; 03:747A $CD $50 $0C
    ld   hl, wIsUsingSpinAttack                   ;; 03:747D $21 $21 $C1
    ld   a, [wC16A]                               ;; 03:7480 $FA $6A $C1
    or   [hl]                                     ;; 03:7483 $B6
    jr   z, .jr_748B                              ;; 03:7484 $28 $05

    ld   a, $0C                                   ;; 03:7486 $3E $0C
    ld   [wC16D], a                               ;; 03:7488 $EA $6D $C1

.jr_748B
    ldh  a, [hActiveEntityType]                   ;; 03:748B $F0 $EB
    cp   ENTITY_BLAINO                            ;; 03:748D $FE $BE
    jr   nz, jr_003_74C1                          ;; 03:748F $20 $30

    ld   a, JINGLE_BUMP                           ;; 03:7491 $3E $09
    ldh  [hJingle], a                             ;; 03:7493 $E0 $F2
    ld   a, [wD205]                               ;; 03:7495 $FA $05 $D2
    cp   $00                                      ;; 03:7498 $FE $00
    jr   z, jr_003_74BF                           ;; 03:749A $28 $23

    cp   $01                                      ;; 03:749C $FE $01
    jr   z, .jr_74B5                              ;; 03:749E $28 $15

    cp   $04                                      ;; 03:74A0 $FE $04
    jr   z, .jr_74B5                              ;; 03:74A2 $28 $11

    cp   $03                                      ;; 03:74A4 $FE $03
    jp   z, jr_003_7571                           ;; 03:74A6 $CA $71 $75

    ld   a, $20                                   ;; 03:74A9 $3E $20
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:74AB $EA $3E $C1
IF !__PATCH_0__
    ld   a, $20                                   ;; 03:74AE $3E $20
ENDC
    call func_003_7565                            ;; 03:74B0 $CD $65 $75
    jr   jr_003_74DC                              ;; 03:74B3 $18 $27

.jr_74B5
    ld   a, $10                                   ;; 03:74B5 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:74B7 $EA $3E $C1
    ld   a, $20                                   ;; 03:74BA $3E $20
    call func_003_7565                            ;; 03:74BC $CD $65 $75

jr_003_74BF:
    jr   jr_003_74DC                              ;; 03:74BF $18 $1B

jr_003_74C1:
    ldh  a, [hLinkDirection]                      ;; 03:74C1 $F0 $9E
    ld   e, a                                     ;; 03:74C3 $5F
    ld   d, b                                     ;; 03:74C4 $50
    ld   hl, Data_003_74E4                        ;; 03:74C5 $21 $E4 $74
    add  hl, de                                   ;; 03:74C8 $19
    ld   a, [wC140]                               ;; 03:74C9 $FA $40 $C1
    add  [hl]                                     ;; 03:74CC $86
    ldh  [hMultiPurpose0], a                      ;; 03:74CD $E0 $D7
    ld   hl, Data_003_74E8                        ;; 03:74CF $21 $E8 $74
    add  hl, de                                   ;; 03:74D2 $19
    ld   a, [wC142]                               ;; 03:74D3 $FA $42 $C1
    add  [hl]                                     ;; 03:74D6 $86
    ldh  [hMultiPurpose1], a                      ;; 03:74D7 $E0 $D8
    call label_D15                                ;; 03:74D9 $CD $15 $0D

jr_003_74DC:
    ld   a, $0C                                   ;; 03:74DC $3E $0C
    ldh  [hLinkPunchedAwayCountdown], a           ;; 03:74DE $E0 $B6
    ret                                           ;; 03:74E0 $C9

label_003_74E1:
    jp   label_003_74EC                           ;; 03:74E1 $C3 $EC $74

Data_003_74E4::
.right: db  $00
.left:  db  $F0
.up:    db  $F8
.down:  db  $FC

Data_003_74E8::
.right: db  $FC
.left:  db  $FC
.up:    db  $F0
.down:  db  $00

label_003_74EC:
    ldh  a, [hFrameCounter]                       ;; 03:74EC $F0 $E7
    xor  c                                        ;; 03:74EE $A9
    rra                                           ;; 03:74EF $1F
    jr   nc, ret_003_7570                         ;; 03:74F0 $30 $7E

    ldh  a, [hLinkPositionX]                      ;; 03:74F2 $F0 $98
    add  $08                                      ;; 03:74F4 $C6 $08
    ldh  [hMultiPurpose0], a                      ;; 03:74F6 $E0 $D7
    ldh  a, [hLinkPositionY]                      ;; 03:74F8 $F0 $99
    add  $08                                      ;; 03:74FA $C6 $08
    ldh  [hMultiPurpose2], a                      ;; 03:74FC $E0 $D9
    ld   de, hActiveEntityPosX                    ;; 03:74FE $11 $EE $FF
    ld   hl, wD5C0                                ;; 03:7501 $21 $C0 $D5
    ld   a, [de]                                  ;; 03:7504 $1A
    add  [hl]                                     ;; 03:7505 $86
    push hl                                       ;; 03:7506 $E5
    ld   hl, hMultiPurpose0                       ;; 03:7507 $21 $D7 $FF
    sub  [hl]                                     ;; 03:750A $96
    cp   $80                                      ;; 03:750B $FE $80
    jr   c, .jr_7511                              ;; 03:750D $38 $02

    cpl                                           ;; 03:750F $2F
    inc  a                                        ;; 03:7510 $3C

.jr_7511
    pop  hl                                       ;; 03:7511 $E1
    push af                                       ;; 03:7512 $F5
    inc  hl                                       ;; 03:7513 $23
    ld   a, $04                                   ;; 03:7514 $3E $04
    add  [hl]                                     ;; 03:7516 $86
    ld   e, a                                     ;; 03:7517 $5F
    pop  af                                       ;; 03:7518 $F1
    cp   e                                        ;; 03:7519 $BB
    jr   nc, ret_003_7570                         ;; 03:751A $30 $54

    inc  hl                                       ;; 03:751C $23
    ld   de, hActiveEntityVisualPosY              ;; 03:751D $11 $EC $FF
    ld   a, [de]                                  ;; 03:7520 $1A
    add  [hl]                                     ;; 03:7521 $86
    push hl                                       ;; 03:7522 $E5
    ld   hl, hMultiPurpose2                       ;; 03:7523 $21 $D9 $FF
    sub  [hl]                                     ;; 03:7526 $96
    cp   $80                                      ;; 03:7527 $FE $80
    jr   c, .jr_752D                              ;; 03:7529 $38 $02

    cpl                                           ;; 03:752B $2F
    inc  a                                        ;; 03:752C $3C

.jr_752D
    pop  hl                                       ;; 03:752D $E1
    push af                                       ;; 03:752E $F5
    inc  hl                                       ;; 03:752F $23
    ld   a, $05                                   ;; 03:7530 $3E $05
    add  [hl]                                     ;; 03:7532 $86
    ld   e, a                                     ;; 03:7533 $5F
    pop  af                                       ;; 03:7534 $F1
    cp   e                                        ;; 03:7535 $BB
    jr   nc, ret_003_7570                         ;; 03:7536 $30 $38

    ld   a, [wInvincibilityCounter]               ;; 03:7538 $FA $C7 $DB
    and  a                                        ;; 03:753B $A7
    jr   nz, ret_003_7570                         ;; 03:753C $20 $32

    call ApplyLinkCollisionWithEnemy              ;; 03:753E $CD $D5 $6C
    ldh  a, [hActiveEntityType]                   ;; 03:7541 $F0 $EB
    cp   ENTITY_BLAINO                            ;; 03:7543 $FE $BE
    jr   nz, ret_003_7570                         ;; 03:7545 $20 $29

    ld   a, [wD205]                               ;; 03:7547 $FA $05 $D2
    and  a                                        ;; 03:754A $A7
    jr   z, ret_003_7570                          ;; 03:754B $28 $23

    cp   $01                                      ;; 03:754D $FE $01
    jr   z, ret_003_7570                          ;; 03:754F $28 $1F

    cp   $04                                      ;; 03:7551 $FE $04
    jr   z, ret_003_7570                          ;; 03:7553 $28 $1B

    cp   $02                                      ;; 03:7555 $FE $02
    jr   nz, jr_003_7571                          ;; 03:7557 $20 $18

    call GetEntityPrivateCountdown1               ;; 03:7559 $CD $00 $0C
    ld   [hl], $A0                                ;; 03:755C $36 $A0
    ld   a, $20                                   ;; 03:755E $3E $20
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:7560 $EA $3E $C1
    ld   a, $30                                   ;; 03:7563 $3E $30

func_003_7565::
    call GetVectorTowardsLink                     ;; 03:7565 $CD $45 $7E
    ldh  a, [hMultiPurpose0]                      ;; 03:7568 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 03:756A $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 03:756C $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 03:756E $E0 $9A

ret_003_7570:
    ret                                           ;; 03:7570 $C9

jr_003_7571:
    ld   hl, wEntitiesInertiaTable                ;; 03:7571 $21 $D0 $C3
    add  hl, bc                                   ;; 03:7574 $09
    ld   a, [hl]                                  ;; 03:7575 $7E
    cp   $22                                      ;; 03:7576 $FE $22
    jr   c, ret_003_7570                          ;; 03:7578 $38 $F6

    ld   a, LINK_MOTION_UNKNOWN_0A                ;; 03:757A $3E $0A
    ld   [wLinkMotionState], a                    ;; 03:757C $EA $1C $C1

    ld   hl, wEntitiesDirectionTable              ;; 03:757F $21 $80 $C3
    add  hl, bc                                   ;; 03:7582 $09
    ld   a, [hl]                                  ;; 03:7583 $7E
    and  a                                        ;; 03:7584 $A7
    ld   a, $30                                   ;; 03:7585 $3E $30
    jr   z, .jr_758B                              ;; 03:7587 $28 $02

    ld   a, $D0                                   ;; 03:7589 $3E $D0

.jr_758B
    ldh  [hLinkSpeedX], a                         ;; 03:758B $E0 $9A
    xor  a                                        ;; 03:758D $AF
    ldh  [hLinkSpeedY], a                         ;; 03:758E $E0 $9B
    ld   a, $30                                   ;; 03:7590 $3E $30
    ldh  [hLinkVelocityZ], a                      ;; 03:7592 $E0 $A3
    ld   a, JINGLE_STRONG_BUMP                    ;; 03:7594 $3E $0B
    ldh  [hJingle], a                             ;; 03:7596 $E0 $F2
    ret                                           ;; 03:7598 $C9

    ld   a, $20                                   ;; 03:7599 $3E $20
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 03:759B $EA $3E $C1
    ld   a, $20                                   ;; 03:759E $3E $20
    jr   func_003_7565                            ;; 03:75A0 $18 $C3

; Check collision with other entities?
; Inputs:
;   c :  entity index
func_003_75A2::
    ld   e, $0F                                   ;; 03:75A2 $1E $0F
    ld   d, $00                                   ;; 03:75A4 $16 $00

    ; For each entity…
entitiesLoop:
    ; If we are checking collision against ourselves,
    ; move to the next entity
    ld   a, e                                     ;; 03:75A6 $7B
    cp   c                                        ;; 03:75A7 $B9
    jp   z, checkNextEntity                       ;; 03:75A8 $CA $9F $77

    ; If we are on an even frame, move to next
    ldh  a, [hFrameCounter]                       ;; 03:75AB $F0 $E7
    xor  e                                        ;; 03:75AD $AB
    and  $01                                      ;; 03:75AE $E6 $01
    jp   nz, checkNextEntity                      ;; 03:75B0 $C2 $9F $77

    ; If the entity is not interactive, move to next
    ld   hl, wEntitiesStatusTable                 ;; 03:75B3 $21 $80 $C2
    add  hl, de                                   ;; 03:75B6 $19
    ld   a, [hl]                                  ;; 03:75B7 $7E
    cp   ENTITY_STATUS_ACTIVE                     ;; 03:75B8 $FE $05
    jp   c, checkNextEntity                       ;; 03:75BA $DA $9F $77

    ; If wEntitiesPhysicsFlagsTable[de] is not 0, move to next
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:75BD $21 $40 $C3
    add  hl, de                                   ;; 03:75C0 $19
    ld   a, [hl]                                  ;; 03:75C1 $7E
    and  ENTITY_PHYSICS_PROJECTILE_NOCLIP         ;; 03:75C2 $E6 $40
    jp   nz, checkNextEntity                      ;; 03:75C4 $C2 $9F $77

    ; If the entities X are far appart, move to next
    ld   hl, wEntitiesPosXTable                   ;; 03:75C7 $21 $00 $C2
    add  hl, de                                   ;; 03:75CA $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:75CB $F0 $EE
    sub  [hl]                                     ;; 03:75CD $96
    add  $0C                                      ;; 03:75CE $C6 $0C
    cp   $18                                      ;; 03:75D0 $FE $18
    jp   nc, checkNextEntity                      ;; 03:75D2 $D2 $9F $77

    ; If the entitiesY are far appart, more to next
    ld   hl, wEntitiesPosYTable                   ;; 03:75D5 $21 $10 $C2
    add  hl, de                                   ;; 03:75D8 $19
    ld   a, [hl]                                  ;; 03:75D9 $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:75DA $21 $10 $C3
    add  hl, de                                   ;; 03:75DD $19
    sub  [hl]                                     ;; 03:75DE $96
    ld   hl, hActiveEntityVisualPosY              ;; 03:75DF $21 $EC $FF
    sub  [hl]                                     ;; 03:75E2 $96
    add  $0C                                      ;; 03:75E3 $C6 $0C
    cp   $18                                      ;; 03:75E5 $FE $18
    jp   nc, checkNextEntity                      ;; 03:75E7 $D2 $9F $77

    ; If wEntitiesSpriteVariantTable is $FF, move to next
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:75EA $21 $B0 $C3
    add  hl, de                                   ;; 03:75ED $19
    ld   a, [hl]                                  ;; 03:75EE $7E
    cp   $FF                                      ;; 03:75EF $FE $FF
    jp   z, checkNextEntity                       ;; 03:75F1 $CA $9F $77

    ; If the active entity is a Bouncing Bombite…
    ldh  a, [hActiveEntityType]                   ;; 03:75F4 $F0 $EB
    cp   ENTITY_BOUNCING_BOMBITE                  ;; 03:75F6 $FE $55
    jr   nz, .selfBombiteEnd                      ;; 03:75F8 $20 $04
    ; wEntitiesSpriteVariantTable[de] = GetEntityTransitionCountdown
    call GetEntityTransitionCountdown             ;; 03:75FA $CD $05 $0C
    ld   [hl], b                                  ;; 03:75FD $70
.selfBombiteEnd

    ; If the collisionned entity is a Bouncing Bombite…
    ld   hl, wEntitiesTypeTable                   ;; 03:75FE $21 $A0 $C3
    add  hl, de                                   ;; 03:7601 $19
    ld   a, [hl]                                  ;; 03:7602 $7E
    cp   ENTITY_BOUNCING_BOMBITE                  ;; 03:7603 $FE $55
    jr   nz, .bombiteEnd                          ;; 03:7605 $20 $29

    ld   hl, wEntitiesSpeedXTable                 ;; 03:7607 $21 $40 $C2
    add  hl, bc                                   ;; 03:760A $09
    ld   a, [hl]                                  ;; 03:760B $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:760C $21 $40 $C2
    add  hl, de                                   ;; 03:760F $19
    ld   [hl], a                                  ;; 03:7610 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7611 $21 $50 $C2
    add  hl, bc                                   ;; 03:7614 $09
    ld   a, [hl]                                  ;; 03:7615 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7616 $21 $50 $C2
    add  hl, de                                   ;; 03:7619 $19
    ld   [hl], a                                  ;; 03:761A $77
    ld   hl, wEntitiesTransitionCountdownTable    ;; 03:761B $21 $E0 $C2
    add  hl, de                                   ;; 03:761E $19
    ld   [hl], $40                                ;; 03:761F $36 $40
    ld   hl, wEntitiesStateTable                  ;; 03:7621 $21 $90 $C2
    add  hl, de                                   ;; 03:7624 $19
    ld   [hl], $02                                ;; 03:7625 $36 $02
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 03:7627 $21 $F0 $C2
    add  hl, de                                   ;; 03:762A $19
    ld   [hl], $08                                ;; 03:762B $36 $08

    jp   checkNextEntity                          ;; 03:762D $C3 $9F $77
.bombiteEnd

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:7630 $21 $40 $C3
    add  hl, de                                   ;; 03:7633 $19
    ld   a, [hl]                                  ;; 03:7634 $7E
    and  ENTITY_PHYSICS_GRABBABLE                 ;; 03:7635 $E6 $20
    jp   nz, label_003_7715                       ;; 03:7637 $C2 $15 $77

    ldh  a, [hActiveEntityType]                   ;; 03:763A $F0 $EB
    cp   ENTITY_MAGIC_POWDER_SPRINKLE             ;; 03:763C $FE $08
    jr   z, forceCollisionEnd                     ;; 03:763E $28 $28

    ; If checking collisions against the Final Nightmare…
    ld   hl, wEntitiesTypeTable                   ;; 03:7640 $21 $A0 $C3
    add  hl, de                                   ;; 03:7643 $19
    ld   a, [hl]                                  ;; 03:7644 $7E
    cp   ENTITY_FINAL_NIGHTMARE                   ;; 03:7645 $FE $E6
    jr   nz, .finalNightmareEnd                   ;; 03:7647 $20 $0D
    ; … and this is Final Nightmare final form…
    ld   a, [wFinalNightmareForm]                 ;; 03:7649 $FA $19 $D2
    cp   $05                                      ;; 03:764C $FE $05
    jr   nz, .finalNightmareEnd                   ;; 03:764E $20 $06
    ; … and active sprite != 2…
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:7650 $F0 $F1
    cp   $02                                      ;; 03:7652 $FE $02
    ; … force a collisition.
    jr   nz, forceCollision                       ;; 03:7654 $20 $09
.finalNightmareEnd

    ; If bit 7 of entity hitbox flag is set…
    ld   hl, wEntitiesHitboxFlagsTable            ;; 03:7656 $21 $50 $C3
    add  hl, de                                   ;; 03:7659 $19
    ld   a, [hl]                                  ;; 03:765A $7E
    and  $80                                      ;; 03:765B $E6 $80
    jr   z, forceCollisionEnd                     ;; 03:765D $28 $09
forceCollision:
    ld   hl, wEntitiesCollisionsTable             ;; 03:765F $21 $A0 $C2
    add  hl, bc                                   ;; 03:7662 $09
    ld   [hl], $01                                ;; 03:7663 $36 $01
    jp   jr_003_7737                              ;; 03:7665 $C3 $37 $77
forceCollisionEnd:

    ldh  a, [hActiveEntityType]                   ;; 03:7668 $F0 $EB
    cp   ENTITY_MAGIC_POWDER_SPRINKLE             ;; 03:766A $FE $08
    jr   nz, jr_003_76AC                          ;; 03:766C $20 $3E

    ld   hl, wEntitiesTypeTable                   ;; 03:766E $21 $A0 $C3
    add  hl, de                                   ;; 03:7671 $19
    ld   a, [hl]                                  ;; 03:7672 $7E
    cp   $CA                                      ;; 03:7673 $FE $CA
    jr   nz, .jr_7680                             ;; 03:7675 $20 $09

    ld   hl, wEntitiesStateTable                  ;; 03:7677 $21 $90 $C2
    add  hl, de                                   ;; 03:767A $19
    ld   a, [hl]                                  ;; 03:767B $7E
    and  a                                        ;; 03:767C $A7
    jr   nz, jr_003_76AC                          ;; 03:767D $20 $2D

    inc  [hl]                                     ;; 03:767F $34

.jr_7680
    cp   $3F                                      ;; 03:7680 $FE $3F
    jr   nz, jr_003_76AC                          ;; 03:7682 $20 $28

    ld   a, [wIsIndoor]                           ;; 03:7684 $FA $A5 $DB
    and  a                                        ;; 03:7687 $A7
    jr   nz, jr_003_76AC                          ;; 03:7688 $20 $22

    ld   hl, wEntitiesStateTable                  ;; 03:768A $21 $90 $C2
    add  hl, de                                   ;; 03:768D $19
    ld   a, [hl]                                  ;; 03:768E $7E
    and  a                                        ;; 03:768F $A7
    jr   nz, jr_003_76AC                          ;; 03:7690 $20 $1A

    inc  [hl]                                     ;; 03:7692 $34
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 03:7693 $21 $50 $C4
    add  hl, de                                   ;; 03:7696 $19
    ld   [hl], $7F                                ;; 03:7697 $36 $7F
    ld   hl, wEntitiesFlashCountdownTable         ;; 03:7699 $21 $20 $C4
    add  hl, de                                   ;; 03:769C $19
    ld   [hl], $10                                ;; 03:769D $36 $10
    ld   a, $03                                   ;; 03:769F $3E $03
    ld   [wCurrentBank], a                        ;; 03:76A1 $EA $AF $DB
    call label_27F2                               ;; 03:76A4 $CD $F2 $27
    ld   a, $18                                   ;; 03:76A7 $3E $18
    ld   [wCurrentBank], a                        ;; 03:76A9 $EA $AF $DB

jr_003_76AC:
    ld   hl, wEntitiesHitboxFlagsTable            ;; 03:76AC $21 $50 $C3
    add  hl, de                                   ;; 03:76AF $19
    ld   a, [hl]                                  ;; 03:76B0 $7E
    and  $80                                      ;; 03:76B1 $E6 $80
    jp   nz, checkNextEntity                      ;; 03:76B3 $C2 $9F $77

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:76B6 $21 $10 $C4
    add  hl, de                                   ;; 03:76B9 $19
    ld   a, [hl]                                  ;; 03:76BA $7E
    and  a                                        ;; 03:76BB $A7
    jp   nz, checkNextEntity                      ;; 03:76BC $C2 $9F $77

    ld   hl, wEntitiesTypeTable                   ;; 03:76BF $21 $A0 $C3
    add  hl, de                                   ;; 03:76C2 $19
    ld   a, [hl]                                  ;; 03:76C3 $7E
    cp   ENTITY_IRON_MASK                         ;; 03:76C4 $FE $24
    jr   nz, jr_003_7710                          ;; 03:76C6 $20 $48

    ld   hl, wEntitiesDirectionTable              ;; 03:76C8 $21 $80 $C3
    add  hl, de                                   ;; 03:76CB $19
    ld   a, [hl]                                  ;; 03:76CC $7E
    xor  $01                                      ;; 03:76CD $EE $01
    ld   hl, wEntitiesDirectionTable              ;; 03:76CF $21 $80 $C3
    add  hl, bc                                   ;; 03:76D2 $09
    cp   [hl]                                     ;; 03:76D3 $BE
    jr   nz, jr_003_7710                          ;; 03:76D4 $20 $3A

    ld   hl, wEntitiesPrivateState2Table          ;; 03:76D6 $21 $C0 $C2
    add  hl, de                                   ;; 03:76D9 $19
    ld   a, [hl]                                  ;; 03:76DA $7E
    and  a                                        ;; 03:76DB $A7
    jr   nz, jr_003_7710                          ;; 03:76DC $20 $32

    ldh  a, [hActiveEntityType]                   ;; 03:76DE $F0 $EB
    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:76E0 $FE $03
    jp   nz, forceCollision                       ;; 03:76E2 $C2 $5F $76

    ld   [hl], $01                                ;; 03:76E5 $36 $01
    push de                                       ;; 03:76E7 $D5

    ld   a, ENTITY_IRON_MASKS_MASK                ;; 03:76E8 $3E $32
    call SpawnNewEntity                           ;; 03:76EA $CD $CA $64
    jr   c, .jr_770D                              ;; 03:76ED $38 $1E

    ldh  a, [hMultiPurpose0]                      ;; 03:76EF $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 03:76F1 $21 $00 $C2
    add  hl, de                                   ;; 03:76F4 $19
    ld   [hl], a                                  ;; 03:76F5 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:76F6 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 03:76F8 $21 $10 $C2
    add  hl, de                                   ;; 03:76FB $19
    ld   [hl], a                                  ;; 03:76FC $77
    ld   hl, wEntitiesPrivateState5Table          ;; 03:76FD $21 $90 $C3
    add  hl, de                                   ;; 03:7700 $19
    ld   a, c                                     ;; 03:7701 $79
    inc  a                                        ;; 03:7702 $3C
    ld   [hl], a                                  ;; 03:7703 $77
    ldh  a, [hMultiPurpose2]                      ;; 03:7704 $F0 $D9
    and  $01                                      ;; 03:7706 $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:7708 $21 $B0 $C3
    add  hl, de                                   ;; 03:770B $19
    ld   [hl], a                                  ;; 03:770C $77

.jr_770D
    pop  de                                       ;; 03:770D $D1
    jr   jr_003_7737                              ;; 03:770E $18 $27

jr_003_7710:
    call func_003_77A7                            ;; 03:7710 $CD $A7 $77
    jr   jr_003_7737                              ;; 03:7713 $18 $22

label_003_7715:
    ldh  a, [hActiveEntityType]                   ;; 03:7715 $F0 $EB
    cp   ENTITY_BOOMERANG                         ;; 03:7717 $FE $01
    jr   z, .jr_771F                              ;; 03:7719 $28 $04

    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:771B $FE $03
    jr   nz, jr_003_7734                          ;; 03:771D $20 $15

.jr_771F
    call GetEntityTransitionCountdown             ;; 03:771F $CD $05 $0C
    xor  a                                        ;; 03:7722 $AF
    ld   [hl], a                                  ;; 03:7723 $77
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:7724 $21 $40 $C3
    add  hl, de                                   ;; 03:7727 $19
    ld   a, [hl]                                  ;; 03:7728 $7E
    and  ENTITY_PHYSICS_GRABBABLE                 ;; 03:7729 $E6 $20
    jr   z, jr_003_7737                           ;; 03:772B $28 $0A

    ld   a, c                                     ;; 03:772D $79
    inc  a                                        ;; 03:772E $3C
    ld   hl, wEntitiesPrivateState5Table          ;; 03:772F $21 $90 $C3
    add  hl, de                                   ;; 03:7732 $19
    ld   [hl], a                                  ;; 03:7733 $77

jr_003_7734:
    jp   checkNextEntity                          ;; 03:7734 $C3 $9F $77

jr_003_7737:
    ldh  a, [hActiveEntityType]                   ;; 03:7737 $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ;; 03:7739 $FE $A8
    jr   z, jr_003_775A                           ;; 03:773B $28 $1D

    cp   ENTITY_BOOMERANG                         ;; 03:773D $FE $01
    jr   z, jr_003_779A                           ;; 03:773F $28 $59

    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:7741 $FE $03
    jr   z, jr_003_779A                           ;; 03:7743 $28 $55

    cp   ENTITY_LIFTABLE_ROCK                     ;; 03:7745 $FE $05
    jr   nz, .jr_7751                             ;; 03:7747 $20 $08

    push de                                       ;; 03:7749 $D5
    call func_003_53E4                            ;; 03:774A $CD $E4 $53
    pop  de                                       ;; 03:774D $D1
    jp   checkNextEntity                          ;; 03:774E $C3 $9F $77

.jr_7751
    ld   hl, wEntitiesStatusTable                 ;; 03:7751 $21 $80 $C2
    add  hl, bc                                   ;; 03:7754 $09
    ld   a, [hl]                                  ;; 03:7755 $7E
    cp   $08                                      ;; 03:7756 $FE $08
    jr   nz, jr_003_7782                          ;; 03:7758 $20 $28

jr_003_775A:
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:775A $21 $80 $C4
    add  hl, bc                                   ;; 03:775D $09
    ld   a, [hl]                                  ;; 03:775E $7E
    and  a                                        ;; 03:775F $A7
    jr   nz, checkNextEntity                      ;; 03:7760 $20 $3D

    ld   [hl], $0C                                ;; 03:7762 $36 $0C
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7764 $21 $40 $C2
    add  hl, bc                                   ;; 03:7767 $09
    sra  [hl]                                     ;; 03:7768 $CB $2E
    sra  [hl]                                     ;; 03:776A $CB $2E
    ld   a, [hl]                                  ;; 03:776C $7E
    cpl                                           ;; 03:776D $2F
    ld   [hl], a                                  ;; 03:776E $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:776F $21 $50 $C2
    add  hl, bc                                   ;; 03:7772 $09
    sra  [hl]                                     ;; 03:7773 $CB $2E
    sra  [hl]                                     ;; 03:7775 $CB $2E
    ld   a, [hl]                                  ;; 03:7777 $7E
    cpl                                           ;; 03:7778 $2F
    ld   [hl], a                                  ;; 03:7779 $77
    ld   hl, wEntitiesThrownDirectionTable        ;; 03:777A $21 $D0 $C5
    add  hl, bc                                   ;; 03:777D $09
    ld   [hl], $FF                                ;; 03:777E $36 $FF
    jr   jr_003_779A                              ;; 03:7780 $18 $18

jr_003_7782:
    ld   hl, wEntitiesCollisionsTable             ;; 03:7782 $21 $A0 $C2
    add  hl, bc                                   ;; 03:7785 $09
    ld   a, [hl]                                  ;; 03:7786 $7E
    and  a                                        ;; 03:7787 $A7
    jr   nz, jr_003_779A                          ;; 03:7788 $20 $10

    ldh  a, [hActiveEntityType]                   ;; 03:778A $F0 $EB
    cp   ENTITY_ARROW                             ;; 03:778C $FE $00
    jr   nz, .jr_7795                             ;; 03:778E $20 $05

    ldh  a, [hActiveEntityState]                  ;; 03:7790 $F0 $F0
    and  a                                        ;; 03:7792 $A7
    jr   nz, jr_003_7798                          ;; 03:7793 $20 $03

.jr_7795
    call UnloadEntity                             ;; 03:7795 $CD $8D $3F

jr_003_7798:
    jr   checkNextEntity                          ;; 03:7798 $18 $05

jr_003_779A:
    call GetEntityTransitionCountdown             ;; 03:779A $CD $05 $0C
    xor  a                                        ;; 03:779D $AF
    ld   [hl], a                                  ;; 03:779E $77

checkNextEntity:
    dec  e                                        ;; 03:779F $1D
    ld   a, e                                     ;; 03:77A0 $7B
    cp   $FF                                      ;; 03:77A1 $FE $FF
    jp   nz, entitiesLoop                         ;; 03:77A3 $C2 $A6 $75

    ret                                           ;; 03:77A6 $C9

func_003_77A7::
    ldh  a, [hActiveEntityType]                   ;; 03:77A7 $F0 $EB
    cp   ENTITY_ARROW                             ;; 03:77A9 $FE $00
    jr   nz, .jr_77B8                             ;; 03:77AB $20 $0B

    ldh  a, [hActiveEntityState]                  ;; 03:77AD $F0 $F0
    and  a                                        ;; 03:77AF $A7
    jr   z, .jr_77B8                              ;; 03:77B0 $28 $06

    call GetEntityTransitionCountdown             ;; 03:77B2 $CD $05 $0C
    ld   [hl], $03                                ;; 03:77B5 $36 $03
    ret                                           ;; 03:77B7 $C9

.jr_77B8
    ld   hl, wEntitiesSpeedXTable                 ;; 03:77B8 $21 $40 $C2
    add  hl, bc                                   ;; 03:77BB $09
    ld   a, [hl]                                  ;; 03:77BC $7E
    ld   hl, wEntitiesRecoilVelocityX             ;; 03:77BD $21 $F0 $C3
    add  hl, de                                   ;; 03:77C0 $19
    ld   [hl], a                                  ;; 03:77C1 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 03:77C2 $21 $50 $C2
    add  hl, bc                                   ;; 03:77C5 $09
    ld   a, [hl]                                  ;; 03:77C6 $7E
    ld   hl, wEntitiesRecoilVelocityY             ;; 03:77C7 $21 $00 $C4
    add  hl, de                                   ;; 03:77CA $19
    ld   [hl], a                                  ;; 03:77CB $77
    push bc                                       ;; 03:77CC $C5
    ld   c, e                                     ;; 03:77CD $4B
    ld   b, d                                     ;; 03:77CE $42
    push de                                       ;; 03:77CF $D5
    call func_003_77D6                            ;; 03:77D0 $CD $D6 $77
    pop  de                                       ;; 03:77D3 $D1
    pop  bc                                       ;; 03:77D4 $C1
    ret                                           ;; 03:77D5 $C9

func_003_77D6::
    jp   label_003_71C0                           ;; 03:77D6 $C3 $C0 $71

func_003_77D9::
    ld   e, $0F                                   ;; 03:77D9 $1E $0F
    ld   d, $00                                   ;; 03:77DB $16 $00

jr_003_77DD:
    ld   hl, wEntitiesStatusTable                 ;; 03:77DD $21 $80 $C2
    add  hl, de                                   ;; 03:77E0 $19
    ld   a, [hl]                                  ;; 03:77E1 $7E
    cp   $05                                      ;; 03:77E2 $FE $05
    jr   c, .jr_7834                              ;; 03:77E4 $38 $4E

    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:77E6 $21 $40 $C3
    add  hl, de                                   ;; 03:77E9 $19
    ld   a, [hl]                                  ;; 03:77EA $7E
    and  ENTITY_PHYSICS_PROJECTILE_NOCLIP | ENTITY_PHYSICS_GRABBABLE ;; 03:77EB $E6 $60
    jr   nz, .jr_7834                             ;; 03:77ED $20 $45

    ld   hl, wEntitiesHitboxFlagsTable            ;; 03:77EF $21 $50 $C3
    add  hl, de                                   ;; 03:77F2 $19
    ld   a, [hl]                                  ;; 03:77F3 $7E
    and  $80                                      ;; 03:77F4 $E6 $80
    jr   nz, .jr_7834                             ;; 03:77F6 $20 $3C

    ld   hl, wEntitiesPosXTable                   ;; 03:77F8 $21 $00 $C2
    add  hl, de                                   ;; 03:77FB $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:77FC $F0 $EE
    sub  [hl]                                     ;; 03:77FE $96
    add  $18                                      ;; 03:77FF $C6 $18
    cp   $30                                      ;; 03:7801 $FE $30
    jr   nc, .jr_7834                             ;; 03:7803 $30 $2F

    ld   hl, wEntitiesPosYTable                   ;; 03:7805 $21 $10 $C2
    add  hl, de                                   ;; 03:7808 $19
    ld   a, [hl]                                  ;; 03:7809 $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:780A $21 $10 $C3
    add  hl, de                                   ;; 03:780D $19
    sub  [hl]                                     ;; 03:780E $96
    ld   hl, hActiveEntityVisualPosY              ;; 03:780F $21 $EC $FF
    sub  [hl]                                     ;; 03:7812 $96
    add  $18                                      ;; 03:7813 $C6 $18
    cp   $30                                      ;; 03:7815 $FE $30
    jr   nc, .jr_7834                             ;; 03:7817 $30 $1B

    ld   a, $07                                   ;; 03:7819 $3E $07
    ld   [wC19E], a                               ;; 03:781B $EA $9E $C1
    call func_003_77A7                            ;; 03:781E $CD $A7 $77
    ld   a, $30                                   ;; 03:7821 $3E $30
    call func_003_783B                            ;; 03:7823 $CD $3B $78
    ld   hl, wEntitiesRecoilVelocityY             ;; 03:7826 $21 $00 $C4
    add  hl, de                                   ;; 03:7829 $19
    ldh  a, [hMultiPurpose0]                      ;; 03:782A $F0 $D7
    ld   [hl], a                                  ;; 03:782C $77
    ld   hl, wEntitiesRecoilVelocityX             ;; 03:782D $21 $F0 $C3
    add  hl, de                                   ;; 03:7830 $19
    ldh  a, [hMultiPurpose1]                      ;; 03:7831 $F0 $D8
    ld   [hl], a                                  ;; 03:7833 $77

.jr_7834
    dec  e                                        ;; 03:7834 $1D
    ld   a, e                                     ;; 03:7835 $7B
    cp   $FF                                      ;; 03:7836 $FE $FF
    jr   nz, jr_003_77DD                          ;; 03:7838 $20 $A3

    ret                                           ;; 03:783A $C9

func_003_783B::
    ldh  [hMultiPurpose0], a                      ;; 03:783B $E0 $D7
    ldh  a, [hLinkPositionX]                      ;; 03:783D $F0 $98
    push af                                       ;; 03:783F $F5
    ld   hl, wEntitiesPosXTable                   ;; 03:7840 $21 $00 $C2
    add  hl, de                                   ;; 03:7843 $19
    ld   a, [hl]                                  ;; 03:7844 $7E
    ldh  [hLinkPositionX], a                      ;; 03:7845 $E0 $98
    ldh  a, [hLinkPositionY]                      ;; 03:7847 $F0 $99
    push af                                       ;; 03:7849 $F5
    ld   hl, wEntitiesPosYTable                   ;; 03:784A $21 $10 $C2
    add  hl, de                                   ;; 03:784D $19
    ld   a, [hl]                                  ;; 03:784E $7E
    ldh  [hLinkPositionY], a                      ;; 03:784F $E0 $99
    push de                                       ;; 03:7851 $D5
    ldh  a, [hMultiPurpose0]                      ;; 03:7852 $F0 $D7
    call GetVectorTowardsLink                     ;; 03:7854 $CD $45 $7E
    pop  de                                       ;; 03:7857 $D1
    pop  af                                       ;; 03:7858 $F1
    ldh  [hLinkPositionY], a                      ;; 03:7859 $E0 $99
    pop  af                                       ;; 03:785B $F1
    ldh  [hLinkPositionX], a                      ;; 03:785C $E0 $98
    ret                                           ;; 03:785E $C9

; Added to an entity's x position when checking for collisions with walls.
; Unlike Link, an entity only has one collision point.
; Indexed by:
;  - Row: entity's collision box type
;  - Column: movement direction (right, left, up, down)
EntityCollisionPointsX::
    db   13,  02,  08,  08
    db   10,  06,  08,  08
    db   16, -01,  08,  08
    db   13,  02,  08,  08

; Added to an entity's y position when checking for collisions with walls.
EntityCollisionPointsY::
    db   08,  08,  02,  13
    db   08,  08,  06,  10
    db   08,  08, -01,  16
    db   08,  08,  02,  13

CollisionsTableFlagPerDirection::
    db   $01, $02, $04, $08

; Indexed by: object id - OBJ_PHYSICS_CONVEYOR.
EntityOnConveyorMovementX::
    db    0,  0, -1, +1, +1, -1, +1, -1

EntityOnConveyorMovementY::
    db   +1, -1,  0,  0, +1, +1, -1, -1

; Handle physics between an entity and the Background / objects.
; This includes not being able to clip walls, falling in pits and stuff.
ApplyEntityInteractionWithBackground::
    ld   hl, wEntitiesGroundStatusTable           ;; 03:7893 $21 $70 $C4
    add  hl, bc                                   ;; 03:7896 $09
    ld   a, [hl]                                  ;; 03:7897 $7E
    ldh  [hMultiPurpose0], a                      ;; 03:7898 $E0 $D7

    xor  a                                        ;; 03:789A $AF
    ld   [hl], a                                  ;; 03:789B $77
    ldh  [hMultiPurpose1], a                      ;; 03:789C $E0 $D8
    ld   [wEntityHorizontallyCollidedObject], a   ;; 03:789E $EA $03 $C5
    ld   [wEntityVerticallyCollidedObject], a     ;; 03:78A1 $EA $0D $C5

    ; If entity z position is positive (and not zero), skip handling water and tall grass
    ld   hl, wEntitiesPosZTable                   ;; 03:78A4 $21 $10 $C3
    add  hl, bc                                   ;; 03:78A7 $09
    ld   a, [hl]                                  ;; 03:78A8 $7E
    bit  7, a                                     ;; 03:78A9 $CB $7F
    jr   nz, .negativeZ                           ;; 03:78AB $20 $04

    and  a                                        ;; 03:78AD $A7
    jp   nz, .interactWithGroundEnd               ;; 03:78AE $C2 $18 $7A

.negativeZ
    ld   hl, wEntitiesUnknowTableJ                ;; 03:78B1 $21 $F0 $C4
    add  hl, bc                                   ;; 03:78B4 $09
    ld   [hl], b                                  ;; 03:78B5 $70
    ld   hl, wEntitiesOptions1Table               ;; 03:78B6 $21 $30 $C4
    add  hl, bc                                   ;; 03:78B9 $09
    ld   a, [hl]                                  ;; 03:78BA $7E
    bit  ENTITY_OPT1_B_NO_GROUND_INTERACTION, a   ;; 03:78BB $CB $67
    jp   nz, .interactWithGroundEnd               ;; 03:78BD $C2 $18 $7A

    call func_003_7E0E                            ;; 03:78C0 $CD $0E $7E
    jr   .skipTouchedDeepWater                    ;; 03:78C3 $18 $1E

.touchedDeepWater
    ld   e, $02                                   ;; 03:78C5 $1E $02
    ldh  a, [hActiveEntityType]                   ;; 03:78C7 $F0 $EB
    cp   ENTITY_FISH                              ;; 03:78C9 $FE $CC
    jr   z, .setGroundStatus                      ;; 03:78CB $28 $3A

    cp   ENTITY_PEAHAT                            ;; 03:78CD $FE $A0
    jr   z, .setGroundStatus                      ;; 03:78CF $28 $36

    cp   ENTITY_ROOSTER                           ;; 03:78D1 $FE $D5
    jr   z, .setGroundStatus                      ;; 03:78D3 $28 $32

    cp   ENTITY_BOW_WOW                           ;; 03:78D5 $FE $6D
    jr   z, .setGroundStatus                      ;; 03:78D7 $28 $2E

    cp   ENTITY_MARIN_AT_THE_SHORE                ;; 03:78D9 $FE $C1
    jr   z, .setGroundStatus                      ;; 03:78DB $28 $2A

    call UnloadEntity                             ;; 03:78DD $CD $8D $3F
    jp   .createWaterSplash                       ;; 03:78E0 $C3 $5C $79

.skipTouchedDeepWater
    ; Deep water/lava
    ld   e, ENTITY_GROUND_STATUS_DEEP_WATER       ;; 03:78E3 $1E $01
    ldh  a, [hObjectUnderEntity]                  ;; 03:78E5 $F0 $AF
    cp   OBJECT_WATER_LADDER_SIDESCROLL           ;; 03:78E7 $FE $67
    jr   z, .setGroundStatus                      ;; 03:78E9 $28 $1C

    ldh  a, [hMultiPurpose3]                      ;; 03:78EB $F0 $DA
    and  a                                        ;; 03:78ED $A7
    jp   z, .interactWithGroundEnd                ;; 03:78EE $CA $18 $7A

    cp   OBJ_PHYSICS_LAVA                         ;; 03:78F1 $FE $0B
    jr   z, .touchedDeepWater                     ;; 03:78F3 $28 $D0

    cp   OBJ_PHYSICS_DEEP_WATER                   ;; 03:78F5 $FE $07
    jr   z, .touchedDeepWater                     ;; 03:78F7 $28 $CC

    cp   OBJ_PHYSICS_WATER_SIDESCROLL             ;; 03:78F9 $FE $B0
    jr   z, .setGroundStatus                      ;; 03:78FB $28 $0A

    ; Shallow water
    inc  e                                        ;; 03:78FD $1C
    cp   OBJ_PHYSICS_SHALLOW_WATER                ;; 03:78FE $FE $05
    jr   z, .setGroundStatus                      ;; 03:7900 $28 $05

    ; Tall grass
    cp   OBJ_PHYSICS_GRASS                        ;; 03:7902 $FE $06
    jr   nz, .setGroundStatusEnd                  ;; 03:7904 $20 $06

    inc  e                                        ;; 03:7906 $1C

.setGroundStatus
    ld   hl, wEntitiesGroundStatusTable           ;; 03:7907 $21 $70 $C4
    add  hl, bc                                   ;; 03:790A $09
    ld   [hl], e                                  ;; 03:790B $73

.setGroundStatusEnd
    ; Create water splash if entity has fallen into water or lava.
    ld   hl, wEntitiesOptions1Table               ;; 03:790C $21 $30 $C4
    add  hl, bc                                   ;; 03:790F $09
    ld   a, [hl]                                  ;; 03:7910 $7E
    and  ENTITY_OPT1_SPLASH_IN_WATER              ;; 03:7911 $E6 $08
    jr   z, .createWaterSplashEnd                 ;; 03:7913 $28 $5E

    ; If ground status has changed...
    ld   hl, wEntitiesGroundStatusTable           ;; 03:7915 $21 $70 $C4
    add  hl, bc                                   ;; 03:7918 $09
    ldh  a, [hMultiPurpose0]                      ;; 03:7919 $F0 $D7
    cp   [hl]                                     ;; 03:791B $BE
    jr   z, .createWaterSplashEnd                 ;; 03:791C $28 $55

    ; ...and neither the previous or current status is "tall grass"...
    ld   a, [hl]                                  ;; 03:791E $7E
    cp   ENTITY_GROUND_STATUS_TALL_GRASS          ;; 03:791F $FE $03
    jr   z, .createWaterSplashEnd                 ;; 03:7921 $28 $50

    ldh  a, [hMultiPurpose0]                      ;; 03:7923 $F0 $D7
    cp   ENTITY_GROUND_STATUS_TALL_GRASS          ;; 03:7925 $FE $03
    jr   z, .createWaterSplashEnd                 ;; 03:7927 $28 $4A

    ldh  a, [hIsSideScrolling]                    ;; 03:7929 $F0 $F9
    and  a                                        ;; 03:792B $A7
    jr   nz, .sidescrolling                       ;; 03:792C $20 $0F

    ; ...and moving down...
    ld   hl, wEntitiesSpeedZTable                 ;; 03:792E $21 $20 $C3
    add  hl, bc                                   ;; 03:7931 $09
    ld   a, [hl]                                  ;; 03:7932 $7E
    bit  7, a                                     ;; 03:7933 $CB $7F
    jr   z, .createWaterSplashEnd                 ;; 03:7935 $28 $3C

    ; ...fast enough...
    cp   $E7                                      ;; 03:7937 $FE $E7
    jr   nc, .createWaterSplashEnd                ;; 03:7939 $30 $38

    jr   .sidescrollingEnd                        ;; 03:793B $18 $17

.sidescrolling
    ldh  a, [hActiveEntityType]                   ;; 03:793D $F0 $EB
    cp   ENTITY_CHEEP_CHEEP_JUMPING               ;; 03:793F $FE $AC
    jr   z, .sidescrollingEnd                     ;; 03:7941 $28 $11

    ld   hl, wEntitiesSpeedYTable                 ;; 03:7943 $21 $50 $C2
    add  hl, bc                                   ;; 03:7946 $09
    ld   a, [hl]                                  ;; 03:7947 $7E
    bit  7, a                                     ;; 03:7948 $CB $7F
    jr   nz, .sidescrollingEnd                    ;; 03:794A $20 $08

    ld   [hl], $00                                ;; 03:794C $36 $00
    ld   hl, wEntitiesSpeedXTable                 ;; 03:794E $21 $40 $C2
    add  hl, bc                                   ;; 03:7951 $09
    sra  [hl]                                     ;; 03:7952 $CB $2E

.sidescrollingEnd
    ld   hl, wEntitiesPrivateCountdown3Table      ;; 03:7954 $21 $80 $C4
    add  hl, bc                                   ;; 03:7957 $09
    ld   a, [hl]                                  ;; 03:7958 $7E
    and  a                                        ;; 03:7959 $A7
    jr   nz, .createWaterSplashEnd                ;; 03:795A $20 $17

.createWaterSplash
    ld   hl, wEntitiesPosXTable                   ;; 03:795C $21 $00 $C2
    add  hl, bc                                   ;; 03:795F $09
    ld   a, [hl]                                  ;; 03:7960 $7E
    ldh  [hMultiPurpose0], a                      ;; 03:7961 $E0 $D7
    ld   hl, wEntitiesPosYTable                   ;; 03:7963 $21 $10 $C2
    add  hl, bc                                   ;; 03:7966 $09
    ld   a, [hl]                                  ;; 03:7967 $7E
    ldh  [hMultiPurpose1], a                      ;; 03:7968 $E0 $D8
    ld   a, JINGLE_WATER_SPLASH                   ;; 03:796A $3E $0E
    ldh  [hJingle], a                             ;; 03:796C $E0 $F2
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 03:796E $3E $01
    call AddTranscientVfx                         ;; 03:7970 $CD $C7 $0C

.createWaterSplashEnd
    ldh  a, [hMultiPurpose3]                      ;; 03:7973 $F0 $DA
    inc  a                                        ;; 03:7975 $3C
    cp   OBJ_PHYSICS_CONVEYOR + 1                 ;; 03:7976 $FE $F1
    jr   c, .conveyorEnd                          ;; 03:7978 $38 $22

    ; If OBJ_PHYSICS_COVEYOR <= object physics < 0xFF, move entity every 4 frames.
    sub  OBJ_PHYSICS_CONVEYOR + 1                 ;; 03:797A $D6 $F1
    ld   e, a                                     ;; 03:797C $5F
    ld   d, b                                     ;; 03:797D $50
    ldh  a, [hFrameCounter]                       ;; 03:797E $F0 $E7
    and  $03                                      ;; 03:7980 $E6 $03
    jr   nz, .conveyorMovementEnd                 ;; 03:7982 $20 $16

    ld   hl, EntityOnConveyorMovementX            ;; 03:7984 $21 $83 $78
    add  hl, de                                   ;; 03:7987 $19
    ld   a, [hl]                                  ;; 03:7988 $7E
    ld   hl, wEntitiesPosXTable                   ;; 03:7989 $21 $00 $C2
    add  hl, bc                                   ;; 03:798C $09
    add  [hl]                                     ;; 03:798D $86
    ld   [hl], a                                  ;; 03:798E $77
    ld   hl, EntityOnConveyorMovementY            ;; 03:798F $21 $8B $78
    add  hl, de                                   ;; 03:7992 $19
    ld   a, [hl]                                  ;; 03:7993 $7E
    ld   hl, wEntitiesPosYTable                   ;; 03:7994 $21 $10 $C2
    add  hl, bc                                   ;; 03:7997 $09
    add  [hl]                                     ;; 03:7998 $86
    ld   [hl], a                                  ;; 03:7999 $77

.conveyorMovementEnd
    jr   .interactWithGroundEnd                   ;; 03:799A $18 $7C

.conveyorEnd
    ldh  a, [hObjectUnderEntity]                  ;; 03:799C $F0 $AF
    cp   OBJECT_WELL                              ;; 03:799E $FE $61
    jr   z, .onPit                                ;; 03:79A0 $28 $0A

    ldh  a, [hMultiPurpose3]                      ;; 03:79A2 $F0 $DA
    cp   OBJ_PHYSICS_PIT                          ;; 03:79A4 $FE $50
    jr   z, .onPit                                ;; 03:79A6 $28 $04

    cp   OBJ_PHYSICS_PIT_WARP                     ;; 03:79A8 $FE $51
    jr   nz, .interactWithGroundEnd               ;; 03:79AA $20 $6C

.onPit
    ; BowWow, the Rooster, Heart Containers and Marin don't fall down pits.
    ldh  a, [hActiveEntityType]                   ;; 03:79AC $F0 $EB
    cp   ENTITY_BOW_WOW                           ;; 03:79AE $FE $6D
    jr   z, .interactWithGroundEnd                ;; 03:79B0 $28 $66

    cp   ENTITY_ROOSTER                           ;; 03:79B2 $FE $D5
    jr   z, .interactWithGroundEnd                ;; 03:79B4 $28 $62

    cp   ENTITY_HEART_CONTAINER                   ;; 03:79B6 $FE $36
    jr   z, .interactWithGroundEnd                ;; 03:79B8 $28 $5E

    cp   ENTITY_MARIN_AT_THE_SHORE                ;; 03:79BA $FE $C1
    jr   nz, .fall                                ;; 03:79BC $20 $0D

    ; But if Marin is on a well, and Link is falling down, Marin falls down too.
    ld   a, [wLinkMotionState]                    ;; 03:79BE $FA $1C $C1
    cp   LINK_MOTION_FALLING_DOWN                 ;; 03:79C1 $FE $06
    jr   nz, .interactWithGroundEnd               ;; 03:79C3 $20 $53

    ldh  a, [hObjectUnderEntity]                  ;; 03:79C5 $F0 $AF
    cp   OBJECT_WELL                              ;; 03:79C7 $FE $61
    jr   nz, .interactWithGroundEnd               ;; 03:79C9 $20 $4D

.fall
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:79CB $21 $10 $C4
    add  hl, bc                                   ;; 03:79CE $09
    ld   a, [hl]                                  ;; 03:79CF $7E
    and  a                                        ;; 03:79D0 $A7
    jr   z, .interactWithGroundEnd                ;; 03:79D1 $28 $45

    dec  [hl]                                     ;; 03:79D3 $35
    ld   hl, wEntitiesFlashCountdownTable         ;; 03:79D4 $21 $20 $C4
    add  hl, bc                                   ;; 03:79D7 $09
    ld   [hl], $00                                ;; 03:79D8 $36 $00
    ld   hl, wEntitiesStatusTable                 ;; 03:79DA $21 $80 $C2
    add  hl, bc                                   ;; 03:79DD $09
    ld   [hl], ENTITY_STATUS_FALLING              ;; 03:79DE $36 $02
    ldh  a, [hIntersectedObjectLeft]              ;; 03:79E0 $F0 $CE
    add  $08                                      ;; 03:79E2 $C6 $08
    ld   hl, wEntitiesFallingTargetXTable         ;; 03:79E4 $21 $B0 $C4
    add  hl, bc                                   ;; 03:79E7 $09
    ld   [hl], a                                  ;; 03:79E8 $77
    ldh  a, [hIntersectedObjectTop]               ;; 03:79E9 $F0 $CD
    add  $10                                      ;; 03:79EB $C6 $10
    ld   hl, wEntitiesFallingTargetYTable         ;; 03:79ED $21 $C0 $C4
    add  hl, bc                                   ;; 03:79F0 $09
    ld   [hl], a                                  ;; 03:79F1 $77
    call GetEntityTransitionCountdown             ;; 03:79F2 $CD $05 $0C
    ld   [hl], $6F                                ;; 03:79F5 $36 $6F

    ldh  a, [hActiveEntityType]                   ;; 03:79F7 $F0 $EB
    cp   ENTITY_MOBLIN_SWORD                      ;; 03:79F9 $FE $14
    jr   z, .interactWithGroundEnd                ;; 03:79FB $28 $1B

    cp   ENTITY_MOBLIN                            ;; 03:79FD $FE $0B
    jr   z, .interactWithGroundEnd                ;; 03:79FF $28 $17

    cp   ENTITY_OCTOROK                           ;; 03:7A01 $FE $09
    jr   z, .interactWithGroundEnd                ;; 03:7A03 $28 $13

    ld   [hl], $48                                ;; 03:7A05 $36 $48
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:7A07 $21 $10 $C4
    add  hl, bc                                   ;; 03:7A0A $09
    ld   a, [hl]                                  ;; 03:7A0B $7E
    and  a                                        ;; 03:7A0C $A7
    jr   nz, .interactWithGroundEnd               ;; 03:7A0D $20 $09

    call GetEntityTransitionCountdown             ;; 03:7A0F $CD $05 $0C
    ld   [hl], $2F                                ;; 03:7A12 $36 $2F
    ld   a, JINGLE_ITEM_FALLING                   ;; 03:7A14 $3E $18
    ldh  [hJingle], a                             ;; 03:7A16 $E0 $F2

.interactWithGroundEnd
    ; BowWow doesn't collide with walls, etc.
    ldh  a, [hActiveEntityType]                   ;; 03:7A18 $F0 $EB
    cp   ENTITY_BOW_WOW                           ;; 03:7A1A $FE $6D
    jp   z, .return                               ;; 03:7A1C $CA $84 $7A

    xor  a                                        ;; 03:7A1F $AF
    ld   [wEntityHorizontallyCollidedObject], a   ;; 03:7A20 $EA $03 $C5
    ld   hl, wEntitiesHitboxFlagsTable            ;; 03:7A23 $21 $50 $C3
    add  hl, bc                                   ;; 03:7A26 $09
    ld   a, [hl]                                  ;; 03:7A27 $7E
    and  $03                                      ;; 03:7A28 $E6 $03
    sla  a                                        ;; 03:7A2A $CB $27
    sla  a                                        ;; 03:7A2C $CB $27
    ldh  [hMultiPurpose0], a                      ;; 03:7A2E $E0 $D7
    ld   hl, wEntitiesCollisionsTable             ;; 03:7A30 $21 $A0 $C2
    add  hl, bc                                   ;; 03:7A33 $09
    xor  a                                        ;; 03:7A34 $AF
    ld   [hl], a                                  ;; 03:7A35 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7A36 $21 $40 $C2
    add  hl, bc                                   ;; 03:7A39 $09
    ld   a, [hl]                                  ;; 03:7A3A $7E
    cp   $00                                      ;; 03:7A3B $FE $00
    jr   z, .collisionXEnd                        ;; 03:7A3D $28 $1E

    ld   de, $00                                  ;; 03:7A3F $11 $00 $00
    and  $80                                      ;; 03:7A42 $E6 $80
    jr   z, .positiveX                            ;; 03:7A44 $28 $01

    inc  e                                        ;; 03:7A46 $1C

.positiveX
    call ApplyEntityCollisionWithObject           ;; 03:7A47 $CD $CD $7A
    jr   c, .collisionXEnd                        ;; 03:7A4A $38 $11

    ldh  a, [hObjectUnderEntity]                  ;; 03:7A4C $F0 $AF
    ld   [wEntityHorizontallyCollidedObject], a   ;; 03:7A4E $EA $03 $C5

    ldh  a, [hActiveEntityNoBGCollision]          ;; 03:7A51 $F0 $BE
    and  a                                        ;; 03:7A53 $A7
    jr   nz, .collisionXEnd                       ;; 03:7A54 $20 $07

    ld   hl, wEntitiesPosXTable                   ;; 03:7A56 $21 $00 $C2
    add  hl, bc                                   ;; 03:7A59 $09
    ldh  a, [hActiveEntityPosX]                   ;; 03:7A5A $F0 $EE
    ld   [hl], a                                  ;; 03:7A5C $77

.collisionXEnd
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7A5D $21 $50 $C2
    add  hl, bc                                   ;; 03:7A60 $09
    ld   a, [hl]                                  ;; 03:7A61 $7E
    cp   $00                                      ;; 03:7A62 $FE $00
    jr   z, .return                               ;; 03:7A64 $28 $1E

    ld   de, $02                                  ;; 03:7A66 $11 $02 $00
    and  $80                                      ;; 03:7A69 $E6 $80
    jr   nz, .negativeY                           ;; 03:7A6B $20 $01

    inc  e                                        ;; 03:7A6D $1C

.negativeY
    call ApplyEntityCollisionWithObject           ;; 03:7A6E $CD $CD $7A
    jr   c, .return                               ;; 03:7A71 $38 $11

    ldh  a, [hObjectUnderEntity]                  ;; 03:7A73 $F0 $AF
    ld   [wEntityVerticallyCollidedObject], a     ;; 03:7A75 $EA $0D $C5
    ldh  a, [hActiveEntityNoBGCollision]          ;; 03:7A78 $F0 $BE
    and  a                                        ;; 03:7A7A $A7
    jr   nz, .return                              ;; 03:7A7B $20 $07

    ld   hl, wEntitiesPosYTable                   ;; 03:7A7D $21 $10 $C2
    add  hl, bc                                   ;; 03:7A80 $09
    ldh  a, [hActiveEntityPosY]                   ;; 03:7A81 $F0 $EF
    ld   [hl], a                                  ;; 03:7A83 $77

.return
    ret                                           ;; 03:7A84 $C9

FineCollisionShapes::
; Open door
._7C
    db 1, 0
    db 1, 0
._7D
    db 0, 1
    db 0, 1
._7E
    db 1, 1
    db 0, 0
._7F
    db 0, 0
    db 1, 1
; Fine collision
._80
    db 1, 0
    db 1, 0
._81
    db 0, 1
    db 0, 1
._82
    db 1, 1
    db 0, 0
._83
    db 0, 0
    db 1, 1
._84
    db 0, 1
    db 1, 1
._85
    db 1, 0
    db 1, 1
._86
    db 1, 1
    db 0, 1
._87
    db 1, 1
    db 1, 0
._88
    db 1, 0
    db 0, 0
._89
    db 0, 1
    db 0, 0
._8A
    db 0, 0
    db 1, 0
._8B
    db 0, 0
    db 0, 1
._8C
    db 0, 1
    db 1, 0
._8D
    db 1, 0
    db 0, 1

; Handle collision between a collision point an entity and
; the tile below that pixel.
;
; Inputs:
;   bc             entity index
;   de             movement direction
;   hMultiPurpose0 entity's collision box type * 4
;
; Output:
;   c                  set carry flag if no collision took place
;   hObjectUnderEntity type of the object the entity collided with
ApplyEntityCollisionWithObject::
    ;
    ; Compute the type of the object under the given entity
    ;
    push bc                                       ;; 03:7ACD $C5
    ld   hl, wEntitiesPosXTable                   ;; 03:7ACE $21 $00 $C2
    add  hl, bc                                   ;; 03:7AD1 $09
    ld   a, [hl]                                  ;; 03:7AD2 $7E
    sub  $08                                      ;; 03:7AD3 $D6 $08
    push af                                       ;; 03:7AD5 $F5
    ldh  a, [hMultiPurpose0]                      ;; 03:7AD6 $F0 $D7
    ld   c, a                                     ;; 03:7AD8 $4F
    pop  af                                       ;; 03:7AD9 $F1
    ld   hl, EntityCollisionPointsX               ;; 03:7ADA $21 $5F $78
    add  hl, bc                                   ;; 03:7ADD $09
    add  hl, de                                   ;; 03:7ADE $19
    add  [hl]                                     ;; 03:7ADF $86
    ldh  [hMultiPurpose4], a                      ;; 03:7AE0 $E0 $DB
    swap a                                        ;; 03:7AE2 $CB $37
    and  $0F                                      ;; 03:7AE4 $E6 $0F
    ldh  [hMultiPurpose1], a                      ;; 03:7AE6 $E0 $D8
    pop  bc                                       ;; 03:7AE8 $C1
    push bc                                       ;; 03:7AE9 $C5
    ld   a, e                                     ;; 03:7AEA $7B
    cp   $03                                      ;; 03:7AEB $FE $03
    jr   nz, .jr_7B0E                             ;; 03:7AED $20 $1F

    ldh  a, [hActiveEntityType]                   ;; 03:7AEF $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ;; 03:7AF1 $FE $A8
    jr   z, .jr_7AF9                              ;; 03:7AF3 $28 $04

    cp   ENTITY_LIFTABLE_ROCK                     ;; 03:7AF5 $FE $05
    jr   nz, .jr_7B0E                             ;; 03:7AF7 $20 $15

.jr_7AF9
    ; If wrecking ball or liftable rock, use: pos_y - max(0, pos_z) / 2
    ld   hl, wEntitiesPosYTable                   ;; 03:7AF9 $21 $10 $C2
    add  hl, bc                                   ;; 03:7AFC $09
    ld   a, [hl]                                  ;; 03:7AFD $7E
    ld   hl, wEntitiesPosZTable                   ;; 03:7AFE $21 $10 $C3
    add  hl, bc                                   ;; 03:7B01 $09
    ld   c, [hl]                                  ;; 03:7B02 $4E
    bit  7, c                                     ;; 03:7B03 $CB $79
    jr   z, .positiveZ                            ;; 03:7B05 $28 $02

    ld   c, $00                                   ;; 03:7B07 $0E $00

.positiveZ
    srl  c                                        ;; 03:7B09 $CB $39
    sub  c                                        ;; 03:7B0B $91
    jr   .jr_7B13                                 ;; 03:7B0C $18 $05

.jr_7B0E
    ld   hl, wEntitiesPosYTable                   ;; 03:7B0E $21 $10 $C2
    add  hl, bc                                   ;; 03:7B11 $09
    ld   a, [hl]                                  ;; 03:7B12 $7E

.jr_7B13
    sub  $10                                      ;; 03:7B13 $D6 $10
    push af                                       ;; 03:7B15 $F5
    ldh  a, [hMultiPurpose0]                      ;; 03:7B16 $F0 $D7
    ld   c, a                                     ;; 03:7B18 $4F
    pop  af                                       ;; 03:7B19 $F1
    ld   hl, EntityCollisionPointsY               ;; 03:7B1A $21 $6F $78
    add  hl, bc                                   ;; 03:7B1D $09
    add  hl, de                                   ;; 03:7B1E $19
    add  [hl]                                     ;; 03:7B1F $86
    ldh  [hMultiPurpose5], a                      ;; 03:7B20 $E0 $DC
    and  $F0                                      ;; 03:7B22 $E6 $F0
    ld   hl, hMultiPurpose1                       ;; 03:7B24 $21 $D8 $FF
    or   [hl]                                     ;; 03:7B27 $B6
    ld   c, a                                     ;; 03:7B28 $4F

    ; Retrieve the room object at index
    ld   hl, wRoomObjects                         ;; 03:7B29 $21 $11 $D7
    ld   a, h                                     ;; 03:7B2C $7C
    add  hl, bc                                   ;; 03:7B2D $09
    ld   h, a                                     ;; 03:7B2E $67
    pop  bc                                       ;; 03:7B2F $C1
    ; Save it into hObjectUnderEntity
    ld   a, [hl]                                  ;; 03:7B30 $7E
    ldh  [hObjectUnderEntity], a                  ;; 03:7B31 $E0 $AF
    cp   OBJECT_LIFTABLE_ROCK ; or liftable pot   ;; 03:7B33 $FE $20
    jp   z, .isHookshottable                      ;; 03:7B35 $CA $7B $7C

    push de                                       ;; 03:7B38 $D5
    ld   e, a                                     ;; 03:7B39 $5F
    ld   a, [wIsIndoor]                           ;; 03:7B3A $FA $A5 $DB
    ld   d, a                                     ;; 03:7B3D $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ;; 03:7B3E $CD $2C $2A
    pop  de                                       ;; 03:7B41 $D1
    ldh  [hMultiPurpose3], a                      ;; 03:7B42 $E0 $DA

    ldh  a, [hActiveEntityType]                   ;; 03:7B44 $F0 $EB
    cp   ENTITY_FISH                              ;; 03:7B46 $FE $CC
    jr   z, .waterEntity                          ;; 03:7B48 $28 $04

    cp   ENTITY_WATER_TEKTITE                     ;; 03:7B4A $FE $99
    jr   nz, .waterEntityEnd                      ;; 03:7B4C $20 $0F

.waterEntity
    ; Fish and Water Tektites treat everything but water as a wall.
    ldh  a, [hMultiPurpose3]                      ;; 03:7B4E $F0 $DA
    cp   OBJ_PHYSICS_SHALLOW_WATER                ;; 03:7B50 $FE $05
    jp   z, .setCarryFlagAndReturn                ;; 03:7B52 $CA $A7 $7C

    cp   OBJ_PHYSICS_DEEP_WATER                   ;; 03:7B55 $FE $07
    jp   z, .setCarryFlagAndReturn                ;; 03:7B57 $CA $A7 $7C

    jp   .doesCollide                             ;; 03:7B5A $C3 $75 $7C

.waterEntityEnd
    ldh  a, [hMultiPurpose3]                      ;; 03:7B5D $F0 $DA
    and  a                                        ;; 03:7B5F $A7
    jp   z, .setCarryFlagAndReturn                ;; 03:7B60 $CA $A7 $7C

    cp   OBJ_PHYSICS_LAVA                         ;; 03:7B63 $FE $0B
    jr   z, .pit                                  ;; 03:7B65 $28 $08

    cp   OBJ_PHYSICS_PIT                          ;; 03:7B67 $FE $50
    jr   z, .pit                                  ;; 03:7B69 $28 $04

    cp   OBJ_PHYSICS_PIT_WARP                     ;; 03:7B6B $FE $51
    jr   nz, .pitEnd                              ;; 03:7B6D $20 $1C

.pit
    ; Entities treat lava and pits as walls, unless they're in the air or are ignoring hits.
    ld   hl, wEntitiesPosZTable                   ;; 03:7B6F $21 $10 $C3
    add  hl, bc                                   ;; 03:7B72 $09
    ld   a, [hl]                                  ;; 03:7B73 $7E
    and  a                                        ;; 03:7B74 $A7
    jp   nz, .setCarryFlagAndReturn               ;; 03:7B75 $C2 $A7 $7C

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:7B78 $21 $10 $C4
    add  hl, bc                                   ;; 03:7B7B $09
    ld   a, [hl]                                  ;; 03:7B7C $7E
    and  a                                        ;; 03:7B7D $A7
    jp   z, .doesCollide                          ;; 03:7B7E $CA $75 $7C

    ; Moldorm always treats pits as walls.
    ldh  a, [hActiveEntityType]                   ;; 03:7B81 $F0 $EB
    cp   ENTITY_MOLDORM                           ;; 03:7B83 $FE $59
    jp   z, .doesCollide                          ;; 03:7B85 $CA $75 $7C

    jp   .setCarryFlagAndReturn                   ;; 03:7B88 $C3 $A7 $7C

.pitEnd
    cp   OBJ_PHYSICS_DOOR_OPEN | $0C              ;; 03:7B8B $FE $7C
    jp   c, .fineCollisionEnd                     ;; 03:7B8D $DA $E4 $7B

    cp   OBJ_PHYSICS_DOOR_CLOSED                  ;; 03:7B90 $FE $90
    jp   nc, .fineCollisionEnd                    ;; 03:7B92 $D2 $E4 $7B

    cp   OBJ_PHYSICS_FINE_COLLISION               ;; 03:7B95 $FE $80
    ldh  a, [hActiveEntityType]                   ;; 03:7B97 $F0 $EB
    jr   c, .openDoor                             ;; 03:7B99 $38 $0C

    cp   ENTITY_WRECKING_BALL                     ;; 03:7B9B $FE $A8
    jp   z, .setCarryFlagAndReturn                ;; 03:7B9D $CA $A7 $7C

    cp   ENTITY_BOMB                              ;; 03:7BA0 $FE $02
    jp   z, .setCarryFlagAndReturn                ;; 03:7BA2 $CA $A7 $7C

    jr   .fineCollision                           ;; 03:7BA5 $18 $14

.openDoor
    ; Sparks and bosses treat open doors as solid walls.
    cp   ENTITY_SPARK_COUNTER_CLOCKWISE           ;; 03:7BA7 $FE $16
    jp   z, .setCollisionsTableFlagsAndReturn     ;; 03:7BA9 $CA $9A $7C

    cp   ENTITY_SPARK_CLOCKWISE                   ;; 03:7BAC $FE $17
    jp   z, .setCollisionsTableFlagsAndReturn     ;; 03:7BAE $CA $9A $7C

    ld   hl, wEntitiesOptions1Table               ;; 03:7BB1 $21 $30 $C4
    add  hl, bc                                   ;; 03:7BB4 $09
    ld   a, [hl]                                  ;; 03:7BB5 $7E
    and  ENTITY_OPT1_IS_BOSS                      ;; 03:7BB6 $E6 $80
    jp   nz, .setCollisionsTableFlagsAndReturn    ;; 03:7BB8 $C2 $9A $7C

.fineCollision
    ; Handle collisions with open doors and fine collision objects.
    push de                                       ;; 03:7BBB $D5
    ldh  a, [hMultiPurpose3]                      ;; 03:7BBC $F0 $DA
    sub  OBJ_PHYSICS_DOOR_OPEN | $0C              ;; 03:7BBE $D6 $7C
    sla  a                                        ;; 03:7BC0 $CB $27
    sla  a                                        ;; 03:7BC2 $CB $27
    ld   e, a                                     ;; 03:7BC4 $5F
    ld   d, $00                                   ;; 03:7BC5 $16 $00
    ld   hl, FineCollisionShapes                  ;; 03:7BC7 $21 $85 $7A
    add  hl, de                                   ;; 03:7BCA $19
    ldh  a, [hMultiPurpose4]                      ;; 03:7BCB $F0 $DB
    rra                                           ;; 03:7BCD $1F
    rra                                           ;; 03:7BCE $1F
    rra                                           ;; 03:7BCF $1F
    and  $01                                      ;; 03:7BD0 $E6 $01
    ld   e, a                                     ;; 03:7BD2 $5F
    ldh  a, [hMultiPurpose5]                      ;; 03:7BD3 $F0 $DC
    rra                                           ;; 03:7BD5 $1F
    rra                                           ;; 03:7BD6 $1F
    and  $02                                      ;; 03:7BD7 $E6 $02
    or   e                                        ;; 03:7BD9 $B3
    ld   e, a                                     ;; 03:7BDA $5F
    ld   d, $00                                   ;; 03:7BDB $16 $00
    add  hl, de                                   ;; 03:7BDD $19
    ld   a, [hl]                                  ;; 03:7BDE $7E
    pop  de                                       ;; 03:7BDF $D1
    and  a                                        ;; 03:7BE0 $A7
    jp   z, .setCarryFlagAndReturn                ;; 03:7BE1 $CA $A7 $7C

.fineCollisionEnd
    ldh  a, [hMultiPurpose3]                      ;; 03:7BE4 $F0 $DA
    cp   OBJ_PHYSICS_LEDGE                        ;; 03:7BE6 $FE $D0
    jr   c, .ledgeEnd                             ;; 03:7BE8 $38 $41

    cp   OBJ_PHYSICS_LEDGE | $04                  ;; 03:7BEA $FE $D4
    jr   nc, .ledgeEnd                            ;; 03:7BEC $30 $3D

    ; Handle collisions with ledges (not cliffs)
    sub  OBJ_PHYSICS_LEDGE                        ;; 03:7BEE $D6 $D0
    ld   hl, wEntitiesThrownDirectionTable        ;; 03:7BF0 $21 $D0 $C5
    add  hl, bc                                   ;; 03:7BF3 $09
    cp   [hl]                                     ;; 03:7BF4 $BE
    jr   z, .jr_7C1A                              ;; 03:7BF5 $28 $23

    ldh  a, [hActiveEntityType]                   ;; 03:7BF7 $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ;; 03:7BF9 $FE $A8
    jr   z, .doesCollide                          ;; 03:7BFB $28 $78

    ld   hl, wEntitiesUnknowTableJ                ;; 03:7BFD $21 $F0 $C4
    add  hl, bc                                   ;; 03:7C00 $09
    ld   a, [hl]                                  ;; 03:7C01 $7E
    and  a                                        ;; 03:7C02 $A7
    jr   z, .doesCollide                          ;; 03:7C03 $28 $70

    ldh  a, [hFrameCounter]                       ;; 03:7C05 $F0 $E7
    and  $03                                      ;; 03:7C07 $E6 $03
    jr   z, .jr_7C28                              ;; 03:7C09 $28 $1D

    ld   a, [wIsIndoor]                           ;; 03:7C0B $FA $A5 $DB
    and  a                                        ;; 03:7C0E $A7
    jr   nz, .jr_7C17                             ;; 03:7C0F $20 $06

    ldh  a, [hFrameCounter]                       ;; 03:7C11 $F0 $E7
    and  $01                                      ;; 03:7C13 $E6 $01
    jr   z, .jr_7C28                              ;; 03:7C15 $28 $11

.jr_7C17
    dec  [hl]                                     ;; 03:7C17 $35
    jr   .jr_7C28                                 ;; 03:7C18 $18 $0E

.jr_7C1A
    ; Entity thrown off a ledge.
    ld   hl, wEntitiesPosZTable                   ;; 03:7C1A $21 $10 $C3
    add  hl, bc                                   ;; 03:7C1D $09
    ld   a, [hl]                                  ;; 03:7C1E $7E
    and  a                                        ;; 03:7C1F $A7
    jp   z, .doesCollide                          ;; 03:7C20 $CA $75 $7C

    ld   hl, wEntitiesUnknowTableJ                ;; 03:7C23 $21 $F0 $C4
    add  hl, bc                                   ;; 03:7C26 $09
    inc  [hl]                                     ;; 03:7C27 $34

.jr_7C28
    jp   .setCarryFlagAndReturn                   ;; 03:7C28 $C3 $A7 $7C

.ledgeEnd
    cp   OBJ_PHYSICS_TRACTOR_DEVICE               ;; 03:7C2B $FE $FF
    jr   z, .setCollisionsTableFlagsAndReturn     ;; 03:7C2D $28 $6B

    cp   $A0                                      ;; 03:7C2F $FE $A0
    jr   nc, .setCarryFlagAndReturn               ;; 03:7C31 $30 $74

    cp   OBJ_PHYSICS_LEDGE_OVERWORLD              ;; 03:7C33 $FE $10
    jr   nc, .doesCollide                         ;; 03:7C35 $30 $3E

    cp   OBJ_PHYSICS_SOLID                        ;; 03:7C37 $FE $01
    jr   z, .hookshotEnd                          ;; 03:7C39 $28 $56

    cp   OBJ_PHYSICS_DOOR                         ;; 03:7C3B $FE $03
    jr   z, .hookshotEnd                          ;; 03:7C3D $28 $52

    cp   OBJ_PHYSICS_OCEAN_SWITCH_BLOCK           ;; 03:7C3F $FE $04
    jr   nz, .setCarryFlagAndReturn               ;; 03:7C41 $20 $64

    ; Handle collisions with ocean or swich blocks.
    ; The wrecking ball and bombs don't collide with switch blocks.
    ldh  a, [hActiveEntityType]                   ;; 03:7C43 $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ;; 03:7C45 $FE $A8
    jp   z, .setCarryFlagAndReturn                ;; 03:7C47 $CA $A7 $7C

    cp   ENTITY_BOMB                              ;; 03:7C4A $FE $02
    jp   z, .setCarryFlagAndReturn                ;; 03:7C4C $CA $A7 $7C

    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:7C4F $FE $03
    jr   nz, .hookshotOnSwitchBlockEnd            ;; 03:7C51 $20 $07

    ; Hookshot chain doesn't collide with switch blocks if Link is standing on one.
    ld   a, [wLinkStandingOnSwitchBlock]          ;; 03:7C53 $FA $F9 $D6
    and  a                                        ;; 03:7C56 $A7
    jp   nz, .setCarryFlagAndReturn               ;; 03:7C57 $C2 $A7 $7C

.hookshotOnSwitchBlockEnd
    ; Entities treat the ocean as a wall.
    ldh  a, [hObjectUnderEntity]                  ;; 03:7C5A $F0 $AF
    cp   OBJECT_LOWERED_BLOCK                     ;; 03:7C5C $FE $DB
    jr   c, .setCollisionsTableFlagsAndReturn     ;; 03:7C5E $38 $3A

    cp   OBJECT_RAISED_BLOCK + 1                  ;; 03:7C60 $FE $DD
    jr   nc, .setCollisionsTableFlagsAndReturn    ;; 03:7C62 $30 $36

    ; Handle collisions with swich blocks.
    push de                                       ;; 03:7C64 $D5
    sub  OBJECT_LOWERED_BLOCK                     ;; 03:7C65 $D6 $DB
    ld   e, a                                     ;; 03:7C67 $5F
    ld   d, $00                                   ;; 03:7C68 $16 $00
    ld   hl, SwitchBlockLoweredStatePerObject     ;; 03:7C6A $21 $A9 $7C
    add  hl, de                                   ;; 03:7C6D $19
    pop  de                                       ;; 03:7C6E $D1
    ld   a, [wSwitchBlocksState]                  ;; 03:7C6F $FA $FB $D6
    xor  [hl]                                     ;; 03:7C72 $AE
    jr   z, .setCarryFlagAndReturn                ;; 03:7C73 $28 $32

.doesCollide
    ldh  a, [hMultiPurpose3]                      ;; 03:7C75 $F0 $DA
    cp   OBJ_PHYSICS_HOOKSHOTABLE                 ;; 03:7C77 $FE $60
    jr   nz, .hookshotEnd                         ;; 03:7C79 $20 $16

.isHookshottable
    ldh  a, [hActiveEntityType]                   ;; 03:7C7B $F0 $EB
    cp   ENTITY_HOOKSHOT_CHAIN                    ;; 03:7C7D $FE $03
    jr   nz, .hookshotEnd                         ;; 03:7C7F $20 $10

    call GetEntityTransitionCountdown             ;; 03:7C81 $CD $05 $0C
    cp   $26                                      ;; 03:7C84 $FE $26
    jr   c, .hookshotClearEnd                     ;; 03:7C86 $38 $03
    call UnloadEntity                             ;; 03:7C88 $CD $8D $3F

IF __PATCH_0__
    xor  a
    ld   [wC1C6], a
    jr   .hookshotEnd
ENDC
.hookshotClearEnd

    ld   hl, wEntitiesStateTable                  ;; 03:7C8B $21 $90 $C2
    add  hl, bc                                   ;; 03:7C8E $09
    ld   [hl], $01                                ;; 03:7C8F $36 $01
.hookshotEnd

    ld   hl, wEntitiesOptions1Table               ;; 03:7C91 $21 $30 $C4
    add  hl, bc                                   ;; 03:7C94 $09
    ld   a, [hl]                                  ;; 03:7C95 $7E
    and  ENTITY_OPT1_NO_WALL_COLLISION            ;; 03:7C96 $E6 $01
    jr   nz, .setCarryFlagAndReturn               ;; 03:7C98 $20 $0D

.setCollisionsTableFlagsAndReturn
    ; wEntitiesCollisionsTable[bc] |= CollisionsTableFlagPerDirection[de]
    ld   hl, CollisionsTableFlagPerDirection      ;; 03:7C9A $21 $7F $78
    add  hl, de                                   ;; 03:7C9D $19
    ld   a, [hl]                                  ;; 03:7C9E $7E
    ld   hl, wEntitiesCollisionsTable             ;; 03:7C9F $21 $A0 $C2
    add  hl, bc                                   ;; 03:7CA2 $09
    or   [hl]                                     ;; 03:7CA3 $B6
    ld   [hl], a                                  ;; 03:7CA4 $77
    and  a                                        ;; 03:7CA5 $A7
    ret                                           ;; 03:7CA6 $C9

.setCarryFlagAndReturn
    scf                                           ;; 03:7CA7 $37
    ret                                           ;; 03:7CA8 $C9
 
SwitchBlockLoweredStatePerObject::
    db   $00, $02

ApplySwordIntersectionWithObjects::
    ld   de, $00                                  ;; 03:7CAB $11 $00 $00
    push bc                                       ;; 03:7CAE $C5
    ld   hl, wEntitiesPosXTable                   ;; 03:7CAF $21 $00 $C2
    add  hl, bc                                   ;; 03:7CB2 $09
    ld   a, [hl]                                  ;; 03:7CB3 $7E
    ldh  [hMultiPurpose4], a                      ;; 03:7CB4 $E0 $DB
    and  $F0                                      ;; 03:7CB6 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 03:7CB8 $E0 $CE
    swap a                                        ;; 03:7CBA $CB $37
    ld   hl, wEntitiesPosYTable                   ;; 03:7CBC $21 $10 $C2
    add  hl, bc                                   ;; 03:7CBF $09
    ld   c, a                                     ;; 03:7CC0 $4F
    ld   a, [hl]                                  ;; 03:7CC1 $7E
    sub  $08                                      ;; 03:7CC2 $D6 $08
    ldh  [hMultiPurpose5], a                      ;; 03:7CC4 $E0 $DC
    and  $F0                                      ;; 03:7CC6 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 03:7CC8 $E0 $CD
    or   c                                        ;; 03:7CCA $B1
    ld   c, a                                     ;; 03:7CCB $4F
    ldh  [hIndexOfObjectBelowLink], a             ;; 03:7CCC $E0 $E9
    ld   b, $00                                   ;; 03:7CCE $06 $00
    ld   hl, wRoomObjects                         ;; 03:7CD0 $21 $11 $D7
    ld   a, h                                     ;; 03:7CD3 $7C
    add  hl, bc                                   ;; 03:7CD4 $09
    ld   h, a                                     ;; 03:7CD5 $67
    pop  bc                                       ;; 03:7CD6 $C1
    ld   a, [hl]                                  ;; 03:7CD7 $7E
    ldh  [hObjectUnderEntity], a                  ;; 03:7CD8 $E0 $AF
    cp   OBJECT_TORCH_LIT                         ;; 03:7CDA $FE $AC
    jp   z, jr_003_7E03                           ;; 03:7CDC $CA $03 $7E

    cp   OBJECT_TORCH_UNLIT                       ;; 03:7CDF $FE $AB
    jp   nz, jr_003_7D6B                          ;; 03:7CE1 $C2 $6B $7D

    ldh  a, [hIsGBC]                              ;; 03:7CE4 $F0 $FE
    and  a                                        ;; 03:7CE6 $A7
    jr   z, .jr_7CFD                              ;; 03:7CE7 $28 $14

    ld   a, [wLinkMotionState]                    ;; 03:7CE9 $FA $1C $C1
    cp   LINK_MOTION_REVOLVING_DOOR               ;; 03:7CEC $FE $05
    ret  z                                        ;; 03:7CEE $C8

    ld   a, [wBGPaletteTransitionEffect]          ;; 03:7CEF $FA $D6 $DD
    and  a                                        ;; 03:7CF2 $A7
    jp   nz, jr_003_7E03                          ;; 03:7CF3 $C2 $03 $7E

    ld   a, [wRoomTransitionState]                ;; 03:7CF6 $FA $24 $C1
    and  a                                        ;; 03:7CF9 $A7
    jp   nz, jr_003_7E03                          ;; 03:7CFA $C2 $03 $7E

.jr_7CFD
    ldh  a, [hActiveEntityType]                   ;; 03:7CFD $F0 $EB
    cp   ENTITY_MAGIC_ROD_FIREBALL                ;; 03:7CFF $FE $04
    jr   nz, jr_003_7D6B                          ;; 03:7D01 $20 $68

    ld   a, [wIsIndoor]                           ;; 03:7D03 $FA $A5 $DB
    and  a                                        ;; 03:7D06 $A7
    jr   z, jr_003_7D6B                           ;; 03:7D07 $28 $62

    push hl                                       ;; 03:7D09 $E5
    ld   a, NOISE_SFX_BURSTING_FLAME              ;; 03:7D0A $3E $12
    ldh  [hNoiseSfx], a                           ;; 03:7D0C $E0 $F4

    ld   a, ENTITY_MAGIC_POWDER_SPRINKLE          ;; 03:7D0E $3E $08
    call SpawnNewEntity                           ;; 03:7D10 $CD $CA $64
    jr   c, jr_003_7D6A                           ;; 03:7D13 $38 $55

    pop  hl                                       ;; 03:7D15 $E1
    ld   a, $AC                                   ;; 03:7D16 $3E $AC
    ld   [hl], a                                  ;; 03:7D18 $77
    ld   [wDDD8], a                               ;; 03:7D19 $EA $D8 $DD
    push bc                                       ;; 03:7D1C $C5
    ld   c, e                                     ;; 03:7D1D $4B
    ld   b, d                                     ;; 03:7D1E $42
    ld   d, h                                     ;; 03:7D1F $54
    ld   e, l                                     ;; 03:7D20 $5D
    ld   hl, wEntitiesPrivateState1Table          ;; 03:7D21 $21 $B0 $C2
    add  hl, bc                                   ;; 03:7D24 $09
    ld   [hl], d                                  ;; 03:7D25 $72
    ld   hl, wEntitiesPrivateState2Table          ;; 03:7D26 $21 $C0 $C2
    add  hl, bc                                   ;; 03:7D29 $09
    ld   [hl], e                                  ;; 03:7D2A $73
    ldh  a, [hIntersectedObjectLeft]              ;; 03:7D2B $F0 $CE
    ld   hl, wEntitiesPosXTable                   ;; 03:7D2D $21 $00 $C2
    add  hl, bc                                   ;; 03:7D30 $09
    ld   [hl], a                                  ;; 03:7D31 $77
    ldh  a, [hIntersectedObjectTop]               ;; 03:7D32 $F0 $CD
    ld   hl, wEntitiesPosYTable                   ;; 03:7D34 $21 $10 $C2
    add  hl, bc                                   ;; 03:7D37 $09
    ld   [hl], a                                  ;; 03:7D38 $77
    ld   hl, wEntitiesStateTable                  ;; 03:7D39 $21 $90 $C2
    add  hl, bc                                   ;; 03:7D3C $09
    ld   [hl], $01                                ;; 03:7D3D $36 $01
    call GetEntitySlowTransitionCountdown         ;; 03:7D3F $CD $FB $0B
    ld   [hl], $80                                ;; 03:7D42 $36 $80
    pop  bc                                       ;; 03:7D44 $C1
    ld   hl, wC1A2                                ;; 03:7D45 $21 $A2 $C1
    inc  [hl]                                     ;; 03:7D48 $34
    ld   a, [wC3CD]                               ;; 03:7D49 $FA $CD $C3
    and  a                                        ;; 03:7D4C $A7
    jr   z, .jr_7D63                              ;; 03:7D4D $28 $14

    sub  $04                                      ;; 03:7D4F $D6 $04
    ld   [wC3CD], a                               ;; 03:7D51 $EA $CD $C3
    ldh  a, [hIsGBC]                              ;; 03:7D54 $F0 $FE
    and  a                                        ;; 03:7D56 $A7
    jr   z, .jr_7D63                              ;; 03:7D57 $28 $0A

    ld   a, $40                                   ;; 03:7D59 $3E $40
    ld   [wBGPaletteTransitionEffect], a          ;; 03:7D5B $EA $D6 $DD
    ld   a, $0B                                   ;; 03:7D5E $3E $0B
    ld   [wDDD7], a                               ;; 03:7D60 $EA $D7 $DD

.jr_7D63
    ld   de, Data_003_69A2                        ;; 03:7D63 $11 $A2 $69
    push de                                       ;; 03:7D66 $D5
    jp   label_003_51F5                           ;; 03:7D67 $C3 $F5 $51

jr_003_7D6A:
    pop  hl                                       ;; 03:7D6A $E1

jr_003_7D6B:
    ld   a, [hl]                                  ;; 03:7D6B $7E
    ld   e, a                                     ;; 03:7D6C $5F
    ld   a, [wIsIndoor]                           ;; 03:7D6D $FA $A5 $DB
    ld   d, a                                     ;; 03:7D70 $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ;; 03:7D71 $CD $2C $2A
    ldh  [hMultiPurpose1], a                      ;; 03:7D74 $E0 $D8
    and  a                                        ;; 03:7D76 $A7
    jp   z, jr_003_7E03                           ;; 03:7D77 $CA $03 $7E

    ldh  [hMultiPurpose3], a                      ;; 03:7D7A $E0 $DA
    cp   $FF                                      ;; 03:7D7C $FE $FF
    jp   z, label_003_7E05                        ;; 03:7D7E $CA $05 $7E

    cp   $D0                                      ;; 03:7D81 $FE $D0
    jr   c, jr_003_7DC0                           ;; 03:7D83 $38 $3B

    cp   $D4                                      ;; 03:7D85 $FE $D4
    jr   nc, jr_003_7DC0                          ;; 03:7D87 $30 $37

    sub  $D0                                      ;; 03:7D89 $D6 $D0
    ld   hl, wEntitiesThrownDirectionTable        ;; 03:7D8B $21 $D0 $C5
    add  hl, bc                                   ;; 03:7D8E $09
    cp   [hl]                                     ;; 03:7D8F $BE
    jr   z, jr_003_7DB0                           ;; 03:7D90 $28 $1E

    ld   hl, wEntitiesUnknowTableJ                ;; 03:7D92 $21 $F0 $C4
    add  hl, bc                                   ;; 03:7D95 $09
    ld   a, [hl]                                  ;; 03:7D96 $7E
    and  a                                        ;; 03:7D97 $A7
    jr   z, jr_003_7DE3                           ;; 03:7D98 $28 $49

    ldh  a, [hFrameCounter]                       ;; 03:7D9A $F0 $E7
    and  $03                                      ;; 03:7D9C $E6 $03
    jr   z, jr_003_7E03                           ;; 03:7D9E $28 $63

    ld   a, [wIsIndoor]                           ;; 03:7DA0 $FA $A5 $DB
    and  a                                        ;; 03:7DA3 $A7
    jr   nz, .jr_7DAC                             ;; 03:7DA4 $20 $06

    ldh  a, [hFrameCounter]                       ;; 03:7DA6 $F0 $E7
    and  $01                                      ;; 03:7DA8 $E6 $01
    jr   z, jr_003_7E03                           ;; 03:7DAA $28 $57

.jr_7DAC
    dec  [hl]                                     ;; 03:7DAC $35
    jp   jr_003_7E03                              ;; 03:7DAD $C3 $03 $7E

jr_003_7DB0:
    ld   hl, wEntitiesPosZTable                   ;; 03:7DB0 $21 $10 $C3
    add  hl, bc                                   ;; 03:7DB3 $09
    ld   a, [hl]                                  ;; 03:7DB4 $7E
    and  a                                        ;; 03:7DB5 $A7
    jr   z, jr_003_7DE3                           ;; 03:7DB6 $28 $2B

    ld   hl, wEntitiesUnknowTableJ                ;; 03:7DB8 $21 $F0 $C4
    add  hl, bc                                   ;; 03:7DBB $09
    inc  [hl]                                     ;; 03:7DBC $34
    jp   jr_003_7E03                              ;; 03:7DBD $C3 $03 $7E

jr_003_7DC0:
    cp   $7C                                      ;; 03:7DC0 $FE $7C
    jp   c, label_003_7DCD                        ;; 03:7DC2 $DA $CD $7D

    cp   $90                                      ;; 03:7DC5 $FE $90
IF __OPTIMIZATIONS_3__
    jp   c, jr_003_7E03
ELSE
    jp   nc, label_003_7DCD                       ;; 03:7DC7 $D2 $CD $7D

    jp   jr_003_7E03                              ;; 03:7DCA $C3 $03 $7E
ENDC

label_003_7DCD:
    ldh  a, [hMultiPurpose3]                      ;; 03:7DCD $F0 $DA
    cp   $A0                                      ;; 03:7DCF $FE $A0
    jr   nc, jr_003_7E03                          ;; 03:7DD1 $30 $30

    cp   $50                                      ;; 03:7DD3 $FE $50
    jr   z, jr_003_7E03                           ;; 03:7DD5 $28 $2C

    cp   $51                                      ;; 03:7DD7 $FE $51
    jr   z, jr_003_7E03                           ;; 03:7DD9 $28 $28

    cp   $10                                      ;; 03:7DDB $FE $10
    jr   nc, jr_003_7DE3                          ;; 03:7DDD $30 $04

    cp   $01                                      ;; 03:7DDF $FE $01
    jr   nz, jr_003_7E03                          ;; 03:7DE1 $20 $20

jr_003_7DE3:
    ld   hl, wEntitiesCollisionsTable             ;; 03:7DE3 $21 $A0 $C2
    add  hl, bc                                   ;; 03:7DE6 $09
    ld   [hl], $01                                ;; 03:7DE7 $36 $01
    ldh  a, [hActiveEntityType]                   ;; 03:7DE9 $F0 $EB
    cp   ENTITY_BOOMERANG                         ;; 03:7DEB $FE $01
    jr   nz, .jr_7DF3                             ;; 03:7DED $20 $04

    call GetEntityTransitionCountdown             ;; 03:7DEF $CD $05 $0C
    ret  z                                        ;; 03:7DF2 $C8

.jr_7DF3
    ld   hl, wEntitiesPosXTable                   ;; 03:7DF3 $21 $00 $C2
    add  hl, bc                                   ;; 03:7DF6 $09
    ldh  a, [hActiveEntityPosX]                   ;; 03:7DF7 $F0 $EE
    ld   [hl], a                                  ;; 03:7DF9 $77
    ld   hl, wEntitiesPosYTable                   ;; 03:7DFA $21 $10 $C2
    add  hl, bc                                   ;; 03:7DFD $09
    ldh  a, [hActiveEntityPosY]                   ;; 03:7DFE $F0 $EF
    ld   [hl], a                                  ;; 03:7E00 $77
    scf                                           ;; 03:7E01 $37
    ret                                           ;; 03:7E02 $C9

jr_003_7E03:
    and  a                                        ;; 03:7E03 $A7
    ret                                           ;; 03:7E04 $C9

label_003_7E05:
    ldh  a, [hActiveEntityType]                   ;; 03:7E05 $F0 $EB
    cp   ENTITY_BOOMERANG                         ;; 03:7E07 $FE $01

label_003_7E09:
    jr   z, jr_003_7DE3                           ;; 03:7E09 $28 $D8

    jp   UnloadEntityAndReturn                    ;; 03:7E0B $C3 $8D $3F

; Inputs:
;   bc   entity index
;
; Outputs:
;   hMultiPurpose3           physics flags for the object intersected by the entity
;   hMultiPurpose4           entityPosX - 1
;   hMultiPurpose5           entityPosY - 7
;   hIntersectedObjectLeft   leftmost corner of the object intersected by the entity
;   hIntersectedObjectTop    topmost corner of the object intersected by the entity
func_003_7E0E::
    push bc                                       ;; 03:7E0E $C5

    ; hMultiPurpose4 = entityPosX - 1
    ; hIntersectedObjectLeft = hMultiPurpose4 - (hMultiPurpose4 % $10)
    ld   hl, wEntitiesPosXTable                   ;; 03:7E0F $21 $00 $C2
    add  hl, bc                                   ;; 03:7E12 $09
    ld   a, [hl]                                  ;; 03:7E13 $7E
    sub  $01                                      ;; 03:7E14 $D6 $01
    ldh  [hMultiPurpose4], a                      ;; 03:7E16 $E0 $DB
    and  $F0 ; a - a % $10                        ;; 03:7E18 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 03:7E1A $E0 $CE

    swap a                                        ;; 03:7E1C $CB $37

    ; hMultiPurpose5 = entityPosY - 7
    ; hIntersectedObjectTop = hMultiPurpose5 - (hMultiPurpose5 % $10)
    ld   hl, wEntitiesPosYTable                   ;; 03:7E1E $21 $10 $C2
    add  hl, bc                                   ;; 03:7E21 $09
    ld   c, a                                     ;; 03:7E22 $4F
    ld   a, [hl]                                  ;; 03:7E23 $7E
    sub  $07                                      ;; 03:7E24 $D6 $07
    ldh  [hMultiPurpose5], a                      ;; 03:7E26 $E0 $DC
    and  $F0 ; a - a % $10                        ;; 03:7E28 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 03:7E2A $E0 $CD

    or   c                                        ;; 03:7E2C $B1
    ld   c, a                                     ;; 03:7E2D $4F
    ld   b, $00                                   ;; 03:7E2E $06 $00
    ld   hl, wRoomObjects                         ;; 03:7E30 $21 $11 $D7
    ld   a, h                                     ;; 03:7E33 $7C
    add  hl, bc                                   ;; 03:7E34 $09
    ld   h, a                                     ;; 03:7E35 $67
    pop  bc                                       ;; 03:7E36 $C1
    ld   a, [hl]                                  ;; 03:7E37 $7E
    ldh  [hObjectUnderEntity], a                  ;; 03:7E38 $E0 $AF
    ld   e, a                                     ;; 03:7E3A $5F
    ld   a, [wIsIndoor]                           ;; 03:7E3B $FA $A5 $DB
    ld   d, a                                     ;; 03:7E3E $57
    call GetObjectPhysicsFlagsAndRestoreBank3     ;; 03:7E3F $CD $2C $2A
    ldh  [hMultiPurpose3], a                      ;; 03:7E42 $E0 $DA
    ret                                           ;; 03:7E44 $C9

; Compute an (X, Y) vector of length A pointing from an entity position
; to the direction of Link.
; Useful to move an entity in the direction of Link.
;
; Inputs:
;   a    vector length (infinity norm)
;   bc   entity index
;
; Outputs:
;   hMultiPurpose0   resulting vector Y
;   hMultiPurpose1   resulting vector X
GetVectorTowardsLink::
    ldh  [hMultiPurpose1], a                      ;; 03:7E45 $E0 $D8
    and  a                                        ;; 03:7E47 $A7
    jp   z, .cancelAndReturn                      ;; 03:7E48 $CA $C3 $7E

    call GetEntityYDistanceToLink_03              ;; 03:7E4B $CD $E9 $7E
    dec  e                                        ;; 03:7E4E $1D
    dec  e                                        ;; 03:7E4F $1D
    ld   a, e                                     ;; 03:7E50 $7B
    ; hMultiPurpose2 = dy < 0 ? 0 : 1
    ldh  [hMultiPurpose2], a                      ;; 03:7E51 $E0 $D9
    ld   a, d                                     ;; 03:7E53 $7A
    bit  7, a                                     ;; 03:7E54 $CB $7F
    jr   z, .absoluteY                            ;; 03:7E56 $28 $02

    cpl                                           ;; 03:7E58 $2F
    inc  a                                        ;; 03:7E59 $3C

.absoluteY
    ldh  [hMultiPurposeC], a                      ;; 03:7E5A $E0 $E3
    call GetEntityXDistanceToLink_03              ;; 03:7E5C $CD $D9 $7E
    ld   a, e                                     ;; 03:7E5F $7B
    ; hMultiPurpose3 = dx < 0 ? 1 : 0
    ldh  [hMultiPurpose3], a                      ;; 03:7E60 $E0 $DA
    ld   a, d                                     ;; 03:7E62 $7A
    bit  7, a                                     ;; 03:7E63 $CB $7F
    jr   z, .absoluteX                            ;; 03:7E65 $28 $02

    cpl                                           ;; 03:7E67 $2F
    inc  a                                        ;; 03:7E68 $3C

.absoluteX
    ldh  [hMultiPurposeD], a                      ;; 03:7E69 $E0 $E4
    ld   e, $00                                   ;; 03:7E6B $1E $00
    ld   hl, hMultiPurposeC                       ;; 03:7E6D $21 $E3 $FF
    ldh  a, [hMultiPurposeD]                      ;; 03:7E70 $F0 $E4
    ; Always divide the larger distance by the smaller distance...
    cp   [hl]                                     ;; 03:7E72 $BE
    jr   nc, .noSwap1                             ;; 03:7E73 $30 $09

    ; ...so swap them if necessary
    inc  e                                        ;; 03:7E75 $1C
    push af                                       ;; 03:7E76 $F5
    ldh  a, [hMultiPurposeC]                      ;; 03:7E77 $F0 $E3
    ldh  [hMultiPurposeD], a                      ;; 03:7E79 $E0 $E4
    pop  af                                       ;; 03:7E7B $F1
    ldh  [hMultiPurposeC], a                      ;; 03:7E7C $E0 $E3

.noSwap1
    ; e = dx > dy ? 0 : 1

    xor  a                                        ;; 03:7E7E $AF
    ldh  [hMultiPurposeB], a                      ;; 03:7E7F $E0 $E2
    ldh  [hMultiPurpose0], a                      ;; 03:7E81 $E0 $D7

    ldh  a, [hMultiPurpose1]                      ;; 03:7E83 $F0 $D8
    ld   d, a                                     ;; 03:7E85 $57

.divideLoop
    ldh  a, [hMultiPurposeB]                      ;; 03:7E86 $F0 $E2
    ld   hl, hMultiPurposeC                       ;; 03:7E88 $21 $E3 $FF
    add  [hl]                                     ;; 03:7E8B $86
    jr   c, .incResult                            ;; 03:7E8C $38 $06

    ld   hl, hMultiPurposeD                       ;; 03:7E8E $21 $E4 $FF
    cp   [hl]                                     ;; 03:7E91 $BE
    jr   c, .decCounter                           ;; 03:7E92 $38 $05

.incResult
    sub  [hl]                                     ;; 03:7E94 $96
    ld   hl, hMultiPurpose0                       ;; 03:7E95 $21 $D7 $FF
    inc  [hl]                                     ;; 03:7E98 $34

.decCounter
    ldh  [hMultiPurposeB], a                      ;; 03:7E99 $E0 $E2
    dec  d                                        ;; 03:7E9B $15
    jr   nz, .divideLoop                          ;; 03:7E9C $20 $E8

    ld   a, e                                     ;; 03:7E9E $7B
    ; If the X and Y were swapped before...
    and  a                                        ;; 03:7E9F $A7
    jr   z, .noSwap2                              ;; 03:7EA0 $28 $0A

    ; ...swap them back
    ldh  a, [hMultiPurpose0]                      ;; 03:7EA2 $F0 $D7
    push af                                       ;; 03:7EA4 $F5
    ldh  a, [hMultiPurpose1]                      ;; 03:7EA5 $F0 $D8
    ldh  [hMultiPurpose0], a                      ;; 03:7EA7 $E0 $D7
    pop  af                                       ;; 03:7EA9 $F1
    ldh  [hMultiPurpose1], a                      ;; 03:7EAA $E0 $D8

.noSwap2
    ldh  a, [hMultiPurpose2]                      ;; 03:7EAC $F0 $D9
    ; If the distance was negative...
    and  a                                        ;; 03:7EAE $A7
    ldh  a, [hMultiPurpose0]                      ;; 03:7EAF $F0 $D7
    jr   nz, .positiveResultY                     ;; 03:7EB1 $20 $04

    ; ...make the result negative
    cpl                                           ;; 03:7EB3 $2F
    inc  a                                        ;; 03:7EB4 $3C
    ldh  [hMultiPurpose0], a                      ;; 03:7EB5 $E0 $D7

.positiveResultY
    ldh  a, [hMultiPurpose3]                      ;; 03:7EB7 $F0 $DA
    and  a                                        ;; 03:7EB9 $A7
    ldh  a, [hMultiPurpose1]                      ;; 03:7EBA $F0 $D8
    jr   z, .positiveResultX                      ;; 03:7EBC $28 $04

    cpl                                           ;; 03:7EBE $2F
    inc  a                                        ;; 03:7EBF $3C
    ldh  [hMultiPurpose1], a                      ;; 03:7EC0 $E0 $D8
.positiveResultX
    ret                                           ;; 03:7EC2 $C9

.cancelAndReturn
    xor  a                                        ;; 03:7EC3 $AF
    ldh  [hMultiPurpose0], a                      ;; 03:7EC4 $E0 $D7
    ret                                           ;; 03:7EC6 $C9

ApplyVectorTowardsLink::
ApplyVectorTowardsLinkAndReturn::
    call GetVectorTowardsLink                     ;; 03:7EC7 $CD $45 $7E
    ldh  a, [hMultiPurpose0]                      ;; 03:7ECA $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7ECC $21 $50 $C2
    add  hl, bc                                   ;; 03:7ECF $09
    ld   [hl], a                                  ;; 03:7ED0 $77
    ldh  a, [hMultiPurpose1]                      ;; 03:7ED1 $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7ED3 $21 $40 $C2
    add  hl, bc                                   ;; 03:7ED6 $09
    ld   [hl], a                                  ;; 03:7ED7 $77
    ret                                           ;; 03:7ED8 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   x distance (Link's position - entity's position)
;   e   DIRECTION_LEFT if Link is to the left of the entity, DIRECTION_RIGHT otherwise
GetEntityXDistanceToLink_03::
    ld   e, DIRECTION_RIGHT                       ;; 03:7ED9 $1E $00
    ldh  a, [hLinkPositionX]                      ;; 03:7EDB $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 03:7EDD $21 $00 $C2
    add  hl, bc                                   ;; 03:7EE0 $09
    sub  [hl]                                     ;; 03:7EE1 $96
    bit  7, a                                     ;; 03:7EE2 $CB $7F
    jr   z, .positive                             ;; 03:7EE4 $28 $01

    inc  e                                        ;; 03:7EE6 $1C

.positive
    ld   d, a                                     ;; 03:7EE7 $57
    ret                                           ;; 03:7EE8 $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   d   y distance (Link's position - entity's position)
;   e   DIRECTION_UP if Link is above the entity, DIRECTION_DOWN otherwise
GetEntityYDistanceToLink_03::
    ld   e, DIRECTION_UP                          ;; 03:7EE9 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 03:7EEB $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 03:7EED $21 $10 $C2
    add  hl, bc                                   ;; 03:7EF0 $09
    sub  [hl]                                     ;; 03:7EF1 $96
    ld   hl, wEntitiesPosZTable                   ;; 03:7EF2 $21 $10 $C3
    add  hl, bc                                   ;; 03:7EF5 $09
    add  [hl]                                     ;; 03:7EF6 $86
    bit  7, a                                     ;; 03:7EF7 $CB $7F
    jr   nz, .negative                            ;; 03:7EF9 $20 $01

    inc  e                                        ;; 03:7EFB $1C

.negative
    ld   d, a                                     ;; 03:7EFC $57
    ret                                           ;; 03:7EFD $C9

; Inputs:
;   bc   entity index
;
; Outputs:
;   e   entity's direction to Link (see DIRECTION_* constants for possible values)
GetEntityDirectionToLink_03::
    call GetEntityXDistanceToLink_03              ;; 03:7EFE $CD $D9 $7E
    ld   a, e                                     ;; 03:7F01 $7B
    ldh  [hMultiPurpose0], a                      ;; 03:7F02 $E0 $D7
    ld   a, d                                     ;; 03:7F04 $7A
    bit  7, a                                     ;; 03:7F05 $CB $7F
    jr   z, .positiveX                            ;; 03:7F07 $28 $02

    cpl                                           ;; 03:7F09 $2F
    inc  a                                        ;; 03:7F0A $3C

.positiveX
    push af                                       ;; 03:7F0B $F5
    call GetEntityYDistanceToLink_03              ;; 03:7F0C $CD $E9 $7E
    ld   a, e                                     ;; 03:7F0F $7B
    ldh  [hMultiPurpose1], a                      ;; 03:7F10 $E0 $D8
    ld   a, d                                     ;; 03:7F12 $7A
    bit  7, a                                     ;; 03:7F13 $CB $7F
    jr   z, .positiveY                            ;; 03:7F15 $28 $02

    cpl                                           ;; 03:7F17 $2F
    inc  a                                        ;; 03:7F18 $3C

.positiveY
    pop  de                                       ;; 03:7F19 $D1
    cp   d                                        ;; 03:7F1A $BA
    jr   nc, .vertical                            ;; 03:7F1B $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 03:7F1D $F0 $D7
    jr   .verticalEnd                             ;; 03:7F1F $18 $02

.vertical
    ldh  a, [hMultiPurpose1]                      ;; 03:7F21 $F0 $D8

.verticalEnd
    ld   e, a                                     ;; 03:7F23 $5F
    ret                                           ;; 03:7F24 $C9

UpdateEntityPosWithSpeed_03::
    call AddEntitySpeedToPos_03                   ;; 03:7F25 $CD $32 $7F
    push bc                                       ;; 03:7F28 $C5
    ld   a, c                                     ;; 03:7F29 $79
    add  $10                                      ;; 03:7F2A $C6 $10
    ld   c, a                                     ;; 03:7F2C $4F
    call AddEntitySpeedToPos_03                   ;; 03:7F2D $CD $32 $7F
    pop  bc                                       ;; 03:7F30 $C1
    ret                                           ;; 03:7F31 $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_03::
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7F32 $21 $40 $C2
    add  hl, bc                                   ;; 03:7F35 $09
    ld   a, [hl]                                  ;; 03:7F36 $7E
    and  a                                        ;; 03:7F37 $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 03:7F38 $28 $23

    push af                                       ;; 03:7F3A $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ;; 03:7F3B $CB $37
    and  $F0                                      ;; 03:7F3D $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 03:7F3F $21 $60 $C2
    add  hl, bc                                   ;; 03:7F42 $09
    add  [hl]                                     ;; 03:7F43 $86
    ld   [hl], a                                  ;; 03:7F44 $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 03:7F45 $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 03:7F47 $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 03:7F4A $09
    pop  af                                       ;; 03:7F4B $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 03:7F4C $1E $00
    bit  7, a                                     ;; 03:7F4E $CB $7F
    jr   z, .positive                             ;; 03:7F50 $28 $02

    ld   e, $F0                                   ;; 03:7F52 $1E $F0

.positive
    swap a                                        ;; 03:7F54 $CB $37
    and  $0F                                      ;; 03:7F56 $E6 $0F
    or   e                                        ;; 03:7F58 $B3
    ; Get carry back from d
    rr   d                                        ;; 03:7F59 $CB $1A
    adc  [hl]                                     ;; 03:7F5B $8E
    ld   [hl], a                                  ;; 03:7F5C $77

.return
    ret                                           ;; 03:7F5D $C9

AddEntityZSpeedToPos_03::
    ld   hl, wEntitiesSpeedZTable                 ;; 03:7F5E $21 $20 $C3
    add  hl, bc                                   ;; 03:7F61 $09
    ld   a, [hl]                                  ;; 03:7F62 $7E
    and  a                                        ;; 03:7F63 $A7
    jr   z, AddEntitySpeedToPos_03.return         ;; 03:7F64 $28 $F7

    push af                                       ;; 03:7F66 $F5
    swap a                                        ;; 03:7F67 $CB $37
    and  $F0                                      ;; 03:7F69 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 03:7F6B $21 $30 $C3
    add  hl, bc                                   ;; 03:7F6E $09
    add  [hl]                                     ;; 03:7F6F $86
    ld   [hl], a                                  ;; 03:7F70 $77
    rl   d                                        ;; 03:7F71 $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 03:7F73 $21 $10 $C3
    jr   AddEntitySpeedToPos_03.updatePosition    ;; 03:7F76 $18 $D2

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_03::
    ldh  a, [hActiveEntityStatus]                 ;; 03:7F78 $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 03:7F7A $FE $05
    jr   nz, .skip                                ;; 03:7F7C $20 $29

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 03:7F7E $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 03:7F81 $FE $07
    jr   z, .skip                                 ;; 03:7F83 $28 $22

    cp   GAMEPLAY_CREDITS                         ;; 03:7F85 $FE $01
    jr   z, .creditsEnd                           ;; 03:7F87 $28 $0B

    cp   GAMEPLAY_WORLD                           ;; 03:7F89 $FE $0B
    jr   nz, .skip                                ;; 03:7F8B $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 03:7F8D $FA $6B $C1
    cp   $04                                      ;; 03:7F90 $FE $04
    jr   nz, .skip                                ;; 03:7F92 $20 $13
.creditsEnd

    ld   a, [wDialogState]                        ;; 03:7F94 $FA $9F $C1
    ld   hl, wC1A8                                ;; 03:7F97 $21 $A8 $C1
    or   [hl]                                     ;; 03:7F9A $B6
    ld   hl, wInventoryAppearing                  ;; 03:7F9B $21 $4F $C1
    or   [hl]                                     ;; 03:7F9E $B6
    jr   nz, .skip                                ;; 03:7F9F $20 $06

    ld   a, [wRoomTransitionState]                ;; 03:7FA1 $FA $24 $C1
    and  a                                        ;; 03:7FA4 $A7
    jr   z, .return                               ;; 03:7FA5 $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 03:7FA7 $F1

.return
    ret                                           ;; 03:7FA8 $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_03::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 03:7FA9 $21 $10 $C4
    add  hl, bc                                   ;; 03:7FAC $09
    ld   a, [hl]                                  ;; 03:7FAD $7E
    and  a                                        ;; 03:7FAE $A7
    ret  z                                        ;; 03:7FAF $C8

    dec  a                                        ;; 03:7FB0 $3D
    ld   [hl], a                                  ;; 03:7FB1 $77

    call label_3E8E                               ;; 03:7FB2 $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 03:7FB5 $21 $40 $C2
    add  hl, bc                                   ;; 03:7FB8 $09
    ld   a, [hl]                                  ;; 03:7FB9 $7E
    push af                                       ;; 03:7FBA $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 03:7FBB $21 $50 $C2
    add  hl, bc                                   ;; 03:7FBE $09
    ld   a, [hl]                                  ;; 03:7FBF $7E
    push af                                       ;; 03:7FC0 $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 03:7FC1 $21 $F0 $C3
    add  hl, bc                                   ;; 03:7FC4 $09
    ld   a, [hl]                                  ;; 03:7FC5 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7FC6 $21 $40 $C2
    add  hl, bc                                   ;; 03:7FC9 $09
    ld   [hl], a                                  ;; 03:7FCA $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 03:7FCB $21 $00 $C4
    add  hl, bc                                   ;; 03:7FCE $09
    ld   a, [hl]                                  ;; 03:7FCF $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7FD0 $21 $50 $C2
    add  hl, bc                                   ;; 03:7FD3 $09
    ld   [hl], a                                  ;; 03:7FD4 $77

    call UpdateEntityPosWithSpeed_03              ;; 03:7FD5 $CD $25 $7F

    ld   hl, wEntitiesOptions1Table               ;; 03:7FD8 $21 $30 $C4
    add  hl, bc                                   ;; 03:7FDB $09
    ld   a, [hl]                                  ;; 03:7FDC $7E
    and  ENTITY_OPT1_ALLOW_OUT_OF_BOUNDS          ;; 03:7FDD $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 03:7FDF $20 $03

    call ApplyEntityInteractionWithBackground     ;; 03:7FE1 $CD $93 $78

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ;; 03:7FE4 $21 $50 $C2
    add  hl, bc                                   ;; 03:7FE7 $09
    pop  af                                       ;; 03:7FE8 $F1
    ld   [hl], a                                  ;; 03:7FE9 $77
    ld   hl, wEntitiesSpeedXTable                 ;; 03:7FEA $21 $40 $C2
    add  hl, bc                                   ;; 03:7FED $09
    pop  af                                       ;; 03:7FEE $F1
    ld   [hl], a                                  ;; 03:7FEF $77
    pop  af                                       ;; 03:7FF0 $F1

    call StopEntityRecoilOnCollision              ;; 03:7FF1 $CD $AF $3E

    ret                                           ;; 03:7FF4 $C9
