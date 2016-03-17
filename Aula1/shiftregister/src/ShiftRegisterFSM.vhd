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

entity ShiftRegisterFSM is
	port(
		LOCAL_CLOCK   : in  STD_LOGIC;
		LOAD          : in  STD_LOGIC;
		ENABLE        : in  STD_LOGIC;
		DATA_IN       : in  STD_LOGIC_VECTOR (7 downto 0);
		DATA_OUT      : out STD_LOGIC
	);
end ShiftRegisterFSM;

architecture Behavioral of ShiftRegisterFSM is

	type StateMachine is (state0, state1);
	signal State : StateMachine := state0;
	
	signal DATA : std_logic_vector(7 downto 0) := (others => '0');

begin

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case State is
			
				when state0 =>
					if(LOAD = '1') then
						DATA <= DATA_IN;
					elsif(ENABLE = '1') then
						State <= state1;
					end if;
					
				when state1 =>
					DATA <= '0' & DATA(7 downto 1);
					if(ENABLE = '0') then
						State <= state0;
					end if;
						
			end case;
		end if;
	end process;

	DATA_OUT <= DATA(0);

end Behavioral;

