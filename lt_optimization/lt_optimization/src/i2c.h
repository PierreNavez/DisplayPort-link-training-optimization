/*
 * i2h.h
 *
 *  Created on: 18 nov. 2021
 *      Author: Stagiaire
 */

#ifndef SRC_I2C_H_
#define SRC_I2C_H_

#include <stdbool.h>
#include <altera_avalon_i2c.h>


/*
 * set_i2c_master(bool lt_cpu_is_master) is the function that drive the output of the PIO (select signal of the i2c master mux)
 * input: char bit = '0' is cpu is the master, or '1' when lt_cpu is the master
 * when the PIO has its output to '1', lt_cpu is the master of the I2C bus
 */
void set_i2c_master(bool lt_cpu_is_master);

/*
 * i2c_init(ALT_AVALON_I2C_DEV_t *i2c_dev) initialize an i2c master device, set the address of the DP141 for the master point
 * of view, configure the address mode and the bus speed.
 *
 * param: i2c_dev: a pointer to the device instance
 *        cfg    : a pointer to the cfg structure instance (see altera_avalon_i2c.h) (should be null)
 * return: a pointer to the device instance
 */
ALT_AVALON_I2C_DEV_t *i2c_init(ALT_AVALON_I2C_DEV_t *i2c_dev, ALT_AVALON_I2C_MASTER_CONFIG_t *cfg);


#endif /* SRC_I2C_H_ */
