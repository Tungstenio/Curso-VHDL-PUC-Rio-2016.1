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
      0  => X"FFFF", 1  => X"EFFF", 2  => X"DFFF", 3  => X"CFFF", 4  => X"BFFF", 5  => X"AFFF", 6  => X"9FFF", 7  => X"8FFF", 
      8  => X"7FFF", 9  => X"6FFF", 10 => X"5FFF", 11 => X"4FFF", 12 => X"3FFF", 13 => X"2FFF", 14 => X"1FFF", 15 => X"0FFF",
		16 => X"0EFF", 17 => X"0DFF", 18 => X"0CFF", 19 => X"0BFF", 20 => X"0AFF", 21 => X"09FF", 22 => X"08FF", 23 => X"07FF",
		31 => X"0F0F",
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
