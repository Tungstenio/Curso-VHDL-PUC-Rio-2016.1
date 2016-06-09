----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    10:37:40 03/05/2015 
-- Module Name:    PIPELINED_FLOAT_ADDER_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PIPELINED_FLOAT_ADDER_TM is
	port(
		LOCAL_CLOCK : IN  STD_LOGIC;
		RESET       : IN  STD_LOGIC;
		
		SYNC_IN     : IN  STD_LOGIC;
		
		X           : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Y           : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		--DEBUG
		DEBUG_SUBTRACT_ENABLE : OUT STD_LOGIC;
		DEBUG_SUM_CASE_KEY    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
		DEBUG_A_SUB_IN        : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		DEBUG_B_SUB_IN        : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		DEBUG_SUM_RESULT      : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		DEBUG_ADD_MSB         : OUT STD_LOGIC;
		DEBUG_CARRY_OUT       : OUT STD_LOGIC;
		--=====
		
		SYNC_OUT    : OUT STD_LOGIC;
		FLOAT_SUM   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end PIPELINED_FLOAT_ADDER_TM;

architecture Behavioral of PIPELINED_FLOAT_ADDER_TM is

	component PIPELINED_FLOAT_ADDER_SYNC is
		port(
			LOCAL_CLOCK : IN  STD_LOGIC;
			
			SYNC_IN     : IN  STD_LOGIC;
			
			SYNC_OUT    : OUT STD_LOGIC
		);
	end component;

	component PIPELINED_MANTISSA_ALIGNER_TM is
		port(
			LOCAL_CLOCK      : IN  STD_LOGIC;
			RESET            : IN  STD_LOGIC;
			
			X                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			Y                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			
			ALIGNED_EXPONENT : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			X_MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			Y_MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
		);
	end component;

	component FULL_ADDER_24 is
		port(
			A				: IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
			B				: IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
			SUBTRACT_EN	: IN  STD_LOGIC;			
			
			COUT			: OUT STD_LOGIC;
			OUTPUT		: OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
		);
	end component;

	component PIPELINED_ALIGNER_TM is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			RESET          : IN  STD_LOGIC;
			            
			MANTISSA_INPUT : IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
			EXPONENT_INPUT : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			            
			OUTPUT         : OUT STD_LOGIC_VECTOR(30 DOWNTO 0)
		);
	end component;
	
	signal ALIGNED_EXPONENT      : std_logic_vector(7  downto 0) := (others => '0');
	signal X_MANTISSA_ALIGNED    : std_logic_vector(23 downto 0) := (others => '0');
	signal Y_MANTISSA_ALIGNED    : std_logic_vector(23 downto 0) := (others => '0');
	
	signal ALIGNED_EXPONENT_R0   : std_logic_vector(7  downto 0) := (others => '0');
	signal X_MANTISSA_ALIGNED_R0 : std_logic_vector(23 downto 0) := (others => '0');
	signal Y_MANTISSA_ALIGNED_R0 : std_logic_vector(23 downto 0) := (others => '0');
	
	signal SUM_CASE_KEY          : std_logic_vector(2  downto 0) := (others => '0');
	signal XY_COMPARE            : std_logic := '0';
	
	signal A_SUB_IN              : std_logic_vector(23 downto 0) := (others => '0');
	signal B_SUB_IN              : std_logic_vector(23 downto 0) := (others => '0');
	signal SUBTRACT_ENABLE       : std_logic := '0';
	
	signal CARRY_OUT             : std_logic := '0';
	signal SUM_RESULT            : std_logic_vector(23 downto 0) := (others => '0');
	
	signal CARRY_OUT_R0          : std_logic := '0';
	signal SUM_RESULT_R0         : std_logic_vector(23 downto 0) := (others => '0');
	
	signal OUTPUT_SIGN           : std_logic := '0';
	signal ADD_MSB               : std_logic := '0';
	
	signal NORM_INPUT            : std_logic_vector(24 downto 0) := (others => '0');
	signal SIGNLESS_OUTPUT       : std_logic_vector(30 downto 0) := (others => '0');
	
	signal CASE_ZERO             : std_logic := '0';
	signal CASE_ZERO_SELECT      : std_logic := '0';

