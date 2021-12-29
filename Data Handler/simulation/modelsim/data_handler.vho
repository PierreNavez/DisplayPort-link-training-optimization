-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "10/15/2021 17:06:23"

-- 
-- Device: Altera EP4CE15F23C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	data_handler IS
    PORT (
	reset : IN std_logic;
	clk_100 : IN std_logic;
	decod_comm : IN std_logic_vector(3 DOWNTO 0);
	decod_address : IN std_logic_vector(19 DOWNTO 0);
	decod_length : IN std_logic_vector(7 DOWNTO 0);
	decod_data0 : IN std_logic_vector(7 DOWNTO 0);
	decod_data1 : IN std_logic_vector(7 DOWNTO 0);
	decod_data2 : IN std_logic_vector(7 DOWNTO 0);
	decod_data3 : IN std_logic_vector(7 DOWNTO 0);
	decod_data4 : IN std_logic_vector(7 DOWNTO 0);
	decod_data5 : IN std_logic_vector(7 DOWNTO 0);
	decod_data6 : IN std_logic_vector(7 DOWNTO 0);
	decod_comm_ready : IN std_logic;
	decod_address_ready : IN std_logic;
	decod_length_ready : IN std_logic;
	decod_data0_ready : IN std_logic;
	decod_data1_ready : IN std_logic;
	decod_data2_ready : IN std_logic;
	decod_data3_ready : IN std_logic;
	decod_data4_ready : IN std_logic;
	decod_data5_ready : IN std_logic;
	decod_data6_ready : IN std_logic;
	link_training_active : OUT std_logic;
	avm_readdata : OUT std_logic_vector(31 DOWNTO 0);
	avm_read : IN std_logic;
	avm_address : IN std_logic_vector(31 DOWNTO 0)
	);
END data_handler;

