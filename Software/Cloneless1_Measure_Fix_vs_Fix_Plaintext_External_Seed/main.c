#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <time.h>
#include "rs232.h"
#include "ps5000aApi.h"
#include "Pico5244D.h"

#define COMPORT 4 // = COM5
#define MEASUREMENTS_PER_FILE 5000
#define FILES 20100
#define POINTS 15000

uint32_t Trivium_Get1Bit(uint32_t* state)
{
    uint32_t s65 = (state[6] >> 1) & 0x1;
    uint32_t s68 = (state[6] >> 4) & 0x1;
    uint32_t s90 = (state[6] >> 26) & 0x1;
    uint32_t s91 = (state[6] >> 27) & 0x1;
    uint32_t s92 = (state[6] >> 28) & 0x1;
    uint32_t s161 = (state[3] >> 1) & 0x1;
    uint32_t s170 = (state[3] >> 10) & 0x1;
    uint32_t s174 = (state[3] >> 14) & 0x1;
    uint32_t s175 = (state[3] >> 15) & 0x1;
    uint32_t s176 = (state[3] >> 16) & 0x1;
    uint32_t s242 = (state[1] >> 18) & 0x1;
    uint32_t s263 = (state[0] >> 7) & 0x1;
    uint32_t s285 = (state[0] >> 29) & 0x1;
    uint32_t s286 = (state[0] >> 30) & 0x1;
    uint32_t s287 = (state[0] >> 31) & 0x1;

    uint32_t t1 = s161 ^ s176;
    uint32_t t2 = s65 ^ s92;
    uint32_t t3 = s242 ^ s287;

    state[0] = (state[0] << 1) ^ (state[1] >> 31);
    state[1] = (state[1] << 1) ^ (state[2] >> 31);
    state[2] = (state[2] << 1) ^ (state[3] >> 31);
    state[3] = ((state[3] << 1) & 0xFFFC0000) ^ ((t1 ^ (s174 & s175) ^ s263) << 17) ^ ((state[3] << 1) & 0x1FFFE) ^ (state[4] >> 31);
    state[4] = (state[4] << 1) ^ (state[5] >> 31);
    state[5] = (state[5] << 1) ^ (state[6] >> 31);
    state[6] = ((state[6] << 1) & 0xC0000000) ^ ((t2 ^ (s90 & s91) ^ s170) << 29) ^ ((state[6] << 1) & 0x1FFFFFFF) ^ (state[7] >> 31);
    state[7] = (state[7] << 1) ^ (state[8] >> 31);
    state[8] = (state[8] << 1) ^ (t3 ^ (s285 & s286) ^ s68);

    return t1^t2^t3;
}

