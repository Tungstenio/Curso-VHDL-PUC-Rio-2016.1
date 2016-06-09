----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    23:24:15 03/04/2015 
-- Module Name:    PRE_ALIGNER - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PRE_ALIGNER is
	port(
		LOCAL_CLOCK    : IN  STD_LOGIC;
		
		X              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Y              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		EXPONENT       : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
		MANTISSA       : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		
		SHIFT_SELECTOR : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
		SHIFT_X			: OUT STD_LOGIC
	);
end PRE_ALIGNER;

architecture Behavioral of PRE_ALIGNER is

	component EIGHT_BIT_FULL_ADDER is
		generic(
			N : INTEGER := 9
		);
		port(
			A				: IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			B				: IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			SUBTRACT_EN	: IN  STD_LOGIC;			
			
			COUT			: OUT STD_LOGIC;
			OUTPUT		: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	end component;

	signal X_EXP			: std_logic_vector(8  downto 0) := (others => '0');
	signal Y_EXP			: std_logic_vector(8  downto 0) := (others => '0');
	
	signal COUT				: std_logic := '0';
	signal SUB_OUT			: std_logic_vector(8  downto 0) := (others => '0');
	signal NEG_SUB_OUT   : std_logic_vector(7  downto 0) := (others => '0');
	signal Y_IS_BIGGER   : std_logic := '0';
	
	signal PRE_MANTISSA	: std_logic_vector(22 downto 0) := (others => '0');

begin

	X_EXP <= '0' & X(30 downto 23);
	Y_EXP <= '0' & Y(30 downto 23);

	EXP_SUBTRACTOR : EIGHT_BIT_FULL_ADDER
		generic map(
			N => 9
		)
		port map(
			A				=>	X_EXP,
			B				=>	Y_EXP,
			SUBTRACT_EN	=>	'1',
			
			COUT			=> COUT,
			OUTPUT		=>	SUB_OUT
		);
		
	Y_IS_BIGGER <= SUB_OUT(8);
	
	NEG_SUB_OUT <= NOT(SUB_OUT(7 downto 0)) + "1";
	with Y_IS_BIGGER select
		SHIFT_SELECTOR <= SUB_OUT(7 downto 0) when '0',
						      NEG_SUB_OUT         when others;
						  
	with Y_IS_BIGGER select
		EXPONENT       <= X_EXP(7 DOWNTO 0) when '0',
		                  Y_EXP(7 DOWNTO 0) when others;
						
	with Y_IS_BIGGER select
		PRE_MANTISSA   <= X(22 downto 0) when '1',
		                  Y(22 downto 0) when others;
						
	MANTISSA <= '1' & PRE_MANTISSA;
	SHIFT_X  <= SUB_OUT(8);
						
end Behavioral;