----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    15:19:33 06/12/2014 
-- Module Name:    OPALKELLY_INTERFACE - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IN_PLACE_LU_DECOMPOSITION_OPALKELLY_INTERFACE is
	port(
		LOCAL_CLOCK               : IN  STD_LOGIC;
		
		hi_in                     : IN    STD_LOGIC_VECTOR(7  DOWNTO 0);
		hi_out                    : OUT   STD_LOGIC_VECTOR(1  DOWNTO 0);
		hi_inout                  : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		hi_muxsel                 : OUT   STD_LOGIC;
		i2c_scl                   : OUT   STD_LOGIC;
		i2c_sda                   : OUT   STD_LOGIC;
		
		HOST_CLOCK                : OUT STD_LOGIC;
		
		RESET                     : OUT STD_LOGIC;
		
		-- FROM HOST TO FIFO
		HOST_WRITE_REQUEST        : OUT STD_LOGIC;
		FIFO_IN_POSITIVE_READ_ACK : IN  STD_LOGIC;
		WRITE_TO_FIFO_IN          : OUT STD_LOGIC;
		FIFO_IN_INPUT_DATA        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		-- COMM PROTOCOL TERMINATION
		PIPE_COMPLETE             : OUT STD_LOGIC;
		
		-- FROM FIFO TO HOST
		FIFO_OUT_WRITE_REQUEST    : IN  STD_LOGIC;
		HOST_POSITIVE_READ_ACK    : OUT STD_LOGIC;
		WRITE_TO_HOST             : OUT STD_LOGIC;
		FIFO_OUT_OUTPUT_DATA      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		-- COMM PROTOCOL TERMINATION
		HOST_UNLOAD_CONFIRMATION  : OUT STD_LOGIC
	);
end IN_PLACE_LU_DECOMPOSITION_OPALKELLY_INTERFACE;

architecture Behavioral of IN_PLACE_LU_DECOMPOSITION_OPALKELLY_INTERFACE is

	component okHost is
		port(
			hi_in    : IN    STD_LOGIC_VECTOR( 7 downto 0 );
			hi_out   : OUT   STD_LOGIC_VECTOR( 1 downto 0 );
			hi_inout : INOUT STD_LOGIC_VECTOR(15 downto 0 );
			
			ti_clk 	: OUT   STD_LOGIC;
			ok1 		: OUT   STD_LOGIC_VECTOR(30 downto 0 );
			ok2 		: IN    STD_LOGIC_VECTOR(16 downto 0 )
		);
	end component okHost;
	
	attribute box_type: string;
	
	component okTriggerIn is
		port(
			ok1        : IN  STD_LOGIC_VECTOR(30 downto 0 );
			ep_addr    : IN  STD_LOGIC_VECTOR( 7 downto 0 );
			ep_clk     : IN  STD_LOGIC;
			ep_trigger : OUT STD_LOGIC_VECTOR(15 downto 0 )
		);
	end component okTriggerIn;
	attribute box_type of okTriggerIn : component is "black_box";
	
	component okWireIn port (
		ok1        : in std_logic_vector(30 downto 0);
		ep_addr    : in std_logic_vector(7 downto 0);
		ep_dataout : out std_logic_vector(15 downto 0));
	end component;
	attribute box_type of okWireIn : component is "black_box";
	
	component okTriggerOut port (
		ok1        : in std_logic_vector(30 downto 0);
		ok2        : out std_logic_vector(16 downto 0);
		ep_addr    : in std_logic_vector(7 downto 0);
		ep_clk     : in std_logic;
		ep_trigger : in std_logic_vector(15 downto 0));
	end component okTriggerOut;
	attribute box_type of okTriggerOut : component is "black_box";
	
	component okWireOut port (
		ok1       : in std_logic_vector(30 downto 0);
		ok2       : out std_logic_vector(16 downto 0);
		ep_addr   : in std_logic_vector(7 downto 0);
		ep_datain : in std_logic_vector(15 downto 0));
	end component;
	attribute box_type of okWireOut : component is "black_box";
	
	component okPipeOut port (
		ok1        : in std_logic_vector(30 downto 0);
		ok2        : out std_logic_vector(16 downto 0);
		ep_addr    : in std_logic_vector(7 downto 0);
		ep_read    : out std_logic;
		ep_datain  : in std_logic_vector(15 downto 0));
	end component okPipeOut;
	attribute box_type of okPipeOut : component is "black_box";
	
	component okPipeIn port (
		ok1        : in std_logic_vector(30 downto 0);
		ok2        : out std_logic_vector(16 downto 0);
		ep_addr    : in std_logic_vector(7 downto 0);
		ep_write   : out std_logic;
		ep_dataout : out std_logic_vector(15 downto 0));
	end component;
	attribute box_type of okPipeIn : component is "black_box";
	
	component okWireOR
	generic (N : integer := 1);
	port (
		ok2   : out std_logic_vector(16 downto 0);
		ok2s  : in std_logic_vector(N*17-1 downto 0));
	end component;
	
	signal ok1                     : std_logic_vector(30 downto 0) := (others => '0');
	signal ok2                     : std_logic_vector(16 downto 0) := (others => '0');
	signal ok2s                    : std_logic_vector(84 downto 0) := (others => '0');
	
	signal FULL_MEMORY_LENGTH_WIRE : std_logic_vector(15 downto 0) := (others => '0');
	signal DIAGONAL_LENGTH_WIRE    : std_logic_vector(15 downto 0) := (others => '0');
	signal COLUMN_LENGTH_WIRE      : std_logic_vector(15 downto 0) := (others => '0');
	signal ROW_LENGTH_WIRE         : std_logic_vector(15 downto 0) := (others => '0');
	
	signal TRIGGER_IN_VECTOR       : std_logic_vector(15 downto 0) := (others => '0');
	signal TRIGGER_OUT_VECTOR      : std_logic_vector(15 downto 0) := (others => '0');

