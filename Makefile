.POSIX:
.SUFFIXES:
.PRECIOUS: %.2bpp oam_%.2bpp
.PHONY: default build build-all test test-all all clean

#
# Dev tools binaries and options
#

2BPP    := rgbgfx

ASM     := rgbasm

# Get assembler version
ASMVER    := $(shell $(ASM) --version | cut -f2 -dv)
ASMVERMAJ := $(shell echo $(ASMVER) | cut -f1 -d.)
ASMVERMIN := $(shell echo $(ASMVER) | cut -f2 -d.)

# Abort if RGBDS version is too low and 'clean' is not the only target
ifneq ($(MAKECMDGOALS), "clean")
  ifeq ($(shell expr \
    \( $(ASMVERMAJ) = 0 \) \&\
    \( $(ASMVERMIN) \< 5 \)\
  ), 1)
    $(error Requires RGBDS version >= 0.5.0)
  endif
endif

ASFLAGS := --export-all

# If we're using RGBDS >= 0.6.0, add flags to force behavior that used to be default
ifeq ($(shell expr \
  \( $(ASMVERMAJ) \> 0 \) \|\
  \(\
    \( $(ASMVERMAJ) = 0 \) \&\
    \( $(ASMVERMIN) \> 5 \)\
  \)\
), 1)
  ASFLAGS += \
    --auto-ldh\
    --nop-after-halt
endif

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

# Default target: build and test only the US 1.0 revision.
# (Use `make all` to build and test all targets.)
default: build test

#
# Generic rules
#

# Dependencies for the base version (English 1.0)
asm_files =  $(shell find src     -type f -name '*.asm' -o -name '*.inc')
gfx_files =  $(shell find src/gfx -type f -name '*.png')
bin_files =  $(shell find src     -type f -name '*.tilemap.encoded' -o -name '*.attrmap.encoded')

# Compile an PNG file for OAM memory to a 2BPP file
# (inverting the palette and de-interleaving the tiles).
oam_%.2bpp: oam_%.png
	tools/gfx/gfx.py --invert --interleave --out $@ 2bpp $<

# Compile a PNG file to a 2BPP file, without any special conversion.
# (This typically uses `rgbgfx`, which is much faster than the
# Python-based `gfx.py`.)
%.2bpp: %.png
	$(2BPP) -o $@ $<

# Compile all dependencies (ASM, 2BPP) into an single object file.
# (This means all the source code is always fully recompiled: for now,
# we don't compile the different ASM files separately.)
# Locale-specific rules below (e.g. `src/main.azlj.o`) will add their own
# pre-requisites to the ones defined by this rule.
src/main.%.o: src/main.asm $(asm_files) $(gfx_files:.png=.2bpp) $(bin_files)
	$(ASM) $(ASFLAGS) $($*_ASFLAGS) -i src/ -o $@ $<

# Link object files into a GBC executable rom
# The arguments used are both the global options (e.g. `LDFLAGS`) and the
# locale-specific options (e.g. `azlg-r1_LDFLAGS`).
%.gbc: src/main.%.o
	$(LD) $(LDFLAGS) $($*_LDFLAGS) -n $*.sym -o $@ $^
	$(FX) $(FXFLAGS) $($*_FXFLAGS) $@

# Make may attempt to re-generate the Makefile; prevent this.
Makefile: ;

#
# Japanese
#

azlj_asm = $(shell find revisions/J0 -type f -name '*.asm')
azlj_gfx = $(shell find revisions/J0 -type f -name '*.png')
azlj_bin = $(shell find revisions/J0 -type f -name '*.tilemap.encoded' -o -name '*.attrmap.encoded')

games += azlj.gbc
src/main.azlj.o: $(azlj_asm) $(azlj_gfx:.png=.2bpp) $(azlj_bin)
azlj_ASFLAGS = -DLANG=JP -DVERSION=0 -i revisions/J0/src/
azlj_FXFLAGS = --rom-version 0 --title "ZELDA"

