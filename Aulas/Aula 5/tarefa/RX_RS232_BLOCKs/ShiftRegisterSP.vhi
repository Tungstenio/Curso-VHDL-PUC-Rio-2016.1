
-- VHDL Instantiation Created from source file ShiftRegisterSP.vhd -- 15:07:44 04/14/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ShiftRegisterSP
	PORT(
		LOCAL_CLOCK : IN std_logic;
		LOAD : IN std_logic;
		ENABLE : IN std_logic;
		DATA_IN : IN std_logic;          
		DATA_OUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_ShiftRegisterSP: ShiftRegisterSP PORT MAP(
		LOCAL_CLOCK => ,
		LOAD => ,
		ENABLE => ,
		DATA_IN => ,
		DATA_OUT => 
	);


