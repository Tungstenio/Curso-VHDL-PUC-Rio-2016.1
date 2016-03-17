---------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  16:41:05 03/03/2016  
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rx_rs232_v2 is
	generic(
      MSG_SIZE         : integer := 8 -- 1 byte
   );
   port(
      LOCAL_CLOCK      : in  std_logic;
      
      BAUD_RATE        : in  std_logic_vector(13 downto 0);
		RECEIVED_BIT	  : in std_logic;
      
		DEBUG_rxing		  : out std_logic;
		
      OUTPUT_MESSAGE   : out std_logic_vector(7 downto 0);
      RX_DONE          : out std_logic
   );
end rx_rs232_v2;

architecture Behavioral of rx_rs232_v2 is

	signal SHIFT					: std_logic := '0';
	signal RECEIVING				: std_logic := '0';
	signal RX_DONE_FLAG			: std_logic := '0';
	signal RECEIVE_FLAG			: std_logic := '0';
	signal RECEIVE_FLAG_R0		: std_logic := '0';
	signal RECEIVE_FLAG_R1		: std_logic := '0';
	signal OUTPUT_MESSAGE_BUF	: std_logic_vector(7 downto 0) := (others => '0');
	
	COMPONENT rx_counters
	PORT(
		LOCAL_CLOCK : IN std_logic;
		RX_ENABLE : IN std_logic;
		BAUD_RATE : IN std_logic_vector(13 downto 0);          
		RX_ING : OUT std_logic;
		RX_DONE : OUT std_logic;
		SHIFT : OUT std_logic
		);
	END COMPONENT;
	
begin

	rx_count: rx_counters 
	PORT MAP(
		LOCAL_CLOCK => LOCAL_CLOCK,
		RX_ENABLE => RECEIVE_FLAG,
		BAUD_RATE => BAUD_RATE,
		RX_ING => RECEIVING,
		RX_DONE => RX_DONE_FLAG,
		SHIFT => SHIFT
	);	

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(RECEIVING = '1') then
				if(SHIFT = '1') then
					OUTPUT_MESSAGE_BUF <= RECEIVED_BIT & OUTPUT_MESSAGE_BUF(7 downto 1);
				end if;
			end if;
		end if;
	end process;
	
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			RECEIVE_FLAG_R1 <= RECEIVE_FLAG_R0;
		end if;
	end process;

	RECEIVE_FLAG_R0	<= '1' when (RECEIVING OR RECEIVED_BIT) = '0' else '0';
	RECEIVE_FLAG		<= RECEIVE_FLAG_R0 AND NOT RECEIVE_FLAG_R1;
	OUTPUT_MESSAGE		<= OUTPUT_MESSAGE_BUF;
	RX_DONE				<= RX_DONE_FLAG;

	DEBUG_rxing <= RECEIVE_FLAG;

end Behavioral;

