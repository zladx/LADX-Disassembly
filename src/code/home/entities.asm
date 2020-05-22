;
; Code for the entities system.
;

; Tell if Bow-Wow can eat an entity of the given type.
; Inputs:
;   de   entity type
; Return:
;   a    value read from BowWowEatableEntitiesTable
CanBowWowEatEntity::
    ld   a, $14
    ld   [MBC3SelectBank], a
    ld   hl, BowWowEatableEntitiesTable
    add  hl, de
    ld   a, [hl]
    ld   hl, MBC3SelectBank
    ld   [hl], $05
    ret

label_3935::
    callsw func_019_7C50
    ld   a, $03
    jp   SwitchBank

label_3942::
    callsb func_003_53E4
    jp   ReloadSavedBank

label_394D::
    callsb func_014_54AC
    jp   ReloadSavedBank

CreateFollowingNpcEntity_trampoline::
    callsw CreateFollowingNpcEntity
    ld   a, $02
    jp   SwitchBank

label_3965::
    callsb ConfigureNewEntity
    jp   ReloadSavedBank

label_3970::
    callsb func_003_7EFE
    jp   ReloadSavedBank

label_397B::
    callsb func_014_5347
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

data_3989::
    db   0, 8, $10, $18

; Loop through all active entities, and call the relevant handler depending
; on their state.
AnimateEntities::
    ; Play the Boss Agony audio effect if needed
    ld   hl, wBossAgonySFXCountdown
    ld   a, [hl]
    and  a
    jr   z, .bossAgonyEnd
    dec  [hl]
    jr   nz, .bossAgonyEnd
    ld   a, WAVE_SFX_BOSS_AGONY
    ldh  [hWaveSfx], a
.bossAgonyEnd

    ; If no dialog is open…
    ld   a, [wDialogState]
    and  a
    jr   nz, .C111End
    ; … decrement $C111
    ld   a, [$C111]
    ld   [$C1A8], a
    and  a
    jr   z, .C111End
    dec  a
    ld   [$C111], a
.C111End

    ; If Link is passing out, return
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_PASS_OUT
    ret  z

    xor  a
    ld   [$C3C1], a
    ldh  a, [hMapId]
    cp   MAP_CAVE_B
    ldh  a, [hFrameCounter]
    jr   c, .label_39C1
    xor  a

.label_39C1
    and  $03
    ld   e, a
    ld   d, $00
    ld   hl, data_3989
    add  hl, de
    ld   a, [hl]
    ld   [wOAMNextAvailableSlot], a
    callsb func_020_4303
    xor  a
    ld   [MBC3SelectBank], a
    ld   a, [wDialogState]
    and  a
    jr   nz, .label_39E3
    ld   [$C1AD], a

.label_39E3
    ld   a, BANK(func_020_6352)
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    call func_020_6352

    ; Initialize the entities counter
    ld   b, $00
    ld   c, MAX_ENTITIES - 1

    ; For each entity slot…
.loop
    ; Save the active entity index
    ld   a, c
    ld   [wActiveEntityIndex], a

    ; Read the entity state
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   a, [hl]

    ; If state != 0…
    and  a
    jr   z, .AnimateEntityEnd

    ; animate the entity.
    ldh  [hActiveEntityStatus], a
    call AnimateEntity
.AnimateEntityEnd

    ; While c >= 0, loop
    dec  c
    ld   a, c
    cp   $FF
    jr   nz, .loop

.return
    ret

ResetEntity_trampoline::
    callsb ResetEntity
    ld   a, $03
    ld   [MBC3SelectBank], a
    ret

; For a given entity slot, call the relevant entity handler
; (depending on the entity state).
;
; Inputs:
;   bc   entity index
AnimateEntity::
    ld   hl, wEntitiesTypeTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityType], a

    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityState], a

    ld   hl, $C3B0
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntitySpriteVariant], a

    ld   a, BANK(UpdateEntityPositionForRoomTransition)
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a

    ldh  a, [hActiveEntityType]
    cp   ENTITY_RAFT_RAFT_OWNER
    jr   nz, .raftManEnd
    ldh  a, [$FFB2]
    and  a
    jr   nz, .entityLifted
.raftManEnd

    ldh  a, [hActiveEntityStatus]
    cp   ENTITY_STATUS_LIFTED
    jr   nz, .notLifted
