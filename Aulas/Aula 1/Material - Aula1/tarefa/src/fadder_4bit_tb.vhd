--------------------------------------------------------------------------------
-- Create Date:   14:19:30 03/08/2016
-- Module Name:   C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aula1/tarefa/src/fadder_4bit_tb.vhd
-- Project Name:  tarefa
-- VHDL Test Bench Created by ISE for module: fadder_4bit
--------------------------------------------------------------------------------
LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY fadder_4bit_tb IS
END fadder_4bit_tb;
 
ARCHITECTURE behavior OF fadder_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fadder_4bit
    PORT(
			A0		: in  std_logic;
			A1		: in  std_logic;
			A2		: in  std_logic;
			A3		: in  std_logic;
			B0		: in  std_logic;
			B1		: in  std_logic;
			B2		: in  std_logic;
			B3		: in  std_logic;
			Cin	: in  std_logic;
			
			S0		: out std_logic;
			S1		: out std_logic;
			S2		: out std_logic;
			S3		: out std_logic;
			Cout	: out std_logic
        );
    END COMPONENT;
    
   signal clock : std_logic := '0';

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S0 : std_logic;
   signal S1 : std_logic;
   signal S2 : std_logic;
   signal S3 : std_logic;
   signal Cout : std_logic := '0';
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 

	-- DEBUG
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(4 downto 0) := (others => '0');
 	-- DEBUG
 
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fadder_4bit PORT MAP (
				A0		=> A0,		
				A1		=> A1,		
				A2		=> A2,		
				A3		=> A3,		
				B0		=> B0,		
				B1		=> B1,		
				B2		=> B2,		
				B3		=> B3,		
				Cin	=> Cin,	
                     
				S0		=> S0,		
				S1		=> S1,		
				S2		=> S2,		
				S3		=> S3,		
				Cout	=> Cout	
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '0';
      B0		<= '0';
      B1		<= '0';
      B2		<= '0';
      B3		<= '0';
      Cin	<= '0';
		wait for 100 ns;

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '1';
      B0		<= '0';
      B1		<= '0';
      B2		<= '0';
      B3		<= '0';
      Cin	<= '0';
		wait for 100 ns;

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '0';
      B0		<= '0';
      B1		<= '0';
      B2		<= '0';
      B3		<= '1';
      Cin	<= '0';
		wait for 100 ns;
		
		A0		<= '0';
      A1		<= '0';	
      A2		<= '1';
      A3		<= '1';
      B0		<= '0';
      B1		<= '0';
      B2		<= '1';
      B3		<= '1';
      Cin	<= '0';
		wait for 100 ns;

		A0		<= '1';
      A1		<= '0';	
      A2		<= '1';
      A3		<= '0';
      B0		<= '0';
      B1		<= '1';
      B2		<= '0';
      B3		<= '1';
      Cin	<= '0';
		wait for 100 ns;

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '1';
      B0		<= '0';
      B1		<= '0';
      B2		<= '0';
      B3		<= '1';
      Cin	<= '1';
		wait for 100 ns;

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '1';
      B0		<= '0';
      B1		<= '0';
      B2		<= '1';
      B3		<= '1';
      Cin	<= '1';
		wait for 100 ns;

		A0		<= '1';
      A1		<= '1';	
      A2		<= '1';
      A3		<= '1';
      B0		<= '1';
      B1		<= '1';
      B2		<= '1';
      B3		<= '1';
      Cin	<= '0';
		wait for 100 ns;

		A0		<= '1';
      A1		<= '1';	
      A2		<= '1';
      A3		<= '1';
      B0		<= '1';
      B1		<= '1';
      B2		<= '1';
      B3		<= '1';
      Cin	<= '1';
		wait for 100 ns;

		A0		<= '0';
      A1		<= '0';	
      A2		<= '0';
      A3		<= '0';
      B0		<= '0';
      B1		<= '0';
      B2		<= '0';
      B3		<= '0';
      Cin	<= '0';
		wait for 100 ns;

      wait;
   end process;

	-- DEBUG
	asdf : process
	begin
		A <= A3 & A2 & A1 & A0;
		B <= B3 & B2 & B1 & B0;
		S <= Cout & S3 & S2 & S1 & S0;
		wait for clock_period/2;
	end process;
	-- DEBUG

END;
