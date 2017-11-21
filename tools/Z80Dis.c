#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// NOTE(joey): Doing my best to use ansi c but I may miss something.
// wont be able to tell until I compile this under linux

typedef int8_t   i8;
typedef uint8_t  u8;
typedef int16_t  i16;
typedef uint16_t u16;
typedef int32_t  i32;
typedef uint32_t u32;
typedef int64_t  i64;
typedef uint64_t u64;
typedef float    f32;
typedef double   f64;
typedef i32      b32;

#ifndef __cplusplus
#define true 1
#define false 0
#endif

#define internal static
#define local_persist static
#define global_variable static

#define Min(A, B) (A < B ? A : B)
#define Max(A, B) (A > B ? A : B)

#define Assert(x) if (!(x)) { fprintf(stderr, "Assert fired in file %s at line %d\nEval: (%s)\n", __FILE__, __LINE__, #x); *(int*)0 = 0; }

#define NUMBER_WITHIN_RANGE(x, l, h) (x >= l && x <= h)

global_variable u8 RomData[0x100000];
global_variable FILE *Output;

typedef struct {
    u8 Opcode;
    u8 Size;
    char *Text;
} instruction;

global_variable instruction InstructionTable[] = {
    {0x00, 1, "nop"},
    {0x01, 3, "ld   bc, $NN"},
    {0x02, 1, "ld   [bc], a"},
    {0x03, 1, "inc  bc"},
    {0x04, 1, "inc  b"},
    {0x05, 1, "dec  b"},
    {0x06, 2, "ld   b, $N"},
    {0x07, 1, "rlca"},
    {0x08, 3, "ld   [$NN], sp"},
    {0x09, 1, "add  hl, bc"},
    {0x0A, 1, "ld   a, [bc]"},
    {0x0B, 1, "dec  bc"},
    {0x0C, 1, "inc  c"},
    {0x0D, 1, "dec  c"},
    {0x0E, 2, "ld   c, $N"},
    {0x0F, 1, "rrca"},
    {0x10, 2, "stop"},
    {0x11, 3, "ld   de, $NN"},
    {0x12, 1, "ld   [de], a"},
    {0x13, 1, "inc  de"},
    {0x14, 1, "inc  d"},
    {0x15, 1, "dec  d"},
    {0x16, 2, "ld   d, $N"},
    {0x17, 1, "rla"},
    {0x18, 2, "jr   $N"},
    {0x19, 1, "add  hl, de"},
    {0x1A, 1, "ld   a, [de]"},
    {0x1B, 1, "dec  de"},
    {0x1C, 1, "inc  e"},
    {0x1D, 1, "dec  e"},
    {0x1E, 2, "ld   e, $N"},
    {0x1F, 1, "rra"},
    {0x20, 2, "jr   nz, $N"},
    {0x21, 3, "ld   hl, $NN"},
    {0x22, 1, "ldi  [hl], a"},
    {0x23, 1, "inc  hl"},
    {0x24, 1, "inc  h"},
    {0x25, 1, "dec  h"},
    {0x26, 2, "ld   h, $NN"},
    {0x27, 1, "daa"},
    {0x28, 2, "jr   z, $N"},
    {0x29, 1, "add  hl, hl"},
    {0x2A, 1, "ldi  a, [hl]"},
    {0x2B, 1, "dec  hl"},
    {0x2C, 1, "inc  l"},
    {0x2D, 1, "dec  l"},
    {0x2E, 2, "ld   l, $NN"},
    {0x2F, 1, "cpl"},
    {0x30, 2, "jr   nc, $NN"},
    {0x31, 3, "ld   sp, $NN"},
    {0x32, 1, "ldd  [hl], a"},
    {0x33, 1, "inc  sp"},
    {0x34, 1, "inc  [hl]"},
    {0x35, 1, "dec  [hl]"},
    {0x36, 2, "ld   [hl], $N"},
    {0x37, 1, "scf"},
    {0x38, 2, "jr   c, $N"},
    {0x39, 1, "add  hl, sp"},
    {0x3A, 1, "ldd  a, [hl]"},
    {0x3B, 1, "dec  sp"},
    {0x3C, 1, "inc  a"},
    {0x3D, 1, "dec  a"},
    {0x3E, 2, "ld   a, $N"},
    {0x3F, 1, "ccf"},
    {0x40, 1, "ld   b, b"},
    {0x41, 1, "ld   b, c"},
    {0x42, 1, "ld   b, d"},
    {0x43, 1, "ld   b, e"},
    {0x44, 1, "ld   b, h"},
    {0x45, 1, "ld   b, l"},
    {0x46, 1, "ld   b, [hl]"},
    {0x47, 1, "ld   b, a"},
    {0x48, 1, "ld   c, b"},
    {0x49, 1, "ld   c, c"},
    {0x4A, 1, "ld   c, d"},
    {0x4B, 1, "ld   c, e"},
    {0x4C, 1, "ld   c, h"},
    {0x4D, 1, "ld   c, l"},
    {0x4E, 1, "ld   c, [hl]"},
    {0x4F, 1, "ld   c, a"},
    {0x50, 1, "ld   d, b"},
    {0x51, 1, "ld   d, c"},
    {0x52, 1, "ld   d, d"},
    {0x53, 1, "ld   d, e"},
    {0x54, 1, "ld   d, h"},
    {0x55, 1, "ld   d, l"},
    {0x56, 1, "ld   d, [hl]"},
    {0x57, 1, "ld   d, a"},
    {0x58, 1, "ld   e, b"},
    {0x59, 1, "ld   e, c"},
    {0x5A, 1, "ld   e, d"},
    {0x5B, 1, "ld   e, e"},
    {0x5C, 1, "ld   e, h"},
    {0x5D, 1, "ld   e, l"},
    {0x5E, 1, "ld   e, [hl]"},
    {0x5F, 1, "ld   e, a"},
    {0x60, 1, "ld   h, b"},
    {0x61, 1, "ld   h, c"},
    {0x62, 1, "ld   h, d"},
    {0x63, 1, "ld   h, e"},
    {0x64, 1, "ld   h, h"},
    {0x65, 1, "ld   h, l"},
    {0x66, 1, "ld   h, [hl]"},
    {0x67, 1, "ld   h, a"},
    {0x68, 1, "ld   l, b"},
    {0x69, 1, "ld   l, c"},
    {0x6A, 1, "ld   l, d"},
    {0x6B, 1, "ld   l, e"},
    {0x6C, 1, "ld   l, h"},
    {0x6D, 1, "ld   l, l"},
    {0x6E, 1, "ld   l, [hl]"},
    {0x6F, 1, "ld   l, a"},
    {0x70, 1, "ld   [hl], b"},
    {0x71, 1, "ld   [hl], c"},
    {0x72, 1, "ld   [hl], d"},
    {0x73, 1, "ld   [hl], e"},
    {0x74, 1, "ld   [hl], h"},
    {0x75, 1, "ld   [hl], l"},
    {0x76, 1, "db   $76"}, // This is halt, but rgbds always inserts nop after it
    {0x77, 1, "ld   [hl], a"},
    {0x78, 1, "ld   a, b"},
    {0x79, 1, "ld   a, c"},
    {0x7A, 1, "ld   a, d"},
    {0x7B, 1, "ld   a, e"},
    {0x7C, 1, "ld   a, h"},
    {0x7D, 1, "ld   a, l"},
    {0x7E, 1, "ld   a, [hl]"},
    {0x7F, 1, "ld   a, a"},
    {0x80, 1, "add  a, b"},
    {0x81, 1, "add  a, c"},
    {0x82, 1, "add  a, d"},
    {0x83, 1, "add  a, e"},
    {0x84, 1, "add  a, h"},
    {0x85, 1, "add  a, l"},
    {0x86, 1, "add  a, [hl]"},
    {0x87, 1, "add  a, a"},
    {0x88, 1, "adc  a, b"},
    {0x89, 1, "adc  a, c"},
    {0x8A, 1, "adc  a, d"},
    {0x8B, 1, "adc  a, e"},
    {0x8C, 1, "adc  a, h"},
    {0x8D, 1, "adc  a, l"},
    {0x8E, 1, "adc  a, [hl]"},
    {0x8F, 1, "adc  a, a"},
    {0x90, 1, "sub  a, b"},
    {0x91, 1, "sub  a, c"},
    {0x92, 1, "sub  a, d"},
    {0x93, 1, "sub  a, e"},
    {0x94, 1, "sub  a, h"},
    {0x95, 1, "sub  a, l"},
    {0x96, 1, "sub  a, [hl]"},
    {0x97, 1, "sub  a, a"},
    {0x98, 1, "sbc  a, b"},
    {0x99, 1, "sbc  a, c"},
    {0x9A, 1, "sbc  a, d"},
    {0x9B, 1, "sbc  a, e"},
    {0x9C, 1, "sbc  a, h"},
    {0x9D, 1, "sbc  a, l"},
    {0x9E, 1, "sbc  a, [hl]"},
    {0x9F, 1, "sbc  a, a"},
    {0xA0, 1, "and  b"},
    {0xA1, 1, "and  c"},
    {0xA2, 1, "and  d"},
    {0xA3, 1, "and  e"},
    {0xA4, 1, "and  h"},
    {0xA5, 1, "and  l"},
    {0xA6, 1, "and  [hl]"},
    {0xA7, 1, "and  a"},
    {0xA8, 1, "xor  b"},
    {0xA9, 1, "xor  c"},
    {0xAA, 1, "xor  d"},
    {0xAB, 1, "xor  e"},
    {0xAC, 1, "xor  h"},
    {0xAD, 1, "xor  l"},
    {0xAE, 1, "xor  [hl]"},
    {0xAF, 1, "xor  a"},
    {0xB0, 1, "or   b"},
    {0xB1, 1, "or   c"},
    {0xB2, 1, "or   d"},
    {0xB3, 1, "or   e"},
    {0xB4, 1, "or   h"},
    {0xB5, 1, "or   l"},
    {0xB6, 1, "or   [hl]"},
    {0xB7, 1, "or   a"},
    {0xB8, 1, "cp   b"},
    {0xB9, 1, "cp   c"},
    {0xBA, 1, "cp   d"},
    {0xBB, 1, "cp   e"},
    {0xBC, 1, "cp   h"},
    {0xBD, 1, "cp   l"},
    {0xBE, 1, "cp   [hl]"},
    {0xBF, 1, "cp   a"},
    {0xC0, 1, "ret  nz"},
    {0xC1, 1, "pop  bc"},
    {0xC2, 3, "jp   nz, $NN"},
    {0xC3, 3, "jp   $NN"},
    {0xC4, 3, "call nz, $NN"},
    {0xC5, 1, "push bc"},
    {0xC6, 2, "add  a, $N"},
    {0xC7, 1, "rst  0"},
    {0xC8, 1, "ret  z"},
    {0xC9, 1, "ret"},
    {0xCA, 3, "jp   z, $NN"},
    {0xCB, 2, "db   $CB, $N"},
    {0xCC, 3, "call z, $NN"},
    {0xCD, 3, "call $NN"},
    {0xCE, 2, "adc  a, $NN"},
    {0xCF, 1, "rst  8"},
    {0xD0, 1, "ret  nc"},
    {0xD1, 1, "pop  de"},
    {0xD2, 3, "jp   nc, $NN"},
    {0xD3, 1, "db   $D3"}, // unused
    {0xD4, 3, "call nc, $NN"},
    {0xD5, 1, "push de"},
    {0xD6, 2, "sub  a, $NN"},
    {0xD7, 1, "rst  $10"},
    {0xD8, 1, "ret  c"},
    {0xD9, 1, "reti"},
    {0xDA, 3, "jp   c, $NN"},
    {0xDB, 1, "db   $DB"}, // unused
    {0xDC, 3, "call c, $NN"},
    {0xDD, 1, "db   $DD"}, // unused
    {0xDE, 2, "sbc  a, $N"},
    {0xDF, 1, "rst  $18"},
    {0xE0, 2, "ld   [$FF00+$N], a"},
    {0xE1, 1, "pop  hl"},
    {0xE2, 1, "ld   [$FF00+C], a"},
    {0xE3, 1, "db   $E3"}, // unused
    {0xE4, 1, "db   $E4"}, // unused
    {0xE5, 1, "push hl"},
    {0xE6, 2, "and  $N"},
    {0xE7, 1, "rst  $20"},
    {0xE8, 1, "add  sp, d"},
    {0xE9, 1, "jp   hl"},
    {0xEA, 3, "ld   [$NN], a"},
    {0xEB, 1, "db   $EB"},
    {0xEC, 1, "db   $EC"},
    {0xED, 1, "db   $ED"},
    {0xEE, 2, "xor  $N"},
    {0xEF, 1, "rst  $28"},
    {0xF0, 2, "ld   a, [$FF00+$N]"},
    {0xF1, 1, "pop  af"},
    {0xF2, 2, "ld   a, [$FF00+C]"},
    {0xF3, 1, "di"},
    {0xF4, 1, "db   $F4"}, // unused
    {0xF5, 1, "push af"},
    {0xF6, 2, "or   $N"},
    {0xF7, 1, "rst  $30"},
    {0xF8, 2, "ld   hl, sp+$N"},
    {0xF9, 1, "ld   sp, hl"},
    {0xFA, 3, "ld   a, [$NN]"},
    {0xFB, 1, "ei"},
    {0xFC, 1, "db   $FC"}, // unused
    {0xFD, 1, "db   $FD"}, // unused
    {0xFE, 2, "cp   $N"},
    {0xFF, 1, "rst  $38"},
};

