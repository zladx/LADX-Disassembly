class BackgroundCoder:
    """
    Decode and encode BG tilemaps and attributes with the compression
    format used by LADX.
    """

    @staticmethod
    def decode(encoded_tilemap_bytes):
        """
        Decode a BG tilemap encoded using LADX commands format.
        Returns a dict of {address1: value1, address2: value2, …}
        """
        data = encoded_tilemap_bytes
        tilemap_bytes = {}

        idx = 0
        while data[idx] != 0x00:
            addr = data[idx] << 8 | data[idx + 1]
            amount = (data[idx + 2] & 0x3F) + 1
            repeat = (data[idx + 2] & 0x40) == 0x40
            vertical = (data[idx + 2] & 0x80) == 0x80
            idx += 3
            for n in range(amount):
                tilemap_bytes[addr] = data[idx]
                if not repeat:
                    idx += 1
                addr += 0x20 if vertical else 0x01
            if repeat:
                idx += 1

        return tilemap_bytes

    @staticmethod
    def encode(tilemap_bytes, tilemap_location=0x9800, tilemap_width=20):
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
        chunks = [tilemap_bytes[i:i + chunk_size] for i in range(0, len(tilemap_bytes), chunk_size)]

        encoded_bytes = bytearray()
        address = tilemap_location

        for i, chunk in enumerate(chunks):
            count = len(chunk)
            encoded_bytes.append(address >> 8)
            encoded_bytes.append(address & 0xFF)
            encoded_bytes.append(count - 1)
            encoded_bytes.extend(chunk)
            address += 0x20

        encoded_bytes.append(0x00)
        return encoded_bytes
