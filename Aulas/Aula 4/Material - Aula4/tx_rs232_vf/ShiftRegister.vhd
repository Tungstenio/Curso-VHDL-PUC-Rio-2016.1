----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  17:25:19 02/29/2016 
-- Module Name:  ShiftRegister - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister_TX is
	Port (
		LOCAL_CLOCK   : in  STD_LOGIC;
		LOAD          : in  STD_LOGIC;
		ENABLE        : in  STD_LOGIC;
		DATA_IN       : in  STD_LOGIC_VECTOR (7 downto 0);
		DATA_OUT      : out STD_LOGIC
	);
end ShiftRegister_TX;

architecture Behavioral of ShiftRegister is

	signal DATA_OUT_R2 : STD_LOGIC := '0';
	signal DATA_MEM_R2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

	SR : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (LOAD = '1') then
				DATA_MEM_R2 <= DATA_IN;
			elsif (ENABLE = '1') then
				DATA_OUT_R2 <= DATA_MEM_R2(0);
				DATA_MEM_R2 <= "0" & DATA_MEM_R2(7 downto 1);
			end if;
		end if;
	end process;

	DATA_OUT <= DATA_OUT_R2;

end Behavioral;

