library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tx_rx_rs232_tb IS
END tx_rx_rs232_tb;
 
ARCHITECTURE behavior OF tx_rx_rs232_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_rx_rs232
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
         MESSAGE_TX : IN  std_logic_vector(7 downto 0);
         TRANSMIT : IN  std_logic;
			
			DEBUG_BIT		  : out std_logic;
			
         OUTPUT_MESSAGE : OUT  std_logic_vector(7 downto 0);
         TX_DONE : OUT  std_logic;
         RX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');
   signal MESSAGE_TX : std_logic_vector(7 downto 0) := (others => '0');
   signal TRANSMIT : std_logic := '0';

 	--Outputs
   signal OUTPUT_MESSAGE : std_logic_vector(7 downto 0);
   signal TX_DONE : std_logic;
   signal RX_DONE : std_logic;
	
	--DEBUG
	signal DEBUG_BIT		  : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_rx_rs232 PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          BAUD_RATE => BAUD_RATE,
          MESSAGE_TX => MESSAGE_TX,
          TRANSMIT => TRANSMIT,
			 
			 DEBUG_BIT => DEBUG_BIT,
			 
          OUTPUT_MESSAGE => OUTPUT_MESSAGE,
          TX_DONE => TX_DONE,
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

      BAUD_RATE  <= "00000000000110";
		MESSAGE_TX <= "01001000";
		TRANSMIT	  <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT	  <= '0';

		wait until RX_DONE <= '1';
		wait for LOCAL_CLOCK_period*20;
		MESSAGE_TX <= "11001100";
		TRANSMIT	  <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT	  <= '0';

      wait;
   end process;

END;
