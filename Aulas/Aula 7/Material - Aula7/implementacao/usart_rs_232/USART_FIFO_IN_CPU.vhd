----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    11:26:16 02/25/2015 
-- Module Name:    USART_FIFO_IN_CPU - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity USART_FIFO_IN_CPU is
	port(
		LOCAL_CLOCK          : IN  STD_LOGIC;
		
		HOST_WRITE_REQUEST   : IN  STD_LOGIC;
		HOST_POSITIVE_ACK    : OUT STD_LOGIC;
		
		FIFO_IN_FULL         : IN  STD_LOGIC;
		HOST_WRITE_COMPLETED : IN  STD_LOGIC
	);
end USART_FIFO_IN_CPU;

architecture Behavioral of USART_FIFO_IN_CPU is

	type FIFOCPU_FSM is (hold,
								wait_ack,
								wait_done
							   );
	signal FifoState : FIFOCPU_FSM := hold;

begin

	-- Here, we assume that the information regarding the FIFO_IN depth is known by the host.
	-- This way, a new pipe burst request is sent everytime the fifo is completely written.
	
	-- Besides, we assume that HOST_WRITE_REQUEST, instead of a trigger, is a pulse that stays
	-- held high until HOST_POSITIVE_ACK is set. This is of responsibility of the host.

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case FifoState is
			
				when hold =>
					HOST_POSITIVE_ACK <= '0';
					if(HOST_WRITE_REQUEST = '1') then
						FifoState <= wait_ack;
					end if;
				
				when wait_ack =>
					if(FIFO_IN_FULL = '0') then
						HOST_POSITIVE_ACK <= '1';
						FifoState         <= wait_done;
					end if;
--					HOST_POSITIVE_ACK <= '1';
--					FifoState         <= wait_done;
				
				when wait_done =>
					HOST_POSITIVE_ACK <= '0';
					if(HOST_WRITE_REQUEST = '1') then
						FifoState <= wait_ack;
					elsif(HOST_WRITE_COMPLETED = '1') then
						FifoState <= hold;
					end if;
			
				when others => NULL;
		
			end case;
		end if;
	end process;

end Behavioral;