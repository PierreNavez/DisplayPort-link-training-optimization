---------------------------------------------------------------------------------------------------
--! \brief         Manchester decoder is the entity which takes as input the signal flowing through the AUX channel (+)
--!                from Tx to Rx, and output the different part of the message via different signals. 
--!                A message from the transmitter to receiver is composed by: - a 4 bits command
--!                                                                           - a 20 bits address
--!                                                                           - an 8 bits length
--!                                                                           - length data bytes 
--!			       The useful data bytes are supposed to be in the 7 first writable addresses of the DPCD registers (100h to 106h), such that
--!                we are only going to save the 7 first data bytes of a message. This data is sent to another entity, data_handler
--!			       which will interpret it and save what is useful on a memory. 
--!
--!
--!
--!
--! \limitations 
--!
--!
--!
--!
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity manchester_decoder is 

port(
    --
    --global reset
    --
    hpd                                 : in std_logic;
	--
	--clock
	--
	clk_16                             : in  std_logic;

	--
	--aux interface
	--
	--tx_aux_in                          : in  std_logic;
	tx_aux_out                         : in std_logic;
	--tx_aux_oe                          : out std_logic;

    --
	--Decoder interface
	--
	decod_comm                         : inout std_logic_vector(3 downto 0);
	decod_address                      : inout std_logic_vector(19 downto 0);
	decod_length                       : inout std_logic_vector(7 downto 0);
	decod_data0                        : inout std_logic_vector(7 downto 0);
	decod_data1                        : inout std_logic_vector(7 downto 0);
	decod_data2                        : inout std_logic_vector(7 downto 0);
	decod_data3                        : inout std_logic_vector(7 downto 0);
	decod_data4                        : inout std_logic_vector(7 downto 0);
	decod_data5                        : inout std_logic_vector(7 downto 0);
    decod_data6                        : inout std_logic_vector(7 downto 0);

    decod_comm_ready                   : out std_logic;
	decod_address_ready                : out std_logic;
	decod_length_ready                 : out std_logic;
	decod_data0_ready                  : out std_logic;
	decod_data1_ready                  : out std_logic;
	decod_data2_ready                  : out std_logic;
	decod_data3_ready                  : out std_logic;
	decod_data4_ready                  : out std_logic;
	decod_data5_ready                  : out std_logic;
    decod_data6_ready                  : out std_logic
	);
end manchester_decoder;

architecture manchester_decoder_behavioral of manchester_decoder is 

--
--TYPE
--
type t_fsm_decod is(S_IDLE, S_START, S_MESSAGE, S_STOP);
type t_fsm_sync_stop is(S0, S1, S2, S3, S4);

--
--CONSTANT
--
constant C_SAMPLE_FIRST                : std_logic_vector(3 downto 0) := "0000";         --For all the constant values, see timing specification 
constant C_SAMPLE_LAST                 : std_logic_vector(3 downto 0) := "1000";
constant C_VALIDITY_CHECK              : std_logic_vector(3 downto 0) := "0001";
constant C_UPDATE_SYNC_STOP_STATE      : std_logic_vector(3 downto 0) := "0010";
constant C_BIT_SHIFTING                : std_logic_vector(3 downto 0) := "0100";

constant C_MAX_BIT_INDEX               : integer := 88;
constant C_MAX_INDEX_COMM              : integer := 4;
constant C_MAX_INDEX_ADDRESS           : integer := 24;
constant C_MAX_INDEX_LENGTH            : integer := 32;
constant C_MAX_INDEX_DATA0             : integer := 40;
constant C_MAX_INDEX_DATA1             : integer := 48;
constant C_MAX_INDEX_DATA2             : integer := 56;
constant C_MAX_INDEX_DATA3             : integer := 64;
constant C_MAX_INDEX_DATA4             : integer := 72;
constant C_MAX_INDEX_DATA5             : integer := 80;
constant C_MAX_INDEX_DATA6             : integer := 88;


--
--SIGNAL
--

--sampling and validity
signal aux_val_new                     : std_logic := '0';
signal aux_val_prev                    : std_logic := '0';                         
signal bit_validity                    : std_logic := '0';                               --Initialized to 0 to ensure bit_validity at the beginning
signal last_val_hpd                    : std_logic := '0';

--rising edge detector
signal transaction_begin               : std_logic := '0';                               --At the beginning of an aux channel transaction


