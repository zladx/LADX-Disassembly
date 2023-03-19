# Style Guide

Some of the code will disagree with this guide. Older code is less likely to be correct. Use your best judgement.

When you come across an edge case that isn't referenced in this guide, please add it.

## Comments

```asm
; Use spaces for indentation and alignment.

; Comments lead with spaces after the semicolon.

; 80 char soft limit. This isn't enforced, but you should try to keep lines from being any longer.
; rgbasm doesn't have newline escapes so there's no avoiding exceeding the limit for longer macros.

; Code comments should be wrapped to whatever
; is most readable rather than what's closest
; to the 80 char limit.

; Comments should go above the code they're describing, not below, and be aligned with the code.

; Routines are commented with unindented comments
SomeRoutine::
    ; Code is commented with an indentation
    ld  a, [hl]
    add b
    ld  [hl], a
    ret
```

## Labels

```asm
; ROM Labels
PascalCase:   ; label
PascalCase::  ; global label
.snakeCase    ; local jump
.PascalCase:  ; an atomic chunk of code or data that's local
; don't define unused labels when a comment would do

; Labels are prefixed with lower case letters depending on location
wPascalCase: ; wram
sPascalCase: ; sram
vPascalCase: ; vram
hPascalCase: ; hram
PascalCase:  ; rom

; Some constants are also prefixed
DEF rBGP EQU $FF47 ; hardware register

; Most other constants should be upper case
DEF UPPER_CASE EQU 1

; Long lists of constants should be aligned
DEF SHORT_CONSTANT       EQU 1
DEF LONGER_CONSTANT      EQU 2
DEF PRETTY_LONG_CONSTANT EQU 3
DEF TINY                 EQU 4

DEF BUT_ONLY_RELATED_CONSTANTS EQU 5
```

## Code

```asm
SomeRoutine::
    ; Instructions are indented with 4 spaces
    ldh  a, [hIsGBC]
    and  a
    jr   z, .ramSwitchEnd

    ; Instructions operands are vertically aligned,
    ; so that the first operand is always on the same column
    jr   z, .end
    push bc
    ; (Which means this alignement is incorrect)
    jr z, .end
    push bc

; Hexadecimal constants are uppercase
func_02A_56AF::
    ld   a, $0C
```

## Directives

```asm
; meta and high-level directives should be uppercase
SECTION "section", ROMX
INCLUDE "filename"
INCBIN "filename"
MACRO my_macro
  nop
ENDM
DEF TEST EQUS "test"
PURGE TEST
DEF TEST EQU 2

; the rest is up to you, just be consistent (prefer lowercase)
set X, 1
rept 10
  nop
endr
```

## Macros

```asm
MACRO when_in_doubt_lowercase

; data macros should be lowercase
    db 1
    dw 2
    my_macro SOME_CONSTANT

; code macros are currently lowercase but this seems to be causing confusion with actual instructions
    ld b, TEST
    farcall DistantFunction
    ret
```
