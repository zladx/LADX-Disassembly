; Text debugger
;
; The Marin entity will replace itself with the text debugger entity
; when the player's name begins with exactly one space.
; You couldn't enter zero letters at the beginning of the name, so this
; clearly must be done with some precomposed save state.
;
; You can enter the text debugger on any map Marin is on.
;
; The text debugger will draw digits to the middle of the screen.
; Left/Right increase/decrease the ones (note that this will wrap and not increase the tens),
; while Up/Down increase/decrease the tens.
;
; Once you're done assigning this dialogue number,
; press A to display text 00XX,
; press B to display text 01XX,
; and Select to display text 02XX.
; XX is of course the digit you just entered on the screen.
;
; From https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening_(Game_Boy)#Text_Debugger

Data_018_5D7F::
    db   $00, $01, $FF

Data_018_5D82::
    db   $00, $10, $F0

TextDebuggerEntityHandler::                       ; POI: Text debugging tool
    call ReturnIfNonInteractive_18                ; $5D85: $CD $E8 $7D
    ld   a, $01                                   ; $5D88: $3E $01
    ldh  [hAnimatedTilesGroup], a                 ; $5D8A: $E0 $A4
    inc  a                                        ; $5D8C: $3C
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5D8D: $E0 $A1
    ld   [wC167], a                               ; $5D8F: $EA $67 $C1
    ldh  a, [hJoypadState]                        ; $5D92: $F0 $CC
    and  J_RIGHT | J_LEFT                         ; $5D94: $E6 $03
    ld   e, a                                     ; $5D96: $5F
    ld   d, b                                     ; $5D97: $50
    ld   hl, Data_018_5D7F                        ; $5D98: $21 $7F $5D
    add  hl, de                                   ; $5D9B: $19
    ld   a, [wTextDebuggerDialogId]               ; $5D9C: $FA $09 $C1
    push af                                       ; $5D9F: $F5
    add  [hl]                                     ; $5DA0: $86
    and  $0F                                      ; $5DA1: $E6 $0F
    ld   e, a                                     ; $5DA3: $5F
    pop  af                                       ; $5DA4: $F1
    and  $F0                                      ; $5DA5: $E6 $F0
    or   e                                        ; $5DA7: $B3
    ld   [wTextDebuggerDialogId], a               ; $5DA8: $EA $09 $C1
    ldh  a, [hJoypadState]                        ; $5DAB: $F0 $CC
    rra                                           ; $5DAD: $1F
    rra                                           ; $5DAE: $1F
    and  (J_UP | J_DOWN) >> 2                     ; $5DAF: $E6 $03
    ld   e, a                                     ; $5DB1: $5F
    ld   d, b                                     ; $5DB2: $50
    ld   hl, Data_018_5D82                        ; $5DB3: $21 $82 $5D
    add  hl, de                                   ; $5DB6: $19
    ld   a, [wTextDebuggerDialogId]               ; $5DB7: $FA $09 $C1
    add  [hl]                                     ; $5DBA: $86
    ld   [wTextDebuggerDialogId], a               ; $5DBB: $EA $09 $C1
    ld   a, [wDialogState]                        ; $5DBE: $FA $9F $C1
    and  a                                        ; $5DC1: $A7
    jr   nz, jr_018_5DDC                          ; $5DC2: $20 $18

    ldh  a, [hJoypadState]                        ; $5DC4: $F0 $CC
    and  J_A                                      ; $5DC6: $E6 $10
    jr   z, jr_018_5DD0                           ; $5DC8: $28 $06

    ld   a, [wTextDebuggerDialogId]               ; $5DCA: $FA $09 $C1
    jp   OpenDialog                               ; $5DCD: $C3 $85 $23

jr_018_5DD0:
    ldh  a, [hJoypadState]                        ; $5DD0: $F0 $CC
    and  J_B                                      ; $5DD2: $E6 $20
    jr   z, jr_018_5DDC                           ; $5DD4: $28 $06

    ld   a, [wTextDebuggerDialogId]               ; $5DD6: $FA $09 $C1
    jp   OpenDialogInTable1                       ; $5DD9: $C3 $73 $23

jr_018_5DDC:
    ldh  a, [hJoypadState]                        ; $5DDC: $F0 $CC
    and  J_SELECT                                 ; $5DDE: $E6 $40
    jr   z, jr_018_5DE8                           ; $5DE0: $28 $06

    ld   a, [wTextDebuggerDialogId]               ; $5DE2: $FA $09 $C1
    jp   OpenDialogInTable2                       ; $5DE5: $C3 $7C $23

ret_018_5DE8:
    ret                                           ; $5DE8: $C9
