section "WRAM Bank0", wram0[$c000]

; *******************************************************************
; *                                                                 *
; *             >> LABEL GUIDELINE <<                               *
; *                                                                 *
; *         ; Description of the usage of this memory address.      *
; *         ; Possible values:                                      *
; *         ; 0 = meaning 0,                                        *
; *         ; 1 = meaning 1,                                        *
; *         ; 2 = meaning 2                                         *
; *         label::                                                 *
; *           ds 1 ; address as 4 hex value                         *
; *                                                                 *
; *******************************************************************


wram0Section EQU $C000

; Generic 40 tiles buffer for OAM data. Copied to OAM by DMA.
; During World gameplay, the OAM buffer is split between 12 OAM
; tiles for Link, and 28 OAM tiles for dynamic entities.
; Structure:
;  byte 0: Y position
;  byte 1: X position
;  byte 2: tile n°
;  byte 3: attribute
wOAMBuffer::

; During World gameplay, buffer for 12 Link OAM tiles
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wLinkOAMBuffer::
  ds 4 * 12 ; C000 - C02F

; During World gameplay, buffer for 28 dynamically allocated OAM elements
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wDynamicOAMBuffer::
  ds 4 * 28 ; C030 - C09F

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

; condition for room cleared
; 0 = false,
; any other value = true
wEnemyWasKilled:
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

; Starts by $20 and counts down to 0.
; 0 = False,
; 1-20 = True
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

; some kind of offset is saved here
wTransitionOffset:
  ds 1 ; C12A

; Unlabeled
wTransitionZeroNeverUsed:
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
  ds 3 ; C130 - C132

; Type of collistion
; Bit 0 = up,
; Bit 1 = down,
; Bit 2 = left,
; Bit 3 = right,
; Bit 4 = unknown
; See COLLISION_TYPE_* constants for possible values
wCollisionType::
  ds 1 ; C133

; Unlabeled
wC134:
  ds 1 ; C134

; Unlabeled
wC135:
  ds 1 ; C135

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
  ds 1 ; C138

; Unlabeled
wC139::
  ds 1 ; C139

; Unlabeled
wC13A::
  ds 1 ; C13A

; Unlabeled
wC13B::
  ds 1 ; C13B

; Unlabeled
wC13C::
  ds 1 ; C13C

; Seed for the Random Number Generator
wRandomSeed::
  ds 1 ; C13D

; Unlabeled
wC13E::
  ds 1 ; C13E

; Unlabeled
wC13F::
  ds 1 ; C13F

; Unlabeled
wC140::
  ds 1 ; C140

; Unlabeled
wC141::
  ds 1 ; C141

; Unlabeled
wC142::
  ds 1 ; C142

; Unlabeled
wC143::
  ds 1 ; C143

; TODO comment
wIsLinkPushing:: ; C144
  ds 1

; Unlabeled
wC145::
  ds 1 ; C145

; Is Link in the air (jumping with the feather, flying with roaster, etc)?
wIsLinkInTheAir::
  ds 1 ; C146

; Unlabeled
wC147::
  ds 2 ; C147 - C148

; Unlabeled
wC149::
  ds 1 ; C149

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
  ds 1 ; C150

; Unlabeled
wC151::
  ds 1 ; C151

; Unlabeled
wC152::
  ds 1 ; C152

; Unlabeled
wC153::
  ds 1 ; C153

; Unlabeled
wC154::
  ds 1 ; C154

; Background offset for shaking the screen horizontally
wScreenShakeHorizontal::
  ds 1 ; C155

; Background offset for shaking the screen vertically
wScreenShakeVertical::
  ds 1 ; C156

; Unlabeled
wC157::
  ds 1 ; C157

; Unlabeled
wC158::
  ds 1 ; C158

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
; maybe it is wHasBoomerangUnlocked
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
  ds 1 ; C17C

; Unlabeled
wC17D::
  ds 1 ; C17D

; Unlabeled
wC17E::
  ds 1 ; C17E

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
wC182::
  ds 1 ; C182

; Unlabeled
wC183::
  ds 5 ; C183 - C187

; Unlabeled
wC188::
  ds 1 ; C188

; Unlabeled
wC189::
  ds 1 ; C189

; Unlabeled
wC18A::
  ds 1 ; C18A

; Unlabeled
wC18B::
  ds 1 ; C18B

; Unlabeled
wC18C::
  ds 1 ; C18C

; Unlabeled
wC18D::
  ds 1 ; C18D

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
  ds 1 ; C190

