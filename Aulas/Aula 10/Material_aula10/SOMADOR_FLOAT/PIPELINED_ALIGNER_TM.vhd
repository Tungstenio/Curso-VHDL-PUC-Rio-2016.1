---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    19:10:21 03/04/2015
-- Module Name:    PIPELINED_ALIGNER_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity PIPELINED_ALIGNER_TM is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		RESET          : IN  STD_LOGIC;
						
		MANTISSA_INPUT : IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
		EXPONENT_INPUT : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
						
		OUTPUT         : OUT STD_LOGIC_VECTOR(30 DOWNTO 0)
	);
end PIPELINED_ALIGNER_TM;

architecture Behavioral of PIPELINED_ALIGNER_TM is

	component PIPELINED_ALIGNER_POSITION_SELECTOR is
		port(
			INPUT  : IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
			
			OUTPUT : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
		);
	end component;

	type MULTIPLE_SHIFT_VECTOR is array (NATURAL RANGE <>) of std_logic_vector(24 downto 0);
	signal SHIFT_VECTOR         : MULTIPLE_SHIFT_VECTOR(0 to 24) := (others => (others => '0'));
	
	signal POSITION_SELECTOR    : std_logic_vector(24 downto 0) := (others => '0');
	signal POSITION_SELECTOR_R0 : std_logic_vector(24 downto 0) := (others => '0');
	
	-- MANTISSA SELECTION
	signal OUTPUT0              : std_logic_vector(24 downto 0) := (others => '0');
	signal OUTPUT1              : std_logic_vector(24 downto 0) := (others => '0');
	signal OUTPUT2              : std_logic_vector(24 downto 0) := (others => '0');
	signal OUTPUT3              : std_logic_vector(24 downto 0) := (others => '0');
	signal OUTPUT4              : std_logic_vector(24 downto 0) := (others => '0');
	
	signal SELECT0              : std_logic := '0';
	signal SELECT1              : std_logic := '0';
	signal SELECT2              : std_logic := '0';
	signal SELECT3              : std_logic := '0';
	signal SELECT4              : std_logic := '0';
	
	signal FINAL_SELECT         : std_logic_vector(4  downto 0) := (others => '0');
	--===================
	
	-- EXPONENT SELECTION
	signal EXPONENT_SELECTOR    : std_logic_vector(24 downto 0) := (others => '0');
	
	signal EXP_OUTPUT0          : std_logic_vector(7  downto 0) := (others => '0');
	signal EXP_OUTPUT1          : std_logic_vector(7  downto 0) := (others => '0');
	signal EXP_OUTPUT2          : std_logic_vector(7  downto 0) := (others => '0');
	signal EXP_OUTPUT3          : std_logic_vector(7  downto 0) := (others => '0');
	signal EXP_OUTPUT4          : std_logic_vector(7  downto 0) := (others => '0');
	
	signal EXP_SELECT0          : std_logic := '0';
	signal EXP_SELECT1          : std_logic := '0';
	signal EXP_SELECT2          : std_logic := '0';
	signal EXP_SELECT3          : std_logic := '0';
	signal EXP_SELECT4          : std_logic := '0';
	
	signal EXP_FINAL_SELECT     : std_logic_vector(4  downto 0) := (others => '0');
	signal EXPONENT_FACTOR      : std_logic_vector(7  downto 0) := (others => '0');
	--===================
	
	signal MANTISSA_OUTPUT      : std_logic_vector(24 downto 0) := (others => '0');
	signal EXPONENT_OUTPUT      : std_logic_vector(7  downto 0) := (others => '0');

