;
; Code for the world map displayed when pressing SELECT.
;

WorldMapEntryPoint::
    xor  a                                        ; $5626: $AF
    ld   [wOAMNextAvailableSlot], a               ; $5627: $EA $C0 $C3

    ; Ignore inputs until the minimap is displayed
    ld   a, [wGameplaySubtype]                    ; $562A: $FA $96 $DB
    cp   $05                                      ; $562D: $FE $05
    jr   z, .ignoreInputsEnd                      ; $562F: $28 $08
    xor  a                                        ; $5631: $AF
    ldh  [hPressedButtonsMask], a                 ; $5632: $E0 $CB
    ldh  [hJoypadState], a                        ; $5634: $E0 $CC
    ld   a, [wGameplaySubtype]                    ; $5636: $FA $96 $DB
.ignoreInputsEnd

    JP_TABLE                                      ; $5639: $C7
._00 dw WorldMapState0Handler                     ; $563A
._01 dw WorldMapState1Handler                     ; $563C
._02 dw WorldMapState2Handler                     ; $563E
._03 dw WorldMapState3Handler                     ; $5640
._04 dw WorldMapState4Handler                     ; $5642
._05 dw WorldMapInteractiveHandler                ; $5644
._06 dw FileSaveFadeOut                           ; $5646

WorldMapState0Handler::
    call IncrementGameplaySubtype                 ; $5648: $CD $D6 $44
    ldh  a, [hIsGBC]                              ; $564B: $F0 $FE
    and  a                                        ; $564D: $A7
    jr   z, WorldMapState1Handler                 ; $564E: $28 $28
    ld   hl, wBGPal1                              ; $5650: $21 $10 $DC
    ld   c, $80                                   ; $5653: $0E $80
    di                                            ; $5655: $F3
    ld   a, $03                                   ; $5656: $3E $03
    ld   [rSVBK], a                               ; $5658: $E0 $70
    ld   a, [wIsFileSelectionArrowShifted]        ; $565A: $FA $00 $D0
    and  a                                        ; $565D: $A7
    jr   nz, jr_001_5674                          ; $565E: $20 $14

.loop_5660
    xor  a                                        ; $5660: $AF
    ld   [rSVBK], a                               ; $5661: $E0 $70
    ld   b, [hl]                                  ; $5663: $46
    ld   a, $03                                   ; $5664: $3E $03
    ld   [rSVBK], a                               ; $5666: $E0 $70
    ld   [hl], b                                  ; $5668: $70
    inc  hl                                       ; $5669: $23
    dec  c                                        ; $566A: $0D
    ld   a, c                                     ; $566B: $79
    and  a                                        ; $566C: $A7
    jr   nz, .loop_5660                           ; $566D: $20 $F1
    ld   a, $01                                   ; $566F: $3E $01
    ld   [wIsFileSelectionArrowShifted], a        ; $5671: $EA $00 $D0

jr_001_5674::
    xor  a                                        ; $5674: $AF
    ld   [rSVBK], a                               ; $5675: $E0 $70
    ei                                            ; $5677: $FB

