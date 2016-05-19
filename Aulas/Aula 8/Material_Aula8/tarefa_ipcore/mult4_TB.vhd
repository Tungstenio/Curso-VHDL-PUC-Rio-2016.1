--------------------------------------------------------------------------------
-- Create Date:   16:30:08 05/18/2016
-- Module Name:   C:/Users/Opto2/Desktop/tarefa_ipcore/mult4_TB.vhd
-- Project Name:  tarefa_ipcore
-- VHDL Test Bench Created by ISE for module: mult4
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mult4_TB IS
END mult4_TB;
 
ARCHITECTURE behavior OF mult4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult4
    PORT(
--         clk : IN  std_logic;
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
--         ce : IN  std_logic;
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
--   signal ce : std_logic := '0';

 	--Outputs
   signal p : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult4 PORT MAP (
--          clk => clk,
          a => a,
          b => b,
--          ce => ce,
          p => p
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for clk_period*10;

		a <= x"6";
--		b <= x"1";
		
--		wait for clk_period*4;
--		ce <= '1';
		
		for i in 0 to 15 loop
			b <= conv_std_logic_vector(i,4);
			wait for clk_period;
		end loop;

      wait;
   end process;

END;
