;
; Handling of animated background tiles and Link's sprite
;

; Special case for the sequence with Marin and Link chatting on the beach
AnimateMarinBeachTiles::
    ld   a, [wDrawCommand]                        ;; 00:1ACC $FA $01 $D6
    and  a                                        ;; 00:1ACF $A7
    ret  nz                                       ;; 00:1AD0 $C0
    ld   a, BANK(MarinBeachWavesTiles)            ;; 00:1AD1 $3E $10
    call AdjustBankNumberForGBC                   ;; 00:1AD3 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1AD6 $EA $00 $21
    ld   hl, MarinBeachWavesTiles                 ;; 00:1AD9 $21 $00 $65
    ld   de, vTiles2 + $500                       ;; 00:1ADC $11 $00 $95
    ldh  a, [hFrameCounter]                       ;; 00:1ADF $F0 $E7
    and  $0F                                      ;; 00:1AE1 $E6 $0F
    jr   z, .skip                                 ;; 00:1AE3 $28 $06
    cp   $08                                      ;; 00:1AE5 $FE $08
    ret  nz                                       ;; 00:1AE7 $C0
    ld   l, $40                                   ;; 00:1AE8 $2E $40
    ld   e, l                                     ;; 00:1AEA $5D

.skip
    ldh  a, [hFrameCounter]                       ;; 00:1AEB $F0 $E7
    and  $30                                      ;; 00:1AED $E6 $30
    ld   c, a                                     ;; 00:1AEF $4F
    ld   b, $00                                   ;; 00:1AF0 $06 $00
    sla  c                                        ;; 00:1AF2 $CB $21
    rl   b                                        ;; 00:1AF4 $CB $10
    sla  c                                        ;; 00:1AF6 $CB $21
    rl   b                                        ;; 00:1AF8 $CB $10
    sla  c                                        ;; 00:1AFA $CB $21
    rl   b                                        ;; 00:1AFC $CB $10
    add  hl, bc                                   ;; 00:1AFE $09
    ld   bc, $40                                  ;; 00:1AFF $01 $40 $00
    jp   CopyData                                 ;; 00:1B02 $C3 $14 $29
    jr   nz, AnimateTiles.doWorldAnimations       ;; 00:1B05 $20 $60
    and  b                                        ;; 00:1B07 $A0
    ldh  [hMultiPurpose9], a                      ;; 00:1B08 $E0 $E0
    ldh  [hLinkFinalPositionY], a                 ;; 00:1B0A $E0 $A0
    ld   h, b                                     ;; 00:1B0C $60

; Update tiles during V-Blank.
;
; This can be either:
;
; - a special case during the intro sequence,
; - a replacement of some individual tiles (if hReplaceTiles is set)
; - an update to the BG animated tiles group (if hAnimatedTilesGroup is set)
;
; After any of these cases, the code then jumps to DrawLinkSprite.
;
; Animated tiles work in groups of 4 tiles.
; Every n frame, the animation frame pointer is incremented,
; and the next frame of the animation is copied into the Tiles memory.
AnimateTiles::
    ;
    ; Animate Marin dialog on beach tiles
    ;

    ; If GameplayType == MARIN_BEACH, handle special case
    ld   a, [wGameplayType]                       ;; 00:1B0D $FA $95 $DB
    cp   GAMEPLAY_MARIN_BEACH                     ;; 00:1B10 $FE $09
    jr   z, AnimateMarinBeachTiles                ;; 00:1B12 $28 $B8

    ;
    ; Animate Intro sequence tiles
    ;

    ; If GameplayType == INTRO, handle the tile animation manually,
    ; and don't perform any further animation.
    cp   GAMEPLAY_INTRO                           ;; 00:1B14 $FE $00
    jr   nz, .introEnd                            ;; 00:1B16 $20 $2E
    ; If there is no transfer request pending…
    ld   a, [wDrawCommand]                        ;; 00:1B18 $FA $01 $D6
    and  a                                        ;; 00:1B1B $A7
    jp   nz, .return                              ;; 00:1B1C $C2 $45 $1B
    ; … and the frame count is >= 4
    ldh  a, [hFrameCounter]                       ;; 00:1B1F $F0 $E7
    and  $0F                                      ;; 00:1B21 $E6 $0F
    cp   $04                                      ;; 00:1B23 $FE $04
    jr   c, .return                               ;; 00:1B25 $38 $1E
    ; Switch to the bank with intro tiles
    ld   a, $10                                   ;; 00:1B27 $3E $10
    call AdjustBankNumberForGBC                   ;; 00:1B29 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1B2C $EA $00 $21
    ; Copy 32 bytes of data from address stored at wD006 to address stored at wD008
    ld   a, [wD006]                               ;; 00:1B2F $FA $06 $D0
    ld   l, a                                     ;; 00:1B32 $6F
    ld   a, [wD007]                               ;; 00:1B33 $FA $07 $D0
    ld   h, a                                     ;; 00:1B36 $67
    ld   a, [wD008]                               ;; 00:1B37 $FA $08 $D0
    ld   e, a                                     ;; 00:1B3A $5F
    ld   a, [wD009]                               ;; 00:1B3B $FA $09 $D0
    ld   d, a                                     ;; 00:1B3E $57
    ld   bc, $20                                  ;; 00:1B3F $01 $20 $00
    jp   CopyData                                 ;; 00:1B42 $C3 $14 $29
