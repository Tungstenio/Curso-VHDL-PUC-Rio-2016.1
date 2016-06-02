----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Rafael Aoude e Rudah Maciel
-- Create Date:    18:54:44 01/23/2015 
-- Module Name:    CORDIC_UNIT - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NORM is
	port(
		MANTISSA	:	IN	 STD_LOGIC_VECTOR(24 DOWNTO 0);
		EXP		:	IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
		
		RESULT	:	OUT STD_LOGIC_VECTOR(30 DOWNTO 0)
	);
end NORM;

architecture Behavioral of NORM is
	
	signal NORMED  : STD_LOGIC_VECTOR(22 DOWNTO 0);
	signal EXP_OUT : STD_LOGIC_VECTOR(7  DOWNTO 0);

begin

	with MANTISSA(24) select
		EXP_OUT 	<=	EXP + '1' when '1',
						EXP		 when others;
		
	with MANTISSA(24 DOWNTO 23) select
		NORMED <= MANTISSA(22 DOWNTO 0) when "01",
                MANTISSA(23 DOWNTO 1) when others;

	RESULT <= EXP_OUT(7 DOWNTO 0) & NORMED;


end Behavioral;

