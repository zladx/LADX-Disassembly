section "WRAM Bank0", wram0[$c000]

; *******************************************************************
; *                                                                 *
; *             >> LABEL GUIDELINE <<                               *
; *                                                                 *
; *         ; Discripe the function of this memory address.         *
; *         ; Possible values:                                      *
; *         ; 0 = meaning 0,                                        *
; *         ; 1 = meaning 1,                                        *
; *         ; 2 = meaning 2                                         *
; *         label::                                                 *
; *           ds 1 ; address as 4 hex value                         *
; *                                                                 *
; *******************************************************************


wram0Section EQU $C000

; Buffer Area for 12 Link OAM tiles. Copied to OAM by DMA.
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wLinkOAMBuffer::
  ds 4 * 12 ; C000

; Buffer Area for 28 dynamically allocated OAM elements
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wDynamicOAMBuffer::
  ds 4 * 28 ; C030

; Unlabeled
wC0A0::
  ds $60 ; C0A0

; Table of the scrollX offset to add for each screen section being drawn
wScrollXOffsetForSection::
  ds $5 ; C100

; Portion of the screen being drawn (0 -> 4)
wLCDSectionIndex::
  ds 1 ; C105

; Offset for compensating the sea movement when drawing bottom screen section on intro sea
wIntroBGYOffset:: 
  ds 1 ; C106

; Unlabeled
wC107:
  ds 1 ; C107

; TODO comment
wNameIndex::
  ds 1 ; C108

; Unlabeled
wC109:
  ds 1 ; C109

; Unlabeled
wC10A:
  ds 1 ; C10A

; Music timing:
; 0 = normal,
; 1 = double-speed,
; 2 = half-speed
wMusicTrackTiming:
  ds 1 ; C10B

; Unlabeled
wC10C:
  ds 1 ; C10C

; Unlabeled
wC10D:
  ds 1 ; wC10D

; TODO comment
wNeedsUpdatingNPCTiles::
  ds 1 ; C10E

; Unlabeled
wC10F:
  ds 1 ; C10F

; Time until the next low health SFX sound will be played.
wTimeToNextLowHealthSFX:
  ds 1 ; C110
  
; Unlabeled
wC111:
  ds 1 ; C111

; TODO comment
wDialogIndexHi:
  ds 1 ; C112

; Unlabeled
wC113:
  ds 1 ; C113

; Delay for repeatin the NOISE_SFX_SEA_WAVES sound effect
; Plays when reaching $A0
wNoiseSfxSeaWavesCounter::
  ds 1 ; C114

; Unlabeled
wC115:
  ds 1 ; C115

; Unlabeled
wC116:
  ds 1 ; C116

; Unlabeled
wC117:
  ds 1 ; C117

; Unlabeled
wC118:
  ds 1 ; C118

; Unlabeled
wC119:
  ds 1 ; C119

; Unlabeled
wC11A:
  ds 1 ; C11A

; Unlabeled
wC11B:
  ds 1 ; C11B

; See LINK_MOTION_* constants for possible values.
wLinkMotionState:
  ds 1 ; C11C

; Unlabeled
wC11D:
  ds 1 ; C11D

; Unlabeled
wC11E:
  ds 1 ; C11E

; The condition of the ground Link is standing on:
; 0 = dry ground,
; 1 = steps (only when moving),
; 3 = wet or grassy,
; 7 = pit,
; Also see: wLinkGroundVfx
wLinkGroundStatus:: 
  ds 1 ; C11F

; Number of consecutive steps taken by Link.
; Doubled when running with pegasus boots.
; Special values:
;  -1 = bumping using Pegasus Boots,
;   7 = initial value at rest
wConsecutiveStepsCount:
  ds 1 ; C120

; TODO comment
wIsUsingSpinAttack::
  ds 1 ; C121

; Link's spin attack charging meter:
; 0x00 = not charged,
; 0x28 = fully charged
wSwordCharge::
  ds 1 ; C122

; Index of the entity being currently animated.
; (Also used for the current transcient VFX being drawn.)
wActiveEntityIndex::
  ds 1 ; C123

; See ROOM_TRANSITION_* constants for possible values.
wRoomTransitionState:: 
  ds 1 ; C124

; See DIRECTION_* constants for possible values
wRoomTransitionDirection::
  ds 1 ; C125

; Position of the first tile of a background region
; to be updated during a room transition (low byte)
wBGUpdateRegionOriginHigh::
  ds 1 ; C126

; Position of the first tile of a background piece (row or colum)
; to update during a room transition (high byte)
wBGUpdateRegionOriginLow::
  ds 1 ; C127

; Number of tiles of a background piece (row or column) to be updated in a single batch
wBGUpdateRegionTilesCount::
  ds 1 ; C128

; Number of frames remaining before reaching the mid-screen transition point
wRoomTransitionFramesBeforeMidScreen::
  ds 1 ; C129

; Unlabeled
wC12A:
  ds 1 ; C12A

; Unlabeled
wC12B:
  ds 1 ; C12B

; Stop the room transition when reaching this value
wRoomTransitionTargetScrollX::
  ds 1 ; C12C

; Stop the room transition when reaching this value
wRoomTransitionTargetScrollY::
  ds 1 ; C12D

; Position of the first visible background tile (high byte)
wBGOriginHigh:: 
  ds 1 ; C12E

; Position of the first visible background tile (low byte)
wBGOriginLow::
  ds 1 ; C12F

; Unlabeled
wC130::
  ds 3 ; C130

; 0x00 = no collision,
; 0x03 = obstacle on top/bottom,
; 0x04 = unknown,
; 0x08 = unknown,
; 0x0C = obstacle on left/right
wCollisionType::
  ds 1 ; C133

; Unlabeled
wC134:
  ds $2 ; C134

; Position of the sword during a sping attack
; See SWORD_DIRECTION_* constants for possible values
wSwordDirection::
  ds 1 ; C136

; State of the sword during a normal swing or a swing attack:
; 0x00 = none,
; 0x01 = swing start,
; 0x02 = swing middle,
; 0x03 = swing front,
; 0x04 = swing end
wSwordAnimationState:: 
  ds 1 ; C137

; Unlabeled
wC138::
  ds $5 ; C138 - C13E

; Seed for the Random Number Generator
wRandomSeed::
  ds 1 ; C13D

; Unlabeled
wC13E::
  ds $6 ; C13E - C143

; TODO comment
wIsLinkPushing:: ; C144
  ds 1

; Unlabeled
wC145::
  ds $1 ; C145

; Is Link in the air (jumping with the feather, flying with roaster, etc)?
wIsLinkInTheAir::
  ds 1 ; C146

; Unlabeled
wC147::
  ds $3 ; C147 - C149

; TODO comment
wIsRunningWithPegasusBoots::
  ds 1 ; C14A

; Pegasus Boots charge meter:
; 0x00 = not charged,
; 0x1F = fully charged
wPegasusBootsChargeMeter::
  ds 1 ; C14B

