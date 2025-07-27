Kid70EntityHandler::
Kid73EntityHandler::
    ldh  a, [hMapRoom]                            ;; 06:620E $F0 $F6
    cp   ROOM_OW_MABE_VILLAGE_SQUARE              ;; 06:6210 $FE $92
    jr   nz, .jr_621C                             ;; 06:6212 $20 $08

    ld   a, [wTradeSequenceItem]                  ;; 06:6214 $FA $0E $DB
    cp   $07                                      ;; 06:6217 $FE $07
    jp   c, ClearEntityStatus_06                  ;; 06:6219 $DA $DB $65

.jr_621C
    ld   de, Kid71SpriteVariants                  ;; 06:621C $11 $4D $60
    call RenderActiveEntitySpritesPair            ;; 06:621F $CD $C0 $3B
    call ReturnIfNonInteractive_06                ;; 06:6222 $CD $C6 $64
    ldh  a, [hFrameCounter]                       ;; 06:6225 $F0 $E7
    rra                                           ;; 06:6227 $1F
    rra                                           ;; 06:6228 $1F
    rra                                           ;; 06:6229 $1F
    rra                                           ;; 06:622A $1F
    and  $01                                      ;; 06:622B $E6 $01
    call SetEntitySpriteVariant                   ;; 06:622D $CD $0C $3B

func_006_6230::
    ldh  a, [hActiveEntityPosY]                   ;; 06:6230 $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ;; 06:6232 $E0 $EC
    call PushLinkOutOfEntity_06                   ;; 06:6234 $CD $1A $64
    call CopyEntityPositionToActivePosition       ;; 06:6237 $CD $8A $3D
    call CheckLinkInteractionWithEntity_06        ;; 06:623A $CD $5D $64
    ret  nc                                       ;; 06:623D $D0

    ld   a, [wTradeSequenceItem]                  ;; 06:623E $FA $0E $DB
    cp   TRADING_ITEM_BROOM                       ;; 06:6241 $FE $0A
    jr   nz, .jr_624F                             ;; 06:6243 $20 $0A

    ld   a, [wHasInstrument5]                     ;; 06:6245 $FA $69 $DB
    and  $02                                      ;; 06:6248 $E6 $02
    ld_dialog_low a, Dialog16F ; "Grandma's not here" ;; 06:624A $3E $6F
    jp   nz, OpenDialogInTable1                   ;; 06:624C $C2 $73 $23

.jr_624F
    ld   a, [wIsMarinInAnimalVillage]             ;; 06:624F $FA $74 $DB
    and  a                                        ;; 06:6252 $A7
    jr   z, .jr_625A                              ;; 06:6253 $28 $05

    jp_open_dialog Dialog123                      ;; 06:6255

.jr_625A
    ld   a, [wIsMarinFollowingLink]               ;; 06:625A $FA $73 $DB
    and  a                                        ;; 06:625D $A7
    jr   z, .jr_6265                              ;; 06:625E $28 $05

    jp_open_dialog Dialog121                      ;; 06:6260

.jr_6265
    ldh  a, [hMapRoom]                            ;; 06:6265 $F0 $F6
    cp   ROOM_OW_MABE_VILLAGE_SQUARE              ;; 06:6267 $FE $92
    jr   nz, .jr_6277                             ;; 06:6269 $20 $0C

    ld   a, [wOverworldRoomStatus + $FD]          ;; 06:626B $FA $FD $D8
    and  OW_ROOM_STATUS_CHANGED | OW_ROOM_STATUS_OWL_TALKED ;; 06:626E $E6 $30
    jr   nz, .jr_6277                             ;; 06:6270 $20 $05

    jp_open_dialog Dialog120                      ;; 06:6272

.jr_6277
    ld   a, [wHasInstrument2]                     ;; 06:6277 $FA $66 $DB
    and  $02                                      ;; 06:627A $E6 $02
    jr   z, .jr_6290                              ;; 06:627C $28 $12

    ld   a, [wIndoorBRoomStatus + UNKNOWN_ROOM_BE] ;; 06:627E $FA $BE $DA
    and  $10                                      ;; 06:6281 $E6 $10
    jr   nz, .jr_6290                             ;; 06:6283 $20 $0B

    ldh  a, [hMapRoom]                            ;; 06:6285 $F0 $F6
    cp   UNKNOWN_ROOM_83                          ;; 06:6287 $FE $83
    jr   nz, .jr_6290                             ;; 06:6289 $20 $05

    jp_open_dialog Dialog122                      ;; 06:628B

.jr_6290
    ld   hl, wKidSaveHintIndex                    ;; 06:6290 $21 $7E $DB
    ld   a, [hl]                                  ;; 06:6293 $7E
    push af                                       ;; 06:6294 $F5
    inc  a                                        ;; 06:6295 $3C
    cp   $04                                      ;; 06:6296 $FE $04
    jr   nz, .jr_629B                             ;; 06:6298 $20 $01

    xor  a                                        ;; 06:629A $AF

.jr_629B
    ld   [hl], a                                  ;; 06:629B $77
    ld   a, [wHasInstrument1]                     ;; 06:629C $FA $65 $DB
    and  $02                                      ;; 06:629F $E6 $02
    jr   nz, .jr_62A9                             ;; 06:62A1 $20 $06

    pop  af                                       ;; 06:62A3 $F1
    add  $18 ; Dialog118 or Dialog119             ;; 06:62A4 $C6 $18
    jp   OpenDialogInTable1                       ;; 06:62A6 $C3 $73 $23

.jr_62A9
    pop  af                                       ;; 06:62A9 $F1
    ldh  a, [hActiveEntityType]                   ;; 06:62AA $F0 $EB
    sub  ENTITY_KID_70                            ;; 06:62AC $D6 $70
    add  $1C ; Dialog11C or Dialog11F             ;; 06:62AE $C6 $1C
    jp   OpenDialogInTable1                       ;; 06:62B0 $C3 $73 $23
