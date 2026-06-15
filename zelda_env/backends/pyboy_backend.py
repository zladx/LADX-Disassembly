"""PyBoy backend for LADX and other Game Boy / Game Boy Color games."""

from __future__ import annotations

from io import BytesIO
from pathlib import Path
from typing import Iterable


class PyBoyBackend:
    """Thin adapter around PyBoy using the shared emulator backend contract."""

    platform = "gbc"
    buttons = ("UP", "DOWN", "LEFT", "RIGHT", "A", "B", "START", "SELECT")

    _BUTTON_MAP = {
        "UP": "up",
        "DOWN": "down",
        "LEFT": "left",
        "RIGHT": "right",
        "A": "a",
        "B": "b",
        "START": "start",
        "SELECT": "select",
    }

    def __init__(
        self,
        rom_path: str | Path,
        *,
        sym_path: str | Path | None = None,
        window: str = "null",
        cgb: bool = True,
    ) -> None:
        try:
            from pyboy import PyBoy
        except ImportError as exc:
            raise RuntimeError("PyBoy is required for PyBoyBackend. Install with `pip install pyboy`.") from exc

        kwargs = {"window": window}
        if sym_path is not None:
            kwargs["symbols"] = str(sym_path)
        if cgb is not None:
            kwargs["cgb"] = cgb
        self.pyboy = PyBoy(str(rom_path), **kwargs)
        self._pressed: set[str] = set()

    def reset(self) -> None:
        self.release_all()

    def close(self) -> None:
        self.pyboy.stop()

    def press(self, buttons: set[str] | frozenset[str]) -> None:
        self.release_all()
        for button in buttons:
            mapped = self._map_button(button)
            self.pyboy.button_press(mapped)
            self._pressed.add(button)

    def release_all(self) -> None:
        for button in tuple(self._pressed):
            self.pyboy.button_release(self._map_button(button))
        self._pressed.clear()

    def advance(self, frames: int) -> None:
        for _ in range(frames):
            self.pyboy.tick()

    def read_u8(self, address: int) -> int:
        return int(self.pyboy.memory[address]) & 0xFF

    def read_u16(self, address: int, *, endian: str = "little") -> int:
        data = self.read_bytes(address, 2)
        return int.from_bytes(data, endian)

    def read_bytes(self, address: int, length: int) -> bytes:
        return bytes(self.read_u8(address + offset) for offset in range(length))

    def save_state(self) -> bytes:
        buffer = BytesIO()
        self.pyboy.save_state(buffer)
        return buffer.getvalue()

    def load_state(self, data: bytes) -> None:
        self.pyboy.load_state(BytesIO(data))

    def screen_rgb(self):
        screen = self.pyboy.screen.ndarray
        try:
            import numpy as np
        except ImportError as exc:
            raise RuntimeError("numpy is required for screen capture.") from exc
        array = np.asarray(screen)
        if array.shape[-1] == 4:
            return array[:, :, :3].copy()
        return array.copy()

    def _map_button(self, button: str) -> str:
        try:
            return self._BUTTON_MAP[button]
        except KeyError as exc:
            raise ValueError(f"Unsupported Game Boy button: {button}") from exc

