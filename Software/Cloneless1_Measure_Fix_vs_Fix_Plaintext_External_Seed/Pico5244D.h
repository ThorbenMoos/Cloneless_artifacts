int16_t initialize_scope(int16_t verbose, int32_t no_of_encryptions, int32_t no_of_points, int16_t** buffer);
int16_t arm_scope(int16_t handle, int16_t verbose, int32_t no_of_encryptions, int32_t no_of_points);
uint32_t wait_for_scope(int16_t handle);