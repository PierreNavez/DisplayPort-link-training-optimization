/*
 * types.h
 *
 *  Created on: 17 nov. 2021
 *      Author: Stagiaire
 */

#ifndef SRC_TYPES_H_
#define SRC_TYPES_H_


typedef struct link_config{
	alt_u8 link_bw;
	alt_u8 lane_count;
	alt_u8 training_pattern;
	alt_u8 lane_0;
	alt_u8 lane_1;
	alt_u8 lane_2;
	alt_u8 lane_3;
}link_config;

typedef struct link_stat{
	alt_u8 link_bw_set;
	alt_u8 lane_count_set;
	alt_u8 clock_recovery;
	alt_u8 channel_equalization;
	alt_u8 lane_0_set;
	alt_u8 lane_1_set;
	alt_u8 lane_2_set;
	alt_u8 lane_3_set;
}link_stat;


#endif /* SRC_TYPES_H_ */