; TODO comment
wIsShootingArrow::
  ds 1 ; C14C

; Link's active projectiles.
; If ≥0x02, Link cannot shoot any more projectiles.
; Re-initialized to 0 at the end of each frame.
wActiveProjectileCount::
  ds 1 ; C14D

; TODO comment
wHasPlacedBomb::
  ds 1 ; C14E

; TODO comment
wInventoryAppearing::
  ds 1 ; C14F

; Unlabeled
wC150::
  ds 5 ; C150 - C154

; background offset for shaking the screen vertically
wScreenShakeHorizontal::
  ds 1 ; C155

; background offset for shaking the screen vertically
wScreenShakeVertical::
  ds 1 ; C156

; Unlabeled
wC157::
  ds $2 ; C157 - C158

; TODO comment
wInventoryCursorFrameCounter::
  ds 1 ; C159

; TODO comment
wHasMirrorShield::
  ds 1 ; C15A

; TODO comment
wIsUsingShield::
  ds 1 ; C15B

; Is Link carrying an object above his head
; (not a boolean -- possible values: Data_003_56F1)
wIsCarryingLiftedObject:
  ds 1 ; C15C

; Contains a DIRECTION_* value taken from Link's irection
; TODO rename
wC15D:
  ds 1 ; C15D

; Unlabeled
wC15E:
  ds 1 ; C15E

; Unlabeled
wC15F:
  ds 1 ; C15F

; Unlabeled
wC160:
  ds 1 ; C160

; Unlabeled
wC161:
  ds 1 ; C161

; Unlabeled
wC162:
  ds 1 ; C162

; 1 = if on low health by measure of ThresholdLowHealthTable,
; 0 = if health is higher
wIsOnLowHeath::
  ds 1 ; C163

; TODO comment
wDialogCharacterIndexHi:
  ds 1 ; C164

; Delay boss intro until this reaches zero
wBossIntroDelay:
  ds 1 ; C165

; While not zero, Link is shown playing the Ocarina
wLinkPlayingOcarinaCountdown:
  ds 1 ; C166

; Unlabeled
wC167:
  ds 1 ; C167

; Unlabeled
wC168:
  ds 1 ; C168

; TODO comment
wNextJingle:
  ds 1 ; C169

; Unlabeled
wC16A:
  ds 1 ; C16A

; TODO comment
wTransitionSequenceCounter::
  ds 1 ; C16B

; Unlabeled
wC16C:
  ds 1 ; C16C

; Unlabeled
wC16D:
  ds 1 ; C16D

; Unlabeled
wC16E:
  ds 1 ; C16E

; State of the dialog open or close animation.
; Values goes from 0 to 5.
wDialogOpenCloseAnimationFrame:
  ds 1 ; C16F

; TODO comment
wDialogCharacterIndex:
  ds 1 ; C170

; TODO comment
wDialogNextCharPosition:
  ds 1 ; C171

; TODO comment
wDialogScrollDelay:: ; C172
  ds 1

; TODO comment
wDialogIndex:
  ds 1 ; C173

; Unlabeled
wC174:
  ds 1 ; C174

; Unlabeled
wC175:
  ds 1 ; C175

; Unlabeled
wC176:
  ds 1 ; C176

; 0 or 1 depending on the first or second option is selected in a ask dialog
wDialogAskSelectionIndex:
  ds 1 ; C177

; Unlabeled
wC178:
  ds 1 ; C178

; Unlabeled
wC179:
  ds 1 ; C179

; Unlabeled
wC17A:
  ds 1 ; C17A

; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Mono_Pausing_the_Engine_and_Mono.2FDX_Free-Movement_Mode
wFreeMovementMode::
  ds 1 ; C17B

; Unlabeled
wC17C::
  ds 3 ; C17C - C17E

; Special Background effect applied during some transitions or animations.
; See TRANSITION_GFX_* constants for possible values.
wTransitionGfx::
  ds 1 ; C17F

; Number of frames rendered during a warp transition.
wTransitionGfxFrameCount::
  ds 1 ; C180

; Environmental visual effect displayed depending on which ground Link is standing.
; This may also affect the sound effects, or Link's position.
; See GROUND_VFX_* constants for possible values.
wLinkGroundVfx::
  ds 1 ; C181

; Unlabeled
wC18E::
  ds 12 ; C182 - C18D

; Event for the current room.
; A combination of trigger and effect values.
; See TRIGGER_* and EFFECT_* constants for possible values.
wRoomEvent::
  ds 1 ; C18E

; Has the event effect for the current room been executed already?
wRoomEventEffectExecuted::
  ds 1 ; C18F

; Unlabeled
wC190::
  ds 15 ; C190 - C19E

; Upper bit   = set if the dialog is displayed on bottom (instead of top)
; Lowest bits = the dialog state (see DIALOG_* constants for possible values)
wDialogState::
  ds 1 ; C19F

; Unlabeled
wC1A0::
  ds 2 ; C1A0 - C1A1

; Unlabeled
wC1A2::
  ds 1 ; C1A2

; Unlabeled
wC1A3::
  ds 2 ; C1A3 - C1A4

; Number of conveyor belts on the current screen
wConveyorBeltsCount::
  ds 1 ; C1A5

; Unlabeled
wC1A6::
  ds 1 ; C1A6

; Unlabeled
wC1A7::
  ds 1 ; C1A7

; Unlabeled
wC1A8::
  ds 1 ; C1A8

; The "Got item" dialog to display
; Values:
;  0 = no item,
;  1 = Piece of Power,
;  2 = Toadstool,
;  3 = Magic powder,
;  4 = Break pots (?),
;  5 = Guardian Acorn
wDialogGotItem::
  ds 1 ; C1A9

; Number of frames to wait (while playing the "got item" sound effect)
; before displaying the dialog
wDialogGotItemCountdown::
  ds 1 ; C1AA

; Unlabeled
ds $11

; Number of frames to wait before loading the previous map and room
wLoadPreviousMapCountdown::
  ds 1 ; C1BC

; Non-zero when the BossIntro routine did its thing
wDidBossIntro::
  ds 1 ; C1BD

; Non-zero after initializing a boss entity
wInBossBattle::
  ds 1 ; C1BE

; TODO comment
wScrollXOffset::
  ds 1 ; C1BF

; Gets set to 6 whenever Link uses the bow or drops a bomb,
; and then decrements by 1 each frame.
wBombArrowCooldown::
  ds 1 ; C1C0

; Unlabeled
wC1C1::
  ds 1 ; C1C1

; Unlabeled
wC1C2::
  ds 1 ; C1C2

; Unlabeled
wC1C3::
  ds 1 ; C1C3

; Unlabeled
wC1C4::
  ds 1 ; C1C4

; not used
ds 1 ; C1C5

; Unlabeled
wC1C6::
  ds 1 ; C1C6

