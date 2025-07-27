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
    ld   a, $01                                   ;; 19:5D6A $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 19:5D6C $E0 $A1
    ld   [wC167], a                               ;; 19:5D6E $EA $67 $C1
    call ClearLinkPositionIncrement               ;; 19:5D71 $CD $8E $17
    ldh  a, [hLinkPhysicsModifier]                ;; 19:5D74 $F0 $9C
    JP_TABLE                                      ;; 19:5D76
._00 dw func_019_5D7D                             ;; 19:5D77
._01 dw func_019_5D8F                             ;; 19:5D79
._02 dw func_019_5DAC                             ;; 19:5D7B

func_019_5D7D::
    ; Wait until the warp countdown reaches 0…
    ldh  a, [hLinkCountdown]                      ;; 19:5D7D $F0 $B7
    and  a                                        ;; 19:5D7F $A7
    jr   nz, .return                              ;; 19:5D80 $20 $08

    ; … then teleport Link
    ld   a, $01                                   ;; 19:5D82 $3E $01
    ldh  [hLinkPhysicsModifier], a                ;; 19:5D84 $E0 $9C
    ld   a, JINGLE_OVERWORLD_WARP_HOLE            ;; 19:5D86 $3E $25
    ldh  [hJingle], a                             ;; 19:5D88 $E0 $F2

.return
    ret                                           ;; 19:5D8A $C9

Data_019_5D8B::
    db   $00, $03, $01, $02

func_019_5D8F::
    ldh  a, [hLinkCountdown]                      ;; 19:5D8F $F0 $B7
    and  a                                        ;; 19:5D91 $A7
    jr   nz, func_019_5D99                        ;; 19:5D92 $20 $05

    ld   a, $02                                   ;; 19:5D94 $3E $02
    ldh  [hLinkPhysicsModifier], a                ;; 19:5D96 $E0 $9C
    ret                                           ;; 19:5D98 $C9

func_019_5D99::
    ldh  a, [hFrameCounter]                       ;; 19:5D99 $F0 $E7
    rra                                           ;; 19:5D9B $1F
    rra                                           ;; 19:5D9C $1F
    and  $03                                      ;; 19:5D9D $E6 $03
    ld   e, a                                     ;; 19:5D9F $5F
    ld   d, $00                                   ;; 19:5DA0 $16 $00
    ld   hl, Data_019_5D8B                        ;; 19:5DA2 $21 $8B $5D
    add  hl, de                                   ;; 19:5DA5 $19
    ld   a, [hl]                                  ;; 19:5DA6 $7E
    ldh  [hLinkDirection], a                      ;; 19:5DA7 $E0 $9E
    jp   UpdateLinkWalkingAnimation_trampoline    ;; 19:5DA9 $C3 $F0 $0B

func_019_5DAC::
    call func_019_5D99                            ;; 19:5DAC $CD $99 $5D
    ldh  a, [hLinkPositionZ]                      ;; 19:5DAF $F0 $A2
    add  $04                                      ;; 19:5DB1 $C6 $04
    ldh  [hLinkPositionZ], a                      ;; 19:5DB3 $E0 $A2
    cp   $78                                      ;; 19:5DB5 $FE $78
    jr   c, ret_019_5DF7                          ;; 19:5DB7 $38 $3E

    ld   [wMapEntrancePositionZ], a               ;; 19:5DB9 $EA $C8 $DB
    ldh  a, [hMapRoom]                            ;; 19:5DBC $F0 $F6
    ld   e, a                                     ;; 19:5DBE $5F
    ld   d, $00                                   ;; 19:5DBF $16 $00

    ; Find the next discovered warp on the overworld map
.loop
    ld   hl, WarpLocationsTable                   ;; 19:5DC1 $21 $6A $5C
    add  hl, de                                   ;; 19:5DC4 $19
    ld   e, [hl]                                  ;; 19:5DC5 $5E
    ld   hl, wOverworldRoomStatus                 ;; 19:5DC6 $21 $00 $D8
    add  hl, de                                   ;; 19:5DC9 $19
    ld   a, [hl]                                  ;; 19:5DCA $7E
    and  OW_ROOM_STATUS_VISITED                   ;; 19:5DCB $E6 $80
    jr   z, .loop                                 ;; 19:5DCD $28 $F2

    ; Warp Link
    ld   a, e                                     ;; 19:5DCF $7B
    ld   [wWarp0Room], a                          ;; 19:5DD0 $EA $03 $D4
    xor  a                                        ;; 19:5DD3 $AF
    ld   [wWarpStructs], a                        ;; 19:5DD4 $EA $01 $D4
    ld   [wWarp0Map], a                           ;; 19:5DD7 $EA $02 $D4
    ld   a, $70                                   ;; 19:5DDA $3E $70
    ld   [wWarp0DestinationY], a                  ;; 19:5DDC $EA $05 $D4
    ldh  [hLinkPositionY], a                      ;; 19:5DDF $E0 $99
    ld   a, $68                                   ;; 19:5DE1 $3E $68
    ld   [wWarp0DestinationX], a                  ;; 19:5DE3 $EA $04 $D4
    ldh  [hLinkPositionX], a                      ;; 19:5DE6 $E0 $98
    ld   [wD475], a                               ;; 19:5DE8 $EA $75 $D4
    ld   a, $66                                   ;; 19:5DEB $3E $66
    ld   [wWarp0PositionTileIndex], a             ;; 19:5DED $EA $16 $D4
    call ApplyMapFadeOutTransition                ;; 19:5DF0 $CD $83 $0C
    xor  a                                        ;; 19:5DF3 $AF
    ld   [wC167], a                               ;; 19:5DF4 $EA $67 $C1

ret_019_5DF7:
    ret                                           ;; 19:5DF7 $C9

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
    ld   a, [wRoomTransitionState]                ;; 19:7964 $FA $24 $C1
    cp   $04                                      ;; 19:7967 $FE $04
    jr   nc, .jr_796C                             ;; 19:7969 $30 $01

    ret                                           ;; 19:796B $C9

.jr_796C
    ld   a, [wRoomTransitionDirection]            ;; 19:796C $FA $25 $C1
    ld   e, a                                     ;; 19:796F $5F
    ld   d, $00                                   ;; 19:7970 $16 $00
    ld   hl, Data_019_794E                        ;; 19:7972 $21 $4E $79
    add  hl, de                                   ;; 19:7975 $19
    ld   a, [hl]                                  ;; 19:7976 $7E
    ldh  [hMultiPurpose0], a                      ;; 19:7977 $E0 $D7
    ld   hl, Data_019_7952                        ;; 19:7979 $21 $52 $79
    add  hl, de                                   ;; 19:797C $19
    ld   a, [hl]                                  ;; 19:797D $7E
    ldh  [hMultiPurpose1], a                      ;; 19:797E $E0 $D8
    ld   hl, Data_019_7956                        ;; 19:7980 $21 $56 $79
    add  hl, de                                   ;; 19:7983 $19
    ld   a, [hl]                                  ;; 19:7984 $7E

