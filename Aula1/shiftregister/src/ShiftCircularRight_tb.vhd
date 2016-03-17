library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY ShiftCircularRight_tb IS
END ShiftCircularRight_tb;
 
ARCHITECTURE behavior OF ShiftCircularRight_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftCircularRight
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         LOAD : IN  std_logic;
         ENABLE : IN  std_logic;
         DATA_IN : IN  std_logic_vector(7 downto 0);
         DATA_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftCircularRight PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          LOAD => LOAD,
          ENABLE => ENABLE,
          DATA_IN => DATA_IN,
          DATA_OUT => DATA_OUT
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		DATA_IN <= "00110101";
		LOAD    <= '1';
		wait for LOCAL_CLOCK_period;
		LOAD    <= '0';
		ENABLE  <= '1';
		wait for 8*LOCAL_CLOCK_period;
		ENABLE  <= '0';

      wait for LOCAL_CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
