#!/usr/bin/python
# -*- coding: utf-8 -*-

# A library for working with Game Boy graphics.
# Converts to and from 2bpp, 1bpp, png.

import os
import sys
import png
from math import sqrt, floor, ceil
import argparse
import yaml


def split(list_, interval):
    """
    Split a list by length.
    """
    for i in xrange(0, len(list_), interval):
        j = min(i + interval, len(list_))
        yield list_[i:j]


def get_tiles(image):
    """
    Split a 2bpp image into 8x8 tiles.
    """
    return list(split(image, 0x10))

def connect(tiles):
    """
    Combine 8x8 tiles into a 2bpp image.
    """
    return [byte for tile in tiles for byte in tile]

def transpose(tiles, width=None):
    """
    Transpose a tile arrangement along line y=-x.

      00 01 02 03 04 05     00 06 0c 12 18 1e
      06 07 08 09 0a 0b     01 07 0d 13 19 1f
      0c 0d 0e 0f 10 11 <-> 02 08 0e 14 1a 20
      12 13 14 15 16 17     03 09 0f 15 1b 21
      18 19 1a 1b 1c 1d     04 0a 10 16 1c 22
      1e 1f 20 21 22 23     05 0b 11 17 1d 23

      00 01 02 03     00 04 08
      04 05 06 07 <-> 01 05 09
      08 09 0a 0b     02 06 0a
                      03 07 0b
    """
    if width == None:
        width = int(sqrt(len(tiles))) # assume square image
    tiles = sorted(enumerate(tiles), key= lambda (i, tile): i % width)
    return [tile for i, tile in tiles]

def transpose_tiles(image, width=None):
    return connect(transpose(get_tiles(image), width))

def interleave(tiles, width):
    """
      00 01 02 03 04 05     00 02 04 06 08 0a
      06 07 08 09 0a 0b     01 03 05 07 09 0b
      0c 0d 0e 0f 10 11 --> 0c 0e 10 12 14 16
      12 13 14 15 16 17     0d 0f 11 13 15 17
      18 19 1a 1b 1c 1d     18 1a 1c 1e 20 22
      1e 1f 20 21 22 23     19 1b 1d 1f 21 23
    """
    interleaved = []
    left, right = split(tiles[::2], width), split(tiles[1::2], width)
    for l, r in zip(left, right):
        interleaved += l + r
    return interleaved

def deinterleave(tiles, width):
    """
      00 02 04 06 08 0a     00 01 02 03 04 05 
      01 03 05 07 09 0b     06 07 08 09 0a 0b
      0c 0e 10 12 14 16 --> 0c 0d 0e 0f 10 11
      0d 0f 11 13 15 17     12 13 14 15 16 17
      18 1a 1c 1e 20 22     18 19 1a 1b 1c 1d
      19 1b 1d 1f 21 23     1e 1f 20 21 22 23
    """
    deinterleaved = []
    rows = list(split(tiles, width))
    for left, right in zip(rows[::2], rows[1::2]):
        for l, r in zip(left, right):
            deinterleaved += [l, r]
    return deinterleaved

def interleave_tiles(image, width):
    return connect(interleave(get_tiles(image), width))

def deinterleave_tiles(image, width):
    return connect(deinterleave(get_tiles(image), width))


def condense_tiles_to_map(image):
    tiles = get_tiles(image)
    new_tiles = []
    tilemap = []
    for tile in tiles:
        if tile not in new_tiles:
            new_tiles += [tile]
        tilemap += [new_tiles.index(tile)]
    new_image = connect(new_tiles)
    return new_image, tilemap


def to_file(filename, data):
    data = bytearray(data)
    with open(filename, 'wb') as out:
        out.write(data)


def read_rgb_macros(lines):
    colors = []
    for line in lines:
        tokens = line.split(" ")
        macro = tokens.pop(0).strip()
        if macro == 'RGB':
            rgb = ' '.join(tokens).split(',')
            colors.append(map(int, rgb))
    return colors


def flatten(planar):
    """
    Flatten planar 2bpp image data into a quaternary pixel map.
    """
    strips = []
    for bottom, top in split(planar, 2):
        bottom = bottom
        top = top
        strip = []
        for i in xrange(7,-1,-1):
            color = (
                (bottom >> i & 1) +
                (top *2 >> i & 2)
            )
            strip += [color]
        strips += strip
    return strips


