---------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:    09:43:22 03/07/2016 
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_rx_rs232_fsm is
	port(
		LOCAL_CLOCK	: IN  STD_LOGIC;
		TX_MESSAGE	: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		TRANSMIT		: IN  STD_LOGIC;
		BAUD_RATE	: IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
		RX_MESSAGE	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		RX_DONE		: OUT STD_LOGIC;
		TX_DONE		: OUT STD_LOGIC
	);
end tx_rx_rs232_fsm;

architecture Behavioral of tx_rx_rs232_fsm is

	signal TxRxBit : std_logic := '1';

	COMPONENT rx_rs232_fsm
	PORT(
		LOCAL_CLOCK : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);
		RECEIVED_BIT : IN std_logic;          
		DEBUG : OUT std_logic_vector(2 downto 0);
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		RX_DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT tx_RS232_fsm
	PORT(
		LOCAL_CLOCK : IN std_logic;
		DATA_IN : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);          
		DEBUG : OUT std_logic_vector(2 downto 0);
		DATA_OUT : OUT std_logic;
		TX_DONE : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_rx_rs232_fsm: rx_rs232_fsm 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		BAUD_RATE => BAUD_RATE,
		RECEIVED_BIT => TxRxBit,
--		DEBUG => ,
		OUTPUT_MESSAGE => RX_MESSAGE,
		RX_DONE => RX_DONE
	);
	
		Inst_tx_RS232_fsm: tx_RS232_fsm 
		PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		DATA_IN => TX_MESSAGE,
		TRANSMIT => TRANSMIT,
		BAUD_RATE => BAUD_RATE,
--		DEBUG => ,
		DATA_OUT => TxRxBit,
		TX_DONE => TX_DONE
	);

end Behavioral;

