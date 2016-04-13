library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tx_RS232_fsm_TB IS
END tx_RS232_fsm_TB;
 
ARCHITECTURE behavior OF tx_RS232_fsm_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_RS232_fsm
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         DATA_IN : IN  std_logic_vector(7 downto 0);
         TRANSMIT : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
			
			DEBUG			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			
         DATA_OUT : OUT  std_logic;
         TX_DONE : OUT  std_logic
						
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal TRANSMIT : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic;
   signal TX_DONE : std_logic;

	--DEBUG
	signal DEBUG			: STD_LOGIC_VECTOR(2 DOWNTO 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_RS232_fsm PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          DATA_IN => DATA_IN,
          TRANSMIT => TRANSMIT,
          BAUD_RATE => BAUD_RATE,
			 
			 DEBUG => DEBUG,
			 
          DATA_OUT => DATA_OUT,
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
      wait for 100 ns;
		wait until LOCAL_CLOCK = '1';
		BAUD_RATE 	<= "00000000000101";
		DATA_IN		<= "10110001";
		TRANSMIT		<= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT		<= '0';
		
		
		wait until TX_DONE = '1';
		wait for 40 ns;
		BAUD_RATE 	<= "00000000000101";
		DATA_IN		<= "00110000";
		TRANSMIT		<= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT		<= '0';

      wait;
   end process;

END;
