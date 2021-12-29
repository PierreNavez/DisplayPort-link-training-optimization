----------------------------------------------------------------------------------------------------------------------------
--!  \brief        Data_handler is the entity which receives the decoded data from manchester_decoder and interpret it.
--!                During the link training some DCPD registers will be written to. Some of them (addresses 100h to 106h)
--!                are relevant to know how to program the redriver DP141. 
--!
--!                Two 32 bit registers are used to save the 7 useful bytes. They can be read by the CPU thanks to the 
--!                Avalon-MM interface of the module. The module is an Avalon slave with a ROM from the master point of view.
--!
--!                The module contains one process that handles the FSM, one that detects the rising edges of the signals coming from
--!                manchester_decoder, save the data from the decoder into local signals and interpret it, one that handles the Avalon-MM
--!                interface to perform the read from the CPU. 
--!
--!                The module outputs a signal which indicates wether the link training is currently being performed or not. This signal 
--!                will be useful to the CPU. 
--!
--!                The clock is the CPU clock (100MHz) in order to act as fast as possible. 
--!
--!                A IRQ is sent to the CPU everytime registers 103h to 106h are written to, meaning 
--!                that the redriver has to be programmed. To do so, one use the value registered in 100h (lane count), which will
--!                indicate wether the interrupt has to be sent after 103h, 104h or 106h is modified, depending on the number of 
--!                lanes that are used on the main link. 
--!
--!                Additionnaly, some signals are added for statistics, namely: the number of times the bandwidth is reduced (100h is modified).
--!                The number of times the lane count is reduced (101h is modified). The number of times the training pattern are changed.
--!                It would be nice to know the number of tries during the CR and CE sequences but one one should be able to interpret the "read"
--!                during the link training, what has not been implemented in data_handler module. 
----------------------------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity data_handler is

port(
    --
    --Hot plug detect from the DP cable
    --
    hpd                                                              : in std_logic;

    --
    --clock
    --
    clk_100                                                          : in std_logic;

    --
    --manchester decoder interface /!\ clk_16 domain
    --
    decod_comm                                                       : in  std_logic_vector(3 downto 0);
    decod_address                                                    : in  std_logic_vector(19 downto 0);
    decod_length                                                     : in  std_logic_vector(7 downto 0);
    decod_data0                                                      : in  std_logic_vector(7 downto 0);
    decod_data1                                                      : in  std_logic_vector(7 downto 0);
    decod_data2                                                      : in  std_logic_vector(7 downto 0);
    decod_data3                                                      : in  std_logic_vector(7 downto 0);
    decod_data4                                                      : in  std_logic_vector(7 downto 0);
    decod_data5                                                      : in  std_logic_vector(7 downto 0);
    decod_data6                                                      : in  std_logic_vector(7 downto 0);


    decod_comm_ready                                                 : in  std_logic;
    decod_address_ready                                              : in  std_logic;
    decod_length_ready                                               : in  std_logic;
    decod_data0_ready                                                : in  std_logic;
    decod_data1_ready                                                : in  std_logic;
    decod_data2_ready                                                : in  std_logic;
    decod_data3_ready                                                : in  std_logic;
    decod_data4_ready                                                : in  std_logic;
    decod_data5_ready                                                : in  std_logic;
    decod_data6_ready                                                : in  std_logic;

    --
    --data_handler_interface
    --
    irq_link_training_active                                             : out std_logic;                             --equal to one when the link training has begun, used to alert the cpu

    --
    --avalon-mm interface (ROM)
    --
    avs_waitrequest                                                  : out std_logic;
    avs_readdata                                                     : out std_logic_vector(31 downto 0);
    avs_readdatavalid                                                : out std_logic;
    avs_burstcount                                                   : in  std_logic_vector(0 downto 0);
    avs_writedata                                                    : in  std_logic_vector(31 downto 0);
    avs_address                                                      : in  std_logic_vector(9 downto 0);
    avs_write                                                        : in  std_logic;
    avs_read                                                         : in  std_logic;
    avs_byteenable                                                   : in  std_logic_vector(3 downto 0);
    avs_debugaccess                                                  : in  std_logic;

    --
    --interrupt request to the cpu
    --
    irq_redriver_program                                             : out std_logic

);

end data_handler;

architecture data_handler_behavioral of data_handler is 

