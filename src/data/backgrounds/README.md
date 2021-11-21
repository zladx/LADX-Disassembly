# Background tilemaps

Background tilemaps of the game are stored encoded, using a custom compression format.

As the tilemaps were coded manually by the original programmers, decoding and re-encoding them results in a file that is slighly different from the original.

So the tilemaps are stored encoded. I you want to visualize or edit them, you'll need to decode them first.

## Editing the tilemaps

To make change to a tilemap:

1. Decode the tilemap:
    ```
    tools/convert_background.py decode src/data/backgrounds/marin_beach.tilemap.encoded --output src/data/backgrounds/marin_beach.tilemap
    ```
2. Edit the tilemap, using your favorite editor.
3. Re-encode the modified tilemap:
    ```
    tools/convert_background.py encode src/data/backgrounds/marin_beach.tilemap --output src/data/backgrounds/marin_beach.tilemap.encoded
    ```

## Background color

Some tilemaps take advantage of the backround being pre-filled with an initial color.
For instance, the file menu tilemaps assume that the background has been filled with black tiles
(7E) beforehand.

When decoding a tilemap, this initial color can be specified using the `--filler` command line argument.

And when encoding a tilemap, if an initial color is specified, long repeated sequences of this
color will be ignored (which will reduce both the encoded tilemap size and the overdraw)

For instance:

```
# Decode a tilemap using an initial color
tools/convert_background.py decode src/data/backgrounds/menu_file_creation.tilemap.encoded --filler 0x7E --outfile src/data/backgrounds/menu_file_creation.tilemap
# Edit using an external tool
# …
# Re-encode the tilemap without storing the initial color
tools/convert_background.py encode src/data/backgrounds/menu_file_creation.tilemap --filler 0x7E --outfile src/data/backgrounds/menu_file_creation.tilemap.encoded
```
