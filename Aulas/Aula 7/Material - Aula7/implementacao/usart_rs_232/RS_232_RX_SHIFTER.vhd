---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    20:18:05 01/29/2015 
-- Module Name:    RX_SHIFTER - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RS_232_RX_SHIFTER is
	port(
		LOCAL_CLOCK : IN  STD_LOGIC;
		
		RX_IN       : IN  STD_LOGIC;
		SHIFT_LEFT  : IN  STD_LOGIC;
		
		OUTPUT      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end RS_232_RX_SHIFTER;

architecture Behavioral of RS_232_RX_SHIFTER is

	signal DATA : std_logic_vector(7 downto 0) := (others => '0');

begin

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(SHIFT_LEFT = '1') then
				DATA <= RX_IN & DATA(7 downto 1);
			end if;
		end if;
	end process;
	
	OUTPUT <= DATA;

end Behavioral;

