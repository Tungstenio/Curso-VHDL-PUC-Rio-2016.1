library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador_pulsos_tb IS
END contador_pulsos_tb;
 
ARCHITECTURE behavior OF contador_pulsos_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador_pulsos
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         ENABLE : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(12 downto 0);
         DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador_pulsos PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          ENABLE => ENABLE,
          BAUD_RATE => BAUD_RATE,
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
      -- hold reset state for 100 ns.
      wait for 50 ns;
		wait until LOCAL_CLOCK = '1';
		
		BAUD_RATE <= "0000000000101"; -- 10 MHz
		ENABLE    <= '1';
		
		wait for 900 ns;
		ENABLE    <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
