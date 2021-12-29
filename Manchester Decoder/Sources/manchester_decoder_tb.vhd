---------------------------------------------------------------------------------------------------
--!      \file manchester_decoder_tb.vhd
--!
--!
--!      \Test bench specification
--!      This test bench should validate the manchester decoder entity. In particular, an incoming bitstream
--!      in Manchester format should be perfectly decoded and the content of the bitstream (i.e command, address,
--!      length, data0...data6) should be shifted in the appropriate registers. The capacity of the decoder is 88 bits.
--!      In addition, the FSM dynamics should correspond to the expected values depending on the part of the message 
--!      being transmitted.
--!
--!
--!
--!      *Case 1: An incoming bitstream longer than 88 bits 
--!      *Case 2: An incoming bitstream smaller than 88 bits
--!      *Case 3: An incomplete message is send on the channel
--!      *Case 4: The time betweeen two messages is aleatory and not 100 ns
--!    
--!
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.string_utils_pkg.all;

entity manchester_decoder_tb is 

end manchester_decoder_tb;



architecture manchester_decoder_tb_behav of manchester_decoder_tb is 
signal hpd                             : std_logic := '0';
signal clk                             : std_logic := '0';
signal tx_aux_out                      : std_logic := '0';
signal decod_comm                      : std_logic_vector(3 downto 0);
signal decod_address                   : std_logic_vector(19 downto 0);
signal decod_length                    : std_logic_vector(7 downto 0);
signal decod_data0                     : std_logic_vector(7 downto 0);
signal decod_data1                     : std_logic_vector(7 downto 0);
signal decod_data2                     : std_logic_vector(7 downto 0);
signal decod_data3                     : std_logic_vector(7 downto 0);
signal decod_data4                     : std_logic_vector(7 downto 0);
signal decod_data5                     : std_logic_vector(7 downto 0);
signal decod_data6                     : std_logic_vector(7 downto 0);

signal decod_comm_ready                : std_logic;
signal decod_address_ready             : std_logic;
signal decod_length_ready              : std_logic;
signal decod_data0_ready               : std_logic;
signal decod_data1_ready               : std_logic;
signal decod_data2_ready               : std_logic;
signal decod_data3_ready               : std_logic;
signal decod_data4_ready               : std_logic;
signal decod_data5_ready               : std_logic;
signal decod_data6_ready               : std_logic;
signal reset                           : std_logic;

file input_message                     : text;
file output_message                    : text;

begin

DUT : entity work.manchester_decoder
   port map(
    hpd                            => hpd, 
	clk_16                         => clk,
	tx_aux_out                     => tx_aux_out,
	decod_comm                     => decod_comm,
	decod_address                  => decod_address, 
	decod_length                   => decod_length,
	decod_data0                    => decod_data0,
	decod_data1                    => decod_data1, 
	decod_data2                    => decod_data2, 
	decod_data3                    => decod_data3,
	decod_data4                    => decod_data4, 
	decod_data5                    => decod_data5, 
	decod_data6                    => decod_data6, 
	decod_comm_ready               => decod_comm_ready,
	decod_address_ready            => decod_address_ready, 
	decod_length_ready             => decod_length_ready, 
	decod_data0_ready              => decod_data0_ready, 
	decod_data1_ready              => decod_data1_ready, 
	decod_data2_ready              => decod_data2_ready,
	decod_data3_ready              => decod_data3_ready, 
	decod_data4_ready              => decod_data4_ready, 
	decod_data5_ready              => decod_data5_ready, 
	decod_data6_ready              => decod_data6_ready
	);
		
clk <= not clk after 31.25 ns;
hpd <= '0', '1' after 1000 ns;

p_message: process

