.POSIX:

# If your default python is 3, you may want to change this to python27.
PYTHON := python
2BPP   := $(PYTHON) tools/gfx.py 2bpp
ASM    := rgbasm -E

.SUFFIXES: .asm .o .gbc .png .2bpp

# For now, we only need to build one rom (game.gbc).
all: game.gbc

clean:
	rm -f $(obj)
	rm -f game.{gbc,sym,map}
	find . -iname '*.2bpp' -exec rm {} +

Z80Dis: tools/Z80Dis.c
	gcc -std=c99 -o Z80Dis tools/Z80Dis.c
	chmod a+x Z80Dis

DumpBanks: tools/DumpBanks.c
	gcc -std=c99 -o DumpBanks tools/DumpBanks.c
	chmod a+x DumpBanks

bin/banks:
	mkdir -p bin/banks

bin/banks/bank_00_0.bin: bin/banks DumpBanks
ifeq (,$(wildcard Zelda.gbc))
	$(error Original "Zelda.gbc" banks are missing. Find a copy of the "Legend of Zelda, The - Link's Awakening DX (U) (V1.0) [C][!]" (md5: 07C211479386825042EFB4AD31BB525F), and put it in the root directory to dump the banks)
endif
	cd bin/banks && ../../DumpBanks ../../Zelda.gbc

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
obj = src/main.o
asm_files = $(shell find src     -type f -name '*.asm')
gfx_files = $(shell find src/gfx -type f -name '*.png')

%.2bpp: %.png
	$(2BPP) $<

src/main.o: $(asm_files) $(gfx_files:.png=.2bpp) bin/banks/bank_00_0.bin

.asm.o:
	$(ASM) -i src/ -o $@ $<

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.
game.gbc: $(obj)
	rgblink -n $*.sym -m $*.map -o $@ $(obj)
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@
	@md5sum -c ladx.md5
