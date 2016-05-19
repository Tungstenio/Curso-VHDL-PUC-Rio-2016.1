-- http://insights.sigasi.com/tech/signal-assignments-vhdl-withselect-whenelse-and-case.html
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RX_RS232_MAIN is
   PORT(
		LOCAL_CLOCK : in  STD_LOGIC;
		K : in  STD_LOGIC_VECTOR (15 downto 0);
		RECEIVED_BIT : in  STD_LOGIC;
		
		DEBUG_SHIFT : out STD_LOGIC;
		DEBUG_COUNTER : out  STD_LOGIC_VECTOR (3 downto 0);
		
		OUTPUT_MESSAGE : out  STD_LOGIC_VECTOR (7 downto 0);
		RX_DONE : out  STD_LOGIC
	);
end RX_RS232_MAIN;

architecture Behavioral of RX_RS232_MAIN is

	COMPONENT biestavel
	PORT(
		LOCAL_CLOCK : IN std_logic;
		START : IN std_logic;
		STOP : IN std_logic;          
		PROCESSING : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter_limit
	PORT(
		LOCAL_CLOCK : IN std_logic;
		ENABLE : IN std_logic;
		K : IN std_logic_vector(15 downto 0);          
		DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter_pulse
	PORT(
		LOCAL_CLOCK : IN std_logic;
		PROCESS_RUNNING : IN std_logic;
		LIMIT : IN std_logic_vector(3 downto 0);
		PULSE : IN std_logic;          
		ON_LINE_COUNTER : OUT std_logic_vector(3 downto 0);
		COUNT_DONE : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ShiftRegisterSP
	PORT(
		LOCAL_CLOCK : IN std_logic;
		LOAD : IN std_logic;
		ENABLE : IN std_logic;
		DATA_IN : IN std_logic;          
		DATA_OUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	signal RX_START : std_logic := '0';
	signal RECEIVING : std_logic := '0';
	signal RX_DONE_R0 : std_logic := '0';
	
	signal K_R1 : std_logic_vector(15 downto 0) := (others => '0');
	signal BIT_FLAG : std_logic := '0';
	signal BIT_COUNTER : std_logic_vector(3 downto 0) := (others => '0');
	
	signal BLOCK_SHIFT : std_logic := '0';
	signal SHIFT : std_logic := '0';


begin

	BIESTAVEL_RECEIVING : biestavel
		port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			START => RX_START,
			STOP => RX_DONE_R0,
			PROCESSING => RECEIVING
		);
	
	K_COUNTER: counter_limit 
		PORT MAP(
			LOCAL_CLOCK => LOCAL_CLOCK,
			ENABLE => RECEIVING,
			K => K_R1,
			DONE => BIT_FLAG
		);
	
	BITS_COUNTER : counter_pulse
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         PROCESS_RUNNING => RECEIVING,
         LIMIT => "1011",
			PULSE => BIT_FLAG,
			ON_LINE_COUNTER => BIT_COUNTER,
         COUNT_DONE => RX_DONE_R0
      );

	SR_SerialParalelo: ShiftRegisterSP
      port map(
			LOCAL_CLOCK => LOCAL_CLOCK,
			ENABLE => RECEIVING,
			LOAD => SHIFT,
			DATA_IN => RECEIVED_BIT,
			DATA_OUT => OUTPUT_MESSAGE
		);

   -- RECEIVING OR NOT?
	process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (RECEIVING = '0') then
				if (RECEIVED_BIT = '0') then
					RX_START <= '1';
				end if;
			else
				RX_START <= '0';
			end if;
		end if;
	end process;

	K_R1 <= '0' & K(15 downto 1) when BIT_COUNTER = "0000" else K;
	
	BLOCK_SHIFT <= '1' when BIT_COUNTER > "1000" else '0';
	
	SHIFT <= BIT_FLAG AND NOT(BLOCK_SHIFT);

	RX_DONE <= RX_DONE_R0;
	DEBUG_SHIFT <= SHIFT;
	DEBUG_COUNTER <= BIT_COUNTER;

end Behavioral;