global_variable char *AdditionalInstructions[] = {
    "rlc  b",
    "rlc  c",
    "rlc  d",
    "rlc  e",
    "rlc  h",
    "rlc  l",
    "rlc  [hl]",
    "rlc  a",
    "rrc  b",
    "rrc  c",
    "rrc  d",
    "rrc  e",
    "rrc  h",
    "rrc  l",
    "rrc  [hl]",
    "rrc  a",
    "rl   b",
    "rl   c",
    "rl   d",
    "rl   e",
    "rl   h",
    "rl   l",
    "rl   [hl]",
    "rl   a",
    "rr   b",
    "rr   c",
    "rr   d",
    "rr   e",
    "rr   h",
    "rr   l",
    "rr   [hl]",
    "rr   a",
    "sla  b",
    "sla  c",
    "sla  d",
    "sla  e",
    "sla  h",
    "sla  l",
    "sla  [hl]",
    "sla  a",
    "sra  b",
    "sra  c",
    "sra  d",
    "sra  e",
    "sra  h",
    "sra  l",
    "sra  [hl]",
    "sra  a",
    "swap b",
    "swap c",
    "swap d",
    "swap e",
    "swap h",
    "swap l",
    "swap [hl]",
    "swap a",
    "srl  b",
    "srl  c",
    "srl  d",
    "srl  e",
    "srl  h",
    "srl  l",
    "srl  [hl]",
    "srl  a",
    "bit  0, b",
    "bit  0, c",
    "bit  0, d",
    "bit  0, e",
    "bit  0, h",
    "bit  0, l",
    "bit  0, [hl]",
    "bit  0, a",
    "bit  1, b",
    "bit  1, c",
    "bit  1, d",
    "bit  1, e",
    "bit  1, h",
    "bit  1, l",
    "bit  1, [hl]",
    "bit  1, a",
    "bit  2, b",
    "bit  2, c",
    "bit  2, d",
    "bit  2, e",
    "bit  2, h",
    "bit  2, l",
    "bit  2, [hl]",
    "bit  2, a",
    "bit  3, b",
    "bit  3, c",
    "bit  3, d",
    "bit  3, e",
    "bit  3, h",
    "bit  3, l",
    "bit  3, [hl]",
    "bit  3, a",
    "bit  4, b",
    "bit  4, c",
    "bit  4, d",
    "bit  4, e",
    "bit  4, h",
    "bit  4, l",
    "bit  4, [hl]",
    "bit  4, a",
    "bit  5, b",
    "bit  5, c",
    "bit  5, d",
    "bit  5, e",
    "bit  5, h",
    "bit  5, l",
    "bit  5, [hl]",
    "bit  5, a",
    "bit  6, b",
    "bit  6, c",
    "bit  6, d",
    "bit  6, e",
    "bit  6, h",
    "bit  6, l",
    "bit  6, [hl]",
    "bit  6, a",
    "bit  7, b",
    "bit  7, c",
    "bit  7, d",
    "bit  7, e",
    "bit  7, h",
    "bit  7, l",
    "bit  7, [hl]",
    "bit  7, a",
    "res  0, b",
    "res  0, c",
    "res  0, d",
    "res  0, e",
    "res  0, h",
    "res  0, l",
    "res  0, [hl]",
    "res  0, a",
    "res  1, b",
    "res  1, c",
    "res  1, d",
    "res  1, e",
    "res  1, h",
    "res  1, l",
    "res  1, [hl]",
    "res  1, a",
    "res  2, b",
    "res  2, c",
    "res  2, d",
    "res  2, e",
    "res  2, h",
    "res  2, l",
    "res  2, [hl]",
    "res  2, a",
    "res  3, b",
    "res  3, c",
    "res  3, d",
    "res  3, e",
    "res  3, h",
    "res  3, l",
    "res  3, [hl]",
    "res  3, a",
    "res  4, b",
    "res  4, c",
    "res  4, d",
    "res  4, e",
    "res  4, h",
    "res  4, l",
    "res  4, [hl]",
    "res  4, a",
    "res  5, b",
    "res  5, c",
    "res  5, d",
    "res  5, e",
    "res  5, h",
    "res  5, l",
    "res  5, [hl]",
    "res  5, a",
    "res  6, b",
    "res  6, c",
    "res  6, d",
    "res  6, e",
    "res  6, h",
    "res  6, l",
    "res  6, [hl]",
    "res  6, a",
    "res  7, b",
    "res  7, c",
    "res  7, d",
    "res  7, e",
    "res  7, h",
    "res  7, l",
    "res  7, [hl]",
    "res  7, a",
    "set  0, b",
    "set  0, c",
    "set  0, d",
    "set  0, e",
    "set  0, h",
    "set  0, l",
    "set  0, [hl]",
    "set  0, a",
    "set  1, b",
    "set  1, c",
    "set  1, d",
    "set  1, e",
    "set  1, h",
    "set  1, l",
    "set  1, [hl]",
    "set  1, a",
    "set  2, b",
    "set  2, c",
    "set  2, d",
    "set  2, e",
    "set  2, h",
    "set  2, l",
    "set  2, [hl]",
    "set  2, a",
    "set  3, b",
    "set  3, c",
    "set  3, d",
    "set  3, e",
    "set  3, h",
    "set  3, l",
    "set  3, [hl]",
    "set  3, a",
    "set  4, b",
    "set  4, c",
    "set  4, d",
    "set  4, e",
    "set  4, h",
    "set  4, l",
    "set  4, [hl]",
    "set  4, a",
    "set  5, b",
    "set  5, c",
    "set  5, d",
    "set  5, e",
    "set  5, h",
    "set  5, l",
    "set  5, [hl]",
    "set  5, a",
    "set  6, b",
    "set  6, c",
    "set  6, d",
    "set  6, e",
    "set  6, h",
    "set  6, l",
    "set  6, [hl]",
    "set  6, a",
    "set  7, b",
    "set  7, c",
    "set  7, d",
    "set  7, e",
    "set  7, h",
    "set  7, l",
    "set  7, [hl]",
    "set  7, a"
};

