----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    17:58:11 02/04/2015 
-- Module Name:    FLOAT_SUM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FULL_ADDER_24 is
	port(
		A				: IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		B				: IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		SUBTRACT_EN	: IN  STD_LOGIC;			
		
		COUT			: OUT STD_LOGIC;
		OUTPUT		: OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
end FULL_ADDER_24;

architecture Behavioral of FULL_ADDER_24 is

	component ONEBIT_FULL_ADDER is
		port(
			A    		: IN  STD_LOGIC;
			B     	: IN  STD_LOGIC;
			C_IN  	: IN  STD_LOGIC;
			
			S   		: OUT STD_LOGIC;
			C_OUT		: OUT STD_LOGIC
		);
	end component;

	signal CARRY    : std_logic_vector(24 downto 0) := (others => '0');
	signal ADDITION : std_logic_vector(23 downto 0) := (others => '0');
	signal B2		 : std_logic_vector(23 downto 0) := (others => '0');
	
begin

	with SUBTRACT_EN select
		CARRY(0)	<= '0' when '0',
						'1' when others;
						
	with SUBTRACT_EN select
		B2		<= B 		when '0',
					NOT B when others;

	ONEBIT_FULL_ADDER_GEN:
	for i in 0 to 23 generate
		ONE_BIT_FULL_ADDER : ONEBIT_FULL_ADDER
			port map(
				A     => A(i),
				B     => B2(i),
				C_IN  => CARRY(i),
				
				S     => ADDITION(i),
				C_OUT => CARRY(i+1)
			);
	end generate ONEBIT_FULL_ADDER_GEN;
	
	COUT		<= CARRY(24);
	OUTPUT 	<= ADDITION;

end Behavioral;

