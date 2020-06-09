;
; Handling of animated background tiles and Link's sprite
;

; Special case for the sequence with Marin and Link chatting on the beach
AnimateMarinBeachTiles::
    ld   a, [wRequestDestinationHigh]
    and  a
    ret  nz
    ld   a, BANK(MarinBeachWavesTiles)
    ld   [MBC3SelectBank], a
    ld   hl, MarinBeachWavesTiles
    ld   de, vTiles2 + $500
    ldh  a, [hFrameCounter]
    and  $0F
    jr   z, .skip
    cp   $08
    ret  nz
    ld   l, $40
    ld   e, l

.skip
    ldh  a, [hFrameCounter]
    and  $30
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    sla  c
    rl   b
    add  hl, bc
    ld   bc, $40
    jp   CopyData
    jr   nz, AnimateTiles.doWorldAnimations
    and  b
    ldh  [hScratch9], a
    ldh  [hLinkFinalPositionY], a
    ld   h, b

; Animated tiles work in groups of 4 tiles.
; Every n frame, the animation frame pointer is incremented,
; and the next frame of the animation is copied into the Tiles memory.
AnimateTiles::
    ;
    ; Animate Marin dialog on beach tiles
    ;

    ; If GameplayType == MARIN_BEACH, handle special case
    ld   a, [wGameplayType]
    cp   GAMEPLAY_MARIN_BEACH
    jr   z, AnimateMarinBeachTiles

    ;
    ; Animate Intro sequence tiles
    ;

    ; If GameplayType == INTRO, handle the tile animation manually,
    ; and don't perform any further animation.
    cp   GAMEPLAY_INTRO
    jr   nz, .notIntro
    ; If there is no transfert request pending…
    ld   a, [wRequest]
    and  a
    jp   nz, .return
    ; … and the frame count is >= 4
    ldh  a, [hFrameCounter]
    and  $0F
    cp   $04
    jr   c, .return
    ; Switch to the bank with intro tiles
    ld   a, $10
    ld   [MBC3SelectBank], a
    ; Copy 32 bytes of data from address stored at $D006 to address stored at $D008
    ld   a, [$D006]
    ld   l, a
    ld   a, [$D007]
    ld   h, a
    ld   a, [$D008]
    ld   e, a
    ld   a, [$D009]
    ld   d, a
    ld   bc, $20
    call   CopyData
.return
    ; Return early
    ret

.notIntro

    ; If GameplayType != CREDITS, continue
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    jr   nz, .notCredits

    ; GameplayType == CREDITS
    ldh  a, [$FFA5]
    and  a                          ; if $FFA5 != 0
    jr   nz, AnimateTiles.animateEndCredits ;   handle end credits animated tiles
    ret

.notCredits
    ;
    ; Animate World tiles
    ;

    ; If GameplayType > WORLD
    cp   GAMEPLAY_WORLD
    jp   c, AnimateTiles_return ; return immediately

    ; If the Inventory window is overlapping the screen
    ld   a, [wWindowY]
    cp   $80
    jp   nz, AnimateTiles_return ; return immediately

    ; If the Inventory apparition animation is running,
    ; only animate Link's sprite.
    ld   a, [wInventoryAppearing]
    and  a
    jp   nz, DrawLinkSpriteAndReturn

.doWorldAnimations
    ; If there is a pending request or a map transition,
    ; only animate Link's sprite.
    ld   hl, wRoomTransitionState
    ld   a, [wRequest]
    or   [hl]
    jp   nz, DrawLinkSpriteAndReturn

    ; If $D6F8 != 0, handle special case
    ld   a, [$D6F8]
    and  a
    jr   z, .notD6F8
    call label_1ED7
    jp   DrawLinkSpriteAndReturn

.notD6F8
    ldh  a, [$FFA5]
    and  a
    jr   z, .notFFA5

