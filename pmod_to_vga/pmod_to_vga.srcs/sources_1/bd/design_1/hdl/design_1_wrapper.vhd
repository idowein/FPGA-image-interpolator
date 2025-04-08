--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Tue Apr  8 12:43:20 2025
--Host        : Ido running 64-bit major release  (build 9200)
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
    camera_h_ref : in STD_LOGIC;
    camera_v_sync : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    cntl_in : in STD_LOGIC;
    config_finished : out STD_LOGIC;
    din_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pclk : in STD_LOGIC;
    pwdn : out STD_LOGIC;
    resend_in : in STD_LOGIC;
    reset : out STD_LOGIC;
    reset_0 : in STD_LOGIC;
    sioc : out STD_LOGIC;
    siod : inout STD_LOGIC;
    xclk : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    camera_h_ref : in STD_LOGIC;
    pclk : in STD_LOGIC;
    camera_v_sync : in STD_LOGIC;
    din_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    resend_in : in STD_LOGIC;
    cntl_in : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    sioc : out STD_LOGIC;
    config_finished : out STD_LOGIC;
    reset : out STD_LOGIC;
    siod : inout STD_LOGIC;
    pwdn : out STD_LOGIC;
    xclk : out STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      camera_h_ref => camera_h_ref,
      camera_v_sync => camera_v_sync,
      clk_in1 => clk_in1,
      cntl_in => cntl_in,
      config_finished => config_finished,
      din_0(7 downto 0) => din_0(7 downto 0),
      pclk => pclk,
      pwdn => pwdn,
      resend_in => resend_in,
      reset => reset,
      reset_0 => reset_0,
      sioc => sioc,
      siod => siod,
      xclk => xclk
    );
end STRUCTURE;
