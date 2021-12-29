/*
 * utils.c
 *
 *  Created on: 17 nov. 2021
 *      Author: Stagiaire
 */


#include <io.h>
#include <system.h>
#include <stdio.h>

#include "dp_141.h"
#include "utils.h"
#include "main.h"

void lt_opt_init(link_config *p, alt_u8 *lane_count_prev, ALT_AVALON_I2C_DEV_t *i2c_dev)
{
	if(DEBUG)
	{
		printf("Entering the routine: lt_opt_init...\n");
	}
	//First I start by reading the values of the registers and I store them in the link_config structure
	alt_u32 reg_0 = IORD_32DIRECT(MM_BRIDGE_0_BASE, 0x00);
	reg32_to_8(&reg_0,&(*p).lane_count, LANE_COUNT_BYTE);
	reg32_to_8(&reg_0,&(*p).link_bw, LINK_BW_BYTE);
	*lane_count_prev = (*p).lane_count;

	dp141_init(p, i2c_dev);
}

void lt_opt_redriver_program(link_config *p, alt_u8 *lane_count_prev,ALT_AVALON_I2C_DEV_t *i2c_dev, key_val* memory)
{
	if(DEBUG)
	{
		printf("Entering the routine: lt_opt_redriver_program...\n");
	}
	//First one reads the value of both useful registers
	alt_u32 reg_0 = IORD_32DIRECT(MM_BRIDGE_0_BASE, 0x00);
	alt_u32 reg_1 = IORD_32DIRECT(MM_BRIDGE_0_BASE, 0x04);
	//One update the link_config structure
	reg32_to_8(&reg_0,&(*p).lane_count, LANE_COUNT_BYTE);
	reg32_to_8(&reg_0,&(*p).link_bw, LINK_BW_BYTE);

	//one needs to extract the correct bits in the lane count register
	alt_u8 mask = 0x14; //lane_count_set = bits[4:0]
	alt_u8 lane_count = mask & (*p).lane_count;
	switch(lane_count) //Il faut extraire les valeurs nécessaires pour avoir la valeur réelle de lane_count
	{
		case 1:
			reg32_to_8(&reg_0,&(*p).lane_0, LANE0_BYTE);
			break;
		case 2:
			reg32_to_8(&reg_0,&(*p).lane_0, LANE0_BYTE);
			reg32_to_8(&reg_1,&(*p).lane_1, LANE1_BYTE);
			break;
		case 3:
			reg32_to_8(&reg_0,&(*p).lane_0, LANE0_BYTE);
			reg32_to_8(&reg_1,&(*p).lane_1, LANE1_BYTE);
			reg32_to_8(&reg_1,&(*p).lane_2, LANE2_BYTE);
			reg32_to_8(&reg_1,&(*p).lane_3, LANE3_BYTE);
			break;
		default:
			break;
	}
	if(*lane_count_prev != (*p).lane_count)
	{
		//Call a routine that reprogram the general settings of the DP141
		*lane_count_prev = (*p).lane_count; //one update the value of lane count prev
	}

	//call a routine that reprograms the dp141 according to the current link configuration
	dp141_reprogram(p, i2c_dev, memory);
}

void lt_opt_stat(link_stat *p)
{
	if(DEBUG)
	{
		printf("Entering the routine: lt_opt_stat...\n");
	}
	//read the value of the statistics registers
	alt_u32 reg_2 = IORD_32DIRECT(MM_BRIDGE_0_BASE, 0x08);
	alt_u32 reg_3 = IORD_32DIRECT(MM_BRIDGE_0_BASE, 0x0C);

	//save them in the struct link_stat
	reg32_to_8(&reg_2, &(*p).link_bw_set, LINK_BW_SET_BYTE);
	reg32_to_8(&reg_2, &(*p).lane_count_set, LANE_COUNT_SET_BYTE);
	reg32_to_8(&reg_2, &(*p).clock_recovery, CLOCK_RECOVERY_BYTE);
	reg32_to_8(&reg_2, &(*p).channel_equalization, CHANNEL_EQUALIZATION_BYTE);
	reg32_to_8(&reg_3, &(*p).lane_0_set, LANE0_SET_BYTE);
	reg32_to_8(&reg_3, &(*p).lane_1_set, LANE1_SET_BYTE);
	reg32_to_8(&reg_3, &(*p).lane_2_set, LANE2_SET_BYTE);
	reg32_to_8(&reg_3, &(*p).lane_3_set, LANE3_SET_BYTE);

	printf("-------------------Link training statistics report:-------------------\n");
	printf("The link bandwidth has been set: %d times, and the final value is: \n",(*p).link_bw_set);
	printf("The number of lines has been changed %d times\n",(*p).lane_count_set);
	printf("%d clock recovery sequences have been performed\n",(*p).clock_recovery);
	printf("While %d channel equalization phase have taken place\n",(*p).channel_equalization);
	printf("Lane 0,1,2,3 settings have been modified %d, %d, %d, %d times, respectively\n",(*p).lane_0_set,
			(*p).lane_1_set,(*p).lane_2_set,(*p).lane_3_set);
	printf("-----------------------------------------------------------------------\n");
}


void reg32_to_8(alt_u32 *from_reg, alt_u8 *to_reg, int byte)
{
	if(DEBUG)
	{
		printf("reg32_to_8 routine currently being performed...\n");
	}
	alt_u32 mask;

	switch(byte)
	{
	case 0:
		mask = 0x000000FF;
		*to_reg = *from_reg & mask;
		break;
	case 1:
		mask = 0x0000FF00;
		*to_reg = (*from_reg & mask)>>8;
		break;
	case 2:
		mask = 0x00FF0000;
		*to_reg = (*from_reg & mask)>>16;
		break;
	case 3:
		mask = 0xFF000000;
		*to_reg = (*from_reg & mask)>>24;
		break;
	default:
		break;
	}
	return;
}

