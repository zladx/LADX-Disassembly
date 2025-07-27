EntityInitDodongoSnake::
    ld   hl, wEntitiesLoadOrderTable              ;; 05:6818 $21 $60 $C4
    add  hl, bc                                   ;; 05:681B $09
    ld   e, [hl]                                  ;; 05:681C $5E
    sla  e                                        ;; 05:681D $CB $23
    sla  e                                        ;; 05:681F $CB $23
    sla  e                                        ;; 05:6821 $CB $23
    sla  e                                        ;; 05:6823 $CB $23
    sla  e                                        ;; 05:6825 $CB $23
    sla  e                                        ;; 05:6827 $CB $23
    ld   d, b                                     ;; 05:6829 $50
    ld   hl, wEntitiesPositionXHistoryTable       ;; 05:682A $21 $00 $D0
    add  hl, de                                   ;; 05:682D $19
    push de                                       ;; 05:682E $D5
    ld   e, $20                                   ;; 05:682F $1E $20

.initXHistoryTableLoop
    xor  a                                        ;; 05:6831 $AF
    ld   [hl+], a                                 ;; 05:6832 $22
    dec  e                                        ;; 05:6833 $1D
    ld   a, e                                     ;; 05:6834 $7B
    cp   $00                                      ;; 05:6835 $FE $00
    jr   nz, .initXHistoryTableLoop               ;; 05:6837 $20 $F8

    pop  de                                       ;; 05:6839 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 05:683A $21 $00 $D1
    add  hl, de                                   ;; 05:683D $19
    ld   e, $20                                   ;; 05:683E $1E $20

.initYHistoryTableLoop
    xor  a                                        ;; 05:6840 $AF
    ld   [hl+], a                                 ;; 05:6841 $22
    dec  e                                        ;; 05:6842 $1D
    ld   a, e                                     ;; 05:6843 $7B
    cp   $00                                      ;; 05:6844 $FE $00
    jr   nz, .initYHistoryTableLoop               ;; 05:6846 $20 $F8

    ld   hl, wEntitiesSpeedYTable                 ;; 05:6848 $21 $50 $C2
    add  hl, bc                                   ;; 05:684B $09
    ld   [hl], $06                                ;; 05:684C $36 $06
    call GetEntityTransitionCountdown             ;; 05:684E $CD $05 $0C
    ld   [hl], $40                                ;; 05:6851 $36 $40
    call GetEntityPrivateCountdown1               ;; 05:6853 $CD $00 $0C
    ld   [hl], $40                                ;; 05:6856 $36 $40
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:6858 $21 $B0 $C3
    add  hl, bc                                   ;; 05:685B $09
    ld   [hl], $03                                ;; 05:685C $36 $03
    ret

DodongoSnakeSpeedXPerDirection::
    db   $06, $FA, $00, $00

DodongoSnakeSpeedYPerDirection::
    db   $00, $00, $FA, $06

