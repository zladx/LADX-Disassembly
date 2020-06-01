.POSIX:

2BPP   := rgbgfx
ASM    := rgbasm -E

.SUFFIXES: .asm .o .gbc .png .2bpp

# Default target
all: build test

test: build
	@tools/md5sum.sh -c ladx.md5

clean:
	rm -f $(obj)
	rm -f game.{gbc,sym,map}
	find . -iname '*.2bpp' -exec rm {} +

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
asm_files = $(shell find src     -type f -name '*.asm')
gfx_files = $(shell find src/gfx -type f -name '*.png')
bin_files = $(shell find src     -type f -name '*.bin')

asm_files += $(shell find revisions -type f -name '*.asm')
gfx_files += $(shell find revisions -type f -name '*.png')

%.2bpp: %.png
	$(2BPP) -o $@ $<

deps = $(asm_files) $(gfx_files:.png=.2bpp) $(bin_files)

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.



src/main.o: $(asm_files) $(gfx_files:.png=.2bpp) $(bin_files)


#
# Japanese
#

games += azlj.gbc
j0_obj = src/main.azlj.o
src/main.azlj.o: src/main.asm $(deps)
	$(ASM) -i revisions/J0/src/ -i src/ -DLANG=jp -o $@ $<
azlj.gbc: $(j0_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -p 0xFF -t "ZELDA" -v $@

games += azlj-r1.gbc
j1_obj = src/main.azlj-1.o
src/main.azlj-1.o: src/main.asm $(deps)
	$(ASM) -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -DLANG=jp -o $@ $<
azlj-r1.gbc: $(j1_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 1 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -p 0xFF -t "ZELDA" -v $@

games += azlj-r2.gbc
j2_obj = src/main.azlj-2.o
src/main.azlj-2.o: src/main.asm $(deps)
	$(ASM) -i revisions/J2/src/ -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -DLANG=jp -o $@ $<
azlj-r2.gbc: $(j2_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 2 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -p 0xFF -t "ZELDA" --game-id "AZLJ" -v $@

#
# German
#

games += azlg.gbc
g0_obj = src/main.azlg.o
src/main.azlg.o: src/main.asm $(deps)
	$(ASM) -i revisions/G0/src/ -i src/ -o $@ $<
azlg.gbc: $(g0_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@

games += azlg-r1.gbc
g1_obj = src/main.azlg-1.o
src/main.azlg-1.o: src/main.asm $(deps)
	$(ASM) -i revisions/G1/src/ -i revisions/G0/src/ -i src/ -o $@ $<
azlg-r1.gbc: $(g1_obj) azlj-r2.gbc
	rgblink -overlay "azlj-r2.gbc" -n $*.sym -m $*.map -o $@ $<
	rgbfix  -c -n 1 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" --game-id "AZLD" -v $@

#
# French
#

games += azlf.gbc
f0_obj = src/main.azlf.o
src/main.azlf.o: src/main.asm $(deps)
	$(ASM) -i revisions/F0/src/ -i src/ -o $@ $<
azlf.gbc: $(f0_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@

games += azlf-r1.gbc
f1_obj = src/main.azlf-1.o
src/main.azlf-1.o: src/main.asm $(deps)
	$(ASM) -i revisions/F1/src/ -i revisions/F0/src/ -i src/ -o $@ $<
azlf-r1.gbc: $(f1_obj) azlg-r1.gbc
	rgblink -overlay "azlg-r1.gbc" -n $*.sym -m $*.map -o $@ $<
	rgbfix  -c -n 1 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" --game-id "AZLF" -v $@

#
# English
#

games += azle.gbc
e0_obj = src/main.azle.o
src/main.azle.o: src/main.asm $(deps)
	$(ASM) -i src/ -o $@ $<
azle.gbc: $(e0_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@

games += azle-r1.gbc
e1_obj = src/main.azle-1.o
src/main.azle-1.o: src/main.asm $(deps)
	$(ASM) -i revisions/E1/src/ -i src/ -o $@ $<
azle-r1.gbc: $(e1_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix  -c -n 1 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@

games += azle-r2.gbc
e2_obj = src/main.azle-2.o
src/main.azle-2.o: src/main.asm $(deps)
	$(ASM) -i revisions/E2/src/ -i revisions/E1/src/ -i src/ -o $@ $<
azle-r2.gbc: $(e2_obj) azlf-r1.gbc
	rgblink -overlay "azlf-r1.gbc" -n $*.sym -m $*.map -o $@ $<
	rgbfix  -c -n 2 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" --game-id "AZLE" -v $@

build: $(games)
