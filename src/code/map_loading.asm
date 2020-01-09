; Map-loading routines called from bank0

; Retrieve the address of the BG attributes for a given object.
;
; BG attributes are represented by 4 bytes; each byte is a BG
; attribute for one of the objects tile.
;
; Inputs:
;   hl   address of the object in the object map (see wRoomObjects)
;   bc   object attribute value * 4
; Returns:
;   hScratch8      the bank of the BG attributes
;   hScratch9, hScratchA   the address of the BG attributes
GetBGAttributesAddressForObject::
    push hl                                       ; $6576: $E5
    push bc                                       ; $6577: $C5

    ;
    ; Retrieve overworld bank and pointers
    ;

    ; If on Overworld…
    ld   a, [wIsIndoor]                           ; $6578: $FA $A5 $DB
    and  a                                        ; $657B: $A7
    jp   nz, .overworldPaletteBankEnd             ; $657C: $C2 $8B $65

    ; bc = hMapRoom
    ld   b, $00                                   ; $657F: $06 $00
    ldh  a, [hMapRoom]                            ; $6581: $F0 $F6
    ld   c, a                                     ; $6583: $4F

    ; hScratch8 = OverworldBGAttributesBanks[hMapRoom]
    ld   hl, OverworldBGAttributesBanks           ; $6584: $21 $76 $64
    add  hl, bc                                   ; $6587: $09
    ld   a, [hl]                                  ; $6588: $7E
    ldh  [hScratch8], a                           ; $6589: $E0 $DF
.overworldPaletteBankEnd

    ; bc = [hMapRoom] * 2
    ld   b, $00                                   ; $658B: $06 $00
    ldh  a, [hMapRoom]                            ; $658D: $F0 $F6
    sla  a                                        ; $658F: $CB $27
    ld   c, a                                     ; $6591: $4F
    rl   b                                        ; $6592: $CB $10

    ld   hl, OverworldBGAttributesPointers            ; $6594: $21 $76 $5E

    ;
    ; Retrieve indoors bank and pointers
    ;

    ; If is indoor…
    ld   a, [wIsIndoor]                           ; $6597: $FA $A5 $DB
    and  a                                        ; $659A: $A7
    jp   z, .indoorPaletteEnd                     ; $659B: $CA $30 $66

    ld   a, BANK(IndoorsBGAttributesA)            ; $659E: $3E $23
    ldh  [hScratch8], a                           ; $65A0: $E0 $DF
    inc  h                                        ; $65A2: $24
    inc  h                                        ; $65A3: $24
    ld   b, $00                                   ; $65A4: $06 $00

    ; If in the Color Dungeon…
    ldh  a, [hMapId]                              ; $65A6: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $65A8: $FE $FF
    jr   nz, .colorDungeonEnd                     ; $65AA: $20 $06

    ; Set palette pointers base for color dungeon
    ld   hl, ColorDungeonBGAttributes             ; $65AC: $21 $00 $60
    jp   .loadPalettesAdress                      ; $65AF: $C3 $36 $66
.colorDungeonEnd

    ; bc = hMapId * 2
    ld   c, a                                     ; $65B2: $4F
    sla  c                                        ; $65B3: $CB $21
    rl   b                                        ; $65B5: $CB $10
    cp   $09                                      ; $65B7: $FE $09
    jr   c, .indoorPaletteEnd                     ; $65B9: $38 $75

    cp   $0A                                      ; $65BB: $FE $0A
    jr   nz, .jr_01A_65C5                         ; $65BD: $20 $06

    ldh  a, [hMapRoom]                            ; $65BF: $F0 $F6
    cp   $FD                                      ; $65C1: $FE $FD
    jr   z, .jr_01A_65D5                          ; $65C3: $28 $10

.jr_01A_65C5
    ldh  a, [hMapId]                              ; $65C5: $F0 $F7
    cp   $11                                      ; $65C7: $FE $11
    jr   nz, .jr_01A_65D9                         ; $65C9: $20 $0E

    ldh  a, [hMapRoom]                            ; $65CB: $F0 $F6
    cp   $C0                                      ; $65CD: $FE $C0
    jr   z, .jr_01A_65D5                          ; $65CF: $28 $04

    cp   $C1                                      ; $65D1: $FE $C1
    jr   nz, .jr_01A_65D9                         ; $65D3: $20 $04