.entityLifted
    call UpdateEntityPositionForRoomTransition
    call CopyEntityPositionToActivePosition
    jr   .liftedEnd
.notLifted
    call CopyEntityPositionToActivePosition
    call UpdateEntityPositionForRoomTransition
.liftedEnd

    ld   a, BANK(UpdateEntityTimers)
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    call UpdateEntityTimers

    ; Select bank 3
    ld   a, $03
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a

    ldh  a, [hActiveEntityStatus]
    cp   ENTITY_STATUS_ACTIVE
    jp   z, ExecuteActiveEntityHandler
    JP_TABLE
._00 dw AnimateEntities.return
._01 dw EntityDeathHandler
._02 dw EntityFallHandler
._03 dw EntityDestructionHandler
._04 dw EntityInitHandler
._05 dw ExecuteActiveEntityHandler
._06 dw EntityStunnedHandler
._07 dw EntityLiftedHandler
._08 dw EntityThrownHandler

; Execute active entity handler, then return to bank 3
ExecuteActiveEntityHandler_trampoline::
    call ExecuteActiveEntityHandler
    ld   a, $03
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a
    ret

; Read the entity handler address in the handlers table,
; then jump to execution.
ExecuteActiveEntityHandler::
    ld   a, BANK(EntityHandlersTable)
    ld   [MBC3SelectBank], a

    ; de = active entity id
    ldh  a, [hActiveEntityType]
    ld   e, a
    ld   d, b

    ; hl = de * 3
    ld   hl, EntityHandlersTable
    add  hl, de
    add  hl, de
    add  hl, de

    ; Read values from the entities pointers table:
    ; a = entity handler bank
    ; d = entity handler address (high)
    ; e = entity handler address (low)
    ld   e, [hl]
    inc  hl
    ld   d, [hl]
    inc  hl
    ld   a, [hl]

    ; Select entity handler bank
    ld   l, e
    ld   h, d
    ld   [wCurrentBank], a
    ld   [MBC3SelectBank], a

    ; Jump to the entity handler
    jp   hl

; Types of entity hitboxes
; Array indexed par (wEntitiesHitboxFlagsTable & $7C)
; Content goes into wEntitiesHitboxPositionTable
; Values:
;  - hitbox X
;  - hitbox Y
;  - ???
;  - ???
HitboxPositions::
._00 db   $08, $05, $08, $05
._04 db   $08, $0A, $08, $0A
._08 db   $08, $0A, $08, $0A
._0C db   $08, $10, $04, $0A
._10 db   $08, $02, $08, $02
._14 db   $08, $13, $08, $13
._18 db   $08, $06, $06, $08
._1C db   $08, $07, $06, $0A
._20 db   $08, $06, $10, $30
._24 db   $08, $07, $04, $0A
._28 db   $0C, $07, $FC, $04
._2C db   $10, $10, $0C, $12
._30 db   $08, $08, $02, $08
._34 db   $10, $0C, $08, $10
._38 db   $08, $07, $0C, $08
._3C db   $08, $08, $02, $08

; Read hitbox params from the hitbox types table, and copy them
; to the entities hitbox table.
; Inputs:
;   bc    entity index
ConfigureEntityHitbox::
    ; de = HitboxPositions[wEntitiesHitboxFlagsTable & $7C]
    ld   hl, wEntitiesHitboxFlagsTable
    add  hl, bc
    ld   a, [hl]
    and  $7C ; '|'
    ld   e, a
    ld   d, b
    ld   hl, HitboxPositions
    add  hl, de
    ld   e, l
    ld   d, h
    push bc
    ; c = c * 4
    sla  c
    sla  c
    ; Destination: hl = wEntitiesHitboxPositionTable + (entity index * 4)
    ld   hl, wEntitiesHitboxPositionTable
    add  hl, bc

    ; Copy 4 bytes from HitboxPositions to wEntitiesHitboxPositionTable
    ld   c, 4
    ; While c != 0
.loop
    ld   a, [de]
    inc  de
    ldi  [hl], a
    dec  c
    jr   nz, .loop
    pop  bc
    ret

; Set the given value to the entity sprite variants table.
;
; Inputs:
;   a    variant value
;   bc   entity index
SetEntitySpriteVariant::
    ld   hl, wEntitiesSpriteVariantTable
    add  hl, bc
    ld   [hl], a
    ret