enum memory_location {
    ML_Undefined = -1,
    ML_16kbRomBank0,
    ML_16kbRomBankSwitchable,
    ML_8kbVRAM,
    ML_8kbExternalRam,
    ML_4kbWRAM_0,
    ML_4kbWRAM_1,
    ML_Echo_C000,
    ML_OAM,
    ML_NotUsable,
    ML_IO,
    ML_HighRam,
    ML_IntEnable
};

typedef struct {
    u16 Label;
    u16 Offset;
    b32 IsFunction;
    u32 MemoryLocation;
} label;

#define MAX_LABEL_COUNT 1024 * 1024

global_variable label Labels[MAX_LABEL_COUNT];
global_variable int NumberOfLabels;

internal i32
GetMemoryLocation(u16 Address) {
    i32 Value = ML_Undefined;
    if (NUMBER_WITHIN_RANGE(Address, 0x000, 0x3FFF)) {
        Value = ML_16kbRomBank0;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0x4000, 0x7FFF)) {
        Value = ML_16kbRomBankSwitchable;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0x8000, 0x9FFF)) {
        Value = ML_8kbVRAM;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xA000, 0xBFFF)) {
        Value = ML_8kbExternalRam;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xC000, 0xDFFF)) {
        Value = ML_4kbWRAM_0;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xD000, 0xDFFF)) {
        Value = ML_4kbWRAM_1;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xE000, 0xFDFF)) {
        Value = ML_Echo_C000;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xFE00, 0xFE9F)) {
        Value = ML_OAM;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xFEA0, 0xFEFF)) {
        Value = ML_NotUsable;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xFF00, 0xFF7F)) {
        Value = ML_IO;
    }
    else if (NUMBER_WITHIN_RANGE(Address, 0xFF80, 0xFFFE)) {
        Value = ML_HighRam;
    }
    else if (Address == 0xFFFF) {
        Value = ML_IntEnable;
    }
    return Value;
}

