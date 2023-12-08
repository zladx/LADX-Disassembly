;
; #define-like strings for readability and usability
;


; One full heart of health is counted as 08
def HALF_HEARTS equs "* 4"
def FULL_HEARTS equs "* 8"

; LADX uses $2100 as the address for the register to
; switch ROM banks (all addresses in the $2000-$2FFF
; range map to this register)
DEF rSelectROMBank EQU rROMB0 + $100
