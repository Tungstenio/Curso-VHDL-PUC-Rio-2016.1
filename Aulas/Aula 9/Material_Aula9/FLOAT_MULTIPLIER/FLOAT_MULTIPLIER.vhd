----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    16:33:38 03/16/2015 
-- Module Name:    POLY_DIST_ARBITRARY_MULTIPLIER - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FLOAT_MULTIPLIER is
	port(
		ENABLE_MULTIPLIER : IN STD_LOGIC;
		LOCAL_CLOCK			: IN STD_LOGIC;
		
		X_IN 					: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		Y_IN 					: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			
		RESULT 				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		MULT_DONE   		: OUT STD_LOGIC
	);
end FLOAT_MULTIPLIER;

architecture Behavioral of FLOAT_MULTIPLIER is

	COMPONENT ARBITRARY_MULTIPLIER IS
		PORT (
			clk : IN  STD_LOGIC;
			
			a   : IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
			b   : IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
			
			p   : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
		);
	END COMPONENT;
	
	component NORM is
		port(	
			MANTISSA	:	IN	 STD_LOGIC_VECTOR(24 DOWNTO 0);
			EXP		:	IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			RESULT	:	OUT STD_LOGIC_VECTOR(30 DOWNTO 0)
		);		
	end component;
	
	signal SYNC_IN_R2         : STD_LOGIC := '0';
	signal SIGNAL_OUT         : STD_LOGIC := '0';

	-- ADDER
	signal X_EXP_IN           : STD_LOGIC_VECTOR(7  DOWNTO 0):= (others => '0');
	signal Y_EXP_IN           : STD_LOGIC_VECTOR(7  DOWNTO 0):= (others => '0');
	signal EXP_RESULT         : STD_LOGIC_VECTOR(7  DOWNTO 0):= (others => '0');
	
	-- NORMALIZER
	signal EXP_RESULT_NORM    : STD_LOGIC_VECTOR(7  DOWNTO 0):= (others => '0');
	signal NORMED_MANTISSA    : STD_LOGIC_VECTOR(30 DOWNTO 0):= (others => '0');
	
	-- MULTIPLIER
	signal X_MANTISSA         : STD_LOGIC_VECTOR(23 DOWNTO 0):= (others => '0');
	signal Y_MANTISSA         : STD_LOGIC_VECTOR(23 DOWNTO 0):= (others => '0');
	signal PRODUCT_MANTISSA   : STD_LOGIC_VECTOR(24 DOWNTO 0):= (others => '0');
	
	signal NULL_CHECK_X       : STD_LOGIC := '0';
	signal NULL_CHECK_Y       : STD_LOGIC := '0';
	signal NULL_CHECK         : STD_LOGIC := '0'; 
	
	signal MANTISSA_XY        : STD_LOGIC_VECTOR(24 DOWNTO 0) := (others => '0');
	
begin

	MANTISSA_XY	<= PRODUCT_MANTISSA;

	X_EXP_IN   <=      X_IN(30 DOWNTO 23);
	X_MANTISSA <= '1'& X_IN(22 DOWNTO  0);
	Y_EXP_IN   <=      Y_IN(30 DOWNTO 23);
	Y_MANTISSA <= '1'& Y_IN(22 DOWNTO  0);
	
	EXP_RESULT <= X_EXP_IN + Y_EXP_IN - "01111111";
	
	NORMALIZER	:	NORM
		port map(
			MANTISSA	=>	MANTISSA_XY,
			EXP		=>	EXP_RESULT_NORM,
			RESULT	=>	NORMED_MANTISSA
		);
					
	MULTIPLIER : ARBITRARY_MULTIPLIER
		port map(
			clk => LOCAL_CLOCK,
			
			a   => X_MANTISSA,
			b   => Y_MANTISSA,
			
			p   => PRODUCT_MANTISSA
		);	
		
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			SYNC_IN_R2 <= ENABLE_MULTIPLIER;
			MULT_DONE  <= SYNC_IN_R2;
		end if;
	end process;

	NULL_CHECK_X    <= '1' when X_EXP_IN = "00000000" else '0';
	NULL_CHECK_Y    <= '1' when Y_EXP_IN = "00000000" else '0';
	NULL_CHECK      <= NULL_CHECK_X OR NULL_CHECK_Y;
	
	EXP_RESULT_NORM <= EXP_RESULT;
	SIGNAL_OUT		 <= X_IN(31) XOR Y_IN(31);	
	
	with NULL_CHECK select
		RESULT <= SIGNAL_OUT & NORMED_MANTISSA when '0',
				    (others=>'0') when others;
								
end Behavioral;