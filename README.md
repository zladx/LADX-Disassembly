# Links Awakening DX Disassembly

Disassembly of one of my favorite games. Taking it easy for now.

Theses sources reproduce a valid build of `Legend of Zelda, The - Link's Awakening DX (U) (V1.0) [C][!].gbc`
MD5 - 07C211479386825042EFB4AD31BB525F

## Usage

1. Install [rbgds](https://github.com/rednex/rgbds#1-installing-rgbds) (version >= 0.2.5 required).
2. `make all`

## Overview

This repository produces a valid Zelda DX ROM from several different inputs:

- Disassembled and labeled assembly code (in `./src`),
- Extracted PNG graphics (in `./src/gfx`),
- Extracted dialog texts (in `./src/text`),
- The original ROM (used to fill-in sections not disassembled yet).

## Status

- Bank 0 : disassembled, 35% documented
- Bank 1 : disassembled, 10% documented
- Bank 2 : disassembled, 15% documented
- Bank 3 : disassembled
- Bank 4 : disassembled
- Other banks : not disassembled yet
- Memory : 20% documented
- Dialogs : extracted, 100%
- Graphics : extracted, 100%
- Maps : not extracted
- Music : not extracted

## How to label code

Disassembling the code is easy, and computers are very good at it. What is difficult is to _label_ the original code, finding the meaning behind of function calls and memory manipulations.

Of course we can just read the disassembled sources in a text editor, understand what the assembly does, and label it accordingly. However this is a slow and difficult process–and, fortunately, there are tools to help us.

### Using BGB (for dynamic analysis)

The [BGB emulator](http://bgb.bircd.org/) is a really nice GameBoy emulator, with a nice and complete debugger. It can set breakpoints on code and on memory access, and help you track the execution of the code.

BGB is originally written for Windows, but it works also well on macOS and Linux using Wine.

Here is how to use BGB for reverse-engineering the game:

1. Compile the game (`make all`).

    It produces `game.gbc` (a compiled rom identical to the original) and more importantly `game.map`, the debug symbols.

2. Open `game.gbc` in the [BGB emulator](http://bgb.bircd.org/).
3. Open the debugger, and jump to the `0000:0150` address. You'll see a function named `Start`. Notice how BGB knows the name of this function from the debug symbols.
4. You can now trace the execution of the code, set breakpoints, watchers, edit the memory, etc.

From there **the goal is to pick a function or a memory location, and understand what it does**, so that we can label it in the disassembled code. For this the process usually goes like this:

1. Pick a function instruction (for instance `call label_0A43`)
2. Understand what is does. For this you can either:
  - read the assembly,
  - set a breakpoint, to see when this function is called,
  - see what memory location it reads or changes,
  - observe the values changing in the memory viewer while the game runs,
  - use the debugger to replace the function by a `nop`, and see what change occur in the game
3. Open the assembly source (`src/code/bank*.asm`) or memory map (`src/constants/*`), and label the code or memory you identified the purpose of.
4. Rince and repeat.

### Using `awake` (for static analysis)

[Awake](https://github.com/kemenaran/awake) is a static GameBoy assembly explorer, specially tuned for exploring ZeldaGB and ZeldaDX. It allows to identify functions, loops, and to jump easily from functions to function. It makes much easier to follow the flow of the code and data during the game.

The tool was initially developed by @devdri. @kemenaran is currently writing some improvement to this tools, so that it can read debug symbols (otherwise no functions are labelled), and label functions from within the explorer.

## Contributors

Thanks to these people for contributing:

* kemenaran - https://github.com/kemenaran
* Drenn1 - https://github.com/Drenn1
* Sanqui - https://github.com/Sanqui
