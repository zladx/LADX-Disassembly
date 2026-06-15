from zelda_env.actions import buttons_for_action
from zelda_env.rewards import default_progress_reward


def test_buttons_for_action_uses_logical_buttons():
    assert buttons_for_action(0) == frozenset()
    assert buttons_for_action(9) == frozenset({"UP", "A"})


def test_default_progress_reward_uses_generic_state_paths():
    prev = {"state": {"world": {"is_indoor": 0, "map_id": 0, "room": 1}, "player": {"health": {"current": 16}}}}
    info = {"state": {"world": {"is_indoor": 0, "map_id": 0, "room": 2}, "player": {"health": {"current": 8}}}}

    reward, terms = default_progress_reward(prev, info, 0)

    assert terms["new_room"] > 0
    assert terms["damage"] < 0
    assert reward < terms["new_room"]