; Unlabeled
wC1C7::
  ds 1 ; C1C7

; Unlabeled
wC1C8::
  ds 1 ; C1C8

; Unlabeled
wC1C9::
  ds 1 ; C1C9

; Unlabeled
wC1CA::
  ds 1 ; C1CA

; Unlabeled
wC1CB::
  ds 1 ; C1CB

; Unlabeled
wC1CC::
  ds 1 ; C1CC

; Unlabeled
wC1CD::
  ds 1 ; C1CD

; Unlabeled
wC1CE::
  ds 1 ; C1CE

; Unlabeled
wC1CF::
  ds 1 ; C1CF

; Unlabeled
wC1D0::
  ds 16 ; C1D0 -C1DF

; Unlabeled
wC1E0::
  ds 16 ; C1E0 - C1EF

; Unlabeled
wC1F0::
  ds 4 ; C1F0 - C1F3

; Unlabeled
wC1F4::
  ds 12 ; C1F4 - C1FF

; ---------------------------------------------------------
;
; Entities state
;
;----------------------------------------------------------

; X position of visible entities
wEntitiesPosXTable::
  ds $10 ; C200 - C20F

; Y position of visible entities
wEntitiesPosYTable::
  ds $10 ; C210 - C21F

; Controls the sign of the X position:
; 0x00 = position is positive,
; 0xFF = position is negative
wEntitiesPosXSignTable::
  ds $10 ; C220 - C22F

; Controls the sign of the Y position:
; 0x00 = position is positive,
; 0xFF = position is negative
wEntitiesPosYSignTable::
  ds $10 ; C230 - C23F

; X Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedXTable::
  ds $10 ; C240 - C24F

; Y Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedYTable::
  ds $10 ; C250 - C25F

; Used as a way to give entities speeds divided by 16. (EntitySpeedX * 16) is
; added to EntitySpeedXAcc and the carry is used to move the entity.
wEntitiesSpeedXAccTable::
  ds $10 ; C260 - C26F

; Used as a way to give entities speeds divided by 16. (EntitySpeedY * 16) is
; added to EntitySpeedYAcc and the carry is used to move the entity.
wEntitiesSpeedYAccTable::
  ds $10 ; C270 - C27F

; State of visible entities
; See ENTITY_STATUS_* constants
wEntitiesStatusTable::
  ds $10 ; C280 - C28F

; Store the main state of an entity. Meaning of values is entity-specific.
;
; For instance:
; Mabe fox:  1 when jumping around, and 0 when standing in place moving the tail.
; Cucco: 1 when jumping around, and 0 when standing in place
; BowWow: 0 when standing still, 1 when bouncing lightly, 2 when making a big jump, 3 after a jump
; Village kids: 0 when standing still, 1 when bouncing
; Moblin: 0 when walking, 1 when standing still
; etc.
wEntitiesStateTable::
  ds $10 ; C290 - C29F

; Indicates if the entity is collisioning:
; 0 = no collisions,
; 1 = collision on the right,
; 2 = collision on the left,
; 3 = collision on the bottom,
; 4 = collision on the top
wEntitiesCollisionsTable::
  ds $10 ; C2A0 - C2AF

; Entity-specific state.
;
; Examples:
;  - Octorock: enumerates 1-2-3-0
;  - Moblin: enumerates 1-2-3-0
;  - Cucco: stays to 0
;  - Butterfly: stores a delta X to move closer to Link
;  - Genie: store the substate
;  - LikeLike: swallowed item
wEntitiesPrivateState1Table::
  ds $10 ; C2B0 - C2BF

; Entity-specific state.
;
; Examples:
;  - Butterfly: stores a delta Y to move closer to Link
wEntitiesPrivateState2Table::
  ds $10 ; C2C0 - C2CF

; Is the item a droppable? Or pickable?
wEntitiesUnknownTableD::
  ds $10 ; C2D0 - C2DF

; Frames before the next state transition of the entity
wEntitiesTransitionCountdownTable::
  ds $10 ; C2E0 - C2EF

; Entity-specific countdown 1
wEntitiesPrivateCountdown1Table::
  ds $10 ; C2F0 - C2FF

; Entity-specific countdown 2
wEntitiesPrivateCountdown2Table::
  ds $10 ; C300 - C30F

; When the altitude is higher than 0, the entity position is shifted vertically,
; and a shadow is displayed underneath.
wEntitiesPosZTable::
  ds $10 ; C310 - C31F

; Z Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedZTable::
  ds $10 ; C320 - C32F

; Used as a way to give entities speeds divided by 16. (EntitySpeedZ * 16) is
; added to EntitySpeedZAcc and the carry is used to move the entity.
wEntitiesSpeedZAccTable::
  ds $10 ; C330 - C33F

; Physics attribute flags:
; bits 0-3: of number allocated sprites in OAM memory,
; bit 4: display shadow on posZ > 0 if set,
; bit 5: item is pickable,
; bit 6: doesn't react to projectiles if set (arrow, hookshot, etc.),
; bit 7: doesn't hurt Link if set (Link's go through)
wEntitiesPhysicsFlagsTable::
  ds $10 ; C340 - C34F

; Type of hitbox (plus maybe other flags):
; bit 0-4: hitbox type (see HitboxPositions),
; bit 5: TODO ???,
; bit 6: TODO ???,
; bit 7: force collision (for some entities only)
wEntitiesHitboxFlagsTable::
  ds $10 ; C350 - C35F

; TODO comment
wEntitiesHealthTable::
  ds $10 ; C360 - C36F

; Unused value
; TODO discripe more specific
wEntitiesUnusedTableA::
  ds $10 ; C370 - C37F

; Direction of the entity.
; See DIRECTION_* constants for possible values.
; This direction is always relevant for projectile-throwing entities
; (like Moblins or Octorocks). Other entities may not be as strict to
; update their direction.
wEntitiesDirectionTable::
  ds $10 ; C380 - C38F

; TODO comment
wEntitiesUnknowTableR::
  ds $10 ; C390 - C39F

; Type of the entity
wEntitiesTypeTable::
  ds $10 ; C3A0 - C3AF

; Index of an entity sprite variant, depending for instance on the direction,
; the tail waving, etc.
; A sprite variant may use entirerly different tiles, or change only some of them.
wEntitiesSpriteVariantTable::
  ds $10 ; C3B0 - C3BF

; Index of the next available OAM slot
wOAMNextAvailableSlot::
  ds 1 ; C3C0

; OAM-related
wC3C1::
  ds 2 ; C3C1 - C3C2

; Unlabeled
wC3C3::
  ds 1 ; C3C3

; Unlabeled
wC3C4::
  ds 1 ; C3C4

; Unlabeled
wC3C5::
  ds 2 ; C3C5 - C3C6

; Unlabeled
wC3C7::
  ds 1 ; C3C7

; Unlabeled
wC3C8::
  ds 1 ; C3C8

