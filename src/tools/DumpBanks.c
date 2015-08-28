#include <stdio.h>
#include <stdint.h>

#define BANK_SIZE 0x4000

void
WriteBankFile(char *FileName, uint8_t *Data)
{
    FILE *f;

    if (f = fopen(FileName, "wb"))
    {
        fwrite(Data, 1, BANK_SIZE, f);
        fflush(f);
        fclose(f);
    }
}

int
main(int argc, char **argv)
{
    FILE *f;
    
    if (f = fopen(argv[1], "rb"))
    {
        uint8_t Header[0x150];
        fread(Header, 1, 0x150, f);

        if (memcmp(Header + 0x134, "ZELDA", 5) == 0)
        {
            for (int32_t BankNum = 0; BankNum <= 0x3C; ++BankNum)
            {
                uint8_t BankData[BANK_SIZE];
                char FileName[512];

                fseek(f, BankNum * BANK_SIZE, SEEK_SET);
                fread(BankData, 1, BANK_SIZE, f);
                
                sprintf(FileName, "bank_%02X_%X.bin", BankNum, BankNum * BANK_SIZE);
                WriteBankFile(FileName, BankData);
            }
        }
    }

    return 0;
}

