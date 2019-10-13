.POSIX:

2BPP   := rgbgfx
ASM    := rgbasm -E

.SUFFIXES: .asm .o .gbc .png .2bpp

# Default target
all: build test

build: game.gbc

test: build
	@tools/md5sum.sh -c ladx.md5

clean:
	rm -f $(obj)
	rm -f game.{gbc,sym,map}
	find . -iname '*.2bpp' -exec rm {} +

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
obj = src/main.o
asm_files = $(shell find src     -type f -name '*.asm')
gfx_files = $(shell find src/gfx -type f -name '*.png')
bin_files = $(shell find src     -type f -name '*.bin')

%.2bpp: %.png
	$(2BPP) -o $@ $<

src/main.o: $(asm_files) $(gfx_files:.png=.2bpp) $(bin_files)

.asm.o:
	$(ASM) -i src/ -o $@ $<

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.
game.gbc: $(obj)
	rgblink -n $*.sym -m $*.map -o $@ $(obj)
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@