.jr_7985
    ldh  [hMultiPurpose2], a                      ;; 19:7985 $E0 $D9
    ld   hl, Data_019_795A                        ;; 19:7987 $21 $5A $79
    add  hl, de                                   ;; 19:798A $19
    ld   a, [hl]                                  ;; 19:798B $7E
    ldh  [hMultiPurpose3], a                      ;; 19:798C $E0 $DA
    ld   hl, wEntitiesPosXTable                   ;; 19:798E $21 $00 $C2
    add  hl, bc                                   ;; 19:7991 $09
    ldh  a, [hMultiPurpose0]                      ;; 19:7992 $F0 $D7
    add  [hl]                                     ;; 19:7994 $86
    rl   d                                        ;; 19:7995 $CB $12
    ld   [hl], a                                  ;; 19:7997 $77
    ld   hl, wEntitiesPosXSignTable               ;; 19:7998 $21 $20 $C2
    add  hl, bc                                   ;; 19:799B $09
    ldh  a, [hMultiPurpose1]                      ;; 19:799C $F0 $D8
    rr   d                                        ;; 19:799E $CB $1A
    adc  [hl]                                     ;; 19:79A0 $8E
    ld   [hl], a                                  ;; 19:79A1 $77
    ld   hl, wEntitiesPosYTable                   ;; 19:79A2 $21 $10 $C2
    add  hl, bc                                   ;; 19:79A5 $09
    ldh  a, [hMultiPurpose2]                      ;; 19:79A6 $F0 $D9
    add  [hl]                                     ;; 19:79A8 $86
    rl   d                                        ;; 19:79A9 $CB $12
    ld   [hl], a                                  ;; 19:79AB $77
    ld   hl, wEntitiesPosYSignTable               ;; 19:79AC $21 $30 $C2
    add  hl, bc                                   ;; 19:79AF $09
    ldh  a, [hMultiPurpose3]                      ;; 19:79B0 $F0 $DA
    rr   d                                        ;; 19:79B2 $CB $1A
    adc  [hl]                                     ;; 19:79B4 $8E
    ld   [hl], a                                  ;; 19:79B5 $77

    ldh  a, [hActiveEntityType]                   ;; 19:79B6 $F0 $EB
    cp   ENTITY_TURTLE_ROCK_HEAD                  ;; 19:79B8 $FE $7F
    jr   nz, .turtleRockHeadEnd                   ;; 19:79BA $20 $13

    ld   hl, wEntitiesPrivateState4Table          ;; 19:79BC $21 $40 $C4
    add  hl, bc                                   ;; 19:79BF $09
    ldh  a, [hMultiPurpose0]                      ;; 19:79C0 $F0 $D7
    add  [hl]                                     ;; 19:79C2 $86
    ld   [hl], a                                  ;; 19:79C3 $77
    ld   hl, wEntitiesPrivateState3Table          ;; 19:79C4 $21 $D0 $C2
    add  hl, bc                                   ;; 19:79C7 $09
    ldh  a, [hMultiPurpose2]                      ;; 19:79C8 $F0 $D9
    add  [hl]                                     ;; 19:79CA $86
    ld   [hl], a                                  ;; 19:79CB $77
    jp   label_019_7A74                           ;; 19:79CC $C3 $74 $7A
.turtleRockHeadEnd

    cp   ENTITY_DESERT_LANMOLA                    ;; 19:79CF $FE $87
    jr   nz, .desertLanmolaEnd                    ;; 19:79D1 $20 $3C

    ld   hl, wEntitiesPrivateState3Table          ;; 19:79D3 $21 $D0 $C2
    add  hl, bc                                   ;; 19:79D6 $09
    ld   a, [hl]                                  ;; 19:79D7 $7E
    cp   $02                                      ;; 19:79D8 $FE $02
    jp   z, label_019_7A74                        ;; 19:79DA $CA $74 $7A

    ld   hl, wEntitiesInertiaTable                ;; 19:79DD $21 $D0 $C3
    add  hl, bc                                   ;; 19:79E0 $09
    ld   a, [hl]                                  ;; 19:79E1 $7E
    ldh  [hFreeWarpDataAddress], a                ;; 19:79E2 $E0 $E6

    ld   a, $06                                   ;; 19:79E4 $3E $06
.loop_019_79E6
    ldh  [hMultiPurposeG], a                      ;; 19:79E6 $E0 $E8
    ld   e, a                                     ;; 19:79E8 $5F
    ld   d, b                                     ;; 19:79E9 $50
    ld   hl, Data_019_795D                        ;; 19:79EA $21 $5D $79
    add  hl, de                                   ;; 19:79ED $19
    push hl                                       ;; 19:79EE $E5
    ldh  a, [hFreeWarpDataAddress]                ;; 19:79EF $F0 $E6
    sub  [hl]                                     ;; 19:79F1 $96
    ld   e, a                                     ;; 19:79F2 $5F
    ld   d, b                                     ;; 19:79F3 $50
    ld   hl, wIsFileSelectionArrowShifted         ;; 19:79F4 $21 $00 $D0
    add  hl, de                                   ;; 19:79F7 $19
    ldh  a, [hMultiPurpose0]                      ;; 19:79F8 $F0 $D7
    add  [hl]                                     ;; 19:79FA $86
    ld   [hl], a                                  ;; 19:79FB $77
    ldh  a, [hFreeWarpDataAddress]                ;; 19:79FC $F0 $E6
    pop  hl                                       ;; 19:79FE $E1
    sub  [hl]                                     ;; 19:79FF $96
    ld   e, a                                     ;; 19:7A00 $5F
    ld   d, b                                     ;; 19:7A01 $50
    ld   hl, wD100                                ;; 19:7A02 $21 $00 $D1
    add  hl, de                                   ;; 19:7A05 $19
    ldh  a, [hMultiPurpose2]                      ;; 19:7A06 $F0 $D9
    add  [hl]                                     ;; 19:7A08 $86
    ld   [hl], a                                  ;; 19:7A09 $77
    ldh  a, [hMultiPurposeG]                      ;; 19:7A0A $F0 $E8
    dec  a                                        ;; 19:7A0C $3D
    jr   nz, .loop_019_79E6                       ;; 19:7A0D $20 $D7
.desertLanmolaEnd

    cp   ENTITY_MARIN_AT_THE_SHORE                ;; 19:7A0F $FE $C1
    jr   nz, .marinAtTheShoreEnd                  ;; 19:7A11 $20 $20

    ld   a, [wIsMarinFollowingLink]               ;; 19:7A13 $FA $73 $DB
    and  a                                        ;; 19:7A16 $A7
    jr   z, label_019_7A74                        ;; 19:7A17 $28 $5B

    ; increment $10 bytes at wLinkPositionXHistory by hMultiPurpose0
    ld   e, $10                                   ;; 19:7A19 $1E $10
    ld   hl, wLinkPositionXHistory                ;; 19:7A1B $21 $55 $D1
