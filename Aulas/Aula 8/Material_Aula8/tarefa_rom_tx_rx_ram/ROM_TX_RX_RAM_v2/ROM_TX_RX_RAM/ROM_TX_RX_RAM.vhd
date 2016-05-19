----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     
-- Create Date:  11:39:08 03/10/2016 
-- Module Name:  ROM_TX_RX_RAM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_TX_RX_RAM is
	generic(
		DATA_SIZE               : integer := 8;
		ADDRESS_SIZE            : integer := 5
	);
	port(
		LOCAL_CLOCK             : IN  STD_LOGIC;
		ENABLE                  : IN  STD_LOGIC;
		
		BAUD_RATE					: IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		
		DEBUG_RUNNING 				: OUT STD_LOGIC;
		DEBUG_RUNNING_R1  		: OUT STD_LOGIC;
		DEBUG_TRANSMIT				: OUT STD_LOGIC;
		
		ROM_DATA_ADDRESS      	: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 DOWNTO 0);
		ROM_DATA_OUTPUT       	: OUT STD_LOGIC_VECTOR(DATA_SIZE-1    DOWNTO 0);
				
		RAM_DATA_ADDRESS      	: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 DOWNTO 0);
		RAM_DATA_INPUT        	: OUT STD_LOGIC_VECTOR(DATA_SIZE-1    DOWNTO 0);
		RAM_DATA_OUTPUT       	: OUT STD_LOGIC_VECTOR(DATA_SIZE-1    DOWNTO 0)
	);
end ROM_TX_RX_RAM;

architecture Behavioral of ROM_TX_RX_RAM is

	signal BAUD_FLAG		: STD_LOGIC := '0';
	signal READING_ROM	: STD_LOGIC := '0';

	COMPONENT generic_ROM_clk
	GENERIC(
      DATA_SIZE               : integer;
      ADDRESS_SIZE            : integer
   );
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ROM_ENABLE : IN std_logic;
		ROM_DATA_ADDRESS : IN std_logic_vector(4 downto 0);          
		ROM_DATA_OUTPUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT tx_rx_rs232
	PORT(
		LOCAL_CLOCK : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);
		MESSAGE_TX : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		DEBUG_BIT : OUT std_logic;
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		TX_DONE : OUT std_logic;
		RX_DONE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT generic_RAM_clk
	GENERIC(
			DATA_SIZE               : integer;
			ADDRESS_SIZE            : integer
	);
	PORT(
		LOCAL_CLOCK : IN std_logic;
		RAM_ENABLE : IN std_logic;
		RAM_DATA_ADDRESS : IN std_logic_vector(4 downto 0);
		RAM_WRITE_ENABLE : IN std_logic;
		RAM_DATA_INPUT : IN std_logic_vector(7 downto 0);          
		RAM_DATA_OUTPUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	--== ROM
	signal ROM_ENABLE				: std_logic := '0';
	signal ROM_DATA_OUTPUT_B	: std_logic_vector(7 downto 0) := (others => '0');

	--== TX_RX
	signal TX_DONE					: std_logic := '0';
	signal TRANSMIT				: std_logic := '0';
	signal TRANSMIT_R2			: std_logic := '0';
	signal TxRxing_DATA			: std_logic := '0';
	signal RX_DONE					: std_logic := '0';
	signal RX_DONE_R2				: std_logic := '0';
	
	--== RX_RAM
	signal DATA_RX2RAM			: std_logic_vector(7 downto 0) := (others => '0');
	
	--== RAM
	signal RAM_WRITE_ENABLE		: std_logic := '0';
	signal READING_RAM_DATA		: std_logic := '0';
	signal RAM_DATA_OUTPUT_R0  : std_logic_vector(7 downto 0) := (others => '0');
	signal RAM_DATA_OUTPUT_R1  : std_logic_vector(7 downto 0) := (others => '0');
	
	--== Counters
	signal ADDRESS_COUNTER_PRE : std_logic_vector(5 downto 0) := (others => '0');
	signal ADDRESS_COUNTER		: std_logic_vector(4 downto 0) := (others => '0');
	signal ADDRESS_COUNTER_R1	: std_logic_vector(4 downto 0) := (others => '0');

	--== Process Signals
	signal RUNNING					: std_logic := '0';
	signal RUNNING_R1				: std_logic := '0';
	signal FLAG						: std_logic := '0';
	signal FLAG_R2					: std_logic := '0';
	
	
begin

	Inst_generic_ROM_clk: generic_ROM_clk 
	GENERIC MAP(
      DATA_SIZE     => 8,
      ADDRESS_SIZE  => 5
   )
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		ROM_ENABLE => ROM_ENABLE,
		ROM_DATA_ADDRESS => ADDRESS_COUNTER,
		ROM_DATA_OUTPUT => ROM_DATA_OUTPUT_B
	);

	Inst_tx_rx_rs232: tx_rx_rs232 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		BAUD_RATE => BAUD_RATE,
		MESSAGE_TX => ROM_DATA_OUTPUT_B,
		TRANSMIT => TRANSMIT_R2,
