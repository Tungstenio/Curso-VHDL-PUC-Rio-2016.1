library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY generic_RAM_clk_tb IS
END generic_RAM_clk_tb;
 
ARCHITECTURE behavior OF generic_RAM_clk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generic_RAM_clk
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         RAM_ENABLE : IN  std_logic;
         RAM_DATA_ADDRESS : IN  std_logic_vector(4 downto 0);
         RAM_WRITE_ENABLE : IN  std_logic;
         RAM_DATA_INPUT : IN  std_logic_vector(15 downto 0);
         RAM_DATA_OUTPUT : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal RAM_ENABLE : std_logic := '0';
   signal RAM_DATA_ADDRESS : std_logic_vector(4 downto 0) := (others => '0');
   signal RAM_WRITE_ENABLE : std_logic := '0';
   signal RAM_DATA_INPUT : std_logic_vector(15 downto 0) := (others => '0');
	
 	--Outputs
   signal RAM_DATA_OUTPUT : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generic_RAM_clk PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          RAM_ENABLE => RAM_ENABLE,
          RAM_DATA_ADDRESS => RAM_DATA_ADDRESS,
          RAM_WRITE_ENABLE => RAM_WRITE_ENABLE,
          RAM_DATA_INPUT => RAM_DATA_INPUT,
          RAM_DATA_OUTPUT => RAM_DATA_OUTPUT
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
		RAM_DATA_ADDRESS <= "01010";

      wait for 50 ns;
		wait until LOCAL_CLOCK = '1';
		wait for LOCAL_CLOCK_period;

		RAM_ENABLE <= '1';
		wait for LOCAL_CLOCK_period;
		RAM_ENABLE <= '0';

		RAM_DATA_INPUT <= X"0FF0";
		wait for LOCAL_CLOCK_period*5;
		
		RAM_ENABLE <= '1';
		RAM_WRITE_ENABLE <= '1';
		wait for LOCAL_CLOCK_period;
		RAM_WRITE_ENABLE <= '0';
		wait for LOCAL_CLOCK_period*5;

		RAM_WRITE_ENABLE <= '1';
		wait for LOCAL_CLOCK_period*2;
		RAM_WRITE_ENABLE <= '0';
		wait for LOCAL_CLOCK_period*5;
		
		
		wait for LOCAL_CLOCK_period*5;
		RAM_DATA_ADDRESS <= "01011";
		wait for LOCAL_CLOCK_period*2;
		RAM_DATA_ADDRESS <= "01010";

		wait for LOCAL_CLOCK_period*5;
		RAM_DATA_ADDRESS <= "00001";
		RAM_WRITE_ENABLE <= '1';
		
		for i in 0 to 31 loop
			RAM_DATA_INPUT <= conv_std_logic_vector(i, RAM_DATA_INPUT'left + 1); 
			wait for LOCAL_CLOCK_period;
			RAM_DATA_ADDRESS <= RAM_DATA_ADDRESS + "1";
		end loop;
		
		RAM_WRITE_ENABLE <= '0';

		wait for LOCAL_CLOCK_period*5;
		RAM_DATA_ADDRESS <= "00000";

		for i in 0 to 31 loop
			wait for LOCAL_CLOCK_period;
			RAM_DATA_ADDRESS <= RAM_DATA_ADDRESS + "1";
		end loop;


      wait;
   end process;

END;
