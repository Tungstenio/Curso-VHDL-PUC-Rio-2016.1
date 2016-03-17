---------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:    11:50:00 03/04/2016 
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rx_rs232_fsm is
	generic(
      MSG_SIZE         : integer := 8 -- 1 byte
   );
   port(
      LOCAL_CLOCK      : in  std_logic;
      
      BAUD_RATE        : in  std_logic_vector(13 downto 0);
		RECEIVED_BIT	  : in  std_logic;
		
		DEBUG_COUNTER    : out std_logic_vector(3 downto 0);

      OUTPUT_MESSAGE   : out std_logic_vector(7 downto 0);
      RX_DONE          : out std_logic
   );
end rx_rs232_fsm;

architecture Behavioral of rx_rs232_fsm is

	signal RECEIVED_BIT_FLAG 	: std_logic := '1';
	signal STOP_SHIFT_FLAG	 	: std_logic := '0';
	signal COUNTER					: std_logic_vector(3 downto 0)  := (others => '0');
	signal BAUD_COUNTER			: std_logic_vector(3 downto 0)  := (others => '0');
	signal OUTPUT_BUF				: std_logic_vector(7 downto 0)  := (others => '0');
	
	signal BAUD_RATE_R1			: std_logic_vector(13 downto 0) := (others => '0');
	

	type FSM is (hold, step2, step3);
	signal state : FSM := hold;
	
begin

	RECEIVED_BIT_FLAG <= RECEIVED_BIT;

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case state is
			
				when hold =>
					COUNTER <= "0000";
					RX_DONE <= '0';
					BAUD_COUNTER <= (others => '0');
					if(RECEIVED_BIT_FLAG = '0') then
						COUNTER <= "0001";
						state <= step2;
					end if;

				when step2 =>
					COUNTER <= COUNTER + '1';
					if(COUNTER = BAUD_RATE_R1) then
						COUNTER <= "0000";
						state   <= step3;
					end if;
				
				when step3 =>
					COUNTER <= COUNTER + '1';
					if(COUNTER = BAUD_RATE) then
						COUNTER 			<= (others => '0');
						BAUD_COUNTER 	<= BAUD_COUNTER + '1';
						if(STOP_SHIFT_FLAG = '0') then
							OUTPUT_BUF <= RECEIVED_BIT_FLAG & OUTPUT_BUF(7 downto 1);
						elsif(BAUD_COUNTER = "1010") then
							RX_DONE 	<= '1';
							state 	<= hold;
						end if;
					end if;
				
				when others =>
					state <= hold;
				
			end case;
		end if;
	end process;
	
	BAUD_RATE_R1 		<= '0' & BAUD_RATE(13 downto 1);
	STOP_SHIFT_FLAG	<= '0' when BAUD_COUNTER < "1001" else '1';
	OUTPUT_MESSAGE		<= OUTPUT_BUF;
	
	DEBUG_COUNTER     <= COUNTER;

end Behavioral;