; Unlabeled
wC191::
  ds 2 ; C191 - C192

; Unlabeled
wC193::
  ds 4 ; C193 - C196

; Unlabeled
wC197::
  ds 1 ; C197

; Unlabeled
wC198::
  ds 1 ; C198

; Unlabeled
wC199::
  ds 2 ; C199 - C19A

; Unlabeled
wC19B::
  ds 1 ; C19B

; Unlabeled
wC19C::
  ds 1 ; C19C

; Unlabeled
wC19D::
  ds 1 ; C19D

; Unlabeled
wC19E::
  ds 1 ; C19E

; Upper bit   = set if the dialog is displayed on bottom (instead of top)
; Lowest bits = the dialog state (see DIALOG_* constants for possible values)
wDialogState::
  ds 1 ; C19F

; Unlabeled
wC1A0::
  ds 2 ; C1A0 - C1A1

; Unlabeled
wC1A2::
  ds 2 ; C1A2 - w1A3

; Unlabeled
wC1A4::
  ds 1 ; C1A4

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
wC1AB::
  ds 1 ; C1AB

; Unlabeled
wC1AC::
  ds 1 ; C1AC

; Unlabeled
wC1AD::
  ds 1 ; C1AD

; Unlabeled
wC1AE::
  ds 2 ; C1AE - C1AF

; Unlabeled
wC1B0::
  ds 1 ; C1B0

; Unlabeled
wC1B1::
  ds 1 ; C1B1

; Unlabeled
wC1B2::
  ds 1 ; C1B2

; Unlabeled
wC1B3::
  ds 1 ; C1B3

; Unlabeled
wC1B4::
  ds 1 ; C1B4

; Unlabeled
wC1B5::
  ds 1 ; C1B5

; Unlabeled
wC1B6::
  ds 1 ; C1B6

; Unlabeled
wC1B7::
  ds 1 ; C1B7

; Unlabeled
wC1B8::
  ds 1 ; C1B8

; Unlabeled
wC1B9::
  ds 1 ; C1B9

; Unlabeled
wC1BA::
  ds 1 ; C1BA

; Unlabeled
wC1BB::
  ds 1 ; C1BB

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
  ds $10 ; C440 - C44F

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
; possible values: $00, $02, $09, $1B
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

section "WRAM Bank1", wramx[$D000], bank[1]

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
  ds $9E ; D117 - D1B4

; Unlabeled
wD1B5::
  ds $64 ; D1B5 - D218

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
  ds 4 ; D340 - D343

; Unlabeled
wD344::
  ds 1 ; D344

; Unlabeled
wD345::
  ds 1 ; D345

; Unlabeled
wD346::
  ds 9 ; D346 - D34E

; Unlabeled
wD34F::
  ds 1 ; D34F

; Current sound channel being processed. Number from 1-4.
wActiveChannelIndex::
  ds 1 ; D350

; Unlabeled
wD351::
  ds 4 ; D351 -D354

; Unlabeled
wD355::
  ds 11 ; D355 -D35F

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
  ds 23 ; D379 - D38F

; Unlabeled
wD390::
  ds 1 ; D390

; Unlabeled
wD391::
  ds 1 ; D391

; Unlabeled
wD392::
  ds 1 ; D392

; Unlabeled
wD393::
  ds 1 ; D393

; Unlabeled
wD394::
  ds 2 ; D394

; Unlabeled
wD396::
  ds 2 ; D396 - D397

; Unlabeled
wD398::
  ds 6 ; D398 - D39D

; Unlabeled
; Set to 1 by opcode 99, 0 by opcode 9A.
; Enabled "envelope" behaviour of channel 3?
wD39E::
  ds 1 ; D39E

; Unlabeled
wD39F::
  ds 1 ; D39F

; Unlabeled
wD3A0::
  ds 1 ; D3A0

; Unlabeled
wD3A1::
  ds 1 ; D3A1

; Unlabeled
wD3A2::
  ds 1 ; D3A2

; Unlabeled
wD3A3::
  ds 1 ; D3A3

; Unlabeled
wD3A4::
  ds 2 ; D3A4 - D3A5

; Unlabeled
wD3A6::
  ds 9 ; D3A6 - D3AE

; Unlabeled
wD3AF::
  ds 1 ; D3AF

; Unlabeled
wD3B0::
  ds 6 ; D3B0 - D3B5

; Unlabeled
; music channel-specific data
wD3B6::
  ds 6 ; D3A6 - D3BB

; Unlabeled
wD3BC::
  ds 1 ; D3BC

