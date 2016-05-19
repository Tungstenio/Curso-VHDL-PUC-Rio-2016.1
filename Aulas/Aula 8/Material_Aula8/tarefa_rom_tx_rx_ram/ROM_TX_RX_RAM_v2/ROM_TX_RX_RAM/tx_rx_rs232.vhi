
-- VHDL Instantiation Created from source file tx_rx_rs232.vhd -- 11:42:55 03/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT tx_rx_rs232
	PORT(
		LOCAL_CLOCK : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);
		MESSAGE_TX : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		DEBUG_BIT : OUT std_logic;
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		TX_DONE : OUT std_logic;
		RX_DONE : OUT std_logic
		);
	END COMPONENT;

	Inst_tx_rx_rs232: tx_rx_rs232 PORT MAP(
		LOCAL_CLOCK => ,
		BAUD_RATE => ,
		MESSAGE_TX => ,
		TRANSMIT => ,
		DEBUG_BIT => ,
		OUTPUT_MESSAGE => ,
		TX_DONE => ,
		RX_DONE => 
	);


