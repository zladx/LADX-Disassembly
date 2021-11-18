class BackgroundCoder:
    """
    Decode and encode BG tilemaps and attributes with the compression
    format used by LADX.
    """

    @staticmethod
    def decode(encoded_tilemap_bytes, tilemap_width=0x20, filler=0x00):
        """
        Decode a BG tilemap encoded using LADX commands format.
        Returns a dict of {address1: value1, address2: value2, …}

        :param int tilemap_width: width of the decoded BG ram section that will be returned
        :param int filler: byte used to fill areas where no command writes to
        """

        # Read all commands and build an address-to-byte dict
        data = encoded_tilemap_bytes
        byte_at_address = {}

        idx = 0
        while data[idx] != 0x00:
            addr = data[idx] << 8 | data[idx + 1]
            amount = (data[idx + 2] & 0x3F) + 1
            repeat = (data[idx + 2] & 0x40) == 0x40
            vertical = (data[idx + 2] & 0x80) == 0x80
            idx += 3
            for n in range(amount):
                byte_at_address[addr] = data[idx]
                if not repeat:
                    idx += 1
                addr += 0x20 if vertical else 0x01
            if repeat:
                idx += 1

        # Place the bytes into the BG video memory
        addresses = list(sorted(byte_at_address))
        min_address = addresses[0]
        max_address = addresses[-1] + 1
        length = max_address - min_address
        bg_ram = bytearray([filler] * length)

        for address, byte in byte_at_address.items():
            bg_ram[address - min_address] = byte

        # Restrict the tilemap width
        result = None
        bg_ram_row_width = 0x20
        if tilemap_width != bg_ram_row_width:
            rows = [bg_ram[i:i + bg_ram_row_width] for i in range(0, len(bg_ram), bg_ram_row_width)]
            clamped_rows = list(map(lambda row: row[:tilemap_width], rows))
            result = reduce(lambda acc, row: acc + row, clamped_rows, bytearray())
        else:
            result = bg_ram

        return result

    @staticmethod
    def encode(bytes, tilemap_location=0x9800, tilemap_width=20):
        """
        Encode a raw BG tilemap to the LADX commands format.

        NOTES:
        - This is not a very good encoder, but the background back has so much free space
          that we really don't care. Improvements can be done to find long sequences of
          bytes and store those as repeated.

        - Encoding a tilemap decoded from the original game will NOT result in a similar
          compressed tilemap. Original tilemaps were probably hand-coded, and so cannot
          be reproduced byte-for-byte by this encoder.
        """

        # Split the tilemap into chunks
        chunk_size = tilemap_width
        chunks = [bytes[i:i + chunk_size] for i in range(0, len(bytes), chunk_size)]

        encoded_bytes = bytearray()
        address = tilemap_location

        for chunk in chunks:
            encoded_bytes.append(address >> 8)
            encoded_bytes.append(address & 0xFF)
            encoded_bytes.append(len(chunk) - 1)
            encoded_bytes.extend(chunk)
            address += 0x20

        encoded_bytes.append(0x00)
        return encoded_bytes
