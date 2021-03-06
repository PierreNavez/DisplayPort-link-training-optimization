---------------------------------------------------------------------------------------------------
--!        \file        data_handler_tb.vhd
--!
--!
--!        \brief       This testbench should validate data_handler module. 
--!                     One should check that the 32-bit registers are written correctly when they should,
--!                     i.e, once rising edges are detected on different input signals coming from manchester_decoder.
--!                     (The timing between the rising edges of the different input signal is known as the bitrate is 1 Mbps) 
--! 
--!                     Additionaly, the output signal link_training_active should be equal to 1 when 
--!                     the register field 102h is written to. 
--!                     Whenever the input signals avm_read = '1' and the avm_address is valid, 
--!                     avm_readdata should contain the appropriate register. 
--!
--!
--!                     Case 1: A read request is sent 
--!                     Case 2: A write request is sent starting at address 100h, with length = 6 ==> Ok, both registers are correctly filled 
--!                     Case 3: A write request is sent starting at address 107h with length = 6 ==> Ok, return to idle state 
--!                     Case 4: Combination of Cases 1 then 2 then 3 => everything happens normally 
--!                     Case 5: The message begins at 105h and contains more than 2 data bytes 
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity data_handler_tb is 

end data_handler_tb;

architecture data_handler_tb_behav of data_handler_tb is

signal hpd                                                              : std_logic := '0';

signal clk_100                                                          : std_logic := '0';

signal decod_comm                                                       : std_logic_vector(3 downto 0);
signal decod_address                                                    : std_logic_vector(19 downto 0);
signal decod_length                                                     : std_logic_vector(7 downto 0);
signal decod_data0                                                      : std_logic_vector(7 downto 0);
signal decod_data1                                                      : std_logic_vector(7 downto 0);
signal decod_data2                                                      : std_logic_vector(7 downto 0);
signal decod_data3                                                      : std_logic_vector(7 downto 0);
signal decod_data4                                                      : std_logic_vector(7 downto 0);
signal decod_data5                                                      : std_logic_vector(7 downto 0);
signal decod_data6                                                      : std_logic_vector(7 downto 0);


signal decod_comm_ready                                                 : std_logic := '0';
signal decod_address_ready                                              : std_logic := '0';
signal decod_length_ready                                               : std_logic := '0';
signal decod_data0_ready                                                : std_logic := '0';
signal decod_data1_ready                                                : std_logic := '0';
signal decod_data2_ready                                                : std_logic := '0';
signal decod_data3_ready                                                : std_logic := '0';
signal decod_data4_ready                                                : std_logic := '0';
signal decod_data5_ready                                                : std_logic := '0';
signal decod_data6_ready                                                : std_logic := '0';

signal link_training_active                                             : std_logic;                             

signal avm_readdata                                                     : std_logic_vector(31 downto 0);
signal avm_read                                                         : std_logic;
signal avm_address                                                      : std_logic_vector(31 downto 0);  

begin

DUT: entity work.data_handler
    port map(
        hpd                  => hpd,
        clk_100              => clk_100,
        decod_comm           => decod_comm,
        decod_address        => decod_address,
        decod_length         => decod_length,  
        decod_data0          => decod_data0,
        decod_data1          => decod_data1,
        decod_data2          => decod_data2,
        decod_data3          => decod_data3,
        decod_data4          => decod_data4,
        decod_data5          => decod_data5,
        decod_data6          => decod_data6,
        decod_comm_ready     => decod_comm_ready,
        decod_address_ready  => decod_address_ready,
        decod_length_ready   => decod_length_ready,
        decod_data0_ready    => decod_data0_ready,
        decod_data1_ready    => decod_data1_ready,
        decod_data2_ready    => decod_data2_ready,
        decod_data3_ready    => decod_data3_ready,
        decod_data4_ready    => decod_data4_ready,
        decod_data5_ready    => decod_data5_ready,
        decod_data6_ready    => decod_data6_ready,
        link_training_active => link_training_active,
        avm_readdata         => avm_readdata,
        avm_read             => avm_read,
        avm_address          => avm_address
    );

clk_100 <= not clk_100 after 5 ns;