.loop_019_7A1E
    ldh  a, [hMultiPurpose0]                      ;; 19:7A1E $F0 $D7
    add  [hl]                                     ;; 19:7A20 $86
    ld   [hl+], a                                 ;; 19:7A21 $22
    dec  e                                        ;; 19:7A22 $1D
    jr   nz, .loop_019_7A1E                       ;; 19:7A23 $20 $F9

    ; increment $10 bytes at wLinkPositionYHistory by hMultiPurpose2
    ld   e, $10                                   ;; 19:7A25 $1E $10
    ld   hl, wLinkPositionYHistory                ;; 19:7A27 $21 $75 $D1
.loop_019_7A2A
    ldh  a, [hMultiPurpose2]                      ;; 19:7A2A $F0 $D9
    add  [hl]                                     ;; 19:7A2C $86
    ld   [hl+], a                                 ;; 19:7A2D $22
    dec  e                                        ;; 19:7A2E $1D
    jr   nz, .loop_019_7A2A                       ;; 19:7A2F $20 $F9

    jr   label_019_7A74                           ;; 19:7A31 $18 $41
.marinAtTheShoreEnd

    cp   ENTITY_MOVING_BLOCK_MOVER                ;; 19:7A33 $FE $69
    jr   z, .jr_019_7A64                          ;; 19:7A35 $28 $2D

    cp   ENTITY_PINCER                            ;; 19:7A37 $FE $B0
    jr   z, .jr_019_7A64                          ;; 19:7A39 $28 $29

    cp   ENTITY_BOW_WOW                           ;; 19:7A3B $FE $6D
    jr   nz, label_019_7A74                       ;; 19:7A3D $20 $35

    ld   a, [wIsBowWowFollowingLink]              ;; 19:7A3F $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 19:7A42 $FE $01
    jr   nz, .jr_019_7A4C                         ;; 19:7A44 $20 $06

    ldh  a, [hFrameCounter]                       ;; 19:7A46 $F0 $E7
    and  $07                                      ;; 19:7A48 $E6 $07
    jr   z, label_019_7A74                        ;; 19:7A4A $28 $28

.jr_019_7A4C
    ; increment $6 bytes at wD100 by hMultiPurpose0
    ld   e, $06                                   ;; 19:7A4C $1E $06
    ld   hl, wD100                                ;; 19:7A4E $21 $00 $D1
.loop_019_7A51
    ldh  a, [hMultiPurpose0]                      ;; 19:7A51 $F0 $D7
    add  [hl]                                     ;; 19:7A53 $86
    ld   [hl+], a                                 ;; 19:7A54 $22
    dec  e                                        ;; 19:7A55 $1D
    jr   nz, .loop_019_7A51                       ;; 19:7A56 $20 $F9

    ; increment $6 bytes at wD110 by hMultiPurpose2
    ld   e, $06                                   ;; 19:7A58 $1E $06
    ld   hl, wD110                                ;; 19:7A5A $21 $10 $D1
.loop_019_7A5D
    ldh  a, [hMultiPurpose2]                      ;; 19:7A5D $F0 $D9
    add  [hl]                                     ;; 19:7A5F $86
    ld   [hl+], a                                 ;; 19:7A60 $22
    dec  e                                        ;; 19:7A61 $1D
    jr   nz, .loop_019_7A5D                       ;; 19:7A62 $20 $F9

.jr_019_7A64
    ld   hl, wEntitiesPrivateState1Table          ;; 19:7A64 $21 $B0 $C2
    add  hl, bc                                   ;; 19:7A67 $09
    ldh  a, [hMultiPurpose0]                      ;; 19:7A68 $F0 $D7
    add  [hl]                                     ;; 19:7A6A $86
    ld   [hl], a                                  ;; 19:7A6B $77
    ld   hl, wEntitiesPrivateState2Table          ;; 19:7A6C $21 $C0 $C2
    add  hl, bc                                   ;; 19:7A6F $09
    ldh  a, [hMultiPurpose2]                      ;; 19:7A70 $F0 $D9
    add  [hl]                                     ;; 19:7A72 $86
    ld   [hl], a                                  ;; 19:7A73 $77

label_019_7A74:
    ldh  a, [hMapRoom]                            ;; 19:7A74 $F0 $F6
    ld   hl, wEntitiesRoomTable                   ;; 19:7A76 $21 $E0 $C3
    add  hl, bc                                   ;; 19:7A79 $09
    cp   [hl]                                     ;; 19:7A7A $BE
    ret  z                                        ;; 19:7A7B $C8

    ld   hl, wEntitiesPosXTable                   ;; 19:7A7C $21 $00 $C2
    add  hl, bc                                   ;; 19:7A7F $09
    ld   a, [hl]                                  ;; 19:7A80 $7E
    cp   $A0                                      ;; 19:7A81 $FE $A0
    jr   nc, .jr_7A8F                             ;; 19:7A83 $30 $0A

    ld   hl, wEntitiesPosYTable                   ;; 19:7A85 $21 $10 $C2
    add  hl, bc                                   ;; 19:7A88 $09
    ld   a, [hl]                                  ;; 19:7A89 $7E
    sub  $10                                      ;; 19:7A8A $D6 $10
    cp   $78                                      ;; 19:7A8C $FE $78
    ret  c                                        ;; 19:7A8E $D8

.jr_7A8F
    ldh  a, [hActiveEntityType]                   ;; 19:7A8F $F0 $EB
    cp   ENTITY_SMASHABLE_PILLAR                  ;; 19:7A91 $FE $A7
    ret  z                                        ;; 19:7A93 $C8

    ld   hl, wEntitiesStatusTable                 ;; 19:7A94 $21 $80 $C2
    add  hl, bc                                   ;; 19:7A97 $09
    ld   [hl], b                                  ;; 19:7A98 $70
    ret                                           ;; 19:7A99 $C9

func_019_7A9A::
    ld   a, [wConveyorBeltsCount]                 ;; 19:7A9A $FA $A5 $C1
    and  a                                        ;; 19:7A9D $A7
    ret  z                                        ;; 19:7A9E $C8

    ld   a, [wDialogState]                        ;; 19:7A9F $FA $9F $C1
    and  a                                        ;; 19:7AA2 $A7
    ret  nz                                       ;; 19:7AA3 $C0

    ldh  a, [hFrameCounter]                       ;; 19:7AA4 $F0 $E7
    and  $03                                      ;; 19:7AA6 $E6 $03
    sla  a                                        ;; 19:7AA8 $CB $27
    add  LOW(Data_019_7AB6)                       ;; 19:7AAA $C6 $B6
    ld   l, a                                     ;; 19:7AAC $6F
    ld   a, HIGH(Data_019_7AB6)                   ;; 19:7AAD $3E $7A
    adc  $00                                      ;; 19:7AAF $CE $00
    ld   h, a                                     ;; 19:7AB1 $67
    ld   a, [hl+]                                 ;; 19:7AB2 $2A
    ld   h, [hl]                                  ;; 19:7AB3 $66
    ld   l, a                                     ;; 19:7AB4 $6F
    jp   hl                                       ;; 19:7AB5 $E9