variable comm                            : std_logic_vector(3 downto 0);
variable address                         : std_logic_vector(19 downto 0);
variable len                             : std_logic_vector(7 downto 0);
variable data0                           : std_logic_vector(7 downto 0);
variable data1                           : std_logic_vector(7 downto 0);
variable data2                           : std_logic_vector(7 downto 0);
variable data3                           : std_logic_vector(7 downto 0);
variable data4                           : std_logic_vector(7 downto 0);
variable data5                           : std_logic_vector(7 downto 0);
variable data6                           : std_logic_vector(7 downto 0);
variable data7                           : std_logic_vector(7 downto 0);
variable data8                           : std_logic_vector(7 downto 0);
variable data9                           : std_logic_vector(7 downto 0);
variable data10                          : std_logic_vector(7 downto 0);
variable data11                          : std_logic_vector(7 downto 0);
variable data12                          : std_logic_vector(7 downto 0);
variable data13                          : std_logic_vector(7 downto 0);
variable data14                          : std_logic_vector(7 downto 0);
variable data15                          : std_logic_vector(7 downto 0);
variable semicolon                       : character;
variable line_in_message                 : line;
variable line_out_message                : line;

procedure create_zero(signal clk : in std_logic; signal aux_channel : out std_logic) is

begin
   aux_channel <= '0';
   wait for 500 ns;
   aux_channel <= '1';
   wait for 500 ns;
end procedure create_zero;


procedure create_one(signal clk : in std_logic; signal aux_channel : out std_logic) is

begin
aux_channel <= '1';
wait for 500 ns;
aux_channel <= '0';
wait for 500 ns;

end procedure create_one;



procedure create_sync_stop_pattern(signal clk : in std_logic; signal aux_channel : out std_logic) is

begin
aux_channel <= '1';
wait for 2000 ns;
aux_channel <= '0';
wait for 2000 ns;

end procedure create_sync_stop_pattern;


procedure create_start(signal clk : in std_logic; signal aux_channel : out std_logic) is 

begin
for i in 1 to 32 loop
    create_zero(clk, aux_channel);
end loop;
create_sync_stop_pattern(clk,aux_channel);

end procedure create_start;


procedure create_message(signal clk : in std_logic; signal aux_channel : out std_logic) is 
begin

create_start(clk, aux_channel);
for i in 1 to 75 loop 
create_one(clk, aux_channel);
end loop;
create_sync_stop_pattern(clk,aux_channel);
end procedure create_message;


