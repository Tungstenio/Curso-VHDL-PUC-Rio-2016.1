----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  10:42:10 03/08/2016 
-- Module Name:  generic_ROM_clk - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generic_ROM_clk is
   Generic(
      DATA_SIZE               : integer := 16;
      ADDRESS_SIZE            : integer := 5
   );
   Port(
		LOCAL_CLOCK             : in  STD_LOGIC;
		
      ROM_ENABLE              : in  STD_LOGIC;
      ROM_DATA_ADDRESS        : in  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);

      ROM_DATA_OUTPUT         : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
   );
end generic_ROM_clk;

architecture Behavioral of generic_ROM_clk is

   type ROM is array (2**ADDRESS_SIZE-1 downto 0) of std_logic_vector(DATA_SIZE-1 downto 0);
   constant DATA : ROM := ( -- hex_mat2.txt
      0  => X"FF", 1  => X"EF", 2  => X"DF", 3  => X"CF", 4  => X"BF", 5  => X"AF", 6  => X"9F", 7  => X"8F", 
      8  => X"7F", 9  => X"6F", 10 => X"5F", 11 => X"4F", 12 => X"3F", 13 => X"2F", 14 => X"1F", 15 => X"0F",
		16 => X"0E", 17 => X"0D", 18 => X"0C", 19 => X"0B", 20 => X"0A", 21 => X"09", 22 => X"08", 23 => X"07",
		31 => X"0F",
      others => (others => '0')
   );

   signal OUTPUT_ADDRESS          : integer range 0 to 2**ADDRESS_SIZE-1;
	
	signal ROM_DATA_OUTPUT_R0      : std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
   
begin

	process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (ROM_ENABLE = '1') then
				ROM_DATA_OUTPUT_R0 <= DATA(OUTPUT_ADDRESS);
			else
				ROM_DATA_OUTPUT_R0 <= (others => '0');
			end if;
		end if;
	end process;
	
	OUTPUT_ADDRESS <= conv_integer(ROM_DATA_ADDRESS);

	ROM_DATA_OUTPUT <= ROM_DATA_OUTPUT_R0;

end Behavioral;
