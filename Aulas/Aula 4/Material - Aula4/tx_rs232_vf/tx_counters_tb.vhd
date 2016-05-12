library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tx_counters_tb IS
END tx_counters_tb;
 
ARCHITECTURE behavior OF tx_counters_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_counters
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         TX_ENABLE : IN  std_logic;
         K : IN  std_logic_vector(15 downto 0);
         TX_ING : OUT  std_logic;
			TX_DONE : out STD_LOGIC;
         SHIFT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal TX_ENABLE : std_logic := '0';
   signal K : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal TX_ING : std_logic;
	signal TX_DONE : STD_LOGIC;
   signal SHIFT : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_counters PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          TX_ENABLE => TX_ENABLE,
          K => K,
          TX_ING => TX_ING,
			 TX_DONE => TX_DONE,
          SHIFT => SHIFT
        );

   -- Clock process definitions
   LOCAL_CLOCK_process :process
   begin
		LOCAL_CLOCK <= '0';
		wait for LOCAL_CLOCK_period/2;
		LOCAL_CLOCK <= '1';
		wait for LOCAL_CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		K <= "00000000000000101";
      wait until LOCAL_CLOCK = '1';
		wait for LOCAL_CLOCK_period*4;
		
		TX_ENABLE <= '1';
		wait for LOCAL_CLOCK_period;
		TX_ENABLE <= '0';

--      wait for LOCAL_CLOCK_period*66;
--		TX_ENABLE <= '1';
--		wait for LOCAL_CLOCK_period;
--		TX_ENABLE <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