; Unlabeled
wD3BD::
  ds 1 ; D3BD

; Unlabeled
wD3BE::
  ds 1 ; D3BE

; Unlabeled
wD3BF::
  ds 1 ; D3BF

; Unlabeled
wD3C0::
  ds 1 ; D3C0

; Unlabeled
wD3C1::
  ds 1 ; D3C1

; Unlabeled
wD3C2::
  ds 1 ; D3C2

; Unlabeled
wD3C3::
  ds 1 ; D3C3

; Unlabeled
wD3C4::
  ds 1 ; D3C4

; Unlabeled
wD3C5::
  ds 1 ; D3C5

; Unlabeled
wD3C6::
  ds 1 ; D3C6

; Unlabeled
wD3C7::
  ds 1 ; D3C7

; Unlabeled
wD3C8::
  ds 1 ; D3C8

; Unlabeled
wD3C9::
  ds 1 ; D3C9

; Unlabeled
; Copied from wActiveMusicIndex (a music index)
wD3CA::
  ds 1 ; D3CA

; Copied from $D3CA
; The music track that was playing previously.
wPreviousMusicTrack::
  ds 1 ; D3CB

; not used
wD3CC::
  ds 1 ; D3CC

; Unlabeled
wD3CD::
  ds 1 ; D3CD

; TODO comment
wActiveMusicTable::
  ds 2 ; D3CE - D3CF

; Unlabeled
wD3D0::
  ds 6 ; D3D0 - D3D5

; Unlabeled
wD3D6::
  ds 1 ; D3D6

; Unlabeled
wD3D7::
  ds 2 ; D3D7

wActiveMusicTableIndex:: ; D3D9
  ; Set to 1 by opcode 94
  ds 1

; Unlabeled
wD3DA::
  ds 2 ; D3DA - D3DB

; Unlabeled
wD3DC::
  ds 1 ; D3DC

; Unlabeled
wD3DD::
  ds 1 ; D3DD

; Unlabeled
wD3DE::
  ds 1 ; D3DE

; Unlabeled
wD3DF::
  ds 1 ; D3DF

; Unlabeled
wD3E0::
  ds 1 ; D3E0

; Unlabeled
wD3E1::
  ds 1 ; D3E1

; Unlabeled
wD3E2::
  ds 4 ; D3E2 - D3E5

; Unlabeled
wD3E6::
  ds 1 ; D3E6

; Unlabeled
wD3E7::
  ds 1 ; D3E7

; Unlabeled
wD3E8::
  ds 1 ; D3E8

; Unlabeled
wD3E9::
  ds 24 ; D3E9 - D400

; Room warps
; Each room can have 4 warp points. The room warps destination are defined below,
; and the warp positions is defined at D416-D419.
wWarpStructs::

; Warp 0
wWarp0MapCategory::
  ds 1 ; D401
wWarp0Map::
  ds 1 ; D402
wWarp0Room::
  ds 1 ; D403
wWarp0DestinationX::
  ds 1 ; D404
wWarp0DestinationY::
  ds 1 ; D405

; Warp 1
wWarp1MapCategory::
  ds 1 ; D406
wWarp1Map::
  ds 1 ; D407
wWarp1Room::
  ds 1 ; D408
wWarp1DestinationX::
  ds 1 ; D409
wWarp1DestinationY::
  ds 1 ; D40A

; Warp 2
wWarp2MapCategory::
  ds 1 ; D40B
wWarp2Map::
  ds 1 ; D40C
wWarp2Room::
  ds 1 ; D40D
wWarp2DestinationX::
  ds 1 ; D40E
wWarp2DestinationY::
  ds 1 ; D40F

; Warp 3
wWarp3MapCategory::
  ds 1 ; D410
wWarp3Map::
  ds 1 ; D411
wWarp3Room::
  ds 1 ; D412
wWarp3DestinationX::
  ds 1 ; D413
wWarp3DestinationY::
  ds 1 ; D414

; Kill count, to tell if a Piece of Power should be dropped
wPieceOfPowerKillCount::
  ds 1 ; D415

; TODO comment
wWarpPositions::
; Position of warp 0, as a tile index on the map
wWarp0PositionTileIndex::
  ds 1 ; D416

; Position of warp 1, as a tile index on the map
wWarp1PositionTileIndex::
  ds 1 ; D417

; Position of warp 2, as a tile index on the map
wWarp2PositionTileIndex::
  ds 1 ; D418

; Position of warp 3, as a tile index on the map
wWarp3PositionTileIndex::
  ds 1 ; D419

