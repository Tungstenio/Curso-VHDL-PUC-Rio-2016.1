---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    20:22:26 01/29/2015 
-- Module Name:    RX_COUNTERS - Behavioral 
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RX_COUNTERS is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		
		RX_IN          : IN  STD_LOGIC;
		FULL_BAUD_RATE : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
		
		SHIFT          : OUT STD_LOGIC;
		
		DONE           : OUT STD_LOGIC
	);
end RX_COUNTERS;

architecture Behavioral of RX_COUNTERS is

	signal BAUD_COUNTER      : std_logic_vector(12 downto 0) := (others => '0');
	signal BAUD_RATE         : std_logic_vector(12 downto 0) := (others => '0');
	signal BAUD_FLAG         : std_logic := '0';
	
	signal RECEIVING         : std_logic := '0';
	signal HOLD_RECEPTION    : std_logic := '0';
	
	signal MESSAGE_COUNTER   : std_logic_vector(3  downto 0) := (others => '0');
	signal MESSAGE_FINISHED  : std_logic := '0';
	signal BLOCK_FIRST_SHIFT : std_logic := '0';
	signal BLOCK_LAST_SHIFT  : std_logic := '0';

begin

	-- RECEIVING
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(RECEIVING = '1') then
				if(MESSAGE_FINISHED = '1') then
					HOLD_RECEPTION <= '0';
				else
					HOLD_RECEPTION <= '1';
				end if;
			end if;
		end if;
	end process;
	RECEIVING <= NOT(RX_IN) OR HOLD_RECEPTION;
	--=============

	-- BAUD COUNTER
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(RECEIVING  = '1') then
				if(MESSAGE_FINISHED = '1') then
					BAUD_COUNTER(12 downto 0) <= (others => '0');
				elsif(BAUD_FLAG = '1') then
					BAUD_COUNTER(12 downto 1) <= (others => '0');
					BAUD_COUNTER(0)           <= '1';
				else
					BAUD_COUNTER              <= BAUD_COUNTER + "1";
				end if;
			end if;
		end if;
	end process;
	BAUD_FLAG <= '1' when BAUD_COUNTER = BAUD_RATE else '0';
	--=============
	
	with BLOCK_FIRST_SHIFT select
		BAUD_RATE <= '0' & FULL_BAUD_RATE(12 downto 1) when '0',
		             FULL_BAUD_RATE                    when others;
						 
	SHIFT <= BAUD_FLAG AND BLOCK_FIRST_SHIFT AND BLOCK_LAST_SHIFT;
	
	-- MESSAGE COUNTER
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(RECEIVING = '1') then
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
	MESSAGE_FINISHED  <= '1' when MESSAGE_COUNTER = "1010" else '0';
	BLOCK_LAST_SHIFT  <= '0' when MESSAGE_COUNTER = "1001" else '1';
	BLOCK_FIRST_SHIFT <= '0' when MESSAGE_COUNTER = "0000" else '1';
	--===============
	
	DONE <= MESSAGE_FINISHED;

end Behavioral;