.return
    ; Return early
    ret                                           ;; 00:1B45 $C9
.introEnd

    ; If during Credits…
    ld   a, [wGameplayType]                       ;; 00:1B46 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 00:1B49 $FE $01
    jr   nz, .creditsEnd                          ;; 00:1B4B $20 $06
    ; …and there are tiles to replace…
    ldh  a, [hReplaceTiles]                       ;; 00:1B4D $F0 $A5
    and  a                                        ;; 00:1B4F $A7
    ; …jump directly to tiles replacing.
    jr   nz, AnimateTiles.replaceTiles            ;; 00:1B50 $20 $30
    ret                                           ;; 00:1B52 $C9
.creditsEnd

    ;
    ; Animate World tiles
    ;

    ; If GameplayType > WORLD
    cp   GAMEPLAY_WORLD                           ;; 00:1B53 $FE $0B
    jp   c, AnimateTiles_return ; return immediately ;; 00:1B55 $DA $E8 $1D

    ; If the Inventory window is overlapping the screen
    ld   a, [wWindowY]                            ;; 00:1B58 $FA $9A $DB
    cp   $80                                      ;; 00:1B5B $FE $80
    jp   nz, AnimateTiles_return ; return immediately ;; 00:1B5D $C2 $E8 $1D

    ; If the Inventory apparition animation is running,
    ; only animate Link's sprite.
    ld   a, [wInventoryAppearing]                 ;; 00:1B60 $FA $4F $C1
    and  a                                        ;; 00:1B63 $A7
    jp   nz, DrawLinkSpriteAndReturn              ;; 00:1B64 $C2 $2E $1D

.doWorldAnimations
    ; If there is a pending request or a map transition,
    ; only animate Link's sprite.
    ld   hl, wRoomTransitionState                 ;; 00:1B67 $21 $24 $C1
    ld   a, [wDrawCommand]                        ;; 00:1B6A $FA $01 $D6
    or   [hl]                                     ;; 00:1B6D $B6
    jp   nz, DrawLinkSpriteAndReturn              ;; 00:1B6E $C2 $2E $1D

    ; If a switchable object is being animated, update its tiles and return.
    ld   a, [wSwitchableObjectAnimationStage]     ;; 00:1B71 $FA $F8 $D6
    and  a                                        ;; 00:1B74 $A7
    jr   z, .switchableObjectEnd                  ;; 00:1B75 $28 $06
    call UpdateSwitchBlockTiles                   ;; 00:1B77 $CD $D7 $1E
    jp   DrawLinkSpriteAndReturn                  ;; 00:1B7A $C3 $2E $1D
.switchableObjectEnd

    ;
    ; Replace individual tiles
    ;

    ; If hReplaceTiles != 0, update individual tiles and return.
    ldh  a, [hReplaceTiles]                       ;; 00:1B7D $F0 $A5
    and  a                                        ;; 00:1B7F $A7
    jr   z, .tilesReplacementEnd                  ;; 00:1B80 $28 $4B

