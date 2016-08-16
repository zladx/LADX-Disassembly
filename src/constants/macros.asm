farcall: macro
	rst FarCall
	db  bank(\1)
	dw  \1
endm

RGB: macro
	db (\1) + (\2) << 5 + (\3) << 10
endm
