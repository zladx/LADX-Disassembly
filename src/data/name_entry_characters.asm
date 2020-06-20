    ; Used to translate cursor position -> name letter
    ; on the name entry menu. Does not actually represent
    ; the graphics - this is just the letter that is chosen
    ; when you push A
    PUSHC
    SETCHARMAP NameEntryCharmap
    db   "ABCDEFG",  0,0, "abcdefg"
    db   "HIJKLMN",  0,0, "hijklmn"
    db   "OPQRSTU",  0,0, "opqrstu"
    db   "VWXYZ",0,0,0,0, "vwxyz",0,0
    POPC