.replaceTiles
    cp   REPLACE_TILES_EE_RIDER_VISIBLE           ;; 00:1B82 $FE $01
    jp   z, ReplaceEvilEagleRiderVisibleTiles     ;; 00:1B84 $CA $93 $3F
    cp   REPLACE_TILES_EE_RIDER_HIDDEN            ;; 00:1B87 $FE $02
    jp   z, ReplaceEvilEagleRiderHiddenTiles      ;; 00:1B89 $CA $A9 $3F
    cp   REPLACE_TILES_BUTTON_PRESSED             ;; 00:1B8C $FE $03
    jp   z, ReplaceTilesButtonPressed             ;; 00:1B8E $CA $B5 $1E
    cp   REPLACE_TILES_UNKNOWN_04                 ;; 00:1B91 $FE $04
    jp   z, ReplaceTiles_04                       ;; 00:1B93 $CA $BC $1E
    cp   REPLACE_TILES_UNKNOWN_08                 ;; 00:1B96 $FE $08
    jp   z, ReplaceTiles_08                       ;; 00:1B98 $CA $69 $1E
    cp   REPLACE_TILES_GOLDEN_LEAF                ;; 00:1B9B $FE $09
    jp   z, ReplaceSlimeKeyTilesByGoldenLeaf      ;; 00:1B9D $CA $A1 $1E
    cp   REPLACE_TILES_TOADSTOOL                  ;; 00:1BA0 $FE $0A
    jp   z, ReplaceMagicPowderTilesByToadstool    ;; 00:1BA2 $CA $2B $1E
    cp   REPLACE_TILES_MAGIC_POWDER               ;; 00:1BA5 $FE $0B
    jp   z, ReplaceToadstoolTilesByMagicPowder    ;; 00:1BA7 $CA $8D $1E
    cp   REPLACE_TILES_SIRENS_INSTRUMENT          ;; 00:1BAA $FE $0C
    jp   z, ReplaceDialogTilesByInstruments       ;; 00:1BAC $CA $33 $1E
    cp   REPLACE_TILES_TRADING_ITEM               ;; 00:1BAF $FE $0D
    jp   z, ReplaceTradingItemTiles               ;; 00:1BB1 $CA $01 $1E
    cp   REPLACE_TILES_ISLAND_FADE                ;; 00:1BB4 $FE $0E
    jr   z, .animateCreditsIslandFadeTiles        ;; 00:1BB6 $28 $0D
    cp   REPLACE_TILES_MARIN_SITTING              ;; 00:1BB8 $FE $0F
    jp   z, ReplaceMarinTiles.sitting             ;; 00:1BBA $CA $F0 $1D
    cp   REPLACE_TILES_MARIN_STANDING             ;; 00:1BBD $FE $10
    jp   z, ReplaceMarinTiles.standingUp          ;; 00:1BBF $CA $E9 $1D

    ; Invalid tiles replacement id: draw Link's sprite and return.
    jp   DrawLinkSpriteAndReturn                  ;; 00:1BC2 $C3 $2E $1D

.animateCreditsIslandFadeTiles
    jpsb AnimateCreditsIslandFadeTiles            ;; 00:1BC5 $3E $17 $EA $00 $21 $C3 $62 $40

.tilesReplacementEnd

    ;
    ; Animate tiles groups
    ;

    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1BCD $F0 $A6
    inc  a                                        ;; 00:1BCF $3C
    ldh  [hAnimatedTilesFrameCount], a            ;; 00:1BD0 $E0 $A6

.jumpTable
    ldh  a, [hAnimatedTilesGroup]                 ;; 00:1BD2 $F0 $A4
    JP_TABLE                                      ;; 00:1BD4 $C7
._00 dw SkipTilesGroupAnimation                   ;; 00:1BD5
._01 dw AnimateCounterTilesGroup                  ;; 00:1BD7
._02 dw AnimateTideTilesGroup                     ;; 00:1BD9
._03 dw AnimateVillageTilesGroup                  ;; 00:1BDB
._04 dw AnimateDungeon1TilesGroup                 ;; 00:1BDD
._05 dw AnimateUndergroundTilesGroup              ;; 00:1BDF
._06 dw AnimateLavaTilesGroup                     ;; 00:1BE1
._07 dw AnimateDungeon2TilesGroup                 ;; 00:1BE3
._08 dw AnimateWarpTilesGroup                     ;; 00:1BE5
._09 dw AnimateWaterCurrentsTilesGroup            ;; 00:1BE7
._0A dw AnimateWaterfallTilesGroup                ;; 00:1BE9
._0B dw AnimateSlowWaterfallTilesGroup            ;; 00:1BEB
._0C dw AnimateWaterDungeonTilesGroup             ;; 00:1BED
._0D dw AnimateLightBeamTilesGroup                ;; 00:1BEF
._0E dw AnimateCrystalBlockTilesGroup             ;; 00:1BF1
._0F dw AnimateBubblesTilesGroup                  ;; 00:1BF3
._10 dw AnimateWeatherVaneTilesGroup              ;; 00:1BF5
._11 dw AnimatePhotoTilesGroup                    ;; 00:1BF7

AnimateCounterTilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1BF9 $F0 $A6
    and  $07                                      ;; 00:1BFB $E6 $07
    jp   nz, SkipTilesGroupAnimation              ;; 00:1BFD $C2 $1E $1D
    callsb LoadCounterAnimatedTiles               ;; 00:1C00 $3E $01 $EA $00 $21 $CD $AA $61
    ld   a, $0C                                   ;; 00:1C08 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1C0A $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1C0D $EA $00 $21
    jp   DrawLinkSpriteAndReturn                  ;; 00:1C10 $C3 $2E $1D

; Load the given frame for the animated tiles group
; Inputs:
;   h    the animated tiles group id
;   a    the data offset for the frame to load
LoadAnimatedTilesFrameAtOffset::
    ld   l, a                                     ;; 00:1C13 $6F
    jr   LoadAnimatedTilesFrame                   ;; 00:1C14 $18 $3B

AnimateTideTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $1              ;; 00:1C16 $26 $6B
    jr   AnimateTilesSlowSpeed                    ;; 00:1C18 $18 $0A

AnimateVillageTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $2              ;; 00:1C1A $26 $6C
    jr   AnimateTilesSlowSpeed                    ;; 00:1C1C $18 $06

AnimateWaterDungeonTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $9              ;; 00:1C1E $26 $73
    jr   AnimateTilesSlowSpeed                    ;; 00:1C20 $18 $02

AnimateSlowWaterfallTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $0              ;; 00:1C22 $26 $6A

AnimateTilesSlowSpeed::
    ; If (FrameCount mod $0F) = 0, animate
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1C24 $F0 $A6
    and  $0F                                      ;; 00:1C26 $E6 $0F
    jp   nz, SkipTilesGroupAnimation              ;; 00:1C28 $C2 $1E $1D
    call IncrementAnimatedTilesDataOffset         ;; 00:1C2B $CD $E8 $1C
    jp   LoadAnimatedTilesFrameAtOffset           ;; 00:1C2E $C3 $13 $1C

AnimatedTilesDataOffsets::
    db 0, $40, $80, $C0, $C0, $C0, $80, $40       ;; 00:1C31

AnimateDungeon1TilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1C39 $F0 $A6
    and  $07                                      ;; 00:1C3B $E6 $07
    jp   nz, SkipTilesGroupAnimation              ;; 00:1C3D $C2 $1E $1D
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1C40 $F0 $A6
    rra                                           ;; 00:1C42 $1F
    rra                                           ;; 00:1C43 $1F
    rra                                           ;; 00:1C44 $1F
    and  $07                                      ;; 00:1C45 $E6 $07
    ld   e, a                                     ;; 00:1C47 $5F
    ld   d, $00                                   ;; 00:1C48 $16 $00
    ld   hl, AnimatedTilesDataOffsets             ;; 00:1C4A $21 $31 $1C
    add  hl, de                                   ;; 00:1C4D $19
    ld   l, [hl]                                  ;; 00:1C4E $6E
    ld   h, HIGH(AnimatedTiles) + $3              ;; 00:1C4F $26 $6D

; Load the given frame for the animated tiles group
; Inputs:
;  hl  frames location
;  de  target location
;  bc  frame size
LoadAnimatedTilesFrame::
    ; Copy the tiles data
    ld   de, vTiles2 + $6C0                       ;; 00:1C51 $11 $C0 $96
.de
    ld   bc, $40                                  ;; 00:1C54 $01 $40 $00
    call CopyData                                 ;; 00:1C57 $CD $14 $29

    ; Do special case for MAP_COLOR_DUNGEON
    ldh  a, [hMapId]                              ;; 00:1C5A $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:1C5C $FE $FF
    jr   nz, .endMapFF                            ;; 00:1C5E $20 $27

    ld   a, BANK(ConfigureAnimatedTilesCopy)      ;; 00:1C60 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:1C62 $EA $00 $21
    ld   b, $01                                   ;; 00:1C65 $06 $01
    call ConfigureAnimatedTilesCopy               ;; 00:1C67 $CD $F7 $47
    jr   z, .next                                 ;; 00:1C6A $28 $06
    ld   [rSelectROMBank], a                      ;; 00:1C6C $EA $00 $21
    call CopyData                                 ;; 00:1C6F $CD $14 $29
.next
    ld   a, BANK(ConfigureAnimatedTilesCopy)      ;; 00:1C72 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:1C74 $EA $00 $21
    ld   b, $00                                   ;; 00:1C77 $06 $00
    call ConfigureAnimatedTilesCopy               ;; 00:1C79 $CD $F7 $47
    jr   z, .endMapFF                             ;; 00:1C7C $28 $09
    ld   [rSelectROMBank], a                      ;; 00:1C7E $EA $00 $21
    ld   de, $96C0                                ;; 00:1C81 $11 $C0 $96
    call CopyData                                 ;; 00:1C84 $CD $14 $29