WorldMapState1Handler::
    call DrawLinkSprite                           ; $5678: $CD $2E $1D
    call AnimateEntitiesAndRestoreBank01          ; $567B: $CD $FC $0E
    call func_1A22                                ; $567E: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $5681: $FA $6B $C1
    cp   $04                                      ; $5684: $FE $04
    jr   nz, ret_001_56F3                         ; $5686: $20 $6B
    ld   a, $03                                   ; $5688: $3E $03
    ldh  [hVolumeRight], a                        ; $568A: $E0 $A9
    ld   a, $30                                   ; $568C: $3E $30
    ldh  [hVolumeLeft], a                         ; $568E: $E0 $AA
    call IncrementGameplaySubtype                 ; $5690: $CD $D6 $44
    xor  a                                        ; $5693: $AF
    ld   [wTransitionSequenceCounter], a          ; $5694: $EA $6B $C1
    ld   [wC16C], a                               ; $5697: $EA $6C $C1
    ldh  [hBaseScrollX], a                        ; $569A: $E0 $96
    ld   [wScrollXOffset], a                      ; $569C: $EA $BF $C1
    ldh  [hBaseScrollY], a                        ; $569F: $E0 $97
    ld   [wInventoryAppearing], a                 ; $56A1: $EA $4F $C1
    ld   [wC1B2], a                               ; $56A4: $EA $B2 $C1
    ld   [wC1B3], a                               ; $56A7: $EA $B3 $C1
    ld   a, [wDB54]                               ; $56AA: $FA $54 $DB
    ld   [wDBB4], a                               ; $56AD: $EA $B4 $DB
    ld   e, a                                     ; $56B0: $5F
    ld   d, $00                                   ; $56B1: $16 $00
    ld   hl, MapSpecialLocationNamesTable         ; $56B3: $21 $59 $59
    add  hl, de                                   ; $56B6: $19
    ld   a, [hl]                                  ; $56B7: $7E
    and  a                                        ; $56B8: $A7
    jr   z, .jr_56D9                              ; $56B9: $28 $1E
    swap a                                        ; $56BB: $CB $37
    and  $07                                      ; $56BD: $E6 $07
    inc  a                                        ; $56BF: $3C
    cp   $01                                      ; $56C0: $FE $01
    jr   nz, .jr_56D9                             ; $56C2: $20 $15
    ld   a, [wC5A2]                               ; $56C4: $FA $A2 $C5
    and  a                                        ; $56C7: $A7
    ld   a, $00                                   ; $56C8: $3E $00
    jr   nz, .jr_56D9                             ; $56CA: $20 $0D
    ld   hl, wOverworldRoomStatus                 ; $56CC: $21 $00 $D8
    add  hl, de                                   ; $56CF: $19
    ld   a, [hl]                                  ; $56D0: $7E
    and  OW_ROOM_STATUS_OWL_TALKED                ; $56D1: $E6 $20
    ld   a, $00                                   ; $56D3: $3E $00
    jr   z, .jr_56D9                              ; $56D5: $28 $02
    ld   a, $01                                   ; $56D7: $3E $01

.jr_56D9::
    ld   [wC1B1], a                               ; $56D9: $EA $B1 $C1
    ld   a, [wDBB4]                               ; $56DC: $FA $B4 $DB
    ld   [wC1B4], a                               ; $56DF: $EA $B4 $C1
    ld   a, [rLCDC]                               ; $56E2: $F0 $40
    and  ~LCDCF_WINON                             ; $56E4: $E6 $DF
    ld   [wLCDControl], a                         ; $56E6: $EA $FD $D6
    ld   [rLCDC], a                               ; $56E9: $E0 $40
    call func_001_5888                            ; $56EB: $CD $88 $58
    ld   a, TILEMAP_WORLD_MAP                     ; $56EE: $3E $08
    ld   [wBGMapToLoad], a                        ; $56F0: $EA $FF $D6

ret_001_56F3::
    ret                                           ; $56F3: $C9

WorldMapState2Handler::
    ld   a, TILESET_WORLD_MAP                     ; $56F4: $3E $0B
    ld   [wTilesetToLoad], a                      ; $56F6: $EA $FE $D6
    call IncrementGameplaySubtype                 ; $56F9: $CD $D6 $44
    ret                                           ; $56FC: $C9

WorldMapState3Handler::
    ld   a, TILESET_WORLD_MAP_TILEMAP             ; $56FD: $3E $0E
    ld   [wTilesetToLoad], a                      ; $56FF: $EA $FE $D6

    ld   a, $01                                   ; $5702: $3E $01
    ld   [wPaletteUnknownE], a                    ; $5704: $EA $D5 $DD

    call IncrementGameplaySubtype                 ; $5707: $CD $D6 $44
    ret                                           ; $570A: $C9

WorldMapState4Handler::
    call func_1A39                                ; $570B: $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $570E: $FA $6B $C1
    cp   $04                                      ; $5711: $FE $04
    jr   nz, .return                              ; $5713: $20 $06
    call IncrementGameplaySubtype                 ; $5715: $CD $D6 $44
    call PlayValidationJingle                     ; $5718: $CD $BE $49
.return
    ret                                           ; $571B: $C9

WorldMapInteractiveHandler::
IF !__PATCH_8__
    ld   a, [ROM_DebugTool3]                      ; $571C: $FA $05 $00
    and  a                                        ; $571F: $A7
    jr   z, .debugEnd                             ; $5720: $28 $0F
    ldh  a, [hJoypadState]                        ; $5722: $F0 $CC
    bit  J_BIT_START, a                           ; $5724: $CB $7F
    jr   z, .debugEnd                             ; $5726: $28 $09
    xor  a                                        ; $5728: $AF
    ld   [wGameplaySubtype], a                    ; $5729: $EA $96 $DB

    ; set [wGameplayType] to GAMEPLAY_CREDITS
    inc  a                                        ; $572C: $3C
    ld   [wGameplayType], a                       ; $572D: $EA $95 $DB
    ret                                           ; $5730: $C9
