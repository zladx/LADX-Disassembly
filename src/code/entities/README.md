# Notes on entities

## Source structure

In the original source code, entities were most likely not split into individual files:
all entities in the same bank were probably in the same file,
We know this because often helpers specific to an entity are spread around the bank,
instead of being adjacent to the entity code.

This reconstructed source code choses to sort entities into:
- entities (e.g. 05_bow_wow.asm)
- helpers (e.g. 05__helpers.asm)

The first digit indicates the bank number of the entity. This makes it easier to see
which version of a duplicated helper is used by the entity.

## Helper functions

In the original source code, many helper functions are duplicated across the entities banks.
This is because calling a helper in the same bank is much easier and faster than having to
perform a bank switch.

This reconstructed source code keeps the same approach, and doesn't de-duplicate helpers.
Factorizing helpers wouldn't be doable, because of small differences between the implementations
in each bank. Most likely helpers were copy-pasted when needed in a new bank, and then
diverged slighly during the bug-fixing process.

Common helper functions are suffixed by the bank index (e.g. ShouldLinkTalkToEntity_05).