; not used
wD41A::
  ds 68 ; D41A - D45D

; Unlabeled
wD45E::
  ds 1 ; D45E

; Unlabeled
wD45F::
  ds 1 ; D45F

; Unlabeled
wD460::
  ds 1 ; D460

; Unlabeled
wD461::
  ds 1 ; D461

; Each frame decrements the value.
; When reaching 0, play the compass sfx.
wCompassSfxCountdown::
  ds 1 ; D462

; Unlabeled
wD463::
  ds 1 ; D463

; Unlabeled
wD464::
  ds 1 ; D464

; Unlabeled
wD465::
  ds 1 ; D465

; Unlabeled
wD466::
  ds 1 ; D466

; not used
wD467::
  ds 1 ; D467

; Unlabeled
wD468::
  ds 1 ; D463

; not used
wD469::
  ds 2 ; D469 - D46A

; Unlabeled
wD46B::
  ds 1 ; D46B

; A boss was just defeated
wBossDefeated::
  ds 1 ; D46C

; not used
wD45D::
  ds 4 ; D45D - D470

; Increases on each kill. Reset to 0 when hit, or when it hits 12 a guardian acorn is spawned.
wGuardianAcornCounter::
  ds 1 ; D471

; Signpost maze: current goal
wMazeSignpostGoal::
  ds 1 ; D472

; Signpost maze: sign activated by Link
wMazeSignpostPos::
  ds 1 ; D473

; Unlabeled
wD474::
  ds 1 ; D474

; Unlabeled
wD475::
  ds 1 ; D475

; not used
wD476::
  ds 1 ; D476

; Unlabeled
wD477::
  ds 1 ; D477

; Unlabeled
wD478::
  ds 1 ; D478

; What index the B + SELECT warp tool is at (00~0B)
wDebugWarpIndex::
  ds 1 ; D479

; Power-ups are disabled after 3 hits are taken from ennemies
wPowerUpHits::
  ds 1 ; D47A

; If not zero, force the music track to change when displaying the file selections screen
wForceFileSelectionScreenMusic::
  ds 1 ; D47B

; 0 = No power-up
; 1 = Piece of Power
; 2 = Guardian Accorn
wActivePowerUp::
  ds 1 ; D47C

; Unlabeled
wD47D::
  ds 1 ; D47D

; TODO comment
wDidStealItem::
  ds 1 ; D47E

; Unlabeled
wD47F::
  ds 1 ; D47F

; TODO comment
wDungeonMinimap::
  ds $40 ; D480 - D4DF

; not used
wD4C0::
  ds $40 ; D4C0 - D4FF

; Unlabeled
wD500::
  ds $80 ; D500 - D57F

; Entities hitboxes.
; Each hitbox is a tuple of 4 bytes: x, y, width and height.
wEntitiesHitboxPositionTable::
  ds MAX_ENTITIES * 4 ; D580 - D5DF

; Unlabeled
wD5C0:
  ds 2 ; D5C0 - D5C1

; Unlabeled
wD5C2::
  ds 2 ; D5C2

; not used
wD5C4::
  ds 60 ; D5C4 - D600

; Data structures for copying data to vram during blanking times.
; 0 if background copy was executed
wRequests::               ; D600
  ds 1

; Request destination address (big endian)
wRequest:
; Request destination address (big endian)
wRequestDestination:
; Request destination address high byte
wRequestDestinationHigh::
  ds 1 ; D601

; Request destination address low byte
wRequestDestinationLow::
  ds 1 ; D602

; Request data length and mode.
; bits 0-6: data length,
; bits 7-8: copy mode (see BG_COPY_MODE_* constants)
wRequestLength::
  ds 1 ; D603

; Request data (variable length)
wRequestData:
  ds 246  ; D604 - D6F9

; Is there one or more switchable objects in the room
; See ROOM_SWITCHABLE_OBJECT_* constants
wRoomSwitchableObject::
  ds 1 ; D6FA

; Unlabeled
wD6FB::
  ds 1 ; D6FB

; TODO comment
wEnginePaused::
  ds 1 ; D6FC

; TODO comment
wLCDControl::
  ds 1 ; D6FD

; TODO comment
wTileMapToLoad::
  ds 1 ; D6FE

; TODO comment
wBGMapToLoad::
  ds 1 ; D6FF

; Memory region reserved for map objects of the active room.
; Actual objects are surrounded by FF values (see wRoomObjects)
;
; When loading a new room, room data is read and decoded into this
; area.
;
; NB: this area is also used in RAM bank 2, where it contains
; the object attributes.
;
; First section is FF values padding…
wRoomObjectsArea::
  ds $11 ; D700 - D710