Data_019_7AB6:
._00 dw func_019_7ABE
._01 dw func_019_7ADB
._02 dw func_019_7AF8
._03 dw func_019_7B04

func_019_7ABE:
    ld   hl, wAnimatedScrollingTilesStorage + 15  ;; 19:7ABE $21 $CF $DC
    ld   de, wAnimatedScrollingTilesStorage + 15  ;; 19:7AC1 $11 $CF $DC
    ld   a, [hl-]                                 ;; 19:7AC4 $3A
    push af                                       ;; 19:7AC5 $F5
    ld   a, [hl-]                                 ;; 19:7AC6 $3A
    push af                                       ;; 19:7AC7 $F5
    ld   c, $07                                   ;; 19:7AC8 $0E $07

.loop_7ACA
    ld   a, [hl-]                                 ;; 19:7ACA $3A
    ld   [de], a                                  ;; 19:7ACB $12
    dec  de                                       ;; 19:7ACC $1B
    ld   a, [hl-]                                 ;; 19:7ACD $3A
    ld   [de], a                                  ;; 19:7ACE $12
    dec  de                                       ;; 19:7ACF $1B
    dec  c                                        ;; 19:7AD0 $0D
    jr   nz, .loop_7ACA                           ;; 19:7AD1 $20 $F7

    pop  hl                                       ;; 19:7AD3 $E1
    pop  bc                                       ;; 19:7AD4 $C1
    ld   a, b                                     ;; 19:7AD5 $78
    ld   [de], a                                  ;; 19:7AD6 $12
    dec  de                                       ;; 19:7AD7 $1B
    ld   a, h                                     ;; 19:7AD8 $7C
    ld   [de], a                                  ;; 19:7AD9 $12
    ret                                           ;; 19:7ADA $C9

func_019_7ADB:
    ld   hl, wAnimatedScrollingTilesStorage.tile1 ;; 19:7ADB $21 $D0 $DC
    ld   de, wAnimatedScrollingTilesStorage.tile1 ;; 19:7ADE $11 $D0 $DC
    ld   a, [hl+]                                 ;; 19:7AE1 $2A
    push af                                       ;; 19:7AE2 $F5
    ld   a, [hl+]                                 ;; 19:7AE3 $2A
    push af                                       ;; 19:7AE4 $F5
    ld   c, $07                                   ;; 19:7AE5 $0E $07

.loop_7AE7
    ld   a, [hl+]                                 ;; 19:7AE7 $2A
    ld   [de], a                                  ;; 19:7AE8 $12
    inc  de                                       ;; 19:7AE9 $13
    ld   a, [hl+]                                 ;; 19:7AEA $2A
    ld   [de], a                                  ;; 19:7AEB $12
    inc  de                                       ;; 19:7AEC $13
    dec  c                                        ;; 19:7AED $0D
    jr   nz, .loop_7AE7                           ;; 19:7AEE $20 $F7

    pop  hl                                       ;; 19:7AF0 $E1
    pop  bc                                       ;; 19:7AF1 $C1
    ld   a, b                                     ;; 19:7AF2 $78
    ld   [de], a                                  ;; 19:7AF3 $12
    inc  de                                       ;; 19:7AF4 $13
    ld   a, h                                     ;; 19:7AF5 $7C
    ld   [de], a                                  ;; 19:7AF6 $12
    ret                                           ;; 19:7AF7 $C9

func_019_7AF8:
    ld   hl, wAnimatedScrollingTilesStorage.tile2 ;; 19:7AF8 $21 $E0 $DC
    ld   e, $10                                   ;; 19:7AFB $1E $10

.loop_7AFD
    rlc  [hl]                                     ;; 19:7AFD $CB $06
    inc  hl                                       ;; 19:7AFF $23
    dec  e                                        ;; 19:7B00 $1D
    jr   nz, .loop_7AFD                           ;; 19:7B01 $20 $FA

    ret                                           ;; 19:7B03 $C9

func_019_7B04:
    ld   hl, wAnimatedScrollingTilesStorage.tile3 ;; 19:7B04 $21 $F0 $DC
    ld   e, $10                                   ;; 19:7B07 $1E $10

.loop_7B09
    rrc  [hl]                                     ;; 19:7B09 $CB $0E
    inc  hl                                       ;; 19:7B0B $23
    dec  e                                        ;; 19:7B0C $1D
    jr   nz, .loop_7B09                           ;; 19:7B0D $20 $FA

    ret                                           ;; 19:7B0F $C9

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
    ldh  a, [hActiveEntitySpriteVariant]          ;; 19:7C50 $F0 $F1

.jr_7C52
    cp   $FF                                      ;; 19:7C52 $FE $FF
    jr   z, jr_019_7C6D                           ;; 19:7C54 $28 $17

.jr_7C56
    cp   $01                                      ;; 19:7C56 $FE $01
    jr   z, jr_019_7C6D                           ;; 19:7C58 $28 $13

    ldh  a, [hMultiPurpose0]                      ;; 19:7C5A $F0 $D7
    and  $0C                                      ;; 19:7C5C $E6 $0C

.jr_7C5E
    sla  a                                        ;; 19:7C5E $CB $27
    sla  a                                        ;; 19:7C60 $CB $27
    ld   e, a                                     ;; 19:7C62 $5F
    ld   d, b                                     ;; 19:7C63 $50
    ld   hl, Data_019_7B10                        ;; 19:7C64 $21 $10 $7B
    add  hl, de                                   ;; 19:7C67 $19
    ld   c, $04                                   ;; 19:7C68 $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 19:7C6A $C3 $E6 $3C

jr_019_7C6D:
    inc  a                                        ;; 19:7C6D $3C
    jr   nz, .jr_7C8D                             ;; 19:7C6E $20 $1D

    ldh  [hActiveEntitySpriteVariant], a          ;; 19:7C70 $E0 $F1
    ldh  a, [hFrameCounter]                       ;; 19:7C72 $F0 $E7
    xor  c                                        ;; 19:7C74 $A9
    rra                                           ;; 19:7C75 $1F
    ret  c                                        ;; 19:7C76 $D8

    ldh  a, [hIsGBC]                              ;; 19:7C77 $F0 $FE
    and  a                                        ;; 19:7C79 $A7
    jr   z, .jr_7C8D                              ;; 19:7C7A $28 $11

    ld   a, [wIsIndoor]                           ;; 19:7C7C $FA $A5 $DB
    and  a                                        ;; 19:7C7F $A7
    jr   nz, .jr_7C8D                             ;; 19:7C80 $20 $0B

    ldh  a, [hMapRoom]                            ;; 19:7C82 $F0 $F6
    cp   UNKNOWN_ROOM_32                          ;; 19:7C84 $FE $32
    jr   nz, .jr_7C8D                             ;; 19:7C86 $20 $05

    ld   hl, Data_019_7BD0                        ;; 19:7C88 $21 $D0 $7B
    jr   jr_019_7C90                              ;; 19:7C8B $18 $03

