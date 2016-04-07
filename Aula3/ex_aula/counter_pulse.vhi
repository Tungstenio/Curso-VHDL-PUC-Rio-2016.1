
-- VHDL Instantiation Created from source file counter_pulse.vhd -- 16:04:10 04/07/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter_pulse
	PORT(
		LOCAL_CLOCK : IN std_logic;
		PROCESS_RUNNING : IN std_logic;
		LIMIT : IN std_logic_vector(3 downto 0);
		PULSE : IN std_logic;          
		ON_LINE_COUNTER : OUT std_logic_vector(3 downto 0);
		COUNT_DONE : OUT std_logic
		);
	END COMPONENT;

	Inst_counter_pulse: counter_pulse PORT MAP(
		LOCAL_CLOCK => ,
		PROCESS_RUNNING => ,
		LIMIT => ,
		PULSE => ,
		ON_LINE_COUNTER => ,
		COUNT_DONE => 
	);


