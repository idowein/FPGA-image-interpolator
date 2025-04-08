-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Apr  8 12:55:17 2025
-- Host        : Ido running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/idowe/myProjects/FPGA-image-interpolator/pmod_to_vga/pmod_to_vga.srcs/sources_1/bd/design_1/ip/design_1_xlconstant_0_0_0/design_1_xlconstant_0_0_0_stub.vhdl
-- Design      : design_1_xlconstant_0_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_xlconstant_0_0_0 is
  Port ( 
    din : in STD_LOGIC_VECTOR ( 0 to 0 )
  );

end design_1_xlconstant_0_0_0;

architecture stub of design_1_xlconstant_0_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "din[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xlconstant_0,Vivado 2019.2";
begin
end;