.debugEnd
ENDC

    ld   a, [wDialogState]                        ; $5731: $FA $9F $C1
    and  a                                        ; $5734: $A7
    jp   nz, label_001_5818                       ; $5735: $C2 $18 $58
    ldh  a, [hJoypadState]                        ; $5738: $F0 $CC
    and  J_A                                      ; $573A: $E6 $10
    jr   z, jr_001_57B7                           ; $573C: $28 $79
    ld   a, [wDBB4]                               ; $573E: $FA $B4 $DB
    ld   e, a                                     ; $5741: $5F
    ld   d, $00                                   ; $5742: $16 $00
    ld   hl, MapSpecialLocationNamesTable         ; $5744: $21 $59 $59
    add  hl, de                                   ; $5747: $19
    ld   a, [hl]                                  ; $5748: $7E
    and  a                                        ; $5749: $A7
    jr   z, jr_001_576F                           ; $574A: $28 $23
    ld   e, a                                     ; $574C: $5F
    and  $F0                                      ; $574D: $E6 $F0
    jr   nz, .jr_5766                             ; $574F: $20 $15
    ld   a, [wC5A2]                               ; $5751: $FA $A2 $C5
    and  a                                        ; $5754: $A7
    jr   nz, jr_001_576F                          ; $5755: $20 $18
    push de                                       ; $5757: $D5
    ld   a, [wDBB4]                               ; $5758: $FA $B4 $DB
    ld   e, a                                     ; $575B: $5F
    ld   hl, wOverworldRoomStatus                 ; $575C: $21 $00 $D8
    add  hl, de                                   ; $575F: $19
    pop  de                                       ; $5760: $D1
    ld   a, [hl]                                  ; $5761: $7E
    and  OW_ROOM_STATUS_OWL_TALKED                ; $5762: $E6 $20
    jr   z, jr_001_576F                           ; $5764: $28 $09

.jr_5766::
    ld   d, $00                                   ; $5766: $16 $00
    ld   hl, MapSpecialLocationNamesLookupTable   ; $5768: $21 $09 $59
    add  hl, de                                   ; $576B: $19
    ld   a, [hl]                                  ; $576C: $7E
    jr   jr_001_5792                              ; $576D: $18 $23

jr_001_576F::
    ld   a, [wDBB4]                               ; $576F: $FA $B4 $DB
    cp   $24                                      ; $5772: $FE $24
    jr   z, .jr_577A                              ; $5774: $28 $04
    cp   $34                                      ; $5776: $FE $34
    jr   nz, jr_001_577E                          ; $5778: $20 $04

.jr_577A::
    ld_dialog_low a, Dialog076 ; "Goponga Swamp"  ; $577A: $3E $76
    jr   jr_001_5792                              ; $577C: $18 $14

jr_001_577E::
    rra                                           ; $577E: $1F
    and  $07                                      ; $577F: $E6 $07
    ld   e, a                                     ; $5781: $5F
    ld   a, [wDBB4]                               ; $5782: $FA $B4 $DB
    rra                                           ; $5785: $1F
    rra                                           ; $5786: $1F
    and  $38                                      ; $5787: $E6 $38
    or   e                                        ; $5789: $B3
    ld   e, a                                     ; $578A: $5F
    ld   d, $00                                   ; $578B: $16 $00
    ld   hl, MapLocationNamesTable                ; $578D: $21 $C9 $58
    add  hl, de                                   ; $5790: $19
    ld   a, [hl]                                  ; $5791: $7E

jr_001_5792::
    call OpenDialogInTable0                       ; $5792: $CD $85 $23
    ld   a, [wDialogIndex]                        ; $5795: $FA $73 $C1
    cp   $A7                                      ; $5798: $FE $A7
    jr   z, .jr_57A3                              ; $579A: $28 $07
    ld   a, [wDBB4]                               ; $579C: $FA $B4 $DB
    cp   $37                                      ; $579F: $FE $37
    jr   nz, jr_001_57A8                          ; $57A1: $20 $05

