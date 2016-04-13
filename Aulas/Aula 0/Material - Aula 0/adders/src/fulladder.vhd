----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:39:30 02/29/2016 
-- Module Name:  fulladder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fulladder is
	PORT (
		A		: in  std_logic;
		B		: in  std_logic;
		Cin	: in  std_logic;
		S		: out std_logic;
		Cout	: out std_logic
	);
end fulladder;

architecture Behavioral of fulladder is

	signal A_XOR_B         : std_logic := '0';
	signal A_AND_B         : std_logic := '0';
	signal A_XOR_B_AND_Cin : std_logic := '0';

begin

	A_XOR_B         <= A XOR B;
	A_AND_B         <= A AND B;
	A_XOR_B_AND_Cin <= A_XOR_B AND Cin;
	
	S    <= A_XOR_B XOR Cin;
	Cout <= A_AND_B OR A_XOR_B_AND_Cin;

end Behavioral;

