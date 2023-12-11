; Joypad constants
;
; ReadJoypadState.readState reads both button matrices and combine
; them into one bitfield

; Select the corresponding button matrix in rP1
DEF J_DPAD    EQU $10
DEF J_BUTTONS EQU $20

; Joypad buttons mask
DEF J_RIGHT  EQU 1 << 0     ;  1
DEF J_LEFT   EQU 1 << 1     ;  2
DEF J_UP     EQU 1 << 2     ;  4
DEF J_DOWN   EQU 1 << 3     ;  8
DEF J_A      EQU 1 << 4     ; 10
DEF J_B      EQU 1 << 5     ; 20
DEF J_SELECT EQU 1 << 6     ; 40
DEF J_START  EQU 1 << 7     ; 80

; Joypad button bits
DEF J_BIT_RIGHT  EQU 0
DEF J_BIT_LEFT   EQU 1
DEF J_BIT_UP     EQU 2
DEF J_BIT_DOWN   EQU 3
DEF J_BIT_A      EQU 4
DEF J_BIT_B      EQU 5
DEF J_BIT_SELECT EQU 6
DEF J_BIT_START  EQU 7
