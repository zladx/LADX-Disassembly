OwlEventEntityHandler::
    ld   a, c                                     ; $67F5: $79
    ld   [wOwlEntityIndex], a                     ; $67F6: $EA $01 $C5
    ldh  a, [hMapRoom]                            ; $67F9: $F0 $F6
    cp   $64                        ; Ghost's gravestone
    jr   nz, .jr_680D                             ; $67FD: $20 $0E

    ld   a, [wIndoorARoomStatus + $E3]            ; $67FF: $FA $E3 $D9
    and  $40                                      ; $6802: $E6 $40
    ret  z                                        ; $6804: $C8

    ld   a, [wHasInstrument5]                     ; $6805: $FA $69 $DB
    and  $02                                      ; $6808: $E6 $02
    jp   nz, ClearEntityStatus_06                 ; $680A: $C2 $DB $65

.jr_680D
    ldh  a, [hMapRoom]                            ; $680D: $F0 $F6
    cp   ROOM_OW_SOUTHERN_FACE_SHRINE_ENTRANCE    ; $680F: $FE $AC
    jr   nz, .jr_681A                             ; $6811: $20 $07

    ldh  a, [hRoomStatus]                         ; $6813: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $6815: $E6 $10
    jp   z, ClearEntityStatus_06                  ; $6817: $CA $DB $65

.jr_681A
    ldh  a, [hMapRoom]                            ; $681A: $F0 $F6
    cp   UNKNOWN_ROOM_41                          ; Tail Cave key chest
    jr   nz, .jr_6829                             ; $681E: $20 $09

    ld   a, [wHasTailKey]                         ; $6820: $FA $11 $DB
    and  a                                        ; $6823: $A7
    ret  z                                        ; $6824: $C8

    call GetEntityPrivateCountdown1               ; $6825: $CD $00 $0C
    ret  nz                                       ; $6828: $C0

.jr_6829
    ldh  a, [hMapRoom]                            ; $6829: $F0 $F6
    cp   UNKNOWN_ROOM_EE                          ; Yarna Desert
    jr   nz, .jr_6835                             ; $682D: $20 $06

    ld   a, [wHasAnglerKey]                       ; $682F: $FA $12 $DB
    and  a                                        ; $6832: $A7
    jr   jr_006_689D                              ; $6833: $18 $68

.jr_6835
    ldh  a, [hMapRoom]                            ; $6835: $F0 $F6
    cp   UNKNOWN_ROOM_D2                          ; 1 room west of Tail Cave
    jr   z, .jr_684E                              ; $6839: $28 $13
    cp   UNKNOWN_ROOM_36                          ; 1 room east of Moblin Hideout
    jr   nz, jr_006_6853                          ; $683D: $20 $14

    ld   a, [wHasInstrument2]                     ; $683F: $FA $66 $DB
    and  a                                        ; $6842: $A7
    jp   nz, ClearEntityStatus_06                 ; $6843: $C2 $DB $65

    ld   a, [wIsBowWowFollowingLink]              ; $6846: $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ; $6849: $FE $01
    jp   nz, ClearEntityStatus_06                 ; $684B: $C2 $DB $65

.jr_684E
    ld   a, [wHasInstrument1]                     ; $684E: $FA $65 $DB
    jr   jr_006_689B                              ; $6851: $18 $48

jr_006_6853:
    ldh  a, [hMapRoom]                            ; $6853: $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ; Bridge where Marin gets trapped
    jr   nz, .jr_6869                             ; $6857: $20 $10

    ld   a, [wHasInstrument8]                     ; $6859: $FA $6C $DB
    and  $02                                      ; $685C: $E6 $02
    jp   nz, ClearEntityStatus_06                 ; $685E: $C2 $DB $65

    ld   a, [wOverworldRoomStatus + ROOM_OW_MARIN_BRIDGE] ; $6861: $FA $08 $D8
    and  OW_ROOM_STATUS_CHANGED                   ; $6864: $E6 $10
    ret  z                                        ; $6866: $C8

    jr   jr_006_68A0                              ; $6867: $18 $37

.jr_6869
    cp   UNKNOWN_ROOM_9D                          ; Room with staircase leading to Face Shrine dungeon passage
    jr   nz, .jr_6872                             ; $686B: $20 $05

    ld   a, [wHasInstrument5]                     ; $686D: $FA $69 $DB
    jr   jr_006_689B                              ; $6870: $18 $29