.jr_7C8D
    ld   hl, Data_019_7B50                        ;; 19:7C8D $21 $50 $7B

jr_019_7C90:
    ldh  a, [hMultiPurpose0]                      ;; 19:7C90 $F0 $D7
    and  $1C                                      ;; 19:7C92 $E6 $1C
    xor  $1C                                      ;; 19:7C94 $EE $1C
    sla  a                                        ;; 19:7C96 $CB $27
    sla  a                                        ;; 19:7C98 $CB $27
    ld   e, a                                     ;; 19:7C9A $5F
    ld   d, b                                     ;; 19:7C9B $50
    add  hl, de                                   ;; 19:7C9C $19
    ld   c, $04                                   ;; 19:7C9D $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 19:7C9F $C3 $E6 $3C

; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

PushLinkOutOfEntity_19::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 19:7CA2 $CD $5A $3B
    jr   nc, jr_019_7CCE                          ;; 19:7CA5 $30 $27

    call CopyLinkFinalPositionToPosition          ;; 19:7CA7 $CD $BE $0C
    ld   a, [wC1A6]                               ;; 19:7CAA $FA $A6 $C1
    and  a                                        ;; 19:7CAD $A7
    jr   z, .jr_7CC1                              ;; 19:7CAE $28 $11

    ld   e, a                                     ;; 19:7CB0 $5F
    ld   d, b                                     ;; 19:7CB1 $50
    ld   hl, wEntitiesPrivateState5Table+15       ;; 19:7CB2 $21 $9F $C3
    add  hl, de                                   ;; 19:7CB5 $19
    ld   a, [hl]                                  ;; 19:7CB6 $7E
    cp   $03                                      ;; 19:7CB7 $FE $03
    jr   nz, .jr_7CC1                             ;; 19:7CB9 $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ;; 19:7CBB $21 $8F $C2
    add  hl, de                                   ;; 19:7CBE $19
    ld   [hl], $00                                ;; 19:7CBF $36 $00

.jr_7CC1
    ld   a, [wIsRunningWithPegasusBoots]          ;; 19:7CC1 $FA $4A $C1
    ld   e, a                                     ;; 19:7CC4 $5F
    call ResetPegasusBoots                        ;; 19:7CC5 $CD $B6 $0C
    call ClearLinkPositionIncrement               ;; 19:7CC8 $CD $8E $17
    ld   a, e                                     ;; 19:7CCB $7B
    scf                                           ;; 19:7CCC $37
    ret                                           ;; 19:7CCD $C9

jr_019_7CCE:
    and  a                                        ;; 19:7CCE $A7
    ret                                           ;; 19:7CCF $C9

EntityVariantForDirection_19::
.right db 6
.left  db 4
.up    db 2
.down  db 0

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_19::
    ld   hl, wEntitiesDirectionTable              ;; 19:7CD4 $21 $80 $C3
    add  hl, bc                                   ;; 19:7CD7 $09
    ld   e, [hl]                                  ;; 19:7CD8 $5E
    ld   d, b                                     ;; 19:7CD9 $50
    ld   hl, EntityVariantForDirection_19         ;; 19:7CDA $21 $D0 $7C
    add  hl, de                                   ;; 19:7CDD $19
    push hl                                       ;; 19:7CDE $E5
    ld   hl, wEntitiesInertiaTable                ;; 19:7CDF $21 $D0 $C3
    add  hl, bc                                   ;; 19:7CE2 $09
    inc  [hl]                                     ;; 19:7CE3 $34
    ld   a, [hl]                                  ;; 19:7CE4 $7E
    rra                                           ;; 19:7CE5 $1F
    rra                                           ;; 19:7CE6 $1F
    rra                                           ;; 19:7CE7 $1F
    rra                                           ;; 19:7CE8 $1F
    pop  hl                                       ;; 19:7CE9 $E1
    and  $01                                      ;; 19:7CEA $E6 $01
    or   [hl]                                     ;; 19:7CEC $B6
    jp   SetEntitySpriteVariant                   ;; 19:7CED $C3 $0C $3B

func_019_7CF0::
    ld   e, b                                     ;; 19:7CF0 $58
    ldh  a, [hLinkPositionY]                      ;; 19:7CF1 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 19:7CF3 $21 $EF $FF
    sub  [hl]                                     ;; 19:7CF6 $96
    add  $14                                      ;; 19:7CF7 $C6 $14
    cp   $28                                      ;; 19:7CF9 $FE $28

func_019_7CFB::
    jr   nc, jr_019_7D3B                          ;; 19:7CFB $30 $3E

    ldh  a, [hLinkPositionX]                      ;; 19:7CFD $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 19:7CFF $21 $EE $FF
    sub  [hl]                                     ;; 19:7D02 $96
    add  $10                                      ;; 19:7D03 $C6 $10
    cp   $20                                      ;; 19:7D05 $FE $20
    jr   nc, jr_019_7D3B                          ;; 19:7D07 $30 $32

    inc  e                                        ;; 19:7D09 $1C
    push de                                       ;; 19:7D0A $D5
    call func_019_7E3A                            ;; 19:7D0B $CD $3A $7E
    ldh  a, [hLinkDirection]                      ;; 19:7D0E $F0 $9E
    xor  $01                                      ;; 19:7D10 $EE $01
    cp   e                                        ;; 19:7D12 $BB
    pop  de                                       ;; 19:7D13 $D1
    jr   nz, jr_019_7D3B                          ;; 19:7D14 $20 $25

func_019_7D16::
    ld   hl, wItemUsageContext                    ;; 19:7D16 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 19:7D19 $36 $01
    ld   a, [wDialogState]                        ;; 19:7D1B $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 19:7D1E $21 $4F $C1
    or   [hl]                                     ;; 19:7D21 $B6
    ld   hl, wIsLinkInTheAir                      ;; 19:7D22 $21 $46 $C1
    or   [hl]                                     ;; 19:7D25 $B6
    ld   hl, wDialogCooldown                      ;; 19:7D26 $21 $34 $C1
    or   [hl]                                     ;; 19:7D29 $B6
    jr   nz, jr_019_7D3B                          ;; 19:7D2A $20 $0F

    ld   a, [wWindowY]                            ;; 19:7D2C $FA $9A $DB
    cp   $80                                      ;; 19:7D2F $FE $80
    jr   nz, jr_019_7D3B                          ;; 19:7D31 $20 $08

    ldh  a, [hJoypadState]                        ;; 19:7D33 $F0 $CC
    and  J_A                                      ;; 19:7D35 $E6 $10
    jr   z, jr_019_7D3B                           ;; 19:7D37 $28 $02

    scf                                           ;; 19:7D39 $37
    ret                                           ;; 19:7D3A $C9

