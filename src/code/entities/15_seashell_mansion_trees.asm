SeashellMansionTreesEntityHandler::
    call ReturnIfNonInteractive_15                ;; 15:4493 $CD $0D $7B
    call ShouldLinkTalkToEntity_15                ;; 15:4496 $CD $BC $7A
    ret  nc                                       ;; 15:4499 $D0

    jp_open_dialog Dialog012                      ;; 15:449A
