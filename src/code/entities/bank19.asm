; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/19_liftable_statue.asm"
include "code/entities/19_warp.asm"
include "code/entities/19_boomerang.asm"
include "code/entities/19_sword_beam.asm"
include "code/entities/19_goriya.asm"
include "code/entities/19_masked_mimic.asm"
include "code/entities/19_divable_water.asm"
include "code/entities/19_dog.asm"
include "code/entities/19_egg_song_event.asm"
include "code/entities/19_flying_rooster_events.asm"
include "code/entities/19_giant_bubble.asm"
include "code/entities/19_podoboo.asm"
include "code/entities/19_thwimp_thwomp.asm"
include "code/entities/19_side_view_pot.asm"
include "code/entities/19_rooster.asm"
include "code/entities/19_richard_frog.asm"

; Location of the 4 warps on the overworld
WarpLocationsTable::
    db   $00, $2C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $EC, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $95, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

func_019_5D6A::
    ld   a, $01                                   ; $5D6A: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5D6C: $E0 $A1
    ld   [wC167], a                               ; $5D6E: $EA $67 $C1
    call ClearLinkPositionIncrement               ; $5D71: $CD $8E $17
    ldh  a, [hLinkPhysicsModifier]                ; $5D74: $F0 $9C
    JP_TABLE                                      ; $5D76
._00 dw func_019_5D7D                             ; $5D77
._01 dw func_019_5D8F                             ; $5D79
._02 dw func_019_5DAC                             ; $5D7B

func_019_5D7D::
    ; Wait until the warp countdown reaches 0…
    ldh  a, [hLinkCountdown]                      ; $5D7D: $F0 $B7
    and  a                                        ; $5D7F: $A7
    jr   nz, .return                              ; $5D80: $20 $08

    ; … then teleport Link
    ld   a, $01                                   ; $5D82: $3E $01
    ldh  [hLinkPhysicsModifier], a                ; $5D84: $E0 $9C
    ld   a, JINGLE_OVERWORLD_WARP_HOLE            ; $5D86: $3E $25
    ldh  [hJingle], a                             ; $5D88: $E0 $F2

.return
    ret                                           ; $5D8A: $C9

Data_019_5D8B::
    db   $00, $03, $01, $02

func_019_5D8F::
    ldh  a, [hLinkCountdown]                      ; $5D8F: $F0 $B7
    and  a                                        ; $5D91: $A7
    jr   nz, func_019_5D99                        ; $5D92: $20 $05

    ld   a, $02                                   ; $5D94: $3E $02
    ldh  [hLinkPhysicsModifier], a                ; $5D96: $E0 $9C
    ret                                           ; $5D98: $C9

func_019_5D99::
    ldh  a, [hFrameCounter]                       ; $5D99: $F0 $E7
    rra                                           ; $5D9B: $1F
    rra                                           ; $5D9C: $1F
    and  $03                                      ; $5D9D: $E6 $03
    ld   e, a                                     ; $5D9F: $5F
    ld   d, $00                                   ; $5DA0: $16 $00
    ld   hl, Data_019_5D8B                        ; $5DA2: $21 $8B $5D
    add  hl, de                                   ; $5DA5: $19
    ld   a, [hl]                                  ; $5DA6: $7E
    ldh  [hLinkDirection], a                      ; $5DA7: $E0 $9E
    jp   UpdateLinkWalkingAnimation_trampoline    ; $5DA9: $C3 $F0 $0B

func_019_5DAC::
    call func_019_5D99                            ; $5DAC: $CD $99 $5D
    ldh  a, [hLinkPositionZ]                      ; $5DAF: $F0 $A2
    add  $04                                      ; $5DB1: $C6 $04
    ldh  [hLinkPositionZ], a                      ; $5DB3: $E0 $A2
    cp   $78                                      ; $5DB5: $FE $78
    jr   c, ret_019_5DF7                          ; $5DB7: $38 $3E

    ld   [wDBC8], a                               ; $5DB9: $EA $C8 $DB
    ldh  a, [hMapRoom]                            ; $5DBC: $F0 $F6
    ld   e, a                                     ; $5DBE: $5F
    ld   d, $00                                   ; $5DBF: $16 $00

    ; Find the next discovered warp on the overworld map
.loop
    ld   hl, WarpLocationsTable                   ; $5DC1: $21 $6A $5C
    add  hl, de                                   ; $5DC4: $19
    ld   e, [hl]                                  ; $5DC5: $5E
    ld   hl, wOverworldRoomStatus                 ; $5DC6: $21 $00 $D8
    add  hl, de                                   ; $5DC9: $19
    ld   a, [hl]                                  ; $5DCA: $7E
    and  OW_ROOM_STATUS_VISITED                   ; $5DCB: $E6 $80
    jr   z, .loop                                 ; $5DCD: $28 $F2

    ; Warp Link
    ld   a, e                                     ; $5DCF: $7B
    ld   [wWarp0Room], a                          ; $5DD0: $EA $03 $D4
    xor  a                                        ; $5DD3: $AF
    ld   [wWarpStructs], a                        ; $5DD4: $EA $01 $D4
    ld   [wWarp0Map], a                           ; $5DD7: $EA $02 $D4
    ld   a, $70                                   ; $5DDA: $3E $70
    ld   [wWarp0DestinationY], a                  ; $5DDC: $EA $05 $D4
    ldh  [hLinkPositionY], a                      ; $5DDF: $E0 $99
    ld   a, $68                                   ; $5DE1: $3E $68
    ld   [wWarp0DestinationX], a                  ; $5DE3: $EA $04 $D4
    ldh  [hLinkPositionX], a                      ; $5DE6: $E0 $98
    ld   [wD475], a                               ; $5DE8: $EA $75 $D4
    ld   a, $66                                   ; $5DEB: $3E $66
    ld   [wWarp0PositionTileIndex], a             ; $5DED: $EA $16 $D4
    call ApplyMapFadeOutTransition                ; $5DF0: $CD $83 $0C
    xor  a                                        ; $5DF3: $AF
    ld   [wC167], a                               ; $5DF4: $EA $67 $C1

ret_019_5DF7:
    ret                                           ; $5DF7: $C9

include "code/entities/19_ghost.asm"
include "code/entities/19_animate_dungeon_door_opening.asm"
include "code/entities/19_mimic.asm"
include "code/entities/19_cheep_cheep.asm"
include "code/entities/19_bananas_schule_sale.asm"
include "code/entities/19_seashell_mansion.asm"

Data_019_794E::
    db   $FC, $04, $00, $00

Data_019_7952::
    db   $FF, $00, $00, $00

