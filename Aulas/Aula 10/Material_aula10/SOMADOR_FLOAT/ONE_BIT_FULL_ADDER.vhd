----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    14:06:49 11/19/2014 
-- Module Name:    FULL_ADDER - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ONEBIT_FULL_ADDER is
	port(
		A     : IN  STD_LOGIC;
		B     : IN  STD_LOGIC;
		C_IN  : IN  STD_LOGIC;
		
		S     : OUT STD_LOGIC;
		C_OUT : OUT STD_LOGIC
	);
end ONEBIT_FULL_ADDER;

architecture Behavioral of ONEBIT_FULL_ADDER is

	signal AUX_1 : std_logic := '0';
	signal AUX_2 : std_logic := '0';
	signal AUX_3 : std_logic := '0';

begin

	AUX_1 <= A XOR B;
	AUX_2 <= A AND B;
	AUX_3 <= AUX_1 AND C_IN;

	C_OUT <= AUX_2 OR  AUX_3;
	S     <= AUX_1 XOR C_IN;

end Behavioral;

