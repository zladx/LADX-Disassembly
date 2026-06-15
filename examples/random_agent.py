"""Run a random pixel-only agent in Zelda-LADX-v0."""

from __future__ import annotations

import argparse

from zelda_env.env import ZeldaEnv
from zelda_env.rewards import default_progress_reward


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("rom_path")
    parser.add_argument("--sym-path")
    parser.add_argument("--initial-state-path")
    parser.add_argument("--steps", type=int, default=1000)
    args = parser.parse_args()

    env = ZeldaEnv(
        game="ladx",
        backend="pyboy",
        rom_path=args.rom_path,
        sym_path=args.sym_path,
        initial_state_path=args.initial_state_path,
        reward_fn=default_progress_reward,
    )
    try:
        observation, info = env.reset()
        for _ in range(args.steps):
            action = env.action_space.sample()
            observation, reward, terminated, truncated, info = env.step(action)
            if terminated or truncated:
                observation, info = env.reset()
    finally:
        env.close()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