Data_019_7956::
    db   $00, $00, $04, $FC

Data_019_795A::
    db   $00, $00, $00

Data_019_795D::
    db   $FF, $0C, $18, $24, $30, $3C, $48

UpdateEntityPositionForRoomTransition::
    ld   a, [wRoomTransitionState]                ; $7964: $FA $24 $C1
    cp   $04                                      ; $7967: $FE $04
    jr   nc, .jr_796C                             ; $7969: $30 $01

    ret                                           ; $796B: $C9

.jr_796C
    ld   a, [wRoomTransitionDirection]            ; $796C: $FA $25 $C1
    ld   e, a                                     ; $796F: $5F
    ld   d, $00                                   ; $7970: $16 $00
    ld   hl, Data_019_794E                        ; $7972: $21 $4E $79
    add  hl, de                                   ; $7975: $19
    ld   a, [hl]                                  ; $7976: $7E
    ldh  [hMultiPurpose0], a                      ; $7977: $E0 $D7
    ld   hl, Data_019_7952                        ; $7979: $21 $52 $79
    add  hl, de                                   ; $797C: $19
    ld   a, [hl]                                  ; $797D: $7E
    ldh  [hMultiPurpose1], a                      ; $797E: $E0 $D8
    ld   hl, Data_019_7956                        ; $7980: $21 $56 $79
    add  hl, de                                   ; $7983: $19
    ld   a, [hl]                                  ; $7984: $7E

.jr_7985
    ldh  [hMultiPurpose2], a                      ; $7985: $E0 $D9
    ld   hl, Data_019_795A                        ; $7987: $21 $5A $79
    add  hl, de                                   ; $798A: $19
    ld   a, [hl]                                  ; $798B: $7E
    ldh  [hMultiPurpose3], a                      ; $798C: $E0 $DA
    ld   hl, wEntitiesPosXTable                   ; $798E: $21 $00 $C2
    add  hl, bc                                   ; $7991: $09
    ldh  a, [hMultiPurpose0]                      ; $7992: $F0 $D7
    add  [hl]                                     ; $7994: $86
    rl   d                                        ; $7995: $CB $12
    ld   [hl], a                                  ; $7997: $77
    ld   hl, wEntitiesPosXSignTable               ; $7998: $21 $20 $C2
    add  hl, bc                                   ; $799B: $09
    ldh  a, [hMultiPurpose1]                      ; $799C: $F0 $D8
    rr   d                                        ; $799E: $CB $1A
    adc  [hl]                                     ; $79A0: $8E
    ld   [hl], a                                  ; $79A1: $77
    ld   hl, wEntitiesPosYTable                   ; $79A2: $21 $10 $C2
    add  hl, bc                                   ; $79A5: $09
    ldh  a, [hMultiPurpose2]                      ; $79A6: $F0 $D9
    add  [hl]                                     ; $79A8: $86
    rl   d                                        ; $79A9: $CB $12
    ld   [hl], a                                  ; $79AB: $77
    ld   hl, wEntitiesPosYSignTable               ; $79AC: $21 $30 $C2
    add  hl, bc                                   ; $79AF: $09
    ldh  a, [hMultiPurpose3]                      ; $79B0: $F0 $DA
    rr   d                                        ; $79B2: $CB $1A
    adc  [hl]                                     ; $79B4: $8E
    ld   [hl], a                                  ; $79B5: $77

    ldh  a, [hActiveEntityType]                   ; $79B6: $F0 $EB
    cp   ENTITY_TURTLE_ROCK_HEAD                  ; $79B8: $FE $7F
    jr   nz, .turtleRockHeadEnd                   ; $79BA: $20 $13

    ld   hl, wEntitiesPrivateState4Table          ; $79BC: $21 $40 $C4
    add  hl, bc                                   ; $79BF: $09
    ldh  a, [hMultiPurpose0]                      ; $79C0: $F0 $D7
    add  [hl]                                     ; $79C2: $86
    ld   [hl], a                                  ; $79C3: $77
    ld   hl, wEntitiesPrivateState3Table          ; $79C4: $21 $D0 $C2
    add  hl, bc                                   ; $79C7: $09
    ldh  a, [hMultiPurpose2]                      ; $79C8: $F0 $D9
    add  [hl]                                     ; $79CA: $86
    ld   [hl], a                                  ; $79CB: $77
    jp   label_019_7A74                           ; $79CC: $C3 $74 $7A
.turtleRockHeadEnd

    cp   ENTITY_DESERT_LANMOLA                    ; $79CF: $FE $87
    jr   nz, .desertLanmolaEnd                    ; $79D1: $20 $3C

    ld   hl, wEntitiesPrivateState3Table          ; $79D3: $21 $D0 $C2
    add  hl, bc                                   ; $79D6: $09
    ld   a, [hl]                                  ; $79D7: $7E
    cp   $02                                      ; $79D8: $FE $02
    jp   z, label_019_7A74                        ; $79DA: $CA $74 $7A

    ld   hl, wEntitiesInertiaTable                ; $79DD: $21 $D0 $C3
    add  hl, bc                                   ; $79E0: $09
    ld   a, [hl]                                  ; $79E1: $7E
    ldh  [hFreeWarpDataAddress], a                ; $79E2: $E0 $E6

    ld   a, $06                                   ; $79E4: $3E $06
.loop_019_79E6
    ldh  [hMultiPurposeG], a                      ; $79E6: $E0 $E8
    ld   e, a                                     ; $79E8: $5F
    ld   d, b                                     ; $79E9: $50
    ld   hl, Data_019_795D                        ; $79EA: $21 $5D $79
    add  hl, de                                   ; $79ED: $19
    push hl                                       ; $79EE: $E5
    ldh  a, [hFreeWarpDataAddress]                ; $79EF: $F0 $E6
    sub  [hl]                                     ; $79F1: $96
    ld   e, a                                     ; $79F2: $5F
    ld   d, b                                     ; $79F3: $50
    ld   hl, wIsFileSelectionArrowShifted         ; $79F4: $21 $00 $D0
    add  hl, de                                   ; $79F7: $19
    ldh  a, [hMultiPurpose0]                      ; $79F8: $F0 $D7
    add  [hl]                                     ; $79FA: $86
    ld   [hl], a                                  ; $79FB: $77
    ldh  a, [hFreeWarpDataAddress]                ; $79FC: $F0 $E6
    pop  hl                                       ; $79FE: $E1
    sub  [hl]                                     ; $79FF: $96
    ld   e, a                                     ; $7A00: $5F
    ld   d, b                                     ; $7A01: $50
    ld   hl, wD100                                ; $7A02: $21 $00 $D1
    add  hl, de                                   ; $7A05: $19
    ldh  a, [hMultiPurpose2]                      ; $7A06: $F0 $D9
    add  [hl]                                     ; $7A08: $86
    ld   [hl], a                                  ; $7A09: $77
    ldh  a, [hMultiPurposeG]                      ; $7A0A: $F0 $E8
    dec  a                                        ; $7A0C: $3D
    jr   nz, .loop_019_79E6                       ; $7A0D: $20 $D7
