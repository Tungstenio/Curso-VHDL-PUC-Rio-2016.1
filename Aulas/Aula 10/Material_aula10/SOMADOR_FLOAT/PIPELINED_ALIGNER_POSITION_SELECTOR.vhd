---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    19:22:25 03/04/2015 
-- Module Name:    PIPELINED_ALIGNER_POSITION_SELECTOR - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity PIPELINED_ALIGNER_POSITION_SELECTOR is
	port(
		INPUT  : IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
		
		OUTPUT : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
	);
end PIPELINED_ALIGNER_POSITION_SELECTOR;

architecture Behavioral of PIPELINED_ALIGNER_POSITION_SELECTOR is
	
	component PIPELINED_ALIGNER_POSITION_CHAIN is
		port(
			INPUT     : IN  STD_LOGIC;
			CARRY_IN  : IN  STD_LOGIC;
			CARRY_OUT : OUT STD_LOGIC;
			OUTPUT    : OUT STD_LOGIC
		);
	end component;
	
	signal CARRY_VECTOR : std_logic_vector(25 downto 0);

begin

	CARRY_VECTOR(25) <= '0';

	N_POSITION_CHAIN:
	for i in 24 downto 0 generate
		CHAIN : PIPELINED_ALIGNER_POSITION_CHAIN
			port map(
				INPUT     => INPUT(i),
				CARRY_IN  => CARRY_VECTOR(i+1),
				CARRY_OUT => CARRY_VECTOR(i),
				OUTPUT    => OUTPUT(i)
			);
	end generate N_POSITION_CHAIN;

end Behavioral;

