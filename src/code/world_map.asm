;
; Code for the world map displayed when pressing SELECT.
;

WorldMapEntryPoint::
    xor  a                                        ;; 01:5626 $AF
    ld   [wOAMNextAvailableSlot], a               ;; 01:5627 $EA $C0 $C3

    ; Ignore inputs until the minimap is displayed
    ld   a, [wGameplaySubtype]                    ;; 01:562A $FA $96 $DB
    cp   $05                                      ;; 01:562D $FE $05
    jr   z, .ignoreInputsEnd                      ;; 01:562F $28 $08
    xor  a                                        ;; 01:5631 $AF
    ldh  [hPressedButtonsMask], a                 ;; 01:5632 $E0 $CB
    ldh  [hJoypadState], a                        ;; 01:5634 $E0 $CC
    ld   a, [wGameplaySubtype]                    ;; 01:5636 $FA $96 $DB
.ignoreInputsEnd

    JP_TABLE                                      ;; 01:5639 $C7
._00 dw WorldMapState0Handler                     ;; 01:563A
._01 dw WorldMapState1Handler                     ;; 01:563C
._02 dw WorldMapState2Handler                     ;; 01:563E
._03 dw WorldMapState3Handler                     ;; 01:5640
._04 dw WorldMapState4Handler                     ;; 01:5642
._05 dw WorldMapInteractiveHandler                ;; 01:5644
._06 dw FileSaveFadeOut                           ;; 01:5646

WorldMapState0Handler::
    call IncrementGameplaySubtype                 ;; 01:5648 $CD $D6 $44
    ldh  a, [hIsGBC]                              ;; 01:564B $F0 $FE
    and  a                                        ;; 01:564D $A7
    jr   z, WorldMapState1Handler                 ;; 01:564E $28 $28
    ld   hl, wBGPal1                              ;; 01:5650 $21 $10 $DC
    ld   c, $80                                   ;; 01:5653 $0E $80
    di                                            ;; 01:5655 $F3
    ld   a, $03                                   ;; 01:5656 $3E $03
    ldh  [rSVBK], a                               ;; 01:5658 $E0 $70
    ld   a, [wIsFileSelectionArrowShifted]        ;; 01:565A $FA $00 $D0
    and  a                                        ;; 01:565D $A7
    jr   nz, jr_001_5674                          ;; 01:565E $20 $14

.loop_5660
    xor  a                                        ;; 01:5660 $AF
    ldh  [rSVBK], a                               ;; 01:5661 $E0 $70
    ld   b, [hl]                                  ;; 01:5663 $46
    ld   a, $03                                   ;; 01:5664 $3E $03
    ldh  [rSVBK], a                               ;; 01:5666 $E0 $70
    ld   [hl], b                                  ;; 01:5668 $70
    inc  hl                                       ;; 01:5669 $23
    dec  c                                        ;; 01:566A $0D
    ld   a, c                                     ;; 01:566B $79
    and  a                                        ;; 01:566C $A7
    jr   nz, .loop_5660                           ;; 01:566D $20 $F1
    ld   a, $01                                   ;; 01:566F $3E $01
    ld   [wIsFileSelectionArrowShifted], a        ;; 01:5671 $EA $00 $D0

jr_001_5674::
    xor  a                                        ;; 01:5674 $AF
    ldh  [rSVBK], a                               ;; 01:5675 $E0 $70
    ei                                            ;; 01:5677 $FB

