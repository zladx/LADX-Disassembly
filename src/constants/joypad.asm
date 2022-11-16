; Joypad constants
;
; ReadJoypadState.readState reads both button matrices and combine
; them into one bitfield

; Select the corresponding button matrix in rP1
J_DPAD    EQU $10
J_BUTTONS EQU $20

; Joypad buttons mask
J_RIGHT  EQU 1 << 0     ;  1
J_LEFT   EQU 1 << 1     ;  2
J_UP     EQU 1 << 2     ;  4
J_DOWN   EQU 1 << 3     ;  8
J_A      EQU 1 << 4     ; 10
J_B      EQU 1 << 5     ; 20
J_SELECT EQU 1 << 6     ; 40
J_START  EQU 1 << 7     ; 80

; Joypad button bits
J_BIT_RIGHT  EQU 0
J_BIT_LEFT   EQU 1
J_BIT_UP     EQU 2
J_BIT_DOWN   EQU 3
J_BIT_A      EQU 4
J_BIT_B      EQU 5
J_BIT_SELECT EQU 6
J_BIT_START  EQU 7
