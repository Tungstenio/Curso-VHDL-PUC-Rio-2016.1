library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY biestavel_tb IS
END biestavel_tb;
 
ARCHITECTURE behavior OF biestavel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT biestavel
    PORT(
			LOCAL_CLOCK : IN std_logic;
         START : IN  std_logic;
         STOP : IN  std_logic;
         PROCESSING : OUT  std_logic
        );
    END COMPONENT;
    
	signal clock : std_logic := '0';
	
   --Inputs
   signal START : std_logic := '0';
   signal STOP : std_logic := '0';

 	--Outputs
   signal PROCESSING : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: biestavel PORT MAP (
			 LOCAL_CLOCK => clock,
          START => START,
          STOP => STOP,
          PROCESSING => PROCESSING
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
     
      wait for 100 ns;
		
		START <= '1';
		wait for 20 ns;
		START <= '0';
		wait for 200 ns;
		STOP <= '1';
		wait for 20 ns;
		STOP <= '0';
      
		wait for 60 ns;	
		
		START <= '1';
		wait for 20 ns;
		START <= '0';
		wait for 200 ns;
		STOP <= '1';
		wait for 20 ns;
		STOP <= '0';

		wait for 60 ns;	

   end process;

END;