-- Design Ports Information
-- decod_length[0]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[1]	=>  Location: PIN_T1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[3]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[4]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[5]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[6]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[7]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[2]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[3]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[4]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[5]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[6]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[7]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[2]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[3]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[4]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[5]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[6]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[7]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[2]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[3]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[4]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[5]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[6]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[7]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[2]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[3]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[4]	=>  Location: PIN_N22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[5]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[6]	=>  Location: PIN_U14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[7]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[2]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[3]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[4]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[5]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[6]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[7]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[2]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[4]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[5]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[6]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[7]	=>  Location: PIN_R19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[2]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[3]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[4]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[5]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[6]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[7]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- link_training_active	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[0]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[1]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[2]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[3]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[4]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[5]	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[6]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[7]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[8]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[9]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[10]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[11]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[12]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[13]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[14]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[15]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[16]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[17]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[18]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[19]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[20]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[21]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[22]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[23]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[24]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[25]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[26]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[27]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[28]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[29]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[30]	=>  Location: PIN_K18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_readdata[31]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_read	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[0]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[1]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[2]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[3]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[4]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[5]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[6]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[7]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[8]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[9]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[10]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[11]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[12]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[13]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[14]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[15]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[16]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[17]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[18]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[19]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[20]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[21]	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[22]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[23]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[24]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[25]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[26]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[27]	=>  Location: PIN_J21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[28]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[29]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[30]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- avm_address[31]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_100	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[1]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[1]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[1]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[1]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[1]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[1]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[16]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[17]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[18]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[19]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[4]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[5]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[7]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[0]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[2]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[3]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[8]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[9]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[10]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[11]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[12]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[13]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[14]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[15]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[0]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[0]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[0]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[0]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[0]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6_ready	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5_ready	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4_ready	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3_ready	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2_ready	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0_ready	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1_ready	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm_ready	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length_ready	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address_ready	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[3]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[0]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[1]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[2]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF data_handler IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clk_100 : std_logic;
SIGNAL ww_decod_comm : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_decod_address : std_logic_vector(19 DOWNTO 0);
SIGNAL ww_decod_length : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data0 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data3 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data4 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data5 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_data6 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_decod_comm_ready : std_logic;
SIGNAL ww_decod_address_ready : std_logic;
SIGNAL ww_decod_length_ready : std_logic;
SIGNAL ww_decod_data0_ready : std_logic;
SIGNAL ww_decod_data1_ready : std_logic;
SIGNAL ww_decod_data2_ready : std_logic;
SIGNAL ww_decod_data3_ready : std_logic;
SIGNAL ww_decod_data4_ready : std_logic;
SIGNAL ww_decod_data5_ready : std_logic;
SIGNAL ww_decod_data6_ready : std_logic;
SIGNAL ww_link_training_active : std_logic;
SIGNAL ww_avm_readdata : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_avm_read : std_logic;
SIGNAL ww_avm_address : std_logic_vector(31 DOWNTO 0);
SIGNAL \clk_100~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \decod_length[0]~input_o\ : std_logic;
SIGNAL \decod_length[1]~input_o\ : std_logic;
SIGNAL \decod_length[2]~input_o\ : std_logic;
SIGNAL \decod_length[3]~input_o\ : std_logic;
SIGNAL \decod_length[4]~input_o\ : std_logic;
SIGNAL \decod_length[5]~input_o\ : std_logic;
SIGNAL \decod_length[6]~input_o\ : std_logic;
SIGNAL \decod_length[7]~input_o\ : std_logic;
SIGNAL \decod_data0[2]~input_o\ : std_logic;
SIGNAL \decod_data0[3]~input_o\ : std_logic;
SIGNAL \decod_data0[4]~input_o\ : std_logic;
SIGNAL \decod_data0[5]~input_o\ : std_logic;
SIGNAL \decod_data0[6]~input_o\ : std_logic;
SIGNAL \decod_data0[7]~input_o\ : std_logic;
SIGNAL \decod_data1[2]~input_o\ : std_logic;
SIGNAL \decod_data1[3]~input_o\ : std_logic;
SIGNAL \decod_data1[4]~input_o\ : std_logic;
SIGNAL \decod_data1[5]~input_o\ : std_logic;
SIGNAL \decod_data1[6]~input_o\ : std_logic;
SIGNAL \decod_data1[7]~input_o\ : std_logic;
SIGNAL \decod_data2[2]~input_o\ : std_logic;
SIGNAL \decod_data2[3]~input_o\ : std_logic;
SIGNAL \decod_data2[4]~input_o\ : std_logic;
SIGNAL \decod_data2[5]~input_o\ : std_logic;
SIGNAL \decod_data2[6]~input_o\ : std_logic;
SIGNAL \decod_data2[7]~input_o\ : std_logic;
SIGNAL \decod_data3[2]~input_o\ : std_logic;
SIGNAL \decod_data3[3]~input_o\ : std_logic;
SIGNAL \decod_data3[4]~input_o\ : std_logic;
SIGNAL \decod_data3[5]~input_o\ : std_logic;
SIGNAL \decod_data3[6]~input_o\ : std_logic;
SIGNAL \decod_data3[7]~input_o\ : std_logic;
SIGNAL \decod_data4[2]~input_o\ : std_logic;
SIGNAL \decod_data4[3]~input_o\ : std_logic;
SIGNAL \decod_data4[4]~input_o\ : std_logic;
SIGNAL \decod_data4[5]~input_o\ : std_logic;
SIGNAL \decod_data4[6]~input_o\ : std_logic;
SIGNAL \decod_data4[7]~input_o\ : std_logic;
SIGNAL \decod_data5[2]~input_o\ : std_logic;
SIGNAL \decod_data5[3]~input_o\ : std_logic;
SIGNAL \decod_data5[4]~input_o\ : std_logic;
SIGNAL \decod_data5[5]~input_o\ : std_logic;
SIGNAL \decod_data5[6]~input_o\ : std_logic;
SIGNAL \decod_data5[7]~input_o\ : std_logic;
SIGNAL \decod_data6[2]~input_o\ : std_logic;
SIGNAL \decod_data6[3]~input_o\ : std_logic;
SIGNAL \decod_data6[4]~input_o\ : std_logic;
SIGNAL \decod_data6[5]~input_o\ : std_logic;
SIGNAL \decod_data6[6]~input_o\ : std_logic;
SIGNAL \decod_data6[7]~input_o\ : std_logic;
SIGNAL \avm_read~input_o\ : std_logic;
SIGNAL \avm_address[0]~input_o\ : std_logic;
SIGNAL \avm_address[1]~input_o\ : std_logic;
SIGNAL \avm_address[2]~input_o\ : std_logic;
SIGNAL \avm_address[3]~input_o\ : std_logic;
SIGNAL \avm_address[4]~input_o\ : std_logic;
SIGNAL \avm_address[5]~input_o\ : std_logic;
SIGNAL \avm_address[6]~input_o\ : std_logic;
SIGNAL \avm_address[7]~input_o\ : std_logic;
SIGNAL \avm_address[8]~input_o\ : std_logic;
SIGNAL \avm_address[9]~input_o\ : std_logic;
SIGNAL \avm_address[10]~input_o\ : std_logic;
SIGNAL \avm_address[11]~input_o\ : std_logic;
SIGNAL \avm_address[12]~input_o\ : std_logic;
SIGNAL \avm_address[13]~input_o\ : std_logic;
SIGNAL \avm_address[14]~input_o\ : std_logic;
SIGNAL \avm_address[15]~input_o\ : std_logic;
SIGNAL \avm_address[16]~input_o\ : std_logic;
SIGNAL \avm_address[17]~input_o\ : std_logic;
SIGNAL \avm_address[18]~input_o\ : std_logic;
SIGNAL \avm_address[19]~input_o\ : std_logic;
SIGNAL \avm_address[20]~input_o\ : std_logic;
SIGNAL \avm_address[21]~input_o\ : std_logic;
SIGNAL \avm_address[22]~input_o\ : std_logic;
SIGNAL \avm_address[23]~input_o\ : std_logic;
SIGNAL \avm_address[24]~input_o\ : std_logic;
SIGNAL \avm_address[25]~input_o\ : std_logic;
SIGNAL \avm_address[26]~input_o\ : std_logic;
SIGNAL \avm_address[27]~input_o\ : std_logic;
SIGNAL \avm_address[28]~input_o\ : std_logic;
SIGNAL \avm_address[29]~input_o\ : std_logic;
SIGNAL \avm_address[30]~input_o\ : std_logic;
SIGNAL \avm_address[31]~input_o\ : std_logic;
SIGNAL \link_training_active~output_o\ : std_logic;
SIGNAL \avm_readdata[0]~output_o\ : std_logic;
SIGNAL \avm_readdata[1]~output_o\ : std_logic;
SIGNAL \avm_readdata[2]~output_o\ : std_logic;
SIGNAL \avm_readdata[3]~output_o\ : std_logic;
SIGNAL \avm_readdata[4]~output_o\ : std_logic;
SIGNAL \avm_readdata[5]~output_o\ : std_logic;
SIGNAL \avm_readdata[6]~output_o\ : std_logic;
SIGNAL \avm_readdata[7]~output_o\ : std_logic;
SIGNAL \avm_readdata[8]~output_o\ : std_logic;
SIGNAL \avm_readdata[9]~output_o\ : std_logic;
SIGNAL \avm_readdata[10]~output_o\ : std_logic;
SIGNAL \avm_readdata[11]~output_o\ : std_logic;
SIGNAL \avm_readdata[12]~output_o\ : std_logic;
SIGNAL \avm_readdata[13]~output_o\ : std_logic;
SIGNAL \avm_readdata[14]~output_o\ : std_logic;
SIGNAL \avm_readdata[15]~output_o\ : std_logic;
SIGNAL \avm_readdata[16]~output_o\ : std_logic;
SIGNAL \avm_readdata[17]~output_o\ : std_logic;
SIGNAL \avm_readdata[18]~output_o\ : std_logic;
SIGNAL \avm_readdata[19]~output_o\ : std_logic;
SIGNAL \avm_readdata[20]~output_o\ : std_logic;
SIGNAL \avm_readdata[21]~output_o\ : std_logic;
SIGNAL \avm_readdata[22]~output_o\ : std_logic;
SIGNAL \avm_readdata[23]~output_o\ : std_logic;
SIGNAL \avm_readdata[24]~output_o\ : std_logic;
SIGNAL \avm_readdata[25]~output_o\ : std_logic;
SIGNAL \avm_readdata[26]~output_o\ : std_logic;
SIGNAL \avm_readdata[27]~output_o\ : std_logic;
SIGNAL \avm_readdata[28]~output_o\ : std_logic;
SIGNAL \avm_readdata[29]~output_o\ : std_logic;
SIGNAL \avm_readdata[30]~output_o\ : std_logic;
SIGNAL \avm_readdata[31]~output_o\ : std_logic;
SIGNAL \clk_100~input_o\ : std_logic;
SIGNAL \clk_100~inputclkctrl_outclk\ : std_logic;
SIGNAL \decod_data4[1]~input_o\ : std_logic;
SIGNAL \decod_data3[1]~input_o\ : std_logic;
SIGNAL \decod_address_ready~input_o\ : std_logic;
SIGNAL \decod_comm[1]~input_o\ : std_logic;
SIGNAL \decod_comm[0]~input_o\ : std_logic;
SIGNAL \decod_comm[2]~input_o\ : std_logic;
SIGNAL \decod_comm[3]~input_o\ : std_logic;
SIGNAL \compute_next_state~7_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \current_state.S_LENGTH~q\ : std_logic;
SIGNAL \current_state~21_combout\ : std_logic;
SIGNAL \decod_address[14]~input_o\ : std_logic;
SIGNAL \decod_address[12]~input_o\ : std_logic;
SIGNAL \decod_address[13]~input_o\ : std_logic;
SIGNAL \decod_address[15]~input_o\ : std_logic;
SIGNAL \compute_next_state~5_combout\ : std_logic;
SIGNAL \decod_address[16]~input_o\ : std_logic;
SIGNAL \decod_address[19]~input_o\ : std_logic;
SIGNAL \decod_address[18]~input_o\ : std_logic;
SIGNAL \decod_address[17]~input_o\ : std_logic;
SIGNAL \compute_next_state~0_combout\ : std_logic;
SIGNAL \decod_address[8]~input_o\ : std_logic;
SIGNAL \decod_address[11]~input_o\ : std_logic;
SIGNAL \decod_address[10]~input_o\ : std_logic;
SIGNAL \decod_address[9]~input_o\ : std_logic;
SIGNAL \compute_next_state~4_combout\ : std_logic;
SIGNAL \decod_address[0]~input_o\ : std_logic;
SIGNAL \decod_address[4]~input_o\ : std_logic;
SIGNAL \decod_address[7]~input_o\ : std_logic;
SIGNAL \decod_address[5]~input_o\ : std_logic;
SIGNAL \decod_address[6]~input_o\ : std_logic;
SIGNAL \compute_next_state~1_combout\ : std_logic;
SIGNAL \decod_address[3]~input_o\ : std_logic;
SIGNAL \decod_address[1]~input_o\ : std_logic;
SIGNAL \decod_address[2]~input_o\ : std_logic;
SIGNAL \compute_next_state~2_combout\ : std_logic;
SIGNAL \compute_next_state~3_combout\ : std_logic;
SIGNAL \compute_next_state~6_combout\ : std_logic;
SIGNAL \current_state~19_combout\ : std_logic;
SIGNAL \current_state~20_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \useful_bytes[0]~1_combout\ : std_logic;
SIGNAL \local_data[1]~1_combout\ : std_logic;
SIGNAL \local_data[1]~2_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \current_state.S_DATA0~q\ : std_logic;
SIGNAL \local_data[1]~3_combout\ : std_logic;
SIGNAL \local_data[1]~4_combout\ : std_logic;
SIGNAL \local_data[1]~5_combout\ : std_logic;
SIGNAL \useful_bytes[31]~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \useful_bytes[13]~feeder_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \useful_bytes[14]~feeder_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \useful_bytes[31]~2_combout\ : std_logic;
SIGNAL \LessThan2~8_combout\ : std_logic;
SIGNAL \LessThan2~9_combout\ : std_logic;
SIGNAL \LessThan2~6_combout\ : std_logic;
SIGNAL \LessThan2~5_combout\ : std_logic;
SIGNAL \LessThan2~7_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \LessThan2~10_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \current_state.S_DATA4~q\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \current_state.S_DATA5~q\ : std_logic;
SIGNAL \current_state~23_combout\ : std_logic;
SIGNAL \current_state.S_DATA6~q\ : std_logic;
SIGNAL \current_state~16_combout\ : std_logic;
SIGNAL \current_state~22_combout\ : std_logic;
SIGNAL \current_state.S_IDLE~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \current_state.S_COMM~q\ : std_logic;
SIGNAL \current_state~17_combout\ : std_logic;
SIGNAL \current_state~15_combout\ : std_logic;
SIGNAL \current_state~18_combout\ : std_logic;
SIGNAL \current_state.S_ADDRESS~q\ : std_logic;
SIGNAL \decod_length_ready~input_o\ : std_logic;
SIGNAL \Selector1~8_combout\ : std_logic;
SIGNAL \Selector0~7_combout\ : std_logic;
SIGNAL \decod_comm_ready~input_o\ : std_logic;
SIGNAL \decod_data3_ready~input_o\ : std_logic;
SIGNAL \decod_data2_ready~input_o\ : std_logic;
SIGNAL \Selector0~4_combout\ : std_logic;
SIGNAL \decod_data1_ready~input_o\ : std_logic;
SIGNAL \decod_data0_ready~input_o\ : std_logic;
SIGNAL \Selector0~5_combout\ : std_logic;
SIGNAL \decod_data6_ready~input_o\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \decod_data5_ready~input_o\ : std_logic;
SIGNAL \decod_data4_ready~input_o\ : std_logic;
SIGNAL \Selector0~3_combout\ : std_logic;
SIGNAL \Selector0~6_combout\ : std_logic;
SIGNAL \Selector0~8_combout\ : std_logic;
SIGNAL \last_val~q\ : std_logic;
SIGNAL \Selector1~9_combout\ : std_logic;
SIGNAL \Selector1~11_combout\ : std_logic;
SIGNAL \Selector1~6_combout\ : std_logic;
SIGNAL \Selector1~7_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \Selector1~4_combout\ : std_logic;
SIGNAL \Selector1~5_combout\ : std_logic;
SIGNAL \Selector1~10_combout\ : std_logic;
SIGNAL \edge_detected~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \current_state.S_DATA1~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \current_state.S_DATA2~q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \current_state.S_DATA3~q\ : std_logic;
SIGNAL \Selector65~1_combout\ : std_logic;
SIGNAL \decod_data5[1]~input_o\ : std_logic;
SIGNAL \decod_data6[1]~input_o\ : std_logic;
SIGNAL \Selector65~0_combout\ : std_logic;
SIGNAL \decod_data2[1]~input_o\ : std_logic;
SIGNAL \decod_data1[1]~input_o\ : std_logic;
SIGNAL \Selector65~3_combout\ : std_logic;
SIGNAL \decod_data0[1]~input_o\ : std_logic;
SIGNAL \Selector65~2_combout\ : std_logic;
SIGNAL \Selector65~4_combout\ : std_logic;
SIGNAL \local_data[1]~0_combout\ : std_logic;
SIGNAL \local_data[1]~6_combout\ : std_logic;
SIGNAL \local_address[0]~20_combout\ : std_logic;
SIGNAL \local_address[0]~24_combout\ : std_logic;
SIGNAL \local_address[0]~25_combout\ : std_logic;
SIGNAL \local_address[0]~26_combout\ : std_logic;
SIGNAL \local_address[0]~21\ : std_logic;
SIGNAL \local_address[1]~22_combout\ : std_logic;
SIGNAL \local_address[1]~23\ : std_logic;
SIGNAL \local_address[2]~27_combout\ : std_logic;
SIGNAL \local_address[2]~28\ : std_logic;
SIGNAL \local_address[3]~29_combout\ : std_logic;
SIGNAL \local_address[3]~30\ : std_logic;
SIGNAL \local_address[4]~31_combout\ : std_logic;
SIGNAL \local_address[4]~32\ : std_logic;
SIGNAL \local_address[5]~33_combout\ : std_logic;
SIGNAL \local_address[5]~34\ : std_logic;
SIGNAL \local_address[6]~35_combout\ : std_logic;
SIGNAL \local_address[6]~36\ : std_logic;
SIGNAL \local_address[7]~37_combout\ : std_logic;
SIGNAL \local_address[7]~38\ : std_logic;
SIGNAL \local_address[8]~39_combout\ : std_logic;
SIGNAL \local_address[8]~40\ : std_logic;
SIGNAL \local_address[9]~41_combout\ : std_logic;
SIGNAL \local_address[9]~42\ : std_logic;
SIGNAL \local_address[10]~43_combout\ : std_logic;
SIGNAL \local_address[10]~44\ : std_logic;
SIGNAL \local_address[11]~45_combout\ : std_logic;
SIGNAL \local_address[11]~46\ : std_logic;
SIGNAL \local_address[12]~47_combout\ : std_logic;
SIGNAL \local_address[12]~48\ : std_logic;
SIGNAL \local_address[13]~49_combout\ : std_logic;
SIGNAL \local_address[13]~50\ : std_logic;
SIGNAL \local_address[14]~51_combout\ : std_logic;
SIGNAL \local_address[14]~52\ : std_logic;
SIGNAL \local_address[15]~53_combout\ : std_logic;
SIGNAL \local_address[15]~54\ : std_logic;
SIGNAL \local_address[16]~55_combout\ : std_logic;
SIGNAL \local_address[16]~56\ : std_logic;
SIGNAL \local_address[17]~57_combout\ : std_logic;
SIGNAL \local_address[17]~58\ : std_logic;
SIGNAL \local_address[18]~59_combout\ : std_logic;
SIGNAL \local_address[18]~60\ : std_logic;
SIGNAL \local_address[19]~61_combout\ : std_logic;
SIGNAL \reg_32_0[17]~5_combout\ : std_logic;
SIGNAL \reg_32_0[17]~3_combout\ : std_logic;
SIGNAL \reg_32_0[17]~2_combout\ : std_logic;
SIGNAL \reg_32_0[17]~1_combout\ : std_logic;
SIGNAL \local_data[1]~7_combout\ : std_logic;
SIGNAL \write_reg~q\ : std_logic;
SIGNAL \reg_32_0[17]~0_combout\ : std_logic;
SIGNAL \reg_32_0[17]~4_combout\ : std_logic;
SIGNAL \reg_32_0[17]~6_combout\ : std_logic;
SIGNAL \decod_data0[0]~input_o\ : std_logic;
SIGNAL \Selector66~2_combout\ : std_logic;
SIGNAL \decod_data6[0]~input_o\ : std_logic;
SIGNAL \decod_data5[0]~input_o\ : std_logic;
SIGNAL \Selector66~0_combout\ : std_logic;
SIGNAL \decod_data1[0]~input_o\ : std_logic;
SIGNAL \decod_data2[0]~input_o\ : std_logic;
SIGNAL \Selector66~3_combout\ : std_logic;
SIGNAL \decod_data4[0]~input_o\ : std_logic;
SIGNAL \decod_data3[0]~input_o\ : std_logic;
SIGNAL \Selector66~1_combout\ : std_logic;
SIGNAL \Selector66~4_combout\ : std_logic;
SIGNAL \reg_32_0[16]~feeder_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \link_training_active~reg0_q\ : std_logic;
SIGNAL local_address : std_logic_vector(19 DOWNTO 0);
SIGNAL reg_32_0 : std_logic_vector(31 DOWNTO 0);
SIGNAL local_data : std_logic_vector(7 DOWNTO 0);
SIGNAL useful_bytes : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_reset <= reset;
ww_clk_100 <= clk_100;
ww_decod_comm <= decod_comm;
ww_decod_address <= decod_address;
ww_decod_length <= decod_length;
ww_decod_data0 <= decod_data0;
ww_decod_data1 <= decod_data1;
ww_decod_data2 <= decod_data2;
ww_decod_data3 <= decod_data3;
ww_decod_data4 <= decod_data4;
ww_decod_data5 <= decod_data5;
ww_decod_data6 <= decod_data6;
ww_decod_comm_ready <= decod_comm_ready;
ww_decod_address_ready <= decod_address_ready;
ww_decod_length_ready <= decod_length_ready;
ww_decod_data0_ready <= decod_data0_ready;
ww_decod_data1_ready <= decod_data1_ready;
ww_decod_data2_ready <= decod_data2_ready;
ww_decod_data3_ready <= decod_data3_ready;
ww_decod_data4_ready <= decod_data4_ready;
ww_decod_data5_ready <= decod_data5_ready;
ww_decod_data6_ready <= decod_data6_ready;
link_training_active <= ww_link_training_active;
avm_readdata <= ww_avm_readdata;
ww_avm_read <= avm_read;
ww_avm_address <= avm_address;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_100~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_100~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X35_Y0_N30
\link_training_active~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \link_training_active~reg0_q\,
	devoe => ww_devoe,
	o => \link_training_active~output_o\);

-- Location: IOOBUF_X41_Y7_N2
\avm_readdata[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[0]~output_o\);

-- Location: IOOBUF_X41_Y23_N23
\avm_readdata[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[1]~output_o\);

-- Location: IOOBUF_X41_Y3_N16
\avm_readdata[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[2]~output_o\);

-- Location: IOOBUF_X41_Y26_N16
\avm_readdata[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[3]~output_o\);

