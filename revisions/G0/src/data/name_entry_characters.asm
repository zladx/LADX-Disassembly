    ; Used to translate cursor position -> name letter
    ; on the name entry menu. Does not actually represent
    ; the graphics - this is just the letter that is chosen
    ; when you push A
    PUSHC
    SETCHARMAP NameEntryCharmap
    db   "AÄBCDEF",  0,0, "aäbcdef"
    db   "GHIJKLM",  0,0, "ghijklm"
    db   "NOÖPQRS",  0,0, "noöpqrs"
    db   "TUÜVWXY",  0,0, "ßtuüvwx"
    db   "Z      ",  0,0, "yz     "
    POPC
