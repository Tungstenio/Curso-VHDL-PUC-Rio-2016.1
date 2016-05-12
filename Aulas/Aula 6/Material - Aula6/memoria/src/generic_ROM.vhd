----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  15:25:30 03/03/2016 
-- Module Name:  generic_ROM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generic_ROM is
   Generic(
      DATA_SIZE               : integer := 16;
      ADDRESS_SIZE            : integer := 5
   );
   Port(
      ROM_ENABLE              : in  STD_LOGIC;
      ROM_DATA_ADDRESS        : in  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);

      ROM_DATA_OUTPUT         : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
   );
end generic_ROM;

architecture Behavioral of generic_ROM is

   type ROM is array (2**ADDRESS_SIZE-1 downto 0) of std_logic_vector(DATA_SIZE-1 downto 0);
   constant DATA : ROM := ( -- hex_mat2.txt
      0  => X"FFFF", 1  => X"EFFF", 2  => X"DFFF", 3  => X"CFFF", 4  => X"BFFF", 5  => X"AFFF", 6  => X"9FFF", 7  => X"8FFF", 
      8  => X"7FFF", 9  => X"6FFF", 10 => X"5FFF", 11 => X"4FFF", 12 => X"3FFF", 13 => X"2FFF", 14 => X"1FFF", 15 => X"0FFF",
		16 => X"0EFF", 17 => X"0DFF", 18 => X"0CFF", 19 => X"0BFF", 20 => X"0AFF", 21 => X"09FF", 22 => X"08FF", 23 => X"07FF",
      others => (others => '0')
   );

   signal OUTPUT_ADDRESS          : integer range 0 to 2**ADDRESS_SIZE-1;
   
begin

   with ROM_ENABLE select
      ROM_DATA_OUTPUT <= DATA(OUTPUT_ADDRESS)    when '1',
                         (others => '0')         when others;

	OUTPUT_ADDRESS <= conv_integer(ROM_DATA_ADDRESS);

end Behavioral;
