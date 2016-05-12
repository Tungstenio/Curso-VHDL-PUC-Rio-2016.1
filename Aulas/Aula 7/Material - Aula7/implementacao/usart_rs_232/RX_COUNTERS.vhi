
-- VHDL Instantiation Created from source file RX_COUNTERS.vhd -- 15:35:12 09/22/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RX_COUNTERS
	PORT(
		LOCAL_CLOCK : IN std_logic;
		RX_IN : IN std_logic;
		FULL_BAUD_RATE : IN std_logic_vector(12 downto 0);          
		SHIFT : OUT std_logic;
		DONE : OUT std_logic
		);
	END COMPONENT;

	Inst_RX_COUNTERS: RX_COUNTERS PORT MAP(
		LOCAL_CLOCK => ,
		RX_IN => ,
		FULL_BAUD_RATE => ,
		SHIFT => ,
		DONE => 
	);


