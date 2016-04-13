library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY ShiftRegister_tb IS
END ShiftRegister_tb;
 
ARCHITECTURE behavior OF ShiftRegister_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftRegister
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         LOAD : IN  std_logic;
         ENABLE : IN  std_logic;
         DATA_IN : IN  std_logic_vector(7 downto 0);
         DATA_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftRegister PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          LOAD => LOAD,
          ENABLE => ENABLE,
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
      wait for 80 ns;	

      DATA_IN <= "10110011";
		LOAD    <= '1';
		wait for LOCAL_CLOCK_period;
		LOAD    <= '0';
		ENABLE  <= '1';
		wait for LOCAL_CLOCK_period*8;
		ENABLE  <= '0';
		

      -- insert stimulus here 

      wait;
   end process;

END;
