----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  11:45:57 03/02/2016 
-- Module Name:  counter_pulse - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_pulse is
   generic(
      SIZE : integer := 4
   );
   port(
      LOCAL_CLOCK         : in  std_logic;
      PROCESS_RUNNING     : in  std_logic;
      LIMIT               : in  std_logic_vector(SIZE-1 downto 0);
		
		PULSE               : in  std_logic;

      ON_LINE_COUNTER     : out std_logic_vector(SIZE-1 downto 0);
      COUNT_DONE          : out std_logic
   );
end counter_pulse;

architecture Behavioral of counter_pulse is

   signal COUNTER   : std_logic_vector(SIZE-1 downto 0) := (others => '0');
   signal DONE      : std_logic := '0';

begin

   -- BAUD COUNTER
   process(LOCAL_CLOCK)
   begin
      if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (PROCESS_RUNNING = '1') then
				if (DONE = '1') then
					COUNTER <= (others => '0');
				else
					if(PULSE = '1') then
						COUNTER <= COUNTER + "1";
					end if;
				end if;
			else
				COUNTER <= (others => '0');
			end if;
      end if;
   end process;
   DONE <= '1' when COUNTER = LIMIT else '0';
   --=============
   
   ON_LINE_COUNTER <= COUNTER;
   COUNT_DONE      <= DONE;

end Behavioral;
