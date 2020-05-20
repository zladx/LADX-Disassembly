Kid70EntityHandler::
Kid73EntityHandler::
    ldh  a, [hMapRoom]                            ; $620E: $F0 $F6
    cp   $92                                      ; $6210: $FE $92
    jr   nz, jr_006_621C                          ; $6212: $20 $08

    ld   a, [wTradeSequenceItem]                  ; $6214: $FA $0E $DB
    cp   $07                                      ; $6217: $FE $07
    jp   c, ClearEntityStatus_06                         ; $6219: $DA $DB $65

jr_006_621C:
    ld   de, Data_006_604D                        ; $621C: $11 $4D $60
    call RenderActiveEntitySpritesPair            ; $621F: $CD $C0 $3B
    call func_006_64C6                            ; $6222: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $6225: $F0 $E7
    rra                                           ; $6227: $1F
    rra                                           ; $6228: $1F
    rra                                           ; $6229: $1F
    rra                                           ; $622A: $1F
    and  $01                                      ; $622B: $E6 $01
    call SetEntitySpriteVariant                   ; $622D: $CD $0C $3B

func_006_6230::
    ldh  a, [hActiveEntityPosY]                   ; $6230: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $6232: $E0 $EC
    call func_006_641A                            ; $6234: $CD $1A $64
    call CopyEntityPositionToActivePosition       ; $6237: $CD $8A $3D
    call func_006_645D                            ; $623A: $CD $5D $64
    ret  nc                                       ; $623D: $D0

    ld   a, [wTradeSequenceItem]                  ; $623E: $FA $0E $DB
    cp   $0A                                      ; $6241: $FE $0A
    jr   nz, jr_006_624F                          ; $6243: $20 $0A

    ld   a, [wHasInstrument5]                     ; $6245: $FA $69 $DB
    and  $02                                      ; $6248: $E6 $02
    ld   a, $6F                                   ; $624A: $3E $6F
    jp   nz, OpenDialogInTable1                   ; $624C: $C2 $73 $23

jr_006_624F:
    ld   a, [$DB74]                               ; $624F: $FA $74 $DB
    and  a                                        ; $6252: $A7
    jr   z, jr_006_625A                           ; $6253: $28 $05

    jp_open_dialog $123                           ; $6255

jr_006_625A:
    ld   a, [wIsMarinFollowingLink]               ; $625A: $FA $73 $DB
    and  a                                        ; $625D: $A7
    jr   z, jr_006_6265                           ; $625E: $28 $05

    jp_open_dialog $121                           ; $6260

jr_006_6265:
    ldh  a, [hMapRoom]                            ; $6265: $F0 $F6
    cp   $92                                      ; $6267: $FE $92
    jr   nz, jr_006_6277                          ; $6269: $20 $0C

    ld   a, [wOverworldRoomStatus + $FD]                               ; $626B: $FA $FD $D8
    and  $30                                      ; $626E: $E6 $30
    jr   nz, jr_006_6277                          ; $6270: $20 $05

    jp_open_dialog $120                           ; $6272

jr_006_6277:
    ld   a, [wHasInstrument2]                     ; $6277: $FA $66 $DB
    and  $02                                      ; $627A: $E6 $02
    jr   z, jr_006_6290                           ; $627C: $28 $12

    ld   a, [wIndoorBRoomStatus + $BE]                               ; $627E: $FA $BE $DA
    and  $10                                      ; $6281: $E6 $10
    jr   nz, jr_006_6290                          ; $6283: $20 $0B

    ldh  a, [hMapRoom]                            ; $6285: $F0 $F6
    cp   $83                                      ; $6287: $FE $83
    jr   nz, jr_006_6290                          ; $6289: $20 $05

    jp_open_dialog $122                           ; $628B

jr_006_6290:
    ld   hl, $DB7E                                ; $6290: $21 $7E $DB
    ld   a, [hl]                                  ; $6293: $7E
    push af                                       ; $6294: $F5
    inc  a                                        ; $6295: $3C
    cp   $04                                      ; $6296: $FE $04
    jr   nz, jr_006_629B                          ; $6298: $20 $01

    xor  a                                        ; $629A: $AF

jr_006_629B:
    ld   [hl], a                                  ; $629B: $77
    ld   a, [wHasInstrument1]                     ; $629C: $FA $65 $DB
    and  $02                                      ; $629F: $E6 $02
    jr   nz, jr_006_62A9                          ; $62A1: $20 $06

    pop  af                                       ; $62A3: $F1
    add  $18                                      ; $62A4: $C6 $18
    jp   OpenDialogInTable1                       ; $62A6: $C3 $73 $23

jr_006_62A9:
    pop  af                                       ; $62A9: $F1
    ldh  a, [hActiveEntityType]                   ; $62AA: $F0 $EB
    sub  ENTITY_KID_70                            ; $62AC: $D6 $70
    add  $1C                                      ; $62AE: $C6 $1C
    jp   OpenDialogInTable1                       ; $62B0: $C3 $73 $23
