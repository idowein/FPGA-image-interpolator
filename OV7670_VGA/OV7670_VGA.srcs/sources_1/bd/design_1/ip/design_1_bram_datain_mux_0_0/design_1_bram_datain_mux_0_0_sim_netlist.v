// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed May  7 22:23:54 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_bram_datain_mux_0_0/design_1_bram_datain_mux_0_0_sim_netlist.v
// Design      : design_1_bram_datain_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_bram_datain_mux_0_0,bram_datain_mux,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "bram_datain_mux,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module design_1_bram_datain_mux_0_0
   (clk,
    zoom_x2,
    data_in_zoomed_bram,
    data_in_full_bram,
    data_out);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 25000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  input zoom_x2;
  input [11:0]data_in_zoomed_bram;
  input [11:0]data_in_full_bram;
  output [11:0]data_out;

  wire [11:0]data_in_full_bram;
  wire [11:0]data_in_zoomed_bram;
  wire [11:0]data_out;
  wire zoom_x2;

  design_1_bram_datain_mux_0_0_bram_datain_mux U0
       (.data_in_full_bram(data_in_full_bram),
        .data_in_zoomed_bram(data_in_zoomed_bram),
        .data_out(data_out),
        .zoom_x2(zoom_x2));
endmodule

(* ORIG_REF_NAME = "bram_datain_mux" *) 
module design_1_bram_datain_mux_0_0_bram_datain_mux
   (data_out,
    data_in_zoomed_bram,
    data_in_full_bram,
    zoom_x2);
  output [11:0]data_out;
  input [11:0]data_in_zoomed_bram;
  input [11:0]data_in_full_bram;
  input zoom_x2;

  wire [11:0]data_in_full_bram;
  wire [11:0]data_in_zoomed_bram;
  wire [11:0]data_out;
  wire zoom_x2;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[0]_INST_0 
       (.I0(data_in_zoomed_bram[0]),
        .I1(data_in_full_bram[0]),
        .I2(zoom_x2),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[10]_INST_0 
       (.I0(data_in_zoomed_bram[10]),
        .I1(data_in_full_bram[10]),
        .I2(zoom_x2),
        .O(data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[11]_INST_0 
       (.I0(data_in_zoomed_bram[11]),
        .I1(data_in_full_bram[11]),
        .I2(zoom_x2),
        .O(data_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[1]_INST_0 
       (.I0(data_in_zoomed_bram[1]),
        .I1(data_in_full_bram[1]),
        .I2(zoom_x2),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[2]_INST_0 
       (.I0(data_in_zoomed_bram[2]),
        .I1(data_in_full_bram[2]),
        .I2(zoom_x2),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[3]_INST_0 
       (.I0(data_in_zoomed_bram[3]),
        .I1(data_in_full_bram[3]),
        .I2(zoom_x2),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[4]_INST_0 
       (.I0(data_in_zoomed_bram[4]),
        .I1(data_in_full_bram[4]),
        .I2(zoom_x2),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[5]_INST_0 
       (.I0(data_in_zoomed_bram[5]),
        .I1(data_in_full_bram[5]),
        .I2(zoom_x2),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[6]_INST_0 
       (.I0(data_in_zoomed_bram[6]),
        .I1(data_in_full_bram[6]),
        .I2(zoom_x2),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[7]_INST_0 
       (.I0(data_in_zoomed_bram[7]),
        .I1(data_in_full_bram[7]),
        .I2(zoom_x2),
        .O(data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[8]_INST_0 
       (.I0(data_in_zoomed_bram[8]),
        .I1(data_in_full_bram[8]),
        .I2(zoom_x2),
        .O(data_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \data_out[9]_INST_0 
       (.I0(data_in_zoomed_bram[9]),
        .I1(data_in_full_bram[9]),
        .I2(zoom_x2),
        .O(data_out[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