.desertLanmolaEnd

    cp   ENTITY_MARIN_AT_THE_SHORE                ; $7A0F: $FE $C1
    jr   nz, .marinAtTheShoreEnd                  ; $7A11: $20 $20

    ld   a, [wIsMarinFollowingLink]               ; $7A13: $FA $73 $DB
    and  a                                        ; $7A16: $A7
    jr   z, label_019_7A74                        ; $7A17: $28 $5B

    ; increment $10 bytes at wLinkPositionXHistory by hMultiPurpose0
    ld   e, $10                                   ; $7A19: $1E $10
    ld   hl, wLinkPositionXHistory                ; $7A1B: $21 $55 $D1
.loop_019_7A1E
    ldh  a, [hMultiPurpose0]                      ; $7A1E: $F0 $D7
    add  [hl]                                     ; $7A20: $86
    ld   [hl+], a                                 ; $7A21: $22
    dec  e                                        ; $7A22: $1D
    jr   nz, .loop_019_7A1E                       ; $7A23: $20 $F9

    ; increment $10 bytes at wLinkPositionYHistory by hMultiPurpose2
    ld   e, $10                                   ; $7A25: $1E $10
    ld   hl, wLinkPositionYHistory                ; $7A27: $21 $75 $D1
.loop_019_7A2A
    ldh  a, [hMultiPurpose2]                      ; $7A2A: $F0 $D9
    add  [hl]                                     ; $7A2C: $86
    ld   [hl+], a                                 ; $7A2D: $22
    dec  e                                        ; $7A2E: $1D
    jr   nz, .loop_019_7A2A                       ; $7A2F: $20 $F9

    jr   label_019_7A74                           ; $7A31: $18 $41
.marinAtTheShoreEnd

    cp   ENTITY_MOVING_BLOCK_MOVER                ; $7A33: $FE $69
    jr   z, .jr_019_7A64                          ; $7A35: $28 $2D

    cp   ENTITY_PINCER                            ; $7A37: $FE $B0
    jr   z, .jr_019_7A64                          ; $7A39: $28 $29

    cp   ENTITY_BOW_WOW                           ; $7A3B: $FE $6D
    jr   nz, label_019_7A74                       ; $7A3D: $20 $35

    ld   a, [wIsBowWowFollowingLink]              ; $7A3F: $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ; $7A42: $FE $01
    jr   nz, .jr_019_7A4C                         ; $7A44: $20 $06

    ldh  a, [hFrameCounter]                       ; $7A46: $F0 $E7
    and  $07                                      ; $7A48: $E6 $07
    jr   z, label_019_7A74                        ; $7A4A: $28 $28

.jr_019_7A4C
    ; increment $6 bytes at wD100 by hMultiPurpose0
    ld   e, $06                                   ; $7A4C: $1E $06
    ld   hl, wD100                                ; $7A4E: $21 $00 $D1
.loop_019_7A51
    ldh  a, [hMultiPurpose0]                      ; $7A51: $F0 $D7
    add  [hl]                                     ; $7A53: $86
    ld   [hl+], a                                 ; $7A54: $22
    dec  e                                        ; $7A55: $1D
    jr   nz, .loop_019_7A51                       ; $7A56: $20 $F9

    ; increment $6 bytes at wD110 by hMultiPurpose2
    ld   e, $06                                   ; $7A58: $1E $06
    ld   hl, wD110                                ; $7A5A: $21 $10 $D1
.loop_019_7A5D
    ldh  a, [hMultiPurpose2]                      ; $7A5D: $F0 $D9
    add  [hl]                                     ; $7A5F: $86
    ld   [hl+], a                                 ; $7A60: $22
    dec  e                                        ; $7A61: $1D
    jr   nz, .loop_019_7A5D                       ; $7A62: $20 $F9

.jr_019_7A64
    ld   hl, wEntitiesPrivateState1Table          ; $7A64: $21 $B0 $C2
    add  hl, bc                                   ; $7A67: $09
    ldh  a, [hMultiPurpose0]                      ; $7A68: $F0 $D7
    add  [hl]                                     ; $7A6A: $86
    ld   [hl], a                                  ; $7A6B: $77
    ld   hl, wEntitiesPrivateState2Table          ; $7A6C: $21 $C0 $C2
    add  hl, bc                                   ; $7A6F: $09
    ldh  a, [hMultiPurpose2]                      ; $7A70: $F0 $D9
    add  [hl]                                     ; $7A72: $86
    ld   [hl], a                                  ; $7A73: $77

label_019_7A74:
    ldh  a, [hMapRoom]                            ; $7A74: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $7A76: $21 $E0 $C3
    add  hl, bc                                   ; $7A79: $09
    cp   [hl]                                     ; $7A7A: $BE
    ret  z                                        ; $7A7B: $C8

    ld   hl, wEntitiesPosXTable                   ; $7A7C: $21 $00 $C2
    add  hl, bc                                   ; $7A7F: $09
    ld   a, [hl]                                  ; $7A80: $7E
    cp   $A0                                      ; $7A81: $FE $A0
    jr   nc, .jr_7A8F                             ; $7A83: $30 $0A

    ld   hl, wEntitiesPosYTable                   ; $7A85: $21 $10 $C2
    add  hl, bc                                   ; $7A88: $09
    ld   a, [hl]                                  ; $7A89: $7E
    sub  $10                                      ; $7A8A: $D6 $10
    cp   $78                                      ; $7A8C: $FE $78
    ret  c                                        ; $7A8E: $D8

.jr_7A8F
    ldh  a, [hActiveEntityType]                   ; $7A8F: $F0 $EB
    cp   ENTITY_SMASHABLE_PILLAR                  ; $7A91: $FE $A7
    ret  z                                        ; $7A93: $C8

    ld   hl, wEntitiesStatusTable                 ; $7A94: $21 $80 $C2
    add  hl, bc                                   ; $7A97: $09
    ld   [hl], b                                  ; $7A98: $70
    ret                                           ; $7A99: $C9

