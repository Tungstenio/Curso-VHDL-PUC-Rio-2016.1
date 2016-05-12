----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    17:53:39 03/03/2015 
-- Module Name:    USART_FIFO_OUT_CPU - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity USART_FIFO_OUT_CPU is
	port(
		LOCAL_CLOCK            : IN  STD_LOGIC;
		
		FIFO_OUT_FULL          : IN  STD_LOGIC;
		HOST_CONFIRM           : IN  STD_LOGIC;
		
		FIFO_OUT_WRITE_REQUEST : OUT STD_LOGIC;
		HOST_POSITIVE_READ_ACK : IN  STD_LOGIC
	);
end USART_FIFO_OUT_CPU;

architecture Behavioral of USART_FIFO_OUT_CPU is

	type LOAD_FSM is (hold,
							wait_host,
							unloading
							);
	signal UnloadState : LOAD_FSM := hold;

begin
	
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case UnloadState is
			
				when hold =>
					FIFO_OUT_WRITE_REQUEST <= '0';
					if(FIFO_OUT_FULL = '1') then
						FIFO_OUT_WRITE_REQUEST <= '1';
						UnloadState            <= wait_host;
					end if;
					
				when wait_host =>
					if(HOST_POSITIVE_READ_ACK = '1') then
						FIFO_OUT_WRITE_REQUEST <= '0';
						UnloadState            <= unloading;
					end if;
					
				when unloading =>
					if(HOST_CONFIRM = '1') then
						UnloadState <= hold;
					end if;
			
				when others => NULL;
				
			end case;
		end if;
	end process;

end Behavioral;

