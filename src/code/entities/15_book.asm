Data_015_7E55:
    db   $58, $00

Data_015_7E57:
    db   $58, $01

Data_015_7E59:
    db   $58, $02

Data_015_7E5B:
    db   $58, $03

Data_015_7E5D:
    db   $58, $01

Data_015_7E5F::
    dw   Data_015_7E55
    dw   Data_015_7E57
    dw   Data_015_7E59
    dw   Data_015_7E5B
    dw   Data_015_7E59
    dw   Data_015_7E5B
    dw   Data_015_7E55

BookSpriteVariants::
    dw   Data_015_7E5D

Data_015_7E6F::
    db   $58, $00, $5A, $00, $5A, $20

BookEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:7E75 $F0 $F1
    and  a                                        ;; 15:7E77 $A7
    jr   z, .jr_7E82                              ;; 15:7E78 $28 $08

    ld   de, BookSpriteVariants                   ;; 15:7E7A $11 $6D $7E
    call RenderActiveEntitySpritesPair            ;; 15:7E7D $CD $C0 $3B
    jr   jr_015_7EA6                              ;; 15:7E80 $18 $24

.jr_7E82
    ldh  a, [hIsGBC]                              ;; 15:7E82 $F0 $FE
    and  a                                        ;; 15:7E84 $A7
    jr   z, jr_015_7EA0                           ;; 15:7E85 $28 $19

    push bc                                       ;; 15:7E87 $C5
    ld   hl, Data_015_7E5F                        ;; 15:7E88 $21 $5F $7E
    ldh  a, [hMapRoom]                            ;; 15:7E8B $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 15:7E8D $FE $B5
    jr   z, .jr_7E96                              ;; 15:7E8F $28 $05

    sla  c                                        ;; 15:7E91 $CB $21
    rl   b                                        ;; 15:7E93 $CB $10
    add  hl, bc                                   ;; 15:7E95 $09

.jr_7E96
    ld   a, [hl+]                                 ;; 15:7E96 $2A
    ld   e, a                                     ;; 15:7E97 $5F
    ld   a, [hl]                                  ;; 15:7E98 $7E
    ld   d, a                                     ;; 15:7E99 $57
    pop  bc                                       ;; 15:7E9A $C1
    call RenderActiveEntitySprite                 ;; 15:7E9B $CD $77 $3C
    jr   jr_015_7EA6                              ;; 15:7E9E $18 $06

jr_015_7EA0:
    ld   de, Data_015_7E6F                        ;; 15:7EA0 $11 $6F $7E
    call RenderActiveEntitySprite                 ;; 15:7EA3 $CD $77 $3C

jr_015_7EA6:
    call ReturnIfNonInteractive_15                ;; 15:7EA6 $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ;; 15:7EA9 $F0 $F0
    JP_TABLE                                      ;; 15:7EAB
._00 dw func_015_7EB9                             ;; 15:7EAC
._01 dw func_015_7F04                             ;; 15:7EAE

Data_015_7EB0::
    db   $02, $04, $06, $00, $0A, $08, $0C, $0D, $2B

func_015_7EB9::
    ld   a, [wGameplayType]                       ;; 15:7EB9 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ;; 15:7EBC $FE $07
    jr   z, .jr_7EC4                              ;; 15:7EBE $28 $04

    xor  a                                        ;; 15:7EC0 $AF
    ld   [wC5A2], a                               ;; 15:7EC1 $EA $A2 $C5

.jr_7EC4
    xor  a                                        ;; 15:7EC4 $AF
    call SetEntitySpriteVariant                   ;; 15:7EC5 $CD $0C $3B
    call ShouldLinkTalkToEntity_15                ;; 15:7EC8 $CD $BC $7A
    ret  nc                                       ;; 15:7ECB $D0

    ldh  a, [hMapRoom]                            ;; 15:7ECC $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 15:7ECE $FE $B5
    jr   nz, .jr_7ED6                             ;; 15:7ED0 $20 $04

    ld   e, $08                                   ;; 15:7ED2 $1E $08
    jr   jr_015_7EF3                              ;; 15:7ED4 $18 $1D

.jr_7ED6
    ld   e, $00                                   ;; 15:7ED6 $1E $00
    ldh  a, [hActiveEntityPosX]                   ;; 15:7ED8 $F0 $EE
    cp   $20                                      ;; 15:7EDA $FE $20
    jr   c, .jr_7EE9                              ;; 15:7EDC $38 $0B

    inc  e                                        ;; 15:7EDE $1C
    cp   $40                                      ;; 15:7EDF $FE $40
    jr   c, .jr_7EE9                              ;; 15:7EE1 $38 $06

    inc  e                                        ;; 15:7EE3 $1C
    cp   $70                                      ;; 15:7EE4 $FE $70
    jr   c, .jr_7EE9                              ;; 15:7EE6 $38 $01

    inc  e                                        ;; 15:7EE8 $1C

.jr_7EE9
    ldh  a, [hActiveEntityPosY]                   ;; 15:7EE9 $F0 $EF
    cp   $40                                      ;; 15:7EEB $FE $40
    jr   c, jr_015_7EF3                           ;; 15:7EED $38 $04

    ld   a, e                                     ;; 15:7EEF $7B
    add  $04                                      ;; 15:7EF0 $C6 $04
    ld   e, a                                     ;; 15:7EF2 $5F