func_019_7A9A::
    ld   a, [wConveyorBeltsCount]                 ; $7A9A: $FA $A5 $C1
    and  a                                        ; $7A9D: $A7
    ret  z                                        ; $7A9E: $C8

    ld   a, [wDialogState]                        ; $7A9F: $FA $9F $C1
    and  a                                        ; $7AA2: $A7
    ret  nz                                       ; $7AA3: $C0

    ldh  a, [hFrameCounter]                       ; $7AA4: $F0 $E7
    and  $03                                      ; $7AA6: $E6 $03
    sla  a                                        ; $7AA8: $CB $27
    add  LOW(Data_019_7AB6)                       ; $7AAA: $C6 $B6
    ld   l, a                                     ; $7AAC: $6F
    ld   a, HIGH(Data_019_7AB6)                   ; $7AAD: $3E $7A
    adc  $00                                      ; $7AAF: $CE $00
    ld   h, a                                     ; $7AB1: $67
    ld   a, [hl+]                                 ; $7AB2: $2A
    ld   h, [hl]                                  ; $7AB3: $66
    ld   l, a                                     ; $7AB4: $6F
    jp   hl                                       ; $7AB5: $E9

Data_019_7AB6:
._00 dw func_019_7ABE
._01 dw func_019_7ADB
._02 dw func_019_7AF8
._03 dw func_019_7B04

func_019_7ABE:
    ld   hl, wDCCF                                ; $7ABE: $21 $CF $DC
    ld   de, wDCCF                                ; $7AC1: $11 $CF $DC
    ld   a, [hl-]                                 ; $7AC4: $3A
    push af                                       ; $7AC5: $F5
    ld   a, [hl-]                                 ; $7AC6: $3A
    push af                                       ; $7AC7: $F5
    ld   c, $07                                   ; $7AC8: $0E $07

.loop_7ACA
    ld   a, [hl-]                                 ; $7ACA: $3A
    ld   [de], a                                  ; $7ACB: $12
    dec  de                                       ; $7ACC: $1B
    ld   a, [hl-]                                 ; $7ACD: $3A
    ld   [de], a                                  ; $7ACE: $12
    dec  de                                       ; $7ACF: $1B
    dec  c                                        ; $7AD0: $0D
    jr   nz, .loop_7ACA                           ; $7AD1: $20 $F7

    pop  hl                                       ; $7AD3: $E1
    pop  bc                                       ; $7AD4: $C1
    ld   a, b                                     ; $7AD5: $78
    ld   [de], a                                  ; $7AD6: $12
    dec  de                                       ; $7AD7: $1B
    ld   a, h                                     ; $7AD8: $7C
    ld   [de], a                                  ; $7AD9: $12
    ret                                           ; $7ADA: $C9

func_019_7ADB:
    ld   hl, wDCD0                                ; $7ADB: $21 $D0 $DC
    ld   de, wDCD0                                ; $7ADE: $11 $D0 $DC
    ld   a, [hl+]                                 ; $7AE1: $2A
    push af                                       ; $7AE2: $F5
    ld   a, [hl+]                                 ; $7AE3: $2A
    push af                                       ; $7AE4: $F5
    ld   c, $07                                   ; $7AE5: $0E $07

.loop_7AE7
    ld   a, [hl+]                                 ; $7AE7: $2A
    ld   [de], a                                  ; $7AE8: $12
    inc  de                                       ; $7AE9: $13
    ld   a, [hl+]                                 ; $7AEA: $2A
    ld   [de], a                                  ; $7AEB: $12
    inc  de                                       ; $7AEC: $13
    dec  c                                        ; $7AED: $0D
    jr   nz, .loop_7AE7                           ; $7AEE: $20 $F7

    pop  hl                                       ; $7AF0: $E1
    pop  bc                                       ; $7AF1: $C1
    ld   a, b                                     ; $7AF2: $78
    ld   [de], a                                  ; $7AF3: $12
    inc  de                                       ; $7AF4: $13
    ld   a, h                                     ; $7AF5: $7C
    ld   [de], a                                  ; $7AF6: $12
    ret                                           ; $7AF7: $C9

func_019_7AF8:
    ld   hl, wDCE0                                ; $7AF8: $21 $E0 $DC
    ld   e, $10                                   ; $7AFB: $1E $10

.loop_7AFD
    rlc  [hl]                                     ; $7AFD: $CB $06
    inc  hl                                       ; $7AFF: $23
    dec  e                                        ; $7B00: $1D
    jr   nz, .loop_7AFD                           ; $7B01: $20 $FA

    ret                                           ; $7B03: $C9

func_019_7B04:
    ld   hl, wDCF0                                ; $7B04: $21 $F0 $DC
    ld   e, $10                                   ; $7B07: $1E $10

.loop_7B09
    rrc  [hl]                                     ; $7B09: $CB $0E
    inc  hl                                       ; $7B0B: $23
    dec  e                                        ; $7B0C: $1D
    jr   nz, .loop_7B09                           ; $7B0D: $20 $FA

    ret                                           ; $7B0F: $C9

Data_019_7B10::
    db   $FD, $FC, $16, $00, $FC, $0C, $16, $00, $0E, $FB, $16, $00, $0C, $0D, $16, $00
    db   $FB, $FD, $16, $00, $FA, $0B, $16, $00, $0B, $FC, $16, $00, $09, $0C, $16, $00
    db   $FD, $FE, $16, $00, $FC, $0A, $16, $00, $0B, $FD, $16, $00, $08, $0A, $16, $00
    db   $FF, $00, $16, $00, $00, $08, $16, $00, $0A, $FF, $16, $00, $08, $09, $16, $00

Data_019_7B50::
    db   $02, $FC, $28, $00, $FB, $04, $28, $60, $05, $06, $28, $00, $01, $0A, $28, $20
    db   $01, $FF, $28, $00, $F9, $04, $28, $60, $08, $06, $28, $00, $02, $07, $28, $20
    db   $00, $00, $28, $20, $F8, $02, $28, $60, $04, $04, $28, $20, $0A, $07, $28, $20
    db   $FE, $01, $28, $20, $04, $01, $28, $60, $04, $05, $28, $20, $0C, $07, $28, $20
    db   $FD, $00, $28, $20, $04, $FE, $28, $60, $08, $08, $28, $20, $0E, $09, $28, $20
    db   $FC, $FF, $28, $00, $04, $FA, $28, $40, $08, $09, $28, $20, $0F, $0A, $28, $00
    db   $FB, $FE, $28, $00, $03, $F9, $28, $40, $08, $0C, $28, $00, $11, $0B, $28, $00
    db   $FA, $FD, $28, $00, $01, $F7, $28, $40, $09, $0D, $28, $00, $0F, $0C, $28, $00

