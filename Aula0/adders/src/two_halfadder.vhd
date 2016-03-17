----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:56:24 02/29/2016 
-- Module Name:  two_halfadder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity two_halfadder is
	PORT (
		A		: in  std_logic;
		B		: in  std_logic;
		Cin	: in  std_logic;
		S		: out std_logic;
		Cout	: out std_logic
	);
end two_halfadder;

architecture Behavioral of two_halfadder is

	COMPONENT hadder
		PORT(
			A : IN std_logic;
			B : IN std_logic;          
			S : OUT std_logic;
			C : OUT std_logic
		);
	END COMPONENT;

	signal C_H1       : std_logic := '0';
	signal S_H1       : std_logic := '0';
	
	signal C_H2       : std_logic := '0';
	signal S_H2       : std_logic := '0';

begin

	hadder_1 : hadder PORT MAP(
		A => A,
		B => B,
		S => S_H1,
		C => C_H1
	);

	hadder_2 : hadder PORT MAP(
		A => S_H1,
		B => Cin,
		S => S_H2,
		C => C_H2
	);

	Cout <= C_H1 OR C_H2;
	S    <= S_H2;

end Behavioral;

