"""Gymnasium wrappers for diagnostics and trajectory capture."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any


class InfoStateRecorder:
    """Record action, reward, and semantic state to JSONL.

    This wrapper intentionally does not alter observations. The agent still sees
    pixels only; the recorder persists `info["state"]` for offline analysis.
    """

    def __init__(self, env, output_path: str | Path) -> None:
        self.env = env
        self.output_path = Path(output_path)
        self._file = self.output_path.open("a", encoding="utf-8")

    def reset(self, *args, **kwargs):
        observation, info = self.env.reset(*args, **kwargs)
        self._write({"type": "reset", "info": info})
        return observation, info

    def step(self, action: int):
        observation, reward, terminated, truncated, info = self.env.step(action)
        self._write(
            {
                "type": "step",
                "action": int(action),
                "reward": float(reward),
                "terminated": bool(terminated),
                "truncated": bool(truncated),
                "info": info,
            }
        )
        return observation, reward, terminated, truncated, info

    def render(self):
        return self.env.render()

    def close(self) -> None:
        try:
            self._file.close()
        finally:
            self.env.close()

    def __getattr__(self, name: str) -> Any:
        return getattr(self.env, name)

    def _write(self, event: dict[str, Any]) -> None:
        self._file.write(json.dumps(event, ensure_ascii=True, separators=(",", ":")) + "\n")
        self._file.flush()

