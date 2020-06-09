
Data_002_66F9::
    db   $00, $02, $03, $07, $05, $0A, $0B, $0F, $04, $08, $09, $0E, $06, $0C, $0D, $01

IsMapRoomE8::
    ldh  a, [hMapRoom]                            ; $6709: $F0 $F6
    cp   $E8                                      ; $670B: $FE $E8
    ret  z                                        ; $670D: $C8

LoadMinimap::
    ; Load special minimap for Color Dungeon
    ld   hl, MinimapsTable                        ; $670E: $21 $79 $64
    ldh  a, [hMapId]                              ; $6711: $F0 $F7
.computeRegularMinimapAddress
    ; Compute minimap address from map id
    swap a                                        ; $671C: $CB $37
    ld   e, a                                     ; $671E: $5F
    ld   d, $00                                   ; $671F: $16 $00
    sla  e                                        ; $6721: $CB $23
    rl   d                                        ; $6723: $CB $12
    sla  e                                        ; $6725: $CB $23
    rl   d                                        ; $6727: $CB $12
    add  hl, de                                   ; $6729: $19
.minimapAddressEnd

    ; Load special minimap for collapsed Eagle's Tower
    ldh  a, [hMapId]                              ; $672A: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $672C: $FE $06
    jr   nz, .eaglesTowerEnd                      ; $672E: $20 $0A

    ld   a, [wHasInstrument7]                     ; $6730: $FA $6B $DB
    and  $04                                      ; $6733: $E6 $04
    jr   z, .eaglesTowerEnd                       ; $6735: $28 $03

    ld   hl, EaglesTowerCollapsedMinimap          ; $6737: $21 $79 $66
.eaglesTowerEnd

    ; Load the minimap into WRAM
    ld   de, wDungeonMinimap                      ; $673A: $11 $80 $D4
    ld   bc, $40                                ; $673D: $01 $40 $00
    call CopyData                                 ; $6740: $CD $14 $29
    ld   d, $00                                   ; $6743: $16 $00
    ld   e, $00                                   ; $6745: $1E $00

    ; For each minimap room…
.minimapRoomsLoop
    ; a = wDungeonMinimap[e]
    ld   hl, wDungeonMinimap                      ; $6747: $21 $80 $D4
    add  hl, de                                   ; $674A: $19
    ld   a, [hl]                                  ; $674B: $7E

    cp   $7D                                      ; $674C: $FE $7D
    jr   z, .continue                             ; $674E: $28 $65

    cp   $ED                                      ; $6750: $FE $ED
    jr   z, .jr_002_6758                          ; $6752: $28 $04

    cp   $EE                                      ; $6754: $FE $EE
    jr   nz, .jr_002_6760                         ; $6756: $20 $08

.jr_002_6758
    ld   a, [wHasDungeonCompass]                  ; $6758: $FA $CD $DB
    and  a                                        ; $675B: $A7
    jr   nz, .jr_002_676B                         ; $675C: $20 $0D

    ld   [hl], $EF                                ; $675E: $36 $EF

.jr_002_6760
    ld   a, [wHasDungeonMap]                      ; $6760: $FA $CC $DB
    and  a                                        ; $6763: $A7
    jr   nz, .jr_002_676B                         ; $6764: $20 $05

    ld   [hl], $7D                                ; $6766: $36 $7D
    jp   .continue                                ; $6768: $C3 $B5 $67

.jr_002_676B
    push de                                       ; $676B: $D5
    call label_2BC1                               ; $676C: $CD $C1 $2B
    ld   c, e                                     ; $676F: $4B
    ld   b, d                                     ; $6770: $42
    pop  de                                       ; $6771: $D1
    ld   a, [hl]                                  ; $6772: $7E
    bit  7, a                                     ; $6773: $CB $7F
    jr   z, .continue                             ; $6775: $28 $3E

    ld   a, [hl]                                  ; $6777: $7E
    and  $0F                                      ; $6778: $E6 $0F
    ld   c, a                                     ; $677A: $4F
    ld   b, $00                                   ; $677B: $06 $00
    ld   hl, Data_002_66F9                        ; Tiles to use for revealed minimap spaces
    add  hl, bc                                   ; $6780: $09
    ld   a, [hl]                                  ; $6781: $7E
    inc  a                                        ; $6782: $3C
    add  $CF                                      ; $6783: $C6 $CF
    ld   c, a                                     ; $6785: $4F
    ld   hl, wDungeonMinimap                      ; $6786: $21 $80 $D4
    add  hl, de                                   ; $6789: $19
    ld   a, [hl]                                  ; $678A: $7E
    cp   $EE                                      ; $678B: $FE $EE
    jr   z, .jr_002_6793                          ; $678D: $28 $04

    cp   $ED                                      ; $678F: $FE $ED
    jr   nz, .jr_002_67A8                         ; $6791: $20 $15

.jr_002_6793
    push de                                       ; $6793: $D5
    push af                                       ; $6794: $F5
    call label_2BC1                               ; $6795: $CD $C1 $2B
    pop  af                                       ; $6798: $F1
    ld   e, $20                                   ; $6799: $1E $20
    cp   $ED                                      ; $679B: $FE $ED
    jr   nz, .jr_002_67A1                         ; $679D: $20 $02

    ld   e, $10                                   ; $679F: $1E $10

.jr_002_67A1
    ld   a, [hl]                                  ; $67A1: $7E
    and  e                                        ; $67A2: $A3
    pop  de                                       ; $67A3: $D1
    cp   $00                                      ; $67A4: $FE $00
    jr   z, .continue                             ; $67A6: $28 $0D