.animateEndCredits
    ; a == $FFA5
    cp   $01
    jp   z, label_3F93
    cp   $02
    jp   z, label_3FA9
    cp   $03
    jp   z, label_1EB5
    cp   $04
    jp   z, label_1EBC
    cp   $08
    jp   z, label_1E69
    cp   $09
    jp   z, ReplaceSlimeKeyTilesByGoldenLeaf
    cp   $0A
    jp   z, ReplaceMagicPowderTilesByToadstool
    cp   $0B
    jp   z, label_1E8D
    cp   $0C
    jp   z, label_1E33
    cp   $0D
    jp   z, label_1E01
    cp   $0E
    jr   z, .animateCreditsIslandFadeTiles
    cp   $0F
    jp   z, label_1DF0
    cp   $10
    jp   z, label_1DE9
    jp   DrawLinkSpriteAndReturn

.animateCreditsIslandFadeTiles
    jpsb AnimateCreditsIslandFadeTiles

.notFFA5
    ; Increment hAnimatedTilesFrameCount
    ldh  a, [hAnimatedTilesFrameCount]
    inc  a
    ldh  [hAnimatedTilesFrameCount], a

.jumpTable
    ldh  a, [hAnimatedTilesGroup]
    JP_TABLE
._00 dw SkipTilesGroupAnimation
._01 dw AnimateCounterTilesGroup
._02 dw AnimateTideTilesGroup
._03 dw AnimateVillageTilesGroup
._04 dw AnimateDungeon1TilesGroup
._05 dw AnimateUndergroundTilesGroup
._06 dw AnimateLavaTilesGroup
._07 dw AnimateDungeon2TilesGroup
._08 dw AnimateWarpTilesGroup
._09 dw AnimateWaterCurrentsTilesGroup
._0A dw AnimateWaterfallTilesGroup
._0B dw AnimateSlowWaterfallTilesGroup
._0C dw AnimateWaterDungeonTilesGroup
._0D dw AnimateLightBeamTilesGroup
._0E dw AnimateCrystalBlockTilesGroup
._0F dw AnimateBubblesTilesGroup
._10 dw AnimateWeatherVaneTilesGroup

AnimateCounterTilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $07
    jp   nz, SkipTilesGroupAnimation
    callsb LoadCounterAnimatedTiles
    ld   a, $0C
    ld   [MBC3SelectBank], a
    jp   DrawLinkSpriteAndReturn

; Load the given frame for the animated tiles group
; Inputs:
;   h    the animated tiles group id
;   a    the data offset for the frame to load
LoadAnimatedTilesFrameAtOffset::
    ld   l, a
    jr   LoadAnimatedTilesFrame

AnimateTideTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $1
    jr   AnimateTilesSlowSpeed

AnimateVillageTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $2
    jr   AnimateTilesSlowSpeed

AnimateWaterDungeonTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $9
    jr   AnimateTilesSlowSpeed

AnimateSlowWaterfallTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $0

AnimateTilesSlowSpeed::
    ; If (FrameCount mod $0F) = 0, animate
    ldh  a, [hAnimatedTilesFrameCount]
    and  $0F
    jp   nz, SkipTilesGroupAnimation
    call IncrementAnimatedTilesDataOffset
    jp   LoadAnimatedTilesFrameAtOffset

AnimatedTilesDataOffsets::
    db 0, $40, $80, $C0, $C0, $C0, $80, $40

AnimateDungeon1TilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $07
    jp   nz, SkipTilesGroupAnimation
    ldh  a, [hAnimatedTilesFrameCount]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, AnimatedTilesDataOffsets
    add  hl, de
    ld   l, [hl]
    ld   h, HIGH(AnimatedTiles) + $3

; Load the given frame for the animated tiles group
; Inputs:
;  hl  frames location
;  de  target location
;  bc  frame size
LoadAnimatedTilesFrame::
    ; Copy the tiles data
    ld   de, vTiles2 + $6C0
.de
    ld   bc, $40
    call CopyData

    jp   DrawLinkSpriteAndReturn

AnimateUndergroundTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $4
    jr   AnimateTilesSlowSpeed

AnimateLavaTilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $07
    jp   nz, SkipTilesGroupAnimation
    ldh  a, [hAnimatedTilesFrameCount]
    rra
    rra
    rra
    and  $07
    ld   e, a
    ld   d, $00
    ld   hl, AnimatedTilesDataOffsets
    add  hl, de
    ld   l, [hl]
    ld   h, HIGH(AnimatedTiles) + $5
    jp   LoadAnimatedTilesFrame

AnimateDungeon2TilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]
    inc  a
    and  $03
    jp   nz, AnimateDungeon1TilesGroup
    ld hl, $dcc0
    ld   de, $90C0
    jp   LoadAnimatedTilesFrame.de

AnimateWarpTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $6

AnimateTilesMediumSpeed::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $07
    jp   nz, SkipTilesGroupAnimation
    call IncrementAnimatedTilesDataOffset
    jp   LoadAnimatedTilesFrameAtOffset

AnimateWaterCurrentsTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $7

AnimateTilesFastSpeed::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $03
    jp   nz, SkipTilesGroupAnimation
    call IncrementAnimatedTilesDataOffset
    jp   LoadAnimatedTilesFrameAtOffset

AnimateWaterfallTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $8
    jr   AnimateTilesFastSpeed

; Increment the current data offset by one frame.
; Return:
;   a   the new data offset
IncrementAnimatedTilesDataOffset::
    ldh  a, [hAnimatedTilesDataOffset]
    add  a, $40
    ldh  [hAnimatedTilesDataOffset], a
    ret

AnimateLightBeamTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $B
    jr   AnimateTilesFastSpeed

AnimateBubblesTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $A
    jr   AnimateTilesMediumSpeed

AnimateWeatherVaneTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $D
    jr   AnimateTilesMediumSpeed

AnimateCrystalBlockTilesGroup::
    ld   h, HIGH(AnimatedTiles) + $C
    jr   AnimateTilesMediumSpeed


SkipTilesGroupAnimation::
    ldh  a, [hLinkAnimationState]                 ; $54F5: $F0 $9D
    cp   $FF                                      ; $54F7: $FE $FF
   jp z, $1ccc

    ; Read the first byte in LinkAnimationStateTable
    ld   hl, LinkAnimationStateTable              ; $54FA: $21 $19 $53
    sla  a                                        ; $54FD: $CB $27
    ld   c, a                                     ; $54FF: $4F
    ld   b, $00                                   ; $5500: $06 $00
    add  hl, bc                                   ; $5502: $09
    ld   e, [hl]                                  ; $5503: $5E
    push hl                                       ; $5504: $E5

    ld   hl, data_020_5407                        ; $5505: $21 $07 $54
    add  hl, bc                                   ; $5508: $09
    ld   a, [wC11D]                               ; $5509: $FA $1D $C1
    and  $98                                      ; $550C: $E6 $98
    or   [hl]                                     ; $550E: $B6
    ld   [wC11D], a                               ; $550F: $EA $1D $C1
    inc  hl                                       ; $5512: $23
    ld   a, [wC11E]                               ; $5513: $FA $1E $C1
    and  $98                                      ; $5516: $E6 $98
    or   [hl]                                     ; $5518: $B6
    ld   [wC11E], a                               ; $5519: $EA $1E $C1
    ld   d, $00                                   ; $551C: $16 $00
    sla  e                                        ; $551E: $CB $23
    rl   d                                        ; $5520: $CB $12
    sla  e                                        ; $5522: $CB $23
    rl   d                                        ; $5524: $CB $12
    sla  e                                        ; $5526: $CB $23
    rl   d                                        ; $5528: $CB $12
    sla  e                                        ; $552A: $CB $23
    rl   d                                        ; $552C: $CB $12
    ld   hl, LinkCharacter2Tiles                  ; $552E: $21 $00 $58
    add  hl, de                                   ; $5531: $19
     push hl                                       ; $1c99: $e5
    pop bc                                   ; $5533: $44
    ld   hl, vTiles0                              ; $5534: $21 $00 $80
    ld   d, $20                                   ; $5537: $16 $20
