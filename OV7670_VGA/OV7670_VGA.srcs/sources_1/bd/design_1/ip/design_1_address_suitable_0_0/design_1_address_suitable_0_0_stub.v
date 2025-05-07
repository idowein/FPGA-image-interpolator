// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed May  7 22:23:27 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_address_suitable_0_0/design_1_address_suitable_0_0_stub.v
// Design      : design_1_address_suitable_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "address_suitable,Vivado 2019.2" *)
module design_1_address_suitable_0_0(addr_in, addr_out)
/* synthesis syn_black_box black_box_pad_pin="addr_in[18:0],addr_out[16:0]" */;
  input [18:0]addr_in;
  output [16:0]addr_out;
endmodule
