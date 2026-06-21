#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <time.h>
#include "rs232.h"

#define COMPORT 4 // = COM5
#define MAX_ITERATIONS 10

#define n 31
#define p ((1U << n) - 1)
#define RedModMersenneA(a) ((a & p) + (a >> n))
#define RedModMersenneS(a) ((a & p) - (a >> n))
#define AddModMersenne(a, b) RedModMersenneA((a + b))
#define SubModMersenne(a, b) RedModMersenneS((a - b))
#define MulModMersenne(a, b) RedModMersenneA(RedModMersenneA((a * b)))
#define SquAddModMersenne(a, b) RedModMersenneA(RedModMersenneA((a * a + b)))
#define SquAddAddModMersenne(a, b, c) RedModMersenneA(RedModMersenneA((a * a + b + c)))
#define rounds_per_step 4
#define steps 14

void Encrypt(const uint32_t *plaintext, const uint32_t* key, uint32_t *ciphertext);
int TestFixedKeyEncryptions();
int BruteForcePUFKeyEncryptions(uint32_t* pufkey);
int TestPUFKeyEncryptions(const uint32_t* pufkey);

int main()
{
    srand(time(NULL));

    // Testing encryptions under fixed key
    if(TestFixedKeyEncryptions() < 0) return -1;

    // Brute forcing the PUF key
    uint32_t pufkey[4];
    if(BruteForcePUFKeyEncryptions(pufkey) < 0) return -1;

    // Testing encryptions under PUF key
    if(TestPUFKeyEncryptions(pufkey) < 0) return -1;

    return 0;
}

void Encrypt(const uint32_t *plaintext, const uint32_t* key, uint32_t *ciphertext)
{
	uint64_t pi = 0xC90FDAA22168C234;

	uint32_t state[4];
	for(int i=0; i<4; i++) state[i] = plaintext[i];

	// Steps
	for(int step=0; step<steps; step++)
	{
		// Add tweakey
		for(int i=0; i<4; i++) state[i] = AddModMersenne(state[i], key[i]);

		// Multiple rounds per step
		for(int round=0; round<rounds_per_step; round++)
		{
			// Round constants
			uint32_t c0 = pi & p;
			uint32_t c1 = (pi >> 32) & p;
			pi = (pi << 1) + (pi >> 63);

			// Apply F function + Feistel
			uint32_t sq1_in = AddModMersenne(state[1], c0);
			uint32_t mds_in = SquAddModMersenne((uint64_t)sq1_in, state[0]);
			uint32_t mds_out = AddModMersenne(sq1_in, mds_in);
			uint32_t f_out0 = AddModMersenne(mds_out, c1);
			uint32_t f_out1 = SquAddAddModMersenne((uint64_t)f_out0, mds_out, mds_in);
			uint32_t swap0 = AddModMersenne(state[2], f_out0);
			uint32_t swap1 = AddModMersenne(state[3], f_out1);
			state[2] = state[0];
			state[3] = state[1];
			state[0] = swap0;
			state[1] = swap1;
		}
	}

	// Final tweakey addition
	for(int i=0; i<4; i++) ciphertext[i] = AddModMersenne(state[i], key[i]);
}

