--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:57:20 03/07/2016
-- Design Name:   
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aula3/TX_RX_RS232_FSM/tx_rx_rs232_fsm_tb.vhd
-- Project Name:  TX_RX_RS232_FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tx_rx_rs232_fsm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tx_rx_rs232_fsm_tb IS
END tx_rx_rs232_fsm_tb;
 
ARCHITECTURE behavior OF tx_rx_rs232_fsm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_rx_rs232_fsm
    PORT(
         LOCAL_CLOCK : IN  std_logic;
         TX_MESSAGE : IN  std_logic_vector(7 downto 0);
         TRANSMIT : IN  std_logic;
         BAUD_RATE : IN  std_logic_vector(13 downto 0);
         RX_MESSAGE : OUT  std_logic_vector(7 downto 0);
         RX_DONE : OUT  std_logic;
         TX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
   signal TX_MESSAGE : std_logic_vector(7 downto 0) := (others => '0');
   signal TRANSMIT : std_logic := '0';
   signal BAUD_RATE : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal RX_MESSAGE : std_logic_vector(7 downto 0);
   signal RX_DONE : std_logic;
   signal TX_DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_rx_rs232_fsm PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
          TX_MESSAGE => TX_MESSAGE,
          TRANSMIT => TRANSMIT,
          BAUD_RATE => BAUD_RATE,
          RX_MESSAGE => RX_MESSAGE,
          RX_DONE => RX_DONE,
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
      wait for LOCAL_CLOCK_period*10;

      BAUD_RATE  <= "00000000000110";
		TX_MESSAGE <= "01001001";
		TRANSMIT	  <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT	  <= '0';
		
		wait until RX_DONE = '1';
		wait for LOCAL_CLOCK_period;
		TX_MESSAGE <= "00110110";
		TRANSMIT	  <= '1';
		wait for LOCAL_CLOCK_period;
		TRANSMIT	  <= '0';
		
      wait;
   end process;

END;
