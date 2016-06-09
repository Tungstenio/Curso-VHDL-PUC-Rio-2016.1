--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:16 03/05/2015
-- Design Name:   
-- Module Name:   C:/DropboxGustavo/Dropbox/Gustavo/PROJETOS/XEM3005/ESTUDO - Rudah/TEST_PIPELINED_FLOAT_ADDER/PIPELINED_FLOAT_ADDER_TB.vhd
-- Project Name:  TEST_PIPELINED_FLOAT_ADDER
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PIPELINED_FLOAT_ADDER_TM
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
 
ENTITY PIPELINED_FLOAT_ADDER_TB IS
END PIPELINED_FLOAT_ADDER_TB;
 
ARCHITECTURE behavior OF PIPELINED_FLOAT_ADDER_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PIPELINED_FLOAT_ADDER_TM
    PORT(
         LOCAL_CLOCK : IN  STD_LOGIC;
			RESET			: IN  STD_LOGIC;
		
			SYNC_IN     : IN  STD_LOGIC;
			
			X           : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			Y           : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			
			--DEBUG
			DEBUG_SUBTRACT_ENABLE : OUT STD_LOGIC;
			DEBUG_SUM_CASE_KEY    : OUT STD_LOGIC_VECTOR(2  DOWNTO 0);
			DEBUG_A_SUB_IN        : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			DEBUG_B_SUB_IN        : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			DEBUG_SUM_RESULT      : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			DEBUG_ADD_MSB         : OUT STD_LOGIC;
			DEBUG_CARRY_OUT       : OUT STD_LOGIC;
			--=====
			
			SYNC_OUT    : OUT STD_LOGIC;
			FLOAT_SUM   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LOCAL_CLOCK : std_logic := '0';
	signal RESET       : STD_LOGIC := '0';
	signal SYNC_IN     : STD_LOGIC := '0';
   signal X : std_logic_vector(31 downto 0) := (others => '0');
   signal Y : std_logic_vector(31 downto 0) := (others => '0');
	
	--DEBUG
--	signal DEBUG_SUBTRACT_ENABLE : STD_LOGIC;
--	signal DEBUG_SUM_CASE_KEY    : STD_LOGIC_VECTOR(2  DOWNTO 0);
--	signal DEBUG_A_SUB_IN        : STD_LOGIC_VECTOR(23 DOWNTO 0);
--	signal DEBUG_B_SUB_IN        : STD_LOGIC_VECTOR(23 DOWNTO 0);
--	signal DEBUG_SUM_RESULT      : STD_LOGIC_VECTOR(23 DOWNTO 0);
--	signal DEBUG_ADD_MSB         : STD_LOGIC;
--	signal DEBUG_CARRY_OUT       : STD_LOGIC;
	--=====

 	--Outputs
	signal SYNC_OUT  : STD_LOGIC;
   signal FLOAT_SUM : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant LOCAL_CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PIPELINED_FLOAT_ADDER_TM PORT MAP (
          LOCAL_CLOCK => LOCAL_CLOCK,
			 RESET => RESET,
			 SYNC_IN => SYNC_IN,
          X => X,
          Y => Y,
			 
--			 DEBUG_SUBTRACT_ENABLE => DEBUG_SUBTRACT_ENABLE,
--			 DEBUG_SUM_CASE_KEY    => DEBUG_SUM_CASE_KEY,   
--			 DEBUG_A_SUB_IN        => DEBUG_A_SUB_IN,       
--			 DEBUG_B_SUB_IN        => DEBUG_B_SUB_IN,       
--			 DEBUG_SUM_RESULT      => DEBUG_SUM_RESULT,     
--			 DEBUG_ADD_MSB         => DEBUG_ADD_MSB,        
--			 DEBUG_CARRY_OUT       => DEBUG_CARRY_OUT,      
			 
			 SYNC_OUT => SYNC_OUT,
          FLOAT_SUM => FLOAT_SUM
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
		
		SYNC_IN <= '1';
		X <= x"40800000";
		Y <= x"bf800000";
		wait for 20 ns;
		SYNC_IN <= '0';
		wait for 100 ns;   -- EXPECTED_RESULT : x"40400000"
		
		SYNC_IN <= '1';
		X <= x"3f800000";
		Y <= x"bf800000";
		wait for 20 ns;
		SYNC_IN <= '0';
		wait for 100 ns;   -- EXPECTED_RESULT : x"00000000"
 
		SYNC_IN <= '1';
		X <= x"bf800000";
		Y <= x"3f800000";
		wait for 20 ns;
		SYNC_IN <= '0';
		wait for 100 ns;   -- EXPECTED_RESULT : x"00000000"
		
		SYNC_IN <= '1';
		X <= x"3f800000";
		Y <= x"3f800000";
		wait for 20 ns;
		SYNC_IN <= '0';
		wait for 100 ns;   -- EXPECTED_RESULT : x"40000000"
		
		SYNC_IN <= '1';
		X <= x"bf800000";
		Y <= x"bf800000";
		wait for 20 ns;
		SYNC_IN <= '0';
		report "EXPECTED_RESULT : c0000000";
		wait for 100 ns;   -- EXPECTED_RESULT : x"c0000000"
		
		wait;
   end process;
END;