.endMapFF

    jp   DrawLinkSpriteAndReturn                  ;; 00:1C87 $C3 $2E $1D

AnimateUndergroundTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $4              ;; 00:1C8A $26 $6E
    jr   AnimateTilesSlowSpeed                    ;; 00:1C8C $18 $96

AnimateLavaTilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1C8E $F0 $A6
    and  $07                                      ;; 00:1C90 $E6 $07
    jp   nz, SkipTilesGroupAnimation              ;; 00:1C92 $C2 $1E $1D
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1C95 $F0 $A6
    rra                                           ;; 00:1C97 $1F
    rra                                           ;; 00:1C98 $1F
    rra                                           ;; 00:1C99 $1F
    and  $07                                      ;; 00:1C9A $E6 $07
    ld   e, a                                     ;; 00:1C9C $5F
    ld   d, $00                                   ;; 00:1C9D $16 $00
    ld   hl, AnimatedTilesDataOffsets             ;; 00:1C9F $21 $31 $1C
    add  hl, de                                   ;; 00:1CA2 $19
    ld   l, [hl]                                  ;; 00:1CA3 $6E
    ld   h, HIGH(AnimatedTiles) + $5              ;; 00:1CA4 $26 $6F
    jp   LoadAnimatedTilesFrame                   ;; 00:1CA6 $C3 $51 $1C

AnimateDungeon2TilesGroup::
    ld   hl, wAnimatedScrollingTilesStorage       ;; 00:1CA9 $21 $C0 $DC
    ldh  a, [hMapId]                              ;; 00:1CAC $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:1CAE $FE $FF
    jr   nz, label_1CB8                           ;; 00:1CB0 $20 $06
    ld   de, $8400                                ;; 00:1CB2 $11 $00 $84
    jp   LoadAnimatedTilesFrame.de                ;; 00:1CB5 $C3 $54 $1C

label_1CB8::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1CB8 $F0 $A6
    inc  a                                        ;; 00:1CBA $3C
    and  $03                                      ;; 00:1CBB $E6 $03
    jp   nz, AnimateDungeon1TilesGroup            ;; 00:1CBD $C2 $39 $1C
    ld   de, $90C0                                ;; 00:1CC0 $11 $C0 $90
    jp   LoadAnimatedTilesFrame.de                ;; 00:1CC3 $C3 $54 $1C

AnimateWarpTilesGroup::
IF __PATCH_3__
    ld   a, BANK(AnimatedTiles)
    call AdjustBankNumberForGBC
    ld   [rSelectROMBank], a
ENDC
    ld   h, HIGH(AnimatedTiles) + $6              ;; 00:1CC6 $26 $70

AnimateTilesMediumSpeed::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1CC8 $F0 $A6
    and  $07                                      ;; 00:1CCA $E6 $07
    jp   nz, SkipTilesGroupAnimation              ;; 00:1CCC $C2 $1E $1D
    call IncrementAnimatedTilesDataOffset         ;; 00:1CCF $CD $E8 $1C
    jp   LoadAnimatedTilesFrameAtOffset           ;; 00:1CD2 $C3 $13 $1C

AnimateWaterCurrentsTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $7              ;; 00:1CD5 $26 $71

AnimateTilesFastSpeed::
    ldh  a, [hAnimatedTilesFrameCount]            ;; 00:1CD7 $F0 $A6
    and  $03                                      ;; 00:1CD9 $E6 $03
    jp   nz, SkipTilesGroupAnimation              ;; 00:1CDB $C2 $1E $1D
    call IncrementAnimatedTilesDataOffset         ;; 00:1CDE $CD $E8 $1C
    jp   LoadAnimatedTilesFrameAtOffset           ;; 00:1CE1 $C3 $13 $1C

AnimateWaterfallTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $8              ;; 00:1CE4 $26 $72
    jr   AnimateTilesFastSpeed                    ;; 00:1CE6 $18 $EF

; Increment the current data offset by one frame.
; Return:
;   a   the new data offset
IncrementAnimatedTilesDataOffset::
    ldh  a, [hAnimatedTilesDataOffset]            ;; 00:1CE8 $F0 $A7
    add  a, $40                                   ;; 00:1CEA $C6 $40
    ldh  [hAnimatedTilesDataOffset], a            ;; 00:1CEC $E0 $A7
    ret                                           ;; 00:1CEE $C9

AnimateLightBeamTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $B              ;; 00:1CEF $26 $75
    jr   AnimateTilesFastSpeed                    ;; 00:1CF1 $18 $E4

AnimateBubblesTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $A              ;; 00:1CF3 $26 $74
    jr   AnimateTilesMediumSpeed                  ;; 00:1CF5 $18 $D1

AnimateWeatherVaneTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $D              ;; 00:1CF7 $26 $77
    jr   AnimateTilesMediumSpeed                  ;; 00:1CF9 $18 $CD

AnimateCrystalBlockTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $C              ;; 00:1CFB $26 $76
    jr   AnimateTilesMediumSpeed                  ;; 00:1CFD $18 $C9

AnimatePhotoTilesGroup::
    callsb func_038_7830                          ;; 00:1CFF $3E $38 $EA $00 $21 $CD $30 $78
    jp   DrawLinkSpriteAndReturn                  ;; 00:1D07 $C3 $2E $1D

; Copy D bytes from BC to HL, then return to bank 20.
; Inputs:
;   d    number of bytes to copy
;   bc   source address
;   hl   target address in VRAM
CopyLinkTilesPair::
    ld   a, BANK(LinkCharacterTiles)              ;; 00:1D0A $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1D0C $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1D0F $EA $00 $21

.loop
    ld   a, [bc]                                  ;; 00:1D12 $0A
    inc  bc                                       ;; 00:1D13 $03
    ldi  [hl], a                                  ;; 00:1D14 $22
    dec  d                                        ;; 00:1D15 $15
    jr   nz, .loop                                ;; 00:1D16 $20 $FA

    ld   a, BANK(func_020_54F5)                   ;; 00:1D18 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:1D1A $EA $00 $21
    ret                                           ;; 00:1D1D $C9

SkipTilesGroupAnimation::
    callsb func_020_54F5                          ;; 00:1D1E $3E $20 $EA $00 $21 $CD $F5 $54
    ld   a, $0C                                   ;; 00:1D26 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1D28 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1D2B $EA $00 $21

; Called during V-Blank
DrawLinkSprite::
DrawLinkSpriteAndReturn::
    ldh  a, [hLinkAnimationState]                 ;; 00:1D2E $F0 $9D
    inc  a                                        ;; 00:1D30 $3C
    ret  z                                        ;; 00:1D31 $C8
    ldh  a, [hIsGBC]                              ;; 00:1D32 $F0 $FE
    and  a                                        ;; 00:1D34 $A7
    jr   z, .jr_1D42                              ;; 00:1D35 $28 $0B
    ld   a, [wInvincibilityCounter]               ;; 00:1D37 $FA $C7 $DB
    and  $04                                      ;; 00:1D3A $E6 $04
    jr   z, .jr_1D49                              ;; 00:1D3C $28 $0B
    ld   a, $04                                   ;; 00:1D3E $3E $04
    jr   .jr_1D49                                 ;; 00:1D40 $18 $07

.jr_1D42
    ld   a, [wInvincibilityCounter]               ;; 00:1D42 $FA $C7 $DB
    rla                                           ;; 00:1D45 $17
    rla                                           ;; 00:1D46 $17
    and  $10                                      ;; 00:1D47 $E6 $10

.jr_1D49
    ld   [wC135], a                               ;; 00:1D49 $EA $35 $C1

    ld   hl, wLinkOAMBuffer+8                     ;; 00:1D4C $21 $08 $C0

    ;
    ; Write position of first Link sprite to wLinkOAMBuffer
    ;

    ; a = [wC13B] + [wC145]
    ld   a, [wC13B]                               ;; 00:1D4F $FA $3B $C1
    ld   c, a                                     ;; 00:1D52 $4F
    ld   a, [wC145]                               ;; 00:1D53 $FA $45 $C1
    add  a, c                                     ;; 00:1D56 $81
    cp   $88                                      ;; 00:1D57 $FE $88
    ret  nc                                       ;; 00:1D59 $D0

    ; wLinkOAMBuffer[8 + 0] = a
    push af                                       ;; 00:1D5A $F5
    ldi  [hl], a                                  ;; 00:1D5B $22

    ld   a, [wC13C]                               ;; 00:1D5C $FA $3C $C1
    ld   c, a                                     ;; 00:1D5F $4F
    ldh  a, [hLinkPositionX]                      ;; 00:1D60 $F0 $98
    add  a, c                                     ;; 00:1D62 $81
    ; wLinkOAMBuffer[8 + 1] = a
    ldi  [hl], a                                  ;; 00:1D63 $22
