----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer:       Felipe Calliari
--                 Gustavo Amaral
--                 Rudah Guedes
-- Create Date:    00:40:03 01/12/2016 
-- Module Name:    fadder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fadder is
	Port (
		A      : in   STD_LOGIC;
		B      : in   STD_LOGIC;
		Cin    : in   STD_LOGIC;
		
		Sum    : out  STD_LOGIC;
		Cout   : out  STD_LOGIC
	);
end fadder;

architecture Behavioral of fadder is

	signal X : std_logic := '0';
	signal Y : std_logic := '0';
	signal Z : std_logic := '0';
	
begin

	Cout <= Y or Z;
	Sum  <= Cin xor X;

	X <= a xor b; -- VHDL não é case sensitive (não faz diferença se é maiúsculo ou minúsculo)!!
	Y <= A and B;
	Z <= X and cin;

end Behavioral;
