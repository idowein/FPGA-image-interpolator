--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Thu May  8 17:30:24 2025
--Host        : dvirhersh_comp running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    clk_0 : in STD_LOGIC;
    clkx3_0 : in STD_LOGIC;
    filed_enable_0 : in STD_LOGIC;
    line_enable_0 : in STD_LOGIC;
    line_sync_0 : in STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_fpga_exp7_0_0 is
  port (
    clk : in STD_LOGIC;
    clkx3 : in STD_LOGIC;
    filed_enable : in STD_LOGIC;
    line_enable : in STD_LOGIC;
    line_sync : in STD_LOGIC;
    reset : in STD_LOGIC;
    PRE_cmos_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_fpga_exp7_0_0;
  component design_1_bh_write_file_0_0 is
  port (
    VIDEO_CLK : in STD_LOGIC;
    VIDEO_OUT_FIELD_ENABLE : in STD_LOGIC;
    VIDEO_OUT_LINE_ENABLE : in STD_LOGIC;
    VIDEO_OUT_LINE_SYNC : in STD_LOGIC;
    reset : in STD_LOGIC;
    EZOOM_DATA_OUTPUT : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_bh_write_file_0_0;
  component design_1_bili_0_0 is
  port (
    clk : in STD_LOGIC;
    RESET : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_bili_0_0;
  signal bili_0_data_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal clkx3_0_1 : STD_LOGIC;
  signal filed_enable_0_1 : STD_LOGIC;
  signal fpga_exp7_0_PRE_cmos_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal line_enable_0_1 : STD_LOGIC;
  signal line_sync_0_1 : STD_LOGIC;
  signal reset_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET reset_0, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_0 : signal is "xilinx.com:signal:reset:1.0 RST.RESET_0 RST";
  attribute X_INTERFACE_PARAMETER of reset_0 : signal is "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  clkx3_0_1 <= clkx3_0;
  filed_enable_0_1 <= filed_enable_0;
  line_enable_0_1 <= line_enable_0;
  line_sync_0_1 <= line_sync_0;
  reset_0_1 <= reset_0;
bh_write_file_0: component design_1_bh_write_file_0_0
     port map (
      EZOOM_DATA_OUTPUT(7 downto 0) => bili_0_data_out(7 downto 0),
      VIDEO_CLK => clk_0_1,
      VIDEO_OUT_FIELD_ENABLE => filed_enable_0_1,
      VIDEO_OUT_LINE_ENABLE => line_enable_0_1,
      VIDEO_OUT_LINE_SYNC => line_sync_0_1,
      reset => reset_0_1
    );
bili_0: component design_1_bili_0_0
     port map (
      RESET => reset_0_1,
      clk => clk_0_1,
      data_in(7 downto 0) => fpga_exp7_0_PRE_cmos_data(7 downto 0),
      data_out(7 downto 0) => bili_0_data_out(7 downto 0)
    );
fpga_exp7_0: component design_1_fpga_exp7_0_0
     port map (
      PRE_cmos_data(7 downto 0) => fpga_exp7_0_PRE_cmos_data(7 downto 0),
      clk => clk_0_1,
      clkx3 => clkx3_0_1,
      filed_enable => filed_enable_0_1,
      line_enable => line_enable_0_1,
      line_sync => line_sync_0_1,
      reset => reset_0_1
    );
end STRUCTURE;