IF __OPTIMIZATIONS_1__
    xor  a
ELSE
    ld   a, $00                                   ;; 00:1D64 $3E $00
ENDC
    ldi  [hl], a                                  ;; 00:1D66 $22

    ld   a, [wC135]                               ;; 00:1D67 $FA $35 $C1
    ld   d, a                                     ;; 00:1D6A $57
    ld   a, [wC11D]                               ;; 00:1D6B $FA $1D $C1
    or   d                                        ;; 00:1D6E $B2
    ld   [hl], a                                  ;; 00:1D6F $77

    ldh  a, [hIsGBC]                              ;; 00:1D70 $F0 $FE
    and  a                                        ;; 00:1D72 $A7
    jr   z, label_1DA1                            ;; 00:1D73 $28 $2C
    ld   a, [wInvincibilityCounter]               ;; 00:1D75 $FA $C7 $DB
    and  $04                                      ;; 00:1D78 $E6 $04
    jr   nz, label_1DA1                           ;; 00:1D7A $20 $25
    ldh  a, [hLinkAnimationState]                 ;; 00:1D7C $F0 $9D
    cp   LINK_ANIMATION_STATE_REVOLVING_DOOR_1    ;; 00:1D7E $FE $50
    jr   c, label_1D8C                            ;; 00:1D80 $38 $0A
    cp   LINK_ANIMATION_STATE_FALLING_PIT_1       ;; 00:1D82 $FE $55
    jr   nc, label_1D8C                           ;; 00:1D84 $30 $06
    ld   a, [hl]                                  ;; 00:1D86 $7E
    or   $07                                      ;; 00:1D87 $F6 $07
    ld   [hl], a                                  ;; 00:1D89 $77
    jr   label_1DA1                               ;; 00:1D8A $18 $15

label_1D8C::
    ld   a, [wTunicType]                          ;; 00:1D8C $FA $0F $DC
    and  a                                        ;; 00:1D8F $A7
    jr   z, label_1D95                            ;; 00:1D90 $28 $03
    inc  a                                        ;; 00:1D92 $3C
    or   [hl]                                     ;; 00:1D93 $B6
    ld   [hl], a                                  ;; 00:1D94 $77

label_1D95::
    ldh  a, [hLinkAnimationState]                 ;; 00:1D95 $F0 $9D
    cp   LINK_ANIMATION_STATE_HOLD_SWIMMING_2     ;; 00:1D97 $FE $4E
    jr   z, label_1D9F                            ;; 00:1D99 $28 $04
    cp   LINK_ANIMATION_STATE_MOVING_SWIMMING_2   ;; 00:1D9B $FE $4F
    jr   nz, label_1DA1                           ;; 00:1D9D $20 $02

label_1D9F::
    ld   [hl], $03                                ;; 00:1D9F $36 $03

label_1DA1::
    ;
    ; Write position of second Link sprite to wLinkOAMBuffer

    inc  hl                                       ;; 00:1DA1 $23
    pop  af                                       ;; 00:1DA2 $F1

    ldi  [hl], a                                  ;; 00:1DA3 $22

    ldh  a, [hLinkPositionX]                      ;; 00:1DA4 $F0 $98
    add  a, c                                     ;; 00:1DA6 $81
    add  a, $08                                   ;; 00:1DA7 $C6 $08
    ldi  [hl], a                                  ;; 00:1DA9 $22

    ld   a, $02                                   ;; 00:1DAA $3E $02
    ldi  [hl], a                                  ;; 00:1DAC $22
    ld   a, [wC135]                               ;; 00:1DAD $FA $35 $C1
    ld   d, a                                     ;; 00:1DB0 $57
    ld   a, [wC11E]                               ;; 00:1DB1 $FA $1E $C1
    or   d                                        ;; 00:1DB4 $B2
    ld   [hl], a                                  ;; 00:1DB5 $77
    ldh  a, [hIsGBC]                              ;; 00:1DB6 $F0 $FE
    and  a                                        ;; 00:1DB8 $A7
    jr   z, label_1DE7                            ;; 00:1DB9 $28 $2C
    ld   a, [wInvincibilityCounter]               ;; 00:1DBB $FA $C7 $DB
    and  $04                                      ;; 00:1DBE $E6 $04
    jr   nz, label_1DE7                           ;; 00:1DC0 $20 $25
    ldh  a, [hLinkAnimationState]                 ;; 00:1DC2 $F0 $9D
    cp   $50                                      ;; 00:1DC4 $FE $50
    jr   c, label_1DD2                            ;; 00:1DC6 $38 $0A
    cp   $55                                      ;; 00:1DC8 $FE $55
    jr   nc, label_1DD2                           ;; 00:1DCA $30 $06
    ld   a, [hl]                                  ;; 00:1DCC $7E
    or   $07                                      ;; 00:1DCD $F6 $07
    ld   [hl], a                                  ;; 00:1DCF $77
    jr   label_1DE7                               ;; 00:1DD0 $18 $15

