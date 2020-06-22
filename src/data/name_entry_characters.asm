    ; Used to translate cursor position -> name letter
    ; on the name entry menu. Does not actually represent
    ; the graphics - this is just the letter that is chosen
    ; when you push A
    PUSHC
    SETCHARMAP NameEntryCharmap
    db   "ABCDEFG",  0,0, "abcdefg"               ; $4BB5
    db   "HIJKLMN",  0,0, "hijklmn"               ; $4BC5
    db   "OPQRSTU",  0,0, "opqrstu"               ; $4BD5
    db   "VWXYZ",0,0,0,0, "vwxyz",0,0             ; $4BE5
    POPC
