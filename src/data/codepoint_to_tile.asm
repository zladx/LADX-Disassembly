;
; Map codepoints (bytes of text as stored in the ROM)
;         from `constants/charmaps/dialog.asm`
;           to `gfx/fonts/font.png`
;
; See: DialogCharmap, CodepointToDiacritic
;
CodepointToTileMap::
;
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0
;
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0
;             !    "    #    $    %    &    '    (    )    *    +    ,    -    .2   /
    db  $7e, $3d, $41, 0  , $8a, $8b, $44, $40, $45, $46, $8c, $8d, $3a, $3f, $3b, 0
;        0    1    2    3    4    5    6    7    8    9    :    ;    <    =    >    ?
    db  $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $42, $43, $8e, 0  , $8f, $3c
;        @    A    B    C    D    E    F    G    H    I    J    K    L    M    N    O
    db  0  , 0  , $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e
;        P    Q    R    S    T    U    V    W    X    Y    Z    [    \    ]    ^    _
    db  $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, 0  , 0  , 0  , $40, 0
;        `    a    b    c    d    e    f    g    h    i    j    k    l    m    n    o
    db  0  , $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28
;        p    q    r    s    t    u    v    w    x    y    z    {    |    }    ~
    db  $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $3e, 0  , 0  , 0  , 0  , 0
;        à    â    ä    è    é    ê    ù    û    ü    ô    ö    ç    î
    db  $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53, $59, $5a, $5b
;
    db  $5c, $5d, $59, $5a, $5b, $5c, $5d, $32, $6f, $6d, $6e, 0  , 0  , 0  , 0  , 0
;        !    ?    -  BLANK  .    ,    .2   ?    !
    db  $3d, $3c, $3f, $7e, $39, $3a, $3b, $7a, $7b, 0  , 0  , 0  , 0  , 0  , 0  , 0
;        0    1    2    3    4    5    6    7    8    9
    db  $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $9b, $9c, $9d, $9e, $9f, $38
;
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0
;        A2  B2   C2   D2   E2   F2   DPAD LTTR YOSH HIBS FOOT (X)  SKUL LINK MARN TARN
    db  $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f
;       YOSH BOW  CAN  BANA STCK BEEH PINE BROM HOOK BRA  SCAL GLAS      LTTR DPAD
    db  $88, $90, $91, $92, $93, $94, $95, $89, $96, $97, $98, $99, $9a, $87, $86, 0
;        UP  DOWN LEFT RIGHT                                            BLANK
    db  $34, $35, $36, $37, 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , $7e, 0  , 0
