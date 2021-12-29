/*
 * dp_141.h
 *
 *  Created on: 17 nov. 2021
 *      Author: Stagiaire
 */

#ifndef SRC_DP_141_H_
#define SRC_DP_141_H_

#include "alt_types.h"
#include "types.h"
#include "altera_avalon_i2c.h"

#define DP141_I2C_ADDRESS 0x03
#define IS_TX 1
#define NUM_KEY 30

typedef struct reg_map
{
	alt_u8 reg_address;
	alt_u8 reg_value;
}reg_map;

typedef struct key_val
{
	alt_u16 key;
	alt_u8 val;
}key_val;


/*
 * dp141_init(link_config *p) configure the dp141 general settings given the lane_count in the link_config structure
 * configure the redriver with default parameters thanks to the i2c master device instance
 */
void dp141_init(link_config *p,ALT_AVALON_I2C_DEV_t *i2c_dev);

/*
 * getkey(link_config *p) computes a unique 32 bits key useful to compute the dp141 config register value
 * param: link_config *p: a pointer to the link configuration structure, where the training pattern and link bandwidth are defined
 *        int lane_number: the lane number corresponding to the key
 */
alt_u16 getkey(link_config *p, int lane_number);

/*
 * memory_init returns a pointer to a tab of key_val structures. The memory changes depending on if we are on the tx or rx side
 */
key_val* memory_init();

/*
 * getval returns the value val corresponding to the key in the memory structure
 */
alt_u8 getval(alt_u16 key, key_val* memory);


/*
 * dp141_reprogram is a routine called subsequently to an irq, which reprogram the dp141 given the current parameters of the link_config stucture
 */
void dp141_reprogram(link_config *p, ALT_AVALON_I2C_DEV_t *i2c_dev, key_val* memory);


#endif /* SRC_DP_141_H_ */