--counter 
signal counter_val                     : std_logic_vector(3 downto 0) := "0000";

--finite state machine
signal current_state                   : t_fsm_decod := S_IDLE;
signal sync_internal_state             : t_fsm_sync_stop := S0;                          --When sync/stop pattern are being transmitted, keeps track 
signal stop_internal_state             : t_fsm_sync_stop := S0;                          --of the current state of the sync/stop pattern    
    
--signal counter_message_to_idle         : integer;                                        --When in S_MESSAGE, if no valid manchester transaction occurs, bit_index will stay at 1 and the current state would not change
                                                                                         --As the fsm evolves at the rising edges of a 16 Mhz clock and as the bits are supposed to be send at 1Mhz, as soon as the value
                                                                                         --of this counter > 16, while bit_index = 1, meaning that a problem occured, one should go to S_IDLE state
--message
signal bit_index                       : integer;


begin 
                                       
--compute_next_state assigns the next fsm state depending on the internal signal of the manchester_decoder entity
compute_next_state : process(clk_16) is
    begin
    
    if (rising_edge(clk_16)) then
        if (hpd = '0') then 
            current_state <= S_IDLE;
        else
    	    case (current_state) is
    		    when S_IDLE =>
    		        if transaction_begin = '1' then 
    		            current_state <= S_START;
    		        end if;

    		    when S_START =>
    		        if sync_internal_state = S4 then
                        current_state <= S_MESSAGE;
    		        end if;

    		    when S_MESSAGE =>
    		        if bit_validity = '0' and bit_index /= 1 then 
    		            current_state <= S_STOP;		            
    		        end if;

    		    when S_STOP =>
    		        if stop_internal_state = S4 then
    		            current_state <= S_IDLE;
    		        end if;

    		    when others =>
    			    current_state <= S_IDLE;
    	        end case;
    	end if;
    end if;
    end process; -- compute_next_state

--sync_stop_next_state assigns the state of the sync/stop pattern 
--depending on which period number we are
sync_stop_next_state : process(clk_16) is
    begin
	 if rising_edge(clk_16) then 
		 if hpd = '0' then
			  sync_internal_state <= S0;
			  stop_internal_state <= S0;
		 else
			  if counter_val = C_UPDATE_SYNC_STOP_STATE then
					if bit_validity = '0' and current_state = S_START then

						case (sync_internal_state) is

							 when S0 => sync_internal_state <= S1;
							 when S1 => sync_internal_state <= S2;
							 when S2 => sync_internal_state <= S3;
							 when S3 => sync_internal_state <= S4;
							 when others => sync_internal_state <= S0; 

						end case;

					elsif bit_validity = '0' and (current_state = S_MESSAGE or current_state = S_STOP) then
						 
						 case (stop_internal_state) is 

							 when S0 => stop_internal_state <= S1;
							 when S1 => stop_internal_state <= S2;
							 when S2 => stop_internal_state <= S3;
							 when S3 => stop_internal_state <= S4;
							 when others => stop_internal_state <= S0; 

						 end case;
                    else 
                        sync_internal_state <= S0;
                        stop_internal_state <= S0;

					end if;
			  end if;
		 end if;
	 end if; 
    end process;--sync_stop_next_state



--counter is a 4 bit counter, which is reinitialized to 0 when a new transaction begins
--it is also used to control the sequentiality between the different processes 
counter : process(clk_16) is 
    begin 

    if rising_edge(clk_16) then 
        if hpd = '0' or transaction_begin = '1' then
            counter_val <= "0000";
        else
            counter_val <= counter_val + 1;
        end if; 
    end if;

    end process; --counter

--aux_sampling is the process which sample the auxiliary chanel at specific counter value 
aux_sampling : process(clk_16) is 
    begin 

    if rising_edge(clk_16) then

        if hpd = '0' then 
            aux_val_new <= '0';
            aux_val_prev <= '0';
			transaction_begin <= '0';
        else
			if current_state = S_IDLE then
			    aux_val_new <= tx_aux_out;
                aux_val_prev <= aux_val_new;
                transaction_begin <= not aux_val_prev and aux_val_new;	
			end if;
            if counter_val = C_SAMPLE_FIRST then
                aux_val_new <= tx_aux_out;
            elsif counter_val = C_SAMPLE_LAST then
                aux_val_prev <= tx_aux_out;
            end if;
        end if; 

    end if; 

    end process; --aux_sampling


