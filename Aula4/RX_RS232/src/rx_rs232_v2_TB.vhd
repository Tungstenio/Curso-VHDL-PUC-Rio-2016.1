library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY rx_rs232_v2_tb IS
END rx_rs232_v2_tb;
 
ARCHITECTURE behavior OF rx_rs232_v2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx_rs232_v2
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
         RECEIVED_BIT : IN  std_logic;
			
			DEBUG_rxing		  : out std_logic;
			
         OUTPUT_MESSAGE : OUT  std_logic_vector(7 downto 0);
         RX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');
   signal RECEIVED_BIT : std_logic := '1';

 	--Outputs
   signal OUTPUT_MESSAGE : std_logic_vector(7 downto 0);
   signal RX_DONE : std_logic;
	
	--Debug
	signal DEBUG_rxing		  : std_logic := '0';

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx_rs232_v2 PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          BAUD_RATE => BAUD_RATE,
          RECEIVED_BIT => RECEIVED_BIT,
			 
			 DEBUG_rxing => DEBUG_rxing,
			 
          OUTPUT_MESSAGE => OUTPUT_MESSAGE,
          RX_DONE => RX_DONE
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
		wait for LOCAL_CLOCK_period*10;
		BAUD_RATE <= "00000000000110";
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		
		wait for 400 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
		wait for 140 ns;
		RECEIVED_BIT <= '0';
		wait for 140 ns;
		RECEIVED_BIT <= '1';
      wait;
   end process;

END;
