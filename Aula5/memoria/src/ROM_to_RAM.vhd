----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  15:10:43 03/09/2016 
-- Module Name:  ROM_to_RAM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_to_RAM is
	generic(
		DATA_SIZE               : integer := 16;
		ADDRESS_SIZE            : integer := 5
	);
	port(
		LOCAL_CLOCK             : in  STD_LOGIC;
		ENABLE                  : in  STD_LOGIC;

		DEBUG_RUNNING				: out  STD_LOGIC;
		DEBUG_RUNNING_R1			: out  STD_LOGIC;
		DEBUG_FLAG					: out   STD_LOGIC;

		ROM_DATA_ADDRESS      : out STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		ROM_DATA_OUTPUT       : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0);

		RAM_DATA_ADDRESS      : out STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		RAM_DATA_INPUT        : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0);
		RAM_DATA_OUTPUT       : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
	);
end ROM_to_RAM;

architecture Behavioral of ROM_to_RAM is

	component generic_ROM_clk
		generic(
			DATA_SIZE               : integer;
			ADDRESS_SIZE            : integer);
		port(
			LOCAL_CLOCK             : in  STD_LOGIC;
			ROM_ENABLE              : in  STD_LOGIC;
			ROM_DATA_ADDRESS        : in  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);

			ROM_DATA_OUTPUT         : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
		);
	end component;

	component generic_RAM_clk
		generic(
			DATA_SIZE               : integer;
			ADDRESS_SIZE            : integer);
		port(
			LOCAL_CLOCK             : in  STD_LOGIC;
			
			RAM_ENABLE              : in  STD_LOGIC;
			RAM_DATA_ADDRESS        : in  STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
			
			RAM_WRITE_ENABLE        : in  STD_LOGIC;
			RAM_DATA_INPUT          : in  STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0);

			RAM_DATA_OUTPUT         : out STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0)
		);
	end component;
	
	-- ROM
	signal ROM_ENABLE             : std_logic := '0';
	signal ROM_DATA_OUTPUT_R0     : std_logic_vector(DATA_SIZE-1    downto 0) := (others => '0');
	signal ADDRESS_COUNTER        : std_logic_vector(ADDRESS_SIZE-1 downto 0) := (others => '0');
	-- RAM - ADDRESS e DATA são atrasados
	signal RAM_CLOCK              : std_logic := '0';
	signal ADDRESS_COUNTER_R1     : std_logic_vector(ADDRESS_SIZE-1 downto 0) := (others => '0');
	signal RAM_WRITE_ENABLE       : std_logic := '0';
	signal RAM_DATA_OUTPUT_R1     : std_logic_vector(DATA_SIZE-1    downto 0) := (others => '0');
	-- FSM
	signal RUNNING                : std_logic := '0';
	signal RUNNING_R1             : std_logic := '0';
	signal FLAG                   : std_logic := '0';

begin

	ROM_A : generic_ROM_clk
		generic map(
			DATA_SIZE    => DATA_SIZE,
			ADDRESS_SIZE => ADDRESS_SIZE
		)
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			ROM_ENABLE => ROM_ENABLE, --ENABLE,
			ROM_DATA_ADDRESS => ADDRESS_COUNTER,
			ROM_DATA_OUTPUT => ROM_DATA_OUTPUT_R0
		);

	RAM_A : generic_RAM_clk
		generic map(
			DATA_SIZE    => DATA_SIZE,
			ADDRESS_SIZE => ADDRESS_SIZE
		)
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			RAM_ENABLE => ENABLE,
			RAM_DATA_ADDRESS => ADDRESS_COUNTER_R1,
			RAM_WRITE_ENABLE => RAM_WRITE_ENABLE,
			RAM_DATA_INPUT => ROM_DATA_OUTPUT_R0,
			RAM_DATA_OUTPUT => RAM_DATA_OUTPUT_R1
		);

	-- ADDRESS COUNTER
	--   Assim que ENABLE = '1', ADDRESS COUNTER deve assumir o valor (others => '0').
	--   Apenas no próximo Clock ADDRESS COUNTER irá contar (isto é feito usando o sinal RUNNING).
	ad_counter : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (RUNNING = '1') then
				ADDRESS_COUNTER <= ADDRESS_COUNTER + "1";
			else
				ADDRESS_COUNTER <= (others => '0');
			end if;
		end if;
	end process;
	--================
	
	-- RUNNING
	--   RUNNING = '1' enquanto ENABLE = '1', porém 1 ciclo de clock atrasado.
	--   RUNNING_R1 = '1' quando ADDRESS_COUNTER chegar ao final.
	run_state : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			RUNNING <= ENABLE;
		end if;
	end process;
	RUNNING_R1 <= RUNNING when ADDRESS_COUNTER = "11111" else RUNNING_R1;
	--========

	-- ROM and RAM variables
	FLAG <= RUNNING AND NOT RUNNING_R1;

	ROM_variables :  process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			ROM_ENABLE         <= FLAG; -- (ENABLE AND NOT RUNNING_R1) OR FLAG;
		end if;
	end process;

	RAM_variables :  process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			-- ADDRESS_COUNTER_R1 e RAM_WRITE_ENABLE são atrasados
			-- em um ciclo em relação à leitura da ROM.
			ADDRESS_COUNTER_R1 <= ADDRESS_COUNTER;
			RAM_WRITE_ENABLE   <= ROM_ENABLE;
		end if;
	end process;
	--======================

	-- ROTEAMENTO DOS SINAIS DE SAÍDA
	ROM_DATA_ADDRESS   <= ADDRESS_COUNTER;
	ROM_DATA_OUTPUT    <= ROM_DATA_OUTPUT_R0;

	RAM_DATA_ADDRESS   <= ADDRESS_COUNTER_R1;
	RAM_DATA_OUTPUT    <= RAM_DATA_OUTPUT_R1;
	RAM_DATA_INPUT     <= ROM_DATA_OUTPUT_R0;
	--===============================
	
	DEBUG_RUNNING		<= RUNNING;
	DEBUG_RUNNING_R1	<= RUNNING_R1;
   DEBUG_FLAG			<= FLAG;
	
end Behavioral;
