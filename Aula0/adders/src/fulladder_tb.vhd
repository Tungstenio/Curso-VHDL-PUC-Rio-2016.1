LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY fulladder_tb IS
END fulladder_tb;
 
ARCHITECTURE behavior OF fulladder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fulladder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 

	signal clock : std_logic;
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fulladder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
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

		A   <= '1';
		B   <= '0';
		Cin <= '0';
		wait for 8*clock_period;
		A   <= '0';
		B   <= '1';
		Cin <= '0';
		wait for 8*clock_period;
		A   <= '0';
		B   <= '0';
		Cin <= '1';
		wait for 8*clock_period;
		A   <= '1';
		B   <= '1';
		Cin <= '0';
		wait for 8*clock_period;
		A   <= '1';
		B   <= '0';
		Cin <= '1';
		wait for 8*clock_period;
		A   <= '0';
		B   <= '1';
		Cin <= '1';
		wait for 8*clock_period;
		A   <= '1';
		B   <= '1';
		Cin <= '1';
		wait for 8*clock_period;
		A   <= '0';
		B   <= '0';
		Cin <= '0';
		wait for 8*clock_period;

      wait;
   end process;

END;
