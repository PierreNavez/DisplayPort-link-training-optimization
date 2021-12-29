/*
 * utils.h
 *
 *  Created on: 17 nov. 2021
 *      Author: Stagiaire
 */

#ifndef SRC_UTILS_H_
#define SRC_UTILS_H_

#include <alt_types.h>
#include "types.h"
#include <altera_avalon_i2c.h>
#include "dp_141.h"

#define LINK_BW_BYTE 0
#define LANE_COUNT_BYTE 1
#define TRAINING_PATTERN_BYTE 2
#define LANE0_BYTE 3
#define LANE1_BYTE 0
#define LANE2_BYTE 1
#define LANE3_BYTE 2
#define LINK_BW_SET_BYTE 0
#define LANE_COUNT_SET_BYTE 1
#define CLOCK_RECOVERY_BYTE 2
#define CHANNEL_EQUALIZATION_BYTE 3
#define LANE0_SET_BYTE 0
#define LANE1_SET_BYTE 1
#define LANE2_SET_BYTE 2
#define LANE3_SET_BYTE 3


/*
 * lt_opt_init(link_config *p) is called subsequently to the rising edge of the signal lt_active which triggers an irq to the cpu
 * This functions performs the following tasks:
 * -Read the value of link_bandwidth and lane_count in data_handler memory and store them in local memory
 * -Initialize the DP141 depending on the value of lane count and thanks to the i2c device instance
 */
void lt_opt_init(link_config *p, alt_u8 *lane_count_prev,ALT_AVALON_I2C_DEV_t *i2c_dev);


/*
 * lt_opt_stat(link_stat *p) is called at the end of the link training. This functions reads the registers associated to the statistical
 * values in data_handler memory and store them in local memory
 */
void lt_opt_stat(link_stat *p);


/*
 * lt_opt_redriver_program(link_config *p) is called whenever the irq is triggered. This function reads the register associated with
 * training_pattern_set and reprogram the redriver subsequently
 * param: p is a pointer to the link configuration structure
 *        lane_count_prev tracks the number of lane that were used at the previous irq
 *        i2c_dev is a pointer to the i2c master instance
 *        memory is a pointer to the memory
 */
void lt_opt_redriver_program(link_config *p, alt_u8 *lane_count_prev,ALT_AVALON_I2C_DEV_t *i2c_dev, key_val* memory);


/*
 * reg32_to_8(alt_u32 *from_reg, alt_u8 *to_reg, int byte): this function extract a byte from a 32-bits register
 * and save it in an 8-bits register.
 * input: alt_u32 *from_reg: pointer to a 32-bits register
 *        alt_u8  *to_reg: pointer to an 8-bits register
 *        int byte: the index of the byte to save
 */
void reg32_to_8(alt_u32 *from_reg, alt_u8 *to_reg, int byte);


#endif /* SRC_UTILS_H_ */
