
-- VHDL Instantiation Created from source file tx_rs232.vhd -- 13:45:32 05/06/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_tx_rs232: tx_rs232 PORT MAP(
		LOCAL_CLOCK => ,
		K => ,
		MESSAGE_TX => ,
		TRANSMIT => ,
		OUTPUT_BIT => ,
		TX_DONE => 
	);