Data_019_7BD0::
    db   $02, $FC, $28, $06, $FB, $04, $28, $66, $05, $06, $28, $06, $01, $0A, $28, $26
    db   $01, $FF, $28, $06, $F9, $04, $28, $66, $08, $06, $28, $06, $02, $07, $28, $26
    db   $00, $00, $28, $26, $F8, $02, $28, $66, $04, $04, $28, $26, $0A, $07, $28, $26
    db   $FE, $01, $28, $26, $04, $01, $28, $66, $04, $05, $28, $26, $0C, $07, $28, $26
    db   $FD, $00, $28, $26, $04, $FE, $28, $66, $08, $08, $28, $26, $0E, $09, $28, $26
    db   $FC, $FF, $28, $06, $04, $FA, $28, $46, $08, $09, $28, $26, $0F, $0A, $28, $06
    db   $FB, $FE, $28, $06, $03, $F9, $28, $46, $08, $0C, $28, $06, $11, $0B, $28, $06
    db   $FA, $FD, $28, $06, $01, $F7, $28, $46, $09, $0D, $28, $06, $0F, $0C, $28, $06

; Code used by the liftable rock.
func_019_7C50::
    ldh  a, [hActiveEntitySpriteVariant]          ; $7C50: $F0 $F1

.jr_7C52
    cp   $FF                                      ; $7C52: $FE $FF
    jr   z, jr_019_7C6D                           ; $7C54: $28 $17

.jr_7C56
    cp   $01                                      ; $7C56: $FE $01
    jr   z, jr_019_7C6D                           ; $7C58: $28 $13

    ldh  a, [hMultiPurpose0]                      ; $7C5A: $F0 $D7
    and  $0C                                      ; $7C5C: $E6 $0C

.jr_7C5E
    sla  a                                        ; $7C5E: $CB $27
    sla  a                                        ; $7C60: $CB $27
    ld   e, a                                     ; $7C62: $5F
    ld   d, b                                     ; $7C63: $50
    ld   hl, Data_019_7B10                        ; $7C64: $21 $10 $7B
    add  hl, de                                   ; $7C67: $19
    ld   c, $04                                   ; $7C68: $0E $04
    jp   RenderActiveEntitySpritesRect            ; $7C6A: $C3 $E6 $3C

jr_019_7C6D:
    inc  a                                        ; $7C6D: $3C
    jr   nz, .jr_7C8D                             ; $7C6E: $20 $1D

    ldh  [hActiveEntitySpriteVariant], a          ; $7C70: $E0 $F1
    ldh  a, [hFrameCounter]                       ; $7C72: $F0 $E7
    xor  c                                        ; $7C74: $A9
    rra                                           ; $7C75: $1F
    ret  c                                        ; $7C76: $D8

    ldh  a, [hIsGBC]                              ; $7C77: $F0 $FE
    and  a                                        ; $7C79: $A7
    jr   z, .jr_7C8D                              ; $7C7A: $28 $11

    ld   a, [wIsIndoor]                           ; $7C7C: $FA $A5 $DB
    and  a                                        ; $7C7F: $A7
    jr   nz, .jr_7C8D                             ; $7C80: $20 $0B

    ldh  a, [hMapRoom]                            ; $7C82: $F0 $F6
    cp   UNKNOWN_ROOM_32                          ; $7C84: $FE $32
    jr   nz, .jr_7C8D                             ; $7C86: $20 $05

    ld   hl, Data_019_7BD0                        ; $7C88: $21 $D0 $7B
    jr   jr_019_7C90                              ; $7C8B: $18 $03

.jr_7C8D
    ld   hl, Data_019_7B50                        ; $7C8D: $21 $50 $7B

jr_019_7C90:
    ldh  a, [hMultiPurpose0]                      ; $7C90: $F0 $D7
    and  $1C                                      ; $7C92: $E6 $1C
    xor  $1C                                      ; $7C94: $EE $1C
    sla  a                                        ; $7C96: $CB $27
    sla  a                                        ; $7C98: $CB $27
    ld   e, a                                     ; $7C9A: $5F
    ld   d, b                                     ; $7C9B: $50
    add  hl, de                                   ; $7C9C: $19
    ld   c, $04                                   ; $7C9D: $0E $04
    jp   RenderActiveEntitySpritesRect            ; $7C9F: $C3 $E6 $3C

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

PushLinkOutOfEntity_19::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7CA2: $CD $5A $3B
    jr   nc, jr_019_7CCE                          ; $7CA5: $30 $27

    call CopyLinkFinalPositionToPosition          ; $7CA7: $CD $BE $0C
    ld   a, [wC1A6]                               ; $7CAA: $FA $A6 $C1
    and  a                                        ; $7CAD: $A7
    jr   z, .jr_7CC1                              ; $7CAE: $28 $11

    ld   e, a                                     ; $7CB0: $5F
    ld   d, b                                     ; $7CB1: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7CB2: $21 $9F $C3
    add  hl, de                                   ; $7CB5: $19
    ld   a, [hl]                                  ; $7CB6: $7E
    cp   $03                                      ; $7CB7: $FE $03
    jr   nz, .jr_7CC1                             ; $7CB9: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $7CBB: $21 $8F $C2
    add  hl, de                                   ; $7CBE: $19
    ld   [hl], $00                                ; $7CBF: $36 $00

.jr_7CC1
    ld   a, [wIsRunningWithPegasusBoots]          ; $7CC1: $FA $4A $C1
    ld   e, a                                     ; $7CC4: $5F
    call ResetPegasusBoots                        ; $7CC5: $CD $B6 $0C
    call ClearLinkPositionIncrement               ; $7CC8: $CD $8E $17
    ld   a, e                                     ; $7CCB: $7B
    scf                                           ; $7CCC: $37
    ret                                           ; $7CCD: $C9

jr_019_7CCE:
    and  a                                        ; $7CCE: $A7
    ret                                           ; $7CCF: $C9

Data_019_7CD0::
    db   $06, $04, $02, $00

