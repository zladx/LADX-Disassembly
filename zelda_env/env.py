"""Gymnasium environment wrapper for supported 2D Zelda games."""

from __future__ import annotations

from pathlib import Path
from typing import Callable, Any

try:
    import gymnasium as gym
except ImportError:  # pragma: no cover - exercised only in dependency-light installs
    gym = None

from zelda_env.actions import DEFAULT_ACTIONS, ActionSpec, buttons_for_action
from zelda_env.backends.pyboy_backend import PyBoyBackend
from zelda_env.games.ladx.state_extractor import LadxStateExtractor
from zelda_env.games.ladx.symbols import default_ladx_symbol_table
from zelda_env.rewards import default_progress_reward


RewardFn = Callable[[dict[str, Any] | None, dict[str, Any], int], tuple[float, dict[str, Any]]]


class ZeldaEnv(gym.Env if gym is not None else object):
    """Gymnasium-compatible environment.

    The agent observation is pixels only. Semantic game state is exposed through
    ``info["state"]`` for rewards, diagnostics, and curriculum logic.
    """

    metadata = {"render_modes": ["rgb_array", "human"], "render_fps": 60}

    def __init__(
        self,
        *,
        game: str = "ladx",
        backend: str = "pyboy",
        rom_path: str | Path,
        sym_path: str | Path | None = None,
        initial_state_path: str | Path | None = None,
        render_mode: str | None = None,
        frame_skip: int = 4,
        max_episode_steps: int | None = None,
        reward_fn: RewardFn | None = None,
        actions: tuple[ActionSpec, ...] = DEFAULT_ACTIONS,
        repo_root: str | Path | None = None,
    ) -> None:
        try:
            import numpy as np
            from gymnasium import spaces
        except ImportError as exc:
            raise RuntimeError("ZeldaEnv requires gymnasium and numpy. Install project dependencies first.") from exc

        self._np = np
        self.game = game
        self.render_mode = render_mode
        self.frame_skip = frame_skip
        self.max_episode_steps = max_episode_steps
        self.reward_fn = reward_fn or default_progress_reward
        self.actions = actions
        self.action_space = spaces.Discrete(len(actions))
        self.observation_space = spaces.Box(0, 255, shape=(144, 160, 3), dtype=np.uint8)
        self.elapsed_steps = 0
        self._previous_info: dict[str, Any] | None = None
        self._initial_state_data = Path(initial_state_path).read_bytes() if initial_state_path else None

        if game != "ladx":
            raise ValueError(f"Unsupported game: {game}")
        if backend != "pyboy":
            raise ValueError(f"Unsupported backend for LADX: {backend}")

        self.backend = PyBoyBackend(rom_path, sym_path=sym_path)
        symbols = default_ladx_symbol_table(repo_root or Path.cwd()) if sym_path is None else default_ladx_symbol_table(Path(sym_path).parent)
        if sym_path is not None:
            from zelda_env.games.ladx.symbols import SymbolTable

            symbols = SymbolTable.from_sym_file(sym_path)
        self.extractor = LadxStateExtractor(symbols)

    def reset(self, *, seed: int | None = None, options: dict[str, Any] | None = None):
        if hasattr(super(), "reset"):
            try:
                super().reset(seed=seed)
            except TypeError:
                pass
        self.elapsed_steps = 0
        self.backend.reset()
        state_data = None
        if options and "state" in options:
            state_data = options["state"]
        elif self._initial_state_data is not None:
            state_data = self._initial_state_data
        if state_data is not None:
            self.backend.load_state(state_data)
        observation = self.backend.screen_rgb()
        info = self._info(action=None, reward_terms={})
        self._previous_info = info
        return observation, info

    def step(self, action: int):
        self.elapsed_steps += 1
        buttons = buttons_for_action(int(action), self.actions)
        self.backend.press(buttons)
        self.backend.advance(self.frame_skip)
        self.backend.release_all()
        observation = self.backend.screen_rgb()
        info = self._info(action=int(action), reward_terms={})
        reward, reward_terms = self.reward_fn(self._previous_info, info, int(action))
        info["reward_terms"] = reward_terms
        terminated = _is_dead(info)
        truncated = self.max_episode_steps is not None and self.elapsed_steps >= self.max_episode_steps
        self._previous_info = info
        return observation, float(reward), bool(terminated), bool(truncated), info

    def render(self):
        return self.backend.screen_rgb()

    def close(self) -> None:
        self.backend.close()

    def _info(self, *, action: int | None, reward_terms: dict[str, Any]) -> dict[str, Any]:
        return {
            "state": self.extractor.extract(self.backend),
            "reward_terms": reward_terms,
            "events": {"action": action, "elapsed_steps": self.elapsed_steps},
        }


def _is_dead(info: dict[str, Any]) -> bool:
    health = info.get("state", {}).get("player", {}).get("health", {}).get("current")
    return health == 0