jr_019_7D3B:
    and  a                                        ;; 19:7D3B $A7
    ret                                           ;; 19:7D3C $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_19::
    ldh  a, [hActiveEntityStatus]                 ;; 19:7D3D $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ;; 19:7D3F $FE $05
    jr   nz, .skip                                ;; 19:7D41 $20 $29

.allowInactiveEntity
    ld   a, [wGameplayType]                       ;; 19:7D43 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 19:7D46 $FE $07
    jr   z, .skip                                 ;; 19:7D48 $28 $22

    cp   GAMEPLAY_CREDITS                         ;; 19:7D4A $FE $01
    jr   z, .creditsEnd                           ;; 19:7D4C $28 $0B

    cp   GAMEPLAY_WORLD                           ;; 19:7D4E $FE $0B
    jr   nz, .skip                                ;; 19:7D50 $20 $1A

    ld   a, [wTransitionSequenceCounter]          ;; 19:7D52 $FA $6B $C1
    cp   $04                                      ;; 19:7D55 $FE $04
    jr   nz, .skip                                ;; 19:7D57 $20 $13
.creditsEnd

    ld   hl, wC1A8                                ;; 19:7D59 $21 $A8 $C1
    ld   a, [wDialogState]                        ;; 19:7D5C $FA $9F $C1
    or   [hl]                                     ;; 19:7D5F $B6
    ld   hl, wInventoryAppearing                  ;; 19:7D60 $21 $4F $C1
    or   [hl]                                     ;; 19:7D63 $B6
    jr   nz, .skip                                ;; 19:7D64 $20 $06

    ld   a, [wRoomTransitionState]                ;; 19:7D66 $FA $24 $C1
    and  a                                        ;; 19:7D69 $A7
    jr   z, .return                               ;; 19:7D6A $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ;; 19:7D6C $F1

.return
    ret                                           ;; 19:7D6D $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_19::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 19:7D6E $21 $10 $C4
    add  hl, bc                                   ;; 19:7D71 $09
    ld   a, [hl]                                  ;; 19:7D72 $7E
    and  a                                        ;; 19:7D73 $A7
    jr   z, .return                               ;; 19:7D74 $28 $41

    dec  a                                        ;; 19:7D76 $3D
    ld   [hl], a                                  ;; 19:7D77 $77

    call label_3E8E                               ;; 19:7D78 $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ;; 19:7D7B $21 $40 $C2
    add  hl, bc                                   ;; 19:7D7E $09
    ld   a, [hl]                                  ;; 19:7D7F $7E
    push af                                       ;; 19:7D80 $F5

    ld   hl, wEntitiesSpeedYTable                 ;; 19:7D81 $21 $50 $C2
    add  hl, bc                                   ;; 19:7D84 $09
    ld   a, [hl]                                  ;; 19:7D85 $7E
    push af                                       ;; 19:7D86 $F5

    ld   hl, wEntitiesRecoilVelocityX             ;; 19:7D87 $21 $F0 $C3
    add  hl, bc                                   ;; 19:7D8A $09
    ld   a, [hl]                                  ;; 19:7D8B $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:7D8C $21 $40 $C2
    add  hl, bc                                   ;; 19:7D8F $09
    ld   [hl], a                                  ;; 19:7D90 $77

    ld   hl, wEntitiesRecoilVelocityY             ;; 19:7D91 $21 $00 $C4
    add  hl, bc                                   ;; 19:7D94 $09
    ld   a, [hl]                                  ;; 19:7D95 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:7D96 $21 $50 $C2
    add  hl, bc                                   ;; 19:7D99 $09
    ld   [hl], a                                  ;; 19:7D9A $77

    call UpdateEntityPosWithSpeed_19              ;; 19:7D9B $CD $B8 $7D

    ld   hl, wEntitiesOptions1Table               ;; 19:7D9E $21 $30 $C4
    add  hl, bc                                   ;; 19:7DA1 $09
    ld   a, [hl]                                  ;; 19:7DA2 $7E
    and  $20                                      ;; 19:7DA3 $E6 $20
    jr   nz, .restoreOriginalSpeed                ;; 19:7DA5 $20 $03

    call ApplyEntityInteractionWithBackground_trampoline ;; 19:7DA7 $CD $23 $3B

.restoreOriginalSpeed
    ld   hl, wEntitiesSpeedYTable                 ;; 19:7DAA $21 $50 $C2
    add  hl, bc                                   ;; 19:7DAD $09
    pop  af                                       ;; 19:7DAE $F1
    ld   [hl], a                                  ;; 19:7DAF $77
    ld   hl, wEntitiesSpeedXTable                 ;; 19:7DB0 $21 $40 $C2
    add  hl, bc                                   ;; 19:7DB3 $09
    pop  af                                       ;; 19:7DB4 $F1
    ld   [hl], a                                  ;; 19:7DB5 $77
    pop  af                                       ;; 19:7DB6 $F1

.return
    ret                                           ;; 19:7DB7 $C9

UpdateEntityPosWithSpeed_19::
    call AddEntitySpeedToPos_19                   ;; 19:7DB8 $CD $C5 $7D

UpdateEntityYPosWithSpeed_19::
    push bc                                       ;; 19:7DBB $C5
    ld   a, c                                     ;; 19:7DBC $79
    add  $10                                      ;; 19:7DBD $C6 $10
    ld   c, a                                     ;; 19:7DBF $4F
    call AddEntitySpeedToPos_19                   ;; 19:7DC0 $CD $C5 $7D
    pop  bc                                       ;; 19:7DC3 $C1
    ret                                           ;; 19:7DC4 $C9

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
    ld   hl, wEntitiesSpeedXTable                 ;; 19:7DC5 $21 $40 $C2
    add  hl, bc                                   ;; 19:7DC8 $09
    ld   a, [hl]                                  ;; 19:7DC9 $7E
    and  a                                        ;; 19:7DCA $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 19:7DCB $28 $23

    push af                                       ;; 19:7DCD $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ;; 19:7DCE $CB $37
    and  $F0                                      ;; 19:7DD0 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 19:7DD2 $21 $60 $C2
    add  hl, bc                                   ;; 19:7DD5 $09
    add  [hl]                                     ;; 19:7DD6 $86
    ld   [hl], a                                  ;; 19:7DD7 $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 19:7DD8 $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 19:7DDA $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 19:7DDD $09
    pop  af                                       ;; 19:7DDE $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 19:7DDF $1E $00
    bit  7, a                                     ;; 19:7DE1 $CB $7F
    jr   z, .positive                             ;; 19:7DE3 $28 $02

    ld   e, $F0                                   ;; 19:7DE5 $1E $F0

