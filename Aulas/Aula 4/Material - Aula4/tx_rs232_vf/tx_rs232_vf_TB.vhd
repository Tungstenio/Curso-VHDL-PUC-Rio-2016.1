--------------------------------------------------------------------------------
-- Create Date:   15:49:40 04/14/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aulas/Aula 4/Material - Aula4/TX_RS232/tx_rs232_vf/tx_rs232_vf_TB.vhd
-- Project Name:  tx_rs232_vf
-- VHDL Test Bench Created by ISE for module: tx_rs232_vf
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tx_rs232_vf_TB IS
END tx_rs232_vf_TB;
 
ARCHITECTURE behavior OF tx_rs232_vf_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_rs232_vf
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         START : IN  std_logic;
         LIM1 : IN  std_logic_vector(15 downto 0);
         LIM2 : IN  std_logic_vector(3 downto 0);
         DATA_IN : IN  std_logic_vector(7 downto 0);
         LOAD : IN  std_logic;
         DATA_OUT : OUT  std_logic;
         COUNTER1 : OUT  std_logic_vector(3 downto 0);
         SHIFT : OUT  std_logic;
         DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal LIM1 : std_logic_vector(15 downto 0) := (others => '0');
   signal LIM2 : std_logic_vector(3 downto 0) := (others => '0');
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal LOAD : std_logic := '0';

 	--Outputs
   signal DATA_OUT : std_logic;
   signal COUNTER1 : std_logic_vector(3 downto 0);
   signal SHIFT : std_logic;
   signal DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_rs232_vf PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          START => START,
          LIM1 => LIM1,
          LIM2 => LIM2,
          DATA_IN => DATA_IN,
          LOAD => LOAD,
          DATA_OUT => DATA_OUT,
          COUNTER1 => COUNTER1,
          SHIFT => SHIFT,
          DONE => DONE
        );

   -- Clock process definitions
   LOCAL_CLOCK_process :process
   begin
		LOCAL_CLOCK <= '1';
		wait for LOCAL_CLOCK_period/2;
		LOCAL_CLOCK <= '0';
		wait for LOCAL_CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for 10 ns;

      wait for LOCAL_CLOCK_period*10;
		LIM1 <= "0000000000000101";
		LIM2 <= "1100";
		DATA_IN <= "10110011";
		LOAD <= '1';
		START <= '1';
      wait for LOCAL_CLOCK_period;
		LOAD <= '0';
		START <= '0';
		wait for LOCAL_CLOCK_period*20;
		START <= '1';								-- Teste de transmissao durante transmissao
		wait for LOCAL_CLOCK_period;
		START <= '0';
		
		wait until DONE = '1';
		wait for LOCAL_CLOCK_period;
		LIM1 <= "0000000000000110";
		DATA_IN <= "01011010";
		LOAD <= '1';
		START <= '1';
      wait for LOCAL_CLOCK_period;
		LOAD <= '0';
		START <= '0';

      wait;
   end process;

END;
