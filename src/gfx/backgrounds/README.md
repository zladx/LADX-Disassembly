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
