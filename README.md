# Links Awakening DX Disassembly

Disassembly of one of my favorite games. Taking it easy for now.

Theses sources reproduce a valid build of `Legend of Zelda, The - Link's Awakening DX (U) (V1.0) [C][!].gbc`
MD5 - 07C211479386825042EFB4AD31BB525F

## Usage

1. Install [rgbds](https://github.com/rednex/rgbds#1-installing-rgbds) (version >= 0.2.5 required).
2. `make all`

## Overview

This repository produces a valid Zelda DX ROM from several different inputs:

- Disassembled and labeled assembly code (in `./src`),
- Extracted PNG graphics (in `./src/gfx`),
- Extracted dialog texts (in `./src/text`),
- Extracted maps (in `./src/data/maps`),
- The original ROM (used to fill-in sections not disassembled yet).

## Status

- Bank 0: disassembled, 35% documented
- Bank 1: disassembled, 50% documented
- Bank 2: disassembled, 20% documented
- Bank 3: disassembled, 10% documented
- Bank 4: disassembled, 10% documented
- Bank 5: disassembled, 10% documented
- Bank 7: disassembled, 10% documented
- Bank 9: 100% disassembled ✅
- Bank 0A: 100% disassembled ✅
- Bank 0B: 100% disassembled ✅
- Bank 0C-13: graphics, 100% disassembled ✅
- Bank 14: disassembled, 50% documented
- Other banks: not disassembled yet

- Memory: 20% documented
- Dialogs: extracted, 100%
- Graphics: extracted, 100%
- Maps:
  - headers: extracted, 100%
  - minimaps: extracted, 100%
  - layouts: extracted, 100%
  - blocks : extracted, further formatting work needed
- Entities data: extracted, not documented
- Warp data, Chest data, Palettes: not extracted
- Music: not extracted

## How to contribute

- Read the [disassembling How-Tos](https://github.com/zladx/LADX-Disassembly/wiki) in the Wiki
- Join the discussion on [Discord](https://discord.gg/sSHrwdB)
- Fork this repository
- Submit a pull request

## Resources

- [Artemis251's Link's Awakening Cache](http://artemis251.fobby.net/zelda/index.php): ROM map, maps data format
- [Xkeeper's Link's Awakening depot](https://xkeeper.net/hacking/linksawakening/): maps tilesets and save format infos
- [LALE](https://github.com/Fatories/LALE): level editor, notes on maps data format
- [The Legend of Zelda Link's Awakening /DX Speedrunning Wiki](http://spiraster.x10host.com/LADXWiki/index.php/) : infos on wrong warps and map data format
- [Disassembling Link's Awakening](https://kemenaran.winosx.com/posts/category-disassembling-links-awakening/): a series of blog posts and progress reports
- Discord: [LADX](https://discord.gg/sSHrwdB)


## Contributors

Thanks to these people for contributing:

* mojobojo - https://github.com/mojobojo
* kemenaran - https://github.com/kemenaran
* Drenn1 - https://github.com/Drenn1
* Sanqui - https://github.com/Sanqui
* Kyle McGuffin - https://github.com/kcmcg