; Unlabeled
wC3C9::
  ds 1 ; C3C9

; Unlabeled
wC3CA::
  ds 1 ; C3CA

; Type of the object affecting the background palette
; (for instance a dark palette when torches are not lit)
wObjectAffectingBGPalette::
  ds 1 ; C3CB

; Adress of a palette[frameCount] array
wBGPaletteEffectAddress:: 
  ds 1 ; C3CC

; Unlabeled
wC3CD::
  ds 1 ; C3CD

; Unlabeled
wC3CE::
  ds 1 ; C3CE

; Unlabeled
wC3CF::
  ds 1 ; C3CF

; TODO comment
wEntitiesUnknowTableY::
  ds $10 ; C3D0 - C3DF

; Room id of the entity
wEntitiesRoomTable::
  ds $10 ; C3E0 - C3EF

; Unlabeled
wC3F0::
  ds $10 ; C3F0 - C3FF

; TODO comment
wEntitiesUnknowTableS::
  ds $10 ; C400 - C40F

; Invulnerability countdown?
; While this countdown is active, the entity does not
; participate to collision
wEntitiesIgnoreHitsCountdownTable::
  ds $10 ; C410 - C41F

; Countdown during which an entity flashes when taking a hit.
; (or when a bomb is nearing to explode.)
; A flashing entity (countdown > 0) doesn't take any damages from
; sword or projectiles.
; When the countdown reaches 0, the flashing stops.
wEntitiesFlashCountdownTable::
  ds $10 ; C420 - C42F

; Entity initialization flags?
; Seems to be a bitfield
; bit 2: set for bosses, clear for minibosses
wEntitiesUnknowTableH::
  ds $10 ; C430 - C43F

; Entities-specific private state?
wEntitiesUnknowTableP::
  ds $10 ; C440 - C440

; Number of frame before a dropped item disappears
wEntitiesDropTimerTable::
  ds $10 ; C450 - C45F

; TODO comment
wEntitiesLoadOrderTable::
  ds $10 ; C460 - C46F

; TODO find better name
; Some physics flags?
; Used by func_015_7995
; Possible values: 02, 03
wEntitiesUnknowTableI::
  ds $10 ; C470 - C47F

; TODO find better name
; Some kind of countdown
wEntitiesUnknowTableV::
  ds $10 ; C480 - C48F

; TODO comment
wEntitiesUnknowTableW::
  ds $10 ; C490 - C49F

; See label_3E8E
; (whether smoke vfx should spawn?)
wEntitiesUnknowTableZ::
  ds $10 ; C4A0 - C4AF

; Unlabeled
wC4B0::
  ds $10 ; C4B0 - C4BF

wC4C0::
  ds $10 ; C4C0 - C4CF

; Entities health group
; See ConfigureNewEntity
; TODO check name, labeler is unsure
wEntitiesHealthGroup::
  ds $10 ; C4D0

; Item to drop when this entity is destroyed.
; Possible values:
;  00 = drop a random item or power-up,
;  01-FE = dropped entity type,
;  FF = don't drop anything at all
wEntitiesDroppedItemTable::
  ds $10 ; C4E0 - C4EF

; TODO rename and comment
wEntitiesUnknowTableJ::
  ds $10 ; C4F0

; If enabled, alternate between two Background position every frame.
wAlternateBackgroundEnabled::
  ds 1 ; C500

; Unlabeled
wC501::
  ds 1 ; C501

; Unlabeled
wC502::
  ds 1 ; C502

; Unlabeled
wC503::
  ds 1 ; C503

; Unlabeled
wC504::
  ds 1 ; C504

; Unlabeled
wC505::
  ds 4 ; C505 - C508

; Index of the item we are grabbing in the shop
wItemPickedUpInShop::
  ds 1 ; C509

; Unlabeled
wC50A::
  ds 1 ; C50A

; Unlabeled
wC50B::
  ds 1 ; C50B

; Unlabeled
wC50C::
  ds 1 ; C50C

; Unlabeled
wC50D::
  ds 1 ; C50D

; Unlabeled
wC50E::
  ds 1 ; C50E

; Unlabeled
wC50F::
  ds 1 ; C50F

; Temporary visual effects displayed as non-interactive sprites.
; Values are filled starting from the end of the array.
; See TRANSCIENT_VFX_* constants for possible values.
wTranscientVfxTypeTable::
  ds $10 ; C510 - C51F

; Countdown for the transcient visual effects.
; When reaching 0, the visual effect gets removed.
wTranscientVfxCountdownTable::
  ds $10 ; C520 - C52F

; Transcient visual effects X position
wTranscientVfxPosXTable::
  ds $10 ; C530 - C53F

; Transcient visual effects Y position
wTranscientVfxPosYTable::
  ds $10 ; C540 - C54F

; Unlabeled
wC550::
  ds $10 ; C550-C55F

; Unlabeled
wC560::
  ds $10 ; C560 - C56F

; Unlabeled
wC570::
  ds $20 ; C570 - C58F

; Unlabeled
wC590::
  ds $10 ; C590 - C59F

; Unlabeled
wC5A0::
  ds 1 ; C5A0

; Unlabeled
wC5A1::
  ds 1 ; C5A1

; Unlabeled
wC5A2::
  ds 1 ; C5A2

; Unlabeled
wC5A3::
  ds 1 ; C5A3

; Unlabeled
wC5A4::
  ds 1 ; C5A4

; Unlabeled
wC5A5::
  ds 1 ; C5A5

; Unlabeled
wC5A6::
  ds 1 ; C5A6

; When reaching zero, play the WAVE_SFX_BOSS_AGONY sound effect
wBossAgonySFXCountdown::
  ds 1 ; C5A7

; Type of lifted entity. Used only for Rooster behavior.
wLiftedEntityType::
  ds 1 ; C5A8

; Unlabeled
wC5A9::
  ds 1 ; C5A9

; Number of rooms progressed correctly in the Wind Fish's Egg maze
wEggMazeProgress::
  ds 1 ; C5AA

; TODO comment
wDialogSFX::
    ds 1 ; C5AB

; Unlabeled
wC5AC::
  ds 1 ; C5AC

; Unlabeled
wC5AD::
  ds 1 ; C5AD

; Unlabeled
wC5AE::
  ds 1 ; C5AE

; When reaching zero, play wNextWorldMusicTrack
wNextWorldMusicTrackCountdown::
  ds 1 ; C5AF

; zero if sword collision is disabled
; any other value enables sword collision
; this is used to check if a object can be hit by sword
wSwordCollisionEnabled::
  ds 1 ; C5B0

; not used
wC5B1::
  ds 15 ; C5B1- C5BF

; Unlabeled
wC5C0::
  ds $10 ; C5C0 - C5CF

; Unlabeled
; check for not used addresses
wC5D0::
  ds $8B0 ; C5D0 - CE7F