def to_lines(image, width):
    """
    Convert a tiled quaternary pixel map to lines of quaternary pixels.
    """
    tile_width  = 8
    tile_height = 8
    num_columns = width / tile_width
    height = len(image) / width

    lines = []
    for cur_line in xrange(height):
        tile_row = cur_line / tile_height
        line = []
        for column in xrange(num_columns):
            anchor = (
                + num_columns * tile_row * tile_width * tile_height
                + column * tile_width * tile_height
                + cur_line % tile_height * tile_width
            )
            line += image[anchor : anchor + tile_width]
        lines += [line]
    return lines


def cgb_to_rgb(word, alpha=255):
    """
    Convert a cgb/agb color value (15-bit) to rgba.
    """
    rgba = {}
    for key in 'rgb':
        rgba[key] = (word % 2**5) * 8.25
        word >>= 5
    rgba['a'] = alpha
    return rgba

def rgb_to_cgb(color):
    """
    Convert an rgba pixel to cgb/agb color value (15-bit).
    """
    word = 0
    for hue in map(color.get, 'rgb'):
        word <<= 5
        word += hue / 8
    return word


def pal_to_png(filename):
    """
    Interpret a .pal file as a png palette.
    """
    with open(filename) as rgbs:
        colors = read_rgb_macros(rgbs.readlines())
    a = 255
    palette = []
    for color in colors:
        # even distribution over 000-255
        r, g, b = [int(hue * 8.25) for hue in color]
        palette += [(r, g, b, a)]
    white = (255,255,255,255)
    black = (000,000,000,255)
    if white not in palette and len(palette) < 4:
        palette = [white] + palette
    if black not in palette and len(palette) < 4:
        palette = palette + [black]
    return palette


def png_to_rgb(palette):
    """
    Convert a png palette to rgb macros.
    """
    output = [
        '\tRGB ' + ', '.join(map(lambda k: '%.2d' % (color[k] / 8), 'rgb')) for color in palette]
    return '\n'.join(output)


def read_filename_arguments(filename, yaml_filename='gfx.yaml'):
    """
    A binary blob format like 2bpp has no metadata.
    Rather than passing in arguments from the command line,
    read metadata from filename, or optionally a yaml file.

    PNG also lacks Game Boy-relevant metadata.
    """
    parsed_arguments = {}
    path_arguments = ['pal_file']
    int_arguments = {
        'w': 'width',
        'h': 'height',
        't': 'tile_padding',
    }

    # Look for a yaml file if one exists.
    if os.path.exists(yaml_filename):
        yaml_arguments = yaml.load(open(yaml_filename))
        args = yaml_arguments
        dirs = os.path.splitext(filename)[0].split('/')
        current_path = os.path.dirname(filename)
        while dirs:
            args = args.get(dirs.pop(0), {})
            for key, value in args.items():
                if dirs and key == dirs[0]:
                    continue
                if key in path_arguments:
                    value = os.path.join(current_path, value)
                parsed_arguments[key] = value

    # Filename arguments override yaml.
    arguments = os.path.splitext(filename)[0].split('.')[1:]
    for argument in arguments:

        num = argument[1:]
        if num.isdigit():
            arg = int_arguments.get(argument[0])
            if arg: parsed_arguments[arg] = int(num)

        elif argument in ['interleave', 'norepeat', 'tilemap']:
            parsed_arguments[argument] = True

        elif argument == 'arrange':
            parsed_arguments['norepeat'] = True
            parsed_arguments['tilemap']  = True

        elif 'x' in argument:
            w, h = argument.split('x')
            if w.isdigit() and h.isdigit():
                parsed_arguments['pic_dimensions'] = map(int, (w, h))

    return parsed_arguments


