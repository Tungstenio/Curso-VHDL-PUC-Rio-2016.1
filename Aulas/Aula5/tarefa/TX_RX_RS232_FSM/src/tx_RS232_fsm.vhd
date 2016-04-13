----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  17:14:56 03/02/2016 
-- Module Name:  tx_RS232_fsm - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_RS232_fsm is
	port(
	
		LOCAL_CLOCK	: IN STD_LOGIC;
		DATA_IN		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		TRANSMIT		: IN STD_LOGIC;
		BAUD_RATE	: IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		
		DEBUG			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		
		DATA_OUT		: OUT STD_LOGIC;
		TX_DONE		: OUT STD_LOGIC	
		
	);
end tx_RS232_fsm;

architecture Behavioral of tx_RS232_fsm is

	signal DATA_OUT_BUF 		: STD_LOGIC := '0';
	signal BAUD_COUNTER		: STD_LOGIC_VECTOR(13 DOWNTO 0) := (others => '0');
	signal MSG_BIT_COUNTER	: STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
	signal MESSAGE				: STD_LOGIC_VECTOR(9 DOWNTO 0) := (others => '0');
	signal BAUD_FLAG			: STD_LOGIC := '0';
	signal TX_DONE_BUF		: STD_LOGIC := '0';
	signal TX_FLAG				: STD_LOGIC := '0';
	
	type FSM is (hold, shift, step3);
	signal state : FSM := hold;
	
begin

	process(LOCAL_CLOCK)
	begin
		if(LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			case state is
			
				when hold =>
				
					DEBUG <= "111";
				
					TX_DONE				<= '0';
					MSG_BIT_COUNTER	<= (others => '0');
					DATA_OUT_BUF 		<= '1';
					MESSAGE 				<= (others => '0');
					BAUD_COUNTER		<= (others => '0');
					if(TX_FLAG = '1') then
						
						DEBUG <= "001";
						
						MESSAGE	<= "0" & DATA_IN & "0";
						state 		<= shift;
					end if;
					
				when shift =>
					
					DEBUG <= "010";
				
					BAUD_COUNTER <= BAUD_COUNTER + '1';
					if(BAUD_FLAG = '1') then
					
						DEBUG <= "011";
					
						DATA_OUT_BUF 	<= MESSAGE(0);
						BAUD_COUNTER 	<= (others => '0');
						MESSAGE				<= "1" & MESSAGE(9 DOWNTO 1);
						MSG_BIT_COUNTER	<= MSG_BIT_COUNTER + '1';
						if(TX_DONE_BUF = '1') then
						
							DEBUG <= "100";
						
							state <= step3;
						end if;
					end if;
				
				when step3 =>
				
					DEBUG <= BAUD_FLAG & "0" & BAUD_FLAG;
				
					BAUD_COUNTER <= BAUD_COUNTER + '1';
					if(BAUD_FLAG = '1') then
						DATA_OUT_BUF <= '1';
						TX_DONE		 <= '1';
						state 	 	 <= hold;
					end if;

					
				when others =>
					state <= hold;
						
			end case;
		end if;
	end process;

	TX_FLAG 			<= TRANSMIT;
	BAUD_FLAG 		<= '1' when BAUD_COUNTER = BAUD_RATE else '0';
	TX_DONE_BUF		<= '1' when MSG_BIT_COUNTER = "1001" else '0';
	DATA_OUT			<= DATA_OUT_BUF;	

end Behavioral;