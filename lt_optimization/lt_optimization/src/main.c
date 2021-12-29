/*
 * main.c
 *
 *  Created on: 15 nov. 2021
 *      Author: Stagiaire
 */

#include <alt_types.h>
#include <altera_avalon_i2c.h>
#include <altera_avalon_pio_regs.h>
#include <stdbool.h>
#include <stdio.h>
#include <sys/alt_irq.h>
#include <system.h>
#include <io.h>

#include "i2c.h"
#include "types.h"
#include "utils.h"
#include "dp_141.h"

/*
 * Global variables to hold the edge capture values
 * _0 is for lt_active_isr
 */
volatile int edge_capture_0 = NULL;
volatile int edge_capture_1 = NULL;
/*
 * Global variables used to know which portion of code is going to be executed in the main program
 */
static volatile bool lt_start = false;
static volatile bool lt_end = false;
static volatile bool lt_redriver_program = false;
static volatile bool is_rising_edge = true;
/*
 * lt_active_isr() is the isr responding to the first PIO irq of the system
 * It is triggered at both edges of the signal lt_active_irq coming from data_handler
 */
static void lt_active_isr(void *context);

/*
 * lt_redriver_program_is() is the isr responding to the second PIO irq of the system
 * it is triggered at the rising edge of the signal lt_redriver_program_irq coming from data_handler.
 * This isr assign lt_redriver_program value to true alerting the main program that a specific function has to be executed
 */
static void lt_redriver_program_isr(void *context);


/*
 * isr_register() register the different isr of the program
 */
static void isr_register();


int main()
{
	//variables declaration:



	link_config link_config = {0,0,0,0,0,0,0};
	link_stat link_stat = {0,0,0,0,0,0,0,0};
	alt_u8 lane_count_prev; //useful to know if the general settings of the dp141 have to be changed
	ALT_AVALON_I2C_DEV_t *i2c_dev = NULL; //pointer to instance structure
	ALT_AVALON_I2C_MASTER_CONFIG_t *cfg = NULL;
	key_val* memory = NULL; //memory structure that maps a key to a value to program in the dp141 register

	//Instantiate i2c device
    i2c_dev = i2c_init(i2c_dev, cfg);

    //Instantiate the memory
    memory = memory_init();

	//interrupt register
	isr_register();

    //main loop
	while(1){
		if(lt_start){
			lt_opt_init(&link_config, &lane_count_prev, i2c_dev); //initialization of DP141
			lt_start = false;
		}
		else if(lt_end){
			lt_opt_stat(&link_stat); //Report of the statistics
			lt_end = false;
		}
		else if(lt_redriver_program){
			lt_opt_redriver_program(&link_config, &lane_count_prev, i2c_dev, memory);//programmation of the redriver
			lt_redriver_program = false;
		}
		else{
			;
		}
	}

    return 0;
}

static void lt_active_isr(void *context)
{
	/* Cast context to edge_capture's type. It is important that this
	be declared volatile to avoid unwanted compiler optimization. */
	int test = 2;

	volatile int* edge_capture_ptr_0 = (volatile int*) context;
	/*
	* Read the edge capture register on the PIO.
	* Store value.
	*/
	*edge_capture_ptr_0 = IORD_ALTERA_AVALON_PIO_EDGE_CAP(0x41460);

	if(*edge_capture_ptr_0 == 1){
		if(is_rising_edge){
			lt_start = true;
			is_rising_edge = false;
		}
		else{
			lt_end = true;
			is_rising_edge = true; 
		}
	}

	/* Write to the edge capture register to reset it. */
	IOWR_32DIRECT(0x0004160,3,0x0);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(0x00041460, 0x00000000);
	test = IORD_ALTERA_AVALON_PIO_EDGE_CAP(0x00041460);

}

static void lt_redriver_program_isr(void *context)
{
	/* Cast context to edge_capture's type. It is important that this
	be declared volatile to avoid unwanted compiler optimization. */
	volatile int* edge_capture_ptr_1 = (volatile int*) context;
	/*
	* Read the edge capture register on the PIO.
	* Store value.
	*/
	*edge_capture_ptr_1 = IORD_ALTERA_AVALON_PIO_EDGE_CAP(0x41450);
    
	if(*edge_capture_ptr_1 == 1){
		lt_redriver_program = true;
	}

	/* Write to the edge capture register to reset it. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(0x41450, 0x00000000);
}

static void isr_register()
{
	/* Recast the edge_capture pointer to match the
	alt_irq_register() function prototype. */
	void* edge_capture_ptr_0 = (void*) &edge_capture_0;
	/* Enable lt_active interrupts. */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(0x41460, 0x1); //change this value
	/* Reset the edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(0x41460, 0x0);
	/* Register the ISR. */
	alt_ic_isr_register(LT_ACTIVE_IRQ_IRQ_INTERRUPT_CONTROLLER_ID,
	LT_ACTIVE_IRQ_IRQ,
	lt_active_isr,
	edge_capture_ptr_0, 0x0);

	/*
	 * Same as above but for the second register
	 */
	void* edge_capture_ptr_1 = (void*) &edge_capture_1;
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(0x41450, 0x1);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(0x41450, 0x0);
	alt_ic_isr_register(LT_REDRIVER_PROGRAM_IRQ_IRQ_INTERRUPT_CONTROLLER_ID,
	LT_REDRIVER_PROGRAM_IRQ_IRQ,
	lt_redriver_program_isr,
	edge_capture_ptr_1, 0x0);	

}



