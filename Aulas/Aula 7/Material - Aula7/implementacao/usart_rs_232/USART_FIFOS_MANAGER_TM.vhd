---------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    13:47:07 03/04/2015
-- Module Name:    USART_FIFOS_MANAGER_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity USART_FIFOS_MANAGER_TM is
	port(
		LOCAL_CLOCK : IN    STD_LOGIC;
			
		hi_in       : IN    STD_LOGIC_VECTOR(7  DOWNTO 0);
		hi_out      : OUT   STD_LOGIC_VECTOR(1  DOWNTO 0);
		hi_inout    : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		hi_muxsel   : OUT   STD_LOGIC;
		i2c_scl     : OUT   STD_LOGIC;
		i2c_sda     : OUT   STD_LOGIC;
		
		RX_IN       : IN    STD_LOGIC;
		TX_OUT      : OUT   STD_LOGIC;
		
		LED_VECTOR  : OUT   STD_LOGIC_VECTOR(3  DOWNTO 0)
	);
end USART_FIFOS_MANAGER_TM;

architecture Behavioral of USART_FIFOS_MANAGER_TM is

	component USART_OPALKELLY_INTERFACE is
		port(
			LOCAL_CLOCK               : IN    STD_LOGIC;
			
			hi_in                     : IN    STD_LOGIC_VECTOR(7  DOWNTO 0);
			hi_out                    : OUT   STD_LOGIC_VECTOR(1  DOWNTO 0);
			hi_inout                  : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			
			hi_muxsel                 : OUT   STD_LOGIC;
			i2c_scl                   : OUT   STD_LOGIC;
			i2c_sda                   : OUT   STD_LOGIC;
			
			HOST_CLOCK                : OUT   STD_LOGIC;
			
			RESET                     : OUT   STD_LOGIC;
			
			BAUD_RATE                 : OUT   STD_LOGIC_VECTOR(12 DOWNTO 0);
			PIPE_LENGTH_OUTPUT        : IN    STD_LOGIC_VECTOR(15 DOWNTO 0);
			
			-- FROM HOST TO FIFO
			HOST_WRITE_REQUEST        : OUT   STD_LOGIC;
			FIFO_IN_POSITIVE_READ_ACK : IN    STD_LOGIC;
			WRITE_TO_FIFO_IN          : OUT   STD_LOGIC;
			FIFO_IN_INPUT_DATA        : OUT   STD_LOGIC_VECTOR(15 DOWNTO 0);
			PIPE_COMPLETE             : OUT   STD_LOGIC;
		
			
			-- FROM FIFO TO HOST
			FIFO_OUT_WRITE_REQUEST    : IN    STD_LOGIC;
			HOST_POSITIVE_READ_ACK    : OUT   STD_LOGIC;
			WRITE_TO_HOST             : OUT   STD_LOGIC;
			FIFO_OUT_OUTPUT_DATA      : IN    STD_LOGIC_VECTOR(15 DOWNTO 0);
			HOST_UNLOAD_CONFIRMATION  : OUT   STD_LOGIC
		);
	end component;

	component USART_MANAGER_TM is
		port(
			LOCAL_CLOCK    : IN  STD_LOGIC;
			
			BAUD_RATE      : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
			
			AVAILABLE_DATA : IN  STD_LOGIC;
			TX_ON          : OUT STD_LOGIC;
			RX_DONE        : OUT STD_LOGIC;
			
			COMM_FINISHED  : OUT STD_LOGIC;
			
			TX_WORD        : IN  STD_LOGIC_VECTOR(7  DOWNTO 0);
			RX_WORD        : OUT STD_LOGIC_VECTOR(7  DOWNTO 0);
			
			RX_IN          : IN  STD_LOGIC;
			TX_OUT         : OUT STD_LOGIC
		);
	end component;
	
	component USART_FIFOS_TM is
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
	end component;
	
	signal HOST_CLOCK                : std_logic := '0';
	signal RESET                     : std_logic := '0';
	
	signal BAUD_RATE                 : std_logic_vector(12 downto 0) := (others => '0');
	signal FIFO_UNLOAD_LENGTH        : std_logic_vector(15 downto 0) := (others => '0');
	
	signal HOST_WRITE_REQUEST        : std_logic := '0';
	signal FIFO_IN_POSITIVE_READ_ACK : std_logic := '0';
	signal WRITE_TO_FIFO_IN          : std_logic := '0';
	signal FIFO_IN_DATA_IN           : std_logic_vector(15 downto 0) := (others => '0');
	signal HOST_WRITE_COMPLETED      : std_logic := '0';
	                          
	signal FIFO_OUT_WRITE_REQUEST    : std_logic := '0';
	signal HOST_POSITIVE_READ_ACK    : std_logic := '0';
	signal READ_FROM_FIFO_OUT        : std_logic := '0';
	signal FIFO_OUT_DATA_OUT         : std_logic_vector(15 downto 0) := (others => '0');
	signal HOST_CONFIRM              : std_logic := '0';
	
	signal LOAD_FIFO                 : std_logic := '0';
	signal RX_DONE                   : std_logic := '0';
	
	signal FIFO_OUT_DATA_IN          : std_logic_vector(7  downto 0) := (others => '0');
	signal RX_WORD                   : std_logic_vector(7  downto 0) := (others => '0');
	
	signal AVAILABLE_DATA            : std_logic := '0';
	signal FIFO_IN_NOT_EMPTY         : std_logic := '0';
	
	signal POP_FIFO                  : std_logic := '0';
	signal TX_ON                     : std_logic := '0';
	
	signal TX_WORD                   : std_logic_vector(7  downto 0) := (others => '0');
	signal FIFO_IN_DATA_OUT          : std_logic_vector(7  downto 0) := (others => '0');
	
	signal COMM_FINISHED             : std_logic := '0';
	signal TRANSMISSION_COMPLETED    : std_logic := '0';
	
	-- DEBUG
	signal HOLD_SIGNAL : std_logic_vector(3 downto 0) := (others => '0');
	signal HELD_SIGNAL : std_logic_vector(3 downto 0) := (others => '0');
	--======

