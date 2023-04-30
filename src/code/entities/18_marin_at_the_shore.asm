MarinAtTheShoreEntityHandler::
    ld   a, [wIsMarinFollowingLink]               ; $618A: $FA $73 $DB
    and  a                                        ; $618D: $A7
    jp   nz, MarinAsFollowerHandler               ; $618E: $C2 $E8 $59

    ld   a, [wIsMarinInAnimalVillage]             ; $6191: $FA $74 $DB
    and  a                                        ; $6194: $A7
    ret  nz                                       ; $6195: $C0

    ld   a, [wOverworldRoomStatus + $FD]          ; $6196: $FA $FD $D8
    and  OW_ROOM_STATUS_OWL_TALKED                ; $6199: $E6 $20
    jp   nz, ClearEntityStatusBank18              ; $619B: $C2 $08 $7F

    ld   a, [wTradeSequenceItem]                  ; $619E: $FA $0E $DB
    cp   TRADING_ITEM_PINEAPPLE                   ; $61A1: $FE $07
    jp   c, ClearEntityStatusBank18               ; $61A3: $DA $08 $7F

    ld   de, MarinAtTalTalAndInStoreSpriteVariants ; $61A6: $11 $B7 $5E
    call RenderActiveEntitySpritesPair            ; $61A9: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $61AC: $FA $24 $C1
    and  a                                        ; $61AF: $A7
    ret  nz                                       ; $61B0: $C0

    call PushLinkOutOfEntity_18                   ; $61B1: $CD $36 $7D
    ld   a, [wGameplayType]                       ; $61B4: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $61B7: $FE $0B
    ret  nz                                       ; $61B9: $C0

    ld   a, [wTransitionSequenceCounter]          ; $61BA: $FA $6B $C1
    cp   $04                                      ; $61BD: $FE $04
    ret  nz                                       ; $61BF: $C0

    ldh  a, [hActiveEntityState]                  ; $61C0: $F0 $F0
    JP_TABLE                                      ; $61C2
._00 dw MarinAtTheShoreTransitionHandler
._01 dw MarinAtTheShoreState1Handler
._02 dw MarinAtTheShoreState2Handler
._03 dw MarinAtTheShoreState3Handler
._04 dw MarinAtTheShoreState4Handler
._05 dw MarinAtTheShoreState5Handler
._06 dw MarinAtTheShoreState6Handler

MarinAtTheShoreTransitionHandler::
    ld   a, MUSIC_MARIN_ON_BEACH                  ; $61D1: $3E $4D
    ld   [wMusicTrackToPlay], a                   ; $61D3: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $61D6: $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ; $61D8: $E0 $BD
    jp   IncrementEntityState                     ; $61DA: $C3 $12 $3B

MarinAtTheShoreState1Handler::
    ld   a, [wDialogState]                        ; $61DD: $FA $9F $C1
    and  a                                        ; $61E0: $A7
    ret  nz                                       ; $61E1: $C0

    call func_018_7EC2                            ; $61E2: $CD $C2 $7E
    add  $14                                      ; $61E5: $C6 $14
    cp   $28                                      ; $61E7: $FE $28
    ret  nc                                       ; $61E9: $D0

    ld   a, $01                                   ; $61EA: $3E $01
    ld   [wC167], a                               ; $61EC: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $61EF: $CD $05 $0C
    ld   [hl], $18                                ; $61F2: $36 $18
    jp   IncrementEntityState                     ; $61F4: $C3 $12 $3B

MarinAtTheShoreState2Handler::
    ld   a, [wDialogState]                        ; $61F7: $FA $9F $C1
    and  a                                        ; $61FA: $A7
    ret  nz                                       ; $61FB: $C0

    call GetEntityTransitionCountdown             ; $61FC: $CD $05 $0C
    jr   nz, .jr_6209                             ; $61FF: $20 $08

    call_open_dialog Dialog1D5 ; "Want to talk a while?" ; $6201
    call IncrementEntityState                     ; $6206: $CD $12 $3B

.jr_6209
    ld   e, $02                                   ; $6209: $1E $02
    cp   $0C                                      ; $620B: $FE $0C
    jr   c, .jr_6211                              ; $620D: $38 $02

    ld   e, $04                                   ; $620F: $1E $04

.jr_6211
    ld   a, e                                     ; $6211: $7B
    jp   SetEntitySpriteVariant                   ; $6212: $C3 $0C $3B

MarinAtTheShoreState3Handler::
    ld   a, [wDialogState]                        ; $6215: $FA $9F $C1
    and  a                                        ; $6218: $A7
    ret  nz                                       ; $6219: $C0

    call IncrementEntityState                     ; $621A: $CD $12 $3B
    ld   a, [wDialogAskSelectionIndex]            ; $621D: $FA $77 $C1
    and  a                                        ; $6220: $A7
    jr   nz, .playerDoesntWantToTalk              ; $6221: $20 $1A

    ; Player accepts to talk with Marin on the beach:
    ; start the "Marin Beach" cutscene.
    ld   [hl], $06                                ; $6223: $36 $06
    xor  a                                        ; $6225: $AF
    ld   [wTransitionSequenceCounter], a          ; $6226: $EA $6B $C1
    ld   [wC16C], a                               ; $6229: $EA $6C $C1
    ld   [wActivePowerUp], a                      ; $622C: $EA $7C $D4
    ld   [wGameplaySubtype], a                    ; $622F: $EA $96 $DB
    ld   a, GAMEPLAY_MARIN_BEACH                  ; $6232: $3E $09
    ld   [wGameplayType], a                       ; $6234: $EA $95 $DB
    ld   a, MUSIC_MARIN_BEACH_TALK                ; $6237: $3E $4E
    ld   [wMusicTrackToPlay], a                   ; $6239: $EA $68 $D3
    ret                                           ; $623C: $C9

.playerDoesntWantToTalk
    xor  a                                        ; $623D: $AF
    ld   [wC167], a                               ; $623E: $EA $67 $C1
    jp_open_dialog Dialog1D6 ; "I'll just watch the waves" ; $6241

MarinAtTheShoreState4Handler::
    ld   a, [wDialogState]                        ; $6246: $FA $9F $C1
    and  a                                        ; $6249: $A7
    ret  nz                                       ; $624A: $C0

    call GetEntityTransitionCountdown             ; $624B: $CD $05 $0C
    ld   [hl], $60                                ; $624E: $36 $60
    jp   IncrementEntityState                     ; $6250: $C3 $12 $3B

MarinAtTheShoreState5Handler::
    call GetEntityTransitionCountdown             ; $6253: $CD $05 $0C
    jr   nz, .jr_625B                             ; $6256: $20 $03

    call IncrementEntityState                     ; $6258: $CD $12 $3B

.jr_625B
    ld   e, $00                                   ; $625B: $1E $00
    cp   $54                                      ; $625D: $FE $54
    jr   c, .jr_6263                              ; $625F: $38 $02

    ld   e, $04                                   ; $6261: $1E $04

.jr_6263
    ld   a, e                                     ; $6263: $7B
    jp   SetEntitySpriteVariant                   ; $6264: $C3 $0C $3B

MarinAtTheShoreState6Handler::
    ret                                           ; $6267: $C9