; Index of the next slot to use in wRecentRooms
wRecentRoomsIndex::
  ds 1 ; CE80

; List of the 6 most recently loaded rooms.
wRecentRooms::
  ds 6 ; CE81

; not used
wCE87::
  ds $79

; For each room, store the number of entities not to load
; when entering the room next time.
; Used to avoid respawning enemies as soon as the player moves to
; the next room.
wEntitiesClearedRooms::
  ds $FF ; CF00 - CFFF

section "WRAM Bank1", wramx[$d000], bank[1]

; This location has multiple uses.
; Is the arrow on the File Selection screen on the COPY item
wIsFileSelectionArrowShifted::
; This location has multiple uses.
; Scratch variable using during the Credits sequence
wCreditsScratch0::
  ds 1 ; D000

; TODO comment
wIntroTimer::
  ds 1 ; D001

; TODO comment
wIntroSubTimer::
  ds 1 ; D002

; Unlabeled
wD003::
  ds 1 ; D003

; Unlabeled
wD004::
  ds 1 ; D004

; Unlabeled
wD005::
  ds 1 ; D005

; Unlabeled
wD006::
  ds 1 ; D006

; Unlabeled
wD007::
  ds 1 ; D007

; Unlabeled
wD008::
  ds 1 ; D008

; Unlabeled
wD009::
  ds 1 ; D009

; Unlabeled
wD00A::
  ds 1 ; D00A

; Unlabeled
wD00B::
  ds 1 ; D00B

; Unlabeled
wD00C::
  ds 1 ; D00C

; Unlabeled
wD00D::
  ds 1 ; D00D

; TODO comment
wCreditsSubscene::
  ds 1 ; D00E

; Unlabeled
wD00F::
  ds 1 ; D00F

; Unlabeled
wD010::
  ds 1 ; D010

; Unlabeled
wD011::
  ds 1 ; D011

; Unlabeled
wD012::
  ds 1 ; D012

; Unlabeled
wD013::
  ds 1 ; D013

; Unlabeled
wD014::
  ds 1 ; D014

; Unlabeled
wD015::
  ds 1 ; D015

; Unlabeled
wD016::
  ds 1 ; D016

; Unlabeled
wD017::
  ds 1 ; D017

; Unlabeled
wD018::
  ds 1 ; D018

; Unlabeled
wD019::
  ds 1 ; D019

; Unlabeled
wD01A::
  ds 1 ; D01A

; Unlabeled
wD01B::
  ds 1 ; D01B

; Unlabeled
wD01C::
  ds 1 ; D01C

; Unlabeled
wD01D::
  ds 1 ; D01D

; Unlabeled
wD01E::
  ds 1 ; D01E

; Unlabeled
wD01F::
  ds 1 ; D01F

; Unlabeled
wD020::
  ds 1 ; D020

; Unlabeled
wD021::
  ds 1 ; D021

; Unlabeled
wD022::
  ds 1 ; D022

; not used
; TODO check if never used
wD023::
  ds 13 ; D023 - D02F

; Unlabeled
wD030::
  ds $10 ; D030 - D03F

; Unlabeled
wD040::
  ds $10 ; D040 - D04F

; Unlabeled
wD050::
  ds $10 ; D050 - D05F

; Unlabeled
wD060::
  ds $10 ; D060 - D06F

; not used
; TODO check if never used
wD070::
  ds $90 ; D070 - D0FF

; Unlabeled
wD100::
  ds 1 ; D100

; Unlabeled
wD101::
  ds 4 ; D101 - D104

; Unlabeled
wD105::
  ds 1 ; D105

; Unlabeled
wD106::
  ds 2 ; D106 - D107

; Unlabeled
wD108::
  ds 8 ; D108 - D10F

; Unlabeled
wD110::
  ds 1 ; D110

; Unlabeled
wD111::
  ds 4 ; D111 - D114

; Unlabeled
wD115::
  ds 1 ; D115

; Unlabeled
wD116::
  ds 1 ; D116

; not used
wD117::
  ds $102 ; D117 - D218

; Current form of the Final Nightmare (0-5)
wFinalNightmareForm::
  ds 1 ; D219

; Unlabeled
wD21A::
  ds 1 ; D21A

; Unlabeled
wD21B::
  ds 1 ; D21B

; Unlabeled
wD21C::
  ds 1 ; D21C

; Unlabeled
wD21D::
  ds 1 ; D21D

; Unlabeled
wD21E::
  ds 1 ; D21E

; Unlabeled
wD21F::
  ds 1 ; D21F

; Unlabeled
wD220::
  ds 1 ; D220

; Unlabeled
wD221::
  ds 1 ; D221

; Unlabeled
wD222::
  ds 1 ; D222

; Unlabeled
wD223::
  ds 1 ; D223

; Unlabeled
wD224::
  ds 1 ; D224

; Unlabeled
wD225::
  ds 1 ; D225

; Unlabeled
wD226::
  ds 1 ; D226

; Unlabeled
wD227::
  ds 1 ; D227

; Unlabeled
wD228::
  ds 1 ; D228

; not used
wD229::
  ds 215 ; D220 - D2FF

; Note transpose value applied to all channels. Should be multiple of 2.
wMusicTranspose::
  ds 1 ; D300

; Points to some data which somehow sets the music's speed
wMusicSpeedPointer::
  ds 2 ; D301 - D302

; not used
wD303::
  ds 4 ; D303 - D306

; Unlabeled
; ds 4 (channel-specific, used by opcode A0-AF)
wD307::
  ds 1 ; D307

; Unlabeled
wD308::
  ds 8 ; D308 - D30F

; Channel 1 data pointer
wD310::
  ds 2 ; D310 - D311

; Unlabeled
; Copied from D313. A counter?
wD312::
  ds 1 ; D312

; Unlabeled
wD313::
  ds 1 ; D313
  
; Unlabeled
; Channel 1 definition data pointer
wD314::
  ds 2 ; D314 - D315

; Unlabeled
; Opcode 9D stores data here.
; For channel 3, D336-D337 are a pointer to waveform data.
wD316::
  ds 1 ; D316

; Unlabeled
; Points to frequency data for NRx3 and NRx4  
wD317::
  ds 3 ; D317 - D319

; Unlabeled
wD31A::
  ds 1 ; D31A

; Unlabeled
wD31B::
  ds 1 ; D31B

; Unlabeled
; Loop pointer for sound definition data?
wD31C::
  ds 2 ; D31C - D31D

; Unlabeled
; Incremented each frame?
wD31E::
  ds 1 ; D31E

; Unlabeled
; Audio loop counter; a segment loops [wD31F] times, then continues on.
wD31F::
  ds 1 ; D31F

; Unlabeled
; Channel 2 data (similar to D310)
wD320::
  ds $10 ; D320 - D32F

; Unlabeled
; Channel 3 data (similar to D310)
wD330::
  ds $10 ; D330 - D33F