-- Location: IOOBUF_X28_Y29_N16
\avm_readdata[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[4]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\avm_readdata[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[5]~output_o\);

-- Location: IOOBUF_X23_Y29_N2
\avm_readdata[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[6]~output_o\);

-- Location: IOOBUF_X9_Y29_N9
\avm_readdata[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[7]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\avm_readdata[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[8]~output_o\);

-- Location: IOOBUF_X11_Y29_N16
\avm_readdata[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[9]~output_o\);

-- Location: IOOBUF_X11_Y0_N30
\avm_readdata[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[10]~output_o\);

-- Location: IOOBUF_X41_Y27_N16
\avm_readdata[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[11]~output_o\);

-- Location: IOOBUF_X32_Y29_N23
\avm_readdata[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[12]~output_o\);

-- Location: IOOBUF_X41_Y18_N2
\avm_readdata[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[13]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\avm_readdata[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[14]~output_o\);

-- Location: IOOBUF_X41_Y14_N2
\avm_readdata[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[15]~output_o\);

-- Location: IOOBUF_X41_Y24_N23
\avm_readdata[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[16]~output_o\);

-- Location: IOOBUF_X0_Y25_N2
\avm_readdata[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[17]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\avm_readdata[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[18]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\avm_readdata[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[19]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\avm_readdata[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[20]~output_o\);

-- Location: IOOBUF_X41_Y6_N16
\avm_readdata[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[21]~output_o\);

-- Location: IOOBUF_X41_Y24_N16
\avm_readdata[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[22]~output_o\);

-- Location: IOOBUF_X3_Y29_N2
\avm_readdata[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[23]~output_o\);

-- Location: IOOBUF_X37_Y0_N16
\avm_readdata[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[24]~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\avm_readdata[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[25]~output_o\);

-- Location: IOOBUF_X32_Y29_N9
\avm_readdata[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[26]~output_o\);

-- Location: IOOBUF_X1_Y29_N9
\avm_readdata[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[27]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\avm_readdata[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[28]~output_o\);

-- Location: IOOBUF_X35_Y29_N30
\avm_readdata[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[29]~output_o\);

-- Location: IOOBUF_X41_Y21_N9
\avm_readdata[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[30]~output_o\);

-- Location: IOOBUF_X16_Y29_N16
\avm_readdata[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \avm_readdata[31]~output_o\);

-- Location: IOIBUF_X0_Y14_N8
\clk_100~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_100,
	o => \clk_100~input_o\);

-- Location: CLKCTRL_G2
\clk_100~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_100~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_100~inputclkctrl_outclk\);

-- Location: IOIBUF_X39_Y0_N8
\decod_data4[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(1),
	o => \decod_data4[1]~input_o\);

-- Location: IOIBUF_X41_Y4_N1
\decod_data3[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(1),
	o => \decod_data3[1]~input_o\);

-- Location: IOIBUF_X23_Y0_N8
\decod_address_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address_ready,
	o => \decod_address_ready~input_o\);

-- Location: IOIBUF_X19_Y0_N8
\decod_comm[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_comm(1),
	o => \decod_comm[1]~input_o\);

-- Location: IOIBUF_X19_Y0_N1
\decod_comm[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_comm(0),
	o => \decod_comm[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\decod_comm[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_comm(2),
	o => \decod_comm[2]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\decod_comm[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_comm(3),
	o => \decod_comm[3]~input_o\);

-- Location: LCCOMB_X19_Y1_N0
\compute_next_state~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~7_combout\ = (!\decod_comm[1]~input_o\ & (!\decod_comm[0]~input_o\ & (!\decod_comm[2]~input_o\ & \decod_comm[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm[1]~input_o\,
	datab => \decod_comm[0]~input_o\,
	datac => \decod_comm[2]~input_o\,
	datad => \decod_comm[3]~input_o\,
	combout => \compute_next_state~7_combout\);

-- Location: LCCOMB_X27_Y4_N0
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\edge_detected~q\ & (\current_state.S_ADDRESS~q\)) # (!\edge_detected~q\ & ((\current_state.S_LENGTH~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_ADDRESS~q\,
	datac => \current_state.S_LENGTH~q\,
	datad => \edge_detected~q\,
	combout => \Selector5~0_combout\);

-- Location: IOIBUF_X21_Y0_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X27_Y4_N1
\current_state.S_LENGTH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector5~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_LENGTH~q\);

-- Location: LCCOMB_X27_Y4_N22
\current_state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~21_combout\ = (!\current_state.S_COMM~q\ & (!\current_state.S_ADDRESS~q\ & (!\current_state.S_LENGTH~q\ & \current_state.S_IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_COMM~q\,
	datab => \current_state.S_ADDRESS~q\,
	datac => \current_state.S_LENGTH~q\,
	datad => \current_state.S_IDLE~q\,
	combout => \current_state~21_combout\);

-- Location: IOIBUF_X26_Y0_N22
\decod_address[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(14),
	o => \decod_address[14]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\decod_address[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(12),
	o => \decod_address[12]~input_o\);

-- Location: IOIBUF_X28_Y0_N29
\decod_address[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(13),
	o => \decod_address[13]~input_o\);

-- Location: IOIBUF_X41_Y2_N1
\decod_address[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(15),
	o => \decod_address[15]~input_o\);

-- Location: LCCOMB_X27_Y2_N20
\compute_next_state~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~5_combout\ = (!\decod_address[14]~input_o\ & (!\decod_address[12]~input_o\ & (!\decod_address[13]~input_o\ & !\decod_address[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[14]~input_o\,
	datab => \decod_address[12]~input_o\,
	datac => \decod_address[13]~input_o\,
	datad => \decod_address[15]~input_o\,
	combout => \compute_next_state~5_combout\);

-- Location: IOIBUF_X28_Y0_N15
\decod_address[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(16),
	o => \decod_address[16]~input_o\);

-- Location: IOIBUF_X28_Y0_N22
\decod_address[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(19),
	o => \decod_address[19]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\decod_address[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(18),
	o => \decod_address[18]~input_o\);

-- Location: IOIBUF_X21_Y0_N8
\decod_address[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(17),
	o => \decod_address[17]~input_o\);

-- Location: LCCOMB_X27_Y2_N28
\compute_next_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~0_combout\ = (!\decod_address[16]~input_o\ & (!\decod_address[19]~input_o\ & (!\decod_address[18]~input_o\ & !\decod_address[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[16]~input_o\,
	datab => \decod_address[19]~input_o\,
	datac => \decod_address[18]~input_o\,
	datad => \decod_address[17]~input_o\,
	combout => \compute_next_state~0_combout\);

-- Location: IOIBUF_X26_Y0_N1
\decod_address[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(8),
	o => \decod_address[8]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\decod_address[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(11),
	o => \decod_address[11]~input_o\);

-- Location: IOIBUF_X28_Y0_N8
\decod_address[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(10),
	o => \decod_address[10]~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\decod_address[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(9),
	o => \decod_address[9]~input_o\);

-- Location: LCCOMB_X27_Y2_N22
\compute_next_state~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~4_combout\ = (\decod_address[8]~input_o\ & (!\decod_address[11]~input_o\ & (!\decod_address[10]~input_o\ & !\decod_address[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[8]~input_o\,
	datab => \decod_address[11]~input_o\,
	datac => \decod_address[10]~input_o\,
	datad => \decod_address[9]~input_o\,
	combout => \compute_next_state~4_combout\);

-- Location: IOIBUF_X26_Y0_N29
\decod_address[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(0),
	o => \decod_address[0]~input_o\);

-- Location: IOIBUF_X23_Y0_N22
\decod_address[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(4),
	o => \decod_address[4]~input_o\);

-- Location: IOIBUF_X19_Y0_N29
\decod_address[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(7),
	o => \decod_address[7]~input_o\);

-- Location: IOIBUF_X35_Y0_N15
\decod_address[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(5),
	o => \decod_address[5]~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\decod_address[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(6),
	o => \decod_address[6]~input_o\);

-- Location: LCCOMB_X27_Y3_N8
\compute_next_state~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~1_combout\ = (!\decod_address[4]~input_o\ & (!\decod_address[7]~input_o\ & (!\decod_address[5]~input_o\ & !\decod_address[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[4]~input_o\,
	datab => \decod_address[7]~input_o\,
	datac => \decod_address[5]~input_o\,
	datad => \decod_address[6]~input_o\,
	combout => \compute_next_state~1_combout\);

-- Location: IOIBUF_X30_Y0_N15
\decod_address[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(3),
	o => \decod_address[3]~input_o\);

-- Location: IOIBUF_X41_Y3_N1
\decod_address[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(1),
	o => \decod_address[1]~input_o\);

-- Location: IOIBUF_X19_Y0_N15
\decod_address[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_address(2),
	o => \decod_address[2]~input_o\);

-- Location: LCCOMB_X27_Y3_N2
\compute_next_state~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~2_combout\ = (\decod_address[1]~input_o\ & \decod_address[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \decod_address[1]~input_o\,
	datac => \decod_address[2]~input_o\,
	combout => \compute_next_state~2_combout\);

-- Location: LCCOMB_X27_Y3_N4
\compute_next_state~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~3_combout\ = (\compute_next_state~1_combout\ & (!\decod_address[3]~input_o\ & ((!\compute_next_state~2_combout\) # (!\decod_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[0]~input_o\,
	datab => \compute_next_state~1_combout\,
	datac => \decod_address[3]~input_o\,
	datad => \compute_next_state~2_combout\,
	combout => \compute_next_state~3_combout\);

-- Location: LCCOMB_X27_Y2_N26
\compute_next_state~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \compute_next_state~6_combout\ = (\compute_next_state~5_combout\ & (\compute_next_state~0_combout\ & (\compute_next_state~4_combout\ & \compute_next_state~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \compute_next_state~5_combout\,
	datab => \compute_next_state~0_combout\,
	datac => \compute_next_state~4_combout\,
	datad => \compute_next_state~3_combout\,
	combout => \compute_next_state~6_combout\);

-- Location: LCCOMB_X27_Y4_N14
\current_state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~19_combout\ = (!\current_state.S_IDLE~q\ & (((!\current_state.S_COMM~q\ & !\compute_next_state~7_combout\)) # (!\edge_detected~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \current_state.S_COMM~q\,
	datac => \compute_next_state~7_combout\,
	datad => \current_state.S_IDLE~q\,
	combout => \current_state~19_combout\);

-- Location: LCCOMB_X27_Y4_N24
\current_state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~20_combout\ = (\current_state~19_combout\) # ((\edge_detected~q\ & (!\compute_next_state~6_combout\ & \current_state.S_COMM~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \compute_next_state~6_combout\,
	datac => \current_state~19_combout\,
	datad => \current_state.S_COMM~q\,
	combout => \current_state~20_combout\);

-- Location: LCCOMB_X27_Y8_N0
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = useful_bytes(0) $ (GND)
-- \Add0~1\ = CARRY(!useful_bytes(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X28_Y8_N14
\useful_bytes[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \useful_bytes[0]~1_combout\ = !\Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~0_combout\,
	combout => \useful_bytes[0]~1_combout\);

-- Location: LCCOMB_X29_Y4_N8
\local_data[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~1_combout\ = (!\current_state.S_DATA3~q\ & !\current_state.S_DATA4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.S_DATA3~q\,
	datad => \current_state.S_DATA4~q\,
	combout => \local_data[1]~1_combout\);

-- Location: LCCOMB_X28_Y7_N30
\local_data[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~2_combout\ = ((\LessThan2~10_combout\) # ((!\current_state.S_DATA2~q\ & \local_data[1]~1_combout\))) # (!\edge_detected~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA2~q\,
	datab => \edge_detected~q\,
	datac => \local_data[1]~1_combout\,
	datad => \LessThan2~10_combout\,
	combout => \local_data[1]~2_combout\);

-- Location: LCCOMB_X29_Y4_N4
\Selector6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (\edge_detected~q\ & (\current_state.S_LENGTH~q\)) # (!\edge_detected~q\ & (((\current_state.S_DATA0~q\ & !\LessThan2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \current_state.S_LENGTH~q\,
	datac => \current_state.S_DATA0~q\,
	datad => \LessThan2~10_combout\,
	combout => \Selector6~2_combout\);

-- Location: FF_X29_Y4_N5
\current_state.S_DATA0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector6~2_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA0~q\);

-- Location: LCCOMB_X27_Y4_N20
\local_data[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~3_combout\ = (!\edge_detected~q\) # (!\current_state.S_LENGTH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_LENGTH~q\,
	datad => \edge_detected~q\,
	combout => \local_data[1]~3_combout\);

-- Location: LCCOMB_X28_Y7_N28
\local_data[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~4_combout\ = (\edge_detected~q\ & !\LessThan2~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \edge_detected~q\,
	datad => \LessThan2~10_combout\,
	combout => \local_data[1]~4_combout\);

-- Location: LCCOMB_X28_Y7_N18
\local_data[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~5_combout\ = (\local_data[1]~3_combout\ & (((!\current_state.S_DATA0~q\ & !\current_state.S_DATA1~q\)) # (!\local_data[1]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA0~q\,
	datab => \local_data[1]~3_combout\,
	datac => \current_state.S_DATA1~q\,
	datad => \local_data[1]~4_combout\,
	combout => \local_data[1]~5_combout\);

-- Location: LCCOMB_X28_Y7_N10
\useful_bytes[31]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \useful_bytes[31]~0_combout\ = (!\reset~input_o\ & ((!\local_data[1]~5_combout\) # (!\local_data[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \local_data[1]~2_combout\,
	datad => \local_data[1]~5_combout\,
	combout => \useful_bytes[31]~0_combout\);

-- Location: FF_X27_Y8_N29
\useful_bytes[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	asdata => \useful_bytes[0]~1_combout\,
	sload => VCC,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(0));

-- Location: LCCOMB_X27_Y8_N2
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (useful_bytes(1) & (\Add0~1\ & VCC)) # (!useful_bytes(1) & (!\Add0~1\))
-- \Add0~3\ = CARRY((!useful_bytes(1) & !\Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X27_Y8_N3
\useful_bytes[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~2_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(1));

-- Location: LCCOMB_X27_Y8_N4
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (useful_bytes(2) & ((GND) # (!\Add0~3\))) # (!useful_bytes(2) & (\Add0~3\ $ (GND)))
-- \Add0~5\ = CARRY((useful_bytes(2)) # (!\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X27_Y8_N5
\useful_bytes[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~4_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(2));

-- Location: LCCOMB_X27_Y8_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (useful_bytes(3) & (\Add0~5\ & VCC)) # (!useful_bytes(3) & (!\Add0~5\))
-- \Add0~7\ = CARRY((!useful_bytes(3) & !\Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: FF_X27_Y8_N7
\useful_bytes[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~6_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(3));

-- Location: LCCOMB_X27_Y8_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (useful_bytes(4) & ((GND) # (!\Add0~7\))) # (!useful_bytes(4) & (\Add0~7\ $ (GND)))
-- \Add0~9\ = CARRY((useful_bytes(4)) # (!\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: FF_X27_Y8_N9
\useful_bytes[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~8_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(4));

-- Location: LCCOMB_X27_Y8_N10
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (useful_bytes(5) & (\Add0~9\ & VCC)) # (!useful_bytes(5) & (!\Add0~9\))
-- \Add0~11\ = CARRY((!useful_bytes(5) & !\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X27_Y8_N11
\useful_bytes[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~10_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(5));

-- Location: LCCOMB_X27_Y8_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (useful_bytes(6) & ((GND) # (!\Add0~11\))) # (!useful_bytes(6) & (\Add0~11\ $ (GND)))
-- \Add0~13\ = CARRY((useful_bytes(6)) # (!\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X27_Y8_N13
\useful_bytes[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~12_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(6));

-- Location: LCCOMB_X27_Y8_N14
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (useful_bytes(7) & (\Add0~13\ & VCC)) # (!useful_bytes(7) & (!\Add0~13\))
-- \Add0~15\ = CARRY((!useful_bytes(7) & !\Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: FF_X27_Y8_N15
\useful_bytes[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~14_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(7));

-- Location: LCCOMB_X27_Y8_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (useful_bytes(8) & ((GND) # (!\Add0~15\))) # (!useful_bytes(8) & (\Add0~15\ $ (GND)))
-- \Add0~17\ = CARRY((useful_bytes(8)) # (!\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: FF_X27_Y8_N17
\useful_bytes[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~16_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(8));

-- Location: LCCOMB_X27_Y8_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (useful_bytes(9) & (\Add0~17\ & VCC)) # (!useful_bytes(9) & (!\Add0~17\))
-- \Add0~19\ = CARRY((!useful_bytes(9) & !\Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: FF_X27_Y8_N19
\useful_bytes[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~18_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(9));

-- Location: LCCOMB_X27_Y8_N20
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (useful_bytes(10) & ((GND) # (!\Add0~19\))) # (!useful_bytes(10) & (\Add0~19\ $ (GND)))
-- \Add0~21\ = CARRY((useful_bytes(10)) # (!\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: FF_X27_Y8_N21
\useful_bytes[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~20_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(10));

-- Location: LCCOMB_X27_Y8_N22
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (useful_bytes(11) & (\Add0~21\ & VCC)) # (!useful_bytes(11) & (!\Add0~21\))
-- \Add0~23\ = CARRY((!useful_bytes(11) & !\Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: FF_X27_Y8_N23
\useful_bytes[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~22_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(11));

-- Location: LCCOMB_X27_Y8_N24
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (useful_bytes(12) & ((GND) # (!\Add0~23\))) # (!useful_bytes(12) & (\Add0~23\ $ (GND)))
-- \Add0~25\ = CARRY((useful_bytes(12)) # (!\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: FF_X27_Y8_N25
\useful_bytes[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~24_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(12));

-- Location: LCCOMB_X27_Y8_N26
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (useful_bytes(13) & (\Add0~25\ & VCC)) # (!useful_bytes(13) & (!\Add0~25\))
-- \Add0~27\ = CARRY((!useful_bytes(13) & !\Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X28_Y8_N26
\useful_bytes[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \useful_bytes[13]~feeder_combout\ = \Add0~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~26_combout\,
	combout => \useful_bytes[13]~feeder_combout\);

-- Location: FF_X28_Y8_N27
\useful_bytes[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \useful_bytes[13]~feeder_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(13));

-- Location: LCCOMB_X27_Y8_N28
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (useful_bytes(14) & ((GND) # (!\Add0~27\))) # (!useful_bytes(14) & (\Add0~27\ $ (GND)))
-- \Add0~29\ = CARRY((useful_bytes(14)) # (!\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X28_Y8_N8
\useful_bytes[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \useful_bytes[14]~feeder_combout\ = \Add0~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add0~28_combout\,
	combout => \useful_bytes[14]~feeder_combout\);

-- Location: FF_X28_Y8_N9
\useful_bytes[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \useful_bytes[14]~feeder_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(14));

-- Location: LCCOMB_X27_Y8_N30
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (useful_bytes(15) & (\Add0~29\ & VCC)) # (!useful_bytes(15) & (!\Add0~29\))
-- \Add0~31\ = CARRY((!useful_bytes(15) & !\Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: FF_X27_Y8_N31
\useful_bytes[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~30_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(15));

-- Location: LCCOMB_X27_Y7_N0
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (useful_bytes(16) & ((GND) # (!\Add0~31\))) # (!useful_bytes(16) & (\Add0~31\ $ (GND)))
-- \Add0~33\ = CARRY((useful_bytes(16)) # (!\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: FF_X27_Y7_N1
\useful_bytes[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~32_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(16));

-- Location: LCCOMB_X27_Y7_N2
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (useful_bytes(17) & (\Add0~33\ & VCC)) # (!useful_bytes(17) & (!\Add0~33\))
-- \Add0~35\ = CARRY((!useful_bytes(17) & !\Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: FF_X27_Y7_N3
\useful_bytes[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~34_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(17));

-- Location: LCCOMB_X27_Y7_N4
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (useful_bytes(18) & ((GND) # (!\Add0~35\))) # (!useful_bytes(18) & (\Add0~35\ $ (GND)))
-- \Add0~37\ = CARRY((useful_bytes(18)) # (!\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: FF_X27_Y7_N5
\useful_bytes[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~36_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(18));

-- Location: LCCOMB_X27_Y7_N6
\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (useful_bytes(19) & (\Add0~37\ & VCC)) # (!useful_bytes(19) & (!\Add0~37\))
-- \Add0~39\ = CARRY((!useful_bytes(19) & !\Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: FF_X27_Y7_N7
\useful_bytes[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~38_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(19));

-- Location: LCCOMB_X27_Y7_N8
\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (useful_bytes(20) & ((GND) # (!\Add0~39\))) # (!useful_bytes(20) & (\Add0~39\ $ (GND)))
-- \Add0~41\ = CARRY((useful_bytes(20)) # (!\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: FF_X27_Y7_N9
\useful_bytes[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~40_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(20));

-- Location: LCCOMB_X27_Y7_N10
\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (useful_bytes(21) & (\Add0~41\ & VCC)) # (!useful_bytes(21) & (!\Add0~41\))
-- \Add0~43\ = CARRY((!useful_bytes(21) & !\Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: FF_X27_Y7_N11
\useful_bytes[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~42_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(21));

-- Location: LCCOMB_X27_Y7_N12
\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (useful_bytes(22) & ((GND) # (!\Add0~43\))) # (!useful_bytes(22) & (\Add0~43\ $ (GND)))
-- \Add0~45\ = CARRY((useful_bytes(22)) # (!\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(22),
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: FF_X27_Y7_N13
\useful_bytes[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~44_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(22));

-- Location: LCCOMB_X27_Y7_N14
\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (useful_bytes(23) & (\Add0~45\ & VCC)) # (!useful_bytes(23) & (!\Add0~45\))
-- \Add0~47\ = CARRY((!useful_bytes(23) & !\Add0~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(23),
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: FF_X27_Y7_N15
\useful_bytes[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~46_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(23));

-- Location: LCCOMB_X27_Y7_N16
\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (useful_bytes(24) & ((GND) # (!\Add0~47\))) # (!useful_bytes(24) & (\Add0~47\ $ (GND)))
-- \Add0~49\ = CARRY((useful_bytes(24)) # (!\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(24),
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: FF_X27_Y7_N17
\useful_bytes[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~48_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(24));

-- Location: LCCOMB_X27_Y7_N18
\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (useful_bytes(25) & (\Add0~49\ & VCC)) # (!useful_bytes(25) & (!\Add0~49\))
-- \Add0~51\ = CARRY((!useful_bytes(25) & !\Add0~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(25),
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: FF_X27_Y7_N19
\useful_bytes[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~50_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(25));

-- Location: LCCOMB_X27_Y7_N20
\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (useful_bytes(26) & ((GND) # (!\Add0~51\))) # (!useful_bytes(26) & (\Add0~51\ $ (GND)))
-- \Add0~53\ = CARRY((useful_bytes(26)) # (!\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(26),
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: FF_X27_Y7_N21
\useful_bytes[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~52_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(26));

-- Location: LCCOMB_X27_Y7_N22
\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (useful_bytes(27) & (\Add0~53\ & VCC)) # (!useful_bytes(27) & (!\Add0~53\))
-- \Add0~55\ = CARRY((!useful_bytes(27) & !\Add0~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(27),
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: FF_X27_Y7_N23
\useful_bytes[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~54_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(27));

-- Location: LCCOMB_X27_Y7_N24
\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (useful_bytes(28) & ((GND) # (!\Add0~55\))) # (!useful_bytes(28) & (\Add0~55\ $ (GND)))
-- \Add0~57\ = CARRY((useful_bytes(28)) # (!\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(28),
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: FF_X27_Y7_N25
\useful_bytes[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~56_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(28));

-- Location: LCCOMB_X27_Y7_N26
\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (useful_bytes(29) & (\Add0~57\ & VCC)) # (!useful_bytes(29) & (!\Add0~57\))
-- \Add0~59\ = CARRY((!useful_bytes(29) & !\Add0~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(29),
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: FF_X27_Y7_N27
\useful_bytes[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~58_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(29));

-- Location: LCCOMB_X27_Y7_N28
\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (useful_bytes(30) & ((GND) # (!\Add0~59\))) # (!useful_bytes(30) & (\Add0~59\ $ (GND)))
-- \Add0~61\ = CARRY((useful_bytes(30)) # (!\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => useful_bytes(30),
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: FF_X27_Y7_N29
\useful_bytes[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Add0~60_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(30));

-- Location: LCCOMB_X27_Y7_N30
\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \Add0~61\ $ (useful_bytes(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => useful_bytes(31),
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X26_Y7_N2
\useful_bytes[31]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \useful_bytes[31]~2_combout\ = !\Add0~62_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~62_combout\,
	combout => \useful_bytes[31]~2_combout\);

-- Location: FF_X26_Y7_N3
\useful_bytes[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \useful_bytes[31]~2_combout\,
	ena => \useful_bytes[31]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => useful_bytes(31));

-- Location: LCCOMB_X28_Y7_N26
\LessThan2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~8_combout\ = (!useful_bytes(24) & (!useful_bytes(27) & (!useful_bytes(26) & !useful_bytes(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(24),
	datab => useful_bytes(27),
	datac => useful_bytes(26),
	datad => useful_bytes(25),
	combout => \LessThan2~8_combout\);

-- Location: LCCOMB_X28_Y7_N4
\LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~9_combout\ = (!useful_bytes(29) & (!useful_bytes(30) & (\LessThan2~8_combout\ & !useful_bytes(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(29),
	datab => useful_bytes(30),
	datac => \LessThan2~8_combout\,
	datad => useful_bytes(28),
	combout => \LessThan2~9_combout\);

-- Location: LCCOMB_X28_Y7_N22
\LessThan2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~6_combout\ = (!useful_bytes(1) & !useful_bytes(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => useful_bytes(1),
	datad => useful_bytes(2),
	combout => \LessThan2~6_combout\);

-- Location: LCCOMB_X28_Y8_N4
\LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~5_combout\ = (!useful_bytes(6) & (!useful_bytes(3) & (!useful_bytes(5) & !useful_bytes(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(6),
	datab => useful_bytes(3),
	datac => useful_bytes(5),
	datad => useful_bytes(4),
	combout => \LessThan2~5_combout\);

-- Location: LCCOMB_X28_Y7_N8
\LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~7_combout\ = (useful_bytes(0) & (!useful_bytes(23) & (\LessThan2~6_combout\ & \LessThan2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(0),
	datab => useful_bytes(23),
	datac => \LessThan2~6_combout\,
	datad => \LessThan2~5_combout\,
	combout => \LessThan2~7_combout\);

-- Location: LCCOMB_X28_Y8_N30
\LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (!useful_bytes(7) & (!useful_bytes(10) & (!useful_bytes(8) & !useful_bytes(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(7),
	datab => useful_bytes(10),
	datac => useful_bytes(8),
	datad => useful_bytes(9),
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X28_Y7_N14
\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (!useful_bytes(17) & (!useful_bytes(18) & (!useful_bytes(15) & !useful_bytes(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(17),
	datab => useful_bytes(18),
	datac => useful_bytes(15),
	datad => useful_bytes(16),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X28_Y8_N28
\LessThan2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (!useful_bytes(13) & (!useful_bytes(11) & (!useful_bytes(14) & !useful_bytes(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(13),
	datab => useful_bytes(11),
	datac => useful_bytes(14),
	datad => useful_bytes(12),
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X26_Y7_N4
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!useful_bytes(19) & (!useful_bytes(20) & (!useful_bytes(22) & !useful_bytes(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(19),
	datab => useful_bytes(20),
	datac => useful_bytes(22),
	datad => useful_bytes(21),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X28_Y7_N16
\LessThan2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (\LessThan2~3_combout\ & (\LessThan2~1_combout\ & (\LessThan2~2_combout\ & \LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~3_combout\,
	datab => \LessThan2~1_combout\,
	datac => \LessThan2~2_combout\,
	datad => \LessThan2~0_combout\,
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X28_Y7_N2
\LessThan2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~10_combout\ = ((\LessThan2~9_combout\ & (\LessThan2~7_combout\ & \LessThan2~4_combout\))) # (!useful_bytes(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => useful_bytes(31),
	datab => \LessThan2~9_combout\,
	datac => \LessThan2~7_combout\,
	datad => \LessThan2~4_combout\,
	combout => \LessThan2~10_combout\);

-- Location: LCCOMB_X29_Y4_N28
\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (!\LessThan2~10_combout\ & ((\edge_detected~q\ & (\current_state.S_DATA3~q\)) # (!\edge_detected~q\ & ((\current_state.S_DATA4~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~10_combout\,
	datab => \current_state.S_DATA3~q\,
	datac => \current_state.S_DATA4~q\,
	datad => \edge_detected~q\,
	combout => \Selector10~0_combout\);

-- Location: FF_X29_Y4_N29
\current_state.S_DATA4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA4~q\);

-- Location: LCCOMB_X29_Y4_N22
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (!\LessThan2~10_combout\ & ((\edge_detected~q\ & (\current_state.S_DATA4~q\)) # (!\edge_detected~q\ & ((\current_state.S_DATA5~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \current_state.S_DATA4~q\,
	datac => \current_state.S_DATA5~q\,
	datad => \LessThan2~10_combout\,
	combout => \Selector11~0_combout\);

-- Location: FF_X29_Y4_N23
\current_state.S_DATA5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector11~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA5~q\);

-- Location: LCCOMB_X28_Y4_N24
\current_state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~23_combout\ = (!\reset~input_o\ & (\current_state.S_DATA5~q\ & (!\LessThan2~10_combout\ & \edge_detected~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \current_state.S_DATA5~q\,
	datac => \LessThan2~10_combout\,
	datad => \edge_detected~q\,
	combout => \current_state~23_combout\);

-- Location: FF_X28_Y4_N25
\current_state.S_DATA6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA6~q\);

-- Location: LCCOMB_X27_Y4_N4
\current_state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~16_combout\ = (!\reset~input_o\ & !\current_state.S_DATA6~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \current_state.S_DATA6~q\,
	combout => \current_state~16_combout\);

-- Location: LCCOMB_X27_Y4_N16
\current_state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~22_combout\ = (!\current_state~20_combout\ & (\current_state~16_combout\ & ((!\LessThan2~10_combout\) # (!\current_state~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~21_combout\,
	datab => \current_state~20_combout\,
	datac => \current_state~16_combout\,
	datad => \LessThan2~10_combout\,
	combout => \current_state~22_combout\);

-- Location: FF_X27_Y4_N17
\current_state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \current_state~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_IDLE~q\);

-- Location: LCCOMB_X27_Y4_N28
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\edge_detected~q\ & (\compute_next_state~7_combout\ & ((!\current_state.S_IDLE~q\)))) # (!\edge_detected~q\ & (((\current_state.S_COMM~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \compute_next_state~7_combout\,
	datac => \current_state.S_COMM~q\,
	datad => \current_state.S_IDLE~q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X27_Y4_N29
\current_state.S_COMM\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_COMM~q\);

-- Location: LCCOMB_X27_Y4_N26
\current_state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~17_combout\ = (\edge_detected~q\ & ((\current_state.S_COMM~q\) # ((\compute_next_state~7_combout\) # (\current_state.S_IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \current_state.S_COMM~q\,
	datac => \compute_next_state~7_combout\,
	datad => \current_state.S_IDLE~q\,
	combout => \current_state~17_combout\);

-- Location: LCCOMB_X27_Y4_N30
\current_state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~15_combout\ = (\current_state.S_COMM~q\ & (\compute_next_state~6_combout\ & \edge_detected~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_COMM~q\,
	datac => \compute_next_state~6_combout\,
	datad => \edge_detected~q\,
	combout => \current_state~15_combout\);

-- Location: LCCOMB_X27_Y4_N2
\current_state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~18_combout\ = (\current_state~16_combout\ & ((\current_state~15_combout\) # ((!\current_state~17_combout\ & \current_state.S_ADDRESS~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~17_combout\,
	datab => \current_state~16_combout\,
	datac => \current_state.S_ADDRESS~q\,
	datad => \current_state~15_combout\,
	combout => \current_state~18_combout\);

-- Location: FF_X27_Y4_N3
\current_state.S_ADDRESS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \current_state~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_ADDRESS~q\);

-- Location: IOIBUF_X26_Y29_N1
\decod_length_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length_ready,
	o => \decod_length_ready~input_o\);

-- Location: LCCOMB_X27_Y4_N18
\Selector1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~8_combout\ = (\decod_address_ready~input_o\ & ((\current_state.S_COMM~q\) # ((\current_state.S_ADDRESS~q\ & \decod_length_ready~input_o\)))) # (!\decod_address_ready~input_o\ & (\current_state.S_ADDRESS~q\ & (\decod_length_ready~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address_ready~input_o\,
	datab => \current_state.S_ADDRESS~q\,
	datac => \decod_length_ready~input_o\,
	datad => \current_state.S_COMM~q\,
	combout => \Selector1~8_combout\);

-- Location: LCCOMB_X27_Y4_N12
\Selector0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~7_combout\ = (\decod_length_ready~input_o\ & ((\current_state.S_ADDRESS~q\) # (\current_state.S_COMM~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_ADDRESS~q\,
	datac => \decod_length_ready~input_o\,
	datad => \current_state.S_COMM~q\,
	combout => \Selector0~7_combout\);

-- Location: IOIBUF_X35_Y0_N1
\decod_comm_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_comm_ready,
	o => \decod_comm_ready~input_o\);

-- Location: IOIBUF_X32_Y0_N1
\decod_data3_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3_ready,
	o => \decod_data3_ready~input_o\);

-- Location: IOIBUF_X30_Y0_N22
\decod_data2_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2_ready,
	o => \decod_data2_ready~input_o\);

-- Location: LCCOMB_X28_Y4_N12
\Selector0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~4_combout\ = (\current_state.S_DATA1~q\ & ((\decod_data2_ready~input_o\) # ((\decod_data3_ready~input_o\ & \current_state.S_DATA2~q\)))) # (!\current_state.S_DATA1~q\ & (\decod_data3_ready~input_o\ & ((\current_state.S_DATA2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datab => \decod_data3_ready~input_o\,
	datac => \decod_data2_ready~input_o\,
	datad => \current_state.S_DATA2~q\,
	combout => \Selector0~4_combout\);

-- Location: IOIBUF_X32_Y0_N29
\decod_data1_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1_ready,
	o => \decod_data1_ready~input_o\);

-- Location: IOIBUF_X35_Y0_N8
\decod_data0_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0_ready,
	o => \decod_data0_ready~input_o\);

-- Location: LCCOMB_X28_Y4_N14
\Selector0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~5_combout\ = (\current_state.S_DATA0~q\ & ((\decod_data1_ready~input_o\) # ((\current_state.S_LENGTH~q\ & \decod_data0_ready~input_o\)))) # (!\current_state.S_DATA0~q\ & (((\current_state.S_LENGTH~q\ & \decod_data0_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA0~q\,
	datab => \decod_data1_ready~input_o\,
	datac => \current_state.S_LENGTH~q\,
	datad => \decod_data0_ready~input_o\,
	combout => \Selector0~5_combout\);

-- Location: IOIBUF_X32_Y0_N8
\decod_data6_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6_ready,
	o => \decod_data6_ready~input_o\);

-- Location: LCCOMB_X28_Y4_N8
\Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\current_state.S_DATA6~q\ & ((\last_val~q\) # ((\current_state.S_DATA5~q\ & \decod_data6_ready~input_o\)))) # (!\current_state.S_DATA6~q\ & (\current_state.S_DATA5~q\ & ((\decod_data6_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA6~q\,
	datab => \current_state.S_DATA5~q\,
	datac => \last_val~q\,
	datad => \decod_data6_ready~input_o\,
	combout => \Selector0~2_combout\);

-- Location: IOIBUF_X32_Y0_N22
\decod_data5_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5_ready,
	o => \decod_data5_ready~input_o\);

-- Location: IOIBUF_X32_Y0_N15
\decod_data4_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4_ready,
	o => \decod_data4_ready~input_o\);

-- Location: LCCOMB_X28_Y4_N6
\Selector0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~3_combout\ = (\decod_data5_ready~input_o\ & ((\current_state.S_DATA4~q\) # ((\decod_data4_ready~input_o\ & \current_state.S_DATA3~q\)))) # (!\decod_data5_ready~input_o\ & (\decod_data4_ready~input_o\ & (\current_state.S_DATA3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5_ready~input_o\,
	datab => \decod_data4_ready~input_o\,
	datac => \current_state.S_DATA3~q\,
	datad => \current_state.S_DATA4~q\,
	combout => \Selector0~3_combout\);

-- Location: LCCOMB_X28_Y4_N20
\Selector0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~6_combout\ = (\Selector0~4_combout\) # ((\Selector0~5_combout\) # ((\Selector0~2_combout\) # (\Selector0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~4_combout\,
	datab => \Selector0~5_combout\,
	datac => \Selector0~2_combout\,
	datad => \Selector0~3_combout\,
	combout => \Selector0~6_combout\);

-- Location: LCCOMB_X28_Y4_N4
\Selector0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~8_combout\ = (\Selector0~7_combout\) # ((\Selector0~6_combout\) # ((\decod_comm_ready~input_o\ & !\current_state.S_IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~7_combout\,
	datab => \decod_comm_ready~input_o\,
	datac => \current_state.S_IDLE~q\,
	datad => \Selector0~6_combout\,
	combout => \Selector0~8_combout\);

-- Location: FF_X28_Y4_N5
last_val : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector0~8_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \last_val~q\);

-- Location: LCCOMB_X28_Y4_N2
\Selector1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~9_combout\ = (\edge_detected~q\ & ((\current_state.S_DATA6~q\) # ((\Selector1~8_combout\ & !\last_val~q\)))) # (!\edge_detected~q\ & (\Selector1~8_combout\ & (!\last_val~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \Selector1~8_combout\,
	datac => \last_val~q\,
	datad => \current_state.S_DATA6~q\,
	combout => \Selector1~9_combout\);

-- Location: LCCOMB_X28_Y4_N10
\Selector1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~11_combout\ = (\current_state.S_DATA0~q\ & ((\decod_data1_ready~input_o\) # ((!\current_state.S_IDLE~q\ & \decod_comm_ready~input_o\)))) # (!\current_state.S_DATA0~q\ & (((!\current_state.S_IDLE~q\ & \decod_comm_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA0~q\,
	datab => \decod_data1_ready~input_o\,
	datac => \current_state.S_IDLE~q\,
	datad => \decod_comm_ready~input_o\,
	combout => \Selector1~11_combout\);

-- Location: LCCOMB_X28_Y4_N28
\Selector1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~6_combout\ = (\Selector1~11_combout\) # ((\decod_data0_ready~input_o\ & \current_state.S_LENGTH~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \decod_data0_ready~input_o\,
	datac => \current_state.S_LENGTH~q\,
	datad => \Selector1~11_combout\,
	combout => \Selector1~6_combout\);

-- Location: LCCOMB_X28_Y4_N22
\Selector1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~7_combout\ = (!\last_val~q\ & ((\Selector1~6_combout\) # ((\current_state.S_DATA1~q\ & \decod_data2_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datab => \last_val~q\,
	datac => \decod_data2_ready~input_o\,
	datad => \Selector1~6_combout\,
	combout => \Selector1~7_combout\);

-- Location: LCCOMB_X28_Y4_N16
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\decod_data6_ready~input_o\ & (!\last_val~q\ & \current_state.S_DATA5~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \decod_data6_ready~input_o\,
	datac => \last_val~q\,
	datad => \current_state.S_DATA5~q\,
	combout => \Selector1~2_combout\);

-- Location: LCCOMB_X28_Y4_N30
\Selector1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (\Selector1~2_combout\) # ((\decod_data5_ready~input_o\ & (!\last_val~q\ & \current_state.S_DATA4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5_ready~input_o\,
	datab => \Selector1~2_combout\,
	datac => \last_val~q\,
	datad => \current_state.S_DATA4~q\,
	combout => \Selector1~3_combout\);

-- Location: LCCOMB_X28_Y4_N0
\Selector1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~4_combout\ = (\current_state.S_DATA3~q\ & (\decod_data4_ready~input_o\ & !\last_val~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA3~q\,
	datab => \decod_data4_ready~input_o\,
	datac => \last_val~q\,
	combout => \Selector1~4_combout\);

-- Location: LCCOMB_X28_Y4_N26
\Selector1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~5_combout\ = (\Selector1~4_combout\) # ((\current_state.S_DATA2~q\ & (!\last_val~q\ & \decod_data3_ready~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA2~q\,
	datab => \last_val~q\,
	datac => \decod_data3_ready~input_o\,
	datad => \Selector1~4_combout\,
	combout => \Selector1~5_combout\);

-- Location: LCCOMB_X27_Y4_N10
\Selector1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~10_combout\ = (\Selector1~9_combout\) # ((\Selector1~7_combout\) # ((\Selector1~3_combout\) # (\Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~9_combout\,
	datab => \Selector1~7_combout\,
	datac => \Selector1~3_combout\,
	datad => \Selector1~5_combout\,
	combout => \Selector1~10_combout\);

-- Location: FF_X27_Y4_N11
edge_detected : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector1~10_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \edge_detected~q\);

-- Location: LCCOMB_X29_Y4_N30
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (!\LessThan2~10_combout\ & ((\edge_detected~q\ & (\current_state.S_DATA0~q\)) # (!\edge_detected~q\ & ((\current_state.S_DATA1~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \edge_detected~q\,
	datab => \current_state.S_DATA0~q\,
	datac => \current_state.S_DATA1~q\,
	datad => \LessThan2~10_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X29_Y4_N31
\current_state.S_DATA1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector7~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA1~q\);

-- Location: LCCOMB_X29_Y4_N12
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (!\LessThan2~10_combout\ & ((\edge_detected~q\ & (\current_state.S_DATA1~q\)) # (!\edge_detected~q\ & ((\current_state.S_DATA2~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datab => \edge_detected~q\,
	datac => \current_state.S_DATA2~q\,
	datad => \LessThan2~10_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X29_Y4_N13
\current_state.S_DATA2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA2~q\);

-- Location: LCCOMB_X29_Y4_N14
\Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (!\LessThan2~10_combout\ & ((\edge_detected~q\ & (\current_state.S_DATA2~q\)) # (!\edge_detected~q\ & ((\current_state.S_DATA3~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA2~q\,
	datab => \edge_detected~q\,
	datac => \current_state.S_DATA3~q\,
	datad => \LessThan2~10_combout\,
	combout => \Selector9~0_combout\);

-- Location: FF_X29_Y4_N15
\current_state.S_DATA3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector9~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_DATA3~q\);

-- Location: LCCOMB_X29_Y4_N6
\Selector65~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector65~1_combout\ = (\decod_data4[1]~input_o\ & ((\current_state.S_DATA3~q\) # ((\decod_data3[1]~input_o\ & \current_state.S_DATA2~q\)))) # (!\decod_data4[1]~input_o\ & (\decod_data3[1]~input_o\ & ((\current_state.S_DATA2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data4[1]~input_o\,
	datab => \decod_data3[1]~input_o\,
	datac => \current_state.S_DATA3~q\,
	datad => \current_state.S_DATA2~q\,
	combout => \Selector65~1_combout\);

-- Location: IOIBUF_X37_Y0_N1
\decod_data5[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(1),
	o => \decod_data5[1]~input_o\);

-- Location: IOIBUF_X37_Y0_N22
\decod_data6[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(1),
	o => \decod_data6[1]~input_o\);

-- Location: LCCOMB_X29_Y4_N20
\Selector65~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector65~0_combout\ = (\decod_data5[1]~input_o\ & ((\current_state.S_DATA4~q\) # ((\current_state.S_DATA5~q\ & \decod_data6[1]~input_o\)))) # (!\decod_data5[1]~input_o\ & (((\current_state.S_DATA5~q\ & \decod_data6[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[1]~input_o\,
	datab => \current_state.S_DATA4~q\,
	datac => \current_state.S_DATA5~q\,
	datad => \decod_data6[1]~input_o\,
	combout => \Selector65~0_combout\);

-- Location: IOIBUF_X35_Y0_N22
\decod_data2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(1),
	o => \decod_data2[1]~input_o\);

-- Location: IOIBUF_X21_Y0_N22
\decod_data1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(1),
	o => \decod_data1[1]~input_o\);

-- Location: LCCOMB_X28_Y4_N18
\Selector65~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector65~3_combout\ = (\current_state.S_DATA1~q\ & ((\decod_data2[1]~input_o\) # ((\decod_data1[1]~input_o\ & \current_state.S_DATA0~q\)))) # (!\current_state.S_DATA1~q\ & (((\decod_data1[1]~input_o\ & \current_state.S_DATA0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datab => \decod_data2[1]~input_o\,
	datac => \decod_data1[1]~input_o\,
	datad => \current_state.S_DATA0~q\,
	combout => \Selector65~3_combout\);

-- Location: IOIBUF_X23_Y0_N1
\decod_data0[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(1),
	o => \decod_data0[1]~input_o\);

-- Location: LCCOMB_X27_Y4_N6
\Selector65~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector65~2_combout\ = (\decod_data0[1]~input_o\ & \current_state.S_LENGTH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \decod_data0[1]~input_o\,
	datad => \current_state.S_LENGTH~q\,
	combout => \Selector65~2_combout\);

-- Location: LCCOMB_X28_Y7_N6
\Selector65~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector65~4_combout\ = (\Selector65~1_combout\) # ((\Selector65~0_combout\) # ((\Selector65~3_combout\) # (\Selector65~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector65~1_combout\,
	datab => \Selector65~0_combout\,
	datac => \Selector65~3_combout\,
	datad => \Selector65~2_combout\,
	combout => \Selector65~4_combout\);

-- Location: LCCOMB_X28_Y7_N0
\local_data[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~0_combout\ = ((\LessThan2~10_combout\) # (!\edge_detected~q\)) # (!\current_state.S_DATA5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.S_DATA5~q\,
	datac => \edge_detected~q\,
	datad => \LessThan2~10_combout\,
	combout => \local_data[1]~0_combout\);

-- Location: LCCOMB_X28_Y7_N12
\local_data[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~6_combout\ = (!\reset~input_o\ & (((!\local_data[1]~5_combout\) # (!\local_data[1]~0_combout\)) # (!\local_data[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \local_data[1]~2_combout\,
	datab => \local_data[1]~0_combout\,
	datac => \local_data[1]~5_combout\,
	datad => \reset~input_o\,
	combout => \local_data[1]~6_combout\);

-- Location: FF_X28_Y7_N7
\local_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector65~4_combout\,
	ena => \local_data[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_data(1));

-- Location: LCCOMB_X27_Y3_N12
\local_address[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[0]~20_combout\ = (local_address(0) & (\edge_detected~q\ $ (VCC))) # (!local_address(0) & (\edge_detected~q\ & VCC))
-- \local_address[0]~21\ = CARRY((local_address(0) & \edge_detected~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(0),
	datab => \edge_detected~q\,
	datad => VCC,
	combout => \local_address[0]~20_combout\,
	cout => \local_address[0]~21\);

-- Location: LCCOMB_X29_Y4_N2
\local_address[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[0]~24_combout\ = (!\current_state.S_DATA2~q\ & (!\current_state.S_DATA3~q\ & (!\current_state.S_DATA5~q\ & !\current_state.S_DATA4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA2~q\,
	datab => \current_state.S_DATA3~q\,
	datac => \current_state.S_DATA5~q\,
	datad => \current_state.S_DATA4~q\,
	combout => \local_address[0]~24_combout\);

-- Location: LCCOMB_X29_Y4_N16
\local_address[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[0]~25_combout\ = (!\current_state.S_DATA1~q\ & (!\current_state.S_DATA0~q\ & \local_address[0]~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datac => \current_state.S_DATA0~q\,
	datad => \local_address[0]~24_combout\,
	combout => \local_address[0]~25_combout\);

-- Location: LCCOMB_X27_Y3_N10
\local_address[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[0]~26_combout\ = (!\reset~input_o\ & ((\current_state~15_combout\) # ((!\local_address[0]~25_combout\ & !\LessThan2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~15_combout\,
	datab => \reset~input_o\,
	datac => \local_address[0]~25_combout\,
	datad => \LessThan2~10_combout\,
	combout => \local_address[0]~26_combout\);

-- Location: FF_X27_Y3_N13
\local_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[0]~20_combout\,
	asdata => \decod_address[0]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(0));

-- Location: LCCOMB_X27_Y3_N14
\local_address[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[1]~22_combout\ = (local_address(1) & (!\local_address[0]~21\)) # (!local_address(1) & ((\local_address[0]~21\) # (GND)))
-- \local_address[1]~23\ = CARRY((!\local_address[0]~21\) # (!local_address(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(1),
	datad => VCC,
	cin => \local_address[0]~21\,
	combout => \local_address[1]~22_combout\,
	cout => \local_address[1]~23\);

-- Location: FF_X27_Y3_N15
\local_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[1]~22_combout\,
	asdata => \decod_address[1]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(1));

-- Location: LCCOMB_X27_Y3_N16
\local_address[2]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[2]~27_combout\ = (local_address(2) & (\local_address[1]~23\ $ (GND))) # (!local_address(2) & (!\local_address[1]~23\ & VCC))
-- \local_address[2]~28\ = CARRY((local_address(2) & !\local_address[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(2),
	datad => VCC,
	cin => \local_address[1]~23\,
	combout => \local_address[2]~27_combout\,
	cout => \local_address[2]~28\);

-- Location: FF_X27_Y3_N17
\local_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[2]~27_combout\,
	asdata => \decod_address[2]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(2));

-- Location: LCCOMB_X27_Y3_N18
\local_address[3]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[3]~29_combout\ = (local_address(3) & (!\local_address[2]~28\)) # (!local_address(3) & ((\local_address[2]~28\) # (GND)))
-- \local_address[3]~30\ = CARRY((!\local_address[2]~28\) # (!local_address(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(3),
	datad => VCC,
	cin => \local_address[2]~28\,
	combout => \local_address[3]~29_combout\,
	cout => \local_address[3]~30\);

-- Location: FF_X27_Y3_N19
\local_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[3]~29_combout\,
	asdata => \decod_address[3]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(3));

-- Location: LCCOMB_X27_Y3_N20
\local_address[4]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[4]~31_combout\ = (local_address(4) & (\local_address[3]~30\ $ (GND))) # (!local_address(4) & (!\local_address[3]~30\ & VCC))
-- \local_address[4]~32\ = CARRY((local_address(4) & !\local_address[3]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(4),
	datad => VCC,
	cin => \local_address[3]~30\,
	combout => \local_address[4]~31_combout\,
	cout => \local_address[4]~32\);

-- Location: FF_X27_Y3_N21
\local_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[4]~31_combout\,
	asdata => \decod_address[4]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(4));

-- Location: LCCOMB_X27_Y3_N22
\local_address[5]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[5]~33_combout\ = (local_address(5) & (!\local_address[4]~32\)) # (!local_address(5) & ((\local_address[4]~32\) # (GND)))
-- \local_address[5]~34\ = CARRY((!\local_address[4]~32\) # (!local_address(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(5),
	datad => VCC,
	cin => \local_address[4]~32\,
	combout => \local_address[5]~33_combout\,
	cout => \local_address[5]~34\);

-- Location: FF_X27_Y3_N23
\local_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[5]~33_combout\,
	asdata => \decod_address[5]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(5));

-- Location: LCCOMB_X27_Y3_N24
\local_address[6]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[6]~35_combout\ = (local_address(6) & (\local_address[5]~34\ $ (GND))) # (!local_address(6) & (!\local_address[5]~34\ & VCC))
-- \local_address[6]~36\ = CARRY((local_address(6) & !\local_address[5]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(6),
	datad => VCC,
	cin => \local_address[5]~34\,
	combout => \local_address[6]~35_combout\,
	cout => \local_address[6]~36\);

-- Location: FF_X27_Y3_N25
\local_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[6]~35_combout\,
	asdata => \decod_address[6]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(6));

-- Location: LCCOMB_X27_Y3_N26
\local_address[7]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[7]~37_combout\ = (local_address(7) & (!\local_address[6]~36\)) # (!local_address(7) & ((\local_address[6]~36\) # (GND)))
-- \local_address[7]~38\ = CARRY((!\local_address[6]~36\) # (!local_address(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(7),
	datad => VCC,
	cin => \local_address[6]~36\,
	combout => \local_address[7]~37_combout\,
	cout => \local_address[7]~38\);

-- Location: FF_X27_Y3_N27
\local_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[7]~37_combout\,
	asdata => \decod_address[7]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(7));

-- Location: LCCOMB_X27_Y3_N28
\local_address[8]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[8]~39_combout\ = (local_address(8) & (\local_address[7]~38\ $ (GND))) # (!local_address(8) & (!\local_address[7]~38\ & VCC))
-- \local_address[8]~40\ = CARRY((local_address(8) & !\local_address[7]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(8),
	datad => VCC,
	cin => \local_address[7]~38\,
	combout => \local_address[8]~39_combout\,
	cout => \local_address[8]~40\);

-- Location: FF_X27_Y3_N29
\local_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[8]~39_combout\,
	asdata => \decod_address[8]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(8));

-- Location: LCCOMB_X27_Y3_N30
\local_address[9]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[9]~41_combout\ = (local_address(9) & (!\local_address[8]~40\)) # (!local_address(9) & ((\local_address[8]~40\) # (GND)))
-- \local_address[9]~42\ = CARRY((!\local_address[8]~40\) # (!local_address(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(9),
	datad => VCC,
	cin => \local_address[8]~40\,
	combout => \local_address[9]~41_combout\,
	cout => \local_address[9]~42\);

-- Location: FF_X27_Y3_N31
\local_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[9]~41_combout\,
	asdata => \decod_address[9]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(9));

-- Location: LCCOMB_X27_Y2_N0
\local_address[10]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[10]~43_combout\ = (local_address(10) & (\local_address[9]~42\ $ (GND))) # (!local_address(10) & (!\local_address[9]~42\ & VCC))
-- \local_address[10]~44\ = CARRY((local_address(10) & !\local_address[9]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(10),
	datad => VCC,
	cin => \local_address[9]~42\,
	combout => \local_address[10]~43_combout\,
	cout => \local_address[10]~44\);

-- Location: FF_X27_Y2_N1
\local_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[10]~43_combout\,
	asdata => \decod_address[10]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(10));

-- Location: LCCOMB_X27_Y2_N2
\local_address[11]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[11]~45_combout\ = (local_address(11) & (!\local_address[10]~44\)) # (!local_address(11) & ((\local_address[10]~44\) # (GND)))
-- \local_address[11]~46\ = CARRY((!\local_address[10]~44\) # (!local_address(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(11),
	datad => VCC,
	cin => \local_address[10]~44\,
	combout => \local_address[11]~45_combout\,
	cout => \local_address[11]~46\);

-- Location: FF_X27_Y2_N3
\local_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[11]~45_combout\,
	asdata => \decod_address[11]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(11));

-- Location: LCCOMB_X27_Y2_N4
\local_address[12]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[12]~47_combout\ = (local_address(12) & (\local_address[11]~46\ $ (GND))) # (!local_address(12) & (!\local_address[11]~46\ & VCC))
-- \local_address[12]~48\ = CARRY((local_address(12) & !\local_address[11]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(12),
	datad => VCC,
	cin => \local_address[11]~46\,
	combout => \local_address[12]~47_combout\,
	cout => \local_address[12]~48\);

-- Location: FF_X27_Y2_N5
\local_address[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[12]~47_combout\,
	asdata => \decod_address[12]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(12));

-- Location: LCCOMB_X27_Y2_N6
\local_address[13]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[13]~49_combout\ = (local_address(13) & (!\local_address[12]~48\)) # (!local_address(13) & ((\local_address[12]~48\) # (GND)))
-- \local_address[13]~50\ = CARRY((!\local_address[12]~48\) # (!local_address(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(13),
	datad => VCC,
	cin => \local_address[12]~48\,
	combout => \local_address[13]~49_combout\,
	cout => \local_address[13]~50\);

-- Location: FF_X27_Y2_N7
\local_address[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[13]~49_combout\,
	asdata => \decod_address[13]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(13));

-- Location: LCCOMB_X27_Y2_N8
\local_address[14]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[14]~51_combout\ = (local_address(14) & (\local_address[13]~50\ $ (GND))) # (!local_address(14) & (!\local_address[13]~50\ & VCC))
-- \local_address[14]~52\ = CARRY((local_address(14) & !\local_address[13]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(14),
	datad => VCC,
	cin => \local_address[13]~50\,
	combout => \local_address[14]~51_combout\,
	cout => \local_address[14]~52\);

-- Location: FF_X27_Y2_N9
\local_address[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[14]~51_combout\,
	asdata => \decod_address[14]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(14));

-- Location: LCCOMB_X27_Y2_N10
\local_address[15]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[15]~53_combout\ = (local_address(15) & (!\local_address[14]~52\)) # (!local_address(15) & ((\local_address[14]~52\) # (GND)))
-- \local_address[15]~54\ = CARRY((!\local_address[14]~52\) # (!local_address(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(15),
	datad => VCC,
	cin => \local_address[14]~52\,
	combout => \local_address[15]~53_combout\,
	cout => \local_address[15]~54\);

-- Location: FF_X27_Y2_N11
\local_address[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[15]~53_combout\,
	asdata => \decod_address[15]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(15));

-- Location: LCCOMB_X27_Y2_N12
\local_address[16]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[16]~55_combout\ = (local_address(16) & (\local_address[15]~54\ $ (GND))) # (!local_address(16) & (!\local_address[15]~54\ & VCC))
-- \local_address[16]~56\ = CARRY((local_address(16) & !\local_address[15]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => local_address(16),
	datad => VCC,
	cin => \local_address[15]~54\,
	combout => \local_address[16]~55_combout\,
	cout => \local_address[16]~56\);

-- Location: FF_X27_Y2_N13
\local_address[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[16]~55_combout\,
	asdata => \decod_address[16]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(16));

-- Location: LCCOMB_X27_Y2_N14
\local_address[17]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[17]~57_combout\ = (local_address(17) & (!\local_address[16]~56\)) # (!local_address(17) & ((\local_address[16]~56\) # (GND)))
-- \local_address[17]~58\ = CARRY((!\local_address[16]~56\) # (!local_address(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(17),
	datad => VCC,
	cin => \local_address[16]~56\,
	combout => \local_address[17]~57_combout\,
	cout => \local_address[17]~58\);

-- Location: FF_X27_Y2_N15
\local_address[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[17]~57_combout\,
	asdata => \decod_address[17]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(17));

-- Location: LCCOMB_X27_Y2_N16
\local_address[18]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[18]~59_combout\ = (local_address(18) & (\local_address[17]~58\ $ (GND))) # (!local_address(18) & (!\local_address[17]~58\ & VCC))
-- \local_address[18]~60\ = CARRY((local_address(18) & !\local_address[17]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => local_address(18),
	datad => VCC,
	cin => \local_address[17]~58\,
	combout => \local_address[18]~59_combout\,
	cout => \local_address[18]~60\);

-- Location: FF_X27_Y2_N17
\local_address[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[18]~59_combout\,
	asdata => \decod_address[18]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(18));

-- Location: LCCOMB_X27_Y2_N18
\local_address[19]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_address[19]~61_combout\ = \local_address[18]~60\ $ (local_address(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => local_address(19),
	cin => \local_address[18]~60\,
	combout => \local_address[19]~61_combout\);

-- Location: FF_X27_Y2_N19
\local_address[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_address[19]~61_combout\,
	asdata => \decod_address[19]~input_o\,
	sload => \current_state.S_COMM~q\,
	ena => \local_address[0]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_address(19));

-- Location: LCCOMB_X27_Y2_N30
\reg_32_0[17]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~5_combout\ = (!local_address(16) & (!local_address(18) & (!local_address(17) & !local_address(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(16),
	datab => local_address(18),
	datac => local_address(17),
	datad => local_address(15),
	combout => \reg_32_0[17]~5_combout\);

-- Location: LCCOMB_X27_Y2_N24
\reg_32_0[17]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~3_combout\ = (!local_address(13) & (!local_address(12) & (!local_address(14) & !local_address(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(13),
	datab => local_address(12),
	datac => local_address(14),
	datad => local_address(11),
	combout => \reg_32_0[17]~3_combout\);

-- Location: LCCOMB_X27_Y3_N6
\reg_32_0[17]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~2_combout\ = (!local_address(9) & (!local_address(10) & (!local_address(7) & local_address(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(9),
	datab => local_address(10),
	datac => local_address(7),
	datad => local_address(8),
	combout => \reg_32_0[17]~2_combout\);

-- Location: LCCOMB_X27_Y3_N0
\reg_32_0[17]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~1_combout\ = (!local_address(3) & (!local_address(4) & (!local_address(5) & !local_address(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(3),
	datab => local_address(4),
	datac => local_address(5),
	datad => local_address(6),
	combout => \reg_32_0[17]~1_combout\);

-- Location: LCCOMB_X28_Y7_N20
\local_data[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \local_data[1]~7_combout\ = (((\current_state.S_DATA5~q\ & \local_data[1]~4_combout\)) # (!\local_data[1]~2_combout\)) # (!\local_data[1]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \local_data[1]~5_combout\,
	datab => \current_state.S_DATA5~q\,
	datac => \local_data[1]~2_combout\,
	datad => \local_data[1]~4_combout\,
	combout => \local_data[1]~7_combout\);

-- Location: FF_X28_Y7_N21
write_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \local_data[1]~7_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_reg~q\);

-- Location: LCCOMB_X28_Y3_N6
\reg_32_0[17]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~0_combout\ = (!local_address(0) & (\write_reg~q\ & (!local_address(2) & local_address(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(0),
	datab => \write_reg~q\,
	datac => local_address(2),
	datad => local_address(1),
	combout => \reg_32_0[17]~0_combout\);

-- Location: LCCOMB_X28_Y3_N28
\reg_32_0[17]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~4_combout\ = (\reg_32_0[17]~3_combout\ & (\reg_32_0[17]~2_combout\ & (\reg_32_0[17]~1_combout\ & \reg_32_0[17]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_32_0[17]~3_combout\,
	datab => \reg_32_0[17]~2_combout\,
	datac => \reg_32_0[17]~1_combout\,
	datad => \reg_32_0[17]~0_combout\,
	combout => \reg_32_0[17]~4_combout\);

-- Location: LCCOMB_X28_Y3_N30
\reg_32_0[17]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[17]~6_combout\ = (!local_address(19) & (\reg_32_0[17]~5_combout\ & \reg_32_0[17]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => local_address(19),
	datab => \reg_32_0[17]~5_combout\,
	datad => \reg_32_0[17]~4_combout\,
	combout => \reg_32_0[17]~6_combout\);

-- Location: FF_X28_Y3_N31
\reg_32_0[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	asdata => local_data(1),
	sload => VCC,
	ena => \reg_32_0[17]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_32_0(17));

-- Location: IOIBUF_X21_Y0_N29
\decod_data0[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(0),
	o => \decod_data0[0]~input_o\);

-- Location: LCCOMB_X27_Y4_N8
\Selector66~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector66~2_combout\ = (\decod_data0[0]~input_o\ & \current_state.S_LENGTH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data0[0]~input_o\,
	datad => \current_state.S_LENGTH~q\,
	combout => \Selector66~2_combout\);

-- Location: IOIBUF_X37_Y0_N29
\decod_data6[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(0),
	o => \decod_data6[0]~input_o\);

-- Location: IOIBUF_X41_Y4_N8
\decod_data5[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(0),
	o => \decod_data5[0]~input_o\);

-- Location: LCCOMB_X29_Y4_N26
\Selector66~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector66~0_combout\ = (\decod_data6[0]~input_o\ & ((\current_state.S_DATA5~q\) # ((\current_state.S_DATA4~q\ & \decod_data5[0]~input_o\)))) # (!\decod_data6[0]~input_o\ & (\current_state.S_DATA4~q\ & ((\decod_data5[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6[0]~input_o\,
	datab => \current_state.S_DATA4~q\,
	datac => \current_state.S_DATA5~q\,
	datad => \decod_data5[0]~input_o\,
	combout => \Selector66~0_combout\);

-- Location: IOIBUF_X30_Y0_N1
\decod_data1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(0),
	o => \decod_data1[0]~input_o\);

-- Location: IOIBUF_X30_Y0_N8
\decod_data2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(0),
	o => \decod_data2[0]~input_o\);

-- Location: LCCOMB_X29_Y4_N18
\Selector66~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector66~3_combout\ = (\current_state.S_DATA1~q\ & ((\decod_data2[0]~input_o\) # ((\decod_data1[0]~input_o\ & \current_state.S_DATA0~q\)))) # (!\current_state.S_DATA1~q\ & (\decod_data1[0]~input_o\ & (\current_state.S_DATA0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_DATA1~q\,
	datab => \decod_data1[0]~input_o\,
	datac => \current_state.S_DATA0~q\,
	datad => \decod_data2[0]~input_o\,
	combout => \Selector66~3_combout\);

-- Location: IOIBUF_X37_Y0_N8
\decod_data4[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(0),
	o => \decod_data4[0]~input_o\);

-- Location: IOIBUF_X30_Y0_N29
\decod_data3[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(0),
	o => \decod_data3[0]~input_o\);

-- Location: LCCOMB_X29_Y4_N24
\Selector66~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector66~1_combout\ = (\decod_data4[0]~input_o\ & ((\current_state.S_DATA3~q\) # ((\decod_data3[0]~input_o\ & \current_state.S_DATA2~q\)))) # (!\decod_data4[0]~input_o\ & (((\decod_data3[0]~input_o\ & \current_state.S_DATA2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data4[0]~input_o\,
	datab => \current_state.S_DATA3~q\,
	datac => \decod_data3[0]~input_o\,
	datad => \current_state.S_DATA2~q\,
	combout => \Selector66~1_combout\);

-- Location: LCCOMB_X28_Y7_N24
\Selector66~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector66~4_combout\ = (\Selector66~2_combout\) # ((\Selector66~0_combout\) # ((\Selector66~3_combout\) # (\Selector66~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector66~2_combout\,
	datab => \Selector66~0_combout\,
	datac => \Selector66~3_combout\,
	datad => \Selector66~1_combout\,
	combout => \Selector66~4_combout\);

-- Location: FF_X28_Y7_N25
\local_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Selector66~4_combout\,
	ena => \local_data[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => local_data(0));

-- Location: LCCOMB_X28_Y3_N16
\reg_32_0[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_32_0[16]~feeder_combout\ = local_data(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => local_data(0),
	combout => \reg_32_0[16]~feeder_combout\);

-- Location: FF_X28_Y3_N17
\reg_32_0[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \reg_32_0[16]~feeder_combout\,
	ena => \reg_32_0[17]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => reg_32_0(16));

-- Location: LCCOMB_X28_Y3_N24
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (reg_32_0(17)) # (reg_32_0(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => reg_32_0(17),
	datad => reg_32_0(16),
	combout => \Equal1~0_combout\);

-- Location: FF_X28_Y3_N25
\link_training_active~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_100~inputclkctrl_outclk\,
	d => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \link_training_active~reg0_q\);

-- Location: IOIBUF_X0_Y14_N15
\decod_length[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(0),
	o => \decod_length[0]~input_o\);

-- Location: IOIBUF_X0_Y14_N22
\decod_length[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(1),
	o => \decod_length[1]~input_o\);

-- Location: IOIBUF_X41_Y5_N8
\decod_length[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(2),
	o => \decod_length[2]~input_o\);

-- Location: IOIBUF_X5_Y0_N1
\decod_length[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(3),
	o => \decod_length[3]~input_o\);

-- Location: IOIBUF_X32_Y29_N1
\decod_length[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(4),
	o => \decod_length[4]~input_o\);

-- Location: IOIBUF_X0_Y11_N1
\decod_length[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(5),
	o => \decod_length[5]~input_o\);

-- Location: IOIBUF_X3_Y29_N15
\decod_length[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(6),
	o => \decod_length[6]~input_o\);

-- Location: IOIBUF_X30_Y29_N8
\decod_length[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_length(7),
	o => \decod_length[7]~input_o\);

-- Location: IOIBUF_X0_Y3_N8
\decod_data0[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(2),
	o => \decod_data0[2]~input_o\);

-- Location: IOIBUF_X41_Y18_N8
\decod_data0[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(3),
	o => \decod_data0[3]~input_o\);

-- Location: IOIBUF_X9_Y29_N22
\decod_data0[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(4),
	o => \decod_data0[4]~input_o\);

-- Location: IOIBUF_X21_Y29_N22
\decod_data0[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(5),
	o => \decod_data0[5]~input_o\);

-- Location: IOIBUF_X41_Y26_N1
\decod_data0[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(6),
	o => \decod_data0[6]~input_o\);

-- Location: IOIBUF_X7_Y0_N8
\decod_data0[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data0(7),
	o => \decod_data0[7]~input_o\);

-- Location: IOIBUF_X39_Y29_N1
\decod_data1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(2),
	o => \decod_data1[2]~input_o\);

-- Location: IOIBUF_X37_Y29_N8
\decod_data1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(3),
	o => \decod_data1[3]~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\decod_data1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(4),
	o => \decod_data1[4]~input_o\);

-- Location: IOIBUF_X9_Y29_N29
\decod_data1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(5),
	o => \decod_data1[5]~input_o\);

-- Location: IOIBUF_X3_Y0_N29
\decod_data1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(6),
	o => \decod_data1[6]~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\decod_data1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data1(7),
	o => \decod_data1[7]~input_o\);

-- Location: IOIBUF_X41_Y21_N1
\decod_data2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(2),
	o => \decod_data2[2]~input_o\);

-- Location: IOIBUF_X35_Y29_N22
\decod_data2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(3),
	o => \decod_data2[3]~input_o\);

-- Location: IOIBUF_X1_Y0_N29
\decod_data2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(4),
	o => \decod_data2[4]~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\decod_data2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(5),
	o => \decod_data2[5]~input_o\);

-- Location: IOIBUF_X39_Y29_N15
\decod_data2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(6),
	o => \decod_data2[6]~input_o\);

-- Location: IOIBUF_X14_Y29_N29
\decod_data2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data2(7),
	o => \decod_data2[7]~input_o\);

-- Location: IOIBUF_X41_Y3_N22
\decod_data3[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(2),
	o => \decod_data3[2]~input_o\);

-- Location: IOIBUF_X39_Y29_N22
\decod_data3[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(3),
	o => \decod_data3[3]~input_o\);

-- Location: IOIBUF_X41_Y13_N15
\decod_data3[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(4),
	o => \decod_data3[4]~input_o\);

-- Location: IOIBUF_X0_Y27_N15
\decod_data3[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(5),
	o => \decod_data3[5]~input_o\);

-- Location: IOIBUF_X39_Y0_N22
\decod_data3[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(6),
	o => \decod_data3[6]~input_o\);

-- Location: IOIBUF_X0_Y8_N1
\decod_data3[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data3(7),
	o => \decod_data3[7]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\decod_data4[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(2),
	o => \decod_data4[2]~input_o\);

-- Location: IOIBUF_X37_Y29_N29
\decod_data4[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(3),
	o => \decod_data4[3]~input_o\);

-- Location: IOIBUF_X41_Y26_N22
\decod_data4[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(4),
	o => \decod_data4[4]~input_o\);

-- Location: IOIBUF_X41_Y19_N8
\decod_data4[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(5),
	o => \decod_data4[5]~input_o\);

-- Location: IOIBUF_X41_Y20_N8
\decod_data4[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(6),
	o => \decod_data4[6]~input_o\);

-- Location: IOIBUF_X41_Y9_N22
\decod_data4[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data4(7),
	o => \decod_data4[7]~input_o\);

-- Location: IOIBUF_X23_Y0_N29
\decod_data5[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(2),
	o => \decod_data5[2]~input_o\);

-- Location: IOIBUF_X11_Y29_N22
\decod_data5[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(3),
	o => \decod_data5[3]~input_o\);

-- Location: IOIBUF_X9_Y0_N15
\decod_data5[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(4),
	o => \decod_data5[4]~input_o\);

-- Location: IOIBUF_X1_Y0_N8
\decod_data5[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(5),
	o => \decod_data5[5]~input_o\);

-- Location: IOIBUF_X7_Y29_N22
\decod_data5[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(6),
	o => \decod_data5[6]~input_o\);

-- Location: IOIBUF_X41_Y9_N15
\decod_data5[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data5(7),
	o => \decod_data5[7]~input_o\);

-- Location: IOIBUF_X11_Y29_N8
\decod_data6[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(2),
	o => \decod_data6[2]~input_o\);

-- Location: IOIBUF_X32_Y29_N29
\decod_data6[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(3),
	o => \decod_data6[3]~input_o\);

-- Location: IOIBUF_X9_Y0_N8
\decod_data6[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(4),
	o => \decod_data6[4]~input_o\);

-- Location: IOIBUF_X41_Y25_N8
\decod_data6[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(5),
	o => \decod_data6[5]~input_o\);

-- Location: IOIBUF_X30_Y29_N29
\decod_data6[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(6),
	o => \decod_data6[6]~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\decod_data6[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decod_data6(7),
	o => \decod_data6[7]~input_o\);

-- Location: IOIBUF_X0_Y26_N1
\avm_read~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_read,
	o => \avm_read~input_o\);

-- Location: IOIBUF_X37_Y29_N15
\avm_address[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(0),
	o => \avm_address[0]~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\avm_address[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(1),
	o => \avm_address[1]~input_o\);

-- Location: IOIBUF_X7_Y29_N29
\avm_address[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(2),
	o => \avm_address[2]~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\avm_address[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(3),
	o => \avm_address[3]~input_o\);

-- Location: IOIBUF_X41_Y22_N22
\avm_address[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(4),
	o => \avm_address[4]~input_o\);

-- Location: IOIBUF_X5_Y0_N8
\avm_address[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(5),
	o => \avm_address[5]~input_o\);

-- Location: IOIBUF_X0_Y10_N8
\avm_address[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(6),
	o => \avm_address[6]~input_o\);

-- Location: IOIBUF_X30_Y29_N1
\avm_address[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(7),
	o => \avm_address[7]~input_o\);

-- Location: IOIBUF_X5_Y0_N29
\avm_address[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(8),
	o => \avm_address[8]~input_o\);

-- Location: IOIBUF_X0_Y26_N8
\avm_address[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(9),
	o => \avm_address[9]~input_o\);

-- Location: IOIBUF_X41_Y23_N1
\avm_address[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(10),
	o => \avm_address[10]~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\avm_address[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(11),
	o => \avm_address[11]~input_o\);

-- Location: IOIBUF_X0_Y2_N8
\avm_address[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(12),
	o => \avm_address[12]~input_o\);

-- Location: IOIBUF_X37_Y29_N1
\avm_address[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(13),
	o => \avm_address[13]~input_o\);

-- Location: IOIBUF_X0_Y5_N15
\avm_address[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(14),
	o => \avm_address[14]~input_o\);

-- Location: IOIBUF_X41_Y13_N8
\avm_address[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(15),
	o => \avm_address[15]~input_o\);

-- Location: IOIBUF_X1_Y0_N22
\avm_address[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(16),
	o => \avm_address[16]~input_o\);

-- Location: IOIBUF_X41_Y20_N1
\avm_address[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(17),
	o => \avm_address[17]~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\avm_address[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(18),
	o => \avm_address[18]~input_o\);

-- Location: IOIBUF_X1_Y29_N15
\avm_address[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(19),
	o => \avm_address[19]~input_o\);

-- Location: IOIBUF_X41_Y26_N8
\avm_address[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(20),
	o => \avm_address[20]~input_o\);

-- Location: IOIBUF_X0_Y6_N8
\avm_address[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(21),
	o => \avm_address[21]~input_o\);

-- Location: IOIBUF_X1_Y29_N1
\avm_address[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(22),
	o => \avm_address[22]~input_o\);

-- Location: IOIBUF_X41_Y6_N22
\avm_address[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(23),
	o => \avm_address[23]~input_o\);

-- Location: IOIBUF_X11_Y29_N1
\avm_address[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(24),
	o => \avm_address[24]~input_o\);

-- Location: IOIBUF_X5_Y29_N29
\avm_address[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(25),
	o => \avm_address[25]~input_o\);

-- Location: IOIBUF_X39_Y0_N29
\avm_address[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(26),
	o => \avm_address[26]~input_o\);

-- Location: IOIBUF_X41_Y20_N22
\avm_address[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(27),
	o => \avm_address[27]~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\avm_address[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(28),
	o => \avm_address[28]~input_o\);

-- Location: IOIBUF_X0_Y2_N15
\avm_address[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(29),
	o => \avm_address[29]~input_o\);

-- Location: IOIBUF_X9_Y0_N1
\avm_address[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(30),
	o => \avm_address[30]~input_o\);

-- Location: IOIBUF_X3_Y0_N8
\avm_address[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_avm_address(31),
	o => \avm_address[31]~input_o\);

ww_link_training_active <= \link_training_active~output_o\;

ww_avm_readdata(0) <= \avm_readdata[0]~output_o\;

ww_avm_readdata(1) <= \avm_readdata[1]~output_o\;

ww_avm_readdata(2) <= \avm_readdata[2]~output_o\;

ww_avm_readdata(3) <= \avm_readdata[3]~output_o\;

ww_avm_readdata(4) <= \avm_readdata[4]~output_o\;

ww_avm_readdata(5) <= \avm_readdata[5]~output_o\;

ww_avm_readdata(6) <= \avm_readdata[6]~output_o\;

ww_avm_readdata(7) <= \avm_readdata[7]~output_o\;

ww_avm_readdata(8) <= \avm_readdata[8]~output_o\;

ww_avm_readdata(9) <= \avm_readdata[9]~output_o\;

ww_avm_readdata(10) <= \avm_readdata[10]~output_o\;

ww_avm_readdata(11) <= \avm_readdata[11]~output_o\;

ww_avm_readdata(12) <= \avm_readdata[12]~output_o\;

ww_avm_readdata(13) <= \avm_readdata[13]~output_o\;

ww_avm_readdata(14) <= \avm_readdata[14]~output_o\;

ww_avm_readdata(15) <= \avm_readdata[15]~output_o\;

ww_avm_readdata(16) <= \avm_readdata[16]~output_o\;

ww_avm_readdata(17) <= \avm_readdata[17]~output_o\;

ww_avm_readdata(18) <= \avm_readdata[18]~output_o\;

ww_avm_readdata(19) <= \avm_readdata[19]~output_o\;

ww_avm_readdata(20) <= \avm_readdata[20]~output_o\;

ww_avm_readdata(21) <= \avm_readdata[21]~output_o\;

ww_avm_readdata(22) <= \avm_readdata[22]~output_o\;

ww_avm_readdata(23) <= \avm_readdata[23]~output_o\;

ww_avm_readdata(24) <= \avm_readdata[24]~output_o\;

ww_avm_readdata(25) <= \avm_readdata[25]~output_o\;

ww_avm_readdata(26) <= \avm_readdata[26]~output_o\;

ww_avm_readdata(27) <= \avm_readdata[27]~output_o\;

ww_avm_readdata(28) <= \avm_readdata[28]~output_o\;

ww_avm_readdata(29) <= \avm_readdata[29]~output_o\;

ww_avm_readdata(30) <= \avm_readdata[30]~output_o\;

ww_avm_readdata(31) <= \avm_readdata[31]~output_o\;
END structure;


