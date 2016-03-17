library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY contador_simples_tb IS
END contador_simples_tb;
 
ARCHITECTURE behavior OF contador_simples_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador_simples
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         ENABLE : IN  std_logic;
         LOAD : IN  std_logic;
         RESET : IN  std_logic;
         DATA_IN : IN  std_logic_vector(3 downto 0);
         DATA_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal RESET : std_logic := '0';
   signal DATA_IN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador_simples PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          ENABLE => ENABLE,
          LOAD => LOAD,
          RESET => RESET,
          DATA_IN => DATA_IN,
          DATA_OUT => DATA_OUT
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		wait until LOCAL_CLOCK = '1';

		ENABLE <= '1';
      wait for LOCAL_CLOCK_period*10;
		ENABLE <= '0';
		wait for LOCAL_CLOCK_period*2;
		RESET <= '1';
		wait for LOCAL_CLOCK_period;
		RESET <= '0';
		wait for LOCAL_CLOCK_period*2;
		DATA_IN <= "0111";
		LOAD <= '1';
		wait for LOCAL_CLOCK_period;
		LOAD <= '0';
		ENABLE <= '1';
      wait for LOCAL_CLOCK_period*10;
		ENABLE <= '0';

		DATA_IN <= "0000";
		RESET <= '1';
		wait for LOCAL_CLOCK_period;
		RESET <= '0';
		
		
		
      wait;
   end process;

END;
