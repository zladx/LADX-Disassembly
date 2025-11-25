# Links Awakening DX Disassembly

Disassembly of one of my favorite games. Taking it easy for now.

It builds the following ROMs:

- azlj.gbc (Japanese, v1.0) `
md5: f75874e3654360094fc2b09bd1fed7e8`
- azlj-r1.gbc (Japanese, v1.1) `
md5: 6d8f9cd72201caabdfd0455a819af9ce`
- azlj-r2.gbc (Japanese, v1.2) `
md5: 2e2596c008d47df901394d28f5bd66ec`
- azle.gbc (English, v1.0) `
md5: 07c211479386825042efb4ad31bb525f`
- azle-r1.gbc (English, v1.1) `
md5: ccbb56212e3dbaa9007d389a17e9d075`
- azle-r2.gbc (English, v1.2) `
md5: 7351daa3c0a91d8f6fe2fbcca6182478`
- azlg.gbc (German, v1.0) `
md5: e91fd46e7092d32ca264f21853f09539`
- azlg-r1.gbc (German, v1.1) `
md5: b0080c2f1919a4bb0ea73b788f4a6786`
- azlf.gbc (French, v1.0) `
md5: 1043fd167d0ed9c4094e3c9d8e757f1e`
- azlf-r1.gbc (French, v1.1) `
md5: 68242187b65166b5f8225b20e2021659`

Additionally, a wiki includes a [high-level overview of the game engine](https://github.com/zladx/LADX-Disassembly/wiki/Game-engine-documentation), and technical informations on the [data formats used](https://github.com/zladx/LADX-Disassembly/wiki/Maps-data-format) throughout the game.

## Usage

1. Install Python 3 and [rgbds](https://github.com/gbdev/rgbds#1-installing-rgbds) (version >= 1.0.0 required);
2. `make all`.

This will build both the games and their debug symbols. Once built, use [BGB](https://github.com/zladx/LADX-Disassembly/wiki/Tooling-for-reverse-engineering#bgb) to load the debug symbols into the debugger.

## How to contribute

1. Fork this repository;
2. Find a little piece of code to improve:
  - Maybe a typo, a missing constant, an obvious label that could be renamed;
  - Or start following a thread (Link's animations? The island fade-out special effect? Trading items constants?) and document some details along your read;
  - You can also look at the [known improvements](https://github.com/zladx/LADX-Disassembly/issues) – especially [good first issues](https://github.com/zladx/LADX-Disassembly/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc+label%3A%22good+first+issue%22);
3. Submit a pull request.

Having questions, or do you need help? Join the discussion on [Discord](https://discord.gg/sSHrwdB).
You can also read [disassembling How-Tos](https://github.com/zladx/LADX-Disassembly/wiki) in the Wiki, for some infos about the tools and disassembling processes.

## Resources

- [Artemis251's Link's Awakening Cache](http://artemis251.fobby.net/zelda/index.php): ROM map, maps data format
- [Xkeeper's Link's Awakening depot](https://xkeeper.net/hacking/linksawakening/): maps tilesets and save format infos
- [LALE](https://github.com/anotak/LALE): level editor, notes on maps data format
- [The Legend of Zelda Link's Awakening /DX Speedrunning Wiki](http://spiraster.x10host.com/LADXWiki/index.php/) : infos on wrong warps and map data format
- [Zelda III Disassembly](http://www.zeldix.net/t143-disassembly-zelda-docs) ([archive](https://web.archive.org/web/20180315181518/http://www.zeldix.net/t143-disassembly-zelda-docs)): good source on Zelda SNES source code, which has many similarities to LADX
- [Disassembling Link's Awakening](https://zladx.github.io): a series of blog posts and progress reports
- Discord: [LADX](https://discord.gg/sSHrwdB)

## Contributors

Thanks to these people for contributing:

* mojobojo - https://github.com/mojobojo
* kemenaran - https://github.com/kemenaran
* Drenn1 - https://github.com/Drenn1
* Sanqui - https://github.com/Sanqui
* Kyle McGuffin - https://github.com/kcmcg
* Marijn van der Werf - https://github.com/marijnvdwerf
* samuel-flynn - https://github.com/samuel-flynn
* Xkeeper - https://github.com/Xkeeper0
* Vextrove - https://github.com/Vextrove
* daid - https://github.com/daid
* stephaneseng - https://github.com/stephaneseng
* zelosos - https://gitlab.com/zelosos
* tobiasvl - https://github.com/tobiasvl

([See contribution details here](https://github.com/zladx/LADX-Disassembly/graphs/contributors))