.jr_6872
    cp   UNKNOWN_ROOM_06                          ; Wind Fish's Egg
    jr   nz, .jr_687E                             ; $6874: $20 $08

    ld   a, [wOverworldRoomStatus + UNKNOWN_ROOM_06] ; $6876: $FA $06 $D8
    and  OW_ROOM_STATUS_CHANGED                   ; $6879: $E6 $10
    ret  z                                        ; $687B: $C8

    jr   jr_006_68A0                              ; $687C: $18 $22

.jr_687E
    cp   UNKNOWN_ROOM_B6                          ; One east of Key Cavern
    jr   nz, .jr_6887                             ; $6880: $20 $05

    ld   a, [wHasInstrument3]                     ; $6882: $FA $67 $DB
    jr   jr_006_689B                              ; $6885: $18 $14

.jr_6887
    cp   UNKNOWN_ROOM_17                          ; One south-east of Wind Fish's Egg
    jr   z, .jr_688F                              ; $6889: $28 $04

    cp   UNKNOWN_ROOM_9C                          ; One south of Face Shrine dungeon
    jr   nz, jr_006_6894                          ; $688D: $20 $05

.jr_688F
    ld   a, [wHasInstrument6]                     ; $688F: $FA $6A $DB
    jr   jr_006_689B                              ; $6892: $18 $07

jr_006_6894:
    cp   UNKNOWN_ROOM_16                          ; One south of Wind Fish's Egg
    jr   nz, jr_006_68A0                          ; $6896: $20 $08

    ld   a, [wHasInstrument2]                     ; $6898: $FA $66 $DB

jr_006_689B:
    and  $02                                      ; $689B: $E6 $02

jr_006_689D:
    jp   z, ClearEntityStatus_06                  ; $689D: $CA $DB $65

jr_006_68A0:
    ldh  a, [hMapRoom]                            ; $68A0: $F0 $F6
    cp   UNKNOWN_ROOM_D2                          ; 1 room west of Tail Cave
    jr   z, .jr_68B4                              ; $68A4: $28 $0E
    cp   UNKNOWN_ROOM_16                          ; One south of Wind Fish's Egg
    jr   z, .jr_68B4                              ; $68A8: $28 $0A
    cp   UNKNOWN_ROOM_36                          ; 1 room east of Moblin Hideout
    jr   z, .jr_68B4                              ; $68AC: $28 $06

    ldh  a, [hActiveEntityState]                  ; $68AE: $F0 $F0
    cp   $00                                      ; $68B0: $FE $00
    jr   z, jr_006_68B7                           ; $68B2: $28 $03

.jr_68B4
    call func_006_6A4F                            ; $68B4: $CD $4F $6A

jr_006_68B7:
    ldh  a, [hFrameCounter]                       ; $68B7: $F0 $E7
    and  $B0                                      ; $68B9: $E6 $B0
    ld   a, $00                                   ; $68BB: $3E $00
    jr   nz, .jr_68C0                             ; $68BD: $20 $01

    inc  a                                        ; $68BF: $3C

.jr_68C0
    call SetEntitySpriteVariant                   ; $68C0: $CD $0C $3B
    ld   a, [wRoomTransitionState]                ; $68C3: $FA $24 $C1
    and  a                                        ; $68C6: $A7
    ret  nz                                       ; $68C7: $C0

    ldh  a, [hActiveEntityState]                  ; $68C8: $F0 $F0
    JP_TABLE                                      ; $68CA
._00 dw OwlState0Handler
._01 dw OwlState1Handler
._02 dw OwlState2Handler
._03 dw OwlState3Handler
._04 dw OwlState4Handler

OwlState0Handler::
    ldh  a, [hMapRoom]
    cp   ROOM_OW_BEACH_WITH_SWORD
    jr   nz, .jr_68EF                             ; $68D9: $20 $14

    ld   a, MUSIC_OVERWORLD_SWORDLESS             ; $68DB: $3E $1D
    ldh  [hDefaultMusicTrack], a                  ; $68DD: $E0 $B0
    ldh  a, [hLinkPositionY]                      ; $68DF: $F0 $99
    cp   $44                                      ; $68E1: $FE $44
    ret  c                                        ; $68E3: $D8

    ldh  a, [hLinkPositionX]                      ; $68E4: $F0 $98
    sub  $58                                      ; $68E6: $D6 $58
    add  $18                                      ; $68E8: $C6 $18
    cp   $30                                      ; $68EA: $FE $30
    ret  nc                                       ; $68EC: $D0

    jr   jr_006_68F6                              ; $68ED: $18 $07