int TestFixedKeyEncryptions()
{
    printf("Test %d encryptions with random plaintexts and seeds under fixed key:\n", MAX_ITERATIONS);

    const char comm_mode[] = {'8', 'N', '1', 0};
	unsigned char command[36] = {0};
	unsigned char ReceiveBuffer[16] = {0};
    uint32_t keyshares[8] = {0x712A13CD, 0x7F5CC6C3, 0x47C8D433, 0x388096E7, 0x5D7DD64D, 0x0C5A6A61, 0x652CED1B, 0x5AEF1762};
    uint32_t ipmcoeffs[2] = {0x7F65F6A6, 0x5A22919C};

    // Open serial port
    if (RS232_OpenComport(COMPORT, 9600, comm_mode, 0))
    {
        printf("Unable to open serial port.\n");
        return -1;
    }

    unsigned int count_bad = 0;
    for(int iterations=0; iterations<MAX_ITERATIONS; iterations++)
    {
        // Update command with fresh plaintext and seed
        command[0] = rand() & 0xF;
        for(int i=1; i<sizeof(command)/sizeof(command[0]); i++)
        {
            command[i] = rand() & 0xFF;
        }

        // Send command
        int sent_bytes = RS232_SendBuf(COMPORT, command, sizeof(command)/sizeof(command[0]));
        if (sent_bytes != (sizeof(command)/sizeof(command[0])))
        {
            printf("Unable to sent to serial port.\n");
            RS232_CloseComport(COMPORT);
            return -1;
        }

        // Send 0-byte to signal end of command
        Sleep(100);
        RS232_SendByte(COMPORT, 0x00);
        Sleep(100);

        // Receive output
        int received_bytes = RS232_PollComport(COMPORT, ReceiveBuffer, 16);
        if (received_bytes != 16)
        {
            printf("Unable to receive response.\n");
            RS232_CloseComport(COMPORT);
            return -1;
        }

        // Convert plaintext to 4x31-bit word representation
        uint32_t plaintext[4], key[4], ciphertext[4];
        plaintext[0] = ((command[0] & 0xF) << 27) + (command[1] << 19) + (command[2] << 11) + (command[3] << 3) + ((command[4] & 0xE0) >> 5);
        plaintext[1] = ((command[4] & 0x1F) << 26) + (command[5] << 18) + (command[6] << 10) + (command[7] << 2) + ((command[8] & 0xC0) >> 6);
        plaintext[2] = ((command[8] & 0x3F) << 25) + (command[9] << 17) + (command[10] << 9) + (command[11] << 1) + ((command[12] & 0x80) >> 7);
        plaintext[3] = ((command[12] & 0x7F) << 24) + (command[13] << 16) + (command[14] << 8) + command[15];
        // Compute key from shares
        for(int i=0; i<4; i++) key[i] = AddModMersenne(MulModMersenne((uint64_t)ipmcoeffs[0], keyshares[i*2]), MulModMersenne((uint64_t)ipmcoeffs[1], keyshares[i*2+1]));

        // Encrypt in software
        Encrypt(plaintext, key, ciphertext);

        // Convert received ciphertext to 4x31-bit word representation
        uint32_t ciphertext_received[4];
        ciphertext_received[0] = ((ReceiveBuffer[0] & 0xF) << 27) + (ReceiveBuffer[1] << 19) + (ReceiveBuffer[2] << 11) + (ReceiveBuffer[3] << 3) + ((ReceiveBuffer[4] & 0xE0) >> 5);
        ciphertext_received[1] = ((ReceiveBuffer[4] & 0x1F) << 26) + (ReceiveBuffer[5] << 18) + (ReceiveBuffer[6] << 10) + (ReceiveBuffer[7] << 2) + ((ReceiveBuffer[8] & 0xC0) >> 6);
        ciphertext_received[2] = ((ReceiveBuffer[8] & 0x3F) << 25) + (ReceiveBuffer[9] << 17) + (ReceiveBuffer[10] << 9) + (ReceiveBuffer[11] << 1) + ((ReceiveBuffer[12] & 0x80) >> 7);
        ciphertext_received[3] = ((ReceiveBuffer[12] & 0x7F) << 24) + (ReceiveBuffer[13] << 16) + (ReceiveBuffer[14] << 8) + ReceiveBuffer[15];

        for(int i=0; i<4; i++)
        {
            if(ciphertext[i] != ciphertext_received[i])
            {
                count_bad++;
                break;
            }
        }
        printf("%d\n", iterations+1);
    }
    RS232_CloseComport(COMPORT);

    printf("Received %d of %d correct encryption results.\n\n", MAX_ITERATIONS-count_bad, MAX_ITERATIONS);
    return 0;
}