WorldMapState1Handler::
    call DrawLinkSprite                           ;; 01:5678 $CD $2E $1D
    call AnimateEntitiesAndRestoreBank01          ;; 01:567B $CD $FC $0E
    call func_1A22                                ;; 01:567E $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:5681 $FA $6B $C1
    cp   $04                                      ;; 01:5684 $FE $04
    jr   nz, ret_001_56F3                         ;; 01:5686 $20 $6B
    ld   a, $03                                   ;; 01:5688 $3E $03
    ldh  [hVolumeRight], a                        ;; 01:568A $E0 $A9
    ld   a, $30                                   ;; 01:568C $3E $30
    ldh  [hVolumeLeft], a                         ;; 01:568E $E0 $AA
    call IncrementGameplaySubtype                 ;; 01:5690 $CD $D6 $44
    xor  a                                        ;; 01:5693 $AF
    ld   [wTransitionSequenceCounter], a          ;; 01:5694 $EA $6B $C1
    ld   [wC16C], a                               ;; 01:5697 $EA $6C $C1
    ldh  [hBaseScrollX], a                        ;; 01:569A $E0 $96
    ld   [wScrollXOffset], a                      ;; 01:569C $EA $BF $C1
    ldh  [hBaseScrollY], a                        ;; 01:569F $E0 $97
    ld   [wInventoryAppearing], a                 ;; 01:56A1 $EA $4F $C1
    ld   [wC1B2], a                               ;; 01:56A4 $EA $B2 $C1
    ld   [wC1B3], a                               ;; 01:56A7 $EA $B3 $C1
    ld   a, [wDB54]                               ;; 01:56AA $FA $54 $DB
    ld   [wDBB4], a                               ;; 01:56AD $EA $B4 $DB
    ld   e, a                                     ;; 01:56B0 $5F
    ld   d, $00                                   ;; 01:56B1 $16 $00
    ld   hl, MapSpecialLocationNamesTable         ;; 01:56B3 $21 $59 $59
    add  hl, de                                   ;; 01:56B6 $19
    ld   a, [hl]                                  ;; 01:56B7 $7E
    and  a                                        ;; 01:56B8 $A7
    jr   z, .jr_56D9                              ;; 01:56B9 $28 $1E
    swap a                                        ;; 01:56BB $CB $37
    and  $07                                      ;; 01:56BD $E6 $07
    inc  a                                        ;; 01:56BF $3C
    cp   $01                                      ;; 01:56C0 $FE $01
    jr   nz, .jr_56D9                             ;; 01:56C2 $20 $15
    ld   a, [wC5A2]                               ;; 01:56C4 $FA $A2 $C5
    and  a                                        ;; 01:56C7 $A7
    ld   a, $00                                   ;; 01:56C8 $3E $00
    jr   nz, .jr_56D9                             ;; 01:56CA $20 $0D
    ld   hl, wOverworldRoomStatus                 ;; 01:56CC $21 $00 $D8
    add  hl, de                                   ;; 01:56CF $19
    ld   a, [hl]                                  ;; 01:56D0 $7E
    and  OW_ROOM_STATUS_OWL_TALKED                ;; 01:56D1 $E6 $20
    ld   a, $00                                   ;; 01:56D3 $3E $00
    jr   z, .jr_56D9                              ;; 01:56D5 $28 $02
    ld   a, $01                                   ;; 01:56D7 $3E $01

.jr_56D9::
    ld   [wC1B1], a                               ;; 01:56D9 $EA $B1 $C1
    ld   a, [wDBB4]                               ;; 01:56DC $FA $B4 $DB
    ld   [wC1B4], a                               ;; 01:56DF $EA $B4 $C1
    ldh  a, [rLCDC]                               ;; 01:56E2 $F0 $40
    and  ~LCDCF_WINON                             ;; 01:56E4 $E6 $DF
    ld   [wLCDControl], a                         ;; 01:56E6 $EA $FD $D6
    ldh  [rLCDC], a                               ;; 01:56E9 $E0 $40
    call func_001_5888                            ;; 01:56EB $CD $88 $58
    ld   a, TILEMAP_WORLD_MAP                     ;; 01:56EE $3E $08
    ld   [wBGMapToLoad], a                        ;; 01:56F0 $EA $FF $D6

ret_001_56F3::
    ret                                           ;; 01:56F3 $C9

WorldMapState2Handler::
    ld   a, TILESET_WORLD_MAP                     ;; 01:56F4 $3E $0B
    ld   [wTilesetToLoad], a                      ;; 01:56F6 $EA $FE $D6
    call IncrementGameplaySubtype                 ;; 01:56F9 $CD $D6 $44
    ret                                           ;; 01:56FC $C9

WorldMapState3Handler::
    ld   a, TILESET_WORLD_MAP_TILEMAP             ;; 01:56FD $3E $0E
    ld   [wTilesetToLoad], a                      ;; 01:56FF $EA $FE $D6

    ld   a, $01                                   ;; 01:5702 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 01:5704 $EA $D5 $DD

    call IncrementGameplaySubtype                 ;; 01:5707 $CD $D6 $44
    ret                                           ;; 01:570A $C9

WorldMapState4Handler::
    call func_1A39                                ;; 01:570B $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:570E $FA $6B $C1
    cp   $04                                      ;; 01:5711 $FE $04
    jr   nz, .return                              ;; 01:5713 $20 $06
    call IncrementGameplaySubtype                 ;; 01:5715 $CD $D6 $44
    call PlayValidationJingle                     ;; 01:5718 $CD $BE $49
.return
    ret                                           ;; 01:571B $C9

WorldMapInteractiveHandler::
IF !__PATCH_8__
    ld   a, [ROM_DebugTool3]                      ;; 01:571C $FA $05 $00
    and  a                                        ;; 01:571F $A7
    jr   z, .debugEnd                             ;; 01:5720 $28 $0F
    ldh  a, [hJoypadState]                        ;; 01:5722 $F0 $CC
    bit  J_BIT_START, a                           ;; 01:5724 $CB $7F
    jr   z, .debugEnd                             ;; 01:5726 $28 $09
    xor  a                                        ;; 01:5728 $AF
    ld   [wGameplaySubtype], a                    ;; 01:5729 $EA $96 $DB

    ; set [wGameplayType] to GAMEPLAY_CREDITS
    inc  a                                        ;; 01:572C $3C
    ld   [wGameplayType], a                       ;; 01:572D $EA $95 $DB
    ret                                           ;; 01:5730 $C9
