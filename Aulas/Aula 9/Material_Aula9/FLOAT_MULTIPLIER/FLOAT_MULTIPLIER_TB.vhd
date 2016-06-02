--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:24:58 06/08/2015
-- Design Name:   
-- Module Name:   C:/Gustavo/New folder/Dropbox/Gustavo/PROJETOS/XEM3005/ESTUDO - Rudah/GOERTZEL_PY/FLOAT_MULTIPLIER_TB.vhd
-- Project Name:  GOERTZEL_PY
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FLOAT_MULTIPLIER
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
 
ENTITY FLOAT_MULTIPLIER_TB IS
END FLOAT_MULTIPLIER_TB;
 
ARCHITECTURE behavior OF FLOAT_MULTIPLIER_TB IS 
 
    COMPONENT FLOAT_MULTIPLIER
    PORT(
         ENABLE_MULTIPLIER : IN  std_logic;
         LOCAL_CLOCK : IN  std_logic;
			X_IN : IN  std_logic_vector(31 downto 0);
         Y_IN : IN  std_logic_vector(31 downto 0);
         RESULT : OUT  std_logic_vector(31 downto 0);
         MULT_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ENABLE_MULTIPLIER : std_logic := '0';
   signal LOCAL_CLOCK : std_logic := '0';
   signal X_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal Y_IN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(31 downto 0);
   signal MULT_DONE : std_logic;

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FLOAT_MULTIPLIER PORT MAP (
          ENABLE_MULTIPLIER => ENABLE_MULTIPLIER,
          LOCAL_CLOCK => LOCAL_CLOCK,
          X_IN => X_IN,
          Y_IN => Y_IN,
          RESULT => RESULT,
          MULT_DONE => MULT_DONE
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
      wait for 100 ns;	
		
		X_IN <= x"4152d2f2";
		Y_IN <= x"bf51d7dc";
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';

		wait for 100 ns;

		X_IN <= x"415ffff2";
		Y_IN <= x"bf51d7ff";
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';
		
		wait for 100 ns;

		X_IN <= x"3fc00000";
		Y_IN <= x"3f800000";
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';

		wait for 100 ns;

		X_IN <= x"3fc00000";
		Y_IN <= x"3fc00000";
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';
		
		wait for 100 ns;

		X_IN <= x"3fc00000";
		Y_IN <= x"40000000";
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';

		wait for 100 ns;

		X_IN <= x"15f79688"; -- 1e-25
		Y_IN <= x"6753c21c"; -- 1e+24
		ENABLE_MULTIPLIER <= '1';
		wait for 20 ns;
		ENABLE_MULTIPLIER <= '0';
		
		wait;
	end process;

END;
