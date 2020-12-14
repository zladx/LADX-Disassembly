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

    def encode(tilemap_bytes):
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
        result = bytearray()
        low = min(self.tiles.keys())
        high = max(self.tiles.keys()) + 1
        while low < high:
            if low not in self.tiles:
                low += 1
                continue
            count = 1
            while low + count in self.tiles and count < 255:
                count += 1
            result.append(low >> 8)
            result.append(low & 0xFF)
            result.append(count - 1)
            for n in range(count):
                result.append(self.tiles[low + n])
            low += count
        result.append(0x00)
        if self.__is_attributes:
            rom.background_attributes[self.__index] = result
        else:
            rom.background_tiles[self.__index] = result
