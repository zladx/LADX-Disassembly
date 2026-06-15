"""Symbol and lightweight ASM memory layout parsing for LADX."""

from __future__ import annotations

import ast
import operator
import re
from dataclasses import dataclass
from pathlib import Path


_SECTION_RE = re.compile(r"section\s+.+?,\s*(?:bank\[\d+\],\s*)?([A-Za-z0-9_]+)\[\$([0-9A-Fa-f]+)\]", re.I)
_DEF_RE = re.compile(r"DEF\s+([A-Za-z_][A-Za-z0-9_]*)\s+EQU\s+(.+)", re.I)
_LABEL_RE = re.compile(r"^\s*([.@A-Za-z_][.@A-Za-z0-9_]*)(?:::|:)")
_DS_RE = re.compile(r"^\s*ds\s+([^;]+)", re.I)
_SYM_RE = re.compile(r"^\s*([0-9A-Fa-f]{2}):([0-9A-Fa-f]{4})\s+(.+?)\s*$")


@dataclass(frozen=True)
class Symbol:
    name: str
    address: int
    bank: int | None = None


class SymbolTable:
    """Name-to-address lookup for LADX symbols."""

    def __init__(self, symbols: dict[str, Symbol]) -> None:
        self._symbols = symbols

    def __contains__(self, name: str) -> bool:
        return name in self._symbols

    def resolve(self, name: str) -> int:
        try:
            return self._symbols[name].address
        except KeyError as exc:
            raise KeyError(f"Unknown symbol: {name}") from exc

    def get(self, name: str, default: int | None = None) -> int | None:
        symbol = self._symbols.get(name)
        return default if symbol is None else symbol.address

    @classmethod
    def from_sym_file(cls, path: str | Path) -> "SymbolTable":
        symbols: dict[str, Symbol] = {}
        for line in Path(path).read_text(encoding="utf-8").splitlines():
            match = _SYM_RE.match(line)
            if not match:
                continue
            bank = int(match.group(1), 16)
            address = int(match.group(2), 16)
            name = match.group(3)
            symbols[name] = Symbol(name=name, address=address, bank=bank)
        return cls(symbols)

    @classmethod
    def from_asm_memory_files(cls, paths: list[str | Path], constants_paths: list[str | Path] | None = None) -> "SymbolTable":
        constants = _load_constants(constants_paths or [])
        symbols: dict[str, Symbol] = {}
        for path in paths:
            _parse_memory_file(Path(path), constants, symbols)
        return cls(symbols)


def default_ladx_symbol_table(repo_root: str | Path = ".") -> SymbolTable:
    root = Path(repo_root)
    sym_path = root / "azle.sym"
    if sym_path.exists():
        return SymbolTable.from_sym_file(sym_path)
    memory_paths = [
        root / "src/constants/memory/wram.asm",
        root / "src/constants/memory/hram.asm",
        root / "src/constants/memory/sram.asm",
    ]
    constant_paths = sorted((root / "src/constants").glob("*.asm")) + memory_paths
    return SymbolTable.from_asm_memory_files(memory_paths, constant_paths)


def _load_constants(paths: list[str | Path]) -> dict[str, int]:
    constants: dict[str, int] = {}
    for path in paths:
        if not Path(path).exists():
            continue
        for line in Path(path).read_text(encoding="utf-8").splitlines():
            match = _DEF_RE.search(line.split(";")[0])
            if not match:
                continue
            name, expr = match.groups()
            try:
                constants[name] = _eval_expr(expr, constants)
            except ValueError:
                continue
    return constants


def _parse_memory_file(path: Path, constants: dict[str, int], symbols: dict[str, Symbol]) -> None:
    current_address: int | None = None
    current_global: str | None = None
    pending_labels: list[str] = []
    union_stack: list[tuple[int, int]] = []
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.split(";")[0].strip()
        if not line:
            continue
        upper_line = line.upper()
        if upper_line == "UNION" and current_address is not None:
            union_stack.append((current_address, current_address))
            continue
        if upper_line == "NEXTU" and current_address is not None and union_stack:
            start, max_address = union_stack[-1]
            union_stack[-1] = (start, max(max_address, current_address))
            current_address = start
            continue
        if upper_line == "ENDU" and current_address is not None and union_stack:
            start, max_address = union_stack.pop()
            current_address = max(max_address, current_address)
            continue
        section = _SECTION_RE.search(line)
        if section:
            current_address = int(section.group(2), 16)
            pending_labels.clear()
            continue
        label = _LABEL_RE.match(line)
        if label and current_address is not None:
            label_name = label.group(1)
            if label_name.startswith("."):
                if current_global is None:
                    continue
                full_name = f"{current_global}{label_name}"
            else:
                full_name = label_name
                if not label_name.startswith("@"):
                    current_global = label_name
            symbols[full_name] = Symbol(name=full_name, address=current_address)
            pending_labels.append(full_name)
            rest = line[label.end() :].strip()
            if rest:
                ds_match = _DS_RE.match(rest)
                if ds_match:
                    current_address += _eval_expr(ds_match.group(1), constants, current_address=current_address)
                    pending_labels.clear()
            continue
        ds = _DS_RE.match(line)
        if ds and current_address is not None:
            current_address += _eval_expr(ds.group(1), constants, current_address=current_address)
            pending_labels.clear()


_BIN_OPS = {
    ast.Add: operator.add,
    ast.Sub: operator.sub,
    ast.Mult: operator.mul,
    ast.FloorDiv: operator.floordiv,
    ast.BitOr: operator.or_,
    ast.BitAnd: operator.and_,
    ast.LShift: operator.lshift,
    ast.RShift: operator.rshift,
}


def _eval_expr(expr: str, constants: dict[str, int], *, current_address: int | None = None) -> int:
    normalized = re.sub(r"\$([0-9A-Fa-f]+)", r"0x\1", expr.strip())
    normalized = re.sub(
        r"%([01_]+)",
        lambda match: "0b" + match.group(1).replace("_", ""),
        normalized,
    )
    if current_address is not None:
        normalized = normalized.replace("@", str(current_address))
    normalized = normalized.replace("LOW(", "(").replace("HIGH(", "(")
    try:
        tree = ast.parse(normalized, mode="eval")
    except SyntaxError as exc:
        raise ValueError(f"Unsupported expression: {expr}") from exc
    return int(_eval_node(tree.body, constants))


def _eval_node(node: ast.AST, constants: dict[str, int]) -> int:
    if isinstance(node, ast.Constant) and isinstance(node.value, int):
        return int(node.value)
    if isinstance(node, ast.Name):
        if node.id in constants:
            return constants[node.id]
        raise ValueError(f"Unknown constant in expression: {node.id}")
    if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub):
        return -_eval_node(node.operand, constants)
    if isinstance(node, ast.BinOp):
        op_type = type(node.op)
        if op_type not in _BIN_OPS:
            raise ValueError(f"Unsupported operator in expression: {op_type}")
        return _BIN_OPS[op_type](_eval_node(node.left, constants), _eval_node(node.right, constants))
    raise ValueError(f"Unsupported expression: {ast.dump(node)}")