.jr_01A_65D5
    ld   c, $1E                                   ; $65D5: $0E $1E
    jr   .useSecondaryIndoorsPaletteBank          ; $65D7: $18 $51

.jr_01A_65D9
    ldh  a, [hMapId]                              ; $65D9: $F0 $F7
    cp   $0F                                      ; $65DB: $FE $0F
    jr   nz, .jr_01A_65E9                         ; $65DD: $20 $0A

    ldh  a, [hMapRoom]                            ; $65DF: $F0 $F6
    cp   $A0                                      ; $65E1: $FE $A0
    jr   nz, .jr_01A_65E9                         ; $65E3: $20 $04

    ld   c, $00                                   ; $65E5: $0E $00
    jr   .useSecondaryIndoorsPaletteBank          ; $65E7: $18 $41

.jr_01A_65E9
    ldh  a, [hMapId]                              ; $65E9: $F0 $F7
    cp   $1F                                      ; $65EB: $FE $1F
    jr   nz, .jr_01A_65FD                         ; $65ED: $20 $0E

    ldh  a, [hMapRoom]                            ; $65EF: $F0 $F6
    cp   $EB                                      ; $65F1: $FE $EB
    jr   z, .jr_01A_65F9                          ; $65F3: $28 $04

    cp   $EC                                      ; $65F5: $FE $EC
    jr   nz, .jr_01A_65FD                         ; $65F7: $20 $04

.jr_01A_65F9
    ld   c, $28                                   ; $65F9: $0E $28
    jr   .useSecondaryIndoorsPaletteBank          ; $65FB: $18 $2D

.jr_01A_65FD
    ldh  a, [hMapId]                              ; $65FD: $F0 $F7
    cp   $10                                      ; $65FF: $FE $10
    jr   nz, .jr_01A_6616                         ; $6601: $20 $13

    ldh  a, [hMapRoom]                            ; $6603: $F0 $F6
    cp   $E9                                      ; $6605: $FE $E9
    jr   nz, .jr_01A_660D                         ; $6607: $20 $04

    ld   c, $26                                   ; $6609: $0E $26
    jr   .useSecondaryIndoorsPaletteBank          ; $660B: $18 $1D

.jr_01A_660D
    cp   $B5                                      ; $660D: $FE $B5
    jr   nz, .jr_01A_6616                         ; $660F: $20 $05

    ld   bc, $1FE                                 ; $6611: $01 $FE $01
    jr   .useSecondaryIndoorsPaletteBank          ; $6614: $18 $14

.jr_01A_6616
    ldh  a, [hMapId]                              ; $6616: $F0 $F7
    cp   $16                                      ; $6618: $FE $16
    jr   nz, .useSecondaryIndoorsPaletteBank                         ; $661A: $20 $0E

    ldh  a, [hMapRoom]                            ; $661C: $F0 $F6
    cp   $6F                                      ; $661E: $FE $6F
    jr   z, .jr_01A_662E                          ; $6620: $28 $0C

    cp   $7F                                      ; $6622: $FE $7F
    jr   z, .jr_01A_662E                          ; $6624: $28 $08

    cp   $8F                                      ; $6626: $FE $8F
    jr   z, .jr_01A_662E                          ; $6628: $28 $04

.useSecondaryIndoorsPaletteBank
    ld   a, BANK(IndoorsBGAttributesB)            ; $662A: $3E $24
    ldh  [hScratch8], a                           ; $662C: $E0 $DF

.jr_01A_662E
    inc  h                                        ; $662E: $24
    inc  h                                        ; $662F: $24

.indoorPaletteEnd

    ; Load adress of palettes table

    ; bc = OverworldBGAttributesPointers[hMapId * 2]
    add  hl, bc                                   ; $6630: $09
    ld   c, [hl]                                  ; $6631: $4E
    inc  hl                                       ; $6632: $23
    ld   b, [hl]                                  ; $6633: $46
    ; hl = bc
    push bc                                       ; $6634: $C5
    pop  hl                                       ; $6635: $E1

.loadPalettesAdress
    pop  bc                                       ; $6636: $C1
    add  hl, bc                                   ; $6637: $09
    ; hScratch9, hScratchA = PalettesTable[ObjectAttributeValue * 4]
    ld   a, h                                     ; $6638: $7C
    ldh  [hScratch9], a                           ; $6639: $E0 $E0
    ld   a, l                                     ; $663B: $7D
    ldh  [hScratchA], a                           ; $663C: $E0 $E1
    pop  hl                                       ; $663E: $E1
    ret                                           ; $663F: $C9

