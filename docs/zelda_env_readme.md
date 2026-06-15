# Running `zelda_env`

This repository now includes a first-pass Gymnasium-compatible 2D Zelda environment package. The first supported game is Link's Awakening DX (`Zelda-LADX-v0`) using PyBoy.

## Setup

Use the project virtualenv, then install the locked dependency set:

```bash
python3 -m pip install -r requirements-dev.txt
```

To refresh dependency locks after editing `pyproject.toml` or the `.in` files:

```bash
pip-compile requirements.in -o requirements.txt
pip-compile requirements-dev.in -o requirements-dev.txt
```

## Build The ROM

Build the default English v1.0 ROM and symbol file:

```bash
make build
make test
```

Expected outputs:

- `azle.gbc`
- `azle.sym`

## Pixel-Only RL Environment

The agent observation is pixels only. Semantic game state is exposed through `info["state"]` for reward functions, diagnostics, and curriculum logic.

```python
from zelda_env.env import ZeldaEnv

env = ZeldaEnv(
    game="ladx",
    backend="pyboy",
    rom_path="azle.gbc",
    sym_path="azle.sym",
    initial_state_path="azle.gbc.start.state",
)

obs, info = env.reset()
obs, reward, terminated, truncated, info = env.step(0)
env.close()
```

Run the random-agent example:

```bash
python3 examples/random_agent.py azle.gbc --sym-path azle.sym --initial-state-path azle.gbc.start.state
```

## Manual Debug Viewer

To play manually in PyBoy while watching semantic debug windows:

```bash
python3 examples/manual_debug_viewer.py --rom-path azle.gbc --sym-path azle.sym --initial-state-path azle.gbc.start.state
```

The viewer opens:

- the main PyBoy game window for manual control
- a tile/object mapping window for the current room
- a semantic state text window

Closing the PyBoy window or either debug window closes all windows.

## Save State Generation

You can generate a simple reusable save state after booting for a fixed number of frames:

```bash
python3 -m zelda_env.setup_state azle.gbc azle.gbc.start.state --sym-path azle.sym --boot-frames 300
```

For reliable training, prefer a manually verified save state after title/menu setup or a scripted setup flow tailored to the curriculum.

## Validation

Run:

```bash
pytest -q
python3 -m zelda_env.setup_state --help
```

The full PyBoy smoke test requires `azle.gbc` and `azle.sym`.

