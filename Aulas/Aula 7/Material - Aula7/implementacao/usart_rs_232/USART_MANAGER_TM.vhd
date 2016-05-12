---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    10:35:58 02/25/2015 
-- Module Name:    USART_MANAGER_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity USART_MANAGER_TM is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		
		BAUD_RATE      : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
		
		AVAILABLE_DATA : IN  STD_LOGIC;
		TX_ON          : OUT STD_LOGIC;
		RX_DONE        : OUT STD_LOGIC;
		
		COMM_FINISHED  : OUT STD_LOGIC;
		
		TX_WORD        : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
		RX_WORD        : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
		
		RX_IN          : IN  STD_LOGIC;
		TX_OUT         : OUT STD_LOGIC
	);
end USART_MANAGER_TM;

architecture Behavioral of USART_MANAGER_TM is

	component RS_232_RX is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			
			RX_IN          : IN  STD_LOGIC;
			FULL_BAUD_RATE : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
			
			COMM_FINISHED  : OUT STD_LOGIC;
			
			WORD           : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			RX_DONE        : OUT STD_LOGIC
		);
	end component;
	
	component RS_232_TX is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			
			BAUD_RATE      : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
			
			AVAILABLE_DATA : IN  STD_LOGIC;
			TX_ON          : OUT STD_LOGIC;
			
			WORD           : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			TX_OUT         : OUT STD_LOGIC
		);		
	end component;

begin

	RX : RS_232_RX
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			               
			RX_IN          => RX_IN,
			FULL_BAUD_RATE => BAUD_RATE,
			
			COMM_FINISHED  => COMM_FINISHED,
			               
			WORD           => RX_WORD,
			RX_DONE        => RX_DONE
		);
	
	TX : RS_232_TX
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			            
			BAUD_RATE      => BAUD_RATE,
			
			AVAILABLE_DATA => AVAILABLE_DATA,
			TX_ON          => TX_ON,
			
			WORD           => TX_WORD,

			TX_OUT         => TX_OUT
		);

end Behavioral;

