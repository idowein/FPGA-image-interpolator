-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed May  7 22:23:29 2025
-- Host        : Ido running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_BRAM_MUX_0_0/design_1_BRAM_MUX_0_0_stub.vhdl
-- Design      : design_1_BRAM_MUX_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_BRAM_MUX_0_0 is
  Port ( 
    addr_in : in STD_LOGIC_VECTOR ( 18 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 11 downto 0 );
    write_enable : in STD_LOGIC;
    bram_select : in STD_LOGIC;
    addr_bram1 : out STD_LOGIC_VECTOR ( 18 downto 0 );
    data_bram1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    we_bram1 : out STD_LOGIC;
    addr_bram2 : out STD_LOGIC_VECTOR ( 16 downto 0 );
    data_bram2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    we_bram2 : out STD_LOGIC
  );

end design_1_BRAM_MUX_0_0;

architecture stub of design_1_BRAM_MUX_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "addr_in[18:0],data_in[11:0],write_enable,bram_select,addr_bram1[18:0],data_bram1[11:0],we_bram1,addr_bram2[16:0],data_bram2[11:0],we_bram2";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "BRAM_MUX,Vivado 2019.2";
begin
end;
