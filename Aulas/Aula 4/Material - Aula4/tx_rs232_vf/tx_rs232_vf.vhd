----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:00:29 04/07/2016 
-- Module Name:  tarefa - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_rs232_vf is
	port(
		LOCAL_CLOCK : IN STD_LOGIC;
		START : IN STD_LOGIC;
		LIM1 : IN STD_LOGIC_VECTOR(15 downto 0);
		LIM2 : IN STD_LOGIC_VECTOR(3 downto 0);
		DATA_IN : IN std_logic_vector(7 downto 0);
		LOAD : IN std_logic;
		
		DATA_OUT : OUT std_logic;
		COUNTER1 : OUT STD_LOGIC_VECTOR(3 downto 0);
		SHIFT		: OUT STD_LOGIC;
		DONE		: OUT STD_LOGIC
		
	);
end tx_rs232_vf;

architecture Behavioral of tx_rs232_vf is

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
		K : IN std_logic_vector(15 downto 0);          
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

	COMPONENT ShiftRegister_TX
	PORT(
		LOCAL_CLOCK : IN std_logic;
		LOAD : IN std_logic;
		ENABLE : IN std_logic;
		DATA_IN : IN std_logic_vector(7 downto 0);          
		DATA_OUT : OUT std_logic
		);
	END COMPONENT;

	signal ENABLE 		: std_logic := '0';
	signal PULSE  		: std_logic := '0';
	signal DONE_R0		: std_logic := '0';

begin

	Inst_counter_pulse: counter_pulse PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		PROCESS_RUNNING => ENABLE,
		LIMIT => LIM2,
		PULSE => PULSE,
		ON_LINE_COUNTER => COUNTER1,
		COUNT_DONE => DONE_R0
	);

	Inst_counter_limit: counter_limit PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		ENABLE => ENABLE,
		K => LIM1,
		DONE => PULSE
	);

	Inst_biestavel: biestavel PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		START => START,
		STOP => DONE_R0,
		PROCESSING => ENABLE
	);
	
	Inst_ShiftRegister: ShiftRegister_TX PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		LOAD => LOAD,
		ENABLE => PULSE,
		DATA_IN => DATA_IN,
		DATA_OUT => DATA_OUT
	);
	
	SHIFT <= PULSE;
	DONE  <= DONE_R0;

end Behavioral;

