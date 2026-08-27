# Nintendo 2DS/3DS Virtual Console Patches

The Nintendo Virtual Console is an emulator on the 2DS and 3DS consoles. It can emulate the Game Boy Color (among other consoles), while applying enhancements or modifications to some games, such as changing text or disabling Game Boy Printer features.

Game-specific enhancements are determined by a `.patch` file corresponding to the `.gbc` ROM file.

(These files are bundled together in a `.cia` file; creating such a file is outside the scope of this project.)

## Building the patches

Running `make all` builds the `.patch` files alongside the `.gbc` files.

## Patch templates

Each `.patch.template` file is the basis for a `.patch` file.

The `tools/vc.py` script is used to convert a `.patch.template` into a `.patch` file. Running `tools/vc.py --help` will print its usage information.

Most `.patch.template` contents are copied directly into the `.patch` file as-is. But *commands*, contained in "`{`" braces "`}`", are replaced with values derived from the assembly labels and ROM content.

There are three types of command:

### <code>{LABEL <i>value</i>}</code>

Expands to the ROM offset of *value*. The *value* must be a label name from the `.sym` file, optionally with a <code>+<i>delta</i></code> amount added to it. The output format is an "`x`" followed by uppercase hex digits.

For example, if the `.sym` file contains `1c:6cdd Dialog15B`, then the command `{LABEL Dialog15B+1}` will calculate (0x1c × 0x4000) + (0x6cdd & 0x3fff) + 1 = 0x72cde, and expand to `x72CDE`.

### <code>{MIXEDCASELABEL <i>value</i>}</code>

The same as `LABEL`, but with the third-from-last output digit in lowercase instead of uppercase. This is only needed for one of the values in each `.patch.template`, to precisely reproduce the original files.

### <code>{PATCH <i>offset</i> <i>length</i>}</code>

Expands to *length* bytes of the patched ROM contents at *offset*. Like `LABEL`, the *offset* must be a label name from the `.sym` file, optionally with a <code>+<i>delta</i></code> amount added to it. The output format is "<code>a<i>N</i>:</code>" for the length *N*, followed by space-separated two-digit uppercase hex bytes.

For example, if the original ROM contains "`HELLO`" and the patched ROM contains "`YAHOO`" at `Dialog15A`, then the command `{PATCH Dialog15A 4}` will expand to `a4:48 45 4C 4C` (those being the `charmap`ped ASCII codes for "YAHO").
