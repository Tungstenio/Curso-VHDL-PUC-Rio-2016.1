----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  12:08:28 03/02/2016 
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rx_counters is
   Port(
      LOCAL_CLOCK         : in  STD_LOGIC;
      RX_ENABLE           : in  STD_LOGIC;
      BAUD_RATE           : in  STD_LOGIC_VECTOR(13 downto  0);

		RX_ING              : out STD_LOGIC;
		RX_DONE             : out STD_LOGIC;
      SHIFT               : out STD_LOGIC
   );
end rx_counters;

architecture Behavioral of rx_counters is

   component counter_limit
      generic(SIZE : integer := 4);
      port(
         LOCAL_CLOCK         : in  std_logic;
         PROCESS_RUNNING     : in  std_logic;
         LIMIT               : in  std_logic_vector(SIZE-1 downto 0);
			
			PULSE               : in  std_logic;

         ON_LINE_COUNTER     : out std_logic_vector(SIZE-1 downto 0);
         COUNT_DONE          : out std_logic
      );
   end component;

   signal RECEIVING              : std_logic := '0';
   signal HOLD_RECEPTION         : std_logic := '0';
	
	signal RECEPTION_FINISHED     : std_logic := '0';
	
	signal BAUD_FLAG                 : std_logic := '0';
	
	signal M_CLOCK                   : std_logic := '0';
   signal M_COUNTER                 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_DONE                    : std_logic := '0';
	signal M_DONE_R1                 : std_logic := '0';
	
	signal BAUD_RATE_R1              : std_logic_vector(13 downto 0) := (others => '0');
	
	signal BLOCK_LAST_SHIFT_R1  		: std_logic := '0';
	signal BLOCK_LAST_SHIFT_R2	   	: std_logic := '0';

begin

	-- RECEIVING
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(RECEIVING = '1') then
				if(RECEPTION_FINISHED = '1') then
					HOLD_RECEPTION <= '0';
				else
					HOLD_RECEPTION <= '1';
				end if;
			end if;
		end if;
	end process;
	RECEIVING <= RX_ENABLE OR HOLD_RECEPTION;
	RECEPTION_FINISHED <= '1' when M_COUNTER = "1011" else '0';
	--=============

	-- BAUD COUNTER
   b_count : counter_limit
      generic map(size => 14)
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         PROCESS_RUNNING => RECEIVING,
         LIMIT => BAUD_RATE_R1,
			PULSE => '1',
         
         COUNT_DONE => BAUD_FLAG
      );
	BAUD_RATE_R1 <= '0' & BAUD_RATE(13 downto 1) when M_COUNTER = "0000" else BAUD_RATE;
	--=============

	-- MESSAGE COUNTER
   m_count : counter_limit
      generic map(size => 4)
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         PROCESS_RUNNING => RECEIVING,
         LIMIT => "1011",
			
			PULSE => BAUD_FLAG,

         ON_LINE_COUNTER => M_COUNTER,
         COUNT_DONE => M_DONE
      );
	--================

	-- RX DONE
	dff : process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			M_DONE_R1 <= M_DONE;
		end if;
	end process;
	RX_DONE <= M_DONE_R1;
	--========

	RX_ING  <= RECEIVING AND NOT(RX_ENABLE);
   SHIFT   <= RECEIVING AND BAUD_FLAG AND NOT(BLOCK_LAST_SHIFT_R2);
	
	BLOCK_LAST_SHIFT_R1 <= '1' when M_COUNTER > "1000" else '0';
	BLOCK_LAST_SHIFT_R2 <= BLOCK_LAST_SHIFT_R1 AND BAUD_FLAG;
	
end Behavioral;
