----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
-- Create Date:  12:08:28 03/02/2016 
-- Module Name:  tx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_counters is
   Port(
      LOCAL_CLOCK         : in  STD_LOGIC;
      TX_ENABLE           : in  STD_LOGIC;
      BAUD_RATE           : in  STD_LOGIC_VECTOR(13 downto  0);

		TX_ING              : out STD_LOGIC;
		TX_DONE             : out STD_LOGIC;
      SHIFT               : out STD_LOGIC
   );
end tx_counters;

architecture Behavioral of tx_counters is

   component counter_pulse
      generic(SIZE : integer);
      port(
         LOCAL_CLOCK         : in  std_logic;
         PROCESS_RUNNING     : in  std_logic;
         LIMIT               : in  std_logic_vector(SIZE-1 downto 0);
			
			PULSE               : in  std_logic;

         ON_LINE_COUNTER     : out std_logic_vector(SIZE-1 downto 0);
         COUNT_DONE          : out std_logic
      );
   end component;

   signal TRANSMITTING              : std_logic := '0';
   signal HOLD_TRANSMISSION         : std_logic := '0';
	
	signal TRANSMISSION_FINISHED     : std_logic := '0';
	
	signal BAUD_FLAG                 : std_logic := '0';
	
	signal M_CLOCK                   : std_logic := '0';
   signal M_COUNTER                 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_DONE                    : std_logic := '0';
	signal M_DONE_R1                 : std_logic := '0';

begin
	
	TX_ING  <= TRANSMITTING;
   SHIFT   <= TRANSMITTING AND BAUD_FLAG;

	-- TRANSMITTING
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(TRANSMITTING = '1') then
				if(TRANSMISSION_FINISHED = '1') then
					HOLD_TRANSMISSION <= '0';
				else
					HOLD_TRANSMISSION <= '1';
				end if;
			end if;
		end if;
	end process;
	TRANSMITTING <= TX_ENABLE OR HOLD_TRANSMISSION;
	TRANSMISSION_FINISHED <= '1' when M_COUNTER = "1011" else '0';
	--=============

	-- BAUD COUNTER
   b_count : counter_pulse
      generic map(size => 14)
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         PROCESS_RUNNING => TRANSMITTING,
         LIMIT => BAUD_RATE,
			PULSE => '1',
         
         COUNT_DONE => BAUD_FLAG
      );
	--=============

	-- MESSAGE COUNTER
   m_count : counter_pulse
      generic map(size => 4)
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         PROCESS_RUNNING => TRANSMITTING,
         LIMIT => "1011",
			
			PULSE => BAUD_FLAG,

         ON_LINE_COUNTER => M_COUNTER,
         COUNT_DONE => M_DONE
      );
	--================

	-- TX DONE
	dff : process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			M_DONE_R1 <= M_DONE;
		end if;
	end process;
	TX_DONE <= M_DONE_R1;
	--========

	
end Behavioral;
