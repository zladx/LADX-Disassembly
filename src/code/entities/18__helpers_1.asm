;
; Helpers for Animal's Village animals
;

label_018_51A4:
    call PushLinkOutOfEntity_18                   ; $51A4: $CD $36 $7D
    call func_018_7D95                            ; $51A7: $CD $95 $7D
    ret  nc                                       ; $51AA: $D0

    jp_open_dialog Dialog196                      ; $51AB

func_018_51B0::
    ld   a, [wIsMarinInAnimalVillage]             ; $51B0: $FA $74 $DB
    and  a                                        ; $51B3: $A7
    jp   z, ClearEntityStatusBank18               ; $51B4: $CA $08 $7F

    ret                                           ; $51B7: $C9