; Increment the state attribute of the given entity
; Input:
;   bc   entity index
IncrementEntityState::
    ld   hl, wEntitiesStateTable
    add  hl, bc
    inc  [hl]
    ret

label_3B18::
    callsb func_002_75F5
    jp   ReloadSavedBank

label_3B23::
    callsb func_003_7893
    jp   ReloadSavedBank

label_3B2E::
    callsb ApplySwordIntersectionWithObjects
    jp   ReloadSavedBank

label_3B39::
    callsb func_003_6E28
    jp   ReloadSavedBank

label_3B44::
    callsb func_003_6C6B
    jp   ReloadSavedBank

CheckLinkCollisionWithProjectile_trampoline::
    callsb CheckLinkCollisionWithProjectile
    jp   ReloadSavedBank

CheckLinkCollisionWithEnemy_trampoline::
    callsb CheckLinkCollisionWithEnemy.collisionEvenInTheAir
    jp   ReloadSavedBank

label_3B65::
    callsb func_003_73EB
    jp   ReloadSavedBank

label_3B70::
    callsb func_003_6E2B
    jp   ReloadSavedBank

label_3B7B::
    callsb func_003_75A2
    jp   ReloadSavedBank

SpawnNewEntity_trampoline::
    push af
    ld   a, BANK(SpawnNewEntity)
    ld   [MBC3SelectBank], a
    pop  af
    call SpawnNewEntity
    rr   l
    call ReloadSavedBank
    rl   l
    ret

SpawnNewEntityInRange_trampoline::
    push af
    ld   a, BANK(SpawnNewEntityInRange)
    ld   [MBC3SelectBank], a
    pop  af
    call SpawnNewEntityInRange
    rr   l
    call ReloadSavedBank
    rl   l
    ret

ApplyVectorTowardsLink_trampoline::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(ApplyVectorTowardsLink)
    call ApplyVectorTowardsLink
    jp   ReloadSavedBank

GetVectorTowardsLink_trampoline::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(GetVectorTowardsLink)
    call GetVectorTowardsLink
    jp   ReloadSavedBank

; Render a pair of sprites for the active entity to the OAM buffer.
;
; The main input is a display list containing OAM attributes (2 bytes each).
; Each display list item is a pair of OAM attributes (one for each sprite).
;
; The entity variant is used to animate the entity, by selecting one of
; the different pairs in the display list.
;
; Inputs:
;   de                          address of the display list
;   hActiveEntitySpriteVariant  the sprite variant to use
RenderActiveEntitySpritesPair::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    ret  z

    call SkipDisabledEntityDuringRoomTransition

    push de

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]
    ld   e, a
    ld   d, b
    ld   hl, wDynamicOAMBuffer
    add  hl, de
    ld   e, l
    ld   d, h

    ; Sprite 0: set OAM byte 0 (Y position)
    ; [de] = [hActiveEntityVisualPosY]
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de

    ; Sprite 0: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_XFLIP
    rra
    rra
    ld   hl, hActiveEntityPosX
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  de

    ; hl = pop de + [hActiveEntitySpriteVariant] * 2
    ldh  a, [hActiveEntitySpriteVariant]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    sla  c
    rl   b
    pop  hl
    add  hl, bc

    ; Sprite 0: set OAM byte 2 (tile n°)
    ; [de] = [hl++] + [hActiveEntityTilesOffset]
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .jr_3C08
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de
.jr_3C08

    inc  de

    ; Sprite 0: set OAM byte 3 (tile attribute)
    ld   a, [hli]
    push hl
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .paletteFlip0End
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_PAL1
    jr   z, .paletteFlip0End
    ; …invert the color palette data.
    ld   a, [de]
    and  $FF ^ OAMF_PALMASK
    or   $04
    ld   [de], a
