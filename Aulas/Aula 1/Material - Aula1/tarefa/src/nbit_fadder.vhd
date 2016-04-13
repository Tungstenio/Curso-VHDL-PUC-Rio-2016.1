----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer:       Felipe Calliari
--                 Gustavo Amaral
--                 Rudah Guedes
-- Create Date:    22:23:33 02/01/2016 
-- Module Name:    nbit_fadder - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_fadder is
	Port (
		A      : in   STD_LOGIC_VECTOR(3 downto 0);
		B      : in   STD_LOGIC_VECTOR(3 downto 0);
		Cin    : in   STD_LOGIC;
		Cout   : out  STD_LOGIC;
		Sum    : out  STD_LOGIC_VECTOR(3 downto 0)
	);
end nbit_fadder;

architecture Behavioral of nbit_fadder is

	component fadder
	port (
		A : IN std_logic;
		B : IN std_logic;
		Cin : IN std_logic;          
		Cout : OUT std_logic;
		Sum : OUT std_logic
		);
	end component;
	
	signal carry_vector : std_logic_vector(2 downto 0) := (others => '0');

begin

	F1 : fadder
		port map( 
		A => A(0), 
		B => B(0), 
		Cin => Cin,            
		Cout => carry_vector(0), 
		Sum => Sum(0)
		);

	F2 : fadder
		port map( 
		A => A(1), 
		B => B(1),
		Cin => carry_vector(0), 
		Cout => carry_vector(1), 
		Sum => Sum(1)
		);

	F3 : fadder
		port map( 
		A => A(2), 
		B => B(2), 
		Cin => carry_vector(1), 
		Cout => carry_vector(2), 
		Sum => Sum(2)
		);

	F4 : fadder
		port map( 
		A => A(3),
		B => B(3), 
		Cin => carry_vector(2),
		Cout => Cout,          
		Sum => Sum(3)
		);

end Behavioral;
