----------------------------------------------------------------------------------
-- Company:        CETUC - Optoelectronics Laboratory
-- Engineer: 		 Gustavo Castro do Amaral
-- Create Date:    20:49:36 05/15/2014 
-- Module Name:    XEM3005_IN_PLACE_LU_DECOMPOSITION_TM - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity XEM3005_IN_PLACE_LU_DECOMPOSITION_TM is
	port(
		LOCAL_CLOCK : IN    STD_LOGIC;
		
		LED_VECTOR  : OUT   STD_LOGIC_VECTOR(3  DOWNTO 0);
	
		hi_in       : IN    STD_LOGIC_VECTOR(7  DOWNTO 0);
		hi_out      : OUT   STD_LOGIC_VECTOR(1  DOWNTO 0);
		hi_inout    : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		hi_muxsel   : OUT   STD_LOGIC;
		i2c_scl     : OUT   STD_LOGIC;
		i2c_sda     : OUT   STD_LOGIC
	);
end XEM3005_IN_PLACE_LU_DECOMPOSITION_TM;

architecture Behavioral of XEM3005_IN_PLACE_LU_DECOMPOSITION_TM is

	component IN_PLACE_LU_DECOMPOSITION_OPALKELLY_INTERFACE
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
	end component;

	component IN_PLACE_LU_DECOMPOSITION_MAIN_FRAME
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
		   PIPE_COMPLETE             : IN  STD_LOGIC;
			
			-- FROM FIFO TO HOST
			FIFO_OUT_WRITE_REQUEST    : OUT STD_LOGIC;
			HOST_POSITIVE_READ_ACK    : IN  STD_LOGIC;
			WRITE_TO_HOST             : IN  STD_LOGIC;
			FIFO_OUT_OUTPUT_DATA      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			-- COMM PROTOCOL TERMINATION
			HOST_UNLOAD_CONFIRMATION  : IN  STD_LOGIC
		);
	end component;
	
	signal HOST_CLOCK                : STD_LOGIC := '0';
	signal RESET                     : STD_LOGIC := '0';
	
	signal HOST_WRITE_REQUEST        : STD_LOGIC := '0';
	signal FIFO_IN_POSITIVE_READ_ACK : STD_LOGIC := '0';
	signal WRITE_TO_FIFO_IN          : STD_LOGIC := '0';
	signal FIFO_IN_INPUT_DATA        : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
	signal PIPE_COMPLETE             : STD_LOGIC := '0';
	
	signal FIFO_OUT_WRITE_REQUEST    : STD_LOGIC := '0';
	signal HOST_POSITIVE_READ_ACK    : STD_LOGIC := '0';
	signal WRITE_TO_HOST             : STD_LOGIC := '0';
	signal FIFO_OUT_OUTPUT_DATA      : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
	signal HOST_UNLOAD_CONFIRMATION  : STD_LOGIC := '0';
	
	component IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT is
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
	end component;
	
	
	-- DEBUG
	signal HOLD_SIGNAL : std_logic_vector(3 downto 0) := (others => '0');
	signal HELD_SIGNAL : std_logic_vector(3 downto 0) := (others => '0');
	--======

begin

	DATA_INTERFACE : IN_PLACE_LU_DECOMPOSITION_OPALKELLY_INTERFACE
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
			                             
			-- FROM HOST TO FIFO
			HOST_WRITE_REQUEST        => HOST_WRITE_REQUEST,        
			FIFO_IN_POSITIVE_READ_ACK => FIFO_IN_POSITIVE_READ_ACK, 
			WRITE_TO_FIFO_IN          => WRITE_TO_FIFO_IN,          
			FIFO_IN_INPUT_DATA        => FIFO_IN_INPUT_DATA,        
			-- COMM PROTOCOL TERMINATION
			PIPE_COMPLETE             => PIPE_COMPLETE,             
			                             
			-- FROM FIFO TO HOST
			FIFO_OUT_WRITE_REQUEST    => FIFO_OUT_WRITE_REQUEST,    
			HOST_POSITIVE_READ_ACK    => HOST_POSITIVE_READ_ACK,    
			WRITE_TO_HOST             => WRITE_TO_HOST,             
			FIFO_OUT_OUTPUT_DATA      => FIFO_OUT_OUTPUT_DATA,      
			-- COMM PROTOCOL TERMINATION
			HOST_UNLOAD_CONFIRMATION  => HOST_UNLOAD_CONFIRMATION  
		);
					
	FIFO_IN : IN_PLACE_LU_DECOMPOSITION_FIFO_IN_UNIT
		port map(
			LOCAL_CLOCK               => LOCAL_CLOCK,
			HOST_CLOCK                => HOST_CLOCK,
			                          
			RESET                     => RESET,
			                            
			-- FROM HOST TO FIFO      -- FROM HOST TO FIFO
			HOST_WRITE_REQUEST        => HOST_WRITE_REQUEST,
			FIFO_IN_POSITIVE_READ_ACK => FIFO_IN_POSITIVE_READ_ACK,
			WRITE_TO_FIFO_IN          => WRITE_TO_FIFO_IN,
			FIFO_IN_INPUT_DATA        => FIFO_IN_INPUT_DATA,
			-- COMM PROTOCOL TERMINATI-- COMM PROTOCOL TERMINAT
			PIPE_COMPLETE             => PIPE_COMPLETE      
		);
		
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
	HELD_SIGNAL(0) <= RESET OR HOLD_SIGNAL(0);
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
	HELD_SIGNAL(1) <= HOST_WRITE_REQUEST OR HOLD_SIGNAL(1);
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
	HELD_SIGNAL(2) <= FIFO_IN_POSITIVE_READ_ACK OR HOLD_SIGNAL(2);
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
	HELD_SIGNAL(3) <= WRITE_TO_FIFO_IN OR HOLD_SIGNAL(3);
	--======

end Behavioral;

