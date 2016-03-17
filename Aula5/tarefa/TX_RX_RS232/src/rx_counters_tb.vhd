----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
-- Create Date:  12:08:28 03/02/2016 
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY rx_counters_tb IS
END rx_counters_tb;
 
ARCHITECTURE behavior OF rx_counters_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx_counters
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         RX_ENABLE : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
         RX_ING : OUT  std_logic;
         RX_DONE : OUT  std_logic;
         SHIFT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal RX_ENABLE : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal RX_ING : std_logic;
   signal RX_DONE : std_logic;
   signal SHIFT : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx_counters PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          RX_ENABLE => RX_ENABLE,
          BAUD_RATE => BAUD_RATE,
          RX_ING => RX_ING,
          RX_DONE => RX_DONE,
          SHIFT => SHIFT
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
		BAUD_RATE <= "00000000000110";
		RX_ENABLE <= '1';
		wait for LOCAL_CLOCK_period;
		RX_ENABLE <= '0';
		

      wait;
   end process;

END;
