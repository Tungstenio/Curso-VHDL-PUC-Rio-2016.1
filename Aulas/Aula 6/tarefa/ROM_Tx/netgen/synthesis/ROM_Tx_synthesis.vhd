--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: ROM_Tx_synthesis.vhd
-- /___/   /\     Timestamp: Tue May 03 16:58:36 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ROM_Tx -w -dir netgen/synthesis -ofmt vhdl -sim ROM_Tx.ngc ROM_Tx_synthesis.vhd 
-- Device	: xc3s1200e-4-ft256
-- Input file	: ROM_Tx.ngc
-- Output file	: C:\Users\Opto2\Dropbox\Curso de Extensao VHDL\Em Desenvolvimento\Aula6\tarefa\ROM_Tx\netgen\synthesis\ROM_Tx_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ROM_Tx
-- Xilinx	: C:\Xilinx\14.5\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity ROM_Tx is
  port (
    TX_DATA : out STD_LOGIC; 
    START : in STD_LOGIC := 'X'; 
    LOCAL_CLOCK : in STD_LOGIC := 'X'; 
    DONE : out STD_LOGIC; 
    DEBUG_PROCESSING : out STD_LOGIC; 
    DEBUG_TRANSMIT : out STD_LOGIC; 
    DEBUG_COUNTER : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    DEBUG_ROM_DATA_AD : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    DEBUG_ROM_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    DEBUG_LIMIT : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    K : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end ROM_Tx;

architecture Structure of ROM_Tx is
  signal DEBUG_LIMIT_0_OBUF_9 : STD_LOGIC; 
  signal DEBUG_LIMIT_2_OBUF_10 : STD_LOGIC; 
  signal DEBUG_PROCESSING_inv : STD_LOGIC; 
  signal DEBUG_TRANSMIT_OBUF_24 : STD_LOGIC; 
  signal DONE_OBUF_26 : STD_LOGIC; 
  signal Inst_biestavel_PROCESSING_R2_27 : STD_LOGIC; 
  signal Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux00011 : STD_LOGIC; 
  signal Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000111 : STD_LOGIC; 
  signal Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000121 : STD_LOGIC; 
  signal Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_0_Q : STD_LOGIC; 
  signal Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_1_Q : STD_LOGIC; 
  signal Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q : STD_LOGIC; 
  signal Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q : STD_LOGIC; 
  signal Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q : STD_LOGIC; 
  signal Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001 : STD_LOGIC; 
  signal Inst_tx_rs232_SRegister_DATA_OUT_R2_58 : STD_LOGIC; 
  signal Inst_tx_rs232_SRegister_DATA_OUT_R2_not0001 : STD_LOGIC; 
  signal Inst_tx_rs232_TRANSMITTING : STD_LOGIC; 
  signal Inst_tx_rs232_TRANSMIT_R2_61 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_BAUD_FLAG : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_63 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_mux0001 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_M_DONE : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_M_DONE_R1_66 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_Result_0_1 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_Result_1_1 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_Result_2_1 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_Result_3_1 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_rt_137 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_rt_139 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_rt_141 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_rt_143 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_rt_145 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_rt_147 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_rt_149 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_rt_151 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_rt_153 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_rt_155 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_rt_157 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_rt_159 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_rt_161 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_rt_163 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_15_rt_165 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_rt_167 : STD_LOGIC; 
  signal Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000 : STD_LOGIC; 
  signal K_0_IBUF_218 : STD_LOGIC; 
  signal K_10_IBUF_219 : STD_LOGIC; 
  signal K_11_IBUF_220 : STD_LOGIC; 
  signal K_12_IBUF_221 : STD_LOGIC; 
  signal K_13_IBUF_222 : STD_LOGIC; 
  signal K_14_IBUF_223 : STD_LOGIC; 
  signal K_15_IBUF_224 : STD_LOGIC; 
  signal K_1_IBUF_225 : STD_LOGIC; 
  signal K_2_IBUF_226 : STD_LOGIC; 
  signal K_3_IBUF_227 : STD_LOGIC; 
  signal K_4_IBUF_228 : STD_LOGIC; 
  signal K_5_IBUF_229 : STD_LOGIC; 
  signal K_6_IBUF_230 : STD_LOGIC; 
  signal K_7_IBUF_231 : STD_LOGIC; 
  signal K_8_IBUF_232 : STD_LOGIC; 
  signal K_9_IBUF_233 : STD_LOGIC; 
  signal LOCAL_CLOCK_BUFGP_235 : STD_LOGIC; 
  signal ROM_DATA_ADDRESS_not0001 : STD_LOGIC; 
  signal ROM_DONE : STD_LOGIC; 
  signal START_IBUF_244 : STD_LOGIC; 
  signal TX_FLAG_246 : STD_LOGIC; 
  signal COUNTER : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal Inst_tx_rs232_SRegister_DATA_MEM_R2 : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001 : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_Result : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy : STD_LOGIC_VECTOR ( 14 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy : STD_LOGIC_VECTOR ( 14 downto 0 ); 
  signal Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut : STD_LOGIC_VECTOR ( 15 downto 1 ); 
  signal Inst_tx_rs232_TxCounters_m_count_COUNTER : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal ROM_DATA_ADDRESS : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => DEBUG_LIMIT_0_OBUF_9
    );
  XST_VCC : VCC
    port map (
      P => DEBUG_LIMIT_2_OBUF_10
    );
  TX_FLAG : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_M_DONE_R1_66,
      Q => TX_FLAG_246
    );
  ROM_DATA_ADDRESS_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => ROM_DATA_ADDRESS_not0001,
      D => Result(0),
      Q => ROM_DATA_ADDRESS(0)
    );
  ROM_DATA_ADDRESS_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => ROM_DATA_ADDRESS_not0001,
      D => Result(1),
      Q => ROM_DATA_ADDRESS(1)
    );
  Inst_biestavel_PROCESSING_R2 : FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => ROM_DONE,
      D => DEBUG_LIMIT_0_OBUF_9,
      S => START_IBUF_244,
      Q => Inst_biestavel_PROCESSING_R2_27
    );
  Inst_tx_rs232_TRANSMIT_R2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => DEBUG_TRANSMIT_OBUF_24,
      R => Inst_tx_rs232_TRANSMITTING,
      Q => Inst_tx_rs232_TRANSMIT_R2_61
    );
  COUNTER_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_M_DONE_R1_66,
      D => Result(0),
      R => DEBUG_PROCESSING_inv,
      Q => COUNTER(0)
    );
  COUNTER_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_M_DONE_R1_66,
      D => Result(1),
      R => DEBUG_PROCESSING_inv,
      Q => COUNTER(1)
    );
  COUNTER_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_M_DONE_R1_66,
      D => Result(2),
      R => DEBUG_PROCESSING_inv,
      Q => COUNTER(2)
    );
  Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => DEBUG_LIMIT_2_OBUF_10,
      R => DEBUG_PROCESSING_inv,
      Q => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q
    );
  Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000121,
      R => DEBUG_PROCESSING_inv,
      Q => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q
    );
  Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux00011,
      R => DEBUG_PROCESSING_inv,
      Q => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_1_Q
    );
  Inst_tx_rs232_SRegister_DATA_OUT_R2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_OUT_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2(0),
      Q => Inst_tx_rs232_SRegister_DATA_OUT_R2_58
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => DEBUG_LIMIT_2_OBUF_10,
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(10)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(9),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(9)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(8),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(8)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(7),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(7)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(6),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(6)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(5),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(5)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(4),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(4)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(3),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(3)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(2),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(2)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(1),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(1)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001,
      D => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(0),
      Q => Inst_tx_rs232_SRegister_DATA_MEM_R2(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_7_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(6),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(7),
      O => Inst_tx_rs232_TxCounters_BAUD_FLAG
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_7_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(15),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(14),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(15),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(14),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_6_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(5),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(6),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_6_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(13),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(12),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(13),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(12),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_5_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(4),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(5),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_5_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(11),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(10),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(11),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(10),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_4_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(3),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(4),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_4_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(9),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(8),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(9),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(8),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_3_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(2),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(3),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_3_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(7),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(6),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(7),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(6),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_2_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(1),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(2),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_2_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(5),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(4),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(5),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(4),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_1_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(0),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(1),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_1_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(3),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(2),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(3),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(2),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy_0_Q : MUXCY
    port map (
      CI => DEBUG_LIMIT_2_OBUF_10,
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(0),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_cy(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut_0_Q : LUT4
    generic map(
      INIT => X"8421"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(1),
      I1 => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(0),
      I2 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(1),
      I3 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(0),
      O => Inst_tx_rs232_TxCounters_b_count_Mcompar_BAUD_FLAG_cmp_eq0000_lut(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_15_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(14),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_15_rt_165,
      O => Inst_tx_rs232_TxCounters_Result(15)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_14_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(13),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_rt_145,
      O => Inst_tx_rs232_TxCounters_Result(14)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(13),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_rt_145,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(14)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_13_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(12),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_rt_143,
      O => Inst_tx_rs232_TxCounters_Result(13)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(12),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_rt_143,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(13)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_12_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(11),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_rt_141,
      O => Inst_tx_rs232_TxCounters_Result(12)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(11),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_rt_141,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(12)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_11_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(10),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_rt_139,
      O => Inst_tx_rs232_TxCounters_Result(11)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(10),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_rt_139,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(11)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_10_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(9),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_rt_137,
      O => Inst_tx_rs232_TxCounters_Result(10)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(9),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_rt_137,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(10)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_9_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(8),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_rt_163,
      O => Inst_tx_rs232_TxCounters_Result(9)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(8),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_rt_163,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(9)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_8_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(7),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_rt_161,
      O => Inst_tx_rs232_TxCounters_Result(8)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(7),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_rt_161,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(8)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_7_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(6),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_rt_159,
      O => Inst_tx_rs232_TxCounters_Result(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(6),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_rt_159,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_6_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(5),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_rt_157,
      O => Inst_tx_rs232_TxCounters_Result(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(5),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_rt_157,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_5_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(4),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_rt_155,
      O => Inst_tx_rs232_TxCounters_Result(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(4),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_rt_155,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_4_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(3),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_rt_153,
      O => Inst_tx_rs232_TxCounters_Result(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(3),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_rt_153,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_3_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(2),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_rt_151,
      O => Inst_tx_rs232_TxCounters_Result(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(2),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_rt_151,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_2_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(1),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_rt_149,
      O => Inst_tx_rs232_TxCounters_Result(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(1),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_rt_149,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_1_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(0),
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_rt_147,
      O => Inst_tx_rs232_TxCounters_Result(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(0),
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_rt_147,
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_0_Q : XORCY
    port map (
      CI => DEBUG_LIMIT_0_OBUF_9,
      LI => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_lut(0),
      O => Inst_tx_rs232_TxCounters_Result(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_0_Q : MUXCY
    port map (
      CI => DEBUG_LIMIT_0_OBUF_9,
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_lut(0),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_15_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(14),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(15),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(15)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_14_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(13),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(14),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(14)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(13),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(14),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(14)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_13_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(12),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(13),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(13)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(12),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(13),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(13)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_12_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(11),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(12),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(12)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(11),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(12),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(12)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_11_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(10),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(11),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(11)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(10),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(11),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(11)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_10_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(9),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(10),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(10)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(9),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(10),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(10)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_9_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(8),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(9),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(9)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(8),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(9),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(9)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_8_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(7),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(8),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(8)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(7),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(8),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(8)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_7_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(6),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(7),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(6),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(7),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_6_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(5),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(6),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(5),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(6),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_5_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(4),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(5),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(4),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(5),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_4_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(3),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(4),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(3),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(4),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_3_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(2),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(3),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(2),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(3),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_2_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(1),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(2),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(1),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(2),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_1_Q : XORCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(0),
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(1),
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(0),
      DI => DEBUG_LIMIT_2_OBUF_10,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(1),
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(1)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_xor_0_Q : XORCY
    port map (
      CI => DEBUG_LIMIT_2_OBUF_10,
      LI => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_rt_167,
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_FLAG_addsub0000(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_Q : MUXCY
    port map (
      CI => DEBUG_LIMIT_2_OBUF_10,
      DI => DEBUG_LIMIT_0_OBUF_9,
      S => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_rt_167,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy(0)
    );
  Inst_tx_rs232_TxCounters_m_count_COUNTER_3 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      D => Inst_tx_rs232_TxCounters_Result_3_1,
      R => Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_m_count_COUNTER(3)
    );
  Inst_tx_rs232_TxCounters_m_count_COUNTER_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      D => Inst_tx_rs232_TxCounters_Result_2_1,
      R => Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_m_count_COUNTER(2)
    );
  Inst_tx_rs232_TxCounters_m_count_COUNTER_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      D => Inst_tx_rs232_TxCounters_Result_1_1,
      R => Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_m_count_COUNTER(1)
    );
  Inst_tx_rs232_TxCounters_m_count_COUNTER_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      D => Inst_tx_rs232_TxCounters_Result_0_1,
      R => Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_m_count_COUNTER(0)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(15),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(15)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(14),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(14)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(13),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(13)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(12),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(12)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(11),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(11)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(10),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(10)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(9),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(9)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(8),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(8)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(7),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(7)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(6),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(6)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(5),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(5)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(4),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(4)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(3),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(3)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(2),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(2)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(1),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(1)
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_Result(0),
      R => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000,
      Q => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(0)
    );
  Inst_tx_rs232_TxCounters_M_DONE_R1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_tx_rs232_TxCounters_M_DONE,
      Q => Inst_tx_rs232_TxCounters_M_DONE_R1_66
    );
  Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      CE => Inst_tx_rs232_TRANSMITTING,
      D => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_mux0001,
      Q => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_63
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_9_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_SRegister_DATA_MEM_R2(10),
      I1 => Inst_tx_rs232_TRANSMIT_R2_61,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(9)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_0_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_SRegister_DATA_MEM_R2(1),
      I1 => Inst_tx_rs232_TRANSMIT_R2_61,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(0)
    );
  Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux0001111 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => ROM_DATA_ADDRESS(0),
      I1 => ROM_DATA_ADDRESS(1),
      O => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux00011
    );
  Result_1_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => COUNTER(1),
      I1 => COUNTER(0),
      O => Result(1)
    );
  Inst_tx_rs232_TxCounters_m_count_Mcount_COUNTER_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_m_count_COUNTER(1),
      I1 => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      O => Inst_tx_rs232_TxCounters_Result_1_1
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_8_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(9),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(8)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_7_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(8),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(7)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_6_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(7),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(6)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_5_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(6),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(5)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_4_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(5),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(4)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_3_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(4),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(3)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_2_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(3),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_1_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(2)
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001_1_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_SRegister_DATA_MEM_R2(2),
      I2 => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_0_Q,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_mux0001(1)
    );
  Mcount_COUNTER_xor_2_11 : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => COUNTER(1),
      I1 => COUNTER(2),
      I2 => COUNTER(0),
      O => Result(2)
    );
  Inst_tx_rs232_TxCounters_m_count_Mcount_COUNTER_xor_2_11 : LUT3
    generic map(
      INIT => X"6C"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      I1 => Inst_tx_rs232_TxCounters_m_count_COUNTER(2),
      I2 => Inst_tx_rs232_TxCounters_m_count_COUNTER(1),
      O => Inst_tx_rs232_TxCounters_Result_2_1
    );
  Inst_tx_rs232_TxCounters_m_count_Mcount_COUNTER_xor_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_m_count_COUNTER(3),
      I1 => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      I2 => Inst_tx_rs232_TxCounters_m_count_COUNTER(1),
      I3 => Inst_tx_rs232_TxCounters_m_count_COUNTER(2),
      O => Inst_tx_rs232_TxCounters_Result_3_1
    );
  ROM_DATA_ADDRESS_not00011 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_M_DONE_R1_66,
      I1 => Inst_biestavel_PROCESSING_R2_27,
      O => ROM_DATA_ADDRESS_not0001
    );
  TRANSMIT1 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => ROM_DONE,
      I1 => START_IBUF_244,
      I2 => TX_FLAG_246,
      O => DEBUG_TRANSMIT_OBUF_24
    );
  ROM_DONE_cmp_eq00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => COUNTER(0),
      I1 => COUNTER(1),
      I2 => COUNTER(2),
      O => ROM_DONE
    );
  Inst_tx_rs232_TxCounters_M_DONE1 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_m_count_COUNTER(3),
      I1 => Inst_tx_rs232_TxCounters_m_count_COUNTER(2),
      I2 => Inst_tx_rs232_TxCounters_m_count_COUNTER(1),
      I3 => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      O => Inst_tx_rs232_TxCounters_M_DONE
    );
  Inst_tx_rs232_TxCounters_TRANSMITTING1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_63,
      I1 => Inst_tx_rs232_TRANSMIT_R2_61,
      O => Inst_tx_rs232_TRANSMITTING
    );
  Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or00001 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMITTING,
      I1 => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      O => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER_or0000
    );
  START_IBUF : IBUF
    port map (
      I => START,
      O => START_IBUF_244
    );
  K_15_IBUF : IBUF
    port map (
      I => K(15),
      O => K_15_IBUF_224
    );
  K_14_IBUF : IBUF
    port map (
      I => K(14),
      O => K_14_IBUF_223
    );
  K_13_IBUF : IBUF
    port map (
      I => K(13),
      O => K_13_IBUF_222
    );
  K_12_IBUF : IBUF
    port map (
      I => K(12),
      O => K_12_IBUF_221
    );
  K_11_IBUF : IBUF
    port map (
      I => K(11),
      O => K_11_IBUF_220
    );
  K_10_IBUF : IBUF
    port map (
      I => K(10),
      O => K_10_IBUF_219
    );
  K_9_IBUF : IBUF
    port map (
      I => K(9),
      O => K_9_IBUF_233
    );
  K_8_IBUF : IBUF
    port map (
      I => K(8),
      O => K_8_IBUF_232
    );
  K_7_IBUF : IBUF
    port map (
      I => K(7),
      O => K_7_IBUF_231
    );
  K_6_IBUF : IBUF
    port map (
      I => K(6),
      O => K_6_IBUF_230
    );
  K_5_IBUF : IBUF
    port map (
      I => K(5),
      O => K_5_IBUF_229
    );
  K_4_IBUF : IBUF
    port map (
      I => K(4),
      O => K_4_IBUF_228
    );
  K_3_IBUF : IBUF
    port map (
      I => K(3),
      O => K_3_IBUF_227
    );
  K_2_IBUF : IBUF
    port map (
      I => K(2),
      O => K_2_IBUF_226
    );
  K_1_IBUF : IBUF
    port map (
      I => K(1),
      O => K_1_IBUF_225
    );
  K_0_IBUF : IBUF
    port map (
      I => K(0),
      O => K_0_IBUF_218
    );
  TX_DATA_OBUF : OBUF
    port map (
      I => Inst_tx_rs232_SRegister_DATA_OUT_R2_58,
      O => TX_DATA
    );
  DONE_OBUF : OBUF
    port map (
      I => DONE_OBUF_26,
      O => DONE
    );
  DEBUG_PROCESSING_OBUF : OBUF
    port map (
      I => Inst_biestavel_PROCESSING_R2_27,
      O => DEBUG_PROCESSING
    );
  DEBUG_TRANSMIT_OBUF : OBUF
    port map (
      I => DEBUG_TRANSMIT_OBUF_24,
      O => DEBUG_TRANSMIT
    );
  DEBUG_COUNTER_2_OBUF : OBUF
    port map (
      I => COUNTER(2),
      O => DEBUG_COUNTER(2)
    );
  DEBUG_COUNTER_1_OBUF : OBUF
    port map (
      I => COUNTER(1),
      O => DEBUG_COUNTER(1)
    );
  DEBUG_COUNTER_0_OBUF : OBUF
    port map (
      I => COUNTER(0),
      O => DEBUG_COUNTER(0)
    );
  DEBUG_ROM_DATA_AD_1_OBUF : OBUF
    port map (
      I => ROM_DATA_ADDRESS(1),
      O => DEBUG_ROM_DATA_AD(1)
    );
  DEBUG_ROM_DATA_AD_0_OBUF : OBUF
    port map (
      I => ROM_DATA_ADDRESS(0),
      O => DEBUG_ROM_DATA_AD(0)
    );
  DEBUG_ROM_DATA_7_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q,
      O => DEBUG_ROM_DATA(7)
    );
  DEBUG_ROM_DATA_6_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q,
      O => DEBUG_ROM_DATA(6)
    );
  DEBUG_ROM_DATA_5_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_5_Q,
      O => DEBUG_ROM_DATA(5)
    );
  DEBUG_ROM_DATA_4_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q,
      O => DEBUG_ROM_DATA(4)
    );
  DEBUG_ROM_DATA_3_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_3_Q,
      O => DEBUG_ROM_DATA(3)
    );
  DEBUG_ROM_DATA_2_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q,
      O => DEBUG_ROM_DATA(2)
    );
  DEBUG_ROM_DATA_1_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_1_Q,
      O => DEBUG_ROM_DATA(1)
    );
  DEBUG_ROM_DATA_0_OBUF : OBUF
    port map (
      I => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_0_Q,
      O => DEBUG_ROM_DATA(0)
    );
  DEBUG_LIMIT_2_OBUF : OBUF
    port map (
      I => DEBUG_LIMIT_2_OBUF_10,
      O => DEBUG_LIMIT(2)
    );
  DEBUG_LIMIT_1_OBUF : OBUF
    port map (
      I => DEBUG_LIMIT_0_OBUF_9,
      O => DEBUG_LIMIT(1)
    );
  DEBUG_LIMIT_0_OBUF : OBUF
    port map (
      I => DEBUG_LIMIT_0_OBUF_9,
      O => DEBUG_LIMIT(0)
    );
  Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000121,
      R => DEBUG_PROCESSING_inv,
      S => ROM_DATA_ADDRESS(0),
      Q => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_2_Q
    );
  Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_0 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => LOCAL_CLOCK_BUFGP_235,
      D => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000111,
      R => DEBUG_PROCESSING_inv,
      S => ROM_DATA_ADDRESS(1),
      Q => Inst_generic_ROM_clk_ROM_DATA_OUTPUT_R0_0_Q
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(14),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_14_rt_145
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(13),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_13_rt_143
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(12),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_12_rt_141
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(11),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_11_rt_139
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(10),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_10_rt_137
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(9),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_9_rt_163
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(8),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_8_rt_161
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(7),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_7_rt_159
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(6),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_6_rt_157
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(5),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_5_rt_155
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(4),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_4_rt_153
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(3),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_3_rt_151
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(2),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_2_rt_149
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(1),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_cy_1_rt_147
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => K_0_IBUF_218,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_cy_0_rt_167
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(15),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_xor_15_rt_165
    );
  Inst_tx_rs232_SRegister_DATA_OUT_R2_not00011 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_TRANSMITTING,
      I2 => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      O => Inst_tx_rs232_SRegister_DATA_OUT_R2_not0001
    );
  Inst_tx_rs232_SRegister_DATA_MEM_R2_not00011 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => Inst_tx_rs232_TRANSMIT_R2_61,
      I1 => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_63,
      I2 => Inst_tx_rs232_TxCounters_BAUD_FLAG,
      O => Inst_tx_rs232_SRegister_DATA_MEM_R2_not0001
    );
  Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_mux00011 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      I1 => Inst_tx_rs232_TxCounters_m_count_COUNTER(2),
      I2 => Inst_tx_rs232_TxCounters_m_count_COUNTER(1),
      I3 => Inst_tx_rs232_TxCounters_m_count_COUNTER(3),
      O => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_mux0001
    );
  Inst_tx_rs232_TxCounters_m_count_COUNTER_or00001 : LUT3
    generic map(
      INIT => X"F1"
    )
    port map (
      I0 => Inst_tx_rs232_TxCounters_HOLD_TRANSMISSION_63,
      I1 => Inst_tx_rs232_TRANSMIT_R2_61,
      I2 => Inst_tx_rs232_TxCounters_M_DONE,
      O => Inst_tx_rs232_TxCounters_m_count_COUNTER_or0000
    );
  DONE1 : LUT4
    generic map(
      INIT => X"0010"
    )
    port map (
      I0 => COUNTER(0),
      I1 => COUNTER(1),
      I2 => COUNTER(2),
      I3 => Inst_biestavel_PROCESSING_R2_27,
      O => DONE_OBUF_26
    );
  LOCAL_CLOCK_BUFGP : BUFGP
    port map (
      I => LOCAL_CLOCK,
      O => LOCAL_CLOCK_BUFGP_235
    );
  Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_lut_0_INV_0 : INV
    port map (
      I => Inst_tx_rs232_TxCounters_b_count_BAUD_COUNTER(0),
      O => Inst_tx_rs232_TxCounters_b_count_Mcount_BAUD_COUNTER_lut(0)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_15_INV_0 : INV
    port map (
      I => K_15_IBUF_224,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(15)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_14_INV_0 : INV
    port map (
      I => K_14_IBUF_223,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(14)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_13_INV_0 : INV
    port map (
      I => K_13_IBUF_222,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(13)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_12_INV_0 : INV
    port map (
      I => K_12_IBUF_221,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(12)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_11_INV_0 : INV
    port map (
      I => K_11_IBUF_220,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(11)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_10_INV_0 : INV
    port map (
      I => K_10_IBUF_219,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(10)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_9_INV_0 : INV
    port map (
      I => K_9_IBUF_233,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(9)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_8_INV_0 : INV
    port map (
      I => K_8_IBUF_232,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(8)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_7_INV_0 : INV
    port map (
      I => K_7_IBUF_231,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(7)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_6_INV_0 : INV
    port map (
      I => K_6_IBUF_230,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(6)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_5_INV_0 : INV
    port map (
      I => K_5_IBUF_229,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(5)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_4_INV_0 : INV
    port map (
      I => K_4_IBUF_228,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(4)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_3_INV_0 : INV
    port map (
      I => K_3_IBUF_227,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(3)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_2_INV_0 : INV
    port map (
      I => K_2_IBUF_226,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(2)
    );
  Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut_1_INV_0 : INV
    port map (
      I => K_1_IBUF_225,
      O => Inst_tx_rs232_TxCounters_b_count_Msub_BAUD_FLAG_addsub0000_lut(1)
    );
  Result_0_1_INV_0 : INV
    port map (
      I => COUNTER(0),
      O => Result(0)
    );
  Inst_tx_rs232_TxCounters_m_count_Mcount_COUNTER_xor_0_11_INV_0 : INV
    port map (
      I => Inst_tx_rs232_TxCounters_m_count_COUNTER(0),
      O => Inst_tx_rs232_TxCounters_Result_0_1
    );
  Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000131_INV_0 : INV
    port map (
      I => ROM_DATA_ADDRESS(1),
      O => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000121
    );
  Inst_generic_ROM_clk_ROM_ENABLE_inv1_INV_0 : INV
    port map (
      I => Inst_biestavel_PROCESSING_R2_27,
      O => DEBUG_PROCESSING_inv
    );
  Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux0001112_INV_0 : INV
    port map (
      I => ROM_DATA_ADDRESS(0),
      O => Inst_generic_ROM_clk_Mrom_ROM_DATA_OUTPUT_R0_mux000111
    );

end Structure;

