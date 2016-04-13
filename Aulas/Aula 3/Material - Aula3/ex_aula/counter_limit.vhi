
-- VHDL Instantiation Created from source file counter_limit.vhd -- 16:03:48 04/07/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter_limit
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ENABLE : IN std_logic;
		BAUD_RATE : IN std_logic_vector(12 downto 0);          
		DONE : OUT std_logic
		);
	END COMPONENT;

	Inst_counter_limit: counter_limit PORT MAP(
		LOCAL_CLOCK => ,
		ENABLE => ,
		BAUD_RATE => ,
		DONE => 
	);