p_data: process
    constant C_READ_COMM                         : std_logic_vector(3 downto 0) := "1001";
    constant C_WRITE_COMM                        : std_logic_vector(3 downto 0) := "1000";
    constant C_100h                              : std_logic_vector(19 downto 0):= "00000000000100000000";
    constant C_101h                              : std_logic_vector(19 downto 0):= "00000000000100000001";
    constant C_102h                              : std_logic_vector(19 downto 0):= "00000000000100000010";
    constant C_103h                              : std_logic_vector(19 downto 0):= "00000000000100000011";
    constant C_104h                              : std_logic_vector(19 downto 0):= "00000000000100000100";
    constant C_105h                              : std_logic_vector(19 downto 0):= "00000000000100000101";
    constant C_106h                              : std_logic_vector(19 downto 0):= "00000000000100000110";

    variable case_number                         : integer := 2;

    begin

        case case_number is 
            when 1 =>
                wait for 2 us;
                hpd <= '1';
                decod_comm <= C_READ_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= x"00000";
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"00";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                wait;
            when 2 =>
                wait for 2 us;
                hpd <= '1';
                decod_comm <= C_WRITE_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= C_100h;
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"06";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                decod_data0 <= x"01";
                wait for 8 us;
                decod_data0_ready <= '1', '0' after 62.5 ns;
                decod_data1 <= x"02";
                wait for 8 us;
                decod_data1_ready <= '1', '0' after 62.5 ns;
                decod_data2 <= x"03";
                wait for 8 us;
                decod_data2_ready <= '1', '0' after 62.5 ns;
                decod_data3 <= x"04";
                wait for 8 us;
                decod_data3_ready <= '1', '0' after 62.5 ns;
                decod_data4 <= x"05";
                wait for 8 us;
                decod_data4_ready <= '1', '0' after 62.5 ns;
                decod_data5 <= x"06";
                wait for 8 us;
                decod_data5_ready <= '1', '0' after 62.5 ns;
                decod_data6 <= x"07";
                wait for 8 us;
                decod_data6_ready <= '1', '0' after 62.5 ns;
                wait for 2 us;
                hpd <= '0'; --test is the falling edge of an HPD also provoke a reset 
                wait;
            when 3 =>
                wait for 2 us;
                hpd <= '1';
                decod_comm <= C_WRITE_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= x"00107";
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"06";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                decod_data0 <= x"01";
                wait for 8 us;
                decod_data0_ready <= '1', '0' after 62.5 ns;
                decod_data1 <= x"02";
                wait for 8 us;
                decod_data1_ready <= '1', '0' after 62.5 ns;
                decod_data2 <= x"03";
                wait for 8 us;
                decod_data2_ready <= '1', '0' after 62.5 ns;
                decod_data3 <= x"04";
                wait for 8 us;
                decod_data3_ready <= '1', '0' after 62.5 ns;
                decod_data4 <= x"05";
                wait for 8 us;
                decod_data4_ready <= '1', '0' after 62.5 ns;
                decod_data5 <= x"06";
                wait for 8 us;
                decod_data5_ready <= '1', '0' after 62.5 ns;
                decod_data6 <= x"07";
                wait for 8 us;
                decod_data6_ready <= '1', '0' after 62.5 ns;
                wait for 5 us;
                hpd <= '0';
                wait;

            when 4 =>
                wait for 2 us;
                hpd <= '1';
                decod_comm <= C_READ_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= x"00000";
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"00";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;

                decod_comm <= C_WRITE_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= C_100h;
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"06";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                decod_data0 <= x"01";
                wait for 8 us;
                decod_data0_ready <= '1', '0' after 62.5 ns;
                decod_data1 <= x"02";
                wait for 8 us;
                decod_data1_ready <= '1', '0' after 62.5 ns;
                decod_data2 <= x"03";
                wait for 8 us;
                decod_data2_ready <= '1', '0' after 62.5 ns;
                decod_data3 <= x"04";
                wait for 8 us;
                decod_data3_ready <= '1', '0' after 62.5 ns;
                decod_data4 <= x"05";
                wait for 8 us;
                decod_data4_ready <= '1', '0' after 62.5 ns;
                decod_data5 <= x"06";
                wait for 8 us;
                decod_data5_ready <= '1', '0' after 62.5 ns;
                decod_data6 <= x"07";
                wait for 8 us;
                decod_data6_ready <= '1', '0' after 62.5 ns;

                decod_comm <= C_WRITE_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= x"00107";
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"06";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                decod_data0 <= x"01";
                wait for 8 us;
                decod_data0_ready <= '1', '0' after 62.5 ns;
                decod_data1 <= x"02";
                wait for 8 us;
                decod_data1_ready <= '1', '0' after 62.5 ns;
                decod_data2 <= x"03";
                wait for 8 us;
                decod_data2_ready <= '1', '0' after 62.5 ns;
                decod_data3 <= x"04";
                wait for 8 us;
                decod_data3_ready <= '1', '0' after 62.5 ns;
                decod_data4 <= x"05";
                wait for 8 us;
                decod_data4_ready <= '1', '0' after 62.5 ns;
                decod_data5 <= x"06";
                wait for 8 us;
                decod_data5_ready <= '1', '0' after 62.5 ns;
                decod_data6 <= x"07";
                wait for 8 us;
                decod_data6_ready <= '1', '0' after 62.5 ns;
                wait;

            when 5 =>
                wait for 2 us;
                hpd <= '1';
                decod_comm <= C_WRITE_COMM;
                wait for 50 ns;
                decod_comm_ready <= '1', '0' after 62.5 ns;
                decod_address <= C_105h;
                wait for 20 us;
                decod_address_ready <= '1', '0' after 62.50 ns;
                decod_length <= x"06";
                wait for 8 us;
                decod_length_ready <= '1', '0' after 62.50 ns;
                decod_data0 <= x"01";
                wait for 8 us;
                decod_data0_ready <= '1', '0' after 62.5 ns;
                decod_data1 <= x"02";
                wait for 8 us;
                decod_data1_ready <= '1', '0' after 62.5 ns;
                decod_data2 <= x"03";
                wait for 8 us;
                decod_data2_ready <= '1', '0' after 62.5 ns;
                decod_data3 <= x"04";
                wait for 8 us;
                decod_data3_ready <= '1', '0' after 62.5 ns;
                decod_data4 <= x"05";
                wait for 8 us;
                decod_data4_ready <= '1', '0' after 62.5 ns;
                decod_data5 <= x"06";
                wait for 8 us;
                decod_data5_ready <= '1', '0' after 62.5 ns;
                decod_data6 <= x"07";
                wait for 8 us;
                decod_data6_ready <= '1', '0' after 62.5 ns;
                wait;

            when others =>

            end case;   
end process;

end architecture data_handler_tb_behav;