internal u32
GetLabelAddress(i32 Offset, u16 BankNumber) {
    i32 Value = 0;
    if (Offset >= 0x4000 && Offset < 0x8000 && BankNumber > 0) {
        Value = (BankNumber * 0x4000) + (Offset - 0x4000);
    }
    else {
        Value = Offset;
    }
    return Value;
}

internal char *
GetAddressStrValue(u16 Address, u16 BankNum) {
    local_persist char Format[64];
    char *Value = 0;

    if (Address == 0xff00) {
        Value = "rJOYP";
    }
    else if (Address == 0xff01) {
        Value = "rSB";
    }
    else if (Address == 0xff02) {
        Value = "rSC";
    }
    else if (Address == 0xff04) {
        Value = "rDIV";
    }
    else if (Address == 0xff05) {
        Value = "rTIMA";
    }
    else if (Address == 0xff06) {
        Value = "rTMA";
    }
    else if (Address == 0xff07) {
        Value = "rTAC";
    }
    else if (Address == 0xff0f) {
        Value = "rIF";
    }
    else if (Address == 0xff10) {
        Value = "rNR10";
    }
    else if (Address == 0xff11) {
        Value = "rNR11";
    }
    else if (Address == 0xff12) {
        Value = "rNR12";
    }
    else if (Address == 0xff13) {
        Value = "rNR13";
    }
    else if (Address == 0xff14) {
        Value = "rNR14";
    }
    else if (Address == 0xff16) {
        Value = "rNR21";
    }
    else if (Address == 0xff17) {
        Value = "rNR22";
    }
    else if (Address == 0xff18) {
        Value = "rNR23";
    }
    else if (Address == 0xff19) {
        Value = "rNR24";
    }
    else if (Address == 0xff1a) {
        Value = "rNR30";
    }
    else if (Address == 0xff1b) {
        Value = "rNR31";
    }
    else if (Address == 0xff1c) {
        Value = "rNR32";
    }
    else if (Address == 0xff1d) {
        Value = "rNR33";
    }
    else if (Address == 0xff1e) {
        Value = "rNR34";
    }
    else if (Address == 0xff20) {
        Value = "rNR41";
    }
    else if (Address == 0xff21) {
        Value = "rNR42";
    }
    else if (Address == 0xff22) {
        Value = "rNR43";
    }
    else if (Address == 0xff23) {
        Value = "rNR44";
    }
    else if (Address == 0xff24) {
        Value = "rNR50";
    }
    else if (Address == 0xff25) {
        Value = "rNR51";
    }
    else if (Address == 0xff26) {
        Value = "rNR52";
    }
    else if (Address == 0xff40) {
        Value = "rLCDC";
    }
    else if (Address == 0xff41) {
        Value = "rSTAT";
    }
    else if (Address == 0xff42) {
        Value = "rSCY";
    }
    else if (Address == 0xff43) {
        Value = "rSCX";
    }
    else if (Address == 0xff44) {
        Value = "rLY";
    }
    else if (Address == 0xff45) {
        Value = "rLYC";
    }
    else if (Address == 0xff46) {
        Value = "rDMA";
    }
    else if (Address == 0xff47) {
        Value = "rBGP";
    }
    else if (Address == 0xff48) {
        Value = "rOBP0";
    }
    else if (Address == 0xff49) {
        Value = "rOBP1";
    }
    else if (Address == 0xff4a) {
        Value = "rWY";
    }
    else if (Address == 0xff4b) {
        Value = "rWX";
    }
    else if (Address == 0xff4d) {
        Value = "rKEY1";
    }
    else if (Address == 0xff4f) {
        Value = "rVBK";
    }
    else if (Address == 0xff51) {
        Value = "rHDMA1";
    }
    else if (Address == 0xff52) {
        Value = "rHDMA2";
    }
    else if (Address == 0xff53) {
        Value = "rHDMA3";
    }
    else if (Address == 0xff54) {
        Value = "rHDMA4";
    }
    else if (Address == 0xff55) {
        Value = "rHDMA5";
    }
    else if (Address == 0xff56) {
        Value = "rRP";
    }
    else if (Address == 0xff68) {
        Value = "rBGPI";
    }
    else if (Address == 0xff69) {
        Value = "rBGPD";
    }
    else if (Address == 0xff6a) {
        Value = "rOBPI";
    }
    else if (Address == 0xff6b) {
        Value = "rOBPD";
    }
    else if (Address == 0xff6c) {
        Value = "rUNKN1";
    }
    else if (Address == 0xff70) {
        Value = "rSVBK";
    }
    else if (Address == 0xff72) {
        Value = "rUNKN2";
    }
    else if (Address == 0xff73) {
        Value = "rUNKN3";
    }
    else if (Address == 0xff74) {
        Value = "rUNKN4";
    }
    else if (Address == 0xff75) {
        Value = "rUNKN5";
    }
    else if (Address == 0xff76) {
        Value = "rUNKN6";
    }
    else if (Address == 0xff77) {
        Value = "rUNKN7";
    }
    else if (Address == 0xffff) {
        Value = "rIE";
    }
    else if (Address >= 0x8000) {
        Value = 0;
    }
    else {
        for (i32 i = 0; i < NumberOfLabels; ++i) {
            if (Labels[i].Label == Address) {
                sprintf(Format, "label_%X", GetLabelAddress(Address, BankNum));
                Value = Format;
                break;
            }
        }
    }

    return Value;
}

internal void
AddLabel(u16 Offset, u16 Label, b32 IsFunction) {
    Assert(NumberOfLabels < MAX_LABEL_COUNT);

    if (Offset >= 0x150 && Label >= 0x150) {
        Labels[NumberOfLabels].Offset = Offset;
        Labels[NumberOfLabels].Label = Label;
        Labels[NumberOfLabels].MemoryLocation = GetMemoryLocation(Label);
        Labels[NumberOfLabels].IsFunction = IsFunction;
        ++NumberOfLabels;
    }
}

internal b32
IsWithinValidLabelRange(u16 Address) {
    b32 Result = Address >= 0 && Address < 0x8000;
    return Result;
}

internal b32
IsLabelDefined(u16 Label) {
    i32 i;
    b32 Result = false;

    for (i = 0; i < NumberOfLabels; ++i) {
        if (Labels[i].Label == Label) {
            Result = true;
            break;
        }
    }
    return Result;
}

internal u32
GetAddressFromRomBankNumber(u16 Number) {
    u32 Value = Number * 0x4000;
    return Value;
}

