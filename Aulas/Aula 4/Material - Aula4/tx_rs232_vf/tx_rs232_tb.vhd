library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tx_rs232_tb IS
END tx_rs232_tb;
 
ARCHITECTURE behavior OF tx_rs232_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_rs232
    PORT(
         LOCAL_CLOCK : IN  std_logic;
			K : in  std_logic_vector(15 downto 0);
         MESSAGE_TX : IN  std_logic_vector(7 downto 0);
         TRANSMIT : IN  std_logic;
         OUTPUT_BIT : OUT  std_logic;
         TX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
	signal K : std_logic_vector(15 downto 0) := (others => '0');

   signal MESSAGE_TX : std_logic_vector(7 downto 0) := (others => '0');
   signal TRANSMIT : std_logic := '0';

 	--Outputs
   signal OUTPUT_BIT : std_logic;
   signal TX_DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_rs232 PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
			 K => K,
          MESSAGE_TX => MESSAGE_TX,
          TRANSMIT => TRANSMIT,
          OUTPUT_BIT => OUTPUT_BIT,
          TX_DONE => TX_DONE
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
      wait for 90 ns;	

		wait until LOCAL_CLOCK = '1';
		K <= "00000000000101";
      MESSAGE_TX <= "10101011";
		WAIT FOR LOCAL_CLOCK_PERIOD;
		TRANSMIT <= '1';
		WAIT FOR LOCAL_CLOCK_PERIOD;
		TRANSMIT <= '0';

		WAIT FOR LOCAL_CLOCK_PERIOD*10;
		TRANSMIT <= '1';
		WAIT FOR LOCAL_CLOCK_PERIOD;
		TRANSMIT <= '0';

      wait until TX_DONE = '1';	
      MESSAGE_TX <= "00111100";
--    wait until TX_DONE = '0';
		wait for LOCAL_CLOCK_PERIOD;
		TRANSMIT <= '1';
		WAIT FOR LOCAL_CLOCK_PERIOD;
		TRANSMIT <= '0';

      wait;
   end process;

END;