func_019_7CD4::
    ld   hl, wEntitiesDirectionTable              ; $7CD4: $21 $80 $C3
    add  hl, bc                                   ; $7CD7: $09
    ld   e, [hl]                                  ; $7CD8: $5E
    ld   d, b                                     ; $7CD9: $50
    ld   hl, Data_019_7CD0                        ; $7CDA: $21 $D0 $7C
    add  hl, de                                   ; $7CDD: $19
    push hl                                       ; $7CDE: $E5
    ld   hl, wEntitiesInertiaTable                ; $7CDF: $21 $D0 $C3
    add  hl, bc                                   ; $7CE2: $09
    inc  [hl]                                     ; $7CE3: $34
    ld   a, [hl]                                  ; $7CE4: $7E
    rra                                           ; $7CE5: $1F
    rra                                           ; $7CE6: $1F
    rra                                           ; $7CE7: $1F
    rra                                           ; $7CE8: $1F
    pop  hl                                       ; $7CE9: $E1
    and  $01                                      ; $7CEA: $E6 $01
    or   [hl]                                     ; $7CEC: $B6
    jp   SetEntitySpriteVariant                   ; $7CED: $C3 $0C $3B

func_019_7CF0::
    ld   e, b                                     ; $7CF0: $58
    ldh  a, [hLinkPositionY]                      ; $7CF1: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7CF3: $21 $EF $FF
    sub  [hl]                                     ; $7CF6: $96
    add  $14                                      ; $7CF7: $C6 $14
    cp   $28                                      ; $7CF9: $FE $28

func_019_7CFB::
    jr   nc, jr_019_7D3B                          ; $7CFB: $30 $3E

    ldh  a, [hLinkPositionX]                      ; $7CFD: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7CFF: $21 $EE $FF
    sub  [hl]                                     ; $7D02: $96
    add  $10                                      ; $7D03: $C6 $10
    cp   $20                                      ; $7D05: $FE $20
    jr   nc, jr_019_7D3B                          ; $7D07: $30 $32

    inc  e                                        ; $7D09: $1C
    push de                                       ; $7D0A: $D5
    call func_019_7E3A                            ; $7D0B: $CD $3A $7E
    ldh  a, [hLinkDirection]                      ; $7D0E: $F0 $9E
    xor  $01                                      ; $7D10: $EE $01
    cp   e                                        ; $7D12: $BB
    pop  de                                       ; $7D13: $D1
    jr   nz, jr_019_7D3B                          ; $7D14: $20 $25

func_019_7D16::
    ld   hl, wItemUsageContext                    ; $7D16: $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ; $7D19: $36 $01
    ld   a, [wDialogState]                        ; $7D1B: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D1E: $21 $4F $C1
    or   [hl]                                     ; $7D21: $B6
    ld   hl, wIsLinkInTheAir                      ; $7D22: $21 $46 $C1
    or   [hl]                                     ; $7D25: $B6
    ld   hl, wDialogCooldown                      ; $7D26: $21 $34 $C1
    or   [hl]                                     ; $7D29: $B6
    jr   nz, jr_019_7D3B                          ; $7D2A: $20 $0F

    ld   a, [wWindowY]                            ; $7D2C: $FA $9A $DB
    cp   $80                                      ; $7D2F: $FE $80
    jr   nz, jr_019_7D3B                          ; $7D31: $20 $08

    ldh  a, [hJoypadState]                        ; $7D33: $F0 $CC
    and  J_A                                      ; $7D35: $E6 $10
    jr   z, jr_019_7D3B                           ; $7D37: $28 $02

    scf                                           ; $7D39: $37
    ret                                           ; $7D3A: $C9

jr_019_7D3B:
    and  a                                        ; $7D3B: $A7
    ret                                           ; $7D3C: $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_19::
    ldh  a, [hActiveEntityStatus]                 ; $7D3D: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7D3F: $FE $05
    jr   nz, .skip                                ; $7D41: $20 $29

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7D43: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7D46: $FE $07
    jr   z, .skip                                 ; $7D48: $28 $22

    cp   GAMEPLAY_CREDITS                         ; $7D4A: $FE $01
    jr   z, .creditsEnd                           ; $7D4C: $28 $0B

    cp   GAMEPLAY_WORLD                           ; $7D4E: $FE $0B
    jr   nz, .skip                                ; $7D50: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7D52: $FA $6B $C1
    cp   $04                                      ; $7D55: $FE $04
    jr   nz, .skip                                ; $7D57: $20 $13
.creditsEnd

    ld   hl, wC1A8                                ; $7D59: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $7D5C: $FA $9F $C1
    or   [hl]                                     ; $7D5F: $B6
    ld   hl, wInventoryAppearing                  ; $7D60: $21 $4F $C1
    or   [hl]                                     ; $7D63: $B6
    jr   nz, .skip                                ; $7D64: $20 $06

    ld   a, [wRoomTransitionState]                ; $7D66: $FA $24 $C1
    and  a                                        ; $7D69: $A7
    jr   z, .return                               ; $7D6A: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7D6C: $F1

.return
    ret                                           ; $7D6D: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_19::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7D6E: $21 $10 $C4
    add  hl, bc                                   ; $7D71: $09
    ld   a, [hl]                                  ; $7D72: $7E
    and  a                                        ; $7D73: $A7
    jr   z, .return                               ; $7D74: $28 $41

    dec  a                                        ; $7D76: $3D
    ld   [hl], a                                  ; $7D77: $77

    call label_3E8E                               ; $7D78: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7D7B: $21 $40 $C2
    add  hl, bc                                   ; $7D7E: $09
    ld   a, [hl]                                  ; $7D7F: $7E
    push af                                       ; $7D80: $F5

    ld   hl, wEntitiesSpeedYTable                 ; $7D81: $21 $50 $C2
    add  hl, bc                                   ; $7D84: $09
    ld   a, [hl]                                  ; $7D85: $7E
    push af                                       ; $7D86: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7D87: $21 $F0 $C3
    add  hl, bc                                   ; $7D8A: $09
    ld   a, [hl]                                  ; $7D8B: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7D8C: $21 $40 $C2
    add  hl, bc                                   ; $7D8F: $09
    ld   [hl], a                                  ; $7D90: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7D91: $21 $00 $C4
    add  hl, bc                                   ; $7D94: $09
    ld   a, [hl]                                  ; $7D95: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7D96: $21 $50 $C2
    add  hl, bc                                   ; $7D99: $09
    ld   [hl], a                                  ; $7D9A: $77

    call UpdateEntityPosWithSpeed_19              ; $7D9B: $CD $B8 $7D

    ld   hl, wEntitiesOptions1Table               ; $7D9E: $21 $30 $C4
    add  hl, bc                                   ; $7DA1: $09
    ld   a, [hl]                                  ; $7DA2: $7E
    and  $20                                      ; $7DA3: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7DA5: $20 $03

    call label_3B23                               ; $7DA7: $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ; $7DAA: $21 $50 $C2
    add  hl, bc                                   ; $7DAD: $09
    pop  af                                       ; $7DAE: $F1
    ld   [hl], a                                  ; $7DAF: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7DB0: $21 $40 $C2
    add  hl, bc                                   ; $7DB3: $09
    pop  af                                       ; $7DB4: $F1
    ld   [hl], a                                  ; $7DB5: $77
    pop  af                                       ; $7DB6: $F1