.paletteFlip0End
    inc  de

    ; Sprite 1: set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]
    ld   [de], a
    inc  de

    ; Sprite 1: set OAM byte 1 (X position)
    ; [de] = [hActiveEntityPosX] + x-flip - [wScreenShakeHorizontal]
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ; (if the entity is X-flipped, adjust sprite 0 position)
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_XFLIP
    xor  $20
    rra
    rra
    ld   hl, hActiveEntityPosX
    sub  a, c
    add  a, [hl]
    ld   [de], a
    inc  de

    ; Sprite 1: set OAM byte 2 (tile n°)
    pop  hl
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    add  a, c
    ld   [de], a
    and  $0F
    cp   $0F
    jr   nz, .jr_3C4B
    dec  de
    ld   a, $F0
    ld   [de], a
    inc  de
.jr_3C4B

    inc  de

    ; Sprite 1: set OAM byte 3 (tile attribute)
    ld   a, [hl]
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .paletteFlip1End
    ldh  a, [hActiveEntityFlipAttribute]
    and  OAMF_PAL1
    jr   z, .paletteFlip1End
    ; …invert the color palette data.
    ld   a, [de]
    and  $FF ^ OAMF_PALMASK
    or   $04
    ld   [de], a
.paletteFlip1End

    ; Restore the entity index to bc
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, $00

    callsb func_015_795D
    ; fallthrough

label_3C71::
    call func_015_7995

    ; Reload saved bank and return
    jp   ReloadSavedBank

; Render a single sprite for the active entity to the OAM buffer.
;
; The main input is a display list, containing OAM attributes (2 bytes each).
; There is one OAM attribute per variant.
;
; The entity variant is used to animate the entity, by selecting a sprite
; among the different attributes in the display list.
;
; Inputs:
;   de                          address of the display list
;   wActiveEntityIndex          index
;   hActiveEntitySpriteVariant  the sprite variant to use
;   wOAMNextAvailableSlot       index of the dynamically allocated OAM slot
RenderActiveEntitySprite::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    ret  z

    call SkipDisabledEntityDuringRoomTransition

    push de

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    ld   a, [wOAMNextAvailableSlot]
    ld   l, a
    ld   h, $00
    ld   bc, wDynamicOAMBuffer
    add  hl, bc
    ld   e, l
    ld   d, h
    ; bc = [wActiveEntityIndex]
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, $00

    ; Set OAM byte 0 (Y position)

    ; If in a side-scrolling room…
    ldh  a, [hIsSideScrolling]
    and  a
    ldh  a, [hActiveEntityVisualPosY]
    jr   z, .sideScrollingEnd
    ; … hActiveEntityVisualPosY -= 4
    sub  a, $04
    ldh  [hActiveEntityVisualPosY], a
.sideScrollingEnd
    ld   [de], a
    inc  de

    ; Set OAM byte 1 (X position)
    ld   a, [wScreenShakeHorizontal]
    ld   h, a
    ldh  a, [hActiveEntityPosX]
    add  a, $04
    sub  a, h
    ld   [de], a
    inc  de

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntitySpriteVariant]
    ld   c, a
    ld   b, $00
    sla  c
    rl   b
    pop  hl
    add  hl, bc
    ld   a, [hli]
    ld   [de], a

    ; Set OAM byte 3 (tile attribute)

    ; If on GBC…
    inc  de
    ldh  a, [hIsGBC]
    and  a
    jr   z, .paletteFlipEnd
    ; and not during credits…
    ld   a, [wGameplayType]
    cp   GAMEPLAY_CREDITS
    jr   z, .paletteFlipEnd
    ; and hActiveEntityFlipAttribute != 0…
    ldh  a, [hActiveEntityFlipAttribute]
    and  a
    jr   z, .paletteFlipEnd
    ; …invert the color palette data.
    ld   a, [hl]
    and  $FF ^ OAMF_PALMASK
    or   $04
    ld   [de], a
    jr   .functionEnd
.paletteFlipEnd

    ld   a, [hli]
    ld   hl, hActiveEntityFlipAttribute
    xor  [hl]
    ld   [de], a

.functionEnd
    inc  de
    jr   RenderActiveEntitySpritesPair.paletteFlip1End

label_3CD9::
    ld   a, $15
    ld   [MBC3SelectBank], a
    jr   label_3C71

; Render a large rectangle of sprites using the entire OAM buffer.
;
; The sprites are allocated starting from the very start of the OAM buffer,
; overwriting even the part dedicated to Link's sprites.
;
; This is mainly used when displaying a large sprite on a screen where Link
; is not present.
;
; See RenderActiveEntitySpritesRect for details.
RenderActiveEntitySpritesRectUsingAllOAM::
    push hl
    ld   hl, wOAMBuffer
    jr   RenderActiveEntitySpritesRect.withDestination