.jr_68EF
    ld   a, [wSwordLevel]                         ; $68EF: $FA $4E $DB
    and  a                                        ; $68F2: $A7
    jp   z, ClearEntityStatus_06                  ; $68F3: $CA $DB $65

jr_006_68F6:
    ldh  a, [hDefaultMusicTrack]                  ; $68F6: $F0 $B0
    ld   hl, wEntitiesPrivateState1Table          ; $68F8: $21 $B0 $C2
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], a                                  ; $68FC: $77
    ld   a, MUSIC_OWL                             ; $68FD: $3E $22
    ld   [wMusicTrackToPlay], a                   ; $68FF: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $6902: $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ; $6904: $E0 $BD

    ldh  a, [hMapRoom]                            ; $6906: $F0 $F6
    cp   UNKNOWN_ROOM_16                          ; $6908: $FE $16
    jr   z, .jr_6914                              ; $690A: $28 $08
    cp   UNKNOWN_ROOM_36                          ; $690C: $FE $36
    jr   z, .jr_6914                              ; $690E: $28 $04
    cp   UNKNOWN_ROOM_D2                          ; $6910: $FE $D2
    jr   nz, jr_006_691A                          ; $6912: $20 $06

.jr_6914
    call IncrementEntityState                     ; $6914: $CD $12 $3B
    ld   [hl], $02                                ; $6917: $36 $02
    ret                                           ; $6919: $C9

jr_006_691A:
    ld   hl, wEntitiesPosZTable                   ; $691A: $21 $10 $C3
    add  hl, bc                                   ; $691D: $09
    ld   [hl], $20                                ; $691E: $36 $20
    ld   hl, wEntitiesSpeedXTable                 ; $6920: $21 $40 $C2
    add  hl, bc                                   ; $6923: $09
    ld   [hl], $18                                ; $6924: $36 $18
    ld   hl, wEntitiesSpeedYTable                 ; $6926: $21 $50 $C2
    add  hl, bc                                   ; $6929: $09
    ld   [hl], $10                                ; $692A: $36 $10
    jp   IncrementEntityState                     ; $692C: $C3 $12 $3B

OwlState1Handler::
    call func_006_65B4                            ; $692F: $CD $B4 $65
    ld   a, e                                     ; $6932: $7B
    xor  $01                                      ; $6933: $EE $01
    ldh  [hLinkDirection], a                      ; $6935: $E0 $9E
    ld   a, $02                                   ; $6937: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6939: $E0 $A1
    ld   a, $05                                   ; $693B: $3E $05
    ld   [wC111], a                               ; $693D: $EA $11 $C1
    call func_006_69BD                            ; $6940: $CD $BD $69
    call UpdateEntityPosWithSpeed_06              ; $6943: $CD $41 $65
    ld   hl, wEntitiesPosZTable                   ; $6946: $21 $10 $C3
    add  hl, bc                                   ; $6949: $09
    ld   a, [hl]                                  ; $694A: $7E
    and  a                                        ; $694B: $A7
    jr   nz, .jr_6951                             ; $694C: $20 $03

    jp   IncrementEntityState                     ; $694E: $C3 $12 $3B

.jr_6951
    ld   hl, wEntitiesSpeedZTable                 ; $6951: $21 $20 $C3
    add  hl, bc                                   ; $6954: $09
    ld   [hl], $FC                                ; $6955: $36 $FC
    call AddEntityZSpeedToPos_06                  ; $6957: $CD $7A $65
    call PlayBoomerangSfx_trampoline              ; $695A: $CD $F8 $29
    ldh  a, [hFrameCounter]                       ; $695D: $F0 $E7
    and  $03                                      ; $695F: $E6 $03
    ret  nz                                       ; $6961: $C0

    ld   a, $00                                   ; $6962: $3E $00
    ld   hl, wEntitiesSpeedYTable                 ; $6964: $21 $50 $C2
    call func_006_6A2B                            ; $6967: $CD $2B $6A
    ld   a, $00                                   ; $696A: $3E $00
    ld   hl, wEntitiesSpeedXTable                 ; $696C: $21 $40 $C2
    jp   func_006_6A2B                            ; $696F: $C3 $2B $6A

