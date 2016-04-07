library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY rx_rs232_fsm_tb IS
END rx_rs232_fsm_tb;
 
ARCHITECTURE behavior OF rx_rs232_fsm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx_rs232_fsm
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         K : IN  std_logic_vector(13 downto 0);
         RECEIVED_BIT : IN  std_logic;
			
			DEBUG_COUNTER : OUT  std_logic_vector(3 downto 0);
			DEBUG_STOP_S	  : out std_logic;
			DEBUG_FSM_STATE  : out std_logic_vector(2 downto 0);
			
         OUTPUT_MESSAGE : OUT  std_logic_vector(7 downto 0);
         RX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal K : std_logic_vector(13 downto 0) := (others => '0');
   signal RECEIVED_BIT : std_logic := '1';

 	--Outputs
   signal OUTPUT_MESSAGE : std_logic_vector(7 downto 0);
   signal RX_DONE : std_logic;
	
	--Debug
	signal DEBUG_COUNTER : std_logic_vector(3 downto 0);
	signal DEBUG_STOP_S	  : std_logic;
	signal DEBUG_FSM_STATE  : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx_rs232_fsm PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          K => K,
          RECEIVED_BIT => RECEIVED_BIT,
			 
			 DEBUG_COUNTER => DEBUG_COUNTER,
			 DEBUG_STOP_S => DEBUG_STOP_S,
			 DEBUG_FSM_STATE => DEBUG_FSM_STATE,
			 
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
		K <= "00000000000101";
      wait for LOCAL_CLOCK_period*10;
		
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';

		wait until RX_DONE = '1';
--		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '0';
		wait for LOCAL_CLOCK_period*(1+conv_integer(K));
		RECEIVED_BIT <= '1';

      wait;
   end process;

END;
