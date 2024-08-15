Data_002_66F9::
    db   $00, $02, $03, $07, $05, $0A, $0B, $0F, $04, $08, $09, $0E, $06, $0C, $0D, $01

LoadMinimap::
IF !__PATCH_0__
    ; Check if this is room E8, which is Evil Eagle's boss room
    ; If so, don't actually load the map
    ldh  a, [hMapRoom]                            ;; 02:6709 $F0 $F6
    cp   ROOM_INDOOR_B_EAGLES_TOWER_BOSS          ;; 02:670B $FE $E8
    ret  z                                        ;; 02:670D $C8
ENDC

    ; Load special minimap for Color Dungeon
    ld   hl, MinimapsTable                        ;; 02:670E $21 $79 $64
    ldh  a, [hMapId]                              ;; 02:6711 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:6713 $FE $FF
    jr   nz, .computeRegularMinimapAddress        ;; 02:6715 $20 $05

    ld   hl, ColorDungeonMinimap                  ;; 02:6717 $21 $B9 $66
    jr   .minimapAddressEnd                       ;; 02:671A $18 $0E

.computeRegularMinimapAddress
    ; Compute minimap address from map id
    swap a                                        ;; 02:671C $CB $37
    ld   e, a                                     ;; 02:671E $5F
    ld   d, $00                                   ;; 02:671F $16 $00
    sla  e                                        ;; 02:6721 $CB $23
    rl   d                                        ;; 02:6723 $CB $12
    sla  e                                        ;; 02:6725 $CB $23
    rl   d                                        ;; 02:6727 $CB $12
    add  hl, de                                   ;; 02:6729 $19
.minimapAddressEnd

    ; Load special minimap for collapsed Eagle's Tower
    ldh  a, [hMapId]                              ;; 02:672A $F0 $F7
    cp   MAP_EAGLES_TOWER                         ;; 02:672C $FE $06
    jr   nz, .eaglesTowerEnd                      ;; 02:672E $20 $0A

    ld   a, [wHasInstrument7]                     ;; 02:6730 $FA $6B $DB
    and  $04                                      ;; 02:6733 $E6 $04
    jr   z, .eaglesTowerEnd                       ;; 02:6735 $28 $03

    ld   hl, EaglesTowerCollapsedMinimap          ;; 02:6737 $21 $79 $66
.eaglesTowerEnd

    ; Load the minimap into WRAM
    ld   de, wDungeonMinimap                      ;; 02:673A $11 $80 $D4
    ld   bc, $40                                  ;; 02:673D $01 $40 $00
    call CopyData                                 ;; 02:6740 $CD $14 $29
    ld   d, $00                                   ;; 02:6743 $16 $00
    ld   e, $00                                   ;; 02:6745 $1E $00

    ; For each minimap room…
.minimapRoomsLoop
    ; a = wDungeonMinimap[e]
    ld   hl, wDungeonMinimap                      ;; 02:6747 $21 $80 $D4
    add  hl, de                                   ;; 02:674A $19
    ld   a, [hl]                                  ;; 02:674B $7E

    cp   $7D                                      ;; 02:674C $FE $7D
    jr   z, .continue                             ;; 02:674E $28 $65

    cp   $ED                                      ;; 02:6750 $FE $ED
    jr   z, .jr_002_6758                          ;; 02:6752 $28 $04

    cp   $EE                                      ;; 02:6754 $FE $EE
    jr   nz, .jr_002_6760                         ;; 02:6756 $20 $08

.jr_002_6758
    ld   a, [wHasDungeonCompass]                  ;; 02:6758 $FA $CD $DB
    and  a                                        ;; 02:675B $A7
    jr   nz, .jr_002_676B                         ;; 02:675C $20 $0D

    ld   [hl], $EF                                ;; 02:675E $36 $EF

.jr_002_6760
    ld   a, [wHasDungeonMap]                      ;; 02:6760 $FA $CC $DB
    and  a                                        ;; 02:6763 $A7
    jr   nz, .jr_002_676B                         ;; 02:6764 $20 $05

    ld   [hl], $7D                                ;; 02:6766 $36 $7D
    jp   .continue                                ;; 02:6768 $C3 $B5 $67