begin
    file_open(input_message, "C:\Users\Utilisateur\Desktop\MASTER\Stage\Manchester Decoder\simulation\tb_results\input_message.csv",  read_mode);
	file_open(output_message, "C:\Users\Utilisateur\Desktop\MASTER\Stage\Manchester Decoder\simulation\tb_results\output_message.csv", write_mode);

	wait until hpd = '1';
	wait until clk'event and clk = '1';

	--Knowing the format of the cvs file to read, the reading of the file is hardcoded
	--The first four lines are some read command with only COMM ADRESS and LEN
	for i in 1 to 8 loop
		readline(input_message,line_in_message);
		read(line_in_message,comm);
		read(line_in_message, semicolon);
		read(line_in_message, address);
		read(line_in_message, semicolon);
		read(line_in_message, len);
		create_start(clk,tx_aux_out);
		for j in 3 downto 0 loop
			if comm(j) = '1' then 
			   create_one(clk, tx_aux_out);
			else 
			   create_zero(clk,tx_aux_out);
			end if;
		end loop;
		for j in 19 downto 0 loop
			if address(j) = '1' then 
			   create_one(clk, tx_aux_out);
			else 
			   create_zero(clk,tx_aux_out);
			end if;
		end loop;
		for j in 7 downto 0 loop
			if len(j) = '1' then 
			   create_one(clk, tx_aux_out);
			else 
			   create_zero(clk,tx_aux_out);
			end if;
		end loop;
		create_sync_stop_pattern(clk, tx_aux_out);
		write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"));
		writeline(output_message, line_out_message);
		wait for 1000 ns;
	end loop;

	--For the eight next lines, the number of data bytes being transmitted is variable from 1 to 16
    
	--data0
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
	   & tostring(decod_data0) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

	--data0 to data2
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
	   & tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

    --data0 to data4
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

    --data0 to data6
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	read(line_in_message, semicolon);
	read(line_in_message, data5);
	read(line_in_message, semicolon);
	read(line_in_message, data6);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data5(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data6(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"& tostring(decod_data5) &";"& tostring(decod_data6) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

	--data0 to data8
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	read(line_in_message, semicolon);
	read(line_in_message, data5);
	read(line_in_message, semicolon);
	read(line_in_message, data6);
	read(line_in_message, semicolon);
	read(line_in_message, data7);
	read(line_in_message, semicolon);
	read(line_in_message, data8);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data5(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data6(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data7(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data8(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"& tostring(decod_data5) &";"& tostring(decod_data6) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

	--data0 to data9
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	read(line_in_message, semicolon);
	read(line_in_message, data5);
	read(line_in_message, semicolon);
	read(line_in_message, data6);
	read(line_in_message, semicolon);
	read(line_in_message, data7);
	read(line_in_message, semicolon);
	read(line_in_message, data8);
	read(line_in_message, semicolon);
	read(line_in_message, data9);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data5(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data6(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data7(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data8(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data9(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"& tostring(decod_data5) &";"& tostring(decod_data6) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;


	--data0 to data10
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	read(line_in_message, semicolon);
	read(line_in_message, data5);
	read(line_in_message, semicolon);
	read(line_in_message, data6);
	read(line_in_message, semicolon);
	read(line_in_message, data7);
	read(line_in_message, semicolon);
	read(line_in_message, data8);
	read(line_in_message, semicolon);
	read(line_in_message, data9);
	read(line_in_message, semicolon);
	read(line_in_message, data10);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data5(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data6(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data7(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data8(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data9(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data10(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"& tostring(decod_data5) &";"& tostring(decod_data6) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;



	--data0 to data15
	readline(input_message,line_in_message);
	read(line_in_message,comm);
	read(line_in_message, semicolon);
	read(line_in_message, address);
	read(line_in_message, semicolon);
	read(line_in_message, len);
	read(line_in_message, semicolon);
	read(line_in_message, data0);
	read(line_in_message, semicolon);
	read(line_in_message, data1);
	read(line_in_message, semicolon);
	read(line_in_message, data2);
	read(line_in_message, semicolon);
	read(line_in_message, data3);
	read(line_in_message, semicolon);
	read(line_in_message, data4);
	read(line_in_message, semicolon);
	read(line_in_message, data5);
	read(line_in_message, semicolon);
	read(line_in_message, data6);
	read(line_in_message, semicolon);
	read(line_in_message, data7);
	read(line_in_message, semicolon);
	read(line_in_message, data8);
	read(line_in_message, semicolon);
	read(line_in_message, data9);
	read(line_in_message, semicolon);
	read(line_in_message, data10);
	read(line_in_message, semicolon);
	read(line_in_message, data11);
	read(line_in_message, semicolon);
	read(line_in_message, data12);
	read(line_in_message, semicolon);
	read(line_in_message, data13);
	read(line_in_message, semicolon);
	read(line_in_message, data15);
	read(line_in_message, semicolon);
	read(line_in_message, data15);
	create_start(clk,tx_aux_out);
	for j in 3 downto 0 loop
		if comm(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 19 downto 0 loop
		if address(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if len(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data0(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data1(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data2(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data3(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data4(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data5(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data6(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data7(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data8(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data9(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data10(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data11(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data12(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data13(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data14(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	for j in 7 downto 0 loop
		if data15(j) = '1' then 
			create_one(clk, tx_aux_out);
		else 
			create_zero(clk,tx_aux_out);
		end if;
	end loop;
	create_sync_stop_pattern(clk, tx_aux_out);
	write(line_out_message, string'(tostring(decod_comm) & ";" & tostring(decod_address) & ";" & tostring(decod_length) & ";"
		& tostring(decod_data0) &";"& tostring(decod_data1) &";"& tostring(decod_data2) &";"& tostring(decod_data3) &";"
		& tostring(decod_data4) &";"& tostring(decod_data5) &";"& tostring(decod_data6) &";"));
	writeline(output_message, line_out_message);
	wait for 1000 ns;

	file_close(output_message);
	file_close(input_message);
	wait;
end process;

end architecture manchester_decoder_tb_behav;
