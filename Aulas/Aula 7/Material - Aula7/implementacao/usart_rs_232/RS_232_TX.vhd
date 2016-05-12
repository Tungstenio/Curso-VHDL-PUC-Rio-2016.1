---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    18:32:22 09/18/2014 
-- Module Name:    RS_232_TX - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RS_232_TX is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		
		BAUD_RATE      : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
		
		AVAILABLE_DATA : IN  STD_LOGIC;
		TX_ON          : OUT STD_LOGIC;
		
		WORD           : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
		
		TX_OUT         : OUT STD_LOGIC
	);		
end RS_232_TX;

architecture Behavioral of RS_232_TX is

	component TX_COUNTERS is
		port(
			LOCAL_CLOCK : IN  STD_LOGIC;
			
			ENABLE_TX   : IN  STD_LOGIC;
			BAUD_RATE   : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
			
			SHIFT       : OUT STD_LOGIC;
			
			DONE        : OUT STD_LOGIC
		);
	end component;

	component RS_232_TX_SHIFTER is
		port(
			LOCAL_CLOCK : IN  STD_LOGIC;
			
			LOAD        : IN  STD_LOGIC;
			SHIFT_RIGHT : IN  STD_LOGIC;
			
			INPUT       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			OUTPUT      : OUT STD_LOGIC
		);
	end component;
	
	type TX_FSM is (idle,
	                transmit,
						 wait_tx
						 );
	signal TXState   : TX_FSM := idle;
	
	signal SHIFT        : std_logic := '0';
	signal DONE         : std_logic := '0';
	signal ENABLE_TX    : std_logic := '0';
	signal ENABLE_TX_R2 : std_logic := '0';
	signal ENABLE_TX_R3 : std_logic := '0';

begin

	SHIFT_MANAGER : TX_COUNTERS
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			               
			ENABLE_TX   => ENABLE_TX_R3, 
			BAUD_RATE   => BAUD_RATE,  
			               
			SHIFT       => SHIFT,      
			               
			DONE        => DONE       
		);

	TX_SHIFTER : RS_232_TX_SHIFTER
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			
			LOAD        => ENABLE_TX,
			SHIFT_RIGHT => SHIFT,
			
			INPUT       => WORD,
			
			OUTPUT      => TX_OUT
		);
		
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case TXState is
			
				when idle =>
					TX_ON <= '0';
					if(AVAILABLE_DATA = '1') then
						TX_ON   <= '1';
						TXState <= transmit;
					end if;
					
				when transmit =>
					TX_ON     <= '0';
					ENABLE_TX <= '1';
					TXState   <= wait_tx;
					
				when wait_tx =>
					ENABLE_TX  <= '0';
					if(DONE = '1') then
						TXState <= idle;
					end if;
			
				when others => NULL;
				
			end case;
		end if;
	end process;
	
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			ENABLE_TX_R2 <= ENABLE_TX;
			ENABLE_TX_R3 <= ENABLE_TX_R2;
		end if;
	end process;
	
end Behavioral;
