--------------------------------------------------------------------------------
-- Create Date:   16:53:54 04/14/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aulas/Aula 4/Material - Aula4/RX_RS232_BLOCKs/RX_RS232_MAIN_TB.vhd
-- Project Name:  RX_RS232_BLOCKs
-- VHDL Test Bench Created by ISE for module: RX_RS232_MAIN
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
ENTITY RX_RS232_MAIN_TB IS
END RX_RS232_MAIN_TB;
 
ARCHITECTURE behavior OF RX_RS232_MAIN_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RX_RS232_MAIN
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         K : IN  std_logic_vector(12 downto 0);
         RECEIVED_BIT : IN  std_logic;
			
			DEBUG_SHIFT : out STD_LOGIC;
			DEBUG_COUNTER : out  STD_LOGIC_VECTOR (3 downto 0);
			
         OUTPUT_MESSAGE : OUT  std_logic_vector(7 downto 0);
         RX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal K : std_logic_vector(12 downto 0) := (others => '0');
   signal RECEIVED_BIT : std_logic := '1';

 	--Outputs
   signal OUTPUT_MESSAGE : std_logic_vector(7 downto 0);
   signal RX_DONE : std_logic;

	signal DEBUG_SHIFT : STD_LOGIC;
	signal DEBUG_COUNTER : STD_LOGIC_VECTOR (3 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RX_RS232_MAIN PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          K => K,
          RECEIVED_BIT => RECEIVED_BIT,
			 
			 DEBUG_SHIFT => DEBUG_SHIFT,
			 DEBUG_COUNTER => DEBUG_COUNTER,
			 
          OUTPUT_MESSAGE => OUTPUT_MESSAGE,
          RX_DONE => RX_DONE
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
		K <= "0000000000110";
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		
		wait until RX_DONE = '1';
		wait for LOCAL_CLOCK_period;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
		wait for 120 ns;
		RECEIVED_BIT <= '0';
		wait for 120 ns;
		RECEIVED_BIT <= '1';
      wait;
   end process;

END;
