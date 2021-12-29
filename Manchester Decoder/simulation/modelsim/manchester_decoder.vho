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

-- DATE "10/06/2021 12:03:35"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	manchester_decoder IS
    PORT (
	reset : IN std_logic;
	clk_16 : IN std_logic;
	tx_aux_out : IN std_logic;
	decod_comm : INOUT std_logic_vector(3 DOWNTO 0);
	decod_address : INOUT std_logic_vector(19 DOWNTO 0);
	decod_length : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data0 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data1 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data2 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data3 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data4 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data5 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_data6 : INOUT std_logic_vector(7 DOWNTO 0);
	decod_comm_ready : OUT std_logic;
	decod_address_ready : OUT std_logic;
	decod_length_ready : OUT std_logic;
	decod_data0_ready : OUT std_logic;
	decod_data1_ready : OUT std_logic;
	decod_data2_ready : OUT std_logic;
	decod_data3_ready : OUT std_logic;
	decod_data4_ready : OUT std_logic;
	decod_data5_ready : OUT std_logic;
	decod_data6_ready : OUT std_logic
	);
END manchester_decoder;

-- Design Ports Information
-- decod_comm_ready	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address_ready	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length_ready	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0_ready	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1_ready	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2_ready	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3_ready	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4_ready	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5_ready	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6_ready	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[0]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[1]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[2]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_comm[3]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[0]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[1]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[2]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[3]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[4]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[5]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[6]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[7]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[8]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[9]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[10]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[11]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[12]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[13]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[14]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[15]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[16]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[17]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[18]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_address[19]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[0]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[1]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[2]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[3]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[4]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[5]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[6]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_length[7]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[0]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[1]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[2]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[3]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[4]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[5]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[6]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data0[7]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[0]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[1]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[3]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[4]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[5]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[6]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data1[7]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[0]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[1]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[2]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[3]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[4]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[5]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[6]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data2[7]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[0]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[1]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[2]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[3]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[4]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[5]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[6]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data3[7]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[2]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[3]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[4]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[5]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[6]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data4[7]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[0]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[1]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[2]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[3]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[4]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[5]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[6]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data5[7]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[0]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[1]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[2]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[3]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[4]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[5]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[6]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decod_data6[7]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_16	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_aux_out	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF manchester_decoder IS
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
SIGNAL ww_clk_16 : std_logic;
SIGNAL ww_tx_aux_out : std_logic;
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
SIGNAL \clk_16~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \decod_comm[0]~input_o\ : std_logic;
SIGNAL \decod_comm[1]~input_o\ : std_logic;
SIGNAL \decod_comm[2]~input_o\ : std_logic;
SIGNAL \decod_comm[3]~input_o\ : std_logic;
SIGNAL \decod_address[0]~input_o\ : std_logic;
SIGNAL \decod_address[1]~input_o\ : std_logic;
SIGNAL \decod_address[2]~input_o\ : std_logic;
SIGNAL \decod_address[3]~input_o\ : std_logic;
SIGNAL \decod_address[4]~input_o\ : std_logic;
SIGNAL \decod_address[5]~input_o\ : std_logic;
SIGNAL \decod_address[6]~input_o\ : std_logic;
SIGNAL \decod_address[7]~input_o\ : std_logic;
SIGNAL \decod_address[8]~input_o\ : std_logic;
SIGNAL \decod_address[9]~input_o\ : std_logic;
SIGNAL \decod_address[10]~input_o\ : std_logic;
SIGNAL \decod_address[11]~input_o\ : std_logic;
SIGNAL \decod_address[12]~input_o\ : std_logic;
SIGNAL \decod_address[13]~input_o\ : std_logic;
SIGNAL \decod_address[14]~input_o\ : std_logic;
SIGNAL \decod_address[15]~input_o\ : std_logic;
SIGNAL \decod_address[16]~input_o\ : std_logic;
SIGNAL \decod_address[17]~input_o\ : std_logic;
SIGNAL \decod_address[18]~input_o\ : std_logic;
SIGNAL \decod_address[19]~input_o\ : std_logic;
SIGNAL \decod_length[0]~input_o\ : std_logic;
SIGNAL \decod_length[1]~input_o\ : std_logic;
SIGNAL \decod_length[2]~input_o\ : std_logic;
SIGNAL \decod_length[3]~input_o\ : std_logic;
SIGNAL \decod_length[4]~input_o\ : std_logic;
SIGNAL \decod_length[5]~input_o\ : std_logic;
SIGNAL \decod_length[6]~input_o\ : std_logic;
SIGNAL \decod_length[7]~input_o\ : std_logic;
SIGNAL \decod_data0[0]~input_o\ : std_logic;
SIGNAL \decod_data0[1]~input_o\ : std_logic;
SIGNAL \decod_data0[2]~input_o\ : std_logic;
SIGNAL \decod_data0[3]~input_o\ : std_logic;
SIGNAL \decod_data0[4]~input_o\ : std_logic;
SIGNAL \decod_data0[5]~input_o\ : std_logic;
SIGNAL \decod_data0[6]~input_o\ : std_logic;
SIGNAL \decod_data0[7]~input_o\ : std_logic;
SIGNAL \decod_data1[0]~input_o\ : std_logic;
SIGNAL \decod_data1[1]~input_o\ : std_logic;
SIGNAL \decod_data1[2]~input_o\ : std_logic;
SIGNAL \decod_data1[3]~input_o\ : std_logic;
SIGNAL \decod_data1[4]~input_o\ : std_logic;
SIGNAL \decod_data1[5]~input_o\ : std_logic;
SIGNAL \decod_data1[6]~input_o\ : std_logic;
SIGNAL \decod_data1[7]~input_o\ : std_logic;
SIGNAL \decod_data2[0]~input_o\ : std_logic;
SIGNAL \decod_data2[1]~input_o\ : std_logic;
SIGNAL \decod_data2[2]~input_o\ : std_logic;
SIGNAL \decod_data2[3]~input_o\ : std_logic;
SIGNAL \decod_data2[4]~input_o\ : std_logic;
SIGNAL \decod_data2[5]~input_o\ : std_logic;
SIGNAL \decod_data2[6]~input_o\ : std_logic;
SIGNAL \decod_data2[7]~input_o\ : std_logic;
SIGNAL \decod_data3[0]~input_o\ : std_logic;
SIGNAL \decod_data3[1]~input_o\ : std_logic;
SIGNAL \decod_data3[2]~input_o\ : std_logic;
SIGNAL \decod_data3[3]~input_o\ : std_logic;
SIGNAL \decod_data3[4]~input_o\ : std_logic;
SIGNAL \decod_data3[5]~input_o\ : std_logic;
SIGNAL \decod_data3[6]~input_o\ : std_logic;
SIGNAL \decod_data3[7]~input_o\ : std_logic;
SIGNAL \decod_data4[0]~input_o\ : std_logic;
SIGNAL \decod_data4[1]~input_o\ : std_logic;
SIGNAL \decod_data4[2]~input_o\ : std_logic;
SIGNAL \decod_data4[3]~input_o\ : std_logic;
SIGNAL \decod_data4[4]~input_o\ : std_logic;
SIGNAL \decod_data4[5]~input_o\ : std_logic;
SIGNAL \decod_data4[6]~input_o\ : std_logic;
SIGNAL \decod_data4[7]~input_o\ : std_logic;
SIGNAL \decod_data5[0]~input_o\ : std_logic;
SIGNAL \decod_data5[1]~input_o\ : std_logic;
SIGNAL \decod_data5[2]~input_o\ : std_logic;
SIGNAL \decod_data5[3]~input_o\ : std_logic;
SIGNAL \decod_data5[4]~input_o\ : std_logic;
SIGNAL \decod_data5[5]~input_o\ : std_logic;
SIGNAL \decod_data5[6]~input_o\ : std_logic;
SIGNAL \decod_data5[7]~input_o\ : std_logic;
SIGNAL \decod_data6[0]~input_o\ : std_logic;
SIGNAL \decod_data6[1]~input_o\ : std_logic;
SIGNAL \decod_data6[2]~input_o\ : std_logic;
SIGNAL \decod_data6[3]~input_o\ : std_logic;
SIGNAL \decod_data6[4]~input_o\ : std_logic;
SIGNAL \decod_data6[5]~input_o\ : std_logic;
SIGNAL \decod_data6[6]~input_o\ : std_logic;
SIGNAL \decod_data6[7]~input_o\ : std_logic;
SIGNAL \decod_comm[0]~output_o\ : std_logic;
SIGNAL \decod_comm[1]~output_o\ : std_logic;
SIGNAL \decod_comm[2]~output_o\ : std_logic;
SIGNAL \decod_comm[3]~output_o\ : std_logic;
SIGNAL \decod_address[0]~output_o\ : std_logic;
SIGNAL \decod_address[1]~output_o\ : std_logic;
SIGNAL \decod_address[2]~output_o\ : std_logic;
SIGNAL \decod_address[3]~output_o\ : std_logic;
SIGNAL \decod_address[4]~output_o\ : std_logic;
SIGNAL \decod_address[5]~output_o\ : std_logic;
SIGNAL \decod_address[6]~output_o\ : std_logic;
SIGNAL \decod_address[7]~output_o\ : std_logic;
SIGNAL \decod_address[8]~output_o\ : std_logic;
SIGNAL \decod_address[9]~output_o\ : std_logic;
SIGNAL \decod_address[10]~output_o\ : std_logic;
SIGNAL \decod_address[11]~output_o\ : std_logic;
SIGNAL \decod_address[12]~output_o\ : std_logic;
SIGNAL \decod_address[13]~output_o\ : std_logic;
SIGNAL \decod_address[14]~output_o\ : std_logic;
SIGNAL \decod_address[15]~output_o\ : std_logic;
SIGNAL \decod_address[16]~output_o\ : std_logic;
SIGNAL \decod_address[17]~output_o\ : std_logic;
SIGNAL \decod_address[18]~output_o\ : std_logic;
SIGNAL \decod_address[19]~output_o\ : std_logic;
SIGNAL \decod_length[0]~output_o\ : std_logic;
SIGNAL \decod_length[1]~output_o\ : std_logic;
SIGNAL \decod_length[2]~output_o\ : std_logic;
SIGNAL \decod_length[3]~output_o\ : std_logic;
SIGNAL \decod_length[4]~output_o\ : std_logic;
SIGNAL \decod_length[5]~output_o\ : std_logic;
SIGNAL \decod_length[6]~output_o\ : std_logic;
SIGNAL \decod_length[7]~output_o\ : std_logic;
SIGNAL \decod_data0[0]~output_o\ : std_logic;
SIGNAL \decod_data0[1]~output_o\ : std_logic;
SIGNAL \decod_data0[2]~output_o\ : std_logic;
SIGNAL \decod_data0[3]~output_o\ : std_logic;
SIGNAL \decod_data0[4]~output_o\ : std_logic;
SIGNAL \decod_data0[5]~output_o\ : std_logic;
SIGNAL \decod_data0[6]~output_o\ : std_logic;
SIGNAL \decod_data0[7]~output_o\ : std_logic;
SIGNAL \decod_data1[0]~output_o\ : std_logic;
SIGNAL \decod_data1[1]~output_o\ : std_logic;
SIGNAL \decod_data1[2]~output_o\ : std_logic;
SIGNAL \decod_data1[3]~output_o\ : std_logic;
SIGNAL \decod_data1[4]~output_o\ : std_logic;
SIGNAL \decod_data1[5]~output_o\ : std_logic;
SIGNAL \decod_data1[6]~output_o\ : std_logic;
SIGNAL \decod_data1[7]~output_o\ : std_logic;
SIGNAL \decod_data2[0]~output_o\ : std_logic;
SIGNAL \decod_data2[1]~output_o\ : std_logic;
SIGNAL \decod_data2[2]~output_o\ : std_logic;
SIGNAL \decod_data2[3]~output_o\ : std_logic;
SIGNAL \decod_data2[4]~output_o\ : std_logic;
SIGNAL \decod_data2[5]~output_o\ : std_logic;
SIGNAL \decod_data2[6]~output_o\ : std_logic;
SIGNAL \decod_data2[7]~output_o\ : std_logic;
SIGNAL \decod_data3[0]~output_o\ : std_logic;
SIGNAL \decod_data3[1]~output_o\ : std_logic;
SIGNAL \decod_data3[2]~output_o\ : std_logic;
SIGNAL \decod_data3[3]~output_o\ : std_logic;
SIGNAL \decod_data3[4]~output_o\ : std_logic;
SIGNAL \decod_data3[5]~output_o\ : std_logic;
SIGNAL \decod_data3[6]~output_o\ : std_logic;
SIGNAL \decod_data3[7]~output_o\ : std_logic;
SIGNAL \decod_data4[0]~output_o\ : std_logic;
SIGNAL \decod_data4[1]~output_o\ : std_logic;
SIGNAL \decod_data4[2]~output_o\ : std_logic;
SIGNAL \decod_data4[3]~output_o\ : std_logic;
SIGNAL \decod_data4[4]~output_o\ : std_logic;
SIGNAL \decod_data4[5]~output_o\ : std_logic;
SIGNAL \decod_data4[6]~output_o\ : std_logic;
SIGNAL \decod_data4[7]~output_o\ : std_logic;
SIGNAL \decod_data5[0]~output_o\ : std_logic;
SIGNAL \decod_data5[1]~output_o\ : std_logic;
SIGNAL \decod_data5[2]~output_o\ : std_logic;
SIGNAL \decod_data5[3]~output_o\ : std_logic;
SIGNAL \decod_data5[4]~output_o\ : std_logic;
SIGNAL \decod_data5[5]~output_o\ : std_logic;
SIGNAL \decod_data5[6]~output_o\ : std_logic;
SIGNAL \decod_data5[7]~output_o\ : std_logic;
SIGNAL \decod_data6[0]~output_o\ : std_logic;
SIGNAL \decod_data6[1]~output_o\ : std_logic;
SIGNAL \decod_data6[2]~output_o\ : std_logic;
SIGNAL \decod_data6[3]~output_o\ : std_logic;
SIGNAL \decod_data6[4]~output_o\ : std_logic;
SIGNAL \decod_data6[5]~output_o\ : std_logic;
SIGNAL \decod_data6[6]~output_o\ : std_logic;
SIGNAL \decod_data6[7]~output_o\ : std_logic;
SIGNAL \decod_comm_ready~output_o\ : std_logic;
SIGNAL \decod_address_ready~output_o\ : std_logic;
SIGNAL \decod_length_ready~output_o\ : std_logic;
SIGNAL \decod_data0_ready~output_o\ : std_logic;
SIGNAL \decod_data1_ready~output_o\ : std_logic;
SIGNAL \decod_data2_ready~output_o\ : std_logic;
SIGNAL \decod_data3_ready~output_o\ : std_logic;
SIGNAL \decod_data4_ready~output_o\ : std_logic;
SIGNAL \decod_data5_ready~output_o\ : std_logic;
SIGNAL \decod_data6_ready~output_o\ : std_logic;
SIGNAL \clk_16~input_o\ : std_logic;
SIGNAL \clk_16~inputclkctrl_outclk\ : std_logic;
SIGNAL \tx_aux_out~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \counter_val~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \counter_val~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \aux_val_new~0_combout\ : std_logic;
SIGNAL \aux_val_new~q\ : std_logic;
SIGNAL \bit_validity~0_combout\ : std_logic;
SIGNAL \check_validity~0_combout\ : std_logic;
SIGNAL \bit_validity~1_combout\ : std_logic;
SIGNAL \bit_validity~q\ : std_logic;
SIGNAL \current_state~15_combout\ : std_logic;
SIGNAL \current_state~20_combout\ : std_logic;
SIGNAL \current_state.S_START~q\ : std_logic;
SIGNAL \sync_internal_state~17_combout\ : std_logic;
SIGNAL \sync_stop_next_state~0_combout\ : std_logic;
SIGNAL \sync_internal_state~12_combout\ : std_logic;
SIGNAL \sync_internal_state~13_combout\ : std_logic;
SIGNAL \sync_internal_state.S0~q\ : std_logic;
SIGNAL \sync_internal_state~16_combout\ : std_logic;
SIGNAL \sync_internal_state.S1~q\ : std_logic;
SIGNAL \sync_internal_state~15_combout\ : std_logic;
SIGNAL \sync_internal_state.S2~q\ : std_logic;
SIGNAL \sync_internal_state~14_combout\ : std_logic;
SIGNAL \sync_internal_state.S3~q\ : std_logic;
SIGNAL \sync_internal_state~11_combout\ : std_logic;
SIGNAL \sync_internal_state.S4~q\ : std_logic;
SIGNAL \current_state~12_combout\ : std_logic;
SIGNAL \current_state~16_combout\ : std_logic;
SIGNAL \current_state~17_combout\ : std_logic;
SIGNAL \current_state.S_MESSAGE~q\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \message_decryption~0_combout\ : std_logic;
SIGNAL \bit_index[18]~3_combout\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~56_combout\ : std_logic;
SIGNAL \bit_index[28]~24_combout\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58_combout\ : std_logic;
SIGNAL \bit_index[29]~33_combout\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~60_combout\ : std_logic;
SIGNAL \bit_index[30]~34_combout\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~62_combout\ : std_logic;
SIGNAL \bit_index[31]~32_combout\ : std_logic;
SIGNAL \Equal0~11_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \bit_index~28_combout\ : std_logic;
SIGNAL \bit_index[18]~4_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \bit_index~29_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \bit_index~27_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \bit_index~30_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \bit_index~31_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \bit_index~35_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \bit_index~22_combout\ : std_logic;
SIGNAL \LessThan13~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \bit_index~6_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \bit_index~7_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \bit_index~8_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \bit_index~9_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \bit_index~10_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \bit_index~11_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \bit_index~12_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \bit_index~13_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \bit_index~14_combout\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \bit_index~15_combout\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \bit_index~16_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~14_combout\ : std_logic;
SIGNAL \LessThan13~1_combout\ : std_logic;
SIGNAL \LessThan11~0_combout\ : std_logic;
SIGNAL \message_decryption~1_combout\ : std_logic;
SIGNAL \decod_data6_ready~0_combout\ : std_logic;
SIGNAL \LessThan17~0_combout\ : std_logic;
SIGNAL \LessThan17~1_combout\ : std_logic;
SIGNAL \LessThan17~2_combout\ : std_logic;
SIGNAL \LessThan15~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \decod_length_ready~1_combout\ : std_logic;
SIGNAL \decod_data5_ready~1_combout\ : std_logic;
SIGNAL \LessThan15~1_combout\ : std_logic;
SIGNAL \decod_data5_ready~2_combout\ : std_logic;
SIGNAL \decod_data4_ready~1_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \decod_data6_ready~6_combout\ : std_logic;
SIGNAL \LessThan17~3_combout\ : std_logic;
SIGNAL \decod_data6~18_combout\ : std_logic;
SIGNAL \bit_index~0_combout\ : std_logic;
SIGNAL \decod_comm_ready~1_combout\ : std_logic;
SIGNAL \decod_length_ready~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \decod_comm_ready~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \message_decryption~2_combout\ : std_logic;
SIGNAL \LessThan5~2_combout\ : std_logic;
SIGNAL \LessThan5~4_combout\ : std_logic;
SIGNAL \LessThan7~0_combout\ : std_logic;
SIGNAL \LessThan7~2_combout\ : std_logic;
SIGNAL \message_decryption~3_combout\ : std_logic;
SIGNAL \message_decryption~4_combout\ : std_logic;
SIGNAL \LessThan9~0_combout\ : std_logic;
SIGNAL \decod_data2_ready~0_combout\ : std_logic;
SIGNAL \message_decryption~5_combout\ : std_logic;
SIGNAL \decod_data5~18_combout\ : std_logic;
SIGNAL \decod_data5~19_combout\ : std_logic;
SIGNAL \decod_data5~20_combout\ : std_logic;
SIGNAL \bit_index~1_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \bit_index~17_combout\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \bit_index~18_combout\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \bit_index~19_combout\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \bit_index~20_combout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \bit_index~21_combout\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~46_combout\ : std_logic;
SIGNAL \bit_index~2_combout\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48_combout\ : std_logic;
SIGNAL \bit_index~5_combout\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~50_combout\ : std_logic;
SIGNAL \bit_index~23_combout\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52_combout\ : std_logic;
SIGNAL \bit_index~26_combout\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54_combout\ : std_logic;
SIGNAL \bit_index~25_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \Equal0~13_combout\ : std_logic;
SIGNAL \Equal0~12_combout\ : std_logic;
SIGNAL \current_state~13_combout\ : std_logic;
SIGNAL \current_state~18_combout\ : std_logic;
SIGNAL \current_state.S_STOP~q\ : std_logic;
SIGNAL \stop_internal_state~16_combout\ : std_logic;
SIGNAL \stop_internal_state~12_combout\ : std_logic;
SIGNAL \stop_internal_state.S0~q\ : std_logic;
SIGNAL \stop_internal_state~15_combout\ : std_logic;
SIGNAL \stop_internal_state.S1~q\ : std_logic;
SIGNAL \stop_internal_state~14_combout\ : std_logic;
SIGNAL \stop_internal_state.S2~q\ : std_logic;
SIGNAL \stop_internal_state~13_combout\ : std_logic;
SIGNAL \stop_internal_state.S3~q\ : std_logic;
SIGNAL \stop_internal_state~11_combout\ : std_logic;
SIGNAL \stop_internal_state.S4~q\ : std_logic;
SIGNAL \current_state~14_combout\ : std_logic;
SIGNAL \current_state~19_combout\ : std_logic;
SIGNAL \current_state.S_IDLE~q\ : std_logic;
SIGNAL \transaction_begin~0_combout\ : std_logic;
SIGNAL \transaction_begin~q\ : std_logic;
SIGNAL \counter_val~1_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \counter_val~3_combout\ : std_logic;
SIGNAL \aux_val_prev~1_combout\ : std_logic;
SIGNAL \aux_val_prev~0_combout\ : std_logic;
SIGNAL \aux_val_prev~2_combout\ : std_logic;
SIGNAL \aux_val_prev~q\ : std_logic;
SIGNAL \decod_comm~14_combout\ : std_logic;
SIGNAL \decod_comm~10_combout\ : std_logic;
SIGNAL \decod_comm[0]~reg0_q\ : std_logic;
SIGNAL \decod_comm~11_combout\ : std_logic;
SIGNAL \decod_comm[1]~reg0_q\ : std_logic;
SIGNAL \decod_comm~12_combout\ : std_logic;
SIGNAL \decod_comm[2]~reg0_q\ : std_logic;
SIGNAL \decod_comm~13_combout\ : std_logic;
SIGNAL \decod_comm[3]~reg0_q\ : std_logic;
SIGNAL \decod_address~40_combout\ : std_logic;
SIGNAL \decod_address~41_combout\ : std_logic;
SIGNAL \decod_address[0]~reg0_q\ : std_logic;
SIGNAL \decod_address~42_combout\ : std_logic;
SIGNAL \decod_address[1]~reg0_q\ : std_logic;
SIGNAL \decod_address~43_combout\ : std_logic;
SIGNAL \decod_address[2]~reg0_q\ : std_logic;
SIGNAL \decod_address~44_combout\ : std_logic;
SIGNAL \decod_address[3]~reg0_q\ : std_logic;
SIGNAL \decod_address~45_combout\ : std_logic;
SIGNAL \decod_address[4]~reg0_q\ : std_logic;
SIGNAL \decod_address~46_combout\ : std_logic;
SIGNAL \decod_address[5]~reg0_q\ : std_logic;
SIGNAL \decod_address~47_combout\ : std_logic;
SIGNAL \decod_address[6]~reg0_q\ : std_logic;
SIGNAL \decod_address~48_combout\ : std_logic;
SIGNAL \decod_address[7]~reg0_q\ : std_logic;
SIGNAL \decod_address~49_combout\ : std_logic;
SIGNAL \decod_address[8]~reg0_q\ : std_logic;
SIGNAL \decod_address~50_combout\ : std_logic;
SIGNAL \decod_address[9]~reg0_q\ : std_logic;
SIGNAL \decod_address~51_combout\ : std_logic;
SIGNAL \decod_address[10]~reg0_q\ : std_logic;
SIGNAL \decod_address~52_combout\ : std_logic;
SIGNAL \decod_address[11]~reg0_q\ : std_logic;
SIGNAL \decod_address~53_combout\ : std_logic;
SIGNAL \decod_address[12]~reg0_q\ : std_logic;
SIGNAL \decod_address~54_combout\ : std_logic;
SIGNAL \decod_address[13]~reg0_q\ : std_logic;
SIGNAL \decod_address~55_combout\ : std_logic;
SIGNAL \decod_address[14]~reg0_q\ : std_logic;
SIGNAL \decod_address~56_combout\ : std_logic;
SIGNAL \decod_address[15]~reg0_q\ : std_logic;
SIGNAL \decod_address~57_combout\ : std_logic;
SIGNAL \decod_address[16]~reg0_q\ : std_logic;
SIGNAL \decod_address~58_combout\ : std_logic;
SIGNAL \decod_address[17]~reg0_q\ : std_logic;
SIGNAL \decod_address~59_combout\ : std_logic;
SIGNAL \decod_address[18]~reg0_q\ : std_logic;
SIGNAL \decod_address~60_combout\ : std_logic;
SIGNAL \decod_address[19]~reg0_q\ : std_logic;
SIGNAL \decod_length~16_combout\ : std_logic;
SIGNAL \decod_length~17_combout\ : std_logic;
SIGNAL \decod_length[0]~reg0_q\ : std_logic;
SIGNAL \decod_length~18_combout\ : std_logic;
SIGNAL \decod_length[1]~reg0_q\ : std_logic;
SIGNAL \decod_length~19_combout\ : std_logic;
SIGNAL \decod_length[2]~reg0_q\ : std_logic;
SIGNAL \decod_length~20_combout\ : std_logic;
SIGNAL \decod_length[3]~reg0_q\ : std_logic;
SIGNAL \decod_length~21_combout\ : std_logic;
SIGNAL \decod_length[4]~reg0_q\ : std_logic;
SIGNAL \decod_length~22_combout\ : std_logic;
SIGNAL \decod_length[5]~reg0_q\ : std_logic;
SIGNAL \decod_length~23_combout\ : std_logic;
SIGNAL \decod_length[6]~reg0_q\ : std_logic;
SIGNAL \decod_length~24_combout\ : std_logic;
SIGNAL \decod_length[7]~reg0_q\ : std_logic;
SIGNAL \decod_data2~16_combout\ : std_logic;
SIGNAL \decod_data0~16_combout\ : std_logic;
SIGNAL \decod_data0~17_combout\ : std_logic;
SIGNAL \decod_data0[0]~reg0_q\ : std_logic;
SIGNAL \decod_data0~18_combout\ : std_logic;
SIGNAL \decod_data0[1]~reg0_q\ : std_logic;
SIGNAL \decod_data0~19_combout\ : std_logic;
SIGNAL \decod_data0[2]~reg0_q\ : std_logic;
SIGNAL \decod_data0~20_combout\ : std_logic;
SIGNAL \decod_data0[3]~reg0_q\ : std_logic;
SIGNAL \decod_data0~21_combout\ : std_logic;
SIGNAL \decod_data0[4]~reg0_q\ : std_logic;
SIGNAL \decod_data0~22_combout\ : std_logic;
SIGNAL \decod_data0[5]~reg0_q\ : std_logic;
SIGNAL \decod_data0~23_combout\ : std_logic;
SIGNAL \decod_data0[6]~reg0_q\ : std_logic;
SIGNAL \decod_data0~24_combout\ : std_logic;
SIGNAL \decod_data0[7]~reg0_q\ : std_logic;
SIGNAL \decod_data1_ready~2_combout\ : std_logic;
SIGNAL \decod_data1~16_combout\ : std_logic;
SIGNAL \decod_data1~17_combout\ : std_logic;
SIGNAL \decod_data1[0]~reg0_q\ : std_logic;
SIGNAL \decod_data1~18_combout\ : std_logic;
SIGNAL \decod_data1[1]~reg0_q\ : std_logic;
SIGNAL \decod_data1~19_combout\ : std_logic;
SIGNAL \decod_data1[2]~reg0_q\ : std_logic;
SIGNAL \decod_data1~20_combout\ : std_logic;
SIGNAL \decod_data1[3]~reg0_q\ : std_logic;
SIGNAL \decod_data1~21_combout\ : std_logic;
SIGNAL \decod_data1[4]~reg0_q\ : std_logic;
SIGNAL \decod_data1~22_combout\ : std_logic;
SIGNAL \decod_data1[5]~reg0_q\ : std_logic;
SIGNAL \decod_data1~23_combout\ : std_logic;
SIGNAL \decod_data1[6]~reg0_q\ : std_logic;
SIGNAL \decod_data1~24_combout\ : std_logic;
SIGNAL \decod_data1[7]~reg0_q\ : std_logic;
SIGNAL \decod_data2~17_combout\ : std_logic;
SIGNAL \decod_data2~18_combout\ : std_logic;
SIGNAL \decod_data2[0]~reg0_q\ : std_logic;
SIGNAL \decod_data2~19_combout\ : std_logic;
SIGNAL \decod_data2[1]~reg0_q\ : std_logic;
SIGNAL \decod_data2~20_combout\ : std_logic;
SIGNAL \decod_data2[2]~reg0_q\ : std_logic;
SIGNAL \decod_data2~21_combout\ : std_logic;
SIGNAL \decod_data2[3]~reg0_q\ : std_logic;
SIGNAL \decod_data2~22_combout\ : std_logic;
SIGNAL \decod_data2[4]~reg0_q\ : std_logic;
SIGNAL \decod_data2~23_combout\ : std_logic;
SIGNAL \decod_data2[5]~reg0_q\ : std_logic;
SIGNAL \decod_data2~24_combout\ : std_logic;
SIGNAL \decod_data2[6]~reg0_q\ : std_logic;
SIGNAL \decod_data2~25_combout\ : std_logic;
SIGNAL \decod_data2[7]~reg0_q\ : std_logic;
SIGNAL \decod_data3~16_combout\ : std_logic;
SIGNAL \decod_data3~17_combout\ : std_logic;
SIGNAL \decod_data3[0]~reg0_q\ : std_logic;
SIGNAL \decod_data3~18_combout\ : std_logic;
SIGNAL \decod_data3[1]~reg0_q\ : std_logic;
SIGNAL \decod_data3~19_combout\ : std_logic;
SIGNAL \decod_data3[2]~reg0_q\ : std_logic;
SIGNAL \decod_data3~20_combout\ : std_logic;
SIGNAL \decod_data3[3]~reg0_q\ : std_logic;
SIGNAL \decod_data3~21_combout\ : std_logic;
SIGNAL \decod_data3[4]~reg0_q\ : std_logic;
SIGNAL \decod_data3~22_combout\ : std_logic;
SIGNAL \decod_data3[5]~reg0_q\ : std_logic;
SIGNAL \decod_data3~23_combout\ : std_logic;
SIGNAL \decod_data3[6]~reg0_q\ : std_logic;
SIGNAL \decod_data3~24_combout\ : std_logic;
SIGNAL \decod_data3[7]~reg0_q\ : std_logic;
SIGNAL \decod_data4~16_combout\ : std_logic;
SIGNAL \decod_data4~17_combout\ : std_logic;
SIGNAL \decod_data4[0]~reg0_q\ : std_logic;
SIGNAL \decod_data4~18_combout\ : std_logic;
SIGNAL \decod_data4[1]~reg0_q\ : std_logic;
SIGNAL \decod_data4~19_combout\ : std_logic;
SIGNAL \decod_data4[2]~reg0_q\ : std_logic;
SIGNAL \decod_data4~20_combout\ : std_logic;
SIGNAL \decod_data4[3]~reg0_q\ : std_logic;
SIGNAL \decod_data4~21_combout\ : std_logic;
SIGNAL \decod_data4[4]~reg0_q\ : std_logic;
SIGNAL \decod_data4~22_combout\ : std_logic;
SIGNAL \decod_data4[5]~reg0_q\ : std_logic;
SIGNAL \decod_data4~23_combout\ : std_logic;
SIGNAL \decod_data4[6]~reg0_q\ : std_logic;
SIGNAL \decod_data4~24_combout\ : std_logic;
SIGNAL \decod_data4[7]~reg0_q\ : std_logic;
SIGNAL \decod_data5~21_combout\ : std_logic;
SIGNAL \decod_data5~30_combout\ : std_logic;
SIGNAL \decod_data5~22_combout\ : std_logic;
SIGNAL \decod_data5[0]~reg0_q\ : std_logic;
SIGNAL \decod_data5~23_combout\ : std_logic;
SIGNAL \decod_data5[1]~reg0_q\ : std_logic;
SIGNAL \decod_data5~24_combout\ : std_logic;
SIGNAL \decod_data5[2]~reg0_q\ : std_logic;
SIGNAL \decod_data5~25_combout\ : std_logic;
SIGNAL \decod_data5[3]~reg0_q\ : std_logic;
SIGNAL \decod_data5~26_combout\ : std_logic;
SIGNAL \decod_data5[4]~reg0_q\ : std_logic;
SIGNAL \decod_data5~27_combout\ : std_logic;
SIGNAL \decod_data5[5]~reg0_q\ : std_logic;
SIGNAL \decod_data5~28_combout\ : std_logic;
SIGNAL \decod_data5[6]~reg0_q\ : std_logic;
SIGNAL \decod_data5~29_combout\ : std_logic;
SIGNAL \decod_data5[7]~reg0_q\ : std_logic;
SIGNAL \decod_data6~27_combout\ : std_logic;
SIGNAL \decod_data6~19_combout\ : std_logic;
SIGNAL \decod_data6[0]~reg0_q\ : std_logic;
SIGNAL \decod_data6~20_combout\ : std_logic;
SIGNAL \decod_data6[1]~reg0_q\ : std_logic;
SIGNAL \decod_data6~21_combout\ : std_logic;
SIGNAL \decod_data6[2]~reg0_q\ : std_logic;
SIGNAL \decod_data6~22_combout\ : std_logic;
SIGNAL \decod_data6[3]~reg0_q\ : std_logic;
SIGNAL \decod_data6~23_combout\ : std_logic;
SIGNAL \decod_data6[4]~reg0_q\ : std_logic;
SIGNAL \decod_data6~24_combout\ : std_logic;
SIGNAL \decod_data6[5]~reg0_q\ : std_logic;
SIGNAL \decod_data6~25_combout\ : std_logic;
SIGNAL \decod_data6[6]~reg0_q\ : std_logic;
SIGNAL \decod_data6~26_combout\ : std_logic;
SIGNAL \decod_data6[7]~reg0_q\ : std_logic;
SIGNAL \decod_comm_ready~2_combout\ : std_logic;
SIGNAL \decod_comm_ready~3_combout\ : std_logic;
SIGNAL \decod_comm_ready~reg0_q\ : std_logic;
SIGNAL \decod_address_ready~1_combout\ : std_logic;
SIGNAL \decod_data6_ready~1_combout\ : std_logic;
SIGNAL \decod_address_ready~0_combout\ : std_logic;
SIGNAL \decod_address_ready~2_combout\ : std_logic;
SIGNAL \decod_address_ready~reg0_q\ : std_logic;
SIGNAL \decod_length_ready~3_combout\ : std_logic;
SIGNAL \decod_length_ready~2_combout\ : std_logic;
SIGNAL \decod_length_ready~4_combout\ : std_logic;
SIGNAL \decod_length_ready~reg0_q\ : std_logic;
SIGNAL \LessThan7~1_combout\ : std_logic;
SIGNAL \decod_data0_ready~0_combout\ : std_logic;
SIGNAL \decod_data0_ready~1_combout\ : std_logic;
SIGNAL \decod_data0_ready~reg0_q\ : std_logic;
SIGNAL \decod_data1_ready~0_combout\ : std_logic;
SIGNAL \decod_data1_ready~1_combout\ : std_logic;
SIGNAL \decod_data1_ready~3_combout\ : std_logic;
SIGNAL \decod_data1_ready~reg0_q\ : std_logic;
SIGNAL \decod_data5_ready~0_combout\ : std_logic;
SIGNAL \LessThan5~3_combout\ : std_logic;
SIGNAL \decod_data2_ready~1_combout\ : std_logic;
SIGNAL \decod_data2_ready~2_combout\ : std_logic;
SIGNAL \decod_data2_ready~reg0_q\ : std_logic;
SIGNAL \decod_data3_ready~0_combout\ : std_logic;
SIGNAL \decod_data3_ready~reg0_q\ : std_logic;
SIGNAL \decod_data6_ready~3_combout\ : std_logic;
SIGNAL \decod_data6_ready~2_combout\ : std_logic;
SIGNAL \decod_data6_ready~4_combout\ : std_logic;
SIGNAL \decod_data4_ready~0_combout\ : std_logic;
SIGNAL \decod_data6_ready~5_combout\ : std_logic;
SIGNAL \decod_data4_ready~2_combout\ : std_logic;
SIGNAL \decod_data4_ready~reg0_q\ : std_logic;
SIGNAL \decod_data5_ready~3_combout\ : std_logic;
SIGNAL \decod_data5_ready~4_combout\ : std_logic;
SIGNAL \decod_data5_ready~5_combout\ : std_logic;
SIGNAL \decod_data5_ready~reg0_q\ : std_logic;
SIGNAL \decod_data6_ready~7_combout\ : std_logic;
SIGNAL \decod_data6_ready~8_combout\ : std_logic;
SIGNAL \decod_data6_ready~reg0_q\ : std_logic;
SIGNAL bit_index : std_logic_vector(31 DOWNTO 0);
SIGNAL counter_val : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_reset <= reset;
ww_clk_16 <= clk_16;
ww_tx_aux_out <= tx_aux_out;
decod_comm_ready <= ww_decod_comm_ready;
decod_address_ready <= ww_decod_address_ready;
decod_length_ready <= ww_decod_length_ready;
decod_data0_ready <= ww_decod_data0_ready;
decod_data1_ready <= ww_decod_data1_ready;
decod_data2_ready <= ww_decod_data2_ready;
decod_data3_ready <= ww_decod_data3_ready;
decod_data4_ready <= ww_decod_data4_ready;
decod_data5_ready <= ww_decod_data5_ready;
decod_data6_ready <= ww_decod_data6_ready;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_16~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_16~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y9_N9
\decod_comm[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_comm[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_comm[0]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\decod_comm[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_comm[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_comm[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\decod_comm[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_comm[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_comm[2]~output_o\);

-- Location: IOOBUF_X0_Y5_N23
\decod_comm[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_comm[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_comm[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N2
\decod_address[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[0]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\decod_address[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[1]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\decod_address[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[2]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\decod_address[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\decod_address[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[4]~output_o\);

-- Location: IOOBUF_X0_Y21_N9
\decod_address[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[5]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\decod_address[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[6]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\decod_address[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[7]~output_o\);

-- Location: IOOBUF_X7_Y24_N16
\decod_address[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[8]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[8]~output_o\);

-- Location: IOOBUF_X5_Y24_N23
\decod_address[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[9]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[9]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\decod_address[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[10]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[10]~output_o\);

-- Location: IOOBUF_X11_Y24_N23
\decod_address[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[11]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[11]~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\decod_address[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[12]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[12]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\decod_address[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[13]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[13]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\decod_address[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[14]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[14]~output_o\);

-- Location: IOOBUF_X5_Y24_N2
\decod_address[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[15]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[15]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\decod_address[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[16]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[16]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\decod_address[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[17]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[17]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\decod_address[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[18]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[18]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\decod_address[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address[19]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_address[19]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\decod_length[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[0]~output_o\);

-- Location: IOOBUF_X3_Y24_N9
\decod_length[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[1]~output_o\);

-- Location: IOOBUF_X5_Y24_N16
\decod_length[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[2]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\decod_length[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[3]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\decod_length[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[4]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\decod_length[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[5]~output_o\);

-- Location: IOOBUF_X9_Y24_N23
\decod_length[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[6]~output_o\);

-- Location: IOOBUF_X9_Y24_N16
\decod_length[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_length[7]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\decod_data0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\decod_data0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[1]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\decod_data0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\decod_data0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[3]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\decod_data0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[4]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\decod_data0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[5]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\decod_data0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[6]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\decod_data0[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data0[7]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\decod_data1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[0]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\decod_data1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[1]~output_o\);

-- Location: IOOBUF_X25_Y24_N2
\decod_data1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[2]~output_o\);

-- Location: IOOBUF_X0_Y10_N2
\decod_data1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[3]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\decod_data1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[4]~output_o\);

-- Location: IOOBUF_X1_Y24_N2
\decod_data1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[5]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\decod_data1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[6]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\decod_data1[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data1[7]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\decod_data2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[0]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\decod_data2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[1]~output_o\);

-- Location: IOOBUF_X0_Y19_N23
\decod_data2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N2
\decod_data2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[3]~output_o\);

-- Location: IOOBUF_X0_Y7_N23
\decod_data2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[4]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\decod_data2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[5]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\decod_data2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[6]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\decod_data2[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data2[7]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\decod_data3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[0]~output_o\);

-- Location: IOOBUF_X25_Y24_N23
\decod_data3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\decod_data3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[2]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\decod_data3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[3]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\decod_data3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[4]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\decod_data3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\decod_data3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[6]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\decod_data3[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data3[7]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\decod_data4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\decod_data4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[1]~output_o\);

-- Location: IOOBUF_X25_Y24_N9
\decod_data4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[2]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\decod_data4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[3]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\decod_data4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\decod_data4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[5]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\decod_data4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[6]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\decod_data4[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data4[7]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\decod_data5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[0]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\decod_data5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[1]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\decod_data5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[2]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\decod_data5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[3]~output_o\);

-- Location: IOOBUF_X0_Y19_N16
\decod_data5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[4]~output_o\);

-- Location: IOOBUF_X13_Y24_N9
\decod_data5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[5]~output_o\);

-- Location: IOOBUF_X32_Y24_N23
\decod_data5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[6]~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\decod_data5[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data5[7]~output_o\);

-- Location: IOOBUF_X18_Y24_N9
\decod_data6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\decod_data6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[1]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\decod_data6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[2]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\decod_data6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[3]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\decod_data6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[4]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[4]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\decod_data6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[5]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[5]~output_o\);

-- Location: IOOBUF_X34_Y19_N9
\decod_data6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[6]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[6]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\decod_data6[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6[7]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \decod_data6[7]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\decod_comm_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_comm_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_comm_ready~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\decod_address_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_address_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_address_ready~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\decod_length_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_length_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_length_ready~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\decod_data0_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data0_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data0_ready~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\decod_data1_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data1_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data1_ready~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\decod_data2_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data2_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data2_ready~output_o\);

-- Location: IOOBUF_X34_Y19_N2
\decod_data3_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data3_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data3_ready~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\decod_data4_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data4_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data4_ready~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\decod_data5_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data5_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data5_ready~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\decod_data6_ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decod_data6_ready~reg0_q\,
	devoe => ww_devoe,
	o => \decod_data6_ready~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk_16~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_16,
	o => \clk_16~input_o\);

-- Location: CLKCTRL_G2
\clk_16~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_16~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_16~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y11_N22
\tx_aux_out~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_aux_out,
	o => \tx_aux_out~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X5_Y17_N22
\counter_val~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_val~2_combout\ = (!\reset~input_o\ & (!\transaction_begin~q\ & (counter_val(0) $ (counter_val(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => counter_val(0),
	datac => counter_val(1),
	datad => \transaction_begin~q\,
	combout => \counter_val~2_combout\);

-- Location: FF_X5_Y17_N23
\counter_val[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \counter_val~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_val(1));

-- Location: LCCOMB_X5_Y17_N18
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = counter_val(2) $ (((counter_val(1) & counter_val(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(2),
	datac => counter_val(1),
	datad => counter_val(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X5_Y17_N6
\counter_val~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_val~0_combout\ = (!\reset~input_o\ & (\Add0~0_combout\ & !\transaction_begin~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \Add0~0_combout\,
	datad => \transaction_begin~q\,
	combout => \counter_val~0_combout\);

-- Location: FF_X5_Y17_N7
\counter_val[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \counter_val~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_val(2));

-- Location: LCCOMB_X5_Y17_N16
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!counter_val(3) & (!counter_val(0) & (!counter_val(1) & !counter_val(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(3),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(2),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X5_Y17_N0
\aux_val_new~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aux_val_new~0_combout\ = (\Equal2~0_combout\ & (\tx_aux_out~input_o\)) # (!\Equal2~0_combout\ & ((\current_state.S_IDLE~q\ & ((\aux_val_new~q\))) # (!\current_state.S_IDLE~q\ & (\tx_aux_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_aux_out~input_o\,
	datab => \Equal2~0_combout\,
	datac => \aux_val_new~q\,
	datad => \current_state.S_IDLE~q\,
	combout => \aux_val_new~0_combout\);

-- Location: FF_X5_Y17_N1
aux_val_new : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \aux_val_new~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aux_val_new~q\);

-- Location: LCCOMB_X5_Y18_N24
\bit_validity~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_validity~0_combout\ = \aux_val_new~q\ $ (\aux_val_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \aux_val_new~q\,
	datad => \aux_val_prev~q\,
	combout => \bit_validity~0_combout\);

-- Location: LCCOMB_X5_Y17_N2
\check_validity~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \check_validity~0_combout\ = (!counter_val(3) & (counter_val(0) & (!counter_val(1) & !counter_val(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(3),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(2),
	combout => \check_validity~0_combout\);

-- Location: LCCOMB_X5_Y17_N8
\bit_validity~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_validity~1_combout\ = (\current_state.S_IDLE~q\ & ((\check_validity~0_combout\ & (\bit_validity~0_combout\)) # (!\check_validity~0_combout\ & ((\bit_validity~q\))))) # (!\current_state.S_IDLE~q\ & (((\bit_validity~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_IDLE~q\,
	datab => \bit_validity~0_combout\,
	datac => \bit_validity~q\,
	datad => \check_validity~0_combout\,
	combout => \bit_validity~1_combout\);

-- Location: FF_X5_Y17_N9
bit_validity : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_validity~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_validity~q\);

-- Location: LCCOMB_X6_Y17_N18
\current_state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~15_combout\ = (\current_state~14_combout\ & (\current_state~13_combout\ & ((!\current_state.S_START~q\) # (!\sync_internal_state.S4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sync_internal_state.S4~q\,
	datab => \current_state.S_START~q\,
	datac => \current_state~14_combout\,
	datad => \current_state~13_combout\,
	combout => \current_state~15_combout\);

-- Location: LCCOMB_X6_Y17_N28
\current_state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~20_combout\ = (\current_state~15_combout\ & ((\current_state.S_START~q\) # ((!\current_state.S_IDLE~q\ & \transaction_begin~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_IDLE~q\,
	datab => \transaction_begin~q\,
	datac => \current_state.S_START~q\,
	datad => \current_state~15_combout\,
	combout => \current_state~20_combout\);

-- Location: FF_X6_Y17_N29
\current_state.S_START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \current_state~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_START~q\);

-- Location: LCCOMB_X6_Y17_N12
\sync_internal_state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~17_combout\ = (!\sync_internal_state.S4~q\ & (!\bit_validity~q\ & \current_state.S_START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sync_internal_state.S4~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \sync_internal_state~17_combout\);

-- Location: LCCOMB_X6_Y17_N22
\sync_stop_next_state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_stop_next_state~0_combout\ = (!\bit_validity~q\ & ((\current_state.S_STOP~q\) # (\current_state.S_MESSAGE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_validity~q\,
	datab => \current_state.S_STOP~q\,
	datac => \current_state.S_MESSAGE~q\,
	combout => \sync_stop_next_state~0_combout\);

-- Location: LCCOMB_X5_Y17_N10
\sync_internal_state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~12_combout\ = (!counter_val(2) & (!counter_val(0) & (counter_val(1) & !counter_val(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(2),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(3),
	combout => \sync_internal_state~12_combout\);

-- Location: LCCOMB_X6_Y17_N0
\sync_internal_state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~13_combout\ = (\reset~input_o\) # ((!\sync_stop_next_state~0_combout\ & \sync_internal_state~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \sync_stop_next_state~0_combout\,
	datad => \sync_internal_state~12_combout\,
	combout => \sync_internal_state~13_combout\);

-- Location: FF_X6_Y17_N13
\sync_internal_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \sync_internal_state~17_combout\,
	sclr => \reset~input_o\,
	ena => \sync_internal_state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_internal_state.S0~q\);

-- Location: LCCOMB_X6_Y17_N26
\sync_internal_state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~16_combout\ = (!\sync_internal_state.S0~q\ & (!\bit_validity~q\ & \current_state.S_START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sync_internal_state.S0~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \sync_internal_state~16_combout\);

-- Location: FF_X6_Y17_N27
\sync_internal_state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \sync_internal_state~16_combout\,
	sclr => \reset~input_o\,
	ena => \sync_internal_state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_internal_state.S1~q\);

-- Location: LCCOMB_X6_Y17_N4
\sync_internal_state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~15_combout\ = (\sync_internal_state.S1~q\ & (!\bit_validity~q\ & \current_state.S_START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sync_internal_state.S1~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \sync_internal_state~15_combout\);

-- Location: FF_X6_Y17_N5
\sync_internal_state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \sync_internal_state~15_combout\,
	sclr => \reset~input_o\,
	ena => \sync_internal_state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_internal_state.S2~q\);

-- Location: LCCOMB_X6_Y17_N2
\sync_internal_state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~14_combout\ = (\sync_internal_state.S2~q\ & (!\bit_validity~q\ & \current_state.S_START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sync_internal_state.S2~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \sync_internal_state~14_combout\);

-- Location: FF_X6_Y17_N3
\sync_internal_state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \sync_internal_state~14_combout\,
	sclr => \reset~input_o\,
	ena => \sync_internal_state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_internal_state.S3~q\);

-- Location: LCCOMB_X6_Y17_N8
\sync_internal_state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \sync_internal_state~11_combout\ = (\sync_internal_state.S3~q\ & (!\bit_validity~q\ & \current_state.S_START~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sync_internal_state.S3~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \sync_internal_state~11_combout\);

-- Location: FF_X6_Y17_N9
\sync_internal_state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \sync_internal_state~11_combout\,
	sclr => \reset~input_o\,
	ena => \sync_internal_state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_internal_state.S4~q\);

-- Location: LCCOMB_X6_Y17_N10
\current_state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~12_combout\ = (\sync_internal_state.S4~q\ & \current_state.S_START~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sync_internal_state.S4~q\,
	datad => \current_state.S_START~q\,
	combout => \current_state~12_combout\);

-- Location: LCCOMB_X6_Y17_N20
\current_state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~16_combout\ = ((!\current_state.S_IDLE~q\ & \transaction_begin~q\)) # (!\current_state~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_IDLE~q\,
	datab => \transaction_begin~q\,
	datad => \current_state~15_combout\,
	combout => \current_state~16_combout\);

-- Location: LCCOMB_X6_Y17_N14
\current_state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~17_combout\ = (\current_state~16_combout\ & (\current_state~12_combout\ & (!\reset~input_o\))) # (!\current_state~16_combout\ & (((\current_state.S_MESSAGE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~12_combout\,
	datab => \reset~input_o\,
	datac => \current_state.S_MESSAGE~q\,
	datad => \current_state~16_combout\,
	combout => \current_state~17_combout\);

-- Location: FF_X6_Y17_N15
\current_state.S_MESSAGE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \current_state~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_MESSAGE~q\);

-- Location: LCCOMB_X5_Y17_N26
\Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (counter_val(2) & (!counter_val(0) & (!counter_val(1) & !counter_val(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(2),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(3),
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X7_Y17_N2
\message_decryption~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~0_combout\ = (\current_state.S_MESSAGE~q\ & (\bit_validity~q\ & \Equal5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_MESSAGE~q\,
	datac => \bit_validity~q\,
	datad => \Equal5~0_combout\,
	combout => \message_decryption~0_combout\);

-- Location: LCCOMB_X7_Y17_N0
\bit_index[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[18]~3_combout\ = (\reset~input_o\) # ((\current_state.S_STOP~q\ & (!\message_decryption~0_combout\ & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_STOP~q\,
	datab => \reset~input_o\,
	datac => \message_decryption~0_combout\,
	datad => \Equal5~0_combout\,
	combout => \bit_index[18]~3_combout\);

-- Location: LCCOMB_X14_Y18_N22
\Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~54_combout\ = (bit_index(27) & (!\Add1~53\)) # (!bit_index(27) & ((\Add1~53\) # (GND)))
-- \Add1~55\ = CARRY((!\Add1~53\) # (!bit_index(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(27),
	datad => VCC,
	cin => \Add1~53\,
	combout => \Add1~54_combout\,
	cout => \Add1~55\);

-- Location: LCCOMB_X14_Y18_N24
\Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~56_combout\ = (bit_index(28) & (\Add1~55\ $ (GND))) # (!bit_index(28) & (!\Add1~55\ & VCC))
-- \Add1~57\ = CARRY((bit_index(28) & !\Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(28),
	datad => VCC,
	cin => \Add1~55\,
	combout => \Add1~56_combout\,
	cout => \Add1~57\);

-- Location: LCCOMB_X9_Y18_N2
\bit_index[28]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[28]~24_combout\ = (\bit_index~1_combout\ & (\Add1~56_combout\)) # (!\bit_index~1_combout\ & (((!\bit_index[18]~3_combout\ & bit_index(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~56_combout\,
	datab => \bit_index[18]~3_combout\,
	datac => bit_index(28),
	datad => \bit_index~1_combout\,
	combout => \bit_index[28]~24_combout\);

-- Location: FF_X9_Y18_N3
\bit_index[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index[28]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(28));

-- Location: LCCOMB_X14_Y18_N26
\Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~58_combout\ = (bit_index(29) & (!\Add1~57\)) # (!bit_index(29) & ((\Add1~57\) # (GND)))
-- \Add1~59\ = CARRY((!\Add1~57\) # (!bit_index(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(29),
	datad => VCC,
	cin => \Add1~57\,
	combout => \Add1~58_combout\,
	cout => \Add1~59\);

-- Location: LCCOMB_X8_Y18_N4
\bit_index[29]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[29]~33_combout\ = (\bit_index~1_combout\ & (((\Add1~58_combout\)))) # (!\bit_index~1_combout\ & (!\bit_index[18]~3_combout\ & ((bit_index(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_index[18]~3_combout\,
	datab => \Add1~58_combout\,
	datac => bit_index(29),
	datad => \bit_index~1_combout\,
	combout => \bit_index[29]~33_combout\);

-- Location: FF_X8_Y18_N5
\bit_index[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index[29]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(29));

-- Location: LCCOMB_X14_Y18_N28
\Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~60_combout\ = (bit_index(30) & (\Add1~59\ $ (GND))) # (!bit_index(30) & (!\Add1~59\ & VCC))
-- \Add1~61\ = CARRY((bit_index(30) & !\Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(30),
	datad => VCC,
	cin => \Add1~59\,
	combout => \Add1~60_combout\,
	cout => \Add1~61\);

-- Location: LCCOMB_X8_Y18_N18
\bit_index[30]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[30]~34_combout\ = (\bit_index~1_combout\ & (((\Add1~60_combout\)))) # (!\bit_index~1_combout\ & (!\bit_index[18]~3_combout\ & ((bit_index(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_index[18]~3_combout\,
	datab => \Add1~60_combout\,
	datac => bit_index(30),
	datad => \bit_index~1_combout\,
	combout => \bit_index[30]~34_combout\);

-- Location: FF_X8_Y18_N19
\bit_index[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index[30]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(30));

-- Location: LCCOMB_X14_Y18_N30
\Add1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~62_combout\ = bit_index(31) $ (!\Add1~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(31),
	cin => \Add1~61\,
	combout => \Add1~62_combout\);

-- Location: LCCOMB_X8_Y18_N10
\bit_index[31]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[31]~32_combout\ = (\bit_index~1_combout\ & (((!\Add1~62_combout\)))) # (!\bit_index~1_combout\ & ((\bit_index[18]~3_combout\) # ((bit_index(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_index[18]~3_combout\,
	datab => \bit_index~1_combout\,
	datac => bit_index(31),
	datad => \Add1~62_combout\,
	combout => \bit_index[31]~32_combout\);

-- Location: FF_X8_Y18_N11
\bit_index[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index[31]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(31));

-- Location: LCCOMB_X8_Y18_N24
\Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~11_combout\ = (!bit_index(29) & (!bit_index(30) & bit_index(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_index(29),
	datac => bit_index(30),
	datad => bit_index(31),
	combout => \Equal0~11_combout\);

-- Location: LCCOMB_X14_Y19_N0
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = bit_index(0) $ (GND)
-- \Add1~1\ = CARRY(!bit_index(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X13_Y18_N26
\bit_index~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~28_combout\ = (!\Add1~0_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~0_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~28_combout\);

-- Location: LCCOMB_X11_Y18_N10
\bit_index[18]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index[18]~4_combout\ = (\bit_index[18]~3_combout\) # (\bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bit_index[18]~3_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index[18]~4_combout\);

-- Location: FF_X13_Y18_N27
\bit_index[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~28_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(0));

-- Location: LCCOMB_X14_Y19_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (bit_index(1) & (!\Add1~1\)) # (!bit_index(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!bit_index(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X13_Y18_N28
\bit_index~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~29_combout\ = (\Add1~2_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~2_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~29_combout\);

-- Location: FF_X13_Y18_N29
\bit_index[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~29_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(1));

-- Location: LCCOMB_X14_Y19_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (bit_index(2) & (\Add1~3\ $ (GND))) # (!bit_index(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((bit_index(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X13_Y18_N24
\bit_index~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~27_combout\ = (\Add1~4_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~4_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~27_combout\);

-- Location: FF_X13_Y18_N25
\bit_index[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~27_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(2));

-- Location: LCCOMB_X14_Y19_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (bit_index(3) & (!\Add1~5\)) # (!bit_index(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!bit_index(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X13_Y18_N4
\bit_index~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~30_combout\ = (\Add1~6_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~6_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~30_combout\);

-- Location: FF_X13_Y18_N5
\bit_index[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~30_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(3));

-- Location: LCCOMB_X14_Y19_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (bit_index(4) & (\Add1~7\ $ (GND))) # (!bit_index(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((bit_index(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X13_Y18_N6
\bit_index~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~31_combout\ = (\Add1~8_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~8_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~31_combout\);

-- Location: FF_X13_Y18_N7
\bit_index[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~31_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(4));

-- Location: LCCOMB_X14_Y19_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (bit_index(5) & (!\Add1~9\)) # (!bit_index(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!bit_index(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X13_Y18_N8
\bit_index~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~35_combout\ = (\Add1~10_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~10_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~35_combout\);

-- Location: FF_X13_Y18_N9
\bit_index[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~35_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(5));

-- Location: LCCOMB_X14_Y19_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (bit_index(6) & (\Add1~11\ $ (GND))) # (!bit_index(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((bit_index(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X12_Y18_N10
\bit_index~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~22_combout\ = (\Add1~12_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~12_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~22_combout\);

-- Location: FF_X12_Y18_N11
\bit_index[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~22_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(6));

-- Location: LCCOMB_X12_Y18_N16
\LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~0_combout\ = (!bit_index(25) & (!bit_index(27) & (!bit_index(26) & !bit_index(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datab => bit_index(27),
	datac => bit_index(26),
	datad => bit_index(28),
	combout => \LessThan13~0_combout\);

-- Location: LCCOMB_X13_Y18_N18
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!bit_index(2) & (bit_index(0) & !bit_index(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_index(2),
	datac => bit_index(0),
	datad => bit_index(1),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X13_Y18_N14
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!bit_index(4) & (!bit_index(3) & (!bit_index(5) & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X14_Y19_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (bit_index(7) & (!\Add1~13\)) # (!bit_index(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!bit_index(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X10_Y18_N12
\bit_index~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~6_combout\ = (\bit_index~1_combout\ & \Add1~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bit_index~1_combout\,
	datad => \Add1~14_combout\,
	combout => \bit_index~6_combout\);

-- Location: FF_X10_Y18_N13
\bit_index[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~6_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(7));

-- Location: LCCOMB_X14_Y19_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (bit_index(8) & (\Add1~15\ $ (GND))) # (!bit_index(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((bit_index(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X10_Y18_N22
\bit_index~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~7_combout\ = (\Add1~16_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~16_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~7_combout\);

-- Location: FF_X10_Y18_N23
\bit_index[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~7_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(8));

-- Location: LCCOMB_X14_Y19_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (bit_index(9) & (!\Add1~17\)) # (!bit_index(9) & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!bit_index(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X10_Y18_N16
\bit_index~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~8_combout\ = (\Add1~18_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~18_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~8_combout\);

-- Location: FF_X10_Y18_N17
\bit_index[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~8_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(9));

-- Location: LCCOMB_X14_Y19_N20
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (bit_index(10) & (\Add1~19\ $ (GND))) # (!bit_index(10) & (!\Add1~19\ & VCC))
-- \Add1~21\ = CARRY((bit_index(10) & !\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(10),
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X11_Y18_N28
\bit_index~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~9_combout\ = (\Add1~20_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~20_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~9_combout\);

-- Location: FF_X11_Y18_N29
\bit_index[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~9_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(10));

-- Location: LCCOMB_X10_Y18_N26
\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!bit_index(7) & (!bit_index(9) & (!bit_index(8) & !bit_index(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(7),
	datab => bit_index(9),
	datac => bit_index(8),
	datad => bit_index(10),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X14_Y19_N22
\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (bit_index(11) & (!\Add1~21\)) # (!bit_index(11) & ((\Add1~21\) # (GND)))
-- \Add1~23\ = CARRY((!\Add1~21\) # (!bit_index(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(11),
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: LCCOMB_X10_Y18_N0
\bit_index~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~10_combout\ = (\Add1~22_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~22_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~10_combout\);

-- Location: FF_X10_Y18_N1
\bit_index[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~10_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(11));

-- Location: LCCOMB_X14_Y19_N24
\Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (bit_index(12) & (\Add1~23\ $ (GND))) # (!bit_index(12) & (!\Add1~23\ & VCC))
-- \Add1~25\ = CARRY((bit_index(12) & !\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(12),
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: LCCOMB_X10_Y18_N30
\bit_index~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~11_combout\ = (\Add1~24_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~24_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~11_combout\);

-- Location: FF_X10_Y18_N31
\bit_index[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~11_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(12));

-- Location: LCCOMB_X14_Y19_N26
\Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (bit_index(13) & (!\Add1~25\)) # (!bit_index(13) & ((\Add1~25\) # (GND)))
-- \Add1~27\ = CARRY((!\Add1~25\) # (!bit_index(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(13),
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: LCCOMB_X11_Y18_N2
\bit_index~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~12_combout\ = (\bit_index~1_combout\ & \Add1~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bit_index~1_combout\,
	datad => \Add1~26_combout\,
	combout => \bit_index~12_combout\);

-- Location: FF_X11_Y18_N3
\bit_index[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~12_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(13));

-- Location: LCCOMB_X14_Y19_N28
\Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (bit_index(14) & (\Add1~27\ $ (GND))) # (!bit_index(14) & (!\Add1~27\ & VCC))
-- \Add1~29\ = CARRY((bit_index(14) & !\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(14),
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: LCCOMB_X10_Y18_N20
\bit_index~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~13_combout\ = (\Add1~28_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~28_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~13_combout\);

-- Location: FF_X10_Y18_N21
\bit_index[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~13_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(14));

-- Location: LCCOMB_X14_Y19_N30
\Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (bit_index(15) & (!\Add1~29\)) # (!bit_index(15) & ((\Add1~29\) # (GND)))
-- \Add1~31\ = CARRY((!\Add1~29\) # (!bit_index(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(15),
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

-- Location: LCCOMB_X10_Y18_N8
\bit_index~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~14_combout\ = (\Add1~30_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~30_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~14_combout\);

-- Location: FF_X10_Y18_N9
\bit_index[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~14_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(15));

-- Location: LCCOMB_X14_Y18_N0
\Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (bit_index(16) & (\Add1~31\ $ (GND))) # (!bit_index(16) & (!\Add1~31\ & VCC))
-- \Add1~33\ = CARRY((bit_index(16) & !\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(16),
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

-- Location: LCCOMB_X10_Y18_N6
\bit_index~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~15_combout\ = (\Add1~32_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~32_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~15_combout\);

-- Location: FF_X10_Y18_N7
\bit_index[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~15_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(16));

-- Location: LCCOMB_X14_Y18_N2
\Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (bit_index(17) & (!\Add1~33\)) # (!bit_index(17) & ((\Add1~33\) # (GND)))
-- \Add1~35\ = CARRY((!\Add1~33\) # (!bit_index(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(17),
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

-- Location: LCCOMB_X10_Y18_N28
\bit_index~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~16_combout\ = (\Add1~34_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~34_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~16_combout\);

-- Location: FF_X10_Y18_N29
\bit_index[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~16_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(17));

-- Location: LCCOMB_X10_Y18_N2
\Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!bit_index(16) & (!bit_index(17) & (!bit_index(15) & !bit_index(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(16),
	datab => bit_index(17),
	datac => bit_index(15),
	datad => bit_index(18),
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X10_Y18_N14
\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!bit_index(12) & (!bit_index(11) & (!bit_index(14) & !bit_index(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(12),
	datab => bit_index(11),
	datac => bit_index(14),
	datad => bit_index(13),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X10_Y18_N10
\Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!bit_index(21) & (!bit_index(19) & (!bit_index(20) & !bit_index(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(21),
	datab => bit_index(19),
	datac => bit_index(20),
	datad => bit_index(22),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X10_Y18_N24
\Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~5_combout\ & (\Equal0~7_combout\ & (\Equal0~6_combout\ & \Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Equal0~7_combout\,
	datac => \Equal0~6_combout\,
	datad => \Equal0~8_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X12_Y18_N2
\Equal0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~14_combout\ = (!bit_index(24) & (!bit_index(23) & \Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(24),
	datac => bit_index(23),
	datad => \Equal0~9_combout\,
	combout => \Equal0~14_combout\);

-- Location: LCCOMB_X12_Y18_N30
\LessThan13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~1_combout\ = (((bit_index(6) & !\LessThan0~3_combout\)) # (!\Equal0~14_combout\)) # (!\LessThan13~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => \LessThan13~0_combout\,
	datac => \LessThan0~3_combout\,
	datad => \Equal0~14_combout\,
	combout => \LessThan13~1_combout\);

-- Location: LCCOMB_X13_Y18_N22
\LessThan11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan11~0_combout\ = (bit_index(4) & (bit_index(3) & (bit_index(5) & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan11~0_combout\);

-- Location: LCCOMB_X12_Y18_N20
\message_decryption~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~1_combout\ = ((\LessThan13~1_combout\) # ((\Equal0~10_combout\ & !\LessThan11~0_combout\))) # (!\Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~10_combout\,
	datab => \Equal0~11_combout\,
	datac => \LessThan13~1_combout\,
	datad => \LessThan11~0_combout\,
	combout => \message_decryption~1_combout\);

-- Location: LCCOMB_X9_Y18_N26
\decod_data6_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~0_combout\ = (!bit_index(30) & (!bit_index(28) & (!bit_index(29) & bit_index(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(30),
	datab => bit_index(28),
	datac => bit_index(29),
	datad => bit_index(31),
	combout => \decod_data6_ready~0_combout\);

-- Location: LCCOMB_X12_Y18_N24
\LessThan17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~0_combout\ = (bit_index(5)) # ((bit_index(4) & ((bit_index(3)) # (!\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(5),
	datac => bit_index(3),
	datad => \LessThan0~2_combout\,
	combout => \LessThan17~0_combout\);

-- Location: LCCOMB_X12_Y18_N26
\LessThan17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~1_combout\ = (bit_index(26)) # ((bit_index(6) & \LessThan17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_index(6),
	datac => bit_index(26),
	datad => \LessThan17~0_combout\,
	combout => \LessThan17~1_combout\);

-- Location: LCCOMB_X12_Y18_N8
\LessThan17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~2_combout\ = (bit_index(25)) # ((bit_index(27)) # ((\LessThan17~1_combout\) # (!\Equal0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datab => bit_index(27),
	datac => \LessThan17~1_combout\,
	datad => \Equal0~14_combout\,
	combout => \LessThan17~2_combout\);

-- Location: LCCOMB_X13_Y18_N0
\LessThan15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan15~0_combout\ = (bit_index(4)) # ((bit_index(5)) # ((bit_index(3) & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan15~0_combout\);

-- Location: LCCOMB_X12_Y18_N0
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (!bit_index(23) & !bit_index(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bit_index(23),
	datad => bit_index(24),
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X9_Y18_N22
\decod_length_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length_ready~1_combout\ = (!bit_index(26) & !bit_index(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bit_index(26),
	datad => bit_index(27),
	combout => \decod_length_ready~1_combout\);

-- Location: LCCOMB_X10_Y18_N18
\decod_data5_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~1_combout\ = (!bit_index(25) & (\Equal0~9_combout\ & (\Equal0~4_combout\ & \decod_length_ready~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datab => \Equal0~9_combout\,
	datac => \Equal0~4_combout\,
	datad => \decod_length_ready~1_combout\,
	combout => \decod_data5_ready~1_combout\);

-- Location: LCCOMB_X11_Y18_N8
\LessThan15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan15~1_combout\ = (bit_index(28)) # (((bit_index(6) & \LessThan15~0_combout\)) # (!\decod_data5_ready~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(28),
	datab => bit_index(6),
	datac => \LessThan15~0_combout\,
	datad => \decod_data5_ready~1_combout\,
	combout => \LessThan15~1_combout\);

-- Location: LCCOMB_X11_Y18_N12
\decod_data5_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~2_combout\ = (\decod_data6_ready~0_combout\ & (!\LessThan17~2_combout\ & \LessThan15~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~0_combout\,
	datac => \LessThan17~2_combout\,
	datad => \LessThan15~1_combout\,
	combout => \decod_data5_ready~2_combout\);

-- Location: LCCOMB_X11_Y18_N22
\decod_data4_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4_ready~1_combout\ = (\Equal0~11_combout\ & (!\LessThan15~1_combout\ & \LessThan13~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~11_combout\,
	datac => \LessThan15~1_combout\,
	datad => \LessThan13~1_combout\,
	combout => \decod_data4_ready~1_combout\);

-- Location: LCCOMB_X13_Y18_N20
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (bit_index(5)) # ((bit_index(4) & (bit_index(3) & !\LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X11_Y18_N26
\decod_data6_ready~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~6_combout\ = (\decod_data6_ready~0_combout\ & (\decod_data5_ready~1_combout\ & ((!bit_index(6)) # (!\LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => bit_index(6),
	datac => \decod_data6_ready~0_combout\,
	datad => \decod_data5_ready~1_combout\,
	combout => \decod_data6_ready~6_combout\);

-- Location: LCCOMB_X12_Y18_N6
\LessThan17~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~3_combout\ = (bit_index(25)) # (((\LessThan17~0_combout\ & bit_index(6))) # (!\Equal0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datab => \LessThan17~0_combout\,
	datac => bit_index(6),
	datad => \Equal0~14_combout\,
	combout => \LessThan17~3_combout\);

-- Location: LCCOMB_X11_Y18_N0
\decod_data6~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~18_combout\ = (\decod_data6_ready~6_combout\ & ((bit_index(26)) # (\LessThan17~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_index(26),
	datac => \decod_data6_ready~6_combout\,
	datad => \LessThan17~3_combout\,
	combout => \decod_data6~18_combout\);

-- Location: LCCOMB_X11_Y18_N14
\bit_index~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~0_combout\ = (\decod_data5_ready~2_combout\) # ((\decod_data4_ready~1_combout\) # (\decod_data6~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5_ready~2_combout\,
	datac => \decod_data4_ready~1_combout\,
	datad => \decod_data6~18_combout\,
	combout => \bit_index~0_combout\);

-- Location: LCCOMB_X13_Y18_N10
\decod_comm_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm_ready~1_combout\ = (bit_index(0) & !bit_index(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bit_index(0),
	datad => bit_index(1),
	combout => \decod_comm_ready~1_combout\);

-- Location: LCCOMB_X9_Y18_N16
\decod_length_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length_ready~0_combout\ = (!bit_index(4) & !bit_index(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bit_index(4),
	datad => bit_index(3),
	combout => \decod_length_ready~0_combout\);

-- Location: LCCOMB_X9_Y18_N4
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (bit_index(5)) # (((!\decod_comm_ready~1_combout\ & bit_index(2))) # (!\decod_length_ready~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm_ready~1_combout\,
	datab => bit_index(2),
	datac => bit_index(5),
	datad => \decod_length_ready~0_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X9_Y18_N24
\decod_comm_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm_ready~0_combout\ = (!bit_index(25) & (!bit_index(6) & (\Equal0~4_combout\ & \Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datab => bit_index(6),
	datac => \Equal0~4_combout\,
	datad => \Equal0~9_combout\,
	combout => \decod_comm_ready~0_combout\);

-- Location: LCCOMB_X9_Y18_N8
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (!bit_index(26) & (!bit_index(27) & (!\LessThan3~0_combout\ & \decod_comm_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(26),
	datab => bit_index(27),
	datac => \LessThan3~0_combout\,
	datad => \decod_comm_ready~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X9_Y18_N10
\message_decryption~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~2_combout\ = (((!\LessThan1~0_combout\ & \Equal0~10_combout\)) # (!\LessThan3~1_combout\)) # (!\decod_data6_ready~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~0_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan3~1_combout\,
	datad => \Equal0~10_combout\,
	combout => \message_decryption~2_combout\);

-- Location: LCCOMB_X13_Y18_N2
\LessThan5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~2_combout\ = (bit_index(5) & ((bit_index(4)) # ((bit_index(3)) # (!\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan5~2_combout\);

-- Location: LCCOMB_X9_Y18_N18
\LessThan5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~4_combout\ = (!bit_index(26) & (!bit_index(27) & (!\LessThan5~2_combout\ & \decod_comm_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(26),
	datab => bit_index(27),
	datac => \LessThan5~2_combout\,
	datad => \decod_comm_ready~0_combout\,
	combout => \LessThan5~4_combout\);

-- Location: LCCOMB_X12_Y18_N14
\LessThan7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~0_combout\ = (bit_index(5) & ((bit_index(4)) # ((bit_index(3) & !\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan7~0_combout\);

-- Location: LCCOMB_X12_Y18_N28
\LessThan7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~2_combout\ = (bit_index(6)) # (((\LessThan7~0_combout\) # (!\Equal0~14_combout\)) # (!\LessThan13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => \LessThan13~0_combout\,
	datac => \LessThan7~0_combout\,
	datad => \Equal0~14_combout\,
	combout => \LessThan7~2_combout\);

-- Location: LCCOMB_X11_Y18_N4
\message_decryption~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~3_combout\ = ((\LessThan7~2_combout\) # ((!bit_index(28) & \LessThan5~4_combout\))) # (!\Equal0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(28),
	datab => \Equal0~11_combout\,
	datac => \LessThan5~4_combout\,
	datad => \LessThan7~2_combout\,
	combout => \message_decryption~3_combout\);

-- Location: LCCOMB_X9_Y18_N20
\message_decryption~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~4_combout\ = ((\LessThan3~1_combout\) # (!\LessThan5~4_combout\)) # (!\decod_data6_ready~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~0_combout\,
	datac => \LessThan3~1_combout\,
	datad => \LessThan5~4_combout\,
	combout => \message_decryption~4_combout\);

-- Location: LCCOMB_X13_Y18_N12
\LessThan9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~0_combout\ = (bit_index(4) & (bit_index(5) & ((bit_index(3)) # (!\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \LessThan0~2_combout\,
	combout => \LessThan9~0_combout\);

-- Location: LCCOMB_X8_Y18_N14
\decod_data2_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2_ready~0_combout\ = (\Equal0~11_combout\ & (!\LessThan11~0_combout\ & (\LessThan9~0_combout\ & \Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~11_combout\,
	datab => \LessThan11~0_combout\,
	datac => \LessThan9~0_combout\,
	datad => \Equal0~10_combout\,
	combout => \decod_data2_ready~0_combout\);

-- Location: LCCOMB_X8_Y18_N8
\message_decryption~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \message_decryption~5_combout\ = (\LessThan1~0_combout\) # (((\LessThan0~3_combout\) # (!\Equal0~10_combout\)) # (!\Equal0~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \Equal0~11_combout\,
	datac => \LessThan0~3_combout\,
	datad => \Equal0~10_combout\,
	combout => \message_decryption~5_combout\);

-- Location: LCCOMB_X8_Y18_N2
\decod_data5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~18_combout\ = (\Equal0~11_combout\ & (!\LessThan9~0_combout\ & \Equal0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~11_combout\,
	datac => \LessThan9~0_combout\,
	datad => \Equal0~10_combout\,
	combout => \decod_data5~18_combout\);

-- Location: LCCOMB_X8_Y18_N16
\decod_data5~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~19_combout\ = (!\decod_data2_ready~0_combout\ & (\message_decryption~5_combout\ & ((!\decod_data5~18_combout\) # (!\LessThan7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~2_combout\,
	datab => \decod_data2_ready~0_combout\,
	datac => \message_decryption~5_combout\,
	datad => \decod_data5~18_combout\,
	combout => \decod_data5~19_combout\);

-- Location: LCCOMB_X11_Y18_N18
\decod_data5~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~20_combout\ = (\message_decryption~2_combout\ & (\message_decryption~3_combout\ & (\message_decryption~4_combout\ & \decod_data5~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~2_combout\,
	datab => \message_decryption~3_combout\,
	datac => \message_decryption~4_combout\,
	datad => \decod_data5~19_combout\,
	combout => \decod_data5~20_combout\);

-- Location: LCCOMB_X11_Y18_N24
\bit_index~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~1_combout\ = (\message_decryption~0_combout\ & (((\bit_index~0_combout\) # (!\decod_data5~20_combout\)) # (!\message_decryption~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~1_combout\,
	datab => \message_decryption~0_combout\,
	datac => \bit_index~0_combout\,
	datad => \decod_data5~20_combout\,
	combout => \bit_index~1_combout\);

-- Location: LCCOMB_X14_Y18_N4
\Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (bit_index(18) & (\Add1~35\ $ (GND))) # (!bit_index(18) & (!\Add1~35\ & VCC))
-- \Add1~37\ = CARRY((bit_index(18) & !\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(18),
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

-- Location: LCCOMB_X11_Y18_N16
\bit_index~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~17_combout\ = (\bit_index~1_combout\ & \Add1~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bit_index~1_combout\,
	datad => \Add1~36_combout\,
	combout => \bit_index~17_combout\);

-- Location: FF_X11_Y18_N17
\bit_index[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~17_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(18));

-- Location: LCCOMB_X14_Y18_N6
\Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (bit_index(19) & (!\Add1~37\)) # (!bit_index(19) & ((\Add1~37\) # (GND)))
-- \Add1~39\ = CARRY((!\Add1~37\) # (!bit_index(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(19),
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

-- Location: LCCOMB_X10_Y18_N4
\bit_index~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~18_combout\ = (\Add1~38_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~38_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~18_combout\);

-- Location: FF_X10_Y18_N5
\bit_index[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~18_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(19));

-- Location: LCCOMB_X14_Y18_N8
\Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (bit_index(20) & (\Add1~39\ $ (GND))) # (!bit_index(20) & (!\Add1~39\ & VCC))
-- \Add1~41\ = CARRY((bit_index(20) & !\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(20),
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

-- Location: LCCOMB_X11_Y18_N30
\bit_index~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~19_combout\ = (\Add1~40_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~40_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~19_combout\);

-- Location: FF_X11_Y18_N31
\bit_index[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~19_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(20));

-- Location: LCCOMB_X14_Y18_N10
\Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (bit_index(21) & (!\Add1~41\)) # (!bit_index(21) & ((\Add1~41\) # (GND)))
-- \Add1~43\ = CARRY((!\Add1~41\) # (!bit_index(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(21),
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

-- Location: LCCOMB_X11_Y18_N20
\bit_index~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~20_combout\ = (\Add1~42_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~42_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~20_combout\);

-- Location: FF_X11_Y18_N21
\bit_index[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~20_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(21));

-- Location: LCCOMB_X14_Y18_N12
\Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = (bit_index(22) & (\Add1~43\ $ (GND))) # (!bit_index(22) & (!\Add1~43\ & VCC))
-- \Add1~45\ = CARRY((bit_index(22) & !\Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(22),
	datad => VCC,
	cin => \Add1~43\,
	combout => \Add1~44_combout\,
	cout => \Add1~45\);

-- Location: LCCOMB_X11_Y18_N6
\bit_index~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~21_combout\ = (\Add1~44_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~44_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~21_combout\);

-- Location: FF_X11_Y18_N7
\bit_index[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~21_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(22));

-- Location: LCCOMB_X14_Y18_N14
\Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~46_combout\ = (bit_index(23) & (!\Add1~45\)) # (!bit_index(23) & ((\Add1~45\) # (GND)))
-- \Add1~47\ = CARRY((!\Add1~45\) # (!bit_index(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(23),
	datad => VCC,
	cin => \Add1~45\,
	combout => \Add1~46_combout\,
	cout => \Add1~47\);

-- Location: LCCOMB_X12_Y18_N4
\bit_index~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~2_combout\ = (\Add1~46_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~46_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~2_combout\);

-- Location: FF_X12_Y18_N5
\bit_index[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~2_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(23));

-- Location: LCCOMB_X14_Y18_N16
\Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~48_combout\ = (bit_index(24) & (\Add1~47\ $ (GND))) # (!bit_index(24) & (!\Add1~47\ & VCC))
-- \Add1~49\ = CARRY((bit_index(24) & !\Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(24),
	datad => VCC,
	cin => \Add1~47\,
	combout => \Add1~48_combout\,
	cout => \Add1~49\);

-- Location: LCCOMB_X12_Y18_N18
\bit_index~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~5_combout\ = (\Add1~48_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~48_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~5_combout\);

-- Location: FF_X12_Y18_N19
\bit_index[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~5_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(24));

-- Location: LCCOMB_X14_Y18_N18
\Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~50_combout\ = (bit_index(25) & (!\Add1~49\)) # (!bit_index(25) & ((\Add1~49\) # (GND)))
-- \Add1~51\ = CARRY((!\Add1~49\) # (!bit_index(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(25),
	datad => VCC,
	cin => \Add1~49\,
	combout => \Add1~50_combout\,
	cout => \Add1~51\);

-- Location: LCCOMB_X12_Y18_N12
\bit_index~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~23_combout\ = (\Add1~50_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~50_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~23_combout\);

-- Location: FF_X12_Y18_N13
\bit_index[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~23_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(25));

-- Location: LCCOMB_X14_Y18_N20
\Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~52_combout\ = (bit_index(26) & (\Add1~51\ $ (GND))) # (!bit_index(26) & (!\Add1~51\ & VCC))
-- \Add1~53\ = CARRY((bit_index(26) & !\Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bit_index(26),
	datad => VCC,
	cin => \Add1~51\,
	combout => \Add1~52_combout\,
	cout => \Add1~53\);

-- Location: LCCOMB_X12_Y18_N22
\bit_index~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~26_combout\ = (\Add1~52_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~52_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~26_combout\);

-- Location: FF_X12_Y18_N23
\bit_index[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~26_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(26));

-- Location: LCCOMB_X9_Y18_N12
\bit_index~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_index~25_combout\ = (\Add1~54_combout\ & \bit_index~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~54_combout\,
	datad => \bit_index~1_combout\,
	combout => \bit_index~25_combout\);

-- Location: FF_X9_Y18_N13
\bit_index[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \bit_index~25_combout\,
	ena => \bit_index[18]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_index(27));

-- Location: LCCOMB_X9_Y18_N6
\Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (!bit_index(27) & (!bit_index(28) & (!bit_index(26) & \decod_comm_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(27),
	datab => bit_index(28),
	datac => bit_index(26),
	datad => \decod_comm_ready~0_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X13_Y18_N16
\Equal0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~13_combout\ = (!bit_index(4) & (!bit_index(3) & (!bit_index(5) & \Equal0~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(4),
	datab => bit_index(3),
	datac => bit_index(5),
	datad => \Equal0~11_combout\,
	combout => \Equal0~13_combout\);

-- Location: LCCOMB_X13_Y18_N30
\Equal0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~12_combout\ = (!bit_index(1) & (!bit_index(2) & (!bit_index(0) & \Equal0~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(1),
	datab => bit_index(2),
	datac => bit_index(0),
	datad => \Equal0~13_combout\,
	combout => \Equal0~12_combout\);

-- Location: LCCOMB_X6_Y17_N24
\current_state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~13_combout\ = (\bit_validity~q\) # (((\Equal0~10_combout\ & \Equal0~12_combout\)) # (!\current_state.S_MESSAGE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_validity~q\,
	datab => \current_state.S_MESSAGE~q\,
	datac => \Equal0~10_combout\,
	datad => \Equal0~12_combout\,
	combout => \current_state~13_combout\);

-- Location: LCCOMB_X6_Y17_N16
\current_state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~18_combout\ = (\reset~input_o\ & (((\current_state.S_STOP~q\ & !\current_state~16_combout\)))) # (!\reset~input_o\ & (((\current_state.S_STOP~q\ & !\current_state~16_combout\)) # (!\current_state~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \current_state~13_combout\,
	datac => \current_state.S_STOP~q\,
	datad => \current_state~16_combout\,
	combout => \current_state~18_combout\);

-- Location: FF_X6_Y17_N17
\current_state.S_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \current_state~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_STOP~q\);

-- Location: LCCOMB_X7_Y17_N20
\stop_internal_state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~16_combout\ = (!\stop_internal_state.S4~q\ & (!\bit_validity~q\ & ((\current_state.S_STOP~q\) # (\current_state.S_MESSAGE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_STOP~q\,
	datab => \stop_internal_state.S4~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_MESSAGE~q\,
	combout => \stop_internal_state~16_combout\);

-- Location: LCCOMB_X6_Y17_N30
\stop_internal_state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~12_combout\ = (\reset~input_o\) # ((\sync_internal_state~12_combout\ & ((\bit_validity~q\) # (!\current_state.S_START~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sync_internal_state~12_combout\,
	datab => \reset~input_o\,
	datac => \bit_validity~q\,
	datad => \current_state.S_START~q\,
	combout => \stop_internal_state~12_combout\);

-- Location: FF_X7_Y17_N21
\stop_internal_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \stop_internal_state~16_combout\,
	sclr => \reset~input_o\,
	ena => \stop_internal_state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stop_internal_state.S0~q\);

-- Location: LCCOMB_X7_Y17_N26
\stop_internal_state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~15_combout\ = (!\stop_internal_state.S0~q\ & (!\bit_validity~q\ & ((\current_state.S_STOP~q\) # (\current_state.S_MESSAGE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_STOP~q\,
	datab => \stop_internal_state.S0~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_MESSAGE~q\,
	combout => \stop_internal_state~15_combout\);

-- Location: FF_X7_Y17_N27
\stop_internal_state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \stop_internal_state~15_combout\,
	sclr => \reset~input_o\,
	ena => \stop_internal_state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stop_internal_state.S1~q\);

-- Location: LCCOMB_X7_Y17_N12
\stop_internal_state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~14_combout\ = (!\bit_validity~q\ & (\stop_internal_state.S1~q\ & ((\current_state.S_STOP~q\) # (\current_state.S_MESSAGE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_STOP~q\,
	datab => \bit_validity~q\,
	datac => \stop_internal_state.S1~q\,
	datad => \current_state.S_MESSAGE~q\,
	combout => \stop_internal_state~14_combout\);

-- Location: FF_X7_Y17_N13
\stop_internal_state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \stop_internal_state~14_combout\,
	sclr => \reset~input_o\,
	ena => \stop_internal_state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stop_internal_state.S2~q\);

-- Location: LCCOMB_X7_Y17_N18
\stop_internal_state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~13_combout\ = (!\bit_validity~q\ & (\stop_internal_state.S2~q\ & ((\current_state.S_MESSAGE~q\) # (\current_state.S_STOP~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_MESSAGE~q\,
	datab => \bit_validity~q\,
	datac => \current_state.S_STOP~q\,
	datad => \stop_internal_state.S2~q\,
	combout => \stop_internal_state~13_combout\);

-- Location: FF_X7_Y17_N19
\stop_internal_state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \stop_internal_state~13_combout\,
	sclr => \reset~input_o\,
	ena => \stop_internal_state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stop_internal_state.S3~q\);

-- Location: LCCOMB_X7_Y17_N28
\stop_internal_state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_internal_state~11_combout\ = (\stop_internal_state.S3~q\ & (!\bit_validity~q\ & ((\current_state.S_STOP~q\) # (\current_state.S_MESSAGE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_STOP~q\,
	datab => \stop_internal_state.S3~q\,
	datac => \bit_validity~q\,
	datad => \current_state.S_MESSAGE~q\,
	combout => \stop_internal_state~11_combout\);

-- Location: FF_X7_Y17_N29
\stop_internal_state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \stop_internal_state~11_combout\,
	sclr => \reset~input_o\,
	ena => \stop_internal_state~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stop_internal_state.S4~q\);

-- Location: LCCOMB_X7_Y17_N10
\current_state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~14_combout\ = (!\reset~input_o\ & ((!\stop_internal_state.S4~q\) # (!\current_state.S_STOP~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \current_state.S_STOP~q\,
	datad => \stop_internal_state.S4~q\,
	combout => \current_state~14_combout\);

-- Location: LCCOMB_X6_Y17_N6
\current_state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state~19_combout\ = (\current_state~15_combout\ & ((\current_state.S_IDLE~q\) # ((\current_state~14_combout\ & \transaction_begin~q\)))) # (!\current_state~15_combout\ & (\current_state~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state~14_combout\,
	datab => \transaction_begin~q\,
	datac => \current_state.S_IDLE~q\,
	datad => \current_state~15_combout\,
	combout => \current_state~19_combout\);

-- Location: FF_X6_Y17_N7
\current_state.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \current_state~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.S_IDLE~q\);

-- Location: LCCOMB_X5_Y17_N24
\transaction_begin~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transaction_begin~0_combout\ = (\current_state.S_IDLE~q\ & (((\transaction_begin~q\)))) # (!\current_state.S_IDLE~q\ & (!\aux_val_prev~q\ & ((\aux_val_new~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_IDLE~q\,
	datab => \aux_val_prev~q\,
	datac => \transaction_begin~q\,
	datad => \aux_val_new~q\,
	combout => \transaction_begin~0_combout\);

-- Location: FF_X5_Y17_N25
transaction_begin : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \transaction_begin~0_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transaction_begin~q\);

-- Location: LCCOMB_X5_Y17_N28
\counter_val~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_val~1_combout\ = (!\reset~input_o\ & (!counter_val(0) & !\transaction_begin~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => counter_val(0),
	datad => \transaction_begin~q\,
	combout => \counter_val~1_combout\);

-- Location: FF_X5_Y17_N29
\counter_val[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \counter_val~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_val(0));

-- Location: LCCOMB_X5_Y17_N4
\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = counter_val(3) $ (((counter_val(0) & (counter_val(1) & counter_val(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(3),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(2),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X5_Y17_N12
\counter_val~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter_val~3_combout\ = (!\reset~input_o\ & (\Add0~1_combout\ & !\transaction_begin~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \Add0~1_combout\,
	datad => \transaction_begin~q\,
	combout => \counter_val~3_combout\);

-- Location: FF_X5_Y17_N13
\counter_val[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \counter_val~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_val(3));

-- Location: LCCOMB_X5_Y17_N30
\aux_val_prev~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \aux_val_prev~1_combout\ = (counter_val(3) & (!counter_val(0) & (!counter_val(1) & !counter_val(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter_val(3),
	datab => counter_val(0),
	datac => counter_val(1),
	datad => counter_val(2),
	combout => \aux_val_prev~1_combout\);

-- Location: LCCOMB_X5_Y17_N20
\aux_val_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aux_val_prev~0_combout\ = (\current_state.S_IDLE~q\ & ((\aux_val_prev~q\))) # (!\current_state.S_IDLE~q\ & (\aux_val_new~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \aux_val_new~q\,
	datac => \aux_val_prev~q\,
	datad => \current_state.S_IDLE~q\,
	combout => \aux_val_prev~0_combout\);

-- Location: LCCOMB_X5_Y17_N14
\aux_val_prev~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \aux_val_prev~2_combout\ = (\aux_val_prev~1_combout\ & (\tx_aux_out~input_o\)) # (!\aux_val_prev~1_combout\ & ((\aux_val_prev~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_aux_out~input_o\,
	datac => \aux_val_prev~1_combout\,
	datad => \aux_val_prev~0_combout\,
	combout => \aux_val_prev~2_combout\);

-- Location: FF_X5_Y17_N15
aux_val_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \aux_val_prev~2_combout\,
	sclr => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aux_val_prev~q\);

-- Location: LCCOMB_X7_Y17_N24
\decod_comm~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm~14_combout\ = (\current_state.S_MESSAGE~q\ & (\Equal5~0_combout\ & (\bit_validity~q\ & !\message_decryption~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.S_MESSAGE~q\,
	datab => \Equal5~0_combout\,
	datac => \bit_validity~q\,
	datad => \message_decryption~5_combout\,
	combout => \decod_comm~14_combout\);

-- Location: LCCOMB_X7_Y17_N4
\decod_comm~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm~10_combout\ = (\decod_comm~14_combout\ & (\aux_val_prev~q\)) # (!\decod_comm~14_combout\ & (((!\reset~input_o\ & \decod_comm[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aux_val_prev~q\,
	datab => \reset~input_o\,
	datac => \decod_comm[0]~reg0_q\,
	datad => \decod_comm~14_combout\,
	combout => \decod_comm~10_combout\);

-- Location: FF_X7_Y17_N5
\decod_comm[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_comm~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_comm[0]~reg0_q\);

-- Location: LCCOMB_X7_Y17_N6
\decod_comm~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm~11_combout\ = (\decod_comm~14_combout\ & (\decod_comm[0]~reg0_q\)) # (!\decod_comm~14_combout\ & (((!\reset~input_o\ & \decod_comm[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm[0]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_comm[1]~reg0_q\,
	datad => \decod_comm~14_combout\,
	combout => \decod_comm~11_combout\);

-- Location: FF_X7_Y17_N7
\decod_comm[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_comm~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_comm[1]~reg0_q\);

-- Location: LCCOMB_X7_Y17_N8
\decod_comm~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm~12_combout\ = (\decod_comm~14_combout\ & (\decod_comm[1]~reg0_q\)) # (!\decod_comm~14_combout\ & (((!\reset~input_o\ & \decod_comm[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_comm[2]~reg0_q\,
	datad => \decod_comm~14_combout\,
	combout => \decod_comm~12_combout\);

-- Location: FF_X7_Y17_N9
\decod_comm[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_comm~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_comm[2]~reg0_q\);

-- Location: LCCOMB_X7_Y17_N30
\decod_comm~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm~13_combout\ = (\decod_comm~14_combout\ & (\decod_comm[2]~reg0_q\)) # (!\decod_comm~14_combout\ & (((!\reset~input_o\ & \decod_comm[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm[2]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_comm[3]~reg0_q\,
	datad => \decod_comm~14_combout\,
	combout => \decod_comm~13_combout\);

-- Location: FF_X7_Y17_N31
\decod_comm[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_comm~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_comm[3]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N14
\decod_address~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~40_combout\ = (\message_decryption~0_combout\ & (!\message_decryption~2_combout\ & \message_decryption~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~0_combout\,
	datac => \message_decryption~2_combout\,
	datad => \message_decryption~5_combout\,
	combout => \decod_address~40_combout\);

-- Location: LCCOMB_X8_Y20_N24
\decod_address~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~41_combout\ = (\decod_address~40_combout\ & (\aux_val_prev~q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aux_val_prev~q\,
	datab => \reset~input_o\,
	datac => \decod_address[0]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~41_combout\);

-- Location: FF_X8_Y20_N25
\decod_address[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[0]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N30
\decod_address~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~42_combout\ = (\decod_address~40_combout\ & (\decod_address[0]~reg0_q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[0]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_address[1]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~42_combout\);

-- Location: FF_X8_Y20_N31
\decod_address[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[1]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N20
\decod_address~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~43_combout\ = (\decod_address~40_combout\ & (\decod_address[1]~reg0_q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_address[2]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~43_combout\);

-- Location: FF_X8_Y20_N21
\decod_address[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[2]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N28
\decod_address~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~44_combout\ = (\decod_address~40_combout\ & (((\decod_address[2]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[2]~reg0_q\,
	datac => \decod_address[3]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~44_combout\);

-- Location: FF_X7_Y20_N29
\decod_address[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[3]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N2
\decod_address~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~45_combout\ = (\decod_address~40_combout\ & (((\decod_address[3]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[3]~reg0_q\,
	datac => \decod_address[4]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~45_combout\);

-- Location: FF_X7_Y20_N3
\decod_address[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[4]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N0
\decod_address~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~46_combout\ = (\decod_address~40_combout\ & (((\decod_address[4]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[4]~reg0_q\,
	datac => \decod_address[5]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~46_combout\);

-- Location: FF_X7_Y20_N1
\decod_address[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[5]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N10
\decod_address~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~47_combout\ = (\decod_address~40_combout\ & (((\decod_address[5]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[5]~reg0_q\,
	datac => \decod_address[6]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~47_combout\);

-- Location: FF_X7_Y20_N11
\decod_address[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[6]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N8
\decod_address~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~48_combout\ = (\decod_address~40_combout\ & (((\decod_address[6]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[6]~reg0_q\,
	datac => \decod_address[7]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~48_combout\);

-- Location: FF_X7_Y20_N9
\decod_address[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[7]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N18
\decod_address~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~49_combout\ = (\decod_address~40_combout\ & (((\decod_address[7]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[8]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[7]~reg0_q\,
	datac => \decod_address[8]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~49_combout\);

-- Location: FF_X7_Y20_N19
\decod_address[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[8]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N12
\decod_address~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~50_combout\ = (\decod_address~40_combout\ & (((\decod_address[8]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[9]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[8]~reg0_q\,
	datac => \decod_address[9]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~50_combout\);

-- Location: FF_X7_Y20_N13
\decod_address[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[9]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N6
\decod_address~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~51_combout\ = (\decod_address~40_combout\ & (\decod_address[9]~reg0_q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[10]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[9]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_address[10]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~51_combout\);

-- Location: FF_X8_Y20_N7
\decod_address[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[10]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N28
\decod_address~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~52_combout\ = (\decod_address~40_combout\ & (\decod_address[10]~reg0_q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[11]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[10]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_address[11]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~52_combout\);

-- Location: FF_X8_Y20_N29
\decod_address[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[11]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N30
\decod_address~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~53_combout\ = (\decod_address~40_combout\ & (((\decod_address[11]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[12]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[11]~reg0_q\,
	datac => \decod_address[12]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~53_combout\);

-- Location: FF_X7_Y20_N31
\decod_address[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[12]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N16
\decod_address~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~54_combout\ = (\decod_address~40_combout\ & (\decod_address[12]~reg0_q\)) # (!\decod_address~40_combout\ & (((!\reset~input_o\ & \decod_address[13]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_address[12]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_address[13]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~54_combout\);

-- Location: FF_X7_Y20_N17
\decod_address[13]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[13]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N6
\decod_address~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~55_combout\ = (\decod_address~40_combout\ & (((\decod_address[13]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[14]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[13]~reg0_q\,
	datac => \decod_address[14]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~55_combout\);

-- Location: FF_X7_Y20_N7
\decod_address[14]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[14]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N20
\decod_address~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~56_combout\ = (\decod_address~40_combout\ & (((\decod_address[14]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[15]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[14]~reg0_q\,
	datac => \decod_address[15]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~56_combout\);

-- Location: FF_X7_Y20_N21
\decod_address[15]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[15]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N22
\decod_address~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~57_combout\ = (\decod_address~40_combout\ & (((\decod_address[15]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[16]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[15]~reg0_q\,
	datac => \decod_address[16]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~57_combout\);

-- Location: FF_X7_Y20_N23
\decod_address[16]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~57_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[16]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N4
\decod_address~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~58_combout\ = (\decod_address~40_combout\ & (((\decod_address[16]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[17]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[16]~reg0_q\,
	datac => \decod_address[17]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~58_combout\);

-- Location: FF_X7_Y20_N5
\decod_address[17]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[17]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N26
\decod_address~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~59_combout\ = (\decod_address~40_combout\ & (((\decod_address[17]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[18]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[17]~reg0_q\,
	datac => \decod_address[18]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~59_combout\);

-- Location: FF_X7_Y20_N27
\decod_address[18]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[18]~reg0_q\);

-- Location: LCCOMB_X7_Y20_N24
\decod_address~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address~60_combout\ = (\decod_address~40_combout\ & (((\decod_address[18]~reg0_q\)))) # (!\decod_address~40_combout\ & (!\reset~input_o\ & ((\decod_address[19]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_address[18]~reg0_q\,
	datac => \decod_address[19]~reg0_q\,
	datad => \decod_address~40_combout\,
	combout => \decod_address~60_combout\);

-- Location: FF_X7_Y20_N25
\decod_address[19]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address[19]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N18
\decod_length~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~16_combout\ = (\message_decryption~0_combout\ & (!\message_decryption~4_combout\ & (\message_decryption~5_combout\ & \message_decryption~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~0_combout\,
	datab => \message_decryption~4_combout\,
	datac => \message_decryption~5_combout\,
	datad => \message_decryption~2_combout\,
	combout => \decod_length~16_combout\);

-- Location: LCCOMB_X8_Y20_N10
\decod_length~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~17_combout\ = (\decod_length~16_combout\ & (\aux_val_prev~q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aux_val_prev~q\,
	datab => \reset~input_o\,
	datac => \decod_length[0]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~17_combout\);

-- Location: FF_X8_Y20_N11
\decod_length[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[0]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N12
\decod_length~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~18_combout\ = (\decod_length~16_combout\ & (\decod_length[0]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[0]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[1]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~18_combout\);

-- Location: FF_X8_Y20_N13
\decod_length[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[1]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N14
\decod_length~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~19_combout\ = (\decod_length~16_combout\ & (\decod_length[1]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[2]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~19_combout\);

-- Location: FF_X8_Y20_N15
\decod_length[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[2]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N4
\decod_length~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~20_combout\ = (\decod_length~16_combout\ & (\decod_length[2]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[2]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[3]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~20_combout\);

-- Location: FF_X8_Y20_N5
\decod_length[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[3]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N2
\decod_length~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~21_combout\ = (\decod_length~16_combout\ & (\decod_length[3]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[3]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[4]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~21_combout\);

-- Location: FF_X8_Y20_N3
\decod_length[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[4]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N16
\decod_length~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~22_combout\ = (\decod_length~16_combout\ & (((\decod_length[4]~reg0_q\)))) # (!\decod_length~16_combout\ & (!\reset~input_o\ & ((\decod_length[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_length[4]~reg0_q\,
	datac => \decod_length[5]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~22_combout\);

-- Location: FF_X8_Y20_N17
\decod_length[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[5]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N22
\decod_length~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~23_combout\ = (\decod_length~16_combout\ & (\decod_length[5]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[5]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[6]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~23_combout\);

-- Location: FF_X8_Y20_N23
\decod_length[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[6]~reg0_q\);

-- Location: LCCOMB_X8_Y20_N8
\decod_length~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length~24_combout\ = (\decod_length~16_combout\ & (\decod_length[6]~reg0_q\)) # (!\decod_length~16_combout\ & (((!\reset~input_o\ & \decod_length[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_length[6]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_length[7]~reg0_q\,
	datad => \decod_length~16_combout\,
	combout => \decod_length~24_combout\);

-- Location: FF_X8_Y20_N9
\decod_length[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length[7]~reg0_q\);

-- Location: LCCOMB_X8_Y18_N30
\decod_data2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~16_combout\ = (\message_decryption~4_combout\ & (\message_decryption~5_combout\ & (\message_decryption~2_combout\ & \message_decryption~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~4_combout\,
	datab => \message_decryption~5_combout\,
	datac => \message_decryption~2_combout\,
	datad => \message_decryption~0_combout\,
	combout => \decod_data2~16_combout\);

-- Location: LCCOMB_X4_Y18_N24
\decod_data0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~16_combout\ = (!\message_decryption~3_combout\ & \decod_data2~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \message_decryption~3_combout\,
	datac => \decod_data2~16_combout\,
	combout => \decod_data0~16_combout\);

-- Location: LCCOMB_X4_Y18_N28
\decod_data0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~17_combout\ = (\decod_data0~16_combout\ & (((\aux_val_prev~q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \aux_val_prev~q\,
	datac => \decod_data0[0]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~17_combout\);

-- Location: FF_X4_Y18_N29
\decod_data0[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[0]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N18
\decod_data0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~18_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[0]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[0]~reg0_q\,
	datac => \decod_data0[1]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~18_combout\);

-- Location: FF_X4_Y18_N19
\decod_data0[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[1]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N20
\decod_data0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~19_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[1]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[1]~reg0_q\,
	datac => \decod_data0[2]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~19_combout\);

-- Location: FF_X4_Y18_N21
\decod_data0[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[2]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N14
\decod_data0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~20_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[2]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[2]~reg0_q\,
	datac => \decod_data0[3]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~20_combout\);

-- Location: FF_X4_Y18_N15
\decod_data0[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[3]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N8
\decod_data0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~21_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[3]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[3]~reg0_q\,
	datac => \decod_data0[4]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~21_combout\);

-- Location: FF_X4_Y18_N9
\decod_data0[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[4]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N26
\decod_data0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~22_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[4]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[4]~reg0_q\,
	datac => \decod_data0[5]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~22_combout\);

-- Location: FF_X4_Y18_N27
\decod_data0[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[5]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N4
\decod_data0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~23_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[5]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[5]~reg0_q\,
	datac => \decod_data0[6]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~23_combout\);

-- Location: FF_X4_Y18_N5
\decod_data0[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[6]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N22
\decod_data0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0~24_combout\ = (\decod_data0~16_combout\ & (((\decod_data0[6]~reg0_q\)))) # (!\decod_data0~16_combout\ & (!\reset~input_o\ & ((\decod_data0[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data0[6]~reg0_q\,
	datac => \decod_data0[7]~reg0_q\,
	datad => \decod_data0~16_combout\,
	combout => \decod_data0~24_combout\);

-- Location: FF_X4_Y18_N23
\decod_data0[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0[7]~reg0_q\);

-- Location: LCCOMB_X8_Y18_N12
\decod_data1_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1_ready~2_combout\ = (\Equal0~10_combout\ & (\Equal0~11_combout\ & (\LessThan7~2_combout\ & !\LessThan9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~10_combout\,
	datab => \Equal0~11_combout\,
	datac => \LessThan7~2_combout\,
	datad => \LessThan9~0_combout\,
	combout => \decod_data1_ready~2_combout\);

-- Location: LCCOMB_X7_Y18_N28
\decod_data1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~16_combout\ = (\message_decryption~3_combout\ & (\decod_data1_ready~2_combout\ & \decod_data2~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~3_combout\,
	datab => \decod_data1_ready~2_combout\,
	datac => \decod_data2~16_combout\,
	combout => \decod_data1~16_combout\);

-- Location: LCCOMB_X7_Y18_N4
\decod_data1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~17_combout\ = (\decod_data1~16_combout\ & (((\aux_val_prev~q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \aux_val_prev~q\,
	datac => \decod_data1[0]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~17_combout\);

-- Location: FF_X7_Y18_N5
\decod_data1[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[0]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N18
\decod_data1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~18_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[0]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[0]~reg0_q\,
	datac => \decod_data1[1]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~18_combout\);

-- Location: FF_X7_Y18_N19
\decod_data1[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[1]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N20
\decod_data1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~19_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[1]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[1]~reg0_q\,
	datac => \decod_data1[2]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~19_combout\);

-- Location: FF_X7_Y18_N21
\decod_data1[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[2]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N2
\decod_data1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~20_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[2]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[2]~reg0_q\,
	datac => \decod_data1[3]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~20_combout\);

-- Location: FF_X7_Y18_N3
\decod_data1[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[3]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N12
\decod_data1~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~21_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[3]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[3]~reg0_q\,
	datac => \decod_data1[4]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~21_combout\);

-- Location: FF_X7_Y18_N13
\decod_data1[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[4]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N26
\decod_data1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~22_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[4]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[4]~reg0_q\,
	datac => \decod_data1[5]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~22_combout\);

-- Location: FF_X7_Y18_N27
\decod_data1[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[5]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N16
\decod_data1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~23_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[5]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[5]~reg0_q\,
	datac => \decod_data1[6]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~23_combout\);

-- Location: FF_X7_Y18_N17
\decod_data1[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[6]~reg0_q\);

-- Location: LCCOMB_X7_Y18_N30
\decod_data1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1~24_combout\ = (\decod_data1~16_combout\ & (((\decod_data1[6]~reg0_q\)))) # (!\decod_data1~16_combout\ & (!\reset~input_o\ & ((\decod_data1[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data1[6]~reg0_q\,
	datac => \decod_data1[7]~reg0_q\,
	datad => \decod_data1~16_combout\,
	combout => \decod_data1~24_combout\);

-- Location: FF_X7_Y18_N31
\decod_data1[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1[7]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N6
\decod_data2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~17_combout\ = (\decod_data2~16_combout\ & (\message_decryption~3_combout\ & (\decod_data2_ready~0_combout\ & !\decod_data1_ready~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data2~16_combout\,
	datab => \message_decryption~3_combout\,
	datac => \decod_data2_ready~0_combout\,
	datad => \decod_data1_ready~2_combout\,
	combout => \decod_data2~17_combout\);

-- Location: LCCOMB_X4_Y18_N16
\decod_data2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~18_combout\ = (\decod_data2~17_combout\ & (((\aux_val_prev~q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \aux_val_prev~q\,
	datac => \decod_data2[0]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~18_combout\);

-- Location: FF_X4_Y18_N17
\decod_data2[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[0]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N30
\decod_data2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~19_combout\ = (\decod_data2~17_combout\ & (((\decod_data2[0]~reg0_q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data2[0]~reg0_q\,
	datac => \decod_data2[1]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~19_combout\);

-- Location: FF_X4_Y18_N31
\decod_data2[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[1]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N0
\decod_data2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~20_combout\ = (\decod_data2~17_combout\ & (\decod_data2[1]~reg0_q\)) # (!\decod_data2~17_combout\ & (((!\reset~input_o\ & \decod_data2[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data2[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data2[2]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~20_combout\);

-- Location: FF_X4_Y18_N1
\decod_data2[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[2]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N2
\decod_data2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~21_combout\ = (\decod_data2~17_combout\ & (((\decod_data2[2]~reg0_q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data2[2]~reg0_q\,
	datac => \decod_data2[3]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~21_combout\);

-- Location: FF_X4_Y18_N3
\decod_data2[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[3]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N12
\decod_data2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~22_combout\ = (\decod_data2~17_combout\ & (((\decod_data2[3]~reg0_q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data2[3]~reg0_q\,
	datac => \decod_data2[4]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~22_combout\);

-- Location: FF_X4_Y18_N13
\decod_data2[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[4]~reg0_q\);

-- Location: LCCOMB_X4_Y18_N10
\decod_data2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~23_combout\ = (\decod_data2~17_combout\ & (\decod_data2[4]~reg0_q\)) # (!\decod_data2~17_combout\ & (((!\reset~input_o\ & \decod_data2[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data2[4]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data2[5]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~23_combout\);

-- Location: FF_X4_Y18_N11
\decod_data2[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[5]~reg0_q\);

-- Location: LCCOMB_X3_Y18_N0
\decod_data2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~24_combout\ = (\decod_data2~17_combout\ & (((\decod_data2[5]~reg0_q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data2[5]~reg0_q\,
	datac => \decod_data2[6]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~24_combout\);

-- Location: FF_X3_Y18_N1
\decod_data2[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[6]~reg0_q\);

-- Location: LCCOMB_X3_Y18_N30
\decod_data2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2~25_combout\ = (\decod_data2~17_combout\ & (((\decod_data2[6]~reg0_q\)))) # (!\decod_data2~17_combout\ & (!\reset~input_o\ & ((\decod_data2[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data2[6]~reg0_q\,
	datac => \decod_data2[7]~reg0_q\,
	datad => \decod_data2~17_combout\,
	combout => \decod_data2~25_combout\);

-- Location: FF_X3_Y18_N31
\decod_data2[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2[7]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N16
\decod_data3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~16_combout\ = (\message_decryption~0_combout\ & (!\message_decryption~1_combout\ & \decod_data5~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~0_combout\,
	datac => \message_decryption~1_combout\,
	datad => \decod_data5~20_combout\,
	combout => \decod_data3~16_combout\);

-- Location: LCCOMB_X16_Y18_N28
\decod_data3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~17_combout\ = (\decod_data3~16_combout\ & (((\aux_val_prev~q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \aux_val_prev~q\,
	datac => \decod_data3[0]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~17_combout\);

-- Location: FF_X16_Y18_N29
\decod_data3[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[0]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N14
\decod_data3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~18_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[0]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[0]~reg0_q\,
	datac => \decod_data3[1]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~18_combout\);

-- Location: FF_X16_Y18_N15
\decod_data3[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[1]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N24
\decod_data3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~19_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[1]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[1]~reg0_q\,
	datac => \decod_data3[2]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~19_combout\);

-- Location: FF_X16_Y18_N25
\decod_data3[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[2]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N2
\decod_data3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~20_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[2]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[2]~reg0_q\,
	datac => \decod_data3[3]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~20_combout\);

-- Location: FF_X16_Y18_N3
\decod_data3[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[3]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N4
\decod_data3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~21_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[3]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[3]~reg0_q\,
	datac => \decod_data3[4]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~21_combout\);

-- Location: FF_X16_Y18_N5
\decod_data3[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[4]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N26
\decod_data3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~22_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[4]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[4]~reg0_q\,
	datac => \decod_data3[5]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~22_combout\);

-- Location: FF_X16_Y18_N27
\decod_data3[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[5]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N20
\decod_data3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~23_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[5]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[5]~reg0_q\,
	datac => \decod_data3[6]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~23_combout\);

-- Location: FF_X16_Y18_N21
\decod_data3[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[6]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N30
\decod_data3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3~24_combout\ = (\decod_data3~16_combout\ & (((\decod_data3[6]~reg0_q\)))) # (!\decod_data3~16_combout\ & (!\reset~input_o\ & ((\decod_data3[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data3[6]~reg0_q\,
	datac => \decod_data3[7]~reg0_q\,
	datad => \decod_data3~16_combout\,
	combout => \decod_data3~24_combout\);

-- Location: FF_X16_Y18_N31
\decod_data3[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3[7]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N10
\decod_data4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~16_combout\ = (\message_decryption~0_combout\ & (\decod_data4_ready~1_combout\ & (\message_decryption~1_combout\ & \decod_data5~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~0_combout\,
	datab => \decod_data4_ready~1_combout\,
	datac => \message_decryption~1_combout\,
	datad => \decod_data5~20_combout\,
	combout => \decod_data4~16_combout\);

-- Location: LCCOMB_X16_Y18_N12
\decod_data4~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~17_combout\ = (\decod_data4~16_combout\ & (((\aux_val_prev~q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \aux_val_prev~q\,
	datac => \decod_data4[0]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~17_combout\);

-- Location: FF_X16_Y18_N13
\decod_data4[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[0]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N18
\decod_data4~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~18_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[0]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[0]~reg0_q\,
	datac => \decod_data4[1]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~18_combout\);

-- Location: FF_X16_Y18_N19
\decod_data4[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[1]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N8
\decod_data4~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~19_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[1]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[1]~reg0_q\,
	datac => \decod_data4[2]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~19_combout\);

-- Location: FF_X16_Y18_N9
\decod_data4[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[2]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N6
\decod_data4~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~20_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[2]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[2]~reg0_q\,
	datac => \decod_data4[3]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~20_combout\);

-- Location: FF_X16_Y18_N7
\decod_data4[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[3]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N0
\decod_data4~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~21_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[3]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[3]~reg0_q\,
	datac => \decod_data4[4]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~21_combout\);

-- Location: FF_X16_Y18_N1
\decod_data4[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[4]~reg0_q\);

-- Location: LCCOMB_X16_Y18_N22
\decod_data4~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~22_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[4]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[4]~reg0_q\,
	datac => \decod_data4[5]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~22_combout\);

-- Location: FF_X16_Y18_N23
\decod_data4[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[5]~reg0_q\);

-- Location: LCCOMB_X17_Y18_N24
\decod_data4~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~23_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[5]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[5]~reg0_q\,
	datac => \decod_data4[6]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~23_combout\);

-- Location: FF_X17_Y18_N25
\decod_data4[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[6]~reg0_q\);

-- Location: LCCOMB_X17_Y18_N30
\decod_data4~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4~24_combout\ = (\decod_data4~16_combout\ & (((\decod_data4[6]~reg0_q\)))) # (!\decod_data4~16_combout\ & (!\reset~input_o\ & ((\decod_data4[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data4[6]~reg0_q\,
	datac => \decod_data4[7]~reg0_q\,
	datad => \decod_data4~16_combout\,
	combout => \decod_data4~24_combout\);

-- Location: FF_X17_Y18_N31
\decod_data4[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4[7]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N28
\decod_data5~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~21_combout\ = (\message_decryption~0_combout\ & (!\decod_data4_ready~1_combout\ & (\message_decryption~1_combout\ & \decod_data5~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \message_decryption~0_combout\,
	datab => \decod_data4_ready~1_combout\,
	datac => \message_decryption~1_combout\,
	datad => \decod_data5~20_combout\,
	combout => \decod_data5~21_combout\);

-- Location: LCCOMB_X10_Y19_N16
\decod_data5~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~30_combout\ = (!\LessThan17~2_combout\ & (\decod_data6_ready~0_combout\ & (\LessThan15~1_combout\ & \decod_data5~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan17~2_combout\,
	datab => \decod_data6_ready~0_combout\,
	datac => \LessThan15~1_combout\,
	datad => \decod_data5~21_combout\,
	combout => \decod_data5~30_combout\);

-- Location: LCCOMB_X10_Y19_N24
\decod_data5~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~22_combout\ = (\decod_data5~30_combout\ & (\aux_val_prev~q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aux_val_prev~q\,
	datab => \reset~input_o\,
	datac => \decod_data5[0]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~22_combout\);

-- Location: FF_X10_Y19_N25
\decod_data5[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[0]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N26
\decod_data5~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~23_combout\ = (\decod_data5~30_combout\ & (((\decod_data5[0]~reg0_q\)))) # (!\decod_data5~30_combout\ & (!\reset~input_o\ & ((\decod_data5[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data5[0]~reg0_q\,
	datac => \decod_data5[1]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~23_combout\);

-- Location: FF_X10_Y19_N27
\decod_data5[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[1]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N20
\decod_data5~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~24_combout\ = (\decod_data5~30_combout\ & (\decod_data5[1]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[2]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~24_combout\);

-- Location: FF_X10_Y19_N21
\decod_data5[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[2]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N10
\decod_data5~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~25_combout\ = (\decod_data5~30_combout\ & (\decod_data5[2]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[2]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[3]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~25_combout\);

-- Location: FF_X10_Y19_N11
\decod_data5[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[3]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N4
\decod_data5~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~26_combout\ = (\decod_data5~30_combout\ & (\decod_data5[3]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[3]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[4]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~26_combout\);

-- Location: FF_X10_Y19_N5
\decod_data5[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[4]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N14
\decod_data5~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~27_combout\ = (\decod_data5~30_combout\ & (\decod_data5[4]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[4]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[5]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~27_combout\);

-- Location: FF_X10_Y19_N15
\decod_data5[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[5]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N12
\decod_data5~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~28_combout\ = (\decod_data5~30_combout\ & (\decod_data5[5]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[5]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[6]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~28_combout\);

-- Location: FF_X10_Y19_N13
\decod_data5[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[6]~reg0_q\);

-- Location: LCCOMB_X10_Y19_N6
\decod_data5~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5~29_combout\ = (\decod_data5~30_combout\ & (\decod_data5[6]~reg0_q\)) # (!\decod_data5~30_combout\ & (((!\reset~input_o\ & \decod_data5[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5[6]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data5[7]~reg0_q\,
	datad => \decod_data5~30_combout\,
	combout => \decod_data5~29_combout\);

-- Location: FF_X10_Y19_N7
\decod_data5[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5[7]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N10
\decod_data6~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~27_combout\ = (\decod_data6_ready~6_combout\ & (\decod_data5~21_combout\ & ((bit_index(26)) # (\LessThan17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~6_combout\,
	datab => bit_index(26),
	datac => \LessThan17~3_combout\,
	datad => \decod_data5~21_combout\,
	combout => \decod_data6~27_combout\);

-- Location: LCCOMB_X11_Y19_N12
\decod_data6~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~19_combout\ = (\decod_data6~27_combout\ & (\aux_val_prev~q\)) # (!\decod_data6~27_combout\ & (((!\reset~input_o\ & \decod_data6[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aux_val_prev~q\,
	datab => \reset~input_o\,
	datac => \decod_data6[0]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~19_combout\);

-- Location: FF_X11_Y19_N13
\decod_data6[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[0]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N26
\decod_data6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~20_combout\ = (\decod_data6~27_combout\ & (\decod_data6[0]~reg0_q\)) # (!\decod_data6~27_combout\ & (((!\reset~input_o\ & \decod_data6[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6[0]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data6[1]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~20_combout\);

-- Location: FF_X11_Y19_N27
\decod_data6[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[1]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N0
\decod_data6~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~21_combout\ = (\decod_data6~27_combout\ & (\decod_data6[1]~reg0_q\)) # (!\decod_data6~27_combout\ & (((!\reset~input_o\ & \decod_data6[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6[1]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data6[2]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~21_combout\);

-- Location: FF_X11_Y19_N1
\decod_data6[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[2]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N30
\decod_data6~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~22_combout\ = (\decod_data6~27_combout\ & (((\decod_data6[2]~reg0_q\)))) # (!\decod_data6~27_combout\ & (!\reset~input_o\ & ((\decod_data6[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data6[2]~reg0_q\,
	datac => \decod_data6[3]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~22_combout\);

-- Location: FF_X11_Y19_N31
\decod_data6[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[3]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N4
\decod_data6~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~23_combout\ = (\decod_data6~27_combout\ & (\decod_data6[3]~reg0_q\)) # (!\decod_data6~27_combout\ & (((!\reset~input_o\ & \decod_data6[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6[3]~reg0_q\,
	datab => \reset~input_o\,
	datac => \decod_data6[4]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~23_combout\);

-- Location: FF_X11_Y19_N5
\decod_data6[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[4]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N14
\decod_data6~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~24_combout\ = (\decod_data6~27_combout\ & (((\decod_data6[4]~reg0_q\)))) # (!\decod_data6~27_combout\ & (!\reset~input_o\ & ((\decod_data6[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data6[4]~reg0_q\,
	datac => \decod_data6[5]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~24_combout\);

-- Location: FF_X11_Y19_N15
\decod_data6[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[5]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N24
\decod_data6~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~25_combout\ = (\decod_data6~27_combout\ & (((\decod_data6[5]~reg0_q\)))) # (!\decod_data6~27_combout\ & (!\reset~input_o\ & ((\decod_data6[6]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data6[5]~reg0_q\,
	datac => \decod_data6[6]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~25_combout\);

-- Location: FF_X11_Y19_N25
\decod_data6[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[6]~reg0_q\);

-- Location: LCCOMB_X11_Y19_N18
\decod_data6~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6~26_combout\ = (\decod_data6~27_combout\ & (((\decod_data6[6]~reg0_q\)))) # (!\decod_data6~27_combout\ & (!\reset~input_o\ & ((\decod_data6[7]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \decod_data6[6]~reg0_q\,
	datac => \decod_data6[7]~reg0_q\,
	datad => \decod_data6~27_combout\,
	combout => \decod_data6~26_combout\);

-- Location: FF_X11_Y19_N19
\decod_data6[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6[7]~reg0_q\);

-- Location: LCCOMB_X9_Y18_N30
\decod_comm_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm_ready~2_combout\ = (\decod_comm_ready~1_combout\ & (\Equal0~13_combout\ & (bit_index(2) & \message_decryption~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm_ready~1_combout\,
	datab => \Equal0~13_combout\,
	datac => bit_index(2),
	datad => \message_decryption~0_combout\,
	combout => \decod_comm_ready~2_combout\);

-- Location: LCCOMB_X8_Y18_N20
\decod_comm_ready~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_comm_ready~3_combout\ = (!\LessThan1~0_combout\ & (\decod_comm_ready~0_combout\ & (\decod_comm_ready~2_combout\ & \Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \decod_comm_ready~0_combout\,
	datac => \decod_comm_ready~2_combout\,
	datad => \Equal0~10_combout\,
	combout => \decod_comm_ready~3_combout\);

-- Location: FF_X8_Y18_N21
\decod_comm_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_comm_ready~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_comm_ready~reg0_q\);

-- Location: LCCOMB_X9_Y19_N8
\decod_address_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address_ready~1_combout\ = (bit_index(3) & (!bit_index(5) & bit_index(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datab => bit_index(5),
	datad => bit_index(4),
	combout => \decod_address_ready~1_combout\);

-- Location: LCCOMB_X9_Y19_N28
\decod_data6_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~1_combout\ = (\LessThan0~2_combout\ & (!bit_index(25) & (\message_decryption~0_combout\ & \Equal0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => bit_index(25),
	datac => \message_decryption~0_combout\,
	datad => \Equal0~14_combout\,
	combout => \decod_data6_ready~1_combout\);

-- Location: LCCOMB_X9_Y19_N18
\decod_address_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address_ready~0_combout\ = (!bit_index(6) & (!bit_index(26) & \decod_data6_ready~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => bit_index(26),
	datad => \decod_data6_ready~1_combout\,
	combout => \decod_address_ready~0_combout\);

-- Location: LCCOMB_X9_Y19_N0
\decod_address_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_address_ready~2_combout\ = (\LessThan3~1_combout\ & (\decod_address_ready~1_combout\ & (\decod_data6_ready~0_combout\ & \decod_address_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~1_combout\,
	datab => \decod_address_ready~1_combout\,
	datac => \decod_data6_ready~0_combout\,
	datad => \decod_address_ready~0_combout\,
	combout => \decod_address_ready~2_combout\);

-- Location: FF_X9_Y19_N1
\decod_address_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_address_ready~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_address_ready~reg0_q\);

-- Location: LCCOMB_X9_Y19_N16
\decod_length_ready~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length_ready~3_combout\ = (!bit_index(27) & (!bit_index(4) & (!bit_index(3) & !bit_index(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(27),
	datab => bit_index(4),
	datac => bit_index(3),
	datad => bit_index(26),
	combout => \decod_length_ready~3_combout\);

-- Location: LCCOMB_X9_Y19_N2
\decod_length_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length_ready~2_combout\ = (!bit_index(6) & (bit_index(5) & \decod_data6_ready~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datac => bit_index(5),
	datad => \decod_data6_ready~1_combout\,
	combout => \decod_length_ready~2_combout\);

-- Location: LCCOMB_X9_Y19_N22
\decod_length_ready~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_length_ready~4_combout\ = (\decod_data6_ready~0_combout\ & (\decod_length_ready~3_combout\ & (\LessThan5~4_combout\ & \decod_length_ready~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~0_combout\,
	datab => \decod_length_ready~3_combout\,
	datac => \LessThan5~4_combout\,
	datad => \decod_length_ready~2_combout\,
	combout => \decod_length_ready~4_combout\);

-- Location: FF_X9_Y19_N23
\decod_length_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_length_ready~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_length_ready~reg0_q\);

-- Location: LCCOMB_X8_Y18_N26
\LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~1_combout\ = (bit_index(6)) # (((\LessThan7~0_combout\) # (!\Equal0~9_combout\)) # (!\Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => \Equal0~4_combout\,
	datac => \Equal0~9_combout\,
	datad => \LessThan7~0_combout\,
	combout => \LessThan7~1_combout\);

-- Location: LCCOMB_X9_Y19_N14
\decod_data0_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0_ready~0_combout\ = (\Equal0~11_combout\ & (!\LessThan5~4_combout\ & (!\LessThan7~1_combout\ & \LessThan13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~11_combout\,
	datab => \LessThan5~4_combout\,
	datac => \LessThan7~1_combout\,
	datad => \LessThan13~0_combout\,
	combout => \decod_data0_ready~0_combout\);

-- Location: LCCOMB_X9_Y19_N4
\decod_data0_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data0_ready~1_combout\ = (bit_index(3) & (!bit_index(4) & (\decod_data0_ready~0_combout\ & \decod_length_ready~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datab => bit_index(4),
	datac => \decod_data0_ready~0_combout\,
	datad => \decod_length_ready~2_combout\,
	combout => \decod_data0_ready~1_combout\);

-- Location: FF_X9_Y19_N5
\decod_data0_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data0_ready~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data0_ready~reg0_q\);

-- Location: LCCOMB_X9_Y19_N24
\decod_data1_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1_ready~0_combout\ = (bit_index(27)) # ((bit_index(26)) # ((\LessThan5~2_combout\) # (!\decod_comm_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(27),
	datab => bit_index(26),
	datac => \decod_comm_ready~0_combout\,
	datad => \LessThan5~2_combout\,
	combout => \decod_data1_ready~0_combout\);

-- Location: LCCOMB_X9_Y19_N30
\decod_data1_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1_ready~1_combout\ = (!bit_index(3) & (bit_index(4) & (bit_index(5) & \decod_data1_ready~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datab => bit_index(4),
	datac => bit_index(5),
	datad => \decod_data1_ready~0_combout\,
	combout => \decod_data1_ready~1_combout\);

-- Location: LCCOMB_X9_Y19_N10
\decod_data1_ready~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data1_ready~3_combout\ = (\decod_data1_ready~2_combout\ & (\decod_data1_ready~1_combout\ & \decod_address_ready~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data1_ready~2_combout\,
	datac => \decod_data1_ready~1_combout\,
	datad => \decod_address_ready~0_combout\,
	combout => \decod_data1_ready~3_combout\);

-- Location: FF_X9_Y19_N11
\decod_data1_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data1_ready~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data1_ready~reg0_q\);

-- Location: LCCOMB_X9_Y18_N28
\decod_data5_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~0_combout\ = (bit_index(1) & (!bit_index(0) & (bit_index(2) & \message_decryption~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(1),
	datab => bit_index(0),
	datac => bit_index(2),
	datad => \message_decryption~0_combout\,
	combout => \decod_data5_ready~0_combout\);

-- Location: LCCOMB_X9_Y18_N14
\LessThan5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~3_combout\ = (\decod_comm_ready~0_combout\ & (((\LessThan0~2_combout\ & \decod_length_ready~0_combout\)) # (!bit_index(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \decod_length_ready~0_combout\,
	datac => bit_index(5),
	datad => \decod_comm_ready~0_combout\,
	combout => \LessThan5~3_combout\);

-- Location: LCCOMB_X8_Y18_N0
\decod_data2_ready~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2_ready~1_combout\ = (\decod_data5_ready~0_combout\ & (\decod_data1_ready~1_combout\ & ((\LessThan7~1_combout\) # (\LessThan5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~1_combout\,
	datab => \decod_data5_ready~0_combout\,
	datac => \LessThan5~3_combout\,
	datad => \decod_data1_ready~1_combout\,
	combout => \decod_data2_ready~1_combout\);

-- Location: LCCOMB_X8_Y18_N22
\decod_data2_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data2_ready~2_combout\ = (\Equal0~10_combout\ & (\decod_data2_ready~0_combout\ & \decod_data2_ready~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~10_combout\,
	datac => \decod_data2_ready~0_combout\,
	datad => \decod_data2_ready~1_combout\,
	combout => \decod_data2_ready~2_combout\);

-- Location: FF_X8_Y18_N23
\decod_data2_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data2_ready~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data2_ready~reg0_q\);

-- Location: LCCOMB_X10_Y19_N8
\decod_data3_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data3_ready~0_combout\ = (bit_index(6) & (!\LessThan13~1_combout\ & (\Equal0~13_combout\ & \decod_data6_ready~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => \LessThan13~1_combout\,
	datac => \Equal0~13_combout\,
	datad => \decod_data6_ready~1_combout\,
	combout => \decod_data3_ready~0_combout\);

-- Location: FF_X10_Y19_N9
\decod_data3_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data3_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data3_ready~reg0_q\);

-- Location: LCCOMB_X9_Y18_N0
\decod_data6_ready~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~3_combout\ = (!bit_index(30) & (!\LessThan1~0_combout\ & (!bit_index(29) & \Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(30),
	datab => \LessThan1~0_combout\,
	datac => bit_index(29),
	datad => \Equal0~10_combout\,
	combout => \decod_data6_ready~3_combout\);

-- Location: LCCOMB_X9_Y19_N6
\decod_data6_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~2_combout\ = (bit_index(3) & (\decod_data6_ready~1_combout\ & (!bit_index(5) & bit_index(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datab => \decod_data6_ready~1_combout\,
	datac => bit_index(5),
	datad => bit_index(6),
	combout => \decod_data6_ready~2_combout\);

-- Location: LCCOMB_X10_Y19_N30
\decod_data6_ready~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~4_combout\ = (\decod_data6_ready~3_combout\ & (((\LessThan0~3_combout\)))) # (!\decod_data6_ready~3_combout\ & ((bit_index(28)) # ((\decod_data1_ready~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(28),
	datab => \LessThan0~3_combout\,
	datac => \decod_data6_ready~3_combout\,
	datad => \decod_data1_ready~0_combout\,
	combout => \decod_data6_ready~4_combout\);

-- Location: LCCOMB_X9_Y19_N12
\decod_data4_ready~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4_ready~0_combout\ = ((\decod_comm_ready~0_combout\ & (!\LessThan3~0_combout\ & !bit_index(26)))) # (!\LessThan5~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_comm_ready~0_combout\,
	datab => \LessThan3~0_combout\,
	datac => \LessThan5~4_combout\,
	datad => bit_index(26),
	combout => \decod_data4_ready~0_combout\);

-- Location: LCCOMB_X10_Y19_N0
\decod_data6_ready~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~5_combout\ = (\decod_data6_ready~2_combout\ & (\decod_data6_ready~4_combout\ & ((\decod_data4_ready~0_combout\) # (!\decod_data6_ready~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data6_ready~3_combout\,
	datab => \decod_data6_ready~2_combout\,
	datac => \decod_data6_ready~4_combout\,
	datad => \decod_data4_ready~0_combout\,
	combout => \decod_data6_ready~5_combout\);

-- Location: LCCOMB_X10_Y19_N18
\decod_data4_ready~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data4_ready~2_combout\ = (\decod_data4_ready~1_combout\ & (!bit_index(4) & (!bit_index(26) & \decod_data6_ready~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data4_ready~1_combout\,
	datab => bit_index(4),
	datac => bit_index(26),
	datad => \decod_data6_ready~5_combout\,
	combout => \decod_data4_ready~2_combout\);

-- Location: FF_X10_Y19_N19
\decod_data4_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data4_ready~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data4_ready~reg0_q\);

-- Location: LCCOMB_X9_Y19_N20
\decod_data5_ready~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~3_combout\ = (bit_index(3) & (!bit_index(4) & (!bit_index(5) & bit_index(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(3),
	datab => bit_index(4),
	datac => bit_index(5),
	datad => bit_index(6),
	combout => \decod_data5_ready~3_combout\);

-- Location: LCCOMB_X8_Y18_N6
\decod_data5_ready~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~4_combout\ = (\decod_data5_ready~0_combout\ & (((bit_index(6) & !\LessThan0~3_combout\)) # (!\Equal0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_index(6),
	datab => \LessThan0~3_combout\,
	datac => \Equal0~14_combout\,
	datad => \decod_data5_ready~0_combout\,
	combout => \decod_data5_ready~4_combout\);

-- Location: LCCOMB_X8_Y18_N28
\decod_data5_ready~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data5_ready~5_combout\ = (\decod_data5_ready~1_combout\ & (\decod_data5_ready~3_combout\ & (\decod_data5_ready~2_combout\ & \decod_data5_ready~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decod_data5_ready~1_combout\,
	datab => \decod_data5_ready~3_combout\,
	datac => \decod_data5_ready~2_combout\,
	datad => \decod_data5_ready~4_combout\,
	combout => \decod_data5_ready~5_combout\);

-- Location: FF_X8_Y18_N29
\decod_data5_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data5_ready~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data5_ready~reg0_q\);

-- Location: LCCOMB_X10_Y19_N22
\decod_data6_ready~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~7_combout\ = (bit_index(4) & (\LessThan15~1_combout\ & \decod_data6_ready~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_index(4),
	datac => \LessThan15~1_combout\,
	datad => \decod_data6_ready~6_combout\,
	combout => \decod_data6_ready~7_combout\);

-- Location: LCCOMB_X10_Y19_N28
\decod_data6_ready~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \decod_data6_ready~8_combout\ = (\LessThan17~2_combout\ & (\LessThan13~1_combout\ & (\decod_data6_ready~7_combout\ & \decod_data6_ready~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan17~2_combout\,
	datab => \LessThan13~1_combout\,
	datac => \decod_data6_ready~7_combout\,
	datad => \decod_data6_ready~5_combout\,
	combout => \decod_data6_ready~8_combout\);

-- Location: FF_X10_Y19_N29
\decod_data6_ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_16~inputclkctrl_outclk\,
	d => \decod_data6_ready~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \decod_data6_ready~reg0_q\);

-- Location: IOIBUF_X0_Y9_N8
\decod_comm[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_comm(0),
	o => \decod_comm[0]~input_o\);

-- Location: IOIBUF_X0_Y9_N1
\decod_comm[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_comm(1),
	o => \decod_comm[1]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\decod_comm[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_comm(2),
	o => \decod_comm[2]~input_o\);

-- Location: IOIBUF_X0_Y5_N22
\decod_comm[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_comm(3),
	o => \decod_comm[3]~input_o\);

-- Location: IOIBUF_X3_Y24_N1
\decod_address[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(0),
	o => \decod_address[0]~input_o\);

-- Location: IOIBUF_X7_Y24_N8
\decod_address[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(1),
	o => \decod_address[1]~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\decod_address[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(2),
	o => \decod_address[2]~input_o\);

-- Location: IOIBUF_X3_Y24_N22
\decod_address[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(3),
	o => \decod_address[3]~input_o\);

-- Location: IOIBUF_X3_Y24_N15
\decod_address[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(4),
	o => \decod_address[4]~input_o\);

-- Location: IOIBUF_X0_Y21_N8
\decod_address[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(5),
	o => \decod_address[5]~input_o\);

-- Location: IOIBUF_X1_Y24_N8
\decod_address[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(6),
	o => \decod_address[6]~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\decod_address[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(7),
	o => \decod_address[7]~input_o\);

-- Location: IOIBUF_X7_Y24_N15
\decod_address[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(8),
	o => \decod_address[8]~input_o\);

-- Location: IOIBUF_X5_Y24_N22
\decod_address[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(9),
	o => \decod_address[9]~input_o\);

-- Location: IOIBUF_X16_Y24_N22
\decod_address[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(10),
	o => \decod_address[10]~input_o\);

-- Location: IOIBUF_X11_Y24_N22
\decod_address[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(11),
	o => \decod_address[11]~input_o\);

-- Location: IOIBUF_X0_Y4_N15
\decod_address[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(12),
	o => \decod_address[12]~input_o\);

-- Location: IOIBUF_X0_Y23_N8
\decod_address[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(13),
	o => \decod_address[13]~input_o\);

-- Location: IOIBUF_X5_Y24_N8
\decod_address[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(14),
	o => \decod_address[14]~input_o\);

-- Location: IOIBUF_X5_Y24_N1
\decod_address[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(15),
	o => \decod_address[15]~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\decod_address[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(16),
	o => \decod_address[16]~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\decod_address[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(17),
	o => \decod_address[17]~input_o\);

-- Location: IOIBUF_X0_Y4_N22
\decod_address[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(18),
	o => \decod_address[18]~input_o\);

-- Location: IOIBUF_X30_Y24_N1
\decod_address[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_address(19),
	o => \decod_address[19]~input_o\);

-- Location: IOIBUF_X7_Y24_N1
\decod_length[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(0),
	o => \decod_length[0]~input_o\);

-- Location: IOIBUF_X3_Y24_N8
\decod_length[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(1),
	o => \decod_length[1]~input_o\);

-- Location: IOIBUF_X5_Y24_N15
\decod_length[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(2),
	o => \decod_length[2]~input_o\);

-- Location: IOIBUF_X7_Y0_N8
\decod_length[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(3),
	o => \decod_length[3]~input_o\);

-- Location: IOIBUF_X16_Y24_N15
\decod_length[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(4),
	o => \decod_length[4]~input_o\);

-- Location: IOIBUF_X13_Y24_N22
\decod_length[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(5),
	o => \decod_length[5]~input_o\);

-- Location: IOIBUF_X9_Y24_N22
\decod_length[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(6),
	o => \decod_length[6]~input_o\);

-- Location: IOIBUF_X9_Y24_N15
\decod_length[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_length(7),
	o => \decod_length[7]~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\decod_data0[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(0),
	o => \decod_data0[0]~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\decod_data0[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(1),
	o => \decod_data0[1]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\decod_data0[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(2),
	o => \decod_data0[2]~input_o\);

-- Location: IOIBUF_X0_Y8_N8
\decod_data0[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(3),
	o => \decod_data0[3]~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\decod_data0[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(4),
	o => \decod_data0[4]~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\decod_data0[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(5),
	o => \decod_data0[5]~input_o\);

-- Location: IOIBUF_X0_Y10_N22
\decod_data0[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(6),
	o => \decod_data0[6]~input_o\);

-- Location: IOIBUF_X0_Y7_N15
\decod_data0[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data0(7),
	o => \decod_data0[7]~input_o\);

-- Location: IOIBUF_X11_Y0_N8
\decod_data1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(0),
	o => \decod_data1[0]~input_o\);

-- Location: IOIBUF_X9_Y0_N15
\decod_data1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(1),
	o => \decod_data1[1]~input_o\);

-- Location: IOIBUF_X25_Y24_N1
\decod_data1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(2),
	o => \decod_data1[2]~input_o\);

-- Location: IOIBUF_X0_Y10_N1
\decod_data1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(3),
	o => \decod_data1[3]~input_o\);

-- Location: IOIBUF_X7_Y0_N15
\decod_data1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(4),
	o => \decod_data1[4]~input_o\);

-- Location: IOIBUF_X1_Y24_N1
\decod_data1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(5),
	o => \decod_data1[5]~input_o\);

-- Location: IOIBUF_X7_Y0_N1
\decod_data1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(6),
	o => \decod_data1[6]~input_o\);

-- Location: IOIBUF_X7_Y0_N22
\decod_data1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data1(7),
	o => \decod_data1[7]~input_o\);

-- Location: IOIBUF_X0_Y8_N22
\decod_data2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(0),
	o => \decod_data2[0]~input_o\);

-- Location: IOIBUF_X34_Y18_N1
\decod_data2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(1),
	o => \decod_data2[1]~input_o\);

-- Location: IOIBUF_X0_Y19_N22
\decod_data2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(2),
	o => \decod_data2[2]~input_o\);

-- Location: IOIBUF_X0_Y8_N1
\decod_data2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(3),
	o => \decod_data2[3]~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\decod_data2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(4),
	o => \decod_data2[4]~input_o\);

-- Location: IOIBUF_X0_Y18_N15
\decod_data2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(5),
	o => \decod_data2[5]~input_o\);

-- Location: IOIBUF_X0_Y19_N1
\decod_data2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(6),
	o => \decod_data2[6]~input_o\);

-- Location: IOIBUF_X0_Y22_N1
\decod_data2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data2(7),
	o => \decod_data2[7]~input_o\);

-- Location: IOIBUF_X34_Y18_N15
\decod_data3[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(0),
	o => \decod_data3[0]~input_o\);

-- Location: IOIBUF_X25_Y24_N22
\decod_data3[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(1),
	o => \decod_data3[1]~input_o\);

-- Location: IOIBUF_X16_Y24_N1
\decod_data3[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(2),
	o => \decod_data3[2]~input_o\);

-- Location: IOIBUF_X21_Y24_N8
\decod_data3[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(3),
	o => \decod_data3[3]~input_o\);

-- Location: IOIBUF_X23_Y24_N1
\decod_data3[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(4),
	o => \decod_data3[4]~input_o\);

-- Location: IOIBUF_X23_Y24_N8
\decod_data3[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(5),
	o => \decod_data3[5]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\decod_data3[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(6),
	o => \decod_data3[6]~input_o\);

-- Location: IOIBUF_X25_Y24_N15
\decod_data3[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data3(7),
	o => \decod_data3[7]~input_o\);

-- Location: IOIBUF_X21_Y24_N15
\decod_data4[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(0),
	o => \decod_data4[0]~input_o\);

-- Location: IOIBUF_X23_Y24_N22
\decod_data4[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(1),
	o => \decod_data4[1]~input_o\);

-- Location: IOIBUF_X25_Y24_N8
\decod_data4[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(2),
	o => \decod_data4[2]~input_o\);

-- Location: IOIBUF_X28_Y24_N22
\decod_data4[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(3),
	o => \decod_data4[3]~input_o\);

-- Location: IOIBUF_X21_Y24_N1
\decod_data4[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(4),
	o => \decod_data4[4]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\decod_data4[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(5),
	o => \decod_data4[5]~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\decod_data4[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(6),
	o => \decod_data4[6]~input_o\);

-- Location: IOIBUF_X28_Y24_N1
\decod_data4[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data4(7),
	o => \decod_data4[7]~input_o\);

-- Location: IOIBUF_X13_Y0_N22
\decod_data5[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(0),
	o => \decod_data5[0]~input_o\);

-- Location: IOIBUF_X18_Y24_N22
\decod_data5[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(1),
	o => \decod_data5[1]~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\decod_data5[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(2),
	o => \decod_data5[2]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\decod_data5[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(3),
	o => \decod_data5[3]~input_o\);

-- Location: IOIBUF_X0_Y19_N15
\decod_data5[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(4),
	o => \decod_data5[4]~input_o\);

-- Location: IOIBUF_X13_Y24_N8
\decod_data5[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(5),
	o => \decod_data5[5]~input_o\);

-- Location: IOIBUF_X32_Y24_N22
\decod_data5[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(6),
	o => \decod_data5[6]~input_o\);

-- Location: IOIBUF_X13_Y24_N1
\decod_data5[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data5(7),
	o => \decod_data5[7]~input_o\);

-- Location: IOIBUF_X18_Y24_N8
\decod_data6[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(0),
	o => \decod_data6[0]~input_o\);

-- Location: IOIBUF_X23_Y24_N15
\decod_data6[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(1),
	o => \decod_data6[1]~input_o\);

-- Location: IOIBUF_X11_Y24_N8
\decod_data6[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(2),
	o => \decod_data6[2]~input_o\);

-- Location: IOIBUF_X16_Y24_N8
\decod_data6[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(3),
	o => \decod_data6[3]~input_o\);

-- Location: IOIBUF_X18_Y24_N15
\decod_data6[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(4),
	o => \decod_data6[4]~input_o\);

-- Location: IOIBUF_X11_Y24_N1
\decod_data6[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(5),
	o => \decod_data6[5]~input_o\);

-- Location: IOIBUF_X34_Y19_N8
\decod_data6[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(6),
	o => \decod_data6[6]~input_o\);

-- Location: IOIBUF_X11_Y24_N15
\decod_data6[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => decod_data6(7),
	o => \decod_data6[7]~input_o\);

ww_decod_comm_ready <= \decod_comm_ready~output_o\;

ww_decod_address_ready <= \decod_address_ready~output_o\;

ww_decod_length_ready <= \decod_length_ready~output_o\;

ww_decod_data0_ready <= \decod_data0_ready~output_o\;

ww_decod_data1_ready <= \decod_data1_ready~output_o\;

ww_decod_data2_ready <= \decod_data2_ready~output_o\;

ww_decod_data3_ready <= \decod_data3_ready~output_o\;

ww_decod_data4_ready <= \decod_data4_ready~output_o\;

ww_decod_data5_ready <= \decod_data5_ready~output_o\;

ww_decod_data6_ready <= \decod_data6_ready~output_o\;

decod_comm(0) <= \decod_comm[0]~output_o\;

decod_comm(1) <= \decod_comm[1]~output_o\;

decod_comm(2) <= \decod_comm[2]~output_o\;

decod_comm(3) <= \decod_comm[3]~output_o\;

decod_address(0) <= \decod_address[0]~output_o\;

decod_address(1) <= \decod_address[1]~output_o\;

decod_address(2) <= \decod_address[2]~output_o\;

decod_address(3) <= \decod_address[3]~output_o\;

decod_address(4) <= \decod_address[4]~output_o\;

decod_address(5) <= \decod_address[5]~output_o\;

decod_address(6) <= \decod_address[6]~output_o\;

decod_address(7) <= \decod_address[7]~output_o\;

decod_address(8) <= \decod_address[8]~output_o\;

decod_address(9) <= \decod_address[9]~output_o\;

decod_address(10) <= \decod_address[10]~output_o\;

decod_address(11) <= \decod_address[11]~output_o\;

decod_address(12) <= \decod_address[12]~output_o\;

decod_address(13) <= \decod_address[13]~output_o\;

decod_address(14) <= \decod_address[14]~output_o\;

decod_address(15) <= \decod_address[15]~output_o\;

decod_address(16) <= \decod_address[16]~output_o\;

decod_address(17) <= \decod_address[17]~output_o\;

decod_address(18) <= \decod_address[18]~output_o\;

decod_address(19) <= \decod_address[19]~output_o\;

decod_length(0) <= \decod_length[0]~output_o\;

decod_length(1) <= \decod_length[1]~output_o\;

decod_length(2) <= \decod_length[2]~output_o\;

decod_length(3) <= \decod_length[3]~output_o\;

decod_length(4) <= \decod_length[4]~output_o\;

decod_length(5) <= \decod_length[5]~output_o\;

decod_length(6) <= \decod_length[6]~output_o\;

decod_length(7) <= \decod_length[7]~output_o\;

decod_data0(0) <= \decod_data0[0]~output_o\;

decod_data0(1) <= \decod_data0[1]~output_o\;

decod_data0(2) <= \decod_data0[2]~output_o\;

decod_data0(3) <= \decod_data0[3]~output_o\;

decod_data0(4) <= \decod_data0[4]~output_o\;

decod_data0(5) <= \decod_data0[5]~output_o\;

decod_data0(6) <= \decod_data0[6]~output_o\;

decod_data0(7) <= \decod_data0[7]~output_o\;

decod_data1(0) <= \decod_data1[0]~output_o\;

decod_data1(1) <= \decod_data1[1]~output_o\;

decod_data1(2) <= \decod_data1[2]~output_o\;

decod_data1(3) <= \decod_data1[3]~output_o\;

decod_data1(4) <= \decod_data1[4]~output_o\;

decod_data1(5) <= \decod_data1[5]~output_o\;

decod_data1(6) <= \decod_data1[6]~output_o\;

decod_data1(7) <= \decod_data1[7]~output_o\;

decod_data2(0) <= \decod_data2[0]~output_o\;

decod_data2(1) <= \decod_data2[1]~output_o\;

decod_data2(2) <= \decod_data2[2]~output_o\;

decod_data2(3) <= \decod_data2[3]~output_o\;

decod_data2(4) <= \decod_data2[4]~output_o\;

decod_data2(5) <= \decod_data2[5]~output_o\;

decod_data2(6) <= \decod_data2[6]~output_o\;

decod_data2(7) <= \decod_data2[7]~output_o\;

decod_data3(0) <= \decod_data3[0]~output_o\;

decod_data3(1) <= \decod_data3[1]~output_o\;

decod_data3(2) <= \decod_data3[2]~output_o\;

decod_data3(3) <= \decod_data3[3]~output_o\;

decod_data3(4) <= \decod_data3[4]~output_o\;

decod_data3(5) <= \decod_data3[5]~output_o\;

decod_data3(6) <= \decod_data3[6]~output_o\;

decod_data3(7) <= \decod_data3[7]~output_o\;

decod_data4(0) <= \decod_data4[0]~output_o\;

decod_data4(1) <= \decod_data4[1]~output_o\;

decod_data4(2) <= \decod_data4[2]~output_o\;

decod_data4(3) <= \decod_data4[3]~output_o\;

decod_data4(4) <= \decod_data4[4]~output_o\;

decod_data4(5) <= \decod_data4[5]~output_o\;

decod_data4(6) <= \decod_data4[6]~output_o\;

decod_data4(7) <= \decod_data4[7]~output_o\;

decod_data5(0) <= \decod_data5[0]~output_o\;

decod_data5(1) <= \decod_data5[1]~output_o\;

decod_data5(2) <= \decod_data5[2]~output_o\;

decod_data5(3) <= \decod_data5[3]~output_o\;

decod_data5(4) <= \decod_data5[4]~output_o\;

decod_data5(5) <= \decod_data5[5]~output_o\;

decod_data5(6) <= \decod_data5[6]~output_o\;

decod_data5(7) <= \decod_data5[7]~output_o\;

decod_data6(0) <= \decod_data6[0]~output_o\;

decod_data6(1) <= \decod_data6[1]~output_o\;

decod_data6(2) <= \decod_data6[2]~output_o\;

decod_data6(3) <= \decod_data6[3]~output_o\;

decod_data6(4) <= \decod_data6[4]~output_o\;

decod_data6(5) <= \decod_data6[5]~output_o\;

decod_data6(6) <= \decod_data6[6]~output_o\;

decod_data6(7) <= \decod_data6[7]~output_o\;
END structure;


