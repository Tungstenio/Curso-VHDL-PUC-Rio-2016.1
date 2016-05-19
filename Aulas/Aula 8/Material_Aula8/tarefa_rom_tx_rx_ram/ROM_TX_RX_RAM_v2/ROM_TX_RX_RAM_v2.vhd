----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  13:38:21 05/06/2016 
-- Module Name:  ROM_to_RAM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_TX_RX_RAM_v2 is
	generic(
		DATA_SIZE               : integer := 8;
		ADDRESS_SIZE            : integer := 3
	);
	port(
		LOCAL_CLOCK 	: IN STD_LOGIC;
		TRANSFER			: IN STD_LOGIC;
		K					: IN STD_LOGIC_VECTOR(15 downto 0);
		
		DEBUG_ROM_DATA_ADDRESS  : OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		DEBUG_ROM_DATA_OUTPUT   : OUT STD_LOGIC_VECTOR(DATA_SIZE-1 downto 0);
		DEBUG_RAM_DATA_ADDRESS  : OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		DEBUG_ROM_ENABLE			: OUT STD_LOGIC;
		DEBUG_READING_RAM			: OUT STD_LOGIC;
		DEBUG_TX_DONE				: OUT STD_LOGIC;
		DEBUG_RX_DONE				: OUT STD_LOGIC;
		DEBUG_ROM_COUNTER			: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		DEBUG_RAM_COUNTER			: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		
		DONE					: OUT STD_LOGIC;
		RAM_DATA_OUTPUT	: OUT STD_LOGIC_VECTOR(DATA_SIZE-1 downto 0)
	);
end ROM_TX_RX_RAM_v2;

architecture Behavioral of ROM_TX_RX_RAM_v2 is

	COMPONENT biestavel
	PORT(
		LOCAL_CLOCK : IN std_logic;
		START : IN std_logic;
		STOP : IN std_logic;          
		PROCESSING : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Tx_Rx
	PORT(
		LOCAL_CLOCK : IN std_logic;
		K : IN std_logic_vector(15 downto 0);
		MESSAGE : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		TX_DONE : OUT std_logic;
		DEBUG_SHIFT : OUT std_logic;
		DEBUG_COUNTER : OUT std_logic_vector(3 downto 0);
		OUTPUT_MESSAGE : OUT std_logic_vector(7 downto 0);
		RX_DONE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT generic_ROM_clk
	GENERIC(
		DATA_SIZE    : integer;
	   ADDRESS_SIZE : integer
	);
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ROM_ENABLE : IN std_logic;
		ROM_DATA_ADDRESS : IN std_logic_vector(ADDRESS_SIZE-1 downto 0);          
		ROM_DATA_OUTPUT : OUT std_logic_vector(DATA_SIZE-1 downto 0)
		);
	END COMPONENT;

	COMPONENT generic_RAM_clk
	GENERIC(
		DATA_SIZE    : integer;
	   ADDRESS_SIZE : integer
	);
	PORT(
		LOCAL_CLOCK : IN std_logic;
		RAM_ENABLE : IN std_logic;
		RAM_DATA_ADDRESS : IN std_logic_vector(ADDRESS_SIZE-1 downto 0);
		RAM_WRITE_ENABLE : IN std_logic;
		RAM_DATA_INPUT : IN std_logic_vector(DATA_SIZE-1 downto 0);          
		RAM_DATA_OUTPUT : OUT std_logic_vector(DATA_SIZE-1 downto 0)
		);
	END COMPONENT;

	signal ROM_DATA_ADDRESS 	: STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0) := (others => '0');
	signal ROM_DATA_OUTPUT  	: STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0) := (others => '0');
	signal RAM_DATA_ADDRESS 	: STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0) := (others => '0');
	
	signal TX_DONE					: STD_LOGIC := '0';
	signal TX_FLAG					: STD_LOGIC := '0';
	signal TX_FLAG_R0				: STD_LOGIC := '0';
	signal TRANSMIT				: STD_LOGIC := '0';
	signal TRANSMIT_R0			: STD_LOGIC := '0';
	signal RX_DONE					: STD_LOGIC := '0';
		
	signal ROM_ENABLE				: STD_LOGIC := '0';
	signal ROM_DONE				: STD_LOGIC := '0';
	signal ROM_DONE_R0			: STD_LOGIC := '0';
		
	signal RAM_DATA_INPUT		: STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0) := (others => '0');
	signal RAM_ENABLE				: STD_LOGIC := '0';
	signal RAM_WRITE_DONE		: STD_LOGIC := '0';
	signal RAM_WRITE_DONE_R0	: STD_LOGIC := '0';
	signal RAM_WRITE_DONE_R1	: STD_LOGIC := '0';
	signal RAM_READ_DONE			: STD_LOGIC := '0';
	signal RAM_READ_DONE_R0		: STD_LOGIC := '0';
	signal READING_RAM			: STD_LOGIC := '0';
		
	signal LIMIT					: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');
	signal COUNTER					: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');
	signal COUNTER_RAM_R0		: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');
	signal COUNTER_RAM			: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');

