; Sprite attributes
Data_018_4928::
    db   $F0, $00, $70, $01, $F0, $08, $72, $01, $00, $00, $74, $01, $00, $08, $76, $01

MermaidStatueEntityHandler::
    ld   hl, Data_018_4928                        ;; 18:4938 $21 $28 $49
    ld   c, $04                                   ;; 18:493B $0E $04
    call RenderActiveEntitySpritesRect            ;; 18:493D $CD $E6 $3C
    ldh  a, [hActiveEntityState]                  ;; 18:4940 $F0 $F0
    JP_TABLE                                      ;; 18:4942
._00 dw MermaidStatueInitHandler
._01 dw MermaidStatueInteractiveHandler
._02 dw MermaidStatueOpeningHandler

MermaidStatueInitHandler::
    ldh  a, [hRoomStatus]                         ;; 18:4949 $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ;; 18:494B $E6 $20
    jr   z, .statueMovedEnd                       ;; 18:494D $28 $08

    ld   hl, wEntitiesPosXTable                   ;; 18:494F $21 $00 $C2
    add  hl, bc                                   ;; 18:4952 $09
    ld   a, [hl]                                  ;; 18:4953 $7E
    sub  $10                                      ;; 18:4954 $D6 $10
    ld   [hl], a                                  ;; 18:4956 $77
.statueMovedEnd

    jp   IncrementEntityState                     ;; 18:4957 $C3 $12 $3B

MermaidStatueInteractiveHandler::
    call PushLinkOutOfEntity_18                   ;; 18:495A $CD $36 $7D
    ld   a, [wExchangingTradeSequenceItem]        ;; 18:495D $FA $7F $DB
    and  a                                        ;; 18:4960 $A7
    ret  nz                                       ;; 18:4961 $C0

    call func_018_7D95                            ;; 18:4962 $CD $95 $7D
    ret  nc                                       ;; 18:4965 $D0

    ld   a, [wTradeSequenceItem]                  ;; 18:4966 $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 18:4969 $FE $0E
    ret  z                                        ; If you have the magnifying lens, return

    cp   TRADING_ITEM_SCALE                       ;; 18:496C $FE $0D
    jr   nz, .alreadyHasMagnifyingLens

    ; If the player has the Mermaid Scale, move the statue and open the passage
    ld   a, TRADING_ITEM_MAGNIFYING_LENS          ;; 18:4970 $3E $0E
    ld   [wTradeSequenceItem], a                  ;; 18:4972 $EA $0E $DB
    ld   a, $01                                   ;; 18:4975 $3E $01
    ld   [wExchangingTradeSequenceItem], a        ;; 18:4977 $EA $7F $DB
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ;; 18:497A $3E $04
    ldh  [hNoiseSfx], a                           ;; 18:497C $E0 $F4
    call GetEntityTransitionCountdown             ;; 18:497E $CD $05 $0C
    ld   [hl], $60                                ;; 18:4981 $36 $60
    call SetRoomStatus20                          ;; 18:4983 $CD $B9 $7F
    call_open_dialog Dialog116                    ;; 18:4986

    jp   IncrementEntityState                     ;; 18:498B $C3 $12 $3B

.alreadyHasMagnifyingLens
    jp_open_dialog Dialog19C                      ;; 18:498E

MermaidStatueOpeningHandler::
    ld   a, $02                                   ;; 18:4993 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 18:4995 $E0 $A1
    ld   [wC167], a                               ;; 18:4997 $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 18:499A $CD $05 $0C
    jr   nz, .jr_49AD                             ;; 18:499D $20 $0E

    call IncrementEntityState                     ;; 18:499F $CD $12 $3B
    ld   [hl], $01                                ;; 18:49A2 $36 $01
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 18:49A4 $3E $02
    ldh  [hJingle], a                             ;; 18:49A6 $E0 $F2
    xor  a                                        ;; 18:49A8 $AF
    ld   [wC167], a                               ;; 18:49A9 $EA $67 $C1
    ret                                           ;; 18:49AC $C9

.jr_49AD
    cp   $40                                      ;; 18:49AD $FE $40
    jr   nz, .jr_49B6                             ;; 18:49AF $20 $05

    ld   hl, hNoiseSfx                            ;; 18:49B1 $21 $F4 $FF
    ld   [hl], NOISE_SFX_RUMBLE                   ;; 18:49B4 $36 $11

.jr_49B6
    ret  nc                                       ;; 18:49B6 $D0

    ld   hl, wEntitiesSpeedXTable                 ;; 18:49B7 $21 $40 $C2
    add  hl, bc                                   ;; 18:49BA $09
    ld   [hl], -4                                 ;; 18:49BB $36 $FC
    jp   AddEntitySpeedToPos_18                   ;; 18:49BD $C3 $6C $7E
