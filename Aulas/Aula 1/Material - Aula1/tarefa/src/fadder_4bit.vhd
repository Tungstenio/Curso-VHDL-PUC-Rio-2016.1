----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  13:56:13 03/08/2016 
-- Module Name:  fadder_4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fadder_4bit is
	PORT (
		A0		: in  std_logic;
		A1		: in  std_logic;
		A2		: in  std_logic;
		A3		: in  std_logic;
		B0		: in  std_logic;
		B1		: in  std_logic;
		B2		: in  std_logic;
		B3		: in  std_logic;
		Cin	: in  std_logic;
		
		S0		: out std_logic;
		S1		: out std_logic;
		S2		: out std_logic;
		S3		: out std_logic;
		Cout	: out std_logic
	);
end fadder_4bit;

architecture Behavioral of fadder_4bit is

	signal Cout0 : std_logic := '0';
	signal Cout1 : std_logic := '0';
	signal Cout2 : std_logic := '0';

begin

	S0        <= (A0 XOR B0) XOR Cin;
	Cout0     <= (A0 AND B0) OR ((A0 XOR B0) AND Cin);
	
	S1        <= (A1 XOR B1) XOR Cout0;
	Cout1     <= (A1 AND B1) OR ((A1 XOR B1) AND Cout0);

	S2        <= (A2 XOR B2) XOR Cout1;
	Cout2     <= (A2 AND B2) OR ((A2 XOR B2) AND Cout1);

	S3        <= (A3 XOR B3) XOR Cout2;
	Cout      <= (A3 AND B3) OR ((A3 XOR B3) AND Cout2);

end Behavioral;