jr_015_7EF3:
    ld   d, b                                     ;; 15:7EF3 $50
    ld   hl, Data_015_7EB0                        ;; 15:7EF4 $21 $B0 $7E
    add  hl, de                                   ;; 15:7EF7 $19
    ld   a, [hl]                                  ;; 15:7EF8 $7E
    ld   hl, wEntitiesPrivateState1Table          ;; 15:7EF9 $21 $B0 $C2
    add  hl, bc                                   ;; 15:7EFC $09
    ld   [hl], a                                  ;; 15:7EFD $77
    call OpenDialogInTable2                       ;; 15:7EFE $CD $7C $23
    jp   IncrementEntityState                     ;; 15:7F01 $C3 $12 $3B

func_015_7F04::
    ld   a, $01                                   ;; 15:7F04 $3E $01
    call SetEntitySpriteVariant                   ;; 15:7F06 $CD $0C $3B
    ld   a, [wDialogState]                        ;; 15:7F09 $FA $9F $C1
    and  a                                        ;; 15:7F0C $A7
    ret  nz                                       ;; 15:7F0D $C0

    call IncrementEntityState                     ;; 15:7F0E $CD $12 $3B
    ld   [hl], b                                  ;; 15:7F11 $70
    ld   a, [wDialogAskSelectionIndex]            ;; 15:7F12 $FA $77 $C1
    and  a                                        ;; 15:7F15 $A7
    jr   nz, jr_015_7F82                          ;; 15:7F16 $20 $6A

    ld   hl, wEntitiesPrivateState1Table          ;; 15:7F18 $21 $B0 $C2
    add  hl, bc                                   ;; 15:7F1B $09
    ld   a, [hl]                                  ;; 15:7F1C $7E
    inc  a                                        ;; 15:7F1D $3C
    ld   e, a                                     ;; 15:7F1E $5F
    cp   $0E                                      ;; 15:7F1F $FE $0E
    jr   nz, jr_015_7F4F                          ;; 15:7F21 $20 $2C

    ld   a, [wTradeSequenceItem]                  ;; 15:7F23 $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 15:7F26 $FE $0E
    jr   nz, jr_015_7F4F                          ;; 15:7F28 $20 $25

    ld   a, [wExchangingTradeSequenceItem]        ;; 15:7F2A $FA $7F $DB
    and  a                                        ;; 15:7F2D $A7
    jr   nz, jr_015_7F4F                          ;; 15:7F2E $20 $1F

    ldh  a, [hRoomStatus]                         ;; 15:7F30 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 15:7F32 $E6 $20
    jr   nz, .jr_7F44                             ;; 15:7F34 $20 $0E

    call func_015_7CDB                            ;; 15:7F36 $CD $DB $7C
    call GetRandomByte                            ;; 15:7F39 $CD $0D $28
    rla                                           ;; 15:7F3C $17
    rla                                           ;; 15:7F3D $17
    rla                                           ;; 15:7F3E $17
    and  $18                                      ;; 15:7F3F $E6 $18
    ld   [wWindFishEggMazeSequenceOffset], a      ;; 15:7F41 $EA $7C $DB

.jr_7F44
    ld   a, [wWindFishEggMazeSequenceOffset]      ;; 15:7F44 $FA $7C $DB
    rra                                           ;; 15:7F47 $1F
    rra                                           ;; 15:7F48 $1F
    rra                                           ;; 15:7F49 $1F
    and  $03                                      ;; 15:7F4A $E6 $03
    add  $17                                      ;; 15:7F4C $C6 $17
    ld   e, a                                     ;; 15:7F4E $5F

jr_015_7F4F:
    ldh  a, [hMapRoom]                            ;; 15:7F4F $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 15:7F51 $FE $B5
    jr   z, jr_015_7F72                           ;; 15:7F53 $28 $1D

    ld   a, e                                     ;; 15:7F55 $7B
    cp   $0D                                      ;; 15:7F56 $FE $0D
    jr   nz, .jr_7F6F                             ;; 15:7F58 $20 $15

    xor  a                                        ;; 15:7F5A $AF
    ld   [wTransitionSequenceCounter], a          ;; 15:7F5B $EA $6B $C1
    ld   [wC16C], a                               ;; 15:7F5E $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 15:7F61 $EA $96 $DB
    ld   a, GAMEPLAY_WORLD_MAP                    ;; 15:7F64 $3E $07
    ld   [wGameplayType], a                       ;; 15:7F66 $EA $95 $DB
    ld   a, $01                                   ;; 15:7F69 $3E $01
    ld   [wC5A2], a                               ;; 15:7F6B $EA $A2 $C5
    ret                                           ;; 15:7F6E $C9

.jr_7F6F
    jp   OpenDialogInTable2                       ;; 15:7F6F $C3 $7C $23

jr_015_7F72:
    xor  a                                        ;; 15:7F72 $AF
    ld   [wTransitionSequenceCounter], a          ;; 15:7F73 $EA $6B $C1
    ld   [wC16C], a                               ;; 15:7F76 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 15:7F79 $EA $96 $DB
    ld   a, GAMEPLAY_PHOTO_ALBUM                  ;; 15:7F7C $3E $0D
    ld   [wGameplayType], a                       ;; 15:7F7E $EA $95 $DB
    ret                                           ;; 15:7F81 $C9

jr_015_7F82:
    xor  a                                        ;; 15:7F82 $AF
    jp   SetEntitySpriteVariant                   ;; 15:7F83 $C3 $0C $3B