; Start of the actual map objects for the active room (ignoring the surrounding FF values)
wRoomObjects::
  ds $EF ; D711 - D7FF

; World rooms status
; Each room is a byte combining ROOM_STATUS_* constants.
wOverworldRoomStatus::
  ds $100 ; D800 - D8FF

; TODO comment
wIndoorARoomStatus::
  ds $100 ; D900

; TODO comment
wIndoorBRoomStatus::
  ds $100 ; DA00

; TODO comment
wBButtonSlot::
  ds 1 ; DB00

; TODO comment
wAButtonSlot::
  ds 1 ; DB01

; TODO comment
wInventoryItem1::
  ds 1 ; DB02

; TODO comment
wInventoryItem2::
  ds 1 ; DB03

; TODO comment
wInventoryItem3::
  ds 1 ; DB04

; TODO comment
wInventoryItem4::
  ds 1 ; DB05

; TODO comment
wInventoryItem5::
  ds 1 ; DB06

; TODO comment
wInventoryItem6::
  ds 1 ; DB07

; TODO comment
wInventoryItem7::
  ds 1 ; DB08

; TODO comment
wInventoryItem8::
  ds 1 ; DB09

; TODO comment
wInventoryItem9::
  ds 1 ; DB0A

; TODO comment
wInventoryItem10::
  ds 1 ; DB0B

; TODO comment
wHasFlippers::
  ds 1 ; DB0C

; TODO comment
wHasMedicine::
  ds 1 ; DB0D

; Trade Sequence items.
; See TRADING_ITEM_* constants for possible values.
wTradeSequenceItem::
  ds 1 ; DB0E

; TODO comment
wSeashellsCount::
  ds 1 ; DB0F

; Unlabeled - Spacing byte used to check for dungeon map during InventoryDisplayLoop
wDB10::
  ds 1

; TODO comment
wHasTailKey::
  ds 1 ; DB11

; TODO comment
wHasAnglerKey::
  ds 1 ; DB12

; TODO comment
wHasFaceKey::
  ds 1 ; DB13

; TODO comment
wHasBirdKey::
  ds 1 ; DB14

; Golden Leaves count:
; 0-5 = number of Golden Leaves,
; 6 = Slime Key
wGoldenLeavesCount::
  ds 1 ; DB15

; Beginning of dungeon item flags.
; 5 bytes fo each dungeon.
; For each dungeon:
; byte 0 = has map?,
; byte 1 = has compass?
; byte 2 = has stone slab?,
; byte 3 = has boss key?,
; byte 4 = small keys count
wDungeonItemFlags::
  ds $2D ; DB16 - DB42

; TODO comment
wPowerBraceletLevel::
  ds 1 ; DB43

; TODO comment
wShieldLevel::
  ds 1 ; DB44

; TODO comment
wArrowCount::
  ds 1 ; DB45

; Set to 1 when you steal from the shop.
; Set back to zero when the shopkeeper kills you.
wHasStolenFromShop::
  ds 1 ; DB46

; Unlabeled
wDB47::
  ds 2 ; DB47 - DB48

; $0111 means that the player has every song.
;   bit 0: has Frog's Song of the Soul
;   bit 1: has Manbo's Mambo
;   bit 2: has Ballad of the Wind Fish
wOcarinaSongFlags::
  ds 1 ; DB49

; Which song is selected (zero based)
wSelectedSongIndex::
  ds 1 ; DB4A

; 0 means that the player does not have the Toadstool
; 1 means that the player has the Toadstool
wHasToadstool::
  ds 1 ; DB4B

; TODO comment
wMagicPowderCount::
  ds 1 ; DB4C

; TODO comment
wBombCount::
  ds 1 ; DB4D

; Set to 1 when Link retrieves his sword on the beach
wSwordLevel::
  ds 1 ; DB4E

; default value is 5
wName::
  ds NAME_LENGTH ; DB4F - DB53

; Unlabeled
; some kind of map index entry
wDB54::
  ds 1 ; DB54

; Indicates if we have spoken with richard.
; 1 = indicates spoken with grandpa ulrira in his own house, but does not seem to be used anywhere.
; 2 = means spoken with richard, changes the telephone message.
wRichardSpokenFlag::
  ds 1 ; DB55

; Bow-Wow status.
; Values:
;  00 = not following Link,
;  01 = Bow-Wow is following Link,
;  80 = Bow-Wow has been kidnapped
wIsBowWowFollowingLink::
  ds 1 ; DB56

