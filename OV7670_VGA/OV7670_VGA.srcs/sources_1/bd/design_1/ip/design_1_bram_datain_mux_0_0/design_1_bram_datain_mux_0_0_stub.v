// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May  8 18:37:12 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_bram_datain_mux_0_0/design_1_bram_datain_mux_0_0_stub.v
// Design      : design_1_bram_datain_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bram_datain_mux,Vivado 2019.2" *)
module design_1_bram_datain_mux_0_0(clk, bili_cntl, zoom_x2, data_in_zoomed_bram, 
  data_in_full_bram, data_out)
/* synthesis syn_black_box black_box_pad_pin="clk,bili_cntl,zoom_x2,data_in_zoomed_bram[11:0],data_in_full_bram[11:0],data_out[11:0]" */;
  input clk;
  input bili_cntl;
  input zoom_x2;
  input [11:0]data_in_zoomed_bram;
  input [11:0]data_in_full_bram;
  output [11:0]data_out;
endmodule
