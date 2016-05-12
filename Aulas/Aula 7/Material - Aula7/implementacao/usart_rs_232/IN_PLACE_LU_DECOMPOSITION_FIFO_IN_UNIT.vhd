----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    10:37:00 06/09/2014 
-- Module Name:    IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT is
	port(
		LOCAL_CLOCK               : IN  STD_LOGIC;
		HOST_CLOCK                : IN  STD_LOGIC;
		
		RESET                     : IN  STD_LOGIC;
		  
		-- FROM HOST TO FIFO
		HOST_WRITE_REQUEST        : IN  STD_LOGIC;
		FIFO_IN_POSITIVE_READ_ACK : OUT STD_LOGIC;
		WRITE_TO_FIFO_IN          : IN  STD_LOGIC;
		FIFO_IN_INPUT_DATA        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		-- COMM PROTOCOL TERMINATION
		PIPE_COMPLETE             : IN  STD_LOGIC
	);
end IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT;

architecture Behavioral of IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT is

	component IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU is
		port(
			LOCAL_CLOCK          : IN  STD_LOGIC;
			
			HOST_WRITE_REQUEST   : IN  STD_LOGIC;
			FIFO_IN_FULL         : IN  STD_LOGIC;
			FIFO_IN_EMPTY        : IN  STD_LOGIC;
			
			HOST_WRITE_COMPLETED : IN  STD_LOGIC;
			
			ENABLE_PROCESSING    : OUT STD_LOGIC;
			HOST_POSITIVE_ACK    : OUT STD_LOGIC);
	end component;

	COMPONENT FIFO_16W_32R_1024D
	PORT(
		rst : IN std_logic;
		wr_clk : IN std_logic;
		rd_clk : IN std_logic;
		din : IN std_logic_vector(15 downto 0);
		wr_en : IN std_logic;
		rd_en : IN std_logic;          
		dout : OUT std_logic_vector(31 downto 0);
		full : OUT std_logic;
		empty : OUT std_logic;
		rd_data_count : OUT std_logic_vector(8 downto 0);
		wr_data_count : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;
	attribute box_type: string;
	attribute box_type of FIFO_16W_32R_1024D : component is "black_box";
	
	signal FIFO_IN_READ_STATUS_A0 : std_logic_vector(8  downto 0) := (others => '0');
	signal FIFO_IN_WRITE_STATUS   : std_logic_vector(9  downto 0) := (others => '0');
	signal FIFO_IN_FULL_A0        : std_logic := '0';
	signal FIFO_IN_EMPTY_A0       : std_logic := '0';
	signal FIFO_IN_EMPTY_REAL     : std_logic := '0';
	
	signal READ_FROM_FIFO_A0      : std_logic := '0';

	signal ENABLE_PROCESSING : std_logic;
   signal DATA_TO_MEMORY    : std_logic_vector(31 downto 0);
begin

	FIFO_IN_CPU    : IN_PLACE_LU_DECOMPOSITION_FIFO_IN_CPU
		port map(LOCAL_CLOCK          => LOCAL_CLOCK,
					HOST_WRITE_REQUEST   => HOST_WRITE_REQUEST,
					FIFO_IN_FULL         => FIFO_IN_FULL_A0,
					FIFO_IN_EMPTY        => FIFO_IN_EMPTY_REAL,
					HOST_WRITE_COMPLETED => PIPE_COMPLETE,
					ENABLE_PROCESSING    => ENABLE_PROCESSING,
					HOST_POSITIVE_ACK    => FIFO_IN_POSITIVE_READ_ACK);
					
	FIFO_IN        : FIFO_16W_32R_1024D
		port map(rst           => RESET,
		         wr_clk        => HOST_CLOCK,
		         rd_clk        => LOCAL_CLOCK,
		         din           => FIFO_IN_INPUT_DATA,
		         wr_en         => WRITE_TO_FIFO_IN,
		         rd_en         => READ_FROM_FIFO_A0,
		         dout          => DATA_TO_MEMORY,
		         full          => FIFO_IN_FULL_A0,
		         empty         => FIFO_IN_EMPTY_A0,
		         rd_data_count => FIFO_IN_READ_STATUS_A0,
		         wr_data_count => FIFO_IN_WRITE_STATUS);
	
	with FIFO_IN_READ_STATUS_A0 select
		FIFO_IN_EMPTY_REAL <= '1' when "000000000",
		                      '0' when others;

end Behavioral;