.jr_57A3::
    ld   a, $01                                   ; $57A3: $3E $01
    ld   [wDialogIndexHi], a                      ; $57A5: $EA $12 $C1

jr_001_57A8::
    ld   a, [wDBB4]                               ; $57A8: $FA $B4 $DB
    cp   $70                                      ; $57AB: $FE $70
    ld   a, $01                                   ; $57AD: $3E $01
    jr   nc, .jr_57B3                             ; $57AF: $30 $02
    ld   a, $81                                   ; $57B1: $3E $81

.jr_57B3::
    ld   [wDialogState], a                        ; $57B3: $EA $9F $C1
    ret                                           ; $57B6: $C9

; POI: Debug code to warp to any room on the map by pushing B + Select (on the map screen)
jr_001_57B7::
    ld   a, [ROM_DebugTool1]                    ; If we weren't pushing A above, then ; $57B7: $FA $03 $00
    and  a                                      ; Check the first debug flag ; $57BA: $A7
    jr   z, .jr_57FA                         ; If the debug flag is off, skip this ; $57BB: $28 $3D
    ldh  a, [hPressedButtonsMask]               ; Otherwise, are we holding SELECT / B? ; $57BD: $F0 $CB
    cp   J_SELECT | J_B                           ; $57BF: $FE $60
    jr   nz, .jr_57FA                        ; If yes, skip this too ; $57C1: $20 $37
    ld   a, GAMEPLAY_WORLD                      ; Otherwise, warp somewhere ; $57C3: $3E $0B
    ld   [wGameplayType], a                       ; $57C5: $EA $95 $DB
    call ApplyMapFadeOutTransitionWithNoise       ; $57C8: $CD $7D $0C
    ld   a, $00                                   ; $57CB: $3E $00
    ld   [wWarp0MapCategory], a                   ; $57CD: $EA $01 $D4
    ld   [wWarp0Map], a                           ; $57D0: $EA $02 $D4
    ld   a, [wDBB4]                               ; $57D3: $FA $B4 $DB
    ld   [wWarp0Room], a                          ; $57D6: $EA $03 $D4
    ld   a, $48                                   ; $57D9: $3E $48
    ld   [wWarp0DestinationX], a                  ; $57DB: $EA $04 $D4
    ld   a, $52                                   ; $57DE: $3E $52
    ld   [wWarp0DestinationY], a                  ; $57E0: $EA $05 $D4
    ldh  a, [hLinkPositionX]                      ; $57E3: $F0 $98
    swap a                                        ; $57E5: $CB $37
    and  $0F                                      ; $57E7: $E6 $0F
    ld   e, a                                     ; $57E9: $5F
    ldh  a, [hLinkPositionY]                      ; $57EA: $F0 $99
    sub  a, $08                                   ; $57EC: $D6 $08
    and  $F0                                      ; $57EE: $E6 $F0
    or   e                                        ; $57F0: $B3
    ld   [wWarp0PositionTileIndex], a             ; $57F1: $EA $16 $D4
    ld   a, $07                                   ; $57F4: $3E $07
    ld   [wGameplaySubtype], a                    ; $57F6: $EA $96 $DB
    ret                                           ; $57F9: $C9

.jr_57FA::
    ld   e, J_SELECT                              ; $57FA: $1E $40
    ld   a, [ROM_DebugTool1]                      ; $57FC: $FA $03 $00
    and  a                                        ; $57FF: $A7
    jr   nz, .jr_5804                             ; $5800: $20 $02
    ld   e, J_SELECT | J_B                        ; $5802: $1E $60

.jr_5804::
    ldh  a, [hJoypadState]                        ; $5804: $F0 $CC
    and  e                                        ; $5806: $A3
    jr   z, label_001_5818                        ; $5807: $28 $0F
    xor  a                                        ; $5809: $AF
    ld   [wTransitionSequenceCounter], a          ; $580A: $EA $6B $C1
    ld   [wC16C], a                               ; $580D: $EA $6C $C1
    ld   a, $01                                   ; $5810: $3E $01
    ld   [wPaletteUnknownE], a                    ; $5812: $EA $D5 $DD
    call IncrementGameplaySubtype                 ; $5815: $CD $D6 $44

label_001_5818::
    call func_001_58A8                            ; $5818: $CD $A8 $58
    call func_001_5A71                            ; $581B: $CD $71 $5A
    call func_001_5C49                            ; $581E: $CD $49 $5C
    ret                                           ; $5821: $C9