begin
		
	BIESTAVEL_ROM: biestavel 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		START => TRANSFER,
		STOP => ROM_DONE,
		PROCESSING => ROM_ENABLE
	);
	
	BIESTAVEL_RAM: biestavel 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		START => RAM_WRITE_DONE,
		STOP => RAM_READ_DONE,
		PROCESSING => READING_RAM
	);
		
	Inst_Tx_Rx: Tx_Rx 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		K => K,
		MESSAGE => ROM_DATA_OUTPUT,
		TRANSMIT => TRANSMIT,
		TX_DONE => TX_DONE,
--		DEBUG_SHIFT => ,
--		DEBUG_COUNTER => ,
		OUTPUT_MESSAGE => RAM_DATA_INPUT,
		RX_DONE => RX_DONE
	);
	
	Inst_generic_ROM_clk: generic_ROM_clk
	generic map( 
		DATA_SIZE    => DATA_SIZE,											--===== DATA_SIZE
	   ADDRESS_SIZE => ADDRESS_SIZE										--===== ADDRESS_SIZE
	)
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		ROM_ENABLE => ROM_ENABLE,
		ROM_DATA_ADDRESS => ROM_DATA_ADDRESS,
		ROM_DATA_OUTPUT => ROM_DATA_OUTPUT
	);
	
	Inst_generic_RAM_clk: generic_RAM_clk 
	generic map( 
		DATA_SIZE    => DATA_SIZE,											--===== DATA_SIZE
	   ADDRESS_SIZE => ADDRESS_SIZE										--===== ADDRESS_SIZE
	)
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		RAM_ENABLE => RAM_ENABLE,
		RAM_DATA_ADDRESS => RAM_DATA_ADDRESS,
		RAM_WRITE_ENABLE => ROM_ENABLE and RX_DONE,
		RAM_DATA_INPUT => RAM_DATA_INPUT,
		RAM_DATA_OUTPUT => RAM_DATA_OUTPUT
	);

	ROM_DONE_R0		<= '1' when COUNTER = LIMIT else '0';
	ROM_DONE			<= ROM_DONE_R0 and ROM_ENABLE;
	LIMIT				<= conv_std_logic_vector(2**ADDRESS_SIZE,ADDRESS_SIZE+1);
	TRANSMIT_R0		<= (TRANSFER or TX_FLAG) and not(ROM_DONE_R0);

	RAM_ENABLE			<= ROM_ENABLE or READING_RAM;
	RAM_WRITE_DONE_R0 <= '1' when COUNTER = LIMIT else '0';
	RAM_WRITE_DONE		<= RAM_WRITE_DONE_R0 and ROM_ENABLE;
	
	RAM_READ_DONE_R0	<= '1' when COUNTER_RAM = LIMIT-"1" else '0';
	RAM_READ_DONE		<= RAM_READ_DONE_R0 and READING_RAM;

	--==== Atrasar sinais ====
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			TX_FLAG 	<= RX_DONE;
			TRANSMIT <= TRANSMIT_R0;
			DONE 		<= RAM_READ_DONE;
		end if;
	end process;
	
	--==== Contador que incrementa endereco da ROM ====
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(ROM_ENABLE = '1') then
				if(RX_DONE = '1') then
					COUNTER <= COUNTER + '1';
				end if;
			else
				COUNTER <= (others => '0');
			end if;
		end if;
	end process;
	ROM_DATA_ADDRESS <= COUNTER(ADDRESS_SIZE-1 downto 0);
	
	--==== Contador que incrementa endereco da RAM ====
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(READING_RAM = '1') then
				COUNTER_RAM_R0 <= COUNTER_RAM_R0 + '1';
			else
				COUNTER_RAM_R0 <= (others => '0');
			end if;
		end if;
	end process;
	COUNTER_RAM <= COUNTER_RAM_R0 when READING_RAM = '1' else (others => '0');
	
	--==== Endereco da RAM ====
	RAM_DATA_ADDRESS <= COUNTER(ADDRESS_SIZE-1 downto 0) or COUNTER_RAM(ADDRESS_SIZE-1 downto 0);	
	
	--==== Debugs ====
	DEBUG_ROM_DATA_ADDRESS 	<= ROM_DATA_ADDRESS;
	DEBUG_ROM_DATA_OUTPUT  	<= ROM_DATA_OUTPUT;
	DEBUG_RAM_DATA_ADDRESS 	<= RAM_DATA_ADDRESS;
	DEBUG_ROM_ENABLE		  	<= ROM_ENABLE;
	DEBUG_READING_RAM		  	<= READING_RAM;
	DEBUG_TX_DONE			  	<= TRANSMIT;
	DEBUG_RX_DONE				<= RX_DONE;
	DEBUG_ROM_COUNTER			<= COUNTER;
	DEBUG_RAM_COUNTER			<= COUNTER_RAM;

end Behavioral;

