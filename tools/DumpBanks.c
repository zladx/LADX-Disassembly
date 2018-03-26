// Dump the raw binary data of a bank
//
// DEPRECATED: instead of usign raw binary data for the
// not-yet-disassembled parts, this project now uses rgblink
// with the -O option to specify the original ROM as an overlay file.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define BANK_SIZE 0x4000

void
WriteBankFile(char *FileName, uint8_t *Data) {
    FILE *f = fopen(FileName, "wb");
    if (f) {
        fwrite(Data, 1, BANK_SIZE, f);
        fflush(f);
        fclose(f);
    }
}

int
main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: DumpBanks <filename.gbc>");
        return 1;
    }

    FILE *f = fopen(argv[1], "rb");

    if (!f) {
        printf("Error: file not found (%s)", argv[1]);
        return 1;
    }

    uint8_t Header[0x150];
    fread(Header, 1, 0x150, f);

    if (memcmp(Header + 0x134, "ZELDA", 5) != 0) {
        printf("Error: ROM header is not 'ZELDA'");
        return 1;
    }

    for (int32_t BankNum = 0; BankNum <= 0x3D; ++BankNum) {
        uint8_t BankData[BANK_SIZE];
        char FileName[512];

        fseek(f, BankNum * BANK_SIZE, SEEK_SET);
        fread(BankData, 1, BANK_SIZE, f);

        sprintf(FileName, "bank_%02X_%X.bin", BankNum, BankNum * BANK_SIZE);
        WriteBankFile(FileName, BankData);
    }
    
    return 0;
}
