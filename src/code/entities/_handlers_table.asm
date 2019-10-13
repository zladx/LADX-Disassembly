;
; Pointers table to entity handlers
;

; First 2 bytes: memory address; third byte: bank id
entity_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
endm

; Table of entities handlers
; See ENTITY_* constants for values
;
; TODO: convert the remaining raw addresses to labels
EntityPointersTable::
._00 entity_pointer ArrowEntityHandler
._01 entity_pointer BoomerangEntityHandler
._02 entity_pointer BombEntityHandler
._03 entity_pointer HookshotChainEntityHandler
._04 entity_pointer HookshotHitEntityHandler
._05 entity_pointer LiftableRockEntityHandler
._06 entity_pointer PushedBlockEntityHandler
._07 entity_pointer ChestWithItemEntityHandler
._08 db $66, $79, $18 ; entity_pointer Entity08Handler
._09 entity_pointer OctorockEntityHandler
._0A entity_pointer OctorockRockEntityHandler
._0B entity_pointer MoblinEntityHandler
._0C entity_pointer MoblinArrowEntityHandler
._0D db $C7, $78, $06 ; entity_pointer Entity0DHandler
._0E db $F5, $7E, $04 ; entity_pointer Entity0EHandler
._0F db $4E, $74, $06 ; entity_pointer Entity0FHandler
._10 db $0D, $5C, $04 ; entity_pointer Entity10Handler
._11 db $08, $5C, $04 ; entity_pointer Entity11Handler
._12 db $0D, $5C, $04 ; entity_pointer Entity12Handler
._13 entity_pointer HeartContainerTilesTable
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
._24 entity_pointer IronMaskEntityHandler ; $24
._25 entity_pointer EntityDestructionData ; small exploding ennemy
._26 entity_pointer EntityDestructionData ; small exploding ennemy 2
._27 db $10, $75, $06 ; entity_pointer Entity27Handler
._28 db $AF, $6A, $19 ; entity_pointer Entity28Handler ; $28
._29 db $95, $5A, $04 ; entity_pointer Entity29Handler
._2A db $61, $6C, $04 ; entity_pointer Entity2AHandler
._2B db $D6, $75, $15 ; entity_pointer Entity2BHandler
._2C db $A4, $77, $07 ; entity_pointer Entity2CHandler ; $2C
._2D entity_pointer DroppableHeartEntityHandler
._2E entity_pointer DroppableRupeeEntityHandler
._2F entity_pointer DroppableFairyEntityHandler
._30 entity_pointer KeyDropPointEntityHandler ; $30
._31 entity_pointer SwordEntityHandler
._32 entity_pointer Entity32Handler
._33 entity_pointer PieceOfPowerEntityHandler
._34 entity_pointer GuardianAcornEntityHandler ; $34
._35 entity_pointer HeartPieceEntityHandler
._36 entity_pointer HeartContainerEntityHandler
._37 entity_pointer DroppableArrowsEntityHandler
._38 entity_pointer DroppableBombsEntityHandler ; $38
._39 entity_pointer SirensInstrumentEntityHandler
._3A entity_pointer SleepyToadstoolEntityHandler
._3B entity_pointer DroppableMagicPowderEntityHandler
._3C entity_pointer HidingSlimeKeyEntityHandler ; $3C
._3D entity_pointer DroppableSeashellEntityHandler
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
._4B entity_pointer PotEntityHandler
._4C db $00, $00, $00 ; disabled
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
.overflow db $6B, $62, $C9