begin

	OK_MANAGER : USART_OPALKELLY_INTERFACE
		port map(
			LOCAL_CLOCK               => LOCAL_CLOCK,
			                          
			hi_in                     => hi_in,
			hi_out                    => hi_out,
			hi_inout                  => hi_inout,
			hi_muxsel                 => hi_muxsel,
			i2c_scl                   => i2c_scl,
			i2c_sda                   => i2c_sda,
			                          
			HOST_CLOCK                => HOST_CLOCK,
			                          
			RESET                     => RESET,
			                          
			BAUD_RATE                 => BAUD_RATE,
			PIPE_LENGTH_OUTPUT        => FIFO_UNLOAD_LENGTH,
			                          
			-- FROM HOST TO FIFO         -- FROM HOST TO FIFO
			HOST_WRITE_REQUEST        => HOST_WRITE_REQUEST,
			FIFO_IN_POSITIVE_READ_ACK => FIFO_IN_POSITIVE_READ_ACK,
--			FIFO_IN_POSITIVE_READ_ACK => HELD_SIGNAL(2),
			WRITE_TO_FIFO_IN          => WRITE_TO_FIFO_IN,
			FIFO_IN_INPUT_DATA        => FIFO_IN_DATA_IN,
			PIPE_COMPLETE             => HOST_WRITE_COMPLETED,
			                          
			-- FROM FIFO TO HOST         -- FROM FIFO TO HOST
			FIFO_OUT_WRITE_REQUEST    => FIFO_OUT_WRITE_REQUEST,
			HOST_POSITIVE_READ_ACK    => HOST_POSITIVE_READ_ACK,
			WRITE_TO_HOST             => READ_FROM_FIFO_OUT,
			FIFO_OUT_OUTPUT_DATA      => FIFO_OUT_DATA_OUT,
			HOST_UNLOAD_CONFIRMATION  => HOST_CONFIRM
		);

	USART_MANAGER : USART_MANAGER_TM
		port map(
			LOCAL_CLOCK    => LOCAL_CLOCK,
			            
			BAUD_RATE      => BAUD_RATE,
			            
			AVAILABLE_DATA => AVAILABLE_DATA,
			TX_ON          => TX_ON,
			RX_DONE        => RX_DONE,
			
			COMM_FINISHED  => COMM_FINISHED,
			            
			TX_WORD        => TX_WORD,
			RX_WORD        => RX_WORD,
			            
			RX_IN          => RX_IN,
			TX_OUT         => TX_OUT     
		);
	
	USART_FIFOS : USART_FIFOS_TM
		port map(
			LOCAL_CLOCK            => LOCAL_CLOCK,
			HOST_CLOCK             => HOST_CLOCK,
			RESET                  => RESET,
			
			-- INPUT FROM HOST CONTROL SIGNALS
			HOST_WRITE_REQUEST     => HOST_WRITE_REQUEST,
			FIFO_IN_POSITIVE_ACK   => FIFO_IN_POSITIVE_READ_ACK,
			WRITE_TO_FIFO_IN       => WRITE_TO_FIFO_IN,
			FIFO_IN_DATA_IN        => FIFO_IN_DATA_IN,
			HOST_WRITE_COMPLETED   => HOST_WRITE_COMPLETED,
			
			-- OUTPUT TO HOST CONTROL SIGNALS
			TRANSMISSION_COMPLETED => TRANSMISSION_COMPLETED,
			FIFO_OUT_WRITE_REQUEST => FIFO_OUT_WRITE_REQUEST,
			HOST_POSITIVE_READ_ACK => HOST_POSITIVE_READ_ACK,
			HOST_CONFIRM           => HOST_CONFIRM,
			FIFO_UNLOAD_LENGTH     => FIFO_UNLOAD_LENGTH,
			READ_FROM_FIFO_OUT     => READ_FROM_FIFO_OUT,
			FIFO_OUT_DATA_OUT      => FIFO_OUT_DATA_OUT,
			
			-- RX/TX CONTROL SIGNALS
			LOAD_FIFO              => LOAD_FIFO,
			FIFO_OUT_DATA_IN       => FIFO_OUT_DATA_IN,
			FIFO_IN_NOT_EMPTY      => FIFO_IN_NOT_EMPTY,
			POP_FIFO               => POP_FIFO,
			FIFO_IN_DATA_OUT       => FIFO_IN_DATA_OUT
		);
		
	LOAD_FIFO              <= RX_DONE;
	FIFO_OUT_DATA_IN       <= RX_WORD;
	AVAILABLE_DATA         <= FIFO_IN_NOT_EMPTY;
	POP_FIFO               <= TX_ON;
	TX_WORD                <= FIFO_IN_DATA_OUT;
	TRANSMISSION_COMPLETED <= COMM_FINISHED;
	
	
	-- INSIDE CONNECTION
	LED_VECTOR <= HELD_SIGNAL;
	
	-- DEBUG
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(HELD_SIGNAL(0) = '1') then
				HOLD_SIGNAL(0) <= '1';
			end if;
		end if;
	end process;
	HELD_SIGNAL(0) <= FIFO_OUT_WRITE_REQUEST;  --AVAILABLE_DATA OR HOLD_SIGNAL(0);
	--======
	
	-- DEBUG
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(HELD_SIGNAL(1) = '1') then
				HOLD_SIGNAL(1) <= '1';
			end if;
		end if;
	end process;
	HELD_SIGNAL(1) <= TX_ON OR HOLD_SIGNAL(1);
	--======
	
	-- DEBUG
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(HELD_SIGNAL(2) = '1') then
				HOLD_SIGNAL(2) <= '1';
			end if;
		end if;
	end process;
	HELD_SIGNAL(2) <= RX_DONE OR HOLD_SIGNAL(2);
	--======
	
	-- DEBUG
	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if(HELD_SIGNAL(3) = '1') then
				HOLD_SIGNAL(3) <= '1';
			end if;
		end if;
	end process;
	HELD_SIGNAL(3) <= COMM_FINISHED OR HOLD_SIGNAL(3);
	--======

end Behavioral;