.return
    ret                                           ; $7DB7: $C9

UpdateEntityPosWithSpeed_19::
    call AddEntitySpeedToPos_19                   ; $7DB8: $CD $C5 $7D

UpdateEntityYPosWithSpeed_19::
    push bc                                       ; $7DBB: $C5
    ld   a, c                                     ; $7DBC: $79
    add  $10                                      ; $7DBD: $C6 $10
    ld   c, a                                     ; $7DBF: $4F
    call AddEntitySpeedToPos_19                   ; $7DC0: $CD $C5 $7D
    pop  bc                                       ; $7DC3: $C1
    ret                                           ; $7DC4: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_19::
    ld   hl, wEntitiesSpeedXTable                 ; $7DC5: $21 $40 $C2
    add  hl, bc                                   ; $7DC8: $09
    ld   a, [hl]                                  ; $7DC9: $7E
    and  a                                        ; $7DCA: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7DCB: $28 $23

    push af                                       ; $7DCD: $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ; $7DCE: $CB $37
    and  $F0                                      ; $7DD0: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7DD2: $21 $60 $C2
    add  hl, bc                                   ; $7DD5: $09
    add  [hl]                                     ; $7DD6: $86
    ld   [hl], a                                  ; $7DD7: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7DD8: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7DDA: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7DDD: $09
    pop  af                                       ; $7DDE: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7DDF: $1E $00
    bit  7, a                                     ; $7DE1: $CB $7F
    jr   z, .positive                             ; $7DE3: $28 $02

    ld   e, $F0                                   ; $7DE5: $1E $F0

.positive
    swap a                                        ; $7DE7: $CB $37
    and  $0F                                      ; $7DE9: $E6 $0F
    or   e                                        ; $7DEB: $B3
    ; Get carry back from d
    rr   d                                        ; $7DEC: $CB $1A
    adc  [hl]                                     ; $7DEE: $8E
    ld   [hl], a                                  ; $7DEF: $77

.return
    ret                                           ; $7DF0: $C9

AddEntityZSpeedToPos_19::
    ld   hl, wEntitiesSpeedZTable                 ; $7DF1: $21 $20 $C3
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  a                                        ; $7DF6: $A7
    jr   z, AddEntitySpeedToPos_19.return         ; $7DF7: $28 $F7

    push af                                       ; $7DF9: $F5
    swap a                                        ; $7DFA: $CB $37
    and  $F0                                      ; $7DFC: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7DFE: $21 $30 $C3
    add  hl, bc                                   ; $7E01: $09
    add  [hl]                                     ; $7E02: $86
    ld   [hl], a                                  ; $7E03: $77
    rl   d                                        ; $7E04: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7E06: $21 $10 $C3
    jr   AddEntitySpeedToPos_19.updatePosition    ; $7E09: $18 $D2

; Get the difference between link's position and this entities position in X.
EntityLinkPositionXDifference_19::
    ld   e, $00                                   ; $7E0B: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E0D: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7E0F: $21 $00 $C2
    add  hl, bc                                   ; $7E12: $09
    sub  [hl]                                     ; $7E13: $96
    bit  7, a                                     ; $7E14: $CB $7F
    jr   z, .jr_7E19                              ; $7E16: $28 $01

    inc  e                                        ; $7E18: $1C

.jr_7E19
    ld   d, a                                     ; $7E19: $57
    ret                                           ; $7E1A: $C9

; Get the difference between link's position and this entities position in Y.
EntityLinkPositionYDifference_19::
    ld   e, $02                                   ; $7E1B: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E1D: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7E1F: $21 $10 $C2
    add  hl, bc                                   ; $7E22: $09
    sub  [hl]                                     ; $7E23: $96
    bit  7, a                                     ; $7E24: $CB $7F
    jr   nz, .jr_7E29                             ; $7E26: $20 $01

    inc  e                                        ; $7E28: $1C

.jr_7E29
    ld   d, a                                     ; $7E29: $57
    ret                                           ; $7E2A: $C9

    ld   e, $02                                   ; $7E2B: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E2D: $F0 $99
    ld   hl, hActiveEntityVisualPosY              ; $7E2F: $21 $EC $FF
    sub  [hl]                                     ; $7E32: $96
    bit  7, a                                     ; $7E33: $CB $7F
    jr   nz, .jr_7E38                             ; $7E35: $20 $01

    inc  e                                        ; $7E37: $1C

.jr_7E38
    ld   d, a                                     ; $7E38: $57
    ret                                           ; $7E39: $C9

func_019_7E3A::
    call EntityLinkPositionXDifference_19         ; $7E3A: $CD $0B $7E
    ld   a, e                                     ; $7E3D: $7B
    ldh  [hMultiPurpose0], a                      ; $7E3E: $E0 $D7
    ld   a, d                                     ; $7E40: $7A
    bit  7, a                                     ; $7E41: $CB $7F
    jr   z, .jr_7E47                              ; $7E43: $28 $02

    cpl                                           ; $7E45: $2F
    inc  a                                        ; $7E46: $3C

.jr_7E47
    push af                                       ; $7E47: $F5
    call EntityLinkPositionYDifference_19         ; $7E48: $CD $1B $7E
    ld   a, e                                     ; $7E4B: $7B
    ldh  [hMultiPurpose1], a                      ; $7E4C: $E0 $D8
    ld   a, d                                     ; $7E4E: $7A
    bit  7, a                                     ; $7E4F: $CB $7F
    jr   z, .jr_7E55                              ; $7E51: $28 $02

    cpl                                           ; $7E53: $2F
    inc  a                                        ; $7E54: $3C

.jr_7E55
    pop  de                                       ; $7E55: $D1
    cp   d                                        ; $7E56: $BA
    jr   nc, .jr_7E5D                             ; $7E57: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7E59: $F0 $D7
    jr   jr_019_7E5F                              ; $7E5B: $18 $02

.jr_7E5D
    ldh  a, [hMultiPurpose1]                      ; $7E5D: $F0 $D8

jr_019_7E5F:
    ld   e, a                                     ; $7E5F: $5F
    ret                                           ; $7E60: $C9

ClearEntityStatus_19::
    ld   hl, wEntitiesStatusTable                 ; $7E61: $21 $80 $C2
    add  hl, bc                                   ; $7E64: $09
    ld   [hl], b                                  ; $7E65: $70
    ret                                           ; $7E66: $C9

