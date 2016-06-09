---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    19:23:30 03/04/2015 
-- Module Name:    PIPELINED_ALIGNER_POSITION_CHAIN - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity PIPELINED_ALIGNER_POSITION_CHAIN is
	port(
		INPUT     : IN  STD_LOGIC;
		CARRY_IN  : IN  STD_LOGIC;
		CARRY_OUT : OUT STD_LOGIC;
		OUTPUT    : OUT STD_LOGIC
	);
end PIPELINED_ALIGNER_POSITION_CHAIN;

architecture Behavioral of PIPELINED_ALIGNER_POSITION_CHAIN is

begin

	with CARRY_IN select
		CARRY_OUT <= INPUT when '0',
		             '1'   when others;
						 
	with CARRY_IN select
		OUTPUT    <= INPUT when '0',
		             '0'        when others;

end Behavioral;