.jr_002_676B
    push de                                       ;; 02:676B $D5
    call label_2BC1                               ;; 02:676C $CD $C1 $2B
    ld   c, e                                     ;; 02:676F $4B
    ld   b, d                                     ;; 02:6770 $42
    pop  de                                       ;; 02:6771 $D1
    ld   a, [hl]                                  ;; 02:6772 $7E
    bit  7, a                                     ;; 02:6773 $CB $7F
    jr   z, .continue                             ;; 02:6775 $28 $3E

    ld   a, [hl]                                  ;; 02:6777 $7E
    and  $0F                                      ;; 02:6778 $E6 $0F
    ld   c, a                                     ;; 02:677A $4F
    ld   b, $00                                   ;; 02:677B $06 $00
    ld   hl, Data_002_66F9                        ; Tiles to use for revealed minimap spaces
    add  hl, bc                                   ;; 02:6780 $09
    ld   a, [hl]                                  ;; 02:6781 $7E
    inc  a                                        ;; 02:6782 $3C
    add  $CF                                      ;; 02:6783 $C6 $CF
    ld   c, a                                     ;; 02:6785 $4F
    ld   hl, wDungeonMinimap                      ;; 02:6786 $21 $80 $D4
    add  hl, de                                   ;; 02:6789 $19
    ld   a, [hl]                                  ;; 02:678A $7E
    cp   $EE                                      ;; 02:678B $FE $EE
    jr   z, .jr_002_6793                          ;; 02:678D $28 $04

    cp   $ED                                      ;; 02:678F $FE $ED
    jr   nz, .jr_002_67A8                         ;; 02:6791 $20 $15

.jr_002_6793
    push de                                       ;; 02:6793 $D5
    push af                                       ;; 02:6794 $F5
    call label_2BC1                               ;; 02:6795 $CD $C1 $2B
    pop  af                                       ;; 02:6798 $F1
    ld   e, $20                                   ;; 02:6799 $1E $20
    cp   $ED                                      ;; 02:679B $FE $ED
    jr   nz, .jr_002_67A1                         ;; 02:679D $20 $02

    ld   e, $10                                   ;; 02:679F $1E $10

.jr_002_67A1
    ld   a, [hl]                                  ;; 02:67A1 $7E
    and  e                                        ;; 02:67A2 $A3
    pop  de                                       ;; 02:67A3 $D1
    cp   $00                                      ;; 02:67A4 $FE $00
    jr   z, .continue                             ;; 02:67A6 $28 $0D

.jr_002_67A8
    ld   hl, wDungeonMinimap                      ;; 02:67A8 $21 $80 $D4
    add  hl, de                                   ;; 02:67AB $19
    ld   [hl], c                                  ;; 02:67AC $71
    ld   a, [wHasDungeonMap]                      ;; 02:67AD $FA $CC $DB
    and  a                                        ;; 02:67B0 $A7
    jr   nz, .continue                            ;; 02:67B1 $20 $02

    ld   [hl], $7D                                ;; 02:67B3 $36 $7D

.continue
    ; Loop while not all $40 rooms are processed
    inc  e                                        ;; 02:67B5 $1C
    ld   a, e                                     ;; 02:67B6 $7B
    cp   $40                                      ;; 02:67B7 $FE $40
    jp   nz, .minimapRoomsLoop                    ;; 02:67B9 $C2 $47 $67

    ldh  a, [hIsGBC]                              ;; 02:67BC $F0 $FE
    and  a                                        ;; 02:67BE $A7
    jr   z, .return                               ;; 02:67BF $28 $23

    di                                            ;; 02:67C1 $F3
    ld   e, $00                                   ;; 02:67C2 $1E $00
    ld   hl, wDungeonMinimap                      ;; 02:67C4 $21 $80 $D4

.loop
    ld   d, $01                                   ;; 02:67C7 $16 $01
    xor  a                                        ;; 02:67C9 $AF
    ldh  [rSVBK], a                               ;; 02:67CA $E0 $70
    ld   a, [hl]                                  ;; 02:67CC $7E
    cp   $ED                                      ;; 02:67CD $FE $ED
    jr   nz, .jr_002_67D3                         ;; 02:67CF $20 $02

    ld   d, $06                                   ;; 02:67D1 $16 $06

