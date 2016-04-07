
-- VHDL Instantiation Created from source file ShiftRegister.vhd -- 16:21:25 04/07/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ShiftRegister
	PORT(
		LOCAL_CLOCK : IN std_logic;
		LOAD : IN std_logic;
		ENABLE : IN std_logic;
		DATA_IN : IN std_logic_vector(7 downto 0);          
		DATA_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_ShiftRegister: ShiftRegister PORT MAP(
		LOCAL_CLOCK => ,
		LOAD => ,
		ENABLE => ,
		DATA_IN => ,
		DATA_OUT => 
	);


