---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    18:32:22 09/18/2014 
-- Module Name:    DIABLO_COMM_RS_232_TX_SHIFTER - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RS_232_TX_SHIFTER is
	port(
		LOCAL_CLOCK : IN  STD_LOGIC;
		
		LOAD        : IN  STD_LOGIC;
		SHIFT_RIGHT : IN  STD_LOGIC;
		
		INPUT       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		OUTPUT      : OUT STD_LOGIC
	);
end RS_232_TX_SHIFTER;

architecture Behavioral of RS_232_TX_SHIFTER is

	signal DATA : std_logic_vector(8 downto 0) := (others => '1');

begin

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(LOAD = '1') then
				DATA <= INPUT & '0';
			elsif(SHIFT_RIGHT = '1') then
				DATA <= '1' & DATA(8 downto 1);
			end if;
		end if;
	end process;
	
	OUTPUT <= DATA(0);

end Behavioral;