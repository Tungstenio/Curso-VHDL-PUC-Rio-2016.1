
-- VHDL Instantiation Created from source file Tx_Rx.vhd -- 13:36:56 05/06/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Tx_Rx
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
	END COMPONENT;

	Inst_Tx_Rx: Tx_Rx PORT MAP(
		LOCAL_CLOCK => ,
		K => ,
		MESSAGE => ,
		TRANSMIT => ,
		TX_DONE => ,
		DEBUG_SHIFT => ,
		DEBUG_COUNTER => ,
		OUTPUT_MESSAGE => ,
		RX_DONE => 
	);


