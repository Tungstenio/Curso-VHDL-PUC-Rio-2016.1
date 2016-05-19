--------------------------------------------------------------------------------
-- Create Date:   17:16:52 03/31/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/CLEAN/Aula6/ROM_TX_RX_RAM/ROM_TX_RX_RAM_TB.vhd
-- Project Name:  ROM_TX_RX_RAM
-- VHDL Test Bench Created by ISE for module: ROM_TX_RX_RAM
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_TX_RX_RAM_TB IS
END ROM_TX_RX_RAM_TB;
 
ARCHITECTURE behavior OF ROM_TX_RX_RAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_TX_RX_RAM
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         ENABLE : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
			
			DEBUG_RUNNING 		: OUT STD_LOGIC;
			DEBUG_RUNNING_R1  : OUT STD_LOGIC;
			DEBUG_TRANSMIT		: OUT STD_LOGIC;
			
         ROM_DATA_ADDRESS : OUT  std_logic_vector(4 downto 0);
         ROM_DATA_OUTPUT : OUT  std_logic_vector(7 downto 0);
         RAM_DATA_ADDRESS : OUT  std_logic_vector(4 downto 0);
         RAM_DATA_INPUT : OUT  std_logic_vector(7 downto 0);
         RAM_DATA_OUTPUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal ROM_DATA_ADDRESS : std_logic_vector(4 downto 0);
   signal ROM_DATA_OUTPUT : std_logic_vector(7 downto 0);
   signal RAM_DATA_ADDRESS : std_logic_vector(4 downto 0);
   signal RAM_DATA_INPUT : std_logic_vector(7 downto 0);
   signal RAM_DATA_OUTPUT : std_logic_vector(7 downto 0);
	
	--Debugs
	signal DEBUG_RUNNING 	:  STD_LOGIC;
	signal DEBUG_RUNNING_R1 :  STD_LOGIC;
	signal DEBUG_TRANSMIT	:  STD_LOGIC;
	
   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_TX_RX_RAM PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          ENABLE => ENABLE,
          BAUD_RATE => BAUD_RATE,
			 
			 DEBUG_RUNNING 	=> DEBUG_RUNNING, 	
			 DEBUG_RUNNING_R1 => DEBUG_RUNNING_R1,
			 DEBUG_TRANSMIT	=> DEBUG_TRANSMIT,
			 
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

      BAUD_RATE <= "00000000000101";
		ENABLE <= '1';		
		wait for LOCAL_CLOCK_period*20000;
		ENABLE <= '0';

      wait;
   end process;

END;
