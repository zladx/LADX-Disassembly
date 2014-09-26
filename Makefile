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

# Objects are assembled from source.
# src/main.o is built from src/main.asm.
obj = src/main.o

.asm.o:
	rgbasm -i src/ -o $@ $<

# Then we link them to create a playable image.
# This also spits out game.sym, which lets you use labels in bgb.
# Generating a mapfile is required thanks to a bug in rgblink.
game.gbc: $(obj)
	rgblink -n $*.sym -m $*.map -o $@ $(obj)
	rgbfix  -v $@