; Unlabeled
; Channel 4 data (similar to D310)
wD340::
  ds $10 ; D340 - D34F

; Current sound channel being processed. Number from 1-4.
wActiveChannelIndex::
  ds $10 ; D350 - D35F

; The squareform jingle currently playing
wActiveJingle::
  ds 1 ; D360

; Unlabeled
; squareform jingle parameters
wD361::
  ds 7 ; D361 - D367

; The music track to be played next
wMusicTrackToPlay::
  ds 1 ; D368

; Copied from wMusicTrackToPlay
wActiveMusicIndex::
  ds 1 ; D369

; Unlabeled
wD36A::
  ds 1 ; D36A

; Unlabeled
wD36B::
  ds 1 ; D36B

; Unlabeled
wD36C::
  ds 1 ; D36C

; Unlabeled
wD36D::
  ds 1 ; D36D

; Unlabeled
wD36E::
  ds 1 ; D36E

; Unlabeled
wD36F::
  ds 1 ; D36F

; The waveform sound effect currently playing
wActiveWaveSfx::
  ds 1 ; D370

; wave sound effect parameters
wD371::
  ds 7 ; D371 - D377

; The noise generator sound effect currently playing
wActiveNoiseSfx::
  ds 1 ; D378

; Unlabeled
; noise sound effect parameters?
wD379::
  ds 1 ; D379

; Unlabeled
ds $D39E-$D37A

wD39E::
  ; Set to 1 by opcode 99, 0 by opcode 9A.
  ; Enabled "envelope" behaviour of channel 3?
  ds 1

; Unlabeled
ds $D3C8-$D39F

; D3B6: ds 8 (channel-specific data)

wD3C8::
  ds 1
wD3C9::
  ds 1
wD3CA::
  ; Copied from wActiveMusicIndex (a music index)
  ds 1
wPreviousMusicTrack:: ; D3CB
  ; Copied from $D3CA
  ; The music track that was playing previously.
  ds 1

; Unlabeled
ds 2

wActiveMusicTable:: ; D3CE
  ds 1

; Unlabeled
ds $D3D9-$D3CF

wActiveMusicTableIndex:: ; D3D9
  ; Set to 1 by opcode 94
  ds 1

; Unlabeled
ds $D401-$D3DA

; Room warps
;
; Each room can have 4 warp points. The room warps destination are defined below,
; and the warp positions is defined at D416-D419.

wWarpStructs::

; Warp 0
wWarp0MapCategory:: ; D401
  ds 1
wWarp0Map:: ; D402
  ds 1
wWarp0Room:: ; D403
  ds 1
wWarp0DestinationX:: ; D404
  ds 1
wWarp0DestinationY:: ; D405
  ds 1

; Warp 1
wWarp1MapCategory:: ; D406
  ds 1
wWarp1Map:: ; D407
  ds 1
wWarp1Room:: ; D408
  ds 1
wWarp1DestinationX:: ; D409
  ds 1
wWarp1DestinationY:: ; D40A
  ds 1

; Warp 2
wWarp2MapCategory:: ; D40B
  ds 1
wWarp2Map:: ; D40C
  ds 1
wWarp2Room:: ; D40D
  ds 1
wWarp2DestinationX:: ; D40E
  ds 1
wWarp2DestinationY:: ; D40F
  ds 1

; Warp 3
wWarp3MapCategory:: ; D410
  ds 1
wWarp3Map:: ; D411
  ds 1
wWarp3Room:: ; D412
  ds 1
wWarp3DestinationX:: ; D413
  ds 1
wWarp3DestinationY:: ; D414
  ds 1

wPieceOfPowerKillCount:: ; D415
  ; Kill count, to tell if a Piece of Power should be dropped
  ds 1

wWarpPositions::
wWarp0PositionTileIndex:: ; D416
  ; Position of warp 0, as a tile index on the map
  ds 1

wWarp1PositionTileIndex:: ; D417
  ; Position of warp 1, as a tile index on the map
  ds 1

wWarp2PositionTileIndex:: ; D418
  ; Position of warp 2, as a tile index on the map
  ds 1

wWarp3PositionTileIndex:: ; D419
  ; Position of warp 3, as a tile index on the map
  ds 1

; Unlabeled
ds $48

wCompassSfxCountdown:: ; D462
  ; Each frame decrements the value.
  ; When reaching 0, play the compass sfx.
  ds 1

; Unlabeled
ds 9

wBossDefeated:: ; D46C
  ; A boss was just defeated
  ds 1

; Unlabeled
ds $4

wGuardianAcornCounter:: ; D471
  ; Increases on each kill. Reset to 0 when hit, or when it hits 12 a guardian acorn is spawned.
  ds 1

wMazeSignpostGoal:: ; D472
  ; Signpost maze: current goal
  ds 1

wMazeSignpostPos:: ; D473
  ; Signpost maze: sign activated by Link
  ds 1

; Unlabeled
ds $5

wDebugWarpIndex:: ; D479
  ; What index the B + SELECT warp tool is at (00~0B)
  ds 1

wPowerUpHits:: ; D47A
  ; Power-ups are disabled after 3 hits are taken from ennemies
  ds 1

wForceFileSelectionScreenMusic:: ; D47B
  ; If not zero, force the music track to change when displaying the file selections screen
  ds 1

wActivePowerUp:: ; D47C
  ; 0:  No power-up
  ; 1:  Piece of Power
  ; 2:  Guardian Accorn
  ds 1

; Unlabeled
wD47D::
  ds 1

wDidStealItem:: ; D47E
  ds 1

; Unlabeled
ds 1 ; D47F

wDungeonMinimap:: ; D480
  ds $40

; Unlabeled
ds $D580 - $D4C0

wEntitiesHitboxPositionTable:: ; D580
  ; Entities hitboxes.
  ; Each hitbox is a tuple of 4 bytes: x, y, width and height.
  ds MAX_ENTITIES * 4

; Unlabeled
ds $D600 - $D5C0

; Data structures for copying data to vram during blanking times
wRequests::               ; D600
  ; is 0 if background copy was executed
  ds 1

; Request destination address (big endian)
wRequest:                 ; D601
wRequestDestination:      ; D601
wRequestDestinationHigh:: ; D601
  ds 1
wRequestDestinationLow::  ; D602
  ds 1

; Request data length and mode
;   bits 0-6: data length
;   bits 7-8: copy mode (see BG_COPY_MODE_* constants)
wRequestLength:           ; D603
  ds 1

; Request data (variable length)
wRequestData:             ; D604
  ds $D6FA - $D604

wRoomSwitchableObject:: ; D6FA
  ; Is there one or more switchable objects in the room
  ; See ROOM_SWITCHABLE_OBJECT_* constants
  ds 1

; Unlabeled
ds 1

wEnginePaused:: ; D6FC
  ds 1

wLCDControl:: ; D6FD
  ds 1

