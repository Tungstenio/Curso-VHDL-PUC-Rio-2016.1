library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY generic_ROM_clk_tb IS
END generic_ROM_clk_tb;
 
ARCHITECTURE behavior OF generic_ROM_clk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generic_ROM_clk
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         ROM_ENABLE : IN  std_logic;
         ROM_DATA_ADDRESS : IN  std_logic_vector(4 downto 0);
         ROM_DATA_OUTPUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal ROM_ENABLE : std_logic := '0';
   signal ROM_DATA_ADDRESS : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ROM_DATA_OUTPUT : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generic_ROM_clk PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          ROM_ENABLE => ROM_ENABLE,
          ROM_DATA_ADDRESS => ROM_DATA_ADDRESS,
          ROM_DATA_OUTPUT => ROM_DATA_OUTPUT
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
		ROM_DATA_ADDRESS <= "01010";

      wait for 50 ns;
		wait until LOCAL_CLOCK = '1';
		wait for LOCAL_CLOCK_period;

      ROM_ENABLE <= '1';
		wait for LOCAL_CLOCK_period;
      ROM_ENABLE <= '0';
		
		wait for LOCAL_CLOCK_period*2;
		ROM_DATA_ADDRESS <= "01100";
		wait for LOCAL_CLOCK_period*2;

      ROM_DATA_ADDRESS <= "00000";
		ROM_ENABLE <= '1';
		for i in 0 to 63 loop
			wait for LOCAL_CLOCK_period;
			ROM_DATA_ADDRESS <= ROM_DATA_ADDRESS + "1";
		end loop;

      wait;
   end process;

END;
