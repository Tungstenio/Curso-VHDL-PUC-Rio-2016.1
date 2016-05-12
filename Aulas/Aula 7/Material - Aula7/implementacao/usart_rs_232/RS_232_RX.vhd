---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    20:15:23 01/29/2015 
-- Module Name:    DIABLO_COMM_RS_232_RX - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity RS_232_RX is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		
		RX_IN          : IN  STD_LOGIC;
		FULL_BAUD_RATE : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
		
		COMM_FINISHED  : OUT STD_LOGIC;
		
		WORD           : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
		RX_DONE        : OUT STD_LOGIC
	);
end RS_232_RX;

architecture Behavioral of RS_232_RX is

	component RX_COUNTERS is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			
			RX_IN          : IN  STD_LOGIC;
			FULL_BAUD_RATE : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
			
			SHIFT          : OUT STD_LOGIC;
			
			DONE           : OUT STD_LOGIC
		);
	end component;

	component RS_232_RX_SHIFTER is
		port(
			LOCAL_CLOCK : IN  STD_LOGIC;
			
			RX_IN       : IN  STD_LOGIC;
			SHIFT_LEFT  : IN  STD_LOGIC;
			
			OUTPUT      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
	signal SHIFT_LEFT    : std_logic := '0';
	signal SHIFT_LEFT_R2 : std_logic := '0';
	signal WORD_IN       : std_logic_vector(7 downto 0) := (others => '0');
	
begin

	SHIFT_MANAGER : RX_COUNTERS
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			                  
			RX_IN          => RX_IN,
			FULL_BAUD_RATE => FULL_BAUD_RATE,
			              
			SHIFT          => SHIFT_LEFT,
			              
			DONE           => RX_DONE
		);

	RX_SHIFTER : RS_232_RX_SHIFTER
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			               
			RX_IN       => RX_IN,      
			SHIFT_LEFT  => SHIFT_LEFT_R2, 
			               
			OUTPUT      => WORD_IN
		);
		
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			SHIFT_LEFT_R2 <= SHIFT_LEFT;
		end if;
	end process;
		
	WORD          <= WORD_IN;
	COMM_FINISHED <= '1' when WORD_IN = x"09" else '0';

end Behavioral;

