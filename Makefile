.POSIX:

2BPP   := rgbgfx
ASM    := rgbasm -E

.SUFFIXES: .asm .o .gbc .png .2bpp

# For now, we only need to build one rom (game.gbc).
all: game.gbc

clean:
	rm -f $(obj)
	rm -f game.{gbc,sym,map}
	find . -iname '*.2bpp' -exec rm {} +

Z80Dis: tools/deprecatd/Z80Dis.c
	gcc -std=c99 -o Z80Dis tools/Z80Dis.c
	chmod a+x Z80Dis

DumpBanks: tools/deprecated/DumpBanks.c
	gcc -std=c99 -o DumpBanks tools/DumpBanks.c
	chmod a+x DumpBanks

Zelda.gbc:
ifeq (,$(wildcard Zelda.gbc))
	$(error Original "Zelda.gbc" is required to stub non-yet-disassembled sections. Find a copy of the "Legend of Zelda, The - Link's Awakening DX (U) (V1.0) [C][!]" (md5: 07C211479386825042EFB4AD31BB525F), and put it in the root directory to compile the game)
endif

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
obj = src/main.o
asm_files = $(shell find src     -type f -name '*.asm')
gfx_files = $(shell find src/gfx -type f -name '*.png')
bin_files = $(shell find src     -type f -name '*.bin')

%.2bpp: %.png
	$(2BPP) -o $@ $<

src/main.o: $(asm_files) $(gfx_files:.png=.2bpp) $(bin_files) Zelda.gbc

.asm.o:
	$(ASM) -i src/ -o $@ $<

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.
game.gbc: $(obj)
	rgblink -O Zelda.gbc -n $*.sym -m $*.map -o $@ $(obj)
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@
	@md5sum -c ladx.md5
