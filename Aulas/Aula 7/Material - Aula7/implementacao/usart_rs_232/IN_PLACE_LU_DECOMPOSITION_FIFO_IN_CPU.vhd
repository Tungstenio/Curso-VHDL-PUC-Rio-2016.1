----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    16:32:04 06/07/2014 
-- Module Name:    IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU is
	port(
		LOCAL_CLOCK          : IN  STD_LOGIC;
		
		HOST_WRITE_REQUEST   : IN  STD_LOGIC;
		FIFO_IN_FULL         : IN  STD_LOGIC;
		FIFO_IN_EMPTY        : IN  STD_LOGIC;
		
		HOST_WRITE_COMPLETED : IN  STD_LOGIC;
		
		ENABLE_PROCESSING    : OUT STD_LOGIC;
		HOST_POSITIVE_ACK    : OUT STD_LOGIC);
end IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU;

architecture Behavioral of IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU is

	type FIFOCPU_FSM is (hold, wait_ack, wait_done, wait_fifo_empty);
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
					ENABLE_PROCESSING <= '0';
					HOST_POSITIVE_ACK <= '0';
					if(HOST_WRITE_REQUEST = '1') then
						FifoState <= wait_ack;
					end if;
				
				when wait_ack =>
					if(FIFO_IN_FULL = '0') then
						HOST_POSITIVE_ACK <= '1';
						FifoState         <= wait_done;
					end if;
				
				when wait_done =>
					HOST_POSITIVE_ACK <= '0';
					if(HOST_WRITE_REQUEST = '1') then
						FifoState <= wait_ack;
					elsif(HOST_WRITE_COMPLETED = '1') then
						FifoState <= wait_fifo_empty;
					end if;
					
				when wait_fifo_empty =>
					if(FIFO_IN_EMPTY = '1') then
						ENABLE_PROCESSING <= '1';
						FifoState         <= hold;
					end if;
			
				when others => NULL;
		
			end case;
		end if;
	end process;

end Behavioral;