.positive
    swap a                                        ;; 19:7DE7 $CB $37
    and  $0F                                      ;; 19:7DE9 $E6 $0F
    or   e                                        ;; 19:7DEB $B3
    ; Get carry back from d
    rr   d                                        ;; 19:7DEC $CB $1A
    adc  [hl]                                     ;; 19:7DEE $8E
    ld   [hl], a                                  ;; 19:7DEF $77

.return
    ret                                           ;; 19:7DF0 $C9

AddEntityZSpeedToPos_19::
    ld   hl, wEntitiesSpeedZTable                 ;; 19:7DF1 $21 $20 $C3
    add  hl, bc                                   ;; 19:7DF4 $09
    ld   a, [hl]                                  ;; 19:7DF5 $7E
    and  a                                        ;; 19:7DF6 $A7
    jr   z, AddEntitySpeedToPos_19.return         ;; 19:7DF7 $28 $F7

    push af                                       ;; 19:7DF9 $F5
    swap a                                        ;; 19:7DFA $CB $37
    and  $F0                                      ;; 19:7DFC $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 19:7DFE $21 $30 $C3
    add  hl, bc                                   ;; 19:7E01 $09
    add  [hl]                                     ;; 19:7E02 $86
    ld   [hl], a                                  ;; 19:7E03 $77
    rl   d                                        ;; 19:7E04 $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 19:7E06 $21 $10 $C3
    jr   AddEntitySpeedToPos_19.updatePosition    ;; 19:7E09 $18 $D2

; Get the difference between link's position and this entities position in X.
EntityLinkPositionXDifference_19::
    ld   e, $00                                   ;; 19:7E0B $1E $00
    ldh  a, [hLinkPositionX]                      ;; 19:7E0D $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 19:7E0F $21 $00 $C2
    add  hl, bc                                   ;; 19:7E12 $09
    sub  [hl]                                     ;; 19:7E13 $96
    bit  7, a                                     ;; 19:7E14 $CB $7F
    jr   z, .jr_7E19                              ;; 19:7E16 $28 $01

    inc  e                                        ;; 19:7E18 $1C

.jr_7E19
    ld   d, a                                     ;; 19:7E19 $57
    ret                                           ;; 19:7E1A $C9

; Get the difference between link's position and this entities position in Y.
EntityLinkPositionYDifference_19::
    ld   e, $02                                   ;; 19:7E1B $1E $02
    ldh  a, [hLinkPositionY]                      ;; 19:7E1D $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 19:7E1F $21 $10 $C2
    add  hl, bc                                   ;; 19:7E22 $09
    sub  [hl]                                     ;; 19:7E23 $96
    bit  7, a                                     ;; 19:7E24 $CB $7F
    jr   nz, .jr_7E29                             ;; 19:7E26 $20 $01

    inc  e                                        ;; 19:7E28 $1C

.jr_7E29
    ld   d, a                                     ;; 19:7E29 $57
    ret                                           ;; 19:7E2A $C9

    ld   e, $02                                   ;; 19:7E2B $1E $02
    ldh  a, [hLinkPositionY]                      ;; 19:7E2D $F0 $99
    ld   hl, hActiveEntityVisualPosY              ;; 19:7E2F $21 $EC $FF
    sub  [hl]                                     ;; 19:7E32 $96
    bit  7, a                                     ;; 19:7E33 $CB $7F
    jr   nz, .jr_7E38                             ;; 19:7E35 $20 $01

    inc  e                                        ;; 19:7E37 $1C

.jr_7E38
    ld   d, a                                     ;; 19:7E38 $57
    ret                                           ;; 19:7E39 $C9

func_019_7E3A::
    call EntityLinkPositionXDifference_19         ;; 19:7E3A $CD $0B $7E
    ld   a, e                                     ;; 19:7E3D $7B
    ldh  [hMultiPurpose0], a                      ;; 19:7E3E $E0 $D7
    ld   a, d                                     ;; 19:7E40 $7A
    bit  7, a                                     ;; 19:7E41 $CB $7F
    jr   z, .jr_7E47                              ;; 19:7E43 $28 $02

    cpl                                           ;; 19:7E45 $2F
    inc  a                                        ;; 19:7E46 $3C

.jr_7E47
    push af                                       ;; 19:7E47 $F5
    call EntityLinkPositionYDifference_19         ;; 19:7E48 $CD $1B $7E
    ld   a, e                                     ;; 19:7E4B $7B
    ldh  [hMultiPurpose1], a                      ;; 19:7E4C $E0 $D8
    ld   a, d                                     ;; 19:7E4E $7A
    bit  7, a                                     ;; 19:7E4F $CB $7F
    jr   z, .jr_7E55                              ;; 19:7E51 $28 $02

    cpl                                           ;; 19:7E53 $2F
    inc  a                                        ;; 19:7E54 $3C

.jr_7E55
    pop  de                                       ;; 19:7E55 $D1
    cp   d                                        ;; 19:7E56 $BA
    jr   nc, .jr_7E5D                             ;; 19:7E57 $30 $04

    ldh  a, [hMultiPurpose0]                      ;; 19:7E59 $F0 $D7
    jr   jr_019_7E5F                              ;; 19:7E5B $18 $02

.jr_7E5D
    ldh  a, [hMultiPurpose1]                      ;; 19:7E5D $F0 $D8

jr_019_7E5F:
    ld   e, a                                     ;; 19:7E5F $5F
    ret                                           ;; 19:7E60 $C9

ClearEntityStatus_19::
    ld   hl, wEntitiesStatusTable                 ;; 19:7E61 $21 $80 $C2
    add  hl, bc                                   ;; 19:7E64 $09
    ld   [hl], b                                  ;; 19:7E65 $70
    ret                                           ;; 19:7E66 $C9

; Kill boss or mini-boss with explosions animation (unused in this bank)
AnimateBossAgony_19::
    ld   hl, wEntitiesPrivateState2Table          ;; 19:7E67 $21 $C0 $C2
    add  hl, bc                                   ;; 19:7E6A $09
    ld   a, [hl]                                  ;; 19:7E6B $7E
    JP_TABLE                                      ;; 19:7E6C
._00 dw AnimateBossAgonyInit_19                             ;; 19:7E6D
._01 dw AnimateBossAgonyFlashing_19                             ;; 19:7E6F
._02 dw AnimateBossAgonyExploding_19                             ;; 19:7E71

AnimateBossAgonyInit_19::
    call GetEntityTransitionCountdown             ;; 19:7E73 $CD $05 $0C
    ld   [hl], $A0                                ;; 19:7E76 $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:7E78 $21 $20 $C4
    add  hl, bc                                   ;; 19:7E7B $09
    ld   [hl], $FF                                ;; 19:7E7C $36 $FF