; Death count (one per save slot)
wDeathCount::
  ds 3 ; DB57 DB59

; Number of hearts ($08 = 1 heart)
wHealth::
  ds 1 ; DB5A

; Maximum number of hearts
wMaxHealth::
  ds 1 ; DB5B

; TODO comment
wHeartPiecesCount::
  ds 1 ; DB5C

; Higher digits of the player rupees count
wRupeeCountHigh::
  ds 1 ; DB5D

; Lower digits of the player rupees count
wRupeeCountLow::
  ds 1 ; DB5E

; Define Link's spawn position
; Used when loading a save file or after a game over
wSpawnLocationData::
; TODO comment
wSpawnIsIndoor::
  ds 1 ; DB5F

; TODO comment
wSpawnMapId::
  ds 1 ; DB60

; TODO comment
wSpawnMapRoom::
  ds 1 ; DB61

; If 0, will load the pre-defined save file
wSpawnPositionX::
  ds 1 ; DB62

; If 0, will load the pre-defined save file
wSpawnPositionY::
  ds 1 ; DB63

; TODO comment
wSpawnIndoorRoom::
  ds 1 ; DB64

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument1::
  ds 1 ; DB65

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument2::
  ds 1 ; DB66

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument3::
  ds 1 ; DB67

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument4::
  ds 1 ; DB68

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument5::
  ds 1 ; DB69

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument6::
  ds 1 ; DB6A

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument7::
  ds 1 ; DB6B

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument8::
  ds 1 ; DB6C

; Unlabeled
wDB6D:
  ds 1 ; D86D

; TODO comment
wIsThief::
  ds 1 ; DB6E

; TODO comment
wWreckingBallRoom:
  ds 1 ; DB6F

; TODO comment
wWreckingBallPosX:
  ds 1 ; DB70

; TODO comment
wWreckingBallPosY:
  ds 1 ; DB71

; TODO comment
wNumberOfDungeon7PillarsDestroyed:
  ds 1 ; DB72

; TODO comment
wIsMarinFollowingLink::
  ds 1 ; DB73

; Unlabeled, Marin-related
wDB74::
  ds 1

; Total number of medecine ever purchased from Crazy Tracy
wPurchasedMedecineCount::
  ds 1 ; DB75

; TODO comment
wMaxMagicPowder::
  ds 1 ; DB76

; Maximum number of bombs that Link can carry
wMaxBombs::
  ds 1 ; DB77

; TODO comment
wMaxArrows::
  ds 1 ; DB78

; TODO comment
wIsGhostFollowingLink::
  ds 1 ; DB79

; Zero: The ghost wants to go to House by the Bay
; Non-zero: ... to his grave in Kohilint Prairie
wGhostSeeksGrave::
  ds 1 ; DB7A

; TODO comment
wIsRoosterFollowingLink::
  ds 1 ; DB7B

; Offset in the WindFishEggMazeSequence table, set to a random value chosen from $00 $08 $10 $18
wWindFishEggMazeSequenceOffset:
  ds 1 ; D87C

; Stores the inventory item that you traded for the boomerang.
; Initially this value is zero, indicating no trade. But after you traded the boomerang
; back it will be INVENTORY_BOOMERANG
wBoomerangTradedItem::
  ds 1 ; DB7D

; Switches between 4 different hits for one of the kids throwing the ball
wKidSaveHintIndex::
  ds 1 ; DB7E

; Unlabeled
wDB7F::
  ds 1 ; DB7F

; Unlabeled, outside the area that is stored in the savegame.
wDB80::
  ds 5 ; DB80 - DB84

; Unlabeled
wDB85::
  ds 5 ; DB85 - DB89

; Unlabeled
wDB8A::
  ds 5 ; DB8A - DB8E

; Higher digits of the amount of rupees to be added to your wallet (high digits)
wAddRupeeBufferHigh::
  ds 1 ; DB8F

; Amount of rupees to be added to your wallet (low digits)
wAddRupeeBufferLow::
  ds 1 ; DB90

; Amount of rupees to be removed from your wallet (high digits)
wSubstractRupeeBufferHigh::
  ds 1 ; DB91

; Amount of rupees to be removed from your wallet (low digits)
wSubstractRupeeBufferLow::
  ds 1 ; DB92

; Amount of health to be added to your health total (wHealth)
wAddHealthBuffer::
  ds 1 ; DB93

