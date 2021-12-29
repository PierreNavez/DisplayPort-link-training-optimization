/*
 * i2c.c
 *
 *  Created on: 18 nov. 2021
 *      Author: Stagiaire
 */

#include <altera_avalon_i2c.h>
#include <altera_avalon_pio_regs.h>
#include <stdbool.h>
#include <stdio.h>
#include <system.h>

#include "dp_141.h"
#include "main.h"
#include "i2c.h"

//due to problem with eclipse to recognize macro from system.h:
#define LT_I2C_MUX_SELECT_BASE 0x41440
#define I2C_0_NAME "/dev/i2c_0"

void set_i2c_master(bool lt_cpu_is_master)
{
	if(DEBUG)
	{
		printf("Currently setting the I2C master...\n");
	}
	if(lt_cpu_is_master)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(LT_I2C_MUX_SELECT_BASE, 1);
	}
	else if(!lt_cpu_is_master)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(LT_I2C_MUX_SELECT_BASE, 0);
	}
	return;
}

ALT_AVALON_I2C_DEV_t * i2c_init(ALT_AVALON_I2C_DEV_t *i2c_dev, ALT_AVALON_I2C_MASTER_CONFIG_t *cfg)
{
	if(DEBUG)
	{
		printf("Initialization of the I2C master device...\n");
	}
	ALT_AVALON_I2C_STATUS_CODE status;

	i2c_dev = alt_avalon_i2c_open(I2C_0_NAME);
	if(NULL == i2c_dev)
	{
		printf("Error: cannot find I2C_0_NAME\n");
	}
	//configure the device instance to 7 bits address mode, set the master target address
	(*cfg).addr_mode = 0;
	alt_avalon_i2c_master_config_set(i2c_dev, cfg);
	alt_avalon_i2c_master_target_set(i2c_dev,DP141_I2C_ADDRESS);

	//configure the speed of the i2c bus to fast mode
	status = alt_avalon_i2c_master_config_speed_set(i2c_dev, cfg, 400000);

	if(status < 0)
	{
		printf("Error: unable to set to speed of the i2c bus to 400 kHz\n");
	}
	return i2c_dev;
}