--
--type
--
type t_fsm is (S_IDLE, S_COMM, S_ADDRESS, S_LENGTH, S_DATA0, S_DATA1, S_DATA2, S_DATA3, S_DATA4, S_DATA5, S_DATA6);--the state we are in means that the data associated to the state name have already been transmitted (ex: S_DATA0 means that data0 byte has been transmitted)

--
--constants
--
constant C_MAX_ADDRESS                                               : unsigned(19 downto 0) := x"00106";
--
--signal
--

--fsm
signal current_state                                                 : t_fsm := S_IDLE;

--edge detector
signal last_val                                                      : std_logic := '0';                          --contains the last value being sampled on the signal which we want to detect a rising edge
signal last_val_hpd                                                  : std_logic := '0';                          --used for the rising/falling edge detection
signal edge_detected                                                 : std_logic := '0';                          --assigned to one when a rising edge is detected 

--
--memory registers
--
signal reg_32_0                                                      : std_logic_vector(31 downto 0) := (others => '0'); 
signal reg_32_1                                                      : std_logic_vector(31 downto 0) := (others => '0');
signal reg_32_2                                                      : std_logic_vector(31 downto 0) := (others => '0');
signal reg_32_3                                                      : std_logic_vector(31 downto 0) := (others => '0');

--
--clk_100 domain signals 
--
signal comm                                                          : std_logic_vector(3 downto 0);
signal address                                                       : std_logic_vector(19 downto 0);
signal length                                                        : std_logic_vector(7 downto 0);
signal data0                                                         : std_logic_vector(7 downto 0);
signal data1                                                         : std_logic_vector(7 downto 0);
signal data2                                                         : std_logic_vector(7 downto 0);
signal data3                                                         : std_logic_vector(7 downto 0);
signal data4                                                         : std_logic_vector(7 downto 0);
signal data5                                                         : std_logic_vector(7 downto 0);
signal data6                                                         : std_logic_vector(7 downto 0);

signal comm_ready                                                    : std_logic;
signal address_ready                                                 : std_logic; 
signal length_ready                                                  : std_logic;
signal data0_ready                                                   : std_logic;
signal data1_ready                                                   : std_logic; 
signal data2_ready                                                   : std_logic; 
signal data3_ready                                                   : std_logic; 
signal data4_ready                                                   : std_logic; 
signal data5_ready                                                   : std_logic; 
signal data6_ready                                                   : std_logic;


--local signals
signal local_address                                                 : unsigned(19 downto 0); 
signal local_length                                                  : unsigned(7 downto 0);
signal local_data                                                    : std_logic_vector(7 downto 0);
signal useful_bytes                                                  : integer := 1;
signal write_reg                                                     : std_logic := '0';
signal write_reg_stat                                                : std_logic := '0';
signal useful_bytes_set                                              : std_logic := '0';
signal reset                                                         : std_logic := '0';
signal reg_address                                                   : std_logic_vector(9 downto 0) := (others => '0');
signal read_d1                                                       : std_logic := '0';
signal hot_plug_detect                                               : std_logic;                                               --hpd reclocked


--These signals are used for statistics
--These represent the number of times a value has been set 
signal link_bw_set                                                   : std_logic_vector(7 downto 0) := (others => '0');         --maximum 3
signal lane_count_set                                                : std_logic_vector(7 downto 0) := (others => '0');         --maximum 3
signal clock_recovery                                                : std_logic_vector(7 downto 0) := (others => '0');         --maximum 3
signal channel_equalization                                          : std_logic_vector(7 downto 0) := (others => '0');         --maximum 3
signal lane_0_set                                                    : std_logic_vector(7 downto 0) := (others => '0');         --max ~30 (5 loops for each bitrate for CR and CE)
signal lane_1_set                                                    : std_logic_vector(7 downto 0) := (others => '0');
signal lane_2_set                                                    : std_logic_vector(7 downto 0) := (others => '0');
signal lane_3_set                                                    : std_logic_vector(7 downto 0) := (others => '0');

begin