; Amount of health to be removed from your health total (wHealth)
wSubtractHealthBuffer::
  ds 1 ; DB94

; See GAMEPLAY_* constants for possible values
wGameplayType::
  ds 1 ; DB95

; Value depens on GameplayType: this can be a sequence index, or a frame counter.
wGameplaySubtype::
  ds 1 ; DB96

; TODO comment
wBGPalette::
  ds 1 ; DB97

; TODO comment
wOBJ0Palette::
  ds 1 ; DB98

; TODO comment
wOBJ1Palette::
  ds 1 ; DB99

; TODO comment
wWindowY::
  ds 1 ; DB9A

; not used
wDB9A::
  ds 1

; Initial room of Link when loading a new map
wMapEntranceRoom::
  ds 1 ; DB9C

; Initial position of Link when loading a new map
wMapEntrancePositionX::
  ds 1 ; DB9D

; Initial position of Link when loading a new map
wMapEntrancePositionY::
  ds 1 ; DB9E

; not used
wDB9F::
  ds 4 ; DB9F - DBA2

; Unlabeled
wDBA3::
  ds 1 ; DBA3

; not used
wDBA4::
  ds 1 ; DBA4

; 0 = the overworld
; 1 = interior maps (house, dungeons, etc)
wIsIndoor::
  ds 1 ; DBA5

; TODO comment
wSaveSlot::
  ds 1 ; DBA6

; TODO comment
wSaveFilesCount::
  ds 1 ; DBA7

; Unlabeled
wDBA8::
  ds 1 ; DBA8

; Unlabeled
wDBA9::
  ds 1 ; DBA9

; Unlabeled
wDBAA::
  ds 2 ; DBAA - DBAB

; Unlabeled
wDBAC::
  ds 2 ; DBAC - DBAD

; TODO comment
wIndoorRoom::
  ds 1 ; DBAE

; TODO comment
wCurrentBank::
  ds 1 ; DBAF

; Layout of the dungeon map in the inventory.
; See INVENTORY_MINIMAP_* constants for values
wMinimapLayout::
  ds 1 ; DBB0

