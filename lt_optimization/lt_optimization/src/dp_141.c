/*
 * dp_141.c
 *
 *  Created on: 17 nov. 2021
 *      Author: Stagiaire
 */

#include <altera_avalon_i2c.h>
#include <stdio.h>
#include <stdlib.h>

#include "dp_141.h"
#include "i2c.h"
#include "main.h"

void dp141_init(link_config *p, ALT_AVALON_I2C_DEV_t *i2c_dev)
{
	if(DEBUG)
	{
		printf("Entering the dp141_init routine...\n");
	}

	reg_map reg_map_init[5];
	alt_u8 txbuffer[2];
	ALT_AVALON_I2C_STATUS_CODE status;


	if(IS_TX) //bit[7:2] = i2c mode, normal power, sync all channel, trace mode
	{
		reg_map_init[0].reg_address = 0x00;
		reg_map_init[0].reg_value = 0x04;
	}
	else //bit[7:2] = i2c mode, normal power, sync all channel, cable mode
	{
		reg_map_init[0].reg_address = 0x00;
		reg_map_init[0].reg_value = 0x00;

	}
	alt_u8 mask = 0x14, lane_count;
	lane_count = (*p).lane_count & mask;
	switch(lane_count)
	{
		case 1: //enable channel 0
			reg_map_init[1].reg_address = 0x01;
			reg_map_init[1].reg_value = 0x0E;
			break;
		case 2: //enable channels 0 and 1
			reg_map_init[1].reg_address = 0x01;
			reg_map_init[1].reg_value = 0x0C;
			break;
		case 4: //enable all channels
			reg_map_init[1].reg_address = 0x01;
			reg_map_init[1].reg_value = 0x00;
			break;
		default://enable all channels
			reg_map_init[1].reg_address = 0x01;
			reg_map_init[1].reg_value = 0x00;
			break;
	}

	if(IS_TX){
		//RSVD | EQ Setting<2> | EQ Setting<1> | EQ Setting<0> | TX_GAIN | EQ_DC_GAIN | RX_GAIN<1> | RX_GAIN<0>
		reg_map_init[3].reg_address = 0x05; //Channel 1 control settings:
		reg_map_init[3].reg_value = 0x3C; //

		reg_map_init[4].reg_address = 0x06; //Channel 1 enable settings (driver peaking disabled, equ and driver stage enabled)
		reg_map_init[4].reg_value = 0x00;

	}
	else{
		reg_map_init[3].reg_address = 0x05; //Channel 1 control settings:
		reg_map_init[3].reg_value = 0x73; //

		reg_map_init[4].reg_address = 0x06; //Channel 1 enable settings (driver peaking disabled, equ and driver stage enabled)
		reg_map_init[4].reg_value = 0x00; //

	}
	//Now one can process to an I2C write of these registers

	//Fist set i2c master
	set_i2c_master(true);

	for(int i = 0; i<4; i++)
	{
		txbuffer[0] = reg_map_init[i].reg_address;
		txbuffer[1] = reg_map_init[i].reg_value;
		status = alt_avalon_i2c_master_tx(i2c_dev, txbuffer, 2,
		ALT_AVALON_I2C_NO_INTERRUPTS);
		if (status!=ALT_AVALON_I2C_SUCCESS)
		{
			printf("Failed to initialize DP141\n");
			//disable i2c master
			set_i2c_master(false);
			return;
		}
	}

	//disable i2c master
	set_i2c_master(false);
	return;
}


alt_u16 getkey(link_config *p, int lane_number){

	if(DEBUG)
	{
		printf("Getting a dictionary key...\n");
	}
	alt_u16 key = 0;

	alt_u8 mask = 0x1B; //voltage swing and pre_emphasis mask;
	alt_u8 result;

	switch(lane_number)
	{
	case 0:
		result = mask & (*p).lane_0;
		break;
	case 1:
		result = mask & (*p).lane_1;
		break;
	case 2:
		result = mask & (*p).lane_2;
		break;
	case 3:
		result = mask & (*p).lane_3;
		break;
	default:
		result = mask & (*p).lane_0;
		break;
	}

	alt_u8 link_bw = (*p).link_bw;

	key = (result << 8)| link_bw; //key[15:0] = [result link_bw]

	return key;
}

