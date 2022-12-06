;
; #define-like strings for readability and usability
;


; One full heart of health is counted as 08
HALF_HEARTS equs "* 4"
FULL_HEARTS equs "* 8"

; LADX uses $2100 as the address for the register to
; switch ROM banks (all addresses in the $2000-$2FFF
; range map to this register)
rSelectROMBank EQU rROMB0 + $100
