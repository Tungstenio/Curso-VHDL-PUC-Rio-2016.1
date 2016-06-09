----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    23:39:48 03/04/2015 
-- Module Name:    PIPELINED_MANTISSA_ALIGNER_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PIPELINED_MANTISSA_ALIGNER_TM is
	port(
		LOCAL_CLOCK      : IN  STD_LOGIC;
		RESET            : IN  STD_LOGIC;
		
		X                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Y                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		ALIGNED_EXPONENT : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
		X_MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		Y_MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
end PIPELINED_MANTISSA_ALIGNER_TM;

architecture Behavioral of PIPELINED_MANTISSA_ALIGNER_TM is

	component PRE_ALIGNER is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			
			X              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			Y              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			
			EXPONENT       : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			
			SHIFT_SELECTOR : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			SHIFT_X			: OUT STD_LOGIC
		);
	end component;
	
	type MULTIPLE_SHIFT_VECTOR is array (NATURAL RANGE <>) of std_logic_vector(23 downto 0);
	signal SHIFT_VECTOR         : MULTIPLE_SHIFT_VECTOR(0 to 24) := (others => (others => '0'));
	
	signal SHIFT_SELECTOR       : std_logic_vector(7  downto 0) := (others => '0');
	signal SHIFT_SELECTOR_R0    : std_logic_vector(7  downto 0) := (others => '0');
	signal SHIFT_X              : std_logic := '0';
	
	signal PRE_EXPONENT         : std_logic_vector(7  downto 0) := (others => '0');
	signal PRE_MANTISSA         : std_logic_vector(23 downto 0) := (others => '0');
	signal PRE_MANTISSA_R0      : std_logic_vector(23 downto 0) := (others => '0');
	
	signal ALIGNED_MANTISSA     : std_logic_vector(23 downto 0) := (others => '0');

begin

	PRE : PRE_ALIGNER
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			               
			X              => X,
			Y              => Y,
			               
			EXPONENT       => PRE_EXPONENT,
			MANTISSA       => PRE_MANTISSA_R0,
			               
			SHIFT_SELECTOR => SHIFT_SELECTOR_R0,
			SHIFT_X			=> SHIFT_X
		);
		
	process(LOCAL_CLOCK,RESET)
	begin
		if(RESET = '1') then
			SHIFT_SELECTOR <= (others => '0');
			PRE_MANTISSA   <= (others => '0');
		elsif(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			SHIFT_SELECTOR <= SHIFT_SELECTOR_R0;
			PRE_MANTISSA   <= PRE_MANTISSA_R0;
		end if;
	end process;
		
	SHIFT_VECTOR(0) <= PRE_MANTISSA;
	N_BIT_SHIFTER:
	for i in 0 to 23 generate
		SHIFT_VECTOR(i+1) <= '0' & SHIFT_VECTOR(i)(23 downto 1);
	end generate N_BIT_SHIFTER;
	
	with SHIFT_SELECTOR select
		ALIGNED_MANTISSA <= SHIFT_VECTOR(0)      when "00000000",
				 	           SHIFT_VECTOR(1)      when "00000001",
				 	           SHIFT_VECTOR(2)      when "00000010",
				 	           SHIFT_VECTOR(3)      when "00000011",
				 	           SHIFT_VECTOR(4)      when "00000100",
					           SHIFT_VECTOR(5)      when "00000101",
					           SHIFT_VECTOR(6)      when "00000110",
					           SHIFT_VECTOR(7)      when "00000111",
					           SHIFT_VECTOR(8)      when "00001000",
					           SHIFT_VECTOR(9)      when "00001001",
					           SHIFT_VECTOR(10)     when "00001010",
					           SHIFT_VECTOR(11)     when "00001011",
					           SHIFT_VECTOR(12)     when "00001100",
					           SHIFT_VECTOR(13)     when "00001101",
					           SHIFT_VECTOR(14)     when "00001110",
					           SHIFT_VECTOR(15)     when "00001111",
					           SHIFT_VECTOR(16)     when "00010000",
					           SHIFT_VECTOR(17)     when "00010001",
					           SHIFT_VECTOR(18)     when "00010010",
					           SHIFT_VECTOR(19)     when "00010011",
					           SHIFT_VECTOR(20)     when "00010100",
					           SHIFT_VECTOR(21)     when "00010101",
					           SHIFT_VECTOR(22)     when "00010110",
					           SHIFT_VECTOR(23)     when "00010111",
					           SHIFT_VECTOR(24)     when "00011000",
					           (others => '0')      when others;
	
	with SHIFT_X select
		ALIGNED_EXPONENT <= PRE_EXPONENT 	     when '0',
								  PRE_EXPONENT 	     when others;
	
	with SHIFT_X select
		X_MANTISSA       <= '1' & X(22 DOWNTO 0) when '0',
							      ALIGNED_MANTISSA    when others;
								
	with SHIFT_X select
		Y_MANTISSA       <= ALIGNED_MANTISSA     when '0',
								  '1' & Y(22 DOWNTO 0) when others;

end Behavioral;