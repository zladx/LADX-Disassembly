.POSIX:

# If your default python is 3, you may want to change this to python27.
PYTHON = python

.SUFFIXES:
.SUFFIXES: .asm .o .gbc


# For now, we only need to build one rom (game.gbc).
all: game.gbc

clean: ;
	@rm -f $(obj)
	@rm -f game.{gbc,sym,map}

DumpBanks: src/tools/DumpBanks.c
	gcc -o DumpBanks src/tools/DumpBanks.c
	chmod +x DumpBanks

src/bank-bins:
	mkdir -p src/bank-bins

src/bank-bins/bank_00_0.bin: src/bank-bins DumpBanks
	cd src/bank-bins && ../../DumpBanks ../../Zelda.gbc

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
obj = src/main.o

.asm.o: src/bank-bins/bank_00_0.bin
	rgbasm -i src/ -o $@ $<

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.
game.gbc: $(obj)
	rgblink -n $*.sym -m $*.map -o $@ $(obj)
	rgbfix  -c -n 0 -r 0x03 -s -l 0x33 -k "01" -m 0x1B -j -p 0xFF -t "ZELDA" -v $@
