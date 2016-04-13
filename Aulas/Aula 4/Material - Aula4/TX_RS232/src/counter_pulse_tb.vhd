library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY counter_pulse_tb IS
END counter_pulse_tb;
 
ARCHITECTURE behavior OF counter_pulse_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_pulse
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         PROCESS_RUNNING : IN  std_logic;
         LIMIT : IN  std_logic_vector(3 downto 0);
			
			PULSE : IN  std_logic;
			
         ON_LINE_COUNTER : OUT  std_logic_vector(3 downto 0);
         COUNT_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal PROCESS_RUNNING : std_logic := '0';
   signal LIMIT : std_logic_vector(3 downto 0) := (others => '0');
	signal PULSE : std_logic := '0';

 	--Outputs
   signal ON_LINE_COUNTER : std_logic_vector(3 downto 0);
   signal COUNT_DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_pulse PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          PROCESS_RUNNING => PROCESS_RUNNING,
          LIMIT => LIMIT,
			 PULSE => PULSE,
          ON_LINE_COUNTER => ON_LINE_COUNTER,
          COUNT_DONE => COUNT_DONE
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
		PULSE <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		LIMIT <= "1010";
      wait for LOCAL_CLOCK_period;
		PROCESS_RUNNING <= '1';

      wait for LOCAL_CLOCK_period*26;
		PROCESS_RUNNING <= '0';

      wait for LOCAL_CLOCK_period*10;
		PROCESS_RUNNING <= '1';

      wait for LOCAL_CLOCK_period*26;
		PROCESS_RUNNING <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
