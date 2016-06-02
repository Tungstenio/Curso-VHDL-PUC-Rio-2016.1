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

entity EXP_ADDER is
	port(		
	     
			X_EXP_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Y_EXP_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			RESULT   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
			);		
end EXP_ADDER;

architecture Behavioral of EXP_ADDER is

begin
	
	RESULT <= X_EXP_IN + Y_EXP_IN - "01111111";

end Behavioral;