--check_validity is the process which assigns bit_validity, by inspecting the two last samples
--that have been recolted
check_validity : process(clk_16) is 
    begin 

    if rising_edge(clk_16) then 

        if current_state /= S_IDLE and counter_val = C_VALIDITY_CHECK then
            bit_validity <= aux_val_new xor aux_val_prev;
            
        end if;
				
    end if;

    end process;--check_validity


message_decryption : process(clk_16) is
begin
    if rising_edge(clk_16) then
        if hpd = '0' then 
            decod_comm                           <= (others => '0');
            decod_address                        <= (others => '0');
            decod_length                         <= (others => '0');
            decod_data0                          <= (others => '0');
            decod_data1                          <= (others => '0');
            decod_data2                          <= (others => '0');
            decod_data3                          <= (others => '0');
            decod_data4                          <= (others => '0');
            decod_data5                          <= (others => '0');
            decod_data6                          <= (others => '0');
            
			decod_comm_ready                     <= '0';
            decod_address_ready                  <= '0';
            decod_length_ready                   <= '0';
            decod_data0_ready                    <= '0';
            decod_data1_ready                    <= '0';
            decod_data2_ready                    <= '0';
            decod_data3_ready                    <= '0';
            decod_data4_ready                    <= '0';
            decod_data5_ready                    <= '0';
            decod_data6_ready                    <= '0';

            bit_index                            <= 1;
					 
	        
		  end if;
		  

          decod_comm_ready                     <= '0';
          decod_address_ready                  <= '0';
          decod_length_ready                   <= '0';
          decod_data0_ready                    <= '0';
          decod_data1_ready                    <= '0';
          decod_data2_ready                    <= '0';
          decod_data3_ready                    <= '0';
          decod_data4_ready                    <= '0';
          decod_data5_ready                    <= '0';
          decod_data6_ready                    <= '0';
          
        if current_state = S_MESSAGE and counter_val = C_BIT_SHIFTING and bit_validity = '1' then

            if bit_index >= 1 and bit_index <= C_MAX_INDEX_COMM then
				decod_comm                       <= decod_comm(2 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1; 
                if bit_index = C_MAX_INDEX_COMM then
                    decod_comm_ready                 <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_COMM and bit_index <= C_MAX_INDEX_ADDRESS then
				decod_address                    <= decod_address(18 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_ADDRESS then
                    decod_address_ready              <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_ADDRESS and bit_index <= C_MAX_INDEX_LENGTH then
				decod_length                     <= decod_length(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_LENGTH then
                    decod_length_ready               <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_LENGTH and bit_index <= C_MAX_INDEX_DATA0 then
				decod_data0                      <= decod_data0(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA0 then 
                    decod_data0_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA0 and bit_index <= C_MAX_INDEX_DATA1 then
				decod_data1                      <= decod_data1(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA1 then 
                    decod_data1_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA1 and bit_index <= C_MAX_INDEX_DATA2 then
				decod_data2                      <= decod_data2(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA2 - 1 then 
                    decod_data2_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA2 and bit_index <= C_MAX_INDEX_DATA3 then
				decod_data3                      <= decod_data3(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA3 then 
                    decod_data3_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA3 and bit_index <= C_MAX_INDEX_DATA4 then
				decod_data4                      <= decod_data4(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA4 then 
                    decod_data4_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA4 and bit_index <= C_MAX_INDEX_DATA5 then
				decod_data5                      <= decod_data5(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA5 - 1 then 
                    decod_data5_ready                <= '1';
                end if;

            elsif bit_index > C_MAX_INDEX_DATA5 and bit_index <= C_MAX_INDEX_DATA6 then
				decod_data6                      <= decod_data6(6 downto 0) & aux_val_prev;
                bit_index                        <= bit_index + 1;
                if bit_index = C_MAX_INDEX_DATA6 then 
                    decod_data6_ready                <= '1';
                end if;
            --At this point, nothing should happen until next state occurs 
            end if;
            
        elsif current_state = S_STOP and counter_val = C_BIT_SHIFTING then 
            bit_index <= 1;
        end if;
    end if;
end process;--message_decryption

end architecture manchester_decoder_behavioral;


