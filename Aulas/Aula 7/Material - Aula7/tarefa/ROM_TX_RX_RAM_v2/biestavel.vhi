
-- VHDL Instantiation Created from source file biestavel.vhd -- 14:05:31 05/06/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT biestavel
	PORT(
		LOCAL_CLOCK : IN std_logic;
		START : IN std_logic;
		STOP : IN std_logic;          
		PROCESSING : OUT std_logic
		);
	END COMPONENT;

	Inst_biestavel: biestavel PORT MAP(
		LOCAL_CLOCK => ,
		START => ,
		STOP => ,
		PROCESSING => 
	);


