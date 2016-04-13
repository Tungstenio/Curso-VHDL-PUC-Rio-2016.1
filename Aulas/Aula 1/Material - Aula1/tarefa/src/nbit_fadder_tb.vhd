LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY nbit_fadder_tb IS
END nbit_fadder_tb;
 
ARCHITECTURE behavior OF nbit_fadder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nbit_fadder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
	signal clock : std_logic := '0';

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic := '0';
   signal Sum : std_logic_vector(3 downto 0) := (others => '0');
	signal SumTotal : std_logic_vector(4 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbit_fadder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );

   -- Clock process definitions
   clock_process : process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;	
	
	-- Sum process
	proc1 : process
	begin
		for i in 0 to 1 loop
			for j in 0 to 15 loop
				for k in 0 to 15 loop
					wait for clock_period;
					A <= A + "1";		
				end loop;
				B <= B + "1";
			end loop;
			Cin <= not(Cin);
		end loop;
		-- wait for forever
		wait;
	end process;

	-- SumTotal process
	proc2 : process
	begin
		SumTotal <= Cout & Sum;
		wait for clock_period/2;
	end process;

END;
