LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY fadder_tb IS
END fadder_tb;

ARCHITECTURE behavior OF fadder_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT fadder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic
        );
    END COMPONENT;

   signal clock : std_logic;

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic;

   constant clock_period : time := 100 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fadder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
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
		
		for i in 0 to 1 loop
			for j in 0 to 1 loop
				for k in 0 to 1 loop
					A <= A XOR '1';
					wait for clock_period;
				end loop;
				B <= B XOR '1';
			end loop;
			Cin <= Cin XOR '1';
		end loop;

      wait;
   end process;

END;
