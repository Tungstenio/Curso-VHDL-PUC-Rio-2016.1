---------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:    11:50:00 03/04/2016 
-- Module Name:  rx_counters - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rx_rs232_fsm is
	generic(
      MSG_SIZE         : integer := 8
   );
   port(
      LOCAL_CLOCK      : in  std_logic;
      
      K        		  : in  std_logic_vector(13 downto 0);
		RECEIVED_BIT	  : in  std_logic;
			
		DEBUG_COUNTER    : out std_logic_vector(3 downto 0);
		DEBUG_STOP_S	  : out std_logic;
		DEBUG_FSM_STATE  : out std_logic_vector(2 downto 0);

      OUTPUT_MESSAGE   : out std_logic_vector(7 downto 0);
      RX_DONE          : out std_logic
   );
end rx_rs232_fsm;

architecture Behavioral of rx_rs232_fsm is

	signal RECEIVED_BIT_FLAG 	: std_logic := '1';
	signal STOP_SHIFT_FLAG	 	: std_logic := '0';
	signal COUNTER					: std_logic_vector(3 downto 0)  := (others => '0');
	signal BIT_COUNTER			: std_logic_vector(3 downto 0)  := (others => '0');
	signal OUTPUT_BUF				: std_logic_vector(7 downto 0)  := (others => '0');
	signal K_2						: std_logic_vector(13 downto 0) := (others => '0');
	
	type FSM is (hold, step2, step3);
	signal state : FSM := hold;
	
begin

	RECEIVED_BIT_FLAG <= RECEIVED_BIT;
	K_2			 		<= '0' & K(13 downto 1); -- K_2 = K/2
	STOP_SHIFT_FLAG	<= '0' when BIT_COUNTER < "1000" else '1';
	OUTPUT_MESSAGE		<= OUTPUT_BUF;
	
	DEBUG_COUNTER     <= COUNTER;
	DEBUG_STOP_S		<= STOP_SHIFT_FLAG;

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case state is
			
				when hold => -- aguarda start bit
					COUNTER <= "0000";
					RX_DONE <= '0';
					BIT_COUNTER <= (others => '0');
					if(RECEIVED_BIT_FLAG = '0') then
						COUNTER <= "0001"; -- a primeira contagem deve comecar aqui pois a transicao de estados dura 1 ciclo de clock
						state <= step2;
					end if;
					
					DEBUG_FSM_STATE <= "001";

				when step2 => -- conta K/2
					COUNTER <= COUNTER + '1';
					if(COUNTER = K_2) then
						COUNTER <= "0000";
						state   <= step3;
					end if;
					
					DEBUG_FSM_STATE <= "010";
				
				when step3 => -- preenche e desloca o vetor de saida com os bits recebidos a cada K ciclos de clock
					COUNTER <= COUNTER + '1';
					if(COUNTER = K) then
						COUNTER 			<= (others => '0');
						BIT_COUNTER 	<= BIT_COUNTER + '1';
						if(STOP_SHIFT_FLAG = '0') then
							OUTPUT_BUF <= RECEIVED_BIT_FLAG & OUTPUT_BUF(7 downto 1);
						elsif(BIT_COUNTER = "1010") then
							RX_DONE 	<= '1';
							state 	<= hold;
						end if;
					end if;
					
					DEBUG_FSM_STATE <= "011";
				
				when others =>
					state <= hold;
				
			end case;
		end if;
	end process;
	
end Behavioral;