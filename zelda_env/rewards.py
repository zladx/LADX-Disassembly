"""Reward helpers built on the generic semantic state schema."""

from __future__ import annotations

from typing import Any


def default_progress_reward(
    prev_info: dict[str, Any] | None,
    info: dict[str, Any],
    action: int,
    *,
    step_penalty: float = -0.001,
    new_room_reward: float = 0.05,
    damage_penalty_per_health_unit: float = -0.02,
    death_penalty: float = -1.0,
) -> tuple[float, dict[str, Any]]:
    """Small baseline reward using only generic `info["state"]` fields."""

    reward = step_penalty
    terms: dict[str, float] = {"step": step_penalty}
    state = info.get("state", {})
    player = state.get("player", {})
    world = state.get("world", {})
    health = player.get("health", {}).get("current")

    if prev_info is not None:
        prev_state = prev_info.get("state", {})
        prev_world = prev_state.get("world", {})
        prev_player = prev_state.get("player", {})
        if _location_key(world) != _location_key(prev_world):
            reward += new_room_reward
            terms["new_room"] = new_room_reward
        prev_health = prev_player.get("health", {}).get("current")
        if isinstance(prev_health, int) and isinstance(health, int) and health < prev_health:
            delta = prev_health - health
            penalty = delta * damage_penalty_per_health_unit
            reward += penalty
            terms["damage"] = penalty

    if health == 0:
        reward += death_penalty
        terms["death"] = death_penalty

    return reward, terms


def _location_key(world: dict[str, Any]) -> tuple[Any, Any, Any]:
    return world.get("is_indoor"), world.get("map_id"), world.get("room")