--		DEBUG_BIT => ,
		OUTPUT_MESSAGE => DATA_RX2RAM,
		TX_DONE => TX_DONE,
		RX_DONE => RX_DONE
	);
	
	Inst_generic_RAM_clk: generic_RAM_clk 
	GENERIC MAP(
      DATA_SIZE     => 8,
      ADDRESS_SIZE  => 5
   )
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		RAM_ENABLE => ENABLE,
		RAM_DATA_ADDRESS => ADDRESS_COUNTER_R1,
		RAM_WRITE_ENABLE => RAM_WRITE_ENABLE,
		RAM_DATA_INPUT => DATA_RX2RAM,
		RAM_DATA_OUTPUT => RAM_DATA_OUTPUT_R0
	);
	
	
	tx_flags : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			FLAG_R2 <= FLAG;
			RX_DONE_R2 <= RX_DONE;
			TRANSMIT_R2 <= TRANSMIT;
		end if;
	end process;

	TRANSMIT <= '1' when (RX_DONE_R2 OR (FLAG AND NOT FLAG_R2)) = '1' else '0';
	
	
	-- ADDRESS COUNTER
	--   Assim que ENABLE = '1', ADDRESS COUNTER deve assumir o valor (others => '0').
	--   Apenas no próximo Clock ADDRESS COUNTER irá contar (isto é feito usando o sinal RUNNING).
	ad_counter : process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if ((RUNNING AND RX_DONE) = '1') then
				ADDRESS_COUNTER_PRE <= ADDRESS_COUNTER_PRE + "1";
			elsif(RUNNING = '0') then
				ADDRESS_COUNTER_PRE <= (others => '0');
			end if;
		end if;
	end process;
	ADDRESS_COUNTER <= ADDRESS_COUNTER_PRE(4 downto 0);
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
	RUNNING_R1 <= RUNNING when ADDRESS_COUNTER_PRE = "100000" else RUNNING_R1;
	--========

	-- ROM and RAM variables
	FLAG <= RUNNING AND NOT RUNNING_R1;

	ROM_variables :  process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			ROM_ENABLE <= FLAG;
		end if;
	end process;

	RAM_variables :  process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			-- ADDRESS_COUNTER_R1 e RAM_WRITE_ENABLE são atrasados
			-- em um ciclo em relação à leitura da ROM.
			ADDRESS_COUNTER_R1 <= ADDRESS_COUNTER;
			RAM_WRITE_ENABLE   <= ROM_ENABLE AND NOT ADDRESS_COUNTER_PRE(5);
			RAM_DATA_OUTPUT_R1 <= RAM_DATA_OUTPUT_R0;
		end if;
	end process;
	--======================

	-- ROTEAMENTO DOS SINAIS DE SAÍDA
	ROM_DATA_ADDRESS   <= ADDRESS_COUNTER;
	ROM_DATA_OUTPUT    <= ROM_DATA_OUTPUT_B;
	RAM_DATA_ADDRESS   <= ADDRESS_COUNTER_R1;
	RAM_DATA_OUTPUT    <= RAM_DATA_OUTPUT_R1;
	RAM_DATA_INPUT     <= DATA_RX2RAM;
	--===============================
	
	DEBUG_RUNNING 		<= RUNNING;
	DEBUG_RUNNING_R1  <= RUNNING_R1;
	DEBUG_TRANSMIT		<= TRANSMIT_R2;

end Behavioral;