; Offsets for indexing the position history, used for the head while crawling
; (makes it look like it's inching bit by bit)
DodongoSnakeHeadPositionHistoryOffset::
    db   $02, $01, $00, $01

; Offsets for indexing the position history, used for the body while crawling
DodongoSnakeBodyPositionHistoryOffset::
    db   $21, $22, $23, $22

DodongoSnakeEntityHandler::
    ldh  a, [hMapId]                              ;; 05:686F $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 05:6871 $FE $07
    jr   nz, .turtleRockEnd                       ;; 05:6873 $20 $04

    ld   a, $10                                   ;; 05:6875 $3E $10
    ldh  [hActiveEntityTilesOffset], a            ;; 05:6877 $E0 $F5

.turtleRockEnd
    call RenderDodongoSnake                       ;; 05:6879 $CD $38 $6A
    call ReturnIfNonInteractive_05                ;; 05:687C $CD $3A $7A
    call BossIntro                                ;; 05:687F $CD $E8 $3E
    call DecrementEntityIgnoreHitsCountdown       ;; 05:6882 $CD $56 $0C
    call DefaultEnemyDamageCollisionHandler_trampoline ;; 05:6885 $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ;; 05:6888 $F0 $F0
    JP_TABLE                                      ;; 05:688A
._00 dw DodongoSnakeCrawlingHandler               ;; 05:688B
._01 dw DodongoSnakeTurningHandler                ;; 05:688D
._02 dw DodongoSnakeBombedHandler                 ;; 05:688F

DodongoSnakeCrawlingHandler::
    call GetEntityTransitionCountdown             ;; 05:6891 $CD $05 $0C
    jr   nz, .skipIncrementState                  ;; 05:6894 $20 $05

    ld   [hl], $00                                ;; 05:6896 $36 $00
    call IncrementEntityState                     ;; 05:6898 $CD $12 $3B

.skipIncrementState
    ; Add current position to position history
    ld   hl, wEntitiesInertiaTable                ;; 05:689B $21 $D0 $C3
    add  hl, bc                                   ;; 05:689E $09
    ld   a, [hl]                                  ;; 05:689F $7E
    inc  a                                        ;; 05:68A0 $3C
    and  $3F                                      ;; 05:68A1 $E6 $3F
    ld   [hl], a                                  ;; 05:68A3 $77
    ldh  [hMultiPurpose0], a                      ;; 05:68A4 $E0 $D7
    rra                                           ;; 05:68A6 $1F
    rra                                           ;; 05:68A7 $1F
    nop                                           ;; 05:68A8 $00
    and  $03                                      ;; 05:68A9 $E6 $03
    ld   e, a                                     ;; 05:68AB $5F
    ld   d, $00                                   ;; 05:68AC $16 $00
    ld   hl, DodongoSnakeHeadPositionHistoryOffset    ;; 05:68AE $21 $67 $68
    add  hl, de                                   ;; 05:68B1 $19
    ld   a, [hl]                                  ;; 05:68B2 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 05:68B3 $21 $B0 $C2
    add  hl, bc                                   ;; 05:68B6 $09
    ld   [hl], a                                  ;; 05:68B7 $77
    ld   hl, DodongoSnakeBodyPositionHistoryOffset                        ;; 05:68B8 $21 $6B $68
    add  hl, de                                   ;; 05:68BB $19
    ld   a, [hl]                                  ;; 05:68BC $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:68BD $21 $C0 $C2
    add  hl, bc                                   ;; 05:68C0 $09
    ld   [hl], a                                  ;; 05:68C1 $77
    ld   hl, wEntitiesLoadOrderTable              ;; 05:68C2 $21 $60 $C4
    add  hl, bc                                   ;; 05:68C5 $09
    ld   e, [hl]                                  ;; 05:68C6 $5E
    sla  e                                        ;; 05:68C7 $CB $23
    sla  e                                        ;; 05:68C9 $CB $23
    sla  e                                        ;; 05:68CB $CB $23
    sla  e                                        ;; 05:68CD $CB $23
    sla  e                                        ;; 05:68CF $CB $23
    sla  e                                        ;; 05:68D1 $CB $23
    ld   d, $00                                   ;; 05:68D3 $16 $00
    push de                                       ;; 05:68D5 $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 05:68D6 $21 $00 $D0
    add  hl, de                                   ;; 05:68D9 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:68DA $F0 $D7
    ld   e, a                                     ;; 05:68DC $5F
    add  hl, de                                   ;; 05:68DD $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:68DE $F0 $EE
    ld   [hl], a                                  ;; 05:68E0 $77
    pop  de                                       ;; 05:68E1 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 05:68E2 $21 $00 $D1
    add  hl, de                                   ;; 05:68E5 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:68E6 $F0 $D7
    ld   e, a                                     ;; 05:68E8 $5F
    add  hl, de                                   ;; 05:68E9 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:68EA $F0 $EC
    ld   [hl], a                                  ;; 05:68EC $77
    call UpdateEntityPosWithSpeed_05              ;; 05:68ED $CD $B1 $7A
    call ApplyEntityInteractionWithBackground_trampoline ;; 05:68F0 $CD $23 $3B

    ; Loop through all entities in the room.
    ld   e, $0F                                   ;; 05:68F3 $1E $0F
    ld   d, b                                     ;; 05:68F5 $50

.eatBombLoop
    ; If the other entity is active...
    ld   hl, wEntitiesStatusTable                 ;; 05:68F6 $21 $80 $C2
    add  hl, de                                   ;; 05:68F9 $19
    ld   a, [hl]                                  ;; 05:68FA $7E
    cp   ENTITY_STATUS_ACTIVE                     ;; 05:68FB $FE $05
    jr   nz, .continue                            ;; 05:68FD $20 $54

    ; ...and is a bomb...
    ld   hl, wEntitiesTypeTable                   ;; 05:68FF $21 $A0 $C3
    add  hl, de                                   ;; 05:6902 $19
    ld   a, [hl]                                  ;; 05:6903 $7E
    cp   ENTITY_BOMB                              ;; 05:6904 $FE $02
    jr   nz, .continue                            ;; 05:6906 $20 $4B

    ; ...and its transition countdown >= 0x38...
    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:6908 $21 $E0 $C2
    add  hl, de                                   ;; 05:690B $19
    ld   a, [hl]                                  ;; 05:690C $7E
    cp   $38                                      ;; 05:690D $FE $38
    jr   c, .continue                             ;; 05:690F $38 $42

    ; ...and it's near enough...
    ld   hl, wEntitiesPosXTable                   ;; 05:6911 $21 $00 $C2
    add  hl, de                                   ;; 05:6914 $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:6915 $F0 $EE
    sub  [hl]                                     ;; 05:6917 $96
    add  $06                                      ;; 05:6918 $C6 $06
    cp   $0C                                      ;; 05:691A $FE $0C
    jr   nc, .continue                            ;; 05:691C $30 $35

    ld   hl, wEntitiesPosYTable                   ;; 05:691E $21 $10 $C2
    add  hl, de                                   ;; 05:6921 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:6922 $F0 $EC
    sub  [hl]                                     ;; 05:6924 $96
    add  $06                                      ;; 05:6925 $C6 $06
    cp   $0C                                      ;; 05:6927 $FE $0C
    jr   nc, .continue                            ;; 05:6929 $30 $28

    ld   hl, wEntitiesPosZTable                   ;; 05:692B $21 $10 $C3
    add  hl, de                                   ;; 05:692E $19
    ld   a, [hl]                                  ;; 05:692F $7E
    and  a                                        ;; 05:6930 $A7
    jr   nz, .continue                            ;; 05:6931 $20 $20

    ; ...eat the bomb.
    ld   hl, wEntitiesStatusTable                 ;; 05:6933 $21 $80 $C2
    add  hl, de                                   ;; 05:6936 $19
    ld   [hl], b                                  ;; 05:6937 $70
    call IncrementEntityState                     ;; 05:6938 $CD $12 $3B
    ld   [hl], $02                                ;; 05:693B $36 $02
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:693D $21 $00 $C3
    add  hl, bc                                   ;; 05:6940 $09
    ld   [hl], $60                                ;; 05:6941 $36 $60
    ld   hl, wEntitiesFlashCountdownTable         ;; 05:6943 $21 $20 $C4
    add  hl, bc                                   ;; 05:6946 $09
    ld   [hl], $0C                                ;; 05:6947 $36 $0C
    ld   hl, wEntitiesPrivateState4Table          ;; 05:6949 $21 $40 $C4
    add  hl, bc                                   ;; 05:694C $09
    inc  [hl]                                     ;; 05:694D $34
    ld   a, JINGLE_DODONGO_EAT_BOMB               ;; 05:694E $3E $2A
    ldh  [hJingle], a                             ;; 05:6950 $E0 $F2
    ret                                           ;; 05:6952 $C9

.continue
    dec  e                                        ;; 05:6953 $1D
    jr   nz, .eatBombLoop                         ;; 05:6954 $20 $A0

    ret                                           ;; 05:6956 $C9

DodongoSnakeTurningHandler::
    call GetEntityTransitionCountdown             ;; 05:6957 $CD $05 $0C
    jr   nz, .return                              ;; 05:695A $20 $44

    call GetRandomByte                            ;; 05:695C $CD $0D $28
    and  $1F                                      ;; 05:695F $E6 $1F
    add  $40                                      ;; 05:6961 $C6 $40
    ld   [hl], a                                  ;; 05:6963 $77
    call IncrementEntityState                     ;; 05:6964 $CD $12 $3B
    ld   [hl], b                                  ;; 05:6967 $70
    ld   hl, wEntitiesPrivateState3Table          ;; 05:6968 $21 $D0 $C2
    add  hl, bc                                   ;; 05:696B $09
    ld   a, [hl]                                  ;; 05:696C $7E
    inc  a                                        ;; 05:696D $3C
    and  $03                                      ;; 05:696E $E6 $03
    ld   [hl], a                                  ;; 05:6970 $77
    jr   nz, .randomDirection                     ;; 05:6971 $20 $05

    ; Once every 4 turns, try to move toward Link instead of in a random direction.
    call GetEntityDirectionToLink_05              ;; 05:6973 $CD $24 $7B
    jr   .randomDirectionEnd                      ;; 05:6976 $18 $06

.randomDirection
    call GetRandomByte                            ;; 05:6978 $CD $0D $28
    and  $03                                      ;; 05:697B $E6 $03
    ld   e, a                                     ;; 05:697D $5F

.randomDirectionEnd
    ; The Dodongo Snake must always turn to its left or right.
    ; If that's not the case, get new random direction.
    ld   hl, hActiveEntitySpriteVariant           ;; 05:697E $21 $F1 $FF
    xor  [hl]                                     ;; 05:6981 $AE
    and  $02                                      ;; 05:6982 $E6 $02
    jr   z, .randomDirection                      ;; 05:6984 $28 $F2

    ld   d, b                                     ;; 05:6986 $50
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:6987 $21 $B0 $C3
    add  hl, bc                                   ;; 05:698A $09
    ld   [hl], e                                  ;; 05:698B $73
    ld   hl, DodongoSnakeSpeedXPerDirection       ;; 05:698C $21 $5F $68
    add  hl, de                                   ;; 05:698F $19
    ld   a, [hl]                                  ;; 05:6990 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 05:6991 $21 $40 $C2
    add  hl, bc                                   ;; 05:6994 $09
    ld   [hl], a                                  ;; 05:6995 $77
    ld   hl, DodongoSnakeSpeedYPerDirection       ;; 05:6996 $21 $63 $68
    add  hl, de                                   ;; 05:6999 $19
    ld   a, [hl]                                  ;; 05:699A $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 05:699B $21 $50 $C2
    add  hl, bc                                   ;; 05:699E $09
    ld   [hl], a                                  ;; 05:699F $77

.return:
    ret                                           ;; 05:69A0 $C9

DodongoSnakeDeathExplosionOffsetXPerDirection::
    db   $F3, $0D, $00, $00

DodongoSnakeDeathExplosionOffsetYPerDirection::
    db   $00, $00, $0D, $F3

DodongoSnakeBurpVfxOffsetXPerDirection::
    db   $0C, $F4, $00, $00

DodongoSnakeBurpVfxOffsetYPerDirection::
    db   $00, $00, $F4, $0C

DodongoSnakeBombedHandler::
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:69B1 $21 $00 $C3
    add  hl, bc                                   ;; 05:69B4 $09
    ld   a, [hl]                                  ;; 05:69B5 $7E
    and  a                                        ;; 05:69B6 $A7
    jr   nz, .skipIncrementState                  ;; 05:69B7 $20 $0B

    call GetEntityTransitionCountdown             ;; 05:69B9 $CD $05 $0C
    ld   [hl], $30                                ;; 05:69BC $36 $30
    call IncrementEntityState                     ;; 05:69BE $CD $12 $3B
    ld   [hl], $01                                ;; 05:69C1 $36 $01
    ret                                           ;; 05:69C3 $C9

.skipIncrementState
    cp   $24                                      ;; 05:69C4 $FE $24
    jr   nz, .explosionSfxEnd                     ;; 05:69C6 $20 $03

    call PlayBombExplosionSfx                     ;; 05:69C8 $CD $4B $0C

.explosionSfxEnd
    cp   $04                                      ;; 05:69CB $FE $04
    jr   nz, .burpVfxEnd                          ;; 05:69CD $20 $1C

    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:69CF $F0 $F1
    ld   e, a                                     ;; 05:69D1 $5F
    ld   d, b                                     ;; 05:69D2 $50
    ld   hl, DodongoSnakeBurpVfxOffsetXPerDirection ;; 05:69D3 $21 $A9 $69
    add  hl, de                                   ;; 05:69D6 $19
    ldh  a, [hActiveEntityPosX]                   ;; 05:69D7 $F0 $EE
    add  [hl]                                     ;; 05:69D9 $86
    ldh  [hMultiPurpose0], a                      ;; 05:69DA $E0 $D7
    ld   hl, DodongoSnakeBurpVfxOffsetYPerDirection ;; 05:69DC $21 $AD $69
    add  hl, de                                   ;; 05:69DF $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 05:69E0 $F0 $EC
    add  [hl]                                     ;; 05:69E2 $86
    ldh  [hMultiPurpose1], a                      ;; 05:69E3 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 05:69E5 $3E $02
    call AddTranscientVfx                         ;; 05:69E7 $CD $C7 $0C
    xor  a                                        ;; 05:69EA $AF

.burpVfxEnd
    cp   $20                                      ;; 05:69EB $FE $20
    ret  nz                                       ;; 05:69ED $C0

    ; If this is the third time it's bombed, spawn an explosion (a bomb entity)
    ld   hl, wEntitiesPrivateState4Table          ;; 05:69EE $21 $40 $C4
    add  hl, bc                                   ;; 05:69F1 $09
    ld   a, [hl]                                  ;; 05:69F2 $7E
    cp   $03                                      ;; 05:69F3 $FE $03
    ret  nz                                       ;; 05:69F5 $C0

    ld   a, ENTITY_BOMB                           ;; 05:69F6 $3E $02
    call SpawnNewEntity_trampoline                ;; 05:69F8 $CD $86 $3B
    ret  c                                        ;; 05:69FB $D8

    ld   hl, wEntitiesTransitionCountdownTable    ;; 05:69FC $21 $E0 $C2
    add  hl, de                                   ;; 05:69FF $19
    ld   [hl], $17                                ;; 05:6A00 $36 $17
    push bc                                       ;; 05:6A02 $C5
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:6A03 $21 $B0 $C3
    add  hl, bc                                   ;; 05:6A06 $09
    ld   c, [hl]                                  ;; 05:6A07 $4E
    ld   hl, DodongoSnakeDeathExplosionOffsetXPerDirection ;; 05:6A08 $21 $A1 $69
    add  hl, bc                                   ;; 05:6A0B $09
    ldh  a, [hMultiPurpose0]                      ;; 05:6A0C $F0 $D7
    add  [hl]                                     ;; 05:6A0E $86
    ld   hl, wEntitiesPosXTable                   ;; 05:6A0F $21 $00 $C2
    add  hl, de                                   ;; 05:6A12 $19
    ld   [hl], a                                  ;; 05:6A13 $77
    ld   hl, DodongoSnakeDeathExplosionOffsetYPerDirection ;; 05:6A14 $21 $A5 $69
    add  hl, bc                                   ;; 05:6A17 $09
    ldh  a, [hMultiPurpose1]                      ;; 05:6A18 $F0 $D8
    add  [hl]                                     ;; 05:6A1A $86
    ld   hl, wEntitiesPosYTable                   ;; 05:6A1B $21 $10 $C2
    add  hl, de                                   ;; 05:6A1E $19
    ld   [hl], a                                  ;; 05:6A1F $77
    pop  bc                                       ;; 05:6A20 $C1
    jp   label_005_7E9D                           ;; 05:6A21 $C3 $9D $7E

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
DodongoSnakeSpriteVariants::
; Right
.variant0
    db $66, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
    db $64, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Left
.variant1
    db $64, OAM_GBC_PAL_3 | OAMF_PAL0
    db $66, OAM_GBC_PAL_3 | OAMF_PAL0
; Up
.variant2
    db $62, OAM_GBC_PAL_3 | OAMF_PAL0
    db $62, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Down
.variant3
    db $60, OAM_GBC_PAL_3 | OAMF_PAL0
    db $60, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP
; Body
.variant4
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0
    db $68, OAM_GBC_PAL_3 | OAMF_PAL0 | OAMF_XFLIP

RenderDodongoSnake::
    ; If recently spawned, during room transition, or recently ate a bomb,
    ; use a single sprites rect with both head and body.
    ; Otherwise, use two sprites, positioned based on the entity's position history.
    call GetEntityPrivateCountdown1               ;; 05:6A38 $CD $00 $0C
    ld   hl, wRoomTransitionState                 ;; 05:6A3B $21 $24 $C1
    or   [hl]                                     ;; 05:6A3E $B6
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:6A3F $21 $00 $C3
    add  hl, bc                                   ;; 05:6A42 $09
    or   [hl]                                     ;; 05:6A43 $B6
    jp   nz, RenderDodongoSnakeFullbody           ;; 05:6A44 $C2 $77 $6C

    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:6A47 $F0 $F1
    cp   $02                                      ;; 05:6A49 $FE $02
    jr   nz, .notFacingUp                         ;; 05:6A4B $20 $09

    ; If facing up, the body is rendered over the head
    call RenderDodongoSnakeBody                   ;; 05:6A4D $CD $A5 $6A
    call RenderDodongoSnakeHead                   ;; 05:6A50 $CD $5F $6A
    jp   CopyEntityPositionToActivePosition       ;; 05:6A53 $C3 $8A $3D

.notFacingUp
    call RenderDodongoSnakeHead                   ;; 05:6A56 $CD $5F $6A
    call RenderDodongoSnakeBody                   ;; 05:6A59 $CD $A5 $6A
    jp   CopyEntityPositionToActivePosition       ;; 05:6A5C $C3 $8A $3D

RenderDodongoSnakeHead::
    ld   hl, wEntitiesInertiaTable                ;; 05:6A5F $21 $D0 $C3
    add  hl, bc                                   ;; 05:6A62 $09
    ld   a, [hl]                                  ;; 05:6A63 $7E
    ldh  [hMultiPurpose0], a                      ;; 05:6A64 $E0 $D7
    push bc                                       ;; 05:6A66 $C5
    ld   hl, wEntitiesLoadOrderTable              ;; 05:6A67 $21 $60 $C4
    add  hl, bc                                   ;; 05:6A6A $09
    ld   e, [hl]                                  ;; 05:6A6B $5E
    ld   hl, wEntitiesPrivateState1Table          ;; 05:6A6C $21 $B0 $C2
    add  hl, bc                                   ;; 05:6A6F $09
    ld   c, [hl]                                  ;; 05:6A70 $4E
    sla  e                                        ;; 05:6A71 $CB $23
    sla  e                                        ;; 05:6A73 $CB $23
    sla  e                                        ;; 05:6A75 $CB $23
    sla  e                                        ;; 05:6A77 $CB $23
    sla  e                                        ;; 05:6A79 $CB $23
    sla  e                                        ;; 05:6A7B $CB $23
    ld   d, b                                     ;; 05:6A7D $50
    push de                                       ;; 05:6A7E $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 05:6A7F $21 $00 $D0
    add  hl, de                                   ;; 05:6A82 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:6A83 $F0 $D7
    sub  c                                        ;; 05:6A85 $91
    and  $3F                                      ;; 05:6A86 $E6 $3F
    ld   e, a                                     ;; 05:6A88 $5F
    ld   d, b                                     ;; 05:6A89 $50
    add  hl, de                                   ;; 05:6A8A $19
    ld   a, [hl]                                  ;; 05:6A8B $7E
    ldh  [hActiveEntityPosX], a                   ;; 05:6A8C $E0 $EE
    pop  de                                       ;; 05:6A8E $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 05:6A8F $21 $00 $D1
    add  hl, de                                   ;; 05:6A92 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:6A93 $F0 $D7
    sub  c                                        ;; 05:6A95 $91
    and  $3F                                      ;; 05:6A96 $E6 $3F
    ld   e, a                                     ;; 05:6A98 $5F
    ld   d, b                                     ;; 05:6A99 $50
    add  hl, de                                   ;; 05:6A9A $19
    ld   a, [hl]                                  ;; 05:6A9B $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 05:6A9C $E0 $EC
    pop  bc                                       ;; 05:6A9E $C1
    ld   de, DodongoSnakeSpriteVariants           ;; 05:6A9F $11 $24 $6A
    jp   RenderActiveEntitySpritesPair            ;; 05:6AA2 $C3 $C0 $3B

RenderDodongoSnakeBody::
    ld   hl, wEntitiesInertiaTable                ;; 05:6AA5 $21 $D0 $C3
    add  hl, bc                                   ;; 05:6AA8 $09
    ld   a, [hl]                                  ;; 05:6AA9 $7E
    ldh  [hMultiPurpose0], a                      ;; 05:6AAA $E0 $D7
    push bc                                       ;; 05:6AAC $C5
    ld   hl, wEntitiesLoadOrderTable              ;; 05:6AAD $21 $60 $C4
    add  hl, bc                                   ;; 05:6AB0 $09
    ld   e, [hl]                                  ;; 05:6AB1 $5E
    ld   hl, wEntitiesPrivateState2Table          ;; 05:6AB2 $21 $C0 $C2
    add  hl, bc                                   ;; 05:6AB5 $09
    ld   c, [hl]                                  ;; 05:6AB6 $4E
    sla  e                                        ;; 05:6AB7 $CB $23
    sla  e                                        ;; 05:6AB9 $CB $23
    sla  e                                        ;; 05:6ABB $CB $23
    sla  e                                        ;; 05:6ABD $CB $23
    sla  e                                        ;; 05:6ABF $CB $23
    sla  e                                        ;; 05:6AC1 $CB $23
    ld   d, b                                     ;; 05:6AC3 $50
    push de                                       ;; 05:6AC4 $D5
    ld   hl, wEntitiesPositionXHistoryTable       ;; 05:6AC5 $21 $00 $D0
    add  hl, de                                   ;; 05:6AC8 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:6AC9 $F0 $D7
    sub  c                                        ;; 05:6ACB $91
    and  $3F                                      ;; 05:6ACC $E6 $3F
    ld   e, a                                     ;; 05:6ACE $5F
    ld   d, b                                     ;; 05:6ACF $50
    add  hl, de                                   ;; 05:6AD0 $19
    ld   a, [hl]                                  ;; 05:6AD1 $7E
    ldh  [hActiveEntityPosX], a                   ;; 05:6AD2 $E0 $EE
    pop  de                                       ;; 05:6AD4 $D1
    ld   hl, wEntitiesPositionYHistoryTable       ;; 05:6AD5 $21 $00 $D1
    add  hl, de                                   ;; 05:6AD8 $19
    ldh  a, [hMultiPurpose0]                      ;; 05:6AD9 $F0 $D7
    sub  c                                        ;; 05:6ADB $91
    and  $3F                                      ;; 05:6ADC $E6 $3F
    ld   e, a                                     ;; 05:6ADE $5F
    ld   d, b                                     ;; 05:6ADF $50
    add  hl, de                                   ;; 05:6AE0 $19
    ld   a, [hl]                                  ;; 05:6AE1 $7E
    ldh  [hActiveEntityVisualPosY], a             ;; 05:6AE2 $E0 $EC
    pop  bc                                       ;; 05:6AE4 $C1
    ld   a, $04                                   ;; 05:6AE5 $3E $04
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:6AE7 $E0 $F1
    ld   de, DodongoSnakeSpriteVariants           ;; 05:6AE9 $11 $24 $6A
    call RenderActiveEntitySpritesPair            ;; 05:6AEC $CD $C0 $3B
    ld   hl, wEntitiesSpriteVariantTable          ;; 05:6AEF $21 $B0 $C3
    add  hl, bc                                   ;; 05:6AF2 $09
    ld   a, [hl]                                  ;; 05:6AF3 $7E
    ldh  [hActiveEntitySpriteVariant], a          ;; 05:6AF4 $E0 $F1
    ret                                           ;; 05:6AF6 $C9

DodongoSnakeFullbodySpriteVariants::
; Right
.variant0
    db   $00, $00, $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $00, $08, $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $00, $F3, $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $FB, $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Left
.variant1
    db   $00, $00, $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $08, $66, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $0D, $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $15, $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Up
.variant2
    db   $00, $00, $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $08, $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $0D, $00, $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $0D, $08, $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Down
.variant3
    db   $00, $00, $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $08, $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $F3, $00, $68, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F3, $08, $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

DodongoSnakeVeryExplodedSpriteVariants::
; Right
.variant0
    db   $00, $04, $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $00, $0C, $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $EC, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F8, $F4, $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F8, $FC, $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $04, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $EC, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $08, $F4, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $08, $FC, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $08, $04, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
; Left
.variant1
    db   $00, $FC, $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $04, $66, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F8, $04, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F8, $0C, $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $F8, $14, $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $F8, $1C, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $08, $04, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $08, $0C, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $08, $14, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $08, $1C, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
; Up
.variant2
    db   $04, $F8, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $04, $00, $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $04, $08, $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $04, $10, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $14, $F8, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $14, $00, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $14, $08, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $14, $10, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $FC, $00, $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FC, $08, $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Down
.variant3
    db   $04, $00, $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $04, $08, $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $EC, $F8, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $EC, $00, $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $EC, $08, $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $EC, $10, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $FC, $F8, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $FC, $00, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $FC, $08, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $FC, $10, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP

DodongoSnakeModeratelyExplodedSpriteVariants::
; Right
.variant0
    db   $00, $02, $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $00, $0A, $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $FB, $EF, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FB, $F7, $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FB, $F9, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $FB, $01, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $05, $EF, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $05, $F7, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $05, $F9, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $05, $01, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
; Left
.variant1
    db   $00, $FE, $64, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $00, $02, $66, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FB, $07, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FB, $0F, $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FB, $11, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $FB, $19, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $05, $07, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $05, $0F, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $05, $11, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $05, $19, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
; Up
.variant2
    db   $07, $FB, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $07, $03, $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $07, $05, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $07, $0D, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $11, $FB, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $11, $03, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $11, $05, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $11, $0D, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $FE, $00, $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $FE, $08, $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
; Down
.variant3
    db   $02, $00, $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $02, $08, $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $EF, $FB, $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $EF, $03, $6E, OAM_GBC_PAL_0 | OAMF_PAL0
    db   $EF, $05, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $EF, $0D, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db   $F9, $FB, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $F9, $03, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_YFLIP
    db   $F9, $05, $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
    db   $F9, $0D, $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP

RenderDodongoSnakeFullbody:
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 05:6C77 $21 $00 $C3
    add  hl, bc                                   ;; 05:6C7A $09
    ld   a, [hl]                                  ;; 05:6C7B $7E
    cp   $08                                      ;; 05:6C7C $FE $08
    jr   c, .notExploded                          ;; 05:6C7E $38 $2E

    cp   $28                                      ;; 05:6C80 $FE $28
    jr   nc, .notExploded                         ;; 05:6C82 $30 $2A

    ; If 0x08 <= private countdown 2 < 0x28
    ld   hl, DodongoSnakeModeratelyExplodedSpriteVariants ;; 05:6C84 $21 $D7 $6B
    cp   $0E                                      ;; 05:6C87 $FE $0E
    jr   c, .exploded                             ;; 05:6C89 $38 $07

    cp   $22                                      ;; 05:6C8B $FE $22
    jr   nc, .exploded                            ;; 05:6C8D $30 $03

    ; If 0x0E <= private countdown 2 < 0x22
    ld   hl, DodongoSnakeVeryExplodedSpriteVariants ;; 05:6C8F $21 $37 $6B

.exploded
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:6C92 $F0 $F1
    ld   e, a                                     ;; 05:6C94 $5F
    ld   d, b                                     ;; 05:6C95 $50
    sla  e                                        ;; 05:6C96 $CB $23
    sla  e                                        ;; 05:6C98 $CB $23
    sla  e                                        ;; 05:6C9A $CB $23
    ld   a, e                                     ;; 05:6C9C $7B
    sla  e                                        ;; 05:6C9D $CB $23
    sla  e                                        ;; 05:6C9F $CB $23
    add  e                                        ;; 05:6CA1 $83
    ld   e, a                                     ;; 05:6CA2 $5F
    add  hl, de                                   ;; 05:6CA3 $19
    ld   c, $0A                                   ;; 05:6CA4 $0E $0A
    call RenderActiveEntitySpritesRect            ;; 05:6CA6 $CD $E6 $3C
    ld   a, $08                                   ;; 05:6CA9 $3E $08
    jp   func_015_7964_trampoline                 ;; 05:6CAB $C3 $A0 $3D

.notExploded
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:6CAE $F0 $F1
    rla                                           ;; 05:6CB0 $17
    rla                                           ;; 05:6CB1 $17
    rla                                           ;; 05:6CB2 $17
    rla                                           ;; 05:6CB3 $17
    and  $F0                                      ;; 05:6CB4 $E6 $F0
    ld   e, a                                     ;; 05:6CB6 $5F
    ld   d, b                                     ;; 05:6CB7 $50
    ld   hl, DodongoSnakeFullbodySpriteVariants   ;; 05:6CB8 $21 $F7 $6A
    add  hl, de                                   ;; 05:6CBB $19
    ld   c, $04                                   ;; 05:6CBC $0E $04
    call RenderActiveEntitySpritesRect            ;; 05:6CBE $CD $E6 $3C
    ld   a, $02                                   ;; 05:6CC1 $3E $02
    jp   func_015_7964_trampoline                 ;; 05:6CC3 $C3 $A0 $3D
