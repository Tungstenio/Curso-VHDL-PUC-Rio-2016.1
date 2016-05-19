----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  10:36:43 03/08/2016 
-- Module Name:  generic_RAM_clk - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generic_RAM_clk is
   Generic(
      DATA_SIZE               : integer := 16;
      ADDRESS_SIZE            : integer := 5
   );
   Port(
		LOCAL_CLOCK             : in  STD_LOGIC;
		
      RAM_ENABLE              : in  STD_LOGIC;
      RAM_DATA_ADDRESS        : in  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		
		RAM_WRITE_ENABLE        : in  STD_LOGIC;
		RAM_DATA_INPUT          : in  STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0);

      RAM_DATA_OUTPUT         : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
   );
end generic_RAM_clk;

architecture Behavioral of generic_RAM_clk is

	type RAM is array (2**ADDRESS_SIZE-1 downto 0) of STD_LOGIC_VECTOR(DATA_SIZE-1 downto 0);
	signal DATA : RAM := (others => (others => '0'));
	
	signal RAM_ADDRESS             : integer range 0 to 2**ADDRESS_SIZE-1;
	
	signal RAM_DATA_OUTPUT_R0      : std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');

begin

	process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (RAM_ENABLE = '1') then
				if (RAM_WRITE_ENABLE = '0') then
					RAM_DATA_OUTPUT_R0 <= DATA(RAM_ADDRESS);
				else
					DATA(RAM_ADDRESS) <= RAM_DATA_INPUT;
				end if;
			else
				RAM_DATA_OUTPUT_R0 <= (others => '0');
			end if;
		end if;
	end process;

	RAM_ADDRESS <= conv_integer(RAM_DATA_ADDRESS);

	RAM_DATA_OUTPUT <= RAM_DATA_OUTPUT_R0;

end Behavioral;

