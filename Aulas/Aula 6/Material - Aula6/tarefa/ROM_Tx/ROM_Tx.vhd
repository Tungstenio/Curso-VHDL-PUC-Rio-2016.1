----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  13:28:55 05/03/2016 
-- Module Name:  ROM_to_RAM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_Tx is
	Generic(
      DATA_SIZE      : integer := 8;
      ADDRESS_SIZE   : integer := 3
   );
	port(
		LOCAL_CLOCK	: IN STD_LOGIC;
		START			: IN STD_LOGIC;
		K				: IN STD_LOGIC_VECTOR(15 downto 0);
		
		DEBUG_PROCESSING  : OUT STD_LOGIC;
		DEBUG_COUNTER		: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		DEBUG_TRANSMIT		: OUT STD_LOGIC;
		DEBUG_ROM_DATA_AD	: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0);
		DEBUG_ROM_DATA		: OUT STD_LOGIC_VECTOR(DATA_SIZE-1 downto 0);
		DEBUG_LIMIT			: OUT STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0);
		
		TX_DATA		: OUT STD_LOGIC;
		DONE			: OUT STD_LOGIC
	);
end ROM_Tx;

architecture Behavioral of ROM_Tx is

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

	COMPONENT tx_rs232
	PORT(
		LOCAL_CLOCK : IN std_logic;
		K : IN std_logic_vector(15 downto 0);
		MESSAGE_TX : IN std_logic_vector(7 downto 0);
		TRANSMIT : IN std_logic;          
		OUTPUT_BIT : OUT std_logic;
		TX_DONE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT biestavel
	PORT(
		LOCAL_CLOCK : IN std_logic;
		START : IN std_logic;
		STOP : IN std_logic;          
		PROCESSING : OUT std_logic
		);
	END COMPONENT;
	
	signal ROM_DATA_ADDRESS : STD_LOGIC_VECTOR(ADDRESS_SIZE-1 downto 0) := (others => '0');
	signal ROM_DATA_OUTPUT  : STD_LOGIC_VECTOR(DATA_SIZE-1    downto 0) := (others => '0');
	signal TX_DONE				: STD_LOGIC := '0';
	signal TX_FLAG				: STD_LOGIC := '0';
	signal TRANSMIT			: STD_LOGIC := '0';
	signal ROM_DONE			: STD_LOGIC := '0';
	signal PROCESSING			: STD_LOGIC := '0';
	signal LIMIT				: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');
	signal COUNTER				: STD_LOGIC_VECTOR(ADDRESS_SIZE downto 0) := (others => '0');

begin

	Inst_generic_ROM_clk: generic_ROM_clk 
	generic map( 
		DATA_SIZE    => DATA_SIZE,											--===== DATA_SIZE
	   ADDRESS_SIZE => ADDRESS_SIZE										--===== ADDRESS_SIZE
	)
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		ROM_ENABLE => PROCESSING,
		ROM_DATA_ADDRESS => ROM_DATA_ADDRESS,
		
		ROM_DATA_OUTPUT => ROM_DATA_OUTPUT
	);

	Inst_tx_rs232: tx_rs232 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		K => K,
		MESSAGE_TX => ROM_DATA_OUTPUT,
		TRANSMIT => TRANSMIT,
		
		OUTPUT_BIT => TX_DATA,
		TX_DONE => TX_DONE
	);

	Inst_biestavel: biestavel 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		START => START,
		STOP => ROM_DONE,
		
		PROCESSING => PROCESSING
	);
		
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			TX_FLAG <= TX_DONE;
		end if;
	end process;
	
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(PROCESSING = '1') then
				if(TX_DONE = '1') then
					COUNTER <= COUNTER + '1';
					ROM_DATA_ADDRESS <= COUNTER(ADDRESS_SIZE-1 downto 0) + '1';
				end if;
			else
				COUNTER <= (others => '0');
			end if;
		end if;
	end process;

	ROM_DONE		<= '1' when COUNTER = LIMIT else '0';
	LIMIT			<= conv_std_logic_vector(2**ADDRESS_SIZE,ADDRESS_SIZE+1);
	TRANSMIT    <= (START or TX_FLAG) and not(ROM_DONE);
	DONE 			<= ROM_DONE and not(PROCESSING);
	
	--===DEBUGS=====
	DEBUG_PROCESSING  <= PROCESSING;
	DEBUG_COUNTER		<= COUNTER;
	DEBUG_TRANSMIT		<= TRANSMIT;
	DEBUG_ROM_DATA_AD	<= ROM_DATA_ADDRESS;
	DEBUG_ROM_DATA		<= ROM_DATA_OUTPUT;
	DEBUG_LIMIT			<= LIMIT;

end Behavioral;