global_variable u8 DataToDisassemble[0x8000];

internal void
DisassembleBank(u16 BankNum) {
    u32 RomPosition;
    u32 StartPosition = GetAddressFromRomBankNumber(BankNum);
    u32 CopyFrom = StartPosition;

    // NOTE: We are disasembling as if we are actually in the rom bank
    if (StartPosition >= 0x8000) {
        StartPosition = 0x4000;
    }

    memcpy(DataToDisassemble + StartPosition, RomData + CopyFrom, 0x4000);

    NumberOfLabels = 0;
    memset(Labels, 0, sizeof(Labels));

    // First pass
    for (RomPosition = StartPosition; RomPosition < StartPosition + 0x4000; ) {
        u8 Instruction = DataToDisassemble[RomPosition];
        instruction Ins = InstructionTable[Instruction];
        u16 NN = DataToDisassemble[RomPosition + 1] | (DataToDisassemble[RomPosition + 2] << 8);
        u8 N = DataToDisassemble[RomPosition + 1];
        b32 IsFunction = false;

        if (Ins.Size == 1) {
        }
        else if (Ins.Size == 2) {
            // taking care of the jr <relative> instructions
            if (Instruction == 0x18 ||
                Instruction == 0x20 ||
                Instruction == 0x28 ||
                Instruction == 0x30 ||
                Instruction == 0x38) {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                AddLabel((u16)RomPosition, (u16)LabelLoc, IsFunction);
            }
        }
        else if (Ins.Size == 3) {
            if (Instruction == 0xC4 || // call nz, $NN
                Instruction == 0xCC || // call z, $NN
                Instruction == 0xCD || // call $NN
                Instruction == 0xD4 || // call nc, $NN
                Instruction == 0xDC) { // call c, $NN
                IsFunction = true;
            }

            if (!IsLabelDefined(NN)) {
                AddLabel((u16)RomPosition, NN, IsFunction);
            }
        }

        RomPosition += Ins.Size;
    }

    fprintf(Output, "section \"bank%d\",romx,bank[$%02X]\n", BankNum, BankNum);

    // disassembly pass
    for (RomPosition = StartPosition; RomPosition < StartPosition + 0x4000; ) {
        u8 Instruction = DataToDisassemble[RomPosition];
        instruction Ins = InstructionTable[Instruction];
        u16 NN = DataToDisassemble[RomPosition + 1] | (DataToDisassemble[RomPosition + 2] << 8);
        u8 N = DataToDisassemble[RomPosition + 1];

        for (i32 i = 0; i < NumberOfLabels; ++i) {
            if (Labels[i].Label == RomPosition) {
                fprintf(Output, "\nlabel_%X::\n", GetLabelAddress(RomPosition, BankNum));
                break;
            }
        }

        // output 4 space indent
        fprintf(Output, "    ");

        // For debugging, output offsets
        //fprintf(Output, "ROM_%04X: ", RomPosition);

        switch (Instruction) {
            case 0x00: {
                fprintf(Output, "nop\n");
                break;
            }
            case 0x01: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   bc, %s\n", Value);
                }
                else {
                    fprintf(Output, "ld   bc, $%04X\n", NN);
                }
                break;
            }
            case 0x02: {
                fprintf(Output, "ld   [bc], a\n");
                break;
            }
            case 0x03: {
                fprintf(Output, "inc  bc\n");
                break;
            }
            case 0x04: {
                fprintf(Output, "inc  b\n");
                break;
            }
            case 0x05: {
                fprintf(Output, "dec  b\n");
                break;
            }
            case 0x06: {
                fprintf(Output, "ld   b, $%02X\n", N);
                break;
            }
            case 0x07: {
                fprintf(Output, "rlca\n");
                break;
            }
            case 0x08: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   [%s], sp\n", Value);
                }
                else {
                    fprintf(Output, "ld   [$%04X], sp\n", NN);
                }
                break;
            }
            case 0x09: {
                fprintf(Output, "add  hl, bc\n");
                break;
            }
            case 0x0A: {
                fprintf(Output, "ld   a, [bc]\n");
                break;
            }
            case 0x0B: {
                fprintf(Output, "dec  bc\n");
                break;
            }
            case 0x0C: {
                fprintf(Output, "inc  c\n");
                break;
            }
            case 0x0D: {
                fprintf(Output, "dec  c\n");
                break;
            }
            case 0x0E: {
                fprintf(Output, "ld   c, $%02X\n", N);
                break;
            }
            case 0x0F: {
                fprintf(Output, "rrca\n");
                break;
            }
            case 0x10: {
                if (N == 0) {
                    fprintf(Output, "stop\n");
                }
                else {
                    fprintf(Output, "db   $10\n    db   $%02X\n", N);
                }
                break;
            }
            case 0x11: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   de, %s\n", Value);
                }
                else {
                    fprintf(Output, "ld   de, $%04X\n", NN);
                }
                break;
            }
            case 0x12: {
                fprintf(Output, "ld   [de], a\n");
                break;
            }
            case 0x13: {
                fprintf(Output, "inc  de\n");
                break;
            }
            case 0x14: {
                fprintf(Output, "inc  d\n");
                break;
            }
            case 0x15: {
                fprintf(Output, "dec  d\n");
                break;
            }
            case 0x16: {
                fprintf(Output, "ld   d, $%02X\n", N);
                break;
            }
            case 0x17: {
                fprintf(Output, "rla\n");
                break;
            }
            case 0x18: {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                fprintf(Output, "jr   label_%X\n", GetLabelAddress(LabelLoc, BankNum));
                break;
            }
            case 0x19: {
                fprintf(Output, "add  hl, de\n");
                break;
            }
            case 0x1A: {
                fprintf(Output, "ld   a, [de]\n");
                break;
            }
            case 0x1B: {
                fprintf(Output, "dec  de\n");
                break;
            }
            case 0x1C: {
                fprintf(Output, "inc  e\n");
                break;
            }
            case 0x1D: {
                fprintf(Output, "dec  e\n");
                break;
            }
            case 0x1E: {
                fprintf(Output, "ld   e, $%02X\n", N);
                break;
            }
            case 0x1F: {
                fprintf(Output, "rra\n");
                break;
            }
            case 0x20: {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                fprintf(Output, "jr   nz, label_%X\n", GetLabelAddress(LabelLoc, BankNum));
                break;
            }
            case 0x21: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   hl, %s\n", Value);
                }
                else {
                    fprintf(Output, "ld   hl, $%04X\n", NN);
                }
                break;
            }
            case 0x22: {
                fprintf(Output, "ldi  [hl], a\n");
                break;
            }
            case 0x23: {
                fprintf(Output, "inc  hl\n");
                break;
            }
            case 0x24: {
                fprintf(Output, "inc  h\n");
                break;
            }
            case 0x25: {
                fprintf(Output, "dec  h\n");
                break;
            }
            case 0x26: {
                fprintf(Output, "ld   h, $%02X\n", N);
                break;
            }
            case 0x27: {
                fprintf(Output, "daa\n");
                break;
            }
            case 0x28: {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                fprintf(Output, "jr   z, label_%X\n", GetLabelAddress(LabelLoc, BankNum));
                break;
            }
            case 0x29: {
                fprintf(Output, "add  hl, hl\n");
                break;
            }
            case 0x2A: {
                fprintf(Output, "ld   a, [hli]\n");
                break;
            }
            case 0x2B: {
                fprintf(Output, "dec  hl\n");
                break;
            }
            case 0x2C: {
                fprintf(Output, "inc  l\n");
                break;
            }
            case 0x2D: {
                fprintf(Output, "dec  l\n");
                break;
            }
            case 0x2E: {
                fprintf(Output, "ld   l, $%02X\n", N);
                break;
            }
            case 0x2F: {
                fprintf(Output, "cpl\n");
                break;
            }
            case 0x30: {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                fprintf(Output, "jr   nc, label_%X\n", GetLabelAddress(LabelLoc, BankNum));
                break;
            }
            case 0x31: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   sp, %s\n", Value);
                }
                else {
                    fprintf(Output, "ld   sp, $%04X\n", NN);
                }
                break;
            }
            case 0x32: {
                fprintf(Output, "ldd  [hl], a\n");
                break;
            }
            case 0x33: {
                fprintf(Output, "inc  sp\n");
                break;
            }
            case 0x34: {
                fprintf(Output, "inc  [hl]\n");
                break;
            }
            case 0x35: {
                fprintf(Output, "dec  [hl]\n");
                break;
            }
            case 0x36: {
                fprintf(Output, "ld   [hl], $%02X\n", N);
                break;
            }
            case 0x37: {
                fprintf(Output, "scf\n");
                break;
            }
            case 0x38: {
                i8 JmpLoc = (i8)N;
                i16 LabelLoc = (i16)RomPosition + JmpLoc + 2;
                fprintf(Output, "jr   c, label_%X\n", GetLabelAddress(LabelLoc, BankNum));
                break;
            }
            case 0x39: {
                fprintf(Output, "add  hl, sp\n");
                break;
            }
            case 0x3A: {
                fprintf(Output, "db   $3A ; ldd  a, [hl]\n");
                break;
            }
            case 0x3B: {
                fprintf(Output, "dec  sp\n");
                break;
            }
            case 0x3C: {
                fprintf(Output, "inc  a\n");
                break;
            }
            case 0x3D: {
                fprintf(Output, "dec  a\n");
                break;
            }
            case 0x3E: {
                fprintf(Output, "ld   a, $%02X\n", N);
                break;
            }
            case 0x3F: {
                fprintf(Output, "ccf\n");
                break;
            }
            case 0x40: {
                fprintf(Output, "ld   b, b\n");
                break;
            }
            case 0x41: {
                fprintf(Output, "ld   b, c\n");
                break;
            }
            case 0x42: {
                fprintf(Output, "ld   b, d\n");
                break;
            }
            case 0x43: {
                fprintf(Output, "ld   b, e\n");
                break;
            }
            case 0x44: {
                fprintf(Output, "ld   b, h\n");
                break;
            }
            case 0x45: {
                fprintf(Output, "ld   b, l\n");
                break;
            }
            case 0x46: {
                fprintf(Output, "ld   b, [hl]\n");
                break;
            }
            case 0x47: {
                fprintf(Output, "ld   b, a\n");
                break;
            }
            case 0x48: {
                fprintf(Output, "ld   c, b\n");
                break;
            }
            case 0x49: {
                fprintf(Output, "ld   c, c\n");
                break;
            }
            case 0x4A: {
                fprintf(Output, "ld   c, d\n");
                break;
            }
            case 0x4B: {
                fprintf(Output, "ld   c, e\n");
                break;
            }
            case 0x4C: {
                fprintf(Output, "ld   c, h\n");
                break;
            }
            case 0x4D: {
                fprintf(Output, "ld   c, l\n");
                break;
            }
            case 0x4E: {
                fprintf(Output, "ld   c, [hl]\n");
                break;
            }
            case 0x4F: {
                fprintf(Output, "ld   c, a\n");
                break;
            }
            case 0x50: {
                fprintf(Output, "ld   d, b\n");
                break;
            }
            case 0x51: {
                fprintf(Output, "ld   d, c\n");
                break;
            }
            case 0x52: {
                fprintf(Output, "ld   d, d\n");
                break;
            }
            case 0x53: {
                fprintf(Output, "ld   d, e\n");
                break;
            }
            case 0x54: {
                fprintf(Output, "ld   d, h\n");
                break;
            }
            case 0x55: {
                fprintf(Output, "ld   d, l\n");
                break;
            }
            case 0x56: {
                fprintf(Output, "ld   d, [hl]\n");
                break;
            }
            case 0x57: {
                fprintf(Output, "ld   d, a\n");
                break;
            }
            case 0x58: {
                fprintf(Output, "ld   e, b\n");
                break;
            }
            case 0x59: {
                fprintf(Output, "ld   e, c\n");
                break;
            }
            case 0x5A: {
                fprintf(Output, "ld   e, d\n");
                break;
            }
            case 0x5B: {
                fprintf(Output, "ld   e, e\n");
                break;
            }
            case 0x5C: {
                fprintf(Output, "ld   e, h\n");
                break;
            }
            case 0x5D: {
                fprintf(Output, "ld   e, l\n");
                break;
            }
            case 0x5E: {
                fprintf(Output, "ld   e, [hl]\n");
                break;
            }
            case 0x5F: {
                fprintf(Output, "ld   e, a\n");
                break;
            }
            case 0x60: {
                fprintf(Output, "ld   h, b\n");
                break;
            }
            case 0x61: {
                fprintf(Output, "ld   h, c\n");
                break;
            }
            case 0x62: {
                fprintf(Output, "ld   h, d\n");
                break;
            }
            case 0x63: {
                fprintf(Output, "ld   h, e\n");
                break;
            }
            case 0x64: {
                fprintf(Output, "ld   h, h\n");
                break;
            }
            case 0x65: {
                fprintf(Output, "ld   h, l\n");
                break;
            }
            case 0x66: {
                fprintf(Output, "ld   h, [hl]\n");
                break;
            }
            case 0x67: {
                fprintf(Output, "ld   h, a\n");
                break;
            }
            case 0x68: {
                fprintf(Output, "ld   l, b\n");
                break;
            }
            case 0x69: {
                fprintf(Output, "ld   l, c\n");
                break;
            }
            case 0x6A: {
                fprintf(Output, "ld   l, d\n");
                break;
            }
            case 0x6B: {
                fprintf(Output, "ld   l, e\n");
                break;
            }
            case 0x6C: {
                fprintf(Output, "ld   l, h\n");
                break;
            }
            case 0x6D: {
                fprintf(Output, "ld   l, l\n");
                break;
            }
            case 0x6E: {
                fprintf(Output, "ld   l, [hl]\n");
                break;
            }
            case 0x6F: {
                fprintf(Output, "ld   l, a\n");
                break;
            }
            case 0x70: {
                fprintf(Output, "ld   [hl], b\n");
                break;
            }
            case 0x71: {
                fprintf(Output, "ld   [hl], c\n");
                break;
            }
            case 0x72: {
                fprintf(Output, "ld   [hl], d\n");
                break;
            }
            case 0x73: {
                fprintf(Output, "ld   [hl], e\n");
                break;
            }
            case 0x74: {
                fprintf(Output, "ld   [hl], h\n");
                break;
            }
            case 0x75: {
                fprintf(Output, "ld   [hl], l\n");
                break;
            }
            case 0x76: {
                fprintf(Output, "db   $76 ; Halt\n");
                break;
            }
            case 0x77: {
                fprintf(Output, "ld   [hl], a\n");
                break;
            }
            case 0x78: {
                fprintf(Output, "ld   a, b\n");
                break;
            }
            case 0x79: {
                fprintf(Output, "ld   a, c\n");
                break;
            }
            case 0x7A: {
                fprintf(Output, "ld   a, d\n");
                break;
            }
            case 0x7B: {
                fprintf(Output, "ld   a, e\n");
                break;
            }
            case 0x7C: {
                fprintf(Output, "ld   a, h\n");
                break;
            }
            case 0x7D: {
                fprintf(Output, "ld   a, l\n");
                break;
            }
            case 0x7E: {
                fprintf(Output, "ld   a, [hl]\n");
                break;
            }
            case 0x7F: {
                fprintf(Output, "ld   a, a\n");
                break;
            }
            case 0x80: {
                fprintf(Output, "add  a, b\n");
                break;
            }
            case 0x81: {
                fprintf(Output, "add  a, c\n");
                break;
            }
            case 0x82: {
                fprintf(Output, "add  a, d\n");
                break;
            }
            case 0x83: {
                fprintf(Output, "add  a, e\n");
                break;
            }
            case 0x84: {
                fprintf(Output, "add  a, h\n");
                break;
            }
            case 0x85: {
                fprintf(Output, "add  a, l\n");
                break;
            }
            case 0x86: {
                fprintf(Output, "add  a, [hl]\n");
                break;
            }
            case 0x87: {
                fprintf(Output, "add  a, a\n");
                break;
            }
            case 0x88: {
                fprintf(Output, "adc  a, b\n");
                break;
            }
            case 0x89: {
                fprintf(Output, "adc  a, c\n");
                break;
            }
            case 0x8A: {
                fprintf(Output, "adc  a, d\n");
                break;
            }
            case 0x8B: {
                fprintf(Output, "adc  a, e\n");
                break;
            }
            case 0x8C: {
                fprintf(Output, "adc  a, h\n");
                break;
            }
            case 0x8D: {
                fprintf(Output, "adc  a, l\n");
                break;
            }
            case 0x8E: {
                fprintf(Output, "adc  a, [hl]\n");
                break;
            }
            case 0x8F: {
                fprintf(Output, "adc  a, a\n");
                break;
            }
            case 0x90: {
                fprintf(Output, "sub  a, b\n");
                break;
            }
            case 0x91: {
                fprintf(Output, "sub  a, c\n");
                break;
            }
            case 0x92: {
                fprintf(Output, "sub  a, d\n");
                break;
            }
            case 0x93: {
                fprintf(Output, "sub  a, e\n");
                break;
            }
            case 0x94: {
                fprintf(Output, "sub  a, h\n");
                break;
            }
            case 0x95: {
                fprintf(Output, "sub  a, l\n");
                break;
            }
            case 0x96: {
                fprintf(Output, "sub  a, [hl]\n");
                break;
            }
            case 0x97: {
                fprintf(Output, "sub  a, a\n");
                break;
            }
            case 0x98: {
                fprintf(Output, "sbc  a, b\n");
                break;
            }
            case 0x99: {
                fprintf(Output, "sbc  a, c\n");
                break;
            }
            case 0x9A: {
                fprintf(Output, "sbc  a, d\n");
                break;
            }
            case 0x9B: {
                fprintf(Output, "sbc  a, e\n");
                break;
            }
            case 0x9C: {
                fprintf(Output, "sbc  a, h\n");
                break;
            }
            case 0x9D: {
                fprintf(Output, "sbc  a, l\n");
                break;
            }
            case 0x9E: {
                fprintf(Output, "sbc  a, [hl]\n");
                break;
            }
            case 0x9F: {
                fprintf(Output, "sbc  a, a\n");
                break;
            }
            case 0xA0: {
                fprintf(Output, "and  b\n");
                break;
            }
            case 0xA1: {
                fprintf(Output, "and  c\n");
                break;
            }
            case 0xA2: {
                fprintf(Output, "and  d\n");
                break;
            }
            case 0xA3: {
                fprintf(Output, "and  e\n");
                break;
            }
            case 0xA4: {
                fprintf(Output, "and  h\n");
                break;
            }
            case 0xA5: {
                fprintf(Output, "and  l\n");
                break;
            }
            case 0xA6: {
                fprintf(Output, "and  [hl]\n");
                break;
            }
            case 0xA7: {
                fprintf(Output, "and  a\n");
                break;
            }
            case 0xA8: {
                fprintf(Output, "xor  b\n");
                break;
            }
            case 0xA9: {
                fprintf(Output, "xor  c\n");
                break;
            }
            case 0xAA: {
                fprintf(Output, "xor  d\n");
                break;
            }
            case 0xAB: {
                fprintf(Output, "xor  e\n");
                break;
            }
            case 0xAC: {
                fprintf(Output, "xor  h\n");
                break;
            }
            case 0xAD: {
                fprintf(Output, "xor  l\n");
                break;
            }
            case 0xAE: {
                fprintf(Output, "xor  [hl]\n");
                break;
            }
            case 0xAF: {
                fprintf(Output, "xor  a\n");
                break;
            }
            case 0xB0: {
                fprintf(Output, "or   b\n");
                break;
            }
            case 0xB1: {
                fprintf(Output, "or   c\n");
                break;
            }
            case 0xB2: {
                fprintf(Output, "or   d\n");
                break;
            }
            case 0xB3: {
                fprintf(Output, "or   e\n");
                break;
            }
            case 0xB4: {
                fprintf(Output, "or   h\n");
                break;
            }
            case 0xB5: {
                fprintf(Output, "or   l\n");
                break;
            }
            case 0xB6: {
                fprintf(Output, "or   [hl]\n");
                break;
            }
            case 0xB7: {
                fprintf(Output, "or   a\n");
                break;
            }
            case 0xB8: {
                fprintf(Output, "cp   b\n");
                break;
            }
            case 0xB9: {
                fprintf(Output, "cp   c\n");
                break;
            }
            case 0xBA: {
                fprintf(Output, "cp   d\n");
                break;
            }
            case 0xBB: {
                fprintf(Output, "cp   e\n");
                break;
            }
            case 0xBC: {
                fprintf(Output, "cp   h\n");
                break;
            }
            case 0xBD: {
                fprintf(Output, "cp   l\n");
                break;
            }
            case 0xBE: {
                fprintf(Output, "cp   [hl]\n");
                break;
            }
            case 0xBF: {
                fprintf(Output, "cp   a\n");
                break;
            }
            case 0xC0: {
                fprintf(Output, "ret  nz\n");
                break;
            }
            case 0xC1: {
                fprintf(Output, "pop  bc\n");
                break;
            }
            case 0xC2: {
                fprintf(Output, "jp   nz, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xC3: {
                fprintf(Output, "jp   label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xC4: {
                fprintf(Output, "call nz, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xC5: {
                fprintf(Output, "push bc\n");
                break;
            }
            case 0xC6: {
                fprintf(Output, "add  a, $%02X\n", N);
                break;
            }
            case 0xC7: {
                fprintf(Output, "rst  0\n");
                break;
            }
            case 0xC8: {
                fprintf(Output, "ret  z\n");
                break;
            }
            case 0xC9: {
                fprintf(Output, "ret\n");
                break;
            }
            case 0xCA: {
                fprintf(Output, "jp   z, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xCB: {
                fprintf(Output, "%s\n", AdditionalInstructions[N]);
                break;
            }
            case 0xCC: {
                fprintf(Output, "call z, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xCD: {
                fprintf(Output, "call label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xCE: {
                fprintf(Output, "adc  a, $%02X\n", N);
                break;
            }
            case 0xCF: {
                fprintf(Output, "rst  8\n");
                break;
            }
            case 0xD0: {
                fprintf(Output, "ret  nc\n");
                break;
            }
            case 0xD1: {
                fprintf(Output, "pop  de\n");
                break;
            }
            case 0xD2: {
                fprintf(Output, "jp   nc, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xD3: {
                fprintf(Output, "db   $D3 ; Undefined instruction\n");
                break;
            }
            case 0xD4: {
                fprintf(Output, "call nc, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xD5: {
                fprintf(Output, "push de\n");
                break;
            }
            case 0xD6: {
                fprintf(Output, "sub  a, $%02X\n", N);
                break;
            }
            case 0xD7: {
                fprintf(Output, "rst  $10\n");
                break;
            }
            case 0xD8: {
                fprintf(Output, "ret  c\n");
                break;
            }
            case 0xD9: {
                fprintf(Output, "reti\n");
                break;
            }
            case 0xDA: {
                fprintf(Output, "jp  c, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xDB: {
                fprintf(Output, "db   $DB\n");
                break;
            }
            case 0xDC: {
                fprintf(Output, "call c, label_%X\n", GetLabelAddress(NN, BankNum));
                break;
            }
            case 0xDD: {
                fprintf(Output, "db   $%02X\n", N);
                break;
            }
            case 0xDE: {
                fprintf(Output, "sbc  a, $%02X\n", N);
                break;
            }
            case 0xDF: {
                fprintf(Output, "rst  $18\n");
                break;
            }
            case 0xE0: {
                char *Value = GetAddressStrValue(0xFF00 + N, BankNum);
                if (Value) {
                    fprintf(Output, "ld   [%s], a\n", Value);
                }
                else {
                    fprintf(Output, "ld   [$FF%02X], a\n", N);
                }
                break;
            }
            case 0xE1: {
                fprintf(Output, "pop  hl\n");
                break;
            }
            case 0xE2: {
                fprintf(Output, "ld  [$FF00+C], a\n");
                break;
            }
            case 0xE3: {
                fprintf(Output, "db   $E3 ; Undefined instruction\n");
                break;
            }
            case 0xE4: {
                fprintf(Output, "db   $E4 ; Undefined instruction\n");
                break;
            }
            case 0xE5: {
                fprintf(Output, "push hl\n");
                break;
            }
            case 0xE6: {
                fprintf(Output, "and  $%02X\n", N);
                break;
            }
            case 0xE7: {
                fprintf(Output, "rst  $20\n");
                break;
            }
            case 0xE8: {
                fprintf(Output, "db   $E8 ; add  sp, d\n");
                break;
            }
            case 0xE9: {
                fprintf(Output, "jp   hl\n");
                break;
            }
            case 0xEA: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   [%s], a\n", Value);
                }
                else {
                    fprintf(Output, "ld   [$%04X], a\n", NN);
                }
                break;
            }
            case 0xEB: {
                fprintf(Output, "db   $EB ; Undefined instruction\n");
                break;
            }
            case 0xEC: {
                fprintf(Output, "db   $EC ; Undefined instruction\n");
                break;
            }
            case 0xED: {
                fprintf(Output, "db   $ED ; Undefined instruction\n");
                break;
            }
            case 0xEE: {
                fprintf(Output, "xor  $%02X\n", N);
                break;
            }
            case 0xEF: {
                fprintf(Output, "rst  $28\n");
                break;
            }
            case 0xF0: {
                fprintf(Output, "ld   a, [$FF%02X]\n", N);
                break;
            }
            case 0xF1: {
                fprintf(Output, "pop  af\n");
                break;
            }
            case 0xF2: {
                fprintf(Output, "ld   a, [$FF00+C]\n");
                break;
            }
            case 0xF3: {
                fprintf(Output, "di\n");
                break;
            }
            case 0xF4: {
                fprintf(Output, "db   $F4 ; Undefined instruction\n");
                break;
            }
            case 0xF5: {
                fprintf(Output, "push af\n");
                break;
            }
            case 0xF6: {
                fprintf(Output, "or   $%02X\n", N);
                break;
            }
            case 0xF7: {
                fprintf(Output, "rst  $30\n");
                break;
            }
            case 0xF8: {
                fprintf(Output, "ld    hl, sp+$%02X\n", N);
                break;
            }
            case 0xF9: {
                fprintf(Output, "ld   sp, hl\n");
                break;
            }
            case 0xFA: {
                char *Value = GetAddressStrValue(NN, BankNum);
                if (Value) {
                    fprintf(Output, "ld   a, [%s]\n", Value);
                }
                else {
                    fprintf(Output, "ld   a, [$%04X]\n", NN);
                }
                break;
            }
            case 0xFB: {
                fprintf(Output, "ei\n");
                break;
            }
            case 0xFC: {
                fprintf(Output, "db   $FC ; Undefined instruction\n");
                break;
            }
            case 0xFD: {
                fprintf(Output, "db   $FD ; Undefined instruction\n");
                break;
            }
            case 0xFE: {
                fprintf(Output, "cp   $%02X\n", N);
                break;
            }
            case 0xFF: {
                fprintf(Output, "rst  $38\n");
                break;
            }
        }

        RomPosition += Ins.Size;
    }
}

int
main(int argc, char **argv) {
    if (argc > 1) {
        FILE *f;
        f = fopen(argv[1], "rb");
        if (f) {
            fread(RomData, 1, 0x100000, f);
            fclose(f);
            Output = stdout;

            for (u16 BankNum = 0; BankNum <= 60; ++BankNum) {
                char Format[256];
                sprintf(Format, "Bank%d.asm", BankNum);
                FILE *f2 = fopen(Format, "wb");
                Output = f2;
                DisassembleBank(BankNum);
                fflush(f2);
                fclose(f2);
            }
        }
    }
    return 0;
}

