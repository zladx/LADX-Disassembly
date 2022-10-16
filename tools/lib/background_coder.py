import sys
from itertools import groupby
from functools import reduce

class BackgroundCoder:
    """
    Decode and encode BG tilemaps and attributes with the compression
    format used by LADX.

    Format:
    ===

    A compressed background is a list of commands, terminated by NULL (0x00).

    Each command has the following format:
    - byte 0: target address high byte
    - byte 1: target address low byte
    - byte 2: options:
        - bits 0-6: number of data bytes - 1
        - bit 7: is the target the same byte repeated?
        - bit 8: is the target area vertical (instead of horizontal)?
    - a variable number of data bytes
    """

    @staticmethod
    def decode(encoded_tilemap_bytes, tilemap_width=0x20, filler=0x00, has_file_terminator=True):
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
        while idx < len(data) and data[idx] != 0x00:
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

        if has_file_terminator and idx >= len(data):
            print("Warning: reached end of file without encountering a file terminator (0x00).\n  Use the `--no-file-terminator` option to properly decode and encode the file.", file=sys.stderr)

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
    def encode(bytes, tilemap_location=0x9800, tilemap_width=20, filler=None, has_file_terminator=True):
        """
        Encode a raw BG tilemap to the LADX commands format.

        NOTES:
        - Encoding a tilemap decoded from the original game will NOT result in a similar
          compressed tilemap. Original tilemaps were probably hand-coded, and so cannot
          be reproduced byte-for-byte by this encoder.
        """

        def merge_non_repeatable_groups(acc, group):
            """
            [[A, A, A, A, A], [B], [C, C], [D], [C, C, C, C]]
            -> [[A, A, A, A, A], [B, C, C, D], [C, C, C, C]]
            """
            latest_group = acc[-1] if len(acc) else []
            is_repetition = len(group) > 1
            has_min_repetition_length = len(group) > 4
            is_previous_group_a_repetition = len(latest_group) > 1 and len(set(latest_group)) == 1

            if len(acc) == 0 or (is_repetition and has_min_repetition_length) or (not is_repetition and is_previous_group_a_repetition):
                new_group = []
                acc.append(new_group)
                latest_group = new_group

            latest_group.extend(group)
            return acc

        # Split the tilemap into rows
        rows = [bytes[i:i + tilemap_width] for i in range(0, len(bytes), tilemap_width)]

        grouped_rows = []
        for i, row in enumerate(rows):
            # Group identical consecutive values together
            groups = [list(g) for k, g in groupby(row)]
            # Merge the non-identical consecutive values together
            merged_groups = reduce(merge_non_repeatable_groups, groups, [])
            grouped_rows.append(merged_groups)

        encoded_bytes = bytearray()
        for i, grouped_row in enumerate(grouped_rows):
            address = tilemap_location + i * 0x20
            for group in grouped_row:
                amount = len(group) - 1
                is_repetition = len(group) > 1 and len(set(group)) == 1
                if is_repetition and group[0] == filler:
                    address += len(group)
                    continue

                encoded_bytes.append(address >> 8)
                encoded_bytes.append(address & 0xFF)
                encoded_bytes.append(amount | (0x40 if is_repetition else 0))
                encoded_bytes.extend([group[0]] if is_repetition else group)

                address += len(group)

        if has_file_terminator:
            encoded_bytes.append(0x00)

        return encoded_bytes
