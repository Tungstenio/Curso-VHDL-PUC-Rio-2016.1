LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY hadder_tb IS
END hadder_tb;
 
ARCHITECTURE behavior OF hadder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hadder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal C : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 

	signal clock : std_logic;
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hadder PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      A <= '1';
		B <= '0';
		wait for 10*clock_period;
      A <= '0';
		B <= '1';
		wait for 10*clock_period;
      A <= '1';
		B <= '1';
		wait for 10*clock_period;
      A <= '0';
		B <= '0';
		wait for 10*clock_period;

      wait;
   end process;

END;