def export_2bpp_to_png(filein, fileout=None, **kwargs):

    if fileout == None:
        fileout = os.path.splitext(filein)[0] + '.png'

    image = open(filein, 'rb').read()

    kwargs.update(read_filename_arguments(filein))

    if kwargs.get('pal_file', None) == None:
        if os.path.exists(os.path.splitext(fileout)[0]+'.pal'):
            kwargs['pal_file'] = os.path.splitext(fileout)[0]+'.pal'

    result = convert_2bpp_to_png(image, **kwargs)
    width, height, palette, greyscale, bitdepth, px_map = result

    w = png.Writer(
        width,
        height,
        palette=palette,
        compression=9,
        greyscale=greyscale,
        bitdepth=bitdepth
    )
    with open(fileout, 'wb') as f:
        w.write(f, px_map)


def convert_2bpp_to_png(image, **kwargs):
    """
    Convert a planar 2bpp graphic to png.
    """

    image = bytearray(image)

    pad_color = bytearray([0])

    width          = kwargs.get('width', 0)
    height         = kwargs.get('height', 0)
    tile_padding   = kwargs.get('tile_padding', 0)
    pic_dimensions = kwargs.get('pic_dimensions', None)
    pal_file       = kwargs.get('pal_file', None)
    interleave     = kwargs.get('interleave', False)

    # Width must be specified to interleave.
    if interleave and width:
        image = interleave_tiles(image, width / 8)

    # Pad the image by a given number of tiles if asked.
    image += pad_color * 0x10 * tile_padding

    # Some images are transposed in blocks.
    if pic_dimensions:
        w, h  = pic_dimensions
        if not width: width = w * 8

        pic_length = w * h * 0x10

        trailing = len(image) % pic_length

        pic = []
        for i in xrange(0, len(image) - trailing, pic_length):
            pic += transpose_tiles(image[i:i+pic_length], h)
        image = bytearray(pic) + image[len(image) - trailing:]

        # Pad out trailing lines.
        image += pad_color * 0x10 * ((w - (len(image) / 0x10) % h) % w)

    def px_length(img):
        return len(img) * 4
    def tile_length(img):
        return len(img) * 4 / (8*8)

    if width and height:
        tile_width = width / 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding

    elif width and not height:
        tile_width = width / 8
        more_tile_padding = (tile_width - (tile_length(image) % tile_width or tile_width))
        image += pad_color * 0x10 * more_tile_padding
        height = px_length(image) / width

    elif height and not width:
        tile_height = height / 8
        more_tile_padding = (tile_height - (tile_length(image) % tile_height or tile_height))
        image += pad_color * 0x10 * more_tile_padding
        width = px_length(image) / height

    # at least one dimension should be given
    if width * height != px_length(image):
        # look for possible combos of width/height that would form a rectangle
        matches = []
        # Height need not be divisible by 8, but width must.
        # See pokered gfx/minimize_pic.1bpp.
        for w in range(8, px_length(image) / 2 + 1, 8):
            h = px_length(image) / w
            if w * h == px_length(image):
                matches += [(w, h)]
        # go for the most square image
        if len(matches):
            width, height = sorted(matches, key= lambda (w, h): (h % 8 != 0, w + h))[0] # favor height
        else:
            raise Exception, 'Image can\'t be divided into tiles (%d px)!' % (px_length(image))

    # convert tiles to lines
    lines = to_lines(flatten(image), width)

    if pal_file == None:
        palette   = None
        greyscale = True
        bitdepth  = 2
        px_map    = [[3 - pixel for pixel in line] for line in lines]

    else: # gbc
        palette   = pal_to_png(pal_file)
        greyscale = False
        bitdepth  = 8
        px_map    = [[pixel for pixel in line] for line in lines]

    return width, height, palette, greyscale, bitdepth, px_map


def export_png_to_2bpp(filein, fileout=None, palout=None, tile_padding=0, pic_dimensions=None):

    arguments = {
        'tile_padding': tile_padding,
        'pic_dimensions': pic_dimensions,
    }
    arguments.update(read_filename_arguments(filein))

    image, palette, tmap = png_to_2bpp(filein, **arguments)

    if fileout == None:
        fileout = os.path.splitext(filein)[0] + '.2bpp'
    to_file(fileout, image)

    if tmap != None:
        mapout = os.path.splitext(fileout)[0] + '.tilemap'
        to_file(mapout, tmap)

    if palout == None:
        palout = os.path.splitext(fileout)[0] + '.pal'
    export_palette(palette, palout)


