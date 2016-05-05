--------------------------------------------------------------------------------
-- Create Date:   14:50:24 05/03/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Em Desenvolvimento/Aula6/tarefa/ROM_Tx/ROM_Tx_TB.vhd
-- Project Name:  ROM_Tx
-- VHDL Test Bench Created by ISE for module: ROM_Tx
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY ROM_Tx_TB IS
	 Generic(
      DATA_SIZE      : integer := 8;
      ADDRESS_SIZE   : integer := 2
	 );
END ROM_Tx_TB;
 
ARCHITECTURE behavior OF ROM_Tx_TB IS 
  
    COMPONENT ROM_Tx
	 Generic(
      DATA_SIZE      : integer := 8;
      ADDRESS_SIZE   : integer := 2
	 );
	 PORT(
      LOCAL_CLOCK	: IN STD_LOGIC;
		START			: IN STD_LOGIC;
		K				: IN STD_LOGIC_VECTOR(15 downto 0);
		
		DEBUG_PROCESSING  : OUT STD_LOGIC;
		DEBUG_COUNTER		: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		DEBUG_TRANSMIT		: OUT STD_LOGIC;
		DEBUG_ROM_DATA_AD	: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		DEBUG_ROM_DATA		: OUT STD_LOGIC_VECTOR(DATA_SIZE-1 downto 0);
		DEBUG_LIMIT			: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		
		TX_DATA		: OUT STD_LOGIC;
		DONE			: OUT STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal K : std_logic_vector(15 downto 0) := (others => '0');

 	--Debugs
   signal DEBUG_PROCESSING : std_logic;
   signal DEBUG_COUNTER : std_logic_vector(ADDRESS_SIZE downto 0);
   signal DEBUG_TRANSMIT : std_logic;
	signal DEBUG_ROM_DATA_AD	: std_logic_vector(ADDRESS_SIZE-1 downto 0);
	signal DEBUG_ROM_DATA		: std_logic_vector(DATA_SIZE-1 downto 0);
	signal DEBUG_LIMIT			: std_logic_vector(ADDRESS_SIZE downto 0);
			
	--Outputs
   signal TX_DATA : std_logic;
   signal DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_Tx PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          START => START,
          K => K,
			 
          DEBUG_PROCESSING => DEBUG_PROCESSING,
          DEBUG_COUNTER => DEBUG_COUNTER,
          DEBUG_TRANSMIT => DEBUG_TRANSMIT,
			 DEBUG_ROM_DATA_AD => DEBUG_ROM_DATA_AD,
			 DEBUG_ROM_DATA => DEBUG_ROM_DATA,	
			 DEBUG_LIMIT => DEBUG_LIMIT,
			 
          TX_DATA => TX_DATA,
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
	
      wait for LOCAL_CLOCK_period*10;
		
		K 		<= x"0006";
		START <= '1';
		wait for LOCAL_CLOCK_period;
		START <= '0';
		
		wait until DONE = '1';
		wait for LOCAL_CLOCK_period;


      wait;
   end process;

END;
