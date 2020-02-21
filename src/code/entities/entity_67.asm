Entity67Handler::
    call GetEntityDropTimer                       ; $556B: $CD $FB $0B
    ld   [hl], $C0                                ; $556E: $36 $C0
    ld   a, $18                                   ; $5570: $3E $18
    ld   [$D202], a                               ; $5572: $EA $02 $D2
    ret                                           ; $5575: $C9