--reclock_100 is used to reclock the input signals coming from the manchester_decoder module (clock domain : 16Mhz) to this module domain
reclock_100: process(clk_100) is
    begin
        if rising_edge(clk_100) then
            comm                                                     <= decod_comm;
            address                                                  <= decod_address;
            length                                                   <= decod_length;
            data0                                                    <= decod_data0; 
            data1                                                    <= decod_data1;
            data2                                                    <= decod_data2;
            data3                                                    <= decod_data3;
            data4                                                    <= decod_data4;
            data5                                                    <= decod_data5;
            data6                                                    <= decod_data6;
            
            comm_ready                                               <= decod_comm_ready; 
            address_ready                                            <= decod_address_ready;
            length_ready                                             <= decod_length_ready;
            data0_ready                                              <= decod_data0_ready;
            data1_ready                                              <= decod_data1_ready;
            data2_ready                                              <= decod_data2_ready;
            data3_ready                                              <= decod_data3_ready;
            data4_ready                                              <= decod_data4_ready;
            data5_ready                                              <= decod_data5_ready;
            data6_ready                                              <= decod_data6_ready;

            hot_plug_detect                                          <= hpd;
        end if;
    end process;--reclock_100

--module_reset handles the reset of the system by monitoring HPD signal. (Low to High ==> Plug event, High to Low ==> IRQ_HPD or Link_Retraining) 
module_reset: process(clk_100) is 
    begin
        if rising_edge(clk_100) then
        last_val_hpd         <= hot_plug_detect;
        reset                <= ((not last_val_hpd and hot_plug_detect) or (last_val_hpd and not hot_plug_detect));
        end if;
    end process;--module_reset

--rising_edge_detector monitors the appropriate input signal (depending on the current state) and asserts edge_detected when a rising edge occurs
rising_edge_detector: process(clk_100) is 
    begin
        if rising_edge(clk_100) then

            if reset = '1' then 
                last_val      <= '0';
                edge_detected <= '0';
            else
                case current_state is
                    when S_IDLE => 
                        last_val <= comm_ready;
                        edge_detected <= not last_val and comm_ready;
                    when S_COMM => 
                        last_val <= address_ready;
                        edge_detected <= not last_val and address_ready;
                    when S_ADDRESS => 
                        last_val <= length_ready;
                        edge_detected <= not last_val and length_ready;
                    when S_LENGTH => 
                        last_val <= data0_ready;
                        edge_detected <= not last_val and data0_ready;
                    when S_DATA0 => 
                        last_val <= data1_ready;
                        edge_detected <= not last_val and data1_ready;
                    when S_DATA1 =>
                        last_val <= data2_ready; 
                        edge_detected <= not last_val and data2_ready;
                    when S_DATA2 =>
                        last_val <= data3_ready;
                        edge_detected <= not last_val and data3_ready;
                    when S_DATA3 => 
                        last_val <= data4_ready;
                        edge_detected <= not last_val and data4_ready;
                    when S_DATA4 => 
                        last_val <= data5_ready;
                        edge_detected <= not last_val and data5_ready;
                    when S_DATA5 => 
                        last_val <= data6_ready; 
                        edge_detected <= not last_val and data6_ready;
		            when others =>						
                end case;
            end if;
        end if;
    end process;