begin

	hi_muxsel <= '0';
	i2c_scl   <= 'Z';
	i2c_sda   <= 'Z';

	OPALKELLY_HOST       : okHost 
		port map(
			hi_in    => hi_in,
			hi_out   => hi_out,
			hi_inout => hi_inout,
			           
			ti_clk 	=> HOST_CLOCK,
			ok1 		=> ok1,
			ok2 		=> ok2
		);
		
	TRIGGERS_IN          : okTriggerIn
		port map(
			ok1        => ok1,
			ep_addr    => x"40",
			ep_clk     => LOCAL_CLOCK,
			ep_trigger => TRIGGER_IN_VECTOR
		);
	RESET                    <= TRIGGER_IN_VECTOR(0);
	HOST_WRITE_REQUEST       <= TRIGGER_IN_VECTOR(1);
	PIPE_COMPLETE            <= TRIGGER_IN_VECTOR(2);
	HOST_POSITIVE_READ_ACK   <= TRIGGER_IN_VECTOR(3);
	HOST_UNLOAD_CONFIRMATION <= TRIGGER_IN_VECTOR(4);
		
	PIPE_IN              : okPipeIn
		port map(
			ok1        => ok1,
			ok2        => ok2s(33 downto 17),
			ep_addr    => x"80",
			ep_write   => WRITE_TO_FIFO_IN,
			ep_dataout => FIFO_IN_INPUT_DATA
		);
	
	PIPE_OUT             : okPipeOut
		port map(
			ok1       => ok1,
			ok2       => ok2s(16 downto 0),
			ep_addr   => x"A0",
			ep_read   => WRITE_TO_HOST,
			ep_datain => FIFO_OUT_OUTPUT_DATA
		);
		
	TRIGGERS_OUT         : okTriggerOut
		port map(
			ok1        => ok1,
			ok2        => ok2s(50 downto 34),
			ep_addr    => x"60",
			ep_clk     => LOCAL_CLOCK,
			ep_trigger => TRIGGER_OUT_VECTOR
		);
	TRIGGER_OUT_VECTOR(0)           <= FIFO_IN_POSITIVE_READ_ACK;
	TRIGGER_OUT_VECTOR(1)           <= FIFO_OUT_WRITE_REQUEST;
	TRIGGER_OUT_VECTOR(15 downto 2) <= "00000000000000";
		
	OPALKELLY_WO         : okWireOR     
		generic map(5)
		port map(
			ok2  => ok2,
			ok2s => ok2s
		);
		
end Behavioral;

