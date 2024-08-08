; Retrieve the address of the BG attributes for a given object.
;
; BG attributes are represented by 4 bytes; each byte is a BG
; attribute for one of the objects tile.
;
; Inputs:
;   hl   address of the object in the object map (see wRoomObjects)
;   bc   object attribute value * 4
; Returns:
;   hMultiPurpose8                  the bank of the BG attributes
;   hMultiPurpose9, hMultiPurposeA  the address of the BG attributes
GetBGAttributesAddressForObject::
    push hl                                       ;; 1A:6576 $E5
    push bc                                       ;; 1A:6577 $C5

    ;
    ; Retrieve overworld bank and pointers
    ;

    ; If on Overworld…
    ld   a, [wIsIndoor]                           ;; 1A:6578 $FA $A5 $DB
    and  a                                        ;; 1A:657B $A7
    jp   nz, .overworldPaletteBankEnd             ;; 1A:657C $C2 $8B $65

    ; bc = hMapRoom
    ld   b, $00                                   ;; 1A:657F $06 $00
    ldh  a, [hMapRoom]                            ;; 1A:6581 $F0 $F6
    ld   c, a                                     ;; 1A:6583 $4F

    ; hMultiPurpose8 = OverworldBGAttributesBanks[hMapRoom]
    ld   hl, OverworldBGAttributesBanks           ;; 1A:6584 $21 $76 $64
    add  hl, bc                                   ;; 1A:6587 $09
    ld   a, [hl]                                  ;; 1A:6588 $7E
    ldh  [hMultiPurpose8], a                      ;; 1A:6589 $E0 $DF
.overworldPaletteBankEnd

    ; bc = [hMapRoom] * 2
    ld   b, $00                                   ;; 1A:658B $06 $00
    ldh  a, [hMapRoom]                            ;; 1A:658D $F0 $F6
    sla  a                                        ;; 1A:658F $CB $27
    ld   c, a                                     ;; 1A:6591 $4F
    rl   b                                        ;; 1A:6592 $CB $10

    ld   hl, BGAttributesPointers_Overworld       ;; 1A:6594 $21 $76 $5E

    ;
    ; Retrieve indoors bank and pointers
    ;

    ; If is indoor…
    ld   a, [wIsIndoor]                           ;; 1A:6597 $FA $A5 $DB
    and  a                                        ;; 1A:659A $A7
    jp   z, .indoorPaletteEnd                     ;; 1A:659B $CA $30 $66


    ; Use the IndoorsAObjectsAttrmaps bank by default
    ld   a, BANK(IndoorsAObjectsAttrmaps)         ;; 1A:659E $3E $23
    ldh  [hMultiPurpose8], a                      ;; 1A:65A0 $E0 $DF

    ; Use the attributes group pointer for indoors A
    ; hl += $200
    ASSERT BGAttributesPointers_Overworld + $200 == BGAttributesPointers_IndoorsA
    inc  h                                        ;; 1A:65A2 $24
    inc  h                                        ;; 1A:65A3 $24

    ld   b, $00                                   ;; 1A:65A4 $06 $00

    ; If in the Color Dungeon…
    ldh  a, [hMapId]                              ;; 1A:65A6 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 1A:65A8 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 1A:65AA $20 $06

    ; Use the attributes group pointer for color dungeon
    ld   hl, ColorDungeonBGAttributes             ;; 1A:65AC $21 $00 $60
    jp   .loadObjectAttrmapAddress                ;; 1A:65AF $C3 $36 $66
.colorDungeonEnd

    ; bc = hMapId * 2
    ld   c, a                                     ;; 1A:65B2 $4F
    sla  c                                        ;; 1A:65B3 $CB $21
    rl   b                                        ;; 1A:65B5 $CB $10

    ; if a <= MAP_WINDFISHS_EGG goto .indoorPaletteEnd
    cp   MAP_WINDFISHS_EGG + 1                    ;; 1A:65B7 $FE $09
    jr   c, .indoorPaletteEnd                     ;; 1A:65B9 $38 $75


    cp   MAP_CAVE_B                               ;; 1A:65BB $FE $0A
    jr   nz, .caveMapEnd                          ;; 1A:65BD $20 $06

    ldh  a, [hMapRoom]                            ;; 1A:65BF $F0 $F6
    cp   ROOM_INDOOR_B_MANBO                      ;; 1A:65C1 $FE $FD
    jr   z, .jr_01A_65D5                          ;; 1A:65C3 $28 $10
