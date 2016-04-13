----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:34:12 02/29/2016 
-- Module Name:  hadder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hadder is
	Port (
		A : in  STD_LOGIC;
		B : in  STD_LOGIC;
		S : out  STD_LOGIC;
		C : out  STD_LOGIC
	);
end hadder;

architecture Behavioral of hadder is

begin

	S <= A XOR B;
	C <= A AND B;

end Behavioral;

