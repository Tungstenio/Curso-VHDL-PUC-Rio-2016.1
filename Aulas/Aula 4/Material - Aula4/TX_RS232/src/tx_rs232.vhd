----------------------------------------------------------------------------------
-- Company:      CETUC - Optoelectronics Laboratory
-- Engineer:     Felipe Calliari
--               Gustavo Amaral
--               Rudah Guedes
-- Create Date:  11:55:53 03/02/2016 
-- Module Name:  tx_rs232 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tx_rs232 is
   generic(
      MSG_SIZE         : integer := 8 -- 1 byte
   );
   port(
      LOCAL_CLOCK      : in  std_logic;
      BAUD_RATE        : in  std_logic_vector(13 downto 0);
      MESSAGE_TX       : in  std_logic_vector(MSG_SIZE-1 downto 0);
      TRANSMIT         : in  std_logic;
      
      OUTPUT_BIT       : out std_logic;
      TX_DONE          : out std_logic
   );
end tx_rs232;

architecture Behavioral of tx_rs232 is

   component shiftregister
      generic(SIZE : integer := 16);
      port(
         local_clock : in std_logic;
         load : in std_logic;
         enable : in std_logic;
         sr_left : in std_logic;
         data_in : in std_logic_vector(SIZE-1 downto 0);
         data_out : out std_logic
      );
   end component;

   component tx_counters
      port(
         local_clock : in  std_logic;
         tx_enable : in  std_logic;
         baud_rate : in  std_logic_vector(13 downto 0);

         tx_ing : out std_logic;
         tx_done : out std_logic;
         shift : out  std_logic
      );
   end component;

   signal OUTPUT_BIT_R2      : std_logic := '0';
   signal SHIFT_R2           : std_logic := '0';
   signal MESSAGE_TX_R2      : std_logic_vector(MSG_SIZE+3-1 downto 0) := (others => '0');
   signal TX_DONE_R2         : std_logic := '1';
	signal TRANSMIT_R2        : std_logic := '0';
   signal TRANSMITTING       : std_logic := '0';

begin

   TxCounters : tx_counters
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         TX_ENABLE => TRANSMIT_R2,
         BAUD_RATE => BAUD_RATE,
         
			TX_ING => TRANSMITTING,
         TX_DONE => TX_DONE_R2,
         SHIFT => SHIFT_R2
      );

   SRegister : ShiftRegister
      generic map(SIZE => MSG_SIZE+3)
      port map(
         LOCAL_CLOCK => LOCAL_CLOCK,
         LOAD => TRANSMIT_R2,
         ENABLE => SHIFT_R2,
         SR_LEFT => '0',
         DATA_IN => MESSAGE_TX_R2,

         DATA_OUT => OUTPUT_BIT_R2
      );

	process(LOCAL_CLOCK)
	begin
		if (LOCAL_CLOCK'event and LOCAL_CLOCK = '1') then
			if (TRANSMITTING = '0') then
				TRANSMIT_R2 <= TRANSMIT;
			else
				TRANSMIT_R2 <= '0';
			end if;
		end if;
	end process;

   MESSAGE_TX_R2 <= "10" & MESSAGE_TX & "0";
   OUTPUT_BIT <= OUTPUT_BIT_R2;
   TX_DONE <= TX_DONE_R2;

end Behavioral;
