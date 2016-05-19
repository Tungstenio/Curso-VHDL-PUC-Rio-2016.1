--------------------------------------------------------------------------------
-- Create Date:   15:04:47 05/06/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Em Desenvolvimento/Aula7/tarefa/ROM_TX_RX_RAM_v2/ROM_TX_RX_RAM_v2_TB.vhd
-- Project Name:  ROM_TX_RX_RAM_v2
-- VHDL Test Bench Created by ISE for module: ROM_TX_RX_RAM_v2
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_TX_RX_RAM_v2_TB IS
	generic(
		DATA_SIZE               : integer := 8;
		ADDRESS_SIZE            : integer := 3
	);
END ROM_TX_RX_RAM_v2_TB;
 
ARCHITECTURE behavior OF ROM_TX_RX_RAM_v2_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_TX_RX_RAM_v2
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         TRANSFER : IN  std_logic;
         K : IN  std_logic_vector(15 downto 0);
			
         DEBUG_ROM_DATA_ADDRESS : OUT  std_logic_vector(ADDRESS_SIZE-1 downto 0);
         DEBUG_ROM_DATA_OUTPUT : OUT  std_logic_vector(DATA_SIZE-1 downto 0);
         DEBUG_RAM_DATA_ADDRESS : OUT  std_logic_vector(ADDRESS_SIZE-1 downto 0);
         DEBUG_ROM_ENABLE : OUT  std_logic;
         DEBUG_READING_RAM : OUT  std_logic;
         DEBUG_TX_DONE : OUT  std_logic;
         DEBUG_RX_DONE : OUT  std_logic;
			DEBUG_ROM_COUNTER	: OUT std_logic_vector(ADDRESS_SIZE downto 0);
			DEBUG_RAM_COUNTER	: OUT std_logic_vector(ADDRESS_SIZE downto 0);
			
         DONE : OUT  std_logic;
         RAM_DATA_OUTPUT : OUT  std_logic_vector(DATA_SIZE-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal TRANSFER : std_logic := '0';
   signal K : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal DEBUG_ROM_DATA_ADDRESS : std_logic_vector(ADDRESS_SIZE-1 downto 0);
   signal DEBUG_ROM_DATA_OUTPUT : std_logic_vector(DATA_SIZE-1 downto 0);
   signal DEBUG_RAM_DATA_ADDRESS : std_logic_vector(ADDRESS_SIZE-1 downto 0);
   signal DEBUG_ROM_ENABLE : std_logic;
   signal DEBUG_READING_RAM : std_logic;
   signal DEBUG_TX_DONE : std_logic;
   signal DEBUG_RX_DONE : std_logic;
	signal DEBUG_ROM_COUNTER: std_logic_vector(ADDRESS_SIZE downto 0);
	signal DEBUG_RAM_COUNTER	: std_logic_vector(ADDRESS_SIZE downto 0);
	
   signal DONE : std_logic;
   signal RAM_DATA_OUTPUT : std_logic_vector(DATA_SIZE-1 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_TX_RX_RAM_v2 PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          TRANSFER => TRANSFER,
          K => K,
			 
          DEBUG_ROM_DATA_ADDRESS => DEBUG_ROM_DATA_ADDRESS,
          DEBUG_ROM_DATA_OUTPUT => DEBUG_ROM_DATA_OUTPUT,
          DEBUG_RAM_DATA_ADDRESS => DEBUG_RAM_DATA_ADDRESS,
          DEBUG_ROM_ENABLE => DEBUG_ROM_ENABLE,
          DEBUG_READING_RAM => DEBUG_READING_RAM,
          DEBUG_TX_DONE => DEBUG_TX_DONE,
          DEBUG_RX_DONE => DEBUG_RX_DONE,
			 DEBUG_ROM_COUNTER => DEBUG_ROM_COUNTER,
			 DEBUG_RAM_COUNTER => DEBUG_RAM_COUNTER,
			 
          DONE => DONE,
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

--      wait until LOCAL_CLOCK = '1';
      wait for LOCAL_CLOCK_period*10;
		
		K <= X"0006";
		TRANSFER <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSFER <= '0';

      wait;
   end process;

END;
