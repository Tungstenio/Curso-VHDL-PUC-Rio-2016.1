----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    13:23:59 03/05/2015 
-- Module Name:    PIPELINED_FLOAT_ADDER_SYNC - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PIPELINED_FLOAT_ADDER_SYNC is
	port(
		LOCAL_CLOCK : IN  STD_LOGIC;
		
		SYNC_IN     : IN  STD_LOGIC;
		
		SYNC_OUT    : OUT STD_LOGIC
	);
end PIPELINED_FLOAT_ADDER_SYNC;

architecture Behavioral of PIPELINED_FLOAT_ADDER_SYNC is

	signal IN_PROGRESS       : std_logic := '0';
	signal SYNCED            : std_logic := '0';
	signal PROCESS_COMPLETED : std_logic := '0';
	
	signal PROGRESS_COUNTER  : std_logic_vector(2 downto 0) := (others => '0');

begin

	-- ADD IN PROGRESS
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(IN_PROGRESS = '1') then
				if(PROCESS_COMPLETED = '1') then
					SYNCED <= '0';
				else
					SYNCED <= '1';
				end if;
			end if;
		end if;
	end process;
	IN_PROGRESS <= SYNC_IN OR SYNCED;
	--=============

	-- BAUD COUNTER
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(IN_PROGRESS  = '1') then
				if(PROCESS_COMPLETED = '1') then
					PROGRESS_COUNTER <= (others => '0');
				else
					PROGRESS_COUNTER <= PROGRESS_COUNTER + "1";
				end if;
			end if;
		end if;
	end process;
	PROCESS_COMPLETED <= '1' when PROGRESS_COUNTER = "100" else '0';
	--=============
	
	SYNC_OUT <= PROCESS_COMPLETED;

end Behavioral;

