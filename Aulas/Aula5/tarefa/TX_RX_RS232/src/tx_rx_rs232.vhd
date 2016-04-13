----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  13:17:58 03/04/2016 
-- Module Name:  tx_rs232 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_rx_rs232 is
   port(
      LOCAL_CLOCK      : in  std_logic;
      BAUD_RATE        : in  std_logic_vector(13 downto 0);
      MESSAGE_TX       : in  std_logic_vector(7 downto 0);
      TRANSMIT         : in  std_logic;
		
		DEBUG_BIT		  : out std_logic;
		
		OUTPUT_MESSAGE   : out std_logic_vector(7 downto 0);
		TX_DONE			  : out std_logic;
      RX_DONE          : out std_logic
	);
		
end tx_rx_rs232;

architecture Behavioral of tx_rx_rs232 is

	signal TxRxBit : std_logic := '1';

	COMPONENT tx_rs232
	PORT(
		LOCAL_CLOCK : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);
		MESSAGE_TX : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		OUTPUT_BIT : OUT std_logic;
		TX_DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT rx_rs232_v2
	PORT(
		LOCAL_CLOCK : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);
		RECEIVED_BIT : IN std_logic;          
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		RX_DONE : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_tx_rs232: tx_rs232 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		BAUD_RATE => BAUD_RATE,
		MESSAGE_TX => MESSAGE_TX,
		TRANSMIT => TRANSMIT,
		OUTPUT_BIT => TxRxBit,
		TX_DONE => TX_DONE
	);

	Inst_rx_rs232_v2: rx_rs232_v2 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		BAUD_RATE => BAUD_RATE,
		RECEIVED_BIT => TxRxBit,
		OUTPUT_MESSAGE => OUTPUT_MESSAGE,
		RX_DONE => RX_DONE
	);
	
	DEBUG_BIT <= TxRxBit;
	
end Behavioral;

