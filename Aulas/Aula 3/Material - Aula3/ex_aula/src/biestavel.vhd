----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  15:30:36 03/01/2016 
-- Module Name:  biestavel - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity biestavel is
	port(
		LOCAL_CLOCK : IN STD_LOGIC;
		START			: IN STD_LOGIC;
		STOP  		: IN STD_LOGIC;
		
		PROCESSING 	: OUT STD_LOGIC
	);
end biestavel;

architecture Behavioral of biestavel is

	signal PROCESSING_R2 : std_logic := '0';

begin

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(START = '1') then
				PROCESSING_R2 <= '1';
			elsif(STOP = '1') then
				PROCESSING_R2 <= '0';
			end if;
		end if;
	end process;

	PROCESSING <= PROCESSING_R2; 

end Behavioral;

