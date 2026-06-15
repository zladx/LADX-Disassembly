"""Utilities for generating reusable emulator save states."""

from __future__ import annotations

import argparse
from pathlib import Path

from zelda_env.actions import buttons_for_action
from zelda_env.backends.pyboy_backend import PyBoyBackend


def generate_ladx_state(
    *,
    rom_path: str | Path,
    output_path: str | Path,
    sym_path: str | Path | None = None,
    boot_frames: int = 0,
) -> None:
    """Generate a reusable LADX save state after advancing a fixed number of frames.

    This is intentionally conservative. More opinionated setup flows can later add
    deterministic menu inputs or memory initialization for specific curricula.
    """

    backend = PyBoyBackend(rom_path, sym_path=sym_path)
    try:
        backend.advance(boot_frames)
        Path(output_path).write_bytes(backend.save_state())
    finally:
        backend.close()


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Generate a reusable LADX initial save state.")
    parser.add_argument("rom_path")
    parser.add_argument("output_path")
    parser.add_argument("--sym-path")
    parser.add_argument("--boot-frames", type=int, default=0)
    args = parser.parse_args(argv)
    generate_ladx_state(
        rom_path=args.rom_path,
        output_path=args.output_path,
        sym_path=args.sym_path,
        boot_frames=args.boot_frames,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

