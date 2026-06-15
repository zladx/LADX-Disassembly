"""LADX memory map entries used by the generic state extractor."""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Field:
    path: str
    symbol: str
    size: int = 1
    signed: bool = False


META_FIELDS = (
    Field("frame", "hFrameCounter"),
)

WORLD_FIELDS = (
    Field("is_indoor", "wIsIndoor"),
    Field("map_id", "hMapId"),
    Field("room", "hMapRoom"),
    Field("indoor_room", "wIndoorRoom"),
    Field("room_status", "hRoomStatus"),
    Field("is_side_scrolling", "hIsSideScrolling"),
    Field("scroll_x", "hBaseScrollX"),
    Field("scroll_y", "hBaseScrollY"),
)

PLAYER_FIELDS = (
    Field("x", "hLinkPositionX"),
    Field("y", "hLinkPositionY"),
    Field("final_x", "hLinkFinalPositionX"),
    Field("final_y", "hLinkFinalPositionY"),
    Field("z", "hLinkPositionZ"),
    Field("speed_x", "hLinkSpeedX", signed=True),
    Field("speed_y", "hLinkSpeedY", signed=True),
    Field("velocity_z", "hLinkVelocityZ", signed=True),
    Field("direction", "hLinkDirection"),
    Field("motion_state", "wLinkMotionState"),
    Field("animation_state", "hLinkAnimationState"),
    Field("ground_status", "wLinkGroundStatus"),
    Field("physics_modifier", "hLinkPhysicsModifier"),
    Field("interactive_motion_blocked", "hLinkInteractiveMotionBlocked"),
    Field("room_position", "hLinkRoomPosition"),
    Field("final_room_position", "hLinkFinalRoomPosition"),
    Field("health.current", "wHealth"),
    Field("health.max", "wMaxHearts"),
    Field("resources.magic_powder", "wMagicPowderCount"),
)

INVENTORY_FIELDS = (
    Field("has_flippers", "wHasFlippers"),
    Field("has_medicine", "wHasMedicine"),
    Field("trade_sequence_item", "wTradeSequenceItem"),
    Field("seashells", "wSeashellsCount"),
    Field("power_bracelet_level", "wPowerBraceletLevel"),
    Field("shield_level", "wShieldLevel"),
    Field("sword_level", "wSwordLevel"),
    Field("arrows", "wArrowCount"),
    Field("bombs", "wBombCount"),
    Field("magic_powder", "wMagicPowderCount"),
    Field("max_magic_powder", "wMaxMagicPowder"),
    Field("max_bombs", "wMaxBombs"),
    Field("max_arrows", "wMaxArrows"),
    Field("ocarina_song_flags", "wOcarinaSongFlags"),
    Field("selected_song_index", "wSelectedSongIndex"),
    Field("boomerang_traded_item", "wBoomerangTradedItem"),
)

PROGRESS_FIELDS = (
    Field("health", "wHealth"),
    Field("max_hearts", "wMaxHearts"),
    Field("heart_pieces", "wHeartPiecesCount"),
    Field("death_count", "wDeathCount", size=3),
    Field("dungeon_item_flags", "wDungeonItemFlags", size=0x2D),
    Field("current_dungeon_items", "wCurrentDungeonItemFlags", size=5),
    Field("small_keys", "wSmallKeysCount"),
)

EFFECT_FIELDS = (
    Field("invincibility_counter", "wInvincibilityCounter"),
    Field("is_gel_clinging", "wIsGelClingingToLink"),
    Field("slow_walking_speed", "hLinkSlowWalkingSpeed"),
    Field("is_using_spin_attack", "wIsUsingSpinAttack"),
    Field("sword_charge", "wSwordCharge"),
    Field("is_using_shield", "wIsUsingShield"),
    Field("screen_shake_countdown", "wScreenShakeCountdown"),
)

ENTITY_TABLES = {
    "x": "wEntitiesPosXTable",
    "y": "wEntitiesPosYTable",
    "z": "wEntitiesPosZTable",
    "speed_x": "wEntitiesSpeedXTable",
    "speed_y": "wEntitiesSpeedYTable",
    "speed_z": "wEntitiesSpeedZTable",
    "status": "wEntitiesStatusTable",
    "state": "wEntitiesStateTable",
    "type": "wEntitiesTypeTable",
    "health": "wEntitiesHealthTable",
    "direction": "wEntitiesDirectionTable",
    "room": "wEntitiesRoomTable",
    "physics_flags": "wEntitiesPhysicsFlagsTable",
    "hitbox_flags": "wEntitiesHitboxFlagsTable",
    "sprite_variant": "wEntitiesSpriteVariantTable",
    "ground_status": "wEntitiesGroundStatusTable",
    "private.state1": "wEntitiesPrivateState1Table",
    "private.state2": "wEntitiesPrivateState2Table",
    "private.state3": "wEntitiesPrivateState3Table",
    "private.state4": "wEntitiesPrivateState4Table",
    "private.state5": "wEntitiesPrivateState5Table",
    "private.countdown1": "wEntitiesPrivateCountdown1Table",
    "private.countdown2": "wEntitiesPrivateCountdown2Table",
    "private.countdown3": "wEntitiesPrivateCountdown3Table",
    "private.transition_countdown": "wEntitiesTransitionCountdownTable",
    "private.slow_transition_countdown": "wEntitiesSlowTransitionCountdownTable",
}

