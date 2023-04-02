; Sprite attributes
Data_018_4928::
    db   $F0, $00, $70, $01, $F0, $08, $72, $01, $00, $00, $74, $01, $00, $08, $76, $01

MermaidStatueEntityHandler::
    ld   hl, Data_018_4928                        ; $4938: $21 $28 $49
    ld   c, $04                                   ; $493B: $0E $04
    call RenderActiveEntitySpritesRect            ; $493D: $CD $E6 $3C
    ldh  a, [hActiveEntityState]                  ; $4940: $F0 $F0
    JP_TABLE                                      ; $4942
._00 dw MermaidStatueInitHandler
._01 dw MermaidStatueInteractiveHandler
._02 dw MermaidStatueOpeningHandler

MermaidStatueInitHandler::
    ldh  a, [hRoomStatus]                         ; $4949: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $494B: $E6 $20
    jr   z, .statueMovedEnd                       ; $494D: $28 $08

    ld   hl, wEntitiesPosXTable                   ; $494F: $21 $00 $C2
    add  hl, bc                                   ; $4952: $09
    ld   a, [hl]                                  ; $4953: $7E
    sub  $10                                      ; $4954: $D6 $10
    ld   [hl], a                                  ; $4956: $77
.statueMovedEnd

    jp   IncrementEntityState                     ; $4957: $C3 $12 $3B

MermaidStatueInteractiveHandler::
    call PushLinkOutOfEntity_18                   ; $495A: $CD $36 $7D
    ld   a, [wExchangingTradeSequenceItem]        ; $495D: $FA $7F $DB
    and  a                                        ; $4960: $A7
    ret  nz                                       ; $4961: $C0

    call func_018_7D95                            ; $4962: $CD $95 $7D
    ret  nc                                       ; $4965: $D0

    ld   a, [wTradeSequenceItem]                  ; $4966: $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ; $4969: $FE $0E
    ret  z                                        ; If you have the magnifying lens, return

    cp   TRADING_ITEM_SCALE                       ; $496C: $FE $0D
    jr   nz, .alreadyHasMagnifyingLens

    ; If the player has the Mermaid Scale, move the statue and open the passage
    ld   a, TRADING_ITEM_MAGNIFYING_LENS          ; $4970: $3E $0E
    ld   [wTradeSequenceItem], a                  ; $4972: $EA $0E $DB
    ld   a, $01                                   ; $4975: $3E $01
    ld   [wExchangingTradeSequenceItem], a        ; $4977: $EA $7F $DB
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $497A: $3E $04
    ldh  [hNoiseSfx], a                           ; $497C: $E0 $F4
    call GetEntityTransitionCountdown             ; $497E: $CD $05 $0C
    ld   [hl], $60                                ; $4981: $36 $60
    call SetRoomStatus20                          ; $4983: $CD $B9 $7F
    call_open_dialog Dialog116                    ; $4986

    jp   IncrementEntityState                     ; $498B: $C3 $12 $3B

.alreadyHasMagnifyingLens
    jp_open_dialog Dialog19C                      ; $498E

MermaidStatueOpeningHandler::
    ld   a, $02                                   ; $4993: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4995: $E0 $A1
    ld   [wC167], a                               ; $4997: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $499A: $CD $05 $0C
    jr   nz, .jr_49AD                             ; $499D: $20 $0E

    call IncrementEntityState                     ; $499F: $CD $12 $3B
    ld   [hl], $01                                ; $49A2: $36 $01
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $49A4: $3E $02
    ldh  [hJingle], a                             ; $49A6: $E0 $F2
    xor  a                                        ; $49A8: $AF
    ld   [wC167], a                               ; $49A9: $EA $67 $C1
    ret                                           ; $49AC: $C9

.jr_49AD
    cp   $40                                      ; $49AD: $FE $40
    jr   nz, .jr_49B6                             ; $49AF: $20 $05

    ld   hl, hNoiseSfx                            ; $49B1: $21 $F4 $FF
    ld   [hl], NOISE_SFX_RUMBLE                   ; $49B4: $36 $11

.jr_49B6
    ret  nc                                       ; $49B6: $D0

    ld   hl, wEntitiesSpeedXTable                 ; $49B7: $21 $40 $C2
    add  hl, bc                                   ; $49BA: $09
    ld   [hl], -4                                 ; $49BB: $36 $FC
    jp   AddEntitySpeedToPos_18                   ; $49BD: $C3 $6C $7E
