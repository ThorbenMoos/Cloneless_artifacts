#include "ps5000aApi.h"
#include "Pico5244D.h"
#include <stdio.h>
#include <stdint.h>

int16_t initialize_scope(int16_t verbose, int32_t no_of_encryptions, int32_t no_of_points, int16_t** buffer)
{
	PICO_STATUS status;
	int16_t handle;

	// Connect to the device
	status = ps5000aOpenUnit(&handle, NULL, PS5000A_DR_12BIT);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if(verbose) printf("Connected to the device.\n");
	}
	else {
		printf("Unable to connect to the device.\n");
		return -1;
	}

	// Set bandwidth limit on Channel A
	status = ps5000aSetBandwidthFilter(handle, PS5000A_CHANNEL_A, PS5000A_BW_20MHZ);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("Bandwith limit set.\n");
	}
	else {
		printf("Unable to set bandwidth limit.\n");
		return -1;
	}

	// Configure Channel A
	status = ps5000aSetChannel(handle, PS5000A_CHANNEL_A, 1, PS5000A_DC, PS5000A_2V, 0.0);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("Channel A configured.\n");
	}
	else {
		printf("Unable to configure Channel A.\n");
		return -1;
	}

	// Configure Channel B
	status = ps5000aSetChannel(handle, PS5000A_CHANNEL_B, 1, PS5000A_DC, PS5000A_500MV, 0.0);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("Channel B configured.\n");
	}
	else {
		printf("Unable to configure Channel B.\n");
		return -1;
	}

	// Configure Trigger (Channel B)
	status = ps5000aSetSimpleTrigger(handle, 1, PS5000A_CHANNEL_B, 10000, PS5000A_RISING, 0, 0);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("Trigger configured.\n");
	}
	else {
		printf("Unable to configure Trigger.\n");
		return -1;
	}

	// Deactive ETS
	status = ps5000aSetEts(handle, PS5000A_ETS_OFF, 0, 0, NULL);

	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("ETS deactivated.\n");
	}
	else {
		printf("Unable to deactivate ETS.\n");
		return -1;
	}

	// Set Memory Segments
	uint32_t max_segments;
	status = ps5000aGetMaxSegments(handle, &max_segments);

	if ((status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT) && (max_segments >= (uint32_t)no_of_encryptions))
	{
		if (verbose) printf("Maximum number of memory segments determined.\n");
	}
	else {
		printf("Unable to determine the maximum number of memory segments.\n");
		return -1;
	}

	int32_t max_samples;
	status = ps5000aMemorySegments(handle, no_of_encryptions, &max_samples);

	if ((status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT) && (max_samples >= no_of_points))
	{
		if (verbose) printf("Memory segments set.\n");
	}
	else {
		printf("Unable to set memory segments.\n");
		return -1;
	}

	// Set Number of Captures
	status = ps5000aSetNoOfCaptures(handle, no_of_encryptions);
	if (status == PICO_OK || status == PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		if (verbose) printf("Number of captures set.\n");
	}
	else {
		printf("Unable to set number of captures.\n");
		return -1;
	}

	// Reserve Internal Buffer
	for (int i = 0; i < no_of_encryptions; i++)
	{
		if (buffer[i] == NULL)
		{
			printf("Incorrect buffer.\n");
			return -1;
		}

		status = ps5000aSetDataBuffer(handle, PS5000A_CHANNEL_A, buffer[i], no_of_points, i, PS5000A_RATIO_MODE_NONE);

		if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
		{
			printf("Unable to reserve buffer.\n");
			return -1;
		}
	}
	if (verbose) printf("Buffer reserved.\n");
	if (verbose) printf("\nLet's go!.\n\n");
	return handle;
}

int16_t arm_scope(int16_t handle, int16_t verbose, int32_t no_of_encryptions, int32_t no_of_points)
{
	PICO_STATUS status;
	status = ps5000aStop(handle);
	if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		printf("Unable to stop.\n");
		return -1;
	}

	status = ps5000aSetNoOfCaptures(handle, no_of_encryptions);
	if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		printf("Unable to set No. of captures.\n");
		return -1;
	}

	int32_t timeIndisposed;
	uint32_t timebase = 0;
	int32_t fin = 0;
	do {
		status = ps5000aRunBlock(handle, 0, no_of_points, timebase, &timeIndisposed, 0, NULL, NULL);
		if (status == PICO_DRIVER_PATH || status == PICO_INVALID_NUMBER_CHANNELS_FOR_RESOLUTION)
		{
			if (verbose) printf("Ivalid time base - try next.\n");
			timebase++;
		}
		else if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
		{
			printf("Unable to configure block mode.\n");
			return -1;
		}
		else {
			fin = 1;
		}
	} while (!fin);

	if (verbose) printf("\nDevice armed.\n\n");
	return 1;
}


uint32_t wait_for_scope(int16_t handle)
{
	PICO_STATUS status;
	int16_t ready = 0;
	uint32_t counter = 0;

	do {
		status = ps5000aIsReady(handle, &ready);
		if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
		{
			printf("Unable to get feedback from scope.\n");
			return -1;
		}
		counter++;
	} while (!ready && counter < 1000000000);

	status = ps5000aStop(handle);
	if (status != PICO_OK && status != PICO_USB3_0_DEVICE_NON_USB3_0_PORT)
	{
		printf("Unable to stop.\n");
		return -1;
	}

	uint32_t traces_recorded;
	status = ps5000aGetNoOfCaptures(handle, &traces_recorded);

	return traces_recorded;
}
