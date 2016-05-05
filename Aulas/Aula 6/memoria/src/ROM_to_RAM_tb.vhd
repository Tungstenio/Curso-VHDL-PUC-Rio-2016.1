--------------------------------------------------------------------------------
-- Create Date:   15:47:28 03/09/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aula5/memoria/src/ROM_to_RAM_tb.vhd
-- Project Name:  memoria
-- VHDL Test Bench Created by ISE for module: ROM_to_RAM
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_to_RAM_tb IS
END ROM_to_RAM_tb;
 
ARCHITECTURE behavior OF ROM_to_RAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_to_RAM
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         ENABLE : IN  std_logic;
			
			DEBUG_RUNNING				: out  STD_LOGIC;
			DEBUG_RUNNING_R1			: out  STD_LOGIC;
			DEBUG_FLAG					: out  STD_LOGIC;
			
         ROM_DATA_ADDRESS : OUT  std_logic_vector(4 downto 0);
         ROM_DATA_OUTPUT : OUT  std_logic_vector(15 downto 0);
         RAM_DATA_ADDRESS : OUT  std_logic_vector(4 downto 0);
         RAM_DATA_INPUT : OUT  std_logic_vector(15 downto 0);
         RAM_DATA_OUTPUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal ENABLE : std_logic := '0';

 	--Outputs
   signal ROM_DATA_ADDRESS : std_logic_vector(4 downto 0);
   signal ROM_DATA_OUTPUT : std_logic_vector(15 downto 0);
   signal RAM_DATA_ADDRESS : std_logic_vector(4 downto 0);
   signal RAM_DATA_INPUT : std_logic_vector(15 downto 0);
   signal RAM_DATA_OUTPUT : std_logic_vector(15 downto 0);
	
	--Debug
	signal DEBUG_RUNNING				:  STD_LOGIC := '0';
	signal DEBUG_RUNNING_R1			:  STD_LOGIC := '0';
	signal DEBUG_FLAG					:  STD_LOGIC := '0';

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_to_RAM PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          ENABLE => ENABLE,
			 
			 DEBUG_RUNNING		=> DEBUG_RUNNING,
			 DEBUG_RUNNING_R1	=> DEBUG_RUNNING_R1,	
			 DEBUG_FLAG			=> DEBUG_FLAG,
			 			 
          ROM_DATA_ADDRESS => ROM_DATA_ADDRESS,
          ROM_DATA_OUTPUT => ROM_DATA_OUTPUT,
          RAM_DATA_ADDRESS => RAM_DATA_ADDRESS,
          RAM_DATA_INPUT => RAM_DATA_INPUT,
          RAM_DATA_OUTPUT => RAM_DATA_OUTPUT
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
      -- hold reset state for 10 ns.
      wait for 10 ns;

      wait until LOCAL_CLOCK = '1';
      wait for LOCAL_CLOCK_period*10;

		ENABLE <= '1';
		wait for LOCAL_CLOCK_period*200;
		ENABLE <= '0';
		
		wait for LOCAL_CLOCK_period*10;
		ENABLE <= '1';
		wait for LOCAL_CLOCK_period*200;
		ENABLE <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
