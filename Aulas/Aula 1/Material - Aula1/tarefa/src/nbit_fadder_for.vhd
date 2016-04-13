----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer:       Felipe Calliari
--                 Gustavo Amaral
--                 Rudah Guedes
-- Create Date:    22:53:01 02/01/2016 
-- Module Name:    nbit_fadder_generate - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_fadder_generate is
	Port (
		A      : in   STD_LOGIC_VECTOR(31 downto 0);
		B      : in   STD_LOGIC_VECTOR(31 downto 0);
		Cin    : in   STD_LOGIC;
		Cout   : out  STD_LOGIC;
		Sum    : out  STD_LOGIC_VECTOR(31 downto 0)
	);
end nbit_fadder_generate;

architecture Behavioral of nbit_fadder_generate is

	component fadder
	port (
		A : IN std_logic;
		B : IN std_logic;
		Cin : IN std_logic;          
		Cout : OUT std_logic;
		Sum : OUT std_logic
		);
	end component;
	
	signal carry_vector : std_logic_vector(31 downto 0) := (others => '0');

begin

	F1 : fadder
		port map( 
		A => A(0), 
		B => B(0), 
		Cin => Cin,
		Cout => carry_vector(0),
		Sum => Sum(0)
		);

	gen_fadder:
	for i in 1 to 31 generate
	Fx : fadder
		port map(
			A => A(i),
			B => B(i),
			Cin => carry_vector(i-1),
			Cout => carry_vector(i),
			Sum => Sum(i)
		);
	end generate gen_fadder;
	
	Cout <= carry_vector(31);

end Behavioral;
