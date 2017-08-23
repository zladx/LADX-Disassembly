# Photo pictures

These are the source for the photo pictures that can be seen in the
Camera Shop in-game.

## Format

In-game these photos are displayed at 160 x 44 px – but in the ROM
only 128 x 128 px are used to store the picture.

This means pictures are slighly compressed. The compression algorithm
looks for repeating 8 x 8 tiles, and discard tiles that are already
used somewhere else in the picture.

Additionally, many pictures have dynamic elements. In this case the
elements are extracted from the picture itself, or from other banks
that store the moving parts.