begin

	SYNC : PIPELINED_FLOAT_ADDER_SYNC
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			               
			SYNC_IN     => SYNC_IN,
			               
			SYNC_OUT    => SYNC_OUT
		);

	LINE : PIPELINED_MANTISSA_ALIGNER_TM
		port map(
			LOCAL_CLOCK      => LOCAL_CLOCK,
			RESET            => RESET,
			                 
			X                => X,
			Y                => Y,
			                 
			ALIGNED_EXPONENT => ALIGNED_EXPONENT_R0,
			X_MANTISSA       => X_MANTISSA_ALIGNED_R0,
			Y_MANTISSA       => Y_MANTISSA_ALIGNED_R0
		);

	FADD : FULL_ADDER_24
		port map(
			A				=> A_SUB_IN,
			B				=> B_SUB_IN,
			
			SUBTRACT_EN	=> SUBTRACT_ENABLE,
			            
			COUT			=> CARRY_OUT_R0,
			OUTPUT		=> SUM_RESULT_R0
		);

	NORM : PIPELINED_ALIGNER_TM
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			RESET          => RESET,
			            
			MANTISSA_INPUT => NORM_INPUT,
			EXPONENT_INPUT => ALIGNED_EXPONENT,
			            
			OUTPUT         => SIGNLESS_OUTPUT
		);
		
	process(LOCAL_CLOCK,RESET)
	begin
		if(RESET = '1') then
			X_MANTISSA_ALIGNED <= (others => '0');
			Y_MANTISSA_ALIGNED <= (others => '0');
			ALIGNED_EXPONENT   <= (others => '0');
			CARRY_OUT			 <= '0';
			SUM_RESULT         <= (others => '0');
		elsif(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			X_MANTISSA_ALIGNED <= X_MANTISSA_ALIGNED_R0;
			Y_MANTISSA_ALIGNED <= Y_MANTISSA_ALIGNED_R0;
			ALIGNED_EXPONENT   <= ALIGNED_EXPONENT_R0;
			CARRY_OUT			 <= CARRY_OUT_R0;
			SUM_RESULT         <= SUM_RESULT_R0;
		end if;
	end process;
		
	XY_COMPARE		<= '0' when X_MANTISSA_ALIGNED < Y_MANTISSA_ALIGNED else '1';
	SUM_CASE_KEY	<= X(31) & Y(31) & XY_COMPARE;	
	
	with SUM_CASE_KEY select
		A_SUB_IN	<= Y_MANTISSA_ALIGNED when "010",
						Y_MANTISSA_ALIGNED when "100",
						X_MANTISSA_ALIGNED when others;
						
	with SUM_CASE_KEY select
		B_SUB_IN	<= X_MANTISSA_ALIGNED when "010",
						X_MANTISSA_ALIGNED when "100",
						Y_MANTISSA_ALIGNED when others;
						
	with SUM_CASE_KEY select
		OUTPUT_SIGN     <= '0'        when "000",
							    '0'        when "001",
							    '0'        when "011",
							    '0'        when "100",
							    '1'        when others;
						
	with SUM_CASE_KEY(2 downto 1) select
		SUBTRACT_ENABLE <= '0'        when "00",
							    '0'        when "11",
							    '1'        when others;
						
	with SUM_CASE_KEY(2 downto 1) select
		ADD_MSB		    <= CARRY_OUT  when "00",
							    CARRY_OUT  when "11",
							    '0'        when others;
								 
	CASE_ZERO  <= '1' when SUM_RESULT = x"000000" else '0';		
	NORM_INPUT <= ADD_MSB & SUM_RESULT;
	
	CASE_ZERO_SELECT <= CASE_ZERO AND SUBTRACT_ENABLE;
	with CASE_ZERO_SELECT select
		FLOAT_SUM  <= OUTPUT_SIGN & SIGNLESS_OUTPUT              when '0',
		              '0' & x"00" & SIGNLESS_OUTPUT(22 downto 0) when others;
	
	--DEBUG
	DEBUG_SUBTRACT_ENABLE <= SUBTRACT_ENABLE;
	DEBUG_SUM_CASE_KEY    <= SUM_CASE_KEY;
	DEBUG_A_SUB_IN        <= A_SUB_IN;
	DEBUG_B_SUB_IN        <= B_SUB_IN;
	DEBUG_SUM_RESULT      <= SUM_RESULT;
	DEBUG_ADD_MSB         <= ADD_MSB;
	DEBUG_CARRY_OUT       <= CARRY_OUT;
	--=====

end Behavioral;

