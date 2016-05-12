
-- VHDL Instantiation Created from source file tx_counters.vhd -- 11:57:56 03/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT tx_counters
	PORT(
		LOCAL_CLOCK : IN std_logic;
		TX_ENABLE : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);          
		TX_ING : OUT std_logic;
		TX_DONE : OUT std_logic;
		SHIFT : OUT std_logic
		);
	END COMPONENT;

	Inst_tx_counters: tx_counters PORT MAP(
		LOCAL_CLOCK => ,
		TX_ENABLE => ,
		BAUD_RATE => ,
		TX_ING => ,
		TX_DONE => ,
		SHIFT => 
	);


