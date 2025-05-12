// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon May 12 15:07:53 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_VGA_TOP_1_0/design_1_VGA_TOP_1_0_stub.v
// Design      : design_1_VGA_TOP_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "VGA_TOP,Vivado 2019.2" *)
module design_1_VGA_TOP_1_0(pix_clk, cntl, zoom_x2, frame_fix, VGA_H_sync, 
  vga_V_sync, vga_red, vga_blue, vga_green, frame_adress)
/* synthesis syn_black_box black_box_pad_pin="pix_clk,cntl,zoom_x2,frame_fix[11:0],VGA_H_sync,vga_V_sync,vga_red[3:0],vga_blue[3:0],vga_green[3:0],frame_adress[18:0]" */;
  input pix_clk;
  input cntl;
  input zoom_x2;
  input [11:0]frame_fix;
  output VGA_H_sync;
  output vga_V_sync;
  output [3:0]vga_red;
  output [3:0]vga_blue;
  output [3:0]vga_green;
  output [18:0]frame_adress;
endmodule