int BruteForcePUFKeyEncryptions(uint32_t* pufkey)
{
    printf("Brute forcing the PUF fingerprint:\n");

    const char comm_mode[] = {'8', 'N', '1', 0};
	unsigned char command[] = {0x2F, 0x00, 0xCD, 0xAD, 0x7A, 0x28, 0x93, 0xAD, 0x16, 0x89, 0x55, 0x66, 0xC2, 0xBB, 0x7D, 0xF4, 0xB1, 0x88, 0xFC, 0x75, 0x93, 0xC4, 0xA6, 0xF1, 0x62, 0xD9, 0xB8, 0x68, 0x52, 0xDD, 0x6E, 0xF3, 0xCF, 0x83, 0x94, 0xB4};
	unsigned char ReceiveBuffer[16] = {0};
    uint32_t ipmcoeffs[2] = {0x7F65F6A6, 0x5A22919C};

    // Open serial port
    if (RS232_OpenComport(COMPORT, 9600, comm_mode, 0))
    {
        printf("Unable to open serial port.\n");
        return -1;
    }

    // Send command
    int sent_bytes = RS232_SendBuf(COMPORT, command, sizeof(command)/sizeof(command[0]));
    if (sent_bytes != (sizeof(command)/sizeof(command[0])))
    {
        printf("Unable to sent to serial port.\n");
        RS232_CloseComport(COMPORT);
        return -1;
    }

    // Send 0-byte to signal end of command
    Sleep(100);
    RS232_SendByte(COMPORT, 0x00);
    Sleep(100);

    // Receive output
    int received_bytes = RS232_PollComport(COMPORT, ReceiveBuffer, 16);
    if (received_bytes != 16)
    {
        printf("Unable to receive response.\n");
        RS232_CloseComport(COMPORT);
        return -1;
    }
    RS232_CloseComport(COMPORT);

    // Convert plaintext to 4x31-bit word representation
    uint32_t plaintext[4], key[4];
    plaintext[0] = ((command[0] & 0xF) << 27) + (command[1] << 19) + (command[2] << 11) + (command[3] << 3) + ((command[4] & 0xE0) >> 5);
    plaintext[1] = ((command[4] & 0x1F) << 26) + (command[5] << 18) + (command[6] << 10) + (command[7] << 2) + ((command[8] & 0xC0) >> 6);
    plaintext[2] = ((command[8] & 0x3F) << 25) + (command[9] << 17) + (command[10] << 9) + (command[11] << 1) + ((command[12] & 0x80) >> 7);
    plaintext[3] = ((command[12] & 0x7F) << 24) + (command[13] << 16) + (command[14] << 8) + command[15];

    // Convert received ciphertext to 4x31-bit word representation
    uint32_t ciphertext_received[4];
    ciphertext_received[0] = ((ReceiveBuffer[0] & 0xF) << 27) + (ReceiveBuffer[1] << 19) + (ReceiveBuffer[2] << 11) + (ReceiveBuffer[3] << 3) + ((ReceiveBuffer[4] & 0xE0) >> 5);
    ciphertext_received[1] = ((ReceiveBuffer[4] & 0x1F) << 26) + (ReceiveBuffer[5] << 18) + (ReceiveBuffer[6] << 10) + (ReceiveBuffer[7] << 2) + ((ReceiveBuffer[8] & 0xC0) >> 6);
    ciphertext_received[2] = ((ReceiveBuffer[8] & 0x3F) << 25) + (ReceiveBuffer[9] << 17) + (ReceiveBuffer[10] << 9) + (ReceiveBuffer[11] << 1) + ((ReceiveBuffer[12] & 0x80) >> 7);
    ciphertext_received[3] = ((ReceiveBuffer[12] & 0x7F) << 24) + (ReceiveBuffer[13] << 16) + (ReceiveBuffer[14] << 8) + ReceiveBuffer[15];

    printf("Ciphertext used for exhaustive key search: ");
    for(int i=0; i<4; i++)
    {
        printf("0x%08X, ", ciphertext_received[i]);
    }
    printf("\n");

    for(uint64_t guess=0; guess<4294967296; guess++)
    {
        if((guess % 1000000) == 0) printf("%" PRIu64 "\n", guess);
        uint32_t keyshares[8] = {0x712A13C0, 0x7F5CC6C0, 0x47C8D430, 0x388096E0, 0x5D7DD640, 0x0C5A6A60, 0x652CED10, 0x5AEF1760};

        keyshares[0] += (guess & 0xF);
        keyshares[1] += ((guess >> 4) & 0xF);
        keyshares[2] += ((guess >> 8) & 0xF);
        keyshares[3] += ((guess >> 12) & 0xF);
        keyshares[4] += ((guess >> 16) & 0xF);
        keyshares[5] += ((guess >> 20) & 0xF);
        keyshares[6] += ((guess >> 24) & 0xF);
        keyshares[7] += ((guess >> 28) & 0xF);

        // Compute key from shares
        for(int i=0; i<4; i++) key[i] = AddModMersenne(MulModMersenne((uint64_t)ipmcoeffs[0], keyshares[i*2]), MulModMersenne((uint64_t)ipmcoeffs[1], keyshares[i*2+1]));

        // Encrypt in software
        uint32_t ciphertext[4];
        Encrypt(plaintext, key, ciphertext);

        int good = 1;
        for(int i=0; i<4; i++)
        {
            if (ciphertext[i] != ciphertext_received[i])
            {
                good = 0;
                break;
            }
        }
        if(good)
        {
            printf("KEY FOUND: ");
            for(int i=0; i<4; i++)
            {
                pufkey[i] = key[i];
                printf("0x%08X, ", key[i]);
            }
            printf("\n\n");
            return -1;
        }
    }

    return -1;
}