OwlState2Handler::
    call ReturnIfNonInteractive_06                ; $6972: $CD $C6 $64
    call PushLinkOutOfEntity_06                   ; $6975: $CD $1A $64
    ld   a, [wTransitionSequenceCounter]          ; $6978: $FA $6B $C1
    cp   $04                                      ; $697B: $FE $04
    ret  nz                                       ; $697D: $C0

    ld   a, [wFreeMovementMode]                   ; $697E: $FA $7B $C1
    and  a                                        ; $6981: $A7
    ret  nz                                       ; $6982: $C0

    ldh  a, [hMapRoom]                            ; $6983: $F0 $F6
    cp   UNKNOWN_ROOM_06                          ; $6985: $FE $06
    jr   nz, .jr_6990                             ; $6987: $20 $07

    call_open_dialog Dialog0CD                    ; $6989
    jr   jr_006_6993                              ; $698E: $18 $03

.jr_6990
    call label_2A07                               ; $6990: $CD $07 $2A

jr_006_6993:
    ld   a, $19                                   ; $6993: $3E $19
    ld   [wDialogSFX], a                          ; $6995: $EA $AB $C5
    call IncrementEntityState                     ; $6998: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $699B: $CD $05 $0C
    ld   [hl], $10                                ; $699E: $36 $10
    ret                                           ; $69A0: $C9

OwlState3Handler::
    call ReturnIfNonInteractive_06                ; $69A1: $CD $C6 $64
    ldh  a, [hMapRoom]                            ; $69A4: $F0 $F6
    cp   UNKNOWN_ROOM_06                          ; $69A6: $FE $06
    jr   z, .jr_69B2                              ; $69A8: $28 $08

    call GetEntityTransitionCountdown             ; $69AA: $CD $05 $0C
    jr   nz, func_006_69BD                        ; $69AD: $20 $0E

    call IncrementEntityState                     ; $69AF: $CD $12 $3B

.jr_69B2
    ldh  a, [hMapRoom]                            ; $69B2: $F0 $F6
    ld   e, a                                     ; $69B4: $5F
    ld   d, b                                     ; $69B5: $50
    ld   hl, wOverworldRoomStatus                 ; $69B6: $21 $00 $D8
    add  hl, de                                   ; $69B9: $19
    set  OW_ROOM_STATUS_FLAG_OWL_TALKED, [hl]     ; $69BA: $CB $EE
    ret                                           ; $69BC: $C9

func_006_69BD::
    ld   a, $02                                   ; $69BD: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $69BF: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $69C1: $F0 $E7
    rra                                           ; $69C3: $1F
    rra                                           ; $69C4: $1F
    and  $02                                      ; $69C5: $E6 $02
    jp   SetEntitySpriteVariant                   ; $69C7: $C3 $0C $3B

OwlState4Handler::
    call ReturnIfNonInteractive_06                ; $69CA: $CD $C6 $64
    call func_006_69BD                            ; $69CD: $CD $BD $69
    call UpdateEntityPosWithSpeed_06              ; $69D0: $CD $41 $65
    call func_006_5E54                            ; $69D3: $CD $54 $5E
    ld   hl, wEntitiesSpeedZTable                 ; $69D6: $21 $20 $C3
    add  hl, bc                                   ; $69D9: $09
    ld   [hl], $04                                ; $69DA: $36 $04
    call AddEntityZSpeedToPos_06                  ; $69DC: $CD $7A $65
    ld   hl, wEntitiesStatusTable                 ; $69DF: $21 $80 $C2
    add  hl, bc                                   ; $69E2: $09
    ld   a, [hl]                                  ; $69E3: $7E
    and  a                                        ; $69E4: $A7
    jr   nz, jr_006_6A05                          ; $69E5: $20 $1E

    ld   hl, wEntitiesPrivateState1Table          ; $69E7: $21 $B0 $C2
    add  hl, bc                                   ; $69EA: $09
    ld   a, [hl]                                  ; $69EB: $7E
    ld   [wMusicTrackToPlay], a                   ; $69EC: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $69EF: $E0 $B0
    ld   a, [wActivePowerUp]                      ; $69F1: $FA $7C $D4
    and  a                                        ; $69F4: $A7
    jr   z, .return                               ; $69F5: $28 $0D