.caveMapEnd

    ldh  a, [hMapId]                              ;; 1A:65C5 $F0 $F7
    cp   MAP_CAVE_C                               ;; 1A:65C7 $FE $11
    jr   nz, .jr_01A_65D9                         ;; 1A:65C9 $20 $0E

    ldh  a, [hMapRoom]                            ;; 1A:65CB $F0 $F6
    cp   UNKNOWN_ROOM_C0                          ;; 1A:65CD $FE $C0
    jr   z, .jr_01A_65D5                          ;; 1A:65CF $28 $04
    cp   UNKNOWN_ROOM_C1                          ;; 1A:65D1 $FE $C1
    jr   nz, .jr_01A_65D9                         ;; 1A:65D3 $20 $04

.jr_01A_65D5
    ld   c, $1E                                   ;; 1A:65D5 $0E $1E
    jr   .useIndoorsBAttributes                   ;; 1A:65D7 $18 $51

.jr_01A_65D9
    ldh  a, [hMapId]                              ;; 1A:65D9 $F0 $F7
    cp   MAP_MINIGAME                             ;; 1A:65DB $FE $0F
    jr   nz, .jr_01A_65E9                         ;; 1A:65DD $20 $0A

    ldh  a, [hMapRoom]                            ;; 1A:65DF $F0 $F6
    cp   ROOM_INDOOR_B_TRENDY_MINIGAME            ;; 1A:65E1 $FE $A0
    jr   nz, .jr_01A_65E9                         ;; 1A:65E3 $20 $04

    ld   c, $00                                   ;; 1A:65E5 $0E $00
    jr   .useIndoorsBAttributes                   ;; 1A:65E7 $18 $41

.jr_01A_65E9
    ldh  a, [hMapId]                              ;; 1A:65E9 $F0 $F7
    cp   MAP_CAVE_WATER                           ;; 1A:65EB $FE $1F
    jr   nz, .jr_01A_65FD                         ;; 1A:65ED $20 $0E

    ldh  a, [hMapRoom]                            ;; 1A:65EF $F0 $F6
    cp   UNKNOWN_ROOM_EB                          ;; 1A:65F1 $FE $EB
    jr   z, .jr_01A_65F9                          ;; 1A:65F3 $28 $04
    cp   UNKNOWN_ROOM_EC                          ;; 1A:65F5 $FE $EC
    jr   nz, .jr_01A_65FD                         ;; 1A:65F7 $20 $04

.jr_01A_65F9
    ld   c, $28                                   ;; 1A:65F9 $0E $28
    jr   .useIndoorsBAttributes                   ;; 1A:65FB $18 $2D

.jr_01A_65FD
    ldh  a, [hMapId]                              ;; 1A:65FD $F0 $F7
    cp   MAP_HOUSE                                ;; 1A:65FF $FE $10
    jr   nz, .jr_01A_6616                         ;; 1A:6601 $20 $13

    ldh  a, [hMapRoom]                            ;; 1A:6603 $F0 $F6
    cp   ROOM_INDOOR_B_SEASHELL_MANSION           ;; 1A:6605 $FE $E9
    jr   nz, .jr_01A_660D                         ;; 1A:6607 $20 $04

    ld   c, $26                                   ;; 1A:6609 $0E $26
    jr   .useIndoorsBAttributes                   ;; 1A:660B $18 $1D

.jr_01A_660D
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 1A:660D $FE $B5
    jr   nz, .jr_01A_6616                         ;; 1A:660F $20 $05

    ld   bc, $1FE                                 ;; 1A:6611 $01 $FE $01
    jr   .useIndoorsBAttributes                   ;; 1A:6614 $18 $14

.jr_01A_6616
    ldh  a, [hMapId]                              ;; 1A:6616 $F0 $F7
    cp   MAP_S_FACE_SHRINE                        ;; 1A:6618 $FE $16
    jr   nz, .useIndoorsBAttributes               ;; 1A:661A $20 $0E

    ldh  a, [hMapRoom]                            ;; 1A:661C $F0 $F6
    cp   UNKNOWN_ROOM_6F                          ;; 1A:661E $FE $6F
    jr   z, .useIndoorsBPointers                  ;; 1A:6620 $28 $0C
    cp   UNKNOWN_ROOM_7F                          ;; 1A:6622 $FE $7F
    jr   z, .useIndoorsBPointers                  ;; 1A:6624 $28 $08
    cp   UNKNOWN_ROOM_8F                          ;; 1A:6626 $FE $8F
    jr   z, .useIndoorsBPointers                  ;; 1A:6628 $28 $04

.useIndoorsBAttributes
    ; Use the attributes group bank for indoors B
    ld   a, BANK(IndoorsBObjectsAttrmaps)         ;; 1A:662A $3E $24
    ldh  [hMultiPurpose8], a                      ;; 1A:662C $E0 $DF

.useIndoorsBPointers
    ; Use the attributes group pointer for indoors B
    ; hl += $200
    ASSERT BGAttributesPointers_IndoorsA + $200 == BGAttributesPointers_IndoorsB
    inc  h                                        ;; 1A:662E $24
    inc  h                                        ;; 1A:662F $24