wTileMapToLoad:: ; D6FE
  ds 1

wBGMapToLoad:: ; D6FF
  ds 1

; Memory region reserved for map objects of the active room.
; Actual objects are surrounded by FF values (see wRoomObjects)
;
; When loading a new room, room data is read and decoded into this
; area.
;
; NB: this area is also used in RAM bank 2, where it contains
; the object attributes.
wRoomObjectsArea:: ; D700
  ; First section is FF values padding…
  ds $11

; Start of the actual map objects for the active room (ignoring the surrounding FF values)
wRoomObjects:: ; D711
  ds $EF

; World rooms status
; Each room is a byte combining ROOM_STATUS_* constants.
wOverworldRoomStatus:: ; D800
  ds $100

wIndoorARoomStatus:: ; D900
  ds $100

wIndoorBRoomStatus:: ; DA00
  ds $100

wBButtonSlot:: ; DB00
  ds 1

wAButtonSlot:: ; DB01
  ds 1

wInventoryItem1:: ; DB02
  ds 1

wInventoryItem2:: ; DB03
  ds 1

wInventoryItem3:: ; DB04
  ds 1

wInventoryItem4:: ; DB05
  ds 1

wInventoryItem5:: ; DB06
  ds 1

wInventoryItem6:: ; DB07
  ds 1

wInventoryItem7:: ; DB08
  ds 1

wInventoryItem8:: ; DB09
  ds 1

wInventoryItem9:: ; DB0A
  ds 1

wInventoryItem10:: ; DB0B
  ds 1

wHasFlippers:: ; DB0C
  ds 1

wHasMedicine:: ; DB0D
  ds 1

wTradeSequenceItem:: ; DB0E
  ; Trade Sequence items.
  ; See TRADING_ITEM_* constants for possible values.
  ds 1

wSeashellsCount:: ; DB0F
  ds 1

; Unlabeled - Spacing byte used to check for dungeon map during InventoryDisplayLoop
wDB10 equ $DB10
  ds 1

wHasTailKey:: ; DB11
  ds 1

wHasAnglerKey:: ; DB12
  ds 1

wHasFaceKey:: ; DB13
  ds 1

wHasBirdKey:: ; DB14
  ds 1

; Golden Leaves count
; 0-5: number of Golden Leaves
; 6  : Slime Key
wGoldenLeavesCount:: ; DB15
  ds 1

; Beginning of dungeon item flags.
; 5 bytes fo each dungeon.
; For each dungeon:
;   byte 0: has map?
;   byte 1: has compass?
;   byte 2: has stone slab?
;   byte 3: has boss key?
;   byte 4: small keys count
wDungeonItemFlags:: ; DB16
  ds $2D

wPowerBraceletLevel:: ; DB43
  ds 1

wShieldLevel:: ; DB44
  ds 1

wArrowCount:: ; DB45
  ds 1

; Set to 1 when you steal from the shop.
; Set back to zero when the shopkeeper kills you.
wHasStolenFromShop:: ; DB46
  ds 1

; Unlabeled
wDB47 equ $DB47
  ds 2

; $0111 means that the player has every song.
;   bit 0: has Frog's Song of the Soul
;   bit 1: has Manbo's Mambo
;   bit 2: has Ballad of the Wind Fish
wOcarinaSongFlags:: ; DB49
  ds 1

; Which song is selected (zero based)
wSelectedSongIndex:: ; DB4A
  ds 1

; 0 means that the player does not have the Toadstool
; 1 means that the player has the Toadstool
wHasToadstool:: ; DB4B
  ds 1

wMagicPowderCount:: ; DB4C
  ds 1

wBombCount:: ; DB4D
  ds 1

wSwordLevel:: ; DB4E
  ; Set to 1 when Link retrieves his sword on the beach
  ds 1

wName:: ; DB4F
  ds NAME_LENGTH ; 5

wDB54:: ds 1 ; Unknown, but some kind of map index entry

; Indicates if we have spoken with richard.
; 1 indicates spoken with grandpa ulrira in his own house, but does not seem to be used anywhere.
; 2 means spoken with richard, changes the telephone message.
wRichardSpokenFlag:: ; DB55
  ds 1

wIsBowWowFollowingLink:: ; DB56
  ; Bow-Wow status.
  ; Values:
  ;   0   not following Link
  ;   1   Bow-Wow is following Link
  ;   80  Bow-Wow has been kidnapped
  ds 1

; Death count (one per save slot)
wDeathCount:: ; DB57
  ds $3

; Number of hearts ($08 = 1 heart)
wHealth::
; DB5A
  ds 1

; Maximum number of hearts
wMaxHealth::
; DB5B
  ds 1

wHeartPiecesCount:: ; DB5C
  ds 1

wRupeeCountHigh:: ; DB5D
  ; Higher digits of the player rupees count
  ds 1

wRupeeCountLow:: ; DB5E
  ; Lower digits of the player rupees count
  ds 1

; Define Link's spawn position
; Used when loading a save file or after a game over
wSpawnLocationData:: ; DB5F
wSpawnIsIndoor:: ; DB5F
  ds 1
wSpawnMapId:: ; DB60
  ds 1
wSpawnMapRoom:: ; DB61
  ds 1
wSpawnPositionX:: ; DB62
  ; If 0, will load the pre-defined save file
  ds 1
wSpawnPositionY:: ; DB63
  ds 1
wSpawnIndoorRoom:: ; DB64
  ds 1

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: (?)
; bit 2: (?)
wHasInstrument1:: ; DB65
  ; 0: false, 2: true
  ds 1

wHasInstrument2:: ; DB66
  ; 0: false, 2: true
  ds 1

wHasInstrument3:: ; DB67
  ; 0: false, 2: true
  ds 1

wHasInstrument4:: ; DB68
  ; 0: false, 2: true
  ds 1

wHasInstrument5:: ; DB69
  ; 0: false, 2: true
  ds 1

wHasInstrument6:: ; DB6A
  ; 0: false, 2: true
  ds 1

wHasInstrument7:: ; DB6B
  ; 0: false, 2: true
  ds 1

wHasInstrument8:: ; DB6C
  ; 0: false, 2: true
  ds 1

wDB6D: ds 1

wIsThief:: ; DB6E
  ds 1

wWreckingBallRoom: ; DB6F
  ds 1

wWreckingBallPosX: ; DB70
  ds 1

wWreckingBallPosY: ; DB71
  ds 1

wNumberOfDungeon7PillarsDestroyed: ; DB72
  ds 1

wIsMarinFollowingLink:: ; DB73
  ds 1

; Unlabeled, Marin-related
wDB74 equ $DB74
  ds 1

wPurchasedMedecineCount:: ; DB75
  ; Total number of medecine ever purchased from Crazy Tracy
  ds 1

wMaxMagicPowder:: ; DB76
  ds 1

wMaxBombs:: ; DB77
  ; Maximum number of bombs that Link can carry
  ds 1

