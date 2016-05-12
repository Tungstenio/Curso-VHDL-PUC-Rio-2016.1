---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    11:35:35 02/26/2015 
-- Module Name:    USART_FIFO_OUT_MANAGER - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity USART_FIFO_OUT_MANAGER is
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
end USART_FIFO_OUT_MANAGER;

architecture Behavioral of USART_FIFO_OUT_MANAGER is

	component USART_FIFO_OUT_CPU is
		port(
			LOCAL_CLOCK            : IN  STD_LOGIC;
			
			FIFO_OUT_FULL          : IN  STD_LOGIC;
			HOST_CONFIRM           : IN  STD_LOGIC;
			
			FIFO_OUT_WRITE_REQUEST : OUT STD_LOGIC;
			HOST_POSITIVE_READ_ACK : IN  STD_LOGIC
		);
	end component;
	
	component FIFO_OUT_8W_16R_1024D is
		port(
			rst           : IN  STD_LOGIC;
			
			wr_clk        : IN  STD_LOGIC;
			rd_clk        : IN  STD_LOGIC;
			
			din           : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			wr_en         : IN  STD_LOGIC;
			rd_en         : IN  STD_LOGIC;
			
			dout          : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			
			full          : OUT STD_LOGIC;
			empty         : OUT STD_LOGIC;
			
			rd_data_count : OUT STD_LOGIC_VECTOR(9  DOWNTO 0);
			wr_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
		);
	end component;
	
	signal FIFO_OUT_READ_STATUS_A0 : std_logic_vector(9  downto 0) := (others => '0');
	signal FIFO_OUT_WRITE_STATUS   : std_logic_vector(10 downto 0) := (others => '0');
	signal FIFO_OUT_FULL_A0        : std_logic := '0';
	signal FIFO_OUT_EMPTY_A0       : std_logic := '0';
	
	signal READ_FROM_FIFO_A0       : std_logic := '0';
	signal FIFO_OUT_FULL           : std_logic := '0';
	signal UNLOAD                  : std_logic := '0';

begin

	FIFO_OUT_COMM_HOST : USART_FIFO_OUT_CPU
		port map(
			LOCAL_CLOCK            => LOCAL_CLOCK,
			                       
			FIFO_OUT_FULL          => UNLOAD,
			HOST_CONFIRM           => HOST_CONFIRM,
			                       
			FIFO_OUT_WRITE_REQUEST => FIFO_OUT_WRITE_REQUEST,
			HOST_POSITIVE_READ_ACK => HOST_POSITIVE_READ_ACK
		);
					
	FIFO_OUT           : FIFO_OUT_8W_16R_1024D
		port map(
			rst           => RESET,
			
			wr_clk        => LOCAL_CLOCK,
			rd_clk        => HOST_CLOCK,
			
			din           => FIFO_OUT_DATA_IN,
			
			wr_en         => LOAD_FIFO,
			rd_en         => READ_FROM_FIFO_OUT,
			
			dout          => FIFO_OUT_DATA_OUT,
			
			full          => FIFO_OUT_FULL_A0,
			empty         => FIFO_OUT_EMPTY_A0,
			
			rd_data_count => FIFO_OUT_READ_STATUS_A0,
			wr_data_count => FIFO_OUT_WRITE_STATUS
		);
		
	with FIFO_OUT_READ_STATUS_A0 select
		FIFO_OUT_FULL <= '1' when "1110000000",
		                 '0' when others;
									
	UNLOAD <= FIFO_OUT_FULL OR TRANSMISSION_COMPLETED;
	
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(UNLOAD = '1') then
				FIFO_UNLOAD_LENGTH <= "00000" & FIFO_OUT_WRITE_STATUS;
			end if;
		end if;
	end process;

end Behavioral;


