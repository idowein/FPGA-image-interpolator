// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Apr 28 18:09:07 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/idowe/myProjects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/ip/xbip_dsp48_macro_0/xbip_dsp48_macro_0_sim_netlist.v
// Design      : xbip_dsp48_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_0,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_0
   (CLK,
    SEL,
    A,
    B,
    D,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sel_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sel_intf, LAYERED_METADATA undef" *) input [1:0]SEL;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [24:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [42:0]P;

  wire [24:0]A;
  wire [17:0]B;
  wire CLK;
  wire [24:0]D;
  wire [42:0]P;
  wire [1:0]SEL;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "25" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "25" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "65" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100001001,000100100000010100000000,000100100000010100011001" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "42" *) 
  (* C_REG_CONFIG = "11010100000000000000000000000000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(D),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule

(* C_A_WIDTH = "25" *) (* C_B_WIDTH = "18" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "25" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "0" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "1" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "65" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000100100000010100001001,000100100000010100000000,000100100000010100011001" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "42" *) (* C_REG_CONFIG = "11010100000000000000000000000000" *) (* C_SEL_WIDTH = "2" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_17" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [1:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [24:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [42:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [24:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [17:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CARRYOUT;
  wire CLK;
  wire [24:0]D;
  wire [42:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire [1:0]SEL;

  (* C_A_WIDTH = "25" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "25" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "65" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100001001,000100100000010100000000,000100100000010100011001" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "42" *) 
  (* C_REG_CONFIG = "11010100000000000000000000000000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(D),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
o95kQsykeBnv/6RKTex/4MyOqp3EGnPFH/nv5raMenbKASm/6owCQp4giB3JGq3yU+Peuq4HmH2a
zCDpR2ue0Q==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VB9GXqz76JcxGkDIhWmf/Tvu6ktxli9qmz3kvoomNuowfSnKyyUf21nolwdhnVr1C2+5yMJGWxPZ
BLZG0iRJeqsy39qwM9osyuU+SIaK3ZNZlXHldcb5bqAcCuJ+kdyh182BY5RLREoDcjBSaH6et2y0
nHwnoYvMurbi5069L7o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xRZ06DbUma6Yw1PiSnZUG2PGjSadC3LNKsDhEzPo8eyEaE9nHgZw/3DDvJK29nvTv83gI0iUR83s
DsWaX9kx/1Ncn4XbmSdT8+ji+OZrf49Rig/ID8665qlNZBqow90+wIcAD4bOqRrXrA1K59qrwHvT
HjF7LoHC546/c3M96yI1UmGveOEfoOIgajP6XX7KY7mxUrsrAoYckHW83+iWbeBUCWMWQkQHuGlA
pkJa7gi2QS5qK1xo/K1KptSjNKWEcDFKsQLQ0NrqR8Wc3xWjV9RkH6EV4AAjqgx4aW1aiTi6aDCV
R//ORC0dbwb38TBnvY0dK2NwJ9AndoUpVf0ZFg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ctpu7OT3NYFV50M7g3X5OWgzfC+1lvHtpPPrHYvfD4BdZUOZtoWbRVMYSofIc3yuOpx1VVcEmRr/
TnKkV/uYIbG4TaOQ6J02lm6ilU0VHOky/Li1McDu0RZw0Ym3gBtycWQulvxZmJPkYKOdQkolKxS2
jt0O51yRobPY6/N1kQhzEZxou6hMzAUa4xc+wECnWdAy6L4Xa7QaVNQGQYFvi6pXqDdNwgODZGXV
5IthUoYOPE4oo8tmSbvgOpIx9hwhoF2s9j0YUqc9z5WDcrLuIl33wuxjH9d1akOqv6Jbd35TUycY
EQqcSWCRs1KWhT2dlakG8g64BkZHy8Jiv0tc+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KBrCiroMzB0+0nGnzcg92RWUMI8YS6FFqefgILdK30KYEgKgP8lepDeGmJjACZ9cZn7KH7Y56rOZ
3EGE6Ha7toC7ZtEIAJyZd6DO+Tkv/f42zt5Fq4pNzMIbgRDlzMjiEiEnIYrgwku58DE8qUIJ3B9W
2jOTjFiJcu/375a6hszX+ndN4lQcDcn3FIRME2BcbfHSYXv/KeBn/ikpyK99TnHjwjYNKfVU3f1s
8U1dtN43mHPq1V/p7H2k4VgNO66O2TAxqrQLk7ET+p4au9Q8p9kGatxXPKHX45+4TZ+IvLas4jOs
5tUxRs9+HyKayPE8oEuQNe70m5jjSzYyt8AtuQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ljpgiVbqME/DDt2YubRDsiAaUvvd0luRm1Kyn0zXi5Oi5H+daHLhjdtMKs7UXT4hOyMtBPXvIHzO
r3gvIW1qQXCE9n01v8P7aUKDZWCDsuc8k1+1gf6LDZ6q1vDWNFnrEp12ZZOMWzKLj8BUfqSDayNa
cjbp1Qs1t9jdv8TVPvI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Df6Zc2J6DGn8PimsfKk8mQ+cpGIR1yrpcw5QseDEQJ4mE8uqo8cLRqffFGcLqTX/B1Vnkh1zy8xG
q2t9DwcdlrbPZvTj6RWyWp3oTBVBqAAriOEphkMP775Jrl1gYe/XFWYC8bce89oTVSt9VI8dqzVe
DMMbb0kX66Rabi08xQhUh9Jpf8v6we/rN6jUKKJDGvZaK3mRBx7yzs6QFFk/kzUVNg0OGyiWqITi
+ku5Dvvn4QhDeP6hu9E6Qjw0Q7i23BjvONLiQ5H9kbefLDIA8CwOsmjZ4gggEIYYgBpAIP0Fbt2j
o+kGZlTAq7P7yrZGTKNPS0BKI+JsCX8NJ0OWHg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dq7KDgd134IyGuCX1+RhFxXxAPr9vqLex10Nngq3feVDBCLFxJ/JXYEh7jTmUBXZQOdASytF08EH
SO+w1Is1cxQsti/FmNiauEPgjoRq5wsqNMWbCm4flZRONPn8J2PeWlbgolgFaQQEQVS4CCq7CsKj
/rDM/jgVtgnKCkbabtq/ivobGvVa/xOG7V3VkW7ouxzozBspI437g30tRNux4+AQ+Fn8AnBkcA2y
E06hXTFA/DYA5ZKTk1R7S5JbEOyKubRtpN0R9MTQdnZzwCLnNOO3Ew75HG+cqMmieZYwjdlN4Dwl
VUaDYFkm15DHeBfjYc+2SQhYtTsm2W/5dS4XpA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QfB1aMyjuNMog6Pex/SmSGAm7f/q3fgbPyCPS20gQyLCh4D+md9SprJiUOlqq1HjW/yBXD2cBsjs
JSApW9zxnUrF5Z+JUlhBoo+sgzMfUA7aT0yQKLgGnC3+3GamYwE65lLFxDQMlnMo6dGiJtWcpcBJ
Zj/CP/VBtSffszX7310049Rkgt68tbIusIt0896HmnUfLQOYc5+2bkzdQRM3ZvSg4GIBOVYkSQnQ
20BoVpkRsVQmOqwYv7VixOJ1BVCJBz3h2P5Rp6VtvlE39rTt9tE2DrinZs8RqbuCKCHixkav2l+j
cYfD3fltEMqT8SJYM8kk80MdfLnHjkfWc18sCA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JrncEzsjQ2svInoyUHcwEQdCyMLL/iXncYe1PrmrGVTA09/oq2/kKqzjVKrMOzB7wDnj66s0S5zJ
ydwJF98Q9KgnrLJGkG11CLW9ECVs/FxzNFW1go6b3NJfX/LkqKPylMjmoxcyaB6jlh91SgEgf+wF
Ho3skCHYZnQZtbmX5D97UUbw+lD9jd3nWBx4CwT8BvtDDfX6mY78rtgEnm3MzpHzHTsPjCtgnJMD
GFoQDxEWQHgGL/gFPYPQ+JQIXePtdo6+xOVSVHu9cRhYfrY+vZ6DduWvVquQe/IYqQjmunCMklg9
tON4aw4EHby4sc98j7eJbXerOXiXebXGcDiZyw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31856)
`pragma protect data_block
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
`pragma protect end_protected
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