jr_000_1ca0:
    ld a, [bc]                                    ; $1ca0: $0a
    inc bc                                        ; $1ca1: $03
    ld [hl+], a                                   ; $1ca2: $22
    dec d                                         ; $1ca3: $15
    jr nz, jr_000_1ca0

    ; hl = LinkAnimationStateTable + hLinkAnimationState
    pop  hl                                       ; $553C: $E1
    ; Read the 2nd byte from the table
    inc  hl                                       ; $553D: $23
    ld   e, [hl]                                  ; $553E: $5E
    ld   d, $00                                   ; $553F: $16 $00
    sla  e                                        ; $5541: $CB $23
    rl   d                                        ; $5543: $CB $12
    sla  e                                        ; $5545: $CB $23
    rl   d                                        ; $5547: $CB $12
    sla  e                                        ; $5549: $CB $23
    rl   d                                        ; $554B: $CB $12
    sla  e                                        ; $554D: $CB $23
    rl   d                                        ; $554F: $CB $12
    ld   hl, LinkCharacter2Tiles                  ; $5551: $21 $00 $58
    add  hl, de                                   ; $5554: $19
    push hl
    pop bc
    ld   hl, vTiles0 + $20                        ; $5557: $21 $20 $80
    ld   d, $20                                   ; $555A: $16 $20



; Copy D bytes from BC to HL, then return to bank 20.
; Inputs:
;   d    number of bytes to copy
;   bc   source address
;   hl   target address in VRAM
CopyLinkTilesPair::

.loop
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  d
    jr   nz, .loop

DrawLinkSprite::
DrawLinkSpriteAndReturn::
    ldh  a, [hLinkAnimationState]
    inc  a
     jr z, $1d14
    ld   a, [wInvincibilityCounter]
    rla
    rla
    and  $10

label_1D49::
    ld   [$C135], a
    ld   hl, $C008
    ld   a, [$C13B]
    ld   c, a
    ld   a, [$C145]
    add  a, c
    cp   $88
    jr nc, $1d14
    push af
    ldi  [hl], a
    ld   a, [$C13C]
    ld   c, a
    ldh  a, [hLinkPositionX]
    add  a, c
    ldi  [hl], a
    ld   a, $00
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11D]
    or   d
    ld   [hl+], a
    pop  af
    ldi  [hl], a
    ldh  a, [hLinkPositionX]
    add  a, c
    add  a, $08
    ldi  [hl], a
    ld   a, $02
    ldi  [hl], a
    ld   a, [$C135]
    ld   d, a
    ld   a, [$C11E]
    or   d
    ld   [hl+], a
AnimateTiles_return::
    ret

label_1DE9::
    ld   hl, Npc1Tiles + $F00
    ld   a, BANK(Npc1Tiles)
    jr   label_1DF0.loadTiles

label_1DF0::
    ld   a, BANK(Npc3Tiles)
    ld   hl, Npc3Tiles + $2080

.loadTiles
    ld   [MBC3SelectBank], a
    ld   de, vTiles0 + $400
    ld   bc, $40
    jp   CopyDataAndDrawLinkSprite

label_1E01::
    ; This has something to do with drawing the trading sequence item ...
    ; changing TRADING_ITEM_RIBBON to 0 changes the order of shown trading items
    ; @TODO Probably able to figure this out with a few minutes of time
    ld   a, [wTradeSequenceItem]
    cp   TRADING_ITEM_RIBBON
    jp  c, CopyDataAndDrawLinkSprite.drawLinkSprite
    sub  a, TRADING_ITEM_RIBBON
    ld   d, a
    ld   e, $00
    sra  d
    rr   e
    sra  d
    rr   e
    ld   hl, Items1Tiles
    add  hl, de
    ld   de, vTiles1 + $1A0
    ld   bc, $40
    ld   a, BANK(Items1Tiles)
    ld   [MBC3SelectBank], a
    jp   CopyDataAndDrawLinkSprite
