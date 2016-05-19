library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY Tx_Rx_Tb IS
END Tx_Rx_Tb;
 
ARCHITECTURE behavior OF Tx_Rx_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tx_Rx
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         K : IN  std_logic_vector(15 downto 0);
         MESSAGE : IN  std_logic_vector(7 downto 0);
         TRANSMIT : IN  std_logic;
         TX_DONE : OUT  std_logic;
         DEBUG_SHIFT : OUT  std_logic;
         DEBUG_COUNTER : OUT  std_logic_vector(3 downto 0);
         OUTPUT_MESSAGE : OUT  std_logic_vector(7 downto 0);
         RX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal K : std_logic_vector(15 downto 0) := (others => '0');
   signal MESSAGE : std_logic_vector(7 downto 0) := (others => '0');
   signal TRANSMIT : std_logic := '0';

 	--Outputs
   signal TX_DONE : std_logic;
   signal DEBUG_SHIFT : std_logic;
   signal DEBUG_COUNTER : std_logic_vector(3 downto 0);
   signal OUTPUT_MESSAGE : std_logic_vector(7 downto 0);
   signal RX_DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tx_Rx PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          K => K,
          MESSAGE => MESSAGE,
          TRANSMIT => TRANSMIT,
          TX_DONE => TX_DONE,
          DEBUG_SHIFT => DEBUG_SHIFT,
          DEBUG_COUNTER => DEBUG_COUNTER,
          OUTPUT_MESSAGE => OUTPUT_MESSAGE,
          RX_DONE => RX_DONE
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
		
		K <= "0000000000000110";
      MESSAGE   <= "10101010";
		wait until LOCAL_CLOCK = '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT <= '0';
		
		wait until RX_DONE = '1';
		wait for LOCAL_CLOCK_period;
		
      MESSAGE   <= "11110000";
		wait until LOCAL_CLOCK = '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT <= '0';
		
		
      wait;
   end process;

END;
