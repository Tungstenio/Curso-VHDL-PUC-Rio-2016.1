---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    11:05:36 02/25/2015
-- Module Name:    USART_FIFOS_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity USART_FIFOS_TM is
	port(
		LOCAL_CLOCK            : IN  STD_LOGIC;
		HOST_CLOCK             : IN  STD_LOGIC;
		RESET                  : IN  STD_LOGIC;
		
		-- INPUT FROM HOST CONTROL SIGNALS
		HOST_WRITE_REQUEST     : IN  STD_LOGIC;
		FIFO_IN_POSITIVE_ACK   : OUT STD_LOGIC;
		WRITE_TO_FIFO_IN       : IN  STD_LOGIC;
		FIFO_IN_DATA_IN        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		HOST_WRITE_COMPLETED   : IN  STD_LOGIC;
		
		-- OUTPUT TO HOST CONTROL SIGNALS
		TRANSMISSION_COMPLETED : IN  STD_LOGIC;
		FIFO_OUT_WRITE_REQUEST : OUT STD_LOGIC;
		HOST_POSITIVE_READ_ACK : IN  STD_LOGIC;
		HOST_CONFIRM           : IN  STD_LOGIC;		
		FIFO_UNLOAD_LENGTH     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		READ_FROM_FIFO_OUT     : IN  STD_LOGIC;
		FIFO_OUT_DATA_OUT      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		-- RX/TX CONTROL SIGNALS
		LOAD_FIFO              : IN  STD_LOGIC;
		FIFO_OUT_DATA_IN       : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
		FIFO_IN_NOT_EMPTY      : OUT STD_LOGIC;
		POP_FIFO               : IN  STD_LOGIC;
		FIFO_IN_DATA_OUT       : OUT STD_LOGIC_VECTOR(7  DOWNTO 0)
	);
end USART_FIFOS_TM;

architecture Behavioral of USART_FIFOS_TM is

	component USART_FIFO_IN_MANAGER is
		port(
			LOCAL_CLOCK          : IN  STD_LOGIC;
			HOST_CLOCK           : IN  STD_LOGIC;
			RESET                : IN  STD_LOGIC;
			
			HOST_WRITE_REQUEST   : IN  STD_LOGIC; -- Host requests permission to transmit through this signal.
															  -- It is kept high until the permission is granted.
			HOST_POSITIVE_ACK    : OUT STD_LOGIC; -- Board grants permission for a transmission from the host.
			WRITE_TO_FIFO_IN     : IN  STD_LOGIC; -- Host signal. Directly connected to the FIFO which is kept high
															  -- during the transmission so data is loaded.
			FIFO_IN_DATA_IN      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0); -- Host data stream.
			HOST_WRITE_COMPLETED : IN  STD_LOGIC; -- Host signalizes a transmission end.
			
			FIFO_IN_NOT_EMPTY    : OUT STD_LOGIC; -- This signal warns the Transmitter that there is available data
															  -- for transmission.
			
			POP_FIFO             : IN  STD_LOGIC; -- Transmitter unloads data from the FIFO in order to transmit it.
			FIFO_IN_DATA_OUT     : OUT STD_LOGIC_VECTOR(7  DOWNTO 0) -- Transmitter data stream.
		);
	end component;
	
	component USART_FIFO_OUT_MANAGER is
		port(
			LOCAL_CLOCK            : IN  STD_LOGIC;
			HOST_CLOCK             : IN  STD_LOGIC;
			RESET                  : IN  STD_LOGIC;
			
			TRANSMISSION_COMPLETED : IN  STD_LOGIC;
			
			FIFO_OUT_WRITE_REQUEST : OUT STD_LOGIC;
			HOST_POSITIVE_READ_ACK : IN  STD_LOGIC;
			HOST_CONFIRM           : IN  STD_LOGIC;
			
			LOAD_FIFO              : IN  STD_LOGIC;
			FIFO_OUT_DATA_IN       : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			FIFO_UNLOAD_LENGTH     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			READ_FROM_FIFO_OUT     : IN  STD_LOGIC;
			FIFO_OUT_DATA_OUT      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	end component;

begin

	FIFO_IN : USART_FIFO_IN_MANAGER
		port map(
			LOCAL_CLOCK          => LOCAL_CLOCK,
			HOST_CLOCK           => HOST_CLOCK,
			RESET                => RESET,
			                     
			HOST_WRITE_REQUEST   => HOST_WRITE_REQUEST,		
			HOST_POSITIVE_ACK    => FIFO_IN_POSITIVE_ACK,
			WRITE_TO_FIFO_IN     => WRITE_TO_FIFO_IN,	
			FIFO_IN_DATA_IN      => FIFO_IN_DATA_IN,
			HOST_WRITE_COMPLETED => HOST_WRITE_COMPLETED,
			                     
			FIFO_IN_NOT_EMPTY    => FIFO_IN_NOT_EMPTY,
			
			POP_FIFO             => POP_FIFO,
			FIFO_IN_DATA_OUT     => FIFO_IN_DATA_OUT
		);
	
	FIFO_OUT : USART_FIFO_OUT_MANAGER
		port map(
			LOCAL_CLOCK            => LOCAL_CLOCK,
			HOST_CLOCK             => HOST_CLOCK,
			RESET                  => RESET,
			                       
			TRANSMISSION_COMPLETED => TRANSMISSION_COMPLETED,
			                       
			FIFO_OUT_WRITE_REQUEST => FIFO_OUT_WRITE_REQUEST,
			HOST_POSITIVE_READ_ACK => HOST_POSITIVE_READ_ACK,
			HOST_CONFIRM           => HOST_CONFIRM,
			                       
			LOAD_FIFO              => LOAD_FIFO,
			FIFO_OUT_DATA_IN       => FIFO_OUT_DATA_IN,
			                       
			FIFO_UNLOAD_LENGTH     => FIFO_UNLOAD_LENGTH,
			READ_FROM_FIFO_OUT     => READ_FROM_FIFO_OUT,
			FIFO_OUT_DATA_OUT      => FIFO_OUT_DATA_OUT
		);

end Behavioral;

