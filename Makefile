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
# Add files from the different revisions
# FIXME: add these files only when building the relevant targets
asm_files += $(shell find revisions -type f -name '*.asm')
gfx_files += $(shell find revisions -type f -name '*.png')

%.2bpp: %.png
	$(2BPP) -o $@ $<

deps = $(asm_files) $(gfx_files:.png=.2bpp)

#
# Japanese
#

games += azlj.gbc
j0_obj = src/main.azlj.o
src/main.azlj.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=0 -i revisions/J0/src/ -i src/ -o $@ $<
azlj.gbc: $(j0_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 0 --title "ZELDA" $@

games += azlj-r1.gbc
j1_obj = src/main.azlj-1.o
src/main.azlj-1.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=1 -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -o $@ $<
azlj-r1.gbc: $(j1_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 1 --title "ZELDA" $@

games += azlj-r2.gbc
j2_obj = src/main.azlj-2.o
src/main.azlj-2.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=JP -DVERSION=2 -i revisions/J2/src/ -i revisions/J1/src/ -i revisions/J0/src/ -i src/ -o $@ $<
azlj-r2.gbc: $(j2_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 2 --title "ZELDA" --game-id "AZLJ" $@

#
# German
#

games += azlg.gbc
g0_obj = src/main.azlg.o
src/main.azlg.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=DE -DVERSION=0 -i revisions/G0/src/ -i src/ -o $@ $<
azlg.gbc: $(g0_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 0 --non-japanese --title "ZELDA" $@

games += azlg-r1.gbc
g1_obj = src/main.azlg-1.o
src/main.azlg-1.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=DE -DVERSION=1 -i revisions/G1/src/ -i revisions/G0/src/ -i src/ -o $@ $<
azlg-r1.gbc: $(g1_obj) azlj-r2.gbc
	$(LD) $(LDFLAGS) -O "azlj-r2.gbc" -n $*.sym -o $@ $<
	$(FX) $(FXFLAGS) --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLD" $@

#
# French
#

games += azlf.gbc
f0_obj = src/main.azlf.o
src/main.azlf.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=FR -DVERSION=0 -i revisions/F0/src/ -i src/ -o $@ $<
azlf.gbc: $(f0_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 0 --non-japanese --title "ZELDA" $@

games += azlf-r1.gbc
f1_obj = src/main.azlf-1.o
src/main.azlf-1.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=FR -DVERSION=1 -i revisions/F1/src/ -i revisions/F0/src/ -i src/ -o $@ $<
azlf-r1.gbc: $(f1_obj) azlg-r1.gbc
	$(LD) $(LDFLAGS) -O "azlg-r1.gbc" -n $*.sym -o $@ $<
	$(FX) $(FXFLAGS) --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLF" $@

#
# English
#

games += azle.gbc
e0_obj = src/main.azle.o
src/main.azle.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=0 -i src/ -o $@ $<
azle.gbc: $(e0_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 0 --non-japanese --title "ZELDA" $@

games += azle-r1.gbc
e1_obj = src/main.azle-1.o
src/main.azle-1.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=1 -i revisions/E1/src/ -i src/ -o $@ $<
azle-r1.gbc: $(e1_obj)
	$(LD) $(LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) --rom-version 1 --non-japanese --title "ZELDA" $@

games += azle-r2.gbc
e2_obj = src/main.azle-2.o
src/main.azle-2.o: src/main.asm $(deps)
	$(ASM) $(ASFLAGS) -DLANG=EN -DVERSION=2 -i revisions/E2/src/ -i revisions/E1/src/ -i src/ -o $@ $<
azle-r2.gbc: $(e2_obj) azlf-r1.gbc
	$(LD) $(LDFLAGS) -O "azlf-r1.gbc" -n $*.sym -o $@ $<
	$(FX) $(FXFLAGS) --rom-version 2 --non-japanese --title "ZELDA" --game-id "AZLE" $@

#
# General rules
#

# By default, build the US 1.0 revision.
build: azle.gbc

# Build all revisions.
build-all: $(games)

# Test the default revision.
test: build
	@tools/md5sum.sh --check --ignore-missing ladx.md5

# Test all revisions.
test-all: build-all
	@tools/md5sum.sh --check ladx.md5

all: build-all test-all

clean:
	rm -f $(obj)
	rm -f $(games)
	rm -f $(games:.gbc=.o)
	rm -f $(games:.gbc=.map)
	rm -f $(games:.gbc=.sym)
	find . -iname '*.2bpp' -exec rm {} +

.PHONY: default build build-all test test-all all clean
