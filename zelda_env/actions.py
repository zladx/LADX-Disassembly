"""Logical action definitions shared across supported Zelda games."""

from __future__ import annotations

from dataclasses import dataclass


ButtonSet = frozenset[str]


@dataclass(frozen=True)
class ActionSpec:
    """A stable logical action mapped to one or more platform buttons."""

    name: str
    buttons: ButtonSet


DEFAULT_ACTIONS: tuple[ActionSpec, ...] = (
    ActionSpec("NOOP", frozenset()),
    ActionSpec("UP", frozenset({"UP"})),
    ActionSpec("DOWN", frozenset({"DOWN"})),
    ActionSpec("LEFT", frozenset({"LEFT"})),
    ActionSpec("RIGHT", frozenset({"RIGHT"})),
    ActionSpec("A", frozenset({"A"})),
    ActionSpec("B", frozenset({"B"})),
    ActionSpec("START", frozenset({"START"})),
    ActionSpec("SELECT", frozenset({"SELECT"})),
    ActionSpec("UP_A", frozenset({"UP", "A"})),
    ActionSpec("DOWN_A", frozenset({"DOWN", "A"})),
    ActionSpec("LEFT_A", frozenset({"LEFT", "A"})),
    ActionSpec("RIGHT_A", frozenset({"RIGHT", "A"})),
    ActionSpec("UP_B", frozenset({"UP", "B"})),
    ActionSpec("DOWN_B", frozenset({"DOWN", "B"})),
    ActionSpec("LEFT_B", frozenset({"LEFT", "B"})),
    ActionSpec("RIGHT_B", frozenset({"RIGHT", "B"})),
)


def buttons_for_action(action: int, actions: tuple[ActionSpec, ...] = DEFAULT_ACTIONS) -> ButtonSet:
    """Return the logical buttons for a discrete action index."""

    if action < 0 or action >= len(actions):
        raise ValueError(f"Action index out of range: {action}")
    return actions[action].buttons