games += azlj-r1.gbc
src/main.azlj-r1.o: $(azlj_asm) $(azlj_gfx:.png=.2bpp) $(azlj_bin)
azlj-r1_ASFLAGS = -DLANG=JP -DVERSION=1 -i revisions/J0/src/
azlj-r1_FXFLAGS = --rom-version 1 --title "ZELDA"

games += azlj-r2.gbc
src/main.azlj-r2.o: $(azlj_asm) $(azlj_gfx:.png=.2bpp) $(azlj_bin)
azlj-r2_ASFLAGS = -DLANG=JP -DVERSION=2 -i revisions/J0/src/
azlj-r2_FXFLAGS = --rom-version 2 --title "ZELDA" --game-id "AZLJ"

#
# German
#

azlg_asm = $(shell find revisions/G0 -type f -name '*.asm')
azlg_gfx = $(shell find revisions/G0 -type f -name '*.png')
azlg_bin = $(shell find revisions/G0 -type f -name '*.tilemap.encoded' -o -name '*.attrmap.encoded')

games += azlg.gbc
src/main.azlg.o: $(azlg_asm) $(azlg_gfx:.png=.2bpp) $(azlg_bin)
azlg_ASFLAGS = -DLANG=DE -DVERSION=0 -i revisions/G0/src/
azlg_FXFLAGS = --rom-version 0 --non-japanese --title "ZELDA"

games += azlg-r1.gbc
src/main.azlg-r1.o: $(azlg_asm) $(azlg_gfx:.png=.2bpp) $(azlg_bin) azlj-r2.gbc
azlg-r1_ASFLAGS = -DLANG=DE -DVERSION=1 -i revisions/G0/src/
azlg-r1_LDFLAGS = -O azlj-r2.gbc
azlg-r1_FXFLAGS = --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLD"

#
# French
#

azlf_asm = $(shell find revisions/F0 -type f -name '*.asm')
azlf_gfx = $(shell find revisions/F0 -type f -name '*.png')
azlf_bin = $(shell find revisions/F0 -type f -name '*.tilemap.encoded' -o -name '*.attrmap.encoded')

games += azlf.gbc
src/main.azlf.o: $(azlf_asm) $(azlf_gfx:.png=.2bpp) $(azlf_bin)
azlf_ASFLAGS = -DLANG=FR -DVERSION=0 -i revisions/F0/src/
azlf_FXFLAGS = --rom-version 0 --non-japanese --title "ZELDA"

games += azlf-r1.gbc
src/main.azlf-r1.o: $(azlf_asm) $(azlf_gfx:.png=.2bpp) $(azlf_bin) azlg-r1.gbc
azlf-r1_ASFLAGS = -DLANG=FR -DVERSION=1 -i revisions/F0/src/
azlf-r1_LDFLAGS = -O azlg-r1.gbc
azlf-r1_FXFLAGS = --rom-version 1 --non-japanese --title "ZELDA" --game-id "AZLF"

#
# English
#

games += azle.gbc
src/main.azle.o:
azle_ASFLAGS = -DLANG=EN -DVERSION=0
azle_FXFLAGS = --rom-version 0 --non-japanese --title "ZELDA"

games += azle-r1.gbc
src/main.azle-r1.o:
azle-r1_ASFLAGS = -DLANG=EN -DVERSION=1
azle-r1_FXFLAGS = --rom-version 1 --non-japanese --title "ZELDA"

games += azle-r2.gbc
src/main.azle-r2.o: azlf-r1.gbc
azle-r2_ASFLAGS = -DLANG=EN -DVERSION=2
azle-r2_LDFLAGS = -O azlf-r1.gbc
azle-r2_FXFLAGS = --rom-version 2 --non-japanese --title "ZELDA" --game-id "AZLE"

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
	rm -f $(games:%.gbc=src/main.%.o)
	rm -f $(games:.gbc=.map)
	rm -f $(games:.gbc=.sym)
	rm -f $(gfx_files:.png=.2bpp)
	rm -f $(azlj_gfx:.png=.2bpp)
	rm -f $(azlg_gfx:.png=.2bpp)
	rm -f $(azlf_gfx:.png=.2bpp)
