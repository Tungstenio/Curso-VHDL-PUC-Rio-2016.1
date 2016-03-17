library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Shift_tb IS
END Shift_tb;
 
ARCHITECTURE behavior OF Shift_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shift
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         DATA_IN : IN  std_logic_vector(7 downto 0);
         DATA_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
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

		DATA_IN <= "00111100";
		wait for LOCAL_CLOCK_period*10;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		
		DATA_IN <= "11111111";
      wait for LOCAL_CLOCK_period*10;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;
		DATA_IN <= DATA_OUT;
      wait for LOCAL_CLOCK_period;

		DATA_IN <= "00000000";
      wait for LOCAL_CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
