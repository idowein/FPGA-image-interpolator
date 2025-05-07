// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed May  7 22:00:43 2025
// Host        : dvirhersh_comp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_BRAM_MUX_0_0/design_1_BRAM_MUX_0_0_stub.v
// Design      : design_1_BRAM_MUX_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "BRAM_MUX,Vivado 2019.2" *)
module design_1_BRAM_MUX_0_0(addr_in, data_in, write_enable, bram_select, 
  addr_bram1, data_bram1, we_bram1, addr_bram2, data_bram2, we_bram2)
/* synthesis syn_black_box black_box_pad_pin="addr_in[18:0],data_in[11:0],write_enable,bram_select,addr_bram1[18:0],data_bram1[11:0],we_bram1,addr_bram2[16:0],data_bram2[11:0],we_bram2" */;
  input [18:0]addr_in;
  input [11:0]data_in;
  input write_enable;
  input bram_select;
  output [18:0]addr_bram1;
  output [11:0]data_bram1;
  output we_bram1;
  output [16:0]addr_bram2;
  output [11:0]data_bram2;
  output we_bram2;
endmodule