.debugEnd
ENDC

    ld   a, [wDialogState]                        ;; 01:5731 $FA $9F $C1
    and  a                                        ;; 01:5734 $A7
    jp   nz, label_001_5818                       ;; 01:5735 $C2 $18 $58
    ldh  a, [hJoypadState]                        ;; 01:5738 $F0 $CC
    and  J_A                                      ;; 01:573A $E6 $10
    jr   z, jr_001_57B7                           ;; 01:573C $28 $79
    ld   a, [wDBB4]                               ;; 01:573E $FA $B4 $DB
    ld   e, a                                     ;; 01:5741 $5F
    ld   d, $00                                   ;; 01:5742 $16 $00
    ld   hl, MapSpecialLocationNamesTable         ;; 01:5744 $21 $59 $59
    add  hl, de                                   ;; 01:5747 $19
    ld   a, [hl]                                  ;; 01:5748 $7E
    and  a                                        ;; 01:5749 $A7
    jr   z, jr_001_576F                           ;; 01:574A $28 $23
    ld   e, a                                     ;; 01:574C $5F
    and  $F0                                      ;; 01:574D $E6 $F0
    jr   nz, .jr_5766                             ;; 01:574F $20 $15
    ld   a, [wC5A2]                               ;; 01:5751 $FA $A2 $C5
    and  a                                        ;; 01:5754 $A7
    jr   nz, jr_001_576F                          ;; 01:5755 $20 $18
    push de                                       ;; 01:5757 $D5
    ld   a, [wDBB4]                               ;; 01:5758 $FA $B4 $DB
    ld   e, a                                     ;; 01:575B $5F
    ld   hl, wOverworldRoomStatus                 ;; 01:575C $21 $00 $D8
    add  hl, de                                   ;; 01:575F $19
    pop  de                                       ;; 01:5760 $D1
    ld   a, [hl]                                  ;; 01:5761 $7E
    and  OW_ROOM_STATUS_OWL_TALKED                ;; 01:5762 $E6 $20
    jr   z, jr_001_576F                           ;; 01:5764 $28 $09

.jr_5766::
    ld   d, $00                                   ;; 01:5766 $16 $00
    ld   hl, MapSpecialLocationNamesLookupTable   ;; 01:5768 $21 $09 $59
    add  hl, de                                   ;; 01:576B $19
    ld   a, [hl]                                  ;; 01:576C $7E
    jr   jr_001_5792                              ;; 01:576D $18 $23

jr_001_576F::
    ld   a, [wDBB4]                               ;; 01:576F $FA $B4 $DB
    cp   $24                                      ;; 01:5772 $FE $24
    jr   z, .jr_577A                              ;; 01:5774 $28 $04
    cp   $34                                      ;; 01:5776 $FE $34
    jr   nz, jr_001_577E                          ;; 01:5778 $20 $04

.jr_577A::
    ld_dialog_low a, Dialog076 ; "Goponga Swamp"  ;; 01:577A $3E $76
    jr   jr_001_5792                              ;; 01:577C $18 $14

jr_001_577E::
    rra                                           ;; 01:577E $1F
    and  $07                                      ;; 01:577F $E6 $07
    ld   e, a                                     ;; 01:5781 $5F
    ld   a, [wDBB4]                               ;; 01:5782 $FA $B4 $DB
    rra                                           ;; 01:5785 $1F
    rra                                           ;; 01:5786 $1F
    and  $38                                      ;; 01:5787 $E6 $38
    or   e                                        ;; 01:5789 $B3
    ld   e, a                                     ;; 01:578A $5F
    ld   d, $00                                   ;; 01:578B $16 $00
    ld   hl, MapLocationNamesTable                ;; 01:578D $21 $C9 $58
    add  hl, de                                   ;; 01:5790 $19
    ld   a, [hl]                                  ;; 01:5791 $7E

jr_001_5792::
    call OpenDialogInTable0                       ;; 01:5792 $CD $85 $23
    ld   a, [wDialogIndex]                        ;; 01:5795 $FA $73 $C1
    cp   $A7                                      ;; 01:5798 $FE $A7
    jr   z, .jr_57A3                              ;; 01:579A $28 $07
    ld   a, [wDBB4]                               ;; 01:579C $FA $B4 $DB
    cp   $37                                      ;; 01:579F $FE $37
    jr   nz, jr_001_57A8                          ;; 01:57A1 $20 $05