.jr_002_67D3
    ld   a, $02                                   ;; 02:67D3 $3E $02
    ldh  [rSVBK], a                               ;; 02:67D5 $E0 $70
    ld   a, d                                     ;; 02:67D7 $7A
    ld   [hl], a                                  ;; 02:67D8 $77
    inc  hl                                       ;; 02:67D9 $23

    ; Loop while not all $40 rooms are processed
    inc  e                                        ;; 02:67DA $1C
    ld   a, e                                     ;; 02:67DB $7B
    cp   $40                                      ;; 02:67DC $FE $40
    jr   nz, .loop                                ;; 02:67DE $20 $E7

    xor  a                                        ;; 02:67E0 $AF
    ldh  [rSVBK], a                               ;; 02:67E1 $E0 $70
    ei                                            ;; 02:67E3 $FB

.return
    ret                                           ;; 02:67E4 $C9

; Configure palette copy, then jump to do the copy
label_002_67E5:
    ld   a, [wMinimapLayout]                      ;; 02:67E5 $FA $B0 $DB
    and  $30                                      ;; 02:67E8 $E6 $30
    swap a                                        ;; 02:67EA $CB $37
    JP_TABLE                                      ;; 02:67EC $C7
._00 dw func_002_67F5
._01 dw func_002_67FA
._02 dw func_002_67FF
._03 dw func_002_6804

func_002_67F5::
    ld   hl, $9D0F                                ;; 02:67F5 $21 $0F $9D
    jr   jr_002_6807                              ;; 02:67F8 $18 $0D

func_002_67FA::
    ld   hl, $9D10                                ;; 02:67FA $21 $10 $9D
    jr   jr_002_6807                              ;; 02:67FD $18 $08

func_002_67FF::
    ld   hl, $9CEF                                ;; 02:67FF $21 $EF $9C
    jr   jr_002_6807                              ;; 02:6802 $18 $03

func_002_6804::
    ld   hl, $9CF0                                ;; 02:6804 $21 $F0 $9C

jr_002_6807:
    ld   e, $04                                   ;; 02:6807 $1E $04
    jr   jr_002_6848                              ;; 02:6809 $18 $3D

; Configure palette copy, then jump to do the copy
label_002_680B:
    ld   a, [wMinimapLayout]                      ;; 02:680B $FA $B0 $DB
    and  $30                                      ;; 02:680E $E6 $30
    swap a                                        ;; 02:6810 $CB $37
    JP_TABLE                                      ;; 02:6812 $C7
._00 dw func_002_681B
._01 dw func_002_6820
._02 dw func_002_681B
._03 dw func_002_6820

func_002_681B::
    ld   hl, $9D8F                                ;; 02:681B $21 $8F $9D
    jr   jr_002_6823                              ;; 02:681E $18 $03

func_002_6820::
    ld   hl, $9D90                                ;; 02:6820 $21 $90 $9D

jr_002_6823:
    ld   e, $24                                   ;; 02:6823 $1E $24
    jr   jr_002_6848                              ;; 02:6825 $18 $21

; Configure palette copy, then jump to do the copy
label_002_6827:
    ld   a, [wMinimapLayout]                      ;; 02:6827 $FA $B0 $DB
    and  $30                                      ;; 02:682A $E6 $30
    swap a                                        ;; 02:682C $CB $37
    JP_TABLE                                      ;; 02:682E $C7
._00 dw func_002_6837
._01 dw func_002_6837
._02 dw func_002_683C
._03 dw func_002_683C

func_002_6837::
    ld   hl, $9D0B                                ;; 02:6837 $21 $0B $9D
    jr   jr_002_683F                              ;; 02:683A $18 $03

func_002_683C::
    ld   hl, $9CEB                                ;; 02:683C $21 $EB $9C

jr_002_683F:
    ld   e, $00                                   ;; 02:683F $1E $00
    jr   jr_002_6848                              ;; 02:6841 $18 $05

CopyDungeonMinimapPalette::
    ld   hl, $9D8B                                ;; 02:6843 $21 $8B $9D
    ld   e, $20                                   ;; 02:6846 $1E $20

