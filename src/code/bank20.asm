; Disassembly of "game.gbc"
; This file was created with mgbdis v1.0.1 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

entity_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
endm

; Table of entities handlers
;
; First 2 bytes: memory address; third byte: bank id
; E.g. db $DC, $59, $03 is for heart container. When loaded, code will jump to bank $03 - Pointer $59DC (HeartContainerHandler)
;
; See ENTITY_* constants for values
EntityPointersTable::
._00 entity_pointer ArrowEntityHandler
._01 entity_pointer BoomerangEntityHandler
._02 entity_pointer BombEntityHandler
._03 entity_pointer HookshotChainEntityHandler
._04 entity_pointer HookshotHitEntityHandler
._05 entity_pointer LiftableRockEntityHandler
._06 entity_pointer Entity06Handler
._07 entity_pointer ChestWithItemEntityHandler
._08 db $66, $79, $18 ; entity_pointer Entity08Handler
._09 db $E9, $57, $03 ; entity_pointer Entity09Handler
._0A db $26, $6A, $03 ; entity_pointer Entity0AHandler
._0B db $27, $58, $03 ; entity_pointer Entity0BHandler
._0C db $CC, $6A, $03 ; entity_pointer Entity0CHandler
._0D db $C7, $78, $06 ; entity_pointer Entity0DHandler
._0E db $F5, $7E, $04 ; entity_pointer Entity0EHandler
._0F db $4E, $74, $06 ; entity_pointer Entity0FHandler
._10 db $0D, $5C, $04 ; entity_pointer Entity10Handler
._11 db $08, $5C, $04 ; entity_pointer Entity11Handler
._12 db $0D, $5C, $04 ; entity_pointer Entity12Handler
._13 db $D8, $59, $03 ; entity_pointer Entity13Handler
._14 db $41, $79, $07 ; entity_pointer Entity14Handler ; $14
._15 db $76, $78, $06 ; entity_pointer Entity15Handler
._16 db $35, $66, $06 ; entity_pointer Entity16Handler
._17 db $35, $66, $06 ; entity_pointer Entity17Handler
._18 db $7B, $73, $06 ; entity_pointer Entity18Handler ; $18
._19 db $30, $67, $06 ; entity_pointer Entity19Handler
._1A db $B4, $4A, $06 ; entity_pointer Entity1AHandler
._1B db $19, $7C, $06 ; entity_pointer Entity1BHandler
._1C db $FE, $7B, $06 ; entity_pointer Entity1CHandler ; $1C
._1D db $00, $00, $00 ; entity_pointer Entity1DHandler ; Empty?
._1E db $96, $4E, $15 ; entity_pointer Entity1EHandler
._1F db $85, $7E, $06 ; entity_pointer Entity1FHandler
._20 db $3C, $4F, $06 ; entity_pointer Entity20Handler ; $20
._21 db $28, $76, $06 ; entity_pointer Entity21Handler
._22 db $F1, $65, $06 ; entity_pointer Entity22Handler
._23 db $DC, $7D, $06 ; entity_pointer LikeLikeEntityHandler
._24 db $FB, $4F, $03 ; entity_pointer Entity24Handler ; $24
._25 db $44, $4C, $03 ; entity_pointer Entity25Handler
._26 db $44, $4C, $03 ; entity_pointer Entity26Handler
._27 db $10, $75, $06 ; entity_pointer Entity27Handler
._28 db $AF, $6A, $19 ; entity_pointer Entity28Handler ; $28
._29 db $95, $5A, $04 ; entity_pointer Entity29Handler
._2A db $61, $6C, $04 ; entity_pointer Entity2AHandler
._2B db $D6, $75, $15 ; entity_pointer Entity2BHandler
._2C db $A4, $77, $07 ; entity_pointer Entity2CHandler ; $2C
._2D db $38, $5D, $03 ; entity_pointer Entity2DHandler
._2E db $9E, $60, $03 ; entity_pointer Entity2EHandler
._2F db $5B, $61, $03 ; entity_pointer Entity2FHandler
._30 db $89, $5C, $03 ; entity_pointer Entity30Handler ; $30
._31 db $99, $5B, $03 ; entity_pointer Entity31Handler
._32 db $88, $5B, $03 ; entity_pointer Entity32Handler
._33 db $6D, $5B, $03 ; entity_pointer Entity33Handler
._34 db $5D, $5B, $03 ; entity_pointer Entity34Handler ; $34
._35 db $51, $5A, $03 ; entity_pointer Entity35Handler
._36 db $DC, $59, $03 ; entity_pointer Entity36Handler
._37 db $7D, $60, $03 ; entity_pointer Entity37Handler
._38 db $C2, $5F, $03 ; entity_pointer Entity38Handler ; $38
._39 db $93, $5D, $03 ; entity_pointer Entity39Handler
._3A db $4B, $5D, $03 ; entity_pointer Entity3AHandler
._3B db $57, $60, $03 ; entity_pointer Entity3BHandler
._3C db $FD, $5F, $03 ; entity_pointer Entity3CHandler ; $3C
._3D db $D3, $5F, $03 ; entity_pointer Entity3DHandler
._3E db $62, $4E, $05 ; entity_pointer Entity3EHandler
._3F db $6A, $49, $05 ; entity_pointer Entity3FHandler
._40 db $D3, $47, $05 ; entity_pointer Entity40Handler ; $40
._41 db $F5, $67, $06 ; entity_pointer HowlEntityHandler
._42 db $7A, $5E, $18 ; entity_pointer Entity42Handler
._43 db $93, $44, $15 ; entity_pointer Entity43Handler
._44 db $3F, $44, $15 ; entity_pointer Entity44Handler ; $44
._45 db $65, $43, $15 ; entity_pointer Entity45Handler
._46 db $00, $41, $15 ; entity_pointer Entity46Handler
._47 db $CA, $41, $15 ; entity_pointer Entity47Handler
._48 db $3C, $42, $15 ; entity_pointer Entity48Handler ; $48
._49 db $AE, $42, $15 ; entity_pointer Entity49Handler
._4A db $7F, $58, $36 ; entity_pointer Entity4AHandler
._4B db $26, $53, $03 ; entity_pointer Entity4BHandler
._4C db $00, $00, $00 ; entity_pointer Entity4CHandler ; $4C
._4D db $EB, $76, $04 ; entity_pointer Entity4DHandler
._4E db $CA, $76, $04 ; entity_pointer Entity4EHandler
._4F db $7C, $6E, $04 ; entity_pointer Entity4FHandler
._50 db $A9, $79, $06 ; entity_pointer Entity50Handler ; $50
._51 db $AE, $69, $04 ; entity_pointer Entity51Handler
._52 db $24, $68, $04 ; entity_pointer Entity52Handler
._53 db $24, $68, $04 ; entity_pointer Entity53Handler
._54 db $5C, $5F, $04 ; entity_pointer Entity54Handler ; $54
._55 db $0D, $7E, $04 ; entity_pointer Entity55Handler
._56 db $1F, $7D, $04 ; entity_pointer Entity56Handler
._57 db $F1, $5D, $04 ; entity_pointer Entity57Handler
._58 db $FC, $5E, $04 ; entity_pointer Entity58Handler ; $58
._59 db $AD, $56, $04 ; entity_pointer Entity59Handler
._5A db $70, $50, $04 ; entity_pointer Entity5AHandler
._5B db $C9, $49, $04 ; entity_pointer Entity5BHandler
._5C db $00, $40, $04 ; entity_pointer Entity5CHandler ; $5C
._5D db $DC, $6C, $05 ; entity_pointer Entity5DHandler
._5E db $E5, $7B, $05 ; entity_pointer Entity5EHandler
._5F db $41, $6A, $07 ; entity_pointer Entity5FHandler
._60 db $6F, $68, $05 ; entity_pointer Entity60Handler ; $60
._61 db $11, $42, $19 ; entity_pointer Entity61Handler
._62 db $14, $63, $05 ; entity_pointer Entity62Handler
._63 db $80, $5A, $05 ; entity_pointer Entity63Handler
._64 db $E9, $5D, $18 ; entity_pointer Entity64Handler ; $64
._65 db $76, $55, $05 ; entity_pointer Entity65Handler
._66 db $24, $43, $15 ; entity_pointer Entity66Handler
._67 db $6B, $55, $05 ; entity_pointer Entity67Handler
._68 db $38, $74, $15 ; entity_pointer Entity68Handler ; $68
._69 db $CE, $53, $18 ; entity_pointer Entity69Handler
._6A db $5E, $53, $05 ; entity_pointer Entity6AHandler
._6B db $85, $5D, $18 ; entity_pointer Entity6BHandler
._6C db $24, $45, $05 ; entity_pointer Entity6CHandler ; $6C
._6D db $38, $40, $05 ; entity_pointer Entity6DHandler
._6E entity_pointer ButterflyEntityHandler
._6F db $DA, $48, $19 ; entity_pointer Entity6FHandler
._70 db $0E, $62, $06 ; entity_pointer Entity70Handler ; $70
._71 db $7F, $60, $06 ; entity_pointer Entity71Handler
._72 db $7F, $60, $06 ; entity_pointer Entity72Handler
._73 db $0E, $62, $06 ; entity_pointer Entity73Handler
._74 db $47, $4E, $18 ; entity_pointer Entity74Handler ; $74
._75 db $17, $4D, $18 ; entity_pointer Entity75Handler
._76 db $9D, $4B, $18 ; entity_pointer Entity76Handler
._77 db $0E, $5C, $06 ; entity_pointer Entity77Handler
._78 db $E8, $59, $06 ; entity_pointer Entity78Handler ; $78
._79 db $76, $5B, $06 ; entity_pointer Entity79Handler
._7A db $99, $5C, $06 ; entity_pointer Entity7AHandler
._7B db $95, $5E, $06 ; entity_pointer Entity7BHandler
._7C db $B3, $62, $06 ; entity_pointer Entity7CHandler ; $7C
._7D db $9F, $63, $06 ; entity_pointer Entity7DHandler
._7E db $FC, $63, $06 ; entity_pointer Entity7EHandler
._7F db $01, $73, $18 ; entity_pointer Entity7FHandler
._80 db $7C, $6A, $06 ; entity_pointer Entity80Handler ; $80
._81 db $6D, $6C, $06 ; entity_pointer Entity81Handler
._82 db $E3, $6E, $06 ; entity_pointer Entity82Handler
._83 db $F8, $7C, $15 ; entity_pointer Entity83Handler
._84 db $A7, $70, $06 ; entity_pointer Entity84Handler ; $84
._85 db $3C, $72, $06 ; entity_pointer Entity85Handler
._86 db $0B, $7B, $06 ; entity_pointer Entity86Handler
._87 db $E8, $55, $06 ; entity_pointer Entity87Handler
._88 db $DE, $52, $06 ; entity_pointer Entity88Handler ; $88
._89 db $B8, $4F, $06 ; entity_pointer Entity89Handler
._8A db $1F, $6E, $36 ; entity_pointer Entity8AHandler
._8B db $1F, $6E, $36 ; entity_pointer Entity8BHandler
._8C db $A1, $4E, $06 ; entity_pointer Entity8CHandler ; $8C
._8D db $15, $4F, $06 ; entity_pointer Entity8DHandler
._8E db $7A, $4B, $06 ; entity_pointer Entity8EHandler
._8F db $BC, $47, $19 ; entity_pointer Entity8FHandler
._90 db $31, $49, $06 ; entity_pointer Entity90Handler ; $90
._91 db $3A, $42, $06 ; entity_pointer Entity91Handler
._92 db $09, $45, $06 ; entity_pointer Entity92Handler
._93 db $4A, $41, $06 ; entity_pointer Entity93Handler
._94 db $98, $71, $07 ; entity_pointer Entity94Handler ; $94
._95 db $20, $40, $06 ; entity_pointer Entity95Handler
._96 db $C0, $5B, $19 ; entity_pointer Entity96Handler
._97 db $47, $48, $19 ; entity_pointer Entity97Handler
._98 db $F2, $75, $07 ; entity_pointer Entity98Handler ; $98
._99 db $35, $75, $07 ; entity_pointer Entity99Handler
._9A db $06, $74, $07 ; entity_pointer Entity9AHandler
._9B db $AF, $72, $07 ; entity_pointer Entity9BHandler
._9C db $5B, $72, $07 ; entity_pointer Entity9CHandler ; $9C
._9D db $22, $40, $19 ; entity_pointer Entity9DHandler
._9E db $1C, $71, $07 ; entity_pointer Entity9EHandler
._9F db $DA, $65, $07 ; entity_pointer Entity9FHandler
._A0 db $09, $67, $07 ; entity_pointer EntityA0Handler ; $A0
._A1 db $4E, $68, $07 ; entity_pointer EntityA1Handler
._A2 db $D5, $6E, $36 ; entity_pointer EntityA2Handler
._A3 db $58, $63, $07 ; entity_pointer EntityA3Handler
._A4 db $58, $63, $07 ; entity_pointer EntityA4Handler ; $A4
._A5 db $32, $64, $07 ; entity_pointer EntityA5Handler
._A6 db $D2, $61, $07 ; entity_pointer EntityA6Handler
._A7 db $C0, $5D, $07 ; entity_pointer EntityA7Handler
._A8 db $07, $60, $07 ; entity_pointer EntityA8Handler ; $A8
._A9 db $F9, $5B, $07 ; entity_pointer EntityA9Handler
._AA db $54, $6B, $19 ; entity_pointer EntityAAHandler
._AB db $54, $6B, $19 ; entity_pointer EntityABHandler
._AC db $C7, $6B, $19 ; entity_pointer EntityACHandler ; $AC
._AD db $42, $58, $07 ; entity_pointer EntityADHandler
._AE db $4D, $56, $07 ; entity_pointer EntityAEHandler
._AF db $10, $55, $07 ; entity_pointer EntityAFHandler
._B0 db $22, $53, $07 ; entity_pointer EntityB0Handler ; $B0
._B1 db $0C, $51, $07 ; entity_pointer EntityB1Handler
._B2 db $0D, $75, $15 ; entity_pointer EntityB2Handler
._B3 db $97, $4C, $07 ; entity_pointer EntityB3Handler
._B4 db $B1, $4E, $07 ; entity_pointer EntityB4Handler ; $B4
._B5 db $B5, $4B, $07 ; entity_pointer EntityB5Handler
._B6 db $1B, $4A, $07 ; entity_pointer EntityB6Handler
._B7 db $BB, $46, $07 ; entity_pointer EntityB7Handler
._B8 db $84, $42, $07 ; entity_pointer EntityB8Handler ; $B8
._B9 db $59, $77, $18 ; entity_pointer EntityB9Handler
._BA db $21, $78, $18 ; entity_pointer EntityBAHandler
._BB db $22, $40, $07 ; entity_pointer EntityBBHandler
._BC db $D6, $6F, $18 ; entity_pointer EntityBCHandler ; $BC
._BD db $FC, $69, $18 ; entity_pointer EntityBDHandler
._BE db $CC, $64, $18 ; entity_pointer EntityBEHandler
._BF db $8D, $63, $18 ; entity_pointer EntityBFHandler
._C0 db $92, $62, $18 ; entity_pointer EntityC0Handler ; $C0
._C1 db $8A, $61, $18 ; entity_pointer EntityC1Handler
._C2 db $D7, $5E, $18 ; entity_pointer EntityC2Handler
._C3 db $00, $40, $18 ; entity_pointer EntityC3Handler
._C4 db $01, $55, $18 ; entity_pointer EntityC4Handler ; $C4
._C5 db $AB, $73, $15 ; entity_pointer EntityC5Handler
._C6 db $30, $73, $15 ; entity_pointer EntityC6Handler
._C7 db $00, $45, $18 ; entity_pointer EntityC7Handler
._C8 db $A6, $52, $18 ; entity_pointer EntityC8Handler ; $C8
._C9 db $F8, $7E, $05 ; entity_pointer EntityC9Handler
._CA db $DD, $4E, $18 ; entity_pointer EntityCAHandler
._CB db $D4, $49, $18 ; entity_pointer EntityCBHandler
._CC db $BB, $44, $15 ; entity_pointer EntityCCHandler ; $CC
._CD db $11, $6F, $19 ; entity_pointer EntityCDHandler
._CE db $38, $49, $18 ; entity_pointer EntityCEHandler
._CF db $BC, $71, $19 ; entity_pointer EntityCFHandler
._D0 db $2E, $7F, $05 ; entity_pointer EntityD0Handler ; $D0
._D1 db $96, $7F, $15 ; entity_pointer EntityD1Handler
._D2 db $6B, $52, $18 ; entity_pointer EntityD2Handler
._D3 db $D8, $51, $18 ; entity_pointer EntityD3Handler
._D4 db $18, $5E, $19 ; entity_pointer EntityD4Handler ; $D4
._D5 db $DC, $59, $19 ; entity_pointer EntityD5Handler
._D6 db $DD, $58, $19 ; entity_pointer EntityD6Handler
._D7 db $C5, $56, $19 ; entity_pointer EntityD7Handler
._D8 db $B4, $57, $19 ; entity_pointer EntityD8Handler ; $D8
._D9 db $8B, $55, $19 ; entity_pointer EntityD9Handler
._DA db $F0, $53, $19 ; entity_pointer EntityDAHandler
._DB db $90, $53, $19 ; entity_pointer EntityDBHandler
._DC db $BD, $51, $19 ; entity_pointer EntityDCHandler ; $DC
._DD db $75, $7E, $15 ; entity_pointer EntityDDHandler
._DE db $CB, $4A, $19 ; entity_pointer EntityDEHandler
._DF db $24, $45, $19 ; entity_pointer EntityDFHandler
._E0 db $7B, $76, $15 ; entity_pointer EntityE0Handler ; $E0
._E1 db $9D, $78, $15 ; entity_pointer EntityE1Handler
._E2 db $43, $4D, $15 ; entity_pointer EntityE2Handler
._E3 db $E1, $4B, $15 ; entity_pointer EntityE3Handler
._E4 db $B6, $46, $15 ; entity_pointer EntityE4Handler ; $E4
._E5 db $1C, $7B, $06 ; entity_pointer EntityE5Handler
._E6 db $80, $50, $15 ; entity_pointer EntityE6Handler
._E7 db $9F, $40, $15 ; entity_pointer EntityE7Handler
._E8 db $87, $7A, $17 ; entity_pointer EntityE8Handler ; $E8
._E9 db $68, $66, $36 ; entity_pointer EntityE9Handler
._EA db $68, $66, $36 ; entity_pointer EntityEAHandler
._EB db $68, $66, $36 ; entity_pointer EntityEBHandler
._EC db $C9, $63, $36 ; entity_pointer EntityECHandler ; $EC
._ED db $C9, $63, $36 ; entity_pointer EntityEDHandler
._EE db $C9, $63, $36 ; entity_pointer EntityEEHandler
._EF db $41, $62, $36 ; entity_pointer EntityEFHandler
._F0 db $41, $62, $36 ; entity_pointer EntityF0Handler ; $F0
._F1 db $41, $62, $36 ; entity_pointer EntityF1Handler
._F2 db $A2, $5F, $36 ; entity_pointer EntityF2Handler
._F3 db $A2, $5F, $36 ; entity_pointer EntityF3Handler
._F4 db $F7, $5B, $36 ; entity_pointer EntityF4Handler ; $F4
._F5 db $5E, $5B, $36 ; entity_pointer EntityF5Handler
._F6 db $3F, $59, $36 ; entity_pointer EntityF6Handler
._F7 db $3F, $59, $36 ; entity_pointer EntityF7Handler
._F8 db $E2, $54, $36 ; entity_pointer EntityF8Handler ; $F8
._F9 db $B6, $4C, $36 ; entity_pointer EntityF9Handler
._FA db $12, $49, $36 ; entity_pointer EntityFAHandler
._FB db $F0, $EB, $5F ; entity_pointer EntityFBHandler
._FC db $50, $21, $00 ; entity_pointer EntityFCHandler ; $FC
._FD db $40, $19, $19 ; entity_pointer EntityFDHandler
._FE db $19, $5E, $23 ; entity_pointer EntityFEHandler ; $FE Unused - Points to a byte with $DB which isn't a valid instruction
._FF db $56, $23, $7E ; entity_pointer EntityFFHandler ; $FF

    ld   l, e                                     ; $4300: $6B
    ld   h, d                                     ; $4301: $62
    ret                                           ; $4302: $C9

Func_020_4303::
    ld   a, [$C5A0]                               ; $4303: $FA $A0 $C5
    ld   [$C5A1], a                               ; $4306: $EA $A1 $C5
    xor  a                                        ; $4309: $AF
    ld   [$C5A0], a                               ; $430A: $EA $A0 $C5
    ld   [wC10C], a                               ; $430D: $EA $0C $C1
    ldh  [hFFB2], a                               ; $4310: $E0 $B2
    ld   [wC117], a                               ; $4312: $EA $17 $C1
    ld   [$C19D], a                               ; $4315: $EA $9D $C1
    ld   [$C147], a                               ; $4318: $EA $47 $C1
    ld   [$C5A8], a                               ; $431B: $EA $A8 $C5
    ld   [$D45E], a                               ; $431E: $EA $5E $D4
    ret                                           ; $4321: $C9

; Entity id table?
data_020_4322::
    ld   c, h                                     ; $4322: $4C
    ld   c, e                                     ; $4323: $4B
    ld   c, h                                     ; $4324: $4C
    ld   c, e                                     ; $4325: $4B
    ld   c, h                                     ; $4326: $4C
    ld   c, e                                     ; $4327: $4B
    ld   c, h                                     ; $4328: $4C
    ld   c, e                                     ; $4329: $4B
    ld   c, h                                     ; $432A: $4C
    ld   c, e                                     ; $432B: $4B
    ld   c, h                                     ; $432C: $4C
    ld   c, e                                     ; $432D: $4B
    ld   l, [hl]                                  ; $432E: $6E
    ld   d, c                                     ; $432F: $51
    ld   l, l                                     ; $4330: $6D
    ld   d, b                                     ; $4331: $50
    ld   c, h                                     ; $4332: $4C
    ld   c, e                                     ; $4333: $4B
    xor  a                                        ; $4334: $AF
    ld   c, a                                     ; $4335: $4F
    ld   c, h                                     ; $4336: $4C
    ld   c, e                                     ; $4337: $4B
    xor  a                                        ; $4338: $AF
    ld   c, a                                     ; $4339: $4F
    ld   c, h                                     ; $433A: $4C
    ld   c, e                                     ; $433B: $4B
    ld   c, h                                     ; $433C: $4C
    ld   c, e                                     ; $433D: $4B
    ld   e, h                                     ; $433E: $5C
    ld   c, e                                     ; $433F: $4B
    ld   c, h                                     ; $4340: $4C
    ld   c, e                                     ; $4341: $4B
    or   l                                        ; $4342: $B5
    ld   c, a                                     ; $4343: $4F
    or   l                                        ; $4344: $B5
    ld   c, a                                     ; $4345: $4F
    or   l                                        ; $4346: $B5
    ld   c, a                                     ; $4347: $4F
    rst  $10                                      ; $4348: $D7
    ld   e, c                                     ; $4349: $59
    ld   [$ff00+c], a                             ; $434A: $E2
    ld   c, [hl]                                  ; $434B: $4E
    xor  b                                        ; $434C: $A8
    ld   c, [hl]                                  ; $434D: $4E
    adc  $4E                                      ; $434E: $CE $4E
    call nz, $4C4E                                ; $4350: $C4 $4E $4C
    ld   c, e                                     ; $4353: $4B
    ld   c, h                                     ; $4354: $4C
    ld   c, e                                     ; $4355: $4B
    ld   c, h                                     ; $4356: $4C
    ld   c, e                                     ; $4357: $4B
    ld   d, e                                     ; $4358: $53
    ld   c, c                                     ; $4359: $49
    ld   c, h                                     ; $435A: $4C
    ld   c, e                                     ; $435B: $4B
    rst  $10                                      ; $435C: $D7
    ld   c, [hl]                                  ; $435D: $4E
    ld   [de], a                                  ; $435E: $12
    dec  sp                                       ; $435F: $3B
    ld   [de], a                                  ; $4360: $12
    dec  sp                                       ; $4361: $3B
    ld   c, h                                     ; $4362: $4C
    ld   c, e                                     ; $4363: $4B
    rst  $10                                      ; $4364: $D7
    ld   c, [hl]                                  ; $4365: $4E
    ld   c, h                                     ; $4366: $4C
    ld   c, e                                     ; $4367: $4B
    ld   [de], a                                  ; $4368: $12
    dec  sp                                       ; $4369: $3B
    ld   c, h                                     ; $436A: $4C
    ld   c, e                                     ; $436B: $4B
    ld   b, h                                     ; $436C: $44
    ld   c, h                                     ; $436D: $4C
    ld   b, h                                     ; $436E: $44
    ld   c, h                                     ; $436F: $4C
    ld   c, h                                     ; $4370: $4C
    ld   c, e                                     ; $4371: $4B
    ld   c, h                                     ; $4372: $4C
    ld   c, e                                     ; $4373: $4B
    xor  e                                        ; $4374: $AB
    dec  a                                        ; $4375: $3D
    ld   c, h                                     ; $4376: $4C
    ld   c, e                                     ; $4377: $4B
    ld   c, h                                     ; $4378: $4C
    ld   c, e                                     ; $4379: $4B
    ld   c, h                                     ; $437A: $4C
    ld   c, e                                     ; $437B: $4B
    ld   e, $4F                                   ; $437C: $1E $4F
    ld   a, d                                     ; $437E: $7A
    ld   c, a                                     ; $437F: $4F
    ld   a, d                                     ; $4380: $7A
    ld   c, a                                     ; $4381: $4F
    dec  l                                        ; $4382: $2D
    ld   c, a                                     ; $4383: $4F
    ld   a, b                                     ; $4384: $78
    ld   c, d                                     ; $4385: $4A
    ld   a, d                                     ; $4386: $7A
    ld   c, a                                     ; $4387: $4F
    ld   a, d                                     ; $4388: $7A
    ld   c, a                                     ; $4389: $4F
    ld   a, d                                     ; $438A: $7A
    ld   c, a                                     ; $438B: $4F
    ld   d, [hl]                                  ; $438C: $56
    ld   c, e                                     ; $438D: $4B
    ld   a, d                                     ; $438E: $7A
    ld   c, a                                     ; $438F: $4F
    ld   a, d                                     ; $4390: $7A
    ld   c, a                                     ; $4391: $4F
    ld   a, d                                     ; $4392: $7A
    ld   c, a                                     ; $4393: $4F
    and  c                                        ; $4394: $A1
    ld   c, a                                     ; $4395: $4F
    ld   d, [hl]                                  ; $4396: $56
    ld   c, e                                     ; $4397: $4B
    ld   e, $4F                                   ; $4398: $1E $4F
    ld   e, $4F                                   ; $439A: $1E $4F
    ei                                            ; $439C: $FB
    ld   c, [hl]                                  ; $439D: $4E
    add  b                                        ; $439E: $80
    ld   c, d                                     ; $439F: $4A
    adc  $4A                                      ; $43A0: $CE $4A
    ld   b, d                                     ; $43A2: $42
    ld   c, e                                     ; $43A3: $4B
    ld   [hl], e                                  ; $43A4: $73
    ld   c, d                                     ; $43A5: $4A
    ld   c, h                                     ; $43A6: $4C
    ld   c, e                                     ; $43A7: $4B
    and  c                                        ; $43A8: $A1
    ld   c, a                                     ; $43A9: $4F
    ld   d, [hl]                                  ; $43AA: $56
    ld   c, e                                     ; $43AB: $4B
    ld   d, [hl]                                  ; $43AC: $56
    ld   c, e                                     ; $43AD: $4B
    ld   d, [hl]                                  ; $43AE: $56
    ld   c, e                                     ; $43AF: $4B
    ld   d, [hl]                                  ; $43B0: $56
    ld   c, e                                     ; $43B1: $4B
    ld   d, [hl]                                  ; $43B2: $56
    ld   c, e                                     ; $43B3: $4B
    ld   d, [hl]                                  ; $43B4: $56
    ld   c, e                                     ; $43B5: $4B
    rra                                           ; $43B6: $1F
    ld   c, h                                     ; $43B7: $4C
    ld   c, h                                     ; $43B8: $4C
    ld   c, e                                     ; $43B9: $4B
    ld   c, h                                     ; $43BA: $4C
    ld   c, e                                     ; $43BB: $4B
    ld   b, e                                     ; $43BC: $43
    ld   c, e                                     ; $43BD: $4B
    ld   c, h                                     ; $43BE: $4C
    ld   c, e                                     ; $43BF: $4B
    dec  [hl]                                     ; $43C0: $35
    ld   c, e                                     ; $43C1: $4B
    ld   c, h                                     ; $43C2: $4C
    ld   c, e                                     ; $43C3: $4B
    ld   c, h                                     ; $43C4: $4C
    ld   c, e                                     ; $43C5: $4B
    ld   c, h                                     ; $43C6: $4C
    ld   c, e                                     ; $43C7: $4B
    ld   c, h                                     ; $43C8: $4C
    ld   c, e                                     ; $43C9: $4B
    dec  [hl]                                     ; $43CA: $35
    ld   c, e                                     ; $43CB: $4B
    ld   c, h                                     ; $43CC: $4C
    ld   c, e                                     ; $43CD: $4B
    ld   c, h                                     ; $43CE: $4C
    ld   c, e                                     ; $43CF: $4B
    ld   c, h                                     ; $43D0: $4C
    ld   c, e                                     ; $43D1: $4B
    ld   c, h                                     ; $43D2: $4C
    ld   c, e                                     ; $43D3: $4B
    or   [hl]                                     ; $43D4: $B6
    dec  a                                        ; $43D5: $3D
    pop  bc                                       ; $43D6: $C1
    dec  a                                        ; $43D7: $3D
    call z, $D73D                                 ; $43D8: $CC $3D $D7
    dec  a                                        ; $43DB: $3D
    ld   [$ff00+c], a                             ; $43DC: $E2
    dec  a                                        ; $43DD: $3D
    ld   c, h                                     ; $43DE: $4C
    ld   c, e                                     ; $43DF: $4B
    ld   c, h                                     ; $43E0: $4C
    ld   c, e                                     ; $43E1: $4B
    db   $ed                                      ; $43E2: $ED
    dec  a                                        ; $43E3: $3D
    ld   [hl], b                                  ; $43E4: $70
    ld   c, a                                     ; $43E5: $4F
    ld   hl, sp+$3D                               ; $43E6: $F8 $3D
    inc  bc                                       ; $43E8: $03
    ld   a, $57                                   ; $43E9: $3E $57
    ld   c, e                                     ; $43EB: $4B
    ld   c, $3E                                   ; $43EC: $0E $3E
    ld   c, h                                     ; $43EE: $4C
    ld   c, e                                     ; $43EF: $4B
    ld   d, [hl]                                  ; $43F0: $56
    ld   c, e                                     ; $43F1: $4B
    ld   d, [hl]                                  ; $43F2: $56
    ld   c, e                                     ; $43F3: $4B
    call nc, $1B49                                ; $43F4: $D4 $49 $1B
    ld   c, e                                     ; $43F7: $4B
    ld   d, [hl]                                  ; $43F8: $56
    ld   c, e                                     ; $43F9: $4B
    ld   d, [hl]                                  ; $43FA: $56
    ld   c, e                                     ; $43FB: $4B
    ld   e, e                                     ; $43FC: $5B
    ld   c, d                                     ; $43FD: $4A
    ld   d, [hl]                                  ; $43FE: $56
    ld   c, e                                     ; $43FF: $4B
    ld   d, [hl]                                  ; $4400: $56
    ld   c, e                                     ; $4401: $4B
    cpl                                           ; $4402: $2F
    ld   c, e                                     ; $4403: $4B
    add  hl, de                                   ; $4404: $19
    ld   c, d                                     ; $4405: $4A
    daa                                           ; $4406: $27
    ld   c, d                                     ; $4407: $4A
    cpl                                           ; $4408: $2F
    ld   c, e                                     ; $4409: $4B
    cpl                                           ; $440A: $2F
    ld   c, e                                     ; $440B: $4B
    cpl                                           ; $440C: $2F
    ld   c, e                                     ; $440D: $4B
    jr   z, jr_020_445A                           ; $440E: $28 $4A

    cpl                                           ; $4410: $2F
    ld   c, e                                     ; $4411: $4B
    ld   d, [hl]                                  ; $4412: $56
    ld   c, e                                     ; $4413: $4B
    ld   c, $4B                                   ; $4414: $0E $4B
    ld   d, [hl]                                  ; $4416: $56
    ld   c, e                                     ; $4417: $4B
    cpl                                           ; $4418: $2F
    ld   c, e                                     ; $4419: $4B
    add  e                                        ; $441A: $83
    ld   c, a                                     ; $441B: $4F
    ld   d, [hl]                                  ; $441C: $56
    ld   c, e                                     ; $441D: $4B
    ld   d, [hl]                                  ; $441E: $56
    ld   c, e                                     ; $441F: $4B
    ld   d, [hl]                                  ; $4420: $56
    ld   c, e                                     ; $4421: $4B
    ld   a, h                                     ; $4422: $7C
    ld   c, c                                     ; $4423: $49
    ld   d, [hl]                                  ; $4424: $56
    ld   c, e                                     ; $4425: $4B
    ld   d, [hl]                                  ; $4426: $56
    ld   c, e                                     ; $4427: $4B
    xor  l                                        ; $4428: $AD
    ld   c, c                                     ; $4429: $49
    inc  [hl]                                     ; $442A: $34
    ld   c, d                                     ; $442B: $4A
    ld   d, [hl]                                  ; $442C: $56
    ld   c, e                                     ; $442D: $4B
    db   $f4                                      ; $442E: $F4
    ld   c, c                                     ; $442F: $49
    ld   [$ff00+c], a                             ; $4430: $E2
    ld   c, c                                     ; $4431: $49
    ld   d, [hl]                                  ; $4432: $56
    ld   c, e                                     ; $4433: $4B
    ld   d, [hl]                                  ; $4434: $56
    ld   c, e                                     ; $4435: $4B
    ld   d, [hl]                                  ; $4436: $56
    ld   c, e                                     ; $4437: $4B
    ld   d, [hl]                                  ; $4438: $56
    ld   c, e                                     ; $4439: $4B
    ld   d, [hl]                                  ; $443A: $56
    ld   c, e                                     ; $443B: $4B
    ld   d, [hl]                                  ; $443C: $56
    ld   c, e                                     ; $443D: $4B
    add  e                                        ; $443E: $83
    ld   c, a                                     ; $443F: $4F
    ld   d, [hl]                                  ; $4440: $56
    ld   c, e                                     ; $4441: $4B
    ld   d, [hl]                                  ; $4442: $56
    ld   c, e                                     ; $4443: $4B
    ret  z                                        ; $4444: $C8

    ld   c, c                                     ; $4445: $49
    ld   d, [hl]                                  ; $4446: $56
    ld   c, e                                     ; $4447: $4B
    ld   d, [hl]                                  ; $4448: $56
    ld   c, e                                     ; $4449: $4B
    ld   d, [hl]                                  ; $444A: $56
    ld   c, e                                     ; $444B: $4B
    add  b                                        ; $444C: $80
    ld   c, c                                     ; $444D: $49
    ld   d, [hl]                                  ; $444E: $56
    ld   c, e                                     ; $444F: $4B
    ld   d, [hl]                                  ; $4450: $56
    ld   c, e                                     ; $4451: $4B
    ld   h, $49                                   ; $4452: $26 $49
    ld   d, [hl]                                  ; $4454: $56
    ld   c, e                                     ; $4455: $4B
    ld   d, [hl]                                  ; $4456: $56
    ld   c, e                                     ; $4457: $4B
    ld   d, [hl]                                  ; $4458: $56
    ld   c, e                                     ; $4459: $4B

jr_020_445A:
    xor  b                                        ; $445A: $A8
    ld   c, [hl]                                  ; $445B: $4E
    ld   d, [hl]                                  ; $445C: $56
    ld   c, e                                     ; $445D: $4B
    jp   nz, label_020_5649                       ; $445E: $C2 $49 $56

    ld   c, e                                     ; $4461: $4B
    ld   d, [hl]                                  ; $4462: $56
    ld   c, e                                     ; $4463: $4B
    dec  a                                        ; $4464: $3D
    ld   c, c                                     ; $4465: $49
    ld   d, [hl]                                  ; $4466: $56
    ld   c, e                                     ; $4467: $4B
    ld   d, [hl]                                  ; $4468: $56
    ld   c, e                                     ; $4469: $4B
    ld   b, e                                     ; $446A: $43
    ld   c, c                                     ; $446B: $49
    ld   d, [hl]                                  ; $446C: $56
    ld   c, e                                     ; $446D: $4B
    ld   d, [hl]                                  ; $446E: $56
    ld   c, e                                     ; $446F: $4B
    ld   d, [hl]                                  ; $4470: $56
    ld   c, e                                     ; $4471: $4B
    ld   d, [hl]                                  ; $4472: $56
    ld   c, e                                     ; $4473: $4B
    ld   d, [hl]                                  ; $4474: $56
    ld   c, e                                     ; $4475: $4B
    ld   d, [hl]                                  ; $4476: $56
    ld   c, e                                     ; $4477: $4B
    ld   d, [hl]                                  ; $4478: $56
    ld   c, e                                     ; $4479: $4B
    ld   d, [hl]                                  ; $447A: $56
    ld   c, e                                     ; $447B: $4B
    or   l                                        ; $447C: $B5
    ld   c, c                                     ; $447D: $49
    ld   c, h                                     ; $447E: $4C
    ld   c, e                                     ; $447F: $4B
    ld   l, b                                     ; $4480: $68
    ld   c, a                                     ; $4481: $4F
    ld   d, [hl]                                  ; $4482: $56
    ld   c, e                                     ; $4483: $4B
    ld   d, [hl]                                  ; $4484: $56
    ld   c, e                                     ; $4485: $4B
    ld   d, [hl]                                  ; $4486: $56
    ld   c, e                                     ; $4487: $4B
    add  e                                        ; $4488: $83
    ld   c, a                                     ; $4489: $4F
    ld   [hl], h                                  ; $448A: $74
    ld   c, c                                     ; $448B: $49
    ld   d, [hl]                                  ; $448C: $56
    ld   c, e                                     ; $448D: $4B
    ld   d, [hl]                                  ; $448E: $56
    ld   c, e                                     ; $448F: $4B
    ld   d, [hl]                                  ; $4490: $56
    ld   c, e                                     ; $4491: $4B
    or   c                                        ; $4492: $B1
    ld   c, c                                     ; $4493: $49
    ld   d, [hl]                                  ; $4494: $56
    ld   c, e                                     ; $4495: $4B
    ld   h, l                                     ; $4496: $65
    ld   c, c                                     ; $4497: $49
    ld   [hl], e                                  ; $4498: $73
    ld   c, c                                     ; $4499: $49
    add  e                                        ; $449A: $83
    ld   c, a                                     ; $449B: $4F
    ld   d, [hl]                                  ; $449C: $56
    ld   c, e                                     ; $449D: $4B
    ld   d, [hl]                                  ; $449E: $56
    ld   c, e                                     ; $449F: $4B
    ld   d, [hl]                                  ; $44A0: $56
    ld   c, e                                     ; $44A1: $4B
    ld   d, [hl]                                  ; $44A2: $56
    ld   c, e                                     ; $44A3: $4B
    ld   e, d                                     ; $44A4: $5A
    ld   c, c                                     ; $44A5: $49
    inc  [hl]                                     ; $44A6: $34
    ld   c, c                                     ; $44A7: $49
    ld   d, [hl]                                  ; $44A8: $56
    ld   c, e                                     ; $44A9: $4B
    ld   d, [hl]                                  ; $44AA: $56
    ld   c, e                                     ; $44AB: $4B
    ld   d, [hl]                                  ; $44AC: $56
    ld   c, e                                     ; $44AD: $4B
    ld   d, [hl]                                  ; $44AE: $56
    ld   c, e                                     ; $44AF: $4B
    ld   d, [hl]                                  ; $44B0: $56
    ld   c, e                                     ; $44B1: $4B
    ld   d, [hl]                                  ; $44B2: $56
    ld   c, e                                     ; $44B3: $4B
    ld   d, [hl]                                  ; $44B4: $56
    ld   c, e                                     ; $44B5: $4B
    ld   d, [hl]                                  ; $44B6: $56
    ld   c, e                                     ; $44B7: $4B
    ld   h, c                                     ; $44B8: $61
    ld   c, e                                     ; $44B9: $4B
    ld   d, [hl]                                  ; $44BA: $56
    ld   c, e                                     ; $44BB: $4B
    ld   d, [hl]                                  ; $44BC: $56
    ld   c, e                                     ; $44BD: $4B
    ld   d, [hl]                                  ; $44BE: $56
    ld   c, e                                     ; $44BF: $4B
    ld   d, [hl]                                  ; $44C0: $56
    ld   c, e                                     ; $44C1: $4B
    ld   d, [hl]                                  ; $44C2: $56
    ld   c, e                                     ; $44C3: $4B
    ld   d, [hl]                                  ; $44C4: $56
    ld   c, e                                     ; $44C5: $4B
    ld   d, [hl]                                  ; $44C6: $56
    ld   c, e                                     ; $44C7: $4B
    ld   d, [hl]                                  ; $44C8: $56
    ld   c, e                                     ; $44C9: $4B
    ld   d, [hl]                                  ; $44CA: $56
    ld   c, e                                     ; $44CB: $4B
    ld   d, [hl]                                  ; $44CC: $56
    ld   c, e                                     ; $44CD: $4B
    ld   d, [hl]                                  ; $44CE: $56
    ld   c, e                                     ; $44CF: $4B
    ld   d, [hl]                                  ; $44D0: $56
    ld   c, e                                     ; $44D1: $4B
    ld   d, [hl]                                  ; $44D2: $56
    ld   c, e                                     ; $44D3: $4B
    ld   d, [hl]                                  ; $44D4: $56
    ld   c, e                                     ; $44D5: $4B
    ld   d, [hl]                                  ; $44D6: $56
    ld   c, e                                     ; $44D7: $4B
    xor  b                                        ; $44D8: $A8
    ld   c, [hl]                                  ; $44D9: $4E
    ld   d, [hl]                                  ; $44DA: $56
    ld   c, e                                     ; $44DB: $4B
    ld   d, [hl]                                  ; $44DC: $56
    ld   c, e                                     ; $44DD: $4B
    ld   d, [hl]                                  ; $44DE: $56
    ld   c, e                                     ; $44DF: $4B
    ld   d, [hl]                                  ; $44E0: $56
    ld   c, e                                     ; $44E1: $4B
    ld   d, [hl]                                  ; $44E2: $56
    ld   c, e                                     ; $44E3: $4B
    ld   d, [hl]                                  ; $44E4: $56
    ld   c, e                                     ; $44E5: $4B
    ld   d, [hl]                                  ; $44E6: $56
    ld   c, e                                     ; $44E7: $4B
    ld   d, [hl]                                  ; $44E8: $56
    ld   c, e                                     ; $44E9: $4B
    ld   d, [hl]                                  ; $44EA: $56
    ld   c, e                                     ; $44EB: $4B
    and  $49                                      ; $44EC: $E6 $49
    and  [hl]                                     ; $44EE: $A6
    ld   c, c                                     ; $44EF: $49
    ld   d, [hl]                                  ; $44F0: $56
    ld   c, e                                     ; $44F1: $4B
    ld   d, [hl]                                  ; $44F2: $56
    ld   c, e                                     ; $44F3: $4B
    ld   c, h                                     ; $44F4: $4C
    ld   c, e                                     ; $44F5: $4B
    ld   c, h                                     ; $44F6: $4C
    ld   c, e                                     ; $44F7: $4B
    ld   c, h                                     ; $44F8: $4C
    ld   c, e                                     ; $44F9: $4B
    add  c                                        ; $44FA: $81
    ld   c, e                                     ; $44FB: $4B
    add  c                                        ; $44FC: $81
    ld   c, e                                     ; $44FD: $4B
    add  c                                        ; $44FE: $81
    ld   c, e                                     ; $44FF: $4B
    adc  a                                        ; $4500: $8F
    ld   c, e                                     ; $4501: $4B
    sbc  d                                        ; $4502: $9A
    ld   c, e                                     ; $4503: $4B
    and  [hl]                                     ; $4504: $A6
    ld   c, e                                     ; $4505: $4B
    ret  nz                                       ; $4506: $C0

    ld   c, e                                     ; $4507: $4B
    cp   b                                        ; $4508: $B8
    ld   c, e                                     ; $4509: $4B
    call c, Func_020_564B                         ; $450A: $DC $4B $56
    ld   c, e                                     ; $450D: $4B
    db   $eb                                      ; $450E: $EB
    ld   c, e                                     ; $450F: $4B
    ld   bc, $2D4C                                ; $4510: $01 $4C $2D
    ld   c, h                                     ; $4513: $4C
    bit  1, e                                     ; $4514: $CB $4B
    ld   d, [hl]                                  ; $4516: $56
    ld   c, e                                     ; $4517: $4B

Func_020_4518::
    ldh  a, [hActiveEntityType]                     ; $4518: $F0 $EB
    ld   e, a                                     ; $451A: $5F
    ld   d, $00                                   ; $451B: $16 $00
    ld   hl, data_020_4322                        ; $451D: $21 $22 $43
    sla  e                                        ; $4520: $CB $23
    rl   d                                        ; $4522: $CB $12
    add  hl, de                                   ; $4524: $19
    ld   e, [hl]                                  ; $4525: $5E
    inc  hl                                       ; $4526: $23
    ld   d, [hl]                                  ; $4527: $56
    push de                                       ; $4528: $D5
    pop  hl                                       ; $4529: $E1
    ret                                           ; $452A: $C9

BGMapToLoadAdjustementTable::
    nop                                           ; $452B: $00
    nop                                           ; $452C: $00
    db   $CC, $56, $48
    ld   h, a                                     ; $4530: $67
    ld   [hl], $63                                ; $4531: $36 $63
    jr   z, jr_020_4598                           ; $4533: $28 $63

    ld   c, l                                     ; $4535: $4D
    ld   h, h                                     ; $4536: $64
    adc  c                                        ; $4537: $89
    ld   h, l                                     ; $4538: $65
    ld   d, c                                     ; $4539: $51
    sub  $E9                                      ; $453A: $D6 $E9
    ld   h, d                                     ; $453C: $62
    ret                                           ; $453D: $C9

    ld   h, a                                     ; $453E: $67
    adc  a                                        ; $453F: $8F
    ld   l, c                                     ; $4540: $69
    or   $68                                      ; $4541: $F6 $68
    ld   h, b                                     ; $4543: $60
    ld   h, [hl]                                  ; $4544: $66
    ld   l, l                                     ; $4545: $6D
    ld   l, d                                     ; $4546: $6A
    xor  $6A                                      ; $4547: $EE $6A
    add  b                                        ; $4549: $80
    ld   l, l                                     ; $454A: $6D
    adc  e                                        ; $454B: $8B
    ld   l, a                                     ; $454C: $6F
    ld   a, [bc]                                  ; $454D: $0A
    ld   [hl], c                                  ; $454E: $71
    ld   [hl+], a                                 ; $454F: $22
    ld   [hl], h                                  ; $4550: $74
    db   $e3                                      ; $4551: $E3
    ld   [hl], l                                  ; $4552: $75
    xor  b                                        ; $4553: $A8
    ld   h, d                                     ; $4554: $62
    add  e                                        ; $4555: $83
    ld   [hl], d                                  ; $4556: $72
    adc  h                                        ; $4557: $8C
    ld   d, a                                     ; $4558: $57
    push af                                       ; $4559: $F5
    ld   e, d                                     ; $455A: $5A
    ret  z                                        ; $455B: $C8

    ld   e, e                                     ; $455C: $5B
    inc  c                                        ; $455D: $0C
    ld   e, l                                     ; $455E: $5D
    ld   e, e                                     ; $455F: $5B
    ld   e, [hl]                                  ; $4560: $5E
    ld   b, a                                     ; $4561: $47
    ld   e, a                                     ; $4562: $5F
    inc  b                                        ; $4563: $04
    ld   h, b                                     ; $4564: $60
    inc  b                                        ; $4565: $04
    ld   h, b                                     ; $4566: $60
    sbc  d                                        ; $4567: $9A
    ld   c, [hl]                                  ; $4568: $4E
    ld   d, b                                     ; $4569: $50
    ld   d, b                                     ; $456A: $50
    rst  $28                                      ; $456B: $EF
    ld   d, c                                     ; $456C: $51
    adc  [hl]                                     ; $456D: $8E
    ld   d, e                                     ; $456E: $53
    dec  l                                        ; $456F: $2D
    ld   d, l                                     ; $4570: $55
    add  c                                        ; $4571: $81
    ld   [hl], a                                  ; $4572: $77
    call nc, $374D                                ; $4573: $D4 $4D $37
    ld   l, h                                     ; $4576: $6C

; Manipulate wBGMapToLoad
Func_020_4577::
    ld   hl, BGMapToLoadAdjustementTable          ; $4577: $21 $2B $45
    ld   b, $00                                   ; $457A: $06 $00
    ld   a, [wBGMapToLoad]                        ; $457C: $FA $FF $D6
    sla  a                                        ; $457F: $CB $27
    ld   c, a                                     ; $4581: $4F
    add  hl, bc                                   ; $4582: $09
    ld   a, [hl]                                  ; $4583: $7E
    ld   e, a                                     ; $4584: $5F
    inc  hl                                       ; $4585: $23
    ld   a, [hl]                                  ; $4586: $7E
    ld   d, a                                     ; $4587: $57
    ret                                           ; $4588: $C9

data_020_4589::
    ld   c, h                                     ; $4589: $4C
    ld   h, d                                     ; $458A: $62
    ld   h, e                                     ; $458B: $63
    ld   h, [hl]                                  ; $458C: $66
    ld   l, e                                     ; $458D: $6B
    ld   h, e                                     ; $458E: $63
    ld   h, l                                     ; $458F: $65
    ld   h, h                                     ; $4590: $64
    ld   h, b                                     ; $4591: $60
    ld   c, h                                     ; $4592: $4C
    ld   c, l                                     ; $4593: $4D
    ld   c, h                                     ; $4594: $4C
    ld   c, h                                     ; $4595: $4C
    ld   c, h                                     ; $4596: $4C
    ld   c, [hl]                                  ; $4597: $4E

jr_020_4598:
    ld   c, [hl]                                  ; $4598: $4E
    ld   c, [hl]                                  ; $4599: $4E
    ld   c, l                                     ; $459A: $4D
    ld   c, l                                     ; $459B: $4D
    ld   c, a                                     ; $459C: $4F
    ld   h, c                                     ; $459D: $61
    ld   h, e                                     ; $459E: $63
    ld   h, e                                     ; $459F: $63
    nop                                           ; $45A0: $00
    nop                                           ; $45A1: $00
    nop                                           ; $45A2: $00
    nop                                           ; $45A3: $00
    nop                                           ; $45A4: $00
    nop                                           ; $45A5: $00
    ld   c, [hl]                                  ; $45A6: $4E
    ld   c, [hl]                                  ; $45A7: $4E
    ld   c, l                                     ; $45A8: $4D
    ld   b, b                                     ; $45A9: $40
    ld   b, b                                     ; $45AA: $40
    ld   l, h                                     ; $45AB: $6C
    ld   b, b                                     ; $45AC: $40
    ld   b, b                                     ; $45AD: $40
    ld   l, h                                     ; $45AE: $6C
    ld   b, b                                     ; $45AF: $40
    ld   l, [hl]                                  ; $45B0: $6E
    ld   c, d                                     ; $45B1: $4A
    ld   b, b                                     ; $45B2: $40
    ld   b, [hl]                                  ; $45B3: $46
    ld   b, b                                     ; $45B4: $40
    ld   b, b                                     ; $45B5: $40
    ld   b, b                                     ; $45B6: $40
    ld   c, b                                     ; $45B7: $48
    ld   c, b                                     ; $45B8: $48
    ld   c, b                                     ; $45B9: $48
    ld   b, [hl]                                  ; $45BA: $46
    ld   c, b                                     ; $45BB: $48
    ld   c, d                                     ; $45BC: $4A
    ld   b, b                                     ; $45BD: $40
    ld   b, [hl]                                  ; $45BE: $46
    ld   l, h                                     ; $45BF: $6C
    nop                                           ; $45C0: $00
    nop                                           ; $45C1: $00
    nop                                           ; $45C2: $00
    nop                                           ; $45C3: $00
    nop                                           ; $45C4: $00
    nop                                           ; $45C5: $00
    ld   c, b                                     ; $45C6: $48
    ld   c, b                                     ; $45C7: $48
    ld   b, [hl]                                  ; $45C8: $46
    ld   c, d                                     ; $45C9: $4A
    ld   a, c                                     ; $45CA: $79
    ld   a, c                                     ; $45CB: $79
    ld   [hl], a                                  ; $45CC: $77
    ld   a, c                                     ; $45CD: $79
    ld   a, c                                     ; $45CE: $79
    ld   [hl], a                                  ; $45CF: $77
    ld   a, b                                     ; $45D0: $78
    ld   a, c                                     ; $45D1: $79
    ld   a, c                                     ; $45D2: $79
    ld   h, e                                     ; $45D3: $63
    ld   a, d                                     ; $45D4: $7A
    nop                                           ; $45D5: $00
    nop                                           ; $45D6: $00
    nop                                           ; $45D7: $00
    ld   a, e                                     ; $45D8: $7B
    ld   a, e                                     ; $45D9: $7B
    ld   a, e                                     ; $45DA: $7B
    ld   a, d                                     ; $45DB: $7A
    ld   a, e                                     ; $45DC: $7B
    ld   a, c                                     ; $45DD: $79
    ld   a, h                                     ; $45DE: $7C
    ld   a, d                                     ; $45DF: $7A
    ld   [hl], a                                  ; $45E0: $77
    nop                                           ; $45E1: $00
    nop                                           ; $45E2: $00
    nop                                           ; $45E3: $00
    nop                                           ; $45E4: $00
    nop                                           ; $45E5: $00
    nop                                           ; $45E6: $00
    ld   a, h                                     ; $45E7: $7C
    ld   a, e                                     ; $45E8: $7B
    ld   a, d                                     ; $45E9: $7A

data_020_45EA::
    ld   e, [hl]                                  ; $45EA: $5E
    dec  l                                        ; $45EB: $2D
    ld   e, [hl]                                  ; $45EC: $5E
    dec  l                                        ; $45ED: $2D
    ld   h, d                                     ; $45EE: $62
    dec  [hl]                                     ; $45EF: $35
    ld   h, d                                     ; $45F0: $62
    dec  [hl]                                     ; $45F1: $35
    ld   e, [hl]                                  ; $45F2: $5E
    dec  l                                        ; $45F3: $2D
    ld   e, [hl]                                  ; $45F4: $5E
    dec  l                                        ; $45F5: $2D
    ld   h, d                                     ; $45F6: $62
    dec  [hl]                                     ; $45F7: $35
    ld   h, d                                     ; $45F8: $62
    dec  [hl]                                     ; $45F9: $35
    ld   h, d                                     ; $45FA: $62
    dec  [hl]                                     ; $45FB: $35
    ld   h, d                                     ; $45FC: $62
    dec  [hl]                                     ; $45FD: $35
    ld   h, d                                     ; $45FE: $62
    dec  [hl]                                     ; $45FF: $35
    ld   h, d                                     ; $4600: $62
    dec  [hl]                                     ; $4601: $35
    ld   h, d                                     ; $4602: $62
    dec  [hl]                                     ; $4603: $35
    ld   h, d                                     ; $4604: $62
    dec  [hl]                                     ; $4605: $35
    ld   d, b                                     ; $4606: $50
    dec  l                                        ; $4607: $2D
    ld   h, d                                     ; $4608: $62
    dec  [hl]                                     ; $4609: $35
    ld   h, d                                     ; $460A: $62
    dec  [hl]                                     ; $460B: $35
    ld   h, d                                     ; $460C: $62
    dec  [hl]                                     ; $460D: $35
    ld   d, b                                     ; $460E: $50
    dec  l                                        ; $460F: $2D
    ld   h, d                                     ; $4610: $62
    dec  [hl]                                     ; $4611: $35
    ld   h, d                                     ; $4612: $62
    dec  [hl]                                     ; $4613: $35
    ld   h, d                                     ; $4614: $62
    dec  [hl]                                     ; $4615: $35

Func_020_4616::
    push de                                       ; $4616: $D5
    ldh  a, [hMapRoom]                            ; $4617: $F0 $F6
    and  a                                        ; $4619: $A7
    jr   z, jr_020_4620                           ; $461A: $28 $04

    cp   $05                                      ; $461C: $FE $05
    jr   nz, jr_020_4640                          ; $461E: $20 $20

jr_020_4620:
    ld   a, [$D6FB]                               ; $4620: $FA $FB $D6
    and  a                                        ; $4623: $A7
    jr   z, jr_020_4640                           ; $4624: $28 $1A

    ld   a, c                                     ; $4626: $79
    cp   $40                                      ; $4627: $FE $40
    jr   z, jr_020_462F                           ; $4629: $28 $04

    cp   $80                                      ; $462B: $FE $80
    jr   nz, jr_020_4640                          ; $462D: $20 $11

jr_020_462F:
    xor  $C0                                      ; $462F: $EE $C0
    ld   l, a                                     ; $4631: $6F
    ld   h, $5E                                   ; $4632: $26 $5E
    ld   a, [$D6FB]                               ; $4634: $FA $FB $D6
    ldh  [$FFBB], a                               ; $4637: $E0 $BB
    ld   [wRoomSwitchableObject], a               ; $4639: $EA $FA $D6
    pop  de                                       ; $463C: $D1
    ld   a, $2D                                   ; $463D: $3E $2D
    ret                                           ; $463F: $C9

jr_020_4640:
    ld   hl, data_020_45EA                        ; $4640: $21 $EA $45
    ldh  a, [hMapRoom]                            ; $4643: $F0 $F6
    sla  a                                        ; $4645: $CB $27
    ld   e, a                                     ; $4647: $5F
    ld   d, $00                                   ; $4648: $16 $00
    add  hl, de                                   ; $464A: $19
    inc  hl                                       ; $464B: $23
    ld   a, [hl]                                  ; $464C: $7E
    ld   e, a                                     ; $464D: $5F
    dec  hl                                       ; $464E: $2B
    ld   a, [hl]                                  ; $464F: $7E
    ld   h, a                                     ; $4650: $67
    ld   l, $00                                   ; $4651: $2E $00
    add  hl, bc                                   ; $4653: $09
    ld   a, e                                     ; $4654: $7B
    pop  de                                       ; $4655: $D1
    ret                                           ; $4656: $C9

; Retrieve the address of a tilemap loading handler
;   input:  wTileMapToLoad in e
;   output: address to jump to in hl
GetTilemapHandlerAddress::
    ; de = (e - 1) * 2
    dec  e                                        ; $4657: $1D
    sla  e                                        ; $4658: $CB $23
    ld   d, $00                                   ; $465A: $16 $00
    ld   hl, TilemapLoadingHandlersTable          ; $465C: $21 $64 $46
    add  hl, de                                   ; $465F: $19
    ld   a, [hl+]                                 ; $4660: $2A
    ld   h, [hl]                                  ; $4661: $66
    ld   l, a                                     ; $4662: $6F
    ret                                           ; $4663: $C9

; Pointers to addresses to execute for loading a specific tilemap
TilemapLoadingHandlersTable::
._01 dw LoadTilemap1
._02 dw ClearBGMap
._03 dw LoadBaseTiles
._04 dw LoadInventoryTiles
._05 dw LoadTilemap5
._06 dw LoadDungeonTiles
._07 dw LoadTilemap5
._08 dw LoadTilemap8
._09 dw LoadTilemap9
._0A dw LoadMapData.return
._0B dw LoadTilemap0B
._0C dw LoadMapData.return
._0D dw LoadTilemap0D
._0E dw LoadTilemap0E_trampoline
._0F dw LoadTilemap0F_trampoline
._10 dw LoadIntroSequenceTiles
._11 dw LoadTilemap11
._12 dw LoadTilemap12
._13 dw LoadTilemap13
._14 dw LoadTilemap14
._15 dw LoadTilemap15
._16 dw LoadTilemap16
._17 dw LoadTilemap17
._18 dw LoadTilemap18
._19 dw LoadTilemap19
._1A dw LoadTilemap1A
._1B dw LoadTilemap1B
._1C dw LoadTilemap1A
._1D dw LoadTilemap1D
._1E dw LoadTilemap1E
._1F dw LoadTilemap1F
._20 dw LoadTilemap20
._21 dw LoadTilemap21
._22 dw LoadTilemap22_trampoline
._23 dw LoadTilemap23_trampoline

data_020_46AA::
    db   $51, $35
    db   $4F, $35, $00, $00, $4B, $35, $00, $00  ; $46AC |O5..K5..|
    db   $00, $00, $00, $00, $44, $35, $00, $00  ; $46B4 |....D5..|
    db   $00, $00, $00, $00, $00, $00, $48, $35  ; $46BC |......H5|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $46C4 |........|
    db   $44, $35, $4E, $35, $00, $00, $00, $00  ; $46CC |D5N5....|
    db   $00, $00, $00, $00, $4D, $31, $00, $00  ; $46D4 |....M1..|
    db   $4C, $35, $51, $2E, $45, $35, $45, $35  ; $46DC |L5Q.E5E5|
    db   $00, $00, $45, $35, $00, $00, $45, $35  ; $46E4 |..E5..E5|
    db   $00, $00, $49, $35, $00, $00, $00, $00  ; $46EC |..I5....|
    db   $45, $35, $00, $00, $45, $35, $00, $00  ; $46F4 |E5..E5..|
    db   $00, $00, $00, $00, $00, $00, $50, $35  ; $46FC |......P5|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $4704 |........|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $470C |........|
    db   $46, $35, $00, $00, $00, $00, $4A, $35  ; $4714 |F5....J5|
    db   $00, $00, $46, $35, $00, $00, $00, $00  ; $471C |..F5....|
    db   $00, $00, $00, $00, $00, $00, $00, $00  ; $4724 |........|
    db   $46, $35, $00, $00, $00, $00, $00, $00  ; $472C |F5......|
    db   $4D, $35, $00, $00, $00, $00, $00, $00  ; $4734 |M5......|
    db   $00, $00, $47, $35, $00, $00, $47, $35  ; $473C |..G5..G5|
    db   $47, $35, $00, $00, $47, $35, $00, $00  ; $4744 |G5..G5..|
    db   $47, $35, $47, $35, $00, $00, $00, $00  ; $474C |G5G5....|
    db   $00, $00, $47, $35, $00, $00            ; $4754 |..G5..|

; Color-dungeon related function
Func_020_475A::
    ld   hl, data_020_46AA                        ; $475A: $21 $AA $46
    ldh  a, [hMapRoom]                            ; $475D: $F0 $F6
    rla                                           ; $475F: $17
    ld   e, a                                     ; $4760: $5F
    ld   d, $00                                   ; $4761: $16 $00
    inc  e                                        ; $4763: $1C
    push de                                       ; $4764: $D5
    add  hl, de                                   ; $4765: $19
    ld   a, [hl]                                  ; $4766: $7E
    and  a                                        ; $4767: $A7
    jr   z, jr_020_4776                           ; $4768: $28 $0C

    ld   d, a                                     ; $476A: $57
    dec  hl                                       ; $476B: $2B
    ld   a, [hl]                                  ; $476C: $7E
    ld   b, a                                     ; $476D: $47
    ld   c, $04                                   ; $476E: $0E $04
    ld   a, d                                     ; $4770: $7A
    ld   h, $20                                   ; $4771: $26 $20
    call Copy100BytesFromBankAtA                  ; $4773: $CD $13 $0A

jr_020_4776:
    pop  de                                       ; $4776: $D1
    push de                                       ; $4777: $D5
    ld   hl, $46D6                                ; $4778: $21 $D6 $46
    add  hl, de                                   ; $477B: $19
    ld   a, [hl]                                  ; $477C: $7E
    and  a                                        ; $477D: $A7
    jr   z, jr_020_478C                           ; $477E: $28 $0C

    ld   d, a                                     ; $4780: $57
    dec  hl                                       ; $4781: $2B
    ld   a, [hl]                                  ; $4782: $7E
    ld   b, a                                     ; $4783: $47
    ld   c, $05                                   ; $4784: $0E $05
    ld   a, d                                     ; $4786: $7A
    ld   h, $20                                   ; $4787: $26 $20
    call Copy100BytesFromBankAtA                  ; $4789: $CD $13 $0A

jr_020_478C:
    pop  de                                       ; $478C: $D1
    push de                                       ; $478D: $D5
    ld   hl, $4702                                ; $478E: $21 $02 $47
    add  hl, de                                   ; $4791: $19
    ld   a, [hl]                                  ; $4792: $7E
    and  a                                        ; $4793: $A7
    jr   z, jr_020_47A2                           ; $4794: $28 $0C

    ld   d, a                                     ; $4796: $57
    dec  hl                                       ; $4797: $2B
    ld   a, [hl]                                  ; $4798: $7E
    ld   b, a                                     ; $4799: $47
    ld   c, $06                                   ; $479A: $0E $06
    ld   a, d                                     ; $479C: $7A
    ld   h, $20                                   ; $479D: $26 $20
    call Copy100BytesFromBankAtA                  ; $479F: $CD $13 $0A

jr_020_47A2:
    pop  de                                       ; $47A2: $D1
    ld   hl, $472E                                ; $47A3: $21 $2E $47
    add  hl, de                                   ; $47A6: $19
    ld   a, [hl]                                  ; $47A7: $7E
    and  a                                        ; $47A8: $A7
    jr   z, jr_020_47B7                           ; $47A9: $28 $0C

    ld   d, a                                     ; $47AB: $57
    dec  hl                                       ; $47AC: $2B
    ld   a, [hl]                                  ; $47AD: $7E
    ld   b, a                                     ; $47AE: $47
    ld   c, $07                                   ; $47AF: $0E $07
    ld   a, d                                     ; $47B1: $7A
    ld   h, $20                                   ; $47B2: $26 $20
    call Copy100BytesFromBankAtA                  ; $47B4: $CD $13 $0A

jr_020_47B7:
    ldh  a, [hMapRoom]                            ; $47B7: $F0 $F6
    cp   $01                                      ; $47B9: $FE $01
    jr   nz, jr_020_47C2                          ; $47BB: $20 $05

    ld   a, $20                                   ; $47BD: $3E $20
    call CopyColorDungeonSymbols                                ; $47BF: $CD $32 $0A

jr_020_47C2:
    ret                                           ; $47C2: $C9

data_020_47C3::
    nop                                           ; $47C3: $00
    ld   b, b                                     ; $47C4: $40
    add  b                                        ; $47C5: $80
    ret  nz                                       ; $47C6: $C0

    nop                                           ; $47C7: $00
    ld   b, b                                     ; $47C8: $40
    add  b                                        ; $47C9: $80
    ret  nz                                       ; $47CA: $C0

MapRoomTable_b0::
    nop                                           ; $47CB: $00
    nop                                           ; $47CC: $00
    nop                                           ; $47CD: $00
    nop                                           ; $47CE: $00
    nop                                           ; $47CF: $00
    nop                                           ; $47D0: $00
    nop                                           ; $47D1: $00
    nop                                           ; $47D2: $00
    nop                                           ; $47D3: $00
    nop                                           ; $47D4: $00
    nop                                           ; $47D5: $00
    nop                                           ; $47D6: $00
    nop                                           ; $47D7: $00
    nop                                           ; $47D8: $00
    nop                                           ; $47D9: $00
    inc  b                                        ; $47DA: $04
    nop                                           ; $47DB: $00
    nop                                           ; $47DC: $00
    nop                                           ; $47DD: $00
    inc  b                                        ; $47DE: $04
    nop                                           ; $47DF: $00
    nop                                           ; $47E0: $00

MapRoomTable_b1::
    nop                                           ; $47E1: $00
    nop                                           ; $47E2: $00
    nop                                           ; $47E3: $00
    nop                                           ; $47E4: $00
    nop                                           ; $47E5: $00
    nop                                           ; $47E6: $00
    nop                                           ; $47E7: $00
    nop                                           ; $47E8: $00
    nop                                           ; $47E9: $00
    dec  b                                        ; $47EA: $05
    nop                                           ; $47EB: $00
    nop                                           ; $47EC: $00
    nop                                           ; $47ED: $00
    nop                                           ; $47EE: $00
    dec  b                                        ; $47EF: $05
    nop                                           ; $47F0: $00
    nop                                           ; $47F1: $00
    nop                                           ; $47F2: $00
    nop                                           ; $47F3: $00
    nop                                           ; $47F4: $00
    nop                                           ; $47F5: $00
    dec  b                                        ; $47F6: $05

; Configure the parameters for copying the animated tiles.
; First called with b=1, then with b=0
; Inputs:
;   b:  ??? (0 or 1)
ConfigureAnimatedTilesCopy::
    ldh  a, [hMapRoom]                            ; $47F7: $F0 $F6
    ld   c, a                                     ; $47F9: $4F

    ; hl = (b == 0 ? MapRoomTable_b0 : MapRoomTable_b1)
    ld   hl, MapRoomTable_b0                      ; $47FA: $21 $CB $47
    ld   a, b                                     ; $47FD: $78
    and  a                                        ; $47FE: $A7
    jr   z, .b1End                                ; $47FF: $28 $03
    ld   hl, MapRoomTable_b1                      ; $4801: $21 $E1 $47
.b1End

    ld   b, $00                                   ; $4804: $06 $00
    add  hl, bc                                   ; $4806: $09
    ld   a, [hl]                                  ; $4807: $7E
    and  a                                        ; $4808: $A7
    ret  z                                        ; $4809: $C8

    ld   b, a                                     ; $480A: $47
    ld   c, $00                                   ; $480B: $0E $00
    ldh  a, [hAnimatedTilesFrameCount]            ; $480D: $F0 $A6
    rra                                           ; $480F: $1F
    rra                                           ; $4810: $1F
    rra                                           ; $4811: $1F
    and  $07                                      ; $4812: $E6 $07
    ld   e, a                                     ; $4814: $5F
    ld   d, $00                                   ; $4815: $16 $00
    ld   hl, data_020_47C3                       ; $4817: $21 $C3 $47
    add  hl, de                                   ; $481A: $19
    ld   l, [hl]                                  ; $481B: $6E
    ld   h, $00                                   ; $481C: $26 $00
    ld   de, $6000                                ; $481E: $11 $00 $60
    add  hl, bc                                   ; $4821: $09
    add  hl, de                                   ; $4822: $19
    ld   de, $8FC0                                ; $4823: $11 $C0 $8F
    ld   bc, $0040                                ; $4826: $01 $40 $00
    ld   a, $35                                   ; $4829: $3E $35
    and  a                                        ; $482B: $A7
    ret                                           ; $482C: $C9

; Replace objects $56 and $57 by object $0D.
; Used in the color dungeon.
ReplaceObjects56and57::
    di                                            ; $482D: $F3
    ld   bc, wRoomObjectsArea                     ; $482E: $01 $00 $D7
    ld   de, wIsFileSelectionArrowShifted         ; $4831: $11 $00 $D0
    ld   hl, rSVBK                                ; $4834: $21 $70 $FF

    ; For each object in the room…
.loop
    ; If the object type is $56 or $57…
    ld   a, [bc]                                  ; $4837: $0A
    cp   $56                                      ; $4838: $FE $56
    jr   z, .handleSpecialObject                  ; $483A: $28 $04

    cp   $57                                      ; $483C: $FE $57
    jr   nz, .continue                            ; $483E: $20 $0B

.handleSpecialObject
    ld   [hl], $05                                ; $4840: $36 $05
    ld   a, [de]                                  ; $4842: $1A
    ld   [hl], $00                                ; $4843: $36 $00
    and  a                                        ; $4845: $A7
    jr   z, .continue                             ; $4846: $28 $03

    ld   a, $0D                                   ; $4848: $3E $0D
    ld   [bc], a                                  ; $484A: $02

.continue
    inc  bc                                       ; $484B: $03
    inc  de                                       ; $484C: $13
    ld   a, e                                     ; $484D: $7B
    cp   $C0                                      ; $484E: $FE $C0
    jr   nz, .loop                                ; $4850: $20 $E5

    ei                                            ; $4852: $FB
    ret                                           ; $4853: $C9

; On GBC, clear the $0C first bytes of WRAM bank 5
ClearWRAMBank5::
    ; If not on GBC, return
    ldh  a, [hIsGBC]                              ; $4854: $F0 $FE
    and  a                                        ; $4856: $A7
    ret  z                                        ; $4857: $C8

    di                                            ; $4858: $F3
    ld   a, $05                                   ; $4859: $3E $05
    ld   [rSVBK], a                               ; $485B: $E0 $70
    ld   hl, $D000                                ; $485D: $21 $00 $D0

.loop
    xor  a                                        ; $4860: $AF
    ld   [hl+], a                                 ; $4861: $22
    ld   a, l                                     ; $4862: $7D
    cp   $C0                                      ; $4863: $FE $C0
    jr   nz, .loop                                ; $4865: $20 $F9

    xor  a                                        ; $4867: $AF
    ld   [rSVBK], a                               ; $4868: $E0 $70
    ei                                            ; $486A: $FB
    ret                                           ; $486B: $C9

Func_020_486C::
    add  hl, bc                                   ; $486C: $09
    dec  b                                        ; $486D: $05
    ld   [$0A08], sp                              ; $486E: $08 $08 $0A
    ld   a, [bc]                                  ; $4871: $0A
    rlca                                          ; $4872: $07
    inc  c                                        ; $4873: $0C

Func_020_4874::
    ld   hl, $486C                                ; $4874: $21 $6C $48
    add  hl, de                                   ; $4877: $19
    ldh  a, [hScratch0]                           ; $4878: $F0 $D7
    add  [hl]                                     ; $487A: $86
    sub  $08                                      ; $487B: $D6 $08
    and  $F0                                      ; $487D: $E6 $F0
    ldh  [hSwordIntersectedAreaX], a              ; $487F: $E0 $CE
    swap a                                        ; $4881: $CB $37
    ldh  [hScratch0], a                           ; $4883: $E0 $D7
    ld   hl, $4870                                ; $4885: $21 $70 $48
    add  hl, de                                   ; $4888: $19
    ldh  a, [hScratch1]                           ; $4889: $F0 $D8
    add  [hl]                                     ; $488B: $86
    sub  $10                                      ; $488C: $D6 $10
    and  $F0                                      ; $488E: $E6 $F0
    ld   e, a                                     ; $4890: $5F
    ldh  [hSwordIntersectedAreaY], a              ; $4891: $E0 $CD
    ldh  a, [hScratch0]                           ; $4893: $F0 $D7
    or   e                                        ; $4895: $B3
    ld   e, a                                     ; $4896: $5F
    ret                                           ; $4897: $C9

Func_020_4898::
    push de                                       ; $4898: $D5
    ld   hl, wRequestDestinationHigh              ; $4899: $21 $01 $D6
    ld   a, [wRequests]                           ; $489C: $FA $00 $D6
    ld   e, a                                     ; $489F: $5F
    add  $0A                                      ; $48A0: $C6 $0A
    ld   [wRequests], a                           ; $48A2: $EA $00 $D6
    ld   d, $00                                   ; $48A5: $16 $00
    add  hl, de                                   ; $48A7: $19
    pop  de                                       ; $48A8: $D1
    ldh  a, [$FFCF]                               ; $48A9: $F0 $CF
    ld   [hl+], a                                 ; $48AB: $22
    ldh  a, [$FFD0]                               ; $48AC: $F0 $D0
    ld   [hl+], a                                 ; $48AE: $22
    ld   a, $81                                   ; $48AF: $3E $81
    ld   [hl+], a                                 ; $48B1: $22
    ld   a, [de]                                  ; $48B2: $1A
    inc  de                                       ; $48B3: $13
    ld   [hl+], a                                 ; $48B4: $22
    ld   a, [de]                                  ; $48B5: $1A
    inc  de                                       ; $48B6: $13
    ld   [hl+], a                                 ; $48B7: $22
    ldh  a, [$FFCF]                               ; $48B8: $F0 $CF
    ld   [hl+], a                                 ; $48BA: $22
    ldh  a, [$FFD0]                               ; $48BB: $F0 $D0
    inc  a                                        ; $48BD: $3C
    ld   [hl+], a                                 ; $48BE: $22
    ld   a, $81                                   ; $48BF: $3E $81
    ld   [hl+], a                                 ; $48C1: $22
    ld   a, [de]                                  ; $48C2: $1A
    inc  de                                       ; $48C3: $13
    ld   [hl+], a                                 ; $48C4: $22
    ld   a, [de]                                  ; $48C5: $1A
    ld   [hl+], a                                 ; $48C6: $22
    ld   [hl], $00                                ; $48C7: $36 $00
    ret                                           ; $48C9: $C9

; Special code for the Color Dungeon
Func_020_48CA::
    ; If Free-movement mode is enabled, return
    ld   a, [wFreeMovementMode]                   ; $48CA: $FA $7B $C1
    and  a                                        ; $48CD: $A7
    ret  nz                                       ; $48CE: $C0

    ; If not on color dungeon, return
    ldh  a, [hMapId]                              ; $48CF: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $48D1: $FE $FF
    ret  nz                                       ; $48D3: $C0

    ldh  a, [hSwordIntersectedAreaY]              ; $48D4: $F0 $CD
    ld   d, a                                     ; $48D6: $57
    ldh  a, [hSwordIntersectedAreaX]              ; $48D7: $F0 $CE
    ld   e, a                                     ; $48D9: $5F
    push de                                       ; $48DA: $D5
    ld   d, $00                                   ; $48DB: $16 $00
    ldh  a, [hLinkDirection]                      ; $48DD: $F0 $9E
    ld   e, a                                     ; $48DF: $5F
    ldh  a, [hLinkPositionX]                      ; $48E0: $F0 $98
    ldh  [hScratch0], a                           ; $48E2: $E0 $D7
    ldh  a, [hLinkPositionY]                      ; $48E4: $F0 $99
    ldh  [hScratch1], a                           ; $48E6: $E0 $D8
    call Func_020_4874                            ; $48E8: $CD $74 $48
    ld   hl, wRoomObjects                         ; $48EB: $21 $11 $D7
    add  hl, de                                   ; $48EE: $19
    ld   a, [hl]                                  ; $48EF: $7E
    cp   $53                                      ; $48F0: $FE $53
    jr   z, jr_020_48FC                           ; $48F2: $28 $08

    cp   $55                                      ; $48F4: $FE $55
    jr   z, jr_020_48FC                           ; $48F6: $28 $04

    cp   $54                                      ; $48F8: $FE $54
    jr   nz, jr_020_490A                          ; $48FA: $20 $0E

jr_020_48FC:
    ld   a, [$C146]                               ; $48FC: $FA $46 $C1
    and  a                                        ; $48FF: $A7
    jr   nz, jr_020_4917                          ; $4900: $20 $15

    call Func_020_4954                            ; $4902: $CD $54 $49
    call UseRocksFeather                          ; $4905: $CD $CB $14
    jr   jr_020_4917                              ; $4908: $18 $0D

jr_020_490A:
    cp   $56                                      ; $490A: $FE $56
    jr   z, jr_020_4912                           ; $490C: $28 $04

    cp   $57                                      ; $490E: $FE $57
    jr   nz, jr_020_4917                          ; $4910: $20 $05

jr_020_4912:
    call $4923                                    ; $4912: $CD $23 $49
    jr   jr_020_4917                              ; $4915: $18 $00

jr_020_4917:
    pop  de                                       ; $4917: $D1
    ld   a, d                                     ; $4918: $7A
    ldh  [hSwordIntersectedAreaY], a              ; $4919: $E0 $CD
    ld   a, e                                     ; $491B: $7B
    ldh  [hSwordIntersectedAreaX], a              ; $491C: $E0 $CE
    ret                                           ; $491E: $C9

    db   $10                                      ; $491F: $10
    ld   [de], a                                  ; $4920: $12
    ld   de, $3E13                                ; $4921: $11 $13 $3E
    dec  c                                        ; $4924: $0D
    ld   [$DDD8], a                               ; $4925: $EA $D8 $DD
    ld   [hl], a                                  ; $4928: $77
    ld   a, [wAddRupeeBufferHigh]                 ; $4929: $FA $90 $DB
    add  $05                                      ; $492C: $C6 $05
    ld   [wAddRupeeBufferHigh], a                 ; $492E: $EA $90 $DB
    di                                            ; $4931: $F3
    ld   a, $05                                   ; $4932: $3E $05
    ld   [rSVBK], a                               ; $4934: $E0 $70
    ld   hl, $D011                                ; $4936: $21 $11 $D0
    add  hl, de                                   ; $4939: $19
    ld   [hl], a                                  ; $493A: $77
    xor  a                                        ; $493B: $AF
    ld   [rSVBK], a                               ; $493C: $E0 $70
    ei                                            ; $493E: $FB
    call label_2887                               ; $493F: $CD $87 $28
    push bc                                       ; $4942: $C5
    ld   a, $20                                   ; $4943: $3E $20
    call label_91D                                ; $4945: $CD $1D $09
    pop  bc                                       ; $4948: $C1
    ld   de, $491F                                ; $4949: $11 $1F $49
    call Func_020_4898                            ; $494C: $CD $98 $48
    ret                                           ; $494F: $C9

    db   $76                                      ; $4950: $76
    ld   [hl], a                                  ; $4951: $77
    db   $76                                      ; $4952: $76
    ld   [hl], a                                  ; $4953: $77

Func_020_4954::
    ld   a, [hl]                                  ; $4954: $7E
    inc  a                                        ; $4955: $3C
    ldh  [hScratch0], a                           ; $4956: $E0 $D7
    dec  a                                        ; $4958: $3D
    cp   $55                                      ; $4959: $FE $55
    jr   nz, jr_020_4961                          ; $495B: $20 $04

    ld   a, $AE                                   ; $495D: $3E $AE
    ldh  [hScratch0], a                           ; $495F: $E0 $D7

jr_020_4961:
    ldh  a, [hScratch0]                           ; $4961: $F0 $D7
    ld   [hl], a                                  ; $4963: $77
    call label_2887                               ; $4964: $CD $87 $28
    push bc                                       ; $4967: $C5
    ldh  a, [hScratch0]                           ; $4968: $F0 $D7
    ld   [$DDD8], a                               ; $496A: $EA $D8 $DD
    ld   a, $20                                   ; $496D: $3E $20
    call label_91D                                ; $496F: $CD $1D $09
    pop  bc                                       ; $4972: $C1
    ldh  a, [hScratch0]                           ; $4973: $F0 $D7
    cp   $AE                                      ; $4975: $FE $AE
    jr   nz, jr_020_497F                          ; $4977: $20 $06

    ld   de, $4950                                ; $4979: $11 $50 $49
    call Func_020_4898                            ; $497C: $CD $98 $48

jr_020_497F:
    ret                                           ; $497F: $C9

    dec  [hl]                                     ; $4980: $35
    inc  sp                                       ; $4981: $33
    inc  de                                       ; $4982: $13
    dec  d                                        ; $4983: $15

jr_020_4984:
    rla                                           ; $4984: $17

Func_020_4985::
    push bc                                       ; $4985: $C5
    push de                                       ; $4986: $D5
    ld   hl, $4980                                ; $4987: $21 $80 $49
    ld   a, [$DDD9]                               ; $498A: $FA $D9 $DD
    ld   e, a                                     ; $498D: $5F
    ld   d, $00                                   ; $498E: $16 $00
    add  hl, de                                   ; $4990: $19
    ld   a, [hl]                                  ; $4991: $7E
    ld   hl, hFFE9                                ; $4992: $21 $E9 $FF
    cp   [hl]                                     ; $4995: $BE
    jr   nz, jr_020_49AF                          ; $4996: $20 $17

    ld   a, [$DDD9]                               ; $4998: $FA $D9 $DD
    inc  a                                        ; $499B: $3C
    ld   [$DDD9], a                               ; $499C: $EA $D9 $DD
    cp   $05                                      ; $499F: $FE $05
    jr   nz, jr_020_49AF                          ; $49A1: $20 $0C

    ld   a, $80                                   ; $49A3: $3E $80
    ld   [$DDD9], a                               ; $49A5: $EA $D9 $DD
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $49A8: $3E $02
    ldh  [hJingle], a                             ; $49AA: $E0 $F2
    call ClearWRAMBank5                           ; $49AC: $CD $54 $48

jr_020_49AF:
    pop  de                                       ; $49AF: $D1
    pop  bc                                       ; $49B0: $C1
    ret                                           ; $49B1: $C9

    db   $10                                      ; $49B2: $10
    ldh  a, [$FF08]                               ; $49B3: $F0 $08
    ld   [label_C0C], sp                          ; $49B5: $08 $0C $0C
    ld   a, [rNR10]                               ; $49B8: $F0 $10

Func_020_49BA::
    ldh  a, [hLinkDirection]                      ; $49BA: $F0 $9E
    ld   e, a                                     ; $49BC: $5F
    ld   d, $00                                   ; $49BD: $16 $00
    ld   hl, $49B2                                ; $49BF: $21 $B2 $49
    add  hl, de                                   ; $49C2: $19
    ldh  a, [hLinkPositionX]                      ; $49C3: $F0 $98
    add  [hl]                                     ; $49C5: $86
    ld   [wC179], a                               ; $49C6: $EA $79 $C1
    ld   hl, $49B6                                ; $49C9: $21 $B6 $49
    add  hl, de                                   ; $49CC: $19
    ldh  a, [hLinkPositionY]                      ; $49CD: $F0 $99
    add  [hl]                                     ; $49CF: $86
    ld   [wC17a], a                               ; $49D0: $EA $7A $C1
    ld   a, $02                                   ; $49D3: $3E $02
    ld   [wC178], a                               ; $49D5: $EA $78 $C1
    ret                                           ; $49D8: $C9

; Load BG palette data
Func_020_49D9::
    ldh  a, [hBGMapOffsetHigh]                    ; $49D9: $F0 $E0
    ld   h, a                                     ; $49DB: $67
    ldh  a, [hBGMapOffsetLow]                     ; $49DC: $F0 $E1
    ld   l, a                                     ; $49DE: $6F
    ldh  a, [$FFE2]                               ; $49DF: $F0 $E2
    ld   b, a                                     ; $49E1: $47
    ldh  a, [$FFE3]                               ; $49E2: $F0 $E3
    ld   c, a                                     ; $49E4: $4F
    ldh  a, [$FFE4]                               ; $49E5: $F0 $E4
    ld   d, a                                     ; $49E7: $57
    ldh  a, [$FFE5]                               ; $49E8: $F0 $E5
    ld   e, a                                     ; $49EA: $5F
    ret                                           ; $49EB: $C9

    ld   bc, $2001                                ; $49EC: $01 $01 $20
    jr   nz, jr_020_4984                          ; $49EF: $20 $93

    sub  e                                        ; $49F1: $93
    inc  de                                       ; $49F2: $13
    inc  de                                       ; $49F3: $13

Func_020_49F4:
    ld   a, [wBGUpdateRegionOriginLow]            ; $49F4: $FA $27 $C1
    ld   [wRequestDestinationLow], a              ; $49F7: $EA $02 $D6
    ld   a, [wBGUpdateRegionOriginHigh]           ; $49FA: $FA $26 $C1
    or   $98                                      ; $49FD: $F6 $98
    ld   [wRequestDestinationHigh], a             ; $49FF: $EA $01 $D6
    ld   hl, $49F0                                ; $4A02: $21 $F0 $49
    add  hl, bc                                   ; $4A05: $09
    ld   a, [hl]                                  ; $4A06: $7E
    ld   [wRequestLength], a                      ; $4A07: $EA $03 $D6
    ld   a, $00                                   ; $4A0A: $3E $00
    ld   [$D618], a                               ; $4A0C: $EA $18 $D6
    ld   a, $EE                                   ; $4A0F: $3E $EE
    ld   [$D614], a                               ; $4A11: $EA $14 $D6
    ld   [$D615], a                               ; $4A14: $EA $15 $D6
    ld   [$D616], a                               ; $4A17: $EA $16 $D6
    ld   [$D617], a                               ; $4A1A: $EA $17 $D6
    ld   b, $D6                                   ; $4A1D: $06 $D6
    ld   c, $04                                   ; $4A1F: $0E $04
    ret                                           ; $4A21: $C9

Func_020_4A22:
    ld   a, [wBGUpdateRegionOriginLow]            ; $4A22: $FA $27 $C1
    ld   [wRequestDestinationLow], a              ; $4A25: $EA $02 $D6
    ld   [$DC92], a                               ; $4A28: $EA $92 $DC
    ld   a, [wBGUpdateRegionOriginHigh]           ; $4A2B: $FA $26 $C1
    or   $98                                      ; $4A2E: $F6 $98
    ld   [wRequestDestinationHigh], a             ; $4A30: $EA $01 $D6
    ld   [$DC91], a                               ; $4A33: $EA $91 $DC
    ld   hl, $49F0                                ; $4A36: $21 $F0 $49
    add  hl, bc                                   ; $4A39: $09
    ld   a, [hl]                                  ; $4A3A: $7E
    ld   [wRequestLength], a                      ; $4A3B: $EA $03 $D6
    ld   [$DC93], a                               ; $4A3E: $EA $93 $DC
    ld   a, $00                                   ; $4A41: $3E $00
    ld   [$D618], a                               ; $4A43: $EA $18 $D6
    ld   [$DCA8], a                               ; $4A46: $EA $A8 $DC
    ld   a, $EE                                   ; $4A49: $3E $EE
    ld   [$D614], a                               ; $4A4B: $EA $14 $D6
    ld   [$D615], a                               ; $4A4E: $EA $15 $D6
    ld   [$D616], a                               ; $4A51: $EA $16 $D6
    ld   [$D617], a                               ; $4A54: $EA $17 $D6
    ld   b, $D6                                   ; $4A57: $06 $D6
    ld   c, $04                                   ; $4A59: $0E $04
    ld   [$DCA4], a                               ; $4A5B: $EA $A4 $DC
    ld   [$DCA5], a                               ; $4A5E: $EA $A5 $DC
    ld   [$DCA6], a                               ; $4A61: $EA $A6 $DC
    ld   [$DCA7], a                               ; $4A64: $EA $A7 $DC
    ld   a, $DC                                   ; $4A67: $3E $DC
    ldh  [$FFE2], a                               ; $4A69: $E0 $E2
    ldh  [$FFE4], a                               ; $4A6B: $E0 $E4
    ld   a, $94                                   ; $4A6D: $3E $94
    ldh  [$FFE3], a                               ; $4A6F: $E0 $E3
    ld   a, $AB                                   ; $4A71: $3E $AB
    ldh  [$FFE5], a                               ; $4A73: $E0 $E5
    ret                                           ; $4A75: $C9

; Configures an async data request to copy background tilemap
Func_020_4A76::
    ld   a, [wRoomTransitionDirection]            ; $4A76: $FA $25 $C1
    ld   c, a                                     ; $4A79: $4F
    ld   b, $00                                   ; $4A7A: $06 $00
    ld   a, [$C12A]                               ; $4A7C: $FA $2A $C1
    ldh  [hScratch2], a                           ; $4A7F: $E0 $D9
    ld   hl, $49EC                                ; $4A81: $21 $EC $49
    add  hl, bc                                   ; $4A84: $09
    ldh  a, [hIsGBC]                              ; $4A85: $F0 $FE
    and  a                                        ; $4A87: $A7
    jr   nz, jr_020_4A8F                          ; $4A88: $20 $05

    call Func_020_49F4                            ; $4A8A: $CD $F4 $49
    jr   jr_020_4A92                              ; $4A8D: $18 $03

jr_020_4A8F:
    call Func_020_4A22                            ; $4A8F: $CD $22 $4A

jr_020_4A92:
    ret                                           ; $4A92: $C9

    ld   [$0C06], sp                              ; $4A93: $08 $06 $0C
    ld   a, [bc]                                  ; $4A96: $0A
    rst  $38                                      ; $4A97: $FF
    inc  b                                        ; $4A98: $04
    ld   a, [bc]                                  ; $4A99: $0A
    inc  c                                        ; $4A9A: $0C
    ld   b, $08                                   ; $4A9B: $06 $08
    ld   a, [bc]                                  ; $4A9D: $0A
    inc  c                                        ; $4A9E: $0C
    rst  $38                                      ; $4A9F: $FF
    inc  b                                        ; $4AA0: $04
    inc  c                                        ; $4AA1: $0C
    ld   a, [bc]                                  ; $4AA2: $0A
    inc  hl                                       ; $4AA3: $23
    inc  hl                                       ; $4AA4: $23
    ld   h, e                                     ; $4AA5: $63
    ld   h, e                                     ; $4AA6: $63
    inc  bc                                       ; $4AA7: $03
    inc  bc                                       ; $4AA8: $03
    ld   b, e                                     ; $4AA9: $43
    ld   b, e                                     ; $4AAA: $43
    inc  bc                                       ; $4AAB: $03
    inc  bc                                       ; $4AAC: $03
    inc  bc                                       ; $4AAD: $03
    inc  bc                                       ; $4AAE: $03
    ld   b, e                                     ; $4AAF: $43
    ld   b, e                                     ; $4AB0: $43
    inc  hl                                       ; $4AB1: $23
    inc  hl                                       ; $4AB2: $23

Func_020_4AB3::
    push hl                                       ; $4AB3: $E5
    ldh  a, [hScratch0]                           ; $4AB4: $F0 $D7
    add  h                                        ; $4AB6: $84
    ld   [bc], a                                  ; $4AB7: $02
    inc  bc                                       ; $4AB8: $03
    ldh  a, [hScratch1]                           ; $4AB9: $F0 $D8
    add  l                                        ; $4ABB: $85
    ld   [bc], a                                  ; $4ABC: $02
    inc  bc                                       ; $4ABD: $03
    ld   hl, $4A93                                ; $4ABE: $21 $93 $4A
    ldh  a, [hScratch2]                           ; $4AC1: $F0 $D9
    sla  a                                        ; $4AC3: $CB $27
    ld   e, a                                     ; $4AC5: $5F
    ld   d, $00                                   ; $4AC6: $16 $00
    add  hl, de                                   ; $4AC8: $19
    ld   a, [hl]                                  ; $4AC9: $7E
    ld   [bc], a                                  ; $4ACA: $02
    cp   $FF                                      ; $4ACB: $FE $FF
    jr   nz, jr_020_4AD4                          ; $4ACD: $20 $05

    dec  bc                                       ; $4ACF: $0B
    ld   a, $F0                                   ; $4AD0: $3E $F0
    ld   [bc], a                                  ; $4AD2: $02
    inc  bc                                       ; $4AD3: $03

jr_020_4AD4:
    inc  bc                                       ; $4AD4: $03
    ld   hl, $4AA3                                ; $4AD5: $21 $A3 $4A
    add  hl, de                                   ; $4AD8: $19
    ld   a, [hl]                                  ; $4AD9: $7E
    ld   hl, hScratch3                            ; $4ADA: $21 $DA $FF
    or   [hl]                                     ; $4ADD: $B6
    ld   [bc], a                                  ; $4ADE: $02
    ldh  a, [hIsGBC]                              ; $4ADF: $F0 $FE
    and  a                                        ; $4AE1: $A7
    jr   z, jr_020_4AEF                           ; $4AE2: $28 $0B

    ldh  a, [hScratch3]                           ; $4AE4: $F0 $DA
    and  a                                        ; $4AE6: $A7
    jr   z, jr_020_4AEF                           ; $4AE7: $28 $06

    ld   a, [bc]                                  ; $4AE9: $0A
    and  $F8                                      ; $4AEA: $E6 $F8
    or   $04                                      ; $4AEC: $F6 $04
    ld   [bc], a                                  ; $4AEE: $02

jr_020_4AEF:
    inc  bc                                       ; $4AEF: $03
    pop  hl                                       ; $4AF0: $E1
    ldh  a, [hScratch0]                           ; $4AF1: $F0 $D7
    add  h                                        ; $4AF3: $84
    ld   [bc], a                                  ; $4AF4: $02
    inc  bc                                       ; $4AF5: $03
    ldh  a, [hScratch1]                           ; $4AF6: $F0 $D8
    add  l                                        ; $4AF8: $85
    add  $08                                      ; $4AF9: $C6 $08
    ld   [bc], a                                  ; $4AFB: $02
    inc  bc                                       ; $4AFC: $03
    ld   hl, $4A94                                ; $4AFD: $21 $94 $4A
    add  hl, de                                   ; $4B00: $19
    ld   a, [hl]                                  ; $4B01: $7E
    ld   [bc], a                                  ; $4B02: $02
    inc  bc                                       ; $4B03: $03
    ld   hl, $4AA4                                ; $4B04: $21 $A4 $4A
    add  hl, de                                   ; $4B07: $19
    ld   a, [hl]                                  ; $4B08: $7E
    ld   hl, hScratch3                            ; $4B09: $21 $DA $FF
    or   [hl]                                     ; $4B0C: $B6
    ld   [bc], a                                  ; $4B0D: $02
    ldh  a, [hIsGBC]                              ; $4B0E: $F0 $FE
    and  a                                        ; $4B10: $A7
    jr   z, jr_020_4B1E                           ; $4B11: $28 $0B

    ldh  a, [hScratch3]                           ; $4B13: $F0 $DA
    and  a                                        ; $4B15: $A7
    jr   z, jr_020_4B1E                           ; $4B16: $28 $06

    ld   a, [bc]                                  ; $4B18: $0A
    and  $F8                                      ; $4B19: $E6 $F8
    or   $04                                      ; $4B1B: $F6 $04
    ld   [bc], a                                  ; $4B1D: $02

jr_020_4B1E:
    ret                                           ; $4B1E: $C9

func_20_4B1F::
    xor  a                                        ; $4B1F: $AF
    ld   [wHasPlacedBomb], a                      ; $4B20: $EA $4E $C1
    ld   [wActiveProjectileCount], a                    ; $4B23: $EA $4D $C1
    ld   [$C1A4], a                               ; $4B26: $EA $A4 $C1
    ld   [wC15C], a                               ; $4B29: $EA $5C $C1
    ld   [$C1AE], a                               ; $4B2C: $EA $AE $C1
    ld   a, [$C144]                               ; $4B2F: $FA $44 $C1
    and  a                                        ; $4B32: $A7
    jr   z, jr_020_4B39                           ; $4B33: $28 $04

    dec  a                                        ; $4B35: $3D
    ld   [$C144], a                               ; $4B36: $EA $44 $C1

jr_020_4B39:
    ret                                           ; $4B39: $C9

; Link's direction table
data_020_4B3A::
    db $10, $00, $08, $08

data_020_4B3E::
    db $03, $03, $08, $08

data_020_4B42::
    db $08, $08, $00, $0D

data_020_4B46::
    db $08, $08, $03, $04

; Shield-related function
Func_020_4B4A::
    ldh  a, [hLinkDirection]                      ; $4B4A: $F0 $9E
    ld   e, a                                     ; $4B4C: $5F
    ld   d, $00                                   ; $4B4D: $16 $00
    ld   hl, data_020_4B3A                        ; $4B4F: $21 $3A $4B
    add  hl, de                                   ; $4B52: $19
    ldh  a, [hLinkPositionX]                      ; $4B53: $F0 $98
    add  [hl]                                     ; $4B55: $86
    ld   [$C140], a                               ; $4B56: $EA $40 $C1
    ld   hl, data_020_4B3E                        ; $4B59: $21 $3E $4B
    add  hl, de                                   ; $4B5C: $19
    ld   a, [hl]                                  ; $4B5D: $7E
    ld   [$C141], a                               ; $4B5E: $EA $41 $C1
    ld   hl, data_020_4B42                        ; $4B61: $21 $42 $4B
    add  hl, de                                   ; $4B64: $19
    ld   a, [$C145]                               ; $4B65: $FA $45 $C1
    add  [hl]                                     ; $4B68: $86
    ld   [$C142], a                               ; $4B69: $EA $42 $C1
    ld   hl, data_020_4B46                        ; $4B6C: $21 $46 $4B
    add  hl, de                                   ; $4B6F: $19
    ld   a, [hl]                                  ; $4B70: $7E
    ld   [wIsLinkInTheAir], a                     ; $4B71: $EA $43 $C1
    xor  a                                        ; $4B74: $AF
    ld   [$C5B0], a                               ; $4B75: $EA $B0 $C5
    ret                                           ; $4B78: $C9

    ld   [$00F8], sp                              ; $4B79: $08 $F8 $00
    nop                                           ; $4B7C: $00
    nop                                           ; $4B7D: $00
    nop                                           ; $4B7E: $00
    db   $fd                                      ; $4B7F: $FD
    inc  b                                        ; $4B80: $04

Func_020_4B81::
    ld   hl, wEntitiesUnknowTableF                ; $4B81: $21 $F0 $C2
    add  hl, de                                   ; $4B84: $19
    ld   [hl], $10                                ; $4B85: $36 $10
    ld   a, [wBombArrowCooldown]                  ; $4B87: $FA $C0 $C1
    and  a                                        ; $4B8A: $A7
    jp   z, label_020_4B9E                        ; $4B8B: $CA $9E $4B

    xor  a                                        ; $4B8E: $AF
    ld   [wBombArrowCooldown], a                  ; $4B8F: $EA $C0 $C1
    ld   a, [$C1C2]                               ; $4B92: $FA $C2 $C1
    ld   c, a                                     ; $4B95: $4F
    ld   b, d                                     ; $4B96: $42
    ld   hl, wEntitiesWalkingTable                ; $4B97: $21 $90 $C2
    add  hl, bc                                   ; $4B9A: $09
    ld   [hl], $01                                ; $4B9B: $36 $01
    ret                                           ; $4B9D: $C9

label_020_4B9E:
    ld   a, $06                                   ; $4B9E: $3E $06
    ld   [wBombArrowCooldown], a                  ; $4BA0: $EA $C0 $C1
    ld   a, e                                     ; $4BA3: $7B
    ld   [$C1C1], a                               ; $4BA4: $EA $C1 $C1
    ld   a, $0C                                   ; $4BA7: $3E $0C
    ld   [$C19B], a                               ; $4BA9: $EA $9B $C1
    ld   hl, wEntitiesTransitionCountdownTable           ; $4BAC: $21 $E0 $C2
    add  hl, de                                   ; $4BAF: $19
    ld   [hl], $A0                                ; $4BB0: $36 $A0
    ld   hl, wEntitiesSpriteVariantTable               ; $4BB2: $21 $B0 $C3
    add  hl, de                                   ; $4BB5: $19
    ld   [hl], d                                  ; $4BB6: $72
    ld   hl, $C480                                ; $4BB7: $21 $80 $C4
    add  hl, de                                   ; $4BBA: $19
    ld   [hl], $03                                ; $4BBB: $36 $03
    ldh  a, [hIsSideScrolling]                    ; $4BBD: $F0 $F9
    and  a                                        ; $4BBF: $A7
    jr   nz, jr_020_4BC8                          ; $4BC0: $20 $06

    ld   a, $09                                   ; $4BC2: $3E $09
    ldh  [hJingle], a                             ; $4BC4: $E0 $F2
    jr   jr_020_4BCD                              ; $4BC6: $18 $05

jr_020_4BC8:
    ld   hl, wEntitiesPosZTable                                ; $4BC8: $21 $10 $C3
    add  hl, de                                   ; $4BCB: $19
    ld   [hl], d                                  ; $4BCC: $72

jr_020_4BCD:
    ld   hl, wEntitiesSpeedXTable                       ; $4BCD: $21 $40 $C2
    add  hl, de                                   ; $4BD0: $19
    ld   [hl], d                                  ; $4BD1: $72
    ld   hl, wEntitiesSpeedYTable                       ; $4BD2: $21 $50 $C2
    add  hl, de                                   ; $4BD5: $19
    ld   [hl], d                                  ; $4BD6: $72
    ld   hl, wEntitiesSpeedZTable                                ; $4BD7: $21 $20 $C3
    add  hl, de                                   ; $4BDA: $19
    ld   [hl], d                                  ; $4BDB: $72
    ldh  a, [hLinkDirection]                      ; $4BDC: $F0 $9E
    ld   c, a                                     ; $4BDE: $4F
    ld   b, d                                     ; $4BDF: $42
    ld   hl, $4B79                                ; $4BE0: $21 $79 $4B

jr_020_4BE3:
    add  hl, bc                                   ; $4BE3: $09
    ldh  a, [hLinkPositionX]                      ; $4BE4: $F0 $98
    add  [hl]                                     ; $4BE6: $86
    ld   hl, wEntitiesPosXTable                         ; $4BE7: $21 $00 $C2
    add  hl, de                                   ; $4BEA: $19
    ld   [hl], a                                  ; $4BEB: $77
    ld   hl, $4B7D                                ; $4BEC: $21 $7D $4B
    add  hl, bc                                   ; $4BEF: $09
    ldh  a, [hLinkPositionY]                      ; $4BF0: $F0 $99
    add  [hl]                                     ; $4BF2: $86
    ld   hl, wEntitiesPosYTable                         ; $4BF3: $21 $10 $C2
    add  hl, de                                   ; $4BF6: $19
    ld   [hl], a                                  ; $4BF7: $77
    ret                                           ; $4BF8: $C9

    jr   jr_020_4BE3                              ; $4BF9: $18 $E8

    nop                                           ; $4BFB: $00
    add  sp, $18                                  ; $4BFC: $E8 $18
    nop                                           ; $4BFE: $00

Func_020_4BFF::
    ld   hl, wEntitiesTransitionCountdownTable           ; $4BFF: $21 $E0 $C2
    add  hl, de                                   ; $4C02: $19
    ld   [hl], $28                                ; $4C03: $36 $28
    ld   c, $04                                   ; $4C05: $0E $04
    ld   b, $00                                   ; $4C07: $06 $00
    ldh  a, [hPressedButtonsMask]                 ; $4C09: $F0 $CB

jr_020_4C0B:
    srl  a                                        ; $4C0B: $CB $3F
    jr   nc, jr_020_4C10                          ; $4C0D: $30 $01

    inc  b                                        ; $4C0F: $04

jr_020_4C10:
    dec  c                                        ; $4C10: $0D
    jr   nz, jr_020_4C0B                          ; $4C11: $20 $F8

    ld   a, b                                     ; $4C13: $78
    cp   $02                                      ; $4C14: $FE $02
    jr   c, jr_020_4C3E                           ; $4C16: $38 $26

    ldh  a, [hPressedButtonsMask]                 ; $4C18: $F0 $CB
    and  $03                                      ; $4C1A: $E6 $03
    ld   c, a                                     ; $4C1C: $4F
    ld   b, $00                                   ; $4C1D: $06 $00
    ld   hl, $4BF8                                ; $4C1F: $21 $F8 $4B
    add  hl, bc                                   ; $4C22: $09
    ld   a, [hl]                                  ; $4C23: $7E
    ld   hl, wEntitiesSpeedXTable                       ; $4C24: $21 $40 $C2
    add  hl, de                                   ; $4C27: $19
    ld   [hl], a                                  ; $4C28: $77
    ldh  a, [hPressedButtonsMask]                 ; $4C29: $F0 $CB
    srl  a                                        ; $4C2B: $CB $3F
    srl  a                                        ; $4C2D: $CB $3F
    and  $03                                      ; $4C2F: $E6 $03
    ld   c, a                                     ; $4C31: $4F
    ld   b, $00                                   ; $4C32: $06 $00
    ld   hl, $4BFB                                ; $4C34: $21 $FB $4B
    add  hl, bc                                   ; $4C37: $09
    ld   a, [hl]                                  ; $4C38: $7E
    ld   hl, wEntitiesSpeedYTable                       ; $4C39: $21 $50 $C2
    add  hl, de                                   ; $4C3C: $19
    ld   [hl], a                                  ; $4C3D: $77

jr_020_4C3E:
    ret                                           ; $4C3E: $C9

    ld   c, $F2                                   ; $4C3F: $0E $F2
    nop                                           ; $4C41: $00
    nop                                           ; $4C42: $00
    nop                                           ; $4C43: $00
    nop                                           ; $4C44: $00
    db   $f4                                      ; $4C45: $F4
    inc  c                                        ; $4C46: $0C

Func_020_4C47::
    ld   a, $05                                   ; $4C47: $3E $05
    ldh  [hJingle], a                             ; $4C49: $E0 $F2
    ld   a, $0E                                   ; $4C4B: $3E $0E
    ld   [$C19B], a                               ; $4C4D: $EA $9B $C1
    ld   a, [wMagicPowderCount]                   ; $4C50: $FA $4C $DB
    sub  $01                                      ; $4C53: $D6 $01
    daa                                           ; $4C55: $27
    ld   [wMagicPowderCount], a                   ; $4C56: $EA $4C $DB
    jr   nz, jr_020_4C6D                          ; $4C59: $20 $12

    ld   hl, wAButtonSlot                         ; $4C5B: $21 $00 $DB
    ld   a, [hl]                                  ; $4C5E: $7E
    cp   $0C                                      ; $4C5F: $FE $0C
    jr   nz, jr_020_4C65                          ; $4C61: $20 $02

    ld   [hl], $00                                ; $4C63: $36 $00

jr_020_4C65:
    inc  hl                                       ; $4C65: $23
    ld   a, [hl]                                  ; $4C66: $7E
    cp   $0C                                      ; $4C67: $FE $0C
    jr   nz, jr_020_4C6D                          ; $4C69: $20 $02

    ld   [hl], $00                                ; $4C6B: $36 $00

jr_020_4C6D:
    push bc                                       ; $4C6D: $C5
    ldh  a, [hLinkDirection]                      ; $4C6E: $F0 $9E
    ld   c, a                                     ; $4C70: $4F
    ld   hl, $4C3F                                ; $4C71: $21 $3F $4C
    add  hl, bc                                   ; $4C74: $09
    ldh  a, [hLinkPositionX]                      ; $4C75: $F0 $98
    add  [hl]                                     ; $4C77: $86
    ld   hl, wEntitiesPosXTable                         ; $4C78: $21 $00 $C2
    add  hl, de                                   ; $4C7B: $19
    ld   [hl], a                                  ; $4C7C: $77
    ld   hl, $4C43                                ; $4C7D: $21 $43 $4C
    add  hl, bc                                   ; $4C80: $09
    ldh  a, [hLinkPositionY]                      ; $4C81: $F0 $99
    add  [hl]                                     ; $4C83: $86
    ld   hl, wEntitiesPosYTable                         ; $4C84: $21 $10 $C2
    add  hl, de                                   ; $4C87: $19
    ld   [hl], a                                  ; $4C88: $77
    ldh  a, [$FFA2]                               ; $4C89: $F0 $A2
    ld   hl, wEntitiesPosZTable                                ; $4C8B: $21 $10 $C3
    add  hl, de                                   ; $4C8E: $19
    ld   [hl], a                                  ; $4C8F: $77
    ld   hl, wEntitiesTransitionCountdownTable           ; $4C90: $21 $E0 $C2
    add  hl, de                                   ; $4C93: $19
    ld   [hl], $17                                ; $4C94: $36 $17
    pop  bc                                       ; $4C96: $C1
    ret                                           ; $4C97: $C9

PlayBoomerangSfx::
    ld   a, [$C5AC]                               ; $4C98: $FA $AC $C5
    and  a                                        ; $4C9B: $A7
    jr   nz, .return                              ; $4C9C: $20 $04

    ld   a, NOISE_SFX_BOOMERANG                   ; $4C9E: $3E $2D
    ldh  [hNoiseSfx], a                           ; $4CA0: $E0 $F4
.return
    ret                                           ; $4CA2: $C9

ResetRoomVariables::
    xor  a                                        ; $4CA3: $AF
    ldh  [hFreeWarpDataAddress], a                ; $4CA4: $E0 $E6
    ld   [$C19C], a                               ; $4CA6: $EA $9C $C1
    ld   [$C504], a                               ; $4CA9: $EA $04 $C5
    ld   [$DBC8], a                               ; $4CAC: $EA $C8 $DB
    ld   [wTorchesCount], a                       ; $4CAF: $EA $C9 $DB
    ld   [$C1A2], a                               ; $4CB2: $EA $A2 $C1
    ld   [$C1C6], a                               ; $4CB5: $EA $C6 $C1
    ld   [wRoomSwitchableObject], a               ; $4CB8: $EA $FA $D6
    ld   [$C50A], a                               ; $4CBB: $EA $0A $C5
    ldh  [$FFAC], a                               ; $4CBE: $E0 $AC
    ld   [wC113], a                               ; $4CC0: $EA $13 $C1
    ld   [$D460], a                               ; $4CC3: $EA $60 $D4
    ld   [$C1BE], a                               ; $4CC6: $EA $BE $C1
    ld   [$C50E], a                               ; $4CC9: $EA $0E $C5
    ld   [$C3C8], a                               ; $4CCC: $EA $C8 $C3
    ld   [$C5A6], a                               ; $4CCF: $EA $A6 $C5
    ld   [wCompassSfxCountdown], a                ; $4CD2: $EA $62 $D4
    ld   [wC3CD], a                               ; $4CD5: $EA $CD $C3
    ld   [$DDD9], a                               ; $4CD8: $EA $D9 $DD
    ld   a, $FF                                   ; $4CDB: $3E $FF
    ld   [wWarpStructs], a                        ; $4CDD: $EA $01 $D4
    ld   [$C50F], a                               ; $4CE0: $EA $0F $C5
    ret                                           ; $4CE3: $C9

    nop                                           ; $4CE4: $00
    nop                                           ; $4CE5: $00
    nop                                           ; $4CE6: $00
    nop                                           ; $4CE7: $00
    nop                                           ; $4CE8: $00
    nop                                           ; $4CE9: $00
    nop                                           ; $4CEA: $00
    nop                                           ; $4CEB: $00
    nop                                           ; $4CEC: $00
    nop                                           ; $4CED: $00
    nop                                           ; $4CEE: $00
    nop                                           ; $4CEF: $00
    nop                                           ; $4CF0: $00
    nop                                           ; $4CF1: $00
    nop                                           ; $4CF2: $00
    nop                                           ; $4CF3: $00
    nop                                           ; $4CF4: $00
    nop                                           ; $4CF5: $00
    nop                                           ; $4CF6: $00
    nop                                           ; $4CF7: $00
    nop                                           ; $4CF8: $00
    nop                                           ; $4CF9: $00
    nop                                           ; $4CFA: $00
    nop                                           ; $4CFB: $00
    nop                                           ; $4CFC: $00
    nop                                           ; $4CFD: $00
    nop                                           ; $4CFE: $00
    nop                                           ; $4CFF: $00
    nop                                           ; $4D00: $00
    nop                                           ; $4D01: $00
    nop                                           ; $4D02: $00
    nop                                           ; $4D03: $00
    nop                                           ; $4D04: $00
    nop                                           ; $4D05: $00
    nop                                           ; $4D06: $00
    nop                                           ; $4D07: $00
    nop                                           ; $4D08: $00
    nop                                           ; $4D09: $00
    nop                                           ; $4D0A: $00
    nop                                           ; $4D0B: $00
    nop                                           ; $4D0C: $00
    nop                                           ; $4D0D: $00
    nop                                           ; $4D0E: $00
    nop                                           ; $4D0F: $00
    nop                                           ; $4D10: $00
    nop                                           ; $4D11: $00
    nop                                           ; $4D12: $00
    nop                                           ; $4D13: $00
    nop                                           ; $4D14: $00
    nop                                           ; $4D15: $00
    nop                                           ; $4D16: $00
    nop                                           ; $4D17: $00
    nop                                           ; $4D18: $00
    nop                                           ; $4D19: $00
    nop                                           ; $4D1A: $00
    nop                                           ; $4D1B: $00
    nop                                           ; $4D1C: $00
    nop                                           ; $4D1D: $00
    nop                                           ; $4D1E: $00
    nop                                           ; $4D1F: $00
    nop                                           ; $4D20: $00
    nop                                           ; $4D21: $00
    nop                                           ; $4D22: $00
    nop                                           ; $4D23: $00
    ldh  a, [hActiveEntityWalking]                ; $4D24: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D26: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D28: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D2A: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D2C: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D2E: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D30: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D32: $F0 $F0
    ldh  [hBGMapOffsetHigh], a                    ; $4D34: $E0 $E0
    ldh  [hBGMapOffsetHigh], a                    ; $4D36: $E0 $E0
    ldh  [$FFE2], a                               ; $4D38: $E0 $E2
    push hl                                       ; $4D3A: $E5
    add  sp, -$15                                 ; $4D3B: $E8 $EB
    xor  $F1                                      ; $4D3D: $EE $F1
    db   $f4                                      ; $4D3F: $F4
    rst  $30                                      ; $4D40: $F7
    ld   a, [$00FD]                               ; $4D41: $FA $FD $00
    inc  bc                                       ; $4D44: $03
    ld   b, $09                                   ; $4D45: $06 $09
    inc  c                                        ; $4D47: $0C
    rrca                                          ; $4D48: $0F
    ld   [de], a                                  ; $4D49: $12
    dec  d                                        ; $4D4A: $15
    jr   jr_020_4D68                              ; $4D4B: $18 $1B

    ld   e, $21                                   ; $4D4D: $1E $21
    inc  h                                        ; $4D4F: $24
    daa                                           ; $4D50: $27
    ld   a, [hl+]                                 ; $4D51: $2A
    dec  l                                        ; $4D52: $2D
    jr   nc, jr_020_4D88                          ; $4D53: $30 $33

    ld   [hl], $39                                ; $4D55: $36 $39
    inc  a                                        ; $4D57: $3C
    ccf                                           ; $4D58: $3F
    ld   b, d                                     ; $4D59: $42
    ld   b, l                                     ; $4D5A: $45
    ld   c, b                                     ; $4D5B: $48
    inc  sp                                       ; $4D5C: $33
    ld   [hl], $39                                ; $4D5D: $36 $39
    inc  a                                        ; $4D5F: $3C
    ccf                                           ; $4D60: $3F
    ld   b, d                                     ; $4D61: $42
    ld   b, l                                     ; $4D62: $45
    ld   c, b                                     ; $4D63: $48
    ldh  a, [hActiveEntityWalking]                ; $4D64: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D66: $F0 $F0

jr_020_4D68:
    ldh  a, [hActiveEntityWalking]                ; $4D68: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D6A: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D6C: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D6E: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4D70: $F0 $F0
    ldh  a, [hBGMapOffsetHigh]                    ; $4D72: $F0 $E0
    ld   [$ff00+c], a                             ; $4D74: $E2
    db   $e4                                      ; $4D75: $E4
    and  $E8                                      ; $4D76: $E6 $E8
    ld   [$EEEC], a                               ; $4D78: $EA $EC $EE
    ldh  a, [hJingle]                             ; $4D7B: $F0 $F2
    db   $f4                                      ; $4D7D: $F4
    or   $F8                                      ; $4D7E: $F6 $F8
    ld   a, [$FEFC]                               ; $4D80: $FA $FC $FE
    nop                                           ; $4D83: $00
    ld   [bc], a                                  ; $4D84: $02
    inc  b                                        ; $4D85: $04
    ld   b, $08                                   ; $4D86: $06 $08

jr_020_4D88:
    ld   a, [bc]                                  ; $4D88: $0A
    inc  c                                        ; $4D89: $0C
    ld   c, $10                                   ; $4D8A: $0E $10
    ld   [de], a                                  ; $4D8C: $12
    inc  d                                        ; $4D8D: $14
    ld   d, $18                                   ; $4D8E: $16 $18
    ld   a, [de]                                  ; $4D90: $1A
    inc  e                                        ; $4D91: $1C
    dec  e                                        ; $4D92: $1D
    ld   e, $20                                   ; $4D93: $1E $20
    ld   [hl+], a                                 ; $4D95: $22
    inc  h                                        ; $4D96: $24
    ld   h, $28                                   ; $4D97: $26 $28
    ld   a, [hl+]                                 ; $4D99: $2A
    inc  l                                        ; $4D9A: $2C
    ld   l, $20                                   ; $4D9B: $2E $20
    ld   [hl+], a                                 ; $4D9D: $22
    inc  h                                        ; $4D9E: $24
    ld   h, $28                                   ; $4D9F: $26 $28
    ld   a, [hl+]                                 ; $4DA1: $2A
    inc  l                                        ; $4DA2: $2C
    ld   l, $F0                                   ; $4DA3: $2E $F0
    ldh  a, [hActiveEntityWalking]                ; $4DA5: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DA7: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DA9: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DAB: $F0 $F0
    rst  $18                                      ; $4DAD: $DF
    ldh  [$FFE2], a                               ; $4DAE: $E0 $E2
    db   $e3                                      ; $4DB0: $E3
    push hl                                       ; $4DB1: $E5
    and  $E8                                      ; $4DB2: $E6 $E8
    jp   hl                                       ; $4DB4: $E9

    db   $eb                                      ; $4DB5: $EB
    db   $ec                                      ; $4DB6: $EC
    xor  $EF                                      ; $4DB7: $EE $EF
    pop  af                                       ; $4DB9: $F1
    ld   a, [$ff00+c]                             ; $4DBA: $F2
    db   $f4                                      ; $4DBB: $F4
    push af                                       ; $4DBC: $F5
    rst  $30                                      ; $4DBD: $F7
    ld   hl, sp-$06                               ; $4DBE: $F8 $FA
    ei                                            ; $4DC0: $FB
    db   $fd                                      ; $4DC1: $FD
    cp   $00                                      ; $4DC2: $FE $00
    ld   bc, $0403                                ; $4DC4: $01 $03 $04
    ld   b, $07                                   ; $4DC7: $06 $07
    add  hl, bc                                   ; $4DC9: $09
    ld   a, [bc]                                  ; $4DCA: $0A
    inc  c                                        ; $4DCB: $0C
    dec  c                                        ; $4DCC: $0D
    rrca                                          ; $4DCD: $0F
    db   $10                                      ; $4DCE: $10
    ld   [de], a                                  ; $4DCF: $12
    inc  de                                       ; $4DD0: $13
    dec  d                                        ; $4DD1: $15
    ld   d, $18                                   ; $4DD2: $16 $18
    add  hl, de                                   ; $4DD4: $19
    dec  de                                       ; $4DD5: $1B
    inc  e                                        ; $4DD6: $1C
    ld   e, $1F                                   ; $4DD7: $1E $1F
    ld   hl, $2422                                ; $4DD9: $21 $22 $24
    add  hl, de                                   ; $4DDC: $19
    dec  de                                       ; $4DDD: $1B
    inc  e                                        ; $4DDE: $1C
    ld   e, $1F                                   ; $4DDF: $1E $1F
    ld   hl, $2422                                ; $4DE1: $21 $22 $24
    ldh  a, [hActiveEntityWalking]                ; $4DE4: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DE6: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DE8: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DEA: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4DEC: $F0 $F0
    ld   [$ff00+c], a                             ; $4DEE: $E2
    db   $e3                                      ; $4DEF: $E3
    push hl                                       ; $4DF0: $E5
    and  $E8                                      ; $4DF1: $E6 $E8
    jp   hl                                       ; $4DF3: $E9

    db   $eb                                      ; $4DF4: $EB
    db   $ec                                      ; $4DF5: $EC
    xor  $F0                                      ; $4DF6: $EE $F0
    ld   a, [$ff00+c]                             ; $4DF8: $F2
    di                                            ; $4DF9: $F3
    or   $F7                                      ; $4DFA: $F6 $F7
    ld   hl, sp-$07                               ; $4DFC: $F8 $F9
    ld   a, [$FDFC]                               ; $4DFE: $FA $FC $FD
    cp   $FF                                      ; $4E01: $FE $FF
    nop                                           ; $4E03: $00
    ld   bc, $0403                                ; $4E04: $01 $03 $04
    ld   b, $07                                   ; $4E07: $06 $07
    add  hl, bc                                   ; $4E09: $09
    ld   a, [bc]                                  ; $4E0A: $0A
    inc  c                                        ; $4E0B: $0C
    dec  c                                        ; $4E0C: $0D
    rrca                                          ; $4E0D: $0F
    db   $10                                      ; $4E0E: $10
    ld   [de], a                                  ; $4E0F: $12
    inc  de                                       ; $4E10: $13
    dec  d                                        ; $4E11: $15
    ld   d, $18                                   ; $4E12: $16 $18
    add  hl, de                                   ; $4E14: $19
    dec  de                                       ; $4E15: $1B
    inc  e                                        ; $4E16: $1C
    ld   e, $1F                                   ; $4E17: $1E $1F
    ld   hl, $2222                                ; $4E19: $21 $22 $22
    inc  h                                        ; $4E1C: $24
    dec  h                                        ; $4E1D: $25
    daa                                           ; $4E1E: $27
    add  hl, hl                                   ; $4E1F: $29
    dec  hl                                       ; $4E20: $2B
    inc  l                                        ; $4E21: $2C
    ld   l, $2F                                   ; $4E22: $2E $2F
    ldh  a, [hActiveEntityWalking]                ; $4E24: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4E26: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4E28: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4E2A: $F0 $F0
    pop  hl                                       ; $4E2C: $E1
    ld   [$ff00+c], a                             ; $4E2D: $E2
    db   $e4                                      ; $4E2E: $E4
    push hl                                       ; $4E2F: $E5
    and  $E8                                      ; $4E30: $E6 $E8
    jp   hl                                       ; $4E32: $E9

    ld   [$EDEC], a                               ; $4E33: $EA $EC $ED
    xor  $F0                                      ; $4E36: $EE $F0
    pop  af                                       ; $4E38: $F1
    ld   a, [$ff00+c]                             ; $4E39: $F2
    db   $f4                                      ; $4E3A: $F4
    push af                                       ; $4E3B: $F5
    or   $F8                                      ; $4E3C: $F6 $F8
    ld   sp, hl                                   ; $4E3E: $F9
    ld   a, [$FEFC]                               ; $4E3F: $FA $FC $FE
    rst  $38                                      ; $4E42: $FF
    nop                                           ; $4E43: $00
    ld   bc, $0402                                ; $4E44: $01 $02 $04
    dec  b                                        ; $4E47: $05
    ld   b, $08                                   ; $4E48: $06 $08
    add  hl, bc                                   ; $4E4A: $09
    ld   a, [bc]                                  ; $4E4B: $0A
    inc  c                                        ; $4E4C: $0C
    dec  c                                        ; $4E4D: $0D
    ld   c, $10                                   ; $4E4E: $0E $10
    ld   de, $1412                                ; $4E50: $11 $12 $14
    dec  d                                        ; $4E53: $15
    ld   d, $18                                   ; $4E54: $16 $18
    add  hl, de                                   ; $4E56: $19
    ld   a, [de]                                  ; $4E57: $1A
    inc  e                                        ; $4E58: $1C
    dec  e                                        ; $4E59: $1D
    ld   e, $20                                   ; $4E5A: $1E $20
    ld   [hl+], a                                 ; $4E5C: $22
    inc  hl                                       ; $4E5D: $23
    inc  h                                        ; $4E5E: $24
    dec  h                                        ; $4E5F: $25
    daa                                           ; $4E60: $27
    jr   z, jr_020_4E8D                           ; $4E61: $28 $2A

    dec  hl                                       ; $4E63: $2B
    ldh  a, [hActiveEntityWalking]                ; $4E64: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4E66: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4E68: $F0 $F0
    ldh  a, [$FFE2]                               ; $4E6A: $F0 $E2
    db   $e3                                      ; $4E6C: $E3
    db   $e4                                      ; $4E6D: $E4
    push hl                                       ; $4E6E: $E5
    and  $E8                                      ; $4E6F: $E6 $E8
    jp   hl                                       ; $4E71: $E9

    ld   [$EDEC], a                               ; $4E72: $EA $EC $ED
    xor  $EF                                      ; $4E75: $EE $EF
    pop  af                                       ; $4E77: $F1
    ld   a, [$ff00+c]                             ; $4E78: $F2
    di                                            ; $4E79: $F3
    push af                                       ; $4E7A: $F5
    or   $F8                                      ; $4E7B: $F6 $F8
    ld   sp, hl                                   ; $4E7D: $F9
    ld   a, [$FDFB]                               ; $4E7E: $FA $FB $FD
    cp   $FF                                      ; $4E81: $FE $FF
    nop                                           ; $4E83: $00
    ld   bc, $0302                                ; $4E84: $01 $02 $03
    dec  b                                        ; $4E87: $05
    ld   b, $07                                   ; $4E88: $06 $07
    ld   [$0B0A], sp                              ; $4E8A: $08 $0A $0B

jr_020_4E8D:
    inc  c                                        ; $4E8D: $0C
    dec  c                                        ; $4E8E: $0D
    rrca                                          ; $4E8F: $0F
    db   $10                                      ; $4E90: $10
    ld   de, $1412                                ; $4E91: $11 $12 $14
    dec  d                                        ; $4E94: $15

jr_020_4E95:
    ld   d, $17                                   ; $4E95: $16 $17
    add  hl, de                                   ; $4E97: $19
    ld   a, [de]                                  ; $4E98: $1A
    dec  de                                       ; $4E99: $1B
    dec  e                                        ; $4E9A: $1D
    ld   e, $20                                   ; $4E9B: $1E $20
    ld   hl, $2322                                ; $4E9D: $21 $22 $23
    dec  h                                        ; $4EA0: $25
    ld   h, $27                                   ; $4EA1: $26 $27
    jr   z, jr_020_4E95                           ; $4EA3: $28 $F0

    ldh  a, [hActiveEntityWalking]                ; $4EA5: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4EA7: $F0 $F0
    ldh  a, [$FFE3]                               ; $4EA9: $F0 $E3
    db   $e4                                      ; $4EAB: $E4
    push hl                                       ; $4EAC: $E5
    and  $E7                                      ; $4EAD: $E6 $E7
    add  sp, -$17                                 ; $4EAF: $E8 $E9
    db   $eb                                      ; $4EB1: $EB
    db   $ec                                      ; $4EB2: $EC
    db   $ed                                      ; $4EB3: $ED
    xor  $F0                                      ; $4EB4: $EE $F0
    pop  af                                       ; $4EB6: $F1
    ld   a, [$ff00+c]                             ; $4EB7: $F2
    di                                            ; $4EB8: $F3
    db   $f4                                      ; $4EB9: $F4
    or   $F7                                      ; $4EBA: $F6 $F7
    ld   hl, sp-$07                               ; $4EBC: $F8 $F9
    ei                                            ; $4EBE: $FB
    db   $fc                                      ; $4EBF: $FC
    db   $fd                                      ; $4EC0: $FD
    cp   $FF                                      ; $4EC1: $FE $FF
    nop                                           ; $4EC3: $00
    ld   bc, $0302                                ; $4EC4: $01 $02 $03
    inc  b                                        ; $4EC7: $04
    ld   b, $07                                   ; $4EC8: $06 $07
    ld   [$0A09], sp                              ; $4ECA: $08 $09 $0A
    dec  bc                                       ; $4ECD: $0B
    inc  c                                        ; $4ECE: $0C
    ld   c, $10                                   ; $4ECF: $0E $10
    ld   de, $1312                                ; $4ED1: $11 $12 $13
    inc  d                                        ; $4ED4: $14
    dec  d                                        ; $4ED5: $15
    ld   d, $18                                   ; $4ED6: $16 $18
    add  hl, de                                   ; $4ED8: $19
    ld   a, [de]                                  ; $4ED9: $1A
    dec  de                                       ; $4EDA: $1B
    inc  e                                        ; $4EDB: $1C
    dec  e                                        ; $4EDC: $1D
    rra                                           ; $4EDD: $1F
    jr   nz, jr_020_4F01                          ; $4EDE: $20 $21

    ld   [hl+], a                                 ; $4EE0: $22
    inc  hl                                       ; $4EE1: $23
    inc  h                                        ; $4EE2: $24
    dec  h                                        ; $4EE3: $25
    ldh  a, [hActiveEntityWalking]                ; $4EE4: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4EE6: $F0 $F0
    ldh  a, [$FFE4]                               ; $4EE8: $F0 $E4
    push hl                                       ; $4EEA: $E5
    and  $E7                                      ; $4EEB: $E6 $E7
    add  sp, -$17                                 ; $4EED: $E8 $E9
    ld   [$ECEB], a                               ; $4EEF: $EA $EB $EC
    xor  $EF                                      ; $4EF2: $EE $EF
    ldh  a, [hActiveEntitySpriteVariant]               ; $4EF4: $F0 $F1
    ld   a, [$ff00+c]                             ; $4EF6: $F2
    di                                            ; $4EF7: $F3
    db   $f4                                      ; $4EF8: $F4
    push af                                       ; $4EF9: $F5
    or   $F8                                      ; $4EFA: $F6 $F8
    ld   sp, hl                                   ; $4EFC: $F9
    ld   a, [$FCFB]                               ; $4EFD: $FA $FB $FC
    db   $fd                                      ; $4F00: $FD

jr_020_4F01:
    cp   $FF                                      ; $4F01: $FE $FF
    nop                                           ; $4F03: $00
    ld   bc, $0302                                ; $4F04: $01 $02 $03
    inc  b                                        ; $4F07: $04
    dec  b                                        ; $4F08: $05
    ld   b, $07                                   ; $4F09: $06 $07
    ld   [$0A09], sp                              ; $4F0B: $08 $09 $0A
    inc  c                                        ; $4F0E: $0C
    dec  c                                        ; $4F0F: $0D
    ld   c, $0F                                   ; $4F10: $0E $0F
    db   $10                                      ; $4F12: $10
    ld   de, $1312                                ; $4F13: $11 $12 $13
    dec  d                                        ; $4F16: $15
    ld   d, $17                                   ; $4F17: $16 $17
    jr   @+$1B                                    ; $4F19: $18 $19

    ld   a, [de]                                  ; $4F1B: $1A
    dec  de                                       ; $4F1C: $1B
    inc  e                                        ; $4F1D: $1C
    dec  e                                        ; $4F1E: $1D
    ld   e, $1F                                   ; $4F1F: $1E $1F
    ld   hl, $2322                                ; $4F21: $21 $22 $23
    ldh  a, [hActiveEntityWalking]                ; $4F24: $F0 $F0
    ldh  a, [hActiveEntityWalking]                ; $4F26: $F0 $F0
    push hl                                       ; $4F28: $E5
    and  $E7                                      ; $4F29: $E6 $E7
    add  sp, -$17                                 ; $4F2B: $E8 $E9
    ld   [$ECEB], a                               ; $4F2D: $EA $EB $EC
    db   $ed                                      ; $4F30: $ED
    xor  $EF                                      ; $4F31: $EE $EF
    ldh  a, [hActiveEntitySpriteVariant]               ; $4F33: $F0 $F1
    ld   a, [$ff00+c]                             ; $4F35: $F2
    di                                            ; $4F36: $F3
    db   $f4                                      ; $4F37: $F4
    push af                                       ; $4F38: $F5
    or   $F7                                      ; $4F39: $F6 $F7
    ld   hl, sp-$07                               ; $4F3B: $F8 $F9
    ld   a, [$FCFB]                               ; $4F3D: $FA $FB $FC
    db   $fd                                      ; $4F40: $FD
    cp   $FF                                      ; $4F41: $FE $FF
    nop                                           ; $4F43: $00
    ld   bc, $0302                                ; $4F44: $01 $02 $03
    inc  b                                        ; $4F47: $04
    dec  b                                        ; $4F48: $05
    ld   b, $07                                   ; $4F49: $06 $07
    ld   [$0A09], sp                              ; $4F4B: $08 $09 $0A
    dec  bc                                       ; $4F4E: $0B
    inc  c                                        ; $4F4F: $0C
    dec  c                                        ; $4F50: $0D
    ld   c, $0F                                   ; $4F51: $0E $0F
    db   $10                                      ; $4F53: $10
    ld   de, $1312                                ; $4F54: $11 $12 $13
    inc  d                                        ; $4F57: $14
    dec  d                                        ; $4F58: $15
    ld   d, $17                                   ; $4F59: $16 $17
    jr   jr_020_4F76                              ; $4F5B: $18 $19

    ld   a, [de]                                  ; $4F5D: $1A
    dec  de                                       ; $4F5E: $1B
    inc  e                                        ; $4F5F: $1C
    dec  e                                        ; $4F60: $1D
    ld   e, $1F                                   ; $4F61: $1E $1F
    jr   nz, @-$0E                                ; $4F63: $20 $F0

    ldh  a, [hActiveEntityWalking]                ; $4F65: $F0 $F0
    and  $E7                                      ; $4F67: $E6 $E7
    add  sp, -$18                                 ; $4F69: $E8 $E8
    jp   hl                                       ; $4F6B: $E9

    ld   [$ECEB], a                               ; $4F6C: $EA $EB $EC
    db   $ed                                      ; $4F6F: $ED
    xor  $EF                                      ; $4F70: $EE $EF
    ldh  a, [hActiveEntityWalking]                ; $4F72: $F0 $F0
    pop  af                                       ; $4F74: $F1
    ld   a, [$ff00+c]                             ; $4F75: $F2

jr_020_4F76:
    di                                            ; $4F76: $F3
    db   $f4                                      ; $4F77: $F4
    push af                                       ; $4F78: $F5
    or   $F7                                      ; $4F79: $F6 $F7
    ld   hl, sp-$08                               ; $4F7B: $F8 $F8
    ld   sp, hl                                   ; $4F7D: $F9
    ld   a, [$FCFB]                               ; $4F7E: $FA $FB $FC
    db   $fd                                      ; $4F81: $FD
    cp   $FF                                      ; $4F82: $FE $FF
    nop                                           ; $4F84: $00
    ld   bc, $0302                                ; $4F85: $01 $02 $03
    inc  b                                        ; $4F88: $04
    dec  b                                        ; $4F89: $05
    ld   b, $07                                   ; $4F8A: $06 $07
    rlca                                          ; $4F8C: $07
    ld   [$0A09], sp                              ; $4F8D: $08 $09 $0A
    dec  bc                                       ; $4F90: $0B
    inc  c                                        ; $4F91: $0C
    dec  c                                        ; $4F92: $0D
    ld   c, $0F                                   ; $4F93: $0E $0F
    db   $10                                      ; $4F95: $10
    ld   de, $1312                                ; $4F96: $11 $12 $13
    inc  d                                        ; $4F99: $14
    dec  d                                        ; $4F9A: $15
    ld   d, $17                                   ; $4F9B: $16 $17
    jr   jr_020_4FB8                              ; $4F9D: $18 $19

    ld   a, [de]                                  ; $4F9F: $1A
    ld   a, [de]                                  ; $4FA0: $1A
    dec  de                                       ; $4FA1: $1B
    inc  e                                        ; $4FA2: $1C
    dec  e                                        ; $4FA3: $1D
    ldh  a, [hActiveEntityWalking]                ; $4FA4: $F0 $F0
    rst  $20                                      ; $4FA6: $E7
    add  sp, -$17                                 ; $4FA7: $E8 $E9
    ld   [$ECEB], a                               ; $4FA9: $EA $EB $EC
    db   $ec                                      ; $4FAC: $EC
    db   $ec                                      ; $4FAD: $EC
    db   $ed                                      ; $4FAE: $ED
    xor  $EF                                      ; $4FAF: $EE $EF
    ldh  a, [hActiveEntitySpriteVariant]               ; $4FB1: $F0 $F1
    ld   a, [$ff00+c]                             ; $4FB3: $F2
    ld   a, [$ff00+c]                             ; $4FB4: $F2
    di                                            ; $4FB5: $F3
    db   $f4                                      ; $4FB6: $F4
    push af                                       ; $4FB7: $F5

jr_020_4FB8:
    or   $F7                                      ; $4FB8: $F6 $F7
    rst  $30                                      ; $4FBA: $F7
    ld   hl, sp-$07                               ; $4FBB: $F8 $F9
    ld   a, [$FCFB]                               ; $4FBD: $FA $FB $FC
    db   $fc                                      ; $4FC0: $FC
    db   $fd                                      ; $4FC1: $FD
    cp   $FF                                      ; $4FC2: $FE $FF
    nop                                           ; $4FC4: $00
    ld   bc, $0302                                ; $4FC5: $01 $02 $03
    inc  b                                        ; $4FC8: $04
    inc  b                                        ; $4FC9: $04
    dec  b                                        ; $4FCA: $05
    ld   b, $07                                   ; $4FCB: $06 $07
    ld   [$0909], sp                              ; $4FCD: $08 $09 $09
    ld   a, [bc]                                  ; $4FD0: $0A
    dec  bc                                       ; $4FD1: $0B
    inc  c                                        ; $4FD2: $0C
    dec  c                                        ; $4FD3: $0D
    ld   c, $0E                                   ; $4FD4: $0E $0E
    rrca                                          ; $4FD6: $0F
    db   $10                                      ; $4FD7: $10
    ld   de, $1312                                ; $4FD8: $11 $12 $13
    inc  d                                        ; $4FDB: $14
    dec  d                                        ; $4FDC: $15
    ld   d, $16                                   ; $4FDD: $16 $16
    rla                                           ; $4FDF: $17
    jr   jr_020_4FFB                              ; $4FE0: $18 $19

    ld   a, [de]                                  ; $4FE2: $1A
    dec  de                                       ; $4FE3: $1B
    ldh  a, [hFFE9]                               ; $4FE4: $F0 $E9
    jp   hl                                       ; $4FE6: $E9

    ld   [$EBEB], a                               ; $4FE7: $EA $EB $EB
    db   $ec                                      ; $4FEA: $EC
    db   $ed                                      ; $4FEB: $ED
    xor  $EE                                      ; $4FEC: $EE $EE
    rst  $28                                      ; $4FEE: $EF
    ldh  a, [hActiveEntityWalking]                ; $4FEF: $F0 $F0
    pop  af                                       ; $4FF1: $F1
    ld   a, [$ff00+c]                             ; $4FF2: $F2
    di                                            ; $4FF3: $F3
    db   $f4                                      ; $4FF4: $F4
    db   $f4                                      ; $4FF5: $F4
    push af                                       ; $4FF6: $F5
    or   $F7                                      ; $4FF7: $F6 $F7
    ld   hl, sp-$08                               ; $4FF9: $F8 $F8

jr_020_4FFB:
    ld   sp, hl                                   ; $4FFB: $F9
    ld   a, [$FCFB]                               ; $4FFC: $FA $FB $FC
    db   $fc                                      ; $4FFF: $FC
    db   $fd                                      ; $5000: $FD
    cp   $FF                                      ; $5001: $FE $FF
    nop                                           ; $5003: $00
    nop                                           ; $5004: $00
    ld   bc, $0302                                ; $5005: $01 $02 $03
    inc  bc                                       ; $5008: $03
    inc  b                                        ; $5009: $04
    dec  b                                        ; $500A: $05
    ld   b, $06                                   ; $500B: $06 $06
    rlca                                          ; $500D: $07
    ld   [$0A09], sp                              ; $500E: $08 $09 $0A
    ld   a, [bc]                                  ; $5011: $0A
    dec  bc                                       ; $5012: $0B
    inc  c                                        ; $5013: $0C
    inc  c                                        ; $5014: $0C
    dec  c                                        ; $5015: $0D
    ld   c, $0E                                   ; $5016: $0E $0E
    db   $10                                      ; $5018: $10
    ld   de, $1212                                ; $5019: $11 $12 $12
    inc  de                                       ; $501C: $13
    inc  d                                        ; $501D: $14
    dec  d                                        ; $501E: $15
    dec  d                                        ; $501F: $15
    ld   d, $17                                   ; $5020: $16 $17
    jr   @+$1A                                    ; $5022: $18 $18

    db   $eb                                      ; $5024: $EB
    db   $ec                                      ; $5025: $EC
    db   $ec                                      ; $5026: $EC
    db   $ed                                      ; $5027: $ED
    xor  $EE                                      ; $5028: $EE $EE
    rst  $28                                      ; $502A: $EF
    ldh  a, [hActiveEntityWalking]                ; $502B: $F0 $F0
    pop  af                                       ; $502D: $F1
    ld   a, [$ff00+c]                             ; $502E: $F2
    ld   a, [$ff00+c]                             ; $502F: $F2
    di                                            ; $5030: $F3
    db   $f4                                      ; $5031: $F4
    db   $f4                                      ; $5032: $F4
    push af                                       ; $5033: $F5
    or   $F6                                      ; $5034: $F6 $F6
    rst  $30                                      ; $5036: $F7
    ld   hl, sp-$08                               ; $5037: $F8 $F8
    ld   sp, hl                                   ; $5039: $F9
    ld   a, [$FBFA]                               ; $503A: $FA $FA $FB
    db   $fc                                      ; $503D: $FC
    db   $fc                                      ; $503E: $FC
    db   $fd                                      ; $503F: $FD
    cp   $FE                                      ; $5040: $FE $FE
    rst  $38                                      ; $5042: $FF
    nop                                           ; $5043: $00
    nop                                           ; $5044: $00
    ld   bc, $0202                                ; $5045: $01 $02 $02
    inc  bc                                       ; $5048: $03
    inc  b                                        ; $5049: $04
    inc  b                                        ; $504A: $04
    dec  b                                        ; $504B: $05
    ld   b, $06                                   ; $504C: $06 $06
    rlca                                          ; $504E: $07
    ld   [$0908], sp                              ; $504F: $08 $08 $09
    ld   a, [bc]                                  ; $5052: $0A
    ld   a, [bc]                                  ; $5053: $0A
    dec  bc                                       ; $5054: $0B
    inc  c                                        ; $5055: $0C
    inc  c                                        ; $5056: $0C
    dec  c                                        ; $5057: $0D
    ld   c, $0E                                   ; $5058: $0E $0E
    rrca                                          ; $505A: $0F
    db   $10                                      ; $505B: $10
    db   $10                                      ; $505C: $10
    ld   de, $1212                                ; $505D: $11 $12 $12
    inc  de                                       ; $5060: $13
    inc  d                                        ; $5061: $14
    inc  d                                        ; $5062: $14
    dec  d                                        ; $5063: $15
    db   $ed                                      ; $5064: $ED
    xor  $EE                                      ; $5065: $EE $EE
    rst  $28                                      ; $5067: $EF
    ldh  a, [hActiveEntityWalking]                ; $5068: $F0 $F0
    pop  af                                       ; $506A: $F1
    pop  af                                       ; $506B: $F1
    ld   a, [$ff00+c]                             ; $506C: $F2
    ld   a, [$ff00+c]                             ; $506D: $F2
    di                                            ; $506E: $F3
    di                                            ; $506F: $F3
    di                                            ; $5070: $F3
    db   $f4                                      ; $5071: $F4
    push af                                       ; $5072: $F5
    push af                                       ; $5073: $F5
    or   $F6                                      ; $5074: $F6 $F6
    rst  $30                                      ; $5076: $F7
    ld   hl, sp-$08                               ; $5077: $F8 $F8
    ld   sp, hl                                   ; $5079: $F9
    ld   sp, hl                                   ; $507A: $F9
    ld   a, [$FBFB]                               ; $507B: $FA $FB $FB
    db   $fc                                      ; $507E: $FC
    db   $fc                                      ; $507F: $FC
    cp   $FF                                      ; $5080: $FE $FF
    rst  $38                                      ; $5082: $FF
    nop                                           ; $5083: $00
    nop                                           ; $5084: $00
    ld   bc, $0201                                ; $5085: $01 $01 $02
    inc  bc                                       ; $5088: $03
    inc  bc                                       ; $5089: $03
    inc  b                                        ; $508A: $04
    inc  b                                        ; $508B: $04
    dec  b                                        ; $508C: $05
    ld   b, $06                                   ; $508D: $06 $06
    rlca                                          ; $508F: $07
    rlca                                          ; $5090: $07
    ld   [$0909], sp                              ; $5091: $08 $09 $09
    ld   a, [bc]                                  ; $5094: $0A
    ld   a, [bc]                                  ; $5095: $0A
    dec  bc                                       ; $5096: $0B
    inc  c                                        ; $5097: $0C
    inc  c                                        ; $5098: $0C
    dec  c                                        ; $5099: $0D
    dec  c                                        ; $509A: $0D
    ld   c, $0F                                   ; $509B: $0E $0F
    rrca                                          ; $509D: $0F
    db   $10                                      ; $509E: $10
    db   $10                                      ; $509F: $10
    ld   de, $1212                                ; $50A0: $11 $12 $12
    inc  de                                       ; $50A3: $13
    ldh  a, [hActiveEntitySpriteVariant]               ; $50A4: $F0 $F1
    pop  af                                       ; $50A6: $F1
    ld   a, [$ff00+c]                             ; $50A7: $F2
    ld   a, [$ff00+c]                             ; $50A8: $F2
    di                                            ; $50A9: $F3
    di                                            ; $50AA: $F3
    db   $f4                                      ; $50AB: $F4
    db   $f4                                      ; $50AC: $F4
    push af                                       ; $50AD: $F5
    push af                                       ; $50AE: $F5
    or   $F6                                      ; $50AF: $F6 $F6
    rst  $30                                      ; $50B1: $F7
    rst  $30                                      ; $50B2: $F7
    ld   hl, sp-$08                               ; $50B3: $F8 $F8
    ld   sp, hl                                   ; $50B5: $F9
    ld   sp, hl                                   ; $50B6: $F9
    ld   a, [$FBFA]                               ; $50B7: $FA $FA $FB
    ei                                            ; $50BA: $FB
    db   $fc                                      ; $50BB: $FC
    db   $fc                                      ; $50BC: $FC
    db   $fd                                      ; $50BD: $FD
    db   $fd                                      ; $50BE: $FD
    cp   $FE                                      ; $50BF: $FE $FE
    rst  $38                                      ; $50C1: $FF
    rst  $38                                      ; $50C2: $FF
    nop                                           ; $50C3: $00
    nop                                           ; $50C4: $00
    ld   bc, $0201                                ; $50C5: $01 $01 $02
    ld   [bc], a                                  ; $50C8: $02
    inc  bc                                       ; $50C9: $03
    inc  bc                                       ; $50CA: $03
    inc  b                                        ; $50CB: $04
    inc  b                                        ; $50CC: $04
    dec  b                                        ; $50CD: $05
    dec  b                                        ; $50CE: $05
    ld   b, $06                                   ; $50CF: $06 $06
    rlca                                          ; $50D1: $07
    rlca                                          ; $50D2: $07
    ld   [$0908], sp                              ; $50D3: $08 $08 $09
    add  hl, bc                                   ; $50D6: $09
    ld   a, [bc]                                  ; $50D7: $0A
    ld   a, [bc]                                  ; $50D8: $0A
    dec  bc                                       ; $50D9: $0B
    dec  bc                                       ; $50DA: $0B
    inc  c                                        ; $50DB: $0C
    inc  c                                        ; $50DC: $0C
    dec  c                                        ; $50DD: $0D
    dec  c                                        ; $50DE: $0D
    ld   c, $0E                                   ; $50DF: $0E $0E
    rrca                                          ; $50E1: $0F
    rrca                                          ; $50E2: $0F
    db   $10                                      ; $50E3: $10
    di                                            ; $50E4: $F3
    db   $f4                                      ; $50E5: $F4
    db   $f4                                      ; $50E6: $F4
    db   $f4                                      ; $50E7: $F4
    push af                                       ; $50E8: $F5
    push af                                       ; $50E9: $F5
    or   $F6                                      ; $50EA: $F6 $F6
    or   $F7                                      ; $50EC: $F6 $F7
    rst  $30                                      ; $50EE: $F7
    ld   hl, sp-$08                               ; $50EF: $F8 $F8
    ld   hl, sp-$07                               ; $50F1: $F8 $F9
    ld   sp, hl                                   ; $50F3: $F9
    ld   a, [$FAFA]                               ; $50F4: $FA $FA $FA
    ei                                            ; $50F7: $FB
    ei                                            ; $50F8: $FB
    db   $fc                                      ; $50F9: $FC
    db   $fc                                      ; $50FA: $FC
    db   $fc                                      ; $50FB: $FC
    db   $fd                                      ; $50FC: $FD
    db   $fd                                      ; $50FD: $FD
    cp   $FE                                      ; $50FE: $FE $FE
    rst  $38                                      ; $5100: $FF
    rst  $38                                      ; $5101: $FF
    nop                                           ; $5102: $00
    nop                                           ; $5103: $00
    nop                                           ; $5104: $00
    ld   bc, $0201                                ; $5105: $01 $01 $02
    ld   [bc], a                                  ; $5108: $02
    inc  bc                                       ; $5109: $03
    inc  bc                                       ; $510A: $03
    inc  bc                                       ; $510B: $03
    inc  b                                        ; $510C: $04
    inc  b                                        ; $510D: $04
    dec  b                                        ; $510E: $05
    dec  b                                        ; $510F: $05
    dec  b                                        ; $5110: $05
    ld   b, $06                                   ; $5111: $06 $06
    rlca                                          ; $5113: $07
    rlca                                          ; $5114: $07
    rlca                                          ; $5115: $07
    ld   [$0908], sp                              ; $5116: $08 $08 $09
    add  hl, bc                                   ; $5119: $09
    add  hl, bc                                   ; $511A: $09
    ld   a, [bc]                                  ; $511B: $0A
    ld   a, [bc]                                  ; $511C: $0A
    dec  bc                                       ; $511D: $0B
    dec  bc                                       ; $511E: $0B
    dec  bc                                       ; $511F: $0B
    inc  c                                        ; $5120: $0C
    inc  c                                        ; $5121: $0C
    dec  c                                        ; $5122: $0D
    dec  c                                        ; $5123: $0D
    push af                                       ; $5124: $F5
    or   $F6                                      ; $5125: $F6 $F6
    or   $F7                                      ; $5127: $F6 $F7
    rst  $30                                      ; $5129: $F7
    rst  $30                                      ; $512A: $F7
    ld   hl, sp-$08                               ; $512B: $F8 $F8
    ld   hl, sp-$07                               ; $512D: $F8 $F9
    ld   sp, hl                                   ; $512F: $F9
    ld   sp, hl                                   ; $5130: $F9
    ld   a, [$FAFA]                               ; $5131: $FA $FA $FA
    ei                                            ; $5134: $FB
    ei                                            ; $5135: $FB
    ei                                            ; $5136: $FB
    db   $fc                                      ; $5137: $FC
    db   $fc                                      ; $5138: $FC
    db   $fc                                      ; $5139: $FC
    db   $fd                                      ; $513A: $FD
    db   $fd                                      ; $513B: $FD
    db   $fd                                      ; $513C: $FD
    cp   $FE                                      ; $513D: $FE $FE
    cp   $FF                                      ; $513F: $FE $FF
    rst  $38                                      ; $5141: $FF
    rst  $38                                      ; $5142: $FF
    nop                                           ; $5143: $00
    nop                                           ; $5144: $00
    ld   bc, $0101                                ; $5145: $01 $01 $01
    ld   [bc], a                                  ; $5148: $02
    ld   [bc], a                                  ; $5149: $02
    ld   [bc], a                                  ; $514A: $02
    inc  bc                                       ; $514B: $03
    inc  bc                                       ; $514C: $03
    inc  bc                                       ; $514D: $03
    inc  b                                        ; $514E: $04
    inc  b                                        ; $514F: $04
    inc  b                                        ; $5150: $04
    dec  b                                        ; $5151: $05
    dec  b                                        ; $5152: $05
    dec  b                                        ; $5153: $05
    ld   b, $06                                   ; $5154: $06 $06
    ld   b, $07                                   ; $5156: $06 $07
    rlca                                          ; $5158: $07
    rlca                                          ; $5159: $07
    ld   [label_808], sp                          ; $515A: $08 $08 $08
    add  hl, bc                                   ; $515D: $09
    add  hl, bc                                   ; $515E: $09
    add  hl, bc                                   ; $515F: $09
    ld   a, [bc]                                  ; $5160: $0A
    ld   a, [bc]                                  ; $5161: $0A
    ld   a, [bc]                                  ; $5162: $0A
    dec  bc                                       ; $5163: $0B
    db   $fc                                      ; $5164: $FC
    db   $fc                                      ; $5165: $FC
    ei                                            ; $5166: $FB
    ei                                            ; $5167: $FB
    ei                                            ; $5168: $FB
    ei                                            ; $5169: $FB
    ld   a, [$FAFA]                               ; $516A: $FA $FA $FA
    ld   a, [$FBFB]                               ; $516D: $FA $FB $FB
    ei                                            ; $5170: $FB
    ei                                            ; $5171: $FB
    db   $fc                                      ; $5172: $FC
    db   $fc                                      ; $5173: $FC
    db   $fc                                      ; $5174: $FC
    db   $fc                                      ; $5175: $FC
    db   $fd                                      ; $5176: $FD
    db   $fd                                      ; $5177: $FD
    db   $fd                                      ; $5178: $FD
    db   $fd                                      ; $5179: $FD
    cp   $FE                                      ; $517A: $FE $FE
    cp   $FE                                      ; $517C: $FE $FE
    rst  $38                                      ; $517E: $FF
    rst  $38                                      ; $517F: $FF
    rst  $38                                      ; $5180: $FF
    rst  $38                                      ; $5181: $FF
    nop                                           ; $5182: $00
    nop                                           ; $5183: $00
    nop                                           ; $5184: $00
    nop                                           ; $5185: $00
    ld   bc, $0101                                ; $5186: $01 $01 $01
    ld   bc, $0202                                ; $5189: $01 $02 $02
    ld   [bc], a                                  ; $518C: $02
    ld   [bc], a                                  ; $518D: $02
    inc  bc                                       ; $518E: $03
    inc  bc                                       ; $518F: $03
    inc  bc                                       ; $5190: $03
    inc  bc                                       ; $5191: $03
    inc  b                                        ; $5192: $04
    inc  b                                        ; $5193: $04
    inc  b                                        ; $5194: $04
    inc  b                                        ; $5195: $04
    dec  b                                        ; $5196: $05
    dec  b                                        ; $5197: $05
    dec  b                                        ; $5198: $05
    dec  b                                        ; $5199: $05
    ld   b, $06                                   ; $519A: $06 $06
    ld   b, $06                                   ; $519C: $06 $06
    rlca                                          ; $519E: $07
    rlca                                          ; $519F: $07
    rlca                                          ; $51A0: $07
    rlca                                          ; $51A1: $07
    ld   [$FB08], sp                              ; $51A2: $08 $08 $FB
    ei                                            ; $51A5: $FB
    ei                                            ; $51A6: $FB
    ei                                            ; $51A7: $FB
    ei                                            ; $51A8: $FB
    db   $fc                                      ; $51A9: $FC
    db   $fc                                      ; $51AA: $FC
    db   $fc                                      ; $51AB: $FC
    db   $fc                                      ; $51AC: $FC
    db   $fc                                      ; $51AD: $FC
    db   $fc                                      ; $51AE: $FC
    db   $fd                                      ; $51AF: $FD
    db   $fd                                      ; $51B0: $FD
    db   $fd                                      ; $51B1: $FD
    db   $fd                                      ; $51B2: $FD
    db   $fd                                      ; $51B3: $FD
    cp   $FE                                      ; $51B4: $FE $FE
    cp   $FE                                      ; $51B6: $FE $FE
    cp   $FE                                      ; $51B8: $FE $FE
    rst  $38                                      ; $51BA: $FF
    rst  $38                                      ; $51BB: $FF
    rst  $38                                      ; $51BC: $FF
    rst  $38                                      ; $51BD: $FF
    rst  $38                                      ; $51BE: $FF
    rst  $38                                      ; $51BF: $FF
    nop                                           ; $51C0: $00
    nop                                           ; $51C1: $00
    nop                                           ; $51C2: $00
    nop                                           ; $51C3: $00
    nop                                           ; $51C4: $00
    nop                                           ; $51C5: $00
    ld   bc, $0101                                ; $51C6: $01 $01 $01
    ld   bc, $0101                                ; $51C9: $01 $01 $01
    ld   [bc], a                                  ; $51CC: $02
    ld   [bc], a                                  ; $51CD: $02
    ld   [bc], a                                  ; $51CE: $02
    ld   [bc], a                                  ; $51CF: $02
    ld   [bc], a                                  ; $51D0: $02
    ld   [bc], a                                  ; $51D1: $02
    inc  bc                                       ; $51D2: $03
    inc  bc                                       ; $51D3: $03
    inc  bc                                       ; $51D4: $03
    inc  bc                                       ; $51D5: $03
    inc  bc                                       ; $51D6: $03
    inc  bc                                       ; $51D7: $03
    inc  b                                        ; $51D8: $04
    inc  b                                        ; $51D9: $04
    inc  b                                        ; $51DA: $04
    inc  b                                        ; $51DB: $04
    inc  b                                        ; $51DC: $04
    inc  b                                        ; $51DD: $04
    dec  b                                        ; $51DE: $05
    dec  b                                        ; $51DF: $05
    dec  b                                        ; $51E0: $05
    dec  b                                        ; $51E1: $05
    dec  b                                        ; $51E2: $05
    dec  b                                        ; $51E3: $05
    db   $fd                                      ; $51E4: $FD
    db   $fd                                      ; $51E5: $FD
    db   $fd                                      ; $51E6: $FD
    db   $fd                                      ; $51E7: $FD
    db   $fd                                      ; $51E8: $FD
    db   $fd                                      ; $51E9: $FD
    db   $fd                                      ; $51EA: $FD
    db   $fd                                      ; $51EB: $FD
    cp   $FE                                      ; $51EC: $FE $FE
    cp   $FE                                      ; $51EE: $FE $FE
    cp   $FE                                      ; $51F0: $FE $FE
    cp   $FE                                      ; $51F2: $FE $FE
    cp   $FE                                      ; $51F4: $FE $FE
    rst  $38                                      ; $51F6: $FF
    cp   $FF                                      ; $51F7: $FE $FF
    rst  $38                                      ; $51F9: $FF
    rst  $38                                      ; $51FA: $FF
    rst  $38                                      ; $51FB: $FF
    rst  $38                                      ; $51FC: $FF
    rst  $38                                      ; $51FD: $FF
    rst  $38                                      ; $51FE: $FF
    nop                                           ; $51FF: $00
    nop                                           ; $5200: $00
    nop                                           ; $5201: $00
    nop                                           ; $5202: $00
    nop                                           ; $5203: $00
    nop                                           ; $5204: $00
    nop                                           ; $5205: $00
    nop                                           ; $5206: $00
    nop                                           ; $5207: $00
    nop                                           ; $5208: $00
    ld   bc, $0101                                ; $5209: $01 $01 $01
    ld   bc, $0101                                ; $520C: $01 $01 $01
    ld   bc, $0101                                ; $520F: $01 $01 $01
    ld   bc, $0202                                ; $5212: $01 $02 $02
    ld   [bc], a                                  ; $5215: $02
    ld   [bc], a                                  ; $5216: $02
    ld   [bc], a                                  ; $5217: $02
    ld   [bc], a                                  ; $5218: $02
    ld   [bc], a                                  ; $5219: $02
    ld   [bc], a                                  ; $521A: $02
    ld   [bc], a                                  ; $521B: $02
    ld   [bc], a                                  ; $521C: $02
    inc  bc                                       ; $521D: $03
    inc  bc                                       ; $521E: $03
    inc  bc                                       ; $521F: $03
    inc  bc                                       ; $5220: $03
    inc  bc                                       ; $5221: $03
    inc  bc                                       ; $5222: $03
    inc  bc                                       ; $5223: $03

data_020_5224::
    inc  h                                        ; $5224: $24
    ld   c, l                                     ; $5225: $4D
    ld   h, h                                     ; $5226: $64
    ld   c, l                                     ; $5227: $4D
    and  h                                        ; $5228: $A4
    ld   c, l                                     ; $5229: $4D
    inc  h                                        ; $522A: $24
    ld   c, [hl]                                  ; $522B: $4E
    and  h                                        ; $522C: $A4
    ld   c, [hl]                                  ; $522D: $4E
    db   $e4                                      ; $522E: $E4
    ld   c, [hl]                                  ; $522F: $4E
    ld   h, h                                     ; $5230: $64
    ld   c, a                                     ; $5231: $4F
    and  h                                        ; $5232: $A4
    ld   c, a                                     ; $5233: $4F
    db   $e4                                      ; $5234: $E4
    ld   c, a                                     ; $5235: $4F
    ld   h, h                                     ; $5236: $64
    ld   d, b                                     ; $5237: $50
    and  h                                        ; $5238: $A4
    ld   d, b                                     ; $5239: $50
    db   $e4                                      ; $523A: $E4
    ld   d, b                                     ; $523B: $50
    inc  h                                        ; $523C: $24
    ld   d, c                                     ; $523D: $51
    ld   h, h                                     ; $523E: $64
    ld   d, c                                     ; $523F: $51
    and  h                                        ; $5240: $A4
    ld   d, c                                     ; $5241: $51
    db   $e4                                      ; $5242: $E4
    ld   d, c                                     ; $5243: $51
    db   $e4                                      ; $5244: $E4
    ld   c, h                                     ; $5245: $4C

data_020_5246::
    jr   z, @+$2C                                 ; $5246: $28 $2A

    inc  l                                        ; $5248: $2C
    inc  l                                        ; $5249: $2C
    ld   l, $2E                                   ; $524A: $2E $2E
    jr   nc, @+$32                                ; $524C: $30 $30

    ld   sp, $3333                                ; $524E: $31 $33 $33
    inc  [hl]                                     ; $5251: $34
    dec  [hl]                                     ; $5252: $35
    ld   [hl], $38                                ; $5253: $36 $38
    ld   a, [hl-]                                 ; $5255: $3A
    ld   a, [hl-]                                 ; $5256: $3A

; Position sprites for the title screen (?)
; Maybe also controls the apparition effect of
; the title.
PositionTitleScreenSprites::
    ; If not on the intro title, return
    ld   a, [wGameplaySubtype]                    ; $5257: $FA $96 $DB
    cp   GAMEPLAY_INTRO_TITLE - 1                 ; $525A: $FE $0A
    ret  nc                                       ; $525C: $D0

    ld   hl, $C17C                                ; $525D: $21 $7C $C1
    xor  a                                        ; $5260: $AF
    ld   [hl+], a                                 ; $5261: $22
    ld   [hl+], a                                 ; $5262: $22
    ld   d, $00                                   ; $5263: $16 $00
    ldh  a, [hFrameCounter]                       ; $5265: $F0 $E7
    and  $01                                      ; $5267: $E6 $01
    jr   nz, jr_020_527C                          ; $5269: $20 $11

    ld   a, [$C17E]                               ; $526B: $FA $7E $C1
    inc  a                                        ; $526E: $3C
    cp   $10                                      ; $526F: $FE $10
    jr   c, jr_020_5279                           ; $5271: $38 $06

    ld   a, $10                                   ; $5273: $3E $10
    ld   [$C17E], a                               ; $5275: $EA $7E $C1
    ret                                           ; $5278: $C9

jr_020_5279:
    ld   [$C17E], a                               ; $5279: $EA $7E $C1

jr_020_527C:
    ld   a, [$C17E]                               ; $527C: $FA $7E $C1
    ld   e, a                                     ; $527F: $5F
    ld   hl, data_020_5246                        ; $5280: $21 $46 $52
    add  hl, de                                   ; $5283: $19
    ld   a, [hl]                                  ; $5284: $7E
    ldh  [hScratch0], a                           ; $5285: $E0 $D7
    sla  e                                        ; $5287: $CB $23
    ld   hl, data_020_5224                        ; $5289: $21 $24 $52
    add  hl, de                                   ; $528C: $19
    ld   a, [hl+]                                 ; $528D: $2A
    ld   b, [hl]                                  ; $528E: $46
    ld   c, a                                     ; $528F: $4F

jr_020_5290:
    ld   a, [rLY]                                 ; $5290: $F0 $44
    cp   $10                                      ; $5292: $FE $10
    jr   nz, jr_020_5290                          ; $5294: $20 $FA

jr_020_5296:
    ld   a, [rSTAT]                               ; $5296: $F0 $41
    and  $03                                      ; $5298: $E6 $03
    jr   nz, jr_020_5296                          ; $529A: $20 $FA

    ld   hl, hScratch1                            ; $529C: $21 $D8 $FF
    ld   [hl], $01                                ; $529F: $36 $01
    ldh  a, [hIsGBC]                              ; $52A1: $F0 $FE
    and  a                                        ; $52A3: $A7
    jr   z, jr_020_52A8                           ; $52A4: $28 $02

    ld   [hl], $03                                ; $52A6: $36 $03

jr_020_52A8:
    ld   a, [$C17D]                               ; $52A8: $FA $7D $C1
    inc  a                                        ; $52AB: $3C
    ld   [$C17D], a                               ; $52AC: $EA $7D $C1
    and  [hl]                                     ; $52AF: $A6
    jr   nz, jr_020_52A8                          ; $52B0: $20 $F6

    ldh  a, [hScratch0]                           ; $52B2: $F0 $D7
    ld   l, a                                     ; $52B4: $6F
    ld   a, [$C17C]                               ; $52B5: $FA $7C $C1
    ld   e, a                                     ; $52B8: $5F
    inc  a                                        ; $52B9: $3C
    ld   [$C17C], a                               ; $52BA: $EA $7C $C1
    cp   $3A                                      ; $52BD: $FE $3A
    jr   z, jr_020_52DC                           ; $52BF: $28 $1B

    cp   l                                        ; $52C1: $BD
    jr   c, jr_020_52CE                           ; $52C2: $38 $0A

    ldh  a, [hIsGBC]                              ; $52C4: $F0 $FE
    and  a                                        ; $52C6: $A7
    jr   nz, jr_020_52DC                          ; $52C7: $20 $13

    xor  a                                        ; $52C9: $AF
    ld   [rBGP], a                                ; $52CA: $E0 $47
    jr   jr_020_5296                              ; $52CC: $18 $C8

jr_020_52CE:
    ld   hl, $0000                                ; $52CE: $21 $00 $00
    add  hl, de                                   ; $52D1: $19
    add  hl, bc                                   ; $52D2: $09
    ld   a, [hl]                                  ; $52D3: $7E
    ld   hl, hBaseScrollY                         ; $52D4: $21 $97 $FF
    add  [hl]                                     ; $52D7: $86
    ld   [rSCY], a                                ; $52D8: $E0 $42
    jr   jr_020_5296                              ; $52DA: $18 $BA

jr_020_52DC:
    ldh  a, [hBaseScrollY]                        ; $52DC: $F0 $97
    sub  $38                                      ; $52DE: $D6 $38
    ld   [rSCY], a                                ; $52E0: $E0 $42

jr_020_52E2:
    ld   a, [rLY]                                 ; $52E2: $F0 $44
    cp   $48                                      ; $52E4: $FE $48
    jr   c, jr_020_52E2                           ; $52E6: $38 $FA

jr_020_52E8:
    ld   a, [rSTAT]                               ; $52E8: $F0 $41
    and  $03                                      ; $52EA: $E6 $03
    jr   nz, jr_020_52E8                          ; $52EC: $20 $FA

    ldh  a, [hBaseScrollY]                        ; $52EE: $F0 $97
    ld   [rSCY], a                                ; $52F0: $E0 $42
    ld   a, [wBGPalette]                          ; $52F2: $FA $97 $DB
    ld   [rBGP], a                                ; $52F5: $E0 $47
    ret                                           ; $52F7: $C9

    rst  $38                                      ; $52F8: $FF
    ld   a, a                                     ; $52F9: $7F
    rst  $38                                      ; $52FA: $FF
    ld   a, a                                     ; $52FB: $7F
    rst  $38                                      ; $52FC: $FF
    ld   a, a                                     ; $52FD: $7F
    rst  $38                                      ; $52FE: $FF
    ld   a, a                                     ; $52FF: $7F
    rst  $38                                      ; $5300: $FF
    ld   a, a                                     ; $5301: $7F
    rst  $38                                      ; $5302: $FF
    ld   a, a                                     ; $5303: $7F
    rst  $38                                      ; $5304: $FF
    ld   a, a                                     ; $5305: $7F
    rst  $38                                      ; $5306: $FF
    ld   a, a                                     ; $5307: $7F
    ld   a, $98                                   ; $5308: $3E $98
    ld   [rBCPS], a                               ; $530A: $E0 $68
    ld   hl, $FF69                                ; $530C: $21 $69 $FF
    ld   b, $08                                   ; $530F: $06 $08

jr_020_5311:
    ld   [hl], $FF                                ; $5311: $36 $FF
    ld   [hl], $7F                                ; $5313: $36 $7F
    dec  b                                        ; $5315: $05
    jr   nz, jr_020_5311                          ; $5316: $20 $F9

    ret                                           ; $5318: $C9

LinkAnimationStateTable::
    nop                                           ; $5319: $00
    ld   [bc], a                                  ; $531A: $02
    ld   [bc], a                                  ; $531B: $02
    nop                                           ; $531C: $00
    db   $10                                      ; $531D: $10
    ld   [bc], a                                  ; $531E: $02
    ld   [de], a                                  ; $531F: $12
    nop                                           ; $5320: $00
    inc  b                                        ; $5321: $04
    ld   b, $06                                   ; $5322: $06 $06
    inc  b                                        ; $5324: $04
    ld   [$0C0A], sp                              ; $5325: $08 $0A $0C
    ld   c, $18                                   ; $5328: $0E $18
    ld   a, [bc]                                  ; $532A: $0A
    inc  e                                        ; $532B: $1C
    ld   c, $0A                                   ; $532C: $0E $0A
    ld   [$0C0E], sp                              ; $532E: $08 $0E $0C
    ld   a, [bc]                                  ; $5331: $0A
    jr   jr_020_5342                              ; $5332: $18 $0E

    inc  e                                        ; $5334: $1C
    jr   nz, jr_020_5359                          ; $5335: $20 $22

    inc  h                                        ; $5337: $24
    ld   h, $28                                   ; $5338: $26 $28
    ld   a, [hl+]                                 ; $533A: $2A
    ld   a, [hl+]                                 ; $533B: $2A
    jr   z, jr_020_536E                           ; $533C: $28 $30

    ld   [hl-], a                                 ; $533E: $32
    jr   nz, jr_020_5363                          ; $533F: $20 $22

    inc  [hl]                                     ; $5341: $34

jr_020_5342:
    ld   [hl], $24                                ; $5342: $36 $24
    ld   h, $38                                   ; $5344: $26 $38
    ld   a, [hl-]                                 ; $5346: $3A
    jr   z, @+$2C                                 ; $5347: $28 $2A

    ld   a, [hl-]                                 ; $5349: $3A
    jr   c, jr_020_5376                           ; $534A: $38 $2A

    jr   z, jr_020_538E                           ; $534C: $28 $40

    ld   b, b                                     ; $534E: $40
    ld   b, d                                     ; $534F: $42
    ld   b, d                                     ; $5350: $42
    ld   b, h                                     ; $5351: $44
    ld   b, [hl]                                  ; $5352: $46
    ld   c, b                                     ; $5353: $48
    ld   c, d                                     ; $5354: $4A
    ld   c, h                                     ; $5355: $4C
    ld   c, [hl]                                  ; $5356: $4E
    ld   d, b                                     ; $5357: $50
    ld   d, d                                     ; $5358: $52

jr_020_5359:
    ld   c, [hl]                                  ; $5359: $4E
    ld   c, h                                     ; $535A: $4C
    ld   d, d                                     ; $535B: $52
    ld   d, b                                     ; $535C: $50
    add  b                                        ; $535D: $80
    ld   [bc], a                                  ; $535E: $02
    add  d                                        ; $535F: $82
    nop                                           ; $5360: $00
    add  h                                        ; $5361: $84
    add  [hl]                                     ; $5362: $86

jr_020_5363:
    adc  b                                        ; $5363: $88
    adc  d                                        ; $5364: $8A
    adc  h                                        ; $5365: $8C
    adc  [hl]                                     ; $5366: $8E
    sub  b                                        ; $5367: $90
    sub  d                                        ; $5368: $92
    sub  h                                        ; $5369: $94
    sub  [hl]                                     ; $536A: $96
    sbc  b                                        ; $536B: $98
    sbc  d                                        ; $536C: $9A
    sbc  h                                        ; $536D: $9C

jr_020_536E:
    sbc  [hl]                                     ; $536E: $9E
    sbc  d                                        ; $536F: $9A
    and  d                                        ; $5370: $A2
    and  h                                        ; $5371: $A4
    ld   [$0CA6], sp                              ; $5372: $08 $A6 $0C
    xor  b                                        ; $5375: $A8

jr_020_5376:
    xor  d                                        ; $5376: $AA
    xor  h                                        ; $5377: $AC
    xor  [hl]                                     ; $5378: $AE
    or   b                                        ; $5379: $B0
    or   d                                        ; $537A: $B2
    or   h                                        ; $537B: $B4
    or   [hl]                                     ; $537C: $B6
    or   b                                        ; $537D: $B0
    or   d                                        ; $537E: $B2
    or   h                                        ; $537F: $B4
    or   [hl]                                     ; $5380: $B6
    inc  b                                        ; $5381: $04
    ret  nz                                       ; $5382: $C0

    ld   b, $C2                                   ; $5383: $06 $C2
    ld   e, d                                     ; $5385: $5A
    ld   e, b                                     ; $5386: $58
    ld   e, [hl]                                  ; $5387: $5E
    ld   e, h                                     ; $5388: $5C
    ld   e, b                                     ; $5389: $58
    ld   e, d                                     ; $538A: $5A
    ld   e, h                                     ; $538B: $5C
    ld   e, [hl]                                  ; $538C: $5E
    ld   b, h                                     ; $538D: $44

jr_020_538E:
    ld   b, [hl]                                  ; $538E: $46
    ld   l, [hl]                                  ; $538F: $6E
    ld   l, [hl]                                  ; $5390: $6E
    ld   b, b                                     ; $5391: $40
    ld   b, b                                     ; $5392: $40
    ld   d, [hl]                                  ; $5393: $56
    ld   d, [hl]                                  ; $5394: $56
    ld   a, d                                     ; $5395: $7A
    ld   a, b                                     ; $5396: $78
    ld   a, [hl]                                  ; $5397: $7E
    ld   a, h                                     ; $5398: $7C
    ld   a, b                                     ; $5399: $78
    ld   a, d                                     ; $539A: $7A
    ld   a, h                                     ; $539B: $7C
    ld   a, [hl]                                  ; $539C: $7E
    ld   [hl], h                                  ; $539D: $74
    db   $76                                      ; $539E: $76
    db   $76                                      ; $539F: $76
    ld   [hl], h                                  ; $53A0: $74
    ld   [hl], b                                  ; $53A1: $70
    ld   [hl], d                                  ; $53A2: $72
    ld   [hl], d                                  ; $53A3: $72
    ld   [hl], b                                  ; $53A4: $70
    jp   z, $D6C8                                 ; $53A5: $CA $C8 $D6

    call nc, $CAC8                                ; $53A8: $D4 $C8 $CA
    call nc, $CCD6                                ; $53AB: $D4 $D6 $CC
    adc  $D8                                      ; $53AE: $CE $D8
    jp   c, $C4C4                                 ; $53B0: $DA $C4 $C4

    add  $C6                                      ; $53B3: $C6 $C6
    call c, $DEDC                                 ; $53B5: $DC $DC $DE
    sbc  $EA                                      ; $53B8: $DE $EA
    db   $ec                                      ; $53BA: $EC
    xor  $F0                                      ; $53BB: $EE $F0
    ld   a, [$ff00+c]                             ; $53BD: $F2
    db   $f4                                      ; $53BE: $F4
    or   $F6                                      ; $53BF: $F6 $F6
    ld   hl, sp-$06                               ; $53C1: $F8 $FA
    ldh  [$FFE2], a                               ; $53C3: $E0 $E2
    db   $e4                                      ; $53C5: $E4
    and  $E8                                      ; $53C6: $E6 $E8
    add  sp, $10                                  ; $53C8: $E8 $10
    ld   [de], a                                  ; $53CA: $12
    inc  d                                        ; $53CB: $14
    ld   d, $18                                   ; $53CC: $16 $18
    inc  e                                        ; $53CE: $1C
    ld   [de], a                                  ; $53CF: $12
    db   $10                                      ; $53D0: $10
    ld   d, $14                                   ; $53D1: $16 $14
    inc  e                                        ; $53D3: $1C
    jr   jr_020_543C                              ; $53D4: $18 $66

    ld   l, b                                     ; $53D6: $68
    ld   l, d                                     ; $53D7: $6A
    ld   l, h                                     ; $53D8: $6C
    ld   l, b                                     ; $53D9: $68
    ld   h, [hl]                                  ; $53DA: $66
    ld   l, b                                     ; $53DB: $68
    ld   h, [hl]                                  ; $53DC: $66
    ld   l, h                                     ; $53DD: $6C
    ld   l, d                                     ; $53DE: $6A
    ld   h, [hl]                                  ; $53DF: $66
    ld   l, b                                     ; $53E0: $68
    ld   h, b                                     ; $53E1: $60
    ld   h, b                                     ; $53E2: $60
    ld   h, d                                     ; $53E3: $62
    ld   h, d                                     ; $53E4: $62
    ld   h, h                                     ; $53E5: $64
    ld   h, h                                     ; $53E6: $64
    ld   h, d                                     ; $53E7: $62
    ld   h, d                                     ; $53E8: $62
    ld   h, h                                     ; $53E9: $64
    ld   h, h                                     ; $53EA: $64
    ld   h, b                                     ; $53EB: $60
    ld   h, b                                     ; $53EC: $60
    ld   d, h                                     ; $53ED: $54
    ld   d, h                                     ; $53EE: $54
    inc  a                                        ; $53EF: $3C
    ld   a, $FE                                   ; $53F0: $3E $FE
    cp   $18                                      ; $53F2: $FE $18
    ld   a, [de]                                  ; $53F4: $1A
    inc  e                                        ; $53F5: $1C
    ld   e, $2C                                   ; $53F6: $1E $2C
    ld   l, $B8                                   ; $53F8: $2E $B8
    cp   d                                        ; $53FA: $BA
    ld   l, $2C                                   ; $53FB: $2E $2C
    cp   d                                        ; $53FD: $BA
    cp   b                                        ; $53FE: $B8
    cp   h                                        ; $53FF: $BC
    cp   [hl]                                     ; $5400: $BE
    ret  nc                                       ; $5401: $D0

    jp   nc, $FCA0                                ; $5402: $D2 $A0 $FC

    db   $fc                                      ; $5405: $FC
    and  b                                        ; $5406: $A0

data_020_5407::
    nop                                           ; $5407: $00
    nop                                           ; $5408: $00
    jr   nz, jr_020_542B                          ; $5409: $20 $20

    nop                                           ; $540B: $00
    nop                                           ; $540C: $00
    nop                                           ; $540D: $00
    jr   nz, jr_020_5410                          ; $540E: $20 $00

jr_020_5410:
    nop                                           ; $5410: $00
    jr   nz, jr_020_5433                          ; $5411: $20 $20

    nop                                           ; $5413: $00
    nop                                           ; $5414: $00
    nop                                           ; $5415: $00
    nop                                           ; $5416: $00
    nop                                           ; $5417: $00
    nop                                           ; $5418: $00
    nop                                           ; $5419: $00
    nop                                           ; $541A: $00
    jr   nz, @+$22                                ; $541B: $20 $20

    jr   nz, @+$22                                ; $541D: $20 $20

    jr   nz, jr_020_5441                          ; $541F: $20 $20

    jr   nz, jr_020_5443                          ; $5421: $20 $20

    nop                                           ; $5423: $00
    nop                                           ; $5424: $00
    nop                                           ; $5425: $00
    nop                                           ; $5426: $00
    nop                                           ; $5427: $00
    nop                                           ; $5428: $00
    jr   nz, jr_020_544B                          ; $5429: $20 $20

jr_020_542B:
    nop                                           ; $542B: $00
    nop                                           ; $542C: $00
    nop                                           ; $542D: $00
    nop                                           ; $542E: $00
    nop                                           ; $542F: $00
    nop                                           ; $5430: $00
    nop                                           ; $5431: $00
    nop                                           ; $5432: $00

jr_020_5433:
    nop                                           ; $5433: $00
    nop                                           ; $5434: $00
    nop                                           ; $5435: $00
    nop                                           ; $5436: $00
    jr   nz, jr_020_5459                          ; $5437: $20 $20

    jr   nz, jr_020_545B                          ; $5439: $20 $20

    nop                                           ; $543B: $00

jr_020_543C:
    jr   nz, jr_020_543E                          ; $543C: $20 $00

jr_020_543E:
    jr   nz, jr_020_5440                          ; $543E: $20 $00

jr_020_5440:
    nop                                           ; $5440: $00

jr_020_5441:
    nop                                           ; $5441: $00
    nop                                           ; $5442: $00

jr_020_5443:
    nop                                           ; $5443: $00
    nop                                           ; $5444: $00
    nop                                           ; $5445: $00
    nop                                           ; $5446: $00
    jr   nz, jr_020_5469                          ; $5447: $20 $20

    jr   nz, jr_020_546B                          ; $5449: $20 $20

jr_020_544B:
    nop                                           ; $544B: $00
    nop                                           ; $544C: $00
    nop                                           ; $544D: $00
    jr   nz, jr_020_5450                          ; $544E: $20 $00

jr_020_5450:
    nop                                           ; $5450: $00
    nop                                           ; $5451: $00
    nop                                           ; $5452: $00
    nop                                           ; $5453: $00
    nop                                           ; $5454: $00
    nop                                           ; $5455: $00
    nop                                           ; $5456: $00
    nop                                           ; $5457: $00
    nop                                           ; $5458: $00

jr_020_5459:
    nop                                           ; $5459: $00
    nop                                           ; $545A: $00

jr_020_545B:
    nop                                           ; $545B: $00
    nop                                           ; $545C: $00
    jr   nz, jr_020_545F                          ; $545D: $20 $00

jr_020_545F:
    nop                                           ; $545F: $00
    jr   nz, jr_020_5462                          ; $5460: $20 $00

jr_020_5462:
    jr   nz, jr_020_5464                          ; $5462: $20 $00

jr_020_5464:
    nop                                           ; $5464: $00
    nop                                           ; $5465: $00
    nop                                           ; $5466: $00
    nop                                           ; $5467: $00
    nop                                           ; $5468: $00

jr_020_5469:
    nop                                           ; $5469: $00
    nop                                           ; $546A: $00

jr_020_546B:
    nop                                           ; $546B: $00
    nop                                           ; $546C: $00
    nop                                           ; $546D: $00
    nop                                           ; $546E: $00
    nop                                           ; $546F: $00
    nop                                           ; $5470: $00
    jr   nz, jr_020_5473                          ; $5471: $20 $00

jr_020_5473:
    jr   nz, jr_020_5495                          ; $5473: $20 $20

    jr   nz, jr_020_5497                          ; $5475: $20 $20

    nop                                           ; $5477: $00
    nop                                           ; $5478: $00
    nop                                           ; $5479: $00
    nop                                           ; $547A: $00
    nop                                           ; $547B: $00
    nop                                           ; $547C: $00
    nop                                           ; $547D: $00
    jr   nz, jr_020_5480                          ; $547E: $20 $00

jr_020_5480:
    jr   nz, jr_020_5482                          ; $5480: $20 $00

jr_020_5482:
    jr   nz, jr_020_54A4                          ; $5482: $20 $20

    jr   nz, jr_020_54A6                          ; $5484: $20 $20

    jr   nz, jr_020_5488                          ; $5486: $20 $00

jr_020_5488:
    nop                                           ; $5488: $00
    nop                                           ; $5489: $00
    nop                                           ; $548A: $00
    nop                                           ; $548B: $00
    nop                                           ; $548C: $00
    jr   nz, @+$22                                ; $548D: $20 $20

    nop                                           ; $548F: $00
    nop                                           ; $5490: $00
    jr   nz, jr_020_54B3                          ; $5491: $20 $20

    jr   nz, jr_020_54B5                          ; $5493: $20 $20

jr_020_5495:
    jr   nz, @+$22                                ; $5495: $20 $20

jr_020_5497:
    nop                                           ; $5497: $00
    nop                                           ; $5498: $00
    nop                                           ; $5499: $00
    nop                                           ; $549A: $00
    nop                                           ; $549B: $00
    nop                                           ; $549C: $00
    nop                                           ; $549D: $00
    nop                                           ; $549E: $00
    nop                                           ; $549F: $00
    jr   nz, jr_020_54A2                          ; $54A0: $20 $00

jr_020_54A2:
    jr   nz, jr_020_54A4                          ; $54A2: $20 $00

jr_020_54A4:
    jr   nz, jr_020_54A6                          ; $54A4: $20 $00

jr_020_54A6:
    jr   nz, jr_020_54A8                          ; $54A6: $20 $00

jr_020_54A8:
    nop                                           ; $54A8: $00
    nop                                           ; $54A9: $00
    nop                                           ; $54AA: $00
    nop                                           ; $54AB: $00
    nop                                           ; $54AC: $00
    nop                                           ; $54AD: $00
    jr   nz, jr_020_54B0                          ; $54AE: $20 $00

jr_020_54B0:
    nop                                           ; $54B0: $00
    nop                                           ; $54B1: $00
    nop                                           ; $54B2: $00

jr_020_54B3:
    nop                                           ; $54B3: $00
    nop                                           ; $54B4: $00

jr_020_54B5:
    nop                                           ; $54B5: $00
    jr   nz, jr_020_54B8                          ; $54B6: $20 $00

jr_020_54B8:
    nop                                           ; $54B8: $00
    nop                                           ; $54B9: $00
    nop                                           ; $54BA: $00
    nop                                           ; $54BB: $00
    nop                                           ; $54BC: $00
    jr   nz, jr_020_54DF                          ; $54BD: $20 $20

    jr   nz, @+$22                                ; $54BF: $20 $20

    jr   nz, jr_020_54E3                          ; $54C1: $20 $20

    nop                                           ; $54C3: $00
    nop                                           ; $54C4: $00
    nop                                           ; $54C5: $00
    nop                                           ; $54C6: $00
    ld   h, b                                     ; $54C7: $60
    ld   h, b                                     ; $54C8: $60
    jr   nz, jr_020_54EB                          ; $54C9: $20 $20

    jr   nz, jr_020_54ED                          ; $54CB: $20 $20

    ld   b, b                                     ; $54CD: $40
    ld   b, b                                     ; $54CE: $40
    nop                                           ; $54CF: $00
    jr   nz, jr_020_54D2                          ; $54D0: $20 $00

jr_020_54D2:
    jr   nz, jr_020_54D4                          ; $54D2: $20 $00

jr_020_54D4:
    jr   nz, jr_020_5516                          ; $54D4: $20 $40

    ld   h, b                                     ; $54D6: $60
    ld   b, b                                     ; $54D7: $40
    ld   h, b                                     ; $54D8: $60
    ld   b, b                                     ; $54D9: $40
    ld   h, b                                     ; $54DA: $60
    nop                                           ; $54DB: $00
    jr   nz, jr_020_54DE                          ; $54DC: $20 $00

jr_020_54DE:
    nop                                           ; $54DE: $00

jr_020_54DF:
    nop                                           ; $54DF: $00
    jr   nz, jr_020_54E2                          ; $54E0: $20 $00

jr_020_54E2:
    nop                                           ; $54E2: $00

jr_020_54E3:
    nop                                           ; $54E3: $00
    nop                                           ; $54E4: $00
    nop                                           ; $54E5: $00
    nop                                           ; $54E6: $00
    nop                                           ; $54E7: $00
    nop                                           ; $54E8: $00
    jr   nz, @+$22                                ; $54E9: $20 $20

jr_020_54EB:
    jr   nz, @+$22                                ; $54EB: $20 $20

jr_020_54ED:
    nop                                           ; $54ED: $00
    nop                                           ; $54EE: $00
    nop                                           ; $54EF: $00
    nop                                           ; $54F0: $00
    nop                                           ; $54F1: $00
    nop                                           ; $54F2: $00
    jr   nz, @+$22                                ; $54F3: $20 $20

; Called from SkipTilesGroupAnimation
Func_020_54F5::
    ldh  a, [hLinkAnimationState]                 ; $54F5: $F0 $9D
    cp   $FF                                      ; $54F7: $FE $FF
    ret  z                                        ; $54F9: $C8

    ld   hl, LinkAnimationStateTable              ; $54FA: $21 $19 $53
    sla  a                                        ; $54FD: $CB $27
    ld   c, a                                     ; $54FF: $4F
    ld   b, $00                                   ; $5500: $06 $00
    add  hl, bc                                   ; $5502: $09
    ld   e, [hl]                                  ; $5503: $5E
    push hl                                       ; $5504: $E5
    ld   hl, data_020_5407                        ; $5505: $21 $07 $54
    add  hl, bc                                   ; $5508: $09
    ld   a, [wC11D]                               ; $5509: $FA $1D $C1
    and  $98                                      ; $550C: $E6 $98
    or   [hl]                                     ; $550E: $B6
    ld   [wC11D], a                               ; $550F: $EA $1D $C1
    inc  hl                                       ; $5512: $23
    ld   a, [wC11E]                               ; $5513: $FA $1E $C1

jr_020_5516:
    and  $98                                      ; $5516: $E6 $98
    or   [hl]                                     ; $5518: $B6
    ld   [wC11E], a                               ; $5519: $EA $1E $C1
    ld   d, $00                                   ; $551C: $16 $00
    sla  e                                        ; $551E: $CB $23
    rl   d                                        ; $5520: $CB $12
    sla  e                                        ; $5522: $CB $23
    rl   d                                        ; $5524: $CB $12
    sla  e                                        ; $5526: $CB $23
    rl   d                                        ; $5528: $CB $12
    sla  e                                        ; $552A: $CB $23
    rl   d                                        ; $552C: $CB $12
    ld   hl, data_020_5800                        ; $552E: $21 $00 $58
    add  hl, de                                   ; $5531: $19
    ld   c, l                                     ; $5532: $4D
    ld   b, h                                     ; $5533: $44
    ld   hl, vTiles0                              ; $5534: $21 $00 $80
    ld   d, $20                                   ; $5537: $16 $20
    call label_1D0A                               ; $5539: $CD $0A $1D
    pop  hl                                       ; $553C: $E1
    inc  hl                                       ; $553D: $23
    ld   e, [hl]                                  ; $553E: $5E
    ld   d, $00                                   ; $553F: $16 $00
    sla  e                                        ; $5541: $CB $23
    rl   d                                        ; $5543: $CB $12
    sla  e                                        ; $5545: $CB $23
    rl   d                                        ; $5547: $CB $12
    sla  e                                        ; $5549: $CB $23
    rl   d                                        ; $554B: $CB $12
    sla  e                                        ; $554D: $CB $23
    rl   d                                        ; $554F: $CB $12
    ld   hl, data_020_5800                        ; $5551: $21 $00 $58
    add  hl, de                                   ; $5554: $19
    ld   c, l                                     ; $5555: $4D
    ld   b, h                                     ; $5556: $44
    ld   hl, $8020                                ; $5557: $21 $20 $80
    ld   d, $20                                   ; $555A: $16 $20
    call label_1D0A                               ; $555C: $CD $0A $1D
    ret                                           ; $555F: $C9

    ld   [$0A08], sp                              ; $5560: $08 $08 $0A
    ld   a, [bc]                                  ; $5563: $0A
    ld   bc, $F0FF                                ; $5564: $01 $FF $F0
    stop                                          ; $5567: $10 $00
    nop                                           ; $5569: $00
    inc  bc                                       ; $556A: $03
    nop                                           ; $556B: $00
    ld   bc, $E01F                                ; $556C: $01 $1F $E0
    db   $20                                      ; $556F: $20

; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
Func_020_5570::
    ld   e, $FF                                   ; $5570: $FF
    ld   a, [wRoomTransitionDirection]            ; $5572: $FA $25 $C1
    ld   c, a                                     ; $5575: $4F
    ld   b, $00                                   ; $5576: $06 $00
    and  $02                                      ; $5578: $E6 $02
    jr   nz, jr_020_557E                          ; $557A: $20 $02

    ld   e, $DF                                   ; $557C: $1E $DF

jr_020_557E:
    ld   hl, $5560                                ; $557E: $21 $60 $55
    add  hl, bc                                   ; $5581: $09
    ld   a, [hl]                                  ; $5582: $7E
    ld   [wBGUpdateRegionTilesCount], a           ; $5583: $EA $28 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen]; $5586: $FA $29 $C1
    and  $01                                      ; $5589: $E6 $01
    jr   z, jr_020_5598                           ; $558B: $28 $0B

    ld   hl, $5564                                ; $558D: $21 $64 $55
    add  hl, bc                                   ; $5590: $09
    ld   a, [$C12A]                               ; $5591: $FA $2A $C1
    add  [hl]                                     ; $5594: $86
    ld   [$C12A], a                               ; $5595: $EA $2A $C1

jr_020_5598:
    ld   hl, $556C                                ; $5598: $21 $6C $55
    add  hl, bc                                   ; $559B: $09
    ld   a, [wBGUpdateRegionOriginLow]            ; $559C: $FA $27 $C1
    add  [hl]                                     ; $559F: $86
    rr   d                                        ; $55A0: $CB $1A
    and  e                                        ; $55A2: $A3
    ld   [wBGUpdateRegionOriginLow], a            ; $55A3: $EA $27 $C1
    ld   hl, $5568                                ; $55A6: $21 $68 $55
    add  hl, bc                                   ; $55A9: $09
    ld   a, [wBGUpdateRegionOriginHigh]           ; $55AA: $FA $26 $C1
    rl   d                                        ; $55AD: $CB $12
    adc  [hl]                                     ; $55AF: $8E
    and  $03                                      ; $55B0: $E6 $03
    ld   [wBGUpdateRegionOriginHigh], a           ; $55B2: $EA $26 $C1
    ld   a, [wRoomTransitionFramesBeforeMidScreen]; $55B5: $FA $29 $C1
    dec  a                                        ; $55B8: $3D
    ld   [wRoomTransitionFramesBeforeMidScreen], a; $55B9: $EA $29 $C1
    jr   nz, jr_020_55C1                          ; $55BC: $20 $03

    jp   label_020_55C2                           ; $55BE: $C3 $C2 $55

jr_020_55C1:
    ret                                           ; $55C1: $C9

label_020_55C2:
    ld   a, [wRoomTransitionState]                ; $55C2: $FA $24 $C1
    inc  a                                        ; $55C5: $3C
    ld   [wRoomTransitionState], a                ; $55C6: $EA $24 $C1
    ret                                           ; $55C9: $C9

Func_020_55CA::
    ldh  a, [hFFA8]                               ; $55CA: $F0 $A8
    and  a                                        ; $55CC: $A7
    jr   z, jr_020_55F0                           ; $55CD: $28 $21

    ld   a, [wTransitionSequenceCounter]          ; $55CF: $FA $6B $C1
    cp   $03                                      ; $55D2: $FE $03
    jr   nz, jr_020_55F0                          ; $55D4: $20 $1A

    ld   a, [wC16C]                               ; $55D6: $FA $6C $C1
    and  $03                                      ; $55D9: $E6 $03
    cp   $03                                      ; $55DB: $FE $03
    jr   nz, jr_020_55F0                          ; $55DD: $20 $11

    ld   hl, hWindowYUnused                       ; $55DF: $21 $A9 $FF
    ld   a, [hl]                                  ; $55E2: $7E
    inc  hl                                       ; $55E3: $23
    or   [hl]                                     ; $55E4: $B6
    jr   z, jr_020_55F0                           ; $55E5: $28 $09

    ldh  a, [hFFA8]                               ; $55E7: $F0 $A8
    and  $FC                                      ; $55E9: $E6 $FC
    or   $01                                      ; $55EB: $F6 $01
    ldh  [hFFA8], a                               ; $55ED: $E0 $A8
    ret                                           ; $55EF: $C9

jr_020_55F0:
    ld   hl, wC16C                                ; $55F0: $21 $6C $C1
    inc  [hl]                                     ; $55F3: $34
    ld   a, [hl]                                  ; $55F4: $7E
    and  $03                                      ; $55F5: $E6 $03
    jr   nz, jr_020_562E                          ; $55F7: $20 $35

    ld   hl, wTransitionSequenceCounter           ; $55F9: $21 $6B $C1
    ld   a, [hl]                                  ; $55FC: $7E
    cp   $04                                      ; $55FD: $FE $04
    jr   z, jr_020_562E                           ; $55FF: $28 $2D

    inc  [hl]                                     ; $5601: $34
    xor  a                                        ; $5602: $AF
    ldh  [hScratch0], a                           ; $5603: $E0 $D7

jr_020_5605:
    ldh  a, [hScratch0]                           ; $5605: $F0 $D7
    cp   $03                                      ; $5607: $FE $03
    jr   z, jr_020_562E                           ; $5609: $28 $23

    ld   hl, wBGPalette                           ; $560B: $21 $97 $DB
    ld   e, a                                     ; $560E: $5F
    ld   d, $00                                   ; $560F: $16 $00
    add  hl, de                                   ; $5611: $19
    ld   a, [hl]                                  ; $5612: $7E
    ld   c, a                                     ; $5613: $4F
    ld   b, $00                                   ; $5614: $06 $00

jr_020_5616:
    ld   a, c                                     ; $5616: $79
    and  $03                                      ; $5617: $E6 $03
    jr   z, jr_020_561C                           ; $5619: $28 $01

    dec  c                                        ; $561B: $0D

jr_020_561C:
    rrc  c                                        ; $561C: $CB $09
    rrc  c                                        ; $561E: $CB $09
    inc  b                                        ; $5620: $04
    ld   a, b                                     ; $5621: $78
    cp   $04                                      ; $5622: $FE $04
    jr   nz, jr_020_5616                          ; $5624: $20 $F0

    ld   a, c                                     ; $5626: $79
    ld   [hl], a                                  ; $5627: $77
    ld   hl, hScratch0                            ; $5628: $21 $D7 $FF
    inc  [hl]                                     ; $562B: $34
    jr   jr_020_5605                              ; $562C: $18 $D7

jr_020_562E:
    ret                                           ; $562E: $C9

    nop                                           ; $562F: $00
    ld   bc, $0302                                ; $5630: $01 $02 $03
    nop                                           ; $5633: $00
    inc  bc                                       ; $5634: $03
    ld   bc, $0000                                ; $5635: $01 $00 $00
    ld   bc, $0302                                ; $5638: $01 $02 $03

Func_020_563B::
    ld   hl, wC16C                                ; $563B: $21 $6C $C1
    inc  [hl]                                     ; $563E: $34
    ld   a, [wC16C]                               ; $563F: $FA $6C $C1
    and  $03                                      ; $5642: $E6 $03
    jr   nz, jr_020_568A                          ; $5644: $20 $44

    ld   hl, wTransitionSequenceCounter           ; $5646: $21 $6B $C1

label_020_5649:
    ld   a, [hl]                                  ; $5649: $7E
    inc  [hl]                                     ; $564A: $34

Func_020_564B:
    cp   $04                                      ; $564B: $FE $04
    jr   z, jr_020_568A                           ; $564D: $28 $3B

    xor  a                                        ; $564F: $AF
    ldh  [hScratch0], a                           ; $5650: $E0 $D7

jr_020_5652:
    ldh  a, [hScratch0]                           ; $5652: $F0 $D7
    cp   $03                                      ; $5654: $FE $03
    jr   z, jr_020_568A                           ; $5656: $28 $32

    ld   hl, wBGPalette                           ; $5658: $21 $97 $DB
    ld   e, a                                     ; $565B: $5F
    ld   d, $00                                   ; $565C: $16 $00
    add  hl, de                                   ; $565E: $19
    ld   a, [hl]                                  ; $565F: $7E
    push hl                                       ; $5660: $E5
    ld   c, a                                     ; $5661: $4F
    ld   b, $00                                   ; $5662: $06 $00

jr_020_5664:
    ldh  a, [hScratch0]                           ; $5664: $F0 $D7
    sla  a                                        ; $5666: $CB $27
    sla  a                                        ; $5668: $CB $27
    or   b                                        ; $566A: $B0
    ld   e, a                                     ; $566B: $5F
    ld   hl, $562F                                ; $566C: $21 $2F $56
    add  hl, de                                   ; $566F: $19
    ld   a, c                                     ; $5670: $79
    and  $03                                      ; $5671: $E6 $03
    cp   [hl]                                     ; $5673: $BE
    jr   z, jr_020_5677                           ; $5674: $28 $01

    inc  c                                        ; $5676: $0C

jr_020_5677:
    rrc  c                                        ; $5677: $CB $09
    rrc  c                                        ; $5679: $CB $09
    inc  b                                        ; $567B: $04
    ld   a, b                                     ; $567C: $78
    cp   $04                                      ; $567D: $FE $04
    jr   nz, jr_020_5664                          ; $567F: $20 $E3

    ld   a, c                                     ; $5681: $79
    pop  hl                                       ; $5682: $E1
    ld   [hl], a                                  ; $5683: $77
    ld   hl, hScratch0                            ; $5684: $21 $D7 $FF
    inc  [hl]                                     ; $5687: $34
    jr   jr_020_5652                              ; $5688: $18 $C8

jr_020_568A:
    ret                                           ; $568A: $C9

    daa                                           ; $568B: $27
    ld   l, d                                     ; $568C: $6A
    ld   l, h                                     ; $568D: $6C
    ld   hl, $2322                                ; $568E: $21 $22 $23
    inc  h                                        ; $5691: $24
    dec  h                                        ; $5692: $25
    ld   h, $6A                                   ; $5693: $26 $6A
    rst  $38                                      ; $5695: $FF
    ld   l, h                                     ; $5696: $6C
    ld   l, d                                     ; $5697: $6A
    ld   l, h                                     ; $5698: $6C
    ld   l, d                                     ; $5699: $6A
    ld   l, h                                     ; $569A: $6C
    ld   h, l                                     ; $569B: $65
    ld   h, l                                     ; $569C: $65
    ld   h, [hl]                                  ; $569D: $66
    ld   sp, $3332                                ; $569E: $31 $32 $33
    inc  [hl]                                     ; $56A1: $34
    dec  [hl]                                     ; $56A2: $35
    ld   [hl], $67                                ; $56A3: $36 $67
    ld   l, b                                     ; $56A5: $68
    ld   h, h                                     ; $56A6: $64
    ld   h, a                                     ; $56A7: $67
    ld   l, c                                     ; $56A8: $69
    ld   h, l                                     ; $56A9: $65
    ld   h, [hl]                                  ; $56AA: $66
    ld   b, b                                     ; $56AB: $40
    ld   b, b                                     ; $56AC: $40
    ld   b, c                                     ; $56AD: $41
    ld   b, d                                     ; $56AE: $42
    ld   b, e                                     ; $56AF: $43
    ld   b, h                                     ; $56B0: $44
    ld   a, [$63FA]                               ; $56B1: $FA $FA $63
    ld   b, b                                     ; $56B4: $40
    ld   b, b                                     ; $56B5: $40
    ld   b, b                                     ; $56B6: $40
    ld   b, b                                     ; $56B7: $40
    ld   b, b                                     ; $56B8: $40
    ld   b, b                                     ; $56B9: $40
    ld   h, b                                     ; $56BA: $60
    rst  $38                                      ; $56BB: $FF
    ld   a, [$4948]                               ; $56BC: $FA $48 $49
    ld   c, d                                     ; $56BF: $4A
    ld_long a, $FFFA                              ; $56C0: $FA $FA $FF
    ld   h, d                                     ; $56C3: $62
    ld   l, l                                     ; $56C4: $6D
    ld   l, l                                     ; $56C5: $6D
    ld   l, l                                     ; $56C6: $6D
    ld   l, l                                     ; $56C7: $6D
    ld   l, l                                     ; $56C8: $6D
    ld   l, l                                     ; $56C9: $6D
    rst  $38                                      ; $56CA: $FF
    nop                                           ; $56CB: $00
    ld   bc, $0100                                ; $56CC: $01 $00 $01
    ld   a, [$5EFF]                               ; $56CF: $FA $FF $5E
    ld   e, a                                     ; $56D2: $5F
    inc  b                                        ; $56D3: $04
    dec  b                                        ; $56D4: $05
    ld   b, $07                                   ; $56D5: $06 $07
    jr   z, @+$2B                                 ; $56D7: $28 $29

    add  hl, hl                                   ; $56D9: $29
    ld   a, [hl+]                                 ; $56DA: $2A
    db   $10                                      ; $56DB: $10
    ld   de, $1110                                ; $56DC: $11 $10 $11
    ld   a, [$6EFA]                               ; $56DF: $FA $FA $6E
    ld   l, a                                     ; $56E2: $6F
    inc  d                                        ; $56E3: $14
    dec  d                                        ; $56E4: $15
    ld   d, $17                                   ; $56E5: $16 $17
    jr   c, jr_020_5709                           ; $56E7: $38 $20

    jr   nz, jr_020_5725                          ; $56E9: $20 $3A

    nop                                           ; $56EB: $00
    ld   bc, $0100                                ; $56EC: $01 $00 $01
    ei                                            ; $56EF: $FB
    rst  $38                                      ; $56F0: $FF
    cp   $FE                                      ; $56F1: $FE $FE
    ld   [$0A09], sp                              ; $56F3: $08 $09 $0A
    dec  bc                                       ; $56F6: $0B
    jr   c, jr_020_5719                           ; $56F7: $38 $20

    jr   nz, @+$3C                                ; $56F9: $20 $3A

    db   $10                                      ; $56FB: $10
    ld   de, $1110                                ; $56FC: $11 $10 $11
    ei                                            ; $56FF: $FB
    ei                                            ; $5700: $FB
    cp   $FE                                      ; $5701: $FE $FE
    jr   jr_020_571E                              ; $5703: $18 $19

    ld   a, [de]                                  ; $5705: $1A
    dec  de                                       ; $5706: $1B
    ld   c, b                                     ; $5707: $48
    ld   c, c                                     ; $5708: $49

jr_020_5709:
    ld   c, c                                     ; $5709: $49
    ld   c, d                                     ; $570A: $4A
    ei                                            ; $570B: $FB
    rst  $38                                      ; $570C: $FF
    inc  c                                        ; $570D: $0C
    dec  c                                        ; $570E: $0D
    ld   b, b                                     ; $570F: $40
    ld   b, b                                     ; $5710: $40
    ld   b, b                                     ; $5711: $40
    ld   b, b                                     ; $5712: $40
    ld_long a, $FFFA                              ; $5713: $FA $FA $FF
    ld   e, b                                     ; $5716: $58
    ld   c, $0F                                   ; $5717: $0E $0F

jr_020_5719:
    ld   a, [$FBFA]                               ; $5719: $FA $FA $FB
    ei                                            ; $571C: $FB
    inc  e                                        ; $571D: $1C

jr_020_571E:
    dec  e                                        ; $571E: $1D
    ld   a, [$FAFA]                               ; $571F: $FA $FA $FA
    ld   a, [$FAFA]                               ; $5722: $FA $FA $FA

jr_020_5725:
    ld   a, [$1E5D]                               ; $5725: $FA $5D $1E
    rra                                           ; $5728: $1F
    ld   a, [$0CFA]                               ; $5729: $FA $FA $0C
    dec  c                                        ; $572C: $0D
    inc  c                                        ; $572D: $0C
    dec  c                                        ; $572E: $0D
    ei                                            ; $572F: $FB
    ei                                            ; $5730: $FB
    jr   z, jr_020_575D                           ; $5731: $28 $2A

    ld   a, [$FAFA]                               ; $5733: $FA $FA $FA
    ld   e, b                                     ; $5736: $58
    dec  l                                        ; $5737: $2D
    ld   l, $2E                                   ; $5738: $2E $2E
    cpl                                           ; $573A: $2F
    inc  e                                        ; $573B: $1C
    dec  e                                        ; $573C: $1D
    inc  e                                        ; $573D: $1C
    dec  e                                        ; $573E: $1D
    ei                                            ; $573F: $FB
    ld   d, [hl]                                  ; $5740: $56
    ld   h, c                                     ; $5741: $61
    ld   c, d                                     ; $5742: $4A
    ld   a, [$59FA]                               ; $5743: $FA $FA $59
    ld   e, d                                     ; $5746: $5A
    dec  a                                        ; $5747: $3D
    ld   a, $3E                                   ; $5748: $3E $3E
    ccf                                           ; $574A: $3F
    db   $fd                                      ; $574B: $FD
    db   $fd                                      ; $574C: $FD
    db   $fd                                      ; $574D: $FD
    db   $fd                                      ; $574E: $FD
    ei                                            ; $574F: $FB
    ei                                            ; $5750: $FB
    ei                                            ; $5751: $FB
    ei                                            ; $5752: $FB
    jr   z, jr_020_577E                           ; $5753: $28 $29

    ld   e, e                                     ; $5755: $5B
    ld_long a, $FFFF                              ; $5756: $FA $FF $FF
    ld   d, h                                     ; $5759: $54
    ld   d, h                                     ; $575A: $54
    db   $fd                                      ; $575B: $FD
    db   $fd                                      ; $575C: $FD

jr_020_575D:
    db   $fd                                      ; $575D: $FD
    db   $fd                                      ; $575E: $FD
    ei                                            ; $575F: $FB
    ei                                            ; $5760: $FB
    rst  $38                                      ; $5761: $FF
    ei                                            ; $5762: $FB
    jr   c, jr_020_5795                           ; $5763: $38 $30

    ld   a, [hl-]                                 ; $5765: $3A
    ld_long a, $FFFF                              ; $5766: $FA $FF $FF
    ld   d, h                                     ; $5769: $54
    ld   d, h                                     ; $576A: $54
    db   $fd                                      ; $576B: $FD
    db   $fd                                      ; $576C: $FD
    db   $fd                                      ; $576D: $FD
    rst  $38                                      ; $576E: $FF
    db   $fd                                      ; $576F: $FD
    db   $fd                                      ; $5770: $FD
    ei                                            ; $5771: $FB
    ei                                            ; $5772: $FB
    ld   c, b                                     ; $5773: $48
    cp   $4A                                      ; $5774: $FE $4A
    ld   a, [$5756]                               ; $5776: $FA $56 $57
    ld   d, h                                     ; $5779: $54
    ld   d, h                                     ; $577A: $54
    inc  bc                                       ; $577B: $03
    ld   [de], a                                  ; $577C: $12
    inc  de                                       ; $577D: $13

jr_020_577E:
    ld   [de], a                                  ; $577E: $12
    inc  de                                       ; $577F: $13
    ld   [bc], a                                  ; $5780: $02
    rst  $38                                      ; $5781: $FF
    ei                                            ; $5782: $FB
    ld   e, h                                     ; $5783: $5C
    dec  hl                                       ; $5784: $2B
    ld   a, [$FAFA]                               ; $5785: $FA $FA $FA
    ld   a, [$5454]                               ; $5788: $FA $54 $54
    inc  bc                                       ; $578B: $03
    inc  bc                                       ; $578C: $03
    inc  bc                                       ; $578D: $03
    inc  bc                                       ; $578E: $03
    inc  bc                                       ; $578F: $03
    inc  bc                                       ; $5790: $03
    ld   [bc], a                                  ; $5791: $02
    inc  bc                                       ; $5792: $03
    inc  bc                                       ; $5793: $03
    inc  bc                                       ; $5794: $03

jr_020_5795:
    nop                                           ; $5795: $00
    inc  bc                                       ; $5796: $03
    inc  bc                                       ; $5797: $03
    inc  bc                                       ; $5798: $03
    inc  bc                                       ; $5799: $03
    inc  bc                                       ; $579A: $03
    inc  bc                                       ; $579B: $03
    inc  bc                                       ; $579C: $03
    inc  bc                                       ; $579D: $03
    inc  bc                                       ; $579E: $03
    inc  bc                                       ; $579F: $03
    inc  bc                                       ; $57A0: $03
    inc  bc                                       ; $57A1: $03
    inc  bc                                       ; $57A2: $03
    inc  bc                                       ; $57A3: $03
    inc  bc                                       ; $57A4: $03
    inc  bc                                       ; $57A5: $03
    inc  bc                                       ; $57A6: $03
    inc  bc                                       ; $57A7: $03
    inc  bc                                       ; $57A8: $03
    inc  bc                                       ; $57A9: $03
    inc  bc                                       ; $57AA: $03
    inc  bc                                       ; $57AB: $03
    inc  bc                                       ; $57AC: $03
    inc  b                                        ; $57AD: $04
    inc  b                                        ; $57AE: $04
    inc  b                                        ; $57AF: $04
    inc  b                                        ; $57B0: $04
    nop                                           ; $57B1: $00
    nop                                           ; $57B2: $00
    inc  b                                        ; $57B3: $04
    inc  bc                                       ; $57B4: $03
    inc  bc                                       ; $57B5: $03
    inc  bc                                       ; $57B6: $03
    inc  bc                                       ; $57B7: $03
    inc  bc                                       ; $57B8: $03
    inc  bc                                       ; $57B9: $03
    inc  bc                                       ; $57BA: $03
    ld   bc, $0400                                ; $57BB: $01 $00 $04
    inc  b                                        ; $57BE: $04
    inc  b                                        ; $57BF: $04
    inc  b                                        ; $57C0: $04
    nop                                           ; $57C1: $00
    ld   bc, $0404                                ; $57C2: $01 $04 $04
    inc  b                                        ; $57C5: $04
    inc  b                                        ; $57C6: $04
    inc  b                                        ; $57C7: $04
    inc  b                                        ; $57C8: $04
    inc  b                                        ; $57C9: $04
    ld   bc, $0000                                ; $57CA: $01 $00 $00
    nop                                           ; $57CD: $00
    nop                                           ; $57CE: $00
    nop                                           ; $57CF: $00
    ld   [bc], a                                  ; $57D0: $02
    ld   bc, $0401                                ; $57D1: $01 $01 $04
    inc  b                                        ; $57D4: $04
    inc  b                                        ; $57D5: $04
    inc  b                                        ; $57D6: $04
    inc  b                                        ; $57D7: $04
    inc  b                                        ; $57D8: $04
    inc  b                                        ; $57D9: $04
    inc  b                                        ; $57DA: $04
    nop                                           ; $57DB: $00
    nop                                           ; $57DC: $00
    nop                                           ; $57DD: $00
    nop                                           ; $57DE: $00
    nop                                           ; $57DF: $00
    nop                                           ; $57E0: $00
    ld   bc, $0401                                ; $57E1: $01 $01 $04
    ld   b, $04                                   ; $57E4: $06 $04
    inc  b                                        ; $57E6: $04
    inc  b                                        ; $57E7: $04
    rlca                                          ; $57E8: $07
    rlca                                          ; $57E9: $07
    inc  b                                        ; $57EA: $04
    nop                                           ; $57EB: $00
    nop                                           ; $57EC: $00
    nop                                           ; $57ED: $00
    nop                                           ; $57EE: $00
    nop                                           ; $57EF: $00
    ld   bc, $0101                                ; $57F0: $01 $01 $01
    inc  b                                        ; $57F3: $04
    ld   b, $04                                   ; $57F4: $06 $04
    inc  b                                        ; $57F6: $04
    inc  b                                        ; $57F7: $04
    rlca                                          ; $57F8: $07
    rlca                                          ; $57F9: $07
    inc  b                                        ; $57FA: $04
    nop                                           ; $57FB: $00
    nop                                           ; $57FC: $00
    nop                                           ; $57FD: $00
    nop                                           ; $57FE: $00
    nop                                           ; $57FF: $00

data_020_5800::
    nop                                           ; $5800: $00
    ld   bc, $0401                                ; $5801: $01 $01 $04
    inc  b                                        ; $5804: $04
    inc  b                                        ; $5805: $04
    inc  b                                        ; $5806: $04
    inc  b                                        ; $5807: $04
    inc  b                                        ; $5808: $04
    inc  b                                        ; $5809: $04
    inc  b                                        ; $580A: $04
    nop                                           ; $580B: $00
    ld   bc, $0202                                ; $580C: $01 $02 $02
    inc  bc                                       ; $580F: $03
    inc  bc                                       ; $5810: $03
    inc  bc                                       ; $5811: $03
    inc  bc                                       ; $5812: $03
    nop                                           ; $5813: $00
    nop                                           ; $5814: $00
    nop                                           ; $5815: $00
    inc  b                                        ; $5816: $04
    ld   [bc], a                                  ; $5817: $02
    rlca                                          ; $5818: $07
    nop                                           ; $5819: $00
    nop                                           ; $581A: $00
    nop                                           ; $581B: $00
    nop                                           ; $581C: $00
    ld   [bc], a                                  ; $581D: $02
    ld   [bc], a                                  ; $581E: $02
    nop                                           ; $581F: $00
    nop                                           ; $5820: $00
    nop                                           ; $5821: $00
    nop                                           ; $5822: $00
    nop                                           ; $5823: $00
    nop                                           ; $5824: $00
    nop                                           ; $5825: $00
    inc  b                                        ; $5826: $04
    rlca                                          ; $5827: $07
    rlca                                          ; $5828: $07
    nop                                           ; $5829: $00
    nop                                           ; $582A: $00
    rlca                                          ; $582B: $07
    rlca                                          ; $582C: $07
    ld   bc, $0001                                ; $582D: $01 $01 $00
    nop                                           ; $5830: $00
    inc  b                                        ; $5831: $04
    inc  b                                        ; $5832: $04
    nop                                           ; $5833: $00
    nop                                           ; $5834: $00
    nop                                           ; $5835: $00
    inc  b                                        ; $5836: $04
    dec  b                                        ; $5837: $05
    inc  bc                                       ; $5838: $03
    inc  bc                                       ; $5839: $03
    inc  bc                                       ; $583A: $03
    rlca                                          ; $583B: $07
    rlca                                          ; $583C: $07
    ld   bc, $0001                                ; $583D: $01 $01 $00
    inc  b                                        ; $5840: $04
    inc  b                                        ; $5841: $04
    inc  b                                        ; $5842: $04
    nop                                           ; $5843: $00
    nop                                           ; $5844: $00
    inc  b                                        ; $5845: $04
    inc  b                                        ; $5846: $04
    inc  bc                                       ; $5847: $03
    inc  bc                                       ; $5848: $03
    inc  bc                                       ; $5849: $03
    inc  bc                                       ; $584A: $03
    inc  bc                                       ; $584B: $03
    inc  bc                                       ; $584C: $03
    inc  bc                                       ; $584D: $03
    inc  bc                                       ; $584E: $03
    nop                                           ; $584F: $00
    nop                                           ; $5850: $00
    nop                                           ; $5851: $00
    nop                                           ; $5852: $00
    inc  b                                        ; $5853: $04
    inc  b                                        ; $5854: $04
    inc  b                                        ; $5855: $04
    nop                                           ; $5856: $00
    rlca                                          ; $5857: $07
    ld   bc, $0303                                ; $5858: $01 $03 $03
    inc  bc                                       ; $585B: $03
    inc  bc                                       ; $585C: $03
    inc  bc                                       ; $585D: $03
    inc  bc                                       ; $585E: $03
    nop                                           ; $585F: $00
    nop                                           ; $5860: $00
    ld   [bc], a                                  ; $5861: $02
    nop                                           ; $5862: $00
    inc  b                                        ; $5863: $04
    inc  b                                        ; $5864: $04
    inc  b                                        ; $5865: $04
    nop                                           ; $5866: $00
    nop                                           ; $5867: $00
    ld   [bc], a                                  ; $5868: $02
    inc  bc                                       ; $5869: $03
    inc  bc                                       ; $586A: $03
    inc  bc                                       ; $586B: $03
    inc  bc                                       ; $586C: $03
    inc  bc                                       ; $586D: $03
    rlca                                          ; $586E: $07
    inc  bc                                       ; $586F: $03
    inc  bc                                       ; $5870: $03
    nop                                           ; $5871: $00
    nop                                           ; $5872: $00
    inc  b                                        ; $5873: $04
    inc  b                                        ; $5874: $04
    inc  b                                        ; $5875: $04
    nop                                           ; $5876: $00
    inc  b                                        ; $5877: $04
    inc  b                                        ; $5878: $04
    inc  bc                                       ; $5879: $03
    inc  bc                                       ; $587A: $03
    inc  b                                        ; $587B: $04
    inc  b                                        ; $587C: $04
    inc  b                                        ; $587D: $04
    inc  b                                        ; $587E: $04
    inc  b                                        ; $587F: $04
    inc  b                                        ; $5880: $04
    rlca                                          ; $5881: $07
    nop                                           ; $5882: $00
    inc  b                                        ; $5883: $04
    inc  b                                        ; $5884: $04
    nop                                           ; $5885: $00
    nop                                           ; $5886: $00
    nop                                           ; $5887: $00
    nop                                           ; $5888: $00
    inc  bc                                       ; $5889: $03
    inc  bc                                       ; $588A: $03

LoadTilemap0E::
    ld   a, $8B                                   ; $588B: $3E $8B
    ldh  [hBGMapOffsetLow], a                     ; $588D: $E0 $E1
    ld   a, $56                                   ; $588F: $3E $56
    ldh  [$FFE2], a                               ; $5891: $E0 $E2
    xor  a                                        ; $5893: $AF
    ldh  [$FFE3], a                               ; $5894: $E0 $E3
    call Func_020_58AD                            ; $5896: $CD $AD $58
    ldh  a, [hIsGBC]                              ; $5899: $F0 $FE
    and  a                                        ; $589B: $A7
    ret  z                                        ; $589C: $C8

    ld   a, $8B                                   ; $589D: $3E $8B
    ldh  [hBGMapOffsetLow], a                     ; $589F: $E0 $E1
    ld   a, $57                                   ; $58A1: $3E $57
    ldh  [$FFE2], a                               ; $58A3: $E0 $E2
    ld   hl, $FFE3                                ; $58A5: $21 $E3 $FF
    inc  [hl]                                     ; $58A8: $34
    call Func_020_58AD                            ; $58A9: $CD $AD $58
    ret                                           ; $58AC: $C9

Func_020_58AD:
    ld   de, $9822                                ; $58AD: $11 $22 $98
    ld   bc, $0000                                ; $58B0: $01 $00 $00

jr_020_58B3:
    ld   a, [$C5A2]                               ; $58B3: $FA $A2 $C5
    and  a                                        ; $58B6: $A7
    jr   nz, jr_020_58CB                          ; $58B7: $20 $12

    ld   a, [wGameplayType]                       ; $58B9: $FA $95 $DB
    cp   $01                                      ; $58BC: $FE $01
    jr   z, jr_020_58CB                           ; $58BE: $28 $0B

    ld   hl, wOverworldRoomStatus                 ; $58C0: $21 $00 $D8
    add  hl, bc                                   ; $58C3: $09
    ld   a, [hl]                                  ; $58C4: $7E
    and  $80                                      ; $58C5: $E6 $80
    ld   a, $2C                                   ; $58C7: $3E $2C
    jr   z, jr_020_58D3                           ; $58C9: $28 $08

jr_020_58CB:
    ldh  a, [hBGMapOffsetLow]                     ; $58CB: $F0 $E1
    ld   l, a                                     ; $58CD: $6F
    ldh  a, [$FFE2]                               ; $58CE: $F0 $E2
    ld   h, a                                     ; $58D0: $67
    add  hl, bc                                   ; $58D1: $09
    ld   a, [hl]                                  ; $58D2: $7E

jr_020_58D3:
    ld   h, a                                     ; $58D3: $67
    ldh  a, [$FFE3]                               ; $58D4: $F0 $E3
    and  a                                        ; $58D6: $A7
    jr   z, jr_020_58EA                           ; $58D7: $28 $11

    ld   a, $01                                   ; $58D9: $3E $01
    ld   [rVBK], a                                ; $58DB: $E0 $4F
    ld   a, h                                     ; $58DD: $7C
    cp   $2C                                      ; $58DE: $FE $2C
    jr   nz, jr_020_58E4                          ; $58E0: $20 $02

    ld   a, $01                                   ; $58E2: $3E $01

jr_020_58E4:
    ld   [de], a                                  ; $58E4: $12
    xor  a                                        ; $58E5: $AF
    ld   [rVBK], a                                ; $58E6: $E0 $4F
    jr   jr_020_58EC                              ; $58E8: $18 $02

jr_020_58EA:
    ld   a, h                                     ; $58EA: $7C
    ld   [de], a                                  ; $58EB: $12

jr_020_58EC:
    inc  c                                        ; $58EC: $0C
    jr   z, jr_020_5903                           ; $58ED: $28 $14

    inc  e                                        ; $58EF: $1C
    ld   a, e                                     ; $58F0: $7B
    and  $1F                                      ; $58F1: $E6 $1F
    cp   $12                                      ; $58F3: $FE $12
    jr   nz, jr_020_5901                          ; $58F5: $20 $0A

    ld   a, e                                     ; $58F7: $7B
    and  $E0                                      ; $58F8: $E6 $E0
    add  $22                                      ; $58FA: $C6 $22
    ld   e, a                                     ; $58FC: $5F
    ld   a, d                                     ; $58FD: $7A
    adc  $00                                      ; $58FE: $CE $00
    ld   d, a                                     ; $5900: $57

jr_020_5901:
    jr   jr_020_58B3                              ; $5901: $18 $B0

jr_020_5903:
    ret                                           ; $5903: $C9

InventoryEntryPoint::
    ld   a, [wGameplaySubtype]                    ; $5904: $FA $96 $DB
    rst  $00                                      ; $5907: $C7
    ld   [hl+], a                                 ; $5908: $22
    ld   e, c                                     ; $5909: $59
    ld   b, e                                     ; $590A: $43
    ld   e, c                                     ; $590B: $59
    ret  nc                                       ; $590C: $D0

    ld   e, c                                     ; $590D: $59
    db   $fd                                      ; $590E: $FD
    ld   e, d                                     ; $590F: $5A
    dec  h                                        ; $5910: $25
    ld   e, l                                     ; $5911: $5D
    ld   d, d                                     ; $5912: $52
    ld   e, l                                     ; $5913: $5D
    ld   a, [de]                                  ; $5914: $1A
    ld   e, [hl]                                  ; $5915: $5E
    rst  $28                                      ; $5916: $EF
    ld   e, [hl]                                  ; $5917: $5E
    call nz, $8363                                ; $5918: $C4 $63 $83
    ld   h, l                                     ; $591B: $65
    xor  b                                        ; $591C: $A8
    ld   h, l                                     ; $591D: $65
    cp   b                                        ; $591E: $B8
    ld   h, l                                     ; $591F: $65
    jp   nc, $F065                                ; $5920: $D2 $65 $F0

    cp   $A7                                      ; $5923: $FE $A7
    jr   z, jr_020_5940                           ; $5925: $28 $19

    ld   hl, $DC10                                ; $5927: $21 $10 $DC
    ld   c, $80                                   ; $592A: $0E $80
    di                                            ; $592C: $F3

jr_020_592D:
    xor  a                                        ; $592D: $AF
    ld   [rSVBK], a                               ; $592E: $E0 $70
    ld   b, [hl]                                  ; $5930: $46
    ld   a, $03                                   ; $5931: $3E $03
    ld   [rSVBK], a                               ; $5933: $E0 $70
    ld   [hl], b                                  ; $5935: $70
    inc  hl                                       ; $5936: $23
    dec  c                                        ; $5937: $0D
    ld   a, c                                     ; $5938: $79
    and  a                                        ; $5939: $A7
    jr   nz, jr_020_592D                          ; $593A: $20 $F1

    xor  a                                        ; $593C: $AF
    ld   [rSVBK], a                               ; $593D: $E0 $70
    ei                                            ; $593F: $FB

jr_020_5940:
    call Func_020_6683                            ; $5940: $CD $83 $66
    call label_1A22                               ; $5943: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $5946: $FA $6B $C1
    cp   $04                                      ; $5949: $FE $04
    ; Returns back to render palettes if transition isn't finished
    jr   nz, .return                               ; $594B: $20 $1C

    xor  a                                        ; $594D: $AF
    ld   [wInventoryAppearing], a                 ; $594E: $EA $4F $C1
    ld   a, $03                                   ; $5951: $3E $03
    ldh  [hWindowYUnused], a                      ; $5953: $E0 $A9
    ld   a, $30                                   ; $5955: $3E $30
    ldh  [hWindowXUnused], a                      ; $5957: $E0 $AA
    xor  a                                        ; $5959: $AF
    ld   [$DE06], a                               ; $595A: $EA $06 $DE
    ld   [$DE07], a                               ; $595D: $EA $07 $DE
    ld   [$DE08], a                               ; $5960: $EA $08 $DE
    ld   [$DE09], a                               ; $5963: $EA $09 $DE
    call Func_020_6683                            ; $5966: $CD $83 $66

.return
    ; Returns to 0346 (Render Palettes)
    ret                                           ; $5969: $C9

; Palette Data ?
data_020_596A::
    db $9C, $AA, $81, $06, $06, $9C, $AC, $81
    db $06, $06, $9C, $AE, $81, $06, $06, $9C
    db $B0, $81, $06, $06, $9C, $B2, $81, $06
    db $06, $9C, $71, $81, $03, $03, $00, $9C
    db $AC, $81, $04, $04, $9C, $AE, $81, $03
    db $03, $00

; Sprite Data ?
; Start of data copied for inventory display
data_020_5994::
    db $9C, $6A, $83, $94, $95, $C0, $C1, $9C
    db $6C, $83, $A0, $A1, $C2, $C3, $9C, $6E
    db $83, $9A, $9B, $C4, $C5, $9C, $6F, $81
    db $9C, $9D, $9C, $B0, $81, $C6, $C7, $9C
    db $71, $81, $9E, $9F, $9C, $B2, $81, $CA
    db $CB, $9C, $92, $01, $7F, $7F, $9C, $D3
    db $00, $7F, $00

; Location for overwriting each inventory sprite
data_020_59C7::
    db $03, $0A, $11, $22, $05, $0C, $13, $1D, $27

; Start building display of inventory
; Called from jp hl in 00:28CE (TABLEJUMP)
; Copies 51 bytes from data_020_5994 (above) to wRequestDestination (D601)                                          ; $59CF: $27
    ld   hl, wRequestDestinationHigh              ; $59D0: $21 $01 $D6
    ld   bc, data_020_5994                        ; $59D3: $01 $94 $59
    ld   e, $33                                   ; $59D6: $1E $33

jr_020_59D8:
    ld   a, [bc]                                  ; $59D8: $0A
    inc  bc                                       ; $59D9: $03
    ld   [hl+], a                                 ; $59DA: $22
    dec  e                                        ; $59DB: $1D
    jr   nz, jr_020_59D8                          ; $59DC: $20 $FA

    ldh  a, [hIsGBC]                              ; $59DE: $F0 $FE
    and  a                                        ; $59E0: $A7
    jr   z, inventoryDisplayEntryPoint            ; $59E1: $28 $40

; GBC Exclusive code
; Load 32 bytes from 596A into DC91
    ld   hl, $DC91                                ; $59E3: $21 $91 $DC
    ld   bc, data_020_596A                        ; $59E6: $01 $6A $59
    ld   e, $1F                                   ; $59E9: $1E $1F

jr_020_59EB:
    ld   a, [bc]                                  ; $59EB: $0A
    inc  bc                                       ; $59EC: $03
    ld   [hl+], a                                 ; $59ED: $22
    dec  e                                        ; $59EE: $1D
    jr   nz, jr_020_59EB                          ; $59EF: $20 $FA

    ld   a, $1E                                   ; $59F1: $3E $1E
    ld   [$DC90], a                               ; $59F3: $EA $90 $DC

    ; If on the overworld…
    ld   a, [wIsIndoor]                           ; $59F6: $FA $A5 $DB
    and  a                                        ; $59F9: $A7
    ; start building the inventory
    jr   z, inventoryDisplayEntryPoint            ; $59FA: $28 $27

    ;
    ; Dungeon inventory
    ;

; If inside Color Dungeon…
    ldh  a, [hMapId]                              ; $59FC: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $59FE: $FE $FF
    jr   z, .colorDungeonEnd                      ; $5A00: $28 $04

    ; Jump ahead if map is greater than MAP_CAVE_B
    cp   MAP_CAVE_B                               ; $5A02: $FE $0A
    jr   nc, inventoryDisplayEntryPoint           ; $5A04: $30 $1D
.colorDungeonEnd

; Set BC and E to point to the end of the "Palette Data?" (12 bytes) above
    ld   hl, $DC91                                ; $5A06: $21 $91 $DC
    ld   a, [$DC90]                               ; $5A09: $FA $90 $DC
    ld   c, a                                     ; $5A0C: $4F
    ld   b, $00                                   ; $5A0D: $06 $00
    add  hl, bc                                   ; $5A0F: $09
    ld   bc, $5989                                ; $5A10: $01 $89 $59
    ld   e, $0B                                   ; $5A13: $1E $0B

; Copy the remaining palette data
jr_020_5A15:
    ld   a, [bc]                                  ; $5A15: $0A
    inc  bc                                       ; $5A16: $03
    ld   [hl+], a                                 ; $5A17: $22
    dec  e                                        ; $5A18: $1D
    jr   nz, jr_020_5A15                          ; $5A19: $20 $FA

    ld   a, [$DC90]                               ; $5A1B: $FA $90 $DC
    add  $0A                                      ; $5A1E: $C6 $0A
    ld   [$DC90], a                               ; $5A20: $EA $90 $DC

; Palette loading complete, start building inventory
inventoryDisplayEntryPoint:
    ld   de, wHasFlippers                         ; $5A23: $11 $0C $DB
    ld   bc, $0000                                ; $5A26: $01 $00 $00

inventoryDisplayLoop:
    ; c is the counted
    ld   a, c                                     ; $5A29: $79
    cp   $02                                      ; $5A2A: $FE $02
    jr   nz, .tradeSequenceItemEnd                ; $5A2C: $20 $06

    ; Only executed for Trade Sequence items
    ld   a, [$DB7F]                               ; $5A2E: $FA $7F $DB
    and  a                                        ; $5A31: $A7
    jr   nz, overwriteInventoryDisplaySprite      ; $5A32: $20 $23
.tradeSequenceItemEnd

    ld   a, c                                     ; $5A34: $79
    cp   $04                                      ; $5A35: $FE $04
    jr   nz, jr_020_5A4F                          ; $5A37: $20 $16

    ; Only executed for dungeon keys
    ld   de, wHasTailKey                          ; $5A39: $11 $11 $DB
    ld   a, [wIsIndoor]                           ; $5A3C: $FA $A5 $DB
    and  a                                        ; $5A3F: $A7
    jr   z, jr_020_5A4F                           ; $5A40: $28 $0D

    ldh  a, [hMapId]                              ; $5A42: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5A44: $FE $FF
    jr   z, jr_020_5A4C                           ; $5A46: $28 $04

    cp   $0A                                      ; $5A48: $FE $0A
    jr   nc, jr_020_5A4F                          ; $5A4A: $30 $03

jr_020_5A4C:
    ld   de, wHasDungeonMap                       ; $5A4C: $11 $CC $DB

jr_020_5A4F:
    ; Load current inventory display item memory
    ld   a, [de]                                  ; $5A4F: $1A
    cp   $FF                                      ; $5A50: $FE $FF
    jr   z, overwriteInventoryDisplaySprite       ; $5A52: $28 $03

    and  a                                        ; $5A54: $A7
    jr   nz, incrementInventoryDisplay            ; $5A55: $20 $1E

overwriteInventoryDisplaySprite:
    ; Push current inventory item to the stack
    push de                                       ; $5A57: $D5

    ld   hl, data_020_59C7                        ; $5A58: $21 $C7 $59
    add  hl, bc                                   ; $5A5B: $09
    ld   e, [hl]                                  ; $5A5C: $5E
    ld   d, $00                                   ; $5A5D: $16 $00
    ld   hl, wRequestDestinationHigh              ; $5A5F: $21 $01 $D6
    add  hl, de                                   ; $5A62: $19

    ; Write $7F over sprite data (won't display)
    ld   a, $7F                                   ; $5A63: $3E $7F
    ld   [hl+], a                                 ; $5A65: $22
    ld   [hl+], a                                 ; $5A66: $22

    ; Only executed for Trade Sequence items
    ld   a, c                                     ; $5A67: $79
    cp   $02                                      ; $5A68: $FE $02
    jr   nz, .tradeSequenceItem2End                ; $5A6A: $20 $08

    ld   de, $0005                                ; $5A6C: $11 $05 $00
    add  hl, de                                   ; $5A6F: $19
    ld   a, $7F                                   ; $5A70: $3E $7F
    ld   [hl+], a                                 ; $5A72: $22
    ld   [hl], a                                  ; $5A73: $77
.tradeSequenceItem2End

    ; Reload inventory item to de
    pop  de                                       ; $5A74: $D1

; Increment inventory memory pointer to display next item
incrementInventoryDisplay:
    inc  de                                       ; $5A75: $13
    inc  c                                        ; $5A76: $0C

    ; Loop until all 8 items are handled
    ld   a, c                                     ; $5A77: $79
    cp   $09                                      ; $5A78: $FE $09
    jr   nz, inventoryDisplayLoop                 ; $5A7A: $20 $AD


    ld   hl, wRequestDestinationHigh              ; $5A7C: $21 $01 $D6
    ld   de, $002C                                ; $5A7F: $11 $2C $00
    add  hl, de                                   ; $5A82: $19
    ld   a, [wSeashellsCount]                     ; $5A83: $FA $0F $DB
    and  a                                        ; $5A86: $A7
    jr   z, jr_020_5A97                           ; $5A87: $28 $0E

    ; Offset seashell count sprites to reflect seashell count in inventory
    ld   e, a                                     ; $5A89: $5F
    swap a                                        ; $5A8A: $CB $37
    and  $0F                                      ; $5A8C: $E6 $0F
    add  $B0                                      ; $5A8E: $C6 $B0
    ld   [hl+], a                                 ; $5A90: $22
    ld   a, e                                     ; $5A91: $7B
    and  $0F                                      ; $5A92: $E6 $0F
    add  $B0                                      ; $5A94: $C6 $B0
    ld   [hl+], a                                 ; $5A96: $22

jr_020_5A97:
    ld   hl, wRequestDestinationHigh              ; $5A97: $21 $01 $D6
    ld   de, $0031                                ; $5A9A: $11 $31 $00
    add  hl, de                                   ; $5A9D: $19
    ld   a, [wIsIndoor]                           ; $5A9E: $FA $A5 $DB
    and  a                                        ; $5AA1: $A7
    jr   z, jr_020_5AD1                           ; $5AA2: $28 $2D

    ldh  a, [hMapId]                              ; $5AA4: $F0 $F7
    cp   $FF                                      ; $5AA6: $FE $FF
    jr   z, jr_020_5AAE                           ; $5AA8: $28 $04

    cp   $0A                                      ; $5AAA: $FE $0A
    jr   nc, jr_020_5AD1                          ; $5AAC: $30 $23

jr_020_5AAE:
    ld   a, [wSmallKeysCount]                               ; $5AAE: $FA $D0 $DB
    and  a                                        ; $5AB1: $A7
    jr   z, jr_020_5ADE                           ; $5AB2: $28 $2A

    push af                                       ; $5AB4: $F5
    push hl                                       ; $5AB5: $E5
    ld   b, $00                                   ; $5AB6: $06 $00
    ld   a, [$DC90]                               ; $5AB8: $FA $90 $DC
    ld   c, a                                     ; $5ABB: $4F
    ld   hl, $DC91                                ; $5ABC: $21 $91 $DC
    add  hl, bc                                   ; $5ABF: $09
    ld   a, l                                     ; $5AC0: $7D
    sub  $11                                      ; $5AC1: $D6 $11
    ld   l, a                                     ; $5AC3: $6F
    ld   a, h                                     ; $5AC4: $7C
    sbc  $00                                      ; $5AC5: $DE $00
    ld   h, a                                     ; $5AC7: $67
    ld   [hl], $01                                ; $5AC8: $36 $01
    inc  hl                                       ; $5ACA: $23
    ld   [hl], $01                                ; $5ACB: $36 $01
    pop  hl                                       ; $5ACD: $E1
    pop  af                                       ; $5ACE: $F1
    jr   jr_020_5ADB                              ; $5ACF: $18 $0A

jr_020_5AD1:
    ld   a, [wGoldenLeavesCount]                  ; $5AD1: $FA $15 $DB
    and  a                                        ; $5AD4: $A7
    jr   z, jr_020_5ADE                           ; $5AD5: $28 $07

    cp   $06                                      ; $5AD7: $FE $06
    jr   nc, jr_020_5ADE                          ; $5AD9: $30 $03

jr_020_5ADB:
    add  $B0                                      ; $5ADB: $C6 $B0
    ld   [hl], a                                  ; $5ADD: $77

jr_020_5ADE:
    ld   a, $32                                   ; $5ADE: $3E $32
    ld   [wRequests], a                           ; $5AE0: $EA $00 $D6
    ld   a, $03                                   ; $5AE3: $3E $03
    ldh  [hWindowYUnused], a                      ; $5AE5: $E0 $A9
    ld   a, $30                                   ; $5AE7: $3E $30
    ldh  [hWindowXUnused], a                      ; $5AE9: $E0 $AA
    jp   label_020_5D34                           ; $5AEB: $C3 $34 $5D

    nop                                           ; $5AEE: $00
    dec  b                                        ; $5AEF: $05
    ld   [bc], a                                  ; $5AF0: $02
    dec  b                                        ; $5AF1: $05
    dec  b                                        ; $5AF2: $05
    ld   b, $06                                   ; $5AF3: $06 $06
    dec  b                                        ; $5AF5: $05
    dec  b                                        ; $5AF6: $05
    dec  b                                        ; $5AF7: $05
    ld   b, $01                                   ; $5AF8: $06 $01
    ld   [bc], a                                  ; $5AFA: $02
    ld   [bc], a                                  ; $5AFB: $02
    dec  b                                        ; $5AFC: $05
    ldh  a, [hIsGBC]                              ; $5AFD: $F0 $FE
    and  a                                        ; $5AFF: $A7
    jr   z, jr_020_5B3D                           ; $5B00: $28 $3B

    ld   b, $00                                   ; $5B02: $06 $00
    ld   a, [wTradeSequenceItem]                  ; $5B04: $FA $0E $DB
    ld   c, a                                     ; $5B07: $4F
    ld   hl, $5AEE                                ; $5B08: $21 $EE $5A
    add  hl, bc                                   ; $5B0B: $09
    ld   a, [hl]                                  ; $5B0C: $7E
    ldh  [hScratch0], a                           ; $5B0D: $E0 $D7
    ld   a, $9C                                   ; $5B0F: $3E $9C
    ld   [$DC91], a                               ; $5B11: $EA $91 $DC
    ld   [$DC95], a                               ; $5B14: $EA $95 $DC
    ld   a, $6E                                   ; $5B17: $3E $6E
    ld   [$DC92], a                               ; $5B19: $EA $92 $DC
    ld   a, $8E                                   ; $5B1C: $3E $8E
    ld   [$DC96], a                               ; $5B1E: $EA $96 $DC
    ld   a, $41                                   ; $5B21: $3E $41
    ld   [$DC93], a                               ; $5B23: $EA $93 $DC
    ld   [$DC97], a                               ; $5B26: $EA $97 $DC
    ldh  a, [hScratch0]                           ; $5B29: $F0 $D7
    ld   [$DC94], a                               ; $5B2B: $EA $94 $DC
    ld   [$DC98], a                               ; $5B2E: $EA $98 $DC
    xor  a                                        ; $5B31: $AF
    ld   [$DC99], a                               ; $5B32: $EA $99 $DC
    ld   a, [$DC90]                               ; $5B35: $FA $90 $DC
    add  $08                                      ; $5B38: $C6 $08
    ld   [$DC90], a                               ; $5B3A: $EA $90 $DC

jr_020_5B3D:
    ld   a, $03                                   ; $5B3D: $3E $03
    ldh  [hWindowYUnused], a                      ; $5B3F: $E0 $A9
    ld   a, $30                                   ; $5B41: $3E $30
    ldh  [hWindowXUnused], a                      ; $5B43: $E0 $AA
    call Func_020_6683                            ; $5B45: $CD $83 $66
    ret                                           ; $5B48: $C9

Func_020_5B49:
    ldh  a, [hScratch1]                           ; $5B49: $F0 $D8
    cp   $09                                      ; $5B4B: $FE $09
    jr   z, jr_020_5B8B                           ; $5B4D: $28 $3C

    cp   $0C                                      ; $5B4F: $FE $0C
    jr   z, jr_020_5B80                           ; $5B51: $28 $2D

    dec  a                                        ; $5B53: $3D
    jr   z, jr_020_5B73                           ; $5B54: $28 $1D

    dec  a                                        ; $5B56: $3D
    jr   z, jr_020_5BA5                           ; $5B57: $28 $4C

    dec  a                                        ; $5B59: $3D
    jr   z, jr_020_5B69                           ; $5B5A: $28 $0D

    dec  a                                        ; $5B5C: $3D
    jr   z, jr_020_5B6E                           ; $5B5D: $28 $0F

    dec  a                                        ; $5B5F: $3D
    jr   z, jr_020_5BA0                           ; $5B60: $28 $3E

label_020_5B62:
jr_020_5B62:
    ld   a, [de]                                  ; $5B62: $1A
    inc  de                                       ; $5B63: $13
    ld   [hl+], a                                 ; $5B64: $22
    ld   a, [de]                                  ; $5B65: $1A
    inc  de                                       ; $5B66: $13
    ld   [hl+], a                                 ; $5B67: $22
    ret                                           ; $5B68: $C9

jr_020_5B69:
    ld   a, [wPowerBraceletLevel]                 ; $5B69: $FA $43 $DB
    jr   jr_020_5B76                              ; $5B6C: $18 $08

jr_020_5B6E:
    ld   a, [wShieldLevel]                        ; $5B6E: $FA $44 $DB
    jr   jr_020_5B76                              ; $5B71: $18 $03

jr_020_5B73:
    ld   a, [wSwordLevel]                         ; $5B73: $FA $4E $DB

jr_020_5B76:
    add  $B0                                      ; $5B76: $C6 $B0
    ld   c, a                                     ; $5B78: $4F
    ld   a, [de]                                  ; $5B79: $1A
    inc  de                                       ; $5B7A: $13
    ld   [hl+], a                                 ; $5B7B: $22
    ld   a, c                                     ; $5B7C: $79
    inc  de                                       ; $5B7D: $13
    ld   [hl+], a                                 ; $5B7E: $22
    ret                                           ; $5B7F: $C9

jr_020_5B80:
    ld   a, [wHasToadstool]                       ; $5B80: $FA $4B $DB
    and  a                                        ; $5B83: $A7
    jr   nz, jr_020_5B62                          ; $5B84: $20 $DC

    ld   a, [wMagicPowderCount]                   ; $5B86: $FA $4C $DB
    jr   jr_020_5BA8                              ; $5B89: $18 $1D

jr_020_5B8B:
    ld   a, [wOcarinaSongFlags]                  ; $5B8B: $FA $49 $DB
    and  a                                        ; $5B8E: $A7
    jp   z, label_020_5B62                        ; $5B8F: $CA $62 $5B

    ld   a, [$DB4A]                               ; $5B92: $FA $4A $DB
    inc  a                                        ; $5B95: $3C
    swap a                                        ; $5B96: $CB $37
    call Func_020_5BA8                            ; $5B98: $CD $A8 $5B
    dec  hl                                       ; $5B9B: $2B
    ld   [hl], $7F                                ; $5B9C: $36 $7F
    inc  hl                                       ; $5B9E: $23
    ret                                           ; $5B9F: $C9

jr_020_5BA0:
    ld   a, [wArrowCount]                         ; $5BA0: $FA $45 $DB
    jr   jr_020_5BA8                              ; $5BA3: $18 $03

jr_020_5BA5:
    ld   a, [wBombCount]                          ; $5BA5: $FA $4D $DB

Func_020_5BA8:
jr_020_5BA8:
    push af                                       ; $5BA8: $F5
    and  $0F                                      ; $5BA9: $E6 $0F
    add  $B0                                      ; $5BAB: $C6 $B0
    ld   c, a                                     ; $5BAD: $4F
    pop  af                                       ; $5BAE: $F1
    swap a                                        ; $5BAF: $CB $37
    and  $0F                                      ; $5BB1: $E6 $0F
    add  $B0                                      ; $5BB3: $C6 $B0
    ld   [hl+], a                                 ; $5BB5: $22
    ld   a, c                                     ; $5BB6: $79
    ld   [hl+], a                                 ; $5BB7: $22
    ret                                           ; $5BB8: $C9

Func_020_5BB9:
    push bc                                       ; $5BB9: $C5
    ld   a, [$DC90]                               ; $5BBA: $FA $90 $DC
    ld   e, a                                     ; $5BBD: $5F
    ld   d, $00                                   ; $5BBE: $16 $00
    ld   hl, $DC91                                ; $5BC0: $21 $91 $DC
    add  hl, de                                   ; $5BC3: $19
    add  $05                                      ; $5BC4: $C6 $05
    ld   [$DC90], a                               ; $5BC6: $EA $90 $DC
    push hl                                       ; $5BC9: $E5
    sla  c                                        ; $5BCA: $CB $21
    ld   hl, $5C84                                ; $5BCC: $21 $84 $5C
    add  hl, bc                                   ; $5BCF: $09
    push hl                                       ; $5BD0: $E5
    pop  de                                       ; $5BD1: $D1
    pop  hl                                       ; $5BD2: $E1
    ld   a, [de]                                  ; $5BD3: $1A
    inc  de                                       ; $5BD4: $13
    ld   [hl+], a                                 ; $5BD5: $22
    ld   a, [de]                                  ; $5BD6: $1A
    ld   [hl+], a                                 ; $5BD7: $22
    ld   a, $81                                   ; $5BD8: $3E $81
    ld   [hl+], a                                 ; $5BDA: $22
    push hl                                       ; $5BDB: $E5
    ldh  a, [hScratch1]                           ; $5BDC: $F0 $D8
    sla  a                                        ; $5BDE: $CB $27
    ld   c, a                                     ; $5BE0: $4F
    ld   hl, $5C14                                ; $5BE1: $21 $14 $5C
    add  hl, bc                                   ; $5BE4: $09
    push hl                                       ; $5BE5: $E5
    pop  de                                       ; $5BE6: $D1
    pop  hl                                       ; $5BE7: $E1
    cp   $06                                      ; $5BE8: $FE $06
    jr   nz, jr_020_5BF9                          ; $5BEA: $20 $0D

    ld   a, [wPowerBraceletLevel]                 ; $5BEC: $FA $43 $DB
    cp   $02                                      ; $5BEF: $FE $02
    jr   nz, jr_020_5BF9                          ; $5BF1: $20 $06

    ld   a, $02                                   ; $5BF3: $3E $02
    ld   [hl+], a                                 ; $5BF5: $22
    ld   [hl+], a                                 ; $5BF6: $22
    jr   jr_020_5C10                              ; $5BF7: $18 $17

jr_020_5BF9:
    cp   $18                                      ; $5BF9: $FE $18
    jr   nz, jr_020_5C0B                          ; $5BFB: $20 $0E

    ld   a, [wHasToadstool]                       ; $5BFD: $FA $4B $DB
    and  a                                        ; $5C00: $A7
    jr   z, jr_020_5C0B                           ; $5C01: $28 $08

    ld   a, $02                                   ; $5C03: $3E $02
    ld   [hl+], a                                 ; $5C05: $22
    ld   a, $03                                   ; $5C06: $3E $03
    ld   [hl+], a                                 ; $5C08: $22
    jr   jr_020_5C10                              ; $5C09: $18 $05

jr_020_5C0B:
    ld   a, [de]                                  ; $5C0B: $1A
    inc  de                                       ; $5C0C: $13
    ld   [hl+], a                                 ; $5C0D: $22
    ld   a, [de]                                  ; $5C0E: $1A
    ld   [hl+], a                                 ; $5C0F: $22

jr_020_5C10:
    xor  a                                        ; $5C10: $AF
    ld   [hl], a                                  ; $5C11: $77
    pop  bc                                       ; $5C12: $C1
    ret                                           ; $5C13: $C9

    ld   bc, $0101                                ; $5C14: $01 $01 $01
    ld   bc, $0101                                ; $5C17: $01 $01 $01
    ld   bc, $0101                                ; $5C1A: $01 $01 $01
    ld   bc, $0303                                ; $5C1D: $01 $03 $03
    ld   bc, $0202                                ; $5C20: $01 $02 $02
    ld   bc, $0303                                ; $5C23: $01 $03 $03
    ld   [bc], a                                  ; $5C26: $02
    ld   [bc], a                                  ; $5C27: $02
    inc  bc                                       ; $5C28: $03
    inc  bc                                       ; $5C29: $03
    inc  bc                                       ; $5C2A: $03
    ld   bc, $0303                                ; $5C2B: $01 $03 $03
    ld   [bc], a                                  ; $5C2E: $02
    ld   [bc], a                                  ; $5C2F: $02
    ld   a, a                                     ; $5C30: $7F
    ld   a, a                                     ; $5C31: $7F
    ld   a, a                                     ; $5C32: $7F
    ld   a, a                                     ; $5C33: $7F
    ld   a, a                                     ; $5C34: $7F
    ld   a, a                                     ; $5C35: $7F
    add  h                                        ; $5C36: $84
    ld   a, a                                     ; $5C37: $7F
    ld   a, a                                     ; $5C38: $7F
    add  l                                        ; $5C39: $85
    cp   d                                        ; $5C3A: $BA
    ld   a, a                                     ; $5C3B: $7F
    add  b                                        ; $5C3C: $80
    ld   a, a                                     ; $5C3D: $7F
    ld   a, a                                     ; $5C3E: $7F
    add  c                                        ; $5C3F: $81
    ld   a, a                                     ; $5C40: $7F
    ld   a, a                                     ; $5C41: $7F
    add  d                                        ; $5C42: $82
    ld   a, a                                     ; $5C43: $7F
    ld   a, a                                     ; $5C44: $7F
    add  e                                        ; $5C45: $83
    cp   d                                        ; $5C46: $BA
    ld   a, a                                     ; $5C47: $7F
    add  [hl]                                     ; $5C48: $86
    ld   a, a                                     ; $5C49: $7F
    ld   a, a                                     ; $5C4A: $7F
    add  a                                        ; $5C4B: $87
    cp   d                                        ; $5C4C: $BA
    ld   a, a                                     ; $5C4D: $7F
    adc  b                                        ; $5C4E: $88
    ld   a, a                                     ; $5C4F: $7F
    ld   a, a                                     ; $5C50: $7F
    adc  c                                        ; $5C51: $89
    ld   a, a                                     ; $5C52: $7F
    ld   a, a                                     ; $5C53: $7F
    adc  d                                        ; $5C54: $8A
    ld   a, a                                     ; $5C55: $7F
    ld   a, a                                     ; $5C56: $7F
    adc  e                                        ; $5C57: $8B
    ld   a, a                                     ; $5C58: $7F
    ld   a, a                                     ; $5C59: $7F
    adc  h                                        ; $5C5A: $8C
    ld   a, a                                     ; $5C5B: $7F
    ld   a, a                                     ; $5C5C: $7F
    adc  l                                        ; $5C5D: $8D
    ld   a, a                                     ; $5C5E: $7F
    ld   a, a                                     ; $5C5F: $7F
    sbc  b                                        ; $5C60: $98
    ld   a, a                                     ; $5C61: $7F
    ld   a, a                                     ; $5C62: $7F
    sbc  c                                        ; $5C63: $99
    ld   a, a                                     ; $5C64: $7F
    ld   a, a                                     ; $5C65: $7F
    sub  b                                        ; $5C66: $90
    ld   a, a                                     ; $5C67: $7F
    ld   a, a                                     ; $5C68: $7F
    sub  c                                        ; $5C69: $91
    ld   a, a                                     ; $5C6A: $7F
    ld   a, a                                     ; $5C6B: $7F
    sub  d                                        ; $5C6C: $92
    ld   a, a                                     ; $5C6D: $7F
    ld   a, a                                     ; $5C6E: $7F
    sub  e                                        ; $5C6F: $93
    ld   a, a                                     ; $5C70: $7F
    ld   a, a                                     ; $5C71: $7F
    sub  [hl]                                     ; $5C72: $96
    ld   a, a                                     ; $5C73: $7F
    ld   a, a                                     ; $5C74: $7F
    sub  a                                        ; $5C75: $97
    ld   a, a                                     ; $5C76: $7F
    ld   a, a                                     ; $5C77: $7F
    adc  [hl]                                     ; $5C78: $8E
    ld   a, a                                     ; $5C79: $7F
    ld   a, a                                     ; $5C7A: $7F
    adc  a                                        ; $5C7B: $8F
    ld   a, a                                     ; $5C7C: $7F
    ld   a, a                                     ; $5C7D: $7F
    and  h                                        ; $5C7E: $A4
    ld   a, a                                     ; $5C7F: $7F
    ld   a, a                                     ; $5C80: $7F
    and  l                                        ; $5C81: $A5
    ld   a, a                                     ; $5C82: $7F
    ld   a, a                                     ; $5C83: $7F
    sbc  h                                        ; $5C84: $9C
    ld   bc, $069C                                ; $5C85: $01 $9C $06
    sbc  h                                        ; $5C88: $9C
    ld   h, c                                     ; $5C89: $61
    sbc  h                                        ; $5C8A: $9C
    ld   h, l                                     ; $5C8B: $65
    sbc  h                                        ; $5C8C: $9C
    pop  bc                                       ; $5C8D: $C1
    sbc  h                                        ; $5C8E: $9C
    push bc                                       ; $5C8F: $C5
    sbc  l                                        ; $5C90: $9D
    ld   hl, $259D                                ; $5C91: $21 $9D $25
    sbc  l                                        ; $5C94: $9D
    add  c                                        ; $5C95: $81
    sbc  l                                        ; $5C96: $9D
    add  l                                        ; $5C97: $85
    sbc  l                                        ; $5C98: $9D
    pop  hl                                       ; $5C99: $E1
    sbc  l                                        ; $5C9A: $9D
    push hl                                       ; $5C9B: $E5

Func_020_5C9C:
    push de                                       ; $5C9C: $D5
    push bc                                       ; $5C9D: $C5
    ld   hl, wAButtonSlot                         ; $5C9E: $21 $00 $DB
    add  hl, bc                                   ; $5CA1: $09
    ld   a, [hl]                                  ; $5CA2: $7E
    ldh  [hScratch1], a                           ; $5CA3: $E0 $D8
    sla  a                                        ; $5CA5: $CB $27
    ld   e, a                                     ; $5CA7: $5F
    sla  a                                        ; $5CA8: $CB $27
    add  e                                        ; $5CAA: $83
    ldh  [hScratch0], a                           ; $5CAB: $E0 $D7
    ldh  a, [hIsGBC]                              ; $5CAD: $F0 $FE
    and  a                                        ; $5CAF: $A7
    jr   z, jr_020_5CB5                           ; $5CB0: $28 $03

    call Func_020_5BB9                            ; $5CB2: $CD $B9 $5B

jr_020_5CB5:
    ld   a, [wRequests]                           ; $5CB5: $FA $00 $D6
    ld   e, a                                     ; $5CB8: $5F
    ld   d, $00                                   ; $5CB9: $16 $00
    ld   hl, wRequestDestinationHigh              ; $5CBB: $21 $01 $D6
    add  hl, de                                   ; $5CBE: $19
    add  $0C                                      ; $5CBF: $C6 $0C
    ld   [wRequests], a                           ; $5CC1: $EA $00 $D6
    push hl                                       ; $5CC4: $E5
    sla  c                                        ; $5CC5: $CB $21
    ld   hl, $5C84                                ; $5CC7: $21 $84 $5C
    add  hl, bc                                   ; $5CCA: $09
    push hl                                       ; $5CCB: $E5
    pop  de                                       ; $5CCC: $D1
    pop  hl                                       ; $5CCD: $E1
    ld   a, [de]                                  ; $5CCE: $1A
    inc  de                                       ; $5CCF: $13
    ld   [hl+], a                                 ; $5CD0: $22
    ld   a, [de]                                  ; $5CD1: $1A
    inc  de                                       ; $5CD2: $13
    ld   [hl+], a                                 ; $5CD3: $22
    ld   a, $02                                   ; $5CD4: $3E $02
    ld   [hl+], a                                 ; $5CD6: $22
    push hl                                       ; $5CD7: $E5
    ldh  a, [hScratch0]                           ; $5CD8: $F0 $D7
    ld   c, a                                     ; $5CDA: $4F
    ld   hl, $5C30                                ; $5CDB: $21 $30 $5C
    add  hl, bc                                   ; $5CDE: $09
    push hl                                       ; $5CDF: $E5
    pop  de                                       ; $5CE0: $D1
    pop  hl                                       ; $5CE1: $E1
    ld   a, [de]                                  ; $5CE2: $1A
    inc  de                                       ; $5CE3: $13
    ld   [hl+], a                                 ; $5CE4: $22
    ld   a, [de]                                  ; $5CE5: $1A
    inc  de                                       ; $5CE6: $13
    ld   [hl+], a                                 ; $5CE7: $22
    ld   a, [de]                                  ; $5CE8: $1A
    inc  de                                       ; $5CE9: $13
    ld   [hl+], a                                 ; $5CEA: $22
    pop  bc                                       ; $5CEB: $C1
    push bc                                       ; $5CEC: $C5
    push hl                                       ; $5CED: $E5
    sla  c                                        ; $5CEE: $CB $21
    ld   hl, $5C84                                ; $5CF0: $21 $84 $5C
    add  hl, bc                                   ; $5CF3: $09
    push hl                                       ; $5CF4: $E5
    pop  de                                       ; $5CF5: $D1
    pop  hl                                       ; $5CF6: $E1
    inc  de                                       ; $5CF7: $13
    inc  hl                                       ; $5CF8: $23
    ld   a, [de]                                  ; $5CF9: $1A
    add  $20                                      ; $5CFA: $C6 $20
    ld   [hl], a                                  ; $5CFC: $77
    dec  de                                       ; $5CFD: $1B
    dec  hl                                       ; $5CFE: $2B
    ld   a, [de]                                  ; $5CFF: $1A
    inc  de                                       ; $5D00: $13
    inc  de                                       ; $5D01: $13
    adc  $00                                      ; $5D02: $CE $00
    ld   [hl+], a                                 ; $5D04: $22
    inc  hl                                       ; $5D05: $23
    ld   a, $02                                   ; $5D06: $3E $02
    ld   [hl+], a                                 ; $5D08: $22
    push hl                                       ; $5D09: $E5
    ldh  a, [hScratch0]                           ; $5D0A: $F0 $D7
    ld   c, a                                     ; $5D0C: $4F
    ld   hl, $5C33                                ; $5D0D: $21 $33 $5C
    add  hl, bc                                   ; $5D10: $09
    push hl                                       ; $5D11: $E5
    pop  de                                       ; $5D12: $D1
    pop  hl                                       ; $5D13: $E1
    ld   a, [de]                                  ; $5D14: $1A
    inc  de                                       ; $5D15: $13
    ld   [hl+], a                                 ; $5D16: $22
    call Func_020_5B49                            ; $5D17: $CD $49 $5B
    xor  a                                        ; $5D1A: $AF
    ld   [hl], a                                  ; $5D1B: $77
    pop  bc                                       ; $5D1C: $C1
    pop  de                                       ; $5D1D: $D1
    dec  c                                        ; $5D1E: $0D
    ld   a, c                                     ; $5D1F: $79
    cp   e                                        ; $5D20: $BB
    jp   nz, Func_020_5C9C                        ; $5D21: $C2 $9C $5C

    ret                                           ; $5D24: $C9

    ld   a, [$C154]                               ; $5D25: $FA $54 $C1
    ld   c, a                                     ; $5D28: $4F
    ld   b, $00                                   ; $5D29: $06 $00
    ld   e, $FF                                   ; $5D2B: $1E $FF
    call Func_020_5C9C                            ; $5D2D: $CD $9C $5C
    xor  a                                        ; $5D30: $AF
    ld   [$C154], a                               ; $5D31: $EA $54 $C1

label_020_5D34:
    call Func_020_6683                            ; $5D34: $CD $83 $66
    call LCDOff                                   ; $5D37: $CD $CF $28
    ld   a, $20                                   ; $5D3A: $3E $20
    call label_AB5                                ; $5D3C: $CD $B5 $0A
    xor  a                                        ; $5D3F: $AF
    ld   [wRequests], a                           ; $5D40: $EA $00 $D6
    ld   [wRequestDestinationHigh], a             ; $5D43: $EA $01 $D6
    ld   [$DC90], a                               ; $5D46: $EA $90 $DC
    ld   [$DC91], a                               ; $5D49: $EA $91 $DC
    ld   a, [wLCDControl]                         ; $5D4C: $FA $FD $D6
    ld   [rLCDC], a                               ; $5D4F: $E0 $40
    ret                                           ; $5D51: $C9

    call LCDOff                                   ; $5D52: $CD $CF $28
    call $3FD1                                    ; $5D55: $CD $D1 $3F
    ld   a, [wLCDControl]                         ; $5D58: $FA $FD $D6
    ld   [rLCDC], a                               ; $5D5B: $E0 $40
    call Func_020_6683                            ; $5D5D: $CD $83 $66
    ret                                           ; $5D60: $C9

    rst  $38                                      ; $5D61: $FF
    ld   d, a                                     ; $5D62: $57
    call nz, $2126                                ; $5D63: $C4 $26 $21
    dec  d                                        ; $5D66: $15
    nop                                           ; $5D67: $00
    nop                                           ; $5D68: $00
    rst  $38                                      ; $5D69: $FF
    ld   d, a                                     ; $5D6A: $57
    ld   sp, $C552                                ; $5D6B: $31 $52 $C5
    jr   z, jr_020_5D70                           ; $5D6E: $28 $00

jr_020_5D70:
    nop                                           ; $5D70: $00
    rst  $38                                      ; $5D71: $FF
    ld   d, a                                     ; $5D72: $57
    ld   a, a                                     ; $5D73: $7F
    inc  l                                        ; $5D74: $2C
    ld   c, $14                                   ; $5D75: $0E $14
    nop                                           ; $5D77: $00
    nop                                           ; $5D78: $00
    rst  $38                                      ; $5D79: $FF
    ld   d, a                                     ; $5D7A: $57
    reti                                          ; $5D7B: $D9

    ld   de, $10CE                                ; $5D7C: $11 $CE $10
    nop                                           ; $5D7F: $00
    nop                                           ; $5D80: $00
    rst  $38                                      ; $5D81: $FF
    ld   d, a                                     ; $5D82: $57
    xor  [hl]                                     ; $5D83: $AE
    ld   a, [hl]                                  ; $5D84: $7E
    nop                                           ; $5D85: $00
    ld   a, h                                     ; $5D86: $7C
    nop                                           ; $5D87: $00
    nop                                           ; $5D88: $00
    rst  $38                                      ; $5D89: $FF
    ld   d, a                                     ; $5D8A: $57
    rst  $38                                      ; $5D8B: $FF
    ld   a, a                                     ; $5D8C: $7F
    ld   b, d                                     ; $5D8D: $42
    ld   b, $00                                   ; $5D8E: $06 $00
    nop                                           ; $5D90: $00
    rst  $38                                      ; $5D91: $FF
    ld   d, a                                     ; $5D92: $57
    cp   e                                        ; $5D93: $BB
    ld   [de], a                                  ; $5D94: $12
    ld   d, c                                     ; $5D95: $51
    ld   bc, $0000                                ; $5D96: $01 $00 $00
    rst  $38                                      ; $5D99: $FF
    ld   d, a                                     ; $5D9A: $57
    ld   [bc], a                                  ; $5D9B: $02
    dec  hl                                       ; $5D9C: $2B
    nop                                           ; $5D9D: $00
    ld   a, [bc]                                  ; $5D9E: $0A
    nop                                           ; $5D9F: $00
    nop                                           ; $5DA0: $00
    rst  $38                                      ; $5DA1: $FF
    ld   d, a                                     ; $5DA2: $57
    nop                                           ; $5DA3: $00
    nop                                           ; $5DA4: $00
    and  d                                        ; $5DA5: $A2
    ld   [hl+], a                                 ; $5DA6: $22
    rst  $38                                      ; $5DA7: $FF
    ld   c, [hl]                                  ; $5DA8: $4E
    nop                                           ; $5DA9: $00
    ld   a, h                                     ; $5DAA: $7C
    nop                                           ; $5DAB: $00
    nop                                           ; $5DAC: $00
    rst  $38                                      ; $5DAD: $FF
    dec  b                                        ; $5DAE: $05
    rst  $38                                      ; $5DAF: $FF
    ld   c, [hl]                                  ; $5DB0: $4E
    nop                                           ; $5DB1: $00
    ld   a, h                                     ; $5DB2: $7C
    nop                                           ; $5DB3: $00
    nop                                           ; $5DB4: $00
    inc  bc                                       ; $5DB5: $03
    ld   a, [hl]                                  ; $5DB6: $7E
    rst  $38                                      ; $5DB7: $FF
    ld   c, [hl]                                  ; $5DB8: $4E
    nop                                           ; $5DB9: $00
    ld   a, h                                     ; $5DBA: $7C
    nop                                           ; $5DBB: $00
    nop                                           ; $5DBC: $00
    ld   sp, $FF52                                ; $5DBD: $31 $52 $FF
    ld   a, a                                     ; $5DC0: $7F
    nop                                           ; $5DC1: $00
    ld   a, h                                     ; $5DC2: $7C
    rst  $18                                      ; $5DC3: $DF
    ld   a, [de]                                  ; $5DC4: $1A
    ld   a, l                                     ; $5DC5: $7D
    jr   jr_020_5DC8                              ; $5DC6: $18 $00

jr_020_5DC8:
    nop                                           ; $5DC8: $00
    nop                                           ; $5DC9: $00
    ld   a, h                                     ; $5DCA: $7C
    nop                                           ; $5DCB: $00
    nop                                           ; $5DCC: $00
    and  d                                        ; $5DCD: $A2
    ld   [hl+], a                                 ; $5DCE: $22
    rst  $38                                      ; $5DCF: $FF
    ld   a, a                                     ; $5DD0: $7F
    nop                                           ; $5DD1: $00
    ld   a, h                                     ; $5DD2: $7C
    nop                                           ; $5DD3: $00
    nop                                           ; $5DD4: $00
    rra                                           ; $5DD5: $1F
    nop                                           ; $5DD6: $00
    rst  $38                                      ; $5DD7: $FF
    ld   a, a                                     ; $5DD8: $7F
    nop                                           ; $5DD9: $00
    ld   a, h                                     ; $5DDA: $7C
    nop                                           ; $5DDB: $00
    nop                                           ; $5DDC: $00
    nop                                           ; $5DDD: $00
    ld   a, h                                     ; $5DDE: $7C
    rst  $38                                      ; $5DDF: $FF
    ld   a, a                                     ; $5DE0: $7F
    rst  $38                                      ; $5DE1: $FF
    ld   a, a                                     ; $5DE2: $7F
    ld   b, d                                     ; $5DE3: $42
    ld   b, $BE                                   ; $5DE4: $06 $BE
    rrca                                          ; $5DE6: $0F
    inc  de                                       ; $5DE7: $13
    ld   [bc], a                                  ; $5DE8: $02
    ld   a, a                                     ; $5DE9: $7F
    rrca                                          ; $5DEA: $0F
    ldh  [$FF09], a                               ; $5DEB: $E0 $09
    rst  $18                                      ; $5DED: $DF
    ld   [hl-], a                                 ; $5DEE: $32
    ld   a, l                                     ; $5DEF: $7D
    jr   @+$01                                    ; $5DF0: $18 $FF

    ld   a, a                                     ; $5DF2: $7F
    dec  a                                        ; $5DF3: $3D
    ld   [$7EAE], sp                              ; $5DF4: $08 $AE $7E
    nop                                           ; $5DF7: $00
    ld   a, h                                     ; $5DF8: $7C
    rst  $38                                      ; $5DF9: $FF
    ld   a, a                                     ; $5DFA: $7F
    ld   sp, $E152                                ; $5DFB: $31 $52 $E1
    ld   e, l                                     ; $5DFE: $5D
    push hl                                       ; $5DFF: $E5
    ld   e, l                                     ; $5E00: $5D
    jp   hl                                       ; $5E01: $E9

    ld   e, l                                     ; $5E02: $5D
    db   $ed                                      ; $5E03: $ED
    ld   e, l                                     ; $5E04: $5D
    pop  af                                       ; $5E05: $F1
    ld   e, l                                     ; $5E06: $5D
    push af                                       ; $5E07: $F5
    ld   e, l                                     ; $5E08: $5D
    ld   sp, hl                                   ; $5E09: $F9
    ld   e, l                                     ; $5E0A: $5D
    nop                                           ; $5E0B: $00
    ld   bc, $0700                                ; $5E0C: $01 $00 $07
    ld   [bc], a                                  ; $5E0F: $02
    nop                                           ; $5E10: $00
    nop                                           ; $5E11: $00
    inc  bc                                       ; $5E12: $03
    inc  b                                        ; $5E13: $04
    dec  b                                        ; $5E14: $05
    nop                                           ; $5E15: $00
    nop                                           ; $5E16: $00
    nop                                           ; $5E17: $00
    nop                                           ; $5E18: $00
    ld   b, $AF                                   ; $5E19: $06 $AF
    ld   [wWindowY], a                            ; $5E1B: $EA $9A $DB
    ld   a, $01                                   ; $5E1E: $3E $01
    ld   [wPaletteUnknownE], a                    ; $5E20: $EA $D5 $DD
    ldh  a, [hIsGBC]                              ; $5E23: $F0 $FE
    and  a                                        ; $5E25: $A7
    jr   z, jr_020_5E6D                           ; $5E26: $28 $45

    ld   bc, $5D61                                ; $5E28: $01 $61 $5D
    ld   hl, $DC10                                ; $5E2B: $21 $10 $DC
    di                                            ; $5E2E: $F3
    ld   a, $02                                   ; $5E2F: $3E $02
    ld   [rSVBK], a                               ; $5E31: $E0 $70

jr_020_5E33:
    ld   a, [bc]                                  ; $5E33: $0A
    ld   [hl+], a                                 ; $5E34: $22
    inc  bc                                       ; $5E35: $03
    ld   a, l                                     ; $5E36: $7D
    cp   $90                                      ; $5E37: $FE $90
    jr   nz, jr_020_5E33                          ; $5E39: $20 $F8

    xor  a                                        ; $5E3B: $AF
    ld   [rSVBK], a                               ; $5E3C: $E0 $70
    ei                                            ; $5E3E: $FB
    ld   hl, $5E0B                                ; $5E3F: $21 $0B $5E
    ld   a, [wTradeSequenceItem]                  ; $5E42: $FA $0E $DB
    ld   e, a                                     ; $5E45: $5F
    ld   d, $00                                   ; $5E46: $16 $00
    add  hl, de                                   ; $5E48: $19
    ld   a, [hl]                                  ; $5E49: $7E
    and  a                                        ; $5E4A: $A7
    jr   z, jr_020_5E6D                           ; $5E4B: $28 $20

    sla  a                                        ; $5E4D: $CB $27
    ld   e, a                                     ; $5E4F: $5F
    ld   hl, $5DFB                                ; $5E50: $21 $FB $5D
    add  hl, de                                   ; $5E53: $19
    ld   a, [hl+]                                 ; $5E54: $2A
    ld   h, [hl]                                  ; $5E55: $66
    ld   l, a                                     ; $5E56: $6F
    ld   de, $DC3A                                ; $5E57: $11 $3A $DC
    ld   c, $04                                   ; $5E5A: $0E $04
    di                                            ; $5E5C: $F3
    ld   a, $02                                   ; $5E5D: $3E $02
    ld   [rSVBK], a                               ; $5E5F: $E0 $70

jr_020_5E61:
    ld   a, [hl+]                                 ; $5E61: $2A
    ld   [de], a                                  ; $5E62: $12
    inc  de                                       ; $5E63: $13
    dec  c                                        ; $5E64: $0D
    ld   a, c                                     ; $5E65: $79
    and  a                                        ; $5E66: $A7
    jr   nz, jr_020_5E61                          ; $5E67: $20 $F8

    xor  a                                        ; $5E69: $AF
    ld   [rSVBK], a                               ; $5E6A: $E0 $70
    ei                                            ; $5E6C: $FB

jr_020_5E6D:
    xor  a                                        ; $5E6D: $AF
    ld   [wTransitionSequenceCounter], a          ; $5E6E: $EA $6B $C1
    call Func_020_6683                            ; $5E71: $CD $83 $66
    ret                                           ; $5E74: $C9

    add  b                                        ; $5E75: $80
    ld   h, $00                                   ; $5E76: $26 $00
    ld   de, $3A20                                ; $5E78: $11 $20 $3A
    ld   [rNR23], a                               ; $5E7B: $E0 $18
    and  b                                        ; $5E7D: $A0
    ld   d, c                                     ; $5E7E: $51
    ret  nz                                       ; $5E7F: $C0

    jr   nz, jr_020_5E8A                          ; $5E80: $20 $08

    ld   a, l                                     ; $5E82: $7D
    add  h                                        ; $5E83: $84
    inc  [hl]                                     ; $5E84: $34
    xor  l                                        ; $5E85: $AD
    ld   a, h                                     ; $5E86: $7C
    ld   b, [hl]                                  ; $5E87: $46
    jr   nc, @+$52                                ; $5E88: $30 $50

jr_020_5E8A:
    ld   e, h                                     ; $5E8A: $5C
    daa                                           ; $5E8B: $27
    jr   z, jr_020_5EA0                           ; $5E8C: $28 $12

    ld   b, b                                     ; $5E8E: $40
    ld   [$151C], sp                              ; $5E8F: $08 $1C $15
    jr   nc, jr_020_5E9D                          ; $5E92: $30 $09

    inc  d                                        ; $5E94: $14
    rla                                           ; $5E95: $17
    inc  d                                        ; $5E96: $14
    add  hl, bc                                   ; $5E97: $09
    nop                                           ; $5E98: $00
    rst  $10                                      ; $5E99: $D7
    inc  b                                        ; $5E9A: $04
    ld   l, d                                     ; $5E9B: $6A
    inc  b                                        ; $5E9C: $04

jr_020_5E9D:
    scf                                           ; $5E9D: $37
    dec  b                                        ; $5E9E: $05
    adc  d                                        ; $5E9F: $8A

jr_020_5EA0:
    inc  b                                        ; $5EA0: $04
    sub  a                                        ; $5EA1: $97
    add  hl, bc                                   ; $5EA2: $09
    xor  d                                        ; $5EA3: $AA
    inc  b                                        ; $5EA4: $04
    push af                                       ; $5EA5: $F5
    add  hl, bc                                   ; $5EA6: $09
    ret                                           ; $5EA7: $C9

    inc  b                                        ; $5EA8: $04
    db   $10                                      ; $5EA9: $10
    ld   a, [bc]                                  ; $5EAA: $0A
    rst  $20                                      ; $5EAB: $E7
    inc  b                                        ; $5EAC: $04
    ld   c, e                                     ; $5EAD: $4B
    ld   b, $05                                   ; $5EAE: $06 $05
    dec  b                                        ; $5EB0: $05
    and  b                                        ; $5EB1: $A0
    ld   [bc], a                                  ; $5EB2: $02
    jr   nz, @+$03                                ; $5EB3: $20 $01

Func_020_5EB5:
    ldh  a, [hIsGBC]                              ; $5EB5: $F0 $FE
    and  a                                        ; $5EB7: $A7
    jr   z, jr_020_5EEE                           ; $5EB8: $28 $34

    ld   a, [$DE07]                               ; $5EBA: $FA $07 $DE
    ld   c, a                                     ; $5EBD: $4F
    ld   a, [$DE06]                               ; $5EBE: $FA $06 $DE
    inc  a                                        ; $5EC1: $3C
    ld   [$DE06], a                               ; $5EC2: $EA $06 $DE
    cp   $08                                      ; $5EC5: $FE $08
    jr   c, jr_020_5ED6                           ; $5EC7: $38 $0D

    xor  a                                        ; $5EC9: $AF
    ld   [$DE06], a                               ; $5ECA: $EA $06 $DE
    ld   a, c                                     ; $5ECD: $79
    add  $04                                      ; $5ECE: $C6 $04
    and  $3C                                      ; $5ED0: $E6 $3C
    ld   [$DE07], a                               ; $5ED2: $EA $07 $DE
    ld   c, a                                     ; $5ED5: $4F

jr_020_5ED6:
    ld   b, $00                                   ; $5ED6: $06 $00
    ld   hl, $5E75                                ; $5ED8: $21 $75 $5E
    add  hl, bc                                   ; $5EDB: $09
    ld   bc, $DC4A                                ; $5EDC: $01 $4A $DC
    ld   e, $04                                   ; $5EDF: $1E $04

jr_020_5EE1:
    ld   a, [hl+]                                 ; $5EE1: $2A
    ld   [bc], a                                  ; $5EE2: $02
    inc  bc                                       ; $5EE3: $03
    dec  e                                        ; $5EE4: $1D
    ld   a, e                                     ; $5EE5: $7B
    and  a                                        ; $5EE6: $A7
    jr   nz, jr_020_5EE1                          ; $5EE7: $20 $F8

    ld   a, $01                                   ; $5EE9: $3E $01
    ld   [wPaletteDataFlags], a                    ; $5EEB: $EA $D1 $DD

jr_020_5EEE:
    ret                                           ; $5EEE: $C9

    call Func_020_635C                            ; $5EEF: $CD $5C $63
    call label_1A39                               ; $5EF2: $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ; $5EF5: $FA $6B $C1
    cp   $04                                      ; $5EF8: $FE $04
    jr   nz, jr_020_5EFF                          ; $5EFA: $20 $03

    call Func_020_6683                            ; $5EFC: $CD $83 $66

jr_020_5EFF:
    ret                                           ; $5EFF: $C9

    nop                                           ; $5F00: $00
    ld   bc, $00FF                                ; $5F01: $01 $FF $00
    cp   $02                                      ; $5F04: $FE $02

Func_020_5F06:
    ld   a, [$DBA3]                               ; $5F06: $FA $A3 $DB
    ld   [$C1B6], a                               ; $5F09: $EA $B6 $C1
    ld   a, [$C1B8]                               ; $5F0C: $FA $B8 $C1
    ld   hl, $C1B9                                ; $5F0F: $21 $B9 $C1
    or   [hl]                                     ; $5F12: $B6
    jr   nz, jr_020_5F59                          ; $5F13: $20 $44

    ld   a, [$C1B5]                               ; $5F15: $FA $B5 $C1
    and  a                                        ; $5F18: $A7
    jr   nz, jr_020_5F38                          ; $5F19: $20 $1D

    ldh  a, [hJoypadState]                               ; $5F1B: $F0 $CC
    and  $03                                      ; $5F1D: $E6 $03
    ld   e, a                                     ; $5F1F: $5F
    ld   d, $00                                   ; $5F20: $16 $00
    ld   hl, $5F00                                ; $5F22: $21 $00 $5F
    add  hl, de                                   ; $5F25: $19
    ld   a, [$DBA3]                               ; $5F26: $FA $A3 $DB
    add  [hl]                                     ; $5F29: $86
    cp   $0A                                      ; $5F2A: $FE $0A
    jr   c, jr_020_5F35                           ; $5F2C: $38 $07

    rla                                           ; $5F2E: $17
    ld   a, $00                                   ; $5F2F: $3E $00
    jr   nc, jr_020_5F35                          ; $5F31: $30 $02

    ld   a, $09                                   ; $5F33: $3E $09

jr_020_5F35:
    ld   [$DBA3], a                               ; $5F35: $EA $A3 $DB

jr_020_5F38:
    ldh  a, [hJoypadState]                               ; $5F38: $F0 $CC
    srl  a                                        ; $5F3A: $CB $3F
    srl  a                                        ; $5F3C: $CB $3F
    and  $03                                      ; $5F3E: $E6 $03
    ld   e, a                                     ; $5F40: $5F
    ld   d, $00                                   ; $5F41: $16 $00
    ld   hl, $5F03                                ; $5F43: $21 $03 $5F
    add  hl, de                                   ; $5F46: $19
    ld   a, [$DBA3]                               ; $5F47: $FA $A3 $DB
    add  [hl]                                     ; $5F4A: $86
    cp   $0A                                      ; $5F4B: $FE $0A
    jr   c, jr_020_5F56                           ; $5F4D: $38 $07

    rla                                           ; $5F4F: $17
    ld   a, $00                                   ; $5F50: $3E $00
    jr   nc, jr_020_5F56                          ; $5F52: $30 $02

    ld   a, $09                                   ; $5F54: $3E $09

jr_020_5F56:
    ld   [$DBA3], a                               ; $5F56: $EA $A3 $DB

jr_020_5F59:
    ldh  a, [hPressedButtonsMask]                 ; $5F59: $F0 $CB
    and  $0F                                      ; $5F5B: $E6 $0F
    jr   z, jr_020_5F69                           ; $5F5D: $28 $0A

    ld   a, [$C1B5]                               ; $5F5F: $FA $B5 $C1
    and  a                                        ; $5F62: $A7
    jr   nz, jr_020_5F69                          ; $5F63: $20 $04

    xor  a                                        ; $5F65: $AF
    ld   [wInventoryCursorFrameCounter], a        ; $5F66: $EA $59 $C1

jr_020_5F69:
    ld   a, [$C1B5]                               ; $5F69: $FA $B5 $C1
    and  a                                        ; $5F6C: $A7
    jr   z, jr_020_5F85                           ; $5F6D: $28 $16

    ld   a, [$C1B8]                               ; $5F6F: $FA $B8 $C1
    ld   hl, $C1B9                                ; $5F72: $21 $B9 $C1
    or   [hl]                                     ; $5F75: $B6
    jr   nz, jr_020_5F85                          ; $5F76: $20 $0D

    ldh  a, [hJoypadState]                               ; $5F78: $F0 $CC
    and  $80                                      ; $5F7A: $E6 $80
    jr   z, jr_020_5F85                           ; $5F7C: $28 $07

    ld   a, $01                                   ; $5F7E: $3E $01
    ld   [$C1BA], a                               ; $5F80: $EA $BA $C1
    jr   jr_020_5FB2                              ; $5F83: $18 $2D

jr_020_5F85:
    ld   a, [$DBA3]                               ; $5F85: $FA $A3 $DB
    ld   hl, $C1B6                                ; $5F88: $21 $B6 $C1
    cp   [hl]                                     ; $5F8B: $BE
    jr   z, jr_020_5FC1                           ; $5F8C: $28 $33

    ld   hl, hJingle                              ; $5F8E: $21 $F2 $FF
    ld   [hl], $0A                                ; $5F91: $36 $0A
    ld   e, a                                     ; $5F93: $5F
    ld   d, $00                                   ; $5F94: $16 $00
    ld   hl, wInventoryItem1                      ; $5F96: $21 $02 $DB
    add  hl, de                                   ; $5F99: $19
    ld   a, [hl]                                  ; $5F9A: $7E
    cp   $09                                      ; $5F9B: $FE $09
    jr   nz, jr_020_5FB2                          ; $5F9D: $20 $13

    ld   a, [wOcarinaSongFlags]                  ; $5F9F: $FA $49 $DB
    and  a                                        ; $5FA2: $A7
    jr   z, jr_020_5FB2                           ; $5FA3: $28 $0D

    ld   a, $08                                   ; $5FA5: $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ; $5FA7: $E0 $90
    ld   a, $10                                   ; $5FA9: $3E $10
    ld   [$C1B8], a                               ; $5FAB: $EA $B8 $C1
    ld   a, $01                                   ; $5FAE: $3E $01
    jr   jr_020_5FBE                              ; $5FB0: $18 $0C

jr_020_5FB2:
    ld   a, [$C1B5]                               ; $5FB2: $FA $B5 $C1
    and  a                                        ; $5FB5: $A7
    jr   z, jr_020_5FC1                           ; $5FB6: $28 $09

    ld   a, $10                                   ; $5FB8: $3E $10
    ld   [$C1B9], a                               ; $5FBA: $EA $B9 $C1
    xor  a                                        ; $5FBD: $AF

jr_020_5FBE:
    ld   [$C1B5], a                               ; $5FBE: $EA $B5 $C1

jr_020_5FC1:
    ld   hl, $C1B9                                ; $5FC1: $21 $B9 $C1
    ld   a, [$C1B8]                               ; $5FC4: $FA $B8 $C1
    or   [hl]                                     ; $5FC7: $B6
    jp   nz, label_020_604A                       ; $5FC8: $C2 $4A $60

    ldh  a, [hJoypadState]                               ; $5FCB: $F0 $CC
    and  $10                                      ; $5FCD: $E6 $10
    jr   z, jr_020_5FED                           ; $5FCF: $28 $1C

    ld   a, [wBButtonSlot]                        ; $5FD1: $FA $01 $DB
    push af                                       ; $5FD4: $F5
    ld   hl, wInventoryItem1                      ; $5FD5: $21 $02 $DB
    ld   a, [$DBA3]                               ; $5FD8: $FA $A3 $DB

label_020_5FDB:
    ld   c, a                                     ; $5FDB: $4F
    ld   b, $00                                   ; $5FDC: $06 $00
    add  hl, bc                                   ; $5FDE: $09
    ld   a, [hl]                                  ; $5FDF: $7E
    ld   [wBButtonSlot], a                        ; $5FE0: $EA $01 $DB
    pop  af                                       ; $5FE3: $F1
    ld   [hl], a                                  ; $5FE4: $77
    ld   c, $01                                   ; $5FE5: $0E $01
    ld   b, $00                                   ; $5FE7: $06 $00
    ld   e, $00                                   ; $5FE9: $1E $00
    jr   jr_020_600D                              ; $5FEB: $18 $20

jr_020_5FED:
    ldh  a, [hJoypadState]                               ; $5FED: $F0 $CC
    and  $20                                      ; $5FEF: $E6 $20
    jr   z, jr_020_604A                           ; $5FF1: $28 $57

    ld   a, [wAButtonSlot]                        ; $5FF3: $FA $00 $DB
    push af                                       ; $5FF6: $F5
    ld   hl, wInventoryItem1                      ; $5FF7: $21 $02 $DB
    ld   a, [$DBA3]                               ; $5FFA: $FA $A3 $DB
    ld   c, a                                     ; $5FFD: $4F
    ld   b, $00                                   ; $5FFE: $06 $00
    add  hl, bc                                   ; $6000: $09
    ld   a, [hl]                                  ; $6001: $7E
    ld   [wAButtonSlot], a                        ; $6002: $EA $00 $DB
    pop  af                                       ; $6005: $F1
    ld   [hl], a                                  ; $6006: $77
    ld   c, $00                                   ; $6007: $0E $00
    ld   b, $00                                   ; $6009: $06 $00
    ld   e, $FF                                   ; $600B: $1E $FF

jr_020_600D:
    cp   $09                                      ; $600D: $FE $09
    jr   nz, jr_020_6027                          ; $600F: $20 $16

    ld   a, [wOcarinaSongFlags]                  ; $6011: $FA $49 $DB
    and  a                                        ; $6014: $A7
    jr   z, jr_020_6027                           ; $6015: $28 $10

    ld   a, $08                                   ; $6017: $3E $08
    ldh  [hNeedsUpdatingBGTiles], a               ; $6019: $E0 $90
    ld   a, $10                                   ; $601B: $3E $10
    ld   [$C1B8], a                               ; $601D: $EA $B8 $C1
    ld   a, $01                                   ; $6020: $3E $01
    ld   [$C1B5], a                               ; $6022: $EA $B5 $C1
    jr   jr_020_6036                              ; $6025: $18 $0F

jr_020_6027:
    ld   a, [$C1B5]                               ; $6027: $FA $B5 $C1
    and  a                                        ; $602A: $A7
    jr   z, jr_020_6036                           ; $602B: $28 $09

    xor  a                                        ; $602D: $AF
    ld   [$C1B5], a                               ; $602E: $EA $B5 $C1
    ld   a, $10                                   ; $6031: $3E $10
    ld   [$C1B9], a                               ; $6033: $EA $B9 $C1

jr_020_6036:
    call Func_020_5C9C                            ; $6036: $CD $9C $5C

Func_020_6039:
    ld   a, $13                                   ; $6039: $3E $13
    ldh  [hJingle], a                             ; $603B: $E0 $F2
    ld   a, [$DBA3]                               ; $603D: $FA $A3 $DB
    add  $02                                      ; $6040: $C6 $02
    ld   c, a                                     ; $6042: $4F
    ld   b, $00                                   ; $6043: $06 $00
    dec  a                                        ; $6045: $3D
    ld   e, a                                     ; $6046: $5F
    call Func_020_5C9C                            ; $6047: $CD $9C $5C

label_020_604A:
jr_020_604A:
    ret                                           ; $604A: $C9

    ld   hl, sp-$10                               ; $604B: $F8 $F0
    ld   [hl+], a                                 ; $604D: $22
    ld   bc, $F8F8                                ; $604E: $01 $F8 $F8
    ld   [hl+], a                                 ; $6051: $22
    ld   hl, $00F8                                ; $6052: $21 $F8 $00
    inc  h                                        ; $6055: $24
    ld   [bc], a                                  ; $6056: $02
    ld   hl, sp+$08                               ; $6057: $F8 $08
    inc  h                                        ; $6059: $24
    ld   [hl+], a                                 ; $605A: $22
    ld   hl, sp+$10                               ; $605B: $F8 $10
    ld   h, $00                                   ; $605D: $26 $00
    ld   hl, sp+$18                               ; $605F: $F8 $18
    ld   h, $20                                   ; $6061: $26 $20
    ld   [$20F0], sp                              ; $6063: $08 $F0 $20
    nop                                           ; $6066: $00
    ld   [$20F8], sp                              ; $6067: $08 $F8 $20
    nop                                           ; $606A: $00
    ld   [$2000], sp                              ; $606B: $08 $00 $20
    nop                                           ; $606E: $00
    ld   [$2008], sp                              ; $606F: $08 $08 $20
    nop                                           ; $6072: $00
    ld   [$2010], sp                              ; $6073: $08 $10 $20
    nop                                           ; $6076: $00
    ld   [$2018], sp                              ; $6077: $08 $18 $20
    nop                                           ; $607A: $00
    ei                                            ; $607B: $FB
    db   $f4                                      ; $607C: $F4
    jr   nz, jr_020_607F                          ; $607D: $20 $00

jr_020_607F:
    ei                                            ; $607F: $FB
    db   $fc                                      ; $6080: $FC
    jr   nz, jr_020_60A3                          ; $6081: $20 $20

    ei                                            ; $6083: $FB
    nop                                           ; $6084: $00
    jr   nz, jr_020_6087                          ; $6085: $20 $00

jr_020_6087:
    ei                                            ; $6087: $FB
    ld   [$2020], sp                              ; $6088: $08 $20 $20
    ei                                            ; $608B: $FB
    inc  c                                        ; $608C: $0C
    jr   nz, jr_020_608F                          ; $608D: $20 $00

jr_020_608F:
    ei                                            ; $608F: $FB
    inc  d                                        ; $6090: $14
    jr   nz, jr_020_60B3                          ; $6091: $20 $20

    dec  b                                        ; $6093: $05
    db   $f4                                      ; $6094: $F4
    jr   nz, jr_020_6097                          ; $6095: $20 $00

jr_020_6097:
    dec  b                                        ; $6097: $05
    db   $fc                                      ; $6098: $FC
    jr   nz, jr_020_609B                          ; $6099: $20 $00

jr_020_609B:
    dec  b                                        ; $609B: $05
    nop                                           ; $609C: $00
    jr   nz, jr_020_609F                          ; $609D: $20 $00

jr_020_609F:
    dec  b                                        ; $609F: $05
    ld   [$0020], sp                              ; $60A0: $08 $20 $00

jr_020_60A3:
    dec  b                                        ; $60A3: $05
    inc  c                                        ; $60A4: $0C
    jr   nz, jr_020_60A7                          ; $60A5: $20 $00

jr_020_60A7:
    dec  b                                        ; $60A7: $05
    inc  d                                        ; $60A8: $14
    jr   nz, jr_020_60AB                          ; $60A9: $20 $00

jr_020_60AB:
    db   $fd                                      ; $60AB: $FD
    ld   hl, sp+$20                               ; $60AC: $F8 $20
    nop                                           ; $60AE: $00
    db   $fd                                      ; $60AF: $FD
    db   $10                                      ; $60B0: $10
    jr   nz, jr_020_60D3                          ; $60B1: $20 $20

jr_020_60B3:
    db   $fd                                      ; $60B3: $FD
    nop                                           ; $60B4: $00
    jr   nz, jr_020_60B7                          ; $60B5: $20 $00

jr_020_60B7:
    db   $fd                                      ; $60B7: $FD
    ld   [$2020], sp                              ; $60B8: $08 $20 $20
    db   $fd                                      ; $60BB: $FD
    ld   [$0020], sp                              ; $60BC: $08 $20 $00
    db   $fd                                      ; $60BF: $FD
    db   $10                                      ; $60C0: $10
    jr   nz, jr_020_60E3                          ; $60C1: $20 $20

    inc  bc                                       ; $60C3: $03
    ld   hl, sp+$20                               ; $60C4: $F8 $20
    nop                                           ; $60C6: $00
    inc  bc                                       ; $60C7: $03
    db   $10                                      ; $60C8: $10
    jr   nz, jr_020_60CB                          ; $60C9: $20 $00

jr_020_60CB:
    inc  bc                                       ; $60CB: $03
    nop                                           ; $60CC: $00
    jr   nz, jr_020_60CF                          ; $60CD: $20 $00

jr_020_60CF:
    inc  bc                                       ; $60CF: $03
    ld   [$0020], sp                              ; $60D0: $08 $20 $00

jr_020_60D3:
    inc  bc                                       ; $60D3: $03
    ld   [$0020], sp                              ; $60D4: $08 $20 $00
    inc  bc                                       ; $60D7: $03
    db   $10                                      ; $60D8: $10
    jr   nz, jr_020_60DB                          ; $60D9: $20 $00

jr_020_60DB:
    nop                                           ; $60DB: $00
    nop                                           ; $60DC: $00
    jr   nz, jr_020_60DF                          ; $60DD: $20 $00

jr_020_60DF:
    nop                                           ; $60DF: $00
    ld   [$2020], sp                              ; $60E0: $08 $20 $20

jr_020_60E3:
    nop                                           ; $60E3: $00
    nop                                           ; $60E4: $00
    jr   nz, jr_020_60E7                          ; $60E5: $20 $00

jr_020_60E7:
    nop                                           ; $60E7: $00
    ld   [$2020], sp                              ; $60E8: $08 $20 $20
    nop                                           ; $60EB: $00
    nop                                           ; $60EC: $00
    jr   nz, jr_020_60EF                          ; $60ED: $20 $00

jr_020_60EF:
    nop                                           ; $60EF: $00
    ld   [$2020], sp                              ; $60F0: $08 $20 $20
    nop                                           ; $60F3: $00
    nop                                           ; $60F4: $00
    jr   nz, jr_020_60F7                          ; $60F5: $20 $00

jr_020_60F7:
    nop                                           ; $60F7: $00
    ld   [$0020], sp                              ; $60F8: $08 $20 $00
    nop                                           ; $60FB: $00
    nop                                           ; $60FC: $00
    jr   nz, jr_020_60FF                          ; $60FD: $20 $00

jr_020_60FF:
    nop                                           ; $60FF: $00
    ld   [$0020], sp                              ; $6100: $08 $20 $00
    nop                                           ; $6103: $00
    nop                                           ; $6104: $00
    jr   nz, jr_020_6107                          ; $6105: $20 $00

jr_020_6107:
    nop                                           ; $6107: $00
    ld   [$0020], sp                              ; $6108: $08 $20 $00
    ld   d, b                                     ; $610B: $50
    ld   h, b                                     ; $610C: $60
    ld   [hl], b                                  ; $610D: $70
    inc  b                                        ; $610E: $04
    ld   [bc], a                                  ; $610F: $02
    ld   bc, $B9FA                                ; $6110: $01 $FA $B9
    pop  bc                                       ; $6113: $C1
    and  a                                        ; $6114: $A7
    jr   z, jr_020_6131                           ; $6115: $28 $1A

    dec  a                                        ; $6117: $3D
    ld   [$C1B9], a                               ; $6118: $EA $B9 $C1
    jr   nz, jr_020_612E                          ; $611B: $20 $11

    ld   hl, hNeedsUpdatingBGTiles                ; $611D: $21 $90 $FF
    ld   [hl], $0B                                ; $6120: $36 $0B
    ld   a, [$C1BA]                               ; $6122: $FA $BA $C1
    and  a                                        ; $6125: $A7
    jr   z, jr_020_612D                           ; $6126: $28 $05

    ld   a, $0C                                   ; $6128: $3E $0C
    ld   [wGameplaySubtype], a                    ; $612A: $EA $96 $DB

jr_020_612D:
    ret                                           ; $612D: $C9

jr_020_612E:
    cpl                                           ; $612E: $2F
    jr   jr_020_613B                              ; $612F: $18 $0A

jr_020_6131:
    ld   a, [$C1B8]                               ; $6131: $FA $B8 $C1
    and  a                                        ; $6134: $A7
    jr   z, jr_020_6141                           ; $6135: $28 $0A

    dec  a                                        ; $6137: $3D
    ld   [$C1B8], a                               ; $6138: $EA $B8 $C1

jr_020_613B:
    rra                                           ; $613B: $1F
    rra                                           ; $613C: $1F
    and  $03                                      ; $613D: $E6 $03
    jr   jr_020_614A                              ; $613F: $18 $09

jr_020_6141:
    ld   a, [$C1B5]                               ; $6141: $FA $B5 $C1
    and  a                                        ; $6144: $A7
    jp   z, label_020_6214                        ; $6145: $CA $14 $62

    ld   a, $00                                   ; $6148: $3E $00

jr_020_614A:
    ld   [$C1B7], a                               ; $614A: $EA $B7 $C1
    ld   a, [$C1B7]                               ; $614D: $FA $B7 $C1
    ld   d, $00                                   ; $6150: $16 $00
    sla  a                                        ; $6152: $CB $27
    sla  a                                        ; $6154: $CB $27
    sla  a                                        ; $6156: $CB $27
    sla  a                                        ; $6158: $CB $27
    ld   e, a                                     ; $615A: $5F
    sla  a                                        ; $615B: $CB $27
    add  e                                        ; $615D: $83
    ld   e, a                                     ; $615E: $5F
    ld   hl, $604B                                ; $615F: $21 $4B $60
    add  hl, de                                   ; $6162: $19
    ld   de, $C018                                ; $6163: $11 $18 $C0
    ld   c, $0C                                   ; $6166: $0E $0C
    ld   b, $04                                   ; $6168: $06 $04

jr_020_616A:
    ld   a, [hl+]                                 ; $616A: $2A
    add  $30                                      ; $616B: $C6 $30
    ld   [de], a                                  ; $616D: $12
    inc  de                                       ; $616E: $13
    ld   a, [hl+]                                 ; $616F: $2A
    add  $60                                      ; $6170: $C6 $60
    ld   [de], a                                  ; $6172: $12
    inc  de                                       ; $6173: $13
    ld   a, [hl+]                                 ; $6174: $2A
    ld   [de], a                                  ; $6175: $12
    inc  de                                       ; $6176: $13
    cp   $22                                      ; $6177: $FE $22
    jr   z, jr_020_6185                           ; $6179: $28 $0A

    cp   $24                                      ; $617B: $FE $24
    jr   z, jr_020_6189                           ; $617D: $28 $0A

    cp   $26                                      ; $617F: $FE $26
    jr   z, jr_020_618D                           ; $6181: $28 $0A

    jr   jr_020_619A                              ; $6183: $18 $15

jr_020_6185:
    ld   b, $04                                   ; $6185: $06 $04
    jr   jr_020_618F                              ; $6187: $18 $06

jr_020_6189:
    ld   b, $02                                   ; $6189: $06 $02
    jr   jr_020_618F                              ; $618B: $18 $02

jr_020_618D:
    ld   b, $01                                   ; $618D: $06 $01

jr_020_618F:
    ld   a, [wOcarinaSongFlags]                  ; $618F: $FA $49 $DB
    and  b                                        ; $6192: $A0
    jr   nz, jr_020_619A                          ; $6193: $20 $05

    dec  de                                       ; $6195: $1B
    ld   a, $20                                   ; $6196: $3E $20
    ld   [de], a                                  ; $6198: $12
    inc  de                                       ; $6199: $13

jr_020_619A:
    ld   a, [hl+]                                 ; $619A: $2A
    ld   [de], a                                  ; $619B: $12
    inc  de                                       ; $619C: $13
    dec  c                                        ; $619D: $0D
    jr   nz, jr_020_616A                          ; $619E: $20 $CA

    ld   a, [$C1B7]                               ; $61A0: $FA $B7 $C1
    cp   $00                                      ; $61A3: $FE $00
    jr   nz, jr_020_6214                          ; $61A5: $20 $6D

    ldh  a, [hJoypadState]                               ; $61A7: $F0 $CC
    and  $01                                      ; $61A9: $E6 $01
    jr   z, jr_020_61C5                           ; $61AB: $28 $18

jr_020_61AD:
    ld   hl, $DB4A                                ; $61AD: $21 $4A $DB
    ld   a, [hl]                                  ; $61B0: $7E
    inc  a                                        ; $61B1: $3C
    cp   $03                                      ; $61B2: $FE $03
    jr   nz, jr_020_61B7                          ; $61B4: $20 $01

    xor  a                                        ; $61B6: $AF

jr_020_61B7:
    ld   [hl], a                                  ; $61B7: $77
    ld   e, a                                     ; $61B8: $5F
    ld   d, $00                                   ; $61B9: $16 $00
    ld   hl, $610E                                ; $61BB: $21 $0E $61
    add  hl, de                                   ; $61BE: $19
    ld   a, [wOcarinaSongFlags]                  ; $61BF: $FA $49 $DB
    and  [hl]                                     ; $61C2: $A6
    jr   z, jr_020_61AD                           ; $61C3: $28 $E8

jr_020_61C5:
    ldh  a, [hJoypadState]                               ; $61C5: $F0 $CC
    and  $02                                      ; $61C7: $E6 $02
    jr   z, jr_020_61E4                           ; $61C9: $28 $19

jr_020_61CB:
    ld   hl, $DB4A                                ; $61CB: $21 $4A $DB
    ld   a, [hl]                                  ; $61CE: $7E
    dec  a                                        ; $61CF: $3D
    cp   $80                                      ; $61D0: $FE $80
    jr   c, jr_020_61D6                           ; $61D2: $38 $02

    ld   a, $02                                   ; $61D4: $3E $02

jr_020_61D6:
    ld   [hl], a                                  ; $61D6: $77
    ld   e, a                                     ; $61D7: $5F
    ld   d, $00                                   ; $61D8: $16 $00
    ld   hl, $610E                                ; $61DA: $21 $0E $61
    add  hl, de                                   ; $61DD: $19
    ld   a, [wOcarinaSongFlags]                  ; $61DE: $FA $49 $DB
    and  [hl]                                     ; $61E1: $A6
    jr   z, jr_020_61CB                           ; $61E2: $28 $E7

jr_020_61E4:
    ldh  a, [hJoypadState]                               ; $61E4: $F0 $CC
    and  $03                                      ; $61E6: $E6 $03
    jr   z, jr_020_61ED                           ; $61E8: $28 $03

    call Func_020_6039                            ; $61EA: $CD $39 $60

jr_020_61ED:
    ld   hl, $C010                                ; $61ED: $21 $10 $C0
    ld   a, $38                                   ; $61F0: $3E $38
    ld   [hl+], a                                 ; $61F2: $22
    push hl                                       ; $61F3: $E5
    ld   a, [$DB4A]                               ; $61F4: $FA $4A $DB
    ld   e, a                                     ; $61F7: $5F
    ld   d, $00                                   ; $61F8: $16 $00
    ld   hl, $610B                                ; $61FA: $21 $0B $61
    add  hl, de                                   ; $61FD: $19
    ld   a, [hl]                                  ; $61FE: $7E
    pop  hl                                       ; $61FF: $E1
    ld   [hl+], a                                 ; $6200: $22
    push af                                       ; $6201: $F5
    ld   a, $28                                   ; $6202: $3E $28
    ld   [hl+], a                                 ; $6204: $22
    ld   a, $06                                   ; $6205: $3E $06
    ld   [hl+], a                                 ; $6207: $22
    ld   a, $38                                   ; $6208: $3E $38
    ld   [hl+], a                                 ; $620A: $22
    pop  af                                       ; $620B: $F1
    add  $08                                      ; $620C: $C6 $08
    ld   [hl+], a                                 ; $620E: $22
    ld   a, $28                                   ; $620F: $3E $28
    ld   [hl+], a                                 ; $6211: $22
    ld   [hl], $26                                ; $6212: $36 $26

label_020_6214:
jr_020_6214:
    ret                                           ; $6214: $C9

Func_020_6215:
    ld   a, [wIsIndoor]                           ; $6215: $FA $A5 $DB
    and  a                                        ; $6218: $A7
    jr   z, jr_020_628D                           ; $6219: $28 $72

    ldh  a, [hMapId]                              ; $621B: $F0 $F7
    cp   $FF                                      ; $621D: $FE $FF
    jr   z, jr_020_6226                           ; $621F: $28 $05

    cp   $08                                      ; $6221: $FE $08
    jp   nc, label_020_628D                       ; $6223: $D2 $8D $62

jr_020_6226:
    ld   a, [$D46B]                               ; $6226: $FA $6B $D4
    and  $F8                                      ; $6229: $E6 $F8
    add  $50                                      ; $622B: $C6 $50
    ld   h, a                                     ; $622D: $67
    ld   a, [$D46B]                               ; $622E: $FA $6B $D4
    rla                                           ; $6231: $17
    rla                                           ; $6232: $17
    rla                                           ; $6233: $17
    and  $38                                      ; $6234: $E6 $38
    add  $60                                      ; $6236: $C6 $60
    ld   l, a                                     ; $6238: $6F
    ld   a, [wMinimapLayout]                               ; $6239: $FA $B0 $DB
    and  $20                                      ; $623C: $E6 $20
    jr   z, jr_020_624D                           ; $623E: $28 $0D

    ld   a, [$D46B]                               ; $6240: $FA $6B $D4
    and  $38                                      ; $6243: $E6 $38
    cp   $20                                      ; $6245: $FE $20
    jr   nc, jr_020_624D                          ; $6247: $30 $04

    ld   a, h                                     ; $6249: $7C
    sub  $08                                      ; $624A: $D6 $08
    ld   h, a                                     ; $624C: $67

jr_020_624D:
    ld   a, [wMinimapLayout]                               ; $624D: $FA $B0 $DB
    and  $10                                      ; $6250: $E6 $10
    jr   z, jr_020_6261                           ; $6252: $28 $0D

    ld   a, [$D46B]                               ; $6254: $FA $6B $D4
    and  $07                                      ; $6257: $E6 $07
    cp   $04                                      ; $6259: $FE $04
    jr   c, jr_020_6261                           ; $625B: $38 $04

    ld   a, l                                     ; $625D: $7D
    add  $08                                      ; $625E: $C6 $08
    ld   l, a                                     ; $6260: $6F

jr_020_6261:
    ld   a, h                                     ; $6261: $7C
    ld   [wOAMBuffer], a                          ; $6262: $EA $00 $C0
    ld   a, l                                     ; $6265: $7D
    ld   [$C001], a                               ; $6266: $EA $01 $C0
    ld   a, $3F                                   ; $6269: $3E $3F
    ld   [$C002], a                               ; $626B: $EA $02 $C0
    ldh  a, [hIsGBC]                              ; $626E: $F0 $FE
    and  a                                        ; $6270: $A7
    jr   z, jr_020_6285                           ; $6271: $28 $12

    ld   a, $01                                   ; $6273: $3E $01
    ld   [$C003], a                               ; $6275: $EA $03 $C0
    ldh  a, [hFrameCounter]                       ; $6278: $F0 $E7
    and  $08                                      ; $627A: $E6 $08
    jr   z, jr_020_628D                           ; $627C: $28 $0F

    ld   a, $04                                   ; $627E: $3E $04
    ld   [$C003], a                               ; $6280: $EA $03 $C0
    jr   jr_020_628D                              ; $6283: $18 $08

jr_020_6285:
    ldh  a, [hFrameCounter]                       ; $6285: $F0 $E7
    rla                                           ; $6287: $17
    and  $10                                      ; $6288: $E6 $10
    ld   [$C003], a                               ; $628A: $EA $03 $C0

label_020_628D:
jr_020_628D:
    ret                                           ; $628D: $C9

    ld   [$0828], sp                              ; $628E: $08 $28 $08
    jr   z, jr_020_629B                           ; $6291: $28 $08

    jr   z, jr_020_629D                           ; $6293: $28 $08

    jr   z, jr_020_629F                           ; $6295: $28 $08

    jr   z, jr_020_62C1                           ; $6297: $28 $28

    jr   z, @+$42                                 ; $6299: $28 $40

jr_020_629B:
    ld   b, b                                     ; $629B: $40
    ld   e, b                                     ; $629C: $58

jr_020_629D:
    ld   e, b                                     ; $629D: $58
    ld   [hl], b                                  ; $629E: $70

jr_020_629F:
    ld   [hl], b                                  ; $629F: $70
    adc  b                                        ; $62A0: $88
    adc  b                                        ; $62A1: $88

Func_020_62A2:
    ld   a, [wInventoryCursorFrameCounter]        ; $62A2: $FA $59 $C1
    inc  a                                        ; $62A5: $3C
    ld   [wInventoryCursorFrameCounter], a        ; $62A6: $EA $59 $C1
    and  $10                                      ; $62A9: $E6 $10
    jr   nz, jr_020_62DD                          ; $62AB: $20 $30

    ld   a, [$DBA3]                               ; $62AD: $FA $A3 $DB
    ld   e, a                                     ; $62B0: $5F
    ld   d, $00                                   ; $62B1: $16 $00
    ld   hl, $6298                                ; $62B3: $21 $98 $62
    add  hl, de                                   ; $62B6: $19
    ld   a, [hl]                                  ; $62B7: $7E
    ld   [$C004], a                               ; $62B8: $EA $04 $C0
    ld   [$C008], a                               ; $62BB: $EA $08 $C0
    ld   hl, $628E                                ; $62BE: $21 $8E $62

jr_020_62C1:
    add  hl, de                                   ; $62C1: $19
    ld   a, [hl]                                  ; $62C2: $7E
    ld   [$C005], a                               ; $62C3: $EA $05 $C0
    add  $20                                      ; $62C6: $C6 $20
    ld   [$C009], a                               ; $62C8: $EA $09 $C0
    ld   a, $BE                                   ; $62CB: $3E $BE
    ld   [$C006], a                               ; $62CD: $EA $06 $C0
    ld   [$C00A], a                               ; $62D0: $EA $0A $C0
    ld   a, $34                                   ; $62D3: $3E $34
    ld   [$C007], a                               ; $62D5: $EA $07 $C0
    ld   a, $14                                   ; $62D8: $3E $14
    ld   [$C00B], a                               ; $62DA: $EA $0B $C0

jr_020_62DD:
    ret                                           ; $62DD: $C9

Func_020_62DE:
    ld   a, [$DE09]                               ; $62DE: $FA $09 $DE
    ld   b, a                                     ; $62E1: $47
    ld   a, [$DE08]                               ; $62E2: $FA $08 $DE
    inc  a                                        ; $62E5: $3C
    ld   [$DE08], a                               ; $62E6: $EA $08 $DE
    cp   $10                                      ; $62E9: $FE $10
    jr   c, jr_020_62F2                           ; $62EB: $38 $05

    xor  a                                        ; $62ED: $AF
    ld   [$DE08], a                               ; $62EE: $EA $08 $DE
    inc  b                                        ; $62F1: $04

jr_020_62F2:
    ld   a, b                                     ; $62F2: $78
    ld   [$DE09], a                               ; $62F3: $EA $09 $DE
    ldh  [hFreeWarpDataAddress], a                ; $62F6: $E0 $E6
    ld   hl, $C050                                ; $62F8: $21 $50 $C0
    ld   b, $4A                                   ; $62FB: $06 $4A
    ld   c, $53                                   ; $62FD: $0E $53
    ld   d, $08                                   ; $62FF: $16 $08
    ld   a, $90                                   ; $6301: $3E $90
    ld   [hl+], a                                 ; $6303: $22
    ld   a, c                                     ; $6304: $79
    ld   [hl+], a                                 ; $6305: $22
    add  $08                                      ; $6306: $C6 $08
    ld   c, a                                     ; $6308: $4F
    ld   a, b                                     ; $6309: $78
    inc  b                                        ; $630A: $04
    inc  b                                        ; $630B: $04
    ld   [hl+], a                                 ; $630C: $22
    ld   a, $26                                   ; $630D: $3E $26
    ld   [hl+], a                                 ; $630F: $22
    ldh  a, [hFreeWarpDataAddress]                ; $6310: $F0 $E6
    and  $03                                      ; $6312: $E6 $03
    jr   nz, jr_020_631A                          ; $6314: $20 $04

    ld   c, $9B                                   ; $6316: $0E $9B
    jr   jr_020_632E                              ; $6318: $18 $14

jr_020_631A:
    ld   a, $90                                   ; $631A: $3E $90
    ld   [hl+], a                                 ; $631C: $22
    ld   a, c                                     ; $631D: $79
    ld   [hl+], a                                 ; $631E: $22
    add  $08                                      ; $631F: $C6 $08
    ld   c, a                                     ; $6321: $4F
    ld   a, b                                     ; $6322: $78
    ld   [hl+], a                                 ; $6323: $22
    inc  b                                        ; $6324: $04
    inc  b                                        ; $6325: $04
    ld   a, $06                                   ; $6326: $3E $06
    ld   [hl+], a                                 ; $6328: $22
    dec  d                                        ; $6329: $15
    ld   a, d                                     ; $632A: $7A
    and  a                                        ; $632B: $A7
    jr   nz, jr_020_631A                          ; $632C: $20 $EC

jr_020_632E:
    ld   a, $90                                   ; $632E: $3E $90
    ld   [hl+], a                                 ; $6330: $22
    ld   a, c                                     ; $6331: $79
    ld   [hl+], a                                 ; $6332: $22
    ld   a, $4A                                   ; $6333: $3E $4A
    ld   [hl+], a                                 ; $6335: $22
    ld   a, $26                                   ; $6336: $3E $26
    ld   [hl], a                                  ; $6338: $77
    ret                                           ; $6339: $C9

    db   $10                                      ; $633A: $10
    jr   c, jr_020_634D                           ; $633B: $38 $10

    jr   nc, jr_020_634F                          ; $633D: $30 $10

    jr   nc, jr_020_6351                          ; $633F: $30 $10

    jr   nc, @+$12                                ; $6341: $30 $10

    jr   nc, jr_020_6355                          ; $6343: $30 $10

    jr   nc, jr_020_6355                          ; $6345: $30 $0E

    ld   c, $26                                   ; $6347: $0E $26
    ld   h, $3E                                   ; $6349: $26 $3E
    ld   a, $56                                   ; $634B: $3E $56

jr_020_634D:
    ld   d, [hl]                                  ; $634D: $56
    ld   l, [hl]                                  ; $634E: $6E

jr_020_634F:
    ld   l, [hl]                                  ; $634F: $6E
    add  [hl]                                     ; $6350: $86

jr_020_6351:
    add  [hl]                                     ; $6351: $86

Func_020_6352::
    ld   a, [wBGPalette]                          ; $6352: $FA $97 $DB

jr_020_6355:
    cp   $E4                                      ; $6355: $FE $E4
    ret  c                                        ; $6357: $D8

    ld   d, $02                                   ; $6358: $16 $02
    jr   jr_020_635E                              ; $635A: $18 $02

Func_020_635C:
    ld   d, $0C                                   ; $635C: $16 $0C

jr_020_635E:
    ld   hl, wAButtonSlot                         ; $635E: $21 $00 $DB
    ld   e, $00                                   ; $6361: $1E $00

jr_020_6363:
    ld   a, [hl+]                                 ; $6363: $2A
    cp   $01                                      ; $6364: $FE $01
    jr   z, jr_020_636E                           ; $6366: $28 $06

    inc  e                                        ; $6368: $1C
    ld   a, e                                     ; $6369: $7B
    cp   d                                        ; $636A: $BA
    jr   nz, jr_020_6363                          ; $636B: $20 $F6

    ret                                           ; $636D: $C9

jr_020_636E:
    ld   d, $00                                   ; $636E: $16 $00
    ld   hl, $633A                                ; $6370: $21 $3A $63
    add  hl, de                                   ; $6373: $19
    ld   a, [hl]                                  ; $6374: $7E
    ldh  [hScratch0], a                           ; $6375: $E0 $D7
    ld   hl, $6346                                ; $6377: $21 $46 $63
    add  hl, de                                   ; $637A: $19
    ld   a, [hl]                                  ; $637B: $7E
    ldh  [hScratch1], a                           ; $637C: $E0 $D8
    ld   a, [wActivePowerUp]                      ; $637E: $FA $7C $D4
    dec  a                                        ; $6381: $3D
    jr   nz, jr_020_63BE                          ; $6382: $20 $3A

    ldh  a, [hFrameCounter]                       ; $6384: $F0 $E7
    and  $08                                      ; $6386: $E6 $08
    jr   nz, jr_020_63BE                          ; $6388: $20 $34

    ld   a, [$C3C0]                               ; $638A: $FA $C0 $C3
    ld   e, a                                     ; $638D: $5F
    ld   d, $00                                   ; $638E: $16 $00
    ld   hl, $C030                                ; $6390: $21 $30 $C0
    ld   a, [wGameplayType]                       ; $6393: $FA $95 $DB
    cp   $0C                                      ; $6396: $FE $0C
    jr   nz, jr_020_63A1                          ; $6398: $20 $07

    ld   a, [wGameplaySubtype]                    ; $639A: $FA $96 $DB
    cp   $02                                      ; $639D: $FE $02
    jr   nc, jr_020_63A2                          ; $639F: $30 $01

jr_020_63A1:
    add  hl, de                                   ; $63A1: $19

jr_020_63A2:
    ld   a, [$C1B5]                               ; $63A2: $FA $B5 $C1
    and  a                                        ; $63A5: $A7
    jr   z, jr_020_63AB                           ; $63A6: $28 $03

    ld   hl, $C09C                                ; $63A8: $21 $9C $C0

jr_020_63AB:
    ld   a, [wWindowY]                            ; $63AB: $FA $9A $DB
    push hl                                       ; $63AE: $E5
    ld   hl, hScratch1                            ; $63AF: $21 $D8 $FF
    add  [hl]                                     ; $63B2: $86
    pop  hl                                       ; $63B3: $E1
    ld   [hl+], a                                 ; $63B4: $22
    ldh  a, [hScratch0]                           ; $63B5: $F0 $D7
    ld   [hl+], a                                 ; $63B7: $22
    ld   a, $04                                   ; $63B8: $3E $04
    ld   [hl+], a                                 ; $63BA: $22
    ld   a, $54                                   ; $63BB: $3E $54
    ld   [hl+], a                                 ; $63BD: $22

jr_020_63BE:
    ld   a, $01                                   ; $63BE: $3E $01
    call label_3DA0                               ; $63C0: $CD $A0 $3D
    ret                                           ; $63C3: $C9

    call Func_020_5EB5                            ; $63C4: $CD $B5 $5E
    call Func_020_6215                            ; $63C7: $CD $15 $62
    call Func_020_5F06                            ; $63CA: $CD $06 $5F
    call $6111                                    ; $63CD: $CD $11 $61
    call Func_020_62A2                            ; $63D0: $CD $A2 $62
    call Func_020_635C                            ; $63D3: $CD $5C $63
    call Func_020_62DE                            ; $63D6: $CD $DE $62
    ld   a, [$C1BA]                               ; $63D9: $FA $BA $C1
    and  a                                        ; $63DC: $A7
    jr   z, jr_020_63F5                           ; $63DD: $28 $16

    ld   a, [wGameplaySubtype]                    ; $63DF: $FA $96 $DB
    cp   $0C                                      ; $63E2: $FE $0C
    jr   nz, jr_020_6445                          ; $63E4: $20 $5F

    xor  a                                        ; $63E6: $AF
    ld   [$C1BA], a                               ; $63E7: $EA $BA $C1
    ld   [$C1B5], a                               ; $63EA: $EA $B5 $C1
    ld   [$C1B8], a                               ; $63ED: $EA $B8 $C1
    ld   [$C1B9], a                               ; $63F0: $EA $B9 $C1
    jr   jr_020_6436                              ; $63F3: $18 $41

jr_020_63F5:
    ldh  a, [hJoypadState]                               ; $63F5: $F0 $CC
    and  $40                                      ; $63F7: $E6 $40
    jr   z, jr_020_641E                           ; $63F9: $28 $23

    ld   a, $09                                   ; $63FB: $3E $09
    ld   [wGameplaySubtype], a                    ; $63FD: $EA $96 $DB
    ld   a, $90                                   ; $6400: $3E $90
    ld   [$DE0A], a                               ; $6402: $EA $0A $DE
    ld   a, [$0005]                               ; $6405: $FA $05 $00
    and  a                                        ; $6408: $A7
    jr   z, jr_020_641C                           ; $6409: $28 $11

    ld   a, [wFreeMovementMode]                   ; $640B: $FA $7B $C1
    xor  $01                                      ; $640E: $EE $01
    ld   [wFreeMovementMode], a                   ; $6410: $EA $7B $C1
    ld   a, $01                                   ; $6413: $3E $01
    ld   [wPhotos1], a                            ; $6415: $EA $0C $DC
    xor  a                                        ; $6418: $AF
    ld   [wPhotos2], a                            ; $6419: $EA $0D $DC

jr_020_641C:
    jr   jr_020_6445                              ; $641C: $18 $27

jr_020_641E:
    ld   a, [$C1B5]                               ; $641E: $FA $B5 $C1
    ld   hl, $C1B8                                ; $6421: $21 $B8 $C1
    or   [hl]                                     ; $6424: $B6
    ld   hl, $C1B9                                ; $6425: $21 $B9 $C1
    or   [hl]                                     ; $6428: $B6
    jr   nz, jr_020_6445                          ; $6429: $20 $1A

    ldh  a, [hJoypadState]                               ; $642B: $F0 $CC
    and  $80                                      ; $642D: $E6 $80
    jr   z, jr_020_6445                           ; $642F: $28 $14

    ld   a, $0C                                   ; $6431: $3E $0C
    ld   [wGameplaySubtype], a                    ; $6433: $EA $96 $DB

jr_020_6436:
    xor  a                                        ; $6436: $AF
    ld   [wTransitionSequenceCounter], a          ; $6437: $EA $6B $C1
    ld   [wC16C], a                               ; $643A: $EA $6C $C1
    inc  a                                        ; $643D: $3C
    ld   [wPaletteUnknownE], a                    ; $643E: $EA $D5 $DD
    ld   a, $12                                   ; $6441: $3E $12
    ldh  [hJingle], a                             ; $6443: $E0 $F2

jr_020_6445:
    ret                                           ; $6445: $C9

Func_020_6446:
jr_020_6446:
    ldh  a, [$FFE2]                               ; $6446: $F0 $E2
    ld   [hl+], a                                 ; $6448: $22
    ldh  a, [hBGMapOffsetLow]                     ; $6449: $F0 $E1
    ld   [hl+], a                                 ; $644B: $22
    add  $08                                      ; $644C: $C6 $08
    ldh  [hBGMapOffsetLow], a                     ; $644E: $E0 $E1
    ld   a, [de]                                  ; $6450: $1A
    ld   [hl+], a                                 ; $6451: $22
    inc  de                                       ; $6452: $13
    ld   a, [de]                                  ; $6453: $1A
    ld   [hl+], a                                 ; $6454: $22
    inc  de                                       ; $6455: $13
    dec  c                                        ; $6456: $0D
    ld   a, c                                     ; $6457: $79
    and  a                                        ; $6458: $A7
    jr   nz, jr_020_6446                          ; $6459: $20 $EB

    ret                                           ; $645B: $C9

    ld   b, b                                     ; $645C: $40
    dec  b                                        ; $645D: $05
    ld   b, b                                     ; $645E: $40
    dec  h                                        ; $645F: $25
    ld   e, h                                     ; $6460: $5C
    inc  bc                                       ; $6461: $03
    ld   e, [hl]                                  ; $6462: $5E
    inc  bc                                       ; $6463: $03
    ld   b, b                                     ; $6464: $40
    ld   b, $40                                   ; $6465: $06 $40
    ld   h, $60                                   ; $6467: $26 $60
    inc  bc                                       ; $6469: $03
    ld   h, d                                     ; $646A: $62
    inc  bc                                       ; $646B: $03
    ld   b, b                                     ; $646C: $40
    rlca                                          ; $646D: $07
    ld   b, b                                     ; $646E: $40
    daa                                           ; $646F: $27
    ld   h, h                                     ; $6470: $64
    inc  bc                                       ; $6471: $03
    ld   a, [hl]                                  ; $6472: $7E
    inc  bc                                       ; $6473: $03
    ld   e, h                                     ; $6474: $5C
    ld   h, h                                     ; $6475: $64
    ld   h, h                                     ; $6476: $64
    ld   h, h                                     ; $6477: $64
    ld   l, h                                     ; $6478: $6C
    ld   h, h                                     ; $6479: $64
    ld   b, d                                     ; $647A: $42
    ld   b, $42                                   ; $647B: $06 $42
    ld   h, $66                                   ; $647D: $26 $66
    inc  bc                                       ; $647F: $03
    ld   a, d                                     ; $6480: $7A
    inc  bc                                       ; $6481: $03
    ld   l, [hl]                                  ; $6482: $6E
    inc  bc                                       ; $6483: $03
    ld   b, [hl]                                  ; $6484: $46
    ld   b, $42                                   ; $6485: $06 $42
    ld   h, $68                                   ; $6487: $26 $68
    inc  bc                                       ; $6489: $03
    ld   a, d                                     ; $648A: $7A
    inc  bc                                       ; $648B: $03
    ld   l, [hl]                                  ; $648C: $6E
    inc  bc                                       ; $648D: $03
    ld   b, h                                     ; $648E: $44
    ld   b, $42                                   ; $648F: $06 $42
    ld   h, $6A                                   ; $6491: $26 $6A
    inc  bc                                       ; $6493: $03
    ld   a, d                                     ; $6494: $7A
    inc  bc                                       ; $6495: $03
    ld   l, [hl]                                  ; $6496: $6E
    inc  bc                                       ; $6497: $03
    ld   b, h                                     ; $6498: $44
    ld   b, $46                                   ; $6499: $06 $46
    ld   h, $6C                                   ; $649B: $26 $6C
    inc  bc                                       ; $649D: $03
    ld   a, d                                     ; $649E: $7A
    inc  bc                                       ; $649F: $03
    ld   l, [hl]                                  ; $64A0: $6E
    inc  bc                                       ; $64A1: $03
    ld   a, d                                     ; $64A2: $7A
    ld   h, h                                     ; $64A3: $64
    add  h                                        ; $64A4: $84
    ld   h, h                                     ; $64A5: $64
    adc  [hl]                                     ; $64A6: $8E
    ld   h, h                                     ; $64A7: $64
    sbc  b                                        ; $64A8: $98
    ld   h, h                                     ; $64A9: $64
    ld   a, h                                     ; $64AA: $7C
    inc  bc                                       ; $64AB: $03
    ld   c, b                                     ; $64AC: $48
    inc  bc                                       ; $64AD: $03
    ld   c, b                                     ; $64AE: $48
    inc  hl                                       ; $64AF: $23
    ld   h, [hl]                                  ; $64B0: $66
    inc  bc                                       ; $64B1: $03
    ld   h, [hl]                                  ; $64B2: $66
    inc  bc                                       ; $64B3: $03
    ld   h, [hl]                                  ; $64B4: $66
    inc  bc                                       ; $64B5: $03
    ld   l, b                                     ; $64B6: $68
    inc  bc                                       ; $64B7: $03
    ld   h, [hl]                                  ; $64B8: $66
    inc  bc                                       ; $64B9: $03
    ld   l, d                                     ; $64BA: $6A
    inc  bc                                       ; $64BB: $03
    ld   h, [hl]                                  ; $64BC: $66
    inc  bc                                       ; $64BD: $03
    ld   l, h                                     ; $64BE: $6C
    inc  bc                                       ; $64BF: $03
    ld   h, [hl]                                  ; $64C0: $66
    inc  bc                                       ; $64C1: $03
    ld   l, [hl]                                  ; $64C2: $6E
    inc  bc                                       ; $64C3: $03
    ld   h, [hl]                                  ; $64C4: $66
    inc  bc                                       ; $64C5: $03
    ld   [hl], b                                  ; $64C6: $70
    inc  bc                                       ; $64C7: $03
    ld   h, [hl]                                  ; $64C8: $66
    inc  bc                                       ; $64C9: $03
    ld   [hl], d                                  ; $64CA: $72
    inc  bc                                       ; $64CB: $03
    ld   h, [hl]                                  ; $64CC: $66
    inc  bc                                       ; $64CD: $03
    ld   [hl], h                                  ; $64CE: $74
    inc  bc                                       ; $64CF: $03
    ld   h, [hl]                                  ; $64D0: $66
    inc  bc                                       ; $64D1: $03
    db   $76                                      ; $64D2: $76
    inc  bc                                       ; $64D3: $03
    ld   h, [hl]                                  ; $64D4: $66
    inc  bc                                       ; $64D5: $03
    ld   a, b                                     ; $64D6: $78
    inc  bc                                       ; $64D7: $03
    ld   l, b                                     ; $64D8: $68
    inc  bc                                       ; $64D9: $03
    ld   h, [hl]                                  ; $64DA: $66
    inc  bc                                       ; $64DB: $03
    ld   l, b                                     ; $64DC: $68
    inc  bc                                       ; $64DD: $03
    ld   l, b                                     ; $64DE: $68
    inc  bc                                       ; $64DF: $03
    ld   l, b                                     ; $64E0: $68
    inc  bc                                       ; $64E1: $03
    ld   l, d                                     ; $64E2: $6A
    inc  bc                                       ; $64E3: $03
    ld   a, d                                     ; $64E4: $7A
    inc  bc                                       ; $64E5: $03
    ld   l, b                                     ; $64E6: $68
    inc  bc                                       ; $64E7: $03
    ld   l, d                                     ; $64E8: $6A
    inc  bc                                       ; $64E9: $03
    ld   a, h                                     ; $64EA: $7C
    inc  bc                                       ; $64EB: $03
    ld   a, h                                     ; $64EC: $7C
    inc  bc                                       ; $64ED: $03

Func_020_64EE:
    ld   hl, $C010                                ; $64EE: $21 $10 $C0
    ld   a, $53                                   ; $64F1: $3E $53
    ldh  [hBGMapOffsetLow], a                     ; $64F3: $E0 $E1
    ld   a, [$DE0A]                               ; $64F5: $FA $0A $DE
    ldh  [$FFE2], a                               ; $64F8: $E0 $E2
    push hl                                       ; $64FA: $E5
    ld   c, $04                                   ; $64FB: $0E $04
    ld   hl, $6474                                ; $64FD: $21 $74 $64
    ld   a, [wTunicType]                          ; $6500: $FA $0F $DC
    sla  a                                        ; $6503: $CB $27
    ld   e, a                                     ; $6505: $5F
    ld   d, $00                                   ; $6506: $16 $00
    add  hl, de                                   ; $6508: $19
    ld   e, [hl]                                  ; $6509: $5E
    inc  hl                                       ; $650A: $23
    ld   d, [hl]                                  ; $650B: $56
    pop  hl                                       ; $650C: $E1
    call Func_020_6446                            ; $650D: $CD $46 $64
    ldh  a, [$FFE2]                               ; $6510: $F0 $E2
    ld   [hl+], a                                 ; $6512: $22
    ldh  a, [hBGMapOffsetLow]                     ; $6513: $F0 $E1
    ld   [hl+], a                                 ; $6515: $22
    add  $08                                      ; $6516: $C6 $08
    ldh  [hBGMapOffsetLow], a                     ; $6518: $E0 $E1
    ld   a, $7C                                   ; $651A: $3E $7C
    ld   [hl+], a                                 ; $651C: $22
    ld   a, $03                                   ; $651D: $3E $03
    ld   [hl+], a                                 ; $651F: $22
    push hl                                       ; $6520: $E5
    ld   c, $06                                   ; $6521: $0E $06
    ld   de, $64A2                                ; $6523: $11 $A2 $64
    ld   h, $00                                   ; $6526: $26 $00
    ld   a, [wHeartPiecesCount]                   ; $6528: $FA $5C $DB
    sla  a                                        ; $652B: $CB $27
    ld   l, a                                     ; $652D: $6F
    add  hl, de                                   ; $652E: $19
    ld   e, [hl]                                  ; $652F: $5E
    inc  hl                                       ; $6530: $23
    ld   d, [hl]                                  ; $6531: $56
    pop  hl                                       ; $6532: $E1
    call Func_020_6446                            ; $6533: $CD $46 $64
    ld   a, $53                                   ; $6536: $3E $53
    ldh  [hBGMapOffsetLow], a                     ; $6538: $E0 $E1
    ld   a, [$DE0A]                               ; $653A: $FA $0A $DE
    add  $10                                      ; $653D: $C6 $10
    ldh  [$FFE2], a                               ; $653F: $E0 $E2
    ld   c, $03                                   ; $6541: $0E $03
    ld   de, $64AA                                ; $6543: $11 $AA $64
    call Func_020_6446                            ; $6546: $CD $46 $64
    ld   e, $00                                   ; $6549: $1E $00
    ld   a, [wPhotos1]                            ; $654B: $FA $0C $DC

jr_020_654E:
    bit  0, a                                     ; $654E: $CB $47
    jr   z, jr_020_6553                           ; $6550: $28 $01

    inc  e                                        ; $6552: $1C

jr_020_6553:
    srl  a                                        ; $6553: $CB $3F
    and  a                                        ; $6555: $A7
    jr   nz, jr_020_654E                          ; $6556: $20 $F6

    ld   a, [wPhotos2]                            ; $6558: $FA $0D $DC
    and  $0F                                      ; $655B: $E6 $0F

jr_020_655D:
    bit  0, a                                     ; $655D: $CB $47
    jr   z, jr_020_6562                           ; $655F: $28 $01

    inc  e                                        ; $6561: $1C

jr_020_6562:
    srl  a                                        ; $6562: $CB $3F
    and  a                                        ; $6564: $A7
    jr   nz, jr_020_655D                          ; $6565: $20 $F6

    ld   d, $00                                   ; $6567: $16 $00
    sla  e                                        ; $6569: $CB $23
    sla  e                                        ; $656B: $CB $23
    push hl                                       ; $656D: $E5
    ld   c, $02                                   ; $656E: $0E $02
    ld   hl, $64B0                                ; $6570: $21 $B0 $64
    add  hl, de                                   ; $6573: $19
    push hl                                       ; $6574: $E5
    pop  de                                       ; $6575: $D1
    pop  hl                                       ; $6576: $E1
    call Func_020_6446                            ; $6577: $CD $46 $64
    ld   c, $05                                   ; $657A: $0E $05
    ld   de, $64E4                                ; $657C: $11 $E4 $64
    call Func_020_6446                            ; $657F: $CD $46 $64
    ret                                           ; $6582: $C9

    call Func_020_5EB5                            ; $6583: $CD $B5 $5E
    call Func_020_64EE                            ; $6586: $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ; $6589: $F0 $CB
    and  $40                                      ; $658B: $E6 $40
    jr   nz, jr_020_6596                          ; $658D: $20 $07

    ld   a, $0B                                   ; $658F: $3E $0B
    ld   [wGameplaySubtype], a                    ; $6591: $EA $96 $DB
    jr   jr_020_65A7                              ; $6594: $18 $11

jr_020_6596:
    ld   a, [$DE0A]                               ; $6596: $FA $0A $DE
    sub  $04                                      ; $6599: $D6 $04
    cp   $78                                      ; $659B: $FE $78
    jr   nc, jr_020_65A4                          ; $659D: $30 $05

    call Func_020_6683                            ; $659F: $CD $83 $66
    ld   a, $78                                   ; $65A2: $3E $78

jr_020_65A4:
    ld   [$DE0A], a                               ; $65A4: $EA $0A $DE

jr_020_65A7:
    ret                                           ; $65A7: $C9

    call Func_020_5EB5                            ; $65A8: $CD $B5 $5E
    call Func_020_64EE                            ; $65AB: $CD $EE $64
    ldh  a, [hPressedButtonsMask]                 ; $65AE: $F0 $CB
    and  $40                                      ; $65B0: $E6 $40
    jr   nz, jr_020_65B7                          ; $65B2: $20 $03

    call Func_020_6683                            ; $65B4: $CD $83 $66

jr_020_65B7:
    ret                                           ; $65B7: $C9

    call Func_020_5EB5                            ; $65B8: $CD $B5 $5E
    call Func_020_64EE                            ; $65BB: $CD $EE $64
    ld   a, [$DE0A]                               ; $65BE: $FA $0A $DE
    add  $04                                      ; $65C1: $C6 $04
    cp   $90                                      ; $65C3: $FE $90
    jr   c, jr_020_65CE                           ; $65C5: $38 $07

    ld   a, $08                                   ; $65C7: $3E $08
    ld   [wGameplaySubtype], a                    ; $65C9: $EA $96 $DB
    ld   a, $90                                   ; $65CC: $3E $90

jr_020_65CE:
    ld   [$DE0A], a                               ; $65CE: $EA $0A $DE
    ret                                           ; $65D1: $C9

    call Func_020_635C                            ; $65D2: $CD $5C $63
    call label_1A22                               ; $65D5: $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ; $65D8: $FA $6B $C1
    cp   $04                                      ; $65DB: $FE $04
    jp   nz, label_020_6682                       ; $65DD: $C2 $82 $66

    ld   a, $01                                   ; $65E0: $3E $01
    ld   [wPaletteUnknownE], a                    ; $65E2: $EA $D5 $DD
    xor  a                                        ; $65E5: $AF
    ld   [$C50A], a                               ; $65E6: $EA $0A $C5
    ld   [wC116], a                               ; $65E9: $EA $16 $C1
    ldh  [hBaseScrollX], a                        ; $65EC: $E0 $96
    ldh  [hBaseScrollY], a                        ; $65EE: $E0 $97
    ld   [wC167], a                               ; $65F0: $EA $67 $C1
    ld   [wInventoryAppearing], a                 ; $65F3: $EA $4F $C1
    ld   a, $07                                   ; $65F6: $3E $07
    ldh  [hWindowYUnused], a                      ; $65F8: $E0 $A9
    ld   a, $70                                   ; $65FA: $3E $70
    ldh  [hWindowXUnused], a                      ; $65FC: $E0 $AA
    ld   a, $0B                                   ; $65FE: $3E $0B
    ld   [wGameplayType], a                       ; $6600: $EA $95 $DB
    ldh  [hFFBC], a                               ; $6603: $E0 $BC
    ld   a, $02                                   ; $6605: $3E $02
    ld   [wGameplaySubtype], a                    ; $6607: $EA $96 $DB
    ld   a, [wIsIndoor]                           ; $660A: $FA $A5 $DB
    and  a                                        ; $660D: $A7
    ld   a, $06                                   ; $660E: $3E $06
    jr   nz, jr_020_6628                          ; $6610: $20 $16

    ldh  a, [hMapRoom]                            ; $6612: $F0 $F6
    cp   $64                                      ; $6614: $FE $64
    jr   nz, jr_020_6626                          ; $6616: $20 $0E

    ld   hl, $C193                                ; $6618: $21 $93 $C1
    ld   [hl], $A4                                ; $661B: $36 $A4
    inc  hl                                       ; $661D: $23
    ld   [hl], $E5                                ; $661E: $36 $E5
    inc  hl                                       ; $6620: $23
    ld   [hl], $82                                ; $6621: $36 $82
    inc  hl                                       ; $6623: $23
    ld   [hl], $A2                                ; $6624: $36 $A2

jr_020_6626:
    ld   a, $07                                   ; $6626: $3E $07

jr_020_6628:
    ld   [wTileMapToLoad], a                      ; $6628: $EA $FE $D6
    ld   hl, wRoomTransitionState                 ; $662B: $21 $24 $C1
    ld   e, $00                                   ; $662E: $1E $00

jr_020_6630:
    xor  a                                        ; $6630: $AF
    ld   [hl+], a                                 ; $6631: $22
    inc  e                                        ; $6632: $1C
    ld   a, e                                     ; $6633: $7B
    cp   $0C                                      ; $6634: $FE $0C
    jr   nz, jr_020_6630                          ; $6636: $20 $F8

    ld   a, $80                                   ; $6638: $3E $80
    ld   [wWindowY], a                            ; $663A: $EA $9A $DB
    ld   a, $07                                   ; $663D: $3E $07
    ld   [rWX], a                                 ; $663F: $E0 $4B
    ld   a, $08                                   ; $6641: $3E $08
    ld   [$C150], a                               ; $6643: $EA $50 $C1
    ld   a, $07                                   ; $6646: $3E $07
    ldh  [hWindowYUnused], a                      ; $6648: $E0 $A9
    ld   a, $70                                   ; $664A: $3E $70
    ldh  [hWindowXUnused], a                      ; $664C: $E0 $AA
    ldh  a, [hIsGBC]                              ; $664E: $F0 $FE
    and  a                                        ; $6650: $A7
    jr   z, jr_020_6682                           ; $6651: $28 $2F

    ld   hl, $DC10                                ; $6653: $21 $10 $DC
    ld   c, $80                                   ; $6656: $0E $80
    di                                            ; $6658: $F3

jr_020_6659:
    ld   a, $03                                   ; $6659: $3E $03
    ld   [rSVBK], a                               ; $665B: $E0 $70
    ld   b, [hl]                                  ; $665D: $46
    dec  a                                        ; $665E: $3D
    ld   [rSVBK], a                               ; $665F: $E0 $70
    ld   [hl], b                                  ; $6661: $70
    inc  hl                                       ; $6662: $23
    dec  c                                        ; $6663: $0D
    ld   a, c                                     ; $6664: $79
    and  a                                        ; $6665: $A7
    jr   nz, jr_020_6659                          ; $6666: $20 $F1

    xor  a                                        ; $6668: $AF
    ld   [rSVBK], a                               ; $6669: $E0 $70
    ld   a, [wLCDControl]                         ; $666B: $FA $FD $D6
    and  $7F                                      ; $666E: $E6 $7F
    ld   [rLCDC], a                               ; $6670: $E0 $40
    ldh  a, [hMapId]                              ; $6672: $F0 $F7
    cp   $FF                                      ; $6674: $FE $FF
    jr   nz, jr_020_667C                          ; $6676: $20 $04

    ld   a, $01                                   ; $6678: $3E $01
    ldh  [hNeedsUpdatingEnnemiesTiles], a         ; $667A: $E0 $91

jr_020_667C:
    ld   a, [wLCDControl]                         ; $667C: $FA $FD $D6
    ld   [rLCDC], a                               ; $667F: $E0 $40
    ei                                            ; $6681: $FB

label_020_6682:
jr_020_6682:
    ret                                           ; $6682: $C9

Func_020_6683:
    ld   hl, wGameplaySubtype                     ; $6683: $21 $96 $DB
    inc  [hl]                                     ; $6686: $34
    ret                                           ; $6687: $C9

    nop                                           ; $6688: $00
    ld   [$0248], sp                              ; $6689: $08 $48 $02
    nop                                           ; $668C: $00
    nop                                           ; $668D: $00
    ld   b, b                                     ; $668E: $40
    ld   [bc], a                                  ; $668F: $02
    nop                                           ; $6690: $00
    nop                                           ; $6691: $00
    rst  $38                                      ; $6692: $FF
    rst  $38                                      ; $6693: $FF
    nop                                           ; $6694: $00
    ld   [$024A], sp                              ; $6695: $08 $4A $02
    nop                                           ; $6698: $00
    nop                                           ; $6699: $00
    ld   c, h                                     ; $669A: $4C
    ld   [bc], a                                  ; $669B: $02
    nop                                           ; $669C: $00
    nop                                           ; $669D: $00
    rst  $38                                      ; $669E: $FF
    rst  $38                                      ; $669F: $FF
    nop                                           ; $66A0: $00
    nop                                           ; $66A1: $00
    ld   c, d                                     ; $66A2: $4A
    ld   [hl+], a                                 ; $66A3: $22
    nop                                           ; $66A4: $00
    ld   [$224C], sp                              ; $66A5: $08 $4C $22
    nop                                           ; $66A8: $00
    ld   [$FFFF], sp                              ; $66A9: $08 $FF $FF
    nop                                           ; $66AC: $00
    nop                                           ; $66AD: $00
    ld   c, b                                     ; $66AE: $48
    ld   [hl+], a                                 ; $66AF: $22
    nop                                           ; $66B0: $00
    ld   [$2240], sp                              ; $66B1: $08 $40 $22
    nop                                           ; $66B4: $00
    ld   [$FFFF], sp                              ; $66B5: $08 $FF $FF
    nop                                           ; $66B8: $00
    inc  c                                        ; $66B9: $0C
    ld   b, h                                     ; $66BA: $44
    ld   [bc], a                                  ; $66BB: $02
    nop                                           ; $66BC: $00
    inc  b                                        ; $66BD: $04
    ld   b, [hl]                                  ; $66BE: $46
    ld   [bc], a                                  ; $66BF: $02
    nop                                           ; $66C0: $00
    db   $fc                                      ; $66C1: $FC
    ld   b, b                                     ; $66C2: $40
    ld   [bc], a                                  ; $66C3: $02
    nop                                           ; $66C4: $00
    db   $fc                                      ; $66C5: $FC
    ld   b, h                                     ; $66C6: $44
    ld   [hl+], a                                 ; $66C7: $22
    nop                                           ; $66C8: $00
    inc  b                                        ; $66C9: $04
    ld   b, [hl]                                  ; $66CA: $46
    ld   [hl+], a                                 ; $66CB: $22
    nop                                           ; $66CC: $00
    inc  c                                        ; $66CD: $0C
    ld   b, b                                     ; $66CE: $40
    ld   [hl+], a                                 ; $66CF: $22
    nop                                           ; $66D0: $00
    db   $fc                                      ; $66D1: $FC
    ld   b, h                                     ; $66D2: $44
    ld   [hl+], a                                 ; $66D3: $22
    nop                                           ; $66D4: $00
    inc  b                                        ; $66D5: $04
    ld   b, d                                     ; $66D6: $42
    ld   [hl+], a                                 ; $66D7: $22
    nop                                           ; $66D8: $00
    inc  c                                        ; $66D9: $0C
    ld   b, b                                     ; $66DA: $40
    ld   [hl+], a                                 ; $66DB: $22
    nop                                           ; $66DC: $00
    inc  c                                        ; $66DD: $0C
    ld   b, h                                     ; $66DE: $44
    ld   [bc], a                                  ; $66DF: $02
    nop                                           ; $66E0: $00
    inc  b                                        ; $66E1: $04
    ld   b, d                                     ; $66E2: $42
    ld   [bc], a                                  ; $66E3: $02
    nop                                           ; $66E4: $00
    db   $fc                                      ; $66E5: $FC
    ld   b, b                                     ; $66E6: $40
    ld   [bc], a                                  ; $66E7: $02
    nop                                           ; $66E8: $00
    ld   [$0048], sp                              ; $66E9: $08 $48 $00
    nop                                           ; $66EC: $00
    nop                                           ; $66ED: $00
    ld   b, b                                     ; $66EE: $40
    nop                                           ; $66EF: $00
    nop                                           ; $66F0: $00
    nop                                           ; $66F1: $00
    rst  $38                                      ; $66F2: $FF
    rst  $38                                      ; $66F3: $FF
    nop                                           ; $66F4: $00
    ld   [$004A], sp                              ; $66F5: $08 $4A $00
    nop                                           ; $66F8: $00
    nop                                           ; $66F9: $00
    ld   c, h                                     ; $66FA: $4C
    nop                                           ; $66FB: $00
    nop                                           ; $66FC: $00
    nop                                           ; $66FD: $00
    rst  $38                                      ; $66FE: $FF
    rst  $38                                      ; $66FF: $FF
    nop                                           ; $6700: $00
    nop                                           ; $6701: $00
    ld   c, d                                     ; $6702: $4A
    jr   nz, jr_020_6705                          ; $6703: $20 $00

jr_020_6705:
    ld   [$204C], sp                              ; $6705: $08 $4C $20
    nop                                           ; $6708: $00
    ld   [$FFFF], sp                              ; $6709: $08 $FF $FF
    nop                                           ; $670C: $00
    nop                                           ; $670D: $00
    ld   c, b                                     ; $670E: $48
    jr   nz, jr_020_6711                          ; $670F: $20 $00

jr_020_6711:
    ld   [$2040], sp                              ; $6711: $08 $40 $20
    nop                                           ; $6714: $00
    ld   [$FFFF], sp                              ; $6715: $08 $FF $FF
    nop                                           ; $6718: $00
    inc  c                                        ; $6719: $0C
    ld   b, h                                     ; $671A: $44
    nop                                           ; $671B: $00
    nop                                           ; $671C: $00
    inc  b                                        ; $671D: $04
    ld   b, [hl]                                  ; $671E: $46
    nop                                           ; $671F: $00
    nop                                           ; $6720: $00
    db   $fc                                      ; $6721: $FC
    ld   b, b                                     ; $6722: $40
    nop                                           ; $6723: $00
    nop                                           ; $6724: $00
    db   $fc                                      ; $6725: $FC
    ld   b, h                                     ; $6726: $44
    jr   nz, jr_020_6729                          ; $6727: $20 $00

jr_020_6729:
    inc  b                                        ; $6729: $04
    ld   b, [hl]                                  ; $672A: $46
    jr   nz, jr_020_672D                          ; $672B: $20 $00

jr_020_672D:
    inc  c                                        ; $672D: $0C
    ld   b, b                                     ; $672E: $40
    jr   nz, jr_020_6731                          ; $672F: $20 $00

jr_020_6731:
    db   $fc                                      ; $6731: $FC
    ld   b, h                                     ; $6732: $44
    jr   nz, jr_020_6735                          ; $6733: $20 $00

jr_020_6735:
    inc  b                                        ; $6735: $04
    ld   b, d                                     ; $6736: $42
    jr   nz, jr_020_6739                          ; $6737: $20 $00

jr_020_6739:
    inc  c                                        ; $6739: $0C
    ld   b, b                                     ; $673A: $40
    jr   nz, jr_020_673D                          ; $673B: $20 $00

jr_020_673D:
    inc  c                                        ; $673D: $0C
    ld   b, h                                     ; $673E: $44
    nop                                           ; $673F: $00
    nop                                           ; $6740: $00
    inc  b                                        ; $6741: $04
    ld   b, d                                     ; $6742: $42
    nop                                           ; $6743: $00
    nop                                           ; $6744: $00
    db   $fc                                      ; $6745: $FC
    ld   b, b                                     ; $6746: $40
    nop                                           ; $6747: $00
    nop                                           ; $6748: $00
    ld   [$0348], sp                              ; $6749: $08 $48 $03
    nop                                           ; $674C: $00
    nop                                           ; $674D: $00
    ld   b, b                                     ; $674E: $40
    inc  bc                                       ; $674F: $03
    nop                                           ; $6750: $00
    nop                                           ; $6751: $00
    rst  $38                                      ; $6752: $FF
    rst  $38                                      ; $6753: $FF
    nop                                           ; $6754: $00
    ld   [$034A], sp                              ; $6755: $08 $4A $03
    nop                                           ; $6758: $00
    nop                                           ; $6759: $00
    ld   c, h                                     ; $675A: $4C
    inc  bc                                       ; $675B: $03
    nop                                           ; $675C: $00
    nop                                           ; $675D: $00
    rst  $38                                      ; $675E: $FF
    rst  $38                                      ; $675F: $FF
    nop                                           ; $6760: $00
    nop                                           ; $6761: $00
    ld   c, d                                     ; $6762: $4A
    inc  hl                                       ; $6763: $23
    nop                                           ; $6764: $00
    ld   [$234C], sp                              ; $6765: $08 $4C $23
    nop                                           ; $6768: $00
    ld   [$FFFF], sp                              ; $6769: $08 $FF $FF
    nop                                           ; $676C: $00
    nop                                           ; $676D: $00
    ld   c, b                                     ; $676E: $48
    inc  hl                                       ; $676F: $23
    nop                                           ; $6770: $00
    ld   [$2340], sp                              ; $6771: $08 $40 $23
    nop                                           ; $6774: $00
    ld   [$FFFF], sp                              ; $6775: $08 $FF $FF
    nop                                           ; $6778: $00
    inc  c                                        ; $6779: $0C
    ld   b, h                                     ; $677A: $44
    inc  bc                                       ; $677B: $03
    nop                                           ; $677C: $00
    inc  b                                        ; $677D: $04
    ld   b, [hl]                                  ; $677E: $46
    inc  bc                                       ; $677F: $03
    nop                                           ; $6780: $00
    db   $fc                                      ; $6781: $FC
    ld   b, b                                     ; $6782: $40
    inc  bc                                       ; $6783: $03
    nop                                           ; $6784: $00
    db   $fc                                      ; $6785: $FC
    ld   b, h                                     ; $6786: $44
    inc  hl                                       ; $6787: $23
    nop                                           ; $6788: $00
    inc  b                                        ; $6789: $04
    ld   b, [hl]                                  ; $678A: $46
    inc  hl                                       ; $678B: $23
    nop                                           ; $678C: $00
    inc  c                                        ; $678D: $0C
    ld   b, b                                     ; $678E: $40
    inc  hl                                       ; $678F: $23
    nop                                           ; $6790: $00
    db   $fc                                      ; $6791: $FC
    ld   b, h                                     ; $6792: $44
    inc  hl                                       ; $6793: $23
    nop                                           ; $6794: $00
    inc  b                                        ; $6795: $04
    ld   b, d                                     ; $6796: $42
    inc  hl                                       ; $6797: $23
    nop                                           ; $6798: $00
    inc  c                                        ; $6799: $0C
    ld   b, b                                     ; $679A: $40
    inc  hl                                       ; $679B: $23
    nop                                           ; $679C: $00
    inc  c                                        ; $679D: $0C
    ld   b, h                                     ; $679E: $44
    inc  bc                                       ; $679F: $03
    nop                                           ; $67A0: $00
    inc  b                                        ; $67A1: $04
    ld   b, d                                     ; $67A2: $42
    inc  bc                                       ; $67A3: $03
    nop                                           ; $67A4: $00
    db   $fc                                      ; $67A5: $FC
    ld   b, b                                     ; $67A6: $40
    inc  bc                                       ; $67A7: $03
    nop                                           ; $67A8: $00
    nop                                           ; $67A9: $00
    ld   c, h                                     ; $67AA: $4C
    ld   [bc], a                                  ; $67AB: $02
    nop                                           ; $67AC: $00
    ld   [$024E], sp                              ; $67AD: $08 $4E $02
    nop                                           ; $67B0: $00
    nop                                           ; $67B1: $00
    rst  $38                                      ; $67B2: $FF
    ld   [bc], a                                  ; $67B3: $02
    nop                                           ; $67B4: $00
    nop                                           ; $67B5: $00
    ld   c, [hl]                                  ; $67B6: $4E
    ld   [hl+], a                                 ; $67B7: $22
    nop                                           ; $67B8: $00
    ld   [$224C], sp                              ; $67B9: $08 $4C $22
    nop                                           ; $67BC: $00
    nop                                           ; $67BD: $00
    rst  $38                                      ; $67BE: $FF
    ld   [bc], a                                  ; $67BF: $02
    nop                                           ; $67C0: $00
    nop                                           ; $67C1: $00
    ld   d, b                                     ; $67C2: $50
    ld   [bc], a                                  ; $67C3: $02
    nop                                           ; $67C4: $00
    ld   [$025A], sp                              ; $67C5: $08 $5A $02
    nop                                           ; $67C8: $00
    nop                                           ; $67C9: $00
    rst  $38                                      ; $67CA: $FF
    ld   [bc], a                                  ; $67CB: $02
    nop                                           ; $67CC: $00
    nop                                           ; $67CD: $00
    ld   e, d                                     ; $67CE: $5A
    ld   [hl+], a                                 ; $67CF: $22
    nop                                           ; $67D0: $00
    ld   [$2250], sp                              ; $67D1: $08 $50 $22
    nop                                           ; $67D4: $00
    nop                                           ; $67D5: $00
    rst  $38                                      ; $67D6: $FF
    ld   [bc], a                                  ; $67D7: $02
    nop                                           ; $67D8: $00
    nop                                           ; $67D9: $00
    ld   c, h                                     ; $67DA: $4C
    nop                                           ; $67DB: $00
    nop                                           ; $67DC: $00
    ld   [$004E], sp                              ; $67DD: $08 $4E $00
    nop                                           ; $67E0: $00
    nop                                           ; $67E1: $00
    rst  $38                                      ; $67E2: $FF
    nop                                           ; $67E3: $00
    nop                                           ; $67E4: $00
    nop                                           ; $67E5: $00
    ld   c, [hl]                                  ; $67E6: $4E
    jr   nz, jr_020_67E9                          ; $67E7: $20 $00

jr_020_67E9:
    ld   [$204C], sp                              ; $67E9: $08 $4C $20
    nop                                           ; $67EC: $00
    nop                                           ; $67ED: $00
    rst  $38                                      ; $67EE: $FF
    nop                                           ; $67EF: $00
    nop                                           ; $67F0: $00
    nop                                           ; $67F1: $00
    ld   d, b                                     ; $67F2: $50
    nop                                           ; $67F3: $00
    nop                                           ; $67F4: $00
    ld   [$005A], sp                              ; $67F5: $08 $5A $00
    nop                                           ; $67F8: $00
    nop                                           ; $67F9: $00
    rst  $38                                      ; $67FA: $FF
    nop                                           ; $67FB: $00
    nop                                           ; $67FC: $00
    nop                                           ; $67FD: $00
    ld   e, d                                     ; $67FE: $5A
    jr   nz, jr_020_6801                          ; $67FF: $20 $00

jr_020_6801:
    ld   [$2050], sp                              ; $6801: $08 $50 $20
    nop                                           ; $6804: $00
    nop                                           ; $6805: $00
    rst  $38                                      ; $6806: $FF
    nop                                           ; $6807: $00
    nop                                           ; $6808: $00
    nop                                           ; $6809: $00
    ld   c, h                                     ; $680A: $4C
    inc  bc                                       ; $680B: $03
    nop                                           ; $680C: $00
    ld   [$034E], sp                              ; $680D: $08 $4E $03
    nop                                           ; $6810: $00
    nop                                           ; $6811: $00
    rst  $38                                      ; $6812: $FF
    inc  bc                                       ; $6813: $03
    nop                                           ; $6814: $00
    nop                                           ; $6815: $00
    ld   c, [hl]                                  ; $6816: $4E
    inc  hl                                       ; $6817: $23
    nop                                           ; $6818: $00
    ld   [$234C], sp                              ; $6819: $08 $4C $23
    nop                                           ; $681C: $00
    nop                                           ; $681D: $00
    rst  $38                                      ; $681E: $FF
    inc  bc                                       ; $681F: $03
    nop                                           ; $6820: $00
    nop                                           ; $6821: $00
    ld   d, b                                     ; $6822: $50
    inc  bc                                       ; $6823: $03
    nop                                           ; $6824: $00
    ld   [$035A], sp                              ; $6825: $08 $5A $03
    nop                                           ; $6828: $00
    nop                                           ; $6829: $00
    rst  $38                                      ; $682A: $FF
    inc  bc                                       ; $682B: $03
    nop                                           ; $682C: $00
    nop                                           ; $682D: $00
    ld   e, d                                     ; $682E: $5A
    inc  hl                                       ; $682F: $23
    nop                                           ; $6830: $00
    ld   [$2350], sp                              ; $6831: $08 $50 $23
    nop                                           ; $6834: $00
    nop                                           ; $6835: $00
    rst  $38                                      ; $6836: $FF
    inc  bc                                       ; $6837: $03
    nop                                           ; $6838: $00
    nop                                           ; $6839: $00
    ld   a, b                                     ; $683A: $78
    inc  bc                                       ; $683B: $03
    nop                                           ; $683C: $00
    ld   [$037A], sp                              ; $683D: $08 $7A $03
    nop                                           ; $6840: $00
    nop                                           ; $6841: $00
    rst  $38                                      ; $6842: $FF
    inc  bc                                       ; $6843: $03
    nop                                           ; $6844: $00
    nop                                           ; $6845: $00
    rst  $38                                      ; $6846: $FF
    inc  bc                                       ; $6847: $03
    nop                                           ; $6848: $00
    nop                                           ; $6849: $00
    ld   a, h                                     ; $684A: $7C
    inc  bc                                       ; $684B: $03
    nop                                           ; $684C: $00
    ld   [$037E], sp                              ; $684D: $08 $7E $03
    nop                                           ; $6850: $00
    nop                                           ; $6851: $00
    rst  $38                                      ; $6852: $FF
    inc  bc                                       ; $6853: $03
    nop                                           ; $6854: $00
    nop                                           ; $6855: $00
    rst  $38                                      ; $6856: $FF
    inc  bc                                       ; $6857: $03
    nop                                           ; $6858: $00
    nop                                           ; $6859: $00
    ld   a, d                                     ; $685A: $7A
    inc  hl                                       ; $685B: $23
    nop                                           ; $685C: $00
    ld   [$2378], sp                              ; $685D: $08 $78 $23
    nop                                           ; $6860: $00
    nop                                           ; $6861: $00
    rst  $38                                      ; $6862: $FF
    inc  bc                                       ; $6863: $03
    nop                                           ; $6864: $00
    nop                                           ; $6865: $00
    rst  $38                                      ; $6866: $FF
    inc  bc                                       ; $6867: $03
    nop                                           ; $6868: $00
    nop                                           ; $6869: $00
    ld   a, [hl]                                  ; $686A: $7E
    inc  hl                                       ; $686B: $23
    nop                                           ; $686C: $00
    ld   [OpenDialogInTable2], sp                 ; $686D: $08 $7C $23
    nop                                           ; $6870: $00
    nop                                           ; $6871: $00
    rst  $38                                      ; $6872: $FF
    inc  bc                                       ; $6873: $03
    nop                                           ; $6874: $00
    nop                                           ; $6875: $00
    rst  $38                                      ; $6876: $FF
    inc  bc                                       ; $6877: $03
    db   $fd                                      ; $6878: $FD
    db   $10                                      ; $6879: $10
    ld   [hl+], a                                 ; $687A: $22
    inc  hl                                       ; $687B: $23
    db   $fd                                      ; $687C: $FD
    db   $fd                                      ; $687D: $FD
    ld   [hl+], a                                 ; $687E: $22
    inc  bc                                       ; $687F: $03
    nop                                           ; $6880: $00
    nop                                           ; $6881: $00
    ld   a, b                                     ; $6882: $78
    inc  bc                                       ; $6883: $03
    nop                                           ; $6884: $00
    ld   [$037A], sp                              ; $6885: $08 $7A $03
    rlca                                          ; $6888: $07
    db   $10                                      ; $6889: $10
    ld   [hl+], a                                 ; $688A: $22
    inc  bc                                       ; $688B: $03
    rlca                                          ; $688C: $07
    db   $fd                                      ; $688D: $FD
    ld   [hl+], a                                 ; $688E: $22
    inc  hl                                       ; $688F: $23
    rst  $38                                      ; $6890: $FF
    nop                                           ; $6891: $00
    ld   a, b                                     ; $6892: $78
    inc  bc                                       ; $6893: $03
    rst  $38                                      ; $6894: $FF
    ld   [$037A], sp                              ; $6895: $08 $7A $03
    db   $fd                                      ; $6898: $FD
    dec  bc                                       ; $6899: $0B
    ld   [hl+], a                                 ; $689A: $22
    inc  hl                                       ; $689B: $23
    db   $fd                                      ; $689C: $FD
    ld   hl, sp+$22                               ; $689D: $F8 $22
    inc  bc                                       ; $689F: $03
    nop                                           ; $68A0: $00
    nop                                           ; $68A1: $00
    ld   a, d                                     ; $68A2: $7A
    inc  hl                                       ; $68A3: $23
    nop                                           ; $68A4: $00
    ld   [$2378], sp                              ; $68A5: $08 $78 $23
    rlca                                          ; $68A8: $07
    dec  bc                                       ; $68A9: $0B
    ld   [hl+], a                                 ; $68AA: $22
    inc  bc                                       ; $68AB: $03
    rlca                                          ; $68AC: $07
    ld   hl, sp+$22                               ; $68AD: $F8 $22
    inc  hl                                       ; $68AF: $23
    rst  $38                                      ; $68B0: $FF
    nop                                           ; $68B1: $00
    ld   a, d                                     ; $68B2: $7A
    inc  hl                                       ; $68B3: $23
    rst  $38                                      ; $68B4: $FF
    ld   [$2378], sp                              ; $68B5: $08 $78 $23
    db   $f4                                      ; $68B8: $F4
    ld   hl, sp+$40                               ; $68B9: $F8 $40
    rlca                                          ; $68BB: $07
    db   $f4                                      ; $68BC: $F4
    nop                                           ; $68BD: $00
    ld   b, d                                     ; $68BE: $42
    rlca                                          ; $68BF: $07
    db   $f4                                      ; $68C0: $F4
    ld   [$0744], sp                              ; $68C1: $08 $44 $07
    db   $f4                                      ; $68C4: $F4
    db   $10                                      ; $68C5: $10
    ld   b, [hl]                                  ; $68C6: $46
    rlca                                          ; $68C7: $07
    inc  b                                        ; $68C8: $04
    ld   hl, sp+$48                               ; $68C9: $F8 $48
    rlca                                          ; $68CB: $07
    inc  b                                        ; $68CC: $04
    nop                                           ; $68CD: $00
    ld   c, d                                     ; $68CE: $4A
    rlca                                          ; $68CF: $07
    inc  b                                        ; $68D0: $04
    ld   [$074C], sp                              ; $68D1: $08 $4C $07
    inc  b                                        ; $68D4: $04
    db   $10                                      ; $68D5: $10
    ld   c, [hl]                                  ; $68D6: $4E
    rlca                                          ; $68D7: $07
    db   $f4                                      ; $68D8: $F4
    db   $10                                      ; $68D9: $10
    ld   b, b                                     ; $68DA: $40
    daa                                           ; $68DB: $27
    db   $f4                                      ; $68DC: $F4
    ld   [$2742], sp                              ; $68DD: $08 $42 $27
    db   $f4                                      ; $68E0: $F4
    nop                                           ; $68E1: $00
    ld   b, h                                     ; $68E2: $44
    daa                                           ; $68E3: $27
    db   $f4                                      ; $68E4: $F4
    ld   hl, sp+$46                               ; $68E5: $F8 $46
    daa                                           ; $68E7: $27
    inc  b                                        ; $68E8: $04
    db   $10                                      ; $68E9: $10
    ld   c, b                                     ; $68EA: $48
    daa                                           ; $68EB: $27
    inc  b                                        ; $68EC: $04
    ld   [$274A], sp                              ; $68ED: $08 $4A $27
    inc  b                                        ; $68F0: $04
    nop                                           ; $68F1: $00
    ld   c, h                                     ; $68F2: $4C
    daa                                           ; $68F3: $27
    inc  b                                        ; $68F4: $04
    ld   hl, sp+$4E                               ; $68F5: $F8 $4E
    daa                                           ; $68F7: $27
    db   $f4                                      ; $68F8: $F4
    db   $10                                      ; $68F9: $10
    ld   d, b                                     ; $68FA: $50
    daa                                           ; $68FB: $27
    db   $f4                                      ; $68FC: $F4
    ld   [$2752], sp                              ; $68FD: $08 $52 $27
    db   $f4                                      ; $6900: $F4
    nop                                           ; $6901: $00
    ld   d, h                                     ; $6902: $54
    daa                                           ; $6903: $27
    db   $f4                                      ; $6904: $F4
    ld   hl, sp+$56                               ; $6905: $F8 $56
    daa                                           ; $6907: $27
    inc  b                                        ; $6908: $04
    db   $10                                      ; $6909: $10
    ld   e, b                                     ; $690A: $58
    daa                                           ; $690B: $27
    inc  b                                        ; $690C: $04
    ld   [$275A], sp                              ; $690D: $08 $5A $27
    inc  b                                        ; $6910: $04
    nop                                           ; $6911: $00
    ld   e, h                                     ; $6912: $5C
    daa                                           ; $6913: $27
    inc  b                                        ; $6914: $04
    ld   hl, sp+$5E                               ; $6915: $F8 $5E
    daa                                           ; $6917: $27
    db   $f4                                      ; $6918: $F4
    ld   hl, sp+$50                               ; $6919: $F8 $50
    rlca                                          ; $691B: $07
    db   $f4                                      ; $691C: $F4
    nop                                           ; $691D: $00
    ld   d, d                                     ; $691E: $52
    rlca                                          ; $691F: $07
    db   $f4                                      ; $6920: $F4
    ld   [$0754], sp                              ; $6921: $08 $54 $07
    db   $f4                                      ; $6924: $F4
    db   $10                                      ; $6925: $10
    ld   d, [hl]                                  ; $6926: $56
    rlca                                          ; $6927: $07
    inc  b                                        ; $6928: $04
    ld   hl, sp+$58                               ; $6929: $F8 $58
    rlca                                          ; $692B: $07
    inc  b                                        ; $692C: $04
    nop                                           ; $692D: $00
    ld   e, d                                     ; $692E: $5A
    rlca                                          ; $692F: $07
    inc  b                                        ; $6930: $04
    ld   [$075C], sp                              ; $6931: $08 $5C $07
    inc  b                                        ; $6934: $04
    db   $10                                      ; $6935: $10
    ld   e, [hl]                                  ; $6936: $5E
    rlca                                          ; $6937: $07
    ld   [bc], a                                  ; $6938: $02
    db   $fc                                      ; $6939: $FC
    ld   b, b                                     ; $693A: $40
    rlca                                          ; $693B: $07
    ld   [bc], a                                  ; $693C: $02
    inc  b                                        ; $693D: $04
    ld   b, d                                     ; $693E: $42
    rlca                                          ; $693F: $07
    ld   [bc], a                                  ; $6940: $02
    inc  c                                        ; $6941: $0C
    ld   b, b                                     ; $6942: $40
    daa                                           ; $6943: $27
    nop                                           ; $6944: $00
    nop                                           ; $6945: $00
    rst  $38                                      ; $6946: $FF
    nop                                           ; $6947: $00
    nop                                           ; $6948: $00
    nop                                           ; $6949: $00
    rst  $38                                      ; $694A: $FF
    nop                                           ; $694B: $00
    nop                                           ; $694C: $00
    nop                                           ; $694D: $00
    rst  $38                                      ; $694E: $FF
    nop                                           ; $694F: $00
    ld   a, [$ff00+c]                             ; $6950: $F2
    nop                                           ; $6951: $00
    ld   b, h                                     ; $6952: $44
    rlca                                          ; $6953: $07
    ld   a, [$ff00+c]                             ; $6954: $F2
    ld   [$2744], sp                              ; $6955: $08 $44 $27
    ld   [bc], a                                  ; $6958: $02
    nop                                           ; $6959: $00
    ld   b, [hl]                                  ; $695A: $46
    rlca                                          ; $695B: $07
    ld   [bc], a                                  ; $695C: $02
    ld   [$2746], sp                              ; $695D: $08 $46 $27
    nop                                           ; $6960: $00
    nop                                           ; $6961: $00
    rst  $38                                      ; $6962: $FF
    nop                                           ; $6963: $00
    nop                                           ; $6964: $00
    nop                                           ; $6965: $00
    rst  $38                                      ; $6966: $FF
    nop                                           ; $6967: $00
    ld   a, [$ff00+c]                             ; $6968: $F2
    nop                                           ; $6969: $00
    ld   c, b                                     ; $696A: $48
    rlca                                          ; $696B: $07
    ld   a, [$ff00+c]                             ; $696C: $F2
    ld   [$2748], sp                              ; $696D: $08 $48 $27
    ld   [bc], a                                  ; $6970: $02
    nop                                           ; $6971: $00
    ld   c, d                                     ; $6972: $4A
    rlca                                          ; $6973: $07
    ld   [bc], a                                  ; $6974: $02
    ld   [$274A], sp                              ; $6975: $08 $4A $27
    nop                                           ; $6978: $00
    nop                                           ; $6979: $00
    rst  $38                                      ; $697A: $FF
    nop                                           ; $697B: $00
    nop                                           ; $697C: $00
    nop                                           ; $697D: $00
    rst  $38                                      ; $697E: $FF
    nop                                           ; $697F: $00
    ld   a, [$ff00+c]                             ; $6980: $F2
    nop                                           ; $6981: $00
    ld   c, h                                     ; $6982: $4C
    rlca                                          ; $6983: $07
    ld   a, [$ff00+c]                             ; $6984: $F2
    ld   [$274C], sp                              ; $6985: $08 $4C $27
    ld   [bc], a                                  ; $6988: $02
    ld   hl, sp+$4E                               ; $6989: $F8 $4E
    rlca                                          ; $698B: $07
    ld   [bc], a                                  ; $698C: $02
    nop                                           ; $698D: $00
    ld   d, b                                     ; $698E: $50
    rlca                                          ; $698F: $07
    ld   [bc], a                                  ; $6990: $02
    ld   [$2750], sp                              ; $6991: $08 $50 $27
    ld   [bc], a                                  ; $6994: $02
    db   $10                                      ; $6995: $10
    ld   c, [hl]                                  ; $6996: $4E
    daa                                           ; $6997: $27
    ld   a, [$ff00+c]                             ; $6998: $F2
    db   $fc                                      ; $6999: $FC
    ld   d, d                                     ; $699A: $52
    rlca                                          ; $699B: $07
    ld   a, [$ff00+c]                             ; $699C: $F2
    inc  b                                        ; $699D: $04
    ld   d, [hl]                                  ; $699E: $56
    rlca                                          ; $699F: $07
    ld   a, [$ff00+c]                             ; $69A0: $F2
    inc  c                                        ; $69A1: $0C
    ld   e, d                                     ; $69A2: $5A
    rlca                                          ; $69A3: $07
    ld   [bc], a                                  ; $69A4: $02
    db   $fc                                      ; $69A5: $FC
    ld   d, h                                     ; $69A6: $54
    rlca                                          ; $69A7: $07
    ld   [bc], a                                  ; $69A8: $02
    inc  b                                        ; $69A9: $04
    ld   e, b                                     ; $69AA: $58
    rlca                                          ; $69AB: $07
    ld   [bc], a                                  ; $69AC: $02
    inc  c                                        ; $69AD: $0C
    ld   e, h                                     ; $69AE: $5C
    rlca                                          ; $69AF: $07
    ld   a, [$ff00+c]                             ; $69B0: $F2
    db   $fc                                      ; $69B1: $FC
    ld   e, d                                     ; $69B2: $5A
    daa                                           ; $69B3: $27
    ld   a, [$ff00+c]                             ; $69B4: $F2
    inc  b                                        ; $69B5: $04
    ld   d, [hl]                                  ; $69B6: $56
    daa                                           ; $69B7: $27
    ld   a, [$ff00+c]                             ; $69B8: $F2
    inc  c                                        ; $69B9: $0C
    ld   d, d                                     ; $69BA: $52
    daa                                           ; $69BB: $27
    ld   [bc], a                                  ; $69BC: $02
    db   $fc                                      ; $69BD: $FC
    ld   e, h                                     ; $69BE: $5C
    daa                                           ; $69BF: $27
    ld   [bc], a                                  ; $69C0: $02
    inc  b                                        ; $69C1: $04
    ld   e, b                                     ; $69C2: $58
    daa                                           ; $69C3: $27
    ld   [bc], a                                  ; $69C4: $02
    inc  c                                        ; $69C5: $0C
    ld   d, h                                     ; $69C6: $54
    daa                                           ; $69C7: $27
    ld   a, [$ff00+c]                             ; $69C8: $F2
    nop                                           ; $69C9: $00
    ld   c, h                                     ; $69CA: $4C
    inc  b                                        ; $69CB: $04
    ld   a, [$ff00+c]                             ; $69CC: $F2
    ld   [$244C], sp                              ; $69CD: $08 $4C $24
    ld   [bc], a                                  ; $69D0: $02
    ld   hl, sp+$4E                               ; $69D1: $F8 $4E
    inc  b                                        ; $69D3: $04
    ld   [bc], a                                  ; $69D4: $02
    nop                                           ; $69D5: $00
    ld   d, b                                     ; $69D6: $50
    inc  b                                        ; $69D7: $04
    ld   [bc], a                                  ; $69D8: $02
    ld   [$2450], sp                              ; $69D9: $08 $50 $24
    ld   [bc], a                                  ; $69DC: $02
    db   $10                                      ; $69DD: $10
    ld   c, [hl]                                  ; $69DE: $4E
    inc  h                                        ; $69DF: $24
    ldh  a, [hFFFC]                               ; $69E0: $F0 $FC
    ld   d, b                                     ; $69E2: $50
    ld   bc, $04F0                                ; $69E3: $01 $F0 $04
    ld   d, d                                     ; $69E6: $52
    ld   bc, $0CF0                                ; $69E7: $01 $F0 $0C
    ld   d, h                                     ; $69EA: $54
    ld   bc, $FC00                                ; $69EB: $01 $00 $FC
    ld   d, [hl]                                  ; $69EE: $56
    ld   bc, $0400                                ; $69EF: $01 $00 $04
    ld   e, b                                     ; $69F2: $58
    ld   bc, $C00                                 ; $69F3: $01 $00 $0C
    ld   e, d                                     ; $69F6: $5A
    ld   bc, $FCF0                                ; $69F7: $01 $F0 $FC
    ld   d, b                                     ; $69FA: $50
    ld   bc, $04F0                                ; $69FB: $01 $F0 $04
    ld   d, d                                     ; $69FE: $52
    ld   bc, $0CF0                                ; $69FF: $01 $F0 $0C
    ld   d, h                                     ; $6A02: $54
    ld   bc, $FC00                                ; $6A03: $01 $00 $FC
    ld   e, h                                     ; $6A06: $5C
    ld   bc, $0400                                ; $6A07: $01 $00 $04
    ld   e, b                                     ; $6A0A: $58
    ld   bc, $C00                                 ; $6A0B: $01 $00 $0C
    ld   e, [hl]                                  ; $6A0E: $5E
    ld   bc, $04F4                                ; $6A0F: $01 $F4 $04
    jr   nz, @+$23                                ; $6A12: $20 $21

    nop                                           ; $6A14: $00
    inc  b                                        ; $6A15: $04
    adc  [hl]                                     ; $6A16: $8E
    ld   d, $F4                                   ; $6A17: $16 $F4
    inc  b                                        ; $6A19: $04
    jr   nz, jr_020_6A1D                          ; $6A1A: $20 $01

    nop                                           ; $6A1C: $00

jr_020_6A1D:
    inc  b                                        ; $6A1D: $04
    adc  [hl]                                     ; $6A1E: $8E
    ld   d, $F4                                   ; $6A1F: $16 $F4
    nop                                           ; $6A21: $00
    ld   b, b                                     ; $6A22: $40
    inc  bc                                       ; $6A23: $03
    db   $f4                                      ; $6A24: $F4
    ld   [$2340], sp                              ; $6A25: $08 $40 $23
    db   $f4                                      ; $6A28: $F4
    nop                                           ; $6A29: $00
    ld   b, b                                     ; $6A2A: $40
    ld   [bc], a                                  ; $6A2B: $02
    db   $f4                                      ; $6A2C: $F4
    ld   [$2240], sp                              ; $6A2D: $08 $40 $22

; Palette-related
Func_020_6A30::
    ldh  a, [hIsGBC]                              ; $6A30: $F0 $FE
    and  a                                        ; $6A32: $A7
    jp   z, label_020_6B81                        ; $6A33: $CA $81 $6B

    ld   a, e                                     ; $6A36: $7B
    cp   $03                                      ; $6A37: $FE $03
    ret  c                                        ; $6A39: $D8

    ld   a, $01                                   ; $6A3A: $3E $01
    ldh  [$FFE4], a                               ; $6A3C: $E0 $E4
    ld   a, $02                                   ; $6A3E: $3E $02
    ldh  [$FFE5], a                               ; $6A40: $E0 $E5
    ld   a, $04                                   ; $6A42: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6A44: $E0 $E6
    ld   hl, $DC10                                ; $6A46: $21 $10 $DC
    ld   d, $40                                   ; $6A49: $16 $40
    ld   a, e                                     ; $6A4B: $7B
    cp   $06                                      ; $6A4C: $FE $06
    jr   nc, jr_020_6A52                          ; $6A4E: $30 $02

    ld   d, $28                                   ; $6A50: $16 $28

jr_020_6A52:
    and  $10                                      ; $6A52: $E6 $10
    jr   z, jr_020_6A68                           ; $6A54: $28 $12

    ldh  a, [$FFE4]                               ; $6A56: $F0 $E4
    sla  a                                        ; $6A58: $CB $27
    ldh  [$FFE4], a                               ; $6A5A: $E0 $E4
    ldh  a, [$FFE5]                               ; $6A5C: $F0 $E5
    sla  a                                        ; $6A5E: $CB $27
    ldh  [$FFE5], a                               ; $6A60: $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ; $6A62: $F0 $E6
    sla  a                                        ; $6A64: $CB $27
    ldh  [hFreeWarpDataAddress], a                ; $6A66: $E0 $E6

Func_020_6A68:
jr_020_6A68:
    push hl                                       ; $6A68: $E5
    ldh  a, [$FFE4]                               ; $6A69: $F0 $E4
    ld   c, a                                     ; $6A6B: $4F
    ld   a, [hl]                                  ; $6A6C: $7E
    and  $1F                                      ; $6A6D: $E6 $1F
    add  c                                        ; $6A6F: $81
    cp   $20                                      ; $6A70: $FE $20
    jr   c, jr_020_6A76                           ; $6A72: $38 $02

    ld   a, $1F                                   ; $6A74: $3E $1F

jr_020_6A76:
    ldh  [hScratch0], a                           ; $6A76: $E0 $D7
    ldh  a, [$FFE5]                               ; $6A78: $F0 $E5
    ld   c, a                                     ; $6A7A: $4F
    ld   a, [hl+]                                 ; $6A7B: $2A
    and  $E0                                      ; $6A7C: $E6 $E0
    swap a                                        ; $6A7E: $CB $37
    ld   b, a                                     ; $6A80: $47
    ld   a, [hl]                                  ; $6A81: $7E
    and  $03                                      ; $6A82: $E6 $03
    swap a                                        ; $6A84: $CB $37
    or   b                                        ; $6A86: $B0
    and  $3E                                      ; $6A87: $E6 $3E
    add  c                                        ; $6A89: $81
    cp   $40                                      ; $6A8A: $FE $40
    jr   c, jr_020_6A90                           ; $6A8C: $38 $02

    ld   a, $3E                                   ; $6A8E: $3E $3E

jr_020_6A90:
    ldh  [hScratch1], a                           ; $6A90: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $6A92: $F0 $E6
    ld   c, a                                     ; $6A94: $4F
    ld   a, [hl]                                  ; $6A95: $7E
    and  $7C                                      ; $6A96: $E6 $7C
    add  c                                        ; $6A98: $81
    cp   $80                                      ; $6A99: $FE $80
    jr   c, jr_020_6A9F                           ; $6A9B: $38 $02

    ld   a, $7C                                   ; $6A9D: $3E $7C

jr_020_6A9F:
    ldh  [hScratch2], a                           ; $6A9F: $E0 $D9
    pop  hl                                       ; $6AA1: $E1
    ldh  a, [hScratch0]                           ; $6AA2: $F0 $D7
    ld   b, a                                     ; $6AA4: $47
    ldh  a, [hScratch1]                           ; $6AA5: $F0 $D8
    swap a                                        ; $6AA7: $CB $37
    ld   c, a                                     ; $6AA9: $4F
    and  $E0                                      ; $6AAA: $E6 $E0
    or   b                                        ; $6AAC: $B0
    ld   [hl+], a                                 ; $6AAD: $22
    ldh  a, [hScratch2]                           ; $6AAE: $F0 $D9
    ld   b, a                                     ; $6AB0: $47
    ld   a, c                                     ; $6AB1: $79
    and  $03                                      ; $6AB2: $E6 $03
    or   b                                        ; $6AB4: $B0
    ld   [hl+], a                                 ; $6AB5: $22
    dec  d                                        ; $6AB6: $15
    ld   a, d                                     ; $6AB7: $7A
    and  a                                        ; $6AB8: $A7
    jr   nz, jr_020_6A68                          ; $6AB9: $20 $AD

    ld   a, $03                                   ; $6ABB: $3E $03
    ld   [wPaletteDataFlags], a                    ; $6ABD: $EA $D1 $DD
    ret                                           ; $6AC0: $C9

Func_020_6AC1::
    ldh  a, [hIsGBC]                              ; $6AC1: $F0 $FE
    and  a                                        ; $6AC3: $A7
    jp   z, label_020_6B81                        ; $6AC4: $CA $81 $6B

    ld   a, e                                     ; $6AC7: $7B
    cp   $06                                      ; $6AC8: $FE $06
    ret  c                                        ; $6ACA: $D8

    ld   a, $01                                   ; $6ACB: $3E $01
    ldh  [$FFE4], a                               ; $6ACD: $E0 $E4
    ld   a, $02                                   ; $6ACF: $3E $02
    ldh  [$FFE5], a                               ; $6AD1: $E0 $E5
    ld   a, $04                                   ; $6AD3: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6AD5: $E0 $E6
    ld   hl, $DC10                                ; $6AD7: $21 $10 $DC
    ld   a, $40                                   ; $6ADA: $3E $40
    ldh  [hScratch3], a                           ; $6ADC: $E0 $DA
    ld   a, e                                     ; $6ADE: $7B
    and  $10                                      ; $6ADF: $E6 $10
    jr   z, jr_020_6AF5                           ; $6AE1: $28 $12

    ldh  a, [$FFE4]                               ; $6AE3: $F0 $E4
    sla  a                                        ; $6AE5: $CB $27
    ldh  [$FFE4], a                               ; $6AE7: $E0 $E4
    ldh  a, [$FFE5]                               ; $6AE9: $F0 $E5
    sla  a                                        ; $6AEB: $CB $27
    ldh  [$FFE5], a                               ; $6AED: $E0 $E5
    ldh  a, [hFreeWarpDataAddress]                ; $6AEF: $F0 $E6
    sla  a                                        ; $6AF1: $CB $27
    ldh  [hFreeWarpDataAddress], a                ; $6AF3: $E0 $E6

Func_020_6AF5:
label_020_6AF5:
jr_020_6AF5:
    push hl                                       ; $6AF5: $E5
    ld   a, $02                                   ; $6AF6: $3E $02
    ld   [rSVBK], a                               ; $6AF8: $E0 $70
    ld   a, [hl+]                                 ; $6AFA: $2A
    ld   e, a                                     ; $6AFB: $5F
    ld   a, [hl]                                  ; $6AFC: $7E
    ld   d, a                                     ; $6AFD: $57
    dec  hl                                       ; $6AFE: $2B
    xor  a                                        ; $6AFF: $AF
    ld   [rSVBK], a                               ; $6B00: $E0 $70
    ldh  a, [$FFE4]                               ; $6B02: $F0 $E4
    ld   c, a                                     ; $6B04: $4F
    ld   a, e                                     ; $6B05: $7B
    and  $1F                                      ; $6B06: $E6 $1F
    ld   b, a                                     ; $6B08: $47
    ld   a, [hl]                                  ; $6B09: $7E
    and  $1F                                      ; $6B0A: $E6 $1F
    cp   b                                        ; $6B0C: $B8
    jr   c, jr_020_6B17                           ; $6B0D: $38 $08

    jr   z, jr_020_6B17                           ; $6B0F: $28 $06

    sub  c                                        ; $6B11: $91
    jr   c, jr_020_6B17                           ; $6B12: $38 $03

    cp   b                                        ; $6B14: $B8
    jr   nc, jr_020_6B18                          ; $6B15: $30 $01

jr_020_6B17:
    ld   a, b                                     ; $6B17: $78

jr_020_6B18:
    ldh  [hScratch0], a                           ; $6B18: $E0 $D7
    ld   a, e                                     ; $6B1A: $7B
    and  $E0                                      ; $6B1B: $E6 $E0
    swap a                                        ; $6B1D: $CB $37
    ld   b, a                                     ; $6B1F: $47
    ld   a, d                                     ; $6B20: $7A
    and  $03                                      ; $6B21: $E6 $03
    swap a                                        ; $6B23: $CB $37
    or   b                                        ; $6B25: $B0
    ld   b, a                                     ; $6B26: $47
    ld   a, [hl+]                                 ; $6B27: $2A
    and  $E0                                      ; $6B28: $E6 $E0
    swap a                                        ; $6B2A: $CB $37
    ld   c, a                                     ; $6B2C: $4F
    ld   a, [hl]                                  ; $6B2D: $7E
    and  $03                                      ; $6B2E: $E6 $03
    swap a                                        ; $6B30: $CB $37
    or   c                                        ; $6B32: $B1
    push af                                       ; $6B33: $F5
    ldh  a, [$FFE5]                               ; $6B34: $F0 $E5
    ld   c, a                                     ; $6B36: $4F
    pop  af                                       ; $6B37: $F1
    cp   b                                        ; $6B38: $B8
    jr   c, jr_020_6B43                           ; $6B39: $38 $08

    jr   z, jr_020_6B43                           ; $6B3B: $28 $06

    sub  c                                        ; $6B3D: $91
    jr   c, jr_020_6B43                           ; $6B3E: $38 $03

    cp   b                                        ; $6B40: $B8
    jr   nc, jr_020_6B44                          ; $6B41: $30 $01

jr_020_6B43:
    ld   a, b                                     ; $6B43: $78

jr_020_6B44:
    ldh  [hScratch1], a                           ; $6B44: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $6B46: $F0 $E6
    ld   c, a                                     ; $6B48: $4F
    ld   a, d                                     ; $6B49: $7A
    and  $7C                                      ; $6B4A: $E6 $7C
    ld   b, a                                     ; $6B4C: $47
    ld   a, [hl]                                  ; $6B4D: $7E
    and  $7C                                      ; $6B4E: $E6 $7C
    cp   b                                        ; $6B50: $B8
    jr   c, jr_020_6B5B                           ; $6B51: $38 $08

    jr   z, jr_020_6B5B                           ; $6B53: $28 $06

    sub  c                                        ; $6B55: $91
    jr   c, jr_020_6B5B                           ; $6B56: $38 $03

    cp   b                                        ; $6B58: $B8
    jr   nc, jr_020_6B5C                          ; $6B59: $30 $01

jr_020_6B5B:
    ld   a, b                                     ; $6B5B: $78

jr_020_6B5C:
    ldh  [hScratch2], a                           ; $6B5C: $E0 $D9
    pop  hl                                       ; $6B5E: $E1
    ldh  a, [hScratch0]                           ; $6B5F: $F0 $D7
    ld   b, a                                     ; $6B61: $47
    ldh  a, [hScratch1]                           ; $6B62: $F0 $D8
    swap a                                        ; $6B64: $CB $37
    ld   c, a                                     ; $6B66: $4F
    and  $E0                                      ; $6B67: $E6 $E0
    or   b                                        ; $6B69: $B0
    ld   [hl+], a                                 ; $6B6A: $22
    ldh  a, [hScratch2]                           ; $6B6B: $F0 $D9
    ld   b, a                                     ; $6B6D: $47
    ld   a, c                                     ; $6B6E: $79
    and  $03                                      ; $6B6F: $E6 $03
    or   b                                        ; $6B71: $B0
    ld   [hl+], a                                 ; $6B72: $22
    ldh  a, [hScratch3]                           ; $6B73: $F0 $DA
    dec  a                                        ; $6B75: $3D
    ldh  [hScratch3], a                           ; $6B76: $E0 $DA
    and  a                                        ; $6B78: $A7
    jp   nz, label_020_6AF5                       ; $6B79: $C2 $F5 $6A

    ld   a, $03                                   ; $6B7C: $3E $03
    ld   [wPaletteDataFlags], a                    ; $6B7E: $EA $D1 $DD

label_020_6B81:
    xor  a                                        ; $6B81: $AF
    ld   [wPaletteUnknownE], a                    ; $6B82: $EA $D5 $DD
    ret                                           ; $6B85: $C9

Func_020_6B86:
    ld   a, $02                                   ; $6B86: $3E $02
    ld   [rSVBK], a                               ; $6B88: $E0 $70
    ld   a, [bc]                                  ; $6B8A: $0A
    or   [hl]                                     ; $6B8B: $B6
    ld   e, a                                     ; $6B8C: $5F
    inc  bc                                       ; $6B8D: $03
    inc  hl                                       ; $6B8E: $23
    ld   a, [bc]                                  ; $6B8F: $0A
    or   [hl]                                     ; $6B90: $B6
    ld   d, a                                     ; $6B91: $57
    dec  bc                                       ; $6B92: $0B
    dec  hl                                       ; $6B93: $2B
    xor  a                                        ; $6B94: $AF
    ld   [rSVBK], a                               ; $6B95: $E0 $70
    ld   [hl], e                                  ; $6B97: $73
    inc  hl                                       ; $6B98: $23
    ld   [hl], d                                  ; $6B99: $72
    inc  hl                                       ; $6B9A: $23
    ret                                           ; $6B9B: $C9

    nop                                           ; $6B9C: $00
    nop                                           ; $6B9D: $00
    add  h                                        ; $6B9E: $84
    db   $10                                      ; $6B9F: $10
    adc  h                                        ; $6BA0: $8C
    ld   sp, $1084                                ; $6BA1: $31 $84 $10

Func_020_6BA4::
    ldh  a, [hIsGBC]                              ; $6BA4: $F0 $FE
    and  a                                        ; $6BA6: $A7
    jp   z, label_020_6B81                        ; $6BA7: $CA $81 $6B

    ld   a, [wIntroSubTimer]                      ; $6BAA: $FA $02 $D0
    and  a                                        ; $6BAD: $A7
    jr   z, jr_020_6BB4                           ; $6BAE: $28 $04

    cp   $18                                      ; $6BB0: $FE $18
    jr   nc, jr_020_6BDB                          ; $6BB2: $30 $27

jr_020_6BB4:
    ld   hl, $6B9C                                ; $6BB4: $21 $9C $6B
    sla  e                                        ; $6BB7: $CB $23
    add  hl, de                                   ; $6BB9: $19
    push hl                                       ; $6BBA: $E5
    pop  bc                                       ; $6BBB: $C1
    ld   hl, $DC10                                ; $6BBC: $21 $10 $DC
    ld   a, $08                                   ; $6BBF: $3E $08
    ldh  [hScratch0], a                           ; $6BC1: $E0 $D7

jr_020_6BC3:
    call Func_020_6B86                            ; $6BC3: $CD $86 $6B
    call Func_020_6B86                            ; $6BC6: $CD $86 $6B
    call Func_020_6B86                            ; $6BC9: $CD $86 $6B
    inc  hl                                       ; $6BCC: $23
    inc  hl                                       ; $6BCD: $23
    ldh  a, [hScratch0]                           ; $6BCE: $F0 $D7
    dec  a                                        ; $6BD0: $3D
    and  a                                        ; $6BD1: $A7
    ldh  [hScratch0], a                           ; $6BD2: $E0 $D7
    jr   nz, jr_020_6BC3                          ; $6BD4: $20 $ED

    ld   a, $01                                   ; $6BD6: $3E $01
    ld   [wPaletteDataFlags], a                    ; $6BD8: $EA $D1 $DD

jr_020_6BDB:
    ret                                           ; $6BDB: $C9

Func_020_6BDC::
    ldh  a, [hIsGBC]                              ; $6BDC: $F0 $FE
    and  a                                        ; $6BDE: $A7
    ret  z                                        ; $6BDF: $C8

    ld   hl, $DC10                                ; $6BE0: $21 $10 $DC
    ld   bc, $DC50                                ; $6BE3: $01 $50 $DC
    ld   d, $20                                   ; $6BE6: $16 $20

jr_020_6BE8:
    ld   a, $FF                                   ; $6BE8: $3E $FF
    ld   [hl+], a                                 ; $6BEA: $22
    ld   [bc], a                                  ; $6BEB: $02
    inc  bc                                       ; $6BEC: $03
    ld   [hl+], a                                 ; $6BED: $22
    ld   [bc], a                                  ; $6BEE: $02
    inc  bc                                       ; $6BEF: $03
    dec  d                                        ; $6BF0: $15
    ld   a, d                                     ; $6BF1: $7A
    and  a                                        ; $6BF2: $A7
    jr   nz, jr_020_6BE8                          ; $6BF3: $20 $F3

    ld   a, $03                                   ; $6BF5: $3E $03
    ld   [wPaletteDataFlags], a                    ; $6BF7: $EA $D1 $DD
    ld   a, $01                                   ; $6BFA: $3E $01
    ld   [wPaletteUnknownE], a                    ; $6BFC: $EA $D5 $DD
    ret                                           ; $6BFF: $C9

LoadFileMenuBG::
    ldh  a, [hIsGBC]                              ; $6C00: $F0 $FE
    and  a                                        ; $6C02: $A7
    jp   z, label_020_6B81                        ; $6C03: $CA $81 $6B

    ld   c, $80                                   ; $6C06: $0E $80
    ld   hl, $DC10                                ; $6C08: $21 $10 $DC

jr_020_6C0B:
    ld   a, $02                                   ; $6C0B: $3E $02
    ld   [rSVBK], a                               ; $6C0D: $E0 $70
    ld   b, [hl]                                  ; $6C0F: $46
    xor  a                                        ; $6C10: $AF
    ld   [rSVBK], a                               ; $6C11: $E0 $70
    ld   [hl], b                                  ; $6C13: $70
    inc  hl                                       ; $6C14: $23
    dec  c                                        ; $6C15: $0D
    ld   a, c                                     ; $6C16: $79
    and  a                                        ; $6C17: $A7
    jr   nz, jr_020_6C0B                          ; $6C18: $20 $F1

    ld   a, $03                                   ; $6C1A: $3E $03
    ld   [wPaletteDataFlags], a                    ; $6C1C: $EA $D1 $DD
    xor  a                                        ; $6C1F: $AF
    ld   [wPaletteUnknownE], a                    ; $6C20: $EA $D5 $DD
    ret                                           ; $6C23: $C9

Func_020_6C24::
    ldh  a, [hIsGBC]                              ; $6C24: $F0 $FE
    and  a                                        ; $6C26: $A7
    jr   z, jr_020_6C4E                           ; $6C27: $28 $25

    ld   hl, $DC50                                ; $6C29: $21 $50 $DC
    ld   a, [wTunicType]                          ; $6C2C: $FA $0F $DC
    and  a                                        ; $6C2F: $A7
    jr   z, jr_020_6C3D                           ; $6C30: $28 $0B

    inc  a                                        ; $6C32: $3C
    sla  a                                        ; $6C33: $CB $27
    sla  a                                        ; $6C35: $CB $27
    sla  a                                        ; $6C37: $CB $27
    ld   c, a                                     ; $6C39: $4F
    ld   b, $00                                   ; $6C3A: $06 $00
    add  hl, bc                                   ; $6C3C: $09

jr_020_6C3D:
    ld   b, $08                                   ; $6C3D: $06 $08

jr_020_6C3F:
    ld   a, $02                                   ; $6C3F: $3E $02
    ld   [rSVBK], a                               ; $6C41: $E0 $70
    ld   c, [hl]                                  ; $6C43: $4E
    xor  a                                        ; $6C44: $AF
    ld   [rSVBK], a                               ; $6C45: $E0 $70
    ld   [hl], c                                  ; $6C47: $71
    inc  hl                                       ; $6C48: $23
    dec  b                                        ; $6C49: $05
    ld   a, b                                     ; $6C4A: $78
    and  a                                        ; $6C4B: $A7
    jr   nz, jr_020_6C3F                          ; $6C4C: $20 $F1

jr_020_6C4E:
    ret                                           ; $6C4E: $C9

Func_020_6C4F::
    ldh  a, [hIsGBC]                              ; $6C4F: $F0 $FE
    and  a                                        ; $6C51: $A7
    jp   z, label_020_6B81                        ; $6C52: $CA $81 $6B

    ld   a, [wC16C]                               ; $6C55: $FA $6C $C1
    and  $01                                      ; $6C58: $E6 $01
    jr   z, jr_020_6C60                           ; $6C5A: $28 $04

    ld   a, $02                                   ; $6C5C: $3E $02
    jr   jr_020_6C76                              ; $6C5E: $18 $16

jr_020_6C60:
    ld   a, $04                                   ; $6C60: $3E $04
    ldh  [$FFE4], a                               ; $6C62: $E0 $E4
    ld   a, $08                                   ; $6C64: $3E $08
    ldh  [$FFE5], a                               ; $6C66: $E0 $E5
    ld   a, $10                                   ; $6C68: $3E $10
    ldh  [hFreeWarpDataAddress], a                ; $6C6A: $E0 $E6
    ld   hl, $DC10                                ; $6C6C: $21 $10 $DC
    ld   d, $40                                   ; $6C6F: $16 $40
    call Func_020_6A68                            ; $6C71: $CD $68 $6A
    ld   a, $01                                   ; $6C74: $3E $01

jr_020_6C76:
    ld   [wPaletteDataFlags], a                    ; $6C76: $EA $D1 $DD
    ret                                           ; $6C79: $C9

Func_020_6C7A::
    ldh  a, [hIsGBC]                              ; $6C7A: $F0 $FE
    and  a                                        ; $6C7C: $A7
    jp   z, label_020_6B81                        ; $6C7D: $CA $81 $6B

    ld   a, [wC16C]                               ; $6C80: $FA $6C $C1
    and  $01                                      ; $6C83: $E6 $01
    jr   z, jr_020_6C8B                           ; $6C85: $28 $04

    ld   a, $02                                   ; $6C87: $3E $02
    jr   jr_020_6CA3                              ; $6C89: $18 $18

jr_020_6C8B:
    ld   a, $04                                   ; $6C8B: $3E $04
    ldh  [$FFE4], a                               ; $6C8D: $E0 $E4
    ld   a, $08                                   ; $6C8F: $3E $08
    ldh  [$FFE5], a                               ; $6C91: $E0 $E5
    ld   a, $10                                   ; $6C93: $3E $10
    ldh  [hFreeWarpDataAddress], a                ; $6C95: $E0 $E6
    ld   hl, $DC10                                ; $6C97: $21 $10 $DC
    ld   a, $40                                   ; $6C9A: $3E $40
    ldh  [hScratch3], a                           ; $6C9C: $E0 $DA
    call Func_020_6AF5                            ; $6C9E: $CD $F5 $6A
    ld   a, $01                                   ; $6CA1: $3E $01

jr_020_6CA3:
    ld   [wPaletteDataFlags], a                    ; $6CA3: $EA $D1 $DD
    ret                                           ; $6CA6: $C9

    ld   a, [$C3CA]                               ; $6CA7: $FA $CA $C3
    cp   $20                                      ; $6CAA: $FE $20
    jr   z, jr_020_6D0D                           ; $6CAC: $28 $5F

    push af                                       ; $6CAE: $F5
    and  $02                                      ; $6CAF: $E6 $02
    jr   nz, jr_020_6CB5                          ; $6CB1: $20 $02

    ld   a, $01                                   ; $6CB3: $3E $01

jr_020_6CB5:
    or   $80                                      ; $6CB5: $F6 $80
    ld   [wPaletteDataFlags], a                    ; $6CB7: $EA $D1 $DD
    ld   a, [$C3CA]                               ; $6CBA: $FA $CA $C3
    and  $01                                      ; $6CBD: $E6 $01
    swap a                                        ; $6CBF: $CB $37
    ld   [wPaletteUnknownC], a                    ; $6CC1: $EA $D3 $DD
    ld   a, $10                                   ; $6CC4: $3E $10
    ld   [wPaletteUnknownD], a                    ; $6CC6: $EA $D4 $DD
    pop  af                                       ; $6CC9: $F1
    inc  a                                        ; $6CCA: $3C
    ld   [$C3CA], a                               ; $6CCB: $EA $CA $C3
    ld   a, $08                                   ; $6CCE: $3E $08
    ldh  [$FFE4], a                               ; $6CD0: $E0 $E4
    ld   a, $10                                   ; $6CD2: $3E $10
    ldh  [$FFE5], a                               ; $6CD4: $E0 $E5
    ld   a, $20                                   ; $6CD6: $3E $20
    ldh  [hFreeWarpDataAddress], a                ; $6CD8: $E0 $E6
    ld   hl, $DC10                                ; $6CDA: $21 $10 $DC
    ld   a, $40                                   ; $6CDD: $3E $40
    ldh  [hScratch3], a                           ; $6CDF: $E0 $DA
    ld   a, [wTransitionGfx]                      ; $6CE1: $FA $7F $C1
    cp   $03                                      ; $6CE4: $FE $03
    jr   z, jr_020_6CFA                           ; $6CE6: $28 $12

    ld   a, [wPaletteDataFlags]                    ; $6CE8: $FA $D1 $DD
    push af                                       ; $6CEB: $F5
    call Func_020_6A30                            ; $6CEC: $CD $30 $6A
    pop  af                                       ; $6CEF: $F1
    ld   [wPaletteDataFlags], a                    ; $6CF0: $EA $D1 $DD
    ld   a, $01                                   ; $6CF3: $3E $01
    ld   [wPaletteUnknownE], a                    ; $6CF5: $EA $D5 $DD
    jr   jr_020_6D0D                              ; $6CF8: $18 $13

jr_020_6CFA:
    ld   a, [$C3CA]                               ; $6CFA: $FA $CA $C3
    dec  a                                        ; $6CFD: $3D
    and  $03                                      ; $6CFE: $E6 $03
    jr   nz, jr_020_6D0D                          ; $6D00: $20 $0B

    ld   a, [wPaletteDataFlags]                    ; $6D02: $FA $D1 $DD
    push af                                       ; $6D05: $F5
    call Func_020_6AF5                            ; $6D06: $CD $F5 $6A
    pop  af                                       ; $6D09: $F1
    ld   [wPaletteDataFlags], a                    ; $6D0A: $EA $D1 $DD

jr_020_6D0D:
    ret                                           ; $6D0D: $C9

Func_020_6D0E::
    ld   a, [hl]                                  ; $6D0E: $7E
    dec  a                                        ; $6D0F: $3D
    cp   $04                                      ; $6D10: $FE $04
    jr   c, jr_020_6D51                           ; $6D12: $38 $3D

    ldh  a, [hFrameCounter]                       ; $6D14: $F0 $E7
    and  $01                                      ; $6D16: $E6 $01
    jr   z, jr_020_6D1E                           ; $6D18: $28 $04

    ld   a, $02                                   ; $6D1A: $3E $02
    jr   jr_020_6D4E                              ; $6D1C: $18 $30

jr_020_6D1E:
    ld   a, [hl]                                  ; $6D1E: $7E
    dec  a                                        ; $6D1F: $3D
    cp   $0E                                      ; $6D20: $FE $0E
    jr   c, jr_020_6D38                           ; $6D22: $38 $14

    ld   a, $01                                   ; $6D24: $3E $01
    ldh  [$FFE4], a                               ; $6D26: $E0 $E4
    ld   a, $02                                   ; $6D28: $3E $02
    ldh  [$FFE5], a                               ; $6D2A: $E0 $E5
    ld   a, $04                                   ; $6D2C: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6D2E: $E0 $E6
    ld   hl, $DC30                                ; $6D30: $21 $30 $DC
    ld   d, $20                                   ; $6D33: $16 $20
    call Func_020_6A68                            ; $6D35: $CD $68 $6A

jr_020_6D38:
    ld   a, $01                                   ; $6D38: $3E $01
    ldh  [$FFE4], a                               ; $6D3A: $E0 $E4
    ld   a, $02                                   ; $6D3C: $3E $02
    ldh  [$FFE5], a                               ; $6D3E: $E0 $E5
    ld   a, $04                                   ; $6D40: $3E $04
    ldh  [hFreeWarpDataAddress], a                ; $6D42: $E0 $E6
    ld   hl, $DC10                                ; $6D44: $21 $10 $DC
    ld   d, $20                                   ; $6D47: $16 $20
    call Func_020_6A68                            ; $6D49: $CD $68 $6A
    ld   a, $01                                   ; $6D4C: $3E $01

jr_020_6D4E:
    ld   [wPaletteDataFlags], a                    ; $6D4E: $EA $D1 $DD

jr_020_6D51:
    ret                                           ; $6D51: $C9

Func_020_6D52::
    ld   e, $20                                   ; $6D52: $1E $20
    ld   a, [hl]                                  ; $6D54: $7E
    cp   $30                                      ; $6D55: $FE $30
    jr   c, jr_020_6D60                           ; $6D57: $38 $07

    ld   hl, $DC50                                ; $6D59: $21 $50 $DC
    ld   a, $02                                   ; $6D5C: $3E $02
    jr   jr_020_6D65                              ; $6D5E: $18 $05

jr_020_6D60:
    ld   hl, $DC10                                ; $6D60: $21 $10 $DC
    ld   a, $01                                   ; $6D63: $3E $01

jr_020_6D65:
    ld   [wPaletteDataFlags], a                    ; $6D65: $EA $D1 $DD

jr_020_6D68:
    push hl                                       ; $6D68: $E5
    ld   a, [hl]                                  ; $6D69: $7E
    inc  a                                        ; $6D6A: $3C
    and  $1F                                      ; $6D6B: $E6 $1F
    jr   nz, jr_020_6D71                          ; $6D6D: $20 $02

    ld   a, $1F                                   ; $6D6F: $3E $1F

jr_020_6D71:
    ldh  [hScratch0], a                           ; $6D71: $E0 $D7
    ld   a, [hl+]                                 ; $6D73: $2A
    and  $E0                                      ; $6D74: $E6 $E0
    swap a                                        ; $6D76: $CB $37
    ld   d, a                                     ; $6D78: $57
    ld   a, [hl]                                  ; $6D79: $7E
    and  $03                                      ; $6D7A: $E6 $03
    swap a                                        ; $6D7C: $CB $37
    or   d                                        ; $6D7E: $B2
    add  $02                                      ; $6D7F: $C6 $02
    and  $3E                                      ; $6D81: $E6 $3E
    jr   nz, jr_020_6D87                          ; $6D83: $20 $02

    ld   a, $3E                                   ; $6D85: $3E $3E

jr_020_6D87:
    ldh  [hScratch1], a                           ; $6D87: $E0 $D8
    ld   a, [hl]                                  ; $6D89: $7E
    add  $04                                      ; $6D8A: $C6 $04
    and  $7C                                      ; $6D8C: $E6 $7C
    jr   nz, jr_020_6D92                          ; $6D8E: $20 $02

    ld   a, $7C                                   ; $6D90: $3E $7C

jr_020_6D92:
    ldh  [hScratch2], a                           ; $6D92: $E0 $D9
    pop  hl                                       ; $6D94: $E1
    ldh  a, [hScratch0]                           ; $6D95: $F0 $D7
    ld   d, a                                     ; $6D97: $57
    ldh  a, [hScratch1]                           ; $6D98: $F0 $D8
    swap a                                        ; $6D9A: $CB $37
    and  $E0                                      ; $6D9C: $E6 $E0
    or   d                                        ; $6D9E: $B2
    ld   [hl+], a                                 ; $6D9F: $22
    ldh  a, [hScratch2]                           ; $6DA0: $F0 $D9
    ld   d, a                                     ; $6DA2: $57
    ldh  a, [hScratch1]                           ; $6DA3: $F0 $D8
    swap a                                        ; $6DA5: $CB $37
    and  $03                                      ; $6DA7: $E6 $03
    or   d                                        ; $6DA9: $B2
    ld   [hl+], a                                 ; $6DAA: $22
    dec  e                                        ; $6DAB: $1D
    jr   nz, jr_020_6D68                          ; $6DAC: $20 $BA

    ret                                           ; $6DAE: $C9

LoadRoomObjectsAttributes::
    ld   a, [wIsIndoor]                           ; $6DAF: $FA $A5 $DB
    and  a                                        ; $6DB2: $A7
    ret  nz                                       ; $6DB3: $C0

    ldh  a, [hMapRoom]                            ; $6DB4: $F0 $F6
    cp   $0E                                      ; $6DB6: $FE $0E
    jr   nz, .jr_020_6DC6                         ; $6DB8: $20 $0C

    ld   a, [$D80E]                               ; $6DBA: $FA $0E $D8
    and  $10                                      ; $6DBD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DBF: $28 $59

    ld   hl, $5090                                ; $6DC1: $21 $90 $50
    jr   .jr_020_6E14                              ; $6DC4: $18 $4E

.jr_020_6DC6
    cp   $8C                                      ; $6DC6: $FE $8C
    jr   nz, .jr_020_6DD6                         ; $6DC8: $20 $0C

    ld   a, [$D88C]                               ; $6DCA: $FA $8C $D8
    and  $10                                      ; $6DCD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DCF: $28 $49

    ld   hl, $51D0                                ; $6DD1: $21 $D0 $51
    jr   .jr_020_6E14                              ; $6DD4: $18 $3E

.jr_020_6DD6
    cp   $79                                      ; $6DD6: $FE $79
    jr   nz, .jr_020_6DE6                         ; $6DD8: $20 $0C

    ld   a, [$D879]                               ; $6DDA: $FA $79 $D8
    and  $10                                      ; $6DDD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DDF: $28 $39

    ld   hl, $5180                                ; $6DE1: $21 $80 $51
    jr   .jr_020_6E14                              ; $6DE4: $18 $2E

.jr_020_6DE6
    cp   $06                                      ; $6DE6: $FE $06
    jr   nz, .jr_020_6DF6                         ; $6DE8: $20 $0C

    ld   a, [$D806]                               ; $6DEA: $FA $06 $D8
    and  $10                                      ; $6DED: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DEF: $28 $29

    ld   hl, $5040                                ; $6DF1: $21 $40 $50
    jr   .jr_020_6E14                             ; $6DF4: $18 $1E

.jr_020_6DF6
    cp   $1B                                      ; $6DF6: $FE $1B
    jr   nz, .jr_020_6E06                         ; $6DF8: $20 $0C

    ld   a, [$D82B]                               ; $6DFA: $FA $2B $D8
    and  $10                                      ; $6DFD: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6DFF: $28 $19

    ld   hl, $50E0                                ; $6E01: $21 $E0 $50
    jr   .jr_020_6E14                             ; $6E04: $18 $0E

.jr_020_6E06
    cp   $2B                                      ; $6E06: $FE $2B
    jr   nz, .jr_020_6E1A                         ; $6E08: $20 $10

    ld   a, [$D82B]                               ; $6E0A: $FA $2B $D8
    and  $10                                      ; $6E0D: $E6 $10
    jr   z, .jr_020_6E1A                          ; $6E0F: $28 $09

    ld   hl, $5130                                ; $6E11: $21 $30 $51

.jr_020_6E14
    ld   a, $27                                   ; $6E14: $3E $27
    ldh  [hScratch0], a                           ; $6E16: $E0 $D7
    jr   .copyAttributes                          ; $6E18: $18 $22

.jr_020_6E1A
    ; Set attributes bank for rooms < $CC
    ld   a, BANK(OverworldObjectsAttributesTableA) ; $6E1A: $3E $26
    ldh  [hScratch0], a                           ; $6E1C: $E0 $D7
    ; If the room id >= $CC…
    ldh  a, [hMapRoom]                            ; $6E1E: $F0 $F6
    cp   $CC                                      ; $6E20: $FE $CC
    jr   c, .bankEnd                              ; $6E22: $38 $06
    ld   hl, hScratch0                            ; $6E24: $21 $D7 $FF
    ; … use BANK(OverworldObjectsAttributesTableA) + 1 for the attributes bank
    inc  [hl]                                     ; $6E27: $34
    sub  $CC                                      ; $6E28: $D6 $CC
.bankEnd

    ld   hl, OverworldObjectsAttributesTableA     ; $6E2A: $21 $00 $40
    ld   b, a                                     ; $6E2D: $47
    and  b                                        ; $6E2E: $A0

    ; hl += $50 * MapRoom
.mapRoomLoop
    jr   z, .copyAttributes                       ; $6E2F: $28 $0B

    ld   a, l                                     ; $6E31: $7D
    add  $50                                      ; $6E32: $C6 $50
    ld   l, a                                     ; $6E34: $6F
    ld   a, h                                     ; $6E35: $7C
    adc  $00                                      ; $6E36: $CE $00
    ld   h, a                                     ; $6E38: $67
    dec  b                                        ; $6E39: $05
    jr   .mapRoomLoop                             ; $6E3A: $18 $F3

.copyAttributes
    ; Copy the objects attributes to the room objects attributes in WRAM 2
    ld   de, wRoomObjects                         ; $6E3C: $11 $11 $D7
.loop
    ld   bc, $000A                                ; $6E3F: $01 $0A $00
    push de                                       ; $6E42: $D5
    call CopyObjectsAttributesToWRAM2                  ; $6E43: $CD $1A $0B
    pop  de                                       ; $6E46: $D1
    ld   a, e                                     ; $6E47: $7B
    add  $10                                      ; $6E48: $C6 $10
    ld   e, a                                     ; $6E4A: $5F
    cp   $91                                      ; $6E4B: $FE $91
    jr   nz, .loop                                ; $6E4D: $20 $F0

    ret                                           ; $6E4F: $C9

Func_020_6E50::
    push hl                                       ; $6E50: $E5
    ld   c, [hl]                                  ; $6E51: $4E
    ld   b, $0E                                   ; $6E52: $06 $0E
    ld   hl, $6E65                                ; $6E54: $21 $65 $6E

jr_020_6E57:
    ld   a, [hl+]                                 ; $6E57: $2A
    cp   c                                        ; $6E58: $B9
    jr   nz, jr_020_6E5F                          ; $6E59: $20 $04

    scf                                           ; $6E5B: $37
    ccf                                           ; $6E5C: $3F
    jr   jr_020_6E63                              ; $6E5D: $18 $04

jr_020_6E5F:
    dec  b                                        ; $6E5F: $05
    jr   nz, jr_020_6E57                          ; $6E60: $20 $F5

    scf                                           ; $6E62: $37

jr_020_6E63:
    pop  hl                                       ; $6E63: $E1
    ret                                           ; $6E64: $C9

    inc  bc                                       ; $6E65: $03
    inc  b                                        ; $6E66: $04
    add  hl, bc                                   ; $6E67: $09
    ld   e, [hl]                                  ; $6E68: $5E
    sub  c                                        ; $6E69: $91
    and  c                                        ; $6E6A: $A1
    xor  d                                        ; $6E6B: $AA
    call nz, $CCC6                                ; $6E6C: $C4 $C6 $CC
    db   $db                                      ; $6E6F: $DB
    pop  hl                                       ; $6E70: $E1
    db   $e3                                      ; $6E71: $E3
    db   $E8                                      ; $6E72: $E8

; Sprite table for overworld?
data_020_6E73::
    db   $1C                                      ; $6E73: $1C
    inc  e                                        ; $6E74: $1C
    ld   a, $3C                                   ; $6E75: $3E $3C
    ld   a, $3E                                   ; $6E77: $3E $3E
    ld   a, $30                                   ; $6E79: $3E $30
    rrca                                          ; $6E7B: $0F
    ld   [hl], $36                                ; $6E7C: $36 $36
    ld   a, [de]                                  ; $6E7E: $1A
    rrca                                          ; $6E7F: $0F
    inc  [hl]                                     ; $6E80: $34
    rrca                                          ; $6E81: $0F
    ld   a, $20                                   ; $6E82: $3E $20
    jr   nz, @+$11                                ; $6E84: $20 $0F

    jr   c, jr_020_6EB0                           ; $6E86: $38 $28

    jr   z, jr_020_6EBC                           ; $6E88: $28 $32

    ld   [hl-], a                                 ; $6E8A: $32
    jr   nz, jr_020_6EAD                          ; $6E8B: $20 $20

    jr   c, jr_020_6EC7                           ; $6E8D: $38 $38

    jr   z, @+$2A                                 ; $6E8F: $28 $28

    ld   [hl-], a                                 ; $6E91: $32
    ld   [hl-], a                                 ; $6E92: $32
    rrca                                          ; $6E93: $0F
    ld   h, $0F                                   ; $6E94: $26 $0F
    inc  h                                        ; $6E96: $24
    rrca                                          ; $6E97: $0F
    ld   e, $2A                                   ; $6E98: $1E $2A
    rrca                                          ; $6E9A: $0F
    ld   h, $26                                   ; $6E9B: $26 $26
    ld   l, $2E                                   ; $6E9D: $2E $2E
    rrca                                          ; $6E9F: $0F
    ld   a, [hl+]                                 ; $6EA0: $2A
    ld   a, [hl+]                                 ; $6EA1: $2A
    ld   a, [hl+]                                 ; $6EA2: $2A
    rrca                                          ; $6EA3: $0F
    inc  h                                        ; $6EA4: $24
    ld   l, $2E                                   ; $6EA5: $2E $2E
    ld   a, [hl-]                                 ; $6EA7: $3A
    rrca                                          ; $6EA8: $0F
    ld   h, $2C                                   ; $6EA9: $26 $2C
    ld   [hl+], a                                 ; $6EAB: $22
    ld   [hl+], a                                 ; $6EAC: $22

jr_020_6EAD:
    ld   [hl+], a                                 ; $6EAD: $22
    rrca                                          ; $6EAE: $0F
    ld   a, [hl-]                                 ; $6EAF: $3A

jr_020_6EB0:
    ld   a, [hl-]                                 ; $6EB0: $3A
    rrca                                          ; $6EB1: $0F
    inc  l                                        ; $6EB2: $2C

; Sprites banks table for indoors?
data_020_6EB3::
    rst  $38                                      ; $6EB3: $FF
    nop                                           ; $6EB4: $00
    nop                                           ; $6EB5: $00
    nop                                           ; $6EB6: $00
    rst  $38                                      ; $6EB7: $FF
    ld   bc, $0500                                ; $6EB8: $01 $00 $05
    nop                                           ; $6EBB: $00

jr_020_6EBC:
    add  hl, bc                                   ; $6EBC: $09
    nop                                           ; $6EBD: $00
    nop                                           ; $6EBE: $00
    dec  b                                        ; $6EBF: $05
    dec  b                                        ; $6EC0: $05
    dec  b                                        ; $6EC1: $05
    rst  $38                                      ; $6EC2: $FF
    nop                                           ; $6EC3: $00
    nop                                           ; $6EC4: $00
    rst  $38                                      ; $6EC5: $FF
    rst  $38                                      ; $6EC6: $FF

jr_020_6EC7:
    ld   [bc], a                                  ; $6EC7: $02
    ld   bc, $0101                                ; $6EC8: $01 $01 $01
    rst  $38                                      ; $6ECB: $FF
    rst  $38                                      ; $6ECC: $FF
    rst  $38                                      ; $6ECD: $FF
    rst  $38                                      ; $6ECE: $FF
    rst  $38                                      ; $6ECF: $FF
    rst  $38                                      ; $6ED0: $FF
    rst  $38                                      ; $6ED1: $FF
    rst  $38                                      ; $6ED2: $FF
    rst  $38                                      ; $6ED3: $FF
    rst  $38                                      ; $6ED4: $FF
    rst  $38                                      ; $6ED5: $FF
    rst  $38                                      ; $6ED6: $FF
    rst  $38                                      ; $6ED7: $FF
    nop                                           ; $6ED8: $00
    rst  $38                                      ; $6ED9: $FF
    nop                                           ; $6EDA: $00
    rst  $38                                      ; $6EDB: $FF
    nop                                           ; $6EDC: $00
    rst  $38                                      ; $6EDD: $FF
    rst  $38                                      ; $6EDE: $FF
    ld   [bc], a                                  ; $6EDF: $02
    nop                                           ; $6EE0: $00
    rst  $38                                      ; $6EE1: $FF
    ld   c, $FF                                   ; $6EE2: $0E $FF
    rst  $38                                      ; $6EE4: $FF
    rst  $38                                      ; $6EE5: $FF
    rst  $38                                      ; $6EE6: $FF
    rst  $38                                      ; $6EE7: $FF
    rst  $38                                      ; $6EE8: $FF
    ld   bc, $FFFF                                ; $6EE9: $01 $FF $FF
    rst  $38                                      ; $6EEC: $FF
    rst  $38                                      ; $6EED: $FF
    rst  $38                                      ; $6EEE: $FF
    rst  $38                                      ; $6EEF: $FF
    rst  $38                                      ; $6EF0: $FF
    rst  $38                                      ; $6EF1: $FF
    rst  $38                                      ; $6EF2: $FF
    ld   [bc], a                                  ; $6EF3: $02
    ld   [bc], a                                  ; $6EF4: $02
    rst  $38                                      ; $6EF5: $FF
    ld   [bc], a                                  ; $6EF6: $02
    ld   [bc], a                                  ; $6EF7: $02
    add  hl, bc                                   ; $6EF8: $09
    add  hl, bc                                   ; $6EF9: $09
    rst  $38                                      ; $6EFA: $FF
    ld   [bc], a                                  ; $6EFB: $02
    ld   [bc], a                                  ; $6EFC: $02
    add  hl, bc                                   ; $6EFD: $09
    ld   [bc], a                                  ; $6EFE: $02
    add  hl, bc                                   ; $6EFF: $09
    add  hl, bc                                   ; $6F00: $09
    add  hl, bc                                   ; $6F01: $09
    add  hl, bc                                   ; $6F02: $09
    add  hl, bc                                   ; $6F03: $09
    rst  $38                                      ; $6F04: $FF
    ld   bc, vBlankContinue.drawLinkSprite        ; $6F05: $01 $01 $05
    nop                                           ; $6F08: $00
    nop                                           ; $6F09: $00
    nop                                           ; $6F0A: $00
    nop                                           ; $6F0B: $00
    ld   a, [bc]                                  ; $6F0C: $0A
    ld   a, [bc]                                  ; $6F0D: $0A
    ld   a, [bc]                                  ; $6F0E: $0A
    ld   a, [bc]                                  ; $6F0F: $0A
    nop                                           ; $6F10: $00
    nop                                           ; $6F11: $00
    nop                                           ; $6F12: $00
    add  hl, bc                                   ; $6F13: $09
    nop                                           ; $6F14: $00
    nop                                           ; $6F15: $00
    add  hl, bc                                   ; $6F16: $09
    add  hl, bc                                   ; $6F17: $09
    nop                                           ; $6F18: $00
    nop                                           ; $6F19: $00
    add  hl, bc                                   ; $6F1A: $09
    add  hl, bc                                   ; $6F1B: $09
    add  hl, bc                                   ; $6F1C: $09
    add  hl, bc                                   ; $6F1D: $09
    nop                                           ; $6F1E: $00
    nop                                           ; $6F1F: $00
    rst  $38                                      ; $6F20: $FF
    ld   [bc], a                                  ; $6F21: $02
    rst  $38                                      ; $6F22: $FF
    add  hl, bc                                   ; $6F23: $09
    nop                                           ; $6F24: $00
    nop                                           ; $6F25: $00
    rst  $38                                      ; $6F26: $FF
    nop                                           ; $6F27: $00
    nop                                           ; $6F28: $00
    nop                                           ; $6F29: $00
    rst  $38                                      ; $6F2A: $FF
    rst  $38                                      ; $6F2B: $FF
    nop                                           ; $6F2C: $00
    ld   bc, $0005                                ; $6F2D: $01 $05 $00
    nop                                           ; $6F30: $00
    nop                                           ; $6F31: $00
    nop                                           ; $6F32: $00
    rst  $38                                      ; $6F33: $FF
    dec  b                                        ; $6F34: $05
    rst  $38                                      ; $6F35: $FF
    rst  $38                                      ; $6F36: $FF
    rst  $38                                      ; $6F37: $FF
    ld   b, $07                                   ; $6F38: $06 $07
    rlca                                          ; $6F3A: $07
    rlca                                          ; $6F3B: $07
    rst  $38                                      ; $6F3C: $FF
    rst  $38                                      ; $6F3D: $FF
    ld   b, $06                                   ; $6F3E: $06 $06
    rst  $38                                      ; $6F40: $FF
    rst  $38                                      ; $6F41: $FF
    rst  $38                                      ; $6F42: $FF
    add  hl, bc                                   ; $6F43: $09
    rst  $38                                      ; $6F44: $FF
    rst  $38                                      ; $6F45: $FF
    rst  $38                                      ; $6F46: $FF
    rlca                                          ; $6F47: $07
    rst  $38                                      ; $6F48: $FF
    rst  $38                                      ; $6F49: $FF
    rlca                                          ; $6F4A: $07
    rst  $38                                      ; $6F4B: $FF
    rlca                                          ; $6F4C: $07
    dec  b                                        ; $6F4D: $05
    rst  $38                                      ; $6F4E: $FF
    rst  $38                                      ; $6F4F: $FF
    dec  b                                        ; $6F50: $05
    dec  b                                        ; $6F51: $05
    dec  b                                        ; $6F52: $05
    rst  $38                                      ; $6F53: $FF
    ld   bc, $FFFF                                ; $6F54: $01 $FF $FF
    rst  $38                                      ; $6F57: $FF
    rst  $38                                      ; $6F58: $FF
    rst  $38                                      ; $6F59: $FF
    rst  $38                                      ; $6F5A: $FF
    rst  $38                                      ; $6F5B: $FF
    rst  $38                                      ; $6F5C: $FF
    rst  $38                                      ; $6F5D: $FF
    rst  $38                                      ; $6F5E: $FF
    add  hl, de                                   ; $6F5F: $19
    rst  $38                                      ; $6F60: $FF
    rst  $38                                      ; $6F61: $FF
    rst  $38                                      ; $6F62: $FF
    inc  bc                                       ; $6F63: $03
    ld   c, $03                                   ; $6F64: $0E $03
    ld   c, $FF                                   ; $6F66: $0E $FF
    ld   c, $0E                                   ; $6F68: $0E $0E
    ld   c, $0E                                   ; $6F6A: $0E $0E
    ld   c, $0E                                   ; $6F6C: $0E $0E
    rst  $38                                      ; $6F6E: $FF
    ld   c, $0E                                   ; $6F6F: $0E $0E
    rst  $38                                      ; $6F71: $FF
    ld   c, $0E                                   ; $6F72: $0E $0E
    ld   c, $0E                                   ; $6F74: $0E $0E
    add  hl, bc                                   ; $6F76: $09
    nop                                           ; $6F77: $00
    ld   c, $09                                   ; $6F78: $0E $09
    rst  $38                                      ; $6F7A: $FF
    rst  $38                                      ; $6F7B: $FF
    ld   c, $09                                   ; $6F7C: $0E $09
    nop                                           ; $6F7E: $00
    ld   c, $FF                                   ; $6F7F: $0E $FF
    ld   [bc], a                                  ; $6F81: $02
    ld   c, $0E                                   ; $6F82: $0E $0E
    ld   c, $02                                   ; $6F84: $0E $02
    rst  $38                                      ; $6F86: $FF
    ld   bc, $0101                                ; $6F87: $01 $01 $01
    add  hl, bc                                   ; $6F8A: $09
    nop                                           ; $6F8B: $00
    nop                                           ; $6F8C: $00
    nop                                           ; $6F8D: $00
    nop                                           ; $6F8E: $00
    nop                                           ; $6F8F: $00
    nop                                           ; $6F90: $00
    nop                                           ; $6F91: $00
    nop                                           ; $6F92: $00
    rrca                                          ; $6F93: $0F
    rrca                                          ; $6F94: $0F
    rrca                                          ; $6F95: $0F
    ld   [$C00], sp                               ; $6F96: $08 $00 $0C
    inc  c                                        ; $6F99: $0C
    inc  bc                                       ; $6F9A: $03
    inc  c                                        ; $6F9B: $0C
    inc  c                                        ; $6F9C: $0C
    inc  c                                        ; $6F9D: $0C
    nop                                           ; $6F9E: $00
    nop                                           ; $6F9F: $00
    nop                                           ; $6FA0: $00
    inc  c                                        ; $6FA1: $0C
    nop                                           ; $6FA2: $00
    inc  bc                                       ; $6FA3: $03
    inc  bc                                       ; $6FA4: $03
    nop                                           ; $6FA5: $00
    add  hl, de                                   ; $6FA6: $19
    nop                                           ; $6FA7: $00
    ld   [$030C], sp                              ; $6FA8: $08 $0C $03
    inc  c                                        ; $6FAB: $0C
    inc  c                                        ; $6FAC: $0C
    ld   [$0C19], sp                              ; $6FAD: $08 $19 $0C
    dec  b                                        ; $6FB0: $05
    inc  c                                        ; $6FB1: $0C
    nop                                           ; $6FB2: $00
    nop                                           ; $6FB3: $00
    inc  bc                                       ; $6FB4: $03
    inc  bc                                       ; $6FB5: $03
    inc  bc                                       ; $6FB6: $03
    inc  bc                                       ; $6FB7: $03
    inc  bc                                       ; $6FB8: $03
    inc  bc                                       ; $6FB9: $03
    inc  bc                                       ; $6FBA: $03
    inc  bc                                       ; $6FBB: $03
    inc  bc                                       ; $6FBC: $03
    inc  bc                                       ; $6FBD: $03
    inc  bc                                       ; $6FBE: $03
    inc  bc                                       ; $6FBF: $03
    rst  $38                                      ; $6FC0: $FF
    ld   bc, restoreSavedWRAMBankAndReturn        ; $6FC1: $01 $FF $03
    inc  bc                                       ; $6FC4: $03
    inc  bc                                       ; $6FC5: $03
    rst  $38                                      ; $6FC6: $FF
    inc  bc                                       ; $6FC7: $03
    inc  bc                                       ; $6FC8: $03
    rst  $38                                      ; $6FC9: $FF
    dec  bc                                       ; $6FCA: $0B
    rst  $38                                      ; $6FCB: $FF
    inc  bc                                       ; $6FCC: $03
    rst  $38                                      ; $6FCD: $FF
    rst  $38                                      ; $6FCE: $FF
    rst  $38                                      ; $6FCF: $FF
    rlca                                          ; $6FD0: $07
    rlca                                          ; $6FD1: $07
    rst  $38                                      ; $6FD2: $FF
    rst  $38                                      ; $6FD3: $FF
    ld   b, $FF                                   ; $6FD4: $06 $FF
    rst  $38                                      ; $6FD6: $FF
    nop                                           ; $6FD7: $00
    rst  $38                                      ; $6FD8: $FF
    rst  $38                                      ; $6FD9: $FF
    rst  $38                                      ; $6FDA: $FF
    rst  $38                                      ; $6FDB: $FF
    ld   c, $0E                                   ; $6FDC: $0E $0E
    rst  $38                                      ; $6FDE: $FF
    rst  $38                                      ; $6FDF: $FF
    ld   c, $0E                                   ; $6FE0: $0E $0E
    nop                                           ; $6FE2: $00
    rst  $38                                      ; $6FE3: $FF
    nop                                           ; $6FE4: $00
    rst  $38                                      ; $6FE5: $FF
    rst  $38                                      ; $6FE6: $FF
    rst  $38                                      ; $6FE7: $FF
    rst  $38                                      ; $6FE8: $FF
    rst  $38                                      ; $6FE9: $FF
    nop                                           ; $6FEA: $00
    rst  $38                                      ; $6FEB: $FF
    rla                                           ; $6FEC: $17
    rla                                           ; $6FED: $17
    rla                                           ; $6FEE: $17
    rst  $38                                      ; $6FEF: $FF
    inc  bc                                       ; $6FF0: $03
    rst  $38                                      ; $6FF1: $FF
    rst  $38                                      ; $6FF2: $FF
    rst  $38                                      ; $6FF3: $FF
    rst  $38                                      ; $6FF4: $FF
    ld   a, [bc]                                  ; $6FF5: $0A
    ld   a, [bc]                                  ; $6FF6: $0A
    ld   a, [bc]                                  ; $6FF7: $0A
    rst  $38                                      ; $6FF8: $FF
    rst  $38                                      ; $6FF9: $FF
    rst  $38                                      ; $6FFA: $FF
    ld   a, [bc]                                  ; $6FFB: $0A
    ld   a, [bc]                                  ; $6FFC: $0A
    rst  $38                                      ; $6FFD: $FF
    dec  bc                                       ; $6FFE: $0B
    rst  $38                                      ; $6FFF: $FF
    dec  c                                        ; $7000: $0D
    rst  $38                                      ; $7001: $FF
    rst  $38                                      ; $7002: $FF
    ld   a, [bc]                                  ; $7003: $0A
    ld   a, [bc]                                  ; $7004: $0A
    rst  $38                                      ; $7005: $FF
    nop                                           ; $7006: $00
    rst  $38                                      ; $7007: $FF
    rst  $38                                      ; $7008: $FF
    rst  $38                                      ; $7009: $FF
    rst  $38                                      ; $700A: $FF
    rst  $38                                      ; $700B: $FF
    rst  $38                                      ; $700C: $FF
    rst  $38                                      ; $700D: $FF
    rst  $38                                      ; $700E: $FF
    add  hl, bc                                   ; $700F: $09
    ld   bc, $0000                                ; $7010: $01 $00 $00
    rst  $38                                      ; $7013: $FF
    rst  $38                                      ; $7014: $FF
    rst  $38                                      ; $7015: $FF
    rst  $38                                      ; $7016: $FF
    rst  $38                                      ; $7017: $FF
    rst  $38                                      ; $7018: $FF
    rst  $38                                      ; $7019: $FF
    rst  $38                                      ; $701A: $FF
    rst  $38                                      ; $701B: $FF
    rst  $38                                      ; $701C: $FF
    rst  $38                                      ; $701D: $FF
    rst  $38                                      ; $701E: $FF
    rst  $38                                      ; $701F: $FF
    rst  $38                                      ; $7020: $FF
    rst  $38                                      ; $7021: $FF
    ld   bc, $FF0C                                ; $7022: $01 $0C $FF
    rst  $38                                      ; $7025: $FF
    rst  $38                                      ; $7026: $FF
    ld   a, [de]                                  ; $7027: $1A
    rst  $38                                      ; $7028: $FF
    rst  $38                                      ; $7029: $FF
    rst  $38                                      ; $702A: $FF
    rst  $38                                      ; $702B: $FF
    rst  $38                                      ; $702C: $FF
    inc  c                                        ; $702D: $0C
    inc  c                                        ; $702E: $0C
    inc  c                                        ; $702F: $0C
    inc  c                                        ; $7030: $0C
    inc  c                                        ; $7031: $0C
    ld   bc, label_C0C                            ; $7032: $01 $0C $0C
    inc  c                                        ; $7035: $0C
    inc  c                                        ; $7036: $0C
    inc  c                                        ; $7037: $0C
    inc  c                                        ; $7038: $0C
    inc  c                                        ; $7039: $0C
    inc  c                                        ; $703A: $0C
    inc  c                                        ; $703B: $0C
    inc  c                                        ; $703C: $0C
    inc  c                                        ; $703D: $0C
    inc  c                                        ; $703E: $0C
    dec  b                                        ; $703F: $05
    dec  b                                        ; $7040: $05
    dec  b                                        ; $7041: $05
    ld   bc, $0505                                ; $7042: $01 $05 $05
    dec  b                                        ; $7045: $05
    dec  b                                        ; $7046: $05
    dec  b                                        ; $7047: $05
    dec  b                                        ; $7048: $05
    dec  b                                        ; $7049: $05
    dec  b                                        ; $704A: $05
    dec  b                                        ; $704B: $05
    inc  b                                        ; $704C: $04
    dec  b                                        ; $704D: $05
    inc  b                                        ; $704E: $04
    inc  b                                        ; $704F: $04
    inc  b                                        ; $7050: $04
    nop                                           ; $7051: $00
    ld   [$0404], sp                              ; $7052: $08 $04 $04
    ld   [$0008], sp                              ; $7055: $08 $08 $00
    ld   [label_808], sp                          ; $7058: $08 $08 $08
    ld   [label_808], sp                          ; $705B: $08 $08 $08
    dec  b                                        ; $705E: $05
    dec  b                                        ; $705F: $05
    ld   [label_C0C], sp                          ; $7060: $08 $0C $0C
    ld   [vBlankContinue.linkSpriteDone], sp      ; $7063: $08 $04 $05
    inc  c                                        ; $7066: $0C
    inc  b                                        ; $7067: $04
    ld   [$0505], sp                              ; $7068: $08 $05 $05
    inc  c                                        ; $706B: $0C
    inc  c                                        ; $706C: $0C
    inc  c                                        ; $706D: $0C
    inc  c                                        ; $706E: $0C
    inc  c                                        ; $706F: $0C
    dec  b                                        ; $7070: $05
    inc  c                                        ; $7071: $0C
    inc  c                                        ; $7072: $0C
    inc  c                                        ; $7073: $0C
    inc  c                                        ; $7074: $0C
    inc  bc                                       ; $7075: $03
    inc  bc                                       ; $7076: $03
    nop                                           ; $7077: $00
    inc  bc                                       ; $7078: $03
    rst  $38                                      ; $7079: $FF
    ld   [$C00], sp                               ; $707A: $08 $00 $0C
    inc  c                                        ; $707D: $0C
    inc  b                                        ; $707E: $04
    inc  b                                        ; $707F: $04
    inc  c                                        ; $7080: $0C
    inc  c                                        ; $7081: $0C
    inc  c                                        ; $7082: $0C
    inc  c                                        ; $7083: $0C
    inc  c                                        ; $7084: $0C
    rst  $38                                      ; $7085: $FF
    ld   bc, $0100                                ; $7086: $01 $00 $01
    ld   bc, $0008                                ; $7089: $01 $08 $00
    ld   [label_808], sp                          ; $708C: $08 $08 $08
    ld   [IsZero], sp                             ; $708F: $08 $08 $0C
    inc  c                                        ; $7092: $0C
    rst  $38                                      ; $7093: $FF
    ld   [InterruptSerial], sp                    ; $7094: $08 $08 $04
    inc  c                                        ; $7097: $0C
    inc  c                                        ; $7098: $0C
    inc  c                                        ; $7099: $0C
    inc  c                                        ; $709A: $0C
    nop                                           ; $709B: $00
    ld   [label_C0C], sp                          ; $709C: $08 $0C $0C
    inc  c                                        ; $709F: $0C
    inc  c                                        ; $70A0: $0C
    inc  c                                        ; $70A1: $0C
    inc  c                                        ; $70A2: $0C
    inc  c                                        ; $70A3: $0C
    inc  c                                        ; $70A4: $0C
    inc  c                                        ; $70A5: $0C
    inc  c                                        ; $70A6: $0C
    inc  c                                        ; $70A7: $0C
    nop                                           ; $70A8: $00
    inc  c                                        ; $70A9: $0C
    inc  c                                        ; $70AA: $0C
    nop                                           ; $70AB: $00
    inc  c                                        ; $70AC: $0C
    inc  c                                        ; $70AD: $0C
    jr   jr_020_70B5                              ; $70AE: $18 $05

    nop                                           ; $70B0: $00
    db $08                                        ; $70B1: $08
    nop                                           ; $70B2: $00

; Sprites banks table for color dungeon?
data_020_70B3::
    nop                                           ; $70B3: $00
    nop                                           ; $70B4: $00

jr_020_70B5:
    dec  bc                                       ; $70B5: $0B
    dec  bc                                       ; $70B6: $0B
    nop                                           ; $70B7: $00
    nop                                           ; $70B8: $00
    dec  bc                                       ; $70B9: $0B
    dec  bc                                       ; $70BA: $0B
    dec  bc                                       ; $70BB: $0B
    dec  bc                                       ; $70BC: $0B
    dec  bc                                       ; $70BD: $0B
    dec  bc                                       ; $70BE: $0B
    dec  bc                                       ; $70BF: $0B
    dec  bc                                       ; $70C0: $0B
    dec  bc                                       ; $70C1: $0B
    ld   c, $0B                                   ; $70C2: $0E $0B
    dec  bc                                       ; $70C4: $0B
    dec  bc                                       ; $70C5: $0B
    jr   jr_020_70D3                              ; $70C6: $18 $0B

    dec  bc                                       ; $70C8: $0B
    rst  $38                                      ; $70C9: $FF
    rst  $38                                      ; $70CA: $FF
    rst  $38                                      ; $70CB: $FF
    rst  $38                                      ; $70CC: $FF
    rst  $38                                      ; $70CD: $FF
    rst  $38                                      ; $70CE: $FF
    rst  $38                                      ; $70CF: $FF
    rst  $38                                      ; $70D0: $FF
    rst  $38                                      ; $70D1: $FF
    rst  $38                                      ; $70D2: $FF

jr_020_70D3:
    ld   h, l                                     ; $70D3: $65
    ld   h, [hl]                                  ; $70D4: $66
    ld   h, a                                     ; $70D5: $67
    ld   l, b                                     ; $70D6: $68
    ld   l, c                                     ; $70D7: $69
    ld   l, l                                     ; $70D8: $6D
    ld   b, l                                     ; $70D9: $45
    ld   b, [hl]                                  ; $70DA: $46
    ld   b, [hl]                                  ; $70DB: $46
    nop                                           ; $70DC: $00
    ld   c, [hl]                                  ; $70DD: $4E
    ld   c, [hl]                                  ; $70DE: $4E
    ld   c, [hl]                                  ; $70DF: $4E
    ld   c, [hl]                                  ; $70E0: $4E
    ld   b, h                                     ; $70E1: $44
    ld   d, b                                     ; $70E2: $50
    jr   nz, jr_020_7159                          ; $70E3: $20 $74

    ld   l, e                                     ; $70E5: $6B
    ld   l, h                                     ; $70E6: $6C
    ld   l, l                                     ; $70E7: $6D
    ld   l, l                                     ; $70E8: $6D
    scf                                           ; $70E9: $37
    scf                                           ; $70EA: $37
    ld   c, a                                     ; $70EB: $4F
    inc  e                                        ; $70EC: $1C
    ld   c, a                                     ; $70ED: $4F
    ld   c, [hl]                                  ; $70EE: $4E
    ld   c, [hl]                                  ; $70EF: $4E
    ld   c, [hl]                                  ; $70F0: $4E
    ld   d, b                                     ; $70F1: $50
    ld   c, [hl]                                  ; $70F2: $4E
    ld   [bc], a                                  ; $70F3: $02
    ld   a, l                                     ; $70F4: $7D
    nop                                           ; $70F5: $00
    ld   c, $48                                   ; $70F6: $0E $48
    ld   b, a                                     ; $70F8: $47
    scf                                           ; $70F9: $37
    ld   b, $06                                   ; $70FA: $06 $06
    nop                                           ; $70FC: $00
    ld   d, c                                     ; $70FD: $51
    ld   d, b                                     ; $70FE: $50
    ld   d, b                                     ; $70FF: $50
    ld   h, d                                     ; $7100: $62
    ld   h, d                                     ; $7101: $62
    ld   h, d                                     ; $7102: $62
    ld   [bc], a                                  ; $7103: $02
    ld   a, l                                     ; $7104: $7D
    nop                                           ; $7105: $00
    ld   c, $48                                   ; $7106: $0E $48
    ld   b, a                                     ; $7108: $47
    scf                                           ; $7109: $37
    ld   b, $06                                   ; $710A: $06 $06
    nop                                           ; $710C: $00
    ld   d, c                                     ; $710D: $51
    ld   d, c                                     ; $710E: $51
    nop                                           ; $710F: $00
    ld   h, d                                     ; $7110: $62
    ld   h, d                                     ; $7111: $62
    ld   h, d                                     ; $7112: $62
    nop                                           ; $7113: $00
    ld   b, c                                     ; $7114: $41
    ld   a, [hl]                                  ; $7115: $7E
    ld   a, [hl]                                  ; $7116: $7E
    ld   a, d                                     ; $7117: $7A
    ld   b, $28                                   ; $7118: $06 $28
    jr   z, @+$13                                 ; $711A: $28 $11

    ld   de, $6364                                ; $711C: $11 $64 $63
    dec  l                                        ; $711F: $2D
    dec  l                                        ; $7120: $2D
    dec  l                                        ; $7121: $2D
    dec  l                                        ; $7122: $2D
    ld   bc, $742E                                ; $7123: $01 $2E $74
    ld   a, a                                     ; $7126: $7F
    jr   c, jr_020_7151                           ; $7127: $38 $28

    jr   z, jr_020_7154                           ; $7129: $28 $29

    ld   de, $1111                                ; $712B: $11 $11 $11
    ld   h, h                                     ; $712E: $64
    dec  l                                        ; $712F: $2D
    dec  l                                        ; $7130: $2D
    dec  l                                        ; $7131: $2D
    dec  l                                        ; $7132: $2D
    nop                                           ; $7133: $00
    nop                                           ; $7134: $00
    ld   a, [hl]                                  ; $7135: $7E
    nop                                           ; $7136: $00
    nop                                           ; $7137: $00
    jr   z, jr_020_7163                           ; $7138: $28 $29

    dec  b                                        ; $713A: $05
    ld   e, b                                     ; $713B: $58
    ld   e, c                                     ; $713C: $59
    ld   e, d                                     ; $713D: $5A
    nop                                           ; $713E: $00
    dec  l                                        ; $713F: $2D
    dec  l                                        ; $7140: $2D
    dec  l                                        ; $7141: $2D
    dec  l                                        ; $7142: $2D
    ld   a, [hl]                                  ; $7143: $7E
    ld   a, [hl]                                  ; $7144: $7E
    ld   a, [hl]                                  ; $7145: $7E
    ld   a, [hl]                                  ; $7146: $7E
    ld   a, [hl-]                                 ; $7147: $3A
    ld   a, [hl-]                                 ; $7148: $3A
    jr   z, jr_020_7174                           ; $7149: $28 $29

    ld   e, e                                     ; $714B: $5B
    ld   e, h                                     ; $714C: $5C
    nop                                           ; $714D: $00
    ld   [de], a                                  ; $714E: $12
    dec  l                                        ; $714F: $2D
    dec  l                                        ; $7150: $2D

jr_020_7151:
    dec  l                                        ; $7151: $2D
    dec  l                                        ; $7152: $2D
    dec  a                                        ; $7153: $3D

jr_020_7154:
    inc  bc                                       ; $7154: $03
    ld   a, [bc]                                  ; $7155: $0A
    dec  bc                                       ; $7156: $0B
    add  hl, sp                                   ; $7157: $39
    ld   h, c                                     ; $7158: $61

jr_020_7159:
    jr   jr_020_7173                              ; $7159: $18 $18

    ld   c, d                                     ; $715B: $4A
    inc  l                                        ; $715C: $2C
    ld   [hl], d                                  ; $715D: $72
    nop                                           ; $715E: $00
    ld   a, [hl+]                                 ; $715F: $2A
    ld   l, a                                     ; $7160: $6F
    dec  l                                        ; $7161: $2D
    dec  l                                        ; $7162: $2D

jr_020_7163:
    nop                                           ; $7163: $00
    nop                                           ; $7164: $00
    ld   b, e                                     ; $7165: $43
    ld   a, [bc]                                  ; $7166: $0A
    ld   b, b                                     ; $7167: $40
    ld   a, $00                                   ; $7168: $3E $00
    nop                                           ; $716A: $00
    ld   [hl], l                                  ; $716B: $75
    ld   e, a                                     ; $716C: $5F
    ld   [hl], e                                  ; $716D: $73
    ld   [hl], b                                  ; $716E: $70
    ld   a, [hl+]                                 ; $716F: $2A
    ld   l, a                                     ; $7170: $6F
    dec  l                                        ; $7171: $2D
    dec  l                                        ; $7172: $2D

jr_020_7173:
    inc  de                                       ; $7173: $13

jr_020_7174:
    inc  c                                        ; $7174: $0C
    ld   a, [bc]                                  ; $7175: $0A
    nop                                           ; $7176: $00
    dec  sp                                       ; $7177: $3B
    nop                                           ; $7178: $00
    dec  sp                                       ; $7179: $3B
    dec  sp                                       ; $717A: $3B
    ld   e, a                                     ; $717B: $5F
    ld   d, h                                     ; $717C: $54
    scf                                           ; $717D: $37
    ld   [hl], c                                  ; $717E: $71
    ld   l, [hl]                                  ; $717F: $6E
    ld   l, [hl]                                  ; $7180: $6E
    ld   l, [hl]                                  ; $7181: $6E
    nop                                           ; $7182: $00
    rrca                                          ; $7183: $0F
    inc  c                                        ; $7184: $0C
    add  hl, bc                                   ; $7185: $09
    add  hl, bc                                   ; $7186: $09
    nop                                           ; $7187: $00
    dec  sp                                       ; $7188: $3B
    dec  sp                                       ; $7189: $3B
    dec  sp                                       ; $718A: $3B
    ld   [hl], a                                  ; $718B: $77
    ld   [hl], d                                  ; $718C: $72
    ld   [hl], b                                  ; $718D: $70
    ld   c, e                                     ; $718E: $4B
    ld   l, [hl]                                  ; $718F: $6E
    ld   l, [hl]                                  ; $7190: $6E
    ld   l, [hl]                                  ; $7191: $6E
    ld   l, [hl]                                  ; $7192: $6E
    ld   [$0708], sp                              ; $7193: $08 $08 $07
    rlca                                          ; $7196: $07
    inc  a                                        ; $7197: $3C
    inc  a                                        ; $7198: $3C
    inc  a                                        ; $7199: $3C
    nop                                           ; $719A: $00
    ld   a, b                                     ; $719B: $78
    inc  hl                                       ; $719C: $23
    ld   h, $57                                   ; $719D: $26 $57
    inc  [hl]                                     ; $719F: $34
    dec  [hl]                                     ; $71A0: $35
    dec  e                                        ; $71A1: $1D
    ld   a, e                                     ; $71A2: $7B
    rlca                                          ; $71A3: $07
    rlca                                          ; $71A4: $07
    rlca                                          ; $71A5: $07
    rlca                                          ; $71A6: $07
    inc  a                                        ; $71A7: $3C
    inc  a                                        ; $71A8: $3C
    inc  a                                        ; $71A9: $3C
    ld   a, d                                     ; $71AA: $7A
    ld   a, c                                     ; $71AB: $79
    ld   h, $1F                                   ; $71AC: $26 $1F
    ld   d, e                                     ; $71AE: $53
    cpl                                           ; $71AF: $2F
    inc  [hl]                                     ; $71B0: $34
    nop                                           ; $71B1: $00
    ld   c, l                                     ; $71B2: $4D
    rlca                                          ; $71B3: $07
    rlca                                          ; $71B4: $07
    nop                                           ; $71B5: $00
    ld   b, d                                     ; $71B6: $42
    nop                                           ; $71B7: $00
    sub  b                                        ; $71B8: $90
    sub  c                                        ; $71B9: $91
    ld   h, $26                                   ; $71BA: $26 $26
    dec  h                                        ; $71BC: $25
    ld   [hl], $33                                ; $71BD: $36 $33
    ld   sp, $7C30                                ; $71BF: $31 $30 $7C
    ld   c, l                                     ; $71C2: $4D
    rlca                                          ; $71C3: $07
    rlca                                          ; $71C4: $07
    rlca                                          ; $71C5: $07
    nop                                           ; $71C6: $00
    sub  b                                        ; $71C7: $90
    sub  b                                        ; $71C8: $90
    sub  c                                        ; $71C9: $91
    nop                                           ; $71CA: $00
    rra                                           ; $71CB: $1F
    ld   h, $1F                                   ; $71CC: $26 $1F
    nop                                           ; $71CE: $00
    jr   nc, jr_020_71F2                          ; $71CF: $30 $21

    ld   c, h                                     ; $71D1: $4C
    ld   a, h                                     ; $71D2: $7C
    ld   bc, label_E03                            ; $71D3: $01 $03 $0E
    rlca                                          ; $71D6: $07
    rlca                                          ; $71D7: $07
    nop                                           ; $71D8: $00
    dec  b                                        ; $71D9: $05
    ld   bc, $0300                                ; $71DA: $01 $00 $03
    inc  e                                        ; $71DD: $1C
    dec  b                                        ; $71DE: $05
    ld   bc, $0101                                ; $71DF: $01 $01 $01
    nop                                           ; $71E2: $00
    nop                                           ; $71E3: $00
    ld   [bc], a                                  ; $71E4: $02
    nop                                           ; $71E5: $00
    inc  bc                                       ; $71E6: $03
    inc  bc                                       ; $71E7: $03
    inc  bc                                       ; $71E8: $03
    inc  bc                                       ; $71E9: $03
    inc  bc                                       ; $71EA: $03
    inc  sp                                       ; $71EB: $33
    inc  sp                                       ; $71EC: $33
    inc  sp                                       ; $71ED: $33
    inc  sp                                       ; $71EE: $33
    nop                                           ; $71EF: $00
    nop                                           ; $71F0: $00
    ld   h, e                                     ; $71F1: $63

jr_020_71F2:
    ld   h, e                                     ; $71F2: $63
    inc  d                                        ; $71F3: $14
    nop                                           ; $71F4: $00
    inc  d                                        ; $71F5: $14
    inc  d                                        ; $71F6: $14
    nop                                           ; $71F7: $00
    ld   b, $13                                   ; $71F8: $06 $13
    ld   b, $13                                   ; $71FA: $06 $13
    inc  de                                       ; $71FC: $13
    ld   c, $08                                   ; $71FD: $0E $08
    inc  de                                       ; $71FF: $13
    ld   [$0706], sp                              ; $7200: $08 $06 $07
    ld   b, $06                                   ; $7203: $06 $06
    nop                                           ; $7205: $00
    nop                                           ; $7206: $00
    dec  de                                       ; $7207: $1B
    dec  de                                       ; $7208: $1B
    ld   b, $1B                                   ; $7209: $06 $1B
    ld   b, $00                                   ; $720B: $06 $00
    inc  sp                                       ; $720D: $33
    inc  sp                                       ; $720E: $33
    inc  sp                                       ; $720F: $33
    inc  sp                                       ; $7210: $33
    inc  sp                                       ; $7211: $33
    inc  sp                                       ; $7212: $33
    jr   @+$1A                                    ; $7213: $18 $18

    jr   jr_020_722F                              ; $7215: $18 $18

    nop                                           ; $7217: $00
    dec  d                                        ; $7218: $15
    nop                                           ; $7219: $00
    nop                                           ; $721A: $00
    rla                                           ; $721B: $17
    nop                                           ; $721C: $00
    rla                                           ; $721D: $17
    rla                                           ; $721E: $17
    ld   b, $17                                   ; $721F: $06 $17
    ld   b, $00                                   ; $7221: $06 $00
    jr   jr_020_7261                              ; $7223: $18 $3C

    inc  a                                        ; $7225: $3C
    inc  a                                        ; $7226: $3C
    rla                                           ; $7227: $17
    rla                                           ; $7228: $17
    rla                                           ; $7229: $17
    rla                                           ; $722A: $17
    rla                                           ; $722B: $17
    ld   c, $16                                   ; $722C: $0E $16
    nop                                           ; $722E: $00

jr_020_722F:
    rla                                           ; $722F: $17
    ld   bc, $3333                                ; $7230: $01 $33 $33
    nop                                           ; $7233: $00
    nop                                           ; $7234: $00
    ld   c, $31                                   ; $7235: $0E $31
    add  hl, de                                   ; $7237: $19
    jr   nc, jr_020_726C                          ; $7238: $30 $32

    ld   [hl-], a                                 ; $723A: $32
    nop                                           ; $723B: $00
    nop                                           ; $723C: $00
    ld   [hl-], a                                 ; $723D: $32
    ld   [hl-], a                                 ; $723E: $32
    nop                                           ; $723F: $00
    ld   [hl-], a                                 ; $7240: $32
    jr   nc, jr_020_7273                          ; $7241: $30 $30

    nop                                           ; $7243: $00
    jr   nc, jr_020_7278                          ; $7244: $30 $32

    nop                                           ; $7246: $00
    jr   nc, jr_020_7279                          ; $7247: $30 $30

    nop                                           ; $7249: $00
    jr   nc, jr_020_727C                          ; $724A: $30 $30

    jr   nc, jr_020_727E                          ; $724C: $30 $30

    jr   nc, jr_020_7283                          ; $724E: $30 $33

    inc  sp                                       ; $7250: $33
    nop                                           ; $7251: $00
    ld   bc, $1E1E                                ; $7252: $01 $1E $1E
    rrca                                          ; $7255: $0F
    ld   e, $1E                                   ; $7256: $1E $1E
    dec  e                                        ; $7258: $1D
    nop                                           ; $7259: $00
    nop                                           ; $725A: $00
    inc  h                                        ; $725B: $24
    inc  h                                        ; $725C: $24
    inc  h                                        ; $725D: $24
    nop                                           ; $725E: $00
    inc  h                                        ; $725F: $24
    inc  h                                        ; $7260: $24

jr_020_7261:
    inc  h                                        ; $7261: $24
    inc  h                                        ; $7262: $24
    inc  h                                        ; $7263: $24
    nop                                           ; $7264: $00
    ld   e, $1F                                   ; $7265: $1E $1F
    rra                                           ; $7267: $1F
    ld   e, $1E                                   ; $7268: $1E $1E
    inc  b                                        ; $726A: $04
    inc  b                                        ; $726B: $04

jr_020_726C:
    nop                                           ; $726C: $00
    nop                                           ; $726D: $00
    inc  b                                        ; $726E: $04
    inc  b                                        ; $726F: $04
    inc  b                                        ; $7270: $04
    inc  b                                        ; $7271: $04
    inc  b                                        ; $7272: $04

jr_020_7273:
    inc  b                                        ; $7273: $04
    inc  b                                        ; $7274: $04
    inc  sp                                       ; $7275: $33
    inc  sp                                       ; $7276: $33
    inc  sp                                       ; $7277: $33

jr_020_7278:
    inc  sp                                       ; $7278: $33

jr_020_7279:
    inc  sp                                       ; $7279: $33
    inc  sp                                       ; $727A: $33
    inc  sp                                       ; $727B: $33

jr_020_727C:
    inc  sp                                       ; $727C: $33
    ld   h, h                                     ; $727D: $64

jr_020_727E:
    ld   h, h                                     ; $727E: $64
    add  b                                        ; $727F: $80
    nop                                           ; $7280: $00
    nop                                           ; $7281: $00
    nop                                           ; $7282: $00

jr_020_7283:
    jr   z, jr_020_72AD                           ; $7283: $28 $28

    jr   z, jr_020_72AF                           ; $7285: $28 $28

    ld   h, c                                     ; $7287: $61
    rrca                                          ; $7288: $0F
    ld   h, c                                     ; $7289: $61
    nop                                           ; $728A: $00
    nop                                           ; $728B: $00
    jr   z, jr_020_72B6                           ; $728C: $28 $28

    nop                                           ; $728E: $00
    dec  h                                        ; $728F: $25
    ld   h, $61                                   ; $7290: $26 $61
    add  hl, hl                                   ; $7292: $29
    daa                                           ; $7293: $27
    nop                                           ; $7294: $00
    jr   z, jr_020_72F8                           ; $7295: $28 $61

    nop                                           ; $7297: $00
    ld   h, $00                                   ; $7298: $26 $00
    add  hl, hl                                   ; $729A: $29
    ld   a, [hl+]                                 ; $729B: $2A
    nop                                           ; $729C: $00
    nop                                           ; $729D: $00
    ld   h, d                                     ; $729E: $62
    nop                                           ; $729F: $00
    ld   h, c                                     ; $72A0: $61
    nop                                           ; $72A1: $00
    daa                                           ; $72A2: $27
    ld   h, c                                     ; $72A3: $61
    ld   h, c                                     ; $72A4: $61
    daa                                           ; $72A5: $27
    daa                                           ; $72A6: $27
    daa                                           ; $72A7: $27
    daa                                           ; $72A8: $27
    nop                                           ; $72A9: $00
    ld   h, c                                     ; $72AA: $61
    ld   h, e                                     ; $72AB: $63
    ld   h, e                                     ; $72AC: $63

jr_020_72AD:
    inc  sp                                       ; $72AD: $33
    inc  sp                                       ; $72AE: $33

jr_020_72AF:
    inc  sp                                       ; $72AF: $33
    inc  sp                                       ; $72B0: $33
    nop                                           ; $72B1: $00
    nop                                           ; $72B2: $00
    ld   b, h                                     ; $72B3: $44
    ld   b, h                                     ; $72B4: $44
    ld   b, h                                     ; $72B5: $44

jr_020_72B6:
    nop                                           ; $72B6: $00
    ld   c, d                                     ; $72B7: $4A
    ld   h, a                                     ; $72B8: $67
    ld   h, a                                     ; $72B9: $67
    nop                                           ; $72BA: $00
    ld   a, a                                     ; $72BB: $7F
    nop                                           ; $72BC: $00
    nop                                           ; $72BD: $00
    inc  sp                                       ; $72BE: $33
    inc  sp                                       ; $72BF: $33
    nop                                           ; $72C0: $00
    ld   l, [hl]                                  ; $72C1: $6E
    ld   a, [de]                                  ; $72C2: $1A
    ld   h, a                                     ; $72C3: $67
    ld   h, a                                     ; $72C4: $67
    nop                                           ; $72C5: $00
    add  b                                        ; $72C6: $80
    ld   c, d                                     ; $72C7: $4A
    ld   a, [hl]                                  ; $72C8: $7E
    ld   h, a                                     ; $72C9: $67
    nop                                           ; $72CA: $00
    ld   a, a                                     ; $72CB: $7F
    ld   a, a                                     ; $72CC: $7F
    dec  a                                        ; $72CD: $3D
    add  b                                        ; $72CE: $80
    stop                                          ; $72CF: $10 $00
    ld   l, [hl]                                  ; $72D1: $6E
    ld   a, [de]                                  ; $72D2: $1A
    nop                                           ; $72D3: $00
    nop                                           ; $72D4: $00
    ccf                                           ; $72D5: $3F
    inc  l                                        ; $72D6: $2C
    inc  l                                        ; $72D7: $2C
    ld   e, [hl]                                  ; $72D8: $5E
    inc  [hl]                                     ; $72D9: $34
    add  hl, sp                                   ; $72DA: $39
    nop                                           ; $72DB: $00
    ld   e, a                                     ; $72DC: $5F
    ld   h, b                                     ; $72DD: $60
    ld   a, $39                                   ; $72DE: $3E $39
    dec  hl                                       ; $72E0: $2B
    dec  hl                                       ; $72E1: $2B
    nop                                           ; $72E2: $00
    add  hl, sp                                   ; $72E3: $39
    dec  l                                        ; $72E4: $2D
    dec  l                                        ; $72E5: $2D
    dec  l                                        ; $72E6: $2D
    dec  l                                        ; $72E7: $2D
    dec  l                                        ; $72E8: $2D
    dec  l                                        ; $72E9: $2D
    ld   l, $2D                                   ; $72EA: $2E $2D
    dec  l                                        ; $72EC: $2D
    dec  l                                        ; $72ED: $2D
    ld   l, $00                                   ; $72EE: $2E $00
    dec  l                                        ; $72F0: $2D
    dec  l                                        ; $72F1: $2D
    nop                                           ; $72F2: $00
    ld   [hl], $00                                ; $72F3: $36 $00
    dec  [hl]                                     ; $72F5: $35
    rrca                                          ; $72F6: $0F
    scf                                           ; $72F7: $37

jr_020_72F8:
    dec  [hl]                                     ; $72F8: $35
    dec  [hl]                                     ; $72F9: $35
    nop                                           ; $72FA: $00
    scf                                           ; $72FB: $37
    nop                                           ; $72FC: $00
    jr   c, jr_020_7334                           ; $72FD: $38 $35

    rrca                                          ; $72FF: $0F
    dec  [hl]                                     ; $7300: $35
    jr   c, jr_020_7304                           ; $7301: $38 $01

    rrca                                          ; $7303: $0F

jr_020_7304:
    ld   e, h                                     ; $7304: $5C
    ld   d, [hl]                                  ; $7305: $56
    nop                                           ; $7306: $00
    ld   d, b                                     ; $7307: $50
    ld   e, h                                     ; $7308: $5C
    nop                                           ; $7309: $00
    ld   d, c                                     ; $730A: $51
    ld   d, [hl]                                  ; $730B: $56
    ld   e, b                                     ; $730C: $58
    ld   e, e                                     ; $730D: $5B
    ld   e, e                                     ; $730E: $5B
    nop                                           ; $730F: $00
    ld   d, h                                     ; $7310: $54
    nop                                           ; $7311: $00
    ld   d, c                                     ; $7312: $51
    ld   e, d                                     ; $7313: $5A
    nop                                           ; $7314: $00
    ld   e, c                                     ; $7315: $59
    ld   e, c                                     ; $7316: $59
    nop                                           ; $7317: $00
    ld   d, a                                     ; $7318: $57
    ld   e, d                                     ; $7319: $5A
    ld   e, c                                     ; $731A: $59
    ld   e, c                                     ; $731B: $59
    nop                                           ; $731C: $00
    ld   e, h                                     ; $731D: $5C
    ld   e, h                                     ; $731E: $5C
    ld   d, d                                     ; $731F: $52
    nop                                           ; $7320: $00
    ld   d, l                                     ; $7321: $55
    nop                                           ; $7322: $00
    ld   e, h                                     ; $7323: $5C
    ld   e, h                                     ; $7324: $5C
    nop                                           ; $7325: $00
    ld   d, e                                     ; $7326: $53
    ld   d, d                                     ; $7327: $52
    ld   d, d                                     ; $7328: $52
    nop                                           ; $7329: $00
    ld   e, e                                     ; $732A: $5B
    nop                                           ; $732B: $00
    ld   e, h                                     ; $732C: $5C
    nop                                           ; $732D: $00
    ld   d, e                                     ; $732E: $53
    ld   d, d                                     ; $732F: $52
    ld   e, e                                     ; $7330: $5B
    ld   e, d                                     ; $7331: $5A
    ld   d, e                                     ; $7332: $53
    inc  sp                                       ; $7333: $33

jr_020_7334:
    inc  sp                                       ; $7334: $33
    inc  sp                                       ; $7335: $33
    inc  sp                                       ; $7336: $33
    inc  sp                                       ; $7337: $33
    inc  sp                                       ; $7338: $33
    inc  sp                                       ; $7339: $33
    inc  sp                                       ; $733A: $33
    inc  sp                                       ; $733B: $33
    inc  sp                                       ; $733C: $33
    inc  sp                                       ; $733D: $33
    inc  sp                                       ; $733E: $33
    ld   bc, $0101                                ; $733F: $01 $01 $01
    dec  a                                        ; $7342: $3D
    ld   bc, $0101                                ; $7343: $01 $01 $01
    ld   bc, Init                                 ; $7346: $01 $6F $01
    ld   bc, $0101                                ; $7349: $01 $01 $01
    ld   bc, $0101                                ; $734C: $01 $01 $01
    ld   bc, $0101                                ; $734F: $01 $01 $01
    dec  a                                        ; $7352: $3D
    ld   h, [hl]                                  ; $7353: $66
    ld   h, [hl]                                  ; $7354: $66
    ld   h, [hl]                                  ; $7355: $66
    ld   bc, $6601                                ; $7356: $01 $01 $66
    ld   h, [hl]                                  ; $7359: $66
    ld   h, [hl]                                  ; $735A: $66
    ld   h, l                                     ; $735B: $65
    ld   h, l                                     ; $735C: $65
    ld   h, l                                     ; $735D: $65
    ld   h, l                                     ; $735E: $65
    ld   h, [hl]                                  ; $735F: $66
    ld   h, [hl]                                  ; $7360: $66
    ld   h, l                                     ; $7361: $65
    dec  a                                        ; $7362: $3D
    ld   h, l                                     ; $7363: $65
    ld   h, l                                     ; $7364: $65
    ld   h, l                                     ; $7365: $65
    ld   h, l                                     ; $7366: $65
    ld   h, [hl]                                  ; $7367: $66
    ld   h, [hl]                                  ; $7368: $66
    ld   h, [hl]                                  ; $7369: $66
    dec  c                                        ; $736A: $0D
    dec  c                                        ; $736B: $0D
    add  hl, bc                                   ; $736C: $09
    ld   h, l                                     ; $736D: $65
    add  hl, bc                                   ; $736E: $09
    add  hl, bc                                   ; $736F: $09
    add  hl, bc                                   ; $7370: $09
    nop                                           ; $7371: $00
    ld   c, c                                     ; $7372: $49
    db   $10                                      ; $7373: $10
    ld   de, $2F20                                ; $7374: $11 $20 $2F
    ld   bc, $0A0A                                ; $7377: $01 $0A $0A
    dec  bc                                       ; $737A: $0B
    inc  c                                        ; $737B: $0C
    add  hl, bc                                   ; $737C: $09
    ld   c, e                                     ; $737D: $4B
    ld   h, l                                     ; $737E: $65
    ld   h, l                                     ; $737F: $65
    ld   c, h                                     ; $7380: $4C
    ld   h, l                                     ; $7381: $65
    ld   h, l                                     ; $7382: $65
    db   $10                                      ; $7383: $10
    ld   [de], a                                  ; $7384: $12
    dec  bc                                       ; $7385: $0B
    ld   h, l                                     ; $7386: $65
    add  hl, bc                                   ; $7387: $09
    ld   bc, $6565                                ; $7388: $01 $65 $65
    ld   h, l                                     ; $738B: $65
    ld   h, l                                     ; $738C: $65
    ld   h, l                                     ; $738D: $65
    ld   h, l                                     ; $738E: $65
    ld   h, l                                     ; $738F: $65
    ld   h, l                                     ; $7390: $65
    dec  c                                        ; $7391: $0D
    dec  c                                        ; $7392: $0D
    nop                                           ; $7393: $00
    nop                                           ; $7394: $00
    ld   hl, $2121                                ; $7395: $21 $21 $21
    ld   hl, $2221                                ; $7398: $21 $21 $22
    ld   h, [hl]                                  ; $739B: $66
    ld   h, l                                     ; $739C: $65
    ld   h, l                                     ; $739D: $65
    add  hl, bc                                   ; $739E: $09
    add  hl, bc                                   ; $739F: $09
    ld   h, [hl]                                  ; $73A0: $66
    dec  c                                        ; $73A1: $0D
    dec  c                                        ; $73A2: $0D
    ld   h, a                                     ; $73A3: $67
    ld   h, a                                     ; $73A4: $67
    ld   hl, $2121                                ; $73A5: $21 $21 $21
    ld   hl, $4021                                ; $73A8: $21 $21 $40
    ld   h, [hl]                                  ; $73AB: $66
    ld   b, c                                     ; $73AC: $41
    ld   a, l                                     ; $73AD: $7D
    ld   c, l                                     ; $73AE: $4D
    ld   c, l                                     ; $73AF: $4D
    ld   b, [hl]                                  ; $73B0: $46
    ld   h, [hl]                                  ; $73B1: $66
    ld   h, [hl]                                  ; $73B2: $66
    ld   a, [hl-]                                 ; $73B3: $3A
    ld   c, [hl]                                  ; $73B4: $4E
    ld   a, [hl-]                                 ; $73B5: $3A
    add  hl, bc                                   ; $73B6: $09
    ld   h, [hl]                                  ; $73B7: $66
    ld   h, [hl]                                  ; $73B8: $66
    ld   h, l                                     ; $73B9: $65
    ld   h, l                                     ; $73BA: $65
    dec  sp                                       ; $73BB: $3B
    ld   b, a                                     ; $73BC: $47
    ld   h, l                                     ; $73BD: $65
    ld   h, l                                     ; $73BE: $65
    ld   h, l                                     ; $73BF: $65
    ld   h, l                                     ; $73C0: $65
    ld   h, l                                     ; $73C1: $65
    ld   h, l                                     ; $73C2: $65
    ld   a, [hl-]                                 ; $73C3: $3A
    ld   h, a                                     ; $73C4: $67
    ld   h, a                                     ; $73C5: $67
    ld   h, a                                     ; $73C6: $67
    ld   h, [hl]                                  ; $73C7: $66
    ld   a, h                                     ; $73C8: $7C
    ld   h, l                                     ; $73C9: $65
    ld   h, l                                     ; $73CA: $65
    dec  sp                                       ; $73CB: $3B
    ld   h, a                                     ; $73CC: $67
    ld   h, a                                     ; $73CD: $67
    ld   b, e                                     ; $73CE: $43
    ld   bc, $4845                                ; $73CF: $01 $45 $48
    nop                                           ; $73D2: $00
    inc  b                                        ; $73D3: $04
    inc  b                                        ; $73D4: $04
    inc  b                                        ; $73D5: $04
    inc  b                                        ; $73D6: $04
    inc  b                                        ; $73D7: $04
    inc  b                                        ; $73D8: $04
    inc  b                                        ; $73D9: $04
    inc  b                                        ; $73DA: $04
    inc  b                                        ; $73DB: $04
    inc  b                                        ; $73DC: $04
    inc  b                                        ; $73DD: $04
    inc  b                                        ; $73DE: $04
    inc  b                                        ; $73DF: $04
    inc  b                                        ; $73E0: $04
    inc  b                                        ; $73E1: $04
    inc  b                                        ; $73E2: $04
    inc  b                                        ; $73E3: $04
    inc  b                                        ; $73E4: $04
    inc  b                                        ; $73E5: $04
    inc  b                                        ; $73E6: $04
    inc  b                                        ; $73E7: $04
    inc  b                                        ; $73E8: $04
    inc  b                                        ; $73E9: $04
    inc  b                                        ; $73EA: $04
    inc  b                                        ; $73EB: $04
    inc  b                                        ; $73EC: $04
    inc  b                                        ; $73ED: $04
    inc  b                                        ; $73EE: $04
    inc  b                                        ; $73EF: $04
    inc  b                                        ; $73F0: $04
    inc  b                                        ; $73F1: $04
    inc  b                                        ; $73F2: $04
    and  h                                        ; $73F3: $A4
    rst  $38                                      ; $73F4: $FF
    rst  $38                                      ; $73F5: $FF
    rst  $38                                      ; $73F6: $FF
    and  h                                        ; $73F7: $A4
    adc  [hl]                                     ; $73F8: $8E
    ld   a, h                                     ; $73F9: $7C
    ret  z                                        ; $73FA: $C8

    and  h                                        ; $73FB: $A4
    ld   c, d                                     ; $73FC: $4A
    ld   a, h                                     ; $73FD: $7C
    sub  e                                        ; $73FE: $93
    and  h                                        ; $73FF: $A4
    push hl                                       ; $7400: $E5
    rst  $38                                      ; $7401: $FF
    ld   c, [hl]                                  ; $7402: $4E
    and  h                                        ; $7403: $A4
    sub  c                                        ; $7404: $91
    add  e                                        ; $7405: $83
    and  d                                        ; $7406: $A2
    and  h                                        ; $7407: $A4
    ld   b, d                                     ; $7408: $42
    adc  d                                        ; $7409: $8A
    rst  $38                                      ; $740A: $FF
    and  h                                        ; $740B: $A4
    ld   b, d                                     ; $740C: $42
    add  e                                        ; $740D: $83
    and  d                                        ; $740E: $A2
    and  h                                        ; $740F: $A4
    add  c                                        ; $7410: $81
    db   $e3                                      ; $7411: $E3
    and  d                                        ; $7412: $A2
    and  h                                        ; $7413: $A4
    push hl                                       ; $7414: $E5
    db   $e3                                      ; $7415: $E3
    rst  $38                                      ; $7416: $FF
    and  h                                        ; $7417: $A4
    push hl                                       ; $7418: $E5
    ld   b, e                                     ; $7419: $43
    rst  $20                                      ; $741A: $E7
    and  h                                        ; $741B: $A4
    push hl                                       ; $741C: $E5
    and  $FF                                      ; $741D: $E6 $FF
    and  h                                        ; $741F: $A4
    push hl                                       ; $7420: $E5
    and  $E7                                      ; $7421: $E6 $E7
    and  h                                        ; $7423: $A4
    push hl                                       ; $7424: $E5
    ld   b, e                                     ; $7425: $43
    and  h                                        ; $7426: $A4
    and  h                                        ; $7427: $A4
    adc  [hl]                                     ; $7428: $8E
    add  e                                        ; $7429: $83
    and  h                                        ; $742A: $A4
    and  h                                        ; $742B: $A4
    ld   c, d                                     ; $742C: $4A
    add  e                                        ; $742D: $83
    ld   b, b                                     ; $742E: $40
    and  h                                        ; $742F: $A4
    push hl                                       ; $7430: $E5
    ld   c, h                                     ; $7431: $4C
    rst  $20                                      ; $7432: $E7
    and  h                                        ; $7433: $A4
    ld   c, l                                     ; $7434: $4D
    add  e                                        ; $7435: $83
    rst  $38                                      ; $7436: $FF
    and  h                                        ; $7437: $A4
    ld   b, d                                     ; $7438: $42
    sub  d                                        ; $7439: $92
    ld   e, d                                     ; $743A: $5A
    and  h                                        ; $743B: $A4
    ld   h, c                                     ; $743C: $61
    sub  d                                        ; $743D: $92
    ld   h, a                                     ; $743E: $67
    and  h                                        ; $743F: $A4
    push hl                                       ; $7440: $E5
    rst  $38                                      ; $7441: $FF
    rst  $38                                      ; $7442: $FF
    and  h                                        ; $7443: $A4
    db   $e3                                      ; $7444: $E3
    adc  e                                        ; $7445: $8B
    rst  $38                                      ; $7446: $FF
    and  h                                        ; $7447: $A4
    db   $e3                                      ; $7448: $E3
    add  e                                        ; $7449: $83
    db   $76                                      ; $744A: $76
    and  h                                        ; $744B: $A4
    add  c                                        ; $744C: $81
    ld   a, c                                     ; $744D: $79
    db   $76                                      ; $744E: $76
    and  h                                        ; $744F: $A4
    ld   h, c                                     ; $7450: $61
    adc  e                                        ; $7451: $8B
    rst  $38                                      ; $7452: $FF
    and  h                                        ; $7453: $A4
    ld   l, h                                     ; $7454: $6C
    adc  e                                        ; $7455: $8B
    ld   l, e                                     ; $7456: $6B
    and  h                                        ; $7457: $A4
    rst  $38                                      ; $7458: $FF
    adc  e                                        ; $7459: $8B
    rst  $38                                      ; $745A: $FF
    and  h                                        ; $745B: $A4
    db   $e3                                      ; $745C: $E3
    adc  e                                        ; $745D: $8B
    and  d                                        ; $745E: $A2
    and  h                                        ; $745F: $A4
    push hl                                       ; $7460: $E5
    rst  $38                                      ; $7461: $FF
    rst  $38                                      ; $7462: $FF
    and  h                                        ; $7463: $A4
    ld   c, d                                     ; $7464: $4A
    adc  a                                        ; $7465: $8F
    ld   l, l                                     ; $7466: $6D
    and  h                                        ; $7467: $A4
    add  c                                        ; $7468: $81
    ld   l, [hl]                                  ; $7469: $6E
    ld   d, d                                     ; $746A: $52
    and  h                                        ; $746B: $A4
    ld   c, l                                     ; $746C: $4D
    ld   b, e                                     ; $746D: $43
    and  d                                        ; $746E: $A2
    and  h                                        ; $746F: $A4
    ld   h, c                                     ; $7470: $61
    ld   a, c                                     ; $7471: $79
    db   $76                                      ; $7472: $76
    and  h                                        ; $7473: $A4
    add  $7C                                      ; $7474: $C6 $7C
    ld   b, c                                     ; $7476: $41
    and  h                                        ; $7477: $A4
    push bc                                       ; $7478: $C5
    ld   l, [hl]                                  ; $7479: $6E
    ld   l, a                                     ; $747A: $6F
    and  h                                        ; $747B: $A4
    push bc                                       ; $747C: $C5
    rst  $38                                      ; $747D: $FF
    ld   [hl], b                                  ; $747E: $70
    and  h                                        ; $747F: $A4
    ld   h, c                                     ; $7480: $61
    rst  $38                                      ; $7481: $FF
    ld   [hl], c                                  ; $7482: $71
    and  h                                        ; $7483: $A4
    ld   h, c                                     ; $7484: $61
    rst  $38                                      ; $7485: $FF
    ld   [hl], d                                  ; $7486: $72
    and  h                                        ; $7487: $A4
    ld   h, c                                     ; $7488: $61
    ld   a, c                                     ; $7489: $79
    ld   [hl], e                                  ; $748A: $73
    and  h                                        ; $748B: $A4
    ld   h, c                                     ; $748C: $61
    ld   a, c                                     ; $748D: $79
    rst  $38                                      ; $748E: $FF
    and  h                                        ; $748F: $A4
    db   $e3                                      ; $7490: $E3
    ld   a, c                                     ; $7491: $79
    db   $76                                      ; $7492: $76
    and  h                                        ; $7493: $A4
    ld   b, d                                     ; $7494: $42
    add  d                                        ; $7495: $82
    and  d                                        ; $7496: $A2
    and  h                                        ; $7497: $A4
    ld   b, d                                     ; $7498: $42
    rst  $38                                      ; $7499: $FF
    add  d                                        ; $749A: $82
    and  h                                        ; $749B: $A4
    ld   h, c                                     ; $749C: $61
    ld   a, b                                     ; $749D: $78
    and  d                                        ; $749E: $A2
    and  h                                        ; $749F: $A4
    add  c                                        ; $74A0: $81
    adc  a                                        ; $74A1: $8F
    rst  $20                                      ; $74A2: $E7
    and  h                                        ; $74A3: $A4
    db   $e3                                      ; $74A4: $E3
    adc  e                                        ; $74A5: $8B
    adc  h                                        ; $74A6: $8C
    and  h                                        ; $74A7: $A4
    add  a                                        ; $74A8: $87
    ld   a, b                                     ; $74A9: $78
    and  d                                        ; $74AA: $A2
    and  h                                        ; $74AB: $A4
    ld   l, h                                     ; $74AC: $6C
    ld   a, h                                     ; $74AD: $7C
    ret  z                                        ; $74AE: $C8

    and  h                                        ; $74AF: $A4
    call nz, $CFE6                                ; $74B0: $C4 $E6 $CF
    and  h                                        ; $74B3: $A4
    rst  $38                                      ; $74B4: $FF
    ld   l, [hl]                                  ; $74B5: $6E
    ld   l, a                                     ; $74B6: $6F
    and  h                                        ; $74B7: $A4
    rst  $38                                      ; $74B8: $FF
    and  $CF                                      ; $74B9: $E6 $CF
    and  h                                        ; $74BB: $A4
    rst  $38                                      ; $74BC: $FF
    add  e                                        ; $74BD: $83
    rst  $38                                      ; $74BE: $FF
    and  h                                        ; $74BF: $A4
    call nz, Func_020_7679                        ; $74C0: $C4 $79 $76
    and  h                                        ; $74C3: $A4
    call nz, $FFFF                                ; $74C4: $C4 $FF $FF
    and  h                                        ; $74C7: $A4
    call nz, $CF43                                ; $74C8: $C4 $43 $CF
    and  h                                        ; $74CB: $A4
    rst  $38                                      ; $74CC: $FF
    ld   a, c                                     ; $74CD: $79
    rst  $38                                      ; $74CE: $FF
    and  h                                        ; $74CF: $A4
    rst  $38                                      ; $74D0: $FF
    rst  $38                                      ; $74D1: $FF
    and  d                                        ; $74D2: $A2
    and  h                                        ; $74D3: $A4
    ld   h, c                                     ; $74D4: $61
    ld   a, c                                     ; $74D5: $79
    and  d                                        ; $74D6: $A2
    and  h                                        ; $74D7: $A4
    push hl                                       ; $74D8: $E5
    rst  $38                                      ; $74D9: $FF
    rst  $38                                      ; $74DA: $FF
    and  h                                        ; $74DB: $A4
    push hl                                       ; $74DC: $E5
    add  d                                        ; $74DD: $82
    and  d                                        ; $74DE: $A2
    and  h                                        ; $74DF: $A4
    db   $e3                                      ; $74E0: $E3
    add  e                                        ; $74E1: $83
    and  d                                        ; $74E2: $A2
    and  h                                        ; $74E3: $A4
    sub  c                                        ; $74E4: $91
    add  e                                        ; $74E5: $83
    db   $76                                      ; $74E6: $76
    and  h                                        ; $74E7: $A4
    rst  $38                                      ; $74E8: $FF
    ld   a, h                                     ; $74E9: $7C
    and  d                                        ; $74EA: $A2
    and  h                                        ; $74EB: $A4
    db   $e3                                      ; $74EC: $E3
    adc  e                                        ; $74ED: $8B
    and  d                                        ; $74EE: $A2
    and  h                                        ; $74EF: $A4
    db   $e3                                      ; $74F0: $E3
    rst  $38                                      ; $74F1: $FF
    db   $76                                      ; $74F2: $76
    and  h                                        ; $74F3: $A4
    rst  $38                                      ; $74F4: $FF
    and  $A2                                      ; $74F5: $E6 $A2
    and  h                                        ; $74F7: $A4
    rst  $38                                      ; $74F8: $FF
    ld   a, h                                     ; $74F9: $7C
    and  d                                        ; $74FA: $A2
    and  h                                        ; $74FB: $A4
    add  c                                        ; $74FC: $81
    db   $e3                                      ; $74FD: $E3
    call nc, $E5A4                                ; $74FE: $D4 $A4 $E5
    and  $DC                                      ; $7501: $E6 $DC
    and  h                                        ; $7503: $A4
    add  a                                        ; $7504: $87
    sub  $D7                                      ; $7505: $D6 $D7
    and  h                                        ; $7507: $A4
    ld   d, b                                     ; $7508: $50
    ld   d, c                                     ; $7509: $51
    and  d                                        ; $750A: $A2
    and  h                                        ; $750B: $A4
    ld   l, h                                     ; $750C: $6C
    adc  a                                        ; $750D: $8F
    and  d                                        ; $750E: $A2
    and  h                                        ; $750F: $A4
    ld   c, d                                     ; $7510: $4A
    add  e                                        ; $7511: $83
    and  d                                        ; $7512: $A2
    and  h                                        ; $7513: $A4
    ld   c, d                                     ; $7514: $4A
    add  e                                        ; $7515: $83
    rst  $38                                      ; $7516: $FF
    and  h                                        ; $7517: $A4
    add  c                                        ; $7518: $81
    adc  a                                        ; $7519: $8F
    db   $76                                      ; $751A: $76
    and  h                                        ; $751B: $A4
    db   $e3                                      ; $751C: $E3
    adc  e                                        ; $751D: $8B
    rst  $38                                      ; $751E: $FF
    and  h                                        ; $751F: $A4
    rst  $38                                      ; $7520: $FF
    ld   a, c                                     ; $7521: $79
    rst  $38                                      ; $7522: $FF
    and  h                                        ; $7523: $A4
    add  c                                        ; $7524: $81
    ld   l, [hl]                                  ; $7525: $6E
    rst  $38                                      ; $7526: $FF
    and  h                                        ; $7527: $A4
    add  c                                        ; $7528: $81
    ld   l, [hl]                                  ; $7529: $6E
    adc  h                                        ; $752A: $8C
    and  h                                        ; $752B: $A4
    add  a                                        ; $752C: $87
    adc  a                                        ; $752D: $8F
    db   $76                                      ; $752E: $76
    and  h                                        ; $752F: $A4
    rst  $38                                      ; $7530: $FF
    adc  a                                        ; $7531: $8F
    rst  $38                                      ; $7532: $FF
    and  h                                        ; $7533: $A4
    add  a                                        ; $7534: $87
    rst  $38                                      ; $7535: $FF
    rst  $38                                      ; $7536: $FF
    and  h                                        ; $7537: $A4
    add  a                                        ; $7538: $87
    add  e                                        ; $7539: $83
    db   $76                                      ; $753A: $76
    and  h                                        ; $753B: $A4
    add  a                                        ; $753C: $87
    add  e                                        ; $753D: $83
    sbc  b                                        ; $753E: $98
    and  h                                        ; $753F: $A4
    rst  $38                                      ; $7540: $FF
    ld   a, c                                     ; $7541: $79
    db   $76                                      ; $7542: $76
    and  h                                        ; $7543: $A4
    db   $e3                                      ; $7544: $E3
    add  e                                        ; $7545: $83
    and  d                                        ; $7546: $A2
    and  h                                        ; $7547: $A4
    ld   h, c                                     ; $7548: $61
    ld   a, c                                     ; $7549: $79
    sub  e                                        ; $754A: $93
    and  h                                        ; $754B: $A4
    rst  $38                                      ; $754C: $FF
    ld   a, c                                     ; $754D: $79
    sub  e                                        ; $754E: $93
    and  h                                        ; $754F: $A4
    call nz, $FF79                                ; $7550: $C4 $79 $FF
    and  h                                        ; $7553: $A4
    rst  $38                                      ; $7554: $FF
    sub  d                                        ; $7555: $92
    ld   e, d                                     ; $7556: $5A
    and  h                                        ; $7557: $A4
    ld   h, c                                     ; $7558: $61
    sub  d                                        ; $7559: $92
    adc  h                                        ; $755A: $8C
    and  h                                        ; $755B: $A4
    ld   b, d                                     ; $755C: $42
    sub  d                                        ; $755D: $92
    rst  $38                                      ; $755E: $FF
    and  h                                        ; $755F: $A4
    ld   h, c                                     ; $7560: $61
    rst  $38                                      ; $7561: $FF
    rst  $38                                      ; $7562: $FF
    and  h                                        ; $7563: $A4
    ld   h, c                                     ; $7564: $61
    rst  $38                                      ; $7565: $FF
    adc  h                                        ; $7566: $8C
    and  h                                        ; $7567: $A4
    rst  $38                                      ; $7568: $FF
    add  e                                        ; $7569: $83
    sub  e                                        ; $756A: $93
    and  h                                        ; $756B: $A4
    ld   h, c                                     ; $756C: $61
    adc  e                                        ; $756D: $8B
    rst  $38                                      ; $756E: $FF
    and  h                                        ; $756F: $A4
    db   $e3                                      ; $7570: $E3
    rst  $38                                      ; $7571: $FF
    rst  $38                                      ; $7572: $FF
    and  h                                        ; $7573: $A4
    ld   h, c                                     ; $7574: $61
    rst  $38                                      ; $7575: $FF
    ld   h, a                                     ; $7576: $67
    and  h                                        ; $7577: $A4
    rst  $38                                      ; $7578: $FF
    rst  $38                                      ; $7579: $FF
    and  d                                        ; $757A: $A2
    and  h                                        ; $757B: $A4
    add  a                                        ; $757C: $87
    db   $e3                                      ; $757D: $E3
    sub  e                                        ; $757E: $93
    and  h                                        ; $757F: $A4
    add  a                                        ; $7580: $87
    rst  $38                                      ; $7581: $FF
    rst  $38                                      ; $7582: $FF
    and  h                                        ; $7583: $A4
    add  a                                        ; $7584: $87
    sub  d                                        ; $7585: $92
    ld   e, d                                     ; $7586: $5A
    and  h                                        ; $7587: $A4
    add  $9C                                      ; $7588: $C6 $9C
    sbc  b                                        ; $758A: $98
    and  h                                        ; $758B: $A4
    add  $9C                                      ; $758C: $C6 $9C
    rst  $38                                      ; $758E: $FF
    and  h                                        ; $758F: $A4
    rst  $38                                      ; $7590: $FF
    sbc  h                                        ; $7591: $9C
    sub  e                                        ; $7592: $93
    and  h                                        ; $7593: $A4
    add  c                                        ; $7594: $81
    rst  $38                                      ; $7595: $FF
    rst  $38                                      ; $7596: $FF
    and  h                                        ; $7597: $A4
    rst  $38                                      ; $7598: $FF
    sbc  h                                        ; $7599: $9C
    sbc  b                                        ; $759A: $98
    and  h                                        ; $759B: $A4
    rst  $38                                      ; $759C: $FF
    add  e                                        ; $759D: $83
    rst  $38                                      ; $759E: $FF
    and  h                                        ; $759F: $A4
    add  c                                        ; $75A0: $81
    rst  $38                                      ; $75A1: $FF
    sub  e                                        ; $75A2: $93
    and  h                                        ; $75A3: $A4
    add  c                                        ; $75A4: $81
    sbc  h                                        ; $75A5: $9C
    sub  e                                        ; $75A6: $93
    and  h                                        ; $75A7: $A4
    ld   b, h                                     ; $75A8: $44
    sbc  h                                        ; $75A9: $9C
    sbc  b                                        ; $75AA: $98
    and  h                                        ; $75AB: $A4
    sub  c                                        ; $75AC: $91
    ld   a, b                                     ; $75AD: $78
    and  d                                        ; $75AE: $A2
    and  h                                        ; $75AF: $A4
    rst  $38                                      ; $75B0: $FF
    ld   a, b                                     ; $75B1: $78
    and  d                                        ; $75B2: $A2
    and  h                                        ; $75B3: $A4
    ld   h, c                                     ; $75B4: $61
    rst  $38                                      ; $75B5: $FF
    and  d                                        ; $75B6: $A2
    and  h                                        ; $75B7: $A4
    rst  $38                                      ; $75B8: $FF
    ld   a, c                                     ; $75B9: $79
    and  d                                        ; $75BA: $A2
    and  h                                        ; $75BB: $A4
    ld   h, c                                     ; $75BC: $61
    add  e                                        ; $75BD: $83
    rst  $38                                      ; $75BE: $FF
    and  h                                        ; $75BF: $A4
    rst  $38                                      ; $75C0: $FF
    add  e                                        ; $75C1: $83
    and  d                                        ; $75C2: $A2
    and  h                                        ; $75C3: $A4
    rst  $38                                      ; $75C4: $FF
    ld   a, h                                     ; $75C5: $7C
    rst  $38                                      ; $75C6: $FF
    and  h                                        ; $75C7: $A4
    db   $e3                                      ; $75C8: $E3
    adc  e                                        ; $75C9: $8B
    and  d                                        ; $75CA: $A2
    and  h                                        ; $75CB: $A4
    db   $e3                                      ; $75CC: $E3
    add  e                                        ; $75CD: $83
    rst  $38                                      ; $75CE: $FF
    and  h                                        ; $75CF: $A4
    rst  $38                                      ; $75D0: $FF
    add  e                                        ; $75D1: $83
    db   $76                                      ; $75D2: $76
    and  h                                        ; $75D3: $A4
    ld   h, c                                     ; $75D4: $61
    add  e                                        ; $75D5: $83
    rst  $38                                      ; $75D6: $FF
    and  h                                        ; $75D7: $A4
    ld   h, c                                     ; $75D8: $61
    rst  $38                                      ; $75D9: $FF
    db   $76                                      ; $75DA: $76
    and  h                                        ; $75DB: $A4
    ld   h, c                                     ; $75DC: $61
    rst  $38                                      ; $75DD: $FF
    and  d                                        ; $75DE: $A2
    and  h                                        ; $75DF: $A4
    add  c                                        ; $75E0: $81
    ld   l, [hl]                                  ; $75E1: $6E
    rst  $38                                      ; $75E2: $FF
    and  h                                        ; $75E3: $A4
    add  c                                        ; $75E4: $81
    rst  $38                                      ; $75E5: $FF
    adc  h                                        ; $75E6: $8C
    and  h                                        ; $75E7: $A4
    ld   c, d                                     ; $75E8: $4A
    ld   a, h                                     ; $75E9: $7C
    sub  e                                        ; $75EA: $93
    and  h                                        ; $75EB: $A4
    sub  c                                        ; $75EC: $91
    ld   a, h                                     ; $75ED: $7C
    and  d                                        ; $75EE: $A2
    and  h                                        ; $75EF: $A4
    ld   c, l                                     ; $75F0: $4D
    ld   a, h                                     ; $75F1: $7C
    rst  $38                                      ; $75F2: $FF
    and  h                                        ; $75F3: $A4
    rst  $38                                      ; $75F4: $FF
    rst  $38                                      ; $75F5: $FF
    rst  $38                                      ; $75F6: $FF
    and  h                                        ; $75F7: $A4
    rst  $38                                      ; $75F8: $FF
    rst  $38                                      ; $75F9: $FF
    rst  $38                                      ; $75FA: $FF
    and  h                                        ; $75FB: $A4
    rst  $38                                      ; $75FC: $FF
    rst  $38                                      ; $75FD: $FF
    rst  $38                                      ; $75FE: $FF
    and  h                                        ; $75FF: $A4
    rst  $38                                      ; $7600: $FF
    rst  $38                                      ; $7601: $FF
    rst  $38                                      ; $7602: $FF
    and  h                                        ; $7603: $A4
    rst  $38                                      ; $7604: $FF
    rst  $38                                      ; $7605: $FF
    rst  $38                                      ; $7606: $FF
    and  h                                        ; $7607: $A4
    rst  $38                                      ; $7608: $FF
    rst  $38                                      ; $7609: $FF
    rst  $38                                      ; $760A: $FF
    and  h                                        ; $760B: $A4
    rst  $38                                      ; $760C: $FF
    rst  $38                                      ; $760D: $FF
    rst  $38                                      ; $760E: $FF
    and  h                                        ; $760F: $A4
    rst  $38                                      ; $7610: $FF
    rst  $38                                      ; $7611: $FF
    rst  $38                                      ; $7612: $FF
    and  h                                        ; $7613: $A4
    rst  $38                                      ; $7614: $FF
    rst  $38                                      ; $7615: $FF
    rst  $38                                      ; $7616: $FF
    and  h                                        ; $7617: $A4
    rst  $38                                      ; $7618: $FF
    rst  $38                                      ; $7619: $FF
    rst  $38                                      ; $761A: $FF
    and  h                                        ; $761B: $A4
    rst  $38                                      ; $761C: $FF
    rst  $38                                      ; $761D: $FF
    rst  $38                                      ; $761E: $FF
    and  h                                        ; $761F: $A4
    rst  $38                                      ; $7620: $FF
    rst  $38                                      ; $7621: $FF
    rst  $38                                      ; $7622: $FF
    and  h                                        ; $7623: $A4
    rst  $38                                      ; $7624: $FF
    rst  $38                                      ; $7625: $FF
    rst  $38                                      ; $7626: $FF
    and  h                                        ; $7627: $A4
    rst  $38                                      ; $7628: $FF
    rst  $38                                      ; $7629: $FF
    rst  $38                                      ; $762A: $FF
    and  h                                        ; $762B: $A4
    rst  $38                                      ; $762C: $FF
    rst  $38                                      ; $762D: $FF
    rst  $38                                      ; $762E: $FF
    and  h                                        ; $762F: $A4
    rst  $38                                      ; $7630: $FF
    rst  $38                                      ; $7631: $FF
    rst  $38                                      ; $7632: $FF
    and  h                                        ; $7633: $A4
    add  c                                        ; $7634: $81
    adc  a                                        ; $7635: $8F
    call nc, $81A4                                ; $7636: $D4 $A4 $81
    ld   a, c                                     ; $7639: $79
    rst  $38                                      ; $763A: $FF
    rst  $38                                      ; $763B: $FF
    rst  $38                                      ; $763C: $FF
    rst  $38                                      ; $763D: $FF
    rst  $38                                      ; $763E: $FF
    sub  b                                        ; $763F: $90
    sub  c                                        ; $7640: $91
    sub  d                                        ; $7641: $92
    sbc  b                                        ; $7642: $98
    sub  b                                        ; $7643: $90
    sub  c                                        ; $7644: $91
    xor  e                                        ; $7645: $AB
    rst  $38                                      ; $7646: $FF
    sub  b                                        ; $7647: $90
    sub  c                                        ; $7648: $91
    sub  d                                        ; $7649: $92
    sub  e                                        ; $764A: $93
    sub  b                                        ; $764B: $90
    sub  c                                        ; $764C: $91
    sub  h                                        ; $764D: $94
    sbc  a                                        ; $764E: $9F
    sub  b                                        ; $764F: $90
    sub  c                                        ; $7650: $91
    or   b                                        ; $7651: $B0
    or   c                                        ; $7652: $B1
    sub  b                                        ; $7653: $90
    sub  c                                        ; $7654: $91
    sbc  h                                        ; $7655: $9C
    sub  e                                        ; $7656: $93
    sub  b                                        ; $7657: $90
    sub  c                                        ; $7658: $91
    sub  a                                        ; $7659: $97
    sbc  e                                        ; $765A: $9B
    rst  $38                                      ; $765B: $FF
    rst  $38                                      ; $765C: $FF
    or   [hl]                                     ; $765D: $B6
    or   a                                        ; $765E: $B7
    and  h                                        ; $765F: $A4
    ld   c, h                                     ; $7660: $4C
    ld   c, c                                     ; $7661: $49
    ld   b, [hl]                                  ; $7662: $46
    and  h                                        ; $7663: $A4
    rst  $38                                      ; $7664: $FF
    ld   b, l                                     ; $7665: $45
    ld   l, l                                     ; $7666: $6D
    and  h                                        ; $7667: $A4
    rst  $38                                      ; $7668: $FF
    ld   b, a                                     ; $7669: $47
    ld   c, b                                     ; $766A: $48
    and  h                                        ; $766B: $A4
    rst  $38                                      ; $766C: $FF
    ld   c, h                                     ; $766D: $4C
    ld   c, e                                     ; $766E: $4B
    sub  b                                        ; $766F: $90
    sub  c                                        ; $7670: $91
    sub  [hl]                                     ; $7671: $96
    rst  $38                                      ; $7672: $FF
    rst  $38                                      ; $7673: $FF
    rst  $38                                      ; $7674: $FF
    ld   c, a                                     ; $7675: $4F
    ld   d, b                                     ; $7676: $50
    rst  $38                                      ; $7677: $FF
    rst  $38                                      ; $7678: $FF

Func_020_7679:
    ld   c, a                                     ; $7679: $4F
    ld   d, c                                     ; $767A: $51
    and  h                                        ; $767B: $A4
    add  a                                        ; $767C: $87
    add  h                                        ; $767D: $84
    adc  c                                        ; $767E: $89
    and  h                                        ; $767F: $A4
    rst  $38                                      ; $7680: $FF
    adc  b                                        ; $7681: $88
    rst  $00                                      ; $7682: $C7
    and  b                                        ; $7683: $A0
    and  c                                        ; $7684: $A1
    add  h                                        ; $7685: $84
    add  e                                        ; $7686: $83
    sub  b                                        ; $7687: $90
    sub  c                                        ; $7688: $91
    ld   d, h                                     ; $7689: $54
    and  [hl]                                     ; $768A: $A6
    sub  b                                        ; $768B: $90
    sub  c                                        ; $768C: $91
    sub  a                                        ; $768D: $97
    sub  e                                        ; $768E: $93
    sub  b                                        ; $768F: $90
    sub  c                                        ; $7690: $91
    xor  d                                        ; $7691: $AA
    rst  $38                                      ; $7692: $FF
    sub  b                                        ; $7693: $90
    sub  c                                        ; $7694: $91
    or   h                                        ; $7695: $B4
    or   l                                        ; $7696: $B5
    sub  b                                        ; $7697: $90
    sub  c                                        ; $7698: $91
    sbc  h                                        ; $7699: $9C
    sbc  [hl]                                     ; $769A: $9E
    sub  b                                        ; $769B: $90
    sub  c                                        ; $769C: $91
    sbc  h                                        ; $769D: $9C
    sbc  l                                        ; $769E: $9D
    ld   l, b                                     ; $769F: $68
    sub  c                                        ; $76A0: $91
    ld   d, [hl]                                  ; $76A1: $56
    ld   h, b                                     ; $76A2: $60
    xor  h                                        ; $76A3: $AC
    xor  l                                        ; $76A4: $AD
    xor  [hl]                                     ; $76A5: $AE
    xor  a                                        ; $76A6: $AF
    sub  b                                        ; $76A7: $90
    sub  c                                        ; $76A8: $91
    ld   e, b                                     ; $76A9: $58
    sbc  e                                        ; $76AA: $9B
    sub  b                                        ; $76AB: $90
    sub  c                                        ; $76AC: $91
    and  [hl]                                     ; $76AD: $A6
    ld   e, c                                     ; $76AE: $59
    rst  $38                                      ; $76AF: $FF
    rst  $38                                      ; $76B0: $FF
    cp   b                                        ; $76B1: $B8
    cp   c                                        ; $76B2: $B9
    sub  b                                        ; $76B3: $90
    sub  c                                        ; $76B4: $91
    ld   h, d                                     ; $76B5: $62
    ld   h, e                                     ; $76B6: $63
    sub  b                                        ; $76B7: $90
    sub  c                                        ; $76B8: $91
    xor  b                                        ; $76B9: $A8
    sbc  a                                        ; $76BA: $9F
    and  h                                        ; $76BB: $A4
    rst  $18                                      ; $76BC: $DF
    and  e                                        ; $76BD: $A3
    rst  $38                                      ; $76BE: $FF
    sub  b                                        ; $76BF: $90
    sub  c                                        ; $76C0: $91
    sub  d                                        ; $76C1: $92
    sbc  d                                        ; $76C2: $9A
    and  h                                        ; $76C3: $A4
    ld   e, e                                     ; $76C4: $5B
    ld   e, h                                     ; $76C5: $5C
    rst  $38                                      ; $76C6: $FF
    and  [hl]                                     ; $76C7: $A6
    sub  c                                        ; $76C8: $91
    sub  a                                        ; $76C9: $97
    sbc  e                                        ; $76CA: $9B
    sub  b                                        ; $76CB: $90
    sub  c                                        ; $76CC: $91
    sbc  h                                        ; $76CD: $9C
    ld   h, b                                     ; $76CE: $60
    rst  $38                                      ; $76CF: $FF
    rst  $38                                      ; $76D0: $FF
    or   d                                        ; $76D1: $B2
    or   e                                        ; $76D2: $B3
    and  [hl]                                     ; $76D3: $A6
    sub  c                                        ; $76D4: $91
    ld   d, a                                     ; $76D5: $57
    rst  $38                                      ; $76D6: $FF
    and  [hl]                                     ; $76D7: $A6
    sub  c                                        ; $76D8: $91
    sub  l                                        ; $76D9: $95
    sbc  b                                        ; $76DA: $98
    and  [hl]                                     ; $76DB: $A6
    sub  c                                        ; $76DC: $91
    ld   e, [hl]                                  ; $76DD: $5E
    ld   h, b                                     ; $76DE: $60
    and  [hl]                                     ; $76DF: $A6
    sub  c                                        ; $76E0: $91
    xor  d                                        ; $76E1: $AA
    sub  e                                        ; $76E2: $93
    and  [hl]                                     ; $76E3: $A6
    sub  c                                        ; $76E4: $91
    ld   e, b                                     ; $76E5: $58
    sbc  c                                        ; $76E6: $99
    sub  b                                        ; $76E7: $90
    sub  c                                        ; $76E8: $91
    sub  l                                        ; $76E9: $95
    sub  e                                        ; $76EA: $93
    ld   e, a                                     ; $76EB: $5F
    sub  c                                        ; $76EC: $91
    ld   d, l                                     ; $76ED: $55
    sbc  c                                        ; $76EE: $99
    ld   h, [hl]                                  ; $76EF: $66
    sub  c                                        ; $76F0: $91
    ld   e, [hl]                                  ; $76F1: $5E
    ld   e, c                                     ; $76F2: $59
    ld   h, [hl]                                  ; $76F3: $66
    sub  c                                        ; $76F4: $91
    ld   d, h                                     ; $76F5: $54
    ld   e, c                                     ; $76F6: $59
    adc  l                                        ; $76F7: $8D
    adc  [hl]                                     ; $76F8: $8E
    adc  a                                        ; $76F9: $8F
    ld   l, d                                     ; $76FA: $6A
    ld   l, b                                     ; $76FB: $68
    sub  c                                        ; $76FC: $91
    sbc  e                                        ; $76FD: $9B
    ld   h, b                                     ; $76FE: $60
    ld   l, b                                     ; $76FF: $68
    sub  c                                        ; $7700: $91
    sub  h                                        ; $7701: $94
    sbc  a                                        ; $7702: $9F
    ld   l, b                                     ; $7703: $68
    sub  c                                        ; $7704: $91
    sbc  h                                        ; $7705: $9C
    ld   h, b                                     ; $7706: $60
    ld   e, a                                     ; $7707: $5F
    ld   h, l                                     ; $7708: $65
    ld   e, l                                     ; $7709: $5D
    ld   h, h                                     ; $770A: $64
    rst  $38                                      ; $770B: $FF
    sub  c                                        ; $770C: $91
    ld   d, l                                     ; $770D: $55
    rst  $38                                      ; $770E: $FF
    ld   e, a                                     ; $770F: $5F
    sub  c                                        ; $7710: $91
    sub  l                                        ; $7711: $95
    sbc  c                                        ; $7712: $99
    ld   e, a                                     ; $7713: $5F
    sub  c                                        ; $7714: $91
    ld   e, [hl]                                  ; $7715: $5E
    sbc  c                                        ; $7716: $99
    ld   e, a                                     ; $7717: $5F
    sub  c                                        ; $7718: $91
    xor  c                                        ; $7719: $A9
    rst  $38                                      ; $771A: $FF
    ld   e, a                                     ; $771B: $5F
    sub  c                                        ; $771C: $91
    sub  h                                        ; $771D: $94
    sbc  a                                        ; $771E: $9F
    sub  b                                        ; $771F: $90
    sub  c                                        ; $7720: $91
    ld   d, l                                     ; $7721: $55
    sub  e                                        ; $7722: $93
    and  h                                        ; $7723: $A4
    rst  $38                                      ; $7724: $FF
    ld   a, h                                     ; $7725: $7C
    rst  $38                                      ; $7726: $FF
    cp   h                                        ; $7727: $BC
    cp   l                                        ; $7728: $BD
    cp   [hl]                                     ; $7729: $BE
    cp   a                                        ; $772A: $BF
    and  [hl]                                     ; $772B: $A6
    sub  c                                        ; $772C: $91
    sbc  h                                        ; $772D: $9C
    sbc  l                                        ; $772E: $9D
    rst  $38                                      ; $772F: $FF
    push de                                       ; $7730: $D5
    ld   a, b                                     ; $7731: $78
    ld   d, e                                     ; $7732: $53
    sub  b                                        ; $7733: $90
    sub  c                                        ; $7734: $91
    rst  $38                                      ; $7735: $FF
    rst  $38                                      ; $7736: $FF
    ld   e, a                                     ; $7737: $5F
    sub  c                                        ; $7738: $91
    ld   d, l                                     ; $7739: $55
    sbc  b                                        ; $773A: $98
    and  h                                        ; $773B: $A4
    rst  $38                                      ; $773C: $FF
    rst  $38                                      ; $773D: $FF
    ld   l, c                                     ; $773E: $69
    and  h                                        ; $773F: $A4
    rst  $38                                      ; $7740: $FF
    ld   c, h                                     ; $7741: $4C
    ld   [hl], h                                  ; $7742: $74
    and  b                                        ; $7743: $A0
    and  c                                        ; $7744: $A1
    ld   [hl], l                                  ; $7745: $75
    ld   c, [hl]                                  ; $7746: $4E
    and  h                                        ; $7747: $A4
    ld   a, l                                     ; $7748: $7D
    ld   a, [hl]                                  ; $7749: $7E
    ld   a, a                                     ; $774A: $7F
    and  h                                        ; $774B: $A4
    rst  $38                                      ; $774C: $FF
    rst  $38                                      ; $774D: $FF
    rst  $00                                      ; $774E: $C7
    ret  nz                                       ; $774F: $C0

    pop  bc                                       ; $7750: $C1
    jp   nz, $A4C3                                ; $7751: $C2 $C3 $A4

    call z, $CECD                                 ; $7754: $CC $CD $CE
    and  h                                        ; $7757: $A4
    ret                                           ; $7758: $C9

    jp   z, $A4CB                                 ; $7759: $CA $CB $A4

    pop  de                                       ; $775C: $D1
    jp   nc, $DD6A                                ; $775D: $D2 $6A $DD

    push hl                                       ; $7760: $E5
    db   $d3                                      ; $7761: $D3
    db   $dd                                      ; $7762: $DD
    db   $dd                                      ; $7763: $DD
    rst  $38                                      ; $7764: $FF
    sbc  $FF                                      ; $7765: $DE $FF
    and  h                                        ; $7767: $A4
    adc  l                                        ; $7768: $8D
    rst  $38                                      ; $7769: $FF
    rst  $38                                      ; $776A: $FF
    rst  $38                                      ; $776B: $FF
    rst  $18                                      ; $776C: $DF
    ld   c, c                                     ; $776D: $49
    rst  $38                                      ; $776E: $FF
    rst  $38                                      ; $776F: $FF
    call nz, $FFFF                                ; $7770: $C4 $FF $FF
    and  h                                        ; $7773: $A4
    add  b                                        ; $7774: $80
    ld   a, h                                     ; $7775: $7C
    and  l                                        ; $7776: $A5
    rst  $38                                      ; $7777: $FF
    rst  $38                                      ; $7778: $FF
    rst  $38                                      ; $7779: $FF
    rst  $38                                      ; $777A: $FF
    rst  $38                                      ; $777B: $FF
    rst  $38                                      ; $777C: $FF
    cp   d                                        ; $777D: $BA
    cp   e                                        ; $777E: $BB
    ld   [hl], a                                  ; $777F: $77
    sub  c                                        ; $7780: $91
    and  a                                        ; $7781: $A7
    rst  $38                                      ; $7782: $FF
    ld   a, e                                     ; $7783: $7B
    sub  c                                        ; $7784: $91
    ld   a, d                                     ; $7785: $7A
    xor  e                                        ; $7786: $AB
    ld   a, e                                     ; $7787: $7B
    sub  c                                        ; $7788: $91
    ld   d, a                                     ; $7789: $57
    sbc  c                                        ; $778A: $99
    ld   [hl], a                                  ; $778B: $77
    sub  c                                        ; $778C: $91
    ld   a, d                                     ; $778D: $7A
    xor  d                                        ; $778E: $AA
    ld   a, e                                     ; $778F: $7B
    sub  c                                        ; $7790: $91
    ld   d, h                                     ; $7791: $54
    sbc  c                                        ; $7792: $99
    ld   a, e                                     ; $7793: $7B
    sub  c                                        ; $7794: $91
    ld   d, [hl]                                  ; $7795: $56
    rst  $38                                      ; $7796: $FF
    ld   [hl], a                                  ; $7797: $77
    sub  c                                        ; $7798: $91
    ld   d, h                                     ; $7799: $54
    sbc  c                                        ; $779A: $99
    ld   a, e                                     ; $779B: $7B
    sub  c                                        ; $779C: $91
    rst  $38                                      ; $779D: $FF
    rst  $38                                      ; $779E: $FF
    ld   e, a                                     ; $779F: $5F
    sub  c                                        ; $77A0: $91
    sbc  l                                        ; $77A1: $9D
    sbc  c                                        ; $77A2: $99
    ld   a, e                                     ; $77A3: $7B
    sub  c                                        ; $77A4: $91
    sub  [hl]                                     ; $77A5: $96
    sbc  c                                        ; $77A6: $99
    ld   a, e                                     ; $77A7: $7B
    sub  c                                        ; $77A8: $91
    ld   a, d                                     ; $77A9: $7A
    sbc  c                                        ; $77AA: $99
    ld   [hl], a                                  ; $77AB: $77
    sub  c                                        ; $77AC: $91
    ld   a, d                                     ; $77AD: $7A
    sbc  c                                        ; $77AE: $99
    ld   [hl], a                                  ; $77AF: $77
    sub  c                                        ; $77B0: $91
    sub  [hl]                                     ; $77B1: $96
    sbc  c                                        ; $77B2: $99
    ld   e, a                                     ; $77B3: $5F
    sub  c                                        ; $77B4: $91
    ld   d, l                                     ; $77B5: $55
    sub  e                                        ; $77B6: $93
    rst  $38                                      ; $77B7: $FF
    sub  c                                        ; $77B8: $91
    sub  l                                        ; $77B9: $95
    sub  e                                        ; $77BA: $93
    sub  b                                        ; $77BB: $90
    sub  c                                        ; $77BC: $91
    ld   d, l                                     ; $77BD: $55
    sub  e                                        ; $77BE: $93
    and  [hl]                                     ; $77BF: $A6
    sub  c                                        ; $77C0: $91
    sub  l                                        ; $77C1: $95
    ld   h, b                                     ; $77C2: $60
    and  [hl]                                     ; $77C3: $A6
    sub  c                                        ; $77C4: $91
    sub  l                                        ; $77C5: $95
    sbc  c                                        ; $77C6: $99
    ld   e, a                                     ; $77C7: $5F
    reti                                          ; $77C8: $D9

    jp   c, label_020_5FDB                        ; $77C9: $DA $DB $5F

    reti                                          ; $77CC: $D9

    jp   c, $FF64                                 ; $77CD: $DA $64 $FF

    sub  c                                        ; $77D0: $91
    sub  b                                        ; $77D1: $90
    db   $76                                      ; $77D2: $76
    rst  $38                                      ; $77D3: $FF
    sub  c                                        ; $77D4: $91
    sub  b                                        ; $77D5: $90
    sbc  b                                        ; $77D6: $98
    rst  $38                                      ; $77D7: $FF
    ld   c, d                                     ; $77D8: $4A
    sub  b                                        ; $77D9: $90
    db   $76                                      ; $77DA: $76
    ld   e, a                                     ; $77DB: $5F
    rst  $38                                      ; $77DC: $FF
    rst  $38                                      ; $77DD: $FF
    rst  $38                                      ; $77DE: $FF
    rst  $38                                      ; $77DF: $FF
    rst  $38                                      ; $77E0: $FF
    rst  $38                                      ; $77E1: $FF
    rst  $38                                      ; $77E2: $FF
    rst  $38                                      ; $77E3: $FF
    rst  $38                                      ; $77E4: $FF
    rst  $38                                      ; $77E5: $FF
    rst  $38                                      ; $77E6: $FF
    rst  $38                                      ; $77E7: $FF
    rst  $38                                      ; $77E8: $FF
    rst  $38                                      ; $77E9: $FF
    rst  $38                                      ; $77EA: $FF
    rst  $38                                      ; $77EB: $FF
    rst  $38                                      ; $77EC: $FF
    rst  $38                                      ; $77ED: $FF
    rst  $38                                      ; $77EE: $FF
    rst  $38                                      ; $77EF: $FF
    sub  c                                        ; $77F0: $91
    sub  b                                        ; $77F1: $90
    and  [hl]                                     ; $77F2: $A6
    and  h                                        ; $77F3: $A4
    rst  $38                                      ; $77F4: $FF
    rst  $38                                      ; $77F5: $FF
    db   $f4                                      ; $77F6: $F4
    add  sp, -$17                                 ; $77F7: $E8 $E9
    ld_long hActiveEntityType, a                              ; $77F9: $EA $EB $FF
    rst  $38                                      ; $77FC: $FF
    rst  $38                                      ; $77FD: $FF
    rst  $38                                      ; $77FE: $FF
    rst  $38                                      ; $77FF: $FF
    rst  $38                                      ; $7800: $FF
    rst  $38                                      ; $7801: $FF
    rst  $38                                      ; $7802: $FF
    rst  $38                                      ; $7803: $FF
    rst  $38                                      ; $7804: $FF
    rst  $38                                      ; $7805: $FF
    rst  $38                                      ; $7806: $FF
    rst  $38                                      ; $7807: $FF
    rst  $38                                      ; $7808: $FF
    rst  $38                                      ; $7809: $FF
    rst  $38                                      ; $780A: $FF
    rst  $38                                      ; $780B: $FF
    rst  $38                                      ; $780C: $FF
    rst  $38                                      ; $780D: $FF
    rst  $38                                      ; $780E: $FF
    rst  $38                                      ; $780F: $FF
    rst  $38                                      ; $7810: $FF
    rst  $38                                      ; $7811: $FF
    rst  $38                                      ; $7812: $FF
    rst  $38                                      ; $7813: $FF
    rst  $38                                      ; $7814: $FF
    rst  $38                                      ; $7815: $FF
    rst  $38                                      ; $7816: $FF
    rst  $38                                      ; $7817: $FF
    rst  $38                                      ; $7818: $FF
    rst  $38                                      ; $7819: $FF
    rst  $38                                      ; $781A: $FF
    rst  $38                                      ; $781B: $FF
    rst  $38                                      ; $781C: $FF
    rst  $38                                      ; $781D: $FF
    rst  $38                                      ; $781E: $FF
    rst  $38                                      ; $781F: $FF
    rst  $38                                      ; $7820: $FF
    rst  $38                                      ; $7821: $FF
    rst  $38                                      ; $7822: $FF
    rst  $38                                      ; $7823: $FF
    rst  $38                                      ; $7824: $FF
    rst  $38                                      ; $7825: $FF
    rst  $38                                      ; $7826: $FF
    rst  $38                                      ; $7827: $FF
    rst  $38                                      ; $7828: $FF
    rst  $38                                      ; $7829: $FF
    rst  $38                                      ; $782A: $FF
    ld   b, h                                     ; $782B: $44
    and  c                                        ; $782C: $A1
    ld   [hl], l                                  ; $782D: $75
    ld   c, [hl]                                  ; $782E: $4E
    rst  $38                                      ; $782F: $FF
    ld   h, c                                     ; $7830: $61
    rst  $38                                      ; $7831: $FF
    rst  $38                                      ; $7832: $FF
    and  h                                        ; $7833: $A4
    rst  $38                                      ; $7834: $FF
    add  [hl]                                     ; $7835: $86
    rst  $38                                      ; $7836: $FF
    and  h                                        ; $7837: $A4
    rst  $38                                      ; $7838: $FF
    adc  e                                        ; $7839: $8B
    rst  $38                                      ; $783A: $FF
    and  h                                        ; $783B: $A4
    ld   c, l                                     ; $783C: $4D
    rst  $38                                      ; $783D: $FF
    rst  $38                                      ; $783E: $FF
    ld   b, l                                     ; $783F: $45
    ld   a, b                                     ; $7840: $78
    ld   a, l                                     ; $7841: $7D
    ld   a, b                                     ; $7842: $78
    or   l                                        ; $7843: $B5
    ld   a, b                                     ; $7844: $78
    nop                                           ; $7845: $00
    nop                                           ; $7846: $00
    push bc                                       ; $7847: $C5
    ld   c, h                                     ; $7848: $4C
    ld   l, b                                     ; $7849: $68
    ld   a, l                                     ; $784A: $7D
    rst  $38                                      ; $784B: $FF
    ld   a, a                                     ; $784C: $7F
    nop                                           ; $784D: $00
    nop                                           ; $784E: $00
    ld   h, d                                     ; $784F: $62
    inc  a                                        ; $7850: $3C
    push hl                                       ; $7851: $E5
    ld   l, b                                     ; $7852: $68
    sub  $5E                                      ; $7853: $D6 $5E
    nop                                           ; $7855: $00
    nop                                           ; $7856: $00
    nop                                           ; $7857: $00
    jr   nz, jr_020_785A                          ; $7858: $20 $00

jr_020_785A:
    ld   d, b                                     ; $785A: $50
    xor  l                                        ; $785B: $AD
    dec  [hl]                                     ; $785C: $35
    nop                                           ; $785D: $00
    nop                                           ; $785E: $00
    rrca                                          ; $785F: $0F
    ld   h, [hl]                                  ; $7860: $66
    sub  $6E                                      ; $7861: $D6 $6E
    rst  $38                                      ; $7863: $FF
    ld   a, a                                     ; $7864: $7F
    rrca                                          ; $7865: $0F
    ld   h, [hl]                                  ; $7866: $66
    rrca                                          ; $7867: $0F
    ld   h, [hl]                                  ; $7868: $66
    sub  $6E                                      ; $7869: $D6 $6E
    rst  $38                                      ; $786B: $FF
    ld   a, a                                     ; $786C: $7F
    xor  h                                        ; $786D: $AC
    ld   e, c                                     ; $786E: $59
    rrca                                          ; $786F: $0F
    ld   h, [hl]                                  ; $7870: $66
    sub  $6E                                      ; $7871: $D6 $6E
    rst  $38                                      ; $7873: $FF
    ld   a, a                                     ; $7874: $7F
    ld   c, c                                     ; $7875: $49
    ld   c, l                                     ; $7876: $4D
    rrca                                          ; $7877: $0F
    ld   h, [hl]                                  ; $7878: $66
    sub  $6E                                      ; $7879: $D6 $6E
    rst  $38                                      ; $787B: $FF
    ld   a, a                                     ; $787C: $7F
    nop                                           ; $787D: $00
    nop                                           ; $787E: $00
    ld   l, b                                     ; $787F: $68
    ld   a, l                                     ; $7880: $7D
    rst  $38                                      ; $7881: $FF
    ld   a, a                                     ; $7882: $7F
    push bc                                       ; $7883: $C5
    ld   c, h                                     ; $7884: $4C
    nop                                           ; $7885: $00

jr_020_7886:
    nop                                           ; $7886: $00
    push hl                                       ; $7887: $E5
    ld   l, b                                     ; $7888: $68
    sub  $5E                                      ; $7889: $D6 $5E
    ld   h, d                                     ; $788B: $62
    inc  a                                        ; $788C: $3C
    nop                                           ; $788D: $00
    nop                                           ; $788E: $00
    nop                                           ; $788F: $00
    ld   d, b                                     ; $7890: $50
    xor  l                                        ; $7891: $AD
    dec  [hl]                                     ; $7892: $35
    nop                                           ; $7893: $00
    jr   nz, jr_020_7896                          ; $7894: $20 $00

jr_020_7896:
    nop                                           ; $7896: $00
    sub  $6E                                      ; $7897: $D6 $6E
    rst  $38                                      ; $7899: $FF
    ld   a, a                                     ; $789A: $7F
    rrca                                          ; $789B: $0F
    ld   h, [hl]                                  ; $789C: $66
    push bc                                       ; $789D: $C5
    ld   c, h                                     ; $789E: $4C
    sub  $6E                                      ; $789F: $D6 $6E
    rst  $38                                      ; $78A1: $FF
    ld   a, a                                     ; $78A2: $7F
    rrca                                          ; $78A3: $0F
    ld   h, [hl]                                  ; $78A4: $66
    ld   h, d                                     ; $78A5: $62
    inc  a                                        ; $78A6: $3C
    sub  $6E                                      ; $78A7: $D6 $6E
    rst  $38                                      ; $78A9: $FF
    ld   a, a                                     ; $78AA: $7F
    rrca                                          ; $78AB: $0F
    ld   h, [hl]                                  ; $78AC: $66
    nop                                           ; $78AD: $00
    jr   nz, jr_020_7886                          ; $78AE: $20 $D6

    ld   l, [hl]                                  ; $78B0: $6E
    rst  $38                                      ; $78B1: $FF
    ld   a, a                                     ; $78B2: $7F
    rrca                                          ; $78B3: $0F
    ld   h, [hl]                                  ; $78B4: $66
    nop                                           ; $78B5: $00
    nop                                           ; $78B6: $00
    rst  $38                                      ; $78B7: $FF
    ld   a, a                                     ; $78B8: $7F
    push bc                                       ; $78B9: $C5
    ld   c, h                                     ; $78BA: $4C
    ld   l, b                                     ; $78BB: $68
    ld   a, l                                     ; $78BC: $7D
    nop                                           ; $78BD: $00
    nop                                           ; $78BE: $00
    sub  $5E                                      ; $78BF: $D6 $5E
    ld   h, d                                     ; $78C1: $62
    inc  a                                        ; $78C2: $3C
    push hl                                       ; $78C3: $E5
    ld   l, b                                     ; $78C4: $68
    nop                                           ; $78C5: $00
    nop                                           ; $78C6: $00
    xor  l                                        ; $78C7: $AD
    dec  [hl]                                     ; $78C8: $35
    nop                                           ; $78C9: $00
    jr   nz, jr_020_78CC                          ; $78CA: $20 $00

jr_020_78CC:
    ld   d, b                                     ; $78CC: $50
    nop                                           ; $78CD: $00
    nop                                           ; $78CE: $00
    rst  $38                                      ; $78CF: $FF
    ld   a, a                                     ; $78D0: $7F
    rrca                                          ; $78D1: $0F
    ld   h, [hl]                                  ; $78D2: $66
    sub  $6E                                      ; $78D3: $D6 $6E
    ld   l, b                                     ; $78D5: $68
    ld   a, l                                     ; $78D6: $7D
    rst  $38                                      ; $78D7: $FF
    ld   a, a                                     ; $78D8: $7F
    rrca                                          ; $78D9: $0F
    ld   h, [hl]                                  ; $78DA: $66
    sub  $6E                                      ; $78DB: $D6 $6E
    push hl                                       ; $78DD: $E5
    ld   l, b                                     ; $78DE: $68
    rst  $38                                      ; $78DF: $FF
    ld   a, a                                     ; $78E0: $7F
    rrca                                          ; $78E1: $0F
    ld   h, [hl]                                  ; $78E2: $66
    sub  $6E                                      ; $78E3: $D6 $6E
    nop                                           ; $78E5: $00
    ld   d, b                                     ; $78E6: $50
    rst  $38                                      ; $78E7: $FF
    ld   a, a                                     ; $78E8: $7F
    rrca                                          ; $78E9: $0F
    ld   h, [hl]                                  ; $78EA: $66
    sub  $6E                                      ; $78EB: $D6 $6E
    ld   a, [wIsFileSelectionArrowShifted]        ; $78ED: $FA $00 $D0
    sla  a                                        ; $78F0: $CB $27
    ld   e, a                                     ; $78F2: $5F
    ld   d, $00                                   ; $78F3: $16 $00
    ld   hl, $783F                                ; $78F5: $21 $3F $78
    add  hl, de                                   ; $78F8: $19
    ld   a, [hl+]                                 ; $78F9: $2A
    ld   b, a                                     ; $78FA: $47
    ld   h, [hl]                                  ; $78FB: $66
    ld   l, b                                     ; $78FC: $68
    ld   bc, $0038                                ; $78FD: $01 $38 $00
    ld   de, $DC10                                ; $7900: $11 $10 $DC
    call CopyData                                 ; $7903: $CD $14 $29
    xor  a                                        ; $7906: $AF
    ld   [wPaletteUnknownC], a                    ; $7907: $EA $D3 $DD
    ld   a, $1C                                   ; $790A: $3E $1C
    ld   [wPaletteUnknownD], a                    ; $790C: $EA $D4 $DD
    ld   a, $81                                   ; $790F: $3E $81
    ld   [wPaletteDataFlags], a                    ; $7911: $EA $D1 $DD
    ret                                           ; $7914: $C9

    nop                                           ; $7915: $00
    nop                                           ; $7916: $00
    db   $10                                      ; $7917: $10
    rla                                           ; $7918: $17
    nop                                           ; $7919: $00
    ld   [$1704], sp                              ; $791A: $08 $04 $17
    nop                                           ; $791D: $00
    db   $10                                      ; $791E: $10
    ld   b, $17                                   ; $791F: $06 $17
    nop                                           ; $7921: $00
    jr   jr_020_792A                              ; $7922: $18 $06

    scf                                           ; $7924: $37
    nop                                           ; $7925: $00
    jr   nz, jr_020_792C                          ; $7926: $20 $04

    scf                                           ; $7928: $37
    nop                                           ; $7929: $00

jr_020_792A:
    jr   z, jr_020_793C                           ; $792A: $28 $10

jr_020_792C:
    scf                                           ; $792C: $37
    stop                                          ; $792D: $10 $00
    ld   [$1017], sp                              ; $792F: $08 $17 $10
    ld   [$170A], sp                              ; $7932: $08 $0A $17
    db   $10                                      ; $7935: $10
    db   $10                                      ; $7936: $10
    inc  c                                        ; $7937: $0C
    rla                                           ; $7938: $17
    db   $10                                      ; $7939: $10
    jr   @+$0E                                    ; $793A: $18 $0C

jr_020_793C:
    scf                                           ; $793C: $37
    db   $10                                      ; $793D: $10
    jr   nz, @+$0C                                ; $793E: $20 $0A

    scf                                           ; $7940: $37
    db   $10                                      ; $7941: $10
    jr   z, @+$0A                                 ; $7942: $28 $08

    scf                                           ; $7944: $37
    jr   nz, jr_020_7957                          ; $7945: $20 $10

    jr   nz, @+$19                                ; $7947: $20 $17

    jr   nz, @+$1A                                ; $7949: $20 $18

    jr   nc, jr_020_7964                          ; $794B: $30 $17

    jr   nc, jr_020_795F                          ; $794D: $30 $10

    jr   nz, @+$19                                ; $794F: $20 $17

    jr   nc, @+$1A                                ; $7951: $30 $18

    jr   nc, jr_020_796C                          ; $7953: $30 $17

    ld   b, b                                     ; $7955: $40
    db   $10                                      ; $7956: $10

jr_020_7957:
    jr   nz, @+$19                                ; $7957: $20 $17

    ld   b, b                                     ; $7959: $40
    jr   jr_020_798C                              ; $795A: $18 $30

    rla                                           ; $795C: $17
    ld   d, b                                     ; $795D: $50
    db   $10                                      ; $795E: $10

jr_020_795F:
    jr   nz, @+$19                                ; $795F: $20 $17

    ld   d, b                                     ; $7961: $50
    jr   jr_020_7994                              ; $7962: $18 $30

jr_020_7964:
    rla                                           ; $7964: $17
    ld   h, b                                     ; $7965: $60
    db   $10                                      ; $7966: $10
    jr   nz, @+$19                                ; $7967: $20 $17

    ld   h, b                                     ; $7969: $60
    jr   @+$32                                    ; $796A: $18 $30

jr_020_796C:
    rla                                           ; $796C: $17
    ld   [hl], b                                  ; $796D: $70
    db   $10                                      ; $796E: $10
    jr   nz, @+$19                                ; $796F: $20 $17

    ld   [hl], b                                  ; $7971: $70
    jr   jr_020_79A4                              ; $7972: $18 $30

    rla                                           ; $7974: $17
    add  b                                        ; $7975: $80
    db   $10                                      ; $7976: $10
    jr   nz, @+$19                                ; $7977: $20 $17

    add  b                                        ; $7979: $80
    jr   jr_020_79AC                              ; $797A: $18 $30

    rla                                           ; $797C: $17
    sub  b                                        ; $797D: $90
    db   $10                                      ; $797E: $10
    jr   nz, jr_020_7998                          ; $797F: $20 $17

    sub  b                                        ; $7981: $90
    jr   @+$32                                    ; $7982: $18 $30

    rla                                           ; $7984: $17
    and  b                                        ; $7985: $A0
    db   $10                                      ; $7986: $10
    jr   nz, @+$19                                ; $7987: $20 $17

    and  b                                        ; $7989: $A0
    jr   jr_020_79BC                              ; $798A: $18 $30

jr_020_798C:
    rla                                           ; $798C: $17
    or   b                                        ; $798D: $B0
    db   $10                                      ; $798E: $10
    jr   nz, jr_020_79A8                          ; $798F: $20 $17

    or   b                                        ; $7991: $B0
    jr   jr_020_79C4                              ; $7992: $18 $30

jr_020_7994:
    rla                                           ; $7994: $17
    nop                                           ; $7995: $00
    nop                                           ; $7996: $00
    ld   [de], a                                  ; $7997: $12

jr_020_7998:
    rla                                           ; $7998: $17
    nop                                           ; $7999: $00
    ld   [$1714], sp                              ; $799A: $08 $14 $17
    nop                                           ; $799D: $00
    db   $10                                      ; $799E: $10
    ld   d, $17                                   ; $799F: $16 $17
    nop                                           ; $79A1: $00
    jr   jr_020_79BA                              ; $79A2: $18 $16

jr_020_79A4:
    scf                                           ; $79A4: $37
    nop                                           ; $79A5: $00
    jr   nz, jr_020_79BC                          ; $79A6: $20 $14

jr_020_79A8:
    scf                                           ; $79A8: $37
    nop                                           ; $79A9: $00
    jr   z, jr_020_79BE                           ; $79AA: $28 $12

jr_020_79AC:
    scf                                           ; $79AC: $37
    stop                                          ; $79AD: $10 $00
    jr   jr_020_79C8                              ; $79AF: $18 $17

    db   $10                                      ; $79B1: $10
    ld   [$171A], sp                              ; $79B2: $08 $1A $17
    db   $10                                      ; $79B5: $10
    db   $10                                      ; $79B6: $10
    inc  e                                        ; $79B7: $1C
    rla                                           ; $79B8: $17
    db   $10                                      ; $79B9: $10

jr_020_79BA:
    jr   jr_020_79D8                              ; $79BA: $18 $1C

jr_020_79BC:
    scf                                           ; $79BC: $37
    db   $10                                      ; $79BD: $10

jr_020_79BE:
    jr   nz, jr_020_79DA                          ; $79BE: $20 $1A

    scf                                           ; $79C0: $37
    db   $10                                      ; $79C1: $10
    jr   z, jr_020_79DC                           ; $79C2: $28 $18

jr_020_79C4:
    scf                                           ; $79C4: $37
    jr   nz, jr_020_79D7                          ; $79C5: $20 $10

    ld   b, b                                     ; $79C7: $40

jr_020_79C8:
    rla                                           ; $79C8: $17
    jr   nz, @+$1A                                ; $79C9: $20 $18

    ld   d, b                                     ; $79CB: $50
    rla                                           ; $79CC: $17
    jr   nc, jr_020_79DF                          ; $79CD: $30 $10

    ld   b, b                                     ; $79CF: $40
    rla                                           ; $79D0: $17
    jr   nc, @+$1A                                ; $79D1: $30 $18

    ld   d, b                                     ; $79D3: $50
    rla                                           ; $79D4: $17
    ld   b, b                                     ; $79D5: $40
    db   $10                                      ; $79D6: $10

jr_020_79D7:
    ld   b, b                                     ; $79D7: $40

jr_020_79D8:
    rla                                           ; $79D8: $17
    ld   b, b                                     ; $79D9: $40

jr_020_79DA:
    jr   jr_020_7A2C                              ; $79DA: $18 $50

jr_020_79DC:
    rla                                           ; $79DC: $17
    ld   d, b                                     ; $79DD: $50
    db   $10                                      ; $79DE: $10

jr_020_79DF:
    ld   b, b                                     ; $79DF: $40
    rla                                           ; $79E0: $17
    ld   d, b                                     ; $79E1: $50
    jr   @+$52                                    ; $79E2: $18 $50

    rla                                           ; $79E4: $17
    ld   h, b                                     ; $79E5: $60
    db   $10                                      ; $79E6: $10
    ld   b, b                                     ; $79E7: $40
    rla                                           ; $79E8: $17
    ld   h, b                                     ; $79E9: $60
    jr   jr_020_7A3C                              ; $79EA: $18 $50

    rla                                           ; $79EC: $17
    ld   [hl], b                                  ; $79ED: $70
    db   $10                                      ; $79EE: $10
    ld   b, b                                     ; $79EF: $40
    rla                                           ; $79F0: $17
    ld   [hl], b                                  ; $79F1: $70
    jr   jr_020_7A44                              ; $79F2: $18 $50

    rla                                           ; $79F4: $17
    add  b                                        ; $79F5: $80
    db   $10                                      ; $79F6: $10
    ld   b, b                                     ; $79F7: $40
    rla                                           ; $79F8: $17
    add  b                                        ; $79F9: $80
    jr   jr_020_7A4C                              ; $79FA: $18 $50

    rla                                           ; $79FC: $17
    sub  b                                        ; $79FD: $90
    db   $10                                      ; $79FE: $10
    ld   b, b                                     ; $79FF: $40
    rla                                           ; $7A00: $17
    sub  b                                        ; $7A01: $90
    jr   jr_020_7A54                              ; $7A02: $18 $50

    rla                                           ; $7A04: $17
    and  b                                        ; $7A05: $A0
    db   $10                                      ; $7A06: $10
    ld   b, b                                     ; $7A07: $40
    rla                                           ; $7A08: $17
    and  b                                        ; $7A09: $A0
    jr   jr_020_7A5C                              ; $7A0A: $18 $50

    rla                                           ; $7A0C: $17
    or   b                                        ; $7A0D: $B0
    db   $10                                      ; $7A0E: $10
    ld   b, b                                     ; $7A0F: $40
    rla                                           ; $7A10: $17
    or   b                                        ; $7A11: $B0
    jr   jr_020_7A64                              ; $7A12: $18 $50

    rla                                           ; $7A14: $17
    nop                                           ; $7A15: $00
    nop                                           ; $7A16: $00
    ld   [hl+], a                                 ; $7A17: $22
    rla                                           ; $7A18: $17
    nop                                           ; $7A19: $00
    ld   [$1724], sp                              ; $7A1A: $08 $24 $17
    nop                                           ; $7A1D: $00
    db   $10                                      ; $7A1E: $10
    ld   h, $17                                   ; $7A1F: $26 $17
    nop                                           ; $7A21: $00
    jr   @+$28                                    ; $7A22: $18 $26

    scf                                           ; $7A24: $37
    nop                                           ; $7A25: $00
    jr   nz, jr_020_7A4C                          ; $7A26: $20 $24

    scf                                           ; $7A28: $37
    nop                                           ; $7A29: $00
    jr   z, @+$24                                 ; $7A2A: $28 $22

jr_020_7A2C:
    scf                                           ; $7A2C: $37
    stop                                          ; $7A2D: $10 $00
    jr   z, jr_020_7A48                           ; $7A2F: $28 $17

    db   $10                                      ; $7A31: $10
    ld   [$172A], sp                              ; $7A32: $08 $2A $17
    db   $10                                      ; $7A35: $10
    db   $10                                      ; $7A36: $10
    inc  l                                        ; $7A37: $2C
    rla                                           ; $7A38: $17
    db   $10                                      ; $7A39: $10
    jr   jr_020_7A68                              ; $7A3A: $18 $2C

jr_020_7A3C:
    scf                                           ; $7A3C: $37
    db   $10                                      ; $7A3D: $10
    jr   nz, jr_020_7A6A                          ; $7A3E: $20 $2A

    scf                                           ; $7A40: $37
    db   $10                                      ; $7A41: $10
    jr   z, jr_020_7A6C                           ; $7A42: $28 $28

jr_020_7A44:
    scf                                           ; $7A44: $37
    jr   nz, jr_020_7A57                          ; $7A45: $20 $10

    ld   h, b                                     ; $7A47: $60

jr_020_7A48:
    rla                                           ; $7A48: $17
    jr   nz, @+$1A                                ; $7A49: $20 $18

    ld   [hl], b                                  ; $7A4B: $70

jr_020_7A4C:
    rla                                           ; $7A4C: $17
    jr   nc, jr_020_7A5F                          ; $7A4D: $30 $10

    ld   h, b                                     ; $7A4F: $60
    rla                                           ; $7A50: $17
    jr   nc, @+$1A                                ; $7A51: $30 $18

    ld   [hl], b                                  ; $7A53: $70

jr_020_7A54:
    rla                                           ; $7A54: $17
    ld   b, b                                     ; $7A55: $40
    db   $10                                      ; $7A56: $10

jr_020_7A57:
    ld   h, b                                     ; $7A57: $60
    rla                                           ; $7A58: $17
    ld   b, b                                     ; $7A59: $40
    jr   jr_020_7ACC                              ; $7A5A: $18 $70

jr_020_7A5C:
    rla                                           ; $7A5C: $17
    ld   d, b                                     ; $7A5D: $50
    db   $10                                      ; $7A5E: $10

jr_020_7A5F:
    ld   h, b                                     ; $7A5F: $60
    rla                                           ; $7A60: $17
    ld   d, b                                     ; $7A61: $50
    jr   jr_020_7AD4                              ; $7A62: $18 $70

jr_020_7A64:
    rla                                           ; $7A64: $17
    ld   h, b                                     ; $7A65: $60
    db   $10                                      ; $7A66: $10
    ld   h, b                                     ; $7A67: $60

jr_020_7A68:
    rla                                           ; $7A68: $17
    ld   h, b                                     ; $7A69: $60

jr_020_7A6A:
    jr   jr_020_7ADC                              ; $7A6A: $18 $70

jr_020_7A6C:
    rla                                           ; $7A6C: $17
    ld   [hl], b                                  ; $7A6D: $70
    db   $10                                      ; $7A6E: $10
    ld   h, b                                     ; $7A6F: $60
    rla                                           ; $7A70: $17
    ld   [hl], b                                  ; $7A71: $70
    jr   jr_020_7AE4                              ; $7A72: $18 $70

    rla                                           ; $7A74: $17
    add  b                                        ; $7A75: $80
    db   $10                                      ; $7A76: $10
    ld   h, b                                     ; $7A77: $60
    rla                                           ; $7A78: $17
    add  b                                        ; $7A79: $80
    jr   jr_020_7AEC                              ; $7A7A: $18 $70

    rla                                           ; $7A7C: $17
    sub  b                                        ; $7A7D: $90
    db   $10                                      ; $7A7E: $10
    ld   h, b                                     ; $7A7F: $60
    rla                                           ; $7A80: $17
    sub  b                                        ; $7A81: $90
    jr   jr_020_7AF4                              ; $7A82: $18 $70

    rla                                           ; $7A84: $17
    and  b                                        ; $7A85: $A0
    db   $10                                      ; $7A86: $10
    ld   h, b                                     ; $7A87: $60
    rla                                           ; $7A88: $17
    and  b                                        ; $7A89: $A0
    jr   jr_020_7AFC                              ; $7A8A: $18 $70

    rla                                           ; $7A8C: $17
    or   b                                        ; $7A8D: $B0
    db   $10                                      ; $7A8E: $10
    ld   h, b                                     ; $7A8F: $60
    rla                                           ; $7A90: $17
    or   b                                        ; $7A91: $B0
    jr   jr_020_7B04                              ; $7A92: $18 $70

    rla                                           ; $7A94: $17
    nop                                           ; $7A95: $00
    nop                                           ; $7A96: $00
    ld   [hl-], a                                 ; $7A97: $32
    rla                                           ; $7A98: $17
    nop                                           ; $7A99: $00
    ld   [$1734], sp                              ; $7A9A: $08 $34 $17
    nop                                           ; $7A9D: $00
    db   $10                                      ; $7A9E: $10
    ld   [hl], $17                                ; $7A9F: $36 $17
    nop                                           ; $7AA1: $00
    jr   jr_020_7ADA                              ; $7AA2: $18 $36

    scf                                           ; $7AA4: $37
    nop                                           ; $7AA5: $00
    jr   nz, jr_020_7ADC                          ; $7AA6: $20 $34

    scf                                           ; $7AA8: $37
    nop                                           ; $7AA9: $00
    jr   z, jr_020_7ADE                           ; $7AAA: $28 $32

    scf                                           ; $7AAC: $37
    stop                                          ; $7AAD: $10 $00
    jr   c, jr_020_7AC8                           ; $7AAF: $38 $17

    db   $10                                      ; $7AB1: $10
    ld   [$173A], sp                              ; $7AB2: $08 $3A $17
    db   $10                                      ; $7AB5: $10
    db   $10                                      ; $7AB6: $10
    inc  a                                        ; $7AB7: $3C
    rla                                           ; $7AB8: $17
    db   $10                                      ; $7AB9: $10
    jr   jr_020_7AF8                              ; $7ABA: $18 $3C

    scf                                           ; $7ABC: $37
    db   $10                                      ; $7ABD: $10
    jr   nz, jr_020_7AFA                          ; $7ABE: $20 $3A

    scf                                           ; $7AC0: $37
    db   $10                                      ; $7AC1: $10
    jr   z, jr_020_7AFC                           ; $7AC2: $28 $38

    scf                                           ; $7AC4: $37
    jr   nz, jr_020_7AD7                          ; $7AC5: $20 $10

    ld   d, d                                     ; $7AC7: $52

jr_020_7AC8:
    rla                                           ; $7AC8: $17
    jr   nz, @+$1A                                ; $7AC9: $20 $18

    ld   h, d                                     ; $7ACB: $62

jr_020_7ACC:
    rla                                           ; $7ACC: $17
    jr   nc, jr_020_7ADF                          ; $7ACD: $30 $10

    ld   d, d                                     ; $7ACF: $52
    rla                                           ; $7AD0: $17
    jr   nc, @+$1A                                ; $7AD1: $30 $18

    ld   h, d                                     ; $7AD3: $62

jr_020_7AD4:
    rla                                           ; $7AD4: $17
    ld   b, b                                     ; $7AD5: $40
    db   $10                                      ; $7AD6: $10

jr_020_7AD7:
    ld   d, d                                     ; $7AD7: $52
    rla                                           ; $7AD8: $17
    ld   b, b                                     ; $7AD9: $40

jr_020_7ADA:
    jr   jr_020_7B3E                              ; $7ADA: $18 $62

jr_020_7ADC:
    rla                                           ; $7ADC: $17
    ld   d, b                                     ; $7ADD: $50

jr_020_7ADE:
    db   $10                                      ; $7ADE: $10

jr_020_7ADF:
    ld   d, d                                     ; $7ADF: $52
    rla                                           ; $7AE0: $17
    ld   d, b                                     ; $7AE1: $50
    jr   @+$64                                    ; $7AE2: $18 $62

jr_020_7AE4:
    rla                                           ; $7AE4: $17
    ld   h, b                                     ; $7AE5: $60
    db   $10                                      ; $7AE6: $10
    ld   d, d                                     ; $7AE7: $52
    rla                                           ; $7AE8: $17
    ld   h, b                                     ; $7AE9: $60
    jr   @+$64                                    ; $7AEA: $18 $62

jr_020_7AEC:
    rla                                           ; $7AEC: $17
    ld   [hl], b                                  ; $7AED: $70
    db   $10                                      ; $7AEE: $10
    ld   d, d                                     ; $7AEF: $52
    rla                                           ; $7AF0: $17
    ld   [hl], b                                  ; $7AF1: $70
    jr   jr_020_7B56                              ; $7AF2: $18 $62

jr_020_7AF4:
    rla                                           ; $7AF4: $17
    add  b                                        ; $7AF5: $80
    db   $10                                      ; $7AF6: $10
    ld   d, d                                     ; $7AF7: $52

jr_020_7AF8:
    rla                                           ; $7AF8: $17
    add  b                                        ; $7AF9: $80

jr_020_7AFA:
    jr   jr_020_7B5E                              ; $7AFA: $18 $62

jr_020_7AFC:
    rla                                           ; $7AFC: $17
    sub  b                                        ; $7AFD: $90
    db   $10                                      ; $7AFE: $10
    ld   d, d                                     ; $7AFF: $52
    rla                                           ; $7B00: $17
    sub  b                                        ; $7B01: $90
    jr   jr_020_7B66                              ; $7B02: $18 $62

jr_020_7B04:
    rla                                           ; $7B04: $17
    and  b                                        ; $7B05: $A0
    db   $10                                      ; $7B06: $10
    ld   d, d                                     ; $7B07: $52
    rla                                           ; $7B08: $17
    and  b                                        ; $7B09: $A0
    jr   jr_020_7B6E                              ; $7B0A: $18 $62

    rla                                           ; $7B0C: $17
    or   b                                        ; $7B0D: $B0
    db   $10                                      ; $7B0E: $10
    ld   d, d                                     ; $7B0F: $52
    rla                                           ; $7B10: $17
    or   b                                        ; $7B11: $B0
    jr   jr_020_7B76                              ; $7B12: $18 $62

    rla                                           ; $7B14: $17
    nop                                           ; $7B15: $00
    nop                                           ; $7B16: $00
    ld   b, d                                     ; $7B17: $42
    rla                                           ; $7B18: $17
    nop                                           ; $7B19: $00
    ld   [$1744], sp                              ; $7B1A: $08 $44 $17
    nop                                           ; $7B1D: $00
    db   $10                                      ; $7B1E: $10
    ld   b, [hl]                                  ; $7B1F: $46
    rla                                           ; $7B20: $17
    nop                                           ; $7B21: $00
    jr   jr_020_7B6A                              ; $7B22: $18 $46

jr_020_7B24:
    scf                                           ; $7B24: $37
    nop                                           ; $7B25: $00
    jr   nz, jr_020_7B6C                          ; $7B26: $20 $44

    scf                                           ; $7B28: $37
    nop                                           ; $7B29: $00
    jr   z, jr_020_7B6E                           ; $7B2A: $28 $42

    scf                                           ; $7B2C: $37
    stop                                          ; $7B2D: $10 $00
    ld   c, b                                     ; $7B2F: $48
    rla                                           ; $7B30: $17
    db   $10                                      ; $7B31: $10
    ld   [$174A], sp                              ; $7B32: $08 $4A $17
    db   $10                                      ; $7B35: $10
    db   $10                                      ; $7B36: $10
    ld   c, h                                     ; $7B37: $4C
    rla                                           ; $7B38: $17
    db   $10                                      ; $7B39: $10
    jr   jr_020_7B88                              ; $7B3A: $18 $4C

    scf                                           ; $7B3C: $37
    db   $10                                      ; $7B3D: $10

jr_020_7B3E:
    jr   nz, jr_020_7B8A                          ; $7B3E: $20 $4A

    scf                                           ; $7B40: $37
    db   $10                                      ; $7B41: $10
    jr   z, jr_020_7B4C                           ; $7B42: $28 $08

    scf                                           ; $7B44: $37
    jr   nz, jr_020_7B57                          ; $7B45: $20 $10

    ld   d, [hl]                                  ; $7B47: $56
    rla                                           ; $7B48: $17
    jr   nz, @+$1A                                ; $7B49: $20 $18

    ld   h, [hl]                                  ; $7B4B: $66

jr_020_7B4C:
    rla                                           ; $7B4C: $17
    jr   nc, jr_020_7B5F                          ; $7B4D: $30 $10

    ld   d, [hl]                                  ; $7B4F: $56
    rla                                           ; $7B50: $17
    jr   nc, @+$1A                                ; $7B51: $30 $18

    ld   h, [hl]                                  ; $7B53: $66
    rla                                           ; $7B54: $17
    ld   b, b                                     ; $7B55: $40

jr_020_7B56:
    db   $10                                      ; $7B56: $10

jr_020_7B57:
    ld   d, [hl]                                  ; $7B57: $56
    rla                                           ; $7B58: $17
    ld   b, b                                     ; $7B59: $40
    jr   jr_020_7BC2                              ; $7B5A: $18 $66

    rla                                           ; $7B5C: $17
    ld   d, b                                     ; $7B5D: $50

jr_020_7B5E:
    db   $10                                      ; $7B5E: $10

jr_020_7B5F:
    ld   d, [hl]                                  ; $7B5F: $56
    rla                                           ; $7B60: $17
    ld   d, b                                     ; $7B61: $50
    jr   @+$68                                    ; $7B62: $18 $66

    rla                                           ; $7B64: $17
    ld   h, b                                     ; $7B65: $60

jr_020_7B66:
    db   $10                                      ; $7B66: $10
    ld   d, [hl]                                  ; $7B67: $56
    rla                                           ; $7B68: $17
    ld   h, b                                     ; $7B69: $60

jr_020_7B6A:
    jr   @+$68                                    ; $7B6A: $18 $66

jr_020_7B6C:
    rla                                           ; $7B6C: $17
    ld   [hl], b                                  ; $7B6D: $70

jr_020_7B6E:
    db   $10                                      ; $7B6E: $10
    ld   d, [hl]                                  ; $7B6F: $56
    rla                                           ; $7B70: $17
    ld   [hl], b                                  ; $7B71: $70
    jr   jr_020_7BDA                              ; $7B72: $18 $66

    rla                                           ; $7B74: $17
    add  b                                        ; $7B75: $80

jr_020_7B76:
    db   $10                                      ; $7B76: $10
    ld   d, [hl]                                  ; $7B77: $56
    rla                                           ; $7B78: $17
    add  b                                        ; $7B79: $80
    jr   jr_020_7BE2                              ; $7B7A: $18 $66

    rla                                           ; $7B7C: $17
    sub  b                                        ; $7B7D: $90
    db   $10                                      ; $7B7E: $10
    ld   d, [hl]                                  ; $7B7F: $56
    rla                                           ; $7B80: $17
    sub  b                                        ; $7B81: $90
    jr   @+$68                                    ; $7B82: $18 $66

    rla                                           ; $7B84: $17
    and  b                                        ; $7B85: $A0
    db   $10                                      ; $7B86: $10
    ld   d, [hl]                                  ; $7B87: $56

jr_020_7B88:
    rla                                           ; $7B88: $17
    and  b                                        ; $7B89: $A0

jr_020_7B8A:
    jr   @+$68                                    ; $7B8A: $18 $66

    rla                                           ; $7B8C: $17
    or   b                                        ; $7B8D: $B0
    db   $10                                      ; $7B8E: $10
    ld   d, [hl]                                  ; $7B8F: $56
    rla                                           ; $7B90: $17
    or   b                                        ; $7B91: $B0
    jr   jr_020_7BFA                              ; $7B92: $18 $66

    rla                                           ; $7B94: $17
    ld   [hl], b                                  ; $7B95: $70
    ld   l, b                                     ; $7B96: $68
    ld   h, b                                     ; $7B97: $60
    ld   e, b                                     ; $7B98: $58
    ld   d, b                                     ; $7B99: $50
    ld   c, b                                     ; $7B9A: $48
    ld   b, b                                     ; $7B9B: $40
    jr   c, jr_020_7BCE                           ; $7B9C: $38 $30

    jr   nc, @+$32                                ; $7B9E: $30 $30

    jr   nc, @+$32                                ; $7BA0: $30 $30

    jr   nc, jr_020_7B24                          ; $7BA2: $30 $80

    ld   a, b                                     ; $7BA4: $78
    push bc                                       ; $7BA5: $C5
    ldh  a, [wActiveEntityPosY]                   ; $7BA6: $F0 $EC
    swap a                                        ; $7BA8: $CB $37
    and  $0F                                      ; $7BAA: $E6 $0F
    ld   e, a                                     ; $7BAC: $5F
    ld   d, b                                     ; $7BAD: $50
    ld   hl, $7B95                                ; $7BAE: $21 $95 $7B
    add  hl, de                                   ; $7BB1: $19
    ld   b, [hl]                                  ; $7BB2: $46
    ld   hl, $7915                                ; $7BB3: $21 $15 $79
    ldh  a, [hActiveEntitySpriteVariant]               ; $7BB6: $F0 $F1
    cp   $05                                      ; $7BB8: $FE $05
    jr   z, jr_020_7BFC                           ; $7BBA: $28 $40

    and  a                                        ; $7BBC: $A7
    jr   z, jr_020_7BD4                           ; $7BBD: $28 $15

    ld   hl, $7995                                ; $7BBF: $21 $95 $79

jr_020_7BC2:
    dec  a                                        ; $7BC2: $3D
    jr   z, jr_020_7BD4                           ; $7BC3: $28 $0F

    ld   hl, $7A15                                ; $7BC5: $21 $15 $7A
    dec  a                                        ; $7BC8: $3D
    jr   z, jr_020_7BD4                           ; $7BC9: $28 $09

    ld   hl, $7A95                                ; $7BCB: $21 $95 $7A

jr_020_7BCE:
    dec  a                                        ; $7BCE: $3D
    jr   z, jr_020_7BD4                           ; $7BCF: $28 $03

    ld   hl, $7B15                                ; $7BD1: $21 $15 $7B

jr_020_7BD4:
    ld   de, $C00C                                ; $7BD4: $11 $0C $C0
    ld   c, $00                                   ; $7BD7: $0E $00

jr_020_7BD9:
    ld   a, c                                     ; $7BD9: $79

jr_020_7BDA:
    and  $03                                      ; $7BDA: $E6 $03
    cp   $00                                      ; $7BDC: $FE $00
    jr   nz, jr_020_7BE4                          ; $7BDE: $20 $04

    ldh  a, [wActiveEntityPosY]                   ; $7BE0: $F0 $EC

jr_020_7BE2:
    jr   jr_020_7BF0                              ; $7BE2: $18 $0C

jr_020_7BE4:
    cp   $01                                      ; $7BE4: $FE $01
    jr   nz, jr_020_7BF3                          ; $7BE6: $20 $0B

    push hl                                       ; $7BE8: $E5
    ld   hl, wScreenShakeHorizontal               ; $7BE9: $21 $55 $C1
    ldh  a, [wActiveEntityPosX]                   ; $7BEC: $F0 $EE
    sub  [hl]                                     ; $7BEE: $96
    pop  hl                                       ; $7BEF: $E1

jr_020_7BF0:
    add  [hl]                                     ; $7BF0: $86
    jr   jr_020_7BF4                              ; $7BF1: $18 $01

jr_020_7BF3:
    ld   a, [hl]                                  ; $7BF3: $7E

jr_020_7BF4:
    ld   [de], a                                  ; $7BF4: $12
    inc  hl                                       ; $7BF5: $23
    inc  de                                       ; $7BF6: $13
    inc  c                                        ; $7BF7: $0C
    ld   a, c                                     ; $7BF8: $79
    cp   b                                        ; $7BF9: $B8

jr_020_7BFA:
    jr   nz, jr_020_7BD9                          ; $7BFA: $20 $DD

jr_020_7BFC:
    pop  bc                                       ; $7BFC: $C1
    ret                                           ; $7BFD: $C9

    ld   c, b                                     ; $7BFE: $48
    ld   [hl], c                                  ; $7BFF: $71
    ld   sp, LoadRoom.notColorDungeon             ; $7C00: $31 $56 $31
    ld   d, [hl]                                  ; $7C03: $56
    sbc  h                                        ; $7C04: $9C
    ld   [hl], e                                  ; $7C05: $73
    daa                                           ; $7C06: $27
    ld   h, l                                     ; $7C07: $65
    rst  $28                                      ; $7C08: $EF
    ld   c, l                                     ; $7C09: $4D
    rst  $28                                      ; $7C0A: $EF
    ld   c, l                                     ; $7C0B: $4D
    add  hl, sp                                   ; $7C0C: $39
    ld   h, a                                     ; $7C0D: $67
    ld   b, $69                                   ; $7C0E: $06 $69
    xor  l                                        ; $7C10: $AD
    ld   b, l                                     ; $7C11: $45
    xor  l                                        ; $7C12: $AD
    ld   b, l                                     ; $7C13: $45
    sub  $5A                                      ; $7C14: $D6 $5A
    push hl                                       ; $7C16: $E5
    ld   c, h                                     ; $7C17: $4C
    ld   l, e                                     ; $7C18: $6B
    dec  a                                        ; $7C19: $3D
    ld   l, e                                     ; $7C1A: $6B
    dec  a                                        ; $7C1B: $3D
    ld   [hl], e                                  ; $7C1C: $73
    ld   c, [hl]                                  ; $7C1D: $4E
    and  h                                        ; $7C1E: $A4
    inc  a                                        ; $7C1F: $3C
    add  hl, hl                                   ; $7C20: $29
    ld   sp, $3129                                ; $7C21: $31 $29 $31
    rst  $28                                      ; $7C24: $EF
    dec  a                                        ; $7C25: $3D
    ld   a, [$D00D]                               ; $7C26: $FA $0D $D0
    cp   $50                                      ; $7C29: $FE $50
    ret  nc                                       ; $7C2B: $D0

    ld   b, a                                     ; $7C2C: $47
    and  $0F                                      ; $7C2D: $E6 $0F
    ret  nz                                       ; $7C2F: $C0

    ld   a, b                                     ; $7C30: $78
    and  $F0                                      ; $7C31: $E6 $F0
    srl  a                                        ; $7C33: $CB $3F
    ld   c, a                                     ; $7C35: $4F
    ld   b, $00                                   ; $7C36: $06 $00
    push bc                                       ; $7C38: $C5
    ld   hl, $7BFE                                ; $7C39: $21 $FE $7B
    add  hl, bc                                   ; $7C3C: $09
    ld   bc, $0008                                ; $7C3D: $01 $08 $00
    ld   de, $DC10                                ; $7C40: $11 $10 $DC
    call CopyData                                 ; $7C43: $CD $14 $29
    pop  bc                                       ; $7C46: $C1
    ld   a, c                                     ; $7C47: $79
    cp   $20                                      ; $7C48: $FE $20
    jr   z, jr_020_7C50                           ; $7C4A: $28 $04

    ld   a, $04                                   ; $7C4C: $3E $04
    jr   jr_020_7C5B                              ; $7C4E: $18 $0B

jr_020_7C50:
    ld   hl, $DC48                                ; $7C50: $21 $48 $DC
    ld   a, $A4                                   ; $7C53: $3E $A4
    ld   [hl+], a                                 ; $7C55: $22
    ld   a, $3C                                   ; $7C56: $3E $3C
    ld   [hl], a                                  ; $7C58: $77
    ld   a, $20                                   ; $7C59: $3E $20

jr_020_7C5B:
    ld   [wPaletteUnknownD], a                    ; $7C5B: $EA $D4 $DD
    xor  a                                        ; $7C5E: $AF
    ld   [wPaletteUnknownC], a                    ; $7C5F: $EA $D3 $DD
    ld   a, $81                                   ; $7C62: $3E $81
    ld   [wPaletteDataFlags], a                    ; $7C64: $EA $D1 $DD
    ret                                           ; $7C67: $C9

    nop                                           ; $7C68: $00
    add  hl, de                                   ; $7C69: $19
    ld   e, e                                     ; $7C6A: $5B
    ld   b, $03                                   ; $7C6B: $06 $03
    db   $10                                      ; $7C6D: $10
    ld   e, d                                     ; $7C6E: $5A
    ld   b, $05                                   ; $7C6F: $06 $05
    ld   [$0659], sp                              ; $7C71: $08 $59 $06
    ld   [$EB20], sp                              ; $7C74: $08 $20 $EB
    dec  b                                        ; $7C77: $05
    nop                                           ; $7C78: $00
    jr   nz, @-$14                                ; $7C79: $20 $EA

    dec  b                                        ; $7C7B: $05
    ld   [$DF18], sp                              ; $7C7C: $08 $18 $DF
    dec  b                                        ; $7C7F: $05
    nop                                           ; $7C80: $00
    jr   @-$20                                    ; $7C81: $18 $DE

    dec  b                                        ; $7C83: $05
    ld   [$CF10], sp                              ; $7C84: $08 $10 $CF
    dec  b                                        ; $7C87: $05
    nop                                           ; $7C88: $00

jr_020_7C89:
    db   $10                                      ; $7C89: $10
    adc  $05                                      ; $7C8A: $CE $05
    ld   [wNameIndex], sp                         ; $7C8C: $08 $08 $C1
    dec  b                                        ; $7C8F: $05
    nop                                           ; $7C90: $00
    ld   [$05C0], sp                              ; $7C91: $08 $C0 $05
    stop                                          ; $7C94: $10 $00
    ld   e, l                                     ; $7C96: $5D
    dec  b                                        ; $7C97: $05
    ld   [$5C00], sp                              ; $7C98: $08 $00 $5C
    dec  b                                        ; $7C9B: $05
    ld   [$EB20], sp                              ; $7C9C: $08 $20 $EB
    dec  b                                        ; $7C9F: $05
    nop                                           ; $7CA0: $00
    jr   nz, @-$14                                ; $7CA1: $20 $EA

    dec  b                                        ; $7CA3: $05
    ld   [$DF18], sp                              ; $7CA4: $08 $18 $DF
    dec  b                                        ; $7CA7: $05
    nop                                           ; $7CA8: $00
    jr   jr_020_7C89                              ; $7CA9: $18 $DE

    dec  b                                        ; $7CAB: $05
    ld   [$CF10], sp                              ; $7CAC: $08 $10 $CF
    dec  b                                        ; $7CAF: $05
    nop                                           ; $7CB0: $00

jr_020_7CB1:
    db   $10                                      ; $7CB1: $10
    adc  $05                                      ; $7CB2: $CE $05
    ld   [wNameIndex], sp                         ; $7CB4: $08 $08 $C1
    dec  b                                        ; $7CB7: $05
    nop                                           ; $7CB8: $00
    ld   [$05C0], sp                              ; $7CB9: $08 $C0 $05
    stop                                          ; $7CBC: $10 $00
    ld   e, a                                     ; $7CBE: $5F
    dec  b                                        ; $7CBF: $05
    ld   [$5E00], sp                              ; $7CC0: $08 $00 $5E
    dec  b                                        ; $7CC3: $05
    ld   [$EB20], sp                              ; $7CC4: $08 $20 $EB
    dec  b                                        ; $7CC7: $05
    nop                                           ; $7CC8: $00
    jr   nz, @-$14                                ; $7CC9: $20 $EA

    dec  b                                        ; $7CCB: $05
    ld   [$DF18], sp                              ; $7CCC: $08 $18 $DF
    dec  b                                        ; $7CCF: $05
    nop                                           ; $7CD0: $00
    jr   jr_020_7CB1                              ; $7CD1: $18 $DE

    dec  b                                        ; $7CD3: $05
    ld   [$CF10], sp                              ; $7CD4: $08 $10 $CF
    dec  b                                        ; $7CD7: $05
    nop                                           ; $7CD8: $00

jr_020_7CD9:
    db   $10                                      ; $7CD9: $10
    adc  $05                                      ; $7CDA: $CE $05
    ld   [$D108], sp                              ; $7CDC: $08 $08 $D1
    dec  b                                        ; $7CDF: $05
    nop                                           ; $7CE0: $00
    ld   [$05D0], sp                              ; $7CE1: $08 $D0 $05
    stop                                          ; $7CE4: $10 $00
    db   $ed                                      ; $7CE6: $ED
    dec  b                                        ; $7CE7: $05
    ld   [$EC00], sp                              ; $7CE8: $08 $00 $EC
    dec  b                                        ; $7CEB: $05
    ld   [$EB20], sp                              ; $7CEC: $08 $20 $EB
    dec  b                                        ; $7CEF: $05
    nop                                           ; $7CF0: $00
    jr   nz, @-$14                                ; $7CF1: $20 $EA

    dec  b                                        ; $7CF3: $05
    ld   [$DF18], sp                              ; $7CF4: $08 $18 $DF
    dec  b                                        ; $7CF7: $05
    nop                                           ; $7CF8: $00
    jr   jr_020_7CD9                              ; $7CF9: $18 $DE

    dec  b                                        ; $7CFB: $05
    ld   [$CF10], sp                              ; $7CFC: $08 $10 $CF
    dec  b                                        ; $7CFF: $05
    nop                                           ; $7D00: $00
    db   $10                                      ; $7D01: $10
    adc  $05                                      ; $7D02: $CE $05
    ld   [$D108], sp                              ; $7D04: $08 $08 $D1
    dec  b                                        ; $7D07: $05
    nop                                           ; $7D08: $00
    ld   [$05D0], sp                              ; $7D09: $08 $D0 $05
    stop                                          ; $7D0C: $10 $00
    rst  $28                                      ; $7D0E: $EF
    dec  b                                        ; $7D0F: $05
    ld   [$EE00], sp                              ; $7D10: $08 $00 $EE
    dec  b                                        ; $7D13: $05
    ld   [hl], h                                  ; $7D14: $74
    ld   a, h                                     ; $7D15: $7C
    sbc  h                                        ; $7D16: $9C
    ld   a, h                                     ; $7D17: $7C
    call nz, $EC7C                                ; $7D18: $C4 $7C $EC
    ld   a, h                                     ; $7D1B: $7C
    ld   a, $6C                                   ; $7D1C: $3E $6C
    ld   [$C3C0], a                               ; $7D1E: $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ; $7D21: $F0 $E7
    and  $60                                      ; $7D23: $E6 $60
    swap a                                        ; $7D25: $CB $37
    ld   e, a                                     ; $7D27: $5F
    ld   d, $00                                   ; $7D28: $16 $00
    ld   hl, $7D14                                ; $7D2A: $21 $14 $7D
    add  hl, de                                   ; $7D2D: $19
    ld   a, [hl+]                                 ; $7D2E: $2A
    ld   d, a                                     ; $7D2F: $57
    ld   h, [hl]                                  ; $7D30: $66
    ld   l, d                                     ; $7D31: $6A
    ld   c, $28                                   ; $7D32: $0E $28
    call Func_020_7D40                            ; $7D34: $CD $40 $7D
    ld   hl, $7C68                                ; $7D37: $21 $68 $7C
    ld   c, $0C                                   ; $7D3A: $0E $0C
    call Func_020_7D40                            ; $7D3C: $CD $40 $7D
    ret                                           ; $7D3F: $C9

Func_020_7D40:
    push bc                                       ; $7D40: $C5
    push hl                                       ; $7D41: $E5
    ld   a, [$C3C0]                               ; $7D42: $FA $C0 $C3
    ld   e, a                                     ; $7D45: $5F
    ld   d, $00                                   ; $7D46: $16 $00
    ld   hl, wOAMBuffer                           ; $7D48: $21 $00 $C0
    add  hl, de                                   ; $7D4B: $19
    ld   d, h                                     ; $7D4C: $54
    ld   e, l                                     ; $7D4D: $5D
    pop  hl                                       ; $7D4E: $E1
    ld   a, c                                     ; $7D4F: $79
    srl  a                                        ; $7D50: $CB $3F
    srl  a                                        ; $7D52: $CB $3F
    ld   c, a                                     ; $7D54: $4F

jr_020_7D55:
    ldh  a, [wActiveEntityPosY]                   ; $7D55: $F0 $EC
    add  [hl]                                     ; $7D57: $86
    ld   [de], a                                  ; $7D58: $12
    inc  de                                       ; $7D59: $13
    inc  hl                                       ; $7D5A: $23
    ldh  a, [wActiveEntityPosX]                   ; $7D5B: $F0 $EE
    add  [hl]                                     ; $7D5D: $86
    ld   [de], a                                  ; $7D5E: $12
    inc  de                                       ; $7D5F: $13
    inc  hl                                       ; $7D60: $23
    ld   a, [hl+]                                 ; $7D61: $2A
    ld   [de], a                                  ; $7D62: $12
    inc  de                                       ; $7D63: $13
    ld   a, [hl+]                                 ; $7D64: $2A
    ld   [de], a                                  ; $7D65: $12
    inc  de                                       ; $7D66: $13
    dec  c                                        ; $7D67: $0D
    jr   nz, jr_020_7D55                          ; $7D68: $20 $EB

    pop  bc                                       ; $7D6A: $C1
    ld   a, [$C3C0]                               ; $7D6B: $FA $C0 $C3
    add  c                                        ; $7D6E: $81
    cp   $A0                                      ; $7D6F: $FE $A0
    jr   c, jr_020_7D74                           ; $7D71: $38 $01

    xor  a                                        ; $7D73: $AF

jr_020_7D74:
    ld   [$C3C0], a                               ; $7D74: $EA $C0 $C3
    ld   a, [wLinkWalkingFrameCount]              ; $7D77: $FA $23 $C1
    ld   c, a                                     ; $7D7A: $4F
    ret                                           ; $7D7B: $C9

    ld   a, $03                                   ; $7D7C: $3E $03
    ldh  [$FFE4], a                               ; $7D7E: $E0 $E4
    ld   a, $06                                   ; $7D80: $3E $06
    ldh  [$FFE5], a                               ; $7D82: $E0 $E5
    ld   a, $0C                                   ; $7D84: $3E $0C
    ldh  [hFreeWarpDataAddress], a                ; $7D86: $E0 $E6
    ld   hl, $DC10                                ; $7D88: $21 $10 $DC
    ld   d, $24                                   ; $7D8B: $16 $24
    call Func_020_7D97                            ; $7D8D: $CD $97 $7D
    ld   a, $01                                   ; $7D90: $3E $01
    ld   [wPaletteDataFlags], a                    ; $7D92: $EA $D1 $DD
    xor  a                                        ; $7D95: $AF
    ret                                           ; $7D96: $C9

Func_020_7D97:
jr_020_7D97:
    push hl                                       ; $7D97: $E5
    ldh  a, [$FFE4]                               ; $7D98: $F0 $E4
    ld   c, a                                     ; $7D9A: $4F
    ld   a, [hl]                                  ; $7D9B: $7E
    and  $1F                                      ; $7D9C: $E6 $1F
    jr   z, jr_020_7DA4                           ; $7D9E: $28 $04

    sub  c                                        ; $7DA0: $91
    jr   nc, jr_020_7DA4                          ; $7DA1: $30 $01

    xor  a                                        ; $7DA3: $AF

jr_020_7DA4:
    ldh  [hScratch0], a                           ; $7DA4: $E0 $D7
    ldh  a, [$FFE5]                               ; $7DA6: $F0 $E5
    ld   c, a                                     ; $7DA8: $4F
    ld   a, [hl+]                                 ; $7DA9: $2A
    and  $E0                                      ; $7DAA: $E6 $E0
    swap a                                        ; $7DAC: $CB $37
    ld   b, a                                     ; $7DAE: $47
    ld   a, [hl]                                  ; $7DAF: $7E
    and  $03                                      ; $7DB0: $E6 $03
    swap a                                        ; $7DB2: $CB $37
    or   b                                        ; $7DB4: $B0
    and  $3E                                      ; $7DB5: $E6 $3E
    jr   z, jr_020_7DBD                           ; $7DB7: $28 $04

    sub  c                                        ; $7DB9: $91
    jr   nc, jr_020_7DBD                          ; $7DBA: $30 $01

    xor  a                                        ; $7DBC: $AF

jr_020_7DBD:
    ldh  [hScratch1], a                           ; $7DBD: $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ; $7DBF: $F0 $E6
    ld   c, a                                     ; $7DC1: $4F
    ld   a, [hl]                                  ; $7DC2: $7E
    and  $7C                                      ; $7DC3: $E6 $7C
    jr   z, jr_020_7DCB                           ; $7DC5: $28 $04

    sub  c                                        ; $7DC7: $91
    jr   nc, jr_020_7DCB                          ; $7DC8: $30 $01

    xor  a                                        ; $7DCA: $AF

jr_020_7DCB:
    ldh  [hScratch2], a                           ; $7DCB: $E0 $D9
    pop  hl                                       ; $7DCD: $E1
    ldh  a, [hScratch0]                           ; $7DCE: $F0 $D7
    ld   b, a                                     ; $7DD0: $47
    ldh  a, [hScratch1]                           ; $7DD1: $F0 $D8
    swap a                                        ; $7DD3: $CB $37
    ld   c, a                                     ; $7DD5: $4F
    and  $E0                                      ; $7DD6: $E6 $E0
    or   b                                        ; $7DD8: $B0
    ld   [hl+], a                                 ; $7DD9: $22
    ldh  a, [hScratch2]                           ; $7DDA: $F0 $D9
    ld   b, a                                     ; $7DDC: $47
    ld   a, c                                     ; $7DDD: $79
    and  $03                                      ; $7DDE: $E6 $03
    or   b                                        ; $7DE0: $B0
    ld   [hl+], a                                 ; $7DE1: $22
    dec  d                                        ; $7DE2: $15
    jr   nz, jr_020_7D97                          ; $7DE3: $20 $B2

    ret                                           ; $7DE5: $C9

LoadTilemap23::
    ld   c, $10                                   ; $7DE6: $0E $10
    ld   b, $68                                   ; $7DE8: $06 $68
    ld   a, $38                                   ; $7DEA: $3E $38
    ld   h, $20                                   ; $7DEC: $26 $20
    call Copy100BytesFromBankAtA                  ; $7DEE: $CD $13 $0A
    ld   c, $11                                   ; $7DF1: $0E $11
    ld   b, $69                                   ; $7DF3: $06 $69
    ld   a, $38                                   ; $7DF5: $3E $38
    ld   h, $20                                   ; $7DF7: $26 $20
    call Copy100BytesFromBankAtA                  ; $7DF9: $CD $13 $0A
    ld   c, $12                                   ; $7DFC: $0E $12
    ld   b, $6A                                   ; $7DFE: $06 $6A
    ld   a, $38                                   ; $7E00: $3E $38
    ld   h, $20                                   ; $7E02: $26 $20
    call Copy100BytesFromBankAtA                  ; $7E04: $CD $13 $0A
    ret                                           ; $7E07: $C9