; Kill boss or mini-boss with explosions animation (unused in this bank)
AnimateBossAgony_19::
    ld   hl, wEntitiesPrivateState2Table          ; $7E67: $21 $C0 $C2
    add  hl, bc                                   ; $7E6A: $09
    ld   a, [hl]                                  ; $7E6B: $7E
    JP_TABLE                                      ; $7E6C
._00 dw AnimateBossAgonyInit_19                             ; $7E6D
._01 dw AnimateBossAgonyFlashing_19                             ; $7E6F
._02 dw AnimateBossAgonyExploding_19                             ; $7E71

AnimateBossAgonyInit_19::
    call GetEntityTransitionCountdown             ; $7E73: $CD $05 $0C
    ld   [hl], $A0                                ; $7E76: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7E78: $21 $20 $C4
    add  hl, bc                                   ; $7E7B: $09
    ld   [hl], $FF                                ; $7E7C: $36 $FF

IncrementEntityPrivateState2_19:
    ld   hl, wEntitiesPrivateState2Table          ; $7E7E: $21 $C0 $C2
    add  hl, bc                                   ; $7E81: $09
    inc  [hl]                                     ; $7E82: $34
    ret                                           ; $7E83: $C9

AnimateBossAgonyFlashing_19::
    call GetEntityTransitionCountdown             ; $7E84: $CD $05 $0C
    ret  nz                                       ; $7E87: $C0

    ld   [hl], $C0                                ; $7E88: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7E8A: $21 $20 $C4
    add  hl, bc                                   ; $7E8D: $09
    ld   [hl], $FF                                ; $7E8E: $36 $FF
    jp   IncrementEntityPrivateState2_19          ; $7E90: $C3 $7E $7E

AnimateBossAgonyExploding_19::
    ; When the explosions end, make the boss die
    call GetEntityTransitionCountdown             ; $7E93: $CD $05 $0C
    jr   nz, .notDeadYet                          ; $7E96: $20 $09
    call PlayBombExplosionSfx                     ; $7E98: $CD $4B $0C
    call label_27DD                               ; $7E9B: $CD $DD $27
    jp   DidKillEnemy                             ; $7E9E: $C3 $50 $3F

.notDeadYet
    jp   .animateExplosions                       ; $7EA1: $C3 $A4 $7E

.animateExplosions
    and  $07                                      ; $7EA4: $E6 $07
    ret  nz                                       ; $7EA6: $C0

    call GetRandomByte                            ; $7EA7: $CD $0D $28
    and  $1F                                      ; $7EAA: $E6 $1F
    sub  $10                                      ; $7EAC: $D6 $10
    ld   e, a                                     ; $7EAE: $5F
    ld   hl, hActiveEntityPosX                    ; $7EAF: $21 $EE $FF
    add  [hl]                                     ; $7EB2: $86
    ld   [hl], a                                  ; $7EB3: $77
    call GetRandomByte                            ; $7EB4: $CD $0D $28
    and  $1F                                      ; $7EB7: $E6 $1F
    sub  $14                                      ; $7EB9: $D6 $14
    ld   e, a                                     ; $7EBB: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7EBC: $21 $EC $FF
    add  [hl]                                     ; $7EBF: $86
    ld   [hl], a                                  ; $7EC0: $77
    jp   label_019_7EC4                           ; $7EC1: $C3 $C4 $7E

label_019_7EC4:
    call ReturnIfNonInteractive_19.allowInactiveEntity ; $7EC4: $CD $43 $7D
    ldh  a, [hActiveEntityPosX]                   ; $7EC7: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7EC9: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7ECB: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7ECD: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7ECF: $3E $02
    call AddTranscientVfx                         ; $7ED1: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $7ED4: $3E $13
    ldh  [hNoiseSfx], a                           ; $7ED6: $E0 $F4
    ret                                           ; $7ED8: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7ED9: $3E $36
    call SpawnNewEntity_trampoline                ; $7EDB: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7EDE: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7EE0: $21 $00 $C2
    add  hl, de                                   ; $7EE3: $19
    ld   [hl], a                                  ; $7EE4: $77
    ldh  a, [hMultiPurpose1]                      ; $7EE5: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7EE7: $21 $10 $C2
    add  hl, de                                   ; $7EEA: $19
    ld   [hl], a                                  ; $7EEB: $77
    ldh  a, [hIsSideScrolling]                    ; $7EEC: $F0 $F9
    and  a                                        ; $7EEE: $A7
    jr   z, .jr_7EF9                              ; $7EEF: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7EF1: $21 $50 $C2
    add  hl, bc                                   ; $7EF4: $09
    ld   [hl], $F0                                ; $7EF5: $36 $F0
    jr   jr_019_7F05                              ; $7EF7: $18 $0C

.jr_7EF9
    ld   hl, wEntitiesSpeedZTable                 ; $7EF9: $21 $20 $C3
    add  hl, de                                   ; $7EFC: $19
    ld   [hl], $10                                ; $7EFD: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7EFF: $21 $10 $C3
    add  hl, de                                   ; $7F02: $19
    ld   [hl], $08                                ; $7F03: $36 $08

jr_019_7F05:
    call ClearEntityStatus_19                     ; $7F05: $CD $61 $7E
    ld   hl, hNoiseSfx                            ; $7F08: $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ; $7F0B: $36 $1A
    ret                                           ; $7F0D: $C9

func_019_7F0E::
    ld   hl, wOverworldRoomStatus                 ; $7F0E: $21 $00 $D8
    ldh  a, [hMapRoom]                            ; $7F11: $F0 $F6
    ld   e, a                                     ; $7F13: $5F
    ld   a, [wIsIndoor]                           ; $7F14: $FA $A5 $DB
    ld   d, a                                     ; $7F17: $57

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ; $7F18: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $7F1A: $FE $1A
    jr   nc, .indoorsBEnd                         ; $7F1C: $30 $05
    cp   MAP_INDOORS_B_START                      ; $7F1E: $FE $06
    jr   c, .indoorsBEnd                          ; $7F20: $38 $01
    inc  d                                        ; $7F22: $14
.indoorsBEnd

    add  hl, de                                   ; $7F23: $19
    ld   a, [hl]                                  ; $7F24: $7E
    or   ROOM_STATUS_EVENT_2                      ; $7F25: $F6 $20
    ld   [hl], a                                  ; $7F27: $77
    ldh  [hRoomStatus], a                         ; $7F28: $E0 $F8
    ret                                           ; $7F2A: $C9
