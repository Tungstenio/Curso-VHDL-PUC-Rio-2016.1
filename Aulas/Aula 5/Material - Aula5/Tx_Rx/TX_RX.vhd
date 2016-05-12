library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tx_Rx is
	PORT(
		LOCAL_CLOCK : IN std_logic;
		K : IN std_logic_vector(15 downto 0);
		MESSAGE : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;
		
		TX_DONE : OUT std_logic;
		DEBUG_SHIFT : OUT std_logic;
		DEBUG_COUNTER : OUT std_logic_vector(3 downto 0);
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		RX_DONE : OUT std_logic
	);
end Tx_Rx;

architecture Behavioral of Tx_Rx is

	COMPONENT tx_rs232
	PORT(
		LOCAL_CLOCK : IN std_logic;
		K : IN std_logic_vector(15 downto 0);
		MESSAGE_TX : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		OUTPUT_BIT : OUT std_logic;
		TX_DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT RX_RS232_MAIN
	PORT(
		LOCAL_CLOCK : IN std_logic;
		K : IN std_logic_vector(15 downto 0);
		RECEIVED_BIT : IN std_logic;          
		DEBUG_SHIFT : OUT std_logic;
		DEBUG_COUNTER : OUT std_logic_vector(3 downto 0);
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		RX_DONE : OUT std_logic
		);
	END COMPONENT;

	signal SERIAL : std_logic := '1';

begin

	Inst_tx_rs232: tx_rs232 PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		K => K,
		MESSAGE_TX => MESSAGE,
		TRANSMIT => TRANSMIT,
		OUTPUT_BIT => SERIAL,
		TX_DONE => TX_DONE
	);

	Inst_RX_RS232_MAIN: RX_RS232_MAIN PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		K => K,
		RECEIVED_BIT => SERIAL,
		DEBUG_SHIFT => DEBUG_SHIFT,
		DEBUG_COUNTER => DEBUG_COUNTER,
		OUTPUT_MESSAGE => OUTPUT_MESSAGE,
		RX_DONE => RX_DONE
	);

end Behavioral;