key_val* memory_init(){

	if(DEBUG)
	{
		printf("Memory initialization...\n");
	}

	key_val* mem;
	mem = (key_val*)malloc(NUM_KEY*sizeof(key_val));

	if(IS_TX)
	{
		//link_bw = 0x14
		mem[0].key = 0x0014; mem[0].val = 0x00; //vs 00 pe 00 ==>
		mem[1].key = 0x0814; mem[1].val = 0x00; //vs 00 pe 01 ==>
		mem[2].key = 0x1014; mem[2].val = 0x00; //vs 00 pe 10 ==>
		mem[3].key = 0x1814; mem[3].val = 0x00; //vs 00 pe 11 ==>

		mem[4].key = 0x0114; mem[4].val = 0x00; //vs 01 pe 00 ==>
		mem[5].key = 0x0914; mem[5].val = 0x00; //vs 01 pe 01 ==>
		mem[6].key = 0x1114; mem[6].val = 0x00; //vs 01 pe 10 ==>

		mem[7].key = 0x0214; mem[7].val = 0x00; //vs 10 pe 00 ==>
		mem[8].key = 0x0814; mem[8].val = 0x00; //vs 10 pe 10 ==>

		mem[9].key = 0x0314; mem[9].val = 0x00; //vs 11 pe 00 ==>

		//link_bw = 0x0A

		mem[10].key = 0x000A; mem[10].val = 0x00; //vs 00 pe 00 ==>
		mem[11].key = 0x080A; mem[11].val = 0x00; //vs 00 pe 01 ==>
		mem[12].key = 0x100A; mem[12].val = 0x00; //vs 00 pe 10 ==>
		mem[13].key = 0x180A; mem[13].val = 0x00; //vs 00 pe 11 ==>

		mem[14].key = 0x010A; mem[14].val = 0x00; //vs 01 pe 00 ==>
		mem[15].key = 0x090A; mem[15].val = 0x00; //vs 01 pe 01 ==>
		mem[16].key = 0x110A; mem[16].val = 0x00; //vs 01 pe 10 ==>

		mem[17].key = 0x020A; mem[17].val = 0x00; //vs 10 pe 00 ==>
		mem[18].key = 0x080A; mem[18].val = 0x00; //vs 10 pe 10 ==>

		mem[19].key = 0x030A; mem[19].val = 0x00; //vs 11 pe 00 ==>

		//link_bw = 0x06

		mem[20].key = 0x0006; mem[20].val = 0x00; //vs 00 pe 00 ==>
		mem[21].key = 0x0806; mem[21].val = 0x00; //vs 00 pe 01 ==>
		mem[22].key = 0x1006; mem[22].val = 0x00; //vs 00 pe 10 ==>
		mem[23].key = 0x1806; mem[23].val = 0x00; //vs 00 pe 11 ==>

		mem[24].key = 0x0106; mem[24].val = 0x00; //vs 01 pe 00 ==>
		mem[25].key = 0x0906; mem[25].val = 0x00; //vs 01 pe 01 ==>
		mem[26].key = 0x1106; mem[26].val = 0x00; //vs 01 pe 10 ==>

		mem[27].key = 0x0206; mem[27].val = 0x00; //vs 10 pe 00 ==>
		mem[28].key = 0x0806; mem[28].val = 0x00; //vs 10 pe 10 ==>

		mem[29].key = 0x0306; mem[29].val = 0x00; //vs 11 pe 00 ==>

	}
	else //IS_RX
	{
		//link_bw = 0x14
		mem[0].key = 0x0014; mem[0].val = 0x00; //vs 00 pe 00 ==>
		mem[1].key = 0x0814; mem[1].val = 0x00; //vs 00 pe 01 ==>
		mem[2].key = 0x1014; mem[2].val = 0x00; //vs 00 pe 10 ==>
		mem[3].key = 0x1814; mem[3].val = 0x00; //vs 00 pe 11 ==>

		mem[4].key = 0x0114; mem[4].val = 0x00; //vs 01 pe 00 ==>
		mem[5].key = 0x0914; mem[5].val = 0x00; //vs 01 pe 01 ==>
		mem[6].key = 0x1114; mem[6].val = 0x00; //vs 01 pe 10 ==>

		mem[7].key = 0x0214; mem[7].val = 0x00; //vs 10 pe 00 ==>
		mem[8].key = 0x0814; mem[8].val = 0x00; //vs 10 pe 10 ==>

		mem[9].key = 0x0314; mem[9].val = 0x00; //vs 11 pe 00 ==>

		//link_bw = 0x0A

		mem[10].key = 0x000A; mem[10].val = 0x00; //vs 00 pe 00 ==>
		mem[11].key = 0x080A; mem[11].val = 0x00; //vs 00 pe 01 ==>
		mem[12].key = 0x100A; mem[12].val = 0x00; //vs 00 pe 10 ==>
		mem[13].key = 0x180A; mem[13].val = 0x00; //vs 00 pe 11 ==>

		mem[14].key = 0x010A; mem[14].val = 0x00; //vs 01 pe 00 ==>
		mem[15].key = 0x090A; mem[15].val = 0x00; //vs 01 pe 01 ==>
		mem[16].key = 0x110A; mem[16].val = 0x00; //vs 01 pe 10 ==>

		mem[17].key = 0x020A; mem[17].val = 0x00; //vs 10 pe 00 ==>
		mem[18].key = 0x080A; mem[18].val = 0x00; //vs 10 pe 10 ==>

		mem[19].key = 0x030A; mem[19].val = 0x00; //vs 11 pe 00 ==>

		//link_bw = 0x06

		mem[20].key = 0x0006; mem[20].val = 0x00; //vs 00 pe 00 ==>
		mem[21].key = 0x0806; mem[21].val = 0x00; //vs 00 pe 01 ==>
		mem[22].key = 0x1006; mem[22].val = 0x00; //vs 00 pe 10 ==>
		mem[23].key = 0x1806; mem[23].val = 0x00; //vs 00 pe 11 ==>

		mem[24].key = 0x0106; mem[24].val = 0x00; //vs 01 pe 00 ==>
		mem[25].key = 0x0906; mem[25].val = 0x00; //vs 01 pe 01 ==>
		mem[26].key = 0x1106; mem[26].val = 0x00; //vs 01 pe 10 ==>

		mem[27].key = 0x0206; mem[27].val = 0x00; //vs 10 pe 00 ==>
		mem[28].key = 0x0806; mem[28].val = 0x00; //vs 10 pe 10 ==>

		mem[29].key = 0x0306; mem[29].val = 0x00; //vs 11 pe 00 ==>

	}
	return mem;
}




