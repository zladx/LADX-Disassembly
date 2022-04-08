SeashellMansionTreesEntityHandler::
    call ReturnIfNonInteractive_15                ; $4493: $CD $0D $7B
    call ShouldLinkTalkToEntity_15                ; $4496: $CD $BC $7A
    ret  nc                                       ; $4499: $D0

    jp_open_dialog Dialog012                      ; $449A