.indoorPaletteEnd

    ;
    ; Load address of the object attrmap
    ;

    ; Read the attrmap group pointer

    ; bc = attributes-group-table[hMapId * 2]
    add  hl, bc                                   ;; 1A:6630 $09
    ld   c, [hl]                                  ;; 1A:6631 $4E
    inc  hl                                       ;; 1A:6632 $23
    ld   b, [hl]                                  ;; 1A:6633 $46
    ; hl = bc
    push bc                                       ;; 1A:6634 $C5
    pop  hl                                       ;; 1A:6635 $E1

.loadObjectAttrmapAddress
    pop  bc                                       ;; 1A:6636 $C1
    add  hl, bc                                   ;; 1A:6637 $09
    ; hMultiPurpose9, hMultiPurposeA = objects-attrmap[object-id * 4]
    ld   a, h                                     ;; 1A:6638 $7C
    ldh  [hMultiPurpose9], a                      ;; 1A:6639 $E0 $E0
    ld   a, l                                     ;; 1A:663B $7D
    ldh  [hMultiPurposeA], a                      ;; 1A:663C $E0 $E1
    pop  hl                                       ;; 1A:663E $E1
    ret                                           ;; 1A:663F $C9

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
    db   $01, $00, $03, $02, $02, $03, $00, $01
    db   $02, $03, $00, $01, $01, $00, $03, $02
    db   $01, $00, $03, $02, $02, $03, $00, $01
    db   $02, $03, $00, $01, $01, $00, $03, $02

Data_01A_66F0::
    db   $03, $02, $03, $02, $01, $00, $01, $00, $03, $03, $01, $01, $02, $02, $00, $00
    db   $01, $00, $03, $02, $01, $00, $03, $02, $02, $03, $00, $01, $02, $03, $00, $01

; Retrieve the attrmap address for a given object, and manipulate it further.;
; Inputs:
;   b     ???
;   de    ???
; Returns:
;   hMultiPurpose8                  the bank of the BG attributes
;   hMultiPurpose9, hMultiPurposeA  the address of the BG attributes
;
; TODO: understand and document this further.
func_01A_6710::
    ld   hl, Data_01A_6640                        ;; 1A:6710 $21 $40 $66
    push bc                                       ;; 1A:6713 $C5

    ; If b != 0…
    ld   a, b                                     ;; 1A:6714 $78
    and  a                                        ;; 1A:6715 $A7
    jr   z, .bNotZeroEnd                          ;; 1A:6716 $28 $03
    ; use another table
    ld   hl, Data_01A_6688                        ;; 1A:6718 $21 $88 $66
.bNotZeroEnd

    add  hl, de                                   ;; 1A:671B $19
    ld   b, $00                                   ;; 1A:671C $06 $00
    ld   a, [hl]                                  ;; 1A:671E $7E
    sla  a                                        ;; 1A:671F $CB $27
    rl   b                                        ;; 1A:6721 $CB $10
    sla  a                                        ;; 1A:6723 $CB $27
    rl   b                                        ;; 1A:6725 $CB $10
    ld   c, a                                     ;; 1A:6727 $4F

    call GetBGAttributesAddressForObject          ;; 1A:6728 $CD $76 $65

    pop  bc                                       ;; 1A:672B $C1
    ld   hl, Data_01A_66A8                        ;; 1A:672C $21 $A8 $66
    ld   a, b                                     ;; 1A:672F $78
    and  a                                        ;; 1A:6730 $A7
    jr   z, .jr_6736                              ;; 1A:6731 $28 $03

    ld   hl, Data_01A_66F0                        ;; 1A:6733 $21 $F0 $66

.jr_6736
    add  hl, de                                   ;; 1A:6736 $19
    ld   b, $00                                   ;; 1A:6737 $06 $00
    ld   a, [hl]                                  ;; 1A:6739 $7E
    ld   c, a                                     ;; 1A:673A $4F
    ldh  a, [hMultiPurpose9]                      ;; 1A:673B $F0 $E0
    ld   h, a                                     ;; 1A:673D $67
    ldh  a, [hMultiPurposeA]                      ;; 1A:673E $F0 $E1
    ld   l, a                                     ;; 1A:6740 $6F
    add  hl, bc                                   ;; 1A:6741 $09
    ld   a, h                                     ;; 1A:6742 $7C
    ldh  [hMultiPurpose9], a                      ;; 1A:6743 $E0 $E0
    ld   a, l                                     ;; 1A:6745 $7D
    ldh  [hMultiPurposeA], a                      ;; 1A:6746 $E0 $E1
    ret                                           ;; 1A:6748 $C9