; Render a large rectangle of sprites for the active entity to the OAM buffer.
;
; This function takes a display list of OAM attributes.
; Each item of the display list is a tupple of [x (?), y(?), tile n°, tile attributes] values.
;
; The display list is processed regardless of the active sprite variant.
; Variants must be managed by the caller itself.
;
; The sprites are allocated starting from the next available slot
; in the dynamic part of the OAM buffer.
;
; Inputs:
;   hl  the oam attributes display list
;   c   the number of sprites
;
; Return value:
;   c   [wActiveEntityIndex]
RenderActiveEntitySpritesRect::
    ; If hActiveEntitySpriteVariant == -1, return.
    ldh  a, [hActiveEntitySpriteVariant]
    inc  a
    jr   z, .return

    ; de = wDynamicOAMBuffer + [wOAMNextAvailableSlot]
    push hl
    ld   a, [wOAMNextAvailableSlot]
    ld   e, a
    ld   d, $00
    ld   hl, wDynamicOAMBuffer
    add  hl, de
.withDestination
    ld   e, l
    ld   d, h
    pop  hl

    ; Save counter to hScratch0
    ld   a, c
    ldh  [hScratch0], a

    ld   a, [wActiveEntityIndex]
    ld   c, a
    call SkipDisabledEntityDuringRoomTransition

    ; Restore counter from hScratch0
    ldh  a, [hScratch0]
    ld   c, a

.loop
    ; Set OAM byte 0 (Y position)
    ldh  a, [hActiveEntityVisualPosY]
    add  a, [hl]
    ld   [de], a
    inc  hl
    inc  de

    ; Set OAM byte 1 (X position)
    push bc
    ld   a, [wScreenShakeHorizontal]
    ld   c, a
    ldh  a, [hActiveEntityPosX]
    add  a, [hl]
    sub  a, c
    ld   [de], a
    inc  hl
    inc  de

    ; Set OAM byte 2 (tile n°)
    ldh  a, [hActiveEntityTilesOffset]
    ld   c, a
    ld   a, [hli]
    push af
    add  a, c
    ld   [de], a
    pop  af
    cp   $FF
    jr   nz, .jp_3D28
    dec  de
    xor  a
    ld   [de], a
    inc  de
.jp_3D28
    pop  bc
    inc  de

    ; Set OAM byte 3 (tile attribute)
    ldh  a, [hActiveEntityFlipAttribute]
    xor  [hl]
    ld   [de], a
    inc  hl
    ; On GBC, if the "invert palette" bit is set…
    ldh  a, [hIsGBC]
    and  a
    jr   z, .paletteFlipEnd
    ldh  a, [hActiveEntityFlipAttribute]
    and  a
    jr   z, .paletteFlipEnd
    ; …invert the color palette data.
    ld   a, [de]
    and  $FF ^ OAMF_PALMASK
    or   $04
    ld   [de], a
.paletteFlipEnd

    inc  de
    dec  c
    jr   nz, .loop

    ld   a, [wActiveEntityIndex]
    ld   c, a
    callsb func_015_795D
    jp   ReloadSavedBank

.return
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ret

; If the active entity rendering is disabled during
; the room transition, return to the parent of the caller.
; Otherwise, return to caller normally.
;
; Inputs:
;  bc:   active entity index?
SkipDisabledEntityDuringRoomTransition::
    ; If no room transition is active, return.
    push hl
    ld   a, [wRoomTransitionState]
    and  a
    jr   z, .return

    ; If hActiveEntityPosX - 1 is outside of screen, skip
    ldh  a, [hActiveEntityPosX]
    dec  a
    cp   $C0
    jr   nc, .skip

    ; If hActiveEntityVisualPosY - 1 is outside of the screen, skip
    ldh  a, [hActiveEntityVisualPosY]
    dec  a
    cp   $88
    jr   nc, .skip

    ; If wEntitiesPosXSignTable[c] != 0, skip
    ld   hl, wEntitiesPosXSignTable
    add  hl, bc
    ld   a, [hl]
    and  a
    jr   nz, .skip

    ; If wEntitiesPosYSignTable[c] != 0, skip
    ld   hl, wEntitiesPosYSignTable
    add  hl, bc
    ld   a, [hl]
    and  a

    ; Otherwise, don't skip and simply return to caller.
    jr   z, .return

