----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  12:23:09 03/01/2016 
-- Module Name:  counter_limit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_limit is
   Port ( 
      LOCAL_CLOCK     : in  STD_LOGIC;
      ENABLE          : in  STD_LOGIC;
      K       			 : in  STD_LOGIC_VECTOR (15 downto 0);
      DONE            : out STD_LOGIC
   );
end counter_limit;

architecture Behavioral of counter_limit is

   signal BAUD_COUNTER      : std_logic_vector(15 downto 0) := (others => '0');
   signal BAUD_FLAG         : std_logic := '0';
   
begin

   -- RECEIVING
   process(LOCAL_CLOCK)
   begin
      if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
         if (ENABLE = '1') then
            if(BAUD_FLAG = '1') then
					BAUD_COUNTER <= (others => '0');
				else
					BAUD_COUNTER <= BAUD_COUNTER + "1";
				end if;
			else
				BAUD_COUNTER <= (others => '0');
         end if;
      end if;
   end process;

	-- CONTROL
   BAUD_FLAG <= '1' when BAUD_COUNTER = (K-"1") else '0';
	
	DONE <= BAUD_FLAG;

end Behavioral;

