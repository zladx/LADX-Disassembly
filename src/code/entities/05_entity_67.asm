Entity67Handler::
    call GetEntitySlowTransitionCountdown         ;; 05:556B $CD $FB $0B
    ld   [hl], $C0                                ;; 05:556E $36 $C0
    ld   a, $18                                   ;; 05:5570 $3E $18
    ld   [wD202], a                               ;; 05:5572 $EA $02 $D2
    ret                                           ;; 05:5575 $C9
