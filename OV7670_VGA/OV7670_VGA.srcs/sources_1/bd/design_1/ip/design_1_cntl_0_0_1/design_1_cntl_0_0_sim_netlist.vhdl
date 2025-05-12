-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May  8 18:36:44 2025
-- Host        : Ido running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/idowe/Projects/Digital-Zoom-FPGA/OV7670_VGA/OV7670_VGA.srcs/sources_1/bd/design_1/ip/design_1_cntl_0_0_1/design_1_cntl_0_0_sim_netlist.vhdl
-- Design      : design_1_cntl_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_cntl_0_0_cntl is
  port (
    resend_out : out STD_LOGIC;
    cntl_out : out STD_LOGIC;
    resend_in : in STD_LOGIC;
    clk : in STD_LOGIC;
    cntl_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_cntl_0_0_cntl : entity is "cntl";
end design_1_cntl_0_0_cntl;

architecture STRUCTURE of design_1_cntl_0_0_cntl is
begin
cntl_out_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => cntl_in,
      Q => cntl_out,
      R => '0'
    );
resend_out_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => resend_in,
      Q => resend_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_cntl_0_0 is
  port (
    clk : in STD_LOGIC;
    resend_in : in STD_LOGIC;
    cntl_in : in STD_LOGIC;
    resend_out : out STD_LOGIC;
    cntl_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_cntl_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_cntl_0_0 : entity is "design_1_cntl_0_0,cntl,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_cntl_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_cntl_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_cntl_0_0 : entity is "cntl,Vivado 2019.2";
end design_1_cntl_0_0;

architecture STRUCTURE of design_1_cntl_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_clk_in1, INSERT_VIP 0";
begin
U0: entity work.design_1_cntl_0_0_cntl
     port map (
      clk => clk,
      cntl_in => cntl_in,
      cntl_out => cntl_out,
      resend_in => resend_in,
      resend_out => resend_out
    );
end STRUCTURE;