alt_u8 getval(alt_u16 key, key_val* memory){

	if(DEBUG)
	{
		printf("Getting a register value thanks to the key...\n");
	}
	alt_u16 test_key;
	alt_u8 val;

	for(int i = 0; i<NUM_KEY; i++)
	{
		test_key = memory[i].key;
		if(test_key == key){
			val = memory[i].val;
			break;
		}
	}
	return val;
}

void dp141_reprogram(link_config *p, ALT_AVALON_I2C_DEV_t *i2c_dev, key_val* memory){

	if(DEBUG)
	{
		printf("Reprogramming the DP141...\n");
	}

	alt_u16 key = getkey(p,0); //for now we assume symmetrical training lane set definition so we just compute the key of the lane 0;
	alt_u8 val = getval(key, memory);
	alt_u8 txbuffer[2] = {0x05, val}; //0x05 is the channel 1 control settings address
									  //for now we assume we are in sync_all mode
	ALT_AVALON_I2C_STATUS_CODE status;

	set_i2c_master(true);

	status = alt_avalon_i2c_master_tx(i2c_dev, txbuffer, 2,ALT_AVALON_I2C_NO_INTERRUPTS);
	if (status!=ALT_AVALON_I2C_SUCCESS)
	{
		printf("Failed to update DP141 settings!\n");
		//disable i2c master
		set_i2c_master(false);
		return;
	}

	//disable i2c master
	set_i2c_master(false);
	return;
}