def get_image_padding(width, height, wstep=8, hstep=8):

    padding = { k: 0 for k in ['left', 'right', 'top', 'bottom'] }

    if width % wstep and width >= wstep:
       pad = float(width % wstep) / 2
       padding['left']   = int(ceil(pad))
       padding['right']  = int(floor(pad))

    if height % hstep and height >= hstep:
       pad = float(height % hstep) / 2
       padding['top']    = int(ceil(pad))
       padding['bottom'] = int(floor(pad))

    return padding


def png_to_2bpp(filein, **kwargs):
    """
    Convert a png image to planar 2bpp.
    """

    tile_padding   = kwargs.get('tile_padding', 0)
    pic_dimensions = kwargs.get('pic_dimensions', None)
    interleave     = kwargs.get('interleave', False)
    norepeat       = kwargs.get('norepeat', False)
    tilemap        = kwargs.get('tilemap', False)

    with open(filein, 'rb') as data:
        width, height, rgba, info = png.Reader(data).asRGBA8()
        rgba = list(rgba)
        greyscale = info['greyscale']

    # png.Reader returns flat pixel data. Nested is easier to work with
    len_px  = 4 # rgba
    image   = []
    palette = []
    for line in rgba:
        newline = []
        for px in xrange(0, len(line), len_px):
            color = { 'r': line[px  ],
                      'g': line[px+1],
                      'b': line[px+2],
                      'a': line[px+3], }
            newline += [color]
            if color not in palette:
                palette += [color]
        image += [newline]

    assert len(palette) <= 4, 'Palette should be 4 colors, is really %d' % len(palette)

    # Pad out smaller palettes with greyscale colors
    def greyscale_rgba(hue):
        rgba = {k:hue for k in 'rgb'}
        rgba['a'] = 255
        return rgba

    for rgba in map(greyscale_rgba, [0xff, 0x00, 0x55, 0xaa]):
        if len(palette) >= 4:
            break
        if rgba not in palette:
            palette += [rgba]

    # Sort palettes by luminance
    def luminance(color):
        rough = { 'r':  4.7,
                  'g':  1.4,
                  'b': 13.8, }
        return sum(color[key] * rough[key] for key in rough.keys())
    palette.sort(key=luminance)

    # Game Boy palette order
    palette.reverse()

    # Map pixels to quaternary color ids
    padding = get_image_padding(width, height)
    width  += padding['left'] + padding['right']
    height += padding['top']  + padding['bottom']
    pad = bytearray([0])

    qmap = []
    qmap += pad * width * padding['top']
    for line in image:
        qmap += pad * padding['left']
        qmap += map(palette.index, line)
        qmap += pad * padding['right']
    qmap += pad * width * padding['bottom']

    # Graphics are stored in tiles instead of lines
    tile_width  = 8
    tile_height = 8
    num_columns = max(width,  tile_width)  / tile_width
    num_rows    = max(height, tile_height) / tile_height
    image = []

    for row in xrange(num_rows):
        for column in xrange(num_columns):

            # Split it up into strips to convert to planar data
            for strip in xrange(min(tile_height, height)):
                anchor = (
                    row * num_columns * tile_width * tile_height +
                    column * tile_width +
                    strip * width
                )
                line = qmap[anchor : anchor + tile_width]
                bottom, top = 0, 0
                for bit, quad in enumerate(line):
                    bottom += (quad & 1) << (7 - bit)
                    top += (quad /2 & 1) << (7 - bit)
                image += [bottom, top]

    if pic_dimensions:
        w, h = pic_dimensions

        tiles = get_tiles(image)
        pic_length = w * h
        tile_width = width / 8
        trailing = len(tiles) % pic_length
        new_image = []
        for block in xrange(len(tiles) / pic_length):
            offset = (h * tile_width) * ((block * w) / tile_width) + ((block * w) % tile_width)
            pic = []
            for row in xrange(h):
                index = offset + (row * tile_width)
                pic += tiles[index:index + w]
            new_image += transpose(pic, w)
        new_image += tiles[len(tiles) - trailing:]
        image = connect(new_image)

    # Remove any tile padding used to make the png rectangular.
    image = image[:len(image) - tile_padding * 0x10]

    if interleave:
        image = deinterleave_tiles(image, num_columns)

    if norepeat:
        image, tmap = condense_tiles_to_map(image)
    if not tilemap:
        tmap = None

    return image, palette, tmap


