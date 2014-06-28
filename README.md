# Game Boy bootstrap

An example project to get would-be Game Boy programmers started without having to read mountains of docs.

[pypng][pypng] is used to convert png to Game Boy graphics.

```bash
	pip install pypng
```

To build, install [rgbds][rgbds] and put it in your path.
Then run `make`. This will output `game.gbc`.

[pypng]: https://github.com/drj11/pypng
[rgbds]: https://github.com/bentley/rgbds
