----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  11:56:30 03/01/2016 
-- Module Name:  contador_simples - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_simples is
	Generic (
		N                : integer := 4
	);
	Port (
		LOCAL_CLOCK      : in  STD_LOGIC;
		ENABLE           : in  STD_LOGIC;
		LOAD             : in  STD_LOGIC;
		RESET            : in  STD_LOGIC;
		DATA_IN          : in  STD_LOGIC_VECTOR(N-1 downto 0);
		DATA_OUT         : out STD_LOGIC_VECTOR(N-1 downto 0)
	);
end contador_simples;

architecture Behavioral of contador_simples is

	signal COUNTER      : STD_LOGIC_VECTOR(N-1 downto 0) := (others => '0');

begin

	count : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (LOAD = '1') then
				COUNTER <= DATA_IN;
			elsif (RESET = '1') then
				COUNTER <= (others => '0');
			elsif (ENABLE = '1') then
				COUNTER <= COUNTER + "1";
			end if;
		end if;
	end process;

	DATA_OUT <= COUNTER;

end Behavioral;

