
RGB: macro
    db (\1) + (\2) << 5 + (\3) << 10
endm

; The games uses code stored at $0000 to go to the jump table handler,
; which means reseting the PC to 0 activates the jump table.
;
; See the JumpTable function for details and usage.
JP_TABLE: macro
    rst 0
endm
