----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:00:29 04/07/2016 
-- Module Name:  ex_aula - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex_aula is
	port(
		LOCAL_CLOCK : IN STD_LOGIC;
		START : IN STD_LOGIC;
		STOP : IN STD_LOGIC;
		LIM1 : IN STD_LOGIC_VECTOR(12 downto 0);
		LIM2 : IN STD_LOGIC_VECTOR(3 downto 0);
		
		COUNTER1 : OUT STD_LOGIC_VECTOR(3 downto 0);
		SHIFT		: OUT STD_LOGIC;
		DONE		: OUT STD_LOGIC
		
	);
end ex_aula;

architecture Behavioral of ex_aula is

	COMPONENT biestavel
	PORT(
		LOCAL_CLOCK : IN std_logic;
		START : IN std_logic;
		STOP : IN std_logic;          
		PROCESSING : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter_limit
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ENABLE : IN std_logic;
		BAUD_RATE : IN std_logic_vector(12 downto 0);          
		DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter_pulse
	PORT(
		LOCAL_CLOCK : IN std_logic;
		PROCESS_RUNNING : IN std_logic;
		LIMIT : IN std_logic_vector(3 downto 0);
		PULSE : IN std_logic;          
		ON_LINE_COUNTER : OUT std_logic_vector(3 downto 0);
		COUNT_DONE : OUT std_logic
		);
	END COMPONENT;

	signal ENABLE : std_logic := '0';
	signal PULSE  : std_logic := '0';

begin

	Inst_counter_pulse: counter_pulse PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		PROCESS_RUNNING => ENABLE,
		LIMIT => LIM2,
		PULSE => PULSE,
		ON_LINE_COUNTER => COUNTER1,
		COUNT_DONE => DONE
	);

	Inst_counter_limit: counter_limit PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		ENABLE => ENABLE,
		BAUD_RATE => LIM1,
		DONE => PULSE
	);

	Inst_biestavel: biestavel PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		START => START,
		STOP => STOP,
		PROCESSING => ENABLE
	);
	
	SHIFT <= PULSE;

end Behavioral;

