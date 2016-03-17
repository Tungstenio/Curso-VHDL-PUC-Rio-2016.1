LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY FAdder4BitBlocos_TB IS
END FAdder4BitBlocos_TB;
 
ARCHITECTURE behavior OF FAdder4BitBlocos_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FAdder4BitBlocos
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         B2 : IN  std_logic;
         B3 : IN  std_logic;
         CIN : IN  std_logic;
         S0 : OUT  std_logic;
         S1 : OUT  std_logic;
         S2 : OUT  std_logic;
         S3 : OUT  std_logic;
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal CIN : std_logic := '0';

 	--Outputs
   signal S0 : std_logic;
   signal S1 : std_logic;
   signal S2 : std_logic;
   signal S3 : std_logic;
   signal COUT : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FAdder4BitBlocos PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          CIN => CIN,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          COUT => COUT
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
      -- hold reset state for 10 ns.
      wait for 10*LOCAL_CLOCK_period;
		CIN <= '0';
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		A3 <= '1';
		B0 <= '0';
		B1 <= '1';
		B2 <= '0';
		B3 <= '1';
		wait for 10*LOCAL_CLOCK_period;
		CIN <= '0';
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
		A3 <= '1';
		B0 <= '1';
		B1 <= '1';
		B2 <= '1';
		B3 <= '1';

      wait;
   end process;

END;
