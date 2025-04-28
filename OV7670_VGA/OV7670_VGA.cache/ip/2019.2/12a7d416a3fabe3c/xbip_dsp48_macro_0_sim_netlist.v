// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Apr 28 18:09:07 2025
// Host        : Ido running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xbip_dsp48_macro_0_sim_netlist.v
// Design      : xbip_dsp48_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_0,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17 U0
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
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17_viv i_synth
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
pNJSPg6a9AXw2YnhzBzPIC12v74aE5achNqOGm9/wFRudAJXtjEZSwxxgVNFh3ZfEsBTBhGxAP1B
ChqgLmqpTGkBpI1T1XJbV139adeKyNL3/LKmCtiKDxQBVDZTCEluTMRNiYqe8jabluM1YGXRKns0
RjylsOioEudBuaHRCsj+tPL3iHHj5Fw9HayNAoEXxkh3QFgDHaIaRDqKE7i/ZP70LXSqcDSIYExE
x0ZFdNRqFFH0gkpEPlpLRtUvvXaFhCRSHJ9IcvM9/C2fNJyyIIGZ2jGs8t+5IoBzSdIfxPBvoaha
AX/gu7IhYjzQNDM1upqnXpmG5aFGtiCQYcM/6Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MJNj7ceMy1aVrbFnRxrnYs1RhRlXs2OJ7dWtWJtfS6SfwYjM71l0QgqPGJUj2GYNSYU8MZ1AeF4x
8Gvn3LHhLItDCSwYzRWoox6wK5dr7HdkfZHjp1XGuJ/J/CBwiaBLjUM3qroj+Q9fdY6m3kzMOo1K
H3Oo5z6K8F/bKGrrV4xnEtBOYWKDogqcjITrhGAaRUEiLbhRKmRLtK1yxlXOUrxaNP3xGPob8p+1
0mzMB5BfJUtZh/tiBUOYyWiVoMRe1rSvqi1Hd2z9NUXP4LrNvCexdqjeBlXJ9E8gzOavFYLff4sX
00U8XeQr1olQf3xWZCY+xnyfJHs8iGzi2ZFDdg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32000)
`pragma protect data_block
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
4Q7+VOwuxRdf4agDCsnX45+JBEDU6nk=
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