--compute_next_state handles the finite state machine of the module. The current state name means that the corresponding chunk of data has already been processed
--ex: S_COMM means that decod_comm has been interpreted as a read command, S_ADDRESS means that the address is an interesting one and that we go further in the interpretation 
--otherwise the fsm returns to idle state
compute_next_state: process(clk_100) is 
    begin
        if rising_edge(clk_100) then 
            if reset = '1' then 
                current_state <= S_IDLE;
                write_reg <= '0';
                useful_bytes_set <= '0';
            else
                write_reg <= '0';
                case current_state is 

                    when S_IDLE => 
                        if (edge_detected = '1' and comm = "1000" and comm_ready = '1') then --comm_ready is supposed to be high during one clock cycle in manchester_decoder.vhd as this modules runs at 100 Mhz, it is ok to have this condition                                    
                            current_state <= S_COMM;
                        end if;

                    when S_COMM =>                                                                               
                        if edge_detected = '1' and address_ready = '1' then                                                              
                            if address >= x"00100" and address <= x"00106" then 
                                local_address <= unsigned(address); 
                                current_state <= S_ADDRESS;
                            else
                                current_state <= S_IDLE; 
                            end if;
                        end if;

                    when S_ADDRESS =>    
                        if edge_detected = '1' and length_ready = '1' then
                            local_length <= unsigned(length) + 1;
                            current_state <= S_LENGTH;
                        end if;

                    when S_LENGTH =>
                        if useful_bytes_set = '0' then --one only need to compute the number of useful byte being transmitted once 
                            if (C_MAX_ADDRESS - local_address + 1) >= local_length then
                               useful_bytes <= to_integer(local_length);
                            else 
                               useful_bytes <= to_integer(C_MAX_ADDRESS) - to_integer(local_address) + 1;
                            end if;
                            useful_bytes_set <= '1';
                        end if;
                        if edge_detected = '1' and data0_ready ='1' then
                            local_data <= data0;
                            local_address <= local_address;
                            write_reg <= '1';
                            useful_bytes <= useful_bytes - 1;
                            current_state <= S_DATA0;
                            useful_bytes_set <= '0';
                        end if;

                    when S_DATA0 =>
                        if useful_bytes > 0 then
                            write_reg <= '0';
                            if edge_detected = '1' then
                                local_data <= data1;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                useful_bytes <= useful_bytes - 1;
                                current_state <= S_DATA1;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;

                    when S_DATA1 =>
                        if useful_bytes > 0 then
                            if edge_detected = '1' then
                                local_data <= data2;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                useful_bytes <= useful_bytes - 1;
                                current_state <= S_DATA2;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;

                    when S_DATA2 =>
                        if useful_bytes > 0 then
                            if edge_detected = '1' then
                                local_data <= data3;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                useful_bytes <= useful_bytes - 1;
                                current_state <= S_DATA3;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;

                    when S_DATA3 =>
                        if useful_bytes > 0 then
                            if edge_detected = '1' then
                                local_data <= data4;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                useful_bytes <= useful_bytes - 1;
                                current_state <= S_DATA4;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;
                    
                    when S_DATA4 =>
                        if useful_bytes > 0 then
                            if edge_detected = '1' then
                                local_data <= data5;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                useful_bytes <= useful_bytes - 1;
                                current_state <= S_DATA5;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;

                    when S_DATA5 =>
                        if useful_bytes > 0 then
                            if edge_detected = '1' then
                                local_data <= data6;
                                local_address <= local_address + 1;
                                write_reg <= '1';
                                current_state <= S_DATA6;
                            end if;
                        else --it means that there is no useful data byte left 
                            current_state <= S_IDLE;
                        end if;

                    when S_DATA6 => --dummy state
                       current_state <= S_IDLE;

                end case;

            end if;
        end if;
    end process;


--data_write: saves the data transmitted from the manchester_decoder into the appropriate register and compute additionnal values used for statistics
--
--           (31 downto 24) | (23 downto 16) | (15 downto 8) | (7 downto 0)
--       ----------------------------------------------------------------------
--reg_3:|    lane_3_set     |   lane_2_set   | lane_1_set    |  lane_0_set     |    avs_address= 0x0C
--       ----------------------------------------------------------------------     
--reg_2:|channel_equalizati |clock_recovery  | lane_count_set|   link_bw_set   |    avs_address= 0x08
--       ----------------------------------------------------------------------
--reg_1:|     unused        |    106h        |    105h       |     104h        |    avs_address= 0x04
--       ----------------------------------------------------------------------
--reg_0:|      103h         |    102h        |    101h       |     100h        |    avs_address= 0x00
--       ----------------------------------------------------------------------


