.POSIX:

#
# Dev tools binaries and options
#
2BPP    := rgbgfx

ASM     := rgbasm
ASFLAGS := --export-all

LD      := rgblink
LDFLAGS :=

FX      := rgbfix
FXFLAGS := \
  --color-compatible \
  --sgb-compatible \
  --ram-size 0x03 \
  --old-licensee 0x33 \
  --new-licensee "01" \
  --mbc-type 0x1B \
  --pad-value 0xFF \
  --validate

.SUFFIXES: .asm .o .gbc .png .2bpp

# Default target: build and test only the US 1.0 revision.
# (Use `make all` to build and test all targets.)
default: build test

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
asm_files = $(shell find src     -type f -name '*.asm')
gfx_files = $(shell find src/gfx -type f -name '*.png')

deps = $(asm_files) $(gfx_files:.png=.2bpp)

#
# Generic rules
#

# Compile a PNG file to a 2BPP file
%.2bpp: %.png
	$(2BPP) -o $@ $<

# Link an object file to a GBC file
%.gbc: src/main.%.o
	$(LD) $(LDFLAGS) $($*_ld_opt) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) $($*_fx_opt) $@

#
# Japanese
#

azlj_asm = $(shell find revisions/J0 -type f -name '*.asm')
azlj_gfx = $(shell find revisions/J0 -type f -name '*.png')

games += azlj.gbc
src/main.azlj.o: src/main.asm $(deps) $(azlj_asm) $(azlj_gfx:.png=.2bpp)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=0 -i revisions/J0/src/ -i src/ -o $@ $<
azlj_fx_opt = --rom-version 0 --title "ZELDA"

games += azlj-r1.gbc
src/main.azlj-r1.o: src/main.asm $(deps) $(azlj_asm) $(azlj_gfx:.png=.2bpp)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=1 -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -o $@ $<
azlj-r1_fx_opt = --rom-version 1 --title "ZELDA"

games += azlj-r2.gbc
src/main.azlj-r2.o: src/main.asm $(deps) $(azlj_asm) $(azlj_gfx:.png=.2bpp)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=2 -i revisions/J2/src/ -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -o $@ $<
azlj-r2_fx_opt = --rom-version 2 --title "ZELDA" --game-id "AZLJ"

#
# German
#

azlg_asm = $(shell find revisions/G0 -type f -name '*.asm')
azlg_gfx = $(shell find revisions/G0 -type f -name '*.png')

games += azlg.gbc
src/main.azlg.o: src/main.asm $(deps) $(azlg_asm) $(azlg_gfx:.png=.2bpp)
	$(ASM) $(ASFLAGS) -DLANG=DE -DVERSION=0 -i revisions/G0/src/ -i src/ -o $@ $<
azlg_fx_opt = --rom-version 0 --non-japanese --title "ZELDA"

games += azlg-r1.gbc
src/main.azlg-r1.o: src/main.asm $(deps) $(azlg_asm) $(azlg_gfx:.png=.2bpp) azlj-r2.gbc
	$(ASM) $(ASFLAGS) -DLANG=DE -DVERSION=1 -i revisions/G1/src/ -i revisions/G0/src/ -i src/ -o $@ $<
azlg-r1_ld_opt = -O azlj-r2.gbc
azlg-r1_fx_opt = --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLD"

#
# French
#

azlf_asm = $(shell find revisions/F0 -type f -name '*.asm')
azlf_gfx = $(shell find revisions/F0 -type f -name '*.png')

games += azlf.gbc
src/main.azlf.o: src/main.asm $(deps) $(azlf_asm) $(azlf_gfx:.png=.2bpp)
	$(ASM) $(ASFLAGS) -DLANG=FR -DVERSION=0 -i revisions/F0/src/ -i src/ -o $@ $<
azlf_fx_opt = --rom-version 0 --non-japanese --title "ZELDA"

games += azlf-r1.gbc
src/main.azlf-r1.o: src/main.asm $(deps) $(azlf_asm) $(azlf_gfx:.png=.2bpp) azlg-r1.gbc
	$(ASM) $(ASFLAGS) -DLANG=FR -DVERSION=1 -i revisions/F1/src/ -i revisions/F0/src/ -i src/ -o $@ $<
azlf-r1_ld_opt = -O azlg-r1.gbc
azlf-r1_fx_opt = --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLF"

#
# English
#

games += azle.gbc
src/main.azle.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=0 -i src/ -o $@ $<
azle_fx_opt = --rom-version 0 --non-japanese --title "ZELDA"

games += azle-r1.gbc
src/main.azle-r1.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=1 -i revisions/E1/src/ -i src/ -o $@ $<
azle-r1_fx_opt = --rom-version 1 --non-japanese --title "ZELDA"

games += azle-r2.gbc
src/main.azle-r2.o: src/main.asm $(deps) azlf-r1.gbc
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=2 -i revisions/E2/src/ -i revisions/E1/src/ -i src/ -o $@ $<
azle-r2_ld_opt = -O azlf-r1.gbc
azle-r2_fx_opt = --rom-version 2 --non-japanese --title "ZELDA" --game-id "AZLE"

#
# Main targets
#

# By default, build the US 1.0 revision.
build: azle.gbc

# Build all revisions.
build-all: $(games)

# Test the default revision.
test: build
	@tools/compare.sh ladx.md5 azle.gbc

# Test all revisions.
test-all: build-all
	@tools/compare.sh ladx.md5 $(games)

all: build-all test-all

clean:
	rm -f $(games)
	rm -f $(games:.gbc=.o)
	rm -f $(games:.gbc=.map)
	rm -f $(games:.gbc=.sym)
	find . -iname '*.2bpp' -exec rm {} +

.PHONY: default build build-all test test-all all clean