IF !__PATCH_0__
    ld   a, [wTunicType]                          ; $69F7: $FA $0F $DC
    and  a                                        ; $69FA: $A7
    jr   nz, .return                              ; $69FB: $20 $07
ENDC

    ld   a, MUSIC_ACTIVE_POWER_UP
    ld   [wMusicTrackToPlay], a                   ; $69FF: $EA $68 $D3
    ldh  [hDefaultMusicTrackAlt], a               ; $6A02: $E0 $BD

.return
    ret                                           ; $6A04: $C9

jr_006_6A05:
    ldh  a, [hFrameCounter]                       ; $6A05: $F0 $E7
    and  $07                                      ; $6A07: $E6 $07
    jr   nz, .jr_6A0F                             ; $6A09: $20 $04

    ld   a, NOISE_SFX_CUT_GRASS                   ; $6A0B: $3E $05
    ldh  [hNoiseSfx], a                           ; $6A0D: $E0 $F4

.jr_6A0F
    ldh  a, [hFrameCounter]                       ; $6A0F: $F0 $E7
    and  $01                                      ; $6A11: $E6 $01
    jr   nz, ret_006_6A36                         ; $6A13: $20 $21

    ld   a, $20                                   ; $6A15: $3E $20
    call GetVectorTowardsLink_trampoline          ; $6A17: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $6A1A: $F0 $D7
    cpl                                           ; $6A1C: $2F
    inc  a                                        ; $6A1D: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $6A1E: $21 $50 $C2
    call func_006_6A2B                            ; $6A21: $CD $2B $6A
    ldh  a, [hMultiPurpose1]                      ; $6A24: $F0 $D8
    cpl                                           ; $6A26: $2F
    inc  a                                        ; $6A27: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6A28: $21 $40 $C2

func_006_6A2B::
    add  hl, bc                                   ; $6A2B: $09
    sub  [hl]                                     ; $6A2C: $96
    jr   z, ret_006_6A36                          ; $6A2D: $28 $07

    bit  7, a                                     ; $6A2F: $CB $7F
    jr   z, .jr_6A35                              ; $6A31: $28 $02

    dec  [hl]                                     ; $6A33: $35
    dec  [hl]                                     ; $6A34: $35

.jr_6A35
    inc  [hl]                                     ; $6A35: $34

ret_006_6A36:
    ret                                           ; $6A36: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
OwlEventSpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0
    db $78, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

Data_006_6A3F::
    db   $00, $F8, $7C, $01, $00, $00, $7E, $01
    db   $00, $08, $7E, $21, $00, $10, $7C, $21

func_006_6A4F::
    ldh  a, [hActiveEntitySpriteVariant]
    cp   $02                                      ; $6A51: $FE $02
    jr   nc, jr_006_6A5B                          ; $6A53: $30 $06

func_006_6A55::
    ld   de, OwlEventSpriteVariants               ; $6A55: $11 $37 $6A
    jp   RenderActiveEntitySpritesPair            ; $6A58: $C3 $C0 $3B

jr_006_6A5B:
    ld   hl, Data_006_6A3F                        ; $6A5B: $21 $3F $6A
    ld   c, $04                                   ; $6A5E: $0E $04
    call RenderActiveEntitySpritesRect            ; $6A60: $CD $E6 $3C
    ld   a, $04                                   ; $6A63: $3E $04
    call func_015_7964_trampoline                 ; $6A65: $CD $A0 $3D
    ldh  a, [hMapRoom]                            ; $6A68: $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ; $6A6A: $FE $08
    jr   z, .jr_6A71                              ; $6A6C: $28 $03
    jp   label_3CD9                               ; $6A6E: $C3 $D9 $3C

.jr_6A71
    ld   hl, wEntitiesPhysicsFlagsTable           ; $6A71: $21 $40 $C3
    add  hl, bc                                   ; $6A74: $09
    res  ENTITY_PHYSICS_B_SHADOW, [hl]            ; $6A75: $CB $A6
    ret                                           ; $6A77: $C9