.skip
    ; Pop the caller return address.
    ; The next value to be popped will be the parent caller
    ; address, thus returning to the parent of the parent early.
    pop  af

.return
    pop  hl
    ret

; Inputs:
;   bc   entity slot index
ClearEntitySpeed::
    ld   hl, wEntitiesSpeedXTable
    add  hl, bc
    ld   [hl], b
    ld   hl, wEntitiesSpeedYTable
    add  hl, bc
    ld   [hl], b
    ret

CopyEntityPositionToActivePosition::
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosX], a
    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ld   a, [hl]
    ldh  [hActiveEntityPosY], a
    ld   hl, wEntitiesPosZTable
    add  hl, bc
    sub  a, [hl]
    ldh  [hActiveEntityVisualPosY], a
    ret

label_3DA0::
    callhl func_015_7964
    jp   ReloadSavedBank

label_3DAB::
    callhl func_004_5A1A
    jp   ReloadSavedBank

EntityInitMoldorm_trampoline::
    callhl EntityInitMoldorm
    jp   ReloadSavedBank

EntityInitFacade_trampoline::
    callhl EntityInitFacade
    jp   ReloadSavedBank

EntityInitSlimeEye_trampoline::
    callhl EntityInitSlimeEye
    jp   ReloadSavedBank

EntityInitGenie_trampoline::
    callhl EntityInitGenie
    jp   ReloadSavedBank

EntityInitSlimeEel_trampoline::
    callhl EntityInitSlimeEel
    jp   ReloadSavedBank

EntityInitDodongoSnake_trampoline::
    callhl EntityInitDodongoSnake
    jp   ReloadSavedBank

EntityInitHotHead_trampoline::
    callhl EntityInitHotHead
    jp   ReloadSavedBank

EntityInitEvilEagle_trampoline::
    callhl EntityInitEvilEagle
    jp   ReloadSavedBank

Entity67Handler_trampoline::
    callhl Entity67Handler
    jp   ReloadSavedBank

label_3E19::
    ld   a, [wCurrentBank]
    push af
    callsw CheckPositionForMapTransition
    pop  af
    jp   SwitchBank

label_3E29::
    callhl func_004_5C63
    jp   ReloadSavedBank

label_3E34::
    callhl SmashRock
    jp   ReloadSavedBank

LoadHeartsAndRuppeesCount::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(LoadRupeesDigits)
    call LoadRupeesDigits
    call LoadHeartsCount
    jp   ReloadSavedBank

label_3E4D::
    callsw SpawnChestWithItem
    ld   a, $03
    jp   SwitchBank

label_3E5A::
    ld   hl, MBC3SelectBank
    ld   [hl], BANK(func_020_5C9C)
    ld   c, $01
    ld   b, $00
    ld   e, $FF
    call func_020_5C9C
    jp   ReloadSavedBank

GiveInventoryItem_trampoline::                ; @TODO Give player item in reg d
    callhl GiveInventoryItem
    jp   ReloadSavedBank

func_006_783C_trampoline::
    callsw func_006_783C
    ld   a, $03
    jp   SwitchBank

UnloadAllEntities::
    ld   e, MAX_ENTITIES
    ld   hl, wEntitiesStatusTable

.loop
    xor  a
    ldi  [hl], a
    dec  e
    jr   nz, .loop

    ret

label_3E8E::
    ld   hl, wEntitiesUnknowTableZ
    add  hl, bc
    ld   a, [hl]
    and  a
    ret  z

    ldh  a, [hFrameCounter]
    xor  c
    and  $03
    ret  nz

    ldh  a, [hActiveEntityPosX]
    ldh  [hScratch0], a
    ldh  a, [hActiveEntityVisualPosY]
    ldh  [hScratch1], a
    ld   a, TRANSCIENT_VFX_SMOKE
    call AddTranscientVfx
    ld   hl, wTranscientVfxCountdownTable
    add  hl, de
    ld   [hl], $0F
    ret

label_3EAF::
    ld   hl, $C3F0
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, .jr_3EBA
    cpl
    inc  a