def export_palette(palette, filename, force=False):
    """
    Export a palette from png to rgb macros in a .pal file.
    """

    # Some palettes are 2 colors (black/white are added later).
    # This might be better off as a yaml option.
    if os.path.exists(filename):
        with open(filename) as rgbs:
            colors = read_rgb_macros(rgbs.readlines())
        if len(colors) == 2:
            palette = palette[1:3]

    if os.path.exists(filename) or force:
        text = png_to_rgb(palette)
        with open(filename, 'w') as out:
            out.write(text)



def convert_2bpp_to_1bpp(data):
    """
    Convert planar 2bpp image data to 1bpp. Assume images are two colors.
    """
    return data[::2]

def convert_1bpp_to_2bpp(data):
    """
    Convert 1bpp image data to planar 2bpp (black/white).
    """
    output = []
    for i in data:
        output += [i, i]
    return output


def export_2bpp_to_1bpp(filename):
    name, extension = os.path.splitext(filename)
    image = open(filename, 'rb').read()
    image = convert_2bpp_to_1bpp(image)
    to_file(name + '.1bpp', image)

def export_1bpp_to_2bpp(filename):
    name, extension = os.path.splitext(filename)
    image = open(filename, 'rb').read()
    image = convert_1bpp_to_2bpp(image)
    to_file(name + '.2bpp', image)


def export_1bpp_to_png(filename, fileout=None):

    if fileout == None:
        fileout = os.path.splitext(filename)[0] + '.png'

    arguments = read_filename_arguments(filename)

    image = open(filename, 'rb').read()
    image = convert_1bpp_to_2bpp(image)

    result = convert_2bpp_to_png(image, **arguments)
    width, height, palette, greyscale, bitdepth, px_map = result

    w = png.Writer(width, height, palette=palette, compression=9, greyscale=greyscale, bitdepth=bitdepth)
    with open(fileout, 'wb') as f:
        w.write(f, px_map)


def export_png_to_1bpp(filename, fileout=None):

    if fileout == None:
        fileout = os.path.splitext(filename)[0] + '.1bpp'

    arguments = read_filename_arguments(filename)
    image = png_to_1bpp(filename, **arguments)

    to_file(fileout, image)

def png_to_1bpp(filename, **kwargs):
    image, palette, tmap = png_to_2bpp(filename, **kwargs)
    return convert_2bpp_to_1bpp(image)



def convert_to_2bpp(filenames=[]):
    for filename in filenames:
        name, extension = os.path.splitext(filename)
        if extension == '.1bpp':
            export_1bpp_to_2bpp(filename)
        elif extension == '.2bpp':
            pass
        elif extension == '.png':
            export_png_to_2bpp(filename)
        else:
            raise Exception, "Don't know how to convert {} to 2bpp!".format(filename)

def convert_to_1bpp(filenames=[]):
    for filename in filenames:
        name, extension = os.path.splitext(filename)
        if extension == '.1bpp':
            pass
        elif extension == '.2bpp':
            export_2bpp_to_1bpp(filename)
        elif extension == '.png':
            export_png_to_1bpp(filename)
        else:
            raise Exception, "Don't know how to convert {} to 1bpp!".format(filename)

def convert_to_png(filenames=[]):
    for filename in filenames:
        name, extension = os.path.splitext(filename)
        if extension == '.1bpp':
            export_1bpp_to_png(filename)
        elif extension == '.2bpp':
            export_2bpp_to_png(filename)
        elif extension == '.png':
            pass
        else:
            raise Exception, "Don't know how to convert {} to png!".format(filename)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('mode')
    ap.add_argument('filenames', nargs='*')
    args = ap.parse_args()

    method = {
        '2bpp': convert_to_2bpp,
        '1bpp': convert_to_1bpp,
        'png':  convert_to_png,
    }.get(args.mode)

    if method == None:
        raise Exception, "Unknown conversion method!"

    method(args.filenames)


if __name__ == "__main__":
    main()