jr_002_6848:
    ldh  a, [hIsGBC]                              ;; 02:6848 $F0 $FE
    and  a                                        ;; 02:684A $A7
    jr   z, jr_002_6885                           ;; 02:684B $28 $38

    push de                                       ;; 02:684D $D5
    push hl                                       ;; 02:684E $E5
    di                                            ;; 02:684F $F3
    ld   a, $02                                   ;; 02:6850 $3E $02
    ldh  [rSVBK], a                               ;; 02:6852 $E0 $70
    ld   a, $01                                   ;; 02:6854 $3E $01
    ldh  [rVBK], a                                ;; 02:6856 $E0 $4F
    ld   c, $00                                   ;; 02:6858 $0E $00
    ld   d, c                                     ;; 02:685A $51

.loop_685B
    push hl                                       ;; 02:685B $E5
    ld   hl, wDungeonMinimap                      ;; 02:685C $21 $80 $D4
    add  hl, de                                   ;; 02:685F $19
    ld   a, [hl]                                  ;; 02:6860 $7E
    pop  hl                                       ;; 02:6861 $E1
    ld   [hl], a                                  ;; 02:6862 $77
    inc  e                                        ;; 02:6863 $1C
    inc  c                                        ;; 02:6864 $0C
    ld   a, c                                     ;; 02:6865 $79
    cp   $10                                      ;; 02:6866 $FE $10
    jr   z, .jr_687D                              ;; 02:6868 $28 $13

    inc  hl                                       ;; 02:686A $23
    and  $03                                      ;; 02:686B $E6 $03
    jr   nz, .loop_685B                           ;; 02:686D $20 $EC

    ld   a, e                                     ;; 02:686F $7B
    add  $04                                      ;; 02:6870 $C6 $04
    ld   e, a                                     ;; 02:6872 $5F
    ld   a, l                                     ;; 02:6873 $7D
    add  $1C                                      ;; 02:6874 $C6 $1C
    ld   l, a                                     ;; 02:6876 $6F
    ld   a, $00                                   ;; 02:6877 $3E $00
    adc  h                                        ;; 02:6879 $8C
    ld   h, a                                     ;; 02:687A $67
    jr   .loop_685B                               ;; 02:687B $18 $DE

.jr_687D
    xor  a                                        ;; 02:687D $AF
    ldh  [rSVBK], a                               ;; 02:687E $E0 $70
    ldh  [rVBK], a                                ;; 02:6880 $E0 $4F
    ei                                            ;; 02:6882 $FB

.jr_6883
    pop  hl                                       ;; 02:6883 $E1
    pop  de                                       ;; 02:6884 $D1

jr_002_6885:
    ld   c, $00                                   ;; 02:6885 $0E $00
    ld   d, c                                     ;; 02:6887 $51

.loop_6888
    push hl                                       ;; 02:6888 $E5
    ld   hl, wDungeonMinimap                      ;; 02:6889 $21 $80 $D4
    add  hl, de                                   ;; 02:688C $19
    ld   a, [hl]                                  ;; 02:688D $7E
    pop  hl                                       ;; 02:688E $E1
    ld   [hl], a                                  ;; 02:688F $77
    inc  e                                        ;; 02:6890 $1C
    inc  c                                        ;; 02:6891 $0C
    ld   a, c                                     ;; 02:6892 $79
    cp   $10                                      ;; 02:6893 $FE $10
    jr   z, .ret_68AA                             ;; 02:6895 $28 $13

    inc  hl                                       ;; 02:6897 $23
    and  $03                                      ;; 02:6898 $E6 $03
    jr   nz, .loop_6888                           ;; 02:689A $20 $EC

    ld   a, e                                     ;; 02:689C $7B
    add  $04                                      ;; 02:689D $C6 $04
    ld   e, a                                     ;; 02:689F $5F
    ld   a, l                                     ;; 02:68A0 $7D
    add  $1C                                      ;; 02:68A1 $C6 $1C
    ld   l, a                                     ;; 02:68A3 $6F
    ld   a, $00                                   ;; 02:68A4 $3E $00
    adc  h                                        ;; 02:68A6 $8C
    ld   h, a                                     ;; 02:68A7 $67
    jr   .loop_6888                               ;; 02:68A8 $18 $DE

.ret_68AA
    ret                                           ;; 02:68AA $C9
