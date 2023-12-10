;
; #define-like strings for readability and usability
;


; One full heart of health is counted as 08
DEF HALF_HEARTS EQUS "* 4"
DEF FULL_HEARTS EQUS "* 8"

; LADX uses $2100 as the address for the register to
; switch ROM banks (all addresses in the $2000-$2FFF
; range map to this register)
DEF rSelectROMBank EQU rROMB0 + $100