; The position at which Link entered on a map.
; (used for reseting Link's position after a fall)
wLinkMapEntryPositionX::
  ds 1 ; DBB1

; The position at which Link entered on a map.
; (used for reseting Link's position after a fall)
wLinkMapEntryPositionY::
  ds 1 ; DBB2

; not used
wDBB3::
  ds 1 ; DBB3

; Unlabeled
wDBB4::
  ds 1 ; DBB4

; TODO comment
wKillCount2::
  ds 1 ; DBB5

; Unlabeled
wDBB6::
  ds $11 ; DBB6 - DBC6

; TODO comment
wInvincibilityCounter::
  ds 1 ; DBC7

; Unlabeled
wDBC8::
  ds 1

; TODO comment
wTorchesCount::
  ds 1 ; DBC9

; not used
wDBCA::
  ds 1 ; DBCA

; Unlabeled
wDBCB::
  ds 1 ; DBCB

; A table of five items flags for the current dungeon
; See also: wDungeonItemFlags
wCurrentDungeonItemFlags::
; TODO comment
wHasDungeonMap::
  ds 1 ; DBCC

; TODO comment
wHasDungeonCompass::
  ds 1 ; DBCD

; TODO comment
wHasDungeonStoneSlab::
  ds 1 ; DBCE

; TODO comment
wHasDungeonBossKey::
  ds 1 ; DBCF

; TODO comment
wSmallKeysCount::
  ds 1 ; DBD0

; Unlabeled
wDBD1::
  ds $2F ; DBD1 - DBFF

; TODO comment
wFile1DeathCountHigh::
  ds 1 ; DC00

; TODO comment
wFile1DeathCountLow::
  ds 1 ; DC01

; TODO comment
wFile2DeathCountHigh::
  ds 1 ; DC02

; TODO comment
wFile2DeathCountLow::
  ds 1 ; DC03

; TODO comment
wFile3DeathCountHigh::
  ds 1 ; DC04

; TODO comment
wFile3DeathCountLow::
  ds 1 ; DC05

; Unlabeled
wDC06::
  ds 1 ; DC06

; Unlabeled
wDC07::
  ds 1 ; DC07

; Unlabeled
wDC08::
  ds 1 ; DC08

; Unlabeled
wDC09::
  ds 1 ; DC09

; Unlabeled
wDC0A::
  ds 1 ; DC0A

; Unlabeled
wDC0B::
  ds 1 ; DC0B

; Photos 1-8 (bitfield)
wPhotos1::
  ds 1 ; DC0C

; Photos 9-12 (bitfield)
wPhotos2::
  ds 1 ; DC0D

; Unlabeled
wDC0E::
  ds 1 ; DC0E

; Tunic Type (GBC only):
; 0 = green,
; 1 = red,
; 2 = blue
wTunicType::
  ds 1 ; DC0F

; The buffer containing the 8 background palettes follow. 8 bytes per palette.
wBGPal1::
  ds 8 ; DC10 - DC17
wBGPal2::
  ds 8 ; DC18 - DC1F
wBGPal3::
  ds 8 ; DC20 - DC27
wBGPal4::
  ds 8 ; DC28 - DC2F
wBGPal5::
  ds 8 ; DC30 - DC37
wBGPal6::
  ds 8 ; DC38 - DC3F
wBGPal7::
  ds 8 ; DC40 - DC47
wBGPal8::
  ds 8 ; DC48 - DC4F

; The buffer containing the 8 object palettes follow. 8 bytes per palette.
wObjPal1::
  ds 8 ; DC50 - DC57
wObjPal2::
  ds 8 ; DC58 - DC5F
wObjPal3::
  ds 8 ; DC60 - DC67
wObjPal4::
  ds 8 ; DC68 - DC6F
wObjPal5::
  ds 8 ; DC70 - DC77
wObjPal6::
  ds 8 ; DC78 - DC7F
wObjPal7::
  ds 8 ; DC80 - DC87
wObjPal8::
  ds 8 ; DC88 - DC8F

; Unlabeled
wDC90::
  ds 1 ; DC90

; Unlabeled
wDC91::
  ds $2F ; DC91 - DCBF

; Unlabeled
wDCC0::
  ds 15 ; DCC0 - DCCE

; Unlabeled
wDCCF::
  ds 1 ; DCCF

; Unlabeled
wDCD0::
  ds $10 ; DCD0 -DCDF

; Unlabeled
wDCE0::
  ds $10 ; DCE0 -DCEF

; Unlabeled
wDCF0::
  ds $E1 ; DCF0 -DDD0

; Palette flags for copying palettes to hardware.
; bit 0: If set, copy background palette to hardware during vblank
; bit 1: If set, copy object palette to hardware during vblank
; bit 7: If set, do a partial copy specified by wPalettePartialCopyColorIndexStart and wPalettePartialCopyColorCount
wPaletteDataFlags::
  ds 1 ; DDD1

; Indicates that the palette for the given tile map should
; be loaded on the next render loop
wPaletteToLoadForTileMap::
  ds 1 ; DDD2

; Palete color index to start copying palette data from if bit 7 is set in wPaletteDataFlags
wPalettePartialCopyColorIndexStart::
  ds 1 ; DDD3

; Amount of colors to copy if bit 7 is set in wPaletteDataFlags
wPalettePartialCopyColorCount::
  ds 1 ; DDD4

; TODO comment
wPaletteUnknownE::
  ds 1 ; DDD5

; Unlabeled
wDDD6::
  ds 1 ; DDD6

; Unlabeled
wDDD7::
  ds 1 ; DDD7

; Unlabeled
wDDD8::
  ds 1 ; DDD8

; Number of tomb stones correctly pushed so far.
; Values:
; 00-04 = number of correct tomb stones.
; 80 = color dungon has been opened
wColorDungonCorrectTombStones::
  ds 1 ; DDD9

; Dungeon flags for the color dungeon (map/compass/stone beak/nightmare key/small keys)
; See also: wDungeonItemFlags
wColorDungeonItemFlags::
  ds 5 ; DDDA

; Unlabeled
wDDDF:: ; DDDF
  ds 1

; Color dungeon rooms status
; See wOverworldRoomStatus
wColorDungeonRoomStatus::
  ds $20 ; DDE0

; Unlabeled
wDE00::
  ds 1 ; DE00

; Configuration struct for performing a farcall
; See the Farcall function
wFarcallParams::
; TODO comment
wFarcallBank::
  ds 1 ; DE01

; TODO comment
wFarcallAdressHigh::
  ds 1 ; DE02

; TODO comment
wFarcallAdressLow::
  ds 1 ; DE03

; TODO comment
wFarcallReturnBank::
  ds 1 ; DE04

; maximal depth the stack can grow
wStackMax equ $DE05
; top of WRAM is used as Stack
wStack::
  ds $DFFF - $DE05 +1 ; DE05 - DFFF

; init puts the SP here
wStackTop equ $DFFF
