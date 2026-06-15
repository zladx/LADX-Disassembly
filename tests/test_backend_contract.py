from zelda_env.backends.base import EmulatorBackend


class ContractBackend:
    platform = "test"
    buttons = ("A",)

    def reset(self): ...

    def close(self): ...

    def press(self, buttons): ...

    def release_all(self): ...

    def advance(self, frames): ...

    def read_u8(self, address):
        return 0

    def read_u16(self, address, *, endian="little"):
        return 0

    def read_bytes(self, address, length):
        return bytes(length)

    def save_state(self):
        return b""

    def load_state(self, data): ...

    def screen_rgb(self):
        return None


def test_backend_protocol_accepts_contract_backend():
    assert isinstance(ContractBackend(), EmulatorBackend)