begin

	POS_SEL : PIPELINED_ALIGNER_POSITION_SELECTOR
		port map(
			INPUT  => MANTISSA_INPUT,
			
			OUTPUT => POSITION_SELECTOR_R0
		);

	SHIFT_VECTOR(0) <= MANTISSA_INPUT;
	N_BIT_SHIFTER:
	for i in 0 to 23 generate
		SHIFT_VECTOR(i+1) <= SHIFT_VECTOR(i)(23 downto 0) & '0';
	end generate N_BIT_SHIFTER;
	
	process(LOCAL_CLOCK)
	begin
		if(RESET = '1') then
			POSITION_SELECTOR <= (others => '0');
			EXPONENT_SELECTOR <= (others => '0');
		elsif(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			POSITION_SELECTOR <= POSITION_SELECTOR_R0;
			EXPONENT_SELECTOR <= POSITION_SELECTOR_R0;
		end if;
	end process;
	
	-- MANTISSA SELECTION
	with POSITION_SELECTOR(24 downto 20) select
		OUTPUT0 <= SHIFT_VECTOR(0)  when "10000",
				 	  SHIFT_VECTOR(1)  when "01000",
				 	  SHIFT_VECTOR(2)  when "00100",
				 	  SHIFT_VECTOR(3)  when "00010",
				 	  SHIFT_VECTOR(4)  when "00001",
					  (others => '0')  when others;
					 
	with POSITION_SELECTOR(19 downto 15) select
		OUTPUT1 <= SHIFT_VECTOR(5)  when "10000",
					  SHIFT_VECTOR(6)  when "01000",
					  SHIFT_VECTOR(7)  when "00100",
					  SHIFT_VECTOR(8)  when "00010",
					  SHIFT_VECTOR(9)  when "00001",
					  (others => '0')  when others;
					  
	with POSITION_SELECTOR(14 downto 10) select
		OUTPUT2 <= SHIFT_VECTOR(10) when "10000",
					  SHIFT_VECTOR(11) when "01000",
					  SHIFT_VECTOR(12) when "00100",
					  SHIFT_VECTOR(13) when "00010",
					  SHIFT_VECTOR(14) when "00001",
					  (others => '0')  when others;
					  
	with POSITION_SELECTOR(9 downto 5) select
		OUTPUT3 <= SHIFT_VECTOR(15) when "10000",
					  SHIFT_VECTOR(16) when "01000",
					  SHIFT_VECTOR(17) when "00100",
					  SHIFT_VECTOR(18) when "00010",
					  SHIFT_VECTOR(19) when "00001",
					  (others => '0')  when others;
					  
	with POSITION_SELECTOR(4 downto 0) select
		OUTPUT4 <= SHIFT_VECTOR(20) when "10000",
					  SHIFT_VECTOR(21) when "01000",
					  SHIFT_VECTOR(22) when "00100",
					  SHIFT_VECTOR(23) when "00010",
					  SHIFT_VECTOR(24) when "00001",
					  (others => '0')  when others;
					 
	SELECT0 <= POSITION_SELECTOR(24) OR POSITION_SELECTOR(23) OR POSITION_SELECTOR(22) OR POSITION_SELECTOR(21) OR POSITION_SELECTOR(20);
	SELECT1 <= POSITION_SELECTOR(19) OR POSITION_SELECTOR(18) OR POSITION_SELECTOR(17) OR POSITION_SELECTOR(16) OR POSITION_SELECTOR(15);
	SELECT2 <= POSITION_SELECTOR(14) OR POSITION_SELECTOR(13) OR POSITION_SELECTOR(12) OR POSITION_SELECTOR(11) OR POSITION_SELECTOR(10);
	SELECT3 <= POSITION_SELECTOR(9)  OR POSITION_SELECTOR(8)  OR POSITION_SELECTOR(7)  OR POSITION_SELECTOR(6)  OR POSITION_SELECTOR(5);
	SELECT4 <= POSITION_SELECTOR(4)  OR POSITION_SELECTOR(3)  OR POSITION_SELECTOR(2)  OR POSITION_SELECTOR(1)  OR POSITION_SELECTOR(0);
	
	FINAL_SELECT <= SELECT0 & SELECT1 & SELECT2 & SELECT3 & SELECT4;
	
	with FINAL_SELECT select
		MANTISSA_OUTPUT <= OUTPUT0         when "10000",
					          OUTPUT1         when "01000",
					          OUTPUT2         when "00100",
					          OUTPUT3         when "00010",
					          OUTPUT4         when "00001",
					          (others => '0') when others;
	--===================
								 
	-- EXPONENT SELECTION								 
	with EXPONENT_SELECTOR(24 downto 20) select
		EXP_OUTPUT0 <= "00000001"       when "10000",
							"00000000"       when "01000",
				 	      "11111111"       when "00100",
				 	      "11111110"       when "00010",
				 	      "11111101"       when "00001",
					      (others => '0')  when others;
					 
	with EXPONENT_SELECTOR(19 downto 15) select
		EXP_OUTPUT1 <= "11111100"       when "10000",
							"11111011"       when "01000",
					      "11111010"       when "00100",
					      "11111001"       when "00010",
					      "11111000"       when "00001",
					      (others => '0')  when others;
					  
	with EXPONENT_SELECTOR(14 downto 10) select
		EXP_OUTPUT2 <= "11110111"       when "10000",
							"11110110"       when "01000",
					      "11110101"       when "00100",
					      "11110100"       when "00010",
					      "11110011"       when "00001",
					      (others => '0')  when others;
					  
	with EXPONENT_SELECTOR(9 downto 5) select
		EXP_OUTPUT3 <= "11110010"       when "10000",
							"11110001"       when "01000",
					      "11110000"       when "00100",
					      "11101111"       when "00010",
					      "11101110"       when "00001",
					      (others => '0')  when others;
					  
	with EXPONENT_SELECTOR(4 downto 0) select
		EXP_OUTPUT4 <= "11101101"       when "10000",
							"11101100"       when "01000",
					      "11101011"       when "00100",
					      "11101010"       when "00010",
					      "11101001"       when "00001",
					      (others => '0')  when others;
					 
	EXP_SELECT0      <= EXPONENT_SELECTOR(24) OR EXPONENT_SELECTOR(23) OR EXPONENT_SELECTOR(22) OR EXPONENT_SELECTOR(21) OR EXPONENT_SELECTOR(20);
	EXP_SELECT1      <= EXPONENT_SELECTOR(19) OR EXPONENT_SELECTOR(18) OR EXPONENT_SELECTOR(17) OR EXPONENT_SELECTOR(16) OR EXPONENT_SELECTOR(15);
	EXP_SELECT2      <= EXPONENT_SELECTOR(14) OR EXPONENT_SELECTOR(13) OR EXPONENT_SELECTOR(12) OR EXPONENT_SELECTOR(11) OR EXPONENT_SELECTOR(10);
	EXP_SELECT3      <= EXPONENT_SELECTOR(9)  OR EXPONENT_SELECTOR(8)  OR EXPONENT_SELECTOR(7)  OR EXPONENT_SELECTOR(6)  OR EXPONENT_SELECTOR(5);
	EXP_SELECT4      <= EXPONENT_SELECTOR(4)  OR EXPONENT_SELECTOR(3)  OR EXPONENT_SELECTOR(2)  OR EXPONENT_SELECTOR(1)  OR EXPONENT_SELECTOR(0);
	
	EXP_FINAL_SELECT <= EXP_SELECT0 & EXP_SELECT1 & EXP_SELECT2 & EXP_SELECT3 & EXP_SELECT4;
	
	with EXP_FINAL_SELECT select
		EXPONENT_FACTOR <= EXP_OUTPUT0     when "10000",
					          EXP_OUTPUT1     when "01000",
					          EXP_OUTPUT2     when "00100",
					          EXP_OUTPUT3     when "00010",
					          EXP_OUTPUT4     when "00001",
					          (others => '0') when others;
	--===================
	
	EXPONENT_OUTPUT <= EXPONENT_INPUT + EXPONENT_FACTOR;
								 
	OUTPUT <= EXPONENT_OUTPUT & MANTISSA_OUTPUT(23 downto 1);

end Behavioral;