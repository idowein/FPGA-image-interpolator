--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Thu May  8 17:30:40 2025
--Host        : dvirhersh_comp running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    clkx3_0 : in STD_LOGIC;
    filed_enable_0 : in STD_LOGIC;
    line_enable_0 : in STD_LOGIC;
    line_sync_0 : in STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk_0 : in STD_LOGIC;
    filed_enable_0 : in STD_LOGIC;
    line_enable_0 : in STD_LOGIC;
    line_sync_0 : in STD_LOGIC;
    reset_0 : in STD_LOGIC;
    clkx3_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      clk_0 => clk_0,
      clkx3_0 => clkx3_0,
      filed_enable_0 => filed_enable_0,
      line_enable_0 => line_enable_0,
      line_sync_0 => line_sync_0,
      reset_0 => reset_0
    );
end STRUCTURE;