label_1DD2::
    ld   a, [wTunicType]                          ;; 00:1DD2 $FA $0F $DC
    and  a                                        ;; 00:1DD5 $A7
    jr   z, label_1DDB                            ;; 00:1DD6 $28 $03
    inc  a                                        ;; 00:1DD8 $3C
    or   [hl]                                     ;; 00:1DD9 $B6
    ld   [hl], a                                  ;; 00:1DDA $77

label_1DDB::
    ldh  a, [hLinkAnimationState]                 ;; 00:1DDB $F0 $9D
    cp   LINK_ANIMATION_STATE_HOLD_SWIMMING_2     ;; 00:1DDD $FE $4E
    jr   z, label_1DE5                            ;; 00:1DDF $28 $04
    cp   LINK_ANIMATION_STATE_MOVING_SWIMMING_2   ;; 00:1DE1 $FE $4F
    jr   nz, label_1DE7                           ;; 00:1DE3 $20 $02

label_1DE5::
    ld   [hl], $23                                ;; 00:1DE5 $36 $23

label_1DE7::
    inc  hl                                       ;; 00:1DE7 $23

AnimateTiles_return::
    ret                                           ;; 00:1DE8 $C9

; Switch a single Marin sprite (4 tiles) between the default
; one (Marin standing up) and a special one (Marin sitting on the
; ground).
ReplaceMarinTiles::
.standingUp
    ; Marin default tile
    ld   hl, Npc1Tiles + $F00                     ;; 00:1DE9 $21 $00 $4F
    ld   a, BANK(Npc1Tiles)                       ;; 00:1DEC $3E $0E
    jr   .copyTiles                               ;; 00:1DEE $18 $05

.sitting
    ; Marin sitting on the ground
    ld   a, BANK(Npc3Tiles)                       ;; 00:1DF0 $3E $12
    ld   hl, Npc3Tiles + $2080                    ;; 00:1DF2 $21 $80 $60

.copyTiles
    ld   [rSelectROMBank], a                      ;; 00:1DF5 $EA $00 $21
    ld   de, vTiles0 + $400                       ;; 00:1DF8 $11 $00 $84
    ld   bc, TILE_SIZE * 4                        ;; 00:1DFB $01 $40 $00
    jp   CopyDataAndDrawLinkSprite                ;; 00:1DFE $C3 $3B $1F

; Update the tile for the current trading item (4 tile),
; then draw Link's sprite.
ReplaceTradingItemTiles::
    ; If the first object wasn't traded yet, skip tiles update
    ; and just draw Link's prite.
    ld   a, [wTradeSequenceItem]                  ;; 00:1E01 $FA $0E $DB
    cp   TRADING_ITEM_RIBBON                      ;; 00:1E04 $FE $02
    jp  c, CopyDataAndDrawLinkSprite.drawLinkSprite ;; 00:1E06 $DA $3E $1F

    ; de = wTradeSequenceItem * 4
    sub  a, TRADING_ITEM_RIBBON                   ;; 00:1E09 $D6 $02
    ld   d, a                                     ;; 00:1E0B $57
    ld   e, $00                                   ;; 00:1E0C $1E $00
    sra  d                                        ;; 00:1E0E $CB $2A
    rr   e                                        ;; 00:1E10 $CB $1B
    sra  d                                        ;; 00:1E12 $CB $2A
    rr   e                                        ;; 00:1E14 $CB $1B

    ; Copy 4 tiles from Items1Tiles + de to VRAM
    ld   hl, Items1Tiles                          ;; 00:1E16 $21 $00 $44
    add  hl, de                                   ;; 00:1E19 $19
    ld   de, vTiles1 + $1A0                       ;; 00:1E1A $11 $A0 $89
    ld   bc, TILE_SIZE * 4                        ;; 00:1E1D $01 $40 $00
    ld   a, BANK(Items1Tiles)                     ;; 00:1E20 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1E22 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1E25 $EA $00 $21

    jp   CopyDataAndDrawLinkSprite                ;; 00:1E28 $C3 $3B $1F
