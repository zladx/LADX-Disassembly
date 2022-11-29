;
; Map codepoints (bytes of text as stored in the ROM)
;         from `F0/src/constants/charmaps/dialog.asm`
;           to `F0/src/gfx/fonts/font.png`
;
; See: DialogCharmap, CodepointToDiacritic
;
CodepointToTileMap::
;
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0
;
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0
;             !    "         â    à    &    '    (    )    é    è    ,    -    .    î
    db  $7E, $3D, $41, 0  , $48, $47, $44, $40, $45, $46, $4B, $4A, $3A, $3F, $3B, $53
;        0    1    2    3    4    5    6    7    8    9    :    #    ê    ù    >    ?
    db  $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $42, $43, $4C, $4D, $55, $3C
;        Ç    A    B    C    D    E    F    G    H    I    J    K    L    M    N    O
    db  $57, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E
;        P    Q    R    S    T    U    V    W    X    Y    Z    ï    û    ô    '    ç
    db  $0F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $56, $4E, $50, $40, $52
;             a    b    c    d    e    f    g    h    i    j    k    l    m    n    o
    db  0  , $1A, $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28
;        p    q    r    s    t    u    v    w    x    y    z       STAR   Ó         +
    db  $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $32, $3E, 0  , $58, $0E, 0  , 0
;        à    â    ä    è    é    ê    ù    û    ü    ô    ö    ç    î
    db  $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $59, $5A, $5B
;
    db  $5C, $5D, $59, $5A, $5B, $5C, $5D, $32, $6F, $6D, $6E, 0  , 0  , 0  , 0  , 0
;        !    ?    -  BLANK  .    ,    .2   ?    !                        ;  TRI1  TRI2
    db  $3D, $3C, $3F, $7E, $39, $3A, $3B, $7A, $7B, 0  , 0  , 0  , 0  , $6D, $6B, $6C
;        0    1    2    3    4    5    6    7    8    9
    db  $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $9B, $9C, $9D, $9E, $9F, $38
;                                                                              É  HEART
    db  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , $04, $8F
;        A2  B2   C2   D2   E2   F2   DPAD LTTR YOSH HIBS FOOT (X)  SKUL LINK MARN TARN
    db  $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F
;       YOSH BOW  CAN  BANA STCK BEEH PINE BROM HOOK BRA  SCAL GLAS      LTTR DPAD  /
    db  $88, $90, $91, $92, $93, $94, $95, $89, $96, $97, $98, $99, $9A, $87, $86, $5A
;        UP  DOWN LEFT RIGHT                                            BLANK
    db  $34, $35, $36, $37, 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , 0  , $7E, 0  , 0
