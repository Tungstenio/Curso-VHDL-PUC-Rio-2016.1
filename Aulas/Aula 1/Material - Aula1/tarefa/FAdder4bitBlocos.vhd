----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  11:59:49 03/15/2016 
-- Module Name:  fadder_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FAdder4BitBlocos is
	port(
		LOCAL_CLOCK : IN STD_LOGIC;
	
		A0		: IN  STD_LOGIC;
		A1		: IN  STD_LOGIC;
		A2		: IN  STD_LOGIC;
		A3		: IN  STD_LOGIC;
		B0		: IN  STD_LOGIC;
		B1		: IN  STD_LOGIC;
		B2		: IN  STD_LOGIC;
		B3		: IN  STD_LOGIC;
		CIN	: IN  STD_LOGIC;
		
		S0		: OUT STD_LOGIC;
		S1		: OUT STD_LOGIC;
		S2		: OUT STD_LOGIC;
		S3		: OUT STD_LOGIC;
		COUT	: OUT STD_LOGIC
	);
end FAdder4BitBlocos;

architecture Behavioral of FAdder4BitBlocos is

	signal Cout0 : std_logic := '0';
	signal Cout1 : std_logic := '0';
	signal Cout2 : std_logic := '0';

	COMPONENT fadder
	PORT(
		A 		: IN  std_logic;
		B 		: IN  std_logic;
		Cin 	: IN  std_logic;          
		Sum 	: OUT std_logic;
		Cout 	: OUT std_logic
		);
	END COMPONENT;

begin

	F1 : fadder 
	PORT MAP(
		A => A0,
		B => B0,
		Cin => CIN,
		Sum => S0,
		Cout => Cout0
	);

	F2: fadder 
	PORT MAP(
		A => A1,
		B => B1,
		Cin => Cout0,
		Sum => S1,
		Cout => Cout1
	);

	F3: fadder 
	PORT MAP(
		A => A2,
		B => B2,
		Cin => Cout1,
		Sum => S2,
		Cout => Cout2
	);

	F4: fadder 
	PORT MAP(
		A => A3,
		B => B3,
		Cin => Cout2,
		Sum => S3,
		Cout => COUT
	);

end Behavioral;