.jr_3EBA
    ldh  [hScratch0], a
    ld   hl, wEntitiesUnknowTableS
    add  hl, bc
    ld   a, [hl]
    bit  7, a
    jr   z, .jr_3EC7
    cpl
    inc  a

.jr_3EC7
    ld   e, $03
    ld   hl, hScratch0
    cp   [hl]
    jr   c, .jr_3ED1
    ld   e, $0C

.jr_3ED1
    ld   a, e
    ld   hl, wEntitiesCollisionsTable
    add  hl, bc
    and  [hl]
    jr   z, .jr_3EDE
    ld   hl, wEntitiesIgnoreHitsCountdownTable
    add  hl, bc
    ld   [hl], b

.jr_3EDE
    ret

BossIntroDialogTable::
    ; Indexed by hMapId. Last entry might be unused?
    db $B0, $B4, $B1, $B2, $B3, $B6, $BA, $BC, $B8

; Start the boss music and show the boss's intro dialog
BossIntro::
    ld   hl, wInventoryAppearing
    ld   a, [wRoomTransitionState]
    or   [hl]
    ret  nz

    ld   a, [wBossIntroDelay]
    and  a
    jr   z, .endOfDelay
    dec  a
    ld   [wBossIntroDelay], a
    ret
.endOfDelay:

    ; don't do this twice
    ld   a, [wDidBossIntro]
    and  a
    ret  nz
    inc  a
    ld   [wDidBossIntro], a

    ; boss music
    ld   hl, wEntitiesUnknowTableH
    add  hl, bc
    ld   a, [hl]
    and  $04
    ld   a, MUSIC_BOSS_BATTLE

    jr   z, .endIf
    ld   a, MUSIC_MINIBOSS

.endIf:
    ld   [wMusicTrackToPlay], a

ldh  [$FFBD], a
    ld   a, [wTransitionSequenceCounter]
    cp   $04
    ret  nz

    ; opening monologue
    ldh  a, [hActiveEntityType]
    cp   ENTITY_DESERT_LANMOLA
    jr   nz, .endDesertLanmola
    ld   a, $DA
    jr   .openDialog
.endDesertLanmola:

    cp   ENTITY_GRIM_CREEPER
    jr   nz, .endGrimCreeper
    ld   a, $26
    jr   .openDialog
.endGrimCreeper:

    ld   hl, wEntitiesUnknowTableH
    add  hl, bc
    ld   a, [hl]
    and  $04
    ret  nz                     ; other minibosses are silent
    ldh  a, [hMapId]
    cp   MAP_COLOR_DUNGEON
    ret  z
    cp   MAP_FACE_SHRINE
    ret  z
    ld   e, a
    ld   d, b
    ld   hl, BossIntroDialogTable
    add  hl, de
    ld   a, [hl]
.openDialog:
    jp   OpenDialog

data_3F48::
    db 1, 2, 4, 8, $10, $20, $40, $80

DidKillEnemy::
    ld   a, BANK(SpawnEnemyDrop)
    ld   [wC113], a
    ld   [MBC3SelectBank], a
    call SpawnEnemyDrop
    call ReloadSavedBank

.label_3F5E
    ld   hl, wEntitiesLoadOrderTable
    add  hl, bc
    ld   a, [hl]
    cp   $FF
    jr   z, UnloadEntity
    push af
    ld   a, [wKillCount2]
    ld   e, a
    ld   d, b
    inc  a
    ld   [wKillCount2], a
    ld   a, [hl]
    ld   hl, $DBB6
    add  hl, de
    ld   [hl], a
    pop  af

.label_3F78
    cp   $08
    jr   nc, UnloadEntity
    ld   e, a
    ld   d, b
    ld   hl, data_3F48
    add  hl, de
    ldh  a, [hMapRoom]
    ld   e, a
    ld   d, b
    ld   a, [hl]
    ld   hl, wEntitiesClearedRooms
    add  hl, de
    or   [hl]
    ld   [hl], a
    ; fall through UnloadEntity

; Unload an entity by setting its status to 0 (ENTITY_STATUS_DISABLED)
; Input:
;   bc:  index of the entity
UnloadEntity::
UnloadEntityAndReturn::
    ld   hl, wEntitiesStatusTable
    add  hl, bc
    ld   [hl], b
    ret
