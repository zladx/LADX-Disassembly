;
; Handling of animated background tiles and Link's sprite
;

; Special case for the sequence with Marin and Link chatting on the beach
AnimateMarinBeachTiles::
    ld   a, [wRequestDestinationHigh]
    and  a
    ret  nz
    ld   a, $10
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a
    ld   hl, $6500
    ld   de, $9500
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
    ld   bc, $0040
    jp   CopyData
    jr   nz, AnimateTiles.doWorldAnimations
    and  b
    ldh  [hScratchE], a
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
    call AdjustBankNumberForGBC
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
    ld   bc, $0020
    jp   CopyData
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
    jp   z, label_1EA1
    cp   $0A
    jp   z, label_1E2B
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
    ld   a, $17
    ld   [MBC3SelectBank], a
    jp   $4062

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
._11 dw AnimatePhotoTilesGroup

AnimateCounterTilesGroup::
    ldh  a, [hAnimatedTilesFrameCount]
    and  $07
    jp   nz, SkipTilesGroupAnimation
    ld   a, $01
    ld   [MBC3SelectBank], a
    call LoadCounterAnimatedTiles
    ld   a, $0C
    call AdjustBankNumberForGBC
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
    ld   de, vTiles2 + $06C0
.de
    ld   bc, $0040
    call CopyData

    ; Do special case for MAP_COLOR_DUNGEON
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, .endMapFF

    ld   a, $20
    ld   [MBC3SelectBank], a
    ld   b, $01
    call $47F7
    jr   z, .next
    ld   [MBC3SelectBank], a
    call CopyData
.next
    ld   a, $20
    ld   [MBC3SelectBank], a
    ld   b, $00
    call $47F7
    jr   z, .endMapFF
    ld   [MBC3SelectBank], a
    ld   de, $96C0
    call CopyData
.endMapFF

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
    ld   hl, $DCC0
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    jr   nz, label_1CB8
    ld   de, $8400
    jp   LoadAnimatedTilesFrame.de

label_1CB8::
    ldh  a, [hAnimatedTilesFrameCount]
    inc  a
    and  $03
    jp   nz, AnimateDungeon1TilesGroup
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

AnimatePhotoTilesGroup::
    ld   a, $38
    ld   [MBC3SelectBank], a
    call $7830
    jp   DrawLinkSpriteAndReturn

label_1D0A::
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

label_1D12::
    ld   a, [bc]
    inc  bc
    ldi  [hl], a
    dec  d
    jr   nz, label_1D12
    ld   a, $20
    ld   [MBC3SelectBank], a
    ret

SkipTilesGroupAnimation::
    ld   a, $20
    ld   [MBC3SelectBank], a
    call $54F5
    ld   a, $0C
    call AdjustBankNumberForGBC
    ld   [MBC3SelectBank], a

DrawLinkSprite::
DrawLinkSpriteAndReturn::
    ldh  a, [hLinkAnimationState]
    inc  a
    ret  z
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1D42
    ld   a, [$DBC7]
    and  $04
    jr   z, label_1D49
    ld   a, $04
    jr   label_1D49

label_1D42::
    ld   a, [$DBC7]
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
    ret  nc
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
    ld   [hl], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1DA1
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DA1
    ldh  a, [hLinkAnimationState]
    cp   $50
    jr   c, label_1D8C
    cp   $55
    jr   nc, label_1D8C
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DA1

label_1D8C::
    ld   a, [wTunicType]
    and  a
    jr   z, label_1D95
    inc  a
    or   [hl]
    ld   [hl], a

label_1D95::
    ldh  a, [hLinkAnimationState]
    cp   $4E
    jr   z, label_1D9F
    cp   $4F
    jr   nz, label_1DA1

label_1D9F::
    ld   [hl], $03

label_1DA1::
    inc  hl
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
    ld   [hl], a
    ldh  a, [hIsGBC]
    and  a
    jr   z, label_1DE7
    ld   a, [$DBC7]
    and  $04
    jr   nz, label_1DE7
    ldh  a, [hLinkAnimationState]
    cp   $50
    jr   c, label_1DD2
    cp   $55
    jr   nc, label_1DD2
    ld   a, [hl]
    or   $07
    ld   [hl], a
    jr   label_1DE7

label_1DD2::
    ld   a, [wTunicType]
    and  a
    jr   z, label_1DDB
    inc  a
    or   [hl]
    ld   [hl], a

label_1DDB::
    ldh  a, [hLinkAnimationState]
    cp   $4E
    jr   z, label_1DE5
    cp   $4F
    jr   nz, label_1DE7

label_1DE5::
    ld   [hl], $23

label_1DE7::
    inc  hl

AnimateTiles_return::
    ret