.jr_57A3::
    ld   a, $01                                   ;; 01:57A3 $3E $01
    ld   [wDialogIndexHi], a                      ;; 01:57A5 $EA $12 $C1

jr_001_57A8::
    ld   a, [wDBB4]                               ;; 01:57A8 $FA $B4 $DB
    cp   $70                                      ;; 01:57AB $FE $70
    ld   a, $01                                   ;; 01:57AD $3E $01
    jr   nc, .jr_57B3                             ;; 01:57AF $30 $02
    ld   a, $81                                   ;; 01:57B1 $3E $81

.jr_57B3::
    ld   [wDialogState], a                        ;; 01:57B3 $EA $9F $C1
    ret                                           ;; 01:57B6 $C9

; POI: Debug code to warp to any room on the map by pushing B + Select (on the map screen)
jr_001_57B7::
    ld   a, [ROM_DebugTool1]                    ; If we weren't pushing A above, then ;; 01:57B7 $FA $03 $00
    and  a                                      ; Check the first debug flag ;; 01:57BA $A7
    jr   z, .jr_57FA                         ; If the debug flag is off, skip this ;; 01:57BB $28 $3D
    ldh  a, [hPressedButtonsMask]               ; Otherwise, are we holding SELECT / B? ;; 01:57BD $F0 $CB
    cp   J_SELECT | J_B                           ;; 01:57BF $FE $60
    jr   nz, .jr_57FA                        ; If yes, skip this too ;; 01:57C1 $20 $37
    ld   a, GAMEPLAY_WORLD                      ; Otherwise, warp somewhere ;; 01:57C3 $3E $0B
    ld   [wGameplayType], a                       ;; 01:57C5 $EA $95 $DB
    call ApplyMapFadeOutTransitionWithNoise       ;; 01:57C8 $CD $7D $0C
    ld   a, $00                                   ;; 01:57CB $3E $00
    ld   [wWarp0MapCategory], a                   ;; 01:57CD $EA $01 $D4
    ld   [wWarp0Map], a                           ;; 01:57D0 $EA $02 $D4
    ld   a, [wDBB4]                               ;; 01:57D3 $FA $B4 $DB
    ld   [wWarp0Room], a                          ;; 01:57D6 $EA $03 $D4
    ld   a, $48                                   ;; 01:57D9 $3E $48
    ld   [wWarp0DestinationX], a                  ;; 01:57DB $EA $04 $D4
    ld   a, $52                                   ;; 01:57DE $3E $52
    ld   [wWarp0DestinationY], a                  ;; 01:57E0 $EA $05 $D4
    ldh  a, [hLinkPositionX]                      ;; 01:57E3 $F0 $98
    swap a                                        ;; 01:57E5 $CB $37
    and  $0F                                      ;; 01:57E7 $E6 $0F
    ld   e, a                                     ;; 01:57E9 $5F
    ldh  a, [hLinkPositionY]                      ;; 01:57EA $F0 $99
    sub  a, $08                                   ;; 01:57EC $D6 $08
    and  $F0                                      ;; 01:57EE $E6 $F0
    or   e                                        ;; 01:57F0 $B3
    ld   [wWarp0PositionTileIndex], a             ;; 01:57F1 $EA $16 $D4
    ld   a, $07                                   ;; 01:57F4 $3E $07
    ld   [wGameplaySubtype], a                    ;; 01:57F6 $EA $96 $DB
    ret                                           ;; 01:57F9 $C9

.jr_57FA::
    ld   e, J_SELECT                              ;; 01:57FA $1E $40
    ld   a, [ROM_DebugTool1]                      ;; 01:57FC $FA $03 $00
    and  a                                        ;; 01:57FF $A7
    jr   nz, .jr_5804                             ;; 01:5800 $20 $02
    ld   e, J_SELECT | J_B                        ;; 01:5802 $1E $60

.jr_5804::
    ldh  a, [hJoypadState]                        ;; 01:5804 $F0 $CC
    and  e                                        ;; 01:5806 $A3
    jr   z, label_001_5818                        ;; 01:5807 $28 $0F
    xor  a                                        ;; 01:5809 $AF
    ld   [wTransitionSequenceCounter], a          ;; 01:580A $EA $6B $C1
    ld   [wC16C], a                               ;; 01:580D $EA $6C $C1
    ld   a, $01                                   ;; 01:5810 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 01:5812 $EA $D5 $DD
    call IncrementGameplaySubtype                 ;; 01:5815 $CD $D6 $44

label_001_5818::
    call func_001_58A8                            ;; 01:5818 $CD $A8 $58
    call func_001_5A71                            ;; 01:581B $CD $71 $5A
    call func_001_5C49                            ;; 01:581E $CD $49 $5C
    ret                                           ;; 01:5821 $C9