IncrementEntityPrivateState2_19:
    ld   hl, wEntitiesPrivateState2Table          ;; 19:7E7E $21 $C0 $C2
    add  hl, bc                                   ;; 19:7E81 $09
    inc  [hl]                                     ;; 19:7E82 $34
    ret                                           ;; 19:7E83 $C9

AnimateBossAgonyFlashing_19::
    call GetEntityTransitionCountdown             ;; 19:7E84 $CD $05 $0C
    ret  nz                                       ;; 19:7E87 $C0

    ld   [hl], $C0                                ;; 19:7E88 $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ;; 19:7E8A $21 $20 $C4
    add  hl, bc                                   ;; 19:7E8D $09
    ld   [hl], $FF                                ;; 19:7E8E $36 $FF
    jp   IncrementEntityPrivateState2_19          ;; 19:7E90 $C3 $7E $7E

AnimateBossAgonyExploding_19::
    ; When the explosions end, make the boss die
    call GetEntityTransitionCountdown             ;; 19:7E93 $CD $05 $0C
    jr   nz, .notDeadYet                          ;; 19:7E96 $20 $09
    call PlayBombExplosionSfx                     ;; 19:7E98 $CD $4B $0C
    call label_27DD                               ;; 19:7E9B $CD $DD $27
    jp   DidKillEnemy                             ;; 19:7E9E $C3 $50 $3F

.notDeadYet
    jp   .animateExplosions                       ;; 19:7EA1 $C3 $A4 $7E

.animateExplosions
    and  $07                                      ;; 19:7EA4 $E6 $07
    ret  nz                                       ;; 19:7EA6 $C0

    call GetRandomByte                            ;; 19:7EA7 $CD $0D $28
    and  $1F                                      ;; 19:7EAA $E6 $1F
    sub  $10                                      ;; 19:7EAC $D6 $10
    ld   e, a                                     ;; 19:7EAE $5F
    ld   hl, hActiveEntityPosX                    ;; 19:7EAF $21 $EE $FF
    add  [hl]                                     ;; 19:7EB2 $86
    ld   [hl], a                                  ;; 19:7EB3 $77
    call GetRandomByte                            ;; 19:7EB4 $CD $0D $28
    and  $1F                                      ;; 19:7EB7 $E6 $1F
    sub  $14                                      ;; 19:7EB9 $D6 $14
    ld   e, a                                     ;; 19:7EBB $5F
    ld   hl, hActiveEntityVisualPosY              ;; 19:7EBC $21 $EC $FF
    add  [hl]                                     ;; 19:7EBF $86
    ld   [hl], a                                  ;; 19:7EC0 $77
    jp   label_019_7EC4                           ;; 19:7EC1 $C3 $C4 $7E

label_019_7EC4:
    call ReturnIfNonInteractive_19.allowInactiveEntity ;; 19:7EC4 $CD $43 $7D
    ldh  a, [hActiveEntityPosX]                   ;; 19:7EC7 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 19:7EC9 $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ;; 19:7ECB $F0 $EC
    ldh  [hMultiPurpose1], a                      ;; 19:7ECD $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 19:7ECF $3E $02
    call AddTranscientVfx                         ;; 19:7ED1 $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ;; 19:7ED4 $3E $13
    ldh  [hNoiseSfx], a                           ;; 19:7ED6 $E0 $F4
    ret                                           ;; 19:7ED8 $C9

    ld   a, ENTITY_HEART_CONTAINER                ;; 19:7ED9 $3E $36
    call SpawnNewEntity_trampoline                ;; 19:7EDB $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ;; 19:7EDE $F0 $D7
    ld   hl, wEntitiesPosXTable                   ;; 19:7EE0 $21 $00 $C2
    add  hl, de                                   ;; 19:7EE3 $19
    ld   [hl], a                                  ;; 19:7EE4 $77
    ldh  a, [hMultiPurpose1]                      ;; 19:7EE5 $F0 $D8
    ld   hl, wEntitiesPosYTable                   ;; 19:7EE7 $21 $10 $C2
    add  hl, de                                   ;; 19:7EEA $19
    ld   [hl], a                                  ;; 19:7EEB $77
    ldh  a, [hIsSideScrolling]                    ;; 19:7EEC $F0 $F9
    and  a                                        ;; 19:7EEE $A7
    jr   z, .jr_7EF9                              ;; 19:7EEF $28 $08

    ld   hl, wEntitiesSpeedYTable                 ;; 19:7EF1 $21 $50 $C2
    add  hl, bc                                   ;; 19:7EF4 $09
    ld   [hl], $F0                                ;; 19:7EF5 $36 $F0
    jr   jr_019_7F05                              ;; 19:7EF7 $18 $0C

.jr_7EF9
    ld   hl, wEntitiesSpeedZTable                 ;; 19:7EF9 $21 $20 $C3
    add  hl, de                                   ;; 19:7EFC $19
    ld   [hl], $10                                ;; 19:7EFD $36 $10
    ld   hl, wEntitiesPosZTable                   ;; 19:7EFF $21 $10 $C3
    add  hl, de                                   ;; 19:7F02 $19
    ld   [hl], $08                                ;; 19:7F03 $36 $08

jr_019_7F05:
    call ClearEntityStatus_19                     ;; 19:7F05 $CD $61 $7E
    ld   hl, hNoiseSfx                            ;; 19:7F08 $21 $F4 $FF
    ld   [hl], NOISE_SFX_BOSS_EXPLOSION           ;; 19:7F0B $36 $1A
    ret                                           ;; 19:7F0D $C9

func_019_7F0E::
    ld   hl, wOverworldRoomStatus                 ;; 19:7F0E $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 19:7F11 $F0 $F6
    ld   e, a                                     ;; 19:7F13 $5F
    ld   a, [wIsIndoor]                           ;; 19:7F14 $FA $A5 $DB
    ld   d, a                                     ;; 19:7F17 $57

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ;; 19:7F18 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 19:7F1A $FE $1A
    jr   nc, .indoorsBEnd                         ;; 19:7F1C $30 $05
    cp   MAP_INDOORS_B_START                      ;; 19:7F1E $FE $06
    jr   c, .indoorsBEnd                          ;; 19:7F20 $38 $01
    inc  d                                        ;; 19:7F22 $14
.indoorsBEnd

    add  hl, de                                   ;; 19:7F23 $19
    ld   a, [hl]                                  ;; 19:7F24 $7E
    or   ROOM_STATUS_EVENT_2                      ;; 19:7F25 $F6 $20
    ld   [hl], a                                  ;; 19:7F27 $77
    ldh  [hRoomStatus], a                         ;; 19:7F28 $E0 $F8
    ret                                           ;; 19:7F2A $C9