int TestPUFKeyEncryptions(const uint32_t* pufkey)
{
    printf("Test %d encryptions with random plaintexts and seeds under fixed key:\n", MAX_ITERATIONS);

    const char comm_mode[] = {'8', 'N', '1', 0};
	unsigned char command[36] = {0};
	unsigned char ReceiveBuffer[16] = {0};

    // Open serial port
    if (RS232_OpenComport(COMPORT, 9600, comm_mode, 0))
    {
        printf("Unable to open serial port.\n");
        return -1;
    }

    unsigned int count_bad = 0;
    for(int iterations=0; iterations<MAX_ITERATIONS; iterations++)
    {
        // Update command with fresh plaintext and seed
        command[0] = 0x20 + (rand() & 0xF);
        for(int i=1; i<sizeof(command)/sizeof(command[0]); i++)
        {
            command[i] = rand() & 0xFF;
        }

        // Send command
        int sent_bytes = RS232_SendBuf(COMPORT, command, sizeof(command)/sizeof(command[0]));
        if (sent_bytes != (sizeof(command)/sizeof(command[0])))
        {
            printf("Unable to sent to serial port.\n");
            RS232_CloseComport(COMPORT);
            return -1;
        }

        // Send 0-byte to signal end of command
        Sleep(100);
        RS232_SendByte(COMPORT, 0x00);
        Sleep(100);

        // Receive output
        int received_bytes = RS232_PollComport(COMPORT, ReceiveBuffer, 16);
        if (received_bytes != 16)
        {
            printf("Unable to receive response.\n");
            RS232_CloseComport(COMPORT);
            return -1;
        }

        // Convert plaintext to 4x31-bit word representation
        uint32_t plaintext[4], ciphertext[4];
        plaintext[0] = ((command[0] & 0xF) << 27) + (command[1] << 19) + (command[2] << 11) + (command[3] << 3) + ((command[4] & 0xE0) >> 5);
        plaintext[1] = ((command[4] & 0x1F) << 26) + (command[5] << 18) + (command[6] << 10) + (command[7] << 2) + ((command[8] & 0xC0) >> 6);
        plaintext[2] = ((command[8] & 0x3F) << 25) + (command[9] << 17) + (command[10] << 9) + (command[11] << 1) + ((command[12] & 0x80) >> 7);
        plaintext[3] = ((command[12] & 0x7F) << 24) + (command[13] << 16) + (command[14] << 8) + command[15];

        // Encrypt in software
        Encrypt(plaintext, pufkey, ciphertext);

        // Convert received ciphertext to 4x31-bit word representation
        uint32_t ciphertext_received[4];
        ciphertext_received[0] = ((ReceiveBuffer[0] & 0xF) << 27) + (ReceiveBuffer[1] << 19) + (ReceiveBuffer[2] << 11) + (ReceiveBuffer[3] << 3) + ((ReceiveBuffer[4] & 0xE0) >> 5);
        ciphertext_received[1] = ((ReceiveBuffer[4] & 0x1F) << 26) + (ReceiveBuffer[5] << 18) + (ReceiveBuffer[6] << 10) + (ReceiveBuffer[7] << 2) + ((ReceiveBuffer[8] & 0xC0) >> 6);
        ciphertext_received[2] = ((ReceiveBuffer[8] & 0x3F) << 25) + (ReceiveBuffer[9] << 17) + (ReceiveBuffer[10] << 9) + (ReceiveBuffer[11] << 1) + ((ReceiveBuffer[12] & 0x80) >> 7);
        ciphertext_received[3] = ((ReceiveBuffer[12] & 0x7F) << 24) + (ReceiveBuffer[13] << 16) + (ReceiveBuffer[14] << 8) + ReceiveBuffer[15];

        for(int i=0; i<4; i++)
        {
            if(ciphertext[i] != ciphertext_received[i])
            {
                count_bad++;
                break;
            }
        }
        printf("%d\n", iterations+1);
    }
    RS232_CloseComport(COMPORT);

    printf("Received %d of %d correct encryption results.\n\n", MAX_ITERATIONS-count_bad, MAX_ITERATIONS);
    return 0;
}
