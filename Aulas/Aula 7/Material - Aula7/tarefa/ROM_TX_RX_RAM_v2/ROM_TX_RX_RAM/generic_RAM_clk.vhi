
-- VHDL Instantiation Created from source file generic_RAM_clk.vhd -- 11:45:09 03/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT generic_RAM_clk
	PORT(
		LOCAL_CLOCK : IN std_logic;
		RAM_ENABLE : IN std_logic;
		RAM_DATA_ADDRESS : IN std_logic_vector(4 downto 0);
		RAM_WRITE_ENABLE : IN std_logic;
		RAM_DATA_INPUT : IN std_logic_vector(15 downto 0);          
		RAM_DATA_OUTPUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_generic_RAM_clk: generic_RAM_clk PORT MAP(
		LOCAL_CLOCK => ,
		RAM_ENABLE => ,
		RAM_DATA_ADDRESS => ,
		RAM_WRITE_ENABLE => ,
		RAM_DATA_INPUT => ,
		RAM_DATA_OUTPUT => 
	);


