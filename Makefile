.POSIX:

2BPP   := rgbgfx
ASM    := rgbasm -E

.SUFFIXES: .asm .o .gb .png .2bpp

# Default target
all: build test

build: game.gb

test: build
#	@tools/md5sum.sh -c ladx.md5

clean:
	rm -f $(obj)
	rm -f game.{gb,sym,map}
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
game.gb: $(obj)
	rgblink -n $*.sym -m $*.map -o $@ $(obj) -p 0xFF
	rgbfix  -n 0 -r 0x02 -s --old-licensee 0x01 -m 0x1B -j -p 0xFF -t "ZELDA" -v $@
	# ../mgbdis/mgbdis.py --output-dir ../mgbdis/disassembly --overwrite --print-hex game.gb
