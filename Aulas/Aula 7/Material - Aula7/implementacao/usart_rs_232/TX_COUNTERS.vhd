---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    17:55:18 01/29/2015 
-- Module Name:    TX_COUNTERS - Behavioral 
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity TX_COUNTERS is
	port(
		LOCAL_CLOCK : IN  STD_LOGIC;
		
		ENABLE_TX   : IN  STD_LOGIC;
		BAUD_RATE   : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
		
		SHIFT       : OUT STD_LOGIC;
		
		DONE        : OUT STD_LOGIC
	);
end TX_COUNTERS;

architecture Behavioral of TX_COUNTERS is

	signal BAUD_COUNTER          : std_logic_vector(12 downto 0) := "0000000000010";
	signal BAUD_FLAG             : std_logic := '0';
	
	signal TRANSMITTING          : std_logic := '0';
	signal HOLD_TRANSMISSION     : std_logic := '0';
	
	signal MESSAGE_COUNTER       : std_logic_vector(3  downto 0) := (others => '0');
	signal MESSAGE_FINISHED      : std_logic := '0';
	signal BLOCK_SHIFT           : std_logic := '0';

begin

	-- TRANSMITTING
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(TRANSMITTING = '1') then
				if(MESSAGE_FINISHED = '1') then
					HOLD_TRANSMISSION <= '0';
				else
					HOLD_TRANSMISSION <= '1';
				end if;
			end if;
		end if;
	end process;
	TRANSMITTING <= ENABLE_TX OR HOLD_TRANSMISSION;
	--=============

	-- BAUD COUNTER
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(TRANSMITTING = '1') then
				if(BAUD_FLAG = '1') then
					BAUD_COUNTER <= "0000000000001";
				else
					BAUD_COUNTER <= BAUD_COUNTER + "1";
				end if;
			end if;
		end if;
	end process;
	BAUD_FLAG <= '1' when BAUD_COUNTER = BAUD_RATE else '0';
	--=============
	
	-- MESSAGE/GUARD COUNTER
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(TRANSMITTING = '1') then
				if(MESSAGE_FINISHED = '1') then	
					MESSAGE_COUNTER <= (others => '0');
				elsif(BAUD_FLAG = '1') then
					MESSAGE_COUNTER <= MESSAGE_COUNTER + "1";
				end if;
			else
				MESSAGE_COUNTER <= (others => '0');
			end if;
		end if;
	end process;
	MESSAGE_FINISHED <= '1' when MESSAGE_COUNTER = "1011" else '0';
	BLOCK_SHIFT      <= '0' when MESSAGE_COUNTER > "1001" else '1';
	--=============
	
	SHIFT <= BAUD_FLAG AND BLOCK_SHIFT AND TRANSMITTING;
	DONE  <= MESSAGE_FINISHED;

end Behavioral;

