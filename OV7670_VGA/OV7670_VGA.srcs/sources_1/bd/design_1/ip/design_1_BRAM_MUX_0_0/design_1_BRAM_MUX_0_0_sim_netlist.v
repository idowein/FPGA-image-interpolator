// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed May  7 22:00:43 2025
// Host        : dvirhersh_comp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_BRAM_MUX_0_0/design_1_BRAM_MUX_0_0_sim_netlist.v
// Design      : design_1_BRAM_MUX_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_BRAM_MUX_0_0,BRAM_MUX,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "BRAM_MUX,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module design_1_BRAM_MUX_0_0
   (addr_in,
    data_in,
    write_enable,
    bram_select,
    addr_bram1,
    data_bram1,
    we_bram1,
    addr_bram2,
    data_bram2,
    we_bram2);
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

  wire [18:0]addr_bram1;
  wire [16:0]addr_bram2;
  wire [18:0]addr_in;
  wire bram_select;
  wire [11:0]data_bram1;
  wire [11:0]data_bram2;
  wire [11:0]data_in;
  wire we_bram1;
  wire we_bram2;
  wire write_enable;

  design_1_BRAM_MUX_0_0_BRAM_MUX U0
       (.addr_bram1(addr_bram1),
        .addr_in(addr_in),
        .bram_select(bram_select),
        .data_bram1(data_bram1),
        .data_in(data_in));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[0]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[0]),
        .O(addr_bram2[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[10]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[10]),
        .O(addr_bram2[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[11]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[11]),
        .O(addr_bram2[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[12]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[12]),
        .O(addr_bram2[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[13]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[13]),
        .O(addr_bram2[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[14]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[14]),
        .O(addr_bram2[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[15]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[15]),
        .O(addr_bram2[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[16]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[16]),
        .O(addr_bram2[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[1]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[1]),
        .O(addr_bram2[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[2]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[2]),
        .O(addr_bram2[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[3]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[3]),
        .O(addr_bram2[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[4]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[4]),
        .O(addr_bram2[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[5]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[5]),
        .O(addr_bram2[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[6]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[6]),
        .O(addr_bram2[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[7]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[7]),
        .O(addr_bram2[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[8]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[8]),
        .O(addr_bram2[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \addr_bram2[9]_INST_0 
       (.I0(bram_select),
        .I1(addr_in[9]),
        .O(addr_bram2[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[0]_INST_0 
       (.I0(bram_select),
        .I1(data_in[0]),
        .O(data_bram2[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[10]_INST_0 
       (.I0(bram_select),
        .I1(data_in[10]),
        .O(data_bram2[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[11]_INST_0 
       (.I0(bram_select),
        .I1(data_in[11]),
        .O(data_bram2[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[1]_INST_0 
       (.I0(bram_select),
        .I1(data_in[1]),
        .O(data_bram2[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[2]_INST_0 
       (.I0(bram_select),
        .I1(data_in[2]),
        .O(data_bram2[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[3]_INST_0 
       (.I0(bram_select),
        .I1(data_in[3]),
        .O(data_bram2[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[4]_INST_0 
       (.I0(bram_select),
        .I1(data_in[4]),
        .O(data_bram2[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[5]_INST_0 
       (.I0(bram_select),
        .I1(data_in[5]),
        .O(data_bram2[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[6]_INST_0 
       (.I0(bram_select),
        .I1(data_in[6]),
        .O(data_bram2[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[7]_INST_0 
       (.I0(bram_select),
        .I1(data_in[7]),
        .O(data_bram2[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[8]_INST_0 
       (.I0(bram_select),
        .I1(data_in[8]),
        .O(data_bram2[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_bram2[9]_INST_0 
       (.I0(bram_select),
        .I1(data_in[9]),
        .O(data_bram2[9]));
  LUT2 #(
    .INIT(4'h2)) 
    we_bram1_INST_0
       (.I0(write_enable),
        .I1(bram_select),
        .O(we_bram1));
  LUT2 #(
    .INIT(4'h8)) 
    we_bram2_INST_0
       (.I0(bram_select),
        .I1(write_enable),
        .O(we_bram2));
endmodule

(* ORIG_REF_NAME = "BRAM_MUX" *) 
module design_1_BRAM_MUX_0_0_BRAM_MUX
   (addr_bram1,
    data_bram1,
    addr_in,
    bram_select,
    data_in);
  output [18:0]addr_bram1;
  output [11:0]data_bram1;
  input [18:0]addr_in;
  input bram_select;
  input [11:0]data_in;

  wire [18:0]addr_bram1;
  wire [18:0]addr_in;
  wire bram_select;
  wire [11:0]data_bram1;
  wire [11:0]data_in;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[0]_INST_0 
       (.I0(addr_in[0]),
        .I1(bram_select),
        .O(addr_bram1[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[10]_INST_0 
       (.I0(addr_in[10]),
        .I1(bram_select),
        .O(addr_bram1[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[11]_INST_0 
       (.I0(addr_in[11]),
        .I1(bram_select),
        .O(addr_bram1[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[12]_INST_0 
       (.I0(addr_in[12]),
        .I1(bram_select),
        .O(addr_bram1[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[13]_INST_0 
       (.I0(addr_in[13]),
        .I1(bram_select),
        .O(addr_bram1[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[14]_INST_0 
       (.I0(addr_in[14]),
        .I1(bram_select),
        .O(addr_bram1[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[15]_INST_0 
       (.I0(addr_in[15]),
        .I1(bram_select),
        .O(addr_bram1[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[16]_INST_0 
       (.I0(addr_in[16]),
        .I1(bram_select),
        .O(addr_bram1[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[17]_INST_0 
       (.I0(addr_in[17]),
        .I1(bram_select),
        .O(addr_bram1[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[18]_INST_0 
       (.I0(addr_in[18]),
        .I1(bram_select),
        .O(addr_bram1[18]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[1]_INST_0 
       (.I0(addr_in[1]),
        .I1(bram_select),
        .O(addr_bram1[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[2]_INST_0 
       (.I0(addr_in[2]),
        .I1(bram_select),
        .O(addr_bram1[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[3]_INST_0 
       (.I0(addr_in[3]),
        .I1(bram_select),
        .O(addr_bram1[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[4]_INST_0 
       (.I0(addr_in[4]),
        .I1(bram_select),
        .O(addr_bram1[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[5]_INST_0 
       (.I0(addr_in[5]),
        .I1(bram_select),
        .O(addr_bram1[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[6]_INST_0 
       (.I0(addr_in[6]),
        .I1(bram_select),
        .O(addr_bram1[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[7]_INST_0 
       (.I0(addr_in[7]),
        .I1(bram_select),
        .O(addr_bram1[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[8]_INST_0 
       (.I0(addr_in[8]),
        .I1(bram_select),
        .O(addr_bram1[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr_bram1[9]_INST_0 
       (.I0(addr_in[9]),
        .I1(bram_select),
        .O(addr_bram1[9]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[0]_INST_0 
       (.I0(data_in[0]),
        .I1(bram_select),
        .O(data_bram1[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[10]_INST_0 
       (.I0(data_in[10]),
        .I1(bram_select),
        .O(data_bram1[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[11]_INST_0 
       (.I0(data_in[11]),
        .I1(bram_select),
        .O(data_bram1[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[1]_INST_0 
       (.I0(data_in[1]),
        .I1(bram_select),
        .O(data_bram1[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[2]_INST_0 
       (.I0(data_in[2]),
        .I1(bram_select),
        .O(data_bram1[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[3]_INST_0 
       (.I0(data_in[3]),
        .I1(bram_select),
        .O(data_bram1[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[4]_INST_0 
       (.I0(data_in[4]),
        .I1(bram_select),
        .O(data_bram1[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[5]_INST_0 
       (.I0(data_in[5]),
        .I1(bram_select),
        .O(data_bram1[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[6]_INST_0 
       (.I0(data_in[6]),
        .I1(bram_select),
        .O(data_bram1[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[7]_INST_0 
       (.I0(data_in[7]),
        .I1(bram_select),
        .O(data_bram1[7]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[8]_INST_0 
       (.I0(data_in[8]),
        .I1(bram_select),
        .O(data_bram1[8]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_bram1[9]_INST_0 
       (.I0(data_in[9]),
        .I1(bram_select),
        .O(data_bram1[9]));
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