wMaxArrows:: ; DB78
  ds 1

wIsGhostFollowingLink:: ; DB79
  ds 1

wGhostSeeksGrave:: ; DB7A
  ; Zero: The ghost wants to go to House by the Bay
  ; Non-zero: ... to his grave in Kohilint Prairie
  ds 1

wIsRoosterFollowingLink:: ; DB7B
  ds 1

; Offset in the WindFishEggMazeSequence table, set to a random value chosen from $00 $08 $10 $18
wWindFishEggMazeSequenceOffset:
  ds 1

wBoomerangTradedItem:: ; DB7D
  ; Stores the inventory item that you traded for the boomerang.
  ; Initially this value is zero, indicating no trade. But after you traded the boomerang
  ; back it will be INVENTORY_BOOMERANG
  ds 1

wKidSaveHintIndex:: ;DB7E
  ; Switches between 4 different hits for one of the kids throwing the ball
  ds 1

wDB7F:: ;DB7F
  ; Unknown
  ds 1
  
; Unlabeled, outside the area that is stored in the savegame.
  ds $0F

wAddRupeeBufferHigh:: ; DB8F
  ; Higher digits of the amount of rupees to be added to your wallet (high digits)
  ds 1

wAddRupeeBufferLow:: ; DB90
  ; Amount of rupees to be added to your wallet (low digits)
  ds 1

wSubstractRupeeBufferHigh:: ; DB91
  ; Amount of rupees to be removed from your wallet (high digits)
  ds 1

wSubstractRupeeBufferLow:: ; DB92
  ; Amount of rupees to be removed from your wallet (low digits)
  ds 1

wAddHealthBuffer:: ; DB93
  ; Amount of health to be added to your health total (wHealth)
  ds 1

wSubtractHealthBuffer:: ; DB94
  ; Amount of health to be removed from your health total (wHealth)
  ds 1

wGameplayType:: ; DB95
  ; See GAMEPLAY_* constants for possible values
  ds 1

wGameplaySubtype:: ; DB96
  ; Value depens on GameplayType: this can be a sequence index, or a frame counter.
  ds 1

wBGPalette:: ; DB97
  ds 1

wOBJ0Palette:: ; DB98
  ds 1

wOBJ1Palette:: ; DB99
  ds 1

wWindowY:: ; DB9A
  ds 1

; Unlabeled
ds 1

wMapEntranceRoom:: ; DB9C
  ; Initial room of Link when loading a new map
  ds 1

wMapEntrancePositionX:: ; DB9D
  ; Initial position of Link when loading a new map
  ds 1

wMapEntrancePositionY:: ; DB9E
  ; Initial position of Link when loading a new map
  ds 1

; Unlabeled
ds 6

wIsIndoor:: ; DBA5
  ; 0 on the overworld
  ; 1 on interior maps (house, dungeons, etc)
  ds 1

wSaveSlot:: ; DBA6
  ds 1

wSaveFilesCount:: ; DBA7
  ds 1

; Unlabeled
ds 6

wIndoorRoom:: ; DBAE
  ds 1

wCurrentBank:: ; DBAF
  ds 1

wMinimapLayout:: ; DBB0
  ; Layout of the dungeon map in the inventory
  ; See INVENTORY_MINIMAP_* constants for values
  ds 1

wLinkMapEntryPositionX:: ; DBB1
  ; The position at which Link entered on a map
  ; (used for reseting Link's position after a fall)
  ds 1

wLinkMapEntryPositionY:: ; DBB2
  ; The position at which Link entered on a map
  ; (used for reseting Link's position after a fall)
  ds 1

; Unlabeled
ds 2

wKillCount2:: ; DBB5
  ds 1

; Unlabeled
wDBB6 equ $DBB6
  ds $11

wInvincibilityCounter:: ; DBC7
  ds 1

; Unlabeled
  ds 1

wTorchesCount:: ; DBC9
  ds 1

; Unlabeled
ds 2

; A table of five items flags for the current dungeon
; See also: wDungeonItemFlags
wCurrentDungeonItemFlags:: ; DBCC
wHasDungeonMap::       ds 1 ; DBCC
wHasDungeonCompass::   ds 1 ; DBCD
wHasDungeonStoneSlab:: ds 1 ; DBCE
wHasDungeonBossKey::   ds 1 ; DBCF
wSmallKeysCount::      ds 1 ; DBD0

; Unlabeled
ds $2F

wFile1DeathCountHigh:: ; DC00
  ds 1

wFile1DeathCountLow:: ; DC01
  ds 1

wFile2DeathCountHigh:: ; DC02
  ds 1

wFile2DeathCountLow:: ; DC03
  ds 1

wFile3DeathCountHigh:: ; DC04
  ds 1

wFile3DeathCountLow:: ; DC05
  ds 1

; Unlabeled
ds 6

; Photos 1-8 (bitfield)
wPhotos1:: ; DC0C
  ds 1

; Photos 9-12 (bitfield)
wPhotos2:: ; DC0D
  ds 1

wDC0E::
  ds 1

; Tunic Type (GBC only)
; 0: green
; 1: red
; 2: blue
wTunicType:: ; DC0F
  ds 1

; Unlabeled
ds $DDD1 - $DC10

; DC10: palette data?
; DC30: palette data?

wPaletteDataFlags:: ; DDD1
  ; Palette flags for copying palettes to hardware
  ; byte 0:   if enabled, palette data is for BG (otherwise for objects)
  ; byte 2:   unknown
  ds 1

wPaletteToLoadForTileMap:: ; DDD2
  ; Indicates that the palette for the given tile map should
  ; be loaded on the next render loop
  ds 1

wPaletteUnknownC:: ; DDD3
  ds 1

wPaletteUnknownD:: ; DDD4
  ds 1

wPaletteUnknownE:: ; DDD5
  ds 1

; Unlabeled
ds $DDD9 - $DDD6

wColorDungonCorrectTombStones:: ; DDD9
  ; Number of tomb stones correctly pushed so far.
  ; Values:
  ; 0 - 4   number of correct tomb stones
  ; 80      color dungon has been opened
  ds 1

wColorDungeonItemFlags:: ; DDDA
  ; Dungeon flags for the color dungeon (map/compass/stone beak/nightmare key/small keys)
  ; See also: wDungeonItemFlags
  ds 5

; Unlabeled
wDDDF:: ; DDDF
  ds 1

; Color dungeon rooms status
;
; See wOverworldRoomStatus
wColorDungeonRoomStatus:: ; DDE0
  ds $20

; Unlabeled
ds 1 ; DE00

; Configuration struct for performing a farcall
; See the Farcall function
wFarcallParams::
wFarcallBank:: ; DE01
  ds 1

wFarcallAdressHigh:: ; DE02
  ds 1

wFarcallAdressLow:: ; DE03
  ds 1

wFarcallReturnBank:: ; DE04
  ds 1