Data_01A_6640::
    db   $2D, $2E, $43, $44, $8C, $08, $2F, $30
    db   $31, $09, $32, $0A, $0B, $33, $0C, $34
    db   $35, $36, $43, $44, $8C, $08, $37, $38
    db   $39, $09, $3A, $0A, $0B, $3B, $0C, $3C
    db   $A4, $A5, $43, $44, $43, $44, $43, $44
    db   $8C, $08, $8C, $08, $09, $09, $0A, $0A
    db   $0B, $0B, $0C, $0C, $43, $44, $43, $44
    db   $8C, $08, $8C, $08, $09, $09, $0A, $0A
    db   $0B, $0B, $0C, $0C, $43, $44, $43, $44

Data_01A_6688::
    db   $35, $36, $43, $44, $8C, $08, $37, $38
    db   $39, $09, $3A, $0A, $0B, $3B, $0C, $3C
    db   $35, $36, $35, $36, $37, $38, $37, $38
    db   $39, $39, $3A, $3A, $3B, $3B, $3C, $3C

Data_01A_66A8::
    db   $03, $02, $03, $02, $01, $00, $01, $00
    db   $03, $03, $01, $01, $02, $02, $00, $00
    db   $03, $02, $03, $02, $01, $00, $01, $00
    db   $03, $03, $01, $01, $02, $02, $00, $00
    db   $01, $00, $03, $02, $01, $00, $03, $02
    db   $01, $00, $03, $02, $02, $03, $00, $01, $02, $03, $00, $01, $01, $00, $03, $02
    db   $01, $00, $03, $02, $02, $03, $00, $01, $02, $03, $00, $01, $01, $00, $03, $02

Data_01A_66F0::
    db   $03, $02, $03, $02, $01, $00, $01, $00, $03, $03, $01, $01, $02, $02, $00, $00
    db   $01, $00, $03, $02, $01, $00, $03, $02, $02, $03, $00, $01, $02, $03, $00, $01

; Inputs:
;   b     ???
;   de    ???
func_01A_6710::
    ld   hl, Data_01A_6640                        ; $6710: $21 $40 $66
    push bc                                       ; $6713: $C5

    ; If b != 0…
    ld   a, b                                     ; $6714: $78
    and  a                                        ; $6715: $A7
    jr   z, .bNotZeroEnd                          ; $6716: $28 $03
    ; use another table
    ld   hl, Data_01A_6688                        ; $6718: $21 $88 $66
.bNotZeroEnd

    add  hl, de                                   ; $671B: $19
    ld   b, $00                                   ; $671C: $06 $00
    ld   a, [hl]                                  ; $671E: $7E
    sla  a                                        ; $671F: $CB $27
    rl   b                                        ; $6721: $CB $10
    sla  a                                        ; $6723: $CB $27
    rl   b                                        ; $6725: $CB $10
    ld   c, a                                     ; $6727: $4F

    call GetBGAttributesAddressForObject                    ; $6728: $CD $76 $65

    pop  bc                                       ; $672B: $C1
    ld   hl, Data_01A_66A8                        ; $672C: $21 $A8 $66
    ld   a, b                                     ; $672F: $78
    and  a                                        ; $6730: $A7
    jr   z, jr_01A_6736                           ; $6731: $28 $03

    ld   hl, Data_01A_66F0                        ; $6733: $21 $F0 $66

jr_01A_6736:
    add  hl, de                                   ; $6736: $19
    ld   b, $00                                   ; $6737: $06 $00
    ld   a, [hl]                                  ; $6739: $7E
    ld   c, a                                     ; $673A: $4F
    ldh  a, [hScratch9]                           ; $673B: $F0 $E0
    ld   h, a                                     ; $673D: $67
    ldh  a, [hScratchA]                           ; $673E: $F0 $E1
    ld   l, a                                     ; $6740: $6F
    add  hl, bc                                   ; $6741: $09
    ld   a, h                                     ; $6742: $7C
    ldh  [hScratch9], a                           ; $6743: $E0 $E0
    ld   a, l                                     ; $6745: $7D
    ldh  [hScratchA], a                           ; $6746: $E0 $E1
    ret                                           ; $6748: $C9
