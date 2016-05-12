---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    11:31:48 02/25/2015
-- Module Name:    USART_FIFO_IN_MANAGER - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity USART_FIFO_IN_MANAGER is
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
end USART_FIFO_IN_MANAGER;

architecture Behavioral of USART_FIFO_IN_MANAGER is

	component USART_FIFO_IN_CPU is
		port(
			LOCAL_CLOCK          : IN  STD_LOGIC;
			
			HOST_WRITE_REQUEST   : IN  STD_LOGIC;
			HOST_POSITIVE_ACK    : OUT STD_LOGIC;
			
			FIFO_IN_FULL         : IN  STD_LOGIC;
			HOST_WRITE_COMPLETED : IN  STD_LOGIC
		);
	end component;
	
	component FIFO_IN_16W_8R_1024D is
		port(
			rst           : IN  STD_LOGIC;
			
			wr_clk        : IN  STD_LOGIC;
			rd_clk        : IN  STD_LOGIC;
			
			din           : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			
			wr_en         : IN  STD_LOGIC;
			rd_en         : IN  STD_LOGIC;
			
			dout          : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			full          : OUT STD_LOGIC;
			empty         : OUT STD_LOGIC;
			
			rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
			wr_data_count : OUT STD_LOGIC_VECTOR(9  DOWNTO 0)
		);
	end component;
	
	signal FIFO_IN_READ_STATUS  : std_logic_vector(10 downto 0) := (others => '0');
	signal FIFO_IN_WRITE_STATUS : std_logic_vector(9  downto 0) := (others => '0');
	signal FIFO_IN_FULL         : std_logic := '0';
	signal FIFO_IN_EMPTY        : std_logic := '0';

begin

	FIFO_IN_COMM_HOST : USART_FIFO_IN_CPU
		port map(
			LOCAL_CLOCK          => LOCAL_CLOCK,
			
			HOST_WRITE_REQUEST   => HOST_WRITE_REQUEST,
			HOST_POSITIVE_ACK    => HOST_POSITIVE_ACK,
			
			FIFO_IN_FULL         => FIFO_IN_FULL,
			HOST_WRITE_COMPLETED => HOST_WRITE_COMPLETED
		);
					
	FIFO_IN           : FIFO_IN_16W_8R_1024D
		port map(
			rst           => RESET,
			
			wr_clk        => HOST_CLOCK,
			rd_clk        => LOCAL_CLOCK,
			
			din           => FIFO_IN_DATA_IN,
			
			wr_en         => WRITE_TO_FIFO_IN,
			rd_en         => POP_FIFO,
			
			dout          => FIFO_IN_DATA_OUT,
			
			full          => FIFO_IN_FULL,
			empty         => FIFO_IN_EMPTY,
			
			rd_data_count => FIFO_IN_READ_STATUS,
			wr_data_count => FIFO_IN_WRITE_STATUS
		);
		
	with FIFO_IN_READ_STATUS select
		FIFO_IN_NOT_EMPTY <= '0' when "00000000000",
		                     '1' when others;

end Behavioral;