--                                                                           (101h)
--data_write is also responsible for generating an irq whenever:         - lane_count = 1 and 103h is modified
--                                                                       - lane_count = 2 and 104h is modified
--                                                                       - lane_count = 4 and 105h is modified
data_write: process(clk_100) is 
    begin
        if (rising_edge(clk_100)) then
            if reset = '1' then
                irq_link_training_active <= '0';
                reg_32_0 <= (others => '0');
                reg_32_1 <= (others => '0');
                irq_redriver_program <= '0';
                write_reg_stat <= '0';
                link_bw_set <= (others => '0');
                lane_count_set <= (others => '0');
                clock_recovery <= (others => '0');
                channel_equalization <= (others => '0'); 
                lane_0_set <= (others => '0'); 
                lane_1_set <= (others => '0'); 
                lane_2_set <= (others => '0'); 
                lane_3_set <= (others => '0'); 
            else 
                irq_redriver_program <= '0';
                write_reg_stat <= '0';

                if (reg_32_0(17 downto 16) = "00") then
                    irq_link_training_active <= '0';
                else
                    irq_link_training_active <= '1';
                end if;

                if write_reg = '1' then

                    case local_address is

                        when x"00100" => reg_32_0(7 downto 0)          <= local_data;
                            link_bw_set <= std_logic_vector(unsigned(link_bw_set) + 1);
                            write_reg_stat <= '1';

                        when x"00101" => reg_32_0(15 downto 8)         <= local_data;
                            lane_count_set <= std_logic_vector(unsigned(lane_count_set) + 1);
                            write_reg_stat <= '1';

                        when x"00102" => reg_32_0(23 downto 16)        <= local_data;
                            if local_data(1 downto 0) /= "00" then --we are not disabling link training

                                if local_data(1 downto 0) = "01" then
                                    clock_recovery <= std_logic_vector(unsigned(clock_recovery) + 1);
                                    write_reg_stat <= '1';
                                elsif local_data(1 downto 0) = "11" or local_data(1 downto 0) = "11" then
                                    channel_equalization <= std_logic_vector(unsigned(channel_equalization) + 1);
                                    write_reg_stat <= '1';
                                end if;

                            end if;

                        when x"00103" => reg_32_0(31 downto 24)        <= local_data;
                            lane_0_set <= std_logic_vector(unsigned(lane_0_set) + 1);
                            write_reg_stat <= '1';
                            if reg_32_0(3 downto 0) = "001" then --lane_count_set (100h) = 1
                               irq_redriver_program <= '1';
                            end if;
                            
                        when x"00104" => reg_32_1(7 downto 0)          <= local_data;
                            lane_1_set <= std_logic_vector(unsigned(lane_1_set) + 1);
                            write_reg_stat <= '1';
                            if reg_32_0(3 downto 0) = "010" then --lane_count_set (100h) = 1
                               irq_redriver_program <= '1';
                            end if;

                        when x"00105" => reg_32_1(15 downto 8)         <= local_data;
                            lane_2_set <= std_logic_vector(unsigned(lane_2_set) + 1);
                            write_reg_stat <= '1';

                        when x"00106" => reg_32_1(23 downto 16)        <= local_data;
                            lane_3_set <= std_logic_vector(unsigned(lane_3_set) + 1);
                            write_reg_stat <= '1';
                            if reg_32_0(3 downto 0) = "100" then --lane_count_set (100h) = 4
                               irq_redriver_program <= '1';
                            end if;

                        when others =>
                    end case;
                end if;
            end if;
	      end if;			  
    end process;

--data_write_stat: write into the register used for statistics
data_write_stat: process(clk_100) is 
    begin
        if rising_edge(clk_100) then
		      if reset = '1' then 
                reg_32_2 <= (others => '0');
                reg_32_3 <= (others => '0');
            elsif write_reg_stat = '1' then
                reg_32_2(7 downto 0)   <= link_bw_set;
                reg_32_2(15 downto 8)  <= lane_count_set;
                reg_32_2(23 downto 16) <= clock_recovery;
                reg_32_2(31 downto 24) <= channel_equalization;
                reg_32_3(7 downto 0)   <= lane_0_set;
                reg_32_3(15 downto 8)  <= lane_1_set;
                reg_32_3(23 downto 16) <= lane_2_set;
                reg_32_3(31 downto 24) <= lane_3_set;
            end if;
        end if;
    end process;


--////////////////AVALON-MM INTERFACE/////////////////////

avs_waitrequest <= '0'; --always ready

data_avalon_readdatavalid: process(clk_100) is
    begin
        if rising_edge(clk_100) then
            read_d1 <= avs_read;
            avs_readdatavalid <= read_d1;
        end if;
    end process;

data_avalon_adress: process(clk_100) is 
    begin 
        if rising_edge(clk_100) then
            reg_address <= avs_address;
        end if;
    end process;

data_avalon_readdata: process(clk_100) is 
    begin
        if rising_edge(clk_100) then
            case reg_address(3 downto 0) is
                when x"0" => avs_readdata <= reg_32_0;
                when x"4" => avs_readdata <= reg_32_1;
                when x"8" => avs_readdata <= reg_32_2;
                when x"C" => avs_readdata <= reg_32_3;
                when others => avs_readdata <= x"00000000";
            end case;
        end if;
    end process;

end architecture data_handler_behavioral;