.jr_002_67A8
    ld   hl, wDungeonMinimap                      ; $67A8: $21 $80 $D4
    add  hl, de                                   ; $67AB: $19
    ld   [hl], c                                  ; $67AC: $71
    ld   a, [wHasDungeonMap]                      ; $67AD: $FA $CC $DB
    and  a                                        ; $67B0: $A7
    jr   nz, .continue                            ; $67B1: $20 $02

    ld   [hl], $7D                                ; $67B3: $36 $7D

.continue
    ; Loop while not all $40 rooms are processed
    inc  e                                        ; $67B5: $1C
    ld   a, e                                     ; $67B6: $7B
    cp   $40                                      ; $67B7: $FE $40
    jp   nz, .minimapRoomsLoop                    ; $67B9: $C2 $47 $67

.return
    ret                                           ; $67E4: $C9

; Configure palette copy, then jump to do the copy
label_002_67E5:
    ld   a, [wMinimapLayout]                               ; $67E5: $FA $B0 $DB
    and  $30                                      ; $67E8: $E6 $30
    swap a                                        ; $67EA: $CB $37
    JP_TABLE                                      ; $67EC: $C7
._00 dw func_002_67F5
._01 dw func_002_67FA
._02 dw func_002_67FF
._03 dw func_002_6804

func_002_67F5::
    ld   hl, $9D0F                                ; $67F5: $21 $0F $9D
    jr   jr_002_6807                              ; $67F8: $18 $0D

func_002_67FA::
    ld   hl, $9D10                                ; $67FA: $21 $10 $9D
    jr   jr_002_6807                              ; $67FD: $18 $08

func_002_67FF::
    ld   hl, $9CEF                                ; $67FF: $21 $EF $9C
    jr   jr_002_6807                              ; $6802: $18 $03

func_002_6804::
    ld   hl, $9CF0                                ; $6804: $21 $F0 $9C

jr_002_6807:
    ld   e, $04                                   ; $6807: $1E $04
    jr   jr_002_6848                              ; $6809: $18 $3D

; Configure palette copy, then jump to do the copy
label_002_680B:
    ld   a, [wMinimapLayout]                               ; $680B: $FA $B0 $DB
    and  $30                                      ; $680E: $E6 $30
    swap a                                        ; $6810: $CB $37
    JP_TABLE                                      ; $6812: $C7
._00 dw func_002_681B
._01 dw func_002_6B81
._02 dw func_002_6B86
._03 dw func_002_6820

func_002_681B::
    ld hl, $9dae                                  ; $6b7c: $21 $ae $9d
    jr jr_002_6823                                ; $6b7f: $18 $0d

func_002_6B81:
    ld hl, $9daf                                  ; $6b81: $21 $af $9d
    jr jr_002_6823                                ; $6b84: $18 $08

func_002_6B86:
    ld hl, $9dae                                  ; $6b86: $21 $ae $9d
    jr jr_002_6823                                ; $6b89: $18 $03

func_002_6820::
    ld   hl, $9daf                                ; $6820: $21 $90 $9D

jr_002_6823:
    ld   e, $24                                   ; $6823: $1E $24
    jr   jr_002_6848                              ; $6825: $18 $21

; Configure palette copy, then jump to do the copy
label_002_6827:
    ld   a, [wMinimapLayout]                               ; $6827: $FA $B0 $DB
    and  $30                                      ; $682A: $E6 $30
    swap a                                        ; $682C: $CB $37
    JP_TABLE                                      ; $682E: $C7
._00 dw func_002_6837
._01 dw func_002_683C
._02 dw fn6bac
._03 dw fn6bb1

func_002_6837::
    ld   hl, $9d2a                                ; $6837: $21 $0B $9D
    jr   jr_002_683F                              ; $683A: $18 $03

func_002_683C::
    ld   hl, $9d2a
    jr   jr_002_683F                                 ; $683C: $21 $EB $9C

fn6bac
    ld hl, $9d0a                                  ; $6bac: $21 $0a $9d
    jr jr_002_683F

fn6bb1
    ld hl, $9d0a
jr_002_683F:
    ld   e, $00                                   ; $683F: $1E $00
    jr   jr_002_6848                              ; $6841: $18 $05

CopyDungeonMinimapPalette::
    ld   hl, $9daa                                ; $6843: $21 $8B $9D
    ld   e, $20                                   ; $6846: $1E $20

jr_002_6848:
    ld   c, $00                                   ; $6885: $0E $00
    ld   d, c                                     ; $6887: $51

jr_002_6888:
    push hl                                       ; $6888: $E5
    ld   hl, wDungeonMinimap                      ; $6889: $21 $80 $D4
    add  hl, de                                   ; $688C: $19
    ld   a, [hl]                                  ; $688D: $7E
    pop  hl                                       ; $688E: $E1
    ld   [hl], a                                  ; $688F: $77
    inc  e                                        ; $6890: $1C
    inc  c                                        ; $6891: $0C
    ld   a, c                                     ; $6892: $79
    cp   $10                                      ; $6893: $FE $10
    jr   z, jr_002_68AA                           ; $6895: $28 $13

    inc  hl                                       ; $6897: $23
    and  $03                                      ; $6898: $E6 $03
    jr   nz, jr_002_6888                          ; $689A: $20 $EC

    ld   a, e                                     ; $689C: $7B
    add  $04                                      ; $689D: $C6 $04
    ld   e, a                                     ; $689F: $5F
    ld   a, l                                     ; $68A0: $7D
    add  $1C                                      ; $68A1: $C6 $1C
    ld   l, a                                     ; $68A3: $6F
    ld   a, $00                                   ; $68A4: $3E $00
    adc  h                                        ; $68A6: $8C
    ld   h, a                                     ; $68A7: $67
    jr   jr_002_6888                              ; $68A8: $18 $DE

jr_002_68AA:
    ret                                           ; $68AA: $C9
