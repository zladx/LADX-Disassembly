; ----------------------------------------------------------------------
;
; ENTITY COMMON HELPERS
;
; These helpers are defined (with small variants) in most entity banks.
;
; ----------------------------------------------------------------------

PushLinkOutOfEntity_05::
    call CheckLinkCollisionWithEnemy_trampoline   ;; 05:54C3 $CD $5A $3B
    jr   nc, .ret_54E5                            ;; 05:54C6 $30 $1D

    call CopyLinkFinalPositionToPosition          ;; 05:54C8 $CD $BE $0C
    call ResetPegasusBoots                        ;; 05:54CB $CD $B6 $0C
    ld   a, [wC1A6]                               ;; 05:54CE $FA $A6 $C1
    and  a                                        ;; 05:54D1 $A7
    jr   z, .ret_54E5                             ;; 05:54D2 $28 $11

    ld   e, a                                     ;; 05:54D4 $5F
    ld   d, b                                     ;; 05:54D5 $50
    ld   hl, wEntitiesPrivateState5Table+15       ;; 05:54D6 $21 $9F $C3
    add  hl, de                                   ;; 05:54D9 $19
    ld   a, [hl]                                  ;; 05:54DA $7E
    cp   $03                                      ;; 05:54DB $FE $03
    jr   nz, .ret_54E5                            ;; 05:54DD $20 $06

    ld   hl, wEntitiesStatusTable+15              ;; 05:54DF $21 $8F $C2
    add  hl, de                                   ;; 05:54E2 $19
    ld   [hl], $00                                ;; 05:54E3 $36 $00

.ret_54E5
    ret                                           ;; 05:54E5 $C9

EntityVariantForDirection_05::
.right db 6
.left  db 4
.up    db 2
.down  db 0

; Set the entity sprite variant to match the preset entity direction.
; Some inertia is added, so that after a direction change the entity waits for a bit before turning again.
;
; Inputs:
;   bc   entity index
SetEntityVariantForDirection_05::
    ; e = entity direction
    ld   hl, wEntitiesDirectionTable              ;; 05:54EA $21 $80 $C3
    add  hl, bc                                   ;; 05:54ED $09
    ld   e, [hl]                                  ;; 05:54EE $5E

    ld   d, b                                     ;; 05:54EF $50
    ld   hl, EntityVariantForDirection_05         ;; 05:54F0 $21 $E6 $54
    add  hl, de                                   ;; 05:54F3 $19
    push hl                                       ;; 05:54F4 $E5

    ld   hl, wEntitiesInertiaTable                ;; 05:54F5 $21 $D0 $C3
    add  hl, bc                                   ;; 05:54F8 $09
    inc  [hl]                                     ;; 05:54F9 $34
    ld   a, [hl]                                  ;; 05:54FA $7E
    rra                                           ;; 05:54FB $1F
    rra                                           ;; 05:54FC $1F
    rra                                           ;; 05:54FD $1F
    rra                                           ;; 05:54FE $1F

    pop  hl                                       ;; 05:54FF $E1
    and  1                                        ;; 05:5500 $E6 $01
    or   [hl]                                     ;; 05:5502 $B6

    jp   SetEntitySpriteVariant                   ;; 05:5503 $C3 $0C $3B

ShouldLinkTalkToEntity_05::
    ;
    ; Check if Link is vertically close to the entity
    ;

    ld   e, b                                     ;; 05:5506 $58
    ldh  a, [hActiveEntityType]                   ;; 05:5507 $F0 $EB
    cp   ENTITY_WITCH                             ;; 05:5509 $FE $40
    jr   nz, .witchYPosCheck                      ;; 05:550B $20 $0C

    ; Normal check for Y position
    ldh  a, [hLinkPositionY]                      ;; 05:550D $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 05:550F $21 $EF $FF
    sub  [hl]                                     ;; 05:5512 $96
    add  $14                                      ;; 05:5513 $C6 $14
    cp   $2B                                      ;; 05:5515 $FE $2B
    jr   .checkYPosEnd                            ;; 05:5517 $18 $0A
.witchYPosCheck
    ; Allow Link to talk to the witch across her cauldron
    ldh  a, [hLinkPositionY]                      ;; 05:5519 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 05:551B $21 $EF $FF
    sub  [hl]                                     ;; 05:551E $96
    add  $14                                      ;; 05:551F $C6 $14
    cp   $28                                      ;; 05:5521 $FE $28
.checkYPosEnd

    jr   nc, .dontTalk                            ;; 05:5523 $30 $44

    ;
    ; Check if Link is horizontally close to the entity
    ;

    ldh  a, [hLinkPositionX]                      ;; 05:5525 $F0 $98
    ld   hl, hActiveEntityPosX                    ;; 05:5527 $21 $EE $FF
    sub  [hl]                                     ;; 05:552A $96
    add  $10                                      ;; 05:552B $C6 $10
    cp   $20                                      ;; 05:552D $FE $20
    jr   nc, .dontTalk                            ;; 05:552F $30 $38

    inc  e                                        ;; 05:5531 $1C
    ldh  a, [hActiveEntityType]                   ;; 05:5532 $F0 $EB
    cp   ENTITY_BOW_WOW                           ;; 05:5534 $FE $6D
    jr   z, .bowWowEnd                            ;; 05:5536 $28 $0C

    push de                                       ;; 05:5538 $D5
    call GetEntityDirectionToLink_05              ;; 05:5539 $CD $24 $7B
    ldh  a, [hLinkDirection]                      ;; 05:553C $F0 $9E
    xor  $01                                      ;; 05:553E $EE $01
    cp   e                                        ;; 05:5540 $BB
    pop  de                                       ;; 05:5541 $D1
    jr   nz, .dontTalk                            ;; 05:5542 $20 $25
.bowWowEnd

    ld   hl, wItemUsageContext                    ;; 05:5544 $21 $AD $C1
    ld   [hl], ITEM_USAGE_NEAR_NPC                ;; 05:5547 $36 $01
    ld   a, [wDialogState]                        ;; 05:5549 $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 05:554C $21 $4F $C1
    or   [hl]                                     ;; 05:554F $B6
    ld   hl, wIsLinkInTheAir                      ;; 05:5550 $21 $46 $C1
    or   [hl]                                     ;; 05:5553 $B6
    ld   hl, wDialogCooldown                      ;; 05:5554 $21 $34 $C1
    or   [hl]                                     ;; 05:5557 $B6
    jr   nz, .dontTalk                            ;; 05:5558 $20 $0F

    ld   a, [wWindowY]                            ;; 05:555A $FA $9A $DB
    cp   $80                                      ;; 05:555D $FE $80
    jr   nz, .dontTalk                            ;; 05:555F $20 $08

    ldh  a, [hJoypadState]                        ;; 05:5561 $F0 $CC
    and  J_A                                      ;; 05:5563 $E6 $10
    jr   z, .dontTalk                             ;; 05:5565 $28 $02

    ; c = 1 (Link should talk to entity)
    scf                                           ;; 05:5567 $37
    ret                                           ;; 05:5568 $C9

.dontTalk
    and  a                                        ;; 05:5569 $A7
    ret                                           ;; 05:556A $C9
