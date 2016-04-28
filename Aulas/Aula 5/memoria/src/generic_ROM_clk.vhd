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
      0  => X"FFFF", 1  => X"FFEF", 2  => X"FFDF", 3  => X"FFCF", 4  => X"FFBF", 5  => X"FFAF", 6  => X"FF9F", 7  => X"FF8F", 
      8  => X"FF7F", 9  => X"FF6F", 10 => X"FF5F", 11 => X"FF4F", 12 => X"FF3F", 13 => X"FF2F", 14 => X"FF1F", 15 => X"FF0F",
		16 => X"FF0E", 17 => X"FF0D", 18 => X"FF0C", 19 => X"FF0B", 20 => X"FF0A", 21 => X"FF09", 22 => X"FF08", 23 => X"FF07",
		31 => X"FF0F",
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
