
-- VHDL Instantiation Created from source file generic_ROM_clk.vhd -- 14:00:07 05/06/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT generic_ROM_clk
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ROM_ENABLE : IN std_logic;
		ROM_DATA_ADDRESS : IN std_logic_vector(4 downto 0);          
		ROM_DATA_OUTPUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_generic_ROM_clk: generic_ROM_clk PORT MAP(
		LOCAL_CLOCK => ,
		ROM_ENABLE => ,
		ROM_DATA_ADDRESS => ,
		ROM_DATA_OUTPUT => 
	);