int main()
{
    srand((unsigned)time(NULL));

    const char comm_mode[] = {'8', 'N', '1', 0};
	unsigned char command[] = {(MEASUREMENTS_PER_FILE & 0xFF00) >> 8, MEASUREMENTS_PER_FILE & 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
	unsigned char ReceiveBuffer[16] = {0};

	// Allocate buffer
	uint8_t *fix;
	fix = (uint8_t*)calloc(MEASUREMENTS_PER_FILE, sizeof(uint8_t));
	if (fix == NULL)
	{
		printf("Unable to reserve fix buffer.\n");
		return -1;
	}
	int16_t **buffer;
	buffer = (int16_t**)calloc(MEASUREMENTS_PER_FILE, sizeof(int16_t*));
	if (buffer == NULL)
	{
		printf("Unable to reserve data buffer.\n");
		return -1;
	}
	for (int i = 0; i < MEASUREMENTS_PER_FILE; i++)
	{
		buffer[i] = (int16_t*)calloc(POINTS, sizeof(int16_t));
		if (buffer[i] == NULL)
		{
			printf("Unable to reserve data buffer.\n");
			return -1;
		}
	}

	// Open scope
	int16_t handle = initialize_scope(1, MEASUREMENTS_PER_FILE, POINTS, buffer);
	if (handle != -1)
	{
		for (int tracefile=0; tracefile<FILES; tracefile++)
		{
            // Update command with fresh plaintext and seed
            uint32_t Trivium_state[9];
            for(int i=0; i<9; i++)
            {
                command[i*4+2] = rand() & 0xFF;
                command[i*4+3] = rand() & 0xFF;
                command[i*4+4] = rand() & 0xFF;
                command[i*4+5] = rand() & 0xFF;
                Trivium_state[i] = ((uint32_t)command[i*4+2] << 24) + ((uint32_t)command[i*4+3] << 16) + ((uint32_t)command[i*4+4] << 8) + (uint32_t)command[i*4+5];
            }
            for (int j = 0; j < 161; j++) Trivium_Get1Bit(Trivium_state);
            for (int i = 0; i < MEASUREMENTS_PER_FILE; i++)
            {
                fix[i] = Trivium_Get1Bit(Trivium_state);
                for (int j = 0; j < 160; j++) Trivium_Get1Bit(Trivium_state);
            }

            // Open serial port
            if (RS232_OpenComport(COMPORT, 9600, comm_mode, 0))
            {
                printf("Unable to open serial port.\n");
                ps5000aCloseUnit(handle);
                return -1;
            }

            // Arm scope
            int16_t armed = arm_scope(handle, 1, MEASUREMENTS_PER_FILE, POINTS);
            if (armed == 1)
            {
                // Send command
                int sent_bytes = RS232_SendBuf(COMPORT, command, sizeof(command) / sizeof(command[0]));
                if (sent_bytes != (sizeof(command) / sizeof(command[0])))
                {
                    printf("Unable to sent to serial port.\n");
                    ps5000aCloseUnit(handle);
                    RS232_CloseComport(COMPORT);
                    return -1;
                }

                // Wait until scope has recorded the expected number of traces
                uint32_t traces_recorded = wait_for_scope(handle);
                if (traces_recorded == MEASUREMENTS_PER_FILE)
                {
                    // Get measurements
                    uint32_t Samples = POINTS;
                    PICO_STATUS status;
                    status = ps5000aGetValuesBulk(handle, &Samples, 0, MEASUREMENTS_PER_FILE - 1, 1, PS5000A_RATIO_MODE_NONE, NULL);
                    if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
                    {
                        printf("Unable to get values.\n");
                        ps5000aCloseUnit(handle);
                        RS232_CloseComport(COMPORT);
                        return -1;
                    }
                    if (Samples != POINTS)
                    {
                        printf("Received number of samples (%d) is different from requested one (%d).\n", Samples, POINTS);
                        ps5000aCloseUnit(handle);
                        RS232_CloseComport(COMPORT);
                        return -1;
                    }

                    // Send 0-byte to signal end of command
                    Sleep(300);
                    RS232_SendByte(COMPORT, 0x00);
                    Sleep(100);

                    // Receive output
                    int received_bytes = RS232_PollComport(COMPORT, ReceiveBuffer, 16);
                    if (received_bytes != 16)
                    {
                        printf("Unable to receive response.\n");
                        ps5000aCloseUnit(handle);
                        RS232_CloseComport(COMPORT);
                        return -1;
                    }

                    printf("Predicted: %d, Received: ", fix[MEASUREMENTS_PER_FILE - 1]);
                    for (int i = 0; i < 16; i++)
                    {
                        printf("0x%02X, ", ReceiveBuffer[i]);
                    }
                    printf("\n");

                    // Write data to hard drive
                    FILE* f;
                    char filename[200];
                    sprintf(filename, "Traces_%d.dat", tracefile + 1);
                    f = fopen(filename, "wb");
                    if (f != NULL)
                    {
                        for (int i = 0; i < MEASUREMENTS_PER_FILE; i++)
                        {
                            fwrite(&fix[i], sizeof(uint8_t), 1, f);
                            for (int j = 0; j < POINTS; j++)
                            {
                                fwrite(&buffer[i][j], sizeof(int16_t), 1, f);
                            }
                        }
                        fclose(f);
                    }
                }
            }
            RS232_CloseComport(COMPORT);
		}
    }
    ps5000aCloseUnit(handle);

    for (int i = 0; i < MEASUREMENTS_PER_FILE; i++)
    {
        free(buffer[i]);
    }
    free(buffer);
    free(fix);

    return 0;
}

